{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbEspacess;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbEspacess = class(TCmDbObject)

  private
    FIdespacesso: TCmDbField;
    procedure SetIdespacesso(const Value: TCmDbField);

  public

     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEspacess }

constructor TDbEspacess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ESPACESS';

   fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,True,False,True,'');
end;

function TDbEspacess.Insert: Boolean;
begin
   fIdespacesso.AsFloat := GetSequence('ESPACESS');
   Result := Inherited Insert;
end;


procedure TDbEspacess.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

end.



