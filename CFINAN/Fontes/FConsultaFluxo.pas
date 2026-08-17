// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FConsultaFluxo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit,
  Wwdbspin, ComCtrls, Printers, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, ppDB, ppDBPipe, ppDBBDE,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppCache, DBGrids, TREdit,ppForms,ppTypes,ppPrvDlg;

type
  TfrmConsultaFluxo = class(TfrmSairAjuda)
    bbtnMostrarFluxo: TBitBtn;
    pnlFluxo: TPanel;
    qryCentroRespon: TwwQuery;
    qryUnidNegoc: TwwQuery;
    sgFluxo: TStringGrid;
    pnlInformacoesFluxo: TPanel;
    rbtnImprimir: TBitBtn;
    qryImp: TwwQuery;
    pplImp: TppBDEPipeline;
    dsImp: TwwDataSource;
    rpImp: TppReport;
    HeaderBand1: TppHeaderBand;
    lblTitulo: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    BandaDetalhe: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLineSeparacao: TppLine;
    upImp: TUpdateSQL;
    ppDBTextRecPag: TppDBText;
    ppLabelData1: TppLabel;
    ppLabelData4: TppLabel;
    ppLabelData5: TppLabel;
    ppLabelData2: TppLabel;
    ppLabelData3: TppLabel;
    ppLine2: TppLine;
    ppDBTextValor5: TppDBText;
    ppDBTextValor1: TppDBText;
    ppDBTextValor3: TppDBText;
    ppDBTextValor2: TppDBText;
    ppDBTextValor4: TppDBText;
    ppshpPgtoSemPrev: TppShape;
    ppshpRecSemPrev: TppShape;
    ppshpPgtoComPrev: TppShape;
    ppshpRecComPrev: TppShape;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevNOME: TStringField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    Panel2: TPanel;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    Label1: TLabel;
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
    qryLinhasFluxo: TwwQuery;
    qryColunasFluxo: TwwQuery;
    qryDatasMinMax: TwwQuery;
    qryDatasMinMaxDATAINIC: TDateTimeField;
    qryDatasMinMaxDATAFIM: TDateTimeField;
    upLinhasFluxo: TUpdateSQL;
    upColunasFluxo: TUpdateSQL;
    qryColunasFluxoDATAINICIAL: TDateTimeField;
    qryColunasFluxoDATAFINAL: TDateTimeField;
    qryColunasFluxoTITULO: TStringField;
    qryColunasFluxoSUBTITULO: TStringField;
    qryColunasFluxoSABDOM: TStringField;
    qrySaldoAnterior: TwwQuery;
    dsTeste: TDataSource;
    QryAux: TQuery;
    cbExibeSabDom: TCheckBox;
    Label2: TLabel;
    edFatorDivisaoMoeda: TRealEdit;
    trkbLarguraTitulo: TTrackBar;
    sgFluxoAux: TStringGrid;
    Label18: TLabel;
    dblcPatrocinador: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPatroRAZAOSOCIAL: TStringField;
    qryPatroIDPESSOA: TFloatField;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    Label3: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    Bevel1: TBevel;
    qryCentroCusto: TwwQuery;
    pplblNomeRelat: TppLabel;
    pnlProgresso: TPanel;
    prgBarAtuFluxo: TProgressBar;
    prgBarExibicao: TProgressBar;
    pnlLegenda: TPanel;
    shpRecSemPrev: TShape;
    lblCorAzul: TLabel;
    shpPgtoSemPrev: TShape;
    lblCorVermelha: TLabel;
    lblCorRosa: TLabel;
    shpPgtoComPrev: TShape;
    lblCorVerde: TLabel;
    shpRecComPrev: TShape;
    qryNumTermosTRD: TwwQuery;
    qryNumTermosTDOC: TwwQuery;
    qryTotalTRD: TwwQuery;
    qryTotalTDOC: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnMostrarFluxoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgFluxoDblClick(Sender: TObject);
    procedure seGrauMaxChange(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rgAnaSintClick(Sender: TObject);
    procedure rgQuebraClick(Sender: TObject);
    procedure cbZeradoClick(Sender: TObject);
    procedure dblcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure LblEmpresaPrint(Sender: TObject);
    procedure lblTituloPrint(Sender: TObject);
    procedure ppLabelDataPrint(Sender: TObject);
    procedure ppDBTextValorPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgFluxoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure rgDSMClick(Sender: TObject);
    procedure BandaDetalheBeforePrint(Sender: TObject);
    procedure trkbLarguraTituloChange(Sender: TObject);
    procedure edFatorDivisaoMoedaExit(Sender: TObject);
    procedure deDataCloseUp(Sender: TObject);
    procedure gbDatasExit(Sender: TObject);
    procedure dblcPatrocinadorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    rSaldo          : Real;
    rSaldoBase      : Real;
    sFluxo          : String;
    sTipoFluxo      : String;
    sMascaraCAR     : String;
    sMascaraCAP     : String;
    sTitSalAnterior : String;
    sTipSalTransp   : String;
    dDataMin        : TDateTime;
    dDataMax        : TDateTime;
    bMostrouFluxo   : Boolean;
    bExpandeCol     : Boolean;
    bDesVermelho    : Boolean;
    bSubSaldo       : Boolean;
    iEspacoBase     : Integer;
    Cores           : TStringList;
    CorSabDom       : TStringList;
    sCorRecComPrev  : String;
    sCorRecSemPrev  : String;
    sCorPgtoComPrev : String;
    sCorPgtoSemPrev : String;

    procedure CarregaQryImpressao;
    function RetornaEstilo(Cor: Real): TFontStyles;
    function Replicate(sPadrao: String; iQtde: Integer): String;
    function GeraSaldoInicial: Real;
    procedure MontaFiltroTotalizador(qry: TQuery; dDataInicial,dDataFinal: TDateTime; bUsaData: Boolean);
    procedure GeraDadosFluxo(dDataInicial,dDataFinal: TDateTime; bCalcular: Boolean);
    procedure CalculaSomatorios(dDataInicial,dDataFinal: TDateTime);
    procedure GeraColunasFluxo;
    procedure ExibeTituloLinhas(bGeraLista: Boolean);
    procedure ExibeDadosFluxo(iColuna: Integer);
    procedure LimpaCelulasGerais;
    procedure LimpaCelulasDados;
    procedure MontaFiltroQry(var Qry: TwwQuery);
    procedure MontaFiltroNumTermos(qry: TQuery; dDataInicial,dDataFinal: TDateTime; bUsaUNCRCC: Boolean);
    procedure GeraTotalRecDes(dDataInicial,dDataFinal: TDateTime);
    procedure GeraCoresRecDes(dDataInicial,dDataFinal: TDateTime);

    procedure GeraNumTermos;
    procedure GeraNumTermosTRD;
    procedure GeraNumTermosTDOC;
    function BuscaNumTermos(rCodTipDoc: Real; sCodTipRecDes, sRecPag: String;
                            rUnidNeg: Real; sCRespon,sCCusto: String): Real;

    procedure GeraTotais(dDataInicial,dDataFinal: TDateTime);
    procedure GeraTotalTRD(dDataInicial,dDataFinal: TDateTime);
    procedure GeraTotalTDOC(dDataInicial,dDataFinal: TDateTime);

    function BuscaTotal(rCodTipDoc: Real; sCodTipRecDes, sRecPag: String;
                            rUnidNeg: Real; sCRespon,sCCusto: String): Real;

    function SubstSimb(sTexto: String): String;
    procedure AplicaFator;
    function ExtraiCor(iColuna,iLinha: Integer): TColor;
    procedure AssociaCor(iColuna, iLinha: Integer; sCor: String);
  public
    { Public declarations }
    bUsaOracle8i : Boolean;
    procedure Inicializa(sTipoFlx: String);
  end;

var
  frmConsultaFluxo: TfrmConsultaFluxo;
implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,uFuncaoGeral,uFuncoesdeImpressao,uIntegraBack,
     dReports,Math;

procedure TfrmConsultaFluxo.FormCreate(Sender: TObject);
begin
   inherited;

   ppRegisterForm(TppCustomPreviewer,tppPrintPreview);   

   sFluxo:='';
   rSaldo:=0;
   rSaldoBase:=0;
   dDataMin:=0;
   dDataMax:=0;
   iEspacoBase:=0;
   Cores:=TStringList.Create;
   CorSabDom:=TStringList.Create;
   bMostrouFluxo:=False;
   bSubSaldo:=False;
   bDesVermelho:=True;

   //Associa Cores a Legenda (Obs.: Sempre que alterar a cor aqui, alterar também em baixo)
   sCorRecComPrev:='clTeal';
   sCorRecSemPrev:='clBlue';
   sCorPgtoComPrev:='clFuchsia';
   sCorPgtoSemPrev:='clMaroon';

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

   //Carrega Parâmetros do Sistema
   qryAux.Close;
   qryAux.SQL.Text:='SELECT FLGEXIBECOLEXP,TITSALDOANT,TITSALDOTRANSP,FLGDESVERM FROM ParamFinanc '+
                    'WHERE (IDPESSOA='+IntToStr(Sistema.IdEmpresa)+')';
   qryAux.Open;
   bExpandeCol:=(QryAux.FieldByName('FLGEXIBECOLEXP').AsString='S');
   sTitSalAnterior:=QryAux.FieldByName('TITSALDOANT').AsString;
   sTipSalTransp:=QryAux.FieldByName('TITSALDOTRANSP').AsString;
   bDesVermelho:=(QryAux.FieldByName('FLGDESVERM').AsString='S');

   QryAux.Close;
   QryAux.SQL.Text:='SELECT BANNER AS VERSAOBANCO FROM v$version';
   QryAux.OPen;

   bUsaOracle8i:=False;
   bUsaOracle8i:=(Pos('8.1',QryAux.FieldByName('VERSAOBANCO').AsString)<>0);
   QryAux.Close;

   edFatorDivisaoMoeda.Value:=1;
end;

procedure TfrmConsultaFluxo.FormDestroy(Sender: TObject);
begin
   inherited;
   Cores.Free;
   CorSabDom.Free;
end;

procedure TfrmConsultaFluxo.Inicializa(sTipoFlx: String);
var
   sData  : String;
   dDataI : TDateTime;
   dDataF : TDateTime;
begin
   inherited;

   sTipoFluxo:=sTipoFlx;
   pnlLegenda.Visible:=(sTipoFluxo='P');

   //Verifica qual tipo de Fluxo corrente
   sData:='DATAPROGRAMADA';
   sFluxo:='FluxoPrevisto';
   if sTipoFluxo='R' then
    begin
       sData:='DATACFLOAT';
       sFluxo:='FluxoReal';
    end;

   qryDatasMinMax.Close;
   qryDatasMinMax.SQL.Text:=' SELECT  '+
                            '    Min('+sData+') AS DataInic, '+
                            '    Max('+sData+') AS DataFim '+
                            ' FROM  '+sFluxo+
                            ' WHERE '+
                            '   (IDPessoa = '+IntToStr(Sistema.IdEmpresa)+') AND '+
                            '   ('+sData+'<>To_Date(''01/01/1900'',''dd/mm/yyyy''))';
   qryDatasMinMax.Open;

   if sTipoFluxo='O' then sFluxo:='FluxoOrcado';

   dDataI:=qryDatasMinMaxDATAINIC.AsDateTime;
   dDataF:=qryDatasMinMaxDATAFIM.AsDateTime;

   if (sTipoFluxo='P') then
    begin
       deDatIni.Date:=dDataI+1;
       deDatFim.Date:=dDataF;
       Caption:='Consulta Fluxo de Caixa Previsto';
       pplblNomeRelat.Caption:='Fluxo de Caixa Previsto';
       rgCML.Enabled:=False;
    end;

   if (sTipoFluxo='O') then
    begin
       deDatIni.Date:=dDataI+1;
       deDatFim.Date:=dDataF;
       Caption:='Consulta Fluxo de Caixa Orçado';
       pplblNomeRelat.Caption:='Fluxo de Caixa Orçado';
       rgCML.Enabled:=True;
    end;

   if (sTipoFluxo='R') then
    begin
       deDatIni.Date:=Date-31;
       deDatFim.Date:=Date-1;
       Caption:='Consulta Fluxo de Caixa Realizado';
       pplblNomeRelat.Caption:='Fluxo de Caixa Realizado';
       rgCML.Enabled:=False;
    end;

   dDataMin:=deDatIni.Date;
   dDataMax:=deDatFim.Date;

   qryDatasMinMax.Close;

   pnlInformacoesFluxo.Caption:='Período Consultado: '+deDatIni.Text+' a '+deDatFim.Text;
   lblTitulo.Caption:=pnlInformacoesFluxo.Caption;

   sMascaraCAR:=IntegraBack.MascaraReceb;
   seGrauMaxCAR.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   //
   sMascaraCAP:=IntegraBack.MascaraDesemb;
   seGrauMaxCAP.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);

   //Exibe as Colunas do Fluxo
   GeraColunasFluxo;
   //Exibe Título das linhas do Fluxo
   ExibeTituloLinhas(True);
   //GeraNumTermos;
   FormActivate(nil);

   qryPatro.Open;
end;

procedure TfrmConsultaFluxo.FormActivate(Sender: TObject);
begin
   inherited;

   if sFluxo='' then Exit;

   //Ajusta Qry de Unidades de Negócio
   qryUnidNegoc.Close;
   qryUnidNegoc.SQL.Text:='SELECT Distinct '+
                          '   U.UnidNegoc, '+
                          '   U.Nome '+
                          'FROM '+
                              sFluxo+' F,'+
                          '   UnidNegocio U '+
                          'WHERE (F.UnidNegoc=U.UnidNegoc) AND '+
                          '      (U.IDPessoa = '+IntToStr(Sistema.IdEmpresa)+') '+
                          'ORDER BY U.Nome';
   qryUnidNegoc.Open;

   //Ajusta Qry de Centros de Responsabilidade
   qryCentroRespon.Close;
   qryCentroRespon.SQL.Text:='SELECT Distinct '+
                             '   C.CodCentroRespon, '+
                             '   C.Nome, '+
                             '   C.AnaliticoSintet '+
                             'FROM '+
                                 sFluxo+' F, '+
                             '   CentRespon C '+
                             'WHERE (F.CodCentroRespon=C.CodCentroRespon) AND '+
                             '      (F.CodCentroRespon<>''9999999999'') AND '+
                             '      (F.IDPessoa = '+IntToStr(Sistema.IdEmpresa)+') AND '+
                             '      (F.IDPessoa = C.IDPessoa) '+
                             'ORDER BY C.Nome';
   qryCentroRespon.Open;

   qryCentroCusto.Close;
   qryCentroCusto.SQL.Text:='SELECT Distinct '+
                            '   C.CodCentroCusto, '+
                            '   C.Nome '+
                            'FROM '+
                                sFluxo+' F, '+
                            '   CENTCUST C '+
                            'WHERE (F.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND '+
                            '      (C.IDEMPRESA = F.IDPESSOA) AND '+
                            '      (F.CODCENTROCUSTO=C.CODCENTROCUSTO) ';
   qryCentroCusto.Open;

   qryPlanoPrev.Close;
   qryPlanoPrev.Open;

   sMascaraCAR:=IntegraBack.MascaraReceb;
   seGrauMaxCAR.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   //
   sMascaraCAP:=IntegraBack.MascaraDesemb;
   seGrauMaxCAP.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);

