pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.ETM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ETM_CR_PORTSIZE_Field is HAL.UInt3;
   subtype ETM_CR_PORTMODE_Field is HAL.UInt2;

   --  ETM Main Control Register
   type ETM_CR_Register is record
      --  ETM Power Down
      ETMPD          : Boolean := True;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  Port Size bits 2:0
      PORTSIZE       : ETM_CR_PORTSIZE_Field := 16#1#;
      --  Stall Processor
      STALL          : Boolean := False;
      --  Branch Output
      BROUT          : Boolean := False;
      --  Debug Request Control
      DBGRQ          : Boolean := False;
      --  ETM Programming
      PROG           : Boolean := True;
      --  ETM Port Select
      PORTSEL        : Boolean := False;
      --  unspecified
      Reserved_12_12 : HAL.Bit := 16#0#;
      --  Port Mode bit 2
      PORTMODE2      : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Port Mode bits 1:0
      PORTMODE       : ETM_CR_PORTMODE_Field := 16#0#;
      --  unspecified
      Reserved_18_20 : HAL.UInt3 := 16#0#;
      --  Port Size bit 3
      PORTSIZE3      : Boolean := False;
      --  unspecified
      Reserved_22_27 : HAL.UInt6 := 16#0#;
      --  TimeStamp Enable
      TSEN           : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ETM_CR_Register use record
      ETMPD          at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      PORTSIZE       at 0 range 4 .. 6;
      STALL          at 0 range 7 .. 7;
      BROUT          at 0 range 8 .. 8;
      DBGRQ          at 0 range 9 .. 9;
      PROG           at 0 range 10 .. 10;
      PORTSEL        at 0 range 11 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      PORTMODE2      at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      PORTMODE       at 0 range 16 .. 17;
      Reserved_18_20 at 0 range 18 .. 20;
      PORTSIZE3      at 0 range 21 .. 21;
      Reserved_22_27 at 0 range 22 .. 27;
      TSEN           at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  ETM Integration Mode Control Register
   type ETM_ITCTRL_Register is record
      INTEGRATION   : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ETM_ITCTRL_Register use record
      INTEGRATION   at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  ETM Lock Status Register
   type ETM_LSR_Register is record
      --  Read-only.
      Present       : Boolean;
      --  Read-only.
      Access_k      : Boolean;
      --  Read-only.
      ByteAcc       : Boolean;
      --  unspecified
      Reserved_3_31 : HAL.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ETM_LSR_Register use record
      Present       at 0 range 0 .. 0;
      Access_k      at 0 range 1 .. 1;
      ByteAcc       at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Embedded Trace Macrocell
   type ETM_Peripheral is record
      --  ETM Main Control Register
      CR         : aliased ETM_CR_Register;
      --  ETM Configuration Code Register
      CCR        : aliased HAL.UInt32;
      --  ETM Trigger Event Register
      TRIGGER    : aliased HAL.UInt32;
      --  ETM Status Register
      SR         : aliased HAL.UInt32;
      --  ETM System Configuration Register
      SCR        : aliased HAL.UInt32;
      --  ETM TraceEnable Event Register
      TEEVR      : aliased HAL.UInt32;
      --  ETM TraceEnable Control 1 Register
      TECR1      : aliased HAL.UInt32;
      --  ETM FIFO Full Level Register
      FFLR       : aliased HAL.UInt32;
      --  ETM Free-running Counter Reload Value
      CNTRLDVR1  : aliased HAL.UInt32;
      --  ETM Synchronization Frequency Register
      SYNCFR     : aliased HAL.UInt32;
      --  ETM ID Register
      IDR        : aliased HAL.UInt32;
      --  ETM Configuration Code Extension Register
      CCER       : aliased HAL.UInt32;
      --  ETM TraceEnable Start/Stop EmbeddedICE Control Register
      TESSEICR   : aliased HAL.UInt32;
      --  ETM TimeStamp Event Register
      TSEVT      : aliased HAL.UInt32;
      --  ETM CoreSight Trace ID Register
      TRACEIDR   : aliased HAL.UInt32;
      --  ETM ID Register 2
      IDR2       : aliased HAL.UInt32;
      --  ETM Device Power-Down Status Register
      PDSR       : aliased HAL.UInt32;
      --  ETM Integration Test Miscellaneous Inputs
      ITMISCIN   : aliased HAL.UInt32;
      --  ETM Integration Test Trigger Out
      ITTRIGOUT  : aliased HAL.UInt32;
      --  ETM Integration Test ATB Control 2
      ITATBCTR2  : aliased HAL.UInt32;
      --  ETM Integration Test ATB Control 0
      ITATBCTR0  : aliased HAL.UInt32;
      --  ETM Integration Mode Control Register
      ITCTRL     : aliased ETM_ITCTRL_Register;
      --  ETM Claim Tag Set Register
      CLAIMSET   : aliased HAL.UInt32;
      --  ETM Claim Tag Clear Register
      CLAIMCLR   : aliased HAL.UInt32;
      --  ETM Lock Access Register
      LAR        : aliased HAL.UInt32;
      --  ETM Lock Status Register
      LSR        : aliased ETM_LSR_Register;
      --  ETM Authentication Status Register
      AUTHSTATUS : aliased HAL.UInt32;
      --  ETM CoreSight Device Type Register
      DEVTYPE    : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #4
      PIDR4      : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #5
      PIDR5      : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #6
      PIDR6      : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #7
      PIDR7      : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #0
      PIDR0      : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #1
      PIDR1      : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #2
      PIDR2      : aliased HAL.UInt32;
      --  ETM Peripheral Identification Register #3
      PIDR3      : aliased HAL.UInt32;
      --  ETM Component Identification Register #0
      CIDR0      : aliased HAL.UInt32;
      --  ETM Component Identification Register #1
      CIDR1      : aliased HAL.UInt32;
      --  ETM Component Identification Register #2
      CIDR2      : aliased HAL.UInt32;
      --  ETM Component Identification Register #3
      CIDR3      : aliased HAL.UInt32;
   end record
     with Volatile;

   for ETM_Peripheral use record
      CR         at 16#0# range 0 .. 31;
      CCR        at 16#4# range 0 .. 31;
      TRIGGER    at 16#8# range 0 .. 31;
      SR         at 16#10# range 0 .. 31;
      SCR        at 16#14# range 0 .. 31;
      TEEVR      at 16#20# range 0 .. 31;
      TECR1      at 16#24# range 0 .. 31;
      FFLR       at 16#28# range 0 .. 31;
      CNTRLDVR1  at 16#140# range 0 .. 31;
      SYNCFR     at 16#1E0# range 0 .. 31;
      IDR        at 16#1E4# range 0 .. 31;
      CCER       at 16#1E8# range 0 .. 31;
      TESSEICR   at 16#1F0# range 0 .. 31;
      TSEVT      at 16#1F8# range 0 .. 31;
      TRACEIDR   at 16#200# range 0 .. 31;
      IDR2       at 16#208# range 0 .. 31;
      PDSR       at 16#314# range 0 .. 31;
      ITMISCIN   at 16#EE0# range 0 .. 31;
      ITTRIGOUT  at 16#EE8# range 0 .. 31;
      ITATBCTR2  at 16#EF0# range 0 .. 31;
      ITATBCTR0  at 16#EF8# range 0 .. 31;
      ITCTRL     at 16#F00# range 0 .. 31;
      CLAIMSET   at 16#FA0# range 0 .. 31;
      CLAIMCLR   at 16#FA4# range 0 .. 31;
      LAR        at 16#FB0# range 0 .. 31;
      LSR        at 16#FB4# range 0 .. 31;
      AUTHSTATUS at 16#FB8# range 0 .. 31;
      DEVTYPE    at 16#FCC# range 0 .. 31;
      PIDR4      at 16#FD0# range 0 .. 31;
      PIDR5      at 16#FD4# range 0 .. 31;
      PIDR6      at 16#FD8# range 0 .. 31;
      PIDR7      at 16#FDC# range 0 .. 31;
      PIDR0      at 16#FE0# range 0 .. 31;
      PIDR1      at 16#FE4# range 0 .. 31;
      PIDR2      at 16#FE8# range 0 .. 31;
      PIDR3      at 16#FEC# range 0 .. 31;
      CIDR0      at 16#FF0# range 0 .. 31;
      CIDR1      at 16#FF4# range 0 .. 31;
      CIDR2      at 16#FF8# range 0 .. 31;
      CIDR3      at 16#FFC# range 0 .. 31;
   end record;

   --  Embedded Trace Macrocell
   ETM_Periph : aliased ETM_Peripheral
     with Import, Address => ETM_Base;

end SAM_SVD.ETM;
