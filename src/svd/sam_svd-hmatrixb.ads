pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.HMATRIXB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --------------------------------------
   -- HMATRIXB_PRS cluster's Registers --
   --------------------------------------

   type HMATRIXB_PRS_Cluster is record
      --  Priority A for Slave
      PRAS : aliased HAL.UInt32;
      --  Priority B for Slave
      PRBS : aliased HAL.UInt32;
   end record
     with Size => 64;

   for HMATRIXB_PRS_Cluster use record
      PRAS at 16#0# range 0 .. 31;
      PRBS at 16#4# range 0 .. 31;
   end record;

   type HMATRIXB_PRS_Clusters is array (0 .. 15) of HMATRIXB_PRS_Cluster;

   -----------------
   -- Peripherals --
   -----------------

   --  HSB Matrix
   type HMATRIX_Peripheral is record
      HMATRIXB_PRS : aliased HMATRIXB_PRS_Clusters;
   end record
     with Volatile;

   for HMATRIX_Peripheral use record
      HMATRIXB_PRS at 16#80# range 0 .. 1023;
   end record;

   --  HSB Matrix
   HMATRIX_Periph : aliased HMATRIX_Peripheral
     with Import, Address => HMATRIX_Base;

end SAM_SVD.HMATRIXB;
