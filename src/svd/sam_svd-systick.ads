pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.SysTick is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  SysTick Counter Enable
   type CSR_ENABLESelect is
     (--  Counter disabled
      VALUE_0,
      --  Counter enabled
      VALUE_1)
     with Size => 1;
   for CSR_ENABLESelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  SysTick Exception Request Enable
   type CSR_TICKINTSelect is
     (--  Counting down to 0 does not assert the SysTick exception request
      VALUE_0,
      --  Counting down to 0 asserts the SysTick exception request
      VALUE_1)
     with Size => 1;
   for CSR_TICKINTSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  Clock Source 0=external, 1=processor
   type CSR_CLKSOURCESelect is
     (--  External clock
      VALUE_0,
      --  Processor clock
      VALUE_1)
     with Size => 1;
   for CSR_CLKSOURCESelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  SysTick Control and Status Register
   type SysTick_CSR_Register is record
      --  SysTick Counter Enable
      ENABLE         : CSR_ENABLESelect := SAM_SVD.SysTick.VALUE_0;
      --  SysTick Exception Request Enable
      TICKINT        : CSR_TICKINTSelect := SAM_SVD.SysTick.VALUE_0;
      --  Clock Source 0=external, 1=processor
      CLKSOURCE      : CSR_CLKSOURCESelect := SAM_SVD.SysTick.VALUE_1;
      --  unspecified
      Reserved_3_15  : HAL.UInt13 := 16#0#;
      --  Timer counted to 0 since last read of register
      COUNTFLAG      : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SysTick_CSR_Register use record
      ENABLE         at 0 range 0 .. 0;
      TICKINT        at 0 range 1 .. 1;
      CLKSOURCE      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      COUNTFLAG      at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype SysTick_RVR_RELOAD_Field is HAL.UInt24;

   --  SysTick Reload Value Register
   type SysTick_RVR_Register is record
      --  Value to load into the SysTick Current Value Register when the
      --  counter reaches 0
      RELOAD         : SysTick_RVR_RELOAD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SysTick_RVR_Register use record
      RELOAD         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SysTick_CVR_CURRENT_Field is HAL.UInt24;

   --  SysTick Current Value Register
   type SysTick_CVR_Register is record
      --  Current value at the time the register is accessed
      CURRENT        : SysTick_CVR_CURRENT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SysTick_CVR_Register use record
      CURRENT        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SysTick_CALIB_TENMS_Field is HAL.UInt24;

   --  TENMS is rounded from non-integer ratio
   type CALIB_SKEWSelect is
     (--  10ms calibration value is exact
      VALUE_0,
      --  10ms calibration value is inexact, because of the clock frequency
      VALUE_1)
     with Size => 1;
   for CALIB_SKEWSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  No Separate Reference Clock
   type CALIB_NOREFSelect is
     (--  The reference clock is provided
      VALUE_0,
      --  The reference clock is not provided
      VALUE_1)
     with Size => 1;
   for CALIB_NOREFSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  SysTick Calibration Value Register
   type SysTick_CALIB_Register is record
      --  Read-only. Reload value to use for 10ms timing
      TENMS          : SysTick_CALIB_TENMS_Field;
      --  unspecified
      Reserved_24_29 : HAL.UInt6;
      --  Read-only. TENMS is rounded from non-integer ratio
      SKEW           : CALIB_SKEWSelect;
      --  Read-only. No Separate Reference Clock
      NOREF          : CALIB_NOREFSelect;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SysTick_CALIB_Register use record
      TENMS          at 0 range 0 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      SKEW           at 0 range 30 .. 30;
      NOREF          at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System timer
   type SysTick_Peripheral is record
      --  SysTick Control and Status Register
      CSR   : aliased SysTick_CSR_Register;
      --  SysTick Reload Value Register
      RVR   : aliased SysTick_RVR_Register;
      --  SysTick Current Value Register
      CVR   : aliased SysTick_CVR_Register;
      --  SysTick Calibration Value Register
      CALIB : aliased SysTick_CALIB_Register;
   end record
     with Volatile;

   for SysTick_Peripheral use record
      CSR   at 16#0# range 0 .. 31;
      RVR   at 16#4# range 0 .. 31;
      CVR   at 16#8# range 0 .. 31;
      CALIB at 16#C# range 0 .. 31;
   end record;

   --  System timer
   SysTick_Periph : aliased SysTick_Peripheral
     with Import, Address => SysTick_Base;

end SAM_SVD.SysTick;
