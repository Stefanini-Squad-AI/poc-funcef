{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/08/2004                             }
{                                                       }
{*******************************************************}

unit uDBCAFPaises;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBCAFPaises = class(TCmDbObject)

  private
    FIdpais: TCmDbField;
    FIdcafpaises: TCmDbField;
    FMoecodigo: TCmDbField;
    FFlgcontabil: TCmDbField;
    FFlgmultitaxa: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetFlgcontabil(const Value: TCmDbField);
    procedure SetFlgmultitaxa(const Value: TCmDbField);
    procedure SetIdcafpaises(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);

  public

     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Idcafpaises: TCmDbField read FIdcafpaises write SetIdcafpaises;
     Property Flgmultitaxa: TCmDbField read FFlgmultitaxa write SetFlgmultitaxa;
     Property Flgcontabil: TCmDbField read FFlgcontabil write SetFlgcontabil;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function InsertAs(nIdCafPaises : Extended = 0) : Boolean;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBCAFPaises }

constructor TDBCAFPaises.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CAFPAISES';

   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'');
   fIdcafpaises := CreateCmDbField('IDCAFPAISES',ftfloat,True,True,False,True,'');
   fFlgcontabil := CreateCmDbField('FLGCONTABIL',ftfloat,True,False,False,False,'');
   fFlgmultitaxa := CreateCmDbField('FLGMULTITAXA',ftfloat,False,False,False,False,'');
end;

function TDBCAFPaises.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBCAFPaises.InsertAs(nIdCafPaises : Extended) : Boolean;
begin
   if nIdCafPaises <= 0 then
      fIdcafpaises.AsFloat := GetSequence('CAFPAISES')
   else
      fIdcafpaises.AsFloat := nIdCafPaises;
   Result := Insert;
end;

function TDBCAFPaises.LoadFromDB : Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBCAFPaises.SetFlgcontabil(const Value: TCmDbField);
begin
  FFlgcontabil := Value;
end;

procedure TDBCAFPaises.SetFlgmultitaxa(const Value: TCmDbField);
begin
  FFlgmultitaxa := Value;
end;

procedure TDBCAFPaises.SetIdcafpaises(const Value: TCmDbField);
begin
  FIdcafpaises := Value;
end;

procedure TDBCAFPaises.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDBCAFPaises.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBCAFPaises.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

end.

