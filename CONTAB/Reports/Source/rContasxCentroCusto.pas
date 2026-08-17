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

unit rContasxCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RRelatWeb, uCmRptManager, TXComp, CmParamReport, DBClient, Provider,uCtrlRptBalancete,
  ADODB, Db, DBTables, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, uCtrlPeriodo,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uSistema, FCmReport, uCmSqlParams, uCMClientDataSet;

type
  TrptContasxCentroCusto = class(TFrmCmReport)
    cdsContaCC: TCMClientDataSet;
    sqlContaCC: TCMSqlParams;
    rptContaCC: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLine15: TppLine;
    LblEmpresa: TppLabel;
    ppLabel24: TppLabel;
    ppLine16: TppLine;
    ppLabel25: TppLabel;
    ppLblTituloContaCC2: TppLabel;
    bndDetContaCC: TppDetailBand;
    dbtxtCCustoCC: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine17: TppLine;
    lblsistema: TppLabel;
    rptContaCCLabel2: TppLabel;
    lblContCoCC: TppLabel;
    ppCalc12: TppSystemVariable;
    lblCalcCoCC: TppSystemVariable;
    rptContaCCGroup1: TppGroup;
    rptContaCCGroupHeaderBand1: TppGroupHeaderBand;
    rptContaCCLabel1: TppLabel;
    dbtxtContaCC: TppDBText;
    rptContaCCDBText2: TppDBText;
    rptContaCCLine1: TppLine;
    rptContaCCLine2: TppLine;
    rptContaCCGroupFooterBand1: TppGroupFooterBand;
    pplContaCC: TppBDEPipeline;
    pplContaCCppField1: TppField;
    pplContaCCppField2: TppField;
    pplContaCCppField3: TppField;
    pplContaCCppField4: TppField;
    pplContaCCppField5: TppField;
    dsContaCC: TwwDataSource;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rptContaCCGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure bndDetContaCCBeforeGenerate(Sender: TObject);
    procedure ppFooterBand6BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     CtrlRptBalancete : TCtrlRptBalancete;
     CtrlPeriodo      : TCtrlPeriodo;
     sMascara,sTitulo       : String;
     sMascaraCCusto : String;
     iPagIni : Integer;
  public
    { Public declarations }
  end;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, 
     uModulo, uData, uFuncaoGeral,uCtrlParamIntegra;

{$R *.DFM}

procedure TrptContasxCentroCusto.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

   CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[4].AsDateTime));

   sTitulo := '';

   iPagIni := CmpRptCm.ParamValues[5].AsInteger;

   if trim(CmpRptCm.ParamValues[0].AsString) <> '' then
      sTitulo := sTitulo +  '     Conta Inicial : ' + CmpRptCm.ParamValues[0].AsString;
   if trim(CmpRptCm.ParamValues[1].AsString) <> '' then
      sTitulo := sTitulo +  '     Conta Final : ' + CmpRptCm.ParamValues[1].AsString;

   pplblTituloContaCC2.caption := sTitulo;

   //Configura a quebra de página
   if CmpRptCm.ParamValues[3].AsBoolean then
      rptContaCC.Groups[0].NewPage := true
   else
      rptContaCC.Groups[0].NewPage := false;

   with sqlContaCC do begin
      SQL.Clear;
      SQL.Add('SELECT                                           ');
      SQL.Add('   C.PLACONTA, CC.CODEXTERNO AS CODCENTROCUSTO, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,     ');
      SQL.Add('   C.PLAGRAU, CC.NOME                            ');
      SQL.Add('FROM                                             ');
      SQL.Add('   PLANOCONTA C, CONTASXCC CX, CENTCUST CC,      ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD ');

      SQL.Add('WHERE                                            ');
      SQL.Add('    ((C.PLANO = CX.PLANO) AND                    ');
      SQL.Add('     (C.PLACONTA = CX.PLACONTA)) AND             ');
      SQL.Add('    ((CX.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND ');
      SQL.Add('    (CX.IDEMPRESA = CC.IDEMPRESA)) AND           ');
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND            ');

      //Bruno Bastos - Pend. 15346 - 14/12/2004 - Início
      SQL.Add('    ((CC.ATIVO           = ''S'') OR             ');
      SQL.Add('     (CC.ATIVO          IS NULL)) AND            ');
      SQL.Add('     (C.PLACCUST         = ''S'') AND            ');
      //Bruno Bastos - Pend. 15346 - 14/12/2004 - Fim

      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                  ');
      SQL.Add('    (C.PLANO =:PLANO) AND                        ');
      SQL.Add('    (CX.IDEMPRESA =:PESSOA) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) >=:CONTAINI) AND          ');
      SQL.Add('    (RTRIM(C.PLACONTA) <=:CONTAFIM)              ');
      SQL.Add('ORDER BY                                         ');
      SQL.Add('    C.PLACONTA, CODCENTROCUSTO                   ');

      Prepare;

      ParamByName('PLANO').asInteger  := Modulo.iPlano;
      ParamByName('PESSOA').asFloat   := CrmRptCM.IdEmpresa;

      if trim(CmpRptCM.ParamValues[0].AsString) <> '' then begin
         ParamByName('CONTAINI').asString := CmpRptCM.ParamValues[0].AsString;
      end else begin
         ParamByName('CONTAINI').asString := '1';
      end;

      if trim(CmpRptCM.ParamValues[1].AsString) <> '' then begin
         ParamByName('CONTAFIM').asString := CmpRptCM.ParamValues[1].AsString;
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;

      Open;
   end;
   sMascara       := '';
   sMascaraCCusto := '';
   if CmpRptCm.ParamValues[2].AsBoolean then
   begin
     sMascara       := modulo.sMascaraContas;
     sMascaraCCusto := modulo.sMascaraCCusto;
   end;


end;

procedure TrptContasxCentroCusto.rptContaCCGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  if sMascara <> '' then begin
     sMascara := FuncaoGeral.CalcMascaraPorGrau(sMascara, CdsContaCC.FieldByName('PLAGRAU').asInteger);
     dbtxtContaCC.DisplayFormat := sMascara + ';0; ';
  end;
end;

procedure TrptContasxCentroCusto.bndDetContaCCBeforeGenerate(
  Sender: TObject);
begin
  inherited;
  //Configura a máscara das contas contábeis
  if sMascaraCCusto <> '' then begin
     sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(sMascaraCCusto, FuncaoGeral.CalcGrau(sMascaraCCusto, CdsContaCC.FieldByName('CODCENTROCUSTO').asString));
     dbtxtCCustoCC.DisplayFormat := sMascaraCCusto + ';0; ';
  end;
end;

procedure TrptContasxCentroCusto.ppFooterBand6BeforePrint(Sender: TObject);
begin
  inherited;
  lblContCoCC.Caption := IntToStr((iPagIni + StrToInt(lblCalcCoCC.text)) - 1);
end;

procedure TrptContasxCentroCusto.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

end;

procedure TrptContasxCentroCusto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptContasxCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.free;
  CtrlPeriodo.free;

end;

end.
