// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 20/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//--------------------------------------------------------------------------------
//Pendência   : SOL 63067 - KTN 524520
//Responsável : FERNANDO XAVIER
//Data        : 12/01/2012
//Descrição   : Cadastro Previdenciário - Resgate de Contribuições
//--------------------------------------------------------------------------------
//Pendência   : SOL 168268 Kintana 1481683
//Responsável : Fernando Xavier
//Descrição   : Está exigindo ano mês comp mesmo quando não é reembolso INSS
// -----------------------------------------------------------------------------
//Pendência   : SOL 140042/6601 Kintana
//Responsável : BRUNO AZEVEDO
//Data        : 27/09/2011 - Demanda resolvida em Brasília.
//Descrição   : Alterado o tipo de campo que cadastra o mes de reembolso. Ajustado a
//              obrigatoriedade para quando o campo for permanente e ajuste na prévia
//              para tratar o campo igual ao campo mes referencia para quando
//              estiver em branco e for permanente.
//------------------------------------------------------------------------------
//Pendência   : SOL 163942 Kintana 1404260
//Responsável : Fernando Xavier
//Descrição   : Erro apresentação camo MESCOMPREEM nas rubricas individuais.
// -----------------------------------------------------------------------------
//Pendência   : SOL 164018 Kintana 1406595
//Responsável : Fernando Xavier
//Descrição   : Erro ao incrementar o sequencial das rubricas.
// -----------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
//Pendência   : SOL 152850 KINTANA 1160043
//Responsável : BRUNO AZEVEDO
//Data        : 05/04/2010
//Descrição   : Ajuste no APPLYUPDATES das querys.
//------------------------------------------------------------------------------
//Pendência   : SOL 150706 KINTANA 1096846
//Responsável : BRUNO AZEVEDO
//Data        : 13/01/2010
//Descrição   : CHAMAR O inherited APÓS FAZER O APPLYUPDATES DAS QUERYS.
//--------------------------------------------------------------------------------
//Pendência   : SOL 148694 KINTANA 1057380
//Responsável : FERNANDO XAVIER
//Data        : 14/12/2010
//Descrição   : Erro no Commit
//--------------------------------------------------------------------------------
//Pendência   : SOL 138157 Kintana 840763
//Responsável : Renato Visoni
//Data        : 26/07/2010
//Descrição   : Opção de Cadastrar rubricas de Resgate.
//--------------------------------------------------------------------------------
//Pendência   : SOL 143603 KINTANA 934013
//Responsável : BRUNO AZEVEDO
//Data        : 09/09/2010
//Descrição   : Correção ao abrir a tela.
//--------------------------------------------------------------------------------
//Pendência   : SOL 132174 KINTANA 761776
//Responsável : FERNANDO XAVIER
//Data        : 30/06/2010
//Descrição   : Inclusão dos campos SITUACAOAJ e OBSERVACAO da tabala RUBRICAINDIV
//--------------------------------------------------------------------------------
//Pendência   : SOL 138969 KINTANA 852277
//Responsável : BRUNO AZEVEDO
//Data        : 05/07/2010
//Descrição   : Adicionado o campo PRAZO da PROVDESC na qryDet.
//--------------------------------------------------------------------------------
//Pendência   : SOL 130928 KINTANA 738408
//Responsável : BRUNO AZEVEDO
//Data        : 05/04/2010
//Descrição   : Rubricas de parcela única e permanentes devem ter parcelas = 1.
//--------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendência   : SOL 129270 Kintana 709354
// Descrição   : O sistema não estava gravando o NUMPROCINSS na RubricaIndiv para
// as OUTRAS RUBRICAS, que gerava problema na Previa e na Efetivação.
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 07/12/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 128130 - KINTANA 684112
// Descrição   : Alteração na qry do Monta Select do Favorecido para buscar
//               pessoas fisicas e juridicas.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 13/11/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 126534 - KINTANA 668360
// Descrição   : Alteração na qry para nova condição do FLGDESATIVADO.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 11/11/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 126895 - KINTANA 669342
// Descrição   : Alteração no monta select do favorecido, corrigindo o filtro
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 19/10/2009
// Rotina      : Diversas
// Pendência   : SOL 67497 KT: 522887
// Descrição   : Inclusão do Campo FLGANTECIPAABONOINSS na aba de Rubrica de
//               Pensão Alimenticia.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 29/09/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 124381 - KINTANA 631701
// Descrição   : No momento de cadastramento de uma rubrica permanete
//              (FLGPERMANENTE = 1) seja preenchido internamente o campo de
//               Prazo igual q 999.
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 08/10/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 123122
// Descrição   : Alteração no monta select do favorecido
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 02/09/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 125009
// Descrição   : A aba Outras Rubricas não estava trazendo todas a s rubricas.
// -----------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 15/09/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 125156 Kintana 642427
// Descrição   : Ao cadastrar uma rubrica, na aba outras rubricas, o sistema
// está apresentando a mensagem Obrigatório quando utilizada no Abono Anual for
// selecionada, mesmo que a opção não está selecionada. 
//------------------------------------------------------------------------------
// Autor(a)    : Luis Dornellas
// Data        : 15/09/2009
// Rotina      : Rubricas Individuais
// Pendência   : SOL 124238 - KINTANA 631692
// Descrição   : Alteração para exibir mensagem de obrigatoriedade de preenchi-
//               mento de campos quando a opção Utiliza Abono Anual for selecio-
//               nada.
//------------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Data        : 27/01/2009
// Rotina      : TfrmCadRubricaIndiv.bbtnConfirmarClick
// Pendência   : SOL 100901 - Kintana 448394
// Descricao   : Implementei no módulo Folha de Beneficios/Cadastro/Rubricas
//               individuais, um mecanismo onde no momento do cadastramento de
//               rubricas, se não for inserido a rubrica na aba abono anual,
//               não poderá ser efetivado o lançamento, sendo necessário o
//               lançamento nesses campos.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 14/04/2009
// Pendência   : SOL 118773
// Descricao   : Verificar a tabela RUBRICAXPLANO para identificar qual plano contabil
// sera lançado.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 14/04/2009
// Pendência   : SOL 119865 Kintana 571717
// Descricao   : Quando for Rubrica de INSS(FLGINSS PrevDesc), lancar na conta contabil
//               com a FONTEPAGADORA  = 2 (BENEFBFCIARIO) e não no plano ativo.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 14/04/2009
// Pendência   : SOL 114110 Kintana 531610
// Descricao   : No lançamento de Rubricas de PA em outras Rubricas o campo Rubrica de
// Pagamento do Favorecido estava ficando desabilitado ao sair do campo de seleção
// de rubrica.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 09/04/2009
// Rotina      : qryOutrosBeforePost
// Pendência   : SOL 113626 Kintana 529689
// Descricao   : Ao passar a qryOutrasRubricas para a função PegaSeqRubricaIndiv(),
// a qry estava no resgistro errado, assim passando o rametro errado, gerando um erro.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 12/03/2009
// Rotina      : dblcRubricaOutrosCloseUp e  dblcRubricaPACloseUp
// Pendência   : SOL 111120  KINTANA 512276
// Descricao   : O sistema não estava trazendo automaticamente no campo favorecido
// os dados do favorecido quando a rubrica era selecionada, pois o sistema estava
// verificando o registro errado que estava na qry, por isso foi colocado o Filter.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 07/02/2007 (reabertura)
// Rotina      : qryDetBeforePost
// Pendência   : 21559
// Descricao   : Ajuste para fazer gravação do campo IdSeqInternoFB na
//   HSTBENEFBFCIARIO apenas quando na operação de Inserir ou Alterar.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/11/2006
// Rotina      : Várias
// Pendência   : 21559
// Descricao   : Gravar o campo IdSeqInternoFB na inclusão de registros na RUBRICAINDIV.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 05/10/2006
// Rotina      : MontaQryDet e MontaQryOutros
// Pendência   : 23276
// Descricao   : Exibir novo campo para considerar valores retroativos
//   a partir da data inicio da PA.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26/09/2006
// Rotina      : MontaQryOutros e na Tela
// Pendência   : 23387
// Descricao   : Exibir novo campo plano contábil no grid de outras rubricas.
//------------------------------------------------------------------------------
unit FCadRubricaIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbedit, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, TREdit, Spin, fcButton,
  fcImgBtn, fcShapeBtn;

type
  TfrmCadRubricaIndiv = class(TfrmCadMestreDetalheCS)
    lblPessoa: TLabel;
    lblCategoria: TLabel;
    edTipo: TEdit;
    lblMatricula: TLabel;
    dbeMatricula: TDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    tbsOutrasRubricas: TTabSheet;
    dbgrdOutrasRubricas: TwwDBGrid;
    qryDesconto: TwwQuery;
    qryProvento: TwwQuery;
    qryRegra: TwwQuery;
    qryAux: TwwQuery;
    MontaSelectFAV: TMontaSelect;
    pnlDetOutras: TPanel;
    dsOutros: TwwDataSource;
    qryOutros: TwwQuery;
    updOutros: TUpdateSQL;
    CmeDetOutros: TCmEventosCadastro;
    qryPortadorforma: TwwQuery;
    qryRubricaOutros: TwwQuery;
    dblkpcmbBenef: TwwDBLookupCombo;
    qryBenef: TwwQuery;
    qryBenefNOME: TStringField;
    qryBenefIDPESSOA: TFloatField;
    qryBenefIDTITULAR: TFloatField;
    MontaSelectRub: TMontaSelect;
    qryBenefPESSOAESCOLHIDA: TFloatField;
    qryRubFavOutros: TwwQuery;
    qryRegraCPMF: TwwQuery;
    pnlOp1PA: TPanel;
    dbrgrpPermanentePA: TDBRadioGroup;
    grpParcelasPA: TGroupBox;
    lblParcelasPA: TLabel;
    lblProcPA: TLabel;
    spedParcelasPA: TwwDBSpinEdit;
    spedNumOcorrenciasPA: TwwDBSpinEdit;
    grpPeriodoPA: TGroupBox;
    lblDePA: TLabel;
    lblAtePA: TLabel;
    lblUltMesPA: TLabel;
    dbdtInicioPA: TCMDateTimePicker;
    dbdtFinalPA: TCMDateTimePicker;
    fcsbtnEstadoPA: TfcShapeBtn;
    dbUltmesProcPalim: TDBEdit;
    Panel1: TPanel;
    grpMesReferenciaPA: TGroupBox;
    cmb_mesrefPA: TComboBox;
    spn_anorefPA: TSpinEdit;
    gboxSeqPA: TGroupBox;
    dbeSequencialPA: TDBEdit;
    Panel2: TPanel;
    grpRegraPA: TGroupBox;
    lblValorPA: TLabel;
    lblRegraPA: TLabel;
    dbreValor: TDBRealEdit;
    dblcRegraPA: TwwDBLookupCombo;
    fcsbtnRubXPA: TfcShapeBtn;
    dbchkBasePA: TDBCheckBox;
    dbchkAbonoPA: TDBCheckBox;
    dbchkAntecipAbonoPA: TDBCheckBox;
    dbcboxCPMF: TDBCheckBox;
    lblNumProcInss: TLabel;
    dbedtNumProcInss: TDBEdit;
    pgctrlPA: TPageControl;
    tbsDadosBasicosPA: TTabSheet;
    grpRubricaPA: TGroupBox;
    lblRubDescPA: TLabel;
    sbtnRubDescPA: TSpeedButton;
    sbtnRemRubDescPA: TSpeedButton;
    dblcRubricaPA: TwwDBLookupCombo;
    tbsRubricaAbonoPA: TTabSheet;
    grpRubricaProventoAbonoPA: TGroupBox;
    Label2: TLabel;
    sbtnRubCredAbonoPA: TSpeedButton;
    sbtnRemRubCredAbonoPA: TSpeedButton;
    dblcRubricaAbonoFavPA: TwwDBLookupCombo;
    pnlOp1Outras: TPanel;
    grpPeriodoOutros: TGroupBox;
    lblDeOutros: TLabel;
    lblAteOutros: TLabel;
    lblUltMesOutros: TLabel;
    dbdtIniciooutros: TCMDateTimePicker;
    dbdtFinalOutros: TCMDateTimePicker;
    fcsbtnEstadoOutros: TfcShapeBtn;
    dbUltMesprocOutras: TDBEdit;
    Panel3: TPanel;
    gboxSeqOutros: TGroupBox;
    dbeSequencialOutros: TDBEdit;
    grpMesReferenciaOutros: TGroupBox;
    cmb_mesrefoutros: TComboBox;
    spn_anorefoutros: TSpinEdit;
    grpParcelasOutros: TGroupBox;
    lblParcelasOutros: TLabel;
    lblProcOutros: TLabel;
    spedparcelasoutros: TwwDBSpinEdit;
    spedNumOcorrenciasOutros: TwwDBSpinEdit;
    dbrgrpPermanenteOutros: TDBRadioGroup;
    Panel4: TPanel;
    pgctrlOutros: TPageControl;
    tbsDadosBasicosOutros: TTabSheet;
    tbsRubricaAbonoOutros: TTabSheet;
    grpRubricaOutros: TGroupBox;
    lblRubOutros: TLabel;
    sbtnRubOutros: TSpeedButton;
    sbtnRemRubOutros: TSpeedButton;
    dblcRubricaOutros: TwwDBLookupCombo;
    grpRubricaAbonoPA: TGroupBox;
    Label1: TLabel;
    sbtnRubDescAbonoPA: TSpeedButton;
    sbtnRemRubDescAbonoPA: TSpeedButton;
    dblcRubricaAbonoPA: TwwDBLookupCombo;
    grpFavorecidoPA: TGroupBox;
    lblCPFPA: TLabel;
    lblNomeFavPA: TLabel;
    sbtnAddFav: TSpeedButton;
    sbtnRemFav: TSpeedButton;
    lblRubProvPA: TLabel;
    sbtnRubCredPA: TSpeedButton;
    sbtnRemRubCredPA: TSpeedButton;
    lblportformaPA: TLabel;
    edCPFFavPA: TEdit;
    edNomeFavPA: TEdit;
    dblcRubricaFavPA: TwwDBLookupCombo;
    btnAlimentados: TButton;
    dblkupPortFormaPA: TwwDBLookupCombo;
    grpFavorecidoOutros: TGroupBox;
    lblCPFOutros: TLabel;
    lblNomeFavOutros: TLabel;
    sbtnAddFavOutros: TSpeedButton;
    sbtnRemFavOutros: TSpeedButton;
    lblRubFavOutros: TLabel;
    sbtnRubFavOutros: TSpeedButton;
    sbtnRemRubFavOutros: TSpeedButton;
    lblPortFormaOutros: TLabel;
    edCPFFavOutros: TEdit;
    edNomeFavOutros: TEdit;
    dblcRubricaFavOutros: TwwDBLookupCombo;
    dblcPortFormaOutros: TwwDBLookupCombo;
    Panel5: TPanel;
    grpRegraOutros: TGroupBox;
    lblValorOutros: TLabel;
    lblRegraOutros: TLabel;
    dbreValorOutros: TDBRealEdit;
    dblcRegraOutros: TwwDBLookupCombo;
    dbcboxAbonoOutros: TDBCheckBox;
    dbcboxAntecipAbonoOutros: TDBCheckBox;
    GroupBox1: TGroupBox;
    dbcboxControlaSaldo: TDBCheckBox;
    Label3: TLabel;
    dbredSaldoInicial: TDBRealEdit;
    Label4: TLabel;
    dbredSaldoAcumulado: TDBRealEdit;
    grpRubricaOutrosAbono: TGroupBox;
    Label5: TLabel;
    sbtnRubAbonoOutros: TSpeedButton;
    sbtnRemRubAbonoOutros: TSpeedButton;
    dblcRubricaAbonoOutros: TwwDBLookupCombo;
    grpRubricaPagOutrosAbono: TGroupBox;
    Label6: TLabel;
    sbtnRubAbonoFavOutros: TSpeedButton;
    sbtnRemRubAbonoFavOutros: TSpeedButton;
    dblcRubricaFavAbonoOutros: TwwDBLookupCombo;
    qryBenefMATRICULA: TStringField;
    dbcboxRetroagePA: TDBCheckBox;
    cbAntecipaAbonoINSS: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    QryProcInss: TwwQuery;
    cboSituacaoAJ: TComboBox;
    lblSituacaoaJ: TLabel;
    mmobservacao: TMemo;
    lblobservacao: TLabel;
    chkOutrasRubResgate: TDBCheckBox; // SOL 140042 Kintana 900220
    qryFontepagadora: TwwQuery;
    grpMesReembolcoPA: TGroupBox;
    edtAnoMesReembPA: TMaskEdit;
    GroupBox5: TGroupBox;
    edtAnoMesReembOutros: TMaskEdit;
    chkOutrasRubResgateParc: TDBCheckBox;    // SOL 140042 Kintana 900220
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnAddFavClick(Sender: TObject);
    procedure sbtnRemFavClick(Sender: TObject);
    procedure dbrgrpPermanentePAClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure sbtnAddFavOutrosClick(Sender: TObject);
    procedure sbtnRemFavOutrosClick(Sender: TObject);
    procedure qryOutrosAfterScroll(DataSet: TDataSet);
    procedure dbrgrpPermanenteOutrosClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure qryOutrosBeforePost(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dbdtInicioPAExit(Sender: TObject);
    procedure dbdtIniciooutrosExit(Sender: TObject);
    procedure fcsbtnRubXPAClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure qryOutrosAfterInsert(DataSet: TDataSet);
    procedure dblkpcmbBenefChange(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblcRubricaPAExit(Sender: TObject);
    procedure EliminaRubricaClick(Sender: TObject);
    procedure sbtnRubClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure fcsbtnEstadoPAClick(Sender: TObject);
    procedure fcsbtnEstadoOutrosClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dblkpcmbBenefCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure spedparcelasoutrosExit(Sender: TObject);
    procedure dblcRegraOutrosCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcRegraPACloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure spedParcelasPAExit(Sender: TObject);
    procedure dbchkAbonoPAClick(Sender: TObject);
    procedure dbcboxAbonoOutrosClick(Sender: TObject);
    procedure dbchkBasePAClick(Sender: TObject);
    procedure btnAlimentadosClick(Sender: TObject);
    procedure dblcRubricaOutrosExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcRubricaPACloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcRubricaOutrosCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure dbcboxControlaSaldoClick(Sender: TObject);
    procedure dbrgrpPermanentePAChange(Sender: TObject);
    procedure dbrgrpPermanenteOutrosChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject); // SOL 140042 Kintana 900220
    procedure qryAfterScroll(DataSet: TDataSet); //SOL 140042 Kintana 900220
  private
    { Private declarations }
    sldbgrdDet, sldbgrdoutros: TStringList; // SOL 140042 Kintana 900220
    
    iidtitular, iidpessoa, iidplanoprev, iidpessjur, iidrecebedor, iidpessoaesc : longint;
    function PegaSeqRubricaIndiv(qryRub : twwquery) : longint;
    function PegaAnoMesRef(acbMes : tcombobox; aspAno : tspinedit) : string;
    procedure ProcessaRecebedor;
    procedure ProcessaRubricas;
    procedure VerificaAssociacaoRubrica;
    procedure CalculaDataInicio(qry : twwquery);
    procedure CalculaDataFinal(qry : twwquery);
    procedure CalculaParcelas(qry : twwquery);
    function InserePessoaFisica(aiidpessoa: integer): boolean;
    function VerificaDadosPF(aiidpessoa: integer): boolean;
    procedure AtivaCampos;
    procedure MontaQryOutros;
    procedure MontaQryRubricasPA;
    procedure MontaQryRubricasOutrosProc;
    procedure MontaQryRubricasOutrosFav;
    procedure MontaQryDet;
    function VerificaRegraPorTipoRegra(ds: tdataset): boolean;
  public
    { Public declarations }
    bApagou: Boolean;
    nAbono: Real;
    procedure SetaEstado(bAtiva: boolean; fcbtn: TfcShapeBtn);
    procedure HabilitaProcInss;
    function BuscaPlanoContabil(idPessoa : integer ; iFlgInss : integer ; iIDRubrica : Integer) : string;   // SOL 119865 e 118773 Daniel Begnami
  end;

var
  frmCadRubricaIndiv: TfrmCadRubricaIndiv;

implementation

uses FTelaAut, UMensErro, uAdmPrevFB, UDataBase, UdiasUteis, UFuncoesFolha,
     fCadRubXPensaoAlimenticia, uFolhaBenef, USistema, uObjFolha, fCadAlimentados, dFolha, dBasedados;

{$R *.DFM}

procedure TfrmCadRubricaIndiv.VerificaAssociacaoRubrica;
begin
  fcsbtnRubXPA.enabled:=not (
     (qryDet.fieldbyname('idfavorecido').isnull) or
     (qryDet.fieldbyname('idfavorecido').asinteger = 0) or
     (qryDet.fieldbyname('seqrubricaindiv').isnull) or
     (qryDet.fieldbyname('seqrubricaindiv').asinteger = 0));
end;

procedure TfrmCadRubricaIndiv.ProcessaRubricas;
Var
  sUserInclusao : String;
  iUserInclusao : Integer;

begin
  qryDet.Close;
  qryDet.ParamByName('PIDTITULAR').asinteger:=iidtitular;
  qryDet.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qryDet.ParamByName('PIDPESSOA').asinteger:=
    qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger; 
  qryDet.Open;

  While Not qryDet.Eof Do
  Begin
    sUserInclusao := copy(qrydet.FieldByName('TRGUSERINCLUSAO').AsString, 3, Length(qrydet.FieldByName('TRGUSERINCLUSAO').AsString));
    iUserInclusao := StrToIntDef(sUserInclusao, 0);
    If iUserInclusao = 0 Then
    Begin
      qryDet.Edit;
      qryDet.FieldByName('NOME').AsString := qrydet.FieldByName('TRGUSERINCLUSAO').AsString;
      qryDet.Post;
    End
    Else
    Begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iUserInclusao));
      qryAux.Open;

      qryDet.Edit;
      qryDet.FieldByName('NOME').AsString := qryAux.FieldByName('NOME').AsString;
      qryDet.Post;
    End;
    qryDet.Next;
  End;

  qryOutros.Close;
  qryOutros.ParamByName('PIDTITULAR').asinteger:=iidtitular;
  qryOutros.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qryOutros.ParamByName('PIDPESSOA').asinteger:=
    qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger;
  qryOutros.Open;

  While Not qryOutros.Eof Do
  Begin
    sUserInclusao := copy(qryOutros.FieldByName('TRGUSERINCLUSAO').AsString, 3, Length(qryOutros.FieldByName('TRGUSERINCLUSAO').AsString));
    iUserInclusao := StrToIntDef(sUserInclusao, 0);
    If iUserInclusao = 0 Then
    Begin
      qryOutros.Edit;
      qryOutros.FieldByName('NOME').AsString := qryOutros.FieldByName('TRGUSERINCLUSAO').AsString;
      qryOutros.Post;
    End
    Else
    Begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iUserInclusao));
      qryAux.Open;

      qryOutros.Edit;
      qryOutros.FieldByName('NOME').AsString := qryAux.FieldByName('NOME').AsString;

      qryOutros.Post;
    End;
    qryOutros.Next;
  End;

  sbtnExcluiDet.visible:=qryDet.fieldbyname('FLGUSADO').isnull or
                         (qryDet.fieldbyname('FLGUSADO').asinteger=0)
