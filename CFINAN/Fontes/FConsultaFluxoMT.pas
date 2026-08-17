unit FConsultaFluxoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Grids, ComCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Mask, wwdbedit, Wwdbspin, wwdblook, DBClient, uCMClientDataSet,
  uCtrlParamIntegra, uCtrlListTercFinanc, uCtrlFluxoCaixa, uGeralFinanc,
  uCtrlParamFinanc, Wwdbigrd, Wwdbgrid, DBTables, Wwquery, DBGrids;

type
  TfrmConsultaFluxoMT = class(TfrmSairAjuda)
    bbtnMostrarFluxo: TBitBtn;
    rbtnImprimir: TBitBtn;
    Panel2: TPanel;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    rgDSM: TRadioGroup;
    gbGrauMaximo: TGroupBox;
    lblCAR: TLabel;
    lblCAP: TLabel;
    seGrauMaxCAP: TwwDBSpinEdit;
    seGrauMaxCAR: TwwDBSpinEdit;
    gbDatas: TGroupBox;
    lbla: TLabel;
    deDatIni: TCMDateTimePicker;
    deDatFim: TCMDateTimePicker;
    rgCML: TRadioGroup;
    rgQuebra: TRadioGroup;
    rgAnaSint: TRadioGroup;
    cbZerado: TCheckBox;
    dblcPlanoPrev: TwwDBLookupCombo;
    cbExibeSabDom: TCheckBox;
    edFatorDivisaoMoeda: TRealEdit;
    dblcPatrocinador: TwwDBLookupCombo;
    dblcCentroCusto: TwwDBLookupCombo;
    pnlInformacoesFluxo: TPanel;
    trkbLarguraTitulo: TTrackBar;
    sgFluxo: TStringGrid;
    pplImpRetrato: TppBDEPipeline;
    pplImpppField1: TppField;
    pplImpppField2: TppField;
    pplImpppField3: TppField;
    pplImpppField4: TppField;
    pplImpppField5: TppField;
    pplImpppField6: TppField;
    pplImpppField7: TppField;
    pplImpppField8: TppField;
    pplImpppField9: TppField;
    pplImpppField10: TppField;
    pplImpppField11: TppField;
    pplImpppField12: TppField;
    pplImpppField13: TppField;
    pplImpppField14: TppField;
    pplImpppField15: TppField;
    pplImpppField16: TppField;
    rpImpRetrato: TppReport;
    HeaderBand1: TppHeaderBand;
    pplblTitulo: TppLabel;
    Line1: TppLine;
    pplblEmpresa: TppLabel;
    pplblRecSemPrev: TppLabel;
    pplblRecComPrev: TppLabel;
    pplblPagSemPrev: TppLabel;
    pplblPagComPrev: TppLabel;
    ppLabelData1: TppLabel;
    ppLabelData4: TppLabel;
    ppLabelData5: TppLabel;
    ppLabelData2: TppLabel;
    ppLabelData3: TppLabel;
    ppLine2: TppLine;
    ppshpPgtoSemPrev: TppShape;
    ppshpRecSemPrev: TppShape;
    ppshpPgtoComPrev: TppShape;
    ppshpRecComPrev: TppShape;
    pplblNomeRelat: TppLabel;
    BandaDetalhe: TppDetailBand;
    ppDBTextLinhaFluxo: TppDBText;
    ppLineSeparacao: TppLine;
    ppDBTextValor5: TppDBText;
    ppDBTextValor1: TppDBText;
    ppDBTextValor3: TppDBText;
    ppDBTextValor2: TppDBText;
    ppDBTextValor4: TppDBText;
    FooterBand1: TppFooterBand;
    Calc2: TppSystemVariable;
    ppLblSistema: TppLabel;
    Line2: TppLine;
    Calc1: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    dsImp: TwwDataSource;
    sgFluxoAux: TStringGrid;
    cdsCentroCusto: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    pnlLegenda: TPanel;
    shpRecSemPrev: TShape;
    lblCorAzul: TLabel;
    shpPgtoSemPrev: TShape;
    lblCorVermelha: TLabel;
    lblCorRosa: TLabel;
    shpPgtoComPrev: TShape;
    lblCorVerde: TLabel;
    shpRecComPrev: TShape;
    pnlProgresso: TPanel;
    prgBarAtuFluxo: TProgressBar;
    prgBarExibicao: TProgressBar;
    cdsImp: TCMClientDataSet;
    cdsColunasFluxo: TCMClientDataSet;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    cdsNumTerTRD: TCMClientDataSet;
    cdsNumTerTDOC: TCMClientDataSet;
    cdsLinhasFluxo: TCMClientDataSet;
    pplblFiltro: TppLabel;
    ppImpPaisagem: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppField16: TppField;
    rpImpPaisagem: TppReport;
    ppHeaderBand1: TppHeaderBand;
    pplblTituloPaisagem: TppLabel;
    ppLine1: TppLine;
    pplblEmpresaPaisagem: TppLabel;
    pplblRecSemPrevPaisag: TppLabel;
    pplblRecComPrevPaisag: TppLabel;
    pplblPagSemPrevPaisag: TppLabel;
    pplblPagComPrevPaisag: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppshpPgtoSemPrevPaisag: TppShape;
    ppshpRecSemPrevPaisag: TppShape;
    ppshpPgtoComPrevPaisag: TppShape;
    ppshpRecComPrevPaisag: TppShape;
    ppLabel12: TppLabel;
    pplblFiltroPaisagem: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppLine4: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLblSistemaPaisagem: TppLabel;
    ppLine5: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    cbExibeColTotal: TCheckBox;
    cbExibeColAtrasados: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcFiltrosChange(Sender: TObject);
    procedure deDatasCloseUp(Sender: TObject);
    procedure rgAnaSintClick(Sender: TObject);
    procedure seGrauMaxCARChange(Sender: TObject);
    procedure seGrauMaxCAPChange(Sender: TObject);
    procedure rgQuebraClick(Sender: TObject);
    procedure rgDSMClick(Sender: TObject);
    procedure cbExibeSabDomClick(Sender: TObject);
    procedure cbZeradoClick(Sender: TObject);
    procedure trkbLarguraTituloChange(Sender: TObject);
    procedure bbtnMostrarFluxoClick(Sender: TObject);
    procedure sgFluxoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgFluxoDblClick(Sender: TObject);
    procedure gbDatasExit(Sender: TObject);
    procedure rgCMLClick(Sender: TObject);
    procedure edFatorDivisaoMoedaExit(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure ppLblSistemaPrint(Sender: TObject);
    procedure ppDBTextValorPrint(Sender: TObject);
    procedure ppLabelDataPrint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppDBTextLinhaFluxoPrint(Sender: TObject);
    procedure cbExibeColTotalClick(Sender: TObject);
    procedure cbExibeColAtrasadosClick(Sender: TObject);
  private
    { Private declarations }
    CtrlListTerceiros : TCtrlListTercFinanc;
    CtrlFluxoCaixa    : TCtrlFluxoCaixa;
    GeralFinanc       : TGeralFinanc;
    CtrlParamFinanc   : TCtrlParamFinanc;
    Arq               : TextFile;

    sFluxo          : String;
    sTipoFluxo      : String;
    sMascaraCAR     : String;
    sMascaraCAP     : String;
    dDataMin        : TDateTime;
    dDataMax        : TDateTime;
    bMostrouFluxo   : Boolean;
    bExpandeCol     : Boolean;
    bDesVermelho    : Boolean;
    bSubSaldo       : Boolean;
    iEspacoBase     : Integer;
    CoresColunas    : TStringList;
    CoresColunaTit  : TStringList;
    CoresDados      : TStringList;
    sCorRecComPrev  : String;
    sCorRecSemPrev  : String;
    sCorPgtoComPrev : String;
    sCorPgtoSemPrev : String;
    sOrientaPapel   : String;
    ParametrosFluxo : TParamFluxo;

    procedure ExibeColunasFluxo;
    procedure ExibeTituloLinhas(bGeraLinhas: Boolean);
    procedure ExibeDadosFluxo(iColuna: Integer);
    procedure ExibeDadosColunaTotal;
    procedure AssociaCor(aCores: TStringList; iColuna, iLinha: Integer;
      sCor: String);
    procedure LimpaCelulas(iColunaInicial, iColunaFinal, iLinhaInicial,
      iLinhaFinal: Integer);
    function ExtraiCor(aCores: TStringList; iColuna,
      iLinha: Integer): TColor;
    function BuscaNumTermos(rCodTipDoc: Double; sCodTipRecDes, sRecPag: String;
                            rUnidNeg: Double; sCRespon,sCCusto: String): Double;
    procedure AplicaFator;
    procedure BandaDetalheBeforePrint(Sender: TObject);
    procedure CarregaCdsImpressao;
    function RetornaEstilo(Cor: Double): TFontStyles;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; sTipoFluxo: String); reintroduce;

  end;

