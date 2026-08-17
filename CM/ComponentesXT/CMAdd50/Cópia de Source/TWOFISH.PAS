{*******************************************************************************
* Unit      : TTwofish                                                         *
********************************************************************************
* Purpose   : Encapulates the twofish cipher with various cipher modes         *
********************************************************************************
* Copyright : This component is copyright TSM Inc. 1999                        *
*             This source code may not be distributed to third parties in      *
*             or in part without the written permission of TSM Inc.            *
*             All rights reserved. Liability limited to replacement of         *
*             this original source code in the case of loss or damage because  *
*             the use or misuse of this software.                              *
*             Portions copyright Dave Barton  1998                             *
********************************************************************************
* Version   : 18.12.98  - 1.00  Original component                             *
*             16.01.99  - 1.14  Error in En- & Decrypt file/ stream resolved   *
*             26.03.99  - 1.14a Init error in "InitialiseString" fixed         *
*             10.10.99  - 1.15  Delphi5 update/CB4 update                      *
********************************************************************************
* Switches  : COMPONENT  - Compiles as a VCL component (otherwise unit)        *
*             COMMANDLINE- Allows override of mode from command line compiler  *
*******************************************************************************}


{$define UNLIMITED}

{$R-} {$A-} {$Q-}
{$ifndef COMMANDLINE}    // Commanline overrides the follwing presets
     {$define COMPONENT}      //(COMPONENT, OBJECT)
{$endif}

// this allows compatibility with the D5 compiler
{$ifdef VER130}
     {$define VER120}
{$endif}

// this allows compatibility with the C++B4 compiler
{$ifdef VER125}
     {$define VER120}
{$endif}


  {**************************************************************************
  ************ This section of code implements the 64 bit limit *************
  ************ imposed by the Wassennar agreement. The key is   *************
  ************ limited to 64 bits. Should you be in a country   *************
  ************ where the Wassennar agreement is not in force,   *************
  ************ undefine the WASSENAAR_LIMITED variable.         *************
  **************************************************************************}
{$define UNLIMITED}          // WASSENAAR_LIMITED, UNLIMITED

unit Twofish;

interface

uses
     Classes, SysUtils;

const
     {general constants}
     BLOCKSIZE= 16;
     NUMROUNDS= 16;
     BUFFERSIZE = 4096;    // the buffer for file encryption

     {Twofish specific constants}
     INPUTWHITEN= 0;
     OUTPUTWHITEN= (BLOCKSIZE div 4);
     ROUNDSUBKEYS= (OUTPUTWHITEN + BLOCKSIZE div 4);
     TOTALSUBKEYS= (ROUNDSUBKEYS + NUMROUNDS * 2);

{*******************************************************************************
* Type      : EKeyError                                                        *
********************************************************************************
* Purpose   : Exception raised when key setup incomplete for a given mode      *
*******************************************************************************}
type EKeyError = class(Exception);

{*******************************************************************************
* Type      : EFileError                                                       *
********************************************************************************
* Purpose   : Exception raised when file manipulation creates an error         *
*******************************************************************************}
type EFileError = class(Exception);

{*******************************************************************************
* Type      : EInputError                                                      *
********************************************************************************
* Purpose   : Exception raised when the input string for decryptstring suspect *
*******************************************************************************}
type EInputError = class(Exception);

type
{$ifdef VER120}
     dword= LongWord;
{$else}
     dword= LongInt;
{$endif}

{*******************************************************************************
* Type      : TCiphermode                                                      *
********************************************************************************
* Purpose   : Defines possible modes for Twofish                               *
*******************************************************************************}
type TCipherMode = (ECB, CBC, CFB, OFB);

{*******************************************************************************
* Type      : TStringMode                                                      *
********************************************************************************
* Purpose   : Defines possible string modes for the En/Decrypt string          *
*******************************************************************************}
type TStringMode = (smEncode, smNormal);

{*******************************************************************************
* Type      : TKeySize                                                         *
********************************************************************************
* Purpose   : Defines possible sizes of the key for Twofish                    *
*******************************************************************************}
type TKeySize = (Small128, Med192, Large256);

{*******************************************************************************
* Type      : DoublWord                                                        *
********************************************************************************
* Purpose   : Defines the 32 bit half data block with various views            *
*******************************************************************************}
type TQuadWord = record
     case Integer Of
          {$ifdef VER120}
          0: (w: array[0..3] of LongWord);
          {$else}
          0: (w: array[0..3] of LongInt);
          {$endif}
          1: (b: array[0..15] of Byte);
 end;{DoublWord}

{*******************************************************************************
* Type      : PDoublWord                                                       *
********************************************************************************
* Purpose   : Pointer to the DoublWord type                                    *
*******************************************************************************}
type PQuadWord = ^TQuadWord;

{*******************************************************************************
* Type      : TBlock                                                           *
********************************************************************************
* Purpose   : Defines the basic element of enc/decryption                      *
*******************************************************************************}
type TBlock = array[0..(BLOCKSIZE-1)] of Byte;

{*******************************************************************************
* Type      : PBlock                                                           *
********************************************************************************
* Purpose   : Pointer to the type TBlock                                       *
*******************************************************************************}
type PBlock  = ^TBlock;

{*******************************************************************************
* Type      : T2F_ctx                                                          *
********************************************************************************
* Purpose   : Defines context variable for Twofish                             *
*******************************************************************************}
type T2F_ctx = record
     KeyInit:       Boolean;  // Shows if the password has been initialised
     IVInit:        Boolean;  // Shows if the IV has been initialised
     IV:            TBlock;   // The Initialisation Vector
     ct:            TBlock;   // temporary buffer used in CBC, CFB and OFB modes
     KeyLen:        DWord;
     SubKeys:       array[0..TOTALSUBKEYS-1] of DWord;
     sboxKeys:      array[0..3]              of DWord;
     sbox:          array[0..3,0..255]       of DWord;
     case Integer of          // Encryption/decryption block buffer
          0: (ByteBuffer: TBlock);
          1: (LongBuffer: array[0..3] of LongInt);
end;

const
     {Twofish specific constants}
     // replaced 1.14b speedup - BLU: array[0..3] of DWord= (0, 8, 16, 24);
     RS_GF_FDBK= $14d;
     SK_STEP= $02020202;
     SK_BUMP= $01010101;
     SK_ROTL= 9;
     P_00=           1;
     P_01=           0;
     P_02=           0;
     P_03=           (P_01 xor 1);
     P_04=           1;
     P_10=           0;
     P_11=           0;
     P_12=           1;
     P_13=           (P_11 xor 1);
     P_14=           0;
     P_20=           1;
     P_21=           1;
     P_22=           0;
     P_23=           (P_21 xor 1);
     P_24=           0;
     P_30=           0;
     P_31=           1;
     P_32=           1;
     P_33=           (P_31 xor 1);
     P_34=           1;
     MDS_GF_FDBK= $169;

{*******************************************************************************
* Type      : TTwofish                                                         *
********************************************************************************
* Purpose   : Defines Twofish                                                  *
*******************************************************************************}
{$ifdef COMPONENT}
type TTwofish = class(TComponent)
{$else}
type TTwofish = class(TObject)
{$endif}
  private
     ctx:          T2F_ctx;
     FCipherMode:  TCipherMode;
     FKeySize:     TKeySize;

     // buffer for larger encryptions
     FBuffer:      array[0..BUFFERSIZE+BLOCKSIZE] of BYTE; {Local Copy of Data}
     PtrBuffer:    PBlock;
     FStringMode:  TStringMode;

     // these routines link to the core block routines of the algorithm
     procedure     Twofish_Core_Key_setup(const Key: array of Byte; const KeyLength: integer);
     procedure     Twofish_Core_Block_Decrypt(const ct: TQuadWord; var pt: TQuadWord);
     procedure     Twofish_Core_Block_Encrypt(const pt: TQuadWord; var ct: TQuadWord);

     // Internal encryption primitives
     procedure     EncryptBuffer(const Len: integer);
     procedure     DecryptBuffer(const Len: integer);
     procedure     EncryptBlockMode;
     procedure     DecryptBlockMode;
     procedure     EndianEncBlock;
     procedure     EndianDecBlock;

     // Base64 functions
     function      EncodeString(InputString: string): string;
     function      DecodeString(InputString: string): string;

     // Implemnetation primitives
     procedure     CheckKeys;
  public
     // these calls are used to load the key and the IV
     procedure     InitialiseString(const Key: string);
     procedure     InitialiseByte(const Key: array of byte; Keylength: integer);
     procedure     LoadIVString(const IVString: string);
     procedure     LoadIVByte(const IVByte: array of Byte; IVLength: integer);

     // These calls perform the operation using the mode specified in CipherMode
     procedure     EncBlock(const Input: TBlock; var Output: TBlock);
     procedure     DecBlock(const Input: TBlock; var Output: TBlock);
     procedure     EncFile(const InputFileName: string; OutputFileName: string);
     procedure     DecFile(const InputFileName: string; OutputFileName: string);
     procedure     EncStream(const Input: TStream; const Output: TStream);
     procedure     DecStream(const Input: TStream; const Output: TStream);
     procedure     EncString(const Input: string; var Output: string);
     procedure     DecString(const Input: string; var Output: string);

     // this returns the CBC-MAC of the data put through Twofish
     procedure     CBCMACBlock(var MAC:TBlock);
     procedure     CBCMACString(var MAC: string);

     // Burn clears any sensitive information
     procedure     Burn;

     // returns the version of the component
     function       GetVersion:  string;

  {$ifdef COMPONENT}
  published
     property       CipherMode:   TCipherMode read FCipherMode write FCipherMode;
     property       KeySize:      TKeySize    read FKeySize    write FKeySize;
     property       StringMode:   TStringMode read FStringMode write FStringMode;
  {$else}
     procedure      SetCipherMode(const Value: TCipherMode);
     function       GetCipherMode: TCipherMode;
     procedure      SetStringMode(const Value: TStringMode);
     function       GetStringMode: TStringMode;
     procedure      SetKeySize(const Value: TKeySize);
     function       GetKeySize: TKeySize;
  {$endif}
end;

