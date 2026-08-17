{-----------------------------------------------------------------------------------
--------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------
-------------------------------------------------------------------------------------
N.WO............: WO38245
Data............: 15/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para corrigir a identificação correta da situação dos
                  contratos.
-------------------------------------------------------------------------------------
N.WO............: WO37036
Data............: 06/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para aprimorar:
                  .Criada uma label de identificação na aba de Pagamentos quando o
                   Contrato tem a condição de "Não se Aplica";                     
                  .Quando houver esta condição então os símbolos de "-" e "=" serão
                   escondidos, deixando somente ser ressaltado os Valores Pagos.
-------------------------------------------------------------------------------------
N.WO............: WO28914
Data............: 11/03/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para melhorar a apresentação dos Aditamentos e Pagamentos. 
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 02/02/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustando a label do Total...para incluir também o "Regularização".
-------------------------------------------------------------------------------------
N.Chamado.....: MIGRACAO-ORACLE-2025 (TAS000000006791)
Dt.Alteração..: 17/10/2025
Responsável...: Paulo Nobre
Descrição.....: Inclusão da função CAST, em campos, nas qrerys e Cds:
                .qryContratoOrig
                .qryLogAditamento
                .cdsOrigemSaldo
                .cdsPagtosAnalitico
---------------------------------------------------------------------------------
N.WO............: WO22494
Data............: 02/06/2025
Responsável.....: Paulo Nobre
Descrição.......: Atualizando o texto do sql que está contido no componente:
                  sqlPagtosSintetico.
------------------------------------------------------------------------------------
N.WO............: WO22434
Data............: 27/05/2025
Responsável.....: Paulo Nobre
Descrição.......: Correção de bug, retirando a coluna DATAASSADITAMENTO dos fields
                  do cdsOrigemSaldo.
------------------------------------------------------------------------------------
N.WO............: WO20717
Data............: 05/05/2025
Responsável.....: Paulo Nobre
Descrição.......: Inclusão dos novos campos (flags) para visualização:
                   .FLGRENOVACAO
                   .FLGFASE_ENCERRAMENTO
                   .FLGANS
                   .FLGVIGENCIAINDETERMINADA
                   .FLGSERVICOPONTUAL
                   .FLGSERVICOCONTINUADO
--------------------------------------------------------------------------------
N.WO............: WO20776
Data............: 25/04/2025
Responsável.....: Paulo Nobre
Descrição.......: Incluido ordenação, pela coluna de Vencimento, na grid
                  "Pagamentos (Medições)"
                  Ajustando a label do Total...para incluir também o "Outros".
------------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 05/12/2024
Responsável.....: Paulo Nobre
Descrição.......: .Implementado nova proposta de apresentar os valores e respectivos
                  movimento por documento de origem: Contrato ou Aditamentos.
                  .Foram incorporados a esta demanda o solicitado no WO15652
                  mostrar o valor do contrato/aditamento e saldo = 0 quando o valor
                  do contrato orçado/aprovado tiver a marcação de "Não se Aplica".
------------------------------------------------------------------------------------
N.WO............: WO13506     
Data............: 12/11/2024
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de uma nova aba para apresentar o novo campo:
                  JUSTIFOPCAONAOSEAPLICA, que foi definido no Cadastro de
                  contrato quando da escolha da no opção "Não se Aplica" no
                  box dos Valores Orçados ou Aprovados.
--------------------------------------------------------------------------------
N. WO ..........: WO13378
Data............: 15/08/2024
Responsável.....: Helen V Bianchi
Descrição.......: Alterado a consulta(qryPagtosSintetico) na aba de Pagamentos o
     campo Total de contrato p trazer o valor da table dsPagtosSintetico
--------------------------------------------------------------------------------
N. SIG..........: WO7471
Data............: 31/01/2024
Responsável.....: Arnaldo V. Scarin
Descrição.......: Incluir os dados da Área Técnica do Contrato
--------------------------------------------------------------------------------
Nº SIG......: 111798
Data........: 23/03/2021
Responsável.: Everson Cunha
Descrição...: Criada a nova aba Pagamentos
--------------------------------------------------------------------------------
Nº SIG......: 46231
Data........: 29/08/2019
Responsável.: Everson Cunha
Descrição...: Criados os campos "Última Cotação", "Valor Orçado" e
              "Área Gestora do Contrato".
              Excluído o campo "Código no Cliente Fornecedor".
--------------------------------------------------------------------------------
Nº SIG......: 78742
Data........: 27/11/2018
Responsável.: Everson Cunha
Descrição...: Alteração na forma de consulta dos contratos, baseando-se no tipo
              Atual: CONTRATOCONTR, Original: CONTRATOORIG
--------------------------------------------------------------------------------
Nº SOL......: 200245
Nº KINTANA..: 1929615
Data........: 05/02/2013
Responsável.: Fernando Xavier
Descrição...: Estamos com problemas quando tentamos abrir a tela de
              consulta de contratos. Falta o campo ENDCORRESP
--------------------------------------------------------------------------------}

unit FCadContratoOrig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, ComCtrls, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, TREdit, DBCtrls,
  uCtrlImagemContr, DBClient, uCMClientDataSet, uCmSqlParams, ToolWin,
  ImgList, ShellAPI, TB97Ctls, uCmFileUtils, uCtrlContratos, DBGrids,
  wwdblook, uCtrlAditamento;  // Paulo Nobre - WO37036

