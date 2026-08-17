program Projtu;

uses
  Forms,
  Tumain in 'TUMAIN.PAS' {FormTUMain},
  Vwerrdlg in 'VWERRDLG.PAS' {BtnBottomDlg};

{$R *.RES}

begin
  Application.CreateForm(TFormTUMain, FormTUMain);
  Application.CreateForm(TBtnBottomDlg, BtnBottomDlg);
  Application.Run;
end.
