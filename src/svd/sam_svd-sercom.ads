pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.SERCOM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   --  Operating Mode
   type CTRLA_MODESelect is
     (--  USART with external clock
      USART_EXT_CLK,
      --  USART with internal clock
      USART_INT_CLK,
      --  SPI in slave operation
      SPI_SLAVE,
      --  SPI in master operation
      SPI_MASTER,
      --  I2C slave operation
      I2C_SLAVE,
      --  I2C master operation
      I2C_MASTER)
     with Size => 3;
   for CTRLA_MODESelect use
     (USART_EXT_CLK => 0,
      USART_INT_CLK => 1,
      SPI_SLAVE => 2,
      SPI_MASTER => 3,
      I2C_SLAVE => 4,
      I2C_MASTER => 5);

   --  SDA Hold Time
   type CTRLA_SDAHOLDSelect is
     (--  Disabled
      DISABLE,
      --  50-100ns hold time
      Val_75NS,
      --  300-600ns hold time
      Val_450NS,
      --  400-800ns hold time
      Val_600NS)
     with Size => 2;
   for CTRLA_SDAHOLDSelect use
     (DISABLE => 0,
      Val_75NS => 1,
      Val_450NS => 2,
      Val_600NS => 3);

   --  Transfer Speed
   type CTRLA_SPEEDSelect is
     (--  Standard Mode(Sm) Upto 100kHz and Fast Mode(Fm) Upto 400kHz
      STANDARD_AND_FAST_MODE,
      --  Fast-mode Plus Upto 1MHz
      FASTPLUS_MODE,
      --  High-speed mode Upto 3.4MHz
      HIGH_SPEED_MODE)
     with Size => 2;
   for CTRLA_SPEEDSelect use
     (STANDARD_AND_FAST_MODE => 0,
      FASTPLUS_MODE => 1,
      HIGH_SPEED_MODE => 2);

   --  Inactive Time-Out
   type CTRLA_INACTOUTSelect is
     (--  Disabled
      DISABLE,
      --  5-6 SCL Time-Out(50-60us)
      Val_55US,
      --  10-11 SCL Time-Out(100-110us)
      Val_105US,
      --  20-21 SCL Time-Out(200-210us)
      Val_205US)
     with Size => 2;
   for CTRLA_INACTOUTSelect use
     (DISABLE => 0,
      Val_55US => 1,
      Val_105US => 2,
      Val_205US => 3);

   --  I2CM Control A
   type SERCOM_CTRLA_SERCOM_I2CM_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.SERCOM.USART_EXT_CLK;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Pin Usage
      PINOUT         : Boolean := False;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      --  SDA Hold Time
      SDAHOLD        : CTRLA_SDAHOLDSelect := SAM_SVD.SERCOM.DISABLE;
      --  Master SCL Low Extend Timeout
      MEXTTOEN       : Boolean := False;
      --  Slave SCL Low Extend Timeout
      SEXTTOEN       : Boolean := False;
      --  Transfer Speed
      SPEED          : CTRLA_SPEEDSelect :=
                        SAM_SVD.SERCOM.STANDARD_AND_FAST_MODE;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  SCL Clock Stretch Mode
      SCLSM          : Boolean := False;
      --  Inactive Time-Out
      INACTOUT       : CTRLA_INACTOUTSelect := SAM_SVD.SERCOM.DISABLE;
      --  SCL Low Timeout Enable
      LOWTOUTEN      : Boolean := False;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_I2CM_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      PINOUT         at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      SDAHOLD        at 0 range 20 .. 21;
      MEXTTOEN       at 0 range 22 .. 22;
      SEXTTOEN       at 0 range 23 .. 23;
      SPEED          at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      SCLSM          at 0 range 27 .. 27;
      INACTOUT       at 0 range 28 .. 29;
      LOWTOUTEN      at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype SERCOM_CTRLB_SERCOM_I2CM_CMD_Field is HAL.UInt2;

   --  I2CM Control B
   type SERCOM_CTRLB_SERCOM_I2CM_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      --  Smart Mode Enable
      SMEN           : Boolean := False;
      --  Quick Command Enable
      QCEN           : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
      --  Command
      CMD            : SERCOM_CTRLB_SERCOM_I2CM_CMD_Field := 16#0#;
      --  Acknowledge Action
      ACKACT         : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_I2CM_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      SMEN           at 0 range 8 .. 8;
      QCEN           at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      CMD            at 0 range 16 .. 17;
      ACKACT         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  Data 32 Bit
   type CTRLC_DATA32BSelect is
     (--  Data transaction from/to DATA register are 8-bit
      DATA_TRANS_8BIT,
      --  Data transaction from/to DATA register are 32-bit
      DATA_TRANS_32BIT)
     with Size => 1;
   for CTRLC_DATA32BSelect use
     (DATA_TRANS_8BIT => 0,
      DATA_TRANS_32BIT => 1);

   --  I2CM Control C
   type SERCOM_CTRLC_SERCOM_I2CM_Register is record
      --  unspecified
      Reserved_0_23  : HAL.UInt24 := 16#0#;
      --  Data 32 Bit
      DATA32B        : CTRLC_DATA32BSelect := SAM_SVD.SERCOM.DATA_TRANS_8BIT;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLC_SERCOM_I2CM_Register use record
      Reserved_0_23  at 0 range 0 .. 23;
      DATA32B        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype SERCOM_BAUD_SERCOM_I2CM_BAUD_Field is HAL.UInt8;
   subtype SERCOM_BAUD_SERCOM_I2CM_BAUDLOW_Field is HAL.UInt8;
   subtype SERCOM_BAUD_SERCOM_I2CM_HSBAUD_Field is HAL.UInt8;
   subtype SERCOM_BAUD_SERCOM_I2CM_HSBAUDLOW_Field is HAL.UInt8;

   --  I2CM Baud Rate
   type SERCOM_BAUD_SERCOM_I2CM_Register is record
      --  Baud Rate Value
      BAUD      : SERCOM_BAUD_SERCOM_I2CM_BAUD_Field := 16#0#;
      --  Baud Rate Value Low
      BAUDLOW   : SERCOM_BAUD_SERCOM_I2CM_BAUDLOW_Field := 16#0#;
      --  High Speed Baud Rate Value
      HSBAUD    : SERCOM_BAUD_SERCOM_I2CM_HSBAUD_Field := 16#0#;
      --  High Speed Baud Rate Value Low
      HSBAUDLOW : SERCOM_BAUD_SERCOM_I2CM_HSBAUDLOW_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_SERCOM_I2CM_Register use record
      BAUD      at 0 range 0 .. 7;
      BAUDLOW   at 0 range 8 .. 15;
      HSBAUD    at 0 range 16 .. 23;
      HSBAUDLOW at 0 range 24 .. 31;
   end record;

   --  I2CM Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_I2CM_Register is record
      --  Master On Bus Interrupt Disable
      MB           : Boolean := False;
      --  Slave On Bus Interrupt Disable
      SB           : Boolean := False;
      --  unspecified
      Reserved_2_6 : HAL.UInt5 := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_I2CM_Register use record
      MB           at 0 range 0 .. 0;
      SB           at 0 range 1 .. 1;
      Reserved_2_6 at 0 range 2 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CM Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_I2CM_Register is record
      --  Master On Bus Interrupt Enable
      MB           : Boolean := False;
      --  Slave On Bus Interrupt Enable
      SB           : Boolean := False;
      --  unspecified
      Reserved_2_6 : HAL.UInt5 := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_I2CM_Register use record
      MB           at 0 range 0 .. 0;
      SB           at 0 range 1 .. 1;
      Reserved_2_6 at 0 range 2 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CM Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_I2CM_Register is record
      --  Master On Bus Interrupt
      MB           : Boolean := False;
      --  Slave On Bus Interrupt
      SB           : Boolean := False;
      --  unspecified
      Reserved_2_6 : HAL.UInt5 := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_I2CM_Register use record
      MB           at 0 range 0 .. 0;
      SB           at 0 range 1 .. 1;
      Reserved_2_6 at 0 range 2 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   subtype SERCOM_STATUS_SERCOM_I2CM_BUSSTATE_Field is HAL.UInt2;

   --  I2CM Status
   type SERCOM_STATUS_SERCOM_I2CM_Register is record
      --  Bus Error
      BUSERR         : Boolean := False;
      --  Arbitration Lost
      ARBLOST        : Boolean := False;
      --  Received Not Acknowledge
      RXNACK         : Boolean := False;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Bus State
      BUSSTATE       : SERCOM_STATUS_SERCOM_I2CM_BUSSTATE_Field := 16#0#;
      --  SCL Low Timeout
      LOWTOUT        : Boolean := False;
      --  Clock Hold
      CLKHOLD        : Boolean := False;
      --  Master SCL Low Extend Timeout
      MEXTTOUT       : Boolean := False;
      --  Slave SCL Low Extend Timeout
      SEXTTOUT       : Boolean := False;
      --  Length Error
      LENERR         : Boolean := False;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_I2CM_Register use record
      BUSERR         at 0 range 0 .. 0;
      ARBLOST        at 0 range 1 .. 1;
      RXNACK         at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      BUSSTATE       at 0 range 4 .. 5;
      LOWTOUT        at 0 range 6 .. 6;
      CLKHOLD        at 0 range 7 .. 7;
      MEXTTOUT       at 0 range 8 .. 8;
      SEXTTOUT       at 0 range 9 .. 9;
      LENERR         at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  I2CM Synchronization Busy
   type SERCOM_SYNCBUSY_SERCOM_I2CM_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. System Operation Synchronization Busy
      SYSOP         : Boolean;
      --  unspecified
      Reserved_3_3  : HAL.Bit;
      --  Read-only. Length Synchronization Busy
      LENGTH        : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_I2CM_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      SYSOP         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      LENGTH        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SERCOM_ADDR_SERCOM_I2CM_ADDR_Field is HAL.UInt11;
   subtype SERCOM_ADDR_SERCOM_I2CM_LEN_Field is HAL.UInt8;

   --  I2CM Address
   type SERCOM_ADDR_SERCOM_I2CM_Register is record
      --  Address Value
      ADDR           : SERCOM_ADDR_SERCOM_I2CM_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_12 : HAL.UInt2 := 16#0#;
      --  Length Enable
      LENEN          : Boolean := False;
      --  High Speed Mode
      HS             : Boolean := False;
      --  Ten Bit Addressing Enable
      TENBITEN       : Boolean := False;
      --  Length
      LEN            : SERCOM_ADDR_SERCOM_I2CM_LEN_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_ADDR_SERCOM_I2CM_Register use record
      ADDR           at 0 range 0 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      LENEN          at 0 range 13 .. 13;
      HS             at 0 range 14 .. 14;
      TENBITEN       at 0 range 15 .. 15;
      LEN            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  I2CM Debug Control
   type SERCOM_DBGCTRL_SERCOM_I2CM_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_I2CM_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  I2C Master Mode
   type SercomI2cm_Cluster is record
      --  I2CM Control A
      CTRLA    : aliased SERCOM_CTRLA_SERCOM_I2CM_Register;
      --  I2CM Control B
      CTRLB    : aliased SERCOM_CTRLB_SERCOM_I2CM_Register;
      --  I2CM Control C
      CTRLC    : aliased SERCOM_CTRLC_SERCOM_I2CM_Register;
      --  I2CM Baud Rate
      BAUD     : aliased SERCOM_BAUD_SERCOM_I2CM_Register;
      --  I2CM Interrupt Enable Clear
      INTENCLR : aliased SERCOM_INTENCLR_SERCOM_I2CM_Register;
      --  I2CM Interrupt Enable Set
      INTENSET : aliased SERCOM_INTENSET_SERCOM_I2CM_Register;
      --  I2CM Interrupt Flag Status and Clear
      INTFLAG  : aliased SERCOM_INTFLAG_SERCOM_I2CM_Register;
      --  I2CM Status
      STATUS   : aliased SERCOM_STATUS_SERCOM_I2CM_Register;
      --  I2CM Synchronization Busy
      SYNCBUSY : aliased SERCOM_SYNCBUSY_SERCOM_I2CM_Register;
      --  I2CM Address
      ADDR     : aliased SERCOM_ADDR_SERCOM_I2CM_Register;
      --  I2CM Data
      DATA     : aliased HAL.UInt8;
      --  I2CM Debug Control
      DBGCTRL  : aliased SERCOM_DBGCTRL_SERCOM_I2CM_Register;
   end record
     with Size => 416;

   for SercomI2cm_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLB    at 16#4# range 0 .. 31;
      CTRLC    at 16#8# range 0 .. 31;
      BAUD     at 16#C# range 0 .. 31;
      INTENCLR at 16#14# range 0 .. 7;
      INTENSET at 16#16# range 0 .. 7;
      INTFLAG  at 16#18# range 0 .. 7;
      STATUS   at 16#1A# range 0 .. 15;
      SYNCBUSY at 16#1C# range 0 .. 31;
      ADDR     at 16#24# range 0 .. 31;
      DATA     at 16#28# range 0 .. 7;
      DBGCTRL  at 16#30# range 0 .. 7;
   end record;

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   --  I2CS Control A
   type SERCOM_CTRLA_SERCOM_I2CS_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.SERCOM.USART_EXT_CLK;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Pin Usage
      PINOUT         : Boolean := False;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      --  SDA Hold Time
      SDAHOLD        : CTRLA_SDAHOLDSelect := SAM_SVD.SERCOM.DISABLE;
      --  unspecified
      Reserved_22_22 : HAL.Bit := 16#0#;
      --  Slave SCL Low Extend Timeout
      SEXTTOEN       : Boolean := False;
      --  Transfer Speed
      SPEED          : CTRLA_SPEEDSelect :=
                        SAM_SVD.SERCOM.STANDARD_AND_FAST_MODE;
      --  unspecified
      Reserved_26_26 : HAL.Bit := 16#0#;
      --  SCL Clock Stretch Mode
      SCLSM          : Boolean := False;
      --  unspecified
      Reserved_28_29 : HAL.UInt2 := 16#0#;
      --  SCL Low Timeout Enable
      LOWTOUTEN      : Boolean := False;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_I2CS_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      PINOUT         at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      SDAHOLD        at 0 range 20 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      SEXTTOEN       at 0 range 23 .. 23;
      SPEED          at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      SCLSM          at 0 range 27 .. 27;
      Reserved_28_29 at 0 range 28 .. 29;
      LOWTOUTEN      at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype SERCOM_CTRLB_SERCOM_I2CS_AMODE_Field is HAL.UInt2;
   subtype SERCOM_CTRLB_SERCOM_I2CS_CMD_Field is HAL.UInt2;

   --  I2CS Control B
   type SERCOM_CTRLB_SERCOM_I2CS_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      --  Smart Mode Enable
      SMEN           : Boolean := False;
      --  PMBus Group Command
      GCMD           : Boolean := False;
      --  Automatic Address Acknowledge
      AACKEN         : Boolean := False;
      --  unspecified
      Reserved_11_13 : HAL.UInt3 := 16#0#;
      --  Address Mode
      AMODE          : SERCOM_CTRLB_SERCOM_I2CS_AMODE_Field := 16#0#;
      --  Command
      CMD            : SERCOM_CTRLB_SERCOM_I2CS_CMD_Field := 16#0#;
      --  Acknowledge Action
      ACKACT         : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_I2CS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      SMEN           at 0 range 8 .. 8;
      GCMD           at 0 range 9 .. 9;
      AACKEN         at 0 range 10 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      AMODE          at 0 range 14 .. 15;
      CMD            at 0 range 16 .. 17;
      ACKACT         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype SERCOM_CTRLC_SERCOM_I2CS_SDASETUP_Field is HAL.UInt4;

   --  I2CS Control C
   type SERCOM_CTRLC_SERCOM_I2CS_Register is record
      --  SDA Setup Time
      SDASETUP       : SERCOM_CTRLC_SERCOM_I2CS_SDASETUP_Field := 16#0#;
      --  unspecified
      Reserved_4_23  : HAL.UInt20 := 16#0#;
      --  Data 32 Bit
      DATA32B        : CTRLC_DATA32BSelect := SAM_SVD.SERCOM.DATA_TRANS_8BIT;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLC_SERCOM_I2CS_Register use record
      SDASETUP       at 0 range 0 .. 3;
      Reserved_4_23  at 0 range 4 .. 23;
      DATA32B        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  I2CS Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_I2CS_Register is record
      --  Stop Received Interrupt Disable
      PREC         : Boolean := False;
      --  Address Match Interrupt Disable
      AMATCH       : Boolean := False;
      --  Data Interrupt Disable
      DRDY         : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_I2CS_Register use record
      PREC         at 0 range 0 .. 0;
      AMATCH       at 0 range 1 .. 1;
      DRDY         at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CS Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_I2CS_Register is record
      --  Stop Received Interrupt Enable
      PREC         : Boolean := False;
      --  Address Match Interrupt Enable
      AMATCH       : Boolean := False;
      --  Data Interrupt Enable
      DRDY         : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_I2CS_Register use record
      PREC         at 0 range 0 .. 0;
      AMATCH       at 0 range 1 .. 1;
      DRDY         at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CS Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_I2CS_Register is record
      --  Stop Received Interrupt
      PREC         : Boolean := False;
      --  Address Match Interrupt
      AMATCH       : Boolean := False;
      --  Data Interrupt
      DRDY         : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_I2CS_Register use record
      PREC         at 0 range 0 .. 0;
      AMATCH       at 0 range 1 .. 1;
      DRDY         at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CS Status
   type SERCOM_STATUS_SERCOM_I2CS_Register is record
      --  Bus Error
      BUSERR         : Boolean := False;
      --  Transmit Collision
      COLL           : Boolean := False;
      --  Received Not Acknowledge
      RXNACK         : Boolean := False;
      --  Read/Write Direction
      DIR            : Boolean := False;
      --  Repeated Start
      SR             : Boolean := False;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  SCL Low Timeout
      LOWTOUT        : Boolean := False;
      --  Clock Hold
      CLKHOLD        : Boolean := False;
      --  unspecified
      Reserved_8_8   : HAL.Bit := 16#0#;
      --  Slave SCL Low Extend Timeout
      SEXTTOUT       : Boolean := False;
      --  High Speed
      HS             : Boolean := False;
      --  Transaction Length Error
      LENERR         : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_I2CS_Register use record
      BUSERR         at 0 range 0 .. 0;
      COLL           at 0 range 1 .. 1;
      RXNACK         at 0 range 2 .. 2;
      DIR            at 0 range 3 .. 3;
      SR             at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      LOWTOUT        at 0 range 6 .. 6;
      CLKHOLD        at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      SEXTTOUT       at 0 range 9 .. 9;
      HS             at 0 range 10 .. 10;
      LENERR         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  I2CS Synchronization Busy
   type SERCOM_SYNCBUSY_SERCOM_I2CS_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  unspecified
      Reserved_2_3  : HAL.UInt2;
      --  Read-only. Length Synchronization Busy
      LENGTH        : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_I2CS_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      LENGTH        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SERCOM_LENGTH_SERCOM_I2CS_LEN_Field is HAL.UInt8;

   --  I2CS Length
   type SERCOM_LENGTH_SERCOM_I2CS_Register is record
      --  Data Length
      LEN           : SERCOM_LENGTH_SERCOM_I2CS_LEN_Field := 16#0#;
      --  Data Length Enable
      LENEN         : Boolean := False;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_LENGTH_SERCOM_I2CS_Register use record
      LEN           at 0 range 0 .. 7;
      LENEN         at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   subtype SERCOM_ADDR_SERCOM_I2CS_ADDR_Field is HAL.UInt10;
   subtype SERCOM_ADDR_SERCOM_I2CS_ADDRMASK_Field is HAL.UInt10;

   --  I2CS Address
   type SERCOM_ADDR_SERCOM_I2CS_Register is record
      --  General Call Address Enable
      GENCEN         : Boolean := False;
      --  Address Value
      ADDR           : SERCOM_ADDR_SERCOM_I2CS_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : HAL.UInt4 := 16#0#;
      --  Ten Bit Addressing Enable
      TENBITEN       : Boolean := False;
      --  unspecified
      Reserved_16_16 : HAL.Bit := 16#0#;
      --  Address Mask
      ADDRMASK       : SERCOM_ADDR_SERCOM_I2CS_ADDRMASK_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_ADDR_SERCOM_I2CS_Register use record
      GENCEN         at 0 range 0 .. 0;
      ADDR           at 0 range 1 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      TENBITEN       at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      ADDRMASK       at 0 range 17 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  I2C Slave Mode
   type SercomI2cs_Cluster is record
      --  I2CS Control A
      CTRLA    : aliased SERCOM_CTRLA_SERCOM_I2CS_Register;
      --  I2CS Control B
      CTRLB    : aliased SERCOM_CTRLB_SERCOM_I2CS_Register;
      --  I2CS Control C
      CTRLC    : aliased SERCOM_CTRLC_SERCOM_I2CS_Register;
      --  I2CS Interrupt Enable Clear
      INTENCLR : aliased SERCOM_INTENCLR_SERCOM_I2CS_Register;
      --  I2CS Interrupt Enable Set
      INTENSET : aliased SERCOM_INTENSET_SERCOM_I2CS_Register;
      --  I2CS Interrupt Flag Status and Clear
      INTFLAG  : aliased SERCOM_INTFLAG_SERCOM_I2CS_Register;
      --  I2CS Status
      STATUS   : aliased SERCOM_STATUS_SERCOM_I2CS_Register;
      --  I2CS Synchronization Busy
      SYNCBUSY : aliased SERCOM_SYNCBUSY_SERCOM_I2CS_Register;
      --  I2CS Length
      LENGTH   : aliased SERCOM_LENGTH_SERCOM_I2CS_Register;
      --  I2CS Address
      ADDR     : aliased SERCOM_ADDR_SERCOM_I2CS_Register;
      --  I2CS Data
      DATA     : aliased HAL.UInt32;
   end record
     with Size => 352;

   for SercomI2cs_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLB    at 16#4# range 0 .. 31;
      CTRLC    at 16#8# range 0 .. 31;
      INTENCLR at 16#14# range 0 .. 7;
      INTENSET at 16#16# range 0 .. 7;
      INTFLAG  at 16#18# range 0 .. 7;
      STATUS   at 16#1A# range 0 .. 15;
      SYNCBUSY at 16#1C# range 0 .. 31;
      LENGTH   at 16#22# range 0 .. 15;
      ADDR     at 16#24# range 0 .. 31;
      DATA     at 16#28# range 0 .. 31;
   end record;

   ------------------------------------
   -- SercomSpis cluster's Registers --
   ------------------------------------

   --  Data Out Pinout
   type CTRLA_DOPOSelect is
     (--  DO on PAD[0], SCK on PAD[1] and SS on PAD[2]
      PAD0,
      --  DO on PAD[3], SCK on PAD[1] and SS on PAD[2]
      PAD2)
     with Size => 2;
   for CTRLA_DOPOSelect use
     (PAD0 => 0,
      PAD2 => 2);

   --  Data In Pinout
   type CTRLA_DIPOSelect is
     (--  SERCOM PAD[0] is used as data input
      PAD0,
      --  SERCOM PAD[1] is used as data input
      PAD1,
      --  SERCOM PAD[2] is used as data input
      PAD2,
      --  SERCOM PAD[3] is used as data input
      PAD3)
     with Size => 2;
   for CTRLA_DIPOSelect use
     (PAD0 => 0,
      PAD1 => 1,
      PAD2 => 2,
      PAD3 => 3);

   --  Frame Format
   type CTRLA_FORMSelect is
     (--  SPI Frame
      SPI_FRAME,
      --  SPI Frame with Addr
      SPI_FRAME_WITH_ADDR)
     with Size => 4;
   for CTRLA_FORMSelect use
     (SPI_FRAME => 0,
      SPI_FRAME_WITH_ADDR => 2);

   --  Clock Phase
   type CTRLA_CPHASelect is
     (--  The data is sampled on a leading SCK edge and changed on a trailing SCK
--  edge
      LEADING_EDGE,
      --  The data is sampled on a trailing SCK edge and changed on a leading SCK
--  edge
      TRAILING_EDGE)
     with Size => 1;
   for CTRLA_CPHASelect use
     (LEADING_EDGE => 0,
      TRAILING_EDGE => 1);

   --  Clock Polarity
   type CTRLA_CPOLSelect is
     (--  SCK is low when idle
      IDLE_LOW,
      --  SCK is high when idle
      IDLE_HIGH)
     with Size => 1;
   for CTRLA_CPOLSelect use
     (IDLE_LOW => 0,
      IDLE_HIGH => 1);

   --  Data Order
   type CTRLA_DORDSelect is
     (--  MSB is transferred first
      MSB,
      --  LSB is transferred first
      LSB)
     with Size => 1;
   for CTRLA_DORDSelect use
     (MSB => 0,
      LSB => 1);

   --  SPIS Control A
   type SERCOM_CTRLA_SERCOM_SPIS_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.SERCOM.USART_EXT_CLK;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Immediate Buffer Overflow Notification
      IBON           : Boolean := False;
      --  unspecified
      Reserved_9_15  : HAL.UInt7 := 16#0#;
      --  Data Out Pinout
      DOPO           : CTRLA_DOPOSelect := SAM_SVD.SERCOM.PAD0;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Data In Pinout
      DIPO           : CTRLA_DIPOSelect := SAM_SVD.SERCOM.PAD0;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Frame Format
      FORM           : CTRLA_FORMSelect := SAM_SVD.SERCOM.SPI_FRAME;
      --  Clock Phase
      CPHA           : CTRLA_CPHASelect := SAM_SVD.SERCOM.LEADING_EDGE;
      --  Clock Polarity
      CPOL           : CTRLA_CPOLSelect := SAM_SVD.SERCOM.IDLE_LOW;
      --  Data Order
      DORD           : CTRLA_DORDSelect := SAM_SVD.SERCOM.MSB;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_SPIS_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      IBON           at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      DOPO           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DIPO           at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      FORM           at 0 range 24 .. 27;
      CPHA           at 0 range 28 .. 28;
      CPOL           at 0 range 29 .. 29;
      DORD           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Character Size
   type CTRLB_CHSIZESelect is
     (--  8 bits
      Val_8_BIT,
      --  9 bits
      Val_9_BIT)
     with Size => 3;
   for CTRLB_CHSIZESelect use
     (Val_8_BIT => 0,
      Val_9_BIT => 1);

   --  Address Mode
   type CTRLB_AMODESelect is
     (--  SPI Address mask
      MASK,
      --  Two unique Addressess
      Val_2_ADDRESSES,
      --  Address Range
      RANGE_k)
     with Size => 2;
   for CTRLB_AMODESelect use
     (MASK => 0,
      Val_2_ADDRESSES => 1,
      RANGE_k => 2);

   --  SPIS Control B
   type SERCOM_CTRLB_SERCOM_SPIS_Register is record
      --  Character Size
      CHSIZE         : CTRLB_CHSIZESelect := SAM_SVD.SERCOM.Val_8_BIT;
      --  unspecified
      Reserved_3_5   : HAL.UInt3 := 16#0#;
      --  Data Preload Enable
      PLOADEN        : Boolean := False;
      --  unspecified
      Reserved_7_8   : HAL.UInt2 := 16#0#;
      --  Slave Select Low Detect Enable
      SSDE           : Boolean := False;
      --  unspecified
      Reserved_10_12 : HAL.UInt3 := 16#0#;
      --  Master Slave Select Enable
      MSSEN          : Boolean := False;
      --  Address Mode
      AMODE          : CTRLB_AMODESelect := SAM_SVD.SERCOM.MASK;
      --  unspecified
      Reserved_16_16 : HAL.Bit := 16#0#;
      --  Receiver Enable
      RXEN           : Boolean := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_SPIS_Register use record
      CHSIZE         at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      PLOADEN        at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SSDE           at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      MSSEN          at 0 range 13 .. 13;
      AMODE          at 0 range 14 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      RXEN           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype SERCOM_CTRLC_SERCOM_SPIS_ICSPACE_Field is HAL.UInt6;

   --  SPIS Control C
   type SERCOM_CTRLC_SERCOM_SPIS_Register is record
      --  Inter-Character Spacing
      ICSPACE        : SERCOM_CTRLC_SERCOM_SPIS_ICSPACE_Field := 16#0#;
      --  unspecified
      Reserved_6_23  : HAL.UInt18 := 16#0#;
      --  Data 32 Bit
      DATA32B        : CTRLC_DATA32BSelect := SAM_SVD.SERCOM.DATA_TRANS_8BIT;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLC_SERCOM_SPIS_Register use record
      ICSPACE        at 0 range 0 .. 5;
      Reserved_6_23  at 0 range 6 .. 23;
      DATA32B        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  SPIS Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_SPIS_Register is record
      --  Data Register Empty Interrupt Disable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Disable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Disable
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Disable
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_SPIS_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPIS Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_SPIS_Register is record
      --  Data Register Empty Interrupt Enable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Enable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Enable
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Enable
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_SPIS_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPIS Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_SPIS_Register is record
      --  Data Register Empty Interrupt
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt
      TXC          : Boolean := False;
      --  Receive Complete Interrupt
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Flag
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_SPIS_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPIS Status
   type SERCOM_STATUS_SERCOM_SPIS_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Buffer Overflow
      BUFOVF         : Boolean := False;
      --  unspecified
      Reserved_3_10  : HAL.UInt8 := 16#0#;
      --  Transaction Length Error
      LENERR         : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_SPIS_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      BUFOVF         at 0 range 2 .. 2;
      Reserved_3_10  at 0 range 3 .. 10;
      LENERR         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  SPIS Synchronization Busy
   type SERCOM_SYNCBUSY_SERCOM_SPIS_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. CTRLB Synchronization Busy
      CTRLB         : Boolean;
      --  unspecified
      Reserved_3_3  : HAL.Bit;
      --  Read-only. LENGTH Synchronization Busy
      LENGTH        : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_SPIS_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      LENGTH        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SERCOM_LENGTH_SERCOM_SPIS_LEN_Field is HAL.UInt8;

   --  SPIS Length
   type SERCOM_LENGTH_SERCOM_SPIS_Register is record
      --  Data Length
      LEN           : SERCOM_LENGTH_SERCOM_SPIS_LEN_Field := 16#0#;
      --  Data Length Enable
      LENEN         : Boolean := False;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_LENGTH_SERCOM_SPIS_Register use record
      LEN           at 0 range 0 .. 7;
      LENEN         at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   subtype SERCOM_ADDR_SERCOM_SPIS_ADDR_Field is HAL.UInt8;
   subtype SERCOM_ADDR_SERCOM_SPIS_ADDRMASK_Field is HAL.UInt8;

   --  SPIS Address
   type SERCOM_ADDR_SERCOM_SPIS_Register is record
      --  Address Value
      ADDR           : SERCOM_ADDR_SERCOM_SPIS_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Address Mask
      ADDRMASK       : SERCOM_ADDR_SERCOM_SPIS_ADDRMASK_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_ADDR_SERCOM_SPIS_Register use record
      ADDR           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      ADDRMASK       at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  SPIS Debug Control
   type SERCOM_DBGCTRL_SERCOM_SPIS_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_SPIS_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  SPI Slave Mode
   type SercomSpis_Cluster is record
      --  SPIS Control A
      CTRLA    : aliased SERCOM_CTRLA_SERCOM_SPIS_Register;
      --  SPIS Control B
      CTRLB    : aliased SERCOM_CTRLB_SERCOM_SPIS_Register;
      --  SPIS Control C
      CTRLC    : aliased SERCOM_CTRLC_SERCOM_SPIS_Register;
      --  SPIS Baud Rate
      BAUD     : aliased HAL.UInt8;
      --  SPIS Interrupt Enable Clear
      INTENCLR : aliased SERCOM_INTENCLR_SERCOM_SPIS_Register;
      --  SPIS Interrupt Enable Set
      INTENSET : aliased SERCOM_INTENSET_SERCOM_SPIS_Register;
      --  SPIS Interrupt Flag Status and Clear
      INTFLAG  : aliased SERCOM_INTFLAG_SERCOM_SPIS_Register;
      --  SPIS Status
      STATUS   : aliased SERCOM_STATUS_SERCOM_SPIS_Register;
      --  SPIS Synchronization Busy
      SYNCBUSY : aliased SERCOM_SYNCBUSY_SERCOM_SPIS_Register;
      --  SPIS Length
      LENGTH   : aliased SERCOM_LENGTH_SERCOM_SPIS_Register;
      --  SPIS Address
      ADDR     : aliased SERCOM_ADDR_SERCOM_SPIS_Register;
      --  SPIS Data
      DATA     : aliased HAL.UInt32;
      --  SPIS Debug Control
      DBGCTRL  : aliased SERCOM_DBGCTRL_SERCOM_SPIS_Register;
   end record
     with Size => 416;

   for SercomSpis_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLB    at 16#4# range 0 .. 31;
      CTRLC    at 16#8# range 0 .. 31;
      BAUD     at 16#C# range 0 .. 7;
      INTENCLR at 16#14# range 0 .. 7;
      INTENSET at 16#16# range 0 .. 7;
      INTFLAG  at 16#18# range 0 .. 7;
      STATUS   at 16#1A# range 0 .. 15;
      SYNCBUSY at 16#1C# range 0 .. 31;
      LENGTH   at 16#22# range 0 .. 15;
      ADDR     at 16#24# range 0 .. 31;
      DATA     at 16#28# range 0 .. 31;
      DBGCTRL  at 16#30# range 0 .. 7;
   end record;

   ------------------------------------
   -- SercomSpim cluster's Registers --
   ------------------------------------

   --  SPIM Control A
   type SERCOM_CTRLA_SERCOM_SPIM_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.SERCOM.USART_EXT_CLK;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Immediate Buffer Overflow Notification
      IBON           : Boolean := False;
      --  unspecified
      Reserved_9_15  : HAL.UInt7 := 16#0#;
      --  Data Out Pinout
      DOPO           : CTRLA_DOPOSelect := SAM_SVD.SERCOM.PAD0;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Data In Pinout
      DIPO           : CTRLA_DIPOSelect := SAM_SVD.SERCOM.PAD0;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Frame Format
      FORM           : CTRLA_FORMSelect := SAM_SVD.SERCOM.SPI_FRAME;
      --  Clock Phase
      CPHA           : CTRLA_CPHASelect := SAM_SVD.SERCOM.LEADING_EDGE;
      --  Clock Polarity
      CPOL           : CTRLA_CPOLSelect := SAM_SVD.SERCOM.IDLE_LOW;
      --  Data Order
      DORD           : CTRLA_DORDSelect := SAM_SVD.SERCOM.MSB;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_SPIM_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      IBON           at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      DOPO           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DIPO           at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      FORM           at 0 range 24 .. 27;
      CPHA           at 0 range 28 .. 28;
      CPOL           at 0 range 29 .. 29;
      DORD           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  SPIM Control B
   type SERCOM_CTRLB_SERCOM_SPIM_Register is record
      --  Character Size
      CHSIZE         : CTRLB_CHSIZESelect := SAM_SVD.SERCOM.Val_8_BIT;
      --  unspecified
      Reserved_3_5   : HAL.UInt3 := 16#0#;
      --  Data Preload Enable
      PLOADEN        : Boolean := False;
      --  unspecified
      Reserved_7_8   : HAL.UInt2 := 16#0#;
      --  Slave Select Low Detect Enable
      SSDE           : Boolean := False;
      --  unspecified
      Reserved_10_12 : HAL.UInt3 := 16#0#;
      --  Master Slave Select Enable
      MSSEN          : Boolean := False;
      --  Address Mode
      AMODE          : CTRLB_AMODESelect := SAM_SVD.SERCOM.MASK;
      --  unspecified
      Reserved_16_16 : HAL.Bit := 16#0#;
      --  Receiver Enable
      RXEN           : Boolean := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_SPIM_Register use record
      CHSIZE         at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      PLOADEN        at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SSDE           at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      MSSEN          at 0 range 13 .. 13;
      AMODE          at 0 range 14 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      RXEN           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype SERCOM_CTRLC_SERCOM_SPIM_ICSPACE_Field is HAL.UInt6;

   --  SPIM Control C
   type SERCOM_CTRLC_SERCOM_SPIM_Register is record
      --  Inter-Character Spacing
      ICSPACE        : SERCOM_CTRLC_SERCOM_SPIM_ICSPACE_Field := 16#0#;
      --  unspecified
      Reserved_6_23  : HAL.UInt18 := 16#0#;
      --  Data 32 Bit
      DATA32B        : CTRLC_DATA32BSelect := SAM_SVD.SERCOM.DATA_TRANS_8BIT;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLC_SERCOM_SPIM_Register use record
      ICSPACE        at 0 range 0 .. 5;
      Reserved_6_23  at 0 range 6 .. 23;
      DATA32B        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  SPIM Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_SPIM_Register is record
      --  Data Register Empty Interrupt Disable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Disable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Disable
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Disable
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_SPIM_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPIM Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_SPIM_Register is record
      --  Data Register Empty Interrupt Enable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Enable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Enable
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Enable
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_SPIM_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPIM Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_SPIM_Register is record
      --  Data Register Empty Interrupt
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt
      TXC          : Boolean := False;
      --  Receive Complete Interrupt
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Flag
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_SPIM_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPIM Status
   type SERCOM_STATUS_SERCOM_SPIM_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Buffer Overflow
      BUFOVF         : Boolean := False;
      --  unspecified
      Reserved_3_10  : HAL.UInt8 := 16#0#;
      --  Transaction Length Error
      LENERR         : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_SPIM_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      BUFOVF         at 0 range 2 .. 2;
      Reserved_3_10  at 0 range 3 .. 10;
      LENERR         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  SPIM Synchronization Busy
   type SERCOM_SYNCBUSY_SERCOM_SPIM_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. CTRLB Synchronization Busy
      CTRLB         : Boolean;
      --  unspecified
      Reserved_3_3  : HAL.Bit;
      --  Read-only. LENGTH Synchronization Busy
      LENGTH        : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_SPIM_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      LENGTH        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SERCOM_LENGTH_SERCOM_SPIM_LEN_Field is HAL.UInt8;

   --  SPIM Length
   type SERCOM_LENGTH_SERCOM_SPIM_Register is record
      --  Data Length
      LEN           : SERCOM_LENGTH_SERCOM_SPIM_LEN_Field := 16#0#;
      --  Data Length Enable
      LENEN         : Boolean := False;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_LENGTH_SERCOM_SPIM_Register use record
      LEN           at 0 range 0 .. 7;
      LENEN         at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   subtype SERCOM_ADDR_SERCOM_SPIM_ADDR_Field is HAL.UInt8;
   subtype SERCOM_ADDR_SERCOM_SPIM_ADDRMASK_Field is HAL.UInt8;

   --  SPIM Address
   type SERCOM_ADDR_SERCOM_SPIM_Register is record
      --  Address Value
      ADDR           : SERCOM_ADDR_SERCOM_SPIM_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Address Mask
      ADDRMASK       : SERCOM_ADDR_SERCOM_SPIM_ADDRMASK_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_ADDR_SERCOM_SPIM_Register use record
      ADDR           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      ADDRMASK       at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  SPIM Debug Control
   type SERCOM_DBGCTRL_SERCOM_SPIM_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_SPIM_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  SPI Master Mode
   type SercomSpim_Cluster is record
      --  SPIM Control A
      CTRLA    : aliased SERCOM_CTRLA_SERCOM_SPIM_Register;
      --  SPIM Control B
      CTRLB    : aliased SERCOM_CTRLB_SERCOM_SPIM_Register;
      --  SPIM Control C
      CTRLC    : aliased SERCOM_CTRLC_SERCOM_SPIM_Register;
      --  SPIM Baud Rate
      BAUD     : aliased HAL.UInt8;
      --  SPIM Interrupt Enable Clear
      INTENCLR : aliased SERCOM_INTENCLR_SERCOM_SPIM_Register;
      --  SPIM Interrupt Enable Set
      INTENSET : aliased SERCOM_INTENSET_SERCOM_SPIM_Register;
      --  SPIM Interrupt Flag Status and Clear
      INTFLAG  : aliased SERCOM_INTFLAG_SERCOM_SPIM_Register;
      --  SPIM Status
      STATUS   : aliased SERCOM_STATUS_SERCOM_SPIM_Register;
      --  SPIM Synchronization Busy
      SYNCBUSY : aliased SERCOM_SYNCBUSY_SERCOM_SPIM_Register;
      --  SPIM Length
      LENGTH   : aliased SERCOM_LENGTH_SERCOM_SPIM_Register;
      --  SPIM Address
      ADDR     : aliased SERCOM_ADDR_SERCOM_SPIM_Register;
      --  SPIM Data
      DATA     : aliased HAL.UInt32;
      --  SPIM Debug Control
      DBGCTRL  : aliased SERCOM_DBGCTRL_SERCOM_SPIM_Register;
   end record
     with Size => 416;

   for SercomSpim_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLB    at 16#4# range 0 .. 31;
      CTRLC    at 16#8# range 0 .. 31;
      BAUD     at 16#C# range 0 .. 7;
      INTENCLR at 16#14# range 0 .. 7;
      INTENSET at 16#16# range 0 .. 7;
      INTFLAG  at 16#18# range 0 .. 7;
      STATUS   at 16#1A# range 0 .. 15;
      SYNCBUSY at 16#1C# range 0 .. 31;
      LENGTH   at 16#22# range 0 .. 15;
      ADDR     at 16#24# range 0 .. 31;
      DATA     at 16#28# range 0 .. 31;
      DBGCTRL  at 16#30# range 0 .. 7;
   end record;

   -----------------------------------------
   -- SercomUsart_ext cluster's Registers --
   -----------------------------------------

   --  Sample
   type CTRLA_SAMPRSelect is
     (--  16x over-sampling using arithmetic baudrate generation
      Val_16X_ARITHMETIC,
      --  16x over-sampling using fractional baudrate generation
      Val_16X_FRACTIONAL,
      --  8x over-sampling using arithmetic baudrate generation
      Val_8X_ARITHMETIC,
      --  8x over-sampling using fractional baudrate generation
      Val_8X_FRACTIONAL,
      --  3x over-sampling using arithmetic baudrate generation
      Val_3X_ARITHMETIC)
     with Size => 3;
   for CTRLA_SAMPRSelect use
     (Val_16X_ARITHMETIC => 0,
      Val_16X_FRACTIONAL => 1,
      Val_8X_ARITHMETIC => 2,
      Val_8X_FRACTIONAL => 3,
      Val_3X_ARITHMETIC => 4);

   --  Transmit Data Pinout
   type CTRLA_TXPOSelect is
     (--  SERCOM PAD[0] is used for data transmission
      PAD0,
      --  SERCOM_PAD[0] is used for data transmission
      PAD3)
     with Size => 2;
   for CTRLA_TXPOSelect use
     (PAD0 => 0,
      PAD3 => 3);

   --  Receive Data Pinout
   type CTRLA_RXPOSelect is
     (--  SERCOM PAD[0] is used for data reception
      PAD0,
      --  SERCOM PAD[1] is used for data reception
      PAD1,
      --  SERCOM PAD[2] is used for data reception
      PAD2,
      --  SERCOM PAD[3] is used for data reception
      PAD3)
     with Size => 2;
   for CTRLA_RXPOSelect use
     (PAD0 => 0,
      PAD1 => 1,
      PAD2 => 2,
      PAD3 => 3);

   subtype SERCOM_CTRLA_SERCOM_USART_EXT_SAMPA_Field is HAL.UInt2;

   --  Frame Format
   type CTRLA_FORMSelect_1 is
     (--  USART frame
      USART_FRAME_NO_PARITY,
      --  USART frame with parity
      USART_FRAME_WITH_PARITY,
      --  LIN Master - Break and sync generation
      USART_FRAME_LIN_MASTER_MODE,
      --  Auto-baud - break detection and auto-baud
      USART_FRAME_AUTO_BAUD_NO_PARITY,
      --  Auto-baud - break detection and auto-baud with parity
      USART_FRAME_AUTO_BAUD_WITH_PARITY,
      --  ISO 7816
      USART_FRAME_ISO_7816)
     with Size => 4;
   for CTRLA_FORMSelect_1 use
     (USART_FRAME_NO_PARITY => 0,
      USART_FRAME_WITH_PARITY => 1,
      USART_FRAME_LIN_MASTER_MODE => 2,
      USART_FRAME_AUTO_BAUD_NO_PARITY => 4,
      USART_FRAME_AUTO_BAUD_WITH_PARITY => 5,
      USART_FRAME_ISO_7816 => 7);

   --  Communication Mode
   type CTRLA_CMODESelect is
     (--  Asynchronous Communication
      ASYNC,
      --  Synchronous Communication
      SYNC)
     with Size => 1;
   for CTRLA_CMODESelect use
     (ASYNC => 0,
      SYNC => 1);

   --  USART_EXT Control A
   type SERCOM_CTRLA_SERCOM_USART_EXT_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.SERCOM.USART_EXT_CLK;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Immediate Buffer Overflow Notification
      IBON           : Boolean := False;
      --  Transmit Data Invert
      TXINV          : Boolean := False;
      --  Receive Data Invert
      RXINV          : Boolean := False;
      --  unspecified
      Reserved_11_12 : HAL.UInt2 := 16#0#;
      --  Sample
      SAMPR          : CTRLA_SAMPRSelect := SAM_SVD.SERCOM.Val_16X_ARITHMETIC;
      --  Transmit Data Pinout
      TXPO           : CTRLA_TXPOSelect := SAM_SVD.SERCOM.PAD0;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Receive Data Pinout
      RXPO           : CTRLA_RXPOSelect := SAM_SVD.SERCOM.PAD0;
      --  Sample Adjustment
      SAMPA          : SERCOM_CTRLA_SERCOM_USART_EXT_SAMPA_Field := 16#0#;
      --  Frame Format
      FORM           : CTRLA_FORMSelect_1 :=
                        SAM_SVD.SERCOM.USART_FRAME_NO_PARITY;
      --  Communication Mode
      CMODE          : CTRLA_CMODESelect := SAM_SVD.SERCOM.ASYNC;
      --  Clock Polarity
      CPOL           : CTRLA_CPOLSelect := SAM_SVD.SERCOM.IDLE_LOW;
      --  Data Order
      DORD           : CTRLA_DORDSelect := SAM_SVD.SERCOM.MSB;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_USART_EXT_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      IBON           at 0 range 8 .. 8;
      TXINV          at 0 range 9 .. 9;
      RXINV          at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      SAMPR          at 0 range 13 .. 15;
      TXPO           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      RXPO           at 0 range 20 .. 21;
      SAMPA          at 0 range 22 .. 23;
      FORM           at 0 range 24 .. 27;
      CMODE          at 0 range 28 .. 28;
      CPOL           at 0 range 29 .. 29;
      DORD           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  Character Size
   type CTRLB_CHSIZESelect_1 is
     (--  8 Bits
      Val_8_BIT,
      --  9 Bits
      Val_9_BIT,
      --  5 Bits
      Val_5_BIT,
      --  6 Bits
      Val_6_BIT,
      --  7 Bits
      Val_7_BIT)
     with Size => 3;
   for CTRLB_CHSIZESelect_1 use
     (Val_8_BIT => 0,
      Val_9_BIT => 1,
      Val_5_BIT => 5,
      Val_6_BIT => 6,
      Val_7_BIT => 7);

   --  Stop Bit Mode
   type CTRLB_SBMODESelect is
     (--  One Stop Bit
      Val_1_BIT,
      --  Two Stop Bits
      Val_2_BIT)
     with Size => 1;
   for CTRLB_SBMODESelect use
     (Val_1_BIT => 0,
      Val_2_BIT => 1);

   --  Parity Mode
   type CTRLB_PMODESelect is
     (--  Even Parity
      EVEN,
      --  Odd Parity
      ODD)
     with Size => 1;
   for CTRLB_PMODESelect use
     (EVEN => 0,
      ODD => 1);

   subtype SERCOM_CTRLB_SERCOM_USART_EXT_LINCMD_Field is HAL.UInt2;

   --  USART_EXT Control B
   type SERCOM_CTRLB_SERCOM_USART_EXT_Register is record
      --  Character Size
      CHSIZE         : CTRLB_CHSIZESelect_1 := SAM_SVD.SERCOM.Val_8_BIT;
      --  unspecified
      Reserved_3_5   : HAL.UInt3 := 16#0#;
      --  Stop Bit Mode
      SBMODE         : CTRLB_SBMODESelect := SAM_SVD.SERCOM.Val_1_BIT;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Collision Detection Enable
      COLDEN         : Boolean := False;
      --  Start of Frame Detection Enable
      SFDE           : Boolean := False;
      --  Encoding Format
      ENC            : Boolean := False;
      --  unspecified
      Reserved_11_12 : HAL.UInt2 := 16#0#;
      --  Parity Mode
      PMODE          : CTRLB_PMODESelect := SAM_SVD.SERCOM.EVEN;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Transmitter Enable
      TXEN           : Boolean := False;
      --  Receiver Enable
      RXEN           : Boolean := False;
      --  unspecified
      Reserved_18_23 : HAL.UInt6 := 16#0#;
      --  LIN Command
      LINCMD         : SERCOM_CTRLB_SERCOM_USART_EXT_LINCMD_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_USART_EXT_Register use record
      CHSIZE         at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      SBMODE         at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      COLDEN         at 0 range 8 .. 8;
      SFDE           at 0 range 9 .. 9;
      ENC            at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      PMODE          at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TXEN           at 0 range 16 .. 16;
      RXEN           at 0 range 17 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      LINCMD         at 0 range 24 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype SERCOM_CTRLC_SERCOM_USART_EXT_GTIME_Field is HAL.UInt3;
   subtype SERCOM_CTRLC_SERCOM_USART_EXT_BRKLEN_Field is HAL.UInt2;
   subtype SERCOM_CTRLC_SERCOM_USART_EXT_HDRDLY_Field is HAL.UInt2;
   subtype SERCOM_CTRLC_SERCOM_USART_EXT_MAXITER_Field is HAL.UInt3;

   --  Data 32 Bit
   type CTRLC_DATA32BSelect_1 is
     (--  Data reads and writes according CTRLB.CHSIZE
      DATA_READ_WRITE_CHSIZE,
      --  Data reads according CTRLB.CHSIZE and writes according 32-bit extension
      DATA_READ_CHSIZE_WRITE_32BIT,
      --  Data reads according 32-bit extension and writes according CTRLB.CHSIZE
      DATA_READ_32BIT_WRITE_CHSIZE,
      --  Data reads and writes according 32-bit extension
      DATA_READ_WRITE_32BIT)
     with Size => 2;
   for CTRLC_DATA32BSelect_1 use
     (DATA_READ_WRITE_CHSIZE => 0,
      DATA_READ_CHSIZE_WRITE_32BIT => 1,
      DATA_READ_32BIT_WRITE_CHSIZE => 2,
      DATA_READ_WRITE_32BIT => 3);

   --  USART_EXT Control C
   type SERCOM_CTRLC_SERCOM_USART_EXT_Register is record
      --  Guard Time
      GTIME          : SERCOM_CTRLC_SERCOM_USART_EXT_GTIME_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  LIN Master Break Length
      BRKLEN         : SERCOM_CTRLC_SERCOM_USART_EXT_BRKLEN_Field := 16#0#;
      --  LIN Master Header Delay
      HDRDLY         : SERCOM_CTRLC_SERCOM_USART_EXT_HDRDLY_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Inhibit Not Acknowledge
      INACK          : Boolean := False;
      --  Disable Successive NACK
      DSNACK         : Boolean := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Maximum Iterations
      MAXITER        : SERCOM_CTRLC_SERCOM_USART_EXT_MAXITER_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Data 32 Bit
      DATA32B        : CTRLC_DATA32BSelect_1 :=
                        SAM_SVD.SERCOM.DATA_READ_WRITE_CHSIZE;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLC_SERCOM_USART_EXT_Register use record
      GTIME          at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      BRKLEN         at 0 range 8 .. 9;
      HDRDLY         at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      INACK          at 0 range 16 .. 16;
      DSNACK         at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      MAXITER        at 0 range 20 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      DATA32B        at 0 range 24 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype SERCOM_BAUD_FRAC_MODE_SERCOM_USART_EXT_BAUD_Field is HAL.UInt13;
   subtype SERCOM_BAUD_FRAC_MODE_SERCOM_USART_EXT_FP_Field is HAL.UInt3;

   --  USART_EXT Baud Rate
   type SERCOM_BAUD_FRAC_MODE_SERCOM_USART_EXT_Register is record
      --  Baud Rate Value
      BAUD : SERCOM_BAUD_FRAC_MODE_SERCOM_USART_EXT_BAUD_Field := 16#0#;
      --  Fractional Part
      FP   : SERCOM_BAUD_FRAC_MODE_SERCOM_USART_EXT_FP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_FRAC_MODE_SERCOM_USART_EXT_Register use record
      BAUD at 0 range 0 .. 12;
      FP   at 0 range 13 .. 15;
   end record;

   subtype SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_EXT_BAUD_Field is HAL.UInt13;
   subtype SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_EXT_FP_Field is HAL.UInt3;

   --  USART_EXT Baud Rate
   type SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_EXT_Register is record
      --  Baud Rate Value
      BAUD : SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_EXT_BAUD_Field := 16#0#;
      --  Fractional Part
      FP   : SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_EXT_FP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_EXT_Register use record
      BAUD at 0 range 0 .. 12;
      FP   at 0 range 13 .. 15;
   end record;

   --  USART_EXT Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_USART_EXT_Register is record
      --  Data Register Empty Interrupt Disable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Disable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Disable
      RXC          : Boolean := False;
      --  Receive Start Interrupt Disable
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt Disable
      CTSIC        : Boolean := False;
      --  Break Received Interrupt Disable
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : HAL.Bit := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_USART_EXT_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART_EXT Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_USART_EXT_Register is record
      --  Data Register Empty Interrupt Enable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Enable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Enable
      RXC          : Boolean := False;
      --  Receive Start Interrupt Enable
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt Enable
      CTSIC        : Boolean := False;
      --  Break Received Interrupt Enable
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : HAL.Bit := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_USART_EXT_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART_EXT Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_USART_EXT_Register is record
      --  Data Register Empty Interrupt
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt
      TXC          : Boolean := False;
      --  Receive Complete Interrupt
      RXC          : Boolean := False;
      --  Receive Start Interrupt
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt
      CTSIC        : Boolean := False;
      --  Break Received Interrupt
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : HAL.Bit := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_USART_EXT_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART_EXT Status
   type SERCOM_STATUS_SERCOM_USART_EXT_Register is record
      --  Parity Error
      PERR          : Boolean := False;
      --  Frame Error
      FERR          : Boolean := False;
      --  Buffer Overflow
      BUFOVF        : Boolean := False;
      --  Clear To Send
      CTS           : Boolean := False;
      --  Inconsistent Sync Field
      ISF           : Boolean := False;
      --  Collision Detected
      COLL          : Boolean := False;
      --  Transmitter Empty
      TXE           : Boolean := False;
      --  Maximum Number of Repetitions Reached
      ITER          : Boolean := False;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_USART_EXT_Register use record
      PERR          at 0 range 0 .. 0;
      FERR          at 0 range 1 .. 1;
      BUFOVF        at 0 range 2 .. 2;
      CTS           at 0 range 3 .. 3;
      ISF           at 0 range 4 .. 4;
      COLL          at 0 range 5 .. 5;
      TXE           at 0 range 6 .. 6;
      ITER          at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  USART_EXT Synchronization Busy
   type SERCOM_SYNCBUSY_SERCOM_USART_EXT_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. CTRLB Synchronization Busy
      CTRLB         : Boolean;
      --  Read-only. RXERRCNT Synchronization Busy
      RXERRCNT      : Boolean;
      --  Read-only. LENGTH Synchronization Busy
      LENGTH        : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_USART_EXT_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      RXERRCNT      at 0 range 3 .. 3;
      LENGTH        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SERCOM_LENGTH_SERCOM_USART_EXT_LEN_Field is HAL.UInt8;
   subtype SERCOM_LENGTH_SERCOM_USART_EXT_LENEN_Field is HAL.UInt2;

   --  USART_EXT Length
   type SERCOM_LENGTH_SERCOM_USART_EXT_Register is record
      --  Data Length
      LEN            : SERCOM_LENGTH_SERCOM_USART_EXT_LEN_Field := 16#0#;
      --  Data Length Enable
      LENEN          : SERCOM_LENGTH_SERCOM_USART_EXT_LENEN_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_LENGTH_SERCOM_USART_EXT_Register use record
      LEN            at 0 range 0 .. 7;
      LENEN          at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  USART_EXT Debug Control
   type SERCOM_DBGCTRL_SERCOM_USART_EXT_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_USART_EXT_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   type SercomUsart_ext_Disc is
     (Default,
      FRAC_MODE,
      FRACFP_MODE,
      USARTFP_MODE);

   --  USART EXTERNAL CLOCK Mode
   type SercomUsart_ext_Cluster
     (Discriminent : SercomUsart_ext_Disc := Default)
   is record
      --  USART_EXT Control A
      CTRLA             : aliased SERCOM_CTRLA_SERCOM_USART_EXT_Register;
      --  USART_EXT Control B
      CTRLB             : aliased SERCOM_CTRLB_SERCOM_USART_EXT_Register;
      --  USART_EXT Control C
      CTRLC             : aliased SERCOM_CTRLC_SERCOM_USART_EXT_Register;
      --  USART_EXT Receive Pulse Length
      RXPL              : aliased HAL.UInt8;
      --  USART_EXT Interrupt Enable Clear
      INTENCLR          : aliased SERCOM_INTENCLR_SERCOM_USART_EXT_Register;
      --  USART_EXT Interrupt Enable Set
      INTENSET          : aliased SERCOM_INTENSET_SERCOM_USART_EXT_Register;
      --  USART_EXT Interrupt Flag Status and Clear
      INTFLAG           : aliased SERCOM_INTFLAG_SERCOM_USART_EXT_Register;
      --  USART_EXT Status
      STATUS            : aliased SERCOM_STATUS_SERCOM_USART_EXT_Register;
      --  USART_EXT Synchronization Busy
      SYNCBUSY          : aliased SERCOM_SYNCBUSY_SERCOM_USART_EXT_Register;
      --  USART_EXT Receive Error Count
      RXERRCNT          : aliased HAL.UInt8;
      --  USART_EXT Length
      LENGTH            : aliased SERCOM_LENGTH_SERCOM_USART_EXT_Register;
      --  USART_EXT Data
      DATA              : aliased HAL.UInt32;
      --  USART_EXT Debug Control
      DBGCTRL           : aliased SERCOM_DBGCTRL_SERCOM_USART_EXT_Register;
      case Discriminent is
         when Default =>
            --  USART_EXT Baud Rate
            BAUD : aliased HAL.UInt16;
         when FRAC_MODE =>
            --  USART_EXT Baud Rate
            BAUD_FRAC_MODE : aliased SERCOM_BAUD_FRAC_MODE_SERCOM_USART_EXT_Register;
         when FRACFP_MODE =>
            --  USART_EXT Baud Rate
            BAUD_FRACFP_MODE : aliased SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_EXT_Register;
         when USARTFP_MODE =>
            --  USART_EXT Baud Rate
            BAUD_USARTFP_MODE : aliased HAL.UInt16;
      end case;
   end record
     with Unchecked_Union, Size => 416;

   for SercomUsart_ext_Cluster use record
      CTRLA             at 16#0# range 0 .. 31;
      CTRLB             at 16#4# range 0 .. 31;
      CTRLC             at 16#8# range 0 .. 31;
      RXPL              at 16#E# range 0 .. 7;
      INTENCLR          at 16#14# range 0 .. 7;
      INTENSET          at 16#16# range 0 .. 7;
      INTFLAG           at 16#18# range 0 .. 7;
      STATUS            at 16#1A# range 0 .. 15;
      SYNCBUSY          at 16#1C# range 0 .. 31;
      RXERRCNT          at 16#20# range 0 .. 7;
      LENGTH            at 16#22# range 0 .. 15;
      DATA              at 16#28# range 0 .. 31;
      DBGCTRL           at 16#30# range 0 .. 7;
      BAUD              at 16#C# range 0 .. 15;
      BAUD_FRAC_MODE    at 16#C# range 0 .. 15;
      BAUD_FRACFP_MODE  at 16#C# range 0 .. 15;
      BAUD_USARTFP_MODE at 16#C# range 0 .. 15;
   end record;

   -----------------------------------------
   -- SercomUsart_int cluster's Registers --
   -----------------------------------------

   subtype SERCOM_CTRLA_SERCOM_USART_INT_SAMPA_Field is HAL.UInt2;

   --  USART_INT Control A
   type SERCOM_CTRLA_SERCOM_USART_INT_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect := SAM_SVD.SERCOM.USART_EXT_CLK;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Immediate Buffer Overflow Notification
      IBON           : Boolean := False;
      --  Transmit Data Invert
      TXINV          : Boolean := False;
      --  Receive Data Invert
      RXINV          : Boolean := False;
      --  unspecified
      Reserved_11_12 : HAL.UInt2 := 16#0#;
      --  Sample
      SAMPR          : CTRLA_SAMPRSelect := SAM_SVD.SERCOM.Val_16X_ARITHMETIC;
      --  Transmit Data Pinout
      TXPO           : CTRLA_TXPOSelect := SAM_SVD.SERCOM.PAD0;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Receive Data Pinout
      RXPO           : CTRLA_RXPOSelect := SAM_SVD.SERCOM.PAD0;
      --  Sample Adjustment
      SAMPA          : SERCOM_CTRLA_SERCOM_USART_INT_SAMPA_Field := 16#0#;
      --  Frame Format
      FORM           : CTRLA_FORMSelect_1 :=
                        SAM_SVD.SERCOM.USART_FRAME_NO_PARITY;
      --  Communication Mode
      CMODE          : CTRLA_CMODESelect := SAM_SVD.SERCOM.ASYNC;
      --  Clock Polarity
      CPOL           : CTRLA_CPOLSelect := SAM_SVD.SERCOM.IDLE_LOW;
      --  Data Order
      DORD           : CTRLA_DORDSelect := SAM_SVD.SERCOM.MSB;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_USART_INT_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      IBON           at 0 range 8 .. 8;
      TXINV          at 0 range 9 .. 9;
      RXINV          at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      SAMPR          at 0 range 13 .. 15;
      TXPO           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      RXPO           at 0 range 20 .. 21;
      SAMPA          at 0 range 22 .. 23;
      FORM           at 0 range 24 .. 27;
      CMODE          at 0 range 28 .. 28;
      CPOL           at 0 range 29 .. 29;
      DORD           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype SERCOM_CTRLB_SERCOM_USART_INT_LINCMD_Field is HAL.UInt2;

   --  USART_INT Control B
   type SERCOM_CTRLB_SERCOM_USART_INT_Register is record
      --  Character Size
      CHSIZE         : CTRLB_CHSIZESelect_1 := SAM_SVD.SERCOM.Val_8_BIT;
      --  unspecified
      Reserved_3_5   : HAL.UInt3 := 16#0#;
      --  Stop Bit Mode
      SBMODE         : CTRLB_SBMODESelect := SAM_SVD.SERCOM.Val_1_BIT;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Collision Detection Enable
      COLDEN         : Boolean := False;
      --  Start of Frame Detection Enable
      SFDE           : Boolean := False;
      --  Encoding Format
      ENC            : Boolean := False;
      --  unspecified
      Reserved_11_12 : HAL.UInt2 := 16#0#;
      --  Parity Mode
      PMODE          : CTRLB_PMODESelect := SAM_SVD.SERCOM.EVEN;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Transmitter Enable
      TXEN           : Boolean := False;
      --  Receiver Enable
      RXEN           : Boolean := False;
      --  unspecified
      Reserved_18_23 : HAL.UInt6 := 16#0#;
      --  LIN Command
      LINCMD         : SERCOM_CTRLB_SERCOM_USART_INT_LINCMD_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_USART_INT_Register use record
      CHSIZE         at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      SBMODE         at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      COLDEN         at 0 range 8 .. 8;
      SFDE           at 0 range 9 .. 9;
      ENC            at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      PMODE          at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TXEN           at 0 range 16 .. 16;
      RXEN           at 0 range 17 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      LINCMD         at 0 range 24 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype SERCOM_CTRLC_SERCOM_USART_INT_GTIME_Field is HAL.UInt3;
   subtype SERCOM_CTRLC_SERCOM_USART_INT_BRKLEN_Field is HAL.UInt2;
   subtype SERCOM_CTRLC_SERCOM_USART_INT_HDRDLY_Field is HAL.UInt2;
   subtype SERCOM_CTRLC_SERCOM_USART_INT_MAXITER_Field is HAL.UInt3;

   --  USART_INT Control C
   type SERCOM_CTRLC_SERCOM_USART_INT_Register is record
      --  Guard Time
      GTIME          : SERCOM_CTRLC_SERCOM_USART_INT_GTIME_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      --  LIN Master Break Length
      BRKLEN         : SERCOM_CTRLC_SERCOM_USART_INT_BRKLEN_Field := 16#0#;
      --  LIN Master Header Delay
      HDRDLY         : SERCOM_CTRLC_SERCOM_USART_INT_HDRDLY_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Inhibit Not Acknowledge
      INACK          : Boolean := False;
      --  Disable Successive NACK
      DSNACK         : Boolean := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Maximum Iterations
      MAXITER        : SERCOM_CTRLC_SERCOM_USART_INT_MAXITER_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Data 32 Bit
      DATA32B        : CTRLC_DATA32BSelect_1 :=
                        SAM_SVD.SERCOM.DATA_READ_WRITE_CHSIZE;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLC_SERCOM_USART_INT_Register use record
      GTIME          at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      BRKLEN         at 0 range 8 .. 9;
      HDRDLY         at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      INACK          at 0 range 16 .. 16;
      DSNACK         at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      MAXITER        at 0 range 20 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      DATA32B        at 0 range 24 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype SERCOM_BAUD_FRAC_MODE_SERCOM_USART_INT_BAUD_Field is HAL.UInt13;
   subtype SERCOM_BAUD_FRAC_MODE_SERCOM_USART_INT_FP_Field is HAL.UInt3;

   --  USART_INT Baud Rate
   type SERCOM_BAUD_FRAC_MODE_SERCOM_USART_INT_Register is record
      --  Baud Rate Value
      BAUD : SERCOM_BAUD_FRAC_MODE_SERCOM_USART_INT_BAUD_Field := 16#0#;
      --  Fractional Part
      FP   : SERCOM_BAUD_FRAC_MODE_SERCOM_USART_INT_FP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_FRAC_MODE_SERCOM_USART_INT_Register use record
      BAUD at 0 range 0 .. 12;
      FP   at 0 range 13 .. 15;
   end record;

   subtype SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_INT_BAUD_Field is HAL.UInt13;
   subtype SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_INT_FP_Field is HAL.UInt3;

   --  USART_INT Baud Rate
   type SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_INT_Register is record
      --  Baud Rate Value
      BAUD : SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_INT_BAUD_Field := 16#0#;
      --  Fractional Part
      FP   : SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_INT_FP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_INT_Register use record
      BAUD at 0 range 0 .. 12;
      FP   at 0 range 13 .. 15;
   end record;

   --  USART_INT Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_USART_INT_Register is record
      --  Data Register Empty Interrupt Disable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Disable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Disable
      RXC          : Boolean := False;
      --  Receive Start Interrupt Disable
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt Disable
      CTSIC        : Boolean := False;
      --  Break Received Interrupt Disable
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : HAL.Bit := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_USART_INT_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART_INT Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_USART_INT_Register is record
      --  Data Register Empty Interrupt Enable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Enable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Enable
      RXC          : Boolean := False;
      --  Receive Start Interrupt Enable
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt Enable
      CTSIC        : Boolean := False;
      --  Break Received Interrupt Enable
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : HAL.Bit := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_USART_INT_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART_INT Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_USART_INT_Register is record
      --  Data Register Empty Interrupt
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt
      TXC          : Boolean := False;
      --  Receive Complete Interrupt
      RXC          : Boolean := False;
      --  Receive Start Interrupt
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt
      CTSIC        : Boolean := False;
      --  Break Received Interrupt
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : HAL.Bit := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_USART_INT_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART_INT Status
   type SERCOM_STATUS_SERCOM_USART_INT_Register is record
      --  Parity Error
      PERR          : Boolean := False;
      --  Frame Error
      FERR          : Boolean := False;
      --  Buffer Overflow
      BUFOVF        : Boolean := False;
      --  Clear To Send
      CTS           : Boolean := False;
      --  Inconsistent Sync Field
      ISF           : Boolean := False;
      --  Collision Detected
      COLL          : Boolean := False;
      --  Transmitter Empty
      TXE           : Boolean := False;
      --  Maximum Number of Repetitions Reached
      ITER          : Boolean := False;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_USART_INT_Register use record
      PERR          at 0 range 0 .. 0;
      FERR          at 0 range 1 .. 1;
      BUFOVF        at 0 range 2 .. 2;
      CTS           at 0 range 3 .. 3;
      ISF           at 0 range 4 .. 4;
      COLL          at 0 range 5 .. 5;
      TXE           at 0 range 6 .. 6;
      ITER          at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  USART_INT Synchronization Busy
   type SERCOM_SYNCBUSY_SERCOM_USART_INT_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. CTRLB Synchronization Busy
      CTRLB         : Boolean;
      --  Read-only. RXERRCNT Synchronization Busy
      RXERRCNT      : Boolean;
      --  Read-only. LENGTH Synchronization Busy
      LENGTH        : Boolean;
      --  unspecified
      Reserved_5_31 : HAL.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_USART_INT_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      RXERRCNT      at 0 range 3 .. 3;
      LENGTH        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype SERCOM_LENGTH_SERCOM_USART_INT_LEN_Field is HAL.UInt8;
   subtype SERCOM_LENGTH_SERCOM_USART_INT_LENEN_Field is HAL.UInt2;

   --  USART_INT Length
   type SERCOM_LENGTH_SERCOM_USART_INT_Register is record
      --  Data Length
      LEN            : SERCOM_LENGTH_SERCOM_USART_INT_LEN_Field := 16#0#;
      --  Data Length Enable
      LENEN          : SERCOM_LENGTH_SERCOM_USART_INT_LENEN_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_LENGTH_SERCOM_USART_INT_Register use record
      LEN            at 0 range 0 .. 7;
      LENEN          at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  USART_INT Debug Control
   type SERCOM_DBGCTRL_SERCOM_USART_INT_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_USART_INT_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   type SercomUsart_int_Disc is
     (Default,
      FRAC_MODE,
      FRACFP_MODE,
      USARTFP_MODE);

   --  USART INTERNAL CLOCK Mode
   type SercomUsart_int_Cluster
     (Discriminent : SercomUsart_int_Disc := Default)
   is record
      --  USART_INT Control A
      CTRLA             : aliased SERCOM_CTRLA_SERCOM_USART_INT_Register;
      --  USART_INT Control B
      CTRLB             : aliased SERCOM_CTRLB_SERCOM_USART_INT_Register;
      --  USART_INT Control C
      CTRLC             : aliased SERCOM_CTRLC_SERCOM_USART_INT_Register;
      --  USART_INT Receive Pulse Length
      RXPL              : aliased HAL.UInt8;
      --  USART_INT Interrupt Enable Clear
      INTENCLR          : aliased SERCOM_INTENCLR_SERCOM_USART_INT_Register;
      --  USART_INT Interrupt Enable Set
      INTENSET          : aliased SERCOM_INTENSET_SERCOM_USART_INT_Register;
      --  USART_INT Interrupt Flag Status and Clear
      INTFLAG           : aliased SERCOM_INTFLAG_SERCOM_USART_INT_Register;
      --  USART_INT Status
      STATUS            : aliased SERCOM_STATUS_SERCOM_USART_INT_Register;
      --  USART_INT Synchronization Busy
      SYNCBUSY          : aliased SERCOM_SYNCBUSY_SERCOM_USART_INT_Register;
      --  USART_INT Receive Error Count
      RXERRCNT          : aliased HAL.UInt8;
      --  USART_INT Length
      LENGTH            : aliased SERCOM_LENGTH_SERCOM_USART_INT_Register;
      --  USART_INT Data
      DATA              : aliased HAL.UInt32;
      --  USART_INT Debug Control
      DBGCTRL           : aliased SERCOM_DBGCTRL_SERCOM_USART_INT_Register;
      case Discriminent is
         when Default =>
            --  USART_INT Baud Rate
            BAUD : aliased HAL.UInt16;
         when FRAC_MODE =>
            --  USART_INT Baud Rate
            BAUD_FRAC_MODE : aliased SERCOM_BAUD_FRAC_MODE_SERCOM_USART_INT_Register;
         when FRACFP_MODE =>
            --  USART_INT Baud Rate
            BAUD_FRACFP_MODE : aliased SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_INT_Register;
         when USARTFP_MODE =>
            --  USART_INT Baud Rate
            BAUD_USARTFP_MODE : aliased HAL.UInt16;
      end case;
   end record
     with Unchecked_Union, Size => 416;

   for SercomUsart_int_Cluster use record
      CTRLA             at 16#0# range 0 .. 31;
      CTRLB             at 16#4# range 0 .. 31;
      CTRLC             at 16#8# range 0 .. 31;
      RXPL              at 16#E# range 0 .. 7;
      INTENCLR          at 16#14# range 0 .. 7;
      INTENSET          at 16#16# range 0 .. 7;
      INTFLAG           at 16#18# range 0 .. 7;
      STATUS            at 16#1A# range 0 .. 15;
      SYNCBUSY          at 16#1C# range 0 .. 31;
      RXERRCNT          at 16#20# range 0 .. 7;
      LENGTH            at 16#22# range 0 .. 15;
      DATA              at 16#28# range 0 .. 31;
      DBGCTRL           at 16#30# range 0 .. 7;
      BAUD              at 16#C# range 0 .. 15;
      BAUD_FRAC_MODE    at 16#C# range 0 .. 15;
      BAUD_FRACFP_MODE  at 16#C# range 0 .. 15;
      BAUD_USARTFP_MODE at 16#C# range 0 .. 15;
   end record;

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpis cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpim cluster's Registers --
   ------------------------------------

   -----------------------------------------
   -- SercomUsart_ext cluster's Registers --
   -----------------------------------------

   -----------------------------------------
   -- SercomUsart_int cluster's Registers --
   -----------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpis cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpim cluster's Registers --
   ------------------------------------

   -----------------------------------------
   -- SercomUsart_ext cluster's Registers --
   -----------------------------------------

   -----------------------------------------
   -- SercomUsart_int cluster's Registers --
   -----------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpis cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpim cluster's Registers --
   ------------------------------------

   -----------------------------------------
   -- SercomUsart_ext cluster's Registers --
   -----------------------------------------

   -----------------------------------------
   -- SercomUsart_int cluster's Registers --
   -----------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpis cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpim cluster's Registers --
   ------------------------------------

   -----------------------------------------
   -- SercomUsart_ext cluster's Registers --
   -----------------------------------------

   -----------------------------------------
   -- SercomUsart_int cluster's Registers --
   -----------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpis cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomSpim cluster's Registers --
   ------------------------------------

   -----------------------------------------
   -- SercomUsart_ext cluster's Registers --
   -----------------------------------------

   -----------------------------------------
   -- SercomUsart_int cluster's Registers --
   -----------------------------------------

   -----------------
   -- Peripherals --
   -----------------

   type SERCOM0_Disc is
     (I2CM,
      I2CS,
      SPIS,
      SPIM,
      USART_EXT,
      USART_INT);

   --  Serial Communication Interface
   type SERCOM_Peripheral
     (Discriminent : SERCOM0_Disc := I2CM)
   is record
      case Discriminent is
         when I2CM =>
            --  I2C Master Mode
            SERCOM_I2CM : aliased SercomI2cm_Cluster;
         when I2CS =>
            --  I2C Slave Mode
            SERCOM_I2CS : aliased SercomI2cs_Cluster;
         when SPIS =>
            --  SPI Slave Mode
            SERCOM_SPIS : aliased SercomSpis_Cluster;
         when SPIM =>
            --  SPI Master Mode
            SERCOM_SPIM : aliased SercomSpim_Cluster;
         when USART_EXT =>
            --  USART EXTERNAL CLOCK Mode
            SERCOM_USART_EXT : aliased SercomUsart_ext_Cluster;
         when USART_INT =>
            --  USART INTERNAL CLOCK Mode
            SERCOM_USART_INT : aliased SercomUsart_int_Cluster;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for SERCOM_Peripheral use record
      SERCOM_I2CM      at 0 range 0 .. 415;
      SERCOM_I2CS      at 0 range 0 .. 351;
      SERCOM_SPIS      at 0 range 0 .. 415;
      SERCOM_SPIM      at 0 range 0 .. 415;
      SERCOM_USART_EXT at 0 range 0 .. 415;
      SERCOM_USART_INT at 0 range 0 .. 415;
   end record;

   --  Serial Communication Interface
   SERCOM0_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM0_Base;

   --  Serial Communication Interface
   SERCOM1_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM1_Base;

   --  Serial Communication Interface
   SERCOM2_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM2_Base;

   --  Serial Communication Interface
   SERCOM3_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM3_Base;

   --  Serial Communication Interface
   SERCOM4_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM4_Base;

   --  Serial Communication Interface
   SERCOM5_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM5_Base;

end SAM_SVD.SERCOM;
