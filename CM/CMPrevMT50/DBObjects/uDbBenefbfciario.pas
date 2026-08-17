{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/02/2006                             }
{                                                       }
{*******************************************************}

unit uDbBenefbfciario;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase, uDbBenefPlanoPart;

Type
  TDbBenefbfciario = class(TCmDbObject)

  private
    FCodcentrorespon: TCmDbField;
    FDatafinalprevista: TCmDbField;
    FValorbase1: TCmDbField;
    FDataemissaorecad: TCmDbField;
    FIdsitbeneficio: TCmDbField;
    FFlgencerraporfale: TCmDbField;
    FIddependencia: TCmDbField;
    FDfloatpagto: TCmDbField;
    FPrazoprovisorio: TCmDbField;
    FPlacontac: TCmDbField;
    FIdplanoprev: TCmDbField;
    FPlacontadprovis: TCmDbField;
    FValorbase3: TCmDbField;
    FIdagenciaresgate: TCmDbField;
    FFlgmoveureserva: TCmDbField;
    FIdpessoa: TCmDbField;
    FFontepagadora: TCmDbField;
    FDataencerramento: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FUltvaloratualreaj: TCmDbField;
    FBancoinss: TCmDbField;
    FDatainicioinss: TCmDbField;
    FFlgbenefmin: TCmDbField;
    FDatarequerimento: TCmDbField;
    FIdempresapropabn: TCmDbField;
    FCodrecebcapabn: TCmDbField;
    FValorbinss3: TCmDbField;
    FCodtiprecdesabn: TCmDbField;
    FIdpessjur: TCmDbField;
    FValorbinssant3: TCmDbField;
    FMesreciboinss: TCmDbField;
    FDatarecebrecad: TCmDbField;
    FPlacontacabn: TCmDbField;
    FIdplanoorigem: TCmDbField;
    FFlgprovisorio: TCmDbField;
    FMotivocancelamen: TCmDbField;
    FValorbinss2: TCmDbField;
    FNumprocinss: TCmDbField;
    FIdbenefreferen: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPlactaacjud13: TCmDbField;
    FCodtiprecdesadt: TCmDbField;
    FValoratual: TCmDbField;
    FDataultrevisao: TCmDbField;
    FValorbinssant1: TCmDbField;
    FFlgdataprevista: TCmDbField;
    FFlgstatus: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FValorcotas: TCmDbField;
    FSeqproposta: TCmDbField;
    FMespagliberacao: TCmDbField;
    FCodcentrorespona: TCmDbField;
    FTmppagtobeneficio: TCmDbField;
    FDataliberacao: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FCodtipdesembprov: TCmDbField;
    FUnidnegocabn: TCmDbField;
    FIdtitular: TCmDbField;
    FIdbeneficio: TCmDbField;
    FCodtiprecebcap13: TCmDbField;
    FPlacontacprovis: TCmDbField;
    FPlano: TCmDbField;
    FIdempresaprop: TCmDbField;
    FPercprovisorio: TCmDbField;
    FNumeroprocesso: TCmDbField;
    FIdtppagtobenefic: TCmDbField;
    FPlacontadprovadt: TCmDbField;
    FIdplanprevcontab: TCmDbField;
    FDibbenefant: TCmDbField;
    FValorabono13: TCmDbField;
    FRecpagdesemb: TCmDbField;
    FPlactaacjud: TCmDbField;
    FFlgpossuiacompinss: TCmDbField;
    FPlacontad: TCmDbField;
    FValorbase2: TCmDbField;
    FValornadib: TCmDbField;
    FUltmespreparo: TCmDbField;
    FCodportformaabn: TCmDbField;
    FFlgpagainss: TCmDbField;
    FPlacontacprovadt: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FDataultreajuste: TCmDbField;
    FPlacontadadt13: TCmDbField;
    FFlgtipoinss: TCmDbField;
    FIdempresadesemb: TCmDbField;
    FDatainiciofund: TCmDbField;
    FVlrcalcinss: TCmDbField;
    FDatainicio: TCmDbField;
    FCodsubconta: TCmDbField;
    FCodtiprecebdevol: TCmDbField;
    FValortotal: TCmDbField;
    FTipcodigo: TCmDbField;
    FPercentual: TCmDbField;
    FDatalimiterecad: TCmDbField;
    FFlgformapagto: TCmDbField;
    FIdtitbenef: TCmDbField;
    FFlgdescirmes: TCmDbField;
    FFlgacertocbp: TCmDbField;
    FUltvalorbruto: TCmDbField;
    FValorbinssant2: TCmDbField;
    FValorcalculado: TCmDbField;
    FValorsrb: TCmDbField;
    FPercparticipacao: TCmDbField;
    FValorbinss1: TCmDbField;
    FCodportforma: TCmDbField;
    FCodtiprecebcap: TCmDbField;
    FDatafinal: TCmDbField;
    FAnoreciboinss: TCmDbField;
    FPlacontadabn: TCmDbField;
    FIdadeingresso: TCmDbField;
    FRecpag: TCmDbField;
    FValorbenefant: TCmDbField;
    FDataconcessao: TCmDbField;
    FCodsubcontaabn: TCmDbField;
    FVlrinfinss: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FUltmesreajuste: TCmDbField;
    FNumcartarecad: TCmDbField;
    FIdempresa: TCmDbField;

    FDbBenefPlanoPart    : TDbBenefPlanoPart;

    procedure SetAnoreciboinss(const Value: TCmDbField);
    procedure SetBancoinss(const Value: TCmDbField);
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodcentrorespona(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodportformaabn(const Value: TCmDbField);
    procedure SetCodrecebcapabn(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodsubcontaabn(const Value: TCmDbField);
    procedure SetCodtipdesembprov(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetCodtiprecdesabn(const Value: TCmDbField);
    procedure SetCodtiprecdesadt(const Value: TCmDbField);
    procedure SetCodtiprecebcap(const Value: TCmDbField);
    procedure SetCodtiprecebcap13(const Value: TCmDbField);
    procedure SetCodtiprecebdevol(const Value: TCmDbField);
    procedure SetDataconcessao(const Value: TCmDbField);
    procedure SetDataemissaorecad(const Value: TCmDbField);
    procedure SetDataencerramento(const Value: TCmDbField);
    procedure SetDatafinal(const Value: TCmDbField);
    procedure SetDatafinalprevista(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetDatainiciofund(const Value: TCmDbField);
    procedure SetDatainicioinss(const Value: TCmDbField);
    procedure SetDataliberacao(const Value: TCmDbField);
    procedure SetDatalimiterecad(const Value: TCmDbField);
    procedure SetDatarecebrecad(const Value: TCmDbField);
    procedure SetDatarequerimento(const Value: TCmDbField);
    procedure SetDataultreajuste(const Value: TCmDbField);
    procedure SetDataultrevisao(const Value: TCmDbField);
    procedure SetDfloatpagto(const Value: TCmDbField);
    procedure SetDibbenefant(const Value: TCmDbField);
    procedure SetFlgacertocbp(const Value: TCmDbField);
    procedure SetFlgbenefmin(const Value: TCmDbField);
    procedure SetFlgdataprevista(const Value: TCmDbField);
    procedure SetFlgdescirmes(const Value: TCmDbField);
    procedure SetFlgencerraporfale(const Value: TCmDbField);
    procedure SetFlgformapagto(const Value: TCmDbField);
    procedure SetFlgmoveureserva(const Value: TCmDbField);
    procedure SetFlgpagainss(const Value: TCmDbField);
    procedure SetFlgpossuiacompinss(const Value: TCmDbField);
    procedure SetFlgprovisorio(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetFlgtipoinss(const Value: TCmDbField);
    procedure SetFontepagadora(const Value: TCmDbField);
    procedure SetIdadeingresso(const Value: TCmDbField);
    procedure SetIdagenciaresgate(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdbenefreferen(const Value: TCmDbField);
    procedure SetIddependencia(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdempresadesemb(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdempresapropabn(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoorigem(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdplanprevcontab(const Value: TCmDbField);
    procedure SetIdsitbeneficio(const Value: TCmDbField);
    procedure SetIdtitbenef(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetIdtppagtobenefic(const Value: TCmDbField);
    procedure SetMespagliberacao(const Value: TCmDbField);
    procedure SetMesreciboinss(const Value: TCmDbField);
    procedure SetMotivocancelamen(const Value: TCmDbField);
    procedure SetNumcartarecad(const Value: TCmDbField);
    procedure SetNumeroprocesso(const Value: TCmDbField);
    procedure SetNumprocinss(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPercparticipacao(const Value: TCmDbField);
    procedure SetPercprovisorio(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontacabn(const Value: TCmDbField);
    procedure SetPlacontacprovadt(const Value: TCmDbField);
    procedure SetPlacontacprovis(const Value: TCmDbField);
    procedure SetPlacontad(const Value: TCmDbField);
    procedure SetPlacontadabn(const Value: TCmDbField);
    procedure SetPlacontadadt13(const Value: TCmDbField);
    procedure SetPlacontadprovadt(const Value: TCmDbField);
    procedure SetPlacontadprovis(const Value: TCmDbField);
    procedure SetPlactaacjud(const Value: TCmDbField);
    procedure SetPlactaacjud13(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPrazoprovisorio(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetRecpagdesemb(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetTmppagtobeneficio(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetUltmespreparo(const Value: TCmDbField);
    procedure SetUltmesreajuste(const Value: TCmDbField);
    procedure SetUltvaloratualreaj(const Value: TCmDbField);
    procedure SetUltvalorbruto(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetUnidnegocabn(const Value: TCmDbField);
    procedure SetValorabono13(const Value: TCmDbField);
    procedure SetValoratual(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);
    procedure SetValorbenefant(const Value: TCmDbField);
    procedure SetValorbinss1(const Value: TCmDbField);
    procedure SetValorbinss2(const Value: TCmDbField);
    procedure SetValorbinss3(const Value: TCmDbField);
    procedure SetValorbinssant1(const Value: TCmDbField);
    procedure SetValorbinssant2(const Value: TCmDbField);
    procedure SetValorbinssant3(const Value: TCmDbField);
    procedure SetValorcalculado(const Value: TCmDbField);
    procedure SetValorcotas(const Value: TCmDbField);
    procedure SetValornadib(const Value: TCmDbField);
    procedure SetValorsrb(const Value: TCmDbField);
    procedure SetValortotal(const Value: TCmDbField);
    procedure SetVlrcalcinss(const Value: TCmDbField);
    procedure SetVlrinfinss(const Value: TCmDbField);
    procedure SetDbBenefPlanoPart(const Value: TDbBenefPlanoPart);

  public

     Property Vlrinfinss: TCmDbField read FVlrinfinss write SetVlrinfinss;
     Property Vlrcalcinss: TCmDbField read FVlrcalcinss write SetVlrcalcinss;
     Property Valortotal: TCmDbField read FValortotal write SetValortotal;
     Property Valorsrb: TCmDbField read FValorsrb write SetValorsrb;
     Property Valornadib: TCmDbField read FValornadib write SetValornadib;
     Property Valorcotas: TCmDbField read FValorcotas write SetValorcotas;
     Property Valorcalculado: TCmDbField read FValorcalculado write SetValorcalculado;
     Property Valorbinss3: TCmDbField read FValorbinss3 write SetValorbinss3;
     Property Valorbinss2: TCmDbField read FValorbinss2 write SetValorbinss2;
     Property Valorbinss1: TCmDbField read FValorbinss1 write SetValorbinss1;
     Property Valorbinssant3: TCmDbField read FValorbinssant3 write SetValorbinssant3;
     Property Valorbinssant2: TCmDbField read FValorbinssant2 write SetValorbinssant2;
     Property Valorbinssant1: TCmDbField read FValorbinssant1 write SetValorbinssant1;
     Property Valorbenefant: TCmDbField read FValorbenefant write SetValorbenefant;
     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Valoratual: TCmDbField read FValoratual write SetValoratual;
     Property Valorabono13: TCmDbField read FValorabono13 write SetValorabono13;
     Property Unidnegocabn: TCmDbField read FUnidnegocabn write SetUnidnegocabn;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Ultvalorbruto: TCmDbField read FUltvalorbruto write SetUltvalorbruto;
     Property Ultvaloratualreaj: TCmDbField read FUltvaloratualreaj write SetUltvaloratualreaj;
     Property Ultmesreajuste: TCmDbField read FUltmesreajuste write SetUltmesreajuste;
     Property Ultmespreparo: TCmDbField read FUltmespreparo write SetUltmespreparo;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tmppagtobeneficio: TCmDbField read FTmppagtobeneficio write SetTmppagtobeneficio;
     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Recpagdesemb: TCmDbField read FRecpagdesemb write SetRecpagdesemb;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Prazoprovisorio: TCmDbField read FPrazoprovisorio write SetPrazoprovisorio;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Plactaacjud13: TCmDbField read FPlactaacjud13 write SetPlactaacjud13;
     Property Plactaacjud: TCmDbField read FPlactaacjud write SetPlactaacjud;
     Property Placontadprovis: TCmDbField read FPlacontadprovis write SetPlacontadprovis;
     Property Placontadprovadt: TCmDbField read FPlacontadprovadt write SetPlacontadprovadt;
     Property Placontadadt13: TCmDbField read FPlacontadadt13 write SetPlacontadadt13;
     Property Placontadabn: TCmDbField read FPlacontadabn write SetPlacontadabn;
     Property Placontad: TCmDbField read FPlacontad write SetPlacontad;
     Property Placontacprovis: TCmDbField read FPlacontacprovis write SetPlacontacprovis;
     Property Placontacprovadt: TCmDbField read FPlacontacprovadt write SetPlacontacprovadt;
     Property Placontacabn: TCmDbField read FPlacontacabn write SetPlacontacabn;
     Property Placontac: TCmDbField read FPlacontac write SetPlacontac;
     Property Percprovisorio: TCmDbField read FPercprovisorio write SetPercprovisorio;
     Property Percparticipacao: TCmDbField read FPercparticipacao write SetPercparticipacao;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Numprocinss: TCmDbField read FNumprocinss write SetNumprocinss;
     Property Numeroprocesso: TCmDbField read FNumeroprocesso write SetNumeroprocesso;
     Property Numcartarecad: TCmDbField read FNumcartarecad write SetNumcartarecad;
     Property Motivocancelamen: TCmDbField read FMotivocancelamen write SetMotivocancelamen;
     Property Mesreciboinss: TCmDbField read FMesreciboinss write SetMesreciboinss;
     Property Mespagliberacao: TCmDbField read FMespagliberacao write SetMespagliberacao;
     Property Idtppagtobenefic: TCmDbField read FIdtppagtobenefic write SetIdtppagtobenefic;
     Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
     Property Idtitbenef: TCmDbField read FIdtitbenef write SetIdtitbenef;
     Property Idsitbeneficio: TCmDbField read FIdsitbeneficio write SetIdsitbeneficio;
     Property Idplanprevcontab: TCmDbField read FIdplanprevcontab write SetIdplanprevcontab;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanoorigem: TCmDbField read FIdplanoorigem write SetIdplanoorigem;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idempresapropabn: TCmDbField read FIdempresapropabn write SetIdempresapropabn;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Idempresadesemb: TCmDbField read FIdempresadesemb write SetIdempresadesemb;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Iddependencia: TCmDbField read FIddependencia write SetIddependencia;
     Property Idbenefreferen: TCmDbField read FIdbenefreferen write SetIdbenefreferen;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Idagenciaresgate: TCmDbField read FIdagenciaresgate write SetIdagenciaresgate;
     Property Idadeingresso: TCmDbField read FIdadeingresso write SetIdadeingresso;
     Property Fontepagadora: TCmDbField read FFontepagadora write SetFontepagadora;
     Property Flgtipoinss: TCmDbField read FFlgtipoinss write SetFlgtipoinss;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Flgprovisorio: TCmDbField read FFlgprovisorio write SetFlgprovisorio;
     Property Flgpossuiacompinss: TCmDbField read FFlgpossuiacompinss write SetFlgpossuiacompinss;
     Property Flgpagainss: TCmDbField read FFlgpagainss write SetFlgpagainss;
     Property Flgmoveureserva: TCmDbField read FFlgmoveureserva write SetFlgmoveureserva;
     Property Flgformapagto: TCmDbField read FFlgformapagto write SetFlgformapagto;
     Property Flgencerraporfale: TCmDbField read FFlgencerraporfale write SetFlgencerraporfale;
     Property Flgdescirmes: TCmDbField read FFlgdescirmes write SetFlgdescirmes;
     Property Flgdataprevista: TCmDbField read FFlgdataprevista write SetFlgdataprevista;
     Property Flgbenefmin: TCmDbField read FFlgbenefmin write SetFlgbenefmin;
     Property Flgacertocbp: TCmDbField read FFlgacertocbp write SetFlgacertocbp;
     Property Dibbenefant: TCmDbField read FDibbenefant write SetDibbenefant;
     Property Dfloatpagto: TCmDbField read FDfloatpagto write SetDfloatpagto;
     Property Dataultrevisao: TCmDbField read FDataultrevisao write SetDataultrevisao;
     Property Dataultreajuste: TCmDbField read FDataultreajuste write SetDataultreajuste;
     Property Datarequerimento: TCmDbField read FDatarequerimento write SetDatarequerimento;
     Property Datarecebrecad: TCmDbField read FDatarecebrecad write SetDatarecebrecad;
     Property Datalimiterecad: TCmDbField read FDatalimiterecad write SetDatalimiterecad;
     Property Dataliberacao: TCmDbField read FDataliberacao write SetDataliberacao;
     Property Datainicioinss: TCmDbField read FDatainicioinss write SetDatainicioinss;
     Property Datainiciofund: TCmDbField read FDatainiciofund write SetDatainiciofund;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafinalprevista: TCmDbField read FDatafinalprevista write SetDatafinalprevista;
     Property Datafinal: TCmDbField read FDatafinal write SetDatafinal;
     Property Dataencerramento: TCmDbField read FDataencerramento write SetDataencerramento;
     Property Dataemissaorecad: TCmDbField read FDataemissaorecad write SetDataemissaorecad;
     Property Dataconcessao: TCmDbField read FDataconcessao write SetDataconcessao;
     Property Codtiprecebdevol: TCmDbField read FCodtiprecebdevol write SetCodtiprecebdevol;
     Property Codtiprecebcap13: TCmDbField read FCodtiprecebcap13 write SetCodtiprecebcap13;
     Property Codtiprecebcap: TCmDbField read FCodtiprecebcap write SetCodtiprecebcap;
     Property Codtiprecdesadt: TCmDbField read FCodtiprecdesadt write SetCodtiprecdesadt;
     Property Codtiprecdesabn: TCmDbField read FCodtiprecdesabn write SetCodtiprecdesabn;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codtipdesembprov: TCmDbField read FCodtipdesembprov write SetCodtipdesembprov;
     Property Codsubcontaabn: TCmDbField read FCodsubcontaabn write SetCodsubcontaabn;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codrecebcapabn: TCmDbField read FCodrecebcapabn write SetCodrecebcapabn;
     Property Codportformaabn: TCmDbField read FCodportformaabn write SetCodportformaabn;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codcentrorespona: TCmDbField read FCodcentrorespona write SetCodcentrorespona;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocustod: TCmDbField read FCodcentrocustod write SetCodcentrocustod;
     Property Codcentrocustoc: TCmDbField read FCodcentrocustoc write SetCodcentrocustoc;
     Property Bancoinss: TCmDbField read FBancoinss write SetBancoinss;
     Property Anoreciboinss: TCmDbField read FAnoreciboinss write SetAnoreciboinss;

     Property DbBenefPlanoPart : TDbBenefPlanoPart read FDbBenefPlanoPart write SetDbBenefPlanoPart;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     Destructor Destroy; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefbfciario }

constructor TDbBenefbfciario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

   ErrorIfNoRowsAffected := False;

   TableName := 'BENEFBFCIARIO';

   fVlrinfinss := CreateCmDbField('VLRINFINSS',ftfloat,False,False,False,True,'');
   fVlrcalcinss := CreateCmDbField('VLRCALCINSS',ftfloat,False,False,False,True,'');
   fValortotal := CreateCmDbField('VALORTOTAL',ftfloat,False,False,False,True,'');
   fValorsrb := CreateCmDbField('VALORSRB',ftfloat,False,False,False,True,'');
   fValornadib := CreateCmDbField('VALORNADIB',ftfloat,False,False,False,True,'');
   fValorcotas := CreateCmDbField('VALORCOTAS',ftfloat,False,False,False,True,'');
   fValorcalculado := CreateCmDbField('VALORCALCULADO',ftfloat,False,False,False,True,'');
   fValorbinss3 := CreateCmDbField('VALORBINSS3',ftfloat,False,False,False,True,'');
   fValorbinss2 := CreateCmDbField('VALORBINSS2',ftfloat,False,False,False,True,'');
   fValorbinss1 := CreateCmDbField('VALORBINSS1',ftfloat,False,False,False,True,'');
   fValorbinssant3 := CreateCmDbField('VALORBINSSANT3',ftfloat,False,False,False,True,'');
   fValorbinssant2 := CreateCmDbField('VALORBINSSANT2',ftfloat,False,False,False,True,'');
   fValorbinssant1 := CreateCmDbField('VALORBINSSANT1',ftfloat,False,False,False,True,'');
   fValorbenefant := CreateCmDbField('VALORBENEFANT',ftfloat,False,False,False,True,'');
   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fValoratual := CreateCmDbField('VALORATUAL',ftfloat,False,False,False,True,'');
   fValorabono13 := CreateCmDbField('VALORABONO13',ftfloat,False,False,False,True,'');
   fUnidnegocabn := CreateCmDbField('UNIDNEGOCABN',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fUltvalorbruto := CreateCmDbField('ULTVALORBRUTO',ftfloat,False,False,False,True,'');
   fUltvaloratualreaj := CreateCmDbField('ULTVALORATUALREAJ',ftfloat,False,False,False,True,'');
   fUltmesreajuste := CreateCmDbField('ULTMESREAJUSTE',ftString,False,False,False,True,'');
   fUltmespreparo := CreateCmDbField('ULTMESPREPARO',ftString,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTmppagtobeneficio := CreateCmDbField('TMPPAGTOBENEFICIO',ftfloat,False,False,False,True,'');
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fRecpagdesemb := CreateCmDbField('RECPAGDESEMB',ftString,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPrazoprovisorio := CreateCmDbField('PRAZOPROVISORIO',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlactaacjud13 := CreateCmDbField('PLACTAACJUD13',ftString,False,False,False,True,'');
   fPlactaacjud := CreateCmDbField('PLACTAACJUD',ftString,False,False,False,True,'');
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,False,False,False,True,'');
   fPlacontadprovadt := CreateCmDbField('PLACONTADPROVADT',ftString,False,False,False,True,'');
   fPlacontadadt13 := CreateCmDbField('PLACONTADADT13',ftString,False,False,False,True,'');
   fPlacontadabn := CreateCmDbField('PLACONTADABN',ftString,False,False,False,True,'');
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,False,False,False,True,'');
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,False,False,False,True,'');
   fPlacontacprovadt := CreateCmDbField('PLACONTACPROVADT',ftString,False,False,False,True,'');
   fPlacontacabn := CreateCmDbField('PLACONTACABN',ftString,False,False,False,True,'');
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
   fPercprovisorio := CreateCmDbField('PERCPROVISORIO',ftfloat,False,False,False,True,'');
   fPercparticipacao := CreateCmDbField('PERCPARTICIPACAO',ftfloat,False,False,False,True,'');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
   fNumprocinss := CreateCmDbField('NUMPROCINSS',ftString,False,False,False,True,'');
   fNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,True,True,False,True,'');
   fNumcartarecad := CreateCmDbField('NUMCARTARECAD',ftString,False,False,False,True,'');
   fMotivocancelamen := CreateCmDbField('MOTIVOCANCELAMEN',ftBlob,False,False,False,True,'');
   fMesreciboinss := CreateCmDbField('MESRECIBOINSS',ftfloat,False,False,False,True,'');
   fMespagliberacao := CreateCmDbField('MESPAGLIBERACAO',ftString,False,False,False,True,'');
   fIdtppagtobenefic := CreateCmDbField('IDTPPAGTOBENEFIC',ftfloat,False,False,False,True,'');
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,True,False,True,'');
   fIdtitbenef := CreateCmDbField('IDTITBENEF',ftfloat,False,False,False,True,'');
   fIdsitbeneficio := CreateCmDbField('IDSITBENEFICIO',ftfloat,True,False,False,True,'');
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanoorigem := CreateCmDbField('IDPLANOORIGEM',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdempresapropabn := CreateCmDbField('IDEMPRESAPROPABN',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresadesemb := CreateCmDbField('IDEMPRESADESEMB',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIddependencia := CreateCmDbField('IDDEPENDENCIA',ftString,False,False,False,True,'');
   fIdbenefreferen := CreateCmDbField('IDBENEFREFEREN',ftfloat,False,False,False,True,'');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,True,True,False,True,'');
   fIdagenciaresgate := CreateCmDbField('IDAGENCIARESGATE',ftfloat,False,False,False,True,'');
   fIdadeingresso := CreateCmDbField('IDADEINGRESSO',ftfloat,False,False,False,True,'');
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,False,False,False,True,'');
   fFlgtipoinss := CreateCmDbField('FLGTIPOINSS',ftfloat,False,False,False,True,'');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fFlgprovisorio := CreateCmDbField('FLGPROVISORIO',ftfloat,False,False,False,True,'');
   fFlgpossuiacompinss := CreateCmDbField('FLGPOSSUIACOMPINSS',ftfloat,False,False,False,True,'');
   fFlgpagainss := CreateCmDbField('FLGPAGAINSS',ftfloat,False,False,False,True,'');
   fFlgmoveureserva := CreateCmDbField('FLGMOVEURESERVA',ftfloat,False,False,False,True,'');
   fFlgformapagto := CreateCmDbField('FLGFORMAPAGTO',ftString,True,False,False,True,'');
   fFlgencerraporfale := CreateCmDbField('FLGENCERRAPORFALE',ftfloat,False,False,False,True,'');
   fFlgdescirmes := CreateCmDbField('FLGDESCIRMES',ftfloat,False,False,False,True,'');
   fFlgdataprevista := CreateCmDbField('FLGDATAPREVISTA',ftfloat,False,False,False,True,'');
   fFlgbenefmin := CreateCmDbField('FLGBENEFMIN',ftfloat,False,False,False,True,'');
   fFlgacertocbp := CreateCmDbField('FLGACERTOCBP',ftfloat,False,False,False,True,'');
   fDibbenefant := CreateCmDbField('DIBBENEFANT',ftDateTime,False,False,False,True,'');
   fDfloatpagto := CreateCmDbField('DFLOATPAGTO',ftfloat,False,False,False,True,'');
   fDataultrevisao := CreateCmDbField('DATAULTREVISAO',ftDateTime,False,False,False,True,'');
   fDataultreajuste := CreateCmDbField('DATAULTREAJUSTE',ftDateTime,False,False,False,True,'');
   fDatarequerimento := CreateCmDbField('DATAREQUERIMENTO',ftDateTime,False,False,False,True,'');
   fDatarecebrecad := CreateCmDbField('DATARECEBRECAD',ftDateTime,False,False,False,True,'');
   fDatalimiterecad := CreateCmDbField('DATALIMITERECAD',ftDateTime,False,False,False,True,'');
   fDataliberacao := CreateCmDbField('DATALIBERACAO',ftDateTime,False,False,False,True,'');
   fDatainicioinss := CreateCmDbField('DATAINICIOINSS',ftDateTime,False,False,False,True,'');
   fDatainiciofund := CreateCmDbField('DATAINICIOFUND',ftDateTime,False,False,False,True,'');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
   fDatafinalprevista := CreateCmDbField('DATAFINALPREVISTA',ftDateTime,False,False,False,True,'');
   fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,False,False,False,True,'');
   fDataencerramento := CreateCmDbField('DATAENCERRAMENTO',ftDateTime,False,False,False,True,'');
   fDataemissaorecad := CreateCmDbField('DATAEMISSAORECAD',ftDateTime,False,False,False,True,'');
   fDataconcessao := CreateCmDbField('DATACONCESSAO',ftDateTime,False,False,False,True,'');
   fCodtiprecebdevol := CreateCmDbField('CODTIPRECEBDEVOL',ftString,False,False,False,True,'');
   fCodtiprecebcap13 := CreateCmDbField('CODTIPRECEBCAP13',ftString,False,False,False,True,'');
   fCodtiprecebcap := CreateCmDbField('CODTIPRECEBCAP',ftString,False,False,False,True,'');
   fCodtiprecdesadt := CreateCmDbField('CODTIPRECDESADT',ftString,False,False,False,True,'');
   fCodtiprecdesabn := CreateCmDbField('CODTIPRECDESABN',ftString,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodtipdesembprov := CreateCmDbField('CODTIPDESEMBPROV',ftString,False,False,False,True,'');
   fCodsubcontaabn := CreateCmDbField('CODSUBCONTAABN',ftfloat,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodrecebcapabn := CreateCmDbField('CODRECEBCAPABN',ftString,False,False,False,True,'');
   fCodportformaabn := CreateCmDbField('CODPORTFORMAABN',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodcentrorespona := CreateCmDbField('CODCENTRORESPONA',ftString,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
   fBancoinss := CreateCmDbField('BANCOINSS',ftString,False,False,False,True,'');
   fAnoreciboinss := CreateCmDbField('ANORECIBOINSS',ftfloat,False,False,False,True,'');

   FDbBenefPlanoPart     := TDbBenefPlanoPart.Create(AOwner);

end;

destructor TDbBenefbfciario.Destroy;
begin

  FDbBenefPlanoPart.Free; 

  inherited;


end;

function TDbBenefbfciario.Insert: Boolean;
begin

   fSeqproposta.AsFloat := GetSequence('BENEFBFCIARIO');
   fNumeroprocesso.AsFloat := GetSequence('BENEFBFCIARIO');
   fIdtitular.AsFloat := GetSequence('BENEFBFCIARIO');
   fIdplanoprev.AsFloat := GetSequence('BENEFBFCIARIO');
   fIdplanoorigem.AsFloat := GetSequence('BENEFBFCIARIO');
   fIdpessoa.AsFloat := GetSequence('BENEFBFCIARIO');
   fIdpessjur.AsFloat := GetSequence('BENEFBFCIARIO');
   fIdbeneficio.AsFloat := GetSequence('BENEFBFCIARIO');
   Result := Inherited Insert;

end;


function TDbBenefbfciario.LoadFromDb: Boolean;
begin

  Inherited LoadFromDb;

  If ( FIdtitular.AsInteger = FIdpessoa.AsInteger ) Then
  Begin

    FDbBenefPlanoPart.DataBaseName := FDataBaseName;

    FDbBenefPlanoPart.Clear;

    FDbBenefPlanoPart.Idpessjur.AsInteger   := FIdpessjur.AsInteger;
    FDbBenefPlanoPart.Idplanoprev.AsInteger := FIdplanoprev.AsInteger;
    FDbBenefPlanoPart.IdPessoa.AsInteger    := FIdpessoa.AsInteger;
    FDbBenefPlanoPart.SeqProposta.AsInteger := FSeqproposta.AsInteger;
    FDbBenefPlanoPart.IdBeneficio.AsInteger := FIdbeneficio.AsInteger;

    FDbBenefPlanoPart.LoadFromDb;

  End;

end;

procedure TDbBenefbfciario.SetAnoreciboinss(const Value: TCmDbField);
begin
  FAnoreciboinss := Value;
end;

procedure TDbBenefbfciario.SetBancoinss(const Value: TCmDbField);
begin
  FBancoinss := Value;
end;

procedure TDbBenefbfciario.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDbBenefbfciario.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDbBenefbfciario.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbBenefbfciario.SetCodcentrorespona(const Value: TCmDbField);
begin
  FCodcentrorespona := Value;
end;

procedure TDbBenefbfciario.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbBenefbfciario.SetCodportformaabn(const Value: TCmDbField);
begin
  FCodportformaabn := Value;
end;

procedure TDbBenefbfciario.SetCodrecebcapabn(const Value: TCmDbField);
begin
  FCodrecebcapabn := Value;
end;

procedure TDbBenefbfciario.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbBenefbfciario.SetCodsubcontaabn(const Value: TCmDbField);
begin
  FCodsubcontaabn := Value;
end;

procedure TDbBenefbfciario.SetCodtipdesembprov(const Value: TCmDbField);
begin
  FCodtipdesembprov := Value;
end;

procedure TDbBenefbfciario.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbBenefbfciario.SetCodtiprecdesabn(const Value: TCmDbField);
begin
  FCodtiprecdesabn := Value;
end;

procedure TDbBenefbfciario.SetCodtiprecdesadt(const Value: TCmDbField);
begin
  FCodtiprecdesadt := Value;
end;

procedure TDbBenefbfciario.SetCodtiprecebcap(const Value: TCmDbField);
begin
  FCodtiprecebcap := Value;
end;

procedure TDbBenefbfciario.SetCodtiprecebcap13(const Value: TCmDbField);
begin
  FCodtiprecebcap13 := Value;
end;

procedure TDbBenefbfciario.SetCodtiprecebdevol(const Value: TCmDbField);
begin
  FCodtiprecebdevol := Value;
end;

procedure TDbBenefbfciario.SetDataconcessao(const Value: TCmDbField);
begin
  FDataconcessao := Value;
end;

procedure TDbBenefbfciario.SetDataemissaorecad(const Value: TCmDbField);
begin
  FDataemissaorecad := Value;
end;

procedure TDbBenefbfciario.SetDataencerramento(const Value: TCmDbField);
begin
  FDataencerramento := Value;
end;

procedure TDbBenefbfciario.SetDatafinal(const Value: TCmDbField);
begin
  FDatafinal := Value;
end;

procedure TDbBenefbfciario.SetDatafinalprevista(const Value: TCmDbField);
begin
  FDatafinalprevista := Value;
end;

procedure TDbBenefbfciario.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbBenefbfciario.SetDatainiciofund(const Value: TCmDbField);
begin
  FDatainiciofund := Value;
end;

procedure TDbBenefbfciario.SetDatainicioinss(const Value: TCmDbField);
begin
  FDatainicioinss := Value;
end;

procedure TDbBenefbfciario.SetDataliberacao(const Value: TCmDbField);
begin
  FDataliberacao := Value;
end;

procedure TDbBenefbfciario.SetDatalimiterecad(const Value: TCmDbField);
begin
  FDatalimiterecad := Value;
end;

procedure TDbBenefbfciario.SetDatarecebrecad(const Value: TCmDbField);
begin
  FDatarecebrecad := Value;
end;

procedure TDbBenefbfciario.SetDatarequerimento(const Value: TCmDbField);
begin
  FDatarequerimento := Value;
end;

procedure TDbBenefbfciario.SetDataultreajuste(const Value: TCmDbField);
begin
  FDataultreajuste := Value;
end;

procedure TDbBenefbfciario.SetDataultrevisao(const Value: TCmDbField);
begin
  FDataultrevisao := Value;
end;

procedure TDbBenefbfciario.SetDbBenefPlanoPart(
  const Value: TDbBenefPlanoPart);
begin
  FDbBenefPlanoPart := Value;
end;

procedure TDbBenefbfciario.SetDfloatpagto(const Value: TCmDbField);
begin
  FDfloatpagto := Value;
end;

procedure TDbBenefbfciario.SetDibbenefant(const Value: TCmDbField);
begin
  FDibbenefant := Value;
end;

procedure TDbBenefbfciario.SetFlgacertocbp(const Value: TCmDbField);
begin
  FFlgacertocbp := Value;
end;

procedure TDbBenefbfciario.SetFlgbenefmin(const Value: TCmDbField);
begin
  FFlgbenefmin := Value;
end;

procedure TDbBenefbfciario.SetFlgdataprevista(const Value: TCmDbField);
begin
  FFlgdataprevista := Value;
end;

procedure TDbBenefbfciario.SetFlgdescirmes(const Value: TCmDbField);
begin
  FFlgdescirmes := Value;
end;

procedure TDbBenefbfciario.SetFlgencerraporfale(const Value: TCmDbField);
begin
  FFlgencerraporfale := Value;
end;

procedure TDbBenefbfciario.SetFlgformapagto(const Value: TCmDbField);
begin
  FFlgformapagto := Value;
end;

procedure TDbBenefbfciario.SetFlgmoveureserva(const Value: TCmDbField);
begin
  FFlgmoveureserva := Value;
end;

procedure TDbBenefbfciario.SetFlgpagainss(const Value: TCmDbField);
begin
  FFlgpagainss := Value;
end;

procedure TDbBenefbfciario.SetFlgpossuiacompinss(const Value: TCmDbField);
begin
  FFlgpossuiacompinss := Value;
end;

procedure TDbBenefbfciario.SetFlgprovisorio(const Value: TCmDbField);
begin
  FFlgprovisorio := Value;
end;

procedure TDbBenefbfciario.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbBenefbfciario.SetFlgtipoinss(const Value: TCmDbField);
begin
  FFlgtipoinss := Value;
end;

procedure TDbBenefbfciario.SetFontepagadora(const Value: TCmDbField);
begin
  FFontepagadora := Value;
end;

procedure TDbBenefbfciario.SetIdadeingresso(const Value: TCmDbField);
begin
  FIdadeingresso := Value;
end;

procedure TDbBenefbfciario.SetIdagenciaresgate(const Value: TCmDbField);
begin
  FIdagenciaresgate := Value;
end;

procedure TDbBenefbfciario.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDbBenefbfciario.SetIdbenefreferen(const Value: TCmDbField);
begin
  FIdbenefreferen := Value;
end;

procedure TDbBenefbfciario.SetIddependencia(const Value: TCmDbField);
begin
  FIddependencia := Value;
end;

procedure TDbBenefbfciario.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbBenefbfciario.SetIdempresadesemb(const Value: TCmDbField);
begin
  FIdempresadesemb := Value;
end;

procedure TDbBenefbfciario.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbBenefbfciario.SetIdempresapropabn(const Value: TCmDbField);
begin
  FIdempresapropabn := Value;
end;

procedure TDbBenefbfciario.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbBenefbfciario.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbBenefbfciario.SetIdplanoorigem(const Value: TCmDbField);
begin
  FIdplanoorigem := Value;
end;

procedure TDbBenefbfciario.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbBenefbfciario.SetIdplanprevcontab(const Value: TCmDbField);
begin
  FIdplanprevcontab := Value;
end;

procedure TDbBenefbfciario.SetIdsitbeneficio(const Value: TCmDbField);
begin
  FIdsitbeneficio := Value;
end;

procedure TDbBenefbfciario.SetIdtitbenef(const Value: TCmDbField);
begin
  FIdtitbenef := Value;
end;

procedure TDbBenefbfciario.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDbBenefbfciario.SetIdtppagtobenefic(const Value: TCmDbField);
begin
  FIdtppagtobenefic := Value;
end;

procedure TDbBenefbfciario.SetMespagliberacao(const Value: TCmDbField);
begin
  FMespagliberacao := Value;
end;

procedure TDbBenefbfciario.SetMesreciboinss(const Value: TCmDbField);
begin
  FMesreciboinss := Value;
end;

procedure TDbBenefbfciario.SetMotivocancelamen(const Value: TCmDbField);
begin
  FMotivocancelamen := Value;
end;

procedure TDbBenefbfciario.SetNumcartarecad(const Value: TCmDbField);
begin
  FNumcartarecad := Value;
end;

procedure TDbBenefbfciario.SetNumeroprocesso(const Value: TCmDbField);
begin
  FNumeroprocesso := Value;
end;

procedure TDbBenefbfciario.SetNumprocinss(const Value: TCmDbField);
begin
  FNumprocinss := Value;
end;

procedure TDbBenefbfciario.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbBenefbfciario.SetPercparticipacao(const Value: TCmDbField);
begin
  FPercparticipacao := Value;
end;

procedure TDbBenefbfciario.SetPercprovisorio(const Value: TCmDbField);
begin
  FPercprovisorio := Value;
end;

procedure TDbBenefbfciario.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDbBenefbfciario.SetPlacontacabn(const Value: TCmDbField);
begin
  FPlacontacabn := Value;
end;

procedure TDbBenefbfciario.SetPlacontacprovadt(const Value: TCmDbField);
begin
  FPlacontacprovadt := Value;
end;

procedure TDbBenefbfciario.SetPlacontacprovis(const Value: TCmDbField);
begin
  FPlacontacprovis := Value;
end;

procedure TDbBenefbfciario.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDbBenefbfciario.SetPlacontadabn(const Value: TCmDbField);
begin
  FPlacontadabn := Value;
end;

procedure TDbBenefbfciario.SetPlacontadadt13(const Value: TCmDbField);
begin
  FPlacontadadt13 := Value;
end;

procedure TDbBenefbfciario.SetPlacontadprovadt(const Value: TCmDbField);
begin
  FPlacontadprovadt := Value;
end;

procedure TDbBenefbfciario.SetPlacontadprovis(const Value: TCmDbField);
begin
  FPlacontadprovis := Value;
end;

procedure TDbBenefbfciario.SetPlactaacjud(const Value: TCmDbField);
begin
  FPlactaacjud := Value;
end;

procedure TDbBenefbfciario.SetPlactaacjud13(const Value: TCmDbField);
begin
  FPlactaacjud13 := Value;
end;

procedure TDbBenefbfciario.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbBenefbfciario.SetPrazoprovisorio(const Value: TCmDbField);
begin
  FPrazoprovisorio := Value;
end;

procedure TDbBenefbfciario.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbBenefbfciario.SetRecpagdesemb(const Value: TCmDbField);
begin
  FRecpagdesemb := Value;
end;

procedure TDbBenefbfciario.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDbBenefbfciario.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbBenefbfciario.SetTmppagtobeneficio(const Value: TCmDbField);
begin
  FTmppagtobeneficio := Value;
end;

procedure TDbBenefbfciario.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbBenefbfciario.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbBenefbfciario.SetUltmespreparo(const Value: TCmDbField);
begin
  FUltmespreparo := Value;
end;

procedure TDbBenefbfciario.SetUltmesreajuste(const Value: TCmDbField);
begin
  FUltmesreajuste := Value;
end;

procedure TDbBenefbfciario.SetUltvaloratualreaj(const Value: TCmDbField);
begin
  FUltvaloratualreaj := Value;
end;

procedure TDbBenefbfciario.SetUltvalorbruto(const Value: TCmDbField);
begin
  FUltvalorbruto := Value;
end;

procedure TDbBenefbfciario.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbBenefbfciario.SetUnidnegocabn(const Value: TCmDbField);
begin
  FUnidnegocabn := Value;
end;

procedure TDbBenefbfciario.SetValorabono13(const Value: TCmDbField);
begin
  FValorabono13 := Value;
end;

procedure TDbBenefbfciario.SetValoratual(const Value: TCmDbField);
begin
  FValoratual := Value;
end;

procedure TDbBenefbfciario.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDbBenefbfciario.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDbBenefbfciario.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

procedure TDbBenefbfciario.SetValorbenefant(const Value: TCmDbField);
begin
  FValorbenefant := Value;
end;

procedure TDbBenefbfciario.SetValorbinss1(const Value: TCmDbField);
begin
  FValorbinss1 := Value;
end;

procedure TDbBenefbfciario.SetValorbinss2(const Value: TCmDbField);
begin
  FValorbinss2 := Value;
end;

procedure TDbBenefbfciario.SetValorbinss3(const Value: TCmDbField);
begin
  FValorbinss3 := Value;
end;

procedure TDbBenefbfciario.SetValorbinssant1(const Value: TCmDbField);
begin
  FValorbinssant1 := Value;
end;

procedure TDbBenefbfciario.SetValorbinssant2(const Value: TCmDbField);
begin
  FValorbinssant2 := Value;
end;

procedure TDbBenefbfciario.SetValorbinssant3(const Value: TCmDbField);
begin
  FValorbinssant3 := Value;
end;

procedure TDbBenefbfciario.SetValorcalculado(const Value: TCmDbField);
begin
  FValorcalculado := Value;
end;

procedure TDbBenefbfciario.SetValorcotas(const Value: TCmDbField);
begin
  FValorcotas := Value;
end;

procedure TDbBenefbfciario.SetValornadib(const Value: TCmDbField);
begin
  FValornadib := Value;
end;

procedure TDbBenefbfciario.SetValorsrb(const Value: TCmDbField);
begin
  FValorsrb := Value;
end;

procedure TDbBenefbfciario.SetValortotal(const Value: TCmDbField);
begin
  FValortotal := Value;
end;

procedure TDbBenefbfciario.SetVlrcalcinss(const Value: TCmDbField);
begin
  FVlrcalcinss := Value;
end;

procedure TDbBenefbfciario.SetVlrinfinss(const Value: TCmDbField);
begin
  FVlrinfinss := Value;
end;

end.