end;

procedure TfrmCadRubricaIndiv.ProcessaRecebedor;
 var sTipo : string;
begin
  // Verificar se a pessoa é TITULAR, BENEFICIARIO OU CONSIGNATARIO
  qry.Close;

  qry.ParamByName('PIDTITULAR').CLEAR;
  qry.ParamByName('PIDPESSOA').CLEAR;
  qry.ParamByName('PIDFUNDACAO').CLEAR;

  qry.ParamByName('PIDTITULAR').asinteger := iidtitular;
  qry.ParamByName('PIDPESSOA').asinteger:=iidrecebedor;
  qry.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qry.Open;
  if qry.recordcount > 0 then
  begin
    ProcessaRubricas;
    case IdentificaTipoPessoa(qryAux, iidTitular, iidrecebedor) of
    'P' : sTipo:='Titular';
    'B' : sTipo:='Beneficiário';
    'T' : sTipo:='Tutor Responsável';
    'R' : sTipo:='Consignatário';
    'F' : sTipo:='Favorecido';
    'N' : sTipo:='Não Identificado';
    end;

    if (sTipo = 'Titular') or (sTipo = 'Beneficiário') or
       (sTipo = 'Tutor Responsável') then 
    begin
      pgctrlDetalhe.Pages[0].visible := true;
      pgctrlDetalhe.Pages[1].visible := true;
      pgctrlDetalhe.activepage:=tbsDet;
      tbcDetalhe.tabs.clear;
      tbcdetalhe.tabs.add('Pensão Alimentícia');
      tbcdetalhe.tabs.add('Outras Rubricas');
      tbcDetalhe.detdbgrids.clear;
      tbcdetalhe.detdbgrids.add('dbgrdDet');
      tbcdetalhe.detdbgrids.add('dbgrdOutrasRubricas');
    end
    else
    begin
      pgctrlDetalhe.Pages[0].visible := false;
      pgctrlDetalhe.Pages[1].visible := true;
      pgctrlDetalhe.activepage:=tbsOutrasRubricas;
      tbcDetalhe.tabs.clear;
      tbcdetalhe.tabs.add('Outras Rubricas');
      tbcDetalhe.detdbgrids.clear;
      tbcdetalhe.detdbgrids.add('dbgrdOutrasRubricas');
    end;
    tbcDetalheChange(tbcDetalhe);
    edTipo.Text:=sTipo;
  end
  else
    edtipo.Text := 'Ativo ';
end;

procedure TfrmCadRubricaIndiv.dblkpcmbBenefChange(Sender: TObject);
begin
  inherited;
  iidrecebedor:=qryBenef.fieldbyname('idpessoa').asinteger;
  ProcessaRecebedor;
end;

function TfrmCadRubricaIndiv.VerificaRegraPorTipoRegra(ds: tdataset): boolean;
 var ssql: string;
begin
  if ds.fieldbyname('IDREGRACALCULO').isnull then
    result:=false
  else
    if SistemaFolha.FlgControleTipoRegra = 0 then
      result:=false
    else
    begin
      if (SistemaFolha.TipoRegraPadrao = qryRegra.fieldbyname('IDTIPOREGRA').asInteger) then
        result := false
      else
      begin
        ssql:='SELECT R.IDREGRA '+
              'FROM REGRA R '+
              'WHERE R.IDTIPOREGRA = '+inttostr(qryRegra.fieldbyname('IDTIPOREGRA').asInteger)+' '+
              'AND R.IDREGRA <> '+inttostr(ds.fieldbyname('IDREGRACALCULO').asinteger)+' '+
              'AND NOT EXISTS (SELECT RI.IDREGRACALCULO '+
                              'FROM RUBRICAINDIV RI '+
                              'WHERE RI.IDTITULAR = '+inttostr(ds.fieldbyname('IDTITULAR').asinteger)+' '+
                              'AND RI.IDEMPRESA = '+inttostr(iidfundacao)+' '+
                              'AND RI.IDPESSOA = '+inttostr(ds.fieldbyname('IDPESSOA').asinteger)+' '+
                              'AND RI.FLGPENSAOALIM = '+inttostr(ds.fieldbyname('FLGPENSAOALIM').asinteger)+' '+
                              'AND RI.FLGTPRUBMANUT = ''1'' '+
                              'AND RI.IDREGRACALCULO = R.IDREGRA) ';
        result:=FazQuery(qryAux, ssql);
      end;
    end;
end;

procedure TfrmCadRubricaIndiv.CmeCadastroConfirma(Sender: TObject);
 var ds: tdataset;
begin
  if pgctrlDetalhe.activepage = tbsDet then
    try
      AplicaAlteracoes([qryDet]);
      ds:=qryDet;
    except
    //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
    on e:Exception do
    begin
      TratarErro(e.Message);
      raise;
    end;
    //Brunno Mattos - KTN 767861 - SOL 132659 Fim
      
    end;
  if pgctrlDetalhe.activepage = tbsOutrasRubricas then
    try
      AplicaAlteracoes([qryOutros]);
      ds:=qryOutros;
    except
    //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
    on e:Exception do
    begin
      TratarErro(e.Message);
      raise;
    end;
    //Brunno Mattos - KTN 767861 - SOL 132659 Fim

    end;

  if VerificaRegraPorTipoRegra(ds) then
    MsgDlg('Existem outras regras do Tipo "'+qryRegra.fieldbyname('DESCREGRA').asstring+
           '" ainda não cadastradas para esta pessoa.'+#13#13+'Favor verificar a necessidade.',
           'Informação', mtInformation, [mbOK], 0);

  FazerVoltarDet;
  CmeDetalhe.Atualizabotoes(Self);
  //BRUNO AZEVEDO SOL 150706 KINTANA 1096846
  //BRUNO AZEVEDO SOL 152850 KINTANA 1160043
  ProcessaRubricas;
  try
    AplicaAlteracoes([qryDet]);
    AplicaAlteracoes([qryOutros]);
    ds:=qryDet;
  except
  //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
  on e:Exception do
  begin
    TratarErro(e.Message);
    raise;
  end;
  //Brunno Mattos - KTN 767861 - SOL 132659 Fim
    
  end;
  {if pgctrlDetalhe.activepage = tbsDet then
    try
      AplicaAlteracoes([qryDet]);
      ds:=qryDet;
    except
      raise;
    end;
  if pgctrlDetalhe.activepage = tbsOutrasRubricas then
    try
      AplicaAlteracoes([qryOutros]);
      ds:=qryOutros;
    except
      raise;
    end;}
  dblkpcmbBenef.enabled:=true;
end;

procedure TfrmCadRubricaIndiv.SetaEstado(bAtiva: boolean; fcbtn: TfcShapeBtn);
begin
  if bAtiva then
  begin
    fcbtn.font.color:=clNavy;
    fcbtn.color:=$00408000;
    fcbtn.caption:='ATIVO';
  end
  else
  begin
    fcbtn.font.color:=clNavy;
    fcbtn.color:=clRed;
    fcbtn.caption:='SUSPENSO';
  end;
end;

procedure TfrmCadRubricaIndiv.tbcDetalheChange(Sender: TObject);
begin
  If IdentificaTipoPessoa(qryAux, iidTitular, iidrecebedor) <> 'R' Then
    inherited;

  if tbcDetalhe.detdbGrids.count > 0 then
  begin
    grdAtual:=TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
    if grdAtual <> nil then
      qryAtual:=TwwQuery(grdAtual.DataSource.DataSet)
    else
      qryAtual:=nil;

    if tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '' then
      tb97BotoesDetalhe.Visible:=false
    else
      tb97BotoesDetalhe.Visible:=true;

    if pgctrlDetalhe.Pages[0].visible then
      pgctrlDetalhe.ActivePage:=TTabSheet(pgctrlDetalhe.Pages[tbcDetalhe.TabIndex])
    Else
      pgctrlDetalhe.ActivePage:=TTabSheet(pgctrlDetalhe.Pages[1]);

    bbtnVoltarDetClick(Self);
  end;

//  Jéssica Lana SOL 123122  
//  MontaSelectFAV.tabelas.clear;
//  MontaSelectFAV.tabelas.add('PESSOA');
//  MontaSelectFAV.tabelas.add('FORNSERV');
//  MontaSelectFAV.filtro.clear;
//  MontaSelectFAV.filtro.add('PESSOA.IDPESSOA = FORNSERV.IDPESSOA');

  if pgctrlDetalhe.activepage = tbsDet then
  begin
    MontaQryRubricasPA;
    sbtnExcluiDet.visible:=qryDet.fieldbyname('FLGUSADO').isnull or
                           (qryDet.fieldbyname('FLGUSADO').asinteger=0);
    //MontaSelectFAV.tabelas.add('PESSOAFISICA');   //SOL 126895
    //MontaSelectFAV.filtro.add('PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'); //SOL126895
  end
  else
  begin
    MontaQryRubricasOutrosProc;
    sbtnExcluiDet.visible:=qryOutros.fieldbyname('FLGUSADO').isnull or
                           (qryOutros.fieldbyname('FLGUSADO').asinteger=0);
  end;
end;

procedure TfrmCadRubricaIndiv.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryDet.Active then Exit;

  VerificaAssociacaoRubrica;
  grpParcelasPA.Visible:=qryDet.FieldByName('FLGPERMANENTE').AsInteger <> 1;
  grpMesReferenciaPA.Visible:=qryDet.FieldByName('FLGPERMANENTE').AsInteger <> 1;
  dbdtFinalPA.Visible:=
    (qryDet.FieldByName('FLGPERMANENTE').AsInteger <> 1) or
    SistemaFolha.FlgForcaDataFinalRubIndiv; 
  lblAtePA.visible:=(qryDet.FieldByName('FLGPERMANENTE').AsInteger <> 1) or
    SistemaFolha.FlgForcaDataFinalRubIndiv; 

  SetaEstado(qryDet.fieldbyname('FLGDESATIVADO').isnull or
             (qryDet.fieldbyname('FLGDESATIVADO').asinteger=0), fcsbtnEstadoPA);
  sbtnExcluiDet.visible:=qryDet.fieldbyname('FLGUSADO').isnull or
                         (qryDet.fieldbyname('FLGUSADO').asinteger=0);

  if grpMesReferenciaPA.Visible then
  begin
    if not qryDet.FieldByName('ANOMESREF').isnull then
      if (length(qryDet.FieldByName('ANOMESREF').asstring) = 7) then
        try
          cmb_mesrefPA.ItemIndex:=StrToInt(Copy(qryDet.FieldByName('ANOMESREF').asstring,6,2))-1;
          spn_anorefPA.Value:=StrToInt(Copy(qryDet.FieldByName('ANOMESREF').asstring,1,4));
        except
        end;
  end
  else
    if qryDet.state in [dsInsert, dsEdit] then
      qryDet.FieldByName('ANOMESREF').clear;

  // SOL 140042 Kintana 900220
  // SOL 163942 Kintana 1404260
  //AJUSTE BRUNO!!!!!!!!!!!!!!
  if qryDet.state in [dsEdit] then begin
    edtAnoMesReembPA.Visible           := (qryDet.FieldByName('MESCOMPREEM').asstring <> '');
    //cmb_mesreembPA.Visible           := (qryDet.FieldByName('MESCOMPREEM').asstring <> '');
    //spn_anoreembPA.Visible           := (qryDet.FieldByName('MESCOMPREEM').asstring <> '');
    grpMesReembolcoPA.Visible        := (qryDet.FieldByName('MESCOMPREEM').asstring <> '');
  end;
  // SOL 163942 Kintana 1404260
  if grpMesReembolcoPA.Visible then
  begin
    if qryDet.state in [dsinsert] then
    begin
       //cmb_mesreemboutros.ItemIndex:= -1 ;
       //spn_anoreemboutros.Value := 0;
    end
    else
    if not qryDet.FieldByName('MESCOMPREEM').isnull then
    begin
      if (length(qryDet.FieldByName('MESCOMPREEM').asstring) = 7) then
      begin
        try
          //BRUNO AZEVEDO SOL 140042/6601
          //cmb_mesreembPA.ItemIndex:=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,6,2))-1;
          //spn_anoreembPA.Value:=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,1,4));
          edtAnoMesReembPA.Text := qryDet.FieldByName('MESCOMPREEM').asstring;
          //BRUNO AZEVEDO SOL 140042/6601
        except
        end;
      end
      else
      begin
         //BRUNO AZEVEDO 6601
         //cmb_mesreembPA.ItemIndex:= -1;
         //spn_anoreembPA.Value:= 0;
         edtAnoMesReembPA.Text := '';
         //BRUNO AZEVEDO 6601
      end;
    end
    else
    begin
       //BRUNO AZEVEDO 6601
       //cmb_mesreembPA.ItemIndex:= -1;
       //spn_anoreembPA.Value:= 0;
       edtAnoMesReembPA.Text := '';
       //BRUNO AZEVEDO 6601
    end;
  end
  else
    if qryDet.state in [dsInsert, dsEdit] then
      qryDet.FieldByName('MESCOMPREEM').clear;
  // SOL 140042 Kintana 900220
end;

procedure TfrmCadRubricaIndiv.qryOutrosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryOutros.Active then Exit;

  grpParcelasOutros.Visible:=qryOutros.FieldByName('FLGPERMANENTE').AsInteger <> 1;
  grpMesReferenciaOutros.Visible:=qryOutros.FieldByName('FLGPERMANENTE').AsInteger <> 1;
  dbdtFinalOutros.Visible:=(qryOutros.FieldByName('FLGPERMANENTE').AsInteger <> 1) or
    SistemaFolha.FlgForcaDataFinalRubIndiv; 
  lblAteOutros.visible:=(qryOutros.FieldByName('FLGPERMANENTE').AsInteger <> 1) or
    SistemaFolha.FlgForcaDataFinalRubIndiv;
  SetaEstado(qryOutros.fieldbyname('FLGDESATIVADO').isnull or
     (qryOutros.fieldbyname('FLGDESATIVADO').asinteger=0), fcsbtnEstadoOutros);
  sbtnExcluiDet.visible:=qryOutros.fieldbyname('FLGUSADO').isnull or
    (qryOutros.fieldbyname('FLGUSADO').asinteger=0);

  if grpMesReferenciaOutros.Visible then
  begin
    if not qryOutros.FieldByName('ANOMESREF').isnull then
      if (length(qryOutros.FieldByName('ANOMESREF').asstring) = 7) then
        try
          cmb_mesrefoutros.ItemIndex:=StrToInt(Copy(qryOutros.FieldByName('ANOMESREF').asstring,6,2))-1;
          spn_anorefoutros.Value:=StrToInt(Copy(qryOutros.FieldByName('ANOMESREF').asstring,1,4));
        except
        end;
  end
  else
    if qryOutros.state in [dsInsert, dsEdit] then
      qryOutros.FieldByName('ANOMESREF').clear;

  //SOL 140042 Kintana 900220
  // SOL 163942 Kintana 1404260
  //AJUSTE BRUNO!!!!!!!!!!!!!!
  if qryOutros.state in [dsEdit] then begin
    //BRUNO AZEVEDO SOL 140042/6601
    edtAnoMesReembOutros.Visible           := (qryOutros.FieldByName('MESCOMPREEM').asstring <> '');
    //BRUNO AZEVEDO SOL 140042/6601
    //cmb_mesreemboutros.Visible           := (qryOutros.FieldByName('MESCOMPREEM').asstring <> '');
    //spn_anoreemboutros.Visible           := (qryOutros.FieldByName('MESCOMPREEM').asstring <> '');
    GroupBox5.Visible                    := (qryOutros.FieldByName('MESCOMPREEM').asstring <> '');
  end;
  // SOL 163942 Kintana 1404260
  if edtAnoMesReembOutros.Visible then
  begin
    if qryOutros.state in [dsinsert] then
    begin
       //BRUNO AZEVEDO SOL 140042/6601
       edtAnoMesReembOutros.Text := '';
       //cmb_mesreemboutros.ItemIndex:= -1 ;
       //spn_anoreemboutros.Value := 0;
       //BRUNO AZEVEDO SOL 140042/6601
    end
    else
    if not qryOutros.FieldByName('MESCOMPREEM').isnull then
    BEGIN
      if (length(qryOutros.FieldByName('MESCOMPREEM').asstring) = 7) then
      BEGIN
        try
          //BRUNO AZEVEDO SOL 140042/6601
          //cmb_mesreemboutros.ItemIndex:=StrToInt(Copy(qryOutros.FieldByName('MESCOMPREEM').asstring,6,2))-1;
          //spn_anoreemboutros.Value:=StrToInt(Copy(qryOutros.FieldByName('MESCOMPREEM').asstring,1,4));
          edtAnoMesReembOutros.Text := qryOutros.FieldByName('MESCOMPREEM').asstring;
          //BRUNO AZEVEDO SOL 140042/6601
        except
        end;
      end
      else
      begin
        //BRUNO AZEVEDO SOL 140042/6601
        //cmb_mesreemboutros.ItemIndex:= -1 ;
        //spn_anoreemboutros.Value := 0;
        edtAnoMesReembOutros.Text := '';
        //BRUNO AZEVEDO SOL 140042/6601
      end;
    end
    ELSE
    BEGIN
       //BRUNO AZEVEDO SOL 140042/6601
       //cmb_mesreemboutros.ItemIndex:= -1 ;
       //spn_anoreemboutros.Value := 0;
       edtAnoMesReembOutros.Text := '';
       //BRUNO AZEVEDO SOL 140042/6601
    END;
  end
  else
    if qryOutros.state in [dsInsert, dsEdit] then
      qryOutros.FieldByName('MESCOMPREEM').clear;

  //SOL 140042 Kintana 900220

