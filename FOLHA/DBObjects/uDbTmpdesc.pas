{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbTmpdesc;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbTmpdesc = class(TCmDbObject)

  private

  public

     Property Valorrecebido: TCmDbField;
     Property Valorinfo: TCmDbField;
     Property Valorbase3: TCmDbField;
     Property Valorbase2: TCmDbField;
     Property Valorbase1: TCmDbField;
     Property Valor: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Tipcodigo: TCmDbField;
     Property Sitenvio: TCmDbField;
     Property Sistorigem: TCmDbField;
     Property Seqproposta: TCmDbField;
     Property Referencia: TCmDbField;
     Property Recpag: TCmDbField;
     Property Prazorub: TCmDbField;
     Property Plncodigoprev: TCmDbField;
     Property Plncodigoefet: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontac: TCmDbField;
     Property Periodo: TCmDbField;
     Property Parcelarub: TCmDbField;
     Property Ordem: TCmDbField;
     Property Numprioridade: TCmDbField;
     Property Numlancto: TCmDbField;
     Property Numdependseguro: TCmDbField;
     Property Nodocumento: TCmDbField;
     Property Mesreferencia: TCmDbField;
     Property Mescobranca: TCmDbField;
     Property Matricula: TCmDbField;
     Property Loteprevia: TCmDbField;
     Property Inscricaonumero: TCmDbField;
     Property Idtitular: TCmDbField;
     Property Idregracalculo: TCmDbField;
     Property Idprovento: TCmDbField;
     Property Idplanprevcontab: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idplanass: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idmotivo: TCmDbField;
     Property Idmodulo: TCmDbField;
     Property Idlote: TCmDbField;
     Property Idfundacao: TCmDbField;
     Property Idfavorecido: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idempcobranca: TCmDbField;
     Property Iddesconto: TCmDbField;
     Property Fontepagadora: TCmDbField;
     Property Flgtipodesc: TCmDbField;
     Property Flgintevento: TCmDbField;
     Property Flgfornpag: TCmDbField;
     Property Flgforncomiss: TCmDbField;
     Property Flgexistehst: TCmDbField;
     Property Flgdesconto: TCmDbField;
     Property Flgdescfolha: TCmDbField;
     Property Flgatrasodevol: TCmDbField;
     Property Flgalterador: TCmDbField;
     Property Exercicio: TCmDbField;
     Property Descricao: TCmDbField;
     Property Datareferencia: TCmDbField;
     Property Datarecebimento: TCmDbField;
     Property Datacobranca: TCmDbField;
     Property Compldocumento: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codtipdoc: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codretorno: TCmDbField;
     Property Codprovdesc: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Coddocumentoprev: TCmDbField;
     Property Coddocumentoefet: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustoc: TCmDbField;
     Property Codalterador: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTmpdesc }

constructor TDbTmpdesc.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TMPDESC';

   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,True,False);
   fValorinfo := CreateCmDbField('VALORINFO',ftfloat,True,False);
   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,True,False);
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,True,False);
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,True,False);
   fValor := CreateCmDbField('VALOR',ftfloat,True,False);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False);
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,True,False);
   fSitenvio := CreateCmDbField('SITENVIO',ftString,True,False);
   fSistorigem := CreateCmDbField('SISTORIGEM',ftString,True,False);
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,False);
   fReferencia := CreateCmDbField('REFERENCIA',ftString,True,False);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False);
   fPrazorub := CreateCmDbField('PRAZORUB',ftfloat,True,False);
   fPlncodigoprev := CreateCmDbField('PLNCODIGOPREV',ftfloat,True,False);
   fPlncodigoefet := CreateCmDbField('PLNCODIGOEFET',ftfloat,True,False);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False);
   fPeriodo := CreateCmDbField('PERIODO',ftfloat,True,False);
   fParcelarub := CreateCmDbField('PARCELARUB',ftfloat,True,False);
   fOrdem := CreateCmDbField('ORDEM',ftfloat,True,False);
   fNumprioridade := CreateCmDbField('NUMPRIORIDADE',ftfloat,True,False);
   fNumlancto := CreateCmDbField('NUMLANCTO',ftfloat,True,False);
   fNumdependseguro := CreateCmDbField('NUMDEPENDSEGURO',ftString,True,False);
   fNodocumento := CreateCmDbField('NODOCUMENTO',ftfloat,True,False);
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,True,False);
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,True,False);
   fMatricula := CreateCmDbField('MATRICULA',ftString,True,False);
   fLoteprevia := CreateCmDbField('LOTEPREVIA',ftfloat,True,False);
   fInscricaonumero := CreateCmDbField('INSCRICAONUMERO',ftfloat,True,False);
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,False);
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,True,False);
   fIdprovento := CreateCmDbField('IDPROVENTO',ftfloat,True,False);
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,True,False);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False);
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,True,False);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,False);
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,True,False);
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False);
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,True,False);
   fIdfundacao := CreateCmDbField('IDFUNDACAO',ftfloat,True,False);
   fIdfavorecido := CreateCmDbField('IDFAVORECIDO',ftfloat,True,False);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False);
   fIdempcobranca := CreateCmDbField('IDEMPCOBRANCA',ftfloat,True,False);
   fIddesconto := CreateCmDbField('IDDESCONTO',ftfloat,True,False);
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,True,False);
   fFlgtipodesc := CreateCmDbField('FLGTIPODESC',ftString,True,False);
   fFlgintevento := CreateCmDbField('FLGINTEVENTO',ftString,True,False);
   fFlgfornpag := CreateCmDbField('FLGFORNPAG',ftfloat,True,False);
   fFlgforncomiss := CreateCmDbField('FLGFORNCOMISS',ftfloat,True,False);
   fFlgexistehst := CreateCmDbField('FLGEXISTEHST',ftfloat,True,False);
   fFlgdesconto := CreateCmDbField('FLGDESCONTO',ftfloat,True,False);
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftString,True,False);
   fFlgatrasodevol := CreateCmDbField('FLGATRASODEVOL',ftString,True,False);
   fFlgalterador := CreateCmDbField('FLGALTERADOR',ftString,True,False);
   fExercicio := CreateCmDbField('EXERCICIO',ftfloat,True,False);
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
   fDatareferencia := CreateCmDbField('DATAREFERENCIA',ftDateTime,True,False);
   fDatarecebimento := CreateCmDbField('DATARECEBIMENTO',ftDateTime,True,False);
   fDatacobranca := CreateCmDbField('DATACOBRANCA',ftDateTime,True,False);
   fCompldocumento := CreateCmDbField('COMPLDOCUMENTO',ftString,True,False);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False);
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False);
   fCodretorno := CreateCmDbField('CODRETORNO',ftString,True,False);
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,True,False);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
   fCoddocumentoprev := CreateCmDbField('CODDOCUMENTOPREV',ftfloat,True,False);
   fCoddocumentoefet := CreateCmDbField('CODDOCUMENTOEFET',ftfloat,True,False);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False);
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,True,False);
end;

function TDbTmpdesc.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

end.



