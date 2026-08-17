unit RContabilDiaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands,
  ppClass, ppReport, ppStrtch, ppSubRpt, ppVar, ppPrnabl, ppCache, ppProd,
  Db, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlRptContabilDiaria, TXRB;

type
  TRptContabilDiaria = class(TFrmCmReport)
    cdsPrevisao: TCMClientDataSet;
    spPrevisao: TCMSqlParams;
    pplPrevisao: TppBDEPipeline;
    pplPrevisaoppField1: TppField;
    pplPrevisaoppField2: TppField;
    pplPrevisaoppField3: TppField;
    pplPrevisaoppField4: TppField;
    pplPrevisaoppField5: TppField;
    pplPrevisaoppField6: TppField;
    dsPrevisao: TwwDataSource;
    rpContabilidade: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel28: TppLabel;
    pplblEmpresa: TppLabel;
    pplblPeriodo: TppLabel;
    ppLabel31: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    rpContabilidadeDBText1: TppDBText;
    ppFooterBand6: TppFooterBand;
    pplblSistema: TppLabel;
    ppLine9: TppLine;
    ppCalc10: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppDBText26: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel45: TppLabel;
    rpContabilidadeDBCalc1: TppDBCalc;
    rpContabilidadeGroup1: TppGroup;
    rpContabilidadeGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText22: TppDBText;
    rpContabilidadeLabel1: TppLabel;
    rpContabilidadeLine1: TppLine;
    rpContabilidadeLine2: TppLine;
    rpContabilidadeGroupFooterBand1: TppGroupFooterBand;
    pplContabilidade: TppBDEPipeline;
    pplContabilidadeppField1: TppField;
    pplContabilidadeppField2: TppField;
    pplContabilidadeppField3: TppField;
    pplContabilidadeppField4: TppField;
    pplContabilidadeppField5: TppField;
    pplContabilidadeppField6: TppField;
    pplContabilidadeppField7: TppField;
    pplContabilidadeppField8: TppField;
    pplContabilidadeppField9: TppField;
    pplContabilidadeppField10: TppField;
    dsContabilidade: TwwDataSource;
    cdsContabilDiaria: TCMClientDataSet;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    lblSaldoAnterior: TppLabel;
    lblSaldoAtual: TppLabel;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }

    rSaldoAnterior : Double;
    rSaldoAtual    : Double;
    CtrlRptContabilDiaria: TCtrlRptContabilDiaria;


  public  { Public declarations }


  end;



var
  RptContabilDiaria: TRptContabilDiaria;



implementation
{$R *.DFM}
uses
  dBaseDados, uSistema;



procedure TRptContabilDiaria.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRptContabilDiaria:=TCtrlRptContabilDiaria.Create;
   CtrlRptContabilDiaria.Initialize(dtmBaseDados.dbBaseDados,True);
end;



procedure TRptContabilDiaria.FormDestroy(Sender: TObject);
begin
   CtrlRptContabilDiaria.Free;
   inherited;
end;



procedure TRptContabilDiaria.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODPORTADOR, '+
                                                    '   DESCRICAO '+
                                                    'FROM PORTADORCONTA '+
                                                    'WHERE (IDPESSOA = '+
                                                     FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY DESCRICAO ';
end;

procedure TRptContabilDiaria.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;

   spPrevisao.Prepare;
   spPrevisao.ParamByName('IDPessoa').AsFloat:=CrmRptCM.IdEmpresa;
   spPrevisao.ParamByName('DATAREF').AsString:=FormatDateTime('dd/mm/yyyy',Date);
   spPrevisao.Open;

   pplblPeriodo.Caption:=FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+' a '+
                         FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);

   cdsContabilDiaria.Data:=CtrlRptContabilDiaria.GeraConatbilDiaria(CmpRptCM.ParamValues[0].AsDateTime,
                                                                    CmpRptCM.ParamValues[1].AsDateTime,
                                                                    CmpRptCM.ParamValues[2].AsFloat,
                                                                    CrmRptCM.IdEmpresa);

   CtrlRptContabilDiaria.GeraSaldos(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[2].AsFloat,
                                    CmpRptCM.ParamValues[0].AsDateTime,
                                    CmpRptCM.ParamValues[1].AsDateTime,
                                    rSaldoAnterior, rSaldoAtual);
   lblSaldoAnterior.Caption:=FormatFloat('#,##0.00',rSaldoAnterior);
   lblSaldoAtual.Caption:=FormatFloat('#,##0.00',rSaldoAtual);   
end;



end.
