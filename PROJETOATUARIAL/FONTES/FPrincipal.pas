// *************************************************************************************************
//                                   REGISTRO DE ALTERAÇÕES
// *************************************************************************************************
// Data        : 10.11.2003
// Responsável : Camille
// Alteração   : AfterLogin - exibir menu administração se o usuario for o super ou .cm
// -------------------------------------------------------------------------------------------------
unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, DBCtrls, Mask,
  wwdbedit, Grids, Wwdbigrd, Wwdbgrid, TB97Tlwn, TB97Tlbr,
  TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, ppEndUsr,
  ppBands, ppClass, ppProd, ppReport, ppComm, ppCache, ppDB, ppDBBDE,
  CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList,
  ImgList, fcStatusBar, SConnect, MConnect, DBClient, uResource, uCtrlParamIntegra,
  CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    N6: TMenuItem;
    RelatrioAtuarial1: TMenuItem;
    N7: TMenuItem;
    abrir: TOpenDialog;
    RelatriodearquivoTXTexterno1: TMenuItem;
    N10: TMenuItem;
    Existente1: TMenuItem;
    Novo1: TMenuItem;
    ImportaTabelasBiomtricas1: TMenuItem;
    TxtdeAferies1: TMenuItem;
    Tbua1: TMenuItem;
    Atualizar1: TMenuItem;
    ImportarTbua1: TMenuItem;
    N15: TMenuItem;
    TbuadeServio1: TMenuItem;
    Frmulas1: TMenuItem;
    Varivel1: TMenuItem;
    Frmula1: TMenuItem;
    RotinadeClculo1: TMenuItem;
    Clculo1: TMenuItem;
    ComposiodeClculo1: TMenuItem;
    N16: TMenuItem;
    tem1: TMenuItem;
    HiptesedeClculo1: TMenuItem;
    N17: TMenuItem;
    ClculoAtuarial1: TMenuItem;
    MemriadeClculo1: TMenuItem;
    N18: TMenuItem;
    ClculoAtuarial2: TMenuItem;
    mnuArquivo: TMenuItem;
    mniLayoutArquivo: TMenuItem;
    mniImportar: TMenuItem;
    mniExportar: TMenuItem;
    N14: TMenuItem;
    mnuAdministracao: TMenuItem;
    mnuEstuturaBanco: TMenuItem;
    N11: TMenuItem;
    mnuTipoGrupoDado: TMenuItem;
    mniVersaoBase: TMenuItem;
    N20: TMenuItem;
    mniVersaoBaseTrab: TMenuItem;
    Paticipante2: TMenuItem;
    GrupodePartipante2: TMenuItem;
    EnquadramentodeParticipante1: TMenuItem;
    N3: TMenuItem;
    CrticadeParticipante1: TMenuItem;
    N4: TMenuItem;
    EntidadedePrevidncia2: TMenuItem;
    Patrocinadora2: TMenuItem;
    PlanodeBenefcio2: TMenuItem;
    EstadoCivil2: TMenuItem;
    GraudeDependncia2: TMenuItem;
    GraudeInstruo2: TMenuItem;
    TipodeBenefcio2: TMenuItem;
    TipodeCategoriaProfissional2: TMenuItem;
    TipodeTbua2: TMenuItem;
    TipodeTempo2: TMenuItem;
    TipodeValor2: TMenuItem;
    UnidadedaFederao1: TMenuItem;
    N9: TMenuItem;
    ToolbarSep971: TToolbarSep97;
    ToolbarButton972: TToolbarButton97;
    ToolbarButton971: TToolbarButton97;
    ToolbarButton973: TToolbarButton97;
    ToolbarButton974: TToolbarButton97;
    EfetivaClculoAtuarial1: TMenuItem;
    Relatrios1: TMenuItem;
    Histrico1: TMenuItem;
    TransferirparabasedeHistrico1: TMenuItem;
    NovaVerso1: TMenuItem;
    ConsultaClculo1: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    MemriadeClculo2: TMenuItem;
    Participante1: TMenuItem;
    ConsultaCculoBeneficios1: TMenuItem;
    N13: TMenuItem;
    SituaodaFundao1: TMenuItem;
    SituaodaPatrocinadora1: TMenuItem;
    ComparaVerses1: TMenuItem;
    N5: TMenuItem;
    ImportarTOTALPREV1: TMenuItem;
    N19: TMenuItem;
    mnuSincronizarTabelasAux: TMenuItem;
    ClculoAtivos1: TMenuItem;
    ClculoBenefcios1: TMenuItem;
    Image1: TImage;
    N1: TMenuItem;
    TempoXRegra1: TMenuItem;
    ValorXRegra1: TMenuItem;
    IntegraoContbil1: TMenuItem;
    Grupos2: TMenuItem;
    Parmetros1: TMenuItem;
    Cadastro1: TMenuItem;
    AtualizarLanamentosContbeis1: TMenuItem;
    N2: TMenuItem;
    ClculodaTbuadeServio1: TMenuItem;
    RegrasdeAjustedaTbuadeServio1: TMenuItem;
    N23: TMenuItem;
    muImportaVersao: TMenuItem;
    procedure CriarArquivo1Click(Sender: TObject);
    procedure FiltrarTabela1Click(Sender: TObject);
    procedure GruposdeHipteses1Click(Sender: TObject);
    procedure GruposdeRegras1Click(Sender: TObject);
    procedure ExecutaHiptese1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Relatrio31Click(Sender: TObject);
    procedure Relatrio21Click(Sender: TObject);
    procedure Relatorios1Click(Sender: TObject);
    procedure RelatrioAtuarial1Click(Sender: TObject);
    procedure TabelasBiomtricas1Click(Sender: TObject);
    procedure SelecionarCampos1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure ImportaTabelasBiomtricas1Click(Sender: TObject);
    procedure GeraTabelas1Click(Sender: TObject);
    procedure GerarValores1Click(Sender: TObject);
    procedure TxtdeAferies1Click(Sender: TObject);
    procedure EstadoCivil1Click(Sender: TObject);
    procedure GraudeDependncia1Click(Sender: TObject);
    procedure GraudeInstruo1Click(Sender: TObject);
    procedure TipodeCategoriaProfissional1Click(Sender: TObject);
    procedure TipodeBenefcio1Click(Sender: TObject);
    procedure TipodeTbua1Click(Sender: TObject);
    procedure TipodeTempo1Click(Sender: TObject);
    procedure TipodeValor1Click(Sender: TObject);
    procedure UnidadedeFederao1Click(Sender: TObject);
    procedure EntidadedePrevidncia1Click(Sender: TObject);
    procedure Patrocinadora1Click(Sender: TObject);
    procedure PlanodeBenefcio1Click(Sender: TObject);
    procedure mniLayoutArquivoClick(Sender: TObject);
    procedure ClculoAtuarial1Click(Sender: TObject);
    procedure ComposiodeClculo1Click(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure mnuEstuturaBancoClick(Sender: TObject);
    procedure mnuTipoGrupoDadoClick(Sender: TObject);
    procedure ImportarTbua1Click(Sender: TObject);
    procedure Varivel1Click(Sender: TObject);
    procedure Frmula1Click(Sender: TObject);
    procedure RotinadeClculo1Click(Sender: TObject);
    procedure mniVersaoBaseClick(Sender: TObject);
    procedure mniVersaoBaseTrabClick(Sender: TObject);
    procedure Paticipante1Click(Sender: TObject);
    procedure mniImportarClick(Sender: TObject);
    procedure mniExportarClick(Sender: TObject);
    procedure tem1Click(Sender: TObject);
    procedure GrupodePartipante1Click(Sender: TObject);
    procedure HiptesedeClculo1Click(Sender: TObject);
    procedure TbuadeServio1Click(Sender: TObject);
    procedure EnquadramentoGruposParticipante1Click(Sender: TObject);
    procedure Paticipante2Click(Sender: TObject);
    procedure GrupodePartipante2Click(Sender: TObject);
    procedure EnquadramentodeParticipante1Click(Sender: TObject);
    procedure EntidadedePrevidncia2Click(Sender: TObject);
    procedure Patrocinadora2Click(Sender: TObject);
    procedure PlanodeBenefcio2Click(Sender: TObject);
    procedure GraudeDependncia2Click(Sender: TObject);
    procedure EstadoCivil2Click(Sender: TObject);
    procedure GraudeInstruo2Click(Sender: TObject);
    procedure TipodeBenefcio2Click(Sender: TObject);
    procedure TipodeCategoriaProfissional2Click(Sender: TObject);
    procedure TipodeTbua2Click(Sender: TObject);
    procedure TipodeTempo2Click(Sender: TObject);
    procedure TipodeValor2Click(Sender: TObject);
    procedure UnidadedaFederao1Click(Sender: TObject);
    procedure ComposiodeCritica2Click(Sender: TObject);
    procedure CrticadeParticipante1Click(Sender: TObject);
    procedure ToolbarButton971Click(Sender: TObject);
    procedure ToolbarButton974Click(Sender: TObject);
    procedure ToolbarButton972Click(Sender: TObject);
    procedure ToolbarButton973Click(Sender: TObject);
    procedure ClculoAtuarial2Click(Sender: TObject);
    procedure sbtnEnviaMensagensClick(Sender: TObject);
    procedure EfetivaClculoAtuarial1Click(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
    procedure ConsultaCculoBeneficios1Click(Sender: TObject);
    procedure TransferirparabasedeHistrico1Click(Sender: TObject);
    procedure Participante1Click(Sender: TObject);
    procedure MemriadeClculo2Click(Sender: TObject);
    procedure SituaodaFundao1Click(Sender: TObject);
    procedure SituaodaPatrocinadora1Click(Sender: TObject);
    procedure NovaVerso1Click(Sender: TObject);
    procedure ComparaVerses1Click(Sender: TObject);
    procedure ImportarTOTALPREV1Click(Sender: TObject);
    procedure mnuSincronizarTabelasAuxClick(Sender: TObject);
    procedure ClculoAtivos1Click(Sender: TObject);
    procedure ClculoBenefcios1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure TempoXRegra1Click(Sender: TObject);
    procedure ValorXRegra1Click(Sender: TObject);
    procedure Grupos2Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure AtualizarLanamentosContbeis1Click(Sender: TObject);
    procedure ClculodaTbuadeServio1Click(Sender: TObject);
    procedure RegrasdeAjustedaTbuadeServio1Click(Sender: TObject);
    procedure muImportaVersaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses FTelaAut, UCriaTabela, UFiltraTabela, UGrupoHipotese, UGrupoRegra,
     UAutorizacao,UCalculo,URelatoriosAtuariais,Usistema,UModulo,
     UGrupobiometrica, FAssocPlanPatro, FSelecaoTabs, FCriaTabs,UIntegraBack,
     FCadRelatorios,FileCtrl, UCriaEstruturaTXT, excelbio, FGeraTabela,
     FCadTabela, FGeraValores, UTXTAfericoesPart, FCadTbEstadoCivil,
     FCadTbGrauDependencia, FCadTbGrauInstrucao, FCadTbTipoCategoriaPro,
     FCadTbTipoBeneficio, FCadTbTipoGrupoParticipante, FCadTbTipoTabua,
     FCadTbTipoValor, FCadTbUnidadeFederacao,
     uEntidadePrevidencia, uPatrocinadora, uPlanoBeneficio, FCadLayoutArquivo,
     UCalculoAtuarial, UGrupoParticipante, uTabua, FCadTabelaSistema,
     FCadTbTipoGrupoDado, uImportarTabua, uVariavel, uFormula, uRotinaCalculo,
     FCadVersaoBase, uVersaoBase, FImportaArquivo, uGlobal,
     FExportaArquivo, uComposicaoCalculo, uItemHipotese, uHipotese,
     uGeraTabuaServico, uOkEnquadraParticipante, uGrupoCritica,
     uOkCriticaParticipante, uConsultaCalculo, uMemoriaCalculo,
     uEfetivaCalculo, fMostraRelat, uConsultaCalculoAtivo, uParticipanteHist,
     uMemoriaCalculoHist, uVersaoBaseHist, FCadTbSituacaoFund,
     FCadTbSituacaoPatroc, uImportarVersaoBase, uComparaVersoes,
     uConsultaCalculoAtivoHist, dBaseDados, FAnimacao,
     FCadTbTipoTempo, FOkImportaTotalPrev, FCadTempoRegra, FCadValorRegra,
     FCadGrupoContabil, FCadIntegracaoContabil,
     FCadVariaveisIntegracaoContabil, FOkAtualizarLancamentosContabeis,
     FOkCalculoTabuaServico, FCadRegrasTabuaServico, FExecutaQuery,
     FOkConsultaTabuaServico, FSimulacaoCalcAtuarial, FImportaVersao,
  fParticipante;

{$R *.DFM}     

procedure TfrmPrincipal.CriarArquivo1Click(Sender: TObject);
begin
   Inherited;
   AbrirForm(frmCadTbCampos,TfrmCadTbCampos, false);
end;

procedure TfrmPrincipal.FiltrarTabela1Click(Sender: TObject);
begin
   inherited;
// Form Para Filtrar a Tabela
   AbrirForm(FrmFiltraTabela,TFrmFiltraTabela,False );
end;

procedure TfrmPrincipal.GruposdeHipteses1Click(Sender: TObject);
Begin
   inherited;
// Form Para Criar Grupos de Hipoteses
   AbrirForm(FrmGrupoHipotese,TFrmGrupoHipotese,False );
End;

procedure TfrmPrincipal.GruposdeRegras1Click(Sender: TObject);
begin
   inherited;
// Form Para Criar Grupos de Regras
   AbrirForm(FrmGrupoRegra,TFrmGrupoRegra,False );
end;

procedure TfrmPrincipal.ExecutaHiptese1Click(Sender: TObject);
begin
   inherited;
// Form Para Executar Cálculo Atuarial
   AbrirForm(FrmCalculo,TFrmCalculo,False );
end;

//------------------------------------------------
// Abrir Formulario - Chama Pendencias RAD
procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   inherited;
   MHeight := 510;
end;
//-------------------------------------------------------

// Relatorio 3
procedure TfrmPrincipal.Relatrio31Click(Sender: TObject);
begin
   inherited;
end;

//-------------------------------------------------------
// Relatorio 2
procedure TfrmPrincipal.Relatrio21Click(Sender: TObject);
begin
   inherited;
end;

//-------------------------------------------------------
// Relatorio 1
procedure TfrmPrincipal.Relatorios1Click(Sender: TObject);
var pathsch,wpath,patharquivo,nome,
    diretoriotxt,nometabtxt : string;
begin
   If Abrir.Execute then
   Begin
      PathArquivo := uppercase(Abrir.filename);
      nome  := uppercase(ExtractFilename(Abrir.filename));
      NomeTabTXT := nome; // parametro para comp TabelaTXT

      If length(nome) > 12 then
      Begin  // nome + .txt
         showmessage('Nome do arquivo TXT maior que 8 Caracteres');
         exit;
      End;
   wpath := uppercase(ExtractFileDir(Abrir.filename));
   DiretorioTXT := wpath; // diretorio para comp TabelaTXT
   End
   Else
      exit;

   pathsch := copy(PathArquivo,1,length(PathArquivo) - 3)+'SCH';

   If Not FileExists(Pathsch) Then
   Begin
      showmessage('Este arquivo não tem estrutura criada');
      exit;
   End;

   // Caso Diretorio não Exista Cria Diretorio
   If Not DirectoryExists(wPath) Then
   Begin
      // Nao Consegiu Criar
      If Not CreateDir(wPath) Then
      Begin
         ShowMessage('Diretório de saída não pode ser criado ..... ');
         Exit;
      End;
   End;

   application.createform(TDmRelatoriosAtuariais,DmRelatoriosAtuariais);
   With DmRelatoriosAtuariais do
   Begin
      TabelaTXT.Databasename := DiretorioTXT;
      TabelaTXT.TableName := NomeTabTXT;
      TabelaTXT.open;
      Design.showmodal;
      TabelaTXT.close;
   End;
   DmRelatoriosAtuariais.Free;
end;
//--------------------------------------------------------------
//  Chama Relatorio Atuarial
procedure TfrmPrincipal.RelatrioAtuarial1Click(Sender: TObject);
begin
   inherited;

   FrmCadRelatorios := TFrmCadRelatorios.create(self);
   FrmCadRelatorios.Show;
end;

procedure TfrmPrincipal.TabelasBiomtricas1Click(Sender: TObject);
begin
   inherited;
   // Form Para Criar Visualização de Tabelas Biométricas
   AbrirForm(FrmGrupoBiometrica,TFrmGrupoBiometrica,False);
end;

procedure TfrmPrincipal.SelecionarCampos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmSelecaoTabs,TfrmSelecaoTabs, false);
end;

procedure TfrmPrincipal.Novo1Click(Sender: TObject);
begin
   frmCriaEstruturaTXT := TfrmCriaEstruturaTXT.Create(self);
   frmCriaEstruturaTXT.Show;
end;

procedure TfrmPrincipal.ImportaTabelasBiomtricas1Click(Sender: TObject);
begin
   Try
      abrirformmodal(frmExcelBio,TfrmExcelBio);
   Finally
      frmexcelBio.free;
   End;
end;

procedure TfrmPrincipal.GeraTabelas1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTbCampos,TfrmCadTbCampos, false);
end;

