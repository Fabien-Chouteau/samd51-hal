pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.PORT is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------------------------
   -- PORT_GROUP cluster's Registers --
   ------------------------------------

   subtype PORT_WRCONFIG_PORT_GROUP_PINMASK_Field is HAL.UInt16;
   subtype PORT_WRCONFIG_PORT_GROUP_PMUX_Field is HAL.UInt4;

   --  Write Configuration
   type PORT_WRCONFIG_PORT_GROUP_Register is record
      --  Write-only. Pin Mask for Multiple Pin Configuration
      PINMASK        : PORT_WRCONFIG_PORT_GROUP_PINMASK_Field := 16#0#;
      --  Write-only. Peripheral Multiplexer Enable
      PMUXEN         : Boolean := False;
      --  Write-only. Input Enable
      INEN           : Boolean := False;
      --  Write-only. Pull Enable
      PULLEN         : Boolean := False;
      --  unspecified
      Reserved_19_21 : HAL.UInt3 := 16#0#;
      --  Write-only. Output Driver Strength Selection
      DRVSTR         : Boolean := False;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Write-only. Peripheral Multiplexing
      PMUX           : PORT_WRCONFIG_PORT_GROUP_PMUX_Field := 16#0#;
      --  Write-only. Write PMUX
      WRPMUX         : Boolean := False;
      --  unspecified
      Reserved_29_29 : HAL.Bit := 16#0#;
      --  Write-only. Write PINCFG
      WRPINCFG       : Boolean := False;
      --  Write-only. Half-Word Select
      HWSEL          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PORT_WRCONFIG_PORT_GROUP_Register use record
      PINMASK        at 0 range 0 .. 15;
      PMUXEN         at 0 range 16 .. 16;
      INEN           at 0 range 17 .. 17;
      PULLEN         at 0 range 18 .. 18;
      Reserved_19_21 at 0 range 19 .. 21;
      DRVSTR         at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      PMUX           at 0 range 24 .. 27;
      WRPMUX         at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      WRPINCFG       at 0 range 30 .. 30;
      HWSEL          at 0 range 31 .. 31;
   end record;

   subtype PORT_EVCTRL_PORT_GROUP_PID0_Field is HAL.UInt5;

   --  PORT Event Action 0
   type EVCTRL_EVACT0Select is
     (--  Event output to pin
      OUT_k,
      --  Set output register of pin on event
      SET,
      --  Clear output register of pin on event
      CLR,
      --  Toggle output register of pin on event
      TGL)
     with Size => 2;
   for EVCTRL_EVACT0Select use
     (OUT_k => 0,
      SET => 1,
      CLR => 2,
      TGL => 3);

   subtype PORT_EVCTRL_PORT_GROUP_PID1_Field is HAL.UInt5;
   subtype PORT_EVCTRL_PORT_GROUP_EVACT1_Field is HAL.UInt2;
   subtype PORT_EVCTRL_PORT_GROUP_PID2_Field is HAL.UInt5;
   subtype PORT_EVCTRL_PORT_GROUP_EVACT2_Field is HAL.UInt2;
   subtype PORT_EVCTRL_PORT_GROUP_PID3_Field is HAL.UInt5;
   subtype PORT_EVCTRL_PORT_GROUP_EVACT3_Field is HAL.UInt2;

   --  Event Input Control
   type PORT_EVCTRL_PORT_GROUP_Register is record
      --  PORT Event Pin Identifier 0
      PID0    : PORT_EVCTRL_PORT_GROUP_PID0_Field := 16#0#;
      --  PORT Event Action 0
      EVACT0  : EVCTRL_EVACT0Select := SAM_SVD.PORT.OUT_k;
      --  PORT Event Input Enable 0
      PORTEI0 : Boolean := False;
      --  PORT Event Pin Identifier 1
      PID1    : PORT_EVCTRL_PORT_GROUP_PID1_Field := 16#0#;
      --  PORT Event Action 1
      EVACT1  : PORT_EVCTRL_PORT_GROUP_EVACT1_Field := 16#0#;
      --  PORT Event Input Enable 1
      PORTEI1 : Boolean := False;
      --  PORT Event Pin Identifier 2
      PID2    : PORT_EVCTRL_PORT_GROUP_PID2_Field := 16#0#;
      --  PORT Event Action 2
      EVACT2  : PORT_EVCTRL_PORT_GROUP_EVACT2_Field := 16#0#;
      --  PORT Event Input Enable 2
      PORTEI2 : Boolean := False;
      --  PORT Event Pin Identifier 3
      PID3    : PORT_EVCTRL_PORT_GROUP_PID3_Field := 16#0#;
      --  PORT Event Action 3
      EVACT3  : PORT_EVCTRL_PORT_GROUP_EVACT3_Field := 16#0#;
      --  PORT Event Input Enable 3
      PORTEI3 : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PORT_EVCTRL_PORT_GROUP_Register use record
      PID0    at 0 range 0 .. 4;
      EVACT0  at 0 range 5 .. 6;
      PORTEI0 at 0 range 7 .. 7;
      PID1    at 0 range 8 .. 12;
      EVACT1  at 0 range 13 .. 14;
      PORTEI1 at 0 range 15 .. 15;
      PID2    at 0 range 16 .. 20;
      EVACT2  at 0 range 21 .. 22;
      PORTEI2 at 0 range 23 .. 23;
      PID3    at 0 range 24 .. 28;
      EVACT3  at 0 range 29 .. 30;
      PORTEI3 at 0 range 31 .. 31;
   end record;

   subtype PORT_PMUX_PORT_GROUP_PMUXE_Field is HAL.UInt4;
   subtype PORT_PMUX_PORT_GROUP_PMUXO_Field is HAL.UInt4;

   --  Peripheral Multiplexing
   type PORT_PMUX_PORT_GROUP_Register is record
      --  Peripheral Multiplexing for Even-Numbered Pin
      PMUXE : PORT_PMUX_PORT_GROUP_PMUXE_Field := 16#0#;
      --  Peripheral Multiplexing for Odd-Numbered Pin
      PMUXO : PORT_PMUX_PORT_GROUP_PMUXO_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PORT_PMUX_PORT_GROUP_Register use record
      PMUXE at 0 range 0 .. 3;
      PMUXO at 0 range 4 .. 7;
   end record;

   --  Peripheral Multiplexing
   type PORT_PMUX_PORT_GROUP_Registers is array (0 .. 15)
     of PORT_PMUX_PORT_GROUP_Register;

   --  Pin Configuration
   type PORT_PINCFG_PORT_GROUP_Register is record
      --  Peripheral Multiplexer Enable
      PMUXEN       : Boolean := False;
      --  Input Enable
      INEN         : Boolean := False;
      --  Pull Enable
      PULLEN       : Boolean := False;
      --  unspecified
      Reserved_3_5 : HAL.UInt3 := 16#0#;
      --  Output Driver Strength Selection
      DRVSTR       : Boolean := False;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PORT_PINCFG_PORT_GROUP_Register use record
      PMUXEN       at 0 range 0 .. 0;
      INEN         at 0 range 1 .. 1;
      PULLEN       at 0 range 2 .. 2;
      Reserved_3_5 at 0 range 3 .. 5;
      DRVSTR       at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  Pin Configuration
   type PORT_PINCFG_PORT_GROUP_Registers is array (0 .. 31)
     of PORT_PINCFG_PORT_GROUP_Register;

   type PORT_GROUP_Cluster is record
      --  Data Direction
      DIR      : aliased HAL.UInt32;
      --  Data Direction Clear
      DIRCLR   : aliased HAL.UInt32;
      --  Data Direction Set
      DIRSET   : aliased HAL.UInt32;
      --  Data Direction Toggle
      DIRTGL   : aliased HAL.UInt32;
      --  Data Output Value
      OUT_k    : aliased HAL.UInt32;
      --  Data Output Value Clear
      OUTCLR   : aliased HAL.UInt32;
      --  Data Output Value Set
      OUTSET   : aliased HAL.UInt32;
      --  Data Output Value Toggle
      OUTTGL   : aliased HAL.UInt32;
      --  Data Input Value
      IN_k     : aliased HAL.UInt32;
      --  Control
      CTRL     : aliased HAL.UInt32;
      --  Write Configuration
      WRCONFIG : aliased PORT_WRCONFIG_PORT_GROUP_Register;
      --  Event Input Control
      EVCTRL   : aliased PORT_EVCTRL_PORT_GROUP_Register;
      --  Peripheral Multiplexing
      PMUX     : aliased PORT_PMUX_PORT_GROUP_Registers;
      --  Pin Configuration
      PINCFG   : aliased PORT_PINCFG_PORT_GROUP_Registers;
   end record
     with Size => 1024;

   for PORT_GROUP_Cluster use record
      DIR      at 16#0# range 0 .. 31;
      DIRCLR   at 16#4# range 0 .. 31;
      DIRSET   at 16#8# range 0 .. 31;
      DIRTGL   at 16#C# range 0 .. 31;
      OUT_k    at 16#10# range 0 .. 31;
      OUTCLR   at 16#14# range 0 .. 31;
      OUTSET   at 16#18# range 0 .. 31;
      OUTTGL   at 16#1C# range 0 .. 31;
      IN_k     at 16#20# range 0 .. 31;
      CTRL     at 16#24# range 0 .. 31;
      WRCONFIG at 16#28# range 0 .. 31;
      EVCTRL   at 16#2C# range 0 .. 31;
      PMUX     at 16#30# range 0 .. 127;
      PINCFG   at 16#40# range 0 .. 255;
   end record;

   type PORT_GROUP_Clusters is array (0 .. 1) of PORT_GROUP_Cluster;

   -----------------
   -- Peripherals --
   -----------------

   --  Port Module
   type PORT_Peripheral is record
      PORT_GROUP : aliased PORT_GROUP_Clusters;
   end record
     with Volatile;

   for PORT_Peripheral use record
      PORT_GROUP at 0 range 0 .. 2047;
   end record;

   --  Port Module
   PORT_Periph : aliased PORT_Peripheral
     with Import, Address => PORT_Base;

end SAM_SVD.PORT;
