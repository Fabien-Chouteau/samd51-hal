pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.OSCCTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  OSCCTRL_EVCTRL_CFDEO array
   type OSCCTRL_EVCTRL_CFDEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_EVCTRL_CFDEO
   type OSCCTRL_EVCTRL_CFDEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CFDEO as a value
            Val : HAL.UInt2;
         when True =>
            --  CFDEO as an array
            Arr : OSCCTRL_EVCTRL_CFDEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_EVCTRL_CFDEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Event Control
   type OSCCTRL_EVCTRL_Register is record
      --  Clock 0 Failure Detector Event Output Enable
      CFDEO        : OSCCTRL_EVCTRL_CFDEO_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_EVCTRL_Register use record
      CFDEO        at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  OSCCTRL_INTENCLR_XOSCRDY array
   type OSCCTRL_INTENCLR_XOSCRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_INTENCLR_XOSCRDY
   type OSCCTRL_INTENCLR_XOSCRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCRDY as an array
            Arr : OSCCTRL_INTENCLR_XOSCRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_INTENCLR_XOSCRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  OSCCTRL_INTENCLR_XOSCFAIL array
   type OSCCTRL_INTENCLR_XOSCFAIL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_INTENCLR_XOSCFAIL
   type OSCCTRL_INTENCLR_XOSCFAIL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCFAIL as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCFAIL as an array
            Arr : OSCCTRL_INTENCLR_XOSCFAIL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_INTENCLR_XOSCFAIL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Clear
   type OSCCTRL_INTENCLR_Register is record
      --  XOSC 0 Ready Interrupt Enable
      XOSCRDY        : OSCCTRL_INTENCLR_XOSCRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  XOSC 0 Clock Failure Detector Interrupt Enable
      XOSCFAIL       : OSCCTRL_INTENCLR_XOSCFAIL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  DFLL Ready Interrupt Enable
      DFLLRDY        : Boolean := False;
      --  DFLL Out Of Bounds Interrupt Enable
      DFLLOOB        : Boolean := False;
      --  DFLL Lock Fine Interrupt Enable
      DFLLLCKF       : Boolean := False;
      --  DFLL Lock Coarse Interrupt Enable
      DFLLLCKC       : Boolean := False;
      --  DFLL Reference Clock Stopped Interrupt Enable
      DFLLRCS        : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  DPLL0 Lock Rise Interrupt Enable
      DPLL0LCKR      : Boolean := False;
      --  DPLL0 Lock Fall Interrupt Enable
      DPLL0LCKF      : Boolean := False;
      --  DPLL0 Lock Timeout Interrupt Enable
      DPLL0LTO       : Boolean := False;
      --  DPLL0 Loop Divider Ratio Update Complete Interrupt Enable
      DPLL0LDRTO     : Boolean := False;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  DPLL1 Lock Rise Interrupt Enable
      DPLL1LCKR      : Boolean := False;
      --  DPLL1 Lock Fall Interrupt Enable
      DPLL1LCKF      : Boolean := False;
      --  DPLL1 Lock Timeout Interrupt Enable
      DPLL1LTO       : Boolean := False;
      --  DPLL1 Loop Divider Ratio Update Complete Interrupt Enable
      DPLL1LDRTO     : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_INTENCLR_Register use record
      XOSCRDY        at 0 range 0 .. 1;
      XOSCFAIL       at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      DFLLRDY        at 0 range 8 .. 8;
      DFLLOOB        at 0 range 9 .. 9;
      DFLLLCKF       at 0 range 10 .. 10;
      DFLLLCKC       at 0 range 11 .. 11;
      DFLLRCS        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DPLL0LCKR      at 0 range 16 .. 16;
      DPLL0LCKF      at 0 range 17 .. 17;
      DPLL0LTO       at 0 range 18 .. 18;
      DPLL0LDRTO     at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      DPLL1LCKR      at 0 range 24 .. 24;
      DPLL1LCKF      at 0 range 25 .. 25;
      DPLL1LTO       at 0 range 26 .. 26;
      DPLL1LDRTO     at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  OSCCTRL_INTENSET_XOSCRDY array
   type OSCCTRL_INTENSET_XOSCRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_INTENSET_XOSCRDY
   type OSCCTRL_INTENSET_XOSCRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCRDY as an array
            Arr : OSCCTRL_INTENSET_XOSCRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_INTENSET_XOSCRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  OSCCTRL_INTENSET_XOSCFAIL array
   type OSCCTRL_INTENSET_XOSCFAIL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_INTENSET_XOSCFAIL
   type OSCCTRL_INTENSET_XOSCFAIL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCFAIL as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCFAIL as an array
            Arr : OSCCTRL_INTENSET_XOSCFAIL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_INTENSET_XOSCFAIL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Enable Set
   type OSCCTRL_INTENSET_Register is record
      --  XOSC 0 Ready Interrupt Enable
      XOSCRDY        : OSCCTRL_INTENSET_XOSCRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  XOSC 0 Clock Failure Detector Interrupt Enable
      XOSCFAIL       : OSCCTRL_INTENSET_XOSCFAIL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  DFLL Ready Interrupt Enable
      DFLLRDY        : Boolean := False;
      --  DFLL Out Of Bounds Interrupt Enable
      DFLLOOB        : Boolean := False;
      --  DFLL Lock Fine Interrupt Enable
      DFLLLCKF       : Boolean := False;
      --  DFLL Lock Coarse Interrupt Enable
      DFLLLCKC       : Boolean := False;
      --  DFLL Reference Clock Stopped Interrupt Enable
      DFLLRCS        : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  DPLL0 Lock Rise Interrupt Enable
      DPLL0LCKR      : Boolean := False;
      --  DPLL0 Lock Fall Interrupt Enable
      DPLL0LCKF      : Boolean := False;
      --  DPLL0 Lock Timeout Interrupt Enable
      DPLL0LTO       : Boolean := False;
      --  DPLL0 Loop Divider Ratio Update Complete Interrupt Enable
      DPLL0LDRTO     : Boolean := False;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  DPLL1 Lock Rise Interrupt Enable
      DPLL1LCKR      : Boolean := False;
      --  DPLL1 Lock Fall Interrupt Enable
      DPLL1LCKF      : Boolean := False;
      --  DPLL1 Lock Timeout Interrupt Enable
      DPLL1LTO       : Boolean := False;
      --  DPLL1 Loop Divider Ratio Update Complete Interrupt Enable
      DPLL1LDRTO     : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_INTENSET_Register use record
      XOSCRDY        at 0 range 0 .. 1;
      XOSCFAIL       at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      DFLLRDY        at 0 range 8 .. 8;
      DFLLOOB        at 0 range 9 .. 9;
      DFLLLCKF       at 0 range 10 .. 10;
      DFLLLCKC       at 0 range 11 .. 11;
      DFLLRCS        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DPLL0LCKR      at 0 range 16 .. 16;
      DPLL0LCKF      at 0 range 17 .. 17;
      DPLL0LTO       at 0 range 18 .. 18;
      DPLL0LDRTO     at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      DPLL1LCKR      at 0 range 24 .. 24;
      DPLL1LCKF      at 0 range 25 .. 25;
      DPLL1LTO       at 0 range 26 .. 26;
      DPLL1LDRTO     at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  OSCCTRL_INTFLAG_XOSCRDY array
   type OSCCTRL_INTFLAG_XOSCRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_INTFLAG_XOSCRDY
   type OSCCTRL_INTFLAG_XOSCRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCRDY as an array
            Arr : OSCCTRL_INTFLAG_XOSCRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_INTFLAG_XOSCRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  OSCCTRL_INTFLAG_XOSCFAIL array
   type OSCCTRL_INTFLAG_XOSCFAIL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_INTFLAG_XOSCFAIL
   type OSCCTRL_INTFLAG_XOSCFAIL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCFAIL as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCFAIL as an array
            Arr : OSCCTRL_INTFLAG_XOSCFAIL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_INTFLAG_XOSCFAIL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt Flag Status and Clear
   type OSCCTRL_INTFLAG_Register is record
      --  XOSC 0 Ready
      XOSCRDY        : OSCCTRL_INTFLAG_XOSCRDY_Field :=
                        (As_Array => False, Val => 16#0#);
      --  XOSC 0 Clock Failure Detector
      XOSCFAIL       : OSCCTRL_INTFLAG_XOSCFAIL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  DFLL Ready
      DFLLRDY        : Boolean := False;
      --  DFLL Out Of Bounds
      DFLLOOB        : Boolean := False;
      --  DFLL Lock Fine
      DFLLLCKF       : Boolean := False;
      --  DFLL Lock Coarse
      DFLLLCKC       : Boolean := False;
      --  DFLL Reference Clock Stopped
      DFLLRCS        : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  DPLL0 Lock Rise
      DPLL0LCKR      : Boolean := False;
      --  DPLL0 Lock Fall
      DPLL0LCKF      : Boolean := False;
      --  DPLL0 Lock Timeout
      DPLL0LTO       : Boolean := False;
      --  DPLL0 Loop Divider Ratio Update Complete
      DPLL0LDRTO     : Boolean := False;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  DPLL1 Lock Rise
      DPLL1LCKR      : Boolean := False;
      --  DPLL1 Lock Fall
      DPLL1LCKF      : Boolean := False;
      --  DPLL1 Lock Timeout
      DPLL1LTO       : Boolean := False;
      --  DPLL1 Loop Divider Ratio Update Complete
      DPLL1LDRTO     : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_INTFLAG_Register use record
      XOSCRDY        at 0 range 0 .. 1;
      XOSCFAIL       at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      DFLLRDY        at 0 range 8 .. 8;
      DFLLOOB        at 0 range 9 .. 9;
      DFLLLCKF       at 0 range 10 .. 10;
      DFLLLCKC       at 0 range 11 .. 11;
      DFLLRCS        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DPLL0LCKR      at 0 range 16 .. 16;
      DPLL0LCKF      at 0 range 17 .. 17;
      DPLL0LTO       at 0 range 18 .. 18;
      DPLL0LDRTO     at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      DPLL1LCKR      at 0 range 24 .. 24;
      DPLL1LCKF      at 0 range 25 .. 25;
      DPLL1LTO       at 0 range 26 .. 26;
      DPLL1LDRTO     at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  OSCCTRL_STATUS_XOSCRDY array
   type OSCCTRL_STATUS_XOSCRDY_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_STATUS_XOSCRDY
   type OSCCTRL_STATUS_XOSCRDY_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCRDY as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCRDY as an array
            Arr : OSCCTRL_STATUS_XOSCRDY_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_STATUS_XOSCRDY_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  OSCCTRL_STATUS_XOSCFAIL array
   type OSCCTRL_STATUS_XOSCFAIL_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_STATUS_XOSCFAIL
   type OSCCTRL_STATUS_XOSCFAIL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCFAIL as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCFAIL as an array
            Arr : OSCCTRL_STATUS_XOSCFAIL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_STATUS_XOSCFAIL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  OSCCTRL_STATUS_XOSCCKSW array
   type OSCCTRL_STATUS_XOSCCKSW_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for OSCCTRL_STATUS_XOSCCKSW
   type OSCCTRL_STATUS_XOSCCKSW_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  XOSCCKSW as a value
            Val : HAL.UInt2;
         when True =>
            --  XOSCCKSW as an array
            Arr : OSCCTRL_STATUS_XOSCCKSW_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OSCCTRL_STATUS_XOSCCKSW_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Status
   type OSCCTRL_STATUS_Register is record
      --  Read-only. XOSC 0 Ready
      XOSCRDY        : OSCCTRL_STATUS_XOSCRDY_Field;
      --  Read-only. XOSC 0 Clock Failure Detector
      XOSCFAIL       : OSCCTRL_STATUS_XOSCFAIL_Field;
      --  Read-only. XOSC 0 Clock Switch
      XOSCCKSW       : OSCCTRL_STATUS_XOSCCKSW_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. DFLL Ready
      DFLLRDY        : Boolean;
      --  Read-only. DFLL Out Of Bounds
      DFLLOOB        : Boolean;
      --  Read-only. DFLL Lock Fine
      DFLLLCKF       : Boolean;
      --  Read-only. DFLL Lock Coarse
      DFLLLCKC       : Boolean;
      --  Read-only. DFLL Reference Clock Stopped
      DFLLRCS        : Boolean;
      --  unspecified
      Reserved_13_15 : HAL.UInt3;
      --  Read-only. DPLL0 Lock Rise
      DPLL0LCKR      : Boolean;
      --  Read-only. DPLL0 Lock Fall
      DPLL0LCKF      : Boolean;
      --  Read-only. DPLL0 Timeout
      DPLL0TO        : Boolean;
      --  Read-only. DPLL0 Loop Divider Ratio Update Complete
      DPLL0LDRTO     : Boolean;
      --  unspecified
      Reserved_20_23 : HAL.UInt4;
      --  Read-only. DPLL1 Lock Rise
      DPLL1LCKR      : Boolean;
      --  Read-only. DPLL1 Lock Fall
      DPLL1LCKF      : Boolean;
      --  Read-only. DPLL1 Timeout
      DPLL1TO        : Boolean;
      --  Read-only. DPLL1 Loop Divider Ratio Update Complete
      DPLL1LDRTO     : Boolean;
      --  unspecified
      Reserved_28_31 : HAL.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_STATUS_Register use record
      XOSCRDY        at 0 range 0 .. 1;
      XOSCFAIL       at 0 range 2 .. 3;
      XOSCCKSW       at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      DFLLRDY        at 0 range 8 .. 8;
      DFLLOOB        at 0 range 9 .. 9;
      DFLLLCKF       at 0 range 10 .. 10;
      DFLLLCKC       at 0 range 11 .. 11;
      DFLLRCS        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DPLL0LCKR      at 0 range 16 .. 16;
      DPLL0LCKF      at 0 range 17 .. 17;
      DPLL0TO        at 0 range 18 .. 18;
      DPLL0LDRTO     at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      DPLL1LCKR      at 0 range 24 .. 24;
      DPLL1LCKF      at 0 range 25 .. 25;
      DPLL1TO        at 0 range 26 .. 26;
      DPLL1LDRTO     at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype OSCCTRL_XOSCCTRL_IPTAT_Field is HAL.UInt2;
   subtype OSCCTRL_XOSCCTRL_IMULT_Field is HAL.UInt4;

   --  Start-Up Time
   type XOSCCTRL_STARTUPSelect is
     (--  31 us
      CYCLE1,
      --  61 us
      CYCLE2,
      --  122 us
      CYCLE4,
      --  244 us
      CYCLE8,
      --  488 us
      CYCLE16,
      --  977 us
      CYCLE32,
      --  1953 us
      CYCLE64,
      --  3906 us
      CYCLE128,
      --  7813 us
      CYCLE256,
      --  15625 us
      CYCLE512,
      --  31250 us
      CYCLE1024,
      --  62500 us
      CYCLE2048,
      --  125000 us
      CYCLE4096,
      --  250000 us
      CYCLE8192,
      --  500000 us
      CYCLE16384,
      --  1000000 us
      CYCLE32768)
     with Size => 4;
   for XOSCCTRL_STARTUPSelect use
     (CYCLE1 => 0,
      CYCLE2 => 1,
      CYCLE4 => 2,
      CYCLE8 => 3,
      CYCLE16 => 4,
      CYCLE32 => 5,
      CYCLE64 => 6,
      CYCLE128 => 7,
      CYCLE256 => 8,
      CYCLE512 => 9,
      CYCLE1024 => 10,
      CYCLE2048 => 11,
      CYCLE4096 => 12,
      CYCLE8192 => 13,
      CYCLE16384 => 14,
      CYCLE32768 => 15);

   --  Clock Failure Detector Prescaler
   type XOSCCTRL_CFDPRESCSelect is
     (--  48 MHz
      DIV1,
      --  24 MHz
      DIV2,
      --  12 MHz
      DIV4,
      --  6 MHz
      DIV8,
      --  3 MHz
      DIV16,
      --  1.5 MHz
      DIV32,
      --  0.75 MHz
      DIV64,
      --  0.3125 MHz
      DIV128)
     with Size => 4;
   for XOSCCTRL_CFDPRESCSelect use
     (DIV1 => 0,
      DIV2 => 1,
      DIV4 => 2,
      DIV8 => 3,
      DIV16 => 4,
      DIV32 => 5,
      DIV64 => 6,
      DIV128 => 7);

   --  External Multipurpose Crystal Oscillator Control
   type OSCCTRL_XOSCCTRL_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Oscillator Enable
      ENABLE         : Boolean := False;
      --  Crystal Oscillator Enable
      XTALEN         : Boolean := False;
      --  unspecified
      Reserved_3_5   : HAL.UInt3 := 16#0#;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  On Demand Control
      ONDEMAND       : Boolean := True;
      --  Low Buffer Gain Enable
      LOWBUFGAIN     : Boolean := False;
      --  Oscillator Current Reference
      IPTAT          : OSCCTRL_XOSCCTRL_IPTAT_Field := 16#0#;
      --  Oscillator Current Multiplier
      IMULT          : OSCCTRL_XOSCCTRL_IMULT_Field := 16#0#;
      --  Automatic Loop Control Enable
      ENALC          : Boolean := False;
      --  Clock Failure Detector Enable
      CFDEN          : Boolean := False;
      --  Xosc Clock Switch Enable
      SWBEN          : Boolean := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Start-Up Time
      STARTUP        : XOSCCTRL_STARTUPSelect := SAM_SVD.OSCCTRL.CYCLE1;
      --  Clock Failure Detector Prescaler
      CFDPRESC       : XOSCCTRL_CFDPRESCSelect := SAM_SVD.OSCCTRL.DIV1;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_XOSCCTRL_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      XTALEN         at 0 range 2 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      ONDEMAND       at 0 range 7 .. 7;
      LOWBUFGAIN     at 0 range 8 .. 8;
      IPTAT          at 0 range 9 .. 10;
      IMULT          at 0 range 11 .. 14;
      ENALC          at 0 range 15 .. 15;
      CFDEN          at 0 range 16 .. 16;
      SWBEN          at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      STARTUP        at 0 range 20 .. 23;
      CFDPRESC       at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  External Multipurpose Crystal Oscillator Control
   type OSCCTRL_XOSCCTRL_Registers is array (0 .. 1)
     of OSCCTRL_XOSCCTRL_Register;

   --  DFLL48M Control A
   type OSCCTRL_DFLLCTRLA_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  DFLL Enable
      ENABLE       : Boolean := True;
      --  unspecified
      Reserved_2_5 : HAL.UInt4 := 16#0#;
      --  Run in Standby
      RUNSTDBY     : Boolean := False;
      --  On Demand Control
      ONDEMAND     : Boolean := True;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DFLLCTRLA_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_5 at 0 range 2 .. 5;
      RUNSTDBY     at 0 range 6 .. 6;
      ONDEMAND     at 0 range 7 .. 7;
   end record;

   --  DFLL48M Control B
   type OSCCTRL_DFLLCTRLB_Register is record
      --  Operating Mode Selection
      MODE     : Boolean := False;
      --  Stable DFLL Frequency
      STABLE   : Boolean := False;
      --  Lose Lock After Wake
      LLAW     : Boolean := False;
      --  USB Clock Recovery Mode
      USBCRM   : Boolean := False;
      --  Chill Cycle Disable
      CCDIS    : Boolean := False;
      --  Quick Lock Disable
      QLDIS    : Boolean := False;
      --  Bypass Coarse Lock
      BPLCKC   : Boolean := False;
      --  Wait Lock
      WAITLOCK : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DFLLCTRLB_Register use record
      MODE     at 0 range 0 .. 0;
      STABLE   at 0 range 1 .. 1;
      LLAW     at 0 range 2 .. 2;
      USBCRM   at 0 range 3 .. 3;
      CCDIS    at 0 range 4 .. 4;
      QLDIS    at 0 range 5 .. 5;
      BPLCKC   at 0 range 6 .. 6;
      WAITLOCK at 0 range 7 .. 7;
   end record;

   subtype OSCCTRL_DFLLVAL_FINE_Field is HAL.UInt8;
   subtype OSCCTRL_DFLLVAL_COARSE_Field is HAL.UInt6;
   subtype OSCCTRL_DFLLVAL_DIFF_Field is HAL.UInt16;

   --  DFLL48M Value
   type OSCCTRL_DFLLVAL_Register is record
      --  Fine Value
      FINE         : OSCCTRL_DFLLVAL_FINE_Field := 16#0#;
      --  unspecified
      Reserved_8_9 : HAL.UInt2 := 16#0#;
      --  Coarse Value
      COARSE       : OSCCTRL_DFLLVAL_COARSE_Field := 16#0#;
      --  Multiplication Ratio Difference
      DIFF         : OSCCTRL_DFLLVAL_DIFF_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DFLLVAL_Register use record
      FINE         at 0 range 0 .. 7;
      Reserved_8_9 at 0 range 8 .. 9;
      COARSE       at 0 range 10 .. 15;
      DIFF         at 0 range 16 .. 31;
   end record;

   subtype OSCCTRL_DFLLMUL_MUL_Field is HAL.UInt16;
   subtype OSCCTRL_DFLLMUL_FSTEP_Field is HAL.UInt8;
   subtype OSCCTRL_DFLLMUL_CSTEP_Field is HAL.UInt6;

   --  DFLL48M Multiplier
   type OSCCTRL_DFLLMUL_Register is record
      --  DFLL Multiply Factor
      MUL            : OSCCTRL_DFLLMUL_MUL_Field := 16#0#;
      --  Fine Maximum Step
      FSTEP          : OSCCTRL_DFLLMUL_FSTEP_Field := 16#0#;
      --  unspecified
      Reserved_24_25 : HAL.UInt2 := 16#0#;
      --  Coarse Maximum Step
      CSTEP          : OSCCTRL_DFLLMUL_CSTEP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DFLLMUL_Register use record
      MUL            at 0 range 0 .. 15;
      FSTEP          at 0 range 16 .. 23;
      Reserved_24_25 at 0 range 24 .. 25;
      CSTEP          at 0 range 26 .. 31;
   end record;

   --  DFLL48M Synchronization
   type OSCCTRL_DFLLSYNC_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  ENABLE Synchronization Busy
      ENABLE       : Boolean := False;
      --  DFLLCTRLB Synchronization Busy
      DFLLCTRLB    : Boolean := False;
      --  DFLLVAL Synchronization Busy
      DFLLVAL      : Boolean := False;
      --  DFLLMUL Synchronization Busy
      DFLLMUL      : Boolean := False;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DFLLSYNC_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      DFLLCTRLB    at 0 range 2 .. 2;
      DFLLVAL      at 0 range 3 .. 3;
      DFLLMUL      at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --------------------------------------
   -- OSCCTRL_DPLL cluster's Registers --
   --------------------------------------

   --  DPLL Control A
   type OSCCTRL_DPLLCTRLA_OSCCTRL_DPLL_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit := 16#0#;
      --  DPLL Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_5 : HAL.UInt4 := 16#0#;
      --  Run in Standby
      RUNSTDBY     : Boolean := False;
      --  On Demand Control
      ONDEMAND     : Boolean := True;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DPLLCTRLA_OSCCTRL_DPLL_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_5 at 0 range 2 .. 5;
      RUNSTDBY     at 0 range 6 .. 6;
      ONDEMAND     at 0 range 7 .. 7;
   end record;

   subtype OSCCTRL_DPLLRATIO_OSCCTRL_DPLL_LDR_Field is HAL.UInt13;
   subtype OSCCTRL_DPLLRATIO_OSCCTRL_DPLL_LDRFRAC_Field is HAL.UInt5;

   --  DPLL Ratio Control
   type OSCCTRL_DPLLRATIO_OSCCTRL_DPLL_Register is record
      --  Loop Divider Ratio
      LDR            : OSCCTRL_DPLLRATIO_OSCCTRL_DPLL_LDR_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      --  Loop Divider Ratio Fractional Part
      LDRFRAC        : OSCCTRL_DPLLRATIO_OSCCTRL_DPLL_LDRFRAC_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DPLLRATIO_OSCCTRL_DPLL_Register use record
      LDR            at 0 range 0 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      LDRFRAC        at 0 range 16 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   --  Proportional Integral Filter Selection
   type DPLLCTRLB_FILTERSelect is
     (--  Bandwidth = 92.7Khz and Damping Factor = 0.76
      FILTER1,
      --  Bandwidth = 131Khz and Damping Factor = 1.08
      FILTER2,
      --  Bandwidth = 46.4Khz and Damping Factor = 0.38
      FILTER3,
      --  Bandwidth = 65.6Khz and Damping Factor = 0.54
      FILTER4,
      --  Bandwidth = 131Khz and Damping Factor = 0.56
      FILTER5,
      --  Bandwidth = 185Khz and Damping Factor = 0.79
      FILTER6,
      --  Bandwidth = 65.6Khz and Damping Factor = 0.28
      FILTER7,
      --  Bandwidth = 92.7Khz and Damping Factor = 0.39
      FILTER8,
      --  Bandwidth = 46.4Khz and Damping Factor = 1.49
      FILTER9,
      --  Bandwidth = 65.6Khz and Damping Factor = 2.11
      FILTER10,
      --  Bandwidth = 23.2Khz and Damping Factor = 0.75
      FILTER11,
      --  Bandwidth = 32.8Khz and Damping Factor = 1.06
      FILTER12,
      --  Bandwidth = 65.6Khz and Damping Factor = 1.07
      FILTER13,
      --  Bandwidth = 92.7Khz and Damping Factor = 1.51
      FILTER14,
      --  Bandwidth = 32.8Khz and Damping Factor = 0.53
      FILTER15,
      --  Bandwidth = 46.4Khz and Damping Factor = 0.75
      FILTER16)
     with Size => 4;
   for DPLLCTRLB_FILTERSelect use
     (FILTER1 => 0,
      FILTER2 => 1,
      FILTER3 => 2,
      FILTER4 => 3,
      FILTER5 => 4,
      FILTER6 => 5,
      FILTER7 => 6,
      FILTER8 => 7,
      FILTER9 => 8,
      FILTER10 => 9,
      FILTER11 => 10,
      FILTER12 => 11,
      FILTER13 => 12,
      FILTER14 => 13,
      FILTER15 => 14,
      FILTER16 => 15);

   --  Reference Clock Selection
   type DPLLCTRLB_REFCLKSelect is
     (--  Dedicated GCLK clock reference
      GCLK,
      --  XOSC32K clock reference
      XOSC32,
      --  XOSC0 clock reference
      XOSC0,
      --  XOSC1 clock reference
      XOSC1)
     with Size => 3;
   for DPLLCTRLB_REFCLKSelect use
     (GCLK => 0,
      XOSC32 => 1,
      XOSC0 => 2,
      XOSC1 => 3);

   --  Lock Time
   type DPLLCTRLB_LTIMESelect is
     (--  No time-out. Automatic lock
      DEFAULT,
      --  Time-out if no lock within 800us
      Val_800US,
      --  Time-out if no lock within 900us
      Val_900US,
      --  Time-out if no lock within 1ms
      Val_1MS,
      --  Time-out if no lock within 1.1ms
      Val_1P1MS)
     with Size => 3;
   for DPLLCTRLB_LTIMESelect use
     (DEFAULT => 0,
      Val_800US => 4,
      Val_900US => 5,
      Val_1MS => 6,
      Val_1P1MS => 7);

   --  Sigma-Delta DCO Filter Selection
   type DPLLCTRLB_DCOFILTERSelect is
     (--  Capacitor(pF) = 0.5 and Bandwidth Fn (MHz) = 3.21
      FILTER1,
      --  Capacitor(pF) = 1 and Bandwidth Fn (MHz) = 1.6
      FILTER2,
      --  Capacitor(pF) = 1.5 and Bandwidth Fn (MHz) = 1.1
      FILTER3,
      --  Capacitor(pF) = 2 and Bandwidth Fn (MHz) = 0.8
      FILTER4,
      --  Capacitor(pF) = 2.5 and Bandwidth Fn (MHz) = 0.64
      FILTER5,
      --  Capacitor(pF) = 3 and Bandwidth Fn (MHz) = 0.55
      FILTER6,
      --  Capacitor(pF) = 3.5 and Bandwidth Fn (MHz) = 0.45
      FILTER7,
      --  Capacitor(pF) = 4 and Bandwidth Fn (MHz) = 0.4
      FILTER8)
     with Size => 3;
   for DPLLCTRLB_DCOFILTERSelect use
     (FILTER1 => 0,
      FILTER2 => 1,
      FILTER3 => 2,
      FILTER4 => 3,
      FILTER5 => 4,
      FILTER6 => 5,
      FILTER7 => 6,
      FILTER8 => 7);

   subtype OSCCTRL_DPLLCTRLB_OSCCTRL_DPLL_DIV_Field is HAL.UInt11;

   --  DPLL Control B
   type OSCCTRL_DPLLCTRLB_OSCCTRL_DPLL_Register is record
      --  Proportional Integral Filter Selection
      FILTER         : DPLLCTRLB_FILTERSelect := SAM_SVD.OSCCTRL.FILTER1;
      --  Wake Up Fast
      WUF            : Boolean := False;
      --  Reference Clock Selection
      REFCLK         : DPLLCTRLB_REFCLKSelect := SAM_SVD.OSCCTRL.XOSC32;
      --  Lock Time
      LTIME          : DPLLCTRLB_LTIMESelect := SAM_SVD.OSCCTRL.DEFAULT;
      --  Lock Bypass
      LBYPASS        : Boolean := False;
      --  Sigma-Delta DCO Filter Selection
      DCOFILTER      : DPLLCTRLB_DCOFILTERSelect := SAM_SVD.OSCCTRL.FILTER1;
      --  DCO Filter Enable
      DCOEN          : Boolean := False;
      --  Clock Divider
      DIV            : OSCCTRL_DPLLCTRLB_OSCCTRL_DPLL_DIV_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DPLLCTRLB_OSCCTRL_DPLL_Register use record
      FILTER         at 0 range 0 .. 3;
      WUF            at 0 range 4 .. 4;
      REFCLK         at 0 range 5 .. 7;
      LTIME          at 0 range 8 .. 10;
      LBYPASS        at 0 range 11 .. 11;
      DCOFILTER      at 0 range 12 .. 14;
      DCOEN          at 0 range 15 .. 15;
      DIV            at 0 range 16 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  DPLL Synchronization Busy
   type OSCCTRL_DPLLSYNCBUSY_OSCCTRL_DPLL_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit;
      --  Read-only. DPLL Enable Synchronization Status
      ENABLE        : Boolean;
      --  Read-only. DPLL Loop Divider Ratio Synchronization Status
      DPLLRATIO     : Boolean;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DPLLSYNCBUSY_OSCCTRL_DPLL_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      DPLLRATIO     at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  DPLL Status
   type OSCCTRL_DPLLSTATUS_OSCCTRL_DPLL_Register is record
      --  Read-only. DPLL Lock Status
      LOCK          : Boolean;
      --  Read-only. DPLL Clock Ready
      CLKRDY        : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OSCCTRL_DPLLSTATUS_OSCCTRL_DPLL_Register use record
      LOCK          at 0 range 0 .. 0;
      CLKRDY        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   type OSCCTRL_DPLL_Cluster is record
      --  DPLL Control A
      DPLLCTRLA    : aliased OSCCTRL_DPLLCTRLA_OSCCTRL_DPLL_Register;
      --  DPLL Ratio Control
      DPLLRATIO    : aliased OSCCTRL_DPLLRATIO_OSCCTRL_DPLL_Register;
      --  DPLL Control B
      DPLLCTRLB    : aliased OSCCTRL_DPLLCTRLB_OSCCTRL_DPLL_Register;
      --  DPLL Synchronization Busy
      DPLLSYNCBUSY : aliased OSCCTRL_DPLLSYNCBUSY_OSCCTRL_DPLL_Register;
      --  DPLL Status
      DPLLSTATUS   : aliased OSCCTRL_DPLLSTATUS_OSCCTRL_DPLL_Register;
   end record
     with Size => 160;

   for OSCCTRL_DPLL_Cluster use record
      DPLLCTRLA    at 16#0# range 0 .. 7;
      DPLLRATIO    at 16#4# range 0 .. 31;
      DPLLCTRLB    at 16#8# range 0 .. 31;
      DPLLSYNCBUSY at 16#C# range 0 .. 31;
      DPLLSTATUS   at 16#10# range 0 .. 31;
   end record;

   type OSCCTRL_DPLL_Clusters is array (0 .. 1) of OSCCTRL_DPLL_Cluster;

   -----------------
   -- Peripherals --
   -----------------

   --  Oscillators Control
   type OSCCTRL_Peripheral is record
      --  Event Control
      EVCTRL       : aliased OSCCTRL_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR     : aliased OSCCTRL_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET     : aliased OSCCTRL_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG      : aliased OSCCTRL_INTFLAG_Register;
      --  Status
      STATUS       : aliased OSCCTRL_STATUS_Register;
      --  External Multipurpose Crystal Oscillator Control
      XOSCCTRL     : aliased OSCCTRL_XOSCCTRL_Registers;
      --  DFLL48M Control A
      DFLLCTRLA    : aliased OSCCTRL_DFLLCTRLA_Register;
      --  DFLL48M Control B
      DFLLCTRLB    : aliased OSCCTRL_DFLLCTRLB_Register;
      --  DFLL48M Value
      DFLLVAL      : aliased OSCCTRL_DFLLVAL_Register;
      --  DFLL48M Multiplier
      DFLLMUL      : aliased OSCCTRL_DFLLMUL_Register;
      --  DFLL48M Synchronization
      DFLLSYNC     : aliased OSCCTRL_DFLLSYNC_Register;
      OSCCTRL_DPLL : aliased OSCCTRL_DPLL_Clusters;
   end record
     with Volatile;

   for OSCCTRL_Peripheral use record
      EVCTRL       at 16#0# range 0 .. 7;
      INTENCLR     at 16#4# range 0 .. 31;
      INTENSET     at 16#8# range 0 .. 31;
      INTFLAG      at 16#C# range 0 .. 31;
      STATUS       at 16#10# range 0 .. 31;
      XOSCCTRL     at 16#14# range 0 .. 63;
      DFLLCTRLA    at 16#1C# range 0 .. 7;
      DFLLCTRLB    at 16#20# range 0 .. 7;
      DFLLVAL      at 16#24# range 0 .. 31;
      DFLLMUL      at 16#28# range 0 .. 31;
      DFLLSYNC     at 16#2C# range 0 .. 7;
      OSCCTRL_DPLL at 16#30# range 0 .. 319;
   end record;

   --  Oscillators Control
   OSCCTRL_Periph : aliased OSCCTRL_Peripheral
     with Import, Address => OSCCTRL_Base;

end SAM_SVD.OSCCTRL;
