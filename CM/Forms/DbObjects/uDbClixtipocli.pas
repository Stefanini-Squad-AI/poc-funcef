{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbClixtipocli;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbClixtipocli = class(TCmDbObject)

  private
    FIdtipocliente: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipocliente(const Value: TCmDbField);

  public

     Property Idtipocliente: TCmDbField read FIdtipocliente write SetIdtipocliente;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TDbClixtipocli }

constructor TDbClixtipocli.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLIXTIPOCLI';

   fIdtipocliente := CreateCmDbField('IDTIPOCLIENTE',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
end;

function TDbClixtipocli.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbClixtipocli.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbClixtipocli.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbClixtipocli.SetIdtipocliente(const Value: TCmDbField);
begin
  FIdtipocliente := Value;
end;

end.



