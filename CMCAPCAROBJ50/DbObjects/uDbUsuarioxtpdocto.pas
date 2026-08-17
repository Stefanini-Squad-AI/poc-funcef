{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Fábio Barros da Silva           }
{ Atualizado Em: 21/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbUsuarioxtpdocto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbUsuarioxtpdocto = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FRecpag: TCmDbField;
    FCodtipdoc: TCmDbField;
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbUsuarioxtpdocto }

constructor TDbUsuarioxtpdocto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUARIOXTPDOCTO';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,True,False,True,'');
end;

function TDbUsuarioxtpdocto.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbUsuarioxtpdocto.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbUsuarioxtpdocto.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbUsuarioxtpdocto.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