end;

procedure TfrmCadRubricaIndiv.dbrgrpPermanentePAClick(Sender: TObject);
begin
  inherited;
  grpParcelasPA.Visible:=dbrgrpPermanentePA.ItemIndex <> 0;
  dbdtFinalPA.Visible:=(dbrgrpPermanentePA.ItemIndex <> 0) or
    SistemaFolha.FlgForcaDataFinalRubIndiv; 
  lblAtePA.visible:=(dbrgrpPermanentePA.ItemIndex <> 0) or
    SistemaFolha.FlgForcaDataFinalRubIndiv; 
  grpMesReferenciaPA.Visible:=dbrgrpPermanentePA.ItemIndex <> 0;
end;

procedure TfrmCadRubricaIndiv.dbrgrpPermanenteOutrosClick(Sender: TObject);
begin
  inherited;
  grpParcelasOutros.Visible:=dbrgrpPermanenteOutros.ItemIndex <> 0;
  dbdtFinalOutros.Visible:=(dbrgrpPermanenteOutros.ItemIndex <> 0) or
    SistemaFolha.FlgForcaDataFinalRubIndiv;
  lblAteOutros.visible:=(dbrgrpPermanenteOutros.ItemIndex <> 0) or
    SistemaFolha.FlgForcaDataFinalRubIndiv; 
  grpMesReferenciaOutros.Visible:=dbrgrpPermanenteOutros.ItemIndex <> 0;

  if (GroupBox5.Visible) then begin
    if (dbrgrpPermanenteOutros.ItemIndex = 0) then begin
      edtAnoMesReembOutros.Text := '';
    end;
  end;
end;

function TfrmCadRubricaIndiv.PegaSeqRubricaIndiv(qryRub : twwquery) : longint;
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT MAX(SEQRUBRICAINDIV) AS SEQRUBRICAINDIV '+
                   ' FROM RUBRICAINDIV '+
                   ' WHERE IDPESSOA = ' + inttostr(iidrecebedor)+
                   ' AND IDEMPRESA = ' + IntToStr(iIdFundacao)+
                   ' AND IDRUBRICA = ' + qryRub.FieldByName('IDPROVENTO').AsString);
    qryAux.Open;
    if (not qryAux.IsEmpty) and (qryAux.FieldByName('SEQRUBRICAINDIV').AsInteger > 0 ) then
      result:=qryAux.FieldByName('SEQRUBRICAINDIV').AsInteger + 1
    else
      result:=1;
    qryaux.close;
  except
    result:=1;
  end;
end;

function TfrmCadRubricaIndiv.PegaAnoMesRef(acbMes : tcombobox; aspAno : tspinedit) : string;
begin
  result:='';
  if aspAno.value > 0 then
  begin
    result:=Trim(aspAno.Text) + '/';
    if acbMes.ItemIndex >= 0 then
    begin
      if acbMes.ItemIndex <= 8 then
        result:=result+'0'+IntToStr(acbMes.ItemIndex+1)
      else
        result:=result+IntToStr(acbMes.ItemIndex+1);
    end;
  end;
end;

procedure TfrmCadRubricaIndiv.qryDetBeforePost(DataSet: TDataSet);
 var sanomesref, sanomesreemb : string; // SOL 140042 Kintana 900220
