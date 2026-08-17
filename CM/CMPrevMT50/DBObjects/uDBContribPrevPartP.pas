{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/05/2007                             }
{                                                       }
{*******************************************************}

unit uDBContribPrevPartP;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBContribPrevPartP = class(TCmDbObject)

  private
    FPlactdevolpat13: TCmDbField;
    FValorbase3: TCmDbField;
    FCoddesembprov13: TCmDbField;
    FValorassociado: TCmDbField;
    FUltmespreparo: TCmDbField;
    FCodtipdesembcar: TCmDbField;
    FDiavencimento: TCmDbField;
    FAssoc3op1: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FAssoc1op3: TCmDbField;
    FCodcentrocustod13: TCmDbField;
    FRecpagdevol: TCmDbField;
    FPlactcprovadt13: TCmDbField;
    FIdadeingresso: TCmDbField;
    FCodtipdoc13: TCmDbField;
    FPlacontad: TCmDbField;
    FAssoc2op1: TCmDbField;
    FRecpagdesemb: TCmDbField;
    FIdtpperiodicidade: TCmDbField;
    FPlacontadprovis: TCmDbField;
    FPlacontacprovadt: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodtipdoc: TCmDbField;
    FQtdeparcelas: TCmDbField;
    FPrazodiferimento: TCmDbField;
    FCodccustodprovis: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FIndicereajcontrib: TCmDbField;
    FCodtiprecdesadt: TCmDbField;
    FPlacontaoutromes: TCmDbField;
    FCodccustodevol: TCmDbField;
    FValorbase1: TCmDbField;
    FCodccustdprovis13: TCmDbField;
    FUltano13: TCmDbField;
    FIdsitcobertura: TCmDbField;
    FFlgdescfolha: TCmDbField;
    FCodtiprecadt13: TCmDbField;
    FTempocontrib: TCmDbField;
    FPlacontac: TCmDbField;
    FIdempresa13: TCmDbField;
    FPlacontadprovis13: TCmDbField;
    FCodccustcprovis13: TCmDbField;
    FIdadeingcomercial: TCmDbField;
    FPlactaacjud13: TCmDbField;
    FCodalteradorcorr: TCmDbField;
    FCodalterajuros13: TCmDbField;
    FTipcodigo13: TCmDbField;
    FMesreajcontrib: TCmDbField;
    FVlbenefreal: TCmDbField;
    FPlactaoutromes13: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FFlgformacalc: TCmDbField;
    FPlano: TCmDbField;
    FPlactdprovadt13: TCmDbField;
    FPlacontad13: TCmDbField;
    FPlacontacprovis: TCmDbField;
    FPlacontadbanco13: TCmDbField;
    FPlacontadevol13: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FIdempresadesemb: TCmDbField;
    FSeqproposta: TCmDbField;
    FIdempresaprop: TCmDbField;
    FAssoc2op2: TCmDbField;
    FRecpagadt: TCmDbField;
    FPlacontadevolpat: TCmDbField;
    FIdplanprevcontab: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FFlgcobra: TCmDbField;
    FCodtipdesemb13: TCmDbField;
    FCodccustocprovis: TCmDbField;
    FIdbeneficio: TCmDbField;
    FPlacontadevol: TCmDbField;
    FIdplanobenef: TCmDbField;
    FCodsubconta: TCmDbField;
    FValorbase2: TCmDbField;
    FCodalteradorjuros: TCmDbField;
    FDtprimpagamento: TCmDbField;
    FPlacontacadt13: TCmDbField;
    FPlactaacjud: TCmDbField;
    FAssoc1op2: TCmDbField;
    FPlacontadbanco: TCmDbField;
    FRecpag: TCmDbField;
    FCodtipdesembdevol: TCmDbField;
    FUnidnegoc13: TCmDbField;
    FTmppagtorenda: TCmDbField;
    FPlacontadprovadt: TCmDbField;
    FAssoc2op3: TCmDbField;
    FAssoc3op2: TCmDbField;
    FCoddesembdev13: TCmDbField;
    FRecpag13: TCmDbField;
    FCodsubconta13: TCmDbField;
    FDatainicio: TCmDbField;
    FFlgrecalcula: TCmDbField;
    FDatafinal: TCmDbField;
    FCodtipdesembprov: TCmDbField;
    FCodportforma13: TCmDbField;
    FAssoc3op3: TCmDbField;
    FCodcentrorespon13: TCmDbField;
    FTipcodigo: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPlacontac13: TCmDbField;
    FCodportforma: TCmDbField;
    FPlacontacprovis13: TCmDbField;
    FValorassociado2: TCmDbField;
    FIdhistproposta: TCmDbField;
    FValorassociado3: TCmDbField;
    FIdempresaprop13: TCmDbField;
    FCodtiprecdes13: TCmDbField;
    FCodccustodevolpat: TCmDbField;
    FVlrcontcalculado: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdadeingreal: TCmDbField;
    FIdpessjur: TCmDbField;
    FCodcentrocustoc13: TCmDbField;
    FFlgretroativo: TCmDbField;
    FRecpagdesembprov: TCmDbField;
    FPlano13: TCmDbField;
    FAssoc1op1: TCmDbField;
    FCodalteracorr13: TCmDbField;
    FVlrcontdigitado: TCmDbField;
    FIdempresa: TCmDbField;
    FPlanoprovis: TCmDbField;
    FVlcontreal: TCmDbField;
    procedure SetAssoc1op1(const Value: TCmDbField);
    procedure SetAssoc1op2(const Value: TCmDbField);
    procedure SetAssoc1op3(const Value: TCmDbField);
    procedure SetAssoc2op1(const Value: TCmDbField);
    procedure SetAssoc2op2(const Value: TCmDbField);
    procedure SetAssoc2op3(const Value: TCmDbField);
    procedure SetAssoc3op1(const Value: TCmDbField);
    procedure SetAssoc3op2(const Value: TCmDbField);
    procedure SetAssoc3op3(const Value: TCmDbField);
    procedure SetCodalteracorr13(const Value: TCmDbField);
    procedure SetCodalteradorcorr(const Value: TCmDbField);
    procedure SetCodalteradorjuros(const Value: TCmDbField);
    procedure SetCodalterajuros13(const Value: TCmDbField);
    procedure SetCodccustcprovis13(const Value: TCmDbField);
    procedure SetCodccustdprovis13(const Value: TCmDbField);
    procedure SetCodccustocprovis(const Value: TCmDbField);
    procedure SetCodccustodevol(const Value: TCmDbField);
    procedure SetCodccustodevolpat(const Value: TCmDbField);
    procedure SetCodccustodprovis(const Value: TCmDbField);
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustoc13(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrocustod13(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodcentrorespon13(const Value: TCmDbField);
    procedure SetCoddesembdev13(const Value: TCmDbField);
    procedure SetCoddesembprov13(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodportforma13(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodsubconta13(const Value: TCmDbField);
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
    procedure SetDatafinal(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetDiavencimento(const Value: TCmDbField);
    procedure SetDtprimpagamento(const Value: TCmDbField);
    procedure SetFlgcobra(const Value: TCmDbField);
    procedure SetFlgdescfolha(const Value: TCmDbField);
    procedure SetFlgformacalc(const Value: TCmDbField);
    procedure SetFlgrecalcula(const Value: TCmDbField);
    procedure SetFlgretroativo(const Value: TCmDbField);
    procedure SetIdadeingcomercial(const Value: TCmDbField);
    procedure SetIdadeingreal(const Value: TCmDbField);
    procedure SetIdadeingresso(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdempresa13(const Value: TCmDbField);
    procedure SetIdempresadesemb(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdempresaprop13(const Value: TCmDbField);
    procedure SetIdhistproposta(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanobenef(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdplanprevcontab(const Value: TCmDbField);
    procedure SetIdsitcobertura(const Value: TCmDbField);
    procedure SetIdtpperiodicidade(const Value: TCmDbField);
    procedure SetIndicereajcontrib(const Value: TCmDbField);
    procedure SetMesreajcontrib(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontac13(const Value: TCmDbField);
    procedure SetPlacontacadt13(const Value: TCmDbField);
    procedure SetPlacontacprovadt(const Value: TCmDbField);
    procedure SetPlacontacprovis(const Value: TCmDbField);
    procedure SetPlacontacprovis13(const Value: TCmDbField);
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
    procedure SetPlacontaoutromes(const Value: TCmDbField);
    procedure SetPlactaacjud(const Value: TCmDbField);
    procedure SetPlactaacjud13(const Value: TCmDbField);
    procedure SetPlactaoutromes13(const Value: TCmDbField);
    procedure SetPlactcprovadt13(const Value: TCmDbField);
    procedure SetPlactdevolpat13(const Value: TCmDbField);
    procedure SetPlactdprovadt13(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlano13(const Value: TCmDbField);
    procedure SetPlanoprovis(const Value: TCmDbField);
    procedure SetPrazodiferimento(const Value: TCmDbField);
    procedure SetQtdeparcelas(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetRecpag13(const Value: TCmDbField);
    procedure SetRecpagadt(const Value: TCmDbField);
    procedure SetRecpagdesemb(const Value: TCmDbField);
    procedure SetRecpagdesembprov(const Value: TCmDbField);
    procedure SetRecpagdevol(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetTempocontrib(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetTipcodigo13(const Value: TCmDbField);
    procedure SetTmppagtorenda(const Value: TCmDbField);
    procedure SetUltano13(const Value: TCmDbField);
    procedure SetUltmespreparo(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetUnidnegoc13(const Value: TCmDbField);
    procedure SetValorassociado(const Value: TCmDbField);
    procedure SetValorassociado2(const Value: TCmDbField);
    procedure SetValorassociado3(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);
    procedure SetVlbenefreal(const Value: TCmDbField);
    procedure SetVlcontreal(const Value: TCmDbField);
    procedure SetVlrcontcalculado(const Value: TCmDbField);
    procedure SetVlrcontdigitado(const Value: TCmDbField);

  public

     Property Vlrcontdigitado: TCmDbField read FVlrcontdigitado write SetVlrcontdigitado;
     Property Vlrcontcalculado: TCmDbField read FVlrcontcalculado write SetVlrcontcalculado;
     Property Vlcontreal: TCmDbField read FVlcontreal write SetVlcontreal;
     Property Vlbenefreal: TCmDbField read FVlbenefreal write SetVlbenefreal;
     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Valorassociado3: TCmDbField read FValorassociado3 write SetValorassociado3;
     Property Valorassociado2: TCmDbField read FValorassociado2 write SetValorassociado2;
     Property Valorassociado: TCmDbField read FValorassociado write SetValorassociado;
     Property Unidnegoc13: TCmDbField read FUnidnegoc13 write SetUnidnegoc13;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Ultmespreparo: TCmDbField read FUltmespreparo write SetUltmespreparo;
     Property Ultano13: TCmDbField read FUltano13 write SetUltano13;
     Property Tmppagtorenda: TCmDbField read FTmppagtorenda write SetTmppagtorenda;
     Property Tipcodigo13: TCmDbField read FTipcodigo13 write SetTipcodigo13;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Tempocontrib: TCmDbField read FTempocontrib write SetTempocontrib;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Recpag13: TCmDbField read FRecpag13 write SetRecpag13;
     Property Recpagdevol: TCmDbField read FRecpagdevol write SetRecpagdevol;
     Property Recpagdesembprov: TCmDbField read FRecpagdesembprov write SetRecpagdesembprov;
     Property Recpagdesemb: TCmDbField read FRecpagdesemb write SetRecpagdesemb;
     Property Recpagadt: TCmDbField read FRecpagadt write SetRecpagadt;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Qtdeparcelas: TCmDbField read FQtdeparcelas write SetQtdeparcelas;
     Property Prazodiferimento: TCmDbField read FPrazodiferimento write SetPrazodiferimento;
     Property Plano13: TCmDbField read FPlano13 write SetPlano13;
     Property Planoprovis: TCmDbField read FPlanoprovis write SetPlanoprovis;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Plactdprovadt13: TCmDbField read FPlactdprovadt13 write SetPlactdprovadt13;
     Property Plactdevolpat13: TCmDbField read FPlactdevolpat13 write SetPlactdevolpat13;
     Property Plactcprovadt13: TCmDbField read FPlactcprovadt13 write SetPlactcprovadt13;
     Property Plactaoutromes13: TCmDbField read FPlactaoutromes13 write SetPlactaoutromes13;
     Property Plactaacjud13: TCmDbField read FPlactaacjud13 write SetPlactaacjud13;
     Property Plactaacjud: TCmDbField read FPlactaacjud write SetPlactaacjud;
     Property Placontaoutromes: TCmDbField read FPlacontaoutromes write SetPlacontaoutromes;
     Property Placontad13: TCmDbField read FPlacontad13 write SetPlacontad13;
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
     Property Placontacprovis13: TCmDbField read FPlacontacprovis13 write SetPlacontacprovis13;
     Property Placontacprovis: TCmDbField read FPlacontacprovis write SetPlacontacprovis;
     Property Placontacprovadt: TCmDbField read FPlacontacprovadt write SetPlacontacprovadt;
     Property Placontacadt13: TCmDbField read FPlacontacadt13 write SetPlacontacadt13;
     Property Placontac: TCmDbField read FPlacontac write SetPlacontac;
     Property Mesreajcontrib: TCmDbField read FMesreajcontrib write SetMesreajcontrib;
     Property Indicereajcontrib: TCmDbField read FIndicereajcontrib write SetIndicereajcontrib;
     Property Idtpperiodicidade: TCmDbField read FIdtpperiodicidade write SetIdtpperiodicidade;
     Property Idsitcobertura: TCmDbField read FIdsitcobertura write SetIdsitcobertura;
     Property Idplanprevcontab: TCmDbField read FIdplanprevcontab write SetIdplanprevcontab;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanobenef: TCmDbField read FIdplanobenef write SetIdplanobenef;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idhistproposta: TCmDbField read FIdhistproposta write SetIdhistproposta;
     Property Idempresa13: TCmDbField read FIdempresa13 write SetIdempresa13;
     Property Idempresaprop13: TCmDbField read FIdempresaprop13 write SetIdempresaprop13;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Idempresadesemb: TCmDbField read FIdempresadesemb write SetIdempresadesemb;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Idadeingresso: TCmDbField read FIdadeingresso write SetIdadeingresso;
     Property Idadeingreal: TCmDbField read FIdadeingreal write SetIdadeingreal;
     Property Idadeingcomercial: TCmDbField read FIdadeingcomercial write SetIdadeingcomercial;
     Property Flgretroativo: TCmDbField read FFlgretroativo write SetFlgretroativo;
     Property Flgrecalcula: TCmDbField read FFlgrecalcula write SetFlgrecalcula;
     Property Flgformacalc: TCmDbField read FFlgformacalc write SetFlgformacalc;
     Property Flgdescfolha: TCmDbField read FFlgdescfolha write SetFlgdescfolha;
     Property Flgcobra: TCmDbField read FFlgcobra write SetFlgcobra;
     Property Dtprimpagamento: TCmDbField read FDtprimpagamento write SetDtprimpagamento;
     Property Diavencimento: TCmDbField read FDiavencimento write SetDiavencimento;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafinal: TCmDbField read FDatafinal write SetDatafinal;
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
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codportforma13: TCmDbField read FCodportforma13 write SetCodportforma13;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Coddesembprov13: TCmDbField read FCoddesembprov13 write SetCoddesembprov13;
     Property Coddesembdev13: TCmDbField read FCoddesembdev13 write SetCoddesembdev13;
     Property Codcentrorespon13: TCmDbField read FCodcentrorespon13 write SetCodcentrorespon13;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocustod13: TCmDbField read FCodcentrocustod13 write SetCodcentrocustod13;
     Property Codcentrocustod: TCmDbField read FCodcentrocustod write SetCodcentrocustod;
     Property Codcentrocustoc13: TCmDbField read FCodcentrocustoc13 write SetCodcentrocustoc13;
     Property Codcentrocustoc: TCmDbField read FCodcentrocustoc write SetCodcentrocustoc;
     Property Codccustodprovis: TCmDbField read FCodccustodprovis write SetCodccustodprovis;
     Property Codccustodevolpat: TCmDbField read FCodccustodevolpat write SetCodccustodevolpat;
     Property Codccustodevol: TCmDbField read FCodccustodevol write SetCodccustodevol;
     Property Codccustocprovis: TCmDbField read FCodccustocprovis write SetCodccustocprovis;
     Property Codccustdprovis13: TCmDbField read FCodccustdprovis13 write SetCodccustdprovis13;
     Property Codccustcprovis13: TCmDbField read FCodccustcprovis13 write SetCodccustcprovis13;
     Property Codalterajuros13: TCmDbField read FCodalterajuros13 write SetCodalterajuros13;
     Property Codalteradorjuros: TCmDbField read FCodalteradorjuros write SetCodalteradorjuros;
     Property Codalteradorcorr: TCmDbField read FCodalteradorcorr write SetCodalteradorcorr;
     Property Codalteracorr13: TCmDbField read FCodalteracorr13 write SetCodalteracorr13;
     Property Assoc3op3: TCmDbField read FAssoc3op3 write SetAssoc3op3;
     Property Assoc3op2: TCmDbField read FAssoc3op2 write SetAssoc3op2;
     Property Assoc3op1: TCmDbField read FAssoc3op1 write SetAssoc3op1;
     Property Assoc2op3: TCmDbField read FAssoc2op3 write SetAssoc2op3;
     Property Assoc2op2: TCmDbField read FAssoc2op2 write SetAssoc2op2;
     Property Assoc2op1: TCmDbField read FAssoc2op1 write SetAssoc2op1;
     Property Assoc1op3: TCmDbField read FAssoc1op3 write SetAssoc1op3;
     Property Assoc1op2: TCmDbField read FAssoc1op2 write SetAssoc1op2;
     Property Assoc1op1: TCmDbField read FAssoc1op1 write SetAssoc1op1;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBContribPrevPartP }

constructor TDBContribPrevPartP.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRIBPREVPARTP';

   fVlrcontdigitado := CreateCmDbField('VLRCONTDIGITADO',ftfloat,False,False,False,True,'');
   fVlrcontcalculado := CreateCmDbField('VLRCONTCALCULADO',ftfloat,False,False,False,True,'');
   fVlcontreal := CreateCmDbField('VLCONTREAL',ftfloat,False,False,False,True,'');
   fVlbenefreal := CreateCmDbField('VLBENEFREAL',ftfloat,False,False,False,True,'');
   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fValorassociado3 := CreateCmDbField('VALORASSOCIADO3',ftfloat,False,False,False,True,'');
   fValorassociado2 := CreateCmDbField('VALORASSOCIADO2',ftfloat,False,False,False,True,'');
   fValorassociado := CreateCmDbField('VALORASSOCIADO',ftfloat,False,False,False,True,'');
   fUnidnegoc13 := CreateCmDbField('UNIDNEGOC13',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fUltmespreparo := CreateCmDbField('ULTMESPREPARO',ftString,False,False,False,True,'');
   fUltano13 := CreateCmDbField('ULTANO13',ftfloat,False,False,False,True,'');
   fTmppagtorenda := CreateCmDbField('TMPPAGTORENDA',ftfloat,False,False,False,True,'');
   fTipcodigo13 := CreateCmDbField('TIPCODIGO13',ftString,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fTempocontrib := CreateCmDbField('TEMPOCONTRIB',ftfloat,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fRecpag13 := CreateCmDbField('RECPAG13',ftString,False,False,False,True,'');
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,False,False,False,True,'');
   fRecpagdesembprov := CreateCmDbField('RECPAGDESEMBPROV',ftString,False,False,False,True,'');
   fRecpagdesemb := CreateCmDbField('RECPAGDESEMB',ftString,False,False,False,True,'');
   fRecpagadt := CreateCmDbField('RECPAGADT',ftString,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fQtdeparcelas := CreateCmDbField('QTDEPARCELAS',ftfloat,False,False,False,True,'');
   fPrazodiferimento := CreateCmDbField('PRAZODIFERIMENTO',ftfloat,False,False,False,True,'');
   fPlano13 := CreateCmDbField('PLANO13',ftfloat,False,False,False,True,'');
   fPlanoprovis := CreateCmDbField('PLANOPROVIS',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlactdprovadt13 := CreateCmDbField('PLACTDPROVADT13',ftString,False,False,False,True,'');
   fPlactdevolpat13 := CreateCmDbField('PLACTDEVOLPAT13',ftString,False,False,False,True,'');
   fPlactcprovadt13 := CreateCmDbField('PLACTCPROVADT13',ftString,False,False,False,True,'');
   fPlactaoutromes13 := CreateCmDbField('PLACTAOUTROMES13',ftString,False,False,False,True,'');
   fPlactaacjud13 := CreateCmDbField('PLACTAACJUD13',ftString,False,False,False,True,'');
   fPlactaacjud := CreateCmDbField('PLACTAACJUD',ftString,False,False,False,True,'');
   fPlacontaoutromes := CreateCmDbField('PLACONTAOUTROMES',ftString,False,False,False,True,'');
   fPlacontad13 := CreateCmDbField('PLACONTAD13',ftString,False,False,False,True,'');
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
   fPlacontacprovis13 := CreateCmDbField('PLACONTACPROVIS13',ftString,False,False,False,True,'');
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,False,False,False,True,'');
   fPlacontacprovadt := CreateCmDbField('PLACONTACPROVADT',ftString,False,False,False,True,'');
   fPlacontacadt13 := CreateCmDbField('PLACONTACADT13',ftString,False,False,False,True,'');
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
   fMesreajcontrib := CreateCmDbField('MESREAJCONTRIB',ftfloat,False,False,False,True,'');
   fIndicereajcontrib := CreateCmDbField('INDICEREAJCONTRIB',ftfloat,False,False,False,True,'');
   fIdtpperiodicidade := CreateCmDbField('IDTPPERIODICIDADE',ftfloat,False,False,False,True,'');
   fIdsitcobertura := CreateCmDbField('IDSITCOBERTURA',ftfloat,False,False,False,True,'');
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanobenef := CreateCmDbField('IDPLANOBENEF',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdhistproposta := CreateCmDbField('IDHISTPROPOSTA',ftfloat,False,False,False,True,'');
   fIdempresa13 := CreateCmDbField('IDEMPRESA13',ftfloat,False,False,False,True,'');
   fIdempresaprop13 := CreateCmDbField('IDEMPRESAPROP13',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresadesemb := CreateCmDbField('IDEMPRESADESEMB',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,True,True,False,True,'');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,False,False,True,'');
   fIdadeingresso := CreateCmDbField('IDADEINGRESSO',ftfloat,False,False,False,True,'');
   fIdadeingreal := CreateCmDbField('IDADEINGREAL',ftfloat,False,False,False,True,'');
   fIdadeingcomercial := CreateCmDbField('IDADEINGCOMERCIAL',ftfloat,False,False,False,True,'');
   fFlgretroativo := CreateCmDbField('FLGRETROATIVO',ftfloat,False,False,False,True,'');
   fFlgrecalcula := CreateCmDbField('FLGRECALCULA',ftfloat,False,False,False,True,'');
   fFlgformacalc := CreateCmDbField('FLGFORMACALC',ftString,False,False,False,True,'');
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftfloat,False,False,False,True,'');
   fFlgcobra := CreateCmDbField('FLGCOBRA',ftfloat,False,False,False,True,'');
   fDtprimpagamento := CreateCmDbField('DTPRIMPAGAMENTO',ftDateTime,False,False,False,True,'');
   fDiavencimento := CreateCmDbField('DIAVENCIMENTO',ftfloat,False,False,False,True,'');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
   fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,False,False,False,True,'');
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
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodportforma13 := CreateCmDbField('CODPORTFORMA13',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCoddesembprov13 := CreateCmDbField('CODDESEMBPROV13',ftString,False,False,False,True,'');
   fCoddesembdev13 := CreateCmDbField('CODDESEMBDEV13',ftString,False,False,False,True,'');
   fCodcentrorespon13 := CreateCmDbField('CODCENTRORESPON13',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocustod13 := CreateCmDbField('CODCENTROCUSTOD13',ftString,False,False,False,True,'');
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
   fCodcentrocustoc13 := CreateCmDbField('CODCENTROCUSTOC13',ftString,False,False,False,True,'');
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,False,False,False,True,'');
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,False,False,False,True,'');
   fCodccustodevol := CreateCmDbField('CODCCUSTODEVOL',ftString,False,False,False,True,'');
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,False,False,False,True,'');
   fCodccustdprovis13 := CreateCmDbField('CODCCUSTDPROVIS13',ftString,False,False,False,True,'');
   fCodccustcprovis13 := CreateCmDbField('CODCCUSTCPROVIS13',ftString,False,False,False,True,'');
   fCodalterajuros13 := CreateCmDbField('CODALTERAJUROS13',ftfloat,False,False,False,True,'');
   fCodalteradorjuros := CreateCmDbField('CODALTERADORJUROS',ftfloat,False,False,False,True,'');
   fCodalteradorcorr := CreateCmDbField('CODALTERADORCORR',ftfloat,False,False,False,True,'');
   fCodalteracorr13 := CreateCmDbField('CODALTERACORR13',ftfloat,False,False,False,True,'');
   fAssoc3op3 := CreateCmDbField('ASSOC3OP3',ftfloat,False,False,False,True,'');
   fAssoc3op2 := CreateCmDbField('ASSOC3OP2',ftfloat,False,False,False,True,'');
   fAssoc3op1 := CreateCmDbField('ASSOC3OP1',ftfloat,False,False,False,True,'');
   fAssoc2op3 := CreateCmDbField('ASSOC2OP3',ftfloat,False,False,False,True,'');
   fAssoc2op2 := CreateCmDbField('ASSOC2OP2',ftfloat,False,False,False,True,'');
   fAssoc2op1 := CreateCmDbField('ASSOC2OP1',ftfloat,False,False,False,True,'');
   fAssoc1op3 := CreateCmDbField('ASSOC1OP3',ftfloat,False,False,False,True,'');
   fAssoc1op2 := CreateCmDbField('ASSOC1OP2',ftfloat,False,False,False,True,'');
   fAssoc1op1 := CreateCmDbField('ASSOC1OP1',ftfloat,False,False,False,True,'');
end;

function TDBContribPrevPartP.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDBContribPrevPartP.SetAssoc1op1(const Value: TCmDbField);
begin
  FAssoc1op1 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc1op2(const Value: TCmDbField);
begin
  FAssoc1op2 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc1op3(const Value: TCmDbField);
begin
  FAssoc1op3 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc2op1(const Value: TCmDbField);
begin
  FAssoc2op1 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc2op2(const Value: TCmDbField);
begin
  FAssoc2op2 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc2op3(const Value: TCmDbField);
begin
  FAssoc2op3 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc3op1(const Value: TCmDbField);
begin
  FAssoc3op1 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc3op2(const Value: TCmDbField);
begin
  FAssoc3op2 := Value;
end;

procedure TDBContribPrevPartP.SetAssoc3op3(const Value: TCmDbField);
begin
  FAssoc3op3 := Value;
end;

procedure TDBContribPrevPartP.SetCodalteracorr13(const Value: TCmDbField);
begin
  FCodalteracorr13 := Value;
end;

procedure TDBContribPrevPartP.SetCodalteradorcorr(const Value: TCmDbField);
begin
  FCodalteradorcorr := Value;
end;

procedure TDBContribPrevPartP.SetCodalteradorjuros(
  const Value: TCmDbField);
begin
  FCodalteradorjuros := Value;
end;

procedure TDBContribPrevPartP.SetCodalterajuros13(const Value: TCmDbField);
begin
  FCodalterajuros13 := Value;
end;

procedure TDBContribPrevPartP.SetCodccustcprovis13(
  const Value: TCmDbField);
begin
  FCodccustcprovis13 := Value;
end;

procedure TDBContribPrevPartP.SetCodccustdprovis13(
  const Value: TCmDbField);
begin
  FCodccustdprovis13 := Value;
end;

procedure TDBContribPrevPartP.SetCodccustocprovis(const Value: TCmDbField);
begin
  FCodccustocprovis := Value;
end;

procedure TDBContribPrevPartP.SetCodccustodevol(const Value: TCmDbField);
begin
  FCodccustodevol := Value;
end;

procedure TDBContribPrevPartP.SetCodccustodevolpat(
  const Value: TCmDbField);
begin
  FCodccustodevolpat := Value;
end;

procedure TDBContribPrevPartP.SetCodccustodprovis(const Value: TCmDbField);
begin
  FCodccustodprovis := Value;
end;

procedure TDBContribPrevPartP.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDBContribPrevPartP.SetCodcentrocustoc13(
  const Value: TCmDbField);
begin
  FCodcentrocustoc13 := Value;
end;

procedure TDBContribPrevPartP.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDBContribPrevPartP.SetCodcentrocustod13(
  const Value: TCmDbField);
begin
  FCodcentrocustod13 := Value;
end;

procedure TDBContribPrevPartP.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDBContribPrevPartP.SetCodcentrorespon13(
  const Value: TCmDbField);
begin
  FCodcentrorespon13 := Value;
end;

procedure TDBContribPrevPartP.SetCoddesembdev13(const Value: TCmDbField);
begin
  FCoddesembdev13 := Value;
end;

procedure TDBContribPrevPartP.SetCoddesembprov13(const Value: TCmDbField);
begin
  FCoddesembprov13 := Value;
end;

procedure TDBContribPrevPartP.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDBContribPrevPartP.SetCodportforma13(const Value: TCmDbField);
begin
  FCodportforma13 := Value;
end;

procedure TDBContribPrevPartP.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDBContribPrevPartP.SetCodsubconta13(const Value: TCmDbField);
begin
  FCodsubconta13 := Value;
end;

procedure TDBContribPrevPartP.SetCodtipdesemb13(const Value: TCmDbField);
begin
  FCodtipdesemb13 := Value;
end;

procedure TDBContribPrevPartP.SetCodtipdesembcar(const Value: TCmDbField);
begin
  FCodtipdesembcar := Value;
end;

procedure TDBContribPrevPartP.SetCodtipdesembdevol(
  const Value: TCmDbField);
begin
  FCodtipdesembdevol := Value;
end;

procedure TDBContribPrevPartP.SetCodtipdesembprov(const Value: TCmDbField);
begin
  FCodtipdesembprov := Value;
end;

procedure TDBContribPrevPartP.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDBContribPrevPartP.SetCodtipdoc13(const Value: TCmDbField);
begin
  FCodtipdoc13 := Value;
end;

procedure TDBContribPrevPartP.SetCodtiprecadt13(const Value: TCmDbField);
begin
  FCodtiprecadt13 := Value;
end;

procedure TDBContribPrevPartP.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDBContribPrevPartP.SetCodtiprecdes13(const Value: TCmDbField);
begin
  FCodtiprecdes13 := Value;
end;

procedure TDBContribPrevPartP.SetCodtiprecdesadt(const Value: TCmDbField);
begin
  FCodtiprecdesadt := Value;
end;

procedure TDBContribPrevPartP.SetDatafinal(const Value: TCmDbField);
begin
  FDatafinal := Value;
end;

procedure TDBContribPrevPartP.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDBContribPrevPartP.SetDiavencimento(const Value: TCmDbField);
begin
  FDiavencimento := Value;
end;

procedure TDBContribPrevPartP.SetDtprimpagamento(const Value: TCmDbField);
begin
  FDtprimpagamento := Value;
end;

procedure TDBContribPrevPartP.SetFlgcobra(const Value: TCmDbField);
begin
  FFlgcobra := Value;
end;

procedure TDBContribPrevPartP.SetFlgdescfolha(const Value: TCmDbField);
begin
  FFlgdescfolha := Value;
end;

procedure TDBContribPrevPartP.SetFlgformacalc(const Value: TCmDbField);
begin
  FFlgformacalc := Value;
end;

procedure TDBContribPrevPartP.SetFlgrecalcula(const Value: TCmDbField);
begin
  FFlgrecalcula := Value;
end;

procedure TDBContribPrevPartP.SetFlgretroativo(const Value: TCmDbField);
begin
  FFlgretroativo := Value;
end;

procedure TDBContribPrevPartP.SetIdadeingcomercial(
  const Value: TCmDbField);
begin
  FIdadeingcomercial := Value;
end;

procedure TDBContribPrevPartP.SetIdadeingreal(const Value: TCmDbField);
begin
  FIdadeingreal := Value;
end;

procedure TDBContribPrevPartP.SetIdadeingresso(const Value: TCmDbField);
begin
  FIdadeingresso := Value;
end;

procedure TDBContribPrevPartP.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDBContribPrevPartP.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDBContribPrevPartP.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBContribPrevPartP.SetIdempresa13(const Value: TCmDbField);
begin
  FIdempresa13 := Value;
end;

procedure TDBContribPrevPartP.SetIdempresadesemb(const Value: TCmDbField);
begin
  FIdempresadesemb := Value;
end;

procedure TDBContribPrevPartP.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDBContribPrevPartP.SetIdempresaprop13(const Value: TCmDbField);
begin
  FIdempresaprop13 := Value;
end;

procedure TDBContribPrevPartP.SetIdhistproposta(const Value: TCmDbField);
begin
  FIdhistproposta := Value;
end;

procedure TDBContribPrevPartP.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDBContribPrevPartP.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBContribPrevPartP.SetIdplanobenef(const Value: TCmDbField);
begin
  FIdplanobenef := Value;
end;

procedure TDBContribPrevPartP.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBContribPrevPartP.SetIdplanprevcontab(const Value: TCmDbField);
begin
  FIdplanprevcontab := Value;
end;

procedure TDBContribPrevPartP.SetIdsitcobertura(const Value: TCmDbField);
begin
  FIdsitcobertura := Value;
end;

procedure TDBContribPrevPartP.SetIdtpperiodicidade(
  const Value: TCmDbField);
begin
  FIdtpperiodicidade := Value;
end;

procedure TDBContribPrevPartP.SetIndicereajcontrib(
  const Value: TCmDbField);
begin
  FIndicereajcontrib := Value;
end;

procedure TDBContribPrevPartP.SetMesreajcontrib(const Value: TCmDbField);
begin
  FMesreajcontrib := Value;
end;

procedure TDBContribPrevPartP.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDBContribPrevPartP.SetPlacontac13(const Value: TCmDbField);
begin
  FPlacontac13 := Value;
end;

procedure TDBContribPrevPartP.SetPlacontacadt13(const Value: TCmDbField);
begin
  FPlacontacadt13 := Value;
end;

procedure TDBContribPrevPartP.SetPlacontacprovadt(const Value: TCmDbField);
begin
  FPlacontacprovadt := Value;
end;

procedure TDBContribPrevPartP.SetPlacontacprovis(const Value: TCmDbField);
begin
  FPlacontacprovis := Value;
end;

procedure TDBContribPrevPartP.SetPlacontacprovis13(
  const Value: TCmDbField);
begin
  FPlacontacprovis13 := Value;
end;

procedure TDBContribPrevPartP.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDBContribPrevPartP.SetPlacontad13(const Value: TCmDbField);
begin
  FPlacontad13 := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadbanco(const Value: TCmDbField);
begin
  FPlacontadbanco := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadbanco13(const Value: TCmDbField);
begin
  FPlacontadbanco13 := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadevol(const Value: TCmDbField);
begin
  FPlacontadevol := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadevol13(const Value: TCmDbField);
begin
  FPlacontadevol13 := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadevolpat(const Value: TCmDbField);
begin
  FPlacontadevolpat := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadprovadt(const Value: TCmDbField);
begin
  FPlacontadprovadt := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadprovis(const Value: TCmDbField);
begin
  FPlacontadprovis := Value;
end;

procedure TDBContribPrevPartP.SetPlacontadprovis13(
  const Value: TCmDbField);
begin
  FPlacontadprovis13 := Value;
end;

procedure TDBContribPrevPartP.SetPlacontaoutromes(const Value: TCmDbField);
begin
  FPlacontaoutromes := Value;
end;

procedure TDBContribPrevPartP.SetPlactaacjud(const Value: TCmDbField);
begin
  FPlactaacjud := Value;
end;

procedure TDBContribPrevPartP.SetPlactaacjud13(const Value: TCmDbField);
begin
  FPlactaacjud13 := Value;
end;

procedure TDBContribPrevPartP.SetPlactaoutromes13(const Value: TCmDbField);
begin
  FPlactaoutromes13 := Value;
end;

procedure TDBContribPrevPartP.SetPlactcprovadt13(const Value: TCmDbField);
begin
  FPlactcprovadt13 := Value;
end;

procedure TDBContribPrevPartP.SetPlactdevolpat13(const Value: TCmDbField);
begin
  FPlactdevolpat13 := Value;
end;

procedure TDBContribPrevPartP.SetPlactdprovadt13(const Value: TCmDbField);
begin
  FPlactdprovadt13 := Value;
end;

procedure TDBContribPrevPartP.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDBContribPrevPartP.SetPlano13(const Value: TCmDbField);
begin
  FPlano13 := Value;
end;

procedure TDBContribPrevPartP.SetPlanoprovis(const Value: TCmDbField);
begin
  FPlanoprovis := Value;
end;

procedure TDBContribPrevPartP.SetPrazodiferimento(const Value: TCmDbField);
begin
  FPrazodiferimento := Value;
end;

procedure TDBContribPrevPartP.SetQtdeparcelas(const Value: TCmDbField);
begin
  FQtdeparcelas := Value;
end;

procedure TDBContribPrevPartP.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDBContribPrevPartP.SetRecpag13(const Value: TCmDbField);
begin
  FRecpag13 := Value;
end;

procedure TDBContribPrevPartP.SetRecpagadt(const Value: TCmDbField);
begin
  FRecpagadt := Value;
end;

procedure TDBContribPrevPartP.SetRecpagdesemb(const Value: TCmDbField);
begin
  FRecpagdesemb := Value;
end;

procedure TDBContribPrevPartP.SetRecpagdesembprov(const Value: TCmDbField);
begin
  FRecpagdesembprov := Value;
end;

procedure TDBContribPrevPartP.SetRecpagdevol(const Value: TCmDbField);
begin
  FRecpagdevol := Value;
end;

procedure TDBContribPrevPartP.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDBContribPrevPartP.SetTempocontrib(const Value: TCmDbField);
begin
  FTempocontrib := Value;
end;

procedure TDBContribPrevPartP.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDBContribPrevPartP.SetTipcodigo13(const Value: TCmDbField);
begin
  FTipcodigo13 := Value;
end;

procedure TDBContribPrevPartP.SetTmppagtorenda(const Value: TCmDbField);
begin
  FTmppagtorenda := Value;
end;

procedure TDBContribPrevPartP.SetUltano13(const Value: TCmDbField);
begin
  FUltano13 := Value;
end;

procedure TDBContribPrevPartP.SetUltmespreparo(const Value: TCmDbField);
begin
  FUltmespreparo := Value;
end;

procedure TDBContribPrevPartP.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDBContribPrevPartP.SetUnidnegoc13(const Value: TCmDbField);
begin
  FUnidnegoc13 := Value;
end;

procedure TDBContribPrevPartP.SetValorassociado(const Value: TCmDbField);
begin
  FValorassociado := Value;
end;

procedure TDBContribPrevPartP.SetValorassociado2(const Value: TCmDbField);
begin
  FValorassociado2 := Value;
end;

procedure TDBContribPrevPartP.SetValorassociado3(const Value: TCmDbField);
begin
  FValorassociado3 := Value;
end;

procedure TDBContribPrevPartP.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDBContribPrevPartP.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDBContribPrevPartP.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

procedure TDBContribPrevPartP.SetVlbenefreal(const Value: TCmDbField);
begin
  FVlbenefreal := Value;
end;

procedure TDBContribPrevPartP.SetVlcontreal(const Value: TCmDbField);
begin
  FVlcontreal := Value;
end;

procedure TDBContribPrevPartP.SetVlrcontcalculado(const Value: TCmDbField);
begin
  FVlrcontcalculado := Value;
end;

procedure TDBContribPrevPartP.SetVlrcontdigitado(const Value: TCmDbField);
begin
  FVlrcontdigitado := Value;
end;

end.



