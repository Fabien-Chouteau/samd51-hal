pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.AC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control A
   type AC_CTRLA_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  AC_CTRLB_START array
   type AC_CTRLB_START_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_CTRLB_START
   type AC_CTRLB_START_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  START as a value
            Val : HAL.UInt2;
         when True =>
            --  START as an array
            Arr : AC_CTRLB_START_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_CTRLB_START_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control B
   type AC_CTRLB_Register is record
      --  Write-only. Comparator 0 Start Comparison
      START        : AC_CTRLB_START_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_CTRLB_Register use record
      START        at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  AC_EVCTRL_COMPEO array
   type AC_EVCTRL_COMPEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_EVCTRL_COMPEO
   type AC_EVCTRL_COMPEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPEO as a value
            Val : HAL.UInt2;
         when True =>
            --  COMPEO as an array
            Arr : AC_EVCTRL_COMPEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_EVCTRL_COMPEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  AC_EVCTRL_COMPEI array
   type AC_EVCTRL_COMPEI_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_EVCTRL_COMPEI
   type AC_EVCTRL_COMPEI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPEI as a value
            Val : HAL.UInt2;
         when True =>
            --  COMPEI as an array
            Arr : AC_EVCTRL_COMPEI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_EVCTRL_COMPEI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  AC_EVCTRL_INVEI array
   type AC_EVCTRL_INVEI_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_EVCTRL_INVEI
   type AC_EVCTRL_INVEI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INVEI as a value
            Val : HAL.UInt2;
         when True =>
            --  INVEI as an array
            Arr : AC_EVCTRL_INVEI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_EVCTRL_INVEI_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Event Control
   type AC_EVCTRL_Register is record
      --  Comparator 0 Event Output Enable
      COMPEO         : AC_EVCTRL_COMPEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Window 0 Event Output Enable
      WINEO0         : Boolean := False;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  Comparator 0 Event Input Enable
      COMPEI         : AC_EVCTRL_COMPEI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Comparator 0 Input Event Invert Enable
      INVEI          : AC_EVCTRL_INVEI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for AC_EVCTRL_Register use record
      COMPEO         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      WINEO0         at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      COMPEI         at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      INVEI          at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  AC_INTENCLR_COMP array
   type AC_INTENCLR_COMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_INTENCLR_COMP
   type AC_INTENCLR_COMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMP as a value
            Val : HAL.UInt2;
         when True =>
            --  COMP as an array
            Arr : AC_INTENCLR_COMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_INTENCLR_COMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Clear
   type AC_INTENCLR_Register is record
      --  Comparator 0 Interrupt Enable
      COMP         : AC_INTENCLR_COMP_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  Window 0 Interrupt Enable
      WIN0         : Boolean := False;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_INTENCLR_Register use record
      COMP         at 0 range 0 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      WIN0         at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  AC_INTENSET_COMP array
   type AC_INTENSET_COMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_INTENSET_COMP
   type AC_INTENSET_COMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMP as a value
            Val : HAL.UInt2;
         when True =>
            --  COMP as an array
            Arr : AC_INTENSET_COMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_INTENSET_COMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Set
   type AC_INTENSET_Register is record
      --  Comparator 0 Interrupt Enable
      COMP         : AC_INTENSET_COMP_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  Window 0 Interrupt Enable
      WIN0         : Boolean := False;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_INTENSET_Register use record
      COMP         at 0 range 0 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      WIN0         at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  AC_INTFLAG_COMP array
   type AC_INTFLAG_COMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_INTFLAG_COMP
   type AC_INTFLAG_COMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMP as a value
            Val : HAL.UInt2;
         when True =>
            --  COMP as an array
            Arr : AC_INTFLAG_COMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_INTFLAG_COMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Flag Status and Clear
   type AC_INTFLAG_Register is record
      --  Comparator 0
      COMP         : AC_INTFLAG_COMP_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  Window 0
      WIN0         : Boolean := False;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_INTFLAG_Register use record
      COMP         at 0 range 0 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      WIN0         at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  AC_STATUSA_STATE array
   type AC_STATUSA_STATE_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_STATUSA_STATE
   type AC_STATUSA_STATE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STATE as a value
            Val : HAL.UInt2;
         when True =>
            --  STATE as an array
            Arr : AC_STATUSA_STATE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_STATUSA_STATE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Window 0 Current State
   type STATUSA_WSTATE0Select is
     (--  Signal is above window
      ABOVE,
      --  Signal is inside window
      INSIDE,
      --  Signal is below window
      BELOW)
     with Size => 2;
   for STATUSA_WSTATE0Select use
     (ABOVE => 0,
      INSIDE => 1,
      BELOW => 2);

   --  Status A
   type AC_STATUSA_Register is record
      --  Read-only. Comparator 0 Current State
      STATE        : AC_STATUSA_STATE_Field;
      --  unspecified
      Reserved_2_3 : HAL.UInt2;
      --  Read-only. Window 0 Current State
      WSTATE0      : STATUSA_WSTATE0Select;
      --  unspecified
      Reserved_6_7 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_STATUSA_Register use record
      STATE        at 0 range 0 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      WSTATE0      at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  AC_STATUSB_READY array
   type AC_STATUSB_READY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_STATUSB_READY
   type AC_STATUSB_READY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  READY as a value
            Val : HAL.UInt2;
         when True =>
            --  READY as an array
            Arr : AC_STATUSB_READY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_STATUSB_READY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Status B
   type AC_STATUSB_Register is record
      --  Read-only. Comparator 0 Ready
      READY        : AC_STATUSB_READY_Field;
      --  unspecified
      Reserved_2_7 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_STATUSB_Register use record
      READY        at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Debug Control
   type AC_DBGCTRL_Register is record
      --  Debug Run
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_DBGCTRL_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Window 0 Interrupt Selection
   type WINCTRL_WINTSEL0Select is
     (--  Interrupt on signal above window
      ABOVE,
      --  Interrupt on signal inside window
      INSIDE,
      --  Interrupt on signal below window
      BELOW,
      --  Interrupt on signal outside window
      OUTSIDE)
     with Size => 2;
   for WINCTRL_WINTSEL0Select use
     (ABOVE => 0,
      INSIDE => 1,
      BELOW => 2,
      OUTSIDE => 3);

   --  Window Control
   type AC_WINCTRL_Register is record
      --  Window 0 Mode Enable
      WEN0         : Boolean := False;
      --  Window 0 Interrupt Selection
      WINTSEL0     : WINCTRL_WINTSEL0Select := SAM_SVD.AC.ABOVE;
      --  unspecified
      Reserved_3_7 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_WINCTRL_Register use record
      WEN0         at 0 range 0 .. 0;
      WINTSEL0     at 0 range 1 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   subtype AC_SCALER_VALUE_Field is HAL.UInt6;

   --  Scaler n
   type AC_SCALER_Register is record
      --  Scaler Value
      VALUE        : AC_SCALER_VALUE_Field := 16#0#;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AC_SCALER_Register use record
      VALUE        at 0 range 0 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Scaler n
   type AC_SCALER_Registers is array (0 .. 1) of AC_SCALER_Register;

   --  Interrupt Selection
   type COMPCTRL_INTSELSelect is
     (--  Interrupt on comparator output toggle
      TOGGLE,
      --  Interrupt on comparator output rising
      RISING,
      --  Interrupt on comparator output falling
      FALLING,
      --  Interrupt on end of comparison (single-shot mode only)
      EOC)
     with Size => 2;
   for COMPCTRL_INTSELSelect use
     (TOGGLE => 0,
      RISING => 1,
      FALLING => 2,
      EOC => 3);

   --  Negative Input Mux Selection
   type COMPCTRL_MUXNEGSelect is
     (--  I/O pin 0
      PIN0,
      --  I/O pin 1
      PIN1,
      --  I/O pin 2
      PIN2,
      --  I/O pin 3
      PIN3,
      --  Ground
      GND,
      --  VDD scaler
      VSCALE,
      --  Internal bandgap voltage
      BANDGAP,
      --  DAC output
      DAC)
     with Size => 3;
   for COMPCTRL_MUXNEGSelect use
     (PIN0 => 0,
      PIN1 => 1,
      PIN2 => 2,
      PIN3 => 3,
      GND => 4,
      VSCALE => 5,
      BANDGAP => 6,
      DAC => 7);

   --  Positive Input Mux Selection
   type COMPCTRL_MUXPOSSelect is
     (--  I/O pin 0
      PIN0,
      --  I/O pin 1
      PIN1,
      --  I/O pin 2
      PIN2,
      --  I/O pin 3
      PIN3,
      --  VDD Scaler
      VSCALE)
     with Size => 3;
   for COMPCTRL_MUXPOSSelect use
     (PIN0 => 0,
      PIN1 => 1,
      PIN2 => 2,
      PIN3 => 3,
      VSCALE => 4);

   --  Speed Selection
   type COMPCTRL_SPEEDSelect is
     (--  Reset value for the field
      COMPCTRL_SPEEDSelect_Reset,
      --  High speed
      HIGH)
     with Size => 2;
   for COMPCTRL_SPEEDSelect use
     (COMPCTRL_SPEEDSelect_Reset => 0,
      HIGH => 3);

   --  Hysteresis Level
   type COMPCTRL_HYSTSelect is
     (--  50mV
      HYST50,
      --  100mV
      HYST100,
      --  150mV
      HYST150)
     with Size => 2;
   for COMPCTRL_HYSTSelect use
     (HYST50 => 0,
      HYST100 => 1,
      HYST150 => 2);

   --  Filter Length
   type COMPCTRL_FLENSelect is
     (--  No filtering
      OFF,
      --  3-bit majority function (2 of 3)
      MAJ3,
      --  5-bit majority function (3 of 5)
      MAJ5)
     with Size => 3;
   for COMPCTRL_FLENSelect use
     (OFF => 0,
      MAJ3 => 1,
      MAJ5 => 2);

   --  Output
   type COMPCTRL_OUTSelect is
     (--  The output of COMPn is not routed to the COMPn I/O port
      OFF,
      --  The asynchronous output of COMPn is routed to the COMPn I/O port
      ASYNC,
      --  The synchronous output (including filtering) of COMPn is routed to the
--  COMPn I/O port
      SYNC)
     with Size => 2;
   for COMPCTRL_OUTSelect use
     (OFF => 0,
      ASYNC => 1,
      SYNC => 2);

   --  Comparator Control n
   type AC_COMPCTRL_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Enable
      ENABLE         : Boolean := False;
      --  Single-Shot Mode
      SINGLE         : Boolean := False;
      --  Interrupt Selection
      INTSEL         : COMPCTRL_INTSELSelect := SAM_SVD.AC.TOGGLE;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Negative Input Mux Selection
      MUXNEG         : COMPCTRL_MUXNEGSelect := SAM_SVD.AC.PIN0;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Positive Input Mux Selection
      MUXPOS         : COMPCTRL_MUXPOSSelect := SAM_SVD.AC.PIN0;
      --  Swap Inputs and Invert
      SWAP           : Boolean := False;
      --  Speed Selection
      SPEED          : COMPCTRL_SPEEDSelect := COMPCTRL_SPEEDSelect_Reset;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      --  Hysteresis Enable
      HYSTEN         : Boolean := False;
      --  Hysteresis Level
      HYST           : COMPCTRL_HYSTSelect := SAM_SVD.AC.HYST50;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Filter Length
      FLEN           : COMPCTRL_FLENSelect := SAM_SVD.AC.OFF;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      --  Output
      OUT_k          : COMPCTRL_OUTSelect := SAM_SVD.AC.OFF;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AC_COMPCTRL_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      SINGLE         at 0 range 2 .. 2;
      INTSEL         at 0 range 3 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MUXNEG         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      MUXPOS         at 0 range 12 .. 14;
      SWAP           at 0 range 15 .. 15;
      SPEED          at 0 range 16 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      HYSTEN         at 0 range 19 .. 19;
      HYST           at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      FLEN           at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      OUT_k          at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  Comparator Control n
   type AC_COMPCTRL_Registers is array (0 .. 1) of AC_COMPCTRL_Register;

   --  AC_SYNCBUSY_COMPCTRL array
   type AC_SYNCBUSY_COMPCTRL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for AC_SYNCBUSY_COMPCTRL
   type AC_SYNCBUSY_COMPCTRL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COMPCTRL as a value
            Val : HAL.UInt2;
         when True =>
            --  COMPCTRL as an array
            Arr : AC_SYNCBUSY_COMPCTRL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for AC_SYNCBUSY_COMPCTRL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Synchronization Busy
   type AC_SYNCBUSY_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. WINCTRL Synchronization Busy
      WINCTRL       : Boolean;
      --  Read-only. COMPCTRL 0 Synchronization Busy
      COMPCTRL      : AC_SYNCBUSY_COMPCTRL_Field;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AC_SYNCBUSY_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      WINCTRL       at 0 range 2 .. 2;
      COMPCTRL      at 0 range 3 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype AC_CALIB_BIAS0_Field is HAL.UInt2;

   --  Calibration
   type AC_CALIB_Register is record
      --  COMP0/1 Bias Scaling
      BIAS0         : AC_CALIB_BIAS0_Field := 16#1#;
      --  unspecified
      Reserved_2_15 : HAL.UInt14 := 16#40#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for AC_CALIB_Register use record
      BIAS0         at 0 range 0 .. 1;
      Reserved_2_15 at 0 range 2 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Analog Comparators
   type AC_Peripheral is record
      --  Control A
      CTRLA    : aliased AC_CTRLA_Register;
      --  Control B
      CTRLB    : aliased AC_CTRLB_Register;
      --  Event Control
      EVCTRL   : aliased AC_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased AC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased AC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased AC_INTFLAG_Register;
      --  Status A
      STATUSA  : aliased AC_STATUSA_Register;
      --  Status B
      STATUSB  : aliased AC_STATUSB_Register;
      --  Debug Control
      DBGCTRL  : aliased AC_DBGCTRL_Register;
      --  Window Control
      WINCTRL  : aliased AC_WINCTRL_Register;
      --  Scaler n
      SCALER   : aliased AC_SCALER_Registers;
      --  Comparator Control n
      COMPCTRL : aliased AC_COMPCTRL_Registers;
      --  Synchronization Busy
      SYNCBUSY : aliased AC_SYNCBUSY_Register;
      --  Calibration
      CALIB    : aliased AC_CALIB_Register;
   end record
     with Volatile;

   for AC_Peripheral use record
      CTRLA    at 16#0# range 0 .. 7;
      CTRLB    at 16#1# range 0 .. 7;
      EVCTRL   at 16#2# range 0 .. 15;
      INTENCLR at 16#4# range 0 .. 7;
      INTENSET at 16#5# range 0 .. 7;
      INTFLAG  at 16#6# range 0 .. 7;
      STATUSA  at 16#7# range 0 .. 7;
      STATUSB  at 16#8# range 0 .. 7;
      DBGCTRL  at 16#9# range 0 .. 7;
      WINCTRL  at 16#A# range 0 .. 7;
      SCALER   at 16#C# range 0 .. 15;
      COMPCTRL at 16#10# range 0 .. 63;
      SYNCBUSY at 16#20# range 0 .. 31;
      CALIB    at 16#24# range 0 .. 15;
   end record;

   --  Analog Comparators
   AC_Periph : aliased AC_Peripheral
     with Import, Address => AC_Base;

end SAM_SVD.AC;
