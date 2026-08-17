unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr,
  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, fcLabel, SConnect, MConnect, DBClient, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, fcStatusBar, uModuloGerenciaAA, fLimpeza,
  uResource, fStatus,
  FSelecionaDados, FWebConfiguracao, FGeracaoSenha, FConexao,
  FGeraExportacao, FConsExportImport, FGeraPaginasCampos,
  FImportacaoArquivos, FSincronizacao, FCadWebInterface,
  FCadWebReports, FCadWebCfgInfRend, FCadSimulaBenef,
  FCadInputSimulaBenef, FCadResultSimulaBenef, FSimulaBenef,
  FCadWebTpReports,
  FExportacaoSenhas, FCadWebAcesso, dParamRelGraficoAcessos, CMNetUsers;

type

  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuConfiguracoes: TMenuItem;
    mnuParametros: TMenuItem;
    mnuDadosExibidos: TMenuItem;
    mnuSenhas: TMenuItem;
    mnuGeracaoAutomaticaSenha: TMenuItem;
    mnuConexao: TMenuItem;
    mnuTransferencia: TMenuItem;
    mnuExportacao: TMenuItem;
    mnuGerarExportacao: TMenuItem;
    mnuConsultarExportacao: TMenuItem;
    mnuImportacao: TMenuItem;
    mnuImportacaoDados: TMenuItem;
    mnuConsultarImportacao: TMenuItem;
    N2: TMenuItem;
    mnuSincronizacao: TMenuItem;
    mnuCadInterface: TMenuItem;
    mnuAlteracaoSenha: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuConfigModulos: TMenuItem;
    mnuSimulaBenef: TMenuItem;
    mnuCadInputSimulaBenef: TMenuItem;
    mnuInformeDeRendimentos: TMenuItem;
    mnuCadSimulaBenef: TMenuItem;
    mnuCadResultSimulaBenef: TMenuItem;
    mnuPaginasCampos: TMenuItem;
    mnuExportacaoSenhas: TMenuItem;
    mnuSimulacaoBeneficios: TMenuItem;
    N1: TMenuItem;
    Ferramentas1: TMenuItem;
    MnuLimpezadeSistema: TMenuItem;
    mnuStatus: TMenuItem;
    mnuWebTpReports: TMenuItem;
    procedure mnuParametrosClick(Sender: TObject);
    procedure mnuDadosExibidosClick(Sender: TObject);
    procedure mnuGeracaoAutomaticaSenhaClick(Sender: TObject);
    procedure mnuConexaoClick(Sender: TObject);
    procedure fcLabel2Click(Sender: TObject);
    procedure mnuGerarExportacaoClick(Sender: TObject);
    procedure mnuConsultarExportacaoClick(Sender: TObject);
    procedure mnuImportacaoDadosClick(Sender: TObject);
    procedure mnuConsultarImportacaoClick(Sender: TObject);
    procedure mnuSincronizacaoClick(Sender: TObject);
    procedure mnuCadInterfaceClick(Sender: TObject);
    procedure mnuAlteracaoSenhaClick(Sender: TObject);
    procedure mnuRelatoriosClick(Sender: TObject);
    procedure mnuCadInputSimulaBenefClick(Sender: TObject);
    procedure mnuInformeDeRendimentosClick(Sender: TObject);
    procedure mnuCadSimulaBenefClick(Sender: TObject);
    procedure mnuCadResultSimulaBenefClick(Sender: TObject);
    procedure mnuPaginasCamposClick(Sender: TObject);
    procedure mnuExportacaoSenhasClick(Sender: TObject);
    procedure mnuSimulacaoBeneficiosClick(Sender: TObject);
    procedure MnuLimpezadeSistemaClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuStatusClick(Sender: TObject);
    procedure mnuWebTpReportsClick(Sender: TObject);
  private
  public
  end; 

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

procedure TfrmPrincipal.mnuParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmWebConfiguracao, TfrmWebConfiguracao, False );
end;

