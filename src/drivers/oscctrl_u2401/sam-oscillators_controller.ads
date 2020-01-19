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

with HAL;

package SAM.Oscillators_Controller is

   type DFLL_Operating_Mode is (Open_Loop_Mode, Closed_Loop_Mode);

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
      Multiply_Factor       : HAL.UInt16);
   --  See the reference manual of your device for more information on the
   --  configuration of DFLL.

   type DPLL_Reference_Clock is (GCLK_Ref, XOSC32K_Ref, XOSC0_Ref, XOSC1_Ref);

   type DPLL_Lock_Time is
     (
      Default,    -- No time-out. Automatic lock
      Lock_800Us, -- Time-out if no lock within 800us
      Lock_900Us, -- Time-out if no lock within 900us
      Lock_1Ms,   -- Time-out if no lock within 1ms
      Lock_1P1Ms) -- Time-out if no lock within 1.1ms
     with Size => 3;

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
      Prop_Integral_Filter    : HAL.UInt4);
   --  See the reference manual of your device for more information on the
   --  configuration of DPLLs.

private
   for DPLL_Lock_Time use
     (Default    => 0,
      Lock_800Us => 4,
      Lock_900Us => 5,
      Lock_1Ms   => 6,
      Lock_1P1Ms => 7);
end SAM.Oscillators_Controller;
