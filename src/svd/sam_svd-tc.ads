pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.TC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ----------------------------------
   -- TcCount8 cluster's Registers --
   ----------------------------------

   --  Timer Counter Mode
   type CTRLA_MODESelect is
     (--  Counter in 16-bit mode
      COUNT16,
      --  Counter in 8-bit mode
      COUNT8,
      --  Counter in 32-bit mode
      COUNT32)
     with Size => 2;
   for CTRLA_MODESelect use
     (COUNT16 => 0,
      COUNT8 => 1,
      COUNT32 => 2);

   --  Prescaler and Counter Synchronization
   type CTRLA_PRESCSYNCSelect is
     (--  Reload or reset the counter on next generic clock
      GCLK,
      --  Reload or reset the counter on next prescaler clock
      PRESC,
      --  Reload or reset the counter on next generic clock and reset the prescaler
--  counter
      RESYNC)
     with Size => 2;
   for CTRLA_PRESCSYNCSelect use
     (GCLK => 0,
      PRESC => 1,
      RESYNC => 2);

   --  Prescaler
   type CTRLA_PRESCALERSelect is
     (--  Prescaler: GCLK_TC
      DIV1,
      --  Prescaler: GCLK_TC/2
      DIV2,
      --  Prescaler: GCLK_TC/4
      DIV4,
      --  Prescaler: GCLK_TC/8
      DIV8,
      --  Prescaler: GCLK_TC/16
      DIV16,
      --  Prescaler: GCLK_TC/64
      DIV64,
      --  Prescaler: GCLK_TC/256
      DIV256,
      --  Prescaler: GCLK_TC/1024
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

   --  TC_CTRLA_TC_COUNT8_CAPTEN array
   type TC_CTRLA_TC_COUNT8_CAPTEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_CTRLA_TC_COUNT8_CAPTEN
   type TC_CTRLA_TC_COUNT8_CAPTEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CAPTEN as a value
            Val : HAL.UInt2;
         when True =>
            --  CAPTEN as an array
            Arr : TC_CTRLA_TC_COUNT8_CAPTEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_CTRLA_TC_COUNT8_CAPTEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TC_CTRLA_TC_COUNT8_COPEN array
   type TC_CTRLA_TC_COUNT8_COPEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_CTRLA_TC_COUNT8_COPEN
   type TC_CTRLA_TC_COUNT8_COPEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COPEN as a value
            Val : HAL.UInt2;
         when True =>
            --  COPEN as an array
            Arr : TC_CTRLA_TC_COUNT8_COPEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_CTRLA_TC_COUNT8_COPEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Capture Mode Channel 0
   type CTRLA_CAPTMODE0Select is
     (--  Default capture
      DEFAULT,
      --  Minimum capture
      CAPTMIN,
      --  Maximum capture
      CAPTMAX)
     with Size => 2;
   for CTRLA_CAPTMODE0Select use
     (DEFAULT => 0,
      CAPTMIN => 1,
      CAPTMAX => 2);

   --  Capture mode Channel 1
   type CTRLA_CAPTMODE1Select is
     (--  Default capture
      DEFAULT,
      --  Minimum capture
      CAPTMIN,
      --  Maximum capture
      CAPTMAX)
     with Size => 2;
   for CTRLA_CAPTMODE1Select use
     (DEFAULT => 0,
      CAPTMIN => 1,
      CAPTMAX => 2);

   --  Control A
   type TC_CTRLA_TC_COUNT8_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Timer Counter Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.TC.COUNT16;
      --  Prescaler and Counter Synchronization
      PRESCSYNC      : CTRLA_PRESCSYNCSelect := SAM_SVD.TC.GCLK;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Clock On Demand
      ONDEMAND       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.TC.DIV1;
      --  Auto Lock
      ALOCK          : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Capture Channel 0 Enable
      CAPTEN         : TC_CTRLA_TC_COUNT8_CAPTEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Capture On Pin 0 Enable
      COPEN          : TC_CTRLA_TC_COUNT8_COPEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Capture Mode Channel 0
      CAPTMODE0      : CTRLA_CAPTMODE0Select := SAM_SVD.TC.DEFAULT;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  Capture mode Channel 1
      CAPTMODE1      : CTRLA_CAPTMODE1Select := SAM_SVD.TC.DEFAULT;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLA_TC_COUNT8_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      PRESCSYNC      at 0 range 4 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      ONDEMAND       at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 10;
      ALOCK          at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      CAPTEN         at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      COPEN          at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      CAPTMODE0      at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      CAPTMODE1      at 0 range 27 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  Command
   type CTRLBCLR_CMDSelect is
     (--  No action
      NONE,
      --  Force a start, restart or retrigger
      RETRIGGER,
      --  Force a stop
      STOP,
      --  Force update of double-buffered register
      UPDATE,
      --  Force a read synchronization of COUNT
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
   type TC_CTRLBCLR_TC_COUNT8_Register is record
      --  Counter Direction
      DIR          : Boolean := False;
      --  Lock Update
      LUPD         : Boolean := False;
      --  One-Shot on Counter
      ONESHOT      : Boolean := False;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Command
      CMD          : CTRLBCLR_CMDSelect := SAM_SVD.TC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLBCLR_TC_COUNT8_Register use record
      DIR          at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      ONESHOT      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  Command
   type CTRLBSET_CMDSelect is
     (--  No action
      NONE,
      --  Force a start, restart or retrigger
      RETRIGGER,
      --  Force a stop
      STOP,
      --  Force update of double-buffered register
      UPDATE,
      --  Force a read synchronization of COUNT
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
   type TC_CTRLBSET_TC_COUNT8_Register is record
      --  Counter Direction
      DIR          : Boolean := False;
      --  Lock Update
      LUPD         : Boolean := False;
      --  One-Shot on Counter
      ONESHOT      : Boolean := False;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Command
      CMD          : CTRLBSET_CMDSelect := SAM_SVD.TC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLBSET_TC_COUNT8_Register use record
      DIR          at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      ONESHOT      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  Event Action
   type EVCTRL_EVACTSelect is
     (--  Event action disabled
      OFF,
      --  Start, restart or retrigger TC on event
      RETRIGGER,
      --  Count on event
      COUNT,
      --  Start TC on event
      START,
      --  Time stamp capture
      STAMP,
      --  Period catured in CC0, pulse width in CC1
      PPW,
      --  Period catured in CC1, pulse width in CC0
      PWP,
      --  Pulse width capture
      PW)
     with Size => 3;
   for EVCTRL_EVACTSelect use
     (OFF => 0,
      RETRIGGER => 1,
      COUNT => 2,
      START => 3,
      STAMP => 4,
      PPW => 5,
      PWP => 6,
      PW => 7);

   --  TC_EVCTRL_TC_COUNT8_MCEO array
   type TC_EVCTRL_TC_COUNT8_MCEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_EVCTRL_TC_COUNT8_MCEO
   type TC_EVCTRL_TC_COUNT8_MCEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MCEO as a value
            Val : HAL.UInt2;
         when True =>
            --  MCEO as an array
            Arr : TC_EVCTRL_TC_COUNT8_MCEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_EVCTRL_TC_COUNT8_MCEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Event Control
   type TC_EVCTRL_TC_COUNT8_Register is record
      --  Event Action
      EVACT          : EVCTRL_EVACTSelect := SAM_SVD.TC.OFF;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  TC Event Input Polarity
      TCINV          : Boolean := False;
      --  TC Event Enable
      TCEI           : Boolean := False;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Event Output Enable
      OVFEO          : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  MC Event Output Enable 0
      MCEO           : TC_EVCTRL_TC_COUNT8_MCEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for TC_EVCTRL_TC_COUNT8_Register use record
      EVACT          at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TCINV          at 0 range 4 .. 4;
      TCEI           at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      OVFEO          at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      MCEO           at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  TC_INTENCLR_TC_COUNT8_MC array
   type TC_INTENCLR_TC_COUNT8_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTENCLR_TC_COUNT8_MC
   type TC_INTENCLR_TC_COUNT8_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTENCLR_TC_COUNT8_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTENCLR_TC_COUNT8_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Clear
   type TC_INTENCLR_TC_COUNT8_Register is record
      --  OVF Interrupt Disable
      OVF          : Boolean := False;
      --  ERR Interrupt Disable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Disable 0
      MC           : TC_INTENCLR_TC_COUNT8_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTENCLR_TC_COUNT8_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_INTENSET_TC_COUNT8_MC array
   type TC_INTENSET_TC_COUNT8_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTENSET_TC_COUNT8_MC
   type TC_INTENSET_TC_COUNT8_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTENSET_TC_COUNT8_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTENSET_TC_COUNT8_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Set
   type TC_INTENSET_TC_COUNT8_Register is record
      --  OVF Interrupt Enable
      OVF          : Boolean := False;
      --  ERR Interrupt Enable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Enable 0
      MC           : TC_INTENSET_TC_COUNT8_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTENSET_TC_COUNT8_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_INTFLAG_TC_COUNT8_MC array
   type TC_INTFLAG_TC_COUNT8_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTFLAG_TC_COUNT8_MC
   type TC_INTFLAG_TC_COUNT8_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTFLAG_TC_COUNT8_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTFLAG_TC_COUNT8_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Flag Status and Clear
   type TC_INTFLAG_TC_COUNT8_Register is record
      --  OVF Interrupt Flag
      OVF          : Boolean := False;
      --  ERR Interrupt Flag
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Flag 0
      MC           : TC_INTFLAG_TC_COUNT8_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTFLAG_TC_COUNT8_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_STATUS_TC_COUNT8_CCBUFV array
   type TC_STATUS_TC_COUNT8_CCBUFV_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_STATUS_TC_COUNT8_CCBUFV
   type TC_STATUS_TC_COUNT8_CCBUFV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CCBUFV as a value
            Val : HAL.UInt2;
         when True =>
            --  CCBUFV as an array
            Arr : TC_STATUS_TC_COUNT8_CCBUFV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_STATUS_TC_COUNT8_CCBUFV_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Status
   type TC_STATUS_TC_COUNT8_Register is record
      --  Stop Status Flag
      STOP         : Boolean := True;
      --  Slave Status Flag
      SLAVE        : Boolean := False;
      --  unspecified
      Reserved_2_2 : HAL.Bit := 16#0#;
      --  Synchronization Busy Status
      PERBUFV      : Boolean := False;
      --  Compare channel buffer 0 valid
      CCBUFV       : TC_STATUS_TC_COUNT8_CCBUFV_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_STATUS_TC_COUNT8_Register use record
      STOP         at 0 range 0 .. 0;
      SLAVE        at 0 range 1 .. 1;
      Reserved_2_2 at 0 range 2 .. 2;
      PERBUFV      at 0 range 3 .. 3;
      CCBUFV       at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Waveform Generation Mode
   type WAVE_WAVEGENSelect is
     (--  Normal frequency
      NFRQ,
      --  Match frequency
      MFRQ,
      --  Normal PWM
      NPWM,
      --  Match PWM
      MPWM)
     with Size => 2;
   for WAVE_WAVEGENSelect use
     (NFRQ => 0,
      MFRQ => 1,
      NPWM => 2,
      MPWM => 3);

   --  Waveform Generation Control
   type TC_WAVE_TC_COUNT8_Register is record
      --  Waveform Generation Mode
      WAVEGEN      : WAVE_WAVEGENSelect := SAM_SVD.TC.NFRQ;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_WAVE_TC_COUNT8_Register use record
      WAVEGEN      at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  TC_DRVCTRL_TC_COUNT8_INVEN array
   type TC_DRVCTRL_TC_COUNT8_INVEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_DRVCTRL_TC_COUNT8_INVEN
   type TC_DRVCTRL_TC_COUNT8_INVEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INVEN as a value
            Val : HAL.UInt2;
         when True =>
            --  INVEN as an array
            Arr : TC_DRVCTRL_TC_COUNT8_INVEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_DRVCTRL_TC_COUNT8_INVEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control C
   type TC_DRVCTRL_TC_COUNT8_Register is record
      --  Output Waveform Invert Enable 0
      INVEN        : TC_DRVCTRL_TC_COUNT8_INVEN_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_DRVCTRL_TC_COUNT8_Register use record
      INVEN        at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Debug Control
   type TC_DBGCTRL_TC_COUNT8_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_DBGCTRL_TC_COUNT8_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  TC_SYNCBUSY_TC_COUNT8_CC array
   type TC_SYNCBUSY_TC_COUNT8_CC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_SYNCBUSY_TC_COUNT8_CC
   type TC_SYNCBUSY_TC_COUNT8_CC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CC as a value
            Val : HAL.UInt2;
         when True =>
            --  CC as an array
            Arr : TC_SYNCBUSY_TC_COUNT8_CC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_SYNCBUSY_TC_COUNT8_CC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Synchronization Status
   type TC_SYNCBUSY_TC_COUNT8_Register is record
      --  Read-only. swrst
      SWRST         : Boolean;
      --  Read-only. enable
      ENABLE        : Boolean;
      --  Read-only. CTRLB
      CTRLB         : Boolean;
      --  Read-only. STATUS
      STATUS        : Boolean;
      --  Read-only. Counter
      COUNT         : Boolean;
      --  Read-only. Period
      PER           : Boolean;
      --  Read-only. Compare Channel 0
      CC            : TC_SYNCBUSY_TC_COUNT8_CC_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_SYNCBUSY_TC_COUNT8_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      STATUS        at 0 range 3 .. 3;
      COUNT         at 0 range 4 .. 4;
      PER           at 0 range 5 .. 5;
      CC            at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  COUNT8 Compare and Capture

   --  COUNT8 Compare and Capture
   type TC_CC_TC_COUNT8_Registers is array (0 .. 1) of HAL.UInt8;

   --  COUNT8 Compare and Capture Buffer

   --  COUNT8 Compare and Capture Buffer
   type TC_CCBUF_TC_COUNT8_Registers is array (0 .. 1) of HAL.UInt8;

   --  8-bit Counter Mode
   type TcCount8_Cluster is record
      --  Control A
      CTRLA    : aliased TC_CTRLA_TC_COUNT8_Register;
      --  Control B Clear
      CTRLBCLR : aliased TC_CTRLBCLR_TC_COUNT8_Register;
      --  Control B Set
      CTRLBSET : aliased TC_CTRLBSET_TC_COUNT8_Register;
      --  Event Control
      EVCTRL   : aliased TC_EVCTRL_TC_COUNT8_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased TC_INTENCLR_TC_COUNT8_Register;
      --  Interrupt Enable Set
      INTENSET : aliased TC_INTENSET_TC_COUNT8_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased TC_INTFLAG_TC_COUNT8_Register;
      --  Status
      STATUS   : aliased TC_STATUS_TC_COUNT8_Register;
      --  Waveform Generation Control
      WAVE     : aliased TC_WAVE_TC_COUNT8_Register;
      --  Control C
      DRVCTRL  : aliased TC_DRVCTRL_TC_COUNT8_Register;
      --  Debug Control
      DBGCTRL  : aliased TC_DBGCTRL_TC_COUNT8_Register;
      --  Synchronization Status
      SYNCBUSY : aliased TC_SYNCBUSY_TC_COUNT8_Register;
      --  COUNT8 Count
      COUNT    : aliased HAL.UInt8;
      --  COUNT8 Period
      PER      : aliased HAL.UInt8;
      --  COUNT8 Compare and Capture
      CC       : aliased TC_CC_TC_COUNT8_Registers;
      --  COUNT8 Period Buffer
      PERBUF   : aliased HAL.UInt8;
      --  COUNT8 Compare and Capture Buffer
      CCBUF    : aliased TC_CCBUF_TC_COUNT8_Registers;
   end record
     with Size => 416;

   for TcCount8_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLBCLR at 16#4# range 0 .. 7;
      CTRLBSET at 16#5# range 0 .. 7;
      EVCTRL   at 16#6# range 0 .. 15;
      INTENCLR at 16#8# range 0 .. 7;
      INTENSET at 16#9# range 0 .. 7;
      INTFLAG  at 16#A# range 0 .. 7;
      STATUS   at 16#B# range 0 .. 7;
      WAVE     at 16#C# range 0 .. 7;
      DRVCTRL  at 16#D# range 0 .. 7;
      DBGCTRL  at 16#F# range 0 .. 7;
      SYNCBUSY at 16#10# range 0 .. 31;
      COUNT    at 16#14# range 0 .. 7;
      PER      at 16#1B# range 0 .. 7;
      CC       at 16#1C# range 0 .. 15;
      PERBUF   at 16#2F# range 0 .. 7;
      CCBUF    at 16#30# range 0 .. 15;
   end record;

   -----------------------------------
   -- TcCount16 cluster's Registers --
   -----------------------------------

   --  TC_CTRLA_TC_COUNT16_CAPTEN array
   type TC_CTRLA_TC_COUNT16_CAPTEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_CTRLA_TC_COUNT16_CAPTEN
   type TC_CTRLA_TC_COUNT16_CAPTEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CAPTEN as a value
            Val : HAL.UInt2;
         when True =>
            --  CAPTEN as an array
            Arr : TC_CTRLA_TC_COUNT16_CAPTEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_CTRLA_TC_COUNT16_CAPTEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TC_CTRLA_TC_COUNT16_COPEN array
   type TC_CTRLA_TC_COUNT16_COPEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_CTRLA_TC_COUNT16_COPEN
   type TC_CTRLA_TC_COUNT16_COPEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COPEN as a value
            Val : HAL.UInt2;
         when True =>
            --  COPEN as an array
            Arr : TC_CTRLA_TC_COUNT16_COPEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_CTRLA_TC_COUNT16_COPEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control A
   type TC_CTRLA_TC_COUNT16_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Timer Counter Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.TC.COUNT16;
      --  Prescaler and Counter Synchronization
      PRESCSYNC      : CTRLA_PRESCSYNCSelect := SAM_SVD.TC.GCLK;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Clock On Demand
      ONDEMAND       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.TC.DIV1;
      --  Auto Lock
      ALOCK          : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Capture Channel 0 Enable
      CAPTEN         : TC_CTRLA_TC_COUNT16_CAPTEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Capture On Pin 0 Enable
      COPEN          : TC_CTRLA_TC_COUNT16_COPEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Capture Mode Channel 0
      CAPTMODE0      : CTRLA_CAPTMODE0Select := SAM_SVD.TC.DEFAULT;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  Capture mode Channel 1
      CAPTMODE1      : CTRLA_CAPTMODE1Select := SAM_SVD.TC.DEFAULT;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLA_TC_COUNT16_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      PRESCSYNC      at 0 range 4 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      ONDEMAND       at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 10;
      ALOCK          at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      CAPTEN         at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      COPEN          at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      CAPTMODE0      at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      CAPTMODE1      at 0 range 27 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  Control B Clear
   type TC_CTRLBCLR_TC_COUNT16_Register is record
      --  Counter Direction
      DIR          : Boolean := False;
      --  Lock Update
      LUPD         : Boolean := False;
      --  One-Shot on Counter
      ONESHOT      : Boolean := False;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Command
      CMD          : CTRLBCLR_CMDSelect := SAM_SVD.TC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLBCLR_TC_COUNT16_Register use record
      DIR          at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      ONESHOT      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  Control B Set
   type TC_CTRLBSET_TC_COUNT16_Register is record
      --  Counter Direction
      DIR          : Boolean := False;
      --  Lock Update
      LUPD         : Boolean := False;
      --  One-Shot on Counter
      ONESHOT      : Boolean := False;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Command
      CMD          : CTRLBSET_CMDSelect := SAM_SVD.TC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLBSET_TC_COUNT16_Register use record
      DIR          at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      ONESHOT      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  TC_EVCTRL_TC_COUNT16_MCEO array
   type TC_EVCTRL_TC_COUNT16_MCEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_EVCTRL_TC_COUNT16_MCEO
   type TC_EVCTRL_TC_COUNT16_MCEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MCEO as a value
            Val : HAL.UInt2;
         when True =>
            --  MCEO as an array
            Arr : TC_EVCTRL_TC_COUNT16_MCEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_EVCTRL_TC_COUNT16_MCEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Event Control
   type TC_EVCTRL_TC_COUNT16_Register is record
      --  Event Action
      EVACT          : EVCTRL_EVACTSelect := SAM_SVD.TC.OFF;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  TC Event Input Polarity
      TCINV          : Boolean := False;
      --  TC Event Enable
      TCEI           : Boolean := False;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Event Output Enable
      OVFEO          : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  MC Event Output Enable 0
      MCEO           : TC_EVCTRL_TC_COUNT16_MCEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for TC_EVCTRL_TC_COUNT16_Register use record
      EVACT          at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TCINV          at 0 range 4 .. 4;
      TCEI           at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      OVFEO          at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      MCEO           at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  TC_INTENCLR_TC_COUNT16_MC array
   type TC_INTENCLR_TC_COUNT16_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTENCLR_TC_COUNT16_MC
   type TC_INTENCLR_TC_COUNT16_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTENCLR_TC_COUNT16_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTENCLR_TC_COUNT16_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Clear
   type TC_INTENCLR_TC_COUNT16_Register is record
      --  OVF Interrupt Disable
      OVF          : Boolean := False;
      --  ERR Interrupt Disable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Disable 0
      MC           : TC_INTENCLR_TC_COUNT16_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTENCLR_TC_COUNT16_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_INTENSET_TC_COUNT16_MC array
   type TC_INTENSET_TC_COUNT16_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTENSET_TC_COUNT16_MC
   type TC_INTENSET_TC_COUNT16_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTENSET_TC_COUNT16_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTENSET_TC_COUNT16_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Set
   type TC_INTENSET_TC_COUNT16_Register is record
      --  OVF Interrupt Enable
      OVF          : Boolean := False;
      --  ERR Interrupt Enable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Enable 0
      MC           : TC_INTENSET_TC_COUNT16_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTENSET_TC_COUNT16_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_INTFLAG_TC_COUNT16_MC array
   type TC_INTFLAG_TC_COUNT16_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTFLAG_TC_COUNT16_MC
   type TC_INTFLAG_TC_COUNT16_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTFLAG_TC_COUNT16_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTFLAG_TC_COUNT16_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Flag Status and Clear
   type TC_INTFLAG_TC_COUNT16_Register is record
      --  OVF Interrupt Flag
      OVF          : Boolean := False;
      --  ERR Interrupt Flag
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Flag 0
      MC           : TC_INTFLAG_TC_COUNT16_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTFLAG_TC_COUNT16_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_STATUS_TC_COUNT16_CCBUFV array
   type TC_STATUS_TC_COUNT16_CCBUFV_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_STATUS_TC_COUNT16_CCBUFV
   type TC_STATUS_TC_COUNT16_CCBUFV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CCBUFV as a value
            Val : HAL.UInt2;
         when True =>
            --  CCBUFV as an array
            Arr : TC_STATUS_TC_COUNT16_CCBUFV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_STATUS_TC_COUNT16_CCBUFV_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Status
   type TC_STATUS_TC_COUNT16_Register is record
      --  Stop Status Flag
      STOP         : Boolean := True;
      --  Slave Status Flag
      SLAVE        : Boolean := False;
      --  unspecified
      Reserved_2_2 : HAL.Bit := 16#0#;
      --  Synchronization Busy Status
      PERBUFV      : Boolean := False;
      --  Compare channel buffer 0 valid
      CCBUFV       : TC_STATUS_TC_COUNT16_CCBUFV_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_STATUS_TC_COUNT16_Register use record
      STOP         at 0 range 0 .. 0;
      SLAVE        at 0 range 1 .. 1;
      Reserved_2_2 at 0 range 2 .. 2;
      PERBUFV      at 0 range 3 .. 3;
      CCBUFV       at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Waveform Generation Control
   type TC_WAVE_TC_COUNT16_Register is record
      --  Waveform Generation Mode
      WAVEGEN      : WAVE_WAVEGENSelect := SAM_SVD.TC.NFRQ;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_WAVE_TC_COUNT16_Register use record
      WAVEGEN      at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  TC_DRVCTRL_TC_COUNT16_INVEN array
   type TC_DRVCTRL_TC_COUNT16_INVEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_DRVCTRL_TC_COUNT16_INVEN
   type TC_DRVCTRL_TC_COUNT16_INVEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INVEN as a value
            Val : HAL.UInt2;
         when True =>
            --  INVEN as an array
            Arr : TC_DRVCTRL_TC_COUNT16_INVEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_DRVCTRL_TC_COUNT16_INVEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control C
   type TC_DRVCTRL_TC_COUNT16_Register is record
      --  Output Waveform Invert Enable 0
      INVEN        : TC_DRVCTRL_TC_COUNT16_INVEN_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_DRVCTRL_TC_COUNT16_Register use record
      INVEN        at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Debug Control
   type TC_DBGCTRL_TC_COUNT16_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_DBGCTRL_TC_COUNT16_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  TC_SYNCBUSY_TC_COUNT16_CC array
   type TC_SYNCBUSY_TC_COUNT16_CC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_SYNCBUSY_TC_COUNT16_CC
   type TC_SYNCBUSY_TC_COUNT16_CC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CC as a value
            Val : HAL.UInt2;
         when True =>
            --  CC as an array
            Arr : TC_SYNCBUSY_TC_COUNT16_CC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_SYNCBUSY_TC_COUNT16_CC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Synchronization Status
   type TC_SYNCBUSY_TC_COUNT16_Register is record
      --  Read-only. swrst
      SWRST         : Boolean;
      --  Read-only. enable
      ENABLE        : Boolean;
      --  Read-only. CTRLB
      CTRLB         : Boolean;
      --  Read-only. STATUS
      STATUS        : Boolean;
      --  Read-only. Counter
      COUNT         : Boolean;
      --  Read-only. Period
      PER           : Boolean;
      --  Read-only. Compare Channel 0
      CC            : TC_SYNCBUSY_TC_COUNT16_CC_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_SYNCBUSY_TC_COUNT16_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      STATUS        at 0 range 3 .. 3;
      COUNT         at 0 range 4 .. 4;
      PER           at 0 range 5 .. 5;
      CC            at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  COUNT16 Compare and Capture

   --  COUNT16 Compare and Capture
   type TC_CC_TC_COUNT16_Registers is array (0 .. 1) of HAL.UInt16;

   --  COUNT16 Compare and Capture Buffer

   --  COUNT16 Compare and Capture Buffer
   type TC_CCBUF_TC_COUNT16_Registers is array (0 .. 1) of HAL.UInt16;

   --  16-bit Counter Mode
   type TcCount16_Cluster is record
      --  Control A
      CTRLA    : aliased TC_CTRLA_TC_COUNT16_Register;
      --  Control B Clear
      CTRLBCLR : aliased TC_CTRLBCLR_TC_COUNT16_Register;
      --  Control B Set
      CTRLBSET : aliased TC_CTRLBSET_TC_COUNT16_Register;
      --  Event Control
      EVCTRL   : aliased TC_EVCTRL_TC_COUNT16_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased TC_INTENCLR_TC_COUNT16_Register;
      --  Interrupt Enable Set
      INTENSET : aliased TC_INTENSET_TC_COUNT16_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased TC_INTFLAG_TC_COUNT16_Register;
      --  Status
      STATUS   : aliased TC_STATUS_TC_COUNT16_Register;
      --  Waveform Generation Control
      WAVE     : aliased TC_WAVE_TC_COUNT16_Register;
      --  Control C
      DRVCTRL  : aliased TC_DRVCTRL_TC_COUNT16_Register;
      --  Debug Control
      DBGCTRL  : aliased TC_DBGCTRL_TC_COUNT16_Register;
      --  Synchronization Status
      SYNCBUSY : aliased TC_SYNCBUSY_TC_COUNT16_Register;
      --  COUNT16 Count
      COUNT    : aliased HAL.UInt16;
      --  COUNT16 Compare and Capture
      CC       : aliased TC_CC_TC_COUNT16_Registers;
      --  COUNT16 Compare and Capture Buffer
      CCBUF    : aliased TC_CCBUF_TC_COUNT16_Registers;
   end record
     with Size => 416;

   for TcCount16_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLBCLR at 16#4# range 0 .. 7;
      CTRLBSET at 16#5# range 0 .. 7;
      EVCTRL   at 16#6# range 0 .. 15;
      INTENCLR at 16#8# range 0 .. 7;
      INTENSET at 16#9# range 0 .. 7;
      INTFLAG  at 16#A# range 0 .. 7;
      STATUS   at 16#B# range 0 .. 7;
      WAVE     at 16#C# range 0 .. 7;
      DRVCTRL  at 16#D# range 0 .. 7;
      DBGCTRL  at 16#F# range 0 .. 7;
      SYNCBUSY at 16#10# range 0 .. 31;
      COUNT    at 16#14# range 0 .. 15;
      CC       at 16#1C# range 0 .. 31;
      CCBUF    at 16#30# range 0 .. 31;
   end record;

   -----------------------------------
   -- TcCount32 cluster's Registers --
   -----------------------------------

   --  TC_CTRLA_TC_COUNT32_CAPTEN array
   type TC_CTRLA_TC_COUNT32_CAPTEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_CTRLA_TC_COUNT32_CAPTEN
   type TC_CTRLA_TC_COUNT32_CAPTEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CAPTEN as a value
            Val : HAL.UInt2;
         when True =>
            --  CAPTEN as an array
            Arr : TC_CTRLA_TC_COUNT32_CAPTEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_CTRLA_TC_COUNT32_CAPTEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  TC_CTRLA_TC_COUNT32_COPEN array
   type TC_CTRLA_TC_COUNT32_COPEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_CTRLA_TC_COUNT32_COPEN
   type TC_CTRLA_TC_COUNT32_COPEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COPEN as a value
            Val : HAL.UInt2;
         when True =>
            --  COPEN as an array
            Arr : TC_CTRLA_TC_COUNT32_COPEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_CTRLA_TC_COUNT32_COPEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control A
   type TC_CTRLA_TC_COUNT32_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Timer Counter Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.TC.COUNT16;
      --  Prescaler and Counter Synchronization
      PRESCSYNC      : CTRLA_PRESCSYNCSelect := SAM_SVD.TC.GCLK;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Clock On Demand
      ONDEMAND       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.TC.DIV1;
      --  Auto Lock
      ALOCK          : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Capture Channel 0 Enable
      CAPTEN         : TC_CTRLA_TC_COUNT32_CAPTEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Capture On Pin 0 Enable
      COPEN          : TC_CTRLA_TC_COUNT32_COPEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Capture Mode Channel 0
      CAPTMODE0      : CTRLA_CAPTMODE0Select := SAM_SVD.TC.DEFAULT;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  Capture mode Channel 1
      CAPTMODE1      : CTRLA_CAPTMODE1Select := SAM_SVD.TC.DEFAULT;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLA_TC_COUNT32_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      PRESCSYNC      at 0 range 4 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      ONDEMAND       at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 10;
      ALOCK          at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      CAPTEN         at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      COPEN          at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      CAPTMODE0      at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      CAPTMODE1      at 0 range 27 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  Control B Clear
   type TC_CTRLBCLR_TC_COUNT32_Register is record
      --  Counter Direction
      DIR          : Boolean := False;
      --  Lock Update
      LUPD         : Boolean := False;
      --  One-Shot on Counter
      ONESHOT      : Boolean := False;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Command
      CMD          : CTRLBCLR_CMDSelect := SAM_SVD.TC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLBCLR_TC_COUNT32_Register use record
      DIR          at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      ONESHOT      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  Control B Set
   type TC_CTRLBSET_TC_COUNT32_Register is record
      --  Counter Direction
      DIR          : Boolean := False;
      --  Lock Update
      LUPD         : Boolean := False;
      --  One-Shot on Counter
      ONESHOT      : Boolean := False;
      --  unspecified
      Reserved_3_4 : HAL.UInt2 := 16#0#;
      --  Command
      CMD          : CTRLBSET_CMDSelect := SAM_SVD.TC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_CTRLBSET_TC_COUNT32_Register use record
      DIR          at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      ONESHOT      at 0 range 2 .. 2;
      Reserved_3_4 at 0 range 3 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  TC_EVCTRL_TC_COUNT32_MCEO array
   type TC_EVCTRL_TC_COUNT32_MCEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_EVCTRL_TC_COUNT32_MCEO
   type TC_EVCTRL_TC_COUNT32_MCEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MCEO as a value
            Val : HAL.UInt2;
         when True =>
            --  MCEO as an array
            Arr : TC_EVCTRL_TC_COUNT32_MCEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_EVCTRL_TC_COUNT32_MCEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Event Control
   type TC_EVCTRL_TC_COUNT32_Register is record
      --  Event Action
      EVACT          : EVCTRL_EVACTSelect := SAM_SVD.TC.OFF;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  TC Event Input Polarity
      TCINV          : Boolean := False;
      --  TC Event Enable
      TCEI           : Boolean := False;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Event Output Enable
      OVFEO          : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      --  MC Event Output Enable 0
      MCEO           : TC_EVCTRL_TC_COUNT32_MCEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for TC_EVCTRL_TC_COUNT32_Register use record
      EVACT          at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TCINV          at 0 range 4 .. 4;
      TCEI           at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      OVFEO          at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      MCEO           at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  TC_INTENCLR_TC_COUNT32_MC array
   type TC_INTENCLR_TC_COUNT32_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTENCLR_TC_COUNT32_MC
   type TC_INTENCLR_TC_COUNT32_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTENCLR_TC_COUNT32_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTENCLR_TC_COUNT32_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Clear
   type TC_INTENCLR_TC_COUNT32_Register is record
      --  OVF Interrupt Disable
      OVF          : Boolean := False;
      --  ERR Interrupt Disable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Disable 0
      MC           : TC_INTENCLR_TC_COUNT32_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTENCLR_TC_COUNT32_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_INTENSET_TC_COUNT32_MC array
   type TC_INTENSET_TC_COUNT32_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTENSET_TC_COUNT32_MC
   type TC_INTENSET_TC_COUNT32_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTENSET_TC_COUNT32_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTENSET_TC_COUNT32_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Set
   type TC_INTENSET_TC_COUNT32_Register is record
      --  OVF Interrupt Enable
      OVF          : Boolean := False;
      --  ERR Interrupt Enable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Enable 0
      MC           : TC_INTENSET_TC_COUNT32_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTENSET_TC_COUNT32_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_INTFLAG_TC_COUNT32_MC array
   type TC_INTFLAG_TC_COUNT32_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_INTFLAG_TC_COUNT32_MC
   type TC_INTFLAG_TC_COUNT32_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : TC_INTFLAG_TC_COUNT32_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_INTFLAG_TC_COUNT32_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Flag Status and Clear
   type TC_INTFLAG_TC_COUNT32_Register is record
      --  OVF Interrupt Flag
      OVF          : Boolean := False;
      --  ERR Interrupt Flag
      ERR          : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  MC Interrupt Flag 0
      MC           : TC_INTFLAG_TC_COUNT32_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_INTFLAG_TC_COUNT32_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  TC_STATUS_TC_COUNT32_CCBUFV array
   type TC_STATUS_TC_COUNT32_CCBUFV_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_STATUS_TC_COUNT32_CCBUFV
   type TC_STATUS_TC_COUNT32_CCBUFV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CCBUFV as a value
            Val : HAL.UInt2;
         when True =>
            --  CCBUFV as an array
            Arr : TC_STATUS_TC_COUNT32_CCBUFV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_STATUS_TC_COUNT32_CCBUFV_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Status
   type TC_STATUS_TC_COUNT32_Register is record
      --  Stop Status Flag
      STOP         : Boolean := True;
      --  Slave Status Flag
      SLAVE        : Boolean := False;
      --  unspecified
      Reserved_2_2 : HAL.Bit := 16#0#;
      --  Synchronization Busy Status
      PERBUFV      : Boolean := False;
      --  Compare channel buffer 0 valid
      CCBUFV       : TC_STATUS_TC_COUNT32_CCBUFV_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_STATUS_TC_COUNT32_Register use record
      STOP         at 0 range 0 .. 0;
      SLAVE        at 0 range 1 .. 1;
      Reserved_2_2 at 0 range 2 .. 2;
      PERBUFV      at 0 range 3 .. 3;
      CCBUFV       at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Waveform Generation Control
   type TC_WAVE_TC_COUNT32_Register is record
      --  Waveform Generation Mode
      WAVEGEN      : WAVE_WAVEGENSelect := SAM_SVD.TC.NFRQ;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_WAVE_TC_COUNT32_Register use record
      WAVEGEN      at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  TC_DRVCTRL_TC_COUNT32_INVEN array
   type TC_DRVCTRL_TC_COUNT32_INVEN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_DRVCTRL_TC_COUNT32_INVEN
   type TC_DRVCTRL_TC_COUNT32_INVEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INVEN as a value
            Val : HAL.UInt2;
         when True =>
            --  INVEN as an array
            Arr : TC_DRVCTRL_TC_COUNT32_INVEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_DRVCTRL_TC_COUNT32_INVEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control C
   type TC_DRVCTRL_TC_COUNT32_Register is record
      --  Output Waveform Invert Enable 0
      INVEN        : TC_DRVCTRL_TC_COUNT32_INVEN_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_DRVCTRL_TC_COUNT32_Register use record
      INVEN        at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Debug Control
   type TC_DBGCTRL_TC_COUNT32_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for TC_DBGCTRL_TC_COUNT32_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  TC_SYNCBUSY_TC_COUNT32_CC array
   type TC_SYNCBUSY_TC_COUNT32_CC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TC_SYNCBUSY_TC_COUNT32_CC
   type TC_SYNCBUSY_TC_COUNT32_CC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CC as a value
            Val : HAL.UInt2;
         when True =>
            --  CC as an array
            Arr : TC_SYNCBUSY_TC_COUNT32_CC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TC_SYNCBUSY_TC_COUNT32_CC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Synchronization Status
   type TC_SYNCBUSY_TC_COUNT32_Register is record
      --  Read-only. swrst
      SWRST         : Boolean;
      --  Read-only. enable
      ENABLE        : Boolean;
      --  Read-only. CTRLB
      CTRLB         : Boolean;
      --  Read-only. STATUS
      STATUS        : Boolean;
      --  Read-only. Counter
      COUNT         : Boolean;
      --  Read-only. Period
      PER           : Boolean;
      --  Read-only. Compare Channel 0
      CC            : TC_SYNCBUSY_TC_COUNT32_CC_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TC_SYNCBUSY_TC_COUNT32_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      STATUS        at 0 range 3 .. 3;
      COUNT         at 0 range 4 .. 4;
      PER           at 0 range 5 .. 5;
      CC            at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  COUNT32 Compare and Capture

   --  COUNT32 Compare and Capture
   type TC_CC_TC_COUNT32_Registers is array (0 .. 1) of HAL.UInt32;

   --  COUNT32 Compare and Capture Buffer

   --  COUNT32 Compare and Capture Buffer
   type TC_CCBUF_TC_COUNT32_Registers is array (0 .. 1) of HAL.UInt32;

   --  32-bit Counter Mode
   type TcCount32_Cluster is record
      --  Control A
      CTRLA    : aliased TC_CTRLA_TC_COUNT32_Register;
      --  Control B Clear
      CTRLBCLR : aliased TC_CTRLBCLR_TC_COUNT32_Register;
      --  Control B Set
      CTRLBSET : aliased TC_CTRLBSET_TC_COUNT32_Register;
      --  Event Control
      EVCTRL   : aliased TC_EVCTRL_TC_COUNT32_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased TC_INTENCLR_TC_COUNT32_Register;
      --  Interrupt Enable Set
      INTENSET : aliased TC_INTENSET_TC_COUNT32_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased TC_INTFLAG_TC_COUNT32_Register;
      --  Status
      STATUS   : aliased TC_STATUS_TC_COUNT32_Register;
      --  Waveform Generation Control
      WAVE     : aliased TC_WAVE_TC_COUNT32_Register;
      --  Control C
      DRVCTRL  : aliased TC_DRVCTRL_TC_COUNT32_Register;
      --  Debug Control
      DBGCTRL  : aliased TC_DBGCTRL_TC_COUNT32_Register;
      --  Synchronization Status
      SYNCBUSY : aliased TC_SYNCBUSY_TC_COUNT32_Register;
      --  COUNT32 Count
      COUNT    : aliased HAL.UInt32;
      --  COUNT32 Compare and Capture
      CC       : aliased TC_CC_TC_COUNT32_Registers;
      --  COUNT32 Compare and Capture Buffer
      CCBUF    : aliased TC_CCBUF_TC_COUNT32_Registers;
   end record
     with Size => 448;

   for TcCount32_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLBCLR at 16#4# range 0 .. 7;
      CTRLBSET at 16#5# range 0 .. 7;
      EVCTRL   at 16#6# range 0 .. 15;
      INTENCLR at 16#8# range 0 .. 7;
      INTENSET at 16#9# range 0 .. 7;
      INTFLAG  at 16#A# range 0 .. 7;
      STATUS   at 16#B# range 0 .. 7;
      WAVE     at 16#C# range 0 .. 7;
      DRVCTRL  at 16#D# range 0 .. 7;
      DBGCTRL  at 16#F# range 0 .. 7;
      SYNCBUSY at 16#10# range 0 .. 31;
      COUNT    at 16#14# range 0 .. 31;
      CC       at 16#1C# range 0 .. 63;
      CCBUF    at 16#30# range 0 .. 63;
   end record;

   ----------------------------------
   -- TcCount8 cluster's Registers --
   ----------------------------------

   --  COUNT8 Compare and Capture
   --  COUNT8 Compare and Capture Buffer

   -----------------------------------
   -- TcCount16 cluster's Registers --
   -----------------------------------

   --  COUNT16 Compare and Capture
   --  COUNT16 Compare and Capture Buffer

   -----------------------------------
   -- TcCount32 cluster's Registers --
   -----------------------------------

   --  COUNT32 Compare and Capture
   --  COUNT32 Compare and Capture Buffer

   ----------------------------------
   -- TcCount8 cluster's Registers --
   ----------------------------------

   --  COUNT8 Compare and Capture
   --  COUNT8 Compare and Capture Buffer

   -----------------------------------
   -- TcCount16 cluster's Registers --
   -----------------------------------

   --  COUNT16 Compare and Capture
   --  COUNT16 Compare and Capture Buffer

   -----------------------------------
   -- TcCount32 cluster's Registers --
   -----------------------------------

   --  COUNT32 Compare and Capture
   --  COUNT32 Compare and Capture Buffer

   ----------------------------------
   -- TcCount8 cluster's Registers --
   ----------------------------------

   --  COUNT8 Compare and Capture
   --  COUNT8 Compare and Capture Buffer

   -----------------------------------
   -- TcCount16 cluster's Registers --
   -----------------------------------

   --  COUNT16 Compare and Capture
   --  COUNT16 Compare and Capture Buffer

   -----------------------------------
   -- TcCount32 cluster's Registers --
   -----------------------------------

   --  COUNT32 Compare and Capture
   --  COUNT32 Compare and Capture Buffer

   -----------------
   -- Peripherals --
   -----------------

   type TC0_Disc is
     (Val_8,
      Val_16,
      Val_32);

   --  Basic Timer Counter
   type TC_Peripheral
     (Discriminent : TC0_Disc := Val_8)
   is record
      case Discriminent is
         when Val_8 =>
            --  8-bit Counter Mode
            TC_COUNT8 : aliased TcCount8_Cluster;
         when Val_16 =>
            --  16-bit Counter Mode
            TC_COUNT16 : aliased TcCount16_Cluster;
         when Val_32 =>
            --  32-bit Counter Mode
            TC_COUNT32 : aliased TcCount32_Cluster;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TC_Peripheral use record
      TC_COUNT8  at 0 range 0 .. 415;
      TC_COUNT16 at 0 range 0 .. 415;
      TC_COUNT32 at 0 range 0 .. 447;
   end record;

   --  Basic Timer Counter
   TC0_Periph : aliased TC_Peripheral
     with Import, Address => TC0_Base;

   --  Basic Timer Counter
   TC1_Periph : aliased TC_Peripheral
     with Import, Address => TC1_Base;

   --  Basic Timer Counter
   TC2_Periph : aliased TC_Peripheral
     with Import, Address => TC2_Base;

   --  Basic Timer Counter
   TC3_Periph : aliased TC_Peripheral
     with Import, Address => TC3_Base;

end SAM_SVD.TC;
