{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 26/02/2004                             }
{                                                       }
{*******************************************************}

unit uDBRemembramento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBRemembramento = class(TCmDbObject)

  private
    FIdmovimentacao: TCmDbField;
    FProporcao: TCmDbField;
    FIdbembaixado: TCmDbField;
    procedure SetIdbembaixado(const Value: TCmDbField);
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetProporcao(const Value: TCmDbField);

  public
     Property Proporcao: TCmDbField read FProporcao write SetProporcao;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;
     Property Idbembaixado: TCmDbField read FIdbembaixado write SetIdbembaixado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBRemembramento }

constructor TDBRemembramento.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'REMEMBRAMENTO';

   fProporcao := CreateCmDbField('PROPORCAO',ftfloat,False,False,False,True,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,True,True,False,False,'');
   fIdbembaixado := CreateCmDbField('IDBEMBAIXADO',ftfloat,True,True,False,False,'');
end;

function TDBRemembramento.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBRemembramento.SetIdbembaixado(const Value: TCmDbField);
begin
   FIdbembaixado := Value;
end;

procedure TDBRemembramento.SetIdmovimentacao(const Value: TCmDbField);
begin
   FIdmovimentacao := Value;
end;

procedure TDBRemembramento.SetProporcao(const Value: TCmDbField);
begin
   FProporcao := Value;
end;

end.



