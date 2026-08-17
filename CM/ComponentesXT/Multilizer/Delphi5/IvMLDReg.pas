unit IvMLDReg;

interface

procedure Register;

implementation

uses
  Classes, DsgnIntf,
  IvCommon, IvMLDDic, IvMulReg;

procedure Register;
begin
  RegisterComponents(ML_SHEET_C, [TIvMLDDictionary]);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvMLDDictionary,
    'FileName',
    TIvMLDFileNameProperty);
end;

end.
