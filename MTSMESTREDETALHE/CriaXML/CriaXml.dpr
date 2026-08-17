program CriaXml;

uses
  Forms,
  fCriaXml in 'fCriaXml.pas' {FrmCriaXml},
  uDbTblmestre in '..\Source\uDbTblmestre.pas',
  uDbTbldetalhe in '..\Source\uDbTbldetalhe.pas',
  uCtrlMestreDetalhe in '..\Source\uCtrlMestreDetalhe.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCriaXml, FrmCriaXml);
  Application.Run;
end.
