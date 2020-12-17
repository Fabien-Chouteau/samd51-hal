pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.TCC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Enhanced Resolution
   type CTRLA_RESOLUTIONSelect is
     (--  Dithering is disabled
      NONE,
      --  Dithering is done every 16 PWM frames
      DITH4,
      --  Dithering is done every 32 PWM frames
      DITH5,
      --  Dithering is done every 64 PWM frames
      DITH6)
     with Size => 2;
   for CTRLA_RESOLUTIONSelect use
     (NONE => 0,
      DITH4 => 1,
      DITH5 => 2,
      DITH6 => 3);

   --  Prescaler
   type CTRLA_PRESCALERSelect is
     (--  No division
      DIV1,
      --  Divide by 2
      DIV2,
      --  Divide by 4
      DIV4,
      --  Divide by 8
      DIV8,
      --  Divide by 16
      DIV16,
      --  Divide by 64
      DIV64,
      --  Divide by 256
      DIV256,
      --  Divide by 1024
      DIV1024)
     with Size => 3;
   for CTRLA_PRESCALERSelect use
     (DIV1 => 0,
      DIV2 => 1,
      DIV4 => 2,
      DIV8 => 3,
      DIV16 => 4,
      DIV64 => 5,
      DIV256 => 6,
      DIV1024 => 7);

   --  Prescaler and Counter Synchronization Selection
   type CTRLA_PRESCSYNCSelect is
     (--  Reload or reset counter on next GCLK
      GCLK,
      --  Reload or reset counter on next prescaler clock
      PRESC,
      --  Reload or reset counter on next GCLK and reset prescaler counter
      RESYNC)
     with Size => 2;
   for CTRLA_PRESCSYNCSelect use
     (GCLK => 0,
      PRESC => 1,
      RESYNC => 2);

   --  TCC_CTRLA_CPTEN array
   type TCC_CTRLA_CPTEN_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_CTRLA_CPTEN
   type TCC_CTRLA_CPTEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CPTEN as a value
            Val : HAL.UInt6;
         when True =>
            --  CPTEN as an array
            Arr : TCC_CTRLA_CPTEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_CTRLA_CPTEN_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Control A
   type TCC_CTRLA_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_2_4   : HAL.UInt3 := 16#0#;
      --  Enhanced Resolution
      RESOLUTION     : CTRLA_RESOLUTIONSelect := SAM_SVD.TCC.NONE;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.TCC.DIV1;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  Prescaler and Counter Synchronization Selection
      PRESCSYNC      : CTRLA_PRESCSYNCSelect := SAM_SVD.TCC.GCLK;
      --  Auto Lock
      ALOCK          : Boolean := False;
      --  Master Synchronization (only for TCC Slave Instance)
      MSYNC          : Boolean := False;
      --  unspecified
      Reserved_16_22 : HAL.UInt7 := 16#0#;
      --  DMA One-shot Trigger Mode
      DMAOS          : Boolean := False;
      --  Capture Channel 0 Enable
      CPTEN          : TCC_CTRLA_CPTEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CTRLA_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      RESOLUTION     at 0 range 5 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 10;
      RUNSTDBY       at 0 range 11 .. 11;
      PRESCSYNC      at 0 range 12 .. 13;
      ALOCK          at 0 range 14 .. 14;
      MSYNC          at 0 range 15 .. 15;
      Reserved_16_22 at 0 range 16 .. 22;
      DMAOS          at 0 range 23 .. 23;
      CPTEN          at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  Ramp Index Command
   type CTRLBCLR_IDXCMDSelect is
     (--  Command disabled: Index toggles between cycles A and B
      DISABLE,
      --  Set index: cycle B will be forced in the next cycle
      SET,
      --  Clear index: cycle A will be forced in the next cycle
      CLEAR,
      --  Hold index: the next cycle will be the same as the current cycle
      HOLD)
     with Size => 2;
   for CTRLBCLR_IDXCMDSelect use
     (DISABLE => 0,
      SET => 1,
      CLEAR => 2,
      HOLD => 3);

   --  TCC Command
   type CTRLBCLR_CMDSelect is
     (--  No action
      NONE,
      --  Clear start, restart or retrigger
      RETRIGGER,
      --  Force stop
      STOP,
      --  Force update or double buffered registers
      UPDATE,
      --  Force COUNT read synchronization
      READSYNC,
      --  One-shot DMA trigger
      DMAOS)
     with Size => 3;
   for CTRLBCLR_CMDSelect use
     (NONE => 0,
      RETRIGGER => 1,
      STOP => 2,
      UPDATE => 3,
      READSYNC => 4,
      DMAOS => 5);

   --  Control B Clear
   type TCC_CTRLBCLR_Register is record
      --  Counter Direction
      DIR     : Boolean := False;
      --  Lock Update
      LUPD    : Boolean := False;
      --  One-Shot
      ONESHOT : Boolean := False;
      --  Ramp Index Command
      IDXCMD  : CTRLBCLR_IDXCMDSelect := SAM_SVD.TCC.DISABLE;
      --  TCC Command
      CMD     : CTRLBCLR_CMDSelect := SAM_SVD.TCC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TCC_CTRLBCLR_Register use record
      DIR     at 0 range 0 .. 0;
      LUPD    at 0 range 1 .. 1;
      ONESHOT at 0 range 2 .. 2;
      IDXCMD  at 0 range 3 .. 4;
      CMD     at 0 range 5 .. 7;
   end record;

   --  Ramp Index Command
   type CTRLBSET_IDXCMDSelect is
     (--  Command disabled: Index toggles between cycles A and B
      DISABLE,
      --  Set index: cycle B will be forced in the next cycle
      SET,
      --  Clear index: cycle A will be forced in the next cycle
      CLEAR,
      --  Hold index: the next cycle will be the same as the current cycle
      HOLD)
     with Size => 2;
   for CTRLBSET_IDXCMDSelect use
     (DISABLE => 0,
      SET => 1,
      CLEAR => 2,
      HOLD => 3);

   --  TCC Command
   type CTRLBSET_CMDSelect is
     (--  No action
      NONE,
      --  Clear start, restart or retrigger
      RETRIGGER,
      --  Force stop
      STOP,
      --  Force update or double buffered registers
      UPDATE,
      --  Force COUNT read synchronization
      READSYNC,
      --  One-shot DMA trigger
      DMAOS)
     with Size => 3;
   for CTRLBSET_CMDSelect use
     (NONE => 0,
      RETRIGGER => 1,
      STOP => 2,
      UPDATE => 3,
      READSYNC => 4,
      DMAOS => 5);

   --  Control B Set
   type TCC_CTRLBSET_Register is record
      --  Counter Direction
      DIR     : Boolean := False;
      --  Lock Update
      LUPD    : Boolean := False;
      --  One-Shot
      ONESHOT : Boolean := False;
      --  Ramp Index Command
      IDXCMD  : CTRLBSET_IDXCMDSelect := SAM_SVD.TCC.DISABLE;
      --  TCC Command
      CMD     : CTRLBSET_CMDSelect := SAM_SVD.TCC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TCC_CTRLBSET_Register use record
      DIR     at 0 range 0 .. 0;
      LUPD    at 0 range 1 .. 1;
      ONESHOT at 0 range 2 .. 2;
      IDXCMD  at 0 range 3 .. 4;
      CMD     at 0 range 5 .. 7;
   end record;

   --  TCC_SYNCBUSY_CC array
   type TCC_SYNCBUSY_CC_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_SYNCBUSY_CC
   type TCC_SYNCBUSY_CC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CC as a value
            Val : HAL.UInt6;
         when True =>
            --  CC as an array
            Arr : TCC_SYNCBUSY_CC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_SYNCBUSY_CC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Synchronization Busy
   type TCC_SYNCBUSY_Register is record
      --  Read-only. Swrst Busy
      SWRST          : Boolean;
      --  Read-only. Enable Busy
      ENABLE         : Boolean;
      --  Read-only. Ctrlb Busy
      CTRLB          : Boolean;
      --  Read-only. Status Busy
      STATUS         : Boolean;
      --  Read-only. Count Busy
      COUNT          : Boolean;
      --  Read-only. Pattern Busy
      PATT           : Boolean;
      --  Read-only. Wave Busy
      WAVE           : Boolean;
      --  Read-only. Period Busy
      PER            : Boolean;
      --  Read-only. Compare Channel 0 Busy
      CC             : TCC_SYNCBUSY_CC_Field;
      --  unspecified
      Reserved_14_31 : HAL.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_SYNCBUSY_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      CTRLB          at 0 range 2 .. 2;
      STATUS         at 0 range 3 .. 3;
      COUNT          at 0 range 4 .. 4;
      PATT           at 0 range 5 .. 5;
      WAVE           at 0 range 6 .. 6;
      PER            at 0 range 7 .. 7;
      CC             at 0 range 8 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  Fault A Source
   type FCTRLA_SRCSelect is
     (--  Fault input disabled
      DISABLE,
      --  MCEx (x=0,1) event input
      ENABLE,
      --  Inverted MCEx (x=0,1) event input
      INVERT,
      --  Alternate fault (A or B) state at the end of the previous period
      ALTFAULT)
     with Size => 2;
   for FCTRLA_SRCSelect use
     (DISABLE => 0,
      ENABLE => 1,
      INVERT => 2,
      ALTFAULT => 3);

   --  Fault A Blanking Mode
   type FCTRLA_BLANKSelect is
     (--  Blanking applied from start of the ramp
      START,
      --  Blanking applied from rising edge of the output waveform
      RISE,
      --  Blanking applied from falling edge of the output waveform
      FALL,
      --  Blanking applied from each toggle of the output waveform
      BOTH)
     with Size => 2;
   for FCTRLA_BLANKSelect use
     (START => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3);

   --  Fault A Halt Mode
   type FCTRLA_HALTSelect is
     (--  Halt action disabled
      DISABLE,
      --  Hardware halt action
      HW,
      --  Software halt action
      SW,
      --  Non-recoverable fault
      NR)
     with Size => 2;
   for FCTRLA_HALTSelect use
     (DISABLE => 0,
      HW => 1,
      SW => 2,
      NR => 3);

   --  Fault A Capture Channel
   type FCTRLA_CHSELSelect is
     (--  Capture value stored in channel 0
      CC0,
      --  Capture value stored in channel 1
      CC1,
      --  Capture value stored in channel 2
      CC2,
      --  Capture value stored in channel 3
      CC3)
     with Size => 2;
   for FCTRLA_CHSELSelect use
     (CC0 => 0,
      CC1 => 1,
      CC2 => 2,
      CC3 => 3);

   --  Fault A Capture Action
   type FCTRLA_CAPTURESelect is
     (--  No capture
      DISABLE,
      --  Capture on fault
      CAPT,
      --  Minimum capture
      CAPTMIN,
      --  Maximum capture
      CAPTMAX,
      --  Minimum local detection
      LOCMIN,
      --  Maximum local detection
      LOCMAX,
      --  Minimum and maximum local detection
      DERIV0,
      --  Capture with ramp index as MSB value
      CAPTMARK)
     with Size => 3;
   for FCTRLA_CAPTURESelect use
     (DISABLE => 0,
      CAPT => 1,
      CAPTMIN => 2,
      CAPTMAX => 3,
      LOCMIN => 4,
      LOCMAX => 5,
      DERIV0 => 6,
      CAPTMARK => 7);

   subtype TCC_FCTRLA_BLANKVAL_Field is HAL.UInt8;
   subtype TCC_FCTRLA_FILTERVAL_Field is HAL.UInt4;

   --  Recoverable Fault A Configuration
   type TCC_FCTRLA_Register is record
      --  Fault A Source
      SRC            : FCTRLA_SRCSelect := SAM_SVD.TCC.DISABLE;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  Fault A Keeper
      KEEP           : Boolean := False;
      --  Fault A Qualification
      QUAL           : Boolean := False;
      --  Fault A Blanking Mode
      BLANK          : FCTRLA_BLANKSelect := SAM_SVD.TCC.START;
      --  Fault A Restart
      RESTART        : Boolean := False;
      --  Fault A Halt Mode
      HALT           : FCTRLA_HALTSelect := SAM_SVD.TCC.DISABLE;
      --  Fault A Capture Channel
      CHSEL          : FCTRLA_CHSELSelect := SAM_SVD.TCC.CC0;
      --  Fault A Capture Action
      CAPTURE        : FCTRLA_CAPTURESelect := SAM_SVD.TCC.DISABLE;
      --  Fault A Blanking Prescaler
      BLANKPRESC     : Boolean := False;
      --  Fault A Blanking Time
      BLANKVAL       : TCC_FCTRLA_BLANKVAL_Field := 16#0#;
      --  Fault A Filter Value
      FILTERVAL      : TCC_FCTRLA_FILTERVAL_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_FCTRLA_Register use record
      SRC            at 0 range 0 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      KEEP           at 0 range 3 .. 3;
      QUAL           at 0 range 4 .. 4;
      BLANK          at 0 range 5 .. 6;
      RESTART        at 0 range 7 .. 7;
      HALT           at 0 range 8 .. 9;
      CHSEL          at 0 range 10 .. 11;
      CAPTURE        at 0 range 12 .. 14;
      BLANKPRESC     at 0 range 15 .. 15;
      BLANKVAL       at 0 range 16 .. 23;
      FILTERVAL      at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  Fault B Source
   type FCTRLB_SRCSelect is
     (--  Fault input disabled
      DISABLE,
      --  MCEx (x=0,1) event input
      ENABLE,
      --  Inverted MCEx (x=0,1) event input
      INVERT,
      --  Alternate fault (A or B) state at the end of the previous period
      ALTFAULT)
     with Size => 2;
   for FCTRLB_SRCSelect use
     (DISABLE => 0,
      ENABLE => 1,
      INVERT => 2,
      ALTFAULT => 3);

   --  Fault B Blanking Mode
   type FCTRLB_BLANKSelect is
     (--  Blanking applied from start of the ramp
      START,
      --  Blanking applied from rising edge of the output waveform
      RISE,
      --  Blanking applied from falling edge of the output waveform
      FALL,
      --  Blanking applied from each toggle of the output waveform
      BOTH)
     with Size => 2;
   for FCTRLB_BLANKSelect use
     (START => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3);

   --  Fault B Halt Mode
   type FCTRLB_HALTSelect is
     (--  Halt action disabled
      DISABLE,
      --  Hardware halt action
      HW,
      --  Software halt action
      SW,
      --  Non-recoverable fault
      NR)
     with Size => 2;
   for FCTRLB_HALTSelect use
     (DISABLE => 0,
      HW => 1,
      SW => 2,
      NR => 3);

   --  Fault B Capture Channel
   type FCTRLB_CHSELSelect is
     (--  Capture value stored in channel 0
      CC0,
      --  Capture value stored in channel 1
      CC1,
      --  Capture value stored in channel 2
      CC2,
      --  Capture value stored in channel 3
      CC3)
     with Size => 2;
   for FCTRLB_CHSELSelect use
     (CC0 => 0,
      CC1 => 1,
      CC2 => 2,
      CC3 => 3);

   --  Fault B Capture Action
   type FCTRLB_CAPTURESelect is
     (--  No capture
      DISABLE,
      --  Capture on fault
      CAPT,
      --  Minimum capture
      CAPTMIN,
      --  Maximum capture
      CAPTMAX,
      --  Minimum local detection
      LOCMIN,
      --  Maximum local detection
      LOCMAX,
      --  Minimum and maximum local detection
      DERIV0,
      --  Capture with ramp index as MSB value
      CAPTMARK)
     with Size => 3;
   for FCTRLB_CAPTURESelect use
     (DISABLE => 0,
      CAPT => 1,
      CAPTMIN => 2,
      CAPTMAX => 3,
      LOCMIN => 4,
      LOCMAX => 5,
      DERIV0 => 6,
      CAPTMARK => 7);

   subtype TCC_FCTRLB_BLANKVAL_Field is HAL.UInt8;
   subtype TCC_FCTRLB_FILTERVAL_Field is HAL.UInt4;

   --  Recoverable Fault B Configuration
   type TCC_FCTRLB_Register is record
      --  Fault B Source
      SRC            : FCTRLB_SRCSelect := SAM_SVD.TCC.DISABLE;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  Fault B Keeper
      KEEP           : Boolean := False;
      --  Fault B Qualification
      QUAL           : Boolean := False;
      --  Fault B Blanking Mode
      BLANK          : FCTRLB_BLANKSelect := SAM_SVD.TCC.START;
      --  Fault B Restart
      RESTART        : Boolean := False;
      --  Fault B Halt Mode
      HALT           : FCTRLB_HALTSelect := SAM_SVD.TCC.DISABLE;
      --  Fault B Capture Channel
      CHSEL          : FCTRLB_CHSELSelect := SAM_SVD.TCC.CC0;
      --  Fault B Capture Action
      CAPTURE        : FCTRLB_CAPTURESelect := SAM_SVD.TCC.DISABLE;
      --  Fault B Blanking Prescaler
      BLANKPRESC     : Boolean := False;
      --  Fault B Blanking Time
      BLANKVAL       : TCC_FCTRLB_BLANKVAL_Field := 16#0#;
      --  Fault B Filter Value
      FILTERVAL      : TCC_FCTRLB_FILTERVAL_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_FCTRLB_Register use record
      SRC            at 0 range 0 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      KEEP           at 0 range 3 .. 3;
      QUAL           at 0 range 4 .. 4;
      BLANK          at 0 range 5 .. 6;
      RESTART        at 0 range 7 .. 7;
      HALT           at 0 range 8 .. 9;
      CHSEL          at 0 range 10 .. 11;
      CAPTURE        at 0 range 12 .. 14;
      BLANKPRESC     at 0 range 15 .. 15;
      BLANKVAL       at 0 range 16 .. 23;
      FILTERVAL      at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype TCC_WEXCTRL_OTMX_Field is HAL.UInt2;

   --  TCC_WEXCTRL_DTIEN array
   type TCC_WEXCTRL_DTIEN_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for TCC_WEXCTRL_DTIEN
   type TCC_WEXCTRL_DTIEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DTIEN as a value
            Val : HAL.UInt4;
         when True =>
            --  DTIEN as an array
            Arr : TCC_WEXCTRL_DTIEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for TCC_WEXCTRL_DTIEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype TCC_WEXCTRL_DTLS_Field is HAL.UInt8;
   subtype TCC_WEXCTRL_DTHS_Field is HAL.UInt8;

   --  Waveform Extension Configuration
   type TCC_WEXCTRL_Register is record
      --  Output Matrix
      OTMX           : TCC_WEXCTRL_OTMX_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      --  Dead-time Insertion Generator 0 Enable
      DTIEN          : TCC_WEXCTRL_DTIEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Dead-time Low Side Outputs Value
      DTLS           : TCC_WEXCTRL_DTLS_Field := 16#0#;
      --  Dead-time High Side Outputs Value
      DTHS           : TCC_WEXCTRL_DTHS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_WEXCTRL_Register use record
      OTMX           at 0 range 0 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      DTIEN          at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DTLS           at 0 range 16 .. 23;
      DTHS           at 0 range 24 .. 31;
   end record;

   --  TCC_DRVCTRL_NRE array
   type TCC_DRVCTRL_NRE_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for TCC_DRVCTRL_NRE
   type TCC_DRVCTRL_NRE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  NRE as a value
            Val : HAL.UInt8;
         when True =>
            --  NRE as an array
            Arr : TCC_DRVCTRL_NRE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_DRVCTRL_NRE_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  TCC_DRVCTRL_NRV array
   type TCC_DRVCTRL_NRV_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for TCC_DRVCTRL_NRV
   type TCC_DRVCTRL_NRV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  NRV as a value
            Val : HAL.UInt8;
         when True =>
            --  NRV as an array
            Arr : TCC_DRVCTRL_NRV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_DRVCTRL_NRV_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  TCC_DRVCTRL_INVEN array
   type TCC_DRVCTRL_INVEN_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for TCC_DRVCTRL_INVEN
   type TCC_DRVCTRL_INVEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INVEN as a value
            Val : HAL.UInt8;
         when True =>
            --  INVEN as an array
            Arr : TCC_DRVCTRL_INVEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_DRVCTRL_INVEN_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  TCC_DRVCTRL_FILTERVAL array element
   subtype TCC_DRVCTRL_FILTERVAL_Element is HAL.UInt4;

   --  TCC_DRVCTRL_FILTERVAL array
   type TCC_DRVCTRL_FILTERVAL_Field_Array is array (0 .. 1)
     of TCC_DRVCTRL_FILTERVAL_Element
     with Component_Size => 4, Size => 8;

   --  Type definition for TCC_DRVCTRL_FILTERVAL
   type TCC_DRVCTRL_FILTERVAL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FILTERVAL as a value
            Val : HAL.UInt8;
         when True =>
            --  FILTERVAL as an array
            Arr : TCC_DRVCTRL_FILTERVAL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_DRVCTRL_FILTERVAL_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Driver Control
   type TCC_DRVCTRL_Register is record
      --  Non-Recoverable State 0 Output Enable
      NRE       : TCC_DRVCTRL_NRE_Field := (As_Array => False, Val => 16#0#);
      --  Non-Recoverable State 0 Output Value
      NRV       : TCC_DRVCTRL_NRV_Field := (As_Array => False, Val => 16#0#);
      --  Output Waveform 0 Inversion
      INVEN     : TCC_DRVCTRL_INVEN_Field :=
                   (As_Array => False, Val => 16#0#);
      --  Non-Recoverable Fault Input 0 Filter Value
      FILTERVAL : TCC_DRVCTRL_FILTERVAL_Field :=
                   (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_DRVCTRL_Register use record
      NRE       at 0 range 0 .. 7;
      NRV       at 0 range 8 .. 15;
      INVEN     at 0 range 16 .. 23;
      FILTERVAL at 0 range 24 .. 31;
   end record;

   --  Debug Control
   type TCC_DBGCTRL_Register is record
      --  Debug Running Mode
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_1 : HAL.Bit := 16#0#;
      --  Fault Detection on Debug Break Detection
      FDDBD        : Boolean := False;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TCC_DBGCTRL_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      FDDBD        at 0 range 2 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Timer/counter Input Event0 Action
   type EVCTRL_EVACT0Select is
     (--  Event action disabled
      OFF,
      --  Start, restart or re-trigger counter on event
      RETRIGGER,
      --  Count on event
      COUNTEV,
      --  Start counter on event
      START,
      --  Increment counter on event
      INC,
      --  Count on active state of asynchronous event
      COUNT,
      --  Stamp capture
      STAMP,
      --  Non-recoverable fault
      FAULT)
     with Size => 3;
   for EVCTRL_EVACT0Select use
     (OFF => 0,
      RETRIGGER => 1,
      COUNTEV => 2,
      START => 3,
      INC => 4,
      COUNT => 5,
      STAMP => 6,
      FAULT => 7);

   --  Timer/counter Input Event1 Action
   type EVCTRL_EVACT1Select is
     (--  Event action disabled
      OFF,
      --  Re-trigger counter on event
      RETRIGGER,
      --  Direction control
      DIR,
      --  Stop counter on event
      STOP,
      --  Decrement counter on event
      DEC,
      --  Period capture value in CC0 register, pulse width capture value in CC1
--  register
      PPW,
      --  Period capture value in CC1 register, pulse width capture value in CC0
--  register
      PWP,
      --  Non-recoverable fault
      FAULT)
     with Size => 3;
   for EVCTRL_EVACT1Select use
     (OFF => 0,
      RETRIGGER => 1,
      DIR => 2,
      STOP => 3,
      DEC => 4,
      PPW => 5,
      PWP => 6,
      FAULT => 7);

   --  Timer/counter Output Event Mode
   type EVCTRL_CNTSELSelect is
     (--  An interrupt/event is generated when a new counter cycle starts
      START,
      --  An interrupt/event is generated when a counter cycle ends
      END_k,
      --  An interrupt/event is generated when a counter cycle ends, except for the
--  first and last cycles
      BETWEEN,
      --  An interrupt/event is generated when a new counter cycle starts or a
--  counter cycle ends
      BOUNDARY)
     with Size => 2;
   for EVCTRL_CNTSELSelect use
     (START => 0,
      END_k => 1,
      BETWEEN => 2,
      BOUNDARY => 3);

   --  TCC_EVCTRL_TCINV array
   type TCC_EVCTRL_TCINV_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TCC_EVCTRL_TCINV
   type TCC_EVCTRL_TCINV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TCINV as a value
            Val : HAL.UInt2;
         when True =>
            --  TCINV as an array
            Arr : TCC_EVCTRL_TCINV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TCC_EVCTRL_TCINV_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TCC_EVCTRL_TCEI array
   type TCC_EVCTRL_TCEI_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TCC_EVCTRL_TCEI
   type TCC_EVCTRL_TCEI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TCEI as a value
            Val : HAL.UInt2;
         when True =>
            --  TCEI as an array
            Arr : TCC_EVCTRL_TCEI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TCC_EVCTRL_TCEI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TCC_EVCTRL_MCEI array
   type TCC_EVCTRL_MCEI_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_EVCTRL_MCEI
   type TCC_EVCTRL_MCEI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MCEI as a value
            Val : HAL.UInt6;
         when True =>
            --  MCEI as an array
            Arr : TCC_EVCTRL_MCEI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_EVCTRL_MCEI_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  TCC_EVCTRL_MCEO array
   type TCC_EVCTRL_MCEO_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_EVCTRL_MCEO
   type TCC_EVCTRL_MCEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MCEO as a value
            Val : HAL.UInt6;
         when True =>
            --  MCEO as an array
            Arr : TCC_EVCTRL_MCEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_EVCTRL_MCEO_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Event Control
   type TCC_EVCTRL_Register is record
      --  Timer/counter Input Event0 Action
      EVACT0         : EVCTRL_EVACT0Select := SAM_SVD.TCC.OFF;
      --  Timer/counter Input Event1 Action
      EVACT1         : EVCTRL_EVACT1Select := SAM_SVD.TCC.OFF;
      --  Timer/counter Output Event Mode
      CNTSEL         : EVCTRL_CNTSELSelect := SAM_SVD.TCC.START;
      --  Overflow/Underflow Output Event Enable
      OVFEO          : Boolean := False;
      --  Retrigger Output Event Enable
      TRGEO          : Boolean := False;
      --  Timer/counter Output Event Enable
      CNTEO          : Boolean := False;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Inverted Event 0 Input Enable
      TCINV          : TCC_EVCTRL_TCINV_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Timer/counter Event 0 Input Enable
      TCEI           : TCC_EVCTRL_TCEI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Match or Capture Channel 0 Event Input Enable
      MCEI           : TCC_EVCTRL_MCEI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Match or Capture Channel 0 Event Output Enable
      MCEO           : TCC_EVCTRL_MCEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_EVCTRL_Register use record
      EVACT0         at 0 range 0 .. 2;
      EVACT1         at 0 range 3 .. 5;
      CNTSEL         at 0 range 6 .. 7;
      OVFEO          at 0 range 8 .. 8;
      TRGEO          at 0 range 9 .. 9;
      CNTEO          at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      TCINV          at 0 range 12 .. 13;
      TCEI           at 0 range 14 .. 15;
      MCEI           at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      MCEO           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  TCC_INTENCLR_FAULT array
   type TCC_INTENCLR_FAULT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TCC_INTENCLR_FAULT
   type TCC_INTENCLR_FAULT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FAULT as a value
            Val : HAL.UInt2;
         when True =>
            --  FAULT as an array
            Arr : TCC_INTENCLR_FAULT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TCC_INTENCLR_FAULT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TCC_INTENCLR_MC array
   type TCC_INTENCLR_MC_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_INTENCLR_MC
   type TCC_INTENCLR_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt6;
         when True =>
            --  MC as an array
            Arr : TCC_INTENCLR_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_INTENCLR_MC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Interrupt Enable Clear
   type TCC_INTENCLR_Register is record
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
      --  Retrigger Interrupt Enable
      TRG            : Boolean := False;
      --  Counter Interrupt Enable
      CNT            : Boolean := False;
      --  Error Interrupt Enable
      ERR            : Boolean := False;
      --  unspecified
      Reserved_4_9   : HAL.UInt6 := 16#0#;
      --  Non-Recoverable Update Fault Interrupt Enable
      UFS            : Boolean := False;
      --  Non-Recoverable Debug Fault Interrupt Enable
      DFS            : Boolean := False;
      --  Recoverable Fault A Interrupt Enable
      FAULTA         : Boolean := False;
      --  Recoverable Fault B Interrupt Enable
      FAULTB         : Boolean := False;
      --  Non-Recoverable Fault 0 Interrupt Enable
      FAULT          : TCC_INTENCLR_FAULT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Match or Capture Channel 0 Interrupt Enable
      MC             : TCC_INTENCLR_MC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_INTENCLR_Register use record
      OVF            at 0 range 0 .. 0;
      TRG            at 0 range 1 .. 1;
      CNT            at 0 range 2 .. 2;
      ERR            at 0 range 3 .. 3;
      Reserved_4_9   at 0 range 4 .. 9;
      UFS            at 0 range 10 .. 10;
      DFS            at 0 range 11 .. 11;
      FAULTA         at 0 range 12 .. 12;
      FAULTB         at 0 range 13 .. 13;
      FAULT          at 0 range 14 .. 15;
      MC             at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  TCC_INTENSET_FAULT array
   type TCC_INTENSET_FAULT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TCC_INTENSET_FAULT
   type TCC_INTENSET_FAULT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FAULT as a value
            Val : HAL.UInt2;
         when True =>
            --  FAULT as an array
            Arr : TCC_INTENSET_FAULT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TCC_INTENSET_FAULT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TCC_INTENSET_MC array
   type TCC_INTENSET_MC_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_INTENSET_MC
   type TCC_INTENSET_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt6;
         when True =>
            --  MC as an array
            Arr : TCC_INTENSET_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_INTENSET_MC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Interrupt Enable Set
   type TCC_INTENSET_Register is record
      --  Overflow Interrupt Enable
      OVF            : Boolean := False;
      --  Retrigger Interrupt Enable
      TRG            : Boolean := False;
      --  Counter Interrupt Enable
      CNT            : Boolean := False;
      --  Error Interrupt Enable
      ERR            : Boolean := False;
      --  unspecified
      Reserved_4_9   : HAL.UInt6 := 16#0#;
      --  Non-Recoverable Update Fault Interrupt Enable
      UFS            : Boolean := False;
      --  Non-Recoverable Debug Fault Interrupt Enable
      DFS            : Boolean := False;
      --  Recoverable Fault A Interrupt Enable
      FAULTA         : Boolean := False;
      --  Recoverable Fault B Interrupt Enable
      FAULTB         : Boolean := False;
      --  Non-Recoverable Fault 0 Interrupt Enable
      FAULT          : TCC_INTENSET_FAULT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Match or Capture Channel 0 Interrupt Enable
      MC             : TCC_INTENSET_MC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_INTENSET_Register use record
      OVF            at 0 range 0 .. 0;
      TRG            at 0 range 1 .. 1;
      CNT            at 0 range 2 .. 2;
      ERR            at 0 range 3 .. 3;
      Reserved_4_9   at 0 range 4 .. 9;
      UFS            at 0 range 10 .. 10;
      DFS            at 0 range 11 .. 11;
      FAULTA         at 0 range 12 .. 12;
      FAULTB         at 0 range 13 .. 13;
      FAULT          at 0 range 14 .. 15;
      MC             at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  TCC_INTFLAG_FAULT array
   type TCC_INTFLAG_FAULT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TCC_INTFLAG_FAULT
   type TCC_INTFLAG_FAULT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FAULT as a value
            Val : HAL.UInt2;
         when True =>
            --  FAULT as an array
            Arr : TCC_INTFLAG_FAULT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TCC_INTFLAG_FAULT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TCC_INTFLAG_MC array
   type TCC_INTFLAG_MC_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_INTFLAG_MC
   type TCC_INTFLAG_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt6;
         when True =>
            --  MC as an array
            Arr : TCC_INTFLAG_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_INTFLAG_MC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Interrupt Flag Status and Clear
   type TCC_INTFLAG_Register is record
      --  Overflow
      OVF            : Boolean := False;
      --  Retrigger
      TRG            : Boolean := False;
      --  Counter
      CNT            : Boolean := False;
      --  Error
      ERR            : Boolean := False;
      --  unspecified
      Reserved_4_9   : HAL.UInt6 := 16#0#;
      --  Non-Recoverable Update Fault
      UFS            : Boolean := False;
      --  Non-Recoverable Debug Fault
      DFS            : Boolean := False;
      --  Recoverable Fault A
      FAULTA         : Boolean := False;
      --  Recoverable Fault B
      FAULTB         : Boolean := False;
      --  Non-Recoverable Fault 0
      FAULT          : TCC_INTFLAG_FAULT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Match or Capture 0
      MC             : TCC_INTFLAG_MC_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_INTFLAG_Register use record
      OVF            at 0 range 0 .. 0;
      TRG            at 0 range 1 .. 1;
      CNT            at 0 range 2 .. 2;
      ERR            at 0 range 3 .. 3;
      Reserved_4_9   at 0 range 4 .. 9;
      UFS            at 0 range 10 .. 10;
      DFS            at 0 range 11 .. 11;
      FAULTA         at 0 range 12 .. 12;
      FAULTB         at 0 range 13 .. 13;
      FAULT          at 0 range 14 .. 15;
      MC             at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  TCC_STATUS_FAULT array
   type TCC_STATUS_FAULT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TCC_STATUS_FAULT
   type TCC_STATUS_FAULT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FAULT as a value
            Val : HAL.UInt2;
         when True =>
            --  FAULT as an array
            Arr : TCC_STATUS_FAULT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TCC_STATUS_FAULT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TCC_STATUS_CCBUFV array
   type TCC_STATUS_CCBUFV_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_STATUS_CCBUFV
   type TCC_STATUS_CCBUFV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CCBUFV as a value
            Val : HAL.UInt6;
         when True =>
            --  CCBUFV as an array
            Arr : TCC_STATUS_CCBUFV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_STATUS_CCBUFV_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  TCC_STATUS_CMP array
   type TCC_STATUS_CMP_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_STATUS_CMP
   type TCC_STATUS_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : HAL.UInt6;
         when True =>
            --  CMP as an array
            Arr : TCC_STATUS_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_STATUS_CMP_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Status
   type TCC_STATUS_Register is record
      --  Stop
      STOP           : Boolean := True;
      --  Ramp
      IDX            : Boolean := False;
      --  Non-recoverable Update Fault State
      UFS            : Boolean := False;
      --  Non-Recoverable Debug Fault State
      DFS            : Boolean := False;
      --  Slave
      SLAVE          : Boolean := False;
      --  Pattern Buffer Valid
      PATTBUFV       : Boolean := False;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  Period Buffer Valid
      PERBUFV        : Boolean := False;
      --  Recoverable Fault A Input
      FAULTAIN       : Boolean := False;
      --  Recoverable Fault B Input
      FAULTBIN       : Boolean := False;
      --  Non-Recoverable Fault0 Input
      FAULT0IN       : Boolean := False;
      --  Non-Recoverable Fault1 Input
      FAULT1IN       : Boolean := False;
      --  Recoverable Fault A State
      FAULTA         : Boolean := False;
      --  Recoverable Fault B State
      FAULTB         : Boolean := False;
      --  Non-Recoverable Fault 0 State
      FAULT          : TCC_STATUS_FAULT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare Channel 0 Buffer Valid
      CCBUFV         : TCC_STATUS_CCBUFV_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Compare Channel 0 Value
      CMP            : TCC_STATUS_CMP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_STATUS_Register use record
      STOP           at 0 range 0 .. 0;
      IDX            at 0 range 1 .. 1;
      UFS            at 0 range 2 .. 2;
      DFS            at 0 range 3 .. 3;
      SLAVE          at 0 range 4 .. 4;
      PATTBUFV       at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      PERBUFV        at 0 range 7 .. 7;
      FAULTAIN       at 0 range 8 .. 8;
      FAULTBIN       at 0 range 9 .. 9;
      FAULT0IN       at 0 range 10 .. 10;
      FAULT1IN       at 0 range 11 .. 11;
      FAULTA         at 0 range 12 .. 12;
      FAULTB         at 0 range 13 .. 13;
      FAULT          at 0 range 14 .. 15;
      CCBUFV         at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      CMP            at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype TCC_COUNT_COUNT_Field is HAL.UInt24;

   --  Count
   type TCC_COUNT_Register is record
      --  Counter Value
      COUNT          : TCC_COUNT_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_COUNT_Register use record
      COUNT          at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_COUNT_DITH4_MODE_COUNT_Field is HAL.UInt20;

   --  Count
   type TCC_COUNT_DITH4_MODE_Register is record
      --  unspecified
      Reserved_0_3   : HAL.UInt4 := 16#0#;
      --  Counter Value
      COUNT          : TCC_COUNT_DITH4_MODE_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_COUNT_DITH4_MODE_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      COUNT          at 0 range 4 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_COUNT_DITH5_MODE_COUNT_Field is HAL.UInt19;

   --  Count
   type TCC_COUNT_DITH5_MODE_Register is record
      --  unspecified
      Reserved_0_4   : HAL.UInt5 := 16#0#;
      --  Counter Value
      COUNT          : TCC_COUNT_DITH5_MODE_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_COUNT_DITH5_MODE_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      COUNT          at 0 range 5 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_COUNT_DITH6_MODE_COUNT_Field is HAL.UInt18;

   --  Count
   type TCC_COUNT_DITH6_MODE_Register is record
      --  unspecified
      Reserved_0_5   : HAL.UInt6 := 16#0#;
      --  Counter Value
      COUNT          : TCC_COUNT_DITH6_MODE_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_COUNT_DITH6_MODE_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      COUNT          at 0 range 6 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  TCC_PATT_PGE array
   type TCC_PATT_PGE_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for TCC_PATT_PGE
   type TCC_PATT_PGE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PGE as a value
            Val : HAL.UInt8;
         when True =>
            --  PGE as an array
            Arr : TCC_PATT_PGE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_PATT_PGE_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  TCC_PATT_PGV array
   type TCC_PATT_PGV_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for TCC_PATT_PGV
   type TCC_PATT_PGV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PGV as a value
            Val : HAL.UInt8;
         when True =>
            --  PGV as an array
            Arr : TCC_PATT_PGV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_PATT_PGV_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Pattern
   type TCC_PATT_Register is record
      --  Pattern Generator 0 Output Enable
      PGE : TCC_PATT_PGE_Field := (As_Array => False, Val => 16#0#);
      --  Pattern Generator 0 Output Value
      PGV : TCC_PATT_PGV_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCC_PATT_Register use record
      PGE at 0 range 0 .. 7;
      PGV at 0 range 8 .. 15;
   end record;

   --  Waveform Generation
   type WAVE_WAVEGENSelect is
     (--  Normal frequency
      NFRQ,
      --  Match frequency
      MFRQ,
      --  Normal PWM
      NPWM,
      --  Dual-slope critical
      DSCRITICAL,
      --  Dual-slope with interrupt/event condition when COUNT reaches ZERO
      DSBOTTOM,
      --  Dual-slope with interrupt/event condition when COUNT reaches ZERO or TOP
      DSBOTH,
      --  Dual-slope with interrupt/event condition when COUNT reaches TOP
      DSTOP)
     with Size => 3;
   for WAVE_WAVEGENSelect use
     (NFRQ => 0,
      MFRQ => 1,
      NPWM => 2,
      DSCRITICAL => 4,
      DSBOTTOM => 5,
      DSBOTH => 6,
      DSTOP => 7);

   --  Ramp Mode
   type WAVE_RAMPSelect is
     (--  RAMP1 operation
      RAMP1,
      --  Alternative RAMP2 operation
      RAMP2A,
      --  RAMP2 operation
      RAMP2,
      --  Critical RAMP2 operation
      RAMP2C)
     with Size => 2;
   for WAVE_RAMPSelect use
     (RAMP1 => 0,
      RAMP2A => 1,
      RAMP2 => 2,
      RAMP2C => 3);

   --  TCC_WAVE_CICCEN array
   type TCC_WAVE_CICCEN_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for TCC_WAVE_CICCEN
   type TCC_WAVE_CICCEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CICCEN as a value
            Val : HAL.UInt4;
         when True =>
            --  CICCEN as an array
            Arr : TCC_WAVE_CICCEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for TCC_WAVE_CICCEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  TCC_WAVE_POL array
   type TCC_WAVE_POL_Field_Array is array (0 .. 5) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for TCC_WAVE_POL
   type TCC_WAVE_POL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  POL as a value
            Val : HAL.UInt6;
         when True =>
            --  POL as an array
            Arr : TCC_WAVE_POL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for TCC_WAVE_POL_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  TCC_WAVE_SWAP array
   type TCC_WAVE_SWAP_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for TCC_WAVE_SWAP
   type TCC_WAVE_SWAP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWAP as a value
            Val : HAL.UInt4;
         when True =>
            --  SWAP as an array
            Arr : TCC_WAVE_SWAP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for TCC_WAVE_SWAP_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Waveform Control
   type TCC_WAVE_Register is record
      --  Waveform Generation
      WAVEGEN        : WAVE_WAVEGENSelect := SAM_SVD.TCC.NFRQ;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Ramp Mode
      RAMP           : WAVE_RAMPSelect := SAM_SVD.TCC.RAMP1;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  Circular period Enable
      CIPEREN        : Boolean := False;
      --  Circular Channel 0 Enable
      CICCEN         : TCC_WAVE_CICCEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Channel 0 Polarity
      POL            : TCC_WAVE_POL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Swap DTI Output Pair 0
      SWAP           : TCC_WAVE_SWAP_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_WAVE_Register use record
      WAVEGEN        at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      RAMP           at 0 range 4 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      CIPEREN        at 0 range 7 .. 7;
      CICCEN         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      POL            at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      SWAP           at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype TCC_PER_PER_Field is HAL.UInt24;

   --  Period
   type TCC_PER_Register is record
      --  Period Value
      PER            : TCC_PER_PER_Field := 16#FFFFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PER_Register use record
      PER            at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_PER_DITH4_MODE_DITHER_Field is HAL.UInt4;
   subtype TCC_PER_DITH4_MODE_PER_Field is HAL.UInt20;

   --  Period
   type TCC_PER_DITH4_MODE_Register is record
      --  Dithering Cycle Number
      DITHER         : TCC_PER_DITH4_MODE_DITHER_Field := 16#F#;
      --  Period Value
      PER            : TCC_PER_DITH4_MODE_PER_Field := 16#FFFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PER_DITH4_MODE_Register use record
      DITHER         at 0 range 0 .. 3;
      PER            at 0 range 4 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_PER_DITH5_MODE_DITHER_Field is HAL.UInt5;
   subtype TCC_PER_DITH5_MODE_PER_Field is HAL.UInt19;

   --  Period
   type TCC_PER_DITH5_MODE_Register is record
      --  Dithering Cycle Number
      DITHER         : TCC_PER_DITH5_MODE_DITHER_Field := 16#1F#;
      --  Period Value
      PER            : TCC_PER_DITH5_MODE_PER_Field := 16#7FFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PER_DITH5_MODE_Register use record
      DITHER         at 0 range 0 .. 4;
      PER            at 0 range 5 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_PER_DITH6_MODE_DITHER_Field is HAL.UInt6;
   subtype TCC_PER_DITH6_MODE_PER_Field is HAL.UInt18;

   --  Period
   type TCC_PER_DITH6_MODE_Register is record
      --  Dithering Cycle Number
      DITHER         : TCC_PER_DITH6_MODE_DITHER_Field := 16#3F#;
      --  Period Value
      PER            : TCC_PER_DITH6_MODE_PER_Field := 16#3FFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PER_DITH6_MODE_Register use record
      DITHER         at 0 range 0 .. 5;
      PER            at 0 range 6 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_CC_CC_Field is HAL.UInt24;

   --  Compare and Capture
   type TCC_CC_Register is record
      --  Channel Compare/Capture Value
      CC             : TCC_CC_CC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CC_Register use record
      CC             at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture
   type TCC_CC_Registers is array (0 .. 5) of TCC_CC_Register;

   subtype TCC_CC_DITH4_MODE_DITHER_Field is HAL.UInt4;
   subtype TCC_CC_DITH4_MODE_CC_Field is HAL.UInt20;

   --  Compare and Capture
   type TCC_CC_DITH4_MODE_Register is record
      --  Dithering Cycle Number
      DITHER         : TCC_CC_DITH4_MODE_DITHER_Field := 16#0#;
      --  Channel Compare/Capture Value
      CC             : TCC_CC_DITH4_MODE_CC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CC_DITH4_MODE_Register use record
      DITHER         at 0 range 0 .. 3;
      CC             at 0 range 4 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture
   type TCC_CC_DITH4_MODE_Registers is array (0 .. 5)
     of TCC_CC_DITH4_MODE_Register;

   subtype TCC_CC_DITH5_MODE_DITHER_Field is HAL.UInt5;
   subtype TCC_CC_DITH5_MODE_CC_Field is HAL.UInt19;

   --  Compare and Capture
   type TCC_CC_DITH5_MODE_Register is record
      --  Dithering Cycle Number
      DITHER         : TCC_CC_DITH5_MODE_DITHER_Field := 16#0#;
      --  Channel Compare/Capture Value
      CC             : TCC_CC_DITH5_MODE_CC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CC_DITH5_MODE_Register use record
      DITHER         at 0 range 0 .. 4;
      CC             at 0 range 5 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture
   type TCC_CC_DITH5_MODE_Registers is array (0 .. 5)
     of TCC_CC_DITH5_MODE_Register;

   subtype TCC_CC_DITH6_MODE_DITHER_Field is HAL.UInt6;
   subtype TCC_CC_DITH6_MODE_CC_Field is HAL.UInt18;

   --  Compare and Capture
   type TCC_CC_DITH6_MODE_Register is record
      --  Dithering Cycle Number
      DITHER         : TCC_CC_DITH6_MODE_DITHER_Field := 16#0#;
      --  Channel Compare/Capture Value
      CC             : TCC_CC_DITH6_MODE_CC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CC_DITH6_MODE_Register use record
      DITHER         at 0 range 0 .. 5;
      CC             at 0 range 6 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture
   type TCC_CC_DITH6_MODE_Registers is array (0 .. 5)
     of TCC_CC_DITH6_MODE_Register;

   --  TCC_PATTBUF_PGEB array
   type TCC_PATTBUF_PGEB_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for TCC_PATTBUF_PGEB
   type TCC_PATTBUF_PGEB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PGEB as a value
            Val : HAL.UInt8;
         when True =>
            --  PGEB as an array
            Arr : TCC_PATTBUF_PGEB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_PATTBUF_PGEB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  TCC_PATTBUF_PGVB array
   type TCC_PATTBUF_PGVB_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for TCC_PATTBUF_PGVB
   type TCC_PATTBUF_PGVB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PGVB as a value
            Val : HAL.UInt8;
         when True =>
            --  PGVB as an array
            Arr : TCC_PATTBUF_PGVB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for TCC_PATTBUF_PGVB_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Pattern Buffer
   type TCC_PATTBUF_Register is record
      --  Pattern Generator 0 Output Enable Buffer
      PGEB : TCC_PATTBUF_PGEB_Field := (As_Array => False, Val => 16#0#);
      --  Pattern Generator 0 Output Enable
      PGVB : TCC_PATTBUF_PGVB_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for TCC_PATTBUF_Register use record
      PGEB at 0 range 0 .. 7;
      PGVB at 0 range 8 .. 15;
   end record;

   subtype TCC_PERBUF_PERBUF_Field is HAL.UInt24;

   --  Period Buffer
   type TCC_PERBUF_Register is record
      --  Period Buffer Value
      PERBUF         : TCC_PERBUF_PERBUF_Field := 16#FFFFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PERBUF_Register use record
      PERBUF         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_PERBUF_DITH4_MODE_DITHERBUF_Field is HAL.UInt4;
   subtype TCC_PERBUF_DITH4_MODE_PERBUF_Field is HAL.UInt20;

   --  Period Buffer
   type TCC_PERBUF_DITH4_MODE_Register is record
      --  Dithering Buffer Cycle Number
      DITHERBUF      : TCC_PERBUF_DITH4_MODE_DITHERBUF_Field := 16#F#;
      --  Period Buffer Value
      PERBUF         : TCC_PERBUF_DITH4_MODE_PERBUF_Field := 16#FFFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PERBUF_DITH4_MODE_Register use record
      DITHERBUF      at 0 range 0 .. 3;
      PERBUF         at 0 range 4 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_PERBUF_DITH5_MODE_DITHERBUF_Field is HAL.UInt5;
   subtype TCC_PERBUF_DITH5_MODE_PERBUF_Field is HAL.UInt19;

   --  Period Buffer
   type TCC_PERBUF_DITH5_MODE_Register is record
      --  Dithering Buffer Cycle Number
      DITHERBUF      : TCC_PERBUF_DITH5_MODE_DITHERBUF_Field := 16#1F#;
      --  Period Buffer Value
      PERBUF         : TCC_PERBUF_DITH5_MODE_PERBUF_Field := 16#7FFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PERBUF_DITH5_MODE_Register use record
      DITHERBUF      at 0 range 0 .. 4;
      PERBUF         at 0 range 5 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_PERBUF_DITH6_MODE_DITHERBUF_Field is HAL.UInt6;
   subtype TCC_PERBUF_DITH6_MODE_PERBUF_Field is HAL.UInt18;

   --  Period Buffer
   type TCC_PERBUF_DITH6_MODE_Register is record
      --  Dithering Buffer Cycle Number
      DITHERBUF      : TCC_PERBUF_DITH6_MODE_DITHERBUF_Field := 16#3F#;
      --  Period Buffer Value
      PERBUF         : TCC_PERBUF_DITH6_MODE_PERBUF_Field := 16#3FFFF#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#FF#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_PERBUF_DITH6_MODE_Register use record
      DITHERBUF      at 0 range 0 .. 5;
      PERBUF         at 0 range 6 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TCC_CCBUF_CCBUF_Field is HAL.UInt24;

   --  Compare and Capture Buffer
   type TCC_CCBUF_Register is record
      --  Channel Compare/Capture Buffer Value
      CCBUF          : TCC_CCBUF_CCBUF_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CCBUF_Register use record
      CCBUF          at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture Buffer
   type TCC_CCBUF_Registers is array (0 .. 5) of TCC_CCBUF_Register;

   subtype TCC_CCBUF_DITH4_MODE_CCBUF_Field is HAL.UInt4;
   subtype TCC_CCBUF_DITH4_MODE_DITHERBUF_Field is HAL.UInt20;

   --  Compare and Capture Buffer
   type TCC_CCBUF_DITH4_MODE_Register is record
      --  Channel Compare/Capture Buffer Value
      CCBUF          : TCC_CCBUF_DITH4_MODE_CCBUF_Field := 16#0#;
      --  Dithering Buffer Cycle Number
      DITHERBUF      : TCC_CCBUF_DITH4_MODE_DITHERBUF_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CCBUF_DITH4_MODE_Register use record
      CCBUF          at 0 range 0 .. 3;
      DITHERBUF      at 0 range 4 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture Buffer
   type TCC_CCBUF_DITH4_MODE_Registers is array (0 .. 5)
     of TCC_CCBUF_DITH4_MODE_Register;

   subtype TCC_CCBUF_DITH5_MODE_DITHERBUF_Field is HAL.UInt5;
   subtype TCC_CCBUF_DITH5_MODE_CCBUF_Field is HAL.UInt19;

   --  Compare and Capture Buffer
   type TCC_CCBUF_DITH5_MODE_Register is record
      --  Dithering Buffer Cycle Number
      DITHERBUF      : TCC_CCBUF_DITH5_MODE_DITHERBUF_Field := 16#0#;
      --  Channel Compare/Capture Buffer Value
      CCBUF          : TCC_CCBUF_DITH5_MODE_CCBUF_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CCBUF_DITH5_MODE_Register use record
      DITHERBUF      at 0 range 0 .. 4;
      CCBUF          at 0 range 5 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture Buffer
   type TCC_CCBUF_DITH5_MODE_Registers is array (0 .. 5)
     of TCC_CCBUF_DITH5_MODE_Register;

   subtype TCC_CCBUF_DITH6_MODE_DITHERBUF_Field is HAL.UInt6;
   subtype TCC_CCBUF_DITH6_MODE_CCBUF_Field is HAL.UInt18;

   --  Compare and Capture Buffer
   type TCC_CCBUF_DITH6_MODE_Register is record
      --  Dithering Buffer Cycle Number
      DITHERBUF      : TCC_CCBUF_DITH6_MODE_DITHERBUF_Field := 16#0#;
      --  Channel Compare/Capture Buffer Value
      CCBUF          : TCC_CCBUF_DITH6_MODE_CCBUF_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCC_CCBUF_DITH6_MODE_Register use record
      DITHERBUF      at 0 range 0 .. 5;
      CCBUF          at 0 range 6 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Compare and Capture Buffer
   type TCC_CCBUF_DITH6_MODE_Registers is array (0 .. 5)
     of TCC_CCBUF_DITH6_MODE_Register;

   -----------------
   -- Peripherals --
   -----------------

   type TCC0_Disc is
     (Default,
      DITH4_MODE,
      DITH5_MODE,
      DITH6_MODE);

   --  Timer Counter Control
   type TCC_Peripheral
     (Discriminent : TCC0_Disc := Default)
   is record
      --  Control A
      CTRLA             : aliased TCC_CTRLA_Register;
      --  Control B Clear
      CTRLBCLR          : aliased TCC_CTRLBCLR_Register;
      --  Control B Set
      CTRLBSET          : aliased TCC_CTRLBSET_Register;
      --  Synchronization Busy
      SYNCBUSY          : aliased TCC_SYNCBUSY_Register;
      --  Recoverable Fault A Configuration
      FCTRLA            : aliased TCC_FCTRLA_Register;
      --  Recoverable Fault B Configuration
      FCTRLB            : aliased TCC_FCTRLB_Register;
      --  Waveform Extension Configuration
      WEXCTRL           : aliased TCC_WEXCTRL_Register;
      --  Driver Control
      DRVCTRL           : aliased TCC_DRVCTRL_Register;
      --  Debug Control
      DBGCTRL           : aliased TCC_DBGCTRL_Register;
      --  Event Control
      EVCTRL            : aliased TCC_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR          : aliased TCC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET          : aliased TCC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG           : aliased TCC_INTFLAG_Register;
      --  Status
      STATUS            : aliased TCC_STATUS_Register;
      --  Pattern
      PATT              : aliased TCC_PATT_Register;
      --  Waveform Control
      WAVE              : aliased TCC_WAVE_Register;
      --  Pattern Buffer
      PATTBUF           : aliased TCC_PATTBUF_Register;
      case Discriminent is
         when Default =>
            --  Count
            COUNT : aliased TCC_COUNT_Register;
            --  Period
            PER : aliased TCC_PER_Register;
            --  Compare and Capture
            CC : aliased TCC_CC_Registers;
            --  Period Buffer
            PERBUF : aliased TCC_PERBUF_Register;
            --  Compare and Capture Buffer
            CCBUF : aliased TCC_CCBUF_Registers;
         when DITH4_MODE =>
            --  Count
            COUNT_DITH4_MODE : aliased TCC_COUNT_DITH4_MODE_Register;
            --  Period
            PER_DITH4_MODE : aliased TCC_PER_DITH4_MODE_Register;
            --  Compare and Capture
            CC_DITH4_MODE : aliased TCC_CC_DITH4_MODE_Registers;
            --  Period Buffer
            PERBUF_DITH4_MODE : aliased TCC_PERBUF_DITH4_MODE_Register;
            --  Compare and Capture Buffer
            CCBUF_DITH4_MODE : aliased TCC_CCBUF_DITH4_MODE_Registers;
         when DITH5_MODE =>
            --  Count
            COUNT_DITH5_MODE : aliased TCC_COUNT_DITH5_MODE_Register;
            --  Period
            PER_DITH5_MODE : aliased TCC_PER_DITH5_MODE_Register;
            --  Compare and Capture
            CC_DITH5_MODE : aliased TCC_CC_DITH5_MODE_Registers;
            --  Period Buffer
            PERBUF_DITH5_MODE : aliased TCC_PERBUF_DITH5_MODE_Register;
            --  Compare and Capture Buffer
            CCBUF_DITH5_MODE : aliased TCC_CCBUF_DITH5_MODE_Registers;
         when DITH6_MODE =>
            --  Count
            COUNT_DITH6_MODE : aliased TCC_COUNT_DITH6_MODE_Register;
            --  Period
            PER_DITH6_MODE : aliased TCC_PER_DITH6_MODE_Register;
            --  Compare and Capture
            CC_DITH6_MODE : aliased TCC_CC_DITH6_MODE_Registers;
            --  Period Buffer
            PERBUF_DITH6_MODE : aliased TCC_PERBUF_DITH6_MODE_Register;
            --  Compare and Capture Buffer
            CCBUF_DITH6_MODE : aliased TCC_CCBUF_DITH6_MODE_Registers;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TCC_Peripheral use record
      CTRLA             at 16#0# range 0 .. 31;
      CTRLBCLR          at 16#4# range 0 .. 7;
      CTRLBSET          at 16#5# range 0 .. 7;
      SYNCBUSY          at 16#8# range 0 .. 31;
      FCTRLA            at 16#C# range 0 .. 31;
      FCTRLB            at 16#10# range 0 .. 31;
      WEXCTRL           at 16#14# range 0 .. 31;
      DRVCTRL           at 16#18# range 0 .. 31;
      DBGCTRL           at 16#1E# range 0 .. 7;
      EVCTRL            at 16#20# range 0 .. 31;
      INTENCLR          at 16#24# range 0 .. 31;
      INTENSET          at 16#28# range 0 .. 31;
      INTFLAG           at 16#2C# range 0 .. 31;
      STATUS            at 16#30# range 0 .. 31;
      PATT              at 16#38# range 0 .. 15;
      WAVE              at 16#3C# range 0 .. 31;
      PATTBUF           at 16#64# range 0 .. 15;
      COUNT             at 16#34# range 0 .. 31;
      PER               at 16#40# range 0 .. 31;
      CC                at 16#44# range 0 .. 191;
      PERBUF            at 16#6C# range 0 .. 31;
      CCBUF             at 16#70# range 0 .. 191;
      COUNT_DITH4_MODE  at 16#34# range 0 .. 31;
      PER_DITH4_MODE    at 16#40# range 0 .. 31;
      CC_DITH4_MODE     at 16#44# range 0 .. 191;
      PERBUF_DITH4_MODE at 16#6C# range 0 .. 31;
      CCBUF_DITH4_MODE  at 16#70# range 0 .. 191;
      COUNT_DITH5_MODE  at 16#34# range 0 .. 31;
      PER_DITH5_MODE    at 16#40# range 0 .. 31;
      CC_DITH5_MODE     at 16#44# range 0 .. 191;
      PERBUF_DITH5_MODE at 16#6C# range 0 .. 31;
      CCBUF_DITH5_MODE  at 16#70# range 0 .. 191;
      COUNT_DITH6_MODE  at 16#34# range 0 .. 31;
      PER_DITH6_MODE    at 16#40# range 0 .. 31;
      CC_DITH6_MODE     at 16#44# range 0 .. 191;
      PERBUF_DITH6_MODE at 16#6C# range 0 .. 31;
      CCBUF_DITH6_MODE  at 16#70# range 0 .. 191;
   end record;

   --  Timer Counter Control
   TCC0_Periph : aliased TCC_Peripheral
     with Import, Address => TCC0_Base;

   --  Timer Counter Control
   TCC1_Periph : aliased TCC_Peripheral
     with Import, Address => TCC1_Base;

   --  Timer Counter Control
   TCC2_Periph : aliased TCC_Peripheral
     with Import, Address => TCC2_Base;

end SAM_SVD.TCC;
