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

with HAL; use HAL;
with SAM_SVD.EIC; use SAM_SVD.EIC;

package body SAM.EIC is

   -----------------
   -- EIC_Enabled --
   -----------------

   function EIC_Enabled return Boolean
   is (EIC_Periph.CTRLA.ENABLE);

   ----------------
   -- Enable_EIC --
   ----------------

   procedure Enable_EIC (Clock : EIC_Clock) is
   begin
      EIC_Periph.CTRLA.CKSEL :=
        CTRLA_CKSELSelect'Enum_Val (if Clock = CLK_ULP32K then 1 else 0);
      EIC_Periph.CTRLA.ENABLE := True;

      while EIC_Periph.SYNCBUSY.ENABLE loop
         null;
      end loop;
   end Enable_EIC;

   ---------------
   -- Configure --
   ---------------

   procedure Configure
     (Pin              : EXTINT_Pin;
      Sense            : Sense_Kind;
      Enable_Interrupt : Boolean;
      Debouncer        : Boolean;
      Event_Output     : Boolean := False)
   is
      CFG_Reg : constant Natural := (if Pin < 8 then 0 else 1);
      CFG_Index : constant Natural := Natural (Pin) mod 8;
      Pin_Mask : constant UInt16 := UInt16 (2 ** Natural (Pin));
   begin
      case CFG_Index is
         when 0 =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE0 :=
              CONFIG_SENSE0Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
         when 1 =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE1 :=
              CONFIG_SENSE1Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
         when 2 =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE2 :=
              CONFIG_SENSE2Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
         when 3 =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE3 :=
              CONFIG_SENSE3Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
         when 4 =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE4 :=
              CONFIG_SENSE4Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
         when 5 =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE5 :=
              CONFIG_SENSE5Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
         when 6 =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE6 :=
              CONFIG_SENSE6Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
         when others =>
            EIC_Periph.CONFIG (CFG_Reg).SENSE7 :=
              CONFIG_SENSE7Select'Enum_Val (Sense_Kind'Enum_Rep (Sense));
      end case;

      if Enable_Interrupt then
         EIC_Periph.INTENSET.EXTINT := Pin_Mask;
      else
         EIC_Periph.INTENCLR.EXTINT := Pin_Mask;
      end if;

      if Debouncer then
         EIC_Periph.DEBOUNCEN.DEBOUNCEN :=
           EIC_Periph.DEBOUNCEN.DEBOUNCEN or Pin_Mask;
      else
         EIC_Periph.DEBOUNCEN.DEBOUNCEN :=
           EIC_Periph.DEBOUNCEN.DEBOUNCEN and (not Pin_Mask);
      end if;

      if Event_Output then
         EIC_Periph.EVCTRL.EXTINTEO :=
           EIC_Periph.EVCTRL.EXTINTEO or Pin_Mask;
      else
         EIC_Periph.EVCTRL.EXTINTEO :=
           EIC_Periph.EVCTRL.EXTINTEO and (not Pin_Mask);
      end if;

   end Configure;

   ---------------
   -- Pin_State --
   ---------------

   function Pin_State (Pin : EXTINT_Pin) return Boolean is
      Pin_Mask : constant UInt16 := UInt16 (2 ** Natural (Pin));
   begin
      return (EIC_Periph.PINSTATE.PINSTATE and Pin_Mask) /= 0;
   end Pin_State;

   ----------------------
   -- Enable_Interrupt --
   ----------------------

   procedure Enable_Interrupt (Pin : EXTINT_Pin) is
      Pin_Mask : constant UInt16 := UInt16 (2 ** Natural (Pin));
   begin
      EIC_Periph.INTENSET.EXTINT := Pin_Mask;
   end Enable_Interrupt;

   -----------------------
   -- Disable_Interrupt --
   -----------------------

   procedure Disable_Interrupt (Pin : EXTINT_Pin) is
      Pin_Mask : constant UInt16 := UInt16 (2 ** Natural (Pin));
   begin
      EIC_Periph.INTENCLR.EXTINT := Pin_Mask;
   end Disable_Interrupt;

   ---------------------
   -- Clear_Interrupt --
   ---------------------

   procedure Clear_Interrupt (Pin : EXTINT_Pin) is
      Pin_Mask : constant UInt16 := UInt16 (2 ** Natural (Pin));
   begin
      EIC_Periph.INTFLAG.EXTINT := Pin_Mask;
   end Clear_Interrupt;

   ---------------------
   -- Interrupt_State --
   ---------------------

   function Interrupt_State (Pin : EXTINT_Pin) return Boolean is
      Pin_Mask : constant UInt16 := UInt16 (2 ** Natural (Pin));
   begin
      return (EIC_Periph.INTFLAG.EXTINT and Pin_Mask) /= 0;
   end Interrupt_State;

end SAM.EIC;