procedure TfrmPrincipal.GerarValores1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGeraValores,TfrmGeraValores, false);
end;

procedure TfrmPrincipal.TxtdeAferies1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmTXTdeAfericaoPart,TfrmTXTdeAfericaoPart, false);
end;

procedure TfrmPrincipal.EstadoCivil1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Estado Civil
   AbrirForm(FrmCadTbEstadoCivil,TFrmCadTbEstadoCivil,False);
end;

procedure TfrmPrincipal.GraudeDependncia1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Grau de Dependência
   AbrirForm(FrmCadTbGrauDependencia,TFrmCadTbGrauDependencia,False);
end;

procedure TfrmPrincipal.GraudeInstruo1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Grau de Instrução
   AbrirForm(FrmCadTbGrauInstrucao,TFrmCadTbGrauInstrucao,False);
end;

procedure TfrmPrincipal.TipodeCategoriaProfissional1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Categoria Profissional
   AbrirForm(frmCadTbTipoCategoriaPro,TfrmCadTbTipoCategoriaPro,False);
end;

procedure TfrmPrincipal.TipodeBenefcio1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Benefício
   AbrirForm(frmCadTbTipoBeneficio,TfrmCadTbTipoBeneficio,False);
end;

procedure TfrmPrincipal.TipodeTbua1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Tábua
   AbrirForm(frmCadTbTipoTabua,TfrmCadTbTipoTabua,False);
