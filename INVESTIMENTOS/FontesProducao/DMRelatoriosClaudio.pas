//******************************************************************************
// Data      : 11/06/2007
// Pendência :
// SOL       :
// Código    : AL_26
// Motivo    : Alteração QryTotTipoOper para não trazer operações de origem dos
//              direitos, carteiragerencial e transf. entre planos
//******************************************************************************
// Data      : 24/03/2006
// Pendência :
// SOL       :
// Código    : AL_25
// Motivo    : Alteração para Active = False da QryTotTipoOper e tratamento do tipo
//             de operacao -113 Acerto de Custo que não tem quantidade
//******************************************************************************
// Data      : 24/03/2006
// Pendência :
// SOL       :
// Código    : AL_24
// Motivo    : Melhoria do lay-out do RpTotTipoOper
//******************************************************************************
// Data      : 19/01/2006
// Pendência : 233367
// SOL       : 21140
// Código    : AL_23
// Motivo    : Acerto na paginação do relatório Enquadramento por Participação nas Empresasga)
//******************************************************************************
// Data     : 21/12/2005
// Código   : AL_4
// Motivo   : Ajuste no posicionamento das labels de preço para não sair em negrito
//******************************************************************************
// Data     : 24/10/2005
// Código   : AL_3
// Motivo   : Inclusão do IR, ajuste na performance da query, inclusão do preço
//              médio por lote liquido na prória query (DFM) e impressão zebrada
//******************************************************************************
// Data     : 13/10/2005
// Código   : AL_2
// Motivo   : Ajuste para somar a Remuneração no valor bruto da operação e
//              diminuir o valor do IR s/ Remuneração e IR no Valor Líquido
//******************************************************************************
// Data     : 16/08/2005
// Código   : AL_1
// Motivo   : A query QryTotTipoOper passa a ter o SQL definitivo alimentado por
//              parametros
//            Ajuste no componente RpTotTipoOper para acertar o nome do
//              documento na impressora
//******************************************************************************

unit DMRelatoriosClaudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, Db, ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe;

