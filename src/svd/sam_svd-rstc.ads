pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.RSTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Reset Cause
   type RSTC_RCAUSE_Register is record
      --  Read-only. Power On Reset
      POR     : Boolean;
      --  Read-only. Brown Out CORE Detector Reset
      BODCORE : Boolean;
      --  Read-only. Brown Out VDD Detector Reset
      BODVDD  : Boolean;
      --  Read-only. NVM Reset
      NVM     : Boolean;
      --  Read-only. External Reset
      EXT     : Boolean;
      --  Read-only. Watchdog Reset
      WDT     : Boolean;
      --  Read-only. System Reset Request
      SYST    : Boolean;
      --  Read-only. Backup Reset
      BACKUP  : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RSTC_RCAUSE_Register use record
      POR     at 0 range 0 .. 0;
      BODCORE at 0 range 1 .. 1;
      BODVDD  at 0 range 2 .. 2;
      NVM     at 0 range 3 .. 3;
      EXT     at 0 range 4 .. 4;
      WDT     at 0 range 5 .. 5;
      SYST    at 0 range 6 .. 6;
      BACKUP  at 0 range 7 .. 7;
   end record;

   --  Backup Exit Source
   type RSTC_BKUPEXIT_Register is record
      --  unspecified
      Reserved_0_0 : HAL.Bit;
      --  Read-only. Real Timer Counter Interrupt
      RTC          : Boolean;
      --  Read-only. Battery Backup Power Switch
      BBPS         : Boolean;
      --  unspecified
      Reserved_3_6 : HAL.UInt4;
      --  Read-only. Hibernate
      HIB          : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RSTC_BKUPEXIT_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      RTC          at 0 range 1 .. 1;
      BBPS         at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      HIB          at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Reset Controller
   type RSTC_Peripheral is record
      --  Reset Cause
      RCAUSE   : aliased RSTC_RCAUSE_Register;
      --  Backup Exit Source
      BKUPEXIT : aliased RSTC_BKUPEXIT_Register;
   end record
     with Volatile;

   for RSTC_Peripheral use record
      RCAUSE   at 16#0# range 0 .. 7;
      BKUPEXIT at 16#2# range 0 .. 7;
   end record;

   --  Reset Controller
   RSTC_Periph : aliased RSTC_Peripheral
     with Import, Address => RSTC_Base;

end SAM_SVD.RSTC;
