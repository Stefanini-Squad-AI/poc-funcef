{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefplanprev;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefplanprev = class(TCmDbObject)

  private

  public

     Property Unidnegocabn: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Tpmodalidade: TCmDbField;
     Property Tipcodigoabn: TCmDbField;
     Property Tipcodigo: TCmDbField;
     Property Recpagretro: TCmDbField;
     Property Recpagdevol: TCmDbField;
     Property Recpagabn: TCmDbField;
     Property Recpag: TCmDbField;
     Property Prazoprovisorio: TCmDbField;
     Property Prazoconcessao: TCmDbField;
     Property Planoretro: TCmDbField;
     Property Planoabn: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontadretro: TCmDbField;
     Property Placontadprovis: TCmDbField;
     Property Placontadevpata: TCmDbField;
     Property Placontadevolpat: TCmDbField;
     Property Placontadevola: TCmDbField;
     Property Placontadevol: TCmDbField;
     Property Placontadabn: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontacretro: TCmDbField;
     Property Placontacprovis: TCmDbField;
     Property Placontacabn: TCmDbField;
     Property Placontac: TCmDbField;
     Property Origemcmbeneficio: TCmDbField;
     Property Numopcoes: TCmDbField;
     Property Nomevalorbase3: TCmDbField;
     Property Nomevalorbase2: TCmDbField;
     Property Nomevalorbase1: TCmDbField;
     Property Mesreajbenef: TCmDbField;
     Property Indicereajbenef: TCmDbField;
     Property Idtpreajbenef: TCmDbField;
     Property Idrubricarevisao: TCmDbField;
     Property Idrubricadif: TCmDbField;
     Property Idrubricacorrecao: TCmDbField;
     Property Idrubricaatraso: TCmDbField;
     Property Idrubrica: TCmDbField;
     Property Idrubdevolucao: TCmDbField;
     Property Idrubdescantecab: TCmDbField;
     Property Idrubantecabono: TCmDbField;
     Property Idrubabonofim: TCmDbField;
     Property Idrubabono: TCmDbField;
     Property Idrgvalortotal: TCmDbField;
     Property Idrelatbeneficio: TCmDbField;
     Property Idregravlrbenefc: TCmDbField;
     Property Idregravalidaop3: TCmDbField;
     Property Idregravalidaop2: TCmDbField;
     Property Idregravalidaop1: TCmDbField;
     Property Idregraultpagto: TCmDbField;
     Property Idregrasrb: TCmDbField;
     Property Idregrasimulacont: TCmDbField;
     Property Idregrasimula: TCmDbField;
     Property Idregrareajbenef: TCmDbField;
     Property Idregraprimpagto: TCmDbField;
     Property Idregrapagamento: TCmDbField;
     Property Idregrapagaatraso: TCmDbField;
     Property Idregramanutencao: TCmDbField;
     Property Idregrainicio: TCmDbField;
     Property Idregrafim: TCmDbField;
     Property Idregraelegibili: TCmDbField;
     Property Idregradtdirpleno: TCmDbField;
     Property Idregradtdirini: TCmDbField;
     Property Idregracobradevol: TCmDbField;
     Property Idregracalculo: TCmDbField;
     Property Idregracalcop3: TCmDbField;
     Property Idregracalcop2: TCmDbField;
     Property Idregracalcop1: TCmDbField;
     Property Idregracalcinss: TCmDbField;
     Property Idregracalcabono: TCmDbField;
     Property Idregrabenefmin: TCmDbField;
     Property Idregrabeneficia: TCmDbField;
     Property Idproduto: TCmDbField;
     Property Idplanprevcontab: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idplanobenefref: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idempresaretro: TCmDbField;
     Property Idempresapropabn: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresaabn: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idbenefref: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Flgusaevolfunc: TCmDbField;
     Property Flgreferencia: TCmDbField;
     Property Flgrecalculafim: TCmDbField;
     Property Flgquitapreviden: TCmDbField;
     Property Flgquitaempresti: TCmDbField;
     Property Flgquitaassisten: TCmDbField;
     Property Flgpossuiabono: TCmDbField;
     Property Flgpagainteg: TCmDbField;
     Property Flgpagainss: TCmDbField;
     Property Flgobrigaop3: TCmDbField;
     Property Flgobrigaop2: TCmDbField;
     Property Flgobrigaop1: TCmDbField;
     Property Flgobriganproc: TCmDbField;
     Property Flgeditaop3: TCmDbField;
     Property Flgeditaop2: TCmDbField;
     Property Flgeditaop1: TCmDbField;
     Property Flgdataindiceres: TCmDbField;
     Property Flgcorrecaodevol: TCmDbField;
     Property Flgcorrecaoatraso: TCmDbField;
     Property Flgcalctodomes: TCmDbField;
     Property Flgbenefopcional: TCmDbField;
     Property Flgbenefinf: TCmDbField;
     Property Flgaceitaopcao: TCmDbField;
     Property Flgabonofinalben: TCmDbField;
     Property Dataultreajuste: TCmDbField;
     Property Codtiprecebdevol: TCmDbField;
     Property Codtiprecebcap: TCmDbField;
     Property Codtiprecdesabn: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codtipdocabn: TCmDbField;
     Property Codtipdoc: TCmDbField;
     Property Codtipdesembdevol: TCmDbField;
     Property Codsubcontadretro: TCmDbField;
     Property Codsubcontacretro: TCmDbField;
     Property Codsubcontaabn: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codrecebcapabn: TCmDbField;
     Property Codportformaabn: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codcentrorespona: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocustodr: TCmDbField;
     Property Codcentrocustoda: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustocr: TCmDbField;
     Property Codcentrocustoca: TCmDbField;
     Property Codcentrocustoc: TCmDbField;
     Property Codccustodprovis: TCmDbField;
     Property Codccustodevpata: TCmDbField;
     Property Codccustodevolpat: TCmDbField;
     Property Codccustodevola: TCmDbField;
     Property Codccustodevol: TCmDbField;
     Property Codccustocprovis: TCmDbField;
     Property Codalterajurosabn: TCmDbField;
     Property Codalteradorcorr: TCmDbField;
     Property Codalteracorrabn: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefplanprev }

