pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.DMAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  DMAC_CTRL_LVLEN array
   type DMAC_CTRL_LVLEN_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for DMAC_CTRL_LVLEN
   type DMAC_CTRL_LVLEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  LVLEN as a value
            Val : HAL.UInt4;
         when True =>
            --  LVLEN as an array
            Arr : DMAC_CTRL_LVLEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for DMAC_CTRL_LVLEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Control
   type DMAC_CTRL_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  DMA Enable
      DMAENABLE      : Boolean := False;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      --  Priority Level 0 Enable
      LVLEN          : DMAC_CTRL_LVLEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DMAC_CTRL_Register use record
      SWRST          at 0 range 0 .. 0;
      DMAENABLE      at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      LVLEN          at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  CRC Beat Size
   type CRCCTRL_CRCBEATSIZESelect is
     (--  8-bit bus transfer
      BYTE,
      --  16-bit bus transfer
      HWORD,
      --  32-bit bus transfer
      WORD)
     with Size => 2;
   for CRCCTRL_CRCBEATSIZESelect use
     (BYTE => 0,
      HWORD => 1,
      WORD => 2);

   --  CRC Polynomial Type
   type CRCCTRL_CRCPOLYSelect is
     (--  CRC-16 (CRC-CCITT)
      CRC16,
      --  CRC32 (IEEE 802.3)
      CRC32)
     with Size => 2;
   for CRCCTRL_CRCPOLYSelect use
     (CRC16 => 0,
      CRC32 => 1);

   --  CRC Input Source
   type CRCCTRL_CRCSRCSelect is
     (--  CRC Disabled
      DISABLE,
      --  I/O interface
      IO)
     with Size => 6;
   for CRCCTRL_CRCSRCSelect use
     (DISABLE => 0,
      IO => 1);

   --  CRC Operating Mode
   type CRCCTRL_CRCMODESelect is
     (--  Default operating mode
      DEFAULT,
      --  Memory CRC monitor operating mode
      CRCMON,
      --  Memory CRC generation operating mode
      CRCGEN)
     with Size => 2;
   for CRCCTRL_CRCMODESelect use
     (DEFAULT => 0,
      CRCMON => 2,
      CRCGEN => 3);

   --  CRC Control
   type DMAC_CRCCTRL_Register is record
      --  CRC Beat Size
      CRCBEATSIZE  : CRCCTRL_CRCBEATSIZESelect := SAM_SVD.DMAC.BYTE;
      --  CRC Polynomial Type
      CRCPOLY      : CRCCTRL_CRCPOLYSelect := SAM_SVD.DMAC.CRC16;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
      --  CRC Input Source
      CRCSRC       : CRCCTRL_CRCSRCSelect := SAM_SVD.DMAC.DISABLE;
      --  CRC Operating Mode
      CRCMODE      : CRCCTRL_CRCMODESelect := SAM_SVD.DMAC.DEFAULT;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DMAC_CRCCTRL_Register use record
      CRCBEATSIZE  at 0 range 0 .. 1;
      CRCPOLY      at 0 range 2 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
      CRCSRC       at 0 range 8 .. 13;
      CRCMODE      at 0 range 14 .. 15;
   end record;

   --  CRC Status
   type DMAC_CRCSTATUS_Register is record
      --  CRC Module Busy
      CRCBUSY      : Boolean := False;
      --  CRC Zero
      CRCZERO      : Boolean := False;
      --  CRC Error
      CRCERR       : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CRCSTATUS_Register use record
      CRCBUSY      at 0 range 0 .. 0;
      CRCZERO      at 0 range 1 .. 1;
      CRCERR       at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Debug Control
   type DMAC_DBGCTRL_Register is record
      --  Debug Run
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_DBGCTRL_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  DMAC_SWTRIGCTRL_SWTRIG array
   type DMAC_SWTRIGCTRL_SWTRIG_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   --  Software Trigger Control
   type DMAC_SWTRIGCTRL_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWTRIG as a value
            Val : HAL.UInt32;
         when True =>
            --  SWTRIG as an array
            Arr : DMAC_SWTRIGCTRL_SWTRIG_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_SWTRIGCTRL_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype DMAC_PRICTRL0_LVLPRI0_Field is HAL.UInt5;

   --  Level 0 Quality of Service
   type PRICTRL0_QOS0Select is
     (--  Regular delivery
      REGULAR,
      --  Bandwidth shortage
      SHORTAGE,
      --  Latency sensitive
      SENSITIVE,
      --  Latency critical
      CRITICAL)
     with Size => 2;
   for PRICTRL0_QOS0Select use
     (REGULAR => 0,
      SHORTAGE => 1,
      SENSITIVE => 2,
      CRITICAL => 3);

   subtype DMAC_PRICTRL0_LVLPRI1_Field is HAL.UInt5;

   --  Level 1 Quality of Service
   type PRICTRL0_QOS1Select is
     (--  Regular delivery
      REGULAR,
      --  Bandwidth shortage
      SHORTAGE,
      --  Latency sensitive
      SENSITIVE,
      --  Latency critical
      CRITICAL)
     with Size => 2;
   for PRICTRL0_QOS1Select use
     (REGULAR => 0,
      SHORTAGE => 1,
      SENSITIVE => 2,
      CRITICAL => 3);

   subtype DMAC_PRICTRL0_LVLPRI2_Field is HAL.UInt5;

   --  Level 2 Quality of Service
   type PRICTRL0_QOS2Select is
     (--  Regular delivery
      REGULAR,
      --  Bandwidth shortage
      SHORTAGE,
      --  Latency sensitive
      SENSITIVE,
      --  Latency critical
      CRITICAL)
     with Size => 2;
   for PRICTRL0_QOS2Select use
     (REGULAR => 0,
      SHORTAGE => 1,
      SENSITIVE => 2,
      CRITICAL => 3);

   subtype DMAC_PRICTRL0_LVLPRI3_Field is HAL.UInt5;

   --  Level 3 Quality of Service
   type PRICTRL0_QOS3Select is
     (--  Regular delivery
      REGULAR,
      --  Bandwidth shortage
      SHORTAGE,
      --  Latency sensitive
      SENSITIVE,
      --  Latency critical
      CRITICAL)
     with Size => 2;
   for PRICTRL0_QOS3Select use
     (REGULAR => 0,
      SHORTAGE => 1,
      SENSITIVE => 2,
      CRITICAL => 3);

   --  Priority Control 0
   type DMAC_PRICTRL0_Register is record
      --  Level 0 Channel Priority Number
      LVLPRI0  : DMAC_PRICTRL0_LVLPRI0_Field := 16#0#;
      --  Level 0 Quality of Service
      QOS0     : PRICTRL0_QOS0Select := SAM_SVD.DMAC.SENSITIVE;
      --  Level 0 Round-Robin Scheduling Enable
      RRLVLEN0 : Boolean := False;
      --  Level 1 Channel Priority Number
      LVLPRI1  : DMAC_PRICTRL0_LVLPRI1_Field := 16#0#;
      --  Level 1 Quality of Service
      QOS1     : PRICTRL0_QOS1Select := SAM_SVD.DMAC.SENSITIVE;
      --  Level 1 Round-Robin Scheduling Enable
      RRLVLEN1 : Boolean := False;
      --  Level 2 Channel Priority Number
      LVLPRI2  : DMAC_PRICTRL0_LVLPRI2_Field := 16#0#;
      --  Level 2 Quality of Service
      QOS2     : PRICTRL0_QOS2Select := SAM_SVD.DMAC.SENSITIVE;
      --  Level 2 Round-Robin Scheduling Enable
      RRLVLEN2 : Boolean := False;
      --  Level 3 Channel Priority Number
      LVLPRI3  : DMAC_PRICTRL0_LVLPRI3_Field := 16#0#;
      --  Level 3 Quality of Service
      QOS3     : PRICTRL0_QOS3Select := SAM_SVD.DMAC.SENSITIVE;
      --  Level 3 Round-Robin Scheduling Enable
      RRLVLEN3 : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_PRICTRL0_Register use record
      LVLPRI0  at 0 range 0 .. 4;
      QOS0     at 0 range 5 .. 6;
      RRLVLEN0 at 0 range 7 .. 7;
      LVLPRI1  at 0 range 8 .. 12;
      QOS1     at 0 range 13 .. 14;
      RRLVLEN1 at 0 range 15 .. 15;
      LVLPRI2  at 0 range 16 .. 20;
      QOS2     at 0 range 21 .. 22;
      RRLVLEN2 at 0 range 23 .. 23;
      LVLPRI3  at 0 range 24 .. 28;
      QOS3     at 0 range 29 .. 30;
      RRLVLEN3 at 0 range 31 .. 31;
   end record;

   subtype DMAC_INTPEND_ID_Field is HAL.UInt5;

   --  Interrupt Pending
   type DMAC_INTPEND_Register is record
      --  Channel ID
      ID             : DMAC_INTPEND_ID_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Transfer Error
      TERR           : Boolean := False;
      --  Transfer Complete
      TCMPL          : Boolean := False;
      --  Channel Suspend
      SUSP           : Boolean := False;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  CRC Error
      CRCERR         : Boolean := False;
      --  Fetch Error
      FERR           : Boolean := False;
      --  Busy
      BUSY           : Boolean := False;
      --  Pending
      PEND           : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DMAC_INTPEND_Register use record
      ID             at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      TERR           at 0 range 8 .. 8;
      TCMPL          at 0 range 9 .. 9;
      SUSP           at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      CRCERR         at 0 range 12 .. 12;
      FERR           at 0 range 13 .. 13;
      BUSY           at 0 range 14 .. 14;
      PEND           at 0 range 15 .. 15;
   end record;

   --  DMAC_INTSTATUS_CHINT array
   type DMAC_INTSTATUS_CHINT_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   --  Interrupt Status
   type DMAC_INTSTATUS_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHINT as a value
            Val : HAL.UInt32;
         when True =>
            --  CHINT as an array
            Arr : DMAC_INTSTATUS_CHINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_INTSTATUS_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  DMAC_BUSYCH_BUSYCH array
   type DMAC_BUSYCH_BUSYCH_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   --  Busy Channels
   type DMAC_BUSYCH_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BUSYCH as a value
            Val : HAL.UInt32;
         when True =>
            --  BUSYCH as an array
            Arr : DMAC_BUSYCH_BUSYCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_BUSYCH_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  DMAC_PENDCH_PENDCH array
   type DMAC_PENDCH_PENDCH_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   --  Pending Channels
   type DMAC_PENDCH_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PENDCH as a value
            Val : HAL.UInt32;
         when True =>
            --  PENDCH as an array
            Arr : DMAC_PENDCH_PENDCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_PENDCH_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  DMAC_ACTIVE_LVLEX array
   type DMAC_ACTIVE_LVLEX_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for DMAC_ACTIVE_LVLEX
   type DMAC_ACTIVE_LVLEX_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  LVLEX as a value
            Val : HAL.UInt4;
         when True =>
            --  LVLEX as an array
            Arr : DMAC_ACTIVE_LVLEX_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for DMAC_ACTIVE_LVLEX_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype DMAC_ACTIVE_ID_Field is HAL.UInt5;
   subtype DMAC_ACTIVE_BTCNT_Field is HAL.UInt16;

   --  Active Channel and Levels
   type DMAC_ACTIVE_Register is record
      --  Read-only. Level 0 Channel Trigger Request Executing
      LVLEX          : DMAC_ACTIVE_LVLEX_Field;
      --  unspecified
      Reserved_4_7   : HAL.UInt4;
      --  Read-only. Active Channel ID
      ID             : DMAC_ACTIVE_ID_Field;
      --  unspecified
      Reserved_13_14 : HAL.UInt2;
      --  Read-only. Active Channel Busy
      ABUSY          : Boolean;
      --  Read-only. Active Channel Block Transfer Count
      BTCNT          : DMAC_ACTIVE_BTCNT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_ACTIVE_Register use record
      LVLEX          at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      ID             at 0 range 8 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      ABUSY          at 0 range 15 .. 15;
      BTCNT          at 0 range 16 .. 31;
   end record;

   --------------------------------------
   -- DMAC_CHANNEL cluster's Registers --
   --------------------------------------

   --  Trigger Source
   type CHCTRLA_TRIGSRCSelect is
     (--  Only software/event triggers
      DISABLE)
     with Size => 7;
   for CHCTRLA_TRIGSRCSelect use
     (DISABLE => 0);

   --  Trigger Action
   type CHCTRLA_TRIGACTSelect is
     (--  One trigger required for each block transfer
      BLOCK,
      --  One trigger required for each burst transfer
      BURST,
      --  One trigger required for each transaction
      TRANSACTION)
     with Size => 2;
   for CHCTRLA_TRIGACTSelect use
     (BLOCK => 0,
      BURST => 2,
      TRANSACTION => 3);

   --  Burst Length
   type CHCTRLA_BURSTLENSelect is
     (--  Single-beat burst length
      SINGLE,
      --  2-beats burst length
      Val_2BEAT,
      --  3-beats burst length
      Val_3BEAT,
      --  4-beats burst length
      Val_4BEAT,
      --  5-beats burst length
      Val_5BEAT,
      --  6-beats burst length
      Val_6BEAT,
      --  7-beats burst length
      Val_7BEAT,
      --  8-beats burst length
      Val_8BEAT,
      --  9-beats burst length
      Val_9BEAT,
      --  10-beats burst length
      Val_10BEAT,
      --  11-beats burst length
      Val_11BEAT,
      --  12-beats burst length
      Val_12BEAT,
      --  13-beats burst length
      Val_13BEAT,
      --  14-beats burst length
      Val_14BEAT,
      --  15-beats burst length
      Val_15BEAT,
      --  16-beats burst length
      Val_16BEAT)
     with Size => 4;
   for CHCTRLA_BURSTLENSelect use
     (SINGLE => 0,
      Val_2BEAT => 1,
      Val_3BEAT => 2,
      Val_4BEAT => 3,
      Val_5BEAT => 4,
      Val_6BEAT => 5,
      Val_7BEAT => 6,
      Val_8BEAT => 7,
      Val_9BEAT => 8,
      Val_10BEAT => 9,
      Val_11BEAT => 10,
      Val_12BEAT => 11,
      Val_13BEAT => 12,
      Val_14BEAT => 13,
      Val_15BEAT => 14,
      Val_16BEAT => 15);

   --  FIFO Threshold
   type CHCTRLA_THRESHOLDSelect is
     (--  Destination write starts after each beat source address read
      Val_1BEAT,
      --  Destination write starts after 2-beats source address read
      Val_2BEATS,
      --  Destination write starts after 4-beats source address read
      Val_4BEATS,
      --  Destination write starts after 8-beats source address read
      Val_8BEATS)
     with Size => 2;
   for CHCTRLA_THRESHOLDSelect use
     (Val_1BEAT => 0,
      Val_2BEATS => 1,
      Val_4BEATS => 2,
      Val_8BEATS => 3);

   --  Channel n Control A
   type DMAC_CHCTRLA_DMAC_CHANNEL_Register is record
      --  Channel Software Reset
      SWRST          : Boolean := False;
      --  Channel Enable
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_2_5   : HAL.UInt4 := 16#0#;
      --  Channel Run in Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Trigger Source
      TRIGSRC        : CHCTRLA_TRIGSRCSelect := SAM_SVD.DMAC.DISABLE;
      --  unspecified
      Reserved_15_19 : HAL.UInt5 := 16#0#;
      --  Trigger Action
      TRIGACT        : CHCTRLA_TRIGACTSelect := SAM_SVD.DMAC.BLOCK;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Burst Length
      BURSTLEN       : CHCTRLA_BURSTLENSelect := SAM_SVD.DMAC.SINGLE;
      --  FIFO Threshold
      THRESHOLD      : CHCTRLA_THRESHOLDSelect := SAM_SVD.DMAC.Val_1BEAT;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHCTRLA_DMAC_CHANNEL_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      Reserved_2_5   at 0 range 2 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TRIGSRC        at 0 range 8 .. 14;
      Reserved_15_19 at 0 range 15 .. 19;
      TRIGACT        at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      BURSTLEN       at 0 range 24 .. 27;
      THRESHOLD      at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  Software Command
   type CHCTRLB_CMDSelect is
     (--  No action
      NOACT,
      --  Channel suspend operation
      SUSPEND,
      --  Channel resume operation
      RESUME)
     with Size => 2;
   for CHCTRLB_CMDSelect use
     (NOACT => 0,
      SUSPEND => 1,
      RESUME => 2);

   --  Channel n Control B
   type DMAC_CHCTRLB_DMAC_CHANNEL_Register is record
      --  Software Command
      CMD          : CHCTRLB_CMDSelect := SAM_SVD.DMAC.NOACT;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHCTRLB_DMAC_CHANNEL_Register use record
      CMD          at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Channel Priority Level
   type CHPRILVL_PRILVLSelect is
     (--  Channel Priority Level 0 (Lowest Level)
      LVL0,
      --  Channel Priority Level 1
      LVL1,
      --  Channel Priority Level 2
      LVL2,
      --  Channel Priority Level 3 (Highest Level)
      LVL3)
     with Size => 2;
   for CHPRILVL_PRILVLSelect use
     (LVL0 => 0,
      LVL1 => 1,
      LVL2 => 2,
      LVL3 => 3);

   --  Channel n Priority Level
   type DMAC_CHPRILVL_DMAC_CHANNEL_Register is record
      --  Channel Priority Level
      PRILVL       : CHPRILVL_PRILVLSelect := SAM_SVD.DMAC.LVL0;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHPRILVL_DMAC_CHANNEL_Register use record
      PRILVL       at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Channel Event Input Action
   type CHEVCTRL_EVACTSelect is
     (--  No action
      NOACT,
      --  Transfer and periodic transfer trigger
      TRIG,
      --  Conditional transfer trigger
      CTRIG,
      --  Conditional block transfer
      CBLOCK,
      --  Channel suspend operation
      SUSPEND,
      --  Channel resume operation
      RESUME,
      --  Skip next block suspend action
      SSKIP,
      --  Increase priority
      INCPRI)
     with Size => 3;
   for CHEVCTRL_EVACTSelect use
     (NOACT => 0,
      TRIG => 1,
      CTRIG => 2,
      CBLOCK => 3,
      SUSPEND => 4,
      RESUME => 5,
      SSKIP => 6,
      INCPRI => 7);

   --  Channel Event Output Mode
   type CHEVCTRL_EVOMODESelect is
     (--  Block event output selection. Refer to BTCTRL.EVOSEL for available
--  selections.
      DEFAULT,
      --  Ongoing trigger action
      TRIGACT)
     with Size => 2;
   for CHEVCTRL_EVOMODESelect use
     (DEFAULT => 0,
      TRIGACT => 1);

   --  Channel n Event Control
   type DMAC_CHEVCTRL_DMAC_CHANNEL_Register is record
      --  Channel Event Input Action
      EVACT        : CHEVCTRL_EVACTSelect := SAM_SVD.DMAC.NOACT;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Channel Event Output Mode
      EVOMODE      : CHEVCTRL_EVOMODESelect := SAM_SVD.DMAC.DEFAULT;
      --  Channel Event Input Enable
      EVIE         : Boolean := False;
      --  Channel Event Output Enable
      EVOE         : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHEVCTRL_DMAC_CHANNEL_Register use record
      EVACT        at 0 range 0 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      EVOMODE      at 0 range 4 .. 5;
      EVIE         at 0 range 6 .. 6;
      EVOE         at 0 range 7 .. 7;
   end record;

   --  Channel n Interrupt Enable Clear
   type DMAC_CHINTENCLR_DMAC_CHANNEL_Register is record
      --  Channel Transfer Error Interrupt Enable
      TERR         : Boolean := False;
      --  Channel Transfer Complete Interrupt Enable
      TCMPL        : Boolean := False;
      --  Channel Suspend Interrupt Enable
      SUSP         : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHINTENCLR_DMAC_CHANNEL_Register use record
      TERR         at 0 range 0 .. 0;
      TCMPL        at 0 range 1 .. 1;
      SUSP         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Channel n Interrupt Enable Set
   type DMAC_CHINTENSET_DMAC_CHANNEL_Register is record
      --  Channel Transfer Error Interrupt Enable
      TERR         : Boolean := False;
      --  Channel Transfer Complete Interrupt Enable
      TCMPL        : Boolean := False;
      --  Channel Suspend Interrupt Enable
      SUSP         : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHINTENSET_DMAC_CHANNEL_Register use record
      TERR         at 0 range 0 .. 0;
      TCMPL        at 0 range 1 .. 1;
      SUSP         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Channel n Interrupt Flag Status and Clear
   type DMAC_CHINTFLAG_DMAC_CHANNEL_Register is record
      --  Channel Transfer Error
      TERR         : Boolean := False;
      --  Channel Transfer Complete
      TCMPL        : Boolean := False;
      --  Channel Suspend
      SUSP         : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHINTFLAG_DMAC_CHANNEL_Register use record
      TERR         at 0 range 0 .. 0;
      TCMPL        at 0 range 1 .. 1;
      SUSP         at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Channel n Status
   type DMAC_CHSTATUS_DMAC_CHANNEL_Register is record
      --  Channel Pending
      PEND         : Boolean := False;
      --  Channel Busy
      BUSY         : Boolean := False;
      --  Channel Fetch Error
      FERR         : Boolean := False;
      --  Channel CRC Error
      CRCERR       : Boolean := False;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DMAC_CHSTATUS_DMAC_CHANNEL_Register use record
      PEND         at 0 range 0 .. 0;
      BUSY         at 0 range 1 .. 1;
      FERR         at 0 range 2 .. 2;
      CRCERR       at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   type DMAC_CHANNEL_Cluster is record
      --  Channel n Control A
      CHCTRLA    : aliased DMAC_CHCTRLA_DMAC_CHANNEL_Register;
      --  Channel n Control B
      CHCTRLB    : aliased DMAC_CHCTRLB_DMAC_CHANNEL_Register;
      --  Channel n Priority Level
      CHPRILVL   : aliased DMAC_CHPRILVL_DMAC_CHANNEL_Register;
      --  Channel n Event Control
      CHEVCTRL   : aliased DMAC_CHEVCTRL_DMAC_CHANNEL_Register;
      --  Channel n Interrupt Enable Clear
      CHINTENCLR : aliased DMAC_CHINTENCLR_DMAC_CHANNEL_Register;
      --  Channel n Interrupt Enable Set
      CHINTENSET : aliased DMAC_CHINTENSET_DMAC_CHANNEL_Register;
      --  Channel n Interrupt Flag Status and Clear
      CHINTFLAG  : aliased DMAC_CHINTFLAG_DMAC_CHANNEL_Register;
      --  Channel n Status
      CHSTATUS   : aliased DMAC_CHSTATUS_DMAC_CHANNEL_Register;
   end record
     with Size => 128;

   for DMAC_CHANNEL_Cluster use record
      CHCTRLA    at 16#0# range 0 .. 31;
      CHCTRLB    at 16#4# range 0 .. 7;
      CHPRILVL   at 16#5# range 0 .. 7;
      CHEVCTRL   at 16#6# range 0 .. 7;
      CHINTENCLR at 16#C# range 0 .. 7;
      CHINTENSET at 16#D# range 0 .. 7;
      CHINTFLAG  at 16#E# range 0 .. 7;
      CHSTATUS   at 16#F# range 0 .. 7;
   end record;

   type DMAC_CHANNEL_Clusters is array (0 .. 31) of DMAC_CHANNEL_Cluster;

   -----------------
   -- Peripherals --
   -----------------

   --  Direct Memory Access Controller
   type DMAC_Peripheral is record
      --  Control
      CTRL         : aliased DMAC_CTRL_Register;
      --  CRC Control
      CRCCTRL      : aliased DMAC_CRCCTRL_Register;
      --  CRC Data Input
      CRCDATAIN    : aliased HAL.UInt32;
      --  CRC Checksum
      CRCCHKSUM    : aliased HAL.UInt32;
      --  CRC Status
      CRCSTATUS    : aliased DMAC_CRCSTATUS_Register;
      --  Debug Control
      DBGCTRL      : aliased DMAC_DBGCTRL_Register;
      --  Software Trigger Control
      SWTRIGCTRL   : aliased DMAC_SWTRIGCTRL_Register;
      --  Priority Control 0
      PRICTRL0     : aliased DMAC_PRICTRL0_Register;
      --  Interrupt Pending
      INTPEND      : aliased DMAC_INTPEND_Register;
      --  Interrupt Status
      INTSTATUS    : aliased DMAC_INTSTATUS_Register;
      --  Busy Channels
      BUSYCH       : aliased DMAC_BUSYCH_Register;
      --  Pending Channels
      PENDCH       : aliased DMAC_PENDCH_Register;
      --  Active Channel and Levels
      ACTIVE       : aliased DMAC_ACTIVE_Register;
      --  Descriptor Memory Section Base Address
      BASEADDR     : aliased HAL.UInt32;
      --  Write-Back Memory Section Base Address
      WRBADDR      : aliased HAL.UInt32;
      DMAC_CHANNEL : aliased DMAC_CHANNEL_Clusters;
   end record
     with Volatile;

   for DMAC_Peripheral use record
      CTRL         at 16#0# range 0 .. 15;
      CRCCTRL      at 16#2# range 0 .. 15;
      CRCDATAIN    at 16#4# range 0 .. 31;
      CRCCHKSUM    at 16#8# range 0 .. 31;
      CRCSTATUS    at 16#C# range 0 .. 7;
      DBGCTRL      at 16#D# range 0 .. 7;
      SWTRIGCTRL   at 16#10# range 0 .. 31;
      PRICTRL0     at 16#14# range 0 .. 31;
      INTPEND      at 16#20# range 0 .. 15;
      INTSTATUS    at 16#24# range 0 .. 31;
      BUSYCH       at 16#28# range 0 .. 31;
      PENDCH       at 16#2C# range 0 .. 31;
      ACTIVE       at 16#30# range 0 .. 31;
      BASEADDR     at 16#34# range 0 .. 31;
      WRBADDR      at 16#38# range 0 .. 31;
      DMAC_CHANNEL at 16#40# range 0 .. 4095;
   end record;

   --  Direct Memory Access Controller
   DMAC_Periph : aliased DMAC_Peripheral
     with Import, Address => DMAC_Base;

end SAM_SVD.DMAC;
