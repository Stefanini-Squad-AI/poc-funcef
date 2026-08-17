{
***************************** REGISTRO DE ALTERAÇÕES **********************************
***************************************************************************************
--------------------------------------------------------------------------------------
Pendência   : WO28156
Responsável : Leandro
Data        : 02/12/2025
Descrição   : Retirdo AS da consulta SQL
--------------------------------------------------------------------------------------
Pendência   : MIGRACAO-ORACLE
Responsável : Edilane
Data        : 14/10/2025
Descrição   : Casting de campos, remover aspas, espaços e acentos dos nomes de campos
--------------------------------------------------------------------------------------
Alteracao   : ContabilizaRecebimentoBoleto e LancaTmpDesc
Pendência   : WO22455
Responsável : Luis Ferrari
Data        : 09/06/2025
Descrição   : Alterar a data sysdate para a data do Lote contabil.
--------------------------------------------------------------------------------------
Alteracao   : ExecutarRecebimento
Pendência   : WO13993
Responsável : Helen V Bianchi
Data        : 27/09/2024
Descrição   : Alterar a HSTDIVIDABENEFICIO 2-enviada e nao recebida , caso nao seja
              Recebida.
--------------------------------------------------------------------------------------
Alteracao   : ExecutarEnvio, BaixaDocumentoNaoRecebido, ContabilizaRecebimentoBoleto
Pendência   : 136150
Responsável : leandro
Data        : 27/07/2023
Descrição   : alterar a conta contábil no momento de gerar/baixar os boletos emitidos
--------------------------------------------------------------------------------------
Alteracao   : ExecutarEnvio, ContabilizaRecebimentoBoleto
Pendência   : 126276
Responsável : edilaine
Data        : 11/07/2023
Descrição   : Historico de Movimentos da Divida
---------------------------------------------------------------------------------------
Alteracao   : VerificarRecebimentoTMPDESC, ExecutarDesfazerEnvio
Pendência   : 134478
Responsável : edilaine
Data        : 10/04/2023
Descrição   : Nao permite desfazer envio - aviso que previa foi executada
--------------------------------------------------------------------------------
Alteracao   : (dfm tsDividaBenef, updCap)
Pendência   : 132927
Responsável : Luis Ferrari
Data        : 23/02/2023
Descrição   : Ajuste no plano financeiro do rateio na emissão do boleto
--------------------------------------------------------------------------------
Alteracao   : dfm e pass
Pendência   : 115304
Responsável : edilaine
Data MERGE  : 25/01/2023
Data        : 21/10/2021
Descrição   : Contabilização da Provisão de Perdas para DFívidas Beneficio
--------------------------------------------------------------------------------
Rotina      : ExecutarPreparo
Pendência   : 131706
Responsável : Edilaine
Data        : 10/01/2023
Descrição   : Ajuste na arredondamento do indice de reajuste da dividA
--------------------------------------------------------------------------------
Rotina      : RetornaIndiceAcumulado
Pendência   : 131253
Responsável : Luis Ferrari
Data        : 23/12/2022
Descrição   : Ajuste na rotina de datas e periodo no reajuste da dívida
------------------------------------------------------------------------------
Rotina      : UpdateHSTDIVIDABENEFICIO
Pendência   : 128237
Responsável : Edilaine
Data        : 23/08/2022
Descrição   : Data inicial da divida fixa em dia 20 ou proximo dia util
------------------------------------------------------------------------------
Alterações  : .DFM  reestruturação da funconalidade
Pendência   : SIG 33744 (SOL 231442/18314)
Responsável : BRUNO AZEVEDO DOS SANTOS / William Santana / Edilaine
Data        : 27/07/2018
Descrição   : Criação dos campos Status, Observação e Numprocinss das dívidas de benefícios,
              assim como a mudança de diversos controles da funcionalidade.
              reajustar dívidas de benefícios vinculadas ao plano REG REPLAN-não Saldada
              em janeiro
---------------------------------------------------------------------------------------
}

unit FCtrlDiviBenef_Novo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls, StdCtrls, Spin, TB97Ctls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  MontaSelect,uCtrlPadroes,uCtrlDocumento,UMensErro,UDataBase,UAdmPrev,USistema,DBaseDados,
  ppVar, ppModule, raCodMod, ppBands, jpeg, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppParameter,FPreview,FSelecionaLote, uIntegraBack, UDiasUteis,
  FCtrlDivBenefContab, UIntegraPrevRH, ComObj, fPreviewExportD,  //edilaine SIG115304
  //edilaine - SIG33744 - inicio
  ppEndUsr, ppStrtch, ppMemo, ppBarCod, DBClient, uCtrlGeraBoleto, FPreviewExport,
  uCMClientDataSet, uCmSqlParams, ppTypes, ppForms, UFuncoesUteis, UBeneficio,
  QExport3Dialog, QExport3, UControleDividaBenef, ImgList;

type
  TFrmCtrlDiviBenef_Novo = class(TfrmSairAjuda)
    Toolbar971: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsDet: TwwDataSource;
    MontaSelect: TMontaSelect;
    qryDetSelecionar: TStringField;
    qryDetMatricula: TStringField;
    qryDetNome: TStringField;
    qryDetPlanoContab: TFloatField;
    qryDetBeneficio: TStringField;
    qryDetDtLancDivida: TDateTimeField;
    qryDetVlrBenef: TFloatField;
    qryDetSaldoDevIni: TFloatField;
    qryDetSaldoDevAtual: TFloatField;
    qryDetSaldoBaixaDef: TFloatField;
    qryDetUltParcela: TFloatField;
    qryDetVlrParcela: TFloatField;
    qryDetIniCobr: TDateTimeField;
    qryDetFimCobr: TDateTimeField;
    qryDetPercentual: TFloatField;
    qryDetQtdePagas: TFloatField;
    qryDetQtdeParcelas: TFloatField;
    qryDetAtualizarSaldo: TStringField;
    qryDetIDCONTROLEDIVIDABENEFICIO: TFloatField;
    qryDetIDHSTORICODIVIDABENEFICIO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPLANPREVCONTAB: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryRelatorio: TwwQuery;
    dsControleDivida: TwwDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    UpdateSQL1: TUpdateSQL;
    ppParameterList1: TppParameterList;
    qryRelatorioSelecionar: TStringField;
    qryRelatorioMatricula: TStringField;
    qryRelatorioNome: TStringField;
    qryRelatorioPlanoContab: TFloatField;
    qryRelatorioBeneficio: TStringField;
    qryRelatorioDtLancDivida: TDateTimeField;
    qryRelatorioVlrBenef: TFloatField;
    qryRelatorioSaldoDevIni: TFloatField;
    qryRelatorioSaldoDevAtual: TFloatField;
    qryRelatorioUltParcela: TFloatField;
    qryRelatorioVlrParcela: TFloatField;
    qryRelatorioIniCobr: TDateTimeField;
    qryRelatorioFimCobr: TDateTimeField;
    qryRelatorioPercentual: TFloatField;
    qryRelatorioQtdePagas: TFloatField;
    qryRelatorioQtdeParcelas: TFloatField;
    qryRelatorioAtualizarSaldo: TStringField;
    qryRelatorioFLGSITUACAO: TFloatField;
    qryRelatorioIDCONTROLEDIVIDABENEFICIO: TFloatField;
    qryRelatorioIDHSTORICODIVIDABENEFICIO: TFloatField;
    qryRelatorioIDPESSOA: TFloatField;
    qryRelatorioIDTITULAR: TFloatField;
    qryRelatorioIDPESSJUR: TFloatField;
    qryRelatorioIDBENEFICIO: TFloatField;
    qryRelatorioIDPLANOPREV: TFloatField;
    qryRelatorioIDMOTIVO: TFloatField;
    qryRelatorioCODDOCUMENTO: TStringField;
    ppTitleBand1: TppTitleBand;
    ppLabel41: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel56: TppLabel;
    ppLabel68: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppShape17: TppShape;
    ppDBCol2: TppDBText;
    ppDBCol3: TppDBText;
    ppDBCol4: TppDBText;
    ppDBCol5: TppDBText;
    ppDBCol6: TppDBText;
    ppDBCol7: TppDBText;
    ppDBCol8: TppDBText;
    ppDBCol9: TppDBText;
    ppDBCol10: TppDBText;
    ppDBCol13: TppDBText;
    ppDBCol14: TppDBText;
    ppDBCol15: TppDBText;
    ppDBCol16: TppDBText;
    ppDBCol17: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel31: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    qryDetCODDOCUMENTO: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetNUMEROPARCELA: TFloatField;
    qryDetFONTEPAGADORA: TFloatField;
    ppDBCol12: TppDBText;
    qryDetSITUACAODIVIDA: TStringField;
    qryDetDATAPREVISTA: TDateTimeField;
    qryDetVALORPREVISTO: TFloatField;
    qryDetFLGDESCFOLHA: TStringField;
    qryDetOBSERVACAO: TStringField;
    qryDetFLGSITUACAO: TFloatField;
    ppDBCol11: TppDBText;
    ppDBCol18: TppDBText;
    qryDetSTATUSDIVIDA: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryDetPRIMEIROMESCOBR: TStringField;
    qryDetFLGSTATUS: TFloatField;
    qryDetMostraGrid: TStringField;
    ppShape20: TppShape;
    ppShape21: TppShape;
    pplblCol2: TppLabel;
    ppShape22: TppShape;
    pplblCol3: TppLabel;
    ppShape23: TppShape;
    pplblCol4: TppLabel;
    ppShape24: TppShape;
    pplblCol6: TppLabel;
    ppShape25: TppShape;
    pplblCol7: TppLabel;
    ppShape26: TppShape;
    pplblCol8: TppLabel;
    ppShape27: TppShape;
    pplblCol9: TppLabel;
    ppShape29: TppShape;
    pplblCol10: TppLabel;
    ppShape30: TppShape;
    ppShape31: TppShape;
    pplblCol13: TppLabel;
    ppShape32: TppShape;
    pplblCol14: TppLabel;
    ppShape33: TppShape;
    ppShape34: TppShape;
    pplblCol16: TppLabel;
    ppShape35: TppShape;
    pplblCol17: TppLabel;
    pplblCol15: TppLabel;
    pplblCol5: TppLabel;
    ppShape36: TppShape;
    pplblCol11: TppLabel;
    ppShape37: TppShape;
    pplblCol18: TppLabel;
    ppGroup2: TppGroup;
    pgrphdrbnd1: TppGroupHeaderBand;
    pgrpftrbnd1: TppGroupFooterBand;
    qryDetFLGQUITADO: TFloatField;
    qryDetFLGATUALIZARSALDO: TFloatField;
    qryDetSALDODEVEDORANT: TFloatField;
    qryDetVALORPARCELAANT: TFloatField;
    qryDetPAGAMENTO: TStringField;
    qryDetTIPOPAGAMENTO: TStringField;
    qryDetNOSSONUMERO: TStringField;
    qryDetCODTIPDOC: TFloatField;
    qryDetCODPORTFORMA: TStringField;
    qryDetFLGPORTFORMA: TFloatField;
    qryBaixa: TwwQuery;
    qryBoleto: TwwQuery;
    pcControle: TPageControl;
    tsCobranca: TTabSheet;
    tsImporta: TTabSheet;
    Panel1: TPanel;
    btnProcessar: TBitBtn;
    bbtnDesfazer: TmaHelpBitBtn;
    btnGerarRelatorio: TToolbarButton97;
    btnGerarDocumento: TToolbarButton97;
    pnlTop: TPanel;
    sbtnProcurar2: TToolbarButton97;
    lblStatusDivida: TLabel;
    rgTIPOCOB: TRadioGroup;
    grpMESCOB: TGroupBox;
    cbbMes: TComboBox;
    seAno: TSpinEdit;
    rgATUALIZARS: TRadioGroup;
    rgTipoOp: TRadioGroup;
    btnProcurar: TBitBtn;
    cbbStatusDivida: TComboBox;
    rgTipoPagto: TRadioGroup;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    edtImporta: TEdit;
    btnContabiliza: TToolbarButton97;
    grpMescobArq: TGroupBox;
    cbMesArq: TComboBox;
    spAnoArq: TSpinEdit;
    btnDesfazImp: TmaHelpBitBtn;
    btnImporta: TBitBtn;
    OpenDialog1: TOpenDialog;
    btnLimpaArquivo: TBitBtn;
    qryImporta: TwwQuery;
    rgTipoBenef: TRadioGroup;
    btnAbreArquivo: TBitBtn;
    qryExec: TwwQuery;
    bbExportar: TBitBtn;
    qePlanilha: TQExport3Dialog;
    qryPlanilha: TwwQuery;
    pgControlDetalhe: TPageControl;
    tabDetalhe: TTabSheet;
    tabResultado: TTabSheet;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    ToolbarSep9711: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    btnSelTudo: TBitBtn;
    btnInverte: TBitBtn;
    dbgrdDet: TwwDBGrid;
    memResult: TMemo;
    qryBeneficio: TwwQuery;
    qryDetULTMESREAJ: TStringField;
    qryDetFLGDEVOLUCAO: TFloatField;
    qryDetMESREFERENCIA: TStringField;
    qryDetNUMEROPROCESSO: TFloatField;
    qryDetVALORRECEBIDO: TFloatField;
    qryAux: TwwQuery;
    pplblCol12: TppLabel;
    ppShape1: TppShape;
    pplblCol1: TppLabel;
    ppDBCol1: TppDBText;
    ImlPadrao: TImageList;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    mmResumo: TMemo;
    qryExporta: TwwQuery;
    Cds: TCMClientDataSet;
    Sql: TCMSqlParams;

    procedure bbtnSairClick(Sender: TObject);
    procedure seAnoChange(Sender: TObject);
    procedure btnSelTudoClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdDetDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);

    procedure btnProcurarClick(Sender: TObject);
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
    procedure btnDesfazImpClick(Sender: TObject);
    procedure btnGerarDocumentoClick(Sender: TObject);

    procedure bbtnDesfazerClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure btnContabilizaClick(Sender: TObject);

    procedure rgTipoOpClick(Sender: TObject);
    procedure cbbStatusDividaChange(Sender: TObject);
    procedure rgTipoPagtoClick(Sender: TObject);
    procedure rgTIPOCOBClick(Sender: TObject);
    procedure rgTipoBenefClick(Sender: TObject);
    procedure rgATUALIZARSClick(Sender: TObject);
    procedure bbExportarClick(Sender: TObject);
    procedure qePlanilhaBeginExport(Sender: TQExport3);

    procedure Consulta();
    procedure ConsultaNova;                                //MIGRACAO-ORACLE
    function  Mensagens(_idmsg:Integer):string;
    procedure setPadraoInicial(_flag:Boolean);

    function  UpdateHSTDIVIDABENEFICIO(_flgsituacao:string; _flgdescfolha:string = '') : boolean; // SOL 230290 KINTANA 350993
    procedure ExecutarPreparo;
    procedure ExecutarEnvio;
    procedure ExecutarRecebimento;
    procedure ExecutarDesfazerPreparo;
    procedure ExecutarDesfazerRecebimento;

    function  InserirHSTDIVIDABENEFICIO(_MESREFERENCIA, _MESCOBRANCA, _VLQUITACAO, _dataprevista,
                                        _FLGSITUACAO,   _flgParcial,  _CODPORTFORMA : string;
                                        _VLRSALDOANT   : string = 'null';
                                        _VLRPARCELAANT : string = 'null') : boolean;

    function  VerificarRecebimentoTMPDESC : Boolean;
    // edilaine - 22/01/2014 - SOL 174933


    function  RetornaIndiceAcumulado(pData: string; var MsgErro : string): Double;      //William Santana - SIG 27216

    //William Santana - SIG33744 - inicio
    procedure filtraDet(filtrar: Boolean);
    procedure gerar_impressao;
    procedure ExecSaveRel(var Rpt: TppReport);
    procedure VerificaMarcaItensNaoExibidos;
    function  BaixaDocumentoNaoRecebido(sCodDocumento : string) : boolean;
    function  ContabilizaRecebimentoBoleto(rValor : double; dData : string) : boolean;    // WO22455 Ferrari
    procedure pcControleChange(Sender: TObject);
    procedure ppDBCol5GetText(Sender: TObject; var Text: String);
    procedure ppReport1BeforePrint(Sender: TObject);
    //William Santana - SIG33744 - fim



  private
    { Private declarations }
    ctrlDocumento: tctrlDocumento;

    //edilaine - SIG33744 - inicio
    aReportDesign, aReportModelo: TMemoryStream;
    lstSqlAtuDoc : TStringList;
    bReajustaSuspensa : boolean;
    tempoInicio, tempoFim : tdatetime;
    sMensagem   : string;
    //edilaine - SIG33744 - fim

    bPrevia  : boolean;    //edilaine 134478

    cdsRateio : TCmClientDataSet; //Leandro sig136150
  public
    { Public declarations }
   lCodLancCAPCAR:longint;
   iIdLoteConcessao,iFlgIncluiMesConc:Integer;
   sAnoMesLoteConcessao :string;
   sDataFolha : string;    //edilaine SIG33744
   pdesPrc:Boolean;
  end;

var
  FrmCtrlDiviBenef_Novo: TFrmCtrlDiviBenef_Novo;

implementation

uses RGeraDocumento, FExportD, uCtrlParamIntegra;

{$R *.DFM}

{ TFrmCtrlDiviBenef }


// edilaine - 22/01/2014 - SOL 174933
procedure ExecDeleteDocumento(sCodDocumento : string; var sMsg : string);
var ctrlDocumento: tctrlDocumento; // Andre Imakawa - SIG 32962

begin
  // Andre Imakawa - SIG 32962 - Inicio
  Try
    try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
    except
      FreeAndNil(CtrlDocumento);
      Exit;
    end;

    CtrlDocumento.Prepare(opDocumento, odlEfetivo);

    CtrlDocumento.IdEspAcesso  := Sistema.IdEspAcesso;
    CtrlDocumento.IdUsuario    := Sistema.IdUsuario;
    CtrlDocumento.IdModulo     := Sistema.IdModulo;
    CtrlDocumento.CodDocumento := StrToFloat(sCodDocumento);
    CtrlDocumento.Delete;
  Finally
    sMsg := CtrlDocumento.messageInfo;
    FreeAndNil(CtrlDocumento);
  end;
  // Andre Imakawa - SIG 32962 - Fim
end;


function DocumentoJaBaixado(_CODDOCUMENTO : string):Boolean;
begin
  Result := false;

  if trim(_CODDOCUMENTO) > '0' then
  begin
    with TwwQuery.Create(nil) do
      try
        DatabaseName:='BaseDados';
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT CODDOCUMENTO FROM DOCUMENTO  ');
        SQL.Add(' WHERE CODDOCUMENTO ='+Trim(_CODDOCUMENTO));
        SQL.Add('   AND STATUS <> 0 ');
        Active:=True;

        result := not IsEmpty;
      finally
       close;
       Destroy;
      end;
  end;
end;


