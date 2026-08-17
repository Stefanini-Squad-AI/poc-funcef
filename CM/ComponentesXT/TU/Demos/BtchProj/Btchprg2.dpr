program Btchprg2;

uses
  Forms,
  Statdlg in 'STATDLG.PAS' {FormStatus},
  Errtbdlg in 'ERRTBDLG.PAS' {BtnBottomDlg},
  Bthmain2 in 'BTHMAIN2.PAS' {FormBatchAliasMain},
  Meter in '\ATools\TU\SOURCE\meter.pas';

{$R *.RES}

begin
  Application.CreateForm(TFormBatchAliasMain, FormBatchAliasMain);
  Application.CreateForm(TFormStatus, FormStatus);
  Application.CreateForm(TBtnBottomDlg, BtnBottomDlg);
  Application.Run;
end.