end;

procedure TfrmPrincipal.TipodeTempo1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Tempo
   AbrirForm(frmCadTbTipoTempo,TfrmCadTbTipoTempo,False);
end;

procedure TfrmPrincipal.TipodeValor1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Valor
   AbrirForm(frmCadTbTipoValor,TfrmCadTbTipoValor,False);
end;

procedure TfrmPrincipal.UnidadedeFederao1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Unidade da Federação
   AbrirForm(frmCadTbUnidadeFederacao,TfrmCadTbUnidadeFederacao,False);
end;

procedure TfrmPrincipal.EntidadedePrevidncia1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Entidade de Previdência
   AbrirForm(frmEntidadePrevidencia,TfrmEntidadePrevidencia,False);
end;

procedure TfrmPrincipal.Patrocinadora1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Patrocinadora
   AbrirForm(frmPatrocinadora,TfrmPatrocinadora,False);
end;

procedure TfrmPrincipal.PlanodeBenefcio1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Plano de Benefício
   AbrirForm(frmPlanoBeneficio,TfrmPlanoBeneficio,False);
end;

procedure TfrmPrincipal.mniLayoutArquivoClick(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Lay-out de Arquivo
   AbrirForm(frmCadLayoutArquivo,TfrmCadLayoutArquivo,False);
end;

procedure TfrmPrincipal.ClculoAtuarial1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmSimulacaoCalcAtuarial, TFrmSimulacaoCalcAtuarial, False);
end;

