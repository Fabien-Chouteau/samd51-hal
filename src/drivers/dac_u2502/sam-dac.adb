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

with SAM_SVD.DAC; use SAM_SVD.DAC;

package body SAM.DAC is

   -------------
   -- Enabled --
   -------------

   function Enabled return Boolean is
   begin
      return DAC_Periph.CTRLA.ENABLE;
   end Enabled;

   ---------------
   -- Configure --
   ---------------

   procedure Configure (Mode : Mode_Kind; Vref : Reference_Volage) is
   begin
      DAC_Periph.CTRLA.SWRST := True;

      --  Wait for synchro
      while DAC_Periph.SYNCBUSY.SWRST loop
         null;
      end loop;

      DAC_Periph.CTRLB :=
        (DIFF   => Mode = Differential_Mode,
         REFSEL => CTRLB_REFSELSelect'Enum_Val (Vref'Enum_Rep),
         others => <>);
   end Configure;

   -----------------------
   -- Configure_Channel --
   -----------------------

   procedure Configure_Channel
     (Chan                           : Channel_ID;
      Oversampling                   : Oversampling_Ratio;
      Refresh                        : Refresh_Period;
      Enable_Dithering               : Boolean;
      Run_In_Standby                 : Boolean;
      Standalone_Filter              : Boolean;
      Current                        : Current_Control;
      Adjustement                    : Data_Adjustment;
      Enable_Filter_Result_Ready_Evt : Boolean;
      Enable_Data_Buffer_Empty_Evt   : Boolean;
      Enable_Convert_On_Input_Evt    : Boolean;
      Invert_Input_Evt               : Boolean;
      Enable_Overrun_Int             : Boolean;
      Enable_Underrun_Int            : Boolean;
      Enable_Result_Ready_Int        : Boolean;
      Enable_Buffer_Empty_Int        : Boolean)
   is
      CTRL : DAC_DACCTRL_Register := DAC_Periph.DACCTRL (Integer (Chan));
   begin

      -- Control --

      CTRL.LEFTADJ := Adjustement = Left_Adjusted;
      CTRL.CCTRL := DACCTRL_CCTRLSelect'Enum_Val (Current'Enum_Rep);
      CTRL.FEXT := Standalone_Filter;
      CTRL.RUNSTDBY := Run_In_Standby;
      CTRL.DITHER := Enable_Dithering;
      CTRL.REFRESH := DAC_DACCTRL_REFRESH_Field (Refresh);
      CTRL.OSR := DAC_DACCTRL_OSR_Field (Oversampling'Enum_Rep);
      DAC_Periph.DACCTRL (Integer (Chan)) := CTRL;

      -- Events --

      DAC_Periph.EVCTRL.INVEI.Arr (Integer (Chan)) := Invert_Input_Evt;
      DAC_Periph.EVCTRL.EMPTYEO.Arr (Integer (Chan)) := Enable_Data_Buffer_Empty_Evt;
      DAC_Periph.EVCTRL.STARTEI.Arr (Integer (Chan)) := Enable_Convert_On_Input_Evt;
      DAC_Periph.EVCTRL.RESRDYEO.Arr (Integer (Chan)) := Enable_Filter_Result_Ready_Evt;

      -- Interrupts --

      if Enable_Overrun_Int then
         DAC_Periph.INTENSET.OVERRUN.Arr (Integer (Chan)) := True;
      else
         DAC_Periph.INTENSET.OVERRUN.Arr (Integer (Chan)) := True;
      end if;

      if Enable_Result_Ready_Int then
         DAC_Periph.INTENSET.RESRDY.Arr (Integer (Chan)) := True;
      else
         DAC_Periph.INTENSET.RESRDY.Arr (Integer (Chan)) := True;
      end if;

      if Enable_Underrun_Int then
         DAC_Periph.INTENSET.UNDERRUN.Arr (Integer (Chan)) := True;
      else
         DAC_Periph.INTENSET.UNDERRUN.Arr (Integer (Chan)) := True;
      end if;

      if Enable_Buffer_Empty_Int then
         DAC_Periph.INTENSET.EMPTY.Arr (Integer (Chan)) := True;
      else
         DAC_Periph.INTENSET.EMPTY.Arr (Integer (Chan)) := True;
      end if;


   end Configure_Channel;

   ------------
   -- Enable --
   ------------

   procedure Enable (Chan_0 : Boolean; Chan_1 : Boolean) is
   begin
      if Enabled then
         DAC_Periph.CTRLA.ENABLE := False;

         --  Wait for sync
         while DAC_Periph.SYNCBUSY.ENABLE loop
            null;
         end loop;
      end if;

      DAC_Periph.DACCTRL (0).ENABLE := Chan_0;
      DAC_Periph.DACCTRL (1).ENABLE := Chan_1;

      if Chan_1 or else Chan_1 then
         DAC_Periph.CTRLA.ENABLE := True;

         --  Wait for sync
         while DAC_Periph.SYNCBUSY.ENABLE loop
            null;
         end loop;
      end if;
   end Enable;

   -----------
   -- Write --
   -----------

   procedure Write (Chan : Channel_ID; Data : HAL.UInt16) is
   begin
      DAC_Periph.DATA (Integer (Chan)) := Data;
   end Write;

   ------------------
   -- Write_Buffer --
   ------------------

   procedure Write_Buffer (Chan : Channel_ID; Data : HAL.UInt16) is
   begin
      DAC_Periph.DATABUF (Integer (Chan)) := Data;
   end Write_Buffer;

   ------------
   -- Result --
   ------------

   function Result (Chan : Channel_ID) return HAL.UInt16 is
   begin
      return DAC_Periph.RESULT (Integer (Chan));
   end Result;

   ------------------
   -- Data_Address --
   ------------------

   function Data_Address (Chan : Channel_ID) return System.Address is
   begin
      return DAC_Periph.DATA (Integer (Chan))'Address;
   end Data_Address;

   ---------------------
   -- Debug_Stop_Mode --
   ---------------------

   procedure Debug_Stop_Mode (Enabled : Boolean := True) is
   begin
      DAC_Periph.DBGCTRL.DBGRUN := not Enabled;
   end Debug_Stop_Mode;

end SAM.DAC;
