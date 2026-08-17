{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelMapaCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, DBCtrls, wwdblook, fcCombo, fcColorCombo, Mask, wwdbedit,
  Wwdbspin, Db, Wwdatsrc, DBClient, uCMClientDataSet, Machklb, uCmSqlParams,
  uCtrlMoeda, uComunsImobiliarioDB, uCtrlMapaCota, Grids, DBGrids, fPreview,
  ppModule, raCodMod, ppBands, ppClass, ppCtrls, ppVar, ppMemo, ppStrtch,
  ppRegion, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ComCtrls, ppSubRpt, CheckLst, TREdit;

type
  TcfgRelMapaCota = class(TcfgRel)
    grpReferencia: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    grpTipoSegmento: TGroupBox;
    rbGerencial: TRadioButton;
    rbSPC: TRadioButton;
    cbAlienacaoRenda: TCheckBox;
    cbExibirResumo: TCheckBox;
    cbExibirTIRAtuarial: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    grpPlano: TGroupBox;
    Panel2: TPanel;
    Bevel1: TBevel;
    btnTodos: TSpeedButton;
    btnNenhum: TSpeedButton;
    grpIndiceCorrecao: TGroupBox;
    dblkpIndiceCorrecao: TwwDBLookupCombo;
    grpIndiceAtuarial: TGroupBox;
    Image2: TImage;
    Label1: TLabel;
    dblkpIndiceAtuarial: TwwDBLookupCombo;
    cdsIndice: TCMClientDataSet;
    cdsIndiceMOESIGLA: TStringField;
    cdsIndiceMOECODIGO: TFloatField;
    cdsIndiceMOEDESC: TStringField;
    cdsIndiceMOEPERIODICIDADE: TStringField;
    cdsIndiceFLGPERCVALOR: TStringField;
    dtsIndice: TwwDataSource;
    cdsPatrosPlanos: TCMClientDataSet;
    sqlPatrosPlanos: TCMSqlParams;
    cdsMapa: TCMClientDataSet;
    cdsFluxo: TCMClientDataSet;
    dtsMapa: TDataSource;
    pplnMapa: TppDBPipeline;
    dbpplnppField1: TppField;
    dbpplnppField2: TppField;
    dbpplnppField3: TppField;
    dbpplnppField4: TppField;
    dbpplnppField5: TppField;
    dbpplnppField6: TppField;
    dbpplnppField7: TppField;
    dbpplnppField8: TppField;
    dbpplnppField9: TppField;
    dbpplnppField10: TppField;
    dbpplnppField11: TppField;
    dbpplnppField12: TppField;
    dbpplnppField13: TppField;
    dbpplnppField14: TppField;
    dbpplnppField15: TppField;
    dbpplnppField16: TppField;
    dbpplnppField17: TppField;
    dbpplnppField18: TppField;
    dbpplnppField19: TppField;
    dbpplnppField20: TppField;
    dbpplnppField21: TppField;
    dbpplnppField22: TppField;
    dbpplnppField23: TppField;
    dbpplnppField24: TppField;
    dbpplnppField25: TppField;
    dbpplnppField26: TppField;
    dbpplnppField27: TppField;
    dbpplnppField28: TppField;
    dbpplnppField29: TppField;
    dbpplnppField30: TppField;
    dbpplnppField31: TppField;
    dbpplnppField32: TppField;
    dbpplnppField33: TppField;
    dbpplnppField34: TppField;
    dbpplnppField35: TppField;
    rptMapa: TppReport;
    Panel1: TPanel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    dsFluxo: TDataSource;
    pplnFluxo: TppDBPipeline;
    CMSqlParams1: TCMSqlParams;
    CMSqlParams2: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    pplblEmpresa: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLogoTipo: TppImage;
    rgParam: TppRegion;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    pplblCompetencia: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    pplblTipoSegmento: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    pplblAlienacaoRenda: TppLabel;
    ppLabel16: TppLabel;
    ppMemPatroPlano: TppMemo;
    ppDetailBand1: TppDetailBand;
    ppsCor: TppShape;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppdbtxtRentAtuAno: TppDBText;
    dbTxtRentMesNominal: TppDBText;
    ppDBText9: TppDBText;
    ppdbtxtRentAtuMes: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppNomeAtivo: TppDBText;
    ppsrFluxo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel11: TppLabel;
    ppLabel15: TppLabel;
    ppLabel18: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppDBText23: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    pplblSistema: TppLabel;
    ppLine3: TppLine;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShape9: TppShape;
    ppLabel9: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppdbtxtRentAtuMesTotFinal: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppdbtxtRentAtuAnoTotFinal: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    pplblRentAtuMes: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    pplblRentAtuAno: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel2: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLabel17: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppdbtxtRentAtuMesTot: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppdbtxtRentAtuAnoTot: TppDBText;
    ppShape8: TppShape;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppHeaderBand2: TppHeaderBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine7: TppLine;
    ppLabel32: TppLabel;
    ppDBText28: TppDBText;
    ppShape10: TppShape;
    ppLabel33: TppLabel;
    ppLine8: TppLine;
    ppLabel34: TppLabel;
    ppLine9: TppLine;
    lstPlano: TCheckListBox;
    ppLabel35: TppLabel;
    ppLine10: TppLine;
    ppLabel36: TppLabel;
    ppDBText29: TppDBText;
    edtPerAtuarial: TDBRealEdit;
    cdsFluxoSeg: TCMClientDataSet;
    dsFluxoSeg: TDataSource;
    ppLabel37: TppLabel;
    pplLabelAtu: TppLabel;
    pplIndReal: TppLabel;
    pplIndAtu: TppLabel;
    rptResumo: TppReport;
    ppTitleBand2: TppTitleBand;
    lblEmpresaResumo: TppLabel;
    ppLabel38: TppLabel;
    ppLine11: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    pplblCompetenciaTot: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    pplblTipoSegmentoTot: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLine12: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    pplblRentAtuMesTot1: TppLabel;
    ppLabel50: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppShape11: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    pplblRentAtuAnoTot1: TppLabel;
    ppLogotipoResumo: TppImage;
    ppLabel51: TppLabel;
    pplblAlienacaoRendaTot: TppLabel;
    ppMemPatroPlanoTot: TppMemo;
    ppHeaderBand3: TppHeaderBand;
    ppLabel52: TppLabel;
    ppLine13: TppLine;
    ppLabel53: TppLabel;
    ppLine14: TppLine;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    pplblRentAtuMesTot2: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    pplblRentAtuAnoTot2: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    pplSistemaResumo: TppLabel;
    ppLine15: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppShape23: TppShape;
    ppLabel73: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppdbtxtRentAtuMesTotalFinal: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppdbtxtRentAtuAnoTotalFinal: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape24: TppShape;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppdbtxtRentAtuMesTotal: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDbSegmento: TppDBText;
    ppdbtxtRentAtuAnoTotal: TppDBText;
    ppLabel74: TppLabel;
    pplLabelAtuTot: TppLabel;
    pplIndRealTot: TppLabel;
    pplIndAtuTot: TppLabel;
    ppsrFluxoSeg: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel43: TppLabel;
    ppDBText31: TppDBText;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppShape25: TppShape;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText39: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText46: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel44: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLine20: TppLine;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine21: TppLine;
    pplFluxoSeg: TppDBPipeline;
    bbtnBI: TBitBtn;
    cdsCotacaoMoeda: TCMClientDataSet;
    sqlCotacaoMoeda: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure ppsrFluxoPrint(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure ppsrFluxoSegPrint(Sender: TObject);
    procedure bbtnBIClick(Sender: TObject);
  private
    { Private declarations }

    CtrlMoeda           : TCtrlMoeda;
    CtrlMapaCota        : TCtrlMapaCota;
    ComunsImobiliarioDB : TComunsImobiliarioDB;

    procedure DesabilitaBotoes; override;
    procedure HabilitaBotoes;   override;

    function  VerificaPreenchimento: boolean;
    procedure PreparaImpressao;
    procedure Progresso (vParams: array of variant);

    function  ExisteCotacaoMoeda(iMoeda : Integer; dData : TDateTime) : Boolean;
  public
    { Public declarations }
    bCorLinha : boolean;
    CorLinha, CorAtual : TColor;
    vIDPlano : array of String;
    vNoPlano : array of String;
    sPatroPlano: String;

    procedure PreenchePlanos;
    function  PegaPlano: String;
  end;

var
  cfgRelMapaCota: TcfgRelMapaCota;

implementation

{$R *.DFM}

uses uDiasInUteis, dBaseDados, uSistema, uVerificaPreenchimento, uMensErro,
     FEspera, uModuloImobiliario, uComunsImobiliario;

{ TcfgRelMapaCota }


procedure TcfgRelMapaCota.FormCreate(Sender: TObject);
begin
   inherited;
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa,
                                                      Sistema.IDModulo,
                                                      Sistema.IDUsuario,
                                                      Sistema.IDEspAcesso,
                                                      Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   CtrlMoeda := TCtrlMoeda.Create;
   CtrlMoeda.InitializeAs( ComunsImobiliarioDB );

   CtrlMapaCota := TCtrlMapaCota.Create( Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario,
                                         Sistema.IdEspAcesso, Sistema.UsaPlanoPatro );
   CtrlMapaCota.InitializeAs( ComunsImobiliarioDB );

   cdsIndice.Data := CtrlMoeda.ListaMoeda( 0, False, True, 'P' );

   PreenchePlanos;

   CtrlMapaCota.cdsMapa     := cdsMapa;
   CtrlMapaCota.cdsFluxo    := cdsFluxo;
   CtrlMapaCota.cdsFluxoSeg := cdsFluxoSeg;
   CtrlMapaCota.Progresso   := Progresso;

   edtPerAtuarial.Value   := 6;
end;

procedure TcfgRelMapaCota.FormDestroy(Sender: TObject);
begin
   FreeAndNil( ComunsImobiliarioDB );
   FreeAndNil( CtrlMoeda );
   FreeAndNil( CtrlMapaCota );
   inherited;
end;

procedure TcfgRelMapaCota.FormShow(Sender: TObject);
begin
   inherited;
   cboMes.ItemIndex := DiasInUteis.ExtraiMes( Date ) - 1;
   DBspnAno.Value   := DiasInUteis.ExtraiAno( Date );
end;


function TcfgRelMapaCota.VerificaPreenchimento: boolean;
var
   dDtIniMes : TDateTime;
begin
  Result := False;
  try
    if cboMes.ItemIndex < 0 then
      raise EValidacao.CreateVal('É necessário indicar o mês.', cboMes);

    if ( DBspnAno.Value <= 0 ) or ( DBspnAno.Text = '' ) then
      raise EValidacao.CreateVal('É necessário indicar o ano.', DBspnAno);

    sPatroPlano := PegaPlano;
    if sPatroPlano = '' then
      raise EValidacao.CreateVal('É necessário selecionar pelo menos uma patrocinadora/plano.', lstPlano );

    // Marchetti - Pendencia 26230
    dDtIniMes := EncodeDate(Trunc(DBspnAno.Value),cboMes.ItemIndex+1,1);
    if not ExisteCotacaoMoeda(StrToInt(dblkpIndiceCorrecao.LookupValue), dDtIniMes)  then
      raise EValidacao.CreateVal('Não existe cotação para o índice de correção informado', dblkpIndiceCorrecao );
    // Fim Marchetti - Pendencia 26230

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



procedure TcfgRelMapaCota.bbtnConfirmarClick(Sender: TObject);
var iMesRec, iAnoRec, iSegmento : Integer;
begin
  inherited;
  if VerificaPreenchimento then begin
     DesabilitaBotoes;
     try
        try
           frmEspera.Config('Aguarde', 'Processando dados do relatório...', False);
           frmEspera.Show;
           Application.ProcessMessages;

           frmEspera.Hide;
           frmEspera.Config('', '', False);

           iMesRec := ( cboMes.ItemIndex + 1 );
           iAnoRec := StrToInt( IntToStr( ComunsImobiliario.Inteiro( DBspnAno.Value ) ) );
           if rbGerencial.Checked then
                iSegmento := 1
           else iSegmento := 2;

           CtrlMapaCota.CreateThreadProgresso;

           if not CtrlMapaCota.CalculaRentabilidade(CtrlMapaCota.ProgressFileName,
                                                    sPatroPlano,
                                                    iMesRec, iAnoRec, iSegmento,
                                                    Sistema.IdEmpresa,
                                                    ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                    ModuloImobiliario.InvestImob.iIdPaisCAF,
                                                    StrToInt(dblkpIndiceCorrecao.lookupValue),
                                                    StrToInt(dblkpIndiceAtuarial.LookupValue),
                                                    edtPerAtuarial.Value,
                                                    cbAlienacaoRenda.Checked, False ) then
              raise Exception.Create(CtrlMapaCota.MessageInfo);

           PreparaImpressao;

           if cbExibirResumo.Checked then
                TFrmPreview.CreateModalPreview(Application,
                                               rptResumo,
                                               rptResumo.PrinterSetup.DocumentName)
           else TFrmPreview.CreateModalPreview(Application,
                                               rptMapa,
                                               rptMapa.PrinterSetup.DocumentName);
           Repaint;
        except
           on E: Exception do begin
              MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
           end;
        end;
     finally
       HabilitaBotoes;
       CtrlMapaCota.FreeThreadProgresso;
     end;
  end;
end;


procedure TcfgRelMapaCota.bbtnBIClick(Sender: TObject);
var iMesRec, iAnoRec, iSegmento : Integer;
begin
  inherited;

  iMesRec := ( cboMes.ItemIndex + 1 );
  iAnoRec := StrToInt( IntToStr( ComunsImobiliario.Inteiro( DBspnAno.Value ) ) );

  if VerificaPreenchimento then begin

     if CtrlMapaCota.CalculoGravado(iMesRec, iAnoRec,
                                    StrToInt(dblkpIndiceCorrecao.lookupValue),
                                    StrToInt(dblkpIndiceAtuarial.LookupValue) ) then begin
        if MsgDlg('Já existe Rentabilidade registada para a competência selecionada, ' +#13+
                  'Deseja reprocessar a rentabilidade deste mês ? ', 'Aviso', mtWarning, [mbYes, mbNo],0) = mrNo then begin
           Exit;
        end;

        if not CtrlMapaCota.ExcluiRentabBI(iMesRec, iAnoRec,
                                           StrToInt(dblkpIndiceCorrecao.lookupValue),
                                           StrToInt(dblkpIndiceAtuarial.LookupValue) ) then
           raise Exception.Create(CtrlMapaCota.MessageInfo);                                           
     end;

     DesabilitaBotoes;
     try
        try
           frmEspera.Config('Aguarde', 'Processando dados de Rentabilidade...', False);
           frmEspera.Show;
           Application.ProcessMessages;

           frmEspera.Hide;
           frmEspera.Config('', '', False);

           if rbGerencial.Checked then
                iSegmento := 1
           else iSegmento := 2;

           CtrlMapaCota.CreateThreadProgresso;

           if not CtrlMapaCota.CalculaRentabilidade(CtrlMapaCota.ProgressFileName,
                                                    sPatroPlano,
                                                    iMesRec, iAnoRec, iSegmento,
                                                    Sistema.IdEmpresa,
                                                    ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                    ModuloImobiliario.InvestImob.iIdPaisCAF,
                                                    StrToInt(dblkpIndiceCorrecao.lookupValue),
                                                    StrToInt(dblkpIndiceAtuarial.LookupValue),
                                                    edtPerAtuarial.Value,
                                                    cbAlienacaoRenda.Checked, True ) then
              raise Exception.Create(CtrlMapaCota.MessageInfo);

           Repaint;

           MsgDlg('Rentabilidade registrada com sucesso!','Informação',mtInformation, [mbOk],0);
        except
           on E: Exception do begin
              MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
           end;
        end;
     finally
       HabilitaBotoes;
       CtrlMapaCota.FreeThreadProgresso;
     end;
  end;
end;


procedure TcfgRelMapaCota.ppsCorPrint(Sender: TObject);
begin
   inherited;
   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;
end;


procedure TcfgRelMapaCota.PreparaImpressao;
var i : integer;
begin
    // Carrega o Logotipo
    if ModuloImobiliario.InvestImob.bFlgLogoRelat then
         ppLogotipo.Picture := ModuloImobiliario.InvestImob.LogoTipo.Picture
    else ppLogotipo.Picture := nil;
    ppLblEmpresa.Text := Sistema.NomeEmpresa;
    ppLblSistema.Text := Sistema.NomeModulo;

    //Cabeçalho do relatório
    pplblCompetencia.Text := cboMes.Text + ' / ' + DBspnAno.Text;

    if rbGerencial.Checked then
         pplblTipoSegmento.Text := 'Gerencial'
    else pplblTipoSegmento.Text := 'SPC';

    if cbAlienacaoRenda.Checked then
         pplblAlienacaoRenda.Text := '* Considerando alienação como Renda.'
    else pplblAlienacaoRenda.Text := '';

    ppMemPatroPlano.Lines.Clear;
    for i := 0 to (lstPlano.Items.Count - 1) do
    begin
       if lstPlano.Checked[i] then
          ppMemPatroPlano.Lines.Add( vNoPlano[i]);
    end;

    pplIndReal.Caption := dblkpIndiceCorrecao.Text;
    pplIndAtu.Caption  := dblkpIndiceAtuarial.Text + ' + ' + FormatFloat('##,#',edtPerAtuarial.Value) + ' % aa' ;

    pplblCompetenciaTot.Text    := pplblCompetencia.Text;
    pplblTipoSegmentoTot.Text   := pplblTipoSegmento.Text;
    ppMemPatroPlanoTot.Lines    := ppMemPatroPlano.Lines;
    pplblAlienacaoRendaTot.Text := pplblAlienacaoRenda.Text;
    pplIndRealTot.Text          := pplIndReal.Text;
    pplIndAtuTot.Text           := pplIndAtu.Text;
    pplSistemaResumo.Text       := pplblSistema.Text;
    lblEmpresaResumo.Text       := pplblEmpresa.Text;
    ppLogotipoResumo.Picture    := ppLogoTipo.Picture;

    // Habilita Rentabilidade Atuarial
    pplblRentAtuMes.Visible             := cbExibirTIRAtuarial.Checked;
    pplblRentAtuAno.Visible             := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuMes.Visible           := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuAno.Visible           := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuMesTot.Visible        := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuAnoTot.Visible        := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuMesTotFinal.Visible   := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuAnoTotFinal.Visible   := cbExibirTIRAtuarial.Checked;
    pplIndAtu.Visible                   := cbExibirTIRAtuarial.Checked;
    pplLabelAtu.Visible                 := cbExibirTIRAtuarial.Checked;

    pplblRentAtuMesTot1.Visible         := cbExibirTIRAtuarial.Checked;
    pplblRentAtuAnoTot1.Visible         := cbExibirTIRAtuarial.Checked;
    pplblRentAtuMesTot2.Visible         := cbExibirTIRAtuarial.Checked;
    pplblRentAtuAnoTot2.Visible         := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuMesTotal.Visible      := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuAnoTotal.Visible      := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuMesTotalFinal.Visible := cbExibirTIRAtuarial.Checked;
    ppdbtxtRentAtuAnoTotalFinal.Visible := cbExibirTIRAtuarial.Checked;
    pplIndAtuTot.Visible                := cbExibirTIRAtuarial.Checked;
    pplLabelAtuTot.Visible              := cbExibirTIRAtuarial.Checked;


    // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
    bCorlinha  := chkCorLinha.Checked;
    CorLinha   := cboCorLinha.SelectedColor;
end;

procedure TcfgRelMapaCota.Progresso(vParams: array of variant);
begin
   if vParams[1] = -1 then begin
      if vParams[3] <> '' then begin
         frmEspera.Hide;
         frmEspera.Config('Aguarde', vParams[3], False);
         frmEspera.Show;
      end;
      lblProgress.Visible   := False;
      ProgressBar.Visible   := False;
   end else begin
      frmEspera.Hide;
      lblProgress.Visible   := True;
      lblProgress.Caption   := vParams[3];
      ProgressBar.Visible   := True;
      ProgressBar.Position  := vParams[1];
      ProgressBar.Max       := vParams[2];
      Repaint;
   end;
   Application.ProcessMessages;
end;

procedure TcfgRelMapaCota.ppsrFluxoPrint(Sender: TObject);
begin
  inherited;
  cdsFluxo.Filtered := False;
  cdsFluxo.Filter   := 'IDIMOVELMESTRE = ' + cdsMapa.FieldByName('IDIMOVEL').AsString + ' AND ' +
                       'IDSEGMENTO = ' + QuotedStr(cdsMapa.FieldByName('IDSEGMENTO').AsString) + ' AND ' +
                       'ORIGEM   = ' + cdsMapa.FieldByName('ORIGEM').AsString;
  cdsFluxo.Filtered := True;
end;

procedure TcfgRelMapaCota.ppsrFluxoSegPrint(Sender: TObject);
begin
  inherited;
  cdsFluxoSeg.Filtered := False;
  cdsFluxoSeg.Filter   := 'IDSEGMENTO = ' + QuotedStr(cdsMapa.FieldByName('IDSEGMENTO').AsString) + ' AND ' +
                          'ORIGEM   = ' + cdsMapa.FieldByName('ORIGEM').AsString;
  cdsFluxoSeg.Filtered := True;
end;

procedure TcfgRelMapaCota.btnTodosClick(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;

procedure TcfgRelMapaCota.btnNenhumClick(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;

procedure TcfgRelMapaCota.PreenchePlanos;
var i : Integer;
begin
   // Inicializa o vetor
   i := 0;
   SetLength(vIDPlano, i);
   SetLength(vNoPlano, i);

   sqlPatrosPlanos.Open;
   lstPlano.Items.Clear;
   while not cdsPatrosPlanos.Eof do begin
      lstPlano.Items.Add(cdsPatrosPlanos.FieldByName('NOMEPATRO').AsString + ' - ' +
                         cdsPatrosPlanos.FieldByName('NOMEPLANO').AsString);

      inc(i);
      SetLength(vIDPlano, i);
      vIDPlano[i-1] := QuotedStr(cdsPatrosPlanos.FieldByName('IDPATRO').AsString + '/' +
                                 cdsPatrosPlanos.FieldByName('IDPLANOPREV').AsString);
      SetLength(vNoPlano, i);
      vNoPlano[i-1] := cdsPatrosPlanos.FieldByName('NOMEPATRO').AsString + ' - ' +
                       cdsPatrosPlanos.FieldByName('NOMEPLANO').AsString;

      cdsPatrosPlanos.Next;
   end;
end;

function TcfgRelMapaCota.PegaPlano : String;
var i        : Integer;
    sPlanos  : String;
begin
   inherited;
   sPlanos := '';

   // concatena a String de Planos
   for i := 0 to (lstPlano.Items.Count - 1) do
   begin
      if lstPlano.Checked[i] then
      begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + vIDPlano[i];
      end;
   end;
   Result := sPlanos;
end;



procedure TcfgRelMapaCota.DesabilitaBotoes;
begin
  inherited;
  bbtnBI.Enabled := False;
end;

procedure TcfgRelMapaCota.HabilitaBotoes;
begin
  inherited;
  bbtnBI.Enabled := True;
end;



function TcfgRelMapaCota.ExisteCotacaoMoeda(iMoeda: Integer; dData: TDateTime): Boolean;
var
   sSQL : String;
begin
   sSQL := 'SELECT * FROM COTACAOMOEDA WHERE MOECODIGO = ' + IntToStr(iMoeda) + ' AND COTDATA = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData));
   cdsCotacaoMoeda.Close;
   sqlCotacaoMoeda.SQL.Text := sSQL;
   sqlCotacaoMoeda.Open;

   Result := not cdsCotacaoMoeda.IsEmpty;
end;



end.
