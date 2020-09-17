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

with HAL.I2C; use HAL.I2C;
with HAL;     use HAL;

package SAM.SERCOM.I2C is

   type I2C_Device
   is new SERCOM_Device and HAL.I2C.I2C_Port
   with private;

   procedure Configure (This : in out I2C_Device;
                        Baud :        UInt8)
     with Pre  => not This.Enabled and then not This.Configured,
          Post => not This.Enabled and then This.Configured;
   --  Configure SERCOM in I2C Master mode.

   -- DMA --

   function Data_Address (This : I2C_Device) return System.Address;
   --  return the address of the data register for DMA transfer configuration

   -------------
   -- HAL.I2C --
   -------------

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Device;
      Addr    : I2C_Address;
      Data    : I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Master_Receive
     (This    : in out I2C_Device;
      Addr    : I2C_Address;
      Data    : out I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Mem_Write
     (This          : in out I2C_Device;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000);

   overriding
   procedure Mem_Read
     (This          : in out I2C_Device;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : out I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000);
private

   type I2C_Device
   is new SERCOM_Device and HAL.I2C.I2C_Port
   with record
      Do_Stop_Sequence : Boolean := True;
   end record;

   procedure Wait_Sync (This : in out I2C_Device);

   procedure Wait_Bus (This : in out I2C_Device);

   function Send_Addr (This : in out I2C_Device;
                       Addr : UInt11)
                       return I2C_Status;

   procedure Cmd_Stop (This : in out I2C_Device);
   procedure Cmd_Read (This : in out I2C_Device);
   procedure Cmd_Nack (This : in out I2C_Device);

   function Bus_Status (This : I2C_Device) return I2C_Status;

end SAM.SERCOM.I2C;
