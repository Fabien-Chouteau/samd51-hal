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

with System;
with HAL; use HAL;

with USB; use USB;
with USB.HAL.Device; use USB.HAL.Device;
with USB.Utils;

with SAM_SVD.USB;

package SAM.USB is

   type UDC (Periph          : not null access SAM_SVD.USB.USB_Peripheral;
             Max_Packet_Size : UInt8;
             EP_Buffers_Size : Natural)
   is new USB_Device_Controller with private;

   overriding
   procedure Initialize (This : in out UDC);

   overriding
   function Request_Buffer (This          : in out UDC;
                            Ep            :        EP_Addr;
                            Len           :        UInt11;
                            Min_Alignment :        UInt8 := 1)
                            return System.Address;

   overriding
   function Valid_EP_Id (This : in out UDC;
                         EP   :        EP_Id)
                         return Boolean
   is (Natural (EP) in This.Periph.USB_DEVICE.USB_DEVICE_ENDPOINT'Range);

   overriding
   procedure Start (This : in out UDC);

   overriding
   procedure Reset (This : in out UDC);

   overriding
   function Poll (This : in out UDC) return UDC_Event;

   overriding
   procedure EP_Write_Packet (This : in out UDC;
                              Ep   : EP_Id;
                              Addr : System.Address;
                              Len  : UInt32);

   overriding
   procedure EP_Setup (This     : in out UDC;
                       EP       : EP_Addr;
                       Typ      : EP_Type;
                       Max_Size : UInt16);

   overriding
   procedure EP_Ready_For_Data (This  : in out UDC;
                                EP    : EP_Id;
                                Addr  : System.Address;
                                Size  : UInt32;
                                Ready : Boolean := True);

   overriding
   procedure EP_Stall (This : in out UDC;
                       EP   :        EP_Addr;
                       Set  :        Boolean := True);

   overriding
   procedure Set_Address (This : in out UDC;
                          Addr : UInt7);

   overriding
   function Early_Address (This : UDC) return Boolean
   is (False);

private

   EP_Buffer_Min_Alignment : constant := 4;

   type EP_Packet_Size is (S_8Bytes, S_16Bytes, S_32Bytes, S_64Bytes,
                           S_128Bytes, S_256Bytes, S_512Bytes, S_1023Bytes)
     with Size => 3;

   for EP_Packet_Size use (S_8Bytes    => 0,
                           S_16Bytes   => 1,
                           S_32Bytes   => 2,
                           S_64Bytes   => 3,
                           S_128Bytes  => 4,
                           S_256Bytes  => 5,
                           S_512Bytes  => 6,
                           S_1023Bytes => 7);

   type Device_EP_Descriptor_PCKSIZE is record
      BYTE_COUNT : UInt14;
      MULTI_PACKET_SIZE : UInt14;
      SIZE : EP_Packet_Size;
      AUTO_ZLP : Boolean;
   end record
     with Volatile, Size => 32;

   for Device_EP_Descriptor_PCKSIZE use record
      BYTE_COUNT        at 16#0# range  0 .. 13;
      MULTI_PACKET_SIZE at 16#0# range 14 .. 27;
      SIZE              at 16#0# range 28 .. 30;
      AUTO_ZLP          at 16#0# range 31 .. 31;
   end record;

   type Device_EP_Descriptor_EXTREG is record
      SUBPID : UInt4;
      VARIABLE : UInt11;
   end record
     with Volatile, Size => 16;

   for Device_EP_Descriptor_EXTREG use record
      SUBPID   at 16#0# range 0 .. 3;
      VARIABLE at 16#0# range 4 .. 14;
   end record;

   type Device_EP_Descriptor_Bank0 is record
      ADDR      : System.Address;
      PCKSIZE   : Device_EP_Descriptor_PCKSIZE;
      EXTREG    : Device_EP_Descriptor_EXTREG;
      CRCERR    : Boolean;
      ERRORFLOW : Boolean;
      Reserved  : UInt32;
   end record
     with Volatile, Size => 16 * 8;

   for Device_EP_Descriptor_Bank0 use record
      ADDR      at 16#00# range 0 .. 31;
      PCKSIZE   at 16#04# range 0 .. 31;
      EXTREG    at 16#08# range 0 .. 15;
      CRCERR    at 16#0A# range 0 .. 0;
      ERRORFLOW at 16#0A# range 1 .. 1;
      Reserved  at 16#0C# range 0 .. 31;
   end record;

   type Device_EP_Descriptor_Bank1 is record
      ADDR      : System.Address;
      PCKSIZE   : Device_EP_Descriptor_PCKSIZE;
      CRCERR    : Boolean;
      ERRORFLOW : Boolean;
      Reserved  : UInt32;
   end record
     with Volatile, Size => 16 * 8;

   for Device_EP_Descriptor_Bank1 use record
      ADDR      at 16#00# range 0 .. 31;
      PCKSIZE   at 16#04# range 0 .. 31;
      CRCERR    at 16#0A# range 0 .. 0;
      ERRORFLOW at 16#0A# range 1 .. 1;
      Reserved  at 16#0C# range 0 .. 31;
   end record;

   type Device_EP_Descriptor is record
      Bank0_Out : Device_EP_Descriptor_Bank0;
      Bank1_In  : Device_EP_Descriptor_Bank1;
   end record
     with Volatile, Size => 16 * 8 * 2;

   for Device_EP_Descriptor use record
      Bank0_Out at 16#00# range 0 .. 127;
      Bank1_In  at 16#10# range 0 .. 127;
   end record;

   type EP_Descriptor_Array
   is array (SAM_SVD.USB.USB_DEVICE_ENDPOINT_Clusters'Range)
     of Device_EP_Descriptor
   with Pack;

   type EP_Buffer is array (UInt8 range <>) of UInt8
     with Alignment => 32;

   type UDC (Periph          : not null access SAM_SVD.USB.USB_Peripheral;
             Max_Packet_Size : UInt8;
             EP_Buffers_Size : Natural)
   is new USB_Device_Controller with record
      EP0_Buffer : EP_Buffer (1 .. Max_Packet_Size);

      Alloc : Standard.USB.Utils.Basic_RAM_Allocator (EP_Buffers_Size);

      EP_Descs : EP_Descriptor_Array;
   end record;

end SAM.USB;