procedure TfrmPrincipal.mnuDadosExibidosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmSelecionaDados, TfrmSelecionaDados, False );
end;

procedure TfrmPrincipal.mnuGeracaoAutomaticaSenhaClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmGeracaoSenha, TfrmGeracaoSenha, False );
end;

procedure TfrmPrincipal.mnuConexaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmConexao, TfrmConexao, False );
end;

procedure TfrmPrincipal.fcLabel2Click(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := 0 to ( ComponentCount - 1 ) do
    if ( Components[i] is TMenuItem ) then ( Components[i] as TMenuItem ).Enabled := True;
end;

procedure TfrmPrincipal.mnuGerarExportacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmGeraExportacao, TfrmGeraExportacao, False );
end;

procedure TfrmPrincipal.mnuConsultarExportacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmConsExportImport, TfrmConsExportImport, False );
  frmConsExportImport.Prepara('1');
end;

procedure TfrmPrincipal.mnuImportacaoDadosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmImportacaoArquivos, TfrmImportacaoArquivos, False );
end;

procedure TfrmPrincipal.mnuConsultarImportacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmConsExportImport, TfrmConsExportImport, False );
  frmConsExportImport.Prepara('');
end;

procedure TfrmPrincipal.mnuSincronizacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmSincronizacao, TfrmSincronizacao, False );
end;

procedure TfrmPrincipal.mnuCadInterfaceClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadWebInterface, TfrmCadWebInterface, false);
end;

procedure TfrmPrincipal.mnuAlteracaoSenhaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadWebAcesso, TfrmCadWebAcesso, false);
  frmCadWebAcesso.UsuarioSelecionado := False;
  
  //Para trazer um usuário selecionado, troque a linha acima pelas abaixo
  // frmCadWebAcesso.IdPessoa := 10143;
  // frmCadWebAcesso.UsuarioSelecionado := True;
  // frmCadWebAcesso.SelecionaPessoa;
end;

procedure TfrmPrincipal.mnuRelatoriosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadWebReports, TfrmCadWebReports, False );
end;

procedure TfrmPrincipal.mnuCadInputSimulaBenefClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadInputSimulaBenef, TfrmCadInputSimulaBenef, False );
end;

procedure TfrmPrincipal.mnuInformeDeRendimentosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadWebCfgInfRend, TfrmCadWebCfgInfRend, False );
end;

procedure TfrmPrincipal.mnuCadSimulaBenefClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadSimulaBenef, TfrmCadSimulaBenef, False );
end;

procedure TfrmPrincipal.mnuCadResultSimulaBenefClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadResultSimulaBenef, TfrmCadResultSimulaBenef, False );
end;

procedure TfrmPrincipal.mnuPaginasCamposClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmGeraPaginasCampos, TfrmGeraPaginasCampos, False );
end;

procedure TfrmPrincipal.mnuExportacaoSenhasClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmExportacaoSenhas, TfrmExportacaoSenhas, False );
end;

procedure TfrmPrincipal.mnuSimulacaoBeneficiosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmSimulaBenef, TfrmSimulaBenef, False );
end;

procedure TfrmPrincipal.MnuLimpezadeSistemaClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmLimpeza, TfrmLimpeza, False );
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TdtmParamRelGraficoAcessos, dtmParamRelGraficoAcessos );
end;

procedure TfrmPrincipal.mnuStatusClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmStatus, TfrmStatus, False );
end;

procedure TfrmPrincipal.mnuWebTpReportsClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadWebTpReports, TfrmCadWebTpReports, False );
end;

initialization
   Sistema.NomeModulo := 'GerenciaAA';
   Sistema.IdModulo := 465;
   Sistema.Versao := '3.01.18a';
   Sistema.NomeAplicativo := 'Gerência do Auto-Atendimento';
   ModuloGerenciaAA := TModuloGerenciaAA.Create  ;

finalization
   ModuloGerenciaAA.free;


end.
