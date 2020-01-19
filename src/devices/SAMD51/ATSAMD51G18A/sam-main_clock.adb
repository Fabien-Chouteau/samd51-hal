--  Generated by a script from an "avr tools device file" (atdf)
with HAL; use HAL;
with System;
package body SAM.Main_Clock is
   Base_Address : constant := 16#40000800#;

   AHBMASK : UInt32
     with Volatile,
          Address => System'To_Address (Base_Address + 16#10#);

   APBAMASK : UInt32
     with Volatile,
          Address => System'To_Address (Base_Address + 16#14#);

   APBBMASK : UInt32
     with Volatile,
          Address => System'To_Address (Base_Address + 16#18#);

   APBCMASK : UInt32
     with Volatile,
          Address => System'To_Address (Base_Address + 16#1C#);

   APBDMASK : UInt32
     with Volatile,
          Address => System'To_Address (Base_Address + 16#20#);

   -- HPB0 --

   procedure HPB0_On is
   begin
      AHBMASK := AHBMASK or 16#1#;
   end HPB0_On;

   procedure HPB0_Off is
   begin
      AHBMASK := AHBMASK and not 16#1#;
   end HPB0_Off;

   -- HPB1 --

   procedure HPB1_On is
   begin
      AHBMASK := AHBMASK or 16#2#;
   end HPB1_On;

   procedure HPB1_Off is
   begin
      AHBMASK := AHBMASK and not 16#2#;
   end HPB1_Off;

   -- HPB2 --

   procedure HPB2_On is
   begin
      AHBMASK := AHBMASK or 16#4#;
   end HPB2_On;

   procedure HPB2_Off is
   begin
      AHBMASK := AHBMASK and not 16#4#;
   end HPB2_Off;

   -- HPB3 --

   procedure HPB3_On is
   begin
      AHBMASK := AHBMASK or 16#8#;
   end HPB3_On;

   procedure HPB3_Off is
   begin
      AHBMASK := AHBMASK and not 16#8#;
   end HPB3_Off;

   -- DSU --

   procedure DSU_On is
   begin
      AHBMASK := AHBMASK or 16#10#;
      APBBMASK := APBBMASK or 16#2#;
   end DSU_On;

   procedure DSU_Off is
   begin
      AHBMASK := AHBMASK and not 16#10#;
      APBBMASK := APBBMASK and not 16#2#;
   end DSU_Off;

   -- HMATRIX --

   procedure HMATRIX_On is
   begin
      AHBMASK := AHBMASK or 16#20#;
      APBBMASK := APBBMASK or 16#40#;
   end HMATRIX_On;

   procedure HMATRIX_Off is
   begin
      AHBMASK := AHBMASK and not 16#20#;
      APBBMASK := APBBMASK and not 16#40#;
   end HMATRIX_Off;

   -- NVMCTRL --

   procedure NVMCTRL_On is
   begin
      AHBMASK := AHBMASK or 16#40#;
      APBBMASK := APBBMASK or 16#4#;
   end NVMCTRL_On;

   procedure NVMCTRL_Off is
   begin
      AHBMASK := AHBMASK and not 16#40#;
      APBBMASK := APBBMASK and not 16#4#;
   end NVMCTRL_Off;

   -- HSRAM --

   procedure HSRAM_On is
   begin
      AHBMASK := AHBMASK or 16#80#;
   end HSRAM_On;

   procedure HSRAM_Off is
   begin
      AHBMASK := AHBMASK and not 16#80#;
   end HSRAM_Off;

   -- CMCC --

   procedure CMCC_On is
   begin
      AHBMASK := AHBMASK or 16#100#;
   end CMCC_On;

   procedure CMCC_Off is
   begin
      AHBMASK := AHBMASK and not 16#100#;
   end CMCC_Off;

   -- DMAC --

   procedure DMAC_On is
   begin
      AHBMASK := AHBMASK or 16#200#;
   end DMAC_On;

   procedure DMAC_Off is
   begin
      AHBMASK := AHBMASK and not 16#200#;
   end DMAC_Off;

   -- USB --

   procedure USB_On is
   begin
      AHBMASK := AHBMASK or 16#400#;
      APBBMASK := APBBMASK or 16#1#;
   end USB_On;

   procedure USB_Off is
   begin
      AHBMASK := AHBMASK and not 16#400#;
      APBBMASK := APBBMASK and not 16#1#;
   end USB_Off;

   -- BKUPRAM --

   procedure BKUPRAM_On is
   begin
      AHBMASK := AHBMASK or 16#800#;
   end BKUPRAM_On;

   procedure BKUPRAM_Off is
   begin
      AHBMASK := AHBMASK and not 16#800#;
   end BKUPRAM_Off;

   -- PAC --

   procedure PAC_On is
   begin
      AHBMASK := AHBMASK or 16#1000#;
      APBAMASK := APBAMASK or 16#1#;
   end PAC_On;

   procedure PAC_Off is
   begin
      AHBMASK := AHBMASK and not 16#1000#;
      APBAMASK := APBAMASK and not 16#1#;
   end PAC_Off;

   -- QSPI --

   procedure QSPI_On is
   begin
      AHBMASK := AHBMASK or 16#2000#;
      APBCMASK := APBCMASK or 16#2000#;
   end QSPI_On;

   procedure QSPI_Off is
   begin
      AHBMASK := AHBMASK and not 16#2000#;
      APBCMASK := APBCMASK and not 16#2000#;
   end QSPI_Off;

   -- SDHC0 --

   procedure SDHC0_On is
   begin
      AHBMASK := AHBMASK or 16#8000#;
   end SDHC0_On;

   procedure SDHC0_Off is
   begin
      AHBMASK := AHBMASK and not 16#8000#;
   end SDHC0_Off;

   -- ICM --

   procedure ICM_On is
   begin
      AHBMASK := AHBMASK or 16#80000#;
      APBCMASK := APBCMASK or 16#800#;
   end ICM_On;

   procedure ICM_Off is
   begin
      AHBMASK := AHBMASK and not 16#80000#;
      APBCMASK := APBCMASK and not 16#800#;
   end ICM_Off;

   -- PUKCC --

   procedure PUKCC_On is
   begin
      AHBMASK := AHBMASK or 16#100000#;
   end PUKCC_On;

   procedure PUKCC_Off is
   begin
      AHBMASK := AHBMASK and not 16#100000#;
   end PUKCC_Off;

   -- QSPI_2X --

   procedure QSPI_2X_On is
   begin
      AHBMASK := AHBMASK or 16#200000#;
   end QSPI_2X_On;

   procedure QSPI_2X_Off is
   begin
      AHBMASK := AHBMASK and not 16#200000#;
   end QSPI_2X_Off;

   -- NVMCTRL_SMEEPROM --

   procedure NVMCTRL_SMEEPROM_On is
   begin
      AHBMASK := AHBMASK or 16#400000#;
   end NVMCTRL_SMEEPROM_On;

   procedure NVMCTRL_SMEEPROM_Off is
   begin
      AHBMASK := AHBMASK and not 16#400000#;
   end NVMCTRL_SMEEPROM_Off;

   -- NVMCTRL_CACHE --

   procedure NVMCTRL_CACHE_On is
   begin
      AHBMASK := AHBMASK or 16#800000#;
   end NVMCTRL_CACHE_On;

   procedure NVMCTRL_CACHE_Off is
   begin
      AHBMASK := AHBMASK and not 16#800000#;
   end NVMCTRL_CACHE_Off;

   -- PM --

   procedure PM_On is
   begin
      APBAMASK := APBAMASK or 16#2#;
   end PM_On;

   procedure PM_Off is
   begin
      APBAMASK := APBAMASK and not 16#2#;
   end PM_Off;

   -- MCLK --

   procedure MCLK_On is
   begin
      APBAMASK := APBAMASK or 16#4#;
   end MCLK_On;

   procedure MCLK_Off is
   begin
      APBAMASK := APBAMASK and not 16#4#;
   end MCLK_Off;

   -- RSTC --

   procedure RSTC_On is
   begin
      APBAMASK := APBAMASK or 16#8#;
   end RSTC_On;

   procedure RSTC_Off is
   begin
      APBAMASK := APBAMASK and not 16#8#;
   end RSTC_Off;

   -- OSCCTRL --

   procedure OSCCTRL_On is
   begin
      APBAMASK := APBAMASK or 16#10#;
   end OSCCTRL_On;

   procedure OSCCTRL_Off is
   begin
      APBAMASK := APBAMASK and not 16#10#;
   end OSCCTRL_Off;

   -- OSC32KCTRL --

   procedure OSC32KCTRL_On is
   begin
      APBAMASK := APBAMASK or 16#20#;
   end OSC32KCTRL_On;

   procedure OSC32KCTRL_Off is
   begin
      APBAMASK := APBAMASK and not 16#20#;
   end OSC32KCTRL_Off;

   -- SUPC --

   procedure SUPC_On is
   begin
      APBAMASK := APBAMASK or 16#40#;
   end SUPC_On;

   procedure SUPC_Off is
   begin
      APBAMASK := APBAMASK and not 16#40#;
   end SUPC_Off;

   -- GCLK --

   procedure GCLK_On is
   begin
      APBAMASK := APBAMASK or 16#80#;
   end GCLK_On;

   procedure GCLK_Off is
   begin
      APBAMASK := APBAMASK and not 16#80#;
   end GCLK_Off;

   -- WDT --

   procedure WDT_On is
   begin
      APBAMASK := APBAMASK or 16#100#;
   end WDT_On;

   procedure WDT_Off is
   begin
      APBAMASK := APBAMASK and not 16#100#;
   end WDT_Off;

   -- RTC --

   procedure RTC_On is
   begin
      APBAMASK := APBAMASK or 16#200#;
   end RTC_On;

   procedure RTC_Off is
   begin
      APBAMASK := APBAMASK and not 16#200#;
   end RTC_Off;

   -- EIC --

   procedure EIC_On is
   begin
      APBAMASK := APBAMASK or 16#400#;
   end EIC_On;

   procedure EIC_Off is
   begin
      APBAMASK := APBAMASK and not 16#400#;
   end EIC_Off;

   -- FREQM --

   procedure FREQM_On is
   begin
      APBAMASK := APBAMASK or 16#800#;
   end FREQM_On;

   procedure FREQM_Off is
   begin
      APBAMASK := APBAMASK and not 16#800#;
   end FREQM_Off;

   -- SERCOM0 --

   procedure SERCOM0_On is
   begin
      APBAMASK := APBAMASK or 16#1000#;
   end SERCOM0_On;

   procedure SERCOM0_Off is
   begin
      APBAMASK := APBAMASK and not 16#1000#;
   end SERCOM0_Off;

   -- SERCOM1 --

   procedure SERCOM1_On is
   begin
      APBAMASK := APBAMASK or 16#2000#;
   end SERCOM1_On;

   procedure SERCOM1_Off is
   begin
      APBAMASK := APBAMASK and not 16#2000#;
   end SERCOM1_Off;

   -- TC0 --

   procedure TC0_On is
   begin
      APBAMASK := APBAMASK or 16#4000#;
   end TC0_On;

   procedure TC0_Off is
   begin
      APBAMASK := APBAMASK and not 16#4000#;
   end TC0_Off;

   -- TC1 --

   procedure TC1_On is
   begin
      APBAMASK := APBAMASK or 16#8000#;
   end TC1_On;

   procedure TC1_Off is
   begin
      APBAMASK := APBAMASK and not 16#8000#;
   end TC1_Off;

   -- PORT --

   procedure PORT_On is
   begin
      APBBMASK := APBBMASK or 16#10#;
   end PORT_On;

   procedure PORT_Off is
   begin
      APBBMASK := APBBMASK and not 16#10#;
   end PORT_Off;

   -- EVSYS --

   procedure EVSYS_On is
   begin
      APBBMASK := APBBMASK or 16#80#;
   end EVSYS_On;

   procedure EVSYS_Off is
   begin
      APBBMASK := APBBMASK and not 16#80#;
   end EVSYS_Off;

   -- SERCOM2 --

   procedure SERCOM2_On is
   begin
      APBBMASK := APBBMASK or 16#200#;
   end SERCOM2_On;

   procedure SERCOM2_Off is
   begin
      APBBMASK := APBBMASK and not 16#200#;
   end SERCOM2_Off;

   -- SERCOM3 --

   procedure SERCOM3_On is
   begin
      APBBMASK := APBBMASK or 16#400#;
   end SERCOM3_On;

   procedure SERCOM3_Off is
   begin
      APBBMASK := APBBMASK and not 16#400#;
   end SERCOM3_Off;

   -- TCC0 --

   procedure TCC0_On is
   begin
      APBBMASK := APBBMASK or 16#800#;
   end TCC0_On;

   procedure TCC0_Off is
   begin
      APBBMASK := APBBMASK and not 16#800#;
   end TCC0_Off;

   -- TCC1 --

   procedure TCC1_On is
   begin
      APBBMASK := APBBMASK or 16#1000#;
   end TCC1_On;

   procedure TCC1_Off is
   begin
      APBBMASK := APBBMASK and not 16#1000#;
   end TCC1_Off;

   -- TC2 --

   procedure TC2_On is
   begin
      APBBMASK := APBBMASK or 16#2000#;
   end TC2_On;

   procedure TC2_Off is
   begin
      APBBMASK := APBBMASK and not 16#2000#;
   end TC2_Off;

   -- TC3 --

   procedure TC3_On is
   begin
      APBBMASK := APBBMASK or 16#4000#;
   end TC3_On;

   procedure TC3_Off is
   begin
      APBBMASK := APBBMASK and not 16#4000#;
   end TC3_Off;

   -- TAL --

   procedure TAL_On is
   begin
      APBBMASK := APBBMASK or 16#8000#;
   end TAL_On;

   procedure TAL_Off is
   begin
      APBBMASK := APBBMASK and not 16#8000#;
   end TAL_Off;

   -- RAMECC --

   procedure RAMECC_On is
   begin
      APBBMASK := APBBMASK or 16#10000#;
   end RAMECC_On;

   procedure RAMECC_Off is
   begin
      APBBMASK := APBBMASK and not 16#10000#;
   end RAMECC_Off;

   -- TCC2 --

   procedure TCC2_On is
   begin
      APBCMASK := APBCMASK or 16#8#;
   end TCC2_On;

   procedure TCC2_Off is
   begin
      APBCMASK := APBCMASK and not 16#8#;
   end TCC2_Off;

   -- PDEC --

   procedure PDEC_On is
   begin
      APBCMASK := APBCMASK or 16#80#;
   end PDEC_On;

   procedure PDEC_Off is
   begin
      APBCMASK := APBCMASK and not 16#80#;
   end PDEC_Off;

   -- AC --

   procedure AC_On is
   begin
      APBCMASK := APBCMASK or 16#100#;
   end AC_On;

   procedure AC_Off is
   begin
      APBCMASK := APBCMASK and not 16#100#;
   end AC_Off;

   -- AES --

   procedure AES_On is
   begin
      APBCMASK := APBCMASK or 16#200#;
   end AES_On;

   procedure AES_Off is
   begin
      APBCMASK := APBCMASK and not 16#200#;
   end AES_Off;

   -- TRNG --

   procedure TRNG_On is
   begin
      APBCMASK := APBCMASK or 16#400#;
   end TRNG_On;

   procedure TRNG_Off is
   begin
      APBCMASK := APBCMASK and not 16#400#;
   end TRNG_Off;

   -- CCL --

   procedure CCL_On is
   begin
      APBCMASK := APBCMASK or 16#4000#;
   end CCL_On;

   procedure CCL_Off is
   begin
      APBCMASK := APBCMASK and not 16#4000#;
   end CCL_Off;

   -- SERCOM4 --

   procedure SERCOM4_On is
   begin
      APBDMASK := APBDMASK or 16#1#;
   end SERCOM4_On;

   procedure SERCOM4_Off is
   begin
      APBDMASK := APBDMASK and not 16#1#;
   end SERCOM4_Off;

   -- SERCOM5 --

   procedure SERCOM5_On is
   begin
      APBDMASK := APBDMASK or 16#2#;
   end SERCOM5_On;

   procedure SERCOM5_Off is
   begin
      APBDMASK := APBDMASK and not 16#2#;
   end SERCOM5_Off;

   -- ADC0 --

   procedure ADC0_On is
   begin
      APBDMASK := APBDMASK or 16#80#;
   end ADC0_On;

   procedure ADC0_Off is
   begin
      APBDMASK := APBDMASK and not 16#80#;
   end ADC0_Off;

   -- ADC1 --

   procedure ADC1_On is
   begin
      APBDMASK := APBDMASK or 16#100#;
   end ADC1_On;

   procedure ADC1_Off is
   begin
      APBDMASK := APBDMASK and not 16#100#;
   end ADC1_Off;

   -- DAC --

   procedure DAC_On is
   begin
      APBDMASK := APBDMASK or 16#200#;
   end DAC_On;

   procedure DAC_Off is
   begin
      APBDMASK := APBDMASK and not 16#200#;
   end DAC_Off;

   -- PCC --

   procedure PCC_On is
   begin
      APBDMASK := APBDMASK or 16#800#;
   end PCC_On;

   procedure PCC_Off is
   begin
      APBDMASK := APBDMASK and not 16#800#;
   end PCC_Off;
end SAM.Main_Clock;
