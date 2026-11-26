unit uDtmBuscaContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams;

type
  TdtmBuscaContabil = class(TDataModule)
    sqlSaldos: TCMSqlParams;
    sqlContasOrcamen: TCMSqlParams;
    sqlComposicao: TCMSqlParams;
    sqlPeriodo: TCMSqlParams;
    sqlContabilidade: TCMSqlParams;
    sqlAux: TCMSqlParams;
    procedure sqlContasOrcamenFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlContabilidadeFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlAuxFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlSaldosFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}
//************************************************
Procedure TdtmBuscaContabil.sqlContasOrcamenFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
Begin

  sNewValue := sOldValue;
End;
//************************************************
Procedure TdtmBuscaContabil.sqlContabilidadeFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
Begin

  sNewValue := sOldValue;
End;
//************************************************
Procedure TdtmBuscaContabil.sqlAuxFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
Begin

  sNewValue := sOldValue;
End;
//************************************************
Procedure TdtmBuscaContabil.sqlSaldosFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
Begin

  sNewValue := sOldValue;
End;
//************************************************
End.
