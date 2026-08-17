{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2007                             }
{                                                       }
{*******************************************************}

unit uDbOutroDadoXEvento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOutroDadoXEvento = class(TCmDbObject)

  private
    FIdtipoeventoimob: TCmDbField;
    FIdoutrodado: TCmDbField;
    procedure SetIdoutrodado(const Value: TCmDbField);
    procedure SetIdtipoeventoimob(const Value: TCmDbField);

  public

     Property Idtipoeventoimob: TCmDbField read FIdtipoeventoimob write SetIdtipoeventoimob;
     Property Idoutrodado: TCmDbField read FIdoutrodado write SetIdoutrodado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOutroDadoXEvento }

constructor TDbOutroDadoXEvento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OUTRODADOXEVENTO';

  fIdtipoeventoimob := CreateCmDbField('IDTIPOEVENTOIMOB',ftfloat,True,False,False,True,'');
  fIdoutrodado := CreateCmDbField('IDOUTRODADO',ftfloat,True,False,False,True,'');
end;

function TDbOutroDadoXEvento.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbOutroDadoXEvento.SetIdoutrodado(const Value: TCmDbField);
begin
  FIdoutrodado := Value;
end;

procedure TDbOutroDadoXEvento.SetIdtipoeventoimob(const Value: TCmDbField);
begin
  FIdtipoeventoimob := Value;
end;

end.



