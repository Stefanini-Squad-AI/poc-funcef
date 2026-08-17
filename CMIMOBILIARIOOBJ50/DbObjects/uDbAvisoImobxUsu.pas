{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 29/11/2004                             }
{                                                       }
{*******************************************************}

unit uDbAvisoImobxUsu;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAvisoImobxUsu = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FIdoutrousuario: TCmDbField;
    procedure SetIdoutrousuario(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idoutrousuario: TCmDbField read FIdoutrousuario write SetIdoutrousuario;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAvisoImobxUsu }

constructor TDbAvisoImobxUsu.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AVISOIMOBXUSU';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fIdoutrousuario := CreateCmDbField('IDOUTROUSUARIO',ftfloat,True,True,False,True,'');
end;

function TDbAvisoImobxUsu.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbAvisoImobxUsu.SetIdoutrousuario(const Value: TCmDbField);
begin
  FIdoutrousuario := Value;
end;

procedure TDbAvisoImobxUsu.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



