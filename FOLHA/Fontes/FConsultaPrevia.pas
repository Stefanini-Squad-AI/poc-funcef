// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
{**************************************************************************************
Alteração...: MontaApresentacaoBasePagamento
Pendência   : WO29025
Data        : 29/12/2025
Responsável : Leandro Pocebon
Descrição   : Demostar valores novo cálculo do IR
****************************************************************************************
Pendência   : WO22006
Data        : 09/07/2025
Responsável : Leandro Pocebon
Descrição   : Ajuste mostar rubricas quando dois recebedores com mesmo nome
****************************************************************************************
Alteração   : MontaSelect1,
Pendência   : WO3895
Data        : 05/10/2023
Responsável : Leandro Pocebon
Descrição   : Ajuste na consulta para realizar busca pelo cpf do depenente
****************************************************************************************
Alteração   : .dfm
Pendência   : WO981
Data        : 05/06/2023
Responsável : André Imakawa
Descrição   : Ajuste na consulta da base REINF
****************************************************************************************
Alteração   : ExecutaDetalhe
Pendência   : SIG36844
Data        : 22/05/2023
Responsável : André Imakawa
Descrição   : Refazer SIG 99651
****************************************************************************************
Alteração   : ExecutaDetalhe
Pendência   : SIG135653
Data        : 10/05/2023
Responsável : André Imakawa
Descrição   : Desfazer SIG 99651
****************************************************************************************
Alteração   : ExecutaDetalhe
Pendência   : SIG99651
Data        : 05/11/2021
Responsável : André Imakawa
Descrição   : Ajuste para exibir base REINF
****************************************************************************************
Rotina      : .dfm
Autor(a)    : Andre Imakawa
Data        : 01/06/2022
Pendencia   : SIG84516
Alteração   : Busca pelo CPF do Titular
*****************************************************************************************************
Rotina      : formShow
Autor(a)    : edilaine
Data        : 22/03/2017
Pendencia   : SIG71773 (SOL247533-18324)
Alteração   : apresentação no dbgDetalhe da coluna Op.IR
*****************************************************************************************************
Alteração   : ExcluiRubricaPrevia e ExcluiContribuicao
Pendência   : SIG48227
Data        : 25/05/2021
Responsável : André Imakawa
Descrição   : ajuste para excluir o registro da TMPDesc e retornar o status na tabela de origem
****************************************************************************************
Alterao   : MontaQryMaster, MontaQryMasterAgrupado
Pendncia   : SIG79100
Data        : 09/01/2020
Responsvel : Taffarel Sevaybriker
Descrio   : Alterado para LEFT JOIN a juno com a tabela PESSOAFISICA para exibir
              os recebedores quando forem Pessoa Jurdica.
****************************************************************************************
Alteração   : MontaApresentacaoBasePagamento
              - Mudança de CdsBasePagamento.Insert para CdsBasePagamento.Append
Pendência   : SIG91756
Data        : 16/09/2019
Responsável : Fabio Sampaio
Descrição   : Alteração da ordenação do grid "Base de Pagamento"
****************************************************************************************
Alteração   : (.dfm tbsHstIsencao qryHstBenefIR qryHstIsento)  qryHstBenefIRAfterScroll
Pendência   : SIG 49800-60761
Data        : 11/09/2018
Responsável : Edilaine
Descrição   : vigência de isenção de IRRF sob a pessoa e benefício no processo de cálculo
              de IRRF Progressivo e Regressivo
****************************************************************************************
// Data       : 27/11/2017
// SIG        : 56702
// Autor      : Peterson Victor
// Descrição  : Alterações para tratar perfil de investimento
//***************************************************************************************************
Alteração   : (.dfm sbtnProcurar, sbtnAlterar, bbtnOk, bbtnCancelar)
Pendência   : SIG 27469
Data        : 29/06/2017
Responsável : Edilaine
Descrição   : alteração de valores na interface de previa para usuários responsáveis pelo
              processamento da Folha
****************************************************************************************
Pendência   : SOL 207789/16614 PPM 554282
Data        : 05/07/2015
Responsável : Fernando Xavier
Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das Informações da
              Fita de Crédito
****************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : qryRubicasDetalhe (dfm) (comentado FLGSALFAMILIA pois a carga da SQL é feita na função
             MontaQryDet (uConsultas -> RetornaConsultaPreviaDetalhe)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}
//--------------------------------------------------------------------------------
//Pendência   : SOL 218925 KTN 2051058
//Responsável : Fernando Xavier
//Data        : 24/10/2013
//Descrição   : As informações descritas devem ser buscadas da propria tabela Previa.
//------------------------------------------------------------------------------
//Pendência   : SOL 147391 KINTANA 1019719
//Responsável : BRUNO AZEVEDO
//Data        : 10/11/2010
//Descrição   : Erro na visualização da Prévia.
//------------------------------------------------------------------------------
// Autor(a)  : Renato Visoni
// Pendencia : SOL 138251 kintana 840758
// Alteração : Apresentar a conta certa quando for lote de resgate.
//------------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Data      : 13/10/2010
// Pendencia : SOL 145036 Kintana 970354
// Alteração : Senhores, Os relatórios da Prévia, Efetivação, Conferência PREVIA
//                  devem pegar os dados da conta bancária do histórico e não da situação cadastral.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryMasterAgrupado, MontaQryMaster
// Data      : 19/02/2008
// Pendencia : 27819
// Alteração : Ajuste na query da Consulta da prévia.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : ExecutaMontaSelect
// Data      : 19/02/2008
// Pendencia : 27409
// Alteração : Ajuste na pesquisa da Consulta da prévia.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : MontaQryMaster e MontaQryMasterAgrupado
// Data      : 22/06/2007
// Pendencia : 21962 (ReAbertura)
// Alteração : Ajustar a consulta para mostrar o favorecido qdo EPP.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Interface
// Data      : 31/08/2006
// Pendencia : 22941
// Alteração : Colocar o plano contábil no grid de rubricas.
//------------------------------------------------------------------------------
unit FConsultaPrevia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Spin, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Db, Wwdatsrc,
  DBTables, Wwquery, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, TB97Ctls,
  DBCtrls, wwdblook, ComCtrls, Udatabase, DBGrids, UObjFolha, uSistema,
  dBaseDados, uConsultas, uCmSqlParams, DBClient, uCMClientDataSet, ImgList,
  uCMTypes, TREdit, UFuncoesUteis, FObservacao;    //edilaine - SIG27469

type
  TOperacaoPrevia = (opIdle, opAlterar, opAlteraRub, opAlteraBase);   //edilaine - SIG27469
  TfrmConsultaPrevia = class(TfrmSairAjuda)
    qryPrevia: TwwQuery;
    dsPrevia: TwwDataSource;
    qryMatric: TwwQuery;
    MontaSelect1: TMontaSelect;
    dsRubricasDetalhe: TwwDataSource;
    qryRubricasDetalhe: TwwQuery;
    qryInscricao: TwwQuery;
    qryMatricIDPESSOA: TFloatField;
    qryMatricIDPESSJUR: TFloatField;
    dsSelecao: TwwDataSource;
    qrySelecao: TwwQuery;
    qryMatricINSCRICAONUMERO: TFloatField;
    PnlMatricOuInscricao: TPanel;
    LblInscricao: TLabel;
    LblMatric: TLabel;
    LblTitular: TLabel;
    LblPatrocinadora: TLabel;
    LblPlano: TLabel;
    dbedtitular: TwwDBEdit;
    dbedPatrocinadora: TwwDBEdit;
    dbedPlano: TwwDBEdit;
    EdtMatricula: TEdit;
    EdtNumInscr: TEdit;
    PnlHistoricoEDetalhes: TPanel;
    PnlHistorico: TPanel;
    dbgHistorico: TwwDBGrid;
    PnlDetalhes: TPanel;
    LblDataNasc: TLabel;
    LblNumDep: TLabel;
    LblBanco: TLabel;
    LblAgencia: TLabel;
    LblContaCorrente: TLabel;
    LblPortForma: TLabel;
    LblRecebedor: TLabel;
    dbedDataNasc: TwwDBEdit;
    dbedNumDepIR: TwwDBEdit;
    dbchIsentoIR: TDBCheckBox;
    dbedBanco: TwwDBEdit;
    dbedAgencia: TwwDBEdit;
    dbedContaCorrente: TwwDBEdit;
    dblkRecebedor: TwwDBLookupCombo;
    PnlGridDetalhe: TPanel;
    PnlValores: TPanel;
    LblProventos: TLabel;
    LblDescontos: TLabel;
    LblValLiquido: TLabel;
    pnlProventos: TPanel;
    pnlDescontos: TPanel;
    pnlLiquido: TPanel;
    dbedPortForma: TwwDBEdit;
    qryAux: TwwQuery;
    qryFator: TwwQuery;
    pnlSRB: TPanel;
    dbgFator: TwwDBGrid;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    qryFatorNOME: TStringField;
    qryFatorFATOR: TFloatField;
    dbChkIRTotal: TDBCheckBox;
    Label2: TLabel;
    EdtSituacao: TEdit;
    dsFator: TDataSource;
    pnlMostraSRB: TPanel;
    lblValorSRB: TLabel;
    lblValorINSS: TLabel;
    lblSuplementacao: TLabel;
    pnlValorSRB: TPanel;
    pnlValorINSS: TPanel;
    pnlValorSupl: TPanel;
    lblDtInicio: TLabel;
    edtDtInicio: TEdit;
    lblDtFim: TLabel;
    edtDtFinal: TEdit;
    qryMatricIDTITULAR: TFloatField;
    qryFatorBENEFICIARIO: TStringField;
    wwDBEdit2: TwwDBEdit;
    Label3: TLabel;
    PgRubricaBasePagamento: TPageControl;  // SOL 207789/16614 PPM 554282
    TbsRubricas: TTabSheet;      // SOL 207789/16614 PPM 554282
    TbsBasePagamento: TTabSheet; // SOL 207789/16614 PPM 554282
    PnlRubricas: TPanel;       // SOL 207789/16614 PPM 554282
    PnlBasePagamento: TPanel;   // SOL 207789/16614 PPM 554282
    CdsBasePagamento: TCMClientDataSet; // SOL 207789/16614 PPM 554282
    SqlCampos: TCMSqlParams;     // SOL 207789/16614 PPM 554282
    dsBasePagamento: TwwDataSource; // SOL 207789/16614 PPM 554282
    QryObtemBasePagamento: TwwQuery;
    ImlPadrao: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcDet: TToolbarButton97;
    Dock974: TDock97;
    Toolbar972: TToolbar97;
    sbtnAltBase: TToolbarButton97;
    pnlBotoes: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    dbgDetalhe: TwwDBGrid;
    dbgBasePagamento: TDBGrid;
    GroupBox1: TGroupBox;
    edtMesRef: TEdit;
    edtAnoRef: TEdit;
    chkIR: TCheckBox;
    chkSF: TCheckBox;
    lblOrdem: TLabel;
    lblRubrica: TLabel;
    lblFonte: TLabel;
    lblPrazo: TLabel;
    lblSequencia: TLabel;
    lblTD: TLabel;
    lblProvento: TLabel;
    lblDesconto: TLabel;
    lbl1: TLabel;
    lblDarf: TLabel;
    lblPlanoCont: TLabel;
    dblcPlanoContab: TwwDBLookupCombo;
    lblBPBruto: TLabel;
    lblBPDesconto: TLabel;
    lblBPLiquido: TLabel;
    lblBPIRRegr: TLabel;
    lblBPMargemC: TLabel;
    lblBPRenda: TLabel;
    lblBPMargemR: TLabel;
    lblBPIrInforma: TLabel;
    lblBPIrInforma13: TLabel;
    lblBPIrCompensa: TLabel;
    lblBPIrCompensa13: TLabel;
    updRubDetalhe: TUpdateSQL;
    dblcDARF: TwwDBLookupCombo;
    qryDarf: TwwQuery;
    dbedProvento: TwwDBEdit;
    dbedDesconto: TwwDBEdit;
    pnlOrdem: TPanel;
    pnlRubrica: TPanel;
    pnlFonte: TPanel;
    pnlPrazo: TPanel;
    pnlSeq: TPanel;
    pnlTD: TPanel;
    dbedVlrBruto: TwwDBEdit;
    dbedVlrDesconto: TwwDBEdit;
    dbedVlrLiquido: TwwDBEdit;
    dbedIrRegressivo: TwwDBEdit;
    dbedMargemC: TwwDBEdit;
    dbedRendaBase: TwwDBEdit;
    dbedMargemR: TwwDBEdit;
    dbedIrInforma: TwwDBEdit;
    dbedIrInforma13: TwwDBEdit;
    dbedIrCompensa: TwwDBEdit;
    dbedIrCompensa13: TwwDBEdit;
    dsQryBasePagto: TwwDataSource;
    updBasePagto: TUpdateSQL;
    lblIR: TLabel;
    lblSF: TLabel;
    qryLogExcPrevia: TwwQuery;
    qryLogAltPrevia: TwwQuery;
    dbedtVInfo: TwwDBEdit;
    qryLogAltBase: TwwQuery;
    qryPlContab: TwwQuery;   // SOL 207789/16614 PPM 554282
    dblcPerfil: TwwDBLookupCombo;
    Label4: TLabel;
    qryPerfil: TwwQuery;
    tbsHstIsencao: TTabSheet;
    pnlHstCalculo: TPanel;
    pnlHstIsencao: TPanel;
    pnlHstCalcTit: TPanel;
    dbgHstBenefIR: TwwDBGrid;
    pnlHstIsentoTit: TPanel;
    qryHstIsento: TwwQuery;
    qryHstIsentoIDHISTISENCAOIRRFBENF: TFloatField;
    qryHstIsentoIDPLANOPREV: TFloatField;
    qryHstIsentoIDBENEFICIO: TFloatField;
    qryHstIsentoNUMEROPROCESSO: TFloatField;
    qryHstIsentoIDPESSJUR: TFloatField;
    qryHstIsentoIDTITULAR: TFloatField;
    qryHstIsentoIDPLANOORIGEM: TFloatField;
    qryHstIsentoIDPESSOA: TFloatField;
    qryHstIsentoSEQPROPOSTA: TFloatField;
    qryHstIsentoDTINICIO: TStringField;
    qryHstIsentoDTFIM: TStringField;
    qryHstIsentoOBSERVACAO: TMemoField;
    dsHstIsento: TwwDataSource;
    dsHstBenefIR: TwwDataSource;
    qryHstBenefIR: TwwQuery;
    qryHstBenefIRBENEFICIO: TStringField;
    qryHstBenefIRESPECIE: TStringField;
    qryHstBenefIRFLGDESCIRMES: TFloatField;
    qryHstBenefIRMOLESTIAGRAVE: TStringField;
    qryHstBenefIRSITPROCESSO: TStringField;
    qryHstBenefIRIDPLANOPREV: TFloatField;
    qryHstBenefIRIDPESSJUR: TFloatField;
    qryHstBenefIRIDPESSOA: TFloatField;
    qryHstBenefIRIDBENEFICIO: TFloatField;
    qryHstBenefIRIDSITBENEFICIO: TFloatField;
    qryHstBenefIRNUMEROPROCESSO: TFloatField;
    qryHstBenefIRIDTITULAR: TFloatField;
    qryHstBenefIRIDPLANOORIGEM: TFloatField;
    qryHstBenefIRSEQPROPOSTA: TFloatField;
    qryHstBenefIREXISTEISENCAO: TStringField;
    dbgHstIsento: TwwDBGrid;
    qryHstIsentoDESCOCORRENCIA: TStringField;
    tbsBaseREINF: TTabSheet;
    pnlBaseREINF: TPanel;
    dsBaseREINF: TwwDataSource;
    qryBaseREINF: TwwQuery;
    dbgBaseREINF: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure EdtMatriculaEnter(Sender: TObject);
    procedure EdtNumInscrEnter(Sender: TObject);
    procedure qrySelecaoAfterScroll(DataSet: TDataSet);
    procedure dblkRecebedorChange(Sender: TObject);
    procedure EdtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNumInscrKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure qryPreviaAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnAltBaseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qryRubricasDetalheBeforePost(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcDetClick(Sender: TObject);
    procedure QryObtemBasePagamentoBeforePost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qrySelecaoBeforeScroll(DataSet: TDataSet);
    procedure qryHstBenefIRAfterScroll(DataSet: TDataSet);
    procedure dblkRecebedorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    bPrimeiro: boolean;
    sIdTitular,
    sMesCobranca,
    sTabela : string;
    rtotprov,rtotdesc : Real;
    sInscricao,
    sMatricula,
    sIdBenefic,
    sIdPessJur : string;

    opOperacao      : TOperacaoPrevia;  //edilaine - SIG27469
    opOperacaoDet   : TOperacaoPrevia;  //edilaine - SIG27469
    bPermissaoAlt   : boolean;          //edilaine - SIG27469
    bPreviaAlterada : boolean;          //edilaine - SIG27469
    bAltDadosPrevia : boolean;          //edilaine - SIG27469
    bBaseAlterada   : boolean;          //edilaine - SIG27469

    // Procedimento de acordo com o tipo de folha.
    Procedure MontaQryMaster;
    Procedure MontaQryMasterAgrupado;
    Procedure MontaQryDet;
    Procedure MontaQryDetAgrupado;
    function MontaConsulta: boolean;
    procedure MostraValores;
    procedure MostraSRB;
    procedure ExecutaMontaSelect;
    procedure MostraBasePagamento; // SOL 207789/16614 PPM 554282

    //edilaine - SIG27469 - inicio
    procedure BuscaDadosMatricula;
    procedure ConfiguraBotoes;
    procedure MontaApresentacaoBasePagamento;
    procedure SomaValoresProventoDesconto;
    function  GravarDados(sTextoObs : string) : Boolean;
    function  GravaObservacao(sTextoObs : string; var sMsgErro : string; var iIdObs : integer) : Boolean;
    function  ExcluiRubricaPrevia(iIdObs : integer; var sMsgErro : string) : Boolean;
    function  ExcluiContribuicao(pIdSeqInterno: Integer): Boolean;  // André Imakawa - SIG 48227
    function  InsereLogAlteraPrevia(iIdObs : integer; var sMsgErro : string; var bSoAltSeqRub : boolean) : Boolean;
    function  InsereLogBasePagamento(iIdObs : integer; var sMsgErro : string) : Boolean;
    function  AlteraRegistroOrigem(sMsgErro : string) : boolean;
    //edilaine - SIG27469 - fim

  public
    { Public declarations }
    function ExecutaMestre(pIdTitular, pMesCob: string) : boolean;
    function ExecutaDetalhe(pIdTitular, pMesCob: string) : boolean;
  end;

var
  frmConsultaPrevia: TfrmConsultaPrevia;

implementation

uses UFuncoesUteisFB, fAguarde, UMensErro, fPrincipal, uFolhaBenef, uAdmPrevFB;

{$R *.DFM}

procedure TfrmConsultaPrevia.ExecutaMontaSelect;
begin
  MontaSelect1.Filtro.Clear;

  // MontaSelect1.Filtro.Add('PR.IDPLANOORIGEM  = P.IDPLANOPREV'); //CPrev - 27409
  // este join seleciona o plano ativo por default
  MontaSelect1.Filtro.Add('(P.FLGDESATIVADO = 1 AND  P.IDPESSOA NOT IN (   '+
                          '                          SELECT PPP1.IDPESSOA  '+
                          '                          FROM PARTPREVPLAN PPP1 '+
                          '                          WHERE PPP1.IDPESSOA = P.IDPESSOA AND '+
                          '                          NVL(PPP1.FLGDESATIVADO, 0) = 0 ) OR NVL(P.FLGDESATIVADO, 0) = 0) OR '+
                           //Leandro - WO3895 - Inicio
 '                          (P.IDPESSOA IS NULL) ');

  MontaSelect1.Filtro.Add('P.IDPESSOA = PR.IDTITULAR');
  MontaSelect1.Filtro.Add('E.IDPESSOA = PR.IDTITULAR');
  MontaSelect1.Filtro.Add('TIT.IDPESSOA = PR.IDTITULAR');
  MontaSelect1.Filtro.Add('REC.IDPESSOA = PR.IDPESSOA');
  MontaSelect1.Filtro.Add('PA.IDPESSOA = PR.IDPATRO');
  MontaSelect1.Filtro.Add('DP.IDPESSOA(+) = PR.IDPESSOA');
  //Leandro - WO3895 - Inicio
  MontaSelect1.Filtro.Add('DP.IDTITULAR = PR.IDTITULAR');
  //Leandro - WO3895 - Fim
  MontaSelect1.Filtro.Add('P.IDPLANOPREV = PP.IDPLANOPREV');
  MontaSelect1.Filtro.Add('PR.IDPESSJUR = '+IntToStr(iIdFundacao));

  if MontaSelect1.Executar = mrOk then
  begin
    sIdTitular:=MontaSelect1.ValoresChave[0];
    EdtMatricula.Text:=MontaSelect1.ValoresChave[2];
    EdtNumInscr.Text :=MontaSelect1.ValoresChave[1];
  end
  else
    if sIdTitular = '' then
      sIdTitular:=qryMatric.fieldbyname('IDPESSOA').asstring;
  if sIdPessJur = '' then
    sIdPessJur:=qryMatric.fieldbyname('IDPESSJUR').asstring;

  sbtnProcurar.Down := false;         //edilaine - SIG27469
end;

procedure TfrmConsultaPrevia.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  //edilaine - SIG27469 - inicio
  {código do botão Procurar foi passado para funcao BuscaDadosMatricula}
  sMatricula:='';
  sInscricao:='';

  BuscaDadosMatricula();
  //edilaine - SIG27469 - fim
end;

function TfrmConsultaPrevia.MontaConsulta: boolean;
begin
  sMesCobranca:=qryselecao.fieldbyname('MESCOBRANCA').asstring;
  result:=true;
  if not ExecutaMestre(sIdTitular, sMesCobranca) then
  begin
    result:=false;
    If sMatricula <> '' then
      MsgDlg('Não existe Beneficiários na prévia para o Titular escolhido (Matric:'+sMatricula+').', 'ERRO', mtError, [mbOk,mbHelp],0);
    If sInscricao <> '' then
      MsgDlg('Não existe Beneficiários na prévia para o Titular escolhido (Insc:'+sInscricao+').', 'ERRO', mtError, [mbOk,mbHelp],0);
    qryselecao.close;
    Exit;
  end;
  Mostravalores;
end;

procedure TfrmConsultaPrevia.qrySelecaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not bPrimeiro then
    ExecutaMestre(sIdTitular, qryselecao.fieldbyname('MESCOBRANCA').asstring);

  PgRubricaBasePagamento.ActivePageIndex := 0; //SOL 207789/16614 PPM 554282
end;

function TfrmConsultaPrevia.ExecutaMestre(pIdTitular, pMesCob: string) : boolean;
begin
  pnlLiquido.Caption   := '';
  pnlProventos.Caption := '';
  pnlDescontos.Caption := '';
  pnlLiquido.Update;
  pnlProventos.Update;
  pnlDescontos.Update;
  qryPrevia.Close;
  qryPrevia.ParamByName('IDLOTE').AsInteger:=qrySelecao.FieldByName('IDLOTE').AsInteger;
  qryPrevia.ParamByName('IDTITULAR').AsString:=pIdTitular;
  qryPrevia.open;

  Result:=not qryPrevia.IsEmpty;
  dblkRecebedor.Text:=qryPrevia.FieldByName('BENEFICIARIO').AsString;
end;

procedure TfrmConsultaPrevia.qryPreviaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if not qryPrevia.ControlsDisabled then                     //edilaine - SIG27469
     ExecutaDetalhe(sIdTitular, sMesCobranca);
end;

procedure TfrmConsultaPrevia.dblkRecebedorChange(Sender: TObject);
begin
  inherited;
  if not qryPrevia.isempty then
  Begin
    if (activecontrol = sender) then
      if not ExecutaDetalhe(sIdTitular, sMesCobranca) then
      begin
        MsgDlg('Problema na consulta da prévia para o Beneficiário.', 'ERRO', mtError, [mbOk,mbHelp],0);
        Exit;
      end;

     PnlDetalhes.Height := 82;

     If (qryPrevia.FieldByName('IDRECEBEPGTO').AsInteger <>
         qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger) And
        (qryPrevia.FieldByName('IDRECEBEPGTO').AsInteger <> 0)  Then
       PnlDetalhes.Height := 128;
  End;
end;

function TfrmConsultaPrevia.ExecutaDetalhe(pIdTitular, pMesCob: string) : boolean;
begin
  result:=false;

  qryRubricasDetalhe.close;
  qryFator.Close;

  if (pIdTitular = '') or (pMesCob = '') then exit;

  //edilaine - SIG27469 - inicio
  qryRubricasDetalhe.Filtered := false;
  qryRubricasDetalhe.Filter   := 'OPERACAO <> ''E'' ';
  //edilaine - SIG27469 - fim

  qryRubricasDetalhe.ParamByName('IDTITULAR').AsString:=pIdTitular;
  qryRubricasDetalhe.ParamByName('IDLOTE').AsInteger:=qrySelecao.FieldByName('IDLOTE').AsInteger;
  qryFator.ParamByName('PIDTITULAR').AsString:=pidtitular;
  qryFator.ParamByName('PIDLOTE').AsInteger:=qrySelecao.FieldByName('IDLOTE').AsInteger;

  //OBTER AS RUBRICAS DO RESPONSAVEL
  qryRubricasDetalhe.ParamByName('IDPESSOA').AsInteger:=qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger;
  qryFator.ParamByName('PIDRESPONSAVEL').AsInteger:=qryPrevia.Fieldbyname('IDRESPONSAVEL').AsInteger;

  Try
    rtotprov := 0;
    rtotdesc := 0;
    qryRubricasDetalhe.open;
    qryFator.Open;
    (qryRubricasDetalhe.fieldbyname('VLRPROVENTO') as tfloatfield).DisplayFormat:='#0.00';   //edilaine - SIG27469
    (qryRubricasDetalhe.fieldbyname('VALORDESCONTO') as tfloatfield).DisplayFormat:='#0.00';

    //edilaine - SIG27469 - inicio
    {codigo transformado em uma procedure}
    SomaValoresProventoDesconto;

    Mostravalores;

    If pnlSRB.Visible then
      MostraSRB;

    //edilaine - SIG27469 - inicio
    qryRubricasDetalhe.Filtered := true;
    
    bPreviaAlterada := false;
    bBaseAlterada   := false;

    sbtnAlterar.Enabled := (Not qryRubricasDetalhe.IsEmpty) and (bPermissaoAlt);
    //edilaine - SIG27469 - fim

    //Andre Imakawa - SIG99651 - inicio
    qryBaseREINF.Close;
    qryBaseREINF.close;
    qryBaseREINF.ParamByName('IDLOTE').AsInteger := qrySelecao.FieldByName('IDLOTE').AsInteger;
    qryBaseREINF.ParamByName('IDRESPONSAVEL').AsInteger  := qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger;
    qryBaseREINF.ParamByName('IDTITULAR').AsInteger    := qryPrevia.FieldByName('IDTITULAR').AsInteger;
    qryBaseREINF.open;
    //Andre Imakawa - SIG99651 - fim

    MostraBasePagamento; // SOL 207789/16614 PPM 554282



    //edilaine - SIG49800-60761 - inicio
    qryHstBenefIR.Close;
    qryHstIsento.close;
    qryHstBenefIR.ParamByName('IDPESSJUR').AsInteger := qryPrevia.FieldByName('IDPATRO').AsInteger;
    qryHstBenefIR.ParamByName('IDPESSOA').AsInteger  := qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger;
    qryHstBenefIR.ParamByName('IDLOTE').AsInteger    := qrySelecao.FieldByName('IDLOTE').AsInteger;
    qryHstBenefIR.open;
    //edilaine - SIG49800-60761 - fim

  Except
    begin
      sbtnAlterar.Enabled := false;         //edilaine - SIG27469
      Raise;
    end;
  End;

  Result := Not qryRubricasDetalhe.IsEmpty;
end;

procedure TfrmConsultaPrevia.EdtMatriculaEnter(Sender: TObject);
begin
  inherited;
  EdtNumInscr.Clear;
end;

procedure TfrmConsultaPrevia.EdtNumInscrEnter(Sender: TObject);
begin
  inherited;
  EdtMatricula.Clear;
end;

procedure TfrmConsultaPrevia.EdtMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  EdtNumInscr.Clear;
end;

procedure TfrmConsultaPrevia.EdtNumInscrKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  EdtMatricula.Clear;
end;

procedure TfrmConsultaPrevia.FormCreate(Sender: TObject);
begin
  inherited;
  If SistemaFolha.FLGAGRUPARUBRICA = 1 Then
  begin
    MontaQryMaster;
    MontaQryDet;
  End
  Else
  Begin
    MontaQryMasterAgrupado;
    MontaQryDetAgrupado;
  End;
  dblkRecebedor.lookuptable:=qryPrevia;
end;

procedure TfrmConsultaPrevia.FormShow(Sender: TObject);
var wDia, wMes, wAno : Word;
begin
  inherited;
  WindowState:=wsMaximized;
  Refresh;
  With dbgHistorico.Selected do
  begin
    Clear;
    Add('IDLOTE'#9'9'#9'Nº Lote');
    Add('MESCOBRANCA'#9'9'#9'Mês Pagto');
    Add('DESCRICAO'#9'48'#9'Descrição');
  end;
  With dbgFator.Selected do
  begin
    Clear;
    Add('FATOR'#9'10'#9'Fator');
    Add('NOME'#9'13'#9'Descrição');
    Add('BENEFICIARIO'#9'11'#9'Beneficiário');
  end;
  With dbgDetalhe.Selected do
  begin
    Clear;
    Add('MES'#9'7'#9'Mês Ref.');
    Add('ORDEM_GRD'#9'4'#9'Ord');           //edilaine - SIG27469
    Add('CODRUBRICA'#9'5'#9'Rubrica ');
    Add('RUBRICA'#9'37'#9'Descrição');
    Add('VLRPROVENTO'#9'9'#9'Provento');    //edilaine - SIG27469
    Add('VALORDESCONTO'#9'9'#9'Desconto');
    Add('PARCELAS'#9'4'#9'Prazo');
    Add('SEQRUB'#9'4'#9'Seq.');
    Add('FLGIRRF'#9'2'#9'IR'#9'F');
    Add('CODIRRFDARF'#9'4'#9'Darf');
    Add('FONTEPAGADORA'#9'5'#9'F.Pag.');
    Add('FLGSALFAM'#9'2'#9'SF');
    Add('INFORMATIVO'#9'10'#9'V.Info');
    Add('FLGTIPODESC'#9'3'#9'TD');
    Add('IDPLANOCONTABIL'#9'4'#9'PC');
    Add('OPCAOIR'#9'4'#9'Op.IR');             //edilaine - SIG71773
    Add('CODNATREINF'#9'12'#9'Nat. REINF'); //André Imakawa - SIG 99651
    Add('NOMEPLANO'#9'4'#9'PERFIL INVESTIMENTO');
  end; {With}

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Consulta da Prévia.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  DecodeDate(Date, wAno, wMes, wDia);
  sbtnprocurar.Enabled:= true;
  pnlLiquido.Caption:= '';
  pnlProventos.Caption:='';
  pnlDescontos.Caption:='';

  //edilaine - SIG27469 - inicio
  opOperacao    := opIdle;
  opOperacaoDet := opIdle;
  bPermissaoAlt := sbtnAlterar.enabled;
  sbtnAlterar.Enabled := false;
  ConfiguraBotoes;
  //edilaine - SIG27469 - fim
end;

procedure TfrmConsultaPrevia.MostraValores;
begin
  pnlLiquido.Caption:= FloatToStrf((rTotProv-rTotDesc),ffnumber,15,2);
  pnlProventos.Caption:=FloatToStrf(rTotProv,ffnumber,15,2);
  pnlDescontos.Caption:=FloatToStrf(rTotDesc,ffnumber,15,2);
end;

procedure TfrmConsultaPrevia.MostraSRB;
var vsrb, vinss, vsup: double;
    bNaoUsada: boolean;
    sDtInicio, sDtFim: String;
begin
  bNaoUsada := False;
  sDtInicio := '';
  sDtFim    := '';

  vsrb:=SistemaFolha.PegaSRBBeneficio(qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
    sidtitular, inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger), bNaoUsada, sDtInicio, sDtFim);
  vinss:=SistemaFolha.PegaINSSBeneficio(qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
    sidtitular, inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger));
  vsup:=SistemaFolha.PegaValorIntegralBeneficio(qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
    sidtitular, inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger));

  edtDtInicio.Text := sDtInicio;
  edtDtFinal.Text  := sDtFim;

  if vsrb > 0 then
    pnlValorSRB.Caption:=FloatToStrf(vsrb,ffnumber,15,2)+' '
  else
    pnlValorSRB.Caption:='';
  if vinss > 0 then
    pnlValorINSS.Caption:=FloatToStrf(vinss,ffnumber,15,2)+' '
  else
    pnlValorINSS.Caption:='';
  if vsup = 0 then
  begin
    if (vsrb > 0) and (vinss > 0) then
      pnlValorSupl.caption:=FloatToStrf(vsrb-vinss,ffnumber,15,2)+' '
    else
      pnlValorSupl.caption:='';
  end
  else
    pnlValorSupl.Caption:=FloatToStrf(vsup,ffnumber,15,2)+' ';
end;

Procedure TfrmConsultaPrevia.MontaQryMaster;
// Query Master sem opção de abono e não agrupada
begin
  qryPrevia.Sql.clear;
  qryprevia.Sql.Add( 'SELECT '+
                     '       DISTINCT PJR.NOME AS PATROCINADORA, TIT.NOME AS TITULAR, '                       + #13 +
                     '       ELG.MATRICULA, '                                                                 + #13 +
                     '       BEN.NOME AS BENEFICIARIO, '                                                      + #13 +
                     '       PLP.NOME AS PLANO, '                                                             + #13 +
                     '       PPP.INSCRICAONUMERO, '                                                           + #13 +
                     '       SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),7,4) || '                       + #13 +
                     '              SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),3,3) AS DATAPAGAMENTO, ' + #13 +
                     '       PSF.NUMDEPIRRF, '                                                                + #13 +
                     '       NVL(PSF.NUMDEPSALF,0) AS NUMDEPSALF , '                                          + #13 +
                     '       NVL(PSF.FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS , '                              + #13 +
                     '       NVL(PSF.FLGISENTOIRRF,0) AS FLGISENTOIRRF, '                                     + #13 +
                     '       PSF.DATANASC, '                                                                  + #13 +
                     '       HST.IDRESPONSAVEL, '                                                             + #13 +
                     '       HST.IDRECEBEPGTO, '                                                              + #13 +
                     '       FAV.NOME AS FAVORECIDO, '                                                        + #13 +
                     //EXIBE RESPONSAVEL COMO PESSOA
                     '       HST.IDRESPONSAVEL AS IDPESSOA, '                                                 + #13 +
                     '       HST.MESCOBRANCA, '                                                               + #13 +
                     '       HST.IDPESSJUR, '                                                                 + #13 +
                     '       HST.NUMBANCO, '                                                                  + #13 + // SOL 218925 KTN 2051058
                     '       HST.NUMAGENCIA, '                                                                + #13 + //SOL 218925 KTN 2051058
                     '       HST.CONTACORRENTE, '                                                             + #13 +  //  final SOL 145036 Kintana 970354 // SOL 218925 KTN 2051058
                     '       PTF.DESCRICAO, '                                                                 + #13 +
                     '       BAN.NUMBANCO, '                                                                  + #13 +     //  inicio SOL 145036 Kintana 970354 // SOL 218925 KTN 2051058
                     '       AGB.NUMAGENCIA, '                                                                + #13 + // SOL 218925 KTN 2051058
                     '       CBC.CONTACORRENTE, HST.IDTITULAR '                                               + #13 + // SOL 218925 KTN 2051058
                     '       , HST.IDPLANOPREV '                                                              + #13 + //edilaine - SIG27469
                     '       , HST.IDPATRO     '                                                              + #13 + //Andre Imakawa - SIG 49800-60761
                      // SOL 207789/16614 PPM 554282
                     'FROM PREVIA HST, '                                                                      + #13 +
                     '     PARTPREVPLAN PPP, '                                                                + #13 +
                     '     ELEGPATRO ELG, '                                                                   + #13 +
                     '     PESSOAFISICA PSF, '                                                                + #13 +
                     '     PESSOA PJR, '                                                                      + #13 +
                     '     PESSOA TIT, '                                                                      + #13 +
                     '     PESSOA BEN, '                                                                      + #13 +
                     '     PESSOA FAV, '                                                                      + #13 +
                     '     PLANPREV PLP, '                                                                    + #13 +
                     '     PORTADORFORMA PTF, '+
                     '     BANCO BAN, '                                                                       + #13 +
                     '     AGENCIABANCARIA AGB, '                                                             + #13 +
                     '     CONTABANCARIA CBC '                                                                + #13 +
                     'WHERE (HST.IDLOTE          = :IDLOTE) '                                                 + #13 +
                     '  AND (HST.IDTITULAR       = :IDTITULAR) '                                              + #13 +
                     '  AND (PJR.IDPESSOA        = HST.IDPATRO) '                                             + #13 +
                     '  AND (PPP.IDPESSJUR       = HST.IDPATRO) '                                             + #13 +
                     '  AND (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+)) '                                     + #13 +
                     '  AND (PPP.IDPESSOA        = HST.IDTITULAR) '                                           + #13 +
                     '  AND (TIT.IDPESSOA        = HST.IDTITULAR) '                                           + #13 +
                     '  AND (BEN.IDPESSOA        = HST.IDRESPONSAVEL) '                                       + #13 +
                     '  AND (((HST.IDTITULAR = HST.IDPESSOA) AND (PPP.IDPLANOPREV = HST.IDPLANOPREV)) OR '    + #13 +
                     '     ((HST.IDTITULAR <> HST.IDPESSOA) AND (PPP.IDPLANOPREV = HST.IDPLANOORIGEM))) '     + #13 +
                     '  AND (PLP.IDPLANOPREV     = HST.IDPLANOPREV) '                                         + #13 +
                     '  AND (ELG.IDPESSOA        = HST.IDTITULAR) '                                           + #13 +
                     '  AND (ELG.IDPESSJUR       = HST.IDPATRO) '                                             + #13 +
                     '  AND (PSF.IDPESSOA(+)        = BEN.IDPESSOA) '                                         + #13 + //TAES - SIG79100 
                     '  AND (BEN.IDPESSOA        = CBC.IDPESSOA(+)) '                                         + #13 +
                     '  AND (CBC.IDAGENCIA       = AGB.IDPESSOA(+)) '                                         + #13 +
                     '  AND (CBC.FLGCONTAPREF(+) = 1) '                                                       + #13 +
                   //'  AND (HST.IDRECEBEPGTO    = FAV.IDPESSOA(+)) '                                         + #13 + //CPrev - 27819
                     '  AND (NVL(HST.IDRECEBEPGTO, HST.IDRESPONSAVEL)  = FAV.IDPESSOA(+)) '                         + #13 + //CPrev - 27819
                     '  AND (AGB.IDBANCO         = BAN.IDPESSOA(+))');

  qryPrevia.ParamByName('IDTITULAR').datatype := ftinteger;
  qryPrevia.ParamByName('IDLOTE').datatype := ftinteger;
  qryPrevia.prepare;
end;

Procedure TfrmConsultaPrevia.MontaQryMasterAgrupado;
begin
  qryPrevia.sql.clear;
  qryPrevia.SQL.Add( //EXIBE RESPONSAVEL COMO PESSOA
                     'SELECT DISTINCT HST.IDRESPONSAVEL AS IDPESSOA, '                                                 + #13 +
                     '                PJR.NOME AS PATROCINADORA, '                                                     + #13 +
                     '                TIT.NOME AS TITULAR, '                                                           + #13 +
                     '                ELG.MATRICULA, '                                                                 + #13 +
                     '                BEN.NOME AS BENEFICIARIO, '                                                      + #13 +
                     '                PLP.NOME AS PLANO, '                                                             + #13 +
                     '                PPP.INSCRICAONUMERO, '                                                           + #13 +
                     '                SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),7,4) || '                       + #13 +
                     '                       SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),3,3) AS DATAPAGAMENTO, ' + #13 +
                     '                PSF.NUMDEPIRRF, '                                                                + #13 +
                     '                NVL(PSF.NUMDEPSALF,0) AS NUMDEPSALF, '                                           + #13 +
                     '                NVL(PSF.FLGISENTOIRRF,0) AS FLGISENTOIRRF, '                                     + #13 +
                     '                NVL(PSF.FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS , '                              + #13 +
                     '                PSF.DATANASC, '                                                                  + #13 +
                     '                HST.IDRESPONSAVEL, '                                                             + #13 +
                     '                HST.IDRECEBEPGTO, '                                                              + #13 +
                     '                FAV.NOME AS FAVORECIDO, '                                                        + #13 +
                     '                HST.IDPESSJUR, '                                                                 + #13 +
                     '                HST.NUMBANCO, '                                                                  + #13 + // SOL 218925 KTN 2051058
                     '                HST.NUMAGENCIA, '                                                                + #13 + // SOL 218925 KTN 2051058
                     '                HST.CONTACORRENTE, '                                                             + #13 +  // final SOL 145036 Kintana 970354 // SOL 218925 KTN 2051058
                     '                PTF.DESCRICAO, '                                                                  + #13 +
                     '                BAN.NUMBANCO, '                                                                  + #13 +   // inicio SOL 145036 Kintana 970354 // SOL 218925 KTN 2051058
                     '                AGB.NUMAGENCIA, '                                                                + #13 + // SOL 218925 KTN 2051058
                     '                CBC.CONTACORRENTE, HST.IDTITULAR '                                               + #13 + // SOL 218925 KTN 2051058 //SOL 207789/16614 PPM 554282
                     '                , HST.IDPLANOPREV '                                                              + #13 + //edilaine - SIG27469
                     '                , HST.IDPATRO     '                                                              + #13 + //Andre Imakawa - SIG 49800-60761
                     'FROM PREVIA HST, '                                                                               + #13 +
                     '     PARTPREVPLAN PPP, '                                                                         + #13 +
                     '     ELEGPATRO ELG, '                                                                            + #13 +
                     '     PESSOA TIT, '                                                                               + #13 +
                     '     PESSOA PJR, '                                                                               + #13 +
                     '     PESSOA BEN, '                                                                               + #13 +
                     '     PESSOA FAV, '                                                                               + #13 +
                     '     PLANPREV PLP, '                                                                             + #13 +
                     '     PESSOAFISICA PSF, '                                                                         + #13 +
                     '     PORTADORFORMA PTF, '                                                                        + #13 +
                     '     BANCO BAN, '                                                                                + #13 +
                     '     AGENCIABANCARIA AGB, '                                                                      + #13 +
                     '     CONTABANCARIA CBC '                                                                         + #13 +
                     'WHERE (HST.IDLOTE          = :IDLOTE) '                                                          + #13 +
                     '  AND (PJR.IDPESSOA        = HST.IDPATRO) '                                                      + #13 +
                     '  AND (HST.IDTITULAR       = :idTitular) '                                                       + #13 +
                     '  AND (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+)) '                                              + #13 +
                     '  AND (PPP.IDPESSJUR       = HST.IDPATRO) '                                                      + #13 +
                     '  AND (((HST.IDTITULAR     = HST.IDPESSOA) AND (PPP.IDPLANOPREV = HST.IDPLANOPREV)) OR '         + #13 +
                     '      ((HST.IDTITULAR      <> HST.IDPESSOA) AND (PPP.IDPLANOPREV = HST.IDPLANOORIGEM))) '        + #13 +
                     '  AND (PLP.IDPLANOPREV     = HST.IDPLANOPREV) '                                                  + #13 +
                     '  AND (PPP.IDPESSOA        = HST.IDTITULAR) '                                                    + #13 +
                     '  AND (TIT.IDPESSOA        = HST.IDTITULAR) '                                                    + #13 +
                     '  AND (BEN.IDPESSOA        = HST.IDRESPONSAVEL) '                                                + #13 +
                     '  AND (ELG.IDPESSOA        = HST.IDTITULAR) '                                                    + #13 +
                     '  AND (ELG.IDPESSJUR       = HST.IDPATRO) '                                                      + #13 +
                     '  AND (PSF.IDPESSOA(+)        = BEN.IDPESSOA) '                                                  + #13 + //TAES - SIG79100
                     '  AND (BEN.IDPESSOA        = CBC.IDPESSOA(+)) '                                                  + #13 +
                     '  AND (CBC.IDAGENCIA       = AGB.IDPESSOA(+)) '                                                  + #13 +
                     '  AND (CBC.FLGCONTAPREF(+) = 1) '                                                                + #13 +
                   //'  AND (HST.IDRECEBEPGTO    = FAV.IDPESSOA(+)) '                                                  + #13 + //CPrev - 27819
                     '  AND (NVL(HST.IDRECEBEPGTO, HST.IDRESPONSAVEL)  = FAV.IDPESSOA(+)) '                                  + #13 + //CPrev - 27819
                     '  AND (AGB.IDBANCO         = BAN.IDPESSOA(+)) ');

  qryPrevia.ParamByName('IDLOTE').datatype:=ftinteger;
  qryPrevia.ParamByName('IDTITULAR').datatype:=ftinteger;
  qryPrevia.prepare;
end;

Procedure TfrmConsultaPrevia.MontaQryDet;
Begin
  qryRubricasDetalhe.Sql.clear;
  qryRubricasDetalhe.Sql.add(RetornaConsultaPreviaDetalhe);
  qryRubricasDetalhe.prepare;
End;

Procedure TfrmConsultaPrevia.MontaQryDetAgrupado;
Begin
  qryRubricasDetalhe.Sql.clear;
  qryRubricasDetalhe.Sql.add(RetornaConsultaPreviaDetalhe);
  qryRubricasDetalhe.prepare;
End;

procedure TfrmConsultaPrevia.MostraBasePagamento; // SOL 207789/16614 PPM 554282 criação do metodo
begin
    QryObtemBasePagamento.close;
//  QryObtemBasePagamento.Prepare;
    QryObtemBasePagamento.ParamByName('IDLOTE').AsString    := qrySelecao.FieldByName('IDLOTE').AsString;
    QryObtemBasePagamento.ParamByName('IDTITULAR').AsString := qryPrevia.FieldByName('IDTITULAR').AsString;
    QryObtemBasePagamento.ParamByName('IDPESSOA').AsString  := qryPrevia.FieldByName('IDRESPONSAVEL').AsString;
    QryObtemBasePagamento.Open;

    SqlCampos.Prepare;
    SqlCampos.Open;

    //edilaine - SIG27469
    {codigo foi transferido para uma procedure}
    MontaApresentacaoBasePagamento;
end;


//edilaine - SIG27469 - inicio
procedure TfrmConsultaPrevia.BuscaDadosMatricula;
begin
  rTotProv:= 0;
  rTotDesc:= 0;
  
  //edilaine - SIG27469 - inicio
  {AO PRESSIONAR O BOTÃO PROCURAR NÃO CONSIDERAR O VALOR DA MATRÍCULA
   OU INSCRIÇÃO CORRENTE}
  {if activecontrol <> sBtnProcurar then
  begin
    sMatricula:=trim(EdtMatricula.Text);
    sInscricao:=trim(EdtNumInscr.Text);
  end
  else
  begin
    sMatricula:='';
    sInscricao:='';
  end;
  }//edilaine - SIG27469 - fim

  sIdTitular:='';
  sIdBenefic:='';
  sIdPessjur:='';
  edtSituacao.Text:='';
  dblkRecebedor.Text:='';
  edtDtInicio.Text:='';
  edtDtFinal.Text:='';
  pnlValorINSS.Caption:='0,00';
  pnlValorSRB.Caption:='0,00';
  pnlValorSupl.Caption:='0,00';
  qrySelecao.Close;
  qryFator.Close;
  qryPrevia.Close;

  if (sMatricula = '') and (sInscricao = '') then // MATRICULA E INSCRICAO NÃO PREENCHIDOS
    ExecutaMontaSelect
  else
  Begin // MATRICULA OU INSCRICAO PREENCHIDOS
    qryPrevia.close;
    qryRubricasDetalhe.close;
    pnlproventos.caption:='';
    pnldescontos.caption:='';
    pnlliquido.caption:= '';
    application.processmessages;
    sIdTitular:='';
    sIdPessJur:='';
    if sMatricula <> '' then // MATRICULA PREENCHIDA
    begin
      qryMatric.Close;
      qryMatric.ParamByName('NUMMATRICULA').asstring:=sMatricula+'%';
      qryMatric.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
      qryMatric.Open;
      if qryMatric.IsEmpty then
      begin
        EdtMatricula.SetFocus;
        MsgDlg('Não existe o Participante escolhido (Matric:'+sMatricula+').', 'ERRO', mtError, [mbOk,mbHelp],0);
        qrySelecao.Close;
        dblkRecebedor.Text:='';
        Exit;
      end
      else
        If qrymatric.recordcount > 1 then
        begin
          MsgDlg('Foi identificado mais de um participante para a Matricula digitada.'+
                 #13#13+'Deve-se selecionar o participante desejado na tela de busca a seguir.',
                 'Informação', mtWarning, [mbOk,mbHelp], 0);
          ExecutaMontaSelect;
        end;
      if sIdTitular = '' then sIdTitular:=qryMatric.fieldbyname('IDTITULAR').asstring;
      if sIdPessJur = '' then sIdPessJur:=qryMatric.fieldbyname('IDPESSJUR').asstring;
      EdtMatricula.SetFocus;
      EdtNumInscr.Text:=qryMatric.FieldByName('INSCRICAONUMERO').AsString;
    end;
    if sInscricao <> '' then // INSCRICAO PREENCHIDA
    begin
      qryInscricao.Close;
      qryInscricao.ParamByName('INSCRICAO').asstring:=sInscricao;
      qryInscricao.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
      qryInscricao.Open;
      if qryInscricao.IsEmpty then
      begin
        EdtMatricula.SetFocus;
        MsgDlg('Não existe o Participante escolhido (Inscrição:'+sInscricao+').', 'ERRO', mtError, [mbOk,mbHelp],0);
        qrySelecao.Close;
        dblkRecebedor.Text:='';
        Exit;
      end
      else
        If qryInscricao.recordcount > 1 then
        begin
          MsgDlg('Foi identificado mais de um participante para a Inscrição digitada.'+
                 #13#13+'Deve-se selecionar o participante desejado na tela de busca a seguir.',
                 'Informação', mtWarning, [mbOk,mbHelp], 0);
          ExecutaMontaSelect;
        end;
      if sIdTitular = '' then
        sIdTitular:=qryInscricao.fieldbyname('IDPESSOA').asstring;
      if sIdPessJur = '' then
        sIdPessJur:=qryInscricao.fieldbyname('IDPESSJUR').asstring;
      EdtNumInscr.SetFocus;
      EdtMatricula.Text:=qryInscricao.FieldByName('MATRICULA').AsString;
    end;
  end;
  if sIdTitular = '' then exit;
  bPrimeiro:=true;
  qrySelecao.Close;
  qryselecao.parambyname('TITULAR').asstring:=sIdTitular;
  qryselecao.parambyname('PIDFUNDACAO').asinteger:=iidfundacao;
  qrySelecao.Open;
  if not MontaConsulta then
  begin
    EdtNumInscr.Text:='';
    EdtMatricula.Text:='';
  end;
  bPrimeiro:=false;

  (* Busca situação na Fundação *)
  With qryAux do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT ST.DESCRICAO '+
            ' FROM PARTPREVPLAN PV, SITPART ST '+
            ' WHERE PV.IDPESSOA = '+sIdTitular+
            ' AND PV.FLGDESATIVADO = 0 '+
            ' AND PV.IDSITPART = ST.IDSITPART');
    Open;
    EdtSituacao.Text:=Fields[0].AsString;
    Close;
  end; {With}

  (*  Coloca o titular como prioridade  para exibir, *)
  (*  caso esteja como beneficiário *)
  qryPrevia.DisableControls;                     //edilaine - SIG27469
  qryPrevia.First;
  while (Not qryPrevia.Eof) And
        (qryPrevia.FieldByName('TITULAR').AsString <>
         qryPrevia.FieldByName('BENEFICIARIO').AsString) do
    qryPrevia.Next;
  If qryPrevia.Eof then
    qryPrevia.First;
  qryPrevia.EnableControls;                     //edilaine - SIG27469

  dblkRecebedor.LookupValue:=qryPrevia.FieldByName('BENEFICIARIO').AsString;
  dblkRecebedor.Text:=qryPrevia.FieldByName('BENEFICIARIO').AsString;
  ExecutaDetalhe(sIdTitular, sMesCobranca);
end;

procedure TfrmConsultaPrevia.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //edilaine - SIG27469 - inicio
  if opOperacao <> opIdle then
  begin
     bbtnCancelarClick(nil);
     sbtnAlterar.Down := false;
     exit;
  end;
  //edilaine - SIG27469 - fim

  sbtnAltDet.Enabled  := Not qryRubricasDetalhe.IsEmpty;
  sbtnExcDet.Enabled  := Not qryRubricasDetalhe.IsEmpty;
  sbtnAltBase.Enabled := not CdsBasePagamento.IsEmpty;

  bbtnConfirmar.Enabled := true;
  bbtnCancelar.Enabled  := true;

  opOperacao := opAlterar;          //edilaine - SIG27469
end;

procedure TfrmConsultaPrevia.ConfiguraBotoes;
begin
  if opOperacaoDet <> opIdle then
  begin
    pnlBotoes.Visible := True;
    if opOperacaoDet = opAlteraRub then
       dbgDetalhe.SendToBack
    else
       dbgBasePagamento.SendToBack;
  end
  else
  begin
    pnlBotoes.Visible := false;

    dbgDetalhe.BringToFront;
    dbgBasePagamento.BringToFront;

    sbtnAltDet.down  := false;
    sbtnExcDet.down  := false;
    sbtnAltBase.down := false;
  end;
end;

procedure TfrmConsultaPrevia.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if (qrySelecao.FieldByName('EFETIVADO').AsString = 'S') then
  begin
    MsgDlg('Não é permitido Alterar a rubrica, pois esta já foi efetivada.', 'ERRO', mtError, [mbOk],0);
    sbtnAltDet.down := false;
    exit;
  end;

  qryPlContab.Close;
  qryPlContab.ParamByName('IDPLANOPREV').AsInteger := qryPrevia.FieldByName('IDPLANOPREV').AsInteger;
  qryPlContab.Open;

  //Peterson Victor  SIG56702 inicio
  qryPerfil.Close;
  qryPerfil.ParamByName('IDPLANOPREV').AsInteger := qryPrevia.FieldByName('IDPLANOPREV').AsInteger;
  qryPerfil.Open;
  //Peterson Victor SIG56702 fim

  qryDarf.close;
  qryDarf.Open;

  opOperacaoDet := opAlteraRub;

  edtMesRef.text     := RetornaNomeMes( StrToInt(Copy(qryRubricasDetalhe.FieldByName('MES').AsString,6,2)) );
  edtAnoRef.Text     := Copy(qryRubricasDetalhe.FieldByName('MES').AsString,1,4);
  chkIR.checked      := (qryRubricasDetalhe.FieldByName('FLGIRRF').AsInteger = 1);
  chkSF.checked      := (qryRubricasDetalhe.FieldByName('FLGSALFAM').AsInteger = 1);
  pnlOrdem.caption   := qryRubricasDetalhe.FieldByName('ORDEM_GRD').AsString;
  pnlRubrica.caption := qryRubricasDetalhe.FieldByName('RUBRICA').AsString;
  pnlFonte.caption   := qryRubricasDetalhe.FieldByName('FONTEPAGADORA').AsString;
  pnlPrazo.caption   := qryRubricasDetalhe.FieldByName('PARCELAS').AsString;
  pnlSeq.caption     := qryRubricasDetalhe.FieldByName('SEQRUB').AsString;
  pnlTD.caption      := qryRubricasDetalhe.FieldByName('FLGTIPODESC').AsString;

  dbedProvento.enabled := (qryRubricasDetalhe.FieldByName('FLGDESCONTO').AsInteger = 0);
  dbedDesconto.enabled := (qryRubricasDetalhe.FieldByName('FLGDESCONTO').AsInteger = 1);

  if dbedProvento.enabled then
     dbedProvento.Setfocus
  else if dbedDesconto.enabled then
     dbedDesconto.SetFocus
  else
     dbedtVInfo.SetFocus;
     
  qryRubricasDetalhe.Edit;

  bAltDadosPrevia := false; 

  ConfiguraBotoes;
end;

procedure TfrmConsultaPrevia.sbtnAltBaseClick(Sender: TObject);
begin
  inherited;

  if (QryObtemBasePagamento.FieldByName('FLGEFETIVADO').AsString = '1') and
     (QryObtemBasePagamento.FieldByName('IDHSTFOLHABENEF').AsString <> '') then
  begin
    MsgDlg('Não é permitido Alterar o lançamento da base de pagamento, pois este já foi efetivado.', 'ERRO', mtError, [mbOk],0);
    sbtnAltBase.down := false;
    exit;
  end;

  opOperacaoDet := opAlteraBase;
  dbedVlrBruto.setfocus;

  QryObtemBasePagamento.edit;

  bAltDadosPrevia := false;   

  ConfiguraBotoes;
end;

procedure TfrmConsultaPrevia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) and ((activecontrol = EdtMatricula) or (activecontrol = EdtNumInscr)) then
  begin
    sMatricula:=trim(EdtMatricula.Text);
    sInscricao:=trim(EdtNumInscr.Text);

    BuscaDadosMatricula;
  end;
end;

procedure TfrmConsultaPrevia.qryRubricasDetalheBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if (qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat <> qryRubricasDetalhe.FieldByName('VALORPROVENTO').OldValue) or
     (qryRubricasDetalhe.FieldByName('VALORINFO').AsFloat <> qryRubricasDetalhe.FieldByName('VALORINFO').OldValue) or
     (qryRubricasDetalhe.FieldByName('CODIRRFDARF').AsString <> qryRubricasDetalhe.FieldByName('CODIRRFDARF').OldValue) or
     (qryRubricasDetalhe.FieldByName('IDPLANOCONTABIL').AsString <> qryRubricasDetalhe.FieldByName('IDPLANOCONTABIL').OldValue) or
     (qryRubricasDetalhe.FieldByName('ORDEM_GRD').AsString <> qryRubricasDetalhe.FieldByName('ORDEM_GRD').OldValue) or
     (qryRubricasDetalhe.FieldByName('IDPERFILINVEST').AsString <> qryRubricasDetalhe.FieldByName('IDPERFILINVEST').OldValue) then    //Peterson Victor  SIG56702
  begin
    qryRubricasDetalhe.FieldByName('ALTMANUAL').AsString := 'S';

    if qryRubricasDetalhe.FieldByName('OPERACAO').AsString  = '.' then
       qryRubricasDetalhe.FieldByName('OPERACAO').AsString  := 'A';

    if (qryRubricasDetalhe.FieldByName('VALORINFO').AsFloat <> qryRubricasDetalhe.FieldByName('VALORINFO').OldValue) then
       qryRubricasDetalhe.FieldByName('INFORMATIVO').AsString := qryRubricasDetalhe.FieldByName('VALORINFO').AsString;

    bAltDadosPrevia := true;          //edilaine - SIG27469
    bPreviaAlterada := true;
  end;
end;

procedure TfrmConsultaPrevia.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  if opOperacaoDet = opAlteraRub then
     qryRubricasDetalhe.Cancel
  else
     QryObtemBasePagamento.Cancel;

  opOperacaoDet := opIdle;
  ConfiguraBotoes;
end;

procedure TfrmConsultaPrevia.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  if opOperacaoDet = opAlteraRub then
     qryRubricasDetalhe.Cancel
  else
     QryObtemBasePagamento.Cancel;

  opOperacaoDet := opIdle;
  ConfiguraBotoes;
end;

procedure TfrmConsultaPrevia.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  if opOperacaoDet = opAlteraRub then
  begin
    if qryRubricasDetalhe.FieldByName('FLGDESCONTO').AsInteger = 0 then
       qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat := qryRubricasDetalhe.FieldByName('VLRPROVENTO').AsFloat
    else if qryRubricasDetalhe.FieldByName('FLGDESCONTO').AsInteger = 1 then
       qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat := qryRubricasDetalhe.FieldByName('VALORDESCONTO').AsFloat;
    qryRubricasDetalhe.Post;

    if bPreviaAlterada then
    begin
      SomaValoresProventoDesconto();
      MostraValores;
    end;
  end
  else
  begin
    QryObtemBasePagamento.Post;

    if bBaseAlterada then
       MontaApresentacaoBasePagamento();
  end;

  opOperacaoDet := opIdle;
  ConfiguraBotoes;

  if (bPreviaAlterada) and (bAltDadosPrevia) then
     MsgDlg('Devido a alteração dos dados da Prévia, os dados da Base de Pagamento deverão ser atualizados.', 'AVISO', mtInformation, [mbOk],0);
end;

procedure TfrmConsultaPrevia.sbtnExcDetClick(Sender: TObject);
var
   iOrdem : integer;
begin
  inherited;
  if (qrySelecao.FieldByName('EFETIVADO').AsString = 'S') then
  begin
    MsgDlg('Não é permitido Excluir a rubrica, pois esta já foi efetivada.', 'ERRO', mtError, [mbOk],0);
    sbtnExcDet.down := false;
    exit;
  end;

  iOrdem := qryRubricasDetalhe.FieldByName('ORDEM_GRD').AsInteger;

  qryRubricasDetalhe.Edit;
  qryRubricasDetalhe.FieldByName('OPERACAO').AsString := 'E';
  qryRubricasDetalhe.Post;

  {renumerar a sequencia}
  qryRubricasDetalhe.DisableControls;
  if qryRubricasDetalhe.Locate('ORDEM_GRD', (iOrdem+1), []) then
  begin
    while not qryRubricasDetalhe.eof do
    begin
      qryRubricasDetalhe.edit;
      qryRubricasDetalhe.FieldByName('ORDEM_GRD').AsInteger  := iOrdem;
      qryRubricasDetalhe.FieldByName('SEQRUBRICA').AsInteger := iOrdem;
      qryRubricasDetalhe.Post;

      qryRubricasDetalhe.next;

      inc(iOrdem);
    end;
  end;
  qryRubricasDetalhe.first;
  qryRubricasDetalhe.EnableControls;

  SomaValoresProventoDesconto();
  MostraValores();

  bPreviaAlterada := true;
  MsgDlg('Devido a exclusão dos dados da Prévia, os dados da Base de Pagamento deverão ser atualizados.', 'AVISO', mtInformation, [mbOk],0);
end;

procedure TfrmConsultaPrevia.QryObtemBasePagamentoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (QryObtemBasePagamento.FieldByName('VLRBRUTO').AsFloat <> QryObtemBasePagamento.FieldByName('VLRBRUTO').OldValue) OR
     (QryObtemBasePagamento.FieldByName('VLRDESCONTO').AsFloat <> QryObtemBasePagamento.FieldByName('VLRDESCONTO').OldValue) OR
     (QryObtemBasePagamento.FieldByName('VLRLIQUIDO').AsFloat <> QryObtemBasePagamento.FieldByName('VLRLIQUIDO').OldValue) OR
     (QryObtemBasePagamento.FieldByName('VLRIRREGRESSIVO').AsFloat <> QryObtemBasePagamento.FieldByName('VLRIRREGRESSIVO').OldValue) OR
     (QryObtemBasePagamento.FieldByName('MARGEMCONSIGNAVEL').AsFloat <> QryObtemBasePagamento.FieldByName('MARGEMCONSIGNAVEL').OldValue) OR
     (QryObtemBasePagamento.FieldByName('RENDABASE').AsFloat <> QryObtemBasePagamento.FieldByName('RENDABASE').OldValue) OR
     (QryObtemBasePagamento.FieldByName('MARGEMREAL').AsFloat <> QryObtemBasePagamento.FieldByName('MARGEMREAL').OldValue) OR
     (QryObtemBasePagamento.FieldByName('IRINFORMATIVO').AsFloat <> QryObtemBasePagamento.FieldByName('IRINFORMATIVO').OldValue) OR
     (QryObtemBasePagamento.FieldByName('IRINFORMATIVO13').AsFloat <> QryObtemBasePagamento.FieldByName('IRINFORMATIVO13').OldValue) OR
     (QryObtemBasePagamento.FieldByName('IRCOMPENSADO').AsFloat <> QryObtemBasePagamento.FieldByName('IRCOMPENSADO').OldValue) OR
     (QryObtemBasePagamento.FieldByName('IRCOMPENSADO13').AsFloat <> QryObtemBasePagamento.FieldByName('IRCOMPENSADO13').OldValue) then
  begin
    QryObtemBasePagamento.FieldByName('ALTMANUAL').AsString := 'S';


    if QryObtemBasePagamento.FieldByName('VLRBRUTO').Value = null then
       QryObtemBasePagamento.FieldByName('VLRBRUTO').Value := 0;

    if QryObtemBasePagamento.FieldByName('VLRDESCONTO').Value = null then
       QryObtemBasePagamento.FieldByName('VLRDESCONTO').Value := 0;

    if QryObtemBasePagamento.FieldByName('VLRLIQUIDO').Value = null then
       QryObtemBasePagamento.FieldByName('VLRLIQUIDO').Value := 0;

    if QryObtemBasePagamento.FieldByName('VLRIRREGRESSIVO').Value = null then
       QryObtemBasePagamento.FieldByName('VLRIRREGRESSIVO').Value := 0;

    if QryObtemBasePagamento.FieldByName('MARGEMCONSIGNAVEL').Value = null then
       QryObtemBasePagamento.FieldByName('MARGEMCONSIGNAVEL').Value := 0;

    if QryObtemBasePagamento.FieldByName('RENDABASE').Value = null then
       QryObtemBasePagamento.FieldByName('RENDABASE').Value := 0;

    if QryObtemBasePagamento.FieldByName('MARGEMREAL').Value = null then
       QryObtemBasePagamento.FieldByName('MARGEMREAL').Value := 0;

    if QryObtemBasePagamento.FieldByName('IRINFORMATIVO').Value = null then
       QryObtemBasePagamento.FieldByName('IRINFORMATIVO').Value := 0;

    if QryObtemBasePagamento.FieldByName('IRINFORMATIVO13').Value = null then
       QryObtemBasePagamento.FieldByName('IRINFORMATIVO13').Value := 0;

    if QryObtemBasePagamento.FieldByName('IRCOMPENSADO').Value = null then
       QryObtemBasePagamento.FieldByName('IRCOMPENSADO').Value := 0;

    if QryObtemBasePagamento.FieldByName('IRCOMPENSADO13').Value = null then
       QryObtemBasePagamento.FieldByName('IRCOMPENSADO13').Value := 0; 

    bBaseAlterada := true;
  end;
end;

procedure TfrmConsultaPrevia.MontaApresentacaoBasePagamento;
begin
    CdsBasePagamento.ReadOnly := false;
    CdsBasePagamento.EmptyDataSet;  // delete;

    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Matricula';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('MATRICULA').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Pagamento';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATAPAGAMENTO').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Mês Cobrança';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('MESCOBRANCA').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'PMP';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('##0.00', QryObtemBasePagamento.FieldByName('PRAZOMEDIOPONDERADO').AsFloat));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Base Cálculo IR Regressivo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('BASECALCIRREGRESSIVO').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Percentual IR Regressivo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('##0.00', QryObtemBasePagamento.FieldByName('PERCENTUALIRREGRESSIVO').AsFloat));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Valor IR Regressivo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRIRREGRESSIVO').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Bruto';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRBRUTO').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Desconto';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRDESCONTO').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Liquido';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRLIQUIDO').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Tipo Pagamento';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('TIPOFOLHA').AsInteger = 0, 'Normal', 'Resgate'));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Beneficío de Risco';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGRISCO').AsInteger = 0, 'Não é de risco', 'De risco'));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Pagamento Efetivado';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGEFETIVADO').AsInteger = 0, 'Não efetivado', 'Efetivado'));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Lote';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('IDLOTE').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Isento de IRRF';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGISENTOIRRF').AsInteger = 0, 'Não', 'Sim'));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Moléstia Grave';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 0, 'Não', 'Sim'));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Início Moléstia';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATAINICIOMOLESTIA').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Fim Moléstia';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATAFIMMOLESTIA').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Número Processo INSS';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('NUMPROCINSS').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Total';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', iff(QryObtemBasePagamento.FieldByName('FLGSOMAIRSUPINSS').AsInteger = 0, 'Não', 'Sim'));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'N. Dependentes';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('NUMDEPIRRF').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Banco';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', QryObtemBasePagamento.FieldByName('NUMBANCO').AsString +' - '+ QryObtemBasePagamento.FieldByName('NOMEBANCO').AsString);
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Agência';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', QryObtemBasePagamento.FieldByName('NUMAGENCIA').AsString + ' - '+ QryObtemBasePagamento.FieldByName('NOMEAGENCIA').AsString);
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Conta';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('CONTACORRENTE').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data de Nascimento';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('DATANASC').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Portador Forma';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('PORTADORFORMA').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'CPF';
    CdsBasePagamento.FieldByName('Valor').AsString                := QryObtemBasePagamento.FieldByName('CPF_MASCARA').AsString;
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Informativo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRINFORMATIVO').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Informativo 13';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRINFORMATIVO13').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Compensado';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRCOMPENSADO').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Compensado 13';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('IRCOMPENSADO13').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Margem Consignável';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('MARGEMCONSIGNAVEL').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Renda Base';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('RENDABASE').AsCurrency));
    CdsBasePagamento.Append;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Margem Real';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('MARGEMREAL').AsCurrency));

    //WO28025 leandro inicio
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Redução aplicada no IR apurado';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRREDUCAOIRRF').AsCurrency));
    CdsBasePagamento.Append;

    CdsBasePagamento.FieldByName('Campo').AsString                := 'Valor tributável usado no cálculo da Redução no IR apurado';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRTRIBUTAVELIRRF').AsCurrency));
    CdsBasePagamento.Append;

    CdsBasePagamento.FieldByName('Campo').AsString                := 'Redução aplicada no IR apurado 13';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRREDUCAOIRRF13').AsCurrency));
    CdsBasePagamento.Append;

    CdsBasePagamento.FieldByName('Campo').AsString                := 'Valor tributável usado no cálculo da Redução no IR apurado 13';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRTRIBUTAVELIRRF13').AsCurrency));
    CdsBasePagamento.Append;

    CdsBasePagamento.FieldByName('Campo').AsString                := 'Redução aplicada no IR apurado INSS';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRREDUCAOINSSIRRF').AsCurrency));
    CdsBasePagamento.Append;

    CdsBasePagamento.FieldByName('Campo').AsString                := 'Valor tributável usado no cálculo da Redução no IR apurado INSS';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRTRIBUTAVELINSSIRRF').AsCurrency));
    CdsBasePagamento.Append;

    CdsBasePagamento.FieldByName('Campo').AsString                := 'Redução aplicada no IR apurado 13 INSS';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRREDUCAOINSSIRRF13').AsCurrency));
    CdsBasePagamento.Append;

    CdsBasePagamento.FieldByName('Campo').AsString                := 'Valor tributável usado no cálculo da Redução no IR apurado 13 INSS';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(QryObtemBasePagamento.eof, '', FormatFloat('#,##0.00', QryObtemBasePagamento.FieldByName('VLRTRIBUTAVELINSSIRRF13').AsCurrency));
    CdsBasePagamento.Append;

    //WO28025 leandro fim

    if not(qryBaseREINF.IsEmpty) then
    begin
      While Not qryBaseREINF.Eof Do
      begin
        CdsBasePagamento.Append;
        CdsBasePagamento.FieldByName('Campo').AsString                := qryBaseREINF.FieldByName('DESCRICAO_REINF').AsString;
        CdsBasePagamento.FieldByName('Valor').AsString                := iff(qryBaseREINF.eof, '', FormatFloat('#,##0.00', qryBaseREINF.FieldByName('VLREINF').AsCurrency));
        qryBaseREINF.Next;
      end;
      qryBaseREINF.First;
    end;

    CdsBasePagamento.Post;

    CdsBasePagamento.Filter := 'Campo is not null';
    CdsBasePagamento.Filtered := true;
    CdsBasePagamento.First;

    CdsBasePagamento.ReadOnly := true;
end;


procedure TfrmConsultaPrevia.bbtnCancelarClick(Sender: TObject);
begin
  qryRubricasDetalhe.CancelUpdates;
  QryObtemBasePagamento.CancelUpdates;

  ExecutaDetalhe(sIdTitular, sMesCobranca);

  inherited;

  ConfiguraBotoes;

  sbtnAltDet.enabled  := false;
  sbtnExcDet.enabled  := false;
  sbtnAltBase.enabled := false;

  bbtnConfirmar.enabled := false;
  bbtnCancelar.enabled  := false;
  sbtnAlterar.down      := false;

  opOperacao := opIdle;
end;

procedure TfrmConsultaPrevia.SomaValoresProventoDesconto;
var
  i : TBookmark;
begin
  rtotprov := 0;
  rtotdesc := 0;

  i := qryRubricasDetalhe.GetBookmark();

  qryRubricasDetalhe.disablecontrols;
  qryRubricasDetalhe.First;
  While Not qryRubricasDetalhe.Eof Do
  Begin
    rtotprov := rtotprov + qryRubricasDetalhe.FieldByName('VLRPROVENTO').AsFloat;
    rtotdesc := rtotdesc + qryRubricasDetalhe.FieldByName('VALORDESCONTO').AsFloat;
    qryRubricasDetalhe.Next;
  End;
  qryRubricasDetalhe.GotoBookmark(i);
  qryRubricasDetalhe.FreeBookmark(i);
  qryRubricasDetalhe.enablecontrols;
  dbgDetalhe.refresh;
end;

procedure TfrmConsultaPrevia.bbtnConfirmarClick(Sender: TObject);
var
   sObservacao : String;
   mModalObs   : TModalResult;
begin
  inherited;
  if (bPreviaAlterada) or (bBaseAlterada) then
  begin
    if (bPreviaAlterada) and (not bBaseAlterada) then
    begin
      if MsgDlg('Dados de rubricas foram alterados mas a base de pagamento não foi atualizada.'+chr(13)+chr(10)+
                'Confirma a alteração?', 'CONFIRMAÇÃO', mtConfirmation, [mbYes, mbNo],0) = mrNo then
         exit;
    end;

    if (not bPreviaAlterada) and (bBaseAlterada) then
    begin
      if MsgDlg('A base de pagamento foi alterado mas os dados de rubricas não foi atualizado.'+chr(13)+chr(10)+
                'Confirma a alteração?', 'CONFIRMAÇÃO', mtConfirmation, [mbYes, mbNo],0) = mrNo then
         exit;
    end;

    {Solicita motivo da alteração}
    repeat
      sObservacao := InsereObservacao(mModalObs, '', 'Observação', 100);
      if (sObservacao = '') and (mModalObs = mrOk) then
      begin
         MsgDlg('É preciso informar o motivo das alterações. Verifique. ','Erro', mtError,[mbOk, mbHelp],0);
      end
      else if (mModalObs = mrCancel) then
         exit;
    until (sObservacao <> '');

    if GravarDados(sObservacao) then
    begin
      {roda o cancelar para recarregar dados atualizados}
      bbtnCancelarClick(nil);
    end;

  end;
end;


function TfrmConsultaPrevia.GravaObservacao(sTextoObs : string; var sMsgErro: string; var iIdObs : integer): Boolean;
begin
  try
    iIdObs := LeUltRegistro(nil, 'OBS_PREVIA_BASEPGTO');

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('INSERT INTO OBS_PREVIA_BASEPGTO');
    qryAux.SQL.Add(' (IDOBS, OBSERVACAO) ');
    qryAux.SQL.Add('VALUES  ');
    qryAux.SQL.Add(' ( '+IntToStr(iIdObs)+', '+QuotedStr(sTextoObs)+' )' );
    qryAux.ExecSQL;

    Result := False;
  except
    sMsgErro := 'Ocorreu um erro ao gravar Observação.';
    Result   := true;
  end;
end;


function TfrmConsultaPrevia.ExcluiRubricaPrevia(iIdObs: integer; var sMsgErro : string): Boolean;
var
  i : Integer;
  sCampo : string;
  bContribuicao : Boolean;
begin
  try
    //busca dados da rubrica que será excluída
    qryAux.close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT HST.* FROM PREVIA HST');
    qryAux.SQL.Add(' WHERE HST.IDLOTE        = '+qrySelecao.FieldByName('IDLOTE').AsString );
    qryAux.SQL.Add('   AND HST.IDTITULAR     = '+qryRubricasDetalhe.FieldByName('IDTITULAR').AsString );
    qryAux.SQL.Add('   AND HST.IDRESPONSAVEL = '+qryPrevia.FieldByName('IDRESPONSAVEL').AsString );
    qryAux.SQL.Add('   AND HST.IDRUBRICA     = '+qryRubricasDetalhe.FieldByName('IDRUBRICA').AsString );
    qryAux.SQL.Add('   AND HST.ROWID         = '+QuotedStr(qryRubricasDetalhe.FieldByName('ROWID').AsString ));
    qryAux.Open;

    // André Imakawa - SIG 48227 - Inicio
    bContribuicao := False;
    if (qryAux.FieldByName('FLGTIPODESC').AsString = 'P') and (not(qryAux.FieldByName('IDSEQINTERNOFB').IsNull))then
    begin
      bContribuicao := ExcluiContribuicao(qryAux.FieldByName('IDSEQINTERNOFB').AsInteger);
    end;
    // André Imakawa - SIG 48227 - Fim

    qryLogExcPrevia.close;
    qryLogExcPrevia.SQL.Clear;
    qryLogExcPrevia.SQL.Add('INSERT INTO LOG_EXCLUSAO_PREVIA ( ');
    qryLogExcPrevia.SQL.Add('   IDLOGEXPREVIA ');
    qryLogExcPrevia.SQL.Add('  ,IDOBS ');
    {insere todos os campos da PREVIAna query}
    for i := 0 to qryAux.fields.count-1 do
      qryLogExcPrevia.SQL.Add('  ,'+qryAux.fields[i].FieldName );

    qryLogExcPrevia.SQL.Add(') VALUES ( ');
    qryLogExcPrevia.SQL.Add('   CM.SEQLOG_EXCLUSAO_PREVIA.NEXTVAL ');
    qryLogExcPrevia.SQL.Add('  , '+IntToStr(iIdObs) );

    for i := 0 to qryAux.fields.count-1 do
    begin
      sCampo := qryAux.fields[i].FieldName;

      if (qryAux.Fields[i].DataType = ftDateTime) then
      begin
        if (sCampo = 'TRGDTALTERACAO') or (sCampo = 'TRGDTINCLUSAO') then
           qryLogExcPrevia.SQL.Add('  ,TO_DATE('+QuotedStr(qryAux.FieldByName(sCampo).AsString)+', ''dd/mm/yyyy hh24:mi:ss'')' )
        else if qryAux.FieldByName(sCampo).AsString = '' then
           qryLogExcPrevia.SQL.Add('  ,null' )
        else
           qryLogExcPrevia.SQL.Add('  ,TO_DATE('+QuotedStr(qryAux.FieldByName(sCampo).AsString)+', ''DD/MM/YYYY'')' )
      end
      else if (qryAux.Fields[i].DataType = ftString) then
         qryLogExcPrevia.SQL.Add('  ,'+QuotedStr(Trim(qryAux.FieldByName(sCampo).AsString)) )
      else if (qryAux.Fields[i].DataType = ftFloat) then
         qryLogExcPrevia.SQL.Add('  ,'+OraNumero(qryAux.FieldByName(sCampo).AsString) )
      else
         qryLogExcPrevia.SQL.Add('  ,'+qryAux.FieldByName(sCampo).AsString );

    end;
    qryLogExcPrevia.SQL.Add(') ');
    qryLogExcPrevia.ExecSQL;

    // André Imakawa - SIG 48227 - Inicio
    if bContribuicao then
      Result := True
    else
      Result := False;
    // André Imakawa - SIG 48227 - Fim  

  except
    begin
      sMsgErro := 'Ocorreu um erro ao excluir rubrica.';
      Result   := true;
    end;
  end;
end;


function TfrmConsultaPrevia.InsereLogAlteraPrevia(iIdObs: integer; var sMsgErro: string; var bSoAltSeqRub : boolean): Boolean;
var
  i : Byte;
  sCampo : string;
begin
  try

    qryAux.close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT HST.* FROM PREVIA HST');
    qryAux.SQL.Add(' WHERE HST.IDLOTE        = '+qrySelecao.FieldByName('IDLOTE').AsString );
    qryAux.SQL.Add('   AND HST.IDTITULAR     = '+qryRubricasDetalhe.FieldByName('IDTITULAR').AsString );
    qryAux.SQL.Add('   AND HST.IDRESPONSAVEL = '+qryRubricasDetalhe.FieldByName('IDRESPONSAVEL').AsString );
    qryAux.SQL.Add('   AND HST.IDRUBRICA     = '+qryRubricasDetalhe.FieldByName('IDRUBRICA').AsString );
    qryAux.SQL.Add('   AND HST.ROWID         = '+QuotedStr(qryRubricasDetalhe.FieldByName('ROWID').AsString ));
    qryAux.Open;


    for i := 1 to 6 do
    begin
      case i of
        1 : sCampo := 'VALORPROVENTO';
        2 : sCampo := 'VALORINFO';
        3 : sCampo := 'CODIRRFDARF';
        4 : sCampo := 'IDPLANOCONTABIL';
        5 : sCampo := 'SEQRUBRICA';
        6 : sCampo := 'IDPERFILINVEST'; // Peterson Victor - SIG56702
      end;

      if (qryRubricasDetalhe.FieldByName(sCampo).AsString <> qryAux.FieldByName(sCampo).AsString) then
      begin
        if (sCampo <> 'SEQRUBRICA') and (bSoAltSeqRub) then
           bSoAltSeqRub := false;

        qryLogAltPrevia.Close;
        qryLogAltPrevia.ParamByName('IDPESSOA').AsInteger     := qryRubricasDetalhe.FieldByName('IDPESSOA').AsInteger;
        qryLogAltPrevia.ParamByName('IDTITULAR').AsInteger    := qryRubricasDetalhe.FieldByName('IDTITULAR').AsInteger;
        qryLogAltPrevia.ParamByName('IDLOTE').AsInteger       := qrySelecao.FieldByName('IDLOTE').AsInteger;
        qryLogAltPrevia.ParamByName('IDPLANOPREV').AsInteger  := qryRubricasDetalhe.FieldByName('IDPLANOPREV').AsInteger;
        qryLogAltPrevia.ParamByName('MESCOBRANCA').AsString   := qryRubricasDetalhe.FieldByName('MESCOBRANCA').AsString;
        qryLogAltPrevia.ParamByName('MES').AsString           := qryRubricasDetalhe.FieldByName('MES').AsString;
        qryLogAltPrevia.ParamByName('IDRUBRICA').AsInteger    := qryRubricasDetalhe.FieldByName('IDRUBRICA').AsInteger;
        if (qryRubricasDetalhe.FieldByName('FLGDESCONTO').AsInteger = 1) and (sCampo = 'VALORPROVENTO') then
           qryLogAltPrevia.ParamByName('CAMPOALTERADO').AsString := 'VALORDESCONTO'
        else
           qryLogAltPrevia.ParamByName('CAMPOALTERADO').AsString := sCampo;

        qryLogAltPrevia.ParamByName('VLRANTERIOR').Value      := qryAux.FieldByName(sCampo).Value;
        if qryRubricasDetalhe.FieldByName(sCampo).AsString = '' then
           qryLogAltPrevia.ParamByName('VLRNOVO').Value       := null
        else
           qryLogAltPrevia.ParamByName('VLRNOVO').Value       := qryRubricasDetalhe.FieldByName(sCampo).Value;
        qryLogAltPrevia.ParamByName('IDOBS').AsInteger        := iIdObs;
        qryLogAltPrevia.ExecSQL;
      end;
    end;

    Result := False;

  except
    begin
      sMsgErro := 'Ocorreu um erro ao registrar alterações da Rubrica.';
      Result   := true;
    end;

  end;
end;


function TfrmConsultaPrevia.AlteraRegistroOrigem(sMsgErro: string): boolean;
var
   sValor    : string;
   cTipoDesc : char;
begin
  sValor    := qryRubricasDetalhe.FieldByName('FLGTIPODESC').AsString;
  cTipoDesc := sValor[1];
  Result    := false;

  if (cTipoDesc in ['A', 'C', 'P', 'E', 'D'])  then
  begin
    try
      {altera TMPDESC}
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE TMPDESC SET ');
      qryAux.SQL.Add('  VALOR = :VALOR,  ');
      qryAux.SQL.Add('  VALORINFO = :VALORINFO, ');
      qryAux.SQL.Add('  IDPLANPREVCONTAB = :IDPLANPREVCONTAB ');
      qryAux.SQL.Add('WHERE IDPESSOA = :IDPESSOA    ');
      qryAux.SQL.Add('  AND IDTITULAR = :IDTITULAR  ');
      qryAux.SQL.Add('  AND (IDLOTE = :IDLOTE OR LOTEPREVIA = :IDLOTE) ');
      qryAux.SQL.Add('  AND IDPLANOPREV = :IDPLANOPREV ');
      qryAux.SQL.Add('  AND MESCOBRANCA = :MESCOBRANCA ');
      qryAux.SQL.Add('  AND MESREFERENCIA = :MESREFERENCIA ');
      qryAux.SQL.Add('  AND IDPROVENTO = :IDRUBRICA    ');

      qryAux.ParamByName('VALOR').AsFloat              := qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat;
      qryAux.ParamByName('VALORINFO').AsFloat          := qryRubricasDetalhe.FieldByName('VALORINFO').AsFloat;
      qryAux.ParamByName('IDPLANPREVCONTAB').AsInteger := qryRubricasDetalhe.FieldByName('IDPLANOCONTABIL').AsInteger;
      qryAux.ParamByName('IDPESSOA').AsInteger         := qryRubricasDetalhe.FieldByName('IDPESSOA').AsInteger;
      qryAux.ParamByName('IDTITULAR').AsInteger        := qryRubricasDetalhe.FieldByName('IDTITULAR').AsInteger;
      qryAux.ParamByName('IDLOTE').AsInteger           := qryRubricasDetalhe.FieldByName('IDLOTE').AsInteger;
      qryAux.ParamByName('IDPLANOPREV').AsInteger      := qryRubricasDetalhe.FieldByName('IDPLANOPREV').AsInteger;
      qryAux.ParamByName('MESCOBRANCA').AsString       := qryRubricasDetalhe.FieldByName('MESCOBRANCA').AsString;
      qryAux.ParamByName('MESREFERENCIA').AsString     := qryRubricasDetalhe.FieldByName('MES').AsString;
      qryAux.ParamByName('IDRUBRICA').AsInteger        := qryRubricasDetalhe.FieldByName('IDRUBRICA').AsInteger;
      qryAux.ExecSQL;
    except
      begin
        sMsgErro := 'Ocorreu um erro ao atualizar dados de origem: TMPDESC.';
        Result   := true;
      end;
    end;
  end
  else if (cTipoDesc = 'B')  then
  begin
    try
      {altera HSTBENEFBFCIARIO}
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE HSTBENEFBFCIARIO SET ');
      qryAux.SQL.Add('  VALORPREV = :VALOR,  ');
      qryAux.SQL.Add('  VALORCALCULADO = :VALOR     ');
      qryAux.SQL.Add('WHERE IDPESSOA = :IDPESSOA    ');
      qryAux.SQL.Add('  AND IDTITULAR = :IDTITULAR  ');
      qryAux.SQL.Add('  AND IDLOTE = :IDLOTE ');
      qryAux.SQL.Add('  AND IDPLANOPREV = :IDPLANOPREV ');
      qryAux.SQL.Add('  AND MES = :MESCOBRANCA         ');
      qryAux.SQL.Add('  AND MESREFERENCIA = :MES       ');
      qryAux.SQL.Add('  AND IDBENEFICIO = :IDBENEFICIO ');
      qryAux.ParamByName('VALOR').AsFloat         := qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat;
      qryAux.ParamByName('IDPESSOA').AsInteger    := qryRubricasDetalhe.FieldByName('IDPESSOA').AsInteger;
      qryAux.ParamByName('IDTITULAR').AsInteger   := qryRubricasDetalhe.FieldByName('IDTITULAR').AsInteger;
      qryAux.ParamByName('IDLOTE').AsInteger      := qryRubricasDetalhe.FieldByName('IDLOTE').AsInteger;
      qryAux.ParamByName('IDPLANOPREV').AsInteger := qryRubricasDetalhe.FieldByName('IDPLANOPREV').AsInteger;
      qryAux.ParamByName('MESCOBRANCA').AsString  := qryRubricasDetalhe.FieldByName('MESCOBRANCA').AsString;
      qryAux.ParamByName('MES').AsString          := qryRubricasDetalhe.FieldByName('MES').AsString;
      qryAux.ParamByName('IDBENEFICIO').AsInteger := qryRubricasDetalhe.FieldByName('IDBENEFICIO').AsInteger;
      qryAux.ExecSQL;
    except
      begin
        sMsgErro := 'Ocorreu um erro ao atualizar dados de origem: HSTBENEFBFCIARIO.';
        Result   := true;
      end;
    end;
  end
  else if (cTipoDesc  in ['Q', 'Y'])  then
  begin
    try
      {altera RUBRICAINDIV}
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE RUBRICAINDIV SET ');
      qryAux.SQL.Add('  VALORRUBRICA = :VALOR ');
      qryAux.SQL.Add('WHERE IDPESSOA = :IDPESSOA    ');
      qryAux.SQL.Add('  AND IDTITULAR = :IDTITULAR  ');
      qryAux.SQL.Add('  AND ULTMESPREPARO = :MESCOBRANCA ');
      qryAux.SQL.Add('  AND IDRUBRICA = :IDRUBRICA ');
      qryAux.SQL.Add('  AND IDREGRACALCULO IS NULL  ');
      qryAux.ParamByName('VALOR').AsFloat        := qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat;
      qryAux.ParamByName('IDPESSOA').AsInteger   := qryRubricasDetalhe.FieldByName('IDPESSOA').AsInteger;
      qryAux.ParamByName('IDTITULAR').AsInteger  := qryRubricasDetalhe.FieldByName('IDTITULAR').AsInteger;
      qryAux.ParamByName('MESCOBRANCA').AsString := qryRubricasDetalhe.FieldByName('MESCOBRANCA').AsString;
      qryAux.ParamByName('IDRUBRICA').AsInteger  := qryRubricasDetalhe.FieldByName('IDRUBRICA').AsInteger;
      qryAux.ExecSQL;
    except
      begin
        sMsgErro := 'Ocorreu um erro ao atualizar dados de origem: RUBRICAINDIV.';
        Result   := true;
      end;
    end;
  end;
end;


function TfrmConsultaPrevia.InsereLogBasePagamento(iIdObs: integer; var sMsgErro: string): Boolean;
var
  i : Byte;
  sCampo  : string;
  fValorA : double;
  fValorN : double;
begin
  try
    qryAux.close;
    qryAux.SQL.Clear;
    qryAux.SQL.Text := QryObtemBasePagamento.SQL.text;
    qryAux.ParamByName('IDLOTE').AsString    := qrySelecao.FieldByName('IDLOTE').AsString;
    qryAux.ParamByName('IDTITULAR').AsString := qryPrevia.FieldByName('IDTITULAR').AsString;
    qryAux.ParamByName('IDPESSOA').AsString  := qryPrevia.FieldByName('IDRESPONSAVEL').AsString;
    qryAux.Open;

    for i := 1 to 11 do
    begin
      case i of
         1 : sCampo := 'VLRBRUTO';
         2 : sCampo := 'VLRDESCONTO';
         3 : sCampo := 'VLRLIQUIDO';
         4 : sCampo := 'VLRIRREGRESSIVO';
         5 : sCampo := 'MARGEMCONSIGNAVEL';
         6 : sCampo := 'RENDABASE';
         7 : sCampo := 'MARGEMREAL';
         8 : sCampo := 'IRINFORMATIVO';
         9 : sCampo := 'IRINFORMATIVO13';
        10 : sCampo := 'IRCOMPENSADO';
        11 : sCampo := 'IRCOMPENSADO13';
      end;

      if (QryObtemBasePagamento.FieldByName(sCampo).Value <> qryAux.FieldByName(sCampo).Value) then
      begin
        if qryAux.FieldByName(sCampo).Value = null then
           fValorA := 0
        else
           fValorA := qryAux.FieldByName(sCampo).Value;

        if QryObtemBasePagamento.FieldByName(sCampo).AsString = '' then
           fValorN := 0
        else
           fValorN := QryObtemBasePagamento.FieldByName(sCampo).Value;

        qryLogAltBase.Close;
        qryLogAltBase.ParamByName('IDBASEPGTO').AsInteger   := QryObtemBasePagamento.FieldByName('IDBASEPGTO').AsInteger;
        qryLogAltBase.ParamByName('CAMPOALTERADO').AsString := sCampo;
        qryLogAltBase.ParamByName('VLRANTERIOR').Value      := fValorA;
        qryLogAltBase.ParamByName('VLRNOVO').Value          := fValorN;
        qryLogAltBase.ParamByName('IDOBS').AsInteger        := iIdObs;
        qryLogAltBase.ExecSQL;
      end;
    end;

    Result := False;

  except
    begin
      sMsgErro := 'Ocorreu um erro ao registrar alterações da Base de Pagamento.';
      Result   := true;
    end;
  end;
end;


function TfrmConsultaPrevia.GravarDados(sTextoObs: string): Boolean;
var
  bErro      : boolean;
  sMsgErro   : string;
  iIdObserva : integer;
  bSoSeqRub  : boolean;
  lstDelete  : TStringList;
  index      : integer;
begin
  bErro    := False;
  sMsgErro := '';

  lstDelete  := TStringList.create;

  try
    try

      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      bErro := GravaObservacao(sTextoObs, sMsgErro, iIdObserva);

      if (not bErro) then
      begin
        {Alterando dados referente a PREVIA}
        if (bPreviaAlterada) then
        begin
          qryRubricasDetalhe.Disablecontrols;

          qryRubricasDetalhe.Filtered := False;
          qryRubricasDetalhe.Filter   := 'OPERACAO <> ''.'' ';
          qryRubricasDetalhe.Filtered := true;
          while (not qryRubricasDetalhe.eof) and (not bErro) do
          begin
            {exclui rubrica da previa}
            if qryRubricasDetalhe.FieldByName('OPERACAO').AsString = 'E' then
            begin
              bErro := ExcluiRubricaPrevia(iIdObserva, sMsgErro);
              if not bErro then
                 lstDelete.Add( qryRubricasDetalhe.FieldByName('ROWID').AsString );
                 //qryRubricasDetalhe.delete;
            end
            else
            begin
              bSoSeqRub := true;   // valida se mudou apenas a numeracao da seqrubrica

              bErro := InsereLogAlteraPrevia(iIdObserva, sMsgErro, bSoSeqRub);

              if (not bErro) and (not bSoSeqRub) then
                 bErro := AlteraRegistroOrigem( sMsgErro );
            end;
            qryRubricasDetalhe.next;
          end;
          {executa os updates primeiro}
          if not bErro then
          begin
            qryRubricasDetalhe.ApplyUpdates;
            qryRubricasDetalhe.CancelUpdates;

            {---------------  Apaga registros da lista---------------------------}
            for index := 0 to lstDelete.count-1 do
            begin
              qryAux.Close;
              qryAux.SQL.Text := 'DELETE FROM PREVIA WHERE ROWID = '+Quotedstr( lstDelete[index] );
              qryAux.ExecSQL;
            end;
          end;

          qryRubricasDetalhe.Filtered := False;
          qryRubricasDetalhe.Enablecontrols;
        end;

        {Alterando dados referente a BASEPAGAMENTO}
        if (bBaseAlterada) and (not bErro) then
        begin
          bErro := InsereLogBasePagamento(iIdObserva, sMsgErro);

          if (not bErro) then
             QryObtemBasePagamento.ApplyUpdates;

        end;
      end;

      if (dtmBaseDados.dbBaseDados.InTransaction) and (not bErro) then
        dtmBaseDados.dbBaseDados.Commit;

      ExecutaDetalhe(sIdTitular, sMesCobranca);

    except
      begin
        sMsgErro := 'Ocorreu um erro ao gravar dados.';
        bErro := true;
      end;
    end;
  finally
    if bErro then
    begin
       MsgDlg( sMsgErro, 'Erro', mtError,[mbOk, mbHelp],0);
       if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
    end;
    FreeAndNil(lstDelete);
  end;

  Result := not bErro;
end;


procedure TfrmConsultaPrevia.qrySelecaoBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if (bPreviaAlterada) or (bBaseAlterada) then
  begin
    if MsgDlg('Há alterações pendentes para o Lote '+char(13)+char(10)+
              qrySelecao.FieldByName('IDLOTE').AsString+' - '+
              qrySelecao.FieldByName('DESCRICAO').AsString+char(13)+char(10)+char(13)+char(10)+
              'Descartar alterações?', 'CONFIRMAÇÃO', mtConfirmation, [mbYes,mbNo],0) = mrNo then
        Abort;

    bbtnCancelarClick(nil);
  end;
end;
//edilaine - SIG27469 - fim

//edilaine - SIG49800-60761 - inicio
procedure TfrmConsultaPrevia.qryHstBenefIRAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryHstIsento.close;
  if qryHstBenefIR.isEmpty then
     exit;           

  qryHstIsento.ParamByName('IDPLANOPREV').AsInteger    := qryHstBenefIR.fieldbyname('IDPLANOPREV').asInteger;
  qryHstIsento.ParamByName('IDBENEFICIO').AsInteger    := qryHstBenefIR.fieldbyname('IDBENEFICIO').asInteger;
  qryHstIsento.ParamByName('NUMEROPROCESSO').AsInteger := qryHstBenefIR.fieldbyname('NUMEROPROCESSO').asInteger;
  qryHstIsento.ParamByName('IDPESSJUR').AsInteger      := qryHstBenefIR.fieldbyname('IDPESSJUR').asInteger;
  qryHstIsento.ParamByName('IDTITULAR').AsInteger      := qryHstBenefIR.fieldbyname('IDTITULAR').asInteger;
  qryHstIsento.ParamByName('IDPLANOORIGEM').AsInteger  := qryHstBenefIR.fieldbyname('IDPLANOORIGEM').asInteger;
  qryHstIsento.ParamByName('IDPESSOA').AsInteger       := qryHstBenefIR.fieldbyname('IDPESSOA').asInteger;
  qryHstIsento.ParamByName('SEQPROPOSTA').AsInteger    := qryHstBenefIR.fieldbyname('SEQPROPOSTA').asInteger;
  qryHstIsento.Open;
end;
//edilaine - SIG49800-60761 - fim

// André Imakawa - SIG 48227 - Inicio
function TfrmConsultaPrevia.ExcluiContribuicao(pIdSeqInterno: Integer): Boolean;
var
  qryApoio, qryDelete : TwwQuery;
  ssql : string;
begin
  try
    Result := False;
    qryDelete := twwquery.create(application);
    qryApoio  := twwquery.create(application);
    qryDelete.databasename:='Basedados';
    qryApoio.databasename:='Basedados';

    qryApoio.Close;
    qryApoio.Sql.clear;

    ssql:=' SELECT TD.IDTMPDESC, TD.NUMRECEBIMENTO, TD.IDMOTIVO, TD.MESCOBRANCA, TD.MESREFERENCIA '+
          ' FROM CM.TMPDESC TD '+
          ' WHERE TD.IDSEQINTERNOFB = '+inttostr(pIdSeqInterno);

    qryApoio.Sql.Add(ssql);
    qryApoio.Open;

    if not(qryApoio.IsEmpty) then
    begin
      try
        qryDelete.Close;
        qryDelete.Sql.clear;

        ssql:=' DELETE FROM CM.TMPDESC TD '+
              ' WHERE TD.IDTMPDESC = '+qryApoio.fieldbyname('IDTMPDESC').AsString;

        qryDelete.Sql.Add(ssql);
        qryDelete.ExecSQL;
      except
        Result := True;
      end;

      try
        qryDelete.Close;
        qryDelete.Sql.clear;

        ssql:=' UPDATE CM.HSTCONTRIBPREV H' +
              ' SET H.SITRECEBIMENTO = 0 ' +
              ' WHERE H.MESREFERENCIA = ' + QuotedStr(qryApoio.fieldbyname('MESREFERENCIA').AsString) +
              '   AND H.MESCOBRANCA = ' + QuotedStr(qryApoio.fieldbyname('MESCOBRANCA').AsString) +
              '   AND H.IDMOTIVO = ' + qryApoio.fieldbyname('IDMOTIVO').AsString +
              '   AND H.NUMRECEBIMENTO = ' + qryApoio.fieldbyname('NUMRECEBIMENTO').AsString ;

        qryDelete.Sql.Add(ssql);
        qryDelete.ExecSQL;
      except
        Result := True;
      end;

      Result := False;
    end;

  finally
    FreeAndNil(qryDelete);
    FreeAndNil(qryApoio);
  end;
end;
// André Imakawa - SIG 48227 - Fim
    
procedure TfrmConsultaPrevia.dblkRecebedorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  dblkRecebedor.OnChange(dblkRecebedor); //wo22006 - Leandro Pocebon

end;

end.
{------------------------------------------------------------------------------|
| UNIT: FCONSULTAPREVIA                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA PARA CONSULTA DE INFORMAÇÕES RELATIVAS A PREVIA DE LOTES DE PAGAMENTO |
| DE BENEFÍCIOS.                                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   COLOCOU-SE O CODIRRFDARF E O FLGIRRF NO GRID DE RUBRICAS RELATIVAS AO      |
| RECEBEDOR.                                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/02/2002 A 01/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12C                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: ALTEREI AS QUERIES QUE MONTAM O DETALHE DA       |
| CONSULTA PARA VERIFICAR SE A FUNDACAO USA CODIGO/DESCRICAO INTERNO OU EXTERNO|
|  DE RUBRICA                                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/02/2002 A 26/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12d                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO NO GRID DE RUBRICA QUE NÃO EXIBIA O CÓDIGO DA RUBRICA.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/05/2002 A 09/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12l                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|       - MUDAR FORMA DE CONSULTA DA PRÉVIA, PARA FICAR IGUAL A CONSULTA AO    |
|   HISTÓRICO DA FOLHA                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2002 A 27/06/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO: 3.02.13c                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIR VISUALIZAÇÃO DO VALOR DO SRB, VALOR DO INSS E FATORES DO BENEFICIO |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/08/2002 A 15/08/2002                         |
| PENDÊNCIA: 8306                                                              |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - O Fernando pediu para trocar o parâmetro prmFlgCalcJunto, pelo novo     |
|    parâmetro criado FlgAgrupaRubrica.                                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi retirado das queries a função TO_CHAR, pois estava dando erro na CBS,|
|   por causa da versão do ORACLE.                                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/09/2002 A 17/09/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi retirado do MontaSelect o campo chave idpessjur.                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/10/2002 A 09/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Acerto no retorno dos valores de SRB, INSS e suplementação. Colocar másca- |
| ra nos fatores.                                                              |
| - Acerto duplcidade de chamada da rotina que executa a query de detalhe de   |
| rubricas.                                                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/11/2002 A 27/11/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  ACERTO NA QUERY PARA IDENTIFICAR MATRICULA QUANDO OCORRE MIGRAÇÃO DE PLANO  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/01/2002 A 15/01/2002                         |
| PENDÊNCIA: 11448, 11450, 11451, 11452.                                       |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Exibição da situação do participante na Fundação.|
|  Alterado a expressão "Valor Integral" por "Valor Fundação"  (pnlValorSupl). |
|  A tela foi alterada de modo a permitir melhor visualização.                 |
|  Modificação para mostrar como prioridade o participante.                    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/01/2003 A 29/01/2003                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO: 3.03.02e                                              |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Alteração na cor e habi                                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/02/2003 A 20/02/2003                         |
| PENDÊNCIA: 11932                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03H                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| VINCULADA A PENDENCIA 11932 PARA EXIBIR CORRETAMENTE O VALOR INFORMATIVO NA  |
| CONSULTA                                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2003 A 11/07/2003                         |
| PENDÊNCIA: 11871                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07G                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| AO PRESSIONAR O BOTÃO PROCURAR NÃO CONSIDERAR O VALOR DA MATRÍCULA           |
| OU INSCRIÇÃO CORRENTE. USAR ESTAS INFORMAÇÕES APENAS SE EVENTO DISPARADO PELO|                                                                              |
| CÓDIGO A PARTIR DOS EDITS.                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2003 A 29/07/2003                         |
| PENDÊNCIA: 14736                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07s                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Não exibe rubricas informativas. Não agrupava corretamente quando o        |
| parâmetro Agrupa está marcado.                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2003 A 11/07/2003                         |
| PENDÊNCIA: 14489                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2003 A 06/08/2003                         |
| PENDÊNCIA: 14792                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NAS CONSULTAS DE QRYMATRICULA E QRYINSCRICAO PARA IGUALAR AS     |
| UTILIZADAS NA CONSULTA DO HISTÓRICO DE PAGAMENTO                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: André Tavares                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/01/2004                                      |
| PENDÊNCIA: 15933                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:  acerto nos joins da query qryPrevia.            |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/11/2004 A 26/11/2004                         |
| PENDÊNCIA: 17910                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.14                                               |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| AJUSTE NA QUERY QRYFATOR PARA EXIBIR O NOME DOS BENEFICIARIOS DO GRUPO DE    |
| PENSÃO VINCULADOS AO RESPONSAVEL.                                            |
| A QUERY ABAIXO FOI SUBSTITUÍDA PELA QUE ESTÁ AGORA NO COMPONENTE.            |
|                                                                              |
SELECT NOME, FATOR
FROM (
SELECT BPV.NOMEVALORBASE1 AS NOME, BPP.VALORBASE1 AS FATOR
FROM BENEFPLANOPART BPP, BENEFPLANPREV BPV, BENEFICIO B
WHERE BPP.IDPESSOA = :PIDPESSOA
AND BPP.IDPLANOPREV = BPV.IDPLANOPREV
AND BPP.IDBENEFICIO = BPV.IDBENEFICIO
AND BPV.FLGREFERENCIA = 0
AND B.IDBENEFICIO = BPV.IDBENEFICIO
AND B.TIPOBENEFICIO <> 99
UNION
SELECT BPV.NOMEVALORBASE2 AS NOME, BPP.VALORBASE2 AS FATOR
FROM BENEFPLANOPART BPP, BENEFPLANPREV BPV, BENEFICIO B
WHERE BPP.IDPESSOA = :PIDPESSOA
AND BPP.IDPLANOPREV = BPV.IDPLANOPREV
AND BPP.IDBENEFICIO = BPV.IDBENEFICIO
AND BPV.FLGREFERENCIA = 0
AND B.IDBENEFICIO = BPV.IDBENEFICIO
AND B.TIPOBENEFICIO <> 99
UNION
SELECT BPV.NOMEVALORBASE3 AS NOME, BPP.VALORBASE3 AS FATOR
FROM BENEFPLANOPART BPP, BENEFPLANPREV BPV, BENEFICIO B
WHERE BPP.IDPESSOA = :PIDPESSOA
AND BPP.IDPLANOPREV = BPV.IDPLANOPREV
AND BPP.IDBENEFICIO = BPV.IDBENEFICIO
AND BPV.FLGREFERENCIA = 0
AND B.IDBENEFICIO = BPV.IDBENEFICIO
AND B.TIPOBENEFICIO <> 99
UNION
SELECT DISTINCT '% RATEIO' AS NOME, BFC.PERCENTUAL AS FATOR
FROM HSTBENEFBFCIARIO H, BENEFPLANPREV BPV, BFCIARIOTITPLAN BFC, BENEFICIO B
WHERE H.IDTITULAR = :PIDTITULAR
AND H.IDPESSOA = :PIDPESSOA
AND H.IDLOTE = :PIDLOTE
AND H.IDPESSOA <> H.IDTITULAR
AND H.IDPLANOPREV = BPV.IDPLANOPREV
AND H.IDBENEFICIO = BPV.IDBENEFICIO
AND BPV.FLGREFERENCIA = 0
AND H.IDPLANOPREV = BFC.IDPLANOPREV
AND H.IDPESSJUR = BFC.IDPESSJUR
AND H.IDBENEFICIO = BFC.IDBENEFICIO
AND H.IDPESSOA = BFC.IDPESSOA
AND H.IDTITULAR = BFC.IDTITULAR
AND H.SEQPROPOSTA = BFC.SEQPROPOSTA
AND B.IDBENEFICIO = H.IDBENEFICIO
AND B.TIPOBENEFICIO <> 99
) G
WHERE NOME IS NOT NULL AND FATOR > 0
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}

{
OBSERVAÇÃO 11.10.2002:
- COLOCAR AS QUERYS EM OBJETO SEPARADO (UOBJFOLHA) DE FORMA A ACESSAR EM OUTROS FORMS
}