constructor TDbBenefplanprev.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFPLANPREV';

   fUnidnegocabn := CreateCmDbField('UNIDNEGOCABN',ftfloat,True,False,False,True);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True);
   fTpmodalidade := CreateCmDbField('TPMODALIDADE',ftString,True,False,False,True);
   fTipcodigoabn := CreateCmDbField('TIPCODIGOABN',ftString,True,False,False,True);
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,True,False,False,True);
   fRecpagretro := CreateCmDbField('RECPAGRETRO',ftString,True,False,False,True);
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,True,False,False,True);
   fRecpagabn := CreateCmDbField('RECPAGABN',ftString,True,False,False,True);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True);
   fPrazoprovisorio := CreateCmDbField('PRAZOPROVISORIO',ftfloat,True,False,False,True);
   fPrazoconcessao := CreateCmDbField('PRAZOCONCESSAO',ftfloat,True,False,False,True);
   fPlanoretro := CreateCmDbField('PLANORETRO',ftfloat,True,False,False,True);
   fPlanoabn := CreateCmDbField('PLANOABN',ftfloat,True,False,False,True);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True);
   fPlacontadretro := CreateCmDbField('PLACONTADRETRO',ftString,True,False,False,True);
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,True,False,False,True);
   fPlacontadevpata := CreateCmDbField('PLACONTADEVPATA',ftString,True,False,False,True);
   fPlacontadevolpat := CreateCmDbField('PLACONTADEVOLPAT',ftString,True,False,False,True);
   fPlacontadevola := CreateCmDbField('PLACONTADEVOLA',ftString,True,False,False,True);
   fPlacontadevol := CreateCmDbField('PLACONTADEVOL',ftString,True,False,False,True);
   fPlacontadabn := CreateCmDbField('PLACONTADABN',ftString,True,False,False,True);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False,False,True);
   fPlacontacretro := CreateCmDbField('PLACONTACRETRO',ftString,True,False,False,True);
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,True,False,False,True);
   fPlacontacabn := CreateCmDbField('PLACONTACABN',ftString,True,False,False,True);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False,False,True);
   fOrigemcmbeneficio := CreateCmDbField('ORIGEMCMBENEFICIO',ftfloat,True,False,False,True);
   fNumopcoes := CreateCmDbField('NUMOPCOES',ftfloat,True,False,False,True);
   fNomevalorbase3 := CreateCmDbField('NOMEVALORBASE3',ftString,True,False,False,True);
   fNomevalorbase2 := CreateCmDbField('NOMEVALORBASE2',ftString,True,False,False,True);
   fNomevalorbase1 := CreateCmDbField('NOMEVALORBASE1',ftString,True,False,False,True);
   fMesreajbenef := CreateCmDbField('MESREAJBENEF',ftString,True,False,False,True);
   fIndicereajbenef := CreateCmDbField('INDICEREAJBENEF',ftfloat,True,False,False,True);
   fIdtpreajbenef := CreateCmDbField('IDTPREAJBENEF',ftfloat,True,False,False,True);
   fIdrubricarevisao := CreateCmDbField('IDRUBRICAREVISAO',ftfloat,True,False,False,True);
   fIdrubricadif := CreateCmDbField('IDRUBRICADIF',ftfloat,True,False,False,True);
   fIdrubricacorrecao := CreateCmDbField('IDRUBRICACORRECAO',ftfloat,True,False,False,True);
   fIdrubricaatraso := CreateCmDbField('IDRUBRICAATRASO',ftfloat,True,False,False,True);
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,False,False,True);
   fIdrubdevolucao := CreateCmDbField('IDRUBDEVOLUCAO',ftfloat,True,False,False,True);
   fIdrubdescantecab := CreateCmDbField('IDRUBDESCANTECAB',ftfloat,True,False,False,True);
   fIdrubantecabono := CreateCmDbField('IDRUBANTECABONO',ftfloat,True,False,False,True);
   fIdrubabonofim := CreateCmDbField('IDRUBABONOFIM',ftfloat,True,False,False,True);
   fIdrubabono := CreateCmDbField('IDRUBABONO',ftfloat,True,False,False,True);
   fIdrgvalortotal := CreateCmDbField('IDRGVALORTOTAL',ftfloat,True,False,False,True);
   fIdrelatbeneficio := CreateCmDbField('IDRELATBENEFICIO',ftfloat,True,False,False,True);
   fIdregravlrbenefc := CreateCmDbField('IDREGRAVLRBENEFC',ftfloat,True,False,False,True);
   fIdregravalidaop3 := CreateCmDbField('IDREGRAVALIDAOP3',ftfloat,True,False,False,True);
   fIdregravalidaop2 := CreateCmDbField('IDREGRAVALIDAOP2',ftfloat,True,False,False,True);
   fIdregravalidaop1 := CreateCmDbField('IDREGRAVALIDAOP1',ftfloat,True,False,False,True);
   fIdregraultpagto := CreateCmDbField('IDREGRAULTPAGTO',ftfloat,True,False,False,True);
   fIdregrasrb := CreateCmDbField('IDREGRASRB',ftfloat,True,False,False,True);
   fIdregrasimulacont := CreateCmDbField('IDREGRASIMULACONT',ftfloat,True,False,False,True);
   fIdregrasimula := CreateCmDbField('IDREGRASIMULA',ftfloat,True,False,False,True);
   fIdregrareajbenef := CreateCmDbField('IDREGRAREAJBENEF',ftfloat,True,False,False,True);
   fIdregraprimpagto := CreateCmDbField('IDREGRAPRIMPAGTO',ftfloat,True,False,False,True);
   fIdregrapagamento := CreateCmDbField('IDREGRAPAGAMENTO',ftfloat,True,False,False,True);
   fIdregrapagaatraso := CreateCmDbField('IDREGRAPAGAATRASO',ftfloat,True,False,False,True);
   fIdregramanutencao := CreateCmDbField('IDREGRAMANUTENCAO',ftfloat,True,False,False,True);
   fIdregrainicio := CreateCmDbField('IDREGRAINICIO',ftfloat,True,False,False,True);
   fIdregrafim := CreateCmDbField('IDREGRAFIM',ftfloat,True,False,False,True);
   fIdregraelegibili := CreateCmDbField('IDREGRAELEGIBILI',ftfloat,True,False,False,True);
   fIdregradtdirpleno := CreateCmDbField('IDREGRADTDIRPLENO',ftfloat,True,False,False,True);
   fIdregradtdirini := CreateCmDbField('IDREGRADTDIRINI',ftfloat,True,False,False,True);
   fIdregracobradevol := CreateCmDbField('IDREGRACOBRADEVOL',ftfloat,True,False,False,True);
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,True,False,False,True);
   fIdregracalcop3 := CreateCmDbField('IDREGRACALCOP3',ftfloat,True,False,False,True);
   fIdregracalcop2 := CreateCmDbField('IDREGRACALCOP2',ftfloat,True,False,False,True);
   fIdregracalcop1 := CreateCmDbField('IDREGRACALCOP1',ftfloat,True,False,False,True);
   fIdregracalcinss := CreateCmDbField('IDREGRACALCINSS',ftfloat,True,False,False,True);
   fIdregracalcabono := CreateCmDbField('IDREGRACALCABONO',ftfloat,True,False,False,True);
   fIdregrabenefmin := CreateCmDbField('IDREGRABENEFMIN',ftfloat,True,False,False,True);
   fIdregrabeneficia := CreateCmDbField('IDREGRABENEFICIA',ftfloat,True,False,False,True);
   fIdproduto := CreateCmDbField('IDPRODUTO',ftfloat,True,False,False,True);
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,True,False,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdplanobenefref := CreateCmDbField('IDPLANOBENEFREF',ftfloat,True,False,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True);
   fIdempresaretro := CreateCmDbField('IDEMPRESARETRO',ftfloat,True,False,False,True);
   fIdempresapropabn := CreateCmDbField('IDEMPRESAPROPABN',ftfloat,True,False,False,True);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False,False,True);
   fIdempresaabn := CreateCmDbField('IDEMPRESAABN',ftfloat,True,False,False,True);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True);
   fIdbenefref := CreateCmDbField('IDBENEFREF',ftfloat,True,False,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
   fFlgusaevolfunc := CreateCmDbField('FLGUSAEVOLFUNC',ftfloat,True,False,False,True);
   fFlgreferencia := CreateCmDbField('FLGREFERENCIA',ftfloat,True,False,False,True);
   fFlgrecalculafim := CreateCmDbField('FLGRECALCULAFIM',ftfloat,True,False,False,True);
   fFlgquitapreviden := CreateCmDbField('FLGQUITAPREVIDEN',ftfloat,True,False,False,True);
   fFlgquitaempresti := CreateCmDbField('FLGQUITAEMPRESTI',ftfloat,True,False,False,True);
   fFlgquitaassisten := CreateCmDbField('FLGQUITAASSISTEN',ftfloat,True,False,False,True);
   fFlgpossuiabono := CreateCmDbField('FLGPOSSUIABONO',ftfloat,True,False,False,True);
   fFlgpagainteg := CreateCmDbField('FLGPAGAINTEG',ftfloat,True,False,False,True);
   fFlgpagainss := CreateCmDbField('FLGPAGAINSS',ftfloat,True,False,False,True);
   fFlgobrigaop3 := CreateCmDbField('FLGOBRIGAOP3',ftfloat,True,False,False,True);
   fFlgobrigaop2 := CreateCmDbField('FLGOBRIGAOP2',ftfloat,True,False,False,True);
   fFlgobrigaop1 := CreateCmDbField('FLGOBRIGAOP1',ftfloat,True,False,False,True);
   fFlgobriganproc := CreateCmDbField('FLGOBRIGANPROC',ftfloat,True,False,False,True);
   fFlgeditaop3 := CreateCmDbField('FLGEDITAOP3',ftfloat,True,False,False,True);
   fFlgeditaop2 := CreateCmDbField('FLGEDITAOP2',ftfloat,True,False,False,True);
   fFlgeditaop1 := CreateCmDbField('FLGEDITAOP1',ftfloat,True,False,False,True);
   fFlgdataindiceres := CreateCmDbField('FLGDATAINDICERES',ftfloat,True,False,False,True);
   fFlgcorrecaodevol := CreateCmDbField('FLGCORRECAODEVOL',ftfloat,True,False,False,True);
   fFlgcorrecaoatraso := CreateCmDbField('FLGCORRECAOATRASO',ftfloat,True,False,False,True);
   fFlgcalctodomes := CreateCmDbField('FLGCALCTODOMES',ftfloat,True,False,False,True);
   fFlgbenefopcional := CreateCmDbField('FLGBENEFOPCIONAL',ftfloat,True,False,False,True);
   fFlgbenefinf := CreateCmDbField('FLGBENEFINF',ftfloat,True,False,False,True);
   fFlgaceitaopcao := CreateCmDbField('FLGACEITAOPCAO',ftfloat,True,False,False,True);
   fFlgabonofinalben := CreateCmDbField('FLGABONOFINALBEN',ftfloat,True,False,False,True);
   fDataultreajuste := CreateCmDbField('DATAULTREAJUSTE',ftDateTime,True,False,False,True);
   fCodtiprecebdevol := CreateCmDbField('CODTIPRECEBDEVOL',ftString,True,False,False,True);
   fCodtiprecebcap := CreateCmDbField('CODTIPRECEBCAP',ftString,True,False,False,True);
   fCodtiprecdesabn := CreateCmDbField('CODTIPRECDESABN',ftString,True,False,False,True);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True);
   fCodtipdocabn := CreateCmDbField('CODTIPDOCABN',ftfloat,True,False,False,True);
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False,False,True);
   fCodtipdesembdevol := CreateCmDbField('CODTIPDESEMBDEVOL',ftString,True,False,False,True);
   fCodsubcontadretro := CreateCmDbField('CODSUBCONTADRETRO',ftfloat,True,False,False,True);
   fCodsubcontacretro := CreateCmDbField('CODSUBCONTACRETRO',ftfloat,True,False,False,True);
   fCodsubcontaabn := CreateCmDbField('CODSUBCONTAABN',ftfloat,True,False,False,True);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False,False,True);
   fCodrecebcapabn := CreateCmDbField('CODRECEBCAPABN',ftString,True,False,False,True);
   fCodportformaabn := CreateCmDbField('CODPORTFORMAABN',ftfloat,True,False,False,True);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False,False,True);
   fCodcentrorespona := CreateCmDbField('CODCENTRORESPONA',ftString,True,False,False,True);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True);
   fCodcentrocustodr := CreateCmDbField('CODCENTROCUSTODR',ftString,True,False,False,True);
   fCodcentrocustoda := CreateCmDbField('CODCENTROCUSTODA',ftString,True,False,False,True);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False,False,True);
   fCodcentrocustocr := CreateCmDbField('CODCENTROCUSTOCR',ftString,True,False,False,True);
   fCodcentrocustoca := CreateCmDbField('CODCENTROCUSTOCA',ftString,True,False,False,True);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False,False,True);
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,True,False,False,True);
   fCodccustodevpata := CreateCmDbField('CODCCUSTODEVPATA',ftString,True,False,False,True);
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,True,False,False,True);
   fCodccustodevola := CreateCmDbField('CODCCUSTODEVOLA',ftString,True,False,False,True);
   fCodccustodevol := CreateCmDbField('CODCCUSTODEVOL',ftString,True,False,False,True);
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,True,False,False,True);
   fCodalterajurosabn := CreateCmDbField('CODALTERAJUROSABN',ftfloat,True,False,False,True);
   fCodalteradorcorr := CreateCmDbField('CODALTERADORCORR',ftfloat,True,False,False,True);
   fCodalteracorrabn := CreateCmDbField('CODALTERACORRABN',ftfloat,True,False,False,True);
end;

function TDbBenefplanprev.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbBenefplanprev.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