begin
  inherited;
  // Gravar campos internos
  qryDet.FieldByName('FLGTPRUBMANUT').Asstring  := '1';
  if qryDet.FieldByName('NUMOCORRENCIAS').AsString = '' then
    qryDet.FieldByName('NUMOCORRENCIAS').AsInteger := 0;
  if qryDet.FieldByName('PARCELAS').AsString = '' then
    qryDet.FieldByName('PARCELAS').AsInteger := 0;
  qryDet.FieldByName('FLGPENSAOALIM').AsInteger := 1;
  if qryDet.fieldbyname('FLGPERMANENTE').asinteger = 0 then
  begin
    sanomesref:=PegaAnoMesRef(cmb_mesrefPA, spn_anorefPA);
    if sanomesref <> '' then
      qryDet.FieldByName('ANOMESREF').asstring:=sanomesref;
  end
  else
  begin
    //BRUNO AZEVEDO SOL 130928 KINTANA 738408
    if ((qryDet.FieldByName('DESCPARCIAL').AsInteger = 1) and
        (qryDet.FieldByName('PRAZO').AsInteger = 1) and
        (qryDet.FieldByName('FLGDESCONTO').AsInteger = 1) and
        (qryDet.FieldByName('FLGINSS').AsInteger = 0) and
        (qryDet.FieldByName('FLGIRRF').AsInteger = 0)) then begin
      qryDet.FieldByName('PARCELAS').AsInteger := 1;
    end else begin
      qryDet.FieldByName('ANOMESREF').clear;
      qryDet.FieldByName('PARCELAS').AsInteger := 999;  //SOL124381 Adler
    end;
  end;
  if (fcsbtnEstadoPA.caption = 'ATIVO') then
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=0
  else
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=1;

  qryDet.FieldByName('NUMPROCINSS').AsString := dbedtNumProcInss.Text;

  if qryDet.State = dsInsert then
    if qryDet.FieldByName('SEQRUBRICAINDIV').isnull then begin
       qryDesconto.Filtered := false; // SOL 164018 Kintana 1406595
       qryDesconto.Filter   := ' IDPROVENTO = '''+IntToStr(qryDet.FieldByName('IDRUBRICA').AsInteger)+'''';
       qryDesconto.Filtered := True;
       qryDet.FieldByName('SEQRUBRICAINDIV').AsInteger:=  PegaSeqRubricaIndiv(qryDesconto);
       qryDesconto.Filtered := False; //SOL 164018 Kintana 1406595
    end;

  if (qryDet.State in [dsEdit,dsInsert]) then 
    if qryDet.FieldByName('IDSEQINTERNOFB').isnull then
      qryDet.FieldByName('IDSEQINTERNOFB').asinteger := LeUltRegistro(nil, 'SEQINTERNOFB');
  //SOL 140042 Kintana 900220
  if grpMesReembolcoPA.Visible then
  begin
     //BRUNO AZEVEDO SOL 140042/6601
     sanomesreemb := edtAnoMesReembPA.Text;
     //sanomesreemb :=PegaAnoMesRef(cmb_mesreembPA, spn_anoreembPA);
     //BRUNO AZEVEDO SOL 140042/6601
     if (Trim(sanomesreemb) <> '/') then begin
        qryDet.FieldByName('MESCOMPREEM').asstring:=sanomesreemb;
     end else begin
       qryDet.FieldByName('MESCOMPREEM').asstring:= '';
     end;
  end else begin
    qryDet.FieldByName('MESCOMPREEM').asstring:= '';
  end;
  // SOL 140042 Kintana 900220
end;

procedure TfrmCadRubricaIndiv.qryOutrosBeforePost(DataSet: TDataSet);
 var sanomesref, sanomesreemb : string;
begin
  inherited;
  // Gravar campos internos
  qryOutros.FieldByName('IDEMPRESA').AsInteger:=iIdFundacao;

  qryOutros.FieldByName('IDPESSOA').AsInteger      := qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger;
  qryOutros.FieldByName('IDTITULAR').AsInteger     := iidtitular;
  qryOutros.FieldByName('IDRUBRICA').AsInteger     := StrToInt(dblcRubricaOutros.LookupValue);
  qryOutros.FieldByName('FLGTPRUBMANUT').asstring  := '1';
  if qryOutros.FieldByName('NUMOCORRENCIAS').AsString = '' then
    qryOutros.FieldByName('NUMOCORRENCIAS').AsInteger := 0;
  if qryOutros.FieldByName('PARCELAS').AsString = '' then
    qryOutros.FieldByName('PARCELAS').AsInteger := 0;

  if qryOutros.State = dsInsert then begin
    qryRubricaOutros.Filtered := false; // SOL 164018 Kintana 1406595
    qryRubricaOutros.Filter   := ' IDPROVENTO = '''+IntToStr(qryOutros.FieldByName('IDRUBRICA').AsInteger)+'''';
    qryRubricaOutros.Filtered := True;
    qryOutros.FieldByName('SEQRUBRICAINDIV').AsInteger:=PegaSeqRubricaIndiv(qryRubricaOutros);
    qryRubricaOutros.Filtered := False; // SOL 164018 Kintana 1406595
  end;

  //Renato Visoni SOL 129270 Kintana 709354
  If qryRubricaOutros.FieldByName('CODFONTEPAGADORA').AsInteger = 2 Then begin

    QryProcInss.Close;
    QryProcInss.ParamByname('IDPESSOA').asInteger :=  qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger;
    QryProcInss.Open;
    QryProcInss.First;

    qryOutros.FieldByName('NUMPROCINSS').asstring := QryProcInss.FieldByname('NUMPROCINSS').asString;
  end else begin
    qryOutros.FieldByName('NUMPROCINSS').asstring :='';
  end;
  //Renato Visoni SOL 129270 Kintana 709354



  qryOutros.FieldByName('FLGPENSAOALIM').AsInteger := 0;
  if qryOutros.fieldbyname('FLGPERMANENTE').asinteger = 0 then
  begin
    sanomesref:=PegaAnoMesRef(cmb_mesrefoutros, spn_anorefoutros);
    if sanomesref <> '' then
      qryOutros.FieldByName('ANOMESREF').asstring:=sanomesref;
  end
  else
  begin
    //BRUNO AZEVEDO SOL 130928 KINTANA 738408
    if ((qryOutros.FieldByName('DESCPARCIAL').AsInteger = 1) and
        (qryOutros.FieldByName('PRAZO').AsInteger = 1) and
        (qryOutros.FieldByName('FLGDESCONTO').AsInteger = 1) and
        (qryOutros.FieldByName('FLGINSS').AsInteger = 0) and
        (qryOutros.FieldByName('FLGIRRF').AsInteger = 0)) then begin
      qryOutros.FieldByName('PARCELAS').AsInteger := 1;
    end else begin
      qryOutros.FieldByName('ANOMESREF').clear;
      qryOutros.FieldByName('PARCELAS').AsInteger := 999;  //SOL124381 Adler
    end;
  end;
  if (fcsbtnEstadoOutros.caption = 'ATIVO') then
    qryOutros.FieldByName('FLGDESATIVADO').asinteger:=0
  else
    qryOutros.FieldByName('FLGDESATIVADO').asinteger:=1;

  if qryOutros.FieldByName('IDSEQINTERNOFB').isnull then
    qryOutros.FieldByName('IDSEQINTERNOFB').asinteger := LeUltRegistro(nil, 'SEQINTERNOFB');

  //SOL 140042 Kintana 900220
  if edtAnoMesReembOutros.Visible then
  begin
     //BRUNO AZEVEDO SOL 140042/6601
     sanomesreemb := edtAnoMesReembOutros.Text;
     //BRUNO AZEVEDO SOL 140042/6601
     if (Trim(sanomesreemb) <> '/') then begin
        qryOutros.FieldByName('MESCOMPREEM').asstring:=sanomesreemb;
     end else begin
       qryOutros.FieldByName('MESCOMPREEM').asstring:= '';
     end;
  end else begin
    qryOutros.FieldByName('MESCOMPREEM').asstring:= '';
  end;
  // SOL 140042 Kintana 900220
end;

procedure TfrmCadRubricaIndiv.CalculaDataInicio(qry : twwquery);
 var d,m,a : word;
begin
  decodedate(now,a,m,d);
  qry.fieldbyname('DATAINICIO').asdatetime:=encodedate(a,m,1);
  qry.fieldbyname('ANOMESREF').asstring:=
    formatdatetime('yyyy/mm', qry.fieldbyname('DATAINICIO').asdatetime);
  //SOL 140042 Kintana 900220
  if qryOutros.state in [dsinsert, dsedit] then
  begin
     //qryOutros.fieldbyname('MESCOMPREEM').asstring := formatdatetime('yyyy/mm', qry.fieldbyname('DATAINICIO').asdatetime);
     //BRUNO AZEVEDO SOL 140042/6601
     //cmb_mesreemboutros.ItemIndex :=StrToInt(Copy(qryOutros.FieldByName('MESCOMPREEM').asstring,6,2))-1;
     //spn_anoreemboutros.Value :=StrToInt(Copy(qryOutros.FieldByName('MESCOMPREEM').asstring,1,4));
     //edtAnoMesReembOutros.Text := qryOutros.FieldByName('MESCOMPREEM').asstring;
     //BRUNO AZEVEDO SOL 140042/6601
  end;
  if qryDet.state in [dsinsert, dsedit] then
  begin
     //qryDet.FieldByName('MESCOMPREEM').asstring := formatdatetime('yyyy/mm', qry.fieldbyname('DATAINICIO').asdatetime);
     //BRUNO AZEVEDO SOL 140042/6601
     //cmb_mesreembPA.ItemIndex:=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,6,2))-1;
     //spn_anoreembPA.Value:=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,1,4));
     //edtAnoMesReembPA.Text := qryDet.FieldByName('MESCOMPREEM').asstring;
     //BRUNO AZEVEDO SOL 140042/6601
  end;
  //SOL 140042 Kintana 900220
end;

procedure TfrmCadRubricaIndiv.CalculaDataFinal(qry : twwquery);
 var nMeses : integer;
     dt : tdatetime;
     d,m,a : word;
     d1,m1,a1,d2,m2,a2 : word;
     EmQueMes : integer;
begin
  nMeses:=qry.fieldbyname('PARCELAS').asinteger;
  dt:=DiasUteis.SomaMeses(qry.fieldbyname('DATAINICIO').asdatetime,nMeses-1);
  decodedate(dt,a,m,d);
  dt:=DiasUteis.UltDiaMes(a,m);
  qry.fieldbyname('DATAFINAL').asdatetime:=dt;

  decodedate(qry.fieldbyname('DATAFINAL').asdatetime,a2,m2,d2);
  decodedate(qry.fieldbyname('DATAINICIO').asdatetime,a1,m1,d1);
  nmeses := (a2-a1-1)*12+(12+m2-m1)+1;

  nAbono := Int((((m1+nMeses)-1))/12);

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if dbchkAbonoPA.Checked then
    begin
      EmQueMes := m - Trunc(nAbono);
      if EmQueMes = 0 then
      begin
        EmQueMes := 12;
        m        := EmQueMes;
        a        := a - 1;
        dt       := EncodeDate(a,m,d);
        DecodeDate(dt,a,m,d);
        dt  := DiasUteis.UltDiaMes(a,m);
        qry.FieldByName('DATAFINAL').AsDateTime:=dt;
      end
      else
      begin
        if EmQueMes < 0 then
        begin
          EmQueMes := -(EmQueMes);
          m   := 12 - EmQueMes;
          a   := a - 1;
          dt  := EncodeDate(a,m,d);
          DecodeDate(dt,a,m,d);
          dt  := DiasUteis.UltDiaMes(a,m);
          qry.FieldByName('DATAFINAL').AsDateTime:=dt;
        end
        else
        begin
          if EmQueMes > 0 then
          begin
            m   := EmQueMes;
            dt  := EncodeDate(a,m,d);
            DecodeDate(dt,a,m,d);
            dt  := DiasUteis.UltDiaMes(a,m);
            qry.FieldByName('DATAFINAL').AsDateTime:=dt;
          end;
        end;
      end;
    end
  end
  else
  begin
    if dbcboxAbonoOutros.Checked then
    begin
      EmQueMes := m - Trunc(nAbono);
      if EmQueMes = 0 then
      begin
        EmQueMes := 12;
        m        := EmQueMes;
        a        := a - 1;
        dt       := EncodeDate(a,m,d);
        DecodeDate(dt,a,m,d);
        dt  := DiasUteis.UltDiaMes(a,m);
        qry.FieldByName('DATAFINAL').AsDateTime:=dt;
      end
      else
      begin
        if EmQueMes < 0 then
        begin
          EmQueMes := -(EmQueMes);
          m   := 12 - EmQueMes;
          a   := a - 1;
          dt  := EncodeDate(a,m,d);
          DecodeDate(dt,a,m,d);
          dt  := DiasUteis.UltDiaMes(a,m);
          qry.FieldByName('DATAFINAL').AsDateTime:=dt;
        end
        else
        begin
          if EmQueMes > 0 then
          begin
            m   := EmQueMes;
            dt  := EncodeDate(a,m,d);
            DecodeDate(dt,a,m,d);
            dt  := DiasUteis.UltDiaMes(a,m);
            qry.FieldByName('DATAFINAL').AsDateTime:=dt;
          end;
        end;
      end;
    end
  end;
end;

procedure TfrmCadRubricaIndiv.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IDFAVORECIDO').clear;
  qryDet.FieldByName('IDEMPRESA').asinteger:=iIdFundacao;

  qryDet.FieldByName('IDPESSOA').asinteger:= qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger;
  qryDet.FieldByName('IDTITULAR').asinteger:=iidtitular;
  qryDet.fieldbyname('FLGUSAABONO').asinteger:=0;
  qryDet.fieldbyname('FLGANTECIPABONO').asinteger:=0;
  qryDet.FieldByName('FLGPERMANENTE').asinteger:=0;
  qryDet.FieldByName('PARCELAS').AsInteger:=1;
  qryDet.fieldbyname('NUMOCORRENCIAS').asinteger:=0;
  qryDet.FieldByName('FLGUSADO').asinteger:=0;
  qryDet.FieldByName('FLGDESATIVADO').asinteger:=0;
  SetaEstado(true, fcsbtnEstadoPA);
  CalculaDataInicio(qryDet);
  CalculaDataFinal(qryDet);

  //AJUSTE BRUNO!!!
  //BRUNO AZEVEDO SOL 140042/6601
  edtAnoMesReembPA.Visible    := False;
  //cmb_mesreembPA.Visible    := False;
  //spn_anoreembPA.Visible    := False;
  //BRUNO AZEVEDO SOL 140042/6601
  grpMesReembolcoPA.Visible := False;
end;

procedure TfrmCadRubricaIndiv.qryOutrosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  edCPFFavOutros.Clear;  
  edNomeFavOutros.Clear; 

  qryOutros.FieldByName('IDFAVORECIDO').clear;
  qryOutros.FieldByName('IDEMPRESA').AsInteger:= iIdFundacao;

  qryOutros.FieldByName('IDPESSOA').AsInteger:= qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger;
  qryOutros.FieldByName('IDTITULAR').AsInteger:= iidtitular;
  qryOutros.fieldbyname('FLGUSAABONO').asinteger:=0;
  qryOutros.fieldbyname('FLGANTECIPABONO').asinteger:=0;
  qryOutros.FieldByName('FLGPERMANENTE').asinteger:=0;
  qryOutros.FieldByName('PARCELAS').AsInteger:=1;
  qryOutros.fieldbyname('NUMOCORRENCIAS').asinteger:=0;
  qryOutros.FieldByName('FLGUSADO').asinteger:=0;
  qryOutros.FieldByName('FLGDESATIVADO').asinteger:=0;

  qryOutros.FieldByName('FLGCONTROLASALDO').asinteger:=0;
  qryOutros.FieldByName('VLRSALDOINICIAL').asfloat:=0;
  qryOutros.FieldByName('VLRTOTALPROC').asfloat:=0;

  qryOutros.FieldByName('NUMPROCINSS').asfloat:=0; //Renato Visoni SOL 129270 Kintana 709354


  SetaEstado(true, fcsbtnEstadoOutros);
  CalculaDataInicio(qryOutros);
  CalculaDataFinal(qryOutros);

  //AJUSTE BRUNO
  //BRUNO AZEVEDO SOL 140042/6601
  edtAnoMesReembPA.Visible   := False;
  //cmb_mesreemboutros.Visible := False;
  //spn_anoreemboutros.Visible := False;
  //BRUNO AZEVEDO SOL 140042/6601
  GroupBox5.Visible          := False;
end;

procedure TfrmCadRubricaIndiv.dbdtInicioPAExit(Sender: TObject);
begin
  inherited;
  if ((dbrgrpPermanentePA.ItemIndex = 1) and (spedParcelasPA.value > 0)) then
  begin
    CalculaDataFinal(qryDet);
    dbdtfinalPA.Update;
  end;
end;

procedure TfrmCadRubricaIndiv.dbdtIniciooutrosExit(Sender: TObject);
begin
  inherited;
  if ((dbrgrpPermanenteoutros.ItemIndex = 1) and (spedparcelasoutros.value > 0)) then
  begin
    CalculaDataFinal(qryOutros);
    dbdtfinaloutros.Update;
  end;
end;

procedure TfrmCadRubricaIndiv.CalculaParcelas(qry : twwquery);
 var nmeses : integer;
     dt : tdatetime;
     d1,m1,a1,d2,m2,a2 : word;
begin
  decodedate(qry.fieldbyname('DATAFINAL').asdatetime,a2,m2,d2);
  decodedate(qry.fieldbyname('DATAINICIO').asdatetime,a1,m1,d1);
  nmeses:=(a2-a1-1)*12+(12+m2-m1)+1;
  nAbono := Int((((m1+nMeses)-1))/12);
end;

procedure TfrmCadRubricaIndiv.AtivaCampos;
begin
  spedNumOcorrenciasPA.Enabled:=True;
  dblcRubricaPA.Enabled:=True;
  dblcRubricaFavPA.Enabled:=True;

  spedNumOcorrenciasOutros.Enabled:=True;
  dblcRubricaOutros.Enabled:=True;
  dblcRubricaFavOutros.Enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);

  dblkpcmbBenef.Enabled:=True;
end;

procedure TfrmCadRubricaIndiv.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  dock974.visible:=false;
  bApagou := true;
end;

function TfrmCadRubricaIndiv.VerificaDadosPF(aiidpessoa: integer): boolean;
begin
  if not FazQuery(qryAux, 'select p.nome from pessoa p,contabancaria c '+
                          'where p.numdocumento is not null '+
                          'and c.idpessoa = p.idpessoa '+
                          'and p.idpessoa = '+inttostr(aiidpessoa)) then
  begin
    MsgDlg('A pessoa selecionada não tem cadastradas as informações de Nº de CPF e/ou '+#13#13+
           'conta corrente.','Erro', mtError, [mbOK], 0);
    result := false;
  end
  else
    result := true;
end;

function TfrmCadRubricaIndiv.InserePessoaFisica(aiidpessoa: integer): boolean;
begin
  if not FazQuery(qryAux, 'select idpessoa '+
                          'from pessoafisica '+
                          'where idpessoa = '+inttostr(aiidpessoa)) then
  begin
    result:=MsgDlg('A pessoa selecionada não tem as informações de Dados Pessoais preenchida. '+#13#13+
                   'O sistema pode alterar automaticamente o cadastro '+
                   'ou você pode cancelar esta operação e entrar na tela de '+
                   'Cadastro/Favorecido, para preencher as informações Dados Pessoais de pessoa física.'+#13#13+
                   'Deseja que o sistema acerte automaticamente o cadastro agora ? (S/N)',
                   'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes;
    if result then
    begin
      if not ExecutarQuery(qryAux,
              'insert into pessoafisica (idpessoa,idestado,numdepirrf) values ('+
              inttostr(aiidpessoa)+',0,0)') then
      begin
        MsgDlg('Não foi possível alterar automaticamente o cadastro da pessoa física. '+#13#13+
               'Por favor entre na tela de Cadastro/Favorecido e preencha as '+
               'informações Dados Pessoais de pessoa física.',
               'Informação', mtWarning, [mbOk, mbHelp], 0);
        result:=false;
      end
      else
        result:=true;
    end;
  end
  else
    result:=true;
end;

procedure TfrmCadRubricaIndiv.sbtnAddFavClick(Sender: TObject);
begin
  inherited;
  MontaSelectFAV.Executar;
  if (MontaSelectFAV.ValoresChave.Count > 0) and
     (MontaSelectFAV.ValoresChave[0] <> '') then
  begin
    if VerificaPessoaFisica(qryAux, StrToInt(MontaSelectFAV.ValoresChave[0])) then
    begin
      if InserePessoaFisica(StrToInt(MontaSelectFAV.ValoresChave[0])) then
      begin
        VerificaDadosPF(StrToInt(MontaSelectFAV.ValoresChave[0]));
        qryDet.FieldByName('IDFAVORECIDO').AsInteger:=StrToInt(MontaSelectFAV.ValoresChave[0]);
        VerificaAssociacaoRubrica;
        edNomeFAVPA.Text:=MontaSelectFAV.ValoresChave[1];
        edCPFFavPA.Text:=MontaSelectFAV.ValoresChave[2];
      end;
    end;
  end;
end;

procedure TfrmCadRubricaIndiv.sbtnRemFavClick(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDFAVORECIDO').clear;
  VerificaAssociacaoRubrica;
  edNomeFAVPA.Text:='';
  edCPFFavPA.Text:='';
  qryDet.FieldByName('RUBRICAPROVENTOPA').clear;
  qryDet.FieldByName('CODPORTFORMA').clear;
end;

procedure TfrmCadRubricaIndiv.sbtnAddFavOutrosClick(Sender: TObject);
begin
  inherited;
  MontaSelectFAV.Executar;
  if (MontaSelectFAV.ValoresChave.Count > 0) and
     (MontaSelectFAV.ValoresChave[0] <> '') then
  begin
    dblcRubricaFavOutros.enabled:=false;
    sbtnRubFavOutros.enabled:=false;
    sbtnRemRubFavOutros.enabled:=false;
    dblcPortFormaOutros.enabled:=false;
    if VerificaPessoaFisica(qryAux, StrToInt(MontaSelectFAV.ValoresChave[0])) then
    begin
      if InserePessoaFisica(StrToInt(MontaSelectFAV.ValoresChave[0])) then
      begin
        VerificaDadosPF(StrToInt(MontaSelectFAV.ValoresChave[0]));
        qryOutros.FieldByName('IDFAVORECIDO').AsInteger := StrToInt(MontaSelectFAV.ValoresChave[0]);
        edNomeFAVOutros.Text:=MontaSelectFAV.ValoresChave[1];
        edCPFFavOutros.Text:=MontaSelectFAV.ValoresChave[2];
        dblcRubricaFavOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
        sbtnRubFavOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
        sbtnRemRubFavOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
        dblcPortFormaOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
      end;
    end
    else
    begin
      qryOutros.FieldByName('IDFAVORECIDO').AsInteger := StrToInt(MontaSelectFAV.ValoresChave[0]);
      edNomeFAVOutros.Text:=MontaSelectFAV.ValoresChave[1];
      edCPFFavOutros.Text:=MontaSelectFAV.ValoresChave[2];
      dblcRubricaFavOutros.text:='';
      dblcPortFormaOutros.text:='';
    end;
  end;
end;

procedure TfrmCadRubricaIndiv.sbtnRemFavOutrosClick(Sender: TObject);
begin
  inherited;
  qryOutros.FieldByName('IDFAVORECIDO').AsString := '';
  edNomeFAVOutros.Text    := '';
  edCPFFavOutros.Text     := '';
  qryOutros.FieldByName('RUBRICAPROVENTOPA').clear;
  qryOutros.FieldByName('CODPORTFORMA').clear;
end;

procedure TfrmCadRubricaIndiv.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnlMestre.enabled:=true;
end;

procedure TfrmCadRubricaIndiv.fcsbtnRubXPAClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRubXPensaoAlimenticia,TFrmCadRubXPensaoAlimenticia,False);
end;

procedure TfrmCadRubricaIndiv.FormCreate(Sender: TObject);
begin
  inherited;
  qryPortadorforma.close;
  qryPortadorforma.sql.clear;
  qryPortadorforma.sql.add('SELECT CODPORTFORMA, DESCRICAO '+
                           'FROM PORTADORFORMA '+
                           'WHERE RECPAG = ''P'' '+
                           ' AND IDPESSOA = '+inttostr(iidfundacao)+' '+
                           'ORDER BY DESCRICAO');
  qryPortadorforma.open;
  sldbgrdDet := TStringList.Create;
  sldbgrdoutros := TStringList.Create;
  // SOL 140042 Kintana 900220
  //BRUNO AZEVEDO SOL 140042/6601
  //cmb_mesreemboutros.ItemIndex:=StrToInt(Copy(datetostr(Date),4,2))-1;
  //spn_anoreemboutros.Value:=StrToInt(Copy(datetostr(Date),7,4));
  //edtAnoMesReembOutros.Text := (Copy(datetostr(Date),7,4)) + '/' + (Copy(datetostr(Date),4,2));
  //BRUNO AZEVEDO SOL 140042/6601

  //BRUNO AZEVEDO SOL 140042/6601
  //cmb_mesreembPA.ItemIndex:=StrToInt(Copy(datetostr(Date),4,2))-1;
  //spn_anoreembPA.Value:=StrToInt(Copy(datetostr(Date),7,4));
  //edtAnoMesReembPA.Text := (Copy(datetostr(Date),7,4)) + '/' + (Copy(datetostr(Date),4,2));
  //BRUNO AZEVEDO SOL 140042/6601
  // SOL 140042 Kintana 900220
end;

procedure TfrmCadRubricaIndiv.FormDestroy(Sender: TObject);  // SOL 140042 Kintana 900220
begin
  inherited;
  FreeAndNil(sldbgrdDet);
  FreeAndNil(sldbgrdoutros);
end;

procedure TfrmCadRubricaIndiv.FormShow(Sender: TObject);
 var ssql: string;
begin
  inherited;
  bapagou := false;

  if SistemaFolha.IdGrupoRegraFolha > 0 then
  begin
    if sistemafolha.FlgAcessoTipoRegra = 0 then
    begin
      ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
            'FROM REGRA R, TIPOREGRA TR, GRUPOREGRA GR '+
            'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
            'AND TR.IDGRUPOREGRA = GR.IDGRUPOREGRA '+
            'AND GR.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
            'ORDER BY UPPER(R.NOMEREGRA)';
    end
    else
    begin
      ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
            'FROM REGRA R, TIPOREGRA TR '+
            'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
            'AND R.IDTIPOREGRA IN (SELECT T1.IDTIPOREGRA '+
                                  'FROM TIPOREGRA T1 '+
                                  'WHERE T1.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
                                  'AND EXISTS (SELECT 1 '+
                                              'FROM GRUPOREGRAUSUARIO G1 '+
                                              'WHERE G1.IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+' '+
                                              'AND G1.IDGRUPOREGRA = T1.IDGRUPOREGRA '+
                                              'AND G1.FLGPROCURAR = 1) '+
                                  'UNION '+
                                  'SELECT T2.IDTIPOREGRA '+
                                  'FROM TIPOREGRA T2, GRUPOREGRAUSUARIO G2 '+
                                  'WHERE T2.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
                                  'AND G2.IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+' '+
                                  'AND G2.IDTIPOREGRA = T2.IDTIPOREGRA '+
                                  'AND G2.FLGPROCURAR = 1) '+
            'ORDER BY UPPER(R.NOMEREGRA)';
    end;
  end
  else
  begin
    ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
          'FROM REGRA R, TIPOREGRA TR '+
          'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
          'ORDER BY UPPER(R.NOMEREGRA)';
  end;

  qryRegra.Close;
  qryRegra.SQL.Clear;
  qryRegra.SQL.Add(ssql);
  qryRegra.Open;

  if SistemaFolha.IdGrupoRegraFolha > 0 then
  begin
    ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
          'FROM REGRA R, TIPOREGRA TR, GRUPOREGRA GR '+
          'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
          'AND TR.IDGRUPOREGRA = GR.IDGRUPOREGRA '+
          'AND GR.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
          'ORDER BY UPPER(R.NOMEREGRA)';
  end
  else
  begin
    ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
          'FROM REGRA R, TIPOREGRA TR '+
          'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
          'ORDER BY UPPER(R.NOMEREGRA)';
  end;

  qryRegraCPMF.Close;
  qryRegraCPMF.SQL.Clear;
  qryRegraCPMF.SQL.Add(ssql);
  qryRegraCPMF.Open;

  MontaQryOutros;
  MontaQryDet;

  qry.Close;
  qry.ParamByName('PIDPESSOA').AsInteger := 0;
  qry.ParamByName('PIDTITULAR').AsInteger := 0;
  qry.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('PIDPESSOA').AsInteger := 0;
  qryDet.ParamByName('PIDTITULAR').AsInteger := 0;
  qryDet.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qryDet.Open;

  qryOutros.Close;
  qryOutros.ParamByName('PIDPESSOA').AsInteger := 0;
  qryOutros.ParamByName('PIDTITULAR').AsInteger := 0;
  qryOutros.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qryOutros.Open;
  Ativacampos;
  dblkpcmbBenef.Enabled := False;
end;

procedure TfrmCadRubricaIndiv.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblkpcmbBenef.enabled:=false;
end;

procedure TfrmCadRubricaIndiv.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblkpcmbBenef.enabled:=false;
end;

procedure TfrmCadRubricaIndiv.dblcRubricaPAExit(Sender: TObject);
begin
  inherited;
  if qryDet.State = dsInsert then
    if qryDet.FieldByName('SEQRUBRICAINDIV').isnull then begin
       qryDesconto.Filtered := false;    // SOL 164018 Kintana 1406595
       qryDesconto.Filter   := ' IDPROVENTO = '''+IntToStr(qryDet.FieldByName('IDRUBRICA').AsInteger)+'''';
       qryDesconto.Filtered := True;
       qryDet.FieldByName('SEQRUBRICAINDIV').AsInteger:= PegaSeqRubricaIndiv(qryDesconto);
       qryDesconto.Filtered := False;   // SOL 164018 Kintana 1406595
    end;
  VerificaAssociacaoRubrica;
end;

procedure TfrmCadRubricaIndiv.EliminaRubricaClick(Sender: TObject);
begin
  inherited;
  case (sender as tspeedbutton).tag of
    1 : qryDet.fieldbyname('IDRUBRICA').clear;
    2 : qryDet.fieldbyname('RUBRICAPROVENTOPA').clear;
    3 : qryOutros.fieldbyname('IDRUBRICA').clear;
    4 : qryOutros.fieldbyname('RUBRICAPROVENTOPA').clear;
    5 : qryDet.fieldbyname('IDRUBRICA13').clear;
    6 : qryDet.fieldbyname('IDRUBRICAPROVENTO13').clear;
    7 : qryOutros.fieldbyname('IDRUBRICA13').clear;
    8 : qryOutros.fieldbyname('IDRUBRICAPROVENTO13').clear;
  end;
  //  SOL 140042 Kintana 900220
    //BRUNO AZEVEDO SOL 140042/6601
    edtAnoMesReembOutros.Visible := False;
    //cmb_mesreemboutros.Visible           := false;
    //spn_anoreemboutros.Visible           := false;
    //BRUNO AZEVEDO SOL 140042/6601
    GroupBox5.Visible                    := false;

    //BRUNO AZEVEDO SOL 140042/6601
    edtAnoMesReembPA.Visible := False;
    //cmb_mesreembPA.Visible               := false;
    //spn_anoreembPA.Visible               := false;
    //BRUNO AZEVEDO SOL 140042/6601
    grpMesReembolcoPA.Visible            := false;
  //  SOL 140042 Kintana 900220
end;

procedure TfrmCadRubricaIndiv.sbtnRubClick(Sender: TObject);
begin
  inherited;
  MontaselectRub.Colunas.Clear;
  if SistemaFolha.FlgUsaCodRubExt = 0 then
  begin
    MontaSelectRub.Colunas.Add('IDPROVENTO');
    MontaSelectRub.Colunas.Add('DESCRICAO');
  end
  else
  begin
    MontaSelectRub.Colunas.Add('CODPROVDESC');
    MontaSelectRub.Colunas.Add('DESCRPROVDESC');
  end;

  MontaSelectRub.Colunas.Add('DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',2,''Informativa'')');

  MontaSelectRub.filtro.clear;
  case (sender as tspeedbutton).tag of
    1,5 :
        begin
          MontaSelectRub.filtro.add('FLGDESCONTO = 1');
          if prmflgverrubfolben = 1 then
             MontaSelectRub.filtro.add('FLGTPRUBRICA LIKE ''%B%''');
        end;
    2,6 :
        begin
          MontaSelectRub.filtro.add('FLGDESCONTO = 0');
          if prmflgverrubfolben = 1 then
             MontaSelectRub.filtro.add('FLGTPRUBRICA LIKE ''%B%''');
        end;
  end;

  if SistemaFolha.FlgEstadoRub = 1 then
    MontaSelectRub.filtro.add('FLGESTADORUB IN (''0'',''1'')');

  MontaSelectRub.Executar;

  if (MontaSelectRub.ValoresChave.Count > 0) and
     (MontaSelectRub.ValoresChave[0] <> '') then
  begin
    case (sender as tspeedbutton).tag of
      1 : qryDet.FieldByName('IDRUBRICA').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
      2 : qryDet.FieldByName('RUBRICAPROVENTOPA').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
      3 : qryOutros.FieldByName('IDRUBRICA').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
      4 : qryOutros.FieldByName('RUBRICAPROVENTOPA').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
      5 : qryDet.FieldByName('IDRUBRICA13').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
      6 : qryDet.FieldByName('IDRUBRICAPROVENTO13').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
      7 : qryOutros.FieldByName('IDRUBRICA13').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
      8 : qryOutros.FieldByName('IDRUBRICAPROVENTO13').asinteger:=strtoint(MontaSelectRub.ValoresChave[0]);
    end;
  end;
end;

procedure TfrmCadRubricaIndiv.bbtnConfirmarClick(Sender: TObject);
var lidfavorecido, licodportforma: integer;
    lidtitular, lidpessoa, lidempresa: integer;
    lssql: string;
