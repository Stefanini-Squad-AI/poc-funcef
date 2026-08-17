{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadinstprocesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadinstprocesso = class(TCmDbObject)

  private

  public

     Property Vlrproc: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Obs: TCmDbField;
     Property Idusuario: TCmDbField;
     Property Idtipoprocesso: TCmDbField;
     Property Idprocesso: TCmDbField;
     Property Idpessresp: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Flgok: TCmDbField;
     Property Datainiprocesso: TCmDbField;
     Property Datafimprocesso: TCmDbField;
     Property Datafimprev: TCmDbField;
     Property Codgrupoprod: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocusto: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadinstprocesso }

constructor TDbRadinstprocesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADINSTPROCESSO';

   fVlrproc := CreateCmDbField('VLRPROC',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdtipoprocesso := CreateCmDbField('IDTIPOPROCESSO',ftfloat,False,False,False,True,'');
   fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,True,True,False,True,'');
   fIdpessresp := CreateCmDbField('IDPESSRESP',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlgok := CreateCmDbField('FLGOK',ftString,False,False,False,True,'');
   fDatainiprocesso := CreateCmDbField('DATAINIPROCESSO',ftDateTime,False,False,False,True,'');
   fDatafimprocesso := CreateCmDbField('DATAFIMPROCESSO',ftDateTime,False,False,False,True,'');
   fDatafimprev := CreateCmDbField('DATAFIMPREV',ftDateTime,False,False,False,True,'');
   fCodgrupoprod := CreateCmDbField('CODGRUPOPROD',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDbRadinstprocesso.Insert: Boolean;
begin

   fIdprocesso.AsFloat := GetSequence('RADINSTPROCESSO');
   Result := Inherited Insert;

end;


end.



