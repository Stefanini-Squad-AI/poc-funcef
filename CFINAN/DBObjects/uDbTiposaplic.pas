{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTiposaplic;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTiposAplic = class(TCmDbObject)

  private
    FPercustorend: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPrazoresgateprev: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FTiporesgate: TCmDbField;
    FMoecodigo: TCmDbField;
    FCodcorresp: TCmDbField;
    FFixavariavel: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdcontaorcrec: TCmDbField;
    FPercusto: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdcontaorccus: TCmDbField;
    FTxjurosprev: TCmDbField;
    FRecpag: TCmDbField;
    FDescricao: TCmDbField;
    FFlgreaplica: TCmDbField;
    FIdplanoorcamen: TCmDbField;
    FTipoaplicacao: TCmDbField;
    FIdempresa: TCmDbField;
    FTipoaplicsubst: TCmDbField;

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
     Property Txjurosprev: TCmDbField read FTxjurosprev write FTxjurosprev;
     Property Tiporesgate: TCmDbField read FTiporesgate write FTiporesgate;
     Property Tipoaplicsubst: TCmDbField read FTipoaplicsubst write FTipoaplicsubst;
     Property Tipoaplicacao: TCmDbField read FTipoaplicacao write FTipoaplicacao;
     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Prazoresgateprev: TCmDbField read FPrazoresgateprev write FPrazoresgateprev;
     Property Percustorend: TCmDbField read FPercustorend write FPercustorend;
     Property Percusto: TCmDbField read FPercusto write FPercusto;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Idplanoorcamen: TCmDbField read FIdplanoorcamen write FIdplanoorcamen;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write FIdempresa;
     Property Idcontaorcrec: TCmDbField read FIdcontaorcrec write FIdcontaorcrec;
     Property Idcontaorccus: TCmDbField read FIdcontaorccus write FIdcontaorccus;
     Property Flgreaplica: TCmDbField read FFlgreaplica write FFlgreaplica;
     Property Fixavariavel: TCmDbField read FFixavariavel write FFixavariavel;
     Property Descricao: TCmDbField read FDescricao write FDescricao;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     Property Codcorresp: TCmDbField read FCodcorresp write FCodcorresp;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoaplicacao }

constructor TDbTiposAplic.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOAPLICACAO';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTxjurosprev := CreateCmDbField('TXJUROSPREV',ftfloat,False,False,False,True,'');
   fTiporesgate := CreateCmDbField('TIPORESGATE',ftString,False,False,False,True,'');
   fTipoaplicsubst := CreateCmDbField('TIPOAPLICSUBST',ftfloat,False,False,False,True,'');
   fTipoaplicacao := CreateCmDbField('TIPOAPLICACAO',ftfloat,True,True,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPrazoresgateprev := CreateCmDbField('PRAZORESGATEPREV',ftfloat,False,False,False,True,'');
   fPercustorend := CreateCmDbField('PERCUSTOREND',ftfloat,False,False,False,True,'');
   fPercusto := CreateCmDbField('PERCUSTO',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdplanoorcamen := CreateCmDbField('IDPLANOORCAMEN',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdcontaorcrec := CreateCmDbField('IDCONTAORCREC',ftString,False,False,False,True,'');
   fIdcontaorccus := CreateCmDbField('IDCONTAORCCUS',ftString,False,False,False,True,'');
   fFlgreaplica := CreateCmDbField('FLGREAPLICA',ftString,False,False,False,True,'');
   fFixavariavel := CreateCmDbField('FIXAVARIAVEL',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodcorresp := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDbTiposAplic.Insert: Boolean;
begin
   fTipoaplicacao.AsFloat := GetSequence('TIPOAPLICACAO');
   Result := Inherited Insert;
end;

function TDbTiposAplic.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

end.