type
  TfrmCadContratoOrig = class(TfrmSairAjuda)
    pgcSuperior: TPageControl;
    pgcInferior: TPageControl;
    Splitter1: TSplitter;
    tsDescricao: TTabSheet;
    tsDadosContr: TTabSheet;
    tsServProd: TTabSheet;
    tsRateio: TTabSheet;
    qryContratoOrig: TwwQuery;
    dsContratoOrig: TwwDataSource;
    qryObjxItOrig: TwwQuery;
    dsObjxItOrig: TwwDataSource;
    qryRateioCCOrig: TwwQuery;
    dsRateioCCOrig: TwwDataSource;
    Panel1: TPanel;
    tsContraparte: TTabSheet;
    tsEnderecos: TTabSheet;
    tsIntegracao: TTabSheet;
    tbObservacao: TTabSheet;
    tsRenovacao: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbDataAssinatura: TwwDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    dbDataBase: TwwDBEdit;
    dbDataPrevista: TwwDBEdit;
    dbDataEncerramento: TwwDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbMoeda: TwwDBEdit;
    dbPrazoDen: TwwDBEdit;
    dbAviso: TwwDBEdit;
    Label3: TLabel;
    dbContraparte: TwwDBEdit;
    Label4: TLabel;
    dbContato: TwwDBEdit;
    Label5: TLabel;
    dbTelContato: TwwDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbCorrespondencia: TwwDBEdit;
    dbEntrega: TwwDBEdit;
    dbCobranca: TwwDBEdit;
    Label28: TLabel;
    Label14: TLabel;
    Label26: TLabel;
    Label24: TLabel;
    dbAtivProj: TwwDBEdit;
    dbRespons: TwwDBEdit;
    dbCentroRespon: TwwDBEdit;
    dbTipoDoc: TwwDBEdit;
    GroupBox5: TGroupBox;
    dbReservOrc: TwwDBEdit;
    BtnConsulta: TBitBtn;
    dbgObjxItem: TwwDBGrid;
    dbgRateio: TwwDBGrid;
    MSContrato: TMontaSelect;
    DBValorBaseContrato: TDBRealEdit;
    dbmDescricaoContrato: TDBMemo;
    dbmObservacao: TDBMemo;
    dbmRenovacao: TDBMemo;
    tsAditamento: TTabSheet;
    dbgLogAditamento: TwwDBGrid;
    qryAditamento: TwwQuery;
    dsAditamento: TwwDataSource;
    qryContratoOrigIDCONTRATO: TFloatField;
    qryContratoOrigCODPORTFORMA: TFloatField;
    qryContratoOrigCODCENTRORESPON: TStringField;
    qryContratoOrigIDPESSOA: TFloatField;
    qryContratoOrigUNIDNEGOC: TFloatField;
    qryContratoOrigIDENDCOBRANCA: TFloatField;
    qryContratoOrigIDCONTATO: TFloatField;
    qryContratoOrigIDFORCLI: TFloatField;
    qryContratoOrigMOECODIGO: TFloatField;
    qryContratoOrigIDRESPONSAVEL: TFloatField;
    qryContratoOrigNOMECONTRATO: TStringField;
    qryContratoOrigDESCRICAOCONTRATO: TMemoField;
    qryContratoOrigTIPOCONTRATO: TStringField;
    qryContratoOrigDATAASSINATURA: TDateTimeField;
    qryContratoOrigVALORBASECONTRATO: TFloatField;
    qryContratoOrigDATABASECONTRATO: TDateTimeField;
    qryContratoOrigDATAPREVENCERRA: TDateTimeField;
    qryContratoOrigPRAZODENUNCIA: TFloatField;
    qryContratoOrigCODCONTRATOEMPR: TStringField;
    qryContratoOrigIDENDCORRESPON: TFloatField;
    qryContratoOrigIDENDENTREGA: TFloatField;
    qryContratoOrigFLGEMPENHO: TStringField;
    qryContratoOrigDATAEFETENCERRA: TDateTimeField;
    qryContratoOrigMOTIVOENCERRA: TStringField;
    qryContratoOrigFLGFIMCONTRATO: TStringField;
    qryContratoOrigCODTIPDOC: TFloatField;
    qryContratoOrigRENOVACAO: TMemoField;
    qryContratoOrigOBSERVACAO: TMemoField;
    qryContratoOrigIDTELEFONE: TFloatField;
    qryContratoOrigIDRESERVAORCAMEN: TFloatField;
    qryContratoOrigAVISO: TFloatField;
    qryContratoOrigMOEDESC: TStringField;
    qryContratoOrigNUMRESERVA: TFloatField;
    qryContratoOrigTELCONTATO: TStringField;
    qryContratoOrigNOMECONTATO: TStringField;
    qryContratoOrigNOMEFORCLI: TStringField;
    qryContratoOrigENDCORRESP: TStringField;
    qryContratoOrigENDCOBRANCA: TStringField;
    qryContratoOrigENDENTREGA: TStringField;
    qryContratoOrigNOMEUNEG: TStringField;
    qryContratoOrigNOMERESPON: TStringField;
    qryContratoOrigNOMECENTRORESP: TStringField;
    qryContratoOrigTIPODOCDESCR: TStringField;
    qryObjxItOrigIDCONTRATO: TFloatField;
    qryObjxItOrigIDOBJETO: TFloatField;
    qryObjxItOrigIDITEM: TFloatField;
    qryObjxItOrigIDPESSOA: TFloatField;
    qryObjxItOrigMOECODIGO: TFloatField;
    qryObjxItOrigCODMEDIDA: TStringField;
    qryObjxItOrigDATABASEITEM: TDateTimeField;
    qryObjxItOrigQTDEITEM: TFloatField;
    qryObjxItOrigVALORUNITARIOOBJETO: TFloatField;
    qryObjxItOrigVALORTOTALOBJETO: TFloatField;
    qryObjxItOrigTIPOTOLERANCIAOBJETO: TStringField;
    qryObjxItOrigTOLERANCIAMAISOBJETO: TFloatField;
    qryObjxItOrigTOLERANCIAMENOSOBJETO: TFloatField;
    qryObjxItOrigNUMMEDICOES: TFloatField;
    qryObjxItOrigNUMPARCELAS: TFloatField;
    qryObjxItOrigFREQUENCIA: TStringField;
    qryObjxItOrigINTERVALO: TFloatField;
    qryObjxItOrigDATAINICIOCOBR: TDateTimeField;
    qryObjxItOrigDATAULTGERACAO: TDateTimeField;
    qryObjxItOrigDATAULTVENC: TDateTimeField;
    qryObjxItOrigOBSERVACAO: TStringField;
    qryObjxItOrigNOMEOBJETO: TStringField;
    qryObjxItOrigNOME_ITEM: TStringField;
    qryObjxItOrigMOEDESC: TStringField;
    qryObjxItOrigDESCMEDIDA: TStringField;
    qryRateioCCOrigIDCONTRATO: TFloatField;
    qryRateioCCOrigIDOBJETO: TFloatField;
    qryRateioCCOrigIDITEM: TFloatField;
    qryRateioCCOrigIDEMPRESA: TFloatField;
    qryRateioCCOrigCODCENTROCUSTO: TStringField;
    qryRateioCCOrigPERCRATEIOCONTR: TFloatField;
    qryRateioCCOrigNOMECC: TStringField;
    qryAditamentoIDADITAMENTO: TFloatField;
    qryAditamentoIDCONTRATO: TFloatField;
    qryAditamentoDATAASSADITAMENTO: TDateTimeField;
    qryAditamentoDESCADITAMENTO: TMemoField;
    qryLogAditamento: TwwQuery;
    dsLogAditamento: TwwDataSource;
    dbgAditamento: TwwDBGrid;
    qryLogAditamentoDESCRICAO: TStringField;
    qryLogAditamentoVLRANTERIOR: TMemoField;
    qryLogAditamentoVLRATUAL: TMemoField;
    qryLogAditamentoDSC_ITEM: TStringField;
    qryPagItem: TwwQuery;
    dsPagItem: TwwDataSource;
    qryPagParc: TwwQuery;
    dsPagParc: TwwDataSource;
    qryPagItemIDCONTRATO: TFloatField;
    qryPagItemIDOBJETO: TFloatField;
    qryPagItemIDITEM: TFloatField;
    qryPagItemNOMEOBJETO: TStringField;
    qryPagItemNOME_ITEM: TStringField;
    qryPagItemVALORTOTALOBJETO: TFloatField;
    qryPagItemTOT_PAGO: TFloatField;
    qryPagParcDATAVENCPARCELA: TDateTimeField;
    qryPagParcQTDEPARCELA: TFloatField;
    qryPagParcVALOROBJPARCELA: TFloatField;
    qryPagParcVLRMOEDACORRENTE: TFloatField;
    qryPagParcNUMNOTAFISCAL: TFloatField;
    qryPagItemSALDO: TFloatField;
    Label6: TLabel;
    rgTipo: TRadioGroup;
    lblContrato: TLabel;
    lblProcesso: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label13: TLabel;
    qryContratoOrigDATAINICIO: TDateTimeField;
    qryRateioCCOrigNOME_PATRO: TStringField;
    qryRateioCCOrigNOME_PLANO: TStringField;
    qryRateioCCOrigNOME_UNIDNEGOCIO: TStringField;
    tsImagens: TTabSheet;
    Cds: TCMClientDataSet;
    Ds: TwwDataSource;
    CMSql: TCMSqlParams;
    CdsIDIMAGEM: TFloatField;
    CdsIDCONTRATO: TFloatField;
    CdsPAGINA: TFloatField;
    CdsIMAGEM: TBlobField;
    CdsDESCRIMAGEM: TStringField;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton10: TToolButton;
    Label15: TLabel;
    wwDBEdit2: TwwDBEdit;
    ScrollBox1: TScrollBox;
    dbImagem: TDBImage;
    Imagem: TImage;
    spbTamOriginal: TSpeedButton;
    tbtnZoomIN: TSpeedButton;
    tbtnZoomOUT: TSpeedButton;
    tbtnPaginaInicial: TSpeedButton;
    tbtnPaginaAnterior: TSpeedButton;
    tbtnUltimaPagina: TSpeedButton;
    tbtnProximaPagina: TSpeedButton;
    qryPagItemSTATUS: TStringField;
    qryPagParcSTATUS: TStringField;
    TabSheet1: TTabSheet;
    cdsAnexos: TCMClientDataSet;
    dsDet: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    dbgrdDet: TwwDBGrid;
    PnlAnexos: TPanel;
    btnVisual: TToolbarButton97;
    btnSalva: TToolbarButton97;
    SaveDlg: TSaveDialog;
    lblDtUltimaCotacao: TLabel;
    dbEdtValorOrcado: TDBRealEdit;
    lblValorOrcado: TLabel;
    dtUltimaCotacao: TwwDBEdit;
    qryContratoOrigDATA_ULTIMA_COTACAO: TDateTimeField;
    qryContratoOrigVALOR_COTACAO: TFloatField;
    dbgCCustoSelecionados: TwwDBGrid;
    cdsCCustoSelecionados: TCMClientDataSet;
    dsCCustoSelecionados: TwwDataSource;
    tsPagamentos_Novo: TTabSheet;
    dbgrdPagtosAnalitico: TwwDBGrid;
    dsPagtosAnalitico: TwwDataSource;
    dsPagtosSintetico: TwwDataSource;
    edtVL_TOTAL_CONTRATO: TDBRealEdit;
    edtVL_PAGO_CONTRATO: TDBRealEdit;
    edtSALDO_A_PAGAR: TDBRealEdit;
    lblVlTotalContrato: TLabel;
    lblVlPagoContrato: TLabel;
    lblSaldoPagar: TLabel;
    dbgCCustoATSelecionados: TwwDBGrid;
    dsCCCustoATSelecionados: TwwDataSource;
    cdsCCustoATSelecionados: TCMClientDataSet;
    Label16: TLabel;
    cdsOrigemSaldo: TCMClientDataSet;
    dsOrigemSaldo: TwwDataSource;
    sqlOrigemSaldo: TCMSqlParams;
    cdsOrigemSaldoNOME: TStringField;
    cdsOrigemSaldoIDCONTRATO: TFloatField;
    cdsOrigemSaldoIDADITAMENTO: TFloatField;
    dbcOrigemSaldo: TDBLookupComboBox;
    cdsOrigemSaldoDATAASSINATURA: TStringField;
    cdsPagtosSintetico: TCMClientDataSet;
    sqlPagtosSintetico: TCMSqlParams;
    cdsPagtosSinteticoVL_TOTAL_CONTRATO: TFloatField;
    cdsPagtosSinteticoVL_PAGO_CONTRATO: TFloatField;
    cdsPagtosSinteticoSALDO_A_PAGAR: TFloatField;
    cdsPagtosSinteticoIDCONTRATO: TFloatField;
    lblMenos: TLabel;
    lblIgual: TLabel;
    cdsOrigemSaldoFLGSALDOTRANSFERIDO: TStringField;
    cdsPagtosSinteticoFLGSALDOTRANSFERIDO: TStringField;
    Label20: TLabel;
    cdsPagtosAnalitico: TCMClientDataSet;
    sqlPagtosAnalitico: TCMSqlParams;
    cdsPagtosAnaliticoIDCONTRATO: TFloatField;
    cdsPagtosAnaliticoIDMEDICAO: TFloatField;
    cdsPagtosAnaliticoCODDOCUMENTO: TFloatField;
    cdsPagtosAnaliticoNODOCUMENTO: TFloatField;
    cdsPagtosAnaliticoIDADITAMENTO: TFloatField;
    cdsPagtosAnaliticoDATAVENCPARCELA: TDateTimeField;
    cdsPagtosAnaliticoVALORMEDICAO: TFloatField;
    cdsPagtosAnaliticoOBS: TStringField;
    cdsPagtosAnaliticoHISTORICOCOMPL: TStringField;
    cdsOrigemSaldoFLGREINICIODASPARCELAS: TStringField;
    stStatus: TStaticText;
    TabSheet2: TTabSheet;
    dbJustNSA: TDBMemo;
    qryContratoOrigJUSTIFOPCAONAOSEAPLICA: TMemoField;
    cdsOrigemSaldoFLG_TP_VLR_ORCADO_APROVADO: TStringField;
    cdsOrigemSaldoFLGTIPO: TStringField;
    pnlRenovacao: TPanel;
    DBCheckBox1: TDBCheckBox;
    qryContratoOrigFLGFASE_ENCERRAMENTO: TStringField;
    qryContratoOrigFLGANS: TStringField;
    qryContratoOrigFLGVIGENCIAINDETERMINADA: TStringField;
    qryContratoOrigFLGSERVICOPONTUAL: TStringField;
    qryContratoOrigFLGSERVICOCONTINUADO: TStringField;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label21: TLabel;
    DBRealEdit1: TDBRealEdit;
    cdsPagtosSinteticoTOTAL_PAGO_CONTRATO: TFloatField;
    qryAditamentoCODADITAMENTO: TStringField;
    qryAditamentoFLGREINICIODASPARCELAS: TStringField;
    qryAditamentoPOSSUI_PAGAMENTO: TStringField;
    qryAditamentoTIPO: TStringField;
    qryAditamentoVL_ADITAMENTO: TFloatField;
    stCondicao: TStaticText;
    qryContratoOrigFLGRENOVACAO: TStringField;
    procedure BtnConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure dbgPagItemUpdateFooter(Sender: TObject); //Everson Cunha - SIG111798
    procedure rgTipoClick(Sender: TObject);
    procedure pgcSuperiorChange(Sender: TObject);
    procedure tbtnPaginaInicialClick(Sender: TObject);
    procedure tbtnPaginaAnteriorClick(Sender: TObject);
    procedure tbtnProximaPaginaClick(Sender: TObject);
    procedure tbtnUltimaPaginaClick(Sender: TObject);
    procedure tbtnZoomOUTClick(Sender: TObject);
    procedure tbtnZoomINClick(Sender: TObject);
    procedure DsDataChange(Sender: TObject; Field: TField);
    procedure ImagemDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTamOriginalClick(Sender: TObject);
    procedure btnVisualClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure dbcOrigemSaldoCloseUp(Sender: TObject);
    procedure dbgrdPagtosAnaliticoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgAditamentoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
    CtrlImagemContr : TCtrlImagemContr;
    CtrlContratos   : TCtrlContratos; //Everson Cunha - SIG46231

    CtrlAditamento : TCtrlAditamento; // Paulo Nobre - WO37036

    //fTotalPago : Extended; //Everson Cunha - SIG111798
    //fTotalCont : Extended; //Everson Cunha - SIG111798

    HeightImage : integer;
    WidthImage  : integer;
    AbrirImagem : boolean;

    procedure AbreTabelas(const iIdContrato, iTipo: Integer);
    procedure DefineQueries(const iTipo: Integer);
    //procedure TotalizaPagamentos; //Everson Cunha - SIG111798

    procedure VerificaBotoes;
    procedure AtributosImagem;
    procedure HabilitaBotoes;
    procedure DesabilitaBotoes;

    Procedure _AjustaLayoutDosValores;  // Paulo Nobre -  WO15750

  public
    { Public declarations }
  end;

