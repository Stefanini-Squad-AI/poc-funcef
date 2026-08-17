unit IvOldReg;

interface

procedure Register;

implementation

uses
  Classes,
{$IFDEF WIN32}
  IvUMulti,
{$ENDIF}
  IvCommon, IvFiMult, IvEBinDi, IvEFiMul, IvEMulti;

procedure Register;
begin
  { The following components are for backward compability only }

  RegisterComponents(ML_OLD_SHEET_C, [TIvFileDictionary]);
{$IFDEF WIN32}
  RegisterComponents(ML_OLD_SHEET_C, [TIvUnicodeDictionary]);
{$ENDIF}
  RegisterComponents(ML_OLD_SHEET_C, [TIvEmbeddedDictionary]);
  RegisterComponents(ML_OLD_SHEET_C, [TIvEmbeddedBinaryDictionary]);

  RegisterComponents(ML_OLD_SHEET_C, [TIvExtendedTranslator]);
end;

end.
