pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.PCC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype PCC_MR_DSIZE_Field is HAL.UInt2;
   subtype PCC_MR_ISIZE_Field is HAL.UInt3;
   subtype PCC_MR_CID_Field is HAL.UInt2;

   --  Mode Register
   type PCC_MR_Register is record
      --  Parallel Capture Enable
      PCEN           : Boolean := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  Data size
      DSIZE          : PCC_MR_DSIZE_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Scale data
      SCALE          : Boolean := False;
      --  Always Sampling
      ALWYS          : Boolean := False;
      --  Half Sampling
      HALFS          : Boolean := False;
      --  First sample
      FRSTS          : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Input Data Size
      ISIZE          : PCC_MR_ISIZE_Field := 16#0#;
      --  unspecified
      Reserved_19_29 : HAL.UInt11 := 16#0#;
      --  Clear If Disabled
      CID            : PCC_MR_CID_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCC_MR_Register use record
      PCEN           at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DSIZE          at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SCALE          at 0 range 8 .. 8;
      ALWYS          at 0 range 9 .. 9;
      HALFS          at 0 range 10 .. 10;
      FRSTS          at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      ISIZE          at 0 range 16 .. 18;
      Reserved_19_29 at 0 range 19 .. 29;
      CID            at 0 range 30 .. 31;
   end record;

   --  Interrupt Enable Register
   type PCC_IER_Register is record
      --  Write-only. Data Ready Interrupt Enable
      DRDY          : Boolean := False;
      --  Write-only. Overrun Error Interrupt Enable
      OVRE          : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCC_IER_Register use record
      DRDY          at 0 range 0 .. 0;
      OVRE          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Interrupt Disable Register
   type PCC_IDR_Register is record
      --  Write-only. Data Ready Interrupt Disable
      DRDY          : Boolean := False;
      --  Write-only. Overrun Error Interrupt Disable
      OVRE          : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCC_IDR_Register use record
      DRDY          at 0 range 0 .. 0;
      OVRE          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Interrupt Mask Register
   type PCC_IMR_Register is record
      --  Read-only. Data Ready Interrupt Mask
      DRDY          : Boolean;
      --  Read-only. Overrun Error Interrupt Mask
      OVRE          : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCC_IMR_Register use record
      DRDY          at 0 range 0 .. 0;
      OVRE          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Interrupt Status Register
   type PCC_ISR_Register is record
      --  Read-only. Data Ready Interrupt Status
      DRDY          : Boolean;
      --  Read-only. Overrun Error Interrupt Status
      OVRE          : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCC_ISR_Register use record
      DRDY          at 0 range 0 .. 0;
      OVRE          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype PCC_WPMR_WPKEY_Field is HAL.UInt24;

   --  Write Protection Mode Register
   type PCC_WPMR_Register is record
      --  Write Protection Enable
      WPEN         : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
      --  Write Protection Key
      WPKEY        : PCC_WPMR_WPKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCC_WPMR_Register use record
      WPEN         at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
      WPKEY        at 0 range 8 .. 31;
   end record;

   subtype PCC_WPSR_WPVSRC_Field is HAL.UInt16;

   --  Write Protection Status Register
   type PCC_WPSR_Register is record
      --  Read-only. Write Protection Violation Source
      WPVS           : Boolean;
      --  unspecified
      Reserved_1_7   : HAL.UInt7;
      --  Read-only. Write Protection Violation Status
      WPVSRC         : PCC_WPSR_WPVSRC_Field;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCC_WPSR_Register use record
      WPVS           at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      WPVSRC         at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Parallel Capture Controller
   type PCC_Peripheral is record
      --  Mode Register
      MR   : aliased PCC_MR_Register;
      --  Interrupt Enable Register
      IER  : aliased PCC_IER_Register;
      --  Interrupt Disable Register
      IDR  : aliased PCC_IDR_Register;
      --  Interrupt Mask Register
      IMR  : aliased PCC_IMR_Register;
      --  Interrupt Status Register
      ISR  : aliased PCC_ISR_Register;
      --  Reception Holding Register
      RHR  : aliased HAL.UInt32;
      --  Write Protection Mode Register
      WPMR : aliased PCC_WPMR_Register;
      --  Write Protection Status Register
      WPSR : aliased PCC_WPSR_Register;
   end record
     with Volatile;

   for PCC_Peripheral use record
      MR   at 16#0# range 0 .. 31;
      IER  at 16#4# range 0 .. 31;
      IDR  at 16#8# range 0 .. 31;
      IMR  at 16#C# range 0 .. 31;
      ISR  at 16#10# range 0 .. 31;
      RHR  at 16#14# range 0 .. 31;
      WPMR at 16#E0# range 0 .. 31;
      WPSR at 16#E4# range 0 .. 31;
   end record;

   --  Parallel Capture Controller
   PCC_Periph : aliased PCC_Peripheral
     with Import, Address => PCC_Base;

end SAM_SVD.PCC;
