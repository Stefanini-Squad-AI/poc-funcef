{-------------------------------------------------------------------------------
--------------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ------------------------
--------------------------------------------------------------------------------
//N. Atender....: WO8602
//Dt Alteração..: 04/06/2024
//Responsável...: Luis Ferrari
//Descrição.....: Importação de planilha Excel com o rateio por planos de benefícios dos imóveis da FUNCEF.
--------------------------------------------------------------------------------
//N. Atender....: WO 3524
//Dt Alteração..: 25/10/2023
//Responsável...: Cássio Florencio Rovaroto
//Descrição.....: Alteração no formato de atribuição de valor de tributação,
//                trocando arredondamento por "truncamento" na 2ª casa decimal.
--------------------------------------------------------------------------------
//N. Chamado....: WO 3185
//Dt Alteração..: 22/09/2023
//Responsável...: Everson Cunha
//Descrição.....: Alteração de label na aba Nota Fiscal de Serviço
//                De: Empresa optante pelo Simples Nacional
//                Para: Empresa isenta de tributação ou optante pelo Simples
//                Nacional
//                Pedido Leo Wagner CONTAB
--------------------------------------------------------------------------------
//N. Atender.........: WO 2250
//Data da Alteração..: 29/08/2023
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na atribução de data dos alteradores de tributação.
--------------------------------------------------------------------------------
//N. Solicitação.....: WO 1728
//Dt Alteração.......: 02/08/2023
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adaptações para as definições de tipo de serviços.
--------------------------------------------------------------------------------
//N. SIG.............: 136888
//Dt Alteração.......: 23/06/2023
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de opção para definição de optante pelo Simples Nacional.
--------------------------------------------------------------------------------
//Rotina.............: btnContinuarClick, RegistraDadosAlterador, LancamentoAlteradoresTributacao,
//                     cmProcListaServicosValidaDados, ExibeAbaAlteradores, ExibeAbaNFS
//N. SIG.............: 133236 
//Data da Alteração..: 27/04/2023 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no procedimento de lançamento de alteradores de tributos.
//***************************************************************************************
//Rotina.............: (dfm)  cdsAlterador (campo novo)
//N. SIG.............: 123435
//Data da Alteração..: 07/03/2022
//Responsável........: edilaine
//Descrição..........: Correção no procedimento de lançamento de alteradores de tributos.
//***************************************************************************************
//N. SIG.............: 117685
//Data da Alteração..: 29/07/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no procedimento de lançamento de alteradores de tributos.
//***************************************************************************************
//Rotina.............: DBcboTipoRecDesCloseUp
//N. SIG.............: 103856
//Data da Alteração..: 30/06/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de bloqueio no lançamento de tipos de despesa/receita.
//***************************************************************************************
//Rotina.............: VerificaPreenchimentoAlterador, btnContinuarClick,
//                     bbtnInsereAlteradorClick, btnExcluiAlteradorClick,
//                     btnVoltarClick, FormCreate
//N. SIG.............: 115585 
//Data da Alteração..: 18/05/2021 
//Alteração Form.....: FExecLancMultDespMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Readequação das atribuições de tipo de serviço e valor base de NFS.
//***************************************************************************************
//Rotina.............: FormCreate, bbtnInsereAlteradorClick, btnExcluiAlteradorClick,
//                     btnContinuarClick, btnVoltarClick, ContinuaPagNfs
//N. SIG.............: 89101
//Data da Alteração..: 05/08/2019
//Alteração Form.....: FExecLancMultDespMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da funcionalidade para a inclusão de Nota Fiscal de Serviço.
//***************************************************************************************
Nº SIG......: 73197
Data........: 08/08/2018
Responsável.: Darivaldo Alencar
Descrição...: Correção de divisão de número por zero no resultado
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina             : FormCreate, btnContinuarClick, DBcboFormaRecPagCloseUp,
//                     btnConfirmarClick, ContinuaPagNfs
//N. SIG..........   : 23656.59199
//Data da Alteração: : 27/11/2017
//Alteração Form:    : FExecLancMultDespMT
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão da etapa "Lançamento Múltiplo de Despesas [ Nota Fiscal
//										           de Serviço ]" na interface do lançamento, além da inclusão das
//										           adequações necessárias.
//***************************************************************************************
--------------------------------------------------------------------------------
Nº SIG......: 296983
Data........: 29/05/2017
Responsável.: Peterson Victor
Descrição...: Não validar quando não estiver marcado o voto
--------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Campos novos na tabela LANCAMENTOSIMOVEL - function Inserir.
--------------------------------------------------------------------------------
Nº SIG......: 28391
Data........: 12/09/2016
Responsável.: Peterson Victor
Descrição...: Erro no Rateio
--------------------------------------------------------------------------------
Nº SIG......: 25057
Data........: 28/07/2016
Responsável.: Peterson Victor
Descrição...: Não permitir lançamentos em dias não uteis
--------------------------------------------------------------------------------
Rotina......: CalculaRateio, AtribuiPercentRateio
Nº SOL......: 256577
Nº KINTANA..: 843368
Data........: 24/07/2015
Responsável.: Edilaine Ferraresi
Descrição...: mudar rateio dos contratos para percentual do aluguel em relação ao valor total do contrato
--------------------------------------------------------------------------------
Rotina......: CalculaRateio, (dfm) cdsImoveis (retirada dos campos do componente)
Nº SOL......: 248098
Nº KINTANA..: 662559
Data........: 18/06/2015
Responsável.: Edilaine Ferraresi
Descrição...: na seleção de contrao o processo não finaliza
--------------------------------------------------------------------------------
Rotina......: CalculaRateio, EfetuarRateioMenorMaior, EfetuarRateioZerado
Nº SOL......: 247935
Nº KINTANA..: 662587
Data........: 25/05/2015
Responsável.: Edilaine Ferraresi
Descrição...: total rateado não fecha o valor do documento
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 188854
Nº KINTANA..: 1784331
Data........: -
Responsável.: Higor Nayde
Descrição...: -
--------------------------------------------------------------------------------
Rotina......: CalculaRateio
Nº SOL......: 181200/10722
Nº KINTANA..: 1745291
Data........: 05/12/2012
Responsável.: Marcio Sanches Spinosa
Descrição...: Alteração na regra de rateio para tratar valores de sobra.
--------------------------------------------------------------------------------
Rotina......: inserir, integrar
N. Sol......: 222296
N. Kintana..: 2055368
Data........: 16/12/2013
Responsável.: Marcio Sanches Spinosa SOL 222296 KINTANA 2055368
Descrição...: Ajuste para lançamentos dos alteradores na tabela lanctodocum
--------------------------------------------------------------------------------
Rotina......: dfm (molcontrato, DBcboGrupo)
N. Sol......: 107772/5681
N. Kintana..: 1358973
Data........: 04/05/2012
Responsável.: Edilaine Ferraresi
Descrição...: Diferenciar os lançamentos de documentos feitos para contratos e imóveis.
--------------------------------------------------------------------------------
Rotina.......: -
SOL..........: 180032
Kintana......: 1674608
Data.........: 23/01/2013
Responsável..: Baruc Singh Baptista
Descrição....: Função UTILIZADA PARA ARREDONDAMENTO DE VALORES
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 182262
Nº KINTANA..: 1698376
Data........: 19/06/2012
Responsável.: Higor Nayde Ferreira
Descrição...: Bloqueio de duplicagem de alteradores em
lançamento múltiplo de despesas[alteradores]
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 177882
Nº KINTANA..: 1632298
Data........: 09/04/2012
Responsável.: Helen V. Bianchi
Descrição...: Add uma trava para não deixar incluir imóveis sem o Tipo de Imovel
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de rotina para obrigar a fazer a avaliação do Fornecedor
--------------------------------------------------------------------------------
Pendência   : 26565
Responsável : Daniel Simões
Data        : 09/10/2007
Descrição   : Ajuste na query que trás os imóveis para rateio para filtrar os
              imóveis de acordo com a vigência no contrato...
--------------------------------------------------------------------------------
Pendência   : 24909
Responsável : Daniel Simões
Data        : 28/03/2007
Descrição   : Ajuste na query que traz os imóveis para lançamento...
--------------------------------------------------------------------------------
Pendência   : 24577
Responsável : Daniel Simões
Data        : 23/02/2007
Descrição   : Ajuste na query de rateio para trazer os imóveis dentro da data de
              competência do lançamento...
--------------------------------------------------------------------------------
Pendência   : 22688
Responsável : Daniel Simões
Data        : 23/02/2007
Descrição   : 1. Verifica se usuário está bloqueado no CFINAN para realizar
                 qualquer tipo de lançamento até a data disponível definida no
                 CFINAN...

              2. Criada parametrização ( fParamAdminImob ) para permitir ou não
                 lançamentos gerados com Data de Vencimento anterior a Data de
                 Lançamento...
--------------------------------------------------------------------------------
Pendência   : 22993
Responsável : Daniel Simões
Data        : 16/01/2007
Descrição   : Implementação do campo Histórico Complementar para integração com
              o Contas a Pagar conforme já implementado no lançamento de
              receitas...
--------------------------------------------------------------------------------
Pendência   :
Responsável : Daniel Simões
Data        : 06/03/2006
Descrição   : Criada a opção de abrir uma combo quando ao inserir um imóvel
              que esteja sendo rateado por mais de um contrato, selecionar
              apenas um deles para fazer o lançamento...
--------------------------------------------------------------------------------
Pendência   :
Responsável : Daniel Simões
Data        : 13/02/2006
Descrição   : Criado filtro na query da função "BuscaContratoImóvel" que trás
              os imóveis com a data da vigência...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLancMultDespMT;

//	------------------------------------------------------------------------------------------------
//
//	Lançamento Múltiplo de Despesas MT
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  28/10/2003
//	Data de Término   :  28/10/2003
//
//	------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  TEdNum, Grids, Wwdbigrd, Wwdbgrid, mFornecedor, TREdit, Mask, wwdbedit,
  Wwdbspin, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBTables,
  Wwquery, Wwdatsrc, MontaSelect, uCMTypes, mOrcamento,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlGrupoRateio,
  uCtrlTipoCustoRecImov, uCtrlFormaRecPag, uCtrlLancamentosImovel,
  uCtrlTipoImovel, TB97Tlwn, uCtrlCentroCusto, uCtrlBanco, uCtrlOrcamento,
  Provider, uCMFileUtils, FJustificativa, FCadForne, uCtrlAvaliacaoFornec, uCtrlPadroes,
  mContrato, ComObj,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab,
  uCtrlDocumentoXVoto,//Darivaldo Alencar SIG26054
  udiasuteis, DBCtrls, DBCtrls2, CMProcura, TB97Ctls,  // Peterson Victor  - SIG25057
   // Inicio WO8602 Ferrari
   UImportaArquivoNovo,
   // Fim  WO8602 Ferrari
  uCtrlListaServicos, FSelAltTributacao;

type
  TfrmExecLancMultDespMT = class(TfrmWizardMT)
    dsAlterador: TwwDataSource;
    dsImoveis: TwwDataSource;
    lblDespesa: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    lblReferenciaAP: TLabel;
    Label7: TLabel;
    lblCentroCusto: TLabel;
    lblContaBancaria: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    DBcboGrupo: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    lblDataVencimento: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    DBcboFormaRecPag: TwwDBLookupCombo;
    edtReferenciaAP: TEdit;
    edtNumDocumento: TEdit;
    memObs: TMemo;
    DBcboCentroCusto: TwwDBLookupCombo;
    dbCboContaBancaria: TwwDBLookupCombo;
    chkContrato: TCheckBox;
    Label4: TLabel;
    pgcLancamentos: TPageControl;
    tbsLancamentos: TTabSheet;
    DBgrdLancamentos: TwwDBGrid;
    tbsErro: TTabSheet;
    memErro: TMemo;
    Panel3: TPanel;
    btnExclui: TfcShapeBtn;
    btnInsert: TfcShapeBtn;
    btnTotaliza: TfcShapeBtn;
    edtTotalLanc: TRealEdit;
    Panel1: TPanel;
    lblParcelas: TLabel;
    chkParcelar: TCheckBox;
    DBspnNumParcelas: TwwDBSpinEdit;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    Label9: TLabel;
    Label14: TLabel;
    rdgAcreDesc: TRadioGroup;
    DBcboAlterador: TwwDBLookupCombo;
    edtValor: TEditNum;
    molFornecedor1: TmolFornecedor;
    gbPeriodoCtbDiaria: TGroupBox;
    Label11: TLabel;
    Label28: TLabel;
    edtDtinictbdiaria: TCMDateTimePicker;
    edtDtfimctbdiaria: TCMDateTimePicker;
    molOrcamento1: TmolOrcamento;
    cdsGrupo: TCMClientDataSet;
    cdsDespesa: TCMClientDataSet;
    cdsFormaRecPag: TCMClientDataSet;
    cdsContaBancaria: TCMClientDataSet;
    cdsImoveis_1: TCMClientDataSet;
    cdsImoveis_1IMOCODIGO: TStringField;
    cdsImoveis_1CONTRATO_EXTENSO: TStringField;
    cdsImoveis_1CODTIPIMOVEL: TStringField;
    cdsImoveis_1GXIPERCENTRATEIO: TFloatField;
    cdsImoveis_1VLRIMOVEL: TFloatField;
    cdsImoveis_1IDIMOVEL: TFloatField;
    cdsImoveis_1IDCONTRATOIMOVEL: TFloatField;
    cdsImoveis_1CONNUMERO: TStringField;
    cdsImoveis_1CONNOME: TStringField;
    cdsImoveis_1DSC_IMOVEL: TStringField;
    cdsImoveis_1RATEIO_CONTRATO: TFloatField;
    CMSqlParams1: TCMSqlParams;
    chkIntegra: TCheckBox;
    cdsAlterador: TCMClientDataSet;
    cdsAlteradorIDDOCUMENTO: TFloatField;
    cdsAlteradorCODALTERADOR: TFloatField;
    cdsAlteradorVLRALTERADOR: TFloatField;
    cdsAlteradorDESCRICAO: TStringField;
    cdsAlteradorDATALANCTO: TDateTimeField;
    cdsAlteradorXTipoImovel: TCMClientDataSet;
    cdsAlteradorXTipoImovelCODTIPIMOVEL: TStringField;
    cdsAlteradorXTipoImovelCODALTERADOR: TFloatField;
    cdsAlteradorXTipoImovelDESCRICAO: TStringField;
    cdsAlteradorXTipoImovelACRESDECRES: TStringField;
    cdsAlteradorXTipoImovelRECPAG: TStringField;
    cdsAlteradorCODTIPIMOVEL: TStringField;
    cdsAlteradorXTipoImovelCHAVE: TStringField;
    cdsCCusto: TCMClientDataSet;
    cdsCCustoNOME: TStringField;
    cdsCCustoCODCENTROCUSTO: TStringField;
    cdsCCustoIDEMPRESA: TFloatField;
    cdsContaBancariaIDCBANCARIA: TFloatField;
    cdsContaBancariaCONTACORRENTE: TStringField;
    cdsContaBancariaFLGCONTAPREF: TFloatField;
    cdsContaBancariaNUMAGENCIA: TStringField;
    cdsContaBancariaNUMBANCO: TStringField;
    edtObsAlt: TEdit;
    Label6: TLabel;
    cdsAlteradorOBSERVACAO: TStringField;
    twSelecionaContrato: TToolWindow97;
    Panel2: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Panel6: TPanel;
    pnlSelContrato: TPanel;
    Label8: TLabel;
    wwDBLComboSelContrato: TwwDBLookupCombo;
    dsContrato: TwwDataSource;
    cdsContrato: TCMClientDataSet;
    cdsContratoIDCONTRATOIMOVEL: TFloatField;
    cdsContratoCONNUMERO: TStringField;
    cdsContratoCONNOME: TStringField;
    cdsContratoCONTRATO_EXTENSO: TStringField;
    dspBuscaContrato: TDataSetProvider;
    cdsContratoCIMPERCENTRATEIO: TFloatField;
    Label30: TLabel;
    edtHistLanc: TEdit;
    molContrato1: TmolContrato;
    cdsImoveis_1IMOAREA: TFloatField;
    cdsAlteradorACRESDECRES: TStringField;
    cdsImoveis: TCMClientDataSet;
    cdsZerado: TCMClientDataSet;
    chkLancaVoto: TCheckBox;
    MontaSelectVoto: TMontaSelect;
    cdsAUX: TCMClientDataSet;
    pnlVoto: TPanel;
    lblVoto: TLabel;
    edtVoto: TEdit;
    btnBuscaVoto: TBitBtn;
    btnLimpaVoto: TBitBtn;
    qryAux: TwwQuery;
    cdsTipoServico: TCMClientDataSet;
    cdsProcessos: TCMClientDataSet;
    tbsNFS2: TTabSheet;
    lblNFSNumero: TLabel;
    edtNFSNumero: TEdit;
    lblNFSSerie: TLabel;
    edtNFSSerie: TEdit;
    lblNFSDataEmissao: TLabel;
    dtpNFSDataEmissao: TCMDateTimePicker;
    lblNFSValor: TLabel;
    edtValorBrutoNFS: TRealEdit;
    lblNFSObs: TLabel;
    mmNFSObs: TMemo;
    fcLabel4: TfcLabel;
    cdsAlteradorFLGLANCANFS: TStringField;
    cdsAlteradorXTipoImovelFLGLANCANFS: TStringField;
    lblTipoServico: TLabel;
    dbLkpTipoServico: TwwDBLookupCombo;
    lblProcesso: TLabel;
    dbLkpProcessos: TwwDBLookupCombo;
    cdsAlteradorIDTIPOSERVICO: TFloatField;
    cdsAlteradorIDPROCESSO: TFloatField;
    cdsAlteradorIDENVIODOCUMENTO: TFloatField;
    lblValorBase: TLabel;
    edtValorBase: TRealEdit;
    cdsAlteradorVALOREBASERETENCAO: TFloatField;
    cdsAlteradorXTipoImovelFLGVALORBASE: TStringField;
    pnlAlteradoresGerados: TPanel;
    DBgrdAlteradoresLanc: TwwDBGrid;
    Panel4: TPanel;
    bbtnInsereAlterador: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    msListaServico: TMontaSelect;
    lblAtivProdServ: TLabel;
    cmProcListaServicos: TCMProcura;
    chkOptanteSimples: TCheckBox;
    odAbreArq: TOpenDialog;
    gboxPlaniha: TGroupBox;
    pnlrateio: TPanel;
    sbtnSelArquivo: TToolbarButton97;
    edtArquivo: TEdit;
    btnGrupoRateio: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure DBgrdLancamentosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnTotalizaClick(Sender: TObject);
    procedure rdgAcreDescClick(Sender: TObject);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);
    procedure bbtnInsereAlteradorClick(Sender: TObject);
    procedure DBcboFormaRecPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure DBcboTipoRecDesCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtDataLancChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBcboGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboGrupoExit(Sender: TObject);
    procedure molContrato1edtContratoChange(Sender: TObject);
    procedure molContrato1edtContratoExit(Sender: TObject);
    procedure edtDataVencExit(Sender: TObject);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure molContrato1btnLimpaContratoClick(Sender: TObject);
    procedure btnBuscaVotoClick(Sender: TObject);
    procedure btnLimpaVotoClick(Sender: TObject);
    procedure molFornecedor1btnLimpaFornClick(Sender: TObject);
    procedure DBcboAlteradorChange(Sender: TObject);
    procedure cmProcListaServicosValidaDados(Sender: TObject);
    procedure sbtnSelArquivoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlDocumentoXVoto: TCtrlDocumentoXVoto;//Darivaldo Alencar SIG26054
    CtrlGrupoRateio : TCtrlGrupoRateio;
    CtrlTipoDespesa : TCtrlTipoCustoRecImov;
    CtrlFormaRecPag : TCtrlFormaRecPag;
    CtrlLancImovel  : TCtrlLancamentosImovel;
    CtrlTipoImovel  : TCtrlTipoImovel; // Marcio Motta - 12/02/2004 - Pendência: 16082
    CtrlCentroCusto : TCtrlCentroCusto; // Marcio Motta - 08/03/2004 - Pendência: 16112
    CtrlBanco       : TCtrlBanco; // Marcio Motta - 08/03/2004 - Pendência: 16112
    CtrlOrcamento   : TOrcamentoBackMT; // Marcio MOtta - 08/03/2004 - Pendência: 16112
    CtrlAvaliacaoFornec: TCtrlAvaliacaoFornec;
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381
    CtrlListaServicos : TCtrlListaServicos;

    iResult       : smallint;
    sTipoImovel   : string;
    iDocumento    : integer;
    iErro         : Integer;
    sMotivoRespon : string;
    iTiposImoveis : integer;
