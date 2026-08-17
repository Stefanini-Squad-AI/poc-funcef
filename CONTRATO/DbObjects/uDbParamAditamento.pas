{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbParamAditamento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamAditamento = class(TCmDbObject)

  private
    FIdddfield: TCmDbField;
    procedure SetIdddfield(const Value: TCmDbField);

  public

     Property Idddfield: TCmDbField read FIdddfield write SetIdddfield;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamAditamento }

constructor TDbParamAditamento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  TableName := 'PARAMADITAMENTO';
  fIdddfield := CreateCmDbField('IDDDFIELD',ftfloat,True,False,False,True,'');
end;

function TDbParamAditamento.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbParamAditamento.SetIdddfield(const Value: TCmDbField);
begin
  FIdddfield := Value;
end;

end.



