{******************************************************************************}
{                                                                              }
{ Project JEDI Code Library (JCL)                                              }
{                                                                              }
{ The contents of this file are subject to the Mozilla Public License Version  }
{ 1.1 (the "License"); you may not use this file except in compliance with the }
{ License. You may obtain a copy of the License at http://www.mozilla.org/MPL/ }
{                                                                              }
{ Software distributed under the License is distributed on an "AS IS" basis,   }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for }
{ the specific language governing rights and limitations under the License.    }
{                                                                              }
{ The Original Code is JclExcel.pas.                                           }
{                                                                              }
{ The Initial Developer of the Original Code is documented in the accompanying }
{ help file JCL.chm. Portions created by these individuals are Copyright (C)   }
{ of these individuals.                                                        }
{                                                                              }
{ Last modified: January 18, 2001                                              }
{                                                                              }
{******************************************************************************}

unit JclExcel;

{$I JCL.INC}

{$WEAKPACKAGEUNIT ON}

interface

uses
  Classes;

type
  TJclExcelWriter = class (TObject)
  private
    FStream: TStream;
  public
    constructor Create(const Stream: TStream);
    procedure WriteBOF;
    procedure WriteEOF;
    procedure WriteBLANK(const Col, Row: Word;
      const XF: Word {$IFDEF SUPPORTS_DEFAULTPARAMS} = 0 {$ENDIF});
    procedure WriteLABEL(const Data: AnsiString; const Col, Row: Word;
      const XF: Word {$IFDEF SUPPORTS_DEFAULTPARAMS} = 0 {$ENDIF});
    procedure WriteNUMBER(const Data: Double; const Col, Row: Word;
      const XF: Word {$IFDEF SUPPORTS_DEFAULTPARAMS} = 0 {$ENDIF});
    procedure WriteBOOL(const Data: Boolean; const Col, Row: Word;
      const XF: Word {$IFDEF SUPPORTS_DEFAULTPARAMS} = 0 {$ENDIF});
    procedure WriteERROR(const Data: Byte; const Col, Row: Word;
      const XF: Word {$IFDEF SUPPORTS_DEFAULTPARAMS} = 0 {$ENDIF});
  end;

implementation

//==============================================================================
// Excel file format constants and structures
//==============================================================================

// BOF: Beginning of File (809h)

const
  CXlsBOF = $809;

type
  TXlsBOF = packed record
    recNo: Word;        // Record number
    recSize: Word;      // Record size

    vers: Word;         // Version number (0500 for BIFF5 and BIFF7)
    dt: Word;           // Substream type: 0005h = Workbook globals
                        //                 0006h = Visual Basic module
                        //                 0010h = Worksheet or dialog sheet
                        //                 0020h = Chart
                        //                 0040h = Microsoft Excel 4.0 macro sheet
                        //                 0100h = Workspace file
    rupBuild: Word;     // Build identifier (internal use only)
    rupYear: Word;      // Build year (internal use only)
  end;

// EOF: End of File (0Ah)

const
  CXlsEOF = $0A;

type
  TXlsEOF = packed record
    recNo: Word;        // Record number
    res1: Word;
  end;

// LABEL: Cell Value, String Constant (204h)

// A LABEL record describes a cell that contains a string constant.
// The rw field contains the 0-based row number.
// The col field contains the 0-based column number.
// The string length is contained in the cch field and must be in the range of
// 0000h..00FFh (0..255). The string itself is contained in the rgch field.

const
  CXlsLABEL = $204;

type
  TXlsLABEL = packed record
    recNo: Word;        // Record number
    recSize: Word;      // Record size
    rw: Word;           // Cell Row
    col: Word;          // Cell Col
    ixfe: Word;         // Index to the XF record
    cch: Word;          // Length of the string
   (* rgch: var *)      // The string
  end;

// BLANK: Cell Value, Blank Cell (201h)

// A BLANK record describes an empty cell.
// The rw field contains the 0-based row number.
// The col field contains the 0-based column number.

const
  CXlsBLANK = $201;

type
  TXlsBLANK = packed record
    recNo: Word;        // Record number
    recSize: Word;      // Record size
    rw: Word;           // Cell Row
    col: Word;          // Cell Col
    ixfe: Word;         // Index to the XF record
  end;

// NUMBER: Cell Value, Floating-Point Number (203h)

// A NUMBER record describes a cell containing a constant floating-point number.
// The rw field contains the 0-based row number.
// The col field contains the 0-based column number.
// The number is contained in the num field in 8-byte IEEE floating-point format.

const
  CXlsNUMBER = $203;

type
  TXlsNUMBER = packed record
    recNo: Word;        // Record number
    recSize: Word;      // Record size
    rw: Word;           // Cell Row
    col: Word;          // Cell Col
    ixfe: Word;         // Index to the XF record
    num: Double;        // Floating-point number value
  end;

// BOOLERR: Cell Value, Boolean or Error (205h)

// A BOOLERR record describes a cell that contains a constant Boolean or error value.
// The rw field contains the 0-based row number.
// The col field contains the 0-based column number.

const
  CXlsBOOLERR = $205;

type
  TXlsBOOLERR = packed record
    recNo: Word;        // Record number
    recSize: Word;      // Record size
    rw: Word;           // Cell Row
    col: Word;          // Cell Col
    ixfe: Word;         // Index to the XF record
    bBoolErr: Byte;     // Boolean value or error value
    fError: Byte;       // Boolean/error flag
  end;

