unit rExtMovSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager, TXComp,
  CmParamReport, DBTables, Wwquery, comctrls;

type
  TRptExtMovSint = class(TFrmCmReport)
    SqlParExtMovSint: TCMSqlParams;
    CdsExtMovSint: TCMClientDataSet;
    dsExtMovSint: TwwDataSource;
    bdeExtMovSint: TppBDEPipeline;
    RptExtMovSint: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel59: TppLabel;
    LblEmpresa: TppLabel;
    RptExtMovSintLine1: TppLine;
    RptExtMovSintLabel1: TppLabel;
    lbAlmox: TppLabel;
    RptExtMovSintLine3: TppLine;
    RptExtMovSintLabel2: TppLabel;
    RptExtMovSintLine4: TppLine;
    RptExtMovSintLabel3: TppLabel;
    RptExtMovSintLabel4: TppLabel;
    RptExtMovSintLabel5: TppLabel;
    LbPeriodo: TppLabel;
    RptExtMovSintLabel7: TppLabel;
    RptExtMovSintLine5: TppLine;
    RptExtMovSintLabel8: TppLabel;
    RptExtMovSintLabel9: TppLabel;
    RptExtMovSintLabel10: TppLabel;
    RptExtMovSintLabel11: TppLabel;
    ppLabel224: TppLabel;
    ppLabel225: TppLabel;
    ppLine99: TppLine;
    ppLine100: TppLine;
    ppLabel226: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppFooterBand17: TppFooterBand;
    ppLine38: TppLine;
    LbSistema: TppLabel;
    ppCalc32: TppSystemVariable;
    ppCalc33: TppSystemVariable;
    RptExtMovSintSummaryBand1: TppSummaryBand;
    RptExtMovSintLine6: TppLine;
    RptExtMovSintGroup1: TppGroup;
    RptExtMovSintGroupHeaderBand1: TppGroupHeaderBand;
    RptExtMovSintLine2: TppLine;
    RptExtMovSintDBText1: TppDBText;
    RptExtMovSintDBText2: TppDBText;
    RptExtMovSintGroupFooterBand1: TppGroupFooterBand;
    RptExtMovSintDBCalc3: TppDBCalc;
    RptExtMovSintDBCalc4: TppDBCalc;
    RptExtMovSintDBText3: TppDBText;
    RptExtMovSintDBText4: TppDBText;
    RptExtMovSintDBText5: TppDBText;
    RptExtMovSintDBText6: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure SqlParExtMovSintFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptExtMovSint: TRptExtMovSint;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

Uses uSistema, uString;

procedure TRptExtMovSint.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptExtMovSint.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlParExtMovSint Do Begin
       Prepare;

       If CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName('GRUPO').ClearLine;

       ParamByName('ALMOX').AsInteger   := CmpRptCM.ParamValues[ 0 ].AsInteger;
       ParamByName('DATAINI').AsDate    := CmpRptCM.ParamValues[ 1 ].AsDateTime;
       ParamByName('DATAFIM').AsDate    := CmpRptCM.ParamValues[ 2 ].AsDateTime;
       ParamByName('IDEMPRESA').AsFloat := CrmRptCM.IdEmpresa;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName('GRUPO').AsString := CmpRptCM.ParamValues[ 3 ].AsString;

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          ParamByName('CONDICAO').AsString := '  ( (NVL(MOV.QTDENTRADA,0) <> 0) OR (NVL(MOV.QTDSAIDA,0) <> 0) )'
       Else
          ParamByName('CONDICAO').AsString := '  ( (NVL(MOV.QTDENTRADA,0) <> 0) OR (NVL(MOV.QTDSAIDA,0) <> 0)  OR (NVL(ANT.QTDSALDOANT,0) <> 0))';
       Open;
  End;

  lbAlmox.Caption   := sNomeAlmox;
  lbPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[ 1 ].AsString + ' a ' + CmpRptCM.ParamValues[ 2 ].AsString;
end;

procedure TRptExtMovSint.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName('ALMOXARIFADO').LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName('DATAINICIAL').TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName('DATAFINAL').TextDefault   := DateToStr( Date );
end;


procedure TRptExtMovSint.SqlParExtMovSintFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  If sParamName = 'CONDICAO' Then
     sNewValue := sOldValue;
end;

end.






