Unit
  udtmEntCadDadosEspecial;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams;

Type
  TdtmEntCadDadosEspecial = class(TDataModule)
    sqlSaldo: TCMSqlParams;
    sqlPeriodo: TCMSqlParams;
    sqlValorCCustAux: TCMSqlParams;
    sqlCompOrcamen: TCMSqlParams;
    sqlPatroConta: TCMSqlParams;
    sqlSaldoContabil: TCMSqlParams;
    sqlCriterio: TCMSqlParams;
    sqlPlanoTrabalho: TCMSqlParams;
    sqlValorCentCust: TCMSqlParams;
    sqlDataView: TCMSqlParams;
    sqlPlanoPrevConta: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    sqlContaSaldo: TCMSqlParams;
    
    Procedure sqlSaldoFormartParam(sParamName, sOldValue: String; var sNewValue: String);
    Procedure sqlCompOrcamenFormartParam(sParamName, sOldValue: String; var sNewValue: String);
    Procedure sqlSaldoContabilFormartParam(sParamName, sOldValue: String; var sNewValue: String);
    Procedure sqlValorCentCustFormartParam(sParamName, sOldValue: String; var sNewValue: String);
  Private
    { Private declarations }

  Public
    { Public declarations }
  End;

Var
  dtmEntCadDadosEspecial: TdtmEntCadDadosEspecial;

Implementation

{$R *.DFM}
//************************************************
Procedure TdtmEntCadDadosEspecial.sqlSaldoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
Begin
  Inherited;
  If (sParamName = 'PERIODO') or (sParamName = 'UNIDNEGOC') or
     (sParamName = 'IDPLANOPREV') or (sParamName = 'IDPATRO') then
    sNewValue := sOldValue;
End;
//************************************************
Procedure TdtmEntCadDadosEspecial.sqlCompOrcamenFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'UNIDNEGOC') or (sParamName = 'IDPLANOPREV') or
     (sParamName = 'IDPATRO') then
    sNewValue := sOldValue;
End;
//************************************************
Procedure TdtmEntCadDadosEspecial.sqlSaldoContabilFormartParam(
  sParamName, sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'PLACONTA') then
    sNewValue := sOldValue;
End;
//************************************************
Procedure TdtmEntCadDadosEspecial.sqlValorCentCustFormartParam(
  sParamName, sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'PERIODO') then
    sNewValue := sOldValue;
End;
//************************************************
End.
