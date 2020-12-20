------------------------------------------------------------------------------
--                                                                          --
--                        Copyright (C) 2020, AdaCore                       --
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

package SAM.EIC is

   type EXTINT_Pin is range 0 .. 15;

   type EIC_Clock is (GCLK_EIC, CLK_ULP32K);

   function EIC_Enabled return Boolean;

   procedure Enable_EIC (Clock : EIC_Clock)
     with Post => EIC_Enabled;

   type Sense_Kind is (None, Rise, Fall, Both, High, Low);

   procedure Configure (Pin              : EXTINT_Pin;
                        Sense            : Sense_Kind;
                        Enable_Interrupt : Boolean;
                        Debouncer        : Boolean;
                        Event_Output     : Boolean := False)
     with Pre => not EIC_Enabled;

   function Pin_State (Pin : EXTINT_Pin) return Boolean;

   procedure Enable_Interrupt (Pin : EXTINT_Pin);
   procedure Disable_Interrupt (Pin : EXTINT_Pin);
   procedure Clear_Interrupt (Pin : EXTINT_Pin);

   function Interrupt_State (Pin : EXTINT_Pin) return Boolean;

   --  NOT IMPLEMENTED
   --  type Debouncer_Clock is (GCLK_EIC, Low_Frequency_Clock);
   --  type Debounder_Sample_Nb is (Debouncer_3_Samples,
   --                               Debouncer_7_Samples);
   --  procedure Configure_Debouncer (Clock : Debouncer_Clock;
   --                                 Sample_0 : Debounder_Sample_Nb;
   --                                 Prescaler_0 : UInt3;
   --                                 Sample_1 : Debounder_Sample_Nb;
   --                                 Prescaler_1 : UInt3);
   --
private
   for Sense_Kind use (None => 0,
                       Rise => 1,
                       Fall => 2,
                       Both => 3,
                       High => 4,
                       Low  => 5);

end SAM.EIC;
