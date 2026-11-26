{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbPrevia;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPrevia = class(TCmDbObject)

  private

  public

     Property Valorrecebido: TCmDbField;
     Property Valorprovento: TCmDbField;
     Property Valorinfo: TCmDbField;
     Property Valorcotas: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Seqrubrica: TCmDbField;
     Property Seqproposta: TCmDbField;
     Property Referencia: TCmDbField;
     Property Recpag: TCmDbField;
     Property Plano: TCmDbField;
     Property Placonta: TCmDbField;
     Property Ordem: TCmDbField;
     Property Numeroprocesso: TCmDbField;
     Property Mescobranca: TCmDbField;
     Property Mes: TCmDbField;
     Property Matricula: TCmDbField;
     Property Loteoriginal: TCmDbField;
     Property Idversaoestorno: TCmDbField;
     Property Idtitular: TCmDbField;
     Property Idrubrica: TCmDbField;
     Property Idresponsavel: TCmDbField;
     Property Idregracalculo: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idpatro: TCmDbField;
     Property Idmotivo: TCmDbField;
     Property Idmodulo: TCmDbField;
     Property Idlote: TCmDbField;
     Property Idlancirrfestorno: TCmDbField;
     Property Idfavorecido: TCmDbField;
     Property Ideventogerador: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Fontepagadora: TCmDbField;
     Property Flgtipodesc: TCmDbField;
     Property Flgsrb: TCmDbField;
     Property Flgpaga: TCmDbField;
     Property Flgok: TCmDbField;
     Property Flgirrf: TCmDbField;
     Property Flgindividual: TCmDbField;
     Property Flgeveninterno: TCmDbField;
     Property Flgespecial: TCmDbField;
     Property Flgdesconto: TCmDbField;
     Property Flgconcessao: TCmDbField;
     Property Flgcompoesalpart: TCmDbField;
     Property Flgcompoesalbenef: TCmDbField;
     Property Dfloatpagto: TCmDbField;
     Property Datapagamento: TCmDbField;
     Property Datainicio: TCmDbField;
     Property Datafinal: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codprovdesc: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codmoeda: TCmDbField;
     Property Codirrfdarf: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocusto: TCmDbField;
     Property Codalterador: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPrevia }

constructor TDbPrevia.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PREVIA';

   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,True,False);
   fValorprovento := CreateCmDbField('VALORPROVENTO',ftfloat,True,False);
   fValorinfo := CreateCmDbField('VALORINFO',ftfloat,True,False);
   fValorcotas := CreateCmDbField('VALORCOTAS',ftfloat,True,False);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False);
   fSeqrubrica := CreateCmDbField('SEQRUBRICA',ftfloat,False,True);
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,False);
   fReferencia := CreateCmDbField('REFERENCIA',ftString,False,True);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False);
   fPlaconta := CreateCmDbField('PLACONTA',ftString,True,False);
   fOrdem := CreateCmDbField('ORDEM',ftfloat,True,False);
   fNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,True,False);
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,False,True);
   fMes := CreateCmDbField('MES',ftString,False,True);
   fMatricula := CreateCmDbField('MATRICULA',ftString,True,False);
   fLoteoriginal := CreateCmDbField('LOTEORIGINAL',ftfloat,True,False);
   fIdversaoestorno := CreateCmDbField('IDVERSAOESTORNO',ftfloat,True,False);
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,True);
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,False,True);
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,False);
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,True,False);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,False);
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,False,True);
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False);
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,True,False);
   fIdlancirrfestorno := CreateCmDbField('IDLANCIRRFESTORNO',ftfloat,True,False);
   fIdfavorecido := CreateCmDbField('IDFAVORECIDO',ftfloat,True,False);
   fIdeventogerador := CreateCmDbField('IDEVENTOGERADOR',ftfloat,True,False);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,True,False);
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,True,False);
   fFlgtipodesc := CreateCmDbField('FLGTIPODESC',ftString,True,False);
   fFlgsrb := CreateCmDbField('FLGSRB',ftfloat,True,False);
   fFlgpaga := CreateCmDbField('FLGPAGA',ftfloat,True,False);
   fFlgok := CreateCmDbField('FLGOK',ftfloat,True,False);
   fFlgirrf := CreateCmDbField('FLGIRRF',ftfloat,True,False);
   fFlgindividual := CreateCmDbField('FLGINDIVIDUAL',ftfloat,True,False);
   fFlgeveninterno := CreateCmDbField('FLGEVENINTERNO',ftString,True,False);
   fFlgespecial := CreateCmDbField('FLGESPECIAL',ftfloat,True,False);
   fFlgdesconto := CreateCmDbField('FLGDESCONTO',ftfloat,True,False);
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,True,False);
   fFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,True,False);
   fFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,True,False);
   fDfloatpagto := CreateCmDbField('DFLOATPAGTO',ftfloat,True,False);
   fDatapagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,True,False);
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,True,False);
   fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,True,False);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False);
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,True,False);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
   fCodmoeda := CreateCmDbField('CODMOEDA',ftfloat,True,False);
   fCodirrfdarf := CreateCmDbField('CODIRRFDARF',ftString,True,False);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False);
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,False);
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,True,False);
end;

function TDbPrevia.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

end.



