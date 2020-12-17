pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.PDEC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Operation Mode
   type CTRLA_MODESelect is
     (--  QDEC operating mode
      QDEC,
      --  HALL operating mode
      HALL,
      --  COUNTER operating mode
      COUNTER)
     with Size => 2;
   for CTRLA_MODESelect use
     (QDEC => 0,
      HALL => 1,
      COUNTER => 2);

   --  PDEC Configuration
   type CTRLA_CONFSelect is
     (--  Quadrature decoder direction
      X4,
      --  Secure Quadrature decoder direction
      X4S,
      --  Decoder direction
      X2,
      --  Secure decoder direction
      X2S,
      --  Auto correction mode
      AUTOC)
     with Size => 3;
   for CTRLA_CONFSelect use
     (X4 => 0,
      X4S => 1,
      X2 => 2,
      X2S => 3,
      AUTOC => 4);

   --  PDEC_CTRLA_PINEN array
   type PDEC_CTRLA_PINEN_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for PDEC_CTRLA_PINEN
   type PDEC_CTRLA_PINEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PINEN as a value
            Val : HAL.UInt3;
         when True =>
            --  PINEN as an array
            Arr : PDEC_CTRLA_PINEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PDEC_CTRLA_PINEN_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  PDEC_CTRLA_PINVEN array
   type PDEC_CTRLA_PINVEN_Field_Array is array (0 .. 2) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for PDEC_CTRLA_PINVEN
   type PDEC_CTRLA_PINVEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PINVEN as a value
            Val : HAL.UInt3;
         when True =>
            --  PINVEN as an array
            Arr : PDEC_CTRLA_PINVEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PDEC_CTRLA_PINVEN_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype PDEC_CTRLA_ANGULAR_Field is HAL.UInt3;
   subtype PDEC_CTRLA_MAXCMP_Field is HAL.UInt4;

   --  Control A
   type PDEC_CTRLA_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operation Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.PDEC.QDEC;
      --  unspecified
      Reserved_4_5   : HAL.UInt2 := 16#0#;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  PDEC Configuration
      CONF           : CTRLA_CONFSelect := SAM_SVD.PDEC.X4;
      --  Auto Lock
      ALOCK          : Boolean := False;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  PDEC Phase A and B Swap
      SWAP           : Boolean := False;
      --  Period Enable
      PEREN          : Boolean := False;
      --  PDEC Input From Pin 0 Enable
      PINEN          : PDEC_CTRLA_PINEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      --  IO Pin 0 Invert Enable
      PINVEN         : PDEC_CTRLA_PINVEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Angular Counter Length
      ANGULAR        : PDEC_CTRLA_ANGULAR_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      --  Maximum Consecutive Missing Pulses
      MAXCMP         : PDEC_CTRLA_MAXCMP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDEC_CTRLA_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      CONF           at 0 range 8 .. 10;
      ALOCK          at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SWAP           at 0 range 14 .. 14;
      PEREN          at 0 range 15 .. 15;
      PINEN          at 0 range 16 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      PINVEN         at 0 range 20 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      ANGULAR        at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      MAXCMP         at 0 range 28 .. 31;
   end record;

   --  Command
   type CTRLBCLR_CMDSelect is
     (--  No action
      NONE,
      --  Force a counter restart or retrigger
      RETRIGGER,
      --  Force update of double buffered registers
      UPDATE,
      --  Force a read synchronization of COUNT
      READSYNC,
      --  Start QDEC/HALL
      START,
      --  Stop QDEC/HALL
      STOP)
     with Size => 3;
   for CTRLBCLR_CMDSelect use
     (NONE => 0,
      RETRIGGER => 1,
      UPDATE => 2,
      READSYNC => 3,
      START => 4,
      STOP => 5);

   --  Control B Clear
   type PDEC_CTRLBCLR_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Lock Update
      LUPD         : Boolean := False;
      --  unspecified
      Reserved_2_4 : HAL.UInt3 := 16#0#;
      --  Command
      CMD          : CTRLBCLR_CMDSelect := SAM_SVD.PDEC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_CTRLBCLR_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      Reserved_2_4 at 0 range 2 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  Command
   type CTRLBSET_CMDSelect is
     (--  No action
      NONE,
      --  Force a counter restart or retrigger
      RETRIGGER,
      --  Force update of double buffered registers
      UPDATE,
      --  Force a read synchronization of COUNT
      READSYNC,
      --  Start QDEC/HALL
      START,
      --  Stop QDEC/HALL
      STOP)
     with Size => 3;
   for CTRLBSET_CMDSelect use
     (NONE => 0,
      RETRIGGER => 1,
      UPDATE => 2,
      READSYNC => 3,
      START => 4,
      STOP => 5);

   --  Control B Set
   type PDEC_CTRLBSET_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  Lock Update
      LUPD         : Boolean := False;
      --  unspecified
      Reserved_2_4 : HAL.UInt3 := 16#0#;
      --  Command
      CMD          : CTRLBSET_CMDSelect := SAM_SVD.PDEC.NONE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_CTRLBSET_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      LUPD         at 0 range 1 .. 1;
      Reserved_2_4 at 0 range 2 .. 4;
      CMD          at 0 range 5 .. 7;
   end record;

   --  Event Action
   type EVCTRL_EVACTSelect is
     (--  Event action disabled
      OFF,
      --  Start, restart or retrigger on event
      RETRIGGER,
      --  Count on event
      COUNT)
     with Size => 2;
   for EVCTRL_EVACTSelect use
     (OFF => 0,
      RETRIGGER => 1,
      COUNT => 2);

   subtype PDEC_EVCTRL_EVINV_Field is HAL.UInt3;
   subtype PDEC_EVCTRL_EVEI_Field is HAL.UInt3;

   --  PDEC_EVCTRL_MCEO array
   type PDEC_EVCTRL_MCEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDEC_EVCTRL_MCEO
   type PDEC_EVCTRL_MCEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MCEO as a value
            Val : HAL.UInt2;
         when True =>
            --  MCEO as an array
            Arr : PDEC_EVCTRL_MCEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDEC_EVCTRL_MCEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Event Control
   type PDEC_EVCTRL_Register is record
      --  Event Action
      EVACT          : EVCTRL_EVACTSelect := SAM_SVD.PDEC.OFF;
      --  Inverted Event Input Enable
      EVINV          : PDEC_EVCTRL_EVINV_Field := 16#0#;
      --  Event Input Enable
      EVEI           : PDEC_EVCTRL_EVEI_Field := 16#0#;
      --  Overflow/Underflow Output Event Enable
      OVFEO          : Boolean := False;
      --  Error Output Event Enable
      ERREO          : Boolean := False;
      --  Direction Output Event Enable
      DIREO          : Boolean := False;
      --  Velocity Output Event Enable
      VLCEO          : Boolean := False;
      --  Match Channel 0 Event Output Enable
      MCEO           : PDEC_EVCTRL_MCEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for PDEC_EVCTRL_Register use record
      EVACT          at 0 range 0 .. 1;
      EVINV          at 0 range 2 .. 4;
      EVEI           at 0 range 5 .. 7;
      OVFEO          at 0 range 8 .. 8;
      ERREO          at 0 range 9 .. 9;
      DIREO          at 0 range 10 .. 10;
      VLCEO          at 0 range 11 .. 11;
      MCEO           at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  PDEC_INTENCLR_MC array
   type PDEC_INTENCLR_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDEC_INTENCLR_MC
   type PDEC_INTENCLR_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : PDEC_INTENCLR_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDEC_INTENCLR_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Clear
   type PDEC_INTENCLR_Register is record
      --  Overflow/Underflow Interrupt Disable
      OVF          : Boolean := False;
      --  Error Interrupt Disable
      ERR          : Boolean := False;
      --  Direction Interrupt Disable
      DIR          : Boolean := False;
      --  Velocity Interrupt Disable
      VLC          : Boolean := False;
      --  Channel 0 Compare Match Disable
      MC           : PDEC_INTENCLR_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_INTENCLR_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      DIR          at 0 range 2 .. 2;
      VLC          at 0 range 3 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  PDEC_INTENSET_MC array
   type PDEC_INTENSET_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDEC_INTENSET_MC
   type PDEC_INTENSET_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : PDEC_INTENSET_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDEC_INTENSET_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Set
   type PDEC_INTENSET_Register is record
      --  Overflow/Underflow Interrupt Enable
      OVF          : Boolean := False;
      --  Error Interrupt Enable
      ERR          : Boolean := False;
      --  Direction Interrupt Enable
      DIR          : Boolean := False;
      --  Velocity Interrupt Enable
      VLC          : Boolean := False;
      --  Channel 0 Compare Match Enable
      MC           : PDEC_INTENSET_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_INTENSET_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      DIR          at 0 range 2 .. 2;
      VLC          at 0 range 3 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  PDEC_INTFLAG_MC array
   type PDEC_INTFLAG_MC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDEC_INTFLAG_MC
   type PDEC_INTFLAG_MC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MC as a value
            Val : HAL.UInt2;
         when True =>
            --  MC as an array
            Arr : PDEC_INTFLAG_MC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDEC_INTFLAG_MC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Flag Status and Clear
   type PDEC_INTFLAG_Register is record
      --  Overflow/Underflow
      OVF          : Boolean := False;
      --  Error
      ERR          : Boolean := False;
      --  Direction Change
      DIR          : Boolean := False;
      --  Velocity
      VLC          : Boolean := False;
      --  Channel 0 Compare Match
      MC           : PDEC_INTFLAG_MC_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_INTFLAG_Register use record
      OVF          at 0 range 0 .. 0;
      ERR          at 0 range 1 .. 1;
      DIR          at 0 range 2 .. 2;
      VLC          at 0 range 3 .. 3;
      MC           at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  PDEC_STATUS_CCBUFV array
   type PDEC_STATUS_CCBUFV_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDEC_STATUS_CCBUFV
   type PDEC_STATUS_CCBUFV_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CCBUFV as a value
            Val : HAL.UInt2;
         when True =>
            --  CCBUFV as an array
            Arr : PDEC_STATUS_CCBUFV_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDEC_STATUS_CCBUFV_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Status
   type PDEC_STATUS_Register is record
      --  Quadrature Error Flag
      QERR           : Boolean := False;
      --  Index Error Flag
      IDXERR         : Boolean := False;
      --  Missing Pulse Error flag
      MPERR          : Boolean := False;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Window Error Flag
      WINERR         : Boolean := False;
      --  Hall Error Flag
      HERR           : Boolean := False;
      --  Stop
      STOP           : Boolean := True;
      --  Direction Status Flag
      DIR            : Boolean := False;
      --  Prescaler Buffer Valid
      PRESCBUFV      : Boolean := False;
      --  Filter Buffer Valid
      FILTERBUFV     : Boolean := False;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Compare Channel 0 Buffer Valid
      CCBUFV         : PDEC_STATUS_CCBUFV_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for PDEC_STATUS_Register use record
      QERR           at 0 range 0 .. 0;
      IDXERR         at 0 range 1 .. 1;
      MPERR          at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      WINERR         at 0 range 4 .. 4;
      HERR           at 0 range 5 .. 5;
      STOP           at 0 range 6 .. 6;
      DIR            at 0 range 7 .. 7;
      PRESCBUFV      at 0 range 8 .. 8;
      FILTERBUFV     at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CCBUFV         at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  Debug Control
   type PDEC_DBGCTRL_Register is record
      --  Debug Run Mode
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_DBGCTRL_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  PDEC_SYNCBUSY_CC array
   type PDEC_SYNCBUSY_CC_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDEC_SYNCBUSY_CC
   type PDEC_SYNCBUSY_CC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CC as a value
            Val : HAL.UInt2;
         when True =>
            --  CC as an array
            Arr : PDEC_SYNCBUSY_CC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDEC_SYNCBUSY_CC_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Synchronization Status
   type PDEC_SYNCBUSY_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. Control B Synchronization Busy
      CTRLB         : Boolean;
      --  Read-only. Status Synchronization Busy
      STATUS        : Boolean;
      --  Read-only. Prescaler Synchronization Busy
      PRESC         : Boolean;
      --  Read-only. Filter Synchronization Busy
      FILTER        : Boolean;
      --  Read-only. Count Synchronization Busy
      COUNT         : Boolean;
      --  Read-only. Compare Channel 0 Synchronization Busy
      CC            : PDEC_SYNCBUSY_CC_Field;
      --  unspecified
      Reserved_9_31 : HAL.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDEC_SYNCBUSY_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      STATUS        at 0 range 3 .. 3;
      PRESC         at 0 range 4 .. 4;
      FILTER        at 0 range 5 .. 5;
      COUNT         at 0 range 6 .. 6;
      CC            at 0 range 7 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Prescaler Value
   type PRESC_PRESCSelect is
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
      --  Divide by 32
      DIV32,
      --  Divide by 64
      DIV64,
      --  Divide by 128
      DIV128,
      --  Divide by 256
      DIV256,
      --  Divide by 512
      DIV512,
      --  Divide by 1024
      DIV1024)
     with Size => 4;
   for PRESC_PRESCSelect use
     (DIV1 => 0,
      DIV2 => 1,
      DIV4 => 2,
      DIV8 => 3,
      DIV16 => 4,
      DIV32 => 5,
      DIV64 => 6,
      DIV128 => 7,
      DIV256 => 8,
      DIV512 => 9,
      DIV1024 => 10);

   --  Prescaler Value
   type PDEC_PRESC_Register is record
      --  Prescaler Value
      PRESC        : PRESC_PRESCSelect := SAM_SVD.PDEC.DIV1;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_PRESC_Register use record
      PRESC        at 0 range 0 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Prescaler Buffer Value
   type PRESCBUF_PRESCBUFSelect is
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
      --  Divide by 32
      DIV32,
      --  Divide by 64
      DIV64,
      --  Divide by 128
      DIV128,
      --  Divide by 256
      DIV256,
      --  Divide by 512
      DIV512,
      --  Divide by 1024
      DIV1024)
     with Size => 4;
   for PRESCBUF_PRESCBUFSelect use
     (DIV1 => 0,
      DIV2 => 1,
      DIV4 => 2,
      DIV8 => 3,
      DIV16 => 4,
      DIV32 => 5,
      DIV64 => 6,
      DIV128 => 7,
      DIV256 => 8,
      DIV512 => 9,
      DIV1024 => 10);

   --  Prescaler Buffer Value
   type PDEC_PRESCBUF_Register is record
      --  Prescaler Buffer Value
      PRESCBUF     : PRESCBUF_PRESCBUFSelect := SAM_SVD.PDEC.DIV1;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PDEC_PRESCBUF_Register use record
      PRESCBUF     at 0 range 0 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   subtype PDEC_COUNT_COUNT_Field is HAL.UInt16;

   --  Counter Value
   type PDEC_COUNT_Register is record
      --  Counter Value
      COUNT          : PDEC_COUNT_COUNT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDEC_COUNT_Register use record
      COUNT          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PDEC_CC_CC_Field is HAL.UInt16;

   --  Channel n Compare Value
   type PDEC_CC_Register is record
      --  Channel Compare Value
      CC             : PDEC_CC_CC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDEC_CC_Register use record
      CC             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Channel n Compare Value
   type PDEC_CC_Registers is array (0 .. 1) of PDEC_CC_Register;

   subtype PDEC_CCBUF_CCBUF_Field is HAL.UInt16;

   --  Channel Compare Buffer Value
   type PDEC_CCBUF_Register is record
      --  Channel Compare Buffer Value
      CCBUF          : PDEC_CCBUF_CCBUF_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDEC_CCBUF_Register use record
      CCBUF          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Channel Compare Buffer Value
   type PDEC_CCBUF_Registers is array (0 .. 1) of PDEC_CCBUF_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  Quadrature Decodeur
   type PDEC_Peripheral is record
      --  Control A
      CTRLA     : aliased PDEC_CTRLA_Register;
      --  Control B Clear
      CTRLBCLR  : aliased PDEC_CTRLBCLR_Register;
      --  Control B Set
      CTRLBSET  : aliased PDEC_CTRLBSET_Register;
      --  Event Control
      EVCTRL    : aliased PDEC_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR  : aliased PDEC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET  : aliased PDEC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG   : aliased PDEC_INTFLAG_Register;
      --  Status
      STATUS    : aliased PDEC_STATUS_Register;
      --  Debug Control
      DBGCTRL   : aliased PDEC_DBGCTRL_Register;
      --  Synchronization Status
      SYNCBUSY  : aliased PDEC_SYNCBUSY_Register;
      --  Prescaler Value
      PRESC     : aliased PDEC_PRESC_Register;
      --  Filter Value
      FILTER    : aliased HAL.UInt8;
      --  Prescaler Buffer Value
      PRESCBUF  : aliased PDEC_PRESCBUF_Register;
      --  Filter Buffer Value
      FILTERBUF : aliased HAL.UInt8;
      --  Counter Value
      COUNT     : aliased PDEC_COUNT_Register;
      --  Channel n Compare Value
      CC        : aliased PDEC_CC_Registers;
      --  Channel Compare Buffer Value
      CCBUF     : aliased PDEC_CCBUF_Registers;
   end record
     with Volatile;

   for PDEC_Peripheral use record
      CTRLA     at 16#0# range 0 .. 31;
      CTRLBCLR  at 16#4# range 0 .. 7;
      CTRLBSET  at 16#5# range 0 .. 7;
      EVCTRL    at 16#6# range 0 .. 15;
      INTENCLR  at 16#8# range 0 .. 7;
      INTENSET  at 16#9# range 0 .. 7;
      INTFLAG   at 16#A# range 0 .. 7;
      STATUS    at 16#C# range 0 .. 15;
      DBGCTRL   at 16#F# range 0 .. 7;
      SYNCBUSY  at 16#10# range 0 .. 31;
      PRESC     at 16#14# range 0 .. 7;
      FILTER    at 16#15# range 0 .. 7;
      PRESCBUF  at 16#18# range 0 .. 7;
      FILTERBUF at 16#19# range 0 .. 7;
      COUNT     at 16#1C# range 0 .. 31;
      CC        at 16#20# range 0 .. 63;
      CCBUF     at 16#30# range 0 .. 63;
   end record;

   --  Quadrature Decodeur
   PDEC_Periph : aliased PDEC_Peripheral
     with Import, Address => PDEC_Base;

end SAM_SVD.PDEC;