end;

procedure TfrmConsultaFluxo.bbtnMostrarFluxoClick(Sender: TObject);
var
   iColuna : Integer;
begin
   inherited;
   iColuna:=1;

   prgBarAtuFluxo.Position:=0;
   prgBarExibicao.Position:=0;

   pnlProgresso.BringToFront;

   rSaldoBase:=GeraSaldoInicial;
   rSaldo:=rSaldoBase;

   GeraColunasFluxo;
   ExibeTituloLinhas(False);
   
   prgBarAtuFluxo.Max:=qryColunasFluxo.RecordCount;
   prgBarAtuFluxo.Visible:=True;
   prgBarExibicao.Visible:=True;

   qryColunasFluxo.First;
   while not(qryColunasFluxo.Eof) do
   begin
      //GeraTotais(qryColunasFluxoDATAINICIAL.AsDateTime,qryColunasFluxoDATAFINAL.AsDateTime);
      GeraDadosFluxo(qryColunasFluxoDATAINICIAL.AsDateTime,qryColunasFluxoDATAFINAL.AsDateTime,True);
      ExibeDadosFluxo(iColuna);
      Inc(iColuna);
      qryColunasFluxo.Next;
      prgBarAtuFluxo.StepIt;
      sgFluxo.Refresh;
   end;

   prgBarAtuFluxo.Position:=prgBarAtuFluxo.Max;
   prgBarExibicao.Position:=prgBarExibicao.Max;

   pnlProgresso.SendToBack;
end;

procedure TfrmConsultaFluxo.sgFluxoDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   Cor : TColor;
   iPosicaoInicial : Integer;
begin
  inherited;
   if (CorSabDom.IndexOf(IntToStr(ACol)+',0')<>-1) and (ARow>1) then
       sgFluxo.Canvas.Brush.Color:=$00B9FFFF;

   Cor:=ExtraiCor(ACol,ARow);

   if (Pos('(',sgFluxo.Cells[Acol,ARow])<>0) and
      (bDesVermelho) and (Cor=clBlack) then  //Testa se valor é negativo. Caso seja,
      Cor:=clRed;                            //Muda a cor para Vermelho.

   sgFluxo.Canvas.Font.Color:=Cor;

   iPosicaoInicial:=rect.Right-sgFluxo.Canvas.TextWidth(sgFluxo.Cells[ACol,ARow])-2;
   if iPosicaoInicial<rect.Left then iPosicaoInicial:=rect.Left;

   sgFluxo.Canvas.FillRect(rect);
   if (ACol=0) or (ARow=0) or (ARow=1) then
      sgFluxo.Canvas.TextOut(rect.Left,rect.Top,sgFluxo.Cells[ACol,ARow])
   else
      sgFluxo.Canvas.TextOut(iPosicaoInicial,rect.Top,sgFluxo.Cells[ACol,ARow]);
end;

procedure TfrmConsultaFluxo.sgFluxoDblClick(Sender: TObject);
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

procedure TfrmConsultaFluxo.trkbLarguraTituloChange(Sender: TObject);
begin
   sgFluxo.ColWidths[0]:=200+Trunc((350*trkbLarguraTitulo.Position)/trkbLarguraTitulo.Max);
end;

procedure TfrmConsultaFluxo.LimpaCelulasDados;
var
   lin,col:Integer;
begin
   for col := 1 to (sgFluxo.ColCount) do
       for lin := 2 to (sgFluxo.RowCount) do
           sgFluxo.Cells[Col,Lin]:='';
end;

procedure TfrmConsultaFluxo.LimpaCelulasGerais;
var
   lin,col:Integer;
begin
  for col := 1 to (sgFluxo.ColCount) do
      for lin := 0 to (sgFluxo.RowCount) do
          sgFluxo.Cells[Col,Lin]:='';
end;

procedure TfrmConsultaFluxo.seGrauMaxChange(Sender: TObject);
begin
   ExibeTituloLinhas(False);
end;

procedure TfrmConsultaFluxo.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  CarregaQryImpressao;
  rpImp.Print;
end;

procedure TfrmConsultaFluxo.rgAnaSintClick(Sender: TObject);
begin
  inherited;

  gbGrauMaximo.Enabled:=(rgAnaSint.ItemIndex=0);

  if not(gbGrauMaximo.Enabled) then
   begin
      seGrauMaxCAR.Value:=1;
      seGrauMaxCAP.Value:=1;
   end;

  ExibeTituloLinhas(False);
end;

procedure TfrmConsultaFluxo.rgQuebraClick(Sender: TObject);
begin
   if rgQuebra.ItemIndex=0 then
      iEspacoBase:=0
   else
      iEspacoBase:=4;
   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxo.rgDSMClick(Sender: TObject);
begin
   if (ActiveControl<>cbExibeSabDom) then cbExibeSabDom.Enabled:=(rgDSM.ItemIndex=0);
   GeraColunasFluxo;
end;

procedure TfrmConsultaFluxo.cbZeradoClick(Sender: TObject);
begin
   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxo.dblcCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxo.dblcPatrocinadorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxo.edFatorDivisaoMoedaExit(Sender: TObject);
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

procedure TfrmConsultaFluxo.deDataCloseUp(Sender: TObject);
begin
   if sTipoFluxo='P' then
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

end;

procedure TfrmConsultaFluxo.gbDatasExit(Sender: TObject);
begin
   if deDatIni.Date>deDatFim.Date then deDatFim.Date:=deDatIni.Date;
   pnlInformacoesFluxo.Caption:='Periodo Consultado: '+
                          FormatDateTime('dd/mm/yyyy',deDatIni.Date)+' a '+
                          FormatDateTime('dd/mm/yyyy',deDatFim.Date);
   lblTitulo.Caption:=pnlInformacoesFluxo.Caption;
   GeraNumTermos;
   GeraColunasFluxo;
   ExibeTituloLinhas(True);
end;

