pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.CCL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control
   type CCL_CTRL_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  unspecified
      Reserved_2_5 : HAL.UInt4 := 16#0#;
      --  Run in Standby
      RUNSTDBY     : Boolean := False;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for CCL_CTRL_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_5 at 0 range 2 .. 5;
      RUNSTDBY     at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  Sequential Selection
   type SEQCTRL_SEQSELSelect is
     (--  Sequential logic is disabled
      DISABLE,
      --  D flip flop
      DFF,
      --  JK flip flop
      JK,
      --  D latch
      LATCH,
      --  RS latch
      RS)
     with Size => 4;
   for SEQCTRL_SEQSELSelect use
     (DISABLE => 0,
      DFF => 1,
      JK => 2,
      LATCH => 3,
      RS => 4);

   --  SEQ Control x
   type CCL_SEQCTRL_Register is record
      --  Sequential Selection
      SEQSEL       : SEQCTRL_SEQSELSelect := SAM_SVD.CCL.DISABLE;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for CCL_SEQCTRL_Register use record
      SEQSEL       at 0 range 0 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  SEQ Control x
   type CCL_SEQCTRL_Registers is array (0 .. 1) of CCL_SEQCTRL_Register;

   --  Filter Selection
   type LUTCTRL_FILTSELSelect is
     (--  Filter disabled
      DISABLE,
      --  Synchronizer enabled
      SYNCH,
      --  Filter enabled
      FILTER)
     with Size => 2;
   for LUTCTRL_FILTSELSelect use
     (DISABLE => 0,
      SYNCH => 1,
      FILTER => 2);

   --  Input Selection 0
   type LUTCTRL_INSEL0Select is
     (--  Masked input
      MASK,
      --  Feedback input source
      FEEDBACK,
      --  Linked LUT input source
      LINK,
      --  Event input source
      EVENT,
      --  I/O pin input source
      IO,
      --  AC input source
      AC,
      --  TC input source
      TC,
      --  Alternate TC input source
      ALTTC,
      --  TCC input source
      TCC,
      --  SERCOM input source
      SERCOM)
     with Size => 4;
   for LUTCTRL_INSEL0Select use
     (MASK => 0,
      FEEDBACK => 1,
      LINK => 2,
      EVENT => 3,
      IO => 4,
      AC => 5,
      TC => 6,
      ALTTC => 7,
      TCC => 8,
      SERCOM => 9);

   --  Input Selection 1
   type LUTCTRL_INSEL1Select is
     (--  Masked input
      MASK,
      --  Feedback input source
      FEEDBACK,
      --  Linked LUT input source
      LINK,
      --  Event input source
      EVENT,
      --  I/O pin input source
      IO,
      --  AC input source
      AC,
      --  TC input source
      TC,
      --  Alternate TC input source
      ALTTC,
      --  TCC input source
      TCC,
      --  SERCOM input source
      SERCOM)
     with Size => 4;
   for LUTCTRL_INSEL1Select use
     (MASK => 0,
      FEEDBACK => 1,
      LINK => 2,
      EVENT => 3,
      IO => 4,
      AC => 5,
      TC => 6,
      ALTTC => 7,
      TCC => 8,
      SERCOM => 9);

   --  Input Selection 2
   type LUTCTRL_INSEL2Select is
     (--  Masked input
      MASK,
      --  Feedback input source
      FEEDBACK,
      --  Linked LUT input source
      LINK,
      --  Event input source
      EVENT,
      --  I/O pin input source
      IO,
      --  AC input source
      AC,
      --  TC input source
      TC,
      --  Alternate TC input source
      ALTTC,
      --  TCC input source
      TCC,
      --  SERCOM input source
      SERCOM)
     with Size => 4;
   for LUTCTRL_INSEL2Select use
     (MASK => 0,
      FEEDBACK => 1,
      LINK => 2,
      EVENT => 3,
      IO => 4,
      AC => 5,
      TC => 6,
      ALTTC => 7,
      TCC => 8,
      SERCOM => 9);

   subtype CCL_LUTCTRL_TRUTH_Field is HAL.UInt8;

   --  LUT Control x
   type CCL_LUTCTRL_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  LUT Enable
      ENABLE         : Boolean := False;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      --  Filter Selection
      FILTSEL        : LUTCTRL_FILTSELSelect := SAM_SVD.CCL.DISABLE;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  Edge Selection
      EDGESEL        : Boolean := False;
      --  Input Selection 0
      INSEL0         : LUTCTRL_INSEL0Select := SAM_SVD.CCL.MASK;
      --  Input Selection 1
      INSEL1         : LUTCTRL_INSEL1Select := SAM_SVD.CCL.MASK;
      --  Input Selection 2
      INSEL2         : LUTCTRL_INSEL2Select := SAM_SVD.CCL.MASK;
      --  Inverted Event Input Enable
      INVEI          : Boolean := False;
      --  LUT Event Input Enable
      LUTEI          : Boolean := False;
      --  LUT Event Output Enable
      LUTEO          : Boolean := False;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Truth Value
      TRUTH          : CCL_LUTCTRL_TRUTH_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCL_LUTCTRL_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      FILTSEL        at 0 range 4 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      EDGESEL        at 0 range 7 .. 7;
      INSEL0         at 0 range 8 .. 11;
      INSEL1         at 0 range 12 .. 15;
      INSEL2         at 0 range 16 .. 19;
      INVEI          at 0 range 20 .. 20;
      LUTEI          at 0 range 21 .. 21;
      LUTEO          at 0 range 22 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      TRUTH          at 0 range 24 .. 31;
   end record;

   --  LUT Control x
   type CCL_LUTCTRL_Registers is array (0 .. 3) of CCL_LUTCTRL_Register;

   -----------------
   -- Peripherals --
   -----------------

   --  Configurable Custom Logic
   type CCL_Peripheral is record
      --  Control
      CTRL    : aliased CCL_CTRL_Register;
      --  SEQ Control x
      SEQCTRL : aliased CCL_SEQCTRL_Registers;
      --  LUT Control x
      LUTCTRL : aliased CCL_LUTCTRL_Registers;
   end record
     with Volatile;

   for CCL_Peripheral use record
      CTRL    at 16#0# range 0 .. 7;
      SEQCTRL at 16#4# range 0 .. 15;
      LUTCTRL at 16#8# range 0 .. 127;
   end record;

   --  Configurable Custom Logic
   CCL_Periph : aliased CCL_Peripheral
     with Import, Address => CCL_Base;

end SAM_SVD.CCL;
