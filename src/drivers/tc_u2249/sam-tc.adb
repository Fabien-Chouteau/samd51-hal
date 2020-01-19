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

with SAM_SVD.TC; use SAM_SVD.TC;

package body SAM.TC is

   ---------------
   -- Configure --
   ---------------

   procedure Configure
     (This                 : in out TC_Device;
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
   is
      CTRLA : TC_CTRLA_TC_COUNT8_Register;
   begin
      This.Periph.TC_COUNT8.CTRLA.ENABLE := False;

      --  Wait for sync
      while This.Periph.TC_COUNT8.SYNCBUSY.ENABLE loop
         null;
      end loop;

      This.Periph.TC_COUNT8.CTRLA.SWRST := True;

      --  Wait for sync
      while This.Periph.TC_COUNT8.SYNCBUSY.SWRST loop
         null;
      end loop;

      CTRLA := This.Periph.TC_COUNT8.CTRLA;

      CTRLA.MODE := CTRLA_MODESelect'Enum_Val (Mode'Enum_Rep);
      CTRLA.RUNSTDBY := Run_In_Standby;
      CTRLA.ONDEMAND := Clock_On_Demand;
      CTRLA.PRESCALER := CTRLA_PRESCALERSelect'Enum_Val (Prescaler'Enum_Rep);
      CTRLA.ALOCK := Auto_Lock;
      CTRLA.CAPTEN.Arr (0) := Capture_0_Enable;
      CTRLA.CAPTEN.Arr (1) := Capture_1_Enable;
      CTRLA.COPEN.Arr (0) := Capture_0_On_Pin;
      CTRLA.COPEN.Arr (1) := Capture_1_On_Pin;
      CTRLA.CAPTMODE0 := CTRLA_CAPTMODE0Select'Enum_Val (Capture_0_Mode'Enum_Rep);
      CTRLA.CAPTMODE1 := CTRLA_CAPTMODE1Select'Enum_Val (Capture_1_Mode'Enum_Rep);

      This.Periph.TC_COUNT8.CTRLA := CTRLA;
   end Configure;

   ----------
   -- Mode --
   ----------

   function Mode (This : TC_Device) return Mode_Kind is
   begin
      return Mode_Kind'Enum_Val (This.Periph.TC_COUNT8.CTRLA.MODE'Enum_Rep);
   end Mode;

   ------------
   -- Enable --
   ------------

   procedure Enable (This : in out TC_Device) is
   begin
      This.Periph.TC_COUNT8.CTRLA.ENABLE := True;

      --  Wait for sync
      while This.Periph.TC_COUNT8.SYNCBUSY.ENABLE loop
         null;
      end loop;
   end Enable;

   ----------------
   -- Set_Period --
   ----------------

   procedure Set_Period (This : in out TC_Device; Period : HAL.UInt8) is
   begin
      This.Periph.TC_COUNT8.PER := Period;
   end Set_Period;

   -------------
   -- Counter --
   -------------

   function Counter (This : TC_Device) return HAL.UInt32 is
   begin
      return This.Periph.TC_COUNT32.COUNT;
   end Counter;

end SAM.TC;
