{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbSubconta;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbSubconta = class(TCmDbObject)

  private
     FNomesubconta: TCmDbField;
     FIdpessoa    : TCmDbField;
     FCodsubconta : TCmDbField;
     procedure SetNomesubconta(const Value: TCmDbField);
     procedure SetIdpessoa    (const Value: TCmDbField);
     procedure SetCodsubconta (const Value: TCmDbField);
  public
     Property Nomesubconta  :TCmDbField  Read FNomesubconta  Write SetNomesubconta;
     Property Idpessoa      :TCmDbField  Read FIdpessoa      Write SetIdpessoa;
     Property Codsubconta   :TCmDbField  Read FCodsubconta   Write SetCodsubconta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSubconta }

constructor TDbSubconta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SUBCONTA';

   FNomesubconta := CreateCmDbField('NOMESUBCONTA',ftString);
   FIdpessoa     := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True);
   FCodsubconta  := CreateCmDbField('CODSUBCONTA',ftfloat,True,True,False,True);
end;

function TDbSubconta.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbSubconta.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbSubconta.SetCodsubconta(const Value: TCmDbField);
begin
    FCodsubconta := Value;
end;

procedure TDbSubconta.SetIdpessoa(const Value: TCmDbField);
begin
    FIdpessoa := Value;
end;

procedure TDbSubconta.SetNomesubconta(const Value: TCmDbField);
begin
    FNomesubconta := Value;
end;

end.



