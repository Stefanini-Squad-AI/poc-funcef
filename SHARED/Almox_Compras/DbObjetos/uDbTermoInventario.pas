{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 06/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbTermoInventario;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTermoInventario = class(TCmDbObject)

  private
    FFlgabrefecha: TCmDbField;
    FTexto: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetFlgabrefecha(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetTexto(const Value: TCmDbField);

  public

     Property Texto        : TCmDbField read FTexto write SetTexto;
     Property Idpessoa     : TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgabrefecha : TCmDbField read FFlgabrefecha write SetFlgabrefecha;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTermoInventario }

constructor TDbTermoInventario.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TERMOINVENTARIO';

   fTexto        := CreateCmDbField('TEXTO',ftString,False,False,False,True,'');
   fIdpessoa     := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fFlgabrefecha := CreateCmDbField('FLGABREFECHA',ftString,True,True,False,True,'');
end;

function TDbTermoInventario.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbTermoInventario.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTermoInventario.SetFlgabrefecha(const Value: TCmDbField);
begin
  FFlgabrefecha := Value;
end;

procedure TDbTermoInventario.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTermoInventario.SetTexto(const Value: TCmDbField);
begin
  FTexto := Value;
end;

end.



