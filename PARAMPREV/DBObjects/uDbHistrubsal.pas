{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/10/2005                             }
{                                                       }
{*******************************************************}

unit uDbHistrubsal;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistrubsal = class(TCmDbObject)

  private
    FNumprocinss: TCmDbField;
    FIdlancirrfestorno: TCmDbField;
    FPercentualnadib: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdpatro: TCmDbField;
    FIdlancirrf: TCmDbField;
    FParcelas: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdversaopagto: TCmDbField;
    FValornadib: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FTipoitempcs: TCmDbField;
    FFlgirrftotal: TCmDbField;
    FPlacontad: TCmDbField;
    FReferencia: TCmDbField;
    FIdpessjur: TCmDbField;
    FFlgisentoirrf: TCmDbField;
    FCodprovdesc: TCmDbField;
    FValorrecebido: TCmDbField;
    FCodsubconta: TCmDbField;
    FIdfavorecido: TCmDbField;
    FFlgmolestiagrave: TCmDbField;
    FValorcotas: TCmDbField;
    FValorinfo: TCmDbField;
    FFlgpensaoalim: TCmDbField;
    FPlano: TCmDbField;
    FIdresponnaorec: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgtipodesc: TCmDbField;
    FSeqrubrica: TCmDbField;
    FIdretroativo: TCmDbField;
    FMescobranca: TCmDbField;
    FIdhstfolhabenef: TCmDbField;
    FNumbanco: TCmDbField;
    FCodmoeda: TCmDbField;
    FFlgsrb: TCmDbField;
    FCoddocumento: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FFlgsalbenefretro: TCmDbField;
    FLoteoriginal: TCmDbField;
    FValorintegral: TCmDbField;
    FIdregracalculo: TCmDbField;
    FFlgcompoeremtotal: TCmDbField;
    FFlgcompoesalbenef: TCmDbField;
    FValorprovento: TCmDbField;
    FPlacontac: TCmDbField;
    FIdmotivo: TCmDbField;
    FFlgsalpartretro: TCmDbField;
    FFlgirrf: TCmDbField;
    FNumdepirrf: TCmDbField;
    FIdrubrica: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FFontepagadora: TCmDbField;
    FFlgcompoesalpart: TCmDbField;
    FVlrantretroativo: TCmDbField;
    FFlgsalpartatuaria: TCmDbField;
    FIdinforme: TCmDbField;
    FFlgprevia: TCmDbField;
    FIdmodulo: TCmDbField;
    FSeqoriginal: TCmDbField;
    FPercentual: TCmDbField;
    FFlgespecial: TCmDbField;
    FDatapagamento: TCmDbField;
    FRecpag: TCmDbField;
    FNumeroprocesso: TCmDbField;
    FContacorrente: TCmDbField;
    FCodirrfdarf: TCmDbField;
    FIdcbancaria: TCmDbField;
    FNumdepsf: TCmDbField;
    FFlgconcessao: TCmDbField;
    FCodportforma: TCmDbField;
    FFlgdesconto: TCmDbField;
    FFlgsalfam: TCmDbField;
    FMes: TCmDbField;
    FFlgestorno: TCmDbField;
    FSeqhistfunc: TCmDbField;
    FFlgequiparacao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdtitular: TCmDbField;
    FIdplanoorigem: TCmDbField;
    FIdplanocontabil: TCmDbField;
    FOrdem: TCmDbField;
    FNumagencia: TCmDbField;
    FIdresponsavel: TCmDbField;
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodirrfdarf(const Value: TCmDbField);
    procedure SetCodmoeda(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodprovdesc(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetContacorrente(const Value: TCmDbField);
    procedure SetDatapagamento(const Value: TCmDbField);
    procedure SetFlgcompoeremtotal(const Value: TCmDbField);
    procedure SetFlgcompoesalbenef(const Value: TCmDbField);
    procedure SetFlgcompoesalpart(const Value: TCmDbField);
    procedure SetFlgconcessao(const Value: TCmDbField);
    procedure SetFlgdesconto(const Value: TCmDbField);
    procedure SetFlgequiparacao(const Value: TCmDbField);
    procedure SetFlgespecial(const Value: TCmDbField);
    procedure SetFlgestorno(const Value: TCmDbField);
    procedure SetFlgirrf(const Value: TCmDbField);
    procedure SetFlgirrftotal(const Value: TCmDbField);
    procedure SetFlgisentoirrf(const Value: TCmDbField);
    procedure SetFlgmolestiagrave(const Value: TCmDbField);
    procedure SetFlgpensaoalim(const Value: TCmDbField);
    procedure SetFlgprevia(const Value: TCmDbField);
    procedure SetFlgsalbenefretro(const Value: TCmDbField);
    procedure SetFlgsalfam(const Value: TCmDbField);
    procedure SetFlgsalpartatuaria(const Value: TCmDbField);
    procedure SetFlgsalpartretro(const Value: TCmDbField);
    procedure SetFlgsrb(const Value: TCmDbField);
    procedure SetFlgtipodesc(const Value: TCmDbField);
    procedure SetFontepagadora(const Value: TCmDbField);
    procedure SetIdcbancaria(const Value: TCmDbField);
    procedure SetIdfavorecido(const Value: TCmDbField);
    procedure SetIdhstfolhabenef(const Value: TCmDbField);
    procedure SetIdinforme(const Value: TCmDbField);
    procedure SetIdlancirrf(const Value: TCmDbField);
    procedure SetIdlancirrfestorno(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdmotivo(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanocontabil(const Value: TCmDbField);
    procedure SetIdplanoorigem(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetIdresponnaorec(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetIdretroativo(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetIdversaopagto(const Value: TCmDbField);
    procedure SetLoteoriginal(const Value: TCmDbField);
    procedure SetMes(const Value: TCmDbField);
    procedure SetMescobranca(const Value: TCmDbField);
    procedure SetNumagencia(const Value: TCmDbField);
    procedure SetNumbanco(const Value: TCmDbField);
    procedure SetNumdepirrf(const Value: TCmDbField);
    procedure SetNumdepsf(const Value: TCmDbField);
    procedure SetNumeroprocesso(const Value: TCmDbField);
    procedure SetNumprocinss(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);
    procedure SetParcelas(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPercentualnadib(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontad(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetReferencia(const Value: TCmDbField);
    procedure SetSeqhistfunc(const Value: TCmDbField);
    procedure SetSeqoriginal(const Value: TCmDbField);
    procedure SetSeqrubrica(const Value: TCmDbField);
    procedure SetTipoitempcs(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValorcotas(const Value: TCmDbField);
    procedure SetValorinfo(const Value: TCmDbField);
    procedure SetValorintegral(const Value: TCmDbField);
    procedure SetValornadib(const Value: TCmDbField);
    procedure SetValorprovento(const Value: TCmDbField);
    procedure SetValorrecebido(const Value: TCmDbField);
    procedure SetVlrantretroativo(const Value: TCmDbField);

  public

     Property Vlrantretroativo: TCmDbField read FVlrantretroativo write SetVlrantretroativo;
     Property Valorrecebido: TCmDbField read FValorrecebido write SetValorrecebido;
     Property Valorprovento: TCmDbField read FValorprovento write SetValorprovento;
     Property Valornadib: TCmDbField read FValornadib write SetValornadib;
     Property Valorintegral: TCmDbField read FValorintegral write SetValorintegral;
     Property Valorinfo: TCmDbField read FValorinfo write SetValorinfo;
     Property Valorcotas: TCmDbField read FValorcotas write SetValorcotas;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipoitempcs: TCmDbField read FTipoitempcs write SetTipoitempcs;
     Property Seqrubrica: TCmDbField read FSeqrubrica write SetSeqrubrica;
     Property Seqoriginal: TCmDbField read FSeqoriginal write SetSeqoriginal;
     Property Seqhistfunc: TCmDbField read FSeqhistfunc write SetSeqhistfunc;
     Property Referencia: TCmDbField read FReferencia write SetReferencia;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placontad: TCmDbField read FPlacontad write SetPlacontad;
     Property Placontac: TCmDbField read FPlacontac write SetPlacontac;
     Property Percentualnadib: TCmDbField read FPercentualnadib write SetPercentualnadib;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Parcelas: TCmDbField read FParcelas write SetParcelas;
     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Numprocinss: TCmDbField read FNumprocinss write SetNumprocinss;
     Property Numeroprocesso: TCmDbField read FNumeroprocesso write SetNumeroprocesso;
     Property Numdepsf: TCmDbField read FNumdepsf write SetNumdepsf;
     Property Numdepirrf: TCmDbField read FNumdepirrf write SetNumdepirrf;
     Property Numbanco: TCmDbField read FNumbanco write SetNumbanco;
     Property Numagencia: TCmDbField read FNumagencia write SetNumagencia;
     Property Mescobranca: TCmDbField read FMescobranca write SetMescobranca;
     Property Mes: TCmDbField read FMes write SetMes;
     Property Loteoriginal: TCmDbField read FLoteoriginal write SetLoteoriginal;
     Property Idversaopagto: TCmDbField read FIdversaopagto write SetIdversaopagto;
     Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idretroativo: TCmDbField read FIdretroativo write SetIdretroativo;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idresponnaorec: TCmDbField read FIdresponnaorec write SetIdresponnaorec;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanoorigem: TCmDbField read FIdplanoorigem write SetIdplanoorigem;
     Property Idplanocontabil: TCmDbField read FIdplanocontabil write SetIdplanocontabil;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idmotivo: TCmDbField read FIdmotivo write SetIdmotivo;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlancirrfestorno: TCmDbField read FIdlancirrfestorno write SetIdlancirrfestorno;
     Property Idlancirrf: TCmDbField read FIdlancirrf write SetIdlancirrf;
     Property Idinforme: TCmDbField read FIdinforme write SetIdinforme;
     Property Idhstfolhabenef: TCmDbField read FIdhstfolhabenef write SetIdhstfolhabenef;
     Property Idfavorecido: TCmDbField read FIdfavorecido write SetIdfavorecido;
     Property Idcbancaria: TCmDbField read FIdcbancaria write SetIdcbancaria;
     Property Fontepagadora: TCmDbField read FFontepagadora write SetFontepagadora;
     Property Flgtipodesc: TCmDbField read FFlgtipodesc write SetFlgtipodesc;
     Property Flgsrb: TCmDbField read FFlgsrb write SetFlgsrb;
     Property Flgsalpartretro: TCmDbField read FFlgsalpartretro write SetFlgsalpartretro;
     Property Flgsalpartatuaria: TCmDbField read FFlgsalpartatuaria write SetFlgsalpartatuaria;
     Property Flgsalfam: TCmDbField read FFlgsalfam write SetFlgsalfam;
     Property Flgsalbenefretro: TCmDbField read FFlgsalbenefretro write SetFlgsalbenefretro;
     Property Flgprevia: TCmDbField read FFlgprevia write SetFlgprevia;
     Property Flgpensaoalim: TCmDbField read FFlgpensaoalim write SetFlgpensaoalim;
     Property Flgmolestiagrave: TCmDbField read FFlgmolestiagrave write SetFlgmolestiagrave;
     Property Flgisentoirrf: TCmDbField read FFlgisentoirrf write SetFlgisentoirrf;
     Property Flgirrftotal: TCmDbField read FFlgirrftotal write SetFlgirrftotal;
     Property Flgirrf: TCmDbField read FFlgirrf write SetFlgirrf;
     Property Flgestorno: TCmDbField read FFlgestorno write SetFlgestorno;
     Property Flgespecial: TCmDbField read FFlgespecial write SetFlgespecial;
     Property Flgequiparacao: TCmDbField read FFlgequiparacao write SetFlgequiparacao;
     Property Flgdesconto: TCmDbField read FFlgdesconto write SetFlgdesconto;
     Property Flgconcessao: TCmDbField read FFlgconcessao write SetFlgconcessao;
     Property Flgcompoesalpart: TCmDbField read FFlgcompoesalpart write SetFlgcompoesalpart;
     Property Flgcompoesalbenef: TCmDbField read FFlgcompoesalbenef write SetFlgcompoesalbenef;
     Property Flgcompoeremtotal: TCmDbField read FFlgcompoeremtotal write SetFlgcompoeremtotal;
     Property Datapagamento: TCmDbField read FDatapagamento write SetDatapagamento;
     Property Contacorrente: TCmDbField read FContacorrente write SetContacorrente;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codprovdesc: TCmDbField read FCodprovdesc write SetCodprovdesc;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codmoeda: TCmDbField read FCodmoeda write SetCodmoeda;
     Property Codirrfdarf: TCmDbField read FCodirrfdarf write SetCodirrfdarf;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocustod: TCmDbField read FCodcentrocustod write SetCodcentrocustod;
     Property Codcentrocustoc: TCmDbField read FCodcentrocustoc write SetCodcentrocustoc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistrubsal }

constructor TDbHistrubsal.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTRUBSAL';

   fVlrantretroativo := CreateCmDbField('VLRANTRETROATIVO',ftfloat,False,False,False,True,'');
   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,False,False,False,True,'');
   fValorprovento := CreateCmDbField('VALORPROVENTO',ftfloat,False,False,False,True,'');
   fValornadib := CreateCmDbField('VALORNADIB',ftfloat,False,False,False,True,'');
   fValorintegral := CreateCmDbField('VALORINTEGRAL',ftfloat,False,False,False,True,'');
   fValorinfo := CreateCmDbField('VALORINFO',ftfloat,False,False,False,True,'');
   fValorcotas := CreateCmDbField('VALORCOTAS',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTipoitempcs := CreateCmDbField('TIPOITEMPCS',ftfloat,False,False,False,True,'');
   fSeqrubrica := CreateCmDbField('SEQRUBRICA',ftfloat,True,False,False,True,'');
   fSeqoriginal := CreateCmDbField('SEQORIGINAL',ftfloat,False,False,False,True,'');
   fSeqhistfunc := CreateCmDbField('SEQHISTFUNC',ftfloat,False,False,False,True,'');
   fReferencia := CreateCmDbField('REFERENCIA',ftString,True,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,False,False,False,True,'');
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
   fPercentualnadib := CreateCmDbField('PERCENTUALNADIB',ftfloat,False,False,False,True,'');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
   fParcelas := CreateCmDbField('PARCELAS',ftfloat,False,False,False,True,'');
   fOrdem := CreateCmDbField('ORDEM',ftfloat,False,False,False,True,'');
   fNumprocinss := CreateCmDbField('NUMPROCINSS',ftString,False,False,False,True,'');
   fNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,False,False,False,True,'');
   fNumdepsf := CreateCmDbField('NUMDEPSF',ftfloat,False,False,False,True,'');
   fNumdepirrf := CreateCmDbField('NUMDEPIRRF',ftfloat,False,False,False,True,'');
   fNumbanco := CreateCmDbField('NUMBANCO',ftString,False,False,False,True,'');
   fNumagencia := CreateCmDbField('NUMAGENCIA',ftString,False,False,False,True,'');
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,True,False,False,True,'');
   fMes := CreateCmDbField('MES',ftString,True,False,False,True,'');
   fLoteoriginal := CreateCmDbField('LOTEORIGINAL',ftfloat,False,False,False,True,'');
   fIdversaopagto := CreateCmDbField('IDVERSAOPAGTO',ftfloat,False,False,False,True,'');
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,False,False,True,'');
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,False,False,True,'');
   fIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,False,False,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdresponnaorec := CreateCmDbField('IDRESPONNAOREC',ftfloat,False,False,False,True,'');
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdplanoorigem := CreateCmDbField('IDPLANOORIGEM',ftfloat,False,False,False,True,'');
   fIdplanocontabil := CreateCmDbField('IDPLANOCONTABIL',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,True,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdlancirrfestorno := CreateCmDbField('IDLANCIRRFESTORNO',ftfloat,False,False,False,True,'');
   fIdlancirrf := CreateCmDbField('IDLANCIRRF',ftfloat,False,False,False,True,'');
   fIdinforme := CreateCmDbField('IDINFORME',ftfloat,False,False,False,True,'');
   fIdhstfolhabenef := CreateCmDbField('IDHSTFOLHABENEF',ftfloat,False,False,False,True,'');
   fIdfavorecido := CreateCmDbField('IDFAVORECIDO',ftfloat,False,False,False,True,'');
   fIdcbancaria := CreateCmDbField('IDCBANCARIA',ftfloat,False,False,False,True,'');
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,False,False,False,True,'');
   fFlgtipodesc := CreateCmDbField('FLGTIPODESC',ftString,False,False,False,True,'');
   fFlgsrb := CreateCmDbField('FLGSRB',ftfloat,False,False,False,True,'');
   fFlgsalpartretro := CreateCmDbField('FLGSALPARTRETRO',ftfloat,False,False,False,True,'');
   fFlgsalpartatuaria := CreateCmDbField('FLGSALPARTATUARIA',ftfloat,False,False,False,True,'');
   fFlgsalfam := CreateCmDbField('FLGSALFAM',ftfloat,False,False,False,True,'');
   fFlgsalbenefretro := CreateCmDbField('FLGSALBENEFRETRO',ftfloat,False,False,False,True,'');
   fFlgprevia := CreateCmDbField('FLGPREVIA',ftfloat,False,False,False,True,'');
   fFlgpensaoalim := CreateCmDbField('FLGPENSAOALIM',ftfloat,False,False,False,True,'');
   fFlgmolestiagrave := CreateCmDbField('FLGMOLESTIAGRAVE',ftfloat,False,False,False,True,'');
   fFlgisentoirrf := CreateCmDbField('FLGISENTOIRRF',ftfloat,False,False,False,True,'');
   fFlgirrftotal := CreateCmDbField('FLGIRRFTOTAL',ftfloat,False,False,False,True,'');
   fFlgirrf := CreateCmDbField('FLGIRRF',ftfloat,False,False,False,True,'');
   fFlgestorno := CreateCmDbField('FLGESTORNO',ftfloat,False,False,False,True,'');
   fFlgespecial := CreateCmDbField('FLGESPECIAL',ftfloat,False,False,False,True,'');
   fFlgequiparacao := CreateCmDbField('FLGEQUIPARACAO',ftfloat,False,False,False,True,'');
   fFlgdesconto := CreateCmDbField('FLGDESCONTO',ftfloat,False,False,False,True,'');
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,False,False,False,True,'');
   fFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,False,False,False,True,'');
   fFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,False,False,False,True,'');
   fFlgcompoeremtotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftfloat,False,False,False,True,'');
   fDatapagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,False,False,False,True,'');
   fContacorrente := CreateCmDbField('CONTACORRENTE',ftString,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,True,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodmoeda := CreateCmDbField('CODMOEDA',ftfloat,False,False,False,True,'');
   fCodirrfdarf := CreateCmDbField('CODIRRFDARF',ftString,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
end;

function TDbHistrubsal.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbHistrubsal.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDbHistrubsal.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDbHistrubsal.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbHistrubsal.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbHistrubsal.SetCodirrfdarf(const Value: TCmDbField);
begin
  FCodirrfdarf := Value;
end;

procedure TDbHistrubsal.SetCodmoeda(const Value: TCmDbField);
begin
  FCodmoeda := Value;
end;

procedure TDbHistrubsal.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbHistrubsal.SetCodprovdesc(const Value: TCmDbField);
begin
  FCodprovdesc := Value;
end;

procedure TDbHistrubsal.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbHistrubsal.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbHistrubsal.SetContacorrente(const Value: TCmDbField);
begin
  FContacorrente := Value;
end;

procedure TDbHistrubsal.SetDatapagamento(const Value: TCmDbField);
begin
  FDatapagamento := Value;
end;

procedure TDbHistrubsal.SetFlgcompoeremtotal(const Value: TCmDbField);
begin
  FFlgcompoeremtotal := Value;
end;

procedure TDbHistrubsal.SetFlgcompoesalbenef(const Value: TCmDbField);
begin
  FFlgcompoesalbenef := Value;
end;

procedure TDbHistrubsal.SetFlgcompoesalpart(const Value: TCmDbField);
begin
  FFlgcompoesalpart := Value;
end;

procedure TDbHistrubsal.SetFlgconcessao(const Value: TCmDbField);
begin
  FFlgconcessao := Value;
end;

procedure TDbHistrubsal.SetFlgdesconto(const Value: TCmDbField);
begin
  FFlgdesconto := Value;
end;

procedure TDbHistrubsal.SetFlgequiparacao(const Value: TCmDbField);
begin
  FFlgequiparacao := Value;
end;

procedure TDbHistrubsal.SetFlgespecial(const Value: TCmDbField);
begin
  FFlgespecial := Value;
end;

procedure TDbHistrubsal.SetFlgestorno(const Value: TCmDbField);
begin
  FFlgestorno := Value;
end;

procedure TDbHistrubsal.SetFlgirrf(const Value: TCmDbField);
begin
  FFlgirrf := Value;
end;

procedure TDbHistrubsal.SetFlgirrftotal(const Value: TCmDbField);
begin
  FFlgirrftotal := Value;
end;

procedure TDbHistrubsal.SetFlgisentoirrf(const Value: TCmDbField);
begin
  FFlgisentoirrf := Value;
end;

procedure TDbHistrubsal.SetFlgmolestiagrave(const Value: TCmDbField);
begin
  FFlgmolestiagrave := Value;
end;

procedure TDbHistrubsal.SetFlgpensaoalim(const Value: TCmDbField);
begin
  FFlgpensaoalim := Value;
end;

procedure TDbHistrubsal.SetFlgprevia(const Value: TCmDbField);
begin
  FFlgprevia := Value;
end;

procedure TDbHistrubsal.SetFlgsalbenefretro(const Value: TCmDbField);
begin
  FFlgsalbenefretro := Value;
end;

procedure TDbHistrubsal.SetFlgsalfam(const Value: TCmDbField);
begin
  FFlgsalfam := Value;
end;

procedure TDbHistrubsal.SetFlgsalpartatuaria(const Value: TCmDbField);
begin
  FFlgsalpartatuaria := Value;
end;

procedure TDbHistrubsal.SetFlgsalpartretro(const Value: TCmDbField);
begin
  FFlgsalpartretro := Value;
end;

procedure TDbHistrubsal.SetFlgsrb(const Value: TCmDbField);
begin
  FFlgsrb := Value;
end;

procedure TDbHistrubsal.SetFlgtipodesc(const Value: TCmDbField);
begin
  FFlgtipodesc := Value;
end;

procedure TDbHistrubsal.SetFontepagadora(const Value: TCmDbField);
begin
  FFontepagadora := Value;
end;

procedure TDbHistrubsal.SetIdcbancaria(const Value: TCmDbField);
begin
  FIdcbancaria := Value;
end;

procedure TDbHistrubsal.SetIdfavorecido(const Value: TCmDbField);
begin
  FIdfavorecido := Value;
end;

procedure TDbHistrubsal.SetIdhstfolhabenef(const Value: TCmDbField);
begin
  FIdhstfolhabenef := Value;
end;

procedure TDbHistrubsal.SetIdinforme(const Value: TCmDbField);
begin
  FIdinforme := Value;
end;

procedure TDbHistrubsal.SetIdlancirrf(const Value: TCmDbField);
begin
  FIdlancirrf := Value;
end;

procedure TDbHistrubsal.SetIdlancirrfestorno(const Value: TCmDbField);
begin
  FIdlancirrfestorno := Value;
end;

procedure TDbHistrubsal.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbHistrubsal.SetIdmotivo(const Value: TCmDbField);
begin
  FIdmotivo := Value;
end;

procedure TDbHistrubsal.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbHistrubsal.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbHistrubsal.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbHistrubsal.SetIdplanocontabil(const Value: TCmDbField);
begin
  FIdplanocontabil := Value;
end;

procedure TDbHistrubsal.SetIdplanoorigem(const Value: TCmDbField);
begin
  FIdplanoorigem := Value;
end;

procedure TDbHistrubsal.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbHistrubsal.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDbHistrubsal.SetIdresponnaorec(const Value: TCmDbField);
begin
  FIdresponnaorec := Value;
end;

procedure TDbHistrubsal.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDbHistrubsal.SetIdretroativo(const Value: TCmDbField);
begin
  FIdretroativo := Value;
end;

procedure TDbHistrubsal.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

procedure TDbHistrubsal.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDbHistrubsal.SetIdversaopagto(const Value: TCmDbField);
begin
  FIdversaopagto := Value;
end;

procedure TDbHistrubsal.SetLoteoriginal(const Value: TCmDbField);
begin
  FLoteoriginal := Value;
end;

procedure TDbHistrubsal.SetMes(const Value: TCmDbField);
begin
  FMes := Value;
end;

procedure TDbHistrubsal.SetMescobranca(const Value: TCmDbField);
begin
  FMescobranca := Value;
end;

procedure TDbHistrubsal.SetNumagencia(const Value: TCmDbField);
begin
  FNumagencia := Value;
end;

procedure TDbHistrubsal.SetNumbanco(const Value: TCmDbField);
begin
  FNumbanco := Value;
end;

procedure TDbHistrubsal.SetNumdepirrf(const Value: TCmDbField);
begin
  FNumdepirrf := Value;
end;

procedure TDbHistrubsal.SetNumdepsf(const Value: TCmDbField);
begin
  FNumdepsf := Value;
end;

procedure TDbHistrubsal.SetNumeroprocesso(const Value: TCmDbField);
begin
  FNumeroprocesso := Value;
end;

procedure TDbHistrubsal.SetNumprocinss(const Value: TCmDbField);
begin
  FNumprocinss := Value;
end;

procedure TDbHistrubsal.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

procedure TDbHistrubsal.SetParcelas(const Value: TCmDbField);
begin
  FParcelas := Value;
end;

procedure TDbHistrubsal.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbHistrubsal.SetPercentualnadib(const Value: TCmDbField);
begin
  FPercentualnadib := Value;
end;

procedure TDbHistrubsal.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDbHistrubsal.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDbHistrubsal.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbHistrubsal.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbHistrubsal.SetReferencia(const Value: TCmDbField);
begin
  FReferencia := Value;
end;

procedure TDbHistrubsal.SetSeqhistfunc(const Value: TCmDbField);
begin
  FSeqhistfunc := Value;
end;

procedure TDbHistrubsal.SetSeqoriginal(const Value: TCmDbField);
begin
  FSeqoriginal := Value;
end;

procedure TDbHistrubsal.SetSeqrubrica(const Value: TCmDbField);
begin
  FSeqrubrica := Value;
end;

procedure TDbHistrubsal.SetTipoitempcs(const Value: TCmDbField);
begin
  FTipoitempcs := Value;
end;

procedure TDbHistrubsal.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbHistrubsal.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbHistrubsal.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbHistrubsal.SetValorcotas(const Value: TCmDbField);
begin
  FValorcotas := Value;
end;

procedure TDbHistrubsal.SetValorinfo(const Value: TCmDbField);
begin
  FValorinfo := Value;
end;

procedure TDbHistrubsal.SetValorintegral(const Value: TCmDbField);
begin
  FValorintegral := Value;
end;

procedure TDbHistrubsal.SetValornadib(const Value: TCmDbField);
begin
  FValornadib := Value;
end;

procedure TDbHistrubsal.SetValorprovento(const Value: TCmDbField);
begin
  FValorprovento := Value;
end;

procedure TDbHistrubsal.SetValorrecebido(const Value: TCmDbField);
begin
  FValorrecebido := Value;
end;

procedure TDbHistrubsal.SetVlrantretroativo(const Value: TCmDbField);
begin
  FVlrantretroativo := Value;
end;

end.



