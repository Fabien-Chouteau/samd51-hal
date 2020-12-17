pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.WDT is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type WDT_CTRLA_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Enable
      ENABLE       : Boolean := False;
      --  Watchdog Timer Window Mode Enable
      WEN          : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Always-On
      ALWAYSON     : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_CTRLA_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      WEN          at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ALWAYSON     at 0 range 7 .. 7;
   end record;

   --  Time-Out Period
   type CONFIG_PERSelect is
     (--  8 clock cycles
      CYC8,
      --  16 clock cycles
      CYC16,
      --  32 clock cycles
      CYC32,
      --  64 clock cycles
      CYC64,
      --  128 clock cycles
      CYC128,
      --  256 clock cycles
      CYC256,
      --  512 clock cycles
      CYC512,
      --  1024 clock cycles
      CYC1024,
      --  2048 clock cycles
      CYC2048,
      --  4096 clock cycles
      CYC4096,
      --  8192 clock cycles
      CYC8192,
      --  16384 clock cycles
      CYC16384)
     with Size => 4;
   for CONFIG_PERSelect use
     (CYC8 => 0,
      CYC16 => 1,
      CYC32 => 2,
      CYC64 => 3,
      CYC128 => 4,
      CYC256 => 5,
      CYC512 => 6,
      CYC1024 => 7,
      CYC2048 => 8,
      CYC4096 => 9,
      CYC8192 => 10,
      CYC16384 => 11);

   --  Window Mode Time-Out Period
   type CONFIG_WINDOWSelect is
     (--  8 clock cycles
      CYC8,
      --  16 clock cycles
      CYC16,
      --  32 clock cycles
      CYC32,
      --  64 clock cycles
      CYC64,
      --  128 clock cycles
      CYC128,
      --  256 clock cycles
      CYC256,
      --  512 clock cycles
      CYC512,
      --  1024 clock cycles
      CYC1024,
      --  2048 clock cycles
      CYC2048,
      --  4096 clock cycles
      CYC4096,
      --  8192 clock cycles
      CYC8192,
      --  16384 clock cycles
      CYC16384)
     with Size => 4;
   for CONFIG_WINDOWSelect use
     (CYC8 => 0,
      CYC16 => 1,
      CYC32 => 2,
      CYC64 => 3,
      CYC128 => 4,
      CYC256 => 5,
      CYC512 => 6,
      CYC1024 => 7,
      CYC2048 => 8,
      CYC4096 => 9,
      CYC8192 => 10,
      CYC16384 => 11);

   --  Configuration
   type WDT_CONFIG_Register is record
      --  Time-Out Period
      PER    : CONFIG_PERSelect := SAM_SVD.WDT.CYC16384;
      --  Window Mode Time-Out Period
      WINDOW : CONFIG_WINDOWSelect := SAM_SVD.WDT.CYC16384;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_CONFIG_Register use record
      PER    at 0 range 0 .. 3;
      WINDOW at 0 range 4 .. 7;
   end record;

   --  Early Warning Interrupt Time Offset
   type EWCTRL_EWOFFSETSelect is
     (--  8 clock cycles
      CYC8,
      --  16 clock cycles
      CYC16,
      --  32 clock cycles
      CYC32,
      --  64 clock cycles
      CYC64,
      --  128 clock cycles
      CYC128,
      --  256 clock cycles
      CYC256,
      --  512 clock cycles
      CYC512,
      --  1024 clock cycles
      CYC1024,
      --  2048 clock cycles
      CYC2048,
      --  4096 clock cycles
      CYC4096,
      --  8192 clock cycles
      CYC8192,
      --  16384 clock cycles
      CYC16384)
     with Size => 4;
   for EWCTRL_EWOFFSETSelect use
     (CYC8 => 0,
      CYC16 => 1,
      CYC32 => 2,
      CYC64 => 3,
      CYC128 => 4,
      CYC256 => 5,
      CYC512 => 6,
      CYC1024 => 7,
      CYC2048 => 8,
      CYC4096 => 9,
      CYC8192 => 10,
      CYC16384 => 11);

   --  Early Warning Interrupt Control
   type WDT_EWCTRL_Register is record
      --  Early Warning Interrupt Time Offset
      EWOFFSET     : EWCTRL_EWOFFSETSelect := SAM_SVD.WDT.CYC16384;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_EWCTRL_Register use record
      EWOFFSET     at 0 range 0 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Interrupt Enable Clear
   type WDT_INTENCLR_Register is record
      --  Early Warning Interrupt Enable
      EW           : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_INTENCLR_Register use record
      EW           at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Set
   type WDT_INTENSET_Register is record
      --  Early Warning Interrupt Enable
      EW           : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_INTENSET_Register use record
      EW           at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type WDT_INTFLAG_Register is record
      --  Early Warning
      EW           : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for WDT_INTFLAG_Register use record
      EW           at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Synchronization Busy
   type WDT_SYNCBUSY_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit;
      --  Read-only. Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. Window Enable Synchronization Busy
      WEN           : Boolean;
      --  Read-only. Always-On Synchronization Busy
      ALWAYSON      : Boolean;
      --  Read-only. Clear Synchronization Busy
      CLEAR         : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WDT_SYNCBUSY_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      WEN           at 0 range 2 .. 2;
      ALWAYSON      at 0 range 3 .. 3;
      CLEAR         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Watchdog Timer
   type WDT_Peripheral is record
      --  Control
      CTRLA    : aliased WDT_CTRLA_Register;
      --  Configuration
      CONFIG   : aliased WDT_CONFIG_Register;
      --  Early Warning Interrupt Control
      EWCTRL   : aliased WDT_EWCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased WDT_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased WDT_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased WDT_INTFLAG_Register;
      --  Synchronization Busy
      SYNCBUSY : aliased WDT_SYNCBUSY_Register;
      --  Clear
      CLEAR    : aliased HAL.UInt8;
   end record
     with Volatile;

   for WDT_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      CONFIG   at 16#1# range 0 .. 7;
      EWCTRL   at 16#2# range 0 .. 7;
      INTENCLR at 16#4# range 0 .. 7;
      INTENSET at 16#5# range 0 .. 7;
      INTFLAG  at 16#6# range 0 .. 7;
      SYNCBUSY at 16#8# range 0 .. 31;
      CLEAR    at 16#C# range 0 .. 7;
   end record;

   --  Watchdog Timer
   WDT_Periph : aliased WDT_Peripheral
     with Import, Address => WDT_Base;

end SAM_SVD.WDT;
