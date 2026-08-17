{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbUsuarioLiberado;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbUsuarioLiberado = class(TCmDbObject)

  private
    FIdUsuario: TCmDbField;
    FIdModulo: TCmDbField;
    FDtInicioLiberacao: TCmDbField;
    FDtFimLiberacao: TCmDbField;

    procedure SetIdUsuario(const Value: TCmDbField);
    procedure SetIdModulo(const Value: TCmDbField);
    procedure SetDtInicioLiberacao(const Value: TCmDbField);
    procedure SetDtFimLiberacao(const Value: TCmDbField);

  public
    Property IdUsuario : TCmDbField read FIdUsuario write SetIdUsuario;
    Property IdModulo : TCmDbField read FIdModulo write SetIdModulo;
    Property DtInicioLiberacao : TCmDbField read FDtInicioLiberacao write SetDtInicioLiberacao;
    Property DtFimLiberacao : TCmDbField read FDtFimLiberacao write SetDtFimLiberacao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbUsuarioLiberado }

constructor TDbUsuarioLiberado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUARIOS_LIBERADOS';

  FIdUsuario := CreateCmDbField('IDUSUARIO', ftfloat, True, True, False, True, 'IdUsuario');
  FIdModulo  := CreateCmDbField('IDMODULO',  ftfloat, True, True, False, True, 'IdModulo');
  FDtInicioLiberacao := CreateCmDbField('DATA_INICIO_LIBERACAO', ftDateTime, False, False, False, True, 'DtInicioLiberacao', -1, True);
  FDtFimLiberacao    := CreateCmDbField('DATA_FIM_LIBERACAO',    ftDateTime, False, False, False, True, 'DtFimLiberacao', -1, True);
end;

function TDbUsuarioLiberado.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbUsuarioLiberado.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbUsuarioLiberado.SetIdUsuario(const Value: TCmDbField);
begin
  FIdUsuario := Value;
end;

procedure TDbUsuarioLiberado.SetIdModulo(const Value: TCmDbField);
begin
  FIdModulo := Value;
end;

procedure TDbUsuarioLiberado.SetDtInicioLiberacao(const Value: TCmDbField);
begin
  FDtInicioLiberacao := Value;
end;

procedure TDbUsuarioLiberado.SetDtFimLiberacao(const Value: TCmDbField);
begin
  FDtFimLiberacao := Value;
end;

end.
