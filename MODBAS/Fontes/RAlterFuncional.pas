unit RAlterFuncional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TRptAlterFuncional = class(TdtmReports)
    rpAlterFuncional: TppReport;
    DestacamentoppHeaderBand5: TppHeaderBand;
    DestacamentoppLblTitulo: TppLabel;
    DestacamentoppDBTxtEmpresa: TppDBText;
    DestacamentoppDBTxtCPFCGC: TppDBText;
    DestacamentoppDBTxtTipo: TppDBText;
    DestacamentoppDBTxtEndereco: TppDBText;
    DestacamentorpLabel1: TppLabel;
    DestacamentorpLabel2: TppLabel;
    rpDestacamentoLabel1: TppLabel;
    rpDestacamentoDBText1: TppDBText;
    rpCadDependenteLabel5: TppLabel;
    rpCadDependenteDBText1: TppDBText;
    rpGerencialChildReport1Line1: TppLine;
    DestacamentorpLblMatricula: TppLabel;
    DestacamentorpLblNome: TppLabel;
    rpCadDependenteLabel2: TppLabel;
    rpCadDependenteLabel6: TppLabel;
    rpFeriasProgramLabel2: TppLabel;
    DestacamentorpCalc1: TppSystemVariable;
    DestacamentorpCalc2: TppSystemVariable;
    ppLabel23: TppLabel;
    rpAlterFuncinalDtlBand: TppDetailBand;
    rpAlterFuncinalDBMatric: TppDBText;
    rpAlterFuncinalDBNome: TppDBText;
    rpAlterFuncinalDBDataAlt: TppDBText;
    rpAlterFuncinalDBMotivo: TppDBText;
    rpAlterFuncinalDBCargo: TppDBText;
    ppLine6: TppLine;
    AlterFuncionalppRodape: TppFooterBand;
    DestacamentorpSummaryBand1: TppSummaryBand;
    rpCadDependenteLabel3: TppLabel;
    rpCadDependenteDBCalc1: TppDBCalc;
    ppAlterFuncional: TppBDEPipeline;
    dsAlterFuncional: TDataSource;
    qryAlterFuncional: TQuery;
    updSQL: TUpdateSQL;
    rpAlterFuncinalDBPerc: TppDBText;
    rpAlterFuncionalSalario: TppDBText;
    rpAlterFuncinalDBCCusto: TppDBText;
    ppLabel1: TppLabel;
    rpAlterFuncinalDBFuncao: TppDBText;
    ppLabel2: TppLabel;
    ppAlterFuncionalGroup: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    AlterFuncionalppFooterBand: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBCalc1: TppDBCalc;
    rpAlterFuncionalLblAlteracao: TppLabel;
    procedure DestacamentorpSummaryBand1AfterPrint(Sender: TObject);
    procedure rpAlterFuncinalDtlBandBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  RptAlterFuncional: TRptAlterFuncional;

implementation

uses fParamAlterFuncional, fAguarde, dBaseDados, uFuncoesUteisRH;

{$R *.DFM}

function TRptAlterFuncional.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMALTERFUNCIONAL') then
    frm := TfrmParamAlterFuncional.Create(Application)
  else
  if (AnsiUpperCase(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  begin
    with (frm) do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;


procedure TRptAlterFuncional.DestacamentorpSummaryBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TRptAlterFuncional.rpAlterFuncinalDtlBandBeforePrint(
  Sender: TObject);
begin
  inherited;
  with (dtmBaseDados.qry.SQL) do
  begin
    dtmBaseDados.qry.Close;
    Clear;
    Add('  SELECT');
    Add('     E.IDCARGO, E.IDFUNCAO, E.SALARIO, C1.TITULO AS CARGOANT, C2.TITULO AS FUNCAOANT');
    Add('   FROM');
    Add('     EVOLFUNC E, CARGO C1, CARGO C2');
    Add('   WHERE');
    Add('     (E.IDPESSOA      = ' + qryAlterFuncional.FieldByName('IDPESSOA').asString + ') AND');
    Add('     (E.IDCARGO       = C1.IDCARGO)    AND');
    Add('     (E.IDFUNCAO      = C2.IDCARGO(+)) AND');
    Add('     (E.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                       FROM   EVOLFUNC');
    Add('                       WHERE  (IDPESSOA = '+
                                       qryAlterFuncional.FieldByName('IDPESSOA').asString + ') AND');
    Add('                              (DATAALTERFUNC < TO_DATE('+
                                       QuotedStr(qryAlterFuncional.FieldByName('DATAALTERFUNC').asString)+
                                       ',''DD/MM/YYYY''))))');
    dtmBaseDados.qry.Open;

    if dtmBaseDados.qry.FieldByName('IDCARGO').asString = qryAlterFuncional.FieldByName('IDCARGO').asString then
      rpAlterFuncionalLblAlteracao.Caption :=
         'Mesmo Cargo (' + trim(qryAlterFuncional.FieldByName('CARGO').asString) + ')'
    else
      rpAlterFuncionalLblAlteracao.Caption := 'Cargo ' +
             iff(trim(dtmBaseDados.qry.FieldByName('CARGOANT').asString) = '', '',
             'de ' + trim(dtmBaseDados.qry.FieldByName('CARGOANT').asString) + ' para ') +
             trim(qryAlterFuncional.FieldByName('CARGO').asString);

    if (dtmBaseDados.qry.FieldByName('IDFUNCAO').asString <> '') or
       (qryAlterFuncional.FieldByName('IDFUNCAO').asString <> '') then
    if dtmBaseDados.qry.FieldByName('IDFUNCAO').asString = qryAlterFuncional.FieldByName('IDFUNCAO').asString then
      rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption + ' / ' +
         'Mesma Função (' + trim(qryAlterFuncional.FieldByName('FUNCAO').asString) + ')'
    else
      rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption + ' / ' +
             'Função ' +
             iff(trim(dtmBaseDados.qry.FieldByName('FUNCAOANT').asString) = '', '',
             'de ' + trim(dtmBaseDados.qry.FieldByName('FUNCAOANT').asString) + ' para ') +
             trim(qryAlterFuncional.FieldByName('FUNCAO').asString);

    if dtmBaseDados.qry.FieldByName('SALARIO').asFloat <> 0 then
      rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption + ' / ' +
         'Salário Anterior = ' + FormatFloat('###,###,##0.00',
                                dtmBaseDados.qry.FieldByName('SALARIO').asFloat);

    dtmBaseDados.qry.Close;
  end;
end;

end.
