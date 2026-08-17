unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97, Db, Wwdatsrc, DBTables, wwdblook,
  StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, ImgList, IvDictio,
  IvAMulti, IvBinDic, IvMulti, fcLabel, SConnect, MConnect, DBClient, AppEvnts, StdActns,
  ActnList, fcStatusBar, CorreioCM, CMApplicationEvents, fTelaAut, uSistema,
  CMNetUsers, uResource, IvEMulti;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuCadEstacao: TMenuItem;
    mnuCadLocalizacao: TMenuItem;
    mnuRegAcesso: TMenuItem;
    mnuTransacoes: TMenuItem;
    mnuLancaHoraPonto: TMenuItem;
    N1: TMenuItem;
    mnuControlePonto: TMenuItem;
    mnuQuantidadePermitida: TMenuItem;
    mnuLancamentosBancoHoras: TMenuItem;
    VeSalario: TPanel;
    N2: TMenuItem;
    mnuRegRevesamentoHorarios: TMenuItem;
    sbtnTeclado: TToolbarButton97;
    sbtnTecladoMatric: TToolbarButton97;
    mnuRegistrodeQuemMarcaPonto: TMenuItem;
    N3: TMenuItem;
    mnuVisualizarArquivosLog: TMenuItem;
    UsuarioRH: TPanel;
    N4: TMenuItem;
    mnuGravaCartao: TMenuItem;
    RegistroIndividualdeAcesso1: TMenuItem;
    Private
    FChavePessoa: LongInt;
   //* procedure SetChavePessoa(const Value: LongInt);
    
    public
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuCadLocalizacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuCadEstacaoClick(Sender: TObject);
    procedure mnuRegAcessoClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuControlePontoClick(Sender: TObject);
    procedure mnuLancaHoraPontoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuQuantidadePermitidaClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure mnuLancamentosBancoHorasClick(Sender: TObject);
    procedure mnuRegRevesamentoHorariosClick(Sender: TObject);
    procedure sbtnTecladoClick(Sender: TObject);
    procedure sbtnTecladoMatricClick(Sender: TObject);
    procedure mnuRegistrodeQuemMarcaPontoClick(Sender: TObject);
    procedure mnuVisualizarArquivosLogClick(Sender: TObject);
    procedure mnuGravaCartaoClick(Sender: TObject);
    procedure RegistroIndividualdeAcesso1Click(Sender: TObject);
   //* property ChavePessoa: LongInt read FChavePessoa write SetChavePessoa;
    end;

var
  frmPrincipal: TfrmPrincipal;
  

implementation

uses
   JclSysInfo, uCtrlPadroes, uMensErro,

  uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH, uCtrlEstacaoAcesso, uCmCtrlRptModAcesso,
  uGravaCartoes,

  dCds,

  fCadParam, fCadLocalizacao, fCadEstacao, fRegAcesso, fLancaHoraPonto, fRegVezes,
  fParamAcessoPessEstacao, fControlePonto, fParamQuantAcessos, fRegBancoHoras,
  fParamExtratoBH, fParamLancRubIndiv, fParamCartaoPonto,
  fCadRegHorarioVariavel, fParamQuadroHoraTrab, fParamEscalaHorario,
  fRegQuemMarcaPonto, fVisualizarArquivosLog, fGravaCartoes, fRegAcesso2;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_IDENTIF_INVALIDA =
    'Esta estação não está identificada como uma :1'+
    'estação válida para esta operação.';

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlUsoGeralRH := TCtrlUsoGeralRH.Create;
  FU := TCtrlFuncoesRH.Create;
  dmCds := TdmCds.Create(Application);

  //FU.GetTempDir;
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  ShortDateFormat := 'DD/MM/YYYY';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCds.Free;
  FU.Free;
  CtrlUsoGeralRH.Free;

  inherited;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var
  c: byte;
  CtrlEstacaoAcesso: TCtrlEstacaoAcesso;
