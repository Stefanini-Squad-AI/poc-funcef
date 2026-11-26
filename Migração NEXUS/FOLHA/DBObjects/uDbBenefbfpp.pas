{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefbfpp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefbfpp = class(TCmDbObject)

  private

  public

     Property Valoratual: TCmDbField;
     Property Ultvalorbruto: TCmDbField;
     Property Ultmesreajuste: TCmDbField;
     Property Ultmespreparo: TCmDbField;
     Property Numeroprocesso: TCmDbField;
     Property Idtppagtobenefic: TCmDbField;
     Property Idsitbeneficio: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Idbeneficiariopp: TCmDbField;
     Property Flgdataprevista: TCmDbField;
     Property Datainicio: TCmDbField;
     Property Datafinalprevista: TCmDbField;
     Property Datafinal: TCmDbField;
     Property Codportforma: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefbfpp }

constructor TDbBenefbfpp.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFBFPP';

   fValoratual := CreateCmDbField('VALORATUAL',ftfloat,True,False,False,True);
   fUltvalorbruto := CreateCmDbField('ULTVALORBRUTO',ftfloat,True,False,False,True);
   fUltmesreajuste := CreateCmDbField('ULTMESREAJUSTE',ftString,True,False,False,True);
   fUltmespreparo := CreateCmDbField('ULTMESPREPARO',ftString,True,False,False,True);
   fNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,False,True,False,True);
   fIdtppagtobenefic := CreateCmDbField('IDTPPAGTOBENEFIC',ftfloat,True,False,False,True);
   fIdsitbeneficio := CreateCmDbField('IDSITBENEFICIO',ftfloat,True,False,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
   fIdbeneficiariopp := CreateCmDbField('IDBENEFICIARIOPP',ftfloat,False,True,False,True);
   fFlgdataprevista := CreateCmDbField('FLGDATAPREVISTA',ftfloat,True,False,False,True);
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,True,False,False,True);
   fDatafinalprevista := CreateCmDbField('DATAFINALPREVISTA',ftDateTime,True,False,False,True);
   fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,True,False,False,True);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False,False,True);
end;

function TDbBenefbfpp.Insert: Boolean;
begin

 
   Result := Inherited Insert;

end;

function TDbBenefbfpp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



