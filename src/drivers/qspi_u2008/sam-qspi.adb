------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2020-2021, AdaCore                     --
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
with System.Machine_Code; use System.Machine_Code;

with SAM_SVD.QSPI; use SAM_SVD.QSPI;

package body SAM.QSPI is

   QSPI_Region : constant := 16#04000000#;

   Empty : UInt8_Array (1 .. 0);

   ------------
   -- Enable --
   ------------

   procedure Enable is
   begin
      QSPI_Periph.CTRLA.ENABLE := True;
   end Enable;

   -----------
   -- Reset --
   -----------

   procedure Reset is
   begin
      QSPI_Periph.CTRLA.SWRST := True;
   end Reset;

   ---------------
   -- Configure --
   ---------------

   procedure Configure (Baud : UInt8) is
   begin
      QSPI_Periph.BAUD.BAUD := Baud;

      QSPI_Periph.CTRLB.MODE := MEMORY;
      QSPI_Periph.CTRLB.DATALEN := Val_8BITS;
      QSPI_Periph.CTRLB.CSMODE := LASTXFER;
   end Configure;

   ---------
   -- Run --
   ---------

   procedure Run (Command : UInt8) is
      Iframe : QSPI_INSTRFRAME_Register := (others => <>);
   begin
      Iframe.WIDTH := SINGLE_BIT_SPI;
      Iframe.ADDRLEN := Val_24BITS;
      Iframe.TFRTYPE := READ;
      Iframe.INSTREN := True;

      Run_Instruction (Command, Iframe, 0, Empty);
   end Run;

   ----------
   -- Read --
   ----------

   procedure Read (Command : UInt8; Data : out UInt8_Array) is
      Iframe : QSPI_INSTRFRAME_Register := (others => <>);
   begin
      Iframe.WIDTH := SINGLE_BIT_SPI;
      Iframe.ADDRLEN := Val_24BITS;
      Iframe.TFRTYPE := READ;
      Iframe.DATAEN := True;
      Iframe.INSTREN := True;

      Run_Instruction (Command, Iframe, 0, Data);
   end Read;

   -----------
   -- Write --
   -----------

   procedure Write (Command : UInt8; Data : in out UInt8_Array) is
      Iframe : QSPI_INSTRFRAME_Register := (others => <>);
   begin
      Iframe.WIDTH := SINGLE_BIT_SPI;
      Iframe.ADDRLEN := Val_24BITS;
      Iframe.TFRTYPE := WRITE;
      Iframe.DATAEN := Data'Length /= 0;
      Iframe.INSTREN := True;

      Run_Instruction (Command, Iframe, 0, Data);
   end Write;

   -----------
   -- Erase --
   -----------

   procedure Erase (Command : UInt8; Addr : UInt32) is
      Iframe : QSPI_INSTRFRAME_Register := (others => <>);
   begin
      Iframe.WIDTH := SINGLE_BIT_SPI;
      Iframe.ADDRLEN := Val_24BITS;
      Iframe.TFRTYPE := WRITE;
      Iframe.ADDREN := True;
      Iframe.INSTREN := True;

      Run_Instruction (Command, Iframe, Addr, Empty);
   end Erase;

   -----------------
   -- Read_Memory --
   -----------------

   procedure Read_Memory (Addr : UInt32; Data : out UInt8_Array) is
      Iframe : QSPI_INSTRFRAME_Register := (others => <>);
   begin
      Iframe.WIDTH := QUAD_OUTPUT;
      Iframe.ADDRLEN := Val_24BITS;
      Iframe.TFRTYPE := READMEMORY;
      Iframe.ADDREN := True;
      Iframe.DATAEN := True;
      Iframe.INSTREN := True;
      Iframe.DUMMYLEN := 8;

      Run_Instruction (16#6B#, Iframe, Addr, Data);
   end Read_Memory;

   ------------------
   -- Write_Memory --
   ------------------

   procedure Write_Memory (Addr : UInt32; Data : in out UInt8_Array) is
      Iframe : QSPI_INSTRFRAME_Register := (others => <>);
   begin
      Iframe.WIDTH := QUAD_OUTPUT;
      Iframe.ADDRLEN := Val_24BITS;
      Iframe.TFRTYPE := WRITEMEMORY;
      Iframe.ADDREN := True;
      Iframe.DATAEN := True;
      Iframe.INSTREN := True;

      Run_Instruction (16#32#, Iframe, Addr, Data);
   end Write_Memory;

   ---------------------
   -- Run_Instruction --
   ---------------------

   procedure Run_Instruction
     (Command : UInt8;
      Iframe  : SAM_SVD.QSPI.QSPI_INSTRFRAME_Register;
      Addr    : UInt32;
      Buffer  : in out UInt8_Array)
   is
      Unused  : QSPI_INSTRFRAME_Register;
   begin

      --  WTF?!?
      --  if Command in 16#20# | 16#D8# then
      --     QSPI_Periph.INSTRADDR := Addr;
      --  end if;

      QSPI_Periph.INSTRCTRL.INSTR := Command;
      QSPI_Periph.INSTRADDR := Addr;
      QSPI_Periph.INSTRFRAME := Iframe;

      --  Dummy read of INSTRFRAME needed to synchronize.
      --  See Instruction Transmission Flow Diagram, figure 37.9, page 995
      --  and Example 4, page 998, section 37.6.8.5.
      Unused := QSPI_Periph.INSTRFRAME;


      if Buffer'Length /= 0 then
         declare
            Mem : UInt8_Array (Buffer'First .. Buffer'Last)
              with Address => System'To_Address (QSPI_Region + Addr);
         begin
            case Iframe.TFRTYPE is
               when READ | READMEMORY =>
                  Buffer := Mem;
               when WRITE | WRITEMEMORY =>
                  Mem := Buffer;
            end case;
         end;
      end if;

      Asm ("dsb" & ASCII.LF & ASCII.HT &
           "isb",
           Volatile => True);

      QSPI_Periph.CTRLA := (SWRST  => False, ENABLE => True, LASTXFER => True,
                            others => <>);

      while not QSPI_Periph.INTFLAG.INSTREND loop
         null;
      end loop;

      QSPI_Periph.INTFLAG.INSTREND := True;

   end Run_Instruction;

end SAM.QSPI;
