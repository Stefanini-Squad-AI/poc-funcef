{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbContprev;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContprev = class(TCmDbObject)

  private

  public

     Property Vlraceitadiverg: TCmDbField;
     Property Valorbasetaxa: TCmDbField;
     Property Unidnegoc13: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Tipcodigo13: TCmDbField;
     Property Tipcodigo: TCmDbField;
     Property Tempoopcao: TCmDbField;
     Property Recpag13: TCmDbField;
     Property Recpagretro: TCmDbField;
     Property Recpagdevol: TCmDbField;
     Property Recpag: TCmDbField;
     Property Plano13: TCmDbField;
     Property Planoretro: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontad13: TCmDbField;
     Property Placontadretro: TCmDbField;
     Property Placontadprovis: TCmDbField;
     Property Placontadevolpat: TCmDbField;
     Property Placontadevol: TCmDbField;
     Property Placontadbanco13: TCmDbField;
     Property Placontadbanco: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontac13: TCmDbField;
     Property Placontacretro: TCmDbField;
     Property Placontacprovis: TCmDbField;
     Property Placontac: TCmDbField;
     Property Perccalculo: TCmDbField;
     Property Ordemcalculo: TCmDbField;
     Property Numprioridade: TCmDbField;
     Property Numopcoes: TCmDbField;
     Property Nomevalorbase3: TCmDbField;
     Property Nomevalorbase2: TCmDbField;
     Property Nomevalorbase1: TCmDbField;
     Property Mesrefopcao: TCmDbField;
     Property Indicereajcontrib: TCmDbField;
     Property Idrubricadevoluc: TCmDbField;
     Property Idrubricaatraso: TCmDbField;
     Property Idrubrica: TCmDbField;
     Property Idrubdectercdevol: TCmDbField;
     Property Idrubdectercatra: TCmDbField;
     Property Idrubdecterc: TCmDbField;
     Property Idrubacertodect: TCmDbField;
     Property Idrubacerto: TCmDbField;
     Property Idregravlrreserva: TCmDbField;
     Property Idregravalidaop3: TCmDbField;
     Property Idregravalidaop2: TCmDbField;
     Property Idregravalidaop1: TCmDbField;
     Property Idregraultpgto13: TCmDbField;
     Property Idregraultpagto: TCmDbField;
     Property Idregraprimpgto13: TCmDbField;
     Property Idregraprimpagto: TCmDbField;
     Property Idregraconvcotas: TCmDbField;
     Property Idregracobranca: TCmDbField;
     Property Idregracobatraso: TCmDbField;
     Property Idregracalculo13: TCmDbField;
     Property Idregracalculo: TCmDbField;
     Property Idregracalcop3: TCmDbField;
     Property Idregracalcop2: TCmDbField;
     Property Idregracalcop1: TCmDbField;
     Property Idplanprevcontab: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idplanopai: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idempresa13: TCmDbField;
     Property Idempresaretro: TCmDbField;
     Property Idempresaprop13: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idcontribuicao: TCmDbField;
     Property Idcontribpai3: TCmDbField;
     Property Idcontribpai2: TCmDbField;
     Property Idcontribpai: TCmDbField;
     Property Flgtotal: TCmDbField;
     Property Flgsalprorata1pg: TCmDbField;
     Property Flgrecalccontfol: TCmDbField;
     Property Flgpagador: TCmDbField;
     Property Flgopcpc: TCmDbField;
     Property Flgobrigaop3: TCmDbField;
     Property Flgobrigaop2: TCmDbField;
     Property Flgobrigaop1: TCmDbField;
     Property Flgnormal: TCmDbField;
     Property Flgnaoexigerec: TCmDbField;
     Property Flgjurosdevol: TCmDbField;
     Property Flgjurosatraso: TCmDbField;
     Property Flginterno: TCmDbField;
     Property Flgincideir: TCmDbField;
     Property Flgeditaop3: TCmDbField;
     Property Flgeditaop2: TCmDbField;
     Property Flgeditaop1: TCmDbField;
     Property Flgdescprim13: TCmDbField;
     Property Flgdescfolhault: TCmDbField;
     Property Flgdescfolha: TCmDbField;
     Property Flgcorrecaodevol: TCmDbField;
     Property Flgcorrecaoatraso: TCmDbField;
     Property Flgcontingencia: TCmDbField;
     Property Flgcobra13dtfim: TCmDbField;
     Property Flgcobrancaparci: TCmDbField;
     Property Flgcobradecterc: TCmDbField;
     Property Flgaceitaopcao: TCmDbField;
     Property Critvalorbase3: TCmDbField;
     Property Critvalorbase2: TCmDbField;
     Property Critvalorbase1: TCmDbField;
     Property Critsalario: TCmDbField;
     Property Codtiprecdes13: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codtipdoc13: TCmDbField;
     Property Codtipdoc: TCmDbField;
     Property Codtipdesemb13: TCmDbField;
     Property Codtipdesembdevol: TCmDbField;
     Property Codtipdesembcar: TCmDbField;
     Property Codsubconta13: TCmDbField;
     Property Codsubcontadretro: TCmDbField;
     Property Codsubcontacretro: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codportforma13: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codcentrorespon13: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocustod13: TCmDbField;
     Property Codcentrocustodr: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustoc13: TCmDbField;
     Property Codcentrocustocr: TCmDbField;
     Property Codcentrocustoc: TCmDbField;
     Property Codccustodprovis: TCmDbField;
     Property Codccustodevolpat: TCmDbField;
     Property Codccustodevol: TCmDbField;
     Property Codccustocprovis: TCmDbField;
     Property Codalterajuros13: TCmDbField;
     Property Codalteradorjuros: TCmDbField;
     Property Codalteradorcorr: TCmDbField;
     Property Codalteracorr13: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContprev }

