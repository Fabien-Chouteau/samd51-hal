pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.SUPC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Interrupt Enable Clear
   type SUPC_INTENCLR_Register is record
      --  BOD33 Ready
      BOD33RDY       : Boolean := False;
      --  BOD33 Detection
      BOD33DET       : Boolean := False;
      --  BOD33 Synchronization Ready
      B33SRDY        : Boolean := False;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  Voltage Regulator Ready
      VREGRDY        : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  VDDCORE Ready
      VCORERDY       : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_INTENCLR_Register use record
      BOD33RDY       at 0 range 0 .. 0;
      BOD33DET       at 0 range 1 .. 1;
      B33SRDY        at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      VREGRDY        at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      VCORERDY       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Interrupt Enable Set
   type SUPC_INTENSET_Register is record
      --  BOD33 Ready
      BOD33RDY       : Boolean := False;
      --  BOD33 Detection
      BOD33DET       : Boolean := False;
      --  BOD33 Synchronization Ready
      B33SRDY        : Boolean := False;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  Voltage Regulator Ready
      VREGRDY        : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  VDDCORE Ready
      VCORERDY       : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_INTENSET_Register use record
      BOD33RDY       at 0 range 0 .. 0;
      BOD33DET       at 0 range 1 .. 1;
      B33SRDY        at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      VREGRDY        at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      VCORERDY       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Interrupt Flag Status and Clear
   type SUPC_INTFLAG_Register is record
      --  BOD33 Ready
      BOD33RDY       : Boolean := False;
      --  BOD33 Detection
      BOD33DET       : Boolean := False;
      --  BOD33 Synchronization Ready
      B33SRDY        : Boolean := False;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  Voltage Regulator Ready
      VREGRDY        : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  VDDCORE Ready
      VCORERDY       : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_INTFLAG_Register use record
      BOD33RDY       at 0 range 0 .. 0;
      BOD33DET       at 0 range 1 .. 1;
      B33SRDY        at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      VREGRDY        at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      VCORERDY       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Power and Clocks Status
   type SUPC_STATUS_Register is record
      --  Read-only. BOD33 Ready
      BOD33RDY       : Boolean;
      --  Read-only. BOD33 Detection
      BOD33DET       : Boolean;
      --  Read-only. BOD33 Synchronization Ready
      B33SRDY        : Boolean;
      --  unspecified
      Reserved_3_7   : HAL.UInt5;
      --  Read-only. Voltage Regulator Ready
      VREGRDY        : Boolean;
      --  unspecified
      Reserved_9_9   : HAL.Bit;
      --  Read-only. VDDCORE Ready
      VCORERDY       : Boolean;
      --  unspecified
      Reserved_11_31 : HAL.UInt21;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_STATUS_Register use record
      BOD33RDY       at 0 range 0 .. 0;
      BOD33DET       at 0 range 1 .. 1;
      B33SRDY        at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      VREGRDY        at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      VCORERDY       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Action when Threshold Crossed
   type BOD33_ACTIONSelect is
     (--  No action
      NONE,
      --  The BOD33 generates a reset
      RESET,
      --  The BOD33 generates an interrupt
      INT,
      --  The BOD33 puts the device in backup sleep mode
      BKUP)
     with Size => 2;
   for BOD33_ACTIONSelect use
     (NONE => 0,
      RESET => 1,
      INT => 2,
      BKUP => 3);

   subtype SUPC_BOD33_HYST_Field is HAL.UInt4;

   --  Prescaler Select
   type BOD33_PSELSelect is
     (--  Not divided
      NODIV,
      --  Divide clock by 4
      DIV4,
      --  Divide clock by 8
      DIV8,
      --  Divide clock by 16
      DIV16,
      --  Divide clock by 32
      DIV32,
      --  Divide clock by 64
      DIV64,
      --  Divide clock by 128
      DIV128,
      --  Divide clock by 256
      DIV256)
     with Size => 3;
   for BOD33_PSELSelect use
     (NODIV => 0,
      DIV4 => 1,
      DIV8 => 2,
      DIV16 => 3,
      DIV32 => 4,
      DIV64 => 5,
      DIV128 => 6,
      DIV256 => 7);

   subtype SUPC_BOD33_LEVEL_Field is HAL.UInt8;
   subtype SUPC_BOD33_VBATLEVEL_Field is HAL.UInt8;

   --  BOD33 Control
   type SUPC_BOD33_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Enable
      ENABLE         : Boolean := False;
      --  Action when Threshold Crossed
      ACTION         : BOD33_ACTIONSelect := SAM_SVD.SUPC.NONE;
      --  Configuration in Standby mode
      STDBYCFG       : Boolean := False;
      --  Run in Standby mode
      RUNSTDBY       : Boolean := False;
      --  Run in Hibernate mode
      RUNHIB         : Boolean := False;
      --  Run in Backup mode
      RUNBKUP        : Boolean := False;
      --  Hysteresis value
      HYST           : SUPC_BOD33_HYST_Field := 16#0#;
      --  Prescaler Select
      PSEL           : BOD33_PSELSelect := SAM_SVD.SUPC.NODIV;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Threshold Level for VDD
      LEVEL          : SUPC_BOD33_LEVEL_Field := 16#0#;
      --  Threshold Level in battery backup sleep mode for VBAT
      VBATLEVEL      : SUPC_BOD33_VBATLEVEL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_BOD33_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      ACTION         at 0 range 2 .. 3;
      STDBYCFG       at 0 range 4 .. 4;
      RUNSTDBY       at 0 range 5 .. 5;
      RUNHIB         at 0 range 6 .. 6;
      RUNBKUP        at 0 range 7 .. 7;
      HYST           at 0 range 8 .. 11;
      PSEL           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      LEVEL          at 0 range 16 .. 23;
      VBATLEVEL      at 0 range 24 .. 31;
   end record;

   --  Voltage Regulator Selection
   type VREG_SELSelect is
     (--  LDO selection
      LDO,
      --  Buck selection
      BUCK)
     with Size => 1;
   for VREG_SELSelect use
     (LDO => 0,
      BUCK => 1);

   subtype SUPC_VREG_VSPER_Field is HAL.UInt3;

   --  VREG Control
   type SUPC_VREG_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Enable
      ENABLE         : Boolean := True;
      --  Voltage Regulator Selection
      SEL            : VREG_SELSelect := SAM_SVD.SUPC.LDO;
      --  unspecified
      Reserved_3_6   : HAL.UInt4 := 16#0#;
      --  Run in Backup mode
      RUNBKUP        : Boolean := False;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Voltage Scaling Enable
      VSEN           : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  Voltage Scaling Period
      VSPER          : SUPC_VREG_VSPER_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_VREG_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      SEL            at 0 range 2 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      RUNBKUP        at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      VSEN           at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      VSPER          at 0 range 24 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Voltage Reference Selection
   type VREF_SELSelect is
     (--  1.0V voltage reference typical value
      Val_1V0,
      --  1.1V voltage reference typical value
      Val_1V1,
      --  1.2V voltage reference typical value
      Val_1V2,
      --  1.25V voltage reference typical value
      Val_1V25,
      --  2.0V voltage reference typical value
      Val_2V0,
      --  2.2V voltage reference typical value
      Val_2V2,
      --  2.4V voltage reference typical value
      Val_2V4,
      --  2.5V voltage reference typical value
      Val_2V5)
     with Size => 4;
   for VREF_SELSelect use
     (Val_1V0 => 0,
      Val_1V1 => 1,
      Val_1V2 => 2,
      Val_1V25 => 3,
      Val_2V0 => 4,
      Val_2V2 => 5,
      Val_2V4 => 6,
      Val_2V5 => 7);

   --  VREF Control
   type SUPC_VREF_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Temperature Sensor Output Enable
      TSEN           : Boolean := False;
      --  Voltage Reference Output Enable
      VREFOE         : Boolean := False;
      --  Temperature Sensor Selection
      TSSEL          : Boolean := False;
      --  unspecified
      Reserved_4_5   : HAL.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  On Demand Contrl
      ONDEMAND       : Boolean := False;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Voltage Reference Selection
      SEL            : VREF_SELSelect := SAM_SVD.SUPC.Val_1V0;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_VREF_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      TSEN           at 0 range 1 .. 1;
      VREFOE         at 0 range 2 .. 2;
      TSSEL          at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      RUNSTDBY       at 0 range 6 .. 6;
      ONDEMAND       at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      SEL            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Battery Backup Configuration
   type BBPS_CONFSelect is
     (--  The power switch is handled by the BOD33
      BOD33,
      --  In Backup Domain, the backup domain is always supplied by battery backup
--  power
      FORCED)
     with Size => 1;
   for BBPS_CONFSelect use
     (BOD33 => 0,
      FORCED => 1);

   --  Battery Backup Power Switch
   type SUPC_BBPS_Register is record
      --  Battery Backup Configuration
      CONF          : BBPS_CONFSelect := SAM_SVD.SUPC.BOD33;
      --  unspecified
      Reserved_1_1  : HAL.Bit := 16#0#;
      --  Wake Enable
      WAKEEN        : Boolean := False;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_BBPS_Register use record
      CONF          at 0 range 0 .. 0;
      Reserved_1_1  at 0 range 1 .. 1;
      WAKEEN        at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  SUPC_BKOUT_ENOUT array
   type SUPC_BKOUT_ENOUT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SUPC_BKOUT_ENOUT
   type SUPC_BKOUT_ENOUT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ENOUT as a value
            Val : HAL.UInt2;
         when True =>
            --  ENOUT as an array
            Arr : SUPC_BKOUT_ENOUT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SUPC_BKOUT_ENOUT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  SUPC_BKOUT_CLROUT array
   type SUPC_BKOUT_CLROUT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SUPC_BKOUT_CLROUT
   type SUPC_BKOUT_CLROUT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLROUT as a value
            Val : HAL.UInt2;
         when True =>
            --  CLROUT as an array
            Arr : SUPC_BKOUT_CLROUT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SUPC_BKOUT_CLROUT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  SUPC_BKOUT_SETOUT array
   type SUPC_BKOUT_SETOUT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SUPC_BKOUT_SETOUT
   type SUPC_BKOUT_SETOUT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SETOUT as a value
            Val : HAL.UInt2;
         when True =>
            --  SETOUT as an array
            Arr : SUPC_BKOUT_SETOUT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SUPC_BKOUT_SETOUT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  SUPC_BKOUT_RTCTGLOUT array
   type SUPC_BKOUT_RTCTGLOUT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SUPC_BKOUT_RTCTGLOUT
   type SUPC_BKOUT_RTCTGLOUT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RTCTGLOUT as a value
            Val : HAL.UInt2;
         when True =>
            --  RTCTGLOUT as an array
            Arr : SUPC_BKOUT_RTCTGLOUT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SUPC_BKOUT_RTCTGLOUT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Backup Output Control
   type SUPC_BKOUT_Register is record
      --  Enable OUT0
      ENOUT          : SUPC_BKOUT_ENOUT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      --  Clear OUT0
      CLROUT         : SUPC_BKOUT_CLROUT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  Set OUT0
      SETOUT         : SUPC_BKOUT_SETOUT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_23 : HAL.UInt6 := 16#0#;
      --  RTC Toggle OUT0
      RTCTGLOUT      : SUPC_BKOUT_RTCTGLOUT_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_BKOUT_Register use record
      ENOUT          at 0 range 0 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      CLROUT         at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SETOUT         at 0 range 16 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      RTCTGLOUT      at 0 range 24 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   --  SUPC_BKIN_BKIN array
   type SUPC_BKIN_BKIN_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SUPC_BKIN_BKIN
   type SUPC_BKIN_BKIN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BKIN as a value
            Val : HAL.UInt2;
         when True =>
            --  BKIN as an array
            Arr : SUPC_BKIN_BKIN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SUPC_BKIN_BKIN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Backup Input Control
   type SUPC_BKIN_Register is record
      --  Read-only. Backup Input 0
      BKIN          : SUPC_BKIN_BKIN_Field;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SUPC_BKIN_Register use record
      BKIN          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Supply Controller
   type SUPC_Peripheral is record
      --  Interrupt Enable Clear
      INTENCLR : aliased SUPC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased SUPC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased SUPC_INTFLAG_Register;
      --  Power and Clocks Status
      STATUS   : aliased SUPC_STATUS_Register;
      --  BOD33 Control
      BOD33    : aliased SUPC_BOD33_Register;
      --  VREG Control
      VREG     : aliased SUPC_VREG_Register;
      --  VREF Control
      VREF     : aliased SUPC_VREF_Register;
      --  Battery Backup Power Switch
      BBPS     : aliased SUPC_BBPS_Register;
      --  Backup Output Control
      BKOUT    : aliased SUPC_BKOUT_Register;
      --  Backup Input Control
      BKIN     : aliased SUPC_BKIN_Register;
   end record
     with Volatile;

   for SUPC_Peripheral use record
      INTENCLR at 16#0# range 0 .. 31;
      INTENSET at 16#4# range 0 .. 31;
      INTFLAG  at 16#8# range 0 .. 31;
      STATUS   at 16#C# range 0 .. 31;
      BOD33    at 16#10# range 0 .. 31;
      VREG     at 16#18# range 0 .. 31;
      VREF     at 16#1C# range 0 .. 31;
      BBPS     at 16#20# range 0 .. 31;
      BKOUT    at 16#24# range 0 .. 31;
      BKIN     at 16#28# range 0 .. 31;
   end record;

   --  Supply Controller
   SUPC_Periph : aliased SUPC_Peripheral
     with Import, Address => SUPC_Base;

end SAM_SVD.SUPC;
