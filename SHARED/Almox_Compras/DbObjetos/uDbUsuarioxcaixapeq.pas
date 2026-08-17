{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbUsuarioxcaixapeq;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbUsuarioxcaixapeq = class(TCmDbObject)

  private
    FIdcaixapequeno: TCmDbField;
    FIdusuario: TCmDbField;
    procedure SetIdcaixapequeno(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idcaixapequeno: TCmDbField read FIdcaixapequeno write SetIdcaixapequeno;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbUsuarioxcaixapeq }

constructor TDbUsuarioxcaixapeq.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUARIOXCAIXAPEQ';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fIdcaixapequeno := CreateCmDbField('IDCAIXAPEQUENO',ftfloat,True,True,False,True,'');
end;

function TDbUsuarioxcaixapeq.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbUsuarioxcaixapeq.SetIdcaixapequeno(const Value: TCmDbField);
begin
  FIdcaixapequeno := Value;
end;

procedure TDbUsuarioxcaixapeq.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



