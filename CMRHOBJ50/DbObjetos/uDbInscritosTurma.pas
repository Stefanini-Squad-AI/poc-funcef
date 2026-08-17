unit uDbInscritosTurma;

{--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
--------------------------------------------------------------------------------------------------}

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDBInscritosTurma = Class(TCmDbObject)

  Private
    FIdPessoa: TCmDbField;
    FIdTurma: TCmDbField;
    FIdInscritos: TCmDbField;
    procedure SetIdInscritos(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdTurma(const Value: TCmDbField);

  Public
    property IdInscritos : TCmDbField read FIdInscritos write SetIdInscritos;
    property IdTurma : TCmDbField read FIdTurma write SetIdTurma;
    property IdPessoa : TCmDbField read FIdPessoa write SetIdPessoa;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;
    Function Insert: Boolean; Override;
    Function Update: Boolean; Override;
    Function LoadFromDb: Boolean; Override;

end;

implementation

{ TDBInscritosTurma }

constructor TDBInscritosTurma.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INSCRITOSTURMA';

  fIdInscritos    := CreateCmDbField( 'IDINSCRITOS', ftfloat,  True,  True,  False, True, '');
  fIdTurma        := CreateCmDbField( 'IDTURMA',     ftfloat,  True,  False, False, True, '');
  fIdPessoa       := CreateCmDbField( 'IDPESSOA',    ftfloat,  True,  False, False, True, '');

end;

function TDBInscritosTurma.Insert: Boolean;
begin
  fIdInscritos.AsFloat := GetSequence('INSCRITOSTURMA');

  Result := Inherited Insert;
end;

function TDBInscritosTurma.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBInscritosTurma.SetIdInscritos(const Value: TCmDbField);
begin
  FIdInscritos := Value;
end;

procedure TDBInscritosTurma.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDBInscritosTurma.SetIdTurma(const Value: TCmDbField);
begin
  FIdTurma := Value;
end;

function TDBInscritosTurma.Update: Boolean;
begin
   Result := Inherited Update;
end;

end.
