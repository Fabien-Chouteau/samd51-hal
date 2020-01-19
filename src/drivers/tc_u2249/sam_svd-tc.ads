--  ============================================================================
--  Atmel Microcontroller Software Support
--  ============================================================================
--  Copyright (c) 2017 Atmel Corporation,
--  a wholly owned subsidiary of Microchip Technology Inc.
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the Licence at
--
--  http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
--  ============================================================================

--  This spec has been automatically generated from ATSAMD51J19A.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

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
      Count16,
      --  Counter in 8-bit mode
      Count8,
      --  Counter in 32-bit mode
      Count32)
     with Size => 2;
   for CTRLA_MODESelect use
     (Count16 => 0,
      Count8 => 1,
      Count32 => 2);

   --  Prescaler and Counter Synchronization
   type CTRLA_PRESCSYNCSelect is
     (--  Reload or reset the counter on next generic clock
      Gclk,
      --  Reload or reset the counter on next prescaler clock
      Presc,
      --  Reload or reset the counter on next generic clock and reset the prescaler
--  counter
      Resync)
     with Size => 2;
   for CTRLA_PRESCSYNCSelect use
     (Gclk => 0,
      Presc => 1,
      Resync => 2);

   --  Prescaler
   type CTRLA_PRESCALERSelect is
     (--  Prescaler: GCLK_TC
      Div1,
      --  Prescaler: GCLK_TC/2
      Div2,
      --  Prescaler: GCLK_TC/4
      Div4,
      --  Prescaler: GCLK_TC/8
      Div8,
      --  Prescaler: GCLK_TC/16
      Div16,
      --  Prescaler: GCLK_TC/64
      Div64,
      --  Prescaler: GCLK_TC/256
      Div256,
      --  Prescaler: GCLK_TC/1024
      Div1024)
     with Size => 3;
   for CTRLA_PRESCALERSelect use
     (Div1 => 0,
      Div2 => 1,
      Div4 => 2,
      Div8 => 3,
      Div16 => 4,
      Div64 => 5,
      Div256 => 6,
      Div1024 => 7);

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
      Default,
      --  Minimum capture
      Captmin,
      --  Maximum capture
      Captmax)
     with Size => 2;
   for CTRLA_CAPTMODE0Select use
     (Default => 0,
      Captmin => 1,
      Captmax => 2);

   --  Capture mode Channel 1
   type CTRLA_CAPTMODE1Select is
     (--  Default capture
      Default,
      --  Minimum capture
      Captmin,
      --  Maximum capture
      Captmax)
     with Size => 2;
   for CTRLA_CAPTMODE1Select use
     (Default => 0,
      Captmin => 1,
      Captmax => 2);

   --  Control A
   type TC_CTRLA_TC_COUNT8_Register is record
      --  Write-only. Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Timer Counter Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.TC.Count16;
      --  Prescaler and Counter Synchronization
      PRESCSYNC      : CTRLA_PRESCSYNCSelect := SAM_SVD.TC.Gclk;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Clock On Demand
      ONDEMAND       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.TC.Div1;
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
      CAPTMODE0      : CTRLA_CAPTMODE0Select := SAM_SVD.TC.Default;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  Capture mode Channel 1
      CAPTMODE1      : CTRLA_CAPTMODE1Select := SAM_SVD.TC.Default;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
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
      None,
      --  Force a start, restart or retrigger
      Retrigger,
      --  Force a stop
      Stop,
      --  Force update of double-buffered register
      Update,
      --  Force a read synchronization of COUNT
      Readsync,
      --  One-shot DMA trigger
      Dmaos)
     with Size => 3;
   for CTRLBCLR_CMDSelect use
     (None => 0,
      Retrigger => 1,
      Stop => 2,
      Update => 3,
      Readsync => 4,
      Dmaos => 5);

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
      CMD          : CTRLBCLR_CMDSelect := SAM_SVD.TC.None;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      None,
      --  Force a start, restart or retrigger
      Retrigger,
      --  Force a stop
      Stop,
      --  Force update of double-buffered register
      Update,
      --  Force a read synchronization of COUNT
      Readsync,
      --  One-shot DMA trigger
      Dmaos)
     with Size => 3;
   for CTRLBSET_CMDSelect use
     (None => 0,
      Retrigger => 1,
      Stop => 2,
      Update => 3,
      Readsync => 4,
      Dmaos => 5);

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
      CMD          : CTRLBSET_CMDSelect := SAM_SVD.TC.None;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      Off,
      --  Start, restart or retrigger TC on event
      Retrigger,
      --  Count on event
      Count,
      --  Start TC on event
      Start,
      --  Time stamp capture
      Stamp,
      --  Period catured in CC0, pulse width in CC1
      Ppw,
      --  Period catured in CC1, pulse width in CC0
      Pwp,
      --  Pulse width capture
      Pw)
     with Size => 3;
   for EVCTRL_EVACTSelect use
     (Off => 0,
      Retrigger => 1,
      Count => 2,
      Start => 3,
      Stamp => 4,
      Ppw => 5,
      Pwp => 6,
      Pw => 7);

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
      EVACT          : EVCTRL_EVACTSelect := SAM_SVD.TC.Off;
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
     with Volatile_Full_Access, Size => 16,
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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      --  Read-only. Stop Status Flag
      STOP         : Boolean := True;
      --  Read-only. Slave Status Flag
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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      Nfrq,
      --  Match frequency
      Mfrq,
      --  Normal PWM
      Npwm,
      --  Match PWM
      Mpwm)
     with Size => 2;
   for WAVE_WAVEGENSelect use
     (Nfrq => 0,
      Mfrq => 1,
      Npwm => 2,
      Mpwm => 3);

   --  Waveform Generation Control
   type TC_WAVE_TC_COUNT8_Register is record
      --  Waveform Generation Mode
      WAVEGEN      : WAVE_WAVEGENSelect := SAM_SVD.TC.Nfrq;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 32,
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
      --  Write-only. Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Timer Counter Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.TC.Count16;
      --  Prescaler and Counter Synchronization
      PRESCSYNC      : CTRLA_PRESCSYNCSelect := SAM_SVD.TC.Gclk;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Clock On Demand
      ONDEMAND       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.TC.Div1;
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
      CAPTMODE0      : CTRLA_CAPTMODE0Select := SAM_SVD.TC.Default;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  Capture mode Channel 1
      CAPTMODE1      : CTRLA_CAPTMODE1Select := SAM_SVD.TC.Default;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
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
      CMD          : CTRLBCLR_CMDSelect := SAM_SVD.TC.None;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      CMD          : CTRLBSET_CMDSelect := SAM_SVD.TC.None;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      EVACT          : EVCTRL_EVACTSelect := SAM_SVD.TC.Off;
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
     with Volatile_Full_Access, Size => 16,
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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      --  Read-only. Stop Status Flag
      STOP         : Boolean := True;
      --  Read-only. Slave Status Flag
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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      WAVEGEN      : WAVE_WAVEGENSelect := SAM_SVD.TC.Nfrq;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 32,
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
      --  Write-only. Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Timer Counter Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.TC.Count16;
      --  Prescaler and Counter Synchronization
      PRESCSYNC      : CTRLA_PRESCSYNCSelect := SAM_SVD.TC.Gclk;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Clock On Demand
      ONDEMAND       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRLA_PRESCALERSelect := SAM_SVD.TC.Div1;
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
      CAPTMODE0      : CTRLA_CAPTMODE0Select := SAM_SVD.TC.Default;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  Capture mode Channel 1
      CAPTMODE1      : CTRLA_CAPTMODE1Select := SAM_SVD.TC.Default;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
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
      CMD          : CTRLBCLR_CMDSelect := SAM_SVD.TC.None;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      CMD          : CTRLBSET_CMDSelect := SAM_SVD.TC.None;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      EVACT          : EVCTRL_EVACTSelect := SAM_SVD.TC.Off;
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
     with Volatile_Full_Access, Size => 16,
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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      --  Read-only. Stop Status Flag
      STOP         : Boolean := True;
      --  Read-only. Slave Status Flag
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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
      WAVEGEN      : WAVE_WAVEGENSelect := SAM_SVD.TC.Nfrq;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 8, Bit_Order => System.Low_Order_First;

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
     with Volatile_Full_Access, Size => 32,
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

   --  Basic Timer Counter 0
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

   --  Basic Timer Counter 0
   TC0_Periph : aliased TC_Peripheral
     with Import, Address => TC0_Base;

   --  Basic Timer Counter 1
   TC1_Periph : aliased TC_Peripheral
     with Import, Address => TC1_Base;

   --  Basic Timer Counter 2
   TC2_Periph : aliased TC_Peripheral
     with Import, Address => TC2_Base;

   --  Basic Timer Counter 3
   TC3_Periph : aliased TC_Peripheral
     with Import, Address => TC3_Base;

   --  Basic Timer Counter 4
   TC4_Periph : aliased TC_Peripheral
     with Import, Address => TC4_Base;

   --  Basic Timer Counter 5
   TC5_Periph : aliased TC_Peripheral
     with Import, Address => TC5_Base;

end SAM_SVD.TC;
