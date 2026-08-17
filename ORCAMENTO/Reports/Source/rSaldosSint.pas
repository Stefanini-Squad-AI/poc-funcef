unit rSaldosSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppCtrls,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmSqlParams, MontaSelect, uCtrlOrcamento, TXRB, uCtrlRptOrcamen,

  uCtrlRelatOrcamento, uCtrlPadroes;

type
  TrptSaldosSint = class(TFrmCmReport)
    CdsSaldosSint: TCMClientDataSet;
    dsSaldosSint: TwwDataSource;
    pplSaldosSint: TppBDEPipeline;
    rpSaldosSint: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    lbAdicionais2: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    rpSaldosSintDBText2: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine3: TppLine;
    ppLabel65: TppLabel;
    ppCalc14: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel66: TppLabel;
    ppLabel74: TppLabel;
    ppLabel77: TppLabel;
    ppLabel79: TppLabel;
    ppLabel81: TppLabel;
    ppDBText31: TppDBText;
    rpSaldosSintDBText3: TppDBText;
    rpSaldosSintLabel1: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLine20: TppLine;
    sqlSaldosSintC: TCMSqlParams;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    ppDBImage1: TppDBImage;
    lbAdicionais: TppLabel;
    CdsImagem: TCMClientDataSet;
    pplImagem: TppBDEPipeline;
    dsImagem: TDataSource;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlSaldosSintFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlSaldosSintCFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
     CtrlRelatOrcamento: TCtrlRelatOrcamento;
  public
    { Public declarations }
  end;

var
  rptSaldosSint: TrptSaldosSint;

implementation

uses uModulo, uSistema, uFuncaoGeral, uMensErro, uData;

{$R *.DFM}




procedure TrptSaldosSint.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatOrcamento := TCtrlRelatOrcamento.Create;
  CtrlRelatOrcamento.InitializeAs(Padroes);

  // Cria SQL Parametro Exercício
  with CmpRptCM.ParamValues[0].LookupSettings.SQL do
  begin
    Clear;
    Add('SELECT EXERCICIO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE IDPESSOA = ' + IntToStr(sistema.idEmpresa));
    Add('GROUP BY EXERCICIO');
  end;

  // Cria SQL Parametro Período Inicial
  with CmpRptCM.ParamValues[1].LookupSettings.SQL do
  begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;

  // Cria SQL Parametro Período Final
  with CmpRptCM.ParamValues[2].LookupSettings.SQL do
  begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;

  // Inicializa Parametro Grau
  with CmpRptCM.ParamValues[6].SpinEditSettings do
  begin
   MaxValue := FuncaoGeral.CalcGrauMax(Modulo.sMascaraGrupo);
   Value    := MaxValue;
   MinValue := 1;
  end;
end;



procedure TrptSaldosSint.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  if Index = 0 then begin
    // Cria SQL Parametro Período Inicial
    with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
      Clear;
      Add('SELECT PERIODO, NOMEPERIODO');
      Add('FROM PERIODOORCAMEN');
      Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
      Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
      Add('ORDER BY PERIODO');
    end;
    // Cria SQL Parametro Período Final
    with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
      Clear;
      Add('SELECT PERIODO, NOMEPERIODO');
      Add('FROM PERIODOORCAMEN');
      Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
      Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
      Add('ORDER BY PERIODO');
    end;
  end;
end;




procedure TrptSaldosSint.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CdsImagem.Data     := CtrlRelatOrcamento.ListaImagem(Sistema.IdEmpresa);
  CdsSaldosSint.Data := CtrlRelatOrcamento.ListaSaldoGrupoOrcamen(Sistema.IdEmpresa,
                                                                  CmpRptCM.ParamValues[0].AsInteger,
                                                                  CmpRptCM.ParamValues[1].AsInteger,
                                                                  CmpRptCM.ParamValues[2].AsInteger,
                                                                  CmpRptCM.ParamValues[9].AsFloat,
                                                                  CmpRptCM.ParamValues[11].AsString,
                                                                  CmpRptCM.ParamValues[12].AsString,
                                                                  CmpRptCM.ParamValues[13].AsString,
                                                                  CmpRptCM.ParamValues[14].AsString,
                                                                  CmpRptCM.ParamValues[5].AsInteger,
                                                                  CmpRptCM.ParamValues[10].AsInteger);
  lbAdicionais.Caption  := CmpRptCM.ParamValues[15].AsString;
  lbAdicionais2.Caption := CmpRptCM.ParamValues[16].AsString;

end;




procedure TrptSaldosSint.sqlSaldosSintFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'CONTA') or (sParamName = 'GRUPO') or
     (sParamName = 'ORDENACAO') then
    sNewValue := sOldValue;
end;




procedure TrptSaldosSint.sqlSaldosSintCFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'CONTA') or (sParamName = 'GRUPO') or
     (sParamName = 'ORDENACAO') then
    sNewValue := sOldValue;
end;




procedure TrptSaldosSint.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelatOrcamento);
  inherited;
end;

end.
