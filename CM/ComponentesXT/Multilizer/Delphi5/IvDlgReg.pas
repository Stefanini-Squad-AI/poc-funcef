{
  This unit registers the common dialog components of Multilizer.

  Copyrights 1995-1998 Innoview Data Technologies Oy
}

unit IvDlgReg;

{$I IVMULTI.INC}

interface

procedure Register;

implementation

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  IvCommon, IvDialog, IvMLDlgs, IvFiltEd, IvMulReg,
  Classes, Forms, DsgnIntf, Controls, Dialogs, SysUtils, TypInfo;

procedure Register;
begin
  { Multilingual common dialog components }

  RegisterComponents(ML_OLD_SHEET_C, [TIvOpenDialog]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvSaveDialog]);
{$IFDEF IVWIDE}
  RegisterComponents(ML_OLD_SHEET_C, [TIvOpenPictureDialog]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvSavePictureDialog]);
{$ENDIF}
  RegisterComponents(ML_OLD_SHEET_C, [TIvFontDialog]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvColorDialog]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvPrintDialog]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvPrinterSetupDialog]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvFindDialog]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvReplaceDialog]);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvCommonDialog,
    'DictionaryName',
    TIvDictionaryNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvOpenDialog,
    'Filter',
    TIvFilterProperty);
end;

end.
