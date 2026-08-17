{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 26/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbObjetoXItem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbObjetoXItem = class(TCmDbObject)

  private
    FIdobjeto: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FCodsubconta: TCmDbField;
    FPlano: TCmDbField;
    FRecpag: TCmDbField;
    FIditem: TCmDbField;
    FPlaconta: TCmDbField;
  public
     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Plano: TCmDbField read FPlano write FPlano;
     Property Placonta: TCmDbField read FPlaconta write FPlaconta;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idobjeto: TCmDbField read FIdobjeto write FIdobjeto;
     Property Iditem: TCmDbField read FIditem write FIditem;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     Property Codsubconta: TCmDbField read FCodsubconta write FCodsubconta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbObjetoXItem }

constructor TDbObjetoXItem.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OBJETOXITEM';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,True,True,False,True,'');
   fIditem := CreateCmDbField('IDITEM',ftfloat,True,True,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
end;

function TDbObjetoXItem.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

end.



