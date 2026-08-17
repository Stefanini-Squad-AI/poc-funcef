{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbCartorio;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCartorio = class(TCmDbObject)

  private
    FIdcartorio: TCmDbField;
    procedure SetIdcartorio(const Value: TCmDbField);

  public

     Property Idcartorio: TCmDbField read FIdcartorio write SetIdcartorio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCartorio }

constructor TDbCartorio.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARTORIO';

   fIdcartorio := CreateCmDbField('IDCARTORIO',ftfloat,True,True,False,True,'');
end;

function TDbCartorio.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbCartorio.SetIdcartorio(const Value: TCmDbField);
begin
  FIdcartorio := Value;
end;

end.



