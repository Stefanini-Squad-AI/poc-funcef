unit rRetorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, ppVar,
  ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, TXRB;

type
  TrptRetorno = class(TFrmCmReport)
    sqlRetorno: TCMSqlParams;
    cdsRetorno: TCMClientDataSet;
    dsRetorno: TwwDataSource;
    pplRetorno: TppBDEPipeline;
    rpRetorno: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppLabel185: TppLabel;
    ppLine51: TppLine;
    ppLabel187: TppLabel;
    ppDetailBand20: TppDetailBand;
    ppShape5: TppShape;
    ppLabel188: TppLabel;
    ppDBText79: TppDBText;
    ppLabel189: TppLabel;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppLabel190: TppLabel;
    ppDBText83: TppDBText;
    ppLabel191: TppLabel;
    ppLabel192: TppLabel;
    ppDBText84: TppDBText;
    ppLabel194: TppLabel;
    ppDBText85: TppDBText;
    ppLine52: TppLine;
    rptRetornoLine1: TppLine;
    rptRetornoLabel1: TppLabel;
    rptRetornoLabel2: TppLabel;
    rptRetornoLine2: TppLine;
    rptRetornoLabel3: TppLabel;
    txtSaldoRetorno: TppLabel;
    rptRetornoDBMemo1: TppDBMemo;
    ppLabel250: TppLabel;
    txtSaldoAntRetorno: TppLabel;
    ppFooterBand21: TppFooterBand;
    ppLine53: TppLine;
    ppLabel195: TppLabel;
    ppCalc38: TppSystemVariable;
    ppCalc39: TppSystemVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptRetorno: TrptRetorno;

implementation

{$R *.DFM}
//************************************************
Procedure TrptRetorno.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  sqlRetorno.Prepare;
  sqlRetorno.ParamByName('NUMALTERACAO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
  sqlRetorno.ParamByName('IDPESSOA').asInteger     := Trunc( CrmRptCM.IdEmpresa );
  sqlRetorno.Open;

  txtSaldoRetorno.caption    := FormatFloat('###,###,###,###,##0.00',
                                            CmpRptCM.ParamValues[1].AsFloat );
  txtSaldoAntRetorno.caption := FormatFloat('###,###,###,###,##0.00',
                                            CmpRptCM.ParamValues[1].AsFloat + cdsRetorno.FieldByName('VLRSOLICITADO').AsFloat);
End;
//************************************************
End.
