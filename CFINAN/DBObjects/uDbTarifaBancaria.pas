//***************************************************************************************
//N. SIG.............: 46651
//Data da Alteração..: 17/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação de classe.
//***************************************************************************************
//Rotina.............: Create
//N. SIG.............: 80588
//Data da Alteração..: 28/02/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Melhoria sobre o procedimento de conciliação de tarifa.
//***************************************************************************************
unit uDbTarifaBancaria;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbTarifaBancaria = class(TCmDbObject)

  private
    FCodForma: TCmDbField;
    FValor: TCmDbField;
    FCodPortForma: TCmDbField;
    FIdTarifaBancaria: TCmDbField;
    FDataInicio: TCmDbField;
    FValorAntecip: TCmDbField;
    FDataFim: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetCodForma(const Value: TCmDbField);
    procedure SetCodPortForma(const Value: TCmDbField);
    procedure SetDataFim(const Value: TCmDbField);
    procedure SetDataInicio(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdTarifaBancaria(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetValorAntecip(const Value: TCmDbField);

  public
     property IdTarifaBancaria: TCmDbField read FIdTarifaBancaria write SetIdTarifaBancaria;
     property CodPortForma: TCmDbField read FCodPortForma write SetCodPortForma;
     property CodForma: TCmDbField read FCodForma write SetCodForma;
     property Descricao: TCmDbField read FDescricao write SetDescricao;
     property Valor: TCmDbField read FValor write SetValor;
     property ValorAntecip: TCmDbField read FValorAntecip write SetValorAntecip;
     property DataInicio:  TCmDbField read FDataInicio write SetDataInicio;
     property DataFim: TCmDbField read FDataFim write SetDataFim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTarifaBancaria }

constructor TDbTarifaBancaria.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TARIFABANCARIA';

   FIdTarifaBancaria := CreateCmDbField('IDTARIFABANCARIA',ftFloat,True,True,False,False,'');
   FCodPortForma := CreateCmDbField('CODPORTFORMA', ftFloat, True, False, False, False, '');
   FCodForma := CreateCmDbField('CODFORMA', ftFloat, False, False, False, True, '');
   FDescricao := CreateCmDbField('DESCRICAO',ftString, False, False, False, False, '');
   FValor := CreateCmDbField('VALOR', ftFloat, False, False, False, False, '');
   FValorAntecip := CreateCmDbField('VALORANTECIP', ftFloat, False, False, False, False, '');
   FDataInicio := CreateCmDbField('DATAINICIO', ftDateTime, False, False, False, True, '');
   FDataFim := CreateCmDbField('DATAFIM',ftDateTime, False, False, False, True, '');
end;

function TDbTarifaBancaria.Insert: Boolean;
begin
  fIdTarifaBancaria.AsFloat := GetSequence('TARIFABACARIA');
  Result := Inherited Insert;
end;

procedure TDbTarifaBancaria.SetCodForma(const Value: TCmDbField);
begin
  FCodForma := Value;
end;

procedure TDbTarifaBancaria.SetCodPortForma(const Value: TCmDbField);
begin
  FCodPortForma := Value;
end;

procedure TDbTarifaBancaria.SetDataFim(const Value: TCmDbField);
begin
  FDataFim := Value;
end;

procedure TDbTarifaBancaria.SetDataInicio(const Value: TCmDbField);
begin
  FDataInicio := Value;
end;

procedure TDbTarifaBancaria.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTarifaBancaria.SetIdTarifaBancaria(const Value: TCmDbField);
begin
  FIdTarifaBancaria := Value;
end;

procedure TDbTarifaBancaria.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

procedure TDbTarifaBancaria.SetValorAntecip(const Value: TCmDbField);
begin
  FValorAntecip := Value;
end;

end.
