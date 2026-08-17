{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 27/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbContratoUsuario;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratousuario = class(TCmDbObject)

  private
    FIdcontrato: TCmDbField;
    FIdusuario: TCmDbField;
  public
     Property Idusuario: TCmDbField read FIdusuario write FIdusuario;
     Property Idcontrato: TCmDbField read FIdcontrato write FIdcontrato;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratousuario }

constructor TDbContratousuario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATOUSUARIO';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'');
end;

function TDbContratousuario.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

end.



