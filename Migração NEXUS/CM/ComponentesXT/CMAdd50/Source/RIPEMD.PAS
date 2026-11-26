{*******************************************************************************
* Unit      : TRipeMD                                                          *
********************************************************************************
* Purpose   : Produces a cryptographically secure one way hash of a given byte *
*             stream or string. Complies with RFC 1321                         *
********************************************************************************
* Copyright : This component is copyright TSM Inc. 1998-1999                   *
*             This source code may not be distributed to third parties in      *
*             or in part without the written permission of TSM Inc.            *
*             All rights reserved. Liability limited to replacement of         *
*             this original source code in the case of loss or damage because  *
*             the use or misuse of this software.                              *
********************************************************************************
* Version   : 15.06.98  - 1.00  Original component                             *
*             29.03.99  - 1.11b Code tidy up                                   *
********************************************************************************
* Switches  : REGISTERED - Compiles in the non-reg/registered/freeware mode    *
*             COMPONENT  - Compiles as a VCL component (otherwise unit)        *
*             COMMANDLINE- Allows override of mode from command line compiler  *
*******************************************************************************}

{$R-} {$A-} {$Q-}
{$ifndef COMMANDLINE}     // Overrides the following defaults
{$define REGISTERED}      // NOTREGISTERED, FREEWARE, REGISTERED
{$define COMPONENT}       // OBJECT, COMPONENT
{$endif}

unit RipeMD;

interface

uses Windows, Classes, SysUtils, Dialogs;

{*******************************************************************************
* Type      : TDigest                                                          *
********************************************************************************
* Purpose   : Defines the interface definition of the Message Digest           *
*******************************************************************************}
type TDigest = array[0..19] of Byte;

{*******************************************************************************
* Type      : TState                                                           *
********************************************************************************
* Purpose   : Holds the internal state of RipeMD                               *
*******************************************************************************}
{$ifdef VER120}
type TState  = array[0..4] of Cardinal;
{$else}
type TState  = array[0..4] of integer;
{$endif}

{*******************************************************************************
* Type      : TRipe_CTX                                                        *
********************************************************************************
* Purpose   : RipeMD Context                                                   *
*******************************************************************************}
type
  TRIPE_CTX = record
     State:       TState;
     {$ifdef VER120}
     count: array[0..1] of Cardinal;     // number of bits, modulo 2^64 (lsb first)
     {$else}
     count: array[0..1] of integer;     // number of bits, modulo 2^64 (lsb first)
     {$endif}
     Block:       array[0..15] of integer;
     Buffer:      array[0..63] of Byte;    // input buffer
end;

