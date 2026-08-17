{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbFuncao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFuncao = class(TCmDbObject)

  private
    FIdFuncao: TCmDbField;
    FNomeFuncao: TCmDbField;
    FIdModulo: TCmDbField;
    FIdFuncaoPai: TCmDbField;

    procedure SetIdFuncao(const Value: TCmDbField);
    procedure SetNomeFuncao(const Value: TCmDbField);
    procedure SetIdModulo(const Value: TCmDbField);
    procedure SetIdFuncaoPai(const Value: TCmDbField);

  public
    Property IdFuncao : TCmDbField read FIdFuncao write SetIdFuncao;
    Property NomeFuncao : TCmDbField read FNomeFuncao write SetNomeFuncao;
    Property IdModulo : TCmDbField read FIdModulo write SetIdModulo;
    Property IdFuncaoPai : TCmDbField read FIdFuncaoPai write SetIdFuncaoPai;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFuncao }

constructor TDbFuncao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FUNCAO';

  FIdFuncao    := CreateCmDbField('IDFUNCAO',    ftfloat,  True,  True,  False, True, 'IdFuncao');
  FNomeFuncao  := CreateCmDbField('NOMEFUNCAO',  ftString, False, False, False, True, 'Nome');
  FIdModulo    := CreateCmDbField('IDMODULO',    ftfloat,  True,  False, False, True, 'Modulo');
  FIdFuncaoPai := CreateCmDbField('IDFUNCAOPAI', ftFloat,  True,  False, False, True, 'IdFuncaoPai');
end;

function TDbFuncao.Insert: Boolean;
begin
  //FIdFuncao.AsFloat := GetSequence('FUNCAO'); //Atualmente não existe sequence (TCtrlFuncaoOperacao.GetSequenceFuncao)
  Result := Inherited Insert;
end;

function TDbFuncao.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbFuncao.SetIdFuncao(const Value: TCmDbField);
begin
  FIdFuncao := Value;
end;

procedure TDbFuncao.SetNomeFuncao(const Value: TCmDbField);
begin
  FNomeFuncao := Value;
end;

procedure TDbFuncao.SetIdModulo(const Value: TCmDbField);
begin
  FIdModulo := Value;
end;

procedure TDbFuncao.SetIdFuncaoPai(const Value: TCmDbField);
begin
  FIdFuncaoPai := Value;
end;

end.
