pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.TRNG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control A
   type TRNG_CTRLA_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_5 : HAL.UInt4 := 16#0#;
      --  Run in Standby
      RUNSTDBY     : Boolean := False;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TRNG_CTRLA_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_5 at 0 range 2 .. 5;
      RUNSTDBY     at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  Event Control
   type TRNG_EVCTRL_Register is record
      --  Data Ready Event Output
      DATARDYEO    : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TRNG_EVCTRL_Register use record
      DATARDYEO    at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Clear
   type TRNG_INTENCLR_Register is record
      --  Data Ready Interrupt Enable
      DATARDY      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TRNG_INTENCLR_Register use record
      DATARDY      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Set
   type TRNG_INTENSET_Register is record
      --  Data Ready Interrupt Enable
      DATARDY      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TRNG_INTENSET_Register use record
      DATARDY      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type TRNG_INTFLAG_Register is record
      --  Data Ready Interrupt Flag
      DATARDY      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TRNG_INTFLAG_Register use record
      DATARDY      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  True Random Generator
   type TRNG_Peripheral is record
      --  Control A
      CTRLA    : aliased TRNG_CTRLA_Register;
      --  Event Control
      EVCTRL   : aliased TRNG_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased TRNG_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased TRNG_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased TRNG_INTFLAG_Register;
      --  Output Data
      DATA     : aliased HAL.UInt32;
   end record
     with Volatile;

   for TRNG_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      EVCTRL   at 16#4# range 0 .. 7;
      INTENCLR at 16#8# range 0 .. 7;
      INTENSET at 16#9# range 0 .. 7;
      INTFLAG  at 16#A# range 0 .. 7;
      DATA     at 16#20# range 0 .. 31;
   end record;

   --  True Random Generator
   TRNG_Periph : aliased TRNG_Peripheral
     with Import, Address => TRNG_Base;

end SAM_SVD.TRNG;
