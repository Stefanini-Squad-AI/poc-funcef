{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbSindicato;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbSindicato = class(TCmDbObject)

  private
    FMoecodigo: TCmDbField;
    FMescontribuicao: TCmDbField;
    FRegistromt: TCmDbField;
    FPisosalarial: TCmDbField;
    FIdpessoa: TCmDbField;
    FMesbase: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMesbase(const Value: TCmDbField);
    procedure SetMescontribuicao(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetPisosalarial(const Value: TCmDbField);
    procedure SetRegistromt(const Value: TCmDbField);

  public
    Property Registromt: TCmDbField read FRegistromt write SetRegistromt;
    Property Pisosalarial: TCmDbField read FPisosalarial write SetPisosalarial;
    Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
    Property Mescontribuicao: TCmDbField read FMescontribuicao write SetMescontribuicao;
    Property Mesbase: TCmDbField read FMesbase write SetMesbase;
    Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbSindicato }

constructor TDbSindicato.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SINDICATO';

  fIdpessoa        := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
  fRegistromt      := CreateCmDbField('REGISTROMT',ftString,False,False,False,True,'');
  fPisosalarial    := CreateCmDbField('PISOSALARIAL',ftfloat,False,False,False,True,'');
  fMoecodigo       := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
  fMescontribuicao := CreateCmDbField('MESCONTRIBUICAO',ftfloat,False,False,False,True,'');
  fMesbase         := CreateCmDbField('MESBASE',ftfloat,False,False,False,True,'');
end;

function TDbSindicato.Insert: Boolean;
begin
  fIdpessoa.AsFloat := GetSequence('SINDICATO');
  Result := Inherited Insert;
end;

function TDbSindicato.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbSindicato.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbSindicato.SetMesbase(const Value: TCmDbField);
begin
  FMesbase := Value;
end;

procedure TDbSindicato.SetMescontribuicao(const Value: TCmDbField);
begin
  FMescontribuicao := Value;
end;

procedure TDbSindicato.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbSindicato.SetPisosalarial(const Value: TCmDbField);
begin
  FPisosalarial := Value;
end;

procedure TDbSindicato.SetRegistromt(const Value: TCmDbField);
begin
  FRegistromt := Value;
end;

end.