//Higor Nayde SOL 188854 Kintana 1784331 - Início
    flgavaliafornec : boolean;

    ivnodocumento: Integer;
    ivdocumento: Integer;
    ividforcli: Integer;
//Higor Nayde SOL 188854 Kintana 1784331 - fim

    _IdCidade: Integer; // Peterson Victor  - SIG25057
    _IdPais: Integer;   // Peterson Victor  - SIG25057
    _UF: String;        // Peterson Victor  - SIG25057

    //bDespesaComMaodeObra: boolean; //Cássio Rovaroto - SIG nº 115585

    bIndicaNFS: boolean; //Cássio Rovaroto - SIG nº 89101
    bMsgAlteradorRetencao : boolean; //Cássio Rovaroto - SIG nº 115585
    bRegNFS: Boolean;
    _IdServico, _CodNaturezaREINF: Integer;
    cdsAltTributo : TCMClientDataSet;

    // Inicio WO8602 Ferrari
    lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta : integer;
    vColunasArq  : TArrayStr;
    vColunaTipo  : TArrayTipo;
    vColunaOpcao : TArrayOpcao;
    vDadosProntos : TArrayImportaImoveis;
    iNumeroTotal : Integer;
    iNumeroOK : Integer;
    dTotal : Double;
    // Fim WO8602 Ferrari

    procedure ValidaArquivo(var iNumFalhas : integer; var iNumOK :Integer; var iNumNOK :Integer; var vDadosProntos : TArrayImportaImoveis);

    procedure AbreTipoAlterador;
    procedure CalculaDataCtbDiaria;

    function  VerificaPreenchimento          : Boolean;
    function  VerificaPreenchimentoAlterador : Boolean;
    function  VerificaTipoImoveisLanc        : Boolean;
    function  VerificaContaBancaria          : Boolean;

    function  ContinuaPagSelecao : Boolean;
    function  ContinuaPagImovel  : Boolean;
    function  VoltaPagImovel     : Boolean;

    function  CalculaRateio: Boolean;
    function  TotalizaRateio( var fTotalRateio: currency) : Boolean;
    function  BuscaContratoImovel(const iIdImovel: Integer): Boolean;
    function  BuscaContratoImovelPlanilha(const iIdImovel: string): Boolean;

    function  GeraLancamentos : ShortInt;
    function  GravaLancamento(const iDocumento: Integer) : Boolean;
    //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
    function  EfetuarRateioZerado(pValorResto : Extended; pCds : TCMClientDataSet) : Extended;
    function  EfetuarRateioMenorMaior(pValorRest : Extended) : Extended;
    //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA : 1745291 - Fim

    procedure JustificarFornec;
    procedure FazerAvaliacao;
    procedure AbrirAvaliacao;

    procedure AtribuiPercentRateio;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    procedure CalculaPercentualRateio;       // edilaine - SOL 256577 / PPM 843368
    function  ContinuaPagNfs: boolean; //Cássio Rovaroto - SIG nº 23656.59199

  public
    { Public declarations }
    {Início - Michelle Mota - SIG26054}
    function VerificaVoto : Boolean;
    function VerificaExisteVoto : Boolean;
    function VerificaSaldoTotal : Boolean;
    {Término - Michelle Mota - SIG26054}
    procedure ExibeAbaNFS;
    procedure ExibeAbaAlteradores;
    function LancamentoAlteradoresTributacao(iIDServico: Integer) : Boolean;
    function RegistraDadosAlterador(iIdServico, iTipoTributo: Integer): Boolean;
    function VerificaAlteradorTribLancado(iIdServico: Integer): Boolean;
  end;

var
  frmExecLancMultDespMT: TfrmExecLancMultDespMT;
  iIdVoto: Integer; //Michelle Mota - SIG26054

implementation

{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, dBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   UModuloAdminImob, UDiasInUteis, dImobiliario, dLookImobiliario, uFuncoesImob, uDocumento,
   uModuloImobiliario, uCalcDocumento, DMS, dLancImovel, dRelLancamento, uCMRptManager,
   uImpostoRetido, FProgresso, FPrincipal {Ini - MSMT - SIG26054}, JclSysUtils{Fim - MSMT - SIG26054};

{ TfrmExecLancMultDesp }


function ExtraiDecimalParaInteiros(rValor : extended) : integer;
begin
 rValor := rValor * 100;
 result := StrToInt( StringReplace(FloatToStr(rValor), '0,', '', [rfReplaceAll]) );
end;


procedure TfrmExecLancMultDespMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria os CtrlObjects dos objetos a serem utilizados
  CtrlGrupoRateio := TCtrlGrupoRateio.Create;
  CtrlTipoDespesa := TCtrlTipoCustoRecImov.Create;
  CtrlFormaRecPag := TCtrlFormaRecPag.Create;
  CtrlLancImovel  := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);

  CtrlTipoImovel  := TCtrlTipoImovel.Create; // Marcio Motta - 12/02/2004 - Pendência 16082
  CtrlCentroCusto := TCtrlCentroCusto.Create; // Marcio Motta - 08/03/2004 - Pendência 16112
  CtrlBanco       := TCtrlBanco.Create; // Marcio Motta - 08/03/2004 - Pendência: 16112

  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlGrupoRateio.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);
  CtrlTipoDespesa.InitializeAs( CtrlGrupoRateio );
  CtrlFormaRecPag.InitializeAs( CtrlGrupoRateio );
  CtrlLancImovel.InitializeAs ( CtrlGrupoRateio );
  CtrlTipoImovel.InitializeAs ( CtrlGrupoRateio ); // Marcio Motta - 12/02/2004 - Pendência 16082
  CtrlCentroCusto.InitializeAs ( CtrlGrupoRateio ); // Marcio Motta - 08/03/2004 - Pendência 16112
  CtrlBanco.InitializeAs ( CtrlGrupoRateio ); // Marcio Motta - 08/03/2004 - Pendência 16112

  CtrlListaServicos := TCtrlListaServicos.Create;
  CtrlListaServicos.InitializeAs(CtrlGrupoRateio);

  // Carrega os Cds de Lookup com os valores dos devidos CtrlObjects
  cdsGrupo.Data       := CtrlGrupoRateio.LookupGrupoRateio(Sistema.IdModulo);
  cdsDespesa.Data     := CtrlTipoDespesa.LookupTipoCustoRecImov(Sistema.IdModulo,'C');
  cdsFormaRecPag.Data := CtrlFormaRecPag.ListFormaRecPag(Sistema.IdEmpresa,0,'P');
  cdsCCusto.Data      := CtrlCentroCusto.ListaCCustoUsrAtivos(Sistema.IdEmpresa, Sistema.IdUsuario,0); // Marcio Motta - 08/03/2004 - Pendência 16112

  // Habilita o Nr. do Orçamento apenas quando a integração estiver ligada
  // Marcio Motta - 08/03/2004 - Pendência: 16112
  molOrcamento1.Clear;
  if ModuloImobiliario.AdminImob.bFlgIntegraOrcamen then begin
     CtrlOrcamento := TOrcamentoBackMT.Create;
     CtrlOrcamento.InitializeAs( CtrlLancImovel );
     CtrlOrcamento.IdEmpresa := Sistema.IdEmpresa;
     CtrlOrcamento.IdUsuario := Sistema.IdUsuario;
     molOrcamento1.Visible := True;
     // Edilaine - SOL 1077772-5681 / KTN 1358973
     DBcboTipoRecDes.Width := 150;
     molFornecedor1.Left   := 161;
     molFornecedor1.edtNomeFantasia.width := 175;
     molFornecedor1.edtRazaoSocial.width  := 175;
     molFornecedor1.edtRazaoSocial.left   := molFornecedor1.edtNomeFantasia.left+molFornecedor1.edtNomeFantasia.width+1;
     molFornecedor1.btnBuscaForn.left     := molFornecedor1.edtRazaoSocial.left+molFornecedor1.edtRazaoSocial.width;
     molFornecedor1.btnLimpaForn.left     := molFornecedor1.btnBuscaForn.left+molFornecedor1.btnBuscaForn.width;
     molFornecedor1.width  := molFornecedor1.btnLimpaForn.left+molFornecedor1.btnLimpaForn.width+2;
     // Edilaine - SOL 1077772-5681 / KTN 1358973 - fim
  end else begin
     molOrcamento1.Visible := False;
     // Edilaine - SOL 1077772-5681 / KTN 1358973
     DBcboTipoRecDes.Width := 200;
     molFornecedor1.Left   := 211;
     molFornecedor1.edtNomeFantasia.width := 200;
     molFornecedor1.edtRazaoSocial.width  := 200;
     molFornecedor1.edtRazaoSocial.left   := molFornecedor1.edtNomeFantasia.left+molFornecedor1.edtNomeFantasia.width+1;
     molFornecedor1.btnBuscaForn.left     := molFornecedor1.edtRazaoSocial.left+molFornecedor1.edtRazaoSocial.width;
     molFornecedor1.btnLimpaForn.left     := molFornecedor1.btnBuscaForn.left+molFornecedor1.btnBuscaForn.width;
     molFornecedor1.width  := molFornecedor1.btnLimpaForn.left+molFornecedor1.btnLimpaForn.width+2;
     // Edilaine - SOL 1077772-5681 / KTN 1358973 - fim
  end;

  // Define Defaults
  molFornecedor1.btnLimpaFornClick( Self );
  chkContrato.Checked := ModuloImobiliario.AdminImob.bFlgObrigaContrato;
  cboMes.ItemIndex    := DiasUteis.ExtraiMes(Date)-1;
  DBspnAno.Value      := DiasUteis.ExtraiAno(Date);
  if ModuloImobiliario.AdminImob.sCodCentroCusto <> '' then
     DbCboCentroCusto.LookupValue := ModuloImobiliario.AdminImob.sCodCentroCusto;
  if ModuloImobiliario.AdminImob.bFlgHistContDifAP then
       memObs.MaxLength := 1000    // histórico contábil (concatenado) <> obs ap
  else memObs.MaxLength := 200;    // histórico contábil = obs ap

  // Apenas exibe o período da Ctb diária, se o mesmo estiver ativado no parâmetro
  if ModuloImobiliario.AdminImob.bFlgDiario then begin
     gbPeriodoCtbDiaria.Visible := True;

// Daniel - 22993 [ Ajustei o posicionamento dos componentes e comentei os anteriores ]
     lblReferenciaAP.Top        := 284; //268;
     edtReferenciaAP.Top        := 298; //282;
     lblCentroCusto.Top         := 320; //308;
     dbcboCentroCusto.Top       := 334; //322;
     chkLancaVoto.Top           := 324; // Michelle Mota - SIG26054
     chkLancaVoto.Left          := 352; // Michelle Mota - SIG26054
     chkContrato.Top            := 344; //312;
     chkContrato.Left           := 352;
     chkIntegra.Top             := 364; //332;
     chkIntegra.Left            := 352;
// Daniel - 22993 [ Ajustei o posicionamento dos componentes e comentei os anteriores ]

  end else begin
     gbPeriodoCtbDiaria.Visible := False;
     lblReferenciaAP.Top        := 204;
     edtReferenciaAP.Top        := 219;
     lblCentroCusto.Top         := 245;
     dbcboCentroCusto.Top       := 259;
     chkContrato.Top            := 287;
     chkContrato.Left           := 8;
     chkIntegra.Top             := 320;
     chkIntegra.Left            := 8;
  end;

  CtrlAvaliacaoFornec := TCtrlAvaliacaoFornec.Create;
  CtrlAvaliacaoFornec.InitializeAs(Padroes);
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
  flgavaliafornec:=true; //Higor Nayde SOL 188854 Kintana 1784331

  DiasUteis.SetLogradouro(Sistema.IdEmpresa, _IdCidade, _IdPais, _UF); // Peterson Victor  - SIG25057

  iIdVoto := 0; // Michelle Mota - SIG26054

  //Darivaldo Alencar SIG26054
  CtrlDocumentoXVoto:= TCtrlDocumentoXVoto.create;
  CtrlDocumentoXVoto.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                 ComunsImobiliario.MensErroMT);
  //Darivaldo Alencar SIG26054

  //bDespesaComMaoDeObra := false; //Cássio Rovaroto - SIG nº 23656.59199 //Cássio Rovaroto - SIG nº 115585
  bIndicaNFS := False; //Cássio Rovaroto - SIG nº 89101

  //Cássio Rovaroto - SIG nº 115585 - Início
  dbLkpTipoServico.Visible := False;
  dbLkpProcessos.Visible := False;
  edtValorBase.Visible := False;
  bMsgAlteradorRetencao := True;
  //Cássio Rovaroto - SIG nº 115585 - Fim
  bRegNFS := False;
  _IdServico := -1;
  _CodNaturezaREINF := -1;
end;

procedure TfrmExecLancMultDespMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlGrupoRateio);
  FreeAndNil(CtrlTipoDespesa);
  FreeAndNil(CtrlFormaRecPag);
  FreeAndNil(CtrlLancImovel);
  FreeAndNil(CtrlTipoImovel); // Marcio Motta - 12/02/2004 - Pendência: 16082
  FreeAndNil(CtrlCentroCusto); // Marcio Motta - 08/03/2004 - Pendência: 16112
  FreeAndNil(CTrlBanco); // Marcio Motta - 08/03/2004 - Pendência: 16112
  if Assigned(CtrlOrcamento) then FreeAndNil(CtrlOrcamento); // Marcio Motta - 08/03/2004 - Pendência: 16112
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
  inherited;
end;



procedure TfrmExecLancMultDespMT.FormShow(Sender: TObject);
begin
  inherited;
  PagControle.ActivePageIndex := 0;

  // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
  // na contabilidade e no contas a pagar
  iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

  // preenche o número do documento = id.Documento 18/07
  edtNumDocumento.Text := FormatFloat('#0', iDocumento);
end;

procedure TfrmExecLancMultDespMT.AbreTipoAlterador;
var
  sAcreDecres : string;

begin
//---------- 12/02/2004 - Marcio Motta ---- Pendência : 16082 -----------------------

   // Monta a string com os tipos diferentes de imóveis para passar para a função do ctrlObject
   // Conta a quantidade diferente de tipos de imóveis existentes
   iTiposImoveis := 0;
   sTipoImovel := '';
   cdsImoveis.First;

   while not cdsImoveis.Eof do begin
      if pos(cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString,sTipoImovel) = 0 then begin
         inc(iTiposImoveis);
         if sTipoImovel = '' then
            sTipoImovel := cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString
         else if (iTiposImoveis = 2) then
            sTipoImovel := QuotedStr(sTipoImovel) + ',' + QuotedStr(cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString)
         else
            sTipoImovel := sTipoImovel + ',' + QuotedStr(cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString)
      end;
      cdsImoveis.Next;
   end;

   // Define se é de acréscimo ou decréscimo para passar para a função do ctrlObject
   case rdgAcreDesc.ItemIndex of
      0: sAcreDecres := 'C'; // Acréscimo
      1: sAcreDecres := 'D'; // Desconto
   end;

   // Carrega o CDS chamando uma função do ctrlObject
   cdsAlteradorXTipoImovel.Data := CtrlTipoImovel.LookupAlteradoXTipoImo(
                                   Sistema.idEmpresa, -1, sTipoImovel, 'P', sAcreDecres);

//------- Fim Implementação/Alteração - Marcio Motta -------------------------------

end;

procedure TfrmExecLancMultDespMT.cboMesChange(Sender: TObject);
begin
  inherited;
  edtDataLanc.Date := FuncoesImob.DataLancamento((cboMes.ItemIndex + 1), word(trunc(DBspnAno.Value)), edtDataVenc.Date);
  CalculaDataCtbDiaria;
end;

function TfrmExecLancMultDespMT.VerificaPreenchimento: Boolean;
var
  iDia, iMes, iAno, iDifMeses, iAnoComp, iMesComp: word;

  // Marcio Motta - 18/02/2004 - Pendência: 16112
  iAnoLancContab, iMesLancContab, iDiaLancContab: word;
  //------- Fim Implementação/Alteração - Marcio Motta -------------------------------

  dDia1, dDia2: TDateTime;
  iAnoMesContab, iAnoMesIniCtb, iAnoMesFimCtb : Integer;
begin

