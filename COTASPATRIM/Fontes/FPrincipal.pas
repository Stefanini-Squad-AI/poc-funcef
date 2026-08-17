unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, {uModulo, }TB97Tlwn, TB97Tlbr,
  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, fcLabel, uResource, SConnect, MConnect, DBClient, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, fcStatusBar,
  fCadAtivo, fCadContasFundos, fCadTipoOper, fCadDesvioPadrao, fCadRoteiros,
  fGerStatusCota, CMNetUsers, fCadTipoMovim, fCadTipoEntrada,
  fAberturaAtivo, fRoteirosExecutados, fApuracaoManual, fParamCotasPatrim,
  fResultExecucao, fCalculoCota;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuAtivo: TMenuItem;
    mnuContaFundo: TMenuItem;
    N1: TMenuItem;
    mnuTipoMovim: TMenuItem;
    mnuRoteiros: TMenuItem;
    mnuOperacao: TMenuItem;
    StatusdaCota1: TMenuItem;
    mnuApuracaoManual: TMenuItem;
    TipoEntrada1: TMenuItem;
    MnuAberturadeAtivo: TMenuItem;
    ExecuodeRoteiros1: TMenuItem;
    mnuRoteirosApurados: TMenuItem;
    procedure mnuAtivoClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuContaFundoClick(Sender: TObject);
    procedure mnuTipoMovimClick(Sender: TObject);
    procedure mnuRoteirosClick(Sender: TObject);
    procedure StatusdaCota1Click(Sender: TObject);
    procedure TipoEntrada1Click(Sender: TObject);
    procedure MnuAberturadeAtivoClick(Sender: TObject);
    procedure ExecuodeRoteiros1Click(Sender: TObject);
    procedure mnuApuracaoManualClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuRoteirosApuradosClick(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

procedure TfrmPrincipal.mnuAtivoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAtivo, TfrmCadAtivo, False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  if Sistema.FezLogin then
    stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;
end;

procedure TfrmPrincipal.mnuContaFundoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadContasFundos, TfrmCadContasFundos, False);
end;

procedure TfrmPrincipal.mnuTipoMovimClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadTipoMovim, TfrmCadTipoMovim, False);
end;

procedure TfrmPrincipal.mnuRoteirosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadRoteiros, TfrmCadRoteiros, False);
end;

procedure TfrmPrincipal.StatusdaCota1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmGerStatusCota, TfrmGerStatusCota, False );
end;

procedure TfrmPrincipal.TipoEntrada1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadTipoEntrada, TfrmCadTipoEntrada, False);
end;

procedure TfrmPrincipal.MnuAberturadeAtivoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmAberturaAtivo, TfrmAberturaAtivo, False);
end;

procedure TfrmPrincipal.ExecuodeRoteiros1Click(Sender: TObject);
begin
  inherited;
   AbrirForm( frmRoteirosExecutados, TfrmRoteirosExecutados, False );
end;

procedure TfrmPrincipal.mnuApuracaoManualClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmApuracaoManual, TfrmApuracaoManual, False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmParamCotasPatrim, TfrmParamCotasPatrim, False);
end;

procedure TfrmPrincipal.mnuRoteirosApuradosClick(Sender: TObject);
begin
  inherited;
  TfrmResultExecucao.Modo( 1 );
  AbrirForm( frmResultExecucao, TfrmResultExecucao, False );
end;

initialization
   Sistema.NomeModulo := 'CotasPatrim'; // Nome do Módulo
   Sistema.IdModulo := 725;         // IdModulo cadastrado no SAD
   Sistema.Versao := '3.00.03';
   Sistema.NomeAplicativo := 'Acompanhamento de Cotas e Fundos Patrimoniais';
//   Modulo := TModulo.Create  ;

finalization
//   Modulo.free;


end.
