{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbDepentit;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDepentit = class(TCmDbObject)

  private

  public

     Property Numsequencia: TCmDbField;
     Property Matricula: TCmDbField;
     Property Iniciosalariof: TCmDbField;
     Property Inicioimpostor: TCmDbField;
     Property Idtitular: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Iddependencia: TCmDbField;
     Property Flgdesinado: TCmDbField;
     Property Flgdesignado: TCmDbField;
     Property Flgdeplegal: TCmDbField;
     Property Flgcontasalariof: TCmDbField;
     Property Flgcontaimpostor: TCmDbField;
     Property Flgbeneficiario: TCmDbField;
     Property Fimsalariof: TCmDbField;
     Property Fimimpostor: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDepentit }

constructor TDbDepentit.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEPENTIT';

   fNumsequencia := CreateCmDbField('NUMSEQUENCIA',ftfloat,True,False);
   fMatricula := CreateCmDbField('MATRICULA',ftString,True,False);
   fIniciosalariof := CreateCmDbField('INICIOSALARIOF',ftDateTime,True,False);
   fInicioimpostor := CreateCmDbField('INICIOIMPOSTOR',ftDateTime,True,False);
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True);
   fIddependencia := CreateCmDbField('IDDEPENDENCIA',ftString,False,False);
   fFlgdesinado := CreateCmDbField('FLGDESINADO',ftfloat,True,False);
   fFlgdesignado := CreateCmDbField('FLGDESIGNADO',ftfloat,True,False);
   fFlgdeplegal := CreateCmDbField('FLGDEPLEGAL',ftfloat,True,False);
   fFlgcontasalariof := CreateCmDbField('FLGCONTASALARIOF',ftfloat,True,False);
   fFlgcontaimpostor := CreateCmDbField('FLGCONTAIMPOSTOR',ftfloat,True,False);
   fFlgbeneficiario := CreateCmDbField('FLGBENEFICIARIO',ftfloat,True,False);
   fFimsalariof := CreateCmDbField('FIMSALARIOF',ftDateTime,True,False);
   fFimimpostor := CreateCmDbField('FIMIMPOSTOR',ftDateTime,True,False);
end;

function TDbDepentit.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

end.



