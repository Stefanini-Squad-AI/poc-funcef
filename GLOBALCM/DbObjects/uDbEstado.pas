{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2005                             }
{                                                       }
{*******************************************************}

unit uDbEstado;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEstado = class(TCmDbObject)

  private

  public

     Property Nomeestado: TCmDbField;
     Property Idpais: TCmDbField;
     Property Idestado: TCmDbField;
     Property Codjurisdicao: TCmDbField;
     Property Codfiscal: TCmDbField;
     Property Codestado: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEstado }

constructor TDbEstado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ESTADO';

   fNomeestado := CreateCmDbField('NOMEESTADO',ftString,False,False,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,True,True,False,True,'');
   fIdestado := CreateCmDbField('IDESTADO',ftfloat,True,False,False,True,'');
   fCodjurisdicao := CreateCmDbField('CODJURISDICAO',ftString,False,False,False,True,'');
   fCodfiscal := CreateCmDbField('CODFISCAL',ftString,False,False,False,True,'');
   fCodestado := CreateCmDbField('CODESTADO',ftString,True,True,False,True,'');
end;

function TDbEstado.Insert: Boolean;
begin

   fIdpais.AsFloat := GetSequence('ESTADO');
   Result := Inherited Insert;

end;


end.



