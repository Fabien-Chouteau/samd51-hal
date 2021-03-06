------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2019-2020, AdaCore                     --
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

with HAL; use HAL;

with SAM_SVD.ADC; use SAM_SVD.ADC;

package body SAM.ADC is

   ---------------
   -- Configure --
   ---------------

   procedure Configure
     (This                          : in out ADC_Device;
      Resolution                    : Conversion_Resolution;
      Reference                     : Reference_Kind;
      Prescaler                     : Prescaler_Kind;
      Free_Running                  : Boolean;
      Differential_Mode             : Boolean;
      Window_Monitor_Event_Out      : Boolean := False;
      Result_Ready_Event_Out        : Boolean := False;
      Start_Conversion_Event_Invert : Boolean := False;
      Flush_Event_Invert            : Boolean := False;
      Start_Conversion_Event_Input  : Boolean := False;
      Flush_Event_Input             : Boolean := False)
   is
   begin
      This.Periph.CTRLA.SWRST := True;

      while This.Periph.SYNCBUSY.SWRST loop
         null;
      end loop;

      This.Periph.CTRLB :=
        (FREERUN => Free_Running,
         RESSEL  => CTRLB_RESSELSelect'Enum_Val (Resolution'Enum_Rep),
         others  => <>);

      while This.Periph.SYNCBUSY.CTRLB loop
         null;
      end loop;

      This.Periph.REFCTRL :=
        (REFSEL  => REFCTRL_REFSELSelect'Enum_Val (Reference'Enum_Rep),
         REFCOMP => False,
         others  => <>);

      This.Periph.CTRLA.PRESCALER :=
        CTRLA_PRESCALERSelect'Enum_Val (Prescaler'Enum_Rep);

      This.Periph.INPUTCTRL.DIFFMODE := Differential_Mode;

      This.Periph.EVCTRL :=
        (FLUSHEI  => Flush_Event_Input,
         STARTEI  => Start_Conversion_Event_Input,
         FLUSHINV => Flush_Event_Invert,
         STARTINV => Start_Conversion_Event_Invert,
         RESRDYEO => Result_Ready_Event_Out,
         WINMONEO => Window_Monitor_Event_Out,
         others => <>);

   end Configure;

   ------------
   -- Enable --
   ------------

   procedure Enable (This : in out ADC_Device) is
   begin
      This.Periph.CTRLA.ENABLE := True;

      while This.Periph.SYNCBUSY.ENABLE loop
         null;
      end loop;
   end Enable;

   -------------
   -- Disable --
   -------------

   procedure Disable (This : in out ADC_Device) is
   begin
      This.Periph.CTRLA.ENABLE := False;
   end Disable;

   ----------------
   -- Set_Inputs --
   ----------------

   procedure Set_Inputs
     (This     : in out ADC_Device;
      Negative : Negative_Selection;
      Positive : Positive_Selection)
   is
      INPUTCTRL : ADC_INPUTCTRL_Register := This.Periph.INPUTCTRL;
   begin
      INPUTCTRL.MUXNEG :=
        INPUTCTRL_MUXNEGSelect'Enum_Val (Negative'Enum_Rep);
      INPUTCTRL.MUXPOS :=
        INPUTCTRL_MUXPOSSelect'Enum_Val (Positive'Enum_Rep);

      This.Periph.INPUTCTRL := INPUTCTRL;

      while This.Periph.SYNCBUSY.INPUTCTRL loop
         null;
      end loop;

   end Set_Inputs;

   --------------------
   -- Software_Start --
   --------------------

   procedure Software_Start (This : in out ADC_Device) is
   begin
      This.Periph.SWTRIG.START := True;

      while This.Periph.SYNCBUSY.SWTRIG loop
         null;
      end loop;
   end Software_Start;

   ---------------------
   -- Conversion_Done --
   ---------------------

   function Conversion_Done (This : in out ADC_Device) return Boolean is
   begin
      return This.Periph.INTFLAG.RESRDY;
   end Conversion_Done;

   ------------
   -- Result --
   ------------

   function Result (This : in out ADC_Device) return HAL.UInt16 is
   begin
      return This.Periph.RESULT;
   end Result;

   --------------------
   -- Result_Address --
   --------------------

   function Result_Address (This : ADC_Device) return System.Address is
   begin
      return This.Periph.RESULT'Address;
   end Result_Address;

end SAM.ADC;