var
  frmConsultaFluxoMT: TfrmConsultaFluxoMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FPreview, Math, uFuncaoGeral,
     FFormaImpConsFluxoMT;

constructor TfrmConsultaFluxoMT.Create(AOwner: TComponent;
  sTipoFluxo: String);
begin
   Self.sTipoFluxo:=sTipoFluxo;
   inherited Create(AOwner);
end;

procedure TfrmConsultaFluxoMT.FormCreate(Sender: TObject);
var
   sData  : String;
   dDataI : TDateTime;
   dDataF : TDateTime;
begin
   inherited;

   sFluxo:='';
   dDataMin:=0;
   dDataMax:=0;
   iEspacoBase:=0;
   CoresColunas:=TStringList.Create;
   CoresColunaTit:=TStringList.Create;
   CoresDados:=TStringList.Create;
   bMostrouFluxo:=False;
   bSubSaldo:=False;
   bDesVermelho:=True;

   //Associa Cores aos Shapes da Legenda
   shpRecComPrev.Brush.Color:=clTeal;
   shpRecSemPrev.Brush.Color:=clBlue;
   shpPgtoComPrev.Brush.Color:=clFuchsia;
   shpPgtoSemPrev.Brush.Color:=clMaroon;

   //Associa Cores aos Shapes da Legenda do Relatório
   ppshpRecComPrev.Brush.Color:=shpRecComPrev.Brush.Color;
   ppshpRecSemPrev.Brush.Color:=shpRecSemPrev.Brush.Color;
   ppshpPgtoComPrev.Brush.Color:=shpPgtoComPrev.Brush.Color;
   ppshpPgtoSemPrev.Brush.Color:=shpPgtoSemPrev.Brush.Color;

   //Associa Cores as variáveis de cor de Legenda 
   sCorRecComPrev:=ColorToString(shpRecComPrev.Brush.Color);
   sCorRecSemPrev:=ColorToString(shpRecSemPrev.Brush.Color);
   sCorPgtoComPrev:=ColorToString(shpPgtoComPrev.Brush.Color);
   sCorPgtoSemPrev:=ColorToString(shpPgtoSemPrev.Brush.Color);

   //Inicializa CtrlFluxoCaixa
   CtrlFluxoCaixa:=TCtrlFluxoCaixa.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                          Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlFluxoCaixa.Initialize(dtmBaseDados.dbBaseDados,True);

   //Habilita/Desabilita Componentes conforme Fluxo escolhido
   pnlLegenda.Visible:=(sTipoFluxo='P');
   cbExibeColAtrasados.Enabled:=(sTipoFluxo='P');
   rgCML.Enabled:=(sTipoFluxo='O') or (sTipoFluxo='OXR');
   rgDSM.Enabled:=(sTipoFluxo<>'OXR');
   cbExibeSabDom.Enabled:=(sTipoFluxo<>'OXR');
   cbExibeColTotal.Enabled:=(sTipoFluxo<>'OXR');


   //Verifica qual tipo de Fluxo corrente
   sData:='DATAPROGRAMADA';
   sFluxo:='FluxoPrevisto';

   with TCMClientDataSet.Create(Self) do
   try
      Data:=CtrlFluxoCaixa.ListDatasMinMax(sFluxo,sData);
      dDataI:=FieldByName('DATAINIC').AsDateTime;
      dDataF:=FieldByName('DATAFIM').AsDateTime;
   finally
      Free;
   end;

   if (sTipoFluxo='P') then
    begin
       deDatIni.Date:=dDataI+1;
       if ((dDataI+1)>dDataF) then dDataF:=dDataI+1;
       deDatFim.Date:=dDataF;
       Caption:='Consulta Fluxo de Caixa Previsto';
       pplblNomeRelat.Caption:='Fluxo de Caixa Previsto';
       HelpContext:=90044;
       bbtnAjuda.HelpContext:=90044;
    end;

   if (sTipoFluxo='R') then
    begin
       sData:='DATACFLOAT';
       sFluxo:='FluxoReal';
       deDatIni.Date:=Date-31;
       deDatFim.Date:=Date-1;
       Caption:='Consulta Fluxo de Caixa Realizado';
       pplblNomeRelat.Caption:='Fluxo de Caixa Realizado';
       HelpContext:=90045;
       bbtnAjuda.HelpContext:=90045;
    end;
    
   if (sTipoFluxo='O') then
    begin
       sFluxo:='FluxoOrcado';
       deDatIni.Date:=dDataI+1;
       if ((dDataI+1)>dDataF) then dDataF:=dDataI+1;
       deDatFim.Date:=dDataF;
       Caption:='Consulta Fluxo de Caixa Orçado';
       pplblNomeRelat.Caption:='Fluxo de Caixa Orçado';
       HelpContext:=90046;
       bbtnAjuda.HelpContext:=90046;
    end;

   if (sTipoFluxo='OXR') then
    begin
       deDatIni.Date:=Date-31;
       deDatFim.Date:=Date-1;
       Caption:='Consulta Fluxo de Caixa Orçado x Realizado';
       pplblNomeRelat.Caption:='Consulta Fluxo de Caixa Orçado x Realizado';
    end;

   dDataMin:=deDatIni.Date;
   dDataMax:=deDatFim.Date;

   pnlInformacoesFluxo.Caption:='Período Consultado: '+deDatIni.Text+' a '+deDatFim.Text;
   pplblTitulo.Caption:=pnlInformacoesFluxo.Caption;
   pplblTituloPaisagem.Caption:=pplblTitulo.Caption;

   //Gera Graus Máximos
   sMascaraCAR:=ParamIntegra.MascaraReceb;
   seGrauMaxCAR.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   sMascaraCAP:=ParamIntegra.MascaraDesemb;
   seGrauMaxCAP.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);
   //Carrega Parâmetros do Sistema
   with TCMClientDataSet.Create(Self) do
   try
      Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
      bExpandeCol:=(FieldByName('FLGEXIBECOLEXP').AsString='S');
   finally
      Free;
   end;

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);
   
   //Carrega cdsUnidNeg
   if (sTipoFluxo<>'OXR') then
      cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegxFluxo(Sistema.IdEmpresa,sFluxo)
   else
      cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegxFluxoComp(Sistema.IdEmpresa,
                                                               'FluxoOrcado',
                                                               'FluxoReal');
   //Carrega cdsCentroRespon
   if (sTipoFluxo<>'OXR') then
      cdsCentroRespon.Data:=CtrlListTerceiros.ListCentroResponxFluxo(Sistema.IdEmpresa,sFluxo)
   else
      cdsCentroRespon.Data:=CtrlListTerceiros.ListCentroResponxFluxoComp(Sistema.IdEmpresa,
                                                                         'FluxoOrcado',
                                                                         'FluxoReal');
   //Carrega cdsCentroCusto
   if (sTipoFluxo<>'OXR') then
      cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCustoxFluxo(Sistema.IdEmpresa,sFluxo)
   else
      cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCustoxFluxoComp(Sistema.IdEmpresa,
                                                                       'FluxoOrcado',
                                                                       'FluxoReal');
   //Carrega cdsPlanoPrev
   cdsPlanoPrev.Data:=CtrlListTerceiros.ListPlanoPrev;

   //Carrega cdsPatrocinador
   cdsPatrocinador.Data:=CtrlListTerceiros.ListPatrocinador;

   //Inicializa Parametros do Fluxo
   ParametrosFluxo.dDataInicial:=deDatIni.Date;
   ParametrosFluxo.dDataFinal:=deDatFim.Date;
   ParametrosFluxo.dDataMin:=dDataMin;
   ParametrosFluxo.dDataMax:=dDataMax;
   ParametrosFluxo.dDataInicFluxo:=dDataMin;
   ParametrosFluxo.dDataFinalFluxo:=dDataMax;
   ParametrosFluxo.rUnidNeg:=0;
   ParametrosFluxo.sCentroResp:='';
   ParametrosFluxo.sCentroCusto:='';
   ParametrosFluxo.rIDPlanoPrev:=0;
   ParametrosFluxo.rIDPatro:=0;
   ParametrosFluxo.sQuebra:='';
   ParametrosFluxo.Legenda.sCorRecComPrev:=sCorRecComPrev;
   ParametrosFluxo.Legenda.sCorRecSemPrev:=sCorRecSemPrev;
   ParametrosFluxo.Legenda.sCorPgtoComPrev:=sCorPgtoComPrev;
   ParametrosFluxo.Legenda.sCorPgtoSemPrev:=sCorPgtoSemPrev;
   ParametrosFluxo.sTipoFluxo:=sTipoFluxo;
   ParametrosFluxo.sPrazo:='C';
   ParametrosFluxo.bFlxComparativo:=(sTipoFluxo='OXR');

   //Exibe as Colunas do Fluxo
   ExibeColunasFluxo;

   //Exibe Título das linhas do Fluxo
   ExibeTituloLinhas(True);

   edFatorDivisaoMoeda.Value:=1;
