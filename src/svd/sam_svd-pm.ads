pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.PM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control A
   type PM_CTRLA_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2 := 16#0#;
      --  I/O Retention
      IORET        : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_CTRLA_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      IORET        at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Sleep Mode
   type SLEEPCFG_SLEEPMODESelect is
     (--  CPU, AHBx, and APBx clocks are OFF
      IDLE,
      --  All Clocks are OFF
      STANDBY,
      --  Backup domain is ON as well as some PDRAMs
      HIBERNATE,
      --  Only Backup domain is powered ON
      BACKUP,
      --  All power domains are powered OFF
      OFF)
     with Size => 3;
   for SLEEPCFG_SLEEPMODESelect use
     (IDLE => 2,
      STANDBY => 4,
      HIBERNATE => 5,
      BACKUP => 6,
      OFF => 7);

   --  Sleep Configuration
   type PM_SLEEPCFG_Register is record
      --  Sleep Mode
      SLEEPMODE    : SLEEPCFG_SLEEPMODESelect := SAM_SVD.PM.IDLE;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_SLEEPCFG_Register use record
      SLEEPMODE    at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Interrupt Enable Clear
   type PM_INTENCLR_Register is record
      --  Sleep Mode Entry Ready Enable
      SLEEPRDY     : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_INTENCLR_Register use record
      SLEEPRDY     at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Set
   type PM_INTENSET_Register is record
      --  Sleep Mode Entry Ready Enable
      SLEEPRDY     : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_INTENSET_Register use record
      SLEEPRDY     at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type PM_INTFLAG_Register is record
      --  Sleep Mode Entry Ready
      SLEEPRDY     : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_INTFLAG_Register use record
      SLEEPRDY     at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Ram Configuration
   type STDBYCFG_RAMCFGSelect is
     (--  All the system RAM is retained
      RET,
      --  Only the first 32Kbytes of the system RAM is retained
      PARTIAL,
      --  All the system RAM is turned OFF
      OFF)
     with Size => 2;
   for STDBYCFG_RAMCFGSelect use
     (RET => 0,
      PARTIAL => 1,
      OFF => 2);

   --  Fast Wakeup
   type STDBYCFG_FASTWKUPSelect is
     (--  Fast Wakeup is disabled
      NO,
      --  Fast Wakeup is enabled on NVM
      NVM,
      --  Fast Wakeup is enabled on the main voltage regulator (MAINVREG)
      MAINVREG,
      --  Fast Wakeup is enabled on both NVM and MAINVREG
      BOTH)
     with Size => 2;
   for STDBYCFG_FASTWKUPSelect use
     (NO => 0,
      NVM => 1,
      MAINVREG => 2,
      BOTH => 3);

   --  Standby Configuration
   type PM_STDBYCFG_Register is record
      --  Ram Configuration
      RAMCFG       : STDBYCFG_RAMCFGSelect := SAM_SVD.PM.RET;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  Fast Wakeup
      FASTWKUP     : STDBYCFG_FASTWKUPSelect := SAM_SVD.PM.NO;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_STDBYCFG_Register use record
      RAMCFG       at 0 range 0 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      FASTWKUP     at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Ram Configuration
   type HIBCFG_RAMCFGSelect is
     (--  All the system RAM is retained
      RET,
      --  Only the first 32Kbytes of the system RAM is retained
      PARTIAL,
      --  All the system RAM is turned OFF
      OFF)
     with Size => 2;
   for HIBCFG_RAMCFGSelect use
     (RET => 0,
      PARTIAL => 1,
      OFF => 2);

   --  Backup Ram Configuration
   type HIBCFG_BRAMCFGSelect is
     (--  All the backup RAM is retained
      RET,
      --  Only the first 4Kbytes of the backup RAM is retained
      PARTIAL,
      --  All the backup RAM is turned OFF
      OFF)
     with Size => 2;
   for HIBCFG_BRAMCFGSelect use
     (RET => 0,
      PARTIAL => 1,
      OFF => 2);

   --  Hibernate Configuration
   type PM_HIBCFG_Register is record
      --  Ram Configuration
      RAMCFG       : HIBCFG_RAMCFGSelect := SAM_SVD.PM.RET;
      --  Backup Ram Configuration
      BRAMCFG      : HIBCFG_BRAMCFGSelect := SAM_SVD.PM.RET;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_HIBCFG_Register use record
      RAMCFG       at 0 range 0 .. 1;
      BRAMCFG      at 0 range 2 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Ram Configuration
   type BKUPCFG_BRAMCFGSelect is
     (--  All the backup RAM is retained
      RET,
      --  Only the first 4Kbytes of the backup RAM is retained
      PARTIAL,
      --  All the backup RAM is turned OFF
      OFF)
     with Size => 2;
   for BKUPCFG_BRAMCFGSelect use
     (RET => 0,
      PARTIAL => 1,
      OFF => 2);

   --  Backup Configuration
   type PM_BKUPCFG_Register is record
      --  Ram Configuration
      BRAMCFG      : BKUPCFG_BRAMCFGSelect := SAM_SVD.PM.RET;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_BKUPCFG_Register use record
      BRAMCFG      at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   subtype PM_PWSAKDLY_DLYVAL_Field is HAL.UInt7;

   --  Power Switch Acknowledge Delay
   type PM_PWSAKDLY_Register is record
      --  Delay Value
      DLYVAL : PM_PWSAKDLY_DLYVAL_Field := 16#0#;
      --  Ignore Acknowledge
      IGNACK : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_PWSAKDLY_Register use record
      DLYVAL at 0 range 0 .. 6;
      IGNACK at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power Manager
   type PM_Peripheral is record
      --  Control A
      CTRLA    : aliased PM_CTRLA_Register;
      --  Sleep Configuration
      SLEEPCFG : aliased PM_SLEEPCFG_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased PM_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased PM_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased PM_INTFLAG_Register;
      --  Standby Configuration
      STDBYCFG : aliased PM_STDBYCFG_Register;
      --  Hibernate Configuration
      HIBCFG   : aliased PM_HIBCFG_Register;
      --  Backup Configuration
      BKUPCFG  : aliased PM_BKUPCFG_Register;
      --  Power Switch Acknowledge Delay
      PWSAKDLY : aliased PM_PWSAKDLY_Register;
   end record
     with Volatile;

   for PM_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      SLEEPCFG at 16#1# range 0 .. 7;
      INTENCLR at 16#4# range 0 .. 7;
      INTENSET at 16#5# range 0 .. 7;
      INTFLAG  at 16#6# range 0 .. 7;
      STDBYCFG at 16#8# range 0 .. 7;
      HIBCFG   at 16#9# range 0 .. 7;
      BKUPCFG  at 16#A# range 0 .. 7;
      PWSAKDLY at 16#12# range 0 .. 7;
   end record;

   --  Power Manager
   PM_Periph : aliased PM_Peripheral
     with Import, Address => PM_Base;

end SAM_SVD.PM;
