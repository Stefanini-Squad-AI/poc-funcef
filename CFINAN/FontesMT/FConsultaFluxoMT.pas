unit FConsultaFluxoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Grids, ComCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Mask, wwdbedit, Wwdbspin, wwdblook, DBClient, uCMClientDataSet,
  uCtrlParamIntegra, uCtrlListTercFinanc, uCtrlFluxoCaixa, uGeralFinanc,
  uCtrlParamFinanc, Wwdbigrd, Wwdbgrid, DBTables, Wwquery, DBGrids, uCtrlPadroes,
  uCmSqlParams, uCtrlMontaFluxo, 
  ImgList, IvEMulti;

type
  TfrmConsultaFluxoMT = class(TfrmSairAjuda)
    bbtnExibirFluxo: TBitBtn;
    rbtnImprimir: TBitBtn;
    pnlFiltros: TPanel;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    Label2: TLabel;
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
    rgAnaSint: TRadioGroup;
    cbZerado: TCheckBox;
    cbExibeSabDom: TCheckBox;
    edFatorDivisaoMoeda: TRealEdit;
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
    cdsCentroRespon: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
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
    pplblNomeRelatPaisagem: TppLabel;
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
    lblDetalhes: TLabel;
    dblcMontagemFluxo: TwwDBLookupCombo;
    Label5: TLabel;
    cdsMontagemFluxo: TCMClientDataSet;
    lblPortador: TLabel;
    dblcPortador: TwwDBLookupCombo;
    cdsPortador: TCMClientDataSet;
    cbExibeSaldoBancos: TCheckBox;
    cdsLinhasSaldo: TCMClientDataSet;
    Bevel2: TBevel;
    imglBotoes: TImageList;
    rgQuebra: TRadioGroup;
    dblcPatrocinador: TwwDBLookupCombo;
    dblcPlanoPrev: TwwDBLookupCombo;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    Label18: TLabel;
    Label1: TLabel;
    cdsFluxoDesrelac: TCMClientDataSet;
    pplFluxoDesrelac: TppBDEPipeline;
    rptFluxoDesrelac: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine7: TppLine;
    lbEmpresa: TppLabel;
    ppLabel1: TppLabel;
    lbPerido: TppLabel;
    ppLine6: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    lbPrazo: TppLabel;
    ppDetailBand2: TppDetailBand;
    shpCorLinha: TppShape;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine8: TppLine;
    lbSistema: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    dsFluxoDesrelac: TwwDataSource;
    chkExibePercentual: TCheckBox;
    ppLabel12: TppLabel;
    ppDBText14: TppDBText;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgAnaSintClick(Sender: TObject);
    procedure seGrauMaxCARChange(Sender: TObject);
    procedure seGrauMaxCAPChange(Sender: TObject);
    procedure rgQuebraClick(Sender: TObject);
    procedure rgDSMClick(Sender: TObject);
    procedure cbExibeSabDomClick(Sender: TObject);
    procedure cbZeradoClick(Sender: TObject);
    procedure trkbLarguraTituloChange(Sender: TObject);
    procedure bbtnExibirFluxoClick(Sender: TObject);
    procedure sgFluxoDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
    procedure dblcMontagemFluxoChange(Sender: TObject);
    procedure dblcPortadorChange(Sender: TObject);
    procedure deDataCloseUp(Sender: TObject);
    procedure deDataExit(Sender: TObject);
    procedure cbExibeSaldoBancosClick(Sender: TObject);
    procedure lbEmpresaPrint(Sender: TObject);
    procedure lbSistemaPrint(Sender: TObject);
    procedure shpCorLinhaPrint(Sender: TObject);
    procedure FiltrosExit(Sender: TObject);


  private { Private declarations }

    CtrlListTerceiros    : TCtrlListTercFinanc;
    CtrlFluxoCaixa       : TCtrlFluxoCaixa;
    CtrlMontaFluxo       : TCtrlMontaFluxo;
    GeralFinanc          : TGeralFinanc;
    CtrlParamFinanc      : TCtrlParamFinanc;

    sFluxo             : String;
    sTipoFluxo         : String;
    sMascaraCAR        : String;
    sMascaraCAP        : String;
    dDataMin           : TDateTime;
    dDataMax           : TDateTime;
    bMostrouFluxo      : Boolean;
    bExpandeCol        : Boolean;
    bDesVermelho       : Boolean;
    bSubSaldo          : Boolean;
    bInterrompido      : Boolean;
    iEspacoBase        : Integer;
    iLinhaInicSaldo    : Integer;
    iLinhaInicSalAplic : Integer;
    CoresColunas       : TStringList;
    CoresColunaTit     : TStringList;
    CoresDados         : TStringList;
    Detalhes           : TStringList;
    sCorRecComPrev     : String;
    sCorRecSemPrev     : String;
    sCorPgtoComPrev    : String;
    sCorPgtoSemPrev    : String;
    sOrientaPapel      : String;
    rFluxoPrimario     : Double;
    ParametrosFluxo    : TParamFluxo;

    procedure ExibeColunasFluxo;
    procedure ExibeTituloLinhas(bGeraLinhas: Boolean);
    procedure ExibeTituloLinhasSaldo;
    procedure ExibeDadosFluxo(iColuna: Integer; dDataInicial, dDataFinal: TDateTime);
    procedure ExibeDadosSaldo(iColuna: Integer);
    procedure ExibeDadosSaldoAplic(iColuna: Integer);
    procedure ExibeDadosColunaTotal;

    procedure AssociaCor(aCores: TStringList; iColuna, iLinha: Integer; sCor: String);
    procedure LimpaCelulas(iColunaInicial, iColunaFinal, iLinhaInicial, iLinhaFinal: Integer);
    function ExtraiCor(aCores: TStringList; iColuna, iLinha: Integer): TColor;
    procedure AplicaFator;
    procedure BandaDetalheBeforePrint(Sender: TObject);
    procedure CarregaCdsImpressao;
    procedure PreparaAmbiente(rIDFluxoConsol: Double);
    procedure CarregaCdsFiltro;
    function RetornaEstilo(Cor: Double): TFontStyles;


  public  { Public declarations }

    constructor Create(AOwner: TComponent; sTipoFluxo: String); reintroduce;


  end;