procedure TfrmPrincipal.ComposiodeClculo1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmComposicaoCalculo,TfrmComposicaoCalculo,False);
end;

procedure TfrmPrincipal.Atualizar1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmTabua,TfrmTabua,False);
end;

procedure TfrmPrincipal.mnuEstuturaBancoClick(Sender: TObject);
begin
   inherited;

   If CtrlDown and ShiftDown then
      Try
         frmExecutaQuery := TfrmExecutaQuery.Create(Nil);
         frmExecutaQuery.ShowModal;
      Finally
         frmExecutaQuery.Release;
         frmExecutaQuery := nil;
      End
   Else
      AbrirForm(frmCadTabelaSistema,TfrmCadTabelaSistema,False);
end;

procedure TfrmPrincipal.mnuTipoGrupoDadoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTbTipoGrupoDado,TfrmCadTbTipoGrupoDado,False);
end;

procedure TfrmPrincipal.ImportarTbua1Click(Sender: TObject);
begin
   inherited;
   screen.cursor := crHourGlass;
   AbrirForm(frmImportarTabua,TfrmImportarTabua,False);
   screen.cursor := crDefault;
end;

procedure TfrmPrincipal.Varivel1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVariavel,TfrmVariavel,False);
end;

procedure TfrmPrincipal.Frmula1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmFormula,TfrmFormula,False);
end;

