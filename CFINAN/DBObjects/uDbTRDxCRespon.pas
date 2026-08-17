{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTRDxCRespon;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTRDxCRespon = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FRecpag: TCmDbField;

  public

     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTRDxCRespon }

constructor TDbTRDxCRespon.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TRDXCRESPON';

   fRecpag := CreateCmDbField('RECPAG',ftString,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,True,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,True,False,True,'');
end;

function TDbTRDxCRespon.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbTRDxCRespon.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

end.