end;

procedure TfrmConsultaFluxoMT.FormShow(Sender: TObject);
begin
   inherited;
   WindowState:=wsMaximized;
end;

procedure TfrmConsultaFluxoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlListTerceiros.Free;
   CtrlFluxoCaixa.Free;
   GeralFinanc.Free;
   CtrlParamFinanc.Free;
   CoresColunas.Free;
   CoresColunaTit.Free;
   CoresDados.Free;
   inherited;
   Action:=caFree;
end;

procedure TfrmConsultaFluxoMT.dblcFiltrosChange(Sender: TObject);
begin
   try
      if Trim(dblcUnidNegoc.Text)<>'' then
         ParametrosFluxo.rUnidNeg:=StrToFloat(dblcUnidNegoc.LookupValue)
      else
         ParametrosFluxo.rUnidNeg:=0;
   except
      ParametrosFluxo.rUnidNeg:=0;
   end;

   if Trim(dblcCentroRespon.Text)<>'' then
      ParametrosFluxo.sCentroResp:=dblcCentroRespon.LookupValue
   else
      ParametrosFluxo.sCentroResp:='';

   if Trim(dblcCentroCusto.Text)<>'' then
      ParametrosFluxo.sCentroCusto:=dblcCentroCusto.LookupValue
   else
      ParametrosFluxo.sCentroCusto:='';

   if Trim(dblcPlanoPrev.Text)<>'' then
      ParametrosFluxo.rIDPlanoPrev:=StrToFloat(dblcPlanoPrev.LookupValue)
   else
      ParametrosFluxo.rIDPlanoPrev:=0;

   if Trim(dblcPatrocinador.Text)<>'' then
      ParametrosFluxo.rIDPatro:=StrToFloat(dblcPatrocinador.LookupValue)
   else
      ParametrosFluxo.rIDPatro:=0;

   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxoMT.edFatorDivisaoMoedaExit(Sender: TObject);
begin
   if (edFatorDivisaoMoeda.Value=0) and (ActiveControl<>bbtnSair) then
    begin
       MsgDlg('O Fator de divisão não pode ser zero ou vazio.','Erro',mtError,[mbOK],0);
       edFatorDivisaoMoeda.SetFocus;
       Exit;
    end;
   if bMostrouFluxo then AplicaFator;
   dblcUnidNegoc.SetFocus;
end;

procedure TfrmConsultaFluxoMT.deDatasCloseUp(Sender: TObject);
begin
   if (sTipoFluxo='P') then
    begin
       if (deDatIni.Date<dDataMin) then
        begin
           deDatIni.Date:=dDataMin;
           deDatIni.SetFocus;
        end;
       if (deDatFim.Date>dDataMax) then
        begin
           deDatFim.Date:=dDataMax;
           deDatFim.SetFocus;
        end;
    end;

   bSubSaldo:=(deDatIni.Date<>dDataMin);

   if not(cbExibeColAtrasados.Checked) then ParametrosFluxo.dDataInicFluxo:=deDatIni.Date;
   ParametrosFluxo.dDataFinalFluxo:=deDatFim.Date;
end;

procedure TfrmConsultaFluxoMT.gbDatasExit(Sender: TObject);
begin
   if not(cbExibeColAtrasados.Checked) then ParametrosFluxo.dDataInicFluxo:=deDatIni.Date;
   ParametrosFluxo.dDataFinalFluxo:=deDatFim.Date;

   pnlInformacoesFluxo.Caption:='Período Consultado: '+deDatIni.Text+' a '+deDatFim.Text;
   pplblTitulo.Caption:=pnlInformacoesFluxo.Caption;
   pplblTituloPaisagem.Caption:=pplblTitulo.Caption;

   ExibeTituloLinhas(True);
   ExibeColunasFluxo;
end;

procedure TfrmConsultaFluxoMT.rgAnaSintClick(Sender: TObject);
begin
   gbGrauMaximo.Enabled:=(rgAnaSint.ItemIndex=0);

   if not(gbGrauMaximo.Enabled) then
    begin
       seGrauMaxCAR.Value:=1;
       seGrauMaxCAP.Value:=1;
    end;

   ExibeTituloLinhas(False);
end;

procedure TfrmConsultaFluxoMT.seGrauMaxCARChange(Sender: TObject);
begin
   ExibeTituloLinhas(False);
end;

procedure TfrmConsultaFluxoMT.seGrauMaxCAPChange(Sender: TObject);
begin
   ExibeTituloLinhas(False);
end;

procedure TfrmConsultaFluxoMT.rgQuebraClick(Sender: TObject);
begin
   iEspacoBase:=4;
   case rgQuebra.ItemIndex of
      0: begin
            ParametrosFluxo.sQuebra:='';
            iEspacoBase:=0
         end;
      1: ParametrosFluxo.sQuebra:='UN';
      2: ParametrosFluxo.sQuebra:='CR';
      3: ParametrosFluxo.sQuebra:='CC';
   end;

   //Remove possíveis Índices
   cdsLinhasFluxo.IndexName:='';
   while (cdsLinhasFluxo.IndexDefs.Count>0) do cdsLinhasFluxo.IndexDefs.Delete(0);

   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxoMT.rgCMLClick(Sender: TObject);
begin
   case rgCML.ItemIndex of
      0: ParametrosFluxo.sPrazo:='C';
      1: ParametrosFluxo.sPrazo:='M';
      2: ParametrosFluxo.sPrazo:='L';
   end;
   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxoMT.rgDSMClick(Sender: TObject);
begin
   if (ActiveControl<>cbExibeSabDom) then cbExibeSabDom.Enabled:=(rgDSM.ItemIndex=0);
   ExibeColunasFluxo;
end;

procedure TfrmConsultaFluxoMT.cbZeradoClick(Sender: TObject);
begin
   ExibeTituloLinhas(False);
end;