var
  frmConsultaFluxoMT: TfrmConsultaFluxoMT;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, FPreview, Math, uFuncaoGeral, FFormaImpConsFluxoMT;



constructor TfrmConsultaFluxoMT.Create(AOwner: TComponent; sTipoFluxo: String);
begin
  Self.sTipoFluxo:=sTipoFluxo;
  inherited Create(AOwner);
end;



procedure TfrmConsultaFluxoMT.FormCreate(Sender: TObject);
begin
   inherited;

   sFluxo:='';
   dDataMin:=0;
   dDataMax:=0;
   iEspacoBase:=0;
   iLinhaInicSaldo:=0;
   iLinhaInicSalAplic:=0;
   CoresColunas:=TStringList.Create;
   CoresColunaTit:=TStringList.Create;
   CoresDados:=TStringList.Create;
   Detalhes:=TStringList.Create;
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

   CtrlFluxoCaixa.InitializeAs(Padroes);


   //Inicializa 
   CtrlMontaFluxo:=TCtrlMontaFluxo.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
   CtrlMontaFluxo.InitializeAs(Padroes);

   //Habilita/Desabilita Componentes conforme Fluxo escolhido
   pnlLegenda.Visible:=(sTipoFluxo='P');
   cbExibeColAtrasados.Enabled:=(sTipoFluxo='P');

   // ##Questionar ao Alex sobre a exibição deste item
   cbExibeSaldoBancos.Enabled:=(sTipoFluxo='P') or (sTipoFluxo='R');

   rgCML.Enabled:=(sTipoFluxo='O') or (sTipoFluxo='OXR');
   cbExibeColTotal.Enabled:=(sTipoFluxo<>'OXR');
   lblPortador.Enabled:=(sTipoFluxo='R');
   dblcPortador.Enabled:=(sTipoFluxo='R');

   chkExibePercentual.Enabled := (sTipoFluxo = 'OXR');

   //Prepara Ambiente e  Verifica qual tipo do Fluxo corrente
   PreparaAmbiente(0);

   pnlInformacoesFluxo.Caption:='Período Consultado: ' +
                                FormatDateTime('DD/MM/YYYY',deDatIni.Date)+ ' a ' +
                                FormatDateTime('DD/MM/YYYY',deDatFim.Date);

   //Gera Graus Máximos
   sMascaraCAR:=ParamIntegra.MascaraReceb;
   seGrauMaxCAR.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   sMascaraCAP:=ParamIntegra.MascaraDesemb;
   seGrauMaxCAP.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.InitializeAs(Padroes);
   //Carrega Parâmetros do Sistema
   with TCMClientDataSet.Create(Self) do
   try
      Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
      bExpandeCol:=(FieldByName('FLGEXIBECOLEXP').AsString='S');
      cbExibeColAtrasados.Enabled:=(sTipoFluxo='P');
   finally
      Free;
   end;

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.InitializeAs(Padroes);

   //===========================================================================
   //Carrega Cds´s
   //===========================================================================
   //Carrega cdsMontagemFluxo
   cdsMontagemFluxo.Data:=CtrlMontaFluxo.ListFluxoCaixa(0);

   //Carrega cdsFiltro
   CarregaCdsFiltro;
                      

   //Inicializa Parametros do Fluxo
   ParametrosFluxo.dDataInicial:=deDatIni.Date; //data inicial e final da coluna
   ParametrosFluxo.dDataFinal:=deDatFim.Date;   //corrente a ser exibida
   ParametrosFluxo.dDataMin:=dDataMin; //menor e maior data do período que pode
   ParametrosFluxo.dDataMax:=dDataMax; //ser selecionado pelo usuário
   ParametrosFluxo.dDataInicFluxo:=dDataMin;  //início e fim do período selecionado
   ParametrosFluxo.dDataFinalFluxo:=dDataMax; //pelo usuário
   ParametrosFluxo.rUnidNeg:=0;
   ParametrosFluxo.sCentroResp:='';
   ParametrosFluxo.sCentroCusto:='';
   ParametrosFluxo.rCodPortador:=0;
   ParametrosFluxo.sQuebra:='';
   ParametrosFluxo.Legenda.sCorRecComPrev:=sCorRecComPrev;
   ParametrosFluxo.Legenda.sCorRecSemPrev:=sCorRecSemPrev;
   ParametrosFluxo.Legenda.sCorPgtoComPrev:=sCorPgtoComPrev;
   ParametrosFluxo.Legenda.sCorPgtoSemPrev:=sCorPgtoSemPrev;
   ParametrosFluxo.sTipoFluxo:=sTipoFluxo;
   ParametrosFluxo.sPrazo:='C';
   ParametrosFluxo.bFlxComparativo:=(sTipoFluxo='OXR');
   ParametrosFluxo.sFiltroPessoa:=' = '+FloatToStr(Sistema.IdEmpresa);

   //Exibe as Colunas do Fluxo
   ExibeColunasFluxo;

   //Exibe Título das linhas do Fluxo
   cdsMontagemFluxo.First;
   rFluxoPrimario:=cdsMontagemFluxo.FieldByName('IDFLUXOCAIXA').AsFloat;
   dblcMontagemFluxo.LookupValue:=FloatToStr(rFluxoPrimario);
   dblcMontagemFluxo.Update;
   //ExibeTituloLinhas(True);

   edFatorDivisaoMoeda.Value:=1;



