pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.EIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Clock Selection
   type CTRLA_CKSELSelect is
     (--  Clocked by GCLK
      CLK_GCLK,
      --  Clocked by ULP32K
      CLK_ULP32K)
     with Size => 1;
   for CTRLA_CKSELSelect use
     (CLK_GCLK => 0,
      CLK_ULP32K => 1);

   --  Control A
   type EIC_CTRLA_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_3 : HAL.UInt2 := 16#0#;
      --  Clock Selection
      CKSEL        : CTRLA_CKSELSelect := SAM_SVD.EIC.CLK_GCLK;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EIC_CTRLA_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      CKSEL        at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  Non-Maskable Interrupt Sense Configuration
   type NMICTRL_NMISENSESelect is
     (--  No detection
      NONE,
      --  Rising-edge detection
      RISE,
      --  Falling-edge detection
      FALL,
      --  Both-edges detection
      BOTH,
      --  High-level detection
      HIGH,
      --  Low-level detection
      LOW)
     with Size => 3;
   for NMICTRL_NMISENSESelect use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Asynchronous Edge Detection Mode
   type NMICTRL_NMIASYNCHSelect is
     (--  Edge detection is clock synchronously operated
      SYNC,
      --  Edge detection is clock asynchronously operated
      ASYNC)
     with Size => 1;
   for NMICTRL_NMIASYNCHSelect use
     (SYNC => 0,
      ASYNC => 1);

   --  Non-Maskable Interrupt Control
   type EIC_NMICTRL_Register is record
      --  Non-Maskable Interrupt Sense Configuration
      NMISENSE     : NMICTRL_NMISENSESelect := SAM_SVD.EIC.NONE;
      --  Non-Maskable Interrupt Filter Enable
      NMIFILTEN    : Boolean := False;
      --  Asynchronous Edge Detection Mode
      NMIASYNCH    : NMICTRL_NMIASYNCHSelect := SAM_SVD.EIC.SYNC;
      --  unspecified
      Reserved_5_7 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for EIC_NMICTRL_Register use record
      NMISENSE     at 0 range 0 .. 2;
      NMIFILTEN    at 0 range 3 .. 3;
      NMIASYNCH    at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  Non-Maskable Interrupt Flag Status and Clear
   type EIC_NMIFLAG_Register is record
      --  Non-Maskable Interrupt
      NMI           : Boolean := False;
      --  unspecified
      Reserved_1_15 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EIC_NMIFLAG_Register use record
      NMI           at 0 range 0 .. 0;
      Reserved_1_15 at 0 range 1 .. 15;
   end record;

   --  Synchronization Busy
   type EIC_SYNCBUSY_Register is record
      --  Read-only. Software Reset Synchronization Busy Status
      SWRST         : Boolean;
      --  Read-only. Enable Synchronization Busy Status
      ENABLE        : Boolean;
      --  unspecified
      Reserved_2_31 : HAL.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_SYNCBUSY_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype EIC_EVCTRL_EXTINTEO_Field is HAL.UInt16;

   --  Event Control
   type EIC_EVCTRL_Register is record
      --  External Interrupt Event Output Enable
      EXTINTEO       : EIC_EVCTRL_EXTINTEO_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_EVCTRL_Register use record
      EXTINTEO       at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype EIC_INTENCLR_EXTINT_Field is HAL.UInt16;

   --  Interrupt Enable Clear
   type EIC_INTENCLR_Register is record
      --  External Interrupt Enable
      EXTINT         : EIC_INTENCLR_EXTINT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_INTENCLR_Register use record
      EXTINT         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype EIC_INTENSET_EXTINT_Field is HAL.UInt16;

   --  Interrupt Enable Set
   type EIC_INTENSET_Register is record
      --  External Interrupt Enable
      EXTINT         : EIC_INTENSET_EXTINT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_INTENSET_Register use record
      EXTINT         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype EIC_INTFLAG_EXTINT_Field is HAL.UInt16;

   --  Interrupt Flag Status and Clear
   type EIC_INTFLAG_Register is record
      --  External Interrupt
      EXTINT         : EIC_INTFLAG_EXTINT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_INTFLAG_Register use record
      EXTINT         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Asynchronous Edge Detection Mode
   type ASYNCH_ASYNCHSelect is
     (--  Edge detection is clock synchronously operated
      SYNC,
      --  Edge detection is clock asynchronously operated
      ASYNC)
     with Size => 16;
   for ASYNCH_ASYNCHSelect use
     (SYNC => 0,
      ASYNC => 1);

   --  External Interrupt Asynchronous Mode
   type EIC_ASYNCH_Register is record
      --  Asynchronous Edge Detection Mode
      ASYNCH         : ASYNCH_ASYNCHSelect := SAM_SVD.EIC.SYNC;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_ASYNCH_Register use record
      ASYNCH         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Input Sense Configuration 0
   type CONFIG_SENSE0Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE0Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration 1
   type CONFIG_SENSE1Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE1Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration 2
   type CONFIG_SENSE2Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE2Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration 3
   type CONFIG_SENSE3Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE3Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration 4
   type CONFIG_SENSE4Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE4Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration 5
   type CONFIG_SENSE5Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE5Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration 6
   type CONFIG_SENSE6Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE6Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  Input Sense Configuration 7
   type CONFIG_SENSE7Select is
     (--  No detection
      NONE,
      --  Rising edge detection
      RISE,
      --  Falling edge detection
      FALL,
      --  Both edges detection
      BOTH,
      --  High level detection
      HIGH,
      --  Low level detection
      LOW)
     with Size => 3;
   for CONFIG_SENSE7Select use
     (NONE => 0,
      RISE => 1,
      FALL => 2,
      BOTH => 3,
      HIGH => 4,
      LOW => 5);

   --  External Interrupt Sense Configuration
   type EIC_CONFIG_Register is record
      --  Input Sense Configuration 0
      SENSE0  : CONFIG_SENSE0Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 0
      FILTEN0 : Boolean := False;
      --  Input Sense Configuration 1
      SENSE1  : CONFIG_SENSE1Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 1
      FILTEN1 : Boolean := False;
      --  Input Sense Configuration 2
      SENSE2  : CONFIG_SENSE2Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 2
      FILTEN2 : Boolean := False;
      --  Input Sense Configuration 3
      SENSE3  : CONFIG_SENSE3Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 3
      FILTEN3 : Boolean := False;
      --  Input Sense Configuration 4
      SENSE4  : CONFIG_SENSE4Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 4
      FILTEN4 : Boolean := False;
      --  Input Sense Configuration 5
      SENSE5  : CONFIG_SENSE5Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 5
      FILTEN5 : Boolean := False;
      --  Input Sense Configuration 6
      SENSE6  : CONFIG_SENSE6Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 6
      FILTEN6 : Boolean := False;
      --  Input Sense Configuration 7
      SENSE7  : CONFIG_SENSE7Select := SAM_SVD.EIC.NONE;
      --  Filter Enable 7
      FILTEN7 : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_CONFIG_Register use record
      SENSE0  at 0 range 0 .. 2;
      FILTEN0 at 0 range 3 .. 3;
      SENSE1  at 0 range 4 .. 6;
      FILTEN1 at 0 range 7 .. 7;
      SENSE2  at 0 range 8 .. 10;
      FILTEN2 at 0 range 11 .. 11;
      SENSE3  at 0 range 12 .. 14;
      FILTEN3 at 0 range 15 .. 15;
      SENSE4  at 0 range 16 .. 18;
      FILTEN4 at 0 range 19 .. 19;
      SENSE5  at 0 range 20 .. 22;
      FILTEN5 at 0 range 23 .. 23;
      SENSE6  at 0 range 24 .. 26;
      FILTEN6 at 0 range 27 .. 27;
      SENSE7  at 0 range 28 .. 30;
      FILTEN7 at 0 range 31 .. 31;
   end record;

   --  External Interrupt Sense Configuration
   type EIC_CONFIG_Registers is array (0 .. 1) of EIC_CONFIG_Register;

   subtype EIC_DEBOUNCEN_DEBOUNCEN_Field is HAL.UInt16;

   --  Debouncer Enable
   type EIC_DEBOUNCEN_Register is record
      --  Debouncer Enable
      DEBOUNCEN      : EIC_DEBOUNCEN_DEBOUNCEN_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_DEBOUNCEN_Register use record
      DEBOUNCEN      at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Debouncer Prescaler
   type DPRESCALER_PRESCALER0Select is
     (--  EIC clock divided by 2
      DIV2,
      --  EIC clock divided by 4
      DIV4,
      --  EIC clock divided by 8
      DIV8,
      --  EIC clock divided by 16
      DIV16,
      --  EIC clock divided by 32
      DIV32,
      --  EIC clock divided by 64
      DIV64,
      --  EIC clock divided by 128
      DIV128,
      --  EIC clock divided by 256
      DIV256)
     with Size => 3;
   for DPRESCALER_PRESCALER0Select use
     (DIV2 => 0,
      DIV4 => 1,
      DIV8 => 2,
      DIV16 => 3,
      DIV32 => 4,
      DIV64 => 5,
      DIV128 => 6,
      DIV256 => 7);

   --  Debouncer number of states
   type DPRESCALER_STATES0Select is
     (--  3 low frequency samples
      LFREQ3,
      --  7 low frequency samples
      LFREQ7)
     with Size => 1;
   for DPRESCALER_STATES0Select use
     (LFREQ3 => 0,
      LFREQ7 => 1);

   --  Debouncer Prescaler
   type DPRESCALER_PRESCALER1Select is
     (--  EIC clock divided by 2
      DIV2,
      --  EIC clock divided by 4
      DIV4,
      --  EIC clock divided by 8
      DIV8,
      --  EIC clock divided by 16
      DIV16,
      --  EIC clock divided by 32
      DIV32,
      --  EIC clock divided by 64
      DIV64,
      --  EIC clock divided by 128
      DIV128,
      --  EIC clock divided by 256
      DIV256)
     with Size => 3;
   for DPRESCALER_PRESCALER1Select use
     (DIV2 => 0,
      DIV4 => 1,
      DIV8 => 2,
      DIV16 => 3,
      DIV32 => 4,
      DIV64 => 5,
      DIV128 => 6,
      DIV256 => 7);

   --  Debouncer number of states
   type DPRESCALER_STATES1Select is
     (--  3 low frequency samples
      LFREQ3,
      --  7 low frequency samples
      LFREQ7)
     with Size => 1;
   for DPRESCALER_STATES1Select use
     (LFREQ3 => 0,
      LFREQ7 => 1);

   --  Pin Sampler frequency selection
   type DPRESCALER_TICKONSelect is
     (--  Clocked by GCLK
      CLK_GCLK_EIC,
      --  Clocked by Low Frequency Clock
      CLK_LFREQ)
     with Size => 1;
   for DPRESCALER_TICKONSelect use
     (CLK_GCLK_EIC => 0,
      CLK_LFREQ => 1);

   --  Debouncer Prescaler
   type EIC_DPRESCALER_Register is record
      --  Debouncer Prescaler
      PRESCALER0     : DPRESCALER_PRESCALER0Select := SAM_SVD.EIC.DIV2;
      --  Debouncer number of states
      STATES0        : DPRESCALER_STATES0Select := SAM_SVD.EIC.LFREQ3;
      --  Debouncer Prescaler
      PRESCALER1     : DPRESCALER_PRESCALER1Select := SAM_SVD.EIC.DIV2;
      --  Debouncer number of states
      STATES1        : DPRESCALER_STATES1Select := SAM_SVD.EIC.LFREQ3;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  Pin Sampler frequency selection
      TICKON         : DPRESCALER_TICKONSelect := SAM_SVD.EIC.CLK_GCLK_EIC;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_DPRESCALER_Register use record
      PRESCALER0     at 0 range 0 .. 2;
      STATES0        at 0 range 3 .. 3;
      PRESCALER1     at 0 range 4 .. 6;
      STATES1        at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      TICKON         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype EIC_PINSTATE_PINSTATE_Field is HAL.UInt16;

   --  Pin State
   type EIC_PINSTATE_Register is record
      --  Read-only. Pin State
      PINSTATE       : EIC_PINSTATE_PINSTATE_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EIC_PINSTATE_Register use record
      PINSTATE       at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  External Interrupt Controller
   type EIC_Peripheral is record
      --  Control A
      CTRLA      : aliased EIC_CTRLA_Register;
      --  Non-Maskable Interrupt Control
      NMICTRL    : aliased EIC_NMICTRL_Register;
      --  Non-Maskable Interrupt Flag Status and Clear
      NMIFLAG    : aliased EIC_NMIFLAG_Register;
      --  Synchronization Busy
      SYNCBUSY   : aliased EIC_SYNCBUSY_Register;
      --  Event Control
      EVCTRL     : aliased EIC_EVCTRL_Register;
      --  Interrupt Enable Clear
      INTENCLR   : aliased EIC_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET   : aliased EIC_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG    : aliased EIC_INTFLAG_Register;
      --  External Interrupt Asynchronous Mode
      ASYNCH     : aliased EIC_ASYNCH_Register;
      --  External Interrupt Sense Configuration
      CONFIG     : aliased EIC_CONFIG_Registers;
      --  Debouncer Enable
      DEBOUNCEN  : aliased EIC_DEBOUNCEN_Register;
      --  Debouncer Prescaler
      DPRESCALER : aliased EIC_DPRESCALER_Register;
      --  Pin State
      PINSTATE   : aliased EIC_PINSTATE_Register;
   end record
     with Volatile;

   for EIC_Peripheral use record
      CTRLA      at 16#0# range 0 .. 7;
      NMICTRL    at 16#1# range 0 .. 7;
      NMIFLAG    at 16#2# range 0 .. 15;
      SYNCBUSY   at 16#4# range 0 .. 31;
      EVCTRL     at 16#8# range 0 .. 31;
      INTENCLR   at 16#C# range 0 .. 31;
      INTENSET   at 16#10# range 0 .. 31;
      INTFLAG    at 16#14# range 0 .. 31;
      ASYNCH     at 16#18# range 0 .. 31;
      CONFIG     at 16#1C# range 0 .. 63;
      DEBOUNCEN  at 16#30# range 0 .. 31;
      DPRESCALER at 16#34# range 0 .. 31;
      PINSTATE   at 16#38# range 0 .. 31;
   end record;

   --  External Interrupt Controller
   EIC_Periph : aliased EIC_Peripheral
     with Import, Address => EIC_Base;

end SAM_SVD.EIC;
