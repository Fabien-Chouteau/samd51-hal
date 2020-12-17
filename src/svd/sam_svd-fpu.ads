pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.FPU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Floating-Point Context Control Register
   type FPU_FPCCR_Register is record
      LSPACT        : Boolean := False;
      USER          : Boolean := False;
      --  unspecified
      Reserved_2_2  : HAL.Bit := 16#0#;
      THREAD        : Boolean := False;
      HFRDY         : Boolean := False;
      MMRDY         : Boolean := False;
      BFRDY         : Boolean := False;
      --  unspecified
      Reserved_7_7  : HAL.Bit := 16#0#;
      MONRDY        : Boolean := False;
      --  unspecified
      Reserved_9_29 : HAL.UInt21 := 16#0#;
      LSPEN         : Boolean := True;
      ASPEN         : Boolean := True;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPU_FPCCR_Register use record
      LSPACT        at 0 range 0 .. 0;
      USER          at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      THREAD        at 0 range 3 .. 3;
      HFRDY         at 0 range 4 .. 4;
      MMRDY         at 0 range 5 .. 5;
      BFRDY         at 0 range 6 .. 6;
      Reserved_7_7  at 0 range 7 .. 7;
      MONRDY        at 0 range 8 .. 8;
      Reserved_9_29 at 0 range 9 .. 29;
      LSPEN         at 0 range 30 .. 30;
      ASPEN         at 0 range 31 .. 31;
   end record;

   subtype FPU_FPCAR_ADDRESS_Field is HAL.UInt29;

   --  Floating-Point Context Address Register
   type FPU_FPCAR_Register is record
      --  unspecified
      Reserved_0_2 : HAL.UInt3 := 16#0#;
      --  Address for FP registers in exception stack frame
      ADDRESS      : FPU_FPCAR_ADDRESS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPU_FPCAR_Register use record
      Reserved_0_2 at 0 range 0 .. 2;
      ADDRESS      at 0 range 3 .. 31;
   end record;

   --  Default value for FPSCR.RMODE
   type FPDSCR_RMODESelect is
     (--  Round to Nearest
      RN,
      --  Round towards Positive Infinity
      RP,
      --  Round towards Negative Infinity
      RM,
      --  Round towards Zero
      RZ)
     with Size => 2;
   for FPDSCR_RMODESelect use
     (RN => 0,
      RP => 1,
      RM => 2,
      RZ => 3);

   --  Floating-Point Default Status Control Register
   type FPU_FPDSCR_Register is record
      --  unspecified
      Reserved_0_21  : HAL.UInt22 := 16#0#;
      --  Default value for FPSCR.RMODE
      RMODE          : FPDSCR_RMODESelect := SAM_SVD.FPU.RN;
      --  Default value for FPSCR.FZ
      FZ             : Boolean := False;
      --  Default value for FPSCR.DN
      DN             : Boolean := False;
      --  Default value for FPSCR.AHP
      AHP            : Boolean := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPU_FPDSCR_Register use record
      Reserved_0_21  at 0 range 0 .. 21;
      RMODE          at 0 range 22 .. 23;
      FZ             at 0 range 24 .. 24;
      DN             at 0 range 25 .. 25;
      AHP            at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype FPU_MVFR0_A_SIMD_registers_Field is HAL.UInt4;
   subtype FPU_MVFR0_Single_precision_Field is HAL.UInt4;
   subtype FPU_MVFR0_Double_precision_Field is HAL.UInt4;
   subtype FPU_MVFR0_FP_excep_trapping_Field is HAL.UInt4;
   subtype FPU_MVFR0_Divide_Field is HAL.UInt4;
   subtype FPU_MVFR0_Square_root_Field is HAL.UInt4;
   subtype FPU_MVFR0_Short_vectors_Field is HAL.UInt4;
   subtype FPU_MVFR0_FP_rounding_modes_Field is HAL.UInt4;

   --  Media and FP Feature Register 0
   type FPU_MVFR0_Register is record
      --  Read-only.
      A_SIMD_registers  : FPU_MVFR0_A_SIMD_registers_Field;
      --  Read-only.
      Single_precision  : FPU_MVFR0_Single_precision_Field;
      --  Read-only.
      Double_precision  : FPU_MVFR0_Double_precision_Field;
      --  Read-only.
      FP_excep_trapping : FPU_MVFR0_FP_excep_trapping_Field;
      --  Read-only.
      Divide            : FPU_MVFR0_Divide_Field;
      --  Read-only.
      Square_root       : FPU_MVFR0_Square_root_Field;
      --  Read-only.
      Short_vectors     : FPU_MVFR0_Short_vectors_Field;
      --  Read-only.
      FP_rounding_modes : FPU_MVFR0_FP_rounding_modes_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPU_MVFR0_Register use record
      A_SIMD_registers  at 0 range 0 .. 3;
      Single_precision  at 0 range 4 .. 7;
      Double_precision  at 0 range 8 .. 11;
      FP_excep_trapping at 0 range 12 .. 15;
      Divide            at 0 range 16 .. 19;
      Square_root       at 0 range 20 .. 23;
      Short_vectors     at 0 range 24 .. 27;
      FP_rounding_modes at 0 range 28 .. 31;
   end record;

   subtype FPU_MVFR1_FtZ_mode_Field is HAL.UInt4;
   subtype FPU_MVFR1_D_NaN_mode_Field is HAL.UInt4;
   subtype FPU_MVFR1_FP_HPFP_Field is HAL.UInt4;
   subtype FPU_MVFR1_FP_fused_MAC_Field is HAL.UInt4;

   --  Media and FP Feature Register 1
   type FPU_MVFR1_Register is record
      --  Read-only.
      FtZ_mode      : FPU_MVFR1_FtZ_mode_Field;
      --  Read-only.
      D_NaN_mode    : FPU_MVFR1_D_NaN_mode_Field;
      --  unspecified
      Reserved_8_23 : HAL.UInt16;
      --  Read-only.
      FP_HPFP       : FPU_MVFR1_FP_HPFP_Field;
      --  Read-only.
      FP_fused_MAC  : FPU_MVFR1_FP_fused_MAC_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPU_MVFR1_Register use record
      FtZ_mode      at 0 range 0 .. 3;
      D_NaN_mode    at 0 range 4 .. 7;
      Reserved_8_23 at 0 range 8 .. 23;
      FP_HPFP       at 0 range 24 .. 27;
      FP_fused_MAC  at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Floating Point Unit
   type FPU_Peripheral is record
      --  Floating-Point Context Control Register
      FPCCR  : aliased FPU_FPCCR_Register;
      --  Floating-Point Context Address Register
      FPCAR  : aliased FPU_FPCAR_Register;
      --  Floating-Point Default Status Control Register
      FPDSCR : aliased FPU_FPDSCR_Register;
      --  Media and FP Feature Register 0
      MVFR0  : aliased FPU_MVFR0_Register;
      --  Media and FP Feature Register 1
      MVFR1  : aliased FPU_MVFR1_Register;
   end record
     with Volatile;

   for FPU_Peripheral use record
      FPCCR  at 16#4# range 0 .. 31;
      FPCAR  at 16#8# range 0 .. 31;
      FPDSCR at 16#C# range 0 .. 31;
      MVFR0  at 16#10# range 0 .. 31;
      MVFR1  at 16#14# range 0 .. 31;
   end record;

   --  Floating Point Unit
   FPU_Periph : aliased FPU_Peripheral
     with Import, Address => FPU_Base;

end SAM_SVD.FPU;
