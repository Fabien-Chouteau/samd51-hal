------------------------------------------------------------------------------
--                                                                          --
--                        Copyright (C) 2019, AdaCore                       --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with SAM_SVD.OSCCTRL; use SAM_SVD.OSCCTRL;

package body SAM.Oscillators_Controller is

   --------------------
   -- Configure_DFLL --
   --------------------

   procedure Configure_DFLL
     (On_Demand_Control     : Boolean;
      Run_On_Standby        : Boolean;
      USB_Clock_Recovery    : Boolean;
      Wait_Lock             : Boolean;
      Bypass_Coarse_Lock    : Boolean;
      Quick_Lock_Disable    : Boolean;
      Chill_Cycle_Disable   : Boolean;
      Lose_Lock_After_Wake  : Boolean;
      Stable_DFLL_Frequency : Boolean;
      Operating_Mode        : DFLL_Operating_Mode;
      Coarse_Maximum_Step   : HAL.UInt6;
      Fine_Maximum_Step     : HAL.UInt8;
      Multiply_Factor       : HAL.UInt16)
   is
      Tmp : OSCCTRL_DFLLVAL_Register with Volatile;
   begin
      --  Disable DFLL
      OSCCTRL_Periph.DFLLCTRLA := (ENABLE   => False,
                                   RUNSTDBY => False,
                                   ONDEMAND => False,
                                   others   => <>);

      --  Set MUL and wait sync
      OSCCTRL_Periph.DFLLMUL := (MUL    => Multiply_Factor,
                                 FSTEP  => Fine_Maximum_Step,
                                 CSTEP  => Coarse_Maximum_Step,
                                 others => <>);
      while OSCCTRL_Periph.DFLLSYNC.DFLLMUL loop
         null;
      end loop;

      --  Reset CTRLB register and wait sync
      OSCCTRL_Periph.DFLLCTRLB := (others => False);
      while OSCCTRL_Periph.DFLLSYNC.DFLLCTRLB loop
         null;
      end loop;

      --  Enable and wait sync
      OSCCTRL_Periph.DFLLCTRLA := (ENABLE   => True,
                                   RUNSTDBY => Run_On_Standby,
                                   ONDEMAND => False,
                                   others   => <>);

      while OSCCTRL_Periph.DFLLSYNC.ENABLE loop
         null;
      end loop;

      --  Use the calibration after reset values
      Tmp := OSCCTRL_Periph.DFLLVAL;
      OSCCTRL_Periph.DFLLVAL := Tmp;

      --  Set CTRLB values and wait sync
      OSCCTRL_Periph.DFLLCTRLB :=
        (MODE     => (case Operating_Mode is
                         when Open_Loop_Mode   => False,
                         when Closed_Loop_Mode => True),
         STABLE   => Stable_DFLL_Frequency,
         LLAW     => Lose_Lock_After_Wake,
         USBCRM   => USB_Clock_Recovery,
         CCDIS    => Chill_Cycle_Disable,
         QLDIS    => Quick_Lock_Disable,
         BPLCKC   => Bypass_Coarse_Lock,
         WAITLOCK => Wait_Lock);
      while OSCCTRL_Periph.DFLLSYNC.DFLLCTRLB loop
         null;
      end loop;

      --  Wait for DFLL ready signal
      case Operating_Mode is
         when Closed_Loop_Mode =>
            while not OSCCTRL_Periph.STATUS.DFLLRDY
              and then
                not OSCCTRL_Periph.STATUS.DFLLLCKC
            loop
               null;
            end loop;

         when Open_Loop_Mode =>
            while not OSCCTRL_Periph.STATUS.DFLLRDY loop
               null;
            end loop;
      end case;

      --  Set On demand config if necessary
      if On_Demand_Control then
         OSCCTRL_Periph.DFLLCTRLA.ONDEMAND := True;
      end if;
   end Configure_DFLL;

   -------------------------
   -- Configure_DPLL_GCLK --
   -------------------------

   procedure Configure_DPLL
     (DPLL                    : HAL.Bit;
      On_Demand_Control       : Boolean;
      Run_On_Standby          : Boolean;
      Loop_Divider_Fractional : HAL.UInt5;
      Loop_Divider_Integer    : HAL.UInt13;
      Clock_Divider           : HAL.UInt11;
      DCO_Filter_Enable       : Boolean;
      Sigma_Delta_DCO_Filter  : HAL.UInt3;
      Lock_Bypass             : Boolean;
      Lock_Time               : DPLL_Lock_Time;
      Reference_Clock         : DPLL_Reference_Clock;
      Wakeup_Fast             : Boolean;
      Prop_Integral_Filter    : HAL.UInt4)
   is
      RATIO : constant DPLLRATIO_Register :=
        (LDR     => Loop_Divider_Integer,
         LDRFRAC => Loop_Divider_Fractional,
         others  => <>);

      CTRLB : constant DPLLCTRLB_Register :=
        (FILTER    => Prop_Integral_Filter,
         WUF       => Wakeup_Fast,
         REFCLK    => (case Reference_Clock is
                          when GCLK_Ref    => Gclk,
                          when XOSC32K_Ref => Xosc32,
                          when XOSC0_Ref   => Xosc0,
                          when XOSC1_Ref   => Xosc1),
         LTIME     => DPLLCTRLB0_LTIMESelect'Enum_Val (Lock_Time'Enum_Rep),
         LBYPASS   => Lock_Bypass,
         DCOFILTER => Sigma_Delta_DCO_Filter,
         DCOEN     => DCO_Filter_Enable,
         DIV       => Clock_Divider,
         others    => <>);

      CTRLA : constant DPLLCTRLA_Register :=
        (ENABLE   => True,
         RUNSTDBY => Run_On_Standby,
         ONDEMAND => False,
         others   => <>);
   begin
      case DPLL is

         when 0 =>
            OSCCTRL_Periph.DPLLRATIO0 := RATIO;
            OSCCTRL_Periph.DPLLCTRLB0 := CTRLB;
            OSCCTRL_Periph.DPLLCTRLA0 := CTRLA;

            while not OSCCTRL_Periph.DPLLSTATUS0.LOCK
              and then
                not OSCCTRL_Periph.DPLLSTATUS0.CLKRDY
            loop
               null;
            end loop;

            if On_Demand_Control then
               OSCCTRL_Periph.DPLLCTRLA0.ONDEMAND := True;
            end if;

         when 1 =>
            OSCCTRL_Periph.DPLLRATIO1 := RATIO;
            OSCCTRL_Periph.DPLLCTRLB1 := CTRLB;
            OSCCTRL_Periph.DPLLCTRLA1 := CTRLA;

            while not OSCCTRL_Periph.DPLLSTATUS1.LOCK
              and then
                not OSCCTRL_Periph.DPLLSTATUS1.CLKRDY
            loop
               null;
            end loop;

            if On_Demand_Control then
               OSCCTRL_Periph.DPLLCTRLA1.ONDEMAND := True;
            end if;

      end case;
   end Configure_DPLL;

end SAM.Oscillators_Controller;
