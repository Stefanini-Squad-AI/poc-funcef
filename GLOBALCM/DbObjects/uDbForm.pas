{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbForm;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbForm = class(TCmDbObject)

  private
    FIdForm: TCmDbField;
    FNomeForm: TCmDbField;
    FIdModulo: TCmDbField;
    FDescForm: TCmDbField;

    procedure SetIdForm(const Value: TCmDbField);
    procedure SetNomeForm(const Value: TCmDbField);
    procedure SetIdModulo(const Value: TCmDbField);
    procedure SetDescForm(const Value: TCmDbField);

  public
    Property IdForm : TCmDbField read FIdForm write SetIdForm;
    Property NomeForm : TCmDbField read FNomeForm write SetNomeForm;
    Property IdModulo : TCmDbField read FIdModulo write SetIdModulo;
    Property DescForm : TCmDbField read FDescForm write SetDescForm;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbForm }

constructor TDbForm.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORM';

  FIdForm   := CreateCmDbField('IDFORM',   ftfloat,  True,  True,  False, True, 'Id');
  FNomeForm := CreateCmDbField('NOMEFORM', ftString, False, False, False, True, 'Nome');
  FIdModulo := CreateCmDbField('IDMODULO', ftfloat,  True,  False, False, True, 'Modulo');
  FDescForm := CreateCmDbField('DESCFORM', ftString, False, False, False, True, 'Descricao');
end;

function TDbForm.Insert: Boolean;
begin
  //FIdForm.AsFloat := GetSequence('FORM'); //Atualmente não existe sequence (TCtrlForm.GetSequenceForm)
  Result := Inherited Insert;
end;

function TDbForm.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbForm.SetIdForm(const Value: TCmDbField);
begin
  FIdForm := Value;
end;

procedure TDbForm.SetNomeForm(const Value: TCmDbField);
begin
  FNomeForm := Value;
end;

procedure TDbForm.SetIdModulo(const Value: TCmDbField);
begin
  FIdModulo := Value;
end;

procedure TDbForm.SetDescForm(const Value: TCmDbField);
begin
  FDescForm := Value;
end;

end.
