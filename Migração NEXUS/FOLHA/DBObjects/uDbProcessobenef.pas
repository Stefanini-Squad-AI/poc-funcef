{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbProcessobenef;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbProcessobenef = class(TCmDbObject)

  private

  public

     Property Vlbenefdtpagto: TCmDbField;
     Property Vlbenefdtdireito: TCmDbField;
     Property Numeroprocesso: TCmDbField;
     Property Idsitprocesso: TCmDbField;
     Property Ideventogerador: TCmDbField;
     Property Flgacidental: TCmDbField;
     Property Dtregistro: TCmDbField;
     Property Dtevento: TCmDbField;
     Property Dtdireito: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbProcessobenef }

constructor TDbProcessobenef.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROCESSOBENEF';

   fVlbenefdtpagto := CreateCmDbField('VLBENEFDTPAGTO',ftfloat,True,False);
   fVlbenefdtdireito := CreateCmDbField('VLBENEFDTDIREITO',ftfloat,True,False);
   fNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,False,True);
   fIdsitprocesso := CreateCmDbField('IDSITPROCESSO',ftfloat,True,False);
   fIdeventogerador := CreateCmDbField('IDEVENTOGERADOR',ftfloat,True,False);
   fFlgacidental := CreateCmDbField('FLGACIDENTAL',ftfloat,False,False);
   fDtregistro := CreateCmDbField('DTREGISTRO',ftDateTime,True,False);
   fDtevento := CreateCmDbField('DTEVENTO',ftDateTime,True,False);
   fDtdireito := CreateCmDbField('DTDIREITO',ftDateTime,True,False);
end;

function TDbProcessobenef.Insert: Boolean;
begin

   fNumeroprocesso.AsFloat := GetSequence(PROCESSOBENEF);
   Result := Inherited Insert;

end;

end.



