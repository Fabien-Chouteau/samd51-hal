pragma Style_Checks (Off);

--  This spec has been automatically generated from ATSAMD51G19A.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package SAM_SVD.AES is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  AES Modes of operation
   type CTRLA_AESMODESelect is
     (--  Electronic code book mode
      ECB,
      --  Cipher block chaining mode
      CBC,
      --  Output feedback mode
      OFB,
      --  Cipher feedback mode
      CFB,
      --  Counter mode
      COUNTER,
      --  CCM mode
      CCM,
      --  Galois counter mode
      GCM)
     with Size => 3;
   for CTRLA_AESMODESelect use
     (ECB => 0,
      CBC => 1,
      OFB => 2,
      CFB => 3,
      COUNTER => 4,
      CCM => 5,
      GCM => 6);

   --  Cipher Feedback Block Size
   type CTRLA_CFBSSelect is
     (--  128-bit Input data block for Encryption/Decryption in Cipher Feedback mode
      Val_128BIT,
      --  64-bit Input data block for Encryption/Decryption in Cipher Feedback mode
      Val_64BIT,
      --  32-bit Input data block for Encryption/Decryption in Cipher Feedback mode
      Val_32BIT,
      --  16-bit Input data block for Encryption/Decryption in Cipher Feedback mode
      Val_16BIT,
      --  8-bit Input data block for Encryption/Decryption in Cipher Feedback mode
      Val_8BIT)
     with Size => 3;
   for CTRLA_CFBSSelect use
     (Val_128BIT => 0,
      Val_64BIT => 1,
      Val_32BIT => 2,
      Val_16BIT => 3,
      Val_8BIT => 4);

   --  Encryption Key Size
   type CTRLA_KEYSIZESelect is
     (--  128-bit Key for Encryption / Decryption
      Val_128BIT,
      --  192-bit Key for Encryption / Decryption
      Val_192BIT,
      --  256-bit Key for Encryption / Decryption
      Val_256BIT)
     with Size => 2;
   for CTRLA_KEYSIZESelect use
     (Val_128BIT => 0,
      Val_192BIT => 1,
      Val_256BIT => 2);

   --  Cipher Mode
   type CTRLA_CIPHERSelect is
     (--  Decryption
      DEC,
      --  Encryption
      ENC)
     with Size => 1;
   for CTRLA_CIPHERSelect use
     (DEC => 0,
      ENC => 1);

   --  Start Mode Select
   type CTRLA_STARTMODESelect is
     (--  Start Encryption / Decryption in Manual mode
      MANUAL,
      --  Start Encryption / Decryption in Auto mode
      AUTO)
     with Size => 1;
   for CTRLA_STARTMODESelect use
     (MANUAL => 0,
      AUTO => 1);

   --  Last Output Data Mode
   type CTRLA_LODSelect is
     (--  No effect
      NONE,
      --  Start encryption in Last Output Data mode
      LAST)
     with Size => 1;
   for CTRLA_LODSelect use
     (NONE => 0,
      LAST => 1);

   --  Last Key Generation
   type CTRLA_KEYGENSelect is
     (--  No effect
      NONE,
      --  Start Computation of the last NK words of the expanded key
      LAST)
     with Size => 1;
   for CTRLA_KEYGENSelect use
     (NONE => 0,
      LAST => 1);

   --  XOR Key Operation
   type CTRLA_XORKEYSelect is
     (--  No effect
      NONE,
      --  The user keyword gets XORed with the previous keyword register content.
      XOR_k)
     with Size => 1;
   for CTRLA_XORKEYSelect use
     (NONE => 0,
      XOR_k => 1);

   subtype AES_CTRLA_CTYPE_Field is HAL.UInt4;

   --  Control A
   type AES_CTRLA_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  AES Modes of operation
      AESMODE        : CTRLA_AESMODESelect := SAM_SVD.AES.ECB;
      --  Cipher Feedback Block Size
      CFBS           : CTRLA_CFBSSelect := SAM_SVD.AES.Val_128BIT;
      --  Encryption Key Size
      KEYSIZE        : CTRLA_KEYSIZESelect := SAM_SVD.AES.Val_128BIT;
      --  Cipher Mode
      CIPHER         : CTRLA_CIPHERSelect := SAM_SVD.AES.DEC;
      --  Start Mode Select
      STARTMODE      : CTRLA_STARTMODESelect := SAM_SVD.AES.MANUAL;
      --  Last Output Data Mode
      LOD            : CTRLA_LODSelect := SAM_SVD.AES.NONE;
      --  Last Key Generation
      KEYGEN         : CTRLA_KEYGENSelect := SAM_SVD.AES.NONE;
      --  XOR Key Operation
      XORKEY         : CTRLA_XORKEYSelect := SAM_SVD.AES.NONE;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Counter Measure Type
      CTYPE          : AES_CTRLA_CTYPE_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AES_CTRLA_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      AESMODE        at 0 range 2 .. 4;
      CFBS           at 0 range 5 .. 7;
      KEYSIZE        at 0 range 8 .. 9;
      CIPHER         at 0 range 10 .. 10;
      STARTMODE      at 0 range 11 .. 11;
      LOD            at 0 range 12 .. 12;
      KEYGEN         at 0 range 13 .. 13;
      XORKEY         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      CTYPE          at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Control B
   type AES_CTRLB_Register is record
      --  Start Encryption/Decryption
      START        : Boolean := False;
      --  New message
      NEWMSG       : Boolean := False;
      --  End of message
      EOM          : Boolean := False;
      --  GF Multiplication
      GFMUL        : Boolean := False;
      --  unspecified
      Reserved_4_7 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AES_CTRLB_Register use record
      START        at 0 range 0 .. 0;
      NEWMSG       at 0 range 1 .. 1;
      EOM          at 0 range 2 .. 2;
      GFMUL        at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Interrupt Enable Clear
   type AES_INTENCLR_Register is record
      --  Encryption Complete Interrupt Enable
      ENCCMP       : Boolean := False;
      --  GF Multiplication Complete Interrupt Enable
      GFMCMP       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AES_INTENCLR_Register use record
      ENCCMP       at 0 range 0 .. 0;
      GFMCMP       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Interrupt Enable Set
   type AES_INTENSET_Register is record
      --  Encryption Complete Interrupt Enable
      ENCCMP       : Boolean := False;
      --  GF Multiplication Complete Interrupt Enable
      GFMCMP       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AES_INTENSET_Register use record
      ENCCMP       at 0 range 0 .. 0;
      GFMCMP       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Interrupt Flag Status
   type AES_INTFLAG_Register is record
      --  Encryption Complete
      ENCCMP       : Boolean := False;
      --  GF Multiplication Complete
      GFMCMP       : Boolean := False;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AES_INTFLAG_Register use record
      ENCCMP       at 0 range 0 .. 0;
      GFMCMP       at 0 range 1 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   subtype AES_DATABUFPTR_INDATAPTR_Field is HAL.UInt2;

   --  Data buffer pointer
   type AES_DATABUFPTR_Register is record
      --  Input Data Pointer
      INDATAPTR    : AES_DATABUFPTR_INDATAPTR_Field := 16#0#;
      --  unspecified
      Reserved_2_7 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AES_DATABUFPTR_Register use record
      INDATAPTR    at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  Debug control
   type AES_DBGCTRL_Register is record
      --  Debug Run
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for AES_DBGCTRL_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Keyword n

   --  Keyword n
   type AES_KEYWORD_Registers is array (0 .. 7) of HAL.UInt32;

   --  Initialisation Vector n

   --  Initialisation Vector n
   type AES_INTVECTV_Registers is array (0 .. 3) of HAL.UInt32;

   --  Hash key n

   --  Hash key n
   type AES_HASHKEY_Registers is array (0 .. 3) of HAL.UInt32;

   --  Galois Hash n

   --  Galois Hash n
   type AES_GHASH_Registers is array (0 .. 3) of HAL.UInt32;

   -----------------
   -- Peripherals --
   -----------------

   --  Advanced Encryption Standard
   type AES_Peripheral is record
      --  Control A
      CTRLA      : aliased AES_CTRLA_Register;
      --  Control B
      CTRLB      : aliased AES_CTRLB_Register;
      --  Interrupt Enable Clear
      INTENCLR   : aliased AES_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET   : aliased AES_INTENSET_Register;
      --  Interrupt Flag Status
      INTFLAG    : aliased AES_INTFLAG_Register;
      --  Data buffer pointer
      DATABUFPTR : aliased AES_DATABUFPTR_Register;
      --  Debug control
      DBGCTRL    : aliased AES_DBGCTRL_Register;
      --  Keyword n
      KEYWORD    : aliased AES_KEYWORD_Registers;
      --  Indata
      INDATA     : aliased HAL.UInt32;
      --  Initialisation Vector n
      INTVECTV   : aliased AES_INTVECTV_Registers;
      --  Hash key n
      HASHKEY    : aliased AES_HASHKEY_Registers;
      --  Galois Hash n
      GHASH      : aliased AES_GHASH_Registers;
      --  Cipher Length
      CIPLEN     : aliased HAL.UInt32;
      --  Random Seed
      RANDSEED   : aliased HAL.UInt32;
   end record
     with Volatile;

   for AES_Peripheral use record
      CTRLA      at 16#0# range 0 .. 31;
      CTRLB      at 16#4# range 0 .. 7;
      INTENCLR   at 16#5# range 0 .. 7;
      INTENSET   at 16#6# range 0 .. 7;
      INTFLAG    at 16#7# range 0 .. 7;
      DATABUFPTR at 16#8# range 0 .. 7;
      DBGCTRL    at 16#9# range 0 .. 7;
      KEYWORD    at 16#C# range 0 .. 255;
      INDATA     at 16#38# range 0 .. 31;
      INTVECTV   at 16#3C# range 0 .. 127;
      HASHKEY    at 16#5C# range 0 .. 127;
      GHASH      at 16#6C# range 0 .. 127;
      CIPLEN     at 16#80# range 0 .. 31;
      RANDSEED   at 16#84# range 0 .. 31;
   end record;

   --  Advanced Encryption Standard
   AES_Periph : aliased AES_Peripheral
     with Import, Address => AES_Base;

end SAM_SVD.AES;
