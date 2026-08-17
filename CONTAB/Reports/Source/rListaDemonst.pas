unit rListaDemonst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, ppBands, uCtrlPeriodo,
  ppCtrls, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm,uCtrlRptBalancete,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport,uSistema, TXRB;

type
  TrptListaDemonst = class(TFrmCmReport)
    dsListaDemonst: TwwDataSource;
    pplListaDemonst: TppBDEPipeline;
    rptListaDemonst: TppReport;
    ppHeaderBand14: TppHeaderBand;
    pplblTituloDemo: TppLabel;
    ppLine30: TppLine;
    LblEmpresa: TppLabel;
    pplblTituloDemo2: TppLabel;
    ppDetailBand8: TppDetailBand;
    dbtxtContaDemo: TppDBText;
    rptListaDemonstDBText4: TppDBText;
    dbtxtCCustoDemo: TppDBText;
    rptListaDemonstDBText6: TppDBText;
    rptListaDemonstDBText7: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine32: TppLine;
    LBLSistema: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    rptListaDemonstGroup3: TppGroup;
    rptListaDemonstGroupHeaderBand3: TppGroupHeaderBand;
    rptListaDemonstShape1: TppShape;
    rptListaDemonstLabel1: TppLabel;
    rptListaDemonstDBText1: TppDBText;
    rptListaDemonstGroupFooterBand3: TppGroupFooterBand;
    rptListaDemonstGroup1: TppGroup;
    rptListaDemonstGroupHeaderBand1: TppGroupHeaderBand;
    rptListaDemonstLabel2: TppLabel;
    rptListaDemonstDBText2: TppDBText;
    rptListaDemonstLabel3: TppLabel;
    rptListaDemonstLabel4: TppLabel;
    rptListaDemonstLabel5: TppLabel;
    rptListaDemonstGroupFooterBand1: TppGroupFooterBand;
    rptListaDemonstLine1: TppLine;
    cdsListaDemo: TCMClientDataSet;
    sqlListaDemo: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    procedure ppDetailBand8BeforeGenerate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlPeriodo     :TCtrlPeriodo;
    CtrlRptBalancete :TCtrlRptBalancete;
  public
    { Public declarations }
  end;

var
  rptListaDemonst: TrptListaDemonst;
  sMascara,sMascaraCCusto :string;

implementation

uses UMensErro, uDatabase, DBaseDados, uFuncaoGeral,uModulo;

{$R *.DFM}

procedure TrptListaDemonst.ppDetailBand8BeforeGenerate(Sender: TObject);
begin
  inherited;
   //Configura a máscara das contas contábeis
   sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsListaDemo.FieldByName('PLAGRAU').asInteger);
   dbtxtContaDemo.DisplayFormat := sMascara + ';0; ';

   sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraCCusto, FuncaoGeral.CalcGrau(modulo.sMascaraCCusto, cdsListaDemo.FieldByName('CODCENTROCUSTO').asString));
   dbtxtCCustoDemo.DisplayFormat := sMascaraCCusto + ';0; ';

end;

procedure TrptListaDemonst.CrmRptCMBeforePrint(Sender: TObject);
var  sTitulo:string;
begin
  inherited;
  CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[1].AsDateTime));

   //Imprime os títulos
   sTitulo := '';
   if CmpRptCM.ParamValues[0].AsString <> '' then begin
      with sqlTitulos do begin
          SQL.Clear;
          SQL.Add('SELECT  IDDEMONSTRATIVO, DEMDESCDEMONSTRAT  ');
          SQL.Add('FROM DEMONSTRATIVO ');
          SQL.Add('WHERE (IDDEMONSTRATIVO = '+CmpRptCM.ParamValues[0].asString+') ');
          Open;
      end;

      sTitulo := sTitulo +  '     Demonstrativo : ' + cdsTitulos.FieldByName('DEMDESCDEMONSTRAT').asString;
   end;

   pplblTituloDemo2.caption := sTitulo;


   //Faz a query
   with sqlListaDemo do begin
      SQL.Clear;
      SQL.Add('SELECT                                                                         ');
      SQL.Add('  E.IDDEMONSTRATIVO, E.IDELEMDEMONSTRAT,                                       ');
      SQL.Add('  E.ELEDESCELEM, D.DEMDESCDEMONSTRAT,  SOMA.ELEDESCELEM AS SOMADESCELEMEN,     ');
      SQL.Add('  C.PLACONTA, C.CODCENTROCUSTO, CC.NOME, DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS PLANOME, PC.PLAGRAU                            ');
      SQL.Add('FROM                                                                           ');
      SQL.Add('  COMPOELEMDEM C, DEMONSTRATIVO D, ELEMDEMONSTRATIVO E, ELEMDEMONSTRATIVO SOMA,');
      SQL.Add('  CENTCUST CC, PLANOCONTA PC,                                                  ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD ');

      SQL.Add('WHERE                                                                          ');
      SQL.Add('  (PC.PLACONTA(+) = C.PLACONTA) AND                                            ');
      SQL.Add('  (PC.PLANO(+) = C.PLANO) AND                                                  ');

      SQL.Add('  (PD.PLACONTA(+) = PC.PLACONTA) AND                                            ');
      SQL.Add('  (PD.PLANO(+)    = PC.PLANO)    AND                                            ');

      SQL.Add('  (CC.CODCENTROCUSTO(+) = C.CODCENTROCUSTO) AND                                ');
      SQL.Add('  (CC.IDEMPRESA(+) = C.IDEMPRESA) AND                                          ');
      SQL.Add('  (E.IDDEMONSTRATIVO  = D.IDDEMONSTRATIVO) AND                                 ');
      SQL.Add('  (E.IDELEMDEMONSTRAT = C.IDELEMDEMONSTRAT) AND                                ');
      SQL.Add('  (SOMA.IDELEMDEMONSTRAT(+) = C.ELEMENTODEM) AND                               ');
      SQL.Add('  (D.IDPESSOA =:IDPESSOA)                                                      ');

      if CmpRptCM.ParamValues[0].asString <> '' then begin
         SQL.Add('AND (E.IDDEMONSTRATIVO =:IDDEMONSTRATIVO) ');
      end;
      SQL.Add('ORDER BY                                                                       ');
      SQL.Add('  D.DEMDESCDEMONSTRAT,                                                         ');
      SQL.Add('  E.IDDEMONSTRATIVO,                                                           ');
      SQL.Add('  E.ELEDESCELEM,                                                               ');
      SQL.Add('  E.IDELEMDEMONSTRAT,                                                          ');
      SQL.Add('  SOMA.ELEDESCELEM                                                             ');

      Prepare;
      ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;

      if CmpRptCM.ParamValues[0].asString <> '' then begin
         ParamByName('IDDEMONSTRATIVO').asString  := CmpRptCM.ParamValues[0].asString;
      end;

      Open;

   end;

end;

procedure TrptListaDemonst.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptListaDemonst.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.Free;
  CtrlRptBalancete.free;

end;

end.