{*******************************************************************************
* Type      : TRipeMD                                                          *
********************************************************************************
* Purpose   : Defines the component (in component mode) or object              *
*******************************************************************************}
{$ifdef COMPONENT}
type TRipeMD = class(TComponent)
{$else}
type TRipeMD = class(TObject)
{$endif}
  private
     Fcontext:    Tripe_CTX;
     FDigest:     TDigest;

     procedure    Update(const input: array of Byte; const InputLen: Cardinal);
     procedure    Transform;
     {$ifdef VER120}
     procedure    SubroundF(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
     procedure    SubroundG(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
     procedure    SubroundH(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
     procedure    SubroundI(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
     procedure    SubroundJ(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
     procedure    Encode(var Output: array of Byte; Input: array of Cardinal; Length: integer);
     procedure    Decode(var Output: array of Cardinal; Input: array of Byte; Length: integer);
     {$else}
     procedure    SubroundF(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
     procedure    SubroundG(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
     procedure    SubroundH(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
     procedure    SubroundI(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
     procedure    SubroundJ(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
     procedure    Encode(var Output: array of Byte; Input: array of integer; Length: integer);
     procedure    Decode(var Output: array of integer; Input: array of Byte; Length: integer);
     {$endif}
  public
     procedure    Init;
     procedure    HashByte  (const ByteToHash: Byte);
     procedure    HashString(const StringToHash: String);
     procedure    HashFile  (const FileName: String);
     procedure    HashStream(const Stream: TStream);
     function     Finish: TDigest;
     function     GetHashString: string;
     function     GetVersion: string;
  end;


implementation

const
     RELVER = '1.11b';

{*******************************************************************************
* Procedure : GetVersion                                                       *
********************************************************************************
* Purpose   : Returns the internal version number of the component             *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : String - the version number expressed as a string                *
*******************************************************************************}
function TRipeMD.GetVersion;
begin
     // return the version string
     Result := RELVER;

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
* Procedure : Init                                                             *
********************************************************************************
* Purpose   : Reloads the internal state variables with the inital vector      *
********************************************************************************
* Paramters :None                                                              *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TRipeMD.Init;
begin
     // if the component has not been registered, remind the user occasionally
     // that he should do this and set the property so that we can see this


     Fcontext.count[0] := 0;
     Fcontext.count[1] := 0;

     Fcontext.State[0] := $67452301;
     Fcontext.State[1] := $efcdab89;
     Fcontext.State[2] := $98badcfe;
     Fcontext.State[3] := $10325476;
     Fcontext.State[4] := $c3d2e1f0;
end;

{*******************************************************************************
* Procedure : HashString                                                       *
********************************************************************************
* Purpose   : Hashes the characters of a Delphi string                         *
********************************************************************************
* Paramters : StringToHash: The string to be added to the hash                 *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TRipeMD.HashString(const StringToHash: String);
const
     MAX_BUFFER = 2048;
var
     Buffer: array[0..MAX_BUFFER-1] of Byte;
     Index: integer;
begin
     // initialise the position counters
     FillChar(Buffer, Sizeof(Buffer), 0);
     Index := 0;

     // do the bulk of the string
     while Length(StringToHash) - Index > MAX_BUFFER do
     begin
          Move(StringToHash[Index], Buffer, MAX_BUFFER);
          Update(Buffer[0], MAX_BUFFER);
     end;

     // do the trailing bytes
     FillChar(Buffer, Sizeof(Buffer), 0);
     Move(StringToHash[Index+1], Buffer, Length(StringToHash)-Index);
     Update(Buffer, Length(StringToHash)-Index);
end; {TRipeMD.HashString}

{*******************************************************************************
* Procedure : HashByte                                                         *
********************************************************************************
* Purpose   : Hashes a single byte                                             *
********************************************************************************
* Paramters : BateToHash: The string to be added to the hash                   *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TRipeMD.HashByte(const ByteToHash: Byte);
begin
     Update(ByteToHash, 1);
end; {TRipeMD.HashByte}

{*******************************************************************************
* Procedure : HashFile                                                         *
********************************************************************************
* Purpose   : Adds the contents of a given file to the hash                    *
********************************************************************************
* Paramters : Filename - the file to be added to the hash                      *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TRipeMD.HashFile(const FileName: String);
const
     MAX_BUFFER = 2048;
var
     filestream: TFileStream;
     Buffer: array[0..MAX_BUFFER-1] of Byte;
     BytesRead: Integer;
     Continue: Boolean;
begin
     Continue := False;
     FillChar(Buffer, Sizeof(Buffer), 0);

     filestream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
     try
          BytesRead := filestream.Read(Buffer, MAX_BUFFER);
          if BytesRead > 0 then Continue := True;
          while (Continue) do
          begin
               if BytesRead < MAX_BUFFER then Continue := False;
               Update(Buffer, BytesRead);
               BytesRead := filestream.Read(Buffer, MAX_BUFFER);
          end;
     finally
          filestream.Free;
     end;
end; {TRipeMD.HashFile}

{*******************************************************************************
* Procedure : HashStream                                                       *
********************************************************************************
* Purpose   : Adds the contents of a stream to the hash                        *
********************************************************************************
* Paramters : Stream - the stream to be added to the hash                      *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TRipeMD.HashStream(const Stream: TStream);
const
     MAX_BUFFER = 2048;
var
     Buffer: array[0..MAX_BUFFER-1] of Char;
     BytesRead: Integer;
     Continue: Boolean;
     i: integer;
begin
     Continue := False;
     FillChar(Buffer, Sizeof(Buffer), 0);

     try
          BytesRead := Stream.Read(Buffer, MAX_BUFFER);

          if BytesRead > 0 then
          begin
               Continue := True;
          end;

          while (Continue) do
          begin
               if BytesRead < MAX_BUFFER then
               begin
                    Continue := False;
               end;

               for i := 0 to BytesRead-1 do
               begin
                    HashByte(Ord(Buffer[i]));
               end;

               BytesRead := Stream.Read(Buffer, MAX_BUFFER);

          end;
     except
          raise Exception.Create('Invalid Stream Object');
     end;
end; {TRipeMD.HashStream}

{*******************************************************************************
* Procedure : Update                                                           *
********************************************************************************
* Purpose   : Adds bytes to the internal hash                                  *
********************************************************************************
* Paramters : Input - the bytes to be added to the hash                        *
*             InputLen - the length of the buffer which is to be added         *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TRipeMD.Update(const input: Array of Byte; const InputLen: Cardinal);
var
     index: integer;
     partLen: Cardinal;
     i: Cardinal;
begin
     // Compute number of bytes mod 64
     index := ((Fcontext.count[0] shr 3) and $3F);

     // Update number of bits
     Fcontext.count[0] := Fcontext.count[0] + (inputLen shl 3);
     if Fcontext.count[0] < (inputLen shl 3) then
          Inc(Fcontext.count[1]);
     Fcontext.count[1] := Fcontext.count[1] + (inputLen shr 29);

     partLen := 64 - index;

     // Transform as many times as necessary, each time
     // adding a block of up to 64 bytes
     if (inputLen >= partLen) then
     begin
          Move(input, Fcontext.Buffer[index], partLen);
          Move(FContext.Buffer, FContext.Block, 64);
          Transform;

          i := partLen;
          while (i + 63) < inputLen do
          begin
               move(input[i], Fcontext.buffer, 64);
               Move(FContext.Buffer, FContext.Block, 64);
               Transform;
               Inc(i,64);
          end;
          index := 0;
     end
     else
     begin
          i := 0;
     end;

     // Buffer remaining input
     move(input[i], Fcontext.buffer[index], inputLen-i);
end; {TRipeMD.Update}

{*******************************************************************************
* Procedure : Finish                                                           *
********************************************************************************
* Purpose   : Finalises the hash and burns the context                         *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : Digest of the message                                            *
*******************************************************************************}
function TRipeMD.Finish: TDigest;
(*var
     Bits: array[0..7] of Byte;
     index: integer;
     padLen: integer;
     shifter: integer;*)
var
     bits: array[0..7] of Byte;
     index: integer;
     padLen: integer;
     padding: array[0..63] of Byte;
     i: integer;
     temp: array[0..19] of Byte;
begin
     // Save number of bits
     Encode (bits, Fcontext.count, 8);

     // Pad out to 56 mod 64.
     index := ((Fcontext.count[0] shr 3) and $3f);

     if index < 56 then
     begin
          padLen := (56-index);
     end
     else
     begin
          padLen := (120-index);
     end;

     FillChar(Padding, SizeOf(Padding), #0);
     Padding[0] := $80;

     Update (padding, padLen);

     // add the length into the hash and close. Adding
     // these last 8 bytes in triggers the final transformation
     FillChar(Padding, SizeOf(Padding), #0);
     Move(Bits, Padding, 8);
     Update (Padding, 8);


     // Store state in digest
     Encode (temp, Fcontext.state, 20);

     for i := 0 to 19 do
     begin
          Fdigest[i] := temp[i];
     end;

     Result := FDigest;

     // Zeroize sensitive information.
     FillChar(Fcontext.Buffer, sizeof(Fcontext.Buffer), #0);
end; {TRipeMD.Finish}

{*******************************************************************************
* Procedure : GetHashString                                                    *
********************************************************************************
* Purpose   : Returns the hash as a string after it has been created with      *
*             'Finish'                                                         *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : String - the hash expressed as a hex string                      *
*******************************************************************************}
function TRipeMD.GetHashString: String;
var
     i: Byte;
begin
     Result := '';
     for i := 0 to 19 do
     begin
          Result := Result + IntToHex(Ord(FDigest[i]),2);
     end;
end; {TRipeMD.GetHashString}

{*******************************************************************************
* Procedure : Transform                                                        *
********************************************************************************
* Purpose   : Performs 1 transform, i.e. 4 rounds of 20 operations on a full   *
*             input block of 64 bytes. The input block is padded on call of    *
*             'Final'.                                                         *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TRipeMD.Transform;
var
     {$ifdef VER120}
     a1: Cardinal;
     b1: Cardinal;
     c1: Cardinal;
     d1: Cardinal;
     e1: Cardinal;
     a2: Cardinal;
     b2: Cardinal;
     c2: Cardinal;
     d2: Cardinal;
     e2: Cardinal;
     x: array[0..15] of Cardinal;
     {$else}
     a1: integer;
     b1: integer;
     c1: integer;
     d1: integer;
     e1: integer;
     a2: integer;
     b2: integer;
     c2: integer;
     d2: integer;
     e2: integer;
     x: array[0..15] of integer;
     {$endif}
begin
     a1 := Fcontext.State[0];
     b1 := Fcontext.State[1];
     c1 := Fcontext.State[2];
     d1 := Fcontext.State[3];
     e1 := Fcontext.State[4];

     a2 := Fcontext.State[0];
     b2 := Fcontext.State[1];
     c2 := Fcontext.State[2];
     d2 := Fcontext.State[3];
     e2 := Fcontext.State[4];

     Decode (x, FContext.Buffer, 64);

     SubroundF(a1, b1, c1, d1, e1, X[ 0], 11, 0);
     SubroundF(e1, a1, b1, c1, d1, X[ 1], 14, 0);
     SubroundF(d1, e1, a1, b1, c1, X[ 2], 15, 0);
     SubroundF(c1, d1, e1, a1, b1, X[ 3], 12, 0);
     SubroundF(b1, c1, d1, e1, a1, X[ 4],  5, 0);
     SubroundF(a1, b1, c1, d1, e1, X[ 5],  8, 0);
     SubroundF(e1, a1, b1, c1, d1, X[ 6],  7, 0);
     SubroundF(d1, e1, a1, b1, c1, X[ 7],  9, 0);
     SubroundF(c1, d1, e1, a1, b1, X[ 8], 11, 0);
     SubroundF(b1, c1, d1, e1, a1, X[ 9], 13, 0);
     SubroundF(a1, b1, c1, d1, e1, X[10], 14, 0);
     SubroundF(e1, a1, b1, c1, d1, X[11], 15, 0);
     SubroundF(d1, e1, a1, b1, c1, X[12],  6, 0);
     SubroundF(c1, d1, e1, a1, b1, X[13],  7, 0);
     SubroundF(b1, c1, d1, e1, a1, X[14],  9, 0);
     SubroundF(a1, b1, c1, d1, e1, X[15],  8, 0);

     SubroundG(e1, a1, b1, c1, d1, X[ 7],  7, $5a827999);
     SubroundG(d1, e1, a1, b1, c1, X[ 4],  6, $5a827999);
     SubroundG(c1, d1, e1, a1, b1, X[13],  8, $5a827999);
     SubroundG(b1, c1, d1, e1, a1, X[ 1], 13, $5a827999);
     SubroundG(a1, b1, c1, d1, e1, X[10], 11, $5a827999);
     SubroundG(e1, a1, b1, c1, d1, X[ 6],  9, $5a827999);
     SubroundG(d1, e1, a1, b1, c1, X[15],  7, $5a827999);
     SubroundG(c1, d1, e1, a1, b1, X[ 3], 15, $5a827999);
     SubroundG(b1, c1, d1, e1, a1, X[12],  7, $5a827999);
     SubroundG(a1, b1, c1, d1, e1, X[ 0], 12, $5a827999);
     SubroundG(e1, a1, b1, c1, d1, X[ 9], 15, $5a827999);
     SubroundG(d1, e1, a1, b1, c1, X[ 5],  9, $5a827999);
     SubroundG(c1, d1, e1, a1, b1, X[ 2], 11, $5a827999);
     SubroundG(b1, c1, d1, e1, a1, X[14],  7, $5a827999);
     SubroundG(a1, b1, c1, d1, e1, X[11], 13, $5a827999);
     SubroundG(e1, a1, b1, c1, d1, X[ 8], 12, $5a827999);

     SubroundH(d1, e1, a1, b1, c1, X[ 3], 11, $6ed9eba1);
     SubroundH(c1, d1, e1, a1, b1, X[10], 13, $6ed9eba1);
     SubroundH(b1, c1, d1, e1, a1, X[14],  6, $6ed9eba1);
     SubroundH(a1, b1, c1, d1, e1, X[ 4],  7, $6ed9eba1);
     SubroundH(e1, a1, b1, c1, d1, X[ 9], 14, $6ed9eba1);
     SubroundH(d1, e1, a1, b1, c1, X[15],  9, $6ed9eba1);
     SubroundH(c1, d1, e1, a1, b1, X[ 8], 13, $6ed9eba1);
     SubroundH(b1, c1, d1, e1, a1, X[ 1], 15, $6ed9eba1);
     SubroundH(a1, b1, c1, d1, e1, X[ 2], 14, $6ed9eba1);
     SubroundH(e1, a1, b1, c1, d1, X[ 7],  8, $6ed9eba1);
     SubroundH(d1, e1, a1, b1, c1, X[ 0], 13, $6ed9eba1);
     SubroundH(c1, d1, e1, a1, b1, X[ 6],  6, $6ed9eba1);
     SubroundH(b1, c1, d1, e1, a1, X[13],  5, $6ed9eba1);
     SubroundH(a1, b1, c1, d1, e1, X[11], 12, $6ed9eba1);
     SubroundH(e1, a1, b1, c1, d1, X[ 5],  7, $6ed9eba1);
     SubroundH(d1, e1, a1, b1, c1, X[12],  5, $6ed9eba1);

     SubroundI(c1, d1, e1, a1, b1, X[ 1], 11, $8f1bbcdc);
     SubroundI(b1, c1, d1, e1, a1, X[ 9], 12, $8f1bbcdc);
     SubroundI(a1, b1, c1, d1, e1, X[11], 14, $8f1bbcdc);
     SubroundI(e1, a1, b1, c1, d1, X[10], 15, $8f1bbcdc);
     SubroundI(d1, e1, a1, b1, c1, X[ 0], 14, $8f1bbcdc);
     SubroundI(c1, d1, e1, a1, b1, X[ 8], 15, $8f1bbcdc);
     SubroundI(b1, c1, d1, e1, a1, X[12],  9, $8f1bbcdc);
     SubroundI(a1, b1, c1, d1, e1, X[ 4],  8, $8f1bbcdc);
     SubroundI(e1, a1, b1, c1, d1, X[13],  9, $8f1bbcdc);
     SubroundI(d1, e1, a1, b1, c1, X[ 3], 14, $8f1bbcdc);
     SubroundI(c1, d1, e1, a1, b1, X[ 7],  5, $8f1bbcdc);
     SubroundI(b1, c1, d1, e1, a1, X[15],  6, $8f1bbcdc);
     SubroundI(a1, b1, c1, d1, e1, X[14],  8, $8f1bbcdc);
     SubroundI(e1, a1, b1, c1, d1, X[ 5],  6, $8f1bbcdc);
     SubroundI(d1, e1, a1, b1, c1, X[ 6],  5, $8f1bbcdc);
     SubroundI(c1, d1, e1, a1, b1, X[ 2], 12, $8f1bbcdc);

     SubroundJ(b1, c1, d1, e1, a1, X[ 4],  9, $a953fd4e);
     SubroundJ(a1, b1, c1, d1, e1, X[ 0], 15, $a953fd4e);
     SubroundJ(e1, a1, b1, c1, d1, X[ 5],  5, $a953fd4e);
     SubroundJ(d1, e1, a1, b1, c1, X[ 9], 11, $a953fd4e);
     SubroundJ(c1, d1, e1, a1, b1, X[ 7],  6, $a953fd4e);
     SubroundJ(b1, c1, d1, e1, a1, X[12],  8, $a953fd4e);
     SubroundJ(a1, b1, c1, d1, e1, X[ 2], 13, $a953fd4e);
     SubroundJ(e1, a1, b1, c1, d1, X[10], 12, $a953fd4e);
     SubroundJ(d1, e1, a1, b1, c1, X[14],  5, $a953fd4e);
     SubroundJ(c1, d1, e1, a1, b1, X[ 1], 12, $a953fd4e);
     SubroundJ(b1, c1, d1, e1, a1, X[ 3], 13, $a953fd4e);
     SubroundJ(a1, b1, c1, d1, e1, X[ 8], 14, $a953fd4e);
     SubroundJ(e1, a1, b1, c1, d1, X[11], 11, $a953fd4e);
     SubroundJ(d1, e1, a1, b1, c1, X[ 6],  8, $a953fd4e);
     SubroundJ(c1, d1, e1, a1, b1, X[15],  5, $a953fd4e);
     SubroundJ(b1, c1, d1, e1, a1, X[13],  6, $a953fd4e);

     SubroundJ(a2, b2, c2, d2, e2, X[ 5],  8, $50a28be6);
     SubroundJ(e2, a2, b2, c2, d2, X[14],  9, $50a28be6);
     SubroundJ(d2, e2, a2, b2, c2, X[ 7],  9, $50a28be6);
     SubroundJ(c2, d2, e2, a2, b2, X[ 0], 11, $50a28be6);
     SubroundJ(b2, c2, d2, e2, a2, X[ 9], 13, $50a28be6);
     SubroundJ(a2, b2, c2, d2, e2, X[ 2], 15, $50a28be6);
     SubroundJ(e2, a2, b2, c2, d2, X[11], 15, $50a28be6);
     SubroundJ(d2, e2, a2, b2, c2, X[ 4],  5, $50a28be6);
     SubroundJ(c2, d2, e2, a2, b2, X[13],  7, $50a28be6);
     SubroundJ(b2, c2, d2, e2, a2, X[ 6],  7, $50a28be6);
     SubroundJ(a2, b2, c2, d2, e2, X[15],  8, $50a28be6);
     SubroundJ(e2, a2, b2, c2, d2, X[ 8], 11, $50a28be6);
     SubroundJ(d2, e2, a2, b2, c2, X[ 1], 14, $50a28be6);
     SubroundJ(c2, d2, e2, a2, b2, X[10], 14, $50a28be6);
     SubroundJ(b2, c2, d2, e2, a2, X[ 3], 12, $50a28be6);
     SubroundJ(a2, b2, c2, d2, e2, X[12],  6, $50a28be6);

     SubroundI(e2, a2, b2, c2, d2, X[ 6],  9, $5c4dd124);
     SubroundI(d2, e2, a2, b2, c2, X[11], 13, $5c4dd124);
     SubroundI(c2, d2, e2, a2, b2, X[ 3], 15, $5c4dd124);
     SubroundI(b2, c2, d2, e2, a2, X[ 7],  7, $5c4dd124);
     SubroundI(a2, b2, c2, d2, e2, X[ 0], 12, $5c4dd124);
     SubroundI(e2, a2, b2, c2, d2, X[13],  8, $5c4dd124);
     SubroundI(d2, e2, a2, b2, c2, X[ 5],  9, $5c4dd124);
     SubroundI(c2, d2, e2, a2, b2, X[10], 11, $5c4dd124);
     SubroundI(b2, c2, d2, e2, a2, X[14],  7, $5c4dd124);
     SubroundI(a2, b2, c2, d2, e2, X[15],  7, $5c4dd124);
     SubroundI(e2, a2, b2, c2, d2, X[ 8], 12, $5c4dd124);
     SubroundI(d2, e2, a2, b2, c2, X[12],  7, $5c4dd124);
     SubroundI(c2, d2, e2, a2, b2, X[ 4],  6, $5c4dd124);
     SubroundI(b2, c2, d2, e2, a2, X[ 9], 15, $5c4dd124);
     SubroundI(a2, b2, c2, d2, e2, X[ 1], 13, $5c4dd124);
     SubroundI(e2, a2, b2, c2, d2, X[ 2], 11, $5c4dd124);

     SubroundH(d2, e2, a2, b2, c2, X[15],  9, $6d703ef3);
     SubroundH(c2, d2, e2, a2, b2, X[ 5],  7, $6d703ef3);
     SubroundH(b2, c2, d2, e2, a2, X[ 1], 15, $6d703ef3);
     SubroundH(a2, b2, c2, d2, e2, X[ 3], 11, $6d703ef3);
     SubroundH(e2, a2, b2, c2, d2, X[ 7],  8, $6d703ef3);
     SubroundH(d2, e2, a2, b2, c2, X[14],  6, $6d703ef3);
     SubroundH(c2, d2, e2, a2, b2, X[ 6],  6, $6d703ef3);
     SubroundH(b2, c2, d2, e2, a2, X[ 9], 14, $6d703ef3);
     SubroundH(a2, b2, c2, d2, e2, X[11], 12, $6d703ef3);
     SubroundH(e2, a2, b2, c2, d2, X[ 8], 13, $6d703ef3);
     SubroundH(d2, e2, a2, b2, c2, X[12],  5, $6d703ef3);
     SubroundH(c2, d2, e2, a2, b2, X[ 2], 14, $6d703ef3);
     SubroundH(b2, c2, d2, e2, a2, X[10], 13, $6d703ef3);
     SubroundH(a2, b2, c2, d2, e2, X[ 0], 13, $6d703ef3);
     SubroundH(e2, a2, b2, c2, d2, X[ 4],  7, $6d703ef3);
     SubroundH(d2, e2, a2, b2, c2, X[13],  5, $6d703ef3);

     SubroundG(c2, d2, e2, a2, b2, X[ 8], 15, $7a6d76e9);
     SubroundG(b2, c2, d2, e2, a2, X[ 6],  5, $7a6d76e9);
     SubroundG(a2, b2, c2, d2, e2, X[ 4],  8, $7a6d76e9);
     SubroundG(e2, a2, b2, c2, d2, X[ 1], 11, $7a6d76e9);
     SubroundG(d2, e2, a2, b2, c2, X[ 3], 14, $7a6d76e9);
     SubroundG(c2, d2, e2, a2, b2, X[11], 14, $7a6d76e9);
     SubroundG(b2, c2, d2, e2, a2, X[15],  6, $7a6d76e9);
     SubroundG(a2, b2, c2, d2, e2, X[ 0], 14, $7a6d76e9);
     SubroundG(e2, a2, b2, c2, d2, X[ 5],  6, $7a6d76e9);
     SubroundG(d2, e2, a2, b2, c2, X[12],  9, $7a6d76e9);
     SubroundG(c2, d2, e2, a2, b2, X[ 2], 12, $7a6d76e9);
     SubroundG(b2, c2, d2, e2, a2, X[13],  9, $7a6d76e9);
     SubroundG(a2, b2, c2, d2, e2, X[ 9], 12, $7a6d76e9);
     SubroundG(e2, a2, b2, c2, d2, X[ 7],  5, $7a6d76e9);
     SubroundG(d2, e2, a2, b2, c2, X[10], 15, $7a6d76e9);
     SubroundG(c2, d2, e2, a2, b2, X[14],  8, $7a6d76e9);

     SubroundF(b2, c2, d2, e2, a2, X[12],  8, 0);
     SubroundF(a2, b2, c2, d2, e2, X[15],  5, 0);
     SubroundF(e2, a2, b2, c2, d2, X[10], 12, 0);
     SubroundF(d2, e2, a2, b2, c2, X[ 4],  9, 0);
     SubroundF(c2, d2, e2, a2, b2, X[ 1], 12, 0);
     SubroundF(b2, c2, d2, e2, a2, X[ 5],  5, 0);
     SubroundF(a2, b2, c2, d2, e2, X[ 8], 14, 0);
     SubroundF(e2, a2, b2, c2, d2, X[ 7],  6, 0);
     SubroundF(d2, e2, a2, b2, c2, X[ 6],  8, 0);
     SubroundF(c2, d2, e2, a2, b2, X[ 2], 13, 0);
     SubroundF(b2, c2, d2, e2, a2, X[13],  6, 0);
     SubroundF(a2, b2, c2, d2, e2, X[14],  5, 0);
     SubroundF(e2, a2, b2, c2, d2, X[ 0], 15, 0);
     SubroundF(d2, e2, a2, b2, c2, X[ 3], 13, 0);
     SubroundF(c2, d2, e2, a2, b2, X[ 9], 11, 0);
     SubroundF(b2, c2, d2, e2, a2, X[11], 11, 0);

     c1                := Fcontext.State[1] + c1 + d2;
     Fcontext.State[1] := Fcontext.State[2] + d1 + e2;
     Fcontext.State[2] := Fcontext.State[3] + e1 + a2;
     Fcontext.State[3] := Fcontext.State[4] + a1 + b2;
     Fcontext.State[4] := Fcontext.State[0] + b1 + c2;
     Fcontext.State[0] := c1;
end; {TRipeMD.Transform}

{*******************************************************************************
* Procedure : SubroundF                                                        *
********************************************************************************
* Purpose   : Defines the "F" subround.                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef VER120}
procedure TRipeMD.SubroundF(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
{$else}
procedure TRipeMD.SubroundF(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
{$endif}
begin
     // #define F(x, y, z)    (x ^ y ^ z)
     // a += f(b, c, d) + x + k;\
     a := a + (b xor c xor d) + x + k;

     // a = rotl((word32)a, (unsigned int)s) + e;\
     a := (a shl s) or (a shr (32-s)) + e;

     // c = rotl((word32)c, 10U)
     c := (c shl 10) or (c shr (32-10));
end; {TRipeMD.SubroundF}

{*******************************************************************************
* Procedure : SubroundG                                                        *
********************************************************************************
* Purpose   : Defines the "G" subround.                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef VER120}
procedure TRipeMD.SubroundG(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
{$else}
procedure TRipeMD.SubroundG(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
{$endif}
begin
     // #define G(x, y, z)    (z ^ (x & (y^z)))
     // a += f(b, c, d) + x + k;\
     a := a + (d xor (b and (c xor d))) + x + k;

     // a = rotl((word32)a, (unsigned int)s) + e;\
     a := (a shl s) or (a shr (32-s)) + e;

     // c = rotl((word32)c, 10U)
     c := (c shl 10) or (c shr (32-10));
end; {TRipeMD.SubroundG}

{*******************************************************************************
* Procedure : SubroundH                                                        *
********************************************************************************
* Purpose   : Defines the "H" subround.                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef VER120}
procedure TRipeMD.SubroundH(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
{$else}
procedure TRipeMD.SubroundH(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
{$endif}
begin
     // #define H(x, y, z)    (z ^ (x | ~y))
     // a += f(b, c, d) + x + k;\
     a := a + (d xor (b or (not c))) + x + k;

     // a = rotl((word32)a, (unsigned int)s) + e;\
     a := (a shl s) or (a shr (32-s)) + e;

     // c = rotl((word32)c, 10U)
     c := (c shl 10) or (c shr (32-10));
end; {TRipeMD.SubroundH}

{*******************************************************************************
* Procedure : SubroundI                                                        *
********************************************************************************
* Purpose   : Defines the "I" subround.                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef VER120}
procedure TRipeMD.SubroundI(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
{$else}
procedure TRipeMD.SubroundI(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
{$endif}
begin
     // #define I(x, y, z)    (y ^ (z & (x^y)))
     // a += f(b, c, d) + x + k;\
     a := a + (c xor (d and (b xor c))) + x + k;

     // a = rotl((word32)a, (unsigned int)s) + e;\
     a := (a shl s) or (a shr (32-s)) + e;

     // c = rotl((word32)c, 10U)
     c := (c shl 10) or (c shr (32-10));
end; {TRipeMD.SubroundI}

{*******************************************************************************
* Procedure : SubroundJ                                                        *
********************************************************************************
* Purpose   : Defines the "J" subround.                                        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef VER120}
procedure TRipeMD.SubroundJ(var a: Cardinal;
                                b: Cardinal;
                            var c: Cardinal;
                                d: Cardinal;
                                e: Cardinal;
                                x: Cardinal;
                                s: Cardinal;
                                k: Cardinal);
{$else}
procedure TRipeMD.SubroundJ(var a: integer;
                                b: integer;
                            var c: integer;
                                d: integer;
                                e: integer;
                                x: integer;
                                s: integer;
                                k: integer);
{$endif}
begin
     // #define J(x, y, z)    (x ^ (y | ~z))
     // a += f(b, c, d) + x + k;\
     a := a + (b xor (c or (not d))) + x + k;

     // a = rotl((word32)a, (unsigned int)s) + e;\
     a := (a shl s) or (a shr (32-s)) + e;

     // c = rotl((word32)c, 10U)
     c := (c shl 10) or (c shr (32-10));
end; {TRipeMD.SubroundJ}

{*******************************************************************************
* Procedure : Encode                                                           *
********************************************************************************
* Purpose   : Encodes an array of 32bit integers into bytes, taking care of    *
*             endianness. Assumes that Length is a multiple of 4               *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef VER120}
procedure TRipeMD.Encode(var Output: array of Byte; Input: array of Cardinal; Length: integer);
{$else}
procedure TRipeMD.Encode(var Output: array of Byte; Input: array of integer; Length: integer);
{$endif}
var
     i: integer;
     j: integer;
begin
     i := 0;
     j := 0;

     while (j < Length) do
     begin
          output[j]   := (input[i] and $ff);
          output[j+1] := ((input[i] shr 8)  and $ff);
          output[j+2] := ((input[i] shr 16) and $ff);
          output[j+3] := ((input[i] shr 24) and $ff);
          Inc(i);
          Inc(j,4);
     end;
end; {TripeMD.Encode}

{*******************************************************************************
* Procedure : Decode                                                           *
********************************************************************************
* Purpose   : Encodes an array of bytes into 32 bit integers, taking care of   *
*             endianness. Assumes that Length is a multiple of 4               *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef VER120}
procedure TRipeMD.Decode(var Output: array of Cardinal; Input: array of Byte; Length: integer);
{$else}
procedure TRipeMD.Decode(var Output: array of integer; Input: array of Byte; Length: integer);
{$endif}
var
     i: integer;
     j: integer;
begin
     i := 0;
     j := 0;

     while (j < Length) do
     begin
         Output[i] := (Input[j]) or ((input[j+1]) shl 8) or
                       ((input[j+2]) shl 16) or ((input[j+3]) shl 24);
          Inc(i);
          Inc(j,4);
     end;
end; {TRipeMD.Decode}

end.
