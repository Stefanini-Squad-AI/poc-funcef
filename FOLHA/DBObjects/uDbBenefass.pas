{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefass = class(TCmDbObject)

  private

  public

     Property Tipo: TCmDbField;
     Property Seqproposta: TCmDbField;
     Property Responsavelpag: TCmDbField;
     Property Percpagmto: TCmDbField;
     Property Obscancel: TCmDbField;
     Property Idtitular: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idplanass: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Iddependente: TCmDbField;
     Property Flgativo: TCmDbField;
     Property Dtcancelamento: TCmDbField;
     Property Dataentrada: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefass }

constructor TDbBenefass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFASS';

   fTipo := CreateCmDbField('TIPO',ftString,True,False,False,True);
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,True,False,True);
   fResponsavelpag := CreateCmDbField('RESPONSAVELPAG',ftfloat,False,False,False,True);
   fPercpagmto := CreateCmDbField('PERCPAGMTO',ftfloat,True,False,False,True);
   fObscancel := CreateCmDbField('OBSCANCEL',ftString,True,False,False,True);
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,True,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,False,True,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True,False,True);
   fIddependente := CreateCmDbField('IDDEPENDENTE',ftfloat,False,True,False,True);
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False,False,True);
   fDtcancelamento := CreateCmDbField('DTCANCELAMENTO',ftDateTime,True,False,False,True);
   fDataentrada := CreateCmDbField('DATAENTRADA',ftDateTime,False,False,False,True);
end;

function TDbBenefass.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbBenefass.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



