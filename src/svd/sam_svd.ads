pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  Microchip ATSAMD51G19A Microcontroller
package SAM_SVD is
   pragma Preelaborate;

   --------------------
   -- Base addresses --
   --------------------

   AC_Base : constant System.Address := System'To_Address (16#42002000#);
   ADC0_Base : constant System.Address := System'To_Address (16#43001C00#);
   ADC1_Base : constant System.Address := System'To_Address (16#43002000#);
   AES_Base : constant System.Address := System'To_Address (16#42002400#);
   CCL_Base : constant System.Address := System'To_Address (16#42003800#);
   CMCC_Base : constant System.Address := System'To_Address (16#41006000#);
   DAC_Base : constant System.Address := System'To_Address (16#43002400#);
   DMAC_Base : constant System.Address := System'To_Address (16#4100A000#);
   DSU_Base : constant System.Address := System'To_Address (16#41002000#);
   EIC_Base : constant System.Address := System'To_Address (16#40002800#);
   EVSYS_Base : constant System.Address := System'To_Address (16#4100E000#);
   FREQM_Base : constant System.Address := System'To_Address (16#40002C00#);
   GCLK_Base : constant System.Address := System'To_Address (16#40001C00#);
   HMATRIX_Base : constant System.Address := System'To_Address (16#4100C000#);
   ICM_Base : constant System.Address := System'To_Address (16#42002C00#);
   MCLK_Base : constant System.Address := System'To_Address (16#40000800#);
   NVMCTRL_Base : constant System.Address := System'To_Address (16#41004000#);
   OSCCTRL_Base : constant System.Address := System'To_Address (16#40001000#);
   OSC32KCTRL_Base : constant System.Address := System'To_Address (16#40001400#);
   PAC_Base : constant System.Address := System'To_Address (16#40000000#);
   PCC_Base : constant System.Address := System'To_Address (16#43002C00#);
   PDEC_Base : constant System.Address := System'To_Address (16#42001C00#);
   PM_Base : constant System.Address := System'To_Address (16#40000400#);
   PORT_Base : constant System.Address := System'To_Address (16#41008000#);
   QSPI_Base : constant System.Address := System'To_Address (16#42003400#);
   RAMECC_Base : constant System.Address := System'To_Address (16#41020000#);
   RSTC_Base : constant System.Address := System'To_Address (16#40000C00#);
   RTC_Base : constant System.Address := System'To_Address (16#40002400#);
   SDHC0_Base : constant System.Address := System'To_Address (16#45000000#);
   SERCOM0_Base : constant System.Address := System'To_Address (16#40003000#);
   SERCOM1_Base : constant System.Address := System'To_Address (16#40003400#);
   SERCOM2_Base : constant System.Address := System'To_Address (16#41012000#);
   SERCOM3_Base : constant System.Address := System'To_Address (16#41014000#);
   SERCOM4_Base : constant System.Address := System'To_Address (16#43000000#);
   SERCOM5_Base : constant System.Address := System'To_Address (16#43000400#);
   SUPC_Base : constant System.Address := System'To_Address (16#40001800#);
   TC0_Base : constant System.Address := System'To_Address (16#40003800#);
   TC1_Base : constant System.Address := System'To_Address (16#40003C00#);
   TC2_Base : constant System.Address := System'To_Address (16#4101A000#);
   TC3_Base : constant System.Address := System'To_Address (16#4101C000#);
   TCC0_Base : constant System.Address := System'To_Address (16#41016000#);
   TCC1_Base : constant System.Address := System'To_Address (16#41018000#);
   TCC2_Base : constant System.Address := System'To_Address (16#42000C00#);
   TRNG_Base : constant System.Address := System'To_Address (16#42002800#);
   USB_Base : constant System.Address := System'To_Address (16#41000000#);
   WDT_Base : constant System.Address := System'To_Address (16#40002000#);
   CoreDebug_Base : constant System.Address := System'To_Address (16#E000EDF0#);
   DWT_Base : constant System.Address := System'To_Address (16#E0001000#);
   ETM_Base : constant System.Address := System'To_Address (16#E0041000#);
   FPU_Base : constant System.Address := System'To_Address (16#E000EF30#);
   ITM_Base : constant System.Address := System'To_Address (16#E0000000#);
   MPU_Base : constant System.Address := System'To_Address (16#E000ED90#);
   NVIC_Base : constant System.Address := System'To_Address (16#E000E100#);
   SysTick_Base : constant System.Address := System'To_Address (16#E000E010#);
   SystemControl_Base : constant System.Address := System'To_Address (16#E000E000#);
   TPI_Base : constant System.Address := System'To_Address (16#E0040000#);

end SAM_SVD;
