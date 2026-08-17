{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbObjeto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbObjeto = class(TCmDbObject)

  private
    FIdObjeto: TCmDbField;
    FNomeObjeto: TCmDbField;

    procedure SetIdObjeto(const Value: TCmDbField);
    procedure SetNomeObjeto(const Value: TCmDbField);

  public
    Property IdObjeto : TCmDbField read FIdObjeto write SetIdObjeto;
    Property NomeObjeto : TCmDbField read FNomeObjeto write SetNomeObjeto;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbObjeto }

constructor TDbObjeto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OBJETO';

  FIdObjeto   := CreateCmDbField('IDOBJETO',   ftfloat,  True,  True,  False, True, 'Id');
  FNomeObjeto := CreateCmDbField('NOMEOBJETO', ftString, False, False, False, True, 'Nome');
end;

function TDbObjeto.Insert: Boolean;
begin
  //FIdObjeto.AsFloat := GetSequence('OBJETO'); //Atualmente não existe sequence (TCtrlObjeto.GetSequenceObjeto)
  Result := Inherited Insert;
end;

function TDbObjeto.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbObjeto.SetIdObjeto(const Value: TCmDbField);
begin
  FIdObjeto := Value;
end;

procedure TDbObjeto.SetNomeObjeto(const Value: TCmDbField);
begin
  FNomeObjeto := Value;
end;

end.