procedure TfrmConsultaFluxoMT.cbExibeSabDomClick(Sender: TObject);
begin
   if (ActiveControl<>cbExibeSabDom) then cbExibeSabDom.Enabled:=(rgDSM.ItemIndex=0);
   ExibeColunasFluxo;
end;

procedure TfrmConsultaFluxoMT.cbExibeColTotalClick(Sender: TObject);
begin
   ExibeColunasFluxo;
end;

procedure TfrmConsultaFluxoMT.cbExibeColAtrasadosClick(Sender: TObject);
begin
   if (cbExibeColAtrasados.Checked) then
    begin
       ParametrosFluxo.dDataInicFluxo:=dDataMin-1;
       ParametrosFluxo.dDataFinalFluxo:=deDatFim.Date;
    end
   else
    begin
       deDatIni.Date:=dDataMin;
       ParametrosFluxo.dDataInicFluxo:=dDataMin;
       ParametrosFluxo.dDataFinalFluxo:=deDatFim.Date;
    end;

   ExibeTituloLinhas(True);
   ExibeColunasFluxo;
end;

procedure TfrmConsultaFluxoMT.trkbLarguraTituloChange(Sender: TObject);
begin
   sgFluxo.ColWidths[0]:=200+Trunc((350*trkbLarguraTitulo.Position)/trkbLarguraTitulo.Max);
end;

procedure TfrmConsultaFluxoMT.sgFluxoDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   Cor             : TColor;
   bColunaSabDom   : Boolean;
   iLinhaCor       : Integer;
   iPosicaoInicial : Integer;
begin
   if (ACol>0) then
    begin
       if (ARow=0) or (ARow=1) then
          Cor:=ExtraiCor(CoresColunas,ACol,ARow)
       else
          Cor:=ExtraiCor(CoresDados,ACol,ARow);

       bColunaSabDom:=(ExtraiCor(CoresColunas,ACol,1)=clRed);
       if bColunaSabDom then
          if (ARow>1) then
             sgFluxo.Canvas.Brush.Color:=$00B9FFFF
          else
             if (ARow=1) then Cor:=clRed;

       //Testa se valor é negativo. Caso seja,
       //Muda a cor para Vermelho.
       if (Pos('(',sgFluxo.Cells[Acol,ARow])<>0) and (bDesVermelho) and (Cor=clBlack) then
          Cor:=clRed;

       sgFluxo.Canvas.Font.Color:=Cor;

       iPosicaoInicial:=Rect.Right-sgFluxo.Canvas.TextWidth(sgFluxo.Cells[ACol,ARow])-2;
       if (iPosicaoInicial<Rect.Left) then iPosicaoInicial:=Rect.Left;

       sgFluxo.Canvas.FillRect(Rect);
       if (ARow=0) or (ARow=1) then
          sgFluxo.Canvas.TextOut(Rect.Left,rect.Top,sgFluxo.Cells[ACol,ARow])
       else
          sgFluxo.Canvas.TextOut(iPosicaoInicial,rect.Top,sgFluxo.Cells[ACol,ARow]);
    end
   else
    begin
       Cor:=ExtraiCor(CoresColunaTit,ACol,ARow);
       sgFluxo.Canvas.Font.Color:=Cor;
       sgFluxo.Canvas.TextOut(Rect.Left,rect.Top,sgFluxo.Cells[ACol,ARow])
    end;
end;

procedure TfrmConsultaFluxoMT.sgFluxoDblClick(Sender: TObject);
var
   col:Integer;
begin
   inherited;
   col:=sgFluxo.Col;
   if sgFluxo.ColWidths[col] = 120 then
      sgFluxo.ColWidths[col]:=15
   else
      sgFluxo.ColWidths[col]:=120;
end;

procedure TfrmConsultaFluxoMT.bbtnMostrarFluxoClick(Sender: TObject);
var
   iColuna       : Integer;
   rUnidNeg      : Double;
   rIDPatro      : Double;
   rIDPlanoPrev  : Double;
   sCentroResp   : String;
   sCentroCusto  : String;
   sPrazo        : String;
   rSaldoAux     : Double;
   ParamAux      : TParamFluxo;
begin
   rSaldoAux:=0;
   CoresDados.Clear;

   //Limpa Colunas de dados
   LimpaCelulas(1,0,2,0);

   iColuna:=1;

   prgBarAtuFluxo.Max:=cdsColunasFluxo.RecordCount;
   if cbExibeColAtrasados.Checked then prgBarAtuFluxo.Max:=prgBarAtuFluxo.Max+1;
   if cbExibeColTotal.Checked then prgBarAtuFluxo.Max:=prgBarAtuFluxo.Max+1;

   prgBarAtuFluxo.Position:=0;
   prgBarExibicao.Position:=0;
   pnlProgresso.BringToFront;

   //Exibe Coluna de atrasados
   cdsColunasFluxo.First;
   if cbExibeColAtrasados.Checked then
    begin
       ParamAux.dDataInicial:=dDataMin-1;
       ParamAux.dDataFinal:=dDataMin-1;
       ParamAux.dDataInicFluxo:=ParametrosFluxo.dDataInicFluxo;
       ParamAux.dDataFinalFluxo:=ParametrosFluxo.dDataFinalFluxo;
       ParamAux.dDataMin:=ParametrosFluxo.dDataMin;
       ParamAux.dDataMax:=ParametrosFluxo.dDataMax;
       ParamAux.Legenda:=ParametrosFluxo.Legenda;
       ParamAux.rUnidNeg:=ParametrosFluxo.rUnidNeg;
       ParamAux.sCentroResp:=ParametrosFluxo.sCentroResp;
       ParamAux.sCentroCusto:=ParametrosFluxo.sCentroCusto;
       ParamAux.rIDPlanoPrev:=ParametrosFluxo.rIDPlanoPrev;
       ParamAux.rIDPatro:=ParametrosFluxo.rIDPatro;
       ParamAux.sQuebra:=ParametrosFluxo.sQuebra;
       ParamAux.Legenda:=ParametrosFluxo.Legenda;
       ParamAux.sTipoFluxo:=ParametrosFluxo.sTipoFluxo;
       ParamAux.sPrazo:=ParametrosFluxo.sPrazo;
       ParamAux.bFlxComparativo:=ParametrosFluxo.bFlxComparativo;

       //Gera Linhas da Coluna de atrasados
       cdsLinhasFluxo.Data:=CtrlFluxoCaixa.GeraLinhasFluxo(ParamAux,True,-0.000001);
       ExibeDadosFluxo(iColuna);
       sgFluxo.Refresh;

       prgBarAtuFluxo.StepIt;
       
       iColuna:=2;
    end;

   cdsColunasFluxo.First;
   while not(cdsColunasFluxo.Eof) do
   begin
      cdsLinhasFluxo.Close;

      ParametrosFluxo.dDataInicial:=cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime;
      ParametrosFluxo.dDataFinal:=cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime;
      ParametrosFluxo.sTipoFluxo:=cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString;

      cdsLinhasFluxo.Data:=CtrlFluxoCaixa.GeraLinhasFluxo(ParametrosFluxo,True,rSaldoAux);

      //Restaura valor do tipo de fluxo - útil no fluxo comparativo orçado x real
      ParametrosFluxo.sTipoFluxo:=sTipoFluxo;

      //Atualiza Saldo Inicial = Saldo a Transportar
      if (sTipoFluxo<>'OXR') then
       begin
          cdsLinhasFluxo.Last;
          rSaldoAux:=cdsLinhasFluxo.FieldByName('TOTAL').AsFloat;
       end
      else
       rSaldoAux:=0;

      ExibeDadosFluxo(iColuna);
      Inc(iColuna);
      prgBarAtuFluxo.StepIt;
      sgFluxo.Refresh;
      
      cdsColunasFluxo.Next;
   end;

   prgBarAtuFluxo.Position:=0;
   prgBarExibicao.Position:=0;

   pnlProgresso.SendToBack;

   if cbExibeColTotal.Checked then
    begin
       ExibeDadosColunaTotal;
       prgBarAtuFluxo.StepIt;
    end;
