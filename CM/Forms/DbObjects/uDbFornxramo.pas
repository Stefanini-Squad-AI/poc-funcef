{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbFornxramo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbFornxramo = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdramofornecedor: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdramofornecedor(const Value: TCmDbField);

  public

     Property Idramofornecedor: TCmDbField read FIdramofornecedor write SetIdramofornecedor;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFornxramo }

constructor TDbFornxramo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORNXRAMO';

   fIdramofornecedor := CreateCmDbField('IDRAMOFORNECEDOR',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
end;

function TDbFornxramo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbFornxramo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbFornxramo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbFornxramo.SetIdramofornecedor(const Value: TCmDbField);
begin
  FIdramofornecedor := Value;
end;

end.



