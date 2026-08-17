{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbEnviodocumento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEnviodocumento = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FIdenviodocumento: TCmDbField;
    procedure SetIdenviodocumento(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idenviodocumento: TCmDbField read FIdenviodocumento write SetIdenviodocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEnviodocumento }

constructor TDbEnviodocumento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ENVIODOCUMENTO';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdenviodocumento := CreateCmDbField('IDENVIODOCUMENTO',ftfloat,True,True,False,True,'');
end;

function TDbEnviodocumento.Insert: Boolean;
begin

   fIdenviodocumento.AsFloat := GetSequence('ENVIODOCUMENTO');
   Result := Inherited Insert;

end;


procedure TDbEnviodocumento.SetIdenviodocumento(const Value: TCmDbField);
begin
  FIdenviodocumento := Value;
end;

procedure TDbEnviodocumento.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



