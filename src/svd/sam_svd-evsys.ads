pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.EVSYS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type EVSYS_CTRLA_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  EVSYS_SWEVT_CHANNEL array
   type EVSYS_SWEVT_CHANNEL_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   --  Software Event
   type EVSYS_SWEVT_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHANNEL as a value
            Val : HAL.UInt32;
         when True =>
            --  CHANNEL as an array
            Arr : EVSYS_SWEVT_CHANNEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_SWEVT_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype EVSYS_PRICTRL_PRI_Field is HAL.UInt4;

   --  Priority Control
   type EVSYS_PRICTRL_Register is record
      --  Channel Priority Number
      PRI          : EVSYS_PRICTRL_PRI_Field := 16#0#;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Round-Robin Scheduling Enable
      RREN         : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EVSYS_PRICTRL_Register use record
      PRI          at 0 range 0 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      RREN         at 0 range 7 .. 7;
   end record;

   subtype EVSYS_INTPEND_ID_Field is HAL.UInt4;

   --  Channel Pending Interrupt
   type EVSYS_INTPEND_Register is record
      --  Channel ID
      ID             : EVSYS_INTPEND_ID_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Channel Overrun
      OVR            : Boolean := False;
      --  Channel Event Detected
      EVD            : Boolean := False;
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      --  Ready
      READY          : Boolean := True;
      --  Busy
      BUSY           : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EVSYS_INTPEND_Register use record
      ID             at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      OVR            at 0 range 8 .. 8;
      EVD            at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      READY          at 0 range 14 .. 14;
      BUSY           at 0 range 15 .. 15;
   end record;

   --  EVSYS_INTSTATUS_CHINT array
   type EVSYS_INTSTATUS_CHINT_Field_Array is array (0 .. 11) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for EVSYS_INTSTATUS_CHINT
   type EVSYS_INTSTATUS_CHINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHINT as a value
            Val : HAL.UInt12;
         when True =>
            --  CHINT as an array
            Arr : EVSYS_INTSTATUS_CHINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for EVSYS_INTSTATUS_CHINT_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Interrupt Status
   type EVSYS_INTSTATUS_Register is record
      --  Read-only. Channel 0 Pending Interrupt
      CHINT          : EVSYS_INTSTATUS_CHINT_Field;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_INTSTATUS_Register use record
      CHINT          at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  EVSYS_BUSYCH_BUSYCH array
   type EVSYS_BUSYCH_BUSYCH_Field_Array is array (0 .. 11) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for EVSYS_BUSYCH_BUSYCH
   type EVSYS_BUSYCH_BUSYCH_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BUSYCH as a value
            Val : HAL.UInt12;
         when True =>
            --  BUSYCH as an array
            Arr : EVSYS_BUSYCH_BUSYCH_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for EVSYS_BUSYCH_BUSYCH_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Busy Channels
   type EVSYS_BUSYCH_Register is record
      --  Read-only. Busy Channel 0
      BUSYCH         : EVSYS_BUSYCH_BUSYCH_Field;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_BUSYCH_Register use record
      BUSYCH         at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  EVSYS_READYUSR_READYUSR array
   type EVSYS_READYUSR_READYUSR_Field_Array is array (0 .. 11) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for EVSYS_READYUSR_READYUSR
   type EVSYS_READYUSR_READYUSR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  READYUSR as a value
            Val : HAL.UInt12;
         when True =>
            --  READYUSR as an array
            Arr : EVSYS_READYUSR_READYUSR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for EVSYS_READYUSR_READYUSR_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   --  Ready Users
   type EVSYS_READYUSR_Register is record
      --  Read-only. Ready User for Channel 0
      READYUSR       : EVSYS_READYUSR_READYUSR_Field;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_READYUSR_Register use record
      READYUSR       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   ---------------------------------------
   -- EVSYS_CHANNEL cluster's Registers --
   ---------------------------------------

   subtype EVSYS_CHANNEL_EVSYS_CHANNEL_EVGEN_Field is HAL.UInt7;

   --  Path Selection
   type CHANNEL_PATHSelect is
     (--  Synchronous path
      SYNCHRONOUS,
      --  Resynchronized path
      RESYNCHRONIZED,
      --  Asynchronous path
      ASYNCHRONOUS)
     with Size => 2;
   for CHANNEL_PATHSelect use
     (SYNCHRONOUS => 0,
      RESYNCHRONIZED => 1,
      ASYNCHRONOUS => 2);

   --  Edge Detection Selection
   type CHANNEL_EDGSELSelect is
     (--  No event output when using the resynchronized or synchronous path
      NO_EVT_OUTPUT,
      --  Event detection only on the rising edge of the signal from the event
--  generator when using the resynchronized or synchronous path
      RISING_EDGE,
      --  Event detection only on the falling edge of the signal from the event
--  generator when using the resynchronized or synchronous path
      FALLING_EDGE,
      --  Event detection on rising and falling edges of the signal from the event
--  generator when using the resynchronized or synchronous path
      BOTH_EDGES)
     with Size => 2;
   for CHANNEL_EDGSELSelect use
     (NO_EVT_OUTPUT => 0,
      RISING_EDGE => 1,
      FALLING_EDGE => 2,
      BOTH_EDGES => 3);

   --  Channel n Control
   type EVSYS_CHANNEL_EVSYS_CHANNEL_Register is record
      --  Event Generator Selection
      EVGEN          : EVSYS_CHANNEL_EVSYS_CHANNEL_EVGEN_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Path Selection
      PATH           : CHANNEL_PATHSelect := SAM_SVD.EVSYS.SYNCHRONOUS;
      --  Edge Detection Selection
      EDGSEL         : CHANNEL_EDGSELSelect := SAM_SVD.EVSYS.NO_EVT_OUTPUT;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  Run in standby
      RUNSTDBY       : Boolean := False;
      --  Generic Clock On Demand
      ONDEMAND       : Boolean := True;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CHANNEL_EVSYS_CHANNEL_Register use record
      EVGEN          at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PATH           at 0 range 8 .. 9;
      EDGSEL         at 0 range 10 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      RUNSTDBY       at 0 range 14 .. 14;
      ONDEMAND       at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Channel n Interrupt Enable Clear
   type EVSYS_CHINTENCLR_EVSYS_CHANNEL_Register is record
      --  Channel Overrun Interrupt Disable
      OVR          : Boolean := False;
      --  Channel Event Detected Interrupt Disable
      EVD          : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CHINTENCLR_EVSYS_CHANNEL_Register use record
      OVR          at 0 range 0 .. 0;
      EVD          at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Channel n Interrupt Enable Set
   type EVSYS_CHINTENSET_EVSYS_CHANNEL_Register is record
      --  Channel Overrun Interrupt Enable
      OVR          : Boolean := False;
      --  Channel Event Detected Interrupt Enable
      EVD          : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CHINTENSET_EVSYS_CHANNEL_Register use record
      OVR          at 0 range 0 .. 0;
      EVD          at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Channel n Interrupt Flag Status and Clear
   type EVSYS_CHINTFLAG_EVSYS_CHANNEL_Register is record
      --  Channel Overrun
      OVR          : Boolean := False;
      --  Channel Event Detected
      EVD          : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CHINTFLAG_EVSYS_CHANNEL_Register use record
      OVR          at 0 range 0 .. 0;
      EVD          at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Channel n Status
   type EVSYS_CHSTATUS_EVSYS_CHANNEL_Register is record
      --  Read-only. Ready User
      RDYUSR       : Boolean;
      --  Read-only. Busy Channel
      BUSYCH       : Boolean;
      --  unspecified
      Reserved_2_7 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EVSYS_CHSTATUS_EVSYS_CHANNEL_Register use record
      RDYUSR       at 0 range 0 .. 0;
      BUSYCH       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   type EVSYS_CHANNEL_Cluster is record
      --  Channel n Control
      CHANNEL    : aliased EVSYS_CHANNEL_EVSYS_CHANNEL_Register;
      --  Channel n Interrupt Enable Clear
      CHINTENCLR : aliased EVSYS_CHINTENCLR_EVSYS_CHANNEL_Register;
      --  Channel n Interrupt Enable Set
      CHINTENSET : aliased EVSYS_CHINTENSET_EVSYS_CHANNEL_Register;
      --  Channel n Interrupt Flag Status and Clear
      CHINTFLAG  : aliased EVSYS_CHINTFLAG_EVSYS_CHANNEL_Register;
      --  Channel n Status
      CHSTATUS   : aliased EVSYS_CHSTATUS_EVSYS_CHANNEL_Register;
   end record
     with Size => 64;

   for EVSYS_CHANNEL_Cluster use record
      CHANNEL    at 16#0# range 0 .. 31;
      CHINTENCLR at 16#4# range 0 .. 7;
      CHINTENSET at 16#5# range 0 .. 7;
      CHINTFLAG  at 16#6# range 0 .. 7;
      CHSTATUS   at 16#7# range 0 .. 7;
   end record;

   type EVSYS_CHANNEL_Clusters is array (0 .. 31) of EVSYS_CHANNEL_Cluster;

   subtype EVSYS_USER_CHANNEL_Field is HAL.UInt6;

   --  User Multiplexer n
   type EVSYS_USER_Register is record
      --  Channel Event Selection
      CHANNEL       : EVSYS_USER_CHANNEL_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EVSYS_USER_Register use record
      CHANNEL       at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  User Multiplexer n
   type EVSYS_USER_Registers is array (0 .. 66) of EVSYS_USER_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  Event System Interface
   type EVSYS_Peripheral is record
      --  Control
      CTRLA         : aliased EVSYS_CTRLA_Register;
      --  Software Event
      SWEVT         : aliased EVSYS_SWEVT_Register;
      --  Priority Control
      PRICTRL       : aliased EVSYS_PRICTRL_Register;
      --  Channel Pending Interrupt
      INTPEND       : aliased EVSYS_INTPEND_Register;
      --  Interrupt Status
      INTSTATUS     : aliased EVSYS_INTSTATUS_Register;
      --  Busy Channels
      BUSYCH        : aliased EVSYS_BUSYCH_Register;
      --  Ready Users
      READYUSR      : aliased EVSYS_READYUSR_Register;
      EVSYS_CHANNEL : aliased EVSYS_CHANNEL_Clusters;
      --  User Multiplexer n
      USER          : aliased EVSYS_USER_Registers;
   end record
     with Volatile;

   for EVSYS_Peripheral use record
      CTRLA         at 16#0# range 0 .. 7;
      SWEVT         at 16#4# range 0 .. 31;
      PRICTRL       at 16#8# range 0 .. 7;
      INTPEND       at 16#10# range 0 .. 15;
      INTSTATUS     at 16#14# range 0 .. 31;
      BUSYCH        at 16#18# range 0 .. 31;
      READYUSR      at 16#1C# range 0 .. 31;
      EVSYS_CHANNEL at 16#20# range 0 .. 2047;
      USER          at 16#120# range 0 .. 2143;
   end record;

   --  Event System Interface
   EVSYS_Periph : aliased EVSYS_Peripheral
     with Import, Address => EVSYS_Base;

end SAM_SVD.EVSYS;
