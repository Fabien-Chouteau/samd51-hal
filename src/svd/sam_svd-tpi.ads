pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.TPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype TPI_ACPR_PRESCALER_Field is HAL.UInt13;

   --  Asynchronous Clock Prescaler Register
   type TPI_ACPR_Register is record
      PRESCALER      : TPI_ACPR_PRESCALER_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_ACPR_Register use record
      PRESCALER      at 0 range 0 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype TPI_SPPR_TXMODE_Field is HAL.UInt2;

   --  Selected Pin Protocol Register
   type TPI_SPPR_Register is record
      TXMODE        : TPI_SPPR_TXMODE_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_SPPR_Register use record
      TXMODE        at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Formatter and Flush Status Register
   type TPI_FFSR_Register is record
      --  Read-only.
      FlInProg      : Boolean;
      --  Read-only.
      FtStopped     : Boolean;
      --  Read-only.
      TCPresent     : Boolean;
      --  Read-only.
      FtNonStop     : Boolean;
      --  unspecified
      Reserved_4_31 : HAL.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_FFSR_Register use record
      FlInProg      at 0 range 0 .. 0;
      FtStopped     at 0 range 1 .. 1;
      TCPresent     at 0 range 2 .. 2;
      FtNonStop     at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Formatter and Flush Control Register
   type TPI_FFCR_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      EnFCont       : Boolean := False;
      --  unspecified
      Reserved_2_7  : HAL.UInt6 := 16#0#;
      TrigIn        : Boolean := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_FFCR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      EnFCont       at 0 range 1 .. 1;
      Reserved_2_7  at 0 range 2 .. 7;
      TrigIn        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  TRIGGER
   type TPI_TRIGGER_Register is record
      --  Read-only.
      TRIGGER       : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_TRIGGER_Register use record
      TRIGGER       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  TPI_FIFO0_ETM array element
   subtype TPI_FIFO0_ETM_Element is HAL.UInt8;

   --  TPI_FIFO0_ETM array
   type TPI_FIFO0_ETM_Field_Array is array (0 .. 2) of TPI_FIFO0_ETM_Element
     with Component_Size => 8, Size => 24;

   --  Type definition for TPI_FIFO0_ETM
   type TPI_FIFO0_ETM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ETM as a value
            Val : HAL.UInt24;
         when True =>
            --  ETM as an array
            Arr : TPI_FIFO0_ETM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 24;

   for TPI_FIFO0_ETM_Field use record
      Val at 0 range 0 .. 23;
      Arr at 0 range 0 .. 23;
   end record;

   subtype TPI_FIFO0_ETM_bytecount_Field is HAL.UInt2;
   subtype TPI_FIFO0_ITM_bytecount_Field is HAL.UInt2;

   --  Integration ETM Data
   type TPI_FIFO0_Register is record
      --  Read-only.
      ETM            : TPI_FIFO0_ETM_Field;
      --  Read-only.
      ETM_bytecount  : TPI_FIFO0_ETM_bytecount_Field;
      --  Read-only.
      ETM_ATVALID    : Boolean;
      --  Read-only.
      ITM_bytecount  : TPI_FIFO0_ITM_bytecount_Field;
      --  Read-only.
      ITM_ATVALID    : Boolean;
      --  unspecified
      Reserved_30_31 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_FIFO0_Register use record
      ETM            at 0 range 0 .. 23;
      ETM_bytecount  at 0 range 24 .. 25;
      ETM_ATVALID    at 0 range 26 .. 26;
      ITM_bytecount  at 0 range 27 .. 28;
      ITM_ATVALID    at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  ITATBCTR2
   type ITATBCTR_Register is record
      --  Read-only.
      ATREADY       : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITATBCTR_Register use record
      ATREADY       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  TPI_FIFO1_ITM array element
   subtype TPI_FIFO1_ITM_Element is HAL.UInt8;

   --  TPI_FIFO1_ITM array
   type TPI_FIFO1_ITM_Field_Array is array (0 .. 2) of TPI_FIFO1_ITM_Element
     with Component_Size => 8, Size => 24;

   --  Type definition for TPI_FIFO1_ITM
   type TPI_FIFO1_ITM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ITM as a value
            Val : HAL.UInt24;
         when True =>
            --  ITM as an array
            Arr : TPI_FIFO1_ITM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 24;

   for TPI_FIFO1_ITM_Field use record
      Val at 0 range 0 .. 23;
      Arr at 0 range 0 .. 23;
   end record;

   subtype TPI_FIFO1_ETM_bytecount_Field is HAL.UInt2;
   subtype TPI_FIFO1_ITM_bytecount_Field is HAL.UInt2;

   --  Integration ITM Data
   type TPI_FIFO1_Register is record
      --  Read-only.
      ITM            : TPI_FIFO1_ITM_Field;
      --  Read-only.
      ETM_bytecount  : TPI_FIFO1_ETM_bytecount_Field;
      --  Read-only.
      ETM_ATVALID    : Boolean;
      --  Read-only.
      ITM_bytecount  : TPI_FIFO1_ITM_bytecount_Field;
      --  Read-only.
      ITM_ATVALID    : Boolean;
      --  unspecified
      Reserved_30_31 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_FIFO1_Register use record
      ITM            at 0 range 0 .. 23;
      ETM_bytecount  at 0 range 24 .. 25;
      ETM_ATVALID    at 0 range 26 .. 26;
      ITM_bytecount  at 0 range 27 .. 28;
      ITM_ATVALID    at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  Integration Mode Control
   type TPI_ITCTRL_Register is record
      Mode          : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_ITCTRL_Register use record
      Mode          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype TPI_DEVID_MinBufSz_Field is HAL.UInt3;

   --  TPIU_DEVID
   type TPI_DEVID_Register is record
      --  Read-only.
      NrTraceInput   : Boolean;
      --  unspecified
      Reserved_1_4   : HAL.UInt4;
      --  Read-only.
      AsynClkIn      : Boolean;
      --  Read-only.
      MinBufSz       : TPI_DEVID_MinBufSz_Field;
      --  Read-only.
      PTINVALID      : Boolean;
      --  Read-only.
      MANCVALID      : Boolean;
      --  Read-only.
      NRZVALID       : Boolean;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_DEVID_Register use record
      NrTraceInput   at 0 range 0 .. 0;
      Reserved_1_4   at 0 range 1 .. 4;
      AsynClkIn      at 0 range 5 .. 5;
      MinBufSz       at 0 range 6 .. 8;
      PTINVALID      at 0 range 9 .. 9;
      MANCVALID      at 0 range 10 .. 10;
      NRZVALID       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype TPI_DEVTYPE_SubType_Field is HAL.UInt4;
   subtype TPI_DEVTYPE_MajorType_Field is HAL.UInt4;

   --  TPIU_DEVTYPE
   type TPI_DEVTYPE_Register is record
      --  Read-only.
      SubType_k     : TPI_DEVTYPE_SubType_Field;
      --  Read-only.
      MajorType     : TPI_DEVTYPE_MajorType_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TPI_DEVTYPE_Register use record
      SubType_k     at 0 range 0 .. 3;
      MajorType     at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Trace Port Interface Register
   type TPI_Peripheral is record
      --  Supported Parallel Port Size Register
      SSPSR     : aliased HAL.UInt32;
      --  Current Parallel Port Size Register
      CSPSR     : aliased HAL.UInt32;
      --  Asynchronous Clock Prescaler Register
      ACPR      : aliased TPI_ACPR_Register;
      --  Selected Pin Protocol Register
      SPPR      : aliased TPI_SPPR_Register;
      --  Formatter and Flush Status Register
      FFSR      : aliased TPI_FFSR_Register;
      --  Formatter and Flush Control Register
      FFCR      : aliased TPI_FFCR_Register;
      --  Formatter Synchronization Counter Register
      FSCR      : aliased HAL.UInt32;
      --  TRIGGER
      TRIGGER   : aliased TPI_TRIGGER_Register;
      --  Integration ETM Data
      FIFO0     : aliased TPI_FIFO0_Register;
      --  ITATBCTR2
      ITATBCTR2 : aliased ITATBCTR_Register;
      --  ITATBCTR0
      ITATBCTR0 : aliased ITATBCTR_Register;
      --  Integration ITM Data
      FIFO1     : aliased TPI_FIFO1_Register;
      --  Integration Mode Control
      ITCTRL    : aliased TPI_ITCTRL_Register;
      --  Claim tag set
      CLAIMSET  : aliased HAL.UInt32;
      --  Claim tag clear
      CLAIMCLR  : aliased HAL.UInt32;
      --  TPIU_DEVID
      DEVID     : aliased TPI_DEVID_Register;
      --  TPIU_DEVTYPE
      DEVTYPE   : aliased TPI_DEVTYPE_Register;
   end record
     with Volatile;

   for TPI_Peripheral use record
      SSPSR     at 16#0# range 0 .. 31;
      CSPSR     at 16#4# range 0 .. 31;
      ACPR      at 16#10# range 0 .. 31;
      SPPR      at 16#F0# range 0 .. 31;
      FFSR      at 16#300# range 0 .. 31;
      FFCR      at 16#304# range 0 .. 31;
      FSCR      at 16#308# range 0 .. 31;
      TRIGGER   at 16#EE8# range 0 .. 31;
      FIFO0     at 16#EEC# range 0 .. 31;
      ITATBCTR2 at 16#EF0# range 0 .. 31;
      ITATBCTR0 at 16#EF8# range 0 .. 31;
      FIFO1     at 16#EFC# range 0 .. 31;
      ITCTRL    at 16#F00# range 0 .. 31;
      CLAIMSET  at 16#FA0# range 0 .. 31;
      CLAIMCLR  at 16#FA4# range 0 .. 31;
      DEVID     at 16#FC8# range 0 .. 31;
      DEVTYPE   at 16#FCC# range 0 .. 31;
   end record;

   --  Trace Port Interface Register
   TPI_Periph : aliased TPI_Peripheral
     with Import, Address => TPI_Base;

end SAM_SVD.TPI;
