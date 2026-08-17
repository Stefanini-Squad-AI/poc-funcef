{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBeneficio;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBeneficio = class(TCmDbObject)

  private

  public

     Property Tipobeneficio: TCmDbField;
     Property Prazoprovisorio: TCmDbField;
     Property Numordemevento: TCmDbField;
     Property Nome: TCmDbField;
     Property Idtppagtobenefic: TCmDbField;
     Property Idtpbeneficio: TCmDbField;
     Property Ideventogerador: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Flgvoltasitant: TCmDbField;
     Property Flgusadtprevisao: TCmDbField;
     Property Flgresgate: TCmDbField;
     Property Flgpeculio: TCmDbField;
     Property Flgdestbenef: TCmDbField;
     Property Flgcobertvitalic: TCmDbField;
     Property Flgbeneftemp: TCmDbField;
     Property Flgbenefprov: TCmDbField;
     Property Flgbenefobrigato: TCmDbField;
     Property Flgassocbenefref: TCmDbField;
     Property Descrub: TCmDbField;
     Property Codnatureza: TCmDbField;
     Property Codbenefspc: TCmDbField;
     Property Codbeneficio: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBeneficio }

constructor TDbBeneficio.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFICIO';

   fTipobeneficio := CreateCmDbField('TIPOBENEFICIO',ftfloat,True,False,False,True);
   fPrazoprovisorio := CreateCmDbField('PRAZOPROVISORIO',ftfloat,True,False,False,True);
   fNumordemevento := CreateCmDbField('NUMORDEMEVENTO',ftfloat,True,False,False,True);
   fNome := CreateCmDbField('NOME',ftString,True,False,False,True);
   fIdtppagtobenefic := CreateCmDbField('IDTPPAGTOBENEFIC',ftfloat,True,False,False,True);
   fIdtpbeneficio := CreateCmDbField('IDTPBENEFICIO',ftfloat,True,False,False,True);
   fIdeventogerador := CreateCmDbField('IDEVENTOGERADOR',ftfloat,True,False,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
   fFlgvoltasitant := CreateCmDbField('FLGVOLTASITANT',ftfloat,True,False,False,True);
   fFlgusadtprevisao := CreateCmDbField('FLGUSADTPREVISAO',ftfloat,True,False,False,True);
   fFlgresgate := CreateCmDbField('FLGRESGATE',ftfloat,True,False,False,True);
   fFlgpeculio := CreateCmDbField('FLGPECULIO',ftfloat,True,False,False,True);
   fFlgdestbenef := CreateCmDbField('FLGDESTBENEF',ftString,True,False,False,True);
   fFlgcobertvitalic := CreateCmDbField('FLGCOBERTVITALIC',ftfloat,True,False,False,True);
   fFlgbeneftemp := CreateCmDbField('FLGBENEFTEMP',ftfloat,True,False,False,True);
   fFlgbenefprov := CreateCmDbField('FLGBENEFPROV',ftfloat,True,False,False,True);
   fFlgbenefobrigato := CreateCmDbField('FLGBENEFOBRIGATO',ftfloat,False,False,False,True);
   fFlgassocbenefref := CreateCmDbField('FLGASSOCBENEFREF',ftfloat,True,False,False,True);
   fDescrub := CreateCmDbField('DESCRUB',ftString,True,False,False,True);
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString,True,False,False,True);
   fCodbenefspc := CreateCmDbField('CODBENEFSPC',ftString,True,False,False,True);
   fCodbeneficio := CreateCmDbField('CODBENEFICIO',ftString,True,False,False,True);
end;

function TDbBeneficio.Insert: Boolean;
begin

   f'Idbeneficio'.AsFloat := GetSequence(BENEFICIO);
   Result := Inherited Insert;

end;

function TDbBeneficio.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



