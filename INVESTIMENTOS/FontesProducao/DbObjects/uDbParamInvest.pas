//******************************************************************************
// Data	     : 12/05/2008
// Codigo    : AL_7
// Pendencia : 25129
// SOL       : 58645
// Desc      : Implementação de campo integração por Módulos do item Opções de Indice
//******************************************************************************
// Data	     : 17/01/2008
// Codigo    : AL_6
// Pendência : 26744
// SOL       : 71043
// Desc      : Implementação de campos para o novo tipo de fundos - FMIEE 
//******************************************************************************
// Data      : 02/02/2007
// Código    : AL_4
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do paramentro IDMOTBLOQPENFDO, IDCARTEIRARF para Bloqueio de
//             Fundos e Penhora com o Jurídico
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_3
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação de Bloqueio Contabil e Financeiro por Módulo
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_2
// Pendencia : 22492
// SOL       :
// Desc      : Implementação de Contabilização em dias úteis para ativos de
//             Renda Fixa que geram registros em dias não uteis
//             Contabiliza FLGCONTABDIAUTIL
//             Retirado a property FIdclasspoupanca que estava errada e não existe
//******************************************************************************
// Data     : 06/12/2005
// Código   : AL_1
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo IDTIPOOPERDIRDSA, IDTIPOOPERDIRDSR, FLGREGIMECXCOMP
//            e DTAREGIMECXCOMP na PARAMINVEST para testar a utilização
//            de regime de Caixa ou Competência nas Operações de Renda Fixa
//******************************************************************************