begin

  if pgctrlDetalhe.activepage = tbsOutrasRubricas then begin // Renato Visoni SOL 125156 Kintana 642427
    if dbcboxAbonoOutros.Checked then
      begin
        if (trim(dblcRubricaAbonoOutros.text) ='')  then // Luis SOL 124238
        begin
          MsgDlg('O campo Rubrica a processar no Abono é de preenchimento obrigatório ' +#13#10+
                 ' quando a opção Utilizada no Abono Anual for selecionada.', 'Informação',
                 mtInformation, [mbOk], 0);
          Exit;
       end;
      end;
      if dsOutros.state in [dsInsert, dsEdit] then // SOL 140042 Kintana 900220
      begin

        if GroupBox5.Visible then  // SOL 168268 Kintana 1481683
        begin
          //BRUNO AZEVEDO SOL 140042/6601
           //if (StrToIntDef(spn_anoreemboutros.text, 0) < 1900) or (Trim(cmb_mesreemboutros.Text) = emptystr ) then
           if (qryOutros.FieldByName('FLGPERMANENTE').AsInteger = 0) and (Trim(edtAnoMesReembOutros.Text) = '/') then
           //BRUNO AZEVEDO SOL 140042/6601
          begin
             Showmessage ('Mês e Ano de Competência de Reembolso do INSS deve ser preenchido.');
             exit;
          end;
        end;
      end; // SOL 140042 Kintana 900220
  end;


  if pgctrlDetalhe.activepage = tbsDet then begin // Renato Visoni SOL 125156 Kintana 642427
    if dbchkAbonoPA.Checked then
    begin
      if (trim(dblcRubricaAbonoPA.text) ='') then // Luis SOL 124238
      begin
        MsgDlg('O campo Rubrica de Desconto Abono da Pensão Alimentícia é de preenchimento ' +#13#10+
               'obrigatório quando a opção Utilizada no Abono Anual for selecionada.', 'Informação',
               mtInformation, [mbOk], 0);
        Exit;
      end;
    end;
      if dsdet.state in [dsInsert, dsEdit] then      // SOL 140042 Kintana 900220
      begin
         if grpMesReembolcoPA.Visible then   // SOL 168268 Kintana 1481683
         begin
           //BRUNO AZEVEDO SOL 140042/6601
           //if (StrToIntDef(spn_anoreembPA.Text, 0) < 1900) or  (Trim(cmb_mesreembPA.Text) = emptystr ) then
           if (qryDet.FieldByName('FLGPERMANENTE').AsInteger = 0) and (Trim(edtAnoMesReembPA.Text) = '/') then
           //BRUNO AZEVEDO SOL 140042/6601
           begin
              Showmessage ('Mês e Ano de Competência de Reembolso do INSS deve ser preenchido.');
              exit;
           end;
        end;
      end;   // SOL 140042 Kintana 900220
  end;

  //Pensão Alimentícia
  if dsdet.state in [dsInsert, dsEdit] then
  begin
    if pgctrlDetalhe.activepage = tbsDet then
    begin
      if Trim(dblcRubricaPA.Text) = '' then
      begin
        MsgDlg('O preenchimento da Rubrica de Desconto é obrigatório.', 'Informação',
               mtInformation, [mbOk], 0);
        Exit;
      end;
    end;
    if not SistemaFolha.FlgForcaDataFinalRubIndiv then
      if dbrgrpPermanentePA.ItemIndex = 0 then
        qryDet.FieldByName('DATAFINAL').Clear;
  end;


  //Outras Rubricas
  if dsOutros.state in [dsInsert, dsEdit] then
  begin
    if pgctrlDetalhe.activepage = tbsOutrasRubricas then
    begin
      if Trim(dblcRubricaOutros.Text) = '' then
      begin
        MsgDlg('O preenchimento da Rubrica é obrigatório.', 'Informação',
               mtInformation, [mbOk], 0);
        Exit;
      end;
    end;
    if not SistemaFolha.FlgForcaDataFinalRubIndiv then
      if dbrgrpPermanenteOutros.ItemIndex = 0 then
        qryOutros.FieldByName('DATAFINAL').Clear;

    // SOL 119865 e 118773 Daniel Begnami
    if (qryRubricaOutros.Active) then
      qryOutros.FieldByName('IDPLANOCONTABIL').AsString := Self.BuscaPlanoContabil(qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger,
                                                                                   qryRubricaOutros.FieldByName('FLGINSS').asInteger,
                                                                                   qryRubricaOutros.FieldByName('IDPROVENTO').asInteger);
    // FIM

  end;

  if ((pgctrlDetalhe.activepage = tbsOutrasRubricas) and (not bapagou)) then
  begin
    if ((qryRubricaOutros.fieldbyname('FLGOBRIGAFAVOREC').asInteger = 1) and
       (Trim(edNomeFavOutros.text) = '')) then
    begin
      MsgDlg('O preenchimento do campo Favorecido é obrigatório.',
             'Informação', mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;
    if dbdtIniciooutros.text = '' then
    begin
      MsgDlg('O preenchimento da data início de processamento da rubrica é obrigatório.',
             'Informação', mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;

    if prmFLGUSAPRAZORUB = 1 then
      // RUBRICA COM PRAZO 1
      if qryoutros.fieldbyname('PRAZO').asInteger = 2 then
      begin
        if spedparcelasoutros.value <> 1 then
        begin
          MsgDlg('Esta rubrica exige Nº de Parcelas = 1', 'Informação', mtWarning, [mbOk, mbHelp], 0);
          Exit;
        end;
      end;


      // xavier Sol 132174 Kintana 761776
      qryOutros.FieldByName('SITUACAOAJ').AsString     := cboSituacaoAJ.Items.Strings[cboSituacaoAJ.ItemIndex];
      qryOutros.FieldByName('OBSERVACAO').AsString     := mmobservacao.Lines.Text;
      Try
      qryOutros.ApplyUpdates;
      //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
      Except
        on e:Exception do
        begin
          TratarErro(e.Message);
        end;
      end;
      //Brunno Mattos - KTN 767861 - SOL 132659 Fim
      // Xavier  Sol 132174 Kintana 761776




  end
  else
  begin
    // Pensao Alimenticia
    if (not bapagou) then
    begin
      if ((qryDesconto.fieldbyname('FLGOBRIGAFAVOREC').asInteger = 1) and
          (Trim(edNomeFavPA.text) = '')) then
      begin
        MsgDlg('O preenchimento do campo Favorecido é obrigatório.',
               'Informação', mtWarning, [mbOk, mbHelp], 0);
        exit;
      end;
      if dbdtInicioPA.text = '' then
      begin
        MsgDlg('O preenchimento da data início de processamento da rubrica é obrigatório.',
               'Informação', mtWarning, [mbOk, mbHelp], 0);
        exit;
      end;
    end;
  end;

  if dsdet.state in [dsInsert, dsEdit] then
  begin
    if pgctrlDetalhe.activepage = tbsDet then
    begin
      lidfavorecido:=qryDet.fieldbyname('IDFAVORECIDO').asinteger;
      licodportforma:=qryDet.FieldByName('CODPORTFORMA').asinteger;
      lidtitular:=qryDet.FieldByName('IDTITULAR').asinteger;
      lidpessoa:=qryDet.FieldByName('IDPESSOA').asinteger;
      lidempresa:=qryDet.FieldByName('IDEMPRESA').asinteger;
      //BRUNO AZEVEDO SOL 140042/6601
      //if cmb_mesreembPA.ItemIndex = -1 then
      if grpMesReembolcoPA.Visible then
      begin
         if (qryDet.FieldByName('FLGPERMANENTE').AsInteger = 0) and (Trim(edtAnoMesReembPA.Text) = '/') then
         //BRUNO AZEVEDO SOL 140042/6601
         begin
            MsgDlg('É necessário informar o Ano/Mês de Competência do Reembolso do INSS.',
                   'Informação', mtWarning, [mbOk, mbHelp], 0);
            exit;
         end;
      end;
    end;
  end
  else
  begin
    //Outras Rubricas
    if dsOutros.state in [dsInsert, dsEdit] then
    begin
      if pgctrlDetalhe.activepage = tbsOutrasRubricas then
      begin
        lidfavorecido:=qryOutros.fieldbyname('IDFAVORECIDO').asinteger;
        licodportforma:=qryOutros.FieldByName('CODPORTFORMA').asinteger;
        lidtitular:=qryOutros.FieldByName('IDTITULAR').asinteger;
        lidpessoa:=qryOutros.FieldByName('IDPESSOA').asinteger;
        lidempresa:=qryOutros.FieldByName('IDEMPRESA').asinteger;
        //BRUNO AZEVEDO SOL 140042/6601
        if GroupBox5.Visible then
        begin
           if (qryOutros.FieldByName('FLGPERMANENTE').AsInteger = 0) and (Trim(edtAnoMesReembOutros.Text) = '/') then
           //BRUNO AZEVEDO SOL 140042/6601
           begin
              MsgDlg('É necessário informar o Ano/Mês de Competência do Reembolso do INSS.',
                     'Informação', mtWarning, [mbOk, mbHelp], 0);
              exit;
           end;
        end;
      end;
    end;
  end;

  Try
  qryDet.ApplyUpdates;
  qryOutros.ApplyUpdates;
  //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
  Except
  on e:Exception do
  begin
    TratarErro(e.Message);
  end;
  end;
  //Brunno Mattos - KTN 767861 - SOL 132659 Fim
  //BRUNO AZEVEDO SOL 150706 KINTANA 1096846
  //CHAMAR O inherited APÓS FAZER O APPLYUPDATES DAS QUERYS
  inherited;
  
  if lidfavorecido <> 0 then
  begin
    if FazQuery(qryAux, 'SELECT IDPESSOA '+
         'FROM PESSOAFISICA WHERE IDPESSOA = '+inttostr(lidfavorecido)) then
    begin
      lssql:='UPDATE RUBRICAINDIV ';
      if licodportforma = 0 then
        lssql:=lssql+'SET CODPORTFORMA = NULL '
      else
        lssql:=lssql+'SET CODPORTFORMA = '+inttostr(licodportforma)+' ';
      lssql:=lssql+
        'WHERE FLGTPRUBMANUT = ''1'' '+
        'AND IDFAVORECIDO = '+inttostr(lidfavorecido)+' '+
        'AND IDTITULAR = '+inttostr(lidtitular)+' '+
        'AND IDPESSOA = '+inttostr(lidpessoa)+' '+
        'AND IDEMPRESA = '+inttostr(lidempresa)+' ';
      if not ExecutarQuery(qryAux, lssql) then
        MessageDlg('Erro ao atribuir o contas/caixas x forma de '+
          'pagamento do favorecido '+#13#10+
          'para seus outros registros.', mtError, [mbOK], 0);
    end;
  end;

  //BRUNO AZEVEDO SOL 150706 KINTANA 1096846 COMENTADO
  //CmeCadastroConfirma(self);  //SOL 148694 KINTANA 1057380

  bApagou := false;
  AtivaCampos;
  cboSituacaoAJ.ItemIndex := 0;
  mmobservacao.Clear;
end;

procedure TfrmCadRubricaIndiv.fcsbtnEstadoPAClick(Sender: TObject);
begin
  inherited;
  SetaEstado(not (fcsbtnEstadoPA.caption = 'ATIVO'), fcsbtnEstadoPA);
end;

procedure TfrmCadRubricaIndiv.fcsbtnEstadoOutrosClick(Sender: TObject);
begin
  inherited;
  SetaEstado(not (fcsbtnEstadoOutros.caption = 'ATIVO'), fcsbtnEstadoOutros);
end;

procedure TfrmCadRubricaIndiv.dblkpcmbBenefCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
 var sSQL, sSQLOld : String;
begin
  inherited;
  qry.locate('IDPESSOA', qryBenef.FieldByName('PESSOAESCOLHIDA').AsInteger, []);

  { Testar se a Flag é diferente de zero }
  if SistemaFolha.FlgUsaRegraxRub <> 0 then
  begin
    { Se for diferente de zero guarda SQL do beneficio }
    sSQLOld := qryRubricaOutros.SQL.GetText;

    { Busca o beneficio desta Pessoa }
    sSql :=  'SELECT B.IDBENEFICIO '+
             'FROM BENEFBFCIARIO B '+
             'WHERE B.IDPESSJUR   = '+IntToStr(iidpessjur)+   ' AND '+
             '      B.IDPLANOPREV = '+IntToStr(iidplanoprev)+ ' AND '+
             '      B.IDTITULAR   = '+IntToStr(iidtitular)+   ' AND '+
             '      B.IDPESSOA    = '+IntToStr(iidpessoa)+    ' AND '+
             '      B.SEQPROPOSTA = '+'1'  ;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQL);
    qryAux.Open;

    if not qryaux.isempty then
    begin
      if SistemaFolha.FlgUsaCodRubExt = 0 then
        qryRubricaOutros.sql.add(' SELECT IDPROVENTO, ' +
                                 ' FLGOBRIGAFAVOREC,   '+
                                 ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                 ' CODPROVDESC||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRPROVDESC AS DESCRICAO, FLGINSS '+  // SOL 119865 Daniel Begnami
                                 ' ,CODFONTEPAGADORA ' + //Renato Visoni SOL 129270 Kintana 709354
                                 ' FROM PROVDESC '+
                                 ' ORDER BY CODPROVDESC ');

        if SistemaFolha.FlgUsaCodRubExt = 0 then
          { Com o beneficio, buscar as rubricas associadas }
          sSQL := 'SELECT PRV.IDPROVENTO, PRV.FLGOBRIGAFAVOREC, DECODE(PRV.FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, '+
//                  '       PRV.IDPROVENTO||'' - ''||DESCRICAO AS DESCRICAO, PRV.FLGINSS '+  // SOL 119865 Daniel Begnami           //Everson TIBERO
                  '       PRV.IDPROVENTO||'' - ''|| PRV.DESCRICAO AS DESCRICAO, PRV.FLGINSS '+  // SOL 119865 Daniel Begnami        //Everson TIBERO
                  ' ,PRV.CODFONTEPAGADORA ' + //Renato Visoni SOL 129270 Kintana 709354
                  'FROM REGRAXRUBRICA R, PROVDESC PRV '+
                  'WHERE R.IDRUBRICA   = PRV.IDPROVENTO '
        else
          { Com o beneficio, buscar as rubricas associadas }
           sSQL := 'SELECT PRV.IDPROVENTO, PRV.FLGOBRIGAFAVOREC, DECODE(PRV.FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, '+
//                   '       PRV.CODPROVDESC||'' - ''||DESCRPROVDESC AS DESCRICAO, PRV.FLGINSS '+ // SOL 119865 Daniel Begnami      //Everson TIBERO
                   '       PRV.CODPROVDESC||'' - ''|| PRV.DESCRPROVDESC AS DESCRICAO, PRV.FLGINSS '+ // SOL 119865 Daniel Begnami   //Everson TIBERO
                   ' ,PRV.CODFONTEPAGADORA ' + //Renato Visoni SOL 129270 Kintana 709354
                   'FROM REGRAXRUBRICA R, PROVDESC PRV '+
                   'WHERE R.IDRUBRICA   = PRV.IDPROVENTO ';

        ssql:=ssql+'ORDER BY CODPROVDESC ';

        qryRubricaOutros.SQL.Clear;
        qryRubricaOutros.SQL.Add(sSQL);
        qryRubricaOutros.Open;

        { Caso vazio (IsEmpty) Voltar SQL }
        if qryRubricaOutros.isempty then
        begin
          qryRubricaOutros.SQL.Clear;
          qryRubricaOutros.SQL.Add(sSQLOld);
          qryRubricaOutros.Open;
        end;{ if }
    end;
  end; { if }
end;

procedure TfrmCadRubricaIndiv.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bApagou := false;
  AtivaCampos;
end;

procedure TfrmCadRubricaIndiv.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.Activepage = tbsOutrasRubricas then
  begin
    dock974.visible:=false;
    dbcboxAbonoOutrosClick(Self);
    edCPFFavOutros.clear;
    edNomeFavOutros.clear;
    MontaQryRubricasOutrosProc;
  end
  else
  begin
    dock974.visible:=false;
    dbchkBasePAClick(Self);
    dbchkAbonoPAClick(Self);
    edCPFFavPA.clear;
    edNomeFavPA.clear;
    MontaQryRubricasPA;
  end
end;

procedure TfrmCadRubricaIndiv.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.Activepage = tbsOutrasRubricas then
  begin

     // SOL 140042 Kintana 900220
      If Trim(dblcRubricaOutros.Text) <> '' Then
      begin
        qryFontepagadora.close;
        qryFontepagadora.ParamByName('IDRUBRICA').asstring  := qryRubricaOutros.FieldByName('IDPROVENTO').asstring;
        qryFontepagadora.open;

        //BRUNO AZEVEDO SOL 140042/6601
        //cmb_mesreemboutros.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        //spn_anoreemboutros.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        edtAnoMesReembOutros.Visible         := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        //BRUNO AZEVEDO SOL 140042/6601
        
        GroupBox5.Visible                    := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        // SOL 163942 Kintana 1404260
        if not qryoutros.FieldByName('MESCOMPREEM').isnull then
        begin
           if (length(qryoutros.FieldByName('MESCOMPREEM').asstring) = 7) then
           begin
              try
                 //BRUNO AZEVEDO SOL 140042/6601
                 //cmb_mesreemboutros.ItemIndex:=StrToInt(Copy(qryoutros.FieldByName('MESCOMPREEM').asstring,6,2))-1;
                 //spn_anoreemboutros.Value:=StrToInt(Copy(qryoutros.FieldByName('MESCOMPREEM').asstring,1,4));
                 edtAnoMesReembOutros.Text := qryOutros.FieldByName('MESCOMPREEM').asstring;
                 //BRUNO AZEVEDO SOL 140042/6601
              except
              end;
           end else begin
             //BRUNO AZEVEDO 6601
             //cmb_mesreembPA.ItemIndex:= -1;
             //spn_anoreembPA.Value:= 0;
             edtAnoMesReembOutros.Text := '';
             //BRUNO AZEVEDO 6601
           end;
        end
        else
        begin
          //BRUNO AZEVEDO 6601
          //cmb_mesreembPA.ItemIndex:= -1;
          //spn_anoreembPA.Value:= 0;
          edtAnoMesReembOutros.Text := '';
          //BRUNO AZEVEDO 6601
        end;
        // SOL 163942 Kintana 1404260
      end;
      // SOL 140042 Kintana 900220

    if qryoutros.fieldbyname('FLGUSADO').asInteger = 1 then
    begin
      qryOutros.FieldByName('SITUACAOAJ').AsString;
      spedNumOcorrenciasOutros.enabled := false;
      dblcRubricaOutros.Enabled  := false;
      sbtnRubOutros.Enabled:=false;
      sbtnRemRubOutros.Enabled:=false;
      if not qryoutros.fieldbyname('RUBRICAPROVENTOPA').isnull then
      begin
        dblcRubricaFavOutros.Enabled:=false;
        sbtnRubFavOutros.Enabled:=false;
        sbtnRemRubFavOutros.Enabled:=false;
      end;
    end;
    edCPFFavOutros.Text:=qryOutros.FieldByName('CPFFAVORECIDO').AsString;
    edNomeFavOutros.Text:=qryOutros.FieldByName('FAVORECIDO').AsString;

    MontaQryRubricasOutrosProc;
    if dblcRubricaOutros.text <> '' then
    begin
      dblcRubricaFavOutros.enabled:=
        (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
        (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
      sbtnRubFavOutros.enabled:=
        (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
        (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
      sbtnRemRubFavOutros.enabled:=
        (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
        (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
      MontaQryRubricasOutrosFav;
    end;

    dblcPortFormaOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);

   // xavier
    try
      if qryOutros.FieldByName('SITUACAOAJ').AsString = '' then
         cboSituacaoAJ.ItemIndex := 0
      else
      if qryOutros.FieldByName('SITUACAOAJ').AsString = 'Em Liminar' then
         cboSituacaoAJ.ItemIndex := 1
      else
      if qryOutros.FieldByName('SITUACAOAJ').AsString = 'Ganha' then
         cboSituacaoAJ.ItemIndex := 2
      else
         cboSituacaoAJ.ItemIndex := 3;
    except
    end;

    if not qryOutros.FieldByName('OBSERVACAO').isnull then
    begin
      try
        mmobservacao.Lines.Text := qryOutros.FieldByName('OBSERVACAO').asstring;
      except
      end;
    end;
 // xavier


  end
  else
  begin
     // SOL 140042 Kintana 900220
      If Trim(dblcRubricaPA.Text) <> '' Then
      begin
        qryFontepagadora.close;
        qryFontepagadora.ParamByName('IDRUBRICA').asstring  := qryDesconto.FieldByName('IDPROVENTO').asstring;
        qryFontepagadora.open;

        //BRUNO AZEVEDO SOL 140042/6601
        //cmb_mesreembPA.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        //spn_anoreembPA.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        edtAnoMesReembPA.Visible         := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        //BRUNO AZEVEDO SOL 140042/6601

        grpMesReembolcoPA.Visible        := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
        // SOL 163942 Kintana 1404260
        if not qryDet.FieldByName('MESCOMPREEM').isnull then
        begin
           if (length(qryDet.FieldByName('MESCOMPREEM').asstring) = 7) then
           begin
              try
                 //BRUNO AZEVEDO SOL 140042/6601
                 //cmb_mesreembPA.ItemIndex:=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,6,2))-1;
                 //spn_anoreembPA.Value:=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,1,4));
                 edtAnoMesReembPA.Text := qryDet.FieldByName('MESCOMPREEM').asstring;
                 //BRUNO AZEVEDO SOL 140042/6601
              except
              end;
           end else begin
             //BRUNO AZEVEDO 6601
             //cmb_mesreembPA.ItemIndex:= -1;
             //spn_anoreembPA.Value:= 0;
             edtAnoMesReembPA.Text := '';
             //BRUNO AZEVEDO 6601
           end;
        end
        else
        begin
          //BRUNO AZEVEDO 6601
          //cmb_mesreembPA.ItemIndex:= -1;
          //spn_anoreembPA.Value:= 0;
          edtAnoMesReembPA.Text := '';
          //BRUNO AZEVEDO 6601
        end;
        // SOL 163942 Kintana 1404260
      end;
      // SOL 140042 Kintana 900220


    if qrydet.fieldbyname('FLGUSADO').asInteger = 1 then
    begin
      spedNumOcorrenciasPA.Enabled := false;
      dblcRubricaPA.Enabled:=false;
      sbtnRubDescPA.Enabled:=false;
      sbtnRemRubDescPA.Enabled:=false;

      if not qrydet.fieldbyname('RUBRICAPROVENTOPA').isnull then
      begin
        dblcRubricaFavPA.Enabled:=false;
        sbtnRubCredPA.Enabled:=false; 
        sbtnRemRubCredPA.Enabled:=false; 
      end;
    end;
    edCPFFavPA.Text:=qryDet.FieldByName('CPFFAVORECIDO').AsString;
    edNomeFavPA.Text:=qryDet.FieldByName('FAVORECIDO').AsString;
    MontaQryRubricasPA;
  end;
end;

procedure TfrmCadRubricaIndiv.spedparcelasoutrosExit(Sender: TObject);
begin
  inherited;
  if ((dbrgrpPermanenteoutros.ItemIndex = 1) and (dbdtIniciooutros.date > 0))  then
  begin
    CalculaDataFinal(qryOutros);
    dbdtfinaloutros.Update;
  end;
end;

procedure TfrmCadRubricaIndiv.dblcRegraOutrosCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaQryRubricasOutrosProc;

  grpRubricaOutros.Enabled := True;

  if SistemaFolha.FlgUsaRegraxRub = 1 then
  begin 
    if qryRubricaOutros.RecordCount = 1 then
    begin 
      dblcRubricaOutros.Text:=
        qryRubricaOutros.FieldByName('DESCRICAO').AsString; 
      qryOutros.FieldByName('IDRUBRICA').AsInteger:=
        qryRubricaOutros.FieldByName('IDPROVENTO').AsInteger; 
    end;
  end;

  if SistemaFolha.FlgUsaRegraxRub = 1 then
  begin 
    if (qryRubricaOutros.RecordCount = 0) or (qryRubricaOutros.RecordCount >= 2) then 
      dblcRubricaOutros.Text := ''; 
  end;

  if dblcRubricaOutros.text <> '' then
  begin
    dblcRubricaFavOutros.enabled:=
      (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
      (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    sbtnRubFavOutros.enabled:=
      (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
      (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    sbtnRemRubFavOutros.enabled:=
      (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
      (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    MontaQryRubricasOutrosFav;

    if SistemaFolha.FlgUsaRegraxRub = 1 then
    begin
      if qryRubFavOutros.RecordCount = 1 then
      begin
        dblcRubricaFavOutros.text:=qryRubFavOutros.FieldByName('DESCRICAO').AsString;
        qryOutros.FieldByName('RUBRICAPROVENTOPA').asinteger:=
          qryRubFavOutros.FieldByName('IDPROVENTO').asinteger;
      end;
    end;

    if SistemaFolha.FlgUsaRegraxRub = 1 then
    begin 
      if (qryRubFavOutros.RecordCount = 0) or (qryRubFavOutros.RecordCount >= 2) then
        dblcRubricaFavOutros.text:='';
    end;
  end
  else
  begin
    dblcRubricaFavOutros.enabled:=false;
    sbtnRubFavOutros.enabled:=false;
    sbtnRemRubFavOutros.enabled:=false;
  end;
  dblcPortFormaOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
end;

procedure TfrmCadRubricaIndiv.dblcRegraPACloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaQryRubricasPA;

  grpRubricaPA.Enabled := True;

  if SistemaFolha.FlgUsaRegraxRub = 1 then
  begin 
    if qryProvento.RecordCount = 1 then
    begin 
      dblcRubricaFavPA.Text:=qryProvento.FieldByName('DESCRICAO').AsString; 
      qryDet.FieldByName('RUBRICAPROVENTOPA').AsInteger := qryProvento.FieldByName('IDPROVENTO').AsInteger; 
    end;
  end;

  if SistemaFolha.FlgUsaRegraxRub = 1 then
  begin 
    if (qryProvento.RecordCount = 0) or (qryProvento.RecordCount >= 2) then 
      dblcRubricaFavPA.Text := ''; 
  end;

  if SistemaFolha.FLGUSAREGRAXRUB = 1 then
  begin 
    if qryDesconto.RecordCount = 1 then
    begin 
      dblcRubricaPA.Text := qryDesconto.FieldByName('DESCRICAO').AsString; 
      qryDet.FieldByName('IDRUBRICA').AsInteger := qryDesconto.FieldByName('IDPROVENTO').AsInteger; 
      dblcRubricaPAExit(Self);
    end;
  end;

  if SistemaFolha.FLGUSAREGRAXRUB = 1 then
  begin 
    if (qryDesconto.RecordCount = 0) or (qryDesconto.RecordCount >= 2) then 
      dblcRubricaPA.Text := ''; 
  end;
end;

procedure TfrmCadRubricaIndiv.sbtnProcurarClick(Sender: TObject);
begin
  sbtnAlterar.Enabled := True;
  dtmfolha.MSBenef.Executar;
  if (dtmfolha.MSBenef.ValoresChave.Count > 0)
     and (dtmfolha.MSBenef.ValoresChave[0] <> '') then
  begin
    iidtitular   := strtoint(dtmfolha.MSBenef.ValoresChave[5]);
    iidpessjur   := strtoint(dtmfolha.MSBenef.ValoresChave[9]);
    iidplanoprev := strtoint(dtmfolha.MSBenef.ValoresChave[11]);
    iidpessoaesc := strtoint(dtmfolha.MSBenef.ValoresChave[0]);

    iidrecebedor := iidtitular;

    qryBenef.Close;
    qryBenef.ParamByName('PIDTITULAR').AsInteger:=iidtitular;
    qryBenef.Open;

    qryBenef.locate('PESSOAESCOLHIDA', strtoint(dtmfolha.MSBenef.ValoresChave[0]), []);
    dblkpcmbBenef.enabled:=true;
    dblkpcmbBenef.text:=qrybenef.fieldbyname('NOME').asstring;
    iidpessoa    := qrybenef.fieldbyname('IDPESSOA').asinteger;

    pnlMestre.enabled:=true;
    dblkpcmbBenef.setfocus;
    dblkpcmbBenefCloseUp(Self,qryRubricaOutros, qry, False);

    pgctrlPA.ActivePageIndex:=0; 
    pgctrlOutros.ActivePageIndex:=0; 
  end;
end;

procedure TfrmCadRubricaIndiv.spedParcelasPAExit(Sender: TObject);
begin
  inherited;
  if ((dbrgrpPermanentePA.ItemIndex = 1) and (dbdtInicioPA.date > 0)) then
  begin
    CalculaDataFinal(qryDet);
    dbdtFinalPA.Update;
  end;
end;

procedure TfrmCadRubricaIndiv.dbchkAbonoPAClick(Sender: TObject);
begin
  inherited;
  if ((dbrgrpPermanentePA.ItemIndex = 1) And (dbdtInicioPA.date > 0)) then
  begin
    if qryDet.State In [dsInsert, dsEdit] then
      CalculaDataFinal(qryDet);
  end;
end;

procedure TfrmCadRubricaIndiv.dbcboxAbonoOutrosClick(Sender: TObject);
begin
  inherited;
  if ((dbrgrpPermanenteoutros.ItemIndex = 1) And (dbdtIniciooutros.date > 0)) then
  begin
    if qryOutros.State In [dsInsert, dsEdit] then
      CalculaDataFinal(qryOutros);
  end;
end;

procedure TfrmCadRubricaIndiv.dbchkBasePAClick(Sender: TObject);
begin
  inherited;
  if dbchkBasePa.Checked then
    dbchkBasePa.Checked := True
  else
    dbchkBasePa.Checked := False;
end;

procedure TfrmCadRubricaIndiv.MontaQryRubricasPA;
begin
  //Montagem da qryProvento
  qryProvento.Close;
  qryProvento.Sql.Clear;

  //Se o parâmetro FlgUsaRegraxRub estiver desmarcado
  if SistemaFolha.FlgUsaRegraxRub = 0 then
  begin
    if SistemaFolha.FlgUsaCodRubExt = 0 then
    begin
      qryProvento.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, ' +
                           ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO '+
                           ' FROM PROVDESC P WHERE FLGDESCONTO = 0 '+
                           ' AND FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39));

      if SistemaFolha.FlgEstadoRub = 1 then 
        qryProvento.sql.add(' AND FLGESTADORUB IN (''0'',''1'') ');      

      qryProvento.sql.add(' ORDER BY IDPROVENTO ');
    end
    else
    begin
      qryProvento.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, ' +
                           ' CODPROVDESC||'+ CHR(39)+' - '+CHR(39)+'||DESCRPROVDESC AS DESCRICAO '+
                           ' FROM PROVDESC P WHERE FLGDESCONTO = 0 '+
                           ' AND FLGTPRUBRICA LIKE '+ CHR(39)+ CHR(37) +'B'+ CHR(37)+ CHR(39));

      if SistemaFolha.FlgEstadoRub = 1 then 
        qryProvento.sql.add(' AND FLGESTADORUB IN (''0'',''1'') ');      

      qryProvento.sql.add(' ORDER BY CODPROVDESC ');
    end;
  end
  else
  begin
    //Se o parâmetro FlgUsaRegraxRub estiver marcado
    if SistemaFolha.FlgUsaCodRubExt = 0 then
    begin
      if Trim(dblcRegraPA.Text) = '' then
        qryProvento.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, ' +
                             ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO '+
                             ' FROM PROVDESC P WHERE FLGDESCONTO IN (''0'',''1'') '+  //SOL 125009 - Jéssica Lana
                             ' AND IDPROVENTO NOT IN (SELECT IDRUBRICA FROM REGRAXRUBRICA) '+
                             ' AND FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39))
      else
        qryProvento.sql.add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, ' +
                             ' P.IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||P.DESCRICAO AS DESCRICAO '+
                             ' FROM PROVDESC P, REGRAXRUBRICA R '+
                             ' WHERE P.FLGDESCONTO IN (''0'',''1'') '+    //SOL 125009 - Jéssica Lana
                             ' AND P.IDPROVENTO = R.IDRUBRICA '+
                             ' AND R.IDREGRA = '+dblcRegraPA.LookUpValue+
//                             ' AND FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39)); //Everson TIBERO
                             ' AND P.FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39)); //Everson TIBERO

      if SistemaFolha.FlgEstadoRub = 1 then 
        qryProvento.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') ');      

      qryProvento.Sql.Add(' ORDER BY P.IDPROVENTO ');
    end
    else
    begin
      if Trim(dblcRegraPA.Text) = '' then
        qryProvento.Sql.Add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, ' +
                             ' CODPROVDESC||'+ CHR(39)+' - '+CHR(39)+'||DESCRPROVDESC AS DESCRICAO '+
                             ' FROM PROVDESC P WHERE FLGDESCONTO = 0 '+
                             ' AND FLGTPRUBRICA LIKE '+ CHR(39)+ CHR(37) +'B'+ CHR(37)+ CHR(39))
      else
        qryProvento.Sql.Add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, ' +
                             ' P.CODPROVDESC||'+ CHR(39)+' - '+CHR(39)+'||P.DESCRPROVDESC AS DESCRICAO '+
                             ' FROM PROVDESC P, REGRAXRUBRICA R '+
//                             ' WHERE FLGDESCONTO = 0 '+ //Everson TIBERO
                             ' WHERE P.FLGDESCONTO = 0 '+ //Everson TIBERO
                             ' AND P.IDPROVENTO = R.IDRUBRICA '+
                             ' AND R.IDREGRA = '+dblcRegraPA.LookUpValue+
                             ' AND P.FLGTPRUBRICA LIKE '+ CHR(39)+ CHR(37) +'B'+ CHR(37)+ CHR(39));

      if SistemaFolha.FlgEstadoRub = 1 then 
        qryProvento.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') ');      

      qryProvento.Sql.Add(' ORDER BY P.CODPROVDESC ');
    end;
  end;
  //Fim da Montagem da qryProvento

  //Montagem da qryDesconto
  qryDesconto.Close;
  qryDesconto.Sql.Clear;

  //Se o parâmetro FlgUsaRegraxRub estiver desmarcado
  if SistemaFolha.FlgUsaRegraxRub = 0 then
  begin
    if SistemaFolha.FlgUsaCodRubExt = 0 then
    begin
      qryDesconto.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, CODFONTEPAGADORA, ' +
                           ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO '+
                           ' FROM PROVDESC P WHERE FLGDESCONTO = 1 '+
                           ' AND FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39));

      if SistemaFolha.FlgEstadoRub = 1 then 
        qryDesconto.sql.add(' AND FLGESTADORUB IN (''0'',''1'') ');

      qryDesconto.sql.add(' ORDER BY IDPROVENTO ');
    end
    else
    begin
      qryDesconto.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, CODFONTEPAGADORA, ' +
                           ' CODPROVDESC||'+ CHR(39)+' - '+CHR(39)+'||DESCRPROVDESC AS DESCRICAO '+
                           ' FROM PROVDESC P WHERE FLGDESCONTO = 1 '+
                           ' AND FLGTPRUBRICA LIKE '+ CHR(39)+ CHR(37) +'B'+ CHR(37)+ CHR(39));

      if SistemaFolha.FlgEstadoRub = 1 then 
        qryDesconto.sql.add(' AND FLGESTADORUB IN (''0'',''1'') ');      

      qryDesconto.sql.add(' ORDER BY CODPROVDESC ');
    end;
  end
  else
  begin
    //Se o parâmetro FlgUsaRegraxRub estiver marcado
    if SistemaFolha.FlgUsaCodRubExt = 0 then
    begin
      if Trim(dblcRegraPA.Text) = '' then
        qryDesconto.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, CODFONTEPAGADORA, ' +
                             ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO '+
                             ' FROM PROVDESC P WHERE FLGDESCONTO IN (''0'',''1'') '+        //SOL 125009 - Jéssica Lana
                             ' AND IDPROVENTO NOT IN (SELECT IDRUBRICA FROM REGRAXRUBRICA) '+
                             ' AND FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39))
      else
//        qryDesconto.sql.add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, CODFONTEPAGADORA, ' + //Everson TIBERO
        qryDesconto.sql.add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, P.CODFONTEPAGADORA, ' + //Everson TIBERO
                             ' P.IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||P.DESCRICAO AS DESCRICAO '+
                             ' FROM PROVDESC P, REGRAXRUBRICA R '+
                             ' WHERE P.FLGDESCONTO IN (''0'',''1'') '+    //SOL 125009 - Jéssica Lana
                             ' AND P.IDPROVENTO = R.IDRUBRICA '+
                             ' AND R.IDREGRA = '+dblcRegraPA.LookUpValue+
                             ' AND P.FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39));

      if SistemaFolha.FlgEstadoRub = 1 then 
        qryDesconto.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') ');      

      qryDesconto.Sql.Add(' ORDER BY P.IDPROVENTO ');
    end
    else
    begin
      if Trim(dblcRegraPA.Text) = '' then
        qryDesconto.Sql.Add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, CODFONTEPAGADORA, ' +
                             ' CODPROVDESC||'+ CHR(39)+' - '+CHR(39)+'||DESCRPROVDESC AS DESCRICAO '+
                             ' FROM PROVDESC P WHERE FLGDESCONTO IN (''0'',''1'') '+      //SOL 125009 - Jéssica Lana
                             ' AND IDPROVENTO NOT IN (SELECT IDRUBRICA FROM REGRAXRUBRICA) '+
                             ' AND FLGTPRUBRICA LIKE '+ CHR(39)+ CHR(37) +'B'+ CHR(37)+ CHR(39))
      else
//        qryDesconto.Sql.Add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, CODFONTEPAGADORA, ' +   //Everson TIBERO
        qryDesconto.Sql.Add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, P.CODFONTEPAGADORA, ' +   //Everson TIBERO
                             ' P.CODPROVDESC||'+ CHR(39)+' - '+CHR(39)+'||P.DESCRPROVDESC AS DESCRICAO '+
                             ' FROM PROVDESC P, REGRAXRUBRICA R '+
//                             ' WHERE FLGDESCONTO IN (''0'',''1'') '+        //SOL 125009 - Jéssica Lana      //Everson TIBERO
                             ' WHERE P.FLGDESCONTO IN (''0'',''1'') '+        //SOL 125009 - Jéssica Lana      //Everson TIBERO
                             ' AND P.IDPROVENTO = R.IDRUBRICA '+
                             ' AND R.IDREGRA = '+dblcRegraPA.LookUpValue+
                             ' AND P.FLGTPRUBRICA LIKE '+ CHR(39)+ CHR(37) +'B'+ CHR(37)+ CHR(39));

        if SistemaFolha.FlgEstadoRub = 1 then 
          qryDesconto.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') ');      

        qryDesconto.Sql.Add(' ORDER BY P.CODPROVDESC ');
    end;
  end;

  qryProvento.Open;
  qryDesconto.Open;
end;

procedure TfrmCadRubricaIndiv.MontaQryRubricasOutrosProc;
begin
  //Montagem da qryRubricaOutros
  qryRubricaOutros.Close;
  qryRubricaOutros.Sql.Clear;

  //Se o parâmetro FlgUsaRegraxRub estiver desmarcado
  if SistemaFolha.FlgUsaRegraxRub = 0 then
  begin
    if SistemaFolha.FlgUsaCodRubExt = 0 then
    begin
      qryRubricaOutros.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, FLGDESCONTO, '+
                                ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO, FLGINSS '+ // SOL 119865 Daniel Begnami
                                ' ,CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354
                                ' FROM PROVDESC P ');

      if SistemaFolha.FlgEstadoRub = 1 then
        qryRubricaOutros.sql.add(' WHERE FLGESTADORUB IN (''0'',''1'') ');

        
      qryRubricaOutros.sql.add(' ORDER BY IDPROVENTO ');
    end
    else
    begin
      qryRubricaOutros.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, FLGDESCONTO, '+
                                ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                ' CODPROVDESC||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRPROVDESC AS DESCRICAO, FLGINSS '+  // SOL 119865 Daniel Begnami
                                ' ,CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354
                                ' FROM PROVDESC P ');

      if SistemaFolha.FlgEstadoRub = 1 then  
        qryRubricaOutros.sql.add(' WHERE FLGESTADORUB IN (''0'',''1'') ');

      qryRubricaOutros.sql.add(' ORDER BY CODPROVDESC ');
    end;
  end
  else
  begin
    //Se o parâmetro FlgUsaRegraxRub estiver marcado
    if SistemaFolha.FlgUsaCodRubExt = 0 then
    begin
      if Trim(dblcRegraOutros.Text) = '' then
        qryRubricaOutros.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, FLGDESCONTO, '+
                                  ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                  ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO, FLGINSS '+  // SOL 119865 Daniel Begnami
                                  ' ,CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354
                                  ' FROM PROVDESC P '+
                                  ' WHERE IDPROVENTO '+
                                  ' NOT IN (SELECT IDRUBRICA FROM REGRAXRUBRICA) ')
      else
        qryRubricaOutros.sql.add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, P.FLGDESCONTO, '+
                                  ' DECODE(P.FLGDESCONTO, 0, ''Provento'', 1, ''Desconto'', ''Informativa'') AS TIPO, ' +
                                  ' P.IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||P.DESCRICAO AS DESCRICAO, P.FLGINSS '+   // SOL 119865 Daniel Begnami
