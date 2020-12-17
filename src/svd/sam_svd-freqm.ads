pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.FREQM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control A Register
   type FREQM_CTRLA_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for FREQM_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Control B Register
   type FREQM_CTRLB_Register is record
      --  Write-only. Start Measurement
      START        : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for FREQM_CTRLB_Register use record
      START        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   subtype FREQM_CFGA_REFNUM_Field is HAL.UInt8;

   --  Config A register
   type FREQM_CFGA_Register is record
      --  Number of Reference Clock Cycles
      REFNUM        : FREQM_CFGA_REFNUM_Field := 16#0#;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for FREQM_CFGA_Register use record
      REFNUM        at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  Interrupt Enable Clear Register
   type FREQM_INTENCLR_Register is record
      --  Measurement Done Interrupt Enable
      DONE         : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for FREQM_INTENCLR_Register use record
      DONE         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Set Register
   type FREQM_INTENSET_Register is record
      --  Measurement Done Interrupt Enable
      DONE         : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for FREQM_INTENSET_Register use record
      DONE         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Flag Register
   type FREQM_INTFLAG_Register is record
      --  Measurement Done
      DONE         : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for FREQM_INTFLAG_Register use record
      DONE         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Status Register
   type FREQM_STATUS_Register is record
      --  FREQM Status
      BUSY         : Boolean := False;
      --  Sticky Count Value Overflow
      OVF          : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for FREQM_STATUS_Register use record
      BUSY         at 0 range 0 .. 0;
      OVF          at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Synchronization Busy Register
   type FREQM_SYNCBUSY_Register is record
      --  Read-only. Software Reset
      SWRST         : Boolean;
      --  Read-only. Enable
      ENABLE        : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FREQM_SYNCBUSY_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype FREQM_VALUE_VALUE_Field is HAL.UInt24;

   --  Count Value Register
   type FREQM_VALUE_Register is record
      --  Read-only. Measurement Value
      VALUE          : FREQM_VALUE_VALUE_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FREQM_VALUE_Register use record
      VALUE          at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Frequency Meter
   type FREQM_Peripheral is record
      --  Control A Register
      CTRLA    : aliased FREQM_CTRLA_Register;
      --  Control B Register
      CTRLB    : aliased FREQM_CTRLB_Register;
      --  Config A register
      CFGA     : aliased FREQM_CFGA_Register;
      --  Interrupt Enable Clear Register
      INTENCLR : aliased FREQM_INTENCLR_Register;
      --  Interrupt Enable Set Register
      INTENSET : aliased FREQM_INTENSET_Register;
      --  Interrupt Flag Register
      INTFLAG  : aliased FREQM_INTFLAG_Register;
      --  Status Register
      STATUS   : aliased FREQM_STATUS_Register;
      --  Synchronization Busy Register
      SYNCBUSY : aliased FREQM_SYNCBUSY_Register;
      --  Count Value Register
      VALUE    : aliased FREQM_VALUE_Register;
   end record
     with Volatile;

   for FREQM_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      CTRLB    at 16#1# range 0 .. 7;
      CFGA     at 16#2# range 0 .. 15;
      INTENCLR at 16#8# range 0 .. 7;
      INTENSET at 16#9# range 0 .. 7;
      INTFLAG  at 16#A# range 0 .. 7;
      STATUS   at 16#B# range 0 .. 7;
      SYNCBUSY at 16#C# range 0 .. 31;
      VALUE    at 16#10# range 0 .. 31;
   end record;

   --  Frequency Meter
   FREQM_Periph : aliased FREQM_Peripheral
     with Import, Address => FREQM_Base;

end SAM_SVD.FREQM;
