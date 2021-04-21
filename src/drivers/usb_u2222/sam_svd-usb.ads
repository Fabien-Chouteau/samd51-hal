pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.USB is
   pragma Preelaborate;

   pragma Warnings (Off, "* bits of * unused");

   ---------------
   -- Registers --
   ---------------

   -----------------------------------
   -- UsbDevice cluster's Registers --
   -----------------------------------

   --  Operating Mode
   type CTRLA_MODESelect is
     (--  Device Mode
      DEVICE,
      --  Host Mode
      HOST)
     with Size => 1;
   for CTRLA_MODESelect use
     (DEVICE => 0,
      HOST => 1);

   --  Control A
   type USB_CTRLA_USB_DEVICE_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  Run in Standby Mode
      RUNSTDBY     : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Operating Mode
      MODE         : CTRLA_MODESelect := SAM_SVD.USB.DEVICE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLA_USB_DEVICE_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      RUNSTDBY     at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      MODE         at 0 range 7 .. 7;
   end record;

   --  Synchronization Busy
   type USB_SYNCBUSY_USB_DEVICE_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST        : Boolean;
      --  Read-only. Enable Synchronization Busy
      ENABLE       : Boolean;
      --  unspecified
      Reserved_2_7 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_SYNCBUSY_USB_DEVICE_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   subtype USB_QOSCTRL_USB_DEVICE_CQOS_Field is HAL.UInt2;
   subtype USB_QOSCTRL_USB_DEVICE_DQOS_Field is HAL.UInt2;

   --  USB Quality Of Service
   type USB_QOSCTRL_USB_DEVICE_Register is record
      --  Configuration Quality of Service
      CQOS         : USB_QOSCTRL_USB_DEVICE_CQOS_Field := 16#3#;
      --  Data Quality of Service
      DQOS         : USB_QOSCTRL_USB_DEVICE_DQOS_Field := 16#3#;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_QOSCTRL_USB_DEVICE_Register use record
      CQOS         at 0 range 0 .. 1;
      DQOS         at 0 range 2 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Speed Configuration
   type CTRLB_SPDCONFSelect is
     (--  FS : Full Speed
      FS,
      --  LS : Low Speed
      LS,
      --  HS : High Speed capable
      HS,
      --  HSTM: High Speed Test Mode (force high-speed mode for test mode)
      HSTM)
     with Size => 2;
   for CTRLB_SPDCONFSelect use
     (FS => 0,
      LS => 1,
      HS => 2,
      HSTM => 3);

   --  Link Power Management Handshake
   type CTRLB_LPMHDSKSelect is
     (--  No handshake. LPM is not supported
      NO,
      --  ACK
      ACK,
      --  NYET
      NYET,
      --  STALL
      STALL)
     with Size => 2;
   for CTRLB_LPMHDSKSelect use
     (NO => 0,
      ACK => 1,
      NYET => 2,
      STALL => 3);

   --  DEVICE Control B
   type USB_CTRLB_USB_DEVICE_Register is record
      --  Detach
      DETACH         : Boolean := True;
      --  Upstream Resume
      UPRSM          : Boolean := False;
      --  Speed Configuration
      SPDCONF        : CTRLB_SPDCONFSelect := SAM_SVD.USB.FS;
      --  No Reply
      NREPLY         : Boolean := False;
      --  Test mode J
      TSTJ           : Boolean := False;
      --  Test mode K
      TSTK           : Boolean := False;
      --  Test packet mode
      TSTPCKT        : Boolean := False;
      --  Specific Operational Mode
      OPMODE2        : Boolean := False;
      --  Global NAK
      GNAK           : Boolean := False;
      --  Link Power Management Handshake
      LPMHDSK        : CTRLB_LPMHDSKSelect := SAM_SVD.USB.NO;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLB_USB_DEVICE_Register use record
      DETACH         at 0 range 0 .. 0;
      UPRSM          at 0 range 1 .. 1;
      SPDCONF        at 0 range 2 .. 3;
      NREPLY         at 0 range 4 .. 4;
      TSTJ           at 0 range 5 .. 5;
      TSTK           at 0 range 6 .. 6;
      TSTPCKT        at 0 range 7 .. 7;
      OPMODE2        at 0 range 8 .. 8;
      GNAK           at 0 range 9 .. 9;
      LPMHDSK        at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype USB_DADD_USB_DEVICE_DADD_Field is HAL.UInt7;

   --  DEVICE Device Address
   type USB_DADD_USB_DEVICE_Register is record
      --  Device Address
      DADD  : USB_DADD_USB_DEVICE_DADD_Field := 16#0#;
      --  Device Address Enable
      ADDEN : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_DADD_USB_DEVICE_Register use record
      DADD  at 0 range 0 .. 6;
      ADDEN at 0 range 7 .. 7;
   end record;

   --  Speed Status
   type STATUS_SPEEDSelect is
     (--  Full-speed mode
      FS,
      --  Low-speed mode
      LS,
      --  High-speed mode
      HS)
     with Size => 2;
   for STATUS_SPEEDSelect use
     (FS => 0,
      LS => 1,
      HS => 2);

   --  USB Line State Status
   type STATUS_LINESTATESelect is
     (--  SE0/RESET
      Val_0,
      --  FS-J or LS-K State
      Val_1,
      --  FS-K or LS-J State
      Val_2)
     with Size => 2;
   for STATUS_LINESTATESelect use
     (Val_0 => 0,
      Val_1 => 1,
      Val_2 => 2);

   --  DEVICE Status
   type USB_STATUS_USB_DEVICE_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2;
      --  Read-only. Speed Status
      SPEED        : STATUS_SPEEDSelect;
      --  unspecified
      Reserved_4_5 : HAL.UInt2;
      --  Read-only. USB Line State Status
      LINESTATE    : STATUS_LINESTATESelect;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_STATUS_USB_DEVICE_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      SPEED        at 0 range 2 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      LINESTATE    at 0 range 6 .. 7;
   end record;

   --  Fine State Machine Status
   type FSMSTATUS_FSMSTATESelect is
     (--  OFF (L3). It corresponds to the powered-off, disconnected, and disabled
--  state
      OFF,
      --  ON (L0). It corresponds to the Idle and Active states
      ON,
      --  SUSPEND (L2)
      SUSPEND,
      --  SLEEP (L1)
      SLEEP,
      --  DNRESUME. Down Stream Resume.
      DNRESUME,
      --  UPRESUME. Up Stream Resume.
      UPRESUME,
      --  RESET. USB lines Reset.
      RESET)
     with Size => 7;
   for FSMSTATUS_FSMSTATESelect use
     (OFF => 1,
      ON => 2,
      SUSPEND => 4,
      SLEEP => 8,
      DNRESUME => 16,
      UPRESUME => 32,
      RESET => 64);

   --  Finite State Machine Status
   type USB_FSMSTATUS_USB_DEVICE_Register is record
      --  Read-only. Fine State Machine Status
      FSMSTATE     : FSMSTATUS_FSMSTATESelect;
      --  unspecified
      Reserved_7_7 : HAL.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_FSMSTATUS_USB_DEVICE_Register use record
      FSMSTATE     at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   subtype USB_FNUM_USB_DEVICE_MFNUM_Field is HAL.UInt3;
   subtype USB_FNUM_USB_DEVICE_FNUM_Field is HAL.UInt11;

   --  DEVICE Device Frame Number
   type USB_FNUM_USB_DEVICE_Register is record
      --  Read-only. Micro Frame Number
      MFNUM          : USB_FNUM_USB_DEVICE_MFNUM_Field;
      --  Read-only. Frame Number
      FNUM           : USB_FNUM_USB_DEVICE_FNUM_Field;
      --  unspecified
      Reserved_14_14 : HAL.Bit;
      --  Read-only. Frame Number CRC Error
      FNCERR         : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_FNUM_USB_DEVICE_Register use record
      MFNUM          at 0 range 0 .. 2;
      FNUM           at 0 range 3 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      FNCERR         at 0 range 15 .. 15;
   end record;

   --  DEVICE Device Interrupt Enable Clear
   type USB_INTENCLR_USB_DEVICE_Register is record
      --  Suspend Interrupt Enable
      SUSPEND        : Boolean := False;
      --  Micro Start of Frame Interrupt Enable in High Speed Mode
      MSOF           : Boolean := False;
      --  Start Of Frame Interrupt Enable
      SOF            : Boolean := False;
      --  End of Reset Interrupt Enable
      EORST          : Boolean := False;
      --  Wake Up Interrupt Enable
      WAKEUP         : Boolean := False;
      --  End Of Resume Interrupt Enable
      EORSM          : Boolean := False;
      --  Upstream Resume Interrupt Enable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Enable
      RAMACER        : Boolean := False;
      --  Link Power Management Not Yet Interrupt Enable
      LPMNYET        : Boolean := False;
      --  Link Power Management Suspend Interrupt Enable
      LPMSUSP        : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENCLR_USB_DEVICE_Register use record
      SUSPEND        at 0 range 0 .. 0;
      MSOF           at 0 range 1 .. 1;
      SOF            at 0 range 2 .. 2;
      EORST          at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      EORSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      LPMNYET        at 0 range 8 .. 8;
      LPMSUSP        at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  DEVICE Device Interrupt Enable Set
   type USB_INTENSET_USB_DEVICE_Register is record
      --  Suspend Interrupt Enable
      SUSPEND        : Boolean := False;
      --  Micro Start of Frame Interrupt Enable in High Speed Mode
      MSOF           : Boolean := False;
      --  Start Of Frame Interrupt Enable
      SOF            : Boolean := False;
      --  End of Reset Interrupt Enable
      EORST          : Boolean := False;
      --  Wake Up Interrupt Enable
      WAKEUP         : Boolean := False;
      --  End Of Resume Interrupt Enable
      EORSM          : Boolean := False;
      --  Upstream Resume Interrupt Enable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Enable
      RAMACER        : Boolean := False;
      --  Link Power Management Not Yet Interrupt Enable
      LPMNYET        : Boolean := False;
      --  Link Power Management Suspend Interrupt Enable
      LPMSUSP        : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENSET_USB_DEVICE_Register use record
      SUSPEND        at 0 range 0 .. 0;
      MSOF           at 0 range 1 .. 1;
      SOF            at 0 range 2 .. 2;
      EORST          at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      EORSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      LPMNYET        at 0 range 8 .. 8;
      LPMSUSP        at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  DEVICE Device Interrupt Flag
   type USB_INTFLAG_USB_DEVICE_Register is record
      --  Suspend
      SUSPEND        : Boolean := False;
      --  Micro Start of Frame in High Speed Mode
      MSOF           : Boolean := False;
      --  Start Of Frame
      SOF            : Boolean := False;
      --  End of Reset
      EORST          : Boolean := False;
      --  Wake Up
      WAKEUP         : Boolean := False;
      --  End Of Resume
      EORSM          : Boolean := False;
      --  Upstream Resume
      UPRSM          : Boolean := False;
      --  Ram Access
      RAMACER        : Boolean := False;
      --  Link Power Management Not Yet
      LPMNYET        : Boolean := False;
      --  Link Power Management Suspend
      LPMSUSP        : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTFLAG_USB_DEVICE_Register use record
      SUSPEND        at 0 range 0 .. 0;
      MSOF           at 0 range 1 .. 1;
      SOF            at 0 range 2 .. 2;
      EORST          at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      EORSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      LPMNYET        at 0 range 8 .. 8;
      LPMSUSP        at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  USB_EPINTSMRY_USB_DEVICE_EPINT array
   type USB_EPINTSMRY_USB_DEVICE_EPINT_Field_Array is array (0 .. 7)
     of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for USB_EPINTSMRY_USB_DEVICE_EPINT
   type USB_EPINTSMRY_USB_DEVICE_EPINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EPINT as a value
            Val : HAL.UInt8;
         when True =>
            --  EPINT as an array
            Arr : USB_EPINTSMRY_USB_DEVICE_EPINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for USB_EPINTSMRY_USB_DEVICE_EPINT_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  DEVICE End Point Interrupt Summary
   type USB_EPINTSMRY_USB_DEVICE_Register is record
      --  Read-only. End Point 0 Interrupt
      EPINT         : USB_EPINTSMRY_USB_DEVICE_EPINT_Field;
      --  unspecified
      Reserved_8_15 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_EPINTSMRY_USB_DEVICE_Register use record
      EPINT         at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype USB_PADCAL_USB_DEVICE_TRANSP_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_DEVICE_TRANSN_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_DEVICE_TRIM_Field is HAL.UInt3;

   --  USB PAD Calibration
   type USB_PADCAL_USB_DEVICE_Register is record
      --  USB Pad Transp calibration
      TRANSP         : USB_PADCAL_USB_DEVICE_TRANSP_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  USB Pad Transn calibration
      TRANSN         : USB_PADCAL_USB_DEVICE_TRANSN_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  USB Pad Trim calibration
      TRIM           : USB_PADCAL_USB_DEVICE_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_PADCAL_USB_DEVICE_Register use record
      TRANSP         at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TRANSN         at 0 range 6 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      TRIM           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   ---------------------------------------------
   -- USB_DEVICE_ENDPOINT cluster's Registers --
   ---------------------------------------------

   subtype USB_EPCFG_USB_DEVICE_ENDPOINT_EPTYPE0_Field is HAL.UInt3;
   subtype USB_EPCFG_USB_DEVICE_ENDPOINT_EPTYPE1_Field is HAL.UInt3;

   --  DEVICE_ENDPOINT End Point Configuration
   type USB_EPCFG_USB_DEVICE_ENDPOINT_Register is record
      --  End Point Type0
      EPTYPE0      : USB_EPCFG_USB_DEVICE_ENDPOINT_EPTYPE0_Field := 16#0#;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  End Point Type1
      EPTYPE1      : USB_EPCFG_USB_DEVICE_ENDPOINT_EPTYPE1_Field := 16#0#;
      --  NYET Token Disable
      NYETDIS      : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_EPCFG_USB_DEVICE_ENDPOINT_Register use record
      EPTYPE0      at 0 range 0 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      EPTYPE1      at 0 range 4 .. 6;
      NYETDIS      at 0 range 7 .. 7;
   end record;

   --  USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_STALLRQ array
   type USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_STALLRQ_Field_Array is array (0 .. 1)
     of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_STALLRQ
   type USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_STALLRQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALLRQ as a value
            Val : HAL.UInt2;
         when True =>
            --  STALLRQ as an array
            Arr : USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_STALLRQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_STALLRQ_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE_ENDPOINT End Point Pipe Status Clear
   type USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_Register is record
      --  Write-only. Data Toggle OUT Clear
      DTGLOUT      : Boolean := False;
      --  Write-only. Data Toggle IN Clear
      DTGLIN       : Boolean := False;
      --  Write-only. Current Bank Clear
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Stall 0 Request Clear
      STALLRQ      : USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_STALLRQ_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Write-only. Bank 0 Ready Clear
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Clear
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_Register use record
      DTGLOUT      at 0 range 0 .. 0;
      DTGLIN       at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      STALLRQ      at 0 range 4 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_STALLRQ array
   type USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_STALLRQ_Field_Array is array (0 .. 1)
     of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_STALLRQ
   type USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_STALLRQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALLRQ as a value
            Val : HAL.UInt2;
         when True =>
            --  STALLRQ as an array
            Arr : USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_STALLRQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_STALLRQ_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE_ENDPOINT End Point Pipe Status Set
   type USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_Register is record
      --  Write-only. Data Toggle OUT Set
      DTGLOUT      : Boolean := False;
      --  Write-only. Data Toggle IN Set
      DTGLIN       : Boolean := False;
      --  Write-only. Current Bank Set
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Stall 0 Request Set
      STALLRQ      : USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_STALLRQ_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Write-only. Bank 0 Ready Set
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Set
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_Register use record
      DTGLOUT      at 0 range 0 .. 0;
      DTGLIN       at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      STALLRQ      at 0 range 4 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  USB_EPSTATUS_USB_DEVICE_ENDPOINT_STALLRQ array
   type USB_EPSTATUS_USB_DEVICE_ENDPOINT_STALLRQ_Field_Array is array (0 .. 1)
     of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for USB_EPSTATUS_USB_DEVICE_ENDPOINT_STALLRQ
   type USB_EPSTATUS_USB_DEVICE_ENDPOINT_STALLRQ_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STALLRQ as a value
            Val : HAL.UInt2;
         when True =>
            --  STALLRQ as an array
            Arr : USB_EPSTATUS_USB_DEVICE_ENDPOINT_STALLRQ_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for USB_EPSTATUS_USB_DEVICE_ENDPOINT_STALLRQ_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  DEVICE_ENDPOINT End Point Pipe Status
   type USB_EPSTATUS_USB_DEVICE_ENDPOINT_Register is record
      --  Read-only. Data Toggle Out
      DTGLOUT      : Boolean;
      --  Read-only. Data Toggle In
      DTGLIN       : Boolean;
      --  Read-only. Current Bank
      CURBK        : Boolean;
      --  unspecified
      Reserved_3_3 : HAL.Bit;
      --  Read-only. Stall 0 Request
      STALLRQ      : USB_EPSTATUS_USB_DEVICE_ENDPOINT_STALLRQ_Field;
      --  Read-only. Bank 0 ready
      BK0RDY       : Boolean;
      --  Read-only. Bank 1 ready
      BK1RDY       : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_EPSTATUS_USB_DEVICE_ENDPOINT_Register use record
      DTGLOUT      at 0 range 0 .. 0;
      DTGLIN       at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      STALLRQ      at 0 range 4 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;


   --  DEVICE_ENDPOINT End Point Interrupt Flag
   type USB_EPINTFLAG_USB_DEVICE_ENDPOINT_Register is record
      TRCPT0  : Boolean := False;
      TRCPT1  : Boolean := False;
      TRFAIL0 : Boolean := False;
      TRFAIL1 : Boolean := False;
      RXSTP   : Boolean := False;
      STALL0  : Boolean := False;
      STALL1  : Boolean := False;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_EPINTFLAG_USB_DEVICE_ENDPOINT_Register use record
      TRCPT0       at 0 range 0 .. 0;
      TRCPT1       at 0 range 1 .. 1;
      TRFAIL0      at 0 range 2 .. 2;
      TRFAIL1      at 0 range 3 .. 3;
      RXSTP        at 0 range 4 .. 4;
      STALL0       at 0 range 5 .. 5;
      STALL1       at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  DEVICE_ENDPOINT End Point Interrupt Clear Flag
   type USB_EPINTENCLR_USB_DEVICE_ENDPOINT_Register is record
      TRCPT0  : Boolean := False;
      TRCPT1  : Boolean := False;
      TRFAIL0 : Boolean := False;
      TRFAIL1 : Boolean := False;
      RXSTP   : Boolean := False;
      STALL0  : Boolean := False;
      STALL1  : Boolean := False;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_EPINTENCLR_USB_DEVICE_ENDPOINT_Register use record
      TRCPT0       at 0 range 0 .. 0;
      TRCPT1       at 0 range 1 .. 1;
      TRFAIL0      at 0 range 2 .. 2;
      TRFAIL1      at 0 range 3 .. 3;
      RXSTP        at 0 range 4 .. 4;
      STALL0       at 0 range 5 .. 5;
      STALL1       at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   --  DEVICE_ENDPOINT End Point Interrupt Set Flag
   type USB_EPINTENSET_USB_DEVICE_ENDPOINT_Register is record
      TRCPT0  : Boolean := False;
      TRCPT1  : Boolean := False;
      TRFAIL0 : Boolean := False;
      TRFAIL1 : Boolean := False;
      RXSTP   : Boolean := False;
      STALL0  : Boolean := False;
      STALL1  : Boolean := False;
      Reserved_7_7 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_EPINTENSET_USB_DEVICE_ENDPOINT_Register use record
      TRCPT0       at 0 range 0 .. 0;
      TRCPT1       at 0 range 1 .. 1;
      TRFAIL0      at 0 range 2 .. 2;
      TRFAIL1      at 0 range 3 .. 3;
      RXSTP        at 0 range 4 .. 4;
      STALL0       at 0 range 5 .. 5;
      STALL1       at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   type USB_DEVICE_ENDPOINT_Cluster is record
      --  DEVICE_ENDPOINT End Point Configuration
      EPCFG       : aliased USB_EPCFG_USB_DEVICE_ENDPOINT_Register;
      --  DEVICE_ENDPOINT End Point Pipe Status Clear
      EPSTATUSCLR : aliased USB_EPSTATUSCLR_USB_DEVICE_ENDPOINT_Register;
      --  DEVICE_ENDPOINT End Point Pipe Status Set
      EPSTATUSSET : aliased USB_EPSTATUSSET_USB_DEVICE_ENDPOINT_Register;
      --  DEVICE_ENDPOINT End Point Pipe Status
      EPSTATUS    : aliased USB_EPSTATUS_USB_DEVICE_ENDPOINT_Register;
      --  DEVICE_ENDPOINT End Point Interrupt Flag
      EPINTFLAG   : aliased USB_EPINTFLAG_USB_DEVICE_ENDPOINT_Register;
      --  DEVICE_ENDPOINT End Point Interrupt Clear Flag
      EPINTENCLR  : aliased USB_EPINTENCLR_USB_DEVICE_ENDPOINT_Register;
      --  DEVICE_ENDPOINT End Point Interrupt Set Flag
      EPINTENSET  : aliased USB_EPINTENSET_USB_DEVICE_ENDPOINT_Register;
   end record
     with Size => 256;

   for USB_DEVICE_ENDPOINT_Cluster use record
      EPCFG       at 16#0# range 0 .. 7;
      EPSTATUSCLR at 16#4# range 0 .. 7;
      EPSTATUSSET at 16#5# range 0 .. 7;
      EPSTATUS    at 16#6# range 0 .. 7;
      EPINTFLAG   at 16#7# range 0 .. 7;
      EPINTENCLR  at 16#8# range 0 .. 7;
      EPINTENSET  at 16#9# range 0 .. 7;
   end record;

   type USB_DEVICE_ENDPOINT_Clusters is array (0 .. 7)
     of USB_DEVICE_ENDPOINT_Cluster;

   --  USB is Device
   type UsbDevice_Cluster is record
      --  Control A
      CTRLA               : aliased USB_CTRLA_USB_DEVICE_Register;
      --  Synchronization Busy
      SYNCBUSY            : aliased USB_SYNCBUSY_USB_DEVICE_Register;
      --  USB Quality Of Service
      QOSCTRL             : aliased USB_QOSCTRL_USB_DEVICE_Register;
      --  DEVICE Control B
      CTRLB               : aliased USB_CTRLB_USB_DEVICE_Register;
      --  DEVICE Device Address
      DADD                : aliased USB_DADD_USB_DEVICE_Register;
      --  DEVICE Status
      STATUS              : aliased USB_STATUS_USB_DEVICE_Register;
      --  Finite State Machine Status
      FSMSTATUS           : aliased USB_FSMSTATUS_USB_DEVICE_Register;
      --  DEVICE Device Frame Number
      FNUM                : aliased USB_FNUM_USB_DEVICE_Register;
      --  DEVICE Device Interrupt Enable Clear
      INTENCLR            : aliased USB_INTENCLR_USB_DEVICE_Register;
      --  DEVICE Device Interrupt Enable Set
      INTENSET            : aliased USB_INTENSET_USB_DEVICE_Register;
      --  DEVICE Device Interrupt Flag
      INTFLAG             : aliased USB_INTFLAG_USB_DEVICE_Register;
      --  DEVICE End Point Interrupt Summary
      EPINTSMRY           : aliased USB_EPINTSMRY_USB_DEVICE_Register;
      --  Descriptor Address
      DESCADD             : aliased HAL.UInt32;
      --  USB PAD Calibration
      PADCAL              : aliased USB_PADCAL_USB_DEVICE_Register;
      USB_DEVICE_ENDPOINT : aliased USB_DEVICE_ENDPOINT_Clusters;
   end record
     with Size => 2048 + 2048;

   for UsbDevice_Cluster use record
      CTRLA               at 16#0# range 0 .. 7;
      SYNCBUSY            at 16#2# range 0 .. 7;
      QOSCTRL             at 16#3# range 0 .. 7;
      CTRLB               at 16#8# range 0 .. 15;
      DADD                at 16#A# range 0 .. 7;
      STATUS              at 16#C# range 0 .. 7;
      FSMSTATUS           at 16#D# range 0 .. 7;
      FNUM                at 16#10# range 0 .. 15;
      INTENCLR            at 16#14# range 0 .. 15;
      INTENSET            at 16#18# range 0 .. 15;
      INTFLAG             at 16#1C# range 0 .. 15;
      EPINTSMRY           at 16#20# range 0 .. 15;
      DESCADD             at 16#24# range 0 .. 31;
      PADCAL              at 16#28# range 0 .. 15;
      USB_DEVICE_ENDPOINT at 16#100# range 0 .. 2047;
   end record;

   ---------------------------------
   -- UsbHost cluster's Registers --
   ---------------------------------

   --  Control A
   type USB_CTRLA_USB_HOST_Register is record
      --  Software Reset
      SWRST        : Boolean := False;
      --  Enable
      ENABLE       : Boolean := False;
      --  Run in Standby Mode
      RUNSTDBY     : Boolean := False;
      --  unspecified
      Reserved_3_6 : HAL.UInt4 := 16#0#;
      --  Operating Mode
      MODE         : CTRLA_MODESelect := SAM_SVD.USB.DEVICE;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLA_USB_HOST_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      RUNSTDBY     at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      MODE         at 0 range 7 .. 7;
   end record;

   --  Synchronization Busy
   type USB_SYNCBUSY_USB_HOST_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST        : Boolean;
      --  Read-only. Enable Synchronization Busy
      ENABLE       : Boolean;
      --  unspecified
      Reserved_2_7 : HAL.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_SYNCBUSY_USB_HOST_Register use record
      SWRST        at 0 range 0 .. 0;
      ENABLE       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   subtype USB_QOSCTRL_USB_HOST_CQOS_Field is HAL.UInt2;
   subtype USB_QOSCTRL_USB_HOST_DQOS_Field is HAL.UInt2;

   --  USB Quality Of Service
   type USB_QOSCTRL_USB_HOST_Register is record
      --  Configuration Quality of Service
      CQOS         : USB_QOSCTRL_USB_HOST_CQOS_Field := 16#3#;
      --  Data Quality of Service
      DQOS         : USB_QOSCTRL_USB_HOST_DQOS_Field := 16#3#;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_QOSCTRL_USB_HOST_Register use record
      CQOS         at 0 range 0 .. 1;
      DQOS         at 0 range 2 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Speed Configuration for Host
   type CTRLB_SPDCONFSelect_1 is
     (--  Normal mode: the host starts in full-speed mode and performs a high-speed
--  reset to switch to the high speed mode if the downstream peripheral is
--  high-speed capable.
      NORMAL,
      --  Full-speed: the host remains in full-speed mode whatever is the peripheral
--  speed capability. Relevant in UTMI mode only.
      FS)
     with Size => 2;
   for CTRLB_SPDCONFSelect_1 use
     (NORMAL => 0,
      FS => 3);

   --  HOST Control B
   type USB_CTRLB_USB_HOST_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      --  Send USB Resume
      RESUME         : Boolean := False;
      --  Speed Configuration for Host
      SPDCONF        : CTRLB_SPDCONFSelect_1 := SAM_SVD.USB.NORMAL;
      --  Auto Resume Enable
      AUTORESUME     : Boolean := False;
      --  Test mode J
      TSTJ           : Boolean := False;
      --  Test mode K
      TSTK           : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Start of Frame Generation Enable
      SOFE           : Boolean := False;
      --  Send USB Reset
      BUSRESET       : Boolean := False;
      --  VBUS is OK
      VBUSOK         : Boolean := False;
      --  Send L1 Resume
      L1RESUME       : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_CTRLB_USB_HOST_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      RESUME         at 0 range 1 .. 1;
      SPDCONF        at 0 range 2 .. 3;
      AUTORESUME     at 0 range 4 .. 4;
      TSTJ           at 0 range 5 .. 5;
      TSTK           at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      SOFE           at 0 range 8 .. 8;
      BUSRESET       at 0 range 9 .. 9;
      VBUSOK         at 0 range 10 .. 10;
      L1RESUME       at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype USB_HSOFC_USB_HOST_FLENC_Field is HAL.UInt4;

   --  HOST Host Start Of Frame Control
   type USB_HSOFC_USB_HOST_Register is record
      --  Frame Length Control
      FLENC        : USB_HSOFC_USB_HOST_FLENC_Field := 16#0#;
      --  unspecified
      Reserved_4_6 : HAL.UInt3 := 16#0#;
      --  Frame Length Control Enable
      FLENCE       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_HSOFC_USB_HOST_Register use record
      FLENC        at 0 range 0 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      FLENCE       at 0 range 7 .. 7;
   end record;

   subtype USB_STATUS_USB_HOST_SPEED_Field is HAL.UInt2;
   subtype USB_STATUS_USB_HOST_LINESTATE_Field is HAL.UInt2;

   --  HOST Status
   type USB_STATUS_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1 : HAL.UInt2 := 16#0#;
      --  Speed Status
      SPEED        : USB_STATUS_USB_HOST_SPEED_Field := 16#0#;
      --  unspecified
      Reserved_4_5 : HAL.UInt2 := 16#0#;
      --  USB Line State Status
      LINESTATE    : USB_STATUS_USB_HOST_LINESTATE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_STATUS_USB_HOST_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      SPEED        at 0 range 2 .. 3;
      Reserved_4_5 at 0 range 4 .. 5;
      LINESTATE    at 0 range 6 .. 7;
   end record;

   --  Finite State Machine Status
   type USB_FSMSTATUS_USB_HOST_Register is record
      --  Read-only. Fine State Machine Status
      FSMSTATE     : FSMSTATUS_FSMSTATESelect;
      --  unspecified
      Reserved_7_7 : HAL.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_FSMSTATUS_USB_HOST_Register use record
      FSMSTATE     at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   subtype USB_FNUM_USB_HOST_MFNUM_Field is HAL.UInt3;
   subtype USB_FNUM_USB_HOST_FNUM_Field is HAL.UInt11;

   --  HOST Host Frame Number
   type USB_FNUM_USB_HOST_Register is record
      --  Micro Frame Number
      MFNUM          : USB_FNUM_USB_HOST_MFNUM_Field := 16#0#;
      --  Frame Number
      FNUM           : USB_FNUM_USB_HOST_FNUM_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_FNUM_USB_HOST_Register use record
      MFNUM          at 0 range 0 .. 2;
      FNUM           at 0 range 3 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
   end record;

   --  HOST Host Interrupt Enable Clear
   type USB_INTENCLR_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Host Start Of Frame Interrupt Disable
      HSOF           : Boolean := False;
      --  BUS Reset Interrupt Disable
      RST            : Boolean := False;
      --  Wake Up Interrupt Disable
      WAKEUP         : Boolean := False;
      --  DownStream to Device Interrupt Disable
      DNRSM          : Boolean := False;
      --  Upstream Resume from Device Interrupt Disable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Disable
      RAMACER        : Boolean := False;
      --  Device Connection Interrupt Disable
      DCONN          : Boolean := False;
      --  Device Disconnection Interrupt Disable
      DDISC          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENCLR_USB_HOST_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      HSOF           at 0 range 2 .. 2;
      RST            at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      DNRSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      DCONN          at 0 range 8 .. 8;
      DDISC          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  HOST Host Interrupt Enable Set
   type USB_INTENSET_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Host Start Of Frame Interrupt Enable
      HSOF           : Boolean := False;
      --  Bus Reset Interrupt Enable
      RST            : Boolean := False;
      --  Wake Up Interrupt Enable
      WAKEUP         : Boolean := False;
      --  DownStream to the Device Interrupt Enable
      DNRSM          : Boolean := False;
      --  Upstream Resume fromthe device Interrupt Enable
      UPRSM          : Boolean := False;
      --  Ram Access Interrupt Enable
      RAMACER        : Boolean := False;
      --  Link Power Management Interrupt Enable
      DCONN          : Boolean := False;
      --  Device Disconnection Interrupt Enable
      DDISC          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTENSET_USB_HOST_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      HSOF           at 0 range 2 .. 2;
      RST            at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      DNRSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      DCONN          at 0 range 8 .. 8;
      DDISC          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  HOST Host Interrupt Flag
   type USB_INTFLAG_USB_HOST_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Host Start Of Frame
      HSOF           : Boolean := False;
      --  Bus Reset
      RST            : Boolean := False;
      --  Wake Up
      WAKEUP         : Boolean := False;
      --  Downstream
      DNRSM          : Boolean := False;
      --  Upstream Resume from the Device
      UPRSM          : Boolean := False;
      --  Ram Access
      RAMACER        : Boolean := False;
      --  Device Connection
      DCONN          : Boolean := False;
      --  Device Disconnection
      DDISC          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_INTFLAG_USB_HOST_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      HSOF           at 0 range 2 .. 2;
      RST            at 0 range 3 .. 3;
      WAKEUP         at 0 range 4 .. 4;
      DNRSM          at 0 range 5 .. 5;
      UPRSM          at 0 range 6 .. 6;
      RAMACER        at 0 range 7 .. 7;
      DCONN          at 0 range 8 .. 8;
      DDISC          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  USB_PINTSMRY_USB_HOST_EPINT array
   type USB_PINTSMRY_USB_HOST_EPINT_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for USB_PINTSMRY_USB_HOST_EPINT
   type USB_PINTSMRY_USB_HOST_EPINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EPINT as a value
            Val : HAL.UInt8;
         when True =>
            --  EPINT as an array
            Arr : USB_PINTSMRY_USB_HOST_EPINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for USB_PINTSMRY_USB_HOST_EPINT_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  HOST Pipe Interrupt Summary
   type USB_PINTSMRY_USB_HOST_Register is record
      --  Read-only. Pipe 0 Interrupt
      EPINT         : USB_PINTSMRY_USB_HOST_EPINT_Field;
      --  unspecified
      Reserved_8_15 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_PINTSMRY_USB_HOST_Register use record
      EPINT         at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype USB_PADCAL_USB_HOST_TRANSP_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_HOST_TRANSN_Field is HAL.UInt5;
   subtype USB_PADCAL_USB_HOST_TRIM_Field is HAL.UInt3;

   --  USB PAD Calibration
   type USB_PADCAL_USB_HOST_Register is record
      --  USB Pad Transp calibration
      TRANSP         : USB_PADCAL_USB_HOST_TRANSP_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  USB Pad Transn calibration
      TRANSN         : USB_PADCAL_USB_HOST_TRANSN_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  USB Pad Trim calibration
      TRIM           : USB_PADCAL_USB_HOST_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for USB_PADCAL_USB_HOST_Register use record
      TRANSP         at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TRANSN         at 0 range 6 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      TRIM           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   ---------------------------------------
   -- USB_HOST_PIPE cluster's Registers --
   ---------------------------------------

   subtype USB_PCFG_USB_HOST_PIPE_PTOKEN_Field is HAL.UInt2;
   subtype USB_PCFG_USB_HOST_PIPE_PTYPE_Field is HAL.UInt3;

   --  HOST_PIPE End Point Configuration
   type USB_PCFG_USB_HOST_PIPE_Register is record
      --  Pipe Token
      PTOKEN       : USB_PCFG_USB_HOST_PIPE_PTOKEN_Field := 16#0#;
      --  Pipe Bank
      BK           : Boolean := False;
      --  Pipe Type
      PTYPE        : USB_PCFG_USB_HOST_PIPE_PTYPE_Field := 16#0#;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_PCFG_USB_HOST_PIPE_Register use record
      PTOKEN       at 0 range 0 .. 1;
      BK           at 0 range 2 .. 2;
      PTYPE        at 0 range 3 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  HOST_PIPE End Point Pipe Status Clear
   type USB_PSTATUSCLR_USB_HOST_PIPE_Register is record
      --  Write-only. Data Toggle clear
      DTGL         : Boolean := False;
      --  unspecified
      Reserved_1_1 : HAL.Bit := 16#0#;
      --  Write-only. Curren Bank clear
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Pipe Freeze Clear
      PFREEZE      : Boolean := False;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Bank 0 Ready Clear
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Clear
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_PSTATUSCLR_USB_HOST_PIPE_Register use record
      DTGL         at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      PFREEZE      at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  HOST_PIPE End Point Pipe Status Set
   type USB_PSTATUSSET_USB_HOST_PIPE_Register is record
      --  Write-only. Data Toggle Set
      DTGL         : Boolean := False;
      --  unspecified
      Reserved_1_1 : HAL.Bit := 16#0#;
      --  Write-only. Current Bank Set
      CURBK        : Boolean := False;
      --  unspecified
      Reserved_3_3 : HAL.Bit := 16#0#;
      --  Write-only. Pipe Freeze Set
      PFREEZE      : Boolean := False;
      --  unspecified
      Reserved_5_5 : HAL.Bit := 16#0#;
      --  Write-only. Bank 0 Ready Set
      BK0RDY       : Boolean := False;
      --  Write-only. Bank 1 Ready Set
      BK1RDY       : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_PSTATUSSET_USB_HOST_PIPE_Register use record
      DTGL         at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      PFREEZE      at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  HOST_PIPE End Point Pipe Status
   type USB_PSTATUS_USB_HOST_PIPE_Register is record
      --  Read-only. Data Toggle
      DTGL         : Boolean;
      --  unspecified
      Reserved_1_1 : HAL.Bit;
      --  Read-only. Current Bank
      CURBK        : Boolean;
      --  unspecified
      Reserved_3_3 : HAL.Bit;
      --  Read-only. Pipe Freeze
      PFREEZE      : Boolean;
      --  unspecified
      Reserved_5_5 : HAL.Bit;
      --  Read-only. Bank 0 ready
      BK0RDY       : Boolean;
      --  Read-only. Bank 1 ready
      BK1RDY       : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_PSTATUS_USB_HOST_PIPE_Register use record
      DTGL         at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      CURBK        at 0 range 2 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      PFREEZE      at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      BK0RDY       at 0 range 6 .. 6;
      BK1RDY       at 0 range 7 .. 7;
   end record;

   --  USB_PINTFLAG_USB_HOST_PIPE_TRCPT array
   type USB_PINTFLAG_USB_HOST_PIPE_TRCPT_Field_Array is array (0 .. 1)
     of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for USB_PINTFLAG_USB_HOST_PIPE_TRCPT
   type USB_PINTFLAG_USB_HOST_PIPE_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : USB_PINTFLAG_USB_HOST_PIPE_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for USB_PINTFLAG_USB_HOST_PIPE_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  HOST_PIPE Pipe Interrupt Flag
   type USB_PINTFLAG_USB_HOST_PIPE_Register is record
      --  Transfer Complete 0 Interrupt Flag
      TRCPT        : USB_PINTFLAG_USB_HOST_PIPE_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow Interrupt Flag
      TRFAIL       : Boolean := False;
      --  Pipe Error Interrupt Flag
      PERR         : Boolean := False;
      --  Transmit Setup Interrupt Flag
      TXSTP        : Boolean := False;
      --  Stall Interrupt Flag
      STALL        : Boolean := False;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_PINTFLAG_USB_HOST_PIPE_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 2;
      PERR         at 0 range 3 .. 3;
      TXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  USB_PINTENCLR_USB_HOST_PIPE_TRCPT array
   type USB_PINTENCLR_USB_HOST_PIPE_TRCPT_Field_Array is array (0 .. 1)
     of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for USB_PINTENCLR_USB_HOST_PIPE_TRCPT
   type USB_PINTENCLR_USB_HOST_PIPE_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : USB_PINTENCLR_USB_HOST_PIPE_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for USB_PINTENCLR_USB_HOST_PIPE_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  HOST_PIPE Pipe Interrupt Flag Clear
   type USB_PINTENCLR_USB_HOST_PIPE_Register is record
      --  Transfer Complete 0 Disable
      TRCPT        : USB_PINTENCLR_USB_HOST_PIPE_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow Interrupt Disable
      TRFAIL       : Boolean := False;
      --  Pipe Error Interrupt Disable
      PERR         : Boolean := False;
      --  Transmit Setup Interrupt Disable
      TXSTP        : Boolean := False;
      --  Stall Inetrrupt Disable
      STALL        : Boolean := False;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_PINTENCLR_USB_HOST_PIPE_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 2;
      PERR         at 0 range 3 .. 3;
      TXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  USB_PINTENSET_USB_HOST_PIPE_TRCPT array
   type USB_PINTENSET_USB_HOST_PIPE_TRCPT_Field_Array is array (0 .. 1)
     of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for USB_PINTENSET_USB_HOST_PIPE_TRCPT
   type USB_PINTENSET_USB_HOST_PIPE_TRCPT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TRCPT as a value
            Val : HAL.UInt2;
         when True =>
            --  TRCPT as an array
            Arr : USB_PINTENSET_USB_HOST_PIPE_TRCPT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for USB_PINTENSET_USB_HOST_PIPE_TRCPT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  HOST_PIPE Pipe Interrupt Flag Set
   type USB_PINTENSET_USB_HOST_PIPE_Register is record
      --  Transfer Complete 0 Interrupt Enable
      TRCPT        : USB_PINTENSET_USB_HOST_PIPE_TRCPT_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Error Flow Interrupt Enable
      TRFAIL       : Boolean := False;
      --  Pipe Error Interrupt Enable
      PERR         : Boolean := False;
      --  Transmit Setup Interrupt Enable
      TXSTP        : Boolean := False;
      --  Stall Interrupt Enable
      STALL        : Boolean := False;
      --  unspecified
      Reserved_6_7 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USB_PINTENSET_USB_HOST_PIPE_Register use record
      TRCPT        at 0 range 0 .. 1;
      TRFAIL       at 0 range 2 .. 2;
      PERR         at 0 range 3 .. 3;
      TXSTP        at 0 range 4 .. 4;
      STALL        at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   type USB_HOST_PIPE_Cluster is record
      --  HOST_PIPE End Point Configuration
      PCFG       : aliased USB_PCFG_USB_HOST_PIPE_Register;
      --  HOST_PIPE Bus Access Period of Pipe
      BINTERVAL  : aliased HAL.UInt8;
      --  HOST_PIPE End Point Pipe Status Clear
      PSTATUSCLR : aliased USB_PSTATUSCLR_USB_HOST_PIPE_Register;
      --  HOST_PIPE End Point Pipe Status Set
      PSTATUSSET : aliased USB_PSTATUSSET_USB_HOST_PIPE_Register;
      --  HOST_PIPE End Point Pipe Status
      PSTATUS    : aliased USB_PSTATUS_USB_HOST_PIPE_Register;
      --  HOST_PIPE Pipe Interrupt Flag
      PINTFLAG   : aliased USB_PINTFLAG_USB_HOST_PIPE_Register;
      --  HOST_PIPE Pipe Interrupt Flag Clear
      PINTENCLR  : aliased USB_PINTENCLR_USB_HOST_PIPE_Register;
      --  HOST_PIPE Pipe Interrupt Flag Set
      PINTENSET  : aliased USB_PINTENSET_USB_HOST_PIPE_Register;
   end record
     with Size => 256;

   for USB_HOST_PIPE_Cluster use record
      PCFG       at 16#0# range 0 .. 7;
      BINTERVAL  at 16#3# range 0 .. 7;
      PSTATUSCLR at 16#4# range 0 .. 7;
      PSTATUSSET at 16#5# range 0 .. 7;
      PSTATUS    at 16#6# range 0 .. 7;
      PINTFLAG   at 16#7# range 0 .. 7;
      PINTENCLR  at 16#8# range 0 .. 7;
      PINTENSET  at 16#9# range 0 .. 7;
   end record;

   type USB_HOST_PIPE_Clusters is array (0 .. 7) of USB_HOST_PIPE_Cluster;

   --  USB is Host
   type UsbHost_Cluster is record
      --  Control A
      CTRLA         : aliased USB_CTRLA_USB_HOST_Register;
      --  Synchronization Busy
      SYNCBUSY      : aliased USB_SYNCBUSY_USB_HOST_Register;
      --  USB Quality Of Service
      QOSCTRL       : aliased USB_QOSCTRL_USB_HOST_Register;
      --  HOST Control B
      CTRLB         : aliased USB_CTRLB_USB_HOST_Register;
      --  HOST Host Start Of Frame Control
      HSOFC         : aliased USB_HSOFC_USB_HOST_Register;
      --  HOST Status
      STATUS        : aliased USB_STATUS_USB_HOST_Register;
      --  Finite State Machine Status
      FSMSTATUS     : aliased USB_FSMSTATUS_USB_HOST_Register;
      --  HOST Host Frame Number
      FNUM          : aliased USB_FNUM_USB_HOST_Register;
      --  HOST Host Frame Length
      FLENHIGH      : aliased HAL.UInt8;
      --  HOST Host Interrupt Enable Clear
      INTENCLR      : aliased USB_INTENCLR_USB_HOST_Register;
      --  HOST Host Interrupt Enable Set
      INTENSET      : aliased USB_INTENSET_USB_HOST_Register;
      --  HOST Host Interrupt Flag
      INTFLAG       : aliased USB_INTFLAG_USB_HOST_Register;
      --  HOST Pipe Interrupt Summary
      PINTSMRY      : aliased USB_PINTSMRY_USB_HOST_Register;
      --  Descriptor Address
      DESCADD       : aliased HAL.UInt32;
      --  USB PAD Calibration
      PADCAL        : aliased USB_PADCAL_USB_HOST_Register;
      USB_HOST_PIPE : aliased USB_HOST_PIPE_Clusters;
   end record
     with Size => 2048 + 2048;

   for UsbHost_Cluster use record
      CTRLA         at 16#0# range 0 .. 7;
      SYNCBUSY      at 16#2# range 0 .. 7;
      QOSCTRL       at 16#3# range 0 .. 7;
      CTRLB         at 16#8# range 0 .. 15;
      HSOFC         at 16#A# range 0 .. 7;
      STATUS        at 16#C# range 0 .. 7;
      FSMSTATUS     at 16#D# range 0 .. 7;
      FNUM          at 16#10# range 0 .. 15;
      FLENHIGH      at 16#12# range 0 .. 7;
      INTENCLR      at 16#14# range 0 .. 15;
      INTENSET      at 16#18# range 0 .. 15;
      INTFLAG       at 16#1C# range 0 .. 15;
      PINTSMRY      at 16#20# range 0 .. 15;
      DESCADD       at 16#24# range 0 .. 31;
      PADCAL        at 16#28# range 0 .. 15;
      USB_HOST_PIPE at 16#100# range 0 .. 2047;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type USB_Disc is
     (DEVICE,
      HOST);

   --  Universal Serial Bus
   type USB_Peripheral
     (Discriminent : USB_Disc := DEVICE)
   is record
      case Discriminent is
         when DEVICE =>
            --  USB is Device
            USB_DEVICE : aliased UsbDevice_Cluster;
         when HOST =>
            --  USB is Host
            USB_HOST : aliased UsbHost_Cluster;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for USB_Peripheral use record
      USB_DEVICE at 0 range 0 .. 4095; -- 2303;
      USB_HOST   at 0 range 0 .. 4095; -- 2303;
   end record;

   --  Universal Serial Bus
   USB_Periph : aliased USB_Peripheral
     with Import, Address => USB_Base;

end SAM_SVD.USB;