function TFrmCtrlDiviBenef_Novo.VerificarRecebimentoTMPDESC : Boolean;
begin
  with TwwQuery.Create(nil) do
    try
      DataBaseName :='BaseDados';
      Active:=false;
      SQL.Clear;
      SQL.Add('Select DATARECEBIMENTO FROM TMPDESC ');
      SQL.Add(' where REFERENCIA  = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
      SQL.Add('   and idpessoa    = '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
      SQL.Add('   and idtitular   = '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
      SQL.Add('   and mescobranca = '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
      SQL.Add('   and sitenvio    <> 0');
      Open;

      //edilaine 134478 : inicio
      //result := FieldByName('DATARECEBIMENTO').Text <> '';
      bPrevia  := FieldByName('DATARECEBIMENTO').Text <> '';

      result := bPrevia;
      //edilaine 134478 : fim

    finally
      Close;
      Destroy;
    end;
end;
// edilaine - 22/01/2014 - SOL 174933


procedure TFrmCtrlDiviBenef_Novo.bbtnSairClick(Sender: TObject);
begin
  inherited;
//case rgTipoOp.ItemIndex of
//   0:begin
//      ExecutarPreparo;
//      end;
//   1:begin
//      ExecutarEnvio;
//      end;
//   2:begin
//      ExecutarRecebimento;
//      end;
//end;
end;


procedure TFrmCtrlDiviBenef_Novo.seAnoChange(Sender: TObject);
begin
 if (seAno.Value<1900) or (seAno.Value>2999)  then
    Exit;
end;

procedure TFrmCtrlDiviBenef_Novo.btnSelTudoClick(Sender: TObject);
begin
//  inherited;
  if not qryDet.isempty then
    begin
      qryDet.First;
      qryDet.DisableControls;     //edilaine - SIG33744
      while not qryDet.eof do
       begin
         qryDet.edit;
         qryDet.FieldByName('SELECIONAR').text:='S';
         qryDet.post;
         qryDet.Next;
       end;
       qryDet.EnableControls;     //edilaine - SIG33744
    end;
end;

procedure TFrmCtrlDiviBenef_Novo.btnInverteClick(Sender: TObject);
begin
//  inherited;
  if not qryDet.isempty then
    begin
      qryDet.First;
      qryDet.DisableControls;     //edilaine - SIG33744
      while not qryDet.eof do
       begin
         qryDet.edit;
         qryDet.FieldByName('SELECIONAR').text:='N';
         qryDet.post;
         qryDet.Next;
       end;
       qryDet.EnableControls;     //edilaine - SIG33744
    end;
end;


procedure TFrmCtrlDiviBenef_Novo.FormCreate(Sender: TObject);
begin
 // inherited;

  ctrlDocumento:=tctrlDocumento.create;
  ctrlDocumento.InitializeAs(Padroes);

  seAno.Value:=strtoint(FormatDateTime('YYYY',now));
  cbbMes.ItemIndex:=0;
  pdesPrc:=false;

  //edilaine SIG115304 : inicio
  pcControle.ActivePageIndex := 0;
  pgControlDetalhe.ActivePage := tabDetalhe;
  spAnoArq.Value     :=strtoint(FormatDateTime('YYYY',now));
  cbMesArq.ItemIndex :=0;
  //edilaine SIG115304 : fim

  lstSqlAtuDoc       := TStringList.create;    //edilaine - SIG33744

  cbbStatusDivida.ItemIndex := 0;         //edilaine - SIG33744

  rgTipoOpClick(rgTipoOp); // FHBS - 16/01/2014 - SOL 174933
end;


procedure TFrmCtrlDiviBenef_Novo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(lstSqlAtuDoc);
end;


procedure TFrmCtrlDiviBenef_Novo.dbgrdDetDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if qryDet.FieldByName('FLGSTATUS').Text = '2' then
     dbgrdDet.Canvas.Font.Color:= clGray
  else if qryDet.FieldByName('FLGSTATUS').Text = '3' then
     dbgrdDet.Canvas.Font.Color:= clOlive
  else if qryDet.FieldByName('FLGSITUACAO').Text = '0' then
     dbgrdDet.Canvas.Font.Color:= clblue
  else if (qryDet.FieldByName('FLGSITUACAO').Text = '1') or (qryDet.FieldByName('FLGSITUACAO').Text = '2') then
     dbgrdDet.Canvas.Font.Color:= clGreen
  else if (qryDet.FieldByName('FLGSITUACAO').Text = '3') or (qryDet.FieldByName('FLGSITUACAO').Text = '4') then
     dbgrdDet.Canvas.Font.Color:= clBlack;

  dbgrdDet.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TFrmCtrlDiviBenef_Novo.btnProcurarClick(Sender: TObject);
var
  i:Integer;
begin
  //inherited;

  rgTipoBenef.ItemIndex := -1;    //edilaine SIG115304

  qrydet.Filtered:=False;

  //btnProcurar.Down:=False;

  //if rgTIPOCOB.ITEMINDEX = 6 then
  //   cbbStatusDivida.ItemIndex := 3;

  //Consulta;    //MIGRACAO-ORACLE
  ConsultaNova;  //MIGRACAO-ORACLE

  for i:= 1 to dbgrdDet.GetColCount {17} do      //edilaine - SIG33744
    dbgrdDet.Columns[i].ReadOnly:=True;

  if qryDet.IsEmpty then
   begin
     btnProcessar.Enabled :=false;
     bbtnDesfazer.Enabled :=false;
     btnSelTudo.Enabled   :=false;
     btnInverte.Enabled   := false;
     btnGerarRelatorio.Enabled := false;
//     btnFiltro.Enabled:=false;
     if pdesPrc = False then
       MsgDlg( 'Não existem aposentados ou pensionistas com dívidas de benefícios cadastradas.','Informação',mtInformation,[mbOk],0);
   end
  else
   begin
     //BRUNO AZEVEDO INÍCIO SIG33744
     btnProcessar.Enabled := (cbbStatusDivida.ItemIndex <> 2); // or (cbbStatusDivida.text <> '') or (bReajustaSuspensa);
     bbtnDesfazer.Enabled := (cbbStatusDivida.ItemIndex <> 2); //or (cbbStatusDivida.text <> '') or (bReajustaSuspensa);
     //btnProcessar.Enabled:=true;
     //bbtnDesfazer.Enabled:=true;
     //BRUNO AZEVEDO FIM SIG33744
     btnSelTudo.Enabled:=true;
     btnInverte.Enabled:=true;
     btnGerarRelatorio.Enabled:=true;
//     btnFiltro.Enabled:=true;
   end;

  if not pdesPrc then
  begin
    pgControlDetalhe.ActivePage :=  tabDetalhe;        //edilaine - SIG33744
    rgTipoBenef.ItemIndex := -1;
    rgTipoPagto.ItemIndex := -1;
  end;

  if cbbStatusDivida.ItemIndex = 3 then
     rgTipoOp.ItemIndex := 2;

end;


procedure TFrmCtrlDiviBenef_Novo.ExecSaveRel(var Rpt: TppReport);
var
  sCaminho : string;
begin
  sCaminho := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  Rpt.DeviceType       := 'ExcelFile';
  Rpt.AllowPrintToFile := True;
  Rpt.ShowPrintDialog  := True;
  Rpt.TextFileName := sCaminho+'\CONTROLEDIVIDABENEFICIO'+FormatDateTime('DD_MM_YYYY', date);
  Rpt.Print;
end;


procedure TFrmCtrlDiviBenef_Novo.gerar_impressao;
var
   //edilaine SIG115304 - inicio
   ind, nCol  : integer;
   sNomeCampo : string;
   sColNExporta : string;
   sNomeColunas : TStringList;
   //edilaine SIG115304 : fim
begin

  //edilaine SIG 115304 : inicio
  sNomeColunas := TStringList.create;

  for nCol := 1 to 18 do
  begin
   with TppDBText(FindComponent('ppDBCol'+IntToStr(nCol))) do
   begin
     sNomeCampo := DataField;

     //sNomeColunas.Add(sNomeCampo+'='+qryDet.FieldByName(sNomeCampo).DisplayLabel);
     sNomeColunas.Add(sNomeCampo);
   end;
  end;

  for nCol := 0 to qryDet.Fields.Count-1 do
  begin
    if sNomeColunas.IndexOfName(qryDet.Fields[nCol].FieldName) < 0 then
       sColNExporta := sColNExporta + iif(sColNExporta = '', '', ', ') +'"'+qryDet.Fields[nCol].FieldName+'"';
  end;

  try
    //TFrmPreview.CreateModalPreview(Application, ppReport1,'CONTROLE DE DÍVIDAS DE BENEFÍCIOS');      //edilaine - SIG33744
    //TFrmPreviewExport.CreateModalPreviewExp(Application, ppReport1,'CONTROLE DE DÍVIDAS DE BENEFÍCIOS', qryDet);  //edilaine - SIG33744
    TFrmPreviewExportD.CreateModalPreviewExp(Application, ppReport1,'CONTROLE DE DÍVIDAS DE BENEFÍCIOS', qryDet, sNomeColunas, sColNExporta);   //edilaine - SIG115304
    ExecSaveRel(ppReport1);
  finally;
    //FreeAndNil(sNomeColunas);   //MIGRACAO-ORACLE
  end;

  //qryRelatorio.Active:=False;

end;


procedure TFrmCtrlDiviBenef_Novo.btnGerarRelatorioClick(Sender: TObject);
begin
  inherited;

  if not qryDet.active then
    begin
      MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para emissão do relatório.','Informação',mtInformation,[mbOk],0);
      abort;
    end;

  filtraDet(True);  
  //Término - William Santana - SIG33744

  if not qryDet.IsEmpty then
     gerar_impressao
  else
    begin
      MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para emissão do relatório.','Informação',mtInformation,[mbOk],0);
      filtraDet(false);  //edilaine - SIG33744
      exit;
    end;
end;


procedure TFrmCtrlDiviBenef_Novo.btnArquivoClick(Sender: TObject);
var
  CheckSum, sMesAno : string;
begin
  inherited;
  OpenDialog1.Execute;
  edtImporta.Text := OpenDialog1.FileName;

  CheckSum := '-';
  if edtImporta.text <> '' then
     CheckSum := GetCRC32(edtImporta.text);

  sMesAno  := inttostr(spAnoArq.Value)+'/'+formatfloat('00',(cbMesArq.Itemindex+1));
end;


procedure TFrmCtrlDiviBenef_Novo.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtImporta.Clear;
  mmResumo.Clear;
end;



procedure TFrmCtrlDiviBenef_Novo.btnGerarDocumentoClick(Sender: TObject);
var
  sMsg : TStringList;
  ind  : integer;
begin
  if qryDet.isEmpty then
     Exit;

  filtraDet(true);
  qryDet.first;
  if qryDet.eof then
  begin
    Screen.Cursor := crDefault;
    ShowMessage('Não existem documentos selecionados para impressão.');
    filtraDet(false);
    qryDet.first;
    Abort;
  end;
  qryDet.DisableControls;

  //edilaine - SIG33744 : inicio
  tempoInicio := now;

  memResult.clear;
  memResult.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
  memResult.Lines.Add('---------------------------------------------------------------');
  memResult.Lines.Add('');
  //edilaine - SIG33744 : fim

  sMsg := TStringList.create;

  try
    if GeraBoleto(qryDet, qryAux, lstSqlAtuDoc, sMsg) then
    begin
      //atualiza dados da impressao
      if lstSqlAtuDoc.Count > 0 then
      begin
        If not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        try
          qryAux.close;
          qryAux.Sql.Text := 'BEGIN '+lstSqlAtuDoc.text+ ' END;';
          qryAux.ExecSql;

          dtmBaseDados.dbBaseDados.Commit;
        except
          dtmBaseDados.dbBaseDados.RollBack;
        end;
      end;
      if sMsg.Count = 1 then
         MsgDlg(sMsg.Text,'Informação',mtInformation,[mbOK],0);
    end
    else
    begin
      if sMsg.Count = 1 then
         MsgDlg(sMsg.Text , 'Informação',mtInformation,[mbOK],0)
    end;

    if sMsg.count > 1 then
    begin
      for ind := 0 to sMsg.Count-1 do
          memResult.Lines.Add(sMsg.Strings[ind]);
    end;

  finally
     tempoFim := now;

     memResult.Lines.Add('---------------------------------------------------------------');
     memResult.Lines.Add('Tempo total de processamento: ' + formatdatetime('hh:nn:ss', tempoFim-tempoInicio));
     memResult.Lines.Add('');
     if sMsg.count > 1 then
        pgControlDetalhe.ActivePage := tabResultado;

     SalvaResultado(memResult, 'Gera Boleto', 'DIVIDA_BENEFICIO_LOG');
     //edilaine SIG33744 : fim

    filtraDet(false);
    qryDet.first;
    qryDet.EnableControls;
    FreeAndNil(sMsg);
  end;

 {
  CtrlGeraBoleto := TCtrlGeraBoleto.create;
  CtrlGeraBoleto.Initialize( dtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True
                             );

  aReportDesign := TMemoryStream.Create;
  aReportModelo := TMemoryStream.Create;

  qryBoleto.close;
  qryBoleto.ParamByName('iIdConfigBarra').AsInteger := 26;
  qryBoleto.open;
  if qryBoleto.eof then
  begin
    MsgDlg('Não foi cadastrado o desenho para o layout especificado','Erro',mtError,[mbOK],0);
    exit;
  end;

  try
    //passa dataset com dados para impressao (deve conter o campo CODDOCUMENTO)
    if CtrlGeraBoleto.PreparaDados(26, qryDet, lstSqlAtuDoc) then
    begin

      if not CtrlGeraBoleto.cdsDados.eof then
      begin

        while not CtrlGeraBoleto.cdsDados.eof do
        begin

          sCodDocumento := Trim(CtrlGeraBoleto.cdsDados.FieldByName('CODDOCUMENTO').AsString);

          sCaminho := CaminhoParaSalvarArquivo(CtrlGeraBoleto.cdsDados.FieldByName('MATR_TITULAR').AsString,
                                               CtrlGeraBoleto.cdsDados.FieldByName('MATRICULA').AsString);

          sNomeArq := 'Boleto ' + StringReplace(RetornaAnoMes(CtrlGeraBoleto.cdsDados.FieldByName('DATAPROGRAMADA').AsDateTime), '/', '', []) + ' - ' +
                                  CtrlGeraBoleto.cdsDados.FieldByName('MATRICULA').AsString  +'.pdf';


          try
            RptModeloBoleto :=  TRptModeloBoleto.create(self);
            with RptModeloBoleto do
            begin
                cdsDados.data     := CtrlGeraBoleto.cdsDados.data;
                cdsDados.Filtered := false;
                cdsDados.Filter   := 'CODDOCUMENTO = '+ sCodDocumento;
                cdsDados.Filtered := true;

                if cdsDados.eof then
                   exit;

                try
                  aReportDesign.Clear;
                  TBlobField(qryBoleto.FieldByName('TEMPLATE')).SaveToStream(aReportDesign);

                  aReportDesign.Position := 0;
                  DsgnCM.Report.Template.LoadFromStream(aReportDesign);

                  DsgnCM.Report.Template.SaveTo      := stFile;
                  DsgnCM.Report.Template.Format      := ftBinary;
                  DsgnCM.Report.Device               := dvFile;
                  DsgnCM.Report.DeviceType           := 'PDFFile';

                  DsgnCM.Report.TextFileName         :=  sCaminho + '\' + sNomeArq;
                  DsgnCM.Report.ArchiveFileName      :=  sCaminho + '\' + sNomeArq;
                  DsgnCM.Report.ShowAutoSearchDialog := False;
                  DsgnCM.Report.ShowPrintDialog      := False;
                  DsgnCM.report.ShowCancelDialog     := False;
                  DsgnCM.Report.AllowPrintToArchive  := True;
                  DsgnCM.Report.AllowPrintToFile     := True;


                  DsgnCM.Report.Print;

                  if FileExists(sCaminho + '\' + sNomeArq) then
                     lstSqlAtuDoc.Add('UPDATE DOCUMENTO SET EMISBLOQ = ''S'' WHERE CODDOCUMENTO = '+sCodDocumento +'; ' );

                except                                                                                             
                  MsgDlg('Erro ao gerar documento','Erro',mtError,[mbOK],0);
                end;
            end;
          finally
            RptModeloBoleto.free;
          end;

          CtrlGeraBoleto.cdsDados.Next;
        end;

        //atualiza dados da impressao
        if lstSqlAtuDoc.Count > 0 then
        begin
          If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

          try
            qryAux.close;
            qryAux.Sql.Text := 'BEGIN '+lstSqlAtuDoc.text+ ' END;';
            qryAux.ExecSql;

            dtmBaseDados.dbBaseDados.Commit;
          except
            dtmBaseDados.dbBaseDados.RollBack;
          end;
        end;
        MsgDlg('Documentos gerados com sucesso em: '+char(10)+char(13)+ sCaminho,'Informação',mtInformation,[mbOK],0);

      end
      else
         MsgDlg('Não há dados para gerar documentos','Informação',mtInformation,[mbOK],0);
    end
    else
       MsgDlg('Não foi possível gerar documentos','Informação',mtInformation,[mbOK],0);

  finally
    FreeAndNil(CtrlGeraBoleto);
    aReportDesign.Free;
    aReportModelo.Free;

    qryDet.first;
    qryDet.EnableControls;

  end;
  }
end;


procedure TFrmCtrlDiviBenef_Novo.btnProcessarClick(Sender: TObject);
begin
  inherited;
  bbtnDesfazer.Enabled := False;
  btnProcessar.Enabled := False;
  try                                        //edilaine - SIG33744
    try

      if trim(cbbMes.Text) = '' then
      begin
        MsgDlg( 'É necessário selecionar o Mês/Ano de Cobrança.','Informação',mtInformation,[mbOk],0);
        cbbMes.SetFocus;
      end;

      VerificaMarcaItensNaoExibidos; //William Santana - SIG33744

      case rgTipoOp.ItemIndex of
         0:begin

             ExecutarPreparo;
           end;
         1:begin

             ExecutarEnvio;
           end;
         2:begin
             ExecutarRecebimento;
           end;
      end;

    except
      btnProcessar.Enabled := True;
      bbtnDesfazer.Enabled := True;

      //qrydet.Filtered:=False; //William Santana - SIG33744
      filtraDet(False);         //William Santana - SIG33744
      //Consulta;
    end;
    
  finally
    bbtnDesfazer.Enabled := False;
    btnProcessar.Enabled := False;
  end;

  pdesPrc:=true;
  btnProcurarClick(Sender);
  pdesPrc:=False;
end;



procedure TFrmCtrlDiviBenef_Novo.rgTipoOpClick(Sender: TObject);
begin
  inherited;

  // FHBS - 16/01/2014 - SOL 174933
  case rgTipoOp.ItemIndex of
    // Preparo
    0: rgTIPOCOB.ItemIndex := 3;
    // Envio
    //edilaine - SIG33744 - inicio
    1: if cbbStatusDivida.ItemIndex = 1 then
         rgTIPOCOB.ItemIndex := 1
       else
         rgTIPOCOB.ItemIndex := 0;
    // Recebimento
    2: if (cbbStatusDivida.ItemIndex = 1) then
         rgTipoOp.ItemIndex := 0
       else if (cbbStatusDivida.ItemIndex = 3) and not (rgTIPOCOB.ItemIndex in [2,3,4]) then
         rgTIPOCOB.ItemIndex := 3
       else
         rgTIPOCOB.ItemIndex := 1;
    //edilaine - SIG33744 - fim
  end;

  btnGerarDocumento.Enabled := (rgTipoOp.ItemIndex = 1) and (rgTIPOCOB.ItemIndex = 1) and (rgTipoPagto.ItemIndex = 0);  //edilaine - SIG33744
  btnProcessar.Enabled := (cbbStatusDivida.ItemIndex = 0) or ((cbbStatusDivida.ItemIndex = 1) and (rgTipoOp.ItemIndex = 0));
end;


procedure TFrmCtrlDiviBenef_Novo.cbbStatusDividaChange(Sender: TObject);
var
  cor : TColor;
begin
  inherited;

  if cbbStatusDivida.ItemIndex <> 2 then
     cor := clWhite
  else
     cor := clBtnFace;

  {habilita controles se status for ativa}
  cbbMes.enabled       := cbbStatusDivida.ItemIndex <> 2;
  seAno.enabled        := cbbStatusDivida.ItemIndex <> 2;
  rgATUALIZARS.enabled := cbbStatusDivida.ItemIndex <> 2;
  rgTipoOp.enabled     := cbbStatusDivida.ItemIndex <> 2;
  rgTIPOCOB.enabled    := (cbbStatusDivida.ItemIndex = 0) or (cbbStatusDivida.ItemIndex = 3);
  rgTipoPagto.enabled  := (cbbStatusDivida.ItemIndex = 0) or (cbbStatusDivida.ItemIndex = 3);

  if not rgTipoPagto.enabled then
     rgTipoPagto.itemIndex := -1;

  cbbMes.Color := cor;
  seAno.Color  := cor;

  rgATUALIZARS.ItemIndex := 1;
  if cbbStatusDivida.ItemIndex = 3 then
     rgTipoOp.ItemIndex := 2;

  rgTipoOpClick(rgTipoOp);

  pdesPrc:=false;

  //Consulta();   //MIGRACAO-ORACLE
  ConsultaNova;   //MIGRACAO-ORACLE

  filtraDet(false);

  //edilaine SIG115304 : inicio
  if cbbStatusDivida.ItemIndex = 2 then
  begin
    //MIGRACAO-ORACLE : inicio
    //remover acento e espaços em branco dos nomes dos campos
    dbgrdDet.Selected.Clear;
    dbgrdDet.Selected.Add('Selecionar'#9'1'#9'Selecionar');
    dbgrdDet.Selected.Add('Matricula'#9'10'#9'Matrícula');
    dbgrdDet.Selected.Add('Nome'#9'40'#9'Nome');
    dbgrdDet.Selected.Add('PlanoContab'#9'10'#9'Plano ~Contabil');
    dbgrdDet.Selected.Add('Beneficio'#9'40'#9'Benefício ');
    dbgrdDet.Selected.Add('DtLancDivida'#9'13'#9'Dt Lanc Dívida');
    dbgrdDet.Selected.Add('VlrBenef'#9'10'#9'Vlr Benef');
    dbgrdDet.Selected.Add('SaldoDevIni'#9'10'#9'Saldo Dev Ini');
    dbgrdDet.Selected.Add('SaldoDevAtual'#9'10'#9'Saldo Dev Atual');
    dbgrdDet.Selected.Add('SaldoBaixaDef'#9'10'#9'Saldo Baixa Def.');
    dbgrdDet.Selected.Add('UltParcela'#9'10'#9'Ult Parcela');
    dbgrdDet.Selected.Add('VlrParcela'#9'10'#9'Vlr Parcela');
    dbgrdDet.Selected.Add('IniCobr'#9'12'#9'Ini Cobr');
    dbgrdDet.Selected.Add('FimCobr'#9'12'#9'Fim Cobr'#9'F');
    dbgrdDet.Selected.Add('Percentual'#9'10'#9'Percentual');
    dbgrdDet.Selected.Add('QtdePagas'#9'10'#9'Qtde Pagas');
    dbgrdDet.Selected.Add('QtdeParcelas'#9'10'#9'Qtde Parcelas');
    dbgrdDet.Selected.Add('PAGAMENTO'#9'10'#9'Tipo Pagamento');
    dbgrdDet.Selected.Add('AtualizarSaldo'#9'3'#9'Atualizar Saldo');
    dbgrdDet.Selected.Add('Observacao'#9'24'#9'Observação');
  end
  else
  begin
    dbgrdDet.Selected.Clear;
    dbgrdDet.Selected.Add('Selecionar'#9'1'#9'Selecionar');
    dbgrdDet.Selected.Add('Matricula'#9'10'#9'Matrícula');
    dbgrdDet.Selected.Add('Nome'#9'40'#9'Nome');
    dbgrdDet.Selected.Add('PlanoContab'#9'10'#9'Plano ~Contabil');
    dbgrdDet.Selected.Add('Beneficio'#9'40'#9'Benefício ');
    dbgrdDet.Selected.Add('DtLancDivida'#9'13'#9'Dt Lanc Dívida');
    dbgrdDet.Selected.Add('VlrBenef'#9'10'#9'Vlr Benef');
    dbgrdDet.Selected.Add('SaldoDevIni'#9'10'#9'Saldo Dev Ini');
    dbgrdDet.Selected.Add('SaldoDevAtual'#9'10'#9'Saldo Dev Atual');
    dbgrdDet.Selected.Add('UltParcela'#9'10'#9'Ult Parcela');
    dbgrdDet.Selected.Add('VlrParcela'#9'10'#9'Vlr Parcela');
    dbgrdDet.Selected.Add('IniCobr'#9'12'#9'Ini Cobr');
    dbgrdDet.Selected.Add('FimCobr'#9'12'#9'Fim Cobr'#9'F');
    dbgrdDet.Selected.Add('Percentual'#9'10'#9'Percentual');
    dbgrdDet.Selected.Add('QtdePagas'#9'10'#9'Qtde Pagas');
    dbgrdDet.Selected.Add('QtdeParcelas'#9'10'#9'Qtde Parcelas');
    dbgrdDet.Selected.Add('PAGAMENTO'#9'10'#9'Tipo Pagamento');
    dbgrdDet.Selected.Add('AtualizarSaldo'#9'3'#9'Atualizar Saldo');
    dbgrdDet.Selected.Add('Observacao'#9'24'#9'Observação');
    //MIGRACAO-ORACLE : fim
  end;
  //edilaine SIG115304 : fim

  //BRUNO AZEVEDO INÍCIO SIG33744
  if qryDet.IsEmpty then
   begin
     btnProcessar.Enabled :=false;
     bbtnDesfazer.Enabled :=false;
     btnSelTudo.Enabled   :=false;
     btnInverte.Enabled   := false;
     btnGerarRelatorio.Enabled := false;
     if pdesPrc = False then
         MsgDlg( 'Não existem aposentados ou pensionistas com dívidas de benefícios cadastradas.','Informação',mtInformation,[mbOk],0);
   end
  else
   begin
     bReajustaSuspensa := (cbbStatusDivida.ItemIndex = 1) and (rgATUALIZARS.ItemIndex = 0);

     btnProcessar.Enabled := cbbStatusDivida.ItemIndex <> 2; // or ((cbbStatusDivida.ItemIndex = 1) and (rgTipoOp.ItemIndex = 0));
     bbtnDesfazer.enabled := cbbStatusDivida.ItemIndex <> 2;
     btnSelTudo.Enabled:=true;
     btnInverte.Enabled:=true;
     btnGerarRelatorio.Enabled:=true;
   end;
   //BRUNO AZEVEDO FIM SIG33744

  rgTipoBenef.ItemIndex := -1;
  rgTipoPagto.ItemIndex := -1;
  pgControlDetalhe.ActivePage :=  tabDetalhe;        //edilaine - SIG33744
end;


procedure TFrmCtrlDiviBenef_Novo.rgTipoPagtoClick(Sender: TObject);
begin
  inherited;
  FiltraDet(false);

  btnGerarDocumento.Enabled := (rgTipoOp.ItemIndex = 1) and (rgTIPOCOB.ItemIndex = 1) and (rgTipoPagto.ItemIndex = 0);
end;


procedure TFrmCtrlDiviBenef_Novo.rgTIPOCOBClick(Sender: TObject);
begin
  inherited;
  btnGerarDocumento.Enabled := (rgTipoOp.ItemIndex = 1) and (rgTIPOCOB.ItemIndex = 1) and (rgTipoPagto.ItemIndex = 0);
//  if (cbbStatusDivida.ItemIndex = 3) and (rgTIPOCOB.ItemIndex <> 2) and (rgTIPOCOB.ItemIndex <> 3) and (rgTIPOCOB.ItemIndex <> 4) then
//     rgTIPOCOB.ItemIndex := 3;
end;


procedure TFrmCtrlDiviBenef_Novo.rgTipoBenefClick(Sender: TObject);
begin
  inherited;
  FiltraDet(false);

  rgATUALIZARS.Enabled := (rgTipoBenef.ItemIndex = 0) and (cbbStatusDivida.ItemIndex <> 2);
end;


procedure TFrmCtrlDiviBenef_Novo.rgATUALIZARSClick(Sender: TObject);
begin
  inherited;
  bReajustaSuspensa := (cbbStatusDivida.ItemIndex = 1) and (rgATUALIZARS.ItemIndex = 0);

  btnProcessar.Enabled := (cbbStatusDivida.ItemIndex = 0) or (cbbStatusDivida.text = '') or (bReajustaSuspensa);
  bbtnDesfazer.Enabled := (cbbStatusDivida.ItemIndex = 0) or (cbbStatusDivida.text = '') or (bReajustaSuspensa);
end;


procedure TFrmCtrlDiviBenef_Novo.bbExportarClick(Sender: TObject);
begin
  inherited;
  if qryPlanilha.Active then
     qryPlanilha.close;
  qryPlanilha.Open;

  fmQrExportD := TfmQrExportD.Create(nil);
  try
    fmQrExportD.DataSet(qryPlanilha, -1);
    fmQrExportD.ShowModal;
  finally
    FreeAndNil(fmQrExportD);
  end;

end;


procedure TFrmCtrlDiviBenef_Novo.qePlanilhaBeginExport(Sender: TQExport3);
begin
  inherited;
  qePlanilha.dataset.first;
end;


//William Santana - SIG33744 - inicio
procedure TFrmCtrlDiviBenef_Novo.filtraDet(filtrar: Boolean);
 var
   sFiltro : string;
begin
  //função criada para realizar o filtro na qryDet, pois a consulta sempre deve estar filtrada
  // para não mostrar registros que não existam na tabela 'Controledividabeneficio'

  qryDet.Filtered := False;
  qryDet.Filter   := '';

  if filtrar then
     sFiltro := 'Selecionar ='+QuotedStr('S')
  else
     sFiltro := 'MostraGrid ='+QuotedStr('S');

  case rgTipoPagto.itemIndex of
    0 : sFiltro := sFiltro + ' AND TipoPagamento = ''B'' ';
    1 : sFiltro := sFiltro + ' AND TipoPagamento = ''F'' ';
  end;

  //edilaine SIG115304 : inicio
  case rgTipoBenef.ItemIndex of
    0 : sFiltro := sFiltro + ' AND FONTEPAGADORA = 1 ';
    1 : sFiltro := sFiltro + ' AND FONTEPAGADORA = 2 ';
  end;
  //edilaine SIG115304 : fim

  qryDet.Filter   := sFiltro;
  qryDet.Filtered := True;

  if qryDet.active then
     qryDet.first;

end;



procedure TFrmCtrlDiviBenef_Novo.Consulta;
var
  sAnoMes: String;        //William Santana - SIG33744
  sFlgStatus : string;    //edilaine - SIG33744
begin

  qryDet.Active:=False;
  qryDet.SQL.Clear;

  //Início - William Santana - SIG33744
  sAnoMes    := inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1));
  sFlgStatus := iif(cbbStatusDivida.text = '', '0', IntToStr(cbbStatusDivida.ItemIndex+1));

  //qryDet.SQL.Add('select * from (' );   //Darivaldo Alencar SIG78406

  //Caso IDCONTROLEDIVIDABENEFICIO e MESCOBRANCA se repitam na consulta, não mostrar na grid
  qryDet.SQL.Add('SELECT ');
  qryDet.SQL.Add('   CASE  ');
  qryDet.SQL.Add('     WHEN (NVL(LAG(T.IDCONTROLEDIVIDABENEFICIO) OVER (ORDER BY ROWNUM),-1) = T.IDCONTROLEDIVIDABENEFICIO) ');
  qryDet.SQL.Add('     THEN ''N'' ELSE ''S'' ');
  qryDet.SQL.Add('   END AS "MostraGrid",    ');
  qryDet.SQL.Add('   T.* ');
  qryDet.SQL.Add('FROM (');
  //Término - William Santana - SIG33744

  qryDet.SQL.Add('select distinct ''N'' "Selecionar",');
  //BRUNO AZEVEDO INÍCIO SIG33744
  qryDet.SQL.Add('    C.FLGSTATUS, C.FLGPORTFORMA, ');
  //qryDet.SQL.Add('    DECODE(C.FLGSTATUS, 1, ''Ativa'', 2, ''Suspensa'', 3, ''Encerrada'', '''') as StatusDivida, ');   //edilaine SIG115304
  qryDet.SQL.Add('    C.OBSERVACAO as "Observacao",   ');                                   //edilaine SIG115304
  qryDet.SQL.Add('    C.FLGQUITADO, C.NUMPROCINSS, C.NUMEROPROCESSO, H.VALORRECEBIDO,  ');  //edilaine SIG115304
  qryDet.SQL.Add('    H.PAGAMENTO, H.TIPOPAGAMENTO, H.NOSSONUMERO, H.CODTIPDOC, H.FLGDEVOLUCAO, H.MESREFERENCIA,  ');
  //BRUNO AZEVEDO FIM SIG33744

  //edilaine SIG115304 : inicio
  qryDet.SQL.Add('    DECODE(C.FLGSTATUS, 1, ''Ativa'', 2, DECODE(C.FLGACAOJUD, 1, ''Susp. Jud'', ''Susp. Adm''), 3, ''Encerrada'', '''') as "StatusDivida", ');
  qryDet.SQL.Add('    NVL(C.FLGACAOJUD,0) as FLGACAOJUD, ');
  //edilaine SIG115304 : inicio

  qryDet.SQL.Add('    (select matricula from depentit d where d.idpessoa = c.idpessoa and d.idtitular = c.idtitular) as "Matrícula",');
  qryDet.SQL.Add('    (select nome from pessoa p where p.idpessoa = c.idpessoa) as"Nome",');
  qryDet.SQL.Add('    (select pi.IDPLANPREVCONTAB');                 //edilaine SIG115304
  qryDet.SQL.Add('       from benefbfciario b, PERFILINVEST PI ');   //edilaine SIG115304
  qryDet.SQL.Add('      where b.idplanoprev = c.idplanoprev');
  qryDet.SQL.Add('        and b.idpessoa = c.idpessoa');
  qryDet.SQL.Add('        and b.idtitular = c.idtitular');
  qryDet.SQL.Add('        and b.idbeneficio = c.idbeneficio'); // SOL 228648 KINTANA 2062629
  qryDet.SQL.Add('        and b.idpessjur = c.idpessjur    ');
  qryDet.SQL.Add('        and PI.IDPERFILINVEST(+) = B.IDPERFILINVEST  ');    //edilaine SIG115304
  qryDet.SQL.Add('        and rownum = 1) "Plano Contab",');
  qryDet.SQL.Add('    (select nome from beneficio where idbeneficio = c.idbeneficio) "Benefício ",');
  qryDet.SQL.Add('    C.Data"Dt Lanc Dívida",');
  qryDet.SQL.Add('    C.Valorbeneficio"Vlr Benef",');
  qryDet.SQL.Add('    C.Saldodevedorinicial"Saldo Dev Ini",');
  qryDet.SQL.Add('    C.Saldodevedoratual"Saldo Dev Atual",');
  qryDet.SQL.Add('    C.SaldoBaixaDef"Saldo Baixa Def",');             //edilaine SIG115304
  qryDet.SQL.Add('    C.Valorultimaparcela"Ult Parcela",');

  //edilaine - SIG33744 : inicio
  if (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
     qryDet.SQL.Add('    C.Valorparcela"Vlr Parcela",')
  else
     qryDet.SQL.Add('    H.VALORPREVISTO"Vlr Parcela",');
  //edilaine - SIG33744 : fim

  qryDet.SQL.Add('    ''''"Situação",');
  qryDet.SQL.Add('    C.Mesinicio"Ini Cobr",');
  qryDet.SQL.Add('    C.Mesfim"Fim Cobr",');
  qryDet.SQL.Add('    C.Percentual"Percentual",');
  qryDet.SQL.Add('    C.Quantidadeparcelaspagas"Qtde Pagas",');
  qryDet.SQL.Add('    C.Qtdeparcelas"Qtde Parcelas",');
  qryDet.SQL.Add('    decode(nvl(C.Flgatualizarsaldo, 0), 0, ''Não'', ''Sim'') "Atualizar Saldo",');
  qryDet.SQL.Add('    c.Flgatualizarsaldo, H.SALDODEVEDORANT, H.VALORPARCELAANT,');         //edilaine - SIG33744
  qryDet.SQL.Add('    H.FLGSITUACAO, C.ULTMESREAJ,');                                       //edilaine - SIG33744
  qryDet.SQL.Add('    C.IDCONTROLEDIVIDABENEFICIO,');
  qryDet.SQL.Add('    H.IDHSTORICODIVIDABENEFICIO,');
  qryDet.SQL.Add('    C.IDPESSOA, C.IDTITULAR, C.IDPESSJUR, C.IDBENEFICIO, C.IDPLANOPREV, C.IDMOTIVO, ');
  qryDet.SQL.Add('    NVL(H.CODDOCUMENTO,0) AS CODDOCUMENTO ,H.MESCOBRANCA,'); // SOL 232999/16147 PPM 409169 NVL no CODDOCUMENTO
  qryDet.SQL.Add('    (SELECT MIN(H.MESCOBRANCA)   ');
  qryDet.SQL.Add('       FROM HSTDIVIDABENEFICIO H ');
  qryDet.SQL.Add('      WHERE H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO) primeiroMesCobr, '); //William Santana - SIG 27216
  //qryDet.SQL.Add('   c.flgportforma as CODPORTFORMA, c.flgdescfolha AS FLGDESCFOLHA , h.dataprevista, h.VALORPREVISTO, ');      // edilaine - 22/01/2014 - SOL 174933  //William Santana - SIG33744 comentado
  qryDet.SQL.Add('    NVL(H.CODPORTFORMA, 0) CODPORTFORMA, C.FLGDESCFOLHA , H.DATAPREVISTA, H.VALORPREVISTO, ');     //William Santana - SIG33744
  qryDet.SQL.Add('    H.NUMEROPARCELA, C.FONTEPAGADORA,    ');
  qryDet.SQL.Add('    decode(H.FLGSITUACAO, 0, ''Preparada'',');                            //edilaine - SIG33744
  qryDet.SQL.Add('                          1, ''Enviada'',  ');
  qryDet.SQL.Add('                          2, ''Enviada e Não Recebida'',');
  qryDet.SQL.Add('                          3, ''Recebida'',');
  qryDet.SQL.Add('                          4, ''Recebida com Divergência'',');
  qryDet.SQL.Add('                          5, ''Suspensa'', '''') as SituacaoDivida, ');
// Inicio SIG 132927 Ferrari
  qryDet.SQL.Add('       (SELECT PI.IDPLANPREVCONTAB                                           ');
  qryDet.SQL.Add('         FROM BENEFBFCIARIO BF                                               ');
  qryDet.SQL.Add('         JOIN PERFILINVEST PI                                                ');
  qryDet.SQL.Add('         ON PI.IDPERFILINVEST = BF.IDPERFILINVEST                            ');
  qryDet.SQL.Add('         WHERE BF.IDPESSOA    = C.IDPESSOA                                   ');
  qryDet.SQL.Add('         AND BF.IDTITULAR   = C.IDTITULAR                                    ');
  qryDet.SQL.Add('         AND BF.IDPESSJUR   = C.IDPESSJUR                                    ');
  qryDet.SQL.Add('         AND BF.IDPLANOPREV = C.IDPLANOPREV                                  ');
  qryDet.SQL.Add('         AND BF.IDBENEFICIO = C.IDBENEFICIO                                  ');
  qryDet.SQL.Add('         AND BF.NUMEROPROCESSO = C.NUMEROPROCESSO) AS IDPLANPREVCONTAB       ');
// FIM SIG 132927
  qryDet.SQL.Add('FROM Controledividabeneficio c , /*HSTDIVIDABENEFICIO H,*/');

  // edilaine - 22/01/2014 - SOL 174933
  qryDet.SQL.Add('       (SELECT H1.IDCONTROLEDIVIDABENEFICIO,  ');
  qryDet.SQL.Add('               H1.IDHSTORICODIVIDABENEFICIO,  ');
  //edilaine - SIG33744 : inicio
  qryDet.SQL.Add('               H1.CODDOCUMENTO, H1.MESCOBRANCA, H1.DATAPREVISTA, H1.NUMEROPARCELA, H1.FLGSITUACAO, ');
  qryDet.SQL.Add('               DECODE(H1.FLGDEVOLUCAO, 1, -H1.VALORPREVISTO, H1.VALORPREVISTO) VALORPREVISTO    ');
  qryDet.SQL.Add('               ,DECODE(H1.TIPOPAGAMENTO, ''B'', ''Boleto'', ''Folha Benefício'') AS PAGAMENTO   ');
  qryDet.SQL.Add('               ,DECODE(H1.CODPORTFORMA, 0, NULL, H1.CODPORTFORMA) CODPORTFORMA ');
  qryDet.SQL.Add('               ,H1.TIPOPAGAMENTO, D.NOSSONUMERO, D.CODTIPDOC, H1.FLGDEVOLUCAO, H1.MESREFERENCIA ');
  qryDet.SQL.Add('               ,H1.SALDODEVEDORANT, H1.VALORPARCELAANT, NVL(H1.VALORRECEBIDO, 0) VALORRECEBIDO   ');
  qryDet.SQL.Add('          FROM HSTDIVIDABENEFICIO H1 ');
  qryDet.SQL.Add('               LEFT JOIN DOCUMENTO D ON H1.CODDOCUMENTO = D.CODDOCUMENTO ');
  //edilaine - SIG33744 : fim

  qryDet.SQL.Add('         WHERE ');

  //William Moreira da Silva - SOL 231343 PPM 373759
  qryDet.SQL.Add('               (NVL(H1.CODDOCUMENTO,0) = 0 OR H1.CODDOCUMENTO IS NOT NULL)  ');
  //William Moreira da Silva - SOL 231343 PPM 373759

  if (sFlgStatus <>  '1') and (sFlgStatus <>  '4') then
  begin
    qryDet.SQL.Add('              AND H1.MESCOBRANCA = (SELECT MAX(H2.MESCOBRANCA)   ');
    qryDet.SQL.Add('                                      FROM HSTDIVIDABENEFICIO H2 ');
    qryDet.SQL.Add('                                     WHERE H2.IDCONTROLEDIVIDABENEFICIO = H1.IDCONTROLEDIVIDABENEFICIO) ');
  end
  else
  begin
    if (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
       qryDet.SQL.Add('              AND H1.FLGSITUACAO in (3,4)  ')
    else if (rgTIPOCOB.ITEMINDEX <> 6) then                  
       qryDet.SQL.Add('              AND H1.FLGSITUACAO in ( '+inttostr(rgTIPOCOB.ITEMINDEX) + ')  ');

    //edilaine - SIG71864 - inicio
    //if cbbStatusDivida.ItemIndex = 0 then
    //if (sFlgStatus =  '1') or (sFlgStatus = '4') then
    begin
      qryDet.SQL.Add('               AND EXISTS (SELECT 1 FROM ( SELECT MAX(H2.MESCOBRANCA) MAXCOBRANCA, H2.IDHSTORICODIVIDABENEFICIO,    ');
      qryDet.SQL.Add('                                              H2.IDCONTROLEDIVIDABENEFICIO                                      ');
      qryDet.SQL.Add('                                         FROM HSTDIVIDABENEFICIO H2                                             ');
      qryDet.SQL.Add('                                        GROUP BY H2.IDHSTORICODIVIDABENEFICIO, H2.IDCONTROLEDIVIDABENEFICIO) M  ');
      qryDet.SQL.Add('                               WHERE M.IDHSTORICODIVIDABENEFICIO = H1.IDHSTORICODIVIDABENEFICIO                 ');

      if (rgTIPOCOB.ITEMINDEX = 5) then
         qryDet.SQL.Add('                                 AND M.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' )
      else if rgTIPOCOB.ITEMINDEX = 6 then
      begin
         qryDet.SQL.Add('                                 AND ((H1.FLGSITUACAO = 5  AND M.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+') OR ' );
         qryDet.SQL.Add('                                      (H1.FLGSITUACAO <> 5 AND M.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) )' );
      end
      //edilaine - SIG33744 - inicio
      else if (rgTipoOp.ItemIndex = 0) and ( (rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4))then
         qryDet.SQL.Add('                                 AND M.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' )
      //edilaine - SIG33744 - inicio
      else
         qryDet.SQL.Add('                                 AND M.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' );
      //edilaine - SIG71864 - fim

      if  (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
      begin
        qryDet.SQL.Add('               and h1.mescobranca = (SELECT max(H3.MESCOBRANCA) ');
        qryDet.SQL.Add('                                     FROM HSTDIVIDABENEFICIO H3 ');
        qryDet.SQL.Add('                                     WHERE                      ');
        qryDet.SQL.Add('                                          NVL(H3.CODDOCUMENTO,0) = 0 AND  ');
        qryDet.SQL.Add('                                          H3.FLGSITUACAO in (3,4) AND  ');
        qryDet.SQL.Add('                                          h3.idpessoa = h1.idpessoa and   ');
        qryDet.SQL.Add('                                          h3.idtitular = h1.idtitular and ');
        qryDet.SQL.Add('                                          h3.idpessjur = h1.idpessjur and ');
        qryDet.SQL.Add('                                          EXISTS (SELECT 1 FROM ( SELECT MAX(H4.MESCOBRANCA) MAXCOBRANCA, H4.IDHSTORICODIVIDABENEFICIO, ');
        qryDet.SQL.Add('                                                                         H4.IDCONTROLEDIVIDABENEFICIO ');
        qryDet.SQL.Add('                                                                    FROM HSTDIVIDABENEFICIO H4 ');
        qryDet.SQL.Add('                                                                   GROUP BY H4.IDHSTORICODIVIDABENEFICIO, H4.IDCONTROLEDIVIDABENEFICIO) M1 ');
        qryDet.SQL.Add('                                                          WHERE M1.IDHSTORICODIVIDABENEFICIO = H3.IDHSTORICODIVIDABENEFICIO ');
        //edilaine - SIG33744 - inicio
        if (rgTipoOp.ItemIndex = 0) and ( (rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4))then
           qryDet.SQL.Add('                                                          AND M1.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) ')
        else
           qryDet.SQL.Add('                                                          AND M1.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) ');      //edilaine - SIG71864
      end;
      //edilaine - SIG33744 - fim
    end;
  end;
  qryDet.SQL.Add('         ) H ');

  qryDet.SQL.Add('  WHERE H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO');

  if (rgTIPOCOB.ITEMINDEX <> 6) and (sFlgStatus <> '4') then
  begin
    if sFlgStatus =  '3' then
    begin
       qryDet.SQL.Add('    AND (C.Saldodevedoratual = 0 ');
       qryDet.SQL.Add('     OR (C.Saldodevedoratual > 0 AND C.FLGSTATUS = '+sFlgStatus+') )' );
    end
    else
    begin
       //qryDet.SQL.Add('    AND C.Saldodevedoratual > 0 ');                           //edilaine SIG115304
       qryDet.SQL.Add('    AND (C.Saldodevedoratual > 0 OR C.SaldoBaixaDef > 0)');     //edilaine SIG115304
    end;


    if sFlgStatus <>  '3' then
       qryDet.SQL.Add('    AND C.FLGSTATUS = '+sFlgStatus);
  end;

  //if sFlgStatus =  '2' then
  //   qryDet.SQL.Add('    AND NVL(C.ULTMESREAJ, TO_CHAR( ADD_MONTHS(TO_DATE('+QuotedStr(sAnoMes)+',''YYYY/MM''),-1),''YYYY/MM'')) < '+QuotedStr(sAnoMes) );

  qryDet.SQL.Add(' ORDER BY ');
  //qryDet.SQL.Add('          C.FLGSTATUS, ');
  qryDet.SQL.Add('          (select matricula from depentit d where d.idpessoa = c.idpessoa and d.idtitular = c.idtitular), ');
  qryDet.SQL.Add('          (select nome from pessoa p where p.idpessoa = c.idpessoa), ');
  qryDet.SQL.Add('          (select nome from beneficio where idbeneficio = c.idbeneficio)  ');
  qryDet.SQL.Add('          , h.mescobranca desc ');  //William Santana - SIG33744

  qryDet.SQL.Add('  ) T   '); //William Santana - SIG33744

  filtraDet(False);

  //qryDet.SQL.savetofile('c:\planus\controle '+rgTipoOp.Items.Strings[rgTipoOp.ItemIndex] +' '+rgTIPOCOB.Items.Strings[rgTIPOCOB.ItemIndex]+'.txt');

  qryDet.Active:=True;
end;


function TFrmCtrlDiviBenef_Novo.Mensagens(_idmsg: Integer): string;
begin
  case _idmsg of
     1:Result := 'Não existem aposentados ou pensionistas com dívidas de benefícios cadastradas.';
     2:Result := 'É necessário selecionar o Mês/Ano de Cobrança.';
     3:Result := 'É necessário selecionar um Tipo de Operação.';
     4:Result := 'É necessário selecionar um Tipo de Cobrança.';
     5:Result := 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.';
     6:Result := 'Preparo de parcela do mês para aposentado ou pensionista selecionado já efetuado.';
     7:Result := 'Envio de cobrança de parcela do mês para aposentado ou pensionista já efetuado.';
     8:Result := 'Aposentado ou pensionista selecionado não possui cobrança a receber.';
     9:Result := 'Aposentado ou pensionista selecionado não possui parcelas para desfazer o preparo.';
    10:Result := 'Aposentado ou pensionista selecionado não possui parcelas para desfazer o envio.';
    11:Result := 'Aposentado ou pensionista selecionado não possui parcelas recebidas para desfazer recebimento.';
    12:Result := 'Preparo efetuado com sucesso.';
    13:Result := 'Envio de cobranças efetuado com sucesso.';
    14:Result := 'Recebimento efetuado com sucesso.';
    15:Result := 'Preparo de parcelas de cobranças mensal desfeito com sucesso.';
    16:Result := 'Envio de parcelas de cobranças mensal desfeito com sucesso.';
    17:Result := 'Recebimento de parcelas de cobranças mensal desfeito com sucesso.';
    18:Result := 'É necessário selecionar pelo menos um aposentado ou pensionista para emissão do relatório.';
    20:Result := 'É obrigatório efetuar a marcação da atualização ou não do saldo devedor.';
  end;
end;


procedure TFrmCtrlDiviBenef_Novo.setPadraoInicial(_flag: Boolean);
begin
  btnProcessar.Enabled:=_flag;
  bbtnDesfazer.Enabled:=_flag;

  btnProcurar.Enabled:=not _flag;
  bbtnSair.Enabled:=not _flag;
  bbtnAjuda.Enabled:=not _flag;
end;


//Início - William Santana - SIG 27216
function TFrmCtrlDiviBenef_Novo.RetornaIndiceAcumulado(pData: string; var MsgErro : string): Double;
 var
  query:TwwQuery;
  sDtIni, sDtFim :string;
  fIndiceAcumulado: Double;
  dDtIni  : TDateTime;
begin
  query:=TwwQuery.Create(Self);
  query.DataBaseName :='BaseDados';
  query.Active:=false;

  try
     //edilaine - SIG33744 - inicio
     //sDtIni := '01/01/'+ inttostr(seAno.Value - 1);
     //sDtFim := '31/12/'+ inttostr(seAno.Value - 1);

//   Inicio SIG 131253
     if (qryDet.FieldByName('ULTMESREAJ').AsString = '') or
        (copy(qryDet.FieldByName('ULTMESREAJ').AsString,1,4) = inttostr(seAno.Value)) then
     begin
       // se ja teve reajuste no ano, buscar o indice de janeiro ate mes anterior ao preparo
       //
       if qryDet.FieldByName('ULTMESREAJ').AsString = '' then    // Inicio da divida
         sDtIni := '01/01/'+ Copy(pData,1,4)
       else
         sDtIni := '01/01/'+ inttostr(seAno.Value);
//       sDtFim := '31/'+formatfloat('00',(cbbMes.Itemindex))+'/'+ inttostr(seAno.Value);   //  SIG 131253
       sDtFim := '01/'+formatfloat('00',(cbbMes.Itemindex+1))+'/'+ inttostr(seAno.Value);     //  SIG 131253
       sDtFim := DateToStr(DiasUteis.SomaMeses(strtodate(sDtFim), -1));     //  SIG 131253  UltDiaMes achar o ultimo dia do mes  no DiasUteis
       sDtFim := DateToStr(DiasUteis.UltDiaMes(strtoint(Copy(sDtFim,7,4)),strtoint(Copy(sDtFim,4,2))));  //  SIG 131253
     end
     else
     begin
       // se nao teve reajuste no ano, buscar o indice dos 12 meses anteriores ao preparo
       dDtIni := StrToDate('01/'+formatfloat('00',(cbbMes.Itemindex+1))+'/'+inttostr(seAno.Value));
//       sDtFim := DateToStr(DiasUteis.SomaMeses(dDtIni, -1));   //  SIG 131253
       sDtFim := DateToStr(DiasUteis.SomaMeses(dDtIni, -1));     //  SIG 131253  UltDiaMes achar o ultimo dia do mes  no DiasUteis
       sDtFim := DateToStr(DiasUteis.UltDiaMes(strtoint(Copy(sDtFim,7,4)),strtoint(Copy(sDtFim,4,2))));   //  SIG 131253
  //       sDtIni := DateToStr(DiasUteis.SomaMeses(dDtIni, -13));  //  SIG 131253
       sDtIni := DateToStr(DiasUteis.SomaMeses(dDtIni, -12));    //  SIG 131253
     end;
// Fim

     if (pData <> EmptyStr) then
     begin
       if StrToInt(Copy(pData,1,4)) = DiasUteis.ExtraiAno(StrToDate(sDtIni))  then
          sDtIni := '01/'+ Copy(pData,6,2)+'/'+Copy(pData,1,4)
       else if StrToInt(Copy(pData,1,4)) > DiasUteis.ExtraiAno(StrToDate(sDtIni)) then
       begin
         result  := -1;
         MsgErro := 'Erro ao definir período para índice de reajuste';
         exit;
       end;
     end;

     {sDtFim := '31/12/'+ IntToStr(DiasUteis.ExtraiAno(date)-1);

     if (pData <> EmptyStr) then
     begin
       if (Copy(pData,1,4) >= IntToStr(DiasUteis.ExtraiAno(date)-1))  then
         sDtIni := '01/'+ Copy(pData,6,2)+'/'+Copy(pData,1,4)
       else
        sDtIni := '01/01/'+ IntToStr(DiasUteis.ExtraiAno(date)-1);
     end
     else
       sDtIni := sDtFim;
     } //edilaine - SIG33744 - fim

     //Utilizar indice INPC
     query.SQL.Clear;
     query.SQL.Add('SELECT  ((cotvalor)/100 +1) FATORINDICE ');
     query.SQL.Add('  FROM COTACAOMOEDA');
     query.SQL.Add(' WHERE MOECODIGO = 7 ');
     query.SQL.Add('   AND COTDATA BETWEEN TO_DATE('+#39+sDtIni+#39+', ''DD/MM/YYYY'')');          //edilaine - SIG33744
     query.SQL.Add('                   AND TO_DATE('+#39+sDtFim+#39+', ''DD/MM/YYYY'')');          //edilaine - SIG33744

     //edilaine - SIG33744 - inicio
     { ///Reb/Novo plano, Reg replan Saldado (74,66,28)
     if (qrydet.FieldByName('idplanoprev').text='74') or (qrydet.FieldByName('idplanoprev').text='66') or (qrydet.FieldByName('idplanoprev').text='28') then
       begin
          query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
          query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
          query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJINSS)');
          query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
          query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
          query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJBENEFICIO)');
       end;
     }//edilaine - SIG33744 - fim

     query.open;

     fIndiceAcumulado := 1;
     while not query.Eof do
      begin
        fIndiceAcumulado := fIndiceAcumulado * query.fieldbyname('FATORINDICE').AsFloat;
        query.Next;
      end;

     if fIndiceAcumulado < 1 then
        fIndiceAcumulado := 1;

     result :=  fIndiceAcumulado;
  finally
     query.close;
     FreeAndNil(query);
  end;
end;
//Término - William Santana - SIG 27216


procedure  TFrmCtrlDiviBenef_Novo.VerificaMarcaItensNaoExibidos;
 var
   sMatrAnt, sSelAnt : string;
begin
   //verificar se o registro foi selecionado,
   // se sim verificar se o próximo registro tem a mesma matricula do item anterior e se não exibe na grid
   // para marcar como seleciona e processar todas as parcelas existentem na HISTDIVIDABEBEFICIO
   // a marcação só será feita se para os registros com 'ano/mes cobrança' igual ao selecionado na tela
   sMatrAnt := '';
   qryDet.DisableControls;
   qryDet.Filtered := False;
   qryDet.First;
   try
     while not qryDet.Eof do
     begin
       sMatrAnt := qryDet.FieldByName('Matricula').AsString;
       sSelAnt  := qryDet.FieldByName('Selecionar').AsString;
       qryDet.Next;
       if (qryDet.FieldByName('MostraGrid').AsString = 'N') and
          (qryDet.FieldByName('Matricula').AsString = sMatrAnt) and (sSelAnt = 'S') and
          (qryDet.FieldByName('MESCOBRANCA').AsString = inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1)) )
       then
       begin
        if qryDet.State <> DsEdit then qryDet.Edit;
        qryDet.FieldByName('Selecionar').AsString := 'S';
       end;
     end;

     //if qryDet.State = DsEdit then
     //   qryDet.ApplyUpdates;
   finally
     qryDet.EnableControls;
     filtraDet(true);
   end;
end;


function TFrmCtrlDiviBenef_Novo.UpdateHSTDIVIDABENEFICIO(_flgsituacao :string;
                                                         _flgdescfolha:string = '') : boolean; // SOL 230290 KINTANA 350993
 var
  query,query2 :TwwQuery;
  sIDHSTFOLHABENEF,sDATARECEBIMENTO,sCODPROVDESC :string;
  dVALORRECEBIDO :Double;
  dSALDODEVEDOR :Double;
  dVALORRECSINAL : Double;
  sTipoMov : string;    //edilaine SIG126276


    procedure VerificaValorRecebimento(_CODDOCUMENTO :string ) ;
     begin

         //if (qrydet.FieldByName('CODPORTFORMA').text = '0') then
         if (qrydet.FieldByName('TIPOPAGAMENTO').text = 'F') then  //FOLHA
         begin
           query.close;
           query.SQL.Clear;
           query.SQL.Add('Select T.DATARECEBIMENTO, T.CODPROVDESC, L.IDHSTFOLHABENEF, ');
           query.SQL.Add('       T.VALORRECEBIDO, ');
           query.SQL.Add('       NVL(DECODE(T.FLGDESCONTO, 1, T.VALORRECEBIDO, -T.VALORRECEBIDO),0) VALORSINAL ');
           query.SQL.Add('  FROM TMPDESC T ');
           query.SQL.Add('  JOIN LOTEXHSTFOLHABENEF L    ');
           query.SQL.Add('    ON L.IDLOTE = T.LOTEPREVIA ');
           query.SQL.Add(' WHERE REFERENCIA  = '+QuotedStr(qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text));
           query.SQL.Add('   AND IDPESSOA    = '+qrydet.FieldByName('IDPESSOA').text  );
           query.SQL.Add('   AND IDTITULAR   = '+qrydet.FieldByName('IDTITULAR').text );
           query.SQL.Add('   AND MESCOBRANCA = '+QuotedStr(qrydet.FieldByName('MESCOBRANCA').text) );
           query.Open;

           sDATARECEBIMENTO := query.fieldbyname('DATARECEBIMENTO').text;
           dVALORRECEBIDO   := query.fieldbyname('VALORRECEBIDO').AsFloat;
           sCODPROVDESC     := query.fieldbyname('CODPROVDESC').text;
           sIDHSTFOLHABENEF := query.fieldbyname('IDHSTFOLHABENEF').text;
           dVALORRECSINAL   := query.fieldbyname('VALORSINAL').AsFloat;

         end
         else
         begin

           query.SQL.Clear;
           query.SQL.Add('SELECT L.DATALANCTO, D.RECPAG, L.VALOR AS VALORRECEBIDO, ');
           query.SQL.Add('       DECODE(D.RECPAG, ''R'', NVL(L.VALOR,0), NVL(-L.VALOR,0)) VALORSINAL ');
           //query.SQL.Add('       NVL(DECODE(L.DEBCRE, ''D'', L.VALOR, -L.VALOR),0) VALORRECEBIDO ');
           query.SQL.Add('  FROM LANCTODOCUM L');
           query.SQL.Add('  JOIN DOCUMENTO   D');
           query.SQL.Add('    ON D.CODDOCUMENTO = L.CODDOCUMENTO ');
           query.SQL.Add(' WHERE L.CODDOCUMENTO = '+Trim(_CODDOCUMENTO));
           if _flgsituacao = '3' then
              query.SQL.Add('   AND L.OPERACAO = 5'); //5 é recebido
           query.Open;

           sDATARECEBIMENTO := query.fieldbyname('DATALANCTO').text;
           dVALORRECEBIDO   := query.fieldbyname('VALORRECEBIDO').AsFloat;
           dVALORRECSINAL   := query.fieldbyname('VALORSINAL').AsFloat;
         end;

     end;
begin
  result := true;

  sTipoMov := '';    //edilaine SIG126276

  try
      query:=TwwQuery.Create(Self);
      query.DataBaseName :='BaseDados';
      query.Active:=false;

      query2:=TwwQuery.Create(Self);
      query2.DataBaseName :='BaseDados';
      query2.Active:=false;

      //atribui valores
      VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value);

      query.SQL.Clear;
      query.SQL.Add('UPDATE HSTDIVIDABENEFICIO');

      if _flgsituacao = '3' then
      begin
         //if (qrydet.FieldByName('CODPORTFORMA').text = '0') then
         if (qrydet.FieldByName('TIPOPAGAMENTO').text = 'F') then  //FOLHA
         begin
           if qrydet.FieldByName('VALORPREVISTO').AsFloat = dVALORRECSINAL then
              query.SQL.Add('   SET FLGSITUACAO ='+'3')
           else
              query.SQL.Add('   SET FLGSITUACAO ='+'4');

           query.SQL.Add('   , IDHSTFOLHABENEF  ='+#39+sIDHSTFOLHABENEF+#39);
         end
         else
            query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao);

         query.SQL.Add('   , VALORRECEBIDO ='+OraNumero(FloatToStr(dVALORRECSINAL)));
         query.SQL.Add('   , DATAEFETIVA  ='+#39+sDATARECEBIMENTO+#39);

      end
      else
      begin
         query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao);
         //edilaine SIG128237 : inicio
         if (_flgsituacao = '1') and (sDataFolha <> '') then
            query.SQL.Add('   , DATAPREVISTA  ='+QuotedStr(sDataFolha) );
         //edilaine SIG128237 : fim

         //if (Trim(qrydet.FieldByName('CODPORTFORMA').text) > '0') then
         if (qrydet.FieldByName('TIPOPAGAMENTO').text = 'B') then  //BOLETO
            query.SQL.Add('   , CODDOCUMENTO  ='+#39+inttostr(lCodLancCAPCAR)+#39);
      end;

      query.SQL.Add(' WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
      try
        query.ExecSQL;
        GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
      except
        result := false;
      end;

      if (result) and (_flgsituacao = '3') then
      begin

        query2.SQL.Clear;
        query2.SQL.Add('SELECT SALDODEVEDORATUAL, QUANTIDADEPARCELASPAGAS');
        query2.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO');
        query2.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query2.open;

        dSALDODEVEDOR := query2.FieldByName('SALDODEVEDORATUAL').AsFloat;

        query.SQL.Clear;
        query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');

        if (dSALDODEVEDOR - dVALORRECSINAL) > 0 then
        begin
           query.SQL.Add('   SET FLGQUITADO =0');

           dSALDODEVEDOR := dSALDODEVEDOR - dVALORRECSINAL;
        end
        else if (dSALDODEVEDOR <= dVALORRECEBIDO) then
        begin
          query.SQL.Add('   SET FLGQUITADO = 1');
          query.SQL.Add('     , FLGSTATUS  = 3');

          dSALDODEVEDOR := 0;

          {quitacao}
          sTipoMov := '6';    //edilaine SIG126276
        end;

        query.SQL.Add('   , SALDODEVEDORATUAL  ='+OraNumero(FloatToStr(dSALDODEVEDOR)));
        query.SQL.Add('   , VALORULTIMAPARCELA ='+OraNumero(FloatToStr(dVALORRECEBIDO)));
        query.SQL.Add('   , QUANTIDADEPARCELASPAGAS ='+OraNumero(FloatToStr(query2.FieldByName('QUANTIDADEPARCELASPAGAS').Value+1)));
        query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO  = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);

        try
           query.ExecSQL;

          {insere movimento }
          //edilaine SIG126276 : inicio
          if sTipoMov <> '' then
             CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, sTipoMov, query2.FieldByName('SALDODEVEDORATUAL').AsString );
          //edilaine SIG126276 - fim

          GravaLogTOTALPREV ('CONTROLEDIVIDABENEFICIO -UPDATE- IDCONTROLEDIVIDABENEFICIO = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        except
          result := false;
        end;

      end;

  finally
    query.close;
    query2.close;
    FreeAndNil(query);
    FreeAndNil(query2);
  end;
end;



procedure TFrmCtrlDiviBenef_Novo.ExecutarPreparo;
var
  query:TwwQuery;
  novosaldodev:Double;
  qtparcelas:Integer;
  valorparcela:Double;
  bPassou      : boolean;
  flgportforma : integer;  // edilaine - 22/01/2014 - SOL 174933
  flgdescfolha : string;   // edilaine - 22/01/2014 - SOL 174933
  saldoacumulado : Double; //William Santana - SIG 27216
  sAnoMes, sCodPortForma : string;        //edilaine - SIG33744
  sMsgErro : string;                      //edilaine - SIG33744
begin

  filtraDet(true);

  if qryDet.IsEmpty then begin
    MsgDlg('É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
    //qryDet.Filtered := False;   //William Santana - SIG33744
    filtraDet(False);             //William Santana - SIG33744
    Exit;
  end;

  query  := TwwQuery.Create(Self);
  query.DataBaseName := 'BaseDados';

  try
    //edilaine - SIG33744 : inicio
    tempoInicio := now;

    memResult.clear;
    memResult.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('');
    //edilaine - SIG33744 : fim

    bPassou := true;

    qryDet.First;
    while not qryDet.eof do begin

       If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Rollback;
       dtmBaseDados.dbBaseDados.StartTransaction;

       sMsgErro := '';

       //BRUNO AZEVEDO INÍCIO SIG33744
       if (qryDet.FieldByName('FLGSTATUS').AsInteger = 3) or
          (qryDet.FieldByName('FLGQUITADO').AsInteger = 1) then begin

          sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +
                       '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' Preparo de dívida quitada não efetuado';
          memResult.Lines.Add( sMensagem );
         qrydet.next;
         Continue;
       end;
       //BRUNO AZEVEDO FIM SIG33744

       query.close;
       query.SQL.Clear;
       query.SQL.Add('  SELECT *');
       query.SQL.Add('    FROM HSTDIVIDABENEFICIO');
       query.SQL.Add('   WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
       //edilaine - SIG33744 - inicio
       query.SQL.Add('     AND FLGSITUACAO between 0 and 5');
       query.SQL.Add('     AND MESCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1))+#39);
       {
       query.SQL.Add(' union ');
       query.SQL.Add('  SELECT * ');
       query.SQL.Add('   FROM HSTDIVIDABENEFICIO H1 ');
       query.SQL.Add('  WHERE H1.IDCONTROLEDIVIDABENEFICIO = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
       query.SQL.Add('    AND H1.FLGSITUACAO = 5 ');
       query.SQL.Add('    AND H1.MESCOBRANCA between '+#39+inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1))+#39);
       query.SQL.Add('    AND H1.MESCOBRANCA = (SELECT MAX(H2.MESCOBRANCA)   ');
       query.SQL.Add('                            FROM HSTDIVIDABENEFICIO H2 ');
       query.SQL.Add('                           WHERE H2.IDCONTROLEDIVIDABENEFICIO = H1.IDCONTROLEDIVIDABENEFICIO ');
       query.SQL.Add('                           HAVING SUBSTR(MAX(H2.MESCOBRANCA),1,4) >= '+#39+inttostr(seAno.Value-1)+#39);
       query.SQL.Add('                          ) ');   }
       //edilaine - SIG33744 - fim
       query.Active := True;

       if not query.IsEmpty then
       begin
          sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +
                       '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' Preparo da parcela do mês já efetuado';
          memResult.Lines.Add( sMensagem );
          qrydet.next;
          Continue;
       end;
       query.Active := False;

       //edilaine - SIG33744 - inicio
       novosaldodev := 0;
       sAnoMes      := inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1));
       //edilaine - SIG33744 - fim

       if (rgATUALIZARS.ItemIndex = 0) and
          (qryDet.FieldByName('Flgatualizarsaldo').AsInteger = 1) then            //edilaine - SIG33744
         begin
           //Início - William Santana - SIG 27216
           saldoacumulado := RetornaIndiceAcumulado(qrydet.FieldByName('primeiroMesCobr').AsString, sMsgErro);
           if saldoacumulado > 0 then
           begin
             saldoacumulado := Arredonda(saldoacumulado, 4 {2});  // SIG 131253    //edilaine SIG131706

             novosaldodev := qrydet.FieldByName('SaldoDevAtual').AsFloat * saldoacumulado;              //MIGRACAO-ORACLE
             valorparcela := qrydet.FieldByName('VlrParcela').AsFloat * saldoacumulado;                 //MIGRACAO-ORACLE

             novosaldodev := Arredonda(novosaldodev, 2); //edilaine - SIG33744
             valorparcela := Arredonda(valorparcela, 2); //edilaine - SIG33744

             //lançar o saldo como valor da ultima parcela caso sejam divergentes em até 10 reais
             if (abs(novosaldodev - valorparcela) <= 10) or (novosaldodev < valorparcela) then
                valorparcela := novosaldodev;

             //Término - William Santana - SIG 27216
             query.close;
             query.SQL.Clear;
             query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
             query.SQL.Add('   SET SALDODEVEDORATUAL =' +OraNumero(formatfloat('0.00',novosaldodev)));
             query.SQL.Add('  , VALORPARCELA ='+OraNumero(formatfloat('0.00',valorparcela)));
             query.SQL.Add('  , ULTMESREAJ = '+QuotedStr(sAnomes) );   //edilaine - SIG33744
             query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
             query.ExecSQL;

             {insere movimento de reajuste}
             CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '8', qrydet.FieldByName('SaldoDevAtual').AsString );   //edilaine SIG126276   //MIGRACAO-ORACLE

           end;

           if sMsgErro <> '' then
           begin
             sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +               //MIGRACAO-ORACLE
                          '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                          sMsgErro+' | Parcela: '+qrydet.FieldByName('VlrParcela').AsString;             //MIGRACAO-ORACLE
             memResult.Lines.Add( sMensagem );
             bPassou := false;
             qrydet.next;
             Continue;
           end;
         end
       else
         begin
           //lançar o saldo como valor da ultima parcela caso sejam divergentes em até 10 reais
           if (abs(qrydet.FieldByName('SaldoDevAtual').Value - qrydet.FieldByName('VlrParcela').Value) <= 10) or       //MIGRACAO-ORACLE
              (qrydet.FieldByName('SaldoDevAtual').Value < qrydet.FieldByName('VlrParcela').Value) then                //MIGRACAO-ORACLE
              valorparcela := qrydet.FieldByName('SaldoDevAtual').Value                                                //MIGRACAO-ORACLE
           else
              valorparcela := qrydet.FieldByName('VlrParcela').Value;                                                  //MIGRACAO-ORACLE
         end;

       if qrydet.FieldByName('FLGSITUACAO').Text = '0' then
         begin
          //edilaine - SIG33744 - inicio
          //MsgDlg( 'Preparo de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Informação',mtInformation,[mbOk],0);
          sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +                                //MIGRACAO-ORACLE
                       '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' Preparo da parcela do mês já efetuado';
          memResult.Lines.Add( sMensagem );
          //edilaine - SIG33744 - fim
          qrydet.next;
          Continue;
         end;

       try

         sCodPortForma := qrydet.FieldByName('FLGPORTFORMA').AsString;
         if (sCodPortForma = '') or (sCodPortForma = '0') then
            sCodPortForma := qrydet.FieldByName('CODPORTFORMA').AsString;

         flgDescFolha := '';
         if (sCodPortForma <> '') and (sCodPortForma <> '0') then
            flgDescFolha := 'P'
         else
            flgDescFolha := 'B';


         if InserirHSTDIVIDABENEFICIO( qrydet.FieldByName('IniCobr').text,         //MIGRACAO-ORACLE
                                               inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1)),
                                               FloatToStr(valorparcela),
                                               inttostr(seAno.Value)+'/'+ formatfloat('00',(cbbMes.Itemindex+1)),
                                               iif(qryDet.FieldByName('FLGSTATUS').AsInteger = 1, '0', '5'),
                                               '0',
                                               sCodPortForma,
                                               qrydet.FieldByName('SaldoDevAtual').AsString,    //edilaine - SIG33744        //MIGRACAO-ORACLE
                                               iif(novosaldodev=0, 'null', qrydet.FieldByName('VlrParcela').AsString)        //MIGRACAO-ORACLE
                                             ) then
         begin
           sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                        '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                        ' Preparo efetuado';
           memResult.Lines.Add( sMensagem );

           If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.commit;
         end
         else
         begin
           sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +        //MIGRACAO-ORACLE
                        '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                        ' Erro ao inserir Histórico da Dívida';
           memResult.Lines.Add( sMensagem );
           bPassou := false;
         end;

       except
        on E:Exception do
        begin
           sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +        //MIGRACAO-ORACLE
                        '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                        ' Erro inesperado: '+e.Message;
           memResult.Lines.Add( sMensagem );
           memResult.Lines.Add('');
           bPassou := false;
           exit;
         end;
       end;

       qrydet.Next;
    end;

  finally
    //edilaine SIG33744 : inicio
    If dtmBaseDados.dbBaseDados.InTransaction   Then
       dtmBaseDados.dbBaseDados.Rollback;

    tempoFim := now;

    memResult.Lines.Add('');
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('Tempo total de processamento: ' + formatdatetime('hh:nn:ss', tempoFim-tempoInicio));
    memResult.Lines.Add('');
    pgControlDetalhe.ActivePage := tabResultado;

    SalvaResultado(memResult, 'Preparo', 'DIVIDA_BENEFICIO_LOG');
    //edilaine SIG33744 : fim


    filtraDet(False);         //William Santana - SIG33744
    if bPassou then
       MsgDlg( 'Preparo efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
    else
    begin
       MsgDlg( 'Preparo efetuado com restrições. Verifique.','Informação',mtInformation,[mbOk],0);

       btnProcessar.Enabled := (cbbStatusDivida.ItemIndex = 0) or (cbbStatusDivida.text = '') or (bReajustaSuspensa);
       bbtnDesfazer.Enabled := (cbbStatusDivida.ItemIndex = 0) or (cbbStatusDivida.text = '') or (bReajustaSuspensa);
    end;
    
    FreeAndNil(query);
  end;

end;




procedure TFrmCtrlDiviBenef_Novo.ExecutarEnvio;
var
  query_temp : TwwQuery;
  sContaLiquido,    sCODPORTFORMA,
  sUNIDNEGOC,       sCODTIPDOC,
  sCODTIPRECDES,    sCODCENTRORESPON,
  sCODFORMA,        sPLANO,
  sCODCENTROCUSTOC, sCODPROVDESC,
  sPLACONTAD,       sTIPCODIGO,
  sIDPLANPREVCONTAB : string;
  bPassou  : boolean;

  recPag   : string;         //William Santana - SIG33744
  iRetorno : integer;        //edilaine - SIG33744
  recParam : TParametros;    //edilaine - SIG33744
begin

   //edilaine - SIG33744 - inicio
   if rgTipoPagto.ItemIndex = -1 then
   begin
      MsgDlg('Selecione o Tipo de Pagamento. ','Informação',mtInformation,[mbOk],0);
      Exit;
   end;
   //edilaine - SIG33744 - fim

   iIdLoteConcessao := 0;

   if (iIdLoteConcessao <= 0) and (rgTipoPagto.ItemIndex = 1)   //edilaine - SIG33744
   then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                                       iFlgIncluiMesConc
                                                      );
      if iIdLoteConcessao <= 0
      then begin
         MsgDlg('Nenhum lote selecinado para efetuar o Controle de Dívidas. Verifique. ','Erro',mtError,[mbOk],0);
         Exit;
      end;

      sDataFolha := CriticaDataCobrancaSit( qryAux,
                                            IntToStr(iIdFundacao),'', 'AS', 'P',
                                            Copy(sAnoMesLoteConcessao,6,2),
                                            Copy(sAnoMesLoteConcessao,1,4) );
   end;


   query_temp:=TwwQuery.Create(Self);
   query_temp.DataBaseName :='BaseDados';

   try
     query_temp.Active:=false;
     query_temp.SQL.Clear;

     filtraDet(true);

     if qrydet.IsEmpty then
      begin
        MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
        //qrydet.Filtered:=False; //William Santana - SIG33744
         filtraDet(False);        //William Santana - SIG33744
        Exit;
      end;

     //edilaine - SIG33744 : inicio
     tempoInicio := now;

     memResult.clear;
     memResult.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
     memResult.Lines.Add('---------------------------------------------------------------');
     memResult.Lines.Add('');
     //edilaine - SIG33744 : fim

     bPassou := true;

     qrydet.First;
     while not qrydet.eof do
      begin

        If dtmBaseDados.dbBaseDados.InTransaction Then
           dtmBaseDados.dbBaseDados.Rollback;
        dtmBaseDados.dbBaseDados.StartTransaction;

        //BRUNO AZEVEDO INÍCIO SIG33744
        if (qryDet.FieldByName('FLGSTATUS').AsInteger <> 1) or
           (qryDet.FieldByName('FLGQUITADO').AsInteger = 1) then begin

           sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                        '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                        ' Envio de dívida '+iif(qryDet.FieldByName('FLGSTATUS').AsInteger = 2, 'suspensa', 'quitada')+' não efetuado';
           memResult.Lines.Add( sMensagem );
          qrydet.next;
          Continue;
        end;
        //BRUNO AZEVEDO FIM SIG33744

        if qrydet.FieldByName('FLGSITUACAO').Text <> '0' then
          begin
            sMensagem := iif(qryDet.FieldByName('IDPESSOA').AsInteger = qryDet.FieldByName('IDTITULAR').AsInteger, 'aposentado', 'pensionista');
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +           //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Envio de parcela do mês para '+ sMensagem + ' já efetuado';
            memResult.Lines.Add( sMensagem );
            qrydet.next;
            Continue;
          end;

        try

          //Início - William Santana - SIG33744
          if (qrydet.FieldByName('VALORPREVISTO').Value > 0) then
             recpag := 'R'
          else
             recpag := 'P';
          //Término - William Santana  - SIG33744

          //edilaine SIG33744 : inicio
          //recParam := BuscaParametros(qryDet, query_temp); //leandro SIG136150
          recParam := BuscaParametrosNovo(qryDet, query_temp);   //leandro SIG136150
          if not recParam.OK then
          begin
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +          //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Erro ao buscar parametros para Envio';
            memResult.Lines.Add( sMensagem );
            bPassou := false;
            qrydet.next;
            Continue;
          end;
          //edilaine SIG33744 : fim

          lCodLancCAPCAR := 0; // Andre Imakawa - SIG 32962

          //if (qrydet.FieldByName('CODPORTFORMA').Text = '')or (qrydet.FieldByName('CODPORTFORMA').Text = '0') then    // edilaine - 22/01/2014 - SOL 174933  // edilaine - SIG33744
          if (recParam.sCODPORTFORMA = '') or (recParam.sCODPORTFORMA = '0') or (recParam.sCODPORTFORMA = '-1') then    // edilaine - SIG33744
            begin
              //iRetorno := InsereTmpDesc(qryDet, recParam, iIdLoteConcessao);    //edilaine SIG126276
              iRetorno := LancaTmpDesc(qryDet, recParam, iIdLoteConcessao,0, sAnoMesLoteConcessao);       //edilaine SIG126276  // WO22455 passando parametro vazio de ano e mes Ferrari
              if iRetorno < 0 then
              begin
                //edilaine SIG33744 : inicio
                case iRetorno of
                  -1 : sMensagem := 'Falta parametrização de rubricas';
                  -2 : sMensagem := 'Erro ao inserir TMPDESC';
                end;
                sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +              //MIGRACAO-ORACLE
                             '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                             sMensagem;
                memResult.Lines.Add( sMensagem );
                bPassou := false;
                qrydet.next;
                Continue;
              end
              else
                GravaLogTOTALPREV ('TMPDESC -Insert- (REFERENCIA)IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);

            end
          else //if qrydet.FieldByName('CODPORTFORMA').Text<>'' then           // edilaine - SIG33744
            begin

              ctrlDocumento.Prepare(OpDocumento,odlEfetivo);
              ctrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
              ctrlDocumento.IdUsuario:=Sistema.IdUsuario;

              lCodLancCAPCAR:=Ctrldocumento.GetSequenceDocumento;

              if not LancaDoc(qryDet, CtrlDocumento,
                  lCodLancCAPCAR,
                  //qrydet.FieldByName('IDTITULAR').Value      // edilaine - 22/01/2014 - SOL 174933
                  -1, //NÃO VINCULAR PLANILHA ORIGINAL AO NOVO DOCUMENTO A PAGAR
                  qrydet.FieldByName('IDPESSOA').Value,
                  StrtoInt(recParam.sCODPORTFORMA),
                  StrtoInt(recParam.sUNIDNEGOC),
                  StrToInt(recParam.sCODTIPDOC),
                  DateToStr(StrToDate(DateToStr(Now))),
                  qrydet.FieldByName('DATAPREVISTA').AsString, // DateToStr(StrToDate(DateToStr(Now))),///vencimento ver
                  IntToStr(lCodLancCAPCAR),
                  {dblkFolha.Text}'', ////ver
                  recParam.sCODTIPRECDES,
                  recParam.sCODCENTRORESPON,
                  iif(recParam.sCODCENTROCUSTOC = '-1', '', recParam.sCODCENTROCUSTOC),        //edilaine - SIG33744
                  recParam.sContaLiquido,
                  {'R'} recpag,     //William Santana - SIG33744
                  //BRUNO AZEVEDO INÍCIO SIG33744
                  abs(qryDet.FieldByName('VALORPREVISTO').AsFloat),
                  //qrydet.FieldByName('Vlr Parcela').Value,
                  //BRUNO AZEVEDO FIM SIG33744
                  strtoint(recParam.sCODFORMA)
                  ) then
              begin
                //edilaine SIG33744 : inicio
                sMensagem := CtrlDocumento.MessageInfo;
                if sMensagem = '' then
                   sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +        //MIGRACAO-ORACLE
                                '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                                ' Erro no envio para Contas a Receber';
                memResult.Lines.Add( sMensagem );
                bPassou := false;
                qrydet.next;
                continue;
                //edilaine SIG33744 : fim
              end;

            end;

          if UpdateHSTDIVIDABENEFICIO('1') then  ///flgsituacao = 1
            begin
              sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +            //MIGRACAO-ORACLE
                           '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                           ' Envio OK '+iff(lCodLancCAPCAR > 0, '[Documento: '+IntToStr(lCodLancCAPCAR)+']', '');
              memResult.Lines.Add( sMensagem );

              If dtmBaseDados.dbBaseDados.InTransaction Then
                 dtmBaseDados.dbBaseDados.commit;
            end
          else
            begin
              sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +            //MIGRACAO-ORACLE
                           '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                           ' Erro ao atualizar Histórico da Dívida';
              memResult.Lines.Add( sMensagem );
              bPassou := false;
            end;

        except
          on E:Exception do
          begin
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +                //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Erro inesperado: '+e.Message;
            memResult.Lines.Add( sMensagem );
            memResult.Lines.Add('');
            bPassou := false;
            Exit;
          end;
        end;

        qrydet.Next;
      end;

   finally
     //edilaine SIG33744 : inicio
     If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;

     tempoFim := now;

     memResult.Lines.Add('---------------------------------------------------------------');
     memResult.Lines.Add('Tempo total de processamento: ' + formatdatetime('hh:nn:ss', tempoFim-tempoInicio));
     memResult.Lines.Add('');
     pgControlDetalhe.ActivePage := tabResultado;

     SalvaResultado(memResult, 'Envio', 'DIVIDA_BENEFICIO_LOG');
     //edilaine SIG33744 : fim

     if bPassou then
        MsgDlg('Envio de cobranças efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
     else
        MsgDlg('Envio de cobranças efetuado com restrições. Verifique','Informação',mtInformation,[mbOk],0);

     filtraDet(False);         //William Santana - SIG33744

     FreeAndNil(query_temp);
   end;
end;



function TFrmCtrlDiviBenef_Novo.InserirHSTDIVIDABENEFICIO(_MESREFERENCIA, _MESCOBRANCA, _VLQUITACAO, _dataprevista,
                                                           _FLGSITUACAO,   _flgParcial,  _CODPORTFORMA : string;
                                                           _VLRSALDOANT   : string = 'null';
                                                           _VLRPARCELAANT : string = 'null') : boolean;
var
  idhstcontrole,qtparcela:Integer;
  _query,_queryx:TwwQuery;
  dataprevistacalc:string;
  i:Integer;
  _TIPOPAGTO, _FLGDESCFOLHA : string;                     //edilaine - SIG33744
begin
  result := true;

  dataprevistacalc := '20/'+formatfloat('00',(cbbMes.Itemindex+1))+'/'+inttostr(seAno.Value);

  _queryx:=TwwQuery.Create(Self);
  _queryx.DataBaseName :='BaseDados';
  _queryx.Active:=false;

  _query:=TwwQuery.Create(Self);
  _query.DataBaseName :='BaseDados';
  _query.Active:=false;

  try
    //Início - William Santana - SIG33744
    IF (_CODPORTFORMA='') or (_CODPORTFORMA ='0') then
     begin
       _FLGDESCFOLHA:='B';
       _CODPORTFORMA:='null';
       _TIPOPAGTO := 'F';                   //edilaine - SIG33744
     end
     else
     begin
       _FLGDESCFOLHA:='';
      _TIPOPAGTO := 'B';                   //edilaine - SIG33744
     end;
    //Término - William Santana - SIG33744

    repeat
      _queryx.Active:=false;
      _queryx.sql.clear;
      _queryx.SQL.Add('SELECT * FROM FERIADOS');
      _queryx.SQL.Add('WHERE DATAFERIADO = '+#39+dataprevistacalc+#39);
      _queryx.open;
      if not _queryx.IsEmpty then
         dataprevistacalc := FormatFloat('00',strtoint(Copy(dataprevistacalc,1,2))+1)+copy(dataprevistacalc,3,8);
    until (_queryx.IsEmpty);

    //William Moreira da Silva - SOL 231370 PPM 373133
    //_queryx.sql.clear;
    //_queryx.SQL.Add('SELECT (COUNT(*)+1)NEXTQT FROM HSTDIVIDABENEFICIO');
    //_queryx.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO ='+_IDCONTROLE);
    //_queryx.Active:=True;

    _queryx.sql.clear;
    _queryx.SQL.Add('SELECT (QUANTIDADEPARCELASPAGAS + 1) as NEXTQT ');
    _queryx.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO');
    _queryx.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+ qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
    _queryx.Active:=True;
    //William Moreira da Silva - SOL 231370 PPM 373133

    qtparcela := _queryx.fieldbyname('NEXTQT').Value;

    _MESREFERENCIA:=COPY(_MESREFERENCIA,7,4)+'/'+COPY(_MESREFERENCIA,4,2);

    idhstcontrole:= (LeUltRegistro(Nil,'HSTDIVIDABENEFICIO'));

    _query.close;
    _query.sql.Clear;
    _query.SQL.Add('insert into HSTDIVIDABENEFICIO');
    _query.SQL.Add('  (IDHSTORICODIVIDABENEFICIO,');
    _query.SQL.Add('   IDHISTORICODIVIDABENEFICIOREF,');
    _query.SQL.Add('   IDCONTROLEDIVIDABENEFICIO,');
    _query.SQL.Add('   IDPESSOA,');
    _query.SQL.Add('   IDTITULAR,');
    _query.SQL.Add('   IDPESSJUR,');
    _query.SQL.Add('   IDBENEFICIO,');
    _query.SQL.Add('   IDPLANOPREV,');
    _query.SQL.Add('   MESREFERENCIA,');
    _query.SQL.Add('   MESCOBRANCA,');
    _query.SQL.Add('   NUMEROPARCELA,');
    _query.SQL.Add('   VALORPREVISTO,');
    _query.SQL.Add('   VALORRECEBIDO,');
    _query.SQL.Add('   DATAPREVISTA,');
    _query.SQL.Add('   DATAEFETIVA,');
    _query.SQL.Add('   IDHSTFOLHABENEF,');
    _query.SQL.Add('   CODPORTFORMA,');
    _query.SQL.Add('   FLGDESCFOLHA,');
    _query.SQL.Add('   FLGSITUACAO,');
    //edilaine - SIG33744 - inicio
    _query.SQL.Add('   SALDODEVEDORANT,');
    _query.SQL.Add('   VALORPARCELAANT,');
    _query.SQL.Add('   TIPOPAGAMENTO,');
    _query.SQL.Add('   FLGDEVOLUCAO,');
    //edilaine - SIG33744 - fim
    _query.SQL.Add('   OBSERVACAO,IDCONTROLEDIVIDABENEFUNIF)');
    _query.SQL.Add('values');
    _query.SQL.Add('  ('+FloatToStr(idhstcontrole)+',');
    _query.SQL.Add(' '+'0'+',');
    _query.SQL.Add(' '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text+',');
    _query.SQL.Add(' '+qrydet.FieldByName('IDPESSOA').text+',');
    _query.SQL.Add(' '+qrydet.FieldByName('IDTITULAR').text+',');
    _query.SQL.Add(' '+qrydet.FieldByName('IDPESSJUR').text+',');
    _query.SQL.Add(' '+qrydet.FieldByName('IDBENEFICIO').text+',');
    _query.SQL.Add(' '+qrydet.FieldByName('IDPLANOPREV').text+',');
    _query.SQL.Add(' '+#39+_MESREFERENCIA+#39+',');
    _query.SQL.Add(' '+#39+_MESCOBRANCA+#39+',');
    _query.SQL.Add(' '+inttostr(qtparcela)+',');
    _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',');
    if _flgParcial = '1' then
       _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',')
    else
       _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+#39+dataprevistacalc+#39+',');
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+_CODPORTFORMA+',');    // edilaine - 22/01/2014 - SOL 174933
    _query.SQL.Add(' '+#39+_FLGDESCFOLHA+#39+',');
    _query.SQL.Add(' '+#39+_FLGSITUACAO+#39+',');

    //edilaine - SIG33744 - inicio
    _query.SQL.Add(' '+OraNumero(_VLRSALDOANT )+',');
    _query.SQL.Add(' '+OraNumero(_VLRPARCELAANT )+',');
    _query.SQL.Add(' '+#39+_TIPOPAGTO+#39+',');
    _query.SQL.Add(' '+iif(StrToFloat(_VLQUITACAO) < 0, '1', '0')+',');
    //edilaine - SIG33744 - fim

    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add('null )');

    try
      _query.ExecSQL;
      GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO'+FLOATTOSTR(idhstcontrole));
    except
      result := false;
    end;

  finally
    _query.Destroy;
    _queryx.Destroy;
  end;

end;



procedure TFrmCtrlDiviBenef_Novo.ExecutarRecebimento;
var
   query_temp:TwwQuery;
   sContaLiquido,sCODPORTFORMA,sUNIDNEGOC,sCODTIPDOC,sCODTIPRECDES,sCODCENTRORESPON,sCODFORMA:string;
   bPassou : Boolean;
   rVLRRECEBIDO : double;   //edilaine SIG33744

   function VerificaRecebimento(_CODDOCUMENTO:string):Boolean;
   var
     query:TwwQuery;
   begin
     query:=TwwQuery.Create(Self);
     query.DataBaseName :='BaseDados';
     query.Active:=false;
     query.SQL.Clear;

     try
       query.SQL.Add('SELECT VALOR ');
       query.SQL.Add('  FROM LANCTODOCUM');
       query.SQL.Add(' WHERE CODDOCUMENTO ='+Trim(_CODDOCUMENTO));  //edilaine - 33744
       query.SQL.Add('   AND OPERACAO = 5');////5 é recebido
       query.Active:=True;
       if query.IsEmpty then
          result:=False
       else
       begin
         rVLRRECEBIDO := query.Fields[0].AsFloat;    //edilaine SIG33744
         result:=True;
       end;
     finally
       query.Active:=false;
       query.Destroy;
     end;
   end;
begin

  filtraDet(true);

  //edilaine - SIG33744 - inicio
  if rgTipoPagto.ItemIndex = -1 then
  begin
     MsgDlg('Selecione um dos meios de Pagamento. ','Informação',mtInformation,[mbOk],0);
     Exit;
  end;
  //edilaine - SIG33744 - fim

  if qrydet.IsEmpty then
    begin
      MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
      //qrydet.Filtered:=False; //William Santana - SIG33744
      filtraDet(False);         //William Santana - SIG33744
      Exit;
    end;


  //edilaine - SIG33744 : inicio
  if rgTipoPagto.ItemIndex = 0 then
  begin
    iIdLoteConcessao:=0;

    if (iIdLoteConcessao <= 0)
    then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                                       iFlgIncluiMesConc
                                                      );
      if iIdLoteConcessao <= 0
      then begin
         MsgDlg('Nenhum lote selecinado para efetuar o Recebimento. Verifique. ','Erro',mtError,[mbOk],0);
         Exit;
      end;

      sDataFolha := CriticaDataCobrancaSit( qryAux,
                                            IntToStr(iIdFundacao),'', 'AS', 'P',
                                            Copy(sAnoMesLoteConcessao,6,2),
                                            Copy(sAnoMesLoteConcessao,1,4) );
    end;
  end;

  tempoInicio := now;

  memResult.clear;
  memResult.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
  memResult.Lines.Add('---------------------------------------------------------------');
  memResult.Lines.Add('');
  bPassou := true;
  //edilaine - SIG33744 : fim

  try
    qrydet.First;
    while not qrydet.eof do
      begin

        If dtmBaseDados.dbBaseDados.InTransaction Then
           dtmBaseDados.dbBaseDados.Rollback;
        dtmBaseDados.dbBaseDados.StartTransaction;

        //BRUNO AZEVEDO INÍCIO SIG33744
        if (qryDet.FieldByName('FLGSTATUS').AsInteger <> 1) or
           (qryDet.FieldByName('FLGQUITADO').AsInteger = 1) then
        begin
          sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +              //MIGRACAO-ORACLE
                       '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' Recebimento de dívida '+iif(qryDet.FieldByName('FLGSTATUS').AsInteger = 2, 'suspensa', 'quitada')+' não efetuado';
          memResult.Lines.Add( sMensagem );
          qrydet.next;
          Continue;
        end;
        //BRUNO AZEVEDO FIM SIG33744

        lCodLancCAPCAR := StrToInt(Trim(qrydet.FieldByName('CODDOCUMENTO').AsString));        //edilaine - SIG33744

        //if qrydet.FieldByName('FLGDESCFOLHA').Text<>'B' then     //William Santana - SIG33744
        //if not((qrydet.FieldByName('CODPORTFORMA').text = '')or(qrydet.FieldByName('CODPORTFORMA').text = '0')) then    //William Santana - SIG33744
        if (qrydet.FieldByName('TIPOPAGAMENTO').text = 'B') then  //boleto
          begin
            //// se foi contas a receber
            if VerificaRecebimento(qrydet.FieldByName('CODDOCUMENTO').Text) = False then
              begin
                //edilaine - SIG33744 - inicio
                if BaixaDocumentoNaoRecebido(qrydet.FieldByName('CODDOCUMENTO').AsString) then
                begin

                  if UpdateHSTDIVIDABENEFICIO('2') then  //flgsituacao = 2-enviada e nao recebida
                  begin
                    sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +             //MIGRACAO-ORACLE
                                 '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                                 ' Parcela não Recebida - Documento ['+qrydet.FieldByName('CODDOCUMENTO').AsString+'] Baixa via alterador';
                    memResult.Lines.Add( sMensagem );

                    If dtmBaseDados.dbBaseDados.InTransaction Then
                       dtmBaseDados.dbBaseDados.commit;

                    qrydet.next;
                    Continue;
                  end
                  else
                  begin
                    sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +             //MIGRACAO-ORACLE
                                 '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                                 ' Erro ao atualizar Histórico da Dívida';
                    memResult.Lines.Add( sMensagem );
                    bPassou := false;
                    qrydet.next;
                    Continue;
                  end;
                end
                else
                begin
                  sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +               //MIGRACAO-ORACLE
                               '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                               ' Erro ao efetuar baixa de boleto não recebido';
                  memResult.Lines.Add( sMensagem );
                  bPassou := false;
                  qrydet.next;
                  Continue;
                end;
              end
            else
              begin
                if not ContabilizaRecebimentoBoleto(rVLRRECEBIDO,sDataFolha) then
                begin
                  sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +             //MIGRACAO-ORACLE
                               '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                               ' Parcela não Recebida - Documento ['+qrydet.FieldByName('CODDOCUMENTO').AsString+'] Erro na Baixado boleto via Folha';
                  memResult.Lines.Add( sMensagem );
                  bPassou := false;
                  qrydet.next;
                  Continue;
                end;
              end;
          end
        else
          begin

            if not VerificarRecebimentoTMPDESC then
              begin
                sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +             //MIGRACAO-ORACLE
                             '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                             ' Parcela não recebida via Folha';
                memResult.Lines.Add( sMensagem );
                //WO13993 - Helen V Bianchi - Inicio
                UpdateHSTDIVIDABENEFICIO('2'); //flgsituacao = 2-enviada e nao recebida
                If dtmBaseDados.dbBaseDados.InTransaction Then
                       dtmBaseDados.dbBaseDados.commit;
                //WO13993 - Helen V Bianchi - Fim
                bPassou := false;
                qrydet.next;
                Continue;
              end
          end;

        try

          if UpdateHSTDIVIDABENEFICIO('3', qrydet.FieldByName('FLGDESCFOLHA').Text ) then ///flgsituacao = 3-recebida // SOL 230290 KINTANA 350993
          begin
             sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +               //MIGRACAO-ORACLE
                          '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                          ' Parcela recebida ';
             memResult.Lines.Add( sMensagem );

             If dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.commit;
          end
          else
          begin
             sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +              //MIGRACAO-ORACLE
                          '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                          ' Erro ao atualizar Histórico da Dívida';
             memResult.Lines.Add( sMensagem );
             bPassou := false;
          end;
        except
          on E:Exception do
          begin
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +              //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Erro inesperado: '+e.Message;
            memResult.Lines.Add( sMensagem );
            memResult.Lines.Add('');
            bPassou := false;
            Exit;
          end;
        end;

        qrydet.Next;
      end;

  finally
    //edilaine SIG33744 : inicio
    If dtmBaseDados.dbBaseDados.InTransaction Then
       dtmBaseDados.dbBaseDados.Rollback;

    tempoFim := now;

    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('Tempo total de processamento: ' + formatdatetime('hh:nn:ss', tempoFim-tempoInicio));
    memResult.Lines.Add('');
    pgControlDetalhe.ActivePage := tabResultado;

    SalvaResultado(memResult, 'Recebimento', 'DIVIDA_BENEFICIO_LOG');
    //edilaine SIG33744 : fim

    filtraDet(False);         //William Santana - SIG33744

    if bPassou then
       MsgDlg('Recebimento efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
    else
       MsgDlg('Recebimento efetuado com restrições. Verifique','Informação',mtInformation,[mbOk],0);
  end;
end;


procedure TFrmCtrlDiviBenef_Novo.ExecutarDesfazerPreparo;
var
 query:TwwQuery;
 flgsituacaoaodeletar:string;
 bPassou, b : Boolean;
 sTabela,sCampo : string;   // edilaine - 22/01/2014 - SOL 174933

  //procedure ExecDeleteHSTDIVIDABENEFICIO;
  procedure ExecDelete(sTabela : string);     // edilaine - 22/01/2014 - SOL 174933
  var
   query:TwwQuery;
  begin
     query:=TwwQuery.Create(Self);
     try
       query.DataBaseName :='BaseDados';
       query.SQL.Clear;
       query.SQL.Add('DELETE '+sTabela+' WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);      //William Santana - SIG33744
       query.ExecSQL;
       GravaLogTOTALPREV (sTabela+' -DELETE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);        //William Santana - SIG33744
      finally
        query.Close;
        query.Destroy;
      end;
  end;

  //function ProcurarTMPDESC:Boolean;
  function ProcurarLancamento(sTabela, sCampo : string) : boolean;     // edilaine - 22/01/2014 - SOL 174933
  var
   query:TwwQuery;
  begin

     query:=TwwQuery.Create(Self);
     query.DataBaseName :='BaseDados';
     query.Active:=false;
     query.SQL.Clear;
     query.SQL.Add('Select 1 FROM '+sTabela+' WHERE '+sCampo+' = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);    // edilaine - 22/01/2014 - SOL 174933
     query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
     query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
     query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
     query.Open;
     if query.IsEmpty then
        result:=False
     else
        result:=True;

     query.Close;
     query.Destroy;

  end;

  procedure ExecDeleteTMPDESC;
  var
   query:TwwQuery;
  begin
     query:=TwwQuery.Create(Self);
     query.DataBaseName :='BaseDados';
     try
       query.SQL.Clear;
       query.SQL.Add('DELETE TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
       query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
       query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
       query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
       query.ExecSQL;
       GravaLogTOTALPREV ('TMPDESC -DELETE- (REFERENCIA)IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
     finally
       query.Close;
       query.Destroy;
     end;
  end;

  //edilaine - SIG33744 - inicio
  procedure DesfazReajuste();
  var
   query:TwwQuery;
   sReajAnt : string;
  begin
     query:=TwwQuery.Create(Self);
     query.DataBaseName :='BaseDados';
     try
       query.SQL.Add('SELECT MAX(H.MESCOBRANCA) ');
       query.SQL.Add('  FROM HSTDIVIDABENEFICIO H ');
       query.SQL.Add(' WHERE H.IDCONTROLEDIVIDABENEFICIO = '+qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString );
       query.SQL.Add('   AND H.SALDODEVEDORANT IS NOT NULL ');
       query.SQL.Add('   AND H.MESCOBRANCA < '+Quotedstr(qrydet.FieldByName('MESCOBRANCA').AsString) );
       query.Open;
       sReajAnt := query.Fields[0].AsString;

       query.close;
       query.SQL.Clear;
       query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO SET ');
       query.SQL.Add('  SALDODEVEDORATUAL = '+OraNumero(formatfloat('0.00', qryDet.FieldByName('SALDODEVEDORANT').AsFloat))+',' );
       query.SQL.Add('  VALORPARCELA = '+OraNumero(formatfloat('0.00', qryDet.FieldByName('VALORPARCELAANT').AsFloat)) +', ' );
       if sReajAnt = '' then
          query.SQL.Add('  ULTMESREAJ = null ')
       else
          query.SQL.Add('  ULTMESREAJ = '+QuotedStr(sReajAnt) );
       query.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO = '+qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString );
       query.ExecSQL;

       {insere movimento de desfaz reajuste}
       CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '10', qryDet.FieldByName('SaldoDevAtual').AsString );   //edilaine SIG126276    //MIGRACAO-ORACLE

     finally
       query.Close;
       query.Destroy;
     end;
  end;
  //edilaine - SIG33744 - fim

begin

  query:=TwwQuery.Create(Self);
  query.DataBaseName :='BaseDados';
  query.Active:=false;
  query.SQL.Clear;

  bPassou := true;

  filtraDet(True);

  if qrydet.IsEmpty then
    begin
      MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
      filtraDet(False);         //William Santana - SIG33744
      Exit;
    end;

  flgsituacaoaodeletar:='';

  //edilaine - SIG33744 : inicio
  tempoInicio := now;

  memResult.clear;
  memResult.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
  memResult.Lines.Add('---------------------------------------------------------------');
  memResult.Lines.Add('');
  //edilaine - SIG33744 : fim

  try
    qrydet.First;
    while not qrydet.eof do
     begin

       If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Rollback;
       dtmBaseDados.dbBaseDados.StartTransaction;


       if (qrydet.FieldByName('NUMEROPARCELA').Text = '1') AND
          (qrydet.FieldByName('FLGSITUACAO').Text = '0') then   //edilaine SIG134478
         begin
           sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +       //MIGRACAO-ORACLE
                        '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                        ' Não foi possível desfazer o Preparo [1ª Parcela da dívida]';
           memResult.Lines.Add( sMensagem );
           qrydet.next;
           Continue;
         end;

       if (qryDet.FieldByName('FLGSTATUS').AsInteger = 3) or
          (qryDet.FieldByName('FLGQUITADO').AsInteger = 1) then
       begin
          sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +      //MIGRACAO-ORACLE
                       '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' Preparo de dívida quitada não efetuado [Encerrada]';
          memResult.Lines.Add( sMensagem );
         qrydet.next;
         Continue;
       end;


       //Início - William Santana - SIG33744
        //if ((qrydet.FieldByName('CODPORTFORMA').Text <> '0') and (DocumentoJaBaixado( qrydet.FieldByName('CODDOCUMENTO').Text))) or
        //   ((qrydet.FieldByName('CODPORTFORMA').Text = '0')  and (VerificarRecebimentoTMPDESC())) then
       //Término -  William Santana - SIG33744
        if ((qrydet.FieldByName('TIPOPAGAMENTO').text = 'B') and (DocumentoJaBaixado( qrydet.FieldByName('CODDOCUMENTO').Text))) or
           ((qrydet.FieldByName('TIPOPAGAMENTO').Text = 'F') and (VerificarRecebimentoTMPDESC())) then
        begin
          //edilaine SIG134478 : inicio
          if (qrydet.FieldByName('TIPOPAGAMENTO').Text = 'F') and (bPrevia) then
          begin
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +        //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Não foi possível desfazer '+iif(rgTipoOp.ItemIndex=0, 'Preparo', 'Envio')+' [Parcela está na Prévia e já foi efetivado. Favor entrar em contato com o setor de Pagamento de Benefício]';
          end
          else
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +        //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Não foi possível desfazer '+iif(rgTipoOp.ItemIndex=0, 'Preparo', 'Envio')+' [Parcela já recebida]';
          //edilaine SIG134478 : fim

          memResult.Lines.Add( sMensagem );
          bPassou := false;
          qrydet.next;
          Continue;
        end;

        try
           if (rgTipoOp.ItemIndex = 0) and
              ((qrydet.FieldByName('FLGSITUACAO').Text = '0') or (qrydet.FieldByName('FLGSITUACAO').Text = '5')) then
             begin
               //edilaine - SIG33744 - inicio
               sTabela := 'HSTDIVIDABENEFICIO';
               sCampo  := 'IDHSTORICODIVIDABENEFICIO';
               //edilaine - SIG33744 - fim

               try
                 if (qrydet.FieldByName('VALORPREVISTO').AsFloat >= 0) then  //William Santana - SIG33744
                    ExecDelete(sTabela);
               except
                 sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +       //MIGRACAO-ORACLE
                              '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                              ' Não foi possível desfazer o '+iif(rgTipoOp.ItemIndex=0, 'Preparo', 'Envio')+' [Erro ao excluir: '+sTabela+']';
                 memResult.Lines.Add( sMensagem );
                 bPassou := false;
                 qrydet.next;
                 Continue;
               end;

               try
                 if qryDet.FieldByName('VALORPARCELAANT').AsString <> '' then
                    DesfazReajuste();
               except
                 sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                              '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                              ' Não foi possível desfazer o '+iif(rgTipoOp.ItemIndex=0, 'Preparo', 'Envio')+' [Erro ao desfazer Reajuste]';
                 memResult.Lines.Add( sMensagem );
                 bPassou := false;
                 qrydet.next;
                 Continue;
               end;

               flgsituacaoaodeletar:='0';

               If dtmBaseDados.dbBaseDados.InTransaction   Then
                  dtmBaseDados.dbBaseDados.Commit;

               sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +           //MIGRACAO-ORACLE
                            '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                            ' Preparo desfeito';
               memResult.Lines.Add( sMensagem );
             end

           else if (rgTipoOp.ItemIndex = 1) and
                   ((qrydet.FieldByName('FLGSITUACAO').Text = '1') or (qrydet.FieldByName('FLGSITUACAO').Text = '2') or
                    (qrydet.FieldByName('FLGSITUACAO').Text = '5')) then
             begin

               //sTabela := iif(Trim(qrydet.FieldByName('CODPORTFORMA').Text)='0', 'TMPDESC',   'HSTDIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933
               //sCampo  := iif(Trim(qrydet.FieldByName('CODPORTFORMA').Text)='0', 'REFERENCIA','IDHSTORICODIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933

               sTabela := iif(Trim(qrydet.FieldByName('TIPOPAGAMENTO').Text)='F', 'TMPDESC',   'HSTDIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933
               sCampo  := iif(Trim(qrydet.FieldByName('TIPOPAGAMENTO').Text)='F', 'REFERENCIA','IDHSTORICODIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933

               if ProcurarLancamento(sTabela, sCampo) then   // edilaine - 22/01/2014 - SOL 174933
               begin
                 sMensagem := '';
                 if (trim(qrydet.FieldByName('CODDOCUMENTO').Text) > '0') then              //edilaine - 33744
                 begin
                   try
                     ExecDeleteDocumento(Trim(qrydet.FieldByName('CODDOCUMENTO').Text), sMensagem);
                     lCodLancCAPCAR := 0;
                   except
                     sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                                  '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                                  ' Não foi possível desfazer o '+iif(rgTipoOp.ItemIndex=0, 'Preparo', 'Envio')+
                                  ' [Erro ao excluir Documento: '+trim(qrydet.FieldByName('CODDOCUMENTO').Text)+']';
                     memResult.Lines.Add( sMensagem );
                     bPassou := false;
                     qrydet.next;
                     Continue;
                   end;
                 end
                 else
                 begin
                   try
                     ExecDeleteTMPDESC;
                   except
                     sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +     //MIGRACAO-ORACLE
                                  '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                                  ' Não foi possível desfazer o '+iif(rgTipoOp.ItemIndex=0, 'Preparo', 'Envio')+' [Erro ao excluir TMPDESC]';
                     memResult.Lines.Add( sMensagem );
                     bPassou := false;
                     qrydet.next;
                     Continue;
                   end;
                 end;
               end
               else
               begin
                 sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +          //MIGRACAO-ORACLE
                              '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                              ' Não foi possível desfazer o '+iif(rgTipoOp.ItemIndex=0, 'Preparo', 'Envio')+' [Lançamento não encontrado na '+sTabela+']';
                 memResult.Lines.Add( sMensagem );
                 bPassou := false;
                 qrydet.next;
                 Continue;
               end;

               flgsituacaoaodeletar:='1';

               if UpdateHSTDIVIDABENEFICIO('0') then///flgsituacao = 3-recebida
               begin
                 If dtmBaseDados.dbBaseDados.InTransaction   Then
                    dtmBaseDados.dbBaseDados.Commit;

                 sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                              '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                              ' Envio desfeito'+iif(qryDet.FieldByName('TIPOPAGAMENTO').AsString <> 'B', '',
                              ' [Documento: '+qryDet.FieldByName('CODDOCUMENTO').AsString+' apagado]') ;

                 memResult.Lines.Add( sMensagem );
               end
               else
               begin
                 sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +        //MIGRACAO-ORACLE
                              '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                              ' Erro ao atualizar Histórico da Dívida';
                 memResult.Lines.Add( sMensagem );
                 bPassou := false;
               end;
             end;

        except
          on E:Exception do
            begin
              sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +          //MIGRACAO-ORACLE
                           '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                           ' Erro inesperado: '+e.Message;
              memResult.Lines.Add(sMensagem);
              memResult.Lines.Add('');
              bPassou := false;
              Exit;
            end;
        end;

        qrydet.Next;
     end;

  finally
    If dtmBaseDados.dbBaseDados.InTransaction   Then
       dtmBaseDados.dbBaseDados.Rollback;

    filtraDet(False);         //William Santana - SIG33744

    tempoFim := now;

    memResult.Lines.Add('');
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('Tempo total de processamento: ' + formatdatetime('hh:nn:ss', tempoFim-tempoInicio));
    memResult.Lines.Add('');
    pgControlDetalhe.ActivePage := tabResultado;
    SalvaResultado(memResult, 'Desfaz Preparo', 'DIVIDA_BENEFICIO_LOG');

    if bPassou then
      begin
        if flgsituacaoaodeletar = '0' then
           MsgDlg('Preparo de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0)
        else
           MsgDlg('Envio de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0);
      end
    else
      if flgsituacaoaodeletar = '0' then
         MsgDlg( 'Preparo desfeito com restrições. Verifique.','Informação',mtInformation,[mbOk],0)
      else
         MsgDlg( 'Envio desfeito com restrições. Verifique','Informação',mtInformation,[mbOk],0);
  end;
end;


procedure TFrmCtrlDiviBenef_Novo.ExecutarDesfazerRecebimento;
var
 bPassou : Boolean;

  procedure UpdateHSTDIVIDABENEFICIOXEnviado;
  var
    query:TwwQuery;
    bErro : boolean;
    sCodDocumento : string;
  begin
    sMensagem := '';
    bErro := false;
    sCodDocumento := Trim(qrydet.FieldByName('CODDOCUMENTO').AsString);

    query:=TwwQuery.Create(Self);
    query.DataBaseName :='BaseDados';
    try
      //recebimento de boleto
      //if (qrydet.FieldByName('CODPORTFORMA').Text <> '0') then
      if (qrydet.FieldByName('TIPOPAGAMENTO').Text = 'B') and  //boleto
         (qrydet.FieldByName('FLGSITUACAO').Text = '2')   then   //nao recebida (baixada via alterador)
      begin
        // busca código do alterador
        qryBaixa.Close;
        qryBaixa.SQL.Clear;
        //Leandro SIG136150 inicio
        qryBaixa.SQL.Add('SELECT CODALTERADORBAIXA FROM PLANPREV');
        qryBaixa.SQL.Add('WHERE IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').AsString);

        //qryBaixa.SQL.Add('SELECT CODALTERADORBAIXA FROM BENEFPLANPREV');
        //qryBaixa.SQL.Add(' WHERE IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').AsString);
        //qryBaixa.SQL.Add('   AND IDBENEFICIO = '+qrydet.FieldByName('IDBENEFICIO').AsString);
        //Leandro SIG136150 fim
        qryBaixa.Open;
        if not qryBaixa.isEmpty then
        begin
          //apagar baixa do alterador
          query.close;
          query.sql.clear;
          query.SQL.Add('DELETE FROM LANCTODOCUM');
          query.SQL.Add(' WHERE CODDOCUMENTO ='+Trim(sCodDocumento));
          query.SQL.Add('   AND OPERACAO = 4');
          query.SQL.Add('   AND CODALTERADOR = '+qryBaixa.Fields[0].AsString);
          query.execsql;

          // voltar status do documento
          query.Close;
          query.SQL.Clear;
          query.SQL.Add('UPDATE documento d    ');
          query.SQL.Add('  SET  d.status = 0   ');
          query.SQL.Add(' WHERE d.coddocumento = '+Trim(sCodDocumento) );
          try
            query.execSql;
          except
            sMensagem := 'Erro ao desfazer Baixa com Alterador';
            bErro := true;
          end;
        end
      end
      else if (qrydet.FieldByName('TIPOPAGAMENTO').Text = 'B') and   //boleto
              ((qrydet.FieldByName('FLGSITUACAO').Text = '3')  or    //recebida (baixada na folha)
               (qrydet.FieldByName('FLGSITUACAO').Text = '4')) then  //recebida com divergencia (baixada na folha)
      begin
        //verifica se já tem prévia executada
        // busca lote
        qryBaixa.Close;
        qryBaixa.SQL.Clear;
        qryBaixa.SQL.Add('SELECT T.IDLOTE FROM TMPDESC T');
        qryBaixa.SQL.Add(' WHERE T.IDPESSOA    = '+qrydet.FieldByName('IDPESSOA').text);
        qryBaixa.SQL.Add('   AND T.IDTITULAR   = '+qrydet.FieldByName('IDTITULAR').text);
        qryBaixa.SQL.Add('   AND T.IDPESSJUR   = '+qrydet.FieldByName('IDPESSJUR').text);
        qryBaixa.SQL.Add('   AND T.IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').text);
        qryBaixa.SQL.Add('   AND T.SEQPROPOSTA = 1');
        qryBaixa.SQL.Add('   AND T.MESCOBRANCA = '+QuotedStr(qrydet.FieldByName('MESCOBRANCA').text));
        qryBaixa.SQL.Add('   AND T.REFERENCIA  = '+QuotedStr(qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text));
        qryBaixa.SQL.Add('   AND NOT EXISTS (SELECT 1  -- P.MESCOBRANCA, P.VALORPROVENTO, C.FLGVOLTATMP ');
        qryBaixa.SQL.Add('                     FROM PREVIA P, CTRLINTERFACE C ');
        qryBaixa.SQL.Add('                    WHERE P.NUMEROPROCESSO = '+qrydet.FieldByName('NUMEROPROCESSO').text );
        qryBaixa.SQL.Add('                      AND P.MESCOBRANCA    = '+QuotedStr(qrydet.FieldByName('MESCOBRANCA').text) );
        qryBaixa.SQL.Add('                      AND C.IDLOTE         = P.IDLOTE ');
        qryBaixa.SQL.Add('                      AND P.IDLOTE = T.IDLOTE)        ');
        qryBaixa.Open;
        if not qryBaixa.isEmpty then
        begin
          iIdLoteConcessao := qryBaixa.FieldByName('IDLOTE').asInteger;
          sMensagem := '';

          //apaga hstbenef
          query.close;
          query.SQL.Clear;
          query.SQL.Add('DELETE HSTBENEFBFCIARIO');
          query.SQL.Add(' WHERE IDPESSOA     = '+qrydet.FieldByName('IDPESSOA').text);
          query.SQL.Add('   AND IDTITULAR    = '+qrydet.FieldByName('IDTITULAR').text);
          query.SQL.Add('   AND IDPESSJUR    = '+qrydet.FieldByName('IDPESSJUR').text);
          query.SQL.Add('   AND IDPLANOPREV  = '+qrydet.FieldByName('IDPLANOPREV').text);
          query.SQL.Add('   AND MES          = '+Quotedstr(qrydet.FieldByName('MESCOBRANCA').text));
          query.SQL.Add('   AND LOTEORIGINAL = '+IntToStr(iIdLoteConcessao) );
          query.SQL.Add('   AND SEQPROPOSTA  = 1');
          query.SQL.Add('   AND IDCONTROLEDIVIDABENEFICIO = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
          try
            query.ExecSQL;
          except
            sMensagem := 'Erro ao excluir Histórico da Benefício [HSTBENEF]';
            bErro := true;
          end;

          //apaga rubricaindiv
          query.close;
          query.SQL.Clear;
          query.SQL.Add('DELETE RUBRICAINDIV');
          query.SQL.Add(' WHERE IDPESSOA    = '+qrydet.FieldByName('IDPESSOA').text);
          query.SQL.Add('   AND IDTITULAR   = '+qrydet.FieldByName('IDTITULAR').text);
          query.SQL.Add('   AND ANOMESREF   = '+QuotedStr(qrydet.FieldByName('MESCOBRANCA').text));
          query.SQL.Add('   AND IDRUBRICA   = 34134 ');
          try
            query.ExecSQL;
          except
            sMensagem := 'Erro ao excluir Rubrica Individual [RUBRICAINDIV]';
            bErro := true;
          end;

          //apaga tmpdesc
          query.close;
          query.SQL.Clear;
          query.SQL.Add('DELETE TMPDESC');
          query.SQL.Add(' WHERE IDPESSOA    = '+qrydet.FieldByName('IDPESSOA').text);
          query.SQL.Add('   AND IDTITULAR   = '+qrydet.FieldByName('IDTITULAR').text);
          query.SQL.Add('   AND IDPESSJUR   = '+qrydet.FieldByName('IDPESSJUR').text);
          query.SQL.Add('   AND IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').text);
          query.SQL.Add('   AND SEQPROPOSTA = 1');
          query.SQL.Add('   AND MESCOBRANCA = '+QuotedStr(qrydet.FieldByName('MESCOBRANCA').text));
          query.SQL.Add('   AND REFERENCIA  = '+QuotedStr(qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text));
          try
            query.ExecSQL;
          except
            sMensagem := 'Erro ao excluir Desconto via Folha [TMPDESC]';
            bErro := true;
          end;
        end
        else
        begin
          if sMensagem = '' then
             sMensagem := 'Baixa do boleto pela Folha já processada na Prévia';
          exit;
        end;
      end;

      if not bErro then
      begin
        query.close;
        query.SQL.Clear;
        query.SQL.Add('UPDATE HSTDIVIDABENEFICIO ');
        query.SQL.Add('   SET FLGSITUACAO   = 1');
        query.SQL.Add('   , DATAEFETIVA     = null');
        query.SQL.Add('   , IDHSTFOLHABENEF = null');
        query.SQL.Add('   , VALORRECEBIDO   = null');
        query.SQL.Add(' WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
        try
          query.ExecSQL;
        except
          sMensagem := 'Erro ao atualizar Histórico da Dívida';
          bErro := true;
        end;

        GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
      end;

      if (not bErro) and (qrydet.FieldByName('FLGSITUACAO').Text <> '2') then
      begin
        query.SQL.Clear;
        query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
        query.SQL.Add('   SET FLGQUITADO =0');
        //BRUNO AZEVEDO INÍCIO SIG33744
        query.SQL.Add('     , FLGSTATUS  = 1');
        //BRUNO AZEVEDO FIM SIG33744
         //Início - William Santana - SIG33744
          query.SQL.Add('   , SALDODEVEDORATUAL  = SALDODEVEDORATUAL+'+ OraNumero(FloatToStr(qryDet.FieldByName('VALORRECEBIDO').AsFloat)));
         //query.SQL.Add('   , SALDODEVEDORATUAL  =SALDODEVEDORATUAL+'+OraNumero(FloatToStr(qrydet.FieldByName('Vlr Parcela').AsFloat)));
        //Término - William Santana - SIG33744
        query.SQL.Add('   , QUANTIDADEPARCELASPAGAS = QUANTIDADEPARCELASPAGAS-1');
        query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO  = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        try
          query.ExecSQL;

          {insere movimento de desfaz quitacao}
          if qryDet.FieldByName('FLGQUITADO').AsInteger = 1 then
             CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '11', qryDet.FieldByName('SaldoDevAtual').AsString );   //edilaine SIG126276   //MIGRACAO-ORACLE

        except
          sMensagem := 'Erro ao atualizar Dívida do Benefício';
        end;

        GravaLogTOTALPREV ('CONTROLEDIVIDABENEFICIO -UPDATE- IDCONTROLEDIVIDABENEFICIO = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
      end;

    finally
      query.close;
      query.Destroy;
    end;
  end;

begin

  filtraDet(True);

  if qrydet.IsEmpty then
    begin
      MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
      //qrydet.Filtered:=False; //William Santana - SIG33744
      filtraDet(False);         //William Santana - SIG33744
      Exit;
    end;

  //edilaine - SIG33744 : inicio
  tempoInicio := now;

  memResult.clear;
  memResult.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
  memResult.Lines.Add('---------------------------------------------------------------');
  memResult.Lines.Add('');
  //edilaine - SIG33744 : fim

  bPassou := true;

  try
    qrydet.First;
    while not qrydet.eof do
      begin

        If dtmBaseDados.dbBaseDados.InTransaction Then
           dtmBaseDados.dbBaseDados.Rollback;
        dtmBaseDados.dbBaseDados.StartTransaction;

        try

          if (qryDet.FieldByName('FLGSTATUS').AsInteger = 2)  then
          begin
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +   //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Não foi possível desfazer o recebimento [Dívida Suspensa]';
            memResult.Lines.Add( sMensagem );
            qrydet.next;
            Continue;
          end;

          if (qrydet.FieldByName('FLGSITUACAO').Text = '3') OR (qrydet.FieldByName('FLGSITUACAO').Text = '4') or
             (qrydet.FieldByName('FLGSITUACAO').Text = '2') then
          begin
            UpdateHSTDIVIDABENEFICIOXEnviado;

            if sMensagem <> '' then
            begin
              sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                           '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                           ' Não foi possível desfazer o recebimento: '+sMensagem;
              memResult.Lines.Add( sMensagem );
              bPassou := false;
              qrydet.next;
              Continue;
            end;

            If dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.Commit;

            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Recebimento desfeito'+iif(qryDet.FieldByName('TIPOPAGAMENTO').AsString <> 'B', '',
                         ' - Documento: '+qryDet.FieldByName('CODDOCUMENTO').AsString) ;
            memResult.Lines.Add( sMensagem );
          end;

        except
          on E:Exception do
          begin
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +          //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Erro inesperado: '+e.Message;
            memResult.Lines.Add( sMensagem );
            memResult.Lines.Add('');
            bPassou := false;
            exit;
          end;
        end;

        qrydet.Next;
      end;

  finally
    If dtmBaseDados.dbBaseDados.InTransaction Then
       dtmBaseDados.dbBaseDados.Rollback;

    filtraDet(False);         //William Santana - SIG33744

    //edilaine SIG33744 : inicio
    tempoFim := now;

    memResult.Lines.Add('');
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('Tempo total de processamento: ' + formatdatetime('hh:nn:ss', tempoFim-tempoInicio));
    memResult.Lines.Add('');
    pgControlDetalhe.ActivePage := tabResultado;

    SalvaResultado(memResult, 'Desfaz Recebimento', 'DIVIDA_BENEFICIO_LOG');
    //edilaine SIG33744 : fim

    if bPassou then
       MsgDlg('Recebimento de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0)
    else
       MsgDlg('Recebimento desfeito com restrições. Verifique.','Informação',mtInformation,[mbOk],0);

  end;
end;


procedure TFrmCtrlDiviBenef_Novo.bbtnDesfazerClick(Sender: TObject);
begin
//  inherited;
  bbtnDesfazer.Enabled:=false;
  btnProcessar.Enabled:=false;
  try                                //edilaine - SIG33744
    try

      VerificaMarcaItensNaoExibidos; //William Santana - SIG33744

      case rgTipoOp.ItemIndex of
        0,1:begin
              ExecutarDesfazerPreparo;
            end;
          2:begin
              ExecutarDesfazerRecebimento;
            end;
      end;

    except
      If dtmBaseDados.dbBaseDados.InTransaction   Then
         dtmBaseDados.dbBaseDados.Rollback;
    end;

  finally
    bbtnDesfazer.Enabled:=True;
    btnProcessar.Enabled:=True;
  end;

  //qrydet.Filtered:=false; //William Santana - SIG33744
  pdesPrc:=true;
  btnProcurarClick(Sender);
  pdesPrc:=false;
end;


function TFrmCtrlDiviBenef_Novo.BaixaDocumentoNaoRecebido(sCodDocumento : string) : boolean;
var
  iCodAltBaixa  : Integer;
  _ctrlDocumento :tctrlDocumento;
  rVlrDocumento : Double;

  iIdProcesso, iIdTipoServico: Integer; //Leandro SIG136150
  dValorRetencao: double;  //Leandro SIG136150
begin
  result := true;

  //leandro - sig136150 - inicio
  //Cria a Classe de Controle
  _ctrlDocumento:=tctrlDocumento.create;
  _ctrlDocumento.InitializeAs(Padroes);

  cdsRateio      := TCmClientDataSet.Create(Nil);
  cdsRateio.Data := _ctrlDocumento.Orcamento.ListaRateio(-1);
  //leandro - sig136150 - fim

  // busca código do alterador
  qryBaixa.Close;
  qryBaixa.SQL.Clear;
  //leandro sig136150 : inicio
  qryBaixa.SQL.Add('SELECT CODALTERADORBAIXA FROM PLANPREV');
  qryBaixa.SQL.Add('WHERE IDPLANOPREV = '+qrydet.FieldByName('IDPLANOPREV').AsString);
  //leandro sig136150 : fim
  qryBaixa.Open;
  if qryBaixa.isEmpty then
  begin
    sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                 '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                 ' Não há parametrização de alterador para baixa da parcela não recebida - Documento ['+sCodDocumento+']';
    memResult.Lines.Add( sMensagem );
    qryBaixa.close;
    result := false;
    abort;
  end;

  iCodAltBaixa := qryBaixa.Fields[0].AsInteger;

  //busca valor do documento
  qryBaixa.Close;
  qryBaixa.SQL.Clear;
  qryBaixa.SQL.Add('SELECT LA.CODDOCUMENTO, LA.NUMLANCTO, DECODE(LA.DEBCRE, ''D'', sum(LA.VALOR), sum(-LA.VALOR)) AS VALOR, ');   //Leandro SIG136150
  qryBaixa.SQL.Add('       DECODE(LA.OPERACAO, 2, SUM(LA.VALOR), 0) AS VLR_DOC               ');
  qryBaixa.SQL.Add('  FROM LANCTODOCUM LA  ');
  qryBaixa.SQL.Add(' WHERE LA.CODDOCUMENTO = '+Trim(sCodDocumento) );
  qryBaixa.SQL.Add('   AND LA.OPERACAO = 2');
  qryBaixa.SQL.Add(' GROUP BY LA.CODDOCUMENTO, LA.NUMLANCTO, LA.DEBCRE, LA.OPERACAO ');   //Leandro SIG136150
  qryBaixa.Open;
  if not qryBaixa.isEmpty then
  begin

    //Leandro SIG136150 Inicio
    With Sql Do
    Begin
      Cds.Close;

      Prepare;

      ParamByName('CODDOCUMENTO').AsInteger := qryBaixa.FieldByName('CODDOCUMENTO').AsInteger;
      ParamByName('NUMLANCTO').AsInteger := qryBaixa.FieldByName('NUMLANCTO').AsInteger;
      ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      ParamByName('IDPLANOPREV').AsInteger := qrydet.FieldByName('IDPLANOPREV').AsInteger;
      //ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
      ParamByName('RECPAG').AsString := 'R';
      Open;
    end;

    Try

      cdsRateio.Data := _ctrlDocumento.Orcamento.ListaRateio(StrToFloat(Trim(sCodDocumento)));

      if Cds.FieldByName('IDPROCESSO').IsNull then
        iIdProcesso := -1
      else
        iIdProcesso := Cds.FieldByName('IDPROCESSO').AsInteger;

      if Cds.FieldByName('IDTIPOSERVICO').IsNull then
        iIdTipoServico := -1
      else
        iIdTipoServico := Cds.FieldByName('IDTIPOSERVICO').AsInteger;

      if (Cds.FieldByName('VALORBASERETENCAO').IsNull) then
        dValorRetencao := 0
      else
        dValorRetencao := Cds.FieldByName('VALORBASERETENCAO').AsFloat;

      _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
      _CtrlDocumento.PartidaDobrada := ParamIntegra.PartidaDobrada;
      _CtrlDocumento.Lanctodocum.SetValues(Cds.FieldByName('DATALANCTO').AsDateTime,
                                           Cds.FieldByName('CODDOCUMENTO').AsInteger,
                                           0,
                                           Cds.FieldByName('VLRLIQUIDO').AsFloat,
                                           Cds.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                           Cds.FieldByName('VALOR').AsFloat,
                                           Cds.FieldByName('UNIDNEGOC').AsInteger,
                                           Cds.FieldByName('PLNCODIGO').AsInteger,
                                           0,
                                           Sistema.IdUsuario,
                                           Sistema.IdEmpresa,
                                           0,
                                           Cds.FieldByName('ESTORNO').AsInteger,
                                           0,
                                           0,
                                           Cds.FieldByName('CODALTERADOR').AsInteger,
                                           '4',
                                           '',
                                           '',
                                           '',
                                           'BOLETO NÃO PAGO',
                                           '',
                                           '',
                                           '',
                                           Cds.FieldByName('DEBCRE').AsString,
                                           Sistema.IdModulo,
                                           ParamIntegra.Plano,
                                           Sistema.UsaPlanoPatro,
                                           True,
                                           0,
                                           0,
                                           '',
                                           0,
                                           Cds.FieldByName( 'IDDespesaOrc'  ).AsFloat,
                                           Cds.FieldByName( 'IDRateioDocum' ).AsFloat
                                           iIdTipoServico, iIdProcesso, dValorRetencao
                                           );

      Result := _CtrlDocumento.Insert;
    except
      sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +             //MIGRACAO-ORACLE
                   '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                   ' Erro ao lançar alterador da baixa da da parcela não recebida - Documento ['+sCodDocumento+']';
      memResult.Lines.Add( sMensagem );
      result := false;
      FreeAndNil(cdsRateio);    //leandro sig136150
      abort;
    end;

    {
    //Marca documento como não pago
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('INSERT INTO lanctodocum (   ');
    qryAux.SQL.Add('    coddocumento,           ');
    qryAux.SQL.Add('    numlancto,              ');
    qryAux.SQL.Add('    codalterador,           ');
    qryAux.SQL.Add('    datalancto,             ');
    qryAux.SQL.Add('    valor,                  ');
    qryAux.SQL.Add('    Debcre,                 ');
    qryAux.SQL.Add('    operacao,               ');
    qryAux.SQL.Add('    historicocompl,         ');
    qryAux.SQL.Add('    idusuarioinclusao,      ');
    qryAux.SQL.Add('    vlrliquido,             ');
    qryAux.SQL.Add('    unidnegoc,              ');
    qryAux.SQL.Add('    idpessoa,               ');
    qryAux.SQL.Add('    flgrecebeunf,           ');
    qryAux.SQL.Add('    iddespesaorc            ');
    qryAux.SQL.Add(') VALUES (                  ');
    qryAux.SQL.Add('   '+Trim(sCodDocumento)+','      );
    qryAux.SQL.Add('    seqlanctodocum.nextval, ');
    qryAux.SQL.Add('   '+IntToStr(iCodAltBaixa) + ',' );
    qryAux.SQL.Add('    TRUNC(SYSDATE),         ');
    qryAux.SQL.Add('   '+OraNumero(qryBaixa.FieldByName('VALOR').AsString)+', ');
    qryAux.SQL.Add('    ''C'',                  ');
    qryAux.SQL.Add('    4,                      ');
    qryAux.SQL.Add('    ''Parcela não paga.'',  ');
    qryAux.SQL.Add('    '+IntToStr(Sistema.IdUsuario)+ ',' );
    qryAux.SQL.Add('    0,                      ');
    qryAux.SQL.Add('    -1,                     ');
    qryAux.SQL.Add('    1,                      ');
    qryAux.SQL.Add('    ''N'',                  ');
    qryAux.SQL.Add('    -1)                     ');
    try
      qryAux.execSql;
    except
      sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRÍCULA').AsString + '  ' +
                   '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                   ' Erro ao lançar alterador da baixa da da parcela não recebida - Documento ['+sCodDocumento+']';
      memResult.Lines.Add( sMensagem );
      result := false;
      abort;
    end;
    }
    //Leandro SIG136150 Fim

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE documento d    ');
    qryAux.SQL.Add('  SET  d.status = 2   ');
    qryAux.SQL.Add('  , d.FLGNAOCONCILIADO = NULL   '); //Leazndro SIG135150
    qryAux.SQL.Add(' WHERE d.coddocumento = '+Trim(sCodDocumento) );
    try
      qryAux.execSql;
    except
      sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +         //MIGRACAO-ORACLE
                   '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                   ' Erro ao atualizar status do documento não recebido - Documento ['+sCodDocumento+']';
      memResult.Lines.Add( sMensagem );
      result := false;
      FreeAndNil(cdsRateio);    //leandro sig136150
      abort;
    end;
  end;

  FreeAndNil(cdsRateio);    //leandro sig136150

end;



function TFrmCtrlDiviBenef_Novo.ContabilizaRecebimentoBoleto(rValor : double; dData : string) : boolean;     // WO22455 Ferrari
Var
  sINSCRICAONUMERO : string;
  sMsgErro : string;
  iRetorno : integer;
  iSeqRub  : integer;
  recParam : TParametros;
begin
  result := true;

  with TwwQuery.Create(nil) do
    try
      DataBaseName :='BaseDados';
      Active:=false;

      // insere hstbenef
      Close;
      SQL.Clear;
      SQL.Add('SELECT INSCRICAONUMERO FROM PARTPREVPLAN');
      SQL.Add(' WHERE IDPESSOA =' +qrydet.FieldByName('IDPESSOA').AsString);
      SQL.Add('   AND IDPLANOPREV ='+qrydet.FieldByName('IDPLANOPREV').AsString );
      SQL.Add('   AND IDPESSJUR   ='+qrydet.FieldByName('IDPESSJUR').AsString );
      Open;
      sINSCRICAONUMERO := FieldByName('INSCRICAONUMERO').AsString;


      qryBeneficio.close;
      qryBeneficio.SQL.clear;
      qryBeneficio.SQL.Add('SELECT B.* ');
      qryBeneficio.SQL.Add('  FROM BENEFBFCIARIO B ');
      qryBeneficio.SQL.Add(' WHERE B.NUMEROPROCESSO = '+qryDet.FieldByName('NUMEROPROCESSO').AsString );
      qryBeneficio.Open;

      if qryBeneficio.FieldByName('IDSITBENEFICIO').AsInteger <> 1 then  // so lança 0.001 para quem nao é ativo
        if not InsereHstBenefBfciario ( qryAux,
                                        -1,
                                        qryDet.FieldByName('NUMEROPROCESSO').AsInteger,
                                        qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                        qryDet.FieldByName('IDPESSJUR').AsInteger,
                                        qryDet.FieldByName('IDPLANOPREV').AsInteger,
                                        qryDet.FieldByName('IDTITULAR').AsInteger,
                                        qryBeneficio.FieldByName('SEQPROPOSTA').AsInteger,
                                        qryDet.FieldByName('IDPESSOA').AsInteger,
                                        0,
                                        3123,
                                        0,
                                        sAnoMesLoteConcessao,  //qryDet.FieldByName('MESREFERENCIA').AsString,
                                        sAnoMesLoteConcessao,
                                        qryDet.FieldByName('MATRICULA').AsString,          //MIGRACAO-ORACLE
                                        sINSCRICAONUMERO,
                                        '',
                                        0.001,
                                        0.001,
                                        0.001,
                                        0,
                                        0,
                                        1,
                                        0,
                                        iIdLoteConcessao,
                                        sMsgErro,
                                        sDataFolha,
                                        qryBeneficio.FieldByName('VALORTOTAL').AsFloat,
                                        qryBeneficio.FieldByName('VALORSRB').AsFloat,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        -1,
                                        '',
                                        -1,
                                        '',
                                        False,
                                        qryBeneficio.FieldByName('VLRFABTOTAL').AsString,
                                        qryBeneficio.FieldByName('VLRBSTOTAL').AsString,
                                        qryBeneficio.FieldByName('VLRBASEDEFICIT').AsString,
                                        1
                                        , qryBeneficio.FieldByName('IDPERFILINVEST').AsInteger
                                        , qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString
                                        ) then
        begin
          sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +          //MIGRACAO-ORACLE
                       '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' Erro ao baixar boleto [Histórico de Benefício]';

          memResult.Lines.Add( sMensagem );
          result := false;
          Exit;
        end;

      //insere tmpdesc
      //recParam := BuscaParametros(qryDet, qryAux); //leandro SIG136150
      recParam := BuscaParametrosNovo(qryDet, qryAux); //leandro SIG136150

      //iRetorno := InsereTmpDesc(qryDet, recParam, iIdLoteConcessao, rValor);    //edilaine SIG126276
      iRetorno := LancaTmpDesc(qryDet, recParam, iIdLoteConcessao, 0, sAnoMesLoteConcessao);  //edilaine SIG126276 // WO22455 Ferrari
      if iRetorno < 0 then
      begin
         case iRetorno of
           -1 : sMensagem := 'Falta parametrização de rubricas';
           -2 : sMensagem := 'Erro ao inserir TMPDESC';
         end;
         sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +    //MIGRACAO-ORACLE
                      '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                      sMensagem;
         memResult.Lines.Add( sMensagem );
         result := false;
      end;
      // data Vindo da contabilização WO22455 Ferrari
      sDataFolha := CriticaDataCobrancaSit( qryAux,
                                            IntToStr(iIdFundacao),'', 'AS', 'P',
                                            Copy(sAnoMesLoteConcessao,6,2),
                                            Copy(sAnoMesLoteConcessao,1,4) );

      // insere lançamento na rubricaindiv
      if iRetorno = 0 then
      begin
         //if not InserirRubricaIndividual(qryDet, rValor, iIdLoteConcessao, recParam.iIdSeq) then //leandro sig136150
         if not InserirRubricaIndividual(qryDet, rValor, iIdLoteConcessao, recParam.iIdSeq, qryDet.FieldByName('IDPLANOPREV').AsInteger, dData) then //leandro sig136150  data Vindo da contabilização WO22455 Ferrari
         begin
            sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRICULA').AsString + '  ' +    //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Erro ao baixar boleto [Rubrica Individual]';
            memResult.Lines.Add( sMensagem );
            result := false;
         end;
      end;


      {SQL.Clear;
      SEQRUBRICAINDIV

      SQL.Add('INSERT INTO RUBRICAINDIV (  ');
      SQL.Add('   IDPESSOA, ');
      SQL.Add('   IDEMPRESA, IDRUBRICA, NUMOCORRENCIAS, SEQRUBRICAINDIV, IDFAVORECIDO, ');
      SQL.Add('   IDREGRACALCULO, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, PARCELAS, ');
      SQL.Add('   FLGPERCENT, FLGTPRUBMANUT, FLGPENSAOALIM, RUBRICAPROVENTOPA, DATAFINAL, ');
      SQL.Add('   ANOMESREF, CODPORTFORMA, ');
      SQL.Add('   IDTITULAR, DATAINICIO, FLGBASEPA, ');
      SQL.Add('   FLGUSAABONO, IDALIMENTADO, IDLOTE, FLGDESATIVADO,  FLGUSADO, FLGCALCULACPMF, ');
      SQL.Add('   ULTMESPREPARO, VALORANTERIOR, IDPROCESSO, IDRUBRICA13,     ');
      SQL.Add('   IDRUBRICAPROVENTO13, IDMOTIVO, IDLOTEREVISAO, FLGANTECIPABONO, IDSEQINTERNOFB, NUMPROCINSS,  ');
      SQL.Add('   IDMOVBENEF, FLGCONTROLASALDO, VLRSALDOINICIAL, VLRTOTALPROC, IDPLANOCONTABIL, FLGRETROACAO,  ');
      SQL.Add('   FLGANTECIPAABONOINSS, SITUACAOAJ, OBSERVACAO, FLGRUBRICARESGATE, MESCOMPREEM, FLGRESGATEPARCELADO, ');
      SQL.Add('   IDTMPDESC, FLGREPROGRAMACAO, RELACAODEPEN, IDPROCJUD, IDPERFILINVEST) ');
      SQL.Add(' VALUES ( ' );
      SQL.Add( qrydet.FieldByName('IDPESSOA').AsString +', ' );
      SQL.Add(' 1,    34134, 1,    1,    null,    ');
      SQL.Add(' 26128, '+OraNumero(FloatToStr(rValor))+', null, 0,    1,       ');
      SQL.Add(' null, ''1'', 0,    null, sysdate, ');
      SQL.Add( QuotedStr(qrydet.FieldByName('MESCOBRANCA').AsString) +', null, ' );
      SQL.Add( qrydet.FieldByName('IDTITULAR').AsString +', sysdate, 0,  ');
      SQL.Add('   0, null, null,    1,    1, 0, ' );
      SQL.Add('null,  0, null, null, ');
      SQL.Add('null, 3123, null,    0, null, null, ');
      SQL.Add('null,    0,    0,    0, null, null,          ');
      SQL.Add('null, null, null,    0, null, 0,    ');
      SQL.Add( IntToStr(recParam.iIdSeq)+', null, null, null, null  )');
      try
        ExecSQL;
        result := true;
      except
        sMensagem := 'Matricula: '+ qryDet.FieldByName('MATRÍCULA').AsString + '  ' +
                     '[Dívida: '  + CompletaString(qryDet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                     ' Erro ao baixar boleto [Rubrica Individual]';
        memResult.Lines.Add( sMensagem );
      end;
      }
    finally
      Close;
      Destroy;
    end;
end;
//edilaine - SIG33744 : fim


//edilaine - SIG115304 - inicio
procedure TFrmCtrlDiviBenef_Novo.btnContabilizaClick(Sender: TObject);
begin
  inherited;
  FrmCtrlDivBenefContab := TFrmCtrlDivBenefContab.Create(Application);
  try
    with frmCtrlDivBenefContab do
     begin
       visible := false;
       ShowModal;
     end;
  finally
    frmCtrlDivBenefContab.Free;
  end;
end;


procedure TFrmCtrlDiviBenef_Novo.btnImportaClick(Sender: TObject);
var
  Excel : variant;
  qryBusca : TwwQuery;
  sMatricula,
  sCodDivida,
  sVlrCarga, sMesAno : string;
  ilinha,icoluna, iLinhaAux, iAtualizados: integer;
  iLinIni, iColMatr, iColDivida, iColValor : integer;
  CheckSum  : string;
  sOperacao : string;
  sLinha    : string;
  sNomeArq  : string;
  bSair     : boolean;
  rVlrCarga, rVlrProvisao, rVlrReversao : double;
  sCampos, sSQL : string;
  sDataImporta  : string;
  iCodCarga     : integer;
  bPrimeiraCarga : boolean;
begin
  inherited;

  sMesAno  := inttostr(spAnoArq.Value)+'/'+formatfloat('00',(cbMesArq.Itemindex+1));

  if (VerificaPeridoBloqueado(sMesAno, grpMescobArq) <> 0) then
     Exit;


  if (edtImporta.text = EmptyStr) then
  begin
    MsgDlg('Informe nome do arquivo para importação.','Informação',mtInformation,[mbOk],0);
    abort;
  end;

  mmResumo.Clear;

  // campos insert
  sCampos := 'IDCARGADIVIDA, NOMEARQUIVO, HASHARQUIVO, MATRICULA,MESANO, IDPESSOA, IDCONTROLEDIVIDABENEFICIO, ' +
             'VALORCARGA, CTRLOPERACAO, VLRPROVPERDA, VLRREVPROVISAO, DATAIMPORTA, FLGPROCESSADO';

  //verifica se é a 1a carga (nao provisionar na contabilidade)
  qryAux.close;
  qryAux.sql.text := 'SELECT * FROM CTRLDIVIDABENEFCARGA ';
  qryAux.Open;
  bPrimeiraCarga := qryAux.isEmpty;

  //valida hash
  CheckSum := GetCRC32(edtImporta.text);

  qryAux.close;
  qryAux.sql.text := 'SELECT NOMEARQUIVO FROM CTRLDIVIDABENEFCARGA '+
                     ' WHERE HASHARQUIVO = '+QuotedStr(checksum);
  qryAux.Open;
  if not qryAux.isEmpty then
  begin
    MsgDlg('Dados já importados anteriormente. Verifique!.', 'Aviso', mtWarning, [mbOK], 0);
    btnLimpaArquivoClick(Sender);
    Exit;
  end;

  qryBusca := TwwQuery.create(nil);
  qryBusca.DataBasename := 'BaseDados';

  Excel := CreateOleObject('Excel.Application');

  try
    try
      Excel.Visible := False;
      Excel.WorkBooks.Add(OpenDialog1.FileName);

      tempoInicio := Now;

      mmResumo.clear;
      mmResumo.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
      mmResumo.Lines.Add('---------------------------------------------------------------');
      mmResumo.Lines.Add('');

      mmResumo.Lines.Add('Lendo o arquivo de dados: '+ExtractFileName(edtImporta.text) );

      iColMatr   := -1;
      iColDivida := -1;
      iColValor  := -1;
      iLinIni    := 1;
      repeat
        icoluna := 0;
        repeat
          inc(iColuna);
          if (Excel.Cells.Item[iLinIni,icoluna].Text <> '') then
          begin
            if (UpperCase(Excel.Cells.Item[iLinIni,icoluna].Text) = 'MATRICULA') then
               iColMatr  := iColuna
            else if (UpperCase(Excel.Cells.Item[iLinIni,icoluna].Text) = 'CODDIVIDA') then
               iColDivida := iColuna
            else if (UpperCase(Excel.Cells.Item[iLinIni,icoluna].Text) = 'VALOR') then
               iColValor  := iColuna;
          end;
        until iColuna = 3;
           inc(iLinIni);
      until (iLinIni > 2) or (iColMatr*iColDivida*iColValor > 0);


      if (iColMatr = -1) or (iColDivida = -1) or (iColValor = -1) then
      begin
        MsgDlg('Arquivo fora do padrão. Verifique!.', 'Aviso', mtWarning, [mbOK], 0);

        mmResumo.Lines.Add(' ');
        mmResumo.Lines.Add('Arquivo deve conter as colunas: ');
        mmResumo.Lines.Add(' - MATRICULA: Matricula do beneficiário/pensionista ');
        mmResumo.Lines.Add(' - CODDIVIDA: Código da Dívida ');
        mmResumo.Lines.Add(' - VALOR    : Valor da Carga  ');

        Exit;
      end;

      sNomeArq     := ExtractFileName(edtImporta.text);
      iLinha       := iLinIni;
      iLinhaAux    := 0;
      iAtualizados := 0;
      iCodCarga    := 0;

      bSair := True;

      if not dtmBaseDados.dbBaseDados.InTransaction then
         StartTransacao;

      while bSair do
      begin
        if Excel.Cells.Item[ilinha,1].Text <> '' then
        begin
           sLinha := CompletaString(IntToStr(iLinha-1), ' ', 4, false);

//           if not dtmBaseDados.dbBaseDados.InTransaction then
//              StartTransacao;

           sMatricula  := Trim(Excel.Cells.Item[ilinha, iColMatr   ].text);
           sCodDivida  := Trim(Excel.Cells.Item[ilinha, iColDivida ].text);
           sVlrCarga   := Trim(Excel.Cells.Item[ilinha, iColValor  ].text);

           if (sMatricula <> '') and (sCodDivida <> '') and (sMesAno <> '') and (sVlrCarga <> '') then
           begin

             //busca dados
             qryBusca.Close;
             qryBusca.SQL.Clear;
             qryBusca.SQL.Add('SELECT D.IDPESSOA, P.NOME, NVL(C.SALDOPROVPERDA,0) AS SLDPERDA, C.FLGSTATUS, ');
             qryBusca.SQL.Add('       C.SALDODEVEDORATUAL,          ');
             qryBusca.SQL.Add('      (SELECT MAX(H.NUMEROPARCELA)   ');
             qryBusca.SQL.Add('         FROM HSTDIVIDABENEFICIO H   ');
             qryBusca.SQL.Add('        WHERE H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO ');
             qryBusca.SQL.Add('       ) AS MAXPARC   ');
             qryBusca.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO C ');
             qryBusca.SQL.Add('  JOIN DEPENTIT D     ');
             qryBusca.SQL.Add('    ON D.IDPESSOA = C.IDPESSOA   ');
             qryBusca.SQL.Add('  JOIN PESSOA P ON P.IDPESSOA = D.IDPESSOA ');
             qryBusca.SQL.Add(' WHERE C.IDCONTROLEDIVIDABENEFICIO = '+sCodDivida );
             qryBusca.Open;
             if not qryBusca.isEmpty then
             begin
               rVlrCarga    := StrToFloat(sVlrCarga);
               rVlrReversao := 0;
               rVlrProvisao := 0;

               if rVlrCarga <= qryBusca.FieldByName('SALDODEVEDORATUAL').AsFloat then
               begin

                 if (qryBusca.FieldByName('FLGSTATUS').AsInteger = 1)  and
                    (qryBusca.FieldByName('MAXPARC').AsInteger = 1) and
                    (qryBusca.FieldByName('SLDPERDA').AsFloat = 0)  then
                 begin
                   rVlrProvisao := rVlrCarga;
                   sOperacao    := 'SLD';
                 end
                 else
                 begin
                   if rVlrCarga >= qryBusca.FieldByName('SLDPERDA').AsFloat then
                      rVlrProvisao := abs(rVlrCarga - qryBusca.FieldByName('SLDPERDA').AsFloat)
                   else
                      rVlrReversao := abs(qryBusca.FieldByName('SLDPERDA').AsFloat - rVlrCarga);
                   sOperacao := 'REAJ';
                 end;

                 if bPrimeiraCarga then
                    sOperacao := 'CARG';

                 //atualiza saldo
                 qryImporta.Close;
                 qryImporta.Sql.Clear;
                 qryImporta.Sql.Add('UPDATE CONTROLEDIVIDABENEFICIO ');
                 qryImporta.Sql.Add('   SET SALDOPROVPERDA = '+OraNumero(sVlrCarga) );
                 qryImporta.sql.add(' WHERE IDCONTROLEDIVIDABENEFICIO = '+sCodDivida );
                 qryImporta.ExecSql;

                 if qryImporta.RowsAffected > 0 then
                 begin
                   if iCodCarga = 0 then
                   begin
                     qryExec.close;
                     qryExec.SQL.Text := 'SELECT SEQCTRLDIVIDABENEFCARGA.NEXTVAL FROM DUAL';
                     qryExec.Open;
                     if not qryExec.isEmpty then
                        iCodCarga := qryExec.Fields[0].AsInteger;
                   end;

                   sSQL := 'INSERT INTO CTRLDIVIDABENEFCARGA ('+sCampos +') ' +
                           ' values ('+
                           ' '+IntToStr(iCodCarga) + ', '+
                           ' '+QuotedStr(sNomeArq) + ', '+
                           ' '+QuotedStr(CheckSum) + ', '+
                           ' '+QuotedStr(sMatricula) + ', '+
                           ' '+QuotedStr(sMesAno)  + ', '+
                           ' '+qryBusca.FieldByName('IDPESSOA').AsString + ', '+
                           ' '+sCodDivida + ', '+
                           ' '+OraNumero(sVlrCarga) +', '+
                           ' '+QuotedStr(sOperacao) +', '+
                           ' '+OraNumero(FloatToStr(rVlrProvisao)) +', '+
                           ' '+OraNumero(FloatToStr(rVlrReversao)) +', '+
                           ' TO_DATE('+QuotedStr(DateToStr(date))+', ''DD/MM/YYYY''), '+
                           ' '+'1 )';

                   qryImporta.close;
                   qryImporta.SQL.Text := sSQL;
                   qryImporta.ExecSQL;

                   iAtualizados := iAtualizados + 1;

                   sMensagem := 'Matricula: '+ sMatricula + '  ' +
                                '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                                ' Linha '+CompletaString(sLinha, ' ', 5, false)+': processada ['+
                                iif(rVlrProvisao > 0,'Provisão: R$ ', 'Reversão: R$ ')+
                                iif(rVlrProvisao > 0, FormatFloat('#,##0.00',rVlrProvisao),FormatFloat('#,##0.00',rVlrReversao))+']';
                   mmResumo.Lines.Add(sMensagem);

                   iLinhaAux := iLinhaAux + 1;

                 end;
               end
               else
               begin
                 sMensagem := 'Matricula: '+ sMatricula + '  ' +
                              '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                              ' Linha '+CompletaString(sLinha, ' ', 5, false)+': não processada [Provisão maior que Saldo Devedor]';
                 mmResumo.Lines.Add(sMensagem);
               end;
               iLinha := iLinha + 1;
               application.ProcessMessages;
             end
             else
             begin
               sMensagem := 'Matricula: '+ sMatricula + '  ' +
                            '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                            ' Linha '+CompletaString(sLinha, ' ', 5, false)+': não processada [Dívida/matrícula não encontrada]';
               mmResumo.Lines.Add(sMensagem);
               iLinha := iLinha + 1;
               application.ProcessMessages;
             end;
           end
           else
           begin
             sMensagem := 'Matricula: '+ sMatricula + '  ' +
                          '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                          ' Linha '+CompletaString(sLinha, ' ', 5, false)+': não processada [Falta dados]';
             mmResumo.Lines.Add(sMensagem);
             iLinha := iLinha + 1;
             application.ProcessMessages;
           end;
        end
        else
           bSair := False;
      end;

      if MsgDlg('Confirma a importaçâo dos dados?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      begin
        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Commit;
      end
      else
      begin
        mmResumo.Lines.Add('');
        mmResumo.Lines.Add('-------------------------------------------------------------------------');
        mmResumo.Lines.Add(' >>>>>>>>>              PROCESSO CANCELADO                 <<<<<<<<<<<<< ');
        mmResumo.Lines.Add('-------------------------------------------------------------------------');
        mmResumo.Lines.Add('');
        iAtualizados := 0;

        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.RollBack;
      end;

    Except
      on E:Exception do
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;

         sMensagem := 'Matricula: '+ sMatricula + '  ' +
                      '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                      ' Erro inesperado: '+e.Message;
         mmResumo.Lines.Add( sMensagem );
         mmResumo.Lines.Add('');

         exit;
       end;
    end;

  finally
     if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

     tempoFim := now;

     mmResumo.Lines.Add('-------------------------------------------------------------------------');
     mmResumo.Lines.Add('Total de linhas Processadas: ' + IntToStr(iLinha-iLinIni));
     mmResumo.Lines.Add('Total de Saldos Alterados..: ' + IntToStr(iAtualizados));

     mmResumo.Lines.Add(' ');
     mmResumo.Lines.Add('Final do Processo: ' + FormatDateTime('hh:nn:ss', tempoFim));
     mmResumo.Lines.Add(' ');
     mmResumo.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (tempoFim - tempoInicio)));

     //SalvaResultado(memResult, 'Preparo', 'DIVIDA_BENEFICIO_LOG');
     Excel.Quit;
     Excel := Unassigned;

     FreeAndNil(qryBusca);
  end;
end;


procedure TFrmCtrlDiviBenef_Novo.btnDesfazImpClick(Sender: TObject);
var
  dDataIni  : TDate;
  sAnoMes   : string;
  sLinha    : string;
  sSQL      : string;
  lstUpdate : TStringList;
  lstDelete : TStringList;
  qryBusca  : TwwQuery;
  CheckSum  : string;
  ind       : integer;
begin
  inherited;

  mmResumo.clear;

  lstUpdate := TStringList.create;
  lstDelete := TStringList.create;
  qryBusca  := TwwQuery.create(nil);
  qryBusca.DatabaseName := 'BaseDados';

  try
    try
      sAnoMes  := inttostr(spAnoArq.Value)+'/'+formatfloat('00',(cbMesArq.Itemindex+1));

      tempoInicio := Now;

      mmResumo.clear;
      mmResumo.Lines.Add('Início do processamento: ' + formatdatetime('hh:nn:ss', tempoInicio));
      mmResumo.Lines.Add('---------------------------------------------------------------');
      mmResumo.Lines.Add('');
      mmResumo.Lines.Add('Buscando dados importados');

      //valida hash
      CheckSum := '';
      if edtImporta.text <> '' then
         CheckSum := GetCRC32(edtImporta.text);

      //verifica lançamentos nao contabilizados
      qryBusca.close;
      qryBusca.SQL.Clear;
      qryBusca.SQL.Add('SELECT C.IDCONTROLEDIVIDABENEFICIO, C.SALDOPROVPERDA, CG.MATRICULA,  ');
      qryBusca.SQL.Add('       CG.CTRLOPERACAO, CG.VLRPROVPERDA, CG.VLRREVPROVISAO, CG.IDCARGADIVIDA, ');
      qryBusca.SQL.Add('       CASE   ');
      qryBusca.SQL.Add('         WHEN CG.CTRLOPERACAO = ''SLD''  ');
      qryBusca.SQL.Add('           THEN 0                    ');
      qryBusca.SQL.Add('         WHEN CG.CTRLOPERACAO = ''REAJ'' ');
      qryBusca.SQL.Add('           THEN (C.SALDOPROVPERDA + CG.VLRREVPROVISAO -  CG.VLRPROVPERDA) ');
      qryBusca.SQL.Add('       END SLDAJUSTE              ');
      qryBusca.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO C  ');
//      qryBusca.SQL.Add('  JOIN DEPENTIT D                 ');
//      qryBusca.SQL.Add('    ON D.IDPESSOA = C.IDPESSOA    ');
      qryBusca.SQL.Add('  JOIN CTRLDIVIDABENEFCARGA CG    ');
      qryBusca.SQL.Add('    ON CG.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO  ');
      qryBusca.SQL.Add('   AND CG.MESANO = '+QuotedStr(sAnoMes) );
      if Trim(checksum) <> EmptyStr then
         qryBusca.SQL.Add('   AND HASHARQUIVO = '+QuotedStr(checksum) );
      qryBusca.SQL.Add(' WHERE NOT EXISTS (SELECT 1    ');
      qryBusca.SQL.Add('                     FROM HSTDIVIDABENEFICIO H  ');
      qryBusca.SQL.Add('                    WHERE H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO ');
      qryBusca.SQL.Add('                      AND H.MESCOBRANCA = '+QuotedStr(sAnoMes) );
      qryBusca.SQL.Add('                      AND H.PLNCODIGO IS NOT NULL)  ');
      qryBusca.Open;
      if qryBusca.isEmpty then
      begin
        mmResumo.Lines.Text :=  mmResumo.Lines.Text + '..... Não existe lançamentos s serem desfeitos';
        exit;
      end
      else
        mmResumo.Lines.Text :=  mmResumo.Lines.Text + '..... OK';

      //listar lançamentos para desfazer
      mmResumo.Lines.Add(' ');
      mmResumo.Lines.Add(' ');
      mmResumo.Lines.Add('   Cod. Divida    Matricula    Saldo Atual    (-) Provisão    (+) Reversão    Novo Saldo');
      mmResumo.Lines.Add('   =====================================================================================');
      while not qryBusca.eof do
      begin

        sLinha := '   ' +
                  CompletaString(qryBusca.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 11, false) + '    '+
                  CompletaString(qryBusca.FieldByName('MATRICULA').AsString,                 ' ',  9, false) + '    '+
                  CompletaString(qryBusca.FieldByName('SALDOPROVPERDA').AsString,            ' ', 11, false) + '    '+
                  CompletaString(qryBusca.FieldByName('VLRPROVPERDA').AsString,              ' ', 12, false) + '    '+
                  CompletaString(qryBusca.FieldByName('VLRREVPROVISAO').AsString,            ' ', 12, false) + '    '+
                  CompletaString(qryBusca.FieldByName('SLDAJUSTE').AsString,                 ' ', 10, false);

        mmResumo.Lines.Add(sLinha);

        sSQL := 'UPDATE CONTROLEDIVIDABENEFICIO '+
                '   SET SALDOPROVPERDA = '+OraNumero(qryBusca.FieldByName('SLDAJUSTE').AsString) +
                ' WHERE IDCONTROLEDIVIDABENEFICIO = '+qryBusca.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString;

        lstUpdate.Add( sSQL );

        lstDelete.Add('DELETE FROM CTRLDIVIDABENEFCARGA WHERE IDCARGADIVIDA = '+qryBusca.FieldByName('IDCARGADIVIDA').AsString );


        qryBusca.next;
      end;

      mmResumo.Lines.Add(' ');                     
      mmResumo.Lines.Add('-------------------------------------------------------------------------------------');
      mmResumo.Lines.Add('Total de Dívidas: ' + IntToStr(lstUpdate.count) );

      if MsgDlg('Desfazer a importaçâo dos dados?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      begin
        if not dtmBaseDados.dbBaseDados.InTransaction then
           StartTransacao;

        for ind := 0 to lstUpdate.count-1 do
        begin
          qryImporta.close;
          qryImporta.Sql.text := lstUpdate.Strings[ind];
          qryImporta.ExecSQL;

          qryImporta.close;
          qryImporta.Sql.text := lstDelete.Strings[ind];
          qryImporta.ExecSQL;
        end;

        dtmBaseDados.dbBaseDados.Commit;
      end;

    Except
      on E:Exception do
      begin
         sMensagem := ' Erro inesperado: '+e.Message;
         mmResumo.Lines.Add( sMensagem );
         mmResumo.Lines.Add('');
         exit;
       end;

    end;
  finally

    if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Rollback;

    tempoFim := now;

    mmResumo.Lines.Add(' ');
    mmResumo.Lines.Add('Final do Processo: ' + FormatDateTime('hh:nn:ss', tempoFim));
    mmResumo.Lines.Add(' ');
    mmResumo.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (tempoFim - tempoInicio)));

    FreeAndNil(qryBusca);
    lstUpdate.free;
    lstDelete.free;
   end;
end;

procedure TFrmCtrlDiviBenef_Novo.pcControleChange(Sender: TObject);
begin
  inherited;
  bbExportar.visible := (pcControle.activePage = tsImporta);
end;
//edilaine - SIG115304 - fim


procedure TFrmCtrlDiviBenef_Novo.ppDBCol5GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  if Text = '1' then
     Text := 'FUNCEF'
  else
     Text := 'INSS';
end;

procedure TFrmCtrlDiviBenef_Novo.ppReport1BeforePrint(Sender: TObject);
begin
  inherited;
  if cbbStatusDivida.itemIndex = 2 then
  begin
    pplblCol10.caption := 'Saldo Baixa';
    pplblCol11.caption := 'Valor Parcela';
    pplblCol12.caption := 'Status da Dívida';
    pplblCol13.caption := 'Situação Última Parcela';
    pplblCol14.caption := 'Início Cobrança';
    pplblCol15.caption := 'Fim Cobrança';
    pplblCol16.caption := 'Qtde Pagas';
    pplblCol17.caption := 'Qtde Parcelas';
    pplblCol18.caption := 'Obs da Dívida';

    //MIGRACAO-ORACLE : inicio
    // remover espaços em branco dos campos
    ppDBCol10.Datafield := 'SaldoBaixaDef';
    ppDBCol11.Datafield := 'VlrParcela';
    ppDBCol12.Datafield := 'STATUSDIVIDA';
    ppDBCol13.Datafield := 'SITUACAODIVIDA';
    ppDBCol14.Datafield := 'IniCobr';
    ppDBCol15.Datafield := 'FimCobr';
    ppDBCol16.Datafield := 'QtdePagas';
    ppDBCol17.Datafield := 'QtdeParcelas';
    ppDBCol18.Datafield := 'Observacao';
    //MIGRACAO-ORACLE : fim
  end
  else
  begin
    pplblCol10.caption := 'Valor Parcela';
    pplblCol11.caption := 'Status da Dívida';
    pplblCol12.caption := 'Situação Última Parcela';
    pplblCol13.caption := 'Início Cobrança';
    pplblCol14.caption := 'Fim Cobrança';
    pplblCol15.caption := '% Parcela';
    pplblCol16.caption := 'Qtde Pagas';
    pplblCol17.caption := 'Qtde Parcelas';
    pplblCol18.caption := 'Obs da Dívida';

    //MIGRACAO-ORACLE : inicio
    // remover espaços em branco dos campos
    ppDBCol10.Datafield := 'VlrParcela';
    ppDBCol11.Datafield := 'STATUSDIVIDA';
    ppDBCol12.Datafield := 'SITUACAODIVIDA';
    ppDBCol13.Datafield := 'IniCobr';
    ppDBCol14.Datafield := 'FimCobr';
    ppDBCol15.Datafield := 'Percentual';
    ppDBCol16.Datafield := 'QtdePagas';
    ppDBCol17.Datafield := 'QtdeParcelas';
    ppDBCol18.Datafield := 'Observacao';
    //MIGRACAO-ORACLE : fim
  end;

end;

//MIGRACAO-ORACLE : inicio
procedure TFrmCtrlDiviBenef_Novo.ConsultaNova;
var
  sAnoMes: String;
  sFlgStatus : string;
begin

  qryDet.Active:=False;
  qryDet.SQL.Clear;

  sAnoMes    := inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1));
  sFlgStatus := iif(cbbStatusDivida.text = '', '0', IntToStr(cbbStatusDivida.ItemIndex+1));

  qryDet.SQL.Add('SELECT ');
  qryDet.SQL.Add('   CASE  ');
  qryDet.SQL.Add('     WHEN (NVL(LAG(T.IDCONTROLEDIVIDABENEFICIO) OVER (ORDER BY ROWNUM),-1) = T.IDCONTROLEDIVIDABENEFICIO) ');
  qryDet.SQL.Add('     THEN ''N'' ELSE ''S'' ');
  qryDet.SQL.Add('   END AS MostraGrid,      ');
  qryDet.SQL.Add('   T.* ');
  qryDet.SQL.Add('FROM (');

  qryDet.SQL.Add('SELECT DISTINCT                     ');
  qryDet.SQL.Add('       ''N'' AS Selecionar,         ');
  qryDet.SQL.Add('       C.FLGSTATUS, C.FLGPORTFORMA, ');
  qryDet.SQL.Add('       C.OBSERVACAO,                ');
  qryDet.SQL.Add('       C.FLGQUITADO, C.NUMPROCINSS, C.NUMEROPROCESSO, H.VALORRECEBIDO,  ');
  qryDet.SQL.Add('       H.PAGAMENTO, H.TIPOPAGAMENTO, H.NOSSONUMERO, H.CODTIPDOC, H.FLGDEVOLUCAO, H.MESREFERENCIA,  ');
  qryDet.SQL.Add('       DECODE(C.FLGSTATUS, 1, ''Ativa'', ');
  qryDet.SQL.Add('                           2, DECODE(C.FLGACAOJUD, 1, ''Susp. Jud'', ''Susp. Adm''), ');
  qryDet.SQL.Add('                           3, ''Encerrada'', '''')  AS StatusDivida,                 ');
  qryDet.SQL.Add('       NVL(C.FLGACAOJUD,0) as FLGACAOJUD, ');
  qryDet.SQL.Add('       (select matricula from depentit d where d.idpessoa = c.idpessoa and d.idtitular = c.idtitular) as Matricula,');
  qryDet.SQL.Add('       (select nome from pessoa p where p.idpessoa = c.idpessoa) as Nome,');
  qryDet.SQL.Add('       (select pi.IDPLANPREVCONTAB              ');
  qryDet.SQL.Add('          from benefbfciario b, PERFILINVEST PI ');
  qryDet.SQL.Add('         where b.idplanoprev = c.idplanoprev    ');
  qryDet.SQL.Add('           and b.idpessoa    = c.idpessoa       ');
  qryDet.SQL.Add('           and b.idtitular   = c.idtitular      ');
  qryDet.SQL.Add('           and b.idbeneficio = c.idbeneficio    ');
  qryDet.SQL.Add('           and b.idpessjur   = c.idpessjur      ');
  qryDet.SQL.Add('           and PI.IDPERFILINVEST(+) = B.IDPERFILINVEST  ');
  qryDet.SQL.Add('           and rownum = 1) AS PlanoContab,              ');
  qryDet.SQL.Add('       (select nome from beneficio where idbeneficio = c.idbeneficio) AS Beneficio, ');
  qryDet.SQL.Add('       C.Data                AS DtLancDivida,   ');
  qryDet.SQL.Add('       C.Valorbeneficio      AS VlrBenef,       ');
  qryDet.SQL.Add('       C.Saldodevedorinicial AS SaldoDevIni,    ');
  qryDet.SQL.Add('       C.Saldodevedoratual   AS SaldoDevAtual,  ');
  qryDet.SQL.Add('       C.SaldoBaixaDef       AS SaldoBaixaDef,  ');
  qryDet.SQL.Add('       C.Valorultimaparcela  AS UltParcela,     ');

  if (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
     qryDet.SQL.Add('       C.Valorparcela  AS  VlrParcela,  ')
  else
     qryDet.SQL.Add('       H.VALORPREVISTO AS  VlrParcela, ');

  qryDet.SQL.Add('       '' '' AS Situacao,                     ');
  qryDet.SQL.Add('       C.Mesinicio AS IniCobr,                ');
  qryDet.SQL.Add('       C.Mesfim    AS FimCobr,                ');
  qryDet.SQL.Add('       C.Percentual,                          ');
  qryDet.SQL.Add('       C.Quantidadeparcelaspagas AS QtdePagas,');
  qryDet.SQL.Add('       C.Qtdeparcelas,                        ');
  qryDet.SQL.Add('       decode(nvl(C.Flgatualizarsaldo, 0), 0, ''Não'', ''Sim'') as AtualizarSaldo,            ');
  qryDet.SQL.Add('       c.Flgatualizarsaldo, H.SALDODEVEDORANT, H.VALORPARCELAANT,                             ');
  qryDet.SQL.Add('       H.FLGSITUACAO, C.ULTMESREAJ,');
  qryDet.SQL.Add('       C.IDCONTROLEDIVIDABENEFICIO,');
  qryDet.SQL.Add('       H.IDHSTORICODIVIDABENEFICIO,');
  qryDet.SQL.Add('       C.IDPESSOA, C.IDTITULAR, C.IDPESSJUR, C.IDBENEFICIO, C.IDPLANOPREV, C.IDMOTIVO,        ');
  qryDet.SQL.Add('       NVL(H.CODDOCUMENTO,0) AS CODDOCUMENTO ,H.MESCOBRANCA,                                  ');
  qryDet.SQL.Add('       (SELECT MIN(H.MESCOBRANCA)   ');
  qryDet.SQL.Add('          FROM HSTDIVIDABENEFICIO H ');
  qryDet.SQL.Add('         WHERE H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO) PrimeiroMesCobr,    ');
  qryDet.SQL.Add('       NVL(H.CODPORTFORMA, 0) CODPORTFORMA, C.FLGDESCFOLHA , H.DATAPREVISTA, H.VALORPREVISTO, ');
  qryDet.SQL.Add('       H.NUMEROPARCELA, C.FONTEPAGADORA,                           ');
  qryDet.SQL.Add('       CAST(DECODE(H.FLGSITUACAO, 0, ''Preparada'',                ');
  qryDet.SQL.Add('                                  1, ''Enviada'',                  ');
  qryDet.SQL.Add('                                  2, ''Enviada e Não Recebida'',   ');
  qryDet.SQL.Add('                                  3, ''Recebida'',                 ');
  qryDet.SQL.Add('                                  4, ''Recebida com Divergência'', ');
  qryDet.SQL.Add('                                  5, ''Suspensa'', '''') AS VARCHAR2(25)) as SituacaoDivida,  ');
  qryDet.SQL.Add('       (SELECT PI.IDPLANPREVCONTAB                                            ');
  qryDet.SQL.Add('          FROM BENEFBFCIARIO BF                                               ');
  qryDet.SQL.Add('          JOIN PERFILINVEST PI                                                ');
  qryDet.SQL.Add('            ON PI.IDPERFILINVEST = BF.IDPERFILINVEST                          ');
  qryDet.SQL.Add('         WHERE BF.IDPESSOA       = C.IDPESSOA                                 ');
  qryDet.SQL.Add('           AND BF.IDTITULAR      = C.IDTITULAR                                ');
  qryDet.SQL.Add('           AND BF.IDPESSJUR      = C.IDPESSJUR                                ');
  qryDet.SQL.Add('           AND BF.IDPLANOPREV    = C.IDPLANOPREV                              ');
  qryDet.SQL.Add('           AND BF.IDBENEFICIO    = C.IDBENEFICIO                              ');
  qryDet.SQL.Add('           AND BF.NUMEROPROCESSO = C.NUMEROPROCESSO) AS IDPLANPREVCONTAB      ');
  qryDet.SQL.Add('  FROM Controledividabeneficio c , /*HSTDIVIDABENEFICIO H,*/                  ');
  qryDet.SQL.Add('       (SELECT H1.IDCONTROLEDIVIDABENEFICIO,                                  ');
  qryDet.SQL.Add('               H1.IDHSTORICODIVIDABENEFICIO,                                  ');
  qryDet.SQL.Add('               H1.CODDOCUMENTO, H1.MESCOBRANCA, H1.DATAPREVISTA, H1.NUMEROPARCELA, H1.FLGSITUACAO, ');
  qryDet.SQL.Add('               DECODE(H1.FLGDEVOLUCAO, 1, -H1.VALORPREVISTO, H1.VALORPREVISTO) VALORPREVISTO,      ');
  qryDet.SQL.Add('               CAST(DECODE(H1.TIPOPAGAMENTO, ''B'', ''Boleto'',                                   ');
  qryDet.SQL.Add('                                                    ''Folha Benefício'') AS VARCHAR2(15)) AS PAGAMENTO ');
  qryDet.SQL.Add('               ,DECODE(H1.CODPORTFORMA, 0, NULL, H1.CODPORTFORMA) CODPORTFORMA                     ');
  qryDet.SQL.Add('               ,H1.TIPOPAGAMENTO, D.NOSSONUMERO, D.CODTIPDOC, H1.FLGDEVOLUCAO, H1.MESREFERENCIA    ');
  qryDet.SQL.Add('               ,H1.SALDODEVEDORANT, H1.VALORPARCELAANT, NVL(H1.VALORRECEBIDO, 0) VALORRECEBIDO     ');
  qryDet.SQL.Add('          FROM HSTDIVIDABENEFICIO H1                                        ');
  qryDet.SQL.Add('               LEFT JOIN DOCUMENTO D ON H1.CODDOCUMENTO = D.CODDOCUMENTO    ');
  qryDet.SQL.Add('         WHERE ');
  qryDet.SQL.Add('               (NVL(H1.CODDOCUMENTO,0) = 0 OR H1.CODDOCUMENTO IS NOT NULL)  ');

  if (sFlgStatus <>  '1') and (sFlgStatus <>  '4') then
  begin
    qryDet.SQL.Add('               AND H1.MESCOBRANCA = (SELECT MAX(H2.MESCOBRANCA)   ');
    qryDet.SQL.Add('                                       FROM HSTDIVIDABENEFICIO H2 ');
    qryDet.SQL.Add('                                      WHERE H2.IDCONTROLEDIVIDABENEFICIO = H1.IDCONTROLEDIVIDABENEFICIO) ');
  end
  else
  begin
    if (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
       qryDet.SQL.Add('               AND H1.FLGSITUACAO in (3,4)  ')
    else if (rgTIPOCOB.ITEMINDEX <> 6) then
       qryDet.SQL.Add('               AND H1.FLGSITUACAO in ( '+inttostr(rgTIPOCOB.ITEMINDEX) + ')  ');

       qryDet.SQL.Add('               AND EXISTS (SELECT 1                                          ');
    qryDet.SQL.Add('                                FROM (SELECT MAX(H2.MESCOBRANCA) MAXCOBRANCA, H2.IDHSTORICODIVIDABENEFICIO,  ');
    qryDet.SQL.Add('                                             H2.IDCONTROLEDIVIDABENEFICIO                                    ');
    qryDet.SQL.Add('                                       FROM HSTDIVIDABENEFICIO H2                                            ');
    qryDet.SQL.Add('                                      GROUP BY H2.IDHSTORICODIVIDABENEFICIO, H2.IDCONTROLEDIVIDABENEFICIO) M ');
    qryDet.SQL.Add('                               WHERE M.IDHSTORICODIVIDABENEFICIO = H1.IDHSTORICODIVIDABENEFICIO              ');

    if (rgTIPOCOB.ITEMINDEX = 5) then
       qryDet.SQL.Add('                                 AND M.MAXCOBRANCA <= '+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' )
    else if rgTIPOCOB.ITEMINDEX = 6 then
    begin
       qryDet.SQL.Add('                                 AND ((H1.FLGSITUACAO = 5  AND M.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+') OR ');
       qryDet.SQL.Add('                                      (H1.FLGSITUACAO <> 5 AND M.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) )  ');
    end
    else if (rgTipoOp.ItemIndex = 0) and ( (rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4))then
       qryDet.SQL.Add('                                 AND M.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' )
    else
       qryDet.SQL.Add('                                 AND M.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')' );

    if  (rgTipoOp.ITEMINDEX = 0) and ((rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4)) then
    begin
      qryDet.SQL.Add('               AND H1.MESCOBRANCA = (SELECT max(H3.MESCOBRANCA)             ');
      qryDet.SQL.Add('                                       FROM HSTDIVIDABENEFICIO H3           ');
      qryDet.SQL.Add('                                      WHERE NVL(H3.CODDOCUMENTO,0) = 0 AND  ');
      qryDet.SQL.Add('                                            H3.FLGSITUACAO in (3,4) AND     ');
      qryDet.SQL.Add('                                            h3.idpessoa = h1.idpessoa and   ');
      qryDet.SQL.Add('                                            h3.idtitular = h1.idtitular and ');
      qryDet.SQL.Add('                                            h3.idpessjur = h1.idpessjur and ');
      qryDet.SQL.Add('                                     EXISTS (SELECT 1                       ');
      qryDet.SQL.Add('                                               FROM (SELECT MAX(H4.MESCOBRANCA) MAXCOBRANCA,');
      qryDet.SQL.Add('                                                            H4.IDHSTORICODIVIDABENEFICIO,   ');
      qryDet.SQL.Add('                                                            H4.IDCONTROLEDIVIDABENEFICIO    ');
      qryDet.SQL.Add('                                                       FROM HSTDIVIDABENEFICIO H4           ');
      qryDet.SQL.Add('                                                      GROUP BY H4.IDHSTORICODIVIDABENEFICIO, H4.IDCONTROLEDIVIDABENEFICIO) M1 ');
      qryDet.SQL.Add('                                              WHERE M1.IDHSTORICODIVIDABENEFICIO = H3.IDHSTORICODIVIDABENEFICIO ');
      if (rgTipoOp.ItemIndex = 0) and ( (rgTIPOCOB.ITEMINDEX = 3) or (rgTIPOCOB.ITEMINDEX = 4))then
         qryDet.SQL.Add('                                                AND M1.MAXCOBRANCA <='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) ')
      else
         qryDet.SQL.Add('                                             AND M1.MAXCOBRANCA ='+#39+inttostr(seAno.Value)+'/'+formatfloat('00',(cbbMes.Itemindex+1))+#39+')) ');      //edilaine - SIG71864
    end;
  end;
  qryDet.SQL.Add('         ) H ');

  qryDet.SQL.Add(' WHERE H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO');

  if (rgTIPOCOB.ITEMINDEX <> 6) and (sFlgStatus <> '4') then
  begin
    if sFlgStatus =  '3' then
    begin
       qryDet.SQL.Add('   AND (C.Saldodevedoratual = 0 ');
       qryDet.SQL.Add('    OR (C.Saldodevedoratual > 0 AND C.FLGSTATUS = '+sFlgStatus+') )' );
    end
    else
    begin
       qryDet.SQL.Add('   AND (C.Saldodevedoratual > 0 OR C.SaldoBaixaDef > 0)');
    end;


    if sFlgStatus <>  '3' then
       qryDet.SQL.Add('   AND C.FLGSTATUS = '+sFlgStatus);
  end;
  qryDet.SQL.Add(' ORDER BY ');
  qryDet.SQL.Add('    (select matricula from depentit d where d.idpessoa = c.idpessoa and d.idtitular = c.idtitular), ');
  qryDet.SQL.Add('    (select nome from pessoa p where p.idpessoa = c.idpessoa),       ');
  qryDet.SQL.Add('    (select nome from beneficio where idbeneficio = c.idbeneficio),  ');
  qryDet.SQL.Add('    h.mescobranca desc ');
  qryDet.SQL.Add(' ) T   ');

  filtraDet(False);

  //qryDet.SQL.savetofile('c:\planus\controle '+rgTipoOp.Items.Strings[rgTipoOp.ItemIndex] +' '+rgTIPOCOB.Items.Strings[rgTIPOCOB.ItemIndex]+'.txt');

  qryDet.Active:=True;
end;


//MIGRACAO-ORACLE : FIM


end.



