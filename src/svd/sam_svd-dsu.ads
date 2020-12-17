pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.DSU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type DSU_CTRL_Register is record
      --  Write-only. Software Reset
      SWRST        : Boolean := False;
      --  unspecified
      Reserved_1_1 : HAL.Bit := 16#0#;
      --  Write-only. 32-bit Cyclic Redundancy Code
      CRC          : Boolean := False;
      --  Write-only. Memory built-in self-test
      MBIST        : Boolean := False;
      --  Write-only. Chip-Erase
      CE           : Boolean := False;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Auxiliary Row Read
      ARR          : Boolean := False;
      --  Write-only. Start Memory Stream Access
      SMSA         : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DSU_CTRL_Register use record
      SWRST        at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      CRC          at 0 range 2 .. 2;
      MBIST        at 0 range 3 .. 3;
      CE           at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      ARR          at 0 range 6 .. 6;
      SMSA         at 0 range 7 .. 7;
   end record;

   --  Status A
   type DSU_STATUSA_Register is record
      --  Done
      DONE         : Boolean := False;
      --  CPU Reset Phase Extension
      CRSTEXT      : Boolean := False;
      --  Bus Error
      BERR         : Boolean := False;
      --  Failure
      FAIL         : Boolean := False;
      --  Protection Error
      PERR         : Boolean := False;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DSU_STATUSA_Register use record
      DONE         at 0 range 0 .. 0;
      CRSTEXT      at 0 range 1 .. 1;
      BERR         at 0 range 2 .. 2;
      FAIL         at 0 range 3 .. 3;
      PERR         at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  DSU_STATUSB_DCCD array
   type DSU_STATUSB_DCCD_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for DSU_STATUSB_DCCD
   type DSU_STATUSB_DCCD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DCCD as a value
            Val : HAL.UInt2;
         when True =>
            --  DCCD as an array
            Arr : DSU_STATUSB_DCCD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DSU_STATUSB_DCCD_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DSU_STATUSB_TDCCD array
   type DSU_STATUSB_TDCCD_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for DSU_STATUSB_TDCCD
   type DSU_STATUSB_TDCCD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TDCCD as a value
            Val : HAL.UInt2;
         when True =>
            --  TDCCD as an array
            Arr : DSU_STATUSB_TDCCD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DSU_STATUSB_TDCCD_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Status B
   type DSU_STATUSB_Register is record
      --  Read-only. Protected
      PROT    : Boolean;
      --  Read-only. Debugger Present
      DBGPRES : Boolean;
      --  Read-only. Debug Communication Channel 0 Dirty
      DCCD    : DSU_STATUSB_DCCD_Field;
      --  Read-only. Hot-Plugging Enable
      HPE     : Boolean;
      --  Read-only. Chip Erase Locked
      CELCK   : Boolean;
      --  Read-only. Test Debug Communication Channel 0 Dirty
      TDCCD   : DSU_STATUSB_TDCCD_Field;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DSU_STATUSB_Register use record
      PROT    at 0 range 0 .. 0;
      DBGPRES at 0 range 1 .. 1;
      DCCD    at 0 range 2 .. 3;
      HPE     at 0 range 4 .. 4;
      CELCK   at 0 range 5 .. 5;
      TDCCD   at 0 range 6 .. 7;
   end record;

   subtype DSU_ADDR_AMOD_Field is HAL.UInt2;
   subtype DSU_ADDR_ADDR_Field is HAL.UInt30;

   --  Address
   type DSU_ADDR_Register is record
      --  Access Mode
      AMOD : DSU_ADDR_AMOD_Field := 16#0#;
      --  Address
      ADDR : DSU_ADDR_ADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_ADDR_Register use record
      AMOD at 0 range 0 .. 1;
      ADDR at 0 range 2 .. 31;
   end record;

   subtype DSU_LENGTH_LENGTH_Field is HAL.UInt30;

   --  Length
   type DSU_LENGTH_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2 := 16#0#;
      --  Length
      LENGTH       : DSU_LENGTH_LENGTH_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_LENGTH_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      LENGTH       at 0 range 2 .. 31;
   end record;

   --  Debug Communication Channel n

   --  Debug Communication Channel n
   type DSU_DCC_Registers is array (0 .. 1) of HAL.UInt32;

   subtype DSU_DID_DEVSEL_Field is HAL.UInt8;
   subtype DSU_DID_REVISION_Field is HAL.UInt4;
   subtype DSU_DID_DIE_Field is HAL.UInt4;

   --  Series
   type DID_SERIESSelect is
     (--  Cortex-M0+ processor, basic feature set
      Val_0,
      --  Cortex-M0+ processor, USB
      Val_1)
     with Size => 6;
   for DID_SERIESSelect use
     (Val_0 => 0,
      Val_1 => 1);

   --  Family
   type DID_FAMILYSelect is
     (--  General purpose microcontroller
      Val_0,
      --  PicoPower
      Val_1)
     with Size => 5;
   for DID_FAMILYSelect use
     (Val_0 => 0,
      Val_1 => 1);

   --  Processor
   type DID_PROCESSORSelect is
     (--  Cortex-M0+
      CM0P,
      --  Cortex-M23
      CM23,
      --  Cortex-M3
      CM3,
      --  Cortex-M4
      CM4,
      --  Cortex-M4 with FPU
      CM4F,
      --  Cortex-M33
      CM33)
     with Size => 4;
   for DID_PROCESSORSelect use
     (CM0P => 1,
      CM23 => 2,
      CM3 => 3,
      CM4 => 5,
      CM4F => 6,
      CM33 => 7);

   --  Device Identification
   type DSU_DID_Register is record
      --  Read-only. Device Select
      DEVSEL         : DSU_DID_DEVSEL_Field;
      --  Read-only. Revision Number
      REVISION       : DSU_DID_REVISION_Field;
      --  Read-only. Die Number
      DIE            : DSU_DID_DIE_Field;
      --  Read-only. Series
      SERIES         : DID_SERIESSelect;
      --  unspecified
      Reserved_22_22 : HAL.Bit;
      --  Read-only. Family
      FAMILY         : DID_FAMILYSelect;
      --  Read-only. Processor
      PROCESSOR      : DID_PROCESSORSelect;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_DID_Register use record
      DEVSEL         at 0 range 0 .. 7;
      REVISION       at 0 range 8 .. 11;
      DIE            at 0 range 12 .. 15;
      SERIES         at 0 range 16 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      FAMILY         at 0 range 23 .. 27;
      PROCESSOR      at 0 range 28 .. 31;
   end record;

   subtype DSU_CFG_LQOS_Field is HAL.UInt2;

   --  DMA Trigger Level
   type CFG_DCCDMALEVELSelect is
     (--  Trigger rises when DCC is empty
      EMPTY,
      --  Trigger rises when DCC is full
      FULL)
     with Size => 2;
   for CFG_DCCDMALEVELSelect use
     (EMPTY => 0,
      FULL => 1);

   --  Configuration
   type DSU_CFG_Register is record
      --  Latency Quality Of Service
      LQOS          : DSU_CFG_LQOS_Field := 16#2#;
      --  DMA Trigger Level
      DCCDMALEVEL   : CFG_DCCDMALEVELSelect := SAM_SVD.DSU.EMPTY;
      --  Trace Control
      ETBRAMEN      : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_CFG_Register use record
      LQOS          at 0 range 0 .. 1;
      DCCDMALEVEL   at 0 range 2 .. 3;
      ETBRAMEN      at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  Device Configuration

   --  Device Configuration
   type DSU_DCFG_Registers is array (0 .. 1) of HAL.UInt32;

   subtype DSU_ENTRY0_ADDOFF_Field is HAL.UInt20;

   --  CoreSight ROM Table Entry 0
   type DSU_ENTRY0_Register is record
      --  Read-only. Entry Present
      EPRES         : Boolean;
      --  Read-only. Format
      FMT           : Boolean;
      --  unspecified
      Reserved_2_11 : HAL.UInt10;
      --  Read-only. Address Offset
      ADDOFF        : DSU_ENTRY0_ADDOFF_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_ENTRY0_Register use record
      EPRES         at 0 range 0 .. 0;
      FMT           at 0 range 1 .. 1;
      Reserved_2_11 at 0 range 2 .. 11;
      ADDOFF        at 0 range 12 .. 31;
   end record;

   --  CoreSight ROM Table Memory Type
   type DSU_MEMTYPE_Register is record
      --  Read-only. System Memory Present
      SMEMP         : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_MEMTYPE_Register use record
      SMEMP         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype DSU_PID4_JEPCC_Field is HAL.UInt4;
   subtype DSU_PID4_FKBC_Field is HAL.UInt4;

   --  Peripheral Identification 4
   type DSU_PID4_Register is record
      --  Read-only. JEP-106 Continuation Code
      JEPCC         : DSU_PID4_JEPCC_Field;
      --  Read-only. 4KB count
      FKBC          : DSU_PID4_FKBC_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_PID4_Register use record
      JEPCC         at 0 range 0 .. 3;
      FKBC          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_PID0_PARTNBL_Field is HAL.UInt8;

   --  Peripheral Identification 0
   type DSU_PID0_Register is record
      --  Read-only. Part Number Low
      PARTNBL       : DSU_PID0_PARTNBL_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_PID0_Register use record
      PARTNBL       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_PID1_PARTNBH_Field is HAL.UInt4;
   subtype DSU_PID1_JEPIDCL_Field is HAL.UInt4;

   --  Peripheral Identification 1
   type DSU_PID1_Register is record
      --  Read-only. Part Number High
      PARTNBH       : DSU_PID1_PARTNBH_Field;
      --  Read-only. Low part of the JEP-106 Identity Code
      JEPIDCL       : DSU_PID1_JEPIDCL_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_PID1_Register use record
      PARTNBH       at 0 range 0 .. 3;
      JEPIDCL       at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_PID2_JEPIDCH_Field is HAL.UInt3;
   subtype DSU_PID2_REVISION_Field is HAL.UInt4;

   --  Peripheral Identification 2
   type DSU_PID2_Register is record
      --  Read-only. JEP-106 Identity Code High
      JEPIDCH       : DSU_PID2_JEPIDCH_Field;
      --  Read-only. JEP-106 Identity Code is used
      JEPU          : Boolean;
      --  Read-only. Revision Number
      REVISION      : DSU_PID2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_PID2_Register use record
      JEPIDCH       at 0 range 0 .. 2;
      JEPU          at 0 range 3 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_PID3_CUSMOD_Field is HAL.UInt4;
   subtype DSU_PID3_REVAND_Field is HAL.UInt4;

   --  Peripheral Identification 3
   type DSU_PID3_Register is record
      --  Read-only. ARM CUSMOD
      CUSMOD        : DSU_PID3_CUSMOD_Field;
      --  Read-only. Revision Number
      REVAND        : DSU_PID3_REVAND_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_PID3_Register use record
      CUSMOD        at 0 range 0 .. 3;
      REVAND        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_CID0_PREAMBLEB0_Field is HAL.UInt8;

   --  Component Identification 0
   type DSU_CID0_Register is record
      --  Read-only. Preamble Byte 0
      PREAMBLEB0    : DSU_CID0_PREAMBLEB0_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_CID0_Register use record
      PREAMBLEB0    at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_CID1_PREAMBLE_Field is HAL.UInt4;
   subtype DSU_CID1_CCLASS_Field is HAL.UInt4;

   --  Component Identification 1
   type DSU_CID1_Register is record
      --  Read-only. Preamble
      PREAMBLE      : DSU_CID1_PREAMBLE_Field;
      --  Read-only. Component Class
      CCLASS        : DSU_CID1_CCLASS_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_CID1_Register use record
      PREAMBLE      at 0 range 0 .. 3;
      CCLASS        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_CID2_PREAMBLEB2_Field is HAL.UInt8;

   --  Component Identification 2
   type DSU_CID2_Register is record
      --  Read-only. Preamble Byte 2
      PREAMBLEB2    : DSU_CID2_PREAMBLEB2_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_CID2_Register use record
      PREAMBLEB2    at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DSU_CID3_PREAMBLEB3_Field is HAL.UInt8;

   --  Component Identification 3
   type DSU_CID3_Register is record
      --  Read-only. Preamble Byte 3
      PREAMBLEB3    : DSU_CID3_PREAMBLEB3_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSU_CID3_Register use record
      PREAMBLEB3    at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Device Service Unit
   type DSU_Peripheral is record
      --  Control
      CTRL    : aliased DSU_CTRL_Register;
      --  Status A
      STATUSA : aliased DSU_STATUSA_Register;
      --  Status B
      STATUSB : aliased DSU_STATUSB_Register;
      --  Address
      ADDR    : aliased DSU_ADDR_Register;
      --  Length
      LENGTH  : aliased DSU_LENGTH_Register;
      --  Data
      DATA    : aliased HAL.UInt32;
      --  Debug Communication Channel n
      DCC     : aliased DSU_DCC_Registers;
      --  Device Identification
      DID     : aliased DSU_DID_Register;
      --  Configuration
      CFG     : aliased DSU_CFG_Register;
      --  Device Configuration
      DCFG    : aliased DSU_DCFG_Registers;
      --  CoreSight ROM Table Entry 0
      ENTRY0  : aliased DSU_ENTRY0_Register;
      --  CoreSight ROM Table Entry 1
      ENTRY1  : aliased HAL.UInt32;
      --  CoreSight ROM Table End
      END_k   : aliased HAL.UInt32;
      --  CoreSight ROM Table Memory Type
      MEMTYPE : aliased DSU_MEMTYPE_Register;
      --  Peripheral Identification 4
      PID4    : aliased DSU_PID4_Register;
      --  Peripheral Identification 5
      PID5    : aliased HAL.UInt32;
      --  Peripheral Identification 6
      PID6    : aliased HAL.UInt32;
      --  Peripheral Identification 7
      PID7    : aliased HAL.UInt32;
      --  Peripheral Identification 0
      PID0    : aliased DSU_PID0_Register;
      --  Peripheral Identification 1
      PID1    : aliased DSU_PID1_Register;
      --  Peripheral Identification 2
      PID2    : aliased DSU_PID2_Register;
      --  Peripheral Identification 3
      PID3    : aliased DSU_PID3_Register;
      --  Component Identification 0
      CID0    : aliased DSU_CID0_Register;
      --  Component Identification 1
      CID1    : aliased DSU_CID1_Register;
      --  Component Identification 2
      CID2    : aliased DSU_CID2_Register;
      --  Component Identification 3
      CID3    : aliased DSU_CID3_Register;
   end record
     with Volatile;

   for DSU_Peripheral use record
      CTRL    at 16#0# range 0 .. 7;
      STATUSA at 16#1# range 0 .. 7;
      STATUSB at 16#2# range 0 .. 7;
      ADDR    at 16#4# range 0 .. 31;
      LENGTH  at 16#8# range 0 .. 31;
      DATA    at 16#C# range 0 .. 31;
      DCC     at 16#10# range 0 .. 63;
      DID     at 16#18# range 0 .. 31;
      CFG     at 16#1C# range 0 .. 31;
      DCFG    at 16#F0# range 0 .. 63;
      ENTRY0  at 16#1000# range 0 .. 31;
      ENTRY1  at 16#1004# range 0 .. 31;
      END_k   at 16#1008# range 0 .. 31;
      MEMTYPE at 16#1FCC# range 0 .. 31;
      PID4    at 16#1FD0# range 0 .. 31;
      PID5    at 16#1FD4# range 0 .. 31;
      PID6    at 16#1FD8# range 0 .. 31;
      PID7    at 16#1FDC# range 0 .. 31;
      PID0    at 16#1FE0# range 0 .. 31;
      PID1    at 16#1FE4# range 0 .. 31;
      PID2    at 16#1FE8# range 0 .. 31;
      PID3    at 16#1FEC# range 0 .. 31;
      CID0    at 16#1FF0# range 0 .. 31;
      CID1    at 16#1FF4# range 0 .. 31;
      CID2    at 16#1FF8# range 0 .. 31;
      CID3    at 16#1FFC# range 0 .. 31;
   end record;

   --  Device Service Unit
   DSU_Periph : aliased DSU_Peripheral
     with Import, Address => DSU_Base;

end SAM_SVD.DSU;
