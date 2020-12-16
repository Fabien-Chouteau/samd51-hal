pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.QSPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control A
   type QSPI_CTRLA_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_2_23  : HAL.UInt22 := 16#0#;
      --  Last Transfer
      LASTXFER       : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_CTRLA_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      Reserved_2_23  at 0 range 2 .. 23;
      LASTXFER       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  Serial Memory Mode
   type CTRLB_MODESelect is
     (--  SPI operating mode
      SPI,
      --  Serial Memory operating mode
      MEMORY)
     with Size => 1;
   for CTRLB_MODESelect use
     (SPI => 0,
      MEMORY => 1);

   --  Chip Select Mode
   type CTRLB_CSMODESelect is
     (--  The chip select is deasserted if TD has not been reloaded before the end of
--  the current transfer.
      NORELOAD,
      --  The chip select is deasserted when the bit LASTXFER is written at 1 and the
--  character written in TD has been transferred.
      LASTXFER,
      --  The chip select is deasserted systematically after each transfer.
      SYSTEMATICALLY)
     with Size => 2;
   for CTRLB_CSMODESelect use
     (NORELOAD => 0,
      LASTXFER => 1,
      SYSTEMATICALLY => 2);

   --  Data Length
   type CTRLB_DATALENSelect is
     (--  8-bits transfer
      Val_8BITS,
      --  9 bits transfer
      Val_9BITS,
      --  10-bits transfer
      Val_10BITS,
      --  11-bits transfer
      Val_11BITS,
      --  12-bits transfer
      Val_12BITS,
      --  13-bits transfer
      Val_13BITS,
      --  14-bits transfer
      Val_14BITS,
      --  15-bits transfer
      Val_15BITS,
      --  16-bits transfer
      Val_16BITS)
     with Size => 4;
   for CTRLB_DATALENSelect use
     (Val_8BITS => 0,
      Val_9BITS => 1,
      Val_10BITS => 2,
      Val_11BITS => 3,
      Val_12BITS => 4,
      Val_13BITS => 5,
      Val_14BITS => 6,
      Val_15BITS => 7,
      Val_16BITS => 8);

   subtype QSPI_CTRLB_DLYBCT_Field is HAL.UInt8;
   subtype QSPI_CTRLB_DLYCS_Field is HAL.UInt8;

   --  Control B
   type QSPI_CTRLB_Register is record
      --  Serial Memory Mode
      MODE           : CTRLB_MODESelect := SAM_SVD.QSPI.SPI;
      --  Local Loopback Enable
      LOOPEN         : Boolean := False;
      --  Wait Data Read Before Transfer
      WDRBT          : Boolean := False;
      --  Serial Memory reg
      SMEMREG        : Boolean := False;
      --  Chip Select Mode
      CSMODE         : CTRLB_CSMODESelect := SAM_SVD.QSPI.NORELOAD;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Data Length
      DATALEN        : CTRLB_DATALENSelect := SAM_SVD.QSPI.Val_8BITS;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Delay Between Consecutive Transfers
      DLYBCT         : QSPI_CTRLB_DLYBCT_Field := 16#0#;
      --  Minimum Inactive CS Delay
      DLYCS          : QSPI_CTRLB_DLYCS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_CTRLB_Register use record
      MODE           at 0 range 0 .. 0;
      LOOPEN         at 0 range 1 .. 1;
      WDRBT          at 0 range 2 .. 2;
      SMEMREG        at 0 range 3 .. 3;
      CSMODE         at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      DATALEN        at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DLYBCT         at 0 range 16 .. 23;
      DLYCS          at 0 range 24 .. 31;
   end record;

   subtype QSPI_BAUD_BAUD_Field is HAL.UInt8;
   subtype QSPI_BAUD_DLYBS_Field is HAL.UInt8;

   --  Baud Rate
   type QSPI_BAUD_Register is record
      --  Clock Polarity
      CPOL           : Boolean := False;
      --  Clock Phase
      CPHA           : Boolean := False;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      --  Serial Clock Baud Rate
      BAUD           : QSPI_BAUD_BAUD_Field := 16#0#;
      --  Delay Before SCK
      DLYBS          : QSPI_BAUD_DLYBS_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_BAUD_Register use record
      CPOL           at 0 range 0 .. 0;
      CPHA           at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      BAUD           at 0 range 8 .. 15;
      DLYBS          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype QSPI_RXDATA_DATA_Field is HAL.UInt16;

   --  Receive Data
   type QSPI_RXDATA_Register is record
      --  Read-only. Receive Data
      DATA           : QSPI_RXDATA_DATA_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_RXDATA_Register use record
      DATA           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype QSPI_TXDATA_DATA_Field is HAL.UInt16;

   --  Transmit Data
   type QSPI_TXDATA_Register is record
      --  Write-only. Transmit Data
      DATA           : QSPI_TXDATA_DATA_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_TXDATA_Register use record
      DATA           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Interrupt Enable Clear
   type QSPI_INTENCLR_Register is record
      --  Receive Data Register Full Interrupt Disable
      RXC            : Boolean := False;
      --  Transmit Data Register Empty Interrupt Disable
      DRE            : Boolean := False;
      --  Transmission Complete Interrupt Disable
      TXC            : Boolean := False;
      --  Overrun Error Interrupt Disable
      ERROR          : Boolean := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Chip Select Rise Interrupt Disable
      CSRISE         : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Instruction End Interrupt Disable
      INSTREND       : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_INTENCLR_Register use record
      RXC            at 0 range 0 .. 0;
      DRE            at 0 range 1 .. 1;
      TXC            at 0 range 2 .. 2;
      ERROR          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CSRISE         at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      INSTREND       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Interrupt Enable Set
   type QSPI_INTENSET_Register is record
      --  Receive Data Register Full Interrupt Enable
      RXC            : Boolean := False;
      --  Transmit Data Register Empty Interrupt Enable
      DRE            : Boolean := False;
      --  Transmission Complete Interrupt Enable
      TXC            : Boolean := False;
      --  Overrun Error Interrupt Enable
      ERROR          : Boolean := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Chip Select Rise Interrupt Enable
      CSRISE         : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Instruction End Interrupt Enable
      INSTREND       : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_INTENSET_Register use record
      RXC            at 0 range 0 .. 0;
      DRE            at 0 range 1 .. 1;
      TXC            at 0 range 2 .. 2;
      ERROR          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CSRISE         at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      INSTREND       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Interrupt Flag Status and Clear
   type QSPI_INTFLAG_Register is record
      --  Receive Data Register Full
      RXC            : Boolean := False;
      --  Transmit Data Register Empty
      DRE            : Boolean := False;
      --  Transmission Complete
      TXC            : Boolean := False;
      --  Overrun Error
      ERROR          : Boolean := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Chip Select Rise
      CSRISE         : Boolean := False;
      --  unspecified
      Reserved_9_9   : HAL.Bit := 16#0#;
      --  Instruction End
      INSTREND       : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_INTFLAG_Register use record
      RXC            at 0 range 0 .. 0;
      DRE            at 0 range 1 .. 1;
      TXC            at 0 range 2 .. 2;
      ERROR          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      CSRISE         at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      INSTREND       at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  Status Register
   type QSPI_STATUS_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit;
      --  Read-only. Enable
      ENABLE         : Boolean;
      --  unspecified
      Reserved_2_8   : HAL.UInt7;
      --  Read-only. Chip Select
      CSSTATUS       : Boolean;
      --  unspecified
      Reserved_10_31 : HAL.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_STATUS_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      Reserved_2_8   at 0 range 2 .. 8;
      CSSTATUS       at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype QSPI_INSTRCTRL_INSTR_Field is HAL.UInt8;
   subtype QSPI_INSTRCTRL_OPTCODE_Field is HAL.UInt8;

   --  Instruction Code
   type QSPI_INSTRCTRL_Register is record
      --  Instruction Code
      INSTR          : QSPI_INSTRCTRL_INSTR_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Option Code
      OPTCODE        : QSPI_INSTRCTRL_OPTCODE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_INSTRCTRL_Register use record
      INSTR          at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OPTCODE        at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Instruction Code, Address, Option Code and Data Width
   type INSTRFRAME_WIDTHSelect is
     (--  Instruction: Single-bit SPI / Address-Option: Single-bit SPI / Data:
--  Single-bit SPI
      SINGLE_BIT_SPI,
      --  Instruction: Single-bit SPI / Address-Option: Single-bit SPI / Data: Dual
--  SPI
      DUAL_OUTPUT,
      --  Instruction: Single-bit SPI / Address-Option: Single-bit SPI / Data: Quad
--  SPI
      QUAD_OUTPUT,
      --  Instruction: Single-bit SPI / Address-Option: Dual SPI / Data: Dual SPI
      DUAL_IO,
      --  Instruction: Single-bit SPI / Address-Option: Quad SPI / Data: Quad SPI
      QUAD_IO,
      --  Instruction: Dual SPI / Address-Option: Dual SPI / Data: Dual SPI
      DUAL_CMD,
      --  Instruction: Quad SPI / Address-Option: Quad SPI / Data: Quad SPI
      QUAD_CMD)
     with Size => 3;
   for INSTRFRAME_WIDTHSelect use
     (SINGLE_BIT_SPI => 0,
      DUAL_OUTPUT => 1,
      QUAD_OUTPUT => 2,
      DUAL_IO => 3,
      QUAD_IO => 4,
      DUAL_CMD => 5,
      QUAD_CMD => 6);

   --  Option Code Length
   type INSTRFRAME_OPTCODELENSelect is
     (--  1-bit length option code
      Val_1BIT,
      --  2-bits length option code
      Val_2BITS,
      --  4-bits length option code
      Val_4BITS,
      --  8-bits length option code
      Val_8BITS)
     with Size => 2;
   for INSTRFRAME_OPTCODELENSelect use
     (Val_1BIT => 0,
      Val_2BITS => 1,
      Val_4BITS => 2,
      Val_8BITS => 3);

   --  Address Length
   type INSTRFRAME_ADDRLENSelect is
     (--  24-bits address length
      Val_24BITS,
      --  32-bits address length
      Val_32BITS)
     with Size => 1;
   for INSTRFRAME_ADDRLENSelect use
     (Val_24BITS => 0,
      Val_32BITS => 1);

   --  Data Transfer Type
   type INSTRFRAME_TFRTYPESelect is
     (--  Read transfer from the serial memory.Scrambling is not performed.Read at
--  random location (fetch) in the serial flash memory is not possible.
      READ,
      --  Read data transfer from the serial memory.If enabled, scrambling is
--  performed.Read at random location (fetch) in the serial flash memory is
--  possible.
      READMEMORY,
      --  Write transfer into the serial memory.Scrambling is not performed.
      WRITE,
      --  Write data transfer into the serial memory.If enabled, scrambling is
--  performed.
      WRITEMEMORY)
     with Size => 2;
   for INSTRFRAME_TFRTYPESelect use
     (READ => 0,
      READMEMORY => 1,
      WRITE => 2,
      WRITEMEMORY => 3);

   subtype QSPI_INSTRFRAME_DUMMYLEN_Field is HAL.UInt5;

   --  Instruction Frame
   type QSPI_INSTRFRAME_Register is record
      --  Instruction Code, Address, Option Code and Data Width
      WIDTH          : INSTRFRAME_WIDTHSelect := SAM_SVD.QSPI.SINGLE_BIT_SPI;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Instruction Enable
      INSTREN        : Boolean := False;
      --  Address Enable
      ADDREN         : Boolean := False;
      --  Option Enable
      OPTCODEEN      : Boolean := False;
      --  Data Enable
      DATAEN         : Boolean := False;
      --  Option Code Length
      OPTCODELEN     : INSTRFRAME_OPTCODELENSelect := SAM_SVD.QSPI.Val_1BIT;
      --  Address Length
      ADDRLEN        : INSTRFRAME_ADDRLENSelect := SAM_SVD.QSPI.Val_24BITS;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Data Transfer Type
      TFRTYPE        : INSTRFRAME_TFRTYPESelect := SAM_SVD.QSPI.READ;
      --  Continuous Read Mode
      CRMODE         : Boolean := False;
      --  Double Data Rate Enable
      DDREN          : Boolean := False;
      --  Dummy Cycles Length
      DUMMYLEN       : QSPI_INSTRFRAME_DUMMYLEN_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_INSTRFRAME_Register use record
      WIDTH          at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      INSTREN        at 0 range 4 .. 4;
      ADDREN         at 0 range 5 .. 5;
      OPTCODEEN      at 0 range 6 .. 6;
      DATAEN         at 0 range 7 .. 7;
      OPTCODELEN     at 0 range 8 .. 9;
      ADDRLEN        at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      TFRTYPE        at 0 range 12 .. 13;
      CRMODE         at 0 range 14 .. 14;
      DDREN          at 0 range 15 .. 15;
      DUMMYLEN       at 0 range 16 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   --  Scrambling Mode
   type QSPI_SCRAMBCTRL_Register is record
      --  Scrambling/Unscrambling Enable
      ENABLE        : Boolean := False;
      --  Scrambling/Unscrambling Random Value Disable
      RANDOMDIS     : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for QSPI_SCRAMBCTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      RANDOMDIS     at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Quad SPI interface
   type QSPI_Peripheral is record
      --  Control A
      CTRLA      : aliased QSPI_CTRLA_Register;
      --  Control B
      CTRLB      : aliased QSPI_CTRLB_Register;
      --  Baud Rate
      BAUD       : aliased QSPI_BAUD_Register;
      --  Receive Data
      RXDATA     : aliased QSPI_RXDATA_Register;
      --  Transmit Data
      TXDATA     : aliased QSPI_TXDATA_Register;
      --  Interrupt Enable Clear
      INTENCLR   : aliased QSPI_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET   : aliased QSPI_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG    : aliased QSPI_INTFLAG_Register;
      --  Status Register
      STATUS     : aliased QSPI_STATUS_Register;
      --  Instruction Address
      INSTRADDR  : aliased HAL.UInt32;
      --  Instruction Code
      INSTRCTRL  : aliased QSPI_INSTRCTRL_Register;
      --  Instruction Frame
      INSTRFRAME : aliased QSPI_INSTRFRAME_Register;
      --  Scrambling Mode
      SCRAMBCTRL : aliased QSPI_SCRAMBCTRL_Register;
      --  Scrambling Key
      SCRAMBKEY  : aliased HAL.UInt32;
   end record
     with Volatile;

   for QSPI_Peripheral use record
      CTRLA      at 16#0# range 0 .. 31;
      CTRLB      at 16#4# range 0 .. 31;
      BAUD       at 16#8# range 0 .. 31;
      RXDATA     at 16#C# range 0 .. 31;
      TXDATA     at 16#10# range 0 .. 31;
      INTENCLR   at 16#14# range 0 .. 31;
      INTENSET   at 16#18# range 0 .. 31;
      INTFLAG    at 16#1C# range 0 .. 31;
      STATUS     at 16#20# range 0 .. 31;
      INSTRADDR  at 16#30# range 0 .. 31;
      INSTRCTRL  at 16#34# range 0 .. 31;
      INSTRFRAME at 16#38# range 0 .. 31;
      SCRAMBCTRL at 16#40# range 0 .. 31;
      SCRAMBKEY  at 16#44# range 0 .. 31;
   end record;

   --  Quad SPI interface
   QSPI_Periph : aliased QSPI_Peripheral
     with Import, Address => QSPI_Base;

end SAM_SVD.QSPI;
