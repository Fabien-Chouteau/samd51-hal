------------------------------------------------------------------------------
--                                                                          --
--                        Copyright (C) 2019, AdaCore                       --
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

with HAL.UART; use HAL.UART;
with HAL;      use HAL;

package SAM.SERCOM.USART is

   type USART_Device
   is new SERCOM_Device and HAL.UART.UART_Port
   with private;

   procedure Configure (This            : in out USART_Device;
                        Baud            : UInt16;
                        MSB_First       : Boolean;
                        TX_Fall_RX_Rise : Boolean;
                        Parity          : Boolean;
                        Synchronous_Com : Boolean;
                        RXPO            : Pad_Id;
                        TXPO            : Pad_Id;
                        Run_In_Standby  : Boolean)
     with Pre  => not This.Enabled and then not This.Configured,
          Post => not This.Enabled and then This.Configured;
   --  Configure SERCOM in USART mode

   procedure Enable_Receiver (This : in out USART_Device);
   procedure Disable_Receiver (This : in out USART_Device);

   procedure Enable_Transmitter (This : in out USART_Device);
   procedure Disable_Transmitter (This : in out USART_Device);

   -- DMA --

   function Data_Address (This : USART_Device) return System.Address;
   --  return the address of the data register for DMA transfer configuration

   --------------
   -- HAL.UART --
   --------------

   function Data_Size (Port : USART_Device) return UART_Data_Size;

   overriding
   procedure Transmit
     (This    : in out USART_Device;
      Data    : HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Transmit
     (This    : in out USART_Device;
      Data    : HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out USART_Device;
      Data    : out HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out USART_Device;
      Data    : out HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000);

private

   type USART_Device
   is new SERCOM_Device and HAL.UART.UART_Port
   with null record;

end SAM.SERCOM.USART;
