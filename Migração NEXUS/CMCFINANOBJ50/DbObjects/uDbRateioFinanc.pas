{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Claudio Beraldo da Silva        }
{ Atualizado Em: 18/02/2002                             }
{                                                       }
{*******************************************************}
{---------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
pendência :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : Divs
Data      : 28/10/2004
Autor     : Alex Pereira
pendência : 17193
Descrição : Segregação de recursos - Implementar a segregação de recursos na origem
            Nova estrutura IDSEGREGACRITER
---------------------------------------------------------------------------------------------------}

unit uDbRateioFinanc;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbRateioFinanc = class(TCmDbObject)

  private
    FValoroutramoeda: TCmDbField;
    FIdpatro: TCmDbField;
    FIdempresa: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdplanoprev: TCmDbField;
    FValor: TCmDbField;
    FMoecodigo: TCmDbField;
    FCodtipdoc: TCmDbField;
    FIdrateiofinanc: TCmDbField;
    FRecpag: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodlancfinanc: TCmDbField;
    FIdprograma: TCmDbField;
    FLotetransmissao: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdSegregaCriter: TCmDbField;
    procedure SetIdSegregaCriter(const Value: TCmDbField);

  public

     Property Valoroutramoeda: TCmDbField read FValoroutramoeda write FValoroutramoeda;
     Property Valor: TCmDbField read FValor write FValor;
     Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Lotetransmissao: TCmDbField read FLotetransmissao write FLotetransmissao;
     Property Idrateiofinanc: TCmDbField read FIdrateiofinanc write FIdrateiofinanc;
     Property Idprograma: TCmDbField read FIdprograma write FIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write FIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write FIdpatro;
     Property Idempresa: TCmDbField read FIdempresa write FIdempresa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     Property Codtipdoc: TCmDbField read FCodtipdoc write FCodtipdoc;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write FCodlancfinanc;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;
     Property IdSegregaCriter: TCmDbField read FIdSegregaCriter write SetIdSegregaCriter;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;


  End;



implementation
{ TDbRateioFinanc }




constructor TDbRateioFinanc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'RATEIOFINANC';

   fValoroutramoeda := CreateCmDbField('VALOROUTRAMOEDA',ftfloat,False,False,False,True,'');
   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True,'');
   fIdrateiofinanc := CreateCmDbField('IDRATEIOFINANC',ftfloat,True,True,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftfloat,True,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   FIdSegregaCriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,False,False,False,True,'');
end;



function TDbRateioFinanc.Insert: Boolean;
begin
   fIdrateiofinanc.AsFloat := GetSequence('RATEIOFINANC');
   Result := Inherited Insert;
end;



function TDbRateioFinanc.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;



procedure TDbRateioFinanc.SetIdSegregaCriter(const Value: TCmDbField);
begin
  FIdSegregaCriter := Value;
end;



end.
