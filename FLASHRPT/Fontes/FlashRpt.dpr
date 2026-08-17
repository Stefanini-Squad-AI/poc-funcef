program FlashRpt;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  uFlashRpt in 'uFlashRpt.pas' {dtmFlashRpt: TDataModule},
  FParamFlashRpt in 'FParamFlashRpt.pas' {frmParamFlashRpt},
  FSelHotel in 'FSelHotel.pas' {FrmSelHotel},
  FConfigPOA in 'FConfigPOA.pas' {frmConfigPOA},
  FConfDeptRev in 'FConfDeptRev.pas' {frmConfDeptRev},
  FParamSumarioFlash in 'FParamSumarioFlash.pas' {frmParamSumDCFlash};

{$R *.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Gerador de Relatórios Avulsos';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmFlashRpt, dtmFlashRpt);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Relatórios Avulsos
================================================================================
CM$ALT}



