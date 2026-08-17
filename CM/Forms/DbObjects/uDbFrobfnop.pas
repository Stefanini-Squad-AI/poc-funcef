{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbFrobfnop;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFrobfnop = class(TCmDbObject)

  private
	  FIdOperfunc: TCmDbField;
    FIdObjeto: TCmDbField;
	  FIdForm: TCmDbField;

    procedure SetIdOperfunc(const Value: TCmDbField);
	  procedure SetIdObjeto(const Value: TCmDbField);
	  procedure SetIdForm(const Value: TCmDbField);

  public
    Property IdOperfunc: TCmDbField read FIdOperfunc write SetIdOperfunc;
	  Property IdObjeto : TCmDbField read FIdObjeto write SetIdObjeto;
    Property IdForm : TCmDbField read FIdForm write SetIdForm;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFrobfnop }

constructor TDbFrobfnop.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FROBFNOP';

  FIdOperfunc := CreateCmDbField('IDOPERFUNC', ftfloat, True, True,  False, True, 'IdOperfunc');
  FIdObjeto   := CreateCmDbField('IDOBJETO',   ftfloat, True, False, False, True, 'IdObjeto');
  FIdForm     := CreateCmDbField('IDFORM',     ftfloat, True, False, False, True, 'IdForm');
end;

function TDbFrobfnop.Insert: Boolean;
begin
  FIdOperfunc.AsFloat := GetSequence('FROBFNOP');
  Result := Inherited Insert;
end;

function TDbFrobfnop.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbFrobfnop.SetIdOperfunc(const Value: TCmDbField);
begin
  FIdOperfunc := Value;
end;

procedure TDbFrobfnop.SetIdObjeto(const Value: TCmDbField);
begin
  FIdObjeto := Value;
end;

procedure TDbFrobfnop.SetIdForm(const Value: TCmDbField);
begin
  FIdForm := Value;
end;

end.