function      LRot32(X: dword; c: integer): dword; assembler
function      RRot32(X: dword; c: integer): dword; assembler;

implementation

uses Windows, Dialogs;

const
     RELVER                  = '1.15';
     LIT_COMPNAME            = 'Twofish';
     LIT_KEY_NOT_SET         = LIT_COMPNAME + ': Key not set';
     LIT_IV_NOT_SET          = LIT_COMPNAME + ': IV not set';
     LIT_KEY_LENGTH          = LIT_COMPNAME + ': Key must be between 1 and 156 bytes';
     LIT_INFILE_NOT_FOUND    = LIT_COMPNAME + ': Input file not found';
     LIT_CBC_NOT_SET         = LIT_COMPNAME + ': Mode must be CBC for CBCMAC';
     LIT_OUTFILE_OPEN_ERROR  = LIT_COMPNAME + ': Could not open output file';
     LIT_OUTFILE_WRITE_ERROR = LIT_COMPNAME + ': Error writing output file';
     LIT_INPUT_LENGTH        = LIT_COMPNAME + ': Input not valid - too short';
     LIT_BASE64CNV           = LIT_COMPNAME + ': Error converting from Base64 - invalid character';

    p8x8: array[0..1,0..255] of byte= ((
    $a9, $67, $b3, $e8, $04, $fd, $a3, $76,
    $9a, $92, $80, $78, $e4, $dd, $d1, $38,
    $0d, $c6, $35, $98, $18, $f7, $ec, $6c,
    $43, $75, $37, $26, $fa, $13, $94, $48,
    $f2, $d0, $8b, $30, $84, $54, $df, $23,
    $19, $5b, $3d, $59, $f3, $ae, $a2, $82,
    $63, $01, $83, $2e, $d9, $51, $9b, $7c,
    $a6, $eb, $a5, $be, $16, $0c, $e3, $61,
    $c0, $8c, $3a, $f5, $73, $2c, $25, $0b,
    $bb, $4e, $89, $6b, $53, $6a, $b4, $f1,
    $e1, $e6, $bd, $45, $e2, $f4, $b6, $66,
    $cc, $95, $03, $56, $d4, $1c, $1e, $d7,
    $fb, $c3, $8e, $b5, $e9, $cf, $bf, $ba,
    $ea, $77, $39, $af, $33, $c9, $62, $71,
    $81, $79, $09, $ad, $24, $cd, $f9, $d8,
    $e5, $c5, $b9, $4d, $44, $08, $86, $e7,
    $a1, $1d, $aa, $ed, $06, $70, $b2, $d2,
    $41, $7b, $a0, $11, $31, $c2, $27, $90,
    $20, $f6, $60, $ff, $96, $5c, $b1, $ab,
    $9e, $9c, $52, $1b, $5f, $93, $0a, $ef,
    $91, $85, $49, $ee, $2d, $4f, $8f, $3b,
    $47, $87, $6d, $46, $d6, $3e, $69, $64,
    $2a, $ce, $cb, $2f, $fc, $97, $05, $7a,
    $ac, $7f, $d5, $1a, $4b, $0e, $a7, $5a,
    $28, $14, $3f, $29, $88, $3c, $4c, $02,
    $b8, $da, $b0, $17, $55, $1f, $8a, $7d,
    $57, $c7, $8d, $74, $b7, $c4, $9f, $72,
    $7e, $15, $22, $12, $58, $07, $99, $34,
    $6e, $50, $de, $68, $65, $bc, $db, $f8,
    $c8, $a8, $2b, $40, $dc, $fe, $32, $a4,
    $ca, $10, $21, $f0, $d3, $5d, $0f, $00,
    $6f, $9d, $36, $42, $4a, $5e, $c1, $e0),(
    $75, $f3, $c6, $f4, $db, $7b, $fb, $c8,
    $4a, $d3, $e6, $6b, $45, $7d, $e8, $4b,
    $d6, $32, $d8, $fd, $37, $71, $f1, $e1,
    $30, $0f, $f8, $1b, $87, $fa, $06, $3f,
    $5e, $ba, $ae, $5b, $8a, $00, $bc, $9d,
    $6d, $c1, $b1, $0e, $80, $5d, $d2, $d5,
    $a0, $84, $07, $14, $b5, $90, $2c, $a3,
    $b2, $73, $4c, $54, $92, $74, $36, $51,
    $38, $b0, $bd, $5a, $fc, $60, $62, $96,
    $6c, $42, $f7, $10, $7c, $28, $27, $8c,
    $13, $95, $9c, $c7, $24, $46, $3b, $70,
    $ca, $e3, $85, $cb, $11, $d0, $93, $b8,
    $a6, $83, $20, $ff, $9f, $77, $c3, $cc,
    $03, $6f, $08, $bf, $40, $e7, $2b, $e2,
    $79, $0c, $aa, $82, $41, $3a, $ea, $b9,
    $e4, $9a, $a4, $97, $7e, $da, $7a, $17,
    $66, $94, $a1, $1d, $3d, $f0, $de, $b3,
    $0b, $72, $a7, $1c, $ef, $d1, $53, $3e,
    $8f, $33, $26, $5f, $ec, $76, $2a, $49,
    $81, $88, $ee, $21, $c4, $1a, $eb, $d9,
    $c5, $39, $99, $cd, $ad, $31, $8b, $01,
    $18, $23, $dd, $1f, $4e, $2d, $f9, $48,
    $4f, $f2, $65, $8e, $78, $5c, $58, $19,
    $8d, $e5, $98, $57, $67, $7f, $05, $64,
    $af, $63, $b6, $fe, $f5, $b7, $3c, $a5,
    $ce, $e9, $68, $44, $e0, $4d, $43, $69,
    $29, $2e, $ac, $15, $59, $a8, $0a, $9e,
    $6e, $47, $df, $34, $35, $6a, $cf, $dc,
    $22, $c9, $c0, $9b, $89, $d4, $ed, $ab,
    $12, $a2, $0d, $52, $bb, $02, $2f, $a9,
    $d7, $61, $1e, $b4, $50, $04, $f6, $c2,
    $16, $25, $86, $56, $55, $09, $be, $91));

type
  PDWord= ^DWord;
  PDWordArray= ^TDWordArray;
  TDWordArray= array[0..1023] of DWord;

var
  MDS: array[0..3,0..255] of DWord;

{*******************************************************************************
* Table     : BinToAsc                                                         *
********************************************************************************
* Purpose   : The encode table used by Base64 encoding                         *
*******************************************************************************}
     BinToAsc : Array [0..63] of Char =
          ('+', '-','0','1','2','3','4','5','6','7',
           '8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
           'P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d',
           'e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
           't','u','v','w','x','y','z');


{*******************************************************************************
* Procedure : EncodeString                                                     *
********************************************************************************
* Purpose   : Encodes the binary string into a base64 representation to avoid  *
*             problems with nulls in the encoded string                        *
********************************************************************************
* Paramters : Input - the string to be encoded                                 *
********************************************************************************
* Returns   : the encoded string                                               *
*******************************************************************************}
function TTwofish.EncodeString(InputString: string): string;
var
     Counter:      integer;
     ReturnString: string;
     b:            Byte;
     i:            integer;
     last:         byte;
     Flush:        Boolean;
     LengthInput:  integer;
begin
     Counter := 0;
     ReturnString := '';
     Flush := False;
     last := 0;

     // deal with flushing the partial byte at the end of the string
     if (Length(InputString) mod 3) <> 0 then
     begin
          InputString := InputString + Chr(0);
          // flush controls the last byte mod 3
          Flush := True;
     end; {if}

     LengthInput := Length(InputString);
     i := 1;
     while (i <= LengthInput) do
     begin
          if i <= LengthInput then
          begin
               b := Ord(InputString[i]);
          end
          else
          begin
               b := 0;
          end; {if}

          case Counter of
          0:
               begin
                    ReturnString := ReturnString + BinToAsc[(b shr 2)];
                    last := b;
               end;
          1:
               begin
                    ReturnString := ReturnString + BinToAsc[((last and $3) shl 4) or ((b and $F0) shr 4) ];
                    last := b;
               end;
          2:
               begin
                    ReturnString := ReturnString + BinToAsc[((last and $F) shl 2) or ((b and $C0) shr 6)];
                    if not (Flush and (i = LengthInput)) then
                    begin
                         ReturnString := ReturnString + BinToAsc[(b and $3F)];
                    end;
                    last := 0;
               end;
          end; {case}

          Inc(Counter);
          if Counter = 3 then
          begin
               Counter := 0;
          end;

          Inc(i);
     end; {while}

     Result := ReturnString;
end; {EncodeString}

{*******************************************************************************
* Procedure : DecodeString                                                     *
********************************************************************************
* Purpose   : Decodes the binary string into a base64 representation to avoid  *
*             problems with nulls in the encoded string                        *
********************************************************************************
* Paramters : Input - the string to be decoded                                 *
********************************************************************************
* Returns   : the decoded string                                               *
*******************************************************************************}
function TTwofish.DecodeString(InputString: string): string;
     function  DecodeBase64(b: byte): byte;
     {*******************************************************************************
     * Procedure : DecodeBase64                                                     *
     ********************************************************************************
     * Purpose   : Decodes a byte from the Base64 string                            *
     ********************************************************************************
     * Paramters : b - the byte to be decoded                                       *
     ********************************************************************************
     * Returns   : the decoded byte                                                 *
     *******************************************************************************}
     begin
          if (b >= Ord('0')) and (b <= Ord('9')) then
          begin
               Result := b - Ord('0') + 2;
               Exit;
          end;
          if (b >= Ord('A')) and (b <= Ord('Z')) then
          begin
               Result := b - Ord('A') + 12;
               Exit;
          end;
          if (b >= Ord('a')) and (b <= Ord('z')) then
          begin
               Result := b - Ord('a') + 38;
               Exit;
          end;
          if b = Ord('+') then
          begin
               Result := 0;
               Exit;
          end;
          if b = Ord('-') then
          begin
               Result := 1;
               Exit;
          end;
          // Default result - should never get here
          Result := 0;
     end; {DecodeBase64}