procedure TfrmPrincipal.RotinadeClculo1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmRotinaCalculo,TfrmRotinaCalculo,False);
end;

procedure TfrmPrincipal.mniVersaoBaseClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadVersaoBase,TfrmCadVersaoBase, False);
end;

procedure TfrmPrincipal.mniVersaoBaseTrabClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVersaoBase,TfrmVersaoBase,False);
end;

procedure TfrmPrincipal.Paticipante1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmParticipante,TfrmParticipante,False);
end;

procedure TfrmPrincipal.mniImportarClick(Sender: TObject);
begin
   inherited;
   // Form Para Importar de Arquivo
   AbrirForm(frmImportaArquivo,TfrmImportaArquivo,False);
end;

procedure TfrmPrincipal.mniExportarClick(Sender: TObject);
begin
   inherited;
   // Form Para Importar de Arquivo
   AbrirForm(frmExportaArquivo,TfrmExportaArquivo,False);
end;

procedure TfrmPrincipal.tem1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmItemHipotese,TfrmItemHipotese,False);
end;

procedure TfrmPrincipal.GrupodePartipante1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGrupoParticipante,TfrmGrupoParticipante,False);
end;

procedure TfrmPrincipal.HiptesedeClculo1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmHipotese,TfrmHipotese,False);
end;

