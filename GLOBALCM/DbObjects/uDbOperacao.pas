{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbOperacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperacao = class(TCmDbObject)

  private
    FIdOperacao: TCmDbField;
    FNomeOperacao: TCmDbField;

    procedure SetIdOperacao(const Value: TCmDbField);
    procedure SetNomeOperacao(const Value: TCmDbField);

  public
    Property IdOperacao : TCmDbField read FIdOperacao write SetIdOperacao;
    Property NomeOperacao : TCmDbField read FNomeOperacao write SetNomeOperacao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbOperacao }

constructor TDbOperacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERACAO';

  FIdOperacao   := CreateCmDbField('IDOPERACAO',   ftfloat,  True,  True,  False, True, 'Id');
  FNomeOperacao := CreateCmDbField('NOMEOPERACAO', ftString, False, False, False, True, 'Nome');
end;

function TDbOperacao.Insert: Boolean;
begin
  //FIdOperacao.AsFloat := GetSequence('OPERACAO'); //Atualmente não existe sequence (TCtrlOperacao.GetSequenceOperacao)
  Result := Inherited Insert;
end;

function TDbOperacao.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbOperacao.SetIdOperacao(const Value: TCmDbField);
begin
  FIdOperacao := Value;
end;

procedure TDbOperacao.SetNomeOperacao(const Value: TCmDbField);
begin
  FNomeOperacao := Value;
end;

end.
