// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//
// *****************************************************************************
//Alteração   : ( udpDet, qryDet) Adicionado um novo campo DESC_RELACAODEPEN
//Pendência   : WO2919
//Data MERGE  :
//Data        : 13/09/2023
//Responsável : Helen V Bianchi
//Descrição   : Caso seja selec. opçao 99(Relação de Dependência) preencher a Desc.
//--------------------------------------------------------------------------------
//Alteração   : (dfm dbcboxTemAcao udpDet, qryDet) carregaSQLRubricaOutros
//Pendência   : SIG87262
//Data MERGE  : 09/08/2022
//Data        : 13/12/2021
//Responsável : edilaine
//Descrição   : Obrigar seleção de ação judicial
//--------------------------------------------------------------------------------
//Pendência   : SIG94023
//Data        : 13/11/2019
//Responsável : Ewerton Beltramini
//Descrição   : Habilitar a seleção do processo judicial para novas rubricas.
//--------------------------------------------------------------------------------
//Pendência   : SIG83283
//Data        : 22/04/2019
//Responsável : Andre Imakawa
//Descrição   : Listar ações judiciais sem aplicar filtro.
//--------------------------------------------------------------------------------
//Pendência   : SIG53825
//Data        : 27/02/2019
//Responsável : Edilaine
//Descrição   : Criação de parâmetro nas rubricas salariais para não efetuar o
//              pagamento de pensões alimentícias aos favorecidos pela Folha quando
//              estas são pagas pelo INSS mas o favorecido deve sair na DIRF 
//--------------------------------------------------------------------------------
//Pendência   : SIG63035
//Responsável : Osni Cavalcante
//Data        : 15/03/2019
//Descrição   : Utilização de filtro na consulta que exibe os Planos Contábeis
//              para inibir a visualização dos Perfis de Investimetos
//--------------------------------------------------------------------------------
//Pendência   : SIG70586
//Responsável : FHBS - Fábio Henrique Beccaria Sampaio
//Data        : 11/07/2018
//Descrição   : Inclusão do campo para seleção da Ação Judicial para salvar a
//              IdProcJud na tabela RibricaIndiv
//--------------------------------------------------------------------------------
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 20/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//--------------------------------------------------------------------------------
//Pendência   : SIG 60424.60767
//Responsável : Osni Cavalcante
//Data        : 21/12/2017
//Descrição   : Correção na query que carrega os planos contábeis (qryPlanoContabil)
//--------------------------------------------------------------------------------
//Pendência   : SIG35762
//Responsável : RODRIGO RAMOS
//Data        : 29/08/2017
//Descrição   : INCLUSÃO DE PLANO CONTABIL NO CADASTRO DE RUBRICA,
//procedure TfrmCadRubricaIndividual, VALORES INCLUSOS:
//TABELA      : PLANPREVCONTABIL PP
//CAMPOS      : PP.NOME AS PLANOCONTABIL, R.IDPLANOCONTABIL
//CONDIÇÃO    : R.IDPLANOCONTABIL = PP.IDPLANOPREV(+)
//  Rodrigo Ramos INICIO 28-08-2017 SIG35762
//    qryPlanoContabil.Close;
//    qryPlanoContabil.Open;
//  Rodrigo Ramos FIM 28-08-2017 SIG35762
// *****************************************************************************
//
//--------------------------------------------------------------------------------
//Pendência   : SIG 49058
//Responsável : William Santana
//Data        : 03/07/2017
//Descrição   : erro ao atualizar data final de processamento quando tinha 1 parcela
//              (somente DFM - adicionado dbdtInicioChange no evento onExit)   
//--------------------------------------------------------------------------------
//Pendência   : SOL 235509 PPM 467790
//Responsável : Fernando Xavier
//Data        : 31/07/2013
//Descrição   : **ERRO BLOQUEIO USUÁRIO FOLHA**
//--------------------------------------------------------------------------------
//Pendência   : SOL 218919/15588 KTN 2057261
//Responsável : Felipe A. Santos
//Data        : 10/01/2013
//Descrição   : Retirado a mensagem 010 na hora da confirmação do cadastro.
//--------------------------------------------------------------------------------
//Pendência   : SOL 206188 KINTANA 1998343
//Responsável : Higor Nayde Ferreira
//Data        : 27/05/2013
//Descrição   : "Tipo de Rubrica", para que este venha com uma informação em branco,
//              Deverá haver um validação de obrigatoriedade de preenchimento do campo.
//--------------------------------------------------------------------------------
//Pendência   : SOL 196295 KINTANA 1877771
//Responsável : Fernando Xavier
//Data        : 07/12/2012
//Descrição   : Sistema não vincula o favorecido no cadastro de rubricas individuais
//--------------------------------------------------------------------------------
//Pendência   : SOL 192828 KTN 1835460
//Responsável : FELIPE AZEVEDO DOS SANTOS
//Data        : 19/11/2012
//Descrição   : Criação da Interface de Observações
//--------------------------------------------------------------------------------
//Pendência   : SOL 191104 KINTANA 1809176
//Responsável : BRUNO AZEVEDO
//Data        : 25/09/2012
//Descrição   : Ajustes nas regras de seleção das rúbricas.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 10/05/2012
//Descrição   : Ajustes solicitados pela GEPAB:
// -  Alteração da solicitação anterior para verificar se "rubrica a processar"
//    possui CODFONTEPAGADORA = 2 antes de tornar visível campo "Mês/Ano de Reembolso"
//    na seleção da opção "permanente = não"
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 30/04/2012
//Descrição   : Ajustes solicitados pela GEPAB:
// -  Verificar transação ao inserir e alterar ( commit )
// -  Na inclusão, ao clicar na opção permanente = sim o campo “Mês/Ano de Reembolso”,
//    que é apresentado para rubricas do INSS, deve ficar invisível, da mesma forma
//    que acontece com o campo “Mês/Ano de Referência”, e no banco de dados deve ficar com conteúdo nulo.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 09/03/2012
//Descrição   : Ajustes solicitados pela GEPAB:
// - Para rubricas FUNCEF gravar MESCOMPREEM = null
// - As rubricas informativas não devem aparecer no combo "Rubrica a Processar"
// - A data final quando de uma suspensão de um lançamento não deverá ser
//     obrigatório o preenchimento, pois hoje o processo de efetivação insere
//     esta data mensalmente.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 31/01/2012
//Descrição   : Ajustes solicitados pela GEPAB
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 17/05/2011
//Descrição   : Ajustes interfaces de consulta e cadastro de rubricas                     
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 25/03/2011
//Descrição   : Ajustes interfaces de consulta e cadastro de rubricas
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 25/01/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------
unit FCadRubricaIndividualInserir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Mask, DBCtrls,
  fcButton, fcImgBtn, fcShapeBtn, TREdit, wwdblook, Spin, wwdbedit,
  Wwdbspin, wwdbdatetimepicker, CMDateTimePicker, MontaSelect,
  CMDBLookupCombo, Wwdotdot, Wwdbcomb;