procedure TfrmPrincipal.TbuadeServio1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGeraTabuaServico,TfrmGeraTabuaServico,False);
end;

procedure TfrmPrincipal.EnquadramentoGruposParticipante1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmOkEnquadraParticipante,TfrmOkEnquadraParticipante,False);
end;

procedure TfrmPrincipal.Paticipante2Click(Sender: TObject);
begin
   If WG_CD_VERSAO = 0 then
   Begin
      MessageDlg('Selecione uma Versão da Base de Trabalho !', mtWarning, [mbOk], 0);
      AbrirFormModal(frmVersaoBase,TfrmVersaoBase);

      If WG_CD_VERSAO = 0 then
         exit;
   End;
   
   AbrirForm(frmParticipante,TfrmParticipante,False);
end;

procedure TfrmPrincipal.GrupodePartipante2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGrupoParticipante,TfrmGrupoParticipante,False);
end;

procedure TfrmPrincipal.EnquadramentodeParticipante1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmOkEnquadraParticipante,TfrmOkEnquadraParticipante,False);
end;

procedure TfrmPrincipal.EntidadedePrevidncia2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Entidade de Previdência
   AbrirForm(frmEntidadePrevidencia,TfrmEntidadePrevidencia,False);
end;

procedure TfrmPrincipal.Patrocinadora2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Patrocinadora
   AbrirForm(frmPatrocinadora,TfrmPatrocinadora,False);
end;

procedure TfrmPrincipal.PlanodeBenefcio2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Plano de Benefício
   AbrirForm(frmPlanoBeneficio,TfrmPlanoBeneficio,False);
end;

procedure TfrmPrincipal.GraudeDependncia2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Grau de Dependência
   AbrirForm(FrmCadTbGrauDependencia,TFrmCadTbGrauDependencia,False );
end;

procedure TfrmPrincipal.EstadoCivil2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Estado Civil
   AbrirForm(FrmCadTbEstadoCivil,TFrmCadTbEstadoCivil,False);
end;

procedure TfrmPrincipal.GraudeInstruo2Click(Sender: TObject);
begin
   // Form Para Cadastrar Tabela de Grau de Instrução
   AbrirForm(FrmCadTbGrauInstrucao,TFrmCadTbGrauInstrucao,False);
end;

procedure TfrmPrincipal.TipodeBenefcio2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Benefício
   AbrirForm(frmCadTbTipoBeneficio,TfrmCadTbTipoBeneficio,False);
end;

procedure TfrmPrincipal.TipodeCategoriaProfissional2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Categoria Profissional
   AbrirForm(frmCadTbTipoCategoriaPro,TfrmCadTbTipoCategoriaPro,False);
end;

