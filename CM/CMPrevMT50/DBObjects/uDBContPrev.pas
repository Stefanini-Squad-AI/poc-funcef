{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/04/2007                             }
{                                                       }
{*******************************************************}

unit uDBContPrev;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBContPrev = class(TCmDbObject)

  private
    FIdrubatracjud: TCmDbField;
    FRecpagadt: TCmDbField;
    FCodccustocprovis: TCmDbField;
    FIdrubferiasdevol: TCmDbField;
    FIdempresaprop: TCmDbField;
    FIdplanprevcontab: TCmDbField;
    FIdrubricaatraso: TCmDbField;
    FCodsubcontacretro: TCmDbField;
    FRecpagretro: TCmDbField;
    FPlacontaoutromes: TCmDbField;
    FCodtiprecdesadt: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdrub13devacjud: TCmDbField;
    FNomevalorbase3: TCmDbField;
    FPlacontacprovis: TCmDbField;
    FIdempresaalt: TCmDbField;
    FPlacontadprovis13: TCmDbField;
    FIdregravalidaop1: TCmDbField;
    FPlacontac: TCmDbField;
    FCodtiprecebdev13: TCmDbField;
    FPlano: TCmDbField;
    FPlactaacjud13: TCmDbField;
    FPlacontadevol13: TCmDbField;
    FPlactaoutromes13: TCmDbField;
    FPlactdprovadt13: TCmDbField;
    FPlanoadt: TCmDbField;
    FCodportforma13: TCmDbField;
    FIdrubdevadtacjud: TCmDbField;
    FNomevalorbase1: TCmDbField;
    FIdrub13acjud: TCmDbField;
    FIdregravalidaop3: TCmDbField;
    FPlacontacprovadt: TCmDbField;
    FCodccustodprovad: TCmDbField;
    FIdrubferiasnorm: TCmDbField;
    FCritvalorbase3: TCmDbField;
    FPlacontacretro: TCmDbField;
    FValorbasetaxa: TCmDbField;
    FCodtiprecadt13: TCmDbField;
    FCodtipdoc: TCmDbField;
    FPlactdevolpat13: TCmDbField;
    FCodtipdesemb13: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FCritvalorbase2: TCmDbField;
    FRecpagdesembprov: TCmDbField;
    FIdregraprimpgto13: TCmDbField;
    FTipcodigo: TCmDbField;
    FIdregraultpagto: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FCodccustdprovis13: TCmDbField;
    FIdempresadesemb: TCmDbField;
    FUnidnegoc13: TCmDbField;
    FFlgcobradecterc: TCmDbField;
    FCodsubconta: TCmDbField;
    FPlacontadbanco: TCmDbField;
    FPlacontadretro: TCmDbField;
    FPlacontadbanco13: TCmDbField;
    FCodtipdesembcar: TCmDbField;
    FCoddesembprov13: TCmDbField;
    FPerccalculo: TCmDbField;
    FPlacontacadt13: TCmDbField;
    FCritsalario: TCmDbField;
    FPlacontadevol: TCmDbField;
    FRecpag: TCmDbField;
    FFlgobrigaop2: TCmDbField;
    FIdregracobranca: TCmDbField;
    FFlgtotal: TCmDbField;
    FFlgcarencia: TCmDbField;
    FIdregraprimpagto: TCmDbField;
    FFlginterno: TCmDbField;
    FPlactcprovadt13: TCmDbField;
    FFlgobrigaop3: TCmDbField;
    FIdrubdadacjud: TCmDbField;
    FPlacontad: TCmDbField;
    FFlgpagador: TCmDbField;
    FRecpagdesemb: TCmDbField;
    FCodtiprecebdev: TCmDbField;
    FIdrubadiant: TCmDbField;
    FNomevalorbase2: TCmDbField;
    FIdregracalculo: TCmDbField;
    FCodtipdesembprov: TCmDbField;
    FRecpagdevol: TCmDbField;
    FIdrubacjud: TCmDbField;
    FCodtipdesembdevol: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdrubricadevoluc: TCmDbField;
    FCoddesembdev13: TCmDbField;
    FFlgcontingencia: TCmDbField;
    FPlacontadprovadt: TCmDbField;
    FRecpag13: TCmDbField;
    FCodcentrocustodr: TCmDbField;
    FCodtipdoc13: TCmDbField;
    FFlgobrigaop1: TCmDbField;
    FPlacontadevolpat: TCmDbField;
    FPlanoretro: TCmDbField;
    FCodcentrocustod13: TCmDbField;
    FPlacontad13: TCmDbField;
    FVlraceitadiverg: TCmDbField;
    FCodaltacrescimo: TCmDbField;
    FCodsubconta13: TCmDbField;
    FCodcentrocustocr: TCmDbField;
    FIdrubdevoladiant: TCmDbField;
    FCodccustocprovad: TCmDbField;
    FIdregraultpgto13: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FPlacontac13: TCmDbField;
    FCodccustodprovis: TCmDbField;
    FFlgcobra13dtfim: TCmDbField;
    FPlanoprovis: TCmDbField;
    FPlacontacprovis13: TCmDbField;
    FFlgdescfolha: TCmDbField;
    FIdrubdecterc: TCmDbField;
    FPlano13: TCmDbField;
    FCodsubcontadretro: TCmDbField;
    FIdempresaprop13: TCmDbField;
    FCodccustodevolpat: TCmDbField;
    FFlgnaoexigerec: TCmDbField;
    FCodcentrocustoc13: TCmDbField;
    FCodccustcprovis13: TCmDbField;
    FCodccustodevol: TCmDbField;
    FIdrub13dvadtacjud: TCmDbField;
    FTipcodigo13: TCmDbField;
    FOrdemcalculo: TCmDbField;
    FIdempresa13: TCmDbField;
    FIdregracalcop3: TCmDbField;
    FFlgdescfolhault: TCmDbField;
    FIdregravlrreserva: TCmDbField;
    FIdrubdectercdevol: TCmDbField;
    FIdempresaretro: TCmDbField;
    FIdregracalcop1: TCmDbField;
    FIdcontribpai3: TCmDbField;
    FFlgacertacontrib13: TCmDbField;
    FCodportforma: TCmDbField;
    FFlgaceitaopcao: TCmDbField;
    FIdrub13atracjud: TCmDbField;
    FIdcontribpai: TCmDbField;
    FIdrubadiant13: TCmDbField;
    FIdrubrica: TCmDbField;
    FIdrubdevacjud: TCmDbField;
    FIdregravalidaop2: TCmDbField;
    FIdrubdevadiant13: TCmDbField;
    FIdcontribpai2: TCmDbField;
    FIdplanoprev: TCmDbField;
    FFlgeditaop1: TCmDbField;
    FNumopcoes: TCmDbField;
    FIdrubdectercatra: TCmDbField;
    FIdempresa: TCmDbField;
    FIdregracalcop2: TCmDbField;
    FCodcentrorespon13: TCmDbField;
    FIdregracalculo13: TCmDbField;
    FIdrub13descacjud: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdplanopai: TCmDbField;
    FPlacontadprovis: TCmDbField;
    FFlgparcelamento: TCmDbField;
    FFlgeditaop2: TCmDbField;
    FCritvalorbase1: TCmDbField;
    FFlgeditaop3: TCmDbField;
    FCodtiprecdes13: TCmDbField;
    FIdrubferiasatraso: TCmDbField;
    FPlactaacjud: TCmDbField;
    procedure SetCodaltacrescimo(const Value: TCmDbField);
    procedure SetCodccustcprovis13(const Value: TCmDbField);
    procedure SetCodccustdprovis13(const Value: TCmDbField);
    procedure SetCodccustocprovad(const Value: TCmDbField);
    procedure SetCodccustocprovis(const Value: TCmDbField);
    procedure SetCodccustodevol(const Value: TCmDbField);
    procedure SetCodccustodevolpat(const Value: TCmDbField);
    procedure SetCodccustodprovad(const Value: TCmDbField);
    procedure SetCodccustodprovis(const Value: TCmDbField);
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustoc13(const Value: TCmDbField);
    procedure SetCodcentrocustocr(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrocustod13(const Value: TCmDbField);
    procedure SetCodcentrocustodr(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodcentrorespon13(const Value: TCmDbField);
    procedure SetCoddesembdev13(const Value: TCmDbField);
    procedure SetCoddesembprov13(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodportforma13(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodsubconta13(const Value: TCmDbField);
    procedure SetCodsubcontacretro(const Value: TCmDbField);
    procedure SetCodsubcontadretro(const Value: TCmDbField);
    procedure SetCodtipdesemb13(const Value: TCmDbField);
    procedure SetCodtipdesembcar(const Value: TCmDbField);
    procedure SetCodtipdesembdevol(const Value: TCmDbField);
    procedure SetCodtipdesembprov(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetCodtipdoc13(const Value: TCmDbField);
    procedure SetCodtiprecadt13(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetCodtiprecdes13(const Value: TCmDbField);
    procedure SetCodtiprecdesadt(const Value: TCmDbField);
    procedure SetCodtiprecebdev(const Value: TCmDbField);
    procedure SetCodtiprecebdev13(const Value: TCmDbField);
    procedure SetCritsalario(const Value: TCmDbField);
    procedure SetCritvalorbase1(const Value: TCmDbField);
    procedure SetCritvalorbase2(const Value: TCmDbField);
    procedure SetCritvalorbase3(const Value: TCmDbField);
    procedure SetFlgaceitaopcao(const Value: TCmDbField);
    procedure SetFlgacertacontrib13(const Value: TCmDbField);
    procedure SetFlgcarencia(const Value: TCmDbField);
    procedure SetFlgcobra13dtfim(const Value: TCmDbField);
    procedure SetFlgcobradecterc(const Value: TCmDbField);
    procedure SetFlgcontingencia(const Value: TCmDbField);
    procedure SetFlgdescfolha(const Value: TCmDbField);
    procedure SetFlgdescfolhault(const Value: TCmDbField);
    procedure SetFlgeditaop1(const Value: TCmDbField);
    procedure SetFlgeditaop2(const Value: TCmDbField);
    procedure SetFlgeditaop3(const Value: TCmDbField);
    procedure SetFlginterno(const Value: TCmDbField);
    procedure SetFlgnaoexigerec(const Value: TCmDbField);
    procedure SetFlgobrigaop1(const Value: TCmDbField);
    procedure SetFlgobrigaop2(const Value: TCmDbField);
    procedure SetFlgobrigaop3(const Value: TCmDbField);
    procedure SetFlgpagador(const Value: TCmDbField);
    procedure SetFlgparcelamento(const Value: TCmDbField);
    procedure SetFlgtotal(const Value: TCmDbField);
    procedure SetIdcontribpai(const Value: TCmDbField);
    procedure SetIdcontribpai2(const Value: TCmDbField);
    procedure SetIdcontribpai3(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdempresa13(const Value: TCmDbField);
    procedure SetIdempresaalt(const Value: TCmDbField);
    procedure SetIdempresadesemb(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdempresaprop13(const Value: TCmDbField);
    procedure SetIdempresaretro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanopai(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdplanprevcontab(const Value: TCmDbField);
    procedure SetIdregracalcop1(const Value: TCmDbField);
    procedure SetIdregracalcop2(const Value: TCmDbField);
    procedure SetIdregracalcop3(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetIdregracalculo13(const Value: TCmDbField);
    procedure SetIdregracobranca(const Value: TCmDbField);
    procedure SetIdregraprimpagto(const Value: TCmDbField);
    procedure SetIdregraprimpgto13(const Value: TCmDbField);
    procedure SetIdregraultpagto(const Value: TCmDbField);
    procedure SetIdregraultpgto13(const Value: TCmDbField);
    procedure SetIdregravalidaop1(const Value: TCmDbField);
    procedure SetIdregravalidaop2(const Value: TCmDbField);
    procedure SetIdregravalidaop3(const Value: TCmDbField);
    procedure SetIdregravlrreserva(const Value: TCmDbField);
    procedure SetIdrub13acjud(const Value: TCmDbField);
    procedure SetIdrub13atracjud(const Value: TCmDbField);
    procedure SetIdrub13descacjud(const Value: TCmDbField);
    procedure SetIdrub13devacjud(const Value: TCmDbField);
    procedure SetIdrub13dvadtacjud(const Value: TCmDbField);
    procedure SetIdrubacjud(const Value: TCmDbField);
    procedure SetIdrubadiant(const Value: TCmDbField);
    procedure SetIdrubadiant13(const Value: TCmDbField);
    procedure SetIdrubatracjud(const Value: TCmDbField);
    procedure SetIdrubdadacjud(const Value: TCmDbField);
    procedure SetIdrubdecterc(const Value: TCmDbField);
    procedure SetIdrubdectercatra(const Value: TCmDbField);
    procedure SetIdrubdectercdevol(const Value: TCmDbField);
    procedure SetIdrubdevacjud(const Value: TCmDbField);
    procedure SetIdrubdevadiant13(const Value: TCmDbField);
    procedure SetIdrubdevadtacjud(const Value: TCmDbField);
    procedure SetIdrubdevoladiant(const Value: TCmDbField);
    procedure SetIdrubferiasatraso(const Value: TCmDbField);
    procedure SetIdrubferiasdevol(const Value: TCmDbField);
    procedure SetIdrubferiasnorm(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);
    procedure SetIdrubricaatraso(const Value: TCmDbField);
    procedure SetIdrubricadevoluc(const Value: TCmDbField);
    procedure SetNomevalorbase1(const Value: TCmDbField);
    procedure SetNomevalorbase2(const Value: TCmDbField);
    procedure SetNomevalorbase3(const Value: TCmDbField);
    procedure SetNumopcoes(const Value: TCmDbField);
    procedure SetOrdemcalculo(const Value: TCmDbField);
    procedure SetPerccalculo(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontac13(const Value: TCmDbField);
    procedure SetPlacontacadt13(const Value: TCmDbField);
    procedure SetPlacontacprovadt(const Value: TCmDbField);
    procedure SetPlacontacprovis(const Value: TCmDbField);
    procedure SetPlacontacprovis13(const Value: TCmDbField);
    procedure SetPlacontacretro(const Value: TCmDbField);
    procedure SetPlacontad(const Value: TCmDbField);
    procedure SetPlacontad13(const Value: TCmDbField);
    procedure SetPlacontadbanco(const Value: TCmDbField);
    procedure SetPlacontadbanco13(const Value: TCmDbField);
    procedure SetPlacontadevol(const Value: TCmDbField);
    procedure SetPlacontadevol13(const Value: TCmDbField);
    procedure SetPlacontadevolpat(const Value: TCmDbField);
    procedure SetPlacontadprovadt(const Value: TCmDbField);
    procedure SetPlacontadprovis(const Value: TCmDbField);
    procedure SetPlacontadprovis13(const Value: TCmDbField);
    procedure SetPlacontadretro(const Value: TCmDbField);
    procedure SetPlacontaoutromes(const Value: TCmDbField);
    procedure SetPlactaacjud(const Value: TCmDbField);
    procedure SetPlactaacjud13(const Value: TCmDbField);
    procedure SetPlactaoutromes13(const Value: TCmDbField);
    procedure SetPlactcprovadt13(const Value: TCmDbField);
    procedure SetPlactdevolpat13(const Value: TCmDbField);
    procedure SetPlactdprovadt13(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlano13(const Value: TCmDbField);
    procedure SetPlanoadt(const Value: TCmDbField);
    procedure SetPlanoprovis(const Value: TCmDbField);
    procedure SetPlanoretro(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetRecpag13(const Value: TCmDbField);
    procedure SetRecpagadt(const Value: TCmDbField);
    procedure SetRecpagdesemb(const Value: TCmDbField);
    procedure SetRecpagdesembprov(const Value: TCmDbField);
    procedure SetRecpagdevol(const Value: TCmDbField);
    procedure SetRecpagretro(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetTipcodigo13(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetUnidnegoc13(const Value: TCmDbField);
    procedure SetValorbasetaxa(const Value: TCmDbField);
    procedure SetVlraceitadiverg(const Value: TCmDbField);

  public

     Property Vlraceitadiverg: TCmDbField read FVlraceitadiverg write SetVlraceitadiverg;
     Property Valorbasetaxa: TCmDbField read FValorbasetaxa write SetValorbasetaxa;
     Property Unidnegoc13: TCmDbField read FUnidnegoc13 write SetUnidnegoc13;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Tipcodigo13: TCmDbField read FTipcodigo13 write SetTipcodigo13;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Recpag13: TCmDbField read FRecpag13 write SetRecpag13;
     Property Recpagretro: TCmDbField read FRecpagretro write SetRecpagretro;
     Property Recpagdevol: TCmDbField read FRecpagdevol write SetRecpagdevol;
     Property Recpagdesembprov: TCmDbField read FRecpagdesembprov write SetRecpagdesembprov;
     Property Recpagdesemb: TCmDbField read FRecpagdesemb write SetRecpagdesemb;
     Property Recpagadt: TCmDbField read FRecpagadt write SetRecpagadt;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano13: TCmDbField read FPlano13 write SetPlano13;
     Property Planoretro: TCmDbField read FPlanoretro write SetPlanoretro;
     Property Planoprovis: TCmDbField read FPlanoprovis write SetPlanoprovis;
     Property Planoadt: TCmDbField read FPlanoadt write SetPlanoadt;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Plactdprovadt13: TCmDbField read FPlactdprovadt13 write SetPlactdprovadt13;
     Property Plactdevolpat13: TCmDbField read FPlactdevolpat13 write SetPlactdevolpat13;
     Property Plactcprovadt13: TCmDbField read FPlactcprovadt13 write SetPlactcprovadt13;
     Property Plactaoutromes13: TCmDbField read FPlactaoutromes13 write SetPlactaoutromes13;
     Property Plactaacjud13: TCmDbField read FPlactaacjud13 write SetPlactaacjud13;
     Property Plactaacjud: TCmDbField read FPlactaacjud write SetPlactaacjud;
     Property Placontaoutromes: TCmDbField read FPlacontaoutromes write SetPlacontaoutromes;
     Property Placontad13: TCmDbField read FPlacontad13 write SetPlacontad13;
     Property Placontadretro: TCmDbField read FPlacontadretro write SetPlacontadretro;
     Property Placontadprovis13: TCmDbField read FPlacontadprovis13 write SetPlacontadprovis13;
     Property Placontadprovis: TCmDbField read FPlacontadprovis write SetPlacontadprovis;
     Property Placontadprovadt: TCmDbField read FPlacontadprovadt write SetPlacontadprovadt;
     Property Placontadevol13: TCmDbField read FPlacontadevol13 write SetPlacontadevol13;
     Property Placontadevolpat: TCmDbField read FPlacontadevolpat write SetPlacontadevolpat;
     Property Placontadevol: TCmDbField read FPlacontadevol write SetPlacontadevol;
     Property Placontadbanco13: TCmDbField read FPlacontadbanco13 write SetPlacontadbanco13;
     Property Placontadbanco: TCmDbField read FPlacontadbanco write SetPlacontadbanco;
     Property Placontad: TCmDbField read FPlacontad write SetPlacontad;
     Property Placontac13: TCmDbField read FPlacontac13 write SetPlacontac13;
     Property Placontacretro: TCmDbField read FPlacontacretro write SetPlacontacretro;
     Property Placontacprovis13: TCmDbField read FPlacontacprovis13 write SetPlacontacprovis13;
     Property Placontacprovis: TCmDbField read FPlacontacprovis write SetPlacontacprovis;
     Property Placontacprovadt: TCmDbField read FPlacontacprovadt write SetPlacontacprovadt;
     Property Placontacadt13: TCmDbField read FPlacontacadt13 write SetPlacontacadt13;
     Property Placontac: TCmDbField read FPlacontac write SetPlacontac;
     Property Perccalculo: TCmDbField read FPerccalculo write SetPerccalculo;
     Property Ordemcalculo: TCmDbField read FOrdemcalculo write SetOrdemcalculo;
     Property Numopcoes: TCmDbField read FNumopcoes write SetNumopcoes;
     Property Nomevalorbase3: TCmDbField read FNomevalorbase3 write SetNomevalorbase3;
     Property Nomevalorbase2: TCmDbField read FNomevalorbase2 write SetNomevalorbase2;
     Property Nomevalorbase1: TCmDbField read FNomevalorbase1 write SetNomevalorbase1;
     Property Idrub13dvadtacjud: TCmDbField read FIdrub13dvadtacjud write SetIdrub13dvadtacjud;
     Property Idrub13devacjud: TCmDbField read FIdrub13devacjud write SetIdrub13devacjud;
     Property Idrub13descacjud: TCmDbField read FIdrub13descacjud write SetIdrub13descacjud;
     Property Idrub13atracjud: TCmDbField read FIdrub13atracjud write SetIdrub13atracjud;
     Property Idrub13acjud: TCmDbField read FIdrub13acjud write SetIdrub13acjud;
     Property Idrubricadevoluc: TCmDbField read FIdrubricadevoluc write SetIdrubricadevoluc;
     Property Idrubricaatraso: TCmDbField read FIdrubricaatraso write SetIdrubricaatraso;
     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idrubferiasnorm: TCmDbField read FIdrubferiasnorm write SetIdrubferiasnorm;
     Property Idrubferiasdevol: TCmDbField read FIdrubferiasdevol write SetIdrubferiasdevol;
     Property Idrubferiasatraso: TCmDbField read FIdrubferiasatraso write SetIdrubferiasatraso;
     Property Idrubdevoladiant: TCmDbField read FIdrubdevoladiant write SetIdrubdevoladiant;
     Property Idrubdevadtacjud: TCmDbField read FIdrubdevadtacjud write SetIdrubdevadtacjud;
     Property Idrubdevadiant13: TCmDbField read FIdrubdevadiant13 write SetIdrubdevadiant13;
     Property Idrubdevacjud: TCmDbField read FIdrubdevacjud write SetIdrubdevacjud;
     Property Idrubdectercdevol: TCmDbField read FIdrubdectercdevol write SetIdrubdectercdevol;
     Property Idrubdectercatra: TCmDbField read FIdrubdectercatra write SetIdrubdectercatra;
     Property Idrubdecterc: TCmDbField read FIdrubdecterc write SetIdrubdecterc;
     Property Idrubdadacjud: TCmDbField read FIdrubdadacjud write SetIdrubdadacjud;
     Property Idrubatracjud: TCmDbField read FIdrubatracjud write SetIdrubatracjud;
     Property Idrubadiant13: TCmDbField read FIdrubadiant13 write SetIdrubadiant13;
     Property Idrubadiant: TCmDbField read FIdrubadiant write SetIdrubadiant;
     Property Idrubacjud: TCmDbField read FIdrubacjud write SetIdrubacjud;
     Property Idregravlrreserva: TCmDbField read FIdregravlrreserva write SetIdregravlrreserva;
     Property Idregravalidaop3: TCmDbField read FIdregravalidaop3 write SetIdregravalidaop3;
     Property Idregravalidaop2: TCmDbField read FIdregravalidaop2 write SetIdregravalidaop2;
     Property Idregravalidaop1: TCmDbField read FIdregravalidaop1 write SetIdregravalidaop1;
     Property Idregraultpgto13: TCmDbField read FIdregraultpgto13 write SetIdregraultpgto13;
     Property Idregraultpagto: TCmDbField read FIdregraultpagto write SetIdregraultpagto;
     Property Idregraprimpgto13: TCmDbField read FIdregraprimpgto13 write SetIdregraprimpgto13;
     Property Idregraprimpagto: TCmDbField read FIdregraprimpagto write SetIdregraprimpagto;
     Property Idregracobranca: TCmDbField read FIdregracobranca write SetIdregracobranca;
     Property Idregracalculo13: TCmDbField read FIdregracalculo13 write SetIdregracalculo13;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Idregracalcop3: TCmDbField read FIdregracalcop3 write SetIdregracalcop3;
     Property Idregracalcop2: TCmDbField read FIdregracalcop2 write SetIdregracalcop2;
     Property Idregracalcop1: TCmDbField read FIdregracalcop1 write SetIdregracalcop1;
     Property Idplanprevcontab: TCmDbField read FIdplanprevcontab write SetIdplanprevcontab;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanopai: TCmDbField read FIdplanopai write SetIdplanopai;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa13: TCmDbField read FIdempresa13 write SetIdempresa13;
     Property Idempresaretro: TCmDbField read FIdempresaretro write SetIdempresaretro;
     Property Idempresaprop13: TCmDbField read FIdempresaprop13 write SetIdempresaprop13;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Idempresadesemb: TCmDbField read FIdempresadesemb write SetIdempresadesemb;
     Property Idempresaalt: TCmDbField read FIdempresaalt write SetIdempresaalt;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Idcontribpai3: TCmDbField read FIdcontribpai3 write SetIdcontribpai3;
     Property Idcontribpai2: TCmDbField read FIdcontribpai2 write SetIdcontribpai2;
     Property Idcontribpai: TCmDbField read FIdcontribpai write SetIdcontribpai;
     Property Flgtotal: TCmDbField read FFlgtotal write SetFlgtotal;
     Property Flgparcelamento: TCmDbField read FFlgparcelamento write SetFlgparcelamento;
     Property Flgpagador: TCmDbField read FFlgpagador write SetFlgpagador;
     Property Flgobrigaop3: TCmDbField read FFlgobrigaop3 write SetFlgobrigaop3;
     Property Flgobrigaop2: TCmDbField read FFlgobrigaop2 write SetFlgobrigaop2;
     Property Flgobrigaop1: TCmDbField read FFlgobrigaop1 write SetFlgobrigaop1;
     Property Flgnaoexigerec: TCmDbField read FFlgnaoexigerec write SetFlgnaoexigerec;
     Property Flginterno: TCmDbField read FFlginterno write SetFlginterno;
     Property Flgeditaop3: TCmDbField read FFlgeditaop3 write SetFlgeditaop3;
     Property Flgeditaop2: TCmDbField read FFlgeditaop2 write SetFlgeditaop2;
     Property Flgeditaop1: TCmDbField read FFlgeditaop1 write SetFlgeditaop1;
     Property Flgdescfolhault: TCmDbField read FFlgdescfolhault write SetFlgdescfolhault;
     Property Flgdescfolha: TCmDbField read FFlgdescfolha write SetFlgdescfolha;
     Property Flgcontingencia: TCmDbField read FFlgcontingencia write SetFlgcontingencia;
     Property Flgcobra13dtfim: TCmDbField read FFlgcobra13dtfim write SetFlgcobra13dtfim;
     Property Flgcobradecterc: TCmDbField read FFlgcobradecterc write SetFlgcobradecterc;
     Property Flgcarencia: TCmDbField read FFlgcarencia write SetFlgcarencia;
     Property Flgacertacontrib13: TCmDbField read FFlgacertacontrib13 write SetFlgacertacontrib13;
     Property Flgaceitaopcao: TCmDbField read FFlgaceitaopcao write SetFlgaceitaopcao;
     Property Critvalorbase3: TCmDbField read FCritvalorbase3 write SetCritvalorbase3;
     Property Critvalorbase2: TCmDbField read FCritvalorbase2 write SetCritvalorbase2;
     Property Critvalorbase1: TCmDbField read FCritvalorbase1 write SetCritvalorbase1;
     Property Critsalario: TCmDbField read FCritsalario write SetCritsalario;
     Property Codtiprecebdev13: TCmDbField read FCodtiprecebdev13 write SetCodtiprecebdev13;
     Property Codtiprecebdev: TCmDbField read FCodtiprecebdev write SetCodtiprecebdev;
     Property Codtiprecdes13: TCmDbField read FCodtiprecdes13 write SetCodtiprecdes13;
     Property Codtiprecdesadt: TCmDbField read FCodtiprecdesadt write SetCodtiprecdesadt;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codtiprecadt13: TCmDbField read FCodtiprecadt13 write SetCodtiprecadt13;
     Property Codtipdoc13: TCmDbField read FCodtipdoc13 write SetCodtipdoc13;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codtipdesemb13: TCmDbField read FCodtipdesemb13 write SetCodtipdesemb13;
     Property Codtipdesembprov: TCmDbField read FCodtipdesembprov write SetCodtipdesembprov;
     Property Codtipdesembdevol: TCmDbField read FCodtipdesembdevol write SetCodtipdesembdevol;
     Property Codtipdesembcar: TCmDbField read FCodtipdesembcar write SetCodtipdesembcar;
     Property Codsubconta13: TCmDbField read FCodsubconta13 write SetCodsubconta13;
     Property Codsubcontadretro: TCmDbField read FCodsubcontadretro write SetCodsubcontadretro;
     Property Codsubcontacretro: TCmDbField read FCodsubcontacretro write SetCodsubcontacretro;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codportforma13: TCmDbField read FCodportforma13 write SetCodportforma13;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Coddesembprov13: TCmDbField read FCoddesembprov13 write SetCoddesembprov13;
     Property Coddesembdev13: TCmDbField read FCoddesembdev13 write SetCoddesembdev13;
     Property Codcentrorespon13: TCmDbField read FCodcentrorespon13 write SetCodcentrorespon13;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocustod13: TCmDbField read FCodcentrocustod13 write SetCodcentrocustod13;
     Property Codcentrocustodr: TCmDbField read FCodcentrocustodr write SetCodcentrocustodr;
     Property Codcentrocustod: TCmDbField read FCodcentrocustod write SetCodcentrocustod;
     Property Codcentrocustoc13: TCmDbField read FCodcentrocustoc13 write SetCodcentrocustoc13;
     Property Codcentrocustocr: TCmDbField read FCodcentrocustocr write SetCodcentrocustocr;
     Property Codcentrocustoc: TCmDbField read FCodcentrocustoc write SetCodcentrocustoc;
     Property Codccustodprovis: TCmDbField read FCodccustodprovis write SetCodccustodprovis;
     Property Codccustodprovad: TCmDbField read FCodccustodprovad write SetCodccustodprovad;
     Property Codccustodevolpat: TCmDbField read FCodccustodevolpat write SetCodccustodevolpat;
     Property Codccustodevol: TCmDbField read FCodccustodevol write SetCodccustodevol;
     Property Codccustocprovis: TCmDbField read FCodccustocprovis write SetCodccustocprovis;
     Property Codccustocprovad: TCmDbField read FCodccustocprovad write SetCodccustocprovad;
     Property Codccustdprovis13: TCmDbField read FCodccustdprovis13 write SetCodccustdprovis13;
     Property Codccustcprovis13: TCmDbField read FCodccustcprovis13 write SetCodccustcprovis13;
     Property Codaltacrescimo: TCmDbField read FCodaltacrescimo write SetCodaltacrescimo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBContPrev }

constructor TDBContPrev.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTPREV';

   fVlraceitadiverg := CreateCmDbField('VLRACEITADIVERG',ftfloat,False,False,False,True,'');
   fValorbasetaxa := CreateCmDbField('VALORBASETAXA',ftfloat,False,False,False,True,'');
   fUnidnegoc13 := CreateCmDbField('UNIDNEGOC13',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTipcodigo13 := CreateCmDbField('TIPCODIGO13',ftString,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fRecpag13 := CreateCmDbField('RECPAG13',ftString,False,False,False,True,'');
   fRecpagretro := CreateCmDbField('RECPAGRETRO',ftString,False,False,False,True,'');
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,False,False,False,True,'');
   fRecpagdesembprov := CreateCmDbField('RECPAGDESEMBPROV',ftString,False,False,False,True,'');
   fRecpagdesemb := CreateCmDbField('RECPAGDESEMB',ftString,False,False,False,True,'');
   fRecpagadt := CreateCmDbField('RECPAGADT',ftString,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlano13 := CreateCmDbField('PLANO13',ftfloat,False,False,False,True,'');
   fPlanoretro := CreateCmDbField('PLANORETRO',ftfloat,False,False,False,True,'');
   fPlanoprovis := CreateCmDbField('PLANOPROVIS',ftfloat,False,False,False,True,'');
   fPlanoadt := CreateCmDbField('PLANOADT',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlactdprovadt13 := CreateCmDbField('PLACTDPROVADT13',ftString,False,False,False,True,'');
   fPlactdevolpat13 := CreateCmDbField('PLACTDEVOLPAT13',ftString,False,False,False,True,'');
   fPlactcprovadt13 := CreateCmDbField('PLACTCPROVADT13',ftString,False,False,False,True,'');
   fPlactaoutromes13 := CreateCmDbField('PLACTAOUTROMES13',ftString,False,False,False,True,'');
   fPlactaacjud13 := CreateCmDbField('PLACTAACJUD13',ftString,False,False,False,True,'');
   fPlactaacjud := CreateCmDbField('PLACTAACJUD',ftString,False,False,False,True,'');
   fPlacontaoutromes := CreateCmDbField('PLACONTAOUTROMES',ftString,False,False,False,True,'');
   fPlacontad13 := CreateCmDbField('PLACONTAD13',ftString,False,False,False,True,'');
   fPlacontadretro := CreateCmDbField('PLACONTADRETRO',ftString,False,False,False,True,'');
   fPlacontadprovis13 := CreateCmDbField('PLACONTADPROVIS13',ftString,False,False,False,True,'');
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,False,False,False,True,'');
   fPlacontadprovadt := CreateCmDbField('PLACONTADPROVADT',ftString,False,False,False,True,'');
   fPlacontadevol13 := CreateCmDbField('PLACONTADEVOL13',ftString,False,False,False,True,'');
   fPlacontadevolpat := CreateCmDbField('PLACONTADEVOLPAT',ftString,False,False,False,True,'');
   fPlacontadevol := CreateCmDbField('PLACONTADEVOL',ftString,False,False,False,True,'');
   fPlacontadbanco13 := CreateCmDbField('PLACONTADBANCO13',ftString,False,False,False,True,'');
   fPlacontadbanco := CreateCmDbField('PLACONTADBANCO',ftString,False,False,False,True,'');
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,False,False,False,True,'');
   fPlacontac13 := CreateCmDbField('PLACONTAC13',ftString,False,False,False,True,'');
   fPlacontacretro := CreateCmDbField('PLACONTACRETRO',ftString,False,False,False,True,'');
   fPlacontacprovis13 := CreateCmDbField('PLACONTACPROVIS13',ftString,False,False,False,True,'');
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,False,False,False,True,'');
   fPlacontacprovadt := CreateCmDbField('PLACONTACPROVADT',ftString,False,False,False,True,'');
   fPlacontacadt13 := CreateCmDbField('PLACONTACADT13',ftString,False,False,False,True,'');
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
   fPerccalculo := CreateCmDbField('PERCCALCULO',ftfloat,False,False,False,True,'');
   fOrdemcalculo := CreateCmDbField('ORDEMCALCULO',ftfloat,False,False,False,True,'');
   fNumopcoes := CreateCmDbField('NUMOPCOES',ftfloat,False,False,False,True,'');
   fNomevalorbase3 := CreateCmDbField('NOMEVALORBASE3',ftString,False,False,False,True,'');
   fNomevalorbase2 := CreateCmDbField('NOMEVALORBASE2',ftString,False,False,False,True,'');
   fNomevalorbase1 := CreateCmDbField('NOMEVALORBASE1',ftString,False,False,False,True,'');
   fIdrub13dvadtacjud := CreateCmDbField('IDRUB13DVADTACJUD',ftfloat,False,False,False,True,'');
   fIdrub13devacjud := CreateCmDbField('IDRUB13DEVACJUD',ftfloat,False,False,False,True,'');
   fIdrub13descacjud := CreateCmDbField('IDRUB13DESCACJUD',ftfloat,False,False,False,True,'');
   fIdrub13atracjud := CreateCmDbField('IDRUB13ATRACJUD',ftfloat,False,False,False,True,'');
   fIdrub13acjud := CreateCmDbField('IDRUB13ACJUD',ftfloat,False,False,False,True,'');
   fIdrubricadevoluc := CreateCmDbField('IDRUBRICADEVOLUC',ftfloat,False,False,False,True,'');
   fIdrubricaatraso := CreateCmDbField('IDRUBRICAATRASO',ftfloat,False,False,False,True,'');
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,False,False,False,True,'');
   fIdrubferiasnorm := CreateCmDbField('IDRUBFERIASNORM',ftfloat,False,False,False,True,'');
   fIdrubferiasdevol := CreateCmDbField('IDRUBFERIASDEVOL',ftfloat,False,False,False,True,'');
   fIdrubferiasatraso := CreateCmDbField('IDRUBFERIASATRASO',ftfloat,False,False,False,True,'');
   fIdrubdevoladiant := CreateCmDbField('IDRUBDEVOLADIANT',ftfloat,False,False,False,True,'');
   fIdrubdevadtacjud := CreateCmDbField('IDRUBDEVADTACJUD',ftfloat,False,False,False,True,'');
   fIdrubdevadiant13 := CreateCmDbField('IDRUBDEVADIANT13',ftfloat,False,False,False,True,'');
   fIdrubdevacjud := CreateCmDbField('IDRUBDEVACJUD',ftfloat,False,False,False,True,'');
   fIdrubdectercdevol := CreateCmDbField('IDRUBDECTERCDEVOL',ftfloat,False,False,False,True,'');
   fIdrubdectercatra := CreateCmDbField('IDRUBDECTERCATRA',ftfloat,False,False,False,True,'');
   fIdrubdecterc := CreateCmDbField('IDRUBDECTERC',ftfloat,False,False,False,True,'');
   fIdrubdadacjud := CreateCmDbField('IDRUBDADACJUD',ftfloat,False,False,False,True,'');
   fIdrubatracjud := CreateCmDbField('IDRUBATRACJUD',ftfloat,False,False,False,True,'');
   fIdrubadiant13 := CreateCmDbField('IDRUBADIANT13',ftfloat,False,False,False,True,'');
   fIdrubadiant := CreateCmDbField('IDRUBADIANT',ftfloat,False,False,False,True,'');
   fIdrubacjud := CreateCmDbField('IDRUBACJUD',ftfloat,False,False,False,True,'');
   fIdregravlrreserva := CreateCmDbField('IDREGRAVLRRESERVA',ftfloat,False,False,False,True,'');
   fIdregravalidaop3 := CreateCmDbField('IDREGRAVALIDAOP3',ftfloat,False,False,False,True,'');
   fIdregravalidaop2 := CreateCmDbField('IDREGRAVALIDAOP2',ftfloat,False,False,False,True,'');
   fIdregravalidaop1 := CreateCmDbField('IDREGRAVALIDAOP1',ftfloat,False,False,False,True,'');
   fIdregraultpgto13 := CreateCmDbField('IDREGRAULTPGTO13',ftfloat,False,False,False,True,'');
   fIdregraultpagto := CreateCmDbField('IDREGRAULTPAGTO',ftfloat,False,False,False,True,'');
   fIdregraprimpgto13 := CreateCmDbField('IDREGRAPRIMPGTO13',ftfloat,False,False,False,True,'');
   fIdregraprimpagto := CreateCmDbField('IDREGRAPRIMPAGTO',ftfloat,False,False,False,True,'');
   fIdregracobranca := CreateCmDbField('IDREGRACOBRANCA',ftfloat,False,False,False,True,'');
   fIdregracalculo13 := CreateCmDbField('IDREGRACALCULO13',ftfloat,False,False,False,True,'');
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,False,False,False,True,'');
   fIdregracalcop3 := CreateCmDbField('IDREGRACALCOP3',ftfloat,False,False,False,True,'');
   fIdregracalcop2 := CreateCmDbField('IDREGRACALCOP2',ftfloat,False,False,False,True,'');
   fIdregracalcop1 := CreateCmDbField('IDREGRACALCOP1',ftfloat,False,False,False,True,'');
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanopai := CreateCmDbField('IDPLANOPAI',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdempresa13 := CreateCmDbField('IDEMPRESA13',ftfloat,False,False,False,True,'');
   fIdempresaretro := CreateCmDbField('IDEMPRESARETRO',ftfloat,False,False,False,True,'');
   fIdempresaprop13 := CreateCmDbField('IDEMPRESAPROP13',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresadesemb := CreateCmDbField('IDEMPRESADESEMB',ftfloat,False,False,False,True,'');
   fIdempresaalt := CreateCmDbField('IDEMPRESAALT',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,True,True,False,True,'');
   fIdcontribpai3 := CreateCmDbField('IDCONTRIBPAI3',ftfloat,False,False,False,True,'');
   fIdcontribpai2 := CreateCmDbField('IDCONTRIBPAI2',ftfloat,False,False,False,True,'');
   fIdcontribpai := CreateCmDbField('IDCONTRIBPAI',ftfloat,False,False,False,True,'');
   fFlgtotal := CreateCmDbField('FLGTOTAL',ftfloat,False,False,False,True,'');
   fFlgparcelamento := CreateCmDbField('FLGPARCELAMENTO',ftfloat,False,False,False,True,'');
   fFlgpagador := CreateCmDbField('FLGPAGADOR',ftString,False,False,False,True,'');
   fFlgobrigaop3 := CreateCmDbField('FLGOBRIGAOP3',ftfloat,False,False,False,True,'');
   fFlgobrigaop2 := CreateCmDbField('FLGOBRIGAOP2',ftfloat,False,False,False,True,'');
   fFlgobrigaop1 := CreateCmDbField('FLGOBRIGAOP1',ftfloat,False,False,False,True,'');
   fFlgnaoexigerec := CreateCmDbField('FLGNAOEXIGEREC',ftfloat,False,False,False,True,'');
   fFlginterno := CreateCmDbField('FLGINTERNO',ftString,False,False,False,True,'');
   fFlgeditaop3 := CreateCmDbField('FLGEDITAOP3',ftfloat,False,False,False,True,'');
   fFlgeditaop2 := CreateCmDbField('FLGEDITAOP2',ftfloat,False,False,False,True,'');
   fFlgeditaop1 := CreateCmDbField('FLGEDITAOP1',ftfloat,False,False,False,True,'');
   fFlgdescfolhault := CreateCmDbField('FLGDESCFOLHAULT',ftfloat,False,False,False,True,'');
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftfloat,False,False,False,True,'');
   fFlgcontingencia := CreateCmDbField('FLGCONTINGENCIA',ftfloat,False,False,False,True,'');
   fFlgcobra13dtfim := CreateCmDbField('FLGCOBRA13DTFIM',ftfloat,False,False,False,True,'');
   fFlgcobradecterc := CreateCmDbField('FLGCOBRADECTERC',ftfloat,False,False,False,True,'');
   fFlgcarencia := CreateCmDbField('FLGCARENCIA',ftfloat,False,False,False,True,'');
   fFlgacertacontrib13 := CreateCmDbField('FLGACERTACONTRIB13',ftfloat,False,False,False,True,'');
   fFlgaceitaopcao := CreateCmDbField('FLGACEITAOPCAO',ftfloat,False,False,False,True,'');
   fCritvalorbase3 := CreateCmDbField('CRITVALORBASE3',ftString,False,False,False,True,'');
   fCritvalorbase2 := CreateCmDbField('CRITVALORBASE2',ftString,False,False,False,True,'');
   fCritvalorbase1 := CreateCmDbField('CRITVALORBASE1',ftString,False,False,False,True,'');
   fCritsalario := CreateCmDbField('CRITSALARIO',ftString,False,False,False,True,'');
   fCodtiprecebdev13 := CreateCmDbField('CODTIPRECEBDEV13',ftString,False,False,False,True,'');
   fCodtiprecebdev := CreateCmDbField('CODTIPRECEBDEV',ftString,False,False,False,True,'');
   fCodtiprecdes13 := CreateCmDbField('CODTIPRECDES13',ftString,False,False,False,True,'');
   fCodtiprecdesadt := CreateCmDbField('CODTIPRECDESADT',ftString,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodtiprecadt13 := CreateCmDbField('CODTIPRECADT13',ftString,False,False,False,True,'');
   fCodtipdoc13 := CreateCmDbField('CODTIPDOC13',ftfloat,False,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodtipdesemb13 := CreateCmDbField('CODTIPDESEMB13',ftString,False,False,False,True,'');
   fCodtipdesembprov := CreateCmDbField('CODTIPDESEMBPROV',ftString,False,False,False,True,'');
   fCodtipdesembdevol := CreateCmDbField('CODTIPDESEMBDEVOL',ftString,False,False,False,True,'');
   fCodtipdesembcar := CreateCmDbField('CODTIPDESEMBCAR',ftString,False,False,False,True,'');
   fCodsubconta13 := CreateCmDbField('CODSUBCONTA13',ftfloat,False,False,False,True,'');
   fCodsubcontadretro := CreateCmDbField('CODSUBCONTADRETRO',ftfloat,False,False,False,True,'');
   fCodsubcontacretro := CreateCmDbField('CODSUBCONTACRETRO',ftfloat,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodportforma13 := CreateCmDbField('CODPORTFORMA13',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCoddesembprov13 := CreateCmDbField('CODDESEMBPROV13',ftString,False,False,False,True,'');
   fCoddesembdev13 := CreateCmDbField('CODDESEMBDEV13',ftString,False,False,False,True,'');
   fCodcentrorespon13 := CreateCmDbField('CODCENTRORESPON13',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocustod13 := CreateCmDbField('CODCENTROCUSTOD13',ftString,False,False,False,True,'');
   fCodcentrocustodr := CreateCmDbField('CODCENTROCUSTODR',ftString,False,False,False,True,'');
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
   fCodcentrocustoc13 := CreateCmDbField('CODCENTROCUSTOC13',ftString,False,False,False,True,'');
   fCodcentrocustocr := CreateCmDbField('CODCENTROCUSTOCR',ftString,False,False,False,True,'');
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,False,False,False,True,'');
   fCodccustodprovad := CreateCmDbField('CODCCUSTODPROVAD',ftString,False,False,False,True,'');
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,False,False,False,True,'');
   fCodccustodevol := CreateCmDbField('CODCCUSTODEVOL',ftString,False,False,False,True,'');
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,False,False,False,True,'');
   fCodccustocprovad := CreateCmDbField('CODCCUSTOCPROVAD',ftString,False,False,False,True,'');
   fCodccustdprovis13 := CreateCmDbField('CODCCUSTDPROVIS13',ftString,False,False,False,True,'');
   fCodccustcprovis13 := CreateCmDbField('CODCCUSTCPROVIS13',ftString,False,False,False,True,'');
   fCodaltacrescimo := CreateCmDbField('CODALTACRESCIMO',ftfloat,False,False,False,True,'');
end;

function TDBContPrev.Insert: Boolean;
begin

   fIdplanoprev.AsFloat := GetSequence('CONTPREV');
   fIdcontribuicao.AsFloat := GetSequence('CONTPREV');
   Result := Inherited Insert;

end;


procedure TDBContPrev.SetCodaltacrescimo(const Value: TCmDbField);
begin
  FCodaltacrescimo := Value;
end;

procedure TDBContPrev.SetCodccustcprovis13(const Value: TCmDbField);
begin
  FCodccustcprovis13 := Value;
end;

procedure TDBContPrev.SetCodccustdprovis13(const Value: TCmDbField);
begin
  FCodccustdprovis13 := Value;
end;

procedure TDBContPrev.SetCodccustocprovad(const Value: TCmDbField);
begin
  FCodccustocprovad := Value;
end;

procedure TDBContPrev.SetCodccustocprovis(const Value: TCmDbField);
begin
  FCodccustocprovis := Value;
end;

procedure TDBContPrev.SetCodccustodevol(const Value: TCmDbField);
begin
  FCodccustodevol := Value;
end;

procedure TDBContPrev.SetCodccustodevolpat(const Value: TCmDbField);
begin
  FCodccustodevolpat := Value;
end;

procedure TDBContPrev.SetCodccustodprovad(const Value: TCmDbField);
begin
  FCodccustodprovad := Value;
end;

procedure TDBContPrev.SetCodccustodprovis(const Value: TCmDbField);
begin
  FCodccustodprovis := Value;
end;

procedure TDBContPrev.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDBContPrev.SetCodcentrocustoc13(const Value: TCmDbField);
begin
  FCodcentrocustoc13 := Value;
end;

procedure TDBContPrev.SetCodcentrocustocr(const Value: TCmDbField);
begin
  FCodcentrocustocr := Value;
end;

procedure TDBContPrev.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDBContPrev.SetCodcentrocustod13(const Value: TCmDbField);
begin
  FCodcentrocustod13 := Value;
end;

procedure TDBContPrev.SetCodcentrocustodr(const Value: TCmDbField);
begin
  FCodcentrocustodr := Value;
end;

procedure TDBContPrev.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDBContPrev.SetCodcentrorespon13(const Value: TCmDbField);
begin
  FCodcentrorespon13 := Value;
end;

procedure TDBContPrev.SetCoddesembdev13(const Value: TCmDbField);
begin
  FCoddesembdev13 := Value;
end;

procedure TDBContPrev.SetCoddesembprov13(const Value: TCmDbField);
begin
  FCoddesembprov13 := Value;
end;

procedure TDBContPrev.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDBContPrev.SetCodportforma13(const Value: TCmDbField);
begin
  FCodportforma13 := Value;
end;

procedure TDBContPrev.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDBContPrev.SetCodsubconta13(const Value: TCmDbField);
begin
  FCodsubconta13 := Value;
end;

procedure TDBContPrev.SetCodsubcontacretro(const Value: TCmDbField);
begin
  FCodsubcontacretro := Value;
end;

procedure TDBContPrev.SetCodsubcontadretro(const Value: TCmDbField);
begin
  FCodsubcontadretro := Value;
end;

procedure TDBContPrev.SetCodtipdesemb13(const Value: TCmDbField);
begin
  FCodtipdesemb13 := Value;
end;

procedure TDBContPrev.SetCodtipdesembcar(const Value: TCmDbField);
begin
  FCodtipdesembcar := Value;
end;

procedure TDBContPrev.SetCodtipdesembdevol(const Value: TCmDbField);
begin
  FCodtipdesembdevol := Value;
end;

procedure TDBContPrev.SetCodtipdesembprov(const Value: TCmDbField);
begin
  FCodtipdesembprov := Value;
end;

procedure TDBContPrev.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDBContPrev.SetCodtipdoc13(const Value: TCmDbField);
begin
  FCodtipdoc13 := Value;
end;

procedure TDBContPrev.SetCodtiprecadt13(const Value: TCmDbField);
begin
  FCodtiprecadt13 := Value;
end;

procedure TDBContPrev.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDBContPrev.SetCodtiprecdes13(const Value: TCmDbField);
begin
  FCodtiprecdes13 := Value;
end;

procedure TDBContPrev.SetCodtiprecdesadt(const Value: TCmDbField);
begin
  FCodtiprecdesadt := Value;
end;

procedure TDBContPrev.SetCodtiprecebdev(const Value: TCmDbField);
begin
  FCodtiprecebdev := Value;
end;

procedure TDBContPrev.SetCodtiprecebdev13(const Value: TCmDbField);
begin
  FCodtiprecebdev13 := Value;
end;

procedure TDBContPrev.SetCritsalario(const Value: TCmDbField);
begin
  FCritsalario := Value;
end;

procedure TDBContPrev.SetCritvalorbase1(const Value: TCmDbField);
begin
  FCritvalorbase1 := Value;
end;

procedure TDBContPrev.SetCritvalorbase2(const Value: TCmDbField);
begin
  FCritvalorbase2 := Value;
end;

procedure TDBContPrev.SetCritvalorbase3(const Value: TCmDbField);
begin
  FCritvalorbase3 := Value;
end;

procedure TDBContPrev.SetFlgaceitaopcao(const Value: TCmDbField);
begin
  FFlgaceitaopcao := Value;
end;

procedure TDBContPrev.SetFlgacertacontrib13(const Value: TCmDbField);
begin
  FFlgacertacontrib13 := Value;
end;

procedure TDBContPrev.SetFlgcarencia(const Value: TCmDbField);
begin
  FFlgcarencia := Value;
end;

procedure TDBContPrev.SetFlgcobra13dtfim(const Value: TCmDbField);
begin
  FFlgcobra13dtfim := Value;
end;

procedure TDBContPrev.SetFlgcobradecterc(const Value: TCmDbField);
begin
  FFlgcobradecterc := Value;
end;

procedure TDBContPrev.SetFlgcontingencia(const Value: TCmDbField);
begin
  FFlgcontingencia := Value;
end;

procedure TDBContPrev.SetFlgdescfolha(const Value: TCmDbField);
begin
  FFlgdescfolha := Value;
end;

procedure TDBContPrev.SetFlgdescfolhault(const Value: TCmDbField);
begin
  FFlgdescfolhault := Value;
end;

procedure TDBContPrev.SetFlgeditaop1(const Value: TCmDbField);
begin
  FFlgeditaop1 := Value;
end;

procedure TDBContPrev.SetFlgeditaop2(const Value: TCmDbField);
begin
  FFlgeditaop2 := Value;
end;

procedure TDBContPrev.SetFlgeditaop3(const Value: TCmDbField);
begin
  FFlgeditaop3 := Value;
end;

procedure TDBContPrev.SetFlginterno(const Value: TCmDbField);
begin
  FFlginterno := Value;
end;

procedure TDBContPrev.SetFlgnaoexigerec(const Value: TCmDbField);
begin
  FFlgnaoexigerec := Value;
end;

procedure TDBContPrev.SetFlgobrigaop1(const Value: TCmDbField);
begin
  FFlgobrigaop1 := Value;
end;

procedure TDBContPrev.SetFlgobrigaop2(const Value: TCmDbField);
begin
  FFlgobrigaop2 := Value;
end;

procedure TDBContPrev.SetFlgobrigaop3(const Value: TCmDbField);
begin
  FFlgobrigaop3 := Value;
end;

procedure TDBContPrev.SetFlgpagador(const Value: TCmDbField);
begin
  FFlgpagador := Value;
end;

procedure TDBContPrev.SetFlgparcelamento(const Value: TCmDbField);
begin
  FFlgparcelamento := Value;
end;

procedure TDBContPrev.SetFlgtotal(const Value: TCmDbField);
begin
  FFlgtotal := Value;
end;

procedure TDBContPrev.SetIdcontribpai(const Value: TCmDbField);
begin
  FIdcontribpai := Value;
end;

procedure TDBContPrev.SetIdcontribpai2(const Value: TCmDbField);
begin
  FIdcontribpai2 := Value;
end;

procedure TDBContPrev.SetIdcontribpai3(const Value: TCmDbField);
begin
  FIdcontribpai3 := Value;
end;

procedure TDBContPrev.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDBContPrev.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBContPrev.SetIdempresa13(const Value: TCmDbField);
begin
  FIdempresa13 := Value;
end;

procedure TDBContPrev.SetIdempresaalt(const Value: TCmDbField);
begin
  FIdempresaalt := Value;
end;

procedure TDBContPrev.SetIdempresadesemb(const Value: TCmDbField);
begin
  FIdempresadesemb := Value;
end;

procedure TDBContPrev.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDBContPrev.SetIdempresaprop13(const Value: TCmDbField);
begin
  FIdempresaprop13 := Value;
end;

procedure TDBContPrev.SetIdempresaretro(const Value: TCmDbField);
begin
  FIdempresaretro := Value;
end;

procedure TDBContPrev.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBContPrev.SetIdplanopai(const Value: TCmDbField);
begin
  FIdplanopai := Value;
end;

procedure TDBContPrev.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBContPrev.SetIdplanprevcontab(const Value: TCmDbField);
begin
  FIdplanprevcontab := Value;
end;

procedure TDBContPrev.SetIdregracalcop1(const Value: TCmDbField);
begin
  FIdregracalcop1 := Value;
end;

procedure TDBContPrev.SetIdregracalcop2(const Value: TCmDbField);
begin
  FIdregracalcop2 := Value;
end;

procedure TDBContPrev.SetIdregracalcop3(const Value: TCmDbField);
begin
  FIdregracalcop3 := Value;
end;

procedure TDBContPrev.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDBContPrev.SetIdregracalculo13(const Value: TCmDbField);
begin
  FIdregracalculo13 := Value;
end;

procedure TDBContPrev.SetIdregracobranca(const Value: TCmDbField);
begin
  FIdregracobranca := Value;
end;

procedure TDBContPrev.SetIdregraprimpagto(const Value: TCmDbField);
begin
  FIdregraprimpagto := Value;
end;

procedure TDBContPrev.SetIdregraprimpgto13(const Value: TCmDbField);
begin
  FIdregraprimpgto13 := Value;
end;

procedure TDBContPrev.SetIdregraultpagto(const Value: TCmDbField);
begin
  FIdregraultpagto := Value;
end;

procedure TDBContPrev.SetIdregraultpgto13(const Value: TCmDbField);
begin
  FIdregraultpgto13 := Value;
end;

procedure TDBContPrev.SetIdregravalidaop1(const Value: TCmDbField);
begin
  FIdregravalidaop1 := Value;
end;

procedure TDBContPrev.SetIdregravalidaop2(const Value: TCmDbField);
begin
  FIdregravalidaop2 := Value;
end;

procedure TDBContPrev.SetIdregravalidaop3(const Value: TCmDbField);
begin
  FIdregravalidaop3 := Value;
end;

procedure TDBContPrev.SetIdregravlrreserva(const Value: TCmDbField);
begin
  FIdregravlrreserva := Value;
end;

procedure TDBContPrev.SetIdrub13acjud(const Value: TCmDbField);
begin
  FIdrub13acjud := Value;
end;

procedure TDBContPrev.SetIdrub13atracjud(const Value: TCmDbField);
begin
  FIdrub13atracjud := Value;
end;

procedure TDBContPrev.SetIdrub13descacjud(const Value: TCmDbField);
begin
  FIdrub13descacjud := Value;
end;

procedure TDBContPrev.SetIdrub13devacjud(const Value: TCmDbField);
begin
  FIdrub13devacjud := Value;
end;

procedure TDBContPrev.SetIdrub13dvadtacjud(const Value: TCmDbField);
begin
  FIdrub13dvadtacjud := Value;
end;

procedure TDBContPrev.SetIdrubacjud(const Value: TCmDbField);
begin
  FIdrubacjud := Value;
end;

procedure TDBContPrev.SetIdrubadiant(const Value: TCmDbField);
begin
  FIdrubadiant := Value;
end;

procedure TDBContPrev.SetIdrubadiant13(const Value: TCmDbField);
begin
  FIdrubadiant13 := Value;
end;

procedure TDBContPrev.SetIdrubatracjud(const Value: TCmDbField);
begin
  FIdrubatracjud := Value;
end;

procedure TDBContPrev.SetIdrubdadacjud(const Value: TCmDbField);
begin
  FIdrubdadacjud := Value;
end;

procedure TDBContPrev.SetIdrubdecterc(const Value: TCmDbField);
begin
  FIdrubdecterc := Value;
end;

procedure TDBContPrev.SetIdrubdectercatra(const Value: TCmDbField);
begin
  FIdrubdectercatra := Value;
end;

procedure TDBContPrev.SetIdrubdectercdevol(const Value: TCmDbField);
begin
  FIdrubdectercdevol := Value;
end;

procedure TDBContPrev.SetIdrubdevacjud(const Value: TCmDbField);
begin
  FIdrubdevacjud := Value;
end;

procedure TDBContPrev.SetIdrubdevadiant13(const Value: TCmDbField);
begin
  FIdrubdevadiant13 := Value;
end;

procedure TDBContPrev.SetIdrubdevadtacjud(const Value: TCmDbField);
begin
  FIdrubdevadtacjud := Value;
end;

procedure TDBContPrev.SetIdrubdevoladiant(const Value: TCmDbField);
begin
  FIdrubdevoladiant := Value;
end;

procedure TDBContPrev.SetIdrubferiasatraso(const Value: TCmDbField);
begin
  FIdrubferiasatraso := Value;
end;

procedure TDBContPrev.SetIdrubferiasdevol(const Value: TCmDbField);
begin
  FIdrubferiasdevol := Value;
end;

procedure TDBContPrev.SetIdrubferiasnorm(const Value: TCmDbField);
begin
  FIdrubferiasnorm := Value;
end;

procedure TDBContPrev.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

procedure TDBContPrev.SetIdrubricaatraso(const Value: TCmDbField);
begin
  FIdrubricaatraso := Value;
end;

procedure TDBContPrev.SetIdrubricadevoluc(const Value: TCmDbField);
begin
  FIdrubricadevoluc := Value;
end;

procedure TDBContPrev.SetNomevalorbase1(const Value: TCmDbField);
begin
  FNomevalorbase1 := Value;
end;

procedure TDBContPrev.SetNomevalorbase2(const Value: TCmDbField);
begin
  FNomevalorbase2 := Value;
end;

procedure TDBContPrev.SetNomevalorbase3(const Value: TCmDbField);
begin
  FNomevalorbase3 := Value;
end;

procedure TDBContPrev.SetNumopcoes(const Value: TCmDbField);
begin
  FNumopcoes := Value;
end;

procedure TDBContPrev.SetOrdemcalculo(const Value: TCmDbField);
begin
  FOrdemcalculo := Value;
end;

procedure TDBContPrev.SetPerccalculo(const Value: TCmDbField);
begin
  FPerccalculo := Value;
end;

procedure TDBContPrev.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDBContPrev.SetPlacontac13(const Value: TCmDbField);
begin
  FPlacontac13 := Value;
end;

procedure TDBContPrev.SetPlacontacadt13(const Value: TCmDbField);
begin
  FPlacontacadt13 := Value;
end;

procedure TDBContPrev.SetPlacontacprovadt(const Value: TCmDbField);
begin
  FPlacontacprovadt := Value;
end;

procedure TDBContPrev.SetPlacontacprovis(const Value: TCmDbField);
begin
  FPlacontacprovis := Value;
end;

procedure TDBContPrev.SetPlacontacprovis13(const Value: TCmDbField);
begin
  FPlacontacprovis13 := Value;
end;

procedure TDBContPrev.SetPlacontacretro(const Value: TCmDbField);
begin
  FPlacontacretro := Value;
end;

procedure TDBContPrev.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDBContPrev.SetPlacontad13(const Value: TCmDbField);
begin
  FPlacontad13 := Value;
end;

procedure TDBContPrev.SetPlacontadbanco(const Value: TCmDbField);
begin
  FPlacontadbanco := Value;
end;

procedure TDBContPrev.SetPlacontadbanco13(const Value: TCmDbField);
begin
  FPlacontadbanco13 := Value;
end;

procedure TDBContPrev.SetPlacontadevol(const Value: TCmDbField);
begin
  FPlacontadevol := Value;
end;

procedure TDBContPrev.SetPlacontadevol13(const Value: TCmDbField);
begin
  FPlacontadevol13 := Value;
end;

procedure TDBContPrev.SetPlacontadevolpat(const Value: TCmDbField);
begin
  FPlacontadevolpat := Value;
end;

procedure TDBContPrev.SetPlacontadprovadt(const Value: TCmDbField);
begin
  FPlacontadprovadt := Value;
end;

procedure TDBContPrev.SetPlacontadprovis(const Value: TCmDbField);
begin
  FPlacontadprovis := Value;
end;

procedure TDBContPrev.SetPlacontadprovis13(const Value: TCmDbField);
begin
  FPlacontadprovis13 := Value;
end;

procedure TDBContPrev.SetPlacontadretro(const Value: TCmDbField);
begin
  FPlacontadretro := Value;
end;

procedure TDBContPrev.SetPlacontaoutromes(const Value: TCmDbField);
begin
  FPlacontaoutromes := Value;
end;

procedure TDBContPrev.SetPlactaacjud(const Value: TCmDbField);
begin
  FPlactaacjud := Value;
end;

procedure TDBContPrev.SetPlactaacjud13(const Value: TCmDbField);
begin
  FPlactaacjud13 := Value;
end;

procedure TDBContPrev.SetPlactaoutromes13(const Value: TCmDbField);
begin
  FPlactaoutromes13 := Value;
end;

procedure TDBContPrev.SetPlactcprovadt13(const Value: TCmDbField);
begin
  FPlactcprovadt13 := Value;
end;

procedure TDBContPrev.SetPlactdevolpat13(const Value: TCmDbField);
begin
  FPlactdevolpat13 := Value;
end;

procedure TDBContPrev.SetPlactdprovadt13(const Value: TCmDbField);
begin
  FPlactdprovadt13 := Value;
end;

procedure TDBContPrev.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDBContPrev.SetPlano13(const Value: TCmDbField);
begin
  FPlano13 := Value;
end;

procedure TDBContPrev.SetPlanoadt(const Value: TCmDbField);
begin
  FPlanoadt := Value;
end;

procedure TDBContPrev.SetPlanoprovis(const Value: TCmDbField);
begin
  FPlanoprovis := Value;
end;

procedure TDBContPrev.SetPlanoretro(const Value: TCmDbField);
begin
  FPlanoretro := Value;
end;

procedure TDBContPrev.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDBContPrev.SetRecpag13(const Value: TCmDbField);
begin
  FRecpag13 := Value;
end;

procedure TDBContPrev.SetRecpagadt(const Value: TCmDbField);
begin
  FRecpagadt := Value;
end;

procedure TDBContPrev.SetRecpagdesemb(const Value: TCmDbField);
begin
  FRecpagdesemb := Value;
end;

procedure TDBContPrev.SetRecpagdesembprov(const Value: TCmDbField);
begin
  FRecpagdesembprov := Value;
end;

procedure TDBContPrev.SetRecpagdevol(const Value: TCmDbField);
begin
  FRecpagdevol := Value;
end;

procedure TDBContPrev.SetRecpagretro(const Value: TCmDbField);
begin
  FRecpagretro := Value;
end;

procedure TDBContPrev.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDBContPrev.SetTipcodigo13(const Value: TCmDbField);
begin
  FTipcodigo13 := Value;
end;

procedure TDBContPrev.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDBContPrev.SetUnidnegoc13(const Value: TCmDbField);
begin
  FUnidnegoc13 := Value;
end;

procedure TDBContPrev.SetValorbasetaxa(const Value: TCmDbField);
begin
  FValorbasetaxa := Value;
end;

procedure TDBContPrev.SetVlraceitadiverg(const Value: TCmDbField);
begin
  FVlraceitadiverg := Value;
end;

end.