end;

procedure TfrmConsultaFluxoMT.ExibeColunasFluxo;
var
   iColuna        : Integer;
   iColunaInicial : Integer;
   iColunaFinal   : Integer;
   iLinha         : Integer;
   sAgrupa        : String;
begin
   //Carrega Colunas do Fluxo
   cdsColunasFluxo.Close;

   case rgDSM.ItemIndex of
      0: sAgrupa:='D';
      1: sAgrupa:='S';
      2: sAgrupa:='M';
   end;

   if (sTipoFluxo<>'OXR') then
       cdsColunasFluxo.Data:=CtrlFluxoCaixa.GeraColunasFluxo(deDatIni.Date,deDatFim.Date,
                                                       sAgrupa,sTipoFluxo,cbExibeSabDom.Checked)
   else
       cdsColunasFluxo.Data:=CtrlFluxoCaixa.GeraColunasFluxo(StrToDate('01/01/2002'),
                                                             StrToDate('02/01/2002'),
                                                             'D','O',True);

   if (cdsColunasFluxo.RecordCount<1) then
      sgFluxo.ColCount:=2
   else
      sgFluxo.ColCount:=cdsColunasFluxo.RecordCount+1;

   //Ajusta número de colunas do grid auxiliar
   sgFluxoAux.ColCount:=sgFluxo.ColCount-1;

   iColunaInicial:=1;
   iColunaFinal:=sgFluxo.ColCount-1;
   CoresColunas.Clear;

   LimpaCelulas(1,0,0,0);

   //Inclui Coluna de Atrasados
   if cbExibeColAtrasados.Checked then
    begin
       iColunaInicial:=2;
       Inc(iColunaFinal);
       sgFluxo.ColCount:=sgFluxo.ColCount+1;
       sgFluxoAux.ColCount:=sgFluxoAux.ColCount+1;
       if bExpandeCol then
          sgFluxo.ColWidths[1]:=120
       else
          sgFluxo.ColWidths[1]:=15;
       sgFluxo.Cells[1,0]:=' Atrasados ';
       sgFluxo.Cells[1,1]:='';
    end;

   //Inlcui Coluna de Total
   if cbExibeColTotal.Checked then
    begin
       sgFluxo.ColCount:=sgFluxo.ColCount+1;
       sgFluxoAux.ColCount:=sgFluxoAux.ColCount+1;
       if bExpandeCol then
          sgFluxo.ColWidths[sgFluxo.ColCount-1]:=120
       else
          sgFluxo.ColWidths[sgFluxo.ColCount-1]:=15;
       sgFluxo.Cells[sgFluxo.ColCount-1,0]:=' TOTAL';
       sgFluxo.Cells[sgFluxo.ColCount-1,1]:='';
    end;
    
   LimpaCelulas(1,0,2,0);

   sgFluxo.Visible:=False;

   //Corrige colunas para Fluxo comparativo Orçado x Realizado
   cdsColunasFluxo.First;
   if (sTipoFluxo='OXR') then
    begin
       cdsColunasFluxo.Edit;
       cdsColunasFluxo.FieldByName('DataInicial').AsDateTime:=deDatIni.Date;
       cdsColunasFluxo.FieldByName('DataFinal').AsDateTime:=deDatFim.Date;
       cdsColunasFluxo.FieldByName('Titulo').AsString:=' Orçado';
       cdsColunasFluxo.FieldByName('SubTitulo').AsString:=FormatDateTime('dd/mm',deDatIni.Date)+
                                                ' - '+FormatDateTime('dd/mm',deDatFim.Date);
       cdsColunasFluxo.Post;
       cdsColunasFluxo.Next;
       cdsColunasFluxo.Edit;
       cdsColunasFluxo.FieldByName('DataInicial').AsDateTime:=deDatIni.Date;
       cdsColunasFluxo.FieldByName('DataFinal').AsDateTime:=deDatFim.Date;
       cdsColunasFluxo.FieldByName('Titulo').AsString:=' Realizado';
       cdsColunasFluxo.FieldByName('SubTitulo').AsString:=FormatDateTime('dd/mm',deDatIni.Date)+
                                                ' - '+FormatDateTime('dd/mm',deDatFim.Date);
       cdsColunasFluxo.FieldByName('TipoFluxo').AsString:='R';
       cdsColunasFluxo.Post;
    end;

   cdsColunasFluxo.First;
   for iColuna:=iColunaInicial to iColunaFinal do
   begin
      if bExpandeCol then
         sgFluxo.ColWidths[iColuna]:=120
      else
         sgFluxo.ColWidths[iColuna]:=15;

      if (cdsColunasFluxo.FieldByName('SABDOM').AsString='S') then
          AssociaCor(CoresColunas,iColuna,1,'clRed');

      sgFluxo.Cells[iColuna,0]:=' '+cdsColunasFluxo.FieldByName('TITULO').AsString;
      sgFluxo.Cells[iColuna,1]:=' '+cdsColunasFluxo.FieldByName('SUBTITULO').AsString;
      cdsColunasFluxo.Next;
   end;
   sgFluxo.Visible:=True;
end;

procedure TfrmConsultaFluxoMT.ExibeTituloLinhas(bGeraLinhas: Boolean);
var
   sQuebraAnterior : String;