type
  TfrmCadRubricaIndividualInserir = class(TfrmOkCancelar)
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    grpRegraPA: TGroupBox;
    lblValorPA: TLabel;
    lblRegraPA: TLabel;
    dbreValor: TDBRealEdit;
    dblcRegraPA: TwwDBLookupCombo;
    fcsbtnRubXPA: TfcShapeBtn;
    cbTipoRubrica: TComboBox;
    Label3: TLabel;
    dsDet: TwwDataSource;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    dbrgrpPermanentePA: TDBRadioGroup;
    grpParcelas: TGroupBox;
    lblParcelasPA: TLabel;
    lblProcPA: TLabel;
    spedParcelas: TwwDBSpinEdit;
    spedNumOcorrenciasPA: TwwDBSpinEdit;
    grpMesReferencia: TGroupBox;
    cmb_mesref: TComboBox;
    spn_anoref: TSpinEdit;
    grpPeriodoPA: TGroupBox;
    lblDePA: TLabel;
    lblAte: TLabel;
    lblUltMesPA: TLabel;
    dbdtInicio: TCMDateTimePicker;
    dbdtFinal: TCMDateTimePicker;
    fcsbtnEstado: TfcShapeBtn;
    dbUltmesProcPalim: TDBEdit;
    lblRubOutros: TLabel;
    sbtnRemRubOutros: TSpeedButton;
    Label5: TLabel;
    dblcRubricaProcesssarAbono: TwwDBLookupCombo;
    sbtnRemRubAbonoOutros: TSpeedButton;
    lblRubFavOutros: TLabel;
    dblcRubricaFavPA: TwwDBLookupCombo;
    sbtnRemRubFavOutros: TSpeedButton;
    Label6: TLabel;
    dblcRubricaFavAbonoPA: TwwDBLookupCombo;
    sbtnRemRubAbonoFavOutros: TSpeedButton;
    Label4: TLabel;
    Label7: TLabel;
    lbMatriculaAssistido: TLabel;
    lbNomeAssistido: TLabel;
    qryPortadorforma: TwwQuery;
    qryRegra: TwwQuery;
    gbxControlaSaldo: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    dbcboxControlaSaldo: TDBCheckBox;
    dbredSaldoInicial: TDBRealEdit;
    dbredSaldoAcumulado: TDBRealEdit;
    gbOpocesOutras: TGroupBox;
    lblSituacaoaJ: TLabel;
    dbcboxUtilizadaAbono: TDBCheckBox;
    dbcboxUtilizadaAtencipAbonoFUNFEC: TDBCheckBox;
    dbcboxUtilizadaAtencipAbonoINSS: TDBCheckBox;
    cboSituacaoAJ: TComboBox;
    lblobservacao: TLabel;
    mmobservacao: TMemo;
    gbOpocesPA: TGroupBox;
    dbchkBasePA: TDBCheckBox;
    dbchkAbonoPA: TDBCheckBox;
    dbchkAntecipAbonoPA: TDBCheckBox;
    cbAntecipaAbonoINSS: TDBCheckBox;
    dbcboxCPMF: TDBCheckBox;
    dbcboxRetroagePA: TDBCheckBox;
    dbcboxRubricaResgate: TDBCheckBox;
    MontaSelectFAV: TMontaSelect;
    qryAux: TwwQuery;
    qryRubProcessar: TwwQuery;
    qryRubPagFavorecido: TwwQuery;
    qryRubProcessarAbono: TwwQuery;
    qryRubPagAbono: TwwQuery;
    lblNumProcInss: TLabel;
    dbedtNumProcInss: TDBEdit;
    dbeSequencialPA: TDBEdit;
    Label1: TLabel;
    grpMesCompetencia: TGroupBox;
    cmb_mesComp: TComboBox;
    spn_anoComp: TSpinEdit;
    gbxFavorecido: TGroupBox;
    lblCPFOutros: TLabel;
    lblNomeFavOutros: TLabel;
    lbDocumentoFavorecido: TLabel;
    lbNomeFavorecido: TLabel;
    lblPortFormaOutros: TLabel;
    sbtnAddFav: TSpeedButton;
    sbtnRemFav: TSpeedButton;
    btnAlimentados: TButton;
    dblkupPortFormaPA: TwwDBLookupCombo;
    dblcRubricaDesconto: TwwDBLookupCombo;
    fcsbtnObservacoes: TfcShapeBtn;
     qryDetSELECIONA: TFloatField;
    qryDetCONTABILIZA: TFloatField;
    qryDetMESREFERENCIA: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetVALORESPERADO: TFloatField;
    qryDetVALORRECEBIDO: TFloatField;
    qryDetDATAPREVISAORECE: TDateTimeField;
    qryDetDATARECEBIMENTO: TDateTimeField;
    qryDetFLGDEVOLUCAO: TFloatField;
    qryDetFLGCALCRESERVA: TFloatField;
    qryDetFLGDESCFOLHA: TFloatField;
    qryDetVALORPARARESERVA: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetORIGEMRECURSO: TStringField;
    qryDetFLGIMPORTADO: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetANODIRF: TFloatField;
    qryDetNOMETIPORECURSO: TStringField;
    qryDetNUMRECEBIMENTO: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDCONTRIBUICAO: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetFLGDIVERGENTE: TFloatField;
    qryDetFLGCONCESSAO: TFloatField;
    qryDetFLGEVENTO: TFloatField;
    qryDetFLGSITFUNDACAO: TStringField;
    qryDetFLGAPORTE: TFloatField;
    qryDetVALORCALCULADO: TFloatField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFINAL: TDateTimeField;
    qryDetIDREGRACALCULO: TFloatField;
    qryDetSITRECEBIMENTO: TStringField;
    qryDetTIPO: TStringField;
    qryDetVALOROP1: TFloatField;
    qryDetVALOROP2: TFloatField;
    qryDetVALOROP3: TFloatField;
    qryDetFLGMANUAL: TFloatField;
    qryDetCODDOCUMENTOPREV: TFloatField;
    qryDetFOLHAORIGEM: TStringField;
    qryDetIDLOTE: TFloatField;
    qryDetFLGALTERADO: TFloatField;
    qryDetCODPORTFORMA: TFloatField;
    qryDetIDTIPORECURSO: TFloatField;
    qryDetDATAEMISSCOB: TDateTimeField;
    qryDetNOMEPLANO: TStringField;
    qryDetIDPLANPREVCONTAB: TFloatField;
    cbxPLANOCONTABIL: TwwDBLookupCombo;
    qryPlanoContabil: TwwQuery;
    DBGrauParentesco: TwwDBComboBox;
    lblAcaoJud: TLabel;
    dblcAcaoJud: TwwDBLookupCombo;
    sbtnAcaoJud: TSpeedButton;
    qryAcaoJud: TwwQuery;
    dbcboxTemAcao: TDBCheckBox;
    dbedtDesc_RelacaoDepen: TDBEdit;
    lblDesc_RelacaoDepen: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnRemRubOutrosClick(Sender: TObject);
    procedure sbtnRemRubAbonoOutrosClick(Sender: TObject);
    procedure sbtnRemRubFavOutrosClick(Sender: TObject);
    procedure sbtnRemRubAbonoFavOutrosClick(Sender: TObject);
    procedure sbtnAddFavClick(Sender: TObject);
    procedure sbtnRemFavClick(Sender: TObject);
    procedure btnAlimentadosClick(Sender: TObject);
    procedure fcsbtnRubXPAClick(Sender: TObject);
    procedure cbTipoRubricaChange(Sender: TObject);
    procedure dbcboxControlaSaldoClick(Sender: TObject);
    procedure dbrgrpPermanentePAChange(Sender: TObject);
    procedure dbrgrpPermanentePAClick(Sender: TObject);
    procedure dblcRubricaDescontoExit(Sender: TObject);
    procedure fcsbtnEstadoClick(Sender: TObject);
    procedure dblcRegraPAChange(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure cboSituacaoAJChange(Sender: TObject);
    procedure mmobservacaoChange(Sender: TObject);
    procedure dbdtInicioChange(Sender: TObject);
    procedure spedParcelasChange(Sender: TObject);
    procedure dblcRubricaDescontoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcRegraPAExit(Sender: TObject);
    procedure dblcRubricaDescontoChange(Sender: TObject);
    procedure dblcRubricaProcesssarAbonoExit(Sender: TObject);
    procedure dblcRubricaProcesssarAbonoChange(Sender: TObject);
    procedure fcsbtnObservacoesClick(Sender: TObject);
    procedure dblcAcaoJudChange(Sender: TObject);
    procedure dblcAcaoJudCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAcaoJudExit(Sender: TObject);
    procedure sbtnAcaoJudClick(Sender: TObject);
    procedure dbdtFinalExit(Sender: TObject);
    procedure DBGrauParentescoChange(Sender: TObject);
  private
    { Private declarations }
    FidPessoa: Integer;
    FidTitular: Integer;
    FidFundacao: Integer;
    FidRubrica: Integer;
    FseqRubricaIndividual: Integer;
    Foperacao: String;
    FnomeAssistido: String;
    FrubricaPA: Boolean;
    FmatriculaAssistido: String;
    habilitaDataChance: Boolean;
    procedure SetidFundacao(const Value: Integer);
    procedure SetidPessoa(const Value: Integer);
    procedure SetidTitular(const Value: Integer);
    procedure SetidRubrica(const Value: Integer);
    procedure SetseqRubricaIndividual(const Value: Integer);
    procedure Setoperacao(const Value: String);
    procedure SetmatriculaAssistido(const Value: String);
    procedure SetnomeAssistido(const Value: String);

    function retornaPeriodoAtual() : String;
    function retornaDataPrimeiroDiaMesAtual() : String;

    function PegaSeqRubricaIndiv() : longint;
    function InserePessoaFisica(aiidpessoa: integer): boolean;
    function VerificaDadosPF(aiidpessoa: integer): boolean;
    procedure VerificaAssociacaoRubrica;
    function VerificaForamAssociadasRubricasExcecao: Boolean;
    procedure ExcluiAssociacaoRubricasExcecao;

    procedure HabilitaProcInss;

    procedure SetaEstado(bAtiva: boolean; fcbtn: TfcShapeBtn);
    function PegaAnoMesRef(acbMes : tcombobox; aspAno : tspinedit) : string;

    procedure trataInserirPA();
    procedure trataInserirOutros();
    procedure carregarSQLSCombos();

    procedure consultarRubricaPA();
    procedure consultarRubricaOutros();

    procedure carregaSQLRubricaPA();
    procedure carregaSQLRubricaOutros();

    procedure SetrubricaPA(const Value: Boolean);
    procedure CalculaDataFinal(qry : twwquery);

    procedure adicionaFavorecido(idPessoa: Integer; sNome, sDocumento: String);
    procedure buscaFavorecidoRubrica(sIdRubrica:String);

    procedure consultarRegrasParaCalculo();
    procedure limpacampos; //Higor Nayde SOL 206188
    procedure ValorCheck;
    procedure habilitaFavorecido; //Rodrigo Ramos SIG35762

    procedure FiltraAcaoJudicial; // Alterado por FHBS - 11/07/2018 - SIG70586

  public
    { Public declarations }
    nAbono: Real;

    property idTitular: Integer read FidTitular write SetidTitular;
    property idPessoa: Integer read FidPessoa write SetidPessoa;
    property idFundacao: Integer read FidFundacao write SetidFundacao;
    property idRubrica: Integer read FidRubrica write SetidRubrica;
    property seqRubricaIndividual: Integer read FseqRubricaIndividual write SetseqRubricaIndividual;
    property nomeAssistido: String read FnomeAssistido write SetnomeAssistido;
    property matriculaAssistido: String read FmatriculaAssistido write SetmatriculaAssistido;
    property rubricaPA: Boolean read FrubricaPA write SetrubricaPA;
    property operacao : String read Foperacao write Setoperacao;
  end;
  
var
  frmCadRubricaIndividualInserir: TfrmCadRubricaIndividualInserir;

implementation

uses UFuncoesFolha, UDataBase, UMensErro, FTelaAut, FCadAlimentadosRI, USistema, uObjFolha,
     fCadRubXPensaoAlimenticiaRI, FCadRubricaIndividual,
     UFuncoesUteisFB,            //edilaine - SIG53825
     FCadObservacao;

{$R *.DFM}

procedure TfrmCadRubricaIndividualInserir.FormShow(Sender: TObject);
var sanomesref: String;
begin
  inherited;

  habilitaDataChance            := False;

  lbNomeAssistido.Caption       := FnomeAssistido;
  lbMatriculaAssistido.Caption  := FmatriculaAssistido;


  if operacao = 'ALTERAR' then
   begin
    if rubricaPA then
     consultarRubricaPA()
    Else
     consultarRubricaOutros();

    lbDocumentoFavorecido.Caption := qryDet.FieldByName('CPFFAVORECIDO').AsString;
    lbNomeFavorecido.Caption      := qryDet.FieldByName('FAVORECIDO').AsString;
    // Higor Nayde Ferreira SOL 206188 KINTANA 1998343
    if rubricaPA then
     cbTipoRubrica.ItemIndex := 1
    Else
     cbTipoRubrica.ItemIndex := 2;

    cbTipoRubricaChange(Sender);

    dbrgrpPermanentePAClick(Sender);

    SetaEstado(qryDet.fieldbyname('FLGDESATIVADO').isnull or (qryDet.fieldbyname('FLGDESATIVADO').asinteger=0), fcsbtnEstado);

    if not qryDet.FieldByName('ANOMESREF').isnull then
      if (length(qryDet.FieldByName('ANOMESREF').asstring) = 7) then
        try
          cmb_mesref.ItemIndex:=StrToInt(Copy(qryDet.FieldByName('ANOMESREF').asstring,6,2))-1;
          spn_anoref.Value:=StrToInt(Copy(qryDet.FieldByName('ANOMESREF').asstring,1,4));
        except

        end;

    if (not qryDet.FieldByName('MESCOMPREEM').isnull) and
       (length(qryDet.FieldByName('MESCOMPREEM').asstring) = 7) and
       (cmb_mesComp.Visible) then
        try
          cmb_mesComp.ItemIndex  :=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,6,2))-1;
          spn_anoComp.Value      :=StrToInt(Copy(qryDet.FieldByName('MESCOMPREEM').asstring,1,4));
        except

        end;

    if not rubricaPA then
     begin
        try
          if qryDet.FieldByName('SITUACAOAJ').AsString = '' then
             cboSituacaoAJ.ItemIndex := 0
          else
          if qryDet.FieldByName('SITUACAOAJ').AsString = 'Em Liminar' then
             cboSituacaoAJ.ItemIndex := 1
          else
          if qryDet.FieldByName('SITUACAOAJ').AsString = 'Ganha' then
             cboSituacaoAJ.ItemIndex := 2
          else
             cboSituacaoAJ.ItemIndex := 3;

          mmobservacao.Text := qryDet.FieldByName('OBSERVACAO').AsString;
          
        except
        end;


     end;


    dblcRubricaDescontoExit(Sender);

    qryDet.Edit;
  end
 Else
  begin
   consultarRubricaPA();

   lbDocumentoFavorecido.Caption := '';
   lbNomeFavorecido.Caption      := '';

   qryDet.Insert;
   qryDet.FieldByName('IDTITULAR').asinteger    := idTitular;
   qryDet.FieldByName('IDPESSOA').asinteger     := idPessoa;
   qryDet.FieldByName('IDEMPRESA').asinteger    := idFundacao;
   qryDet.FieldByName('DATAINICIO').AsString    := retornaDataPrimeiroDiaMesAtual();
   qryDet.FieldByName('FLGPERMANENTE').AsString  := '0';
   qryDet.FieldByName('NUMOCORRENCIAS').AsString := '0';

   cbTipoRubrica.ItemIndex := 0;
   cbTipoRubricaChange(Sender);
   dbrgrpPermanentePAClick(Sender);
   SetaEstado(true, fcsbtnEstado);

   sanomesref := retornaPeriodoAtual();

   cmb_mesref.ItemIndex:=StrToInt(Copy(sanomesref,6,2))-1;
   spn_anoref.Value:=StrToInt(Copy(sanomesref,1,4));

   cmb_mesComp.ItemIndex:=StrToInt(Copy(sanomesref,6,2))-1;
   spn_anoComp.Value:=StrToInt(Copy(sanomesref,1,4));

   grpMesCompetencia.Visible   := False;

  end;

  habilitaDataChance  := True;

  //BRUNO AZEVEDO SOL 191104
  dblcRubricaFavPA.Enabled      := (Trim(dblcRubricaDesconto.Text) <> '');
  dblcRubricaFavAbonoPA.Enabled := (Trim(dblcRubricaProcesssarAbono.Text) <> '');
  //BRUNO AZEVEDO SOL 191104

end;

procedure TfrmCadRubricaIndividualInserir.SetidFundacao(
  const Value: Integer);
begin
  FidFundacao := Value;
end;

procedure TfrmCadRubricaIndividualInserir.SetidPessoa(
  const Value: Integer);
begin
  FidPessoa := Value;
end;

procedure TfrmCadRubricaIndividualInserir.SetidRubrica(
  const Value: Integer);
begin
  FidRubrica := Value;
end;

procedure TfrmCadRubricaIndividualInserir.SetidTitular(
  const Value: Integer);
begin
  FidTitular := Value;
end;

procedure TfrmCadRubricaIndividualInserir.SetseqRubricaIndividual(
  const Value: Integer);
begin
  FseqRubricaIndividual := Value;
end;

procedure TfrmCadRubricaIndividualInserir.FormCreate(Sender: TObject);
begin
  inherited;
  qryPortadorforma.Open;
  consultarRegrasParaCalculo();
end;

procedure TfrmCadRubricaIndividualInserir.bbtnConfirmarClick(
  Sender: TObject);
var sNomeCampos : String;
    sanomesref : string;
