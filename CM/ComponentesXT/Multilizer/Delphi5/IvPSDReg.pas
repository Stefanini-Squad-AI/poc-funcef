unit IvPSDReg;

interface

procedure Register;

implementation

uses
  Classes, DsgnIntf,
  IvCommon, IvPSDlg, IvMulReg;

procedure Register;
begin
  RegisterComponents(ML_CONTROLS_SHEET_C, [TIvPageSetupDialog]);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvPageSetupDialog,
    'DictionaryName',
    TIvDictionaryNameProperty);
end;

end.
