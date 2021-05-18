pragma Ada_2012;
package body SAM.SERCOM.USART is

   ---------------
   -- Configure --
   ---------------

   procedure Configure (This            : in out USART_Device;
                        Baud            : UInt16;
                        MSB_First       : Boolean;
                        TX_Fall_RX_Rise : Boolean;
                        Parity          : Boolean;
                        Synchronous_Com : Boolean;
                        RXPO            :        Pad_Id;
                        TXPO            : Pad_Id;
                        Run_In_Standby  : Boolean)
   is
   begin
      This.Reset;

      This.Periph.SERCOM_USART.CTRLA :=
        (MODE     => 1, -- USART with internal clock
         RUNSTDBY => Run_In_Standby,
         TXPO     => UInt2 (TXPO),
         RXPO     => UInt2 (RXPO),
         FORM     => (if Parity then 1 else 0),
         CMODE    => Synchronous_Com,
         CPOL     => TX_Fall_RX_Rise,
         DORD     => not MSB_First,
         others   => <>);

      This.Periph.SERCOM_USART.BAUD := Baud;

      This.Config_Done := True;
   end Configure;

   ---------------------
   -- Enable_Receiver --
   ---------------------

   procedure Enable_Receiver (This : in out USART_Device) is
   begin
      This.Periph.SERCOM_USART.CTRLB.RXEN := True;
   end Enable_Receiver;

   ----------------------
   -- Disable_Receiver --
   ----------------------

   procedure Disable_Receiver (This : in out USART_Device) is
   begin
      This.Periph.SERCOM_USART.CTRLB.RXEN := False;
   end Disable_Receiver;

   ------------------------
   -- Enable_Transmitter --
   ------------------------

   procedure Enable_Transmitter (This : in out USART_Device) is
   begin
      This.Periph.SERCOM_USART.CTRLB.TXEN := True;
   end Enable_Transmitter;

   -------------------------
   -- Disable_Transmitter --
   -------------------------

   procedure Disable_Transmitter (This : in out USART_Device) is
   begin
      This.Periph.SERCOM_USART.CTRLB.TXEN := False;
   end Disable_Transmitter;

   ------------------
   -- Data_Address --
   ------------------

   function Data_Address (This : USART_Device) return System.Address is
   begin
      return This.Periph.SERCOM_USART.DATA'Address;
   end Data_Address;

   ---------------
   -- Data_Size --
   ---------------

   function Data_Size (Port : USART_Device) return UART_Data_Size is
   begin
      return HAL.UART.Data_Size_8b;
   end Data_Size;

   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit (This    : in out USART_Device;
                       Data    :        HAL.UART.UART_Data_8b;
                       Status  :    out HAL.UART.UART_Status;
                       Timeout :        Natural := 1_000)
   is
   begin

      for Elt of Data loop
         This.Periph.SERCOM_USART.DATA := UInt32 (Elt);

         while not This.Periph.SERCOM_USART.INTFLAG.DRE loop
            null;
         end loop;
      end loop;

      Status := Ok;
   end Transmit;

   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit (This    : in out USART_Device;
                       Data    :        HAL.UART.UART_Data_9b;
                       Status  :    out HAL.UART.UART_Status;
                       Timeout :        Natural := 1_000)
   is
   begin
      raise Program_Error with "Unimplemented procedure Transmit";
   end Transmit;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive (This    : in out USART_Device;
                      Data    :    out HAL.UART.UART_Data_8b;
                      Status  :    out HAL.UART.UART_Status;
                      Timeout :        Natural := 1_000)
   is
   begin
      for Elt of Data loop
         while not This.Periph.SERCOM_USART.INTFLAG.RXC loop
            null;
         end loop;
         Elt := UInt8 (This.Periph.SERCOM_USART.DATA);
      end loop;

      Status := Ok;
   end Receive;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive (This    : in out USART_Device;
                      Data    :    out HAL.UART.UART_Data_9b;
                      Status  :    out HAL.UART.UART_Status;
                      Timeout :        Natural := 1_000)
   is
   begin
      raise Program_Error with "Unimplemented procedure Receive";
   end Receive;

end SAM.SERCOM.USART;