begin
//  ValorCheck;


  if not(qryDet.state in [dsinsert,dsedit]) then  // SOL 235509 PPM 467790  validação incluida, pois ao dar a mensagem de usuario bloqueado e clicar novamente no botão OK ocorre um erro.
  begin
     qryDet.Edit;
  end;

  inherited;

  //MSG023  //edilaine SIG87262 : inicio
  if (dbcboxTemAcao.checked) and (dblcAcaoJud.visible) and (dblcAcaoJud.text = '') then
  begin
    MsgDlg('É necessário selecionar uma Ação Judicial!','Informação',mtInformation,[mbOK], 0);
    dblcAcaoJud.SetFocus;
    Exit;
  end;


  if (dblcAcaoJud.visible) and (dblcAcaoJud.text <> '') and (not dbcboxTemAcao.checked) then
      qryDet.FieldByName('FLGPOSSUIACJUD').AsInteger := 1;
  //MSG023  //edilaine SIG87262 : fim

  //MSG022  // Higor Nayde Ferreira SOL 206188 KINTANA 1998343
  if (cbTipoRubrica.text = '') then
     begin
       MsgDlg('O Campo Tipo de Rubrica é obrigatório. Favor Preencher!','Informação',mtInformation,[mbOK], 0);
       cbTipoRubrica.SetFocus;
       Exit;
     end;


  //MSG001
  if Trim(dblcRubricaDesconto.Text) = '' then
    begin
      MsgDlg('O preenchimento da Rubrica de Desconto é obrigatório.', 'Informação',
             mtInformation, [mbOk], 0);
      dblcRubricaDesconto.SetFocus;
      Exit;
    end;

  //MSG002
  if dbreValor.Value <= 0 then
   begin
      MsgDlg('O campo Valor/Percentual não pode ser menor ou igual a zero', 'Informação',
             mtInformation, [mbOk], 0);
      dbreValor.SetFocus;
      Exit;

   end;

  //MSG003
  if (dbrgrpPermanentePA.ItemIndex = 0) and (dbdtInicio.text = '') then
   begin
      MsgDlg('Data de início é de preenchimento obrigatório', 'Informação',
             mtInformation, [mbOk], 0);
      dbdtInicio.SetFocus;
      Exit;

   end;

  //MSG004
  if (dbrgrpPermanentePA.ItemIndex = 1) and (cmb_mesref.Visible) and (cmb_mesref.text = '') then
   begin
      MsgDlg('Mês/Ano de Referência é de preenchimento obrigatório', 'Informação',
             mtInformation, [mbOk], 0);
      cmb_mesref.SetFocus;
      Exit;

   end;

  //MSG005
  if (dbrgrpPermanentePA.ItemIndex = 1) and (spedParcelas.Visible) and (spedParcelas.text = '') then
   begin
      MsgDlg('O número de parcelas é de preenchimento obrigatório para rúbricas temporárias', 'Informação',
             mtInformation, [mbOk], 0);
      spedParcelas.SetFocus;
      Exit;

   end;

  //MSG006
  if (dbrgrpPermanentePA.ItemIndex = 1) and (dbdtFinal.Visible) and (dbdtFinal.text = '') then
   begin
      MsgDlg('A data fim de processamento é de preenchimento obrigatório para rúbricas temporárias', 'Informação',
             mtInformation, [mbOk], 0);
      dbdtFinal.SetFocus;
      Exit;
   end;

  if (dbrgrpPermanentePA.ItemIndex = 1) and (dbdtInicio.Visible) and (dbdtInicio.text = '') then
   begin
      MsgDlg('A data inicio de processamento é de preenchimento obrigatório para rúbricas temporárias', 'Informação',
             mtInformation, [mbOk], 0);
      dbdtFinal.SetFocus;
      Exit;
   end;

  if (dbrgrpPermanentePA.ItemIndex = 1) and (spedParcelas.Visible) and (spedParcelas.Value <=0 ) then
   begin
      MsgDlg('A quantidade de parcelas é de preenchimento obrigatório para rúbricas temporárias', 'Informação',
             mtInformation, [mbOk], 0);
      spedParcelas.SetFocus;
      Exit;
   end;


