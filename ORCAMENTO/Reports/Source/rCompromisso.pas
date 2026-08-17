unit rCompromisso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, ppVar,
  ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, TXRB;

type
  TrptCompromisso = class(TFrmCmReport)
    cdsCompromissoImp: TCMClientDataSet;
    dsCompromisso: TwwDataSource;
    pplCompromisso: TppBDEPipeline;
    pplCompromissoppField1: TppField;
    pplCompromissoppField2: TppField;
    pplCompromissoppField3: TppField;
    pplCompromissoppField4: TppField;
    pplCompromissoppField5: TppField;
    pplCompromissoppField6: TppField;
    pplCompromissoppField7: TppField;
    pplCompromissoppField8: TppField;
    pplCompromissoppField9: TppField;
    pplCompromissoppField10: TppField;
    rpCompromisso: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel179: TppLabel;
    ppLine45: TppLine;
    ppLabel180: TppLabel;
    ppDetailBand19: TppDetailBand;
    rptCompromissoShape1: TppShape;
    rptCompromissoLabel3: TppLabel;
    rptCompromissoDBText3: TppDBText;
    rptCompromissoLabel4: TppLabel;
    rptCompromissoDBText5: TppDBText;
    rptCompromissoDBText4: TppDBText;
    rptCompromissoDBText6: TppDBText;
    rptCompromissoLabel5: TppLabel;
    rptCompromissoLabel6: TppLabel;
    rptCompromissoDBText7: TppDBText;
    rptCompromissoDBText1: TppDBText;
    rptCompromissoLabel1: TppLabel;
    rptCompromissoLabel2: TppLabel;
    rptCompromissoDBText2: TppDBText;
    rptCompromissoLabel7: TppLabel;
    rptCompromissoDBText8: TppDBText;
    rptCompromissoLine1: TppLine;
    rptCompromissoLine2: TppLine;
    rptCompromissoLabel8: TppLabel;
    rptCompromissoLabel9: TppLabel;
    txtSaldoCompromisso: TppLabel;
    rptCompromissoDBMemo1: TppDBMemo;
    ppLabel245: TppLabel;
    txtSaldoAntCompromisso: TppLabel;
    ppLabel164: TppLabel;
    ppLine75: TppLine;
    ppLine74: TppLine;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    txtValorOrcado: TppLabel;
    ppFooterBand20: TppFooterBand;
    ppLine47: TppLine;
    ppLabel193: TppLabel;
    ppCalc40: TppSystemVariable;
    ppCalc41: TppSystemVariable;
    sqlCompromissoImp: TCMSqlParams;
    sqlValorOrcado: TCMSqlParams;
    cdsValorOrcado: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptCompromisso: TrptCompromisso;

implementation

{$R *.DFM}
//************************************************
Procedure TrptCompromisso.CrmRptCMBeforePrint(Sender: TObject);
Var
  iDia, iMes, iAno : Word;
  sMesRef : String;
Begin
  Inherited;
  sqlCompromissoImp.Prepare;
  sqlCompromissoImp.ParamByName('NUMRESERVA').asInteger := CmpRptCM.ParamValues[0].AsInteger;
  sqlCompromissoImp.ParamByName('IDPESSOA').asInteger   := Trunc( CrmRptCM.IdEmpresa );
  sqlCompromissoImp.Open;
  DecodeDate(cdsCompromissoImp.FieldByName('DATAREFERENCIA').asDateTime,iAno, iMes,iDia);
  if iMes < 10 then
    sMesRef := IntToStr(iAno)+'0'+IntToStr(iMes)
  else
    sMesRef := IntToStr(iAno)+IntToStr(iMes);
  sqlValorOrcado.Prepare;
  sqlValorOrcado.ParamByName('IDPLANOORCAMEN').asInteger := cdsCompromissoImp.FieldByName('IDPLANOORCAMEN').asInteger;
  sqlValorOrcado.ParamByName('IDCONTAORCAMEN').asString  := cdsCompromissoImp.FieldByName('IDCONTAORCAMEN').asString;
  sqlValorOrcado.ParamByName('ANOMESREF').asString       := sMesRef;
  sqlValorOrcado.ParamByName('IDPESSOA').asInteger       := tRUNC( CrmRptCM.IdEmpresa );
  sqlValorOrcado.Open;

  txtValorOrcado.caption         := FormatFloat( '###,###,###,###,##0.00',
                                                 cdsValorOrcado.FieldByName('VLRORCADO').asFloat);
  txtSaldoCompromisso.caption    := FormatFloat( '###,###,###,###,##0.00',
                                                 CmpRptCM.ParamValues[1].AsFloat );
  txtSaldoAntCompromisso.caption := FormatFloat( '###,###,###,###,##0.00',
                                                 CmpRptCM.ParamValues[1].AsFloat + cdsCompromissoImp.FieldByName('VLRRESERVA').AsFloat);
End;
//************************************************
End.
