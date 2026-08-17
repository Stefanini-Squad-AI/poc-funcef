{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}

unit rMaiorFornCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart, DBChart, ppChrtDB, ppChrt, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport, uCtrlParamIntegra;

type
  TRptMaiorFornCli = class(TFrmCmReport)
    DsMaiorFornCli: TwwDataSource;
    CdsMaiorFornCli: TCMClientDataSet;
    SqlMaiorFornCli: TCMSqlParams;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    RptMaiorFornCli: TppReport;
    ppHeaderBand9: TppHeaderBand;
    LblTitMaiorForCli: TppLabel;
    ppLine17: TppLine;
    ppLabel23: TppLabel;
    RptMaiorFornCliLabel1: TppLabel;
    RptMaiorFornCliLabel2: TppLabel;
    ppDetailBand9: TppDetailBand;
    RptMaiorFornCliDBText1: TppDBText;
    RptMaiorFornCliDBText2: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    ppLabel24: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    RptMaiorFornCliSummaryBand1: TppSummaryBand;
    RptMaiorFornCliDBCalc1: TppDBCalc;
    RptMaiorFornCliLabel3: TppLabel;
    RptMaiorFornCliDBTeeChart1: TppDBTeeChart;
    Series1: TPieSeries;
    PpMaiorFornCli: TppBDEPipeline;
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptMaiorFornCli: TRptMaiorFornCli;

implementation

{$R *.DFM}

procedure TRptMaiorFornCli.FormCreate(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'P' then
  begin
    CmpRptCM.ParamValues[2].Caption := 'Lista os Maiores Formecedores';
    RptMaiorFornCliLabel1.Caption := 'Fornecedores';
    CmpRptCM.Caption := 'Maiores Fornecedores';
  end
  else
  begin
    CmpRptCM.ParamValues[2].Caption := 'Lista os Maiores Cliente';
    RptMaiorFornCliLabel1.Caption := 'Clientes';
    CmpRptCM.Caption := 'Maiores Clientes';
  end;

end;

procedure TRptMaiorFornCli.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql: string;
  iCountReg: Integer;
  rValor: Double;
begin
  inherited;
  if ((not CmpRptCM.ParamValues[0].IsNull) and (CmpRptCM.ParamValues[1].IsNull))
    or
    ((CmpRptCM.ParamValues[0].IsNull) and (not CmpRptCM.ParamValues[1].IsNull))
      then
  begin
    Exit;
  end;
//  sSql := 'SELECT /*+ RULE */ PFORCLI.RAZAOSOCIAL AS FORNECEDOR, ' +  //Everson TIBERO
  sSql := 'SELECT PFORCLI.RAZAOSOCIAL AS FORNECEDOR, ' +  //Everson TIBERO
    ' SUM(DECODE(DOC.RECPAG,''P'',DECODE(LC.DEBCRE,''D'',RA.VALOR*-1,RA.VALOR),DECODE(LC.DEBCRE,''D'',RA.VALOR,RA.VALOR*-1))) AS VALORTOTAL ' +
    ' FROM ' +
    ' PESSOA PFORCLI, ' +
    ' LANCTODOCUM LC, ' +
    ' DOCUMENTO DOC, ' +
    ' RATEIODOCUM RA ' +
    ' WHERE ' +
    ' (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ' +
    ' (DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') AND ';

  if ((not CmpRptCM.ParamValues[0].IsNull) and (not
    CmpRptCM.ParamValues[1].IsNull)) then
    sSql := sSql +
      ' (LC.DATALANCTO BETWEEN TO_DATE(''' + CmpRptCM.ParamValues[0].AsString +
        ''',''DD/MM/YYYY'') AND TO_DATE(''' + CmpRptCM.ParamValues[1].AsString +
        ''',''DD/MM/YYYY'')) AND ';

  sSql := sSql +
    ' (DOC.IDFORCLI = PFORCLI.IDPESSOA) AND ' +
    ' (RTRIM(LC.OPERACAO) = ''1'' OR  RTRIM(LC.OPERACAO) = ''2'' OR RTRIM(LC.OPERACAO) = ''10'') AND ' +
    ' (LC.CODDOCUMENTO = DOC.CODDOCUMENTO) AND ' +
    ' (RA.CODDOCUMENTO = DOC.CODDOCUMENTO) ' +
    ' GROUP BY PFORCLI.RAZAOSOCIAL  ' +
    ' ORDER BY VALORTOTAL DESC';

  if ParamIntegra.RecPag = 'R' then
    LblTitMaiorForCli.Caption := 'Os ' + CmpRptCM.ParamValues[2].AsString +
      ' Maiores Clientes'
  else
    LblTitMaiorForCli.Caption := 'Os ' + CmpRptCM.ParamValues[2].AsString +
      ' Maiores Fornecedores';

  SqlAux.SQL.clear;
  SqlAux.SQL.Add(sSql);
  SqlAux.Open;
  CdsAux.First;

  SqlMaiorFornCli.Open;

  iCountReg := 0;
  rValor := 0;
  while not CdsAux.Eof do
  begin
    Inc(iCountReg);
    if iCountReg <= StrToInt(CmpRptCM.ParamValues[2].AsString) then
    begin
      CdsMaiorFornCli.Append;
      CdsMaiorFornCli.FieldByName('VALORTOTAL').AsFloat :=
        CdsAux.FieldByName('VALORTOTAL').AsFloat;
      CdsMaiorFornCli.FieldByName('FORNECEDOR').AsString :=
        CdsAux.FieldByName('FORNECEDOR').AsString;
      CdsMaiorFornCli.Post;
    end
    else
      rvalor := rvalor + CdsAux.FieldByName('VALORTOTAL').AsFloat;
    CdsAux.Next;
  end;

  if rValor <> 0 then
  begin
    CdsMaiorFornCli.Append;
    CdsMaiorFornCli.FieldByName('VALORTOTAL').AsFloat := rvalor;
    CdsMaiorFornCli.FieldByName('FORNECEDOR').AsString := 'Outros';
    CdsMaiorFornCli.Post;
  end;
end;

end.

