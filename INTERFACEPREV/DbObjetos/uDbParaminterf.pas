{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Leonardo                        }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Leo
// Data        : 31.05.2004
// Alteração   : Inclusão do tratamento da taxa de contribuição TAMEQUIPARACAO e INIEQUIPARACAO
//               marcação das rubricas que servem para equiparação salarial
//------------------------------------------------------------------------------


unit uDbParaminterf;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParaminterf = class(TCmDbObject)

  private
    FTbeventodesctam: TCmDbField;
    FInivalorpart: TCmDbField;
    FDcestcivilidv: TCmDbField;
    FFlgmatcompleta: TCmDbField;
    FLtinscricaotam: TCmDbField;
    FIdregrubricaini: TCmDbField;
    FTbsitfuncdesctam: TCmDbField;
    FDataref: TCmDbField;
    FTbnivelptnivelini: TCmDbField;
    FTbnivelptniveltam: TCmDbField;
    FValoreslancamento: TCmDbField;
    FCsrubricaini: TCmDbField;
    FFlglancamento: TCmDbField;
    FTbrubcodigotam: TCmDbField;
    FInimesref: TCmDbField;
    FTbrubdescricaotam: TCmDbField;
    FTbbbdescricaoini: TCmDbField;
    FFlgheader: TCmDbField;
    FCaracterdvtxt: TCmDbField;
    FTbnivelcasas: TCmDbField;
    FEvdtinitam: TCmDbField;
    FTbrubidprovento: TCmDbField;
    FTbsitfunccodini: TCmDbField;
    FPlano: TCmDbField;
    FLtlocaltam: TCmDbField;
    FIdregtbrubini: TCmDbField;
    FTbrubincidetam: TCmDbField;
    FFlgseguro: TCmDbField;
    FTbcargocodigoini: TCmDbField;
    FPccodvincfunctam: TCmDbField;
    FEdlogradourotam: TCmDbField;
    FTborgaocodini: TCmDbField;
    FDsagenciatam: TCmDbField;
    FTbniveldescini: TCmDbField;
    FEvdtfimini: TCmDbField;
    FEdbairrotam: TCmDbField;
    FValorprove: TCmDbField;
    FTblocaldesctam: TCmDbField;
    FInipatro: TCmDbField;
    FIdpessjur: TCmDbField;
    FCsinscricaoini: TCmDbField;
    FEdmunicipiotam: TCmDbField;
    FTbeventogrpini: TCmDbField;
    FTbagenciatam: TCmDbField;
    FEvdtinifmt: TCmDbField;
    FIdreglotacaoini: TCmDbField;
    FIdpartendereco: TCmDbField;
    FDcidentini: TCmDbField;
    FIdregtbrubtam: TCmDbField;
    FCsmatriculatam: TCmDbField;
    FInichave: TCmDbField;
    FTipochave: TCmDbField;
    FFlgcalcsalpart: TCmDbField;
    FIniseqinterface: TCmDbField;
    FEdeventotam: TCmDbField;
    FDcufidenttam: TCmDbField;
    FIdpartrubrica: TCmDbField;
    FEdmatriculatam: TCmDbField;
    FIdparteventos: TCmDbField;
    FIdregtborgao: TCmDbField;
    FEdbairroini: TCmDbField;
    FTbniveldecimal: TCmDbField;
    FEdmunicipioini: TCmDbField;
    FEvdtfimfmt: TCmDbField;
    FFlgtiposeparadec: TCmDbField;
    FEvdtfimtam: TCmDbField;
    FIdreglotacaotam: TCmDbField;
    FCsrubricatam: TCmDbField;
    FTblocalcodini: TCmDbField;
    FLtorgaotam: TCmDbField;
    FTbbancotam: TCmDbField;
    FInidataref: TCmDbField;
    FIdregconsig: TCmDbField;
    FIdregrubricatam: TCmDbField;
    FInicioseqintera: TCmDbField;
    FCodprovduplo: TCmDbField;
    FTbsitfuncdescini: TCmDbField;
    FFlggravahist: TCmDbField;
    FIdreglotacao: TCmDbField;
    FCodprovsalpart: TCmDbField;
    FEdtelefonetam: TCmDbField;
    FCsvalortam: TCmDbField;
    FTbrubcodigoini: TCmDbField;
    FTbrubincideini: TCmDbField;
    FIdregtborgaotam: TCmDbField;
    FTborgaolocini: TCmDbField;
    FTbcargodesctam: TCmDbField;
    FTbrubdescricaoini: TCmDbField;
    FTbrubiddesconto: TCmDbField;
    FTbeventocodtam: TCmDbField;
    FIdregtbeventoini: TCmDbField;
    FEdceptam: TCmDbField;
    FIdregtbeventos: TCmDbField;
    FEvinscricaoini: TCmDbField;
    FIdregenderecoini: TCmDbField;
    FTbnivelctnivelini: TCmDbField;
    FEvmatriculatam: TCmDbField;
    FDcestcivilido: TCmDbField;
    FIdregtbnivel: TCmDbField;
    FTbnivelcodini: TCmDbField;
    FEdcepini: TCmDbField;
    FTborgaoloctam: TCmDbField;
    FTbrubtipoini: TCmDbField;
    FTblocaldescini: TCmDbField;
    FEveventotam: TCmDbField;
    FEduftam: TCmDbField;
    FTbsitfunccodtam: TCmDbField;
    FPoslancamento: TCmDbField;
    FInicioseqinterfa: TCmDbField;
    FLtmatriculaini: TCmDbField;
    FTbagdescricaotam: TCmDbField;
    FTbcargocodigotam: TCmDbField;
    FInimescob: TCmDbField;
    FIdregtbbancotam: TCmDbField;
    FFlgfooter: TCmDbField;
    FIdregtbcargoini: TCmDbField;
    FNumcasasdec: TCmDbField;
    FIniplano: TCmDbField;
    FTbagenciaini: TCmDbField;
    FIdregtbniveltam: TCmDbField;
    FEdinscricaoini: TCmDbField;
    FTbeventodescini: TCmDbField;
    FEdmatriculaini: TCmDbField;
    FAnomesgravaabono: TCmDbField;
    FDcestcivilids: TCmDbField;
    FTborgaodesctam: TCmDbField;
    FEdufini: TCmDbField;
    FTbeventogrptam: TCmDbField;
    FInivalorprove: TCmDbField;
    FPccodvincfuncini: TCmDbField;
    FTblocalcodtam: TCmDbField;
    FLtinscricaoini: TCmDbField;
    FIdregendereco: TCmDbField;
    FIdregtbcargo: TCmDbField;
    FProvento: TCmDbField;
    FEveventoini: TCmDbField;
    FTbnivelctniveltam: TCmDbField;
    FCsmatriculaini: TCmDbField;
    FTbagdescricaoini: TCmDbField;
    FTbbancoini: TCmDbField;
    FMesref: TCmDbField;
    FCsvalorini: TCmDbField;
    FSeqinterfa: TCmDbField;
    FValorpart: TCmDbField;
    FInivalorchave: TCmDbField;
    FEvmatriculaini: TCmDbField;
    FValorchave: TCmDbField;
    FIniprovento: TCmDbField;
    FIdregtbrubrica: TCmDbField;
    FIdregtbbancoini: TCmDbField;
    FTbeventocodini: TCmDbField;
    FTbniveldesctam: TCmDbField;
    FFmtmesref: TCmDbField;
    FIdregtborgaoini: TCmDbField;
    FMescob: TCmDbField;
    FTbcargodescini: TCmDbField;
    FIdregenderecotam: TCmDbField;
    FTbbbdescricaotam: TCmDbField;
    FTbrubtipotam: TCmDbField;
    FDcestcivilidd: TCmDbField;
    FEvinscricaotam: TCmDbField;
    FTborgaocodtam: TCmDbField;
    FEdtelefoneini: TCmDbField;
    FTamlancamento: TCmDbField;
    FLtlocalini: TCmDbField;
    FIdregtbnivelini: TCmDbField;
    FEvdtiniini: TCmDbField;
    FLtorgaoini: TCmDbField;
    FDcsexoidfem: TCmDbField;
    FFlgcaracterdv: TCmDbField;
    FTbnivelcodtam: TCmDbField;
    FLtmatriculatam: TCmDbField;
    FInitipochave: TCmDbField;
    FCsinscricaotam: TCmDbField;
    FIdregtbcargotam: TCmDbField;
    FIdregrubricas: TCmDbField;
    FDcidenttam: TCmDbField;
    FDcdtexpidenttam: TCmDbField;
    FDcsexoid: TCmDbField;
    FChave: TCmDbField;
    FEdinscricaotam: TCmDbField;
    FIdregtbeventotam: TCmDbField;
    FIdregconsigini: TCmDbField;
    FPatro: TCmDbField;
    FEdlogradouroini: TCmDbField;
    FFlgidaouvolta: TCmDbField;
    FIdregeventotam: TCmDbField;
    FIdpartlotacao: TCmDbField;
    FFlgacumuladuplica: TCmDbField;
    FTborgaodescini: TCmDbField;
    FIdregconsigtam: TCmDbField;
    FDcdtexpidentini: TCmDbField;
    FIdregeventoini: TCmDbField;
    FFlgcodprovsalpart: TCmDbField;
    FDcufidentini: TCmDbField;
    FDcftdtexpident: TCmDbField;
    FDcestcivilidc: TCmDbField;
    FIdregevento: TCmDbField;
    FIdregtbbancos: TCmDbField;
    FIniIdPessoa: TCmDbField;
    FTamIdPessoa: TCmDbField;
    FIniEquiparacao: TCmDbField;
    FTamEquiparacao: TCmDbField;
    procedure SetAnomesgravaabono(const Value: TCmDbField);
    procedure SetCaracterdvtxt(const Value: TCmDbField);
    procedure SetChave(const Value: TCmDbField);
    procedure SetCodprovduplo(const Value: TCmDbField);
    procedure SetCodprovsalpart(const Value: TCmDbField);
    procedure SetCsinscricaoini(const Value: TCmDbField);
    procedure SetCsinscricaotam(const Value: TCmDbField);
    procedure SetCsmatriculaini(const Value: TCmDbField);
    procedure SetCsmatriculatam(const Value: TCmDbField);
    procedure SetCsrubricaini(const Value: TCmDbField);
    procedure SetCsrubricatam(const Value: TCmDbField);
    procedure SetCsvalorini(const Value: TCmDbField);
    procedure SetCsvalortam(const Value: TCmDbField);
    procedure SetDataref(const Value: TCmDbField);
    procedure SetDcdtexpidentini(const Value: TCmDbField);
    procedure SetDcdtexpidenttam(const Value: TCmDbField);
    procedure SetDcestcivilidc(const Value: TCmDbField);
    procedure SetDcestcivilidd(const Value: TCmDbField);
    procedure SetDcestcivilido(const Value: TCmDbField);
    procedure SetDcestcivilids(const Value: TCmDbField);
    procedure SetDcestcivilidv(const Value: TCmDbField);
    procedure SetDcftdtexpident(const Value: TCmDbField);
    procedure SetDcidentini(const Value: TCmDbField);
    procedure SetDcidenttam(const Value: TCmDbField);
    procedure SetDcsexoid(const Value: TCmDbField);
    procedure SetDcsexoidfem(const Value: TCmDbField);
    procedure SetDcufidentini(const Value: TCmDbField);
    procedure SetDcufidenttam(const Value: TCmDbField);
    procedure SetDsagenciatam(const Value: TCmDbField);
    procedure SetEdbairroini(const Value: TCmDbField);
    procedure SetEdbairrotam(const Value: TCmDbField);
    procedure SetEdcepini(const Value: TCmDbField);
    procedure SetEdceptam(const Value: TCmDbField);
    procedure SetEdeventotam(const Value: TCmDbField);
    procedure SetEdinscricaoini(const Value: TCmDbField);
    procedure SetEdinscricaotam(const Value: TCmDbField);
    procedure SetEdlogradouroini(const Value: TCmDbField);
    procedure SetEdlogradourotam(const Value: TCmDbField);
    procedure SetEdmatriculaini(const Value: TCmDbField);
    procedure SetEdmatriculatam(const Value: TCmDbField);
    procedure SetEdmunicipioini(const Value: TCmDbField);
    procedure SetEdmunicipiotam(const Value: TCmDbField);
    procedure SetEdtelefoneini(const Value: TCmDbField);
    procedure SetEdtelefonetam(const Value: TCmDbField);
    procedure SetEdufini(const Value: TCmDbField);
    procedure SetEduftam(const Value: TCmDbField);
    procedure SetEvdtfimfmt(const Value: TCmDbField);
    procedure SetEvdtfimini(const Value: TCmDbField);
    procedure SetEvdtfimtam(const Value: TCmDbField);
    procedure SetEvdtinifmt(const Value: TCmDbField);
    procedure SetEvdtiniini(const Value: TCmDbField);
    procedure SetEvdtinitam(const Value: TCmDbField);
    procedure SetEveventoini(const Value: TCmDbField);
    procedure SetEveventotam(const Value: TCmDbField);
    procedure SetEvinscricaoini(const Value: TCmDbField);
    procedure SetEvinscricaotam(const Value: TCmDbField);
    procedure SetEvmatriculaini(const Value: TCmDbField);
    procedure SetEvmatriculatam(const Value: TCmDbField);
    procedure SetFlgacumuladuplica(const Value: TCmDbField);
    procedure SetFlgcalcsalpart(const Value: TCmDbField);
    procedure SetFlgcaracterdv(const Value: TCmDbField);
    procedure SetFlgcodprovsalpart(const Value: TCmDbField);
    procedure SetFlgfooter(const Value: TCmDbField);
    procedure SetFlggravahist(const Value: TCmDbField);
    procedure SetFlgheader(const Value: TCmDbField);
    procedure SetFlgidaouvolta(const Value: TCmDbField);
    procedure SetFlglancamento(const Value: TCmDbField);
    procedure SetFlgmatcompleta(const Value: TCmDbField);
    procedure SetFlgseguro(const Value: TCmDbField);
    procedure SetFlgtiposeparadec(const Value: TCmDbField);
    procedure SetFmtmesref(const Value: TCmDbField);
    procedure SetIdpartendereco(const Value: TCmDbField);
    procedure SetIdparteventos(const Value: TCmDbField);
    procedure SetIdpartlotacao(const Value: TCmDbField);
    procedure SetIdpartrubrica(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdregconsig(const Value: TCmDbField);
    procedure SetIdregconsigini(const Value: TCmDbField);
    procedure SetIdregconsigtam(const Value: TCmDbField);
    procedure SetIdregendereco(const Value: TCmDbField);
    procedure SetIdregenderecoini(const Value: TCmDbField);
    procedure SetIdregenderecotam(const Value: TCmDbField);
    procedure SetIdregevento(const Value: TCmDbField);
    procedure SetIdregeventoini(const Value: TCmDbField);
    procedure SetIdregeventotam(const Value: TCmDbField);
    procedure SetIdreglotacao(const Value: TCmDbField);
    procedure SetIdreglotacaoini(const Value: TCmDbField);
    procedure SetIdreglotacaotam(const Value: TCmDbField);
    procedure SetIdregrubricaini(const Value: TCmDbField);
    procedure SetIdregrubricas(const Value: TCmDbField);
    procedure SetIdregrubricatam(const Value: TCmDbField);
    procedure SetIdregtbbancoini(const Value: TCmDbField);
    procedure SetIdregtbbancos(const Value: TCmDbField);
    procedure SetIdregtbbancotam(const Value: TCmDbField);
    procedure SetIdregtbcargo(const Value: TCmDbField);
    procedure SetIdregtbcargoini(const Value: TCmDbField);
    procedure SetIdregtbcargotam(const Value: TCmDbField);
    procedure SetIdregtbeventoini(const Value: TCmDbField);
    procedure SetIdregtbeventos(const Value: TCmDbField);
    procedure SetIdregtbeventotam(const Value: TCmDbField);
    procedure SetIdregtbnivel(const Value: TCmDbField);
    procedure SetIdregtbnivelini(const Value: TCmDbField);
    procedure SetIdregtbniveltam(const Value: TCmDbField);
    procedure SetIdregtborgao(const Value: TCmDbField);
    procedure SetIdregtborgaoini(const Value: TCmDbField);
    procedure SetIdregtborgaotam(const Value: TCmDbField);
    procedure SetIdregtbrubini(const Value: TCmDbField);
    procedure SetIdregtbrubrica(const Value: TCmDbField);
    procedure SetIdregtbrubtam(const Value: TCmDbField);
    procedure SetInichave(const Value: TCmDbField);
    procedure SetInicioseqintera(const Value: TCmDbField);
    procedure SetInicioseqinterfa(const Value: TCmDbField);
    procedure SetInidataref(const Value: TCmDbField);
    procedure SetInimescob(const Value: TCmDbField);
    procedure SetInimesref(const Value: TCmDbField);
    procedure SetInipatro(const Value: TCmDbField);
    procedure SetIniplano(const Value: TCmDbField);
    procedure SetIniprovento(const Value: TCmDbField);
    procedure SetIniseqinterface(const Value: TCmDbField);
    procedure SetInitipochave(const Value: TCmDbField);
    procedure SetInivalorchave(const Value: TCmDbField);
    procedure SetInivalorpart(const Value: TCmDbField);
    procedure SetInivalorprove(const Value: TCmDbField);
    procedure SetLtinscricaoini(const Value: TCmDbField);
    procedure SetLtinscricaotam(const Value: TCmDbField);
    procedure SetLtlocalini(const Value: TCmDbField);
    procedure SetLtlocaltam(const Value: TCmDbField);
    procedure SetLtmatriculaini(const Value: TCmDbField);
    procedure SetLtmatriculatam(const Value: TCmDbField);
    procedure SetLtorgaoini(const Value: TCmDbField);
    procedure SetLtorgaotam(const Value: TCmDbField);
    procedure SetMescob(const Value: TCmDbField);
    procedure SetMesref(const Value: TCmDbField);
    procedure SetNumcasasdec(const Value: TCmDbField);
    procedure SetPatro(const Value: TCmDbField);
    procedure SetPccodvincfuncini(const Value: TCmDbField);
    procedure SetPccodvincfunctam(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPoslancamento(const Value: TCmDbField);
    procedure SetProvento(const Value: TCmDbField);
    procedure SetSeqinterfa(const Value: TCmDbField);
    procedure SetTamlancamento(const Value: TCmDbField);
    procedure SetTbagdescricaoini(const Value: TCmDbField);
    procedure SetTbagdescricaotam(const Value: TCmDbField);
    procedure SetTbagenciaini(const Value: TCmDbField);
    procedure SetTbagenciatam(const Value: TCmDbField);
    procedure SetTbbancoini(const Value: TCmDbField);
    procedure SetTbbancotam(const Value: TCmDbField);
    procedure SetTbbbdescricaoini(const Value: TCmDbField);
    procedure SetTbbbdescricaotam(const Value: TCmDbField);
    procedure SetTbcargocodigoini(const Value: TCmDbField);
    procedure SetTbcargocodigotam(const Value: TCmDbField);
    procedure SetTbcargodescini(const Value: TCmDbField);
    procedure SetTbcargodesctam(const Value: TCmDbField);
    procedure SetTbeventocodini(const Value: TCmDbField);
    procedure SetTbeventocodtam(const Value: TCmDbField);
    procedure SetTbeventodescini(const Value: TCmDbField);
    procedure SetTbeventodesctam(const Value: TCmDbField);
    procedure SetTbeventogrpini(const Value: TCmDbField);
    procedure SetTbeventogrptam(const Value: TCmDbField);
    procedure SetTblocalcodini(const Value: TCmDbField);
    procedure SetTblocalcodtam(const Value: TCmDbField);
    procedure SetTblocaldescini(const Value: TCmDbField);
    procedure SetTblocaldesctam(const Value: TCmDbField);
    procedure SetTbnivelcasas(const Value: TCmDbField);
    procedure SetTbnivelcodini(const Value: TCmDbField);
    procedure SetTbnivelcodtam(const Value: TCmDbField);
    procedure SetTbnivelctnivelini(const Value: TCmDbField);
    procedure SetTbnivelctniveltam(const Value: TCmDbField);
    procedure SetTbniveldecimal(const Value: TCmDbField);
    procedure SetTbniveldescini(const Value: TCmDbField);
    procedure SetTbniveldesctam(const Value: TCmDbField);
    procedure SetTbnivelptnivelini(const Value: TCmDbField);
    procedure SetTbnivelptniveltam(const Value: TCmDbField);
    procedure SetTborgaocodini(const Value: TCmDbField);
    procedure SetTborgaocodtam(const Value: TCmDbField);
    procedure SetTborgaodescini(const Value: TCmDbField);
    procedure SetTborgaodesctam(const Value: TCmDbField);
    procedure SetTborgaolocini(const Value: TCmDbField);
    procedure SetTborgaoloctam(const Value: TCmDbField);
    procedure SetTbrubcodigoini(const Value: TCmDbField);
    procedure SetTbrubcodigotam(const Value: TCmDbField);
    procedure SetTbrubdescricaoini(const Value: TCmDbField);
    procedure SetTbrubdescricaotam(const Value: TCmDbField);
    procedure SetTbrubiddesconto(const Value: TCmDbField);
    procedure SetTbrubidprovento(const Value: TCmDbField);
    procedure SetTbrubincideini(const Value: TCmDbField);
    procedure SetTbrubincidetam(const Value: TCmDbField);
    procedure SetTbrubtipoini(const Value: TCmDbField);
    procedure SetTbrubtipotam(const Value: TCmDbField);
    procedure SetTbsitfunccodini(const Value: TCmDbField);
    procedure SetTbsitfunccodtam(const Value: TCmDbField);
    procedure SetTbsitfuncdescini(const Value: TCmDbField);
    procedure SetTbsitfuncdesctam(const Value: TCmDbField);
    procedure SetTipochave(const Value: TCmDbField);
    procedure SetValorchave(const Value: TCmDbField);
    procedure SetValoreslancamento(const Value: TCmDbField);
    procedure SetValorpart(const Value: TCmDbField);
    procedure SetValorprove(const Value: TCmDbField);
    procedure SetIniIdPessoa(const Value: TCmDbField);
    procedure SetTamIdPessoa(const Value: TCmDbField);
    procedure SetIniEquiparacao(const Value: TCmDbField);
    procedure SetTamEquiparacao(const Value: TCmDbField);

  public

     Property Valorprove: TCmDbField read FValorprove write SetValorprove;
     Property Valorpart: TCmDbField read FValorpart write SetValorpart;
     Property Valoreslancamento: TCmDbField read FValoreslancamento write SetValoreslancamento;
     Property Valorchave: TCmDbField read FValorchave write SetValorchave;
     Property Tipochave: TCmDbField read FTipochave write SetTipochave;
     Property Tbsitfuncdesctam: TCmDbField read FTbsitfuncdesctam write SetTbsitfuncdesctam;
     Property Tbsitfuncdescini: TCmDbField read FTbsitfuncdescini write SetTbsitfuncdescini;
     Property Tbsitfunccodtam: TCmDbField read FTbsitfunccodtam write SetTbsitfunccodtam;
     Property Tbsitfunccodini: TCmDbField read FTbsitfunccodini write SetTbsitfunccodini;
     Property Tbrubtipotam: TCmDbField read FTbrubtipotam write SetTbrubtipotam;
     Property Tbrubtipoini: TCmDbField read FTbrubtipoini write SetTbrubtipoini;
     Property Tbrubincidetam: TCmDbField read FTbrubincidetam write SetTbrubincidetam;
     Property Tbrubincideini: TCmDbField read FTbrubincideini write SetTbrubincideini;
     Property Tbrubidprovento: TCmDbField read FTbrubidprovento write SetTbrubidprovento;
     Property Tbrubiddesconto: TCmDbField read FTbrubiddesconto write SetTbrubiddesconto;
     Property Tbrubdescricaotam: TCmDbField read FTbrubdescricaotam write SetTbrubdescricaotam;
     Property Tbrubdescricaoini: TCmDbField read FTbrubdescricaoini write SetTbrubdescricaoini;
     Property Tbrubcodigotam: TCmDbField read FTbrubcodigotam write SetTbrubcodigotam;
     Property Tbrubcodigoini: TCmDbField read FTbrubcodigoini write SetTbrubcodigoini;
     Property Tborgaoloctam: TCmDbField read FTborgaoloctam write SetTborgaoloctam;
     Property Tborgaolocini: TCmDbField read FTborgaolocini write SetTborgaolocini;
     Property Tborgaodesctam: TCmDbField read FTborgaodesctam write SetTborgaodesctam;
     Property Tborgaodescini: TCmDbField read FTborgaodescini write SetTborgaodescini;
     Property Tborgaocodtam: TCmDbField read FTborgaocodtam write SetTborgaocodtam;
     Property Tborgaocodini: TCmDbField read FTborgaocodini write SetTborgaocodini;
     Property Tbnivelptniveltam: TCmDbField read FTbnivelptniveltam write SetTbnivelptniveltam;
     Property Tbnivelptnivelini: TCmDbField read FTbnivelptnivelini write SetTbnivelptnivelini;
     Property Tbniveldesctam: TCmDbField read FTbniveldesctam write SetTbniveldesctam;
     Property Tbniveldescini: TCmDbField read FTbniveldescini write SetTbniveldescini;
     Property Tbniveldecimal: TCmDbField read FTbniveldecimal write SetTbniveldecimal;
     Property Tbnivelctniveltam: TCmDbField read FTbnivelctniveltam write SetTbnivelctniveltam;
     Property Tbnivelctnivelini: TCmDbField read FTbnivelctnivelini write SetTbnivelctnivelini;
     Property Tbnivelcodtam: TCmDbField read FTbnivelcodtam write SetTbnivelcodtam;
     Property Tbnivelcodini: TCmDbField read FTbnivelcodini write SetTbnivelcodini;
     Property Tbnivelcasas: TCmDbField read FTbnivelcasas write SetTbnivelcasas;
     Property Tblocaldesctam: TCmDbField read FTblocaldesctam write SetTblocaldesctam;
     Property Tblocaldescini: TCmDbField read FTblocaldescini write SetTblocaldescini;
     Property Tblocalcodtam: TCmDbField read FTblocalcodtam write SetTblocalcodtam;
     Property Tblocalcodini: TCmDbField read FTblocalcodini write SetTblocalcodini;
     Property Tbeventogrptam: TCmDbField read FTbeventogrptam write SetTbeventogrptam;
     Property Tbeventogrpini: TCmDbField read FTbeventogrpini write SetTbeventogrpini;
     Property Tbeventodesctam: TCmDbField read FTbeventodesctam write SetTbeventodesctam;
     Property Tbeventodescini: TCmDbField read FTbeventodescini write SetTbeventodescini;
     Property Tbeventocodtam: TCmDbField read FTbeventocodtam write SetTbeventocodtam;
     Property Tbeventocodini: TCmDbField read FTbeventocodini write SetTbeventocodini;
     Property Tbcargodesctam: TCmDbField read FTbcargodesctam write SetTbcargodesctam;
     Property Tbcargodescini: TCmDbField read FTbcargodescini write SetTbcargodescini;
     Property Tbcargocodigotam: TCmDbField read FTbcargocodigotam write SetTbcargocodigotam;
     Property Tbcargocodigoini: TCmDbField read FTbcargocodigoini write SetTbcargocodigoini;
     Property Tbbbdescricaotam: TCmDbField read FTbbbdescricaotam write SetTbbbdescricaotam;
     Property Tbbbdescricaoini: TCmDbField read FTbbbdescricaoini write SetTbbbdescricaoini;
     Property Tbbancotam: TCmDbField read FTbbancotam write SetTbbancotam;
     Property Tbbancoini: TCmDbField read FTbbancoini write SetTbbancoini;
     Property Tbagenciatam: TCmDbField read FTbagenciatam write SetTbagenciatam;
     Property Tbagenciaini: TCmDbField read FTbagenciaini write SetTbagenciaini;
     Property Tbagdescricaotam: TCmDbField read FTbagdescricaotam write SetTbagdescricaotam;
     Property Tbagdescricaoini: TCmDbField read FTbagdescricaoini write SetTbagdescricaoini;
     Property Tamlancamento: TCmDbField read FTamlancamento write SetTamlancamento;
     Property Seqinterfa: TCmDbField read FSeqinterfa write SetSeqinterfa;
     Property Provento: TCmDbField read FProvento write SetProvento;
     Property Poslancamento: TCmDbField read FPoslancamento write SetPoslancamento;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Pccodvincfunctam: TCmDbField read FPccodvincfunctam write SetPccodvincfunctam;
     Property Pccodvincfuncini: TCmDbField read FPccodvincfuncini write SetPccodvincfuncini;
     Property Patro: TCmDbField read FPatro write SetPatro;
     Property Numcasasdec: TCmDbField read FNumcasasdec write SetNumcasasdec;
     Property Mesref: TCmDbField read FMesref write SetMesref;
     Property Mescob: TCmDbField read FMescob write SetMescob;
     Property Ltorgaotam: TCmDbField read FLtorgaotam write SetLtorgaotam;
     Property Ltorgaoini: TCmDbField read FLtorgaoini write SetLtorgaoini;
     Property Ltmatriculatam: TCmDbField read FLtmatriculatam write SetLtmatriculatam;
     Property Ltmatriculaini: TCmDbField read FLtmatriculaini write SetLtmatriculaini;
     Property Ltlocaltam: TCmDbField read FLtlocaltam write SetLtlocaltam;
     Property Ltlocalini: TCmDbField read FLtlocalini write SetLtlocalini;
     Property Ltinscricaotam: TCmDbField read FLtinscricaotam write SetLtinscricaotam;
     Property Ltinscricaoini: TCmDbField read FLtinscricaoini write SetLtinscricaoini;
     Property Inivalorprove: TCmDbField read FInivalorprove write SetInivalorprove;
     Property Inivalorpart: TCmDbField read FInivalorpart write SetInivalorpart;
     Property Inivalorchave: TCmDbField read FInivalorchave write SetInivalorchave;
     Property Initipochave: TCmDbField read FInitipochave write SetInitipochave;
     Property Iniseqinterface: TCmDbField read FIniseqinterface write SetIniseqinterface;
     Property Iniprovento: TCmDbField read FIniprovento write SetIniprovento;
     Property Iniplano: TCmDbField read FIniplano write SetIniplano;
     Property Inipatro: TCmDbField read FInipatro write SetInipatro;
     Property Inimesref: TCmDbField read FInimesref write SetInimesref;
     Property Inimescob: TCmDbField read FInimescob write SetInimescob;
     Property Inidataref: TCmDbField read FInidataref write SetInidataref;
     Property Inicioseqinterfa: TCmDbField read FInicioseqinterfa write SetInicioseqinterfa;
     Property Inicioseqintera: TCmDbField read FInicioseqintera write SetInicioseqintera;
     Property Inichave: TCmDbField read FInichave write SetInichave;
     Property Idregtbrubtam: TCmDbField read FIdregtbrubtam write SetIdregtbrubtam;
     Property Idregtbrubrica: TCmDbField read FIdregtbrubrica write SetIdregtbrubrica;
     Property Idregtbrubini: TCmDbField read FIdregtbrubini write SetIdregtbrubini;
     Property Idregtborgaotam: TCmDbField read FIdregtborgaotam write SetIdregtborgaotam;
     Property Idregtborgaoini: TCmDbField read FIdregtborgaoini write SetIdregtborgaoini;
     Property Idregtborgao: TCmDbField read FIdregtborgao write SetIdregtborgao;
     Property Idregtbniveltam: TCmDbField read FIdregtbniveltam write SetIdregtbniveltam;
     Property Idregtbnivelini: TCmDbField read FIdregtbnivelini write SetIdregtbnivelini;
     Property Idregtbnivel: TCmDbField read FIdregtbnivel write SetIdregtbnivel;
     Property Idregtbeventotam: TCmDbField read FIdregtbeventotam write SetIdregtbeventotam;
     Property Idregtbeventos: TCmDbField read FIdregtbeventos write SetIdregtbeventos;
     Property Idregtbeventoini: TCmDbField read FIdregtbeventoini write SetIdregtbeventoini;
     Property Idregtbcargotam: TCmDbField read FIdregtbcargotam write SetIdregtbcargotam;
     Property Idregtbcargoini: TCmDbField read FIdregtbcargoini write SetIdregtbcargoini;
     Property Idregtbcargo: TCmDbField read FIdregtbcargo write SetIdregtbcargo;
     Property Idregtbbancotam: TCmDbField read FIdregtbbancotam write SetIdregtbbancotam;
     Property Idregtbbancos: TCmDbField read FIdregtbbancos write SetIdregtbbancos;
     Property Idregtbbancoini: TCmDbField read FIdregtbbancoini write SetIdregtbbancoini;
     Property Idregrubricatam: TCmDbField read FIdregrubricatam write SetIdregrubricatam;
     Property Idregrubricas: TCmDbField read FIdregrubricas write SetIdregrubricas;
     Property Idregrubricaini: TCmDbField read FIdregrubricaini write SetIdregrubricaini;
     Property Idreglotacaotam: TCmDbField read FIdreglotacaotam write SetIdreglotacaotam;
     Property Idreglotacaoini: TCmDbField read FIdreglotacaoini write SetIdreglotacaoini;
     Property Idreglotacao: TCmDbField read FIdreglotacao write SetIdreglotacao;
     Property Idregeventotam: TCmDbField read FIdregeventotam write SetIdregeventotam;
     Property Idregeventoini: TCmDbField read FIdregeventoini write SetIdregeventoini;
     Property Idregevento: TCmDbField read FIdregevento write SetIdregevento;
     Property Idregenderecotam: TCmDbField read FIdregenderecotam write SetIdregenderecotam;
     Property Idregenderecoini: TCmDbField read FIdregenderecoini write SetIdregenderecoini;
     Property Idregendereco: TCmDbField read FIdregendereco write SetIdregendereco;
     Property Idregconsigtam: TCmDbField read FIdregconsigtam write SetIdregconsigtam;
     Property Idregconsigini: TCmDbField read FIdregconsigini write SetIdregconsigini;
     Property Idregconsig: TCmDbField read FIdregconsig write SetIdregconsig;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idpartrubrica: TCmDbField read FIdpartrubrica write SetIdpartrubrica;
     Property Idpartlotacao: TCmDbField read FIdpartlotacao write SetIdpartlotacao;
     Property Idparteventos: TCmDbField read FIdparteventos write SetIdparteventos;
     Property Idpartendereco: TCmDbField read FIdpartendereco write SetIdpartendereco;
     Property Fmtmesref: TCmDbField read FFmtmesref write SetFmtmesref;
     Property Flgtiposeparadec: TCmDbField read FFlgtiposeparadec write SetFlgtiposeparadec;
     Property Flgseguro: TCmDbField read FFlgseguro write SetFlgseguro;
     Property Flgmatcompleta: TCmDbField read FFlgmatcompleta write SetFlgmatcompleta;
     Property Flglancamento: TCmDbField read FFlglancamento write SetFlglancamento;
     Property Flgidaouvolta: TCmDbField read FFlgidaouvolta write SetFlgidaouvolta;
     Property Flgheader: TCmDbField read FFlgheader write SetFlgheader;
     Property Flggravahist: TCmDbField read FFlggravahist write SetFlggravahist;
     Property Flgfooter: TCmDbField read FFlgfooter write SetFlgfooter;
     Property Flgcodprovsalpart: TCmDbField read FFlgcodprovsalpart write SetFlgcodprovsalpart;
     Property Flgcaracterdv: TCmDbField read FFlgcaracterdv write SetFlgcaracterdv;
     Property Flgcalcsalpart: TCmDbField read FFlgcalcsalpart write SetFlgcalcsalpart;
     Property Flgacumuladuplica: TCmDbField read FFlgacumuladuplica write SetFlgacumuladuplica;
     Property Evmatriculatam: TCmDbField read FEvmatriculatam write SetEvmatriculatam;
     Property Evmatriculaini: TCmDbField read FEvmatriculaini write SetEvmatriculaini;
     Property Evinscricaotam: TCmDbField read FEvinscricaotam write SetEvinscricaotam;
     Property Evinscricaoini: TCmDbField read FEvinscricaoini write SetEvinscricaoini;
     Property Eveventotam: TCmDbField read FEveventotam write SetEveventotam;
     Property Eveventoini: TCmDbField read FEveventoini write SetEveventoini;
     Property Evdtinitam: TCmDbField read FEvdtinitam write SetEvdtinitam;
     Property Evdtiniini: TCmDbField read FEvdtiniini write SetEvdtiniini;
     Property Evdtinifmt: TCmDbField read FEvdtinifmt write SetEvdtinifmt;
     Property Evdtfimtam: TCmDbField read FEvdtfimtam write SetEvdtfimtam;
     Property Evdtfimini: TCmDbField read FEvdtfimini write SetEvdtfimini;
     Property Evdtfimfmt: TCmDbField read FEvdtfimfmt write SetEvdtfimfmt;
     Property Eduftam: TCmDbField read FEduftam write SetEduftam;
     Property Edufini: TCmDbField read FEdufini write SetEdufini;
     Property Edtelefonetam: TCmDbField read FEdtelefonetam write SetEdtelefonetam;
     Property Edtelefoneini: TCmDbField read FEdtelefoneini write SetEdtelefoneini;
     Property Edmunicipiotam: TCmDbField read FEdmunicipiotam write SetEdmunicipiotam;
     Property Edmunicipioini: TCmDbField read FEdmunicipioini write SetEdmunicipioini;
     Property Edmatriculatam: TCmDbField read FEdmatriculatam write SetEdmatriculatam;
     Property Edmatriculaini: TCmDbField read FEdmatriculaini write SetEdmatriculaini;
     Property Edlogradourotam: TCmDbField read FEdlogradourotam write SetEdlogradourotam;
     Property Edlogradouroini: TCmDbField read FEdlogradouroini write SetEdlogradouroini;
     Property Edinscricaotam: TCmDbField read FEdinscricaotam write SetEdinscricaotam;
     Property Edinscricaoini: TCmDbField read FEdinscricaoini write SetEdinscricaoini;
     Property Edeventotam: TCmDbField read FEdeventotam write SetEdeventotam;
     Property Edceptam: TCmDbField read FEdceptam write SetEdceptam;
     Property Edcepini: TCmDbField read FEdcepini write SetEdcepini;
     Property Edbairrotam: TCmDbField read FEdbairrotam write SetEdbairrotam;
     Property Edbairroini: TCmDbField read FEdbairroini write SetEdbairroini;
     Property Dsagenciatam: TCmDbField read FDsagenciatam write SetDsagenciatam;
     Property Dcufidenttam: TCmDbField read FDcufidenttam write SetDcufidenttam;
     Property Dcufidentini: TCmDbField read FDcufidentini write SetDcufidentini;
     Property Dcsexoidfem: TCmDbField read FDcsexoidfem write SetDcsexoidfem;
     Property Dcsexoid: TCmDbField read FDcsexoid write SetDcsexoid;
     Property Dcidenttam: TCmDbField read FDcidenttam write SetDcidenttam;
     Property Dcidentini: TCmDbField read FDcidentini write SetDcidentini;
     Property Dcftdtexpident: TCmDbField read FDcftdtexpident write SetDcftdtexpident;
     Property Dcestcivilidv: TCmDbField read FDcestcivilidv write SetDcestcivilidv;
     Property Dcestcivilids: TCmDbField read FDcestcivilids write SetDcestcivilids;
     Property Dcestcivilido: TCmDbField read FDcestcivilido write SetDcestcivilido;
     Property Dcestcivilidd: TCmDbField read FDcestcivilidd write SetDcestcivilidd;
     Property Dcestcivilidc: TCmDbField read FDcestcivilidc write SetDcestcivilidc;
     Property Dcdtexpidenttam: TCmDbField read FDcdtexpidenttam write SetDcdtexpidenttam;
     Property Dcdtexpidentini: TCmDbField read FDcdtexpidentini write SetDcdtexpidentini;
     Property Dataref: TCmDbField read FDataref write SetDataref;
     Property Csvalortam: TCmDbField read FCsvalortam write SetCsvalortam;
     Property Csvalorini: TCmDbField read FCsvalorini write SetCsvalorini;
     Property Csrubricatam: TCmDbField read FCsrubricatam write SetCsrubricatam;
     Property Csrubricaini: TCmDbField read FCsrubricaini write SetCsrubricaini;
     Property Csmatriculatam: TCmDbField read FCsmatriculatam write SetCsmatriculatam;
     Property Csmatriculaini: TCmDbField read FCsmatriculaini write SetCsmatriculaini;
     Property Csinscricaotam: TCmDbField read FCsinscricaotam write SetCsinscricaotam;
     Property Csinscricaoini: TCmDbField read FCsinscricaoini write SetCsinscricaoini;
     Property Codprovsalpart: TCmDbField read FCodprovsalpart write SetCodprovsalpart;
     Property Codprovduplo: TCmDbField read FCodprovduplo write SetCodprovduplo;
     Property Chave: TCmDbField read FChave write SetChave;
     Property Caracterdvtxt: TCmDbField read FCaracterdvtxt write SetCaracterdvtxt;
     Property Anomesgravaabono: TCmDbField read FAnomesgravaabono write SetAnomesgravaabono;
     Property TamIdPessoa: TCmDbField read FTamIdPessoa write SetTamIdPessoa;
     Property IniIdPessoa: TCmDbField read FIniIdPessoa write SetIniIdPessoa;
     Property TamEquiparacao: TCmDbField read FTamEquiparacao write SetTamEquiparacao;
     Property IniEquiparacao: TCmDbField read FIniEquiparacao write SetIniEquiparacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParaminterf }

constructor TDbParaminterf.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMINTERF';

   fValorprove := CreateCmDbField('VALORPROVE',ftString,False,False,False,True,'');
   fValorpart := CreateCmDbField('VALORPART',ftString,False,False,False,True,'');
   fValoreslancamento := CreateCmDbField('VALORESLANCAMENTO',ftString,False,False,False,True,'');
   fValorchave := CreateCmDbField('VALORCHAVE',ftString,False,False,False,True,'');
   fTipochave := CreateCmDbField('TIPOCHAVE',ftString,False,False,False,True,'');
   fTbsitfuncdesctam := CreateCmDbField('TBSITFUNCDESCTAM',ftString,False,False,False,True,'');
   fTbsitfuncdescini := CreateCmDbField('TBSITFUNCDESCINI',ftString,False,False,False,True,'');
   fTbsitfunccodtam := CreateCmDbField('TBSITFUNCCODTAM',ftString,False,False,False,True,'');
   fTbsitfunccodini := CreateCmDbField('TBSITFUNCCODINI',ftString,False,False,False,True,'');
   fTbrubtipotam := CreateCmDbField('TBRUBTIPOTAM',ftString,False,False,False,True,'');
   fTbrubtipoini := CreateCmDbField('TBRUBTIPOINI',ftString,False,False,False,True,'');
   fTbrubincidetam := CreateCmDbField('TBRUBINCIDETAM',ftString,False,False,False,True,'');
   fTbrubincideini := CreateCmDbField('TBRUBINCIDEINI',ftString,False,False,False,True,'');
   fTbrubidprovento := CreateCmDbField('TBRUBIDPROVENTO',ftString,False,False,False,True,'');
   fTbrubiddesconto := CreateCmDbField('TBRUBIDDESCONTO',ftString,False,False,False,True,'');
   fTbrubdescricaotam := CreateCmDbField('TBRUBDESCRICAOTAM',ftString,False,False,False,True,'');
   fTbrubdescricaoini := CreateCmDbField('TBRUBDESCRICAOINI',ftString,False,False,False,True,'');
   fTbrubcodigotam := CreateCmDbField('TBRUBCODIGOTAM',ftString,False,False,False,True,'');
   fTbrubcodigoini := CreateCmDbField('TBRUBCODIGOINI',ftString,False,False,False,True,'');
   fTborgaoloctam := CreateCmDbField('TBORGAOLOCTAM',ftString,False,False,False,True,'');
   fTborgaolocini := CreateCmDbField('TBORGAOLOCINI',ftString,False,False,False,True,'');
   fTborgaodesctam := CreateCmDbField('TBORGAODESCTAM',ftString,False,False,False,True,'');
   fTborgaodescini := CreateCmDbField('TBORGAODESCINI',ftString,False,False,False,True,'');
   fTborgaocodtam := CreateCmDbField('TBORGAOCODTAM',ftString,False,False,False,True,'');
   fTborgaocodini := CreateCmDbField('TBORGAOCODINI',ftString,False,False,False,True,'');
   fTbnivelptniveltam := CreateCmDbField('TBNIVELPTNIVELTAM',ftString,False,False,False,True,'');
   fTbnivelptnivelini := CreateCmDbField('TBNIVELPTNIVELINI',ftString,False,False,False,True,'');
   fTbniveldesctam := CreateCmDbField('TBNIVELDESCTAM',ftString,False,False,False,True,'');
   fTbniveldescini := CreateCmDbField('TBNIVELDESCINI',ftString,False,False,False,True,'');
   fTbniveldecimal := CreateCmDbField('TBNIVELDECIMAL',ftString,False,False,False,True,'');
   fTbnivelctniveltam := CreateCmDbField('TBNIVELCTNIVELTAM',ftString,False,False,False,True,'');
   fTbnivelctnivelini := CreateCmDbField('TBNIVELCTNIVELINI',ftString,False,False,False,True,'');
   fTbnivelcodtam := CreateCmDbField('TBNIVELCODTAM',ftString,False,False,False,True,'');
   fTbnivelcodini := CreateCmDbField('TBNIVELCODINI',ftString,False,False,False,True,'');
   fTbnivelcasas := CreateCmDbField('TBNIVELCASAS',ftString,False,False,False,True,'');
   fTblocaldesctam := CreateCmDbField('TBLOCALDESCTAM',ftString,False,False,False,True,'');
   fTblocaldescini := CreateCmDbField('TBLOCALDESCINI',ftString,False,False,False,True,'');
   fTblocalcodtam := CreateCmDbField('TBLOCALCODTAM',ftString,False,False,False,True,'');
   fTblocalcodini := CreateCmDbField('TBLOCALCODINI',ftString,False,False,False,True,'');
   fTbeventogrptam := CreateCmDbField('TBEVENTOGRPTAM',ftString,False,False,False,True,'');
   fTbeventogrpini := CreateCmDbField('TBEVENTOGRPINI',ftString,False,False,False,True,'');
   fTbeventodesctam := CreateCmDbField('TBEVENTODESCTAM',ftString,False,False,False,True,'');
   fTbeventodescini := CreateCmDbField('TBEVENTODESCINI',ftString,False,False,False,True,'');
   fTbeventocodtam := CreateCmDbField('TBEVENTOCODTAM',ftString,False,False,False,True,'');
   fTbeventocodini := CreateCmDbField('TBEVENTOCODINI',ftString,False,False,False,True,'');
   fTbcargodesctam := CreateCmDbField('TBCARGODESCTAM',ftString,False,False,False,True,'');
   fTbcargodescini := CreateCmDbField('TBCARGODESCINI',ftString,False,False,False,True,'');
   fTbcargocodigotam := CreateCmDbField('TBCARGOCODIGOTAM',ftString,False,False,False,True,'');
   fTbcargocodigoini := CreateCmDbField('TBCARGOCODIGOINI',ftString,False,False,False,True,'');
   fTbbbdescricaotam := CreateCmDbField('TBBBDESCRICAOTAM',ftString,False,False,False,True,'');
   fTbbbdescricaoini := CreateCmDbField('TBBBDESCRICAOINI',ftString,False,False,False,True,'');
   fTbbancotam := CreateCmDbField('TBBANCOTAM',ftString,False,False,False,True,'');
   fTbbancoini := CreateCmDbField('TBBANCOINI',ftString,False,False,False,True,'');
   fTbagenciatam := CreateCmDbField('TBAGENCIATAM',ftString,False,False,False,True,'');
   fTbagenciaini := CreateCmDbField('TBAGENCIAINI',ftString,False,False,False,True,'');
   fTbagdescricaotam := CreateCmDbField('TBAGDESCRICAOTAM',ftString,False,False,False,True,'');
   fTbagdescricaoini := CreateCmDbField('TBAGDESCRICAOINI',ftString,False,False,False,True,'');
   fTamlancamento := CreateCmDbField('TAMLANCAMENTO',ftfloat,False,False,False,True,'');
   fSeqinterfa := CreateCmDbField('SEQINTERFA',ftString,False,False,False,True,'');
   fProvento := CreateCmDbField('PROVENTO',ftString,False,False,False,True,'');
   fPoslancamento := CreateCmDbField('POSLANCAMENTO',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftString,False,False,False,True,'');
   fPccodvincfunctam := CreateCmDbField('PCCODVINCFUNCTAM',ftString,False,False,False,True,'');
   fPccodvincfuncini := CreateCmDbField('PCCODVINCFUNCINI',ftString,False,False,False,True,'');
   fPatro := CreateCmDbField('PATRO',ftString,False,False,False,True,'');
   fNumcasasdec := CreateCmDbField('NUMCASASDEC',ftfloat,False,False,False,True,'');
   fMesref := CreateCmDbField('MESREF',ftString,False,False,False,True,'');
   fMescob := CreateCmDbField('MESCOB',ftString,False,False,False,True,'');
   fLtorgaotam := CreateCmDbField('LTORGAOTAM',ftString,False,False,False,True,'');
   fLtorgaoini := CreateCmDbField('LTORGAOINI',ftString,False,False,False,True,'');
   fLtmatriculatam := CreateCmDbField('LTMATRICULATAM',ftString,False,False,False,True,'');
   fLtmatriculaini := CreateCmDbField('LTMATRICULAINI',ftString,False,False,False,True,'');
   fLtlocaltam := CreateCmDbField('LTLOCALTAM',ftString,False,False,False,True,'');
   fLtlocalini := CreateCmDbField('LTLOCALINI',ftString,False,False,False,True,'');
   fLtinscricaotam := CreateCmDbField('LTINSCRICAOTAM',ftString,False,False,False,True,'');
   fLtinscricaoini := CreateCmDbField('LTINSCRICAOINI',ftString,False,False,False,True,'');
   fInivalorprove := CreateCmDbField('INIVALORPROVE',ftString,False,False,False,True,'');
   fInivalorpart := CreateCmDbField('INIVALORPART',ftString,False,False,False,True,'');
   fInivalorchave := CreateCmDbField('INIVALORCHAVE',ftString,False,False,False,True,'');
   fInitipochave := CreateCmDbField('INITIPOCHAVE',ftString,False,False,False,True,'');
   fIniseqinterface := CreateCmDbField('INISEQINTERFACE',ftString,False,False,False,True,'');
   fIniprovento := CreateCmDbField('INIPROVENTO',ftString,False,False,False,True,'');
   fIniplano := CreateCmDbField('INIPLANO',ftString,False,False,False,True,'');
   fInipatro := CreateCmDbField('INIPATRO',ftString,False,False,False,True,'');
   fInimesref := CreateCmDbField('INIMESREF',ftString,False,False,False,True,'');
   fInimescob := CreateCmDbField('INIMESCOB',ftString,False,False,False,True,'');
   fInidataref := CreateCmDbField('INIDATAREF',ftString,False,False,False,True,'');
   fInicioseqinterfa := CreateCmDbField('INICIOSEQINTERFA',ftString,False,False,False,True,'');
   fInicioseqintera := CreateCmDbField('INICIOSEQINTERA',ftString,False,False,False,True,'');
   fInichave := CreateCmDbField('INICHAVE',ftString,False,False,False,True,'');
   fIdregtbrubtam := CreateCmDbField('IDREGTBRUBTAM',ftString,False,False,False,True,'');
   fIdregtbrubrica := CreateCmDbField('IDREGTBRUBRICA',ftString,False,False,False,True,'');
   fIdregtbrubini := CreateCmDbField('IDREGTBRUBINI',ftString,False,False,False,True,'');
   fIdregtborgaotam := CreateCmDbField('IDREGTBORGAOTAM',ftString,False,False,False,True,'');
   fIdregtborgaoini := CreateCmDbField('IDREGTBORGAOINI',ftString,False,False,False,True,'');
   fIdregtborgao := CreateCmDbField('IDREGTBORGAO',ftString,False,False,False,True,'');
   fIdregtbniveltam := CreateCmDbField('IDREGTBNIVELTAM',ftString,False,False,False,True,'');
   fIdregtbnivelini := CreateCmDbField('IDREGTBNIVELINI',ftString,False,False,False,True,'');
   fIdregtbnivel := CreateCmDbField('IDREGTBNIVEL',ftString,False,False,False,True,'');
   fIdregtbeventotam := CreateCmDbField('IDREGTBEVENTOTAM',ftString,False,False,False,True,'');
   fIdregtbeventos := CreateCmDbField('IDREGTBEVENTOS',ftString,False,False,False,True,'');
   fIdregtbeventoini := CreateCmDbField('IDREGTBEVENTOINI',ftString,False,False,False,True,'');
   fIdregtbcargotam := CreateCmDbField('IDREGTBCARGOTAM',ftString,False,False,False,True,'');
   fIdregtbcargoini := CreateCmDbField('IDREGTBCARGOINI',ftString,False,False,False,True,'');
   fIdregtbcargo := CreateCmDbField('IDREGTBCARGO',ftString,False,False,False,True,'');
   fIdregtbbancotam := CreateCmDbField('IDREGTBBANCOTAM',ftString,False,False,False,True,'');
   fIdregtbbancos := CreateCmDbField('IDREGTBBANCOS',ftString,False,False,False,True,'');
   fIdregtbbancoini := CreateCmDbField('IDREGTBBANCOINI',ftString,False,False,False,True,'');
   fIdregrubricatam := CreateCmDbField('IDREGRUBRICATAM',ftString,False,False,False,True,'');
   fIdregrubricas := CreateCmDbField('IDREGRUBRICAS',ftString,False,False,False,True,'');
   fIdregrubricaini := CreateCmDbField('IDREGRUBRICAINI',ftString,False,False,False,True,'');
   fIdreglotacaotam := CreateCmDbField('IDREGLOTACAOTAM',ftString,False,False,False,True,'');
   fIdreglotacaoini := CreateCmDbField('IDREGLOTACAOINI',ftString,False,False,False,True,'');
   fIdreglotacao := CreateCmDbField('IDREGLOTACAO',ftString,False,False,False,True,'');
   fIdregeventotam := CreateCmDbField('IDREGEVENTOTAM',ftString,False,False,False,True,'');
   fIdregeventoini := CreateCmDbField('IDREGEVENTOINI',ftString,False,False,False,True,'');
   fIdregevento := CreateCmDbField('IDREGEVENTO',ftString,False,False,False,True,'');
   fIdregenderecotam := CreateCmDbField('IDREGENDERECOTAM',ftString,False,False,False,True,'');
   fIdregenderecoini := CreateCmDbField('IDREGENDERECOINI',ftString,False,False,False,True,'');
   fIdregendereco := CreateCmDbField('IDREGENDERECO',ftString,False,False,False,True,'');
   fIdregconsigtam := CreateCmDbField('IDREGCONSIGTAM',ftString,False,False,False,True,'');
   fIdregconsigini := CreateCmDbField('IDREGCONSIGINI',ftString,False,False,False,True,'');
   fIdregconsig := CreateCmDbField('IDREGCONSIG',ftString,False,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdpartrubrica := CreateCmDbField('IDPARTRUBRICA',ftfloat,False,False,False,True,'');
   fIdpartlotacao := CreateCmDbField('IDPARTLOTACAO',ftfloat,False,False,False,True,'');
   fIdparteventos := CreateCmDbField('IDPARTEVENTOS',ftfloat,False,False,False,True,'');
   fIdpartendereco := CreateCmDbField('IDPARTENDERECO',ftfloat,False,False,False,True,'');
   fFmtmesref := CreateCmDbField('FMTMESREF',ftString,False,False,False,True,'');
   fFlgtiposeparadec := CreateCmDbField('FLGTIPOSEPARADEC',ftString,False,False,False,True,'');
   fFlgseguro := CreateCmDbField('FLGSEGURO',ftfloat,False,False,False,True,'');
   fFlgmatcompleta := CreateCmDbField('FLGMATCOMPLETA',ftfloat,False,False,False,True,'');
   fFlglancamento := CreateCmDbField('FLGLANCAMENTO',ftString,False,False,False,True,'');
   fFlgidaouvolta := CreateCmDbField('FLGIDAOUVOLTA',ftfloat,False,False,False,True,'');
   fFlgheader := CreateCmDbField('FLGHEADER',ftString,False,False,False,True,'');
   fFlggravahist := CreateCmDbField('FLGGRAVAHIST',ftfloat,False,False,False,True,'');
   fFlgfooter := CreateCmDbField('FLGFOOTER',ftString,False,False,False,True,'');
   fFlgcodprovsalpart := CreateCmDbField('FLGCODPROVSALPART',ftString,False,False,False,True,'');
   fFlgcaracterdv := CreateCmDbField('FLGCARACTERDV',ftString,False,False,False,True,'');
   fFlgcalcsalpart := CreateCmDbField('FLGCALCSALPART',ftString,False,False,False,True,'');
   fFlgacumuladuplica := CreateCmDbField('FLGACUMULADUPLICA',ftfloat,False,False,False,True,'');
   fEvmatriculatam := CreateCmDbField('EVMATRICULATAM',ftString,False,False,False,True,'');
   fEvmatriculaini := CreateCmDbField('EVMATRICULAINI',ftString,False,False,False,True,'');
   fEvinscricaotam := CreateCmDbField('EVINSCRICAOTAM',ftString,False,False,False,True,'');
   fEvinscricaoini := CreateCmDbField('EVINSCRICAOINI',ftString,False,False,False,True,'');
   fEveventotam := CreateCmDbField('EVEVENTOTAM',ftString,False,False,False,True,'');
   fEveventoini := CreateCmDbField('EVEVENTOINI',ftString,False,False,False,True,'');
   fEvdtinitam := CreateCmDbField('EVDTINITAM',ftString,False,False,False,True,'');
   fEvdtiniini := CreateCmDbField('EVDTINIINI',ftString,False,False,False,True,'');
   fEvdtinifmt := CreateCmDbField('EVDTINIFMT',ftString,False,False,False,True,'');
   fEvdtfimtam := CreateCmDbField('EVDTFIMTAM',ftString,False,False,False,True,'');
   fEvdtfimini := CreateCmDbField('EVDTFIMINI',ftString,False,False,False,True,'');
   fEvdtfimfmt := CreateCmDbField('EVDTFIMFMT',ftString,False,False,False,True,'');
   fEduftam := CreateCmDbField('EDUFTAM',ftString,False,False,False,True,'');
   fEdufini := CreateCmDbField('EDUFINI',ftString,False,False,False,True,'');
   fEdtelefonetam := CreateCmDbField('EDTELEFONETAM',ftString,False,False,False,True,'');
   fEdtelefoneini := CreateCmDbField('EDTELEFONEINI',ftString,False,False,False,True,'');
   fEdmunicipiotam := CreateCmDbField('EDMUNICIPIOTAM',ftString,False,False,False,True,'');
   fEdmunicipioini := CreateCmDbField('EDMUNICIPIOINI',ftString,False,False,False,True,'');
   fEdmatriculatam := CreateCmDbField('EDMATRICULATAM',ftString,False,False,False,True,'');
   fEdmatriculaini := CreateCmDbField('EDMATRICULAINI',ftString,False,False,False,True,'');
   fEdlogradourotam := CreateCmDbField('EDLOGRADOUROTAM',ftString,False,False,False,True,'');
   fEdlogradouroini := CreateCmDbField('EDLOGRADOUROINI',ftString,False,False,False,True,'');
   fEdinscricaotam := CreateCmDbField('EDINSCRICAOTAM',ftString,False,False,False,True,'');
   fEdinscricaoini := CreateCmDbField('EDINSCRICAOINI',ftString,False,False,False,True,'');
   fEdeventotam := CreateCmDbField('EDEVENTOTAM',ftString,False,False,False,True,'');
   fEdceptam := CreateCmDbField('EDCEPTAM',ftString,False,False,False,True,'');
   fEdcepini := CreateCmDbField('EDCEPINI',ftString,False,False,False,True,'');
   fEdbairrotam := CreateCmDbField('EDBAIRROTAM',ftString,False,False,False,True,'');
   fEdbairroini := CreateCmDbField('EDBAIRROINI',ftString,False,False,False,True,'');
   fDsagenciatam := CreateCmDbField('DSAGENCIATAM',ftString,False,False,False,True,'');
   fDcufidenttam := CreateCmDbField('DCUFIDENTTAM',ftString,False,False,False,True,'');
   fDcufidentini := CreateCmDbField('DCUFIDENTINI',ftString,False,False,False,True,'');
   fDcsexoidfem := CreateCmDbField('DCSEXOIDFEM',ftString,False,False,False,True,'');
   fDcsexoid := CreateCmDbField('DCSEXOID',ftString,False,False,False,True,'');
   fDcidenttam := CreateCmDbField('DCIDENTTAM',ftString,False,False,False,True,'');
   fDcidentini := CreateCmDbField('DCIDENTINI',ftString,False,False,False,True,'');
   fDcftdtexpident := CreateCmDbField('DCFTDTEXPIDENT',ftString,False,False,False,True,'');
   fDcestcivilidv := CreateCmDbField('DCESTCIVILIDV',ftString,False,False,False,True,'');
   fDcestcivilids := CreateCmDbField('DCESTCIVILIDS',ftString,False,False,False,True,'');
   fDcestcivilido := CreateCmDbField('DCESTCIVILIDO',ftString,False,False,False,True,'');
   fDcestcivilidd := CreateCmDbField('DCESTCIVILIDD',ftString,False,False,False,True,'');
   fDcestcivilidc := CreateCmDbField('DCESTCIVILIDC',ftString,False,False,False,True,'');
   fDcdtexpidenttam := CreateCmDbField('DCDTEXPIDENTTAM',ftString,False,False,False,True,'');
   fDcdtexpidentini := CreateCmDbField('DCDTEXPIDENTINI',ftString,False,False,False,True,'');
   fDataref := CreateCmDbField('DATAREF',ftString,False,False,False,True,'');
   fCsvalortam := CreateCmDbField('CSVALORTAM',ftString,False,False,False,True,'');
   fCsvalorini := CreateCmDbField('CSVALORINI',ftString,False,False,False,True,'');
   fCsrubricatam := CreateCmDbField('CSRUBRICATAM',ftString,False,False,False,True,'');
   fCsrubricaini := CreateCmDbField('CSRUBRICAINI',ftString,False,False,False,True,'');
   fCsmatriculatam := CreateCmDbField('CSMATRICULATAM',ftString,False,False,False,True,'');
   fCsmatriculaini := CreateCmDbField('CSMATRICULAINI',ftString,False,False,False,True,'');
   fCsinscricaotam := CreateCmDbField('CSINSCRICAOTAM',ftString,False,False,False,True,'');
   fCsinscricaoini := CreateCmDbField('CSINSCRICAOINI',ftString,False,False,False,True,'');
   fCodprovsalpart := CreateCmDbField('CODPROVSALPART',ftString,False,False,False,True,'');
   fCodprovduplo := CreateCmDbField('CODPROVDUPLO',ftString,False,False,False,True,'');
   fChave := CreateCmDbField('CHAVE',ftString,False,False,False,True,'');
   fCaracterdvtxt := CreateCmDbField('CARACTERDVTXT',ftString,False,False,False,True,'');
   fAnomesgravaabono := CreateCmDbField('ANOMESGRAVAABONO',ftString,False,False,False,True,'');
   FTamIdPessoa := CreateCmDbField('TAMIDPESSOA',ftString,False,False,False,True,'');
   FIniIdPessoa := CreateCmDbField('INIIDPESSOA',ftString,False,False,False,True,'');
   FTamEquiparacao := CreateCmDbField('TAMEQUIPARACAO',ftString,False,False,False,True,'');
   FIniEquiparacao := CreateCmDbField('INIEQUIPARACAO',ftString,False,False,False,True,'');
end;

function TDbParaminterf.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbParaminterf.SetAnomesgravaabono(const Value: TCmDbField);
begin
  FAnomesgravaabono := Value;
end;

procedure TDbParaminterf.SetCaracterdvtxt(const Value: TCmDbField);
begin
  FCaracterdvtxt := Value;
end;

procedure TDbParaminterf.SetChave(const Value: TCmDbField);
begin
  FChave := Value;
end;

procedure TDbParaminterf.SetCodprovduplo(const Value: TCmDbField);
begin
  FCodprovduplo := Value;
end;

procedure TDbParaminterf.SetCodprovsalpart(const Value: TCmDbField);
begin
  FCodprovsalpart := Value;
end;

procedure TDbParaminterf.SetCsinscricaoini(const Value: TCmDbField);
begin
  FCsinscricaoini := Value;
end;

procedure TDbParaminterf.SetCsinscricaotam(const Value: TCmDbField);
begin
  FCsinscricaotam := Value;
end;

procedure TDbParaminterf.SetCsmatriculaini(const Value: TCmDbField);
begin
  FCsmatriculaini := Value;
end;

procedure TDbParaminterf.SetCsmatriculatam(const Value: TCmDbField);
begin
  FCsmatriculatam := Value;
end;

procedure TDbParaminterf.SetCsrubricaini(const Value: TCmDbField);
begin
  FCsrubricaini := Value;
end;

procedure TDbParaminterf.SetCsrubricatam(const Value: TCmDbField);
begin
  FCsrubricatam := Value;
end;

procedure TDbParaminterf.SetCsvalorini(const Value: TCmDbField);
begin
  FCsvalorini := Value;
end;

procedure TDbParaminterf.SetCsvalortam(const Value: TCmDbField);
begin
  FCsvalortam := Value;
end;

procedure TDbParaminterf.SetDataref(const Value: TCmDbField);
begin
  FDataref := Value;
end;

procedure TDbParaminterf.SetDcdtexpidentini(const Value: TCmDbField);
begin
  FDcdtexpidentini := Value;
end;

procedure TDbParaminterf.SetDcdtexpidenttam(const Value: TCmDbField);
begin
  FDcdtexpidenttam := Value;
end;

procedure TDbParaminterf.SetDcestcivilidc(const Value: TCmDbField);
begin
  FDcestcivilidc := Value;
end;

procedure TDbParaminterf.SetDcestcivilidd(const Value: TCmDbField);
begin
  FDcestcivilidd := Value;
end;

procedure TDbParaminterf.SetDcestcivilido(const Value: TCmDbField);
begin
  FDcestcivilido := Value;
end;

procedure TDbParaminterf.SetDcestcivilids(const Value: TCmDbField);
begin
  FDcestcivilids := Value;
end;

procedure TDbParaminterf.SetDcestcivilidv(const Value: TCmDbField);
begin
  FDcestcivilidv := Value;
end;

procedure TDbParaminterf.SetDcftdtexpident(const Value: TCmDbField);
begin
  FDcftdtexpident := Value;
end;

procedure TDbParaminterf.SetDcidentini(const Value: TCmDbField);
begin
  FDcidentini := Value;
end;

procedure TDbParaminterf.SetDcidenttam(const Value: TCmDbField);
begin
  FDcidenttam := Value;
end;

procedure TDbParaminterf.SetDcsexoid(const Value: TCmDbField);
begin
  FDcsexoid := Value;
end;

procedure TDbParaminterf.SetDcsexoidfem(const Value: TCmDbField);
begin
  FDcsexoidfem := Value;
end;

procedure TDbParaminterf.SetDcufidentini(const Value: TCmDbField);
begin
  FDcufidentini := Value;
end;

procedure TDbParaminterf.SetDcufidenttam(const Value: TCmDbField);
begin
  FDcufidenttam := Value;
end;

procedure TDbParaminterf.SetDsagenciatam(const Value: TCmDbField);
begin
  FDsagenciatam := Value;
end;

procedure TDbParaminterf.SetEdbairroini(const Value: TCmDbField);
begin
  FEdbairroini := Value;
end;

procedure TDbParaminterf.SetEdbairrotam(const Value: TCmDbField);
begin
  FEdbairrotam := Value;
end;

procedure TDbParaminterf.SetEdcepini(const Value: TCmDbField);
begin
  FEdcepini := Value;
end;

procedure TDbParaminterf.SetEdceptam(const Value: TCmDbField);
begin
  FEdceptam := Value;
end;

procedure TDbParaminterf.SetEdeventotam(const Value: TCmDbField);
begin
  FEdeventotam := Value;
end;

procedure TDbParaminterf.SetEdinscricaoini(const Value: TCmDbField);
begin
  FEdinscricaoini := Value;
end;

procedure TDbParaminterf.SetEdinscricaotam(const Value: TCmDbField);
begin
  FEdinscricaotam := Value;
end;

procedure TDbParaminterf.SetEdlogradouroini(const Value: TCmDbField);
begin
  FEdlogradouroini := Value;
end;

procedure TDbParaminterf.SetEdlogradourotam(const Value: TCmDbField);
begin
  FEdlogradourotam := Value;
end;

procedure TDbParaminterf.SetEdmatriculaini(const Value: TCmDbField);
begin
  FEdmatriculaini := Value;
end;

procedure TDbParaminterf.SetEdmatriculatam(const Value: TCmDbField);
begin
  FEdmatriculatam := Value;
end;

procedure TDbParaminterf.SetEdmunicipioini(const Value: TCmDbField);
begin
  FEdmunicipioini := Value;
end;

procedure TDbParaminterf.SetEdmunicipiotam(const Value: TCmDbField);
begin
  FEdmunicipiotam := Value;
end;

procedure TDbParaminterf.SetEdtelefoneini(const Value: TCmDbField);
begin
  FEdtelefoneini := Value;
end;

procedure TDbParaminterf.SetEdtelefonetam(const Value: TCmDbField);
begin
  FEdtelefonetam := Value;
end;

procedure TDbParaminterf.SetEdufini(const Value: TCmDbField);
begin
  FEdufini := Value;
end;

procedure TDbParaminterf.SetEduftam(const Value: TCmDbField);
begin
  FEduftam := Value;
end;

procedure TDbParaminterf.SetEvdtfimfmt(const Value: TCmDbField);
begin
  FEvdtfimfmt := Value;
end;

procedure TDbParaminterf.SetEvdtfimini(const Value: TCmDbField);
begin
  FEvdtfimini := Value;
end;

procedure TDbParaminterf.SetEvdtfimtam(const Value: TCmDbField);
begin
  FEvdtfimtam := Value;
end;

procedure TDbParaminterf.SetEvdtinifmt(const Value: TCmDbField);
begin
  FEvdtinifmt := Value;
end;

procedure TDbParaminterf.SetEvdtiniini(const Value: TCmDbField);
begin
  FEvdtiniini := Value;
end;

procedure TDbParaminterf.SetEvdtinitam(const Value: TCmDbField);
begin
  FEvdtinitam := Value;
end;

procedure TDbParaminterf.SetEveventoini(const Value: TCmDbField);
begin
  FEveventoini := Value;
end;

procedure TDbParaminterf.SetEveventotam(const Value: TCmDbField);
begin
  FEveventotam := Value;
end;

procedure TDbParaminterf.SetEvinscricaoini(const Value: TCmDbField);
begin
  FEvinscricaoini := Value;
end;

procedure TDbParaminterf.SetEvinscricaotam(const Value: TCmDbField);
begin
  FEvinscricaotam := Value;
end;

procedure TDbParaminterf.SetEvmatriculaini(const Value: TCmDbField);
begin
  FEvmatriculaini := Value;
end;

procedure TDbParaminterf.SetEvmatriculatam(const Value: TCmDbField);
begin
  FEvmatriculatam := Value;
end;

procedure TDbParaminterf.SetFlgacumuladuplica(const Value: TCmDbField);
begin
  FFlgacumuladuplica := Value;
end;

procedure TDbParaminterf.SetFlgcalcsalpart(const Value: TCmDbField);
begin
  FFlgcalcsalpart := Value;
end;

procedure TDbParaminterf.SetFlgcaracterdv(const Value: TCmDbField);
begin
  FFlgcaracterdv := Value;
end;

procedure TDbParaminterf.SetFlgcodprovsalpart(const Value: TCmDbField);
begin
  FFlgcodprovsalpart := Value;
end;

procedure TDbParaminterf.SetFlgfooter(const Value: TCmDbField);
begin
  FFlgfooter := Value;
end;

procedure TDbParaminterf.SetFlggravahist(const Value: TCmDbField);
begin
  FFlggravahist := Value;
end;

procedure TDbParaminterf.SetFlgheader(const Value: TCmDbField);
begin
  FFlgheader := Value;
end;

procedure TDbParaminterf.SetFlgidaouvolta(const Value: TCmDbField);
begin
  FFlgidaouvolta := Value;
end;

procedure TDbParaminterf.SetFlglancamento(const Value: TCmDbField);
begin
  FFlglancamento := Value;
end;

procedure TDbParaminterf.SetFlgmatcompleta(const Value: TCmDbField);
begin
  FFlgmatcompleta := Value;
end;

procedure TDbParaminterf.SetFlgseguro(const Value: TCmDbField);
begin
  FFlgseguro := Value;
end;

procedure TDbParaminterf.SetFlgtiposeparadec(const Value: TCmDbField);
begin
  FFlgtiposeparadec := Value;
end;

procedure TDbParaminterf.SetFmtmesref(const Value: TCmDbField);
begin
  FFmtmesref := Value;
end;

procedure TDbParaminterf.SetIdpartendereco(const Value: TCmDbField);
begin
  FIdpartendereco := Value;
end;

procedure TDbParaminterf.SetIdparteventos(const Value: TCmDbField);
begin
  FIdparteventos := Value;
end;

procedure TDbParaminterf.SetIdpartlotacao(const Value: TCmDbField);
begin
  FIdpartlotacao := Value;
end;

procedure TDbParaminterf.SetIdpartrubrica(const Value: TCmDbField);
begin
  FIdpartrubrica := Value;
end;

procedure TDbParaminterf.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbParaminterf.SetIdregconsig(const Value: TCmDbField);
begin
  FIdregconsig := Value;
end;

procedure TDbParaminterf.SetIdregconsigini(const Value: TCmDbField);
begin
  FIdregconsigini := Value;
end;

procedure TDbParaminterf.SetIdregconsigtam(const Value: TCmDbField);
begin
  FIdregconsigtam := Value;
end;

procedure TDbParaminterf.SetIdregendereco(const Value: TCmDbField);
begin
  FIdregendereco := Value;
end;

procedure TDbParaminterf.SetIdregenderecoini(const Value: TCmDbField);
begin
  FIdregenderecoini := Value;
end;

procedure TDbParaminterf.SetIdregenderecotam(const Value: TCmDbField);
begin
  FIdregenderecotam := Value;
end;

procedure TDbParaminterf.SetIdregevento(const Value: TCmDbField);
begin
  FIdregevento := Value;
end;

procedure TDbParaminterf.SetIdregeventoini(const Value: TCmDbField);
begin
  FIdregeventoini := Value;
end;

procedure TDbParaminterf.SetIdregeventotam(const Value: TCmDbField);
begin
  FIdregeventotam := Value;
end;

procedure TDbParaminterf.SetIdreglotacao(const Value: TCmDbField);
begin
  FIdreglotacao := Value;
end;

procedure TDbParaminterf.SetIdreglotacaoini(const Value: TCmDbField);
begin
  FIdreglotacaoini := Value;
end;

procedure TDbParaminterf.SetIdreglotacaotam(const Value: TCmDbField);
begin
  FIdreglotacaotam := Value;
end;

procedure TDbParaminterf.SetIdregrubricaini(const Value: TCmDbField);
begin
  FIdregrubricaini := Value;
end;

procedure TDbParaminterf.SetIdregrubricas(const Value: TCmDbField);
begin
  FIdregrubricas := Value;
end;

procedure TDbParaminterf.SetIdregrubricatam(const Value: TCmDbField);
begin
  FIdregrubricatam := Value;
end;

procedure TDbParaminterf.SetIdregtbbancoini(const Value: TCmDbField);
begin
  FIdregtbbancoini := Value;
end;

procedure TDbParaminterf.SetIdregtbbancos(const Value: TCmDbField);
begin
  FIdregtbbancos := Value;
end;

procedure TDbParaminterf.SetIdregtbbancotam(const Value: TCmDbField);
begin
  FIdregtbbancotam := Value;
end;

procedure TDbParaminterf.SetIdregtbcargo(const Value: TCmDbField);
begin
  FIdregtbcargo := Value;
end;

procedure TDbParaminterf.SetIdregtbcargoini(const Value: TCmDbField);
begin
  FIdregtbcargoini := Value;
end;

procedure TDbParaminterf.SetIdregtbcargotam(const Value: TCmDbField);
begin
  FIdregtbcargotam := Value;
end;

procedure TDbParaminterf.SetIdregtbeventoini(const Value: TCmDbField);
begin
  FIdregtbeventoini := Value;
end;

procedure TDbParaminterf.SetIdregtbeventos(const Value: TCmDbField);
begin
  FIdregtbeventos := Value;
end;

procedure TDbParaminterf.SetIdregtbeventotam(const Value: TCmDbField);
begin
  FIdregtbeventotam := Value;
end;

procedure TDbParaminterf.SetIdregtbnivel(const Value: TCmDbField);
begin
  FIdregtbnivel := Value;
end;

procedure TDbParaminterf.SetIdregtbnivelini(const Value: TCmDbField);
begin
  FIdregtbnivelini := Value;
end;

procedure TDbParaminterf.SetIdregtbniveltam(const Value: TCmDbField);
begin
  FIdregtbniveltam := Value;
end;

procedure TDbParaminterf.SetIdregtborgao(const Value: TCmDbField);
begin
  FIdregtborgao := Value;
end;

procedure TDbParaminterf.SetIdregtborgaoini(const Value: TCmDbField);
begin
  FIdregtborgaoini := Value;
end;

procedure TDbParaminterf.SetIdregtborgaotam(const Value: TCmDbField);
begin
  FIdregtborgaotam := Value;
end;

procedure TDbParaminterf.SetIdregtbrubini(const Value: TCmDbField);
begin
  FIdregtbrubini := Value;
end;

procedure TDbParaminterf.SetIdregtbrubrica(const Value: TCmDbField);
begin
  FIdregtbrubrica := Value;
end;

procedure TDbParaminterf.SetIdregtbrubtam(const Value: TCmDbField);
begin
  FIdregtbrubtam := Value;
end;

procedure TDbParaminterf.SetInichave(const Value: TCmDbField);
begin
  FInichave := Value;
end;

procedure TDbParaminterf.SetInicioseqintera(const Value: TCmDbField);
begin
  FInicioseqintera := Value;
end;

procedure TDbParaminterf.SetInicioseqinterfa(const Value: TCmDbField);
begin
  FInicioseqinterfa := Value;
end;

procedure TDbParaminterf.SetInidataref(const Value: TCmDbField);
begin
  FInidataref := Value;
end;

procedure TDbParaminterf.SetIniIdPessoa(const Value: TCmDbField);
begin
  FIniIdPessoa := Value;
end;

procedure TDbParaminterf.SetIniEquiparacao(const Value: TCmDbField);
begin
  FIniEquiparacao := Value;
end;


procedure TDbParaminterf.SetInimescob(const Value: TCmDbField);
begin
  FInimescob := Value;
end;

procedure TDbParaminterf.SetInimesref(const Value: TCmDbField);
begin
  FInimesref := Value;
end;

procedure TDbParaminterf.SetInipatro(const Value: TCmDbField);
begin
  FInipatro := Value;
end;

procedure TDbParaminterf.SetIniplano(const Value: TCmDbField);
begin
  FIniplano := Value;
end;

procedure TDbParaminterf.SetIniprovento(const Value: TCmDbField);
begin
  FIniprovento := Value;
end;

procedure TDbParaminterf.SetIniseqinterface(const Value: TCmDbField);
begin
  FIniseqinterface := Value;
end;

procedure TDbParaminterf.SetInitipochave(const Value: TCmDbField);
begin
  FInitipochave := Value;
end;

procedure TDbParaminterf.SetInivalorchave(const Value: TCmDbField);
begin
  FInivalorchave := Value;
end;

procedure TDbParaminterf.SetInivalorpart(const Value: TCmDbField);
begin
  FInivalorpart := Value;
end;

procedure TDbParaminterf.SetInivalorprove(const Value: TCmDbField);
begin
  FInivalorprove := Value;
end;

procedure TDbParaminterf.SetLtinscricaoini(const Value: TCmDbField);
begin
  FLtinscricaoini := Value;
end;

procedure TDbParaminterf.SetLtinscricaotam(const Value: TCmDbField);
begin
  FLtinscricaotam := Value;
end;

procedure TDbParaminterf.SetLtlocalini(const Value: TCmDbField);
begin
  FLtlocalini := Value;
end;

procedure TDbParaminterf.SetLtlocaltam(const Value: TCmDbField);
begin
  FLtlocaltam := Value;
end;

procedure TDbParaminterf.SetLtmatriculaini(const Value: TCmDbField);
begin
  FLtmatriculaini := Value;
end;

procedure TDbParaminterf.SetLtmatriculatam(const Value: TCmDbField);
begin
  FLtmatriculatam := Value;
end;

procedure TDbParaminterf.SetLtorgaoini(const Value: TCmDbField);
begin
  FLtorgaoini := Value;
end;

procedure TDbParaminterf.SetLtorgaotam(const Value: TCmDbField);
begin
  FLtorgaotam := Value;
end;

procedure TDbParaminterf.SetMescob(const Value: TCmDbField);
begin
  FMescob := Value;
end;

procedure TDbParaminterf.SetMesref(const Value: TCmDbField);
begin
  FMesref := Value;
end;

procedure TDbParaminterf.SetNumcasasdec(const Value: TCmDbField);
begin
  FNumcasasdec := Value;
end;

procedure TDbParaminterf.SetPatro(const Value: TCmDbField);
begin
  FPatro := Value;
end;

procedure TDbParaminterf.SetPccodvincfuncini(const Value: TCmDbField);
begin
  FPccodvincfuncini := Value;
end;

procedure TDbParaminterf.SetPccodvincfunctam(const Value: TCmDbField);
begin
  FPccodvincfunctam := Value;
end;

procedure TDbParaminterf.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbParaminterf.SetPoslancamento(const Value: TCmDbField);
begin
  FPoslancamento := Value;
end;

procedure TDbParaminterf.SetProvento(const Value: TCmDbField);
begin
  FProvento := Value;
end;

procedure TDbParaminterf.SetSeqinterfa(const Value: TCmDbField);
begin
  FSeqinterfa := Value;
end;

procedure TDbParaminterf.SetTamIdPessoa(const Value: TCmDbField);
begin
  FTamIdPessoa := Value;
end;

procedure TDbParaminterf.SetTamEquiparacao(const Value: TCmDbField);
begin
  FTamEquiparacao := Value;
end;

procedure TDbParaminterf.SetTamlancamento(const Value: TCmDbField);
begin
  FTamlancamento := Value;
end;

procedure TDbParaminterf.SetTbagdescricaoini(const Value: TCmDbField);
begin
  FTbagdescricaoini := Value;
end;

procedure TDbParaminterf.SetTbagdescricaotam(const Value: TCmDbField);
begin
  FTbagdescricaotam := Value;
end;

procedure TDbParaminterf.SetTbagenciaini(const Value: TCmDbField);
begin
  FTbagenciaini := Value;
end;

procedure TDbParaminterf.SetTbagenciatam(const Value: TCmDbField);
begin
  FTbagenciatam := Value;
end;

procedure TDbParaminterf.SetTbbancoini(const Value: TCmDbField);
begin
  FTbbancoini := Value;
end;

procedure TDbParaminterf.SetTbbancotam(const Value: TCmDbField);
begin
  FTbbancotam := Value;
end;

procedure TDbParaminterf.SetTbbbdescricaoini(const Value: TCmDbField);
begin
  FTbbbdescricaoini := Value;
end;

procedure TDbParaminterf.SetTbbbdescricaotam(const Value: TCmDbField);
begin
  FTbbbdescricaotam := Value;
end;

procedure TDbParaminterf.SetTbcargocodigoini(const Value: TCmDbField);
begin
  FTbcargocodigoini := Value;
end;

procedure TDbParaminterf.SetTbcargocodigotam(const Value: TCmDbField);
begin
  FTbcargocodigotam := Value;
end;

procedure TDbParaminterf.SetTbcargodescini(const Value: TCmDbField);
begin
  FTbcargodescini := Value;
end;

procedure TDbParaminterf.SetTbcargodesctam(const Value: TCmDbField);
begin
  FTbcargodesctam := Value;
end;

procedure TDbParaminterf.SetTbeventocodini(const Value: TCmDbField);
begin
  FTbeventocodini := Value;
end;

procedure TDbParaminterf.SetTbeventocodtam(const Value: TCmDbField);
begin
  FTbeventocodtam := Value;
end;

procedure TDbParaminterf.SetTbeventodescini(const Value: TCmDbField);
begin
  FTbeventodescini := Value;
end;

procedure TDbParaminterf.SetTbeventodesctam(const Value: TCmDbField);
begin
  FTbeventodesctam := Value;
end;

procedure TDbParaminterf.SetTbeventogrpini(const Value: TCmDbField);
begin
  FTbeventogrpini := Value;
end;

procedure TDbParaminterf.SetTbeventogrptam(const Value: TCmDbField);
begin
  FTbeventogrptam := Value;
end;

procedure TDbParaminterf.SetTblocalcodini(const Value: TCmDbField);
begin
  FTblocalcodini := Value;
end;

procedure TDbParaminterf.SetTblocalcodtam(const Value: TCmDbField);
begin
  FTblocalcodtam := Value;
end;

procedure TDbParaminterf.SetTblocaldescini(const Value: TCmDbField);
begin
  FTblocaldescini := Value;
end;

procedure TDbParaminterf.SetTblocaldesctam(const Value: TCmDbField);
begin
  FTblocaldesctam := Value;
end;

procedure TDbParaminterf.SetTbnivelcasas(const Value: TCmDbField);
begin
  FTbnivelcasas := Value;
end;

procedure TDbParaminterf.SetTbnivelcodini(const Value: TCmDbField);
begin
  FTbnivelcodini := Value;
end;

procedure TDbParaminterf.SetTbnivelcodtam(const Value: TCmDbField);
begin
  FTbnivelcodtam := Value;
end;

procedure TDbParaminterf.SetTbnivelctnivelini(const Value: TCmDbField);
begin
  FTbnivelctnivelini := Value;
end;

procedure TDbParaminterf.SetTbnivelctniveltam(const Value: TCmDbField);
begin
  FTbnivelctniveltam := Value;
end;

procedure TDbParaminterf.SetTbniveldecimal(const Value: TCmDbField);
begin
  FTbniveldecimal := Value;
end;

procedure TDbParaminterf.SetTbniveldescini(const Value: TCmDbField);
begin
  FTbniveldescini := Value;
end;

procedure TDbParaminterf.SetTbniveldesctam(const Value: TCmDbField);
begin
  FTbniveldesctam := Value;
end;

procedure TDbParaminterf.SetTbnivelptnivelini(const Value: TCmDbField);
begin
  FTbnivelptnivelini := Value;
end;

procedure TDbParaminterf.SetTbnivelptniveltam(const Value: TCmDbField);
begin
  FTbnivelptniveltam := Value;
end;

procedure TDbParaminterf.SetTborgaocodini(const Value: TCmDbField);
begin
  FTborgaocodini := Value;
end;

procedure TDbParaminterf.SetTborgaocodtam(const Value: TCmDbField);
begin
  FTborgaocodtam := Value;
end;

procedure TDbParaminterf.SetTborgaodescini(const Value: TCmDbField);
begin
  FTborgaodescini := Value;
end;

procedure TDbParaminterf.SetTborgaodesctam(const Value: TCmDbField);
begin
  FTborgaodesctam := Value;
end;

procedure TDbParaminterf.SetTborgaolocini(const Value: TCmDbField);
begin
  FTborgaolocini := Value;
end;

procedure TDbParaminterf.SetTborgaoloctam(const Value: TCmDbField);
begin
  FTborgaoloctam := Value;
end;

procedure TDbParaminterf.SetTbrubcodigoini(const Value: TCmDbField);
begin
  FTbrubcodigoini := Value;
end;

procedure TDbParaminterf.SetTbrubcodigotam(const Value: TCmDbField);
begin
  FTbrubcodigotam := Value;
end;

procedure TDbParaminterf.SetTbrubdescricaoini(const Value: TCmDbField);
begin
  FTbrubdescricaoini := Value;
end;

procedure TDbParaminterf.SetTbrubdescricaotam(const Value: TCmDbField);
begin
  FTbrubdescricaotam := Value;
end;

procedure TDbParaminterf.SetTbrubiddesconto(const Value: TCmDbField);
begin
  FTbrubiddesconto := Value;
end;

procedure TDbParaminterf.SetTbrubidprovento(const Value: TCmDbField);
begin
  FTbrubidprovento := Value;
end;

procedure TDbParaminterf.SetTbrubincideini(const Value: TCmDbField);
begin
  FTbrubincideini := Value;
end;

procedure TDbParaminterf.SetTbrubincidetam(const Value: TCmDbField);
begin
  FTbrubincidetam := Value;
end;

procedure TDbParaminterf.SetTbrubtipoini(const Value: TCmDbField);
begin
  FTbrubtipoini := Value;
end;

procedure TDbParaminterf.SetTbrubtipotam(const Value: TCmDbField);
begin
  FTbrubtipotam := Value;
end;

procedure TDbParaminterf.SetTbsitfunccodini(const Value: TCmDbField);
begin
  FTbsitfunccodini := Value;
end;

procedure TDbParaminterf.SetTbsitfunccodtam(const Value: TCmDbField);
begin
  FTbsitfunccodtam := Value;
end;

procedure TDbParaminterf.SetTbsitfuncdescini(const Value: TCmDbField);
begin
  FTbsitfuncdescini := Value;
end;

procedure TDbParaminterf.SetTbsitfuncdesctam(const Value: TCmDbField);
begin
  FTbsitfuncdesctam := Value;
end;

procedure TDbParaminterf.SetTipochave(const Value: TCmDbField);
begin
  FTipochave := Value;
end;

procedure TDbParaminterf.SetValorchave(const Value: TCmDbField);
begin
  FValorchave := Value;
end;

procedure TDbParaminterf.SetValoreslancamento(const Value: TCmDbField);
begin
  FValoreslancamento := Value;
end;

procedure TDbParaminterf.SetValorpart(const Value: TCmDbField);
begin
  FValorpart := Value;
end;

procedure TDbParaminterf.SetValorprove(const Value: TCmDbField);
begin
  FValorprove := Value;
end;

end.