unit uDbParaminvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParaminvest = class(TCmDbObject)

  private
    FIdtipooperdirdsu: TCmDbField;
    FFlgrfemabertura: TCmDbField;
    FIdmercado: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FMascclassifinv: TCmDbField;
    FPercdevrv: TCmDbField;
    FIdramoforemi: TCmDbField;
    FIdtiporegrarv: TCmDbField;
    FJurospoupanca: TCmDbField;
    FFlgintfinliq: TCmDbField;
    FFlgusasubconta: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdtipooperliqpend: TCmDbField;
    FDtmudacpmf: TCmDbField;
    FIdtiporegraempac: TCmDbField;
    FDiasuteiscpmf: TCmDbField;
    FFlgespecfundo: TCmDbField;
    FVlrcotainicart: TCmDbField;
    FFlgempacoes: TCmDbField;
    FIdusremaberturafid: TCmDbField;
    FIdusremaberturafib: TCmDbField;
    FIdmotbloqopc: TCmDbField;
    FFlgimplantrf: TCmDbField;
    FIdoperincjuros: TCmDbField;
    FIdtipooperdirdiv: TCmDbField;
    FIdcartempacoes: TCmDbField;
    FFlgprovisionairrv: TCmDbField;
    FIdramoforcus: TCmDbField;
    FIdcontraparterf: TCmDbField;
    FIdparampatrliq: TCmDbField;
    FIdtipodespirapu: TCmDbField;
    FIdtiporegrarent: TCmDbField;
    FIdtiporegrabmf: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdtipooperdirper: TCmDbField;
    FFlgemaberturafpt: TCmDbField;
    FTipomenu: TCmDbField;
    FIdtipocontrrf: TCmDbField;
    FIdtipooperdirres: TCmDbField;
    FIdtiporegraatuar: TCmDbField;
    FMascsetoremissor: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FIdusremaberturafpt: TCmDbField;
    FIdramoforcor: TCmDbField;
    FFlgemaberturafib: TCmDbField;
    FMoedaeqm: TCmDbField;
    FIdoperamortprinc: TCmDbField;
    FIdtipooperdirsub: TCmDbField;
    FIdoperpagtojuros: TCmDbField;
    FIdtipooperdirmul: TCmDbField;
    FDataimplcartger: TCmDbField;
    FIdtipoclientecor: TCmDbField;
    FIdclassntn: TCmDbField;
    FFlgemaberturafif: TCmDbField;
    FFlgplanprevctbpat: TCmDbField;
    FFlgordmovinv: TCmDbField;
    FDataultimpcot: TCmDbField;
    FIdcartavista: TCmDbField;
    FPrzvenccfianca: TCmDbField;
    FIdusuarioprocrf: TCmDbField;
    FFlgcontabiliza: TCmDbField;
    FFlgemaberturafao: TCmDbField;
    FIdregraempacoes: TCmDbField;
    FPrzvencbmf: TCmDbField;
    FIdtipooperopcvd: TCmDbField;
    FPercpuordmovinv: TCmDbField;
    FIdtipodespinvest: TCmDbField;
    FPercparticempr: TCmDbField;
    FFlgcartgerenc: TCmDbField;
    FIdusremaberturafif: TCmDbField;
    FFlgrecpagrv: TCmDbField;
    FPercparticrecur: TCmDbField;
    FIdcartopc: TCmDbField;
    FIdcartopcind: TCmDbField;
    FIdtipooperdirree: TCmDbField;
    FFlgemaberturafid: TCmDbField;
    FDifresgfundos: TCmDbField;
    FPercimprenda: TCmDbField;
    FIdgrupodisp: TCmDbField;
    FIdtipoinvestidor: TCmDbField;
    FIdparaminvest: TCmDbField;
    FDataultfechbmf: TCmDbField;
    FIdautorizaordem: TCmDbField;
    FDiasemanacpmf: TCmDbField;
    FIdtipooperdirdes: TCmDbField;
    FFlgliberaidlote: TCmDbField;
    FMoedaatulit: TCmDbField;
    FDatamovcdblib: TCmDbField;
    FIdtipooperdirjur: TCmDbField;
    FIdtipoclienteemi: TCmDbField;
    FIdtiporegraopcin: TCmDbField;
    FIdusremaberturafao: TCmDbField;
    FDataultfechfdo: TCmDbField;
    FIdcustodiarenfix: TCmDbField;
    FIdtiporegrafnd: TCmDbField;
    FDataultfechemp: TCmDbField;
    FIdusuarioprocrv: TCmDbField;
    FIdbmf: TCmDbField;
    FFlgprovisionairrf: TCmDbField;
    FPercdevbmf: TCmDbField;
    FIdbvsp: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FFlgemaberturafac: TCmDbField;
    FMoedager: TCmDbField;
    FMoedaatu: TCmDbField;
    FIdtipooperdirinc: TCmDbField;
    FDifmaxopcind: TCmDbField;
    FIdtipooperdircis: TCmDbField;
    FIdindexpoupanca: TCmDbField;
    FIdmotbloqempac: TCmDbField;
    FFlgintcapcar: TCmDbField;
    FDataultfechrf: TCmDbField;
    FStaret: TCmDbField;
    FIdtipodespirprov: TCmDbField;
    FFlgcompvarrv: TCmDbField;
    FIdgruporegrainv: TCmDbField;
    FIdtipooperdiralt: TCmDbField;
    FFlgdemo: TCmDbField;
    FIdtipooperdirbon: TCmDbField;
    FVlrdiverg: TCmDbField;
    FIdtipooperopccp: TCmDbField;
    FFlgpoupapropdia: TCmDbField;
    FIdclasspoupbloq: TCmDbField;
    FIdtpperiodicidade: TCmDbField;
    FIdtiporegrarf: TCmDbField;
    FDataultfech: TCmDbField;
    FIdusremaberturafac: TCmDbField;
    FIdtipocontrfin: TCmDbField;
    FIdtipooperdirprov: TCmDbField;
    FIdtipoclientecus: TCmDbField;
    FDataultret: TCmDbField;
    FIdtipooperdirgru: TCmDbField;
    FFlgrvemabertura: TCmDbField;
    FIdtiporegrarentju: TCmDbField;
    FIdclassetit: TCmDbField;
    FIdprograma: TCmDbField;
    FIdtipodespdvcor: TCmDbField;
    FPucdb: TCmDbField;
    //AL_1
    FIdTipoOperDirDSA: TCmDbField;
    FIdTipoOperDirDSR: TCmDbField;
    FFlgregimecxcomp: TCmDbField;
    FDtaregimecxcomp: TCmDbField;
    //AL_2
    FFlgContabDiaUtil: TCmDbField;
    //AL_3
    FFlgIntContabFRV: TCmDbField;
    FFlgIntContabFRF: TCmDbField;
    FFlgIntContabBMF: TCmDbField;
    FFlgIntContabRV: TCmDbField;
    FFlgIntContabFIM: TCmDbField;
    FFlgIntContabFDC: TCmDbField;
    FFlgIntContabRF: TCmDbField;
    FFlgIntContabFIP: TCmDbField;
    //AL_7    
    FFlgIntContabOPI: TCmDbField;
    //AL_4
    FIdMotBloqPenFdo: TCmDbField;
    FIdCarteiraRF: TCmDbField;
    //AL_6
    FIDUSREMABERTURAFMI: TCmDbField;
    FFLGEMABERTURAFMI: TCmDbField;

    procedure SetDataimplcartger(const Value: TCmDbField);
    procedure SetDatamovcdblib(const Value: TCmDbField);
    procedure SetDataultfech(const Value: TCmDbField);
    procedure SetDataultfechbmf(const Value: TCmDbField);
    procedure SetDataultfechemp(const Value: TCmDbField);
    procedure SetDataultfechfdo(const Value: TCmDbField);
    procedure SetDataultfechrf(const Value: TCmDbField);
    procedure SetDataultimpcot(const Value: TCmDbField);
    procedure SetDataultret(const Value: TCmDbField);
    procedure SetDiasemanacpmf(const Value: TCmDbField);
    procedure SetDiasuteiscpmf(const Value: TCmDbField);
    procedure SetDifmaxopcind(const Value: TCmDbField);
    procedure SetDifresgfundos(const Value: TCmDbField);
    procedure SetDtmudacpmf(const Value: TCmDbField);
    procedure SetFlgcartgerenc(const Value: TCmDbField);
    procedure SetFlgcompvarrv(const Value: TCmDbField);
    procedure SetFlgcontabiliza(const Value: TCmDbField);
    procedure SetFlgdemo(const Value: TCmDbField);
    procedure SetFlgemaberturafac(const Value: TCmDbField);
    procedure SetFlgemaberturafao(const Value: TCmDbField);
    procedure SetFlgemaberturafib(const Value: TCmDbField);
    procedure SetFlgemaberturafid(const Value: TCmDbField);
    procedure SetFlgemaberturafif(const Value: TCmDbField);
    procedure SetFlgemaberturafpt(const Value: TCmDbField);
    procedure SetFlgempacoes(const Value: TCmDbField);
    procedure SetFlgespecfundo(const Value: TCmDbField);
    procedure SetFlgimplantrf(const Value: TCmDbField);
    procedure SetFlgintcapcar(const Value: TCmDbField);
    procedure SetFlgintfinliq(const Value: TCmDbField);
    procedure SetFlgliberaidlote(const Value: TCmDbField);
    procedure SetFlgordmovinv(const Value: TCmDbField);
    procedure SetFlgplanprevctbpat(const Value: TCmDbField);
    procedure SetFlgpoupapropdia(const Value: TCmDbField);
    procedure SetFlgprovisionairrf(const Value: TCmDbField);
    procedure SetFlgprovisionairrv(const Value: TCmDbField);
    procedure SetFlgrecpagrv(const Value: TCmDbField);
    procedure SetFlgrfemabertura(const Value: TCmDbField);
    procedure SetFlgrvemabertura(const Value: TCmDbField);
    procedure SetFlgusasubconta(const Value: TCmDbField);
    procedure SetIdautorizaordem(const Value: TCmDbField);
    procedure SetIdbmf(const Value: TCmDbField);
    procedure SetIdbvsp(const Value: TCmDbField);
    procedure SetIdcartavista(const Value: TCmDbField);
    procedure SetIdcartempacoes(const Value: TCmDbField);
    procedure SetIdcartopc(const Value: TCmDbField);
    procedure SetIdcartopcind(const Value: TCmDbField);
    procedure SetIdclassetit(const Value: TCmDbField);
    procedure SetIdclassntn(const Value: TCmDbField);
    procedure SetIdclasspoupbloq(const Value: TCmDbField);
    procedure SetIdcontraparterf(const Value: TCmDbField);
    procedure SetIdcustodiarenfix(const Value: TCmDbField);
    procedure SetIdgrupodisp(const Value: TCmDbField);
    procedure SetIdgruporegrainv(const Value: TCmDbField);
    procedure SetIdindexpoupanca(const Value: TCmDbField);
    procedure SetIdmercado(const Value: TCmDbField);
    procedure SetIdmotbloqempac(const Value: TCmDbField);
    procedure SetIdmotbloqopc(const Value: TCmDbField);
    procedure SetIdoperamortprinc(const Value: TCmDbField);
    procedure SetIdoperincjuros(const Value: TCmDbField);
    procedure SetIdoperpagtojuros(const Value: TCmDbField);
    procedure SetIdparaminvest(const Value: TCmDbField);
    procedure SetIdparampatrliq(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdramoforcor(const Value: TCmDbField);
    procedure SetIdramoforcus(const Value: TCmDbField);
    procedure SetIdramoforemi(const Value: TCmDbField);
    procedure SetIdregraempacoes(const Value: TCmDbField);
    procedure SetIdtipoclientecor(const Value: TCmDbField);
    procedure SetIdtipoclientecus(const Value: TCmDbField);
    procedure SetIdtipoclienteemi(const Value: TCmDbField);
    procedure SetIdtipocontrfin(const Value: TCmDbField);
    procedure SetIdtipocontrrf(const Value: TCmDbField);
    procedure SetIdtipodespdvcor(const Value: TCmDbField);
    procedure SetIdtipodespinvest(const Value: TCmDbField);
    procedure SetIdtipodespirapu(const Value: TCmDbField);
    procedure SetIdtipodespirprov(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipoinvestidor(const Value: TCmDbField);
    procedure SetIdtipooperdiralt(const Value: TCmDbField);
    procedure SetIdtipooperdirbon(const Value: TCmDbField);
    procedure SetIdtipooperdircis(const Value: TCmDbField);
    procedure SetIdtipooperdirdes(const Value: TCmDbField);
    procedure SetIdtipooperdirdiv(const Value: TCmDbField);
    procedure SetIdtipooperdirdsu(const Value: TCmDbField);
    procedure SetIdtipooperdirgru(const Value: TCmDbField);
    procedure SetIdtipooperdirinc(const Value: TCmDbField);
    procedure SetIdtipooperdirjur(const Value: TCmDbField);
    procedure SetIdtipooperdirmul(const Value: TCmDbField);
    procedure SetIdtipooperdirper(const Value: TCmDbField);
    procedure SetIdtipooperdirprov(const Value: TCmDbField);
    procedure SetIdtipooperdirree(const Value: TCmDbField);
    procedure SetIdtipooperdirres(const Value: TCmDbField);
    procedure SetIdtipooperdirsub(const Value: TCmDbField);
    procedure SetIdtipooperliqpend(const Value: TCmDbField);
    procedure SetIdtipooperopccp(const Value: TCmDbField);
    procedure SetIdtipooperopcvd(const Value: TCmDbField);
    procedure SetIdtiporegraatuar(const Value: TCmDbField);
    procedure SetIdtiporegrabmf(const Value: TCmDbField);
    procedure SetIdtiporegraempac(const Value: TCmDbField);
    procedure SetIdtiporegrafnd(const Value: TCmDbField);
    procedure SetIdtiporegraopcin(const Value: TCmDbField);
    procedure SetIdtiporegrarent(const Value: TCmDbField);
    procedure SetIdtiporegrarentju(const Value: TCmDbField);
    procedure SetIdtiporegrarf(const Value: TCmDbField);
    procedure SetIdtiporegrarv(const Value: TCmDbField);
    procedure SetIdtpperiodicidade(const Value: TCmDbField);
    procedure SetIdusremaberturafac(const Value: TCmDbField);
    procedure SetIdusremaberturafao(const Value: TCmDbField);
    procedure SetIdusremaberturafib(const Value: TCmDbField);
    procedure SetIdusremaberturafid(const Value: TCmDbField);
    procedure SetIdusremaberturafif(const Value: TCmDbField);
    procedure SetIdusremaberturafpt(const Value: TCmDbField);
    procedure SetIdusuarioprocrf(const Value: TCmDbField);
    procedure SetIdusuarioprocrv(const Value: TCmDbField);
    procedure SetJurospoupanca(const Value: TCmDbField);
    procedure SetMascclassifinv(const Value: TCmDbField);
    procedure SetMascsetoremissor(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetMoedaatu(const Value: TCmDbField);
    procedure SetMoedaatulit(const Value: TCmDbField);
    procedure SetMoedaeqm(const Value: TCmDbField);
    procedure SetMoedager(const Value: TCmDbField);
    procedure SetPercdevbmf(const Value: TCmDbField);
    procedure SetPercdevrv(const Value: TCmDbField);
    procedure SetPercimprenda(const Value: TCmDbField);
    procedure SetPercparticempr(const Value: TCmDbField);
    procedure SetPercparticrecur(const Value: TCmDbField);
    procedure SetPercpuordmovinv(const Value: TCmDbField);
    procedure SetPrzvencbmf(const Value: TCmDbField);
    procedure SetPrzvenccfianca(const Value: TCmDbField);
    procedure SetPucdb(const Value: TCmDbField);
    procedure SetStaret(const Value: TCmDbField);
    procedure SetTipomenu(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrcotainicart(const Value: TCmDbField);
    procedure SetVlrdiverg(const Value: TCmDbField);
    //AL_1
    procedure SetFlgregimecxcomp(const Value: TCmDbField);
    procedure SetIdTipoOperDirDSA(const Value: TCmDbField);
    procedure SetIdTipoOperDirDSR(const Value: TCmDbField);
    procedure SetDtaregimecxcomp(const Value: TCmDbField);
    procedure SetFlgContabDiaUtil(const Value: TCmDbField);
    //AL_3
    procedure SetFlgIntContabBMF(const Value: TCmDbField);
    procedure SetFlgIntContabFDC(const Value: TCmDbField);
    procedure SetFlgIntContabFIM(const Value: TCmDbField);
    procedure SetFlgIntContabFIP(const Value: TCmDbField);
    procedure SetFlgIntContabFRF(const Value: TCmDbField);
    procedure SetFlgIntContabFRV(const Value: TCmDbField);
    procedure SetFlgIntContabRF(const Value: TCmDbField);
    procedure SetFlgIntContabRV(const Value: TCmDbField);
    //AL_7    
    procedure SetFlgIntContabOPI(const Value: TCmDbField);
    //AL_4
    procedure SetIdMotBloqPenFdo(const Value: TCmDbField);
    procedure SetIdCarteiraRF(const Value: TCmDbField);
    //AL_6
    procedure SetFLGEMABERTURAFMI(const Value: TCmDbField);
    procedure SetIDUSREMABERTURAFMI(const Value: TCmDbField);

  public

     Property Vlrdiverg: TCmDbField read FVlrdiverg write SetVlrdiverg;
     Property Vlrcotainicart: TCmDbField read FVlrcotainicart write SetVlrcotainicart;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipomenu: TCmDbField read FTipomenu write SetTipomenu;
     Property Staret: TCmDbField read FStaret write SetStaret;
     Property Pucdb: TCmDbField read FPucdb write SetPucdb;
     Property Przvenccfianca: TCmDbField read FPrzvenccfianca write SetPrzvenccfianca;
     Property Przvencbmf: TCmDbField read FPrzvencbmf write SetPrzvencbmf;
     Property Percpuordmovinv: TCmDbField read FPercpuordmovinv write SetPercpuordmovinv;
     Property Percparticrecur: TCmDbField read FPercparticrecur write SetPercparticrecur;
     Property Percparticempr: TCmDbField read FPercparticempr write SetPercparticempr;
     Property Percimprenda: TCmDbField read FPercimprenda write SetPercimprenda;
     Property Percdevrv: TCmDbField read FPercdevrv write SetPercdevrv;
     Property Percdevbmf: TCmDbField read FPercdevbmf write SetPercdevbmf;
     Property Moedager: TCmDbField read FMoedager write SetMoedager;
     Property Moedaeqm: TCmDbField read FMoedaeqm write SetMoedaeqm;
     Property Moedaatulit: TCmDbField read FMoedaatulit write SetMoedaatulit;
     Property Moedaatu: TCmDbField read FMoedaatu write SetMoedaatu;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Mascsetoremissor: TCmDbField read FMascsetoremissor write SetMascsetoremissor;
     Property Mascclassifinv: TCmDbField read FMascclassifinv write SetMascclassifinv;
     Property Jurospoupanca: TCmDbField read FJurospoupanca write SetJurospoupanca;
     Property Idusuarioprocrv: TCmDbField read FIdusuarioprocrv write SetIdusuarioprocrv;
     Property Idusuarioprocrf: TCmDbField read FIdusuarioprocrf write SetIdusuarioprocrf;
     Property Idusremaberturafpt: TCmDbField read FIdusremaberturafpt write SetIdusremaberturafpt;
     Property Idusremaberturafif: TCmDbField read FIdusremaberturafif write SetIdusremaberturafif;
     Property Idusremaberturafid: TCmDbField read FIdusremaberturafid write SetIdusremaberturafid;
     Property Idusremaberturafib: TCmDbField read FIdusremaberturafib write SetIdusremaberturafib;
     Property Idusremaberturafao: TCmDbField read FIdusremaberturafao write SetIdusremaberturafao;
     Property Idusremaberturafac: TCmDbField read FIdusremaberturafac write SetIdusremaberturafac;
     Property Idtpperiodicidade: TCmDbField read FIdtpperiodicidade write SetIdtpperiodicidade;
     Property Idtiporegrarv: TCmDbField read FIdtiporegrarv write SetIdtiporegrarv;
     Property Idtiporegrarf: TCmDbField read FIdtiporegrarf write SetIdtiporegrarf;
     Property Idtiporegrarentju: TCmDbField read FIdtiporegrarentju write SetIdtiporegrarentju;
     Property Idtiporegrarent: TCmDbField read FIdtiporegrarent write SetIdtiporegrarent;
     Property Idtiporegraopcin: TCmDbField read FIdtiporegraopcin write SetIdtiporegraopcin;
     Property Idtiporegrafnd: TCmDbField read FIdtiporegrafnd write SetIdtiporegrafnd;
     Property Idtiporegraempac: TCmDbField read FIdtiporegraempac write SetIdtiporegraempac;
     Property Idtiporegrabmf: TCmDbField read FIdtiporegrabmf write SetIdtiporegrabmf;
     Property Idtiporegraatuar: TCmDbField read FIdtiporegraatuar write SetIdtiporegraatuar;
     Property Idtipooperopcvd: TCmDbField read FIdtipooperopcvd write SetIdtipooperopcvd;
     Property Idtipooperopccp: TCmDbField read FIdtipooperopccp write SetIdtipooperopccp;
     Property Idtipooperliqpend: TCmDbField read FIdtipooperliqpend write SetIdtipooperliqpend;
     Property Idtipooperdirsub: TCmDbField read FIdtipooperdirsub write SetIdtipooperdirsub;
     Property Idtipooperdirres: TCmDbField read FIdtipooperdirres write SetIdtipooperdirres;
     Property Idtipooperdirree: TCmDbField read FIdtipooperdirree write SetIdtipooperdirree;
     Property Idtipooperdirprov: TCmDbField read FIdtipooperdirprov write SetIdtipooperdirprov;
     Property Idtipooperdirper: TCmDbField read FIdtipooperdirper write SetIdtipooperdirper;
     Property Idtipooperdirmul: TCmDbField read FIdtipooperdirmul write SetIdtipooperdirmul;
     Property Idtipooperdirjur: TCmDbField read FIdtipooperdirjur write SetIdtipooperdirjur;
     Property Idtipooperdirinc: TCmDbField read FIdtipooperdirinc write SetIdtipooperdirinc;
     Property Idtipooperdirgru: TCmDbField read FIdtipooperdirgru write SetIdtipooperdirgru;
     Property Idtipooperdirdsu: TCmDbField read FIdtipooperdirdsu write SetIdtipooperdirdsu;
     Property Idtipooperdirdiv: TCmDbField read FIdtipooperdirdiv write SetIdtipooperdirdiv;
     Property Idtipooperdirdes: TCmDbField read FIdtipooperdirdes write SetIdtipooperdirdes;
     Property Idtipooperdircis: TCmDbField read FIdtipooperdircis write SetIdtipooperdircis;
     Property Idtipooperdirbon: TCmDbField read FIdtipooperdirbon write SetIdtipooperdirbon;
     Property Idtipooperdiralt: TCmDbField read FIdtipooperdiralt write SetIdtipooperdiralt;
     Property Idtipoinvestidor: TCmDbField read FIdtipoinvestidor write SetIdtipoinvestidor;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idtipodespirprov: TCmDbField read FIdtipodespirprov write SetIdtipodespirprov;
     Property Idtipodespirapu: TCmDbField read FIdtipodespirapu write SetIdtipodespirapu;
     Property Idtipodespinvest: TCmDbField read FIdtipodespinvest write SetIdtipodespinvest;
     Property Idtipodespdvcor: TCmDbField read FIdtipodespdvcor write SetIdtipodespdvcor;
     Property Idtipocontrrf: TCmDbField read FIdtipocontrrf write SetIdtipocontrrf;
     Property Idtipocontrfin: TCmDbField read FIdtipocontrfin write SetIdtipocontrfin;
     Property Idtipoclienteemi: TCmDbField read FIdtipoclienteemi write SetIdtipoclienteemi;
     Property Idtipoclientecus: TCmDbField read FIdtipoclientecus write SetIdtipoclientecus;
     Property Idtipoclientecor: TCmDbField read FIdtipoclientecor write SetIdtipoclientecor;
     Property Idregraempacoes: TCmDbField read FIdregraempacoes write SetIdregraempacoes;
     Property Idramoforemi: TCmDbField read FIdramoforemi write SetIdramoforemi;
     Property Idramoforcus: TCmDbField read FIdramoforcus write SetIdramoforcus;
     Property Idramoforcor: TCmDbField read FIdramoforcor write SetIdramoforcor;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idparampatrliq: TCmDbField read FIdparampatrliq write SetIdparampatrliq;
     Property Idparaminvest: TCmDbField read FIdparaminvest write SetIdparaminvest;
     Property Idoperpagtojuros: TCmDbField read FIdoperpagtojuros write SetIdoperpagtojuros;
     Property Idoperincjuros: TCmDbField read FIdoperincjuros write SetIdoperincjuros;
     Property Idoperamortprinc: TCmDbField read FIdoperamortprinc write SetIdoperamortprinc;
     Property Idmotbloqopc: TCmDbField read FIdmotbloqopc write SetIdmotbloqopc;
     Property Idmotbloqempac: TCmDbField read FIdmotbloqempac write SetIdmotbloqempac;
     Property Idmercado: TCmDbField read FIdmercado write SetIdmercado;
     Property Idindexpoupanca: TCmDbField read FIdindexpoupanca write SetIdindexpoupanca;
     Property Idgruporegrainv: TCmDbField read FIdgruporegrainv write SetIdgruporegrainv;
     Property Idgrupodisp: TCmDbField read FIdgrupodisp write SetIdgrupodisp;
     Property Idcustodiarenfix: TCmDbField read FIdcustodiarenfix write SetIdcustodiarenfix;
     Property Idcontraparterf: TCmDbField read FIdcontraparterf write SetIdcontraparterf;
     Property Idclasspoupbloq: TCmDbField read FIdclasspoupbloq write SetIdclasspoupbloq;
     Property Idclassntn: TCmDbField read FIdclassntn write SetIdclassntn;
     Property Idclassetit: TCmDbField read FIdclassetit write SetIdclassetit;
     Property Idcartopcind: TCmDbField read FIdcartopcind write SetIdcartopcind;
     Property Idcartopc: TCmDbField read FIdcartopc write SetIdcartopc;
     Property Idcartempacoes: TCmDbField read FIdcartempacoes write SetIdcartempacoes;
     Property Idcartavista: TCmDbField read FIdcartavista write SetIdcartavista;
     Property Idbvsp: TCmDbField read FIdbvsp write SetIdbvsp;
     Property Idbmf: TCmDbField read FIdbmf write SetIdbmf;
     Property Idautorizaordem: TCmDbField read FIdautorizaordem write SetIdautorizaordem;
     Property Flgusasubconta: TCmDbField read FFlgusasubconta write SetFlgusasubconta;
     Property Flgrvemabertura: TCmDbField read FFlgrvemabertura write SetFlgrvemabertura;
     Property Flgrfemabertura: TCmDbField read FFlgrfemabertura write SetFlgrfemabertura;
     Property Flgrecpagrv: TCmDbField read FFlgrecpagrv write SetFlgrecpagrv;
     Property Flgprovisionairrv: TCmDbField read FFlgprovisionairrv write SetFlgprovisionairrv;
     Property Flgprovisionairrf: TCmDbField read FFlgprovisionairrf write SetFlgprovisionairrf;
     Property Flgpoupapropdia: TCmDbField read FFlgpoupapropdia write SetFlgpoupapropdia;
     Property Flgplanprevctbpat: TCmDbField read FFlgplanprevctbpat write SetFlgplanprevctbpat;
     Property Flgordmovinv: TCmDbField read FFlgordmovinv write SetFlgordmovinv;
     Property Flgliberaidlote: TCmDbField read FFlgliberaidlote write SetFlgliberaidlote;
     Property Flgintfinliq: TCmDbField read FFlgintfinliq write SetFlgintfinliq;
     Property Flgintcapcar: TCmDbField read FFlgintcapcar write SetFlgintcapcar;
     Property Flgimplantrf: TCmDbField read FFlgimplantrf write SetFlgimplantrf;
     Property Flgespecfundo: TCmDbField read FFlgespecfundo write SetFlgespecfundo;
     Property Flgempacoes: TCmDbField read FFlgempacoes write SetFlgempacoes;
     Property Flgemaberturafpt: TCmDbField read FFlgemaberturafpt write SetFlgemaberturafpt;
     Property Flgemaberturafif: TCmDbField read FFlgemaberturafif write SetFlgemaberturafif;
     Property Flgemaberturafid: TCmDbField read FFlgemaberturafid write SetFlgemaberturafid;
     Property Flgemaberturafib: TCmDbField read FFlgemaberturafib write SetFlgemaberturafib;
     Property Flgemaberturafao: TCmDbField read FFlgemaberturafao write SetFlgemaberturafao;
     Property Flgemaberturafac: TCmDbField read FFlgemaberturafac write SetFlgemaberturafac;
     Property Flgdemo: TCmDbField read FFlgdemo write SetFlgdemo;
     Property Flgcontabiliza: TCmDbField read FFlgcontabiliza write SetFlgcontabiliza;
     Property Flgcompvarrv: TCmDbField read FFlgcompvarrv write SetFlgcompvarrv;
     Property Flgcartgerenc: TCmDbField read FFlgcartgerenc write SetFlgcartgerenc;
     Property Dtmudacpmf: TCmDbField read FDtmudacpmf write SetDtmudacpmf;
     Property Difresgfundos: TCmDbField read FDifresgfundos write SetDifresgfundos;
     Property Difmaxopcind: TCmDbField read FDifmaxopcind write SetDifmaxopcind;
     Property Diasuteiscpmf: TCmDbField read FDiasuteiscpmf write SetDiasuteiscpmf;
     Property Diasemanacpmf: TCmDbField read FDiasemanacpmf write SetDiasemanacpmf;
     Property Dataultret: TCmDbField read FDataultret write SetDataultret;
     Property Dataultimpcot: TCmDbField read FDataultimpcot write SetDataultimpcot;
     Property Dataultfechrf: TCmDbField read FDataultfechrf write SetDataultfechrf;
     Property Dataultfechfdo: TCmDbField read FDataultfechfdo write SetDataultfechfdo;
     Property Dataultfechemp: TCmDbField read FDataultfechemp write SetDataultfechemp;
     Property Dataultfechbmf: TCmDbField read FDataultfechbmf write SetDataultfechbmf;
     Property Dataultfech: TCmDbField read FDataultfech write SetDataultfech;
     Property Datamovcdblib: TCmDbField read FDatamovcdblib write SetDatamovcdblib;
     Property Dataimplcartger: TCmDbField read FDataimplcartger write SetDataimplcartger;
     //AL_1
     Property IdTipoOperDirDSA : TCmDbField read FIdTipoOperDirDSA write SetIdTipoOperDirDSA;
     Property IdTipoOperDirDSR : TCmDbField read FIdTipoOperDirDSR write SetIdTipoOperDirDSR;
     Property Flgregimecxcomp: TCmDbField read FFlgregimecxcomp write SetFlgregimecxcomp;
     Property Dtaregimecxcomp: TCmDbField read FDtaregimecxcomp write SetDtaregimecxcomp;
     //AL_2
     Property FlgContabDiaUtil: TCmDbField read FFlgContabDiaUtil write SetFlgContabDiaUtil;
     //AL_3
     Property FlgIntContabRF  : TCmDbField read FFlgIntContabRF write SetFlgIntContabRF;
     Property FlgIntContabRV  : TCmDbField read FFlgIntContabRV write SetFlgIntContabRV;
     Property FlgIntContabBMF : TCmDbField read FFlgIntContabBMF write SetFlgIntContabBMF;
     Property FlgIntContabFRF : TCmDbField read FFlgIntContabFRF write SetFlgIntContabFRF;
     Property FlgIntContabFRV : TCmDbField read FFlgIntContabFRV write SetFlgIntContabFRV;
     Property FlgIntContabFIM : TCmDbField read FFlgIntContabFIM write SetFlgIntContabFIM;
     Property FlgIntContabFDC : TCmDbField read FFlgIntContabFDC write SetFlgIntContabFDC;
     Property FlgIntContabFIP : TCmDbField read FFlgIntContabFIP write SetFlgIntContabFIP;
     //AL_4
     Property IdMotBloqPenFdo : TCmDbField read FIdMotBloqPenFdo write SetIdMotBloqPenFdo;
     Property IdCarteiraRF : TCmDbField read FIdCarteiraRF write SetIdCarteiraRF;
     //AL_7
     Property FlgIntContabOPI : TCmDbField read FFlgIntContabOPI write SetFlgIntContabOPI;
     //AL_6
     Property IDUSREMABERTURAFMI: TCmDbField read FIDUSREMABERTURAFMI write SetIDUSREMABERTURAFMI;
     Property FLGEMABERTURAFMI: TCmDbField read FFLGEMABERTURAFMI write SetFLGEMABERTURAFMI;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParaminvest }

constructor TDbParaminvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMINVEST';

   fDataultfechrf    := CreateCmDbField('DATAULTFECHRF',ftDateTime,False,False,False,True,'');
   fIdcustodiarenfix := CreateCmDbField('IDCUSTODIARENFIX',ftfloat,False,False,False,True,'');
   fIdcontraparterf  := CreateCmDbField('IDCONTRAPARTERF',ftfloat,False,False,False,True,'');
   fIdoperincjuros   := CreateCmDbField('IDOPERINCJUROS',ftfloat,False,False,False,True,'');
   fIdoperpagtojuros := CreateCmDbField('IDOPERPAGTOJUROS',ftfloat,False,False,False,True,'');
   fIdoperamortprinc := CreateCmDbField('IDOPERAMORTPRINC',ftfloat,False,False,False,True,'');
   fIdclassetit      := CreateCmDbField('IDCLASSETIT',ftfloat,False,False,False,True,'');
   fIdclasspoupbloq  := CreateCmDbField('IDCLASSPOUPBLOQ',ftfloat,False,False,False,True,'');
   fIdindexpoupanca  := CreateCmDbField('IDINDEXPOUPANCA',ftfloat,False,False,False,True,'');
   fJurospoupanca    := CreateCmDbField('JUROSPOUPANCA',ftfloat,False,False,False,True,'');
   fFlgrfemabertura  := CreateCmDbField('FLGRFEMABERTURA',ftString,False,False,False,True,'');
   fIdusuarioprocrf  := CreateCmDbField('IDUSUARIOPROCRF',ftfloat,False,False,False,True,'');
   fFlgpoupapropdia  := CreateCmDbField('FLGPOUPAPROPDIA',ftString,False,False,False,True,'');
   fVlrdiverg := CreateCmDbField('VLRDIVERG',ftfloat,False,False,False,True,'');
   fVlrcotainicart := CreateCmDbField('VLRCOTAINICART',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTipomenu := CreateCmDbField('TIPOMENU',ftString,False,False,False,True,'');
   fStaret := CreateCmDbField('STARET',ftString,False,False,False,True,'');
   fPucdb := CreateCmDbField('PUCDB',ftfloat,False,False,False,True,'');
   fPrzvenccfianca := CreateCmDbField('PRZVENCCFIANCA',ftfloat,False,False,False,True,'');
   fPrzvencbmf := CreateCmDbField('PRZVENCBMF',ftfloat,False,False,False,True,'');
   fPercpuordmovinv := CreateCmDbField('PERCPUORDMOVINV',ftfloat,False,False,False,True,'');
   fPercparticrecur := CreateCmDbField('PERCPARTICRECUR',ftfloat,False,False,False,True,'');
   fPercparticempr := CreateCmDbField('PERCPARTICEMPR',ftfloat,False,False,False,True,'');
   fPercimprenda := CreateCmDbField('PERCIMPRENDA',ftfloat,False,False,False,True,'');
   fPercdevrv := CreateCmDbField('PERCDEVRV',ftfloat,False,False,False,True,'');
   fPercdevbmf := CreateCmDbField('PERCDEVBMF',ftfloat,False,False,False,True,'');
   fMoedager := CreateCmDbField('MOEDAGER',ftfloat,False,False,False,True,'');
   fMoedaeqm := CreateCmDbField('MOEDAEQM',ftfloat,False,False,False,True,'');
   fMoedaatulit := CreateCmDbField('MOEDAATULIT',ftfloat,False,False,False,True,'');
   fMoedaatu := CreateCmDbField('MOEDAATU',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fMascsetoremissor := CreateCmDbField('MASCSETOREMISSOR',ftString,True,False,False,True,'');
   fMascclassifinv := CreateCmDbField('MASCCLASSIFINV',ftString,False,False,False,True,'');
   fIdusuarioprocrv := CreateCmDbField('IDUSUARIOPROCRV',ftfloat,False,False,False,True,'');
   fIdusremaberturafpt := CreateCmDbField('IDUSREMABERTURAFPT',ftfloat,False,False,False,True,'');
   fIdusremaberturafif := CreateCmDbField('IDUSREMABERTURAFIF',ftfloat,False,False,False,True,'');
   fIdusremaberturafid := CreateCmDbField('IDUSREMABERTURAFID',ftfloat,False,False,False,True,'');
   fIdusremaberturafib := CreateCmDbField('IDUSREMABERTURAFIB',ftfloat,False,False,False,True,'');
   fIdusremaberturafao := CreateCmDbField('IDUSREMABERTURAFAO',ftfloat,False,False,False,True,'');
   fIdusremaberturafac := CreateCmDbField('IDUSREMABERTURAFAC',ftfloat,False,False,False,True,'');
   fIdtpperiodicidade := CreateCmDbField('IDTPPERIODICIDADE',ftfloat,False,False,False,True,'');
   fIdtiporegrarv := CreateCmDbField('IDTIPOREGRARV',ftfloat,False,False,False,True,'');
   fIdtiporegrarf := CreateCmDbField('IDTIPOREGRARF',ftfloat,False,False,False,True,'');
   fIdtiporegrarentju := CreateCmDbField('IDTIPOREGRARENTJU',ftfloat,False,False,False,True,'');
   fIdtiporegrarent := CreateCmDbField('IDTIPOREGRARENT',ftfloat,False,False,False,True,'');
   fIdtiporegraopcin := CreateCmDbField('IDTIPOREGRAOPCIN',ftfloat,False,False,False,True,'');
   fIdtiporegrafnd := CreateCmDbField('IDTIPOREGRAFND',ftfloat,False,False,False,True,'');
   fIdtiporegraempac := CreateCmDbField('IDTIPOREGRAEMPAC',ftfloat,False,False,False,True,'');
   fIdtiporegrabmf := CreateCmDbField('IDTIPOREGRABMF',ftfloat,False,False,False,True,'');
   fIdtiporegraatuar := CreateCmDbField('IDTIPOREGRAATUAR',ftfloat,False,False,False,True,'');
   fIdtipooperopcvd := CreateCmDbField('IDTIPOOPEROPCVD',ftfloat,False,False,False,True,'');
   fIdtipooperopccp := CreateCmDbField('IDTIPOOPEROPCCP',ftfloat,False,False,False,True,'');
   fIdtipooperliqpend := CreateCmDbField('IDTIPOOPERLIQPEND',ftfloat,False,False,False,True,'');
   fIdtipooperdirsub := CreateCmDbField('IDTIPOOPERDIRSUB',ftfloat,False,False,False,True,'');
   fIdtipooperdirres := CreateCmDbField('IDTIPOOPERDIRRES',ftfloat,False,False,False,True,'');
   fIdtipooperdirree := CreateCmDbField('IDTIPOOPERDIRREE',ftfloat,False,False,False,True,'');
   fIdtipooperdirprov := CreateCmDbField('IDTIPOOPERDIRPROV',ftfloat,False,False,False,True,'');
   fIdtipooperdirper := CreateCmDbField('IDTIPOOPERDIRPER',ftfloat,False,False,False,True,'');
   fIdtipooperdirmul := CreateCmDbField('IDTIPOOPERDIRMUL',ftfloat,False,False,False,True,'');
   fIdtipooperdirjur := CreateCmDbField('IDTIPOOPERDIRJUR',ftfloat,False,False,False,True,'');
   fIdtipooperdirinc := CreateCmDbField('IDTIPOOPERDIRINC',ftfloat,False,False,False,True,'');
   fIdtipooperdirgru := CreateCmDbField('IDTIPOOPERDIRGRU',ftfloat,False,False,False,True,'');
   fIdtipooperdirdsu := CreateCmDbField('IDTIPOOPERDIRDSU',ftfloat,False,False,False,True,'');
   fIdtipooperdirdiv := CreateCmDbField('IDTIPOOPERDIRDIV',ftfloat,False,False,False,True,'');
   fIdtipooperdirdes := CreateCmDbField('IDTIPOOPERDIRDES',ftfloat,False,False,False,True,'');
   fIdtipooperdircis := CreateCmDbField('IDTIPOOPERDIRCIS',ftfloat,False,False,False,True,'');
   fIdtipooperdirbon := CreateCmDbField('IDTIPOOPERDIRBON',ftfloat,False,False,False,True,'');
   fIdtipooperdiralt := CreateCmDbField('IDTIPOOPERDIRALT',ftfloat,False,False,False,True,'');
   fIdtipoinvestidor := CreateCmDbField('IDTIPOINVESTIDOR',ftfloat,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdtipodespirprov := CreateCmDbField('IDTIPODESPIRPROV',ftfloat,False,False,False,True,'');
   fIdtipodespirapu := CreateCmDbField('IDTIPODESPIRAPU',ftfloat,False,False,False,True,'');
   fIdtipodespinvest := CreateCmDbField('IDTIPODESPINVEST',ftfloat,False,False,False,True,'');
   fIdtipodespdvcor := CreateCmDbField('IDTIPODESPDVCOR',ftfloat,False,False,False,True,'');
   fIdtipocontrrf := CreateCmDbField('IDTIPOCONTRRF',ftfloat,False,False,False,True,'');
   fIdtipocontrfin := CreateCmDbField('IDTIPOCONTRFIN',ftfloat,False,False,False,True,'');
   fIdtipoclienteemi := CreateCmDbField('IDTIPOCLIENTEEMI',ftfloat,False,False,False,True,'');
   fIdtipoclientecus := CreateCmDbField('IDTIPOCLIENTECUS',ftfloat,False,False,False,True,'');
   fIdtipoclientecor := CreateCmDbField('IDTIPOCLIENTECOR',ftfloat,False,False,False,True,'');
   fIdregraempacoes := CreateCmDbField('IDREGRAEMPACOES',ftfloat,False,False,False,True,'');
   fIdramoforemi := CreateCmDbField('IDRAMOFOREMI',ftfloat,False,False,False,True,'');
   fIdramoforcus := CreateCmDbField('IDRAMOFORCUS',ftfloat,False,False,False,True,'');
   fIdramoforcor := CreateCmDbField('IDRAMOFORCOR',ftfloat,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'');
   fIdparampatrliq := CreateCmDbField('IDPARAMPATRLIQ',ftfloat,False,False,False,True,'');
   fIdparaminvest := CreateCmDbField('IDPARAMINVEST',ftfloat,True,True,False,True,'');
   fIdmotbloqopc := CreateCmDbField('IDMOTBLOQOPC',ftfloat,False,False,False,True,'');
   fIdmotbloqempac := CreateCmDbField('IDMOTBLOQEMPAC',ftfloat,False,False,False,True,'');
   fIdmercado := CreateCmDbField('IDMERCADO',ftfloat,False,False,False,True,'');
   fIdgruporegrainv := CreateCmDbField('IDGRUPOREGRAINV',ftfloat,False,False,False,True,'');
   fIdgrupodisp := CreateCmDbField('IDGRUPODISP',ftfloat,False,False,False,True,'');
   fIdclassntn := CreateCmDbField('IDCLASSNTN',ftfloat,False,False,False,True,'');
   fIdcartopcind := CreateCmDbField('IDCARTOPCIND',ftfloat,False,False,False,True,'');
   fIdcartopc := CreateCmDbField('IDCARTOPC',ftfloat,False,False,False,True,'');
   fIdcartempacoes := CreateCmDbField('IDCARTEMPACOES',ftfloat,False,False,False,True,'');
   fIdcartavista := CreateCmDbField('IDCARTAVISTA',ftfloat,False,False,False,True,'');
   fIdbvsp := CreateCmDbField('IDBVSP',ftfloat,False,False,False,True,'');
   fIdbmf := CreateCmDbField('IDBMF',ftfloat,False,False,False,True,'');
   fIdautorizaordem := CreateCmDbField('IDAUTORIZAORDEM',ftfloat,False,False,False,True,'');
   fFlgusasubconta := CreateCmDbField('FLGUSASUBCONTA',ftString,False,False,False,True,'');
   fFlgrvemabertura := CreateCmDbField('FLGRVEMABERTURA',ftString,False,False,False,True,'');
   fFlgrecpagrv := CreateCmDbField('FLGRECPAGRV',ftString,False,False,False,True,'');
   fFlgprovisionairrv := CreateCmDbField('FLGPROVISIONAIRRV',ftString,False,False,False,True,'');
   fFlgprovisionairrf := CreateCmDbField('FLGPROVISIONAIRRF',ftString,False,False,False,True,'');
   fFlgplanprevctbpat := CreateCmDbField('FLGPLANPREVCTBPAT',ftString,False,False,False,True,'');
   fFlgordmovinv := CreateCmDbField('FLGORDMOVINV',ftString,False,False,False,True,'');
   fFlgliberaidlote := CreateCmDbField('FLGLIBERAIDLOTE',ftString,False,False,False,True,'');
   fFlgintfinliq := CreateCmDbField('FLGINTFINLIQ',ftString,False,False,False,True,'');
   fFlgintcapcar := CreateCmDbField('FLGINTCAPCAR',ftString,False,False,False,True,'');
   fFlgimplantrf := CreateCmDbField('FLGIMPLANTRF',ftString,False,False,False,True,'');
   fFlgespecfundo := CreateCmDbField('FLGESPECFUNDO',ftString,False,False,False,True,'');
   fFlgempacoes := CreateCmDbField('FLGEMPACOES',ftString,False,False,False,True,'');
   fFlgemaberturafpt := CreateCmDbField('FLGEMABERTURAFPT',ftString,False,False,False,True,'');
   fFlgemaberturafif := CreateCmDbField('FLGEMABERTURAFIF',ftString,False,False,False,True,'');
   fFlgemaberturafid := CreateCmDbField('FLGEMABERTURAFID',ftString,False,False,False,True,'');
   fFlgemaberturafib := CreateCmDbField('FLGEMABERTURAFIB',ftString,False,False,False,True,'');
   fFlgemaberturafao := CreateCmDbField('FLGEMABERTURAFAO',ftString,False,False,False,True,'');
   fFlgemaberturafac := CreateCmDbField('FLGEMABERTURAFAC',ftString,False,False,False,True,'');
   fFlgdemo := CreateCmDbField('FLGDEMO',ftString,False,False,False,True,'');
   fFlgcontabiliza := CreateCmDbField('FLGCONTABILIZA',ftString,False,False,False,True,'');
   fFlgcompvarrv := CreateCmDbField('FLGCOMPVARRV',ftString,False,False,False,True,'');
   fFlgcartgerenc := CreateCmDbField('FLGCARTGERENC',ftString,False,False,False,True,'');
   fDtmudacpmf := CreateCmDbField('DTMUDACPMF',ftDateTime,False,False,False,True,'');
   fDifresgfundos := CreateCmDbField('DIFRESGFUNDOS',ftfloat,False,False,False,True,'');
   fDifmaxopcind := CreateCmDbField('DIFMAXOPCIND',ftfloat,False,False,False,True,'');
   fDiasuteiscpmf := CreateCmDbField('DIASUTEISCPMF',ftfloat,False,False,False,True,'');
   fDiasemanacpmf := CreateCmDbField('DIASEMANACPMF',ftString,False,False,False,True,'');
   fDataultret := CreateCmDbField('DATAULTRET',ftDateTime,False,False,False,True,'');
   fDataultimpcot := CreateCmDbField('DATAULTIMPCOT',ftDateTime,False,False,False,True,'');
   fDataultfechfdo := CreateCmDbField('DATAULTFECHFDO',ftDateTime,False,False,False,True,'');
   fDataultfechemp := CreateCmDbField('DATAULTFECHEMP',ftDateTime,False,False,False,True,'');
   fDataultfechbmf := CreateCmDbField('DATAULTFECHBMF',ftDateTime,False,False,False,True,'');
   fDataultfech := CreateCmDbField('DATAULTFECH',ftDateTime,False,False,False,True,'');
   fDatamovcdblib := CreateCmDbField('DATAMOVCDBLIB',ftDateTime,False,False,False,True,'');
   fDataimplcartger := CreateCmDbField('DATAIMPLCARTGER',ftDateTime,False,False,False,True,'');
   //AL_1
   fIdTipoOperDirDSA := CreateCmDbField('IDTIPOOPERDIRDSA',ftfloat,False,False,False,True,'');
   fIdTipoOperDirDSR := CreateCmDbField('IDTIPOOPERDIRDSR',ftfloat,False,False,False,True,'');
   fFlgregimecxcomp := CreateCmDbField('FLGREGIMECXCOMP',ftString,False,False,False,True,'');
   fDtaregimecxcomp := CreateCmDbField('DTAREGIMECXCOMP',ftDateTime,False,False,False,True,'');
   //AL_2
   fFlgContabDiaUtil := CreateCmDbField('FLGCONTABDIAUTIL',ftString,False,False,False,True,'');

   //AL_3
   fFlgIntContabFRV := CreateCmDbField('FLGINTCONTABFRV',ftString,False,False,False,True,'');
   fFlgIntContabFRF := CreateCmDbField('FLGINTCONTABFRF',ftString,False,False,False,True,'');
   fFlgIntContabBMF := CreateCmDbField('FLGINTCONTABBMF',ftString,False,False,False,True,'');
   fFlgIntContabRV  := CreateCmDbField('FLGINTCONTABRV',ftString,False,False,False,True,'');
   fFlgIntContabFIM := CreateCmDbField('FLGINTCONTABFIM',ftString,False,False,False,True,'');
   fFlgIntContabFDC := CreateCmDbField('FLGINTCONTABFDC',ftString,False,False,False,True,'');
   fFlgIntContabRF  := CreateCmDbField('FLGINTCONTABRF',ftString,False,False,False,True,'');
   fFlgIntContabFIP := CreateCmDbField('FLGINTCONTABFIP',ftString,False,False,False,True,'');
   //AL_7   
   fFlgIntContabOPI := CreateCmDbField('FLGINTCONTABOPI',ftString,False,False,False,True,'');
   //AL_4
   fIdMotBloqPenFdo := CreateCmDbField('IDMOTBLOQPENFDO',ftfloat,False,False,False,True,'');
   fIdCarteiraRF := CreateCmDbField('IDCARTEIRARF',ftfloat,False,False,False,True,'');
   //AL_6
   FIDUSREMABERTURAFMI := CreateCmDbField('IDUSREMABERTURAFMI',ftFloat,False,False,False,True,'');
   FFLGEMABERTURAFMI  := CreateCmDbField('FLGEMABERTURAFMI',ftString,False,False,False,True,'');
end;

function TDbParaminvest.Insert: Boolean;
begin

   fIdparaminvest.AsFloat := GetSequence('PARAMINVEST');
   Result := Inherited Insert;

end;


procedure TDbParaminvest.SetDataimplcartger(const Value: TCmDbField);
begin
  FDataimplcartger := Value;
end;

procedure TDbParaminvest.SetDatamovcdblib(const Value: TCmDbField);
begin
  FDatamovcdblib := Value;
end;

procedure TDbParaminvest.SetDataultfech(const Value: TCmDbField);
begin
  FDataultfech := Value;
end;

procedure TDbParaminvest.SetDataultfechbmf(const Value: TCmDbField);
begin
  FDataultfechbmf := Value;
end;

procedure TDbParaminvest.SetDataultfechemp(const Value: TCmDbField);
begin
  FDataultfechemp := Value;
end;

procedure TDbParaminvest.SetDataultfechfdo(const Value: TCmDbField);
begin
  FDataultfechfdo := Value;
end;

procedure TDbParaminvest.SetDataultfechrf(const Value: TCmDbField);
begin
  FDataultfechrf := Value;
end;

procedure TDbParaminvest.SetDataultimpcot(const Value: TCmDbField);
begin
  FDataultimpcot := Value;
end;

procedure TDbParaminvest.SetDataultret(const Value: TCmDbField);
begin
  FDataultret := Value;
end;

procedure TDbParaminvest.SetDiasemanacpmf(const Value: TCmDbField);
begin
  FDiasemanacpmf := Value;
end;

procedure TDbParaminvest.SetDiasuteiscpmf(const Value: TCmDbField);
begin
  FDiasuteiscpmf := Value;
end;

procedure TDbParaminvest.SetDifmaxopcind(const Value: TCmDbField);
begin
  FDifmaxopcind := Value;
end;

procedure TDbParaminvest.SetDifresgfundos(const Value: TCmDbField);
begin
  FDifresgfundos := Value;
end;

procedure TDbParaminvest.SetDtaregimecxcomp(const Value: TCmDbField);
begin
  FDtaregimecxcomp := Value;
end;

procedure TDbParaminvest.SetDtmudacpmf(const Value: TCmDbField);
begin
  FDtmudacpmf := Value;
end;

procedure TDbParaminvest.SetFlgcartgerenc(const Value: TCmDbField);
begin
  FFlgcartgerenc := Value;
end;

procedure TDbParaminvest.SetFlgcompvarrv(const Value: TCmDbField);
begin
  FFlgcompvarrv := Value;
end;

procedure TDbParaminvest.SetFlgContabDiaUtil(const Value: TCmDbField);
begin
  FFlgContabDiaUtil := Value;
end;

procedure TDbParaminvest.SetFlgcontabiliza(const Value: TCmDbField);
begin
  FFlgcontabiliza := Value;
end;

procedure TDbParaminvest.SetFlgdemo(const Value: TCmDbField);
begin
  FFlgdemo := Value;
end;

procedure TDbParaminvest.SetFlgemaberturafac(const Value: TCmDbField);
begin
  FFlgemaberturafac := Value;
end;

procedure TDbParaminvest.SetFlgemaberturafao(const Value: TCmDbField);
begin
  FFlgemaberturafao := Value;
end;

procedure TDbParaminvest.SetFlgemaberturafib(const Value: TCmDbField);
begin
  FFlgemaberturafib := Value;
end;

procedure TDbParaminvest.SetFlgemaberturafid(const Value: TCmDbField);
begin
  FFlgemaberturafid := Value;
end;

procedure TDbParaminvest.SetFlgemaberturafif(const Value: TCmDbField);
begin
  FFlgemaberturafif := Value;
end;

procedure TDbParaminvest.SetFlgemaberturafpt(const Value: TCmDbField);
begin
  FFlgemaberturafpt := Value;
end;

procedure TDbParaminvest.SetFlgempacoes(const Value: TCmDbField);
begin
  FFlgempacoes := Value;
end;

procedure TDbParaminvest.SetFlgespecfundo(const Value: TCmDbField);
begin
  FFlgespecfundo := Value;
end;

procedure TDbParaminvest.SetFlgimplantrf(const Value: TCmDbField);
begin
  FFlgimplantrf := Value;
end;

procedure TDbParaminvest.SetFlgintcapcar(const Value: TCmDbField);
begin
  FFlgintcapcar := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabBMF(const Value: TCmDbField);
begin
  FFlgIntContabBMF := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabFDC(const Value: TCmDbField);
begin
  FFlgIntContabFDC := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabFIM(const Value: TCmDbField);
begin
  FFlgIntContabFIM := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabFIP(const Value: TCmDbField);
begin
  FFlgIntContabFIP := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabFRF(const Value: TCmDbField);
begin
  FFlgIntContabFRF := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabFRV(const Value: TCmDbField);
begin
  FFlgIntContabFRV := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabRF(const Value: TCmDbField);
begin
  FFlgIntContabRF := Value;
end;
//AL_3
procedure TDbParaminvest.SetFlgIntContabRV(const Value: TCmDbField);
begin
  FFlgIntContabRV := Value;
end;

procedure TDbParaminvest.SetFlgintfinliq(const Value: TCmDbField);
begin
  FFlgintfinliq := Value;
end;

procedure TDbParaminvest.SetFlgliberaidlote(const Value: TCmDbField);
begin
  FFlgliberaidlote := Value;
end;

procedure TDbParaminvest.SetFlgordmovinv(const Value: TCmDbField);
begin
  FFlgordmovinv := Value;
end;

procedure TDbParaminvest.SetFlgplanprevctbpat(const Value: TCmDbField);
begin
  FFlgplanprevctbpat := Value;
end;

procedure TDbParaminvest.SetFlgpoupapropdia(const Value: TCmDbField);
begin
  FFlgpoupapropdia := Value;
end;

procedure TDbParaminvest.SetFlgprovisionairrf(const Value: TCmDbField);
begin
  FFlgprovisionairrf := Value;
end;

procedure TDbParaminvest.SetFlgprovisionairrv(const Value: TCmDbField);
begin
  FFlgprovisionairrv := Value;
end;

procedure TDbParaminvest.SetFlgrecpagrv(const Value: TCmDbField);
begin
  FFlgrecpagrv := Value;
end;

procedure TDbParaminvest.SetFlgregimecxcomp(const Value: TCmDbField);
begin
  FFlgregimecxcomp := Value;
end;

procedure TDbParaminvest.SetFlgrfemabertura(const Value: TCmDbField);
begin
  FFlgrfemabertura := Value;
end;

procedure TDbParaminvest.SetFlgrvemabertura(const Value: TCmDbField);
begin
  FFlgrvemabertura := Value;
end;

procedure TDbParaminvest.SetFlgusasubconta(const Value: TCmDbField);
begin
  FFlgusasubconta := Value;
end;

procedure TDbParaminvest.SetIdautorizaordem(const Value: TCmDbField);
begin
  FIdautorizaordem := Value;
end;

procedure TDbParaminvest.SetIdbmf(const Value: TCmDbField);
begin
  FIdbmf := Value;
end;

procedure TDbParaminvest.SetIdbvsp(const Value: TCmDbField);
begin
  FIdbvsp := Value;
end;

procedure TDbParaminvest.SetIdcartavista(const Value: TCmDbField);
begin
  FIdcartavista := Value;
end;

procedure TDbParaminvest.SetIdcartempacoes(const Value: TCmDbField);
begin
  FIdcartempacoes := Value;
end;

procedure TDbParaminvest.SetIdcartopc(const Value: TCmDbField);
begin
  FIdcartopc := Value;
end;

procedure TDbParaminvest.SetIdcartopcind(const Value: TCmDbField);
begin
  FIdcartopcind := Value;
end;

procedure TDbParaminvest.SetIdclassetit(const Value: TCmDbField);
begin
  FIdclassetit := Value;
end;

procedure TDbParaminvest.SetIdclassntn(const Value: TCmDbField);
begin
  FIdclassntn := Value;
end;

procedure TDbParaminvest.SetIdclasspoupbloq(const Value: TCmDbField);
begin
  FIdclasspoupbloq := Value;
end;

procedure TDbParaminvest.SetIdcontraparterf(const Value: TCmDbField);
begin
  FIdcontraparterf := Value;
end;

procedure TDbParaminvest.SetIdcustodiarenfix(const Value: TCmDbField);
begin
  FIdcustodiarenfix := Value;
end;

procedure TDbParaminvest.SetIdgrupodisp(const Value: TCmDbField);
begin
  FIdgrupodisp := Value;
end;

procedure TDbParaminvest.SetIdgruporegrainv(const Value: TCmDbField);
begin
  FIdgruporegrainv := Value;
end;

procedure TDbParaminvest.SetIdindexpoupanca(const Value: TCmDbField);
begin
  FIdindexpoupanca := Value;
end;

procedure TDbParaminvest.SetIdmercado(const Value: TCmDbField);
begin
  FIdmercado := Value;
end;

procedure TDbParaminvest.SetIdmotbloqempac(const Value: TCmDbField);
begin
  FIdmotbloqempac := Value;
end;

procedure TDbParaminvest.SetIdmotbloqopc(const Value: TCmDbField);
begin
  FIdmotbloqopc := Value;
end;

procedure TDbParaminvest.SetIdoperamortprinc(const Value: TCmDbField);
begin
  FIdoperamortprinc := Value;
end;

procedure TDbParaminvest.SetIdoperincjuros(const Value: TCmDbField);
begin
  FIdoperincjuros := Value;
end;

procedure TDbParaminvest.SetIdoperpagtojuros(const Value: TCmDbField);
begin
  FIdoperpagtojuros := Value;
end;

procedure TDbParaminvest.SetIdparaminvest(const Value: TCmDbField);
begin
  FIdparaminvest := Value;
end;

procedure TDbParaminvest.SetIdparampatrliq(const Value: TCmDbField);
begin
  FIdparampatrliq := Value;
end;

procedure TDbParaminvest.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbParaminvest.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbParaminvest.SetIdramoforcor(const Value: TCmDbField);
begin
  FIdramoforcor := Value;
end;

procedure TDbParaminvest.SetIdramoforcus(const Value: TCmDbField);
begin
  FIdramoforcus := Value;
end;

procedure TDbParaminvest.SetIdramoforemi(const Value: TCmDbField);
begin
  FIdramoforemi := Value;
end;

procedure TDbParaminvest.SetIdregraempacoes(const Value: TCmDbField);
begin
  FIdregraempacoes := Value;
end;

procedure TDbParaminvest.SetIdtipoclientecor(const Value: TCmDbField);
begin
  FIdtipoclientecor := Value;
end;

procedure TDbParaminvest.SetIdtipoclientecus(const Value: TCmDbField);
begin
  FIdtipoclientecus := Value;
end;

procedure TDbParaminvest.SetIdtipoclienteemi(const Value: TCmDbField);
begin
  FIdtipoclienteemi := Value;
end;

procedure TDbParaminvest.SetIdtipocontrfin(const Value: TCmDbField);
begin
  FIdtipocontrfin := Value;
end;

procedure TDbParaminvest.SetIdtipocontrrf(const Value: TCmDbField);
begin
  FIdtipocontrrf := Value;
end;

procedure TDbParaminvest.SetIdtipodespdvcor(const Value: TCmDbField);
begin
  FIdtipodespdvcor := Value;
end;

procedure TDbParaminvest.SetIdtipodespinvest(const Value: TCmDbField);
begin
  FIdtipodespinvest := Value;
end;

procedure TDbParaminvest.SetIdtipodespirapu(const Value: TCmDbField);
begin
  FIdtipodespirapu := Value;
end;

procedure TDbParaminvest.SetIdtipodespirprov(const Value: TCmDbField);
begin
  FIdtipodespirprov := Value;
end;

procedure TDbParaminvest.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbParaminvest.SetIdtipoinvestidor(const Value: TCmDbField);
begin
  FIdtipoinvestidor := Value;
end;

procedure TDbParaminvest.SetIdtipooperdiralt(const Value: TCmDbField);
begin
  FIdtipooperdiralt := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirbon(const Value: TCmDbField);
begin
  FIdtipooperdirbon := Value;
end;

procedure TDbParaminvest.SetIdtipooperdircis(const Value: TCmDbField);
begin
  FIdtipooperdircis := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirdes(const Value: TCmDbField);
begin
  FIdtipooperdirdes := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirdiv(const Value: TCmDbField);
begin
  FIdtipooperdirdiv := Value;
end;

procedure TDbParaminvest.SetIdTipoOperDirDSA(const Value: TCmDbField);
begin
  FIdTipoOperDirDSA := Value;
end;

procedure TDbParaminvest.SetIdTipoOperDirDSR(const Value: TCmDbField);
begin
  FIdTipoOperDirDSR := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirdsu(const Value: TCmDbField);
begin
  FIdtipooperdirdsu := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirgru(const Value: TCmDbField);
begin
  FIdtipooperdirgru := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirinc(const Value: TCmDbField);
begin
  FIdtipooperdirinc := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirjur(const Value: TCmDbField);
begin
  FIdtipooperdirjur := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirmul(const Value: TCmDbField);
begin
  FIdtipooperdirmul := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirper(const Value: TCmDbField);
begin
  FIdtipooperdirper := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirprov(const Value: TCmDbField);
begin
  FIdtipooperdirprov := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirree(const Value: TCmDbField);
begin
  FIdtipooperdirree := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirres(const Value: TCmDbField);
begin
  FIdtipooperdirres := Value;
end;

procedure TDbParaminvest.SetIdtipooperdirsub(const Value: TCmDbField);
begin
  FIdtipooperdirsub := Value;
end;

procedure TDbParaminvest.SetIdtipooperliqpend(const Value: TCmDbField);
begin
  FIdtipooperliqpend := Value;
end;

procedure TDbParaminvest.SetIdtipooperopccp(const Value: TCmDbField);
begin
  FIdtipooperopccp := Value;
end;

procedure TDbParaminvest.SetIdtipooperopcvd(const Value: TCmDbField);
begin
  FIdtipooperopcvd := Value;
end;

procedure TDbParaminvest.SetIdtiporegraatuar(const Value: TCmDbField);
begin
  FIdtiporegraatuar := Value;
end;

procedure TDbParaminvest.SetIdtiporegrabmf(const Value: TCmDbField);
begin
  FIdtiporegrabmf := Value;
end;

procedure TDbParaminvest.SetIdtiporegraempac(const Value: TCmDbField);
begin
  FIdtiporegraempac := Value;
end;

procedure TDbParaminvest.SetIdtiporegrafnd(const Value: TCmDbField);
begin
  FIdtiporegrafnd := Value;
end;

procedure TDbParaminvest.SetIdtiporegraopcin(const Value: TCmDbField);
begin
  FIdtiporegraopcin := Value;
end;

procedure TDbParaminvest.SetIdtiporegrarent(const Value: TCmDbField);
begin
  FIdtiporegrarent := Value;
end;

procedure TDbParaminvest.SetIdtiporegrarentju(const Value: TCmDbField);
begin
  FIdtiporegrarentju := Value;
end;

procedure TDbParaminvest.SetIdtiporegrarf(const Value: TCmDbField);
begin
  FIdtiporegrarf := Value;
end;

procedure TDbParaminvest.SetIdtiporegrarv(const Value: TCmDbField);
begin
  FIdtiporegrarv := Value;
end;

procedure TDbParaminvest.SetIdtpperiodicidade(const Value: TCmDbField);
begin
  FIdtpperiodicidade := Value;
end;

procedure TDbParaminvest.SetIdusremaberturafac(const Value: TCmDbField);
begin
  FIdusremaberturafac := Value;
end;

procedure TDbParaminvest.SetIdusremaberturafao(const Value: TCmDbField);
begin
  FIdusremaberturafao := Value;
end;

procedure TDbParaminvest.SetIdusremaberturafib(const Value: TCmDbField);
begin
  FIdusremaberturafib := Value;
end;

procedure TDbParaminvest.SetIdusremaberturafid(const Value: TCmDbField);
begin
  FIdusremaberturafid := Value;
end;

procedure TDbParaminvest.SetIdusremaberturafif(const Value: TCmDbField);
begin
  FIdusremaberturafif := Value;
end;

procedure TDbParaminvest.SetIdusremaberturafpt(const Value: TCmDbField);
begin
  FIdusremaberturafpt := Value;
end;

procedure TDbParaminvest.SetIdusuarioprocrf(const Value: TCmDbField);
begin
  FIdusuarioprocrf := Value;
end;

procedure TDbParaminvest.SetIdusuarioprocrv(const Value: TCmDbField);
begin
  FIdusuarioprocrv := Value;
end;

procedure TDbParaminvest.SetJurospoupanca(const Value: TCmDbField);
begin
  FJurospoupanca := Value;
end;

procedure TDbParaminvest.SetMascclassifinv(const Value: TCmDbField);
begin
  FMascclassifinv := Value;
end;

procedure TDbParaminvest.SetMascsetoremissor(const Value: TCmDbField);
begin
  FMascsetoremissor := Value;
end;

procedure TDbParaminvest.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbParaminvest.SetMoedaatu(const Value: TCmDbField);
begin
  FMoedaatu := Value;
end;

procedure TDbParaminvest.SetMoedaatulit(const Value: TCmDbField);
begin
  FMoedaatulit := Value;
end;

procedure TDbParaminvest.SetMoedaeqm(const Value: TCmDbField);
begin
  FMoedaeqm := Value;
end;

procedure TDbParaminvest.SetMoedager(const Value: TCmDbField);
begin
  FMoedager := Value;
end;

procedure TDbParaminvest.SetPercdevbmf(const Value: TCmDbField);
begin
  FPercdevbmf := Value;
end;

procedure TDbParaminvest.SetPercdevrv(const Value: TCmDbField);
begin
  FPercdevrv := Value;
end;

procedure TDbParaminvest.SetPercimprenda(const Value: TCmDbField);
begin
  FPercimprenda := Value;
end;

procedure TDbParaminvest.SetPercparticempr(const Value: TCmDbField);
begin
  FPercparticempr := Value;
end;

procedure TDbParaminvest.SetPercparticrecur(const Value: TCmDbField);
begin
  FPercparticrecur := Value;
end;

procedure TDbParaminvest.SetPercpuordmovinv(const Value: TCmDbField);
begin
  FPercpuordmovinv := Value;
end;

procedure TDbParaminvest.SetPrzvencbmf(const Value: TCmDbField);
begin
  FPrzvencbmf := Value;
end;

procedure TDbParaminvest.SetPrzvenccfianca(const Value: TCmDbField);
begin
  FPrzvenccfianca := Value;
end;

procedure TDbParaminvest.SetPucdb(const Value: TCmDbField);
begin
  FPucdb := Value;
end;

procedure TDbParaminvest.SetStaret(const Value: TCmDbField);
begin
  FStaret := Value;
end;

procedure TDbParaminvest.SetTipomenu(const Value: TCmDbField);
begin
  FTipomenu := Value;
end;

procedure TDbParaminvest.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbParaminvest.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbParaminvest.SetVlrcotainicart(const Value: TCmDbField);
begin
  FVlrcotainicart := Value;
end;

procedure TDbParaminvest.SetVlrdiverg(const Value: TCmDbField);
begin
  FVlrdiverg := Value;
end;

//AL_4
procedure TDbParaminvest.SetIdMotBloqPenFdo(const Value: TCmDbField);
begin
  FIdMotBloqPenFdo := Value;
end;

//AL_4
procedure TDbParaminvest.SetIdCarteiraRF(const Value: TCmDbField);
begin
  FIdCarteiraRF := Value;
end;

//AL_6
procedure TDbParaminvest.SetFLGEMABERTURAFMI(const Value: TCmDbField);
begin
  FFLGEMABERTURAFMI := Value;
end;

//AL_6
procedure TDbParaminvest.SetIDUSREMABERTURAFMI(const Value: TCmDbField);
begin
  FIDUSREMABERTURAFMI := Value;
end;

//AL_7
procedure TDbParaminvest.SetFlgIntContabOPI(const Value: TCmDbField);
begin
  FFlgIntContabOPI := Value;
end;

end.



