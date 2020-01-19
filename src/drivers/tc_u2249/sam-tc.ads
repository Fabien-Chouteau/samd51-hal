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

private with SAM_SVD.TC;

package SAM.TC is

   type TC_Internal is private;

   type TC_Device
     (Periph : not null access TC_Internal;
      Master : Boolean)
   is tagged private;

   type Mode_Kind is (TC_16bit, TC_8bit, TC_32bit);
   type Prescaler_Kind is (DIV1, DIV2, DIV4, DIV8, DIV16,
                           DIV64, DIV256, DIV1024);
   type Capture_Kind is (Default, Capture_Min, Capture_Max);

   procedure Configure (This                 : in out TC_Device;
                        Mode                 :        Mode_Kind;
                        Prescaler            :        Prescaler_Kind;
                        Run_In_Standby       :        Boolean;
                        Clock_On_Demand      :        Boolean;
                        Auto_Lock            :        Boolean;
                        Capture_0_Enable     :        Boolean;
                        Capture_1_Enable     :        Boolean;
                        Capture_0_On_Pin     :        Boolean;
                        Capture_1_On_Pin     :        Boolean;
                        Capture_0_Mode       :        Capture_Kind;
                        Capture_1_Mode       :        Capture_Kind)
     with Pre => (if not This.Master then Mode /= TC_32bit);

   function Mode (This : TC_Device) return Mode_Kind;

   procedure Enable (This : in out TC_Device);

   procedure Set_Period (This   : in out TC_Device;
                         Period :        HAL.UInt8)
     with Pre => This.Mode = TC_8bit;

   function Counter (This : TC_Device) return HAL.UInt32;

private

   type TC_Internal is new SAM_SVD.TC.TC_Peripheral;

   type TC_Device
     (Periph : not null access TC_Internal;
      Master : Boolean)
   is tagged null record;

   for Mode_Kind use (TC_16bit => 0,
                      TC_8bit  => 1,
                      TC_32bit => 2);

   for Prescaler_Kind use
     (DIV1 => 0,
      DIV2 => 1,
      DIV4 => 2,
      DIV8 => 3,
      DIV16 => 4,
      DIV64 => 5,
      DIV256 => 6,
      Div1024 => 7);

   for Capture_Kind use
     (Default     => 0,
      Capture_Min => 1,
      Capture_Max => 2);

end SAM.TC;
