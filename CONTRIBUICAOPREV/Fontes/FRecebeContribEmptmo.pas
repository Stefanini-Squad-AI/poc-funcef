{
*****************************************************************************
***************************** REGISTRO DE ALTERAÇÕES ************************
*****************************************************************************
// --------------------------------------------------------------------------------
// Pendência   : SOL 107221/5802 KINTANA 1365701
// Responsável : BRUNO AZEVEDO
// Data        : 07/12/2011
// Descrição   : Criação da Funcionalidade "Recebimento de Contribuições via Empréstimo".
//--------------------------------------------------------------------------------
}

unit FRecebeContribEmptmo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, TB97, ComCtrls, checklst, Db, DBTables, Wwquery, URegra, Gauges,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, StdCtrls, Spin, ExtCtrls,
  MontaSelect, wwdbdatetimepicker, CMDateTimePicker, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Menus, UCtrlLancamento, MAHlpBtn, uContribuicaoPrev, UCtrlDocumento,
  uCtrlFinanc, uCMTypes, uCtrlPeriodo, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, uCtrlBaixaRecXPag, DBClient, uCMClientDataSet,
  uCmSqlParams, Provider;
         
type
  TfrmRecebeContribEmptmo = class(TfrmOkCancelar)
    Panel2: TPanel;
    grpFiltroDataConcessao: TGroupBox;
    btnReceber: TBitBtn;
    pnlControle: TPanel;
    pnlOpcoes: TPanel;
    pnlResult: TPanel;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    qrySintetica: TwwQuery;
    btnDesfazer: TBitBtn;
    memResult: TMemo;
    StaticText3: TStaticText;
    rgFiltrar: TRadioGroup;
    MontaSelect: TMontaSelect;
    btnProcurar: TBitBtn;
    edtDataInicio: TCMDateTimePicker;
    Label1: TLabel;
    edtDataFim: TCMDateTimePicker;
    Label2: TLabel;
    bbtnImprimir: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnInverte: TBitBtn;
    btnMarcaTodas: TBitBtn;
    grdSintetica: TwwDBGrid;
    grdAnalitica: TwwDBGrid;
    qryAnalitica: TwwQuery;
    dsSintetica: TDataSource;
    dsAnalitica: TDataSource;
    Label3: TLabel;
    lblValorTotalAnalitica: TLabel;
    btnVisualizar: TBitBtn;
    updSintetica: TUpdateSQL;
    updAnalitica: TUpdateSQL;
    qryBaixa: TwwQuery;
    qryAux: TwwQuery;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    updContabil: TUpdateSQL;
    rpRelSintetico: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLine53: TppLine;
    rpCartaInadimplDBImage1: TppDBImage;
    ppDetailBand25: TppDetailBand;
    rpCartaInadimplDBText9: TppDBText;
    rpCartaInadimplDBText10: TppDBText;
    rpCartaInadimplDBText11: TppDBText;
    rpCartaInadimplDBText12: TppDBText;
    rpCartaInadimplDBText13: TppDBText;
    rpCartaInadimplDBText15: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppLine54: TppLine;
    ppLabel129: TppLabel;
    ppCalc46: TppSystemVariable;
    ppCalc47: TppSystemVariable;
    ppRelSintetico: TppBDEPipeline;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    rpRelAnalitico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine2: TppLine;
    ppDBImage1: TppDBImage;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppRelAnalitico: TppBDEPipeline;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppDBText18: TppDBText;
    ppLabel19: TppLabel;
    ppDBText19: TppDBText;
    qryBaixaContabil: TwwQuery;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel7: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    SQLDocPag: TCMSqlParams;
    cdsDocPag: TCMClientDataSet;
    cdsDocRec: TCMClientDataSet;
    SQLDocRec: TCMSqlParams;
    sqlLancFinanc: TCMSqlParams;
    cdsLancFinanc: TCMClientDataSet;
    qryPlanoxDocum: TwwQuery;
    dspDocRec: TDataSetProvider;
    qryDocPag: TwwQuery;
    procedure btnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure grdSinteticaDblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure grdAnaliticaDblClick(Sender: TObject);
    procedure btnMarcaTodasClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure rgFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDesfazerClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure ppDetailBand25BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    rTotRec: Double;
    rTotPag: Double;
    iCodPortFormaReceber: Integer;
    iCodPortFormaPagar: Integer;
    bIndividual: Boolean;
    CtrlLancamento: TCtrlLancamento;
    CtrlDocumento: TCtrlDocumento;
    CtrlDisponFinanc: TCtrlFinanc;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlBaixaRecXPag: TCtrlBaixaRecXPag;

    procedure AbreQryAnalitica(pMatricula, pFiltro: String);
    procedure ZeraQryAnalitica();
    procedure AbreQrySintetica(pMatricula, pDataInicio, pDataFim, pFiltro: String);
    procedure ZeraQrySintetica();
    procedure SomaValorTotalAnalitico();
    procedure MarcaDesmarca(pTipo: String);
    procedure eOnMessage(sMsg : string);
    procedure SelecionouRegistro(var bSelecionou: Boolean; sTipo: String);
    procedure DesfazerPGAeContabilidade(pCodDocumentoPGAPagar, pCodDocumentoPGAReceber, pPlnCodigoContabil: String);
    procedure FiltraDadosBaixa(sRecPag, pDocumentos: String);
    procedure AbreQryPlanoxDocum(pDocumento: String);
  public
    bPrintAll: Boolean;
  end;

var
  frmRecebeContribEmptmo: TfrmRecebeContribEmptmo;

implementation

uses UDataBase, UMensErro, UAdmPrev, DBaseDados, UMovReserva,  USistema,
     UFuncoesUteis, UIntegraBack, fAguarde, DAPrev, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmRecebeContribEmptmo.btnProcurarClick(Sender: TObject);
var
  sFiltro: String;
begin
  inherited;
  if (rgFiltrar.ItemIndex = 0) then begin
    sFiltro := 'A';
  end else begin
    sFiltro := 'B';
  end;
  
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[3] <> '') then begin
    AbreQrySintetica(MontaSelect.ValoresChave[3], '', '', sFiltro);
    AbreQryAnalitica(MontaSelect.ValoresChave[3], sFiltro);
    if (qrySintetica.RecordCount = 1) then begin
      bIndividual := True;
    end else begin
      bIndividual := False;
    end;
  end;

  //MSG003
  if (qrySintetica.IsEmpty) then begin
    MsgDlg('Não foram encontrados registros para os critérios informados.','Informação', mtInformation, [mbOk],0);
    edtDataInicio.SetFocus;
    exit;
  end;
end;

procedure TfrmRecebeContribEmptmo.AbreQryAnalitica(pMatricula, pFiltro: String);
var
  sSql: String;
begin
  sSql := '';
  sSql := sSql +
  '  SELECT ''1'' AS SELECAO, ' +
  '         DEP.MATRICULA, ' +
  '         PES.NOME, ' +
  '         CON.NOME, ' +
  '         HST.MESREFERENCIA, ' +
  '         HST.MESCOBRANCA, ' +
  '         HST.VALORESPERADO, ' +
  '         NVL(SUM(DECODE(HS.FLGTIPO,''D'',-HS.VALOR,HS.VALOR)), 0) AS SOMAVALOR, ' +
  '         HST.VALORESPERADO + NVL(SUM(DECODE(HS.FLGTIPO,''D'',-HS.VALOR,HS.VALOR)), 0) AS VLRESPERADO, ' +
  '         DECODE( HST.SITRECEBIMENTO, ''0'', ''Contribuição não enviada para cobrança'', ' +
  '                                     ''2'', ''Contribuição Recebida'') AS SITRECEBIMENTO, ' +
  '         HST.DATAPREVISAORECE, ' +
  '         HST.NUMRECEBIMENTO, ' +
  '         HST.IDCONTRIBUICAO, ' +
  '         HST.CODDOCUMENTOPGAPAGAR, ' +
  '         HST.CODDOCUMENTOPGARECEBER, ' +
  '         HST.PLNCODIGO ' +
  '    FROM HSTCONTRIBPREV   HST, ' +
  '         DEPENTIT         DEP, ' +
  '         PESSOA           PES, ' +
  '         CONTRIBUICAO     CON, ' +
  '         HSTATRASOCONTRIB HS ' +
  '   WHERE HST.IDPESSOA = ' +
  '         (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = ' + QuotedStr(pMatricula) + ') ';

  //CONTRIBUIÇÕES BAIXADAS (DESFAZER)
  if (pFiltro = 'B') then begin
    sSql := sSql + '    AND HST.DATARECEBIMENTO IS NOT NULL ' +
                   '    AND NVL(HST.VALORRECEBIDO, 0) > 0 ' +
                   '    AND NVL(HST.SITRECEBIMENTO, 0) > 1 ';
    if (qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString <> '') then begin
      sSql := sSql + '  AND HST.IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString;
    end;
  //CONTRIBUIÇÕES ABERTAS (RECEBER)
  end else begin
    sSql := sSql + '    AND HST.DATARECEBIMENTO IS NULL ' +
                   '    AND HST.IDCONTRATOEMPTMO IS NULL ' +
                   '    AND NVL(HST.VALORRECEBIDO, 0) = 0 ' +
                   '    AND NVL(HST.SITRECEBIMENTO, 0) = 0 ';
  end;

  sSql := sSql +
  '     AND HST.IDPESSOA = DEP.IDPESSOA ' +
  '     AND DEP.MATRICULA IS NOT NULL   ' +
  '     AND HST.IDPESSOA = PES.IDPESSOA ' +
  '     AND DEP.IDPESSOA = PES.IDPESSOA ' +
  '     AND HST.IDCONTRIBUICAO = CON.IDCONTRIBUICAO ' +
  '     AND HST.NUMRECEBIMENTO = HS.NUMRECEBIMENTO(+) ' +
  '   GROUP BY DEP.MATRICULA, ' +
  '            PES.NOME, ' +
  '            CON.NOME, ' +
  '            HST.MESREFERENCIA, ' +
  '            HST.MESCOBRANCA, ' +
  '            HST.VALORESPERADO, ' +
  '            DECODE( HST.SITRECEBIMENTO, ''0'', ''Contribuição não enviada para cobrança'', ' +
  '                                        ''2'', ''Contribuição Recebida''), ' +
  '            HST.DATAPREVISAORECE, ' +
  '            HST.NUMRECEBIMENTO, ' +
  '            HST.IDCONTRIBUICAO, ' +
  '            HST.CODDOCUMENTOPGAPAGAR, ' +
  '            HST.CODDOCUMENTOPGARECEBER, ' +
  '            HST.PLNCODIGO ' +
  '   ORDER BY HST.MESREFERENCIA ';

  qryAnalitica.close;
  qryAnalitica.Sql.Clear();
  qryAnalitica.Sql.Add(sSql);
  qryAnalitica.Open;

  SomaValorTotalAnalitico();
