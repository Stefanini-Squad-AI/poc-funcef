{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 27/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBPlanoGrupo;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDBPlanoGrupo = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdgrupo: TCmDbField;
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);

  public

     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBPlanoGrupo }

constructor TDBPlanoGrupo.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'PLANOGRUPO';
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
end;

function TDBPlanoGrupo.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBPlanoGrupo.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBPlanoGrupo.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBPlanoGrupo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

end.



