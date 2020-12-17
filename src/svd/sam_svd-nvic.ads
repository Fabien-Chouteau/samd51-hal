pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.NVIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Interrupt Set Enable Register

   --  Interrupt Set Enable Register
   type NVIC_ISER_Registers is array (0 .. 4) of HAL.UInt32;

   --  Interrupt Clear Enable Register

   --  Interrupt Clear Enable Register
   type NVIC_ICER_Registers is array (0 .. 4) of HAL.UInt32;

   --  Interrupt Set Pending Register

   --  Interrupt Set Pending Register
   type NVIC_ISPR_Registers is array (0 .. 4) of HAL.UInt32;

   --  Interrupt Clear Pending Register

   --  Interrupt Clear Pending Register
   type NVIC_ICPR_Registers is array (0 .. 4) of HAL.UInt32;

   --  Interrupt Active Bit Register

   --  Interrupt Active Bit Register
   type NVIC_IABR_Registers is array (0 .. 4) of HAL.UInt32;

   subtype NVIC_IP_PRI0_Field is HAL.UInt3;

   --  Interrupt Priority Register n
   type NVIC_IP_Register is record
      --  Priority of interrupt n
      PRI0         : NVIC_IP_PRI0_Field := 16#0#;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for NVIC_IP_Register use record
      PRI0         at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Interrupt Priority Register n
   type NVIC_IP_Registers is array (0 .. 34) of NVIC_IP_Register;

   subtype NVIC_STIR_INTID_Field is HAL.UInt9;

   --  Software Trigger Interrupt Register
   type NVIC_STIR_Register is record
      --  Write-only. Interrupt ID to trigger
      INTID         : NVIC_STIR_INTID_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_STIR_Register use record
      INTID         at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Nested Vectored Interrupt Controller
   type NVIC_Peripheral is record
      --  Interrupt Set Enable Register
      ISER : aliased NVIC_ISER_Registers;
      --  Interrupt Clear Enable Register
      ICER : aliased NVIC_ICER_Registers;
      --  Interrupt Set Pending Register
      ISPR : aliased NVIC_ISPR_Registers;
      --  Interrupt Clear Pending Register
      ICPR : aliased NVIC_ICPR_Registers;
      --  Interrupt Active Bit Register
      IABR : aliased NVIC_IABR_Registers;
      --  Interrupt Priority Register n
      IP   : aliased NVIC_IP_Registers;
      --  Software Trigger Interrupt Register
      STIR : aliased NVIC_STIR_Register;
   end record
     with Volatile;

   for NVIC_Peripheral use record
      ISER at 16#0# range 0 .. 159;
      ICER at 16#80# range 0 .. 159;
      ISPR at 16#100# range 0 .. 159;
      ICPR at 16#180# range 0 .. 159;
      IABR at 16#200# range 0 .. 159;
      IP   at 16#300# range 0 .. 279;
      STIR at 16#E00# range 0 .. 31;
   end record;

   --  Nested Vectored Interrupt Controller
   NVIC_Periph : aliased NVIC_Peripheral
     with Import, Address => NVIC_Base;

end SAM_SVD.NVIC;