constructor TDbContprev.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTPREV';

   fVlraceitadiverg := CreateCmDbField('VLRACEITADIVERG',ftfloat,True,False,False,True);
   fValorbasetaxa := CreateCmDbField('VALORBASETAXA',ftfloat,True,False,False,True);
   fUnidnegoc13 := CreateCmDbField('UNIDNEGOC13',ftfloat,True,False,False,True);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True);
   fTipcodigo13 := CreateCmDbField('TIPCODIGO13',ftString,True,False,False,True);
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,True,False,False,True);
   fTempoopcao := CreateCmDbField('TEMPOOPCAO',ftfloat,True,False,False,True);
   fRecpag13 := CreateCmDbField('RECPAG13',ftString,True,False,False,True);
   fRecpagretro := CreateCmDbField('RECPAGRETRO',ftString,True,False,False,True);
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,True,False,False,True);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True);
   fPlano13 := CreateCmDbField('PLANO13',ftfloat,True,False,False,True);
   fPlanoretro := CreateCmDbField('PLANORETRO',ftfloat,True,False,False,True);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True);
   fPlacontad13 := CreateCmDbField('PLACONTAD13',ftString,True,False,False,True);
   fPlacontadretro := CreateCmDbField('PLACONTADRETRO',ftString,True,False,False,True);
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,True,False,False,True);
   fPlacontadevolpat := CreateCmDbField('PLACONTADEVOLPAT',ftString,True,False,False,True);
   fPlacontadevol := CreateCmDbField('PLACONTADEVOL',ftString,True,False,False,True);
   fPlacontadbanco13 := CreateCmDbField('PLACONTADBANCO13',ftString,True,False,False,True);
   fPlacontadbanco := CreateCmDbField('PLACONTADBANCO',ftString,True,False,False,True);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False,False,True);
   fPlacontac13 := CreateCmDbField('PLACONTAC13',ftString,True,False,False,True);
   fPlacontacretro := CreateCmDbField('PLACONTACRETRO',ftString,True,False,False,True);
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,True,False,False,True);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False,False,True);
   fPerccalculo := CreateCmDbField('PERCCALCULO',ftfloat,True,False,False,True);
   fOrdemcalculo := CreateCmDbField('ORDEMCALCULO',ftfloat,True,False,False,True);
   fNumprioridade := CreateCmDbField('NUMPRIORIDADE',ftfloat,True,False,False,True);
   fNumopcoes := CreateCmDbField('NUMOPCOES',ftfloat,True,False,False,True);
   fNomevalorbase3 := CreateCmDbField('NOMEVALORBASE3',ftString,True,False,False,True);
   fNomevalorbase2 := CreateCmDbField('NOMEVALORBASE2',ftString,True,False,False,True);
   fNomevalorbase1 := CreateCmDbField('NOMEVALORBASE1',ftString,True,False,False,True);
   fMesrefopcao := CreateCmDbField('MESREFOPCAO',ftString,True,False,False,True);
   fIndicereajcontrib := CreateCmDbField('INDICEREAJCONTRIB',ftfloat,True,False,False,True);
   fIdrubricadevoluc := CreateCmDbField('IDRUBRICADEVOLUC',ftfloat,True,False,False,True);
   fIdrubricaatraso := CreateCmDbField('IDRUBRICAATRASO',ftfloat,True,False,False,True);
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,False,False,True);
   fIdrubdectercdevol := CreateCmDbField('IDRUBDECTERCDEVOL',ftfloat,True,False,False,True);
   fIdrubdectercatra := CreateCmDbField('IDRUBDECTERCATRA',ftfloat,True,False,False,True);
   fIdrubdecterc := CreateCmDbField('IDRUBDECTERC',ftfloat,True,False,False,True);
   fIdrubacertodect := CreateCmDbField('IDRUBACERTODECT',ftfloat,True,False,False,True);
   fIdrubacerto := CreateCmDbField('IDRUBACERTO',ftfloat,True,False,False,True);
   fIdregravlrreserva := CreateCmDbField('IDREGRAVLRRESERVA',ftfloat,True,False,False,True);
   fIdregravalidaop3 := CreateCmDbField('IDREGRAVALIDAOP3',ftfloat,True,False,False,True);
   fIdregravalidaop2 := CreateCmDbField('IDREGRAVALIDAOP2',ftfloat,True,False,False,True);
   fIdregravalidaop1 := CreateCmDbField('IDREGRAVALIDAOP1',ftfloat,True,False,False,True);
   fIdregraultpgto13 := CreateCmDbField('IDREGRAULTPGTO13',ftfloat,True,False,False,True);
   fIdregraultpagto := CreateCmDbField('IDREGRAULTPAGTO',ftfloat,True,False,False,True);
   fIdregraprimpgto13 := CreateCmDbField('IDREGRAPRIMPGTO13',ftfloat,True,False,False,True);
   fIdregraprimpagto := CreateCmDbField('IDREGRAPRIMPAGTO',ftfloat,True,False,False,True);
   fIdregraconvcotas := CreateCmDbField('IDREGRACONVCOTAS',ftfloat,True,False,False,True);
   fIdregracobranca := CreateCmDbField('IDREGRACOBRANCA',ftfloat,True,False,False,True);
   fIdregracobatraso := CreateCmDbField('IDREGRACOBATRASO',ftfloat,True,False,False,True);
   fIdregracalculo13 := CreateCmDbField('IDREGRACALCULO13',ftfloat,True,False,False,True);
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,True,False,False,True);
   fIdregracalcop3 := CreateCmDbField('IDREGRACALCOP3',ftfloat,True,False,False,True);
   fIdregracalcop2 := CreateCmDbField('IDREGRACALCOP2',ftfloat,True,False,False,True);
   fIdregracalcop1 := CreateCmDbField('IDREGRACALCOP1',ftfloat,True,False,False,True);
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,True,False,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdplanopai := CreateCmDbField('IDPLANOPAI',ftfloat,True,False,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True);
   fIdempresa13 := CreateCmDbField('IDEMPRESA13',ftfloat,True,False,False,True);
   fIdempresaretro := CreateCmDbField('IDEMPRESARETRO',ftfloat,True,False,False,True);
   fIdempresaprop13 := CreateCmDbField('IDEMPRESAPROP13',ftfloat,True,False,False,True);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False,False,True);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True);
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,False,True,False,True);
   fIdcontribpai3 := CreateCmDbField('IDCONTRIBPAI3',ftfloat,True,False,False,True);
   fIdcontribpai2 := CreateCmDbField('IDCONTRIBPAI2',ftfloat,True,False,False,True);
   fIdcontribpai := CreateCmDbField('IDCONTRIBPAI',ftfloat,True,False,False,True);
   fFlgtotal := CreateCmDbField('FLGTOTAL',ftfloat,True,False,False,True);
   fFlgsalprorata1pg := CreateCmDbField('FLGSALPRORATA1PG',ftfloat,True,False,False,True);
   fFlgrecalccontfol := CreateCmDbField('FLGRECALCCONTFOL',ftfloat,True,False,False,True);
   fFlgpagador := CreateCmDbField('FLGPAGADOR',ftString,True,False,False,True);
   fFlgopcpc := CreateCmDbField('FLGOPCPC',ftfloat,True,False,False,True);
   fFlgobrigaop3 := CreateCmDbField('FLGOBRIGAOP3',ftfloat,True,False,False,True);
   fFlgobrigaop2 := CreateCmDbField('FLGOBRIGAOP2',ftfloat,True,False,False,True);
   fFlgobrigaop1 := CreateCmDbField('FLGOBRIGAOP1',ftfloat,True,False,False,True);
   fFlgnormal := CreateCmDbField('FLGNORMAL',ftfloat,True,False,False,True);
   fFlgnaoexigerec := CreateCmDbField('FLGNAOEXIGEREC',ftfloat,True,False,False,True);
   fFlgjurosdevol := CreateCmDbField('FLGJUROSDEVOL',ftfloat,True,False,False,True);
   fFlgjurosatraso := CreateCmDbField('FLGJUROSATRASO',ftfloat,True,False,False,True);
   fFlginterno := CreateCmDbField('FLGINTERNO',ftString,True,False,False,True);
   fFlgincideir := CreateCmDbField('FLGINCIDEIR',ftfloat,True,False,False,True);
   fFlgeditaop3 := CreateCmDbField('FLGEDITAOP3',ftfloat,True,False,False,True);
   fFlgeditaop2 := CreateCmDbField('FLGEDITAOP2',ftfloat,True,False,False,True);
   fFlgeditaop1 := CreateCmDbField('FLGEDITAOP1',ftfloat,True,False,False,True);
   fFlgdescprim13 := CreateCmDbField('FLGDESCPRIM13',ftfloat,True,False,False,True);
   fFlgdescfolhault := CreateCmDbField('FLGDESCFOLHAULT',ftfloat,True,False,False,True);
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftfloat,True,False,False,True);
   fFlgcorrecaodevol := CreateCmDbField('FLGCORRECAODEVOL',ftfloat,True,False,False,True);
   fFlgcorrecaoatraso := CreateCmDbField('FLGCORRECAOATRASO',ftfloat,True,False,False,True);
   fFlgcontingencia := CreateCmDbField('FLGCONTINGENCIA',ftfloat,True,False,False,True);
   fFlgcobra13dtfim := CreateCmDbField('FLGCOBRA13DTFIM',ftfloat,True,False,False,True);
   fFlgcobrancaparci := CreateCmDbField('FLGCOBRANCAPARCI',ftfloat,True,False,False,True);
   fFlgcobradecterc := CreateCmDbField('FLGCOBRADECTERC',ftfloat,True,False,False,True);
   fFlgaceitaopcao := CreateCmDbField('FLGACEITAOPCAO',ftfloat,True,False,False,True);
   fCritvalorbase3 := CreateCmDbField('CRITVALORBASE3',ftString,True,False,False,True);
   fCritvalorbase2 := CreateCmDbField('CRITVALORBASE2',ftString,True,False,False,True);
   fCritvalorbase1 := CreateCmDbField('CRITVALORBASE1',ftString,True,False,False,True);
   fCritsalario := CreateCmDbField('CRITSALARIO',ftString,True,False,False,True);
   fCodtiprecdes13 := CreateCmDbField('CODTIPRECDES13',ftString,True,False,False,True);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True);
   fCodtipdoc13 := CreateCmDbField('CODTIPDOC13',ftfloat,True,False,False,True);
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False,False,True);
   fCodtipdesemb13 := CreateCmDbField('CODTIPDESEMB13',ftString,True,False,False,True);
   fCodtipdesembdevol := CreateCmDbField('CODTIPDESEMBDEVOL',ftString,True,False,False,True);
   fCodtipdesembcar := CreateCmDbField('CODTIPDESEMBCAR',ftString,True,False,False,True);
   fCodsubconta13 := CreateCmDbField('CODSUBCONTA13',ftfloat,True,False,False,True);
   fCodsubcontadretro := CreateCmDbField('CODSUBCONTADRETRO',ftfloat,True,False,False,True);
   fCodsubcontacretro := CreateCmDbField('CODSUBCONTACRETRO',ftfloat,True,False,False,True);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False,False,True);
   fCodportforma13 := CreateCmDbField('CODPORTFORMA13',ftfloat,True,False,False,True);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False,False,True);
   fCodcentrorespon13 := CreateCmDbField('CODCENTRORESPON13',ftString,True,False,False,True);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True);
   fCodcentrocustod13 := CreateCmDbField('CODCENTROCUSTOD13',ftString,True,False,False,True);
   fCodcentrocustodr := CreateCmDbField('CODCENTROCUSTODR',ftString,True,False,False,True);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False,False,True);
   fCodcentrocustoc13 := CreateCmDbField('CODCENTROCUSTOC13',ftString,True,False,False,True);
   fCodcentrocustocr := CreateCmDbField('CODCENTROCUSTOCR',ftString,True,False,False,True);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False,False,True);
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,True,False,False,True);
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,True,False,False,True);
   fCodccustodevol := CreateCmDbField('CODCCUSTODEVOL',ftString,True,False,False,True);
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,True,False,False,True);
   fCodalterajuros13 := CreateCmDbField('CODALTERAJUROS13',ftfloat,True,False,False,True);
   fCodalteradorjuros := CreateCmDbField('CODALTERADORJUROS',ftfloat,True,False,False,True);
   fCodalteradorcorr := CreateCmDbField('CODALTERADORCORR',ftfloat,True,False,False,True);
   fCodalteracorr13 := CreateCmDbField('CODALTERACORR13',ftfloat,True,False,False,True);
end;

function TDbContprev.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

function TDbContprev.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