procedure TfrmPrincipal.TipodeTbua2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Tábua
   AbrirForm(frmCadTbTipoTabua,TfrmCadTbTipoTabua,False);
end;

procedure TfrmPrincipal.TipodeTempo2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Tempo
   AbrirForm(frmCadTbTipoTempo,TfrmCadTbTipoTempo,False);
end;

procedure TfrmPrincipal.TipodeValor2Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Valor
   AbrirForm(frmCadTbTipoValor,TfrmCadTbTipoValor,False);
end;

procedure TfrmPrincipal.UnidadedaFederao1Click(Sender: TObject);
begin
   inherited;
   // Form Para Cadastrar Tabela de Tipo de Unidade da Federação
   AbrirForm(frmCadTbUnidadeFederacao,TfrmCadTbUnidadeFederacao,False);
end;

procedure TfrmPrincipal.ComposiodeCritica2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGrupoCritica,TfrmGrupoCritica,False);
end;

procedure TfrmPrincipal.CrticadeParticipante1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmOkCriticaParticipante,TfrmOkCriticaParticipante,False);
end;

procedure TfrmPrincipal.ToolbarButton971Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGrupoParticipante,TfrmGrupoParticipante,False);
end;

procedure TfrmPrincipal.ToolbarButton974Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmParticipante,TfrmParticipante,False);
end;

procedure TfrmPrincipal.ToolbarButton972Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVersaoBase,TfrmVersaoBase,False);
end;

procedure TfrmPrincipal.ToolbarButton973Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCalculoAtuarial,TfrmCalculoAtuarial,False);
end;

procedure TfrmPrincipal.ClculoAtuarial2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmConsultaCalculoAtivo,TfrmConsultaCalculoAtivo,False);
end;

procedure TfrmPrincipal.sbtnEnviaMensagensClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmParticipante,TfrmParticipante,False);
end;

procedure TfrmPrincipal.EfetivaClculoAtuarial1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEfetivaCalculo,TfrmEfetivaCalculo,False);
end;

procedure TfrmPrincipal.Relatrios1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMostraRelat,TfrmMostraRelat, false);
end;

procedure TfrmPrincipal.ConsultaCculoBeneficios1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmConsultaCalculo,TfrmConsultaCalculo,False);
end;

procedure TfrmPrincipal.TransferirparabasedeHistrico1Click(Sender: TObject);
begin
   If WG_CD_VERSAO = 0 then
   Begin
      MessageDlg('Selecione uma Versão da Base de Trabalho !',
                 mtWarning, [mbOk], 0);
      AbrirFormModal(frmVersaoBase,TfrmVersaoBase);

      If WG_CD_VERSAO = 0 then
         exit;
   End;

   If MessageBox(0,'Deseja transferir todos os dados da Base de Trabalho para o Histórico?','Cálculo Atuarial',4) <> IdYes Then
      exit;

   screen.cursor := crHourGlass;
   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

   dtmBaseDados.dbBaseDados.StartTransaction;

   ImportaBaseHistorico(WG_CD_VERSAO);

   If not(uImportarVersaoBase.cancelado) then
      If uImportarVersaoBase.falhou then
      Begin
         dtmBaseDados.dbBaseDados.RollBack;

         Try
            frmAnimacao.Close;
            frmAnimacao.Free;
         Except End;

         ShowMessage('Houve erros durante a Importação.');
         exit;
      End
   Else
   Begin
      dtmBaseDados.dbBaseDados.Commit;
      ShowMessage('Dados importados com Sucesso !!!');
   End;

   screen.cursor := crDefault;
end;

procedure TfrmPrincipal.Participante1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVersaoBaseHist,TfrmVersaoBaseHist,False);
   frmVersaoBaseHist.form := 'ParticipanteHist';
end;

procedure TfrmPrincipal.MemriadeClculo2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVersaoBaseHist,TfrmVersaoBaseHist,False);
   frmVersaoBaseHist.form := 'MemoriaCalculoHist';
end;

procedure TfrmPrincipal.SituaodaFundao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTbSituacaoFund,TfrmCadTbSituacaoFund,False);
end;

procedure TfrmPrincipal.SituaodaPatrocinadora1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTbSituacaoPatroc,TfrmCadTbSituacaoPatroc,False);
end;

procedure TfrmPrincipal.NovaVerso1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVersaoBaseHist,TfrmVersaoBaseHist,False);
   frmVersaoBaseHist.form := 'NovaBase';