end;



procedure TfrmConsultaFluxoMT.FormShow(Sender: TObject);
begin
   inherited;
   WindowState:=wsMaximized;
end;



procedure TfrmConsultaFluxoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlListTerceiros.Free;
   CtrlFluxoCaixa.Free;
   CtrlMontaFluxo.Free;
   GeralFinanc.Free;
   CtrlParamFinanc.Free;
   CoresColunas.Free;
   CoresColunaTit.Free;
   CoresDados.Free;
   Detalhes.Free;
   inherited;
   Action:=caFree;
end;



procedure TfrmConsultaFluxoMT.dblcMontagemFluxoChange(Sender: TObject);
begin
   if (Trim(dblcMontagemFluxo.Text)<>'') then
      ExibeTituloLinhas(True)
   else
   begin
      dblcMontagemFluxo.LookupValue:=FloatToStr(rFluxoPrimario);
      dblcMontagemFluxo.Update;
   end;
end;



procedure TfrmConsultaFluxoMT.dblcPortadorChange(Sender: TObject);
begin
   try
      if Trim(dblcPortador.Text)<>'' then
         ParametrosFluxo.rCodPortador :=StrToFloat(dblcPortador.LookupValue)
      else
         ParametrosFluxo.rCodPortador:=0;
   except
      ParametrosFluxo.rCodPortador:=0;
   end;

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



procedure TfrmConsultaFluxoMT.deDataCloseUp(Sender: TObject);
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



procedure TfrmConsultaFluxoMT.deDataExit(Sender: TObject);
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

   pnlInformacoesFluxo.Caption:=Translate('Período Consultado: ')+
                                FormatDateTime('DD/MM/YYYY',deDatIni.Date)+Translate(' a ')+
                                FormatDateTime('DD/MM/YYYY',deDatFim.Date);

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
      4: ParametrosFluxo.sQuebra:='PL';
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



procedure TfrmConsultaFluxoMT.cbExibeSaldoBancosClick(Sender: TObject);
begin
   if not(cbExibeSaldoBancos.Checked) and (iLinhaInicSaldo<>0) then
   begin
      sgFluxo.RowCount    := iLinhaInicSaldo;
      sgFluxoAux.RowCount := iLinhaInicSaldo-2;
      iLinhaInicSaldo     := 0;
   end
   else
   begin
      iLinhaInicSaldo     := sgFluxo.RowCount;
      cdsLinhasSaldo.Data := CtrlFluxoCaixa.GeraLinhasSaldo(ParametrosFluxo,False,0);
      ExibeTituloLinhasSaldo;
   end;
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

     if (ExtraiCor(CoresColunas,ACol,1) = clOlive) then
     begin
        if (ARow>1) then
           sgFluxo.Canvas.Brush.Color := $00EEEEEE
        else
           if (ARow=1) then Cor := clNavy;
     end;


      //Testa se valor é negativo. Caso seja,
      //Muda a cor para Vermelho.
      if (Acol>0) and (ARow>1) and (bDesVermelho) and (Cor=clBlack) then
          if (Pos('(',sgFluxo.Cells[Acol,ARow])<>0) then Cor:=clRed;

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




procedure TfrmConsultaFluxoMT.bbtnExibirFluxoClick(Sender: TObject);
var
   iColuna   : Integer;
   rSaldoAux : Double;
   ParamAux  : TParamFluxo;
   CdsAux    : TClientDataSet;