begin
  inherited;
  if (Sistema.FezLogin) then
  begin
    FU.InitializeAs(Padroes);
    FU.SetArqConfig;
    Modulo.VeSalario := VeSalario.Enabled;
    
    if (Sistema.MudouUsuario) then
    begin
      CtrlUsoGeralRH.InitializeAs(Padroes);
      CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);
    end;
    
    CtrlEstacaoAcesso := TCtrlEstacaoAcesso.Create;
    CtrlEstacaoAcesso.InitializeAs(Padroes);

    Modulo.Estacao := GetLocalComputerName;
    dmCds.Cds.Data := CtrlEstacaoAcesso.ListEstacaoAcesso(0, Modulo.Estacao);
    Modulo.Estacao := dmCds.Cds.FieldByName('ESTACAO').asString;
    Modulo.IdEstacaoEcesso := dmCds.Cds.FieldByName('IDESTACAOACESSO').asFloat;
    Modulo.TipoEstacao := dmCds.Cds.FieldByName('INDFUNCAO').asString;
    Modulo.MarcaCatraca := dmCds.Cds.FieldByName('MARCACATRACA').asString;
    Modulo.ModeloCatraca := dmCds.Cds.FieldByName('MODELOCATRACA').asString;
    Modulo.PortaCatraca := dmCds.Cds.FieldByName('PORTACATRACA').asString;
    Modulo.IdEstacaoEcesso := dmCds.Cds.FieldByName('IDESTACAOACESSO').asFloat;
    Modulo.IndIdentificacao := dmCds.Cds.FieldByName('INDIDENTIFICACAO').asInteger;
    Modulo.IndLiberacao := dmCds.Cds.FieldByName('INDLIBERACAO').asInteger;
    Modulo.IndEntraSai := dmCds.Cds.FieldByName('INDENTRASAI').asInteger;

    CtrlEstacaoAcesso.Free;
  end;

  // Tornar visível o menu de gravação de Cartões
  mnuGravaCartao.Visible := (FU.LerChaveRegistro(Sistema.NomeModulo, 'GravaCartao') = 'S');
  mnuGravaCartao.Enabled := mnuGravaCartao.Visible;

  // Visualizar Arquivos de Log sempre deve estar ativo
  mnuVisualizarArquivosLog.Enabled := true;

  // Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco)
  for c:=0 to Self.ComponentCount-1 do
    if (Self.Components[c] is TMenuItem) then
      (Self.Components[c] as TMenuItem).Enabled := true; 
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  AbrirForm(frmCadParam, TfrmCadParam, false);
end;

procedure TfrmPrincipal.mnuCadEstacaoClick(Sender: TObject);
begin
  AbrirForm(frmCadEstacao, TfrmCadEstacao, false);
end;

procedure TfrmPrincipal.mnuCadLocalizacaoClick(Sender: TObject);
begin
  AbrirForm(frmCadLocalizacao, TfrmCadLocalizacao, false);
end;

procedure TfrmPrincipal.mnuRegAcessoClick(Sender: TObject);
begin
  if (Modulo.Estacao <> '') then
    AbrirForm(frmRegAcesso, TfrmRegAcesso, false)
  else
    MsgDlg(fu.CMTranslateMsg(MSG_IDENTIF_INVALIDA, [CR_LF]),
           fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
end;

procedure TfrmPrincipal.mnuControlePontoClick(Sender: TObject);
begin
  AbrirForm(frmControlePonto, TfrmControlePonto, false);
end;

procedure TfrmPrincipal.mnuLancaHoraPontoClick(Sender: TObject);
begin
  AbrirForm(frmLancaHoraPonto, TfrmLancaHoraPonto, false);
end;

procedure TfrmPrincipal.mnuQuantidadePermitidaClick(Sender: TObject);
begin
  AbrirForm(frmRegVezes, TfrmRegVezes, false);
end;

procedure TfrmPrincipal.mnuLancamentosBancoHorasClick(Sender: TObject);
begin
  AbrirForm(frmRegBancoHoras, TfrmRegBancoHoras, false);
end;

procedure TfrmPrincipal.mnuRegRevesamentoHorariosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRegHorarioVariavel, TfrmCadRegHorarioVariavel, false);
end;