end;

procedure TfrmPrincipal.ComparaVerses1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmComparaVersoes,TfrmComparaVersoes,False);
end;

procedure TfrmPrincipal.ImportarTOTALPREV1Click(Sender: TObject);
begin
   If WG_CD_VERSAO = 0 then
   Begin
      MessageDlg('Selecione uma Versão da Base de Trabalho !',
                 mtWarning, [mbOk], 0);
      AbrirFormModal(frmVersaoBase,TfrmVersaoBase);

      If WG_CD_VERSAO = 0 then
         exit;
   End;

   AbrirForm(frmOkImportaTotalPrev,TfrmOkImportaTotalPrev,False);
end;

procedure TfrmPrincipal.mnuSincronizarTabelasAuxClick(Sender: TObject);
begin
   AbrirForm(frmEntidadePrevidencia,TfrmEntidadePrevidencia,False );
   frmEntidadePrevidencia.form := 'ImportaTabelasAux';
   ShowMessage('Selecione uma Entidade de Previdência e clique em Sair.');
end;

procedure TfrmPrincipal.ClculoAtivos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVersaoBaseHist,TfrmVersaoBaseHist,False);
   frmVersaoBaseHist.form := 'CalculoAtivosHist';
end;

procedure TfrmPrincipal.ClculoBenefcios1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVersaoBaseHist,TfrmVersaoBaseHist,False);
   frmVersaoBaseHist.form := 'CalculoHist';
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var i: Integer;
begin
   inherited;

   If Sistema.FezLogin then
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

end;

procedure TfrmPrincipal.TempoXRegra1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTempoRegra,TfrmCadTempoRegra,False);
end;

procedure TfrmPrincipal.ValorXRegra1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadValorRegra,TfrmCadValorRegra,False);
end;

procedure TfrmPrincipal.Grupos2Click(Sender: TObject);
begin
   AbrirForm(frmCadGrupoContabil, TfrmCadGrupoContabil, False);
end;

procedure TfrmPrincipal.Parmetros1Click(Sender: TObject);
begin
   AbrirForm(frmCadVariaveisIntegracaoContabil, TfrmCadVariaveisIntegracaoContabil, False);
end;

procedure TfrmPrincipal.Cadastro1Click(Sender: TObject);
begin
   AbrirForm(frmCadIntegracaoContabil, TfrmCadIntegracaoContabil, False);
end;

procedure TfrmPrincipal.AtualizarLanamentosContbeis1Click(Sender: TObject);
begin
   Try
      AbrirFormModal(frmOkAtualizarLancamentosContabeis, TfrmOkAtualizarLancamentosContabeis);
   Finally
      frmOkAtualizarLancamentosContabeis.Release;
      frmOkAtualizarLancamentosContabeis := nil;
   End;
end;

procedure TfrmPrincipal.ClculodaTbuadeServio1Click(Sender: TObject);
begin
   Try
      AbrirFormModal(frmOkConsultaTabuaServico, TfrmOkConsultaTabuaServico);
   Finally
      frmOkConsultaTabuaServico.Release;
      frmOkConsultaTabuaServico := nil;
   End;
end;

procedure TfrmPrincipal.RegrasdeAjustedaTbuadeServio1Click(Sender: TObject);
begin
   AbrirForm(frmCadRegrasTabuaServico, TfrmCadRegrasTabuaServico, False);
end;

procedure TfrmPrincipal.muImportaVersaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmImportaVersao,TfrmImportaVersao,False);
end;

INITIALIZATION
   Sistema.NomeModulo      := 'Sistema Atuarial'; // Nome do Módulo
   Sistema.IdModulo        := 40 ;                // IdSistema cadastrado no SAD
   Sistema.Versao := '3.01.03';
   Sistema.NomeAplicativo  := 'Cálculo Atuarial';
   IntegraBack := TIntegraBack.create(true,true,true);
   Modulo := TModulo.Create;

   //Inicializa Variáveis Globais
   WG_CD_VERSAO          := 0;
   WG_CD_PESSOA_ENTID    := 0;
   WG_CD_PESSOA_PATROC   := 0;
   WG_CD_PLANO           := 0;
   WG_DT_REFER_BASE      := 0;
   WG_ENTID_PATROC_PLANO := '';

FINALIZATION
   Modulo.free;
   IntegraBack.free;     
end.


