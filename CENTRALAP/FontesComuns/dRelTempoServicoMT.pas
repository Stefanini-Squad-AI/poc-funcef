unit dRelTempoServicoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBTables, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Db,
  Wwquery, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBClient,
  uCMClientDataSet, uCtrlTempoServico, dBaseDados, usistema, TXRB;

type
  TdtmRelTempoServicoMT = class(TFrmCmReport)
    ppTempoServico: TppBDEPipeline;
    ppTempoServicoppField1: TppField;
    ppTempoServicoppField2: TppField;
    ppTempoServicoppField3: TppField;
    ppTempoServicoppField4: TppField;
    ppTempoServicoppField5: TppField;
    ppTempoServicoppField6: TppField;
    ppTempoServicoppField7: TppField;
    ppTempoServicoppField8: TppField;
    ppTempoServicoppField9: TppField;
    ppTempoServicoppField10: TppField;
    ppTempoServicoppField11: TppField;
    ppTempoServicoppField12: TppField;
    ppTempoServicoppField13: TppField;
    ppTempoServicoppField14: TppField;
    ppTempoServicoppField15: TppField;
    ppTempoServicoppField16: TppField;
    ppTempoServicoppField17: TppField;
    ppTempoServicoppField18: TppField;
    ppTempoServicoppField19: TppField;
    ppTempoServicoppField20: TppField;
    ppTempoServicoppField21: TppField;
    ppTempoServicoppField22: TppField;
    ppTempoServicoppField23: TppField;
    ppTempoServicoppField24: TppField;
    ppTempoServicoppField25: TppField;
    ppTempoServicoppField26: TppField;
    ppTempoServicoppField27: TppField;
    ppTempoServicoppField28: TppField;
    ppTempoServicoppField29: TppField;
    dsTempoServico: TwwDataSource;
    ppRTempoServico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    rpResumoCobrDBImage1: TppDBImage;
    rpResumoCobrDBText1: TppDBText;
    rpResumoCobrDBText2: TppDBText;
    rpResumoCobrDBText3: TppDBText;
    rpResumoCobrDBText11: TppDBText;
    rpResumoCobrLabel10: TppLabel;
    rpResumoCobrDBText14: TppDBText;
    rpResumoCobrDBText12: TppDBText;
    rpResumoCobrDBText13: TppDBText;
    rpResumoCobrDBText10: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLinha: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel21: TppLabel;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    pplblDescTempo: TppLabel;
    ppLabel23: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText13: TppDBText;
    ppLabel17: TppLabel;
    ppDBText14: TppDBText;
    ppLabel18: TppLabel;
    ppLine1: TppLine;
    ppLabel22: TppLabel;
    ppDBText16: TppDBText;
    ppLabel24: TppLabel;
    ppDBText17: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    lblDataRef: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    CDSTempoServico: TCMClientDataSet;
    CDSFundacao: TCMClientDataSet;
    lblSimulacao: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private
    CMClientDataSet1: TCMClientDataSet; declarations }
    CtrlTempoServico : TCtrlTempoServico;
    sDataReferencia  : string;
    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  dtmRelTempoServicoMT: TdtmRelTempoServicoMT;

implementation

uses FPRelHisFuncionalMT, FPRel2ViaCChequeMT;

{$R *.DFM}

procedure TdtmRelTempoServicoMT.CrmRptCMBeforePrint(Sender: TObject);
var strAux : string;
    sTempoTotal, sTempoSemConversao : String;
    iTempoSimples : LongInt;
    iSeq, iTotal : Integer;
    cdsAux : TcmClientDataSet;
    IntAux : Integer;
begin
  inherited;
  try
    cdsAux := TcmClientDataSet.Create(dtmRelTempoServicoMT);
    CtrlTempoServico := TCtrlTempoServico.Create;

    sDataReferencia := CmpRptCM.ParamValues[1].asString;

    CtrlTempoServico.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro);

    CdsFundacao.close;
    CdsFundacao.Data := CtrlTempoServico.BuscaDadosFundacao(sistema.IdEmpresa);

    CdsTempoServico.Close;
    CdsTempoServico.Data := CtrlTempoServico.CalculaTempos(CmpRptCM.ParamValues[0].asInteger, strToDate(CmpRptCM.ParamValues[1].asString));

    // tavares 11/04/2003    - modo simulação
    if strToDate(CmpRptCM.ParamValues[1].asString) > Date then
    begin
      lblSimulacao.visible := true;
    end;

     try
       pplblDescTempo.Caption:='';
     except end;

     try
       dtmRelTempoServicoMT.pplblDescTempo.Caption := 'Tempo de Manutenção calculado até '+ CmpRptCM.ParamValues[3].asstring;
     except end;

   finally
     cdsAux.Free;
   end;
end;

procedure TdtmRelTempoServicoMT.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlTempoServico);
end;


procedure TdtmRelTempoServicoMT.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;


procedure TdtmRelTempoServicoMT.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  if ppLinha.Brush.Color = clSilver then
    ppLinha.Brush.Color := clWhite
  else
    ppLinha.Brush.Color := clSilver;
end;

procedure TdtmRelTempoServicoMT.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  try
    lblDataRef.Caption := sDataReferencia;
  except end;
end;

end.
