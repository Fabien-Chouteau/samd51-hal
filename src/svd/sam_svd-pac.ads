pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.PAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype PAC_WRCTRL_PERID_Field is HAL.UInt16;

   --  Peripheral access control key
   type WRCTRL_KEYSelect is
     (--  No action
      OFF,
      --  Clear protection
      CLR,
      --  Set protection
      SET,
      --  Set and lock protection
      SETLCK)
     with Size => 8;
   for WRCTRL_KEYSelect use
     (OFF => 0,
      CLR => 1,
      SET => 2,
      SETLCK => 3);

   --  Write control
   type PAC_WRCTRL_Register is record
      --  Peripheral identifier
      PERID          : PAC_WRCTRL_PERID_Field := 16#0#;
      --  Peripheral access control key
      KEY            : WRCTRL_KEYSelect := SAM_SVD.PAC.OFF;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_WRCTRL_Register use record
      PERID          at 0 range 0 .. 15;
      KEY            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Event control
   type PAC_EVCTRL_Register is record
      --  Peripheral acess error event output
      ERREO        : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PAC_EVCTRL_Register use record
      ERREO        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt enable clear
   type PAC_INTENCLR_Register is record
      --  Peripheral access error interrupt disable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PAC_INTENCLR_Register use record
      ERR          at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt enable set
   type PAC_INTENSET_Register is record
      --  Peripheral access error interrupt enable
      ERR          : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PAC_INTENSET_Register use record
      ERR          at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Bridge interrupt flag status
   type PAC_INTFLAGAHB_Register is record
      --  FLASH
      FLASH          : Boolean := False;
      --  FLASH_ALT
      FLASH_ALT      : Boolean := False;
      --  SEEPROM
      SEEPROM        : Boolean := False;
      --  RAMCM4S
      RAMCM4S        : Boolean := False;
      --  RAMPPPDSU
      RAMPPPDSU      : Boolean := False;
      --  RAMDMAWR
      RAMDMAWR       : Boolean := False;
      --  RAMDMACICM
      RAMDMACICM     : Boolean := False;
      --  HPB0
      HPB0           : Boolean := False;
      --  HPB1
      HPB1           : Boolean := False;
      --  HPB2
      HPB2           : Boolean := False;
      --  HPB3
      HPB3           : Boolean := False;
      --  PUKCC
      PUKCC          : Boolean := False;
      --  SDHC0
      SDHC0          : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      --  QSPI
      QSPI           : Boolean := False;
      --  BKUPRAM
      BKUPRAM        : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_INTFLAGAHB_Register use record
      FLASH          at 0 range 0 .. 0;
      FLASH_ALT      at 0 range 1 .. 1;
      SEEPROM        at 0 range 2 .. 2;
      RAMCM4S        at 0 range 3 .. 3;
      RAMPPPDSU      at 0 range 4 .. 4;
      RAMDMAWR       at 0 range 5 .. 5;
      RAMDMACICM     at 0 range 6 .. 6;
      HPB0           at 0 range 7 .. 7;
      HPB1           at 0 range 8 .. 8;
      HPB2           at 0 range 9 .. 9;
      HPB3           at 0 range 10 .. 10;
      PUKCC          at 0 range 11 .. 11;
      SDHC0          at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      QSPI           at 0 range 14 .. 14;
      BKUPRAM        at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Peripheral interrupt flag status - Bridge A
   type PAC_INTFLAGA_Register is record
      --  PAC
      PAC            : Boolean := False;
      --  PM
      PM             : Boolean := False;
      --  MCLK
      MCLK           : Boolean := False;
      --  RSTC
      RSTC           : Boolean := False;
      --  OSCCTRL
      OSCCTRL        : Boolean := False;
      --  OSC32KCTRL
      OSC32KCTRL     : Boolean := False;
      --  SUPC
      SUPC           : Boolean := False;
      --  GCLK
      GCLK           : Boolean := False;
      --  WDT
      WDT            : Boolean := False;
      --  RTC
      RTC            : Boolean := False;
      --  EIC
      EIC            : Boolean := False;
      --  FREQM
      FREQM          : Boolean := False;
      --  SERCOM0
      SERCOM0        : Boolean := False;
      --  SERCOM1
      SERCOM1        : Boolean := False;
      --  TC0
      TC0            : Boolean := False;
      --  TC1
      TC1            : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_INTFLAGA_Register use record
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

   --  Peripheral interrupt flag status - Bridge B
   type PAC_INTFLAGB_Register is record
      --  USB
      USB            : Boolean := False;
      --  DSU
      DSU            : Boolean := False;
      --  NVMCTRL
      NVMCTRL        : Boolean := False;
      --  CMCC
      CMCC           : Boolean := False;
      --  PORT
      PORT           : Boolean := False;
      --  DMAC
      DMAC           : Boolean := False;
      --  HMATRIX
      HMATRIX        : Boolean := False;
      --  EVSYS
      EVSYS          : Boolean := False;
      --  unspecified
      Reserved_8_8   : HAL.Bit := 16#0#;
      --  SERCOM2
      SERCOM2        : Boolean := False;
      --  SERCOM3
      SERCOM3        : Boolean := False;
      --  TCC0
      TCC0           : Boolean := False;
      --  TCC1
      TCC1           : Boolean := False;
      --  TC2
      TC2            : Boolean := False;
      --  TC3
      TC3            : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  RAMECC
      RAMECC         : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_INTFLAGB_Register use record
      USB            at 0 range 0 .. 0;
      DSU            at 0 range 1 .. 1;
      NVMCTRL        at 0 range 2 .. 2;
      CMCC           at 0 range 3 .. 3;
      PORT           at 0 range 4 .. 4;
      DMAC           at 0 range 5 .. 5;
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

   --  Peripheral interrupt flag status - Bridge C
   type PAC_INTFLAGC_Register is record
      --  unspecified
      Reserved_0_2   : HAL.UInt3 := 16#0#;
      --  TCC2
      TCC2           : Boolean := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  PDEC
      PDEC           : Boolean := False;
      --  AC
      AC             : Boolean := False;
      --  AES
      AES            : Boolean := False;
      --  TRNG
      TRNG           : Boolean := False;
      --  ICM
      ICM            : Boolean := False;
      --  PUKCC
      PUKCC          : Boolean := False;
      --  QSPI
      QSPI           : Boolean := False;
      --  CCL
      CCL            : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_INTFLAGC_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      TCC2           at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      PDEC           at 0 range 7 .. 7;
      AC             at 0 range 8 .. 8;
      AES            at 0 range 9 .. 9;
      TRNG           at 0 range 10 .. 10;
      ICM            at 0 range 11 .. 11;
      PUKCC          at 0 range 12 .. 12;
      QSPI           at 0 range 13 .. 13;
      CCL            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  Peripheral interrupt flag status - Bridge D
   type PAC_INTFLAGD_Register is record
      --  SERCOM4
      SERCOM4        : Boolean := False;
      --  SERCOM5
      SERCOM5        : Boolean := False;
      --  unspecified
      Reserved_2_6   : HAL.UInt5 := 16#0#;
      --  ADC0
      ADC0           : Boolean := False;
      --  ADC1
      ADC1           : Boolean := False;
      --  DAC
      DAC            : Boolean := False;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      --  PCC
      PCC            : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_INTFLAGD_Register use record
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

   --  Peripheral write protection status - Bridge A
   type PAC_STATUSA_Register is record
      --  Read-only. PAC APB Protect Enable
      PAC            : Boolean;
      --  Read-only. PM APB Protect Enable
      PM             : Boolean;
      --  Read-only. MCLK APB Protect Enable
      MCLK           : Boolean;
      --  Read-only. RSTC APB Protect Enable
      RSTC           : Boolean;
      --  Read-only. OSCCTRL APB Protect Enable
      OSCCTRL        : Boolean;
      --  Read-only. OSC32KCTRL APB Protect Enable
      OSC32KCTRL     : Boolean;
      --  Read-only. SUPC APB Protect Enable
      SUPC           : Boolean;
      --  Read-only. GCLK APB Protect Enable
      GCLK           : Boolean;
      --  Read-only. WDT APB Protect Enable
      WDT            : Boolean;
      --  Read-only. RTC APB Protect Enable
      RTC            : Boolean;
      --  Read-only. EIC APB Protect Enable
      EIC            : Boolean;
      --  Read-only. FREQM APB Protect Enable
      FREQM          : Boolean;
      --  Read-only. SERCOM0 APB Protect Enable
      SERCOM0        : Boolean;
      --  Read-only. SERCOM1 APB Protect Enable
      SERCOM1        : Boolean;
      --  Read-only. TC0 APB Protect Enable
      TC0            : Boolean;
      --  Read-only. TC1 APB Protect Enable
      TC1            : Boolean;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_STATUSA_Register use record
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

   --  Peripheral write protection status - Bridge B
   type PAC_STATUSB_Register is record
      --  Read-only. USB APB Protect Enable
      USB            : Boolean;
      --  Read-only. DSU APB Protect Enable
      DSU            : Boolean;
      --  Read-only. NVMCTRL APB Protect Enable
      NVMCTRL        : Boolean;
      --  Read-only. CMCC APB Protect Enable
      CMCC           : Boolean;
      --  Read-only. PORT APB Protect Enable
      PORT           : Boolean;
      --  Read-only. DMAC APB Protect Enable
      DMAC           : Boolean;
      --  Read-only. HMATRIX APB Protect Enable
      HMATRIX        : Boolean;
      --  Read-only. EVSYS APB Protect Enable
      EVSYS          : Boolean;
      --  unspecified
      Reserved_8_8   : HAL.Bit;
      --  Read-only. SERCOM2 APB Protect Enable
      SERCOM2        : Boolean;
      --  Read-only. SERCOM3 APB Protect Enable
      SERCOM3        : Boolean;
      --  Read-only. TCC0 APB Protect Enable
      TCC0           : Boolean;
      --  Read-only. TCC1 APB Protect Enable
      TCC1           : Boolean;
      --  Read-only. TC2 APB Protect Enable
      TC2            : Boolean;
      --  Read-only. TC3 APB Protect Enable
      TC3            : Boolean;
      --  unspecified
      Reserved_15_15 : HAL.Bit;
      --  Read-only. RAMECC APB Protect Enable
      RAMECC         : Boolean;
      --  unspecified
      Reserved_17_31 : HAL.UInt15;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_STATUSB_Register use record
      USB            at 0 range 0 .. 0;
      DSU            at 0 range 1 .. 1;
      NVMCTRL        at 0 range 2 .. 2;
      CMCC           at 0 range 3 .. 3;
      PORT           at 0 range 4 .. 4;
      DMAC           at 0 range 5 .. 5;
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

   --  Peripheral write protection status - Bridge C
   type PAC_STATUSC_Register is record
      --  unspecified
      Reserved_0_2   : HAL.UInt3;
      --  Read-only. TCC2 APB Protect Enable
      TCC2           : Boolean;
      --  unspecified
      Reserved_4_6   : HAL.UInt3;
      --  Read-only. PDEC APB Protect Enable
      PDEC           : Boolean;
      --  Read-only. AC APB Protect Enable
      AC             : Boolean;
      --  Read-only. AES APB Protect Enable
      AES            : Boolean;
      --  Read-only. TRNG APB Protect Enable
      TRNG           : Boolean;
      --  Read-only. ICM APB Protect Enable
      ICM            : Boolean;
      --  Read-only. PUKCC APB Protect Enable
      PUKCC          : Boolean;
      --  Read-only. QSPI APB Protect Enable
      QSPI           : Boolean;
      --  Read-only. CCL APB Protect Enable
      CCL            : Boolean;
      --  unspecified
      Reserved_15_31 : HAL.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_STATUSC_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      TCC2           at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      PDEC           at 0 range 7 .. 7;
      AC             at 0 range 8 .. 8;
      AES            at 0 range 9 .. 9;
      TRNG           at 0 range 10 .. 10;
      ICM            at 0 range 11 .. 11;
      PUKCC          at 0 range 12 .. 12;
      QSPI           at 0 range 13 .. 13;
      CCL            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  Peripheral write protection status - Bridge D
   type PAC_STATUSD_Register is record
      --  Read-only. SERCOM4 APB Protect Enable
      SERCOM4        : Boolean;
      --  Read-only. SERCOM5 APB Protect Enable
      SERCOM5        : Boolean;
      --  unspecified
      Reserved_2_6   : HAL.UInt5;
      --  Read-only. ADC0 APB Protect Enable
      ADC0           : Boolean;
      --  Read-only. ADC1 APB Protect Enable
      ADC1           : Boolean;
      --  Read-only. DAC APB Protect Enable
      DAC            : Boolean;
      --  unspecified
      Reserved_10_10 : HAL.Bit;
      --  Read-only. PCC APB Protect Enable
      PCC            : Boolean;
      --  unspecified
      Reserved_12_31 : HAL.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PAC_STATUSD_Register use record
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

   --  Peripheral Access Controller
   type PAC_Peripheral is record
      --  Write control
      WRCTRL     : aliased PAC_WRCTRL_Register;
      --  Event control
      EVCTRL     : aliased PAC_EVCTRL_Register;
      --  Interrupt enable clear
      INTENCLR   : aliased PAC_INTENCLR_Register;
      --  Interrupt enable set
      INTENSET   : aliased PAC_INTENSET_Register;
      --  Bridge interrupt flag status
      INTFLAGAHB : aliased PAC_INTFLAGAHB_Register;
      --  Peripheral interrupt flag status - Bridge A
      INTFLAGA   : aliased PAC_INTFLAGA_Register;
      --  Peripheral interrupt flag status - Bridge B
      INTFLAGB   : aliased PAC_INTFLAGB_Register;
      --  Peripheral interrupt flag status - Bridge C
      INTFLAGC   : aliased PAC_INTFLAGC_Register;
      --  Peripheral interrupt flag status - Bridge D
      INTFLAGD   : aliased PAC_INTFLAGD_Register;
      --  Peripheral write protection status - Bridge A
      STATUSA    : aliased PAC_STATUSA_Register;
      --  Peripheral write protection status - Bridge B
      STATUSB    : aliased PAC_STATUSB_Register;
      --  Peripheral write protection status - Bridge C
      STATUSC    : aliased PAC_STATUSC_Register;
      --  Peripheral write protection status - Bridge D
      STATUSD    : aliased PAC_STATUSD_Register;
   end record
     with Volatile;

   for PAC_Peripheral use record
      WRCTRL     at 16#0# range 0 .. 31;
      EVCTRL     at 16#4# range 0 .. 7;
      INTENCLR   at 16#8# range 0 .. 7;
      INTENSET   at 16#9# range 0 .. 7;
      INTFLAGAHB at 16#10# range 0 .. 31;
      INTFLAGA   at 16#14# range 0 .. 31;
      INTFLAGB   at 16#18# range 0 .. 31;
      INTFLAGC   at 16#1C# range 0 .. 31;
      INTFLAGD   at 16#20# range 0 .. 31;
      STATUSA    at 16#34# range 0 .. 31;
      STATUSB    at 16#38# range 0 .. 31;
      STATUSC    at 16#3C# range 0 .. 31;
      STATUSD    at 16#40# range 0 .. 31;
   end record;

   --  Peripheral Access Controller
   PAC_Periph : aliased PAC_Peripheral
     with Import, Address => PAC_Base;

end SAM_SVD.PAC;