var
  frmCadContratoOrig: TfrmCadContratoOrig;
  ListaArquivosTemp : TStringList;

implementation

{$R *.DFM}

uses USistema, dBaseDados, uCtrlPadroes; // Paulo Nobre - WO37036

procedure TfrmCadContratoOrig.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImagemContr:=TCtrlImagemContr.Create;
  CtrlImagemContr.Initialize(dtmBaseDados.dbBaseDados,True);
  CtrlImagemContr.CdsImagens:=Cds;

  //Everson Cunha - SIG46231 - Início
  CtrlContratos := TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
  CtrlContratos.Initialize(dtmBaseDados.dbBaseDados, True);
  //Everson Cunha - SIG46231 - Fim

  // Paulo Nobre - WO37036 - Inicio
  CtrlAditamento := TCtrlAditamento.Create;
  CtrlAditamento.InitializeAs(Padroes);
  // Paulo Nobre - WO37036 - Fim

  ListaArquivosTemp := TSTringList.Create;

  PgcSuperior.ActivePageIndex := 0;
  PgcInferior.ActivePageIndex := 0;

  // Paulo Nobre - WO28914 - Inicio
 // tsPagamentos.TabVisible := False; //Everson Cunha - SIG111798
 // tsPagamentos.Visible    := False; //Everson Cunha - SIG111798
 // Paulo Nobre - WO28914 - Fim

  MSContrato.Filtro.Add('IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                         'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');

  AbreTabelas( -1, rgTipo.ItemIndex );
  AbrirImagem := False;
end;

procedure TfrmCadContratoOrig.BtnConsultaClick(Sender: TObject);
begin
  MSContrato.Executar;
  if MSContrato.RetornouValor then begin
    AbreTabelas( StrToInt(MSContrato.ValoresChave[0]), rgTipo.ItemIndex );
    Imagem.Picture := DbImagem.Picture;
    Imagem.AutoSize := True;
    stCondicao.visible := False;       // Paulo Nobre -  WO37036
    dbcOrigemSaldoCloseUp(self);       // Paulo Nobre -  WO28914
    if cds.RecordCount > 0 then begin
      // Guarda o tamanho original da imagem - Marcio Motta - Pendência: 16567
      HeightImage := Imagem.Height;
      WidthImage  := Imagem.Width;
      HabilitaBotoes;
      AbrirImagem := True;
    end else begin
      DesabilitaBotoes;
      AbrirImagem := False;
    end;
  end;
end;


procedure TfrmCadContratoOrig.AbreTabelas(const iIdContrato, iTipo: Integer);
begin
  DefineQueries( iTipo );

  //Carrega Cds Principal com as imagens do contrato
  Cds.Data:=CtrlImagemContr.ListImagensContr(iIdContrato); //vazio
  CdsAnexos.Data := CtrlImagemContr.ListaAnexos(iIdContrato); // tavares - pendência 17275

  qryContratoOrig.Close;
  qryContratoOrig.ParamByName('IDCONTRATO').AsInteger := iIdContrato;
  qryContratoOrig.Open;

  qryObjxItOrig.Close;
  qryObjxItOrig.ParamByName('IDCONTRATO').AsInteger := iIdContrato;
  qryObjxItOrig.Open;

  qryRateioCCOrig.Close;
  qryRateioCCOrig.ParamByName('IDCONTRATO').AsInteger := iIdContrato;
  qryRateioCCOrig.ParamByName('IDITEM').AsInteger     := qryObjxItOrigIDITEM.AsInteger;
  qryRateioCCOrig.ParamByName('IDOBJETO').AsInteger   := qryObjxItOrigIDOBJETO.AsInteger;
  qryRateioCCOrig.Open;

  qryAditamento.Close;
  qryAditamento.ParamByName('IDCONTRATO').AsInteger := iIdContrato;
  qryAditamento.Open;

  qryLogAditamento.Close;
  qryLogAditamento.Open;

  //Everson Cunha - SIG111798 - Ini
  //qryPagItem.Close;
  //qryPagItem.ParamByName('IDCONTRATO').AsInteger := iIdContrato;
  //qryPagItem.Open;

  //qryPagParc.Close;
  //qryPagParc.Open;

 // qryPagtosAnalitico.Close;
 // qryPagtosAnalitico.Open;

//  qryPagtosSintetico.Close;  // Paulo Nobre -  WO15750
//  qryPagtosSintetico.Open;

  //Everson Cunha - SIG111798 - Fim

  if iIdContrato > 0 then begin
    lblContrato.Caption := 'Contrato: '+TRIM(qryContratoOrigNOMECONTRATO.AsString);
    lblProcesso.Caption := 'Processo: '+TRIM(qryContratoOrigCODCONTRATOEMPR.AsString);
  end else begin
    lblContrato.Caption := 'Contrato: ';
    lblProcesso.Caption := 'Processo: ';
  end;

  //TotalizaPagamentos; //Everson Cunha - SIG111798

  //Carrega área gestora do contrato
  cdsCCustoSelecionados.Data := CtrlContratos.ListAreaGestora(iIdContrato, 'S'); //Everson Cunha - SIG46231

  // WO7471 - Contratos e Projetos - Cadastro de Contratos - Área técnica
  // Alterado por Arnaldo V. Scarin em 31/01/2024
  // Incluir os dados da Área Técnica do Contrato
  cdsCCustoATSelecionados.Data := CtrlContratos.ListAreaTecnica(iIdContrato, 'S');

  // Paulo Nobre -  WO15750 - Inicio
  // Carrega combo da origem do movimento da saldo
  cdsOrigemSaldo.Data := CtrlContratos._ListaOrigemSaldo(iIdContrato);
  dbcOrigemSaldo.KeyValue := dbcOrigemSaldo.ListSource.DataSet.FieldByName(dbcOrigemSaldo.KeyField).Value;

  // Carrega valores
  cdsPagtosSintetico.Data := CtrlContratos._ListaSaldoSinteticoOrigem(iIdContrato, 0);

  _AjustaLayoutDosValores;

  // Carregando o movimento analitico do contrato (default)
  cdsPagtosAnalitico.Data := CtrlContratos._ListaMovimentoAnaliticoOrigem(iIdContrato, 0);
  // Paulo Nobre -  WO15750 - Fim
end;

//Everson Cunha - SIG111798 - Ini
{procedure TfrmCadContratoOrig.TotalizaPagamentos;
begin
  // Totaliza o valor pago
  fTotalPago := 0;
  fTotalCont := 0;
  qryPagItem.DisableControls;
  qryPagItem.First;
  while not qryPagItem.Eof do begin
    fTotalPago := fTotalPago + qryPagItemTOT_PAGO.AsFloat;
    fTotalCont := fTotalCont + qryPagItemVALORTOTALOBJETO.AsFloat;
    qryPagItem.Next;
  end;
  qryPagItem.First;
  qryPagItem.EnableControls;
end; }
//Everson Cunha - SIG111798 - Fim

procedure TfrmCadContratoOrig.rgTipoClick(Sender: TObject);
begin
  inherited;

  //Everson Cunha - SIG78742 - Início
  if rgTipo.ItemIndex = 0 then
  begin
    MSContrato.Tabelas.Clear;
    MSContrato.Colunas.Clear;
    MSContrato.CamposChave.Clear;
    MSContrato.Filtro.Clear;

    MSContrato.Tabelas.Add(' CONTRATOCONTR ');
    MSContrato.Tabelas.Add(' PESSOA ');

    MSContrato.Colunas.Add(' CONTRATOCONTR.DATAASSINATURA ');
    MSContrato.Colunas.Add(' CONTRATOCONTR.NOMECONTRATO ');
    MSContrato.Colunas.Add(' CONTRATOCONTR.CODCONTRATOEMPR ');
    MSContrato.Colunas.Add(' PESSOA.RAZAOSOCIAL ');

    MSContrato.CamposChave.Add(' CONTRATOCONTR.IDCONTRATO ');

    MSContrato.Filtro.Add(' CONTRATOCONTR.IDFORCLI = PESSOA.IDPESSOA(+) ');
  end
  else
  begin
    MSContrato.Tabelas.Clear;
    MSContrato.Colunas.Clear;
    MSContrato.CamposChave.Clear;
    MSContrato.Filtro.Clear;

    MSContrato.Tabelas.Add(' CONTRATOORIG ');
    MSContrato.Tabelas.Add(' PESSOA ');

    MSContrato.Colunas.Add(' CONTRATOORIG.DATAASSINATURA ');
    MSContrato.Colunas.Add(' CONTRATOORIG.NOMECONTRATO ');
    MSContrato.Colunas.Add(' CONTRATOORIG.CODCONTRATOEMPR ');
    MSContrato.Colunas.Add(' PESSOA.RAZAOSOCIAL ');

    MSContrato.CamposChave.Add(' CONTRATOORIG.IDCONTRATO ');

    MSContrato.Filtro.Add(' CONTRATOORIG.IDFORCLI = PESSOA.IDPESSOA(+) ');
  end;

  MSContrato.Filtro.Add('IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                         'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
  //Everson Cunha - SIG78742 - Fim

  AbreTabelas( qryContratoOrigIDCONTRATO.AsInteger, rgTipo.ItemIndex );
end;

//Everson Cunha - SIG111798 - Ini
{procedure TfrmCadContratoOrig.dbgPagItemUpdateFooter(Sender: TObject);
begin
  inherited;
  dbgPagItem.ColumnByName('TOT_PAGO').FooterValue := FormatFloat('###,###0.00', fTotalPago);
  dbgPagItem.ColumnByName('VALORTOTALOBJETO').FooterValue := FormatFloat('###,###0.00', fTotalCont);
  dbgPagItem.ColumnByName('SALDO').FooterValue := FormatFloat('###,###0.00', fTotalCont - fTotalPago);
end;}
//Everson Cunha - SIG111798 - Fim

procedure TfrmCadContratoOrig.DefineQueries(const iTipo: Integer);
var sSql : String;
begin
   // Seleciona Contratos
   sSql := 'SELECT '+#13+
           '   C.IDCONTRATO,     C.CODPORTFORMA,      C.CODCENTRORESPON,  C.IDPESSOA,        '+#13+
           '   C.UNIDNEGOC,      C.IDCONTATO,         C.IDFORCLI,         C.MOECODIGO,       '+#13+
           //'   C.NOMECONTRATO,   C.DESCRICAOCONTRATO, C.CODAUXCONTRATO,   C.TIPOCONTRATO,    '+#13+
           '   C.NOMECONTRATO,   C.DESCRICAOCONTRATO,                     C.TIPOCONTRATO,    '+#13+
           '   C.DATAASSINATURA, C.VALORBASECONTRATO, C.DATABASECONTRATO, C.DATAPREVENCERRA, '+#13+
           '   C.PRAZODENUNCIA,  C.CODCONTRATOEMPR,   C.FLGEMPENHO,       C.DATAEFETENCERRA, '+#13+
           '   C.MOTIVOENCERRA,  C.FLGFIMCONTRATO,    C.CODTIPDOC,        C.RENOVACAO,       '+#13+
           '   C.OBSERVACAO,     C.IDTELEFONE,        C.IDRESERVAORCAMEN, C.AVISO,           '+#13+
           '   M.MOEDESC,        C.IDRESPONSAVEL,     C.IDENDCORRESPON,   C.IDENDCOBRANCA,   '+#13+
           '   C.IDENDENTREGA,   R.NUMRESERVA,        C.DATAINICIO, '+#13+
           '   CAST(substr(RTRIM(T.DDI)||DECODE(T.DDI,'''','''',''-'')||DECODE(T.DDD,'''','''',''('')||RTRIM(T.DDD)||DECODE(T.DDD,'''','''','') '')||T.NUMERO||DECODE(TC.RAMAL,'''','' '',''/R.'')||TC.RAMAL,1,254 ) AS VARCHAR2(254)) AS  TELCONTATO, '+#13+ // SOL 200245 KINTANA 1929615
           '   CP.NOME       AS NOMECONTATO, '+#13+
           '   P.RAZAOSOCIAL AS NOMEFORCLI,  '+#13+
           '   CAST(substr(RTRIM(ECOR.LOGRADOURO)||'' ''||RTRIM(ECOR.NUMERO)||'' ''||RTRIM(ECOR.COMPLEMENTO)||'' ''||RTRIM(ECOR.BAIRRO)||'' ''||RTRIM(CDCOR.NOME)||DECODE(ECOR.CEP,'''','' '','' CEP:'')||RTRIM(ECOR.CEP),1,254 ) AS VARCHAR2(254)) AS ENDCORRESP,  '+#13+ // SOL 200245 KINTANA 1929615
           '   CAST(substr(RTRIM(ECOB.LOGRADOURO)||'' ''||RTRIM(ECOB.NUMERO)||'' ''||RTRIM(ECOB.COMPLEMENTO)||'' ''||RTRIM(ECOB.BAIRRO)||'' ''||RTRIM(CDCOB.NOME)||DECODE(ECOB.CEP,'''','' '','' CEP:'')||RTRIM(ECOB.CEP),1,254 ) AS VARCHAR2(254)) AS ENDCOBRANCA, '+#13+ // SOL 200245 KINTANA 1929615
           '   CAST(substr(RTRIM(EENT.LOGRADOURO)||'' ''||RTRIM(EENT.NUMERO)||'' ''||RTRIM(EENT.COMPLEMENTO)||'' ''||RTRIM(EENT.BAIRRO)||'' ''||RTRIM(CDENT.NOME)||DECODE(EENT.CEP,'''','' '','' CEP:'')||RTRIM(EENT.CEP),1,254 ) AS VARCHAR2(254)) AS ENDENTREGA,  '+#13+ // SOL 200245 KINTANA 1929615
           '   U.NOME       AS NOMEUNEG,       '+#13+
           '   PRES.NOME    AS NOMERESPON,     '+#13+
           '   CR.NOME      AS NOMECENTRORESP, '+#13+
           '   TD.DESCRICAO AS TIPODOCDESCR,   '+#13+
           '   C.DATA_ULTIMA_COTACAO,          '+#13+ //Everson Cunha - SIG46231
           '   C.VALOR_ORCADO,                 '+#13+ //Everson Cunha - SIG46231
           '   C.JUSTIFOPCAONAOSEAPLICA        '+#13; // Paulo Nobre - WO13506
   // Paulo Nobre - WO20717 - Inicio
   if iTipo = 0 then
   begin
      sSql := sSql + '   ,NVL(C.FLGRENOVACAO,''N'') FLGRENOVACAO  '+#13+
                     '   ,C.FLGFASE_ENCERRAMENTO                  '+#13+
                     '   ,C.FLGANS                                '+#13+
                     '   ,C.FLGVIGENCIAINDETERMINADA              '+#13+
                     '   ,C.FLGSERVICOPONTUAL                     '+#13+
                     '   ,C.FLGSERVICOCONTINUADO                  '+#13;
   end;

   sSql := sSql + 'FROM '+#13;
   // Paulo Nobre - WO20717 - Fim

   if iTipo = 0 then
        sSql := sSql + ' CONTRATOCONTR C,' +#13
   else sSql := sSql + ' CONTRATOORIG  C,' +#13;

   sSql := sSql +
           '   MOEDA M,         ' +#13+
           '   RESERVAORCAMEN R,' +#13+
           '   TELENDPESS T,    ' +#13+
           '   TELCONTATO TC,   ' +#13+
           '   CONTATOPESS CP,  ' +#13+
           '   PESSOA P,        ' +#13+
           '   UNIDNEGOCIO U,   ' +#13+
           '   CENTRESPON CR,   ' +#13+
           '   TIPODOCRECPAG TD,' +#13+
           '   ENDPESS ECOR,    ' +#13+
           '   CIDADES CDCOR,   ' +#13+
           '   ENDPESS ECOB,    ' +#13+
           '   CIDADES CDCOB,   ' +#13+
           '   ENDPESS EENT,    ' +#13+
           '   CIDADES CDENT,   ' +#13+
           '   RESPONSAVEL RES, ' +#13+
           '   PESSOA PRES      ' +#13+
           'WHERE ' +#13+
           '      (C.IDCONTRATO = :IDContrato) ' +#13+
           '  AND (C.MOECODIGO = M.MOECODIGO(+)) ' +#13+
           '  AND (C.IDRESERVAORCAMEN = R.IDRESERVAORCAMEN(+)) ' +#13+
           '  AND (C.IDCONTATO = TC.IDCONTATO(+)) ' +#13+
           '  AND (TC.IDTELEFONE = T.IDTELEFONE(+)) ' +#13+
           '  AND (C.IDCONTATO = CP.IDCONTATO(+)) ' +#13+
           '  AND (C.IDFORCLI = P.IDPESSOA(+)) ' +#13+
           '  AND (C.UNIDNEGOC = U.UNIDNEGOC(+)) ' +#13+
           '  AND (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) ' +#13+
           '  AND (C.CODTIPDOC = TD.CODTIPDOC(+)) ' +#13+
           '  AND (C.IDENDCORRESPON = ECOR.IDENDERECO(+)) ' +#13+
           '  AND (ECOR.IDCIDADES = CDCOR.IDCIDADES(+)) ' +#13+
           '  AND (C.IDENDCOBRANCA = ECOB.IDENDERECO(+)) ' +#13+
           '  AND (ECOB.IDCIDADES  = CDCOB.IDCIDADES(+)) ' +#13+
           '  AND (C.IDENDENTREGA = EENT.IDENDERECO(+)) ' +#13+
           '  AND (EENT.IDCIDADES = CDENT.IDCIDADES(+)) ' +#13+
           '  AND (C.IDRESPONSAVEL = RES.IDRESPONSAVEL(+)) ' +#13+
           '  AND (RES.IDRESPONSAVEL = PRES.IDPESSOA(+)) ';

   qryContratoOrig.SQL.Clear;
   qryContratoOrig.SQL.Text := sSql;

   // Seleciona Objeto x ItemContratual
   sSql := 'SELECT '+#13+
           '   O.IDCONTRATO,  O.IDOBJETO,       O.IDITEM,        O.TOLERANCIAMAISOBJETO, '+#13+
           '   O.MOECODIGO,   O.CODMEDIDA,      O.DATABASEITEM,  O.VALORUNITARIOOBJETO, '+#13+
           '   O.QTDEITEM,    O.NUMPARCELAS,    O.TIPOTOLERANCIAOBJETO, '+#13+
           '   O.IDPESSOA,    O.NUMMEDICOES,    O.FREQUENCIA,    O.TOLERANCIAMENOSOBJETO, '+#13+
           '   O.INTERVALO,   O.DATAINICIOCOBR, O.DATAULTVENC,   O.VALORTOTALOBJETO, '+#13+
           '   O.DATAULTGERACAO, O.OBSERVACAO,     '+#13+
           '   OC.NOMEOBJETO, IC.NOME_ITEM,     MOEDA.MOEDESC,   UM.DESCMEDIDA '+#13+
           'FROM '+#13;

   if iTipo = 0 then
        sSql := sSql + ' OBJETOSXITEMCONTR O,' +#13
   else sSql := sSql + ' OBJXITORIG O,' +#13;

   sSql := sSql +
           '     OBJETOCONTRATUAL OC, '+#13+
           '     ITEMCONTRATUAL IC, '+#13+
           '     MOEDA, '+#13+
           '     UNMEDIDA UM '+#13+
           'WHERE IDCONTRATO = :IDCONTRATO '+#13+
           '      AND O.IDOBJETO = OC.IDOBJETO '+#13+
           '      AND O.IDITEM = IC.IDITEM '+#13+
           '      AND O.MOECODIGO = MOEDA.MOECODIGO(+) '+#13+
           '      AND O.CODMEDIDA = UM.CODMEDIDA(+) '+#13+
           'ORDER BY  OC.NOMEOBJETO, IC.NOME_ITEM ';

   qryObjxItOrig.SQL.Clear;
   qryObjxItOrig.SQL.Text := sSql;

   // Seleciona Rateio x Objeto
   sSql := 'SELECT '+#13+
           '    R.IDCONTRATO, R.IDOBJETO, R.IDITEM, R.IDEMPRESA,     '+#13+
           '    R.CODCENTROCUSTO, R.PERCRATEIOCONTR, CC.NOME NOMECC, '+#13+
           '    PA.RAZAOSOCIAL AS NOME_PATRO, PL.NOME AS NOME_PLANO, '+#13+
           '    UN.NOME        AS NOME_UNIDNEGOCIO                   '+#13+
           'FROM ';

   if iTipo = 0 then
        sSql := sSql + ' RATEIOCENTROCUSTO R,' +#13
   else sSql := sSql + ' RATEIOCCORIG R,' +#13;

   sSql := sSql +
           '    CENTCUST CC, PLANPREVCONTABIL PL, PESSOA PA, UNIDNEGOCIO UN '+#13+
           'WHERE IDCONTRATO   = :IDCONTRATO '+#13+
           '      AND IDOBJETO = :IDOBJETO '+#13+
           '      AND IDITEM   = :IDITEM '+#13+
           '      AND R.IDEMPRESA = CC.IDEMPRESA '+#13+
           '      AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO '+#13+
           '      AND R.IDPATRO        = PA.IDPESSOA(+) '+#13+
           '      AND R.IDPLANOPREV    = PL.IDPLANOPREV(+) '+#13+
           '      AND R.IDPESSOA       = UN.IDPESSOA(+) '+#13+
           '      AND R.UNIDNEGOC      = UN.UNIDNEGOC(+) '+#13+
           'ORDER BY CC.NOME ';

   qryRateioCCOrig.SQL.Clear;
   qryRateioCCOrig.SQL.Text := sSql;

end;


procedure TfrmCadContratoOrig.pgcSuperiorChange(Sender: TObject);
begin
  inherited;
  // Marcio Motta
  if pgcSuperior.ActivePageIndex in [7, 8] then begin
    pgcInferior.Visible := False;
    Imagem.Align := alNone;
  end else
    pgcInferior.Visible := True;
end;

procedure TfrmCadContratoOrig.tbtnPaginaInicialClick(Sender: TObject);
begin
  inherited;
  Cds.First;
  AtributosImagem;
end;

procedure TfrmCadContratoOrig.tbtnPaginaAnteriorClick(Sender: TObject);
begin
  inherited;
  Cds.Prior;
  AtributosImagem;
end;

procedure TfrmCadContratoOrig.tbtnProximaPaginaClick(Sender: TObject);
begin
  inherited;
  Cds.Next;
  AtributosImagem;
end;

procedure TfrmCadContratoOrig.tbtnUltimaPaginaClick(Sender: TObject);
begin
  inherited;
  Cds.Last;
  AtributosImagem;
end;

procedure TfrmCadContratoOrig.tbtnZoomOUTClick(Sender: TObject);
begin
  inherited;
  if Assigned(Imagem.Picture) then begin
    if ( Imagem.Width > (WidthImage * 0.3) ) then begin
       Imagem.AutoSize := False;
       Imagem.Stretch  := True;
       Imagem.Height   := Trunc(Imagem.Height / 1.1);
       Imagem.Width    := Trunc(Imagem.Width  / 1.1);
    end;
    VerificaBotoes;
  end else
    EXIT;
end;

procedure TfrmCadContratoOrig.tbtnZoomINClick(Sender: TObject);
begin
  inherited;
  if Assigned(Imagem.Picture) then begin
    if Imagem.Width < (WidthImage * 2) then begin
       Imagem.AutoSize := False;
       Imagem.Stretch  := True;
       Imagem.Height   := Trunc(Imagem.Height * 1.1);
       Imagem.Width    := Trunc(Imagem.Width  * 1.1);
    end;
    VerificaBotoes;
  end else
    EXIT;
end;

procedure TfrmCadContratoOrig.AtributosImagem;
begin
  HeightImage := Imagem.Height;
  WidthImage  := Imagem.Width;
  spbTamOriginal.Enabled := False;
end;

procedure TfrmCadContratoOrig.DesabilitaBotoes;
begin
  spbTamOriginal.Enabled     := False;
  tbtnZoomIN.Enabled         := False;
  tbtnZoomOUT.Enabled        := False;
  tbtnPaginaInicial.Enabled  := False;
  tbtnPaginaAnterior.Enabled := False;
  tbtnProximaPagina.Enabled  := False;
  tbtnUltimaPagina.Enabled   := False;
end;

procedure TfrmCadContratoOrig.HabilitaBotoes;
begin
  tbtnZoomIN.Enabled         := True;
  tbtnZoomOUT.Enabled        := True;
  tbtnPaginaInicial.Enabled  := True;
  tbtnPaginaAnterior.Enabled := True;
  tbtnProximaPagina.Enabled  := True;
  tbtnUltimaPagina.Enabled   := True;
end;

procedure TfrmCadContratoOrig.VerificaBotoes;
begin
  // Verifica se habilita ou desabilita os botões de Zoom - Marcio Motta - Pendência: 16567
  if (Imagem.Width > (WidthImage * 2) ) then
    tbtnZoomIN.Enabled := False
  else
    tbtnZoomIN.Enabled := True;

  if ( Imagem.Width < (WidthImage * 0.3) )then
    tbtnZoomOUT.Enabled := False
  else
    tbtnZoomOUT.Enabled := True;

  if ( Imagem.Width <> WidthImage) then
    spbTamOriginal.Enabled := True
  else
    spbTamOriginal.Enabled := False;
end;

procedure TfrmCadContratoOrig.DsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  Imagem.Picture := DBImagem.Picture;
  Imagem.Stretch  := False;
  Imagem.AutoSize := True;
  AtributosImagem;
end;

procedure TfrmCadContratoOrig.ImagemDblClick(Sender: TObject);
var
   sFileName : string;
   i : integer;
begin
  inherited;
//---------- 14/05/2004 - Marcio Motta - Pendência: 16567-------------------------------------------

  if AbrirImagem then begin
    // Busca o diretório temporário CM
    sFileName := Sistema.TempDir;

    // Adiciona '\' ao final do caminho, caso este não exista
    if sFileName[ length( sFileName ) ] <> '\' then sFileName := sFileName + '\';

    // Monta um nome para o arquivo temporário
    Randomize;
    sFileName := sFileName + Copy( FormatFloat( '000000', GetTickCount ), 1, 6 ) +
      FormatFloat( '0000', Random( 10000 ) ) + '.bmp';

    // Salva o arquivo
    DBImagem.Picture.Bitmap.SaveToFile( sFileName );

    // Inclui em uma stringlist o nome do arquivo para deletar no fechamento do form
    ListaArquivosTemp.Add(sFileName);

    // Abre o arquivo
    ShellExecute( Self.Handle, 'open', PChar( sFileName ), '', '', SW_SHOW	);
  end else begin
    EXIT;
  end;

//------- Fim Implementação/Alteração - Marcio Motta -------------------------------
end;

procedure TfrmCadContratoOrig.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:integer;
begin
  inherited;
  if ListaArquivosTemp.Count > 0 then begin
    for i := 0 to ListaArquivosTemp.Count - 1 do begin
      DeleteFile(ListaArquivosTemp[i]);
    end;
  end;
  FreeAndNil(ListaArquivosTemp);
  CtrlContratos.Free; //Everson Cunha - SIG46231

  FreeAndNil(CtrlAditamento);   // Paulo Nobre - WO37036
end;

procedure TfrmCadContratoOrig.spbTamOriginalClick(Sender: TObject);
begin
  inherited;
  Imagem.Stretch := False;
  Imagem.AutoSize := True;
  VerificaBotoes;
end;

procedure TfrmCadContratoOrig.btnVisualClick(Sender: TObject);
var sNomeArquivo : string;
begin
  inherited;
  btnVisual.Down := false;
  sNomeArquivo := cmGetTempPath() + CdsAnexos.FieldByName( 'NOMEARQUIVO' ).AsString;
  If FileExists( sNomeArquivo ) Then
    DeleteFile( sNomeArquivo );
  TBlobField( CdsAnexos.FieldByName( 'IMAGEM' ) ).SaveToFile( sNomeArquivo );

  ShellExecute( Handle,
                'Open',
                pchar(sNomeArquivo),
                Nil,
                Nil,
                sw_shownormal );

end;

procedure TfrmCadContratoOrig.btnSalvaClick(Sender: TObject);
begin
  inherited;
  btnSalva.Down := false;
  SaveDlg.filename := cdsAnexos.FieldByName('NOMEARQUIVO').asString;
  SaveDlg.Execute;
  If FileExists( SaveDlg.filename ) Then
    DeleteFile( SaveDlg.filename );
  TBlobField( CdsAnexos.FieldByName( 'IMAGEM' ) ).SaveToFile( SaveDlg.filename );
end;

procedure TfrmCadContratoOrig.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  btnVisualClick(Sender);
end;

// Paulo Nobre -  WO15750 - Inicio
procedure TfrmCadContratoOrig.dbcOrigemSaldoCloseUp(Sender: TObject);
begin
//  inherited;
   if (dbcOrigemSaldo.KeyValue <> null) Then
   begin
     Cursor := crSQLWait;
     // Carregando as valores
     cdsPagtosSintetico.Data := CtrlContratos._ListaSaldoSinteticoOrigem(StrToInt(MSContrato.ValoresChave[0]), dbcOrigemSaldo.KeyValue);
     // Carregando o movimento analitico da origem selecionada
     cdsPagtosAnalitico.Data := CtrlContratos._ListaMovimentoAnaliticoOrigem(cdsOrigemSaldo.fieldbyname('IDCONTRATO').asInteger,
                                                                             cdsOrigemSaldo.fieldbyname('IDADITAMENTO').asInteger);
     Cursor := crDefault;

     _AjustaLayoutDosValores;
   end;
end;

// Paulo Nobre - WO38245 - Inicio

// Paulo Nobre - WO20776 - Inicio
Procedure TfrmCadContratoOrig._AjustaLayoutDosValores;
begin
  if not cdsOrigemSaldo.IsEmpty then
  begin

    lblVlTotalContrato.Caption := 'Total Contrato';

    // Paulo Nobre -  WO37036 - Inicio
    lblMenos.Visible := True;
    lblIgual.Visible := True;
    // Paulo Nobre -  WO37036 - Fim

    If dbcOrigemSaldo.KeyValue <> 0 Then
    Begin
      If (cdsOrigemSaldo.fieldbyname('FLGTIPO').asString = 'A') Then
        lblVlTotalContrato.Caption := 'Total Aditamento';
      If (cdsOrigemSaldo.fieldbyname('FLGTIPO').asString = 'C') Then
        lblVlTotalContrato.Caption := 'Total "Outros"';
       If (cdsOrigemSaldo.fieldbyname('FLGTIPO').asString = 'R') Then
        lblVlTotalContrato.Caption := 'Total "Regularização"';   // Paulo Nobre - WO31928
    End;

    if cdsOrigemSaldo.fieldbyname('FLG_TP_VLR_ORCADO_APROVADO').asString = 'N' Then  // Não se Aplica
    begin
      // Paulo Nobre -  WO37036 - Inicio
      lblMenos.Visible := False;
      lblIgual.Visible := False;
      stCondicao.visible := True;
      // Paulo Nobre -  WO37036 - Fim
    end;

    if (cdsOrigemSaldo.fieldbyname('FLGREINICIODASPARCELAS').asString = 'N') Or
          (not CtrlAditamento._VerificaSeAditamentoTemParcelamento(cdsOrigemSaldo.fieldbyname('IDCONTRATO').asInteger, cdsOrigemSaldo.fieldbyname('IDADITAMENTO').asInteger)) Then
    begin
      stStatus.Caption := 'Parcelas não Reiniciadas.';
      stStatus.Font.Color := clRed;
    end
    else if (cdsOrigemSaldo.fieldbyname('FLGSALDOTRANSFERIDO').asString = 'S') or
            (cdsOrigemSaldo.fieldbyname('FLGSALDOTRANSFERIDO').asString = 'I' ) Then // Indisponivel
    begin
      stStatus.Caption := 'Indisponivel para Medições.';
      stStatus.Font.Color := clBlue;
    end
    else if ((cdsOrigemSaldo.fieldbyname('FLGSALDOTRANSFERIDO').asString = 'N') and (cdsPagtosSintetico.fieldbyname('SALDO_A_PAGAR').asFloat > 0))
            Or (cdsOrigemSaldo.fieldbyname('FLG_TP_VLR_ORCADO_APROVADO').asString = 'N') Then
    begin
         stStatus.Caption := 'Disponivel para Medições.';
         stStatus.Font.Color := clGreen;
    end
    else
    begin
        stStatus.Caption := 'Indisponivel para Medições.';
        stStatus.Font.Color := clBlue;
    end;
    // Paulo Nobre -  WO28914 - Fim
   end;
end;
// Paulo Nobre -  WO15750 - Fim
// Paulo Nobre - WO20776 - Fim

    // Paulo Nobre -  WO37036 - Inicio
{
    else if cdsOrigemSaldo.fieldbyname('FLG_TP_VLR_ORCADO_APROVADO').asString = 'N' Then
    begin
      stStatus.Caption := 'Disponivel para Medição';
      stStatus.Font.Color := clGreen;
    end
}
    // Paulo Nobre -  WO37036 - Fim
//    else
    // Paulo Nobre -  WO28914 - Inicio
//    begin

// Paulo Nobre - WO38245 - Fim


procedure TfrmCadContratoOrig.dbgrdPagtosAnaliticoTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  Try
    If (Not cdsPagtosAnalitico.Active) Or
       (cdsPagtosAnalitico.IsEmpty) Or
       (AFieldName <> 'DATAVENCPARCELA') Then
      Exit;

      If (Trim(cdsPagtosAnalitico.IndexName) = Trim('asc' + AFieldName)) Then
         cdsPagtosAnalitico.IndexName := 'desc' + AFieldName
      Else
         cdsPagtosAnalitico.IndexName := 'asc' + AFieldName;
  Finally
    cdsPagtosAnalitico.First;
  End;
end;

// Paulo Nobre -  WO28914 - Inicio
procedure TfrmCadContratoOrig.dbgAditamentoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if Highlight then
    Exit;

  // Garante apenas a coluna FLGREINICIODASPARCELAS
  if Assigned(Field) and SameText(Field.FieldName, 'FLGREINICIODASPARCELAS') then
  begin
    if Field.IsNull then
      Exit;

    if SameText(Field.AsString, 'Não') then
    begin
    //  ABrush.Color := $CCCCFF;  // fundo (tom claro); você pode usar clRed, clMoneyGreen etc.
      AFont.Color  := clRed;    // fonte
      AFont.Style := AFont.Style + [fsBold]; // opcional: negrito
    end
    else
    begin
      // cores padrão para outros valores
      ABrush.Color := clWindow;
      AFont.Color  := clWindowText;
      AFont.Style := [];
    end;
  end;

  // Garante apenas a coluna POSSUI_PAGAMENTO
  if Assigned(Field) and SameText(Field.FieldName, 'POSSUI_PAGAMENTO') then
  begin
    if Field.IsNull then
      Exit;

    if SameText(Field.AsString, 'Sim') then
    begin
    //  ABrush.Color := $CCCCFF;  // fundo (tom claro); 
      AFont.Color  := clblue;    // fonte
      AFont.Style := AFont.Style + [fsBold]; // opcional: negrito
    end
    else
    begin
      // cores padrão para outros valores
      ABrush.Color := clWindow;
      AFont.Color  := clWindowText;
      AFont.Style := [];
    end;
  end;
end;
// Paulo Nobre -  WO28914 - Fim

end.