type
  TdtmRelatoriosClaudio = class(TdtmReports)
    PpParticEmp: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLine12: TppLine;
    ppLabel17: TppLabel;
    PpParticEmpLabel1: TppLabel;
    PpParticEmpLabel2: TppLabel;
    PpParticEmpLabel3: TppLabel;
    PpParticEmpLabel4: TppLabel;
    PpParticEmpLabel5: TppLabel;
    PpParticEmpLabel6: TppLabel;
    ppDetailBand7: TppDetailBand;
    PpParticEmpDBText3: TppDBText;
    PpParticEmpDBText5: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine13: TppLine;
    ppLabel18: TppLabel;
    PpParticEmpGroup3: TppGroup;
    PpParticEmpGroupHeaderBand3: TppGroupHeaderBand;
    PpParticEmpDBText1: TppDBText;
    PpParticEmpDBText4: TppDBText;
    PpParticEmpGroupFooterBand3: TppGroupFooterBand;
    PpParticEmpDBCalc1: TppDBCalc;
    PpParticEmpLabel7: TppLabel;
    PpParticEmpGroup4: TppGroup;
    PpParticEmpGroupHeaderBand4: TppGroupHeaderBand;
    PpParticEmpDBText2: TppDBText;
    PpParticEmpGroupFooterBand4: TppGroupFooterBand;
    bdeParticEmp: TppBDEPipeline;
    dtsParticEmp: TwwDataSource;
    qryParticEmp: TwwQuery;
    qryParticEmpSALDOQTDEINVCART: TFloatField;
    qryParticEmpDATAMOVCARTINV: TDateTimeField;
    qryParticEmpTOT: TFloatField;
    qryParticEmpPERCPARTICEMPR: TFloatField;
    qryParticEmpNOME: TStringField;
    qryParticEmpDESCINVESTIMENTO: TStringField;
    qryParticEmpDESCCARTINVEST: TStringField;
    qryParticEmpIDEMISSOR: TFloatField;
    qryParticEmpIDCARTEIRAINVEST: TFloatField;
    qryParticEmpIDINVESTIMENTO: TFloatField;
    lblPerc: TppLabel;
    lblAcima: TppLabel;
    PpParticEmpLine1: TppLine;
    PpParticEmpLine2: TppLine;
    PpParticEmpLine3: TppLine;
    PpParticEmpLine4: TppLine;
    PpParticEmpLabel8: TppLabel;
    PpParticEmpDBText6: TppDBText;
    qryParticEmpTOTACAO: TFloatField;
    LblDataEnq: TppLabel;
    UpdtParticEmp: TUpdateSQL;
    qryParticEmpIDHISTCARTINV: TFloatField;
    PpParticEmpLabel9: TppLabel;
    PpParticEmpLabel10: TppLabel;
    qryParticEmpPERCPARTICRECUR: TFloatField;
    PpParticEmpLabel11: TppLabel;
    PpParticEmpDBText7: TppDBText;
    PpParticEmpLabel12: TppLabel;
    PpParticEmpLabel13: TppLabel;
    a: TppLabel;
    LblPERCRECUR: TppLabel;
    LblAcima2: TppLabel;
    qryParticEmpCOTACAO: TFloatField;
    qryParticEmpQTDTITLOTE: TFloatField;
    LblVlrMerc: TppLabel;
    LblTotValMer: TppLabel;
    LbPercPatric: TppLabel;
    ppBdeTipoOper: TppBDEPipeline;
    DsTipoOper: TwwDataSource;
    QryTotTipoOper: TwwQuery;
    RpTotTipoOper: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppTotTipoOperDBText1: TppDBText;
    ppTotTipoOperDBText2: TppDBText;
    ppTotTipoOperLabel1: TppLabel;
    ppTotTipoOperLabel2: TppLabel;
    lblPrcMed: TppLabel;
    ppTotTipoOperLabel4: TppLabel;
    ppTotTipoOperDBText3: TppDBText;
    ppTotTipoOperDBText4: TppDBText;
    ppTotTipoOperDBText6: TppDBText;
    ppTotTipoOperDBCalc1: TppDBCalc;
    ppTotTipoOperLine4: TppLine;
    ppTotTipoOperLabel5: TppLabel;
    LbDataIni: TppLabel;
    LbDataFim: TppLabel;
    ppBdeMapaCorret: TppBDEPipeline;
    DsMapaCorret: TwwDataSource;
    QryMapaCorret: TwwQuery;
    RpMapaCorret: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    LblDataIniMapaCorret: TppLabel;
    LblDataFimMapaCorret: TppLabel;
    RpMapaCorretDBText1: TppDBText;
    RpMapaCorretLabel3: TppLabel;
    RpMapaCorretLabel4: TppLabel;
    RpMapaCorretLabel5: TppLabel;
    RpMapaCorretLabel6: TppLabel;
    RpMapaCorretLine1: TppLine;
    RpMapaCorretDBText2: TppDBText;
    RpMapaCorretDBText3: TppDBText;
    RpMapaCorretDBText4: TppDBText;
    RpMapaCorretLabel7: TppLabel;
    LbPerc: TppLabel;
    RpMapaCorretLine2: TppLine;
    RpMapaCorretSummaryBand1: TppSummaryBand;
    RpMapaCorretDBCalc1: TppDBCalc;
    RpMapaCorretDBCalc2: TppDBCalc;
    RpMapaCorretDBCalc3: TppDBCalc;
    RpMapaCorretLabel9: TppLabel;
    RpMapaCorretLabel8: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    DBPrecoUnit: TppDBText;
    QryTotTipoOperIDCARTEIRAINVEST: TFloatField;
    QryTotTipoOperDESCCARTINVEST: TStringField;
    QryTotTipoOperIDTIPOOPERACAO: TFloatField;
    QryTotTipoOperDESCTIPOOPERACAO: TStringField;
    QryTotTipoOperIDINVESTIMENTO: TFloatField;
    QryTotTipoOperDESCINVESTIMENTO: TStringField;
    QryTotTipoOperTOTVALOPERACAO: TFloatField;
    QryTotTipoOperTOTQTDOPERACAO: TFloatField;
    QryTotTipoOperPRECOUNIT: TFloatField;
    QryTotTipoOperPRECOUNITXLOTE: TFloatField;
    QryTotTipoOperTOTALLIQUIDO: TFloatField;
    QryTotTipoOperPRECOUNITXLOTELIQ: TFloatField;
    QryTotTipoOperLOTEBASE: TFloatField;
    ppLCarteiraEx: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    QryTotTipoOperTOTIR: TFloatField;
    ppDBImage1: TppDBImage;
    shpCabecalho: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    DbTotTipoOperPMporLote: TppDBText;
    ppDBText1: TppDBText;
    ppLabel9: TppLabel;
    shpTotTipoOperDetalhe: TppShape;
    QryTotTipoOperTOTREMUNER: TFloatField;
    QryTotTipoOperTOTDESPESA: TFloatField;
    ppDBText2: TppDBText;
    ppLabel10: TppLabel;
    ppDBText3: TppDBText;
    ppLabel11: TppLabel;
    procedure ppDetailBand7BeforePrint(Sender: TObject);
    procedure PpParticEmpLabel9Print(Sender: TObject);
    procedure PpParticEmpLabel10Print(Sender: TObject);
    procedure LblPERCRECURPrint(Sender: TObject);
    procedure PpParticEmpGroupFooterBand3BeforePrint(Sender: TObject);
    procedure PpParticEmpGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure LbPercPatricPrint(Sender: TObject);
    procedure RpTotTipoOperBeforePrint(Sender: TObject);
    procedure LbPercPrint(Sender: TObject);
    procedure RpMapaCorretBeforePrint(Sender: TObject);
    procedure RpTotTipoOperStartPage(Sender: TObject);
    procedure shpTotTipoOperDetalhePrint(Sender: TObject);
    procedure ppTotTipoOperGroupFooterBand1AfterPrint(Sender: TObject);
  private
    { Private declarations }
     TotValMercado : Double;
     cCorZebra : TColor;
  public
    { Public declarations }
    wVlrRecursosGarantidores, wTotalDespMapaCorret:Double;
    wImp: Char;

    function MostraParam(Form: string): boolean;  OverRide;

  end;

