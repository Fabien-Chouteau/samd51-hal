pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.NVMCTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Write Mode
   type CTRLA_WMODESelect is
     (--  Manual Write
      MAN,
      --  Automatic Double Word Write
      ADW,
      --  Automatic Quad Word
      AQW,
      --  Automatic Page Write
      AP)
     with Size => 2;
   for CTRLA_WMODESelect use
     (MAN => 0,
      ADW => 1,
      AQW => 2,
      AP => 3);

   --  Power Reduction Mode during Sleep
   type CTRLA_PRMSelect is
     (--  NVM block enters low-power mode when entering standby mode. NVM block
--  enters low-power mode when SPRM command is issued. NVM block exits
--  low-power mode upon first access.
      SEMIAUTO,
      --  NVM block enters low-power mode when entering standby mode. NVM block
--  enters low-power mode when SPRM command is issued. NVM block exits
--  low-power mode when system is not in standby mode.
      FULLAUTO,
      --  NVM block does not enter low-power mode when entering standby mode. NVM
--  block enters low-power mode when SPRM command is issued. NVM block exits
--  low-power mode upon first access.
      MANUAL)
     with Size => 2;
   for CTRLA_PRMSelect use
     (SEMIAUTO => 0,
      FULLAUTO => 1,
      MANUAL => 3);

   subtype NVMCTRL_CTRLA_RWS_Field is HAL.UInt4;

   --  NVMCTRL_CTRLA_AHBNS array
   type NVMCTRL_CTRLA_AHBNS_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for NVMCTRL_CTRLA_AHBNS
   type NVMCTRL_CTRLA_AHBNS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  AHBNS as a value
            Val : HAL.UInt2;
         when True =>
            --  AHBNS as an array
            Arr : NVMCTRL_CTRLA_AHBNS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for NVMCTRL_CTRLA_AHBNS_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  NVMCTRL_CTRLA_CACHEDIS array
   type NVMCTRL_CTRLA_CACHEDIS_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for NVMCTRL_CTRLA_CACHEDIS
   type NVMCTRL_CTRLA_CACHEDIS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CACHEDIS as a value
            Val : HAL.UInt2;
         when True =>
            --  CACHEDIS as an array
            Arr : NVMCTRL_CTRLA_CACHEDIS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for NVMCTRL_CTRLA_CACHEDIS_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control A
   type NVMCTRL_CTRLA_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2 := 16#0#;
      --  Auto Wait State Enable
      AUTOWS       : Boolean := True;
      --  Suspend Enable
      SUSPEN       : Boolean := False;
      --  Write Mode
      WMODE        : CTRLA_WMODESelect := SAM_SVD.NVMCTRL.MAN;
      --  Power Reduction Mode during Sleep
      PRM          : CTRLA_PRMSelect := SAM_SVD.NVMCTRL.SEMIAUTO;
      --  NVM Read Wait States
      RWS          : NVMCTRL_CTRLA_RWS_Field := 16#0#;
      --  Force AHB0 access to NONSEQ, burst transfers are continuously
      --  rearbitrated
      AHBNS        : NVMCTRL_CTRLA_AHBNS_Field :=
                      (As_Array => False, Val => 16#0#);
      --  AHB0 Cache Disable
      CACHEDIS     : NVMCTRL_CTRLA_CACHEDIS_Field :=
                      (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_CTRLA_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      AUTOWS       at 0 range 2 .. 2;
      SUSPEN       at 0 range 3 .. 3;
      WMODE        at 0 range 4 .. 5;
      PRM          at 0 range 6 .. 7;
      RWS          at 0 range 8 .. 11;
      AHBNS        at 0 range 12 .. 13;
      CACHEDIS     at 0 range 14 .. 15;
   end record;

   --  Command
   type CTRLB_CMDSelect is
     (--  Erase Page - Only supported in the USER and AUX pages.
      EP,
      --  Erase Block - Erases the block addressed by the ADDR register, not
--  supported in the user page
      EB,
      --  Write Page - Writes the contents of the page buffer to the page addressed
--  by the ADDR register, not supported in the user page
      WP,
      --  Write Quad Word - Writes a 128-bit word at the location addressed by the
--  ADDR register.
      WQW,
      --  Software Reset - Power-Cycle the NVM memory and replay the device automatic
--  calibration procedure and resets the module configuration registers
      SWRST,
      --  Lock Region - Locks the region containing the address location in the ADDR
--  register.
      LR,
      --  Unlock Region - Unlocks the region containing the address location in the
--  ADDR register.
      UR,
      --  Sets the power reduction mode.
      SPRM,
      --  Clears the power reduction mode.
      CPRM,
      --  Page Buffer Clear - Clears the page buffer.
      PBC,
      --  Set Security Bit
      SSB,
      --  Bank swap and system reset, if SMEE is used also reallocate SMEE data into
--  the opposite BANK
      BKSWRST,
      --  Chip Erase Lock - DSU.CE command is not available
      CELCK,
      --  Chip Erase Unlock - DSU.CE command is available
      CEULCK,
      --  Sets STATUS.BPDIS, Boot loader protection is discarded until CBPDIS is
--  issued or next start-up sequence
      SBPDIS,
      --  Clears STATUS.BPDIS, Boot loader protection is not discarded
      CBPDIS,
      --  Activate SmartEEPROM Sector 0, deactivate Sector 1
      ASEES0,
      --  Activate SmartEEPROM Sector 1, deactivate Sector 0
      ASEES1,
      --  Starts SmartEEPROM sector reallocation algorithm
      SEERALOC,
      --  Flush SMEE data when in buffered mode
      SEEFLUSH,
      --  Lock access to SmartEEPROM data from any mean
      LSEE,
      --  Unlock access to SmartEEPROM data
      USEE,
      --  Lock access to the SmartEEPROM Register Address Space (above 64KB)
      LSEER,
      --  Unlock access to the SmartEEPROM Register Address Space (above 64KB)
      USEER)
     with Size => 7;
   for CTRLB_CMDSelect use
     (EP => 0,
      EB => 1,
      WP => 3,
      WQW => 4,
      SWRST => 16,
      LR => 17,
      UR => 18,
      SPRM => 19,
      CPRM => 20,
      PBC => 21,
      SSB => 22,
      BKSWRST => 23,
      CELCK => 24,
      CEULCK => 25,
      SBPDIS => 26,
      CBPDIS => 27,
      ASEES0 => 48,
      ASEES1 => 49,
      SEERALOC => 50,
      SEEFLUSH => 51,
      LSEE => 52,
      USEE => 53,
      LSEER => 54,
      USEER => 55);

   --  Command Execution
   type CTRLB_CMDEXSelect is
     (--  Reset value for the field
      CTRLB_CMDEXSelect_Reset,
      --  Execution Key
      KEY)
     with Size => 8;
   for CTRLB_CMDEXSelect use
     (CTRLB_CMDEXSelect_Reset => 0,
      KEY => 165);

   --  Control B
   type NVMCTRL_CTRLB_Register is record
      --  Write-only. Command
      CMD          : CTRLB_CMDSelect := SAM_SVD.NVMCTRL.EP;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
      --  Write-only. Command Execution
      CMDEX        : CTRLB_CMDEXSelect := CTRLB_CMDEXSelect_Reset;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_CTRLB_Register use record
      CMD          at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      CMDEX        at 0 range 8 .. 15;
   end record;

   subtype NVMCTRL_PARAM_NVMP_Field is HAL.UInt16;

   --  Page Size
   type PARAM_PSZSelect is
     (--  8 bytes
      Val_8,
      --  16 bytes
      Val_16,
      --  32 bytes
      Val_32,
      --  64 bytes
      Val_64,
      --  128 bytes
      Val_128,
      --  256 bytes
      Val_256,
      --  512 bytes
      Val_512,
      --  1024 bytes
      Val_1024)
     with Size => 3;
   for PARAM_PSZSelect use
     (Val_8 => 0,
      Val_16 => 1,
      Val_32 => 2,
      Val_64 => 3,
      Val_128 => 4,
      Val_256 => 5,
      Val_512 => 6,
      Val_1024 => 7);

   --  SmartEEPROM Supported
   type PARAM_SEESelect is
     (--  0 bytes
      Val_0,
      --  16384 bytes
      Val_1,
      --  32768 bytes
      Val_2,
      --  49152 bytes
      Val_3,
      --  65536 bytes
      Val_4,
      --  81920 bytes
      Val_5,
      --  98304 bytes
      Val_6,
      --  114688 bytes
      Val_7,
      --  131072 bytes
      Val_8,
      --  147456 bytes
      Val_9,
      --  163840 bytes
      A)
     with Size => 1;
   for PARAM_SEESelect use
     (Val_0 => 0,
      Val_1 => 1,
      Val_2 => 2,
      Val_3 => 3,
      Val_4 => 4,
      Val_5 => 5,
      Val_6 => 6,
      Val_7 => 7,
      Val_8 => 8,
      Val_9 => 9,
      A => 10);

   --  NVM Parameter
   type NVMCTRL_PARAM_Register is record
      --  Read-only. NVM Pages
      NVMP           : NVMCTRL_PARAM_NVMP_Field;
      --  Read-only. Page Size
      PSZ            : PARAM_PSZSelect;
      --  unspecified
      Reserved_19_30 : HAL.UInt12;
      --  Read-only. SmartEEPROM Supported
      SEE            : PARAM_SEESelect;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_PARAM_Register use record
      NVMP           at 0 range 0 .. 15;
      PSZ            at 0 range 16 .. 18;
      Reserved_19_30 at 0 range 19 .. 30;
      SEE            at 0 range 31 .. 31;
   end record;

   --  Interrupt Enable Clear
   type NVMCTRL_INTENCLR_Register is record
      --  Command Done Interrupt Clear
      DONE           : Boolean := False;
      --  Address Error
      ADDRE          : Boolean := False;
      --  Programming Error Interrupt Clear
      PROGE          : Boolean := False;
      --  Lock Error Interrupt Clear
      LOCKE          : Boolean := False;
      --  ECC Single Error Interrupt Clear
      ECCSE          : Boolean := False;
      --  ECC Dual Error Interrupt Clear
      ECCDE          : Boolean := False;
      --  NVM Error Interrupt Clear
      NVME           : Boolean := False;
      --  Suspended Write Or Erase Interrupt Clear
      SUSP           : Boolean := False;
      --  Active SEES Full Interrupt Clear
      SEESFULL       : Boolean := False;
      --  Active SEES Overflow Interrupt Clear
      SEESOVF        : Boolean := False;
      --  SEE Write Completed Interrupt Clear
      SEEWRC         : Boolean := False;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_INTENCLR_Register use record
      DONE           at 0 range 0 .. 0;
      ADDRE          at 0 range 1 .. 1;
      PROGE          at 0 range 2 .. 2;
      LOCKE          at 0 range 3 .. 3;
      ECCSE          at 0 range 4 .. 4;
      ECCDE          at 0 range 5 .. 5;
      NVME           at 0 range 6 .. 6;
      SUSP           at 0 range 7 .. 7;
      SEESFULL       at 0 range 8 .. 8;
      SEESOVF        at 0 range 9 .. 9;
      SEEWRC         at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  Interrupt Enable Set
   type NVMCTRL_INTENSET_Register is record
      --  Command Done Interrupt Enable
      DONE           : Boolean := False;
      --  Address Error Interrupt Enable
      ADDRE          : Boolean := False;
      --  Programming Error Interrupt Enable
      PROGE          : Boolean := False;
      --  Lock Error Interrupt Enable
      LOCKE          : Boolean := False;
      --  ECC Single Error Interrupt Enable
      ECCSE          : Boolean := False;
      --  ECC Dual Error Interrupt Enable
      ECCDE          : Boolean := False;
      --  NVM Error Interrupt Enable
      NVME           : Boolean := False;
      --  Suspended Write Or Erase Interrupt Enable
      SUSP           : Boolean := False;
      --  Active SEES Full Interrupt Enable
      SEESFULL       : Boolean := False;
      --  Active SEES Overflow Interrupt Enable
      SEESOVF        : Boolean := False;
      --  SEE Write Completed Interrupt Enable
      SEEWRC         : Boolean := False;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_INTENSET_Register use record
      DONE           at 0 range 0 .. 0;
      ADDRE          at 0 range 1 .. 1;
      PROGE          at 0 range 2 .. 2;
      LOCKE          at 0 range 3 .. 3;
      ECCSE          at 0 range 4 .. 4;
      ECCDE          at 0 range 5 .. 5;
      NVME           at 0 range 6 .. 6;
      SUSP           at 0 range 7 .. 7;
      SEESFULL       at 0 range 8 .. 8;
      SEESOVF        at 0 range 9 .. 9;
      SEEWRC         at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  Interrupt Flag Status and Clear
   type NVMCTRL_INTFLAG_Register is record
      --  Command Done
      DONE           : Boolean := False;
      --  Address Error
      ADDRE          : Boolean := False;
      --  Programming Error
      PROGE          : Boolean := False;
      --  Lock Error
      LOCKE          : Boolean := False;
      --  ECC Single Error
      ECCSE          : Boolean := False;
      --  ECC Dual Error
      ECCDE          : Boolean := False;
      --  NVM Error
      NVME           : Boolean := False;
      --  Suspended Write Or Erase Operation
      SUSP           : Boolean := False;
      --  Active SEES Full
      SEESFULL       : Boolean := False;
      --  Active SEES Overflow
      SEESOVF        : Boolean := False;
      --  SEE Write Completed
      SEEWRC         : Boolean := False;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_INTFLAG_Register use record
      DONE           at 0 range 0 .. 0;
      ADDRE          at 0 range 1 .. 1;
      PROGE          at 0 range 2 .. 2;
      LOCKE          at 0 range 3 .. 3;
      ECCSE          at 0 range 4 .. 4;
      ECCDE          at 0 range 5 .. 5;
      NVME           at 0 range 6 .. 6;
      SUSP           at 0 range 7 .. 7;
      SEESFULL       at 0 range 8 .. 8;
      SEESOVF        at 0 range 9 .. 9;
      SEEWRC         at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  Boot Loader Protection Size
   type STATUS_BOOTPROTSelect is
     (--  120 kbytes
      Val_120,
      --  112 kbytes
      Val_112,
      --  104 kbytes
      Val_104,
      --  96 kbytes
      Val_96,
      --  88 kbytes
      Val_88,
      --  80 kbytes
      Val_80,
      --  72 kbytes
      Val_72,
      --  64 kbytes
      Val_64,
      --  56 kbytes
      Val_56,
      --  48 kbytes
      Val_48,
      --  40 kbytes
      Val_40,
      --  32 kbytes
      Val_32,
      --  24 kbytes
      Val_24,
      --  16 kbytes
      Val_16,
      --  8 kbytes
      Val_8,
      --  0 kbytes
      Val_0)
     with Size => 4;
   for STATUS_BOOTPROTSelect use
     (Val_120 => 0,
      Val_112 => 1,
      Val_104 => 2,
      Val_96 => 3,
      Val_88 => 4,
      Val_80 => 5,
      Val_72 => 6,
      Val_64 => 7,
      Val_56 => 8,
      Val_48 => 9,
      Val_40 => 10,
      Val_32 => 11,
      Val_24 => 12,
      Val_16 => 13,
      Val_8 => 14,
      Val_0 => 15);

   --  Status
   type NVMCTRL_STATUS_Register is record
      --  Read-only. Ready to accept a command
      READY          : Boolean;
      --  Read-only. Power Reduction Mode
      PRM            : Boolean;
      --  Read-only. NVM Page Buffer Active Loading
      LOAD           : Boolean;
      --  Read-only. NVM Write Or Erase Operation Is Suspended
      SUSP           : Boolean;
      --  Read-only. BANKA First
      AFIRST         : Boolean;
      --  Read-only. Boot Loader Protection Disable
      BPDIS          : Boolean;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Boot Loader Protection Size
      BOOTPROT       : STATUS_BOOTPROTSelect;
      --  unspecified
      Reserved_12_15 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_STATUS_Register use record
      READY          at 0 range 0 .. 0;
      PRM            at 0 range 1 .. 1;
      LOAD           at 0 range 2 .. 2;
      SUSP           at 0 range 3 .. 3;
      AFIRST         at 0 range 4 .. 4;
      BPDIS          at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      BOOTPROT       at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype NVMCTRL_ADDR_ADDR_Field is HAL.UInt24;

   --  Address
   type NVMCTRL_ADDR_Register is record
      --  NVM Address
      ADDR           : NVMCTRL_ADDR_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_ADDR_Register use record
      ADDR           at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Page Buffer Load Data x

   --  Page Buffer Load Data x
   type NVMCTRL_PBLDATA_Registers is array (0 .. 1) of HAL.UInt32;

   subtype NVMCTRL_ECCERR_ADDR_Field is HAL.UInt24;

   --  Low Double-Word Error Type
   type ECCERR_TYPELSelect is
     (--  No Error Detected Since Last Read
      None,
      --  At Least One Single Error Detected Since last Read
      Single,
      --  At Least One Dual Error Detected Since Last Read
      Dual)
     with Size => 2;
   for ECCERR_TYPELSelect use
     (None => 0,
      Single => 1,
      Dual => 2);

   --  High Double-Word Error Type
   type ECCERR_TYPEHSelect is
     (--  No Error Detected Since Last Read
      None,
      --  At Least One Single Error Detected Since last Read
      Single,
      --  At Least One Dual Error Detected Since Last Read
      Dual)
     with Size => 2;
   for ECCERR_TYPEHSelect use
     (None => 0,
      Single => 1,
      Dual => 2);

   --  ECC Error Status Register
   type NVMCTRL_ECCERR_Register is record
      --  Read-only. Error Address
      ADDR           : NVMCTRL_ECCERR_ADDR_Field;
      --  unspecified
      Reserved_24_27 : HAL.UInt4;
      --  Read-only. Low Double-Word Error Type
      TYPEL          : ECCERR_TYPELSelect;
      --  Read-only. High Double-Word Error Type
      TYPEH          : ECCERR_TYPEHSelect;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_ECCERR_Register use record
      ADDR           at 0 range 0 .. 23;
      Reserved_24_27 at 0 range 24 .. 27;
      TYPEL          at 0 range 28 .. 29;
      TYPEH          at 0 range 30 .. 31;
   end record;

   --  Debug Control
   type NVMCTRL_DBGCTRL_Register is record
      --  Debugger ECC Read Disable
      ECCDIS       : Boolean := False;
      --  Debugger ECC Error Tracking Mode
      ECCELOG      : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_DBGCTRL_Register use record
      ECCDIS       at 0 range 0 .. 0;
      ECCELOG      at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Write Mode
   type SEECFG_WMODESelect is
     (--  A NVM write command is issued after each write in the pagebuffer
      UNBUFFERED,
      --  A NVM write command is issued when a write to a new page is requested
      BUFFERED)
     with Size => 1;
   for SEECFG_WMODESelect use
     (UNBUFFERED => 0,
      BUFFERED => 1);

   --  SmartEEPROM Configuration Register
   type NVMCTRL_SEECFG_Register is record
      --  Write Mode
      WMODE        : SEECFG_WMODESelect := SAM_SVD.NVMCTRL.UNBUFFERED;
      --  Automatic Page Reallocation Disable
      APRDIS       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_SEECFG_Register use record
      WMODE        at 0 range 0 .. 0;
      APRDIS       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   subtype NVMCTRL_SEESTAT_SBLK_Field is HAL.UInt4;
   subtype NVMCTRL_SEESTAT_PSZ_Field is HAL.UInt3;

   --  SmartEEPROM Status Register
   type NVMCTRL_SEESTAT_Register is record
      --  Read-only. Active SmartEEPROM Sector
      ASEES          : Boolean;
      --  Read-only. Page Buffer Loaded
      LOAD           : Boolean;
      --  Read-only. Busy
      BUSY           : Boolean;
      --  Read-only. SmartEEPROM Write Access Is Locked
      LOCK           : Boolean;
      --  Read-only. SmartEEPROM Write Access To Register Address Space Is
      --  Locked
      RLOCK          : Boolean;
      --  unspecified
      Reserved_5_7   : HAL.UInt3;
      --  Read-only. Blocks Number In a Sector
      SBLK           : NVMCTRL_SEESTAT_SBLK_Field;
      --  unspecified
      Reserved_12_15 : HAL.UInt4;
      --  Read-only. SmartEEPROM Page Size
      PSZ            : NVMCTRL_SEESTAT_PSZ_Field;
      --  unspecified
      Reserved_19_31 : HAL.UInt13;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVMCTRL_SEESTAT_Register use record
      ASEES          at 0 range 0 .. 0;
      LOAD           at 0 range 1 .. 1;
      BUSY           at 0 range 2 .. 2;
      LOCK           at 0 range 3 .. 3;
      RLOCK          at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      SBLK           at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      PSZ            at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Non-Volatile Memory Controller
   type NVMCTRL_Peripheral is record
      --  Control A
      CTRLA    : aliased NVMCTRL_CTRLA_Register;
      --  Control B
      CTRLB    : aliased NVMCTRL_CTRLB_Register;
      --  NVM Parameter
      PARAM    : aliased NVMCTRL_PARAM_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased NVMCTRL_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased NVMCTRL_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased NVMCTRL_INTFLAG_Register;
      --  Status
      STATUS   : aliased NVMCTRL_STATUS_Register;
      --  Address
      ADDR     : aliased NVMCTRL_ADDR_Register;
      --  Lock Section
      RUNLOCK  : aliased HAL.UInt32;
      --  Page Buffer Load Data x
      PBLDATA  : aliased NVMCTRL_PBLDATA_Registers;
      --  ECC Error Status Register
      ECCERR   : aliased NVMCTRL_ECCERR_Register;
      --  Debug Control
      DBGCTRL  : aliased NVMCTRL_DBGCTRL_Register;
      --  SmartEEPROM Configuration Register
      SEECFG   : aliased NVMCTRL_SEECFG_Register;
      --  SmartEEPROM Status Register
      SEESTAT  : aliased NVMCTRL_SEESTAT_Register;
   end record
     with Volatile;

   for NVMCTRL_Peripheral use record
      CTRLA    at 16#0# range 0 .. 15;
      CTRLB    at 16#4# range 0 .. 15;
      PARAM    at 16#8# range 0 .. 31;
      INTENCLR at 16#C# range 0 .. 15;
      INTENSET at 16#E# range 0 .. 15;
      INTFLAG  at 16#10# range 0 .. 15;
      STATUS   at 16#12# range 0 .. 15;
      ADDR     at 16#14# range 0 .. 31;
      RUNLOCK  at 16#18# range 0 .. 31;
      PBLDATA  at 16#1C# range 0 .. 63;
      ECCERR   at 16#24# range 0 .. 31;
      DBGCTRL  at 16#28# range 0 .. 7;
      SEECFG   at 16#2A# range 0 .. 7;
      SEESTAT  at 16#2C# range 0 .. 31;
   end record;

   --  Non-Volatile Memory Controller
   NVMCTRL_Periph : aliased NVMCTRL_Peripheral
     with Import, Address => NVMCTRL_Base;

end SAM_SVD.NVMCTRL;
