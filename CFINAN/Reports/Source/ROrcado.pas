unit ROrcado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlRptOrcado;

type
  TRptOrcado = class(TFrmCmReport)
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    sMascaraCAR   : String;
    sMascaraCAP   : String;
    iNumMaxEleCAR : Integer;
    iNumMaxEleCAP : Integer;
    CtrlRptOrcado : TCtrlRptOrcado;
  public
    { Public declarations }
  end;

var
  RptOrcado: TRptOrcado;

implementation

{$R *.DFM}

{ TRptOrcado }

uses uCtrlParamIntegra, uFuncaoGeral, dBaseDados, uSistema;

procedure TRptOrcado.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRptOrcado:=TCtrlRptOrcado.Create;
   CtrlRptOrcado.Initialize(dtmBaseDados.dbBaseDados,True);
end;

procedure TRptOrcado.FormDestroy(Sender: TObject);
begin
   CtrlRptOrcado.Free;
   inherited;
end;

procedure TRptOrcado.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].TextDefault:=FormatDateTime('dd/mm/yyyy',Date);
   CmpRptCM.ParamValues[1].TextDefault:=FormatDateTime('dd/mm/yyyy',Date);

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT UNIDNEGOC,NOME '+
                                                    'FROM UNIDNEGOCIO '+
                                                    'WHERE (IDPESSOA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT CODCENTRORESPON,NOME '+
                                                    'FROM CENTRESPON '+
                                                    'WHERE (IDPESSOA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT CODCENTROCUSTO,NOME '+
                                                    'FROM CENTCUST '+
                                                    'WHERE (IDEMPRESA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   ParamIntegra.GetParams(Trunc(CrmRptCM.IdEmpresa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);

   sMascaraCAR:=ParamIntegra.MascaraReceb;
   sMascaraCAP:=ParamIntegra.MascaraDesemb;

   CmpRptCM.ParamValues[4].SpinEditSettings.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   CmpRptCM.ParamValues[4].SpinEditSettings.Value:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   CmpRptCM.ParamValues[5].SpinEditSettings.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);
   CmpRptCM.ParamValues[5].SpinEditSettings.Value:=FuncaoGeral.CalcGrauMax(sMascaraCAP);

   iNumMaxEleCAR:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,FuncaoGeral.CalcGrauMax(sMascaraCAR));
   iNumMaxEleCAP:=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,FuncaoGeral.CalcGrauMax(sMascaraCAP));
end;

end.
