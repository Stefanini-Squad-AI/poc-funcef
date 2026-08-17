{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 28/05/2004                             }
{                                                       }
{*******************************************************}

unit uDBPlanoGrupo;

interface

Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBPlanoGrupo = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdgrupo: TCmDbField;
    FDataultfec: TCmDbField;
    FInativo: TCmDbField;
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetDataultfec(const Value: TCmDbField);
    procedure SetInativo(const Value: TCmDbField);

  public

     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Dataultfec: TCmDbField read FDataultfec write SetDataultfec;
     Property Inativo: TCmDbField read FInativo write SetInativo;
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
   fDataultfec := CreateCmDbField('DATAULTFEC',ftDateTime,False,False,False,True,'');
   fInativo := CreateCmDbField('INATIVO',ftInteger,False,False,False,False,'');
end;

function TDBPlanoGrupo.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBPlanoGrupo.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBPlanoGrupo.SetDataultfec(const Value: TCmDbField);
begin
  FDataultfec := Value;
end;

procedure TDBPlanoGrupo.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBPlanoGrupo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBPlanoGrupo.SetInativo(const Value: TCmDbField);
begin
  FInativo := Value;
end;

end.



