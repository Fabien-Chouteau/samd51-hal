pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.ITM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  ITM Stimulus Port Registers

   --  ITM Stimulus Port Registers
   type ITM_PORT_WORD_MODE_Registers is array (0 .. 31) of HAL.UInt32;

   subtype ITM_PORT_BYTE_MODE_PORT_Field is HAL.UInt8;

   --  ITM Stimulus Port Registers
   type ITM_PORT_BYTE_MODE_Register is record
      --  Write-only.
      PORT          : ITM_PORT_BYTE_MODE_PORT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_PORT_BYTE_MODE_Register use record
      PORT          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  ITM Stimulus Port Registers
   type ITM_PORT_BYTE_MODE_Registers is array (0 .. 31)
     of ITM_PORT_BYTE_MODE_Register;

   subtype ITM_PORT_HWORD_MODE_PORT_Field is HAL.UInt16;

   --  ITM Stimulus Port Registers
   type ITM_PORT_HWORD_MODE_Register is record
      --  Write-only.
      PORT           : ITM_PORT_HWORD_MODE_PORT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_PORT_HWORD_MODE_Register use record
      PORT           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  ITM Stimulus Port Registers
   type ITM_PORT_HWORD_MODE_Registers is array (0 .. 31)
     of ITM_PORT_HWORD_MODE_Register;

   subtype ITM_TPR_PRIVMASK_Field is HAL.UInt4;

   --  ITM Trace Privilege Register
   type ITM_TPR_Register is record
      PRIVMASK      : ITM_TPR_PRIVMASK_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_TPR_Register use record
      PRIVMASK      at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ITM_TCR_TSPrescale_Field is HAL.UInt2;
   subtype ITM_TCR_GTSFREQ_Field is HAL.UInt2;
   subtype ITM_TCR_TraceBusID_Field is HAL.UInt7;

   --  ITM Trace Control Register
   type ITM_TCR_Register is record
      ITMENA         : Boolean := False;
      TSENA          : Boolean := False;
      SYNCENA        : Boolean := False;
      DWTENA         : Boolean := False;
      SWOENA         : Boolean := False;
      STALLENA       : Boolean := False;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      TSPrescale     : ITM_TCR_TSPrescale_Field := 16#0#;
      GTSFREQ        : ITM_TCR_GTSFREQ_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      TraceBusID     : ITM_TCR_TraceBusID_Field := 16#0#;
      BUSY           : Boolean := False;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_TCR_Register use record
      ITMENA         at 0 range 0 .. 0;
      TSENA          at 0 range 1 .. 1;
      SYNCENA        at 0 range 2 .. 2;
      DWTENA         at 0 range 3 .. 3;
      SWOENA         at 0 range 4 .. 4;
      STALLENA       at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      TSPrescale     at 0 range 8 .. 9;
      GTSFREQ        at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TraceBusID     at 0 range 16 .. 22;
      BUSY           at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  ITM Integration Write Register
   type ITM_IWR_Register is record
      --  Write-only.
      ATVALIDM      : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_IWR_Register use record
      ATVALIDM      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  ITM Integration Read Register
   type ITM_IRR_Register is record
      --  Read-only.
      ATREADYM      : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_IRR_Register use record
      ATREADYM      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type ITM_Disc is
     (WORD_MODE,
      BYTE_MODE,
      HWORD_MODE);

   --  Instrumentation Trace Macrocell
   type ITM_Peripheral
     (Discriminent : ITM_Disc := WORD_MODE)
   is record
      --  ITM Trace Enable Register
      TER             : aliased HAL.UInt32;
      --  ITM Trace Privilege Register
      TPR             : aliased ITM_TPR_Register;
      --  ITM Trace Control Register
      TCR             : aliased ITM_TCR_Register;
      --  ITM Integration Write Register
      IWR             : aliased ITM_IWR_Register;
      --  ITM Integration Read Register
      IRR             : aliased ITM_IRR_Register;
      case Discriminent is
         when WORD_MODE =>
            --  ITM Stimulus Port Registers
            PORT_WORD_MODE : aliased ITM_PORT_WORD_MODE_Registers;
         when BYTE_MODE =>
            --  ITM Stimulus Port Registers
            PORT_BYTE_MODE : aliased ITM_PORT_BYTE_MODE_Registers;
         when HWORD_MODE =>
            --  ITM Stimulus Port Registers
            PORT_HWORD_MODE : aliased ITM_PORT_HWORD_MODE_Registers;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for ITM_Peripheral use record
      TER             at 16#E00# range 0 .. 31;
      TPR             at 16#E40# range 0 .. 31;
      TCR             at 16#E80# range 0 .. 31;
      IWR             at 16#EF8# range 0 .. 31;
      IRR             at 16#EFC# range 0 .. 31;
      PORT_WORD_MODE  at 16#0# range 0 .. 1023;
      PORT_BYTE_MODE  at 16#0# range 0 .. 1023;
      PORT_HWORD_MODE at 16#0# range 0 .. 1023;
   end record;

   --  Instrumentation Trace Macrocell
   ITM_Periph : aliased ITM_Peripheral
     with Import, Address => ITM_Base;

end SAM_SVD.ITM;
