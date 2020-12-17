pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.MCLK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Interrupt Enable Clear
   type MCLK_INTENCLR_Register is record
      --  Clock Ready Interrupt Enable
      CKRDY        : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for MCLK_INTENCLR_Register use record
      CKRDY        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Set
   type MCLK_INTENSET_Register is record
      --  Clock Ready Interrupt Enable
      CKRDY        : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for MCLK_INTENSET_Register use record
      CKRDY        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type MCLK_INTFLAG_Register is record
      --  Clock Ready
      CKRDY        : Boolean := True;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for MCLK_INTFLAG_Register use record
      CKRDY        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  AHB Mask
   type MCLK_AHBMASK_Register is record
      --  HPB0 AHB Clock Mask
      HPB0             : Boolean := True;
      --  HPB1 AHB Clock Mask
      HPB1             : Boolean := True;
      --  HPB2 AHB Clock Mask
      HPB2             : Boolean := True;
      --  HPB3 AHB Clock Mask
      HPB3             : Boolean := True;
      --  DSU AHB Clock Mask
      DSU              : Boolean := True;
      --  HMATRIX AHB Clock Mask
      HMATRIX          : Boolean := True;
      --  NVMCTRL AHB Clock Mask
      NVMCTRL          : Boolean := True;
      --  HSRAM AHB Clock Mask
      HSRAM            : Boolean := True;
      --  CMCC AHB Clock Mask
      CMCC             : Boolean := True;
      --  DMAC AHB Clock Mask
      DMAC             : Boolean := True;
      --  USB AHB Clock Mask
      USB              : Boolean := True;
      --  BKUPRAM AHB Clock Mask
      BKUPRAM          : Boolean := True;
      --  PAC AHB Clock Mask
      PAC              : Boolean := True;
      --  QSPI AHB Clock Mask
      QSPI             : Boolean := True;
      --  unspecified
      Reserved_14_14   : HAL.Bit := 16#1#;
      --  SDHC0 AHB Clock Mask
      SDHC0            : Boolean := True;
      --  unspecified
      Reserved_16_18   : HAL.UInt3 := 16#7#;
      --  ICM AHB Clock Mask
      ICM              : Boolean := True;
      --  PUKCC AHB Clock Mask
      PUKCC            : Boolean := True;
      --  QSPI_2X AHB Clock Mask
      QSPI_2X          : Boolean := True;
      --  NVMCTRL_SMEEPROM AHB Clock Mask
      NVMCTRL_SMEEPROM : Boolean := True;
      --  NVMCTRL_CACHE AHB Clock Mask
      NVMCTRL_CACHE    : Boolean := True;
      --  unspecified
      Reserved_24_31   : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCLK_AHBMASK_Register use record
      HPB0             at 0 range 0 .. 0;
      HPB1             at 0 range 1 .. 1;
      HPB2             at 0 range 2 .. 2;
      HPB3             at 0 range 3 .. 3;
      DSU              at 0 range 4 .. 4;
      HMATRIX          at 0 range 5 .. 5;
      NVMCTRL          at 0 range 6 .. 6;
      HSRAM            at 0 range 7 .. 7;
      CMCC             at 0 range 8 .. 8;
      DMAC             at 0 range 9 .. 9;
      USB              at 0 range 10 .. 10;
      BKUPRAM          at 0 range 11 .. 11;
      PAC              at 0 range 12 .. 12;
      QSPI             at 0 range 13 .. 13;
      Reserved_14_14   at 0 range 14 .. 14;
      SDHC0            at 0 range 15 .. 15;
      Reserved_16_18   at 0 range 16 .. 18;
      ICM              at 0 range 19 .. 19;
      PUKCC            at 0 range 20 .. 20;
      QSPI_2X          at 0 range 21 .. 21;
      NVMCTRL_SMEEPROM at 0 range 22 .. 22;
      NVMCTRL_CACHE    at 0 range 23 .. 23;
      Reserved_24_31   at 0 range 24 .. 31;
   end record;

   --  APBA Mask
   type MCLK_APBAMASK_Register is record
      --  PAC APB Clock Enable
      PAC            : Boolean := True;
      --  PM APB Clock Enable
      PM             : Boolean := True;
      --  MCLK APB Clock Enable
      MCLK           : Boolean := True;
      --  RSTC APB Clock Enable
      RSTC           : Boolean := True;
      --  OSCCTRL APB Clock Enable
      OSCCTRL        : Boolean := True;
      --  OSC32KCTRL APB Clock Enable
      OSC32KCTRL     : Boolean := True;
      --  SUPC APB Clock Enable
      SUPC           : Boolean := True;
      --  GCLK APB Clock Enable
      GCLK           : Boolean := True;
      --  WDT APB Clock Enable
      WDT            : Boolean := True;
      --  RTC APB Clock Enable
      RTC            : Boolean := True;
      --  EIC APB Clock Enable
      EIC            : Boolean := True;
      --  FREQM APB Clock Enable
      FREQM          : Boolean := False;
      --  SERCOM0 APB Clock Enable
      SERCOM0        : Boolean := False;
      --  SERCOM1 APB Clock Enable
      SERCOM1        : Boolean := False;
      --  TC0 APB Clock Enable
      TC0            : Boolean := False;
      --  TC1 APB Clock Enable
      TC1            : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCLK_APBAMASK_Register use record
      PAC            at 0 range 0 .. 0;
      PM             at 0 range 1 .. 1;
      MCLK           at 0 range 2 .. 2;
      RSTC           at 0 range 3 .. 3;
      OSCCTRL        at 0 range 4 .. 4;
      OSC32KCTRL     at 0 range 5 .. 5;
      SUPC           at 0 range 6 .. 6;
      GCLK           at 0 range 7 .. 7;
      WDT            at 0 range 8 .. 8;
      RTC            at 0 range 9 .. 9;
      EIC            at 0 range 10 .. 10;
      FREQM          at 0 range 11 .. 11;
      SERCOM0        at 0 range 12 .. 12;
      SERCOM1        at 0 range 13 .. 13;
      TC0            at 0 range 14 .. 14;
      TC1            at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  APBB Mask
   type MCLK_APBBMASK_Register is record
      --  USB APB Clock Enable
      USB            : Boolean := False;
      --  DSU APB Clock Enable
      DSU            : Boolean := True;
      --  NVMCTRL APB Clock Enable
      NVMCTRL        : Boolean := True;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  PORT APB Clock Enable
      PORT           : Boolean := True;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  HMATRIX APB Clock Enable
      HMATRIX        : Boolean := True;
      --  EVSYS APB Clock Enable
      EVSYS          : Boolean := False;
      --  unspecified
      Reserved_8_8   : HAL.Bit := 16#0#;
      --  SERCOM2 APB Clock Enable
      SERCOM2        : Boolean := False;
      --  SERCOM3 APB Clock Enable
      SERCOM3        : Boolean := False;
      --  TCC0 APB Clock Enable
      TCC0           : Boolean := False;
      --  TCC1 APB Clock Enable
      TCC1           : Boolean := False;
      --  TC2 APB Clock Enable
      TC2            : Boolean := False;
      --  TC3 APB Clock Enable
      TC3            : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#1#;
      --  RAMECC APB Clock Enable
      RAMECC         : Boolean := True;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCLK_APBBMASK_Register use record
      USB            at 0 range 0 .. 0;
      DSU            at 0 range 1 .. 1;
      NVMCTRL        at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      PORT           at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      HMATRIX        at 0 range 6 .. 6;
      EVSYS          at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      SERCOM2        at 0 range 9 .. 9;
      SERCOM3        at 0 range 10 .. 10;
      TCC0           at 0 range 11 .. 11;
      TCC1           at 0 range 12 .. 12;
      TC2            at 0 range 13 .. 13;
      TC3            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      RAMECC         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  APBC Mask
   type MCLK_APBCMASK_Register is record
      --  unspecified
      Reserved_0_2   : HAL.UInt3 := 16#0#;
      --  TCC2 APB Clock Enable
      TCC2           : Boolean := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  PDEC APB Clock Enable
      PDEC           : Boolean := False;
      --  AC APB Clock Enable
      AC             : Boolean := False;
      --  AES APB Clock Enable
      AES            : Boolean := False;
      --  TRNG APB Clock Enable
      TRNG           : Boolean := False;
      --  ICM APB Clock Enable
      ICM            : Boolean := False;
      --  unspecified
      Reserved_12_12 : HAL.Bit := 16#0#;
      --  QSPI APB Clock Enable
      QSPI           : Boolean := True;
      --  CCL APB Clock Enable
      CCL            : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCLK_APBCMASK_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      TCC2           at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      PDEC           at 0 range 7 .. 7;
      AC             at 0 range 8 .. 8;
      AES            at 0 range 9 .. 9;
      TRNG           at 0 range 10 .. 10;
      ICM            at 0 range 11 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      QSPI           at 0 range 13 .. 13;
      CCL            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  APBD Mask
   type MCLK_APBDMASK_Register is record
      --  SERCOM4 APB Clock Enable
      SERCOM4        : Boolean := False;
      --  SERCOM5 APB Clock Enable
      SERCOM5        : Boolean := False;
      --  unspecified
      Reserved_2_6   : HAL.UInt5 := 16#0#;
      --  ADC0 APB Clock Enable
      ADC0           : Boolean := False;
      --  ADC1 APB Clock Enable
      ADC1           : Boolean := False;
      --  DAC APB Clock Enable
      DAC            : Boolean := False;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      --  PCC APB Clock Enable
      PCC            : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MCLK_APBDMASK_Register use record
      SERCOM4        at 0 range 0 .. 0;
      SERCOM5        at 0 range 1 .. 1;
      Reserved_2_6   at 0 range 2 .. 6;
      ADC0           at 0 range 7 .. 7;
      ADC1           at 0 range 8 .. 8;
      DAC            at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      PCC            at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Main Clock
   type MCLK_Peripheral is record
      --  Interrupt Enable Clear
      INTENCLR : aliased MCLK_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased MCLK_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased MCLK_INTFLAG_Register;
      --  HS Clock Division
      HSDIV    : aliased HAL.UInt8;
      --  CPU Clock Division
      CPUDIV   : aliased HAL.UInt8;
      --  AHB Mask
      AHBMASK  : aliased MCLK_AHBMASK_Register;
      --  APBA Mask
      APBAMASK : aliased MCLK_APBAMASK_Register;
      --  APBB Mask
      APBBMASK : aliased MCLK_APBBMASK_Register;
      --  APBC Mask
      APBCMASK : aliased MCLK_APBCMASK_Register;
      --  APBD Mask
      APBDMASK : aliased MCLK_APBDMASK_Register;
   end record
     with Volatile;

   for MCLK_Peripheral use record
      INTENCLR at 16#1# range 0 .. 7;
      INTENSET at 16#2# range 0 .. 7;
      INTFLAG  at 16#3# range 0 .. 7;
      HSDIV    at 16#4# range 0 .. 7;
      CPUDIV   at 16#5# range 0 .. 7;
      AHBMASK  at 16#10# range 0 .. 31;
      APBAMASK at 16#14# range 0 .. 31;
      APBBMASK at 16#18# range 0 .. 31;
      APBCMASK at 16#1C# range 0 .. 31;
      APBDMASK at 16#20# range 0 .. 31;
   end record;

   --  Main Clock
   MCLK_Periph : aliased MCLK_Peripheral
     with Import, Address => MCLK_Base;

end SAM_SVD.MCLK;
