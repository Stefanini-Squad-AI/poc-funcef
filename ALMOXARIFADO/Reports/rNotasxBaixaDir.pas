unit rNotasxBaixaDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppCtrls, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport;

type
  TRptNotasxBaixaDir = class(TFrmCmReport)
    spNotasxBaixaDir: TCMSqlParams;
    CdsNotasxBaixaDir: TCMClientDataSet;
    ppNotasxBaixaDir: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    LblEmpresa: TppLabel;
    LbPeriodo: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    LbSistema: TppLabel;
    ppCalc3: TppSystemVariable;
    ppLine3: TppLine;
    ppCalc4: TppSystemVariable;
    bdeNotasxBaixaDir: TppBDEPipeline;
    dsNotasxBaixaDir: TwwDataSource;
    ppLabel1: TppLabel;
    lbForn: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel9: TppLabel;
    ppDBText1: TppDBText;
    ppLabel10: TppLabel;
    ppDBText2: TppDBText;
    ppLabel11: TppLabel;
    ppDBText3: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine6: TppLine;
    ppDBText14: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    sDescFor : String;
  public
    { Public declarations }
  end;

var
  RptNotasxBaixaDir: TRptNotasxBaixaDir;

implementation

{$R *.DFM}

procedure TRptNotasxBaixaDir.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  spNotasxBaixaDir.Prepare;

  If CmpRptCM.ParamValues[2].AsFloat = 0 Then
     spNotasxBaixaDir.ParamByName('IDFORCLI').ClearLine
  Else
     spNotasxBaixaDir.ParamByName('IDFORCLI').AsFloat := CmpRptCM.ParamValues[2].AsFloat;

  spNotasxBaixaDir.ParamByName('DATAINI').AsDate    := CmpRptCM.ParamValues[0].AsDateTime;
  spNotasxBaixaDir.ParamByName('DATAFIM').AsDate    := CmpRptCM.ParamValues[1].AsDateTime;
  spNotasxBaixaDir.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;

  spNotasxBaixaDir.Open;

  lbPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  If Not CmpRptCM.ParamValues[2].IsNull Then
     lbForn.Caption := sDescFor;
end;

procedure TRptNotasxBaixaDir.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName('DATAINI').TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName('DATAFIM').TextDefault := DateToStr( Date );
end;

procedure TRptNotasxBaixaDir.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index Of
     2 : sDescFor := TPainelControles(Sender).ProcuraForCli.Text;
  End;
end;

end.