//                                  ' ,CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354    //Everson TIBERO
                                  ' ,P.CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354    //Everson TIBERO
                                  ' FROM PROVDESC P, REGRAXRUBRICA R '+
                                  ' WHERE P.IDPROVENTO = R.IDRUBRICA  '+
                                  ' AND R.IDREGRA = '+dblcRegraOutros.LookupValue);

      if SistemaFolha.FlgEstadoRub = 1 then  
        qryRubricaOutros.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') '); 

      qryRubricaOutros.sql.add(' ORDER BY P.IDPROVENTO ');
    end
    else
    begin
      if Trim(dblcRegraOutros.Text) = '' then
        qryRubricaOutros.sql.add( ' SELECT IDPROVENTO, FLGOBRIGAFAVOREC, FLGDESCONTO, '+
                                  ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                  ' CODPROVDESC||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRPROVDESC AS DESCRICAO, FLGINSS '+  // SOL 119865 Daniel Begnami
                                  ' ,CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354
                                  ' FROM PROVDESC P WHERE 1 = 1 ')
      else
        qryRubricaOutros.sql.add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, P.FLGDESCONTO, '+
                                  ' DECODE(P.FLGDESCONTO, 0, ''Provento'', 1, ''Desconto'', ''Informativa'') AS TIPO, ' +
                                  ' P.CODPROVDESC||'+ CHR(39)+ ' - '+ CHR(39)+ '||P.DESCRPROVDESC AS DESCRICAO, P.FLGINSS '+   // SOL 119865 Daniel Begnami