// The bBoolErr field contains the Boolean or error value,
// as determined by the fError field. If the fError field contains a 0 (zero),
// the bBoolErr field contains a Boolean value; if the fError field contains a 1,
// the bBoolErr field contains an error value.
//
// Boolean values are 1 for true and 0 for false.
//
// Error values are listed in the following table.
//
// Error value   Value (hex)   Value (dec.)
// -----------------------------------------
// #NULL!        00h           00d
// #DIV/0!       07h           07d
// #VALUE!       0Fh           15d
// #REF!         17h           23d
// #NAME?        1Dh           29d
// #NUM!         24h           36d
// #N/A          2Ah           42d

//==============================================================================
// TJclExcelWriter
//==============================================================================

constructor TJclExcelWriter.Create(const Stream: TStream);
begin
  FStream := Stream;
end;

//------------------------------------------------------------------------------

procedure TJclExcelWriter.WriteBLANK(const Col, Row, XF: Word);
var
  CDefXlsBLANK: TXlsBLANK;
begin
  CDefXlsBLANK.recNo := CXlsBLANK;
  CDefXlsBLANK.recSize := SizeOf(TXlsBLANK) - 2 * SizeOf(Word);
  CDefXlsBLANK.rw := Row;
  CDefXlsBLANK.col := Col;
  CDefXlsBLANK.ixfe := XF;
  FStream.WriteBuffer(CDefXlsBLANK, SizeOf(CDefXlsBLANK));
end;

//------------------------------------------------------------------------------

procedure TJclExcelWriter.WriteBOF;
const
  CDefXlsBOF: TXlsBOF =
    (recNo: CXlsBOF;
     recSize: SizeOf(TXlsBOF) - 2 * SizeOf(Word);
     vers: 0;
     dt: $10;
     rupBuild: 0;
     rupYear: 0);
begin
  FStream.WriteBuffer(CDefXlsBOF, SizeOf(CDefXlsBOF));
end;

//------------------------------------------------------------------------------

procedure TJclExcelWriter.WriteBOOL(const Data: Boolean; const Col, Row, XF: Word);
const
  Values: array [Boolean] of Byte = (0, 1);
var
  CDefXlsBOOLERR: TXlsBOOLERR;
begin
  CDefXlsBOOLERR.recNo := CXlsBOOLERR;
  CDefXlsBOOLERR.recSize := SizeOf(TXlsBOOLERR) - 2 * SizeOf(Word);
  CDefXlsBOOLERR.rw  := Row;
  CDefXlsBOOLERR.col := Col;
  CDefXlsBOOLERR.ixfe := XF;
  CDefXlsBOOLERR.bBoolErr := Values[Data];
  CDefXlsBOOLERR.fError := 0;
  FStream.WriteBuffer(CDefXlsBOOLERR, SizeOf(CDefXlsBOOLERR));
end;

//------------------------------------------------------------------------------

procedure TJclExcelWriter.WriteEOF;
const
  CDefXlsEOF: TXlsEOF =
    (recNo: CXlsEOF;
     res1: 0);
begin
  FStream.WriteBuffer(CDefXlsEOF, SizeOf(CDefXlsEOF));
end;

//------------------------------------------------------------------------------

procedure TJclExcelWriter.WriteERROR(const Data: Byte; const Col, Row, XF: Word);
var
  CDefXlsBOOLERR: TXlsBOOLERR;
begin
  CDefXlsBOOLERR.recNo := CXlsBOOLERR;
  CDefXlsBOOLERR.recSize := SizeOf(TXlsBOOLERR) - 2 * SizeOf(Word);
  CDefXlsBOOLERR.rw := Row;
  CDefXlsBOOLERR.col := Col;
  CDefXlsBOOLERR.ixfe := XF;
  CDefXlsBOOLERR.bBoolErr := Data;
  CDefXlsBOOLERR.fError := 1;
  FStream.WriteBuffer(CDefXlsBOOLERR, SizeOf(CDefXlsBOOLERR));
end;

//------------------------------------------------------------------------------

procedure TJclExcelWriter.WriteLABEL(const Data: AnsiString; const Col, Row, XF: Word);
var
  S: string;
  CDefXlsLABEL: TXlsLABEL;
begin
  CDefXlsLABEL.recNo := CXlsLABEL;
  S := Data;
  CDefXlsLABEL.cch := Length(S);
  if CDefXlsLABEL.cch > 255 then
  begin
    CDefXlsLABEL.cch := 255;
    SetLength(S, CDefXlsLABEL.cch);
  end;
  CDefXlsLABEL.rw := Row;
  CDefXlsLABEL.col := Col;
  CDefXlsLABEL.ixfe := XF;
  CDefXlsLABEL.recSize := (SizeOf(TXlsLABEL) - 2 * SizeOf(Word)) + CDefXlsLABEL.cch;
  FStream.WriteBuffer(CDefXlsLABEL, SizeOf(CDefXlsLABEL));
  FStream.WriteBuffer(Pointer(S)^, CDefXlsLABEL.cch);
end;

//------------------------------------------------------------------------------

procedure TJclExcelWriter.WriteNUMBER(const Data: Double; const Col, Row, XF: Word);
var
  CDefXlsNUMBER: TXlsNUMBER;
begin
  CDefXlsNUMBER.recNo := CXlsNUMBER;
  CDefXlsNUMBER.recSize := SizeOf(TXlsNUMBER) - 2 * SizeOf(Word);
  CDefXlsNUMBER.rw := Row;
  CDefXlsNUMBER.col := Col;
  CDefXlsNUMBER.ixfe := XF;
  CDefXlsNUMBER.num := Data;
  FStream.WriteBuffer(CDefXlsNUMBER, SizeOf(CDefXlsNUMBER));
end;

end.
