{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 09/08/2007                             }
{                                                       }
{*******************************************************}

unit uDbGrupoAcessoXCart;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbGrupoAcessoXCart = class(TCmDbObject)

  private
    FIdgrupo: TCmDbField;
    FIdgrupoacessoxcart: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdgrupoacessoxcart(const Value: TCmDbField);

  public

     Property Idgrupoacessoxcart: TCmDbField read FIdgrupoacessoxcart write SetIdgrupoacessoxcart;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbGrupoAcessoXCart }

constructor TDbGrupoAcessoXCart.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPOACESSOXCART';

   fIdgrupoacessoxcart := CreateCmDbField('IDGRUPOACESSOXCART',ftString,True,True,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
end;

function TDbGrupoAcessoXCart.Insert: Boolean;
begin

   fIdgrupoacessoxcart.AsFloat := GetSequence('SEQGRUPOACESSOXCART');
   Result := Inherited Insert;

end;


procedure TDbGrupoAcessoXCart.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbGrupoAcessoXCart.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbGrupoAcessoXCart.SetIdgrupoacessoxcart(
  const Value: TCmDbField);
begin
  FIdgrupoacessoxcart := Value;
end;

end.



