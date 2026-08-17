unit dRelVendaFranquiaShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppCache, ppVar, ppCtrls, ppPrnabl, ppModule,
  raCodMod, uCtrlRelIndicadores, TXRB;

type
  TdtmRelVendaFranquiaShop = class(TFrmCmReportImob)
    ppVendaFranquiaShop: TppReport;
    ppl: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppOrcamentoLabel42: TppLabel;
    lblEmpresa: TppLabel;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel5: TppLabel;
    ppLine6: TppLine;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel20: TppLabel;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel2: TppLabel;
    lblTxtCota: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppdbMinUPV: TppDBText;
    ppDBText14: TppDBText;
    ppdbOvgUPV: TppDBText;
    vTotAlug: TppVariable;
    iPerABL: TppVariable;
    iPerVen: TppVariable;
    iPerTot: TppVariable;
    iPerVenda: TppVariable;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLine9: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel16: TppLabel;
    ppLine4: TppLine;
    ppLine7: TppLine;
    cvTotMin: TppDBCalc;
    cvTotOver: TppDBCalc;
    ppTotABL: TppVariable;
    ppTotVen: TppVariable;
    ppTotAlug: TppVariable;
    ppTotPerVenda: TppVariable;
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelVendaFranquiaShop: TdtmRelVendaFranquiaShop;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}


procedure TdtmRelVendaFranquiaShop.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelVendaFranquia( -1,
                                   CmpRptCM.ParamValues[0].AsInteger,    // idMarca
                                   ModuloIndicadores.iIdIndVenda,
                                   ModuloIndicadores.iIdIndOverage,
                                   ModuloIndicadores.iIdIndAluguel,
                                   ModuloIndicadores.iIdIndABL,
                                   ModuloIndicadores.iMoeCodigoUPV,
                                   CmpRptCM.ParamValues[1].AsInteger,    // Mes Competencia
                                   CmpRptCM.ParamValues[2].AsInteger,    // Ano Competencia
                                   2 );                                  // Order By

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;



procedure TdtmRelVendaFranquiaShop.ppGroupHeaderBand1BeforePrint(Sender: TObject);
var bmReg  : TBookMark;
    sMarca : String;
begin
  inherited;
  // Gera os totais para exibir os percentuais no detalhe
  ppTotABL.Value  := 0;
  ppTotVen.Value  := 0;
  ppTotAlug.Value := 0;
  bmReg  := cds.GetBookmark;
  sMarca := cds.FieldByName('MRCNOME').AsString;
  while (cds.FieldByName('MRCNOME').AsString = sMarca) and (not cds.Eof) do begin
    ppTotABL.Value  := ppTotAbl.Value  + cds.FieldByName('QTDEABL').AsFloat;
    ppTotVen.Value  := ppTotVen.Value  + cds.FieldByName('VENUPVM2').AsFloat;
    ppTotAlug.Value := ppTotAlug.Value + cds.FieldByName('MINUPVM2').AsFloat +
                                         cds.FieldByName('OVERUPVM2').AsFloat;
    cds.Next;
  end;
  cds.GotoBookmark(bmReg);
  cds.FreeBookmark(bmReg);
end;


procedure TdtmRelVendaFranquiaShop.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelVendaFranquiaShop.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
