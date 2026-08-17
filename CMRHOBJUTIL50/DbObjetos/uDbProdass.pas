{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio Frioli                  }
{ Atualizado Em: 29/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbProdass;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbProdass = class(TCmDbObject)

  private
    FIdprodass: TCmDbField;
    FPerciof: TCmDbField;
    FNome: TCmDbField;
    FDescricao: TCmDbField;
    FPercprolabore: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdprodass(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetPerciof(const Value: TCmDbField);
    procedure SetPercprolabore(const Value: TCmDbField);

  public

     Property Percprolabore: TCmDbField read FPercprolabore write SetPercprolabore;
     Property Perciof: TCmDbField read FPerciof write SetPerciof;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idprodass: TCmDbField read FIdprodass write SetIdprodass;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbProdass }

constructor TDbProdass.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRODASS';

   fPercprolabore := CreateCmDbField('PERCPROLABORE',ftfloat,False,False,False,False,'');
   fPerciof := CreateCmDbField('PERCIOF',ftfloat,False,False,False,False,'');
   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'');
   fIdprodass := CreateCmDbField('IDPRODASS',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbProdass.Insert: Boolean;
begin

   fIdprodass.AsFloat := GetSequence('PRODASS');
   Result := Inherited Insert;

end;


procedure TDbProdass.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbProdass.SetIdprodass(const Value: TCmDbField);
begin
  FIdprodass := Value;
end;

procedure TDbProdass.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbProdass.SetPerciof(const Value: TCmDbField);
begin
  FPerciof := Value;
end;

procedure TDbProdass.SetPercprolabore(const Value: TCmDbField);
begin
  FPercprolabore := Value;
end;

end.



