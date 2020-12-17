pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.SystemControl is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype SystemControl_ICTR_INTLINESNUM_Field is HAL.UInt4;

   --  Interrupt Controller Type Register
   type SystemControl_ICTR_Register is record
      --  Read-only.
      INTLINESNUM   : SystemControl_ICTR_INTLINESNUM_Field;
      --  unspecified
      Reserved_4_31 : HAL.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_ICTR_Register use record
      INTLINESNUM   at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Auxiliary Control Register
   type SystemControl_ACTLR_Register is record
      --  Disable interruption of LDM/STM instructions
      DISMCYCINT     : Boolean := False;
      --  Disable wruite buffer use during default memory map accesses
      DISDEFWBUF     : Boolean := False;
      --  Disable IT folding
      DISFOLD        : Boolean := False;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  Disable automatic update of CONTROL.FPCA
      DISFPCA        : Boolean := False;
      --  Disable out-of-order FP instructions
      DISOOFP        : Boolean := False;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_ACTLR_Register use record
      DISMCYCINT     at 0 range 0 .. 0;
      DISDEFWBUF     at 0 range 1 .. 1;
      DISFOLD        at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      DISFPCA        at 0 range 8 .. 8;
      DISOOFP        at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SystemControl_CPUID_REVISION_Field is HAL.UInt4;
   subtype SystemControl_CPUID_PARTNO_Field is HAL.UInt12;
   subtype SystemControl_CPUID_CONSTANT_Field is HAL.UInt4;
   subtype SystemControl_CPUID_VARIANT_Field is HAL.UInt4;
   subtype SystemControl_CPUID_IMPLEMENTER_Field is HAL.UInt8;

   --  CPUID Base Register
   type SystemControl_CPUID_Register is record
      --  Read-only. Processor revision number
      REVISION    : SystemControl_CPUID_REVISION_Field;
      --  Read-only. Process Part Number, 0xC24=Cortex-M4
      PARTNO      : SystemControl_CPUID_PARTNO_Field;
      --  Read-only. Constant
      CONSTANT_k  : SystemControl_CPUID_CONSTANT_Field;
      --  Read-only. Variant number
      VARIANT     : SystemControl_CPUID_VARIANT_Field;
      --  Read-only. Implementer code, 0x41=ARM
      IMPLEMENTER : SystemControl_CPUID_IMPLEMENTER_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_CPUID_Register use record
      REVISION    at 0 range 0 .. 3;
      PARTNO      at 0 range 4 .. 15;
      CONSTANT_k  at 0 range 16 .. 19;
      VARIANT     at 0 range 20 .. 23;
      IMPLEMENTER at 0 range 24 .. 31;
   end record;

   subtype SystemControl_ICSR_VECTACTIVE_Field is HAL.UInt9;
   subtype SystemControl_ICSR_VECTPENDING_Field is HAL.UInt6;

   --  SysTick clear-pending bit
   type ICSR_PENDSTCLRSelect is
     (--  No effect
      VALUE_0,
      --  Removes the pending state from the SysTick exception
      VALUE_1)
     with Size => 1;
   for ICSR_PENDSTCLRSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  SysTick set-pending bit
   type ICSR_PENDSTSETSelect is
     (--  Write: no effect; read: SysTick exception is not pending
      VALUE_0,
      --  Write: changes SysTick exception state to pending; read: SysTick exception
--  is pending
      VALUE_1)
     with Size => 1;
   for ICSR_PENDSTSETSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  PendSV clear-pending bit
   type ICSR_PENDSVCLRSelect is
     (--  No effect
      VALUE_0,
      --  Removes the pending state from the PendSV exception
      VALUE_1)
     with Size => 1;
   for ICSR_PENDSVCLRSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  PendSV set-pending bit
   type ICSR_PENDSVSETSelect is
     (--  Write: no effect; read: PendSV exception is not pending
      VALUE_0,
      --  Write: changes PendSV exception state to pending; read: PendSV exception is
--  pending
      VALUE_1)
     with Size => 1;
   for ICSR_PENDSVSETSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  NMI set-pending bit
   type ICSR_NMIPENDSETSelect is
     (--  Write: no effect; read: NMI exception is not pending
      VALUE_0,
      --  Write: changes NMI exception state to pending; read: NMI exception is
--  pending
      VALUE_1)
     with Size => 1;
   for ICSR_NMIPENDSETSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  Interrupt Control and State Register
   type SystemControl_ICSR_Register is record
      --  Active exception number
      VECTACTIVE     : SystemControl_ICSR_VECTACTIVE_Field := 16#0#;
      --  unspecified
      Reserved_9_10  : HAL.UInt2 := 16#0#;
      --  No preempted active exceptions to execute
      RETTOBASE      : Boolean := False;
      --  Exception number of the highest priority pending enabled exception
      VECTPENDING    : SystemControl_ICSR_VECTPENDING_Field := 16#0#;
      --  unspecified
      Reserved_18_21 : HAL.UInt4 := 16#0#;
      --  Interrupt pending flag
      ISRPENDING     : Boolean := False;
      --  Debug only
      ISRPREEMPT     : Boolean := False;
      --  unspecified
      Reserved_24_24 : HAL.Bit := 16#0#;
      --  SysTick clear-pending bit
      PENDSTCLR      : ICSR_PENDSTCLRSelect := SAM_SVD.SystemControl.VALUE_0;
      --  SysTick set-pending bit
      PENDSTSET      : ICSR_PENDSTSETSelect := SAM_SVD.SystemControl.VALUE_0;
      --  PendSV clear-pending bit
      PENDSVCLR      : ICSR_PENDSVCLRSelect := SAM_SVD.SystemControl.VALUE_0;
      --  PendSV set-pending bit
      PENDSVSET      : ICSR_PENDSVSETSelect := SAM_SVD.SystemControl.VALUE_0;
      --  unspecified
      Reserved_29_30 : HAL.UInt2 := 16#0#;
      --  NMI set-pending bit
      NMIPENDSET     : ICSR_NMIPENDSETSelect := SAM_SVD.SystemControl.VALUE_0;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_ICSR_Register use record
      VECTACTIVE     at 0 range 0 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      RETTOBASE      at 0 range 11 .. 11;
      VECTPENDING    at 0 range 12 .. 17;
      Reserved_18_21 at 0 range 18 .. 21;
      ISRPENDING     at 0 range 22 .. 22;
      ISRPREEMPT     at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      PENDSTCLR      at 0 range 25 .. 25;
      PENDSTSET      at 0 range 26 .. 26;
      PENDSVCLR      at 0 range 27 .. 27;
      PENDSVSET      at 0 range 28 .. 28;
      Reserved_29_30 at 0 range 29 .. 30;
      NMIPENDSET     at 0 range 31 .. 31;
   end record;

   subtype SystemControl_VTOR_TBLOFF_Field is HAL.UInt25;

   --  Vector Table Offset Register
   type SystemControl_VTOR_Register is record
      --  unspecified
      Reserved_0_6 : HAL.UInt7 := 16#0#;
      --  Vector table base offset
      TBLOFF       : SystemControl_VTOR_TBLOFF_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_VTOR_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      TBLOFF       at 0 range 7 .. 31;
   end record;

   --  System Reset Request
   type AIRCR_SYSRESETREQSelect is
     (--  No system reset request
      VALUE_0,
      --  Asserts a signal to the outer system that requests a reset
      VALUE_1)
     with Size => 1;
   for AIRCR_SYSRESETREQSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   subtype SystemControl_AIRCR_PRIGROUP_Field is HAL.UInt3;

   --  Data endianness, 0=little, 1=big
   type AIRCR_ENDIANNESSSelect is
     (--  Little-endian
      VALUE_0,
      --  Big-endian
      VALUE_1)
     with Size => 1;
   for AIRCR_ENDIANNESSSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   subtype SystemControl_AIRCR_VECTKEY_Field is HAL.UInt16;

   --  Application Interrupt and Reset Control Register
   type SystemControl_AIRCR_Register is record
      --  Must write 0
      VECTRESET      : Boolean := False;
      --  Must write 0
      VECTCLRACTIVE  : Boolean := False;
      --  System Reset Request
      SYSRESETREQ    : AIRCR_SYSRESETREQSelect :=
                        SAM_SVD.SystemControl.VALUE_0;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  Interrupt priority grouping
      PRIGROUP       : SystemControl_AIRCR_PRIGROUP_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : HAL.UInt4 := 16#0#;
      --  Data endianness, 0=little, 1=big
      ENDIANNESS     : AIRCR_ENDIANNESSSelect :=
                        SAM_SVD.SystemControl.VALUE_0;
      --  Register key
      VECTKEY        : SystemControl_AIRCR_VECTKEY_Field := 16#FA05#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_AIRCR_Register use record
      VECTRESET      at 0 range 0 .. 0;
      VECTCLRACTIVE  at 0 range 1 .. 1;
      SYSRESETREQ    at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      PRIGROUP       at 0 range 8 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      ENDIANNESS     at 0 range 15 .. 15;
      VECTKEY        at 0 range 16 .. 31;
   end record;

   --  Sleep-on-exit on handler return
   type SCR_SLEEPONEXITSelect is
     (--  Do not sleep when returning to Thread mode
      VALUE_0,
      --  Enter sleep, or deep sleep, on return from an ISR
      VALUE_1)
     with Size => 1;
   for SCR_SLEEPONEXITSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  Deep Sleep used as low power mode
   type SCR_SLEEPDEEPSelect is
     (--  Sleep
      VALUE_0,
      --  Deep sleep
      VALUE_1)
     with Size => 1;
   for SCR_SLEEPDEEPSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  Send Event on Pending bit
   type SCR_SEVONPENDSelect is
     (--  Only enabled interrupts or events can wakeup the processor, disabled
--  interrupts are excluded
      VALUE_0,
      --  Enabled events and all interrupts, including disabled interrupts, can
--  wakeup the processor
      VALUE_1)
     with Size => 1;
   for SCR_SEVONPENDSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  System Control Register
   type SystemControl_SCR_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  Sleep-on-exit on handler return
      SLEEPONEXIT   : SCR_SLEEPONEXITSelect := SAM_SVD.SystemControl.VALUE_0;
      --  Deep Sleep used as low power mode
      SLEEPDEEP     : SCR_SLEEPDEEPSelect := SAM_SVD.SystemControl.VALUE_0;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  Send Event on Pending bit
      SEVONPEND     : SCR_SEVONPENDSelect := SAM_SVD.SystemControl.VALUE_0;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_SCR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SLEEPONEXIT   at 0 range 1 .. 1;
      SLEEPDEEP     at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      SEVONPEND     at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  Enables unaligned access traps
   type CCR_UNALIGN_TRPSelect is
     (--  Do not trap unaligned halfword and word accesses
      VALUE_0,
      --  Trap unaligned halfword and word accesses
      VALUE_1)
     with Size => 1;
   for CCR_UNALIGN_TRPSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  Indicates stack alignment on exception entry
   type CCR_STKALIGNSelect is
     (--  4-byte aligned
      VALUE_0,
      --  8-byte aligned
      VALUE_1)
     with Size => 1;
   for CCR_STKALIGNSelect use
     (VALUE_0 => 0,
      VALUE_1 => 1);

   --  Configuration and Control Register
   type SystemControl_CCR_Register is record
      --  Indicates how processor enters Thread mode
      NONBASETHRDENA : Boolean := False;
      --  Enables unprivileged software access to STIR register
      USERSETMPEND   : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  Enables unaligned access traps
      UNALIGN_TRP    : CCR_UNALIGN_TRPSelect := SAM_SVD.SystemControl.VALUE_0;
      --  Enables divide by 0 trap
      DIV_0_TRP      : Boolean := False;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Ignore LDM/STM BusFault for -1/-2 priority handlers
      BFHFNMIGN      : Boolean := False;
      --  Indicates stack alignment on exception entry
      STKALIGN       : CCR_STKALIGNSelect := SAM_SVD.SystemControl.VALUE_1;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_CCR_Register use record
      NONBASETHRDENA at 0 range 0 .. 0;
      USERSETMPEND   at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      UNALIGN_TRP    at 0 range 3 .. 3;
      DIV_0_TRP      at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      BFHFNMIGN      at 0 range 8 .. 8;
      STKALIGN       at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SystemControl_SHPR1_PRI_4_Field is HAL.UInt8;
   subtype SystemControl_SHPR1_PRI_5_Field is HAL.UInt8;
   subtype SystemControl_SHPR1_PRI_6_Field is HAL.UInt8;

   --  System Handler Priority Register 1
   type SystemControl_SHPR1_Register is record
      --  Priority of system handler 4, MemManage
      PRI_4          : SystemControl_SHPR1_PRI_4_Field := 16#0#;
      --  Priority of system handler 5, BusFault
      PRI_5          : SystemControl_SHPR1_PRI_5_Field := 16#0#;
      --  Priority of system handler 6, UsageFault
      PRI_6          : SystemControl_SHPR1_PRI_6_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_SHPR1_Register use record
      PRI_4          at 0 range 0 .. 7;
      PRI_5          at 0 range 8 .. 15;
      PRI_6          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SystemControl_SHPR2_PRI_11_Field is HAL.UInt8;

   --  System Handler Priority Register 2
   type SystemControl_SHPR2_Register is record
      --  unspecified
      Reserved_0_23 : HAL.UInt24 := 16#0#;
      --  Priority of system handler 11, SVCall
      PRI_11        : SystemControl_SHPR2_PRI_11_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_SHPR2_Register use record
      Reserved_0_23 at 0 range 0 .. 23;
      PRI_11        at 0 range 24 .. 31;
   end record;

   subtype SystemControl_SHPR3_PRI_14_Field is HAL.UInt8;
   subtype SystemControl_SHPR3_PRI_15_Field is HAL.UInt8;

   --  System Handler Priority Register 3
   type SystemControl_SHPR3_Register is record
      --  unspecified
      Reserved_0_15 : HAL.UInt16 := 16#0#;
      --  Priority of system handler 14, PendSV
      PRI_14        : SystemControl_SHPR3_PRI_14_Field := 16#0#;
      --  Priority of system handler 15, SysTick exception
      PRI_15        : SystemControl_SHPR3_PRI_15_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_SHPR3_Register use record
      Reserved_0_15 at 0 range 0 .. 15;
      PRI_14        at 0 range 16 .. 23;
      PRI_15        at 0 range 24 .. 31;
   end record;

   --  System Handler Control and State Register
   type SystemControl_SHCSR_Register is record
      --  MemManage exception active bit
      MEMFAULTACT    : Boolean := False;
      --  BusFault exception active bit
      BUSFAULTACT    : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  UsageFault exception active bit
      USGFAULTACT    : Boolean := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  SVCall active bit
      SVCALLACT      : Boolean := False;
      --  DebugMonitor exception active bit
      MONITORACT     : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  PendSV exception active bit
      PENDSVACT      : Boolean := False;
      --  SysTick exception active bit
      SYSTICKACT     : Boolean := False;
      --  UsageFault exception pending bit
      USGFAULTPENDED : Boolean := False;
      --  MemManage exception pending bit
      MEMFAULTPENDED : Boolean := False;
      --  BusFault exception pending bit
      BUSFAULTPENDED : Boolean := False;
      --  SVCall pending bit
      SVCALLPENDED   : Boolean := False;
      --  MemManage enable bit
      MEMFAULTENA    : Boolean := False;
      --  BusFault enable bit
      BUSFAULTENA    : Boolean := False;
      --  UsageFault enable bit
      USGFAULTENA    : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_SHCSR_Register use record
      MEMFAULTACT    at 0 range 0 .. 0;
      BUSFAULTACT    at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      USGFAULTACT    at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      SVCALLACT      at 0 range 7 .. 7;
      MONITORACT     at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      PENDSVACT      at 0 range 10 .. 10;
      SYSTICKACT     at 0 range 11 .. 11;
      USGFAULTPENDED at 0 range 12 .. 12;
      MEMFAULTPENDED at 0 range 13 .. 13;
      BUSFAULTPENDED at 0 range 14 .. 14;
      SVCALLPENDED   at 0 range 15 .. 15;
      MEMFAULTENA    at 0 range 16 .. 16;
      BUSFAULTENA    at 0 range 17 .. 17;
      USGFAULTENA    at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  Configurable Fault Status Register
   type SystemControl_CFSR_Register is record
      --  Instruction access violation
      IACCVIOL       : Boolean := False;
      --  Data access violation
      DACCVIOL       : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  MemManage Fault on unstacking for exception return
      MUNSTKERR      : Boolean := False;
      --  MemManage Fault on stacking for exception entry
      MSTKERR        : Boolean := False;
      --  MemManager Fault occured during FP lazy state preservation
      MLSPERR        : Boolean := False;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  MemManage Fault Address Register valid
      MMARVALID      : Boolean := False;
      --  Instruction bus error
      IBUSERR        : Boolean := False;
      --  Precise data bus error
      PRECISERR      : Boolean := False;
      --  Imprecise data bus error
      IMPRECISERR    : Boolean := False;
      --  BusFault on unstacking for exception return
      UNSTKERR       : Boolean := False;
      --  BusFault on stacking for exception entry
      STKERR         : Boolean := False;
      --  BusFault occured during FP lazy state preservation
      LSPERR         : Boolean := False;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  BusFault Address Register valid
      BFARVALID      : Boolean := False;
      --  Undefined instruction UsageFault
      UNDEFINSTR     : Boolean := False;
      --  Invalid state UsageFault
      INVSTATE       : Boolean := False;
      --  Invalid PC load UsageFault
      INVPC          : Boolean := False;
      --  No coprocessor UsageFault
      NOCP           : Boolean := False;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  Unaligned access UsageFault
      UNALIGNED      : Boolean := False;
      --  Divide by zero UsageFault
      DIVBYZERO      : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_CFSR_Register use record
      IACCVIOL       at 0 range 0 .. 0;
      DACCVIOL       at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      MUNSTKERR      at 0 range 3 .. 3;
      MSTKERR        at 0 range 4 .. 4;
      MLSPERR        at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      MMARVALID      at 0 range 7 .. 7;
      IBUSERR        at 0 range 8 .. 8;
      PRECISERR      at 0 range 9 .. 9;
      IMPRECISERR    at 0 range 10 .. 10;
      UNSTKERR       at 0 range 11 .. 11;
      STKERR         at 0 range 12 .. 12;
      LSPERR         at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      BFARVALID      at 0 range 15 .. 15;
      UNDEFINSTR     at 0 range 16 .. 16;
      INVSTATE       at 0 range 17 .. 17;
      INVPC          at 0 range 18 .. 18;
      NOCP           at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      UNALIGNED      at 0 range 24 .. 24;
      DIVBYZERO      at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   --  HardFault Status Register
   type SystemControl_HFSR_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  BusFault on a Vector Table read during exception processing
      VECTTBL       : Boolean := False;
      --  unspecified
      Reserved_2_29 : HAL.UInt28 := 16#0#;
      --  Forced Hard Fault
      FORCED        : Boolean := False;
      --  Debug: always write 0
      DEBUGEVT      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_HFSR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      VECTTBL       at 0 range 1 .. 1;
      Reserved_2_29 at 0 range 2 .. 29;
      FORCED        at 0 range 30 .. 30;
      DEBUGEVT      at 0 range 31 .. 31;
   end record;

   --  Debug Fault Status Register
   type SystemControl_DFSR_Register is record
      HALTED        : Boolean := False;
      BKPT          : Boolean := False;
      DWTTRAP       : Boolean := False;
      VCATCH        : Boolean := False;
      EXTERNAL      : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_DFSR_Register use record
      HALTED        at 0 range 0 .. 0;
      BKPT          at 0 range 1 .. 1;
      DWTTRAP       at 0 range 2 .. 2;
      VCATCH        at 0 range 3 .. 3;
      EXTERNAL      at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  Processor Feature Register

   --  Processor Feature Register
   type SystemControl_PFR_Registers is array (0 .. 1) of HAL.UInt32;

   --  Memory Model Feature Register

   --  Memory Model Feature Register
   type SystemControl_MMFR_Registers is array (0 .. 3) of HAL.UInt32;

   --  Instruction Set Attributes Register

   --  Instruction Set Attributes Register
   type SystemControl_ISAR_Registers is array (0 .. 4) of HAL.UInt32;

   --  Access privileges for coprocessor 10
   type CPACR_CP10Select is
     (--  Access denied
      DENIED,
      --  Privileged access only
      PRIV,
      --  Full access
      FULL)
     with Size => 2;
   for CPACR_CP10Select use
     (DENIED => 0,
      PRIV => 1,
      FULL => 3);

   --  Access privileges for coprocessor 11
   type CPACR_CP11Select is
     (--  Access denied
      DENIED,
      --  Privileged access only
      PRIV,
      --  Full access
      FULL)
     with Size => 2;
   for CPACR_CP11Select use
     (DENIED => 0,
      PRIV => 1,
      FULL => 3);

   --  Coprocessor Access Control Register
   type SystemControl_CPACR_Register is record
      --  unspecified
      Reserved_0_19  : HAL.UInt20 := 16#0#;
      --  Access privileges for coprocessor 10
      CP10           : CPACR_CP10Select := SAM_SVD.SystemControl.DENIED;
      --  Access privileges for coprocessor 11
      CP11           : CPACR_CP11Select := SAM_SVD.SystemControl.DENIED;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SystemControl_CPACR_Register use record
      Reserved_0_19  at 0 range 0 .. 19;
      CP10           at 0 range 20 .. 21;
      CP11           at 0 range 22 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System Control Registers
   type SystemControl_Peripheral is record
      --  Interrupt Controller Type Register
      ICTR  : aliased SystemControl_ICTR_Register;
      --  Auxiliary Control Register
      ACTLR : aliased SystemControl_ACTLR_Register;
      --  CPUID Base Register
      CPUID : aliased SystemControl_CPUID_Register;
      --  Interrupt Control and State Register
      ICSR  : aliased SystemControl_ICSR_Register;
      --  Vector Table Offset Register
      VTOR  : aliased SystemControl_VTOR_Register;
      --  Application Interrupt and Reset Control Register
      AIRCR : aliased SystemControl_AIRCR_Register;
      --  System Control Register
      SCR   : aliased SystemControl_SCR_Register;
      --  Configuration and Control Register
      CCR   : aliased SystemControl_CCR_Register;
      --  System Handler Priority Register 1
      SHPR1 : aliased SystemControl_SHPR1_Register;
      --  System Handler Priority Register 2
      SHPR2 : aliased SystemControl_SHPR2_Register;
      --  System Handler Priority Register 3
      SHPR3 : aliased SystemControl_SHPR3_Register;
      --  System Handler Control and State Register
      SHCSR : aliased SystemControl_SHCSR_Register;
      --  Configurable Fault Status Register
      CFSR  : aliased SystemControl_CFSR_Register;
      --  HardFault Status Register
      HFSR  : aliased SystemControl_HFSR_Register;
      --  Debug Fault Status Register
      DFSR  : aliased SystemControl_DFSR_Register;
      --  MemManage Fault Address Register
      MMFAR : aliased HAL.UInt32;
      --  BusFault Address Register
      BFAR  : aliased HAL.UInt32;
      --  Auxiliary Fault Status Register
      AFSR  : aliased HAL.UInt32;
      --  Processor Feature Register
      PFR   : aliased SystemControl_PFR_Registers;
      --  Debug Feature Register
      DFR   : aliased HAL.UInt32;
      --  Auxiliary Feature Register
      ADR   : aliased HAL.UInt32;
      --  Memory Model Feature Register
      MMFR  : aliased SystemControl_MMFR_Registers;
      --  Instruction Set Attributes Register
      ISAR  : aliased SystemControl_ISAR_Registers;
      --  Coprocessor Access Control Register
      CPACR : aliased SystemControl_CPACR_Register;
   end record
     with Volatile;

   for SystemControl_Peripheral use record
      ICTR  at 16#4# range 0 .. 31;
      ACTLR at 16#8# range 0 .. 31;
      CPUID at 16#D00# range 0 .. 31;
      ICSR  at 16#D04# range 0 .. 31;
      VTOR  at 16#D08# range 0 .. 31;
      AIRCR at 16#D0C# range 0 .. 31;
      SCR   at 16#D10# range 0 .. 31;
      CCR   at 16#D14# range 0 .. 31;
      SHPR1 at 16#D18# range 0 .. 31;
      SHPR2 at 16#D1C# range 0 .. 31;
      SHPR3 at 16#D20# range 0 .. 31;
      SHCSR at 16#D24# range 0 .. 31;
      CFSR  at 16#D28# range 0 .. 31;
      HFSR  at 16#D2C# range 0 .. 31;
      DFSR  at 16#D30# range 0 .. 31;
      MMFAR at 16#D34# range 0 .. 31;
      BFAR  at 16#D38# range 0 .. 31;
      AFSR  at 16#D3C# range 0 .. 31;
      PFR   at 16#D40# range 0 .. 63;
      DFR   at 16#D48# range 0 .. 31;
      ADR   at 16#D4C# range 0 .. 31;
      MMFR  at 16#D50# range 0 .. 127;
      ISAR  at 16#D60# range 0 .. 159;
      CPACR at 16#D88# range 0 .. 31;
   end record;

   --  System Control Registers
   SystemControl_Periph : aliased SystemControl_Peripheral
     with Import, Address => SystemControl_Base;

end SAM_SVD.SystemControl;