var
     Counter:      integer;
     ReturnString: string;
     c:            Char;
     last:         byte;
     this:         byte;
     i:            integer;
begin
     Counter := 0;
     ReturnString := '';
     last := 0;

     for i := 1 to Length(InputString) do
     begin
          c := InputString[i];
          case Counter of
          0:
               begin
                    last := DecodeBase64(Ord(c)) shl 2;
               end;
          1:
               begin
                    this := DecodeBase64(Ord(c));
                    ReturnString := ReturnString + Chr((last or (this shr 4)) and $ff);
                    last := this shl 4;
               end;
          2:
               begin
                    this := DecodeBase64(Ord(c));
                    ReturnString := ReturnString + Chr((last or (this shr 2)) and $ff);
                    last := this shl 6;
               end;
          3:
               begin
                    this := DecodeBase64(Ord(c));
                    ReturnString := ReturnString + Chr((last or this) and $ff);
                    last := 0;
               end;
          end; {case}

          Inc(Counter);
          if Counter = 4 then
          begin
               Counter := 0;
          end; {if}
     end; {for}

     Result := ReturnString;
end; {DecodeString}

{*******************************************************************************
* Procedure : GetVersion                                                       *
********************************************************************************
* Purpose   : Returns the internal version number of the component             *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : String - the version number expressed as a string                *
*******************************************************************************}
function TTwofish.GetVersion;
begin
     // return the version string
     Result := LIT_COMPNAME + ' ' + RELVER;

     {$ifdef REGISTERED}
     Result := Result + ' Registered';
     {$endif}
     {$ifdef NOTREGISTERED}
     Result := Result + ' Unregistered';
     {$endif}
     {$ifdef FREEWARE}
     Result := Result + ' Freeware';
     {$endif}
end; {GetVersion}

{*******************************************************************************
* Procedure : InitialiseString                                                 *
********************************************************************************
* Purpose   : Loads the passphrase into the context block                      *
********************************************************************************
* Paramters : 'Key' - the string which holds the key                           *
********************************************************************************
* Returns   : 'OK' if the operation was a success, otherwise an error code     *
*******************************************************************************}
procedure TTwofish.InitialiseString(const Key: string);
var
     KeyArray: array[0..155] of Byte;
