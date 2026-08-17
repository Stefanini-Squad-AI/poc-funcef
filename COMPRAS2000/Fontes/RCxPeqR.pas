unit RCxPeqR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, TXRB;

Const
    LIN = 31;
type
  TRptCxPeqR = class(TFrmCmReport)
    qryCxPeq: TwwQuery;
    qryCxPeqIDLANCCXPEQ: TFloatField;
    qryCxPeqDESCCENTCUST: TStringField;
    qryCxPeqDESCSUBCONTA: TStringField;
    qryCxPeqDESCCONTA: TStringField;
    qryCxPeqDESCCENTRESP: TStringField;
    qryCxPeqATIVPROJ: TStringField;
    qryCxPeqRECPAG: TStringField;
    qryCxPeqTIPODESEMB: TStringField;
    qryCxPeqDESCARTIGO: TStringField;
    qryCxPeqNUMSOLCOMPRA: TFloatField;
    qryCxPeqNODOCUMENTO: TStringField;
    qryCxPeqDATALANC: TDateTimeField;
    qryCxPeqVLRLANC: TFloatField;
    qryCxPeqHISTLANCAMENTO: TStringField;
    qryCxPeqIDBORDEROCXPEQ: TFloatField;
    qryCxPeqDATAEFETBORDERO: TDateTimeField;
    qryCxPeqIDCAIXAPEQUENO: TFloatField;
    dsCxPeq: TwwDataSource;
    pplCxPeqR: TppBDEPipeline;
    ppImpCxPeqR: TppReport;
    ppHeaderBand5: TppHeaderBand;
    LbTituloCxPeqR: TppLabel;
    ppLine10: TppLine;
    ppLabel20: TppLabel;
    ppImpCxPeqResLabel1: TppLabel;
    ppImpCxPeqResLabel2: TppLabel;
    ppImpCxPeqResLabel3: TppLabel;
    ppImpCxPeqResLabel4: TppLabel;
    ppImpCxPeqResLabel5: TppLabel;
    ppImpCxPeqResLabel6: TppLabel;
    ppImpCxPeqResLabel7: TppLabel;
    ppImpCxPeqResLabel8: TppLabel;
    ppImpCxPeqResLabel9: TppLabel;
    ppImpCxPeqResLine1: TppLine;
    ppDetailBand5: TppDetailBand;
    ppImpCxPeqResDBText1: TppDBText;
    ppImpCxPeqResDBText2: TppDBText;
    ppImpCxPeqResDBText3: TppDBText;
    ppImpCxPeqResDBMemo1: TppDBMemo;
    ppImpCxPeqResDBText5: TppDBText;
    ppImpCxPeqResDBText6: TppDBText;
    ppImpCxPeqResDBText7: TppDBText;
    ppImpCxPeqResDBText4: TppDBText;
    ppImpCxPeqResDBText8: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine14: TppLine;
    ppLabel57: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppImpCxPeqRSummaryBand1: TppSummaryBand;
    ppImpCxPeqRDBCalc1: TppDBCalc;
    ppImpCxPeqRLabel1: TppLabel;
    ppImpCxPeqRLine1: TppLine;
    qryBord: TwwQuery;
    qryBordIDCAIXAPEQUENO: TFloatField;
    qryBordDATAEFETBORDERO: TDateTimeField;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    sNomeCX : String;
  public
    { Public declarations }
  end;

var
  RptCxPeqR: TRptCxPeqR;

implementation

{$R *.DFM}

procedure TRptCxPeqR.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
 If qryCxPeq.Active Then
     qryCxPeq.Close;
  qryCxPeq.DataBaseName := sDataBaseName;
 //
 If qryBord.Active Then
    qryBord.Close;
 qryBord.DataBaseName := sDataBaseName;

end;

procedure TRptCxPeqR.CrmRptCMBeforePrint(Sender: TObject);
Var
   iIdCaixaPeq : LongInt;
begin
  inherited;
  If Not CmpRptCM.ParamValues[1].IsNull Then
     Begin
        qryBord.Close;
        qryBord.ParamByName('pIDBORD').AsFloat      := CmpRptCM.ParamValues[1].AsFloat;
        qryBord.ParamByName('pIDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
        qryBord.ParamByName('pIDUSUARIO').AsInteger := CrmRptCM.IdUsuario;
        qryBord.Open;
        If Not qryBord.IsEmpty Then
           Begin
              iIdCaixaPeq := qryBord.FieldByName('IDCAIXAPEQUENO').AsInteger;
              CmpRptCM.ParamValues[0].LookupSettings.Chave := IntToStr(iIdCaixaPeq);
           End
        Else
           Begin
              iIdCaixaPeq := -1;
           End;
        qryCxPeq.Close;
        qryCxPeq.SQL.Delete(LIN);
        qryCxPeq.SQL.Insert(LIN,'(LA.IDBORDEROCXPEQ ='+FloatToStr(CmpRptCM.ParamValues[1].AsFloat)+')');
        qryCxPeq.Params[0].AsInteger := iIdCaixaPeq;
        qryCxPeq.Open;
     End
  Else
     Begin
        iIdCaixaPeq := StrToInt(CmpRptCM.ParamValues[0].AsString);
        //
        qryCxPeq.Close;
        qryCxPeq.SQL.Delete(LIN);
        qryCxPeq.SQL.Insert(LIN,'(LA.IDBORDEROCXPEQ IS NULL)');
        qryCxPeq.Params[0].AsInteger := iIdCaixaPeq;
        qryCxPeq.Open;
     End;
  If Not CmpRptCM.ParamValues[0].IsNull Then
     LbTituloCxPeqR.Caption := 'Caixa Pequeno: ' + sNomeCX;
  If Not CmpRptCM.ParamValues[1].IsNull Then
     LbTituloCxPeqR.Caption := ' - Borderô Nº: ' + CmpRptCM.ParamValues[1].AsString + ' - do dia: ' + qryCxPeq.FieldByName('DATAEFETBORDERO').AsString;
end;

procedure TRptCxPeqR.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index Of
    0: Begin
          If Trim(TPainelControles(Sender).CtrlLookup.Text) <> '' Then
             CmpRptCM.ParamValues[1].Required := False;
          sNomeCX := TPainelControles(Sender).CtrlLookup.Text;
       End;
    1: Begin
          If Trim(TPainelControles(Sender).CtrlRealEdit.Text) <> '' Then
             CmpRptCM.ParamValues[0].Required := False;
       End;
  End;
end;

end.
