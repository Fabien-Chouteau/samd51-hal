pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.GCLK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type GCLK_CTRLA_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for GCLK_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Generic Clock Generator Control n Synchronization Busy bits
   type SYNCBUSY_GENCTRLSelect is
     (--  Generic clock generator 0
      GCLK0,
      --  Generic clock generator 1
      GCLK1,
      --  Generic clock generator 2
      GCLK2,
      --  Generic clock generator 3
      GCLK3,
      --  Generic clock generator 4
      GCLK4,
      --  Generic clock generator 5
      GCLK5,
      --  Generic clock generator 6
      GCLK6,
      --  Generic clock generator 7
      GCLK7,
      --  Generic clock generator 8
      GCLK8,
      --  Generic clock generator 9
      GCLK9,
      --  Generic clock generator 10
      GCLK10,
      --  Generic clock generator 11
      GCLK11)
     with Size => 12;
   for SYNCBUSY_GENCTRLSelect use
     (GCLK0 => 1,
      GCLK1 => 2,
      GCLK2 => 4,
      GCLK3 => 8,
      GCLK4 => 16,
      GCLK5 => 32,
      GCLK6 => 64,
      GCLK7 => 128,
      GCLK8 => 256,
      GCLK9 => 512,
      GCLK10 => 1024,
      GCLK11 => 2048);

   --  Synchronization Busy
   type GCLK_SYNCBUSY_Register is record
      --  Read-only. Software Reset Synchroniation Busy bit
      SWRST          : Boolean;
      --  unspecified
      Reserved_1_1   : HAL.Bit;
      --  Read-only. Generic Clock Generator Control n Synchronization Busy
      --  bits
      GENCTRL        : SYNCBUSY_GENCTRLSelect;
      --  unspecified
      Reserved_14_31 : HAL.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GCLK_SYNCBUSY_Register use record
      SWRST          at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      GENCTRL        at 0 range 2 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  Source Select
   type GENCTRL_SRCSelect is
     (--  XOSC0 oscillator output
      XOSC0,
      --  XOSC1 oscillator output
      XOSC1,
      --  Generator input pad
      GCLKIN,
      --  Generic clock generator 1 output
      GCLKGEN1,
      --  OSCULP32K oscillator output
      OSCULP32K,
      --  XOSC32K oscillator output
      XOSC32K,
      --  DFLL output
      DFLL,
      --  DPLL0 output
      DPLL0,
      --  DPLL1 output
      DPLL1)
     with Size => 4;
   for GENCTRL_SRCSelect use
     (XOSC0 => 0,
      XOSC1 => 1,
      GCLKIN => 2,
      GCLKGEN1 => 3,
      OSCULP32K => 4,
      XOSC32K => 5,
      DFLL => 6,
      DPLL0 => 7,
      DPLL1 => 8);

   --  Divide Selection
   type GENCTRL_DIVSELSelect is
     (--  Divide input directly by divider factor
      DIV1,
      --  Divide input by 2^(divider factor+ 1)
      DIV2)
     with Size => 1;
   for GENCTRL_DIVSELSelect use
     (DIV1 => 0,
      DIV2 => 1);

   subtype GCLK_GENCTRL_DIV_Field is HAL.UInt16;

   --  Generic Clock Generator Control
   type GCLK_GENCTRL_Register is record
      --  Source Select
      SRC            : GENCTRL_SRCSelect := SAM_SVD.GCLK.XOSC0;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Generic Clock Generator Enable
      GENEN          : Boolean := False;
      --  Improve Duty Cycle
      IDC            : Boolean := False;
      --  Output Off Value
      OOV            : Boolean := False;
      --  Output Enable
      OE             : Boolean := False;
      --  Divide Selection
      DIVSEL         : GENCTRL_DIVSELSelect := SAM_SVD.GCLK.DIV1;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Division Factor
      DIV            : GCLK_GENCTRL_DIV_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GCLK_GENCTRL_Register use record
      SRC            at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      GENEN          at 0 range 8 .. 8;
      IDC            at 0 range 9 .. 9;
      OOV            at 0 range 10 .. 10;
      OE             at 0 range 11 .. 11;
      DIVSEL         at 0 range 12 .. 12;
      RUNSTDBY       at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      DIV            at 0 range 16 .. 31;
   end record;

   --  Generic Clock Generator Control
   type GCLK_GENCTRL_Registers is array (0 .. 11) of GCLK_GENCTRL_Register;

   --  Generic Clock Generator
   type PCHCTRL_GENSelect is
     (--  Generic clock generator 0
      GCLK0,
      --  Generic clock generator 1
      GCLK1,
      --  Generic clock generator 2
      GCLK2,
      --  Generic clock generator 3
      GCLK3,
      --  Generic clock generator 4
      GCLK4,
      --  Generic clock generator 5
      GCLK5,
      --  Generic clock generator 6
      GCLK6,
      --  Generic clock generator 7
      GCLK7,
      --  Generic clock generator 8
      GCLK8,
      --  Generic clock generator 9
      GCLK9,
      --  Generic clock generator 10
      GCLK10,
      --  Generic clock generator 11
      GCLK11)
     with Size => 4;
   for PCHCTRL_GENSelect use
     (GCLK0 => 0,
      GCLK1 => 1,
      GCLK2 => 2,
      GCLK3 => 3,
      GCLK4 => 4,
      GCLK5 => 5,
      GCLK6 => 6,
      GCLK7 => 7,
      GCLK8 => 8,
      GCLK9 => 9,
      GCLK10 => 10,
      GCLK11 => 11);

   --  Peripheral Clock Control
   type GCLK_PCHCTRL_Register is record
      --  Generic Clock Generator
      GEN           : PCHCTRL_GENSelect := SAM_SVD.GCLK.GCLK0;
      --  unspecified
      Reserved_4_5  : HAL.UInt2 := 16#0#;
      --  Channel Enable
      CHEN          : Boolean := False;
      --  Write Lock
      WRTLOCK       : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GCLK_PCHCTRL_Register use record
      GEN           at 0 range 0 .. 3;
      Reserved_4_5  at 0 range 4 .. 5;
      CHEN          at 0 range 6 .. 6;
      WRTLOCK       at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Peripheral Clock Control
   type GCLK_PCHCTRL_Registers is array (0 .. 47) of GCLK_PCHCTRL_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  Generic Clock Generator
   type GCLK_Peripheral is record
      --  Control
      CTRLA    : aliased GCLK_CTRLA_Register;
      --  Synchronization Busy
      SYNCBUSY : aliased GCLK_SYNCBUSY_Register;
      --  Generic Clock Generator Control
      GENCTRL  : aliased GCLK_GENCTRL_Registers;
      --  Peripheral Clock Control
      PCHCTRL  : aliased GCLK_PCHCTRL_Registers;
   end record
     with Volatile;

   for GCLK_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      SYNCBUSY at 16#4# range 0 .. 31;
      GENCTRL  at 16#20# range 0 .. 383;
      PCHCTRL  at 16#80# range 0 .. 1535;
   end record;

   --  Generic Clock Generator
   GCLK_Periph : aliased GCLK_Peripheral
     with Import, Address => GCLK_Base;

end SAM_SVD.GCLK;
