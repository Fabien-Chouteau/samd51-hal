------------------------------------------------------------------------------
--                                                                          --
--                        Copyright (C) 2021, AdaCore                       --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with System.Storage_Elements;
with SAM_SVD.USB; use SAM_SVD.USB;

package body SAM.USB is

   NVM_Software_Calibration_Area : constant := 16#00800080#;
   USB_Calibration_Addr : constant := NVM_Software_Calibration_Area + 4;

   type USB_Calibration is record
      TRANSP   : UInt5;
      TRANSN   : UInt5;
      TRIM     : UInt3;
      Reserved : UInt3;
   end record
     with Volatile_Full_Access, Size => 16;

   for USB_Calibration use record
      TRANSP   at 0 range  0 ..  4;
      TRANSN   at 0 range  5 ..  9;
      TRIM     at 0 range 10 .. 12;
      Reserved at 0 range 13 .. 15;
   end record;

   USB_Cal : USB_Calibration
     with Address => System'To_Address (USB_Calibration_Addr);

   function To_EP_Size (Size : UInt8) return EP_Packet_Size
   is (case Size is
          when 8    => S_8Bytes,
          when 16   => S_16Bytes,
          when 32   => S_32Bytes,
          when 64   => S_64Bytes,
          when 128  => S_128Bytes,
          --  when 256  => S_256Bytes,
          --  when 512  => S_512Bytes,
          --  when 1023 => S_1023Bytes,
          when others => raise Program_Error with "Invalid Size for EP"
      );

   ----------------
   -- Initialize --
   ----------------

   overriding
   procedure Initialize (This : in out UDC) is
      P : USB_Peripheral renames This.Periph.all;
   begin

      --  Reset the peripheral
      P.USB_DEVICE.CTRLA.SWRST := True;
      while P.USB_DEVICE.SYNCBUSY.SWRST loop
         null;
      end loop;

      P.USB_DEVICE.PADCAL.TRANSP := USB_Cal.TRANSP;
      P.USB_DEVICE.PADCAL.TRANSN := USB_Cal.TRANSN;
      P.USB_DEVICE.PADCAL.TRIM := USB_Cal.TRIM;

      P.USB_DEVICE.CTRLB.DETACH := True;

      --  Highest Quality of Service
      P.USB_DEVICE.QOSCTRL.CQOS := 3;
      P.USB_DEVICE.QOSCTRL.DQOS := 3;

      P.USB_DEVICE.CTRLB.SPDCONF := FS;

      P.USB_DEVICE.DESCADD :=
        UInt32 (System.Storage_Elements.To_Integer (This.EP_Descs'Address));

   end Initialize;

   --------------------
   -- Request_Buffer --
   --------------------

   overriding
   function Request_Buffer (This          : in out UDC;
                            Ep            :        EP_Addr;
                            Len           :        UInt11;
                            Min_Alignment :        UInt8 := 1)
                            return System.Address
   is
   begin
      return Standard.USB.Utils.Allocate
        (This.Alloc,
         Alignment => UInt8'Max (Min_Alignment, EP_Buffer_Min_Alignment),
         Len       => Len);
   end Request_Buffer;

   -----------
   -- Start --
   -----------

   overriding
   procedure Start (This : in out UDC) is
   begin
      This.Periph.USB_DEVICE.CTRLA := (MODE     => DEVICE,
                                       RUNSTDBY => True,
                                       ENABLE   => True,
                                       SWRST    => False,
                                       others   => <>);

      while This.Periph.USB_DEVICE.SYNCBUSY.ENABLE loop
         null;
      end loop;

      This.Periph.USB_DEVICE.CTRLB.DETACH := False;

      This.EP_Descs (0).Bank0_Out.ADDR := This.EP0_Buffer'Address;

      if (UInt32 (System.Storage_Elements.To_Integer (This.EP0_Buffer'Address))
          and 2#11#) /= 0
      then
         raise Program_Error with "Invalid alignement for EP0 buffer";
      end if;
      This.EP0_Buffer := (others => 42);
   end Start;

   -----------
   -- Reset --
   -----------

   overriding
   procedure Reset (This : in out UDC)
   is
   begin
      null;
   end Reset;

   ----------
   -- Poll --
   ----------

   overriding
   function Poll (This : in out UDC) return UDC_Event is
      P : USB_Peripheral renames This.Periph.all;
   begin

      --  End Of Reset
      if P.USB_DEVICE.INTFLAG.EORST then
         --  Clear flag
         P.USB_DEVICE.INTFLAG.EORST := True;
         return (Kind => Reset);
      end if;

      --  Endpoint events
      declare
         EPINT : UInt8 := P.USB_DEVICE.EPINTSMRY.EPINT.Val;
         EP_Status : USB_EPINTFLAG_USB_DEVICE_ENDPOINT_Register;
         EP_Out_Size, EP_In_Size : UInt14;
      begin
         for Ep in P.USB_DEVICE.USB_DEVICE_ENDPOINT'Range loop

            exit when EPINT = 0;

            if True or else (EPINT and 1) /= 0 then
               EP_Status := P.USB_DEVICE.USB_DEVICE_ENDPOINT (Ep).EPINTFLAG;

               --  Setup Request
               if Ep = 0
                 and then
                   EP_Status.RXSTP
               then

                  P.USB_DEVICE.USB_DEVICE_ENDPOINT (0).EPINTFLAG :=
                    (
                     --  Clear the interrupt the RXSTP flag.
                     RXSTP  => True,

                     --  Although Setup packet only set RXSTP bit, TRCPT0 bit
                     --  could already be set by previous ZLP OUT Status (not
                     --  handled until now).
                     TRCPT0 =>  True,

                     others => <>);

                  declare
                     Req : Setup_Data with Address => This.EP0_Buffer'Address;
                  begin
                     return (Kind   => Setup_Request,
                             Req    => Req,
                             Req_EP => 0);
                  end;
               end if;

               --  Check transfer IN complete
               if EP_Status.TRCPT1 then

                  P.USB_DEVICE.USB_DEVICE_ENDPOINT (Ep).EPINTFLAG :=
                    (TRCPT1 => True, TRFAIL1 => True, others => <>);

                  EP_In_Size := This.EP_Descs (Ep).Bank1_In.PCKSIZE.BYTE_COUNT;

                  return (Kind => Transfer_Complete,
                          EP   => (UInt4 (Ep), EP_In),
                          BCNT => UInt11 (EP_In_Size));
               end if;

               --  Check transfer OUT complete
               if EP_Status.TRCPT0 then

                  EP_Out_Size :=
                    This.EP_Descs (Ep).Bank0_Out.PCKSIZE.BYTE_COUNT;

                  P.USB_DEVICE.USB_DEVICE_ENDPOINT (Ep).EPINTFLAG :=
                    (TRCPT0 => True, others => <>);

                  return (Kind => Transfer_Complete,
                          EP   => (UInt4 (Ep), EP_Out),
                          BCNT => UInt11 (EP_Out_Size));
               end if;

            end if;

            EPINT := Shift_Right (EPINT, 1);
         end loop;
      end;
      return No_Event;
   end Poll;

   ---------------------
   -- EP_Write_Packet --
   ---------------------

   overriding
   procedure EP_Write_Packet (This : in out UDC;
                              Ep   :        EP_Id;
                              Addr :        System.Address;
                              Len  :        UInt32)
   is
      P : USB_Peripheral renames This.Periph.all;
      Num : constant Natural := Natural (Ep);
   begin
      if Num > This.Periph.USB_DEVICE.USB_DEVICE_ENDPOINT'Last
      then
         raise Program_Error with "Invalid endpoint number";
      end if;

      if Len > UInt32 (UInt14'Last) then
         raise Program_Error with "Packet too big for endpoint";
      end if;

      This.EP_Descs (Num).Bank1_In.ADDR := Addr;
      This.EP_Descs (Num).Bank1_In.PCKSIZE.BYTE_COUNT := UInt14 (Len);
      This.EP_Descs (Num).Bank1_In.PCKSIZE.MULTI_PACKET_SIZE := 0;

      --  Set the bank to ready to start the transfer
      P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPINTFLAG :=
        (TRFAIL1 => True, others => <>);

      P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPSTATUSSET.BK1RDY := True;
   end EP_Write_Packet;

   --------------
   -- EP_Setup --
   --------------

   overriding
   procedure EP_Setup (This     : in out UDC;
                       EP       :        EP_Addr;
                       Typ      :        EP_Type;
                       Max_Size :        UInt16)
   is
      P : USB_Peripheral renames This.Periph.all;
      Num : constant Natural := Natural (EP.Num);
      EPTYPE : constant UInt3 := (case Typ is
                                     when Control     => 1,
                                     when Isochronous => 2,
                                     when Bulk        => 3,
                                     when Interrupt   => 4);
   begin
      if Num > This.Periph.USB_DEVICE.USB_DEVICE_ENDPOINT'Last
      then
         raise Program_Error with "Invalid endpoint number";
      end if;

      case EP.Dir is
         when EP_Out =>
            This.EP_Descs (Num).Bank0_Out.PCKSIZE.SIZE :=
              To_EP_Size (This.Max_Packet_Size);

            This.EP_Descs (Num).Bank0_Out.PCKSIZE.BYTE_COUNT := 0;
            This.EP_Descs (Num).Bank0_Out.PCKSIZE.MULTI_PACKET_SIZE := 0;
            This.EP_Descs (Num).Bank0_Out.PCKSIZE.AUTO_ZLP := False;

            --  Clear flags
            P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPINTFLAG :=
              (TRCPT0 => True, others => <>);

            --  Enable the endpoint with the requested type
            P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPCFG.EPTYPE0 := EPTYPE;

            --  Enable TRCPT interrupt
            --  /!\ If the endpoint is not enabled the interrupt will not be
            --  enabled.
            P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPINTENSET.TRCPT0  := True;

         when EP_In =>
            This.EP_Descs (Num).Bank1_In.PCKSIZE.SIZE :=
              To_EP_Size (This.Max_Packet_Size);

            This.EP_Descs (Num).Bank1_In.PCKSIZE.BYTE_COUNT := 0;
            This.EP_Descs (Num).Bank1_In.PCKSIZE.MULTI_PACKET_SIZE := 0;
            This.EP_Descs (Num).Bank1_In.PCKSIZE.AUTO_ZLP := False;

            --  Clear flags
            P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPINTFLAG :=
              (TRCPT1 => True, others => <>);

            --  Enable the endpoint with the requested type
            P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPCFG.EPTYPE1 := EPTYPE;

            --  Enable TRCPT interrupt
            --  /!\ If the endpoint is not enabled the interrupt will not be
            --  enabled.
            P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPINTENSET.TRCPT1 := True;

      end case;
   end EP_Setup;

   -----------------------
   -- EP_Ready_For_Data --
   -----------------------

   overriding
   procedure EP_Ready_For_Data (This  : in out UDC;
                                EP    :        EP_Id;
                                Addr  :        System.Address;
                                Size  :        UInt32;
                                Ready :        Boolean := True)
   is
      P : USB_Peripheral renames This.Periph.all;
      Num : constant Natural := Natural (EP);
   begin
      if Num > This.Periph.USB_DEVICE.USB_DEVICE_ENDPOINT'Last
      then
         raise Program_Error with "Invalid endpoint number";
      end if;

      if Ready then

         if EP = 0 then
            --  TODO: Why? EP0 always on internal buffer?
            This.EP_Descs (0).Bank0_Out.ADDR := This.EP0_Buffer'Address;
         else
            This.EP_Descs (Num).Bank0_Out.ADDR := Addr;
         end if;

         --  Enable RXSTP interrupt
         P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPINTENSET.RXSTP := True;

         This.EP_Descs (Num).Bank0_Out.PCKSIZE.MULTI_PACKET_SIZE :=
           UInt14 (Size);

         This.EP_Descs (Num).Bank0_Out.PCKSIZE.BYTE_COUNT := 0;

         --  Clear Bank0-Ready to say we are ready to receive data
         P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPINTFLAG :=
           (TRFAIL0 => True, others => <>);
         P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPSTATUSCLR.BK0RDY := True;
      else
         --  Set Bank0-Ready to say we are NOT ready to receive data
         P.USB_DEVICE.USB_DEVICE_ENDPOINT (Num).EPSTATUSSET.BK0RDY := True;
      end if;
   end EP_Ready_For_Data;

   --------------
   -- EP_Stall --
   --------------

   overriding
   procedure EP_Stall (This : in out UDC;
                       EP   :        EP_Addr;
                       Set  :        Boolean := True)
   is
      P   : USB_Peripheral renames This.Periph.all;
      Num : constant Natural := Natural (EP.Num);
   begin
      if Integer (EP.Num) > This.Periph.USB_DEVICE.USB_DEVICE_ENDPOINT'Last
      then
         raise Program_Error with "Invalid endpoint number";
      end if;

      case EP.Dir is
         when EP_Out =>
            if Set then
               P.USB_DEVICE.USB_DEVICE_ENDPOINT
                 (Num).EPSTATUSSET.STALLRQ.Arr (0) := True;
            else
               P.USB_DEVICE.USB_DEVICE_ENDPOINT
                 (Num).EPSTATUSCLR.STALLRQ.Arr (0) := True;
            end if;
         when EP_In =>
            if Set then
               P.USB_DEVICE.USB_DEVICE_ENDPOINT
                 (Num).EPSTATUSSET.STALLRQ.Arr (1) := True;
            else
               P.USB_DEVICE.USB_DEVICE_ENDPOINT
                 (Num).EPSTATUSCLR.STALLRQ.Arr (1) := True;
            end if;
      end case;
   end EP_Stall;

   -----------------
   -- Set_Address --
   -----------------

   overriding
   procedure Set_Address (This : in out UDC;
                          Addr :        UInt7)
   is
   begin
      This.Periph.USB_DEVICE.DADD := (ADDEN => True, DADD => Addr);
   end Set_Address;

end SAM.USB;
