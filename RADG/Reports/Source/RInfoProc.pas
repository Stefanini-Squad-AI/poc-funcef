
{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit RInfoProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCmSqlParams, uCMClientDataSet, Wwquery;

type
  TrptInfoProc = class(TFrmCmReport)
    sqlInfoProc: TCMSqlParams;
    cdsInfoProc: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    cdsProcesso: TCMClientDataSet;
    RptInfoProc: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    lblEmpresa: TppLabel;
    ppLabel9: TppLabel;
    LbProc3: TppLabel;
    ppLine3: TppLine;
    ppDetailBand3: TppDetailBand;
    RptInfoProcDBText5: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine4: TppLine;
    lblSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel12: TppLabel;
    ppDBText5: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLabel13: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLine5: TppLine;
    ppLine7: TppLine;
    RptInfoProcLabel1: TppLabel;
    RptInfoProcLabel2: TppLabel;
    RptInfoProcLabel3: TppLabel;
    RptInfoProcLabel4: TppLabel;
    RptInfoProcLabel5: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    RptInfoProcDBText1: TppDBText;
    RptInfoProcDBText2: TppDBText;
    RptInfoProcDBText3: TppDBText;
    RptInfoProcDBText4: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    dsInfoProc: TwwDataSource;
    bdeInfoProc: TppBDEPipeline;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

Uses dBaseDados;

procedure TrptInfoProc.CrmRptCMBeforePrint(Sender: TObject);
var sNomeProc : String;
begin
   inherited;
   sNomeProc := '';
   LbProc3.Caption := ' TODOS ';
   If CmpRptCM.ParamValues[0].AsInteger <> 0 Then Begin
      sqlProcesso.Prepare;
      sqlProcesso.ParamByName('IDTIPOPROCESSO').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
      sqlProcesso.Open;
      sNomeProc := cdsProcesso.FieldByName('NOME').AsString;
      LbProc3.Caption := sNomeProc;
   end;
   sqlInfoProc.Prepare;
   If sNomeProc <> '' Then
      sqlInfoProc.ParamByName( 'IDTIPOPROCESSO' ).AsInteger := CmpRptCM.ParamValues[ 0 ].AsInteger
   Else
      sqlInfoProc.ParamByName( 'IDTIPOPROCESSO' ).ClearLine;
   sqlInfoProc.Open;
end;

end.
