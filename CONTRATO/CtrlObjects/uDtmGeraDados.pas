unit uDtmGeraDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery, Parser10, uCmSqlParams;

type
  TdtmGeraDados = class(TDataModule)
    Parser: TParser;
    sqlExercicio: TCMSqlParams;
    sqlPeriodo: TCMSqlParams;
    sqlCenario: TCMSqlParams;
    sqlContasAuxR: TCMSqlParams;
    sqlVerificaSinal: TCMSqlParams;
    sqlSaldos: TCMSqlParams;
    sqlContasAux: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    sqlNaoCalculadas: TCMSqlParams;
    sqlContasAuxO: TCMSqlParams;
    sqlFluxo: TCMSqlParams;
    sqlDeletaValores: TCMSqlParams;
    sqlComposicao: TCMSqlParams;
    sqlContabilidade: TCMSqlParams;
    sqlAcumulado2CAnt: TCMSqlParams;
    sqlDataview: TCMSqlParams;
    sqlPeriodoContab: TCMSqlParams;
    sqlPlanoData: TCMSqlParams;
    sqlAcumulado2Ant: TCMSqlParams;
    sqlFormula: TCMSqlParams;
    sqlAcumulado3MC: TCMSqlParams;
    sqlAcumulado3M: TCMSqlParams;
    sqlAcumulado3: TCMSqlParams;
    sqlCompContas: TCMSqlParams;
    sqlAcumulado2: TCMSqlParams;
    sqlAcumulado2M: TCMSqlParams;
    sqlAcumulado2MC: TCMSqlParams;
    sqlContas: TCMSqlParams;
    sqlGenericos: TCMSqlParams;
    sqlFlagCalculo: TCMSqlParams;
    sqlLancOrc: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