begin
   //Verifica se o botão foi clicado enquanto se exibe o fluxo de caixa
   if (bbtnExibirFluxo.Font.Color=clRed) then
   begin
      bInterrompido:=True;
      Exit;
   end
   else
      bInterrompido:=False;

   try
      //Altera o Caption e o Incone do botão de exibição do fluxo
      imglBotoes.GetBitmap(0,bbtnExibirFluxo.Glyph);
      bbtnExibirFluxo.Caption:='&Interromper Exibição';
      bbtnExibirFluxo.Font.Color:=clRed;
      bbtnExibirFluxo.Repaint;

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
         ParamAux.dDataInicial    := dDataMin-1;
         ParamAux.dDataFinal      := dDataMin-1;
         ParamAux.dDataMin        := ParametrosFluxo.dDataMin;
         ParamAux.dDataMax        := ParametrosFluxo.dDataMax;
         ParamAux.Legenda         := ParametrosFluxo.Legenda;
         ParamAux.rUnidNeg        := ParametrosFluxo.rUnidNeg;
         ParamAux.sCentroResp     := ParametrosFluxo.sCentroResp;
         ParamAux.sCentroCusto    := ParametrosFluxo.sCentroCusto;
         ParamAux.sQuebra         := ParametrosFluxo.sQuebra;
         ParamAux.Legenda         := ParametrosFluxo.Legenda;
         ParamAux.sTipoFluxo      := ParametrosFluxo.sTipoFluxo;
         ParamAux.sPrazo          := ParametrosFluxo.sPrazo;
         ParamAux.bFlxComparativo := ParametrosFluxo.bFlxComparativo;
         ParamAux.sFiltroPessoa   := ParametrosFluxo.sFiltroPessoa;

         // Se for Orçado x Realizado, extrair os valores conforme data
         //estabelecida no Cds
         if sTipoFluxo = 'OXR' then
         begin
            ParamAux.dDataInicFluxo  := cdsColunasFluxo.FieldByName('DataInicial').AsDateTime;
            ParamAux.dDataFinalFluxo := cdsColunasFluxo.FieldByName('DataFinal').AsDateTime;
            ParamAux.dDataInicial    := cdsColunasFluxo.FieldByName('DataInicial').AsDateTime;
            ParamAux.dDataFinal      := cdsColunasFluxo.FieldByName('DataFinal').AsDateTime;
         end
         else
         begin
            ParamAux.dDataInicFluxo  := ParametrosFluxo.dDataInicFluxo;
            ParamAux.dDataFinalFluxo := ParametrosFluxo.dDataFinalFluxo;
         end;                                   


         //Gera Linhas da Coluna de atrasados
         cdsLinhasFluxo.Data := CtrlFluxoCaixa.GeraLinhasFluxo(ParamAux,True,-0.000001,
                                                               StrToFloat(dblcMontagemFluxo.LookupValue));



         ExibeDadosFluxo(iColuna,dDataMin-1,dDataMin-1);
         sgFluxo.Refresh;

         prgBarAtuFluxo.StepIt;

         iColuna:=2;
      end;


      //Exibe coluna a coluna
      cdsColunasFluxo.First;
      while not(cdsColunasFluxo.Eof) do
      begin
         if (bInterrompido) then Break;

         cdsLinhasFluxo.Close;

         ParametrosFluxo.dDataInicial := cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime;
         ParametrosFluxo.dDataFinal   := cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime;
         ParametrosFluxo.sTipoFluxo   := cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString;

         if sTipoFluxo = 'OXR' then
         begin
            ParametrosFluxo.dDataInicFluxo  := cdsColunasFluxo.FieldByName('DataInicial').AsDateTime;
            ParametrosFluxo.dDataFinalFluxo := cdsColunasFluxo.FieldByName('DataFinal').AsDateTime;

            if ParametrosFluxo.sTipoFluxo[1] in ['D','V'] then
               ParametrosFluxo.sTipoFluxo := 'R';
         end;

         cdsLinhasFluxo.Data := CtrlFluxoCaixa.GeraLinhasFluxo(ParametrosFluxo,True,rSaldoAux,StrToFloat(dblcMontagemFluxo.LookupValue));

         //Atualiza Saldo Inicial = Saldo a Transportar
         if (sTipoFluxo <> 'OXR') then
         begin
            cdsLinhasFluxo.Last;
            rSaldoAux := cdsLinhasFluxo.FieldByName('TOTAL').AsFloat;
         end
         else
            rSaldoAux := 0;


         ExibeDadosFluxo(iColuna,
                         cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime,
                         cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime);

         //Exibe Linhas de Saldo das Contas
         if (cbExibeSaldoBancos.Checked) then ExibeDadosSaldo(iColuna);


         Inc(iColuna);
         prgBarAtuFluxo.StepIt;
         sgFluxo.Refresh;

         cdsColunasFluxo.Next;

         //Libera o windows para processar outras mensagens
         Application.ProcessMessages;
      end;

      

      //Restaura e esconde barras de progresso 
      prgBarAtuFluxo.Position:=0;
      prgBarExibicao.Position:=0;
      pnlProgresso.SendToBack;

      //Testa se houve interrupição da exibição do fluxo
      if (bInterrompido) then
         MsgDlg('Exibição do Fluxo interrompida','Atenção',mtWarning,[mbOK],0)
      else
         if (cbExibeColTotal.Checked) then
         begin
            ExibeDadosColunaTotal;
            prgBarAtuFluxo.StepIt;
         end;


   finally
      //Altera o Caption e o Incone do botão de exibição do fluxo
      imglBotoes.GetBitmap(1,bbtnExibirFluxo.Glyph);
      bbtnExibirFluxo.Caption:='Exibir &Fluxo';
      bbtnExibirFluxo.Font.Color:=clWindowText;
      bbtnExibirFluxo.Repaint;

      bInterrompido:=False;
   end;



   cdsFluxoDesrelac.Data := CtrlFluxoCaixa.ListaFluxoDesrelac(sTipoFluxo,'',Sistema.IdEmpresa,StrToIntDef(dblcMontagemFluxo.LookupValue,-1),deDatIni.Date,deDatFim.Date);
   if sTipoFluxo = 'O' then
   begin
      case rgCML.ItemIndex of
         0 : lbPrazo.Caption  := 'Prazo:  Curto';
         1 : lbPrazo.Caption  := 'Prazo:  Médio';
         2 : lbPrazo.Caption  := 'Prazo:  Longo';
      end;
   end
   else
     lbPrazo.Caption := '';


   // Faz com que se já existir um RecDes "pai" no cadastro do fluxo,
   //descartar os lançamentos "filhos" que estão sem relacionamento direto (1 = 1)
   try
      CdsAux      := TClientDataSet.Create(nil);
      CdsAux.Data := CtrlFluxoCaixa.ListaCompFluxo(Sistema.IdEmpresa,StrToIntDef(dblcMontagemFluxo.LookupValue,-1));

      while not CdsAux.Eof do
      begin
         cdsFluxoDesrelac.Filtered := false;
         cdsFluxoDesrelac.Filter   := 'CODTIPRECDES LIKE ' + QuotedStr(CdsAux.FieldByName('CODTIPRECDES').AsString + '%') +
                                      ' AND RECPAG = ' + QuotedStr(CdsAux.FieldByName('RECPAG').AsString);
         cdsFluxoDesrelac.Filtered := true;

         while not cdsFluxoDesrelac.Eof do
            cdsFluxoDesrelac.Delete;

         CdsAux.Next;   
      end;


   finally
      FreeAndNil(CdsAux);
      cdsFluxoDesrelac.Filtered := false;
   end;


   if cdsFluxoDesrelac.RecordCount <> 0 then
   begin
      lbPerido.Caption := '';
      if MsgDlg('Existe(m) lançamento(s), para este modelo de fluxo, cujo(s) Tipo(s) de Recebimento'  + #13 +
                '/Desembolso não estão relacionados a nenhuma linha do respectivo fluxo.  '           + #13 +
                'Isto provoca diferença nos saldos a transportar/transportado.  '                     + #13 +
                'Deseja visualizar as inconsistências?',Sistema.NomeAplicativo,mtWarning,[mbYes,mbNo],0) = mrYes then

       TFrmPreview.CreateModalPreview(Application,
                                      rptFluxoDesrelac,
                                      rptFluxoDesrelac.PrinterSetup.DocumentName);
   end;
