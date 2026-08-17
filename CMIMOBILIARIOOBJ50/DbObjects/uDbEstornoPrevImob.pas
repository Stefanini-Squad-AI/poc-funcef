{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 05/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbEstornoPrevImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbEstornoPrevImob = class(TCmDbObject)

  private
    FIddocumento: TCmDbField;
    FPlncodigo: TCmDbField;
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEstornoPrevImob }

constructor TDbEstornoPrevImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ESTORNOPREVIMOB';

   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,True,True,False,True,'');
end;

function TDbEstornoPrevImob.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbEstornoPrevImob.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbEstornoPrevImob.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



