unit dRelVendaAtividade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppCache, ppVar, ppCtrls, ppPrnabl, ppModule,
  raCodMod, uCtrlRelIndicadores, TXRB;

type
  TdtmRelVendaAtividade = class(TFrmCmReportImob)
    ppVendaAtividade: TppReport;
    ppl: TppBDEPipeline;
    CMspLojasVagas: TCMSqlParams;
    cdsLojasVagas: TClientDataSet;
    dsLojasVagas: TDataSource;
    pplLojasVagas: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppOrcamentoLabel42: TppLabel;
    lblEmpresa: TppLabel;
    ppDetailBand1: TppDetailBand;
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
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
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
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel16: TppLabel;
    ppLine4: TppLine;
    ppLine7: TppLine;
    cvTotMin: TppDBCalc;
    ppLabel17: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel19: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    cvTotOver: TppDBCalc;
    ppTotABL: TppVariable;
    ppTotVen: TppVariable;
    ppTotAlug: TppVariable;
    ppTotPerVenda: TppVariable;
    lblTxtCota: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppsCor: TppShape;
    pplSeparador: TppLine;
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
  dtmRelVendaAtividade: TdtmRelVendaAtividade;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}


procedure TdtmRelVendaAtividade.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelVendaAtividade(
                                   CmpRptCM.ParamValues[0].AsInteger, -1, // idImovel
                                   ModuloIndicadores.iIdIndVenda,
                                   ModuloIndicadores.iIdIndOverage,
                                   ModuloIndicadores.iIdIndAluguel,
                                   ModuloIndicadores.iIdIndABL,
                                   ModuloIndicadores.iMoeCodigoUPV,
                                   CmpRptCM.ParamValues[1].AsInteger,     // Mes Competencia
                                   CmpRptCM.ParamValues[2].AsInteger,     // Ano Competencia
                                   1 );                                   // Order By

  cdsLojasVagas.Data := CtrlRelIndicadores.BuscaLojasVagas(
                                   CmpRptCM.ParamValues[0].AsInteger,     // idImovel
                                   CmpRptCM.ParamValues[1].AsInteger,     // Mes Competencia
                                   CmpRptCM.ParamValues[2].AsInteger);    // Ano Competencia

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;



procedure TdtmRelVendaAtividade.ppGroupHeaderBand1BeforePrint(Sender: TObject);
var bmReg   : TBookMark;
    sImovel : String;
begin
  inherited;
  // Gera os totais para exibir os percentuais no detalhe
  ppTotABL.Value  := 0;
  ppTotVen.Value  := 0;
  ppTotAlug.Value := 0;
  bmReg   := cds.GetBookmark;
  sImovel := cds.FieldByName('IMONOME').AsString;
  while (cds.FieldByName('IMONOME').AsString = sImovel) and (not cds.Eof) do begin
    ppTotABL.Value  := ppTotAbl.Value  + cds.FieldByName('QTDEABL').AsFloat;
    ppTotVen.Value  := ppTotVen.Value  + cds.FieldByName('VENUPVM2').AsFloat;
    ppTotAlug.Value := ppTotAlug.Value + cds.FieldByName('MINUPVM2').AsFloat +
                                         cds.FieldByName('OVERUPVM2').AsFloat;
    cds.Next;
  end;
  cds.GotoBookmark(bmReg);
  cds.FreeBookmark(bmReg);
end;


procedure TdtmRelVendaAtividade.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelVendaAtividade.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