end;

procedure TfrmConsultaFluxoMT.ExibeColunasFluxo;
var
   iColuna        : Integer;
   iColunaInicial : Integer;
   iColunaFinal   : Integer;
   sAgrupa        : String;
begin
   //Carrega Colunas do Fluxo
   cdsColunasFluxo.Close;

   case rgDSM.ItemIndex of
      0: sAgrupa := 'D';
      1: sAgrupa := 'S';
      2: sAgrupa := 'M';
   end;

   // Cria as linha no Cds
   cdsColunasFluxo.Data := CtrlFluxoCaixa.GeraColunasFluxo(deDatIni.Date,deDatFim.Date,
                                                           sAgrupa,sTipoFluxo,
                                                           cbExibeSabDom.Checked,
                                                           chkExibePercentual.Checked,
                                                           Sistema.IdEmpresa);

   //Testa Número mínimo de colunas permitido
   if (cdsColunasFluxo.RecordCount<1) then
      sgFluxo.ColCount:=2
   else
      sgFluxo.ColCount:=cdsColunasFluxo.RecordCount+1;

   //Ajusta número de colunas do grid auxiliar
   sgFluxoAux.ColCount:=sgFluxo.ColCount-1;

   iColunaInicial := 1;
   iColunaFinal   := sgFluxo.ColCount-1;
   CoresColunas.Clear;

   //Limpa o Grid inteiro
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


   sgFluxo.Visible:=False;

   //Limpa todas as colunas, a partir da coluna 1, e todas as linhas, a partir da linha 2
   LimpaCelulas(1,0,2,0);

   // Escreve na StringGrid as colunas conforme o Cds
   cdsColunasFluxo.First;
   for iColuna:=iColunaInicial to iColunaFinal do
   begin
      if bExpandeCol then
         sgFluxo.ColWidths[iColuna]:=150
      else
         sgFluxo.ColWidths[iColuna]:=15;

      if (cdsColunasFluxo.FieldByName('SABDOM').AsString='S') then
          AssociaCor(CoresColunas,iColuna,1,'clRed');

      if (cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString[1] in ['D','V']) then
          AssociaCor(CoresColunas,iColuna,1,'clOlive');

      sgFluxo.Cells[iColuna,0] := ' ' + cdsColunasFluxo.FieldByName('TITULO').AsString;
      sgFluxo.Cells[iColuna,1] := ' ' + cdsColunasFluxo.FieldByName('SUBTITULO').AsString;
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
       cdsLinhasFluxo.Data:=CtrlFluxoCaixa.GeraLinhasFluxo(ParametrosFluxo,False,0,
                                                     StrToFloat(dblcMontagemFluxo.LookupValue));
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

            4: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('IdPlanoPrev').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('IdPlanoPrev').AsString;
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

  //Exibe Linhas de Saldo das Contas
  if (cbExibeSaldoBancos.Checked) then cbExibeSaldoBancosClick(nil);

end;




procedure TfrmConsultaFluxoMT.ExibeTituloLinhasSaldo;
var
   iLinAux : Integer;
begin
   iLinAux:=sgFluxo.RowCount;
   sgFluxo.RowCount:=sgFluxo.RowCount+cdsLinhasSaldo.RecordCount;
   cdsLinhasSaldo.First;
   while not(cdsLinhasSaldo.Eof) do
   begin
      sgFluxo.Cells[0,iLinAux]:=cdsLinhasSaldo.FieldByName('DESCRICAO').AsString;
      Inc(iLinAux);
      cdsLinhasSaldo.Next;
   end;
   sgFluxoAux.RowCount:=sgFluxo.RowCount-2;
   LimpaCelulas(1,0,2,0); //Limpa toda a área de dados
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
   //Limpa Detalhes
   Detalhes.Clear;
end;



procedure TfrmConsultaFluxoMT.AssociaCor(aCores: TStringList; iColuna, iLinha: Integer; sCor: String);
var
   iPosicao : Integer;
