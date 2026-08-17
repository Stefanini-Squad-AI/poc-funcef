//***************************************************************************************************
// Autor(a)    : Darivaldo Alencar
// Pendência   : SIG69309
// Data        : 11/06/2018
// Descricao   : Query com baixa performance na conciliação de crédito  
//---------------------------------------------------------------------------------------------------
// Autor(a)    : Everson Luiz Pereira da Cunha
// Pendência   : SIG TIBERO
// Data        : 23/02/2018
// Descricao   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//               Retirada de INDEX, +rule etc.
//               Melhoria realizada para adaptação ao TIBERO.
//---------------------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SIG51345
// Data        : 02/07/2015
// Descricao   :  identificamos que os botão processar e desfazer estão desabilitados,
//                mesmo após as permissão já estavam concedidas
//---------------------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 207789 Kintana 2029238
// Data        : 02/07/2015
// Descricao   : **IMPORTAÇÃO ARQUIVO RETORNO PLANUS** Atualmente no módulo Folha, não existe um
//               mecanismo de leitura e batimento do retorno da fita de crédito do pagamento a
//               assistidos, este processo é feito em um programa em separado. Diante disso, solicitamos
//               implementação no modulo folha de um mecanismo que permite leitura deste retorno e
//               caso haja alguma inconsistencia este seja apontada pelo módulo folha e dando a
//               possibilidade de efetuar um lançamento no contas a receber e quando da regularização
//               um pagamento atraves do contas a pagar, este mecanismo deverá ser implementado em toda
//                a folha de beneficios.
//---------------------------------------------------------------------------------------------------
unit UConciliacaoCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Spin, ComCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, TB97Ctls,
  DBCtrls, Db, Wwdatsrc, DBTables, Wwquery, DBClient, uCMClientDataSet,
  uCmSqlParams, uFuncoesFolha, UDataBase, Provider, Wwdbigrd, Wwdbgrid,
  wwdblook, daDataModule, ppModule, raCodMod, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppParameter, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppReport, MontaSelect, UAdmPrevFB, shellapi, uCtrlPadroes,
  UCtrlLancamento, uCtrlDocumento, uCtrlParamIntegra,uGridProgresso;

type
      HeaderArquivo = record
         Codigoregistro:  string;
         CodigoRemessa:   string;
         CodigoConvenio:  string;
         NomeEmpresa:     string;
         CodigoBanco:     string;
         NomeBanco:       string;
         DataGeraArquivo: string;
         NumSeqArquivo:   string;
         Versaolayout:    string;
         IdServico:       string;
         ReservaFuturo:   string
end;

type
      TraillerArquivo = record
         Codigoregistro      :  string;
         TotRegistroArq      :  string;
         ConterZeros         :  string;
         ValorTotalRegistros :  string;
         ReservaFuturo       :   string

end;

type
      EventoRegularizacao = record
         CodigoEvento              :  Integer;
         Arquivo                   :  TfileStream;
         ContaBancaria             :  string;
         DataRegularizacao         :  string;
         TipoRegularizacao         :  string;
         NumAgencia                :  string;
         NumBanco                  :  string;
         Observacao                :  string;
         EXTENSAOARQUIVO           :  string;
         NomeArquivo               :  string;
         CodDocumentoCap           :  Integer;
         NoDocumentoCap            :  Integer;
         CoddocumentoCar           :  Integer;
         NodocumentoCar            :  Integer;
end;

type
      Documentos = record
         DataEmissao        :  string;
         DataVencto         :  string;
         DataProgramada     :  string;
         Observacao         :  string;
         CodForma           :  Integer;
         CodPortForma       :  Integer;
         iIdPrograma        :  Integer;
         UnidNegoc          :  string;
         TipoRecDes         :  string;
         RecPag             :  string
end;

type
      FRetornoArquivo = record
         Codigoregistro      :  string;
         IdClienteEmpresa    :  string;
         AgenciaCredito      :  string;
         IdClienteBanco      :  string;
         DataCredito         :  string;
         ValorCredito        :  string;
         CodigoRetorno       :  string;
         UsoEmpresa          :  string;
         ReservaFuturo       :  string;
         CodigoRetorno2      :  string;
         CodigoMovimento     :  string

end;