procedure TfrmConsultaFluxo.GeraDadosFluxo(dDataInicial,dDataFinal: TDateTime;
bCalcular: Boolean);
begin
   qryLinhasFluxo.Close;
   qryLinhasFluxo.SQL.Clear;

   //Montagem da Query
   with qryLinhasFluxo.SQL do
   begin
      Add('SELECT ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      if not(bUsaOracle8i) then
         case rgQuebra.ItemIndex of
            1: begin
                  Add('   LF.UnidNegoc, ');
                  Add('   LF.UnidadeNeg, ');
               end;
            2: begin
                  Add('   LF.CodCentroRespon, ');
                  Add('   LF.Nome, ');
               end;
            3: begin
                  Add('   LF.CodCentroCusto, ');
                  Add('   LF.Nome, ');
               end;
         end
      else
         case rgQuebra.ItemIndex of
            1: begin
                  Add('   UN.UnidNegoc, ');
                  Add('   UN.Nome AS UnidadeNeg, ');
               end;
            2: begin
                  Add('   CR.CodCentroRespon, ');
                  Add('   CR.Nome, ');
               end;
            3: begin
                  Add('   CC.CodCentroCusto, ');
                  Add('   CC.Nome, ');
               end;
         end;

      Add('   LF.ORDEM, ');
      Add('   LF.POSICAO, ');
      Add('   LF.CODLINHAFLUXO, ');
      Add('   LF.CODCOMPLINHA, ');
      Add('   LF.LINHAFLUXO, ');
      Add('   LF.CODTIPRECDES, ');
      Add('   LF.CODTIPDOC, ');
      Add('   LF.RECPAG, ');
      Add('   LF.NUMCARCODTRD, ');
      Add('   LF.TIPOCALCULO, ');
      Add('   LF.FLGACUMULA, ');
      Add('   LF.POSICAOTOTAL, ');

      if bCalcular then
       begin
          if bUsaOracle8i then //Estrutura para Oracle mair igual a 8.0i
           begin
              //Estrutura que efetua os cálculos básicos
              Add('   (DECODE(LF.RECPAG,''R'',1,null,0,-1) * ');
              Add('         (SELECT Sum(Flx.Valor) ');
              Add('          FROM '+sFluxo+' Flx ');
              MontaFiltroTotalizador(qryLinhasFluxo,dDataInicial,dDataFinal,True);
              Add('         )) AS TOTAL, ');

              //Estrutura que gera as cores
              if (sTipoFluxo='P') then
               begin
                  Add('   DECODE(LF.RECPAG,''R'', ');
                  Add('    DECODE((SELECT COUNT(*) ');
                  Add('          FROM '+sFluxo+' Flx ');
                  MontaFiltroTotalizador(qryLinhasFluxo,dDataInicial,dDataFinal,True);
                  Add('                AND (Flx.FLGPREVISAO=''S'') ');
                  Add('			   ),0, '''+sCorRecSemPrev+''', '''+sCorRecComPrev+'''), ');
                  Add('                    ''P'', ');
                  Add('    DECODE((SELECT COUNT(*) ');
                  Add('          FROM FluxoPrevisto Flx ');
                  MontaFiltroTotalizador(qryLinhasFluxo,dDataInicial,dDataFinal,True);
                  Add('                AND (Flx.FLGPREVISAO=''S'') ');
                  Add('			   ),0, '''+sCorPgtoSemPrev+''', '''+sCorPgtoComPrev+'''), ');
                  Add('			    Null,''clBlack'') AS CORCAMPO, ');
                end
               else
                Add('   ''clBlack'' AS CORCAMPO, ');
           end
          else
           begin
              Add('   DECODE(LF.TIPOCALCULO,''R'',TOTTRD.Total,''P'',TotTRD.Total, '+
                                           '''C'',TOTTDOC.Total,''D'',TotTDOC.Total ) AS TOTAL, ');

              if (sTipoFluxo='P') then
               begin
                  Add('   DECODE(LF.TIPOCALCULO,''C'',DECODE(QtdePrevTDOC.NumTermComPrev,null,'''+
                                                sCorRecSemPrev+''','''+sCorRecComPrev+'''),');
                  Add('                         ''D'',DECODE(QtdePrevTDOC.NumTermComPrev,null,'''+
                                                sCorPgtoSemPrev+''','''+sCorPgtoComPrev+'''),');
                  Add('                         ''R'',DECODE(QtdePrevTRD.NumTermComPrev,null,'''+
                                                sCorRecSemPrev+''','''+sCorRecComPrev+'''),');
                  Add('                         ''P'',DECODE(QtdePrevTRD.NumTermComPrev,null,'''+
                           sCorPgtoSemPrev+''','''+sCorPgtoComPrev+'''),''clBlack'')AS CORCAMPO, ');
               end
              else
                 Add('   ''clBlack'' AS CORCAMPO, ');

              //Add('   0 AS TOTAL, ');
              //Add('   ''123456789'' AS CORCAMPO, ');
           end;
       end
      else
       begin
          Add('   0 AS TOTAL, ');
          Add('   ''clBlack'' AS CORCAMPO, ');
       end;

      //Estrutura para filtragem das Linhas Zeradas
      if bUsaOracle8i then
       begin
          Add('   (SELECT ');
          Add('       COUNT(*) ');
          Add('    FROM '+sFluxo+' Flx ');
          Add('    WHERE ');
          Add('       ((((SubStr(Flx.CodTipRecDes,1,Length(RTrim(LF.CODTIPRECDES)))=RTrim(LF.CODTIPRECDES)) AND ');
          Add('          (Flx.RecPag=LF.RecPag)) OR ');
          Add('         ((Flx.CODTIPDOC=LF.CODTIPDOC) AND NOT (LF.CODTIPDOC is null) AND ');
          Add('          (LF.CODTIPDOC<>0))) AND (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL)) ');

          if (sTipoFluxo='P') or (sTipoFluxo='O') then
           begin
              Add('                AND (Flx.DATAPROGRAMADA>=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatIni.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ');
              Add('                AND (Flx.DATAPROGRAMADA<=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatFim.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ) AS NUMTERMOS, ');
           end
          else
           begin
              Add('                AND (Flx.DATACFLOAT>=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatIni.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ');
              Add('                AND (Flx.DATACFLOAT<=To_Date( '+
                   #39+FormatDateTime('dd/mm/yyyy',deDatFim.Date)+#39+', '+
                   #39+'DD/MM/YYYY'+#39+')) ) AS NUMTERMOS, ');
           end;
       end
      else
       Add('   DECODE(LF.TIPOCALCULO,''R'',NumTRD.NaoZerados,'+
                                    '''P'',NumTRD.NaoZerados,'+
                                    '''C'',NumTDOC.NaoZerados,'+
                                    '''D'',NumTDOC.NaoZerados,0) AS NUMTERMOS, ');
       //Add('   -1 AS NUMTERMOS, ');

      Add('   LF.LINHATOTAL ');
      Add('FROM ');

      if not(bUsaOracle8i) and (rgQuebra.ItemIndex<>0) then
       begin
          Add('   (SELECT ');
          case rgQuebra.ItemIndex of
             1: begin
                   Add('       UN.UnidNegoc, ');
                   Add('       UN.Nome AS UnidadeNeg, ');
                end;
             2: begin
                   Add('       CR.CodCentroRespon, ');
                   Add('       CR.Nome, ');
                end;
             3: begin
                   Add('       CC.CodCentroCusto, ');
                   Add('       CC.Nome, ');
                end;
          end;

          Add('       LF1.ORDEM, ');
          Add('       LF1.POSICAO, ');
          Add('       LF1.CODLINHAFLUXO, ');
          Add('       LF1.CODCOMPLINHA, ');
          Add('       LF1.LINHAFLUXO, ');
          Add('       LF1.CODTIPRECDES, ');
          Add('       LF1.CODTIPDOC, ');
          Add('       LF1.RECPAG, ');
          Add('       LF1.NUMCARCODTRD, ');
          Add('       LF1.TIPOCALCULO, ');
          Add('       LF1.FLGACUMULA, ');
          Add('       LF1.POSICAOTOTAL, ');
          Add('       LF1.LINHATOTAL ');
          Add('    FROM ');
       end;

      // Estrutrura que fornece as Linhas Sintéticas
      Add('    -- Linhas do MontaFluxo ');
      Add('       (SELECT ');
      Add('           M.ORDEM, ');
      Add('           DECODE(M.POSICAOTOTAL,''I'',''A'',''Z'') AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           M.CODLINHAFLUXO AS CODCOMPLINHA, ');
      Add('           M.DESCRICAO AS LINHAFLUXO, ');
      Add('           null AS CODTIPRECDES, ');
      Add('           0 AS CODTIPDOC, ');
      Add('           null AS RECPAG, ');
      Add('           0 AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           DECODE(M.TIPOCALCULO,''T'',null,''#'') AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Linhas do Fluxo Analítico
      Add('    -- Linhas do CompFluxo ');
      Add('        SELECT ');
      Add('           M.ORDEM, ');
      Add('           ''T'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           SubStr(''                    '',1,Length(RTrim(C.CODTIPRECDES)))'+
                             '||T.DESCRICAO AS LINHAFLUXO, ');
      Add('           C.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           DECODE(Length(RTrim(C.CODTIPRECDES)),null,0,Length(RTrim(C.CODTIPRECDES))) '+
                      'AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''S'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M, ');
      Add('           COMPFLUXO C, ');
      Add('           TIPORECEBDESEMB T ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('           (C.CODTIPRECDES=T.CODTIPRECDES(+)) AND ');
      Add('           (C.RECPAG=T.RECPAG(+)) AND ');
      Add('           (C.IDPESSOA=T.IDPESSOA(+)) AND ');
      Add('           (M.TIPOCALCULO<>''C'') AND ');
      Add('           (M.TIPOCALCULO<>''D'') ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Sub-Linhas do Fluxo Analítico
      Add('    -- Sub-Linhas do CompFluxo ');
      Add('        SELECT ');
      Add('           M.ORDEM, ');
      Add('           ''T'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           SubStr(''                    '',1,Length(RTrim(T.CODTIPRECDES)))||'+
                             'T.DESCRICAO AS LINHAFLUXO, ');
      Add('           T.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           DECODE(Length(RTrim(T.CODTIPRECDES)),null,0,Length(RTrim(T.CODTIPRECDES))) '+
                                    'AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''N'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           TIPORECEBDESEMB T, ');
      Add('           COMPFLUXO C, ');
      Add('           MONTAFLUXO M ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('           (RTrim(C.CODTIPRECDES)=SubStr(RTrim(T.CODTIPRECDES),1,Length(RTrim(C.CODTIPRECDES)))) AND ');
      Add('           (RTrim(C.CODTIPRECDES)<>RTrim(T.CODTIPRECDES)) AND ');
      Add('           (C.RECPAG = T.RECPAG) AND ');
      Add('           (T.IDPESSOA = C.IDPESSOA) AND ');
      Add('           (M.TIPOCALCULO<>''C'') AND ');
      Add('           (M.TIPOCALCULO<>''D'') ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Linhas por Tipo de Documento
      Add('     -- Linhas da Montagem por Codigo de Tipo de Documento ');
      Add('        SELECT ');
      Add('           M.ORDEM, ');
      Add('           ''D'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           ''    ''||T.DESCRICAO AS LINHAFLUXO, ');
      Add('           C.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           0 AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''S'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M, ');
      Add('           COMPFLUXO C, ');
      Add('           TIPODOCRECPAG T ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');

      if not(bUsaOracle8i) and (rgQuebra.ItemIndex<>0) then
         Add('           (T.CODTIPDOC = C.CODTIPDOC)) LF1 ')
      else
         Add('           (T.CODTIPDOC = C.CODTIPDOC)) LF ');

      //Estrutura para quebra por Unidade de Negócio, Centro de Responsabilidade  ou
      //Centro de Custo
      case rgQuebra.ItemIndex of
         1: begin
               Add('       ,(Select Distinct ');
               Add('            D.UnidNegoc, ');
               Add('            D.Nome ');
               Add('         From '+sFluxo+' C, UnidNegocio D ');
               Add('         Where (C.UnidNegoc=D.UnidNegoc) AND ');
               Add('               (C.IDPessoa='+IntToStr(Sistema.IdEmpresa)+') ');
               if (Trim(dblcUnidNegoc.Text)<>'') then
                  Add('               AND (D.UnidNegoc='+dblcUnidNegoc.LookupValue+') ');
               Add('         Order by D.Nome) UN ');
            end;
         2: begin
               Add('       ,(Select Distinct ');
               Add('            C.CodCentroRespon, ');
               Add('            C.Nome ');
               Add('         From '+sFluxo+' F, CentRespon C ');
               Add('         Where (F.CodCentroRespon=C.CodCentroRespon) AND ');
               Add('               (F.CodCentroRespon<>''9999999999'') AND ');
               Add('               (F.IDPessoa='+IntToStr(Sistema.IdEmpresa)+') ');
               if (Trim(dblcCentroRespon.Text)<>'') then
                  Add('                AND (RTrim(C.CodCentroRespon)='+#39+
                      Trim(dblcCentroRespon.LookupValue)+#39+') ');
               Add('         Order by C.Nome) CR ');
            end;
         3: begin
               Add('       ,(Select Distinct ');
               Add('            C.CodCentroCusto, ');
               Add('            C.Nome ');
               Add('         From '+sFluxo+' F, CentCust C ');
               Add('         Where (F.CodCentroCusto=C.CodCentroCusto) AND ');
               Add('               (F.IDPessoa='+IntToStr(Sistema.IdEmpresa)+') ');
               if (Trim(dblcCentroCusto.Text)<>'') then
                  Add('               AND (RTrim(C.CodCentroCusto)='+#39+
                      Trim(dblcCentroCusto.LookupValue)+#39+') ');
               Add('         Order by C.Nome) CC ');
            end;
      end;

      if not(bUsaOracle8i) and (rgQuebra.ItemIndex<>0) then
         Add('                                          ) LF ');

      if not(bUsaOracle8i) then
       begin
          //Estrutura para geração do Número de termos não zerados de um TRD
          Add('   ,(SELECT ');
          case rgQuebra.ItemIndex of
             1: Add('        Flx.UnidNegoc, ');
             2: Add('        Flx.CodCentroRespon, ');
             3: Add('        Flx.CodCentroCusto, ');
          end;

          Add('        TRD.CodTipRecDes, ');
          Add('        TRD.RecPag, ');
          Add('        COUNT(*) AS NaoZerados ');
          Add('     FROM '+sFluxo+' Flx, ');
          Add('          TIPORECEBDESEMB TRD ');
          Add('     WHERE ');
          Add('        (Flx.IDPessoa = '+FloatToStr(Sistema.IdEmpresa)+') AND ');
          Add('        (Flx.IDPessoa = TRD.IDPessoa) AND ');
          Add('        (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))=RTrim(TRD.CODTIPRECDES)) AND ');
          Add('        (Flx.RecPag=TRD.RecPag) AND ');
          Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltroNumTermos(qryLinhasFluxo,deDatIni.Date,deDatFim.Date,True);

          case rgQuebra.ItemIndex of
             0: Add('     GROUP BY TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
             1: Add('     GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
             2: Add('     GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
             3: Add('     GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag) NumTRD, ');
          end;

          //Estrutura para geração do Número de termos não zerados de um TDOC
          Add('   (SELECT ');
          case rgQuebra.ItemIndex of
             1: Add('        Flx.UnidNegoc, ');
             2: Add('        Flx.CodCentroRespon, ');
             3: Add('        Flx.CodCentroCusto, ');
          end;

          Add('        TDOC.CodTipDoc, ');
          Add('        TDOC.RecPag, ');
          Add('        COUNT(*) AS NaoZerados ');
          Add('     FROM '+sFluxo+' Flx, ');
          Add('          TIPODOCRECPAG TDOC ');
          Add('     WHERE ');
          Add('        (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
          Add('        NOT (TDOC.CODTIPDOC is null) AND ');
          Add('        (TDOC.CODTIPDOC<>0) AND ');
          Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltroNumTermos(qryLinhasFluxo,deDatIni.Date,deDatFim.Date,True);

          case rgQuebra.ItemIndex of
             0: Add('    GROUP BY TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
             1: Add('    GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
             2: Add('    GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
             3: Add('    GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) NumTDOC ');
          end;
       end;

      //Estrutura de Geração de Valores
      if not(bUsaOracle8i) and bCalcular then
       begin
          //Estrutura de Geração de Total dos Tipos de Rec/Des (TRD)
          Add('   ,(SELECT ');
          case rgQuebra.ItemIndex of
             1: Add('         Flx.UnidNegoc, ');
             2: Add('         Flx.CodCentroRespon, ');
             3: Add('         Flx.CodCentroCusto, ');
          end;

          Add('         TRD.CodTipRecDes, ');
          Add('         TRD.RecPag, ');
          Add('         Sum(DECODE(TRD.RecPag,''R'',Flx.Valor,-Flx.Valor)) AS TOTAL ');
          Add('      FROM '+sFluxo+' Flx, ');
          Add('           TIPORECEBDESEMB TRD ');
          Add('      WHERE ');
          Add('         (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))='+
              'RTrim(TRD.CODTIPRECDES)) AND ');
          Add('         (Flx.RecPag=TRD.RecPag) AND ');
          Add('         (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltroNumTermos(qryLinhasFluxo,dDataInicial,dDataFinal,True);

          case rgQuebra.ItemIndex of
             0: Add('      GROUP BY TRD.CodTipRecDes, TRD.RecPag) TotTRD ');
             1: Add('      GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag) TotTRD ');
             2: Add('      GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag) TotTRD ');
             3: Add('      GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag) TotTRD ');
          end;

          //Estrutura de Geração de Totais dos Tipos Documento  (TDOC)
          Add('   ,(SELECT ');
          case rgQuebra.ItemIndex of
             1: Add('       Flx.UnidNegoc, ');
             2: Add('       Flx.CodCentroRespon, ');
             3: Add('       Flx.CodCentroCusto, ');
          end;

          Add('       TDOC.CodTipDoc, ');
          Add('       TDOC.RecPag, ');
          Add('       Sum(DECODE(TDOC.RecPag,''R'',Flx.Valor,-Flx.Valor)) AS TOTAL ');
          Add('    FROM '+sFluxo+' Flx, ');
          Add('         TIPODOCRECPAG TDOC ');
          Add('    WHERE ');
          Add('       (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
          Add('       NOT (TDOC.CODTIPDOC is null) AND ');
          Add('       (TDOC.CODTIPDOC<>0) AND ');
          Add('       (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltroNumTermos(qryLinhasFluxo,dDataInicial,dDataFinal,True);

          case rgQuebra.ItemIndex of
             0: Add('    GROUP BY TDOC.CodTipDoc, TDOC.RecPag) TotTDOC ');
             1: Add('    GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');
             2: Add('    GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');
             3: Add('    GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');
          end;

          //Estrutura de Geração de Cores dos Tipos de Documento
          if (sTipoFluxo='P') then
           begin
              Add('   ,(SELECT ');
              case rgQuebra.ItemIndex of
                 1: Add('         Flx.UnidNegoc, ');
                 2: Add('         Flx.CodCentroRespon, ');
                 3: Add('         Flx.CodCentroCusto, ');
              end;
              Add('         TRD.CodTipRecDes, ');
              Add('         TRD.RecPag, ');
              Add('         Count(*) AS NumTermComPrev ');
              Add('      FROM FluxoPrevisto Flx, ');
              Add('           TIPORECEBDESEMB TRD ');
              Add('      WHERE ');
              Add('         (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))='+
                  'RTrim(TRD.CODTIPRECDES)) AND ');
              Add('         (Flx.RecPag=TRD.RecPag) AND ');
              Add('         (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) AND ');
              Add('         (Flx.FLGPREVISAO=''S'') ');

              MontaFiltroNumTermos(qryLinhasFluxo,dDataInicial,dDataFinal,True);

              case rgQuebra.ItemIndex of
                 0: Add('      GROUP BY TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');
                 1: Add('      GROUP BY Flx.UnidNegoc, TRD.CODTIPDOC, TRD.RecPag) QtdePrevTRD ');
                 2: Add('      GROUP BY Flx.CodCentroRespon, TRD.CODTIPDOC, TRD.RecPag) QtdePrevTRD ');
                 3: Add('      GROUP BY Flx.CodCentroCusto, TRD.CODTIPDOC, TRD.RecPag) QtdePrevTRD ');
              end;

              Add('   ,(SELECT ');
              case rgQuebra.ItemIndex of
                 1: Add('       Flx.UnidNegoc, ');
                 2: Add('       Flx.CodCentroRespon, ');
                 3: Add('       Flx.CodCentroCusto, ');
              end;
              Add('       TDOC.CodTipDoc, ');
              Add('       TDOC.RecPag, ');
              Add('       Count(*) AS NumTermComPrev ');
              Add('    FROM FluxoPrevisto Flx, ');
              Add('         TIPODOCRECPAG TDOC ');
              Add('    WHERE ');
              Add('       (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
              Add('       NOT (TDOC.CODTIPDOC is null) AND ');
              Add('       (TDOC.CODTIPDOC<>0) AND ');
              Add('       (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) AND ');
              Add('       (Flx.FLGPREVISAO=''S'') ');

              MontaFiltroNumTermos(qryLinhasFluxo,dDataInicial,dDataFinal,True);

              case rgQuebra.ItemIndex of
                 0: Add('    GROUP BY TDOC.CodTipDoc, TDOC.RecPag) QtdePrevTDOC ');
                 1: Add('    GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
                 2: Add('    GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
                 3: Add('    GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
              end;
           end;
       end;

///////////////////

      if not(bUsaOracle8i) then
       begin
          Add('WHERE ');
          Add('   (LF.CodTipRecDes=NumTRD.CodTipRecDes(+)) AND ');
          Add('   (LF.RecPag=NumTRD.RecPag(+)) AND ');
          Add('   (LF.CodTipDoc=NumTDOC.CodTipDoc(+)) AND ');
          Add('   (LF.RecPag=NumTDOC.RecPag(+)) ');

          case rgQuebra.ItemIndex of
             1: begin
                   Add('   AND (LF.UnidNegoc=NumTRD.UnidNegoc(+)) ');
                   Add('   AND (LF.UnidNegoc=NumTDOC.UnidNegoc(+)) ');
                end;
             2: begin
                   Add('   AND (LF.CodCentroRespon=NumTRD.CodCentroRespon(+)) ');
                   Add('   AND (LF.CodCentroRespon=NumTDOC.CodCentroRespon(+)) ');
                end;
             3: begin
                   Add('   AND (LF.CodCentroCusto=NumTRD.CodCentroCusto(+)) ');
                   Add('   AND (LF.CodCentroCusto=NumTDOC.CodCentroCusto(+)) ');
                end;
          end;
       end;

      if not(bUsaOracle8i) and bCalcular then
       begin
          Add('   AND (LF.CodTipRecDes=TOTTRD.CodTipRecDes(+)) ');
          Add('   AND (LF.RecPag=TOTTRD.RecPag(+)) ');
          Add('   AND (LF.CodTipDoc=TOTTDOC.CodTipDoc(+)) ');
          Add('   AND (LF.RecPag=TOTTDOC.RecPag(+)) ');

          if (sTipoFluxo='P') then
           begin
              Add('   AND (LF.CodTipRecDes=QtdePrevTRD.CodTipRecDes(+)) ');
              Add('   AND (LF.RecPag=QtdePrevTRD.RecPag(+))  ');
              Add('   AND (LF.CodTipDoc=QtdePrevTDOC.CodTipDoc(+)) ');
              Add('   AND (LF.RecPag=QtdePrevTDOC.RecPag(+)) ');
           end;

          case rgQuebra.ItemIndex of
             1: begin
                   Add('   AND (LF.UnidNegoc=TotTRD.UnidNegoc(+)) ');
                   Add('   AND (LF.UnidNegoc=TotTDOC.UnidNegoc(+)) ');
                   if (sTipoFluxo='P') then
                      Add('   AND (LF.UnidNegoc=QtdePrevTRD.UnidNegoc(+)) ');
                end;
             2: begin
                   Add('   AND (LF.CodCentroRespon=TotTRD.CodCentroRespon(+)) ');
                   Add('   AND (LF.CodCentroRespon=TotTDOC.CodCentroRespon(+)) ');
                   if (sTipoFluxo='P') then
                      Add('   AND (LF.CodCentroRespon=QtdePrevTRD.CodCentroRespon(+)) ');
                end;
             3: begin
                   Add('   AND (LF.CodCentroCusto=TotTRD.CodCentroCusto(+)) ');
                   Add('   AND (LF.CodCentroCusto=TotTDOC.CodCentroCusto(+)) ');
                   if (sTipoFluxo='P') then
                      Add('   AND (LF.CodCentroCusto=QtdePrevTRD.CodCentroCusto(+)) ');
                end;
          end;
       end;
       
///////////////////

      Add('ORDER BY ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      if not(bUsaOracle8i) then
       case rgQuebra.ItemIndex of
          1: Add('   LF.UnidNegoc, ');
          2: Add('   LF.CodCentroRespon, ');
          3: Add('   LF.CodCentroCusto, ');
       end
      else
       case rgQuebra.ItemIndex of
          1: Add('   UN.UnidNegoc, ');
          2: Add('   CR.CodCentroRespon, ');
          3: Add('   CC.CodCentroCusto, ');
       end;

      Add('   LF.ORDEM, ');
      Add('   LF.POSICAO, ');
      Add('   LF.CODTIPRECDES ');
   end;
   //qryLinhasFluxo.sql.SaveToFile('C:\qrylinha.sql');
   qryLinhasFluxo.sql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\qrylinha.sql');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
   qryLinhasFluxo.Open;

   // Gera Totais e Cores dos Recebimentos/Desembolsos para versões Oracle < 8.0i
   if (bCalcular) then
      if bUsaOracle8i then
         CalculaSomatorios(dDataInicial,dDataFinal)
      else
       begin
          {qryLinhasFluxo.First;
          while not(qryLinhasFluxo.Eof) do
          begin
             //Gera as Cores dos Recebimentos/Desembolsos
             if (not(qryLinhasFluxo.FieldByName('CODTIPRECDES').IsNull) or
                 (qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat<>0)) then
                 GeraCoresRecDes(dDataInicial,dDataFinal);

             qryLinhasFluxo.Next;
          end;}
          CalculaSomatorios(dDataInicial,dDataFinal);
       end;

   qryLinhasFluxo.First;

end;

procedure TfrmConsultaFluxo.MontaFiltroTotalizador(qry: TQuery; dDataInicial,dDataFinal: TDateTime;
bUsaData: Boolean);
begin
   with qry.SQL do
   begin
      Add('          WHERE (Flx.IDPESSOA='+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('                (((Substr(Flx.CODTIPRECDES,1, ');
      Add('                     Length(RTrim(LF.CODTIPRECDES)))=RTrim(LF.CODTIPRECDES)) AND ');
      Add('                (Flx.RECPAG=LF.RECPAG)) OR ');
      Add('                ((Flx.CODTIPDOC=LF.CODTIPDOC) AND NOT (LF.CODTIPDOC is null) AND ');
      Add('                 (LF.CODTIPDOC<>0))) ');

     //Estrutura de Filtragem por Unid. Neg, Centr. Resp., Centr. Custo e Plano
     if (Trim(dblcUnidNegoc.Text)<>'') and (rgQuebra.ItemIndex<>1) then
        Add('                AND (Flx.UnidNegoc='+dblcUnidNegoc.LookupValue+') ');

     if (Trim(dblcCentroRespon.Text)<>'') and (rgQuebra.ItemIndex<>2) then
        Add('                AND (RTrim(Flx.CodCentroRespon)='+#39+
            Trim(dblcCentroRespon.LookupValue)+#39+') ');

     if (Trim(dblcCentroCusto.Text)<>'') and (rgQuebra.ItemIndex<>3) then
        Add('                AND (RTrim(Flx.CodCentroCusto)='+#39+
            Trim(dblcCentroCusto.LookupValue)+#39+') ');
            
     if (Trim(dblcPlanoPrev.Text)<>'') then
        Add('                AND (Flx.IDPLANOPREV='+Trim(dblcPlanoPrev.LookupValue)+') ');
     if (Trim(dblcPatrocinador.Text)<>'') then
        Add('                AND (Flx.IDPATRO='+Trim(dblcPatrocinador.LookupValue)+') ');


     //Estrutura para quebra por Unidade de Negócio, Centro de Responsabilidade ou Centro de Custo
     case rgQuebra.ItemIndex of
        1: Add('                AND (Flx.UnidNegoc=UN.UnidNegoc) ');
        2: Add('                AND (Flx.CodCentroRespon=CR.CodCentroRespon) ');
        3: Add('                AND (Flx.CodCentroCusto=CC.CodCentroCusto) ');
     end;

     //Estrutura de Filtragem por data
     if bUsaData then
      begin
         if (sTipoFluxo='P') or (sTipoFluxo='O') then
          begin
             Add('                AND (Flx.DATAPROGRAMADA>=To_Date( '+
                  #39+FormatDateTime('dd/mm/yyyy',dDataInicial)+#39+', '+
                  #39+'DD/MM/YYYY'+#39+')) ');
             Add('                AND (Flx.DATAPROGRAMADA<=To_Date( '+
                  #39+FormatDateTime('dd/mm/yyyy',dDataFinal)+#39+', '+
                  #39+'DD/MM/YYYY'+#39+')) ');
          end
         else
          begin
             Add('                AND (Flx.DATACFLOAT>=To_Date( '+
                  #39+FormatDateTime('dd/mm/yyyy',dDataInicial)+#39+', '+
                  #39+'DD/MM/YYYY'+#39+')) ');
             Add('                AND (Flx.DATACFLOAT<=To_Date( '+
                  #39+FormatDateTime('dd/mm/yyyy',dDataFinal)+#39+', '+
                  #39+'DD/MM/YYYY'+#39+')) ');
          end;
      end;

     //Estrutura para filtragem por Prazo
     if (sTipoFluxo='O') then
      begin
         case rgCML.ItemIndex of
            0: Add('                AND (Flx.Prazo=''C'') ');
            1: Add('                AND (Flx.Prazo=''M'') ');
            2: Add('                AND (Flx.Prazo=''L'') ');
         end;
      end;
   end;
end;

procedure TfrmConsultaFluxo.GeraTotalRecDes(dDataInicial,dDataFinal: TDateTime);
var
   rTotal : Real;
begin
   QryAux.Close;
   with QryAux.SQL do
   begin
      Clear;
      Add('SELECT ');
      Add('   Sum(Flx.Valor) AS TOTAL ');
      Add('FROM '+sFluxo+' Flx ');
      Add('    WHERE (Flx.IDPESSOA='+IntToStr(Sistema.IdEmpresa)+') AND ');
      Add('          (((Substr(Flx.CODTIPRECDES,1, ');
      Add('                    Length('''+Trim(qryLinhasFluxo.FieldByName('CODTIPRECDES').AsString)+'''))='''+
                                 Trim(qryLinhasFluxo.FieldByName('CODTIPRECDES').AsString)+''') AND ');
      Add('           (Flx.RECPAG='''+Trim(qryLinhasFluxo.FieldByName('RECPAG').AsString)+''')) OR ');
      Add('           (Flx.CODTIPDOC='+FloatToStr(qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat)+')) ');
      Add('           AND (Flx.Valor<>0) AND (Flx.VALOR IS NOT NULL) ');

      MontaFiltroNumTermos(QryAux,dDataInicial,dDataFinal,False);
   end;
   QryAux.Open;
   rTotal:=qryAux.FieldByName('TOTAL').AsFloat;
   if qryLinhasFluxo.FieldByName('RECPAG').AsString='P' then rTotal:=-rTotal;
   QryAux.Close;
   qryLinhasFluxo.Edit;
   qryLinhasFluxo.FieldByName('TOTAL').AsFloat:=rTotal;
   qryLinhasFluxo.Post;
   QryAux.Close;
end;

procedure TfrmConsultaFluxo.GeraCoresRecDes(dDataInicial,dDataFinal: TDateTime);
var
   sCor : String;
begin
   sCor:='clBlack';

   if sTipoFluxo='P' then
    begin
       QryAux.Close;
       with QryAux.SQL do
       begin
          Add('SELECT ');
          Add('   Count(*) AS QtdeTermos ');
          Add('FROM '+sFluxo+' Flx ');
          Add('    WHERE (Flx.IDPESSOA='+IntToStr(Sistema.IdEmpresa)+') AND ');
          Add('          (((Substr(Flx.CODTIPRECDES,1, ');
          Add('                    Length('''+Trim(qryLinhasFluxo.FieldByName('CODTIPRECDES').AsString)+'''))='''+
                                    Trim(qryLinhasFluxo.FieldByName('CODTIPRECDES').AsString)+''') AND ');
          Add('           (Flx.RECPAG='''+Trim(qryLinhasFluxo.FieldByName('RECPAG').AsString)+''')) OR ');
          Add('           (Flx.CODTIPDOC='+FloatToStr(qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat)+')) ');
          Add('           AND (Flx.Valor<>0) AND (Flx.VALOR IS NOT NULL) ');

          MontaFiltroNumTermos(QryAux,dDataInicial,dDataFinal,False);
          QryAux.SQL.Add('     AND (Flx.FLGPREVISAO=''S'') ');
       end;
       QryAux.Open;

       if qryLinhasFluxo.FieldByName('RECPAG').AsString='R' then
        begin
           if qryAux.FieldByName('QtdeTermos').AsFloat=0 then
              sCor:=sCorRecSemPrev
           else
              sCor:=sCorRecComPrev;
        end
       else
        if qryAux.FieldByName('QtdeTermos').AsFloat=0 then
           sCor:=sCorPgtoSemPrev
        else
           sCor:=sCorPgtoComPrev;
     end;

    qryLinhasFluxo.Edit;
    qryLinhasFluxo.FieldByName('CORCAMPO').AsString:=sCor;
    qryLinhasFluxo.Post;
    QryAux.Close;
end;

procedure TfrmConsultaFluxo.CalculaSomatorios;
var
   rUltimoTotal      : Real;
   rCodLinhaCorrente : Real;
   PosicaoAtual      : TbookMark;
   PosicaoAux        : TbookMark;
   bContinua         : Boolean;
   aSomatorio        : TStringList;

   function AssociaValores: Boolean;
   var
      sCorAux        : String;
      bCondicao      : Boolean;
      rUnidNeg       : Real;
      sCentroRespon  : String;
      sCentroCusto   : String;
      //----------------------
      rValorAux      : Real;
      iPosicao       : LongInt; 
   begin
      //
      //Rotina de associação de Total de uma linha ao total de uma outra linha de
      //mesmo código (CODCOMPLINHA)
      //

      Result:=False;
      qryLinhasFluxo.First;
      aSomatorio.Clear;
      while not(qryLinhasFluxo.Eof) do
      begin
         if (qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat=
             qryLinhasFluxo.FieldByName('CODCOMPLINHA').AsFloat) and
            (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString<>'T') and
            (qryLinhasFluxo.FieldByName('LINHATOTAL').AsString='#') then
          begin
            case rgQuebra.ItemIndex of
               0: aSomatorio.Add('#'+FloatToStr(qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat));

               1: aSomatorio.Add('#'+FloatToStr(qryLinhasFluxo.FieldByName('UnidNegoc').AsFloat)+'-'+
                                     FloatToStr(qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat));

               2: aSomatorio.Add('#'+Trim(qryLinhasFluxo.FieldByName('CodCentroRespon').AsString)+'-'+
                                     FloatToStr(qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat));

               3: aSomatorio.Add('#'+Trim(qryLinhasFluxo.FieldByName('CodCentroCusto').AsString)+'-'+
                                     FloatToStr(qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat));
            end;
            aSomatorio.Add(FloatToStr(qryLinhasFluxo.FieldByName('TOTAL').AsFloat));
          end;
         qryLinhasFluxo.Next;
      end;

      qryLinhasFluxo.First;
      while not(qryLinhasFluxo.Eof) do
      begin
         if (qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat<>
             qryLinhasFluxo.FieldByName('CODCOMPLINHA').AsFloat) and
            (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString<>'T') then
          begin
             case rgQuebra.ItemIndex of
                0: iPosicao:=aSomatorio.IndexOf('#'+FloatToStr(qryLinhasFluxo.FieldByName('CODCOMPLINHA').AsFloat));

                1: iPosicao:=aSomatorio.IndexOf('#'+FloatToStr(qryLinhasFluxo.FieldByName('UnidNegoc').AsFloat)+'-'+
                             FloatToStr(qryLinhasFluxo.FieldByName('CODCOMPLINHA').AsFloat));

                2: iPosicao:=aSomatorio.IndexOf('#'+Trim(qryLinhasFluxo.FieldByName('CodCentroRespon').AsString)+'-'+
                             FloatToStr(qryLinhasFluxo.FieldByName('CODCOMPLINHA').AsFloat));

                3: iPosicao:=aSomatorio.IndexOf('#'+Trim(qryLinhasFluxo.FieldByName('CodCentroCusto').AsString)+'-'+
                             FloatToStr(qryLinhasFluxo.FieldByName('CODCOMPLINHA').AsFloat));
             end;

             if (iPosicao<>-1) then
              begin
                 rValorAux:=StrToFloat(aSomatorio.Strings[iPosicao+1]);
                 if (qryLinhasFluxo.FieldByName('TOTAL').AsFloat<>rValorAux) then
                  begin
                     qryLinhasFluxo.Edit;
                     qryLinhasFluxo.FieldByName('TOTAL').AsFloat:=rValorAux;
                     qryLinhasFluxo.Post;
                     Result:=True;
                  end;
              end;
          end;
         qryLinhasFluxo.Next;
      end;
   end;

   function Totaliza: Boolean;
   var
      rTotal      : Real;
      rUnidNegAux : Real;
      sCResponAux : String;
      sCCustoAux  : String;
   begin
      //
      //Totalização de linhas do mesmo conjunto
      //
      rTotal:=0;
      rUltimoTotal:=0;

      Result:=False;
      qryLinhasFluxo.First;
      while not(qryLinhasFluxo.Eof) do
      begin
         if (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='T') then
          begin
             qryLinhasFluxo.Next;
             Continue;
          end;

         {rUnidNegAux:=0;
         sCResponAux:='';
         sCCustoAux:='';
         case rgQuebra.ItemIndex of
            1: rUnidNegAux:=qryLinhasFluxo.FieldByName('UnidNegoc').AsFloat;
            2: sCResponAux:=qryLinhasFluxo.FieldByName('CodCentroRespon').AsString;
            3: sCCustoAux:=qryLinhasFluxo.FieldByName('CodCentroCusto').AsString;
         end;

         //Gera os Totais dos Recebimentos/Desembolsos para versões < Oracle 8.0i
         if (not(qryLinhasFluxo.FieldByName('CODTIPRECDES').IsNull) or
            (qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat<>0)) and
            (qryLinhasFluxo.FieldByName('TOTAL').AsFloat=0) and
             not(bUsaOracle8i) then
          begin
             //GeraTotalRecDes(dDataInicial,dDataFinal);
             if (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='R') or
                (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='P') then
              begin
                 qryLinhasFluxo.Edit;
                 qryLinhasFluxo.FieldByName('TOTAL').AsFloat:=
                          BuscaTotal(0,qryLinhasFluxo.FieldByName('CODTIPRECDES').AsString,
                                     qryLinhasFluxo.FieldByName('RECPAG').AsString,
                                     rUnidNegAux,sCResponAux,sCCustoAux);
                 qryLinhasFluxo.Post;
              end;

             if (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='C') or
                (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='D') then
              begin
                 qryLinhasFluxo.Edit;
                 qryLinhasFluxo.FieldByName('TOTAL').AsFloat:=
                          BuscaTotal(qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat,'',
                                     qryLinhasFluxo.FieldByName('RECPAG').AsString,
                                     rUnidNegAux,sCResponAux,sCCustoAux);
                 qryLinhasFluxo.Post;
              end;
          end;}

         //Testa se a linha corrente faz parte do conjunto atual
         if (qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat<>rUltimoTotal) then
          begin
             if rTotal<>0 then
              begin
                 PosicaoAtual:=qryLinhasFluxo.GetBookmark;
                 qryLinhasFluxo.GotoBookmark(PosicaoAux);
                 if (qryLinhasFluxo.FieldByName('TOTAL').AsFloat<>rTotal) then Result:=True;
                 qryLinhasFluxo.Edit;
                 qryLinhasFluxo.FieldByName('TOTAL').AsFloat:=rTotal;
                 qryLinhasFluxo.Post;
                 qryLinhasFluxo.FreeBookmark(PosicaoAux);
                 qryLinhasFluxo.GotoBookmark(PosicaoAtual);
                 qryLinhasFluxo.FreeBookmark(PosicaoAtual);
              end;

             rTotal:=0;
             PosicaoAux:=qryLinhasFluxo.GetBookmark;
             rUltimoTotal:=qryLinhasFluxo.FieldByName('CODLINHAFLUXO').AsFloat;
          end
         else
          if (qryLinhasFluxo.FieldByName('LINHATOTAL').AsString='S') or
             (qryLinhasFluxo.FieldByName('LINHATOTAL').AsString='#') then //soma apenas linhas que são somatórios
             rTotal:=rTotal+qryLinhasFluxo.FieldByName('TOTAL').AsFloat;

         qryLinhasFluxo.Next;
      end;

      if rTotal<>0 then
       begin
          qryLinhasFluxo.GotoBookmark(PosicaoAux);
          if (qryLinhasFluxo.FieldByName('TOTAL').AsFloat<>rTotal) then Result:=True;
          qryLinhasFluxo.Edit;
          qryLinhasFluxo.FieldByName('TOTAL').AsFloat:=rTotal;
          qryLinhasFluxo.Post;
          qryLinhasFluxo.FreeBookmark(PosicaoAux);
          rTotal:=0;
       end;
   end;

begin
   bContinua:=True;
   Totaliza;
   aSomatorio:=TStringList.Create;
   try
      while bContinua do
      begin
         bContinua:=AssociaValores;
         bContinua:=bContinua or Totaliza;
      end;
   finally
      aSomatorio.Free;
   end;
end;

procedure TfrmConsultaFluxo.GeraColunasFluxo;
var
   iDia         : Integer;
   iNumDias     : Integer;
   iNumColunas  : Integer;
   dDataRef     : TdateTime;
   iContador    : Integer;
   iMesAux      : Integer;
   iColuna      : Integer;
   bSemanaCheia : Boolean;
   iDiaSemana   : Integer;
begin
   qryColunasFluxo.Close;
   qryColunasFluxo.Open;

   iNumDias:=Round(deDatFim.Date-deDatIni.Date+1);
   iNumColunas:=0;

   case rgDSM.ItemIndex of
      0: begin
            for iDia:=1 to iNumDias do
            begin
               iDiaSemana:=DayOfWeek(deDatIni.Date+(iDia-1));
               if ((iDiaSemana=1) or (iDiaSemana=7)) and not(cbExibeSabDom.Checked) then Continue;

               qryColunasFluxo.Append;
               qryColunasFluxoDATAINICIAL.AsDateTime:=(deDatIni.Date+(iDia-1));
               qryColunasFluxoDATAFINAL.AsDateTime:=(deDatIni.Date+(iDia-1));
               qryColunasFluxoTITULO.AsString:=FormatDateTime('dd/mm/yyyy',(deDatIni.Date+(iDia-1)));
               qryColunasFluxoSABDOM.AsString:='N';

               case iDiaSemana of
                  1: begin
                        qryColunasFluxoSUBTITULO.AsString:='Domingo';
                        qryColunasFluxoSABDOM.AsString:='S';
                     end;
                  2: qryColunasFluxoSUBTITULO.AsString:='Segunda';
                  3: qryColunasFluxoSUBTITULO.AsString:='Terça';
                  4: qryColunasFluxoSUBTITULO.AsString:='Quarta';
                  5: qryColunasFluxoSUBTITULO.AsString:='Quinta';
                  6: qryColunasFluxoSUBTITULO.AsString:='Sexta';
                  7: begin
                        qryColunasFluxoSUBTITULO.AsString:='Sábado';
                        qryColunasFluxoSABDOM.AsString:='S';
                     end;
               end;
               qryColunasFluxo.Post;
               Inc(INumColunas);
            end;
            iNumColunas:=iNumColunas+1;
         end;

      1: begin
            iContador:=0;
            dDataRef:=deDatIni.Date;
            bSemanaCheia:=False;

            for iDia:=1 to iNumDias do
            begin
               bSemanaCheia:=False;
               if DayOfWeek(deDatIni.Date+(iDia-1))=7 then
                begin
                   Inc(iContador);
                   qryColunasFluxo.Append;
                   qryColunasFluxoDATAINICIAL.AsDateTime:=dDataRef;
                   qryColunasFluxoDATAFINAL.AsDateTime:=(deDatIni.Date+(iDia-1));
                   qryColunasFluxoTITULO.AsString:=FormatDateTime('dd/mm',dDataRef)+' - '+
                                                   FormatDateTime('dd/mm',
                                                                 (deDatIni.Date+(iDia-1)));
                   qryColunasFluxoSABDOM.AsString:='N';
                   qryColunasFluxoSUBTITULO.AsString:=IntToStr(iContador);
                   qryColunasFluxo.Post;
                   dDataRef:=deDatIni.Date+(iDia-1)+1;
                   bSemanaCheia:=True;
                end;
            end;

            if not(bSemanaCheia) then
             begin
                Inc(iContador);
                qryColunasFluxo.Append;
                qryColunasFluxoDATAINICIAL.AsDateTime:=dDataRef;
                qryColunasFluxoDATAFINAL.AsDateTime:=deDatFim.Date;
                qryColunasFluxoTITULO.AsString:=FormatDateTime('dd/mm',dDataRef)+' - '+
                                                FormatDateTime('dd/mm',deDatFim.Date);
                qryColunasFluxoSABDOM.AsString:='N';
                qryColunasFluxoSUBTITULO.AsString:=IntToStr(iContador);
                qryColunasFluxo.Post;
            end;
            iNumColunas:=iContador+1;
         end;

      2: begin
            iMesAux:=0;
            iContador:=0;
            dDataRef:=deDatIni.Date;
            for iDia:=1 to iNumDias do
            begin
               if  (StrToInt(FormatDateTime('mm',deDatIni.Date+(iDia-1)))<>iMesAux) or
                   (iDia=iNumDias) then
                begin
                   if iDia=1 then
                    begin
                       dDataRef:=deDatIni.Date;
                       iMesAux:=StrToInt(FormatDateTime('mm',deDatIni.Date+(iDia-1)));
                    end
                   else
                    begin
                       Inc(iContador);
                       iMesAux:=StrToInt(FormatDateTime('mm',deDatIni.Date+(iDia-1)));
                       qryColunasFluxo.Append;
                       qryColunasFluxoDATAINICIAL.AsDateTime:=dDataRef;
                       qryColunasFluxoDATAFINAL.AsDateTime:=deDatIni.Date+(iDia-1)-1;
                       qryColunasFluxoTITULO.AsString:=FormatDateTime('mm/yyyy',dDataRef);
                       qryColunasFluxoSUBTITULO.AsString:=IntToStr(iContador);
                       qryColunasFluxoSABDOM.AsString:='N';
                       dDataRef:=deDatIni.Date+(iDia-1);
                       qryColunasFluxo.Post;
                   end;
                end;
            end;

            qryColunasFluxo.Edit;
            qryColunasFluxoDATAFINAL.AsDateTime:=deDatFim.Date;
            qryColunasFluxo.Post;

            iNumColunas:=iContador+1;
         end;
   end;

   //Inicializa cores
   //Cores.Clear;
   CorSabDom.Clear;

   LimpaCelulasGerais;
   //Monta Colunas do Grid

   sgFluxo.Visible:=False;
   sgFluxo.ColCount:=iNumColunas;
   qryColunasFluxo.First;
   for iColuna:=1 to iNumColunas-1 do
   begin
      if bExpandeCol then
         sgFluxo.ColWidths[iColuna]:=120
      else
         sgFluxo.ColWidths[iColuna]:=15;

      if (qryColunasFluxoSABDOM.AsString='S') then
       begin
          CorSabDom.Add(IntToStr(iColuna)+',0');
          AssociaCor(iColuna,1,'clRed');
       end;

      sgFluxo.Cells[iColuna,0]:=' '+qryColunasFluxoTITULO.AsString;
      sgFluxo.Cells[iColuna,1]:=' '+qryColunasFluxoSUBTITULO.AsString;
      sgFluxo.Refresh;
      qryColunasFluxo.Next;
   end;
   sgFluxo.Visible:=True;

  //Ajusta número de colunas do grid auxiliar
  sgFluxoAux.ColCount:=sgFluxo.ColCount-1;

end;

procedure TfrmConsultaFluxo.ExibeTituloLinhas(bGeraLista: Boolean);
var
   sQuebraAnterior   : String;
   rUnidNegAux : Real;
   sCResponAux : String;
   sCCustoAux  : String;
begin
   bMostrouFluxo:=False;

   //Inicializa Cores
   Cores.Clear;
   
   qryColunasFluxo.First;
   if not(qryLinhasFluxo.Active) or (bGeraLista) then
    begin
       GeraNumTermos;
       GeraDadosFluxo(0,0,False);
    end;

   qryLinhasFluxo.First;

   sgFluxo.RowCount:=3;
   sgFluxo.Cells[0,2]:=sTitSalAnterior;

   sgFluxo.ColWidths[0]:=200;
   sQuebraAnterior:='';

   while not(qryLinhasFluxo.Eof) do
   begin

      {rUnidNegAux:=0;
      sCResponAux:='';
      sCCustoAux:='';
      case rgQuebra.ItemIndex of
         1: rUnidNegAux:=qryLinhasFluxo.FieldByName('UnidNegoc').AsFloat;
         2: sCResponAux:=qryLinhasFluxo.FieldByName('CodCentroRespon').AsString;
         3: sCCustoAux:=qryLinhasFluxo.FieldByName('CodCentroCusto').AsString;
      end;

      //Calcula o Número de Termos com mesmo CODTIPRECDES ou CODTIPDOC
      //para versões do Oracle < 8.0i  (Fluxo Analítico)
      if (qryLinhasFluxo.FieldByName('NUMTERMOS').AsFloat<0) and
         (not(qryLinhasFluxo.FieldByName('CODTIPRECDES').IsNull) or
          (qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat<>0)) and
          not(bUsaOracle8i) and (rgAnaSint.ItemIndex=0) then
       begin
          if (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='R') or
             (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='P') then
           begin
              qryLinhasFluxo.Edit;
              qryLinhasFluxo.FieldByName('NUMTERMOS').AsFloat:=
                       BuscaNumTermos(0,qryLinhasFluxo.FieldByName('CODTIPRECDES').AsString,
                                      qryLinhasFluxo.FieldByName('RECPAG').AsString,
                                      rUnidNegAux,sCResponAux,sCCustoAux);
              qryLinhasFluxo.Post;
           end;

          if (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='C') or
             (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='D') then
           begin
              qryLinhasFluxo.Edit;
              qryLinhasFluxo.FieldByName('NUMTERMOS').AsFloat:=
                       BuscaNumTermos(qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat,'',
                                      qryLinhasFluxo.FieldByName('RECPAG').AsString,
                                      rUnidNegAux,sCResponAux,sCCustoAux);
              qryLinhasFluxo.Post;
           end;
       end;}

      //Exibe a Unidade, Centro de Responsabilidade ou o Centro de Custo da Quebra Corrente
      case rgQuebra.ItemIndex of
         1: if sQuebraAnterior<>qryLinhasFluxo.FieldByName('UnidadeNeg').AsString then
             begin
                sQuebraAnterior:=qryLinhasFluxo.FieldByName('UnidadeNeg').AsString;
                AssociaCor(0,sgFluxo.RowCount,'clNavy');
                sgFluxo.RowCount:=sgFluxo.RowCount+1;
                sgFluxo.Cells[0,sgFluxo.RowCount-1]:='->'+
                        qryLinhasFluxo.FieldByName('UnidadeNeg').AsString;
             end;
       2,3: if sQuebraAnterior<>qryLinhasFluxo.FieldByName('Nome').AsString then
             begin
                sQuebraAnterior:=qryLinhasFluxo.FieldByName('Nome').AsString;
                AssociaCor(0,sgFluxo.RowCount,'clNavy');
                sgFluxo.RowCount:=sgFluxo.RowCount+1;
                sgFluxo.Cells[0,sgFluxo.RowCount-1]:='->'+
                        qryLinhasFluxo.FieldByName('Nome').AsString;
             end;
      end;

      if (qryLinhasFluxo.FieldByName('LinhaTotal').AsString='#') or
         (qryLinhasFluxo.FieldByName('TipoCalculo').AsString='T') then
       begin
          sgFluxo.RowCount:=sgFluxo.RowCount+1;
          sgFluxo.Cells[0,sgFluxo.RowCount-1]:=Replicate(' ',iEspacoBase)+
                                  qryLinhasFluxo.FieldByName('LinhaFluxo').AsString;
       end
      else
       begin
          //Filtra Registros pelo Grau (Fluxo Analítico)
          if (((FuncaoGeral.CalcNumEleGrau(sMascaraCAR,Trunc(seGrauMaxCAR.Value))>=
               qryLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (qryLinhasFluxo.FieldByName('RECPAG').AsString='R'))  or
             ((FuncaoGeral.CalcNumEleGrau(sMascaraCAP,Trunc(seGrauMaxCAP.Value))>=
               qryLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (qryLinhasFluxo.FieldByName('RECPAG').AsString='P')) or
             ((qryLinhasFluxo.FieldByName('TipoCalculo').AsString='C') or
              (qryLinhasFluxo.FieldByName('TipoCalculo').AsString='D'))) and
             (rgAnaSint.ItemIndex=0) then
              begin
                 if (cbZerado.Checked) or
                    (not(cbZerado.Checked) and
                     (qryLinhasFluxo.FieldByName('NumTermos').AsFloat>0)) then
                  begin
                     sgFluxo.RowCount:=sgFluxo.RowCount+1;
                     sgFluxo.Cells[0,sgFluxo.RowCount-1]:=
                     Replicate(' ',qryLinhasFluxo.FieldByName('NumCarCodTRD').AsInteger+iEspacoBase)+
                                   qryLinhasFluxo.FieldByName('LinhaFluxo').AsString;
                  end;
              end;
          end;

      qryLinhasFluxo.Next;
   end;

  sgFluxo.RowCount:=sgFluxo.RowCount+1;
  sgFluxo.Cells[0,sgFluxo.RowCount-1]:=sTipSalTransp;

  //Ajusta número de linhas do grid auxiliar
  sgFluxoAux.RowCount:=sgFluxo.RowCount-2;

  LimpaCelulasDados;
  
  sgFluxo.Col:=1;
  sgFluxo.Row:=2;
end;

procedure TfrmConsultaFluxo.ExibeDadosFluxo(iColuna: Integer);
var
   iLinha            : Integer;
   rTotalPeriodo     : Real;
   rValorAux         : Real;
   sQuebraAnterior   : String;
   rUnidNegAux       : Real;
   sCResponAux       : String;
   sCCustoAux        : String;
begin
   iLinha:=2;
   //Saldo Anterior
   if (rSaldo<0) then AssociaCor(iColuna,iLinha,'clRed');
   if edFatorDivisaoMoeda.Value<>1 then
      sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',
                                                (rSaldo/edFatorDivisaoMoeda.Value))
   else
      sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',rSaldo);

   //Armazena valor do Saldo Anterior
   sgFluxoAux.Cells[iColuna-1,iLinha-2]:=sgFluxo.Cells[iColuna,iLinha];

   rTotalPeriodo:=rSaldo;

   sQuebraAnterior:='';

   prgBarExibicao.Max:=qryLinhasFluxo.RecordCount;

   qryLinhasFluxo.First;
   while not(qryLinhasFluxo.Eof) do
   begin

      {rUnidNegAux:=0;
      sCResponAux:='';
      sCCustoAux:='';
      case rgQuebra.ItemIndex of
         1: rUnidNegAux:=qryLinhasFluxo.FieldByName('UnidNegoc').AsFloat;
         2: sCResponAux:=qryLinhasFluxo.FieldByName('CodCentroRespon').AsString;
         3: sCCustoAux:=qryLinhasFluxo.FieldByName('CodCentroCusto').AsString;
      end;

      //Calcula o Número de Termos com mesmo CODTIPRECDES ou CODTIPDOC
      //para versões do Oracle < 8.0i  (Fluxo Analítico)
      if (qryLinhasFluxo.FieldByName('NUMTERMOS').AsFloat<0) and
         (not(qryLinhasFluxo.FieldByName('CODTIPRECDES').IsNull) or
          (qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat<>0)) and
          not(bUsaOracle8i) and (rgAnaSint.ItemIndex=0) then
       begin
          if (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='R') or
             (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='P') then
           begin
              qryLinhasFluxo.Edit;
              qryLinhasFluxo.FieldByName('NUMTERMOS').AsFloat:=
                       BuscaNumTermos(0,qryLinhasFluxo.FieldByName('CODTIPRECDES').AsString,
                                      qryLinhasFluxo.FieldByName('RECPAG').AsString,
                                      rUnidNegAux,sCResponAux,sCCustoAux);
              qryLinhasFluxo.Post;
           end;

          if (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='C') or
             (qryLinhasFluxo.FieldByName('TIPOCALCULO').AsString='D') then
           begin
              qryLinhasFluxo.Edit;
              qryLinhasFluxo.FieldByName('NUMTERMOS').AsFloat:=
                       BuscaNumTermos(qryLinhasFluxo.FieldByName('CODTIPDOC').AsFloat,'',
                                      qryLinhasFluxo.FieldByName('RECPAG').AsString,
                                      rUnidNegAux,sCResponAux,sCCustoAux);
              qryLinhasFluxo.Post;
           end;
       end;}

      //Verifica se mudou de faixa de quebra
      //Caso tenha mudado, salta uma linha
      //pois a primeira linha de cada faixa não contém valor
      case rgQuebra.ItemIndex of
         1: if sQuebraAnterior<>qryLinhasFluxo.FieldByName('UnidadeNeg').AsString then
             begin
                sQuebraAnterior:=qryLinhasFluxo.FieldByName('UnidadeNeg').AsString;
                Inc(iLinha);
             end;
       2,3: if sQuebraAnterior<>qryLinhasFluxo.FieldByName('Nome').AsString then
             begin
                sQuebraAnterior:=qryLinhasFluxo.FieldByName('Nome').AsString;
                Inc(iLinha);
             end;
      end;

      //Testa se a linha Corrente é uma linha de título
      if (qryLinhasFluxo.FieldByName('TipoCalculo').AsString='T') then
       begin
          qryLinhasFluxo.Next;
          Inc(iLinha);
          Continue;
       end;

      rValorAux:=qryLinhasFluxo.FieldByName('TOTAL').AsFloat;

      //Soma valores de totalizadores
      if (qryLinhasFluxo.FieldByName('LinhaTotal').AsString='#') and
         (qryLinhasFluxo.FieldByName('TipoCalculo').AsString<>'L') then
          rTotalPeriodo:=rTotalPeriodo+rValorAux;

      //Acumula valor de linhas do tipo Acumulativas
      if (qryLinhasFluxo.FieldByName('FLGACUMULA').AsString='S') and (iColuna>1) then
         rValorAux:=rValorAux+StrToFloat(SubstSimb(sgFluxoAux.Cells[iColuna-2,iLinha-2]));

      if (qryLinhasFluxo.FieldByName('LinhaTotal').AsString='#') then
       begin
          Inc(iLinha);
          //Armazena valor para futura restauração, após uso de fator de divisão
          sgFluxoAux.Cells[iColuna-1,iLinha-2]:=FormatFloat('#,##0.00;(#,##0.00)',rValorAux);

          //Aplica Fator de divisão
          if edFatorDivisaoMoeda.Value<>1 then
              sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',
                                                        (rValorAux/edFatorDivisaoMoeda.Value))
          else
              sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',rValorAux);

          if rValorAux<>0 then
             AssociaCor(iColuna,iLinha,qryLinhasFluxo.FieldByName('CORCAMPO').AsString);
       end
      else
       begin
          //Filtra Registros pelo Grau (Fluxo Analítico)
          if (((FuncaoGeral.CalcNumEleGrau(sMascaraCAR,Trunc(seGrauMaxCAR.Value))>=
               qryLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (qryLinhasFluxo.FieldByName('RECPAG').AsString='R'))  or
             ((FuncaoGeral.CalcNumEleGrau(sMascaraCAP,Trunc(seGrauMaxCAP.Value))>=
               qryLinhasFluxo.FieldByName('NumCarCodTRD').AsFloat) and
              (qryLinhasFluxo.FieldByName('RECPAG').AsString='P')) or
             ((qryLinhasFluxo.FieldByName('TipoCalculo').AsString='C') or
              (qryLinhasFluxo.FieldByName('TipoCalculo').AsString='D'))) and
             (rgAnaSint.ItemIndex=0) then
              begin
                 if (cbZerado.Checked) or (not(cbZerado.Checked) and
                    (qryLinhasFluxo.FieldByName('NumTermos').AsFloat>0)) then
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
                        AssociaCor(iColuna,iLinha,qryLinhasFluxo.FieldByName('CORCAMPO').AsString);
                  end;
              end;
          end;
      qryLinhasFluxo.Next;
      prgBarExibicao.StepIt;
   end;

   //Exibe Total a transportar
   Inc(iLinha);
   if (rTotalPeriodo<0) then AssociaCor(iColuna,iLinha,'clRed');
   if edFatorDivisaoMoeda.Value<>1 then
      sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',
                                     (rTotalPeriodo/edFatorDivisaoMoeda.Value))
   else
      sgFluxo.Cells[iColuna,iLinha]:=FormatFloat('#,##0.00;(#,##0.00)',rTotalPeriodo);

   sgFluxoAux.Cells[iColuna-1,iLinha-2]:=sgFluxo.Cells[iColuna,iLinha];

   rSaldo:=rTotalPeriodo;
   bMostrouFluxo:=True;
end;

procedure TfrmConsultaFluxo.AssociaCor(iColuna, iLinha: Integer;
  sCor: String);
var
   iPosicao      : Integer;
begin
   iPosicao:=Cores.IndexOf(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   if iPosicao<>-1 then Cores.Delete(iPosicao);
   Cores.Add(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   Cores.Add(sCor);
end;

function TfrmConsultaFluxo.ExtraiCor(iColuna,iLinha: Integer): TColor;
var
   sCor          : String;
   iPosicao      : Integer;
begin
   //Cada 2 Linhas do TStringList de Cores, Armazena os seguintes formatos:
   // col,lin:
   // COR
   Result:=clBlack;
   iPosicao:=Cores.IndexOf(IntToStr(iColuna)+','+IntToStr(iLinha)+':');
   if (iPosicao<>-1) then
    begin
       sCor:=Trim(Cores.Strings[iPosicao+1]);

       if sCor=sCorPgtoSemPrev then Result:=shpPgtoSemPrev.Brush.Color;
       if sCor=sCorPgtoComPrev then Result:=shpPgtoComPrev.Brush.Color;
       if sCor=sCorRecComPrev then Result:=shpRecComPrev.Brush.Color;
       if sCor=sCorRecSemPrev then Result:=shpRecSemPrev.Brush.Color;
       if sCor='clRed' then Result:=clRed;
       if sCor='clNavy' then Result:=clNavy;
       if sCor='clMaroon'then Result:=clMaroon;
    end;
end;

function TfrmConsultaFluxo.GeraSaldoInicial: Real;
var
   rValorCotacao : Real;
   rSaldoAux     : Real;
   sPrazo        : String;
begin
   rSaldoAux:=0;

   //----------------------------
   //Saldo para o Fluxo Previsto
   //----------------------------
   if sTipoFluxo='P' then  
    begin
       qrySaldoAnterior.Close;
       qrySaldoAnterior.SQL.Clear;
       if bSubSaldo then
        begin
           qrySaldoAnterior.SQL.text := 'SELECT SUM(DECODE(RECPAG,''R'',VALOR,-VALOR)) AS VALORC '+
                                        'FROM FLUXOPREVISTO '+
                                        'WHERE (IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+') ';
           qrySaldoAnterior.SQL.text :=qrySaldoAnterior.SQL.text+
                                       ' AND (DATAPROGRAMADA >= to_date(''01/01/1900'',''dd/mm/yyyy'')) '+
                                       ' AND (DATAPROGRAMADA < to_date('''+
                                       FormatDateTime('dd/mm/yyyy',deDatIni.Date)+''',''dd/mm/yyyy'')) ';
        end
       else
        begin
           qrySaldoAnterior.SQL.text := 'SELECT SUM(VALOR) AS VALORC '+
                                        'FROM FLUXOPREVISTO '+
                                        'WHERE (IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+') ';
           qrySaldoAnterior.SQL.text :=qrySaldoAnterior.SQL.text+
                                       ' AND (DATAPROGRAMADA = to_date(''01/01/1900'',''dd/mm/yyyy'')) ';
        end;

       qrySaldoAnterior.Open;
       rSaldoAux:=qrySaldoAnterior.FieldByName('VALORC').AsFloat;
       qrySaldoAnterior.Close;
    end;

   //--------------------------
   //Saldo para o Fluxo Real
   //--------------------------
   if sTipoFluxo='R' then
    begin
       qrySaldoAnterior.SQL.text := 'SELECT SUM(VALOR) AS VALORC,MOECODIGO FROM FLUXOREAL '+
                                    'WHERE IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+
                                    ' AND RECPAG = '+#39+'R'+#39;
       MontaFiltroQry(qrySaldoAnterior);
       qrySaldoAnterior.SQL.text := qrySaldoAnterior.SQL.text+
                                    ' AND DATACFLOAT < to_date('''+deDatIni.Text+''',''dd/MM/yyyy'')'+
                                    ' GROUP BY MOECODIGO';
       qrySaldoAnterior.Open;

       qrySaldoAnterior.First;
       while not qrySaldoAnterior.EOF do
       begin
          rValorCotacao :=FuncaoGeral.TestaCotacaoMoeda(qrySaldoAnterior.FieldByName('MOECODIGO').AsInteger,DateToStr(Now),'N');
          if rValorCotacao = 0 then rValorCotacao :=1;
          rSaldoAux:=rSaldoAux+(qrySaldoAnterior.FieldByName('VALORC').AsFloat*rValorCotacao);
          qrySaldoAnterior.Next;
       end;

       qrySaldoAnterior.Close;
       qrySaldoAnterior.SQL.Clear;
       qrySaldoAnterior.SQL.text := 'SELECT SUM(VALOR) AS VALORC,MOECODIGO FROM FLUXOREAL '+
                                    'WHERE IDPESSOA = '+InttoStr(Sistema.IdEmpresa)+
                                    ' AND RECPAG = '+#39+'P'+#39;
       MontaFiltroQry(qrySaldoAnterior);
       qrySaldoAnterior.SQL.text := qrySaldoAnterior.SQL.text+
                                    ' AND DATACFLOAT < to_date('''+deDatIni.Text+''',''dd/MM/yyyy'')'+
                                    ' GROUP BY MOECODIGO';
       qrySaldoAnterior.Open;

       qrySaldoAnterior.First;
       while not qrySaldoAnterior.EOF do
       begin
          rValorCotacao :=FuncaoGeral.TestaCotacaoMoeda(qrySaldoAnterior.FieldByName('MOECODIGO').AsInteger,DateToStr(Now),'N');
          if rValorCotacao = 0 then rValorCotacao :=1;
          rSaldoAux:=rSaldoAux-(qrySaldoAnterior.FieldByName('VALORC').AsFloat*rValorCotacao);
          qrySaldoAnterior.Next;
       end;

       qrySaldoAnterior.Close;       
    end;

   //--------------------------
   //Saldo para o Fluxo Orçado
   //--------------------------
   if sTipoFluxo='O' then
    begin
       case rgCML.ItemIndex of
          0: sPrazo:='C';
          1: sPrazo:='M';
          2: sPrazo:='L';
       end;

       qrySaldoAnterior.Close;
       qrySaldoAnterior.SQL.Clear;

       qrySaldoAnterior.SQL.text := 'SELECT SUM(DECODE(RECPAG,''R'',VALOROUTRAMOEDA,VALOROUTRAMOEDA*-1))'+
                                    ' AS VALORO,MOECODIGO, SUM(DECODE(RECPAG,''R'',VALOR,VALOR*-1))'+
                                    ' AS VALORC FROM FLUXOORCADO'+
                                    ' WHERE PRAZO = '+#39+sPrazo+#39+
                                    ' AND IDPESSOA = '+InttoStr(Sistema.IdEmpresa);
       MontaFiltroQry(qrySaldoAnterior);
       qrySaldoAnterior.SQL.text := qrySaldoAnterior.SQL.text+
                                    ' AND DATAPROGRAMADA < to_date('''+deDatIni.Text+''',''dd/MM/yyyy'')'+
                                    ' GROUP BY MOECODIGO';
       qrySaldoAnterior.Open;

       qrySaldoAnterior.First;
       while not qrySaldoAnterior.EOF do
       begin
          if qrySaldoAnterior.FieldByName('MOECODIGO').IsNull then
             rSaldoAux:=rSaldoAux+qrySaldoAnterior.FieldByName('VALORC').AsFloat
          else
           begin
              rValorCotacao :=FuncaoGeral.TestaCotacaoMoeda(qrySaldoAnterior.FieldByName('MOECODIGO').AsInteger,DateToStr(Now),'N');
              if rValorCotacao = 0 then rValorCotacao :=1;
              rSaldoAux:=rSaldoAux+(qrySaldoAnterior.FieldByName('VALORO').AsFloat*rValorCotacao);
           end;
          qrySaldoAnterior.Next;
       end;
    end;
   Result:=rSaldoAux; 
end;

procedure TfrmConsultaFluxo.MontaFiltroQry(var Qry: TwwQuery);
begin
   if (Trim(dblcUnidNegoc.Text) <> '') then
      Qry.SQl.Text:=Qry.SQl.Text+' AND UNIDNEGOC = '+qryUnidNegoc.FieldByName('UNIDNEGOC').AsString;
   if (Trim(dblcCentroRespon.Text) <> '') then
      Qry.SQl.Text:=Qry.SQl.Text+' AND CODCENTRORESPON = '+#39+
                    qryCentroRespon.FieldByName('CODCENTRORESPON').AsString+#39;
   if (Trim(dblcPlanoPrev.Text) <> '') then
      Qry.SQl.Text:=Qry.SQl.Text+' AND IDPLANOPREV = '+
                    IntToStr(qryPlanoPrev.FieldByName('IDPLANOPREV').AsInteger);
   if (Trim(dblcPatrocinador.Text) <> '') then
      Qry.SQl.Text:=Qry.SQl.Text+' AND IDPATRO = '+
                    IntToStr(qryPatro.FieldByName('IDPESSOA').AsInteger);
end;
procedure TfrmConsultaFluxo.GeraNumTermos;
begin
   //////////////////////
   Exit;
   //////////////////////   
   if not(bUsaOracle8i) then
    begin
       GeraNumTermosTRD;
       GeraNumTermosTDOC;
    end;
end;

procedure TfrmConsultaFluxo.GeraNumTermosTRD;
begin
   qryNumTermosTRD.Close;
   with qryNumTermosTRD.Sql do
   begin
      Clear;
      Add('   SELECT ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      case rgQuebra.ItemIndex of
         1: Add('       Flx.UnidNegoc, ');
         2: Add('       Flx.CodCentroRespon, ');
         3: Add('       Flx.CodCentroCusto, ');
      end;

      Add('       TRD.CodTipRecDes, ');
      Add('       TRD.RecPag, ');
      Add('       COUNT(*) AS NaoZerados ');
      Add('    FROM '+sFluxo+' Flx, ');
      Add('         TIPORECEBDESEMB TRD ');
      Add('    WHERE ');
      Add('       (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))=RTrim(TRD.CODTIPRECDES)) AND ');
      Add('       (Flx.RecPag=TRD.RecPag) AND ');
      Add('       (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

      MontaFiltroNumTermos(qryNumTermosTRD,deDatIni.Date,deDatFim.Date,True);

      case rgQuebra.ItemIndex of
         0: Add('    GROUP BY TRD.CodTipRecDes, TRD.RecPag ');
         1: Add('    GROUP BY Flx.UnidNegoc, TRD.CodTipRecDes, TRD.RecPag ');
         2: Add('    GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag ');
         3: Add('    GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag ');
      end;

   end;
   //qryNumTermosTRD.sql.SaveToFile('c:\qryntTRD.sql');
   qryNumTermosTRD.Open;
end;

procedure TfrmConsultaFluxo.GeraNumTermosTDOC;
begin
   qryNumTermosTDOC.Close;
   qryNumTermosTDOC.Sql.Clear;
   with qryNumTermosTDOC.Sql do
   begin
      Add('   SELECT ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      case rgQuebra.ItemIndex of
         1: Add('       Flx.UnidNegoc, ');
         2: Add('       Flx.CodCentroRespon, ');
         3: Add('       Flx.CodCentroCusto, ');
      end;

      Add('       TDOC.CodTipDoc, ');
      Add('       TDOC.RecPag, ');
      Add('       COUNT(*) AS NaoZerados ');
      Add('    FROM '+sFluxo+' Flx, ');
      Add('         TIPODOCRECPAG TDOC ');
      Add('    WHERE ');
      Add('       (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
      Add('       NOT (TDOC.CODTIPDOC is null) AND ');
      Add('       (TDOC.CODTIPDOC<>0) AND ');
      Add('       (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

      MontaFiltroNumTermos(qryNumTermosTDOC,deDatIni.Date,deDatFim.Date,True);

      case rgQuebra.ItemIndex of
         0: Add('    GROUP BY TDOC.CODTIPDOC, TDOC.RecPag ');
         1: Add('    GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag ');
         2: Add('    GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag ');
         3: Add('    GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag ');
      end;
   end;
   //qryNumTermosTDOC.sql.SaveToFile('c:\qryntTDOC.sql');
   qryNumTermosTDOC.Open;
end;

procedure TfrmConsultaFluxo.MontaFiltroNumTermos(qry: TQuery; dDataInicial,dDataFinal: TDateTime;
                                                 bUsaUNCRCC: Boolean);
begin
   with qry.Sql do
   begin
      //Estrutura para filtragem por Unid.Negóc. , C. Respon. , Centro de Custo, Plano e Patrocinador
      if Trim(dblcUnidNegoc.Text)<>'' then
         Add('       AND (Flx.UnidNegoc='+dblcUnidNegoc.LookupValue+') ');
      if Trim(dblcCentroRespon.Text)<>'' then
         Add('       AND (Flx.CodCentroRespon='''+dblcCentroRespon.LookupValue+''') ');
      if Trim(dblcCentroCusto.Text)<>'' then
         Add('       AND (Flx.CodCentroCusto='''+dblcCentroCusto.LookupValue+''') ');
      if (Trim(dblcPlanoPrev.Text)<>'') then
         Add('        AND (Flx.IDPLANOPREV='+Trim(dblcPlanoPrev.LookupValue)+') ');
      if (Trim(dblcPatrocinador.Text)<>'') then
         Add('        AND (Flx.IDPATRO='+Trim(dblcPatrocinador.LookupValue)+') ');

      //Estrutura para filtragem por Prazo
      if (sTipoFluxo='O') then
       begin
          case rgCML.ItemIndex of
             0: Add('        AND (Flx.Prazo=''C'') ');
             1: Add('        AND (Flx.Prazo=''M'') ');
             2: Add('        AND (Flx.Prazo=''L'') ');
          end;
       end;

      //Estrutura de Filtragem por data
      if (sTipoFluxo='P') or (sTipoFluxo='O') then
       begin
          Add('                AND (Flx.DATAPROGRAMADA>=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',dDataInicial)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
          Add('                AND (Flx.DATAPROGRAMADA<=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',dDataFinal)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
       end
      else
      begin
          Add('                AND (Flx.DATACFLOAT>=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',dDataInicial)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
          Add('                AND (Flx.DATACFLOAT<=To_Date( '+
               #39+FormatDateTime('dd/mm/yyyy',dDataFinal)+#39+', '+
               #39+'DD/MM/YYYY'+#39+')) ');
       end;
   end;
end;

procedure TfrmConsultaFluxo.GeraTotais(dDataInicial,dDataFinal: TDateTime);
begin
   if not(bUsaOracle8i) then
    begin
       GeraTotalTRD(dDataInicial,dDataFinal);
       GeraTotalTDOC(dDataInicial,dDataFinal);
    end;
end;

procedure TfrmConsultaFluxo.GeraTotalTRD(dDataInicial,
  dDataFinal: TDateTime);
begin
   qryTotalTRD.Close;
   qryTotalTRD.Sql.Clear;
   with qryTotalTRD.Sql do
   begin
      Add('   SELECT ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      case rgQuebra.ItemIndex of
         1: Add('       Flx.UnidNegoc, ');
         2: Add('       Flx.CodCentroRespon, ');
         3: Add('       Flx.CodCentroCusto, ');
      end;

      Add('       TRD.CodTipRecDes, ');
      Add('       TRD.RecPag, ');
      Add('       Sum(Flx.Valor) AS TOTAL ');
      Add('    FROM '+sFluxo+' Flx, ');
      Add('         TIPORECEBDESEMB TRD ');
      Add('    WHERE ');
      Add('       (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES)))=RTrim(TRD.CODTIPRECDES)) AND ');
      Add('       (Flx.RecPag=TRD.RecPag) AND ');
      Add('       (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

      MontaFiltroNumTermos(qryTotalTRD,dDataInicial,dDataFinal,True);

      case rgQuebra.ItemIndex of
         0: Add('    GROUP BY TRD.CodTipRecDes, TRD.RecPag ');
         1: Add('    GROUP BY Flx.UnidNegoc, TRD.CODTIPDOC, TRD.RecPag ');
         2: Add('    GROUP BY Flx.CodCentroRespon, TRD.CODTIPDOC, TRD.RecPag ');
         3: Add('    GROUP BY Flx.CodCentroCusto, TRD.CODTIPDOC, TRD.RecPag ');
      end;
   end;
   //qryTotalTRD.sql.SaveToFile('c:\qryTotTRD.sql');
   qryTotalTRD.Open;
end;

procedure TfrmConsultaFluxo.GeraTotalTDOC(dDataInicial,
  dDataFinal: TDateTime);
begin
   qryTotalTDOC.Close;
   qryTotalTDOC.Sql.Clear;
   with qryTotalTDOC.Sql do
   begin
      Add('   SELECT ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      case rgQuebra.ItemIndex of
         1: Add('       Flx.UnidNegoc, ');
         2: Add('       Flx.CodCentroRespon, ');
         3: Add('       Flx.CodCentroCusto, ');
      end;

      Add('       TDOC.CodTipDoc, ');
      Add('       TDOC.RecPag, ');
      Add('       Sum(Flx.Valor) AS TOTAL ');
      Add('    FROM '+sFluxo+' Flx, ');
      Add('         TIPODOCRECPAG TDOC ');
      Add('    WHERE ');
      Add('       (Flx.CODTIPDOC=TDOC.CODTIPDOC) AND ');
      Add('       NOT (TDOC.CODTIPDOC is null) AND ');
      Add('       (TDOC.CODTIPDOC<>0) AND ');
      Add('       (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

      MontaFiltroNumTermos(qryTotalTDOC,dDataInicial,dDataFinal,True);

      case rgQuebra.ItemIndex of
         0: Add('    GROUP BY TDOC.CodTipDoc, TDOC.RecPag ');
         1: Add('    GROUP BY Flx.UnidNegoc, TDOC.CODTIPDOC, TDOC.RecPag ');
         2: Add('    GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag ');
         3: Add('    GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag ');
      end;
   end;
   //qryTotalTDOC.sql.SaveToFile('c:\qryTotTDOC.sql');
   qryTotalTDOC.Open;
end;

function TfrmConsultaFluxo.BuscaNumTermos(rCodTipDoc: Real; sCodTipRecDes,
  sRecPag: String; rUnidNeg: Real; sCRespon, sCCusto: String): Real;
begin
   Result:=0;
   if (rCodTipDoc<>0) then
    begin
       case rgQuebra.ItemIndex of
          0: begin
                if qryNumTermosTDOC.Locate('CodTipDoc;RecPag',VarArrayOf([rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryNumTermosTDOC.FieldByName('NaoZerados').AsFloat;
             end;
          1: begin
                if qryNumTermosTDOC.Locate('UnidNegoc;CodTipDoc;RecPag',
                                           VarArrayOf([rUnidNeg,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryNumTermosTDOC.FieldByName('NaoZerados').AsFloat;
             end;
          2: begin
                if qryNumTermosTDOC.Locate('CodCentroRespon;CodTipDoc;RecPag',
                                           VarArrayOf([sCRespon,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryNumTermosTDOC.FieldByName('NaoZerados').AsFloat;
             end;
          3: begin
                if qryNumTermosTDOC.Locate('CodCentroCusto;CodTipDoc;RecPag',
                                           VarArrayOf([sCCusto,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryNumTermosTDOC.FieldByName('NaoZerados').AsFloat;
             end;
       end;
    end;

   if (sCodTipRecDes<>'') then
    begin
       case rgQuebra.ItemIndex of
          0: begin
                if qryNumTermosTRD.Locate('CodTipRecDes;RecPag',VarArrayOf([Trim(sCodTipRecDes),sRecPag]),
                                          [loCaseInsensitive]) then
                   Result:=qryNumTermosTRD.FieldByName('NaoZerados').AsFloat;
             end;
          1: begin
                if qryNumTermosTRD.Locate('UnidNegoc;CodTipRecDes;RecPag',
                                           VarArrayOf([rUnidNeg,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryNumTermosTRD.FieldByName('NaoZerados').AsFloat;
             end;
          2: begin
                if qryNumTermosTRD.Locate('CodCentroRespon;CodTipRecDes;RecPag',
                                           VarArrayOf([sCRespon,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryNumTermosTRD.FieldByName('NaoZerados').AsFloat;
             end;
          3: begin
                if qryNumTermosTRD.Locate('CodCentroCusto;CodTipRecDes;RecPag',
                                           VarArrayOf([sCCusto,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryNumTermosTRD.FieldByName('NaoZerados').AsFloat;
             end;
       end;
    end;
end;

function TfrmConsultaFluxo.BuscaTotal(rCodTipDoc: Real; sCodTipRecDes, sRecPag: String;
                        rUnidNeg: Real; sCRespon,sCCusto: String): Real;
begin
   Result:=0;
   if (rCodTipDoc<>0) then
    begin
       case rgQuebra.ItemIndex of
          0: begin
                if qryTotalTDOC.Locate('CodTipDoc;RecPag',VarArrayOf([rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryTotalTDOC.FieldByName('Total').AsFloat;
             end;
          1: begin
                if qryTotalTDOC.Locate('UnidNegoc;CodTipDoc;RecPag',
                                           VarArrayOf([rUnidNeg,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryTotalTDOC.FieldByName('Total').AsFloat;
             end;
          2: begin
                if qryTotalTDOC.Locate('CodCentroRespon;CodTipDoc;RecPag',
                                           VarArrayOf([sCRespon,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryTotalTDOC.FieldByName('Total').AsFloat;
             end;
          3: begin
                if qryTotalTDOC.Locate('CodCentroCusto;CodTipDoc;RecPag',
                                           VarArrayOf([sCCusto,rCodTipDoc,sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryTotalTDOC.FieldByName('Total').AsFloat;
             end;
       end;
    end;

   if (sCodTipRecDes<>'') then
    begin
       case rgQuebra.ItemIndex of
          0: begin
                if qryTotalTRD.Locate('CodTipRecDes;RecPag',VarArrayOf([Trim(sCodTipRecDes),sRecPag]),
                                          [loCaseInsensitive]) then
                   Result:=qryTotalTRD.FieldByName('Total').AsFloat;
             end;
          1: begin
                if qryTotalTRD.Locate('UnidNegoc;CodTipRecDes;RecPag',
                                           VarArrayOf([rUnidNeg,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryTotalTRD.FieldByName('Total').AsFloat;
             end;
          2: begin
                if qryTotalTRD.Locate('CodCentroRespon;CodTipRecDes;RecPag',
                                           VarArrayOf([sCRespon,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryTotalTRD.FieldByName('Total').AsFloat;
             end;
          3: begin
                if qryTotalTRD.Locate('CodCentroCusto;CodTipRecDes;RecPag',
                                           VarArrayOf([sCCusto,Trim(sCodTipRecDes),sRecPag]),
                                           [loCaseInsensitive]) then
                   Result:=qryTotalTRD.FieldByName('Total').AsFloat;
             end;
       end;
    end;
end;

// ============================================================================
// Rotinas do Relatório
// ============================================================================

procedure TfrmConsultaFluxo.BandaDetalheBeforePrint(Sender: TObject);
begin
   inherited;
   ppLineSeparacao.Visible:=False;
   ppDBTextRecPag.Visible:=True;
   ppDBTextValor1.Visible:=True;
   ppDBTextValor2.Visible:=True;
   ppDBTextValor3.Visible:=True;
   ppDBTextValor4.Visible:=True;
   ppDBTextValor5.Visible:=True;

   if (Copy(Trim(qryImp.FieldByName('RECPAG').AsString),1,3)='---') or
      (Copy(Trim(qryImp.FieldByName('RECPAG').AsString),1,3)='===') or
      (Copy(Trim(qryImp.FieldByName('RECPAG').AsString),1,3)='___') then
   begin
      ppLineSeparacao.Visible:=True;
      ppDBTextRecPag.Visible:=False;
      ppDBTextValor1.Visible:=False;
      ppDBTextValor2.Visible:=False;
      ppDBTextValor3.Visible:=False;
      ppDBTextValor4.Visible:=False;
      ppDBTextValor5.Visible:=False;
   end;
end;

procedure TfrmConsultaFluxo.CarregaQryImpressao;
var
   iLinha     : Integer;
   iColuna    : Integer;
   iColunaRef : Integer;
   iSecao     : Integer;    //Seção = conjunto de 5 Dias
   iNumSecoes : Integer;
   iTotalCol  : Integer;
begin
   qryImp.Close;
   qryImp.Open;
   iTotalCol:=(sgFluxo.ColCount-1);
   iNumSecoes:=((sgFluxo.ColCount-1) div 5);
   if ((sgFluxo.ColCount-1) mod 5)>0 then Inc(iNumSecoes);
   for iSecao:=1 to iNumSecoes do
   begin
      for iLinha:=2 to sgFluxo.RowCount-1 do
      begin
         qryImp.Append;
         iColunaRef:=(iSecao-1)*5;
         qryImp.FieldByName('RECPAG').AsString:=sgFluxo.Cells[0,iLinha];

         for iColuna:=1 to Min(iTotalCol,5) do
         begin
            qryImp.FieldByName('DATA'+IntToStr(iColuna)).AsString:=Trim(sgFluxo.Cells[iColunaRef+iColuna,0]);
            qryImp.FieldByName('VALOR'+IntToStr(iColuna)).AsString:=Trim(sgFluxo.Cells[iColunaRef+iColuna,iLinha]);
            qryImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat:=ExtraiCor(iColunaRef+iColuna,iLinha);
            if (Pos('(',qryImp.FieldByName('VALOR'+IntToStr(iColuna)).AsString)<>0) and
               (qryImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat=clBlack) then
               qryImp.FieldByName('COR'+IntToStr(iColuna)).AsFloat:=clRed;
         end;
         
         qryImp.Post;
      end;
      iTotalCol:=iTotalCol-5;
   end;
end;

procedure TfrmConsultaFluxo.LblEmpresaPrint(Sender: TObject);
begin
   LblEmpresa.Caption:=Sistema.NomeEmpresa;
end;

procedure TfrmConsultaFluxo.lblTituloPrint(Sender: TObject);
begin
   if Modulo.sPRO = 'P' then
      lblTitulo.Caption:='Fluxo Previsto de '+deDatIni.Text+' a '+deDatFim.Text;
   if Modulo.sPRO = 'R' then
      lblTitulo.Caption:='Fluxo Realizado de '+deDatIni.Text+' a '+deDatFim.Text;
   if Modulo.sPRO = 'O' then
      lblTitulo.Caption:='Fluxo Orçado de '+deDatIni.Text+' a '+deDatFim.Text;
end;

procedure TfrmConsultaFluxo.ppLabelDataPrint(Sender: TObject);
begin
   if TppLabel(Sender).Name='ppLabelData1' then
      ppLabelData1.Caption:=Trim(qryImp.FieldByName('DATA1').AsString);
   if TppLabel(Sender).Name='ppLabelData2' then
      ppLabelData2.Caption:=Trim(qryImp.FieldByName('DATA2').AsString);
   if TppLabel(Sender).Name='ppLabelData3' then
      ppLabelData3.Caption:=Trim(qryImp.FieldByName('DATA3').AsString);
   if TppLabel(Sender).Name='ppLabelData4' then
      ppLabelData4.Caption:=Trim(qryImp.FieldByName('DATA4').AsString);
   if TppLabel(Sender).Name='ppLabelData5' then
      ppLabelData5.Caption:=Trim(qryImp.FieldByName('DATA5').AsString);
end;

procedure TfrmConsultaFluxo.ppDBTextValorPrint(Sender: TObject);
begin
   if TppDBText(Sender).Name='ppDBTextValor1' then
    begin
       ppDBTextValor1.Font.Color:=Trunc(qryImp.FieldByName('COR1').AsFloat);
       ppDBTextValor1.Font.Style:=RetornaEstilo(qryImp.FieldByName('COR1').AsFloat);
    end;

   if TppDBText(Sender).Name='ppDBTextValor2' then
    begin
       ppDBTextValor2.Font.Color:=Trunc(qryImp.FieldByName('COR2').AsFloat);
       ppDBTextValor2.Font.Style:=RetornaEstilo(qryImp.FieldByName('COR2').AsFloat);
    end;

   if TppDBText(Sender).Name='ppDBTextValor3' then
    begin
       ppDBTextValor3.Font.Color:=Trunc(qryImp.FieldByName('COR3').AsFloat);
       ppDBTextValor3.Font.Style:=RetornaEstilo(qryImp.FieldByName('COR3').AsFloat);
    end;

   if TppDBText(Sender).Name='ppDBTextValor4' then
    begin
       ppDBTextValor4.Font.Color:=Trunc(qryImp.FieldByName('COR4').AsFloat);
       ppDBTextValor4.Font.Style:=RetornaEstilo(qryImp.FieldByName('COR4').AsFloat);
    end;

   if TppDBText(Sender).Name='ppDBTextValor5' then
    begin
       ppDBTextValor5.Font.Color:=Trunc(qryImp.FieldByName('COR5').AsFloat);
       ppDBTextValor5.Font.Style:=RetornaEstilo(qryImp.FieldByName('COR5').AsFloat);
    end;
end;

procedure TfrmConsultaFluxo.LblSistemaPrint(Sender: TObject);
begin
   LblSistema.Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

function TfrmConsultaFluxo.RetornaEstilo(Cor: Real): TFontStyles;
begin
   Result:=[fsItalic];
   if (Trunc(Cor)=shpRecSemPrev.Brush.Color) or
      (Trunc(Cor)=shpPgtoSemPrev.Brush.Color) or (Trunc(Cor)=clBlack) then
      Result:=[];
end;

function TfrmConsultaFluxo.Replicate(sPadrao: String;
  iQtde: Integer): String;
var
   iRepeticao : Integer;
begin
   Result:='';
   if iQtde<1 then Exit;
   for iRepeticao:=1 to iQtde do
       Result:=Result+sPadrao;
end;

procedure TfrmConsultaFluxo.AplicaFator;
var
   iX,iY : Integer;
begin
   for iX:=1 to sgFluxo.ColCount do
      for iY:=2 to sgFluxo.RowCount do
         sgFluxo.Cells[iX,iY]:=FormatFloat('#,##0.00;(#,##0.00)',
                    (StrToFloat(SubstSimb(sgFluxoAux.Cells[iX-1,iY-2]))/edFatorDivisaoMoeda.Value));
end;

function TfrmConsultaFluxo.SubstSimb(sTexto: String): String;
var
   bNegativo : Boolean;
begin
   bNegativo:=False;
   Result:=Trim(sTexto);
   if Result='' then
      Result:='0'
   else
    begin
       while (Pos('(',Result)<>0) do
       begin
          bNegativo:=True;
          Result:=Copy(Result,1,Pos('(',Result)-1)+
                  Copy(Result,Pos('(',Result)+1,Length(Result)-Pos('(',Result));
       end;

       while (Pos('.',Result)<>0) do
          Result:=Copy(Result,1,Pos('.',Result)-1)+
                  Copy(Result,Pos('.',Result)+1,Length(Result)-Pos('.',Result));

       while (Pos(')',Result)<>0) do
          Result:=Copy(Result,1,Pos(')',Result)-1)+
                  Copy(Result,Pos(')',Result)+1,Length(Result)-Pos(')',Result));
    end;
    if bNegativo then Result:='-'+Result;
end;

end.
