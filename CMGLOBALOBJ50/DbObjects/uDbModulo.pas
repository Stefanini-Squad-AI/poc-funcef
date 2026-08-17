{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 08/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbModulo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbModulo = class(TCmDbObject)
  private
    FOldversao: TCmDbField;
    FNomeprojeto: TCmDbField;
    FDescricaomodulo: TCmDbField;
    FServername: TCmDbField;
    FIdmodulo: TCmDbField;
    FPathfontes: TCmDbField;
    FFlggrupodesenv: TCmDbField;
    FDirfontes: TCmDbField;
    FChaveregistro: TCmDbField;
    FDirdados: TCmDbField;
    FNomemodulo: TCmDbField;
    procedure SetChaveregistro(const Value: TCmDbField);
    procedure SetDescricaomodulo(const Value: TCmDbField);
    procedure SetDirdados(const Value: TCmDbField);
    procedure SetDirfontes(const Value: TCmDbField);
    procedure SetFlggrupodesenv(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetNomemodulo(const Value: TCmDbField);
    procedure SetNomeprojeto(const Value: TCmDbField);
    procedure SetOldversao(const Value: TCmDbField);
    procedure SetPathfontes(const Value: TCmDbField);
    procedure SetServername(const Value: TCmDbField);

  public
    Property Servername: TCmDbField read FServername write SetServername;
    Property Pathfontes: TCmDbField read FPathfontes write SetPathfontes;
    Property Oldversao: TCmDbField read FOldversao write SetOldversao;
    Property Nomeprojeto: TCmDbField read FNomeprojeto write SetNomeprojeto;
    Property Nomemodulo: TCmDbField read FNomemodulo write SetNomemodulo;
    Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
    Property Flggrupodesenv: TCmDbField read FFlggrupodesenv write SetFlggrupodesenv;
    Property Dirfontes: TCmDbField read FDirfontes write SetDirfontes;
    Property Dirdados: TCmDbField read FDirdados write SetDirdados;
    Property Descricaomodulo: TCmDbField read FDescricaomodulo write SetDescricaomodulo;
    Property Chaveregistro: TCmDbField read FChaveregistro write SetChaveregistro;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbModulo }

constructor TDbModulo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MODULO';

  fServername      := CreateCmDbField('SERVERNAME',ftString,False,False,False,True,'');
  fPathfontes      := CreateCmDbField('PATHFONTES',ftString,False,False,False,True,'');
  fOldversao       := CreateCmDbField('OLDVERSAO',ftString,False,False,False,True,'');
  fNomeprojeto     := CreateCmDbField('NOMEPROJETO',ftString,False,False,False,True,'');
  fNomemodulo      := CreateCmDbField('NOMEMODULO',ftString,True,False,False,True,'');
  fIdmodulo        := CreateCmDbField('IDMODULO',ftfloat,True,True,False,True,'');
  fFlggrupodesenv  := CreateCmDbField('FLGGRUPODESENV',ftString,False,False,False,True,'');
  fDirfontes       := CreateCmDbField('DIRFONTES',ftString,False,False,False,True,'');
  fDirdados        := CreateCmDbField('DIRDADOS',ftString,False,False,False,True,'');
  fDescricaomodulo := CreateCmDbField('DESCRICAOMODULO',ftString,False,False,False,True,'');
  fChaveregistro   := CreateCmDbField('CHAVEREGISTRO',ftString,False,False,False,True,'');
end;

function TDbModulo.Insert: Boolean;
begin
  fIdmodulo.AsFloat := GetSequence('MODULO');
  Result := Inherited Insert;
end;

function TDbModulo.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbModulo.SetChaveregistro(const Value: TCmDbField);
begin
  FChaveregistro := Value;
end;

procedure TDbModulo.SetDescricaomodulo(const Value: TCmDbField);
begin
  FDescricaomodulo := Value;
end;

procedure TDbModulo.SetDirdados(const Value: TCmDbField);
begin
  FDirdados := Value;
end;

procedure TDbModulo.SetDirfontes(const Value: TCmDbField);
begin
  FDirfontes := Value;
end;

procedure TDbModulo.SetFlggrupodesenv(const Value: TCmDbField);
begin
  FFlggrupodesenv := Value;
end;

procedure TDbModulo.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbModulo.SetNomemodulo(const Value: TCmDbField);
begin
  FNomemodulo := Value;
end;

procedure TDbModulo.SetNomeprojeto(const Value: TCmDbField);
begin
  FNomeprojeto := Value;
end;

procedure TDbModulo.SetOldversao(const Value: TCmDbField);
begin
  FOldversao := Value;
end;

procedure TDbModulo.SetPathfontes(const Value: TCmDbField);
begin
  FPathfontes := Value;
end;

procedure TDbModulo.SetServername(const Value: TCmDbField);
begin
  FServername := Value;
end;

end.

