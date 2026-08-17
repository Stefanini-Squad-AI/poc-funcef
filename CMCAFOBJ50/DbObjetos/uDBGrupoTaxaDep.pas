{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 27/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBGrupoTaxaDep;

interface
Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBGrupoTaxaDep = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdgrupo: TCmDbField;
    FDesctaxadep: TCmDbField;
    FIdtaxadep: TCmDbField;
    FTaxadep: TCmDbField;
    procedure SetDesctaxadep(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtaxadep(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);

  public

     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Idtaxadep: TCmDbField read FIdtaxadep write SetIdtaxadep;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Desctaxadep: TCmDbField read FDesctaxadep write SetDesctaxadep;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBGrupoTaxaDep }

constructor TDBGrupoTaxaDep.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'GRUPOTAXADEP';
   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fIdtaxadep := CreateCmDbField('IDTAXADEP',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
   fDesctaxadep := CreateCmDbField('DESCTAXADEP',ftString,False,False,False,True,'');
end;

function TDBGrupoTaxaDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBGrupoTaxaDep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBGrupoTaxaDep.SetDesctaxadep(const Value: TCmDbField);
begin
  FDesctaxadep := Value;
end;

procedure TDBGrupoTaxaDep.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBGrupoTaxaDep.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBGrupoTaxaDep.SetIdtaxadep(const Value: TCmDbField);
begin
  FIdtaxadep := Value;
end;

procedure TDBGrupoTaxaDep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

end.