var
  dtmRelatoriosClaudio: TdtmRelatoriosClaudio;
  wPessoaAtual, wIdCarteira :Integer;
  wVez, wCartAtual       :Integer;
  Total, TotValMercadoAux, ValorMercado : double;

implementation

Uses FParamPerticEmp, Fparamtottipooper, fparammapacorret, USistema,
  dOperComum;


function TdtmRelatoriosClaudio.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form) = 'FRMPARAMPERTICEMP') then
    frm := TFrmParamPerticEmp.Create(Application)
  Else if (UPPERCASE(Form) = 'FRMPARAMTOTTIPOOPER') then
    frm := TFrmparamtottipooper.Create(Application)
  Else if (UPPERCASE(Form) = 'FRMPARAMMAPACORRET') then
    frm := Tfrmparammapacorret.Create(Application)
  else if (UPPERCASE(Form) = '') then begin
    Result := True;
    Exit;
  end else
    frm := nil;

  if frm = nil then
    Result := false
  else begin
    with frm do begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;


{$R *.DFM}

procedure TdtmRelatoriosClaudio.ppDetailBand7BeforePrint(Sender: TObject);
var  Perc, PercRecur: Real;
begin
   inherited;
    if qryParticEmp.FieldByName('Tot').AsFloat <> 0 then
      Perc := qryParticEmp.FieldByName('SALDOQTDEINVCART').AsFloat * 100 /
              qryParticEmp.FieldByName('Tot').AsFloat
    else
      Perc := 0;

    if Perc > qryParticEmp.FieldByName('PERCPARTICEMPR').AsFloat then
    begin
         lblAcima.Text := 'X';
         PpParticEmpLabel9.Font.Color := clRed;
    end
    else
    begin
         lblAcima.Text := '';
         PpParticEmpLabel9.Font.Color := clBlack;
    end;

    if qryParticEmp.FieldByName('Tot').AsFloat <> 0 then
      PercRecur := qryParticEmp.FieldByName('SALDOQTDEINVCART').AsFloat * 100 /
              qryParticEmp.FieldByName('Tot').AsFloat
    else
      PercRecur := 0;

    if PercRecur > qryParticEmp.FieldByName('PERCPARTICRECUR').AsFloat then
    begin
         lblAcima2.Text := 'X';
         LblPERCRECUR.Font.Color := clRed;
    end else  begin
         lblAcima2.Text := '';
         LblPERCRECUR.Font.Color := clBlack;
    end;

    LblVlrMerc.Text:= FormatFloat('###,###,##0.00',
                                 (qryParticEmp.FieldByName('COTACAO').AsFloat
                                 * qryParticEmp.FieldByName('SALDOQTDEINVCART').AsFloat));

    ValorMercado :=  ((qryParticEmp.FieldByName('COTACAO').AsFloat
                     * qryParticEmp.FieldByName('SALDOQTDEINVCART').AsFloat));

    TotValMercado:= TotValMercado + (qryParticEmp.FieldByName('COTACAO').AsFloat*
                                     qryParticEmp.FieldByName('SALDOQTDEINVCART').AsFloat);
end;

