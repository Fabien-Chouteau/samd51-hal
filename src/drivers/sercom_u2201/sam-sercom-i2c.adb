------------------------------------------------------------------------------
--                                                                          --
--                        Copyright (C) 2020, AdaCore                       --
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

package body SAM.SERCOM.I2C is

   ---------------
   -- Configure --
   ---------------

   procedure Configure (This : in out I2C_Device;
                        Baud :        UInt8)
   is
      CTRLB : SERCOM_CTRLB_SERCOM_I2CM_Register;
   begin

      This.Reset;

      This.Periph.SERCOM_I2CM.CTRLA.MODE := 5;

      This.Wait_Sync;

      This.Periph.SERCOM_I2CM.BAUD := (BAUD      => Baud,
                                       BAUDLOW   => 0,
                                       HSBAUD    => Baud,
                                       HSBAUDLOW => 0);

      CTRLB := This.Periph.SERCOM_I2CM.CTRLB;
      CTRLB.SMEN := False; -- Smart mode
      This.Periph.SERCOM_I2CM.CTRLB := CTRLB;

      This.Wait_Sync;

      This.Periph.SERCOM_I2CM.STATUS.BUSSTATE := 1; -- Set to IDLE

      This.Wait_Sync;

      This.Config_Done := True;
   end Configure;

   ------------------
   -- Data_Address --
   ------------------

   function Data_Address (This : I2C_Device) return System.Address
   is (This.Periph.SERCOM_I2CM.Data'Address);

   ---------------------
   -- Master_Transmit --
   ---------------------

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Device;
      Addr    : I2C_Address;
      Data    : I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
   is
   begin
      --  Address is shifted to the left to use bit 0 as read/write mode
      Status := This.Send_Addr (UInt11 (Addr) * 2);
      if Status /= Ok then
         This.Cmd_Stop;
         return;
      end if;

      for Elt of Data loop
         This.Periph.SERCOM_I2CM.DATA := UInt32 (Elt);

         This.Wait_Bus;

         Status := This.Bus_Status;
         exit when Status /= Ok;
      end loop;

      if This.Do_Stop_Sequence then
         This.Cmd_Stop;
      end if;
   end Master_Transmit;

   --------------------
   -- Master_Receive --
   --------------------

   overriding
   procedure Master_Receive
     (This    : in out I2C_Device;
      Addr    : I2C_Address;
      Data    : out I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
   is
   begin
      if Data'Length = 0 then
         Status := Ok;
         return;
      end if;

      --  Address is shifted to the left to use bit 0 as read/write mode
      Status := This.Send_Addr ((UInt11 (Addr) * 2) or 1);
      if Status /= Ok then
         This.Cmd_Stop;
         return;
      end if;

      --  Get the first byte
      Data (Data'First) := UInt8 (This.Periph.SERCOM_I2CM.DATA);

      for Index in Data'First + 1 .. Data'Last loop

         This.Cmd_Read;

         This.Wait_Bus;

         Status := This.Bus_Status;
         exit when Status /= Ok;

         Data (Index) := UInt8 (This.Periph.SERCOM_I2CM.DATA);
      end loop;

      This.Cmd_Nack;

      This.Cmd_Stop;
   end Master_Receive;

   ---------------
   -- Mem_Write --
   ---------------

   overriding
   procedure Mem_Write
     (This          : in out I2C_Device;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
   is
   begin

      This.Do_Stop_Sequence := False;

      case Mem_Addr_Size is
         when Memory_Size_8b =>
            This.Master_Transmit (Addr    => Addr,
                                  Data    => (0 => UInt8 (Mem_Addr)),
                                  Status  => Status,
                                  Timeout => Timeout);
         when Memory_Size_16b =>
            This.Master_Transmit (Addr    => Addr,
                                  Data    => (UInt8 (Shift_Right (Mem_Addr, 8)),
                                              UInt8 (Mem_Addr and 16#FF#)),
                                  Status  => Status,
                                  Timeout => Timeout);
      end case;


      This.Do_Stop_Sequence := True;

      if Status /= Ok then
         This.Cmd_Stop;
         return;
      end if;

      This.Master_Transmit (Addr    => Addr,
                            Data    => Data,
                            Status  => Status,
                            Timeout => Timeout);
   end Mem_Write;

   --------------
   -- Mem_Read --
   --------------

   overriding
   procedure Mem_Read
     (This          : in out I2C_Device;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : out I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
   is
   begin
      This.Do_Stop_Sequence := False;

      case Mem_Addr_Size is
         when Memory_Size_8b =>
            This.Master_Transmit (Addr    => Addr,
                                  Data    => (0 => UInt8 (Mem_Addr)),
                                  Status  => Status,
                                  Timeout => Timeout);
         when Memory_Size_16b =>
            This.Master_Transmit (Addr    => Addr,
                                  Data    => (UInt8 (Shift_Right (Mem_Addr, 8)),
                                              UInt8 (Mem_Addr and 16#FF#)),
                                  Status  => Status,
                                  Timeout => Timeout);
      end case;

      This.Do_Stop_Sequence := True;

      if Status /= Ok then
         This.Cmd_Stop;
         return;
      end if;

      This.Master_Receive (Addr    => Addr,
                           Data    => Data,
                           Status  => Status,
                           Timeout => Timeout);
   end Mem_Read;

   ---------------
   -- Wait_Sync --
   ---------------

   procedure Wait_Sync (This : in out I2C_Device) is
   begin
      while This.Periph.SERCOM_I2CM.SYNCBUSY.SYSOP loop
         null;
      end loop;
   end Wait_Sync;

   --------------
   -- Wait_Bus --
   --------------

   procedure Wait_Bus (This : in out I2C_Device) is
      INTFLAG : SERCOM_INTFLAG_SERCOM_I2CM_Register;
   begin
      loop
         INTFLAG := This.Periph.SERCOM_I2CM.INTFLAG;
         exit when INTFLAG.MB or else INTFLAG.SB or else INTFLAG.ERROR;
      end loop;
   end Wait_Bus;

   ---------------
   -- Send_Addr --
   ---------------

   function Send_Addr (This : in out I2C_Device;
                       Addr : UInt11)
                       return I2C_Status
   is
      Reg : SERCOM_ADDR_SERCOM_I2CM_Register;
   begin
      Reg := This.Periph.SERCOM_I2CM.ADDR;
      Reg.ADDR := Addr;
      Reg.TENBITEN := False;
      Reg.HS := False; -- High-speed transfer
      Reg.LENEN := False; -- Automatic transfer length
      This.Periph.SERCOM_I2CM.ADDR := Reg;

      This.Wait_Sync;

      This.Wait_Bus;

      return This.Bus_Status;
   end Send_Addr;

   --------------
   -- Cmd_Stop --
   --------------

   procedure Cmd_Stop (This : in out I2C_Device) is
   begin
      This.Periph.SERCOM_I2CM.CTRLB.CMD := 3;

      This.Wait_Sync;
   end Cmd_Stop;

   --------------
   -- Cmd_Nack --
   --------------

   procedure Cmd_Nack (This : in out I2C_Device) is
   begin
      This.Periph.SERCOM_I2CM.CTRLB.ACKACT := True;

      This.Wait_Sync;
   end Cmd_Nack;

   --------------
   -- Cmd_Read --
   --------------

   procedure Cmd_Read (This : in out I2C_Device) is
      CTRLB : SERCOM_CTRLB_SERCOM_I2CM_Register;
   begin
      CTRLB := This.Periph.SERCOM_I2CM.CTRLB;

      CTRLB.CMD := 2; -- Read command
      CTRLB.ACKACT := False; -- False means send ack

      This.Periph.SERCOM_I2CM.CTRLB := CTRLB;

      This.Wait_Sync;
   end Cmd_Read;

   ----------------
   -- Bus_Status --
   ----------------

   function Bus_Status (This : I2C_Device) return I2C_Status is
   begin
      if This.Periph.SERCOM_I2CM.STATUS.RXNACK
        or else
         This.Periph.SERCOM_I2CM.STATUS.BUSERR
      then
         return HAL.I2C.Err_Error; -- We should have an addr nack status value
      elsif This.Periph.SERCOM_I2CM.STATUS.ARBLOST then
         return HAL.I2C.Busy;
      else
         return HAL.I2C.Ok;
      end if;

   end Bus_Status;

end SAM.SERCOM.I2C;