// A data final quando de uma suspensão de um lançamento não deverá ser obrigatório o preenchimento,
// pois hoje o processo de efetivação insere esta data mensalmente ( Leandro/GEPAB )
(*
  //MSG007
  if (fcsbtnEstado.caption <> 'ATIVO') and (dbdtFinal.text = '') then
   begin
      MsgDlg('A data fim de processamento é de preenchimento obrigatório', 'Informação', mtInformation, [mbOk], 0);
      dbdtFinal.SetFocus;
      Exit;
   end;
*)

  //MSG008
  if (not dbcboxControlaSaldo.Checked) and ( (dbredSaldoInicial.Value > 0) or (dbredSaldoAcumulado.Value > 0) ) then
   begin
      if MsgDlg('Você optou por desmarcar o controle de saldo.' +#13#10+
                'Os valores Saldo Inicial e Saldo Acumulado serão zerados.' +#13#10+
                'Confirma a operação ?','Verifique',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes then
         begin
            dbredSaldoInicial.Value := 0;
            dbredSaldoAcumulado.Value := 0;
         end
      Else
         Exit;
   end;

  //MSG009
  if (not fcsbtnRubXPA.Enabled) and VerificaForamAssociadasRubricasExcecao  then
   begin
      sNomeCampos := '';

      if (qryDet.fieldbyname('IDFAVORECIDO').isnull) or (qryDet.fieldbyname('IDFAVORECIDO').asinteger = 0) then
          sNomeCampos := sNomeCampos + 'Favorecido' + #13#10;
      if (qryDet.fieldbyname('IDREGRACALCULO').isnull) or (qryDet.fieldbyname('IDREGRACALCULO').asinteger = 0) then
          sNomeCampos := sNomeCampos + 'Favorecido' + #13#10;

      if MsgDlg('A associação das rubricas de exceção será excluída pois os campos: "Favorecido" e "Regra para Cálculo" ' + #13#10 +
                'são obrigatórios. Deseja continuar ? ','Verifique',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
         Exit;

      ExcluiAssociacaoRubricasExcecao;
   end;

  //MSG010
  // Felipe A. Santos SOL 218919/15588 KTN 2057261
  {if (dbcboxControlaSaldo.Checked) and ( (dbredSaldoInicial.Value = 0) or (dbredSaldoInicial.Value <>  dbreValor.Value ) ) then
   begin
      MsgDlg('O campo valor inicial é de preenchimento obrigatório para controle de saldo ' + #13#10 +
                'e deve ser igual ao campo Valor/Percentual registrado.','Informação', mtInformation, [mbOk], 0);
      Exit;
   end; }
  // Felipe A. Santos SOL 218919/15588 KTN 2057261  - fim

  //MSG011
  if dbcboxUtilizadaAbono.Checked then
    begin
      if (trim(dblcRubricaProcesssarAbono.text) ='')  then
      begin
        MsgDlg('O campo Rubrica a processar no Abono é de preenchimento obrigatório ' +#13#10+
               'quando a opção Utilizada no Abono Anual for selecionada.', 'Informação',
               mtInformation, [mbOk], 0);
        Exit;
     end;
    end;

  if (dbrgrpPermanentePA.ItemIndex = 0) and (fcsbtnEstado.caption = 'ATIVO') and (dbdtFinal.text <> '') then
   begin
      MsgDlg('A data fim de processamento não deve ser informada para rubricas permanentes e ativas.', 'Informação', mtInformation, [mbOk], 0);
      dbdtFinal.SetFocus;
      Exit;
   end;

  if   (Trim(qryRubProcessar.Text) <> '')
   and (qryRubProcessar.FieldByName('CODFONTEPAGADORA').AsInteger = 2)
   and (cmb_mesComp.Visible)
   and (cmb_mesComp.text = '') then
   begin
      if MsgDlg('Mês/Ano de Competência não informado.' + #13#10 +
                'Deseja continuar ? ','Verifique',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
      begin
        cmb_mesComp.SetFocus;
        Exit;
      end;
   end;

  If   (Trim(dblcRubricaDesconto.Text) <> '')
   and (qryRubProcessar.FieldByName('FLGOBRIGAFAVOREC').AsInteger = 1)
   and (qryDet.FieldByName('IDFAVORECIDO').IsNull) then
   begin
      MsgDlg('O campo Favorecido é de preenchimento obrigatório para a rubrica selecionada', 'Informação', mtInformation, [mbOk], 0);
      Exit;
   end;

  if   (cbTipoRubrica.ItemIndex = 1)
   and (qryDet.FieldByName('FLGNAOPAGAFAVOREC').AsInteger = 0)     //edilaine - SIG53825
   and (not qryDet.FieldByName('IDFAVORECIDO').IsNull)
   and (Trim(dblcRubricaFavPA.Text) = '') then
   begin
      MsgDlg('O campo Rubrica de Pagamento do Favorecido é de preenchimento obrigatório ' +#13#10+
               'para rubricas de pensão alimentícia com um favorecido selecionado', 'Informação', mtInformation, [mbOk], 0);
      dblcRubricaFavPA.SetFocus;
      Exit;
   end;

//douglas.siqueira
  If(Trim(dblcRegraPA.Text) = '') and (trim(operacao) ='INSERIR') then
   begin
      MsgDlg('É necessário preencher a regra de cálculo', 'Informação', mtInformation, [mbOk], 0);
      dblcRegraPA.SetFocus;
      Exit;
   end;
//douglas.siqueira



  qryDet.FieldByName('FLGTPRUBMANUT').Asstring  := '1';

  if not SistemaFolha.FlgForcaDataFinalRubIndiv then
    if dbrgrpPermanentePA.ItemIndex = 0 then
       qryDet.FieldByName('DATAFINAL').Clear;

  if dbrgrpPermanentePA.ItemIndex = 0 then
   begin
    qryDet.FieldByName('PARCELAS').AsInteger := 1;
    qryDet.FieldByName('NUMOCORRENCIAS').AsInteger := 0;
   end;

  if qryDet.FieldByName('NUMOCORRENCIAS').AsString = '' then
    qryDet.FieldByName('NUMOCORRENCIAS').AsInteger := 0;

  if qryDet.FieldByName('PARCELAS').AsString = '' then
    qryDet.FieldByName('PARCELAS').AsInteger := 0;

  if qryDet.State = dsInsert then begin
    qryDet.FieldByName('SEQRUBRICAINDIV').AsInteger:=PegaSeqRubricaIndiv();
  end;

  if qryDet.FieldByName('IDSEQINTERNOFB').isnull then
    qryDet.FieldByName('IDSEQINTERNOFB').asinteger := LeUltRegistro(nil, 'SEQINTERNOFB');

  if cbTipoRubrica.ItemIndex = 1 then
   qryDet.FieldByName('FLGPENSAOALIM').AsInteger := 1
  Else
   qryDet.FieldByName('FLGPENSAOALIM').AsInteger := 0;

  if qryDet.fieldbyname('FLGPERMANENTE').asinteger = 0 then
  begin
    sanomesref:=PegaAnoMesRef(cmb_mesref, spn_anoref);
    if sanomesref <> '' then
      qryDet.FieldByName('ANOMESREF').asstring:=sanomesref;
  end;

  if (dbrgrpPermanentePA.ItemIndex = 0)  and (trim(operacao) ='INSERIR') then
   begin
       qryDet.FieldByName('MESCOMPREEM').Clear;
   end
  Else if   (Trim(qryRubProcessar.Text) <> '')
   and (qryRubProcessar.FieldByName('CODFONTEPAGADORA').AsInteger = 1) then
    begin
       qryDet.FieldByName('MESCOMPREEM').Clear;
    end
  Else
    begin
      sanomesref:=PegaAnoMesRef(cmb_mesComp, spn_anoComp);
      qryDet.FieldByName('MESCOMPREEM').asstring := sanomesref;
    end;

  if (fcsbtnEstado.caption = 'ATIVO') then
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=0
  else
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=1;

  if (dbrgrpPermanentePA.ItemIndex = 0) and (fcsbtnEstado.caption = 'ATIVO') then
    qryDet.FieldByName('DATAFINAL').Clear;

  if not rubricaPA then
   begin
    qryDet.FieldByName('SITUACAOAJ').AsString  := cboSituacaoAJ.Items.Strings[cboSituacaoAJ.ItemIndex];
    //qryDet.FieldByName('OBSERVACAO').AsString  := mmobservacao.Lines.Text;
   end
  Else
   begin
    qryDet.FieldByName('SITUACAOAJ').Clear;
    //qryDet.FieldByName('OBSERVACAO').Clear;
   end;
    if (dbUltmesProcPalim.text = '')then
 qryDet.FieldByName('ULTMESPREPARO').AsString := '';


  //Rodrigo Ramos = SIG35762
   if (cbTipoRubrica.itemindex = 1) and (qryRubProcessar.active) and (DBGrauParentesco.text ='') and (qryRubProcessar.FieldByName('FLGOBRIGAFAVOREC').AsInteger = 1) then
   begin
     MsgDlg('É necessário informar a Relação de Dependência', 'Informação',
     mtInformation, [mbOk], 0);
      DBGrauParentesco.SetFocus;
      Exit;
   end;
//Rodrigo Ramos = SIG35762

//Helen V Bianchi - WO2919 - Inicio
  if (DBGrauParentesco.text = '99 - Agregado/Outros') and (dbedtDesc_RelacaoDepen.text ='') then begin
     dbedtDesc_RelacaoDepen.visible := True;
     lblDesc_RelacaoDepen.visible   := True;
     MsgDlg('É necessário informar a descriçao da Dependência', 'Informação',
     mtInformation, [mbOk], 0);
     dbedtDesc_RelacaoDepen.SetFocus;
     Exit;
  end;
//Helen V Bianchi - WO2919 - Fim
//  if operacao = 'INSERIR'
  qryDet.ApplyUpdates;

  ModalResult := mrOK;

end;

procedure TfrmCadRubricaIndividualInserir.sbtnRemRubOutrosClick(
  Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDRUBRICA').Clear;
end;

procedure TfrmCadRubricaIndividualInserir.sbtnRemRubAbonoOutrosClick(
  Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDRUBRICA13').Clear;
end;

procedure TfrmCadRubricaIndividualInserir.sbtnRemRubFavOutrosClick(
  Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('RUBRICAPROVENTOPA').Clear;
end;

procedure TfrmCadRubricaIndividualInserir.sbtnRemRubAbonoFavOutrosClick(
  Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('RUBRICAPROVENTOPA').Clear;
end;

procedure TfrmCadRubricaIndividualInserir.Setoperacao(const Value: String);
begin
  Foperacao := Value;
end;

procedure TfrmCadRubricaIndividualInserir.sbtnAddFavClick(Sender: TObject);
begin
  inherited;
  MontaSelectFAV.Executar;
  if (MontaSelectFAV.ValoresChave.Count > 0) and
     (MontaSelectFAV.ValoresChave[0] <> '') then
  begin
    adicionaFavorecido(StrToInt(MontaSelectFAV.ValoresChave[0])
                     , MontaSelectFAV.ValoresChave[1]
                     , MontaSelectFAV.ValoresChave[2]);
(*
    if VerificaPessoaFisica(qryAux, StrToInt(MontaSelectFAV.ValoresChave[0])) then
    begin
      if InserePessoaFisica(StrToInt(MontaSelectFAV.ValoresChave[0])) then
      begin
        VerificaDadosPF(StrToInt(MontaSelectFAV.ValoresChave[0]));
        qryDet.FieldByName('IDFAVORECIDO').AsInteger:=StrToInt(MontaSelectFAV.ValoresChave[0]);
        VerificaAssociacaoRubrica;
        lbNomeFavorecido.Caption      := MontaSelectFAV.ValoresChave[1];
        lbDocumentoFavorecido.Caption := MontaSelectFAV.ValoresChave[2];
      end;
    end;
*)
  end;
end;

function TfrmCadRubricaIndividualInserir.InserePessoaFisica(
  aiidpessoa: integer): boolean;
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

function TfrmCadRubricaIndividualInserir.VerificaDadosPF(
  aiidpessoa: integer): boolean;
begin
  if not FazQuery(qryAux, 'select p.nome from pessoa p,contabancaria c '+
                          'where p.numdocumento is not null '+
                          iff(qryDet.FieldByName('FLGNAOPAGAFAVOREC').AsInteger = 0,
                             'and c.idpessoa = p.idpessoa ', 'and c.idpessoa(+) = p.idpessoa ' )+
                          'and p.idpessoa = '+inttostr(aiidpessoa)) then
  begin
    MsgDlg('A pessoa selecionada não tem cadastradas as informações de Nº de CPF e/ou '+#13#13+
           'conta corrente.','Erro', mtError, [mbOK], 0);
    result := false;
  end
  else
    result := true;

end;

procedure TfrmCadRubricaIndividualInserir.VerificaAssociacaoRubrica;
begin
  fcsbtnRubXPA.enabled:=not (
     (qryDet.fieldbyname('idfavorecido').isnull) or
     (qryDet.fieldbyname('idfavorecido').asinteger = 0) or
     (qryDet.fieldbyname('seqrubricaindiv').isnull) or
     (qryDet.fieldbyname('seqrubricaindiv').asinteger = 0) or
     (qryDet.fieldbyname('IDREGRACALCULO').isnull) or
     (qryDet.fieldbyname('IDREGRACALCULO').asinteger = 0) or
     (cbTipoRubrica.ItemIndex = 2 ) );  // Higor Nayde Ferreira SOL 206188 KINTANA 1998343
end;

procedure TfrmCadRubricaIndividualInserir.sbtnRemFavClick(Sender: TObject);
begin
  inherited;
  if (qryDet.State in [dsEdit,dsInsert]) then
  begin
      qryDet.FieldByName('IDFAVORECIDO').clear;
      qryDet.FieldByName('RELACAODEPEN').clear;    //Rodrigo Ramos SIG 35762
      qryDet.FieldByName('DESC_RELACAODEPEN').clear;  //Helen V Bianchi WO2919
  end;
  VerificaAssociacaoRubrica;
  lbNomeFavorecido.Caption      := '';
  lbDocumentoFavorecido.Caption := '';
  if (qryDet.State in [dsEdit,dsInsert]) then
   begin
    qryDet.FieldByName('RUBRICAPROVENTOPA').clear;
    qryDet.FieldByName('CODPORTFORMA').clear;
   end;

end;

procedure TfrmCadRubricaIndividualInserir.btnAlimentadosClick(
  Sender: TObject);
begin
  inherited;
  if trim(lbNomeFavorecido.Caption) <> '' then
   begin
      try
        frmCadAlimentadosRI := TfrmCadAlimentadosRI.Create(Application);
        frmCadAlimentadosRI.ShowModal;
      finally
        FreeAndNil(frmCadAlimentadosRI);
      end;
   end
  else
    MsgDlg('Primeiro é preciso selecionar um Favorecido!','Verifique', mtInformation, [mbok], 0);
end;

procedure TfrmCadRubricaIndividualInserir.fcsbtnRubXPAClick(
  Sender: TObject);
begin
  inherited;
  try
    frmCadRubXPensaoAlimenticiaRI := TfrmCadRubXPensaoAlimenticiaRI.Create(Application);
    frmCadRubXPensaoAlimenticiaRI.ShowModal;
  finally
    FreeAndNil(frmCadRubXPensaoAlimenticiaRI);
  end;
end;

procedure TfrmCadRubricaIndividualInserir.cbTipoRubricaChange( Sender: TObject);
begin
  inherited;
  // Higor Nayde Ferreira SOL 206188 KINTANA 1998343
  gbxFavorecido.Visible    := False;
  gbxControlaSaldo.Visible := ( cbTipoRubrica.ItemIndex = 2 );
  gbOpocesOutras.Visible   := ( cbTipoRubrica.ItemIndex = 2 );
  gbOpocesPA.Visible       := ( cbTipoRubrica.ItemIndex = 1 )or( cbTipoRubrica.ItemIndex = 0);
  btnAlimentados.Visible   := ( cbTipoRubrica.ItemIndex = 1 )or( cbTipoRubrica.ItemIndex = 0);
  if (cbTipoRubrica.ItemIndex <> -1) then
   gbxFavorecido.Visible    := True;

  // Higor Nayde Ferreira SOL 206188 KINTANA 1998343
  carregarSQLSCombos();

  VerificaAssociacaoRubrica();

  HabilitaProcInss();
  habilitaFavorecido(); //Rodrigo Ramos SIG35762

  //edilaine - SIG53825 - inicio
  lbDocumentoFavorecido.Caption := qryDet.FieldByName('CPFFAVORECIDO').AsString;
  lbNomeFavorecido.Caption      := qryDet.FieldByName('FAVORECIDO').AsString;
  //edilaine - SIG53825 - fim

  if habilitaDataChance then
   begin
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
   end;
   if (cbTipoRubrica.ItemIndex = 0) then //and (qryDet.State in [dsEdit])  then
     limpacampos;

  FiltraAcaoJudicial; // Alterado por FHBS - 11/07/2018 - SIG70586

  
end;

procedure TfrmCadRubricaIndividualInserir.SetmatriculaAssistido(
  const Value: String);
begin
  FmatriculaAssistido := Value;
end;

procedure TfrmCadRubricaIndividualInserir.SetnomeAssistido(
  const Value: String);
begin
  FnomeAssistido := Value;
end;

procedure TfrmCadRubricaIndividualInserir.dbcboxControlaSaldoClick(
  Sender: TObject);
begin
  inherited;
  dbredSaldoInicial.enabled   := dbcboxControlaSaldo.checked;
  dbredSaldoAcumulado.enabled := dbcboxControlaSaldo.checked;
end;

procedure TfrmCadRubricaIndividualInserir.dbrgrpPermanentePAChange( Sender: TObject);
begin
  inherited;

  if not (qryDet.State in [dsInsert, dsEdit] ) Then
     Exit;

  if dbrgrpPermanentePA.ItemIndex = 0 Then
      qryDet.FieldByName('DATAFINAL').AsString := '';

  if ((dbrgrpPermanentePA.ItemIndex = 1)  and (spedParcelas.value = 0)) then
   qryDet.FieldByName('PARCELAS').AsString := '1';

  if ((dbrgrpPermanentePA.ItemIndex = 1)  and (spedParcelas.value > 0) and (dbdtInicio.date > 0)) then
  begin
    CalculaDataFinal(qryDet);
    dbdtFinal.Update;
  end;

  if habilitaDataChance then
   begin
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
   end;

end;

procedure TfrmCadRubricaIndividualInserir.dbrgrpPermanentePAClick(Sender: TObject);
begin
  inherited;

  lblParcelasPA.Visible         :=dbrgrpPermanentePA.ItemIndex <> 0;
  spedParcelas.Visible          :=dbrgrpPermanentePA.ItemIndex <> 0;
  lblProcPA.Visible             :=dbrgrpPermanentePA.ItemIndex <> 0;
  spedNumOcorrenciasPA.Visible  :=dbrgrpPermanentePA.ItemIndex <> 0;

  dbdtFinal.Visible          := (dbrgrpPermanentePA.ItemIndex <> 0) or SistemaFolha.FlgForcaDataFinalRubIndiv;
  lblAte.visible             := (dbrgrpPermanentePA.ItemIndex <> 0) or SistemaFolha.FlgForcaDataFinalRubIndiv;
  grpMesReferencia.Visible   := dbrgrpPermanentePA.ItemIndex <> 0;

  if (trim(operacao) ='INSERIR') then
   begin
     if (dbrgrpPermanentePA.ItemIndex = 0) then
         grpMesCompetencia.Visible := False
     Else if (Trim(dblcRubricaDesconto.Text) <> '')
         and (qryRubProcessar.FieldByName('CODFONTEPAGADORA').AsInteger = 2)
         and (dbrgrpPermanentePA.ItemIndex <> 0) then
       begin
         grpMesCompetencia.Visible := True;
       end;
   end;

end;

procedure TfrmCadRubricaIndividualInserir.dblcRubricaDescontoExit(
  Sender: TObject);
begin
  inherited;
  if qryDet.State = dsInsert then
    if qryDet.FieldByName('SEQRUBRICAINDIV').isnull then
      qryDet.FieldByName('SEQRUBRICAINDIV').AsInteger:= PegaSeqRubricaIndiv();

  VerificaAssociacaoRubrica;
  HabilitaProcInss();

  if   (Trim(qryRubProcessar.Text) <> '')
   and (qryRubProcessar.FieldByName('CODFONTEPAGADORA').AsInteger <> 2)
   and (grpMesCompetencia.Visible) then
   begin
     grpMesCompetencia.Visible := False;
   end
  Else if   (Trim(qryRubProcessar.Text) <> '')
   and (qryRubProcessar.FieldByName('CODFONTEPAGADORA').AsInteger = 2)
   and (not grpMesCompetencia.Visible) then
   begin
     grpMesCompetencia.Visible := True;
   end;

   //BRUNO AZEVEDO SOL 191104
   carregarSQLSCombos();

   FiltraAcaoJudicial; // Alterado por FHBS - 11/07/2018 - SIG70586
end;

procedure TfrmCadRubricaIndividualInserir.SetaEstado(bAtiva: boolean;
  fcbtn: TfcShapeBtn);
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

procedure TfrmCadRubricaIndividualInserir.fcsbtnEstadoClick(Sender: TObject);
begin
  inherited;
  SetaEstado(not (fcsbtnEstado.caption = 'ATIVO'), fcsbtnEstado);

  if (fcsbtnEstado.caption = 'ATIVO') then
    qryDet.FieldByName('DATAFINAL').Clear;

  if habilitaDataChance then
   begin
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
   end;

end;

function TfrmCadRubricaIndividualInserir.PegaSeqRubricaIndiv(): longint;
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT MAX(SEQRUBRICAINDIV) AS SEQRUBRICAINDIV '+
                   ' FROM RUBRICAINDIV '+
                   ' WHERE IDPESSOA = ' + inttostr(idPessoa)+
                   ' AND IDEMPRESA = ' + IntToStr(idFundacao)+
                   ' AND IDRUBRICA = ' + qryRubProcessar.FieldByName('IDPROVENTO').AsString );

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

procedure TfrmCadRubricaIndividualInserir.trataInserirOutros();
 var sanomesref : string;
begin
  inherited;
  // Gravar campos internos
  qryDet.FieldByName('IDEMPRESA').AsInteger     :=idFundacao;

  qryDet.FieldByName('IDPESSOA').AsInteger      := idPessoa;
  qryDet.FieldByName('IDTITULAR').AsInteger     := idTitular;
  qryDet.FieldByName('IDRUBRICA').AsInteger     := idRubrica;
  qryDet.FieldByName('FLGTPRUBMANUT').asstring  := '1';

  if qryDet.FieldByName('NUMOCORRENCIAS').AsString = '' then
    qryDet.FieldByName('NUMOCORRENCIAS').AsInteger := 0;

  if qryDet.FieldByName('PARCELAS').AsString = '' then
    qryDet.FieldByName('PARCELAS').AsInteger := 0;

  if qryDet.State = dsInsert then begin
    qryDet.FieldByName('SEQRUBRICAINDIV').AsInteger:=PegaSeqRubricaIndiv();
  end;


  qryDet.FieldByName('FLGPENSAOALIM').AsInteger := 0;
  if qryDet.fieldbyname('FLGPERMANENTE').asinteger = 0 then
  begin
    sanomesref:=PegaAnoMesRef(cmb_mesref, spn_anoref);
    if sanomesref <> '' then
      qryDet.FieldByName('ANOMESREF').asstring:=sanomesref;
  end;

  if (fcsbtnEstado.caption = 'ATIVO') then
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=0
  else
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=1;

  if qryDet.FieldByName('IDSEQINTERNOFB').isnull then
    qryDet.FieldByName('IDSEQINTERNOFB').asinteger := LeUltRegistro(nil, 'SEQINTERNOFB');


end;

procedure TfrmCadRubricaIndividualInserir.trataInserirPA;
 var sanomesref : string;
begin
  inherited;
  qryDet.FieldByName('FLGTPRUBMANUT').Asstring  := '1';

  qryDet.FieldByName('FLGPENSAOALIM').AsInteger := 1;

  if qryDet.FieldByName('NUMOCORRENCIAS').AsString = '' then
    qryDet.FieldByName('NUMOCORRENCIAS').AsInteger := 0;

  if qryDet.FieldByName('PARCELAS').AsString = '' then
    qryDet.FieldByName('PARCELAS').AsInteger := 0;


  if qryDet.fieldbyname('FLGPERMANENTE').asinteger = 0 then
   begin
     sanomesref:=PegaAnoMesRef(cmb_mesref, spn_anoref);
     if sanomesref <> '' then
      qryDet.FieldByName('ANOMESREF').asstring:=sanomesref;
   end;

  if (fcsbtnEstado.caption = 'ATIVO') then
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=0
  else
    qryDet.FieldByName('FLGDESATIVADO').asinteger:=1;


  if (qryDet.State in [dsEdit,dsInsert]) then
    if qryDet.FieldByName('IDSEQINTERNOFB').isnull then
      qryDet.FieldByName('IDSEQINTERNOFB').asinteger := LeUltRegistro(nil, 'SEQINTERNOFB');


end;

function TfrmCadRubricaIndividualInserir.PegaAnoMesRef(acbMes: tcombobox;
  aspAno: tspinedit): string;
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

procedure TfrmCadRubricaIndividualInserir.carregarSQLSCombos;
var sqlFiltroRegra, sqlFiltroEstado: String;
    //BRUNO AZEVEDO SOL 191104
    sFlgDescontoRubPagFavorecido: String;
    sFlgDescontoRubPagAbono: String;
    //BRUNO AZEVEDO SOL 191104
begin

  sqlFiltroRegra  := '';
  sqlFiltroEstado := '';

  if (SistemaFolha.FlgUsaRegraxRub = 1) and (Trim(dblcRegraPA.Text) <> '') then
     sqlFiltroRegra  := ' AND EXISTS (SELECT 1 FROM REGRAXRUBRICA R WHERE R.IDRUBRICA = P.IDPROVENTO AND R.IDREGRA = ' +  dblcRegraPA.LookUpValue + ' )  ';

  if SistemaFolha.FlgEstadoRub = 1 then
     sqlFiltroEstado := ' AND FLGESTADORUB IN (''0'',''1'') ';

  if cbTipoRubrica.ItemIndex =1 then // Higor Nayde Ferreira SOL 206188 KINTANA 1998343
   begin

       //BRUNO AZEVEDO SOL 191104
       //PARAMETRO DA QUERY qryRubPagFavorecido
       sFlgDescontoRubPagFavorecido    := '';
       if (Trim(dblcRubricaDesconto.Text) <> '') then begin
         if (qryRubProcessar.Active) then begin
           if (qryRubProcessar.FieldByName('FLGDESCONTO').AsString = '1') then begin
             sFlgDescontoRubPagFavorecido := 'AND FLGDESCONTO = 0';
           end else begin
             sFlgDescontoRubPagFavorecido := 'AND FLGDESCONTO = 1';
           end;
         end;
       end else begin
         sFlgDescontoRubPagFavorecido := 'AND FLGDESCONTO IN (0,1)';
       end;
       //BRUNO AZEVEDO SOL 191104

       qryRubProcessar.SQL.Text :=
         ' SELECT IDPROVENTO,                                   '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                  '
       + '        FLGOBRIGAFAVOREC,                             '
       + '        FLGNAOPAGAFAVOREC,                            '   //edilaine - SIG53825
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO, '
       + '        CODFONTEPAGADORA                              '
       + ' FROM PROVDESC P                                      '
       + ' WHERE FLGDESCONTO IN (0,1)                           '
       + ' AND FLGTPRUBRICA LIKE ''%B%''                        '
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                 ';

       qryRubPagFavorecido.SQL.Text :=
         ' SELECT IDPROVENTO,                                   '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                  '
       + '        FLGOBRIGAFAVOREC,                             '
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO, '
       + '        CODFONTEPAGADORA                              '
       + ' FROM PROVDESC P                                      '
       + ' WHERE FLGTPRUBRICA LIKE ''%B%''                      '
       + sFlgDescontoRubPagFavorecido
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                 ';

       //BRUNO AZEVEDO SOL 191104
       //PARAMETRO DA QUERY qryRubPagAbono
       sFlgDescontoRubPagAbono    := '';
       if (Trim(dblcRubricaProcesssarAbono.Text) <> '') then begin
         if (qryRubProcessarAbono.Active) then begin
           if (qryRubProcessarAbono.FieldByName('FLGDESCONTO').AsString = '1') then begin
             sFlgDescontoRubPagAbono := 'AND FLGDESCONTO = 0';
           end else begin
             sFlgDescontoRubPagAbono := 'AND FLGDESCONTO = 1';
           end;
         end;
       end else begin
         sFlgDescontoRubPagAbono := 'AND FLGDESCONTO IN (0,1)';
       end;
       //BRUNO AZEVEDO SOL 191104

       qryRubProcessarAbono.SQL.Text :=
         ' SELECT IDPROVENTO,                                   '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                  '
       + '        FLGOBRIGAFAVOREC,                             '
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO, '
       + '        CODFONTEPAGADORA                              '
       + ' FROM PROVDESC  P                                     '
       + ' WHERE FLGDESCONTO IN (0,1)                           '
       + ' AND FLGTPRUBRICA LIKE ''%B%''                        '
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                 ';

       qryRubPagAbono.SQL.Text :=
         ' SELECT IDPROVENTO,                                   '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                  '
       + '        FLGOBRIGAFAVOREC,                             '
       + '        FLGNAOPAGAFAVOREC,                            '   //edilaine - SIG53825
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO, '
       + '        CODFONTEPAGADORA                              '
       + ' FROM PROVDESC P                                      '
       + ' WHERE FLGTPRUBRICA LIKE ''%B%''                      '
       + sFlgDescontoRubPagAbono
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                 ';
   end
  Else
   begin

       //BRUNO AZEVEDO SOL 191104
       //PARAMETRO DA QUERY qryRubPagFavorecido
       sFlgDescontoRubPagFavorecido    := '';
       if (Trim(dblcRubricaDesconto.Text) <> '') then begin
         if (qryRubProcessar.Active) then begin
           if (qryRubProcessar.FieldByName('FLGDESCONTO').AsString = '1') then begin
             sFlgDescontoRubPagFavorecido := 'AND FLGDESCONTO = 0';
           end else begin
             sFlgDescontoRubPagFavorecido := 'AND FLGDESCONTO = 1';
           end;
         end;
       end else begin
         sFlgDescontoRubPagFavorecido := 'AND FLGDESCONTO IN (0,1)';
       end;
       //BRUNO AZEVEDO SOL 191104

       qryRubProcessar.SQL.Text :=
         ' SELECT IDPROVENTO,                                                                  '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                                                 '
       + '        FLGOBRIGAFAVOREC,                                                            '
       + '        FLGNAOPAGAFAVOREC,                                                           '   //edilaine - SIG53825
       + '        DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO,   '
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO,                                '
       + '        FLGINSS,                                                                     '
       + '        CODFONTEPAGADORA                                                             '
       + ' FROM PROVDESC P                                                                     '
       + ' WHERE FLGDESCONTO IN (0,1)                                                          '
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                                                ';

       qryRubPagFavorecido.SQL.Text :=
         ' SELECT IDPROVENTO,                                                                  '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                                                 '
       + '        FLGOBRIGAFAVOREC,                                                            '
       + '        DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO,   '
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO                                 '
       + ' FROM PROVDESC P                                                                     '
       + ' WHERE 1=1                                                                           '
       + sFlgDescontoRubPagFavorecido
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                                                ';

       //BRUNO AZEVEDO SOL 191104
       //PARAMETRO DA QUERY qryRubPagAbono
       sFlgDescontoRubPagAbono    := '';
       if (Trim(dblcRubricaProcesssarAbono.Text) <> '') then begin
         if (qryRubProcessarAbono.Active) then begin
           if (qryRubProcessarAbono.FieldByName('FLGDESCONTO').AsString = '1') then begin
             sFlgDescontoRubPagAbono := 'AND FLGDESCONTO = 0';
           end else begin
             sFlgDescontoRubPagAbono := 'AND FLGDESCONTO = 1';
           end;
         end;
       end else begin
         sFlgDescontoRubPagAbono := 'AND FLGDESCONTO IN (0,1)';
       end;
       //BRUNO AZEVEDO SOL 191104

       qryRubProcessarAbono.SQL.Text :=
         ' SELECT IDPROVENTO,                                                                  '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                                                 '
       + '        FLGOBRIGAFAVOREC,                                                            '
       + '        FLGNAOPAGAFAVOREC,                                                           '   //edilaine - SIG53825
       + '        DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO,   '
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO,                                '
       + '        FLGINSS,                                                                     '
       + '        CODFONTEPAGADORA                                                             '
       + ' FROM PROVDESC P                                                                     '
       + ' WHERE FLGDESCONTO IN (0,1)                                                          '
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                                                ';

       qryRubPagAbono.SQL.Text :=
         ' SELECT IDPROVENTO,                                                                  '
         //BRUNO AZEVEDO SOL 191104
       + '        FLGDESCONTO,                                                                 '
       + '        FLGOBRIGAFAVOREC,                                                            '
       + '        DECODE(FLGDESCONTO,0,''Provento'',1,''Desconto'',''Informativa'') AS TIPO,   '
       + '        CODPROVDESC||'' - ''||DESCRICAO AS DESCRICAO                                 '
       + ' FROM PROVDESC P                                                                     '
       + ' WHERE 1=1                                                                           '
       + sFlgDescontoRubPagAbono
       + sqlFiltroRegra
       + sqlFiltroEstado
       + ' ORDER BY CODPROVDESC                                                                ';
   end;

  //BRUNO AZEVEDO SOL 191104
  qryRubProcessar.Close;
  qryRubProcessar.Open;

  qryRubPagFavorecido.Close;
  qryRubPagFavorecido.Open;

  qryRubProcessarAbono.Close;
  qryRubProcessarAbono.Open;

  qryRubPagAbono.Close;
  qryRubPagAbono.Open;
  //Rodrigo Ramos INICIO 28-08-2017 SIG35762
  qryPlanoContabil.Close;
  qryPlanoContabil.ParamByName('IDPESSOA').asinteger  := idTitular;
  qryPlanoContabil.Open;
  //Rodrigo Ramos FIM 28-08-2017 SIG35762

  dblcRubricaFavPA.Enabled      := (Trim(dblcRubricaDesconto.Text) <> '');
  dblcRubricaFavAbonoPA.Enabled := (Trim(dblcRubricaProcesssarAbono.Text) <> '');
  //BRUNO AZEVEDO SOL 191104

  // Alterado por FHBS - 11/07/2018 - SIG70586
  FiltraAcaoJudicial;
  // Alterado por FHBS - 11/07/2018 - SIG70586 - Fim


end;

procedure TfrmCadRubricaIndividualInserir.dblcRegraPAChange(
  Sender: TObject);
begin
  inherited;
  VerificaAssociacaoRubrica();
end;

function TfrmCadRubricaIndividualInserir.VerificaForamAssociadasRubricasExcecao: Boolean;
var sSql: String;
begin
  sSql := 'SELECT 1 FROM RUBXPENSAOALIM '
        + 'WHERE IDEMPRESA = ' + IntToStr( idFundacao )
        + '  AND IDTITULAR = ' + IntToStr( idTitular )
        + '  AND IDPESSOA  = ' + IntToStr( idPessoa );

  if qryDet.FieldByName('IDFAVORECIDO').AsString  <> '' then
    sSql := sSql +
          '  AND IDFAVORECIDO  = ' + qryDet.FieldByName('IDFAVORECIDO').AsString;

  sSql := sSql +
          '  AND IDPESSOA  = ' + IntToStr( idPessoa )
        + '  AND IDRUBRICA  = ' + IntToStr( idRubrica )
        + '  AND SEQRUBRICAINDIV  = ' + qryDet.FieldByName('SEQRUBRICAINDIV').AsString;

  result := FazQuery(qryAux,sSql);

  qryAux.Close;
end;

procedure TfrmCadRubricaIndividualInserir.ExcluiAssociacaoRubricasExcecao;
var sSql:String;
begin
  sSql := 'DELETE FROM RUBXPENSAOALIM '
        + 'WHERE IDEMPRESA = ' + IntToStr( idFundacao )
        + '  AND IDTITULAR = ' + IntToStr( idTitular )
        + '  AND IDPESSOA  = ' + IntToStr( idPessoa )
        + '  AND IDFAVORECIDO  = ' + qryDet.FieldByName('IDFAVORECIDO').AsString
        + '  AND IDPESSOA  = ' + IntToStr( idPessoa )
        + '  AND IDRUBRICA  = ' + IntToStr( idRubrica )
        + '  AND SEQRUBRICAINDIV  = ' + qryDet.FieldByName('SEQRUBRICAINDIV').AsString;

  ExecutarQuery(qryAux,sSql);

  qryAux.Close;

end;

procedure TfrmCadRubricaIndividualInserir.HabilitaProcInss;
begin
   lblnumprocinss.Enabled   := (cbTipoRubrica.ItemIndex = 1) and  // Higor Nayde Ferreira SOL 206188 KINTANA 1998343
                               (Trim(qryRubProcessar.Text) <> '') and
                               (qryRubProcessar.FieldByName('CODFONTEPAGADORA').AsInteger = 2);

   dbedtNumProcInss.Enabled := lblnumprocinss.Enabled;
end;

procedure TfrmCadRubricaIndividualInserir.consultarRubricaPA;
begin
   carregaSQLRubricaPA();
   qryDet.Close;
   qryDet.ParamByName('IDTITULAR').asinteger      := idTitular;
   qryDet.ParamByName('IDPESSOA').asinteger       := idPessoa;
   qryDet.ParamByName('IDEMPRESA').asinteger      := idFundacao;
   qryDet.ParamByName('IDRUBRICA').asinteger      := idRubrica;
   qryDet.ParamByName('SEQRUBRICAINDIV').asinteger := seqRubricaIndividual;
   qryDet.Open;
end;

procedure TfrmCadRubricaIndividualInserir.consultarRubricaOutros;
begin
   carregaSQLRubricaOutros();
   qryDet.Close;
   qryDet.ParamByName('IDTITULAR').asinteger      := idTitular;
   qryDet.ParamByName('IDPESSOA').asinteger       := idPessoa;
   qryDet.ParamByName('IDEMPRESA').asinteger      := idFundacao;
   qryDet.ParamByName('IDRUBRICA').asinteger       := idRubrica;
   qryDet.ParamByName('SEQRUBRICAINDIV').asinteger := seqRubricaIndividual;
   qryDet.Open;
end;

procedure TfrmCadRubricaIndividualInserir.SetrubricaPA(
  const Value: Boolean);
begin
  FrubricaPA := Value;
end;

procedure TfrmCadRubricaIndividualInserir.carregaSQLRubricaOutros;
begin
   qryDet.Close;
   qryDet.Sql.Clear;
   qryDet.Sql.Add('SELECT   PD.DESCPARCIAL                            ');
   qryDet.Sql.Add('       , PD.FLGDESCONTO                            ');
   qryDet.Sql.Add('       , PD.FLGINSS                                ');
   qryDet.Sql.Add('       , PD.FLGIRRF                                ');
   qryDet.Sql.Add('       , PD.PRAZO                                  ');
   qryDet.Sql.Add('       , R.FLGUSAABONO                             ');
   qryDet.Sql.Add('       , R.FLGANTECIPABONO                         ');
   qryDet.Sql.Add('       , R.IDALIMENTADO                            ');
   qryDet.Sql.Add('       , R.IDTITULAR                               ');
   qryDet.Sql.Add('       , R.DATAINICIO                              ');
   qryDet.Sql.Add('       , R.FLGBASEPA                               ');
   qryDet.Sql.Add('       , R.FLGANTECIPAABONOINSS                    ');
   qryDet.Sql.Add('       , R.IDPESSOA                                ');
   qryDet.Sql.Add('       , R.IDEMPRESA                               ');
   qryDet.Sql.Add('       , R.NUMOCORRENCIAS                          ');
   qryDet.Sql.Add('       , PD.CODPROVDESC AS IDMOSTRARUB             ');
   qryDet.Sql.Add('       , PD.IDPROVENTO AS IDRUBRICA                ');
   qryDet.Sql.Add('       , R.SEQRUBRICAINDIV                         ');
   qryDet.Sql.Add('       , R.IDFAVORECIDO                            ');
   qryDet.Sql.Add('       , R.IDREGRACALCULO                          ');
   qryDet.Sql.Add('       , R.VALORRUBRICA                            ');
   qryDet.Sql.Add('       , R.ANOMESINICIO                            ');
   qryDet.Sql.Add('       , R.FLGPERMANENTE                           ');
   qryDet.Sql.Add('       , R.PARCELAS                                ');
   qryDet.Sql.Add('       , R.FLGPERCENT                              ');
   qryDet.Sql.Add('       , R.FLGTPRUBMANUT                           ');
   qryDet.Sql.Add('       , R.FLGPENSAOALIM                           ');
   qryDet.Sql.Add('       , R.RUBRICAPROVENTOPA                       ');
   qryDet.Sql.Add('       , R.DATAFINAL                               ');
   qryDet.Sql.Add('       , R.ANOMESREF                               ');
   qryDet.Sql.Add('       , R.CODPORTFORMA                            ');
   qryDet.Sql.Add('       , P.NUMDOCUMENTO AS CPFFAVORECIDO           ');
   qryDet.Sql.Add('       , P.NOME AS FAVORECIDO                      ');
   qryDet.Sql.Add('       , PD.DESCRPROVDESC AS DESCRICAO             ');
   qryDet.Sql.Add('       , R.FLGDESATIVADO                           ');
   qryDet.Sql.Add('       , R.FLGUSADO                                ');
   qryDet.Sql.Add('       , R.FLGCALCULACPMF                          ');
   qryDet.Sql.Add('       , R.ULTMESPREPARO                           ');
   qryDet.Sql.Add('       , RG.NOMEREGRA                              ');
   qryDet.Sql.Add('       , R.FLGCALCULACPMF                          ');
   qryDet.Sql.Add('       , R.TRGDTINCLUSAO                           ');
   qryDet.Sql.Add('       , R.TRGUSERINCLUSAO                         ');
   qryDet.Sql.Add('       , R.NUMPROCINSS                             ');
   qryDet.Sql.Add('       , R.SITUACAOAJ                              ');
   qryDet.Sql.Add('       , R.OBSERVACAO                              ');
   qryDet.Sql.Add('       , R.FLGRETROACAO                            ');
   qryDet.Sql.Add('       , '' '' AS NOME                             ');
   qryDet.Sql.Add('       , R.IDRUBRICA13                             ');
   qryDet.Sql.Add('       , R.IDRUBRICAPROVENTO13                     ');
   qryDet.Sql.Add('       , R.IDSEQINTERNOFB                          ');
   qryDet.Sql.Add('       , R.FLGCONTROLASALDO                        ');
   qryDet.Sql.Add('       , R.FLGRUBRICARESGATE                       ');
   qryDet.Sql.Add('       , R.VLRSALDOINICIAL                         ');
   qryDet.Sql.Add('       , R.VLRTOTALPROC                            ');
   qryDet.Sql.Add('       , R.MESCOMPREEM                             ');
   qryDet.Sql.Add('       , R.IDPLANOCONTABIL                         '); // RODRIGO RAMOS - SIG35762
   qryDet.Sql.Add('       , R.RELACAODEPEN                            '); // RODRIGO RAMOS - SIG35762
   qryDet.Sql.Add('       , R.IDPROCJUD                               '); // Alterado por FHBS - 11/07/2018 - SIG70586
   qryDet.Sql.Add('       , PD.FLGNAOPAGAFAVOREC                      '); //edilaine - SIG53825
   qryDet.Sql.Add('       , R.FLGPOSSUIACJUD                          ');  //edilaine - SIG87262
   qryDet.Sql.Add('       , R.DESC_RELACAODEPEN                       ');  // Helen V Bianchi - WO2919
   qryDet.Sql.Add('    FROM PROVDESC PD,                              ');
   qryDet.Sql.Add('         PESSOA P,                                 ');
   qryDet.Sql.Add('         REGRA RG,                                 ');
   qryDet.Sql.Add('         RUBRICAINDIV R                            ');
   qryDet.Sql.Add('   WHERE R.IDTITULAR = :IDTITULAR                  ');
   qryDet.Sql.Add('     AND R.IDPESSOA = :IDPESSOA                    ');
   qryDet.Sql.Add('     AND R.FLGPENSAOALIM = 0                       ');
   qryDet.Sql.Add('     AND R.IDEMPRESA = :IDEMPRESA                  ');
   qryDet.Sql.Add('     AND R.FLGTPRUBMANUT = ''1''                   ');
   qryDet.Sql.Add('     AND PD.IDPROVENTO = R.IDRUBRICA               ');
   qryDet.Sql.Add('     AND R.IDFAVORECIDO = P.IDPESSOA(+)            ');
   qryDet.Sql.Add('     AND R.IDREGRACALCULO = RG.IDREGRA(+)          ');
   qryDet.Sql.Add('     AND R.IDRUBRICA  = :IDRUBRICA                 ');
   qryDet.Sql.Add('    AND R.SEQRUBRICAINDIV = :SEQRUBRICAINDIV       ');
//   qryDet.Sql.Add('ORDER BY SEQRUBRICAINDIV                           ');  //Everson TIBERO
   qryDet.Sql.Add('ORDER BY R.SEQRUBRICAINDIV                           ');  //Everson TIBERO
end;

procedure TfrmCadRubricaIndividualInserir.carregaSQLRubricaPA;
begin
   qryDet.Close;
   qryDet.Sql.Clear;
   qryDet.Sql.Add('SELECT   PD.DESCPARCIAL                            ');
   qryDet.Sql.Add('       , PD.FLGDESCONTO                            ');
   qryDet.Sql.Add('       , PD.FLGINSS                                ');
   qryDet.Sql.Add('       , PD.FLGIRRF                                ');
   qryDet.Sql.Add('       , PD.PRAZO                                  ');
   qryDet.Sql.Add('       , R.FLGUSAABONO                             ');
   qryDet.Sql.Add('       , R.FLGANTECIPABONO                         ');
   qryDet.Sql.Add('       , R.IDALIMENTADO                            ');
   qryDet.Sql.Add('       , R.IDTITULAR                               ');
   qryDet.Sql.Add('       , R.DATAINICIO                              ');
   qryDet.Sql.Add('       , R.FLGBASEPA                               ');
   qryDet.Sql.Add('       , R.FLGANTECIPAABONOINSS                    ');
   qryDet.Sql.Add('       , R.IDPESSOA                                ');
   qryDet.Sql.Add('       , R.IDEMPRESA                               ');
   qryDet.Sql.Add('       , R.NUMOCORRENCIAS                          ');
   qryDet.Sql.Add('       , PD.CODPROVDESC AS IDMOSTRARUB             ');
   qryDet.Sql.Add('       , PD.IDPROVENTO AS IDRUBRICA                ');
   qryDet.Sql.Add('       , R.SEQRUBRICAINDIV                         ');
   qryDet.Sql.Add('       , R.IDFAVORECIDO                            ');
   qryDet.Sql.Add('       , R.IDREGRACALCULO                          ');
   qryDet.Sql.Add('       , R.VALORRUBRICA                            ');
   qryDet.Sql.Add('       , R.ANOMESINICIO                            ');
   qryDet.Sql.Add('       , R.FLGPERMANENTE                           ');
   qryDet.Sql.Add('       , R.PARCELAS                                ');
   qryDet.Sql.Add('       , R.FLGPERCENT                              ');
   qryDet.Sql.Add('       , R.FLGTPRUBMANUT                           ');
   qryDet.Sql.Add('       , R.FLGPENSAOALIM                           ');
   qryDet.Sql.Add('       , R.RUBRICAPROVENTOPA                       ');
   qryDet.Sql.Add('       , R.DATAFINAL                               ');
   qryDet.Sql.Add('       , PD1.CODPROVDESC AS IDMOSTRARUB1           ');
   qryDet.Sql.Add('       , R.ANOMESREF                               ');
   qryDet.Sql.Add('       , R.CODPORTFORMA                            ');
   qryDet.Sql.Add('       , P.NUMDOCUMENTO AS CPFFAVORECIDO           ');
   qryDet.Sql.Add('       , P.NOME AS FAVORECIDO                      ');
   qryDet.Sql.Add('       , PD.DESCRPROVDESC AS DESCRICAO             ');
   qryDet.Sql.Add('       , ALIM.NUMDOCUMENTO AS CPFALIMENTADO        ');
   qryDet.Sql.Add('       , ALIM.NOME AS ALIMENTADO                   ');
   qryDet.Sql.Add('       , R.FLGDESATIVADO                           ');
   qryDet.Sql.Add('       , R.FLGUSADO                                ');
   qryDet.Sql.Add('       , R.FLGCALCULACPMF                          ');
   qryDet.Sql.Add('       , R.ULTMESPREPARO                           ');
   qryDet.Sql.Add('       , PD1.DESCRPROVDESC AS DESCRICAO            ');
   qryDet.Sql.Add('       , RG.NOMEREGRA                              ');
   qryDet.Sql.Add('       , R.FLGCALCULACPMF                          ');
   qryDet.Sql.Add('       , R.TRGDTINCLUSAO                           ');
   qryDet.Sql.Add('       , R.TRGUSERINCLUSAO                         ');
   qryDet.Sql.Add('       , R.NUMPROCINSS                             ');
   qryDet.Sql.Add('       , R.SITUACAOAJ                              ');
   qryDet.Sql.Add('       , R.OBSERVACAO                              ');
   qryDet.Sql.Add('       , R.FLGRETROACAO                            ');
   qryDet.Sql.Add('       , '' '' AS NOME                             ');
   qryDet.Sql.Add('       , R.IDRUBRICA13                             ');
   qryDet.Sql.Add('       , R.IDRUBRICAPROVENTO13                     ');
   qryDet.Sql.Add('       , R.IDSEQINTERNOFB                          ');
   qryDet.Sql.Add('       , R.FLGCONTROLASALDO                        ');
   qryDet.Sql.Add('       , R.FLGRUBRICARESGATE                       ');
   qryDet.Sql.Add('       , R.VLRSALDOINICIAL                         ');
   qryDet.Sql.Add('       , R.VLRTOTALPROC                            ');
   qryDet.Sql.Add('       , R.MESCOMPREEM                             ');
   qryDet.Sql.Add('       , R.IDPLANOCONTABIL                         '); // RODRIGO RAMOS - SIG35762
   qryDet.Sql.Add('       , R.RELACAODEPEN                            '); // RODRIGO RAMOS - SIG35762
   qryDet.Sql.Add('       , R.IDPROCJUD                               '); // Alterado por FHBS - 11/07/2018 - SIG70586
   qryDet.Sql.Add('       , PD.FLGNAOPAGAFAVOREC                      '); //edilaine - SIG53825
   qryDet.Sql.Add('       , R.FLGPOSSUIACJUD                          ');  //edilaine - SIG87262
   qryDet.Sql.Add('       , R.DESC_RELACAODEPEN                       ');  //Helen V Bianchi - WO2919
   qryDet.Sql.Add('    FROM PROVDESC PD,                              ');
   qryDet.Sql.Add('         PESSOA P,                                 ');
   qryDet.Sql.Add('         PESSOA ALIM,                              ');
   qryDet.Sql.Add('         PROVDESC PD1,                             ');
   qryDet.Sql.Add('         REGRA RG,                                 ');
   qryDet.Sql.Add('         RUBRICAINDIV R                            ');
   qryDet.Sql.Add('   WHERE R.IDTITULAR = :IDTITULAR                  ');
   qryDet.Sql.Add('     AND R.IDPESSOA = :IDPESSOA                    ');
   qryDet.Sql.Add('     AND R.FLGPENSAOALIM = 1                       ');
   qryDet.Sql.Add('     AND R.IDEMPRESA = :IDEMPRESA                  ');
   qryDet.Sql.Add('     AND R.FLGTPRUBMANUT = ''1''                   ');
   qryDet.Sql.Add('     AND PD.IDPROVENTO = R.IDRUBRICA               ');
   qryDet.Sql.Add('     AND R.IDFAVORECIDO = P.IDPESSOA(+)            ');
   qryDet.Sql.Add('     AND R.IDALIMENTADO = ALIM.IDPESSOA(+)         ');
   qryDet.Sql.Add('     AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+)   ');
   qryDet.Sql.Add('     AND R.IDREGRACALCULO = RG.IDREGRA(+)          ');
   qryDet.Sql.Add('     AND R.IDRUBRICA  = :IDRUBRICA                 ');
   qryDet.Sql.Add('    AND R.SEQRUBRICAINDIV = :SEQRUBRICAINDIV       ');
//   qryDet.Sql.Add('ORDER BY SEQRUBRICAINDIV                           '); //Everson TIBERO
   qryDet.Sql.Add('ORDER BY R.SEQRUBRICAINDIV                           '); //Everson TIBERO
end;

procedure TfrmCadRubricaIndividualInserir.dsDetDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if habilitaDataChance then
   begin
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
   end;
end;

procedure TfrmCadRubricaIndividualInserir.cboSituacaoAJChange(Sender: TObject);
begin
  inherited;
  if habilitaDataChance then
   begin
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
   end;
end;

procedure TfrmCadRubricaIndividualInserir.mmobservacaoChange(Sender: TObject);
begin
  inherited;
  if habilitaDataChance then
   begin
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
   end;
end;

procedure TfrmCadRubricaIndividualInserir.CalculaDataFinal(qry: twwquery);
 var nMeses : integer;
     dt : tdatetime;
     d,m,a : word;
     d1,m1,a1,d2,m2,a2 : word;
     EmQueMes : integer;
begin
//  nMeses:=qry.fieldbyname('PARCELAS').asinteger;
  nMeses := Trunc(spedParcelas.Value);

  if nMeses = 0 then
     dt:=DiasUteis.SomaMeses(qry.fieldbyname('DATAINICIO').asdatetime,nMeses)
  Else
     dt:=DiasUteis.SomaMeses(qry.fieldbyname('DATAINICIO').asdatetime,nMeses-1);

//  dt:=DiasUteis.SomaMeses(qry.fieldbyname('DATAINICIO').asdatetime,nMeses);

  decodedate(dt,a,m,d);
  dt:=DiasUteis.UltDiaMes(a,m);
  qry.fieldbyname('DATAFINAL').asdatetime:=dt;

  decodedate(qry.fieldbyname('DATAFINAL').asdatetime,a2,m2,d2);
  decodedate(qry.fieldbyname('DATAINICIO').asdatetime,a1,m1,d1);
  nmeses := (a2-a1-1)*12+(12+m2-m1)+1;

  nAbono := Int((((m1+nMeses)-1))/12);

  if dbchkAbonoPA.Checked or dbcboxUtilizadaAbono.Checked then
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
  end;


end;

procedure TfrmCadRubricaIndividualInserir.dbdtInicioChange(
  Sender: TObject);
begin
  inherited;

  if not (qryDet.State in [dsInsert, dsEdit] ) Then
     Exit;

  if ((dbrgrpPermanentePA.ItemIndex = 1) and (spedParcelas.value > 0)) then
  begin
    CalculaDataFinal(qryDet);
    dbdtfinal.Update;
  end;

  FiltraAcaoJudicial; // Alterado por FHBS - 11/07/2018 - SIG70586
end;

procedure TfrmCadRubricaIndividualInserir.spedParcelasChange(
  Sender: TObject);
begin
  inherited;

  if not (qryDet.State in [dsInsert, dsEdit] ) Then
     Exit;

  if ((dbrgrpPermanentePA.ItemIndex = 1) and (dbdtInicio.date > 0)) then
  begin
    CalculaDataFinal(qryDet);
    dbdtFinal.Update;
  end;
end;

function TfrmCadRubricaIndividualInserir.retornaPeriodoAtual: String;
begin
  if FazQuery(qryAux, 'SELECT TO_CHAR(SYSDATE,''YYYY/MM'') AS MESANO FROM DUAL') then
    result := qryAux.FieldByName('MESANO').AsString
  else
    result := '';

  qryAux.Close;
end;

function TfrmCadRubricaIndividualInserir.retornaDataPrimeiroDiaMesAtual(): String;
begin
  if FazQuery(qryAux, 'SELECT ''01''|| TO_CHAR(SYSDATE,''/MM/YYYY'') AS DATAATUAL FROM DUAL') then
    result := qryAux.FieldByName('DATAATUAL').AsString
  else
    result := '';

  qryAux.Close;

end;

procedure TfrmCadRubricaIndividualInserir.adicionaFavorecido(
  idPessoa: Integer; sNome, sDocumento: String);
begin
  if VerificaPessoaFisica(qryAux, idPessoa ) then
  begin
    if InserePessoaFisica(idPessoa) then
    begin
      VerificaDadosPF(idPessoa);
      qryDet.FieldByName('IDFAVORECIDO').AsInteger:=idPessoa;
      VerificaAssociacaoRubrica;
      lbNomeFavorecido.Caption      := sNome;
      lbDocumentoFavorecido.Caption := sDocumento;
    end;
  end
  else
  begin //  SOL 196295 KINTANA 1877771
      qryDet.FieldByName('IDFAVORECIDO').AsInteger := idPessoa;
      lbNomeFavorecido.Caption      := sNome;
      lbDocumentoFavorecido.Caption := sDocumento;
  end; //  SOL 196295 KINTANA 1877771
end;

procedure TfrmCadRubricaIndividualInserir.buscaFavorecidoRubrica(sIdRubrica: String);
begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT P.NOME, R.IDPESSOA, P.NUMDOCUMENTO '+
                   ' FROM RUBRICAXCONTABANCARIA R, PESSOA P '+
                   ' WHERE R.IDRUBRICA = '+sIdRubrica+
                     ' AND R.IDPESSOA  = P.IDPESSOA ');
    qryAux.Open;
    If Not qryAux.Eof Then
      Begin
        If qryAux.RecordCount > 1 Then
          Begin
            qryDet.FieldByName('IDFAVORECIDO').Clear;
            lbNomeFavorecido.Caption      := '';
            lbDocumentoFavorecido.Caption := '';
            MsgDlg('Existe mais de um favorecido para essa rubrica. Favor verificar cadastro.', 'Informação', mtInformation, [mbOk], 0);
          End
        Else
          qryDet.FieldByName('IDFAVORECIDO').AsInteger := qryAux.FieldByName('IDPESSOA').AsInteger;
          lbNomeFavorecido.Caption      := qryAux.FieldByName('NOME').AsString;
          lbDocumentoFavorecido.Caption := qryAux.FieldByName('NUMDOCUMENTO').AsString;
(*
          adicionaFavorecido(qryAux.FieldByName('IDPESSOA').AsInteger
                            ,qryAux.FieldByName('NOME').AsString
                            ,qryAux.FieldByName('NUMDOCUMENTO').AsString);
*)
      End
    Else
      Begin
        qryDet.FieldByName('IDFAVORECIDO').Clear;
        lbNomeFavorecido.Caption      := '';
        lbDocumentoFavorecido.Caption := '';
      End;
end;

procedure TfrmCadRubricaIndividualInserir.dblcRubricaDescontoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  If qryRubProcessar.FieldByName('FLGOBRIGAFAVOREC').AsInteger = 1 Then
    If Trim(dblcRubricaDesconto.Text) <> '' Then
       buscaFavorecidoRubrica(dblcRubricaDesconto.LookupValue);

  qryDet.FieldByName('FLGNAOPAGAFAVOREC').AsInteger := qryRubProcessar.FieldByName('FLGNAOPAGAFAVOREC').AsInteger;  //edilaine - SIG53825

  FiltraAcaoJudicial; // Alterado por FHBS - 11/07/2018 - SIG70586
end;

procedure TfrmCadRubricaIndividualInserir.dblcRegraPAExit(Sender: TObject);
begin
  inherited;
  carregarSQLSCombos();
end;

procedure TfrmCadRubricaIndividualInserir.consultarRegrasParaCalculo;
 var ssql: string;
begin
  inherited;

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

end;

procedure TfrmCadRubricaIndividualInserir.dblcRubricaDescontoChange( Sender: TObject);
begin
  inherited;
  if (qryRubProcessar.Active) and (qryDet.Active) and (qryDet.State in [dsEdit,dsInsert]) then
   begin
     //Rodrigo SIG35762 -fim
     { if (qryRubProcessar.FieldByName('FLGOBRIGAFAVOREC').AsInteger = 1) then
       gbxFavorecido.Visible := True
      Else
       begin
             if (cbTipoRubrica.ItemIndex = 0 ) then
               gbxFavorecido.Visible    := True
            else begin
               gbxFavorecido.Visible := False;
               sbtnRemFavClick(Sender);
            end;
       end;}
     habilitaFavorecido;
     //Rodrigo SIG35762 -fim   
   end;

  //BRUNO AZEVEDO SOL 191104
  dblcRubricaFavPA.Enabled      := (Trim(dblcRubricaDesconto.Text) <> '');
  dblcRubricaFavAbonoPA.Enabled := (Trim(dblcRubricaProcesssarAbono.Text) <> '');
  //BRUNO AZEVEDO SOL 191104

end;

procedure TfrmCadRubricaIndividualInserir.dblcRubricaProcesssarAbonoExit(
  Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 191104
  carregarSQLSCombos();
end;

procedure TfrmCadRubricaIndividualInserir.dblcRubricaProcesssarAbonoChange(
  Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 191104
  dblcRubricaFavPA.Enabled      := (Trim(dblcRubricaDesconto.Text) <> '');
  dblcRubricaFavAbonoPA.Enabled := (Trim(dblcRubricaProcesssarAbono.Text) <> '');

  if (dblcRubricaFavAbonoPA.Enabled = False) then begin
    dblcRubricaFavAbonoPA.Text := '';
  end;
  //BRUNO AZEVEDO SOL 191104
end;

procedure TfrmCadRubricaIndividualInserir.fcsbtnObservacoesClick(
  Sender: TObject);
begin
  inherited;
  try
     frmCadObservacao := TfrmCadObservacao.Create(Self);
     frmCadObservacao.ShowModal;
  finally
     FreeAndNil(frmCadObservacao);
  end;
end;

procedure TfrmCadRubricaIndividualInserir.limpacampos;
var sanomesref: String;
begin
//Higor Nayde SOL 206188
   if not(fcsbtnEstado.caption = 'ATIVO') then
        fcsbtnEstadoClick(Self);


   sanomesref := retornaPeriodoAtual();
   dbreValor.text := '0,00000000';


  dblcRegraPA.Clear;
  spedParcelas.Text := '1';
  spedNumOcorrenciasPA.Text := '0';


  qryDet.FieldByName('DataInicio').AsString :=  '01/'+FormatDateTime('MM/YYYY',now);
  CalculaDataFinal(qryDet);


  qryDet.FieldByName('IDREGRACALCULO').AsString := '';
  qryDet.FieldByName('IDRUBRICA').AsString := '';
  qryDet.FieldByName('IDRUBRICA13').AsString := '';
  qryDet.FieldByName('RUBRICAPROVENTOPA').AsString := '';
  qryDet.FieldByName('IDRUBRICAPROVENTO13').AsString := '';


  cmb_mesref.ItemIndex:=StrToInt(Copy(sanomesref,6,2))-1;
  spn_anoref.Value:=StrToInt(Copy(sanomesref,1,4));

  cmb_mesComp.ItemIndex:=StrToInt(Copy(sanomesref,6,2))-1;
  spn_anoComp.Value:=StrToInt(Copy(sanomesref,1,4));
  if (cbTipoRubrica.ItemIndex <> -1) then
   gbxFavorecido.Visible    := True;



  dbedtNumProcInss.Clear;
  dblkupPortFormaPA.Clear;


  dbchkBasePA.Enabled :=true;
  dbchkBasePA.Checked :=true;
  qryDet.FieldByName('FLGBASEPA').AsString := '';

  dbcboxRetroagePA.Enabled :=true;
  dbcboxRetroagePA.Checked :=true;
  qryDet.FieldByName('FLGRETROACAO').AsString := '';

  cbAntecipaAbonoINSS.Enabled :=true;
  cbAntecipaAbonoINSS.Checked :=true;
  qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '';

  dbchkAntecipAbonoPA.Enabled :=true;
  dbchkAntecipAbonoPA.Checked :=true;
  qryDet.FieldByName('FLGANTECIPABONO').AsString := '';

  dbcboxCPMF.Enabled :=true;
  dbcboxCPMF.Checked :=true;
  qryDet.FieldByName('FLGCALCULACPMF').AsString := '';

  dbchkAbonoPA.Enabled :=true;
  dbchkAbonoPA.Checked :=true;
  qryDet.FieldByName('FLGUSAABONO').AsString := '';


  dbcboxUtilizadaAbono.Enabled :=true;
  dbcboxUtilizadaAbono.Checked :=true;
  qryDet.FieldByName('FLGUSAABONO').AsString := '';

  dbcboxUtilizadaAtencipAbonoINSS.Enabled :=true;
  dbcboxUtilizadaAtencipAbonoINSS.Checked :=true;
  qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '';


  dbcboxUtilizadaAtencipAbonoFUNFEC.Enabled :=true;
  dbcboxUtilizadaAtencipAbonoFUNFEC.Checked :=true;
  qryDet.FieldByName('FLGANTECIPABONO').AsString := '';

  dbcboxRubricaResgate.Enabled :=true;
  dbcboxRubricaResgate.Checked :=true;
  qryDet.FieldByName('FLGRUBRICARESGATE').AsString := '';

  dbedtNumProcInss.Clear;
  dblkupPortFormaPA.Clear;

  dbUltmesProcPalim.clear;
  qryDet.FieldByName('ULTMESPREPARO').AsString := '';


 if (cbTipoRubrica.Text = '' ) then  begin
    fcsbtnRubXPA.Enabled := False;
    spn_anoComp.text := '0';
    cmb_mesComp.ItemIndex := -1;
    grpMesCompetencia.visible := False;
  end;

    lbDocumentoFavorecido.Caption := '';
    qryDet.FieldByName('CPFFAVORECIDO').AsString:='';
    lbNomeFavorecido.Caption :=  '';
    qryDet.FieldByName('FAVORECIDO').AsString:= '';

    dbrgrpPermanentePA.ItemIndex := 1;
    dbreValor.setFocus;
//Higor Nayde SOL 206188    
end;

procedure TfrmCadRubricaIndividualInserir.ValorCheck;
begin
 //Higor Nayde SOL 206188
  if (dbchkBasePA.Checked)and(dbchkBasePA.visible) then
     qryDet.FieldByName('FLGBASEPA').AsString := '1'
  else if (dbchkBasePA.visible)then
       qryDet.FieldByName('FLGBASEPA').AsString := '0';

  if(cbAntecipaAbonoINSS.Checked) and (cbAntecipaAbonoINSS.visible) then
       qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '1'
  else if (cbAntecipaAbonoINSS.visible) then
       qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '0';


  if(dbchkAntecipAbonoPA.Checked) and (dbchkAntecipAbonoPA.visible) then
       qryDet.FieldByName('FLGANTECIPABONO').AsString := '1'
  else if (dbchkAntecipAbonoPA.visible) then
       qryDet.FieldByName('FLGANTECIPABONO').AsString := '0';

  if(dbcboxUtilizadaAtencipAbonoINSS.Checked) and (dbcboxUtilizadaAtencipAbonoINSS.visible)then
       qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '1'
  else if (dbcboxUtilizadaAtencipAbonoINSS.visible)then
       qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '0';

  if(dbcboxUtilizadaAtencipAbonoINSS.Checked) and (dbcboxUtilizadaAtencipAbonoINSS.visible)then
       qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '1'
  else if (dbcboxUtilizadaAtencipAbonoINSS.visible) then
       qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '0';

  if(dbcboxUtilizadaAtencipAbonoFUNFEC.Checked)and (dbcboxUtilizadaAtencipAbonoFUNFEC.visible)then
       qryDet.FieldByName('FLGANTECIPABONO').AsString := '';


  if(dbcboxRetroagePA.Checked)and (cbAntecipaAbonoINSS.visible)then
      qryDet.FieldByName('FLGRETROACAO').AsString := '1'
  else
      qryDet.FieldByName('FLGRETROACAO').AsString := '0';



  if(dbcboxCPMF.Checked)and (dbcboxCPMF.visible) then
     qryDet.FieldByName('FLGCALCULACPMF').AsString := '1'
  else
      qryDet.FieldByName('FLGCALCULACPMF').AsString := '0';

  if(dbchkAbonoPA.Checked) and (dbchkAbonoPA.visible)then
     qryDet.FieldByName('FLGUSAABONO').AsString := '1'
  else
      qryDet.FieldByName('FLGUSAABONO').AsString := '0';

  if(dbcboxUtilizadaAbono.Checked) and (dbcboxUtilizadaAbono.visible)then
      qryDet.FieldByName('FLGUSAABONO').AsString := '1'
  else
      qryDet.FieldByName('FLGUSAABONO').AsString := '0';


  if(dbcboxUtilizadaAtencipAbonoINSS.Checked) and (dbcboxUtilizadaAtencipAbonoINSS.visible)then
      qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '1'
  else
      qryDet.FieldByName('FLGANTECIPAABONOINSS').AsString := '0';


  if(dbcboxUtilizadaAtencipAbonoFUNFEC.Checked)and (dbcboxUtilizadaAtencipAbonoFUNFEC.visible)then
     qryDet.FieldByName('FLGANTECIPABONO').AsString := '1'
  else
     qryDet.FieldByName('FLGANTECIPABONO').AsString := '0';


  if(dbcboxRubricaResgate.Checked) and (dbcboxRubricaResgate.visible)then
     qryDet.FieldByName('FLGRUBRICARESGATE').AsString := '1'
  else
     qryDet.FieldByName('FLGRUBRICARESGATE').AsString := '0';
  //Higor Nayde SOL 206188
end;

procedure TfrmCadRubricaIndividualInserir.habilitaFavorecido;   //Rodrigo Ramos SIG35762 inicio
begin
  if (qryRubProcessar.FieldByName('FLGOBRIGAFAVOREC').AsInteger = 1) then
       gbxFavorecido.Visible := True
      Else
       begin
               gbxFavorecido.Visible := False;
               sbtnRemFavClick(sbtnRemFav);
           {  if (cbTipoRubrica.ItemIndex = 0 ) then
               gbxFavorecido.Visible    := True
            else begin
               gbxFavorecido.Visible := False;
               sbtnRemFavClick(Sender);
            end;   }

       end;
end;
 //Rodrigo Ramos SIG35762   fim
procedure TfrmCadRubricaIndividualInserir.dblcAcaoJudChange(
  Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadRubricaIndividualInserir.dblcAcaoJudCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
//
end;

procedure TfrmCadRubricaIndividualInserir.dblcAcaoJudExit(
  Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadRubricaIndividualInserir.sbtnAcaoJudClick(
  Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDPROCJUD').Clear;
  FiltraAcaoJudicial;
end;

procedure TfrmCadRubricaIndividualInserir.FiltraAcaoJudicial;
var
  bMostraCombo: Boolean;
begin
  bMostraCombo := false;

  if qryDet.FieldByName('IDRUBRICA').AsInteger > 0 then
  begin
    bMostraCombo := FazQuery(qryAux,
               'select 1 from PROVDESC ' +
//               ' where substr(CODPROVDESC, 2, 3) = ''326'' ' +            // Ewerton Beltramini SIG94023
               ' where substr(CODPROVDESC, 2, 3) in (''326'',''426'') ' +   // Ewerton Beltramini SIG94023
               '   and length(CODPROVDESC) = 6 ' +
               '   and IDPROVENTO = ' + qryDet.FieldByName('IDRUBRICA').AsString );
  end;

  lblAcaoJud.Visible    := (cbTipoRubrica.ItemIndex = 2) and (bMostraCombo);
  dblcAcaoJud.Visible   := (cbTipoRubrica.ItemIndex = 2) and (bMostraCombo);
  sbtnAcaoJud.Visible   := (cbTipoRubrica.ItemIndex = 2) and (bMostraCombo);
  dbcboxTemAcao.visible := (cbTipoRubrica.ItemIndex = 2) and (bMostraCombo);  //edilaine SIG87262

  //edilaine SIG87262 : inicio
  if (not bMostraCombo) then
  begin
     dbcboxTemAcao.Checked := bMostraCombo;
     if qryDet.State in [dsInsert, dsEdit] then
     begin
       qryDet.FieldByName('IDPROCJUD').Clear;
       qryDet.FieldByName('FLGPOSSUIACJUD').AsInteger := 0;
       dblcAcaoJud.text := '';
     end;
  end;
  //edilaine SIG87262 : fim

  qryAcaoJud.Close;
  qryAcaoJud.SQL.Clear;

  // Andre Imakawa - SIG 83283 - Inicio
  {
  if (operacao = 'ALTERAR') and (qryDet.FieldByName('IDPROCJUD').AsInteger > 0) then
  begin
    qryAcaoJud.SQL.Add('select IDPROCJUD, NUMEROPROCESSO, DATAINICIO, DATAFINAL');
    qryAcaoJud.SQL.Add('      ,decode(SITPROCESSO, 0, ''Em Liminar'', 1, ''Ação Julgada Ganha'', 2, ''Ação Julgada Perdida'', '''') as Situacao');
    qryAcaoJud.SQL.Add('  from PROCJUD');
    qryAcaoJud.SQL.Add(' where IDPROCJUD = ' + IntToStr(StrToIntDef(qryDet.FieldByName('IDPROCJUD').AsString, 0)) + ' union ');
  end;
  }
  // Andre Imakawa - SIG 83283 - Fim
  
  qryAcaoJud.SQL.Add('select IDPROCJUD, NUMEROPROCESSO, DATAINICIO, DATAFINAL');
  qryAcaoJud.SQL.Add('      ,decode(SITPROCESSO, 0, ''Em Liminar'', 1, ''Ação Julgada Ganha'', 2, ''Ação Julgada Perdida'', '''') as Situacao');
  qryAcaoJud.SQL.Add('  from PROCJUD');
  qryAcaoJud.SQL.Add(' where IDPESSOA = ' + IntToStr(idPessoa) );

  // Andre Imakawa - SIG 83283 - Inicio
  {
  if dbdtInicio.DateTime > 0 then
  begin
    qryAcaoJud.SQL.Add('   and (DATAFINAL >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dbdtInicio.DateTime) + ''', ''DD/MM/YYYY'') or DATAFINAL is NULL)');
  end;

  if dbdtFinal.DateTime > 0 then
  begin
    qryAcaoJud.SQL.Add('   and (DATAINICIO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dbdtFinal.DateTime) + ''', ''DD/MM/YYYY'') )')
  end
  else
  if dbdtInicio.DateTime > 0 then
  begin
    qryAcaoJud.SQL.Add('   and (DATAINICIO >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dbdtInicio.DateTime) + ''', ''DD/MM/YYYY'') )');
  end;
  }
  // Andre Imakawa - SIG 83283 - Fim

  qryAcaoJud.SQL.Add(' order by DATAINICIO, DATAFINAL, NUMEROPROCESSO');

  qryAcaoJud.Open;
end;

procedure TfrmCadRubricaIndividualInserir.dbdtFinalExit(Sender: TObject);
begin
  inherited;
  FiltraAcaoJudicial; // Alterado por FHBS - 11/07/2018 - SIG70586
end;

procedure TfrmCadRubricaIndividualInserir.DBGrauParentescoChange(
  Sender: TObject);
begin
  inherited;
  //Helen V Bianchi - WO2919 - Inicio
  if DBGrauParentesco.text = '99 - Agregado/Outros' then begin
     dbedtDesc_RelacaoDepen.visible := True;
     lblDesc_RelacaoDepen.visible   := True;
  end
  else
  begin
     dbedtDesc_RelacaoDepen.Text    := '';
     dbedtDesc_RelacaoDepen.visible := False;
     lblDesc_RelacaoDepen.visible   := False;
  end;
  //Helen V Bianchi - WO2919 - Fim

end;

end.
