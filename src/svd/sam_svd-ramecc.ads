pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.RAMECC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Interrupt Enable Clear
   type RAMECC_INTENCLR_Register is record
      --  Single Bit ECC Error Interrupt Enable Clear
      SINGLEE      : Boolean := False;
      --  Dual Bit ECC Error Interrupt Enable Clear
      DUALE        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RAMECC_INTENCLR_Register use record
      SINGLEE      at 0 range 0 .. 0;
      DUALE        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Interrupt Enable Set
   type RAMECC_INTENSET_Register is record
      --  Single Bit ECC Error Interrupt Enable Set
      SINGLEE      : Boolean := False;
      --  Dual Bit ECC Error Interrupt Enable Set
      DUALE        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RAMECC_INTENSET_Register use record
      SINGLEE      at 0 range 0 .. 0;
      DUALE        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Interrupt Flag
   type RAMECC_INTFLAG_Register is record
      --  Single Bit ECC Error Interrupt
      SINGLEE      : Boolean := False;
      --  Dual Bit ECC Error Interrupt
      DUALE        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RAMECC_INTFLAG_Register use record
      SINGLEE      at 0 range 0 .. 0;
      DUALE        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Status
   type RAMECC_STATUS_Register is record
      --  Read-only. ECC Disable
      ECCDIS       : Boolean;
      --  unspecified
      Reserved_1_7 : HAL.UInt7;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RAMECC_STATUS_Register use record
      ECCDIS       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   subtype RAMECC_ERRADDR_ERRADDR_Field is HAL.UInt17;

   --  Error Address
   type RAMECC_ERRADDR_Register is record
      --  Read-only. Error Address
      ERRADDR        : RAMECC_ERRADDR_ERRADDR_Field;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAMECC_ERRADDR_Register use record
      ERRADDR        at 0 range 0 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  Debug Control
   type RAMECC_DBGCTRL_Register is record
      --  ECC Disable
      ECCDIS       : Boolean := False;
      --  ECC Error Log
      ECCELOG      : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RAMECC_DBGCTRL_Register use record
      ECCDIS       at 0 range 0 .. 0;
      ECCELOG      at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  RAM ECC
   type RAMECC_Peripheral is record
      --  Interrupt Enable Clear
      INTENCLR : aliased RAMECC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased RAMECC_INTENSET_Register;
      --  Interrupt Flag
      INTFLAG  : aliased RAMECC_INTFLAG_Register;
      --  Status
      STATUS   : aliased RAMECC_STATUS_Register;
      --  Error Address
      ERRADDR  : aliased RAMECC_ERRADDR_Register;
      --  Debug Control
      DBGCTRL  : aliased RAMECC_DBGCTRL_Register;
   end record
     with Volatile;

   for RAMECC_Peripheral use record
      INTENCLR at 16#0# range 0 .. 7;
      INTENSET at 16#1# range 0 .. 7;
      INTFLAG  at 16#2# range 0 .. 7;
      STATUS   at 16#3# range 0 .. 7;
      ERRADDR  at 16#4# range 0 .. 31;
      DBGCTRL  at 16#F# range 0 .. 7;
   end record;

   --  RAM ECC
   RAMECC_Periph : aliased RAMECC_Peripheral
     with Import, Address => RAMECC_Base;

end SAM_SVD.RAMECC;