procedure TfrmPrincipal.mnuRegistrodeQuemMarcaPontoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRegQuemMarcaPonto, TfrmRegQuemMarcaPonto, false);
end;

procedure TfrmPrincipal.sbtnTecladoClick(Sender: TObject);
begin
 //* if (frmRegAcesso.iIndIdentificacao <> 0) then
 //* begin
 //*   frmRegAcesso.iIndIdentificacao := 0;
 //*   frmRegAcesso.iColDocumento := 1;
//*   frmRegAcesso.LimparTela;
 //*   frmRegAcesso.edDocumento.SetFocus;
  //*  frmRegAcesso.IniciarConfig;
 //* end
 //* else
 //* begin
//*    frmRegAcesso.FormCreate(Self);
 //*   frmRegAcesso.IniciarConfig;
//*  end;
end;

procedure TfrmPrincipal.sbtnTecladoMatricClick(Sender: TObject);
begin
  if (frmRegAcesso.iIndIdentificacao <> 0) then
  begin
    frmRegAcesso.iIndIdentificacao := 0;
    frmRegAcesso.dIdDocumento := 0;
    frmRegAcesso.iColDocumento := 1;
    frmRegAcesso.iTamDocumento := dmCds.Cds.FieldByName('TAMANHOMATRIC').asInteger;
    frmRegAcesso.LimparTela;
    frmRegAcesso.edDocumento.SetFocus;
    frmRegAcesso.IniciarConfig;
 end
  else
  begin
    frmRegAcesso.FormCreate(Self);
   frmRegAcesso.IniciarConfig;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  RptModAcesso: TCmCtrlRptModAcesso;
begin
  inherited;
  RptModAcesso := TCmCtrlRptModAcesso.Create;
  try
    Printed := ShowReport(IdReports, RptModAcesso);
    RptModAcesso.Free;
  except
    RptModAcesso.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CmCtrlRptModAcesso: TCmCtrlRptModAcesso;
begin
  inherited;
  CmCtrlRptModAcesso := TCmCtrlRptModAcesso.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModAcesso, DesReport);
    CmCtrlRptModAcesso.Free;
  except
    CmCtrlRptModAcesso.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    4055 : frmPreviewReports := TfrmParamAcessoPessEstacao.Create(Self, tpRelatPorPessoa);
    4056 : frmPreviewReports := TfrmParamAcessoPessEstacao.Create(Self, tpRelatPorEstacao);
    4058 : frmPreviewReports := TfrmParamQuantAcessos.Create(Self);
    4108 : frmPreviewReports := TfrmParamExtratoBH.Create(Self);
    4119 : frmPreviewReports := TfrmParamLancRubIndiv.Create(Self);
    4121 : frmPreviewReports := TfrmParamCartaoPonto.Create(Self);
    4180 : frmPreviewReports := TfrmParamQuadroHoraTrab.Create(Self);
    4181 : frmPreviewReports := TfrmParamEscalaHorario.Create(Self);
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.mnuVisualizarArquivosLogClick(Sender: TObject);
begin
  AbrirForm(frmVisualizarArquivosLog, TfrmVisualizarArquivosLog, false);
end;

procedure TfrmPrincipal.mnuGravaCartaoClick(Sender: TObject);
begin
  if (TGravaCartoes.IsChaveEletronicaAtiva(ObjConexaoGravadora)) then
    AbrirFormModal(frmGravaCartoes, TfrmGravaCartoes)
  else
    MsgDlg(fu.CMTranslate(
      'Não foi possível estabelecer uma comunicação com o programa Chave Eletrônica.'),
      fu.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmPrincipal.RegistroIndividualdeAcesso1Click(Sender: TObject);

begin

  inherited;
end;

initialization
   Sistema.NomeModulo :='Controle de Ponto e Acesso';
   Sistema.IdModulo :=82;
   Sistema.Versao := '4.03.02';
   Sistema.NomeAplicativo := 'Controle de Ponto e Acesso';
   Modulo := TModulo.Create;
finalization
   Modulo.Free;
end.