begin
   iPosicao:=aCores.IndexOf(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   if (iPosicao<>-1) then
    begin
       aCores.Delete(iPosicao);
       aCores.Delete(iPosicao+1);
    end;

   aCores.Add(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   aCores.Add(Trim(sCor));
end;



function TfrmConsultaFluxoMT.ExtraiCor(aCores: TStringList; iColuna,iLinha: Integer): TColor;
var
   sCor          : String;
   iPosicao      : Integer;
begin
   Result:=clBlack;
   iPosicao:=aCores.IndexOf(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   if (iPosicao<>-1) then
   begin
      sCor:=Trim(aCores.Strings[iPosicao+1]);
      Result:=StringToColor(sCor);
   end;
end;




procedure TfrmConsultaFluxoMT.ExibeDadosFluxo(iColuna: Integer; dDataInicial, dDataFinal: TDateTime);
var
   iLinha            : Integer;
   iDeslocamento     : Integer;
   rValorAux,
   rValorDif         : Double;
   sQuebraAnterior   : String;
   sAux1, sAux2      : string;
   iColunaOrcado,
   iColunaRealizado,
   iColunaDiferenca,
   iColunaVariacao  : integer;

begin
   iLinha := 1;
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
            4: if (sQuebraAnterior<>cdsLinhasFluxo.FieldByName('IdPlanoPrev').AsString) then
                begin
                   sQuebraAnterior:=cdsLinhasFluxo.FieldByName('IdPlanoPrev').AsString;
                   Inc(iLinha);
                end;
         end;

      //  Testa se a linha Corrente é uma linha de título
      //ou se a coluna for "Variação", pois o preenchimento da mesma
      //é feito quando a coluna em foco for "Diferença", logo mais abaixo
      if (cdsLinhasFluxo.FieldByName('TipoCalculo').AsString = 'T') or
         (cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString  = 'V') then
      begin
         cdsLinhasFluxo.Next;
         Inc(iLinha);
         Continue;
      end;
         
      //Acumula valor de linhas do tipo Acumulativas, para apenas as linhas
      //dos fluxos orçados,realizados e previsto
      rValorAux := cdsLinhasFluxo.FieldByName('TOTAL').AsFloat;
      if (cdsLinhasFluxo.FieldByName('FLGACUMULA').AsString='S') and (iColuna>1) and (sTipoFluxo<>'OXR') then
         rValorAux := rValorAux + StrToFloat(GeralFinanc.SubstSimbMonet(sgFluxo.Cells[iColuna-1,iLinha + 1]));

         
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


   //Preenche  coluna de "Diferença" para os fluxos orçados x realizados
   if (trim(sTipoFluxo) = 'OXR') then
   begin
      if cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString = 'D' then
      begin
         // Extrai as posições das colunas
         iColunaOrcado    := cdsColunasFluxo.RecNo - 2;
         iColunaRealizado := cdsColunasFluxo.RecNo - 1;
         iColunaDiferenca := cdsColunasFluxo.RecNo;
         iColunaVariacao  := cdsColunasFluxo.RecNo + 1;

         // Faz o loop linha-a-linha  da coluna em foco
         //para efetuar os cálculos
         for ilinha := 2 to sgFluxo.rowCount - 1 do
         begin
            // Verifica se há algum valor nas colunas (Orçado e Realizado)
            if (trim (sgFluxo.Cells[iColunaOrcado, iLinha]) <> '') and (trim (sgFluxo.Cells[iColunaRealizado, iLinha]) <> '') then
            begin
               // Extrai o valor da coluna Orçado
               sAux1 := trim(sgFluxo.Cells[iColunaOrcado, iLinha]);
               if Pos('(', sAux1) <> 0 then
               begin
                  sAux1 := copy(sAux1, 2, length(sAux1) - 2);
                  sAux1 := '-' + sAux1;
               end;
               sAux1 := StringReplace( sAux1, ThousandSeparator, '', [rfReplaceAll] );


               // Extrai o valor da coluna Realizado
               sAux2 := trim(sgFluxo.Cells[iColunaRealizado, iLinha]);
               if Pos('(', sAux2) <> 0 then
               begin
                  sAux2 := copy(sAux2, 2, length(sAux2) - 2);
                  sAux2 := '-' + sAux2;
               end;
               sAux2 := StringReplace( sAux2, ThousandSeparator, '', [rfReplaceAll] );

               // Escreve a "diferença" na tela
               rValorDif := 0;
               // Se o Orçado for zero(0) e o Realizado for negativo(-)
               if ((StrToFloat(sAux1) = 0) and (StrToFloat(sAux2) < 0)) then
                  rValorDif := StrToFloat(sAux2)
               else
                  rValorDif := strToFloat(saux1) - strToFloat(sAux2);
                  
               sgFluxo.Cells[iColunaDiferenca, iLinha] := FormatFloat('#,##0.00;(#,##0.00)',rValorDif);

               // Escreve o percetual
               if chkExibePercentual.Checked then
               begin
                  if (StrToFloat(sAux1) <> 0) and (StrToFloat(sAux2) <> 0) then
                  begin
                     // Pontera o Cds na linha corrente no StringGrid
                     // Tem que ser assim, localizar pelo valor do Realizado, pois
                     //não há nenhuma outra chave disponível na StringGrid.
                     if cdsLinhasFluxo.Locate('TOTAL',sAux2,[]) then
                     begin
                        // Verifica se a linha não é base de dispersão do fluxo
                        if not (cdsLinhasFluxo.FieldByName('FLGDISPBASE').AsString = 'S') then
                        begin
                           rValorAux := ((rValorDif * 100) / StrToFloat(sAux1));
                           sgFluxo.Cells[iColunaVariacao, iLinha] := FormatFloat('#,##0.00;(#,##0.00)',rValorAux) + ' %';
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;   
   end;   

   bMostrouFluxo:=True;
end;




procedure TfrmConsultaFluxoMT.ExibeDadosSaldo(iColuna: Integer);
var
   iLinhaAux : Integer;
begin
   cdsLinhasFluxo.Last;
   cdsLinhasSaldo.Data:=CtrlFluxoCaixa.GeraLinhasSaldo(ParametrosFluxo,True,
                                                       cdsLinhasFluxo.FieldByName('TOTAL').AsFloat);
   for iLinhaAux:=iLinhaInicSaldo to (iLinhaInicSaldo+cdsLinhasSaldo.RecordCount-1) do
   begin
      //Associa a cor vermelha a valores negativos
      if (cdsLinhasSaldo.FieldByName('VALOR').AsFloat<0) then
          AssociaCor(CoresDados,iColuna,iLinhaAux,'clRed');

      //Armazena detalhes dos Recebimentos e Cheques pendentes
      if (cdsLinhasSaldo.FieldByName('TIPO').AsString='LR') or
         (cdsLinhasSaldo.FieldByName('TIPO').AsString='LC') then
      begin
         Detalhes.Add('('+IntToStr(iColuna)+','+IntToStr(iLinhaAux)+')SalBancos');
         Detalhes.Add(cdsLinhasSaldo.FieldByName('TIPO').AsString);

         if (cdsLinhasSaldo.FieldByName('TIPO').AsString='LR') then
             Detalhes.Add('E')
         else
             Detalhes.Add('S');

         Detalhes.Add(FormatDateTime('dd/mm/yyyy',ParametrosFluxo.dDataFinal));
      end;

      //Exibe os Dados
      if (cdsLinhasSaldo.FieldByName('TIPO').AsString<>'LT') then
      begin
         sgFluxo.Cells[iColuna,iLinhaAux]:=FormatFloat('#,##0.00;(#,##0.00)',
                                           cdsLinhasSaldo.FieldByName('VALOR').AsFloat);
         sgFluxoAux.Cells[iColuna-1,iLinhaAux-2]:=FormatFloat('#,##0.00;(#,##0.00)',
                                                  cdsLinhasSaldo.FieldByName('VALOR').AsFloat);
      end;

      cdsLinhasSaldo.Next;
   end;
end;

procedure TfrmConsultaFluxoMT.ExibeDadosSaldoAplic(iColuna: Integer);
var
   iLinhaAux : Integer;
begin

end;

procedure TfrmConsultaFluxoMT.ExibeDadosColunaTotal;
var
   iX,iY           : Integer;
   rTotal          : Double;
   bLinhaTitulo    : Boolean;
   iXInicial       : Integer;
   iQtdeLinhaAux   : Integer;
begin
   if cbExibeColAtrasados.Checked then
   begin
      iXInicial:=1;
      //Saldo Inicial
      sgFluxo.Cells[sgFluxo.ColCount-1,2]:=sgFluxo.Cells[2,2];
      sgFluxoAux.Cells[sgFluxoAux.ColCount-1,0]:=sgFluxoAux.Cells[1,0];
   end
   else
   begin
      iXInicial:=0;
      //Saldo Inicial
      sgFluxo.Cells[sgFluxo.ColCount-1,2]:=sgFluxo.Cells[1,2];
      sgFluxoAux.Cells[sgFluxoAux.ColCount-1,0]:=sgFluxoAux.Cells[0,0];
   end;

   iQtdeLinhaAux:=sgFluxo.RowCount;
   if (iLinhaInicSaldo<>0) then iQtdeLinhaAux:=iLinhaInicSaldo;

   //Saldo a Transportar
   sgFluxo.Cells[sgFluxo.ColCount-1,iQtdeLinhaAux-1]:=sgFluxo.Cells[sgFluxo.ColCount-2,
                                                                    iQtdeLinhaAux-1];
   sgFluxoAux.Cells[sgFluxoAux.ColCount-1,(iQtdeLinhaAux-2)-1]:=sgFluxoAux.Cells[sgFluxoAux.ColCount-2,
                                                                                (iQtdeLinhaAux-2)-1];

   for iY:=1 to ((iQtdeLinhaAux-2)-2) do
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



procedure TfrmConsultaFluxoMT.PreparaAmbiente(rIDFluxoConsol: Double);
var
   sData  : String;
   dDataI : TDateTime;
   dDataF : TDateTime;
begin
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
      Caption:=Translate('Consulta Fluxo de Caixa Previsto');
      pplblNomeRelat.Caption:=Translate('Fluxo de Caixa Previsto');
      pplblNomeRelatPaisagem.Caption:=pplblNomeRelat.Caption;
      HelpContext:=90044;
      bbtnAjuda.HelpContext:=90044;
   end;

   if (sTipoFluxo='R') then
   begin
      sData:='DATACFLOAT';
      sFluxo:='FluxoReal';
      deDatIni.Date:=Date-31;
      deDatFim.Date:=Date-1;
      Caption:=Translate('Consulta Fluxo de Caixa Realizado');
      pplblNomeRelat.Caption:=Translate('Fluxo de Caixa Realizado');
      pplblNomeRelatPaisagem.Caption:=pplblNomeRelat.Caption;
      HelpContext:=90045;
      bbtnAjuda.HelpContext:=90045;
   end;

   if (sTipoFluxo='O') then
   begin
      sFluxo:='FluxoOrcado';
      deDatIni.Date:=dDataI+1;
      if ((dDataI+1)>dDataF) then dDataF:=dDataI+1;
      deDatFim.Date:=dDataF;
      Caption:=Translate('Consulta Fluxo de Caixa Orçado');
      pplblNomeRelat.Caption:=Translate('Fluxo de Caixa Orçado');
      pplblNomeRelatPaisagem.Caption:=pplblNomeRelat.Caption;
      HelpContext:=90046;
      bbtnAjuda.HelpContext:=90046;
   end;

   if (sTipoFluxo='OXR') then
   begin
      deDatIni.Date:=Date-31;
      deDatFim.Date:=Date-1;
      Caption:=Translate('Consulta Fluxo de Caixa Orçado x Realizado');
   end;

   dDataMin:=deDatIni.Date;
   dDataMax:=deDatFim.Date;
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


   if (edFatorDivisaoMoeda.Value<>1) then
      if (Trim(sFiltroAux)<>'') then
         sFiltroAux:=sFiltroAux+Translate(' - Fator Div.: ')+FloatToStr(edFatorDivisaoMoeda.Value)
      else
         sFiltroAux:=Translate('   - Fator Div.: ')+FloatToStr(edFatorDivisaoMoeda.Value);

   pplblFiltro.Caption:=Translate('Filtro: ')+sFiltroAux;
   pplblFiltroPaisagem.Caption:=pplblFiltro.Caption;

   //Associa Nome da Empresa
   pplblEmpresa.Caption:=Sistema.NomeEmpresa;
   pplblEmpresaPaisagem.Caption:=pplblEmpresa.Caption;

   //Associa Título do Relatório
   if (sTipoFluxo='P') then
    begin
       pplblNomeRelat.Caption:=Translate('Fluxo Previsto');
       pplblNomeRelatPaisagem.Caption:=pplblNomeRelat.Caption;
    end;

   if (sTipoFluxo='R') then
   begin
      pplblNomeRelat.Caption:=Translate('Fluxo Realizado');
      pplblNomeRelatPaisagem.Caption:=pplblNomeRelat.Caption;
   end;

   if (sTipoFluxo='O') then
   begin
      pplblNomeRelat.Caption:=Translate('Fluxo Orçado');
      pplblTituloPaisagem.Caption:=pplblNomeRelat.Caption;
   end;

   if (sTipoFluxo='OXR') then
   begin
      pplblNomeRelat.Caption:=Translate('Fluxo de Caixa Orçado x Realizado');
      pplblNomeRelatPaisagem.Caption:=pplblNomeRelat.Caption;
   end;

   //Associa Período do relatório
   pplblTitulo.Caption:=pnlInformacoesFluxo.Caption;
   pplblTituloPaisagem.Caption:=pplblTitulo.Caption;

   //Desabilita Legendas quando fluxo diferente de Previsto
   if (sTipoFluxo<>'P') then
   begin
      ppshpRecSemPrev.Visible        := False;
      ppshpRecComPrev.Visible        := False;
      ppshpPgtoSemPrev.Visible       := False;
      ppshpPgtoComPrev.Visible       := False;
      pplblRecSemPrev.Visible        := False;
      pplblRecComPrev.Visible        := False;
      pplblPagSemPrev.Visible        := False;
      pplblPagComPrev.Visible        := False;
      ppshpRecSemPrevPaisag.Visible  := False;
      ppshpRecComPrevPaisag.Visible  := False;
      ppshpPgtoSemPrevPaisag.Visible := False;
      ppshpPgtoComPrevPaisag.Visible := False;
      pplblRecSemPrevPaisag.Visible  := False;
      pplblRecComPrevPaisag.Visible  := False;
      pplblPagSemPrevPaisag.Visible  := False;
      pplblPagComPrevPaisag.Visible  := False;
   end;

   CarregaCdsImpressao;

   if (sOrientaPapel='RETRATO') then
      TFrmPreview.CreateModalPreview(Application,rpImpRetrato,Translate('Fluxo de Caixa'))
   else
      TFrmPreview.CreateModalPreview(Application,rpImpPaisagem,Translate('Fluxo de Caixa'));
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
   if (sTipoFluxo='OXR') then
      TppLabel(Sender).Font.Size:=8
   else
      TppLabel(Sender).Font.Size:=10;

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



procedure TfrmConsultaFluxoMT.CarregaCdsFiltro;
begin
   //Carrega cdsUnidNeg
   if (sTipoFluxo='OXR') then
      cdsUnidNeg.Data:=CtrlFluxoCaixa.ListUnidNegxFluxoComp(Sistema.IdEmpresa,'FluxoOrcado','FluxoReal')
   else
      cdsUnidNeg.Data:=CtrlFluxoCaixa.ListUnidNegxFluxo(Sistema.IdEmpresa,sFluxo);

   //Carrega cdsCentroRespon
   if (sTipoFluxo='OXR') then
      cdsCentroRespon.Data:=CtrlFluxoCaixa.ListCentroResponxFluxoComp(Sistema.IdEmpresa,'FluxoOrcado','FluxoReal')
   else
      cdsCentroRespon.Data:=CtrlFluxoCaixa.ListCentroResponxFluxo(Sistema.IdEmpresa,sFluxo);

   //Carrega cdsCentroCusto
   cdsCentroCusto.Data := CtrlFluxoCaixa.ListCentroCustoxFluxo(Sistema.IdEmpresa);


   //Carrega cdsPortador
   cdsPortador.Data:=CtrlFluxoCaixa.ListPortadorConta(Sistema.IdEmpresa);

   //Carrega cdsPatrocinador
   cdsPatrocinador.Data:=CtrlListTerceiros.ListPatrocinador;

   //Carrega cdsPlanoPrev
   cdsPlanoPrev.Data:=CtrlListTerceiros.ListPlanoPrev;
end;




procedure TfrmConsultaFluxoMT.lbEmpresaPrint(Sender: TObject);
begin
  inherited;
  lbEmpresa.Caption := Sistema.NomeEmpresa;
end;




procedure TfrmConsultaFluxoMT.lbSistemaPrint(Sender: TObject);
begin
  inherited;
  lbSistema.Caption := Sistema.NomeCompleto;
end;




procedure TfrmConsultaFluxoMT.shpCorLinhaPrint(Sender: TObject);
begin
  inherited;
  if shpCorLinha.Brush.Color = $00E2E2E2 then
     shpCorLinha.Brush.Color := clWhite
  else
     shpCorLinha.Brush.Color := $00E2E2E2;
end;




procedure TfrmConsultaFluxoMT.FiltrosExit(Sender: TObject);
begin
  inherited;
   try
      if Trim(dblcUnidNegoc.Text)<>'' then
         ParametrosFluxo.rUnidNeg := StrToIntDef(dblcUnidNegoc.LookupValue,0)
      else
         ParametrosFluxo.rUnidNeg := 0;
   except
      ParametrosFluxo.rUnidNeg := 0;
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
      ParametrosFluxo.rIDPlanoPrev:=StrToIntDef(dblcPlanoPrev.LookupValue, 0)
   else
      ParametrosFluxo.rIDPlanoPrev:=0;

   if Trim(dblcPatrocinador.Text)<>'' then
      ParametrosFluxo.rIDPatro:=StrToIntDef(dblcPatrocinador.LookupValue,0)
   else
      ParametrosFluxo.rIDPatro:=0;

   ExibeTituloLinhas(True);
end;



end.
