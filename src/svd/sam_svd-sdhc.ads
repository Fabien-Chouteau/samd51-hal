pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.SDHC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype SDHC_BSR_BLOCKSIZE_Field is HAL.UInt10;

   --  SDMA Buffer Boundary
   type BSR_BOUNDARYSelect is
     (--  4k bytes
      Val_4K,
      --  8k bytes
      Val_8K,
      --  16k bytes
      Val_16K,
      --  32k bytes
      Val_32K,
      --  64k bytes
      Val_64K,
      --  128k bytes
      Val_128K,
      --  256k bytes
      Val_256K,
      --  512k bytes
      Val_512K)
     with Size => 3;
   for BSR_BOUNDARYSelect use
     (Val_4K => 0,
      Val_8K => 1,
      Val_16K => 2,
      Val_32K => 3,
      Val_64K => 4,
      Val_128K => 5,
      Val_256K => 6,
      Val_512K => 7);

   --  Block Size
   type SDHC_BSR_Register is record
      --  Transfer Block Size
      BLOCKSIZE      : SDHC_BSR_BLOCKSIZE_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  SDMA Buffer Boundary
      BOUNDARY       : BSR_BOUNDARYSelect := SAM_SVD.SDHC.Val_4K;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_BSR_Register use record
      BLOCKSIZE      at 0 range 0 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      BOUNDARY       at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  DMA Enable
   type TMR_DMAENSelect is
     (--  No data transfer or Non DMA data transfer
      DISABLE,
      --  DMA data transfer
      ENABLE)
     with Size => 1;
   for TMR_DMAENSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Block Count Enable
   type TMR_BCENSelect is
     (--  Disable
      DISABLE,
      --  Enable
      ENABLE)
     with Size => 1;
   for TMR_BCENSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Auto Command Enable
   type TMR_ACMDENSelect is
     (--  Auto Command Disabled
      DISABLED,
      --  Auto CMD12 Enable
      CMD12,
      --  Auto CMD23 Enable
      CMD23)
     with Size => 2;
   for TMR_ACMDENSelect use
     (DISABLED => 0,
      CMD12 => 1,
      CMD23 => 2);

   --  Data Transfer Direction Selection
   type TMR_DTDSELSelect is
     (--  Write (Host to Card)
      WRITE,
      --  Read (Card to Host)
      READ)
     with Size => 1;
   for TMR_DTDSELSelect use
     (WRITE => 0,
      READ => 1);

   --  Multi/Single Block Selection
   type TMR_MSBSELSelect is
     (--  Single Block
      SINGLE,
      --  Multiple Block
      MULTIPLE)
     with Size => 1;
   for TMR_MSBSELSelect use
     (SINGLE => 0,
      MULTIPLE => 1);

   --  Transfer Mode
   type SDHC_TMR_Register is record
      --  DMA Enable
      DMAEN         : TMR_DMAENSelect := SAM_SVD.SDHC.DISABLE;
      --  Block Count Enable
      BCEN          : TMR_BCENSelect := SAM_SVD.SDHC.DISABLE;
      --  Auto Command Enable
      ACMDEN        : TMR_ACMDENSelect := SAM_SVD.SDHC.DISABLED;
      --  Data Transfer Direction Selection
      DTDSEL        : TMR_DTDSELSelect := SAM_SVD.SDHC.WRITE;
      --  Multi/Single Block Selection
      MSBSEL        : TMR_MSBSELSelect := SAM_SVD.SDHC.SINGLE;
      --  unspecified
      Reserved_6_15 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_TMR_Register use record
      DMAEN         at 0 range 0 .. 0;
      BCEN          at 0 range 1 .. 1;
      ACMDEN        at 0 range 2 .. 3;
      DTDSEL        at 0 range 4 .. 4;
      MSBSEL        at 0 range 5 .. 5;
      Reserved_6_15 at 0 range 6 .. 15;
   end record;

   --  Response Type
   type CR_RESPTYPSelect is
     (--  No response
      NONE,
      --  136-bit response
      Val_136_BIT,
      --  48-bit response
      Val_48_BIT,
      --  48-bit response check busy after response
      Val_48_BIT_BUSY)
     with Size => 2;
   for CR_RESPTYPSelect use
     (NONE => 0,
      Val_136_BIT => 1,
      Val_48_BIT => 2,
      Val_48_BIT_BUSY => 3);

   --  Command CRC Check Enable
   type CR_CMDCCENSelect is
     (--  Disable
      DISABLE,
      --  Enable
      ENABLE)
     with Size => 1;
   for CR_CMDCCENSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Command Index Check Enable
   type CR_CMDICENSelect is
     (--  Disable
      DISABLE,
      --  Enable
      ENABLE)
     with Size => 1;
   for CR_CMDICENSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Data Present Select
   type CR_DPSELSelect is
     (--  No Data Present
      NO_DATA,
      --  Data Present
      DATA)
     with Size => 1;
   for CR_DPSELSelect use
     (NO_DATA => 0,
      DATA => 1);

   --  Command Type
   type CR_CMDTYPSelect is
     (--  Other commands
      NORMAL,
      --  CMD52 for writing Bus Suspend in CCCR
      SUSPEND,
      --  CMD52 for writing Function Select in CCCR
      RESUME,
      --  CMD12, CMD52 for writing I/O Abort in CCCR
      ABORT_k)
     with Size => 2;
   for CR_CMDTYPSelect use
     (NORMAL => 0,
      SUSPEND => 1,
      RESUME => 2,
      ABORT_k => 3);

   subtype SDHC_CR_CMDIDX_Field is HAL.UInt6;

   --  Command
   type SDHC_CR_Register is record
      --  Response Type
      RESPTYP        : CR_RESPTYPSelect := SAM_SVD.SDHC.NONE;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  Command CRC Check Enable
      CMDCCEN        : CR_CMDCCENSelect := SAM_SVD.SDHC.DISABLE;
      --  Command Index Check Enable
      CMDICEN        : CR_CMDICENSelect := SAM_SVD.SDHC.DISABLE;
      --  Data Present Select
      DPSEL          : CR_DPSELSelect := SAM_SVD.SDHC.NO_DATA;
      --  Command Type
      CMDTYP         : CR_CMDTYPSelect := SAM_SVD.SDHC.NORMAL;
      --  Command Index
      CMDIDX         : SDHC_CR_CMDIDX_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_CR_Register use record
      RESPTYP        at 0 range 0 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      CMDCCEN        at 0 range 3 .. 3;
      CMDICEN        at 0 range 4 .. 4;
      DPSEL          at 0 range 5 .. 5;
      CMDTYP         at 0 range 6 .. 7;
      CMDIDX         at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  Response

   --  Response
   type SDHC_RR_Registers is array (0 .. 3) of HAL.UInt32;

   --  Command Inhibit (CMD)
   type PSR_CMDINHCSelect is
     (--  Can issue command using only CMD line
      CAN,
      --  Cannot issue command
      CANNOT)
     with Size => 1;
   for PSR_CMDINHCSelect use
     (CAN => 0,
      CANNOT => 1);

   --  Command Inhibit (DAT)
   type PSR_CMDINHDSelect is
     (--  Can issue command which uses the DAT line
      CAN,
      --  Cannot issue command which uses the DAT line
      CANNOT)
     with Size => 1;
   for PSR_CMDINHDSelect use
     (CAN => 0,
      CANNOT => 1);

   --  DAT Line Active
   type PSR_DLACTSelect is
     (--  DAT Line Inactive
      INACTIVE,
      --  DAT Line Active
      ACTIVE)
     with Size => 1;
   for PSR_DLACTSelect use
     (INACTIVE => 0,
      ACTIVE => 1);

   --  Re-Tuning Request
   type PSR_RTREQSelect is
     (--  Fixed or well-tuned sampling clock
      OK,
      --  Sampling clock needs re-tuning
      REQUIRED)
     with Size => 1;
   for PSR_RTREQSelect use
     (OK => 0,
      REQUIRED => 1);

   --  Write Transfer Active
   type PSR_WTACTSelect is
     (--  No valid data
      NO,
      --  Transferring data
      YES)
     with Size => 1;
   for PSR_WTACTSelect use
     (NO => 0,
      YES => 1);

   --  Read Transfer Active
   type PSR_RTACTSelect is
     (--  No valid data
      NO,
      --  Transferring data
      YES)
     with Size => 1;
   for PSR_RTACTSelect use
     (NO => 0,
      YES => 1);

   --  Buffer Write Enable
   type PSR_BUFWRENSelect is
     (--  Write disable
      DISABLE,
      --  Write enable
      ENABLE)
     with Size => 1;
   for PSR_BUFWRENSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Buffer Read Enable
   type PSR_BUFRDENSelect is
     (--  Read disable
      DISABLE,
      --  Read enable
      ENABLE)
     with Size => 1;
   for PSR_BUFRDENSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Card Inserted
   type PSR_CARDINSSelect is
     (--  Reset or Debouncing or No Card
      NO,
      --  Card inserted
      YES)
     with Size => 1;
   for PSR_CARDINSSelect use
     (NO => 0,
      YES => 1);

   --  Card State Stable
   type PSR_CARDSSSelect is
     (--  Reset or Debouncing
      NO,
      --  No Card or Insered
      YES)
     with Size => 1;
   for PSR_CARDSSSelect use
     (NO => 0,
      YES => 1);

   --  Card Detect Pin Level
   type PSR_CARDDPLSelect is
     (--  No card present (SDCD#=1)
      NO,
      --  Card present (SDCD#=0)
      YES)
     with Size => 1;
   for PSR_CARDDPLSelect use
     (NO => 0,
      YES => 1);

   --  Write Protect Pin Level
   type PSR_WRPPLSelect is
     (--  Write protected (SDWP#=0)
      PROTECTED_k,
      --  Write enabled (SDWP#=1)
      ENABLED)
     with Size => 1;
   for PSR_WRPPLSelect use
     (PROTECTED_k => 0,
      ENABLED => 1);

   subtype SDHC_PSR_DATLL_Field is HAL.UInt4;

   --  Present State
   type SDHC_PSR_Register is record
      --  Read-only. Command Inhibit (CMD)
      CMDINHC        : PSR_CMDINHCSelect;
      --  Read-only. Command Inhibit (DAT)
      CMDINHD        : PSR_CMDINHDSelect;
      --  Read-only. DAT Line Active
      DLACT          : PSR_DLACTSelect;
      --  Read-only. Re-Tuning Request
      RTREQ          : PSR_RTREQSelect;
      --  unspecified
      Reserved_4_7   : HAL.UInt4;
      --  Read-only. Write Transfer Active
      WTACT          : PSR_WTACTSelect;
      --  Read-only. Read Transfer Active
      RTACT          : PSR_RTACTSelect;
      --  Read-only. Buffer Write Enable
      BUFWREN        : PSR_BUFWRENSelect;
      --  Read-only. Buffer Read Enable
      BUFRDEN        : PSR_BUFRDENSelect;
      --  unspecified
      Reserved_12_15 : HAL.UInt4;
      --  Read-only. Card Inserted
      CARDINS        : PSR_CARDINSSelect;
      --  Read-only. Card State Stable
      CARDSS         : PSR_CARDSSSelect;
      --  Read-only. Card Detect Pin Level
      CARDDPL        : PSR_CARDDPLSelect;
      --  Read-only. Write Protect Pin Level
      WRPPL          : PSR_WRPPLSelect;
      --  Read-only. DAT[3:0] Line Level
      DATLL          : SDHC_PSR_DATLL_Field;
      --  Read-only. CMD Line Level
      CMDLL          : Boolean;
      --  unspecified
      Reserved_25_31 : HAL.UInt7;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SDHC_PSR_Register use record
      CMDINHC        at 0 range 0 .. 0;
      CMDINHD        at 0 range 1 .. 1;
      DLACT          at 0 range 2 .. 2;
      RTREQ          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      WTACT          at 0 range 8 .. 8;
      RTACT          at 0 range 9 .. 9;
      BUFWREN        at 0 range 10 .. 10;
      BUFRDEN        at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      CARDINS        at 0 range 16 .. 16;
      CARDSS         at 0 range 17 .. 17;
      CARDDPL        at 0 range 18 .. 18;
      WRPPL          at 0 range 19 .. 19;
      DATLL          at 0 range 20 .. 23;
      CMDLL          at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  LED Control
   type HC1R_LEDCTRLSelect is
     (--  LED off
      OFF,
      --  LED on
      ON)
     with Size => 1;
   for HC1R_LEDCTRLSelect use
     (OFF => 0,
      ON => 1);

   --  Data Width
   type HC1R_DWSelect is
     (--  1-bit mode
      Val_1BIT,
      --  4-bit mode
      Val_4BIT)
     with Size => 1;
   for HC1R_DWSelect use
     (Val_1BIT => 0,
      Val_4BIT => 1);

   --  High Speed Enable
   type HC1R_HSENSelect is
     (--  Normal Speed mode
      NORMAL,
      --  High Speed mode
      HIGH)
     with Size => 1;
   for HC1R_HSENSelect use
     (NORMAL => 0,
      HIGH => 1);

   --  DMA Select
   type HC1R_DMASELSelect is
     (--  SDMA is selected
      SDMA,
      --  32-bit Address ADMA2 is selected
      Val_32BIT)
     with Size => 2;
   for HC1R_DMASELSelect use
     (SDMA => 0,
      Val_32BIT => 2);

   --  Card Detect Test Level
   type HC1R_CARDDTLSelect is
     (--  No Card
      NO,
      --  Card Inserted
      YES)
     with Size => 1;
   for HC1R_CARDDTLSelect use
     (NO => 0,
      YES => 1);

   --  Card Detect Signal Selection
   type HC1R_CARDDSELSelect is
     (--  SDCD# is selected (for normal use)
      NORMAL,
      --  The Card Select Test Level is selected (for test purpose)
      TEST)
     with Size => 1;
   for HC1R_CARDDSELSelect use
     (NORMAL => 0,
      TEST => 1);

   --  Host Control 1
   type SDHC_HC1R_Register is record
      --  LED Control
      LEDCTRL      : HC1R_LEDCTRLSelect := SAM_SVD.SDHC.OFF;
      --  Data Width
      DW           : HC1R_DWSelect := SAM_SVD.SDHC.Val_1BIT;
      --  High Speed Enable
      HSEN         : HC1R_HSENSelect := SAM_SVD.SDHC.NORMAL;
      --  DMA Select
      DMASEL       : HC1R_DMASELSelect := SAM_SVD.SDHC.SDMA;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Card Detect Test Level
      CARDDTL      : HC1R_CARDDTLSelect := SAM_SVD.SDHC.NO;
      --  Card Detect Signal Selection
      CARDDSEL     : HC1R_CARDDSELSelect := SAM_SVD.SDHC.NORMAL;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_HC1R_Register use record
      LEDCTRL      at 0 range 0 .. 0;
      DW           at 0 range 1 .. 1;
      HSEN         at 0 range 2 .. 2;
      DMASEL       at 0 range 3 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      CARDDTL      at 0 range 6 .. 6;
      CARDDSEL     at 0 range 7 .. 7;
   end record;

   --  Data Width
   type HC1R_EMMC_MODE_DWSelect is
     (--  1-bit mode
      Val_1BIT,
      --  4-bit mode
      Val_4BIT)
     with Size => 1;
   for HC1R_EMMC_MODE_DWSelect use
     (Val_1BIT => 0,
      Val_4BIT => 1);

   --  High Speed Enable
   type HC1R_EMMC_MODE_HSENSelect is
     (--  Normal Speed mode
      NORMAL,
      --  High Speed mode
      HIGH)
     with Size => 1;
   for HC1R_EMMC_MODE_HSENSelect use
     (NORMAL => 0,
      HIGH => 1);

   --  DMA Select
   type HC1R_EMMC_MODE_DMASELSelect is
     (--  SDMA is selected
      SDMA,
      --  32-bit Address ADMA2 is selected
      Val_32BIT)
     with Size => 2;
   for HC1R_EMMC_MODE_DMASELSelect use
     (SDMA => 0,
      Val_32BIT => 2);

   --  Host Control 1
   type SDHC_HC1R_EMMC_MODE_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Data Width
      DW           : HC1R_EMMC_MODE_DWSelect := SAM_SVD.SDHC.Val_1BIT;
      --  High Speed Enable
      HSEN         : HC1R_EMMC_MODE_HSENSelect := SAM_SVD.SDHC.NORMAL;
      --  DMA Select
      DMASEL       : HC1R_EMMC_MODE_DMASELSelect := SAM_SVD.SDHC.SDMA;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_HC1R_EMMC_MODE_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      DW           at 0 range 1 .. 1;
      HSEN         at 0 range 2 .. 2;
      DMASEL       at 0 range 3 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  SD Bus Power
   type PCR_SDBPWRSelect is
     (--  Power off
      OFF,
      --  Power on
      ON)
     with Size => 1;
   for PCR_SDBPWRSelect use
     (OFF => 0,
      ON => 1);

   --  SD Bus Voltage Select
   type PCR_SDBVSELSelect is
     (--  1.8V (Typ.)
      Val_1V8,
      --  3.0V (Typ.)
      Val_3V0,
      --  3.3V (Typ.)
      Val_3V3)
     with Size => 3;
   for PCR_SDBVSELSelect use
     (Val_1V8 => 5,
      Val_3V0 => 6,
      Val_3V3 => 7);

   --  Power Control
   type SDHC_PCR_Register is record
      --  SD Bus Power
      SDBPWR       : PCR_SDBPWRSelect := SAM_SVD.SDHC.OFF;
      --  SD Bus Voltage Select
      SDBVSEL      : PCR_SDBVSELSelect := SAM_SVD.SDHC.Val_3V3;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_PCR_Register use record
      SDBPWR       at 0 range 0 .. 0;
      SDBVSEL      at 0 range 1 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Stop at Block Gap Request
   type BGCR_STPBGRSelect is
     (--  Transfer
      TRANSFER,
      --  Stop
      STOP)
     with Size => 1;
   for BGCR_STPBGRSelect use
     (TRANSFER => 0,
      STOP => 1);

   --  Continue Request
   type BGCR_CONTRSelect is
     (--  Not affected
      GO_ON,
      --  Restart
      RESTART)
     with Size => 1;
   for BGCR_CONTRSelect use
     (GO_ON => 0,
      RESTART => 1);

   --  Read Wait Control
   type BGCR_RWCTRLSelect is
     (--  Disable Read Wait Control
      DISABLE,
      --  Enable Read Wait Control
      ENABLE)
     with Size => 1;
   for BGCR_RWCTRLSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Interrupt at Block Gap
   type BGCR_INTBGSelect is
     (--  Disabled
      DISABLED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for BGCR_INTBGSelect use
     (DISABLED => 0,
      ENABLED => 1);

   --  Block Gap Control
   type SDHC_BGCR_Register is record
      --  Stop at Block Gap Request
      STPBGR       : BGCR_STPBGRSelect := SAM_SVD.SDHC.TRANSFER;
      --  Continue Request
      CONTR        : BGCR_CONTRSelect := SAM_SVD.SDHC.GO_ON;
      --  Read Wait Control
      RWCTRL       : BGCR_RWCTRLSelect := SAM_SVD.SDHC.DISABLE;
      --  Interrupt at Block Gap
      INTBG        : BGCR_INTBGSelect := SAM_SVD.SDHC.DISABLED;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_BGCR_Register use record
      STPBGR       at 0 range 0 .. 0;
      CONTR        at 0 range 1 .. 1;
      RWCTRL       at 0 range 2 .. 2;
      INTBG        at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Stop at Block Gap Request
   type BGCR_EMMC_MODE_STPBGRSelect is
     (--  Transfer
      TRANSFER,
      --  Stop
      STOP)
     with Size => 1;
   for BGCR_EMMC_MODE_STPBGRSelect use
     (TRANSFER => 0,
      STOP => 1);

   --  Continue Request
   type BGCR_EMMC_MODE_CONTRSelect is
     (--  Not affected
      GO_ON,
      --  Restart
      RESTART)
     with Size => 1;
   for BGCR_EMMC_MODE_CONTRSelect use
     (GO_ON => 0,
      RESTART => 1);

   --  Block Gap Control
   type SDHC_BGCR_EMMC_MODE_Register is record
      --  Stop at Block Gap Request
      STPBGR       : BGCR_EMMC_MODE_STPBGRSelect := SAM_SVD.SDHC.TRANSFER;
      --  Continue Request
      CONTR        : BGCR_EMMC_MODE_CONTRSelect := SAM_SVD.SDHC.GO_ON;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_BGCR_EMMC_MODE_Register use record
      STPBGR       at 0 range 0 .. 0;
      CONTR        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Wakeup Event Enable on Card Interrupt
   type WCR_WKENCINTSelect is
     (--  Disable
      DISABLE,
      --  Enable
      ENABLE)
     with Size => 1;
   for WCR_WKENCINTSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Wakeup Event Enable on Card Insertion
   type WCR_WKENCINSSelect is
     (--  Disable
      DISABLE,
      --  Enable
      ENABLE)
     with Size => 1;
   for WCR_WKENCINSSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Wakeup Event Enable on Card Removal
   type WCR_WKENCREMSelect is
     (--  Disable
      DISABLE,
      --  Enable
      ENABLE)
     with Size => 1;
   for WCR_WKENCREMSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Wakeup Control
   type SDHC_WCR_Register is record
      --  Wakeup Event Enable on Card Interrupt
      WKENCINT     : WCR_WKENCINTSelect := SAM_SVD.SDHC.DISABLE;
      --  Wakeup Event Enable on Card Insertion
      WKENCINS     : WCR_WKENCINSSelect := SAM_SVD.SDHC.DISABLE;
      --  Wakeup Event Enable on Card Removal
      WKENCREM     : WCR_WKENCREMSelect := SAM_SVD.SDHC.DISABLE;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_WCR_Register use record
      WKENCINT     at 0 range 0 .. 0;
      WKENCINS     at 0 range 1 .. 1;
      WKENCREM     at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Internal Clock Enable
   type CCR_INTCLKENSelect is
     (--  Stop
      OFF,
      --  Oscillate
      ON)
     with Size => 1;
   for CCR_INTCLKENSelect use
     (OFF => 0,
      ON => 1);

   --  Internal Clock Stable
   type CCR_INTCLKSSelect is
     (--  Not Ready
      NOT_READY,
      --  Ready
      READY)
     with Size => 1;
   for CCR_INTCLKSSelect use
     (NOT_READY => 0,
      READY => 1);

   --  SD Clock Enable
   type CCR_SDCLKENSelect is
     (--  Disable
      DISABLE,
      --  Enable
      ENABLE)
     with Size => 1;
   for CCR_SDCLKENSelect use
     (DISABLE => 0,
      ENABLE => 1);

   --  Clock Generator Select
   type CCR_CLKGSELSelect is
     (--  Divided Clock Mode
      DIV,
      --  Programmable Clock Mode
      PROG)
     with Size => 1;
   for CCR_CLKGSELSelect use
     (DIV => 0,
      PROG => 1);

   subtype SDHC_CCR_USDCLKFSEL_Field is HAL.UInt2;
   subtype SDHC_CCR_SDCLKFSEL_Field is HAL.UInt8;

   --  Clock Control
   type SDHC_CCR_Register is record
      --  Internal Clock Enable
      INTCLKEN     : CCR_INTCLKENSelect := SAM_SVD.SDHC.OFF;
      --  Internal Clock Stable
      INTCLKS      : CCR_INTCLKSSelect := SAM_SVD.SDHC.NOT_READY;
      --  SD Clock Enable
      SDCLKEN      : CCR_SDCLKENSelect := SAM_SVD.SDHC.DISABLE;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Clock Generator Select
      CLKGSEL      : CCR_CLKGSELSelect := SAM_SVD.SDHC.DIV;
      --  Upper Bits of SDCLK Frequency Select
      USDCLKFSEL   : SDHC_CCR_USDCLKFSEL_Field := 16#0#;
      --  SDCLK Frequency Select
      SDCLKFSEL    : SDHC_CCR_SDCLKFSEL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_CCR_Register use record
      INTCLKEN     at 0 range 0 .. 0;
      INTCLKS      at 0 range 1 .. 1;
      SDCLKEN      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      CLKGSEL      at 0 range 5 .. 5;
      USDCLKFSEL   at 0 range 6 .. 7;
      SDCLKFSEL    at 0 range 8 .. 15;
   end record;

   subtype SDHC_TCR_DTCVAL_Field is HAL.UInt4;

   --  Timeout Control
   type SDHC_TCR_Register is record
      --  Data Timeout Counter Value
      DTCVAL       : SDHC_TCR_DTCVAL_Field := 16#0#;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_TCR_Register use record
      DTCVAL       at 0 range 0 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Software Reset For All
   type SRR_SWRSTALLSelect is
     (--  Work
      WORK,
      --  Reset
      RESET)
     with Size => 1;
   for SRR_SWRSTALLSelect use
     (WORK => 0,
      RESET => 1);

   --  Software Reset For CMD Line
   type SRR_SWRSTCMDSelect is
     (--  Work
      WORK,
      --  Reset
      RESET)
     with Size => 1;
   for SRR_SWRSTCMDSelect use
     (WORK => 0,
      RESET => 1);

   --  Software Reset For DAT Line
   type SRR_SWRSTDATSelect is
     (--  Work
      WORK,
      --  Reset
      RESET)
     with Size => 1;
   for SRR_SWRSTDATSelect use
     (WORK => 0,
      RESET => 1);

   --  Software Reset
   type SDHC_SRR_Register is record
      --  Software Reset For All
      SWRSTALL     : SRR_SWRSTALLSelect := SAM_SVD.SDHC.WORK;
      --  Software Reset For CMD Line
      SWRSTCMD     : SRR_SWRSTCMDSelect := SAM_SVD.SDHC.WORK;
      --  Software Reset For DAT Line
      SWRSTDAT     : SRR_SWRSTDATSelect := SAM_SVD.SDHC.WORK;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_SRR_Register use record
      SWRSTALL     at 0 range 0 .. 0;
      SWRSTCMD     at 0 range 1 .. 1;
      SWRSTDAT     at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Command Complete
   type NISTR_CMDCSelect is
     (--  No command complete
      NO,
      --  Command complete
      YES)
     with Size => 1;
   for NISTR_CMDCSelect use
     (NO => 0,
      YES => 1);

   --  Transfer Complete
   type NISTR_TRFCSelect is
     (--  Not complete
      NO,
      --  Command execution is completed
      YES)
     with Size => 1;
   for NISTR_TRFCSelect use
     (NO => 0,
      YES => 1);

   --  Block Gap Event
   type NISTR_BLKGESelect is
     (--  No Block Gap Event
      NO,
      --  Transaction stopped at block gap
      STOP)
     with Size => 1;
   for NISTR_BLKGESelect use
     (NO => 0,
      STOP => 1);

   --  DMA Interrupt
   type NISTR_DMAINTSelect is
     (--  No DMA Interrupt
      NO,
      --  DMA Interrupt is generated
      YES)
     with Size => 1;
   for NISTR_DMAINTSelect use
     (NO => 0,
      YES => 1);

   --  Buffer Write Ready
   type NISTR_BWRRDYSelect is
     (--  Not ready to write buffer
      NO,
      --  Ready to write buffer
      YES)
     with Size => 1;
   for NISTR_BWRRDYSelect use
     (NO => 0,
      YES => 1);

   --  Buffer Read Ready
   type NISTR_BRDRDYSelect is
     (--  Not ready to read buffer
      NO,
      --  Ready to read buffer
      YES)
     with Size => 1;
   for NISTR_BRDRDYSelect use
     (NO => 0,
      YES => 1);

   --  Card Insertion
   type NISTR_CINSSelect is
     (--  Card state stable or Debouncing
      NO,
      --  Card inserted
      YES)
     with Size => 1;
   for NISTR_CINSSelect use
     (NO => 0,
      YES => 1);

   --  Card Removal
   type NISTR_CREMSelect is
     (--  Card state stable or Debouncing
      NO,
      --  Card Removed
      YES)
     with Size => 1;
   for NISTR_CREMSelect use
     (NO => 0,
      YES => 1);

   --  Card Interrupt
   type NISTR_CINTSelect is
     (--  No Card Interrupt
      NO,
      --  Generate Card Interrupt
      YES)
     with Size => 1;
   for NISTR_CINTSelect use
     (NO => 0,
      YES => 1);

   --  Error Interrupt
   type NISTR_ERRINTSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for NISTR_ERRINTSelect use
     (NO => 0,
      YES => 1);

   --  Normal Interrupt Status
   type SDHC_NISTR_Register is record
      --  Command Complete
      CMDC          : NISTR_CMDCSelect := SAM_SVD.SDHC.NO;
      --  Transfer Complete
      TRFC          : NISTR_TRFCSelect := SAM_SVD.SDHC.NO;
      --  Block Gap Event
      BLKGE         : NISTR_BLKGESelect := SAM_SVD.SDHC.NO;
      --  DMA Interrupt
      DMAINT        : NISTR_DMAINTSelect := SAM_SVD.SDHC.NO;
      --  Buffer Write Ready
      BWRRDY        : NISTR_BWRRDYSelect := SAM_SVD.SDHC.NO;
      --  Buffer Read Ready
      BRDRDY        : NISTR_BRDRDYSelect := SAM_SVD.SDHC.NO;
      --  Card Insertion
      CINS          : NISTR_CINSSelect := SAM_SVD.SDHC.NO;
      --  Card Removal
      CREM          : NISTR_CREMSelect := SAM_SVD.SDHC.NO;
      --  Card Interrupt
      CINT          : NISTR_CINTSelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_9_14 : HAL.UInt6 := 16#0#;
      --  Error Interrupt
      ERRINT        : NISTR_ERRINTSelect := SAM_SVD.SDHC.NO;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_NISTR_Register use record
      CMDC          at 0 range 0 .. 0;
      TRFC          at 0 range 1 .. 1;
      BLKGE         at 0 range 2 .. 2;
      DMAINT        at 0 range 3 .. 3;
      BWRRDY        at 0 range 4 .. 4;
      BRDRDY        at 0 range 5 .. 5;
      CINS          at 0 range 6 .. 6;
      CREM          at 0 range 7 .. 7;
      CINT          at 0 range 8 .. 8;
      Reserved_9_14 at 0 range 9 .. 14;
      ERRINT        at 0 range 15 .. 15;
   end record;

   --  Command Complete
   type NISTR_EMMC_MODE_CMDCSelect is
     (--  No command complete
      NO,
      --  Command complete
      YES)
     with Size => 1;
   for NISTR_EMMC_MODE_CMDCSelect use
     (NO => 0,
      YES => 1);

   --  Transfer Complete
   type NISTR_EMMC_MODE_TRFCSelect is
     (--  Not complete
      NO,
      --  Command execution is completed
      YES)
     with Size => 1;
   for NISTR_EMMC_MODE_TRFCSelect use
     (NO => 0,
      YES => 1);

   --  Block Gap Event
   type NISTR_EMMC_MODE_BLKGESelect is
     (--  No Block Gap Event
      NO,
      --  Transaction stopped at block gap
      STOP)
     with Size => 1;
   for NISTR_EMMC_MODE_BLKGESelect use
     (NO => 0,
      STOP => 1);

   --  DMA Interrupt
   type NISTR_EMMC_MODE_DMAINTSelect is
     (--  No DMA Interrupt
      NO,
      --  DMA Interrupt is generated
      YES)
     with Size => 1;
   for NISTR_EMMC_MODE_DMAINTSelect use
     (NO => 0,
      YES => 1);

   --  Buffer Write Ready
   type NISTR_EMMC_MODE_BWRRDYSelect is
     (--  Not ready to write buffer
      NO,
      --  Ready to write buffer
      YES)
     with Size => 1;
   for NISTR_EMMC_MODE_BWRRDYSelect use
     (NO => 0,
      YES => 1);

   --  Buffer Read Ready
   type NISTR_EMMC_MODE_BRDRDYSelect is
     (--  Not ready to read buffer
      NO,
      --  Ready to read buffer
      YES)
     with Size => 1;
   for NISTR_EMMC_MODE_BRDRDYSelect use
     (NO => 0,
      YES => 1);

   --  Error Interrupt
   type NISTR_EMMC_MODE_ERRINTSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for NISTR_EMMC_MODE_ERRINTSelect use
     (NO => 0,
      YES => 1);

   --  Normal Interrupt Status
   type SDHC_NISTR_EMMC_MODE_Register is record
      --  Command Complete
      CMDC          : NISTR_EMMC_MODE_CMDCSelect := SAM_SVD.SDHC.NO;
      --  Transfer Complete
      TRFC          : NISTR_EMMC_MODE_TRFCSelect := SAM_SVD.SDHC.NO;
      --  Block Gap Event
      BLKGE         : NISTR_EMMC_MODE_BLKGESelect := SAM_SVD.SDHC.NO;
      --  DMA Interrupt
      DMAINT        : NISTR_EMMC_MODE_DMAINTSelect := SAM_SVD.SDHC.NO;
      --  Buffer Write Ready
      BWRRDY        : NISTR_EMMC_MODE_BWRRDYSelect := SAM_SVD.SDHC.NO;
      --  Buffer Read Ready
      BRDRDY        : NISTR_EMMC_MODE_BRDRDYSelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_6_13 : HAL.UInt8 := 16#0#;
      --  Boot Acknowledge Received
      BOOTAR        : Boolean := False;
      --  Error Interrupt
      ERRINT        : NISTR_EMMC_MODE_ERRINTSelect := SAM_SVD.SDHC.NO;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_NISTR_EMMC_MODE_Register use record
      CMDC          at 0 range 0 .. 0;
      TRFC          at 0 range 1 .. 1;
      BLKGE         at 0 range 2 .. 2;
      DMAINT        at 0 range 3 .. 3;
      BWRRDY        at 0 range 4 .. 4;
      BRDRDY        at 0 range 5 .. 5;
      Reserved_6_13 at 0 range 6 .. 13;
      BOOTAR        at 0 range 14 .. 14;
      ERRINT        at 0 range 15 .. 15;
   end record;

   --  Command Timeout Error
   type EISTR_CMDTEOSelect is
     (--  No Error
      NO,
      --  Timeout
      YES)
     with Size => 1;
   for EISTR_CMDTEOSelect use
     (NO => 0,
      YES => 1);

   --  Command CRC Error
   type EISTR_CMDCRCSelect is
     (--  No Error
      NO,
      --  CRC Error Generated
      YES)
     with Size => 1;
   for EISTR_CMDCRCSelect use
     (NO => 0,
      YES => 1);

   --  Command End Bit Error
   type EISTR_CMDENDSelect is
     (--  No error
      NO,
      --  End Bit Error Generated
      YES)
     with Size => 1;
   for EISTR_CMDENDSelect use
     (NO => 0,
      YES => 1);

   --  Command Index Error
   type EISTR_CMDIDXSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_CMDIDXSelect use
     (NO => 0,
      YES => 1);

   --  Data Timeout Error
   type EISTR_DATTEOSelect is
     (--  No Error
      NO,
      --  Timeout
      YES)
     with Size => 1;
   for EISTR_DATTEOSelect use
     (NO => 0,
      YES => 1);

   --  Data CRC Error
   type EISTR_DATCRCSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_DATCRCSelect use
     (NO => 0,
      YES => 1);

   --  Data End Bit Error
   type EISTR_DATENDSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_DATENDSelect use
     (NO => 0,
      YES => 1);

   --  Current Limit Error
   type EISTR_CURLIMSelect is
     (--  No Error
      NO,
      --  Power Fail
      YES)
     with Size => 1;
   for EISTR_CURLIMSelect use
     (NO => 0,
      YES => 1);

   --  Auto CMD Error
   type EISTR_ACMDSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_ACMDSelect use
     (NO => 0,
      YES => 1);

   --  ADMA Error
   type EISTR_ADMASelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_ADMASelect use
     (NO => 0,
      YES => 1);

   --  Error Interrupt Status
   type SDHC_EISTR_Register is record
      --  Command Timeout Error
      CMDTEO         : EISTR_CMDTEOSelect := SAM_SVD.SDHC.NO;
      --  Command CRC Error
      CMDCRC         : EISTR_CMDCRCSelect := SAM_SVD.SDHC.NO;
      --  Command End Bit Error
      CMDEND         : EISTR_CMDENDSelect := SAM_SVD.SDHC.NO;
      --  Command Index Error
      CMDIDX         : EISTR_CMDIDXSelect := SAM_SVD.SDHC.NO;
      --  Data Timeout Error
      DATTEO         : EISTR_DATTEOSelect := SAM_SVD.SDHC.NO;
      --  Data CRC Error
      DATCRC         : EISTR_DATCRCSelect := SAM_SVD.SDHC.NO;
      --  Data End Bit Error
      DATEND         : EISTR_DATENDSelect := SAM_SVD.SDHC.NO;
      --  Current Limit Error
      CURLIM         : EISTR_CURLIMSelect := SAM_SVD.SDHC.NO;
      --  Auto CMD Error
      ACMD           : EISTR_ACMDSelect := SAM_SVD.SDHC.NO;
      --  ADMA Error
      ADMA           : EISTR_ADMASelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_EISTR_Register use record
      CMDTEO         at 0 range 0 .. 0;
      CMDCRC         at 0 range 1 .. 1;
      CMDEND         at 0 range 2 .. 2;
      CMDIDX         at 0 range 3 .. 3;
      DATTEO         at 0 range 4 .. 4;
      DATCRC         at 0 range 5 .. 5;
      DATEND         at 0 range 6 .. 6;
      CURLIM         at 0 range 7 .. 7;
      ACMD           at 0 range 8 .. 8;
      ADMA           at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  Command Timeout Error
   type EISTR_EMMC_MODE_CMDTEOSelect is
     (--  No Error
      NO,
      --  Timeout
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_CMDTEOSelect use
     (NO => 0,
      YES => 1);

   --  Command CRC Error
   type EISTR_EMMC_MODE_CMDCRCSelect is
     (--  No Error
      NO,
      --  CRC Error Generated
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_CMDCRCSelect use
     (NO => 0,
      YES => 1);

   --  Command End Bit Error
   type EISTR_EMMC_MODE_CMDENDSelect is
     (--  No error
      NO,
      --  End Bit Error Generated
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_CMDENDSelect use
     (NO => 0,
      YES => 1);

   --  Command Index Error
   type EISTR_EMMC_MODE_CMDIDXSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_CMDIDXSelect use
     (NO => 0,
      YES => 1);

   --  Data Timeout Error
   type EISTR_EMMC_MODE_DATTEOSelect is
     (--  No Error
      NO,
      --  Timeout
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_DATTEOSelect use
     (NO => 0,
      YES => 1);

   --  Data CRC Error
   type EISTR_EMMC_MODE_DATCRCSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_DATCRCSelect use
     (NO => 0,
      YES => 1);

   --  Data End Bit Error
   type EISTR_EMMC_MODE_DATENDSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_DATENDSelect use
     (NO => 0,
      YES => 1);

   --  Current Limit Error
   type EISTR_EMMC_MODE_CURLIMSelect is
     (--  No Error
      NO,
      --  Power Fail
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_CURLIMSelect use
     (NO => 0,
      YES => 1);

   --  Auto CMD Error
   type EISTR_EMMC_MODE_ACMDSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_ACMDSelect use
     (NO => 0,
      YES => 1);

   --  ADMA Error
   type EISTR_EMMC_MODE_ADMASelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for EISTR_EMMC_MODE_ADMASelect use
     (NO => 0,
      YES => 1);

   --  Boot Acknowledge Error
   type EISTR_EMMC_MODE_BOOTAESelect is
     (--  FIFO contains at least one byte
      Val_0,
      --  FIFO is empty
      Val_1)
     with Size => 1;
   for EISTR_EMMC_MODE_BOOTAESelect use
     (Val_0 => 0,
      Val_1 => 1);

   --  Error Interrupt Status
   type SDHC_EISTR_EMMC_MODE_Register is record
      --  Command Timeout Error
      CMDTEO         : EISTR_EMMC_MODE_CMDTEOSelect := SAM_SVD.SDHC.NO;
      --  Command CRC Error
      CMDCRC         : EISTR_EMMC_MODE_CMDCRCSelect := SAM_SVD.SDHC.NO;
      --  Command End Bit Error
      CMDEND         : EISTR_EMMC_MODE_CMDENDSelect := SAM_SVD.SDHC.NO;
      --  Command Index Error
      CMDIDX         : EISTR_EMMC_MODE_CMDIDXSelect := SAM_SVD.SDHC.NO;
      --  Data Timeout Error
      DATTEO         : EISTR_EMMC_MODE_DATTEOSelect := SAM_SVD.SDHC.NO;
      --  Data CRC Error
      DATCRC         : EISTR_EMMC_MODE_DATCRCSelect := SAM_SVD.SDHC.NO;
      --  Data End Bit Error
      DATEND         : EISTR_EMMC_MODE_DATENDSelect := SAM_SVD.SDHC.NO;
      --  Current Limit Error
      CURLIM         : EISTR_EMMC_MODE_CURLIMSelect := SAM_SVD.SDHC.NO;
      --  Auto CMD Error
      ACMD           : EISTR_EMMC_MODE_ACMDSelect := SAM_SVD.SDHC.NO;
      --  ADMA Error
      ADMA           : EISTR_EMMC_MODE_ADMASelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Boot Acknowledge Error
      BOOTAE         : EISTR_EMMC_MODE_BOOTAESelect := SAM_SVD.SDHC.Val_0;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_EISTR_EMMC_MODE_Register use record
      CMDTEO         at 0 range 0 .. 0;
      CMDCRC         at 0 range 1 .. 1;
      CMDEND         at 0 range 2 .. 2;
      CMDIDX         at 0 range 3 .. 3;
      DATTEO         at 0 range 4 .. 4;
      DATCRC         at 0 range 5 .. 5;
      DATEND         at 0 range 6 .. 6;
      CURLIM         at 0 range 7 .. 7;
      ACMD           at 0 range 8 .. 8;
      ADMA           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      BOOTAE         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
   end record;

   --  Command Complete Status Enable
   type NISTER_CMDCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_CMDCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Transfer Complete Status Enable
   type NISTER_TRFCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_TRFCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Block Gap Event Status Enable
   type NISTER_BLKGESelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_BLKGESelect use
     (MASKED => 0,
      ENABLED => 1);

   --  DMA Interrupt Status Enable
   type NISTER_DMAINTSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_DMAINTSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Write Ready Status Enable
   type NISTER_BWRRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_BWRRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Read Ready Status Enable
   type NISTER_BRDRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_BRDRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Card Insertion Status Enable
   type NISTER_CINSSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_CINSSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Card Removal Status Enable
   type NISTER_CREMSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_CREMSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Card Interrupt Status Enable
   type NISTER_CINTSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_CINTSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Normal Interrupt Status Enable
   type SDHC_NISTER_Register is record
      --  Command Complete Status Enable
      CMDC          : NISTER_CMDCSelect := SAM_SVD.SDHC.MASKED;
      --  Transfer Complete Status Enable
      TRFC          : NISTER_TRFCSelect := SAM_SVD.SDHC.MASKED;
      --  Block Gap Event Status Enable
      BLKGE         : NISTER_BLKGESelect := SAM_SVD.SDHC.MASKED;
      --  DMA Interrupt Status Enable
      DMAINT        : NISTER_DMAINTSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Write Ready Status Enable
      BWRRDY        : NISTER_BWRRDYSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Read Ready Status Enable
      BRDRDY        : NISTER_BRDRDYSelect := SAM_SVD.SDHC.MASKED;
      --  Card Insertion Status Enable
      CINS          : NISTER_CINSSelect := SAM_SVD.SDHC.MASKED;
      --  Card Removal Status Enable
      CREM          : NISTER_CREMSelect := SAM_SVD.SDHC.MASKED;
      --  Card Interrupt Status Enable
      CINT          : NISTER_CINTSelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_NISTER_Register use record
      CMDC          at 0 range 0 .. 0;
      TRFC          at 0 range 1 .. 1;
      BLKGE         at 0 range 2 .. 2;
      DMAINT        at 0 range 3 .. 3;
      BWRRDY        at 0 range 4 .. 4;
      BRDRDY        at 0 range 5 .. 5;
      CINS          at 0 range 6 .. 6;
      CREM          at 0 range 7 .. 7;
      CINT          at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   --  Command Complete Status Enable
   type NISTER_EMMC_MODE_CMDCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_EMMC_MODE_CMDCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Transfer Complete Status Enable
   type NISTER_EMMC_MODE_TRFCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_EMMC_MODE_TRFCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Block Gap Event Status Enable
   type NISTER_EMMC_MODE_BLKGESelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_EMMC_MODE_BLKGESelect use
     (MASKED => 0,
      ENABLED => 1);

   --  DMA Interrupt Status Enable
   type NISTER_EMMC_MODE_DMAINTSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_EMMC_MODE_DMAINTSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Write Ready Status Enable
   type NISTER_EMMC_MODE_BWRRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_EMMC_MODE_BWRRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Read Ready Status Enable
   type NISTER_EMMC_MODE_BRDRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISTER_EMMC_MODE_BRDRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Normal Interrupt Status Enable
   type SDHC_NISTER_EMMC_MODE_Register is record
      --  Command Complete Status Enable
      CMDC           : NISTER_EMMC_MODE_CMDCSelect := SAM_SVD.SDHC.MASKED;
      --  Transfer Complete Status Enable
      TRFC           : NISTER_EMMC_MODE_TRFCSelect := SAM_SVD.SDHC.MASKED;
      --  Block Gap Event Status Enable
      BLKGE          : NISTER_EMMC_MODE_BLKGESelect := SAM_SVD.SDHC.MASKED;
      --  DMA Interrupt Status Enable
      DMAINT         : NISTER_EMMC_MODE_DMAINTSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Write Ready Status Enable
      BWRRDY         : NISTER_EMMC_MODE_BWRRDYSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Read Ready Status Enable
      BRDRDY         : NISTER_EMMC_MODE_BRDRDYSelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_6_13  : HAL.UInt8 := 16#0#;
      --  Boot Acknowledge Received Status Enable
      BOOTAR         : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_NISTER_EMMC_MODE_Register use record
      CMDC           at 0 range 0 .. 0;
      TRFC           at 0 range 1 .. 1;
      BLKGE          at 0 range 2 .. 2;
      DMAINT         at 0 range 3 .. 3;
      BWRRDY         at 0 range 4 .. 4;
      BRDRDY         at 0 range 5 .. 5;
      Reserved_6_13  at 0 range 6 .. 13;
      BOOTAR         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  Command Timeout Error Status Enable
   type EISTER_CMDTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_CMDTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command CRC Error Status Enable
   type EISTER_CMDCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_CMDCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command End Bit Error Status Enable
   type EISTER_CMDENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_CMDENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command Index Error Status Enable
   type EISTER_CMDIDXSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_CMDIDXSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data Timeout Error Status Enable
   type EISTER_DATTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_DATTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data CRC Error Status Enable
   type EISTER_DATCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_DATCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data End Bit Error Status Enable
   type EISTER_DATENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_DATENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Current Limit Error Status Enable
   type EISTER_CURLIMSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_CURLIMSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Auto CMD Error Status Enable
   type EISTER_ACMDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_ACMDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  ADMA Error Status Enable
   type EISTER_ADMASelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_ADMASelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Error Interrupt Status Enable
   type SDHC_EISTER_Register is record
      --  Command Timeout Error Status Enable
      CMDTEO         : EISTER_CMDTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Command CRC Error Status Enable
      CMDCRC         : EISTER_CMDCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Command End Bit Error Status Enable
      CMDEND         : EISTER_CMDENDSelect := SAM_SVD.SDHC.MASKED;
      --  Command Index Error Status Enable
      CMDIDX         : EISTER_CMDIDXSelect := SAM_SVD.SDHC.MASKED;
      --  Data Timeout Error Status Enable
      DATTEO         : EISTER_DATTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Data CRC Error Status Enable
      DATCRC         : EISTER_DATCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Data End Bit Error Status Enable
      DATEND         : EISTER_DATENDSelect := SAM_SVD.SDHC.MASKED;
      --  Current Limit Error Status Enable
      CURLIM         : EISTER_CURLIMSelect := SAM_SVD.SDHC.MASKED;
      --  Auto CMD Error Status Enable
      ACMD           : EISTER_ACMDSelect := SAM_SVD.SDHC.MASKED;
      --  ADMA Error Status Enable
      ADMA           : EISTER_ADMASelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_EISTER_Register use record
      CMDTEO         at 0 range 0 .. 0;
      CMDCRC         at 0 range 1 .. 1;
      CMDEND         at 0 range 2 .. 2;
      CMDIDX         at 0 range 3 .. 3;
      DATTEO         at 0 range 4 .. 4;
      DATCRC         at 0 range 5 .. 5;
      DATEND         at 0 range 6 .. 6;
      CURLIM         at 0 range 7 .. 7;
      ACMD           at 0 range 8 .. 8;
      ADMA           at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  Command Timeout Error Status Enable
   type EISTER_EMMC_MODE_CMDTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_CMDTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command CRC Error Status Enable
   type EISTER_EMMC_MODE_CMDCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_CMDCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command End Bit Error Status Enable
   type EISTER_EMMC_MODE_CMDENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_CMDENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command Index Error Status Enable
   type EISTER_EMMC_MODE_CMDIDXSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_CMDIDXSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data Timeout Error Status Enable
   type EISTER_EMMC_MODE_DATTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_DATTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data CRC Error Status Enable
   type EISTER_EMMC_MODE_DATCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_DATCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data End Bit Error Status Enable
   type EISTER_EMMC_MODE_DATENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_DATENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Current Limit Error Status Enable
   type EISTER_EMMC_MODE_CURLIMSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_CURLIMSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Auto CMD Error Status Enable
   type EISTER_EMMC_MODE_ACMDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_ACMDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  ADMA Error Status Enable
   type EISTER_EMMC_MODE_ADMASelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISTER_EMMC_MODE_ADMASelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Error Interrupt Status Enable
   type SDHC_EISTER_EMMC_MODE_Register is record
      --  Command Timeout Error Status Enable
      CMDTEO         : EISTER_EMMC_MODE_CMDTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Command CRC Error Status Enable
      CMDCRC         : EISTER_EMMC_MODE_CMDCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Command End Bit Error Status Enable
      CMDEND         : EISTER_EMMC_MODE_CMDENDSelect := SAM_SVD.SDHC.MASKED;
      --  Command Index Error Status Enable
      CMDIDX         : EISTER_EMMC_MODE_CMDIDXSelect := SAM_SVD.SDHC.MASKED;
      --  Data Timeout Error Status Enable
      DATTEO         : EISTER_EMMC_MODE_DATTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Data CRC Error Status Enable
      DATCRC         : EISTER_EMMC_MODE_DATCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Data End Bit Error Status Enable
      DATEND         : EISTER_EMMC_MODE_DATENDSelect := SAM_SVD.SDHC.MASKED;
      --  Current Limit Error Status Enable
      CURLIM         : EISTER_EMMC_MODE_CURLIMSelect := SAM_SVD.SDHC.MASKED;
      --  Auto CMD Error Status Enable
      ACMD           : EISTER_EMMC_MODE_ACMDSelect := SAM_SVD.SDHC.MASKED;
      --  ADMA Error Status Enable
      ADMA           : EISTER_EMMC_MODE_ADMASelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Boot Acknowledge Error Status Enable
      BOOTAE         : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_EISTER_EMMC_MODE_Register use record
      CMDTEO         at 0 range 0 .. 0;
      CMDCRC         at 0 range 1 .. 1;
      CMDEND         at 0 range 2 .. 2;
      CMDIDX         at 0 range 3 .. 3;
      DATTEO         at 0 range 4 .. 4;
      DATCRC         at 0 range 5 .. 5;
      DATEND         at 0 range 6 .. 6;
      CURLIM         at 0 range 7 .. 7;
      ACMD           at 0 range 8 .. 8;
      ADMA           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      BOOTAE         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
   end record;

   --  Command Complete Signal Enable
   type NISIER_CMDCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_CMDCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Transfer Complete Signal Enable
   type NISIER_TRFCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_TRFCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Block Gap Event Signal Enable
   type NISIER_BLKGESelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_BLKGESelect use
     (MASKED => 0,
      ENABLED => 1);

   --  DMA Interrupt Signal Enable
   type NISIER_DMAINTSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_DMAINTSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Write Ready Signal Enable
   type NISIER_BWRRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_BWRRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Read Ready Signal Enable
   type NISIER_BRDRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_BRDRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Card Insertion Signal Enable
   type NISIER_CINSSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_CINSSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Card Removal Signal Enable
   type NISIER_CREMSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_CREMSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Card Interrupt Signal Enable
   type NISIER_CINTSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_CINTSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Normal Interrupt Signal Enable
   type SDHC_NISIER_Register is record
      --  Command Complete Signal Enable
      CMDC          : NISIER_CMDCSelect := SAM_SVD.SDHC.MASKED;
      --  Transfer Complete Signal Enable
      TRFC          : NISIER_TRFCSelect := SAM_SVD.SDHC.MASKED;
      --  Block Gap Event Signal Enable
      BLKGE         : NISIER_BLKGESelect := SAM_SVD.SDHC.MASKED;
      --  DMA Interrupt Signal Enable
      DMAINT        : NISIER_DMAINTSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Write Ready Signal Enable
      BWRRDY        : NISIER_BWRRDYSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Read Ready Signal Enable
      BRDRDY        : NISIER_BRDRDYSelect := SAM_SVD.SDHC.MASKED;
      --  Card Insertion Signal Enable
      CINS          : NISIER_CINSSelect := SAM_SVD.SDHC.MASKED;
      --  Card Removal Signal Enable
      CREM          : NISIER_CREMSelect := SAM_SVD.SDHC.MASKED;
      --  Card Interrupt Signal Enable
      CINT          : NISIER_CINTSelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_NISIER_Register use record
      CMDC          at 0 range 0 .. 0;
      TRFC          at 0 range 1 .. 1;
      BLKGE         at 0 range 2 .. 2;
      DMAINT        at 0 range 3 .. 3;
      BWRRDY        at 0 range 4 .. 4;
      BRDRDY        at 0 range 5 .. 5;
      CINS          at 0 range 6 .. 6;
      CREM          at 0 range 7 .. 7;
      CINT          at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   --  Command Complete Signal Enable
   type NISIER_EMMC_MODE_CMDCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_EMMC_MODE_CMDCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Transfer Complete Signal Enable
   type NISIER_EMMC_MODE_TRFCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_EMMC_MODE_TRFCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Block Gap Event Signal Enable
   type NISIER_EMMC_MODE_BLKGESelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_EMMC_MODE_BLKGESelect use
     (MASKED => 0,
      ENABLED => 1);

   --  DMA Interrupt Signal Enable
   type NISIER_EMMC_MODE_DMAINTSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_EMMC_MODE_DMAINTSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Write Ready Signal Enable
   type NISIER_EMMC_MODE_BWRRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_EMMC_MODE_BWRRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Buffer Read Ready Signal Enable
   type NISIER_EMMC_MODE_BRDRDYSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for NISIER_EMMC_MODE_BRDRDYSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Normal Interrupt Signal Enable
   type SDHC_NISIER_EMMC_MODE_Register is record
      --  Command Complete Signal Enable
      CMDC           : NISIER_EMMC_MODE_CMDCSelect := SAM_SVD.SDHC.MASKED;
      --  Transfer Complete Signal Enable
      TRFC           : NISIER_EMMC_MODE_TRFCSelect := SAM_SVD.SDHC.MASKED;
      --  Block Gap Event Signal Enable
      BLKGE          : NISIER_EMMC_MODE_BLKGESelect := SAM_SVD.SDHC.MASKED;
      --  DMA Interrupt Signal Enable
      DMAINT         : NISIER_EMMC_MODE_DMAINTSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Write Ready Signal Enable
      BWRRDY         : NISIER_EMMC_MODE_BWRRDYSelect := SAM_SVD.SDHC.MASKED;
      --  Buffer Read Ready Signal Enable
      BRDRDY         : NISIER_EMMC_MODE_BRDRDYSelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_6_13  : HAL.UInt8 := 16#0#;
      --  Boot Acknowledge Received Signal Enable
      BOOTAR         : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_NISIER_EMMC_MODE_Register use record
      CMDC           at 0 range 0 .. 0;
      TRFC           at 0 range 1 .. 1;
      BLKGE          at 0 range 2 .. 2;
      DMAINT         at 0 range 3 .. 3;
      BWRRDY         at 0 range 4 .. 4;
      BRDRDY         at 0 range 5 .. 5;
      Reserved_6_13  at 0 range 6 .. 13;
      BOOTAR         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  Command Timeout Error Signal Enable
   type EISIER_CMDTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_CMDTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command CRC Error Signal Enable
   type EISIER_CMDCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_CMDCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command End Bit Error Signal Enable
   type EISIER_CMDENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_CMDENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command Index Error Signal Enable
   type EISIER_CMDIDXSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_CMDIDXSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data Timeout Error Signal Enable
   type EISIER_DATTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_DATTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data CRC Error Signal Enable
   type EISIER_DATCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_DATCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data End Bit Error Signal Enable
   type EISIER_DATENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_DATENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Current Limit Error Signal Enable
   type EISIER_CURLIMSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_CURLIMSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Auto CMD Error Signal Enable
   type EISIER_ACMDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_ACMDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  ADMA Error Signal Enable
   type EISIER_ADMASelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_ADMASelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Error Interrupt Signal Enable
   type SDHC_EISIER_Register is record
      --  Command Timeout Error Signal Enable
      CMDTEO         : EISIER_CMDTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Command CRC Error Signal Enable
      CMDCRC         : EISIER_CMDCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Command End Bit Error Signal Enable
      CMDEND         : EISIER_CMDENDSelect := SAM_SVD.SDHC.MASKED;
      --  Command Index Error Signal Enable
      CMDIDX         : EISIER_CMDIDXSelect := SAM_SVD.SDHC.MASKED;
      --  Data Timeout Error Signal Enable
      DATTEO         : EISIER_DATTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Data CRC Error Signal Enable
      DATCRC         : EISIER_DATCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Data End Bit Error Signal Enable
      DATEND         : EISIER_DATENDSelect := SAM_SVD.SDHC.MASKED;
      --  Current Limit Error Signal Enable
      CURLIM         : EISIER_CURLIMSelect := SAM_SVD.SDHC.MASKED;
      --  Auto CMD Error Signal Enable
      ACMD           : EISIER_ACMDSelect := SAM_SVD.SDHC.MASKED;
      --  ADMA Error Signal Enable
      ADMA           : EISIER_ADMASelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_EISIER_Register use record
      CMDTEO         at 0 range 0 .. 0;
      CMDCRC         at 0 range 1 .. 1;
      CMDEND         at 0 range 2 .. 2;
      CMDIDX         at 0 range 3 .. 3;
      DATTEO         at 0 range 4 .. 4;
      DATCRC         at 0 range 5 .. 5;
      DATEND         at 0 range 6 .. 6;
      CURLIM         at 0 range 7 .. 7;
      ACMD           at 0 range 8 .. 8;
      ADMA           at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  Command Timeout Error Signal Enable
   type EISIER_EMMC_MODE_CMDTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_CMDTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command CRC Error Signal Enable
   type EISIER_EMMC_MODE_CMDCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_CMDCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command End Bit Error Signal Enable
   type EISIER_EMMC_MODE_CMDENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_CMDENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Command Index Error Signal Enable
   type EISIER_EMMC_MODE_CMDIDXSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_CMDIDXSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data Timeout Error Signal Enable
   type EISIER_EMMC_MODE_DATTEOSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_DATTEOSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data CRC Error Signal Enable
   type EISIER_EMMC_MODE_DATCRCSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_DATCRCSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Data End Bit Error Signal Enable
   type EISIER_EMMC_MODE_DATENDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_DATENDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Current Limit Error Signal Enable
   type EISIER_EMMC_MODE_CURLIMSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_CURLIMSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Auto CMD Error Signal Enable
   type EISIER_EMMC_MODE_ACMDSelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_ACMDSelect use
     (MASKED => 0,
      ENABLED => 1);

   --  ADMA Error Signal Enable
   type EISIER_EMMC_MODE_ADMASelect is
     (--  Masked
      MASKED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for EISIER_EMMC_MODE_ADMASelect use
     (MASKED => 0,
      ENABLED => 1);

   --  Error Interrupt Signal Enable
   type SDHC_EISIER_EMMC_MODE_Register is record
      --  Command Timeout Error Signal Enable
      CMDTEO         : EISIER_EMMC_MODE_CMDTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Command CRC Error Signal Enable
      CMDCRC         : EISIER_EMMC_MODE_CMDCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Command End Bit Error Signal Enable
      CMDEND         : EISIER_EMMC_MODE_CMDENDSelect := SAM_SVD.SDHC.MASKED;
      --  Command Index Error Signal Enable
      CMDIDX         : EISIER_EMMC_MODE_CMDIDXSelect := SAM_SVD.SDHC.MASKED;
      --  Data Timeout Error Signal Enable
      DATTEO         : EISIER_EMMC_MODE_DATTEOSelect := SAM_SVD.SDHC.MASKED;
      --  Data CRC Error Signal Enable
      DATCRC         : EISIER_EMMC_MODE_DATCRCSelect := SAM_SVD.SDHC.MASKED;
      --  Data End Bit Error Signal Enable
      DATEND         : EISIER_EMMC_MODE_DATENDSelect := SAM_SVD.SDHC.MASKED;
      --  Current Limit Error Signal Enable
      CURLIM         : EISIER_EMMC_MODE_CURLIMSelect := SAM_SVD.SDHC.MASKED;
      --  Auto CMD Error Signal Enable
      ACMD           : EISIER_EMMC_MODE_ACMDSelect := SAM_SVD.SDHC.MASKED;
      --  ADMA Error Signal Enable
      ADMA           : EISIER_EMMC_MODE_ADMASelect := SAM_SVD.SDHC.MASKED;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Boot Acknowledge Error Signal Enable
      BOOTAE         : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_EISIER_EMMC_MODE_Register use record
      CMDTEO         at 0 range 0 .. 0;
      CMDCRC         at 0 range 1 .. 1;
      CMDEND         at 0 range 2 .. 2;
      CMDIDX         at 0 range 3 .. 3;
      DATTEO         at 0 range 4 .. 4;
      DATCRC         at 0 range 5 .. 5;
      DATEND         at 0 range 6 .. 6;
      CURLIM         at 0 range 7 .. 7;
      ACMD           at 0 range 8 .. 8;
      ADMA           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      BOOTAE         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
   end record;

   --  Auto CMD12 Not Executed
   type ACESR_ACMD12NESelect is
     (--  Executed
      EXEC,
      --  Not executed
      NOT_EXEC)
     with Size => 1;
   for ACESR_ACMD12NESelect use
     (EXEC => 0,
      NOT_EXEC => 1);

   --  Auto CMD Timeout Error
   type ACESR_ACMDTEOSelect is
     (--  No error
      NO,
      --  Timeout
      YES)
     with Size => 1;
   for ACESR_ACMDTEOSelect use
     (NO => 0,
      YES => 1);

   --  Auto CMD CRC Error
   type ACESR_ACMDCRCSelect is
     (--  No error
      NO,
      --  CRC Error Generated
      YES)
     with Size => 1;
   for ACESR_ACMDCRCSelect use
     (NO => 0,
      YES => 1);

   --  Auto CMD End Bit Error
   type ACESR_ACMDENDSelect is
     (--  No error
      NO,
      --  End Bit Error Generated
      YES)
     with Size => 1;
   for ACESR_ACMDENDSelect use
     (NO => 0,
      YES => 1);

   --  Auto CMD Index Error
   type ACESR_ACMDIDXSelect is
     (--  No error
      NO,
      --  Error
      YES)
     with Size => 1;
   for ACESR_ACMDIDXSelect use
     (NO => 0,
      YES => 1);

   --  Command not Issued By Auto CMD12 Error
   type ACESR_CMDNISelect is
     (--  No error
      OK,
      --  Not Issued
      NOT_ISSUED)
     with Size => 1;
   for ACESR_CMDNISelect use
     (OK => 0,
      NOT_ISSUED => 1);

   --  Auto CMD Error Status
   type SDHC_ACESR_Register is record
      --  Read-only. Auto CMD12 Not Executed
      ACMD12NE      : ACESR_ACMD12NESelect;
      --  Read-only. Auto CMD Timeout Error
      ACMDTEO       : ACESR_ACMDTEOSelect;
      --  Read-only. Auto CMD CRC Error
      ACMDCRC       : ACESR_ACMDCRCSelect;
      --  Read-only. Auto CMD End Bit Error
      ACMDEND       : ACESR_ACMDENDSelect;
      --  Read-only. Auto CMD Index Error
      ACMDIDX       : ACESR_ACMDIDXSelect;
      --  unspecified
      Reserved_5_6  : HAL.UInt2;
      --  Read-only. Command not Issued By Auto CMD12 Error
      CMDNI         : ACESR_CMDNISelect;
      --  unspecified
      Reserved_8_15 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_ACESR_Register use record
      ACMD12NE      at 0 range 0 .. 0;
      ACMDTEO       at 0 range 1 .. 1;
      ACMDCRC       at 0 range 2 .. 2;
      ACMDEND       at 0 range 3 .. 3;
      ACMDIDX       at 0 range 4 .. 4;
      Reserved_5_6  at 0 range 5 .. 6;
      CMDNI         at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  UHS Mode Select
   type HC2R_UHSMSSelect is
     (--  SDR12
      SDR12,
      --  SDR25
      SDR25,
      --  SDR50
      SDR50,
      --  SDR104
      SDR104,
      --  DDR50
      DDR50)
     with Size => 3;
   for HC2R_UHSMSSelect use
     (SDR12 => 0,
      SDR25 => 1,
      SDR50 => 2,
      SDR104 => 3,
      DDR50 => 4);

   --  1.8V Signaling Enable
   type HC2R_VS18ENSelect is
     (--  3.3V Signaling
      S33V,
      --  1.8V Signaling
      S18V)
     with Size => 1;
   for HC2R_VS18ENSelect use
     (S33V => 0,
      S18V => 1);

   --  Driver Strength Select
   type HC2R_DRVSELSelect is
     (--  Driver Type B is Selected (Default)
      B,
      --  Driver Type A is Selected
      A,
      --  Driver Type C is Selected
      C,
      --  Driver Type D is Selected
      D)
     with Size => 2;
   for HC2R_DRVSELSelect use
     (B => 0,
      A => 1,
      C => 2,
      D => 3);

   --  Execute Tuning
   type HC2R_EXTUNSelect is
     (--  Not Tuned or Tuning Completed
      NO,
      --  Execute Tuning
      REQUESTED)
     with Size => 1;
   for HC2R_EXTUNSelect use
     (NO => 0,
      REQUESTED => 1);

   --  Sampling Clock Select
   type HC2R_SLCKSELSelect is
     (--  Fixed clock is used to sample data
      FIXED,
      --  Tuned clock is used to sample data
      TUNED)
     with Size => 1;
   for HC2R_SLCKSELSelect use
     (FIXED => 0,
      TUNED => 1);

   --  Asynchronous Interrupt Enable
   type HC2R_ASINTENSelect is
     (--  Disabled
      DISABLED,
      --  Enabled
      ENABLED)
     with Size => 1;
   for HC2R_ASINTENSelect use
     (DISABLED => 0,
      ENABLED => 1);

   --  Preset Value Enable
   type HC2R_PVALENSelect is
     (--  SDCLK and Driver Strength are controlled by Host Controller
      HOST,
      --  Automatic Selection by Preset Value is Enabled
      AUTO)
     with Size => 1;
   for HC2R_PVALENSelect use
     (HOST => 0,
      AUTO => 1);

   --  Host Control 2
   type SDHC_HC2R_Register is record
      --  UHS Mode Select
      UHSMS         : HC2R_UHSMSSelect := SAM_SVD.SDHC.SDR12;
      --  1.8V Signaling Enable
      VS18EN        : HC2R_VS18ENSelect := SAM_SVD.SDHC.S33V;
      --  Driver Strength Select
      DRVSEL        : HC2R_DRVSELSelect := SAM_SVD.SDHC.B;
      --  Execute Tuning
      EXTUN         : HC2R_EXTUNSelect := SAM_SVD.SDHC.NO;
      --  Sampling Clock Select
      SLCKSEL       : HC2R_SLCKSELSelect := SAM_SVD.SDHC.FIXED;
      --  unspecified
      Reserved_8_13 : HAL.UInt6 := 16#0#;
      --  Asynchronous Interrupt Enable
      ASINTEN       : HC2R_ASINTENSelect := SAM_SVD.SDHC.DISABLED;
      --  Preset Value Enable
      PVALEN        : HC2R_PVALENSelect := SAM_SVD.SDHC.HOST;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_HC2R_Register use record
      UHSMS         at 0 range 0 .. 2;
      VS18EN        at 0 range 3 .. 3;
      DRVSEL        at 0 range 4 .. 5;
      EXTUN         at 0 range 6 .. 6;
      SLCKSEL       at 0 range 7 .. 7;
      Reserved_8_13 at 0 range 8 .. 13;
      ASINTEN       at 0 range 14 .. 14;
      PVALEN        at 0 range 15 .. 15;
   end record;

   --  HS200 Mode Enable
   type HC2R_EMMC_MODE_HS200ENSelect is
     (--  SDR12
      SDR12,
      --  SDR25
      SDR25,
      --  SDR50
      SDR50,
      --  SDR104
      SDR104,
      --  DDR50
      DDR50)
     with Size => 4;
   for HC2R_EMMC_MODE_HS200ENSelect use
     (SDR12 => 0,
      SDR25 => 1,
      SDR50 => 2,
      SDR104 => 3,
      DDR50 => 4);

   --  Driver Strength Select
   type HC2R_EMMC_MODE_DRVSELSelect is
     (--  Driver Type B is Selected (Default)
      B,
      --  Driver Type A is Selected
      A,
      --  Driver Type C is Selected
      C,
      --  Driver Type D is Selected
      D)
     with Size => 2;
   for HC2R_EMMC_MODE_DRVSELSelect use
     (B => 0,
      A => 1,
      C => 2,
      D => 3);

   --  Execute Tuning
   type HC2R_EMMC_MODE_EXTUNSelect is
     (--  Not Tuned or Tuning Completed
      NO,
      --  Execute Tuning
      REQUESTED)
     with Size => 1;
   for HC2R_EMMC_MODE_EXTUNSelect use
     (NO => 0,
      REQUESTED => 1);

   --  Sampling Clock Select
   type HC2R_EMMC_MODE_SLCKSELSelect is
     (--  Fixed clock is used to sample data
      FIXED,
      --  Tuned clock is used to sample data
      TUNED)
     with Size => 1;
   for HC2R_EMMC_MODE_SLCKSELSelect use
     (FIXED => 0,
      TUNED => 1);

   --  Preset Value Enable
   type HC2R_EMMC_MODE_PVALENSelect is
     (--  SDCLK and Driver Strength are controlled by Host Controller
      HOST,
      --  Automatic Selection by Preset Value is Enabled
      AUTO)
     with Size => 1;
   for HC2R_EMMC_MODE_PVALENSelect use
     (HOST => 0,
      AUTO => 1);

   --  Host Control 2
   type SDHC_HC2R_EMMC_MODE_Register is record
      --  HS200 Mode Enable
      HS200EN       : HC2R_EMMC_MODE_HS200ENSelect := SAM_SVD.SDHC.SDR12;
      --  Driver Strength Select
      DRVSEL        : HC2R_EMMC_MODE_DRVSELSelect := SAM_SVD.SDHC.B;
      --  Execute Tuning
      EXTUN         : HC2R_EMMC_MODE_EXTUNSelect := SAM_SVD.SDHC.NO;
      --  Sampling Clock Select
      SLCKSEL       : HC2R_EMMC_MODE_SLCKSELSelect := SAM_SVD.SDHC.FIXED;
      --  unspecified
      Reserved_8_14 : HAL.UInt7 := 16#0#;
      --  Preset Value Enable
      PVALEN        : HC2R_EMMC_MODE_PVALENSelect := SAM_SVD.SDHC.HOST;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_HC2R_EMMC_MODE_Register use record
      HS200EN       at 0 range 0 .. 3;
      DRVSEL        at 0 range 4 .. 5;
      EXTUN         at 0 range 6 .. 6;
      SLCKSEL       at 0 range 7 .. 7;
      Reserved_8_14 at 0 range 8 .. 14;
      PVALEN        at 0 range 15 .. 15;
   end record;

   --  Timeout Clock Frequency
   type CA0R_TEOCLKFSelect is
     (--  Get information via another method
      OTHER)
     with Size => 6;
   for CA0R_TEOCLKFSelect use
     (OTHER => 0);

   --  Timeout Clock Unit
   type CA0R_TEOCLKUSelect is
     (--  KHz
      KHZ,
      --  MHz
      MHZ)
     with Size => 1;
   for CA0R_TEOCLKUSelect use
     (KHZ => 0,
      MHZ => 1);

   --  Base Clock Frequency
   type CA0R_BASECLKFSelect is
     (--  Get information via another method
      OTHER)
     with Size => 8;
   for CA0R_BASECLKFSelect use
     (OTHER => 0);

   --  Max Block Length
   type CA0R_MAXBLKLSelect is
     (--  512 bytes
      Val_512,
      --  1024 bytes
      Val_1024,
      --  2048 bytes
      Val_2048)
     with Size => 2;
   for CA0R_MAXBLKLSelect use
     (Val_512 => 0,
      Val_1024 => 1,
      Val_2048 => 2);

   --  8-bit Support for Embedded Device
   type CA0R_ED8SUPSelect is
     (--  8-bit Bus Width not Supported
      NO,
      --  8-bit Bus Width Supported
      YES)
     with Size => 1;
   for CA0R_ED8SUPSelect use
     (NO => 0,
      YES => 1);

   --  ADMA2 Support
   type CA0R_ADMA2SUPSelect is
     (--  ADMA2 not Supported
      NO,
      --  ADMA2 Supported
      YES)
     with Size => 1;
   for CA0R_ADMA2SUPSelect use
     (NO => 0,
      YES => 1);

   --  High Speed Support
   type CA0R_HSSUPSelect is
     (--  High Speed not Supported
      NO,
      --  High Speed Supported
      YES)
     with Size => 1;
   for CA0R_HSSUPSelect use
     (NO => 0,
      YES => 1);

   --  SDMA Support
   type CA0R_SDMASUPSelect is
     (--  SDMA not Supported
      NO,
      --  SDMA Supported
      YES)
     with Size => 1;
   for CA0R_SDMASUPSelect use
     (NO => 0,
      YES => 1);

   --  Suspend/Resume Support
   type CA0R_SRSUPSelect is
     (--  Suspend/Resume not Supported
      NO,
      --  Suspend/Resume Supported
      YES)
     with Size => 1;
   for CA0R_SRSUPSelect use
     (NO => 0,
      YES => 1);

   --  Voltage Support 3.3V
   type CA0R_V33VSUPSelect is
     (--  3.3V Not Supported
      NO,
      --  3.3V Supported
      YES)
     with Size => 1;
   for CA0R_V33VSUPSelect use
     (NO => 0,
      YES => 1);

   --  Voltage Support 3.0V
   type CA0R_V30VSUPSelect is
     (--  3.0V Not Supported
      NO,
      --  3.0V Supported
      YES)
     with Size => 1;
   for CA0R_V30VSUPSelect use
     (NO => 0,
      YES => 1);

   --  Voltage Support 1.8V
   type CA0R_V18VSUPSelect is
     (--  1.8V Not Supported
      NO,
      --  1.8V Supported
      YES)
     with Size => 1;
   for CA0R_V18VSUPSelect use
     (NO => 0,
      YES => 1);

   --  64-Bit System Bus Support
   type CA0R_SB64SUPSelect is
     (--  32-bit Address Descriptors and System Bus
      NO,
      --  64-bit Address Descriptors and System Bus
      YES)
     with Size => 1;
   for CA0R_SB64SUPSelect use
     (NO => 0,
      YES => 1);

   --  Asynchronous Interrupt Support
   type CA0R_ASINTSUPSelect is
     (--  Asynchronous Interrupt not Supported
      NO,
      --  Asynchronous Interrupt supported
      YES)
     with Size => 1;
   for CA0R_ASINTSUPSelect use
     (NO => 0,
      YES => 1);

   --  Slot Type
   type CA0R_SLTYPESelect is
     (--  Removable Card Slot
      REMOVABLE,
      --  Embedded Slot for One Device
      EMBEDDED)
     with Size => 2;
   for CA0R_SLTYPESelect use
     (REMOVABLE => 0,
      EMBEDDED => 1);

   --  Capabilities 0
   type SDHC_CA0R_Register is record
      --  Read-only. Timeout Clock Frequency
      TEOCLKF        : CA0R_TEOCLKFSelect;
      --  unspecified
      Reserved_6_6   : HAL.Bit;
      --  Read-only. Timeout Clock Unit
      TEOCLKU        : CA0R_TEOCLKUSelect;
      --  Read-only. Base Clock Frequency
      BASECLKF       : CA0R_BASECLKFSelect;
      --  Read-only. Max Block Length
      MAXBLKL        : CA0R_MAXBLKLSelect;
      --  Read-only. 8-bit Support for Embedded Device
      ED8SUP         : CA0R_ED8SUPSelect;
      --  Read-only. ADMA2 Support
      ADMA2SUP       : CA0R_ADMA2SUPSelect;
      --  unspecified
      Reserved_20_20 : HAL.Bit;
      --  Read-only. High Speed Support
      HSSUP          : CA0R_HSSUPSelect;
      --  Read-only. SDMA Support
      SDMASUP        : CA0R_SDMASUPSelect;
      --  Read-only. Suspend/Resume Support
      SRSUP          : CA0R_SRSUPSelect;
      --  Read-only. Voltage Support 3.3V
      V33VSUP        : CA0R_V33VSUPSelect;
      --  Read-only. Voltage Support 3.0V
      V30VSUP        : CA0R_V30VSUPSelect;
      --  Read-only. Voltage Support 1.8V
      V18VSUP        : CA0R_V18VSUPSelect;
      --  unspecified
      Reserved_27_27 : HAL.Bit;
      --  Read-only. 64-Bit System Bus Support
      SB64SUP        : CA0R_SB64SUPSelect;
      --  Read-only. Asynchronous Interrupt Support
      ASINTSUP       : CA0R_ASINTSUPSelect;
      --  Read-only. Slot Type
      SLTYPE         : CA0R_SLTYPESelect;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SDHC_CA0R_Register use record
      TEOCLKF        at 0 range 0 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      TEOCLKU        at 0 range 7 .. 7;
      BASECLKF       at 0 range 8 .. 15;
      MAXBLKL        at 0 range 16 .. 17;
      ED8SUP         at 0 range 18 .. 18;
      ADMA2SUP       at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      HSSUP          at 0 range 21 .. 21;
      SDMASUP        at 0 range 22 .. 22;
      SRSUP          at 0 range 23 .. 23;
      V33VSUP        at 0 range 24 .. 24;
      V30VSUP        at 0 range 25 .. 25;
      V18VSUP        at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      SB64SUP        at 0 range 28 .. 28;
      ASINTSUP       at 0 range 29 .. 29;
      SLTYPE         at 0 range 30 .. 31;
   end record;

   --  SDR50 Support
   type CA1R_SDR50SUPSelect is
     (--  SDR50 is Not Supported
      NO,
      --  SDR50 is Supported
      YES)
     with Size => 1;
   for CA1R_SDR50SUPSelect use
     (NO => 0,
      YES => 1);

   --  SDR104 Support
   type CA1R_SDR104SUPSelect is
     (--  SDR104 is Not Supported
      NO,
      --  SDR104 is Supported
      YES)
     with Size => 1;
   for CA1R_SDR104SUPSelect use
     (NO => 0,
      YES => 1);

   --  DDR50 Support
   type CA1R_DDR50SUPSelect is
     (--  DDR50 is Not Supported
      NO,
      --  DDR50 is Supported
      YES)
     with Size => 1;
   for CA1R_DDR50SUPSelect use
     (NO => 0,
      YES => 1);

   --  Driver Type A Support
   type CA1R_DRVASUPSelect is
     (--  Driver Type A is Not Supported
      NO,
      --  Driver Type A is Supported
      YES)
     with Size => 1;
   for CA1R_DRVASUPSelect use
     (NO => 0,
      YES => 1);

   --  Driver Type C Support
   type CA1R_DRVCSUPSelect is
     (--  Driver Type C is Not Supported
      NO,
      --  Driver Type C is Supported
      YES)
     with Size => 1;
   for CA1R_DRVCSUPSelect use
     (NO => 0,
      YES => 1);

   --  Driver Type D Support
   type CA1R_DRVDSUPSelect is
     (--  Driver Type D is Not Supported
      NO,
      --  Driver Type D is Supported
      YES)
     with Size => 1;
   for CA1R_DRVDSUPSelect use
     (NO => 0,
      YES => 1);

   --  Timer Count for Re-Tuning
   type CA1R_TCNTRTSelect is
     (--  Re-Tuning Timer disabled
      DISABLED,
      --  1 second
      Val_1S,
      --  2 seconds
      Val_2S,
      --  4 seconds
      Val_4S,
      --  8 seconds
      Val_8S,
      --  16 seconds
      Val_16S,
      --  32 seconds
      Val_32S,
      --  64 seconds
      Val_64S,
      --  128 seconds
      Val_128S,
      --  256 seconds
      Val_256S,
      --  512 seconds
      Val_512S,
      --  1024 seconds
      Val_1024S,
      --  Get information from other source
      OTHER)
     with Size => 4;
   for CA1R_TCNTRTSelect use
     (DISABLED => 0,
      Val_1S => 1,
      Val_2S => 2,
      Val_4S => 3,
      Val_8S => 4,
      Val_16S => 5,
      Val_32S => 6,
      Val_64S => 7,
      Val_128S => 8,
      Val_256S => 9,
      Val_512S => 10,
      Val_1024S => 11,
      OTHER => 15);

   --  Use Tuning for SDR50
   type CA1R_TSDR50Select is
     (--  SDR50 does not require tuning
      NO,
      --  SDR50 requires tuning
      YES)
     with Size => 1;
   for CA1R_TSDR50Select use
     (NO => 0,
      YES => 1);

   --  Clock Multiplier
   type CA1R_CLKMULTSelect is
     (--  Clock Multiplier is Not Supported
      NO)
     with Size => 8;
   for CA1R_CLKMULTSelect use
     (NO => 0);

   --  Capabilities 1
   type SDHC_CA1R_Register is record
      --  Read-only. SDR50 Support
      SDR50SUP       : CA1R_SDR50SUPSelect;
      --  Read-only. SDR104 Support
      SDR104SUP      : CA1R_SDR104SUPSelect;
      --  Read-only. DDR50 Support
      DDR50SUP       : CA1R_DDR50SUPSelect;
      --  unspecified
      Reserved_3_3   : HAL.Bit;
      --  Read-only. Driver Type A Support
      DRVASUP        : CA1R_DRVASUPSelect;
      --  Read-only. Driver Type C Support
      DRVCSUP        : CA1R_DRVCSUPSelect;
      --  Read-only. Driver Type D Support
      DRVDSUP        : CA1R_DRVDSUPSelect;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Timer Count for Re-Tuning
      TCNTRT         : CA1R_TCNTRTSelect;
      --  unspecified
      Reserved_12_12 : HAL.Bit;
      --  Read-only. Use Tuning for SDR50
      TSDR50         : CA1R_TSDR50Select;
      --  unspecified
      Reserved_14_15 : HAL.UInt2;
      --  Read-only. Clock Multiplier
      CLKMULT        : CA1R_CLKMULTSelect;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SDHC_CA1R_Register use record
      SDR50SUP       at 0 range 0 .. 0;
      SDR104SUP      at 0 range 1 .. 1;
      DDR50SUP       at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      DRVASUP        at 0 range 4 .. 4;
      DRVCSUP        at 0 range 5 .. 5;
      DRVDSUP        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TCNTRT         at 0 range 8 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      TSDR50         at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      CLKMULT        at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Maximum Current for 3.3V
   type MCCAR_MAXCUR33VSelect is
     (--  Get information via another method
      OTHER,
      --  4mA
      Val_4MA,
      --  8mA
      Val_8MA,
      --  12mA
      Val_12MA)
     with Size => 8;
   for MCCAR_MAXCUR33VSelect use
     (OTHER => 0,
      Val_4MA => 1,
      Val_8MA => 2,
      Val_12MA => 3);

   --  Maximum Current for 3.0V
   type MCCAR_MAXCUR30VSelect is
     (--  Get information via another method
      OTHER,
      --  4mA
      Val_4MA,
      --  8mA
      Val_8MA,
      --  12mA
      Val_12MA)
     with Size => 8;
   for MCCAR_MAXCUR30VSelect use
     (OTHER => 0,
      Val_4MA => 1,
      Val_8MA => 2,
      Val_12MA => 3);

   --  Maximum Current for 1.8V
   type MCCAR_MAXCUR18VSelect is
     (--  Get information via another method
      OTHER,
      --  4mA
      Val_4MA,
      --  8mA
      Val_8MA,
      --  12mA
      Val_12MA)
     with Size => 8;
   for MCCAR_MAXCUR18VSelect use
     (OTHER => 0,
      Val_4MA => 1,
      Val_8MA => 2,
      Val_12MA => 3);

   --  Maximum Current Capabilities
   type SDHC_MCCAR_Register is record
      --  Read-only. Maximum Current for 3.3V
      MAXCUR33V      : MCCAR_MAXCUR33VSelect;
      --  Read-only. Maximum Current for 3.0V
      MAXCUR30V      : MCCAR_MAXCUR30VSelect;
      --  Read-only. Maximum Current for 1.8V
      MAXCUR18V      : MCCAR_MAXCUR18VSelect;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SDHC_MCCAR_Register use record
      MAXCUR33V      at 0 range 0 .. 7;
      MAXCUR30V      at 0 range 8 .. 15;
      MAXCUR18V      at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Force Event for Auto CMD12 Not Executed
   type FERACES_ACMD12NESelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FERACES_ACMD12NESelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Auto CMD Timeout Error
   type FERACES_ACMDTEOSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FERACES_ACMDTEOSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Auto CMD CRC Error
   type FERACES_ACMDCRCSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FERACES_ACMDCRCSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Auto CMD End Bit Error
   type FERACES_ACMDENDSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FERACES_ACMDENDSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Auto CMD Index Error
   type FERACES_ACMDIDXSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FERACES_ACMDIDXSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Command Not Issued By Auto CMD12 Error
   type FERACES_CMDNISelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FERACES_CMDNISelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Auto CMD Error Status
   type SDHC_FERACES_Register is record
      --  Write-only. Force Event for Auto CMD12 Not Executed
      ACMD12NE      : FERACES_ACMD12NESelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Auto CMD Timeout Error
      ACMDTEO       : FERACES_ACMDTEOSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Auto CMD CRC Error
      ACMDCRC       : FERACES_ACMDCRCSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Auto CMD End Bit Error
      ACMDEND       : FERACES_ACMDENDSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Auto CMD Index Error
      ACMDIDX       : FERACES_ACMDIDXSelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_5_6  : HAL.UInt2 := 16#0#;
      --  Write-only. Force Event for Command Not Issued By Auto CMD12 Error
      CMDNI         : FERACES_CMDNISelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_FERACES_Register use record
      ACMD12NE      at 0 range 0 .. 0;
      ACMDTEO       at 0 range 1 .. 1;
      ACMDCRC       at 0 range 2 .. 2;
      ACMDEND       at 0 range 3 .. 3;
      ACMDIDX       at 0 range 4 .. 4;
      Reserved_5_6  at 0 range 5 .. 6;
      CMDNI         at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  Force Event for Command Timeout Error
   type FEREIS_CMDTEOSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_CMDTEOSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Command CRC Error
   type FEREIS_CMDCRCSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_CMDCRCSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Command End Bit Error
   type FEREIS_CMDENDSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_CMDENDSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Command Index Error
   type FEREIS_CMDIDXSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_CMDIDXSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Data Timeout Error
   type FEREIS_DATTEOSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_DATTEOSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Data CRC Error
   type FEREIS_DATCRCSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_DATCRCSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Data End Bit Error
   type FEREIS_DATENDSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_DATENDSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Current Limit Error
   type FEREIS_CURLIMSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_CURLIMSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Auto CMD Error
   type FEREIS_ACMDSelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_ACMDSelect use
     (NO => 0,
      YES => 1);

   --  Force Event for ADMA Error
   type FEREIS_ADMASelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_ADMASelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Boot Acknowledge Error
   type FEREIS_BOOTAESelect is
     (--  No Interrupt
      NO,
      --  Interrupt is generated
      YES)
     with Size => 1;
   for FEREIS_BOOTAESelect use
     (NO => 0,
      YES => 1);

   --  Force Event for Error Interrupt Status
   type SDHC_FEREIS_Register is record
      --  Write-only. Force Event for Command Timeout Error
      CMDTEO         : FEREIS_CMDTEOSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Command CRC Error
      CMDCRC         : FEREIS_CMDCRCSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Command End Bit Error
      CMDEND         : FEREIS_CMDENDSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Command Index Error
      CMDIDX         : FEREIS_CMDIDXSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Data Timeout Error
      DATTEO         : FEREIS_DATTEOSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Data CRC Error
      DATCRC         : FEREIS_DATCRCSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Data End Bit Error
      DATEND         : FEREIS_DATENDSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Current Limit Error
      CURLIM         : FEREIS_CURLIMSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for Auto CMD Error
      ACMD           : FEREIS_ACMDSelect := SAM_SVD.SDHC.NO;
      --  Write-only. Force Event for ADMA Error
      ADMA           : FEREIS_ADMASelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Write-only. Force Event for Boot Acknowledge Error
      BOOTAE         : FEREIS_BOOTAESelect := SAM_SVD.SDHC.NO;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_FEREIS_Register use record
      CMDTEO         at 0 range 0 .. 0;
      CMDCRC         at 0 range 1 .. 1;
      CMDEND         at 0 range 2 .. 2;
      CMDIDX         at 0 range 3 .. 3;
      DATTEO         at 0 range 4 .. 4;
      DATCRC         at 0 range 5 .. 5;
      DATEND         at 0 range 6 .. 6;
      CURLIM         at 0 range 7 .. 7;
      ACMD           at 0 range 8 .. 8;
      ADMA           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      BOOTAE         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
   end record;

   --  ADMA Error State
   type AESR_ERRSTSelect is
     (--  ST_STOP (Stop DMA)
      STOP,
      --  ST_FDS (Fetch Descriptor)
      FDS,
      --  ST_TFR (Transfer Data)
      TFR)
     with Size => 2;
   for AESR_ERRSTSelect use
     (STOP => 0,
      FDS => 1,
      TFR => 3);

   --  ADMA Length Mismatch Error
   type AESR_LMISSelect is
     (--  No Error
      NO,
      --  Error
      YES)
     with Size => 1;
   for AESR_LMISSelect use
     (NO => 0,
      YES => 1);

   --  ADMA Error Status
   type SDHC_AESR_Register is record
      --  Read-only. ADMA Error State
      ERRST        : AESR_ERRSTSelect;
      --  Read-only. ADMA Length Mismatch Error
      LMIS         : AESR_LMISSelect;
      --  unspecified
      Reserved_3_7 : HAL.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_AESR_Register use record
      ERRST        at 0 range 0 .. 1;
      LMIS         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   subtype SDHC_PVR_SDCLKFSEL_Field is HAL.UInt10;

   --  Clock Generator Select Value for Initialization
   type PVR_CLKGSELSelect is
     (--  Host Controller Ver2.00 Compatible Clock Generator (Divider)
      DIV,
      --  Programmable Clock Generator
      PROG)
     with Size => 1;
   for PVR_CLKGSELSelect use
     (DIV => 0,
      PROG => 1);

   --  Driver Strength Select Value for Initialization
   type PVR_DRVSELSelect is
     (--  Driver Type B is Selected
      B,
      --  Driver Type A is Selected
      A,
      --  Driver Type C is Selected
      C,
      --  Driver Type D is Selected
      D)
     with Size => 2;
   for PVR_DRVSELSelect use
     (B => 0,
      A => 1,
      C => 2,
      D => 3);

   --  Preset Value n
   type SDHC_PVR_Register is record
      --  SDCLK Frequency Select Value for Initialization
      SDCLKFSEL      : SDHC_PVR_SDCLKFSEL_Field := 16#0#;
      --  Clock Generator Select Value for Initialization
      CLKGSEL        : PVR_CLKGSELSelect := SAM_SVD.SDHC.DIV;
      --  unspecified
      Reserved_11_13 : HAL.UInt3 := 16#0#;
      --  Driver Strength Select Value for Initialization
      DRVSEL         : PVR_DRVSELSelect := SAM_SVD.SDHC.B;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_PVR_Register use record
      SDCLKFSEL      at 0 range 0 .. 9;
      CLKGSEL        at 0 range 10 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      DRVSEL         at 0 range 14 .. 15;
   end record;

   --  Preset Value n
   type SDHC_PVR_Registers is array (0 .. 7) of SDHC_PVR_Register;

   --  Slot Interrupt Status
   type SDHC_SISR_Register is record
      --  Read-only. Interrupt Signal for Each Slot
      INTSSL        : Boolean;
      --  unspecified
      Reserved_1_15 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_SISR_Register use record
      INTSSL        at 0 range 0 .. 0;
      Reserved_1_15 at 0 range 1 .. 15;
   end record;

   subtype SDHC_HCVR_SVER_Field is HAL.UInt8;
   subtype SDHC_HCVR_VVER_Field is HAL.UInt8;

   --  Host Controller Version
   type SDHC_HCVR_Register is record
      --  Read-only. Spec Version
      SVER : SDHC_HCVR_SVER_Field;
      --  Read-only. Vendor Version
      VVER : SDHC_HCVR_VVER_Field;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SDHC_HCVR_Register use record
      SVER at 0 range 0 .. 7;
      VVER at 0 range 8 .. 15;
   end record;

   --  e.MMC Command Type
   type MC1R_CMDTYPSelect is
     (--  Not a MMC specific command
      NORMAL,
      --  Wait IRQ Command
      WAITIRQ,
      --  Stream Command
      STREAM,
      --  Boot Command
      BOOT)
     with Size => 2;
   for MC1R_CMDTYPSelect use
     (NORMAL => 0,
      WAITIRQ => 1,
      STREAM => 2,
      BOOT => 3);

   --  MMC Control 1
   type SDHC_MC1R_Register is record
      --  e.MMC Command Type
      CMDTYP       : MC1R_CMDTYPSelect := SAM_SVD.SDHC.NORMAL;
      --  unspecified
      Reserved_2_2 : HAL.Bit := 16#0#;
      --  e.MMC HSDDR Mode
      DDR          : Boolean := False;
      --  e.MMC Open Drain Mode
      OPD          : Boolean := False;
      --  e.MMC Boot Acknowledge Enable
      BOOTA        : Boolean := False;
      --  e.MMC Reset Signal
      RSTN         : Boolean := False;
      --  e.MMC Force Card Detect
      FCD          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_MC1R_Register use record
      CMDTYP       at 0 range 0 .. 1;
      Reserved_2_2 at 0 range 2 .. 2;
      DDR          at 0 range 3 .. 3;
      OPD          at 0 range 4 .. 4;
      BOOTA        at 0 range 5 .. 5;
      RSTN         at 0 range 6 .. 6;
      FCD          at 0 range 7 .. 7;
   end record;

   --  MMC Control 2
   type SDHC_MC2R_Register is record
      --  Write-only. e.MMC Abort Wait IRQ
      SRESP        : Boolean := False;
      --  Write-only. e.MMC Abort Boot
      ABOOT        : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_MC2R_Register use record
      SRESP        at 0 range 0 .. 0;
      ABOOT        at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  AHB Maximum Burst
   type ACR_BMAXSelect is
     (INCR16,
      INCR8,
      INCR4,
      SINGLE)
     with Size => 2;
   for ACR_BMAXSelect use
     (INCR16 => 0,
      INCR8 => 1,
      INCR4 => 2,
      SINGLE => 3);

   --  AHB Control
   type SDHC_ACR_Register is record
      --  AHB Maximum Burst
      BMAX          : ACR_BMAXSelect := SAM_SVD.SDHC.INCR16;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SDHC_ACR_Register use record
      BMAX          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Force SDCK Disabled
   type CC2R_FSDCLKDSelect is
     (--  No effect
      NOEFFECT,
      --  SDCLK can be stopped at any time after DATA transfer.SDCLK enable forcing
--  for 8 SDCLK cycles is disabled
      DISABLE)
     with Size => 1;
   for CC2R_FSDCLKDSelect use
     (NOEFFECT => 0,
      DISABLE => 1);

   --  Clock Control 2
   type SDHC_CC2R_Register is record
      --  Force SDCK Disabled
      FSDCLKD       : CC2R_FSDCLKDSelect := SAM_SVD.SDHC.NOEFFECT;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SDHC_CC2R_Register use record
      FSDCLKD       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype SDHC_CACR_KEY_Field is HAL.UInt8;

   --  Capabilities Control
   type SDHC_CACR_Register is record
      --  Capabilities Registers Write Enable (Required to write the correct
      --  frequencies in the Capabilities Registers)
      CAPWREN        : Boolean := False;
      --  unspecified
      Reserved_1_7   : HAL.UInt7 := 16#0#;
      --  Key (0x46)
      KEY            : SDHC_CACR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SDHC_CACR_Register use record
      CAPWREN        at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      KEY            at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Non-intrusive debug enable
   type DBGR_NIDBGSelect is
     (--  Debugging is intrusive (reads of BDPR from debugger are considered and
--  increment the internal buffer pointer)
      IDBG,
      --  Debugging is not intrusive (reads of BDPR from debugger are discarded and
--  do not increment the internal buffer pointer)
      NIDBG)
     with Size => 1;
   for DBGR_NIDBGSelect use
     (IDBG => 0,
      NIDBG => 1);

   --  Debug
   type SDHC_DBGR_Register is record
      --  Non-intrusive debug enable
      NIDBG        : DBGR_NIDBGSelect := SAM_SVD.SDHC.IDBG;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SDHC_DBGR_Register use record
      NIDBG        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SDHC0_Disc is
     (Default,
      CMD23_MODE,
      EMMC_MODE);

   --  SD/MMC Host Controller
   type SDHC0_Peripheral
     (Discriminent : SDHC0_Disc := Default)
   is record
      --  Block Size
      BSR              : aliased SDHC_BSR_Register;
      --  Block Count
      BCR              : aliased HAL.UInt16;
      --  Argument 1
      ARG1R            : aliased HAL.UInt32;
      --  Transfer Mode
      TMR              : aliased SDHC_TMR_Register;
      --  Command
      CR               : aliased SDHC_CR_Register;
      --  Response
      RR               : aliased SDHC_RR_Registers;
      --  Buffer Data Port
      BDPR             : aliased HAL.UInt32;
      --  Present State
      PSR              : aliased SDHC_PSR_Register;
      --  Power Control
      PCR              : aliased SDHC_PCR_Register;
      --  Wakeup Control
      WCR              : aliased SDHC_WCR_Register;
      --  Clock Control
      CCR              : aliased SDHC_CCR_Register;
      --  Timeout Control
      TCR              : aliased SDHC_TCR_Register;
      --  Software Reset
      SRR              : aliased SDHC_SRR_Register;
      --  Auto CMD Error Status
      ACESR            : aliased SDHC_ACESR_Register;
      --  Capabilities 0
      CA0R             : aliased SDHC_CA0R_Register;
      --  Capabilities 1
      CA1R             : aliased SDHC_CA1R_Register;
      --  Maximum Current Capabilities
      MCCAR            : aliased SDHC_MCCAR_Register;
      --  Force Event for Auto CMD Error Status
      FERACES          : aliased SDHC_FERACES_Register;
      --  Force Event for Error Interrupt Status
      FEREIS           : aliased SDHC_FEREIS_Register;
      --  ADMA Error Status
      AESR             : aliased SDHC_AESR_Register;
      --  ADMA System Address n
      ASAR             : aliased HAL.UInt32;
      --  Preset Value n
      PVR              : aliased SDHC_PVR_Registers;
      --  Slot Interrupt Status
      SISR             : aliased SDHC_SISR_Register;
      --  Host Controller Version
      HCVR             : aliased SDHC_HCVR_Register;
      --  MMC Control 1
      MC1R             : aliased SDHC_MC1R_Register;
      --  MMC Control 2
      MC2R             : aliased SDHC_MC2R_Register;
      --  AHB Control
      ACR              : aliased SDHC_ACR_Register;
      --  Clock Control 2
      CC2R             : aliased SDHC_CC2R_Register;
      --  Capabilities Control
      CACR             : aliased SDHC_CACR_Register;
      --  Debug
      DBGR             : aliased SDHC_DBGR_Register;
      case Discriminent is
         when Default =>
            --  SDMA System Address / Argument 2
            SSAR : aliased HAL.UInt32;
            --  Host Control 1
            HC1R : aliased SDHC_HC1R_Register;
            --  Block Gap Control
            BGCR : aliased SDHC_BGCR_Register;
            --  Normal Interrupt Status
            NISTR : aliased SDHC_NISTR_Register;
            --  Error Interrupt Status
            EISTR : aliased SDHC_EISTR_Register;
            --  Normal Interrupt Status Enable
            NISTER : aliased SDHC_NISTER_Register;
            --  Error Interrupt Status Enable
            EISTER : aliased SDHC_EISTER_Register;
            --  Normal Interrupt Signal Enable
            NISIER : aliased SDHC_NISIER_Register;
            --  Error Interrupt Signal Enable
            EISIER : aliased SDHC_EISIER_Register;
            --  Host Control 2
            HC2R : aliased SDHC_HC2R_Register;
         when CMD23_MODE =>
            --  SDMA System Address / Argument 2
            SSAR_CMD23_MODE : aliased HAL.UInt32;
         when EMMC_MODE =>
            --  Host Control 1
            HC1R_EMMC_MODE : aliased SDHC_HC1R_EMMC_MODE_Register;
            --  Block Gap Control
            BGCR_EMMC_MODE : aliased SDHC_BGCR_EMMC_MODE_Register;
            --  Normal Interrupt Status
            NISTR_EMMC_MODE : aliased SDHC_NISTR_EMMC_MODE_Register;
            --  Error Interrupt Status
            EISTR_EMMC_MODE : aliased SDHC_EISTR_EMMC_MODE_Register;
            --  Normal Interrupt Status Enable
            NISTER_EMMC_MODE : aliased SDHC_NISTER_EMMC_MODE_Register;
            --  Error Interrupt Status Enable
            EISTER_EMMC_MODE : aliased SDHC_EISTER_EMMC_MODE_Register;
            --  Normal Interrupt Signal Enable
            NISIER_EMMC_MODE : aliased SDHC_NISIER_EMMC_MODE_Register;
            --  Error Interrupt Signal Enable
            EISIER_EMMC_MODE : aliased SDHC_EISIER_EMMC_MODE_Register;
            --  Host Control 2
            HC2R_EMMC_MODE : aliased SDHC_HC2R_EMMC_MODE_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for SDHC0_Peripheral use record
      BSR              at 16#4# range 0 .. 15;
      BCR              at 16#6# range 0 .. 15;
      ARG1R            at 16#8# range 0 .. 31;
      TMR              at 16#C# range 0 .. 15;
      CR               at 16#E# range 0 .. 15;
      RR               at 16#10# range 0 .. 127;
      BDPR             at 16#20# range 0 .. 31;
      PSR              at 16#24# range 0 .. 31;
      PCR              at 16#29# range 0 .. 7;
      WCR              at 16#2B# range 0 .. 7;
      CCR              at 16#2C# range 0 .. 15;
      TCR              at 16#2E# range 0 .. 7;
      SRR              at 16#2F# range 0 .. 7;
      ACESR            at 16#3C# range 0 .. 15;
      CA0R             at 16#40# range 0 .. 31;
      CA1R             at 16#44# range 0 .. 31;
      MCCAR            at 16#48# range 0 .. 31;
      FERACES          at 16#50# range 0 .. 15;
      FEREIS           at 16#52# range 0 .. 15;
      AESR             at 16#54# range 0 .. 7;
      ASAR             at 16#58# range 0 .. 31;
      PVR              at 16#60# range 0 .. 127;
      SISR             at 16#FC# range 0 .. 15;
      HCVR             at 16#FE# range 0 .. 15;
      MC1R             at 16#204# range 0 .. 7;
      MC2R             at 16#205# range 0 .. 7;
      ACR              at 16#208# range 0 .. 31;
      CC2R             at 16#20C# range 0 .. 31;
      CACR             at 16#230# range 0 .. 31;
      DBGR             at 16#234# range 0 .. 7;
      SSAR             at 16#0# range 0 .. 31;
      HC1R             at 16#28# range 0 .. 7;
      BGCR             at 16#2A# range 0 .. 7;
      NISTR            at 16#30# range 0 .. 15;
      EISTR            at 16#32# range 0 .. 15;
      NISTER           at 16#34# range 0 .. 15;
      EISTER           at 16#36# range 0 .. 15;
      NISIER           at 16#38# range 0 .. 15;
      EISIER           at 16#3A# range 0 .. 15;
      HC2R             at 16#3E# range 0 .. 15;
      SSAR_CMD23_MODE  at 16#0# range 0 .. 31;
      HC1R_EMMC_MODE   at 16#28# range 0 .. 7;
      BGCR_EMMC_MODE   at 16#2A# range 0 .. 7;
      NISTR_EMMC_MODE  at 16#30# range 0 .. 15;
      EISTR_EMMC_MODE  at 16#32# range 0 .. 15;
      NISTER_EMMC_MODE at 16#34# range 0 .. 15;
      EISTER_EMMC_MODE at 16#36# range 0 .. 15;
      NISIER_EMMC_MODE at 16#38# range 0 .. 15;
      EISIER_EMMC_MODE at 16#3A# range 0 .. 15;
      HC2R_EMMC_MODE   at 16#3E# range 0 .. 15;
   end record;

   --  SD/MMC Host Controller
   SDHC0_Periph : aliased SDHC0_Peripheral
     with Import, Address => SDHC0_Base;

end SAM_SVD.SDHC;