end;

procedure TfrmRecebeContribEmptmo.AbreQrySintetica(pMatricula, pDataInicio, pDataFim, pFiltro: String);
var
  sSql: String;
begin
  sSql := '';
  sSql := sSql +
  'SELECT ''1'' AS SELECAO, ' +
  '       DEP.MATRICULA, ' +
  '       PES.NOME, ' +
  '       CE.IDCONTRATOEMPTMO, ' +
  '       CE.DATACREDITO, ' +
  '       HME.HMEVLRPREVISTO AS VLRCONTRATO, ' +
  '       0 AS VLRESPERADO ' +
  '  FROM CONTRATOEMPTMO   CE,  ' +
  '       DEPENTIT         DEP, ' +
  '       PESSOA           PES, ' +
  '       HISTMOVEMPTMO    HME  ' +
  ' WHERE 1 = 1 ';

  if (Trim(pMatricula) <> '') then begin
    sSql := sSql +
    '   AND CE.IDBENEF = (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = ' + QuotedStr(pMatricula) + ') ';
  end;

  sSql := sSql +
  '   AND CE.IDTIPOCONTREMPTMO = 21 ' + //ID 21 = INTEGRALIZAÇÃO DE RESERVAS
  '   AND CE.IDPESSOA  = DEP.IDTITULAR ' +
  '   AND CE.IDBENEF   = DEP.IDPESSOA ' +
  '   AND CE.FLGSITUACAO <> ''Q'' ' +
  '   AND DEP.IDPESSOA = PES.IDPESSOA ' +
  '   AND HME.IDCONTRATOEMPTMO = CE.IDCONTRATOEMPTMO ' +
  '   AND HME.IDITEMEMPTMO = 100 ';

  if (pFiltro = 'B') then begin
    sSql := sSql +
      '   AND (SELECT COUNT(1) FROM HSTCONTRIBPREV ' +
      '         WHERE IDPESSOA = CE.IDBENEF ' +
      '           AND IDCONTRATOEMPTMO = CE.IDCONTRATOEMPTMO) > 0 ';
  end else begin
    sSql := sSql +
      '   AND (SELECT COUNT(1) FROM HSTCONTRIBPREV ' +
      '         WHERE IDPESSOA = CE.IDBENEF ' +
      '           AND IDCONTRATOEMPTMO = CE.IDCONTRATOEMPTMO) = 0 ';
  end;

  if (Trim(pDataInicio) <> '') then begin
    sSql := sSql +
    '   AND CE.DATACREDITO >= ' + QuotedStr(pDataInicio);
  end;

  if (Trim(pDataFim) <> '') then begin
    sSql := sSql +
    '   AND CE.DATACREDITO <= ' + QuotedStr(pDataFim);
  end;

  sSql := sSql +
  ' GROUP BY DEP.MATRICULA, ' +
  '          PES.NOME, ' +
  '          CE.IDCONTRATOEMPTMO, ' +
  '          CE.DATACREDITO, ' +
  '          HME.HMEVLRPREVISTO ' +
  ' ORDER BY CE.IDCONTRATOEMPTMO ';

  qrySintetica.close;
  qrySintetica.Sql.Clear();
  qrySintetica.Sql.Add(sSql);
  qrySintetica.Open;

  //CARREGAR O CAMPO VALOR ESPERADO DE CONTRIBUIÇÃO
  while not qrySintetica.Eof do begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT NVL(VLRALTERADOR.VLRALTERADOR,0) + NVL(VLRESPERADO.VLRESPERADO,0) AS VLRESPERADO ' +
                   '  FROM (SELECT SUM(DECODE(HS.FLGTIPO,''D'',-HS.VALOR,HS.VALOR)) AS VLRALTERADOR ' +
                   '          FROM HSTCONTRIBPREV HST, HSTATRASOCONTRIB HS ' +
                   '         WHERE HST.IDPESSOA = ' +
                   '               (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ' +
                   '           AND HST.NUMRECEBIMENTO = HS.NUMRECEBIMENTO ');
    if (pFiltro = 'B') then begin
      qryAux.Sql.Add('    AND HST.DATARECEBIMENTO IS NOT NULL ' +
                     '    AND NVL(HST.VALORRECEBIDO, 0) > 0 ' +
                     '    AND NVL(HST.SITRECEBIMENTO, 0) > 1 ');
      if (qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString <> '') then begin
        qryAux.Sql.Add(' AND HST.IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString);
      end;
    end else begin
      qryAux.Sql.Add('    AND HST.DATARECEBIMENTO IS NULL ' +
                     '    AND NVL(HST.VALORRECEBIDO, 0) = 0 ' +
                     '    AND NVL(HST.SITRECEBIMENTO, 0) = 0 ');
    end;
    qryAux.Sql.Add(') VLRALTERADOR, ' +
                   '       (SELECT SUM(HST.VALORESPERADO) AS VLRESPERADO ' +
                   '          FROM HSTCONTRIBPREV HST ' +
                   '         WHERE HST.IDPESSOA = ' +
                   '               (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ');
    if (pFiltro = 'B') then begin
      qryAux.Sql.Add('    AND HST.DATARECEBIMENTO IS NOT NULL ' +
                     '    AND NVL(HST.VALORRECEBIDO, 0) > 0 ' +
                     '    AND NVL(HST.SITRECEBIMENTO, 0) > 1 ');
      if (qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString <> '') then begin
        qryAux.Sql.Add(' AND HST.IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString);
      end;
    end else begin
      qryAux.Sql.Add('    AND HST.DATARECEBIMENTO IS NULL ' +
                     '    AND NVL(HST.VALORRECEBIDO, 0) = 0 ' +
                     '    AND NVL(HST.SITRECEBIMENTO, 0) = 0 ');
    end;
    qryAux.Sql.Add(') VLRESPERADO ');
    qryAux.Open;

    if (qryAux.FieldByName('VLRESPERADO').AsFloat > 0) then begin
      qrySintetica.Edit;
      qrySintetica.FieldByName('VLRESPERADO').AsFloat := qryAux.FieldByName('VLRESPERADO').AsFloat;
      qrySintetica.Post;
    end;
    
    qrySintetica.Next;
  end;
end;

procedure TfrmRecebeContribEmptmo.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  qrySintetica.Open;
  qryAnalitica.Open;
  bIndividual := False;
  edtDataInicio.SetFocus;

  rgFiltrar.ItemIndex := 0;
  btnReceber.Enabled  := True;
  btnDesfazer.Enabled := False;
end;

procedure TfrmRecebeContribEmptmo.SomaValorTotalAnalitico();
var
  fValorTotal: Extended;
  sPosicao: String;
begin
  lblValorTotalAnalitica.Caption := '0,00';
  qryAnalitica.DisableControls;
  sPosicao := qryAnalitica.Bookmark;
  qryAnalitica.First;
  fValorTotal := 0;
  while not qryAnalitica.Eof do begin
    if (qryAnalitica.FieldByName('SELECAO').AsString = '1') then begin
      fValorTotal := fValorTotal + qryAnalitica.FieldByName('VLRESPERADO').AsFloat;
    end;
    qryAnalitica.Next;
  end;
  lblValorTotalAnalitica.Caption := FloatToStrF(fValorTotal,ffNumber,15,2);
  qryAnalitica.Bookmark := sPosicao;
  qryAnalitica.EnableControls;
end;

procedure TfrmRecebeContribEmptmo.btnVisualizarClick(Sender: TObject);
var
  sFiltro: String;
begin
  inherited;
  //MSG001 - RN001
  if ((edtDataInicio.Date <= 0) or (edtDataFim.Date <= 0)) then begin
    MsgDlg('Os campos DATA INÍCIO e DATA FIM, são obrigatórios para executar a consulta por data.','Informação', mtInformation, [mbOk],0);
    edtDataInicio.SetFocus;
    exit;
  end;

  //MSG002 - RN001
  if (edtDataInicio.Date > edtDataFim.Date) then begin
    MsgDlg('A data de início deve ser menor ou igual a data fim.','Informação', mtInformation, [mbOk],0);
    edtDataInicio.SetFocus;
    exit;
  end;

  if (rgFiltrar.ItemIndex = 0) then begin
    sFiltro := 'A';
  end else begin
    sFiltro := 'B';
  end;

  AbreQrySintetica('', edtDataInicio.Text, edtDataFim.Text, sFiltro);
  
  //MSG003
  if (qrySintetica.IsEmpty) then begin
    MsgDlg('Não foram encontrados registros para os critérios informados.','Informação', mtInformation, [mbOk],0);
    edtDataInicio.SetFocus;
    exit;
  end;
  
  bIndividual := False;
end;

procedure TfrmRecebeContribEmptmo.grdSinteticaDblClick(Sender: TObject);
begin
  inherited;
  if (qrySintetica.Active) then begin
    if (qrySintetica.FieldByName('MATRICULA').AsString <> '') then begin
      qrySintetica.Edit;
      if (qrySintetica.FieldByName('SELECAO').AsString = '1') then begin
        qrySintetica.FieldByName('SELECAO').AsString := '0';
      end else begin
        qrySintetica.FieldByName('SELECAO').AsString := '1';
      end;
      qrySintetica.Post;
    end;
  end;
end;

procedure TfrmRecebeContribEmptmo.PageControl1Change(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet2) then begin
    if (qrySintetica.Active) then begin
      if (qrySintetica.Recordcount <> 1) then begin
        MsgDlg('A visão analítica é permitida apenas para um participante.','Informação', mtInformation, [mbOk],0);
        PageControl1.ActivePage := TabSheet1;
        Exit;
      end;

      if (qrySintetica.FieldByName('SELECAO').AsString <> '1') then begin
        MsgDlg('Selecione um participante para a visão analítica.','Informação', mtInformation, [mbOk],0);
        PageControl1.ActivePage := TabSheet1;
        Exit;
      end;
    end else begin
      SomaValorTotalAnalitico();
    end;
  end;
end;

procedure TfrmRecebeContribEmptmo.grdAnaliticaDblClick(Sender: TObject);
begin
  inherited;
  if (qryAnalitica.Active) then begin
    if (qryAnalitica.FieldByName('MATRICULA').AsString <> '') then begin
      qryAnalitica.Edit;
      if (qryAnalitica.FieldByName('SELECAO').AsString = '1') then begin
        qryAnalitica.FieldByName('SELECAO').AsString := '0';
      end else begin
        qryAnalitica.FieldByName('SELECAO').AsString := '1';
      end;
      qryAnalitica.Post;

      //ATUALIZAR O VALOR TOTAL
      SomaValorTotalAnalitico();
    end;
  end;
end;

procedure TfrmRecebeContribEmptmo.MarcaDesmarca(pTipo: String);
begin
  //pTipo = 'TODAS': Botão Marca Todas;
  //pTipo = 'INVERTE': Botão Inverte Seleção;

  //SINTETICA
  if (PageControl1.ActivePage = TabSheet1) then begin
    qrySintetica.DisableControls;
    qrySintetica.First;
    while not qrySintetica.Eof do begin
      qrySintetica.Edit;
      if (pTipo = 'TODAS') then begin
        qrySintetica.FieldByName('SELECAO').AsString := '1';
      end else if (pTipo = 'INVERTE') then begin
        if (qrySintetica.FieldByName('SELECAO').AsString = '1') then begin
          qrySintetica.FieldByName('SELECAO').AsString := '0';
        end else begin
          qrySintetica.FieldByName('SELECAO').AsString := '1';
        end;
      end;
      qrySintetica.Post;

      qrySintetica.Next;
    end;
    qrySintetica.First;
    qrySintetica.EnableControls;
  //ANALITICA
  end else if (PageControl1.ActivePage = TabSheet2) then begin
    qryAnalitica.DisableControls;
    qryAnalitica.First;
    while not qryAnalitica.Eof do begin
      qryAnalitica.Edit;
      if (pTipo = 'TODAS') then begin
        qryAnalitica.FieldByName('SELECAO').AsString := '1';
      end else if (pTipo = 'INVERTE') then begin
        if (qryAnalitica.FieldByName('SELECAO').AsString = '1') then begin
          qryAnalitica.FieldByName('SELECAO').AsString := '0';
        end else begin
          qryAnalitica.FieldByName('SELECAO').AsString := '1';
        end;
      end;
      qryAnalitica.Post;

      qryAnalitica.Next;
    end;
    qryAnalitica.First;
    qryAnalitica.EnableControls;

    //ATUALIZAR O VALOR TOTAL
    SomaValorTotalAnalitico();
  end;
end;

procedure TfrmRecebeContribEmptmo.btnMarcaTodasClick(Sender: TObject);
begin
  inherited;
  MarcaDesmarca('TODAS');
end;

procedure TfrmRecebeContribEmptmo.btnInverteClick(Sender: TObject);
begin
  inherited;
  MarcaDesmarca('INVERTE');
end;

procedure TfrmRecebeContribEmptmo.btnReceberClick(Sender: TObject);
var
  bSelecionou: Boolean;
  sContaCredito, sContaDebito: String;
  sAux1, sAux2: String;
  iPlnCodigo, i, iPosicao: Integer;
  sMsgErro: String;
  xContribs: TStringList;
  sIdPessoa: String;
  sSQLwhere: String;
  dDataPGA: TDateTime;
  sDataPGA: String;
  sCodDocumentos: String;
  bDisponibilidadeFinanceira: Boolean;
begin
  inherited;
  //VERIFICAR SE O REGISTRO ESTÁ SELECIONADO
  SelecionouRegistro(bSelecionou, 'SINTETICO');

  if not(bSelecionou) then begin
    MsgDlg('A seleção de pelo menos um registro para processamento é obrigatória.','Informação', mtInformation, [mbOk],0);
    PageControl1.ActivePage := TabSheet1;
    Exit;
  end;

  try
    if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      dtmBaseDados.dbBaseDados.StartTransaction();
    end;

    xContribs := TStringList.Create();
    /////////////////////////////////////////
    //RECEBIMENTO INDIVIDUAL POR MATRÍCULA //
    /////////////////////////////////////////
    if (bIndividual) then begin
      if (lblValorTotalAnalitica.Caption <> FloatToStrF(qrySintetica.FieldByName('VLRCONTRATO').AsFloat,ffNumber,15,2)) then begin
        MsgDlg('O valor das contribuições em aberto não corresponde ao valor do empréstimo. Não é possível fazer a baixa.','Informação', mtInformation, [mbOk],0);
        PageControl1.ActivePage := TabSheet1;
        Exit;
      end;

      qryAnalitica.First;
      while not qryAnalitica.Eof do begin
        if (qryAnalitica.fieldByName('SELECAO').AsString = '1') then begin
          qrySintetica.Locate('MATRICULA', qryAnalitica.FieldByName('MATRICULA').AsString, []);

          //BAIXAR AS CONTRIBUIÇÕES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTCONTRIBPREV ' +
                           '    SET SITRECEBIMENTO   = 2, ' +
                           '        CODDOCUMENTOPREV = 5, ' +
                           '        MESCOBRANCA = ' + QuotedStr(Copy(qrySintetica.FieldByName('DATACREDITO').AsString, 7, 4) + '/' + Copy(qrySintetica.FieldByName('DATACREDITO').AsString, 4, 2)) + ', ' +
                           '        IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString + ', ' +
                           '        VALORRECEBIDO    = ' + OraNumero(FormatFloat('#0.00', qryAnalitica.FieldByName('VALORESPERADO').AsFloat)) + ', ' +
                           '        DATARECEBIMENTO  = TO_DATE(''' + qrySintetica.FieldByName('DATACREDITO').AsString + ''', ''dd/mm/yyyy'') ' +
                           '  WHERE NUMRECEBIMENTO  = ' + qryAnalitica.FieldByName('NUMRECEBIMENTO').AsString +
                           '    AND MESREFERENCIA   = ' + QuotedStr(qryAnalitica.FieldByName('MESREFERENCIA').AsString) +
                           '    AND MESCOBRANCA     = ' + QuotedStr(qryAnalitica.FieldByName('MESCOBRANCA').AsString));
          qryBaixa.ExecSql;

          //BAIXAR OS ALTERADORES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTATRASOCONTRIB ' +
                           '    SET VALORRECEBIDO   = VALOR, ' +
                           '        DATARECEBIMENTO = TO_DATE(''' + qrySintetica.FieldByName('DATACREDITO').AsString + ''', ''dd/mm/yyyy'') ' +
                           '  WHERE NUMRECEBIMENTO  = ' + qryAnalitica.FieldByName('NUMRECEBIMENTO').AsString +
                           '    AND MESREFERENCIA   = ' + QuotedStr(qryAnalitica.FieldByName('MESREFERENCIA').AsString) +
                           '    AND MESCOBRANCA     = ' + QuotedStr(qryAnalitica.FieldByName('MESCOBRANCA').AsString));
          qryBaixa.ExecSql;


          //AGRUPAR OS VALORES POR CONTRIBUIÇÃO PARA FUTURA CONTABILIZAÇÃO
          iPosicao := xContribs.IndexOfName(qryAnalitica.FieldByName('IDCONTRIBUICAO').AsString);
          if (iPosicao > -1) then begin
            xContribs.Values[qryAnalitica.FieldByName('IDCONTRIBUICAO').AsString] := FloatToStr(StrToFloat(xContribs.Values[qryAnalitica.FieldByName('IDCONTRIBUICAO').AsString]) + qryAnalitica.FieldByName('VALORESPERADO').AsFloat);
          end else begin
            xContribs.Add(qryAnalitica.FieldByName('IDCONTRIBUICAO').AsString + '=' + qryAnalitica.FieldByName('VALORESPERADO').AsString);
          end;
        end;
        qryAnalitica.Next;
      end;

      //CONTABILIZA AS BAIXAS, AGRUPADAS POR IDCONTRIBUIÇÃO
      for i := 0 to xContribs.Count - 1 do begin
        qryBaixa.Close;
        qryBaixa.Sql.Clear;
        qryBaixa.Sql.Add('SELECT IDPESSJUR, IDPESSOA, IDPLANOPREV FROM PARTPREVPLAN');
        qryBaixa.Sql.Add(' WHERE IDPESSOA = (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+')');
        qryBaixa.Open;

        BuscaInfFinancContrib(sAux1, sAux2, sContaCredito, 'PLACONTAC', '', 'S',
                              qryBaixa.FieldByName('IDPESSJUR').AsInteger,
                              qryBaixa.FieldByName('IDPLANOPREV').AsInteger,
                              StrToInt(xContribs.Names[i]),
                              -1, qryBaixa.FieldByName('IDPESSOA').AsInteger);

        BuscaInfFinancContrib(sAux1, sAux2, sContaDebito, 'PLACONTADBANCO', '', 'S',
                              qryBaixa.FieldByName('IDPESSJUR').AsInteger,
                              qryBaixa.FieldByName('IDPLANOPREV').AsInteger,
                              StrToInt(xContribs.Names[i]),
                              -1, qryBaixa.FieldByName('IDPESSOA').AsInteger);

        qryContabil.Close;
        qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
        qryContabil.Open;

        FazerInsertContab(qryContabil,
                          sContaDebito,
                          '',
                          'D',
                          '2',
                          '5',
                          'Contabilização de contribuição via empréstimo',
                          '',
                          '', '', '',
                          prmUnidNegoc,
                          0,
                          StrToFloat(xContribs.Values[xContribs.Names[i]]), //VALOR
                          0,
                          Date,
                          '',
                          qryBaixa.FieldByName('IDPESSJUR').AsInteger,
                          qryBaixa.FieldByName('IDPLANOPREV').AsInteger);

        IncluiContabilidade(CtrlLancamento, qryContabil, iPlnCodigo, sMsgErro);

        if (iPlnCodigo = -1) then begin
          MsgDlg('Ocorreram erros na contabilização, o processo será cancelado.','Informação', mtInformation, [mbOk],0);
          PageControl1.ActivePage := TabSheet1;
          Exit;
        end;

        sIdPessoa := qryBaixa.FieldByName('IDPESSOA').AsString;
        qryBaixa.Close;
        qryBaixa.SQL.Clear;
        qryBaixa.SQL.Add(' UPDATE HSTCONTRIBPREV SET PLNCODIGO = ' + IntToStr(iPlnCodigo));
        qryBaixa.SQL.Add('  WHERE IDPESSOA = ' + QuotedStr(sIdPessoa));
        qryBaixa.SQL.Add('    AND CODDOCUMENTOPREV = 5');
        qryBaixa.SQL.Add('    AND PLNCODIGO IS NULL');
        qryBaixa.SQL.Add('    AND IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString);
        qryBaixa.ExecSql;
      end;
      
      //INTEGRAÇÃO COM O PGA
      dDataPGA := BuscaDataPGAObrigatorio();
      sDataPGA := DateToStr(dDataPGA);

      bDisponibilidadeFinanceira := CtrlDisponFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, dDataPGA);
      if not(bDisponibilidadeFinanceira) then begin
        //MsgDlg('Disponibilidade financeira bloqueada para esta operação.', 'Erro', mtError, [mbOK], 0);
        Exit;
      end;

      if not (CtrlPeriodo.RetornaPeriodoExercicioDataProc(Sistema.IdEmpresa, DateToStr(dDataPGA))) then begin
        MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOK], 0);
        Exit;
      end;

      if CtrlPeriodo.TestaPeriodoBloqueadoProc(Sistema.IdEmpresa, tbBloqueado, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio,False) then begin
        MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOK], 0);
        Exit;
      end;

      sSQLwhere := ' AND H.CODDOCUMENTOPREV = 5 ' +
                   ' AND H.IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString;

      sMsgErro := RealizaIntegracaoPGAIndiv('', CtrlDocumento, CtrlLancamento, '', sSQLwhere, 'RECEBVIAEMPTMO', qrySintetica.FieldByName('DATACREDITO').AsString, False, sDataPGA);

      if (sMsgErro <> '') then begin
        MsgDlg('Ocorreram erros na integração com o PGA, o processo será cancelado.','Informação', mtInformation, [mbOk],0);
        PageControl1.ActivePage := TabSheet1;
        Exit;
      end;

      //PROCESSAR AS BAIXAS DO PGA
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT DISTINCT CODDOCUMENTOPGAPAGAR, CODDOCUMENTOPGARECEBER');
      qryAux.Sql.Add('  FROM HSTCONTRIBPREV');
      qryAux.Sql.Add('  WHERE IDPESSOA = ' + QuotedStr(sIdPessoa));
      qryAux.Sql.Add('    AND CODDOCUMENTOPREV = 5');
      qryAux.Sql.Add('    AND PLNCODIGO IS NOT NULL');
      qryAux.Sql.Add('    AND IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString);
      qryAux.Open;

      sCodDocumentos := '';
      while not qryAux.Eof do begin
        sCodDocumentos := sCodDocumentos + QuotedStr(qryAux.FieldByName('CODDOCUMENTOPGAPAGAR').AsString) + ',' + QuotedStr(qryAux.FieldByName('CODDOCUMENTOPGARECEBER').AsString) + ',';
        qryAux.Next;
      end;
      sCodDocumentos := Copy(sCodDocumentos, 1, Length(sCodDocumentos) - 1);

      //DELETAR DOCUMXDOCUM
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('DELETE FROM DOCUMXDOCUM');
      qryAux.SQL.Add(' WHERE IDDOCUMENTO IN ('+sCodDocumentos+')');
      qryAux.ExecSql;

      FiltraDadosBaixa('P', sCodDocumentos);
      FiltraDadosBaixa('R', sCodDocumentos);

      //FINALIZAR AS BAIXAS DO PGA
      if not CtrlBaixaRecXPag.ProcessaBaixaDocumento(cdsDocPag.Data, cdsDocRec.Data, cdsLancFinanc.Data,
              Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.IdModulo,
              iCodPortFormaPagar, iCodPortFormaReceber, ParamIntegra.Plano, qrySintetica.FieldByName('DATACREDITO').AsDateTime,
              Sistema.UsaPlanoPatro, ParamIntegra.PartidaDobrada, rTotPag, rTotRec, False) then begin
        MsgDlg('Erro no processamento das Baixas:' + (#13+#10) + CtrlBaixaRecXPag.MessageInfo,'Atenção', mtError, [mbOk],0);
      end;

    //////////////////////////////////
    //RECEBIMENTO EM LOTE POR DATAS //
    //////////////////////////////////
    end else begin
      qrySintetica.DisableControls;
      qrySintetica.First;
      while not qrySintetica.Eof do begin
        if (qrySintetica.FieldByName('SELECAO').AsString = '1') then begin
          if (qrySintetica.FieldByName('VLRCONTRATO').AsFloat <> qrySintetica.FieldByName('VLRESPERADO').AsFloat) then begin
            MsgDlg('O valor das contribuições em aberto não corresponde ao valor do empréstimo. Não é possível fazer a baixa.' +#13#10 +
                   'Participante: ' + pChar(qrySintetica.FieldByName('NOME').AsString),'Informação', mtInformation, [mbOk],0);
            qrySintetica.EnableControls;
            Exit;
          end;
        end;
        qrySintetica.Next;
      end;
      qrySintetica.First;
      qrySintetica.EnableControls;

      //VERIFICAR BAIXAR EM LOTE
      dDataPGA := BuscaDataPGAObrigatorio();
      sDataPGA := DateToStr(dDataPGA);

      bDisponibilidadeFinanceira := CtrlDisponFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, dDataPGA);
      if not(bDisponibilidadeFinanceira) then begin
        //MsgDlg('Disponibilidade financeira bloqueada para esta operação.', 'Erro', mtError, [mbOK], 0);
        Exit;
      end;

      if not (CtrlPeriodo.RetornaPeriodoExercicioDataProc(Sistema.IdEmpresa, DateToStr(dDataPGA))) then begin
        MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOK], 0);
        Exit;
      end;

      if CtrlPeriodo.TestaPeriodoBloqueadoProc(Sistema.IdEmpresa, tbBloqueado, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio,False) then begin
        MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOK], 0);
        Exit;
      end;

      while not qrySintetica.Eof do begin
        if (qrySintetica.fieldByName('SELECAO').AsString = '1') then begin

          //QRY USADA NA CONTABILIZAÇÃO, ESTA ANTES DE TUDO PARA SELECIONAR OS REGISTROS ANTES DE SEREM BAIXADOS
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add('' +
          ' SELECT VLRESPERADO.IDCONTRIBUICAO, NVL(VLRALTERADOR.VLRALTERADOR, 0) + NVL(VLRESPERADO.VLRESPERADO, 0) AS VLRESPERADO ' +
          '   FROM (SELECT SUM(DECODE(HS.FLGTIPO, ''D'', -HS.VALOR, HS.VALOR)) AS VLRALTERADOR ' +
          '           FROM HSTCONTRIBPREV HST, HSTATRASOCONTRIB HS ' +
          '          WHERE HST.IDPESSOA = ' +
          '                (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+')'+
          '            AND HST.NUMRECEBIMENTO = HS.NUMRECEBIMENTO ' +
          '            AND HST.DATARECEBIMENTO IS NULL ' +
          '            AND NVL(HST.VALORRECEBIDO, 0) = 0 ' +
          '            AND NVL(HST.SITRECEBIMENTO, 0) = 0) VLRALTERADOR, ' +
          '        (SELECT IDCONTRIBUICAO, ' +
          '                SUM(HST.VALORESPERADO) AS VLRESPERADO ' +
          '           FROM HSTCONTRIBPREV HST ' +
          '          WHERE HST.IDPESSOA = ' +
          '                (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+')'+
          '            AND HST.DATARECEBIMENTO IS NULL ' +
          '            AND NVL(HST.VALORRECEBIDO, 0) = 0 ' +
          '            AND NVL(HST.SITRECEBIMENTO, 0) = 0 ' +
          '       GROUP BY IDCONTRIBUICAO) VLRESPERADO ');
          qryAux.Open;

          //BAIXAR AS CONTRIBUIÇÕES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTCONTRIBPREV ' +
                           '    SET SITRECEBIMENTO   = 2, ' +
                           '        CODDOCUMENTOPREV = 5, ' +
                           '        MESCOBRANCA = ' + QuotedStr(Copy(qrySintetica.FieldByName('DATACREDITO').AsString, 7, 4) + '/' + Copy(qrySintetica.FieldByName('DATACREDITO').AsString, 4, 2)) + ', ' +
                           '        IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString + ', ' +
                           '        VALORRECEBIDO    = VALORESPERADO, ' +
                           '        DATARECEBIMENTO  = TO_DATE(''' + qrySintetica.FieldByName('DATACREDITO').AsString + ''', ''dd/mm/yyyy'') ' +
                           '  WHERE IDPESSOA = (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ' +
                           '    AND DATARECEBIMENTO IS NULL ' +
                           '    AND NVL(VALORRECEBIDO, 0) = 0 ' +
                           '    AND NVL(SITRECEBIMENTO, 0) = 0 ');
          qryBaixa.ExecSql;

          //BAIXAR OS ALTERADORES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTATRASOCONTRIB ' +
                           '    SET VALORRECEBIDO   = VALOR, ' +
                           '        DATARECEBIMENTO = TO_DATE(''' + qrySintetica.FieldByName('DATACREDITO').AsString + ''', ''dd/mm/yyyy'') ' +
                           '  WHERE NUMRECEBIMENTO IN (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV ' +
                           '                            WHERE IDPESSOA = ( SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ' +
                           '    AND DATARECEBIMENTO IS NULL ' +
                           '    AND NVL(VALORRECEBIDO, 0) = 0 ' +
                           '    AND NVL(SITRECEBIMENTO, 0) = 0) ');
          qryBaixa.ExecSql;

          while not qryAux.Eof do begin
            //CONTABILIZA AS BAIXAS, AGRUPADAS POR IDCONTRIBUIÇÃO
            qryBaixa.Close;
            qryBaixa.Sql.Clear;
            qryBaixa.Sql.Add('SELECT IDPESSJUR, IDPESSOA, IDPLANOPREV FROM PARTPREVPLAN');
            qryBaixa.Sql.Add(' WHERE IDPESSOA = (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+')');
            qryBaixa.Open;

            BuscaInfFinancContrib(sAux1, sAux2, sContaCredito, 'PLACONTAC', '', 'S',
                                  qryBaixa.FieldByName('IDPESSJUR').AsInteger,
                                  qryBaixa.FieldByName('IDPLANOPREV').AsInteger,
                                  StrToInt(qryAux.FieldByName('IDCONTRIBUICAO').AsString),
                                  -1, qryBaixa.FieldByName('IDPESSOA').AsInteger);

            BuscaInfFinancContrib(sAux1, sAux2, sContaDebito, 'PLACONTADBANCO', '', 'S',
                                  qryBaixa.FieldByName('IDPESSJUR').AsInteger,
                                  qryBaixa.FieldByName('IDPLANOPREV').AsInteger,
                                  StrToInt(qryAux.FieldByName('IDCONTRIBUICAO').AsString),
                                  -1, qryBaixa.FieldByName('IDPESSOA').AsInteger);

            qryContabil.Close;
            qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
            qryContabil.Open;

            FazerInsertContab(qryContabil,
                              sContaDebito,
                              '',
                              'D',
                              '2',
                              '5',
                              'Contabilização de contribuição via empréstimo',
                              '',
                              '', '', '',
                              prmUnidNegoc,
                              0,
                              StrToFloat(qryAux.FieldByName('VLRESPERADO').AsString), //VALOR
                              0,
                              Date,
                              '',
                              qryBaixa.FieldByName('IDPESSJUR').AsInteger,
                              qryBaixa.FieldByName('IDPLANOPREV').AsInteger);

            IncluiContabilidade(CtrlLancamento, qryContabil, iPlnCodigo, sMsgErro);

            if (iPlnCodigo = -1) then begin
              MsgDlg('Ocorreram erros na contabilização, o processo será cancelado.','Informação', mtInformation, [mbOk],0);
              PageControl1.ActivePage := TabSheet1;
              Exit;
            end;

            sIdPessoa := qryBaixa.FieldByName('IDPESSOA').AsString;
            qryBaixa.Close;
            qryBaixa.SQL.Clear;
            qryBaixa.SQL.Add(' UPDATE HSTCONTRIBPREV SET PLNCODIGO = ' + IntToStr(iPlnCodigo));
            qryBaixa.SQL.Add('  WHERE IDPESSOA = ' + QuotedStr(sIdPessoa));
            qryBaixa.SQL.Add('    AND CODDOCUMENTOPREV = 5');
            qryBaixa.SQL.Add('    AND PLNCODIGO IS NULL');
            qryBaixa.SQL.Add('    AND IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString);
            qryBaixa.ExecSql;

            qryAux.Next;
          end;

          //INTEGRAÇÃO COM O PGA
          sSQLwhere := ' AND H.CODDOCUMENTOPREV = 5 ' +
                       ' AND H.IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString;

          sMsgErro := RealizaIntegracaoPGAIndiv('', CtrlDocumento, CtrlLancamento, '', sSQLwhere, 'RECEBVIAEMPTMO', qrySintetica.FieldByName('DATACREDITO').AsString, False, sDataPGA);

          if (sMsgErro <> '') then begin
            MsgDlg('Ocorreram erros na integração com o PGA, o processo será cancelado.','Informação', mtInformation, [mbOk],0);
            PageControl1.ActivePage := TabSheet1;
            Exit;
          end;

          //PROCESSAR AS BAIXAS DO PGA
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add('SELECT DISTINCT CODDOCUMENTOPGAPAGAR, CODDOCUMENTOPGARECEBER');
          qryAux.Sql.Add('  FROM HSTCONTRIBPREV');
          qryAux.Sql.Add('  WHERE IDPESSOA = ' + QuotedStr(sIdPessoa));
          qryAux.Sql.Add('    AND CODDOCUMENTOPREV = 5');
          qryAux.Sql.Add('    AND PLNCODIGO IS NOT NULL');
          qryAux.Sql.Add('    AND IDCONTRATOEMPTMO = ' + qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString);
          qryAux.Open;

          sCodDocumentos := '';
          while not qryAux.Eof do begin
            sCodDocumentos := sCodDocumentos + QuotedStr(qryAux.FieldByName('CODDOCUMENTOPGAPAGAR').AsString) + ',' + QuotedStr(qryAux.FieldByName('CODDOCUMENTOPGARECEBER').AsString) + ',';
            qryAux.Next;
          end;
          sCodDocumentos := Copy(sCodDocumentos, 1, Length(sCodDocumentos) - 1);

          //DELETAR DOCUMXDOCUM
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add('DELETE FROM DOCUMXDOCUM');
          qryAux.SQL.Add(' WHERE IDDOCUMENTO IN ('+sCodDocumentos+')');
          qryAux.ExecSql;

          FiltraDadosBaixa('P', sCodDocumentos);
          FiltraDadosBaixa('R', sCodDocumentos);

          //FINALIZAR AS BAIXAS DO PGA
          if not CtrlBaixaRecXPag.ProcessaBaixaDocumento(cdsDocPag.Data, cdsDocRec.Data, cdsLancFinanc.Data,
                  Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.IdModulo,
                  iCodPortFormaPagar, iCodPortFormaReceber, ParamIntegra.Plano, qrySintetica.FieldByName('DATACREDITO').AsDateTime,
                  Sistema.UsaPlanoPatro, ParamIntegra.PartidaDobrada, rTotPag, rTotRec, False) then begin
            MsgDlg('Erro no processamento das Baixas:' + (#13+#10) + CtrlBaixaRecXPag.MessageInfo,'Atenção', mtError, [mbOk],0);
          end;
        end;
        qrySintetica.Next;
      end;
    end;

    if not(bIndividual) then begin
      Showmessage('Integração com PGA realizada com Sucesso');
    end;

    if (MsgDlg('Todas as contribuições foram baixadas com sucesso. Deseja gravar as alterações?',
               'Confirmação', mtConfirmation, [mbYes,mbNo],0) = mrYes) then begin
      if (dtmBaseDados.dbBaseDados.InTransaction) then begin
        dtmBaseDados.dbBaseDados.Commit;
      end;
    end else begin
      if (dtmBaseDados.dbBaseDados.InTransaction) then begin
        dtmBaseDados.dbBaseDados.Rollback;
      end;
    end;
  finally
    if (dtmBaseDados.dbBaseDados.InTransaction) then begin
      dtmBaseDados.dbBaseDados.Rollback;
    end;

    PageControl1.ActivePage := TabSheet1;
    ZeraQryAnalitica();
    ZeraQrySintetica();
    
    FreeAndNil(xContribs);
  end;
end;

procedure TfrmRecebeContribEmptmo.rgFiltrarClick(Sender: TObject);
begin
  inherited;
  ZeraQryAnalitica();
  ZeraQrySintetica();
  if (rgFiltrar.ItemIndex = 0) then begin
    btnReceber.Enabled  := True;
    btnDesfazer.Enabled := False;
  end else begin
    btnReceber.Enabled  := False;
    btnDesfazer.Enabled := True;
  end;
end;

procedure TfrmRecebeContribEmptmo.FormCreate(Sender: TObject);
begin
  inherited;
  try
    CtrlLancamento := TCtrlLancamento.Create;
    CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );
  except
    MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
    Abort;
  end;

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
    MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
    Abort;
  end;

  CtrlDisponFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                         Sistema.IdUsuario,Sistema.UsaPlanoPatro);

  CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,nil,False,eOnMessage);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(CtrlLancamento);
  CtrlPeriodo.OnMessageInfo := nil;

  CtrlBaixaRecXPag := TCtrlBaixaRecXPag.Create;
  CtrlBaixaRecXPag.InitializeAs(ParamIntegra);

  with qryAux do begin
    //FIXADO 144 POIS NÃO EXISTIA PARAMETRIZAÇÃO, COMBINADO COM A ROBERTA.
    {Close;
    Sql.Clear();
    Sql.Add(' SELECT' +
            '   CODPORTFORMA' +
            ' FROM' +
            '   PORTADORFORMA' +
            ' WHERE' +
            '   NVL(FLGATIVO, ''S'') = ''S'' AND ' +
            '   IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ' AND FLGENCCONTAS = ''S'' AND ' +
            '   RECPAG   = ''R'' ' +
            ' ORDER BY DESCRICAO');
    Open;
    iCodPortFormaReceber := FieldByName('CODPORTFORMA').AsInteger;}
    iCodPortFormaReceber := 144;

    //FIXADO 143 POIS NÃO EXISTIA PARAMETRIZAÇÃO, COMBINADO COM A ROBERTA.
    {Close;
    Sql.Clear();
    Sql.Add(' SELECT' +
            '   CODPORTFORMA' +
            ' FROM' +
            '   PORTADORFORMA' +
            ' WHERE' +
            '   NVL(FLGATIVO, ''S'') = ''S'' AND ' +
            '   IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) + ' AND FLGENCCONTAS = ''S'' AND ' +
            '   RECPAG   = ''P''  ' +
            ' ORDER BY DESCRICAO');
    Open;
    iCodPortFormaPagar := FieldByName('CODPORTFORMA').AsInteger;}
    iCodPortFormaPagar := 143;
  end;

  SQLDocPag.Open;
  SQLDocRec.Open;
  sqlLancFinanc.Open;
end;

procedure TfrmRecebeContribEmptmo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlLancamento );
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlDisponFinanc );
  FreeAndNil( CtrlPeriodo );
  FreeAndNil( CtrlBaixaRecXPag );
end;

procedure TfrmRecebeContribEmptmo.btnDesfazerClick(Sender: TObject);
var
  bDisponibilidadeFinanceira: Boolean;
  bSelecionou: Boolean;
begin
  inherited;
  bDisponibilidadeFinanceira := CtrlDisponFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, Date);

  if not(bDisponibilidadeFinanceira) then begin
    //MsgDlg('Disponibilidade financeira bloqueada para esta operação.', 'Erro', mtError, [mbOK], 0);
    Exit;
  end;

  if not (CtrlPeriodo.RetornaPeriodoExercicioDataProc(Sistema.IdEmpresa, DateToStr(Date))) then begin
    MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOK], 0);
    Exit;
  end;

  if CtrlPeriodo.TestaPeriodoBloqueadoProc(Sistema.IdEmpresa, tbBloqueado, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio,False) then begin
    MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOK], 0);
    Exit;
  end;

  try
    if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      dtmBaseDados.dbBaseDados.StartTransaction();
    end;

    //////////////////////////////////////
    //DESFAZER INDIVIDUAL POR MATRÍCULA //
    //////////////////////////////////////
    if (bIndividual) then begin
      SelecionouRegistro(bSelecionou, 'ANALITICO');
      if not(bSelecionou) then begin
        MsgDlg('Nenhum registro analíticio foi selecionado para desfazer.', 'Confirmação', mtConfirmation, [mbOk],0);
        Exit;
      end;

      qryAnalitica.First;
      while not qryAnalitica.Eof do begin
        if (qryAnalitica.fieldByName('SELECAO').AsString = '1') then begin
          qrySintetica.Locate('MATRICULA', qryAnalitica.FieldByName('MATRICULA').AsString, []);

          //EXLUIR PGA E CONTABILIDADE
          DesfazerPGAeContabilidade(qryAnalitica.FieldByName('CODDOCUMENTOPGAPAGAR').AsString,
                                    qryAnalitica.FieldByName('CODDOCUMENTOPGAReceber').AsString,
                                    qryAnalitica.FieldByName('PLNCODIGO').AsString);
          
          //DESFAZER AS CONTRIBUIÇÕES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTCONTRIBPREV ' +
                           '    SET SITRECEBIMENTO   = 0, ' +
                           '        CODDOCUMENTOPREV = NULL, ' +
                           '        CODDOCUMENTOPGAPAGAR = NULL, ' +
                           '        CODDOCUMENTOPGARECEBER = NULL, ' +
                           '        IDCONTRATOEMPTMO = NULL, ' +
                           '        VALORRECEBIDO    = NULL, ' +
                           '        DATARECEBIMENTO  = NULL, ' +
                           '        PLNCODIGO        = NULL ' +
                           '  WHERE NUMRECEBIMENTO  = ' + qryAnalitica.FieldByName('NUMRECEBIMENTO').AsString +
                           '    AND MESREFERENCIA   = ' + QuotedStr(qryAnalitica.FieldByName('MESREFERENCIA').AsString) +
                           '    AND MESCOBRANCA     = ' + QuotedStr(qryAnalitica.FieldByName('MESCOBRANCA').AsString));
          qryBaixa.ExecSql;

          //DESFAZER OS ALTERADORES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTATRASOCONTRIB ' +
                           '    SET VALORRECEBIDO   = NULL, ' +
                           '        DATARECEBIMENTO = NULL ' +
                           '  WHERE NUMRECEBIMENTO  = ' + qryAnalitica.FieldByName('NUMRECEBIMENTO').AsString +
                           '    AND MESREFERENCIA   = ' + QuotedStr(qryAnalitica.FieldByName('MESREFERENCIA').AsString) +
                           '    AND MESCOBRANCA     = ' + QuotedStr(qryAnalitica.FieldByName('MESCOBRANCA').AsString));
          qryBaixa.ExecSql; 
        end;
        qryAnalitica.Next;
      end;

    //////////////////////////////////
    //RECEBIMENTO EM LOTE POR DATAS //
    //////////////////////////////////
    end else begin
      //VERIFICAR BAIXAR EM LOTE
      qrySintetica.First;
      while not qrySintetica.Eof do begin
        if (qrySintetica.fieldByName('SELECAO').AsString = '1') then begin

          //EXCLUIR O PGA
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' SELECT DISTINCT CODDOCUMENTOPGAPAGAR, CODDOCUMENTOPGARECEBER FROM HSTCONTRIBPREV ' +
                           '  WHERE IDPESSOA = (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ' +
                           '    AND IDCONTRATOEMPTMO = ' + QuotedStr(qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString) +
                           '    AND DATARECEBIMENTO IS NOT NULL ' +
                           '    AND NVL(VALORRECEBIDO, 0) > 0 ' +
                           '    AND NVL(SITRECEBIMENTO, 0) > 1 ');
          qryBaixa.Open;

          while not qryBaixa.Eof do begin
            DesfazerPGAeContabilidade(qryBaixa.FieldByName('CODDOCUMENTOPGAPAGAR').AsString, qryBaixa.FieldByName('CODDOCUMENTOPGARECEBER').AsString, '');
            qryBaixa.Next;
          end;

          //EXCLUIR A CONTABILIDADE
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' SELECT DISTINCT PLNCODIGO FROM LANCAMENTO ' +
                           '  WHERE PLNCODIGO IN (SELECT PLNCODIGO FROM HSTCONTRIBPREV ' +
                           '                       WHERE IDPESSOA = ( SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ' +
                           '                         AND IDCONTRATOEMPTMO = ' + QuotedStr(qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString) + ')');
          qryBaixa.Open;

          while not qryBaixa.Eof do begin
            DesfazerPGAeContabilidade('', '', qryBaixa.FieldByName('PLNCODIGO').AsString);
            qryBaixa.Next;
          end;

          //BAIXAR AS CONTRIBUIÇÕES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTCONTRIBPREV ' +
                           '    SET SITRECEBIMENTO   = 0, ' +
                           '        CODDOCUMENTOPREV = NULL, ' +
                           '        CODDOCUMENTOPGAPAGAR = NULL, ' +
                           '        CODDOCUMENTOPGARECEBER = NULL, ' +
                           '        IDCONTRATOEMPTMO = NULL, ' +
                           '        VALORRECEBIDO    = NULL, ' +
                           '        DATARECEBIMENTO  = NULL, ' +
                           '        PLNCODIGO        = NULL ' +
                           '  WHERE IDPESSOA = (SELECT IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ' +
                           '    AND IDCONTRATOEMPTMO = ' + QuotedStr(qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString) +
                           '    AND DATARECEBIMENTO IS NOT NULL ' +
                           '    AND NVL(VALORRECEBIDO, 0) > 0 ' +
                           '    AND NVL(SITRECEBIMENTO, 0) > 1 ');
          qryBaixa.ExecSql;

          //BAIXAR OS ALTERADORES
          qryBaixa.Close;
          qryBaixa.Sql.Clear;
          qryBaixa.Sql.Add(' UPDATE HSTATRASOCONTRIB ' +
                           '    SET VALORRECEBIDO   = NULL, ' +
                           '        DATARECEBIMENTO = NULL ' +
                           '  WHERE NUMRECEBIMENTO IN (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV ' +
                           '                            WHERE IDPESSOA = ( SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA = '+ QuotedStr(qrySintetica.FieldByName('MATRICULA').AsString)+') ' +
                           '                              AND IDCONTRATOEMPTMO = ' + QuotedStr(qrySintetica.FieldByName('IDCONTRATOEMPTMO').AsString) + 
                           '                              AND NVL(SITRECEBIMENTO, 0) > 1) '+
                           '    AND DATARECEBIMENTO IS NOT NULL ' +
                           '    AND NVL(VALORRECEBIDO, 0) > 0 ');
          qryBaixa.ExecSql;
        end;
        qrySintetica.Next;
      end;
    end;

    if (MsgDlg('Todas as contribuições foram desfeitas com sucesso. Deseja gravar as alterações?',
               'Confirmação', mtConfirmation, [mbYes,mbNo],0) = mrYes) then begin
      if (dtmBaseDados.dbBaseDados.InTransaction) then begin
        dtmBaseDados.dbBaseDados.Commit;
      end;
    end else begin
      if (dtmBaseDados.dbBaseDados.InTransaction) then begin
        dtmBaseDados.dbBaseDados.Rollback;
      end;
    end;
    PageControl1.ActivePage := TabSheet1;
    ZeraQryAnalitica();
    ZeraQrySintetica();
  finally
    if (dtmBaseDados.dbBaseDados.InTransaction) then begin
      dtmBaseDados.dbBaseDados.Rollback;
    end;
  end;
end;

procedure TfrmRecebeContribEmptmo.eOnMessage(sMsg : string);
begin
   MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;

procedure TfrmRecebeContribEmptmo.bbtnImprimirClick(Sender: TObject);
var
  bSelecionou: Boolean;
begin
  inherited;
  bPrintAll := True;
  if (PageControl1.ActivePage = TabSheet1) then begin
    SelecionouRegistro(bSelecionou, 'SINTETICO');
    if (bSelecionou) then begin
      bPrintAll := False;
    end;
    rpRelSintetico.Print;
  end else if (PageControl1.ActivePage = TabSheet2) then begin
    SelecionouRegistro(bSelecionou, 'ANALITICO');
    if (bSelecionou) then begin
      bPrintAll := False;
    end;
    rpRelAnalitico.Print;
  end;
end;

procedure TfrmRecebeContribEmptmo.SelecionouRegistro(var bSelecionou: Boolean; sTipo: String);
begin
  if (sTipo = 'SINTETICO') then begin
    bSelecionou := False;
    qrySintetica.DisableControls;
    qrySintetica.First;
    while not qrySintetica.Eof do begin
      if (qrySintetica.FieldByName('SELECAO').AsString = '1') then begin
        bSelecionou := True;
        qrySintetica.EnableControls;
        Break;
      end;
      qrySintetica.Next;
    end;
    qrySintetica.EnableControls;
  end else if (sTipo = 'ANALITICO') then begin
    bSelecionou := False;
    qryAnalitica.DisableControls;
    qryAnalitica.First;
    while not qryAnalitica.Eof do begin
      if (qryAnalitica.FieldByName('SELECAO').AsString = '1') then begin
        bSelecionou := True;
        qryAnalitica.EnableControls;
        Break;
      end;
      qryAnalitica.Next;
    end;
    qryAnalitica.EnableControls;
  end;
end;

procedure TfrmRecebeContribEmptmo.ppDetailBand25BeforePrint(
  Sender: TObject);
begin
  inherited;
  if not(bPrintAll) then begin
    ppDetailBand25.Visible := (qrySintetica.FieldByName('SELECAO').AsString = '1');
  end;
end;

procedure TfrmRecebeContribEmptmo.ppDetailBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  if not(bPrintAll) then begin
    ppDetailBand1.Visible := (qryAnalitica.FieldByName('SELECAO').AsString = '1');
  end;
end;

procedure TfrmRecebeContribEmptmo.ZeraQryAnalitica();
var
  sSql: String;
begin
  sSql := '';
  sSql := sSql +
  '  SELECT ''0'' AS SELECAO, ' +
  '         '' '' AS MATRICULA, ' +
  '         '' '' AS NOME, ' +
  '         '' '' AS NOME, ' +
  '         '' '' AS MESREFERENCIA, ' +
  '         '' '' AS MESCOBRANCA, ' +
  '         '' '' AS VALORESPERADO, ' +
  '         '' '' AS SOMAVALOR, ' +
  '         '' '' AS VLRESPERADO, ' +
  '         '' '' AS SITRECEBIMENTO, ' +
  '         '' '' AS DATAPREVISAORECE, ' +
  '         '' '' AS NUMRECEBIMENTO ' +
  '    FROM DUAL ';

  qryAnalitica.close;
  qryAnalitica.Sql.Clear();
  qryAnalitica.Sql.Add(sSql);
  qryAnalitica.Open;
end;

procedure TfrmRecebeContribEmptmo.ZeraQrySintetica();
var
  sSql: String;
begin
  sSql := '';
  sSql := sSql +
  '  SELECT ''0'' AS SELECAO, ' +
  '         '' '' AS MATRICULA, ' +
  '         '' '' AS NOME, ' +
  '         '' '' AS IDCONTRATOEMPTMO, ' +
  '         '' '' AS DATACREDITO, ' +
  '         '' '' AS VLRCONTRATO, ' +
  '         '' '' AS VLRESPERADO FROM DUAL ';

  qrySintetica.close;
  qrySintetica.Sql.Clear();
  qrySintetica.Sql.Add(sSql);
  qrySintetica.Open;

  lblValorTotalAnalitica.Caption := '0,00';
end;

procedure TfrmRecebeContribEmptmo.DesfazerPGAeContabilidade(pCodDocumentoPGAPagar, pCodDocumentoPGAReceber, pPlnCodigoContabil: String);
var
  iPlnCodigoPagar: Integer;
  iPlnCodigoReceber: Integer;
  sPlnCodigoDelete: String;
begin
  //EXCLUIR O PGA
  iPlnCodigoPagar   := 0;
  iPlnCodigoReceber := 0;
  if (pCodDocumentoPGAPagar <> '') and (pCodDocumentoPGAReceber <> '') then begin
    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' SELECT PLNCODIGO FROM LANCTODOCUM ' +
                     '  WHERE CODDOCUMENTO = ' + pCodDocumentoPGAPagar);
    qryBaixaContabil.Open;
    iPlnCodigoPagar := qryBaixaContabil.FieldByName('PLNCODIGO').AsInteger;

    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' SELECT PLNCODIGO FROM LANCTODOCUM ' +
                     '  WHERE CODDOCUMENTO = ' + pCodDocumentoPGAReceber);
    qryBaixaContabil.Open;
    iPlnCodigoReceber := qryBaixaContabil.FieldByName('PLNCODIGO').AsInteger;
    
    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' DELETE FROM RECBTOPAGTO ' +
                     '  WHERE CODDOCUMENTO IN (' + pCodDocumentoPGAPagar + ',' + pCodDocumentoPGAReceber + ')');
    qryBaixaContabil.ExecSql;

    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' DELETE FROM LANCTODOCUM ' +
                     '  WHERE CODDOCUMENTO IN (' + pCodDocumentoPGAPagar + ',' + pCodDocumentoPGAReceber + ')');
    qryBaixaContabil.ExecSql;

    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' DELETE FROM RATEIODOCUM ' +
                     '  WHERE CODDOCUMENTO IN (' + pCodDocumentoPGAPagar + ',' + pCodDocumentoPGAReceber + ')');
    qryBaixaContabil.ExecSql;

    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' DELETE FROM RATEIODOCUM_ALTERADOR ' +
                     '  WHERE CODDOCUMENTO IN (' + pCodDocumentoPGAPagar + ',' + pCodDocumentoPGAReceber + ')');
    qryBaixaContabil.ExecSql;

    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' DELETE FROM DOCUMENTO ' +
                     '  WHERE CODDOCUMENTO IN (' + pCodDocumentoPGAPagar + ',' + pCodDocumentoPGAReceber + ')');
    qryBaixaContabil.ExecSql;
  end;
  
  //EXCLUI PGA E CONTABILIDADE
  sPlnCodigoDelete := '';
  if (iPlnCodigoPagar > 0) then begin
    sPlnCodigoDelete := sPlnCodigoDelete + IntToStr(iPlnCodigoPagar) + ',';
  end;

  if (iPlnCodigoReceber > 0) then begin
    sPlnCodigoDelete := sPlnCodigoDelete + IntToStr(iPlnCodigoReceber) + ',';
  end;

  if (pPlnCodigoContabil <> '') then begin
    sPlnCodigoDelete := sPlnCodigoDelete + pPlnCodigoContabil + ',';
  end;
  sPlnCodigoDelete := Copy(sPlnCodigoDelete, 1, Length(sPlnCodigoDelete) -1);

  if (Trim(sPlnCodigoDelete) <> '') then begin
    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' DELETE FROM LANCAMENTO ' +
                     '  WHERE PLNCODIGO IN (' + sPlnCodigoDelete + ')');
    qryBaixaContabil.ExecSql;

    qryBaixaContabil.Close;
    qryBaixaContabil.Sql.Clear;
    qryBaixaContabil.Sql.Add(' DELETE FROM PLANILHA ' +
                     '  WHERE PLNCODIGO IN (' + sPlnCodigoDelete + ')');
    qryBaixaContabil.ExecSql;
  end;
end;

procedure TfrmRecebeContribEmptmo.FiltraDadosBaixa(sRecPag, pDocumentos: String);
  procedure AdicionaPlanosPrevidenciarios;
  begin
    try
       //PAGAMENTOS
       if sRecPag = 'P' then
       begin
          cdsDocPag.DisableControls;
          while (not cdsDocPag.eof) do
          begin
             AbreQryPlanoxDocum(cdsDocPag.FieldByName('CODDOCUMENTO').AsString);
             while (not qryPlanoxDocum.Eof) do
             begin
                cdsDocPag.Edit;
                if (qryPlanoxDocum.recno > 1) then
                  cdsDocPag.fieldByName('PLANOPREV').asString := cdsDocPag.fieldByName('PLANOPREV').asString + '; '+ qryPlanoxDocum.fieldByName('NOME').asString
                else
                  cdsDocPag.fieldByName('PLANOPREV').asString := cdsDocPag.fieldByName('PLANOPREV').asString + qryPlanoxDocum.fieldByName('NOME').asString;
                cdsDocPag.Post;
                qryPlanoxDocum.Next;
             end;

             cdsDocPag.Next;
          end;
          cdsDocPag.EnableControls;
          
       //RECEBIMENTOS
       end else begin

          cdsDocRec.DisableControls;
          while (not cdsDocRec.eof) do
          begin
             AbreQryPlanoxDocum(cdsDocPag.FieldByName('CODDOCUMENTO').AsString);
             while (not qryPlanoxDocum.Eof) do
             begin
                cdsDocRec.Edit;
                if (qryPlanoxDocum.recno > 1) then
                  cdsDocRec.fieldByName('PLANOPREV').asString := cdsDocRec.fieldByName('PLANOPREV').asString + '; '+ qryPlanoxDocum.fieldByName('NOME').asString
                else
                  cdsDocRec.fieldByName('PLANOPREV').asString := cdsDocRec.fieldByName('PLANOPREV').asString + qryPlanoxDocum.fieldByName('NOME').asString;
                cdsDocRec.Post;
                qryPlanoxDocum.Next;
             end;

             cdsDocRec.Next;
          end;
       end;
    finally
       cdsDocRec.EnableControls;
    end;
  end;
begin
  if sRecPag = 'P' then begin
    with SQLDocPag do
    begin
      SQL.Clear;
      SQL.Append('SELECT');
      SQL.Append('  ''S'' AS SELECIONA,');
      SQL.Append('  ''N'' AS BAIXAPARCIAL,');
      SQL.Append('  0 AS VALORPAGO,');
      SQL.Append('  0 as VALORPAGOOOTRMOE,');
      SQL.Append('  U.SALDO,');
      SQL.Append('  U.SALDO1,');
      SQL.Append('  D.IDFORCLI,');
      SQL.Append('  D.OPERACAO,');
      SQL.Append('  D.IDPESSOA,');
      SQL.Append('  D.CODDOCUMENTO,');
      SQL.Append('  D.NODOCUMENTO,');
      SQL.Append('  D.COMPLDOCUMENTO,');
      SQL.Append('  D.DATAPROGRAMADA,');
      SQL.Append('  D.DATAVENCTO,');
      SQL.Append('  D.RECPAG,');
      SQL.Append('  P.NOME,');
      SQL.Append('  D.STATUS,');
      SQL.Append('  D.MOECODIGO,');
      SQL.Append('  D.PLANO,');
      SQL.Append('  D.PLACONTA,');
      SQL.Append('  D.CODCENTROCUSTO,');
      SQL.Append('  D.CODSUBCONTA,');
      SQL.Append('  D.CODGRUPOCNAB,');
      SQL.Append('  D.NOSSONUMERO,');
      SQL.Append('  L.NUMLANCTO,');
      SQL.Append('  L.VLRLIQUIDO,');
      SQL.Append('  DECODE(L.DEBCRE,''C'',''D'',''C'') AS DEBCRE,');
      SQL.Append('  L.VALOROUTRAMOEDA,');
      SQL.Append('  0 AS IMPRET,');
      SQL.Append('  0 AS IMP,');
      SQL.Append('  0 AS DIF,');
      SQL.Append('  D.IDMODULO,');
      SQL.Append('  D.CODTIPDOC');
      SQL.Append(', ''                                        ''  AS PLANOPREV ');
      SQL.Append('FROM');
      SQL.Append('  DOCUMENTO D,');
      SQL.Append('  PESSOA P,');
      SQL.Append('  LANCTODOCUM L,');
      SQL.Append('  (SELECT L.CODDOCUMENTO,');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ');
      SQL.Append('   FROM LANCTODOCUM L, DOCUMENTO D');
      SQL.Append('   WHERE D.CODDOCUMENTO IN ('+pDocumentos+') AND');
      SQL.Append('         D.CODDOCUMENTO = L.CODDOCUMENTO AND');
      SQL.Append('         D.RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('         D.STATUS <> ''2''');
      SQL.Append('   GROUP BY L.CODDOCUMENTO) U ');
      SQL.Append('WHERE');
      SQL.Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ' ) AND');
      SQL.Append('  D.CODTIPDOC IN');
      SQL.Append('       (SELECT CODTIPDOC');
      SQL.Append('        FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND NOT EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario));
      SQL.Append('                                )');
      SQL.Append('        UNION');
      SQL.Append('        SELECT CODTIPDOC FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      A.CODTIPDOC = B.CODTIPDOC AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.iDUsuario) + ')) AND ');
      SQL.Append(' (D.OPERACAO = L.OPERACAO) AND');
      SQL.Append(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
      SQL.Append(' (L.ESTORNO IS NULL) AND');
      SQL.Append(' (D.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)+ ') AND');
      SQL.Append(' (D.STATUS = ''0'' OR D.STATUS=''1'' OR (D.STATUS IS NULL)) AND');
      SQL.Append(' (RTrim(D.OPERACAO) IN (''1'',''2'',''3'')) AND');
      SQL.Append(' (D.IDFORCLI = P.IDPESSOA) AND');
      SQL.Append(' (D.CODDOCUMENTO IN ('+pDocumentos+')) AND');
      SQL.Append(' (D.CODDOCUMENTO !=ALL (SELECT CODDOCUMENTO FROM LOTEXDOCUM ');
      SQL.Append('                                  WHERE FLGBAIXA IS NULL OR FLGBAIXA = ''N'')) AND ');
      SQL.Append(' (U.SALDO >0  ) AND');
      SQL.Append(' (U.CODDOCUMENTO = D.CODDOCUMENTO)');
      SQL.Append(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NODOCUMENTO');
      Open;
    end;        
  end else begin
    with SQLDocRec do
    begin
      SQL.Clear;
      SQL.Append('SELECT');
      SQL.Append('  ''S'' AS SELECIONA,');
      SQL.Append('  ''N'' AS BAIXAPARCIAL,');
      SQL.Append('  0 AS VALORPAGO,');
      SQL.Append('  0 as VALORPAGOOOTRMOE,');
      SQL.Append('  U.SALDO,');
      SQL.Append('  U.SALDO1,');
      SQL.Append('  D.IDFORCLI,');
      SQL.Append('  D.OPERACAO,');
      SQL.Append('  D.IDPESSOA,');
      SQL.Append('  D.CODDOCUMENTO,');
      SQL.Append('  D.NODOCUMENTO,');
      SQL.Append('  D.COMPLDOCUMENTO,');
      SQL.Append('  D.DATAPROGRAMADA,');
      SQL.Append('  D.DATAVENCTO,');
      SQL.Append('  D.RECPAG,');
      SQL.Append('  P.NOME,');
      SQL.Append('  D.STATUS,');
      SQL.Append('  D.MOECODIGO,');
      SQL.Append('  D.PLANO,');
      SQL.Append('  D.PLACONTA,');
      SQL.Append('  D.CODCENTROCUSTO,');
      SQL.Append('  D.CODSUBCONTA,');
      SQL.Append('  D.CODGRUPOCNAB,');
      SQL.Append('  D.NOSSONUMERO,');
      SQL.Append('  L.NUMLANCTO,');
      SQL.Append('  L.VLRLIQUIDO,');
      SQL.Append('  DECODE(L.DEBCRE,''C'',''D'',''C'') AS DEBCRE,');
      SQL.Append('  L.VALOROUTRAMOEDA,');
      SQL.Append('  0 AS IMPRET,');
      SQL.Append('  0 AS IMP,');
      SQL.Append('  0 AS DIF,');
      SQL.Append('  D.IDMODULO,');
      SQL.Append('  D.CODTIPDOC');
      SQL.Append(', ''                                        ''  AS PLANOPREV ');
      SQL.Append('FROM');
      SQL.Append('  DOCUMENTO D,');
      SQL.Append('  PESSOA P,');
      SQL.Append('  LANCTODOCUM L,');
      SQL.Append('  (SELECT L.CODDOCUMENTO,');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ');
      SQL.Append('   FROM LANCTODOCUM L, DOCUMENTO D');
      SQL.Append('   WHERE D.CODDOCUMENTO IN ('+pDocumentos+') AND');
      SQL.Append('         D.CODDOCUMENTO = L.CODDOCUMENTO AND');
      SQL.Append('         D.RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('         D.STATUS <> ''2''');
      SQL.Append('   GROUP BY L.CODDOCUMENTO) U ');
      SQL.Append('WHERE');
      SQL.Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ' ) AND');
      SQL.Append('  D.CODTIPDOC IN');
      SQL.Append('       (SELECT CODTIPDOC');
      SQL.Append('        FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND NOT EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario));
      SQL.Append('                                )');
      SQL.Append('        UNION');
      SQL.Append('        SELECT CODTIPDOC FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      A.CODTIPDOC = B.CODTIPDOC AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.iDUsuario) + ')) AND ');
      SQL.Append(' (D.OPERACAO = L.OPERACAO) AND');
      SQL.Append(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
      SQL.Append(' (L.ESTORNO IS NULL) AND');
      SQL.Append(' (D.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)+ ') AND');
      SQL.Append(' (D.STATUS = ''0'' OR D.STATUS=''1'' OR (D.STATUS IS NULL)) AND');
      SQL.Append(' (RTrim(D.OPERACAO) IN (''1'',''2'',''3'')) AND');
      SQL.Append(' (D.IDFORCLI = P.IDPESSOA) AND');
      SQL.Append(' (D.CODDOCUMENTO IN ('+pDocumentos+')) AND');
      SQL.Append(' (D.CODDOCUMENTO !=ALL (SELECT CODDOCUMENTO FROM LOTEXDOCUM ');
      SQL.Append('                                  WHERE FLGBAIXA IS NULL OR FLGBAIXA = ''N'')) AND ');
      SQL.Append(' (U.SALDO > 0  ) AND');
      SQL.Append(' (U.CODDOCUMENTO = D.CODDOCUMENTO)');
      SQL.Append(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NODOCUMENTO');
      Open;
    end;
  end;
  AdicionaPlanosPrevidenciarios;
end;

procedure TfrmRecebeContribEmptmo.AbreQryPlanoxDocum(pDocumento: String);
var
  sSQL: string;
begin
  with qryPlanoxDocum do begin
    Close;
    Sql.Clear();
    Sql.Add('SELECT DISTINCT PC.NOME ' +
            '  FROM PLANPREV PP, PLANPREVCONTABIL PC, RATEIODOCUM R ' +
            ' WHERE PP.IDPLANOPREV = PC.IDPLANOPREVPREV AND ' +
            '       PC.IDPLANOPREV = R.IDPLANOPREV AND ' +
            '       R.CODDOCUMENTO =  ' + (pDocumento)  +
            ' UNION ' +
            'SELECT DISTINCT PC.NOME ' +
            '  FROM PLANPREVCONTABIL PC, RATEIODOCUM R ' +
            ' WHERE IDPLANOPREVPREV IS NULL AND ' +
            '       PC.IDPLANOPREV = R.IDPLANOPREV AND ' +
            '       R.CODDOCUMENTO = ' + (pDocumento));
    Open;
  end;
end;

end.
