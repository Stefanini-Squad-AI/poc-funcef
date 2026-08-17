{
  This unit registers the bidirectional components of Multilizer.

  These components are required to build bi-di enabled applications using
  Delphi 2/3 or C++Builder 1/3. Later version do not require them any more.

  Copyrights 1995-1998 Innoview Data Technologies Oy
}

unit IvBidReg;

{$I IVMULTI.INC}

interface

procedure Register;

implementation

uses
{$IFDEF WIN32}
  Windows,
  IvGrids, IvDBGrid,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Classes, Forms, DsgnIntf, Controls, Dialogs, SysUtils, TypInfo,
  IvCommon, IvMlCtrl, IvDBMlCt;

const
{$IFDEF IVBIDI}
  SHEET_C = ML_OLD_SHEET_C;
{$ELSE}
  {$IFDEF WIN32}
  SHEET_C = ML_CONTROLS_SHEET_C;
  {$ELSE}
  SHEET_C = ML_OLD_SHEET_C;
  {$ENDIF}
{$ENDIF}

procedure Register;
begin
  { Multilingual VLC components }

  RegisterComponents(SHEET_C, [TIvLabel]);
  RegisterComponents(SHEET_C, [TIvGroupBox]);
  RegisterComponents(SHEET_C, [TIvRadioGroup]);
  RegisterComponents(SHEET_C, [TIvListBox]);
  RegisterComponents(SHEET_C, [TIvComboBox]);
{$IFDEF WIN32}
  RegisterComponents(SHEET_C, [TIvStringGrid]);
  RegisterComponents(SHEET_C, [TIvDrawGrid]);
{$ENDIF}

  { Multilingual DB VLC components }

  RegisterComponents(SHEET_C, [TIvDBText]);
  RegisterComponents(SHEET_C, [TIvDBRadioGroup]);
  RegisterComponents(SHEET_C, [TIvDBListBox]);
  RegisterComponents(SHEET_C, [TIvDBComboBox]);
  RegisterComponents(SHEET_C, [TIvDBLookupListBox]);
  RegisterComponents(SHEET_C, [TIvDBLookupComboBox]);
{$IFDEF WIN32}
  RegisterComponents(SHEET_C, [TIvDBGrid]);
{$ENDIF}
end;

end.