type

    TfrmConciliacaoCredito = class(TfrmOkCancelar)


    Pnl_Cabecalho: TPanel;
    TbsArqRetorno: TTabSheet;
    TbsHistIndiv: TTabSheet;
    pgControlDetalhe: TPageControl;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    lbMesAno: TLabel;
    lbVersao: TLabel;
    Label1: TLabel;
    lbConvenio: TLabel;
    dbrgBusca: TRadioGroup;
    edtNomeArquivo: TEdit;
    btnProcurar: TBitBtn;
    btnCarregarArquivo: TBitBtn;
    plnArquivoRetorno: TPanel;
    lbConsInconsistencia: TLabel;
    ComboBox1: TComboBox;
    btnSelTudo: TBitBtn;
    btnInverte: TBitBtn;
    dbgArquivoRetorno: TwwDBGrid;
    plnHistIndiv: TPanel;
    dbgIndiv: TwwDBGrid;
    lblEvento: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    qryVersaoFolha: TwwQuery;
    dsVersaoFolha: TwwDataSource;
    qryConvenio: TwwQuery;
    dsConvenio: TwwDataSource;
    btnProcessar: TBitBtn;
    bbtnDesfazer: TmaHelpBitBtn;
    btnContasReceber: TBitBtn;
    btnContasPagar: TmaHelpBitBtn;
    btnEventos: TBitBtn;
    btnSelecionarArquivo: TBitBtn;
    DlgProcurarArquivo: TOpenDialog;
    CdsDadosRetornoCaixa: TCMClientDataSet;
    SqlCampos: TCMSqlParams;
    DsDadosRetornoCaixa: TwwDataSource;
    qryAux: TwwQuery;
    cdsRetornoCaixa: TClientDataSet;
    dspRetornoCaixa: TDataSetProvider;
    qryRetornoCaixa: TwwQuery;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    wwDBGrid1: TwwDBGrid;
    QryEvento: TwwQuery;
    DSEvento: TwwDataSource;
    wwDBLookupCombo1: TwwDBLookupCombo;
    BtnConsistencia: TBitBtn;
    BtnInConsistencia: TBitBtn;
    BtnPendencias: TBitBtn;
    BtnInconsArq: TBitBtn;
    rpRelatorios: TppReport;
    ppRelatorios: TppBDEPipeline;
    dsRelatorios: TwwDataSource;
    sqlRelatorios: TwwQuery;
    ppParameterList1: TppParameterList;
    ppCabec: TppHeaderBand;
    ppLabel44: TppLabel;
    ppImage2: TppImage;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLbNomeRelatorio: TppLabel;
    ppDetalhe: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText34: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppRodape: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel28: TppLabel;
    ppLabel5: TppLabel;
    ppLine9: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    QryBasePagamento: TwwQuery;
    QryEventoReg: TwwQuery;
    sqlRelatoriosMATRICULA: TStringField;
    sqlRelatoriosNUMDOCUMENTO: TStringField;
    sqlRelatoriosVLRLIQUIDO: TFloatField;
    sqlRelatoriosTIPOOPERACAO: TStringField;
    sqlRelatoriosDATAPAGAMENTO: TDateTimeField;
    sqlRelatoriosDESCRICAO: TStringField;
    sqlRelatoriosDESCRICAOEVENTO: TStringField;
    sqlRelatoriosNUMBANCO: TStringField;
    sqlRelatoriosNUMAGENCIA: TStringField;
    sqlRelatoriosCONTACORRENTE: TStringField;
    CdsDadosIndividuais: TCMClientDataSet;
    SqlCamposIndiv: TCMSqlParams;
    DsDadosIndiv: TwwDataSource;
    CdsDadosIndividuaisDESCRICAOEVENTO: TStringField;
    CdsDadosIndividuaisNUMEROAP: TFloatField;
    CdsDadosIndividuaisNUMEROAR: TFloatField;
    CdsDadosIndividuaisDATAVENCTOAP: TDateTimeField;
    CdsDadosIndividuaisDATAVENCTOAR: TDateTimeField;
    CdsDadosIndividuaisDATAREGULARIZACAO: TDateTimeField;
    CdsDadosIndividuaisTIPOREGULARIZACAO: TStringField;
    CdsDadosIndividuaisNUMBANCO: TStringField;
    CdsDadosIndividuaisNUMAGENCIA: TStringField;
    CdsDadosIndividuaisOBSERVACAO: TMemoField;
    CdsDadosIndividuaisARQUIVO: TBlobField;
    CdsDadosIndividuaisEXTENSAOARQUIVO: TStringField;
    MSBenef: TMontaSelect;
    CdsDadosIndividuaisCODIGORETORNO: TStringField;
    CdsDadosIndividuaisCONTABANCARIA: TStringField;
    CdsDadosIndividuaisIDHSTREGULARIZACAOFOLHA: TFloatField;
    sqlRelatoriosQTDE: TFloatField;
    sqlRelatoriosVALORTOTAL: TFloatField;
    ppRelatoriosppField11: TppField;
    ppRelatoriosppField12: TppField;
    CdsDadosIndividuaisNOMEARQUIVO: TStringField;
    CdsDadosIndividuaisIDPESSOA: TFloatField;
    CdsDadosIndividuaisIDTITULAR: TFloatField;
    CdsDadosRetornoCaixaSELECIONAR: TFloatField;
    CdsDadosRetornoCaixaMATRICULA: TStringField;
    CdsDadosRetornoCaixaNOME: TStringField;
    CdsDadosRetornoCaixaBANCO: TStringField;
    CdsDadosRetornoCaixaAGENCIA: TStringField;
    CdsDadosRetornoCaixaCONTABANCARIA: TStringField;
    CdsDadosRetornoCaixaDATAPAGAMENTO: TDateTimeField;
    CdsDadosRetornoCaixaFLGINCONSISTENCIA: TFloatField;
    CdsDadosRetornoCaixaSITPAGAMENTO: TStringField;
    CdsDadosRetornoCaixaDESCSITPAGAMENTO: TStringField;
    CdsDadosRetornoCaixaIDARQUIVORETORNOCAIXA: TFloatField;
    dblConvenio: TwwDBLookupCombo;
    CdsDadosRetornoCaixaIDPESSOA: TFloatField;
    CdsDadosRetornoCaixaVALORPAGAMENTO: TStringField;
    CdsDadosRetornoCaixaVALORCREDITADO: TStringField;
    CdsDadosRetornoCaixaCPF: TStringField;
    dblVersao: TwwDBLookupCombo;
    ppSummaryBand1: TppSummaryBand;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    sqlRelatoriosQTDEMENSAGEM: TFloatField;
    ppRelatoriosppField13: TppField;
    CdsDadosRetornoCaixaVALORPAGAMENTOAUX: TStringField;
    CdsDadosRetornoCaixaVALORCREDITADOAUX: TStringField;
    QryBasePagamentoPessoa: TwwQuery;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel12: TppLabel;
    ppLabel11: TppLabel;
    ppLabel10: TppLabel;
    ppLabel2: TppLabel;
    ppLabel1: TppLabel;
    ppLabel76: TppLabel;
    ppLabel50: TppLabel;
    ppLabel3: TppLabel;
    ppDBText11: TppDBText;
    ppLabel4: TppLabel;
    ppDBText12: TppDBText;
    CdsDadosRetornoCaixaREGULARIZADO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    Function ValidaInformacoes: boolean;
    Function ValidaInformacoesPrincipais: boolean;
    procedure SelecionaVersaoFolha();
    procedure SelecionaConvenio();
    procedure btnCarregarArquivoClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure btnEventosClick(Sender: TObject);
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure btnContasPagarClick(Sender: TObject);
    procedure btnContasReceberClick(Sender: TObject);
    procedure spnedAnoExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure TbsHistIndivExit(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure dbgArquivoRetornoTitleClick(Column: TColumn);
    procedure btnSelTudoClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure BtnConsistenciaClick(Sender: TObject);
    procedure BtnInConsistenciaClick(Sender: TObject);
    procedure BtnPendenciasClick(Sender: TObject);
    procedure BtnInconsArqClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgArquivoRetornoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure TbsHistIndivEnter(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure dbgIndivDblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure rpRelatoriosBeforePrint(Sender: TObject);
    procedure dbgIndivDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblConvenioEnter(Sender: TObject);
    procedure dblVersaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblVersaoEnter(Sender: TObject);
    procedure wwDBLookupCombo1NotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblVersaoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblConvenioNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure bbtnAjudaClick(Sender: TObject);
    procedure dblVersaoClick(Sender: TObject);
    procedure dblConvenioClick(Sender: TObject);
    procedure dbgArquivoRetornoCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure dblConvenioExit(Sender: TObject);
    procedure dblConvenioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure TbsArqRetornoEnter(Sender: TObject);
    procedure pgControlDetalheChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    ListaPessoaFora: TStringList;
    iTrocouSelecao : Integer;
    bArquivoImportado : boolean;
    iCountRegSelecionado : Integer;
    bProcessoCancelado : boolean;
    CtrlDocumento   : TCtrlDocumento;
    CtrlLancamento  : TCtrlLancamento;

    sAnoMesTela     : string;
    sMsgErro        : string;

    iIdForCli       : Integer;
    iCodDocumento   : Integer;
    bSomenteDadosArquivo: boolean;
    //bProcessando: boolean;

    // Inicio Variaveis para controles dos botoes inferiores
    bBtnEventos,        bBtnContasReceber,
    bBtnContasPagar,    bBtnConsistencia,
    bBtnInConsistencia, bBtnPendencias,
    bBtnInconsArq,      bBtnProcessar,
    bBbtnDesfazer     : boolean;

    // Final Variaveis para controles dos botoes inferiores
    dTotalValor     : Double;
    rValorDocumento : Double;
    DadosHeaderArquivo   : array[0..1] of HeaderArquivo;
    DadosTraillerArquivo : array[0..1] of TraillerArquivo;

    DadosRetornoArquivo  : array[0..100000] of FRetornoArquivo;

    aArqMemoryStream :TMemoryStream;

    FIdArquivoRetorno: Longint;
    FIdSeqRemessa: Longint;

    FsCodRetornoCredEfetuado: string;
    FSeqArquivoRetorno: Longint;
    FsNomeRelatorio: String;
    FIdArquivoRetornoCaixa: Longint;
    FIdPessoa: Longint;
    FIdHstFolha: Longint;
    FCodConvenio: Longint;
    FrValor: Real;
    FIdHstFolhaIndiv: Longint;
    procedure SetIdArquivoRetorno(const Value: Longint);
    procedure SetIdSeqRemessa(const Value: Longint);
    procedure SetOpcaoAlteraExclue(const Value: String);

    Function retornaCPF(PsIdPessoa : string): string;
    Function retornaDescRetorno(psCodRetorno : string): string;
    Function ExisteEventoRegularizacao(psIdArquivoRet, psIdArquivo : string): boolean;
    Function ExisteEventoRegularizacaoParaPessoa(psIdArquivo : string): boolean;
    Function ExisteEventoRegularizacaoCR(psIdArquivoRet, psIdArquivo : string): boolean;
    Function ExisteDocumentoPagarAberto(psIdArquivo : string): boolean;
    Function ExisteDocumentoReceberAberto(psIdArquivo : string): boolean;
    Function ExisteEventoRegularizado(psIdArquivoCaixa : string): boolean;
    Function ExisteEventoRegularizacaoCP(psIdArqRetorno, psIdArquivo : string): boolean;

    Function VerificaLancDocCapCar(pbArquivo : boolean; piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint):boolean;
    function VerificaLancDocLancadoHist(piIdHstFolhaBenef : Longint):boolean;

    Function InsereHstRegularizacao(pIdArquivoRetSelecionado: integer): boolean;

    procedure SetsCodRetornoCredEfetuado(const Value: string);
    procedure SetSeqArquivoRetorno(const Value: Longint);
    procedure SetsNomeRelatorio(const Value: String);
    procedure SetIdArquivoRetornoCaixa(const Value: Longint);
    procedure SetIdPessoa(const Value: Longint);
    procedure SetIdHstFolha(const Value: Longint);
    procedure SetCodConvenio(const Value: Longint);
    procedure SetrValor(const Value: Real);
    procedure SetIdHstFolhaIndiv(const Value: Longint);
    Function FiltrarCDS(cdsFiltrado: TCMClientDataSet; sFiltro: String): String; //Darivaldo Alencar SIG69309

  public
    { Public declarations }
    FSaida: text;
    sLinha: String;
    bControlaTela : boolean;
    DadosEventoRegularizacao  : array[0..1] of EventoRegularizacao;
    DadosDocumentos           : array[0..1] of Documentos;
    FsBuscaPorMatricula       : string;
    FsIdPessoa                : string;
    Property sCodRetornoCredEfetuado: string Read FsCodRetornoCredEfetuado Write SetsCodRetornoCredEfetuado;
    Property IdArquivoRetorno: Longint Read FIdArquivoRetorno Write SetIdArquivoRetorno;
    Property IdArquivoRetornoCaixa: Longint Read FIdArquivoRetornoCaixa Write SetIdArquivoRetornoCaixa;
    Property SeqArquivoRetorno: Longint Read FSeqArquivoRetorno Write SetSeqArquivoRetorno;
    Property IdSeqRemessa: Longint Read FIdSeqRemessa Write SetIdSeqRemessa;
    Property sNomeRelatorio: String Read FsNomeRelatorio Write SetsNomeRelatorio;
    property IdPessoa : Longint Read FIdPessoa Write SetIdPessoa;
    property IdHstFolha : Longint read FIdHstFolha write SetIdHstFolha;
    property IdHstFolhaIndiv : Longint read FIdHstFolhaIndiv write SetIdHstFolhaIndiv;
    property CodConvenio : Longint read FCodConvenio write SetCodConvenio;
    property rValor : Real read FrValor write SetrValor;

    procedure Cria(aNomeArquivo: string);
    procedure Encerra;
    procedure CarregaArquivo;
    procedure CarregaArquivoMatricula(PsMatricula : string);

    Function MontaHeader(pLinha :string): boolean;
    procedure MontaTrailler(pLinha :string);
    function MontaRetornoArquivo(pLinha: string; piContaRegistros: Longint) : boolean;

    procedure CarregaBaseDados;
    procedure CarregaBaseDadosMatricula(PsIdPessoa : string);
    Procedure ProcessaRetornoFinanc(psCodRetorno, psmatricula : string; piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint);
    Procedure ProcessaRetorno(pbArquivo : boolean; psCodRetorno, psmatricula: String; piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint );
    Procedure ProcessaOutroRetorno(pbArquivo : boolean; psmatricula: String; piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint );
    Procedure DesfazerRetornoFinanc(piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint);
    Procedure ExcluirEvento(piIdHst: Longint);
    Procedure AtualizaDados(pIdHst: Longint);
    Procedure AlterarEvento(piIdHst: Longint);
    Procedure ObtemPermissaoBotaoCarregarATela;

    Procedure RetornaPermissaoBotaoTelaCarregada;

    Function InsereArquivoRetorno(pIdArq,
                                  pIdBase,
                                  pIdHstFolha,
                                  pIdPessoa,
                                  pIdTitular: integer;
                                  pMatricula,
                                  pCpf,
                                  pNome,
                                  pBanco,
                                  pAgencia,
                                  pConta,
                                  pVlrPagamento,
                                  pDataPagamento: string;
                                  pFlgInconsistencia,
                                  pSeqRemessa: integer;
                                  psCodRetorno : string
                                 ): boolean;

    Function InsereBaseDePagamentoRetorno(PsIdPessoa : string): boolean;


  end;

var
  frmConciliacaoCredito: TfrmConciliacaoCredito;

implementation

uses FTelaAut, ULancEventoRegularizacao, FLancContasPagar, fAguarde, FLancContasReceber, UFuncoesUteisFB, dBaseDados, usistema, UMensErro;

{$R *.DFM}



procedure TfrmConciliacaoCredito.Cria(aNomeArquivo: string);
begin
   try

   // Seta Arquivo, a Variavel ...
      AssignFile(FSaida, aNomeArquivo);
   // Abre Arquivo para Leitura
      Reset(FSaida);
   except
      MsgDlg('Erro ao abrir Arquivo.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   // Testa se Arquivo esta Vazio
   if EOF(FSaida) then begin
      MsgDlg('O arquivo informado está VAZIO.','Erro',mtError,[mbOk],0);
      Exit;
   end;

end;

procedure TfrmConciliacaoCredito.Encerra;
begin
  closefile(FSaida);
end;

procedure TfrmConciliacaoCredito.FormCreate(Sender: TObject);
begin
   inherited;
   ctrlDocumento := tctrlDocumento.create;
   ctrlDocumento.InitializeAs(Padroes);

   ctrlLancamento := tctrlLancamento.create;
   ctrlLancamento.InitializeAs(Padroes);
   
   pgControlDetalhe.ActivePageIndex := 0;
   // RNG01 inicio
   spnedAno.MaxValue := StrToInt(FormatDateTime('yyyy', Now))+5;
   spnedAno.Value    := StrToInt(FormatDateTime('yyyy', Now));
   spnedAno.MinValue := 1994;
   // RNG01 Final

   QryEvento.close;
   QryEvento.Open;
   CdsDadosRetornoCaixa.close;
   CdsDadosIndividuais.close;
end;

Function TfrmConciliacaoCredito.ValidaInformacoes : boolean;
var iContador, i : Longint;
    sUltlinhas: TStringList;
    linha : String;
    erro: Boolean;
begin
   Result := false;
   if (cmbMes.Text = '') then
   begin
      MsgDlg('É obrigatório informar o mês/ano de pagamento.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (dblVersao.Text = '') then
   begin
      MsgDlg('É obrigatório selecionar a versão da folha de benefícios.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (dblConvenio.Text = '') then
   begin
      MsgDlg('É obrigatório selecionar o convênio do arquivo.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (dbrgBusca.ItemIndex = 0) then //Arquivo
   begin
      if (trim(edtNomeArquivo.Text) = '') then
      begin
         MsgDlg('Selecione o arquivo de retorno a ser importado.','Informação',mtInformation,[mbOk],0);
         bProcessoCancelado := true;
         exit;
      end
      else
      begin

         sUltlinhas := TStringList.Create;
         sUltlinhas.LoadFromFile(edtNomeArquivo.Text);
         iContador := sUltlinhas.Count - 1;

         if sUltlinhas.Count = 0 then
         begin
            MsgDlg('Processo Cancelado! Arquivo inconsistente.','Informação',mtInformation,[mbOk],0);
            bProcessoCancelado := true;
            exit;
         end;
         linha := sUltlinhas[0];
         if copy(linha,1,1) = 'A' then
         begin
            if (trim(copy(linha,3,20)) <> '') and (qryConvenio.FieldByName('numempresabanco').AsString <> '') then
            begin
               if StrToInt(trim(copy(linha,3,20))) <> qryConvenio.FieldByName('numempresabanco').AsInteger then
               begin
                  MsgDlg('Processo Cancelado! O Arquivo não pertence ao convênio selecionado.','Informação',mtInformation,[mbOk],0);
                  bProcessoCancelado := true;
                  exit;
               end;
            end
            else
            if (qryConvenio.FieldByName('numempresabanco').AsString = '') then
            begin
                  MsgDlg('Processo Cancelado! O Arquivo não pertence ao convênio selecionado.','Informação',mtInformation,[mbOk],0);
                  bProcessoCancelado := true;
                  exit;
            end;
         end
         else
         begin
            MsgDlg('Processo Cancelado! Arquivo inconsistente.','Informação',mtInformation,[mbOk],0);
            bProcessoCancelado := true;
            exit;
         End;
         FreeAndNil(sUltlinhas);
      end;
   end;

   Result := true;
end;

procedure TfrmConciliacaoCredito.btnCarregarArquivoClick(Sender: TObject);
var i : integer;

begin
   inherited;
   if not(ValidaInformacoesPrincipais) then
      exit;

   bProcessoCancelado := false;
   bArquivoImportado  := false;
   if Not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;

   if (CdsDadosIndividuais.active) then
      CdsDadosIndividuais.close;
   if (CdsDadosRetornoCaixa.active) then
      CdsDadosRetornoCaixa.close;

   try
      ListaPessoaFora:=tstringlist.create;
      ListaPessoaFora.Clear;
      if ValidaInformacoes then
      begin
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(' SELECT count(1) AS QTDE ' + #13#10 +
                        '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                        ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
                        '    ON (A.IDBASEPGTO = B.IDBASEPGTO AND' + #13#10 +
                        '       A.IDHSTFOLHABENEF = B.IDHSTFOLHABENEF AND A.IDPESSOA = B.IDPESSOA AND' + #13#10 +
                        '       A.IDTITULAR = B.IDTITULAR)' + #13#10 +
                        ' WHERE  B.CODPORTFORMA    =  '+dblConvenio.LookupValue+ #13#10 +
                        ' AND    A.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
         qryAux.Open;

         bArquivoImportado := (qryAux.FieldByName('QTDE').AsInteger > 0);

         if (dbrgBusca.ItemIndex = 0) then  // Arquivo
         begin
            if (edtNomeArquivo.Text <> '')  then
            begin
               CarregaArquivo();
               if not(bProcessoCancelado) then
                  if CdsDadosRetornoCaixa.recordcount > 0 then
                     MsgDlg('Arquivo de retorno importado com sucesso.','Informação',mtInformation,[mbOk],0);
                  //else
                  //   MsgDlg('Nenhum registro importado verifique o arquivo.','Informação',mtInformation,[mbOk],0);
            end
            else
            begin
               MsgDlg('Selecione o arquivo de retorno a ser importado.','Informação',mtInformation,[mbOk],0);
               exit;
            end;
         end
         else
         begin
            CarregaBaseDados();
         end;


      end;
   except
      MsgDlg('Erro não identificado na importação.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.close;
      exit;
   end;
   pgControlDetalhe.ActivePageIndex := 0;
   if (dblVersao.LookupValue <> '') and (dblConvenio.LookupValue <> '') then
   begin
      if bProcessoCancelado then
      begin
         if (CdsDadosRetornoCaixa.Active) then
         if CdsDadosRetornoCaixa.RecordCount > 0 then
         begin
            RetornaPermissaoBotaoTelaCarregada;
            if btnProcessar.Enabled then
               btnProcessar.SetFocus;
         end;
         exit;
      end;
      SqlCampos.Prepare;
      SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
      SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
      SqlCampos.ParambyName('IDPESSOA').AsString := '';
      SqlCampos.Open;

      btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
      btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);

      if (dbrgBusca.ItemIndex = 0) then  // Arquivo
      begin
         if (edtNomeArquivo.Text <> '')  then
         begin
            if CdsDadosRetornoCaixa.recordcount > 0 then
               MsgDlg('Arquivo de retorno importado com sucesso.','Informação',mtInformation,[mbOk],0);
         end;
      end;
   end;

   
   FreeAndNil(ListaPessoaFora);

   if (dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.Commit;

   //bProcessando := false;
   iCountRegSelecionado := 0;
   pgControlDetalhe.ActivePageIndex := 0;

   if CdsDadosRetornoCaixa.RecordCount > 0 then
   begin
      RetornaPermissaoBotaoTelaCarregada;
      if btnProcessar.Enabled then
         btnProcessar.SetFocus;
   end;
   
end;

procedure TfrmConciliacaoCredito.SelecionaVersaoFolha;
var sAnoMes: String;
begin
  try
     if (cmbMes.ItemIndex < 10) then
        sAnoMes := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex)
     else
        sAnoMes := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex);

     qryVersaoFolha.close;
     qryVersaoFolha.ParamByName('MESREFERENCIA').AsString := sAnoMes;

     qryVersaoFolha.open;
     dblConvenio.Text := '';

     btnEventos.Enabled        := false ;
     btnContasReceber.Enabled  := false ;
     btnContasPagar.Enabled    := false;
     BtnConsistencia.Enabled   := false ;
     BtnInConsistencia.Enabled := false ;
     BtnPendencias.Enabled     := false ;
     BtnInconsArq.Enabled      := false ;
     btnProcessar.Enabled      := false ;
     bbtnDesfazer.Enabled      := false ;
  except
  end;
end;

procedure TfrmConciliacaoCredito.cmbMesChange(Sender: TObject);
begin
  inherited;
  SelecionaVersaoFolha();
end;

procedure TfrmConciliacaoCredito.SelecionaConvenio;
begin
  try
     qryConvenio.close;
     qryConvenio.ParamByName('IDHSTFOLHABENEF').AsString := dblVersao.LookupValue;
     qryConvenio.open;
     dblConvenio.Text := '';
     pgControlDetalhe.ActivePageIndex := 0;

     btnEventos.Enabled        := false ;
     btnContasReceber.Enabled  := false ;
     btnContasPagar.Enabled    := false;
     BtnConsistencia.Enabled   := false ;
     BtnInConsistencia.Enabled := false ;
     BtnPendencias.Enabled     := false ;
     BtnInconsArq.Enabled      := false ;
     btnProcessar.Enabled      := false ;
     bbtnDesfazer.Enabled      := false ;
  except  
  end;
end;

procedure TfrmConciliacaoCredito.btnProcurarClick(Sender: TObject);
begin
   inherited;
   FsIdPessoa := '';
   FsBuscaPorMatricula := '';
   if not(ValidaInformacoesPrincipais) then
      exit;

   if Not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;

  if (CdsDadosIndividuais.active) then
     CdsDadosIndividuais.close;
  if (CdsDadosRetornoCaixa.active) then
     CdsDadosRetornoCaixa.close;
           
   bArquivoImportado := false;
   if ValidaInformacoes then
   begin
      MSBenef.Executar;
      if (MSBenef.ValoresChave.Count > 0) and
         (MSBenef.ValoresChave[0] <> '') then
      begin
         FsBuscaPorMatricula := MSBenef.ValoresChave[3]+' '+MSBenef.ValoresChave[0];
         FsIdPessoa := MSBenef.ValoresChave[0];
         if (dbrgBusca.itemindex = 0) then  //Arquivo
         begin
            if (edtNomeArquivo.Text <> '') then
            begin
               qryAux.Close;
               qryAux.Sql.Clear;
//               qryAux.Sql.Add(' SELECT Codarquivoretornocaixa ' + #13#10 + //Everson TIBERO
               qryAux.Sql.Add(' SELECT A.Codarquivoretornocaixa ' + #13#10 + //Everson TIBERO
                              '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                              ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
                              '    ON (A.IDBASEPGTO = B.IDBASEPGTO AND' + #13#10 +
                              '       A.IDHSTFOLHABENEF = B.IDHSTFOLHABENEF AND A.IDPESSOA = B.IDPESSOA AND' + #13#10 +
                              '       A.IDTITULAR = B.IDTITULAR)' + #13#10 +
                              ' WHERE  B.CODPORTFORMA    =  '+dblConvenio.LookupValue+ #13#10 +
                              ' AND    B.IDPESSOA    =  '+QuotedStr(FsIdPessoa)+ #13#10 +
                              ' AND    A.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
               qryAux.Open;
               if (qryAux.IsEmpty) then
               begin
                  CarregaArquivoMatricula(FsBuscaPorMatricula);
                  // final do processo
                  MsgDlg('Arquivo de retorno importado com sucesso.','Informação',mtInformation,[mbOk],0);
               end
               else
               begin
                  SqlCampos.Prepare;
                  SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
                  SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
                  SqlCampos.ParambyName('IDPESSOA').AsString := FsIdPessoa;
                  SqlCampos.Open;
                  IdArquivoRetorno := qryAux.FieldbyName('Codarquivoretornocaixa').AsInteger;

                  btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
                  btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);


               end;
            end
            else
            begin
               MsgDlg('Selecione o arquivo de retorno a ser importado.','Informação',mtInformation,[mbOk],0);
               exit;
            end;
         end
         else
         begin
            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.Add(' SELECT 1 ' + #13#10 +
                           '  FROM BASEDEPAGAMENTO B ' + #13#10 +
                           ' WHERE  B.CODPORTFORMA =  '+dblConvenio.LookupValue+ #13#10 +
                           ' AND    B.IDPESSOA    =  '+FsIdPessoa+ #13#10 +
                           ' AND    B.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
            qryAux.Open;

            if (qryAux.IsEmpty) then
            begin
               MsgDlg('Processo Cancelado! A matrícula não é do convênio selecionado.','Informação',mtInformation,[mbOk],0);
               exit;
            end;

            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.Add(' SELECT 1 ' + #13#10 +
                           '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                           ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
                           '    ON (A.IDBASEPGTO = B.IDBASEPGTO AND' + #13#10 +
                           '       A.IDHSTFOLHABENEF = B.IDHSTFOLHABENEF AND A.IDPESSOA = B.IDPESSOA AND' + #13#10 +
                           '       A.IDTITULAR = B.IDTITULAR)' + #13#10 +
                           ' WHERE  B.CODPORTFORMA    =  '+dblConvenio.LookupValue+ #13#10 +
                           ' AND    B.IDPESSOA    =  '+FsIdPessoa+ #13#10 +
                           ' AND    A.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
            qryAux.Open;
            if (qryAux.IsEmpty) then
            begin
               CarregaBaseDadosMatricula(FsIdPessoa);
            end
            else
            begin
               SqlCampos.Prepare;
               SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
               SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
               SqlCampos.ParambyName('IDPESSOA').AsString := FsIdPessoa;
               SqlCampos.Open;

               btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
               btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);

            end;
         end;



          if (dtmBaseDados.dbBaseDados.InTransaction) then
             dtmBaseDados.dbBaseDados.Commit;
          iCountRegSelecionado := 0;
          pgControlDetalhe.ActivePageIndex := 0;

          if CdsDadosRetornoCaixa.RecordCount > 0 then
             RetornaPermissaoBotaoTelaCarregada;

      end;
   end;
end;

procedure TfrmConciliacaoCredito.bbtnDesfazerClick(Sender: TObject);
var icontador : Longint;
    bErro: boolean;
begin
   pgControlDetalhe.ActivePageIndex := 0;
   if not(ValidaInformacoes) then
   begin
      exit;
   end;
   //if bProcessando then
   //   exit;
   inherited;

   If MsgDlg('Deseja desfazer a importação do arquivo','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
   begin
      Exit;
   end;

   icontador := 0;
   CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
   CdsDadosRetornoCaixa.filtered:=true;
   CdsDadosRetornoCaixa.DisableControls;

   while not(CdsDadosRetornoCaixa.eof) do
   begin
      if (CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 1) then
      begin
         icontador := icontador + 1;
         if icontador > 0 then
         begin
            CdsDadosRetornoCaixa.Last;
         end;
      end;
   end;

   if icontador < 1 then
   begin
      MsgDlg('É necessário selecionar pelo menos um assistido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.EnableControls;
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   CdsDadosRetornoCaixa.First;

   if CdsDadosRetornoCaixa.active  then
   begin

         CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
         CdsDadosRetornoCaixa.filtered:=true;
         //CdsDadosRetornoCaixa.DisableControls;
         icontador := 0;


         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.StartTransaction;

         try
            CdsDadosRetornoCaixa.first;
            bErro:= true;
            while not(CdsDadosRetornoCaixa.eof) do
            begin
               if (CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 1) then
               begin
                  icontador := icontador + 1;

                  If (VerificaLancDocCapCar((Trim(edtNomeArquivo.Text) <> ''), StrToInt(dblVersao.LookupValue), IdArquivoRetorno, IdSeqRemessa)) then
                  begin
                     IF Trim(edtNomeArquivo.Text) <> '' then
                     begin
                        MsgDlg('Não é possível desfazer a importação do arquivo pois alguns pagamentos já foram tratados.','Informação',mtInformation,[mbOk],0);
                        CdsDadosRetornoCaixa.EnableControls;
                        bErro:= false;
                        CdsDadosRetornoCaixa.filtered:=false;
                        dtmBaseDados.dbBaseDados.Rollback;
                        exit;
                     end
                     else
                     begin
                        MsgDlg('Não é possível desfazer a importação da base de pagamento pois alguns pagamentos já foram tratados.','Informação',mtInformation,[mbOk],0);
                        CdsDadosRetornoCaixa.EnableControls;
                        bErro:= false;
                        CdsDadosRetornoCaixa.filtered:=false;
                        dtmBaseDados.dbBaseDados.Rollback;
                        exit;
                     end;
                  end;
                  try
                     DesfazerRetornoFinanc(StrToInt(dblVersao.LookupValue),IdArquivoRetorno,IdSeqRemessa);
                  except
                     bErro:= false;
                  end;
               end;
               CdsDadosRetornoCaixa.next;
            end;
         finally
            if (dtmBaseDados.dbBaseDados.InTransaction) then
               dtmBaseDados.dbBaseDados.Commit;
            if bErro then
               MsgDlg('Regularização desfeita com sucesso.','Informação',mtInformation,[mbOk],0)
            else
               MsgDlg('Para alguma(s) matricula(s) não foi possível desfazer a regularização.','Informação',mtInformation,[mbOk],0);
         end;

         CdsDadosRetornoCaixa.EnableControls;



      {Desfazer Importação do Arquivo de Retorno da CEF:
      - Para desfazer o processamento do arquivo de retorno financeiro da Caixa Econômica Federal o sistema deverá deletar as informações da tabela ARQUIVODERETORNOCAIXA.}
      CdsDadosRetornoCaixa.filtered:=false;

      SqlCampos.Prepare;
      SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
      SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
      SqlCampos.ParambyName('IDPESSOA').AsString := FsIdPessoa;
      SqlCampos.Open;

      btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
      btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);

   end;
   pgControlDetalhe.ActivePageIndex := 0;
   
end;

procedure TfrmConciliacaoCredito.sbtnExcluiDetClick(Sender: TObject);
var iIdPessoa : Longint;
    iIdArquivo: Longint;
begin

   inherited;
   iIdArquivo := CdsDadosRetornoCaixa.FieldbyName('idarquivoretornocaixa').AsInteger;
   If (VerificaLancDocLancadoHist(StrToInt(dblVersao.LookupValue))) then
   begin
       MsgDlg('Não é possível excluir o evento de regularização de pagamento de benefícios.','Informação',mtInformation,[mbOk],0);
   end
   else
   begin
      If MsgDlg('Deseja excluir o evento para regularização de benefício','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
      begin
         Exit;
      end
      else
      begin
         ExcluirEvento(CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger);

         AtualizaDados(iIdArquivo);
      end;
   end;
end;

procedure TfrmConciliacaoCredito.sbtnAltDetClick(Sender: TObject);

begin

   {if (ExisteEventoRegularizado(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString)) then
   begin
       MsgDlg('Não é possível alterar um pagamento regularizado.','Informação',mtInformation,[mbOk],0);
       exit;
   end; }
   inherited;
   If (VerificaLancDocLancadoHist(StrToInt(dblVersao.LookupValue))) then
   begin
       MsgDlg('Não é possível alterar o evento de regularização de pagamento de benefícios com documentos lançados.','Informação',mtInformation,[mbOk],0);
       exit;
   end
   else
   begin
      If MsgDlg('Deseja alterar o evento para regularização de benefício','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
      begin
         Exit;
      end
      else
      begin
         dbgIndiv.Visible := false;
         Dock973.Visible := false;
      end;
   end;



end;

procedure TfrmConciliacaoCredito.btnEventosClick(Sender: TObject);
var icontador : integer;
begin
   if bControlaTela then
   begin
      if frmLancEventoRegularizacao = nil then
         exit
      else
      begin
         frmLancEventoRegularizacao.BringToFront;
         exit;
      end;
   end;
   CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
   CdsDadosRetornoCaixa.filtered:=true;
   icontador := 0;
   while not(CdsDadosRetornoCaixa.eof) do
   begin
      inc(icontador);
      CdsDadosRetornoCaixa.next;
      if icontador > 1 then
         CdsDadosRetornoCaixa.last;
   end;

   if icontador < 1 then
   begin
      MsgDlg('É necessário selecionar pelo menos um assistido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end
   else
   if (icontador > 1) then
   begin
      MsgDlg('A regularização de pagamento deve ser feita apenas para um assistido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   inherited;
   IdArquivoRetornoCaixa := CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add( '  select 1 '+
                    ' from hstregularizacaofolha h '+
                    ' inner join cadastroeventosderegularizacao c '+
                    '    on (c.idcadeventosderegularizacao = h.idcadeventosderegularizacao) '+
                    ' where h.idarquivoretornocaixa =  '+IntToStr(IdArquivoRetornoCaixa));
    qryAux.open;

    if qryAux.RecordCount > 0 then
    begin
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add( '  select 1 '+
                          ' from hstregularizacaofolha h '+
                          ' inner join cadastroeventosderegularizacao c '+
                          '    on (c.idcadeventosderegularizacao = h.idcadeventosderegularizacao) '+
                          ' where c.codigoretorno = ''00''  '+
                          ' and   h.idarquivoretornocaixa =  '+IntToStr(IdArquivoRetornoCaixa));
          qryAux.open;
          if qryAux.recordcount > 0 then
          begin
             MsgDlg('Já existe um lançamento de evento para a regularização de crédito efetuado.','Informação',mtInformation,[mbOk],0);
             CdsDadosRetornoCaixa.filtered:=false;
             Exit;
          end;

          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add( 'SELECT H.CODDOCUMENTOCAP, H.CODDOCUMENTOCAR, D.STATUS AS STATUSR, DX.STATUS AS STATUSP ' + #13#10 +
                          '  FROM CM.HSTREGULARIZACAOFOLHA H' + #13#10 +
                          '  Left outer join Documento D On (H.CODDOCUMENTOCAR = D.CODDOCUMENTO)' + #13#10 +
                          '  Left outer join Documento DX On (H.CODDOCUMENTOCAP = DX.CODDOCUMENTO) '+ #13#10 +
                          '  WHERE H.IDARQUIVORETORNOCAIXA = '+ IntToStr(IdArquivoRetornoCaixa)+ ' order by idhstregularizacaofolha ' );
          qryAux.Open;

          if qryAux.recordcount <= 1 then
          begin
             if qryAux.FieldByName('CODDOCUMENTOCAP').AsFloat > 0 then
             begin
               if qryAux.FieldByName('STATUSP').AsFloat <> 2 then
               begin
                  MsgDlg('Já existe um evento de regularização em aberto.'+#13+
                         'Para um novo evento é necessario o lançamento e baixa dos documentos Pagar/Receber','Informação',mtInformation,[mbOk],0);
                  CdsDadosRetornoCaixa.filtered:=false;
                  Exit;
               end;
             end
             else
             begin
                  MsgDlg('Já existe um evento de regularização em aberto.'+#13+
                         'Para um novo evento é necessario o lançamento e baixa dos documentos Pagar/Receber','Informação',mtInformation,[mbOk],0);
                  CdsDadosRetornoCaixa.filtered:=false;
                  Exit;
             end;
          end
          else
          begin
             qryAux.last;
             if qryAux.FieldByName('CODDOCUMENTOCAP').AsFloat > 0 then
             begin
               if qryAux.FieldByName('STATUSR').AsFloat <> 2 then
               begin
                  MsgDlg('Já existe um evento de regularização em aberto.'+#13+
                         'Para um novo evento é necessario o lançamento e baixa dos documentos Pagar/Receber','Informação',mtInformation,[mbOk],0);
                  CdsDadosRetornoCaixa.filtered:=false;
                  Exit;
               end;
             end
             else
             begin
                  MsgDlg('Já existe um evento de regularização em aberto.'+#13+
                         'Para um novo evento é necessario o lançamento e baixa dos documentos Pagar/Receber','Informação',mtInformation,[mbOk],0);
                  CdsDadosRetornoCaixa.filtered:=false;
                  Exit;
             end;
          end;
    end;

   //AbrirForm(frmLancEventoRegularizacao,TfrmLancEventoRegularizacao,False);
   frmLancEventoRegularizacao := TfrmLancEventoRegularizacao.create(application);

   frmLancEventoRegularizacao.Show;
   CdsDadosRetornoCaixa.filtered:=false;

   {SqlCamposIndiv.Prepare;
   SqlCamposIndiv.ParamByName('IDARQUIVORETORNOCAIXA').Asstring  := CdsDadosRetornoCaixa.FieldByName('IDARQUIVORETORNOCAIXA').Asstring;
   SqlCamposIndiv.ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
   SqlCamposIndiv.Open;}
   CdsDadosIndividuais.close;
   pgControlDetalhe.ActivePageIndex := 0;
   //dbgIndiv.SetFocus;
end;

procedure TfrmConciliacaoCredito.CarregaArquivo;
var iContador, i : Longint;
    sUltlinhas: TStringList;
    linha : String;
    erro: Boolean;
begin
   erro := false;
   try
      try

          sUltlinhas := TStringList.Create;
          sUltlinhas.LoadFromFile(edtNomeArquivo.Text);
          iContador := sUltlinhas.Count - 1;

          linha := sUltlinhas[0];
          if copy(linha,1,1) = 'A' then
          begin
             if trim(copy(linha,3,20)) <> '' then
             if StrToInt(trim(copy(linha,3,20))) <> qryConvenio.FieldByName('numempresabanco').AsInteger then
             begin
                MsgDlg('Processo Cancelado! O Arquivo não pertence ao convênio selecionado.','Informação',mtInformation,[mbOk],0);
                Cria(edtNomeArquivo.Text);
                erro := true;
                exit;
             end;
          end
          else
          begin
             MsgDlg('Processo Cancelado! O Arquivo inconsistente.','Informação',mtInformation,[mbOk],0);
             //CdsDadosRetornoCaixa.close;
             erro := true;
             exit;
          End;


          linha := sUltlinhas[iContador];
          //Descrição do Registro "Z" - TRAILLER
          if copy(linha,1,1) = 'Z' then
          begin
             MontaTrailler(linha);
          end;
          // Cria
          Cria(edtNomeArquivo.Text);
          //bProcessando := true;
          // Inicia Processamento
          SqlCampos.Prepare;
          SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
          SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
          SqlCampos.ParambyName('IDPESSOA').AsString := '';
          SqlCampos.Open;

          btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
          btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);

          iContador := 0;
          frmAguarde.Pos      := 1;
          frmAguarde.Max      := sUltlinhas.Count - 2;
          Application.ProcessMessages;

          //CdsDadosRetornoCaixa.delete;

          while not EOF(FSaida) do
          begin
             frmAguarde.Mostra('Carregando arquivo: ' + IntToStr(iContador) + ' de ' + IntToStr(sUltlinhas.Count - 2) + '.');
             // Lê a Linha
             Readln(FSaida,sLinha);

             // Caso Linha vazia pula
             if Trim(sLinha) = '' then
                Continue;

             // Descrição do Registro "A" - HEADER
             if copy(sLinha,1,1) = 'A' then
                if not(MontaHeader(sLinha)) then
                begin
                   erro := true;
                   bProcessoCancelado := true;
                   exit;
                end;

             // escrição do Registro "F"  Retorno do Crédito Automático
             if copy(sLinha,1,1) = 'F' then
             begin
                Inc(iContador);
                if (MontaRetornoArquivo(sLinha, iContador)) then
                begin
                   erro := true;
                   bProcessoCancelado := true;
                   exit;
                end;
             end;

             frmAguarde.Pos := iContador;
          end;

      except
            erro := true;
            Encerra;
      end;
   finally
   // Fecha o Arquivo
      bProcessoCancelado := erro;
      frmAguarde.Apaga;
      try
         if not(erro) then
            Encerra;
      except
      end;
      //CdsDadosRetornoCaixa.Post;
   end;
end;


procedure TfrmConciliacaoCredito.btnSelecionarArquivoClick(
  Sender: TObject);
begin
   inherited;
   edtNomeArquivo.ReadOnly := false;
   DlgProcurarArquivo.Execute;
   edtNomeArquivo.Text := DlgProcurarArquivo.FileName;
   edtNomeArquivo.ReadOnly := true;
   if (CdsDadosIndividuais.active) then
      CdsDadosIndividuais.close;
   if (CdsDadosRetornoCaixa.active) then
      CdsDadosRetornoCaixa.close;
end;


procedure TfrmConciliacaoCredito.btnContasPagarClick(Sender: TObject);
var icontador : integer;
begin
   if bControlaTela then
   begin
      if frmLancContasPagar = nil then
         exit
      else
      begin
         frmLancContasPagar.BringToFront;
         exit;
      end;

   end;
   CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
   CdsDadosRetornoCaixa.filtered:=true;
   icontador := 0;

   CdsDadosRetornoCaixa.DisableControls;
   while not(CdsDadosRetornoCaixa.eof) do
   begin
      if (CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 1) then
      begin
         inc(icontador);
      end;
      if icontador > 1 then
         CdsDadosRetornoCaixa.last;
      CdsDadosRetornoCaixa.next;
      //if icontador > 1 then
      //   CdsDadosRetornoCaixa.last;
   end;
   CdsDadosRetornoCaixa.EnableControls;

   if icontador < 1 then
   begin
      MsgDlg('É necessário selecionar pelo menos um assistido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end
   else
   if icontador > 1 then
   begin
      MsgDlg('É possível lançar um documento apenas para um assistido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   if (ExisteEventoRegularizado(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString)) then
   begin
      MsgDlg('Não é possível lançar um documento a pagar para um crédito efetuado.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   if not(ExisteEventoRegularizacaoCP(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString,  IntToStr(IdArquivoRetorno))) then
   begin
      MsgDlg('Para fazer um lançamento do recebimento do contas a pagar é necessário que o documento do contas a receber tenha sido baixado.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   //- Ao selecionar o botão Contas a Pagar caso não tenha sido selecionado nenhum assistido na grid de arquivo de retorno da Caixa o sistema apresenta a mensagem:


  { QryBasePagamentoPessoa.Close;
   QryBasePagamentoPessoa.ParamByName('IDPESSOA').AsString := CdsDadosRetornoCaixa.FieldByName('IDPESSOA').Asstring ;
   QryBasePagamentoPessoa.ParamByName('IDHSTFOLHABENEF').AsString := dblVersao.LookupValue  ;
   QryBasePagamentoPessoa.Open;

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add( 'SELECT 1' + #13#10 +
                   '  FROM DOCUMENTO D' + #13#10 +
                   ' WHERE D.CODDOCUMENTO =' + #13#10 +
                   '       (SELECT MAX(CODDOCUMENTOCAR)' + #13#10 +
                   '          FROM HSTREGULARIZACAOFOLHA H, ARQUIVODERETORNOCAIXA A' + #13#10 +
                   '         WHERE A.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA' + #13#10 +
                   '           AND A.IDBASEPGTO = ' + QryBasePagamento.FieldByName('IDBASEPGTO').Asstring + #13#10 +
                   '           AND A.IDHSTFOLHABENEF = ' + dblVersao.LookupValue + #13#10 +
                   '           AND A.IDPESSOA = '+ QryBasePagamento.FieldByName('IDPESSOA').Asstring + #13#10 +
                   '           AND A.IDTITULAR = '+ QryBasePagamento.FieldByName('IDTITULAR').Asstring +' )' + #13#10 +
                   '   AND D.STATUS > 0');
   qryAux.open;
   If (qryAux.IsEmpty) then
   begin
      MsgDlg('Para fazer o lançamento do pagamento no Contas a Pagar é necessário antes lançar o contas a receber.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;}
   IdArquivoRetornoCaixa := CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger;

   if ExisteDocumentoReceberAberto(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString) then
   begin
      MsgDlg('Não é possível realizar o lançamento do documento.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   IdPessoa     := CdsDadosRetornoCaixa.FieldByName('IDPESSOA').AsInteger;
   IdHstFolha   := StrToInt64(dblVersao.LookupValue);
   CodConvenio  := StrToInt64(dblConvenio.LookupValue);
   rValor       := StrToFloat(trim(CdsDadosRetornoCaixa.FieldByName('VALORPAGAMENTO').AsString));

   if CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger > 0 then
      IdHstFolhaIndiv := CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger
   else
   begin
      SqlCamposIndiv.Prepare;
      SqlCamposIndiv.ParamByName('IDARQUIVORETORNOCAIXA').Asstring  := CdsDadosRetornoCaixa.FieldByName('IDARQUIVORETORNOCAIXA').Asstring;
      SqlCamposIndiv.ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
      SqlCamposIndiv.Open;
      IdHstFolhaIndiv := CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger;
   end;

   frmLancContasPagar := TfrmLancContasPagar.create(application);

   frmLancContasPagar.Show;
   CdsDadosRetornoCaixa.filtered:=false;
   //inherited;
end;



procedure TfrmConciliacaoCredito.CarregaBaseDados;
var iContador : Integer;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT 1 ' + #13#10 +
                  '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                  ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
                  '    ON (A.IDBASEPGTO = B.IDBASEPGTO AND' + #13#10 +
                  '       A.IDHSTFOLHABENEF = B.IDHSTFOLHABENEF AND A.IDPESSOA = B.IDPESSOA AND' + #13#10 +
                  '       A.IDTITULAR = B.IDTITULAR)' + #13#10 +
                  ' WHERE  B.CODPORTFORMA    =  '+dblConvenio.LookupValue+ #13#10 +
                  ' AND    A.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
   qryAux.Open;
   if (qryAux.IsEmpty) then
   begin
      if not(InsereBaseDePagamentoRetorno('')) then
         MsgDlg('Erro Ao Inserir na estrutura ARQUIVODERETORNOCAIXA .','Informação',mtInformation,[mbOk],0);
   end;


   
end;

procedure TfrmConciliacaoCredito.ProcessaRetornoFinanc(psCodRetorno, psmatricula : string; piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint);
var bArquivo : boolean;

begin

   try

      bArquivo := (trim(edtNomeArquivo.Text) <> '');
      //ProcessaRetorno(bArquivo,psCodRetorno,psmatricula,piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa);
      if psCodRetorno = '00' then
      begin

      end;

   finally

   end;
end;

procedure TfrmConciliacaoCredito.ProcessaRetorno(pbArquivo : boolean; psCodRetorno, psmatricula : String; piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa: Longint);
var berro : boolean;
    iIdArquivoRet, iflgConsistencia : longInt;
begin
   iflgConsistencia := 0;


end;

procedure TfrmConciliacaoCredito.DesfazerRetornoFinanc(piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint);
var berro : boolean;
begin

  // try
      berro := false;
      If not(VerificaLancDocCapCar((Trim(edtNomeArquivo.Text) <> ''), piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa)) then
      begin

         qryAux.Close;
         qryAux.Sql.Clear;
         IF Trim(edtNomeArquivo.Text) <> '' then
         begin
            qryAux.Sql.Add( ' DELETE' + #13#10 +
                            '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
                            ' WHERE EXISTS (SELECT 1 FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                            '               WHERE  A.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA' + #13#10 +
                            '               AND    A.IDARQUIVORETORNOCAIXA = '+IntToStr(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger)+' ');
         //   if dbrgBusca.ItemIndex > 0 then
         //      qryAux.Sql.Add( ' AND    A.MATRICULA    =  '+QuotedStr(trim(FsBuscaPorMatricula)));

               qryAux.Sql.Add( ' ) ');
            try
               qryAux.ExecSQL;
            except
               berro := true;
            end;
         end
         else
         begin
            qryAux.Sql.Add( ' DELETE' + #13#10 +
                            '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
                            ' WHERE EXISTS (SELECT 1 FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                            '               WHERE  A.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA' + #13#10 +
                            '               AND    A.IDARQUIVORETORNOCAIXA = '+IntToStr(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger) + #13#10 +
                            '               AND    A.IDHSTFOLHABENEF = '+IntToStr(piIdHstFolhaBenef)+' ');
            //if dbrgBusca.ItemIndex > 0 then
           //    qryAux.Sql.Add( ' AND    A.MATRICULA    =  '+QuotedStr(trim(FsBuscaPorMatricula)));

            qryAux.Sql.Add( ' ) ');
            try
               qryAux.ExecSQL;
            except
               berro := true;
            end;
         end;


         qryAux.Close;
         qryAux.Sql.Clear;
         IF Trim(edtNomeArquivo.Text) <> '' then
         begin
            qryAux.Sql.Add( ' DELETE' + #13#10 +
                            ' FROM  ARQUIVODERETORNOCAIXA A' + #13#10 +
                            ' WHERE A.IDARQUIVORETORNOCAIXA = '+IntToStr(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger)+' ');
            //if dbrgBusca.ItemIndex > 0 then
            //   qryAux.Sql.Add( ' AND    A.MATRICULA    =  '+QuotedStr(trim(FsBuscaPorMatricula)));

            try
               qryAux.ExecSQL;
            except
               berro := true;
            end;
         end
         else
         begin
            qryAux.Sql.Add( ' DELETE' + #13#10 +
                            ' FROM  ARQUIVODERETORNOCAIXA A' + #13#10 +
                            ' WHERE A.IDARQUIVORETORNOCAIXA = '+IntToStr(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger)+ #13#10 +
                            ' AND   A.IDHSTFOLHABENEF = '+IntToStr(piIdHstFolhaBenef)+' ');
            //if dbrgBusca.ItemIndex > 0 then
            //   qryAux.Sql.Add( ' AND    A.MATRICULA    =  '+QuotedStr(trim(FsBuscaPorMatricula)));

            try
               qryAux.ExecSQL;
            except
               berro := true;
            end;
         end;
      end
      else
      begin  // verificar - mensagem não existe no documento
         IF Trim(edtNomeArquivo.Text) <> '' then
         begin
            MsgDlg('Não é possível desfazer a importação do arquivo pois alguns pagamentos já foram tratados.','Informação',mtInformation,[mbOk],0);
         end
         else
         begin
            MsgDlg('Não é possível desfazer a importação da base de pagamento pois alguns pagamentos já foram tratados.','Informação',mtInformation,[mbOk],0);
         end;
      end;
  { finally
      if not(berro) then
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.Commit;
      end
      else
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao desfazer evento de pagamento de benefícios.','Erro',mtError,[mbOk],0);
      end;
      qryAux.close;
   end;  }

end;

procedure TfrmConciliacaoCredito.SetIdArquivoRetorno(const Value: Longint);
begin
  FIdArquivoRetorno := Value;
end;

procedure TfrmConciliacaoCredito.SetIdSeqRemessa(const Value: Longint);
begin
  FIdSeqRemessa := Value;
end;

procedure TfrmConciliacaoCredito.btnContasReceberClick(Sender: TObject);
var icontador : integer;
begin
   if bControlaTela then
   begin
      if frmLancContasReceber = nil then
         exit
      else
      begin
         frmLancContasReceber.BringToFront;
         exit;
      end;
   end;

   CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
   CdsDadosRetornoCaixa.filtered:=true;
   icontador := 0;

   CdsDadosRetornoCaixa.DisableControls;
   while not(CdsDadosRetornoCaixa.eof) do
   begin
      if (CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 1) then
      begin
         inc(icontador);
      end;
      if icontador > 1 then
         CdsDadosRetornoCaixa.last;
      CdsDadosRetornoCaixa.next;
   end;
   CdsDadosRetornoCaixa.EnableControls;

   if icontador < 1 then
   begin
      MsgDlg('É necessário selecionar pelo menos um assistido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   if icontador > 1 then
   begin
      MsgDlg('É possível lançar um documento apenas para um assistido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   if (ExisteEventoRegularizacaoParaPessoa(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString)) then
   begin
      MsgDlg('Não é possível lançar um documento a receber para um crédito efetuado.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;


   if not(ExisteEventoRegularizacaoCR(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').asString,  IntToStr(IdArquivoRetorno))) then
   begin
      MsgDlg('Para fazer o lançamento do recebimento no Contas a Receber é necessário antes lançar o evento.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   IdArquivoRetornoCaixa := CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger;

   if ExisteDocumentoPagarAberto(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString) then
   begin
      MsgDlg('Não é possível realizar o lançamento do documento.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   IdPessoa     := CdsDadosRetornoCaixa.FieldByName('IDPESSOA').AsInteger;
   IdHstFolha   := StrToInt64(dblVersao.LookupValue);
   CodConvenio  := StrToInt64(dblConvenio.LookupValue);
   rValor       := StrToFloat(trim(CdsDadosRetornoCaixa.FieldByName('VALORPAGAMENTO').AsString));

   if CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger > 0 then
      IdHstFolhaIndiv := CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger
   else
   begin
      SqlCamposIndiv.Prepare;
      SqlCamposIndiv.ParamByName('IDARQUIVORETORNOCAIXA').Asstring  := CdsDadosRetornoCaixa.FieldByName('IDARQUIVORETORNOCAIXA').Asstring;
      SqlCamposIndiv.ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
      SqlCamposIndiv.Open;
      IdHstFolhaIndiv := CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger;
   end;

   frmLancContasReceber := TfrmLancContasReceber.create(application);
   frmLancContasReceber.Show;
   CdsDadosRetornoCaixa.filtered:=false;
   //inherited;
end;

procedure TfrmConciliacaoCredito.spnedAnoExit(Sender: TObject);
begin
   inherited;
   SelecionaVersaoFolha();
end;


function TfrmConciliacaoCredito.VerificaLancDocLancadoHist(piIdHstFolhaBenef : Longint):boolean;
begin
   try
      try
         Result := false;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.Sql.Add( 'SELECT 1' + #13#10 +
                         '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
                         ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
                         '    ON (A.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)' + #13#10 +
                         ' WHERE 0 = 0 ');

         qryAux.Sql.Add( '   AND A.IDARQUIVORETORNOCAIXA = '+IntToStr(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger));
         qryAux.Sql.Add( '   AND H.IDHSTREGULARIZACAOFOLHA = '+IntToStr(CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger));

         qryAux.Sql.Add( '   AND A.IDHSTFOLHABENEF = '+IntToStr(piIdHstFolhaBenef)+ #13#10 +
                         '   AND ((H.CODDOCUMENTOCAP IS NOT NULL) OR (H.CODDOCUMENTOCAR IS NOT NULL))');
         qryAux.Open;

         Result := not(qryAux.IsEmpty);
      except
         qryAux.close;
         Result := true;
      end;
   finally
      qryAux.close;
   end;
end;

function TfrmConciliacaoCredito.VerificaLancDocCapCar(pbArquivo : boolean; piIdHstFolhaBenef, piIdArquivoRetorno, piIdSeqRemessa : Longint):boolean;
begin
   try
      try
         Result := false;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.Sql.Add( 'SELECT 1' + #13#10 +
                         '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
                         ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
                         '    ON (A.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)' + #13#10 +
                         ' WHERE 0 = 0 ');

         qryAux.Sql.Add( '   AND A.IDARQUIVORETORNOCAIXA = '+IntToStr(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger));

         qryAux.Sql.Add( '   AND A.IDHSTFOLHABENEF = '+IntToStr(piIdHstFolhaBenef)+ #13#10 +
                         '   AND ((H.CODDOCUMENTOCAP IS NOT NULL) OR (H.CODDOCUMENTOCAR IS NOT NULL))');
         qryAux.Open;

         Result := not(qryAux.IsEmpty);
      except
         qryAux.close;
         Result := true;
      end;
   finally
      qryAux.close;
   end;
end;

procedure TfrmConciliacaoCredito.ExcluirEvento(piIdHst: Integer);
var berro : boolean;
begin
   try
      berro := false;
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.StartTransaction;
      try
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add( ' DELETE' + #13#10 +
                         '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
                         '  WHERE   H.IDHSTREGULARIZACAOFOLHA = '+IntToStr(piIdHst)+' ');
         qryAux.ExecSQL;
      except
         berro := true;
      end;
   finally
      if not(berro) then
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.Commit;
      end
      else
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao excluir o evento de regularização de pagamento de benefícios.','Erro',mtError,[mbOk],0);
      end;
      qryAux.close;
   end;
end;

procedure TfrmConciliacaoCredito.AlterarEvento(piIdHst: Integer);
var berro : boolean;
    iIdArq : Longint;
begin
   try
      iIdArq :=  CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsInteger;
      berro := false;
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.StartTransaction;
      try
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add( ' UPDATE HSTREGULARIZACAOFOLHA H ' + #13#10 +
                         '  SET H.IDCADEVENTOSDEREGULARIZACAO = '+QryEvento.FieldbyName('IDCADEVENTOSDEREGULARIZACAO').AsString + #13#10 +
                         ' WHERE H.IDHSTREGULARIZACAOFOLHA = '+CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsString+' ');
         qryAux.ExecSQL;
      except
         berro := true;
      end;

      if QryEvento.FieldbyName('CODIGO').AsString <> '00' then
      begin
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add( ' UPDATE ARQUIVODERETORNOCAIXA A SET FLGINCONSISTENCIA = 1 WHERE A.IDARQUIVORETORNOCAIXA = '+CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString);
         try
            qryAux.ExecSQL;
         except
            berro := true;
         end;
      end
      else
      begin
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add( ' UPDATE ARQUIVODERETORNOCAIXA A SET FLGINCONSISTENCIA = 0 WHERE A.IDARQUIVORETORNOCAIXA = '+CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').AsString);
         try
            qryAux.ExecSQL;
         except
            berro := true;
         end;
      end;

   finally
      if not(berro) then
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.Commit;
      end
      else
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Erro ao alterar evento de pagamento de benefícios.','Erro',mtError,[mbOk],0);
      end;

      AtualizaDados(iIdArq);

      qryAux.close;
   end;
end;

procedure TfrmConciliacaoCredito.bbtnOkDetClick(Sender: TObject);
var  iIdPessoa : Longint;
begin
   AlterarEvento(CdsDadosIndividuais.FieldByName('IDHSTREGULARIZACAOFOLHA').AsInteger);
   inherited;

   dbgIndiv.Visible := true;
   Dock973.Visible := true;
   sbtnAltDet.Down := false;
   sbtnExcluiDet.Down := false;
end;

procedure TfrmConciliacaoCredito.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   dbgIndiv.Visible := true;
   Dock973.Visible := true;
   sbtnAltDet.Down := false;
   sbtnExcluiDet.Down := false;
   
end;

procedure TfrmConciliacaoCredito.TbsHistIndivExit(Sender: TObject);
begin
   inherited;
   //CdsDadosRetornoCaixa.filtered:=false;
end;

procedure TfrmConciliacaoCredito.btnProcessarClick(Sender: TObject);
var icontador, idarqretornoSelecionado : Longint;
   sFiltroAnterior: String;
begin
   pgControlDetalhe.ActivePageIndex := 0;
   if not(ValidaInformacoes) then
   begin
      exit;
   end;

   //if bProcessando then
   //   exit;
   try

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add( 'SELECT idcadeventosderegularizacao ID FROM cm.CADASTROEVENTOSDEREGULARIZACAO ');
      qryAux.Sql.Add( ' WHERE flgdesativado =  0  AND codigoretorno = ''00'' ');
      qryAux.Open;
      sCodRetornoCredEfetuado := qryAux.FieldByName('ID').AsString;

      CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
      CdsDadosRetornoCaixa.filtered:=true;
      icontador := 0;
      CdsDadosRetornoCaixa.DisableControls;
      CdsDadosRetornoCaixa.First;
      idarqretornoSelecionado := 0;

      //Darivaldo Alencar SIG69309 -inicio 
      {a ExisteEventoRegularizacao não usa o parametro da varredura, por isso não é necessário varrer}
      //while not(CdsDadosRetornoCaixa.eof) do
      //begin
         if (CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 1) then
         begin
      //      if idarqretornoSelecionado = 0 then
      //      begin
               if (ExisteEventoRegularizacao(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').asString,  IntToStr(IdArquivoRetorno))) then
      //        begin
                  idarqretornoSelecionado := CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').asInteger;
      //        end;
      //      end;
            inc(icontador);
         end;
      //   CdsDadosRetornoCaixa.next;
      //end;
      //Darivaldo Alencar SIG69309 -fim

      if icontador < 1 then
      begin
         MsgDlg('É necessário selecionar pelo menos um assistido.','Informação',mtInformation,[mbOk],0);
         CdsDadosRetornoCaixa.EnableControls;
         CdsDadosRetornoCaixa.filtered:=false;
         exit;
      end;
      if (icontador <= 1) then
      begin
         if (ExisteEventoRegularizacaoParaPessoa(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').asString)) then
         begin
            MsgDlg('Já existe o evento de regularização lançado.','Informação',mtInformation,[mbOk],0);
            CdsDadosRetornoCaixa.filtered:=false;
            CdsDadosRetornoCaixa.EnableControls;
            exit;
         end;
      end;

      if CdsDadosRetornoCaixa.FieldByName('SITPAGAMENTO').asString = '00' then
      begin
         if (idarqretornoSelecionado = 0) then
         begin
            MsgDlg('Para processar a regularização de pagamento é necessario lançar um evento.','Informação',mtInformation,[mbOk],0);
            CdsDadosRetornoCaixa.EnableControls;
            CdsDadosRetornoCaixa.filtered:=false;
            exit;
         end;
      end;

      CdsDadosRetornoCaixa.First;
      icontador := 0;

      //Darivaldo Alencar SIG69309 -inicio
      //if not(dtmBaseDados.dbBaseDados.InTransaction) then   //Darivaldo Alencar SIG69309
      //   dtmBaseDados.dbBaseDados.StartTransaction;         //Darivaldo Alencar SIG69309
      frmAguarde.Pos      := 1;
      frmAguarde.Max      := CdsDadosRetornoCaixa.RecordCount;
      frmAguarde.Mostra('Processando...');
      try
      //Darivaldo Alencar SIG69309 -fim
          while not(CdsDadosRetornoCaixa.eof) do
          begin
             //Darivaldo Alencar SIG69309 -inicio
             sFiltroAnterior:= FiltrarCDS(CdsDadosRetornoCaixa, 'SELECIONAR = 1 AND IDPESSOA IS NOT NULL '+
                                                                ' AND idarquivoretornocaixa <> '+ IntToStr(idarqretornoSelecionado)+
                                                                ' AND SITPAGAMENTO = '+ QuotedStr('00'));
             //if (CdsDadosRetornoCaixa.FieldByName('SELECIONAR').AsInteger = 1) then
             //begin
             //   if CdsDadosRetornoCaixa.FieldByName('SITPAGAMENTO').Asstring = '00' then
             //   begin
             //      if (CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').asInteger <> idarqretornoSelecionado) then
             //      begin
             //Darivaldo Alencar SIG69309 -fim
                     if not(ExisteEventoRegularizacaoParaPessoa(CdsDadosRetornoCaixa.FieldByName('idarquivoretornocaixa').asString)) then
                      begin
                         if InsereHstRegularizacao(idarqretornoSelecionado) then
                            inc(icontador);
                      end;
             //Darivaldo Alencar SIG69309 -inicio
             //      end;
             //   end;
             //end;
             frmAguarde.Pos := frmAguarde.Pos + 1;
             Application.ProcessMessages;
             //Darivaldo Alencar SIG69309 -fim

             CdsDadosRetornoCaixa.next;
          end;
      finally
        frmAguarde.Apaga; //Darivaldo Alencar SIG69309
        CdsDadosRetornoCaixa.EnableControls;
      end;

      //inherited;
      if icontador = 0 then
      begin
         MsgDlg('Não foi encontrado nenhum registro para processamento.','Informação',mtInformation,[mbOk],0);
      end
      else
      begin
         if (dtmBaseDados.dbBaseDados.InTransaction) then
             dtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Processo concluido com sucesso.','Informação',mtInformation,[mbOk],0);
      end;

      CdsDadosRetornoCaixa.filtered:=false;
   finally

   end;
end;

procedure TfrmConciliacaoCredito.dbgArquivoRetornoTitleClick(
  Column: TColumn);
begin
  inherited;
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
  if Column.FieldName = 'SELECIONAR' then
  begin
     CdsDadosRetornoCaixa.first;
     while not(CdsDadosRetornoCaixa.eof) do
     begin
        CdsDadosRetornoCaixa.Edit;
        CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring := Iff(CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring = '0','1','0');
        CdsDadosRetornoCaixa.next;
     end;
     //CdsDadosRetornoCaixa.post;
     CdsDadosRetornoCaixa.first;
  end;
end;

procedure TfrmConciliacaoCredito.btnSelTudoClick(Sender: TObject);
var
  th:TGridProgresso;
  sFiltroAnt: String;
begin
  {Transferido código para dentro da thread - Darivaldo Alencar SIG69309}
  try
     sFiltroAnt:= FiltrarCDS(CdsDadosRetornoCaixa,'SELECIONAR = 0');
     th:= TGridProgresso.create(false,CdsDadosRetornoCaixa,1);
  finally
     FiltrarCDS(CdsDadosRetornoCaixa,sFiltroAnt);
  end;
end;

procedure TfrmConciliacaoCredito.btnInverteClick(Sender: TObject);
var
 th: TGridProgresso;
 sFiltroAnt: String;
begin
  {Transferido código para dentro da thread - Darivaldo Alencar SIG69309}
   try
     sFiltroAnt:= FiltrarCDS(CdsDadosRetornoCaixa,'SELECIONAR = 1'); 
     th:= TGridProgresso.create(false,CdsDadosRetornoCaixa,2);
   finally
     FiltrarCDS(CdsDadosRetornoCaixa,sFiltroAnt);
   end;
end;

procedure TfrmConciliacaoCredito.MontaTrailler(pLinha: string);
begin
   DadosTraillerArquivo[0].Codigoregistro       := copy(pLinha,1,1);    //Código do registro = "Z"
   DadosTraillerArquivo[0].TotRegistroArq       := copy(pLinha,2,6);    //Total de registro do arquivo
   DadosTraillerArquivo[0].ConterZeros          := copy(pLinha,8,17);   //Deverá conter 0 (zeros)
   DadosTraillerArquivo[0].ValorTotalRegistros  := copy(pLinha,25,17);  //Valor total dos registros do arquivo/crédito
   DadosTraillerArquivo[0].ReservaFuturo        := copy(pLinha,42,109); //Reservado para o futuro (filter)

end;

Function TfrmConciliacaoCredito.MontaRetornoArquivo(pLinha: string; piContaRegistros: Longint): boolean;
var iFlgInconsistencia : Integer;
   sDataPagfora, sIdPessoaeIdTitular : string;
   bPessoaArquivoImportado : Boolean;
begin                                                      
   result:= false;
   bPessoaArquivoImportado :=  false;
   DadosRetornoArquivo[piContaRegistros].Codigoregistro     := copy(pLinha,1,1);  //Código do registro = "F".
   DadosRetornoArquivo[piContaRegistros].IdClienteEmpresa   := copy(pLinha,2,25); //- Identificação do cliente na empresa Idem Campo E02.
   DadosRetornoArquivo[piContaRegistros].AgenciaCredito     := copy(pLinha,27,4); // Agência para crédito. Identificação da agência no banco onde será efetuado o crédito automático.
   DadosRetornoArquivo[piContaRegistros].IdClienteBanco     := copy(pLinha,31,14);// - Identificação do cliente no banco. Idem campo E04.
   DadosRetornoArquivo[piContaRegistros].DataCredito        := copy(pLinha,45,8); // Data do crédito (AAAAMMDD). Deverá conter a data em que deverá ser efetuado o crédito em conta corrente.
   DadosRetornoArquivo[piContaRegistros].ValorCredito       := copy(pLinha,53,15);//Valor do crédito. Deverá conter o valor a ser creditado em conta corrente.

   dTotalValor :=  strtofloat(formatfloat('#0.00', Strtofloat(DadosRetornoArquivo[piContaRegistros].ValorCredito)))/100;


   DadosRetornoArquivo[piContaRegistros].CodigoRetorno      := copy(pLinha,148,2); //  Código de retorno.
                                                                                 //  "00" - Crédito efetuado.
                                                                                 //  "02" - Crédito não efetuado - Conta corrente não cadastrada.
                                                                                 //  "06" - Crédito não efetuado - CPF/CNPJ da Fonte Pagadora diferente do cadastrado.
                                                                                 //  "15" - Crédito não efetuado - Conta inválida.
                                                                                 //  "19" - Crédito não efetuado - Agência/conta não pertence ao CPF/CNPJ informado.
                                                                                 //  "97" - Cancelamento - Não encontrado.
                                                                                 //  "98" - Cancelamento - Não efetuado, fora do tempo hábil.
                                                                                 //  "99" - Cancelamento - Cancelado conforme solicitação.

   DadosRetornoArquivo[piContaRegistros].UsoEmpresa         := copy(pLinha,70,60);// Uso da empresa. Esta informação não será tratada pelo Banco. Será retornada para a empresa, com o mesmo conteúdo enviado.

   DadosRetornoArquivo[piContaRegistros].ReservaFuturo      := copy(pLinha,130,18);// Reservado para o futuro (filter).
   DadosRetornoArquivo[piContaRegistros].CodigoRetorno2     := copy(pLinha,148,2);// Será retornada a mesma informação do campo F.07.
   DadosRetornoArquivo[piContaRegistros].CodigoMovimento    := copy(pLinha,150,1);// Código do movimento. Será retornada a mesma informação recepcionada no registro "E".

   // Observação: Para os convênios que utilizarão a versão "05" do layout, os campos a partir de F.09 serão retornados conforme abaixo:
   if DadosHeaderArquivo[0].Versaolayout = '05' then
   begin
      DadosRetornoArquivo[piContaRegistros].ReservaFuturo      := copy(pLinha,130,1);// Tipo da Identificação - O conteúdo será idêntico ao anteriormente enviado pela empresa no registro E.09.
      DadosRetornoArquivo[piContaRegistros].CodigoRetorno2     := copy(pLinha,131,15);// Identificação - O conteúdo será idêntico ao anteriormente enviado pela empresa no registro E.10.
      DadosRetornoArquivo[piContaRegistros].ReservaFuturo      := copy(pLinha,146,4);// Reservado para o futuro (filter).
      DadosRetornoArquivo[piContaRegistros].CodigoMovimento    := copy(pLinha,150,1);// Código do movimento - Será retornado a mesma informação recepcionada no registro "E".
   end;

   if (copy(DadosRetornoArquivo[piContaRegistros].DataCredito,1,6) <> qryVersaoFolha.FieldByName('ANOMES').AsString) then
   begin
      MsgDlg('O Arquivo não é do ano e mês selecionado.','Informação',mtInformation,[mbOk],0);
      result:= true;
      exit;
   end;

   sIdPessoaeIdTitular := copy(pLinha,70,19);
   sIdPessoaeIdTitular := TrimLeft(sIdPessoaeIdTitular);
   sIdPessoaeIdTitular := StringReplace(sIdPessoaeIdTitular, ' ', ',',[rfReplaceAll, rfIgnoreCase]);


   QryBasePagamento.Close;
   QryBasePagamento.ParamByName('TITULARPESSOA').AsString := sIdPessoaeIdTitular;
   QryBasePagamento.ParamByName('CODPORTADORFORMA').AsString := dblConvenio.LookupValue;
   QryBasePagamento.ParamByName('IDHSTFOLHABENEF').AsString := dblVersao.LookupValue  ;
   QryBasePagamento.Open;

   if DadosRetornoArquivo[piContaRegistros].CodigoRetorno = '00' then
      iFlgInconsistencia := 0
   else
      iFlgInconsistencia := 1;

   if (bArquivoImportado) then
   begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT 1 ' + #13#10 +
                     '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                     ' WHERE  A.MATRICULA       =  '+QuotedStr(trim(DadosRetornoArquivo[piContaRegistros].IdClienteEmpresa))+ #13#10 +
                     ' AND    A.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
      qryAux.Open;
      bPessoaArquivoImportado := (qryAux.RecordCount > 0);
   end;

   if not(bPessoaArquivoImportado) then
   begin
      if (QryBasePagamento.FieldByName('IDTITULAR').AsInteger > 0) then
      begin

         if not(InsereArquivoRetorno(IdArquivoRetorno,
                                 QryBasePagamento.FieldByName('IDBASEPGTO').AsInteger,
                                 StrToInt(dblVersao.LookupValue),
                                 QryBasePagamento.FieldByName('IDPESSOA').AsInteger,
                                 QryBasePagamento.FieldByName('IDTITULAR').AsInteger,
                                 DadosRetornoArquivo[piContaRegistros].IdClienteEmpresa,
                                 QryBasePagamento.FieldByName('NUMDOCUMENTO').AsString,
                                 copy(pLinha,90,40),
                                 DadosHeaderArquivo[0].CodigoBanco,
                                 DadosRetornoArquivo[piContaRegistros].AgenciaCredito,
                                 DadosRetornoArquivo[piContaRegistros].IdClienteBanco,
                                 OraNumero(Floattostr(dTotalValor)),
                                 DadosRetornoArquivo[piContaRegistros].DataCredito,
                                 iFlgInconsistencia,
                                 IdSeqRemessa,
                                 DadosRetornoArquivo[piContaRegistros].CodigoRetorno
                                )) then
         begin
            result := false;
         end
         else
         begin
            result := true;
         end;
      end
      else
      begin

         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add('  select d.idpessoa, d.idtitular, p.numdocumento from depentit d inner join pessoa p on (d.idpessoa = p.idpessoa) ' + #13#10 +
//                        '  where matricula = '+QuotedStr(trim(DadosRetornoArquivo[piContaRegistros].IdClienteEmpresa))); //Everson TIBERO
                        '  where d.matricula = '+QuotedStr(trim(DadosRetornoArquivo[piContaRegistros].IdClienteEmpresa))); //Everson TIBERO
         qryAux.Open;

         if not(InsereArquivoRetorno(IdArquivoRetorno,
                                 0,
                                 StrToInt(dblVersao.LookupValue),
                                 qryAux.FieldByName('IDPESSOA').AsInteger,
                                 qryAux.FieldByName('IDTITULAR').AsInteger,
                                 DadosRetornoArquivo[piContaRegistros].IdClienteEmpresa,
                                 qryAux.FieldByName('NUMDOCUMENTO').AsString,
                                 copy(pLinha,90,40),
                                 DadosHeaderArquivo[0].CodigoBanco,
                                 DadosRetornoArquivo[piContaRegistros].AgenciaCredito,
                                 DadosRetornoArquivo[piContaRegistros].IdClienteBanco,
                                 OraNumero(Floattostr(dTotalValor)),
                                 DadosRetornoArquivo[piContaRegistros].DataCredito,
                                 iFlgInconsistencia,
                                 IdSeqRemessa,
                                 DadosRetornoArquivo[piContaRegistros].CodigoRetorno
                                )) then
         begin
            result := false;
         end
         else
         begin
            result := true;
         end;

         //sDataPagfora := copy(DadosRetornoArquivo[piContaRegistros].DataCredito,7,2)+'/'+copy(DadosRetornoArquivo[piContaRegistros].DataCredito,5,2)+'/'+copy(DadosRetornoArquivo[piContaRegistros].DataCredito,1,4);
         //ListaPessoaFora.Add(OraNumero(Floattostr(dTotalValor))+';'+sDataPagfora)
      end;
   end;

end;

Function TfrmConciliacaoCredito.MontaHeader(pLinha :string): boolean;
begin
   Result := false;
   DadosHeaderArquivo[0].Codigoregistro  := copy(pLinha,1,1);    // Código do Registro = "A". Registro Header. Obrigatório em todos os arquivos.
   DadosHeaderArquivo[0].CodigoRemessa   := copy(pLinha,2,1);    // "1" - REMESSA - Enviado pela Empresa para o Banco. "2" - REMESSA - Enviado pelo Banco para a Empresa.
   DadosHeaderArquivo[0].CodigoConvenio  := copy(pLinha,3,20);   //- Código do Convênio - Informado pelo Banco - preencher. Pos 3 a 8 = código do convênio. Pos 9 a 22 = brancos.
   DadosHeaderArquivo[0].NomeEmpresa     := copy(pLinha,23,20);  //Nome da Empresa.
   DadosHeaderArquivo[0].CodigoBanco     := copy(pLinha,43,3);  //Código do Banco na Câmara de Compensação, Caixa = "104".
   DadosHeaderArquivo[0].NomeBanco       := copy(pLinha,46,20);  //Nome do Banco.
   DadosHeaderArquivo[0].DataGeraArquivo := copy(pLinha,66,8);  //Data da geração do arquivo (AAAAMMDD).
   DadosHeaderArquivo[0].NumSeqArquivo   := copy(pLinha,74,6);  //Número sequencial do arquivo (NSA),
   DadosHeaderArquivo[0].Versaolayout    := copy(pLinha,80,2);  //"04" - Versão válida a partir de 01/07/1998. "05" - Versão válida a partir de 02/05/2007.
   DadosHeaderArquivo[0].IdServico       := copy(pLinha,82,17);  //Deverá conter "FOLHA DE PAGAMENTO".
   DadosHeaderArquivo[0].ReservaFuturo   := copy(pLinha,99,52); //Reservado para o futuro (filter).

   IdSeqRemessa     := StrToInt(DadosHeaderArquivo[0].CodigoRemessa);
   IdArquivoRetorno := StrToInt(DadosHeaderArquivo[0].NumSeqArquivo);

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add( ' SELECT count(1) AS QTDE  FROM ARQUIVODERETORNOCAIXA A WHERE A.CODARQUIVORETORNOCAIXA = '+IntToStr(IdArquivoRetorno)+' AND A.SEQREMESSA = '+IntToStr(IdSeqRemessa));
   qryAux.Open;
   bSomenteDadosArquivo := false;
   if qryAux.FieldByName('QTDE').AsInteger > 0 then
   begin
      bSomenteDadosArquivo := true;
      MsgDlg('O arquivo de retorno financeiro já foi importado. Para reimportar é necessário desfazer a importação.','Informação',mtInformation,[mbOk],0);
      exit;
   end;
   Result := true;
end;

function TfrmConciliacaoCredito.retornaCPF(PsIdPessoa: string): string;
begin
   try
      Result := '';
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add( ' SELECT BA.NUMDOCUMENTO AS CPF, BA.VLRLIQUIDO FROM BASEDEPAGAMENTO BA WHERE BA.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
      qryAux.Sql.Add( ' AND   BA.FLGEFETIVADO = 1  AND  BA.IDPESSOA = '+PsIdPessoa);
      qryAux.Open;

      dTotalValor := qryAux.FieldByName('VLRLIQUIDO').AsFloat;

      Result := qryAux.FieldByName('CPF').AsString;
   finally
      qryAux.close;
   end;
end;

function TfrmConciliacaoCredito.retornaDescRetorno(
  psCodRetorno: string): string;
begin
   Result :='';
   Case StrToInt(psCodRetorno) of
     0  : Result :='CRÉDITO EFETUADO';
     2  : Result :='CRÉDITO NÃO EFETUADO - CONTA CORRENTE NÃO CADASTRADA';
     6  : Result :='CRÉDITO NÃO EFETUADO - CPF/CNPJ DA FONTE PAGADORA DIFERENTE DO CADASTRADO';
     15 : Result :='CRÉDITO NÃO EFETUADO - CONTA INVÁLIDA';
     19 : Result :='CRÉDITO NÃO EFETUADO - AGÊNCIA/CONTA NÃO PERTENCE AO CPF/CNPJ INFORMADO';
     97 : Result :='CANCELAMENTO - NÃO ENCONTRADO';
     98 : Result :='CANCELAMENTO - NÃO EFETUADO, FORA DO TEMPO HÁBIL';
     99 : Result :='CANCELAMENTO - CANCELADO CONFORME SOLICITAÇÃO';
     else Result :='OUTROS';
   end;
end;

procedure TfrmConciliacaoCredito.BtnConsistenciaClick(Sender: TObject);
var icontador : integer;
    sSql : string;
begin
   inherited;
   sNomeRelatorio := 'Relatório de Consistencias';

   sSql := 'SELECT DISTINCT COUNT(1) OVER() AS QTDE, SUM(B.VLRLIQUIDO) OVER() VALORTOTAL, B.MATRICULA, B.NUMDOCUMENTO, B.VLRLIQUIDO, ''CRÉDITO'' AS TIPOOPERACAO,' + #13#10 +
           '       A.DATAPAGAMENTO, P.DESCRICAO, C.DESCRICAOEVENTO, COUNT(1) OVER() AS QTDEMENSAGEM, B.Codportforma, ' + #13#10 +
           '       B.NUMBANCO, B.NUMAGENCIA, B.CONTACORRENTE ' + #13#10 +
           '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
           ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
           '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
           ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
           '    ON (B.IDBASEPGTO = A.IDBASEPGTO AND' + #13#10 +
           '       B.IDHSTFOLHABENEF = A.IDHSTFOLHABENEF)' + #13#10 +
           ' INNER JOIN PORTADORFORMA P' + #13#10 +
           '    ON (P.CODPORTFORMA = B.CODPORTFORMA)' + #13#10 +
           ' INNER JOIN CADASTROEVENTOSDEREGULARIZACAO C' + #13#10 +
           '    ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +
           ' WHERE A.FLGINCONSISTENCIA = 0 ' + #13#10 +
           ' AND B.IDHSTFOLHABENEF = ' + dblVersao.LookupValue + #13#10 +
           ' AND  H.IDHSTREGULARIZACAOFOLHA = (SELECT MAX (IDHSTREGULARIZACAOFOLHA)' + #13#10 +
           '                                  FROM  HSTREGULARIZACAOFOLHA HST ' + #13#10 +
           '                                  where HST.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)' + #13#10 +
           ' Order By  B.Codportforma, B.NUMDOCUMENTO  ';

   sqlRelatorios.close;
   sqlRelatorios.Sql.clear;
   sqlRelatorios.Sql.Add(sSql);
   sqlRelatorios.Open;

   if sqlRelatorios.RecordCount <= 0 then
   begin
      MsgDlg('Não há registros para ser exibido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   rpRelatorios.DeviceType       := 'Screen';
   rpRelatorios.print;

end;

procedure TfrmConciliacaoCredito.BtnInConsistenciaClick(Sender: TObject);
var icontador : integer;
    sSql : string;
begin

   inherited;
   sNomeRelatorio := 'Relatório de Inconsistencias';

   sSql := 'SELECT DISTINCT COUNT(1) OVER() AS QTDE, SUM(B.VLRLIQUIDO) OVER() VALORTOTAL, B.MATRICULA, B.NUMDOCUMENTO, B.VLRLIQUIDO, ''CRÉDITO'' AS TIPOOPERACAO,' + #13#10 +
           '       A.DATAPAGAMENTO, P.DESCRICAO, C.DESCRICAOEVENTO, tmp.QTDE AS QTDEMENSAGEM, B.Codportforma,' + #13#10 +
           '       B.NUMBANCO, B.NUMAGENCIA, B.CONTACORRENTE' + #13#10 +
           '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
           ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
           '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
           ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
           '    ON (B.IDBASEPGTO = A.IDBASEPGTO AND' + #13#10 +
           '       B.IDHSTFOLHABENEF = A.IDHSTFOLHABENEF)' + #13#10 +
           ' INNER JOIN PORTADORFORMA P' + #13#10 +
           '    ON (P.CODPORTFORMA = B.CODPORTFORMA)' + #13#10 +
           ' INNER JOIN CADASTROEVENTOSDEREGULARIZACAO C' + #13#10 +
           '    ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +

           ' inner join (' + #13#10 +
//           'SELECT Count(1)QTDE, IDCADEVENTOSDEREGULARIZACAO' + #13#10 + //Everson TIBERO
           'SELECT Count(1)QTDE, H.IDCADEVENTOSDEREGULARIZACAO' + #13#10 + //Everson TIBERO
           '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
           ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
           '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
           ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
           '    ON (B.IDBASEPGTO = A.IDBASEPGTO AND' + #13#10 +
           '       B.IDHSTFOLHABENEF = A.IDHSTFOLHABENEF)' + #13#10 +
           ' INNER JOIN PORTADORFORMA P' + #13#10 +
           '    ON (P.CODPORTFORMA = B.CODPORTFORMA)' + #13#10 +
           ' INNER JOIN CADASTROEVENTOSDEREGULARIZACAO C' + #13#10 +
           '    ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +
           ' WHERE A.FLGINCONSISTENCIA = 1' + #13#10 +
           ' AND B.IDHSTFOLHABENEF =  ' + dblVersao.LookupValue + #13#10 +
           ' AND  H.IDHSTREGULARIZACAOFOLHA = (SELECT MAX (IDHSTREGULARIZACAOFOLHA)' + #13#10 +
           '                                  FROM  HSTREGULARIZACAOFOLHA HST' + #13#10 +
           '                                  where HST.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)' + #13#10 +
//           'group by IDCADEVENTOSDEREGULARIZACAO) tmp on (tmp.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +//Everson TIBERO
           'group by H.IDCADEVENTOSDEREGULARIZACAO) tmp on (tmp.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +//Everson TIBERO

           ' WHERE A.FLGINCONSISTENCIA = 1 ' + #13#10 +
           ' AND B.IDHSTFOLHABENEF = ' + dblVersao.LookupValue + #13#10 +
           ' AND  H.IDHSTREGULARIZACAOFOLHA = (SELECT MAX (IDHSTREGULARIZACAOFOLHA)' + #13#10 +
           '                                  FROM  HSTREGULARIZACAOFOLHA HST' + #13#10 +
           '                                  where HST.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)'+ #13#10 +
           ' Order By  B.Codportforma, B.NUMDOCUMENTO  ';




   sqlRelatorios.close;
   sqlRelatorios.Sql.clear;
   sqlRelatorios.Sql.Add(sSql);
   sqlRelatorios.Open;

   if sqlRelatorios.RecordCount <= 0 then
   begin
      MsgDlg('Não há registros para ser exibido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;


   rpRelatorios.DeviceType       := 'Screen';
   rpRelatorios.print;


end;

procedure TfrmConciliacaoCredito.BtnPendenciasClick(Sender: TObject);
var icontador : integer;
    sSql : string;
begin
   //if bProcessando then
   //   exit;
   inherited;
   sNomeRelatorio := 'Relatório de Pendências';

   sSql := 'SELECT COUNT(1) OVER () AS QTDE, SUM(TMP3.VALORTOTAL) OVER () AS VALORTOTAL , TMP3.MATRICULA, TMP3.NUMDOCUMENTO, TMP3.VLRLIQUIDO, TMP3.TIPOOPERACAO,' + #13#10 +
           '       TMP3.DATAPAGAMENTO, TMP3.DESCRICAO, TMP3.DESCRICAOEVENTO, TMP3.QTDEMENSAGEM, TMP3.Codportforma, ' + #13#10 +
           '       TMP3.NUMBANCO, TMP3.NUMAGENCIA, TMP3.CONTACORRENTE, TMP3.IDCADEVENTOSDEREGULARIZACAO' + #13#10 +
           'FROM (' + #13#10 +
           'SELECT TMP2.QTDE, TMP2.VALORTOTAL AS VALORTOTAL , TMP2.MATRICULA, TMP2.NUMDOCUMENTO, TMP2.VLRLIQUIDO, TMP2.TIPOOPERACAO,' + #13#10 +
           '       TMP2.DATAPAGAMENTO, TMP2.DESCRICAO, TMP2.DESCRICAOEVENTO, Etmp.QTDE AS QTDEMENSAGEM, TMP2.Codportforma, ' + #13#10 +
           '       TMP2.NUMBANCO, TMP2.NUMAGENCIA, TMP2.CONTACORRENTE, TMP2.IDCADEVENTOSDEREGULARIZACAO' + #13#10 +
           'FROM (' + #13#10 +
           'SELECT COUNT(1) OVER () AS QTDE, TMP1.VLRLIQUIDO VALORTOTAL, TMP1.MATRICULA, TMP1.NUMDOCUMENTO, TMP1.VLRLIQUIDO, TMP1.TIPOOPERACAO,' + #13#10 +
           '       TMP1.DATAPAGAMENTO, TMP1.DESCRICAO, TMP1.DESCRICAOEVENTO, TMP1.QTDEMENSAGEM, TMP1.Codportforma, ' + #13#10 +
           '       TMP1.NUMBANCO, TMP1.NUMAGENCIA, TMP1.CONTACORRENTE, TMP1.IDCADEVENTOSDEREGULARIZACAO' + #13#10 +
           '' + #13#10 +
           'FROM (' + #13#10 +
           'SELECT 1 AS QTDE, (B.VLRLIQUIDO) VALORTOTAL, B.MATRICULA, B.NUMDOCUMENTO, B.VLRLIQUIDO, ''CRÉDITO'' AS TIPOOPERACAO,' + #13#10 +
           '       A.DATAPAGAMENTO, P.DESCRICAO, C.DESCRICAOEVENTO, 1 AS QTDEMENSAGEM,  B.Codportforma, ' + #13#10 +
           '       B.NUMBANCO, B.NUMAGENCIA, B.CONTACORRENTE, C.IDCADEVENTOSDEREGULARIZACAO' + #13#10 +
           '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
           ' INNER JOIN HSTREGULARIZACAOFOLHA H' + #13#10 +
           '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
           ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
           '    ON (B.IDBASEPGTO = A.IDBASEPGTO AND' + #13#10 +
           '       B.IDHSTFOLHABENEF = A.IDHSTFOLHABENEF)' + #13#10 +
           ' INNER JOIN PORTADORFORMA P' + #13#10 +
           '    ON (P.CODPORTFORMA = B.CODPORTFORMA)' + #13#10 +
           ' INNER JOIN CADASTROEVENTOSDEREGULARIZACAO C' + #13#10 +
           '    ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +
             
           ' WHERE B.IDHSTFOLHABENEF = ' + dblVersao.LookupValue + #13#10 +
           ' AND H.NODOCUMENTOCAP IS NULL  AND H.CODDOCUMENTOCAP IS NULL' + #13#10 +
           ' AND H.NODOCUMENTOCAR IS NULL  AND H.CODDOCUMENTOCAR IS NULL' + #13#10 +
           ' AND H.IDHSTREGULARIZACAOFOLHA = (SELECT MAX (IDHSTREGULARIZACAOFOLHA)' + #13#10 +
           '                                   FROM  HSTREGULARIZACAOFOLHA HST' + #13#10 +
           '                                   where HST.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)' + #13#10 +
           '' + #13#10 +
           '  UNION ALL' + #13#10 +
           '' + #13#10 +
           'SELECT 1 QTDE, (B.VLRLIQUIDO) VALORTOTAL, B.MATRICULA, B.NUMDOCUMENTO, B.VLRLIQUIDO, ''CRÉDITO'' AS TIPOOPERACAO,' + #13#10 +
           '       A.DATAPAGAMENTO, P.DESCRICAO, C.DESCRICAOEVENTO, 1 AS QTDEMENSAGEM, B.Codportforma, ' + #13#10 +
           '       B.NUMBANCO, B.NUMAGENCIA, B.CONTACORRENTE, C.IDCADEVENTOSDEREGULARIZACAO' + #13#10 +
           '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
           ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
           '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
           ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
           '    ON (B.IDBASEPGTO = A.IDBASEPGTO AND' + #13#10 +
           '       B.IDHSTFOLHABENEF = A.IDHSTFOLHABENEF)' + #13#10 +
           ' INNER JOIN PORTADORFORMA P' + #13#10 +
           '    ON (P.CODPORTFORMA = B.CODPORTFORMA)' + #13#10 +
           ' INNER JOIN CADASTROEVENTOSDEREGULARIZACAO C' + #13#10 +
           '    ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +
     
           ' WHERE B.IDHSTFOLHABENEF = ' + dblVersao.LookupValue + #13#10 +
           ' AND H.NODOCUMENTOCAP IS NULL  AND H.CODDOCUMENTOCAP IS NULL' + #13#10 +
           ' AND H.NODOCUMENTOCAR IS NOT  NULL   AND H.CODDOCUMENTOCAR IS NOT  NULL' + #13#10 +
           ' AND H.IDHSTREGULARIZACAOFOLHA = (SELECT MAX (IDHSTREGULARIZACAOFOLHA)' + #13#10 +
           '                                   FROM  HSTREGULARIZACAOFOLHA HST' + #13#10 +
           '                                   where HST.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)' + #13#10 +
           '     ) TMP1 ) TMP2' + #13#10 +
           '' + #13#10 +
           '  left outer join (' + #13#10 +
//           '  SELECT Count(1)QTDE, IDCADEVENTOSDEREGULARIZACAO' + #13#10 + //Everson TIBERO
           '  SELECT Count(1)QTDE, H.IDCADEVENTOSDEREGULARIZACAO' + #13#10 + //Everson TIBERO
           '    FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
           '   INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
           '      ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
           '   INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
           '      ON (B.IDBASEPGTO = A.IDBASEPGTO AND' + #13#10 +
           '         B.IDHSTFOLHABENEF = A.IDHSTFOLHABENEF)' + #13#10 +
           '   INNER JOIN PORTADORFORMA P' + #13#10 +
           '      ON (P.CODPORTFORMA = B.CODPORTFORMA)' + #13#10 +
           '   INNER JOIN CADASTROEVENTOSDEREGULARIZACAO C' + #13#10 +
           '      ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +
  
           '   WHERE B.IDHSTFOLHABENEF =  ' + dblVersao.LookupValue + #13#10 +
           '   AND  H.IDHSTREGULARIZACAOFOLHA = (SELECT MAX (IDHSTREGULARIZACAOFOLHA)' + #13#10 +
           '                                    FROM  HSTREGULARIZACAOFOLHA HST' + #13#10 +
           '                                    where HST.IDARQUIVORETORNOCAIXA = H.IDARQUIVORETORNOCAIXA)' + #13#10 +
           '' + #13#10 +
//           '  group by IDCADEVENTOSDEREGULARIZACAO) Etmp on (Etmp.IDCADEVENTOSDEREGULARIZACAO = TMP2.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 + //Everson TIBERO
           '  group by H.IDCADEVENTOSDEREGULARIZACAO) Etmp on (Etmp.IDCADEVENTOSDEREGULARIZACAO = TMP2.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 + //Everson TIBERO
           '' + #13#10 +
           '  UNION ALL' + #13#10 +
           '' + #13#10 +
           'SELECT COUNT(1) OVER() AS QTDE, B.VLRLIQUIDO VALORTOTAL, B.MATRICULA, B.NUMDOCUMENTO, B.VLRLIQUIDO, ''CRÉDITO'' AS TIPOOPERACAO,' + #13#10 +
           '       A.DATAPAGAMENTO, P.DESCRICAO, ''Não existe Evento lançado'' AS DESCRICAOEVENTO, COUNT(1) OVER()  AS QTDEMENSAGEM, B.Codportforma, ' + #13#10 +
           '       B.NUMBANCO, B.NUMAGENCIA, B.CONTACORRENTE, 0 AS IDCADEVENTOSDEREGULARIZACAO' + #13#10 +
           '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
           ' left outer JOIN HSTREGULARIZACAOFOLHA H' + #13#10 +
           '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
           ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
           '    ON (B.IDBASEPGTO = A.IDBASEPGTO AND' + #13#10 +
           '       B.IDHSTFOLHABENEF = A.IDHSTFOLHABENEF)' + #13#10 +
      
           ' INNER JOIN PORTADORFORMA P' + #13#10 +
           '    ON (P.CODPORTFORMA = B.CODPORTFORMA)' + #13#10 +
           ' WHERE B.IDHSTFOLHABENEF = ' + dblVersao.LookupValue + #13#10 +
           ' AND NOT EXISTS (SELECT 1 from HSTREGULARIZACAOFOLHA H1' + #13#10 +
           '                 where H1.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)  ) TMP3 '+ #13#10 +
           ' Order By  TMP3.Codportforma, TMP3.NUMDOCUMENTO  ';

   sqlRelatorios.close;
   sqlRelatorios.Sql.clear;
   sqlRelatorios.Sql.Add(sSql);
   sqlRelatorios.Open;

   if sqlRelatorios.RecordCount <= 0 then
   begin
      MsgDlg('Não há registros para ser exibido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   rpRelatorios.DeviceType       := 'Screen';
   rpRelatorios.print;

end;

procedure TfrmConciliacaoCredito.BtnInconsArqClick(Sender: TObject);
var icontador : integer;
    sSql : string;
begin
   //if bProcessando then
   //   exit;
   inherited;
   sNomeRelatorio := 'Relatório de Inconsistencias do Arquivo';

   sSql :=  'SELECT DISTINCT COUNT(1) OVER() AS QTDE,' + #13#10 +
            '                SUM(AC.VALORPAGAMENTO) OVER() VALORTOTAL,' + #13#10 +
            '                AC.IDPESSOA,' + #13#10 +
            '                AC.IDTITULAR,' + #13#10 +
            '                AC.MATRICULA,' + #13#10 +
            '                AC.CPF AS NUMDOCUMENTO,' + #13#10 +
            '                AC.VALORPAGAMENTO AS VLRLIQUIDO,' + #13#10 +
            '                ''CRÉDITO'' AS TIPOOPERACAO,' + #13#10 +
            '                AC.DATAPAGAMENTO,' + #13#10 +
            '                '' '' AS DESCRICAO,' + #13#10 +
            '                '' '' AS DESCRICAOEVENTO,' + #13#10 +
            '                0 AS QTDEMENSAGEM,' + #13#10 +
            '                AC.BANCO AS NUMBANCO,' + #13#10 +
            '                AC.AGENCIABANCARIA AS NUMAGENCIA,' + #13#10 +
            '                AC.CONTABANCARIA AS CONTACORRENTE' + #13#10 +
            '  FROM ARQUIVODERETORNOCAIXA AC' + #13#10 +
            ' WHERE AC.IDHSTFOLHABENEF = ' + dblVersao.LookupValue + #13#10 +
            '   AND NOT EXISTS (SELECT 1' + #13#10 +
            '          FROM BASEDEPAGAMENTO B' + #13#10 +
            '         WHERE B.IDHSTFOLHABENEF = AC.IDHSTFOLHABENEF AND  AC.IDPESSOA = B.IDPESSOA and AC.IDTITULAR = B.IDTITULAR and AC.IDBASEPGTO = B.IDBASEPGTO )'+ #13#10 +
            ' ORDER BY AC.CPF ';


   sqlRelatorios.close;
   sqlRelatorios.Sql.clear;
   sqlRelatorios.Sql.Add(sSql);
   sqlRelatorios.Open;

   if sqlRelatorios.RecordCount <= 0 then
   begin
      MsgDlg('Não há registros para ser exibido.','Informação',mtInformation,[mbOk],0);
      CdsDadosRetornoCaixa.filtered:=false;
      exit;
   end;

   rpRelatorios.DeviceType       := 'Screen';
   rpRelatorios.print;


end;

procedure TfrmConciliacaoCredito.bbtnCancelarClick(Sender: TObject);
begin
  //if bProcessando then
  //   Encerra;
  btnInverte.Enabled := false;
  btnSelTudo.Enabled := false;
  //qryVersaoFolha.close;
  //qryConvenio.close;
  edtNomeArquivo.text := '';
  cmbMes.ItemIndex := 0;
  ComboBox1.text := '';
  dblVersao.text := '';
  dblConvenio.Text := '';
  if (CdsDadosIndividuais.active) then
     CdsDadosIndividuais.close;
  if (CdsDadosRetornoCaixa.active) then
     CdsDadosRetornoCaixa.close;
    inherited;
  pgControlDetalhe.ActivePageIndex := 0;

   ObtemPermissaoBotaoCarregarATela;

   btnEventos.Enabled        := false ;
   btnContasReceber.Enabled  := false ;
   btnContasPagar.Enabled    := false;
   BtnConsistencia.Enabled   := false ;
   BtnInConsistencia.Enabled := false ;
   BtnPendencias.Enabled     := false ;
   BtnInconsArq.Enabled      := false ;
   btnProcessar.Enabled      := false ;
   bbtnDesfazer.Enabled      := false ;
end;

procedure TfrmConciliacaoCredito.dbgArquivoRetornoTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
  if AFieldName = 'SELECIONAR' then
  begin
     CdsDadosRetornoCaixa.first;
     while not(CdsDadosRetornoCaixa.eof) do
     begin
        CdsDadosRetornoCaixa.Edit;
        CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring := Iff(CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring = '0','1','0');
        CdsDadosRetornoCaixa.next;
     end;
     //CdsDadosRetornoCaixa.post;
     CdsDadosRetornoCaixa.first;
  end;
end;

procedure TfrmConciliacaoCredito.TbsHistIndivEnter(Sender: TObject);
Var iContador: Integer;
begin
  if (CdsDadosRetornoCaixa.active) then
  begin
     if CdsDadosRetornoCaixa.recordcount <= 0 then
        pgControlDetalhe.ActivePageIndex := 0;

      CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
      CdsDadosRetornoCaixa.filtered:=true;

      icontador := 0;
      CdsDadosRetornoCaixa.First;
      CdsDadosRetornoCaixa.DisableControls;
      while not(CdsDadosRetornoCaixa.eof) do
      begin
         inc(icontador);
         CdsDadosRetornoCaixa.next;
         if icontador > 1 then
            CdsDadosRetornoCaixa.last;
      end;
      CdsDadosRetornoCaixa.EnableControls;
      if icontador < 1 then
      begin
         MsgDlg('É necessário selecionar pelo menos um assistido.','Informação',mtInformation,[mbOk],0);
         CdsDadosRetornoCaixa.filtered:=false;
         pgControlDetalhe.ActivePageIndex := 0;
         exit;
      end
      else
      if icontador > 1 then
      begin
         MsgDlg('É possível selecionar apenas para um assistido.','Informação',mtInformation,[mbOk],0);
         CdsDadosRetornoCaixa.filtered:=false;
         pgControlDetalhe.ActivePageIndex := 0;
         exit;
      end;

      SqlCamposIndiv.Prepare;
      SqlCamposIndiv.ParamByName('IDARQUIVORETORNOCAIXA').Asstring  := CdsDadosRetornoCaixa.FieldByName('IDARQUIVORETORNOCAIXA').Asstring;
      SqlCamposIndiv.ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
      SqlCamposIndiv.Open;

      sbtnAltDet.Enabled    := (CdsDadosIndividuais.recordcount > 0);
      sbtnExcluiDet.Enabled := (CdsDadosIndividuais.recordcount > 0);

      CdsDadosRetornoCaixa.filtered:=false;
  end;
   inherited;
end;

{begin
   inherited;
   if (CdsDadosRetornoCaixa.active) then
   begin
      CdsDadosRetornoCaixa.filter:='SELECIONAR = 1';
      CdsDadosRetornoCaixa.filtered:=true;

      SqlCamposIndiv.Prepare;
      SqlCamposIndiv.ParamByName('MATRICULA').Asstring  := CdsDadosRetornoCaixa.FieldByName('MATRICULA').Asstring;
      SqlCamposIndiv.ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
      SqlCamposIndiv.Open;

      sbtnAltDet.Enabled    := (CdsDadosIndividuais.recordcount > 0);
      sbtnExcluiDet.Enabled := (CdsDadosIndividuais.recordcount > 0);
   end;
end;}

procedure TfrmConciliacaoCredito.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   dbgIndiv.Visible := true;
   Dock973.Visible := true;
   sbtnAltDet.Down := false;
   sbtnExcluiDet.Down := false;
end;

procedure TfrmConciliacaoCredito.dbgIndivDblClick(Sender: TObject);
begin
   inherited;
   IF dbgIndiv.Columns[dbgIndiv.SelectedIndex].FieldName = 'NOMEARQUIVO' Then
   begin
      if CdsDadosIndividuais.FieldByName('CODIGORETORNO').Asstring <> '' then
      begin
         if CdsDadosIndividuais.FieldByName('EXTENSAOARQUIVO').Asstring <> '' then
         begin
            If FileExists(Sistema.TempDir + 'ARQUIVO'+CdsDadosIndividuais.FieldByName('EXTENSAOARQUIVO').Asstring) Then
              deletefile(Sistema.TempDir + 'ARQUIVO'+CdsDadosIndividuais.FieldByName('EXTENSAOARQUIVO').Asstring);

            TBlobField(CdsDadosIndividuais.FieldByName('ARQUIVO')).SaveToFile(sistema.TempDir + 'ARQUIVO'+CdsDadosIndividuais.FieldByName('EXTENSAOARQUIVO').Asstring);

            If FileExists(Sistema.TempDir + 'ARQUIVO'+CdsDadosIndividuais.FieldByName('EXTENSAOARQUIVO').Asstring) Then
               ShellExecute(Handle, nil, Pchar(sistema.TempDir + 'ARQUIVO'+CdsDadosIndividuais.FieldByName('EXTENSAOARQUIVO').Asstring), nil, nil, SW_SHOWNORMAL);
         end;
      end;
   end;
end;

function TfrmConciliacaoCredito.InsereHstRegularizacao(pIdArquivoRetSelecionado: integer): boolean;

var sArquivo, sExtencao, snomeArquivo, sNumAgencia, sNumBanco, sContaBancaria, sObservacao  : string;
    aArquivo  :  TBlobField;
    iIdArquivoRetornoCaixa, iIdEvento : Integer;
    sDataReg, sTipoRegularizacao : string;
    strem : TMemoryStream;
begin

   if trim(CdsDadosRetornoCaixa.FieldByName('AGENCIA').AsString) <> '' then
      sNumAgencia  :=  CdsDadosRetornoCaixa.FieldByName('AGENCIA').AsString
   else
      sNumAgencia :=  'NULL';

   if trim(CdsDadosRetornoCaixa.FieldByName('BANCO').AsString) <> '' then
      sNumBanco :=  CdsDadosRetornoCaixa.FieldByName('BANCO').AsString
   else
      sNumBanco :=  'NULL';

   if trim(CdsDadosRetornoCaixa.FieldByName('CONTABANCARIA').AsString) <> '' then
      sContaBancaria := CdsDadosRetornoCaixa.FieldByName('CONTABANCARIA').AsString
   else
      sContaBancaria :=  'NULL';

   result := true;

   try
   
      qryAux.Close;
      qryAux.Sql.Clear;
                      //Everson TIBERO - Início
      {qryAux.Sql.Add('SELECT EXTENSAOARQUIVO,' + #13#10 +
                     '       IDCADEVENTOSDEREGULARIZACAO,' + #13#10 +
                     '       DATAREGULARIZACAO,' + #13#10 +
                     '       TIPOREGULARIZACAO,' + #13#10 +
                     '       ARQUIVOREGULARIZACAO,' + #13#10 +
                     '       NUMEROAP,' + #13#10 +
                     '       NUMEROAR,' + #13#10 +
                     '       CODDOCUMENTOCAP,' + #13#10 +
                     '       NODOCUMENTOCAP,' + #13#10 +
                     '       CODDOCUMENTOCAR,' + #13#10 +
                     '       NODOCUMENTOCAR,' + #13#10 +
                     '       NUMBANCO,' + #13#10 +
                     '       NUMAGENCIA,' + #13#10 +
                     '       H.CONTABANCARIA,' + #13#10 +
                     '       OBSERVACAO,' + #13#10 +
                     '       NOMEARQUIVO' + #13#10 + }

      qryAux.Sql.Add('SELECT H.EXTENSAOARQUIVO,' + #13#10 +
                     '       H.IDCADEVENTOSDEREGULARIZACAO,' + #13#10 +
                     '       H.DATAREGULARIZACAO,' + #13#10 +
                     '       H.TIPOREGULARIZACAO,' + #13#10 +
                     '       H.ARQUIVOREGULARIZACAO,' + #13#10 +
                     '       H.NUMEROAP,' + #13#10 +
                     '       H.NUMEROAR,' + #13#10 +
                     '       H.CODDOCUMENTOCAP,' + #13#10 +
                     '       H.NODOCUMENTOCAP,' + #13#10 +
                     '       H.CODDOCUMENTOCAR,' + #13#10 +
                     '       H.NODOCUMENTOCAR,' + #13#10 +
                     '       H.NUMBANCO,' + #13#10 +
                     '       H.NUMAGENCIA,' + #13#10 +
                     '       H.CONTABANCARIA,' + #13#10 +
                     '       H.OBSERVACAO,' + #13#10 +
                     '       H.NOMEARQUIVO' + #13#10 +
                     //Everson TIBERO - Fim

                     '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
                     ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
                     '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
                     ' INNER JOIN BASEDEPAGAMENTO B ON (B.IDBASEPGTO = A.IDBASEPGTO)' + #13#10 +
                     ' WHERE A.IDHSTFOLHABENEF = '+dblVersao.LookupValue + #13#10 +
                     ' AND   B.CODPORTFORMA = '+dblConvenio.LookupValue+ #13#10 +
                     ' AND   H.IDCADEVENTOSDEREGULARIZACAO = '+sCodRetornoCredEfetuado );
      if pIdArquivoRetSelecionado > 0 then
         qryAux.Sql.Add(' AND A.IDARQUIVORETORNOCAIXA = '+ IntToStr(pIdArquivoRetSelecionado));

      qryAux.Open;

      if trim(qryAux.FieldByName('EXTENSAOARQUIVO').AsString) <> '' then
         sExtencao    := qryAux.FieldByName('EXTENSAOARQUIVO').AsString
      else
         sExtencao    := 'NULL';

      if trim(qryAux.FieldByName('NOMEARQUIVO').AsString) <> '' then
         snomeArquivo    := qryAux.FieldByName('NOMEARQUIVO').AsString
      else
         snomeArquivo    := 'NULL';

      if trim(qryAux.FieldByName('OBSERVACAO').AsString) <> '' then
         sObservacao    := qryAux.FieldByName('OBSERVACAO').AsString
      else
         sObservacao    := 'NULL';

      iIdArquivoRetornoCaixa := CdsDadosRetornoCaixa.FieldByName('IDARQUIVORETORNOCAIXA').AsInteger;
      iIdEvento              := qryAux.FieldByName('IDCADEVENTOSDEREGULARIZACAO').AsInteger;

      if trim(qryAux.FieldByName('DATAREGULARIZACAO').AsString) <> '' then
         sDataReg    := qryAux.FieldByName('DATAREGULARIZACAO').AsString
      else
         sDataReg    := 'NULL';

      if trim(qryAux.FieldByName('TIPOREGULARIZACAO').AsString) <> '' then
         sTipoRegularizacao    := qryAux.FieldByName('TIPOREGULARIZACAO').AsString
      else
         sTipoRegularizacao    := 'NULL';

      strem := TMemoryStream.Create;

      (qryAux.FieldByName('ARQUIVOREGULARIZACAO') as TBlobField).SaveToStream(strem);

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add( ' INSERT INTO CM.HSTREGULARIZACAOFOLHA ( ' + #13#10 +
                      ' IDHSTREGULARIZACAOFOLHA,' + #13#10 +
                      ' IDARQUIVORETORNOCAIXA,' + #13#10 +
                      ' IDCADEVENTOSDEREGULARIZACAO,' + #13#10 +
                      ' DATAREGULARIZACAO,' + #13#10 +
                      ' TIPOREGULARIZACAO,' + #13#10 +
                      ' ARQUIVOREGULARIZACAO,' + #13#10 +
                      ' EXTENSAOARQUIVO,' + #13#10 +
                      ' NOMEARQUIVO,' + #13#10 +
                      ' NUMBANCO,' + #13#10 +
                      ' NUMAGENCIA,' + #13#10 +
                      ' CONTABANCARIA, '+ #13#10 +
                      ' OBSERVACAO ) ' + #13#10 +
                      'VALUES ( cm.SEQHSTREGULARIZACAOFOLHA.NEXTVAL, '+ #13#10 +
                      IntToStr(iIdArquivoRetornoCaixa) +', '+ #13#10 +
                      IntToStr(iIdEvento) +', '+ #13#10 +
                      QuotedStr(sDataReg)+', '+ #13#10 +
                      QuotedStr(sTipoRegularizacao)+', '+ #13#10 +
                      ':ARQUIVOREGULARIZACAO,' + #13#10 +
                      QuotedStr(trim(sExtencao))+', '+ #13#10 +
                      QuotedStr(snomeArquivo)+', '+ #13#10 +
                      QuotedStr(sNumBanco)+', '+ #13#10 +
                      QuotedStr(sNumAgencia)+', '+ #13#10 +
                      QuotedStr(sContaBancaria)+', '+ #13#10 +
                      QuotedStr(sObservacao)+ ' ) ');

      qryAux.Params.ParamByName('ARQUIVOREGULARIZACAO').LoadFromStream(strem, ftBLOB);

      if Not(dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.StartTransaction;

      qryAux.ExecSQL;

      if (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.Commit;

         
   except
   
      result := false;
   end;

   FreeAndNil(strem);
  // se for diferente de 00 alterar a informação de sit pagamento.
end;

procedure TfrmConciliacaoCredito.CarregaArquivoMatricula(PsMatricula : string);
var iContador : Longint;
    sUltlinhas: TStringList;
    linha : String;

begin
   try
      try

          sUltlinhas := TStringList.Create;
          sUltlinhas.LoadFromFile(edtNomeArquivo.Text);

          iContador := sUltlinhas.Count - 1;

          linha := sUltlinhas[0];
          if copy(linha,1,1) = 'A' then
          begin
             if trim(copy(linha,3,20)) <> '' then
             if StrToInt(trim(copy(linha,3,20))) <> qryConvenio.FieldByName('numempresabanco').AsInteger then
             begin
                MsgDlg('Processo Cancelado! O Arquivo não pertence ao convênio selecionado.','Informação',mtInformation,[mbOk],0);
                Cria(edtNomeArquivo.Text);
                CdsDadosRetornoCaixa.close;
                exit;
             end;
          end;

          linha := sUltlinhas[iContador];
          //Descrição do Registro "Z" - TRAILLER
          if copy(linha,1,1) = 'Z' then
          begin
             MontaTrailler(linha);
          end;
          // Cria
          Cria(edtNomeArquivo.Text);
          // Inicia Processamento
          SqlCampos.Prepare;
          SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
          SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
          SqlCampos.ParambyName('IDPESSOA').AsString := '';
          SqlCampos.Open;

          btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
          btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);


          iContador := 0;
          frmAguarde.Pos      := 1;
          frmAguarde.Max      := sUltlinhas.Count -2;
          Application.ProcessMessages;

          while not EOF(FSaida) do
          begin
             //frmAguarde.Mostra('Carregando ' + IntToStr(iContador) + ' de ' + IntToStr(sUltlinhas.Count) + '.');
             // Lê a Linha
             Readln(FSaida,sLinha);


             // Caso Linha vazia pula
             if Trim(sLinha) = '' then
                Continue;

             // Descrição do Registro "A" - HEADER
             if copy(sLinha,1,1) = 'A' then
                MontaHeader(sLinha);

             // escrição do Registro "F"  Retorno do Crédito Automático
             if copy(sLinha,1,1) = 'F' then
             begin
                if TrimLeft(PsMatricula) <> TrimLeft(copy(sLinha,70,19)) then
                   Continue;
                Inc(iContador);
                if TrimLeft(PsMatricula) <> TrimLeft(copy(sLinha,70,19)) then
                   MontaRetornoArquivo(sLinha, iContador);
             end;
             //Descrição do Registro "Z" - TRAILLER
             //if copy(sLinha,1,1) = 'Z' then
             //   MontaTrailler(sLinha);
             frmAguarde.Pos := iContador;
          end;

      except
         Encerra;
      end;
   finally
   // Fecha o Arquivo
      //frmAguarde.Apaga;
      Encerra;
      SqlCampos.Prepare;
      SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
      SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
      SqlCampos.ParambyName('IDPESSOA').AsString := '';
      SqlCampos.Open;

      btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
      btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);

   end;

end;

procedure TfrmConciliacaoCredito.CarregaBaseDadosMatricula(PsIdPessoa : string);
begin

   if trim(PsIdPessoa) <> '' then
   begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT 1 ' + #13#10 +
                     '  FROM ARQUIVODERETORNOCAIXA A' + #13#10 +
                     ' INNER JOIN BASEDEPAGAMENTO B' + #13#10 +
                     '    ON (A.IDBASEPGTO = B.IDBASEPGTO AND' + #13#10 +
                     '       A.IDHSTFOLHABENEF = B.IDHSTFOLHABENEF AND A.IDPESSOA = B.IDPESSOA AND' + #13#10 +
                     '       A.IDTITULAR = B.IDTITULAR)' + #13#10 +
                     ' WHERE  A.IDPESSOA       = '+PsIdPessoa+ #13#10 +
                     ' AND   B.CODPORTFORMA    =  '+dblConvenio.LookupValue+ #13#10 +
                     ' AND    A.IDHSTFOLHABENEF = '+dblVersao.LookupValue);
      qryAux.Open;
      if (qryAux.IsEmpty) then
      begin
         if not(InsereBaseDePagamentoRetorno(PsIdPessoa)) then
            MsgDlg('Erro Ao Inserir na estrutura ARQUIVODERETORNOCAIXA.','Informação',mtInformation,[mbOk],0);
      end;
   end;

   SqlCampos.Prepare;
   SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
   SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
   SqlCampos.ParambyName('IDPESSOA').AsString := PsIdPessoa;
   SqlCampos.Open;

   btnInverte.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);
   btnSelTudo.Enabled := (CdsDadosRetornoCaixa.RecordCount > 0);



end;

procedure TfrmConciliacaoCredito.ProcessaOutroRetorno(pbArquivo: boolean;
  psmatricula: String; piIdHstFolhaBenef, piIdArquivoRetorno,
  piIdSeqRemessa: Integer);
begin

end;

function TfrmConciliacaoCredito.InsereArquivoRetorno(pIdArq,
                                                     pIdBase,
                                                     pIdHstFolha,
                                                     pIdPessoa,
                                                     pIdTitular: integer;
                                                     pMatricula,
                                                     pCpf,
                                                     pNome,
                                                     pBanco,
                                                     pAgencia,
                                                     pConta,
                                                     pVlrPagamento,
                                                     pDataPagamento: string;
                                                     pFlgInconsistencia,
                                                     pSeqRemessa: integer;
                                                     psCodRetorno : string
                                                    ): boolean;
var sIdArquivo, sDataPag, sIdBaseLancado: string;
begin

   if pIdArq > 0 then
      sIdArquivo := IntToStr(pIdArq)
   else
      sIdArquivo := 'NULL';

   result := false;

   if pIdBase = 0 then
      sIdBaseLancado := 'NULL'
   else
      sIdBaseLancado := Inttostr(pIdBase);

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add( ' SELECT CM.SEQARQUIVODERETORNOCAIXA.NEXTVAL SEQARQ FROM DUAL ');
   qryAux.open;

   SeqArquivoRetorno := qryAux.FieldByName('SEQARQ').AsInteger;
   sDataPag := copy(pDataPagamento,7,2)+'/'+copy(pDataPagamento,5,2)+'/'+copy(pDataPagamento,1,4);
   try
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add( ' INSERT INTO CM.ARQUIVODERETORNOCAIXA' + #13#10 +
                      '  (IDARQUIVORETORNOCAIXA,' + #13#10 +
                      '   IDBASEPGTO,' + #13#10 +
                      '   IDHSTFOLHABENEF,' + #13#10 +
                      '   IDPESSOA,' + #13#10 +
                      '   IDTITULAR,' + #13#10 +
                      '   MATRICULA,' + #13#10 +
                      '   CPF,' + #13#10 +
                      '   NOME,' + #13#10 +
                      '   BANCO,' + #13#10 +
                      '   AGENCIABANCARIA,' + #13#10 +
                      '   CONTABANCARIA,' + #13#10 +
                      '   VALORPAGAMENTO,' + #13#10 +
                      '   DATAPAGAMENTO,' + #13#10 +
                      '   FLGINCONSISTENCIA,' + #13#10 +
                      '   SEQREMESSA, CODARQUIVORETORNOCAIXA, CODIGORETORNOARQUIVO)' + #13#10 +
                      'VALUES' + #13#10 +
                      '  ( '+ #13#10 +
                      IntToStr(SeqArquivoRetorno)+' , '+ #13#10 +
                      sIdBaseLancado+', '+ #13#10 +
                      IntToStr(pIdHstFolha) +', '+ #13#10 +
                      IntToStr(pIdPessoa) +', '+ #13#10 +
                      IntToStr(pIdTitular) +', '+ #13#10 +
                      QuotedStr(trim(pMatricula)) +', '+ #13#10 +
                      QuotedStr(pCpf) +', '+ #13#10 +
                      QuotedStr(pNome) +', '+ #13#10 +
                      QuotedStr(pBanco) +', '+ #13#10 +
                      QuotedStr(pAgencia) +', '+ #13#10 +
                      QuotedStr(pConta) +', '+ #13#10 +
                      OraNumero(pVlrPagamento) +', '+ #13#10 +
                      QuotedStr(sDataPag)+', '+ #13#10 +
                      IntToStr(pFlgInconsistencia)+' , '+ #13#10 +
                      IntToStr(pSeqRemessa)+' , '+ #13#10 +
                      sIdArquivo+' , '+ #13#10 +
                      QuotedStr(psCodRetorno)+ ' ) ');

      qryAux.ExecSQL;
   except
      result := true;
   end;


end;


procedure TfrmConciliacaoCredito.SetOpcaoAlteraExclue(const Value: String);
begin

end;

procedure TfrmConciliacaoCredito.SetsCodRetornoCredEfetuado(
  const Value: string);
begin
  FsCodRetornoCredEfetuado := Value;
end;

procedure TfrmConciliacaoCredito.SetSeqArquivoRetorno(
  const Value: Longint);
begin
  FSeqArquivoRetorno := Value;
end;

procedure TfrmConciliacaoCredito.ComboBox1Change(Sender: TObject);
begin
   inherited;
   btnInverteClick(self);
   if ComboBox1.ItemIndex = 0 then
      CdsDadosRetornoCaixa.filtered:=false
   else
   begin
      if ComboBox1.ItemIndex = 1 then
         CdsDadosRetornoCaixa.filter:=' FLGINCONSISTENCIA = 0'
      else
         CdsDadosRetornoCaixa.filter:=' FLGINCONSISTENCIA = 1';


      CdsDadosRetornoCaixa.filtered:=true;
   end;
end;

procedure TfrmConciliacaoCredito.SetsNomeRelatorio(const Value: String);
begin
  FsNomeRelatorio := Value;
end;

procedure TfrmConciliacaoCredito.rpRelatoriosBeforePrint(Sender: TObject);
begin
  inherited;
  ppLbNomeRelatorio.Caption := sNomeRelatorio;
end;

procedure TfrmConciliacaoCredito.dbgIndivDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
Var R : TRect;
Begin
   inherited;
   R := Rect;
   Dec(R.Bottom,2);
   If Field = CdsDadosIndividuaisOBSERVACAO Then
   Begin
      If Not (gdSelected  in State) Then
         dbgIndiv.Canvas.FillRect(Rect);
      DrawText(dbgIndiv.Canvas.Handle,PChar(CdsDadosIndividuaisOBSERVACAO.AsString),Length(CdsDadosIndividuaisOBSERVACAO.AsString),R,DT_WORDBREAK);
   End;
End;


function TfrmConciliacaoCredito.ExisteEventoRegularizacao(
  psIdArquivoRet, psIdArquivo: string): boolean;
begin
   Result := false;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' select 1 ' + #13#10 +
                  '  from HSTREGULARIZACAOFOLHA h' + #13#10 +
                  ' inner join CADASTROEVENTOSDEREGULARIZACAO c' + #13#10 +
                  '    on (h.idcadeventosderegularizacao = c.idcadeventosderegularizacao)' + #13#10 +
                  '    inner join ARQUIVODERETORNOCAIXA A on (A.IDARQUIVORETORNOCAIXA = h.IDARQUIVORETORNOCAIXA)' + #13#10 +
                  '    inner join BASEDEPAGAMENTO b on (A.Idbasepgto = B.Idbasepgto and  A.Idhstfolhabenef = B.IDHSTFOLHABENEF and A.Idpessoa = B.idPessoa and A.idTitular = B.IdTitular) ' + #13#10 +

                  ' where b.codportforma     =  '+dblConvenio.LookupValue + #13#10 +
                  ' and   a.idhstfolhabenef  =  '+dblVersao.LookupValue + #13#10 +
                  ' and   c.flgdesativado = 0 and c.codigoretorno = ''00'' ');

   qryAux.Open;

   Result := not(qryAux.IsEmpty);
end;

function TfrmConciliacaoCredito.ExisteEventoRegularizacaoCR(
  psIdArquivoRet, psIdArquivo: string): boolean;
begin
   Result := false;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' select 1 ' + #13#10 +
                  '  from HSTREGULARIZACAOFOLHA h' + #13#10 +
                  ' inner join CADASTROEVENTOSDEREGULARIZACAO c' + #13#10 +
                  '    on (h.idcadeventosderegularizacao = c.idcadeventosderegularizacao)' + #13#10 +
                  '    inner join ARQUIVODERETORNOCAIXA A on (A.IDARQUIVORETORNOCAIXA = h.IDARQUIVORETORNOCAIXA)' + #13#10 +
                  ' where ((A.CODARQUIVORETORNOCAIXA = '+ QuotedStr(psIdArquivo) + ') OR (' + QuotedStr(psIdArquivo) + ' = 0 ) )'+ #13#10 +
                  ' and   A.IDARQUIVORETORNOCAIXA = '+ psIdArquivoRet  + #13#10 +
                  ' and   c.flgdesativado = 0 and c.codigoretorno <> ''00'' '+ #13#10 +
                  '  and not exists (Select 1 from documento d where d.coddocumento = h.coddocumentocap and d.status = 2 ) ' );
   qryAux.Open;

   Result := (qryAux.RecordCount > 0 );
end;

function TfrmConciliacaoCredito.InsereBaseDePagamentoRetorno(PsIdPessoa: string): boolean;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' INSERT INTO ARQUIVODERETORNOCAIXA' + #13#10 +
                  '  (IDARQUIVORETORNOCAIXA,' + #13#10 +
                  '   IDBASEPGTO,' + #13#10 +
                  '   IDHSTFOLHABENEF,' + #13#10 +
                  '   IDPESSOA,' + #13#10 +
                  '   IDTITULAR,' + #13#10 +
                  '   MATRICULA,' + #13#10 +
                  '   CPF,' + #13#10 +
                  '   NOME,' + #13#10 +
                  '   BANCO,' + #13#10 +
                  '   AGENCIABANCARIA,' + #13#10 +
                  '   CONTABANCARIA,' + #13#10 +
                  '   VALORPAGAMENTO,' + #13#10 +
                  '   DATAPAGAMENTO,' + #13#10 +
                  '   FLGINCONSISTENCIA,' + #13#10 +
                  '   SEQREMESSA, CODIGORETORNOARQUIVO)' + #13#10 +
                  '  SELECT CM.SEQARQUIVODERETORNOCAIXA.NEXTVAL,' + #13#10 +
                  '         BA.IDBASEPGTO,' + #13#10 +
                  '         BA.IDHSTFOLHABENEF,' + #13#10 +
                  '         BA.IDPESSOA,' + #13#10 +
                  '         BA.IDTITULAR,' + #13#10 +
                  '         BA.MATRICULA,' + #13#10 +
                  '         trim(BA.NUMDOCUMENTO),' + #13#10 +
                  '         P.NOME,' + #13#10 +                                       
                  '         BA.NUMBANCO,' + #13#10 +
                  '         BA.NUMAGENCIA,' + #13#10 +
                  '         BA.CONTACORRENTE,' + #13#10 +
                  '         BA.VLRLIQUIDO,' + #13#10 +
                  '         BA.DATAPAGAMENTO,' + #13#10 +
                  '         0,' + #13#10 +
                  '         0, ''00'' ' + #13#10 +
                  '    from BASEDEPAGAMENTO BA' + #13#10 +
                  '   INNER JOIN PESSOA P' + #13#10 +
                  '      ON (P.IDPESSOA = BA.IDPESSOA)' + #13#10 +
                 // '    INNER JOIN PESSOA PT' + #13#10 +
                 // '      ON (PT.IDPESSOA = BA.IDTITULAR)' + #13#10 +
                  '   WHERE BA.CODPORTFORMA    = '+dblConvenio.LookupValue+ #13#10 +
                  '     AND BA.IDHSTFOLHABENEF = '+dblVersao.LookupValue);

   if PsIdPessoa <> '' then
      qryAux.Sql.Add(' AND    BA.IDPESSOA       = '+PsIdPessoa);

   Result := true;
   try
      qryAux.ExecSQL;
   except
      Result := false;
   end;
end;

procedure TfrmConciliacaoCredito.SetIdArquivoRetornoCaixa(
  const Value: Longint);
begin
  FIdArquivoRetornoCaixa := Value;
end;

procedure TfrmConciliacaoCredito.SetIdPessoa(const Value: Longint);
begin
  FIdPessoa := Value;
end;

procedure TfrmConciliacaoCredito.SetIdHstFolha(const Value: Longint);
begin
  FIdHstFolha := Value;
end;

procedure TfrmConciliacaoCredito.SetCodConvenio(const Value: Longint);
begin
  FCodConvenio := Value;
end;

procedure TfrmConciliacaoCredito.SetrValor(const Value: Real);
begin
  FrValor := Value;
end;

function TfrmConciliacaoCredito.ExisteEventoRegularizacaoCP(psIdArqRetorno,
  psIdArquivo: string): boolean;
begin
   Result := false;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' select 1 ' + #13#10 +
                  '  from HSTREGULARIZACAOFOLHA h' + #13#10 +
                  ' inner join CADASTROEVENTOSDEREGULARIZACAO c' + #13#10 +
                  '    on (h.idcadeventosderegularizacao = c.idcadeventosderegularizacao)' + #13#10 +
                  '    inner join ARQUIVODERETORNOCAIXA A on (A.IDARQUIVORETORNOCAIXA = h.IDARQUIVORETORNOCAIXA)' + #13#10 +
                  ' inner join documento d on (d.coddocumento = h.coddocumentocar)' + #13#10 +
                  ' where d.status = 2' + #13#10 +
                  ' and ((A.CODARQUIVORETORNOCAIXA = '+ QuotedStr(psIdArquivo) + ') OR (' + QuotedStr(psIdArquivo) + ' = 0 ) )'+ #13#10 +
                  ' and   c.codigoretorno <>  ''00'' and A.IDARQUIVORETORNOCAIXA = '+ psIdArqRetorno  + #13#10 +
                  ' and   c.flgdesativado = 0 and   h.coddocumentocar is not null ' + #13#10 +
                  ' and h.Idhstregularizacaofolha = (select max(h1.Idhstregularizacaofolha)' + #13#10 +
                  '          from HSTREGULARIZACAOFOLHA h1' + #13#10 +
                  '         where h1.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)');
   qryAux.Open;

   Result := (qryAux.RecordCount > 0 );
end;

procedure TfrmConciliacaoCredito.bbtnSairClick(Sender: TObject);
begin
  // if bProcessando then
  //    Encerra;
  inherited;
end;

procedure TfrmConciliacaoCredito.dblConvenioEnter(Sender: TObject);
begin
  inherited;
  if trim(dblVersao.Text) = '' then
  begin
     dblVersao.SetFocus;
     exit;
  end;
  if dblConvenio.LookupValue <> '' then
     iTrocouSelecao := StrToInt(dblConvenio.LookupValue);
end;

procedure TfrmConciliacaoCredito.dblVersaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   SelecionaConvenio();
end;

procedure TfrmConciliacaoCredito.dblVersaoEnter(Sender: TObject);
begin
  inherited;
  if trim(cmbMes.Text) = '' then
  begin
     cmbMes.SetFocus;
     exit;
  end;
end;

procedure TfrmConciliacaoCredito.wwDBLookupCombo1NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

procedure TfrmConciliacaoCredito.dblVersaoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

procedure TfrmConciliacaoCredito.dblConvenioNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

procedure TfrmConciliacaoCredito.bbtnAjudaClick(Sender: TObject);
begin
  Exit;
  inherited;
end;

function TfrmConciliacaoCredito.ExisteEventoRegularizado(psIdArquivoCaixa: string): boolean;
begin
   Result := false;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' select 1 ' + #13#10 +
                  '  from HSTREGULARIZACAOFOLHA h' + #13#10 +
                  ' inner join CADASTROEVENTOSDEREGULARIZACAO c' + #13#10 +
                  '    on (h.idcadeventosderegularizacao = c.idcadeventosderegularizacao)' + #13#10 +
                  '    inner join ARQUIVODERETORNOCAIXA A on (A.IDARQUIVORETORNOCAIXA = h.IDARQUIVORETORNOCAIXA)' + #13#10 +
                  ' where A.IDARQUIVORETORNOCAIXA = '+ QuotedStr(psIdArquivoCaixa) + #13#10 +
                  ' and   c.Codigoretorno = ''00'' ');
   qryAux.Open;

   Result := (qryAux.RecordCount > 0 );
end;

procedure TfrmConciliacaoCredito.dblVersaoClick(Sender: TObject);
begin
  inherited;
  if trim(dblVersao.Text) = '' then
  begin
     cmbMes.SetFocus;
     exit;
  end;
end;

procedure TfrmConciliacaoCredito.dblConvenioClick(Sender: TObject);
begin
  inherited;
  if trim(dblConvenio.Text) = '' then
  begin
     cmbMes.SetFocus;
     exit;
  end;
end;

procedure TfrmConciliacaoCredito.dbgArquivoRetornoCheckValue(
  Sender: TObject; PassesPictureTest: Boolean);
begin
  inherited;
  if CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring = '1' then
     iCountRegSelecionado := iCountRegSelecionado + 1
  else
     iCountRegSelecionado := iCountRegSelecionado - 1;
end;

procedure TfrmConciliacaoCredito.dblConvenioExit(Sender: TObject);
begin
  inherited;
  if dblConvenio.LookupValue <> '' then
  begin
     if iTrocouSelecao <>  StrToInt(dblConvenio.LookupValue) then
     begin
        if (CdsDadosIndividuais.active) then
           CdsDadosIndividuais.close;
        if (CdsDadosRetornoCaixa.active) then
           CdsDadosRetornoCaixa.close;
     end;
  end
  else
  begin
     if (CdsDadosIndividuais.active) then
        CdsDadosIndividuais.close;
     if (CdsDadosRetornoCaixa.active) then
        CdsDadosRetornoCaixa.close;
  end;
end;

procedure TfrmConciliacaoCredito.dblConvenioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   pgControlDetalhe.ActivePageIndex := 0;
   btnEventos.Enabled        := false ;
   btnContasReceber.Enabled  := false ;
   btnContasPagar.Enabled    := false;
   BtnConsistencia.Enabled   := false ;
   BtnInConsistencia.Enabled := false ;
   BtnPendencias.Enabled     := false ;
   BtnInconsArq.Enabled      := false ;
   btnProcessar.Enabled      := false ;
   bbtnDesfazer.Enabled      := false ;
end;

procedure TfrmConciliacaoCredito.TbsArqRetornoEnter(Sender: TObject);
begin
  inherited;
  CdsDadosIndividuais.close;
end;

procedure TfrmConciliacaoCredito.pgControlDetalheChange(Sender: TObject);
var icontador: integer;
begin

   if pgControlDetalhe.ActivePageIndex = 1 then
   begin
      if (CdsDadosRetornoCaixa.active) then
      begin
         if CdsDadosRetornoCaixa.recordcount <= 0 then
            pgControlDetalhe.ActivePageIndex := 0;

          CdsDadosRetornoCaixa.filter:='SELECIONAR = 1 AND IDPESSOA IS NOT NULL';
          CdsDadosRetornoCaixa.filtered:=true;

          icontador := 0;
          CdsDadosRetornoCaixa.First;
          CdsDadosRetornoCaixa.DisableControls;
          while not(CdsDadosRetornoCaixa.eof) do
          begin
             inc(icontador);
             CdsDadosRetornoCaixa.next;
             if icontador > 1 then
                CdsDadosRetornoCaixa.last;
          end;
          CdsDadosRetornoCaixa.EnableControls;
          if icontador < 1 then
          begin
             MsgDlg('É necessário selecionar pelo menos um assistido.','Informação',mtInformation,[mbOk],0);
             CdsDadosRetornoCaixa.filtered:=false;
             pgControlDetalhe.ActivePageIndex := 0;
             exit;
          end
          else
          if icontador > 1 then
          begin
             MsgDlg('É possível selecionar apenas para um assistido.','Informação',mtInformation,[mbOk],0);
             CdsDadosRetornoCaixa.filtered:=false;
             pgControlDetalhe.ActivePageIndex := 0;
             exit;
          end;

          SqlCamposIndiv.Prepare;
          SqlCamposIndiv.ParamByName('IDARQUIVORETORNOCAIXA').Asstring  := CdsDadosRetornoCaixa.FieldByName('IDARQUIVORETORNOCAIXA').Asstring;
          SqlCamposIndiv.ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
          SqlCamposIndiv.Open;

          sbtnAltDet.Enabled    := (CdsDadosIndividuais.recordcount > 0);
          sbtnExcluiDet.Enabled := (CdsDadosIndividuais.recordcount > 0);

          If sbtnAltDet.Enabled then
             sbtnAltDet.Down := false;

          If sbtnExcluiDet.Enabled then
             sbtnExcluiDet.Down := false;


          CdsDadosRetornoCaixa.filtered:=false;
      end;
   end
   else
   begin
      if ComboBox1.ItemIndex <= 0 then
         CdsDadosRetornoCaixa.filtered:=false
      else
      begin
         if ComboBox1.ItemIndex = 1 then
            CdsDadosRetornoCaixa.filter:=' FLGINCONSISTENCIA = 0'
         else
            CdsDadosRetornoCaixa.filter:=' FLGINCONSISTENCIA = 1';


         CdsDadosRetornoCaixa.filtered:=true;
      end;
   end;
   inherited;
end;

procedure TfrmConciliacaoCredito.ObtemPermissaoBotaoCarregarATela;
var iidOperFunc : double;
begin

   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT OPERFUNC.Idoperfunc' + #13#10 +
                  '  FROM FORM, OBJETO, OPERACAO, OPERFUNC, FROBFNOP' + #13#10 +
                  ' WHERE (OPERFUNC.IDMODULO = '+inttostr(sistema.IdModulo)+')' + #13#10 +
                  '   AND (OPERFUNC.IDOPERACAO = null or null is null)' + #13#10 +
                  '   AND (OPERFUNC.IDOPERFUNC = FROBFNOP.IDOPERFUNC)' + #13#10 +
                  '   AND (FORM.IDFORM = FROBFNOP.IDFORM)' + #13#10 +
                  '   AND (OBJETO.NOMEOBJETO = ''btnContasReceber'')' + #13#10 +
                  '   AND (OBJETO.IDOBJETO = FROBFNOP.IDOBJETO)' + #13#10 +
                  '   AND (OPERACAO.IDOPERACAO = OPERFUNC.IDOPERACAO)');
   qryAux.Open;
   iidOperFunc := qryAux.FieldByName('Idoperfunc').AsFloat;
   //SIG51345

   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT DISTINCT IDOPERFUNC FROM ('+ #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  '(AUTORIZA.IDESPACESSO = '+inttostr(sistema.IdEspAcesso)+')' + #13#10 +
                  'union' + #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  'exists  (SELECT GRUPOACESSO.IDESPACESSO FROM GRUPOACESSO, GRUPOUSU' + #13#10 +
                  '         WHERE  GRUPOUSU.IDUSUARIO  = '+inttostr(sistema.IdUsuario)+  #13#10 +
                  '         AND    GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO' + #13#10 +
                  '         AND    GRUPOACESSO.IDESPACESSO = AUTORIZA.IDESPACESSO )' + #13#10 +
                  ') where IDOPERFUNC = '+FloatToStr(iidOperFunc));

   qryAux.Open;
   //SIG51345
   bBtnContasReceber    :=  qryAux.RecordCount > 0 ;
   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT OPERFUNC.Idoperfunc' + #13#10 +
                  '  FROM FORM, OBJETO, OPERACAO, OPERFUNC, FROBFNOP' + #13#10 +
                  ' WHERE (OPERFUNC.IDMODULO = '+inttostr(sistema.IdModulo)+')' + #13#10 +
                  '   AND (OPERFUNC.IDOPERACAO = null or null is null)' + #13#10 +
                  '   AND (OPERFUNC.IDOPERFUNC = FROBFNOP.IDOPERFUNC)' + #13#10 +
                  '   AND (FORM.IDFORM = FROBFNOP.IDFORM)' + #13#10 +
                  '   AND (OBJETO.NOMEOBJETO = ''btnContasPagar'')' + #13#10 +
                  '   AND (OBJETO.IDOBJETO = FROBFNOP.IDOBJETO)' + #13#10 +
                  '   AND (OPERACAO.IDOPERACAO = OPERFUNC.IDOPERACAO)');
   qryAux.Open;
   iidOperFunc := qryAux.FieldByName('Idoperfunc').AsFloat;
   //SIG51345


   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT DISTINCT IDOPERFUNC FROM ('+ #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  '(AUTORIZA.IDESPACESSO = '+inttostr(sistema.IdEspAcesso)+')' + #13#10 +
                  'union' + #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  'exists  (SELECT GRUPOACESSO.IDESPACESSO FROM GRUPOACESSO, GRUPOUSU' + #13#10 +
                  '         WHERE  GRUPOUSU.IDUSUARIO  = '+inttostr(sistema.IdUsuario)+  #13#10 +
                  '         AND    GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO' + #13#10 +
                  '         AND    GRUPOACESSO.IDESPACESSO = AUTORIZA.IDESPACESSO )' + #13#10 +
                  ') where IDOPERFUNC = '+FloatToStr(iidOperFunc));
   qryAux.Open;
   //SIG51345
   bBtnContasPagar      :=  qryAux.RecordCount > 0;

   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT OPERFUNC.Idoperfunc' + #13#10 +
                  '  FROM FORM, OBJETO, OPERACAO, OPERFUNC, FROBFNOP' + #13#10 +
                  ' WHERE (OPERFUNC.IDMODULO = '+inttostr(sistema.IdModulo)+')' + #13#10 +
                  '   AND (OPERFUNC.IDOPERACAO = null or null is null)' + #13#10 +
                  '   AND (OPERFUNC.IDOPERFUNC = FROBFNOP.IDOPERFUNC)' + #13#10 +
                  '   AND (FORM.IDFORM = FROBFNOP.IDFORM)' + #13#10 +
                  '   AND (OBJETO.NOMEOBJETO = ''btnProcessar'')' + #13#10 +
                  '   AND (OBJETO.IDOBJETO = FROBFNOP.IDOBJETO)' + #13#10 +
                  '   AND (OPERACAO.IDOPERACAO = OPERFUNC.IDOPERACAO)');
   qryAux.Open;
   iidOperFunc := qryAux.FieldByName('Idoperfunc').AsFloat;
   //SIG51345


   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT DISTINCT IDOPERFUNC FROM ('+ #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  '(AUTORIZA.IDESPACESSO = '+inttostr(sistema.IdEspAcesso)+')' + #13#10 +
                  'union' + #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  'exists  (SELECT GRUPOACESSO.IDESPACESSO FROM GRUPOACESSO, GRUPOUSU' + #13#10 +
                  '         WHERE  GRUPOUSU.IDUSUARIO  = '+inttostr(sistema.IdUsuario)+  #13#10 +
                  '         AND    GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO' + #13#10 +
                  '         AND    GRUPOACESSO.IDESPACESSO = AUTORIZA.IDESPACESSO )' + #13#10 +
                  ') where IDOPERFUNC = '+FloatToStr(iidOperFunc));
   qryAux.Open;
   //SIG51345
   bBtnProcessar        :=  qryAux.RecordCount > 0;


   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT OPERFUNC.Idoperfunc' + #13#10 +
                  '  FROM FORM, OBJETO, OPERACAO, OPERFUNC, FROBFNOP' + #13#10 +
                  ' WHERE (OPERFUNC.IDMODULO = '+inttostr(sistema.IdModulo)+')' + #13#10 +
                  '   AND (OPERFUNC.IDOPERACAO = null or null is null)' + #13#10 +
                  '   AND (OPERFUNC.IDOPERFUNC = FROBFNOP.IDOPERFUNC)' + #13#10 +
                  '   AND (FORM.IDFORM = FROBFNOP.IDFORM)' + #13#10 +
                  '   AND (OBJETO.NOMEOBJETO = ''bbtnDesfazer'')' + #13#10 +
                  '   AND (OBJETO.IDOBJETO = FROBFNOP.IDOBJETO)' + #13#10 +
                  '   AND (OPERACAO.IDOPERACAO = OPERFUNC.IDOPERACAO)');
   qryAux.Open;
   iidOperFunc := qryAux.FieldByName('Idoperfunc').AsFloat;
   //SIG51345

   //SIG51345
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT DISTINCT IDOPERFUNC FROM ('+ #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  '(AUTORIZA.IDESPACESSO = '+inttostr(sistema.IdEspAcesso)+')' + #13#10 +
                  'union' + #13#10 +
                  'SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC' + #13#10 +
                  'WHERE' + #13#10 +
                  '(AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND' + #13#10 +
                  '(OPERFUNC.IDMODULO= '+inttostr(sistema.IdModulo)+') AND' + #13#10 +
                  '(AUTORIZA.IDPESSOA = '+inttostr(sistema.IdEmpresa)+') AND' + #13#10 +
                  'exists  (SELECT GRUPOACESSO.IDESPACESSO FROM GRUPOACESSO, GRUPOUSU' + #13#10 +
                  '         WHERE  GRUPOUSU.IDUSUARIO  = '+inttostr(sistema.IdUsuario)+  #13#10 +
                  '         AND    GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO' + #13#10 +
                  '         AND    GRUPOACESSO.IDESPACESSO = AUTORIZA.IDESPACESSO )' + #13#10 +
                  ') where IDOPERFUNC = '+FloatToStr(iidOperFunc));
   qryAux.Open;
   //SIG51345
   bBbtnDesfazer        :=  qryAux.RecordCount > 0;

   bBtnEventos          :=  btnEventos.Enabled;
   bBtnConsistencia     :=  BtnConsistencia.Enabled;
   bBtnInConsistencia   :=  BtnInConsistencia.Enabled;
   bBtnPendencias       :=  BtnPendencias.Enabled;
   bBtnInconsArq        :=  BtnInconsArq.Enabled;

end;

procedure TfrmConciliacaoCredito.FormShow(Sender: TObject);
begin
   inherited;
   ObtemPermissaoBotaoCarregarATela;

   btnEventos.Enabled        := false ;
   btnContasReceber.Enabled  := false ;
   btnContasPagar.Enabled    := false;
   BtnConsistencia.Enabled   := false ;
   BtnInConsistencia.Enabled := false ;
   BtnPendencias.Enabled     := false ;
   BtnInconsArq.Enabled      := false ;
   btnProcessar.Enabled      := false ;
   bbtnDesfazer.Enabled      := false ;


end;

procedure TfrmConciliacaoCredito.RetornaPermissaoBotaoTelaCarregada;
begin
   btnEventos.Enabled          :=  bBtnEventos;
   btnContasReceber.Enabled    :=  bBtnContasReceber;
   btnContasPagar.Enabled      :=  bBtnContasPagar;
   BtnConsistencia.Enabled     :=  bBtnConsistencia;
   BtnInConsistencia.Enabled   :=  bBtnInConsistencia;
   BtnPendencias.Enabled       :=  bBtnPendencias;
   BtnInconsArq.Enabled        :=  bBtnInconsArq;
   btnProcessar.Enabled        :=  bBtnProcessar;
   bbtnDesfazer.Enabled        :=  bBbtnDesfazer;

end;

function TfrmConciliacaoCredito.ValidaInformacoesPrincipais: boolean;
begin
   Result := false;
   if (cmbMes.Text = '') then
   begin
      MsgDlg('É obrigatório informar o mês/ano de pagamento.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (dblVersao.Text = '') then
   begin
      MsgDlg('É obrigatório selecionar a versão da folha de benefícios.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (dblConvenio.Text = '') then
   begin
      MsgDlg('É obrigatório selecionar o convênio do arquivo.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (dbrgBusca.ItemIndex = 0) then //Arquivo
   begin
      if (trim(edtNomeArquivo.Text) = '') then
      begin
         MsgDlg('Selecione o arquivo de retorno a ser importado.','Informação',mtInformation,[mbOk],0);
         exit;
      end
   end;

   Result := true;
end;

function TfrmConciliacaoCredito.ExisteDocumentoPagarAberto(
  psIdArquivo: string): boolean;
begin
   result := false;

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT H.CODDOCUMENTOCAP, H.CODDOCUMENTOCAR, D.STATUS AS STATUSR, DX.STATUS AS STATUSP ' + #13#10 +
                  '  FROM CM.HSTREGULARIZACAOFOLHA H' + #13#10 +
                  '  Left outer join Documento D On (H.CODDOCUMENTOCAR = D.CODDOCUMENTO)' + #13#10 +
                  '  Left outer join Documento DX On (H.CODDOCUMENTOCAP = DX.CODDOCUMENTO) '+ #13#10 +
                  '  WHERE H.IDARQUIVORETORNOCAIXA = '+ QuotedStr(psIdArquivo) );
   qryAux.Open;

   if qryAux.recordcount <= 1 then
   begin
      if qryAux.FieldByName('CODDOCUMENTOCAR').AsFloat > 0 then
      begin
         result := true;
         exit;
      end;
   end
   else
   begin
      qryAux.Last;
      if qryAux.FieldByName('CODDOCUMENTOCAR').AsFloat > 0 then
      begin
         result := true;
         exit;
      end;
   end;

end;

function TfrmConciliacaoCredito.ExisteDocumentoReceberAberto(
  psIdArquivo: string): boolean;
begin

   result := false;

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT H.CODDOCUMENTOCAP, H.CODDOCUMENTOCAR, D.STATUS AS STATUSR, DX.STATUS AS STATUSP ' + #13#10 +
                  '  FROM CM.HSTREGULARIZACAOFOLHA H' + #13#10 +
                  '  Left outer join Documento D On (H.CODDOCUMENTOCAR = D.CODDOCUMENTO)' + #13#10 +
                  '  Left outer join Documento DX On (H.CODDOCUMENTOCAP = DX.CODDOCUMENTO) '+ #13#10 +
//                  '  WHERE H.IDARQUIVORETORNOCAIXA = '+ QuotedStr(psIdArquivo)+ ' order by idhstregularizacaofolha ' ); //Everson TIBERO
                  '  WHERE H.IDARQUIVORETORNOCAIXA = '+ QuotedStr(psIdArquivo)+ ' order by H.idhstregularizacaofolha ' ); //Everson TIBERO
   qryAux.Open;

   if qryAux.recordcount <= 1 then
   begin
      if qryAux.FieldByName('CODDOCUMENTOCAP').AsFloat > 0 then
      begin
        result := true;
        exit;
      end;
      if qryAux.FieldByName('CODDOCUMENTOCAR').AsFloat > 0 then
      begin
        if qryAux.FieldByName('STATUSR').AsFloat <> 2 then
        begin
           result := true;
           exit;
        end;

      end;
   end
   else
   begin
      qryAux.Last;
      if qryAux.FieldByName('CODDOCUMENTOCAP').AsFloat > 0 then
      begin
        result := true;
        exit;
      end;
      if qryAux.FieldByName('CODDOCUMENTOCAR').AsFloat > 0 then
      begin
        if qryAux.FieldByName('STATUSR').AsFloat <> 2 then
        begin
           result := true;
           exit;
        end;

      end;
   end;

end;

procedure TfrmConciliacaoCredito.AtualizaDados(pIdHst: Integer);
begin
   SqlCampos.Prepare;
   SqlCampos.ParambyName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
   SqlCampos.ParambyName('CODPORTFORMA').AsInteger := StrToInt(dblConvenio.LookupValue);
   if FsIdPessoa <> '' then
      SqlCampos.ParambyName('IDPESSOA').AsString := FsIdPessoa
   else
      SqlCampos.ParambyName('IDPESSOA').AsString := '';
   SqlCampos.Open;

   CdsDadosRetornoCaixa.filtered:=false;
   CdsDadosRetornoCaixa.filter:=' IDARQUIVORETORNOCAIXA = '+IntToStr(pIdHst);
   CdsDadosRetornoCaixa.filtered:=true;

   CdsDadosRetornoCaixa.Edit;
   CdsDadosRetornoCaixa.FieldByName('SELECIONAR').Asstring := '1';
   CdsDadosRetornoCaixa.post;

   CdsDadosRetornoCaixa.filtered:=false;

   SqlCamposIndiv.Prepare;
   SqlCamposIndiv.ParamByName('IDARQUIVORETORNOCAIXA').Asstring  := IntToStr(pIdHst);
   SqlCamposIndiv.ParamByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblVersao.LookupValue);
   SqlCamposIndiv.Open;
end;

function TfrmConciliacaoCredito.ExisteEventoRegularizacaoParaPessoa(psIdArquivo: string): boolean;
begin
//Darivaldo Alencar SIG69309 -inicio
//   Result := false;
//   qryAux.Close;
//   qryAux.Sql.Clear;
//   qryAux.Sql.Add(' select 1 ' + #13#10 +
//                  '  from HSTREGULARIZACAOFOLHA h' + #13#10 +
//                  ' inner join CADASTROEVENTOSDEREGULARIZACAO c' + #13#10 +
//                  '    on (h.idcadeventosderegularizacao = c.idcadeventosderegularizacao)' + #13#10 +
//                  '    inner join ARQUIVODERETORNOCAIXA A on (A.IDARQUIVORETORNOCAIXA = h.IDARQUIVORETORNOCAIXA)' + #13#10 +
//                  '    inner join BASEDEPAGAMENTO b on (A.Idbasepgto = B.Idbasepgto and  A.Idhstfolhabenef = B.IDHSTFOLHABENEF and A.Idpessoa = B.idPessoa and A.idTitular = B.IdTitular) ' + #13#10 +
//
//                  ' where b.codportforma     =  '+dblConvenio.LookupValue + #13#10 +
//                  ' and   a.idhstfolhabenef  =  '+dblVersao.LookupValue + #13#10 +
//                  ' and   A.IDARQUIVORETORNOCAIXA = '+psIdArquivo+ #13#10 +
//                  ' and   c.flgdesativado = 0 and c.codigoretorno = ''00'' ');
//
//   qryAux.Open;
//
//   Result := not(qryAux.IsEmpty);
   result:= CdsDadosRetornoCaixa.FieldByName('REGULARIZADO').ASInteger > 0;
//Darivaldo Alencar SIG69309 -fim
end;

procedure TfrmConciliacaoCredito.SetIdHstFolhaIndiv(const Value: Longint);
begin
  FIdHstFolhaIndiv := Value;
end;

//Darivaldo Alencar SIG69309 -inicio
function TfrmConciliacaoCredito.FiltrarCDS(cdsFiltrado: TCMClientDataSet; sFiltro: String): String;
begin
  try
     result:= EmptySTR;
     if (cdsFiltrado.filtered) then
        result:= cdsFiltrado.filter;

     cdsFiltrado.filtered := False;
     cdsFiltrado.filter   := sFiltro;
     cdsFiltrado.filtered := True;
  except on e: exception do
     raise exception.create('Erro ao aplicar Filter:' +#13#10+ sFiltro +#13#10+ e.message);
  end;
end;
//Darivaldo Alencar SIG69309 -fim


end.
