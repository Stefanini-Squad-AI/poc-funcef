unit dRelRdsHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppModule, raCodMod, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, uCtrlRelHotel, ppStrtch, ppRegion, TXRB;

type
  TdtmRelRDSHotel = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppRdsHotel: TppReport;
    CMspUH: TCMSqlParams;
    cdsUH: TClientDataSet;
    dsUH: TDataSource;
    pplUH: TppBDEPipeline;
    ppOrcamentoHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppOrcamentoDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDscDetalhe: TppDBText;
    ppOrcamentoDBText4: TppDBText;
    ppOrcamentoDBText5: TppDBText;
    ppOrcamentoDBText6: TppDBText;
    ppOrcamentoDBText7: TppDBText;
    ppOrcamentoDBText8: TppDBText;
    ppOrcamentoDBText9: TppDBText;
    ppOrcamentoDBText11: TppDBText;
    vTot: TppVariable;
    ppDBText1: TppDBText;
    ppOrcamentoFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppOrcamentoSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGrpQuebra: TppGroup;
    ppOrcamentoGroupHeaderBand1: TppGroupHeaderBand;
    ppDscQuebra: TppDBText;
    ppOrcamentoLine3: TppLine;
    ppOrcamentoGroupFooterBand1: TppGroupFooterBand;
    ppOrcamentoLine4: TppLine;
    ppOrcamentoLine6: TppLine;
    ppOrcamentoLabel15: TppLabel;
    vTD1: TppVariable;
    vTD2: TppVariable;
    vTD3: TppVariable;
    vTD4: TppVariable;
    vTD5: TppVariable;
    vTD6: TppVariable;
    vTD7: TppVariable;
    vPTot: TppVariable;
    vPAnt: TppVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine1: TppLine;
    ppShape1: TppShape;
    lblPercent: TppLabel;
    vPer1: TppVariable;
    vPer2: TppVariable;
    vPer3: TppVariable;
    vPer4: TppVariable;
    vPer5: TppVariable;
    vPer6: TppVariable;
    vPer7: TppVariable;
    vPerSem: TppVariable;
    vPerMes: TppVariable;
    RegRodape: TppRegion;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelHotel : TCtrlRelHotel;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelRDSHotel: TdtmRelRDSHotel;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelRDSHotel.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelHotel := TCtrlRelHotel.Create;
  CtrlRelHotel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelHotel.BuscaRelRDS(3755,                                // idReport no SAD
                                       CmpRptCM.ParamValues[0].AsInteger,   // idImovel
                                       CmpRptCM.ParamValues[1].AsInteger,   // id do grupo de Apuracao
                                       CmpRptCM.ParamValues[2].AsDateTime); // Data de Início

  cdsUH.Data := CtrlRelHotel.BuscaUH_Hotel(3755,                                // idReport no SAD
                                           CmpRptCM.ParamValues[0].AsInteger,   // idImovel
                                           ModuloIndicadores.iidindUHHotel,
                                           CmpRptCM.ParamValues[2].AsDateTime); // Data de Início

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelRDSHotel.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelHotel);
end;

procedure TdtmRelRDSHotel.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelRDSHotel.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