begin
     // check for incorrect length keys
     if (Length(Key) < 1) or (Length(Key) > 156) then
     begin
          // we should not use zero length keys
          // catch the error and return with error code
          raise EKeyError.Create(LIT_KEY_LENGTH);
          Exit;
     end; {if Length(Key)}

     // clear the context
     FillChar(ctx.ct, Sizeof(ctx.ct), #0);
     FillChar(ctx.ByteBuffer, Sizeof(ctx.ByteBuffer), #0);
     FillChar(KeyArray, Sizeof(KeyArray), #0);

     {**************************************************************************
     ************ This section of code implements the 64 bit limit *************
     ************ imposed by the Wassennar agreement. The key is   *************
     ************ limited to 64 bits. Should you be in a country   *************
     ************ where the Wassennar agreement is not in force,   *************
     ************ undefine the WASSENAAR_LIMITED variable.         *************
     **************************************************************************}

     {$ifdef WASSENAAR_LIMITED}
     // turn the key string into a key array
     for i := 1 to Length(Key) do
     begin
          KeyArray[(i-1) mod 8] := KeyArray[(i-1) mod 8] xor Ord(Key[i]);
     end; {for}
     {$else}
     Move(Key[1], KeyArray, Length(Key));
     {$endif}

     // and perform the initialisation with the concatenated string
     Twofish_Core_Key_Setup(KeyArray, Length(Key));

     // mark the context as initialised
     ctx.KeyInit := True;
end; {InitialiseString}

{*******************************************************************************
* Procedure : InitialiseByte                                                   *
********************************************************************************
* Purpose   : Loads the passphrase into the context block                      *
********************************************************************************
* Paramters : 'Key' - array of bytes which holds the key                       *
*             'KeyLength' - the number of bytes in the array which are to be   *
*             read to load the key - need not be the same as the length of the *
*             array                                                            *
********************************************************************************
* Returns   : 'OK' if the operation was a success, otherwise an error code     *
*******************************************************************************}
procedure TTwofish.InitialiseByte(const Key: array of Byte; KeyLength: integer);
var
     KeyArray: array[0..255] of Byte;
begin
     // check for incorrect length keys
     if (KeyLength < 1) or (KeyLength > 156) then
     begin
          // we should not use zero length keys
          // catch the error and return with error code
          raise EKeyError.Create(LIT_KEY_LENGTH);
          Exit;
     end; {if Length(Key)}

     // clear the context
     FillChar(ctx.ct, Sizeof(ctx.ct), #0);
     FillChar(ctx.ByteBuffer, Sizeof(ctx.ByteBuffer), #0);
     FillChar(KeyArray, Sizeof(KeyArray), #0);

     {**************************************************************************
     ************ This section of code implements the 64 bit limit *************
     ************ imposed by the Wassennar agreement. The key is   *************
     ************ limited to 64 bits. Should you be in a country   *************
     ************ where the Wassennar agreement is not in force,   *************
     ************ undefine the WASSENAAR_LIMITED variable.         *************
     **************************************************************************}

     {$ifdef WASSENAAR_LIMITED}
     // turn the key string into a key array
     for i := 1 to Length(Key) do
     begin
          KeyArray[(i-1) mod 8] := KeyArray[(i-1) mod 8] xor Ord(Key[i]);
     end; {for}
     {$else}
     // buffer the passed key into the key array to make sure that
     // it is padded with something defined (just in case)
     Move(Key, KeyArray, KeyLength);
     {$endif}

     // and perform the initialisation with the array
     Twofish_Core_Key_Setup(KeyArray, KeyLength);

     // mark the context as initialised
     ctx.KeyInit := True;
end; {InitialiseByte}

{*******************************************************************************
* Procedure : LoadIVString                                                     *
********************************************************************************
* Purpose   : Loads the Initialisation Vector                                  *
*             Note: this is only necessary for modes other than ECB            *
********************************************************************************
* Paramters : 'IVString' - the string which holds the IV to be set             *
********************************************************************************
* Returns   : None - (Null IVs are also valid)                                 *
*******************************************************************************}
procedure TTwofish.LoadIVString(Const IVString: string);
var
     i: integer;
begin
     // clear the IV in the context
     FillChar(ctx.IV, BLOCKSIZE, #0);

     // wrap the IV string into the 16 bytes of the IV block using xor
     for i := 1 to Length(IVString) do
     begin
          ctx.IV[(i-1) and (BLOCKSIZE - 1)] := ctx.IV[(i-1) and (BLOCKSIZE - 1)] xor Ord(IVString[i]);
     end; {for i}

     // mark the IV as being initialised
     ctx.IVInit := True;
end; {LoadIVString}

{*******************************************************************************
* Procedure : LoadIVByte                                                       *
********************************************************************************
* Purpose   : Loads the Initialisation Vector                                  *
*             Note: this is only necessary for modes other than ECB            *
********************************************************************************
* Paramters : 'IVByte' - the array of bytes which holds the IV to be set       *
********************************************************************************
* Returns   : None - (Null IVs are also valid)                                 *
*******************************************************************************}
procedure TTwofish.LoadIVByte(const IVByte: array of Byte; IVLength: integer);
var
     i: integer;
begin
     // clear the IV in the context
     FillChar(ctx.ByteBuffer, BLOCKSIZE, #0);

     // wrap the IV string into the 8 bytes of the IV block using xor
     for i := 1 to IVLength do
     begin
          ctx.ByteBuffer[(i-1) and (BLOCKSIZE - 1)] := ctx.ByteBuffer[(i-1) and (BLOCKSIZE - 1)] xor IVByte[i];
     end; {for i}

     // mark the IV as being initialised
     ctx.IVInit := True;
end; {LoadIVByte}

{*******************************************************************************
* Procedure : EncryptBlock                                                     *
********************************************************************************
* Purpose   : Encrypts the contents of the block usint the key (and possibly   *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the block to be encrypted                               *
*           : 'Output' the encrypted block                                     *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.EncBlock(const Input: TBlock; var Output: TBlock);
begin
     // check that we have a keys and IV
     CheckKeys;

     // copy the input to the context blockbuffer
     ctx.ByteBuffer := Input;

     // perform the encryption on the context
     EncryptBlockMode;

     // copy the context back to the blockbuffer
     Output := ctx.ByteBuffer;
end; {EncryptBlock}

{*******************************************************************************
* Procedure : DecryptBlock                                                     *
********************************************************************************
* Purpose   : Decrypts the contents of the block usint the key (and possibly   *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the encrypted block to be decrypted                     *
*           : 'Output' the decrypted block                                     *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.DecBlock(const Input: TBlock; var Output: TBlock);
begin
     // check that we have a keys and IV
     CheckKeys;

     // copy the input to the context blockbuffer
     ctx.ByteBuffer := Input;

     // perform the decryption
     DecryptBlockMode;

     // copy the context back to the blockbuffer
     Output := ctx.ByteBuffer;
end; {DecryptBlock}

{*******************************************************************************
* Procedure : EncryptBuffer                                                    *
********************************************************************************
* Purpose   : Encrypts the contents of the buffer usint the key (and possibly  *
*             the IV) previously set. Does not take care of any padding.       *
********************************************************************************
* Paramters : 'Len' the number of bytes in the buffer                          *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.EncryptBuffer(const Len: integer);
var
     Index: integer;
begin
     // check that we have a keys and IV
     CheckKeys;

     // index is the pointer to the current position in the buffer
     Index := 0;

     // PtrBuffer points to the address of the buffer
     PtrBuffer := @FBuffer;

     // for every block in the buffer
     repeat
          // move one block from the buffer contents into the context
          Move(FBuffer[Index], ctx.ByteBuffer, BLOCKSIZE);

          // encrypt the context
          EncryptBlockMode;

          // move the block back
          Move(ctx.ByteBuffer, PtrBuffer^[Index], BLOCKSIZE);

          // increment the pointer
          Inc(Index,BLOCKSIZE);
     until Index = Len;
end; {EncryptBuffer}

{*******************************************************************************
* Procedure : DecryptBuffer                                                    *
********************************************************************************
* Purpose   : Decrypts the contents of the buffer usint the key (and possibly  *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Len' the number of bytes in the buffer                          *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.DecryptBuffer(const Len: integer);
var
     Index: integer;
begin
     // check that we have a keys and IV
     CheckKeys;

     // index is the pointer to the current position in the buffer
     Index := 0;

     // PtrBuffer points to the address of the buffer
     PtrBuffer := @FBuffer;

     // for every block in the buffer
     repeat
          // move one block from the buffer contents into the context
          Move(FBuffer[Index], ctx.ByteBuffer, BLOCKSIZE);

          // decrypt the context
          DecryptBlockMode;

          // move the block back
          Move(ctx.ByteBuffer, PtrBuffer^[Index], BLOCKSIZE);

          // increment the pointer
          Inc(Index,BLOCKSIZE);
     until Index = Len;
end; {DecryptBuffer}

{*******************************************************************************
* Procedure : EncryptFile                                                      *
********************************************************************************
* Purpose   : Encrypts InputFile to OutputFile using the Key (and possibly     *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'InputFileName' the plaintext file                               *
*             'OutputFileName' the ciphertext file                             *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.EncFile(const InputFileName: string; OutputFileName: string);
var
     InputFile, OutputFile: File;
     NumWrite, NumRead: integer;
     Pad: integer;
     Index: integer;
begin
     // check that we have a keys and IV
     CheckKeys;

     // open the input file
     try
          AssignFile(InputFile, InputFileName);
     except
          // we could not open the input file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_INFILE_NOT_FOUND);
          Exit;
     end;

     // reset the input file
     FileMode := 0;
     Reset(InputFile, 1);

     // open the output file
     try
          AssignFile(OutputFile, OutputFileName);
     except
          // we could not open the output file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_OUTFILE_OPEN_ERROR);
          Exit;
     end;

     // reset the output file for writing
     Rewrite(OutputFile, 1);

     // this is the main loop of EncryptFile. We read (for performance reasons) a block
     // at a time and encrypt the block. This minimises the accesses to the disk
     repeat
          // Read an input block
          BlockRead(InputFile,FBuffer,BUFFERSIZE, NumRead);

          //Pad the input to a multiple of 64bits(8BYTES) with Nulls at the end of the file
          if EOF(InputFile) then
          begin
               // pad the last block
               // if we have a zero padding, expand this to a full 8 byte block
               Pad := BLOCKSIZE - (NumRead mod BLOCKSIZE);
               Index := Pad;

               // add the pad bytes to the buffer
               while Index <> 0 do
               begin
                    FBuffer[NumRead] := Pad;
                    Inc(NumRead);
                    Dec(Index);
               end; {while Index}
          end; {if EOF}

          // encrypt the buffer
          EncryptBuffer(NumRead);

          // write the block to the output file
          BlockWrite(OutputFile, FBuffer, NumRead, NumWrite);

          // if NumRead <> NumWrite, it is probable that the disk is full
          if NumRead <> NumWrite then
          begin
               // there was an error writing the output file
               // exit with the error code
               raise EFileError.Create(LIT_OUTFILE_WRITE_ERROR);
               Exit;
          end; {if NumRead <> NumWrite}
     until EOF(InputFile) or (NumWrite <> NumRead); {repeat}

     // close the files
     CloseFile(InputFile);
     CloseFile(OutputFile);
end; {EncryptFile}

{*******************************************************************************
* Procedure : DecryptFile                                                      *
********************************************************************************
* Purpose   : Decrypts InputFile to OutputFile using the Key (and possibly     *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'InputFileName' the ciphertext file                              *
*             'OutputFileName' the plaintext file                              *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.DecFile(const InputFileName: string; OutputFileName: string);
var
     InputFile, OutputFile: File;
     NumWrite, NumRead: integer;
begin
     // check that we have a keys and IV
     CheckKeys;

     // open the input file
     try
          AssignFile(InputFile, InputFileName);
     except
          // we could not open the input file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_INFILE_NOT_FOUND);
          Exit;
     end;

     // reset the input file
     FileMode := 0;
     Reset(InputFile, 1);

     // open the output file
     try
          AssignFile(OutputFile, OutputFileName);
     except
          // we could not open the output file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_OUTFILE_OPEN_ERROR);
          Exit;
     end;

     // reset the output file
     Rewrite(OutputFile, 1);

     // this is the main loop of DecryptFile. We read (for performance reasons) a block
     // at a time and encrypt the block. This minimises the accesses to the disk
     repeat
          // Read an input block
          BlockRead(InputFile,FBuffer,BUFFERSIZE, NumRead);

          //Call DecryptBuffer to handle the actual decryption
          DecryptBuffer(NumRead);

          //Put in OutputFile, trimming out the final padding as necessary
          if EOF(InputFile) then
          begin
               // deal with the case that the file is a multiple of BUFFERLENGTH long
               NumRead := NumRead - FBuffer[NumRead-1];
          end;

          // write the block to the output file
          BlockWrite(OutputFile,FBuffer, NumRead, NumWrite);

          // if NumRead <> NumWrite, it is probable that the disk is full
          if NumRead <> NumWrite then
          begin
               // there was an error writing the output file
               // exit with the error code
               raise EFileError.Create(LIT_OUTFILE_WRITE_ERROR);
               Exit;
          end; {if NumRead <> NumWrite}
     until EOF(InputFile) or (NumWrite <> NumRead);

     // close the files
     CloseFile(InputFile);
     CloseFile(OutputFile);
end; {DecryptFile}

{*******************************************************************************
* Procedure : EncryptStream                                                    *
********************************************************************************
* Purpose   : Encrypts the contents of the stream using the key (and possibly  *
*             the IV) previously set. Takes care of padding the stream.         *
********************************************************************************
* Paramters : 'Input'  the stream to be encrypted                              *
*           : 'Output' the encrypted stream                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.EncStream(const Input: TStream; const Output: TStream);
var
     i: integer;
     j: integer;
     k: integer;
     RemainingData: integer;
begin
     // Input.Size contains the length of the stream in bytes and in *not*
     // updated by reading the stream (i.e. it is not a pointer to the position
     // in the stream.
     RemainingData := Input.Size;

     // reset the stream positions
     Input.Seek(0, soFromBeginning);
     Output.Seek(0, soFromBeginning);

     // check for zero length strings
     if Input.Size = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // deal with the whole BUFFERSIZE sections first
     // get the number of BUFFERSIZE sections to process, and process them
     i := RemainingData div BUFFERSIZE;
     while i > 0 do
     begin
          Input.Read(FBuffer, BUFFERSIZE);
          Dec(RemainingData, BUFFERSIZE);

          EncryptBuffer(BUFFERSIZE);

          Output.Write(FBuffer, BUFFERSIZE);
          Dec(i);
     end;

     // now deal with the final (incomplete) block of length BUFFERSIZE
     // this must be padded to ensure a sucessful decryption

     // read in the partial block
     Input.Read(FBuffer, RemainingData);

     // get the amount of padding and add it
     i := BLOCKSIZE - (RemainingData mod BLOCKSIZE);

     // and the position to write it to in the buffer
     j := RemainingData;

     // pad to a full block at the end of the input
     k := i;
     while k > 0 do
     begin
          FBuffer[j] := i;
          Dec(k);
          Inc(j);
     end; {while k}

     // encrypt the partial block
     EncryptBuffer(j);

     // write to the output stream
     Output.Write(FBuffer, j);
end; {EncryptStream}

{*******************************************************************************
* Procedure : DecryptStream                                                    *
********************************************************************************
* Purpose   : Decrypts the contents of the stream using the key (and possibly  *
*             the IV) previously set. Unpads the stream.                       *
********************************************************************************
* Paramters : 'Input'  the stream to be decrypted                              *
*           : 'Output' the decrypted stream                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.DecStream(const Input: TStream; const Output: TStream);
var
     i: integer;
     RemainingData: integer;
begin
     // Input.Size contains the length of the stream in bytes and in *not*
     // updated by reading the stream (i.e. it is not a pointer to the position
     // in the stream.
     RemainingData := Input.Size;

     // reset the stream positions
     Input.Seek(0, soFromBeginning);
     Output.Seek(0, soFromBeginning);

     // check for zero length strings
     if Input.Size = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // deal with the whole BUFFERSIZE sections first
     // get the number of BUFFERSIZE sections to process, and process them
     i := RemainingData div BUFFERSIZE;
     while i > 0 do
     begin
          Input.Read(FBuffer, BUFFERSIZE);
          Dec(RemainingData, BUFFERSIZE);

          DecryptBuffer(BUFFERSIZE);

          Output.Write(FBuffer, BUFFERSIZE);
          Dec(i);
     end;

     // now deal with the final (incomplete) block of length BUFFERSIZE
     // this must be padded to ensure a sucessful decryption

     // read in the partial block
     Input.Read(FBuffer, RemainingData);

     // decrypt the partial block
     DecryptBuffer(RemainingData);

     // get the length of the padding
     i := FBuffer[RemainingData-1];

     // write the data excluding the i bytes of padding
     Output.Write(FBuffer, RemainingData-i);
end; {DecryptStream}

{*******************************************************************************
* Procedure : EncryptString                                                    *
********************************************************************************
* Purpose   : Encrypts the contents of the string usint the key (and possibly  *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the string to be encrypted                              *
*           : 'Output' the encrypted string                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.EncString(const Input: string; var Output: string);
var
     i: longint;
     j: longint;
     s: string;
begin
     // check that we have a keys and IV
     CheckKeys;

     // initialise the output string
     Output := '';

     // check for zero length strings
     if Length(Input) = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // load the input into the buffer
     s := Input;

     // Pad the input string to a multiple of BLOCKSIZE bytes.
     j := Length(s) + 1;
     i := BLOCKSIZE - (Length(s) mod BLOCKSIZE);
     SetLength(s, Length(s)+i);
     SetLength(Output, Length(s));

     // add the pad bytes to the end of the string
     while j <= Length(s) do
     begin
          s[j] := chr(i);
          inc(j);
     end; {while j}

     // initialise the counters
     j := 1;
     i := 1;

     // and step through the string
     while i < length(s) do
     begin
          // copy the next bytes into the context block buffer
          Move(s[i], ctx.ByteBuffer, BLOCKSIZE);
          Inc(i, BLOCKSIZE);

          // perform the encryption of the context
          EncryptBlockMode;

          // copy the block into the output string
          Move(ctx.ByteBuffer, Output[j], BLOCKSIZE);
          Inc(j, BLOCKSIZE);
     end; {while j}

     // encode the string if required
     if FStringMode = smEncode then
     begin
          Output := EncodeString(Output);
     end;
end; {EncryptString}

{*******************************************************************************
* Procedure : DecryptString                                                    *
********************************************************************************
* Purpose   : Decrypts the contents of the string usint the key (and possibly  *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the encrypted string to be decrypted                    *
*           : 'Output' the decrypted string                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TTwofish.DecString(const Input: string; var Output: string);
var
     i: longint;
     j: longint;
     s: string;
     InputTemp: string;
begin
     // check that we have a keys and IV
     CheckKeys;

     // initialise the output string
     Output := '';

     // check for zero length strings
     if Length(Input) = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // decode the string if required
     if FStringMode = smEncode then
     begin
          InputTemp := DecodeString(Input);
     end
     else
     begin
          InputTemp := Input;
     end;

     // check that the input is long enough
     if Length(InputTemp) < BLOCKSIZE then
     begin
          raise EInputError.Create(LIT_INPUT_LENGTH);
     end; {if Length}

     // initialise the working string
     s := '';

     // preset the length of the ´working string
     SetLength(s, Length(InputTemp));

     // initialise the counters
     i := 1;
     j := 1;

     // and step through the string
     while i < (Length(InputTemp)) do
     begin
          // copy the next bytes into the context block buffer
          Move(InputTemp[j], ctx.ByteBuffer, BLOCKSIZE);
          Inc(j, BLOCKSIZE);

          // perform the decryption of the context
          DecryptBlockMode;

          // copy the block into the output string
          Move(ctx.ByteBuffer, s[i], BLOCKSIZE);
          Inc(i, BLOCKSIZE);
     end; {while i}

     // Unpad Plain Text string
     // Last byte is number of pad bytes
     i := ord(s[Length(s)]);
     if (i > 0) and (i <= BLOCKSIZE) then
     begin
          Output := Copy(s, 1,Length(s) - i);
     end
     else
     begin
          Output := Copy(s, 1,Length(s) - 1);
     end; {if (i>0) and}
end; {DecryptString}

{*******************************************************************************
* Procedure : CBCMACBlock                                                      *
********************************************************************************
* Purpose   : Returns the MAC of the data which has passed through the cipher  *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : The MAC as a TBlock                                              *
*******************************************************************************}
procedure TTwofish.CBCMACBlock(var MAC: TBlock);
begin
     // pre initialise the MAC
     FillChar(MAC, Sizeof(MAC), #0);

     // check that the formalities are in order
     if FCipherMode <> CBC then
     begin
          // we can only reasonably produce a MAC in CBC mode
          raise EKeyError.Create(LIT_CBC_NOT_SET);
          Exit;
     end; {if}

     // check that we have the key and IV
     CheckKeys;

     MAC := ctx.IV;
end; {CBCMACBlock}

{*******************************************************************************
* Procedure : CBCMACstring                                                     *
********************************************************************************
* Purpose   : Returns the MAC of the data which has passed through the cipher  *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : The MAC as a string                                              *
*******************************************************************************}
procedure TTwofish.CBCMACString(var MAC: String);
var
     MACTemp: TBlock;
     i: integer;
begin
     CBCMACBlock(MACTemp);

     MAC := '';

     for i := 0 to BLOCKSIZE-1 do
     begin
          MAC := MAC + IntToHex(MACTemp[i],2);
     end; {for}
end; {CBCMACString}


{*******************************************************************************
******************************** utility routines ******************************
*******************************************************************************}


{*******************************************************************************
* Procedure : Burn                                                             *
********************************************************************************
* Purpose   : Clears the context of any sensitive information                  *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.Burn;
begin
     // reset the whole context
     FillChar(ctx, SizeOf(ctx), #0);
     // reset the boolean members
     ctx.KeyInit := False;
     ctx.IVInit := False;
end; {Burn}

{*******************************************************************************
* Procedure : EncryptBlockMode                                                 *
********************************************************************************
* Purpose   : Encrypts the contents of the context buffer, using the           *
*             currently selected encryption mode.                              *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.EncryptBlockMode;
var
     i: integer;
begin
     // perform the operation using the current mode
     case FCipherMode of
     CBC:
          begin
               // xor the input block with the previous IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    ctx.ByteBuffer[i] := ctx.ByteBuffer[i] xor ctx.IV[i];
               end; {for i}

               // perform the encryption on the block
               EndianEncBlock;

               // copy the ciphertext to the IV
               Move (ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
          end; {CBC}
     ECB:
          begin
               // ECB Mode has no preprocessing
               // perform the encryption on the block
               EndianEncBlock;
          end; {ECB}
     CFB:
          begin
               // Encipher the current IV to give the next IV
               Move (ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the block
               EndianEncBlock;

               Move(ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
               Move (ctx.ct, ctx.ByteBuffer, BLOCKSIZE);

               // and xor the plaintext with the IV to get the ciphertext
               for i := 0 to BLOCKSIZE-1 do
               begin
                    ctx.ByteBuffer[i] := ctx.ByteBuffer[i] xor ctx.IV[i];
               end; {for i}

               // feed the ciphertext back into the IV
               Move (ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
          end; {CFB}
     OFB:
          begin
               // encrypt the previous IV to get the new IV
               Move (ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the block
               EndianEncBlock;

               // move the IV back
               Move (ctx.ByteBuffer, ctx.IV, BLOCKSIZE);

               // the ciphertext is the plaintext xor IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    ctx.ByteBuffer[i] := ctx.ct[i] xor ctx.IV[i];
               end; {for i}
          end; {OFB}
     end;
end;

{*******************************************************************************
* Procedure : DecryptBlockMode                                                 *
********************************************************************************
* Purpose   : Decrypts the contents of the context buffer, using the           *
*             currently selected encryption mode.                              *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.DecryptBlockMode;
var
     i: integer;
begin
     // perform the operation using the current mode
     case FCipherMode of
     CBC:
          begin
               // preserve the ciphertext in ct
               Move(ctx.ByteBuffer, ctx.ct, BLOCKSIZE);

               // perform the decryption on the block
               EndianDecBlock;

               // the plaintext is the ciphertext xor IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    ctx.ByteBuffer[i] := ctx.ByteBuffer[i] xor ctx.IV[i];
               end; {for i}

               // copy the ciphertext to the IV
               Move(ctx.ct, ctx.IV, BLOCKSIZE);
          end;
     ECB:
          begin
               // no preprocessing required
               // perform the decryption on the block
               EndianDecBlock;
          end;
     CFB:
          begin
               // Encipher the current IV to give the next IV
               // note that encipher is used
               Move (ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the IV
               EndianEncBlock;

               Move(ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
               Move (ctx.ct, ctx.ByteBuffer, BLOCKSIZE);

               // and xor the plaintext with the IV to get the ciphertext
               for i := 0 to BLOCKSIZE-1 do
               begin
                    ctx.ByteBuffer[i] := ctx.ByteBuffer[i] xor ctx.IV[i];
               end;

               // feed the ciphertext back into the IV
               Move (ctx.ct, ctx.IV, BLOCKSIZE);
          end; {CFB}
     OFB:
          begin
               // encrypt the previous IV to get the new IV
               // note that encipher is used
               Move (ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the IV
               EndianEncBlock;

               // move the IV back
               Move (ctx.ByteBuffer, ctx.IV, BLOCKSIZE);

               // the plaintext is the ciphertext xor IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    ctx.ByteBuffer[i] := ctx.ct[i] xor ctx.IV[i];
               end; {for i}
          end; {OFB}
     end; {case}
end; {DecryptBlockMode}

{*******************************************************************************
* Procedure : EndianEncBlock                                                   *
********************************************************************************
* Purpose   : The context buffer is reorganised (because of the endianness of  *
*             Intel processors) and the inner loop is called                   *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.EndianEncBlock;
var
     pt: TQuadWord;
     ct: TQuadWord;
begin
     // transfer the data into the general buffer
     Move(ctx.ByteBuffer, pt, BLOCKSIZE);

     // perform the encryption
     Twofish_Core_Block_Encrypt(pt,ct);

     // and transfer it back
     Move(ct, ctx.ByteBuffer, BLOCKSIZE);
end;{EndianEncBlock}

{*******************************************************************************
* Procedure : EndianDecBlock                                                   *
********************************************************************************
* Purpose   : The context buffer is reorganised (because of the endianness of  *
*             Intel processors) and the inner loop is called                   *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.EndianDecBlock;
var
     pt: TQuadWord;
     ct: TQuadWord;
begin
     // transfer the data into the general buffer
     Move(ctx.ByteBuffer, ct, BLOCKSIZE);

     // perform the decryption
     Twofish_Core_Block_Decrypt(ct,pt);

     // and transfer it back
     Move(pt, ctx.ByteBuffer, BLOCKSIZE);
end;{EndianDecBlock}

{*******************************************************************************
* Procedure : CheckKeys                                                        *
********************************************************************************
* Purpose   : Checks that a valid key has been set before an encryption or     *
*             decryption. If the mode is not ECB, check the IV as well.        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.CheckKeys;
begin
     // check that we have a key
     if not ctx.KeyInit then
     begin
          // if not, we cannot perform the encryption
          // exit with error code
          raise EKeyError.Create(LIT_KEY_NOT_SET);
          Exit;
     end; {if not ctx.Init}

     // for modes other than ECB we also require an IV
     // check that this has been set if the mode is not ECB
     if FCipherMode <> ECB then
     begin
          // mode is not ECB
          if not ctx.IVInit then
          begin
               // if not, we cannot perform the encryption
               // exit with error code
               raise EKeyError.Create(LIT_IV_NOT_SET);
               Exit;
          end; {if not ctx.IVInit}
     end; {if FCipherMode}
end; {TTwofish.CheckKeys}

{$ifndef COMPONENT}
{*******************************************************************************
* Procedure : SetCipherMode                                                    *
********************************************************************************
* Purpose   : Sets the ciphermode (only in OBJECT mode)                        *
********************************************************************************
* Paramters : value : the new value to be set                                  *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.SetCipherMode(const Value: TCipherMode);
begin
     FCipherMode := Value;
end; {SetCipherMode}

{*******************************************************************************
* Procedure : GetCipherMode                                                    *
********************************************************************************
* Purpose   : Gets the ciphermode (only in OBJECT mode)                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : The current mode                                                 *
*******************************************************************************}
function TTwofish.GetCipherMode: TCipherMode;
begin
     Result := FCipherMode;
end; {GetCipherMode}

{*******************************************************************************
* Procedure : SetStringMode                                                    *
********************************************************************************
* Purpose   : Sets the stringmode (only in OBJECT mode)                        *
********************************************************************************
* Paramters : value : the new value to be set                                  *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.SetStringMode(const Value: TStringMode);
begin
     FStringMode := Value;
end; {SetCipherMode}

{*******************************************************************************
* Procedure : GetStringMode                                                    *
********************************************************************************
* Purpose   : Gets the stringmode (only in OBJECT mode)                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : The current mode                                                 *
*******************************************************************************}
function TTwofish.GetStringMode: TStringMode;
begin
     Result := FStringMode;
end; {GetStringMode}

{*******************************************************************************
* Procedure : SetKeySize                                                       *
********************************************************************************
* Purpose   : Sets the key size   (only in OBJECT mode)                        *
********************************************************************************
* Paramters : value : the new value to be set                                  *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.SetKeySize(const Value: TKeySize);
begin
     FKeySize := Value;
end; {SetKeySize}

{*******************************************************************************
* Procedure : GetKeySize                                                       *
********************************************************************************
* Purpose   : Gets the key size   (only in OBJECT mode)                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : The current key size                                             *
*******************************************************************************}
function TTwofish.GetKeySize: TKeySize;
begin
     Result := FKeySize;
end; {GetKeySize}
{$endif}



{******************************************************************}
{******************************************************************}
{*** the following functions encapsulate the Twofish  algorithm ***}
{******************************************************************}
{******************************************************************}


{*******************************************************************************
* Procedure : LSFR1                                                            *
********************************************************************************
* Purpose   : Reed Solomon function 2                                          *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function LFSR1(x: DWord): DWord;
begin
     if (x and 1)<> 0 then
     begin
          Result := (x shr 1) xor (MDS_GF_FDBK div 2);
     end
     else
     begin
          Result := (x shr 1);
     end;
end; {LFSR1}

{*******************************************************************************
* Procedure : LSFR2                                                           *
********************************************************************************
* Purpose   : Reed Solomon function 2                                          *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function LFSR2(x: DWord): DWord;
begin
     if (x and 2)<> 0 then
     begin
          if (x and 1)<> 0 then
          begin
               Result := (x shr 2) xor (MDS_GF_FDBK div 2) xor (MDS_GF_FDBK div 4);
          end
          else
          begin
               Result := (x shr 2) xor (MDS_GF_FDBK div 2)
          end;
     end
     else
     begin
          if (x and 1)<> 0 then
          begin
               Result := (x shr 2) xor (MDS_GF_FDBK div 4)
          end
          else
          begin
               Result := (x shr 2);
          end;
     end;
end; {LFSR2}

{*******************************************************************************
* Procedure : Mx_1                                                             *
********************************************************************************
* Purpose   : Reed Solomon multiplier 1                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function Mx_1(x: DWord): DWord;
begin
     Result := x;
end; {Mx_1}

{*******************************************************************************
* Procedure : Mx_X                                                             *
********************************************************************************
* Purpose   : Reed Solomon multiplier X                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function Mx_X(x: DWord): DWord;
begin
     Result := x xor LFSR2(x);
end; {Mx_X}

{*******************************************************************************
* Procedure : Mx_Y                                                             *
********************************************************************************
* Purpose   : Reed Solomon multiplier Y                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function Mx_Y(x: DWord): DWord;
begin
     Result := x xor LFSR1(x) xor LFSR2(x);
end; {Mx_Y}

const
     Mul_1: function(x: DWord): DWord = Mx_1;
     Mul_X: function(x: DWord): DWord = Mx_X;
     Mul_Y: function(x: DWord): DWord = Mx_Y;

{*******************************************************************************
* Procedure : PreCompMDS                                                       *
********************************************************************************
* Purpose   : Precomputes the MDS matrix to achieve the maximum throughput     *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure PreCompMDS;
var
     m1, mx, my: array[0..1] of byte;
     nI: integer;
begin
     for nI := 0 to 255 do
     begin
          m1[0] := p8x8[0,nI];
          mx[0] := Mul_X(m1[0]);
          my[0] := Mul_Y(m1[0]);
          m1[1] := p8x8[1,nI];
          mx[1] := Mul_X(m1[1]);
          my[1] := Mul_Y(m1[1]);
          mds[0,nI] := (m1[P_00] shl 0) or
                      (mx[p_00] shl 8) or
                      (my[p_00] shl 16) or
                      (my[p_00] shl 24);
          mds[1,nI] := (my[p_10] shl 0) or
                      (my[p_10] shl 8) or
                      (mx[p_10] shl 16) or
                      (m1[p_10] shl 24);
          mds[2,nI] := (mx[p_20] shl 0) or
                      (my[p_20] shl 8) or
                      (m1[p_20] shl 16) or
                      (my[p_20] shl 24);
          mds[3,nI] := (mx[p_30] shl 0) or
                      (m1[p_30] shl 8) or
                      (my[p_30] shl 16) or
                      (mx[p_30] shl 24);
     end;
end; {PreCompMDS}

{*******************************************************************************
* Procedure : RS_MDS_Encode                                                    *
********************************************************************************
* Purpose   : Computes the Reed Solomon code to be used as the Maximum         *
*             Distance Separable code                                          *
*             Uses a (12,8) Reed-Solomon code over GF(256) to produce          *
*	      a key S-box dword from two key material dwords.                  *
*                                                                              *
* Notes:                                                                       *
*	Since this computation is done only once per reKey per 64 bits of key, *
*	the performance impact of this routine is imperceptible. The RS code   *
*	chosen has "simple" coefficients to allow smartcard/hardware           *
*	implenentation without lookup tables.                                  *
********************************************************************************
* Paramters : lk0: first word                                                  *
*             lk1: second word                                                 *
********************************************************************************
* Returns   : Remainder polynomial generated using RS code                     *
*******************************************************************************}
function RS_MDS_Encode(lK0, lK1: DWord): DWord;
var
     lR, nI, nJ, lG2, lG3: DWord;
     bB: byte;
begin
     lR := 0;
     for nI := 0 to 1 do
     begin
          if nI<> 0  then
          begin
               lR := lR xor lK0;
          end
          else
          begin
               lR := lR xor lK1;
          end;

          for nJ := 0 to 3 do
          begin
               bB := lR shr 24;
               if (bB and $80)<> 0 then
               begin
                    lG2 := ((bB shl 1) xor RS_GF_FDBK) and $FF;
               end
               else
               begin
                    lG2 := (bB shl 1) and $FF;
               end;
               if (bB and 1)<> 0 then
               begin
                    lG3 := ((bB shr 1) and $7f) xor (RS_GF_FDBK shr 1) xor lG2;
               end
               else
               begin
                    lG3 := ((bB shr 1) and $7f) xor lG2;
               end;

               lR := (lR shl 8) xor (lG3 shl 24) xor (lG2 shl 16) xor (lG3 shl 8) xor bB;
          end;
     end;
     Result := lR;
end; {TTwofish.RS_MDS_Encode}

{*******************************************************************************
* Procedure : f32                                                              *
********************************************************************************
* Purpose   : Run four bytes through keyed S-boxes and apply MDS matrix        *
*                                                                              *
* Notes:                                                                       *
*	This function is a keyed 32-bit permutation.  It is the major building *
*	block for the Twofish round function, including the four keyed 8x8     *
*	permutations and the 4x4 MDS matrix multiply.  This function is used   *
*	both for generating round subkeys and within the round function on the *
*	block being encrypted.                                                 *
********************************************************************************
* Paramters : X: 32bit input word                                              *
*             K32: Subkey array                                                *
********************************************************************************
* Returns   : Output 32bit of the keyed permutation applied to x               *
*******************************************************************************}
function f32(x: DWord; K32: PDWordArray; Len: DWord): DWord;
var
     t0, t1, t2, t3: DWord;
begin
     t0 := x and $FF;
     t1 := (x shr 8) and $FF;
     t2 := (x shr 16) and $FF;
     t3 := x shr 24;
     if Len= 256 then
     begin
          t0 := p8x8[p_04,t0] xor ((K32[3]) and $FF);
          t1 := p8x8[p_14,t1] xor ((K32[3] shr  8) and $FF);
          t2 := p8x8[p_24,t2] xor ((K32[3] shr 16) and $FF);
          t3 := p8x8[p_34,t3] xor ((K32[3] shr 24));
     end;

     if Len>= 192 then
     begin
          t0 := p8x8[p_03,t0] xor ((K32[2]) and $FF);
          t1 := p8x8[p_13,t1] xor ((K32[2] shr  8) and $FF);
          t2 := p8x8[p_23,t2] xor ((K32[2] shr 16) and $FF);
          t3 := p8x8[p_33,t3] xor ((K32[2] shr 24));
     end;

     Result := MDS[0,p8x8[p_01,p8x8[p_02,t0] xor ((K32[1]) and $FF)] xor ((K32[0]) and $FF)] xor
               MDS[1,p8x8[p_11,p8x8[p_12,t1] xor ((K32[1] shr  8) and $FF)] xor ((K32[0] shr  8) and $FF)] xor
               MDS[2,p8x8[p_21,p8x8[p_22,t2] xor ((K32[1] shr 16) and $FF)] xor ((K32[0] shr 16) and $FF)] xor
               MDS[3,p8x8[p_31,p8x8[p_32,t3] xor ((K32[1] shr 24))] xor ((K32[0] shr 24))];
end; {TTwofish.f32}

{*******************************************************************************
* Procedure : Twofish_Core_Key_Setup                                           *
********************************************************************************
* Purpose   : Performs the key setup using the defined key                     *
********************************************************************************
* Paramters : Key: array holding the key                                       *
*             KeyLength: Length of the key                                     *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TTwofish.Twofish_Core_Key_Setup(const Key: array of Byte; const KeyLength: integer);
     procedure Xor256(Dst, Src: PDWordArray; v: byte);
     var
          i: DWord;
     begin
          for i := 0 to 63 do
          begin
               Dst[i] := Src[i] xor (v * $01010101);  {(v * $0101010101)}
          end;
     end;
var
     key32: array[0..7] of DWord;
     k32e, k32o: array[0..3] of DWord;
     k64Cnt, i, j, A, B, q, subkeyCnt: DWord;
     L0, L1: array[0..255] of byte;
     TempKeyLength: integer;
begin
     TempKeyLength := KeyLength;

     with ctx do
     begin
          FillChar(Key32,Sizeof(Key32),0);
          Move(Key, Key32, TempKeyLength);

          // set the key length to the externally specified length
          case FKeySize of
               Small128:
                    TempKeyLength := 128;
               Med192:
                    TempKeyLength := 192;
               Large256:
                    TempKeyLength := 256;
          end;

          SubKeyCnt := ROUNDSUBKEYS + 2*NUMROUNDS;
          KeyLen := TempKeyLength;
          k64Cnt := TempKeyLength div 64;
          j := k64Cnt-1;

          for i := 0 to j do
          begin
               k32e[i] := key32[2*i];
               k32o[i] := key32[2*i+1];
               sboxKeys[j] := RS_MDS_Encode(k32e[i],k32o[i]);
               Dec(j);
          end;

          q := 0;

          for i := 0 to ((subkeyCnt div 2)-1) do
          begin
               A := f32(q,@k32e,TempKeyLength);
               B := f32(q+SK_BUMP,@k32o,TempKeyLength);
               B := LRot32(B,8);
               SubKeys[2*i] := A+B;
               B := A + 2*B;
               SubKeys[2*i+1] := LRot32(B,SK_ROTL);
               Inc(q,SK_STEP);
          end;

          case FKeySize of
            Small128: begin
                   Xor256(@L0,@p8x8[p_02],(sboxKeys[1] and $FF));
                   A := (sboxKeys[0] and $FF);
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[0 and 2,2*i+(0 and 1)] := MDS[0,p8x8[p_01,L0[i]] xor A];
                        sBox[0 and 2,2*i+(0 and 1)+2] := MDS[0,p8x8[p_01,L0[i+1]] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@p8x8[p_12],(sboxKeys[1] shr 8) and $FF);
                   A := (sboxKeys[0] shr 8) and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[1 and 2,2*i+(1 and 1)] := MDS[1,p8x8[p_11,L0[i]] xor A];
                        sBox[1 and 2,2*i+(1 and 1)+2] := MDS[1,p8x8[p_11,L0[i+1]] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@p8x8[p_22],(sboxKeys[1] shr 16) and $FF);
                   A := (sboxKeys[0] shr 16) and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[2 and 2,2*i+(2 and 1)] := MDS[2,p8x8[p_21,L0[i]] xor A];
                        sBox[2 and 2,2*i+(2 and 1)+2] := MDS[2,p8x8[p_21,L0[i+1]] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@p8x8[p_32],(sboxKeys[1] shr 24));
                   A := (sboxKeys[0] shr 24);
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[3 and 2,2*i+(3 and 1)] := MDS[3,p8x8[p_31,L0[i]] xor A];
                        sBox[3 and 2,2*i+(3 and 1)+2] := MDS[3,p8x8[p_31,L0[i+1]] xor A];
                        Inc(i,2);
                   end;
                 end;

            Med192: begin
                   Xor256(@L0,@p8x8[p_03],sboxKeys[2] and $FF);
                   A := sboxKeys[0] and $FF;
                   B := sboxKeys[1] and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[0 and 2,2*i+(0 and 1)] := MDS[0,p8x8[p_01,p8x8[p_02,L0[i]] xor B] xor A];
                        sBox[0 and 2,2*i+(0 and 1)+2] := MDS[0,p8x8[p_01,p8x8[p_02,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@p8x8[p_13],(sboxKeys[2] shr 8) and $FF);
                   A := (sboxKeys[0] shr 8) and $FF;
                   B := (sboxKeys[1] shr 8) and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[1 and 2,2*i+(1 and 1)] := MDS[1,p8x8[p_11,p8x8[p_12,L0[i]] xor B] xor A];
                        sBox[1 and 2,2*i+(1 and 1)+2] := MDS[1,p8x8[p_11,p8x8[p_12,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@p8x8[p_23],(sboxKeys[2] shr 16) and $FF);
                   A := (sboxKeys[0] shr 16) and $FF;
                   B := (sboxKeys[1] shr 16) and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[2 and 2,2*i+(2 and 1)] := MDS[2,p8x8[p_21,p8x8[p_22,L0[i]] xor B] xor A];
                        sBox[2 and 2,2*i+(2 and 1)+2] := MDS[2,p8x8[p_21,p8x8[p_22,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@p8x8[p_33],(sboxKeys[2] shr 24));
                   A := (sboxKeys[0] shr 24);
                   B := (sboxKeys[1] shr 24);
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[3 and 2,2*i+(3 and 1)] := MDS[3,p8x8[p_31,p8x8[p_32,L0[i]] xor B] xor A];
                        sBox[3 and 2,2*i+(3 and 1)+2] := MDS[3,p8x8[p_31,p8x8[p_32,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;
                 end;

            Large256: begin
                   Xor256(@L1,@p8x8[p_04],(sboxKeys[3]) and $FF);
                   i := 0;

                   while i< 256 do
                   begin
                        L0[i  ] := p8x8[p_03,L1[i]];
                        L0[i+1] := p8x8[p_03,L1[i+1]];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@L0,(sboxKeys[2]) and $FF);
                   A := (sboxKeys[0]) and $FF;
                   B := (sboxKeys[1]) and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[0 and 2,2*i+(0 and 1)] := MDS[0,p8x8[p_01,p8x8[p_02,L0[i]] xor B] xor A];
                        sBox[0 and 2,2*i+(0 and 1)+2] := MDS[0,p8x8[p_01,p8x8[p_02,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L1,@p8x8[p_14],(sboxKeys[3] shr  8) and $FF);
                   i := 0;

                   while i< 256 do
                   begin
                        L0[i  ] := p8x8[p_13,L1[i]];
                        L0[i+1] := p8x8[p_13,L1[i+1]];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@L0,(sboxKeys[2] shr  8) and $FF);
                   A := (sboxKeys[0] shr  8) and $FF;
                   B := (sboxKeys[1] shr  8) and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[1 and 2,2*i+(1 and 1)] := MDS[1,p8x8[p_11,p8x8[p_12,L0[i]] xor B] xor A];
                        sBox[1 and 2,2*i+(1 and 1)+2] := MDS[1,p8x8[p_11,p8x8[p_12,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L1,@p8x8[p_24],(sboxKeys[3] shr 16) and $FF);
                   i := 0;

                   while i< 256 do
                   begin
                        L0[i  ] := p8x8[p_23,L1[i]];
                        L0[i+1] := p8x8[p_23,L1[i+1]];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@L0,(sboxKeys[2] shr 16) and $FF);
                   A := (sboxKeys[0] shr 16) and $FF;
                   B := (sboxKeys[1] shr 16) and $FF;
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[2 and 2,2*i+(2 and 1)] := MDS[2,p8x8[p_21,p8x8[p_22,L0[i]] xor B] xor A];
                        sBox[2 and 2,2*i+(2 and 1)+2] := MDS[2,p8x8[p_21,p8x8[p_22,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;

                   Xor256(@L1,@p8x8[p_34],(sboxKeys[3] shr 24));
                   i := 0;

                   while i< 256 do
                   begin
                        L0[i  ] := p8x8[p_33,L1[i]];
                        L0[i+1] := p8x8[p_33,L1[i+1]];
                        Inc(i,2);
                   end;

                   Xor256(@L0,@L0,(sboxKeys[2] shr 24));
                   A := (sboxKeys[0] shr 24);
                   B := (sboxKeys[1] shr 24);
                   i := 0;

                   while i< 256 do
                   begin
                        sBox[3 and 2,2*i+(3 and 1)] := MDS[3,p8x8[p_31,p8x8[p_32,L0[i]] xor B] xor A];
                        sBox[3 and 2,2*i+(3 and 1)+2] := MDS[3,p8x8[p_31,p8x8[p_32,L0[i+1]] xor B] xor A];
                        Inc(i,2);
                   end;
               end;
          end;
     end;
end; {TTwofish.Twofish_Core_Key_Setup}

{*******************************************************************************
* Procedure : Twofish_Core_Block_Encrypt                                       *
********************************************************************************
* Purpose   : Performs the lowest level of the Twofish block encryption        *
********************************************************************************
* Paramters : pt: plaintext to be encrypted                                    *
********************************************************************************
* Returns   : ct: encrypted ciphertext                                         *
*******************************************************************************}
procedure TTwofish.Twofish_Core_Block_Encrypt(const pt: TQuadWord; var ct: TQuadWord);
var
     i: integer;
     t0, t1: DWord;
     X: array[0..3] of DWord;
begin
     // input key whitening
     X[0] := pt.w[0] xor ctx.SubKeys[INPUTWHITEN];
     X[1] := pt.w[1] xor ctx.SubKeys[INPUTWHITEN+1];
     X[2] := pt.w[2] xor ctx.SubKeys[INPUTWHITEN+2];
     X[3] := pt.w[3] xor ctx.SubKeys[INPUTWHITEN+3];

     with ctx do
     begin
          i := 0;
          while i <= NUMROUNDS-2 do
          begin
               {replaced 1.14b speedup
               t0   := ctx.sBox[0,2*(((x[0]) shr (blu[(0) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[0]) shr (blu[(1) and  3])) and $ff)+1]
                       xor ctx.sBox[2,2*(((x[0]) shr (blu[(2) and  3])) and $ff)]
                       xor ctx.sBox[2,2*(((x[0]) shr (blu[(3) and  3])) and $ff)+1];}
               {replaced 1.14b speedup
               t1   := ctx.sBox[0,2*(((x[1]) shr (blu[(3) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[1]) shr (blu[(4) and  3])) and $ff)+1]
                       xor ctx.sBox[2,2*(((x[1]) shr (blu[(5) and  3])) and $ff)]
                       xor ctx.sBox[2,2*(((x[1]) shr (blu[(6) and  3])) and $ff)+1];}
               t0   := ctx.sBox[0,2*(x[0]                and $ff)]
                       xor ctx.sBox[0,2*(((x[0]) shr 8)  and $ff)+1]
                       xor ctx.sBox[2,2*(((x[0]) shr 16) and $ff)]
                       xor ctx.sBox[2,2*(((x[0]) shr 24) and $ff)+1];
               t1   := ctx.sBox[0,2*(((x[1]) shr 24)     and $ff)]
                       xor ctx.sBox[0,2*((x[1])          and $ff)+1]
                       xor ctx.sBox[2,2*(((x[1]) shr 8)  and $ff)]
                       xor ctx.sBox[2,2*(((x[1]) shr 16) and $ff)+1];
               x[3] := LRot32(x[3],1);
               x[2] := x[2] xor (t0 +   t1 + ctx.Subkeys[ROUNDSUBKEYS+2*i]);
               x[3] := x[3] xor (t0 + 2*t1 + ctx.Subkeys[ROUNDSUBKEYS+2*i+1]);
               x[2] := RRot32(x[2],1);

               {replaced 1.14b speedup
               t0   := ctx.sBox[0,2*(((x[2]) shr (blu[(0) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[2]) shr (blu[(1) and  3])) and $ff)+1]
                       xor ctx.sBox[2,2*(((x[2]) shr (blu[(2) and  3])) and $ff)]
                       xor ctx.sBox[2,2*(((x[2]) shr (blu[(3) and  3])) and $ff)+1];
               t1   := ctx.sBox[0,2*(((x[3]) shr (blu[(3) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[3]) shr (blu[(4) and  3])) and $ff)+1]
                       xor ctx.sBox[2,2*(((x[3]) shr (blu[(5) and  3])) and $ff)]
                       xor ctx.sBox[2,2*(((x[3]) shr (blu[(6) and  3])) and $ff)+1];}
               t0   := ctx.sBox[0,2*((x[2])              and $ff)]
                       xor ctx.sBox[0,2*(((x[2]) shr 8)  and $ff)+1]
                       xor ctx.sBox[2,2*(((x[2]) shr 16) and $ff)]
                       xor ctx.sBox[2,2*(((x[2]) shr 24) and $ff)+1];
               t1   :=     ctx.sBox[0,2*(((x[3]) shr 24) and $ff)]
                       xor ctx.sBox[0,2*((x[3])          and $ff)+1]
                       xor ctx.sBox[2,2*(((x[3]) shr 8)  and $ff)]
                       xor ctx.sBox[2,2*(((x[3]) shr 16) and $ff)+1];
               x[1] := LRot32(x[1],1);
               x[0] := x[0] xor (t0 +   t1 + ctx.Subkeys[ROUNDSUBKEYS+2*(i+1)]);
               x[1] := x[1] xor (t0 + 2*t1 + ctx.Subkeys[ROUNDSUBKEYS+2*(i+1)+1]);
               x[0] := RRot32(x[0],1);
               Inc(i,2);
          end;
     end;

     // output key whitening
     ct.w[0] := X[2] xor ctx.SubKeys[OUTPUTWHITEN];
     ct.w[1] := X[3] xor ctx.SubKeys[OUTPUTWHITEN+1];
     ct.w[2] := X[0] xor ctx.SubKeys[OUTPUTWHITEN+2];
     ct.w[3] := X[1] xor ctx.SubKeys[OUTPUTWHITEN+3];
end; {TTwofish.Twofish_Core_Block_Encrypt}

{*******************************************************************************
* Procedure : Twofish_Core_Block_Decrypt                                       *
********************************************************************************
* Purpose   : Performs the lowest level of the Twofish block decryption        *
********************************************************************************
* Paramters : ct: ciphertext to be decrypted                                   *
********************************************************************************
* Returns   : pt: decrypted plaintext                                          *
*******************************************************************************}
procedure TTwofish.Twofish_Core_Block_Decrypt(const ct: TQuadWord; var pt: TQuadWord);
var
     i: integer;
     t0, t1: DWord;
     X: array[0..3] of DWord;
begin
     // output key whitening
     X[2] := ct.w[0] xor ctx.SubKeys[OUTPUTWHITEN];
     X[3] := ct.w[1] xor ctx.SubKeys[OUTPUTWHITEN+1];
     X[0] := ct.w[2] xor ctx.SubKeys[OUTPUTWHITEN+2];
     X[1] := ct.w[3] xor ctx.SubKeys[OUTPUTWHITEN+3];

     with ctx do
     begin
          i := NUMROUNDS-2;
          while i >= 0 do
          begin
               {replaced 1.14b speedup
               t0   := ctx.sBox[0,2*(((x[2]) shr (blu[(0) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[2]) shr (blu[(1) and  3]))
                       and $ff)+1] xor ctx.sBox[2,2*(((x[2]) shr (blu[(2) and  3]))
                       and $ff)] xor ctx.sBox[2,2*(((x[2]) shr (blu[(3) and  3])) and $ff)+1];
               t1   := ctx.sBox[0,2*(((x[3]) shr (blu[(3) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[3]) shr (blu[(4) and  3])) and $ff)+1]
                       xor ctx.sBox[2,2*(((x[3]) shr (blu[(5) and  3])) and $ff)]
                       xor ctx.sBox[2,2*(((x[3]) shr (blu[(6) and  3])) and $ff)+1];}
               t0   := ctx.sBox[0,2*((x[2])                          and $ff)]
                       xor ctx.sBox[0,2*(((x[2])             shr 8)
                       and $ff)+1] xor ctx.sBox[2,2*(((x[2]) shr 16)
                       and $ff)] xor ctx.sBox[2,2*(((x[2])   shr 24) and $ff)+1];
               t1   := ctx.sBox[0,2*(((x[3])                 shr 24) and $ff)]
                       xor ctx.sBox[0,2*((x[3])                      and $ff)+1]
                       xor ctx.sBox[2,2*(((x[3])             shr 8)  and $ff)]
                       xor ctx.sBox[2,2*(((x[3])             shr 16) and $ff)+1];
               x[0] := LRot32(x[0],1);
               x[0] := x[0] xor (t0 +   t1 + ctx.Subkeys[ROUNDSUBKEYS+2*(i+1)]);
               x[1] := x[1] xor (t0 + 2*t1 + ctx.Subkeys[ROUNDSUBKEYS+2*(i+1)+1]);
               x[1] := RRot32(x[1],1);

               {replaced 1.14b speedup
               t0   := ctx.sBox[0,2*(((x[0]) shr (blu[(0) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[0]) shr (blu[(1) and  3])) and $ff)+1]
                       xor ctx.sBox[2,2*(((x[0]) shr (blu[(2) and  3])) and $ff)]
                       xor ctx.sBox[2,2*(((x[0]) shr (blu[(3) and  3])) and $ff)+1];
               t1   := ctx.sBox[0,2*(((x[1]) shr (blu[(3) and  3])) and $ff)]
                       xor ctx.sBox[0,2*(((x[1]) shr (blu[(4) and  3])) and $ff)+1]
                       xor ctx.sBox[2,2*(((x[1]) shr (blu[(5) and  3])) and $ff)]
                       xor ctx.sBox[2,2*(((x[1]) shr (blu[(6) and  3])) and $ff)+1];}
               t0   := ctx.sBox[0,2*((x[0])                          and $ff)]
                       xor ctx.sBox[0,2*(((x[0])             shr 8)  and $ff)+1]
                       xor ctx.sBox[2,2*(((x[0])             shr 16) and $ff)]
                       xor ctx.sBox[2,2*(((x[0])             shr 24) and $ff)+1];
               t1   := ctx.sBox[0,2*(((x[1])                 shr 24) and $ff)]
                       xor ctx.sBox[0,2*((x[1])                      and $ff)+1]
                       xor ctx.sBox[2,2*(((x[1])             shr 8) and $ff)]
                       xor ctx.sBox[2,2*(((x[1])             shr 16) and $ff)+1];
               x[2] := LRot32(x[2],1);
               x[2] := x[2] xor (t0 +   t1 + ctx.Subkeys[ROUNDSUBKEYS+2*i]);
               x[3] := x[3] xor (t0 + 2*t1 + ctx.Subkeys[ROUNDSUBKEYS+2*i+1]);
               x[3] := RRot32(x[3],1);
               Dec(i,2);
          end;
     end;

     // input key whitening
     pt.w[0] := X[0] xor ctx.SubKeys[INPUTWHITEN];
     pt.w[1] := X[1] xor ctx.SubKeys[INPUTWHITEN+1];
     pt.w[2] := X[2] xor ctx.SubKeys[INPUTWHITEN+2];
     pt.w[3] := X[3] xor ctx.SubKeys[INPUTWHITEN+3];
end; {TTwofish.Twofish_Core_Block_Decrypt}

{*******************************************************************************
* Procedure : LRot32                                                           *
********************************************************************************
* Purpose   : Performs fast 32bit rotate left                                  *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function LRot32(X: dword; c: integer): dword; register; assembler;
asm
     mov ecx, edx
     rol eax, cl
end; {LRot32}

{*******************************************************************************
* Procedure : RRot32                                                           *
********************************************************************************
* Purpose   : Performs fast 32bit rotate right                                 *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function RRot32(X: dword; c: integer): dword; register; assembler;
asm
     mov ecx, edx
     ror eax, cl
end; {RRot32}

initialization
     PreCompMDS;

end.