begin
   //Inicializa Cores

   CoresColunaTit.Clear;

   if bGeraLinhas then
    begin
       //Carrega Linhas
       cdsLinhasFluxo.Close;
       cdsLinhasFluxo.Data:=CtrlFluxoCaixa.GeraLinhasFluxo(ParametrosFluxo,False,0);
    end;

   sgFluxo.RowCount:=2;
   sgFluxo.ColWidths[0]:=200;
   sQuebraAnterior:='';

   cdsLinhasFluxo.First;
   while not(cdsLinhasFluxo.Eof) do
   begin
      //Exibe a Unidade, Centro de Responsabilidade ou o Centro de Custo da Quebra Corrente
      if (cdsLinhasFluxo.FieldByName('TIPOCALCULO').AsString<>'X') then
         case rgQuebra.ItemIndex of
            1: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('UnidNegoc').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('UnidNegoc').AsString;
                   AssociaCor(CoresColunaTit,0,sgFluxo.RowCount,'clNavy');
                   sgFluxo.RowCount:=sgFluxo.RowCount+1;
                   sgFluxo.Cells[0,sgFluxo.RowCount-1]:='->'+
                           cdsLinhasFluxo.FieldByName('UnidadeNeg').AsString;
                end;
            2: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('CodCentroRespon').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('CodCentroRespon').AsString;
                   AssociaCor(CoresColunaTit,0,sgFluxo.RowCount,'clNavy');
                   sgFluxo.RowCount:=sgFluxo.RowCount+1;
                   sgFluxo.Cells[0,sgFluxo.RowCount-1]:='->'+
                           cdsLinhasFluxo.FieldByName('Nome').AsString;
                end;
            3: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('CodCentroCusto').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('CodCentroCusto').AsString;
                   AssociaCor(CoresColunaTit,0,sgFluxo.RowCount,'clNavy');
                   sgFluxo.RowCount:=sgFluxo.RowCount+1;
                   sgFluxo.Cells[0,sgFluxo.RowCount-1]:='->'+
                           cdsLinhasFluxo.FieldByName('Nome').AsString;
                end;
         end;

      if (cdsLinhasFluxo.FieldByName('LinhaTotal').AsString='#') or
         (cdsLinhasFluxo.FieldByName('TipoCalculo').AsString='T') or
         (cdsLinhasFluxo.FieldByName('TIPOCALCULO').AsString='X') then
       begin
          sgFluxo.RowCount:=sgFluxo.RowCount+1;
          if (cdsLinhasFluxo.FieldByName('TIPOCALCULO').AsString='X') then
             sgFluxo.Cells[0,sgFluxo.RowCount-1]:=cdsLinhasFluxo.FieldByName('LinhaFluxo').AsString
          else
             sgFluxo.Cells[0,sgFluxo.RowCount-1]:=GeralFinanc.Replicate(' ',iEspacoBase)+
                                     cdsLinhasFluxo.FieldByName('LinhaFluxo').AsString;
       end
      else
       begin
          //Filtra Registros pelo Grau (Fluxo Analítico)
          if (((FuncaoGeral.CalcNumEleGrau(sMascaraCAR,Trunc(seGrauMaxCAR.Value))>=
               cdsLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (cdsLinhasFluxo.FieldByName('RECPAG').AsString='R'))  or
             ((FuncaoGeral.CalcNumEleGrau(sMascaraCAP,Trunc(seGrauMaxCAP.Value))>=
               cdsLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (cdsLinhasFluxo.FieldByName('RECPAG').AsString='P')) or
             ((cdsLinhasFluxo.FieldByName('TipoCalculo').AsString='C') or
              (cdsLinhasFluxo.FieldByName('TipoCalculo').AsString='D'))) and
             (rgAnaSint.ItemIndex=0) then
              begin
                 if (cbZerado.Checked) or
                    (not(cbZerado.Checked) and
                     (cdsLinhasFluxo.FieldByName('NumTermos').AsFloat>0)) then
                  begin
                     sgFluxo.RowCount:=sgFluxo.RowCount+1;
                     sgFluxo.Cells[0,sgFluxo.RowCount-1]:=
                     GeralFinanc.Replicate(' ',cdsLinhasFluxo.FieldByName('NumCarCodTRD').AsInteger+
                                           iEspacoBase)+
                                           cdsLinhasFluxo.FieldByName('LinhaFluxo').AsString;
                  end;
              end;
          end;

      cdsLinhasFluxo.Next;
   end;

  //Ajusta número de linhas do grid auxiliar
  sgFluxoAux.RowCount:=sgFluxo.RowCount-2;

  //Limpa Valores do Fluxo
  LimpaCelulas(1,0,2,0);

  if (sgFluxo.RowCount>2) then sgFluxo.FixedRows:=2;

  sgFluxo.Col:=1;
  sgFluxo.Row:=2;
end;

procedure TfrmConsultaFluxoMT.LimpaCelulas(iColunaInicial, iColunaFinal,
  iLinhaInicial, iLinhaFinal: Integer);
var
   iColuna : Integer;
   iLinha  : Integer;
begin
   if (iColunaFinal=0) then iColunaFinal:=sgFluxo.ColCount-1;
   if (iLinhaFinal=0) then iLinhaFinal:=sgFluxo.RowCount-1;

   for iColuna:=iColunaInicial to iColunaFinal do
       for iLinha:=iLinhaInicial to iLinhaFinal do
       begin
          sgFluxo.Cells[iColuna,iLinha]:='';
          if ((iColuna-1)>0) and ((iLinha-2)>1) then sgFluxoAux.Cells[iColuna-1,iLinha-2]:='';
       end;
end;

procedure TfrmConsultaFluxoMT.AssociaCor(aCores: TStringList; iColuna, iLinha: Integer; sCor: String);
var
   iPosicao : Integer;
begin
   iPosicao:=aCores.IndexOf(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   if iPosicao<>-1 then aCores.Delete(iPosicao);
   aCores.Add(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   aCores.Add(sCor);
end;

function TfrmConsultaFluxoMT.ExtraiCor(aCores: TStringList; iColuna,iLinha: Integer): TColor;
var
   sCor          : String;
   iPosicao      : Integer;
begin
   //Cada 2 Linhas do TStringList de Cores, correspondem os seguintes formatos:
   // col,lin:
   // COR
   Result:=clBlack;
   iPosicao:=aCores.IndexOf(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   if (iPosicao<>-1) then
    begin
       sCor:=Trim(aCores.Strings[iPosicao+1]);
       Result:=StringToColor(sCor);
       if sCor='clRed' then Result:=clRed;
       if sCor='clNavy' then Result:=clNavy;
       if sCor='clMaroon' then Result:=clMaroon;
    end;
end;

function TfrmConsultaFluxoMT.BuscaNumTermos(rCodTipDoc: Double;
  sCodTipRecDes, sRecPag: String; rUnidNeg: Double; sCRespon,
  sCCusto: String): Double;
begin
   Result:=0;
   if (rCodTipDoc<>0) then
    begin
       case rgQuebra.ItemIndex of
          0: begin
                if cdsNumTerTDOC.Locate('CodTipDoc;RecPag',VarArrayOf([rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=cdsNumTerTDOC.FieldByName('NaoZerados').AsFloat;
             end;
          1: begin
                if cdsNumTerTDOC.Locate('UnidNegoc;CodTipDoc;RecPag',
                                           VarArrayOf([rUnidNeg,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=cdsNumTerTDOC.FieldByName('NaoZerados').AsFloat;
             end;
          2: begin
                if cdsNumTerTDOC.Locate('CodCentroRespon;CodTipDoc;RecPag',
                                           VarArrayOf([sCRespon,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=cdsNumTerTDOC.FieldByName('NaoZerados').AsFloat;
             end;
          3: begin
                if cdsNumTerTDOC.Locate('CodCentroCusto;CodTipDoc;RecPag',
                                           VarArrayOf([sCCusto,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=cdsNumTerTDOC.FieldByName('NaoZerados').AsFloat;
             end;
       end;
    end;

   if (sCodTipRecDes<>'') then
    begin
       case rgQuebra.ItemIndex of
          0: begin
                if cdsNumTerTRD.Locate('CodTipRecDes;RecPag',VarArrayOf([Trim(sCodTipRecDes),sRecPag]),
                                          [loCaseInsensitive]) then
                   Result:=cdsNumTerTRD.FieldByName('NaoZerados').AsFloat;
             end;
          1: begin
                if cdsNumTerTRD.Locate('UnidNegoc;CodTipRecDes;RecPag',
                                           VarArrayOf([rUnidNeg,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=cdsNumTerTRD.FieldByName('NaoZerados').AsFloat;
             end;
          2: begin
                if cdsNumTerTRD.Locate('CodCentroRespon;CodTipRecDes;RecPag',
                                           VarArrayOf([sCRespon,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=cdsNumTerTRD.FieldByName('NaoZerados').AsFloat;
             end;
          3: begin
                if cdsNumTerTRD.Locate('CodCentroCusto;CodTipRecDes;RecPag',
                                           VarArrayOf([sCCusto,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=cdsNumTerTRD.FieldByName('NaoZerados').AsFloat;
             end;
       end;
    end;
end;

procedure TfrmConsultaFluxoMT.ExibeDadosFluxo(iColuna: Integer);
var
   iLinha            : Integer;
   rValorAux         : Double;
   sQuebraAnterior   : String;
begin
   iLinha:=1;

   sQuebraAnterior:='';       

   prgBarExibicao.Position:=0;
   prgBarExibicao.Max:=cdsLinhasFluxo.RecordCount;

   cdsLinhasFluxo.First;
   while not(cdsLinhasFluxo.Eof) do
   begin
      //Verifica se mudou de faixa de quebra
      //Caso tenha mudado, salta uma linha
      //pois a primeira linha de cada faixa não contém valor
      if (cdsLinhasFluxo.FieldByName('TIPOCALCULO').AsString<>'X') then
         case rgQuebra.ItemIndex of
            1: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('UnidadeNeg').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('UnidadeNeg').AsString;
                   Inc(iLinha);
                end;
            2: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('CodCentroRespon').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('CodCentroRespon').AsString;
                   Inc(iLinha);
                end;
            3: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('CodCentroCusto').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('CodCentroCusto').AsString;
                   Inc(iLinha);
                end;
         end;

      //Testa se a linha Corrente é uma linha de título
      if (cdsLinhasFluxo.FieldByName('TipoCalculo').AsString='T') then
       begin
          cdsLinhasFluxo.Next;
          Inc(iLinha);
          Continue;
       end;

      rValorAux:=cdsLinhasFluxo.FieldByName('TOTAL').AsFloat;

      //Acumula valor de linhas do tipo Acumulativas
      if (cdsLinhasFluxo.FieldByName('FLGACUMULA').AsString='S') and (iColuna>1) and
         (sTipoFluxo<>'OXR') then
         rValorAux:=rValorAux+StrToFloat(GeralFinanc.SubstSimbMonet(sgFluxoAux.Cells[iColuna-2,iLinha-2]));

      if (cdsLinhasFluxo.FieldByName('LinhaTotal').AsString='#') or
         (cdsLinhasFluxo.FieldByName('TIPOCALCULO').AsString='X') then
       begin
          //Armazena valor para futura restauração, após uso de fator de divisão
          Inc(iLinha);
          sgFluxoAux.Cells[iColuna-1,iLinha-2]:=FormatFloat('#,##0.00;(#,##0.00)',rValorAux);

          //Aplica Fator de divisão
          if (edFatorDivisaoMoeda.Value<>1) then
              sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',
                                                        (rValorAux/edFatorDivisaoMoeda.Value))
          else
              sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',rValorAux);

          if rValorAux<>0 then
             AssociaCor(CoresDados,iColuna,iLinha,cdsLinhasFluxo.FieldByName('CORCAMPO').AsString);
       end
      else
       begin
          //Filtra Registros pelo Grau (Fluxo Analítico)
          if (((FuncaoGeral.CalcNumEleGrau(sMascaraCAR,Trunc(seGrauMaxCAR.Value))>=
               cdsLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (cdsLinhasFluxo.FieldByName('RECPAG').AsString='R'))  or
             ((FuncaoGeral.CalcNumEleGrau(sMascaraCAP,Trunc(seGrauMaxCAP.Value))>=
               cdsLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (cdsLinhasFluxo.FieldByName('RECPAG').AsString='P')) or
             ((cdsLinhasFluxo.FieldByName('TipoCalculo').AsString='C') or
              (cdsLinhasFluxo.FieldByName('TipoCalculo').AsString='D'))) and
             (rgAnaSint.ItemIndex=0) then
              begin
                 if (cbZerado.Checked) or (not(cbZerado.Checked) and
                    (cdsLinhasFluxo.FieldByName('NumTermos').AsFloat>0)) then
                  begin
                     Inc(iLinha);
                     //Armazena valor para futura restauração após uso de fator de divisão
                     sgFluxoAux.Cells[iColuna-1,iLinha-2]:=FormatFloat('#,##0.00;(#,##0.00)',rValorAux);

                     //Aplica Fator de divisão
                     if edFatorDivisaoMoeda.Value<>1 then
                        sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',
                                                             (rValorAux/edFatorDivisaoMoeda.Value))
                     else
                        sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',rValorAux);

                     if rValorAux<>0 then
                        AssociaCor(CoresDados,iColuna,iLinha,cdsLinhasFluxo.FieldByName('CORCAMPO').AsString);
                  end;
              end;
          end;
      cdsLinhasFluxo.Next;
      prgBarExibicao.StepIt;
   end;
   bMostrouFluxo:=True;
end;

procedure TfrmConsultaFluxoMT.ExibeDadosColunaTotal;
var
   iX,iY        : Integer;
   rTotal       : Double;
   bLinhaTitulo : Boolean;
   iXInicial    : Integer;
begin
   if cbExibeColAtrasados.Checked then
    begin
       iXInicial:=1;
       sgFluxo.Cells[sgFluxo.ColCount-1,2]:=sgFluxo.Cells[2,2];
       sgFluxoAux.Cells[sgFluxoAux.ColCount-1,0]:=sgFluxoAux.Cells[1,0];
    end
   else
    begin
       iXInicial:=0;
       sgFluxo.Cells[sgFluxo.ColCount-1,2]:=sgFluxo.Cells[1,2];
       sgFluxoAux.Cells[sgFluxoAux.ColCount-1,0]:=sgFluxoAux.Cells[0,0];
    end;

   sgFluxo.Cells[sgFluxo.ColCount-1,sgFluxo.RowCount-1]:=sgFluxo.Cells[sgFluxo.ColCount-2,
                                                                       sgFluxo.RowCount-1];
   sgFluxoAux.Cells[sgFluxoAux.ColCount-1,sgFluxoAux.RowCount-1]:=sgFluxoAux.Cells[sgFluxoAux.ColCount-2,
                                                                                   sgFluxoAux.RowCount-1];
   for iY:=1 to sgFluxoAux.RowCount-2 do
   begin
      rTotal:=0;
      bLinhaTitulo:=True;
      for iX:=iXInicial to sgFluxoAux.ColCount-2 do
      begin
          if (Trim(sgFluxoAux.Cells[iX,iY])<>'') then bLinhaTitulo:=False;
          rTotal:=rTotal+StrToFloat(GeralFinanc.SubstSimbMonet(sgFluxoAux.Cells[iX,iY]));
      end;

      if not(bLinhaTitulo) then
       begin
          sgFluxoAux.Cells[sgFluxoAux.ColCount-1,iY]:=FormatFloat('#,##0.00;(#,##0.00)',rTotal);
          sgFluxo.Cells[sgFluxo.ColCount-1,iY+2]:=FormatFloat('#,##0.00;(#,##0.00)',rTotal);
       end;
   end;
end;

procedure TfrmConsultaFluxoMT.AplicaFator;
var
   iX,iY : Integer;
begin
   for iX:=1 to sgFluxo.ColCount do
      for iY:=2 to sgFluxo.RowCount do
         if (Trim(sgFluxoAux.Cells[iX-1,iY-2])<>'') then
            sgFluxo.Cells[iX,iY]:=FormatFloat('#,##0.00;(#,##0.00)',
                    (StrToFloat(GeralFinanc.SubstSimbMonet(sgFluxoAux.Cells[iX-1,iY-2]))/
                                            edFatorDivisaoMoeda.Value));
end;


//==============================================================================
// Rotinas de Impressão
//==============================================================================

procedure TfrmConsultaFluxoMT.rbtnImprimirClick(Sender: TObject);
var
   sFiltroAux : String;
begin
   //Abre cdsImp (vazio)
   cdsImp.Close;

   sOrientaPapel:='RETRATO';
   with TfrmFormaImpConsFluxoMT.Create(Self) do
   try
      ShowModal;
      case rgOrientacao.ItemIndex of
         0: sOrientaPapel:='RETRATO';  //Retrato
         1: sOrientaPapel:='PAISAGEM'; //Paisagem
      end;
      cdsImp.Data:=CtrlFluxoCaixa.ListDadosImpressao(sOrientaPapel);
   finally
      Free;
   end;

   //Montagem da Exibição dos Filtros usados no Relatório
   sFiltroAux:='';
   if (Trim(dblcUnidNegoc.Text)<>'') then sFiltroAux:=Trim(dblcUnidNegoc.Text);

   if (Trim(dblcCentroRespon.Text )<>'') then
      if (Trim(sFiltroAux)<>'') then
         sFiltroAux:=sFiltroAux+' - '+Trim(dblcCentroRespon.Text)
      else
         sFiltroAux:=Trim(dblcCentroRespon.Text);

   if (Trim(dblcCentroCusto.Text )<>'') then
      if (Trim(sFiltroAux)<>'') then
         sFiltroAux:=sFiltroAux+' - '+Trim(dblcCentroCusto.Text)
      else
         sFiltroAux:=Trim(dblcCentroCusto.Text);

   if (Trim(dblcPlanoPrev.Text )<>'') then
      if (Trim(sFiltroAux)<>'') then
         sFiltroAux:=sFiltroAux+' - '+Trim(dblcPlanoPrev.Text)
      else
         sFiltroAux:=Trim(dblcPlanoPrev.Text);

   if (Trim(dblcPatrocinador.Text )<>'') then
      if (Trim(sFiltroAux)<>'') then
         sFiltroAux:=sFiltroAux+' - '+Trim(dblcPatrocinador.Text)
      else
         sFiltroAux:=Trim(dblcPatrocinador.Text);

   if (edFatorDivisaoMoeda.Value<>1) then
      if (Trim(sFiltroAux)<>'') then
         sFiltroAux:=sFiltroAux+' - Fator Div.: '+FloatToStr(edFatorDivisaoMoeda.Value)
      else
         sFiltroAux:='   - Fator Div.: '+FloatToStr(edFatorDivisaoMoeda.Value);

   pplblFiltro.Caption:='Filtro: '+sFiltroAux;
   pplblFiltroPaisagem.Caption:=pplblFiltro.Caption;

   //Associa Nome da Empresa
   pplblEmpresa.Caption:=Sistema.NomeEmpresa;
   pplblEmpresaPaisagem.Caption:=pplblEmpresa.Caption;

   //Associa Título do Relatório
   if (sTipoFluxo='P') then
       pplblTitulo.Caption:='Fluxo Previsto de '+deDatIni.Text+' a '+deDatFim.Text;
   if (sTipoFluxo='R') then
      pplblTitulo.Caption:='Fluxo Realizado de '+deDatIni.Text+' a '+deDatFim.Text;
   if (sTipoFluxo='O') then
      pplblTitulo.Caption:='Fluxo Orçado de '+deDatIni.Text+' a '+deDatFim.Text;

   pplblTituloPaisagem.Caption:=pplblTitulo.Caption;

   //Desabilita Legendas quando fluxo diferente de Previsto
   if (sTipoFluxo<>'P') then
    begin
       ppshpRecSemPrev.Visible:=False;
       ppshpRecComPrev.Visible:=False;
       ppshpPgtoSemPrev.Visible:=False;
       ppshpPgtoComPrev.Visible:=False;
       pplblRecSemPrev.Visible:=False;
       pplblRecComPrev.Visible:=False;
       pplblPagSemPrev.Visible:=False;
       pplblPagComPrev.Visible:=False;

       ppshpRecSemPrevPaisag.Visible:=False;
       ppshpRecComPrevPaisag.Visible:=False;
       ppshpPgtoSemPrevPaisag.Visible:=False;
       ppshpPgtoComPrevPaisag.Visible:=False;
       pplblRecSemPrevPaisag.Visible:=False;
       pplblRecComPrevPaisag.Visible:=False;
       pplblPagSemPrevPaisag.Visible:=False;
       pplblPagComPrevPaisag.Visible:=False;
    end;

   CarregaCdsImpressao;

   if (sOrientaPapel='RETRATO') then
      TFrmPreview.CreateModalPreview(Application,rpImpRetrato,'Fluxo de Caixa')
   else
      TFrmPreview.CreateModalPreview(Application,rpImpPaisagem,'Fluxo de Caixa');
end;

procedure TfrmConsultaFluxoMT.BandaDetalheBeforePrint(Sender: TObject);
begin
   inherited;
   ppLineSeparacao.Visible:=False;
   ppDBTextLinhaFluxo.Visible:=True;
   ppDBTextValor1.Visible:=True;
   ppDBTextValor2.Visible:=True;
   ppDBTextValor3.Visible:=True;
   ppDBTextValor4.Visible:=True;
   ppDBTextValor5.Visible:=True;

   if (Copy(Trim(cdsImp.FieldByName('LINHAFLUXO').AsString),1,3)='---') or
      (Copy(Trim(cdsImp.FieldByName('LINHAFLUXO').AsString),1,3)='===') or
      (Copy(Trim(cdsImp.FieldByName('LINHAFLUXO').AsString),1,3)='___') then
    begin
       ppLineSeparacao.Visible:=True;
       ppDBTextLinhaFluxo.Visible:=False;
       ppDBTextValor1.Visible:=False;
       ppDBTextValor2.Visible:=False;
       ppDBTextValor3.Visible:=False;
       ppDBTextValor4.Visible:=False;
       ppDBTextValor5.Visible:=False;
    end;
end;

procedure TfrmConsultaFluxoMT.CarregaCdsImpressao;
var
   iLinha      : Integer;
   iColuna     : Integer;
   iColunaRef  : Integer;
   iSecao      : Integer;    //Seção = conjunto de 5 ou 8 Colunas
   iNumSecoes  : Integer;
   iTotalCol   : Integer;
   iNumColunas : Integer;
begin
   //Ajusta número de colunas do relatório
   if (sOrientaPapel='RETRATO') then
      iNumColunas:=5
   else
      iNumColunas:=8;

   iTotalCol:=(sgFluxo.ColCount-1);
   iNumSecoes:=((sgFluxo.ColCount-1) div iNumColunas);
   if ((sgFluxo.ColCount-1) mod iNumColunas)>0 then Inc(iNumSecoes);
   for iSecao:=1 to iNumSecoes do
   begin
      for iLinha:=2 to sgFluxo.RowCount-1 do
      begin
         cdsImp.Append;
         iColunaRef:=(iSecao-1)*iNumColunas;
         cdsImp.FieldByName('LINHAFLUXO').AsString:=sgFluxo.Cells[0,iLinha];

         for iColuna:=1 to Min(iTotalCol,iNumColunas) do
         begin
            cdsImp.FieldByName('DATA'+IntToStr(iColuna)).AsString:=
                   Trim(sgFluxo.Cells[iColunaRef+iColuna,0]);

            cdsImp.FieldByName('VALOR'+IntToStr(iColuna)).AsString:=
                   Trim(sgFluxo.Cells[iColunaRef+iColuna,iLinha]);

            cdsImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat:=
                   ExtraiCor(CoresDados,iColunaRef+iColuna,iLinha);

            if (Pos('(',cdsImp.FieldByName('VALOR'+IntToStr(iColuna)).AsString)<>0) and
               (cdsImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat=clBlack) then
               cdsImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat:=clRed;
         end;
         
         cdsImp.Post;
      end;
      iTotalCol:=iTotalCol-iNumColunas;
   end;
end;

procedure TfrmConsultaFluxoMT.ppLabelDataPrint(Sender: TObject);
begin
   TppLabel(Sender).Caption:=Trim(cdsImp.FieldByName(TppLabel(Sender).UserName).AsString);
end;

procedure TfrmConsultaFluxoMT.ppDBTextLinhaFluxoPrint(Sender: TObject);
begin
   if (Pos('->',cdsImp.FieldByName('LINHAFLUXO').AsString)<>0) then
    begin
       TppDBText(Sender).Font.Style:=[fsBold];
       TppDBText(Sender).Font.Color:=clNavy;
    end
   else
    begin
       TppDBText(Sender).Font.Style:=[];
       TppDBText(Sender).Font.Color:=clBlack;
    end;
end;

procedure TfrmConsultaFluxoMT.ppDBTextValorPrint(Sender: TObject);
var
   iColuna: Integer;
begin
   iColuna:=StrToIntDef(Copy(Trim(TppDBText(Sender).UserName),
                        Length(TppDBText(Sender).UserName),1),1);
   TppDBText(Sender).Font.Color:=Trunc(cdsImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat);
   TppDBText(Sender).Font.Style:=RetornaEstilo(cdsImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat);
end;

procedure TfrmConsultaFluxoMT.ppLblSistemaPrint(Sender: TObject);
begin
   TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

function TfrmConsultaFluxoMT.RetornaEstilo(Cor: Double): TFontStyles;
begin
   Result:=[fsItalic];
   if (Trunc(Cor)=shpRecSemPrev.Brush.Color) or
      (Trunc(Cor)=shpPgtoSemPrev.Brush.Color) or (Trunc(Cor)=clBlack) then
      Result:=[];
end;

end.