//                                  ' ,CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354       //Everson TIBERO
                                  ' ,P.CODFONTEPAGADORA '+ //Renato Visoni SOL 129270 Kintana 709354       //Everson TIBERO
                                  ' FROM PROVDESC P, REGRAXRUBRICA R '+
                                  ' WHERE R.IDRUBRICA = P.IDPROVENTO '+
                                  ' AND R.IDREGRA = '+dblcRegraOutros.LookupValue);

      if SistemaFolha.FlgEstadoRub = 1 then
        qryRubricaOutros.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') ');

      qryRubricaOutros.sql.add(' ORDER BY P.CODPROVDESC ');
    end;
  end;
  //Fim qryRubricaOutros

  //Abre as queries
  qryRubricaOutros.Open;
end;

procedure TfrmCadRubricaIndiv.dblcRubricaOutrosExit(Sender: TObject);
begin
  inherited;
  if dblcRubricaOutros.text <> '' then
  begin
    dblcRubricaFavOutros.enabled:=
      (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
      (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    sbtnRubFavOutros.enabled:=
      (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
      (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    sbtnRemRubFavOutros.enabled:=
      (qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1]) and
      (SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    MontaQryRubricasOutrosFav;
  end
  else
  begin
    dblcRubricaFavOutros.enabled:=false;
    sbtnRubFavOutros.enabled:=false;
    sbtnRemRubFavOutros.enabled:=false;
  end;
  dblcPortFormaOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
end;

procedure TfrmCadRubricaIndiv.MontaQryRubricasOutrosFav;
begin
  //Montagem da qryRubFavOutros
  qryRubFavOutros.Close;
  qryRubFavOutros.Sql.Clear;

  if qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger in [0,1] then
  begin
    //Se o parâmetro FlgUsaRegraxRub estiver desmarcado
    if SistemaFolha.FlgUsaRegraxRub = 0 then
    begin
      if SistemaFolha.FlgUsaCodRubExt = 0 then
      begin
        qryRubFavOutros.sql.add(' SELECT IDPROVENTO, ' +
                                ' FLGOBRIGAFAVOREC,   '+
                                ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO, FLGINSS '+  // SOL 119865 Daniel Begnami
                                ' FROM PROVDESC P WHERE 1 = 1 ');

        if SistemaFolha.FlgEstadoRub = 1 then
          qryRubFavOutros.sql.add(' AND FLGESTADORUB IN (''0'',''1'') '); 

        if qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger = 0 then
          qryRubFavOutros.sql.add('AND FLGDESCONTO = 1 ')
        else
          qryRubFavOutros.sql.add('AND FLGDESCONTO = 0 ');

        qryRubFavOutros.sql.add(' ORDER BY IDPROVENTO ');
      end
      else
      begin
        qryRubFavOutros.sql.add( ' SELECT IDPROVENTO, ' +
                                  ' FLGOBRIGAFAVOREC,   '+
                                  ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                  ' CODPROVDESC||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRPROVDESC AS DESCRICAO, FLGINSS '+   // SOL 119865 Daniel Begnami
                                  ' FROM PROVDESC P WHERE 1 = 1 ');
        if SistemaFolha.FlgEstadoRub = 1 then  
          qryRubFavOutros.sql.add(' AND FLGESTADORUB IN (''0'',''1'') '); 

        if qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger = 0 then
          qryRubFavOutros.sql.add('AND FLGDESCONTO = 1 ')
        else
          qryRubFavOutros.sql.add('AND FLGDESCONTO = 0 ');

        qryRubFavOutros.sql.add(' ORDER BY CODPROVDESC ');
      end;
    end
    else
    begin
      //Se o parâmetro FlgUsaRegraxRub estiver marcado
      if SistemaFolha.FlgUsaCodRubExt = 0 then
      begin
        if Trim(dblcRegraOutros.Text) = '' then
          qryRubFavOutros.sql.add( ' SELECT IDPROVENTO, ' +
                                    ' FLGOBRIGAFAVOREC,   '+
                                    ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                    ' IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRICAO AS DESCRICAO, P.FLGINSS '+  // SOL 119865 Daniel Begnami
                                    ' FROM PROVDESC P '+
                                    ' WHERE IDPROVENTO '+
                                    ' NOT IN (SELECT IDRUBRICA FROM REGRAXRUBRICA) ')
        else
          qryRubFavOutros.sql.add( ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, '+
                                    ' DECODE(P.FLGDESCONTO, 0, ''Provento'', 1, ''Desconto'', ''Informativa'') AS TIPO, ' +
                                    ' P.IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||P.DESCRICAO AS DESCRICAO, P.FLGINSS '+  // SOL 119865 Daniel Begnami
                                    ' FROM PROVDESC P, REGRAXRUBRICA R '+
                                    ' WHERE '+
                                    ' P.IDPROVENTO = R.IDRUBRICA  '+
                                    ' AND R.IDREGRA = '+dblcRegraOutros.LookupValue);

        if SistemaFolha.FlgEstadoRub = 1 then  
          qryRubFavOutros.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') '); 

        if qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger = 0 then
          qryRubFavOutros.sql.add('AND P.FLGDESCONTO = 1 ')
        else
          qryRubFavOutros.sql.add('AND P.FLGDESCONTO = 0 ');

        qryRubFavOutros.sql.add(' ORDER BY P.IDPROVENTO ');
      end
      else
      begin
        if Trim(dblcRegraOutros.Text) = '' then
          qryRubFavOutros.sql.add(' SELECT IDPROVENTO, ' +
                                  ' FLGOBRIGAFAVOREC,   '+
                                  ' DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO, ' +
                                  ' CODPROVDESC||'+ CHR(39)+ ' - '+ CHR(39)+ '||DESCRPROVDESC AS DESCRICAO, FLGINSS '+  // SOL 119865 Daniel Begnami
                                  ' FROM PROVDESC P '+
                                  ' WHERE IDPROVENTO '+
                                  ' NOT IN (SELECT IDRUBRICA FROM REGRAXRUBRICA) ')
        else
          qryRubFavOutros.sql.add(' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, '+
                                  ' DECODE(P.FLGDESCONTO, 0, ''Provento'', 1, ''Desconto'', ''Informativa'') AS TIPO, ' +
                                  ' P.CODPROVDESC||'+ CHR(39)+ ' - '+ CHR(39)+ '||P.DESCRPROVDESC AS DESCRICAO, P.FLGINSS  '+   // SOL 119865 Daniel Begnami
                                  ' FROM PROVDESC P, REGRAXRUBRICA R '+
                                  ' WHERE '+
                                  ' R.IDRUBRICA = P.IDPROVENTO '+
                                  ' AND R.IDREGRA = '+dblcRegraOutros.LookupValue);

        if SistemaFolha.FlgEstadoRub = 1 then  
          qryRubFavOutros.sql.add(' AND P.FLGESTADORUB IN (''0'',''1'') '); 

        if qryRubricaOutros.fieldbyname('FLGDESCONTO').asinteger = 0 then
          qryRubFavOutros.sql.add('AND P.FLGDESCONTO = 1 ')
        else
          qryRubFavOutros.sql.add('AND P.FLGDESCONTO = 0 ');

        qryRubFavOutros.sql.add(' ORDER BY CODPROVDESC ');
      end;
    end;
    //Fim qryRubFavOutros

    qryRubFavOutros.Open;
    dblcRubricaFavOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    sbtnRubFavOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    sbtnRemRubFavOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
    dblcPortFormaOutros.enabled:=(SistemaFolha.FlgEfetuaPagtoFavOutros = 1);
  end
  else
  begin
    dblcRubricaFavOutros.enabled:=false;
    sbtnRubFavOutros.enabled:=false;
    sbtnRemRubFavOutros.enabled:=false;
    dblcPortFormaOutros.enabled:=false;
  end;
end;

procedure TfrmCadRubricaIndiv.MontaQryOutros;
begin
  qryOutros.Close;
  qryOutros.Sql.Clear;
  if SistemaFolha.FlgUsaCodRubExt = 0 then
    qryOutros.Sql.Add(
    ' SELECT '+
    //BRUNO AZEVEDO SOL 130928 KINTANA 738408
    '   PD.DESCPARCIAL, '+
    '   PD.FLGDESCONTO, '+
    '   PD.FLGINSS,     '+
    '   PD.FLGIRRF,     '+
    '   PD.CODFONTEPAGADORA, '+
    //BRUNO AZEVEDO SOL 130928 KINTANA 738408
    '   R.FLGUSAABONO,               R.FLGANTECIPABONO,           R.IDALIMENTADO, '+
    '   R.IDTITULAR,                 R.DATAINICIO,                R.FLGBASEPA, '+
    '   R.IDPESSOA,                  R.IDEMPRESA,                 PD.IDPROVENTO AS IDMOSTRARUBOUTROS, '+
    '   R.IDRUBRICA,                 R.NUMOCORRENCIAS,            R.SEQRUBRICAINDIV, '+
    '   R.IDFAVORECIDO,              R.IDREGRACALCULO,            R.VALORRUBRICA, '+
    '   R.ANOMESINICIO,              R.FLGPERMANENTE,             R.PARCELAS, '+
    '   R.FLGPERCENT,                R.FLGTPRUBMANUT,             R.FLGPENSAOALIM, '+
    '   R.RUBRICAPROVENTOPA,         R.DATAFINAL,                 R.ANOMESREF, '+
    '   R.CODPORTFORMA,              PD.DESCRICAO,                P.NUMDOCUMENTO AS CPFFAVORECIDO, '+
    '   P.NOME AS FAVORECIDO,        R.FLGDESATIVADO,             R.FLGUSADO, '+
    '   PD.PRAZO,                    R.ULTMESPREPARO,             RG.NOMEREGRA, '+
    '   R.TRGDTINCLUSAO,             R.TRGUSERINCLUSAO, R.FLGANTECIPAABONOINSS, '+   // SOL67497 - Daniel Begnami
    '   R.FLGRETROACAO, '+
    '   ''                                                            '' AS NOME, '+
    'R.IDPLANOCONTABIL, '+
    'R.IDRUBRICA13, '+
    'R.IDRUBRICAPROVENTO13, '+
    'R.FLGCONTROLASALDO, '+
    'R.VLRSALDOINICIAL, '+
    'R.VLRTOTALPROC, '+
    'R.IDSEQINTERNOFB '+
    ',R.NUMPROCINSS '+ //Renato Visoni SOL 129270 Kintana 709354
    ',R.SITUACAOAJ  '+ //Xavier Sol 132174 Kintana 761776
    ',R.OBSERVACAO '+ //Xavier Sol 132174 Kintana 761776
    ',R.MESCOMPREEM '+ //Xavier Sol 140042 Kintana 900220
    ',R.FLGRESGATEPARCELADO '+ //SOL 63067 - KTN 524520

    ' FROM PROVDESC PD, PESSOA P, REGRA RG, RUBRICAINDIV R '+
    ' WHERE R.IDTITULAR       = :PIDTITULAR '+
    '   AND R.IDPESSOA        = :PIDPESSOA '+
    '   AND ((R.FLGPENSAOALIM = 0) OR (R.FLGPENSAOALIM IS NULL)) '+
    '   AND R.IDEMPRESA       = :PIDFUNDACAO '+
    '   AND R.FLGTPRUBMANUT   = ''1'' '+
    '   AND PD.IDPROVENTO     = R.IDRUBRICA '+
    '   AND R.IDFAVORECIDO    = P.IDPESSOA(+) '+
    '   AND R.IDREGRACALCULO  = RG.IDREGRA(+) '+
//    ' ORDER BY SEQRUBRICAINDIV ') //Everson TIBERO
    ' ORDER BY R.SEQRUBRICAINDIV ') //Everson TIBERO
   else
    qryOutros.Sql.Add(
     ' SELECT '+
      //BRUNO AZEVEDO SOL 130928 KINTANA 738408
      ' PD.DESCPARCIAL, '+
      ' PD.FLGDESCONTO, '+
      ' PD.FLGINSS,     '+
      ' PD.FLGIRRF,     '+
      ' PD.CODFONTEPAGADORA, '+      
      //BRUNO AZEVEDO SOL 130928 KINTANA 738408
      ' R.FLGUSAABONO, R.FLGANTECIPABONO, R.IDALIMENTADO, R.IDTITULAR, R.DATAINICIO, R.FLGBASEPA, R.FLGANTECIPAABONOINSS, '+ // SOL67497 - Daniel Begnami
      ' R.IDPESSOA, R.IDEMPRESA, PD.CODPROVDESC AS IDMOSTRARUBOUTROS, R.IDRUBRICA, '+
      ' R.NUMOCORRENCIAS, R.SEQRUBRICAINDIV, R.IDFAVORECIDO, R.IDREGRACALCULO, '+
      ' R.VALORRUBRICA, R.ANOMESINICIO, R.FLGPERMANENTE, R.PARCELAS, R.FLGPERCENT, '+
      ' R.FLGTPRUBMANUT, R.FLGPENSAOALIM, R.RUBRICAPROVENTOPA, R.DATAFINAL, '+
      ' R.ANOMESREF, R.CODPORTFORMA, PD.DESCRPROVDESC AS DESCRICAO, '+
      ' P.NUMDOCUMENTO AS CPFFAVORECIDO, P.NOME AS FAVORECIDO, R.FLGDESATIVADO, '+
      ' R.FLGUSADO, PD.PRAZO, R.ULTMESPREPARO, RG.NOMEREGRA, R.TRGUSERINCLUSAO, R.TRGDTINCLUSAO, '+
      ' R.FLGRETROACAO, '+ 
    '   ''                                                            '' AS NOME, '+
    'R.IDPLANOCONTABIL, '+ 
    'R.IDRUBRICA13, '+
    'R.IDRUBRICAPROVENTO13, '+
    'R.FLGCONTROLASALDO, '+
    'R.VLRSALDOINICIAL, '+
    'R.VLRTOTALPROC, '+
    'R.IDSEQINTERNOFB '+
    ',R.NUMPROCINSS '+ //Renato Visoni SOL 129270 Kintana 709354
    ',NVL(R.FLGRUBRICARESGATE,0) AS FLGRUBRICARESGATE '+ //Renato Visoni SOL 138157 Kintana 840763
    ',R.SITUACAOAJ  '+ //Xavier Sol 132174 Kintana 761776
    ',R.OBSERVACAO '+ //Xavier Sol 132174 Kintana 761776
    ',R.MESCOMPREEM '+ //Xavier Sol 140042 Kintana 900220
    ',R.FLGRESGATEPARCELADO '+ //SOL 63067 - KTN 524520  
    ' FROM PROVDESC PD, PESSOA P, REGRA RG, RUBRICAINDIV R '+
    ' WHERE R.IDTITULAR       = :PIDTITULAR '+
    '   AND R.IDPESSOA        = :PIDPESSOA '+
    '   AND ((R.FLGPENSAOALIM = 0) OR (R.FLGPENSAOALIM IS NULL)) '+
    '   AND R.IDEMPRESA       = :PIDFUNDACAO '+
    '   AND R.FLGTPRUBMANUT   = ''1'' '+
    '   AND PD.IDPROVENTO     = R.IDRUBRICA '+
    '   AND R.IDFAVORECIDO    = P.IDPESSOA(+) '+
    '   AND R.IDREGRACALCULO  = RG.IDREGRA(+) '+
//    ' ORDER BY SEQRUBRICAINDIV '); //Everson TIBERO
    ' ORDER BY R.SEQRUBRICAINDIV ');   //Everson TIBERO

  qryOutros.ParamByName('PIDTITULAR').DataType:=ftInteger;
  qryOutros.ParamByName('PIDPESSOA').DataType:=ftInteger;
  qryOutros.ParamByName('PIDFUNDACAO').DataType:=ftInteger;
 end;

procedure TfrmCadRubricaIndiv.MontaQryDet;
begin
  qryDet.Close;
  qryDet.Sql.Clear;
  if SistemaFolha.FlgUsaCodRubExt = 0 then
    qryDet.SQL.Add(
      ' SELECT '+
      //BRUNO AZEVEDO SOL 130928 KINTANA 738408
      ' PD.DESCPARCIAL, '+
      ' PD.FLGDESCONTO, '+
      ' PD.FLGINSS,     '+
      ' PD.FLGIRRF,     '+
      ' PD.CODFONTEPAGADORA, '+      
      //BRUNO AZEVEDO SOL 130928 KINTANA 738408
      //BRUNO AZEVEDO SOL 138969 KINTANA 852277
      ' PD.PRAZO,       '+
      //BRUNO AZEVEDO SOL 138969 KINTANA 852277
      ' R.FLGUSAABONO, R.FLGANTECIPABONO, R.IDALIMENTADO, R.IDTITULAR, R.DATAINICIO, R.FLGBASEPA, R.FLGANTECIPAABONOINSS,  '+ // SOL67497 - Daniel Begnami
      ' R.IDPESSOA, R.IDEMPRESA, R.NUMOCORRENCIAS, PD.IDPROVENTO AS IDMOSTRARUB, '+
      ' PD.IDPROVENTO AS IDRUBRICA, R.SEQRUBRICAINDIV, R.IDFAVORECIDO, '+
      ' R.IDREGRACALCULO, R.VALORRUBRICA, R.ANOMESINICIO, R.FLGPERMANENTE, '+
      ' R.PARCELAS, R.FLGPERCENT, R.FLGTPRUBMANUT, R.FLGPENSAOALIM, '+
      ' R.RUBRICAPROVENTOPA, R.DATAFINAL, PD1.IDPROVENTO AS IDMOSTRARUB1, '+
      ' R.ANOMESREF, R.CODPORTFORMA, P.NUMDOCUMENTO AS CPFFAVORECIDO, '+
      ' P.NOME AS FAVORECIDO, PD.DESCRICAO, ALIM.NUMDOCUMENTO AS CPFALIMENTADO, '+
      ' ALIM.NOME AS ALIMENTADO, R.FLGDESATIVADO, R.FLGUSADO, R.FLGCALCULACPMF, '+
      ' R.ULTMESPREPARO, PD1.DESCRICAO, RG.NOMEREGRA, R.FLGCALCULACPMF, '+
      ' R.TRGDTINCLUSAO, R.NUMPROCINSS, R.TRGUSERINCLUSAO, '+
      ' R.FLGRETROACAO, '+ 
      '''                                        '' as nome, '+
    'R.IDRUBRICA13, '+
    'R.IDRUBRICAPROVENTO13, '+
    'R.IDSEQINTERNOFB, '+
    'R.MESCOMPREEM '+   // SOL 140042 Kintana 900220
  ' FROM PROVDESC PD, PESSOA P, PESSOA ALIM, PROVDESC PD1, REGRA RG, RUBRICAINDIV R '+
  ' WHERE R.IDTITULAR = :PIDTITULAR '+
    ' AND R.IDPESSOA = :PIDPESSOA '+
    ' AND R.FLGPENSAOALIM = 1 '+
    ' AND R.IDEMPRESA = :PIDFUNDACAO '+
    ' AND R.FLGTPRUBMANUT = ''1'' '+
    ' AND PD.IDPROVENTO = R.IDRUBRICA '+
    ' AND R.IDFAVORECIDO = P.IDPESSOA(+) '+
    ' AND R.IDALIMENTADO = ALIM.IDPESSOA(+) '+
    ' AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+) '+
    ' AND R.IDREGRACALCULO = RG.IDREGRA(+) '+
//  ' ORDER BY SEQRUBRICAINDIV ') //Everson TIBERO
  ' ORDER BY R.SEQRUBRICAINDIV ') //Everson TIBERO
  else
    qryDet.SQL.Add(
  ' SELECT '+
      //BRUNO AZEVEDO SOL 130928 KINTANA 738408
      ' PD.DESCPARCIAL, '+
      ' PD.FLGDESCONTO, '+
      ' PD.FLGINSS,     '+
      ' PD.FLGIRRF,     '+
      ' PD.CODFONTEPAGADORA, '+ // SOL 140042 Kintana 900220
      //BRUNO AZEVEDO SOL 130928 KINTANA 738408
      //BRUNO AZEVEDO SOL 138969 KINTANA 852277
      ' PD.PRAZO,       '+
      //BRUNO AZEVEDO SOL 138969 KINTANA 852277
      ' R.FLGUSAABONO, R.FLGANTECIPABONO, R.IDALIMENTADO, R.IDTITULAR, R.DATAINICIO, R.FLGBASEPA, R.FLGANTECIPAABONOINSS, '+ // SOL67497 - Daniel Begnami
      ' R.IDPESSOA, R.IDEMPRESA, R.NUMOCORRENCIAS, PD.CODPROVDESC AS IDMOSTRARUB, '+
      ' PD.IDPROVENTO AS IDRUBRICA, R.SEQRUBRICAINDIV, R.IDFAVORECIDO, '+
      ' R.IDREGRACALCULO, R.VALORRUBRICA, R.ANOMESINICIO, R.FLGPERMANENTE, '+
      ' R.PARCELAS, R.FLGPERCENT, R.FLGTPRUBMANUT, R.FLGPENSAOALIM, '+
      ' R.RUBRICAPROVENTOPA, R.DATAFINAL, PD1.CODPROVDESC AS IDMOSTRARUB1, '+
      ' R.ANOMESREF, R.CODPORTFORMA, P.NUMDOCUMENTO AS CPFFAVORECIDO, '+
      ' P.NOME AS FAVORECIDO, PD.DESCRPROVDESC AS DESCRICAO, ALIM.NUMDOCUMENTO AS CPFALIMENTADO, '+
      ' ALIM.NOME AS ALIMENTADO, R.FLGDESATIVADO, R.FLGUSADO, R.FLGCALCULACPMF, '+
      ' R.ULTMESPREPARO, PD1.DESCRPROVDESC AS DESCRICAO, RG.NOMEREGRA, R.FLGCALCULACPMF, '+
      ' R.TRGDTINCLUSAO, R.TRGUSERINCLUSAO, R.NUMPROCINSS, '+
      ' R.FLGRETROACAO, '+ 
      '''                                        '' as nome, '+
    'R.IDRUBRICA13, '+
    'R.IDRUBRICAPROVENTO13, '+
    'R.IDSEQINTERNOFB, '+
    'R.MESCOMPREEM '+ // SOL 140042 Kintana 900220
  ' FROM PROVDESC PD, PESSOA P, PESSOA ALIM, PROVDESC PD1, REGRA RG, RUBRICAINDIV R '+
  ' WHERE R.IDTITULAR = :PIDTITULAR '+
    ' AND R.IDPESSOA = :PIDPESSOA '+
    ' AND R.FLGPENSAOALIM = 1 '+
    ' AND R.IDEMPRESA = :PIDFUNDACAO '+
    ' AND R.FLGTPRUBMANUT = ''1'' '+
    ' AND PD.IDPROVENTO = R.IDRUBRICA '+
    ' AND R.IDFAVORECIDO = P.IDPESSOA(+) '+
    ' AND R.IDALIMENTADO = ALIM.IDPESSOA(+) '+
    ' AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+) '+
    ' AND R.IDREGRACALCULO = RG.IDREGRA(+) '+
//  ' ORDER BY SEQRUBRICAINDIV '); //Everson TIBERO
  ' ORDER BY R.SEQRUBRICAINDIV '); //Everson TIBERO
  qryDet.ParamByName('PIDTITULAR').DataType := ftInteger;
  qryDet.ParamByName('PIDPESSOA').DataType  := ftInteger;
  qryDet.ParamByName('PIDFUNDACAO').DataType:=ftInteger;
end;

procedure TfrmCadRubricaIndiv.btnAlimentadosClick(Sender: TObject);
begin
  inherited;
  if trim(edNomeFavPA.text) <> '' then
    AbrirForm(frmCadAlimentados,TfrmCadAlimentados,false)
  else
    showMessage('Primeiro é preciso selecionar um Favorecido!');
end;

procedure TfrmCadRubricaIndiv.dblcRubricaPACloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;


  If qryDesconto.FieldByName('FLGOBRIGAFAVOREC').AsInteger = 1 Then
  Begin
    If Trim(dblcRubricaPA.Text) <> '' Then
    Begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT P.NOME, R.IDPESSOA, P.NUMDOCUMENTO '+
                     ' FROM RUBRICAXCONTABANCARIA R, PESSOA P '+
                     ' WHERE R.IDRUBRICA = '+dblcRubricaPA.LookupValue+
                       ' AND R.IDPESSOA  = P.IDPESSOA ');
      qryAux.Open;

      If Not qryAux.Eof Then
      Begin
        qryDet.fieldbyname('idfavorecido').AsInteger := qryAux.FieldByName('IDPESSOA').AsInteger;
        edNomeFavPA.Text := qryAux.FieldByName('NOME').AsString;
        edCPFFavPA.Text  := qryAux.FieldByName('NUMDOCUMENTO').AsString;
      End
      Else
      Begin
        qryDet.fieldbyname('idfavorecido').Clear;
        edNomeFavPA.Clear;
        edCPFFavPA.Clear;
      End;
    End;
  End else begin
    qryDet.fieldbyname('idfavorecido').Clear; //Renato Visoni SOL 111120  KINTANA 512276
    edNomeFavPA.Clear;                        //Renato Visoni SOL 111120  KINTANA 512276
    edCPFFavPA.Clear;                         //Renato Visoni SOL 111120  KINTANA 512276
  end;

 // SOL 140042 Kintana 900220
  If Trim(dblcRubricaPA.Text) <> '' Then
  begin
    qryFontepagadora.close;
    qryFontepagadora.ParamByName('IDRUBRICA').asstring  := qryDesconto.FieldByName('IDPROVENTO').asstring;
    qryFontepagadora.open;

    //BRUNO AZEVEDO SOL 140042/6601
    //cmb_mesreembPA.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //spn_anoreembPA.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    edtAnoMesReembPA.Visible         := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //BRUNO AZEVEDO SOL 140042/6601
    grpMesReembolcoPA.Visible        := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);

    //BRUNO AZEVEDO SOL 140042/6601
    //cmb_mesreembPA.ItemIndex:=StrToInt(Copy(datetostr(Date),4,2))-1;
    //spn_anoreembPA.Value:=StrToInt(Copy(datetostr(Date),7,4));
    //edtAnoMesReembPA.Text := (Copy(datetostr(Date),7,4)) + '/' + (Copy(datetostr(Date),4,2));
    //BRUNO AZEVEDO SOL 140042/6601

    //cmb_mesreemboutros.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //spn_anoreemboutros.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //GroupBox5.Visible                    := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
  end;
  // SOL 140042 Kintana 900220

  HabilitaProcInss;
end;

procedure TfrmCadRubricaIndiv.dblcRubricaOutrosCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;


  If qryRubricaOutros.FieldByName('FLGOBRIGAFAVOREC').AsInteger = 1 Then
  Begin
    If Trim(dblcRubricaOutros.Text) <> '' Then
    Begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT P.NOME, R.IDPESSOA, P.NUMDOCUMENTO '+
                     ' FROM RUBRICAXCONTABANCARIA R, PESSOA P '+
                     ' WHERE R.IDRUBRICA = '+dblcRubricaOutros.LookupValue+
                       ' AND R.IDPESSOA  = P.IDPESSOA ');
      qryAux.Open;
      If Not qryAux.Eof Then
      Begin
        If qryAux.RecordCount > 1 Then
        Begin
          qryOutros.fieldbyname('idfavorecido').Clear;
          edNomeFavOutros.Clear;
          edCPFFavOutros.Clear;
          MsgDlg('Existe mais de um favorecido para essa rubrica. Favor verificar cadastro.', 'Informação', mtInformation, [mbOk], 0);
        End
        Else
        Begin
          qryOutros.fieldbyname('idfavorecido').AsInteger := qryAux.FieldByName('IDPESSOA').AsInteger;
          edNomeFavOutros.Text := qryAux.FieldByName('NOME').AsString;
          edCPFFavOutros.Text  := qryAux.FieldByName('NUMDOCUMENTO').AsString;
        End;
      End
      Else
      Begin
        qryOutros.fieldbyname('idfavorecido').Clear;
        edNomeFavOutros.Clear;
        edCPFFavOutros.Clear;
      End;
    End;
  End else begin
    qryOutros.fieldbyname('idfavorecido').Clear;  //Renato Visoni SOL 111120  KINTANA 512276
    edNomeFavOutros.Clear; //Renato Visoni SOL 111120  KINTANA 512276
    edCPFFavOutros.Clear; //Renato Visoni SOL 111120  KINTANA 512276
  end;

 // SOL 140042 Kintana 900220
  If Trim(dblcRubricaOutros.Text) <> '' Then
  begin
    qryFontepagadora.close;
    qryFontepagadora.ParamByName('IDRUBRICA').asstring  := qryRubricaOutros.FieldByName('IDPROVENTO').asstring;
    qryFontepagadora.open;

    //cmb_mesreembPA.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //spn_anoreembPA.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //grpMesReembolcoPA.Visible        := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);

    //BRUNO AZEVEDO SOL 140042/6601
    edtAnoMesReembOutros.Visible         := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //BRUNO AZEVEDO SOL 140042/6601
    //cmb_mesreemboutros.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    //spn_anoreemboutros.Visible           := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);
    GroupBox5.Visible                    := (qryFontepagadora.Fieldbyname('CODFONTEPAGADORA').asInteger = 2);

    //BRUNO AZEVEDO SOL 140042/6601
    //cmb_mesreemboutros.ItemIndex:=StrToInt(Copy(datetostr(Date),4,2))-1;
    //spn_anoreemboutros.Value:=StrToInt(Copy(datetostr(Date),7,4));
    //edtAnoMesReembOutros.Text := (Copy(datetostr(Date),7,4)) + '/' + (Copy(datetostr(Date),4,2));
    //BRUNO AZEVEDO SOL 140042/6601  
  end;
  // SOL 140042 Kintana 900220
