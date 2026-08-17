{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio Frioli                  }
{ Atualizado Em: 30/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbSitplanoass;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbSitplanoass = class(TCmDbObject)

  private
    FFlginterno: TCmDbField;
    FIdsitplanoass: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlginterno(const Value: TCmDbField);
    procedure SetIdsitplanoass(const Value: TCmDbField);

  public

     Property Idsitplanoass: TCmDbField read FIdsitplanoass write SetIdsitplanoass;
     Property Flginterno: TCmDbField read FFlginterno write SetFlginterno;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSitplanoass }

constructor TDbSitplanoass.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SITPLANOASS';

   fIdsitplanoass := CreateCmDbField('IDSITPLANOASS',ftfloat,True,True,False,True,'');
   fFlginterno := CreateCmDbField('FLGINTERNO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbSitplanoass.Insert: Boolean;
begin

   fIdsitplanoass.AsFloat := GetSequence('SITPLANOASS');
   Result := Inherited Insert;

end;


procedure TDbSitplanoass.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbSitplanoass.SetFlginterno(const Value: TCmDbField);
begin
  FFlginterno := Value;
end;

procedure TDbSitplanoass.SetIdsitplanoass(const Value: TCmDbField);
begin
  FIdsitplanoass := Value;
end;

end.