procedure TdtmRelatoriosClaudio.PpParticEmpLabel9Print(Sender: TObject);
begin
  inherited;
  if qryParticEmp.FieldByName('TOTACAO').AsFloat <> 0 then
     PpParticEmpLabel9.Text:= FormatFloat('###,###,##0.00',
                             ((qryParticEmp.FieldByName('SALDOQTDEINVCART').AsFloat
                               / qryParticEmp.FieldByName('TOTACAO').AsFloat)*100))
  else
     PpParticEmpLabel9.Text:= '';
end;

procedure TdtmRelatoriosClaudio.PpParticEmpLabel10Print(Sender: TObject);
begin
  inherited;
  if qryParticEmp.FieldByName('TOTACAO').AsFloat <> 0 then
      PpParticEmpLabel10.Caption := FormatFloat('###,###,##0.00',
                                   (PpParticEmpDBCalc1.Value
                                    / qryParticEmp.FieldByName('TOTACAO').AsFloat)*100)
  else
     PpParticEmpLabel10.Caption := '0.00';
end;

procedure TdtmRelatoriosClaudio.LblPERCRECURPrint(Sender: TObject);
Var
  wMes:Integer;
begin
  inherited;
  If wVlrRecursosGarantidores <> 0 Then
    LblPERCRECUR.Text:=FormatFloat('###,###,##0.00',
                                  ( (ValorMercado/wVlrRecursosGarantidores) * 100) )
  Else
    LblPERCRECUR.Text:=FormatFloat('###,###,##0.00',
                                  ( (ValorMercado/1) * 100) );
end;

procedure TdtmRelatoriosClaudio.PpParticEmpGroupFooterBand3BeforePrint(Sender: TObject);
begin
  inherited;
  LblTotValMer.Caption := FormatFloat('###,###,##0.00', TotValMercado);

  TotValMercadoAux := TotValMercado;
  TotValMercado:=0;
end;

procedure TdtmRelatoriosClaudio.PpParticEmpGroupHeaderBand4BeforePrint(Sender: TObject);
begin
  inherited;
  If (wIdCarteira <> qryParticEmp.FieldByName('IDCARTEIRAINVEST').AsInteger) Then
    TotValMercado := 0;

  wIdCarteira := qryParticEmp.FieldByName('IDCARTEIRAINVEST').AsInteger;
end;

procedure TdtmRelatoriosClaudio.LbPercPatricPrint(Sender: TObject);
begin
  inherited;
  If qryParticEmp.FieldByName('TOTACAO').AsFloat <> 0 then
    LbPercPatric.Caption := FormatFloat('###,###,##0.00',
                              (TotValMercadoAux/ QryParticEmp.FieldByName('TOTACAO').AsFloat)*100)
  Else
     LbPercPatric.Caption := '0.00';

end;

procedure TdtmRelatoriosClaudio.RpTotTipoOperBeforePrint(Sender: TObject);
begin
  inherited;
  if wImp = 'S' then begin
     DtmRelatoriosClaudio.DbTotTipoOperPMporLote.Visible := True;
     DtmRelatoriosClaudio.DbTotTipoOperPMporLote.BringToFront;
     DtmRelatoriosClaudio.DBPrecoUnit.Visible := False;
     DtmRelatoriosClaudio.lblPrcMed.Caption := 'Preço Médio por Lote'
     end
  else begin
     DtmRelatoriosClaudio.DbTotTipoOperPMporLote.Visible := False;
     DtmRelatoriosClaudio.DBPrecoUnit.Visible := True;
     DtmRelatoriosClaudio.DBPrecoUnit.BringToFront;
     DtmRelatoriosClaudio.lblPrcMed.Caption := 'Preço Médio'
  end;
end;

procedure TdtmRelatoriosClaudio.LbPercPrint(Sender: TObject);
begin
  inherited;
  LbPerc.Caption := FormatFloat('###,###,###,###,##0.00',
                     (QryMapaCorret.FieldByName('TOTLIQUIDO').AsFloat/wTotalDespMapaCorret)*100);
end;

procedure TdtmRelatoriosClaudio.RpMapaCorretBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel5.Caption := Sistema.NomeEmpresa;
end;

procedure TdtmRelatoriosClaudio.RpTotTipoOperStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpTotTipoOperDetalhe.Brush.Color := clWhite;
end;

procedure TdtmRelatoriosClaudio.shpTotTipoOperDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TdtmRelatoriosClaudio.ppTotTipoOperGroupFooterBand1AfterPrint(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

Initialization


end.


