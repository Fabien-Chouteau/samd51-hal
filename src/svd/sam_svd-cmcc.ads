pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.CMCC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Number of Way
   type TYPE_WAYNUMSelect is
     (--  Direct Mapped Cache
      DMAPPED,
      --  2-WAY set associative
      ARCH2WAY,
      --  4-WAY set associative
      ARCH4WAY)
     with Size => 2;
   for TYPE_WAYNUMSelect use
     (DMAPPED => 0,
      ARCH2WAY => 1,
      ARCH4WAY => 2);

   --  Cache Size
   type TYPE_CSIZESelect is
     (--  Cache Size is 1 KB
      CSIZE_1KB,
      --  Cache Size is 2 KB
      CSIZE_2KB,
      --  Cache Size is 4 KB
      CSIZE_4KB,
      --  Cache Size is 8 KB
      CSIZE_8KB,
      --  Cache Size is 16 KB
      CSIZE_16KB,
      --  Cache Size is 32 KB
      CSIZE_32KB,
      --  Cache Size is 64 KB
      CSIZE_64KB)
     with Size => 3;
   for TYPE_CSIZESelect use
     (CSIZE_1KB => 0,
      CSIZE_2KB => 1,
      CSIZE_4KB => 2,
      CSIZE_8KB => 3,
      CSIZE_16KB => 4,
      CSIZE_32KB => 5,
      CSIZE_64KB => 6);

   --  Cache Line Size
   type TYPE_CLSIZESelect is
     (--  Cache Line Size is 4 bytes
      CLSIZE_4B,
      --  Cache Line Size is 8 bytes
      CLSIZE_8B,
      --  Cache Line Size is 16 bytes
      CLSIZE_16B,
      --  Cache Line Size is 32 bytes
      CLSIZE_32B,
      --  Cache Line Size is 64 bytes
      CLSIZE_64B,
      --  Cache Line Size is 128 bytes
      CLSIZE_128B)
     with Size => 3;
   for TYPE_CLSIZESelect use
     (CLSIZE_4B => 0,
      CLSIZE_8B => 1,
      CLSIZE_16B => 2,
      CLSIZE_32B => 3,
      CLSIZE_64B => 4,
      CLSIZE_128B => 5);

   --  Cache Type Register
   type CMCC_TYPE_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit;
      --  Read-only. dynamic Clock Gating supported
      GCLK           : Boolean;
      --  unspecified
      Reserved_2_3   : HAL.UInt2;
      --  Read-only. Round Robin Policy supported
      RRP            : Boolean;
      --  Read-only. Number of Way
      WAYNUM         : TYPE_WAYNUMSelect;
      --  Read-only. Lock Down supported
      LCKDOWN        : Boolean;
      --  Read-only. Cache Size
      CSIZE          : TYPE_CSIZESelect;
      --  Read-only. Cache Line Size
      CLSIZE         : TYPE_CLSIZESelect;
      --  unspecified
      Reserved_14_31 : HAL.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_TYPE_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      GCLK           at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      RRP            at 0 range 4 .. 4;
      WAYNUM         at 0 range 5 .. 6;
      LCKDOWN        at 0 range 7 .. 7;
      CSIZE          at 0 range 8 .. 10;
      CLSIZE         at 0 range 11 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  Cache size configured by software
   type CFG_CSIZESWSelect is
     (--  The Cache Size is configured to 1KB
      CONF_CSIZE_1KB,
      --  The Cache Size is configured to 2KB
      CONF_CSIZE_2KB,
      --  The Cache Size is configured to 4KB
      CONF_CSIZE_4KB,
      --  The Cache Size is configured to 8KB
      CONF_CSIZE_8KB,
      --  The Cache Size is configured to 16KB
      CONF_CSIZE_16KB,
      --  The Cache Size is configured to 32KB
      CONF_CSIZE_32KB,
      --  The Cache Size is configured to 64KB
      CONF_CSIZE_64KB)
     with Size => 3;
   for CFG_CSIZESWSelect use
     (CONF_CSIZE_1KB => 0,
      CONF_CSIZE_2KB => 1,
      CONF_CSIZE_4KB => 2,
      CONF_CSIZE_8KB => 3,
      CONF_CSIZE_16KB => 4,
      CONF_CSIZE_32KB => 5,
      CONF_CSIZE_64KB => 6);

   --  Cache Configuration Register
   type CMCC_CFG_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  Instruction Cache Disable
      ICDIS         : Boolean := False;
      --  Data Cache Disable
      DCDIS         : Boolean := False;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  Cache size configured by software
      CSIZESW       : CFG_CSIZESWSelect := SAM_SVD.CMCC.CONF_CSIZE_4KB;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_CFG_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      ICDIS         at 0 range 1 .. 1;
      DCDIS         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      CSIZESW       at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Cache Control Register
   type CMCC_CTRL_Register is record
      --  Write-only. Cache Controller Enable
      CEN           : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_CTRL_Register use record
      CEN           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Cache Status Register
   type CMCC_SR_Register is record
      --  Read-only. Cache Controller Status
      CSTS          : Boolean;
      --  unspecified
      Reserved_1_31 : HAL.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_SR_Register use record
      CSTS          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype CMCC_LCKWAY_LCKWAY_Field is HAL.UInt4;

   --  Cache Lock per Way Register
   type CMCC_LCKWAY_Register is record
      --  Lockdown way Register
      LCKWAY        : CMCC_LCKWAY_LCKWAY_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_LCKWAY_Register use record
      LCKWAY        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Cache Maintenance Register 0
   type CMCC_MAINT0_Register is record
      --  Write-only. Cache Controller invalidate All
      INVALL        : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_MAINT0_Register use record
      INVALL        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype CMCC_MAINT1_INDEX_Field is HAL.UInt8;

   --  Invalidate Way
   type MAINT1_WAYSelect is
     (--  Way 0 is selection for index invalidation
      WAY0,
      --  Way 1 is selection for index invalidation
      WAY1,
      --  Way 2 is selection for index invalidation
      WAY2,
      --  Way 3 is selection for index invalidation
      WAY3)
     with Size => 4;
   for MAINT1_WAYSelect use
     (WAY0 => 0,
      WAY1 => 1,
      WAY2 => 2,
      WAY3 => 3);

   --  Cache Maintenance Register 1
   type CMCC_MAINT1_Register is record
      --  unspecified
      Reserved_0_3   : HAL.UInt4 := 16#0#;
      --  Write-only. Invalidate Index
      INDEX          : CMCC_MAINT1_INDEX_Field := 16#0#;
      --  unspecified
      Reserved_12_27 : HAL.UInt16 := 16#0#;
      --  Write-only. Invalidate Way
      WAY            : MAINT1_WAYSelect := SAM_SVD.CMCC.WAY0;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_MAINT1_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      INDEX          at 0 range 4 .. 11;
      Reserved_12_27 at 0 range 12 .. 27;
      WAY            at 0 range 28 .. 31;
   end record;

   --  Cache Controller Monitor Counter Mode
   type MCFG_MODESelect is
     (--  Cycle counter
      CYCLE_COUNT,
      --  Instruction hit counter
      IHIT_COUNT,
      --  Data hit counter
      DHIT_COUNT)
     with Size => 2;
   for MCFG_MODESelect use
     (CYCLE_COUNT => 0,
      IHIT_COUNT => 1,
      DHIT_COUNT => 2);

   --  Cache Monitor Configuration Register
   type CMCC_MCFG_Register is record
      --  Cache Controller Monitor Counter Mode
      MODE          : MCFG_MODESelect := SAM_SVD.CMCC.CYCLE_COUNT;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_MCFG_Register use record
      MODE          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Cache Monitor Enable Register
   type CMCC_MEN_Register is record
      --  Cache Controller Monitor Enable
      MENABLE       : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_MEN_Register use record
      MENABLE       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  Cache Monitor Control Register
   type CMCC_MCTRL_Register is record
      --  Write-only. Cache Controller Software Reset
      SWRST         : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMCC_MCTRL_Register use record
      SWRST         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Cortex M Cache Controller
   type CMCC_Peripheral is record
      --  Cache Type Register
      TYPE_k : aliased CMCC_TYPE_Register;
      --  Cache Configuration Register
      CFG    : aliased CMCC_CFG_Register;
      --  Cache Control Register
      CTRL   : aliased CMCC_CTRL_Register;
      --  Cache Status Register
      SR     : aliased CMCC_SR_Register;
      --  Cache Lock per Way Register
      LCKWAY : aliased CMCC_LCKWAY_Register;
      --  Cache Maintenance Register 0
      MAINT0 : aliased CMCC_MAINT0_Register;
      --  Cache Maintenance Register 1
      MAINT1 : aliased CMCC_MAINT1_Register;
      --  Cache Monitor Configuration Register
      MCFG   : aliased CMCC_MCFG_Register;
      --  Cache Monitor Enable Register
      MEN    : aliased CMCC_MEN_Register;
      --  Cache Monitor Control Register
      MCTRL  : aliased CMCC_MCTRL_Register;
      --  Cache Monitor Status Register
      MSR    : aliased HAL.UInt32;
   end record
     with Volatile;

   for CMCC_Peripheral use record
      TYPE_k at 16#0# range 0 .. 31;
      CFG    at 16#4# range 0 .. 31;
      CTRL   at 16#8# range 0 .. 31;
      SR     at 16#C# range 0 .. 31;
      LCKWAY at 16#10# range 0 .. 31;
      MAINT0 at 16#20# range 0 .. 31;
      MAINT1 at 16#24# range 0 .. 31;
      MCFG   at 16#28# range 0 .. 31;
      MEN    at 16#2C# range 0 .. 31;
      MCTRL  at 16#30# range 0 .. 31;
      MSR    at 16#34# range 0 .. 31;
   end record;

   --  Cortex M Cache Controller
   CMCC_Periph : aliased CMCC_Peripheral
     with Import, Address => CMCC_Base;

end SAM_SVD.CMCC;
