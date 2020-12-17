pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ----------------------------------
   -- RtcMode0 cluster's Registers --
   ----------------------------------

   --  Operating Mode
   type CTRLA_MODESelect is
     (--  Mode 0: 32-bit Counter
      COUNT32,
      --  Mode 1: 16-bit Counter
      COUNT16,
      --  Mode 2: Clock/Calendar
      CLOCK)
     with Size => 2;
   for CTRLA_MODESelect use
     (COUNT32 => 0,
      COUNT16 => 1,
      CLOCK => 2);

   --  Prescaler
   type CTRLA_PRESCALERSelect is
     (--  CLK_RTC_CNT = GCLK_RTC/1
      OFF,
      --  CLK_RTC_CNT = GCLK_RTC/1
      DIV1,
      --  CLK_RTC_CNT = GCLK_RTC/2
      DIV2,
      --  CLK_RTC_CNT = GCLK_RTC/4
      DIV4,
      --  CLK_RTC_CNT = GCLK_RTC/8
      DIV8,
      --  CLK_RTC_CNT = GCLK_RTC/16
      DIV16,
      --  CLK_RTC_CNT = GCLK_RTC/32
      DIV32,
      --  CLK_RTC_CNT = GCLK_RTC/64
      DIV64,
      --  CLK_RTC_CNT = GCLK_RTC/128
      DIV128,
      --  CLK_RTC_CNT = GCLK_RTC/256
      DIV256,
      --  CLK_RTC_CNT = GCLK_RTC/512
      DIV512,
      --  CLK_RTC_CNT = GCLK_RTC/1024
      DIV1024)
     with Size => 4;
   for CTRLA_PRESCALERSelect use
     (OFF => 0,
      DIV1 => 1,
      DIV2 => 2,
      DIV4 => 3,
      DIV8 => 4,
      DIV16 => 5,
      DIV32 => 6,
      DIV64 => 7,
      DIV128 => 8,
      DIV256 => 9,
      DIV512 => 10,
      DIV1024 => 11);

   --  MODE0 Control A
   type RTC_CTRLA_RTC_MODE0_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.RTC.COUNT32;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  Clear on Match
      MATCHCLR       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.RTC.OFF;
      --  unspecified
      Reserved_12_12 : HAL.Bit := 16#0#;
      --  BKUP Registers Reset On Tamper Enable
      BKTRST         : Boolean := False;
      --  GP Registers Reset On Tamper Enable
      GPTRST         : Boolean := False;
      --  Count Read Synchronization Enable
      COUNTSYNC      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRLA_RTC_MODE0_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      MATCHCLR       at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      BKTRST         at 0 range 13 .. 13;
      GPTRST         at 0 range 14 .. 14;
      COUNTSYNC      at 0 range 15 .. 15;
   end record;

   --  Debounce Freqnuency
   type CTRLB_DEBFSelect is
     (--  CLK_RTC_DEB = CLK_RTC/2
      DIV2,
      --  CLK_RTC_DEB = CLK_RTC/4
      DIV4,
      --  CLK_RTC_DEB = CLK_RTC/8
      DIV8,
      --  CLK_RTC_DEB = CLK_RTC/16
      DIV16,
      --  CLK_RTC_DEB = CLK_RTC/32
      DIV32,
      --  CLK_RTC_DEB = CLK_RTC/64
      DIV64,
      --  CLK_RTC_DEB = CLK_RTC/128
      DIV128,
      --  CLK_RTC_DEB = CLK_RTC/256
      DIV256)
     with Size => 3;
   for CTRLB_DEBFSelect use
     (DIV2 => 0,
      DIV4 => 1,
      DIV8 => 2,
      DIV16 => 3,
      DIV32 => 4,
      DIV64 => 5,
      DIV128 => 6,
      DIV256 => 7);

   --  Active Layer Freqnuency
   type CTRLB_ACTFSelect is
     (--  CLK_RTC_OUT = CLK_RTC/2
      DIV2,
      --  CLK_RTC_OUT = CLK_RTC/4
      DIV4,
      --  CLK_RTC_OUT = CLK_RTC/8
      DIV8,
      --  CLK_RTC_OUT = CLK_RTC/16
      DIV16,
      --  CLK_RTC_OUT = CLK_RTC/32
      DIV32,
      --  CLK_RTC_OUT = CLK_RTC/64
      DIV64,
      --  CLK_RTC_OUT = CLK_RTC/128
      DIV128,
      --  CLK_RTC_OUT = CLK_RTC/256
      DIV256)
     with Size => 3;
   for CTRLB_ACTFSelect use
     (DIV2 => 0,
      DIV4 => 1,
      DIV8 => 2,
      DIV16 => 3,
      DIV32 => 4,
      DIV64 => 5,
      DIV128 => 6,
      DIV256 => 7);

   --  MODE0 Control B
   type RTC_CTRLB_RTC_MODE0_Register is record
      --  General Purpose 0 Enable
      GP0EN          : Boolean := False;
      --  General Purpose 2 Enable
      GP2EN          : Boolean := False;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Debouncer Majority Enable
      DEBMAJ         : Boolean := False;
      --  Debouncer Asynchronous Enable
      DEBASYNC       : Boolean := False;
      --  RTC Output Enable
      RTCOUT         : Boolean := False;
      --  DMA Enable
      DMAEN          : Boolean := False;
      --  Debounce Freqnuency
      DEBF           : CTRLB_DEBFSelect := SAM_SVD.RTC.DIV2;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Active Layer Freqnuency
      ACTF           : CTRLB_ACTFSelect := SAM_SVD.RTC.DIV2;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRLB_RTC_MODE0_Register use record
      GP0EN          at 0 range 0 .. 0;
      GP2EN          at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      DEBMAJ         at 0 range 4 .. 4;
      DEBASYNC       at 0 range 5 .. 5;
      RTCOUT         at 0 range 6 .. 6;
      DMAEN          at 0 range 7 .. 7;
      DEBF           at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      ACTF           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  RTC_EVCTRL_RTC_MODE0_PEREO array
   type RTC_EVCTRL_RTC_MODE0_PEREO_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_EVCTRL_RTC_MODE0_PEREO
   type RTC_EVCTRL_RTC_MODE0_PEREO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PEREO as a value
            Val : HAL.UInt8;
         when True =>
            --  PEREO as an array
            Arr : RTC_EVCTRL_RTC_MODE0_PEREO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_EVCTRL_RTC_MODE0_PEREO_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_EVCTRL_RTC_MODE0_CMPEO array
   type RTC_EVCTRL_RTC_MODE0_CMPEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_EVCTRL_RTC_MODE0_CMPEO
   type RTC_EVCTRL_RTC_MODE0_CMPEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPEO as a value
            Val : HAL.UInt2;
         when True =>
            --  CMPEO as an array
            Arr : RTC_EVCTRL_RTC_MODE0_CMPEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_EVCTRL_RTC_MODE0_CMPEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE0 Event Control
   type RTC_EVCTRL_RTC_MODE0_Register is record
      --  Periodic Interval 0 Event Output Enable
      PEREO          : RTC_EVCTRL_RTC_MODE0_PEREO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0 Event Output Enable
      CMPEO          : RTC_EVCTRL_RTC_MODE0_CMPEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper Event Output Enable
      TAMPEREO       : Boolean := False;
      --  Overflow Event Output Enable
      OVFEO          : Boolean := False;
      --  Tamper Event Input Enable
      TAMPEVEI       : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_EVCTRL_RTC_MODE0_Register use record
      PEREO          at 0 range 0 .. 7;
      CMPEO          at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPEREO       at 0 range 14 .. 14;
      OVFEO          at 0 range 15 .. 15;
      TAMPEVEI       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  RTC_INTENCLR_RTC_MODE0_PER array
   type RTC_INTENCLR_RTC_MODE0_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTENCLR_RTC_MODE0_PER
   type RTC_INTENCLR_RTC_MODE0_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTENCLR_RTC_MODE0_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTENCLR_RTC_MODE0_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTENCLR_RTC_MODE0_CMP array
   type RTC_INTENCLR_RTC_MODE0_CMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTENCLR_RTC_MODE0_CMP
   type RTC_INTENCLR_RTC_MODE0_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : HAL.UInt2;
         when True =>
            --  CMP as an array
            Arr : RTC_INTENCLR_RTC_MODE0_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTENCLR_RTC_MODE0_CMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE0 Interrupt Enable Clear
   type RTC_INTENCLR_RTC_MODE0_Register is record
      --  Periodic Interval 0 Interrupt Enable
      PER            : RTC_INTENCLR_RTC_MODE0_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0 Interrupt Enable
      CMP            : RTC_INTENCLR_RTC_MODE0_CMP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper Enable
      TAMPER         : Boolean := False;
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENCLR_RTC_MODE0_Register use record
      PER            at 0 range 0 .. 7;
      CMP            at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  RTC_INTENSET_RTC_MODE0_PER array
   type RTC_INTENSET_RTC_MODE0_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTENSET_RTC_MODE0_PER
   type RTC_INTENSET_RTC_MODE0_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTENSET_RTC_MODE0_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTENSET_RTC_MODE0_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTENSET_RTC_MODE0_CMP array
   type RTC_INTENSET_RTC_MODE0_CMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTENSET_RTC_MODE0_CMP
   type RTC_INTENSET_RTC_MODE0_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : HAL.UInt2;
         when True =>
            --  CMP as an array
            Arr : RTC_INTENSET_RTC_MODE0_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTENSET_RTC_MODE0_CMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE0 Interrupt Enable Set
   type RTC_INTENSET_RTC_MODE0_Register is record
      --  Periodic Interval 0 Interrupt Enable
      PER            : RTC_INTENSET_RTC_MODE0_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0 Interrupt Enable
      CMP            : RTC_INTENSET_RTC_MODE0_CMP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper Enable
      TAMPER         : Boolean := False;
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENSET_RTC_MODE0_Register use record
      PER            at 0 range 0 .. 7;
      CMP            at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  RTC_INTFLAG_RTC_MODE0_PER array
   type RTC_INTFLAG_RTC_MODE0_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTFLAG_RTC_MODE0_PER
   type RTC_INTFLAG_RTC_MODE0_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTFLAG_RTC_MODE0_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTFLAG_RTC_MODE0_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTFLAG_RTC_MODE0_CMP array
   type RTC_INTFLAG_RTC_MODE0_CMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTFLAG_RTC_MODE0_CMP
   type RTC_INTFLAG_RTC_MODE0_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : HAL.UInt2;
         when True =>
            --  CMP as an array
            Arr : RTC_INTFLAG_RTC_MODE0_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTFLAG_RTC_MODE0_CMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE0 Interrupt Flag Status and Clear
   type RTC_INTFLAG_RTC_MODE0_Register is record
      --  Periodic Interval 0
      PER            : RTC_INTFLAG_RTC_MODE0_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0
      CMP            : RTC_INTFLAG_RTC_MODE0_CMP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper
      TAMPER         : Boolean := False;
      --  Overflow
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTFLAG_RTC_MODE0_Register use record
      PER            at 0 range 0 .. 7;
      CMP            at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  Debug Control
   type RTC_DBGCTRL_RTC_MODE0_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_DBGCTRL_RTC_MODE0_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  RTC_SYNCBUSY_RTC_MODE0_COMP array
   type RTC_SYNCBUSY_RTC_MODE0_COMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_SYNCBUSY_RTC_MODE0_COMP
   type RTC_SYNCBUSY_RTC_MODE0_COMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMP as a value
            Val : HAL.UInt2;
         when True =>
            --  COMP as an array
            Arr : RTC_SYNCBUSY_RTC_MODE0_COMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_SYNCBUSY_RTC_MODE0_COMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RTC_SYNCBUSY_RTC_MODE0_GP array
   type RTC_SYNCBUSY_RTC_MODE0_GP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_SYNCBUSY_RTC_MODE0_GP
   type RTC_SYNCBUSY_RTC_MODE0_GP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GP as a value
            Val : HAL.UInt4;
         when True =>
            --  GP as an array
            Arr : RTC_SYNCBUSY_RTC_MODE0_GP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_SYNCBUSY_RTC_MODE0_GP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  MODE0 Synchronization Busy Status
   type RTC_SYNCBUSY_RTC_MODE0_Register is record
      --  Read-only. Software Reset Busy
      SWRST          : Boolean;
      --  Read-only. Enable Bit Busy
      ENABLE         : Boolean;
      --  Read-only. FREQCORR Register Busy
      FREQCORR       : Boolean;
      --  Read-only. COUNT Register Busy
      COUNT          : Boolean;
      --  unspecified
      Reserved_4_4   : HAL.Bit;
      --  Read-only. COMP 0 Register Busy
      COMP           : RTC_SYNCBUSY_RTC_MODE0_COMP_Field;
      --  unspecified
      Reserved_7_14  : HAL.UInt8;
      --  Read-only. Count Synchronization Enable Bit Busy
      COUNTSYNC      : Boolean;
      --  Read-only. General Purpose 0 Register Busy
      GP             : RTC_SYNCBUSY_RTC_MODE0_GP_Field;
      --  unspecified
      Reserved_20_31 : HAL.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_SYNCBUSY_RTC_MODE0_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      FREQCORR       at 0 range 2 .. 2;
      COUNT          at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      COMP           at 0 range 5 .. 6;
      Reserved_7_14  at 0 range 7 .. 14;
      COUNTSYNC      at 0 range 15 .. 15;
      GP             at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype RTC_FREQCORR_RTC_MODE0_VALUE_Field is HAL.UInt7;

   --  Frequency Correction
   type RTC_FREQCORR_RTC_MODE0_Register is record
      --  Correction Value
      VALUE : RTC_FREQCORR_RTC_MODE0_VALUE_Field := 16#0#;
      --  Correction Sign
      SIGN  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_FREQCORR_RTC_MODE0_Register use record
      VALUE at 0 range 0 .. 6;
      SIGN  at 0 range 7 .. 7;
   end record;

   --  MODE0 Compare n Value

   --  MODE0 Compare n Value
   type RTC_COMP_RTC_MODE0_Registers is array (0 .. 1) of HAL.UInt32;

   --  General Purpose

   --  General Purpose
   type RTC_GP_RTC_MODE0_Registers is array (0 .. 3) of HAL.UInt32;

   --  Tamper Input 0 Action
   type TAMPCTRL_IN0ACTSelect is
     (--  Off (Disabled)
      OFF,
      --  Wake without timestamp
      WAKE,
      --  Capture timestamp
      CAPTURE,
      --  Compare IN0 to OUT
      ACTL)
     with Size => 2;
   for TAMPCTRL_IN0ACTSelect use
     (OFF => 0,
      WAKE => 1,
      CAPTURE => 2,
      ACTL => 3);

   --  Tamper Input 1 Action
   type TAMPCTRL_IN1ACTSelect is
     (--  Off (Disabled)
      OFF,
      --  Wake without timestamp
      WAKE,
      --  Capture timestamp
      CAPTURE,
      --  Compare IN1 to OUT
      ACTL)
     with Size => 2;
   for TAMPCTRL_IN1ACTSelect use
     (OFF => 0,
      WAKE => 1,
      CAPTURE => 2,
      ACTL => 3);

   --  Tamper Input 2 Action
   type TAMPCTRL_IN2ACTSelect is
     (--  Off (Disabled)
      OFF,
      --  Wake without timestamp
      WAKE,
      --  Capture timestamp
      CAPTURE,
      --  Compare IN2 to OUT
      ACTL)
     with Size => 2;
   for TAMPCTRL_IN2ACTSelect use
     (OFF => 0,
      WAKE => 1,
      CAPTURE => 2,
      ACTL => 3);

   --  Tamper Input 3 Action
   type TAMPCTRL_IN3ACTSelect is
     (--  Off (Disabled)
      OFF,
      --  Wake without timestamp
      WAKE,
      --  Capture timestamp
      CAPTURE,
      --  Compare IN3 to OUT
      ACTL)
     with Size => 2;
   for TAMPCTRL_IN3ACTSelect use
     (OFF => 0,
      WAKE => 1,
      CAPTURE => 2,
      ACTL => 3);

   --  Tamper Input 4 Action
   type TAMPCTRL_IN4ACTSelect is
     (--  Off (Disabled)
      OFF,
      --  Wake without timestamp
      WAKE,
      --  Capture timestamp
      CAPTURE,
      --  Compare IN4 to OUT
      ACTL)
     with Size => 2;
   for TAMPCTRL_IN4ACTSelect use
     (OFF => 0,
      WAKE => 1,
      CAPTURE => 2,
      ACTL => 3);

   --  RTC_TAMPCTRL_RTC_MODE0_TAMLVL array
   type RTC_TAMPCTRL_RTC_MODE0_TAMLVL_Field_Array is array (0 .. 4)
     of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPCTRL_RTC_MODE0_TAMLVL
   type RTC_TAMPCTRL_RTC_MODE0_TAMLVL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TAMLVL as a value
            Val : HAL.UInt5;
         when True =>
            --  TAMLVL as an array
            Arr : RTC_TAMPCTRL_RTC_MODE0_TAMLVL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPCTRL_RTC_MODE0_TAMLVL_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  RTC_TAMPCTRL_RTC_MODE0_DEBNC array
   type RTC_TAMPCTRL_RTC_MODE0_DEBNC_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPCTRL_RTC_MODE0_DEBNC
   type RTC_TAMPCTRL_RTC_MODE0_DEBNC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DEBNC as a value
            Val : HAL.UInt5;
         when True =>
            --  DEBNC as an array
            Arr : RTC_TAMPCTRL_RTC_MODE0_DEBNC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPCTRL_RTC_MODE0_DEBNC_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Tamper Control
   type RTC_TAMPCTRL_RTC_MODE0_Register is record
      --  Tamper Input 0 Action
      IN0ACT         : TAMPCTRL_IN0ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 1 Action
      IN1ACT         : TAMPCTRL_IN1ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 2 Action
      IN2ACT         : TAMPCTRL_IN2ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 3 Action
      IN3ACT         : TAMPCTRL_IN3ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 4 Action
      IN4ACT         : TAMPCTRL_IN4ACTSelect := SAM_SVD.RTC.OFF;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  Tamper Level Select 0
      TAMLVL         : RTC_TAMPCTRL_RTC_MODE0_TAMLVL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  Debouncer Enable 0
      DEBNC          : RTC_TAMPCTRL_RTC_MODE0_DEBNC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TAMPCTRL_RTC_MODE0_Register use record
      IN0ACT         at 0 range 0 .. 1;
      IN1ACT         at 0 range 2 .. 3;
      IN2ACT         at 0 range 4 .. 5;
      IN3ACT         at 0 range 6 .. 7;
      IN4ACT         at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      TAMLVL         at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      DEBNC          at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  RTC_TAMPID_RTC_MODE0_TAMPID array
   type RTC_TAMPID_RTC_MODE0_TAMPID_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPID_RTC_MODE0_TAMPID
   type RTC_TAMPID_RTC_MODE0_TAMPID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TAMPID as a value
            Val : HAL.UInt5;
         when True =>
            --  TAMPID as an array
            Arr : RTC_TAMPID_RTC_MODE0_TAMPID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPID_RTC_MODE0_TAMPID_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Tamper ID
   type RTC_TAMPID_RTC_MODE0_Register is record
      --  Tamper Input 0 Detected
      TAMPID        : RTC_TAMPID_RTC_MODE0_TAMPID_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_30 : HAL.UInt26 := 16#0#;
      --  Tamper Event Detected
      TAMPEVT       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TAMPID_RTC_MODE0_Register use record
      TAMPID        at 0 range 0 .. 4;
      Reserved_5_30 at 0 range 5 .. 30;
      TAMPEVT       at 0 range 31 .. 31;
   end record;

   --  Backup

   --  Backup
   type RTC_BKUP_RTC_MODE0_Registers is array (0 .. 7) of HAL.UInt32;

   --  32-bit Counter with Single 32-bit Compare
   type RtcMode0_Cluster is record
      --  MODE0 Control A
      CTRLA     : aliased RTC_CTRLA_RTC_MODE0_Register;
      --  MODE0 Control B
      CTRLB     : aliased RTC_CTRLB_RTC_MODE0_Register;
      --  MODE0 Event Control
      EVCTRL    : aliased RTC_EVCTRL_RTC_MODE0_Register;
      --  MODE0 Interrupt Enable Clear
      INTENCLR  : aliased RTC_INTENCLR_RTC_MODE0_Register;
      --  MODE0 Interrupt Enable Set
      INTENSET  : aliased RTC_INTENSET_RTC_MODE0_Register;
      --  MODE0 Interrupt Flag Status and Clear
      INTFLAG   : aliased RTC_INTFLAG_RTC_MODE0_Register;
      --  Debug Control
      DBGCTRL   : aliased RTC_DBGCTRL_RTC_MODE0_Register;
      --  MODE0 Synchronization Busy Status
      SYNCBUSY  : aliased RTC_SYNCBUSY_RTC_MODE0_Register;
      --  Frequency Correction
      FREQCORR  : aliased RTC_FREQCORR_RTC_MODE0_Register;
      --  MODE0 Counter Value
      COUNT     : aliased HAL.UInt32;
      --  MODE0 Compare n Value
      COMP      : aliased RTC_COMP_RTC_MODE0_Registers;
      --  General Purpose
      GP        : aliased RTC_GP_RTC_MODE0_Registers;
      --  Tamper Control
      TAMPCTRL  : aliased RTC_TAMPCTRL_RTC_MODE0_Register;
      --  MODE0 Timestamp
      TIMESTAMP : aliased HAL.UInt32;
      --  Tamper ID
      TAMPID    : aliased RTC_TAMPID_RTC_MODE0_Register;
      --  Backup
      BKUP      : aliased RTC_BKUP_RTC_MODE0_Registers;
   end record
     with Size => 1280;

   for RtcMode0_Cluster use record
      CTRLA     at 16#0# range 0 .. 15;
      CTRLB     at 16#2# range 0 .. 15;
      EVCTRL    at 16#4# range 0 .. 31;
      INTENCLR  at 16#8# range 0 .. 15;
      INTENSET  at 16#A# range 0 .. 15;
      INTFLAG   at 16#C# range 0 .. 15;
      DBGCTRL   at 16#E# range 0 .. 7;
      SYNCBUSY  at 16#10# range 0 .. 31;
      FREQCORR  at 16#14# range 0 .. 7;
      COUNT     at 16#18# range 0 .. 31;
      COMP      at 16#20# range 0 .. 63;
      GP        at 16#40# range 0 .. 127;
      TAMPCTRL  at 16#60# range 0 .. 31;
      TIMESTAMP at 16#64# range 0 .. 31;
      TAMPID    at 16#68# range 0 .. 31;
      BKUP      at 16#80# range 0 .. 255;
   end record;

   ----------------------------------
   -- RtcMode1 cluster's Registers --
   ----------------------------------

   --  MODE1 Control A
   type RTC_CTRLA_RTC_MODE1_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.RTC.COUNT32;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.RTC.OFF;
      --  unspecified
      Reserved_12_12 : HAL.Bit := 16#0#;
      --  BKUP Registers Reset On Tamper Enable
      BKTRST         : Boolean := False;
      --  GP Registers Reset On Tamper Enable
      GPTRST         : Boolean := False;
      --  Count Read Synchronization Enable
      COUNTSYNC      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRLA_RTC_MODE1_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      PRESCALER      at 0 range 8 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      BKTRST         at 0 range 13 .. 13;
      GPTRST         at 0 range 14 .. 14;
      COUNTSYNC      at 0 range 15 .. 15;
   end record;

   --  MODE1 Control B
   type RTC_CTRLB_RTC_MODE1_Register is record
      --  General Purpose 0 Enable
      GP0EN          : Boolean := False;
      --  General Purpose 2 Enable
      GP2EN          : Boolean := False;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Debouncer Majority Enable
      DEBMAJ         : Boolean := False;
      --  Debouncer Asynchronous Enable
      DEBASYNC       : Boolean := False;
      --  RTC Output Enable
      RTCOUT         : Boolean := False;
      --  DMA Enable
      DMAEN          : Boolean := False;
      --  Debounce Freqnuency
      DEBF           : CTRLB_DEBFSelect := SAM_SVD.RTC.DIV2;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Active Layer Freqnuency
      ACTF           : CTRLB_ACTFSelect := SAM_SVD.RTC.DIV2;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRLB_RTC_MODE1_Register use record
      GP0EN          at 0 range 0 .. 0;
      GP2EN          at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      DEBMAJ         at 0 range 4 .. 4;
      DEBASYNC       at 0 range 5 .. 5;
      RTCOUT         at 0 range 6 .. 6;
      DMAEN          at 0 range 7 .. 7;
      DEBF           at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      ACTF           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  RTC_EVCTRL_RTC_MODE1_PEREO array
   type RTC_EVCTRL_RTC_MODE1_PEREO_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_EVCTRL_RTC_MODE1_PEREO
   type RTC_EVCTRL_RTC_MODE1_PEREO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PEREO as a value
            Val : HAL.UInt8;
         when True =>
            --  PEREO as an array
            Arr : RTC_EVCTRL_RTC_MODE1_PEREO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_EVCTRL_RTC_MODE1_PEREO_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_EVCTRL_RTC_MODE1_CMPEO array
   type RTC_EVCTRL_RTC_MODE1_CMPEO_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_EVCTRL_RTC_MODE1_CMPEO
   type RTC_EVCTRL_RTC_MODE1_CMPEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPEO as a value
            Val : HAL.UInt4;
         when True =>
            --  CMPEO as an array
            Arr : RTC_EVCTRL_RTC_MODE1_CMPEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_EVCTRL_RTC_MODE1_CMPEO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  MODE1 Event Control
   type RTC_EVCTRL_RTC_MODE1_Register is record
      --  Periodic Interval 0 Event Output Enable
      PEREO          : RTC_EVCTRL_RTC_MODE1_PEREO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0 Event Output Enable
      CMPEO          : RTC_EVCTRL_RTC_MODE1_CMPEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  Tamper Event Output Enable
      TAMPEREO       : Boolean := False;
      --  Overflow Event Output Enable
      OVFEO          : Boolean := False;
      --  Tamper Event Input Enable
      TAMPEVEI       : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_EVCTRL_RTC_MODE1_Register use record
      PEREO          at 0 range 0 .. 7;
      CMPEO          at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      TAMPEREO       at 0 range 14 .. 14;
      OVFEO          at 0 range 15 .. 15;
      TAMPEVEI       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  RTC_INTENCLR_RTC_MODE1_PER array
   type RTC_INTENCLR_RTC_MODE1_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTENCLR_RTC_MODE1_PER
   type RTC_INTENCLR_RTC_MODE1_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTENCLR_RTC_MODE1_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTENCLR_RTC_MODE1_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTENCLR_RTC_MODE1_CMP array
   type RTC_INTENCLR_RTC_MODE1_CMP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_INTENCLR_RTC_MODE1_CMP
   type RTC_INTENCLR_RTC_MODE1_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : HAL.UInt4;
         when True =>
            --  CMP as an array
            Arr : RTC_INTENCLR_RTC_MODE1_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_INTENCLR_RTC_MODE1_CMP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  MODE1 Interrupt Enable Clear
   type RTC_INTENCLR_RTC_MODE1_Register is record
      --  Periodic Interval 0 Interrupt Enable
      PER            : RTC_INTENCLR_RTC_MODE1_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0 Interrupt Enable
      CMP            : RTC_INTENCLR_RTC_MODE1_CMP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  Tamper Enable
      TAMPER         : Boolean := False;
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENCLR_RTC_MODE1_Register use record
      PER            at 0 range 0 .. 7;
      CMP            at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  RTC_INTENSET_RTC_MODE1_PER array
   type RTC_INTENSET_RTC_MODE1_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTENSET_RTC_MODE1_PER
   type RTC_INTENSET_RTC_MODE1_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTENSET_RTC_MODE1_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTENSET_RTC_MODE1_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTENSET_RTC_MODE1_CMP array
   type RTC_INTENSET_RTC_MODE1_CMP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_INTENSET_RTC_MODE1_CMP
   type RTC_INTENSET_RTC_MODE1_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : HAL.UInt4;
         when True =>
            --  CMP as an array
            Arr : RTC_INTENSET_RTC_MODE1_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_INTENSET_RTC_MODE1_CMP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  MODE1 Interrupt Enable Set
   type RTC_INTENSET_RTC_MODE1_Register is record
      --  Periodic Interval 0 Interrupt Enable
      PER            : RTC_INTENSET_RTC_MODE1_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0 Interrupt Enable
      CMP            : RTC_INTENSET_RTC_MODE1_CMP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  Tamper Enable
      TAMPER         : Boolean := False;
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENSET_RTC_MODE1_Register use record
      PER            at 0 range 0 .. 7;
      CMP            at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  RTC_INTFLAG_RTC_MODE1_PER array
   type RTC_INTFLAG_RTC_MODE1_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTFLAG_RTC_MODE1_PER
   type RTC_INTFLAG_RTC_MODE1_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTFLAG_RTC_MODE1_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTFLAG_RTC_MODE1_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTFLAG_RTC_MODE1_CMP array
   type RTC_INTFLAG_RTC_MODE1_CMP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_INTFLAG_RTC_MODE1_CMP
   type RTC_INTFLAG_RTC_MODE1_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : HAL.UInt4;
         when True =>
            --  CMP as an array
            Arr : RTC_INTFLAG_RTC_MODE1_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_INTFLAG_RTC_MODE1_CMP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  MODE1 Interrupt Flag Status and Clear
   type RTC_INTFLAG_RTC_MODE1_Register is record
      --  Periodic Interval 0
      PER            : RTC_INTFLAG_RTC_MODE1_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0
      CMP            : RTC_INTFLAG_RTC_MODE1_CMP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  Tamper
      TAMPER         : Boolean := False;
      --  Overflow
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTFLAG_RTC_MODE1_Register use record
      PER            at 0 range 0 .. 7;
      CMP            at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  Debug Control
   type RTC_DBGCTRL_RTC_MODE1_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_DBGCTRL_RTC_MODE1_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  RTC_SYNCBUSY_RTC_MODE1_COMP array
   type RTC_SYNCBUSY_RTC_MODE1_COMP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_SYNCBUSY_RTC_MODE1_COMP
   type RTC_SYNCBUSY_RTC_MODE1_COMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMP as a value
            Val : HAL.UInt4;
         when True =>
            --  COMP as an array
            Arr : RTC_SYNCBUSY_RTC_MODE1_COMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_SYNCBUSY_RTC_MODE1_COMP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  RTC_SYNCBUSY_RTC_MODE1_GP array
   type RTC_SYNCBUSY_RTC_MODE1_GP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_SYNCBUSY_RTC_MODE1_GP
   type RTC_SYNCBUSY_RTC_MODE1_GP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GP as a value
            Val : HAL.UInt4;
         when True =>
            --  GP as an array
            Arr : RTC_SYNCBUSY_RTC_MODE1_GP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_SYNCBUSY_RTC_MODE1_GP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  MODE1 Synchronization Busy Status
   type RTC_SYNCBUSY_RTC_MODE1_Register is record
      --  Read-only. Software Reset Bit Busy
      SWRST          : Boolean;
      --  Read-only. Enable Bit Busy
      ENABLE         : Boolean;
      --  Read-only. FREQCORR Register Busy
      FREQCORR       : Boolean;
      --  Read-only. COUNT Register Busy
      COUNT          : Boolean;
      --  Read-only. PER Register Busy
      PER            : Boolean;
      --  Read-only. COMP 0 Register Busy
      COMP           : RTC_SYNCBUSY_RTC_MODE1_COMP_Field;
      --  unspecified
      Reserved_9_14  : HAL.UInt6;
      --  Read-only. Count Synchronization Enable Bit Busy
      COUNTSYNC      : Boolean;
      --  Read-only. General Purpose 0 Register Busy
      GP             : RTC_SYNCBUSY_RTC_MODE1_GP_Field;
      --  unspecified
      Reserved_20_31 : HAL.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_SYNCBUSY_RTC_MODE1_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      FREQCORR       at 0 range 2 .. 2;
      COUNT          at 0 range 3 .. 3;
      PER            at 0 range 4 .. 4;
      COMP           at 0 range 5 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      COUNTSYNC      at 0 range 15 .. 15;
      GP             at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype RTC_FREQCORR_RTC_MODE1_VALUE_Field is HAL.UInt7;

   --  Frequency Correction
   type RTC_FREQCORR_RTC_MODE1_Register is record
      --  Correction Value
      VALUE : RTC_FREQCORR_RTC_MODE1_VALUE_Field := 16#0#;
      --  Correction Sign
      SIGN  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_FREQCORR_RTC_MODE1_Register use record
      VALUE at 0 range 0 .. 6;
      SIGN  at 0 range 7 .. 7;
   end record;

   --  MODE1 Compare n Value

   --  MODE1 Compare n Value
   type RTC_COMP_RTC_MODE1_Registers is array (0 .. 3) of HAL.UInt16;

   --  General Purpose

   --  General Purpose
   type RTC_GP_RTC_MODE1_Registers is array (0 .. 3) of HAL.UInt32;

   --  RTC_TAMPCTRL_RTC_MODE1_TAMLVL array
   type RTC_TAMPCTRL_RTC_MODE1_TAMLVL_Field_Array is array (0 .. 4)
     of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPCTRL_RTC_MODE1_TAMLVL
   type RTC_TAMPCTRL_RTC_MODE1_TAMLVL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TAMLVL as a value
            Val : HAL.UInt5;
         when True =>
            --  TAMLVL as an array
            Arr : RTC_TAMPCTRL_RTC_MODE1_TAMLVL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPCTRL_RTC_MODE1_TAMLVL_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  RTC_TAMPCTRL_RTC_MODE1_DEBNC array
   type RTC_TAMPCTRL_RTC_MODE1_DEBNC_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPCTRL_RTC_MODE1_DEBNC
   type RTC_TAMPCTRL_RTC_MODE1_DEBNC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DEBNC as a value
            Val : HAL.UInt5;
         when True =>
            --  DEBNC as an array
            Arr : RTC_TAMPCTRL_RTC_MODE1_DEBNC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPCTRL_RTC_MODE1_DEBNC_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Tamper Control
   type RTC_TAMPCTRL_RTC_MODE1_Register is record
      --  Tamper Input 0 Action
      IN0ACT         : TAMPCTRL_IN0ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 1 Action
      IN1ACT         : TAMPCTRL_IN1ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 2 Action
      IN2ACT         : TAMPCTRL_IN2ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 3 Action
      IN3ACT         : TAMPCTRL_IN3ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 4 Action
      IN4ACT         : TAMPCTRL_IN4ACTSelect := SAM_SVD.RTC.OFF;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  Tamper Level Select 0
      TAMLVL         : RTC_TAMPCTRL_RTC_MODE1_TAMLVL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  Debouncer Enable 0
      DEBNC          : RTC_TAMPCTRL_RTC_MODE1_DEBNC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TAMPCTRL_RTC_MODE1_Register use record
      IN0ACT         at 0 range 0 .. 1;
      IN1ACT         at 0 range 2 .. 3;
      IN2ACT         at 0 range 4 .. 5;
      IN3ACT         at 0 range 6 .. 7;
      IN4ACT         at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      TAMLVL         at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      DEBNC          at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype RTC_TIMESTAMP_RTC_MODE1_COUNT_Field is HAL.UInt16;

   --  MODE1 Timestamp
   type RTC_TIMESTAMP_RTC_MODE1_Register is record
      --  Read-only. Count Timestamp Value
      COUNT          : RTC_TIMESTAMP_RTC_MODE1_COUNT_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TIMESTAMP_RTC_MODE1_Register use record
      COUNT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  RTC_TAMPID_RTC_MODE1_TAMPID array
   type RTC_TAMPID_RTC_MODE1_TAMPID_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPID_RTC_MODE1_TAMPID
   type RTC_TAMPID_RTC_MODE1_TAMPID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TAMPID as a value
            Val : HAL.UInt5;
         when True =>
            --  TAMPID as an array
            Arr : RTC_TAMPID_RTC_MODE1_TAMPID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPID_RTC_MODE1_TAMPID_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Tamper ID
   type RTC_TAMPID_RTC_MODE1_Register is record
      --  Tamper Input 0 Detected
      TAMPID        : RTC_TAMPID_RTC_MODE1_TAMPID_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_30 : HAL.UInt26 := 16#0#;
      --  Tamper Event Detected
      TAMPEVT       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TAMPID_RTC_MODE1_Register use record
      TAMPID        at 0 range 0 .. 4;
      Reserved_5_30 at 0 range 5 .. 30;
      TAMPEVT       at 0 range 31 .. 31;
   end record;

   --  Backup

   --  Backup
   type RTC_BKUP_RTC_MODE1_Registers is array (0 .. 7) of HAL.UInt32;

   --  16-bit Counter with Two 16-bit Compares
   type RtcMode1_Cluster is record
      --  MODE1 Control A
      CTRLA     : aliased RTC_CTRLA_RTC_MODE1_Register;
      --  MODE1 Control B
      CTRLB     : aliased RTC_CTRLB_RTC_MODE1_Register;
      --  MODE1 Event Control
      EVCTRL    : aliased RTC_EVCTRL_RTC_MODE1_Register;
      --  MODE1 Interrupt Enable Clear
      INTENCLR  : aliased RTC_INTENCLR_RTC_MODE1_Register;
      --  MODE1 Interrupt Enable Set
      INTENSET  : aliased RTC_INTENSET_RTC_MODE1_Register;
      --  MODE1 Interrupt Flag Status and Clear
      INTFLAG   : aliased RTC_INTFLAG_RTC_MODE1_Register;
      --  Debug Control
      DBGCTRL   : aliased RTC_DBGCTRL_RTC_MODE1_Register;
      --  MODE1 Synchronization Busy Status
      SYNCBUSY  : aliased RTC_SYNCBUSY_RTC_MODE1_Register;
      --  Frequency Correction
      FREQCORR  : aliased RTC_FREQCORR_RTC_MODE1_Register;
      --  MODE1 Counter Value
      COUNT     : aliased HAL.UInt16;
      --  MODE1 Counter Period
      PER       : aliased HAL.UInt16;
      --  MODE1 Compare n Value
      COMP      : aliased RTC_COMP_RTC_MODE1_Registers;
      --  General Purpose
      GP        : aliased RTC_GP_RTC_MODE1_Registers;
      --  Tamper Control
      TAMPCTRL  : aliased RTC_TAMPCTRL_RTC_MODE1_Register;
      --  MODE1 Timestamp
      TIMESTAMP : aliased RTC_TIMESTAMP_RTC_MODE1_Register;
      --  Tamper ID
      TAMPID    : aliased RTC_TAMPID_RTC_MODE1_Register;
      --  Backup
      BKUP      : aliased RTC_BKUP_RTC_MODE1_Registers;
   end record
     with Size => 1280;

   for RtcMode1_Cluster use record
      CTRLA     at 16#0# range 0 .. 15;
      CTRLB     at 16#2# range 0 .. 15;
      EVCTRL    at 16#4# range 0 .. 31;
      INTENCLR  at 16#8# range 0 .. 15;
      INTENSET  at 16#A# range 0 .. 15;
      INTFLAG   at 16#C# range 0 .. 15;
      DBGCTRL   at 16#E# range 0 .. 7;
      SYNCBUSY  at 16#10# range 0 .. 31;
      FREQCORR  at 16#14# range 0 .. 7;
      COUNT     at 16#18# range 0 .. 15;
      PER       at 16#1C# range 0 .. 15;
      COMP      at 16#20# range 0 .. 63;
      GP        at 16#40# range 0 .. 127;
      TAMPCTRL  at 16#60# range 0 .. 31;
      TIMESTAMP at 16#64# range 0 .. 31;
      TAMPID    at 16#68# range 0 .. 31;
      BKUP      at 16#80# range 0 .. 255;
   end record;

   ----------------------------------
   -- RtcMode2 cluster's Registers --
   ----------------------------------

   --  MODE2 Control A
   type RTC_CTRLA_RTC_MODE2_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.RTC.COUNT32;
      --  unspecified
      Reserved_4_5   : HAL.UInt2 := 16#0#;
      --  Clock Representation
      CLKREP         : Boolean := False;
      --  Clear on Match
      MATCHCLR       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.RTC.OFF;
      --  unspecified
      Reserved_12_12 : HAL.Bit := 16#0#;
      --  BKUP Registers Reset On Tamper Enable
      BKTRST         : Boolean := False;
      --  GP Registers Reset On Tamper Enable
      GPTRST         : Boolean := False;
      --  Clock Read Synchronization Enable
      CLOCKSYNC      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRLA_RTC_MODE2_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      CLKREP         at 0 range 6 .. 6;
      MATCHCLR       at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      BKTRST         at 0 range 13 .. 13;
      GPTRST         at 0 range 14 .. 14;
      CLOCKSYNC      at 0 range 15 .. 15;
   end record;

   --  MODE2 Control B
   type RTC_CTRLB_RTC_MODE2_Register is record
      --  General Purpose 0 Enable
      GP0EN          : Boolean := False;
      --  General Purpose 2 Enable
      GP2EN          : Boolean := False;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Debouncer Majority Enable
      DEBMAJ         : Boolean := False;
      --  Debouncer Asynchronous Enable
      DEBASYNC       : Boolean := False;
      --  RTC Output Enable
      RTCOUT         : Boolean := False;
      --  DMA Enable
      DMAEN          : Boolean := False;
      --  Debounce Freqnuency
      DEBF           : CTRLB_DEBFSelect := SAM_SVD.RTC.DIV2;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Active Layer Freqnuency
      ACTF           : CTRLB_ACTFSelect := SAM_SVD.RTC.DIV2;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRLB_RTC_MODE2_Register use record
      GP0EN          at 0 range 0 .. 0;
      GP2EN          at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      DEBMAJ         at 0 range 4 .. 4;
      DEBASYNC       at 0 range 5 .. 5;
      RTCOUT         at 0 range 6 .. 6;
      DMAEN          at 0 range 7 .. 7;
      DEBF           at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      ACTF           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  RTC_EVCTRL_RTC_MODE2_PEREO array
   type RTC_EVCTRL_RTC_MODE2_PEREO_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_EVCTRL_RTC_MODE2_PEREO
   type RTC_EVCTRL_RTC_MODE2_PEREO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PEREO as a value
            Val : HAL.UInt8;
         when True =>
            --  PEREO as an array
            Arr : RTC_EVCTRL_RTC_MODE2_PEREO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_EVCTRL_RTC_MODE2_PEREO_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_EVCTRL_RTC_MODE2_ALARMEO array
   type RTC_EVCTRL_RTC_MODE2_ALARMEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_EVCTRL_RTC_MODE2_ALARMEO
   type RTC_EVCTRL_RTC_MODE2_ALARMEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ALARMEO as a value
            Val : HAL.UInt2;
         when True =>
            --  ALARMEO as an array
            Arr : RTC_EVCTRL_RTC_MODE2_ALARMEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_EVCTRL_RTC_MODE2_ALARMEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE2 Event Control
   type RTC_EVCTRL_RTC_MODE2_Register is record
      --  Periodic Interval 0 Event Output Enable
      PEREO          : RTC_EVCTRL_RTC_MODE2_PEREO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Alarm 0 Event Output Enable
      ALARMEO        : RTC_EVCTRL_RTC_MODE2_ALARMEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper Event Output Enable
      TAMPEREO       : Boolean := False;
      --  Overflow Event Output Enable
      OVFEO          : Boolean := False;
      --  Tamper Event Input Enable
      TAMPEVEI       : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_EVCTRL_RTC_MODE2_Register use record
      PEREO          at 0 range 0 .. 7;
      ALARMEO        at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPEREO       at 0 range 14 .. 14;
      OVFEO          at 0 range 15 .. 15;
      TAMPEVEI       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  RTC_INTENCLR_RTC_MODE2_PER array
   type RTC_INTENCLR_RTC_MODE2_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTENCLR_RTC_MODE2_PER
   type RTC_INTENCLR_RTC_MODE2_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTENCLR_RTC_MODE2_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTENCLR_RTC_MODE2_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTENCLR_RTC_MODE2_ALARM array
   type RTC_INTENCLR_RTC_MODE2_ALARM_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTENCLR_RTC_MODE2_ALARM
   type RTC_INTENCLR_RTC_MODE2_ALARM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ALARM as a value
            Val : HAL.UInt2;
         when True =>
            --  ALARM as an array
            Arr : RTC_INTENCLR_RTC_MODE2_ALARM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTENCLR_RTC_MODE2_ALARM_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE2 Interrupt Enable Clear
   type RTC_INTENCLR_RTC_MODE2_Register is record
      --  Periodic Interval 0 Interrupt Enable
      PER            : RTC_INTENCLR_RTC_MODE2_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Alarm 0 Interrupt Enable
      ALARM          : RTC_INTENCLR_RTC_MODE2_ALARM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper Enable
      TAMPER         : Boolean := False;
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENCLR_RTC_MODE2_Register use record
      PER            at 0 range 0 .. 7;
      ALARM          at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  RTC_INTENSET_RTC_MODE2_PER array
   type RTC_INTENSET_RTC_MODE2_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTENSET_RTC_MODE2_PER
   type RTC_INTENSET_RTC_MODE2_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTENSET_RTC_MODE2_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTENSET_RTC_MODE2_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTENSET_RTC_MODE2_ALARM array
   type RTC_INTENSET_RTC_MODE2_ALARM_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTENSET_RTC_MODE2_ALARM
   type RTC_INTENSET_RTC_MODE2_ALARM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ALARM as a value
            Val : HAL.UInt2;
         when True =>
            --  ALARM as an array
            Arr : RTC_INTENSET_RTC_MODE2_ALARM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTENSET_RTC_MODE2_ALARM_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE2 Interrupt Enable Set
   type RTC_INTENSET_RTC_MODE2_Register is record
      --  Periodic Interval 0 Enable
      PER            : RTC_INTENSET_RTC_MODE2_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Alarm 0 Interrupt Enable
      ALARM          : RTC_INTENSET_RTC_MODE2_ALARM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper Enable
      TAMPER         : Boolean := False;
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENSET_RTC_MODE2_Register use record
      PER            at 0 range 0 .. 7;
      ALARM          at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  RTC_INTFLAG_RTC_MODE2_PER array
   type RTC_INTFLAG_RTC_MODE2_PER_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_INTFLAG_RTC_MODE2_PER
   type RTC_INTFLAG_RTC_MODE2_PER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PER as a value
            Val : HAL.UInt8;
         when True =>
            --  PER as an array
            Arr : RTC_INTFLAG_RTC_MODE2_PER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_INTFLAG_RTC_MODE2_PER_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_INTFLAG_RTC_MODE2_ALARM array
   type RTC_INTFLAG_RTC_MODE2_ALARM_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTFLAG_RTC_MODE2_ALARM
   type RTC_INTFLAG_RTC_MODE2_ALARM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ALARM as a value
            Val : HAL.UInt2;
         when True =>
            --  ALARM as an array
            Arr : RTC_INTFLAG_RTC_MODE2_ALARM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTFLAG_RTC_MODE2_ALARM_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE2 Interrupt Flag Status and Clear
   type RTC_INTFLAG_RTC_MODE2_Register is record
      --  Periodic Interval 0
      PER            : RTC_INTFLAG_RTC_MODE2_PER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Alarm 0
      ALARM          : RTC_INTFLAG_RTC_MODE2_ALARM_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Tamper
      TAMPER         : Boolean := False;
      --  Overflow
      OVF            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_INTFLAG_RTC_MODE2_Register use record
      PER            at 0 range 0 .. 7;
      ALARM          at 0 range 8 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      TAMPER         at 0 range 14 .. 14;
      OVF            at 0 range 15 .. 15;
   end record;

   --  Debug Control
   type RTC_DBGCTRL_RTC_MODE2_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_DBGCTRL_RTC_MODE2_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  RTC_SYNCBUSY_RTC_MODE2_ALARM array
   type RTC_SYNCBUSY_RTC_MODE2_ALARM_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_SYNCBUSY_RTC_MODE2_ALARM
   type RTC_SYNCBUSY_RTC_MODE2_ALARM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ALARM as a value
            Val : HAL.UInt2;
         when True =>
            --  ALARM as an array
            Arr : RTC_SYNCBUSY_RTC_MODE2_ALARM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_SYNCBUSY_RTC_MODE2_ALARM_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RTC_SYNCBUSY_RTC_MODE2_MASK array
   type RTC_SYNCBUSY_RTC_MODE2_MASK_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_SYNCBUSY_RTC_MODE2_MASK
   type RTC_SYNCBUSY_RTC_MODE2_MASK_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MASK as a value
            Val : HAL.UInt2;
         when True =>
            --  MASK as an array
            Arr : RTC_SYNCBUSY_RTC_MODE2_MASK_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_SYNCBUSY_RTC_MODE2_MASK_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  RTC_SYNCBUSY_RTC_MODE2_GP array
   type RTC_SYNCBUSY_RTC_MODE2_GP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for RTC_SYNCBUSY_RTC_MODE2_GP
   type RTC_SYNCBUSY_RTC_MODE2_GP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GP as a value
            Val : HAL.UInt4;
         when True =>
            --  GP as an array
            Arr : RTC_SYNCBUSY_RTC_MODE2_GP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTC_SYNCBUSY_RTC_MODE2_GP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  MODE2 Synchronization Busy Status
   type RTC_SYNCBUSY_RTC_MODE2_Register is record
      --  Read-only. Software Reset Bit Busy
      SWRST          : Boolean;
      --  Read-only. Enable Bit Busy
      ENABLE         : Boolean;
      --  Read-only. FREQCORR Register Busy
      FREQCORR       : Boolean;
      --  Read-only. CLOCK Register Busy
      CLOCK          : Boolean;
      --  unspecified
      Reserved_4_4   : HAL.Bit;
      --  Read-only. ALARM 0 Register Busy
      ALARM          : RTC_SYNCBUSY_RTC_MODE2_ALARM_Field;
      --  unspecified
      Reserved_7_10  : HAL.UInt4;
      --  Read-only. MASK 0 Register Busy
      MASK           : RTC_SYNCBUSY_RTC_MODE2_MASK_Field;
      --  unspecified
      Reserved_13_14 : HAL.UInt2;
      --  Read-only. Clock Synchronization Enable Bit Busy
      CLOCKSYNC      : Boolean;
      --  Read-only. General Purpose 0 Register Busy
      GP             : RTC_SYNCBUSY_RTC_MODE2_GP_Field;
      --  unspecified
      Reserved_20_31 : HAL.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_SYNCBUSY_RTC_MODE2_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      FREQCORR       at 0 range 2 .. 2;
      CLOCK          at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      ALARM          at 0 range 5 .. 6;
      Reserved_7_10  at 0 range 7 .. 10;
      MASK           at 0 range 11 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      CLOCKSYNC      at 0 range 15 .. 15;
      GP             at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype RTC_FREQCORR_RTC_MODE2_VALUE_Field is HAL.UInt7;

   --  Frequency Correction
   type RTC_FREQCORR_RTC_MODE2_Register is record
      --  Correction Value
      VALUE : RTC_FREQCORR_RTC_MODE2_VALUE_Field := 16#0#;
      --  Correction Sign
      SIGN  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_FREQCORR_RTC_MODE2_Register use record
      VALUE at 0 range 0 .. 6;
      SIGN  at 0 range 7 .. 7;
   end record;

   subtype RTC_CLOCK_RTC_MODE2_SECOND_Field is HAL.UInt6;
   subtype RTC_CLOCK_RTC_MODE2_MINUTE_Field is HAL.UInt6;

   --  Hour
   type CLOCK_HOURSelect is
     (--  AM when CLKREP in 12-hour
      AM,
      --  PM when CLKREP in 12-hour
      PM)
     with Size => 5;
   for CLOCK_HOURSelect use
     (AM => 0,
      PM => 16);

   subtype RTC_CLOCK_RTC_MODE2_DAY_Field is HAL.UInt5;
   subtype RTC_CLOCK_RTC_MODE2_MONTH_Field is HAL.UInt4;
   subtype RTC_CLOCK_RTC_MODE2_YEAR_Field is HAL.UInt6;

   --  MODE2 Clock Value
   type RTC_CLOCK_RTC_MODE2_Register is record
      --  Second
      SECOND : RTC_CLOCK_RTC_MODE2_SECOND_Field := 16#0#;
      --  Minute
      MINUTE : RTC_CLOCK_RTC_MODE2_MINUTE_Field := 16#0#;
      --  Hour
      HOUR   : CLOCK_HOURSelect := SAM_SVD.RTC.AM;
      --  Day
      DAY    : RTC_CLOCK_RTC_MODE2_DAY_Field := 16#0#;
      --  Month
      MONTH  : RTC_CLOCK_RTC_MODE2_MONTH_Field := 16#0#;
      --  Year
      YEAR   : RTC_CLOCK_RTC_MODE2_YEAR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_CLOCK_RTC_MODE2_Register use record
      SECOND at 0 range 0 .. 5;
      MINUTE at 0 range 6 .. 11;
      HOUR   at 0 range 12 .. 16;
      DAY    at 0 range 17 .. 21;
      MONTH  at 0 range 22 .. 25;
      YEAR   at 0 range 26 .. 31;
   end record;

   subtype ALARM_SECOND_Field is HAL.UInt6;
   subtype ALARM_MINUTE_Field is HAL.UInt6;

   --  Hour
   type ALARM0_HOURSelect is
     (--  Morning hour
      AM,
      --  Afternoon hour
      PM)
     with Size => 5;
   for ALARM0_HOURSelect use
     (AM => 0,
      PM => 16);

   subtype ALARM_DAY_Field is HAL.UInt5;
   subtype ALARM_MONTH_Field is HAL.UInt4;
   subtype ALARM_YEAR_Field is HAL.UInt6;

   --  MODE2_ALARM Alarm n Value
   type ALARM_Register is record
      --  Second
      SECOND : ALARM_SECOND_Field := 16#0#;
      --  Minute
      MINUTE : ALARM_MINUTE_Field := 16#0#;
      --  Hour
      HOUR   : ALARM0_HOURSelect := SAM_SVD.RTC.AM;
      --  Day
      DAY    : ALARM_DAY_Field := 16#0#;
      --  Month
      MONTH  : ALARM_MONTH_Field := 16#0#;
      --  Year
      YEAR   : ALARM_YEAR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALARM_Register use record
      SECOND at 0 range 0 .. 5;
      MINUTE at 0 range 6 .. 11;
      HOUR   at 0 range 12 .. 16;
      DAY    at 0 range 17 .. 21;
      MONTH  at 0 range 22 .. 25;
      YEAR   at 0 range 26 .. 31;
   end record;

   --  Alarm Mask Selection
   type MASK0_SELSelect is
     (--  Alarm Disabled
      OFF,
      --  Match seconds only
      SS,
      --  Match seconds and minutes only
      MMSS,
      --  Match seconds, minutes, and hours only
      HHMMSS,
      --  Match seconds, minutes, hours, and days only
      DDHHMMSS,
      --  Match seconds, minutes, hours, days, and months only
      MMDDHHMMSS,
      --  Match seconds, minutes, hours, days, months, and years
      YYMMDDHHMMSS)
     with Size => 3;
   for MASK0_SELSelect use
     (OFF => 0,
      SS => 1,
      MMSS => 2,
      HHMMSS => 3,
      DDHHMMSS => 4,
      MMDDHHMMSS => 5,
      YYMMDDHHMMSS => 6);

   --  MODE2_ALARM Alarm n Mask
   type MASK_Register is record
      --  Alarm Mask Selection
      SEL          : MASK0_SELSelect := SAM_SVD.RTC.OFF;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for MASK_Register use record
      SEL          at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  General Purpose

   --  General Purpose
   type RTC_GP_RTC_MODE2_Registers is array (0 .. 3) of HAL.UInt32;

   --  RTC_TAMPCTRL_RTC_MODE2_TAMLVL array
   type RTC_TAMPCTRL_RTC_MODE2_TAMLVL_Field_Array is array (0 .. 4)
     of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPCTRL_RTC_MODE2_TAMLVL
   type RTC_TAMPCTRL_RTC_MODE2_TAMLVL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TAMLVL as a value
            Val : HAL.UInt5;
         when True =>
            --  TAMLVL as an array
            Arr : RTC_TAMPCTRL_RTC_MODE2_TAMLVL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPCTRL_RTC_MODE2_TAMLVL_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  RTC_TAMPCTRL_RTC_MODE2_DEBNC array
   type RTC_TAMPCTRL_RTC_MODE2_DEBNC_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPCTRL_RTC_MODE2_DEBNC
   type RTC_TAMPCTRL_RTC_MODE2_DEBNC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DEBNC as a value
            Val : HAL.UInt5;
         when True =>
            --  DEBNC as an array
            Arr : RTC_TAMPCTRL_RTC_MODE2_DEBNC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPCTRL_RTC_MODE2_DEBNC_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Tamper Control
   type RTC_TAMPCTRL_RTC_MODE2_Register is record
      --  Tamper Input 0 Action
      IN0ACT         : TAMPCTRL_IN0ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 1 Action
      IN1ACT         : TAMPCTRL_IN1ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 2 Action
      IN2ACT         : TAMPCTRL_IN2ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 3 Action
      IN3ACT         : TAMPCTRL_IN3ACTSelect := SAM_SVD.RTC.OFF;
      --  Tamper Input 4 Action
      IN4ACT         : TAMPCTRL_IN4ACTSelect := SAM_SVD.RTC.OFF;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  Tamper Level Select 0
      TAMLVL         : RTC_TAMPCTRL_RTC_MODE2_TAMLVL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      --  Debouncer Enable 0
      DEBNC          : RTC_TAMPCTRL_RTC_MODE2_DEBNC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TAMPCTRL_RTC_MODE2_Register use record
      IN0ACT         at 0 range 0 .. 1;
      IN1ACT         at 0 range 2 .. 3;
      IN2ACT         at 0 range 4 .. 5;
      IN3ACT         at 0 range 6 .. 7;
      IN4ACT         at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      TAMLVL         at 0 range 16 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      DEBNC          at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype RTC_TIMESTAMP_RTC_MODE2_SECOND_Field is HAL.UInt6;
   subtype RTC_TIMESTAMP_RTC_MODE2_MINUTE_Field is HAL.UInt6;

   --  Hour Timestamp Value
   type TIMESTAMP_HOURSelect is
     (--  AM when CLKREP in 12-hour
      AM,
      --  PM when CLKREP in 12-hour
      PM)
     with Size => 5;
   for TIMESTAMP_HOURSelect use
     (AM => 0,
      PM => 16);

   subtype RTC_TIMESTAMP_RTC_MODE2_DAY_Field is HAL.UInt5;
   subtype RTC_TIMESTAMP_RTC_MODE2_MONTH_Field is HAL.UInt4;
   subtype RTC_TIMESTAMP_RTC_MODE2_YEAR_Field is HAL.UInt6;

   --  MODE2 Timestamp
   type RTC_TIMESTAMP_RTC_MODE2_Register is record
      --  Read-only. Second Timestamp Value
      SECOND : RTC_TIMESTAMP_RTC_MODE2_SECOND_Field;
      --  Read-only. Minute Timestamp Value
      MINUTE : RTC_TIMESTAMP_RTC_MODE2_MINUTE_Field;
      --  Read-only. Hour Timestamp Value
      HOUR   : TIMESTAMP_HOURSelect;
      --  Read-only. Day Timestamp Value
      DAY    : RTC_TIMESTAMP_RTC_MODE2_DAY_Field;
      --  Read-only. Month Timestamp Value
      MONTH  : RTC_TIMESTAMP_RTC_MODE2_MONTH_Field;
      --  Read-only. Year Timestamp Value
      YEAR   : RTC_TIMESTAMP_RTC_MODE2_YEAR_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TIMESTAMP_RTC_MODE2_Register use record
      SECOND at 0 range 0 .. 5;
      MINUTE at 0 range 6 .. 11;
      HOUR   at 0 range 12 .. 16;
      DAY    at 0 range 17 .. 21;
      MONTH  at 0 range 22 .. 25;
      YEAR   at 0 range 26 .. 31;
   end record;

   --  RTC_TAMPID_RTC_MODE2_TAMPID array
   type RTC_TAMPID_RTC_MODE2_TAMPID_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for RTC_TAMPID_RTC_MODE2_TAMPID
   type RTC_TAMPID_RTC_MODE2_TAMPID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TAMPID as a value
            Val : HAL.UInt5;
         when True =>
            --  TAMPID as an array
            Arr : RTC_TAMPID_RTC_MODE2_TAMPID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for RTC_TAMPID_RTC_MODE2_TAMPID_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Tamper ID
   type RTC_TAMPID_RTC_MODE2_Register is record
      --  Tamper Input 0 Detected
      TAMPID        : RTC_TAMPID_RTC_MODE2_TAMPID_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_30 : HAL.UInt26 := 16#0#;
      --  Tamper Event Detected
      TAMPEVT       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_TAMPID_RTC_MODE2_Register use record
      TAMPID        at 0 range 0 .. 4;
      Reserved_5_30 at 0 range 5 .. 30;
      TAMPEVT       at 0 range 31 .. 31;
   end record;

   --  Backup

   --  Backup
   type RTC_BKUP_RTC_MODE2_Registers is array (0 .. 7) of HAL.UInt32;

   --  Clock/Calendar with Alarm
   type RtcMode2_Cluster is record
      --  MODE2 Control A
      CTRLA     : aliased RTC_CTRLA_RTC_MODE2_Register;
      --  MODE2 Control B
      CTRLB     : aliased RTC_CTRLB_RTC_MODE2_Register;
      --  MODE2 Event Control
      EVCTRL    : aliased RTC_EVCTRL_RTC_MODE2_Register;
      --  MODE2 Interrupt Enable Clear
      INTENCLR  : aliased RTC_INTENCLR_RTC_MODE2_Register;
      --  MODE2 Interrupt Enable Set
      INTENSET  : aliased RTC_INTENSET_RTC_MODE2_Register;
      --  MODE2 Interrupt Flag Status and Clear
      INTFLAG   : aliased RTC_INTFLAG_RTC_MODE2_Register;
      --  Debug Control
      DBGCTRL   : aliased RTC_DBGCTRL_RTC_MODE2_Register;
      --  MODE2 Synchronization Busy Status
      SYNCBUSY  : aliased RTC_SYNCBUSY_RTC_MODE2_Register;
      --  Frequency Correction
      FREQCORR  : aliased RTC_FREQCORR_RTC_MODE2_Register;
      --  MODE2 Clock Value
      CLOCK     : aliased RTC_CLOCK_RTC_MODE2_Register;
      --  MODE2_ALARM Alarm n Value
      ALARM0    : aliased ALARM_Register;
      --  MODE2_ALARM Alarm n Mask
      MASK0     : aliased MASK_Register;
      --  MODE2_ALARM Alarm n Value
      ALARM1    : aliased ALARM_Register;
      --  MODE2_ALARM Alarm n Mask
      MASK1     : aliased MASK_Register;
      --  General Purpose
      GP        : aliased RTC_GP_RTC_MODE2_Registers;
      --  Tamper Control
      TAMPCTRL  : aliased RTC_TAMPCTRL_RTC_MODE2_Register;
      --  MODE2 Timestamp
      TIMESTAMP : aliased RTC_TIMESTAMP_RTC_MODE2_Register;
      --  Tamper ID
      TAMPID    : aliased RTC_TAMPID_RTC_MODE2_Register;
      --  Backup
      BKUP      : aliased RTC_BKUP_RTC_MODE2_Registers;
   end record
     with Size => 1280;

   for RtcMode2_Cluster use record
      CTRLA     at 16#0# range 0 .. 15;
      CTRLB     at 16#2# range 0 .. 15;
      EVCTRL    at 16#4# range 0 .. 31;
      INTENCLR  at 16#8# range 0 .. 15;
      INTENSET  at 16#A# range 0 .. 15;
      INTFLAG   at 16#C# range 0 .. 15;
      DBGCTRL   at 16#E# range 0 .. 7;
      SYNCBUSY  at 16#10# range 0 .. 31;
      FREQCORR  at 16#14# range 0 .. 7;
      CLOCK     at 16#18# range 0 .. 31;
      ALARM0    at 16#20# range 0 .. 31;
      MASK0     at 16#24# range 0 .. 7;
      ALARM1    at 16#28# range 0 .. 31;
      MASK1     at 16#2C# range 0 .. 7;
      GP        at 16#40# range 0 .. 127;
      TAMPCTRL  at 16#60# range 0 .. 31;
      TIMESTAMP at 16#64# range 0 .. 31;
      TAMPID    at 16#68# range 0 .. 31;
      BKUP      at 16#80# range 0 .. 255;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RTC_Disc is
     (Val_0,
      Val_1,
      Val_2);

   --  Real-Time Counter
   type RTC_Peripheral
     (Discriminent : RTC_Disc := Val_0)
   is record
      case Discriminent is
         when Val_0 =>
            --  32-bit Counter with Single 32-bit Compare
            RTC_MODE0 : aliased RtcMode0_Cluster;
         when Val_1 =>
            --  16-bit Counter with Two 16-bit Compares
            RTC_MODE1 : aliased RtcMode1_Cluster;
         when Val_2 =>
            --  Clock/Calendar with Alarm
            RTC_MODE2 : aliased RtcMode2_Cluster;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for RTC_Peripheral use record
      RTC_MODE0 at 0 range 0 .. 1279;
      RTC_MODE1 at 0 range 0 .. 1279;
      RTC_MODE2 at 0 range 0 .. 1279;
   end record;

   --  Real-Time Counter
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end SAM_SVD.RTC;
