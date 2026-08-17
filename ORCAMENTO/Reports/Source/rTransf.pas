unit rTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, ppVar, ppBands, ppStrtch, ppMemo, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TrptTransf = class(TFrmCmReport)
    cdsTransf: TCMClientDataSet;
    dsTransf: TwwDataSource;
    pplTransf: TppBDEPipeline;
    pplTransfppField1: TppField;
    pplTransfppField2: TppField;
    pplTransfppField3: TppField;
    pplTransfppField4: TppField;
    pplTransfppField5: TppField;
    pplTransfppField6: TppField;
    pplTransfppField7: TppField;
    pplTransfppField8: TppField;
    pplTransfppField9: TppField;
    pplTransfppField10: TppField;
    rpTransf: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel166: TppLabel;
    ppLine43: TppLine;
    ppLabel167: TppLabel;
    ppDetailBand17: TppDetailBand;
    rptTransfShape1: TppShape;
    ppShape3: TppShape;
    ppLabel168: TppLabel;
    ppDBText65: TppDBText;
    ppLabel169: TppLabel;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppLabel170: TppLabel;
    ppDBText70: TppDBText;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppDBText71: TppDBText;
    ppLabel174: TppLabel;
    ppDBText72: TppDBText;
    ppLine44: TppLine;
    rptTransfLabel1: TppLabel;
    rptTransfDBText1: TppDBText;
    rptTransfDBText2: TppDBText;
    rptTransfLine1: TppLine;
    rptTransfLabel2: TppLabel;
    rptTransfLabel3: TppLabel;
    rptTransfLabel4: TppLabel;
    rptTransfLine3: TppLine;
    rptTransfLine4: TppLine;
    rptTransfLabel5: TppLabel;
    rptTransfLine2: TppLine;
    rptTransfLabel6: TppLabel;
    rptTransfLine5: TppLine;
    rptTransfLabel7: TppLabel;
    rptTransfLine6: TppLine;
    rptTransfLine7: TppLine;
    rptTransfLabel8: TppLabel;
    rptTransfLine8: TppLine;
    txtSaldoTransf: TppLabel;
    rptTransfLabel10: TppLabel;
    rptTransfDBMemo1: TppDBMemo;
    ppLabel251: TppLabel;
    txtSaldoAntTransf: TppLabel;
    ppFooterBand18: TppFooterBand;
    ppLine46: TppLine;
    ppLabel175: TppLabel;
    ppCalc34: TppSystemVariable;
    ppCalc35: TppSystemVariable;
    sqlTransf: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptTransf: TrptTransf;

implementation

{$R *.DFM}
//************************************************
Procedure TrptTransf.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  sqlTransf.Prepare;
  sqlTransf.ParamByName('NUMALTERACAO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
  sqlTransf.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
  sqlTransf.Open;

  txtSaldoTransf.caption    := FormatFloat( '###,###,###,###,##0.00',
                                            CmpRptCM.ParamValues[1].AsFloat );
  txtSaldoAntTransf.caption := FormatFloat( '###,###,###,###,##0.00',
                                            CmpRptCM.ParamValues[1].AsFloat + cdsTransf.FieldByName('VLRSOLICITADO').AsFloat);
End;
End.
