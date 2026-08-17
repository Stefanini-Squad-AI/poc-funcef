//***************************************************************************************
//N. SIG.............: 46651
//Data da Alteração..: 17/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação de classe.
//***************************************************************************************
unit uDbTarifaxMovimFinanc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbTarifaxMovimFinanc = class(TCmDbObject)

  private
    FCodLancFinanc: TCmDbField;
    FIdTarifaxMovimFinanc: TCmDbField;
    FNSA: TCmDbField;
    procedure SetCodLancFinanc(const Value: TCmDbField);
    procedure SetIdTarifaxMovimFinanc(const Value: TCmDbField);
    procedure SetNSA(const Value: TCmDbField);

  public
     property IdTarifaxMovimFinanc: TCmDbField read FIdTarifaxMovimFinanc write SetIdTarifaxMovimFinanc;
     property NSA: TCmDbField read FNSA write SetNSA;
     property CodLancFinanc: TCmDbField read FCodLancFinanc write SetCodLancFinanc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTarifaBancaria }

constructor TDbTarifaxMovimFinanc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TARIFAXMOVIMFINANC';

   FIdTarifaxMovimFinanc := CreateCmDbField('IDTARIFAXMOVIMFINANC',ftFloat,True,True,False,False,'');
   FNSA := CreateCmDbField('NSA', ftString, True, False, False, False, '');
   FCodLancFinanc := CreateCmDbField('CODLANCFINANC', ftFloat, True, False, False, False, '');

end;

function TDbTarifaxMovimFinanc.Insert: Boolean;
begin
  FIdTarifaxMovimFinanc.AsFloat := GetSequence('TARIFAXMOVIMFINANC');
  Result := Inherited Insert;
end;


procedure TDbTarifaxMovimFinanc.SetCodLancFinanc(const Value: TCmDbField);
begin
  FCodLancFinanc := Value;
end;

procedure TDbTarifaxMovimFinanc.SetIdTarifaxMovimFinanc(
  const Value: TCmDbField);
begin
  FIdTarifaxMovimFinanc := Value;
end;

procedure TDbTarifaxMovimFinanc.SetNSA(const Value: TCmDbField);
begin
  FNSA := Value;
end;

end.