end;

procedure TfrmCadRubricaIndiv.HabilitaProcInss;
begin
  If Trim(dblcRubricaPA.Text) <> '' Then
    If qryDesconto.FieldByName('CODFONTEPAGADORA').AsInteger = 2 Then
    Begin
      lblnumprocinss.Enabled   := True;
      dbedtNumProcInss.Enabled := True;
    End
    Else
    Begin
      lblnumprocinss.Enabled   := False;
      dbedtNumProcInss.Enabled := False;
    End
  Else
  Begin
    lblnumprocinss.Enabled   := False;
    dbedtNumProcInss.Enabled := False;
  End;
end;

procedure TfrmCadRubricaIndiv.dsDetStateChange(Sender: TObject);
begin
  inherited;
  If qryDet.State In [dsInsert, dsEdit] Then
    HabilitaProcInss;
end;

procedure TfrmCadRubricaIndiv.dbcboxControlaSaldoClick(Sender: TObject);
begin
  inherited;
  dbredSaldoInicial.enabled:=dbcboxControlaSaldo.checked;
  dbredSaldoAcumulado.enabled:=dbcboxControlaSaldo.checked;
end;

procedure TfrmCadRubricaIndiv.dbrgrpPermanentePAChange(Sender: TObject);
begin
  inherited;
  If qryDet.State in [dsInsert, dsEdit] Then
    If dbrgrpPermanentePA.ItemIndex = 0 Then
      qryDet.FieldByName('DATAFINAL').AsString := '';
end;

procedure TfrmCadRubricaIndiv.dbrgrpPermanenteOutrosChange(
  Sender: TObject);
begin
  inherited;
  If qryOutros.State in [dsInsert, dsEdit] Then
    If dbrgrpPermanenteOutros.ItemIndex = 0 Then
      qryOutros.FieldByName('DATAFINAL').AsString := '';
end;

// SOL 119865 e 118773 Daniel Begnami
function TfrmCadRubricaIndiv.BuscaPlanoContabil(idPessoa : integer  ; iFlgInss : integer ; iIDRubrica : Integer) : String;
var
  sSQL : String;
begin

  // INSS=1 Para o INSS e INSS=0 NÃO é INSS

  if (iFLGINSS = 1) then // Fonte pagadora INSS

    sSQL :=  'SELECT IDPLANPREVCONTAB FROM BENEFBFCIARIO WHERE IDPESSOA = '+IntToStr(idPessoa)+
             ' AND FONTEPAGADORA = 2 AND IDSITBENEFICIO = 1'

  else   // Fonte pagadora NAO é INSS

    sSQL := 'SELECT IDPLANPREVCONTAB, 0 AS ORDEM '+
            '  FROM BENEFBFCIARIO '+
            '  WHERE IDPESSOA = '+IntToStr(idPessoa)+
            '    AND IDPLANOPREV in (SELECT IDPLANOPREV FROM RubricaXplano WHERE IDRUBRICA = '+IntToStr(iIDRubrica)+' ) '+
            '    AND IDSITBENEFICIO = 1'+
            '    AND FONTEPAGADORA = 1'+
            '    AND IDPESSJUR = '+IntToStr(iidpessjur)+
            '  UNION '+
            '  SELECT IDPLANPREVCONTAB, 1 AS ORDEM '+
            '  FROM BENEFBFCIARIO '+
            '  WHERE IDPESSOA = '+IntToStr(idPessoa)+
            '    AND FONTEPAGADORA = 1'+
            '    AND IDPESSJUR = '+IntToStr(iidpessjur)+
            '    AND IDSITBENEFICIO = 1 ORDER BY ORDEM';

  with TwwQuery.Create(dtmBaseDados) do
  begin
    DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

    SQL.Add(sSQL);

    Open;
    if IsEmpty then
      Result := ''
    else
      Result := IntToStr(FieldByName('IDPLANPREVCONTAB').AsInteger);
    Close;
    Free;
  end;

end;
// FIM SOL 119865 e 118773

procedure TfrmCadRubricaIndiv.qryAfterScroll(DataSet: TDataSet);   //SOL 140042 Kintana 900220
begin
  inherited;

  if sldbgrdoutros.Text = '' then
    sldbgrdoutros.Assign(dbgrdOutrasRubricas.Selected);

  dbgrdOutrasRubricas.Selected.Assign(sldbgrdoutros);

end;

end.
{------------------------------------------------------------------------------|
| UNIT: FCADRUBRICAINDIV                                                       |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CADASTRO DE RUBRICAS INDIVIDUAIS PARA PROCESSAMENTO NA PREVIA DA FOLHA.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACERTO NA ELIMINAÇÃO DE REGISTROS.                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/01/2002 A 30/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: ?                                                     |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACERTO NA ELIMINAÇÃO DE REGISTROS                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/03/2002 A 01/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12e                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|   - Proibição de alteração no código da rubrica e seleção de número de       |
|     parcelas processadas quando a rubrica já tiver sido processada.          |
|                                                                              |
|   - Alteração no cálculo do total de parcelas para considerar o abono anual  |
|     no periodo de processamento.                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/04/2002 A 17/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12K                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|   - Implementação do calculo automático da data final de processamento,      |
|     a partir da alteração do número de parcelas                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/05/2002 A 16/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Eliminação do parametro referente a exclusão de rubricas de pensão         |
|   alimenticia apenas no mes de Janeiro.                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/05/2002 A 17/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Cricação de Flag, na aba de Pensão Alimentícia, que indica se a Pensão vai |
|   ter cálculo de cpmf associado ou não.                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/06/2002 A 10/06/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12Z                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do campo ULTMESPREPARO na tabela Rubricaindiv                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2002 A 11/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.10E                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alteração para só permitir efetuar lançamentos com rubricas que estejam no |
| estado de Ativas.                                                            |
|                                                                              |
| - Permitir filtrar e carregar apenas as Regras do grupo de Regras da Folha.  |
| - Permitir exibição de rubricas vinculadas, caso haja apenas uma rubrica,    |
| esta deverá ser selecionada automaticamente.                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/08/2002 A 21/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|   - Permitir procurar o dependente do participante, para isso foi alterado   |
| o componente MontaSelect e algumas alterações no código.                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/09/2002 A 05/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|   - Calcular automaticamente a data da última parcela a ser paga, levando em |
| consideração o CheckBox.                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/04/2003 A 25/04/2003                         |
| PENDÊNCIA: 13821                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Alterar a pasta Outros Rubricas para conter informações de rubrica do favo-  |
| recido (pagamento) e portador forma de pagamento.                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/04/2003 A 25/04/2003                         |
| PENDÊNCIA: 13836                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Acerto na exibição da descrição das rubricas na operação de alteração da     |
| rubrica individual.                                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/04/2003 A 29/04/2003                         |
| PENDÊNCIA: 13882                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Rotina para verificar se pessoa é física.                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/04/2003 A 30/04/2003                         |
| PENDÊNCIA: 13828                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Informar se existem outras regras de mesmo tipo a serem cadastradas.         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/05/2003 A 19/05/2003                         |
| PENDÊNCIA: 13997                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: TODOS                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Resolução da pendência 13997. Testar se a pessoa não é um consignatário,  |
|  e se não for executar o inherited.                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/07/2003 A 15/07/2003                         |
| PENDÊNCIA: 14536                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2003 A 07/08/2003                         |
| PENDÊNCIA: 14791                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ORDENAR DETALHES DA RUBRICAINDIV POR SEQRUBRICAINDIV.                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/10/2004 A 19/10/2004                         |
| PENDÊNCIA: 17952                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR RUBRICAS PARA ABONO                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/10/2004 A 19/10/2004                         |
| PENDÊNCIA: 16715                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR CAMPOS PARA CONTROLE DE SALDO                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/12/2004 A 02/12/2004                         |
| PENDÊNCIA: 18204                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.14a                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - REVISÃO DAS CONSULTAS DE RUBRICAS PARA VERIFICAR BLOQUEIO.                 |
|                                                                              |
|------------------------------------------------------------------------------}