// Marcio Motta - 18/02/2004 - Pendência: 16112
// Alterado para pegar a data de Lançamento contábil ao invés da data de Competência

   Result := False;
   try
      iAnoComp := Word(trunc(DBspnAno.Value));
      iMesComp := cboMes.ItemIndex + 1;

      if (VerificaVoto) then                                        // William Santana - SIG 26054
          // raise EValidacao.CreateVal('Não existe voto cadastro para o fornecedor informado.',chkLancaVoto); // William Santana - SIG 26054
          raise EValidacao.CreateVal('Não existe voto cadastrado para o fornecedor cadastrado.',chkLancaVoto); // Darivaldo Alencar - SIG 26054 -inicio

      if (DBcboFormaRecPag.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar a forma de pagamento!', DBcboFormaRecPag);

      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa a ser rateada!', DBcboTipoRecDes);

      if ( molFornecedor1.iFornecedor = -1 ) then
         raise EValidacao.CreateVal('É necessário indicar o Fornecedor/Favorecido!', molFornecedor1.btnBuscaForn);

      if ( edtNumDocumento.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Nr. do documento!', edtNumDocumento);

      if ( dbCboContaBancaria.Enabled ) and ( dbCboContaBancaria.LookupValue = '' ) then
         raise EValidacao.CreateVal('É necessário a conta bancária!', dbCboContaBancaria);

      if (edtVlrTotal.Value <= 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor Total a ser rateado!', edtVlrTotal);

      if (cboMes.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if (length(trim(edtDataVenc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if (length(trim(edtDataLanc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLanc);

      // Decodifica a data de Lançamento Contábil
      DecodeDate(edtDataLanc.Date, iAnoLancContab, iMesLancContab, iDiaLancContab);

      // Se não for permitido efetuar lançamento contábil fora do período gerencial
      if not ModuloImobiliario.AdminImob.bFlgLancForaComp then begin
         dDia1 := DiasInUteis.UltDiaMes (iAnoComp, iMesComp);
         if edtDataLanc.Date > dDia1 then
            raise EValidacao.CreateVal('A data de lançamento não pode ser posterior a sua competência!',edtDataLanc);
      end;

// Daniel - 22688 - Início -----------------------------------------------------
      {Não permitir efetuar o lançamento caso a Data de Vencimento seja anterior
       a Data de Lançamento}
      if (ModuloImobiliario.AdminImob.bFlgBloqDtLanc) then begin
        if (edtDataVenc.Date<edtDataLanc.Date) then
          raise EValidacao.CreateVal('A data de lançamento não pode ser posterior ao seu vencimento!',edtDataVenc);
          //raise EValidacao.CreateVal('Não é permitido realizar lançamentos após a data de vencimento!',edtDataVenc);
      end;
// Daniel - 22688 - Fim --------------------------------------------------------

      // Se a data de Lançamento contábil for menor que a data de competência
      if (iAnoLancContab < DBspnAno.Value) or (iMesLancContab < cboMes.ItemIndex + 1) then
         if MsgDlg ('A data de lançamento digitada é inferior a data de competência. Continua?', 'AdminImob', mtConfirmation, [mbyes,mbno], 0) = MrNo then
           raise EValidacao.CreateVal('Altere data de Lançamento.', edtDataLanc);

      { 20/06
        se possui contabilização diária
           se despesas/receitas com periodicidade mensal
              a competencia do lançamento somente pode ser igual a competencia
              atual ou no máximo um mês apos
      }

      if ModuloImobiliario.AdminImob.bFlgDiario then begin

            if (cdsDespesa.FieldByName('FLGDIARIO').AsString = 'M') or
               (cdsDespesa.FieldByName('FLGDIARIO').AsString = 'A') then begin

            if (length(trim(edtDtinictbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de início da Contabilização!', edtDtinictbdiaria);

            if (length(trim(edtDtfimctbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de término da Contabilização!', edtDtfimctbdiaria);

            if (edtDtinictbdiaria.Date > edtDtfimctbdiaria.Date) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária não deve ser superior a data de término!', edtDtfimctbdiaria);
         end;

         if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'M' then begin
            // Pega a data definida na tela de parêmentros
            // Primeiro dia permitido para o Lançamento
            dDia1 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                                ModuloImobiliario.AdminImob.iMesCompetencia, 1);

            // Pega a data de Lançamento Contábil
            dDia2 := EncodeDate(iAnoLancContab, iMesLancContab, 1);

            // Se data de Lançamento Contábil for menor que a data informada na tela de Parâmetros
            if dDia2 < dDia1 then begin  // tentativa de lançar em um mes anterior
               raise EValidacao.CreateVal('A data de lançamento informada pertence a um período já encerrado!', edtDataLanc);
            end else begin

               // Pega a diferença de meses entre o período definido na tela de parâmetros
               // e a data de lançamento contábil
               iDifMeses := DiasInUteis.IntervaloMeses(dDia1, dDia2);

               // Verifica a diferença de meses existente.
               // Se estiver dentro do permitido, apenas avise ao usuário
               // Senão informa que não será permitido efetuar o lançamento no período
               if iDifMeses < ModuloImobiliario.AdminImob.iMesBloqLancto then
                  MsgDlg('O período para a data de lançamento informada ainda não foi inicializado.', 'Informação', mtInformation, [mbok], 0)
               else if iDifMeses > ModuloImobiliario.AdminImob.iMesBloqLancto then
                  raise EValidacao.CreateVal('O período para a data de lançamento informada é superior ao permitido, execute o encerramento mensal!', edtDataLanc);
            end;

            // Decodifica a data inicial da contab. diária
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);

            // O período INICIAL da contabilização diária deve estar dentro do
            // período de lançamento contábil
            if (iAno <> iAnoLancContab) or (iMes <> iMesLancContab) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária deve estar dentro da Competência Contábil!', edtDtinictbdiaria);

            // Decodifica a data final da contab. diária
            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);

            // O período FINAL da contabilização diária deve estar dentro do
            // período de lançamento contábil
            if (iAno <> iAnoLancContab) or (iMes <> iMesLancContab) then
               raise EValidacao.CreateVal('Data de término da Contabilização diária deve estar dentro da Competência Contábil!', edtDtfimctbdiaria);

         end else if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'A' then begin
            // Monta Mês e Ano da data de lançamento contábil
            iAnoMesContab := StrToInt(FormatFloat('0999',iAnoLancContab) + FormatFloat('09',iMesLancContab));

            // Decodifica a data INICIAL da contabilização DIÁRIA
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);

            // Monta Mês e Ano da data INICIAL d contabilização DIÁRIA
            iAnoMesIniCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

            // Decodifica a data FINAL da contabilização DIÁRIA
            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);

            // Monta Mês e Ano FINAL da contabilização DIÁRIA
            iAnoMesFimCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

            // A competência contábil do Lançamento deve estar compreendida entre o período da
            // contabilização diária informado
            if (iAnoMesContab < iAnoMesIniCtb) or (iAnoMesContab > iAnoMesFimCtb) then
               raise EValidacao.CreateVal('A Competência deve estar compreendida entre o período da Contabilização Diária!', edtDtInictbdiaria);
         end;
      end;
      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataVenc);
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLanc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataLanc);
      // Helen - SOL: 172902 KTN: 1577381 - Fim

      // verifica se o vencimento escolhido é um dia inútil
      if ModuloImobiliario.AdminImob.bFlgDiaUtilAP then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if ModuloImobiliario.AdminImob.bFlgUsaAP then begin
         if (DBcboFormaRecPag.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaRecPag);

         if (length(trim(edtReferenciaAP.Text)) = 0) then
            raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);

         if (DBcboCentroCusto.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);
      end;

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

function TfrmExecLancMultDespMT.VerificaPreenchimentoAlterador: Boolean;
var fValor: Extended;
begin
   Result := False;
   try
      if (DBcboAlterador.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o alterador!', DBcboAlterador);

      try
         fValor := StrToFloat(edtValor.Text);
      except
         fValor := 0;
      end;

      if fValor = 0 then
         raise EValidacao.CreateVal('É necessário indicar um valor válido!', edtValor);

      //Cássio Rovaroto - SIG nº 115585 - Início
      if (dbLkpTipoServico.Visible) and (dbLkpTipoServico.Text =  '') then
        raise EValidacao.createVal('Para este lançamento, informe o tipo de serviço.', dbLkpTipoServico);
      if edtValorBase.Visible then
      begin
        if (edtValorBase.Value = 0) or (edtValorBase.Text = '') then
          raise EValidacao.createVal('Para este lançamento, informe o valor base de retenção.', edtValorBase)
        else
          if (bMsgAlteradorRetencao) then
            if MessageDlg('O valor base de retenção deste tributo é realmente de R$' + FloatToStrF(edtValorBase.Value, ffNumber, 15, 2) + '?', mtInformation, [mbYes, mbNo], 0) = mrNo then
            begin
              edtValorBase.SetFocus;
              Result := False;
              bMsgAlteradorRetencao := False;
              Exit;
            end;
      end;
      //Cássio Rovaroto - SIG nº 115585 - Fim
      
       //Higor Nayde Ferreira - SOL 182262  KINTANA 1698376 Inicio
       if not cdsAlterador.IsEmpty then
       begin
            cdsAlterador.First;
           while (not cdsAlterador.Eof) do
           begin
                if (cdsAlteradorCODTIPIMOVEL.AsString = cdsAlteradorXTipoImovelCODTIPIMOVEL.AsString) and
                    (cdsAlteradorCODALTERADOR.AsString = cdsAlteradorXTipoImovelCODALTERADOR.AsString) then
                begin

                       MsgDlg('Alterador e Segmento de Imóvel já cadastrado para o documento.', 'Atenção', mtInformation, [mbok], 0);
                       Exit;
                end;
                cdsAlterador.Next;
           end;
       end;
       //Higor Nayde Ferreira - SOL 182262  KINTANA 1698376 Fim

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

function TfrmExecLancMultDespMT.VerificaTipoImoveisLanc: Boolean;
begin
  Result := True;
  cdsImoveis.DisableControls;
  cdsImoveis.First;
  sTipoImovel := cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString;

  if not ModuloImobiliario.AdminImob.bFlgMultiTipo then begin
     while not cdsImoveis.Eof do begin
       if sTipoImovel <> cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString then begin
         MsgDlg('Não é permitida a inclusão de imóveis de tipos diferentes '+#13+
                'no mesmo documento','Erro',mtError,[mbOk],0);
         Result := False;
         Break;
       end;
       cdsImoveis.Next;
     end;
  end;

  // Verifica imóveis com valor de rateio = 0
  cdsImoveis.First;
  while not cdsImoveis.Eof do begin
    if cdsImoveis.FieldbyName('VLRIMOVEL').AsFloat = 0 then begin
      MsgDlg('Existem imóveis sem valor informado','Erro',mtError,[mbOk],0);
      Result := False;
      Break;
    end;
    cdsImoveis.Next;
  end;

  cdsImoveis.First;
  cdsImoveis.EnableControls;
end;

function TfrmExecLancMultDespMT.VerificaContaBancaria: Boolean;
begin
   Result := True;

   if (molFornecedor1.iFornecedor <> -1) and (DBcboFormaRecPag.LookupValue <> '')
      and (cdsFormaRecPag.FieldByName('FLGDADOSBANCARIOS').AsString = 'S') then begin
      lblContaBancaria.Enabled   := True;
      dbCboContaBancaria.Enabled := True;

      cdsContaBancaria.Data := CtrlBanco.LookupContabancaria(molFornecedor1.iFornecedor);

      if cdsContaBancaria.RecordCount > 1 then begin
         cdsContaBancaria.First;
         while not cdsContaBancaria.Eof do begin
            if cdsContaBancaria.FieldByName('FLGCONTAPREF').AsInteger = 1 then begin
               dbCboContaBancaria.LookupValue := IntToStr(cdsContaBancaria.FieldByName('IDCBANCARIA').AsInteger);
               Exit;
            end;
            cdsContaBancaria.Next;
         end;
      end else if cdsContaBancaria.RecordCount = 1 then begin
         dbCboContaBancaria.LookupValue := IntToStr(cdsContaBancaria.FieldByName('IDCBANCARIA').AsInteger);
      end;

   end else begin
      Result := False;
      lblContaBancaria.Enabled       := False;
      dbCboContaBancaria.Enabled     := False;
      dbCboContaBancaria.LookupValue := '';
   end;
end;


function TfrmExecLancMultDespMT.TotalizaRateio( var fTotalRateio: currency): Boolean;
begin
   Result       := True;
   fTotalRateio := 0;
   cdsImoveis.DisableControls;
   cdsImoveis.First;
   while not cdsImoveis.Eof do begin
      fTotalRateio := fTotalRateio + ComunsImobiliario.Arredonda(cdsImoveis.FieldbyName('VLRIMOVEL').AsFloat, 2);
      if (cdsImoveis.FieldbyName('IDCONTRATOIMOVEL').IsNull) and (chkContrato.Checked) then Result := False;
      cdsImoveis.Next;
   end;
   cdsImoveis.First;
   cdsImoveis.EnableControls;

   fTotalRateio       := ComunsImobiliario.Arredonda(fTotalRateio, 2);
   edtTotalLanc.Value := fTotalRateio;
end;

function TfrmExecLancMultDespMT.CalculaRateio: Boolean;
var fValorRateado, fValorRateioImovel, fTotalRateado : Currency;
    iContador, iIdImovel, iQtdeFields  : integer;
    sImoCodigo, sDescImovel, sCodTipImovel : String;
    fPercRateioGrupo : Extended;
    pExtResto : Currency;
    pExtPercentual, fPerRateioContr : Extended;
    sAno, sMes : String; // Daniel - 26565
    sNomeCampo : string;
begin
   // Daniel - 26565
   sAno := IntToStr(Trunc(DBspnAno.Value));
   sMes := IntToStr(cboMes.ItemIndex + 1);
   if Length(sMes) = 1 then sMes := '0' + sMes;
   // Fim.

   Result := True;

   if DBcboGrupo.LookupValue <> '' then
        //cdsImoveis.Data := CtrlGrupoRateio.LookupGrupoxImoContr(StrToInt(DBcboGrupo.LookupValue),sAno+sMes) // Daniel - 26565  // edilaine - SOL 247935 / KTN 662587 - comentado
      cdsImoveis.Data := CtrlGrupoRateio.LookupGrupoxImoContr(StrToInt(DBcboGrupo.LookupValue),sAno+sMes, DBcboGrupo.LookupValue <> '')  // edilaine - SOL 247935 / KTN 662587
   else if molContrato1.edtContrato.Text <> '' then    // Edilaine - SOL 107772-5681 / KTN 1358973
        cdsImoveis.Data := CtrlGrupoRateio.LookupContratoxImovel (molContrato1.iContrato, sAno+sMes) // Edilaine - SOL 107772-5681 / KTN 1358973
   else cdsImoveis.Data := CtrlGrupoRateio.LookupGrupoxImoContr(-2);  // vazio

   //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
   if DBcboGrupo.LookupValue <> '' then
      cdsZerado.Data := CtrlGrupoRateio.LookupGrupoxImoContr(-2, sAno+sMes, DBcboGrupo.LookupValue <> '')
   else if molContrato1.edtContrato.Text <> '' then
       cdsZerado.Data :=  CtrlGrupoRateio.LookupContratoxImovel (-1,sAno+sMes)
   else
       cdsZerado.Data := CtrlGrupoRateio.LookupGrupoxImoContr(-2);  // vazio

   //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim


   for iQtdeFields := 0 to cdsImoveis.FieldCount-1 do
   begin
      if cdsImoveis.Fields[iQtdeFields].DataType = ftFloat then
         TFloatField(cdsImoveis.Fields[iQtdeFields]).DisplayFormat := '#,##0.00';
   end;



   if not cdsImoveis.isEmpty then begin
      fTotalRateado := ComunsImobiliario.Arredonda(edtVlrTotal.Value, 2);

   // Edilaine - SOL 107772-5681 / KTN 1358973
   if molContrato1.edtContrato.Text <> '' then
      {AtribuiPercentRateio;} CalculaPercentualRateio;     // edilaine - SOL 256577 / PPM 843368
   // Edilaine - SOL 107772-5681 / KTN 1358973 - fim

      cdsImoveis.First;
      iContador := 1;
      pExtResto := 0;


      while not cdsImoveis.EOF do begin
         iIdImovel := cdsImoveis.FieldByName('IDIMOVEL').AsInteger;
         fPerRateioContr := 0;
         while (iIdImovel = cdsImoveis.FieldByName('IDIMOVEL').AsInteger) and (not cdsImoveis.EOF) do begin

            //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - inicio
            //Passo o valor da porcentagem de 4 casas decimais para 02 casas decimais
            pExtPercentual := StrToFloat(FloattoStrf( cdsImoveis.FieldbyName('GXIPERCENTRATEIO').AsFloat, ffNumber, 12, 4{2}));  // edilaine - SOL 247935 / KTN 662587
//            fValorRateioImovel := ComunsImobiliario.Arredonda(edtVlrTotal.Value * cdsImoveisGXIPERCENTRATEIO.AsFloat / 100, 2, True);
            fValorRateioImovel := ComunsImobiliario.Arredonda(edtVlrTotal.Value * pExtPercentual / 100, 2, false {True});  // edilaine - SOL 248098 / PPM 662559

            // Rateio do Rateio = se o imóvel possuir mais de um contrato então o
            // rateio deve ser rateado novamente pelo campo CONTRATOxIMOVEL.CimPercentRateio.
            // So que neste caso o usuário pode não ter cadastrado um rateio de contrato
            // com 100% gerando talvez uma inconsistência no último lançamento

            //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - inicio
            //Seleciona imoveis com valores zerados - Marcio Sanches Spinosa - Ktn: 1745291 SOL : 181200/10722
            if (fValorRateioImovel = 0) then
            begin
              cdsZerado.Append;
              for iQtdeFields := 0 to cdsImoveis.FieldCount - 1 do
              begin
                if (cdsZerado.Fields[iQtdeFields].ReadOnly = False) then
                begin
                  sNomeCampo := cdsImoveis.Fields[iQtdeFields].FieldName;
                  cdsZerado.FieldByName(sNomeCampo).Value := cdsImoveis.FieldByName(sNomeCampo).Value;
                end;
              end;
              cdsZerado.Post;
            end;
            //Seleciona imoveis com valores zerados - Marcio Sanches Spinosa - Ktn: 1745291 SOL : 181200/10722
            //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

            // edilaine - SOL 256577 / PPM 843368 - comentado inicio
            //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - inicio
            //Passo o valor da porcentagem de 4 casas decimais para 02 casas decimais
            {pExtPercentual  := StrToFloat(FloattoStrf( cdsImoveis.FieldbyName('RATEIO_CONTRATO').AsFloat, ffNumber, 12, 4 ));   // edilaine - SOL 247935 / KTN 662587
            fValorRateado   := ComunsImobiliario.Arredonda(fValorRateioImovel * pExtPercentual / 100, 2, True);
            fPerRateioContr := fPerRateioContr + cdsImoveis.FieldbyName('RATEIO_CONTRATO').AsFloat;
            }// edilaine - SOL 256577 / PPM 843368 - comentado fim

            cdsImoveis.Edit;

          //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
            // se for o ultimo registro da query colocar o valor restante nela
//            if iContador = cdsImoveis.RecordCount then
//                 cdsImoveisVLRIMOVEL.AsFloat := fTotalRateado
//            else
           cdsImoveis.FieldbyName('VLRIMOVEL').AsFloat := fValorRateioImovel;   // edilaine - SOL 256577 / PPM 843368
         //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

            // Edilaine - SOL 1077772-5681 / KTN 1358973
            if ( molContrato1.iContrato<=0 ) then
               cdsImoveis.FieldByName('IDCONTRATOIMOVEL').AsInteger := -1;
            // Edilaine - SOL 1077772-5681 / KTN 1358973 - FIM

            cdsImoveis.Post;

            // Carrega valores do imovel
            iIdImovel        := cdsImoveis.FieldByName('IDIMOVEL').AsInteger;
            sImoCodigo       := cdsImoveis.FieldByName('IMOCODIGO').AsString;
            sDescImovel      := cdsImoveis.FieldByName('DSC_IMOVEL').AsString;
            sCodTipImovel    := cdsImoveis.FieldByName('CODTIPIMOVEL').AsString;
            fPercRateioGrupo := cdsImoveis.FieldByName('GXIPERCENTRATEIO').AsFloat;

            cdsImoveis.Next;

         end;
         //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
         //fTotalRateado := fTotalRateado - fValorRateado;
         //inc(iContador);
         //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

         // edilaine - SOL 256577 / PPM 843368 - comentado inicio
         // Imóveis locados parcial devem ter o saldo do rateio lançado sem o contrato
         {if fPerRateioContr < 100 then begin
            cdsImoveis.FieldByName('GXIPERCENTRATEIO').ReadOnly := False;
            fPerRateioContr := (100 - fPerRateioContr);

            //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - inicio
            //Passo o valor da porcentagem de 4 casas decimais para 02 casas decimais
            pExtPercentual  := StrToFloat(FloattoStrf( fPerRateioContr, ffNumber, 12, 4 ));  // edilaine - SOL 247935 / KTN 662587
            fValorRateado   := ComunsImobiliario.Arredonda(fValorRateioImovel * pExtPercentual / 100, 2, True);
            cdsImoveis.Append;
            cdsImoveis.FieldByName('IDIMOVEL').AsInteger        := iIdImovel;
            cdsImoveis.FieldByName('IMOCODIGO').AsString        := sImoCodigo;
            cdsImoveis.FieldByName('DSC_IMOVEL').AsString       := sDescImovel;
            cdsImoveis.FieldByName('CODTIPIMOVEL').AsString     := sCodTipImovel;            
            cdsImoveis.FieldByName('GXIPERCENTRATEIO').AsFloat  := fPercRateioGrupo;
            cdsImoveis.FieldByName('RATEIO_CONTRATO').AsFloat   := fPerRateioContr;
            cdsImoveis.FieldByName('VLRIMOVEL').AsFloat         := fValorRateado;
            cdsImoveis.Post;
            cdsImoveis.FieldByName('GXIPERCENTRATEIO').ReadOnly := True;

            cdsImoveis.Next;
            //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
            //fTotalRateado   := fTotalRateado - fValorRateado;
            //inc(iContador);
            //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim
         end;
         }// edilaine - SOL 256577 / PPM 843368 - comentado fim

      end;
   end;

   //Verifica o menos o total utilizado no cds
   pExtResto := 0;
   cdsImoveis.First;
   while not cdsImoveis.Eof do
   begin
      pExtResto := pExtResto + cdsImoveis.FieldbyName('VLRIMOVEL').AsCurrency;
      fTotalRateado   := fTotalRateado - cdsImoveis.FieldbyName('VLRIMOVEL').AsCurrency;
      cdsImoveis.Next;
   end;

   //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
    if (fTotalRateado > 0) and (cdsZerado <> nil) and (cdsZerado.RecordCount > 0) then
      fTotalRateado := EfetuarRateioZerado(fTotalRateado, cdsZerado);

    if (Abs(fTotalRateado) > 0) then
      fTotalRateado := EfetuarRateioMenorMaior(fTotalRateado);
   //Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim

   TotalizaRateio( fTotalRateado );
end;


//--------------------------------------------------------------------------------------------------
// Retorno:  0 :  lançamentos gerados sem ocorrências
//          -1 :  lançamentos gerados mas houve ocorrências
//          -2 :  erro fatal: lançamentos NÃO gerados
//--------------------------------------------------------------------------------------------------
function TfrmExecLancMultDespMT.GeraLancamentos: ShortInt;
var fCount, fAtual : Integer;
begin
   Result := 0;
   fCount := cdsImoveis.RecordCount;

   // Exibe caixa de dialogo com a barra de progresso
   frmProgresso.MostraFormProgresso('Gerando Lançamentos...',False,False);
   Application.ProcessMessages;

   try
      try
         // insere a Observação na tabela ObsLancImovel
         if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

         fAtual := 0;
         cdsImoveis.First;
         while ( (Result > -2) and not(cdsImoveis.EOF) ) do begin

            // ProgressBar
            frmProgresso.AndaFormProgresso( fAtual, fCount );

            if Result > -2 then begin

                  if not GravaLancamento(iDocumento) then Result := -2;

            end;
            cdsImoveis.Next;
            fAtual := fAtual + 1;
         end;

         if Result <= -2 then raise exception.create('Erro na tentativa do lançamento');
      except
         Result := -2;
         MsgDlg('Houve ERRO na tentativa de Lançamento! Os Lançamentos não foram gerados.', 'Erro', mtError, [mbOk], 0);
      end;
   finally
      frmProgresso.EscondeFormProgresso;
   end;
end;

function TfrmExecLancMultDespMT.GravaLancamento(const iDocumento: Integer): Boolean;
begin
   Result := True;
   try
      with dtmLancImovel.qryInsertLancImovel do begin
         LimpaParametros(dtmLancImovel.qryInsertLancImovel);

         ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');

         if dbCboContaBancaria.Value <> '' then
            ParamByName('PIDCBANCARIA').AsInteger    := StrToInt(dbCboContaBancaria.LookupValue);

         ParamByName('PRECPAG').AsString             := 'P';
         ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
         ParamByName('PIDFORCLI').AsInteger          := molFornecedor1.iFornecedor;
         ParamByName('PIDIMOVEL').AsInteger          := cdsImoveis.FieldbyName('IDIMOVEL').AsInteger;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

         // Contrato pode ser preenchido ou não
         if ( not(cdsImoveis.FieldbyName('IDCONTRATOIMOVEL').isNULL) and (cdsImoveis.FieldbyName('IDCONTRATOIMOVEL').AsInteger > 0) ) and
            (molContrato1.edtContrato.Text <> '') then
         ParamByName('PIDCONTRATOIMOVEL').AsInteger   := cdsImoveis.FieldbyName('IDCONTRATOIMOVEL').AsInteger;

         ParamByName('PDATALANCAMENTO').AsDateTime    := edtDataLanc.Date;
         ParamByName('PDATAVENCIMENTO').AsDateTime    := edtDataVenc.Date;
         ParamByName('PVLRLANCOMPAGAR').AsFloat       := cdsImoveis.FieldbyName('VLRIMOVEL').AsFloat;
         ParamByName('PVLRLANCPAGAR').AsFloat         := cdsImoveis.FieldbyName('VLRIMOVEL').AsFloat;
         ParamByName('PMESREFERENCIA').AsInteger      := DiasInUteis.ExtraiMes(edtDataVenc.Date);
         ParamByName('PANOREFERENCIA').AsInteger      := DiasInUteis.ExtraiAno(edtDataVenc.Date);
         ParamByName('PMESCOMPETENCIA').AsInteger     := cboMes.ItemIndex + 1;
         ParamByName('PANOCOMPETENCIA').AsInteger     := word(trunc(DBspnAno.Value));
         ParamByName('PMOEDAPAGAR').AsInteger         := Modulo.iMoedaCorrente;
         ParamByName('PFLGINTEGRADO').AsInteger       := 0;   // lançamento não integrado.
         ParamByName('PIDUSUARIOSISTEMA').AsInteger   := Sistema.IdUsuario;
         ParamByName('PFLGORIGEMLANC').AsString       := 'M'; // M = Lançamentos Múltiplos
         ParamByName('PNODOCUMENTO').AsFloat          := StrToFloat(edtNumDocumento.Text);
         ParamByName('PIDDocumento').AsInteger        := iDocumento;
         ParamByName('PIDMODULO').AsInteger           := Sistema.IdModulo;

         // Período para contabilização diária
         if (length(trim(edtDtinictbdiaria.Text)) > 0) then
            ParamByName('PDTINICTBDIARIA').AsDateTime := edtDtinictbdiaria.Date;
         if (length(trim(edtDtfimctbdiaria.Text)) > 0) then
            ParamByName('PDTFIMCTBDIARIA').AsDateTime := edtDtfimctbdiaria.Date;

         // Campos obrigatorios para a AP
         if DBcboFormaRecPag.LookupValue <> '' then
            ParamByName('PCODFORMA').AsInteger        := StrToInt(DBcboFormaRecPag.LookupValue);
         ParamByName('PREFERENCIAAP').AsString        := edtReferenciaAP.Text;
         ParamByName('PCODCENTROCUSTO').AsString      := DBcboCentroCusto.LookupValue;

         // Número da Reserva orçamentária
         if molOrcamento1.iIdCompromisso > 0 then
           ParamByName('PIDRESERVAORCAMEN').AsFloat   := molOrcamento1.iIdCompromisso;

         // Daniel - 22993 -----------------------------------------------------
         if (Length(Trim(edtHistLanc.Text))>0) then
           ParamByName('POBS').AsString := edtHistLanc.Text;
         // Daniel - Fim -------------------------------------------------------

         ExecSQL;
      end;
   except
      Result := False;
   end;
end;

procedure TfrmExecLancMultDespMT.btnContinuarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
     0 : if ContinuaPagSelecao then inherited;
     1 : if ContinuaPagImovel  then
     begin
      if MsgDlg('Esta despesa está relacionada a alguma prestação de serviço?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
        ExibeAbaAlteradores
      else
        ExibeAbaNFS;
     end;
     2:
     begin
      if not ContinuaPagNfs then
        Exit
      else
        begin
          if chkOptanteSimples.Checked then
            MsgDlg('Empresas optantes pelo Simples Nacional não possuem tributação aplicável.', 'Aviso', mtInformation, [mbOK], 0)
          else
            if (cmProcListaServicos.Text = EmptyStr) then
            begin
              MsgDlg('É obrigatória a definição do tipo de Serviço, Produto ou Atividade.', 'Atenção', mtError, [mbOK], 0);
              Exit;
            end;

            if not LancamentoAlteradoresTributacao(_IdServico) then
            begin
              MsgDlg('Houve um problema no lançamento de alteradores de tributação.', 'Atenção', mtError, [mbOK], 0);
              Exit;
            end;
        end;
        ExibeAbaAlteradores;
     end;

  end;
end;

procedure TfrmExecLancMultDespMT.btnVoltarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
    1 :
      if VoltaPagImovel then inherited;
    2 :
      if VoltaPagImovel then inherited;
    3 :
      if VoltaPagImovel then
     	begin
       if bRegNFS then
       begin
        PagControle.ActivePageIndex := 2;
        btnContinuar.Enabled := True;
        btnConfirmar.enabled := False;
       end
       else
       begin
        PagControle.ActivePageIndex := 1;
        btnContinuar.Enabled := true;
       end;
      end;
  end;
end;


function TfrmExecLancMultDespMT.ContinuaPagSelecao: Boolean;
begin
  Result := False;
  // Abre a query de rateio imovel
  if VerificaPreenchimento then begin
    try
      btnContinuar.Enabled := False;
      if CalculaRateio then begin
        iErro  := 0;
        Result := True;
        CtrlLancImovel.CodigoErroLiberacao := 0;
      end;
    finally
      btnContinuar.Enabled := True;
      pnlVoto.visible := chkLancaVoto.checked; //William Santana - SIG26054
      //bDespesaComMaoDeObra := CtrlLancImovel.VerificaTipoDespesaMaoDeObra(StrToInt(DBcboTipoRecDes.LookupValue));//Cássio Rovaroto - SIG nº115585
    end;
  end;
end;

function TfrmExecLancMultDespMT.ContinuaPagImovel: Boolean;
var fTotalRateio : currency;
begin
   Result := False;

   if not VerificaTipoImoveisLanc then exit;

   if not TotalizaRateio( fTotalRateio ) then begin
     MsgDlg('Existem imóveis no grupo que não estão locados, ' +#13+
            'sendo que este lançamento obriga a informação do contrato', 'Aviso', mtWarning, [mbok], 0);
     exit;
   end;

   // o total lançado tem que bater com o total do lançamento
   if Arredonda(fTotalRateio,2) <> Arredonda(edtVlrTotal.Value,2) then begin
      MsgDlg('Total do lançamento não confere com o valor lançado.','Aviso',mtwarning,[mbok],0);
      exit;
   end;
   //Helen - SOL: 177882 KTN: 1632298 - Inicio
   cdsImoveis.First;
   while not cdsImoveis.Eof do
   begin
      if cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString = '' then
      begin
         MsgDlg('Não é permitida a inclusão de imóveis com segmentos vazios. '+#13+
                'Lançamento não permitido.','Erro',mtError,[mbOk],0);
         Result := False;
         exit;
         Break;
      end;
      cdsImoveis.next;
   end;
   //Helen - SOL: 177882 KTN: 1632298 - Fim
   //AbreTipoAlterador;

   // Limpa Cds de Alteradores
   //cdsAlterador.Data := CtrlLancImovel.LookupAlteradoresDocum(-2);

  //Início - William Santana - SIG 26054

  if (DBcboGrupo.Text = '') then
  begin
    //Darivaldo Alencar - SIG 26054 -inicio
    if (chkLancaVoto.Checked) then
      begin
        if (edtVoto.text = EmptyStr) then
           begin
              MsgDlg('Voto não informado.', 'Aviso', mtWarning, [mbOk], 0);
              exit;
           end;
      end;
    //Darivaldo Alencar - SIG 26054 -fim

    if (VerificaExisteVoto) then
    begin
       //MsgDlg('Não existe voto cadastro para o imóvel informado.', 'Aviso', mtWarning, [mbOk], 0);
       MsgDlg('O(s) imóvel(is) informados não pertencem ao voto selecionado.', 'Aviso', mtWarning, [mbOk], 0); //Darivaldo Alencar - SIG 26054 -fim
       Exit;
    end;

    if (chkLancaVoto.Checked) and //Peterson Victor - SIG296983
       (VerificaSaldoTotal) then
    begin
       MsgDlg('Total maior que Saldo.', 'Aviso', mtWarning, [mbOk], 0);
       Exit;
    end;
  end;
   //Término - William Santana - SIG 26054

   Result := True;
end;


function TfrmExecLancMultDespMT.VoltaPagImovel: Boolean;
begin
   Result := True;
   ImpostoRetido.Free;
end;

procedure TfrmExecLancMultDespMT.DBgrdLancamentosCalcCellColors( Sender: TObject; Field: TField; State: TGridDrawState;  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmExecLancMultDespMT.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecLancMultDespMT.btnInsertClick(Sender: TObject);
var MS_                 : TMontaSelect;
    iIndiceCodTipImovel : Integer;
    bGravaContrato      : Boolean;
    iImovel             : Integer;
    sDscImovel          : String;
    iIndCodImovel       : integer;  // Edilaine - SOL 1077772-5681 / KTN 1358973
begin
  inherited;

// Daniel - 24085 - Início -----------------------------------------------------
  sbtnSelArquivo.enabled := True;     // WO8602 Ferrari
  if (ModuloImobiliario.AdminImob.bFlgUsaUnidade) then begin
    // Verifica se é necessário indicar o contrato nos Lançamentos a pagar...
    if (chkContrato.Checked) then begin
      {Verifica se é possível indicar um contrato já encerrado nos Lançamentos a
       pagar.}
      if (ModuloImobiliario.AdminImob.bFlgLancPagEncerra) then
        MS_ := dtmMS.MS_UnidadeContrato
      else
        MS_ := dtmMS.MS_UnidadeContratoV;

      iIndiceCodTipImovel := 8;
      iIndCodImovel       := 9;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    end else begin
      if (ModuloImobiliario.AdminImob.bFlgLancPagInativo) then
        MS_ := dtmMS.MS_Unidade
      else
        MS_ := dtmMS.MS_UnidadeAtiva;

      iIndiceCodTipImovel := 4;
      iIndCodImovel       := 10; // Edilaine - SOL 1077772-5681 / KTN 1358973
    end;
  end else begin
// Daniel - 24085 - Fim --------------------------------------------------------

    // Verifica se é necessário indicar o contrato nos Lançamentos a pagar...
    if (chkContrato.Checked) then begin
      {Verifica se é possível indicar um contrato já encerrado nos Lançamentos a
       pagar.}
      if ModuloImobiliario.AdminImob.bFlgLancPagEncerra then
        MS_ := dtmMS.MS_ImovelContrato
      else
        MS_ := dtmMS.MS_ImovelContratoV;

      iIndiceCodTipImovel := 8;
      iIndCodImovel       := 9;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    end else begin
      if ModuloImobiliario.AdminImob.bFlgLancPagInativo then
        MS_ := dtmMS.MS_Imovel
      else
        MS_ := dtmMS.MS_ImovelAtivo;

      iIndiceCodTipImovel := 4;
      iIndCodImovel       := 7;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    end;
  end; // Fim 24085

  MS_.MultiSelect := True;
  MS_.Executar;
  Repaint;

  {Se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o
   registro buscado.}
  if MS_.RetornouValor then begin
    Screen.Cursor := crHourGlass;

    {Alterando imóveis, Zera o erro de liberação de responsabilidade, para
     verificar novamente na CtrlLancImovel.Integrar.}
    CtrlLancImovel.CodigoErroLiberacao := 0;

    {VALIA - Por motivo de lançamento de Histórico retroativo durante a
             implantação, pergunta se inclui contratos.}
    bGravaContrato := True;
    if ( (Sistema.TipoCliente=20041) and (dbSpnAno.Value<=2004) ) then begin
      if (MsgDlg('Grava os contratos relacionados aos imóveis?',
                 'Confirma',mtConfirmation,[mbYes,mbNo],0)=mrNo) then begin
        bGravaContrato := False;
      end;
    end;

    while MS_.GetNextSelected do begin
      // Imóvel
      cdsImoveis.Insert;
      cdsImoveis.FieldbyName('IMOCODIGO').AsString    := MS_.ValoresChave[iIndCodImovel];   // Edilaine - SOL 1077772-5681 / KTN 1358973
      cdsImoveis.FieldbyName('IDIMOVEL').AsInteger    := StrToInt(MS_.ValoresChave[1]);
      cdsImoveis.FieldbyName('DSC_IMOVEL').AsString   := MS_.ValoresChave[2] + ' - ' + MS_.ValoresChave[3];
      cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString := MS_.ValoresChave[iIndiceCodTipImovel];

      // Contrato
      if bGravaContrato then begin
        BuscaContratoImovel( cdsImoveis.FieldbyName('IDIMOVEL').AsInteger );
      end;

// Daniel - 24085 - Início -----------------------------------------------------
      if (ModuloImobiliario.AdminImob.bFlgUsaUnidade) then begin
        // Verifica se a Unidade está ativo
        if (MS_<>dtmMS.MS_UnidadeAtiva) then begin
          if ( (MS_<>dtmMS.MS_Unidade) and (MS_.ValoresChave[6]<>'1') ) or (MS_=dtmMS.MS_Unidade) then begin
            if not (ModuloImobiliario.AdminImob.bFlgLancPagInativo) then begin
              Screen.Cursor := crDefault;
              MsgDlg('A Unidade escolhida não está ativa! Não é possível atribuir-lhe uma despesa.',
                     'Aviso',mtWarning,[mbOk],0);
              Repaint;
              cdsImoveis.Cancel;
              Exit;
            end else iErro := -91; // Marca o documento para liberação
          end;
        end;
      end else begin
// Daniel - 24085 - Fim --------------------------------------------------------

        // Verifica se o Imóvel está ativo
        if (MS_<>dtmMS.MS_ImovelAtivo) then begin
          if ( (MS_<>dtmMS.MS_Imovel) and (MS_.ValoresChave[6]<>'1') ) or (MS_=dtmMS.MS_Imovel) then begin
            if not (ModuloImobiliario.AdminImob.bFlgLancPagInativo) then begin
              Screen.Cursor := crDefault;
              MsgDlg('O Imóvel escolhido não está ativo! Não é possível atribuir-lhe uma despesa.','Aviso',mtWarning,[mbOk],0);
              Repaint;
              cdsImoveis.Cancel;
              Exit;
            end else begin
              // Marca o documento para liberação
              iErro := -91;
            end;
          end;
        end;
      end; // Fim 24085
      cdsImoveis.Post;
    end;
    Screen.Cursor := crDefault;
  end else begin
    // cancela a inserção na query
    cdsImoveis.Cancel;
  end;
end;

procedure TfrmExecLancMultDespMT.btnExcluiClick(Sender: TObject);
var fTotalRateio : currency;
begin
   if not (cdsImoveis.isEmpty) then begin
      inherited;
      cdsImoveis.Delete;
      if not(cdsImoveis.isEmpty) then begin
         TotalizaRateio( fTotalRateio );
      end else begin
         edtVlrTotal.Value  := 0;
         edtTotalLanc.Value := 0;
      end;
   end;
end;

procedure TfrmExecLancMultDespMT.btnTotalizaClick(Sender: TObject);
var fTotalRateio : currency;
begin
  inherited;
  TotalizaRateio( fTotalRateio );
end;


procedure TfrmExecLancMultDespMT.rdgAcreDescClick(Sender: TObject);
begin
  inherited;
  AbreTipoAlterador;
end;


procedure TfrmExecLancMultDespMT.molFornecedor1btnBuscaFornClick(Sender: TObject);
begin
  inherited;
  molFornecedor1.btnBuscaFornClick(Sender);
  VerificaContaBancaria;
  //Higor Nayde SOL 188854 Kintana 1784331
  if (CtrlAvaliacaoFornec.VerificaQualificacao(molFornecedor1.iFornecedor))then begin
     MsgDlg('Este fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
  end;
 //Higor Nayde SOL 188854 Kintana 1784331
end;

procedure TfrmExecLancMultDespMT.bbtnInsereAlteradorClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimentoAlterador then begin
     cdsAlterador.Insert;
     cdsAlteradorCODALTERADOR.AsInteger := cdsAlteradorXTipoImovelCODALTERADOR.AsInteger;
     cdsAlteradorIDDOCUMENTO.AsInteger  := iDocumento;
     cdsAlteradorVLRALTERADOR.AsFloat   := StrToFloat(edtValor.Text);
     cdsAlteradorDESCRICAO.AsString     := DBcboAlterador.Text;
     // Vinícius - 01/10/2004 - Pendência 17787
     cdsAlteradorOBSERVACAO.AsString    := edtObsAlt.Text;
     // Marcio Motta - 13/02/2004 - Pendência 16082
     cdsAlteradorCODTIPIMOVEL.AsString  := cdsAlteradorXTipoImovelCODTIPIMOVEL.AsString;
     //------- Fim Implementação/Alteração - Marcio Motta -------------------------------
     //Marcio Sanches Spinosa SOL 222296 KINTANA 2055368 - Inicio
     if (rdgAcreDesc.ItemIndex = 0) then
       cdsAlteradorACRESDECRES.AsString := 'C'
     else
       cdsAlteradorACRESDECRES.AsString := 'D';
     //Marcio Sanches Spinosa SOL 222296 KINTANA 2055368 - Fim

     cdsAlteradorFLGLANCANFS.AsString := cdsAlteradorXTipoImovelFLGLANCANFS.AsString;

     //Cássio Rovaroto - SIG nº 115585 - Início
     if (dbLkpTipoServico.LookupValue = '') then
      cdsAlteradorIDTIPOSERVICO.AsInteger := -1
     else
      cdsAlteradorIDTIPOSERVICO.AsInteger := cdsTipoServico.FieldByName('IDTIPOSERVICO').AsInteger;

     if (dbLkpProcessos.LookupValue = '') then
      cdsAlteradorIDPROCESSO.asInteger := -1
     else
      cdsAlteradorIDPROCESSO.asInteger := cdsProcessos.FieldByName('IDPROCESSO').asInteger;

     cdsAlteradorVALOREBASERETENCAO.AsFloat := edtValorBase.Value;
     //Cássio Rovaroto - SIG nº 115585 - Fim

     cdsAlteradorDATALANCTO.AsDateTime := edtDataLanc.Date;

     cdsAlterador.Post;

     //Cássio Rovaroto - SIG nº 89101 - Início
     if not (bIndicaNFS) and (cdsAlteradorFLGLANCANFS.AsString = 'S') then
     begin
      bIndicaNFS := True;
      btnConfirmar.Enabled := False;
      btnContinuar.Enabled := True;
      MsgDlg('A inclusão desse alterador obriga a inserção de informações ' + #13#10 + ' da Nota Fiscal, a partir da próxima etapa.', 'Aviso', mtInformation, [mbOK], 0);
      if not bRegNFS then
        ExibeAbaNFS;
      pgcLancamentos.ActivePageIndex := 2;
     end;
     //Cássio Rovaroto - SIG nº 89101 - Fim

    //Cássio Rovaroto - SIG nº 115585 - Início
    DBcboAlterador.LookupValue := '';
    edtValor.Text := EmptyStr;
    edtObsAlt.Text := EmptyStr;
    rdgAcreDesc.ItemIndex := 0;
    lblTipoServico.Visible := False;
    dbLkpTipoServico.Visible:= False;
    dbLkpTipoServico.LookupValue := '';
    lblProcesso.Visible := False;
    dbLkpProcessos.Visible := False;
    dbLkpProcessos.LookupValue := '';
    lblValorBase.Visible := False;
    edtValorBase.Visible := False;
    edtValorBase.Text := EmptyStr;
    pnlAlteradoresGerados.Top := 136;
    rdgAcreDescClick(Self);
    //Cássio Rovaroto - SIG nº 115585 - Fim
  end;
end;

procedure TfrmExecLancMultDespMT.btnExcluiAlteradorClick(Sender: TObject);
var
  bComNFS: boolean;
begin
  inherited;
  //Cássio Rovaroto - SIG nº 89101 - Início
  bComNFS := False;

  //if not cdsAlterador.IsEmpty then cdsAlterador.Delete;
  if not cdsAlterador.IsEmpty then
  begin
    cdsAlterador.Delete;

    cdsAlterador.First;

    while not cdsAlterador.Eof do
    begin
      if cdsAlteradorFLGLANCANFS.AsString = 'S' then
      begin
        bComNFS := True;
        bIndicaNFS := False;
        btnConfirmar.Enabled := False;
        btnContinuar.Enabled := True;
        Break;
      end;
      cdsAlterador.Next;
    end;

    if not bComNFS then
    begin
      bIndicaNFS := False;
      btnConfirmar.Enabled := True;
      btnContinuar.Enabled := False;
    end;
    cdsAlterador.First;
  end;
  //Cássio Rovaroto - SIG nº 89101 - Fim

  //Cássio Rovaroto - SIG nº 115585 - Início
  DBcboAlterador.LookupValue := '';
  edtValor.Text := EmptyStr;
  edtObsAlt.Text := EmptyStr;
  rdgAcreDesc.ItemIndex := 0;
  lblTipoServico.Visible := False;
  dbLkpTipoServico.Visible:= False;
  lblProcesso.Visible := False;
  dbLkpProcessos.Visible := False;
  lblValorBase.Visible := False;
  edtValorBase.Visible := False;
  pnlAlteradoresGerados.Top := 136;
  //Cássio Rovaroto - SIG nº 115585 - Fim
end;

procedure TfrmExecLancMultDespMT.DBcboFormaRecPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  VerificaContaBancaria;
end;

procedure TfrmExecLancMultDespMT.btnConfirmarClick(Sender: TObject);
var sMsg: string;
    iIdFormaRecPag, iIdCtaBanco : Integer;
    dIniCtbDiaria, dFimCtbDiaria : TDateTime;
    iCodErroLiberacao : Integer;
    vdocumento, vidforcli, vnodocumento : integer; //Higor Nayde SOL 188854 Kintana 1784331
begin
//Higor Nayde SOL 188854 Kintana 1784331
 //  if CtrlAvaliacaoFornec.FornecPassivo(molFornecedor1.iFornecedor) then
 //    FazerAvaliacao;
   vidforcli := molFornecedor1.iFornecedor;
   vnodocumento:= StrToInt(edtNumDocumento.Text);
   if flgavaliafornec then begin
     if CtrlAvaliacaoFornec.FornecPassivo(molFornecedor1.iFornecedor) then begin
       FazerAvaliacao;
     end;
   end;
//Higor Nayde SOL 188854 Kintana 1784331
   // Limpa o mol de orçamento caso o valor seja excluído manualmente do campo
   if (molOrcamento1.edtCompOrc.Value <= 0) then molOrcamento1.Clear;

   // Busca ID da reserva de orçamento caso tenha sido digitado, ao invés de buscar no MontaSelect
   if (molOrcamento1.edtCompOrc.Value > 0) and (molOrcamento1.iIdCompromisso < 0) then begin
      molOrcamento1.iIdCompromisso := CtrlOrcamento.BuscaIdNumReserva(0, StrToInt(FloatToStr(molOrcamento1.edtCompOrc.Value)), True);
   end;

   // Guarda o codigo de erro de liberação de responsabilidade para gravar o motivo da conciliação
   iCodErroLiberacao := CtrlLancImovel.CodigoErroLiberacao;

   btnConfirmar.Enabled := False;
   memErro.Text := '';

   //Cássio Rovaroto - SIG nº 89101 - Início
   //if bIndicaNFS then
   //begin
   //  if not ContinuaPagNfs  then
   //   Exit;
   //end;
   //Cássio Rovaroto - SIG nº 89101 - Fim

   try
      // Inicializa campos opcionais
      iIdFormaRecPag := -1;
      iIdCtaBanco    := -1;
      dIniCtbDiaria  := -1;
      dFimCtbDiaria  := -1;

      if DBcboFormaRecPag.LookupValue <> '' then
        iIdFormaRecPag := StrToInt(DBcboFormaRecPag.LookupValue);
      if dbCboContaBancaria.Value <> '' then
        iIdCtaBanco := StrToInt(dbCboContaBancaria.LookupValue);
      if (length(trim(edtDtinictbdiaria.Text)) > 0) then
        dIniCtbDiaria := edtDtinictbdiaria.Date;
      if (length(trim(edtDtfimctbdiaria.Text)) > 0) then
        dFimCtbDiaria := edtDtfimctbdiaria.Date;

      // Grava o registro na LancamentosImovel
      CtrlLancImovel.pisMultiplaDespesa := True;//Marcio Sanches Spinosa SOL 222296 KINTANA 2055368
      if not CtrlLancImovel.Inserir(cboMes.ItemIndex + 1,
                                    word(trunc(DBspnAno.Value)),
                                    molFornecedor1.iFornecedor,
                                    StrToInt(DBcboTipoRecDes.LookupValue),
                                    iIdFormaRecPag,
                                    -1, // Daniel - 24872
                                    molOrcamento1.iIdCompromisso,
                                    iIdCtaBanco,
                                    Modulo.iMoedaCorrente,
                                    iDocumento,
                                    -1,
                                    StrToFloat(edtNumDocumento.Text),
                                    edtVlrTotal.Value,
                                    edtVlrTotal.Value,
                                    'M',     // M = Lançamentos Múltiplos
                                    'P',     // p = Contas a Pagar
                                    edtReferenciaAP.Text,
                                    memObs.Text,
                                    DBcboCentroCusto.LookupValue,
                                    edtHistLanc.Text, // Daniel - 22993
                                    edtDataVenc.Date,
                                    edtDataLanc.Date,
                                    dIniCtbDiaria,
                                    dFimCtbDiaria,
                                    cdsImoveis.Data,
                                    cdsAlterador.Data,
                                    chkIntegra.Checked,
                                    TRUE, 0,                            // Edilaine - SOL 1077772-5681 / KTN 1358973
                                    molContrato1.iContrato > 0,          // Edilaine - SOL 1077772-5681 / KTN 1358973
                                    {Início - Michelle Mota - SIG26054}
                                    iIdVoto,
                                    iff(chkLancaVoto.Checked, 'S', 'N')
                                    {Término - Michelle Mota - SIG26054}
                                    //Cássio Rovaroto - SIG nº23656.59199 - Início
                                    , edtNFSNumero.Text,
                                    edtNFSSerie.Text,
                                    dtpNFSDataEmissao.Date,
                                    mmNFSObs.Text,
                                    _IdServico
                                    ) then
        raise exception.Create( '' );

      if (chkLancaVoto.Checked) then begin //William Moreira da Silva - SIG 26054
         //Darivaldo Alencar SIG26054 -Inicio
           if not CtrlDocumentoXVoto.Inserir(iIdVoto,
                                             iDocumento,
                                             dtmBaseDados.dbBaseDados.InTransaction) then
              raise exception.Create( '' );
         //Darivaldo Alencar SIG26054 -Fim
      end;

      CtrlLancImovel.pisMultiplaDespesa := False;//Marcio Sanches Spinosa SOL 222296 KINTANA 2055368
      // Grava o Motivo de Conciliação para a liberação de responsabilidade
      if iCodErroLiberacao > 0 then begin
         // Excluir o motivo que possa ter sido incluido anteriormente
         CalcDocumento.ApagarMotivoConciliacao(iDocumento, -1, 'L');
         // Inserir o motivo da liberação
         CalcDocumento.GravarMotivoConciliacao(iDocumento, -1, Sistema.IdUsuario, -1, -1,
                                               Null, Null, sMotivoRespon, 'L');
      end;

      if (length(trim(memErro.Text)) = 0) then begin

         Screen.Cursor := crDefault;
         if MsgDlg('Lançamento concluído. Deseja imprimir para conferência?', 'Pergunta', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
             TdtmRelLancamento.PrintRelLancamento(iDocumento, -1, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
                                                  Sistema.IdModulo, '', '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo,
                                                  sMsg, nil, cntBDE, rdtScreen, true, true, true, false, nil, false);
         Repaint;

         // gera o numero do próximo documento para contabilidade e contas a pagar
         iDocumento           := Documento.GetCodigo(dtmImobiliario.qryAux);
         edtNumDocumento.Text := FormatFloat('#0', iDocumento);

         // Limpa o frame de Orçamento
         molOrcamento1.Clear;
         // Limpa Cds de Alteradores
   		 cdsAlterador.Data := CtrlLancImovel.LookupAlteradoresDocum(-2);

         // Retorna a pagina inicial
         IrParaPagina(0);
      end;
    //Higor Nayde SOL 188854 Kintana 1784331
      if flgavaliafornec then begin
          vdocumento := CtrlAvaliacaoFornec.BuscaDocumento(vnodocumento,vidforcli);
          if(vdocumento <> 0) then begin
            CtrlAvaliacaoFornec.AtualizaAvaliacao(vnodocumento, vdocumento,
            strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(vidforcli)),vidforcli);
          end;
      end
      else
      begin
          ivdocumento := CtrlAvaliacaoFornec.BuscaDocumento(ivnodocumento,ividforcli);
          if(ivdocumento <> 0) then begin
            CtrlAvaliacaoFornec.AtualizaAvaliacao(ivnodocumento, ivdocumento,
            strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(ividforcli)),ividforcli);
          end;
      end;
      flgavaliafornec:= true;
   //Higor Nayde SOL 188854 Kintana 1784331
except
      on e : Exception do begin
        if Length(e.message) > 0 then
           MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);

        // Busca a liberação da responsabilidade pelo lançamento
        if (CtrlLancImovel.CodigoErroLiberacao <> 0) then begin
           if MsgDlg('Libera a responsabilidade pela Despesa ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
              sMotivoRespon := '';
              if InputQuery('Justificativa para Liberação', 'Motivo', sMotivoRespon) then begin
                 CtrlLancImovel.CodigoErroLiberacao := Abs(CtrlLancImovel.CodigoErroLiberacao);
                 // Higor Nayde SOL 188854 Kintana 1784331 - início
                flgavaliafornec:= false;

                 ivnodocumento:= vnodocumento;
                 ivdocumento  := vdocumento;
                 ividforcli   := vidforcli;
                 //Higor Nayde SOL 188854 Kintana 1784331  - Fim
                 btnConfirmarClick( Self );
              end else begin
                 IrParaPagina(1);
                 pgcLancamentos.ActivePage := tbsLancamentos;
                 Repaint;
              end;
           end else begin
              IrParaPagina(1);
              pgcLancamentos.ActivePage := tbsLancamentos;
              Repaint;
           end;
        end else begin
           IrParaPagina(1);
           pgcLancamentos.ActivePage := tbsLancamentos;
           Repaint;
        end;
      end;
   end;
end;


procedure TfrmExecLancMultDespMT.CalculaDataCtbDiaria;
var iAnoLancContab, iMesLancContab, iDiaLancContab : word;
begin
// Marcio Motta - 18/02/2004 - Pendência: 16112
// Alterado para pegar a data de Lançamento contábil ao invés da data de Competência

  // para a data de lancamento contabil
  if ModuloImobiliario.AdminImob.bFlgDiario then
    begin
      // Se Tipo de Despesa e Período de Competência estiverem preenchidos
      if (DBcboTipoRecDes.Text <> '') and (cboMes.Text <> '') and (DbspnAno.Value > 0) then
        begin
          // Decodifica a data de Lançamento contábil
          DecodeDate(edtDataLanc.DateTime,iAnoLancContab,iMesLancContab,iDiaLancContab);

          // Se período de contabilização diária for MENSAL
          if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'M' then
            begin
              // Habilita os Edits das Datas
              edtDtinictbdiaria.Enabled := True;
              edtDtfimctbdiaria.Enabled := True;
              // Atribui a Data Inicial o primeiro dia do Mês ref. Lançamento contábil
              edtDtinictbdiaria.Date    := EncodeDate(iAnoLancContab,iMesLancContab,1);
              // Atribui a Data Final o último dia do Mês ref. Lançamento contábil
              edtDtfimctbdiaria.Date    := DiasUteis.UltDiaMes(iAnoLancContab,iMesLancContab);
            end
          else
            // Se período de contabilização diária for NÃO MENSAL
            if cdsDespesa.FieldByName('FLGDIARIO').AsString = 'A' then
              begin
                // Habilita os Edits das Datas
                edtDtinictbdiaria.Enabled := True;
                edtDtfimctbdiaria.Enabled := True;
                // Atribui a Data Inicial o primeiro dia do Ano ref. Lançamento contábil
                edtDtinictbdiaria.Date    := EncodeDate(iAnoLancContab,1,1);
                // Atribui a Data Final o último dia do Ano ref. Lançamento contábil
                edtDtfimctbdiaria.Date    := EncodeDate(iAnoLancContab,12,31);
              end
            else
              begin
                // Se período de Contabilização diária não estiver definido
                // Desabilita os Edits das datas
                edtDtinictbdiaria.Enabled := False;
                edtDtfimctbdiaria.Enabled := False;
                // Limpa o Conteúdo dos Edits das Datas
                edtDtinictbdiaria.Clear;
                edtDtfimctbdiaria.Clear;
              end;
        end
     else
        begin
           // Apaga as datas INICIAL e FINAL de Contabilização DIÁRIA
           edtDtinictbdiaria.Clear;
           edtDtfimctbdiaria.Clear;
        end;
    end;
end;

procedure TfrmExecLancMultDespMT.DBcboTipoRecDesCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CalculaDataCtbDiaria;
  
   //Cássio Rovaroto - SIG nº 103856 - Início
  if cdsDespesa.FieldByName('FLGRECCUSTCONTRATO').AsInteger = 1 then
  begin
    chkContrato.Checked := True;
    chkContrato.Enabled := False;

    if DBcboGrupo.LookupValue <> EmptyStr then
    begin
      MsgDlg('Este tipo despesa é restrito a contratos registrados.', 'Aviso', mtWarning, [mbOK], 0);
      DBcboGrupo.LookupValue := EmptyStr;
    end;
    DBcboGrupo.Enabled := False;
  end
  else
  begin
    chkContrato.Enabled := True;
    DBcboGrupo.Enabled := True;
  end;
  //Cássio Rovaroto - SIG nº 1038561 - Fim
end;

function TfrmExecLancMultDespMT.BuscaContratoImovel(const iIdImovel: Integer): Boolean;
var
  fSoma        : Double;
  sSql         : String;
  iAno,iMes    : word;
  dDtComp      : TDateTime;

  sCompetencia : String;
begin
   Result := False;

   sSql := 'SELECT C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, '+#13+
           '       ( C.CONNUMERO || '' - '' || C.CONNOME ) AS CONTRATO_EXTENSO '+#13+
           '      ,CXI.CIMPERCENTRATEIO        ' + #13 +
           'FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI     '+#13+
           'WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+#13+
           '  AND C.FLGTIPOCONTRATO = ''L'' '+#13+
           '  AND CXI.IDIMOVEL = ' + IntToStr( iIdImovel );

// Daniel Simões - 13/02/2006 - Início -----------------------------------------
   iAno         := Word(trunc(DBspnAno.Value));
   iMes         := cboMes.ItemIndex+1;
   dDtComp      := EncodeDate(iAno,iMes,01);
   sCompetencia := IntToStr(iAno)+FormatFloat('00',(iMes));

// Daniel - 24577 - Início -----------------------------------------------------
   sSql := sSql + '  AND ( (CXI.CIMDTFIM IS NOT NULL AND '+QuotedStr(sCompetencia)+
                  ' BETWEEN TO_CHAR(CXI.CIMDTINI,''YYYYMM'') AND TO_CHAR(CXI.CIMDTFIM,''YYYYMM'') ) OR (CXI.CIMDTFIM IS NULL AND '+QuotedStr(sCompetencia)+
                  ' >= TO_CHAR(CXI.CIMDTINI,''YYYYMM'') ) ) ';
// Daniel - 24577 - Fim --------------------------------------------------------

// Daniel Simões - 13/02/2006 - Fim --------------------------------------------

    // se a query acima voltar mais de uma linha, permitir selecionar o contrato:
    // colocar o resultado da query acima no CDS
    // se a soma do percentual de rateio dos contratos vigentes for inferior a 100%, criar um registro virtual
    // na combo para seleção com idcontrato = -1 e descrição = 'Area Vaga'
    // só preencher o cdsImovel abaixo caso o idcontrato selecionado > 0

   if FazQuery( dtmImobiliario.qryAux, sSql ) then begin
     // Se a query retornar mais de um registro, abrir a combo
     if ( dtmImobiliario.qryAux.RecordCount > 1 ) then begin

        frmPrincipal.Enabled   := False;
        twSelecionaContrato.Show;
        twSelecionaContrato.Top     := round( ( frmPrincipal.Height - twSelecionaContrato.Height ) / 2 );
        twSelecionaContrato.Left    := round( ( frmPrincipal.Width  - twSelecionaContrato.Width  ) / 2 );

        dspBuscaContrato.DataSet    := dtmImobiliario.qryAux;
        // Passa o conteúdo da Query para o Cds...
        cdsContrato.Data            := dspBuscaContrato.Data;

        with cdsContrato do begin
           First;
           while not Eof do begin
              fSoma := fSoma + cdsContratoCIMPERCENTRATEIO.AsFloat;
              Next;
           end;

           // Se a soma do rateio não chegar a 100%, criar um novo registro com
           // a descrição "área vaga" para preencher a diferença...
           if ( fSoma < 100 ) then begin
              cdsContrato.Insert;
              cdsContratoIDCONTRATOIMOVEL.AsInteger := -1;
              cdsContratoCONNOME.AsString           := 'ÁREA VAGA';
              cdsContratoCIMPERCENTRATEIO.AsFloat   := 100-fSoma;
              cdsContrato.Post;
           end;
        end;

     end else begin
        with dtmImobiliario.qryAux do begin
           if not IsEmpty then begin

              if ( molContrato1.iContrato<=0 ) then           // Edilaine - SOL 1077772-5681 / KTN 1358973
                 cdsImoveis.FieldbyName('IDCONTRATOIMOVEL').AsInteger := -1   // Edilaine - SOL 1077772-5681 / KTN 1358973
              else
              cdsImoveis.FieldbyName('IDCONTRATOIMOVEL').AsInteger := FieldByName('IDCONTRATOIMOVEL').AsInteger;
              cdsImoveis.FieldbyName('CONNUMERO').AsString         := FieldByName('CONNUMERO').AsString;
              cdsImoveis.FieldbyName('CONNOME').AsString           := FieldByName('CONNOME').AsString;
              cdsImoveis.FieldbyName('CONTRATO_EXTENSO').AsString  := FieldByName('CONTRATO_EXTENSO').AsString;
              Result := True;
           end;
        end;
     end;
   end;
end;


procedure TfrmExecLancMultDespMT.edtDataLancChange(Sender: TObject);
begin
  inherited;
  CalculaDataCtbDiaria;
end;

// Daniel Simões - 06/03/2006 - Início -----------------------------------------
procedure TfrmExecLancMultDespMT.btnOkClick(Sender: TObject);
var cdsTemp   : TCMClientDataSet;
    iIdImovel : Integer;
begin
  inherited;
  try
     cdsTemp      := TCMClientDataSet.Create( nil );
     cdsTemp.Data := cdsImoveis.Data;

     iIdImovel    := cdsImoveis.FieldbyName('IDIMOVEL').AsInteger;

     if ( wwDBLComboSelContrato.Text = '' ) then
       MsgDlg('Selecione um contrato.','Aviso',mtWarning,[mbOk],0)
     else begin
       if ( chkContrato.Checked ) and ( cdsContrato.FieldbyName('IDCONTRATOIMOVEL').AsInteger=-1 ) then
         MsgDlg('Selecione um contrato válido.','Aviso',mtWarning,[mbOk],0)
       else begin
         if ( cdsTemp.Locate('IDCONTRATOIMOVEL;IDIMOVEL',
              VarArrayOf([cdsContrato.FieldbyName('IDCONTRATOIMOVEL').AsInteger,iIdImovel]),[]) ) then
           MsgDlg('Este contrato já foi selecionado.','Aviso',mtWarning,[mbOk],0)
         else begin
           with cdsContrato do begin
             if not IsEmpty then begin
               cdsImoveis.Edit;
               cdsImoveis.FieldbyName('IDCONTRATOIMOVEL').AsInteger := FieldByName('IDCONTRATOIMOVEL').AsInteger;
               cdsImoveis.FieldbyName('CONNUMERO').AsString         := FieldByName('CONNUMERO').AsString;
               cdsImoveis.FieldbyName('CONNOME').AsString           := FieldByName('CONNOME').AsString;
               cdsImoveis.FieldbyName('CONTRATO_EXTENSO').AsString  := FieldByName('CONTRATO_EXTENSO').AsString;
               cdsImoveis.FieldbyName('RATEIO_CONTRATO').AsFloat    := FieldByName('CIMPERCENTRATEIO').AsFloat;
               cdsImoveis.Post;
             end;
           end;
           frmPrincipal.Enabled   := True;
           twSelecionaContrato.Hide;
         end;
       end;
     end;
   finally
     FreeAndNil( cdsTemp );
   end;

end;

procedure TfrmExecLancMultDespMT.btnCancelClick(Sender: TObject);
begin
  inherited;
  DBgrdLancamentos.Enabled    := True;
  frmPrincipal.Enabled   := True;
  twSelecionaContrato.Hide;

  btnExcluiClick(Sender);
end;
// Daniel Simões - 06/03/2006 - Fim --------------------------------------------
procedure TfrmExecLancMultDespMT.AbrirAvaliacao;
var
  frmCadForneAvalia: TfrmCadForne;
begin
    Application.CreateForm(TFrmCadForne, frmCadForneAvalia);
    if frmCadForneAvalia.FormStyle <> fsNormal then
    begin
      frmCadForneAvalia.FormStyle := fsNormal;
      frmCadForneAvalia.Visible := False;
    end;

    frmCadForneAvalia.nConsModulo:= 4;
    frmCadForneAvalia.nIdPessoa:= molFornecedor1.iFornecedor;
    frmCadForneAvalia.DtEmissao:= edtDataLanc.Date;
    frmCadForneAvalia.WindowState:= wsMaximized;


    frmCadForneAvalia.ShowModal;
    frmCadForneAvalia.Release;
end;

procedure TfrmExecLancMultDespMT.FazerAvaliacao;
begin
  if CtrlAvaliacaoFornec.AvaliaFornec('' , cdsDespesa.FieldByName('IDTIPOCUSTORECIMO').AsInteger) then
    JustificarFornec;
end;

procedure TfrmExecLancMultDespMT.JustificarFornec;
begin
   if not CtrlAvaliacaoFornec.TrazMesAtual(molFornecedor1.iFornecedor, edtDataLanc.Date) then
   begin
     Application.MessageBox('Para a criação da AP é necessário realizar a avaliação do fornecedor', Pchar(ExtractFileName(Application.Title)), MB_ICONINFORMATION);
     AbrirAvaliacao;
   end else
   begin
     if MessageDlg('Deseja avaliar o Fornecedor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       AbrirAvaliacao
     else
     begin
      Application.CreateForm(TfrmJustificativa, frmJustificativa);
      frmJustificativa.pIdPessoa:= molFornecedor1.iFornecedor;
      frmJustificativa.ShowModal;
     end;
   end;

end;

// Edilaine - SOL 107772/5681 / KTN 1358973
procedure TfrmExecLancMultDespMT.DBcboGrupoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if DBcboGrupo.Text <> '' then begin
      molContrato1.edtContrato.Enabled := False;
      molContrato1.btnBuscaContrato.Enabled := False;
      molContrato1.edtContrato.Clear;
   end;
end;
// Edilaine - SOL 107772/5681 / KTN 1358973 - fim

// Edilaine - SOL 107772/5681 / KTN 1358973 
procedure TfrmExecLancMultDespMT.DBcboGrupoExit(Sender: TObject);
begin
  inherited;
   if DBcboGrupo.Text = '' then begin
      molContrato1.edtContrato.Enabled := true;
      molContrato1.btnBuscaContrato.Enabled := true;
      molContrato1.edtContrato.Clear;
   end;
end;
// Edilaine - SOL 107772/5681 / KTN 1358973 - fim

// Edilaine - SOL 107772/5681 / KTN 1358973
procedure TfrmExecLancMultDespMT.molContrato1edtContratoChange(
  Sender: TObject);
begin
  inherited;
   if molContrato1.edtContrato.Text <> '' then begin
      DBcboGrupo.Enabled := false;
      DBcboGrupo.Clear;
   end;
end;
// Edilaine - SOL 107772/5681 / KTN 1358973 - fim

// Edilaine - SOL 107772/5681 / KTN 1358973
procedure TfrmExecLancMultDespMT.molContrato1edtContratoExit(
  Sender: TObject);
begin
  inherited;
   if molContrato1.edtContrato.Text = '' then begin
      DBcboGrupo.Enabled := true;
      DBcboGrupo.Clear;
   end;
end;
// Edilaine - SOL 107772/5681 / KTN 1358973 - fim


// Edilaine - SOL 107772/5681 / KTN 1358973
procedure TfrmExecLancMultDespMT.AtribuiPercentRateio;
var
   fAreaTotal: Extended;
   bFracaoIdeal: Boolean;  // a FCRT rateia suas despesas por aqui
begin
   cdsImoveis.First;

   // usar a area ideal como grupo para o lançamento da receitas por contrado
   bFracaoIdeal := false;
   fAreaTotal := 0;
   while not cdsImoveis.Eof do begin
      fAreaTotal := fAreaTotal + cdsImoveis.FieldByName('IMOAREA').AsFloat;
      cdsImoveis.Next;
   end;

   // se a area ideal não for preenchida usar a fração ideal
   if fAreaTotal = 0 then begin
      bFracaoIdeal := true;
      cdsImoveis.First;
      while not cdsImoveis.Eof do begin
         fAreaTotal := fAreaTotal + cdsImoveis.FieldByName('IMOFRACAOIDEAL').AsFloat;
         cdsImoveis.Next;
      end;
   end;

   cdsImoveis.First;
   while not cdsImoveis.Eof do begin
      if bFracaoIdeal then begin
         if cdsImoveis.FieldByName('IMOFRACAOIDEAL').AsFloat <> 0 then begin
            cdsImoveis.Edit;
            cdsImoveis.FieldByName('GXIPERCENTRATEIO').AsFloat := cdsImoveis.FieldByName('IMOFRACAOIDEAL').AsFloat / fAreaTotal * 100;
            cdsImoveis.Post;
         end;
      end else begin
         if cdsImoveis.FieldByName('IMOAREA').AsFloat <> 0 then begin
            cdsImoveis.Edit;
            cdsImoveis.FieldByName('GXIPERCENTRATEIO').AsFloat := cdsImoveis.FieldByName('IMOAREA').AsFloat / fAreaTotal * 100;
            cdsImoveis.Post;
         end;
      end;
      cdsImoveis.Next;
   end;

   cdsImoveis.First;
end;
// Edilaine - SOL 107772/5681 / KTN 1358973 - fim


// edilaine - SOL 256577 / PPM 843368 - inicio
procedure TfrmExecLancMultDespMT.CalculaPercentualRateio;
begin
   cdsImoveis.First;
   while not cdsImoveis.Eof do begin
      {calcula o percentual de rateio pelo valor do aluguel do imovel sobre o valor total do contrato}
      cdsImoveis.Edit;

      //Darivaldo Alencar SIG73197 -Inicio
      //cdsImoveis.FieldByName('GXIPERCENTRATEIO').AsFloat := cdsImoveis.FieldByName('cimvlrajustado').AsFloat /
      //                                                      cdsImoveis.FieldByName('convlrajustado').AsFloat * 100
      If(cdsImoveis.FieldByName('CONVLRAJUSTADO').AsFloat <> 0) then
         cdsImoveis.FieldByName('GXIPERCENTRATEIO').AsFloat := cdsImoveis.FieldByName('CIMVLRAJUSTADO').AsFloat /
                                                               cdsImoveis.FieldByName('CONVLRAJUSTADO').AsFloat * 100
      else
         cdsImoveis.FieldByName('GXIPERCENTRATEIO').AsFloat:= 0;
      //Darivaldo Alencar SIG73197 -Fim

      cdsImoveis.Post;

      cdsImoveis.Next;
   end;

   cdsImoveis.First;
end;
// edilaine - SOL 256577 / PPM 843368 - fim


//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Inicio
function TfrmExecLancMultDespMT.EfetuarRateioZerado(pValorResto: Extended;
  pCds: TCMClientDataSet): Extended;
var i, pRecCount : integer;
    pCountMaiorZero : integer;
    ValorConvert : string;
    iValorRateio : integer;    // edilaine - SOL 247935 / KTN 662587
begin

  // edilaine - SOL 247935 / KTN 662587 - inicio
  pValorResto  := ComunsImobiliario.Arredonda(pValorResto,2);
  iValorRateio := ExtraiDecimalParaInteiros(pValorResto);
  // edilaine - SOL 247935 / KTN 662587 - fim


  //Verifica se o valorResto > 0 e se existe zerados
    pCds.First;
    for i := 0 to pCds.RecordCount - 1 do
    begin
      // edilaine - SOL 247935 / KTN 662587 - inicio
      //if (StrToFloat(FloatToStr(pValorResto)) > 0) then // Verifica se ainda existe Resto
      if (iValorRateio > 0) then
      begin
        pCds.Edit;
        pCds.FieldByName('VLRIMOVEL').Value := pCds.FieldByName('VLRIMOVEL').Value + 0.01;

        iValorRateio := iValorRateio - 1;
        {if (StrToFloat(FloatToStr(pValorResto)) > 0.01) then
          pValorResto := StrToFloat(FloatToStr(pValorResto)) - 0.01
        else
          pValorResto := 0; }

        pCds.Post;

        pCds.Next;

        //if (pCds.eof) and (StrToFloat(FloatToStr(pValorResto)) > 0) then
        if (pCds.eof) and (iValorRateio > 0) then
          pCds.First;
        // edilaine - SOL 247935 / KTN 662587 - fim

      end
      else
        Break;
    end;

    //Procura no pCds se existe algum registro ainda zerado
    pCds.Filtered       := False;
    pCds.Filter         := 'VLRIMOVEL = 0';
    pCds.Filtered       := True;

    //Verifica se a consulta retorna valor
    if (pCds.RecordCount > 0) then
    begin

      //Ordena o cdsImoveis pelos valores do maior para o menor
      cdsImoveis.Filtered       := False;
      cdsImoveis.Filter         := 'VLRIMOVEL > 0 ';
      cdsImoveis.Filtered       := True;

      cdsImoveis.IndexFieldNames := 'VLRIMOVEL';
      cdsImoveis.IndexDefs.AddIndexDef.Options := [ixDescending];

      pCds.First;
      cdsImoveis.Last;
      
      while not pCds.Eof do
      begin
        if ((StrToFloat(cdsImoveis.FieldbyName('VLRIMOVEL').AsString) - 0.01) >= 0.01) then
        begin
          //Retira 1 centavo do maior valor
          cdsImoveis.Edit;
          cdsImoveis.FieldbyName('VLRIMOVEL').Value := cdsImoveis.FieldbyName('VLRIMOVEL').Value - 0.01;
          cdsImoveis.Post;

          pRecCount := pCds.RecordCount;

          pCds.Edit;
          pCds.FieldByName('VLRIMOVEL').Value := pCds.FieldByName('VLRIMOVEL').Value + 0.01;
          pCds.Post;
           
        end;

        if (cdsImoveis.Bof) and not (pCds.Eof) then
        begin
          pCountMaiorZero := 0;
          cdsImoveis.First;
          while not cdsImoveis.Eof do
          begin
            if (cdsImoveis.FieldByName('VLRIMOVEL').AsCurrency > 0.01) then
               pCountMaiorZero := pCountMaiorZero + 1;
            cdsImoveis.Next;
          end;

          cdsImoveis.Last;
          if ((pCountMaiorZero = 0) and (pCds.RecordCount <> pRecCount) ) then
            Break;
        end
        else
          cdsImoveis.Prior;
      end;
    end;

    //Seleciona os valores que estavam zerados e procura no CdsImoveis para atualiza-los
    pCds.Filtered       := False;
    pCds.Filter         := 'VLRIMOVEL > 0';
    pCds.Filtered       := True;

    cdsImoveis.Filtered := False;
    cdsImoveis.IndexFieldNames := EmptyStr;
    cdsImoveis.IndexDefs.Clear;


    //Verifica se pCds Zerado retornou valor
    if (pCds.RecordCount > 0) then
    begin
      pCds.First; //Volta para o primeiro registro
      while not pCds.Eof do
      begin
        //Procura o registro do pCds dentro do CdsImoveis.
        cdsImoveis.Filtered := False;
        cdsImoveis.Filter   := ' IDIMOVEL = ' + pCds.FieldByName('IDIMOVEL').AsString;
        cdsImoveis.filtered := True;

        //Verifica se localizou o registro e atualiza o valor do mesmo dentro do cdsImoveis.
        if (cdsImoveis.RecordCount > 0) then
        begin
          cdsImoveis.Edit;
          cdsImoveis.FieldbyName('VLRIMOVEL').Value := pCds.fieldByName('VLRIMOVEL').AsCurrency;
          cdsImoveis.Post;
        end;

        pCds.Next;
      end;
    end;

    pCds.Filtered       := False;
    cdsImoveis.Filtered := False;

    cdsImoveis.IndexFieldNames := EmptyStr;
    cdsImoveis.IndexDefs.Clear;

    pValorResto := (iValorRateio / 100);  // edilaine - SOL 247935 / KTN 662587

    Result := pValorResto;

end;

function TfrmExecLancMultDespMT.EfetuarRateioMenorMaior(
  pValorRest: Extended): Extended;
var
  iValorRateio : integer;    // edilaine - SOL 247935 / KTN 662587
  iRestoVlrRateio, iVlrRateioUnit, iQtdeImovel: Integer;  //Darivaldo Alencar SIG73197
begin

  cdsImoveis.IndexFieldNames := 'VLRIMOVEL';

  // edilaine - SOL 247935 / KTN 662587 - inicio
  pValorRest   := ComunsImobiliario.Arredonda(pValorRest,2);
  iValorRateio := ExtraiDecimalParaInteiros(pValorRest);
  // edilaine - SOL 247935 / KTN 662587 - fim

  // edilaine - SOL 256577 / PPM 843368 - inicio
  if pValorRest > 0 then
  begin
    //Darivaldo Alencar SIG73197 -Inicio
    {Melhora de performance}
    //cdsImoveis.First;
    // edilaine - SOL 247935 / KTN 662587 - incio
    {while not (cdsImoveis.eof) and (StrToFloat(FloatToStr(pValorRest)) > 0) do }
    //while not (cdsImoveis.eof) and (iValorRateio > 0) do
    // begin
    //  cdsImoveis.Edit;
    //  cdsImoveis.FieldByName('VLRIMOVEL').Value := cdsImoveis.FieldByName('VLRIMOVEL').Value + 0.01;
    //  {pValorRest := StrToFloat(FloatToStr(pValorRest)) - 0.01;}
    //  iValorRateio := iValorRateio -1;
    //
    //  cdsImoveis.Post;
    //  cdsImoveis.Next;
    //
    //  {if (cdsImoveis.eof) and (StrToFloat(FloatToStr(pValorRest)) > 0) then }
    //  if (cdsImoveis.eof) and (iValorRateio > 0) then
    //     cdsImoveis.First;
    //
    // end;

    {somente para povoar a quantidade}
    if(cdsImoveis.RecordCount < 0) then
      begin
        iQtdeImovel:= 0;
        cdsImoveis.First;
        while not(cdsImoveis.Eof) do
           Inc(iQtdeImovel);
      end
    else iQtdeImovel:= cdsImoveis.RecordCount;

    iRestoVlrRateio:= (iValorRateio mod iQtdeImovel);

    {adiciona valores que veio do resto da divisão para somar em todos os imóveis}
    if (iRestoVlrRateio <> 0) then
        iValorRateio   :=  iValorRateio + (iQtdeImovel - iRestoVlrRateio);

    iVlrRateioUnit := (iValorRateio div iQtdeImovel);

    cdsImoveis.First;
    while not(CdsImoveis.eof) do
     begin
       cdsImoveis.Edit;
       cdsImoveis.FieldByName('VLRIMOVEL').Value := cdsImoveis.FieldByName('VLRIMOVEL').Value + (iVlrRateioUnit * 0.01);

       cdsImoveis.Post;
       cdsImoveis.Next;
     end;

     {Na versão anterior este valor era decrementado até zerar}
     iValorRateio:= 0;
   //Darivaldo Alencar SIG73197 -Fim
  end
  else
  begin
    cdsImoveis.Last;

    // edilaine - SOL 247935 / KTN 662587 - incio
    {while not (cdsImoveis.eof) and (StrToFloat(FloatToStr(pValorRest)) > 0) do }
    while not (cdsImoveis.bof) and (iValorRateio < 0) do
    begin
      cdsImoveis.Edit;
      cdsImoveis.FieldByName('VLRIMOVEL').Value := cdsImoveis.FieldByName('VLRIMOVEL').Value - 0.01;
      iValorRateio := iValorRateio +1;

      cdsImoveis.Post;
      cdsImoveis.Prior;

      if (cdsImoveis.bof) and (iValorRateio < 0) then
         cdsImoveis.Last;
    end;

  end;
  pValorRest := iValorRateio * 100;
  // edilaine - SOL 247935 / KTN 662587 - fim

  cdsImoveis.Filtered := False;

  cdsImoveis.IndexFieldNames := EmptyStr;
  cdsImoveis.IndexDefs.Clear;

  Result := pValorRest;

end;
//Marcio Sanches Spinosa SOL: 181200/10722 KINTANA: 1745291 - Fim


procedure TfrmExecLancMultDespMT.edtDataVencExit(Sender: TObject);
begin
  inherited;

  if _IdCidade <> 0 then
  begin
     if not diasuteis.DiaUtil(edtDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false) then
     begin
        if (Application.MessageBox('Data de vencimento não é um dia útil. Deseja alterar ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
        begin
           if (Application.MessageBox('Lançar para o primeiro dia útil posterior?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
              edtDataVenc.Date := diasuteis.PrimeiroDiaUtilPosterior(edtDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false)
           else
              edtDataVenc.Date := diasuteis.UltDiaUtilAnterior(edtDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false);
         end;
     end;
  end;
end;

{Início - Michelle Mota - SIG26054}
function TfrmExeclancMultDespMT.VerificaVoto : Boolean;
begin
  //Início - William Santana - SIG 26054
  Result := False;
  if (chkLancaVoto.Checked) then
  begin
    CdsAux.Data := CtrlLancImovel.ListaVoto(molFornecedor1.iFornecedor);   //Darivaldo Alencar SIG 26054

    if (CdsAux.IsEmpty) or (CdsAux.FieldByName('IDPESSOA').AsInteger = 0) then
        Result := True;               
  end;
  //Término - William Santana - SIG 26054
end;

function TfrmExeclancMultDespMT.VerificaExisteVoto : Boolean;
begin
  if (DBcboGrupo.LookupValue = EmptyStr) and (chkLancaVoto.Checked) then//Darivaldo Alencar SIG 26054  //William Santana  SIG 26054 (= and (chkLancaVoto.Checked))
     begin
        CdsAux.Data := CtrlLancImovel.ListaVotoGrupo(cdsImoveis.FieldByName('IDIMOVEL').AsInteger,iIdVoto);                                      //Darivaldo Alencar SIG 26054

        if (CdsAux.RecordCount = 0) then
          Result := True
        else
          Result := False;
     end
  else result:= false;
end;

function TfrmExeclancMultDespMT.VerificaSaldoTotal : Boolean;                
begin  
  CdsAux.Data := CtrlLancImovel.ListaSaldoVoto(iIdVoto);

  if (edtTotalLanc.value > CdsAux.fieldbyname('SALDO').AsFloat) then
    Result := True
  else
    Result := False;

end;
{Término - Michelle Mota - SIG26054}

procedure TfrmExecLancMultDespMT.molContrato1btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnBuscaContratoClick(Sender);

end;

procedure TfrmExecLancMultDespMT.molContrato1btnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnLimpaContratoClick(Sender);

end;

procedure TfrmExecLancMultDespMT.btnBuscaVotoClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG26054}
  MontaSelectVoto.Executar;
  if MontaSelectVoto.RetornouValor then
    begin
      iIdVoto := StrToInt(MontaSelectVoto.ValoresChave[0]);
      edtVoto.Text := MontaSelectVoto.ValoresChave[2] + ' - ' + MontaSelectVoto.ValoresChave[1];
    end;
  {Término - Michelle Mota - SIG26054}
end;

procedure TfrmExecLancMultDespMT.btnLimpaVotoClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG26054}
   iIdVoto := 0;
   edtVoto.Text := '';
  {Término - Michelle Mota - SIG26054}
end;

procedure TfrmExecLancMultDespMT.molFornecedor1btnLimpaFornClick(
  Sender: TObject);
begin
  inherited;
  molFornecedor1.btnLimpaFornClick(Sender);

end;         

function TfrmExecLancMultDespMT.ContinuaPagNfs: boolean;
begin
  Result := False;

	//if bDespesaComMaoDeObra then
  //begin
  	//if ((edtNFSNumero.Text = '') and
    //     (edtNFSSerie.Text = '') and
    //    (dtpNFSDataEmissao.Date = 0)) then
    //begin
    //	if MsgDlg('A despesa informada é passível de cessão de obra. ' + #10#13 +
    //  				  'Com a ausência dos dados da nota, deseja continuar sem o registro da nota fiscal e, ' + #10#13 +
    //            'consequentemente, a inexistência de cessão de mão de obra?', 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then
    //   	 Result := True;
    //end
    if edtNFSNumero.Text <> EmptyStr then
      Result := True
    else
    begin
      MsgDlg('É obrigatória a inclusão do número da nota fiscal de serviço.', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      edtNFSNumero.SetFocus;
      Exit;
    end;


    if dtpNFSDataEmissao.Date <> 0 then
      Result := True
    else
    begin
      MsgDlg('É obrigatória a inclusão da data de emissão da nota fiscal de serviço.', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      dtpNFSDataEmissao.SetFocus;
      Exit;
    end;

    if (dtpNFSDataEmissao.Date <> edtDataLanc.Date) and (dtpNFSDataEmissao.Date > Date) then
    begin
      MsgDlg('A data de emissão da nota fiscal não pode ser definida para um período futuro.', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      dtpNFSDataEmissao.SetFocus;
      Exit;
    end;
    
    //Obrigatoriedade retirada provisoriamente
    {if (cmProcListaServicos.Text = EmptyStr) then
    begin
      MsgDlg('É necessário informar o tipo de atividade, serviço ou produto relacionado.', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
    end
    else}
      Result := True;
  //end;
end;

procedure TfrmExecLancMultDespMT.DBcboAlteradorChange(Sender: TObject);
begin
  inherited;
  if cdsAlteradorXTipoImovel.FieldByName('FLGLANCANFS').AsString = 'S' then
  begin
    lblTipoServico.Visible := True;
    dbLkpTipoServico.Visible := True;
    dbLkpTipoServico.LookupValue := '';

    if not cdsProcessos.IsEmpty then
    begin
      pnlAlteradoresGerados.Top := 215;
      lblProcesso.Visible := True;
      dbLkpProcessos.LookupValue := '';
      dbLkpProcessos.Visible := True;
    end
    else
    begin
      pnlAlteradoresGerados.Top := 175;
      lblProcesso.Visible := False;
      dbLkpProcessos.Visible := False;
    end;

    if cdsAlteradorxTipoImovelFLGVALORBASE.asString = 'S' then
    begin
      edtValorBase.Value := edtVlrTotal.Value;
      lblValorBase.Visible := True;
      edtValorBase.Visible := True;
    end;               
  end
  else
  begin
    lblTipoServico.Visible := False;
    dbLkpTipoServico.Visible := False;
    lblValorBase.Visible := False;
    edtValorBase.Visible := False;
    dbLkpProcessos.Visible := False;
    dbLkpProcessos.Visible := False;
    pnlAlteradoresGerados.Top := 136;
  end;

end;

procedure TfrmExecLancMultDespMT.ExibeAbaAlteradores;
begin
  if btnContinuar.Enabled then
  begin
    inherited;
    AbreTipoAlterador;
   	// Limpa Cds de Alteradores
    if cdsAlterador.IsEmpty then
     	cdsAlterador.Data := CtrlLancImovel.LookupAlteradoresDocum(-2);
    //Cássio Rovaroto - SIG nº 115585 - Início

    cdsTipoServico.Data := CtrlLancImovel.ListTipoServico;
    cdsProcessos.Data := CtrlLancImovel.ListProcessos(molFornecedor1.iFornecedor, edtDataLanc.DateTime);
    pnlAlteradoresGerados.Top := 136;
    lblTipoServico.Visible := False;
    dbLkpTipoServico.Visible := False;
    lblProcesso.Visible := False;
    dbLkpProcessos.Visible := False;
    lblValorBase.Visible := False;
    edtValorBase.Visible := False;
    //Cássio Rovaroto - SIG nº 115585 - Fim
    PagControle.ActivePageIndex := 3;
    btnContinuar.Enabled := False;
    btnConfirmar.Enabled := True;
  end;
end;

procedure TfrmExecLancMultDespMT.ExibeAbaNFS;
begin
  dtpNFSDataEmissao.Date := edtDataLanc.Date;
  edtValorBrutoNFS.Value := edtVlrTotal.Value;
  PagControle.ActivePageIndex := 2;
  btnContinuar.Enabled := True;
  btnConfirmar.Enabled := False;
  edtNFSNumero.SetFocus;
  bRegNFS := True;
end;

procedure TfrmExecLancMultDespMT.cmProcListaServicosValidaDados(
  Sender: TObject);
begin
  inherited;
  if msListaServico.RetornouValor then
  begin
    _IdServico:= StrToInt(msListaServico.ValoresChave[0]);
    _CodNaturezaREINF := StrToInt(msListaServico.ValoresChave[1]);
    cmProcListaServicos.Text := msListaServico.ValoresChave[2]
  end;
end;

function TfrmExecLancMultDespMT.LancamentoAlteradoresTributacao(
  iIDServico: Integer): Boolean;
begin
  Result := False;
  cdsAltTributo := TCMClientDataSet.Create(nil);
  try
    cdsAltTributo.Data := CtrlListaServicos.GetTipoTributacaoServico(iIDServico);

    if not cdsAltTributo.IsEmpty then
    begin
      if not VerificaAlteradorTribLancado(iIdServico) then
      begin
        if MsgDlg('Deseja fazer o registro de tributação relacionada?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
        begin
          if MsgDlg('Deseja continuar o lançamento?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYES then
          begin
            MsgDlg('Este lançamento indica a inclusão de tributação. ' + #13#10 +
                   'Faça o lançamento, se necessário, após o registro do documento', 'Aviso', mtWarning, [mbOK], 0);
            Result := True;
          end
          else
            Result := False;
        end
        else
        begin
          if cdsAlterador.IsEmpty then
            cdsAlterador.Data := CtrlLancImovel.LookupAlteradoresDocum(-2, True);

          while not cdsAltTributo.Eof do
          begin
            Result := RegistraDadosAlterador(iIDServico, cdsAltTributo.FieldByName('TIPOTRIBUTO').asInteger);
            if Result then
              cdsAltTributo.Next
            else
              Exit;
          end;
        end;
      end
      else
        Result := True;
    end
    else
        Result := True;
  finally
    FreeAndNil(cdsAltTributo);
  end;
end;


function TfrmExecLancMultDespMT.RegistraDadosAlterador(iIdServico,
  iTipoTributo: Integer): Boolean;
var
  cdsAux: TCMClientDataSet;
  iCodAlterador: Integer;
  sDescAlterador: string;
  dAliquota : Double;
  sAcrescDesc: string;
  iPeriodoTributacao: Integer;
begin
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlListaServicos.GetAlteradorTributacaoServico(iIdServico, iTipoTributo);

    if not cdsAlterador.Locate('CODALTERADOR', cdsAux.FieldByName('CODALTERADOR').asInteger, [loCaseInsensitive, loPartialKey]) then
    begin
      if cdsAux.RecordCount = 1 then
      begin
        iCodAlterador := cdsAux.FieldByName('CODALTERADOR').asInteger;
        sDescAlterador := cdsAux.FieldByName('DESCRICAO').asString;
        dAliquota := cdsAux.FieldByName('ALIQUOTA').asFloat;
        sAcrescDesc := cdsAux.FieldByName('ACRESDECRES').asString;
        iPeriodoTributacao := cdsAux.FieldByName('PERTRIBUTO').asInteger;
        Result := True;
      end
      else
      begin
        try
          frmSelAltTributacao := TfrmSelAltTributacao.Create(Application);
          frmSelAltTributacao.Visible := False;
          frmSelAltTributacao.cdsAlteradores.Data  := CtrlListaServicos.GetAlteradorTributacaoServico(iIdServico, iTipoTributo);
          frmSelAltTributacao.lblText2.Caption := cdsAux.FieldByName('DESC_TIPOTRIBUTO').asString +
                                                  ' possui mais de um tipo de alterador.';
          frmSelAltTributacao.ShowModal;
          iCodAlterador := frmSelAltTributacao.iCodAlterador;
          sDescAlterador := frmSelAltTributacao.sDescricao;
          dAliquota := frmSelAltTributacao.dAliquota;
          sAcrescDesc := frmSelAltTributacao.sAcrescDesc;
          iPeriodoTributacao := frmSelAltTributacao.iPeriodoTributacao;

          Result := frmSelAltTributacao.bOperacaoOK;
        finally
          FreeAndNil(frmSelAltTributacao);
        end;
      end;

      if Result then
      begin
        try
          sTipoImovel := '';
          cdsImoveis.First;

          while not cdsImoveis.Eof do
          begin
            if pos(cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString,sTipoImovel) = 0 then begin
              inc(iTiposImoveis);
              if sTipoImovel = '' then
                sTipoImovel := cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString
              else if (iTiposImoveis = 2) then
                sTipoImovel := QuotedStr(sTipoImovel) + ',' + QuotedStr(cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString)
              else
                sTipoImovel := sTipoImovel + ',' + QuotedStr(cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString)
            end;
            cdsImoveis.Next;
          end;

          cdsAlteradorXTipoImovel.Data := CtrlTipoImovel.LookupAlteradoXTipoImo(
                                   Sistema.idEmpresa, iCodAlterador, sTipoImovel, 'P', sAcrescDesc);

          cdsAlterador.Append;
          cdsAlterador.FieldByName('IDDOCUMENTO').asInteger := iDocumento;
          cdsAlterador.FieldByName('CODALTERADOR').asInteger := iCodAlterador;
          cdsAlterador.FieldByName('VLRALTERADOR').asFloat := StrToFloat(FormatFloat('#0.00',(edtVlrTotal.Value * (dAliquota/100)))); //Cássio Rovaroto - WO 3524
          cdsAlterador.FieldByName('DESCRICAO').asString := sDescAlterador;
          cdsAlterador.FieldByName('ACRESDECRES').asString := sAcrescDesc;
          cdsAlterador.FieldByName('CODTIPIMOVEL').asString := cdsAlteradorXTipoImovelCODTIPIMOVEL.AsString;
          cdsAlterador.FieldByName('OBSERVACAO').asString := EmptyStr;
          cdsAlterador.FieldByName('FLGLANCANFS').asString := 'S';
          if iPeriodoTributacao = 0 then
            cdsAlterador.FieldByName('DATALANCTO').asDatetime := edtDataLanc.Date
          else
            cdsAlterador.FieldByName('DATALANCTO').asDatetime := edtDataVenc.Date;

          cdsAlterador.FieldByName('VALORBASERETENCAO').asFloat := edtVlrTotal.Value;
          cdsAlterador.FieldByName('IDENVIODOCUMENTO').asInteger := 0;
          cdsAlterador.Post;
        except
          on e: Exception do
          begin
            Result := False;
            MsgDlg('Não possível registrar o alterador (' + e.Message + ')', 'Erro', mtError, [mbOK], 0);
          end;
        end;
      end
      else
      begin
        if MsgDlg('O registro dos alteradores de tributação não foi realizado. Deseja continuar?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
          Result := False
        else
          Result := True;
      end;
    end
    else
      Result := True;
  finally
    FreeAndNil(CdsAux);
  end;
end;

function TfrmExecLancMultDespMT.VerificaAlteradorTribLancado(
  iIdServico: Integer): Boolean;
var
  iTipoTributoAnt, iTributoLanc, iAltLanc: Integer;
  cdsAux: TClientDataSet;
begin
  Result := False;
  iAltLanc := 0;
  iTributoLanc := 0;
  iTipoTributoAnt := -1;
  cdsAux := TClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlListaServicos.ListTributacaoServico(iIdServico);

    if not cdsAlterador.IsEmpty then
    begin
      while not cdsAux.Eof do
       begin
        if cdsAlterador.Locate('CODALTERADOR', cdsAux.FieldByName('CODALTERADOR').asInteger, [loCaseInsensitive, loPartialKey]) then
          Inc(iAltLanc);

        if (iTipoTributoAnt <> cdsAux.FieldByName('TIPOTRIBUTO').asInteger) then
         Inc(iTributoLanc);

        iTipoTributoAnt := cdsAux.FieldByName('TIPOTRIBUTO').asInteger;
        cdsAux.Next;
       end;

       if iAltLanc = iTributoLanc then
        Result := True;
    end;

  finally
    FreeAndNil(cdsAux);
  end;

end;
// Inicio WO8602 Ferrari
procedure TfrmExecLancMultDespMT.sbtnSelArquivoClick(Sender: TObject);
var
  iNumFalhas,iNumOK,iNumNOK    : integer;
begin
  inherited;
  If Application.MessageBox(pchar('O Arquivo no formato Excel (.xlsx) deve conter as seguintes colunas: ' + #13 + #13 +
    'A1 - [Codigo do imovel] - (O Id do Imovel)' + #13 +
    'B1 - [valor boleto] - (Ex.: 100,48)' + #13 +
    'Confirma Importação ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
    begin
      if odAbreArq.Execute then
        begin
          edtArquivo.Text := odAbreArq.FileName;
          sbtnSelArquivo.Down := False;
          iNumFalhas := 0;
          iNumOK := 0;
          iNumNOK := 0;
          setlength(vDadosProntos, 0);
          ValidaArquivo(iNumFalhas,iNumOK,iNumNOK, vDadosProntos);
       end;
    end;


end;

procedure TfrmExecLancMultDespMT.ValidaArquivo(var iNumFalhas,
  iNumOK,iNumNOK: Integer; var vDadosProntos: TArrayImportaImoveis);
var
  Excel, oSheet   : Variant;
  iLinha,iCol,iaba: integer;
  sCampo          : string;
  TipoColuna      : TTipoDado;
  TipoOpcao       : TOpcaoColuna;
  sValor          : string;
  sPreparo        : integer;
  sAnoMesVig      : string;
  DadosImportacao : TRecDadosImoveis;
  bErro           : boolean;
  sMensagem       : string;
  aba             : byte;
  i,linha         : Integer;
begin
  inherited;


  Screen.Cursor := crHourGlass;

  memErro.Clear;
  iaba := 1;
  // definindo numero de colunas do arquivo e cabeçalho
  SetLength(vColunasArq, 2);
  for iCol := Low(vColunasArq) to High(vColunasArq) do
  begin
    case iCol of
      0 : sCampo := 'Codigo do imovel';
      1 : sCampo := 'valor boleto';
    end;
    vColunasArq[iCol] := AnsiUpperCase(sCampo);
  end;

  // definindo o tipo das colunas
  SetLength(vColunaTipo, 3);
  for iCol := Low(vColunaTipo) to High(vColunaTipo) do
  begin
    case iCol of
                0 : TipoColuna := tdString;
                2 : TipoColuna := tdReal;
    end;
    vColunaTipo[iCol] := TipoColuna;
  end;

  // definindo a obrigatoriedade das colunas
  SetLength(vColunaOpcao, 2);
  for iCol := Low(vColunaOpcao) to High(vColunaOpcao) do
  begin
    case iCol of
      0,1: TipoOpcao := ocObrigatoria ;
       else  TipoOpcao := ocOpcional;
    end;
    vColunaOpcao[iCol] := TipoOpcao;
  end;

  // Cria o objeto
  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  // Abre o Arquivo
  Excel.WorkBooks.Open(ExpandUNCFileName(odAbreArq.FileName),1);
  for aba := 1 to Excel.Workbooks[1].sheets.Count do
     if Excel.WorkBooks[1].Sheets[aba].Name = 'importacao' then
       begin
         iaba := aba;
         break;
       end;


  // Indica a partir de qual linha começar a pegar os registros
  iLinha := 2;

  try
     // Valida o layout do arquivo excel
     dTotal := 0;
     if (ValidaLayout(Excel, vColunasArq)) and (Excel.WorkBooks[1].Sheets[aba].Name = 'importacao') then
     begin
       memErro.Lines.Add('Resultado Validação do Arquivo de Importação:') ;
       memErro.Lines.Add(edtArquivo.text) ;
       memErro.Lines.Add('') ;
       if UltimaLinha(Excel, iLinha, 5, length(vColunasArq)) then
       begin
         memErro.Lines.Add('O arquivo selecionado não possui informações.') ;
         inc(iNumFalhas);
       end
       else
       begin

         while not UltimaLinha(Excel, iLinha, 5, length(vColunasArq)) do
         begin
           if ValidaLinhaVazia(Excel,iLinha,length(vColunasArq)) then
           begin
             memErro.Lines.Add('Linha '+ inttostr(iLinha)+', Vazia...') ;
             inc(iLinha);
             continue;
           end;
           //zerando valores
           DadosImportacao.sIdimovel                := '';
           DadosImportacao.dValor                   := -1;

           // validando o tipo de dado das colunas e preenchimento
           for iCol := Low(vColunasArq) to High(vColunasArq) do
           begin

             if ValidaDadosColunaExcel(iLinha, iCol+1, Excel, vColunasArq[iCol], vColunaTipo[iCol], vColunaOpcao[iCol], memErro, iaba) then
               sValor := Trim(VarToStr(Excel.workbooks[1].sheets[iaba].cells[iLinha, iCol+1].Value));
               // valida regras especificas do campo
             if AnsiUpperCase(sValor) = 'TOTAL' then
               Break;
             case iCol of
               0 : DadosImportacao.sIdimovel := sValor;
               1 : DadosImportacao.dValor := strtofloat(sValor);
             end;
           end;

           // verifica se dados preenchidos corretamente para importacao
           if (DadosImportacao.sIdimovel <> '') and (DadosImportacao.dValor <> -1) then
           begin
              memErro.Lines.Add(DadosImportacao.sIdimovel + '  Registro OK...') ;
              inc(iNumOK);
           end
           else if AnsiUpperCase(sValor) <> 'TOTAL' then
             begin
              memErro.Lines.Add('Linha '+ inttostr(iLinha)+', Registro Inconsistente...') ;
              inc(iNumNOK);
             end;

           setlength(vDadosProntos, high(vDadosProntos)+2);

           vDadosProntos[high(vDadosProntos)].sIdimovel      := DadosImportacao.sIdimovel;
           vDadosProntos[high(vDadosProntos)].dValor         := DadosImportacao.dValor;
           dTotal := dTotal + DadosImportacao.dValor;

           // Contador de linha
           inc(iLinha);
         end;
       end;

       memErro.Lines.Add('------------------------------------------------------------------');
       memErro.Lines.Add('Total de inconsistências...: '+IntToStr(iNumNOK));
       memErro.Lines.Add('Total de registros OK......: '+IntToStr(iNumOK));
       memErro.Lines.Add('Total de registros Planilha: '+IntToStr(iLinha-7));  //tira o cabeçalho e as 11 linhas de final da planilha
       iNumeroTotal := (iLinha-7);
       iNumeroOK := iNumOK;
       // Transferindo para cdsImoveis
//       cdsImoveis.Data := _LancDocCapCar.getCamposRateio;

       for i := low(vDadosProntos) to high(vDadosProntos) do
         begin
           linha := i + 2;
           // inserção da Planilha no cdsImoveis
           // Imóvel
           cdsImoveis.Insert;
           if BuscaContratoImovelPlanilha( vDadosProntos[i].sIdimovel ) then
             begin
               cdsImoveis.FieldByName('VLRIMOVEL').AsCurrency := vDadosProntos[i].dValor;
               cdsImoveis.Post;
             end
           else
              memErro.Lines.Add('Linha '+ inttostr(iLinha)+', Registro não encontrado...') ;


         end;




     end
     else
     begin
       MsgDlg('Arquivo não está no formato válido.', 'Atenção', mtInformation, [mbOk], 0);
       memErro.Lines.Add('Arquivo não está no formato válido...') ;
       edtArquivo.text := '';
       if Excel.WorkBooks[1].Sheets[aba].Name <> 'importacao' then
         begin
           memErro.Lines.Add('Aba importacao não encontrada dentro do Arquivo...') ;
           inc(iNumFalhas);
           memErro.Lines.Add('Total de inconsistências...: '+IntToStr(iNumFalhas));
         end;
     end;
     edtArquivo.text := '';
     btnTotaliza.Click;
  finally
     Excel.ActiveWorkBook.Saved:= 1;
     Excel.DisplayAlerts:= 0;
     Excel.ActiveWorkBook.Close(SaveChanges:= 0);
     Excel.Workbooks.Close;
     Excel.Quit;
     Excel := Unassigned;
     Screen.Cursor := crDefault;
  end;

end;

function TfrmExecLancMultDespMT.BuscaContratoImovelPlanilha(
  const iIdImovel: string): Boolean;
var
  fSoma        : Double;
  sSql         : String;
  iAno,iMes    : word;
  sCompetencia : String;
begin
   Result := False;
   iAno         := Word(trunc(DBspnAno.Value));
   iMes         := cboMes.ItemIndex+1;
   sCompetencia := IntToStr(iAno)+FormatFloat('00',(iMes));

   sSql := 'SELECT i.IMOCODIGO,	i.IDIMOVEL,	i.IMONOME AS DSC_IMOVEL, i.CODTIPIMOVEL, '+#13+
                   '(	SELECT ( C.CONNUMERO || ''- '' || C.CONNOME ) '+#13+
           'FROM CM.CONTRATOIMOVEL C,CM.CONTRATOXIMOVEL CXI '+#13+
           '   WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL  '+#13+
           '   AND C.FLGTIPOCONTRATO = ''L''  '+#13+
           '   AND CXI.IDIMOVEL = i.idimovel '+#13+
           '   AND ( (CXI.CIMDTFIM IS NOT NULL  '+#13+
           '     AND '+QuotedStr(sCompetencia)+' BETWEEN TO_CHAR(CXI.CIMDTINI, '+#13+
           '     ''YYYYMM'') AND TO_CHAR(CXI.CIMDTFIM,  '+#13+
           '     ''YYYYMM'') ) '+#13+
           '     OR (CXI.CIMDTFIM IS NULL   '+#13+
           '       AND '+QuotedStr(sCompetencia)+' >= TO_CHAR(CXI.CIMDTINI, '+#13+
           '       ''YYYYMM'') ) ) '+#13+
           ' ) AS CONTRATO_EXTENSO  '+#13+
           'FROM CM.IMOVEL i  '+#13+
           'WHERE i.IMOCODIGO = ' + QuotedStr( iIdImovel );

   if FazQuery( dtmImobiliario.qryAux, sSql ) then begin
     // Se a query retornar mais de um registro, abrir a combo
     if ( dtmImobiliario.qryAux.RecordCount > 1 ) then begin

        frmPrincipal.Enabled   := False;
        twSelecionaContrato.Show;
        twSelecionaContrato.Top     := round( ( frmPrincipal.Height - twSelecionaContrato.Height ) / 2 );
        twSelecionaContrato.Left    := round( ( frmPrincipal.Width  - twSelecionaContrato.Width  ) / 2 );

        dspBuscaContrato.DataSet    := dtmImobiliario.qryAux;
        // Passa o conteúdo da Query para o Cds...
        cdsContrato.Data            := dspBuscaContrato.Data;

        with cdsContrato do begin
           First;
           while not Eof do begin
              fSoma := fSoma + cdsContratoCIMPERCENTRATEIO.AsFloat;
              Next;
           end;

           // Se a soma do rateio não chegar a 100%, criar um novo registro com
           // a descrição "área vaga" para preencher a diferença...
           if ( fSoma < 100 ) then begin
              cdsContrato.Insert;
              cdsContratoIDCONTRATOIMOVEL.AsInteger := -1;
              cdsContratoCONNOME.AsString           := 'ÁREA VAGA';
              cdsContratoCIMPERCENTRATEIO.AsFloat   := 100-fSoma;
              cdsContrato.Post;
           end;
        end;

     end else begin
        with dtmImobiliario.qryAux do begin
           if not IsEmpty then begin
              cdsImoveis.FieldbyName('IMOCODIGO').AsString    := FieldbyName('IMOCODIGO').AsString;
              cdsImoveis.FieldbyName('IDIMOVEL').AsInteger    := FieldbyName('IDIMOVEL').AsInteger ;
              cdsImoveis.FieldbyName('DSC_IMOVEL').AsString   := FieldbyName('DSC_IMOVEL').AsString ;
              cdsImoveis.FieldbyName('CODTIPIMOVEL').AsString := FieldbyName('CODTIPIMOVEL').AsString;
              Result := True;
           end;
        end;
     end;
   end;

end;
// Fim WO8602 Ferrari

end.
