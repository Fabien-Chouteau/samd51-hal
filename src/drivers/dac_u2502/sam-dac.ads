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

with System;

package SAM.DAC is

   function Enabled return Boolean;
   --  return True if the DAC is enabled

   type Reference_Volage is (VREFAU,  -- Unbuffered external voltage reference
                             VDDANA,  -- Voltage supply
                             VREFAB,  -- Buffered external voltage reference
                             INTREF); -- Internal bandgap reference

   type Mode_Kind is (Single_Mode, Differential_Mode);

   procedure Configure (Mode : Mode_Kind;
                        Vref : Reference_Volage)
     with Pre => not Enabled;

   type Channel_ID is range 0 .. 1;

   type Oversampling_Ratio is (OSR_1, OSR_2, OSR_4, OSR_8, OSR_16, OSR_32);

   type Refresh_Period is new HAL.UInt4;

   type Current_Control is (CC100K, CC1M, CC12M);

   type Data_Adjustment is (Right_Adjusted, Left_Adjusted);

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
     with Pre => not Enabled;

   procedure Enable (Chan_0 : Boolean; Chan_1 : Boolean)
     with Post => (if Chan_0 or else Chan_1 then Enabled);

   procedure Write (Chan : Channel_ID; Data : HAL.UInt16);
   procedure Write_Buffer (Chan : Channel_ID; Data : HAL.UInt16);

   function Result (Chan : Channel_ID) return HAL.UInt16;

   function Data_Address (Chan : Channel_ID) return System.Address;
   --  For DMA transfers

   procedure Debug_Stop_Mode (Enabled : Boolean := True);
   --  Stop the device when the CPU is halted by an external debugger.
   --  This mode is enabled by default.

private

   for Reference_Volage use (VREFAU => 0,
                             VDDANA => 1,
                             VREFAB => 2,
                             INTREF => 3);

   for Oversampling_Ratio use (OSR_1  => 0,
                               OSR_2  => 1,
                               OSR_4  => 2,
                               OSR_8  => 3,
                               OSR_16 => 4,
                               OSR_32 => 5);

   for Current_Control use (CC100K => 0,
                            CC1M   => 1,
                            CC12M  => 2);

end SAM.DAC;
