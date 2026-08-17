unit uCtrlModuloImobiliario;

interface

uses
   uCmControlObject, SysUtils, extCtrls, uCMTypes, uComunsImobiliario, uCmClientDataSet,
   uCtrlParamImovel, uCtrlParamGlobal, uCtrlParamAlienacao, uCtrlParamInvestimob, uCtrlParamCAF;


// ---- CLASSE ADMINIMOB -------------------------------------------------------
type
   TAdminImob = Class(TCmControlObject)

   protected

      procedure AfterInitialize; override;


   private

      CtrlParamImovel: TCtrlParamImovel;

      FiAnoCompetencia: Integer;
      FiMesCompetencia: Integer;
      FiUnidNegoc: Integer;
      FsCodCentroRespon: String;
      FbFlgDiario: Boolean;
      FbFlgObrigaContrato: Boolean;
      FbFlgLancPagEncerra: Boolean;
      FbFlgParTdCon: Boolean;
      FbFlgParCon: Boolean;
      FbFlgParTdTpIm: Boolean;
      FbFlgParTdIm: Boolean;
      FbFlgParIm: Boolean;
      FbFlgParTpDes: Boolean;
      FbFlgParTpIm: Boolean;
      FbFlgConcatenaAno: Boolean;
      FbFlgSugereContrato: Boolean;
      FbFlgIntegraCapCar: Boolean;
      FiCodPortForma: Integer;
      FbFlgUsaInvestimob: Boolean;
      FbFlgIntegraContab: Boolean;
      FbFlgLancRecInativo: Boolean;
      FbFlgLancRecEncerra: Boolean;
      FiMesBloqLancto: Integer;
      FiTipoReceitaAlug: Integer;
      FbFlgLancPagInativo: Boolean;
      FbFlgUsaAP: Boolean;
      FbFlgDiaUtilAP: boolean;
      FbFlgHistContDifAP: boolean;
      FbFlgMultiTipo: Boolean;
      FbFlgIntegraOrcamen: Boolean;
      FbFlgAviso: Boolean;
      FsTipoImovelPatro: String;
      FiGrupoRegra: Integer;
      FiQtdeMesPrevFolha: Integer;
      FiFlgPrevFolha: Integer;
      FiTipoOperAtualMulta: Integer;
      FiTipoOperAtualJuros: Integer;
      FiTipoOperAtualCM: Integer;
      FiTipoOperProvPerdas: Integer;
      FsCodCentroCusto: String;
      FiPrograma: Integer;
      FbFlgReembolsoAutomatico: Boolean;
      FbFlgLancForaComp: Boolean;
      FiTipoOperProvReceita: Integer;
      FbFlgLogoRelat: Boolean; // Marcio Motta - 25/06/2004
      FLogoTipo: TImage;
      FiIdCartaCobranca1: Integer;
      FiIdCartaCobranca3: Integer;
      FiIdCartaCobranca2: Integer;
      FiIdCartaCobranca4: Integer;

      // Marcio Motta - 25/06/2004
      FsFlgCalcInadimp: String;

      // Marchetti - Pendencia 18871
      FIDRegraMulta : Integer;

      // André Pontes - 16/08/2005 - pendência 19875
      FbFlgBloqRecAluguel: Boolean;
      FbAtualizaDataProgramada: Boolean;
      FFLGTIPODATAPROG: String;

      FiTipoOperAbonoJuros: Integer;
      FiTipoOperAbonoMulta: Integer;
      FiTipoOperAbonoCM: Integer;
      FbApenasUltMesAnterior: Boolean;

      // Daniel - 23516
      FMascaraCompl: String;

      // Daniel - 21967
      FbFlgAlteraEvento: Boolean;

      // Daniel - 21413
      FbFlgRegEvento: Boolean;

      // Daniel - 22688
      FbFlgBloqDtLanc: Boolean;

      // Daniel - 24085
      FbFlgUsaUnidade: Boolean;


// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgValCod : String;
    FsFlgAutCod : String;
// Felipe de Oliveira Sol 65636 - Fim      

      procedure SetiAnoCompetencia(const Value: Integer);
      procedure SetiMesCompetencia(const Value: Integer);
      procedure SetiUnidNegoc(const Value: Integer);
      procedure SetsCodCentroRespon(const Value: String);
      procedure SetbFlgDiario(const Value: Boolean);
      procedure SetbFlgLancPagEncerra(const Value: Boolean);
      procedure SetbFlgObrigaContrato(const Value: Boolean);
      procedure SetbFlgParCon(const Value: Boolean);
      procedure SetbFlgParIm(const Value: Boolean);
      procedure SetbFlgParTdCon(const Value: Boolean);
      procedure SetbFlgParTdIm(const Value: Boolean);
      procedure SetbFlgParTdTpIm(const Value: Boolean);
      procedure SetbFlgParTpDes(const Value: Boolean);
      procedure SetbFlgParTpIm(const Value: Boolean);
      procedure SetbFlgConcatenaAno(const Value: Boolean);
      procedure SetbFlgSugereContrato(const Value: Boolean);
      procedure SetbFlgIntegraCapCar(const Value: Boolean);
      procedure SetiCodPortForma(const Value: Integer);
      procedure SetbFlgUsaInvestimob(const Value: Boolean);
      procedure SetbFlgIntegraContab(const Value: Boolean);
      procedure SetbFlgLancRecInativo(const Value: Boolean);
      procedure SetbFlgLancRecEncerra(const Value: Boolean);
      procedure SetiMesBloqLancto(const Value: Integer);
      procedure SetiTipoReceitaAlug(const Value: Integer);
      procedure SetbFlgLancPagInativo(const Value: Boolean);
      procedure SetbFlgUsaAP(const Value: Boolean);
      procedure SetbFlgDiaUtilAP(const Value: boolean);
      procedure SetbFlgHistContDifAP(const Value: boolean);
      procedure SetbFlgMultiTipo(const Value: Boolean);
      procedure SetbFlgIntegraOrcamen(const Value: Boolean);
      procedure SetbFlgAviso(const Value: Boolean);
      procedure SetsTipoImovelPatro(const Value: String);
      procedure SetiGrupoRegra(const Value: Integer);
      procedure SetiQtdeMesPrevFolha(const Value: Integer);
      procedure SetiFlgPrevFolha(const Value: Integer);
      procedure SetiTipoOperAtualCM(const Value: Integer);
      procedure SetiTipoOperAtualJuros(const Value: Integer);
      procedure SetiTipoOperAtualMulta(const Value: Integer);
      procedure SetiTipoOperProvPerdas(const Value: Integer);
      procedure SetsCodCentroCusto(const Value: String);
      procedure SetiPrograma(const Value: Integer);
      procedure SetbFlgReembolsoAutomatico(const Value: Boolean);
      procedure SetbFlgLancForaComp(const Value: Boolean);
      procedure SetiTipoOperProvReceita(const Value: Integer);
      procedure SetbFlgLogoRelat(const Value: Boolean); // Marcio Motta - 25/06/2004
      procedure SetLogoTipo(const Value: TImage);
      procedure SetiIdCartaCobranca1(const Value: Integer);
      procedure SetiIdCartaCobranca2(const Value: Integer);
      procedure SetiIdCartaCobranca3(const Value: Integer);
      procedure SetiIdCartaCobranca4(const Value: Integer);
      procedure SetsFlgCalcInadimp(const Value: String);

      // Marchetti - Pendencia 18871
      procedure SetIdRegraMulta(const Value: Integer);

      // André Pontes - 16/08/2005 - pendência 19875
      procedure SetbFlgBloqRecAluguel(const Value: Boolean);
      procedure SetbAtualizaDataProgramada(const Value: Boolean);

      procedure SetFLGTIPODATAPROG(const Value: String);
      procedure SetiTipoOperAbonoCM(const Value: Integer);
      procedure SetiTipoOperAbonoJuros(const Value: Integer);
      procedure SetiTipoOperAbonoMulta(const Value: Integer);
      procedure SetbApenasUltMesAnterior(const Value: Boolean);
      procedure SetbFlgAlteraEvento(const Value: Boolean);
      procedure SetMascaraCompl(const Value: String);

      // Daniel - 21413
      procedure SetbFlgRegEvento(const Value: Boolean);

      // Daniel - 22688
      procedure SetbFlgBloqDtLanc(const Value: Boolean);

      // Daniel - 24085
      procedure SetbFlgUsaUnidade(const Value: Boolean);


// Felipe de Oliveira Sol 65636 - Inicio
    procedure SetsFlgValCod(const Value: String);
    procedure SetsFlgAutCod(const Value: String);
// Felipe de Oliveira Sol 65636 - Fim

   public

      constructor Create;
      destructor  Destroy; override;

      property iMesCompetencia    : Integer read FiMesCompetencia    write SetiMesCompetencia;
      property iAnoCompetencia    : Integer read FiAnoCompetencia    write SetiAnoCompetencia;
      property iUnidNegoc         : Integer read FiUnidNegoc         write SetiUnidNegoc;
      property iPrograma          : Integer read FiPrograma          write SetiPrograma;
      property iCodPortForma      : Integer read FiCodPortForma      write SetiCodPortForma;
      property iTipoReceitaAlug   : Integer read FiTipoReceitaAlug   write SetiTipoReceitaAlug;
      property iGrupoRegra        : Integer read FiGrupoRegra        write SetiGrupoRegra;
      property sCodCentroRespon   : String  read FsCodCentroRespon   write SetsCodCentroRespon;
      property sCodCentroCusto    : String  read FsCodCentroCusto    write SetsCodCentroCusto;
      property sTipoImovelPatro   : String  read FsTipoImovelPatro   write SetsTipoImovelPatro;
      property bFlgIntegraCapCar  : Boolean read FbFlgIntegraCapCar  write SetbFlgIntegraCapCar;
      property bFlgIntegraContab  : Boolean read FbFlgIntegraContab  write SetbFlgIntegraContab;
      property bFlgIntegraOrcamen : Boolean read FbFlgIntegraOrcamen write SetbFlgIntegraOrcamen;
      property bFlgUsaAP          : Boolean read FbFlgUsaAP          write SetbFlgUsaAP;
      property bFlgDiaUtilAP      : boolean read FbFlgDiaUtilAP      write SetbFlgDiaUtilAP;
      property bFlgHistContDifAP  : boolean read FbFlgHistContDifAP  write SetbFlgHistContDifAP;

      property bFlgReembolsoAutomatico : Boolean read FbFlgReembolsoAutomatico write SetbFlgReembolsoAutomatico;

      property iMesBloqLancto     : Integer read FiMesBloqLancto     write SetiMesBloqLancto;
      property iQtdeMesPrevFolha  : Integer read FiQtdeMesPrevFolha  write SetiQtdeMesPrevFolha;
      property iFlgPrevFolha      : Integer read FiFlgPrevFolha      write SetiFlgPrevFolha;
      property bFlgUsaInvestimob  : Boolean read FbFlgUsaInvestimob  write SetbFlgUsaInvestimob;
      property bFlgObrigaContrato : Boolean read FbFlgObrigaContrato write SetbFlgObrigaContrato;
      property bFlgLancPagEncerra : Boolean read FbFlgLancPagEncerra write SetbFlgLancPagEncerra;
      property bFlgLancRecEncerra : Boolean read FbFlgLancRecEncerra write SetbFlgLancRecEncerra;
      property bFlgLancRecInativo : Boolean read FbFlgLancRecInativo write SetbFlgLancRecInativo;

      // André Pontes - 16/08/2005 - pendência 19875
      property bFlgBloqRecAluguel : Boolean read FbFlgBloqRecAluguel write SetbFlgBloqRecAluguel;

      property bFlgLancPagInativo : Boolean read FbFlgLancPagInativo write SetbFlgLancPagInativo;
      property bFlgSugereContrato : Boolean read FbFlgSugereContrato write SetbFlgSugereContrato;
      property bFlgConcatenaAno   : Boolean read FbFlgConcatenaAno   write SetbFlgConcatenaAno;
      property bFlgMultiTipo      : Boolean read FbFlgMultiTipo      write SetbFlgMultiTipo;
      property bFlgLancForaComp   : Boolean read FbFlgLancForaComp   write SetbFlgLancForaComp;
      property bFlgLogoRelat      : Boolean read FbFlgLogoRelat      write SetbFlgLogoRelat; // Marcio Motta - 25/06/2004
      property LogoTipo           : TImage  read FLogoTipo           write SetLogoTipo; // Marcio Motta - 25/06/2004

      // Parâmetros de Operações diárias
      property bFlgDiario          : Boolean read FbFlgDiario          write SetbFlgDiario;
      property iTipoOperAtualMulta : Integer read FiTipoOperAtualMulta write SetiTipoOperAtualMulta;
      property iTipoOperAtualJuros : Integer read FiTipoOperAtualJuros write SetiTipoOperAtualJuros;
      property iTipoOperAtualCM    : Integer read FiTipoOperAtualCM    write SetiTipoOperAtualCM;
      property iTipoOperProvPerdas : Integer read FiTipoOperProvPerdas write SetiTipoOperProvPerdas;
      property iTipoOperProvReceita: Integer read FiTipoOperProvReceita write SetiTipoOperProvReceita;

      // parâmetros de filtros de contabilização
      property bFlgParTdCon  : Boolean read FbFlgParTdCon  write SetbFlgParTdCon;
      property bFlgParTdIm   : Boolean read FbFlgParTdIm   write SetbFlgParTdIm;
      property bFlgParTdTpIm : Boolean read FbFlgParTdTpIm write SetbFlgParTdTpIm;
      property bFlgParTpDes  : Boolean read FbFlgParTpDes  write SetbFlgParTpDes;
      property bFlgParCon    : Boolean read FbFlgParCon    write SetbFlgParCon;
      property bFlgParIm     : Boolean read FbFlgParIm     write SetbFlgParIm;
      property bFlgParTpIm   : Boolean read FbFlgParTpIm   write SetbFlgParTpIm;
      property bFlgAviso     : Boolean read FbFlgAviso     write SetbFlgAviso;

      // Parâmetros de Cobrança/Inadimplência
      property iIdCartaCobranca1 : Integer read FiIdCartaCobranca1 write SetiIdCartaCobranca1;
      property iIdCartaCobranca2 : Integer read FiIdCartaCobranca2 write SetiIdCartaCobranca2;
      property iIdCartaCobranca3 : Integer read FiIdCartaCobranca3 write SetiIdCartaCobranca3;
      property iIdCartaCobranca4 : Integer read FiIdCartaCobranca4 write SetiIdCartaCobranca4;
      property sFlgCalcInadimp   : String read FsFlgCalcInadimp write SetsFlgCalcInadimp;

      property IDRegraMulta      : Integer read FIDRegraMulta      write SetIDRegraMulta; // Marchetti - Pendencia 18871

      property bAtualizaDataProgramada : Boolean read FbAtualizaDataProgramada write SetbAtualizaDataProgramada;
      property bApenasUltMesAnterior   : Boolean read FbApenasUltMesAnterior   write SetbApenasUltMesAnterior;

      property FLGTIPODATAPROG : String read FFLGTIPODATAPROG write SetFLGTIPODATAPROG;

      property iTipoOperAbonoMulta : Integer read FiTipoOperAbonoMulta write SetiTipoOperAbonoMulta;
      property iTipoOperAbonoJuros : Integer read FiTipoOperAbonoJuros write SetiTipoOperAbonoJuros;
      property iTipoOperAbonoCM    : Integer read FiTipoOperAbonoCM write SetiTipoOperAbonoCM;

      // Daniel - 23516
      property MascaraCompl : String read FMascaraCompl write SetMascaraCompl;

      // Daniel - 21967
      property bFlgAlteraEvento : Boolean read FbFlgAlteraEvento write SetbFlgAlteraEvento;

      // Daniel - 21413
      property bFlgRegEvento : Boolean read FbFlgRegEvento write SetbFlgRegEvento;

      // Daniel - 22688
      property bFlgBloqDtLanc : Boolean read FbFlgBloqDtLanc write SetbFlgBloqDtLanc;

      // Daniel - 24085
      property bFlgUsaUnidade : Boolean read FbFlgUsaUnidade write SetbFlgUsaUnidade;


// Felipe de Oliveira Sol 65636 - Inicio
    property    sFlgValCod    : String read FsFlgValCod write SetsFlgValCod;
    property    sFlgAutCod    : String read FsFlgAutCod write SetsFlgAutCod;
// Felipe de Oliveira Sol 65636 - Fim      

      procedure GetParam(const iIdPessoa: Integer);

   end;

// ---- CLASSE INVESTIMOB ------------------------------------------------------

  TInvestImob = Class(TCmControlObject)
  protected
    procedure AfterInitialize; override;

  private
    CtrlParamInvestimob: TCtrlParamInvestimob;
    CtrlParamCAF       : TCtrlParamCAF;

    FiUnidNegoc: Integer;
    FsCodCentroRespon: String;
    FsCodTipImovelObra: String;
    FbFlgIntegraContab: Boolean;
    FbFlgIntegraCapCar: boolean;
    FbFlgIntCafCont: boolean;
    FbFlgDeprecDiaria: boolean;
    FbFlgIntegraAtivo: boolean;
    FiCodPortForma: Integer;
    FsCodCentroCusto: String;
    FiIdDespAquisicao: Integer;
    FiIdRecAlienacao: Integer;
    FiIdSituacao: Integer;
    FiIdLocalizacao: Integer;
    FiIdPessoaLocalizacao: Integer;
    FiIdClasseBem: Integer;
    FiIdPrograma: Integer;
    FbFlgReavBaixaBem: Boolean;
    FbFlgReavCriaBem: Boolean;
    FbUsaCAF: boolean;
    FbFlgLogoRelat: Boolean; // Marcio Motta - 25/06/2004
    FLogoTipo: TImage;
    FiIdMoedaCAF: Integer;
    FiIdPaisCAF: Integer;
    FiFlgTipoNumeracao: Integer;
    FsFlgPrefixoNumEdi: String;
    FsFlgPrefixoNumIns: String;
    FsFlgPrefixoNumTer: String; // Marcio Motta - 25/06/2004

// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgValCod : String;
    FsFlgAutCod : String;
// Felipe de Oliveira Sol 65636 - Fim

    procedure SetiUnidNegoc(const Value: Integer);
    procedure SetsCodCentroRespon(const Value: String);
    procedure SetsCodTipImovelObra(const Value: String);
    procedure SetbFlgIntegraContab(const Value: Boolean);
    procedure SetbFlgDeprecDiaria(const Value: boolean);
    procedure SetbFlgIntCafCont(const Value: boolean);
    procedure SetbFlgIntegraAtivo(const Value: boolean);
    procedure SetbFlgIntegraCapCar(const Value: boolean);
    procedure SetiCodPortForma(const Value: Integer);
    procedure SetsCodCentroCusto(const Value: String);
    procedure SetiIdDespAquisicao(const Value: Integer);
    procedure SetiIdRecAlienacao(const Value: Integer);
    procedure SetiIdSituacao(const Value: Integer);
    procedure SetiIdLocalizacao(const Value: Integer);
    procedure SetiIdPessoaLocalizacao(const Value: Integer);
    procedure SetiIdClasseBem(const Value: Integer);
    procedure SetiIdPrograma(const Value: Integer);
    procedure SetbFlgReavBaixaBem(const Value: Boolean);
    procedure SetbFlgReavCriaBem(const Value: Boolean);
    procedure SetbUsaCAF(const Value: boolean);
    procedure SetbFlgLogoRelat(const Value: Boolean);
    procedure SetLogoTipo(const Value: TImage);
    procedure SetiIdMoedaCAF(const Value: Integer);
    procedure SetiIdPaisCAF(const Value: Integer);
    procedure SetiFlgTipoNumeracao(const Value: Integer);
    procedure SetsFlgPrefixoNumEdi(const Value: String);
    procedure SetsFlgPrefixoNumIns(const Value: String);
    procedure SetsFlgPrefixoNumTer(const Value: String);

// Felipe de Oliveira Sol 65636 - Inicio
    procedure SetsFlgValCod(const Value: String);
    procedure SetsFlgAutCod(const Value: String);
// Felipe de Oliveira Sol 65636 - Fim

  public
    constructor Create;
    destructor  Destroy; override;

    property    bFlgIntegraAtivo     : boolean read FbFlgIntegraAtivo     write SetbFlgIntegraAtivo;
    property    bFlgIntegraContab    : boolean read FbFlgIntegraContab    write SetbFlgIntegraContab;
    property    bFlgIntegraCapCar    : boolean read FbFlgIntegraCapCar    write SetbFlgIntegraCapCar;
    property    bFlgIntCafCont       : boolean read FbFlgIntCafCont       write SetbFlgIntCafCont;
    property    bFlgDeprecDiaria     : boolean read FbFlgDeprecDiaria     write SetbFlgDeprecDiaria;
    property    bUsaCAF              : boolean read FbUsaCAF              write SetbUsaCAF;

    property    iUnidNegoc           : Integer read FiUnidNegoc           write SetiUnidNegoc;
    property    iCodPortForma        : Integer read FiCodPortForma        write SetiCodPortForma;
    property    sCodCentroRespon     : String  read FsCodCentroRespon     write SetsCodCentroRespon;
    property    sCodCentroCusto      : String  read FsCodCentroCusto      write SetsCodCentroCusto;
    property    iIdSituacao          : Integer read FiIdSituacao          write SetiIdSituacao;
    property    iIdPrograma          : Integer read FiIdPrograma          write SetiIdPrograma;
    property    iIdPessoaLocalizacao : Integer read FiIdPessoaLocalizacao write SetiIdPessoaLocalizacao;
    property    iIdLocalizacao       : Integer read FiIdLocalizacao       write SetiIdLocalizacao;
    property    iIdClasseBem         : Integer read FiIdClasseBem         write SetiIdClasseBem;

    property    sCodTipImovelObra    : String  read FsCodTipImovelObra    write SetsCodTipImovelObra;
    property    iIdRecAlienacao      : Integer read FiIdRecAlienacao      write SetiIdRecAlienacao;
    property    iIdDespAquisicao     : Integer read FiIdDespAquisicao     write SetiIdDespAquisicao;

    Property    bFlgReavCriaBem      : Boolean read FbFlgReavCriaBem      write SetbFlgReavCriaBem;
    Property    bFlgReavBaixaBem     : Boolean read FbFlgReavBaixaBem     write SetbFlgReavBaixaBem;
    property    bFlgLogoRelat        : Boolean read FbFlgLogoRelat        write SetbFlgLogoRelat; // Marcio Motta - 28/06/2004
    property    LogoTipo             : TImage  read FLogoTipo             write SetLogoTipo; // Marcio Motta - 28/06/2004

    property    iIdMoedaCAF          : Integer read FiIdMoedaCAF write SetiIdMoedaCAF;
    property    iIdPaisCAF           : Integer read FiIdPaisCAF write SetiIdPaisCAF;

    // Marchetti - Pendencia 19884
    property    iFlgTipoNumeracao    : Integer read FiFlgTipoNumeracao write SetiFlgTipoNumeracao;
    property    sFlgPrefixoNumTer    : String read FsFlgPrefixoNumTer write SetsFlgPrefixoNumTer;
    property    sFlgPrefixoNumEdi    : String read FsFlgPrefixoNumEdi write SetsFlgPrefixoNumEdi;
    property    sFlgPrefixoNumIns    : String read FsFlgPrefixoNumIns write SetsFlgPrefixoNumIns;
    // Fim Marchetti - Pendencia 19884

// Felipe de Oliveira Sol 65636 - Inicio
    property    sFlgValCod    : String read FsFlgValCod write SetsFlgValCod;
    property    sFlgAutCod    : String read FsFlgAutCod write SetsFlgAutCod;
// Felipe de Oliveira Sol 65636 - Fim

    procedure GetParam(const iIdPessoa: Integer);
  end;


// ---- CLASSE ALIENACAO ------------------------------------------------------

  TAlienacao = Class(TCmControlObject)
  protected
    procedure AfterInitialize; override;

  private
    CtrlParamAlienacao: TCtrlParamAlienacao;
    FbFlgParTpIm: Boolean;
    FbFlgParTdTpIm: Boolean;
    FiUnidNegoc: Integer;
    FsCodCentroRespon: String;
    FbNumeraProposta: Boolean;
    FiTipoRecAVista: Integer;
    FiTipoRecAmortiz: Integer;
    FiTipoRecCorrecao: Integer;
    FiTipoRecAmortExtra: Integer;
    FiTipoRecSinal: Integer;
    FiTipoRecJuros: Integer;
    FiTipoRecProjecao: Integer;
    FiTipoRecPerdas: Integer;
    FbFlgDiario: Boolean;
    FbFlgParTpDes: Boolean;
    FbFlgParCon: Boolean;
    FbFlgParTdIm: Boolean;
    FbFlgParIm: Boolean;
    FbFlgParTdCon: Boolean;
    FbFlgIntegraAtivo: Boolean;
    FbFlgIntegraContab: Boolean;
    FbFlgIntegraCapCar: Boolean;
    FiAnoCompetencia: Integer;
    FiMesCompetencia: Integer;
    FiPrograma: Integer;
    FsCentroCusto: String;
    FbFlgLogoRelat: Boolean;
    FLogoTipo: TImage;
    FiTipoOperAtualMulta: Integer;
    FiTipoOperAtualJuros: Integer;
    FiTipoOperAtualCM: Integer;
    FiTipoOperProvPerdas: Integer;


    // Marchetti - Pendencia 18872
    FIDRegraMulta : Integer;
    FbFlgCMJurDiario: Boolean;
    FbAtualizaDataProgramada: Boolean;
    FFLGTIPODATAPROG: String;
    FiTipoOperAtualRes: Integer;
    FiTipoOperAbonoJuros: Integer;
    FiTipoOperAbonoMulta: Integer;
    FiTipoOperAbonoCM: Integer;
    FiTipoOperAtualMultaAC: Integer;
    FiTipoOperAtualCMAC: Integer;
    FiTipoOperAtualJurosAC: Integer;
    FiTipoOperProvPerdasAC: Integer;
    FiTipoRecCorrecaoAC: Integer;
    FiTipoRecJurosAC: Integer;

    FbApenasUltMesAnterior: Boolean;
    FiTipoRecAmortAC: Integer;
    FiCodAlteradorCPMF: Integer;
    FiCodAlteradorAdRes: Integer;
    FiIDOperAbonoResN: Integer;
    FiIDOperAbonoResA: Integer;

// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgValCod : String;
    FsFlgAutCod : String;
// Felipe de Oliveira Sol 65636 - Fim    

    procedure SetbFlgParTdTpIm(const Value: Boolean);
    procedure SetbFlgParTpIm(const Value: Boolean);
    procedure SetiUnidNegoc(const Value: Integer);
    procedure SetsCodCentroRespon(const Value: String);
    procedure SetbNumeraProposta(const Value: Boolean);
    procedure SetiTipoRecAmortExtra(const Value: Integer);
    procedure SetiTipoRecAmortiz(const Value: Integer);
    procedure SetiTipoRecAVista(const Value: Integer);
    procedure SetiTipoRecCorrecao(const Value: Integer);
    procedure SetiTipoRecJuros(const Value: Integer);
    procedure SetiTipoRecProjecao(const Value: Integer);
    procedure SetiTipoRecSinal(const Value: Integer);
    procedure SetiTipoRecPerdas(const Value: Integer);
    procedure SetbFlgDiario(const Value: Boolean);
    procedure SetbFlgParCon(const Value: Boolean);
    procedure SetbFlgParIm(const Value: Boolean);
    procedure SetbFlgParTdCon(const Value: Boolean);
    procedure SetbFlgParTdIm(const Value: Boolean);
    procedure SetbFlgParTpDes(const Value: Boolean);
    procedure SetbFlgIntegraAtivo(const Value: Boolean);
    procedure SetbFlgIntegraCapCar(const Value: Boolean);
    procedure SetbFlgIntegraContab(const Value: Boolean);
    procedure SetiAnoCompetencia(const Value: Integer);
    procedure SetiMesCompetencia(const Value: Integer);
    procedure SetiPrograma(const Value: Integer);
    procedure SetsCentroCusto(const Value: String);
    procedure SetbFlgLogoRelat(const Value: Boolean);
    procedure SetLogoTipo(const Value: TImage);
    procedure SetiTipoOperAtualCM(const Value: Integer);
    procedure SetiTipoOperAtualJuros(const Value: Integer);
    procedure SetiTipoOperAtualMulta(const Value: Integer);
    procedure SetiTipoOperProvPerdas(const Value: Integer);

    // Marchetti - Pendencia 18872
    procedure SetIDRegraMulta(const Value : Integer);
    procedure SetbFlgCMJurDiario(const Value: Boolean);
    procedure SetbAtualizaDataProgramada(const Value: Boolean);
    procedure SetFLGTIPODATAPROG(const Value: String);
    procedure SetiTipoOperAtualRes(const Value: Integer);
    procedure SetiTipoOperAbonoCM(const Value: Integer);
    procedure SetiTipoOperAbonoJuros(const Value: Integer);
    procedure SetiTipoOperAbonoMulta(const Value: Integer);

    procedure SetiTipoOperAtualCMAC(const Value: Integer);
    procedure SetiTipoOperAtualJurosAC(const Value: Integer);
    procedure SetiTipoOperAtualMultaAC(const Value: Integer);
    procedure SetiTipoOperProvPerdasAC(const Value: Integer);
    procedure SetiTipoRecCorrecaoAC(const Value: Integer);
    procedure SetiTipoRecJurosAC(const Value: Integer);
    procedure SetbApenasUltMesAnterior(const Value: Boolean);
    procedure SetiTipoRecAmortAC(const Value: Integer);
    procedure SetiCodAlteradorAdRes(const Value: Integer);
    procedure SetiCodAlteradorCPMF(const Value: Integer);
    procedure SetiIDOperAbonoResA(const Value: Integer);
    procedure SetiIDOperAbonoResN(const Value: Integer);

// Felipe de Oliveira Sol 65636 - Inicio
    procedure SetsFlgValCod(const Value: String);
    procedure SetsFlgAutCod(const Value: String);
// Felipe de Oliveira Sol 65636 - Fim    

  public
    constructor Create;
    destructor  Destroy; override;

    property iUnidNegoc         : Integer read FiUnidNegoc         write SetiUnidNegoc;
    property sCodCentroRespon   : String  read FsCodCentroRespon   write SetsCodCentroRespon;
    property sCentroCusto       : String read FsCentroCusto write SetsCentroCusto;
    property iPrograma          : Integer read FiPrograma write SetiPrograma;
    property bNumeraProposta    : Boolean read FbNumeraProposta    write SetbNumeraProposta;
    property bFlgDiario         : Boolean read FbFlgDiario         write SetbFlgDiario;
    property bFlgIntegraAtivo   : Boolean read FbFlgIntegraAtivo   write SetbFlgIntegraAtivo;
    property bFlgIntegraContab  : Boolean read FbFlgIntegraContab  write SetbFlgIntegraContab;
    property bFlgIntegraCapCar  : Boolean read FbFlgIntegraCapCar  write SetbFlgIntegraCapCar;
    property iTipoRecAmortiz    : Integer read FiTipoRecAmortiz    write SetiTipoRecAmortiz;
    property iTipoRecJuros      : Integer read FiTipoRecJuros      write SetiTipoRecJuros;
    property iTipoRecCorrecao   : Integer read FiTipoRecCorrecao   write SetiTipoRecCorrecao;
    property iTipoRecSinal      : Integer read FiTipoRecSinal      write SetiTipoRecSinal;
    property iTipoRecAVista     : Integer read FiTipoRecAVista     write SetiTipoRecAVista;
    property iTipoRecProjecao   : Integer read FiTipoRecProjecao   write SetiTipoRecProjecao;
    property iTipoRecAmortExtra : Integer read FiTipoRecAmortExtra write SetiTipoRecAmortExtra;
    property iTipoRecPerdas     : Integer read FiTipoRecPerdas     write SetiTipoRecPerdas;
    property iMesCompetencia    : Integer read FiMesCompetencia    write SetiMesCompetencia;
    property iAnoCompetencia    : Integer read FiAnoCompetencia    write SetiAnoCompetencia;
    property bFlgLogoRelat      : Boolean read FbFlgLogoRelat      write SetbFlgLogoRelat; // Marcio Motta - 28/06/2004
    property LogoTipo           : TImage  read FLogoTipo           write SetLogoTipo; // Marcio Motta - 28/06/2004

    // parâmetros de filtros de contabilização
    property bFlgParTdCon  : Boolean read FbFlgParTdCon  write SetbFlgParTdCon;
    property bFlgParTdIm   : Boolean read FbFlgParTdIm   write SetbFlgParTdIm;
    property bFlgParTdTpIm : Boolean read FbFlgParTdTpIm write SetbFlgParTdTpIm;
    property bFlgParTpDes  : Boolean read FbFlgParTpDes  write SetbFlgParTpDes;
    property bFlgParCon    : Boolean read FbFlgParCon    write SetbFlgParCon;
    property bFlgParIm     : Boolean read FbFlgParIm     write SetbFlgParIm;
    property bFlgParTpIm   : Boolean read FbFlgParTpIm   write SetbFlgParTpIm;

    // Parâmetros para a contabilização diária
    property iTipoOperAtualMulta : Integer read FiTipoOperAtualMulta write SetiTipoOperAtualMulta;
    property iTipoOperAtualJuros : Integer read FiTipoOperAtualJuros write SetiTipoOperAtualJuros;
    property iTipoOperAtualCM    : Integer read FiTipoOperAtualCM write SetiTipoOperAtualCM;
    property iTipoOperProvPerdas : Integer read FiTipoOperProvPerdas write SetiTipoOperProvPerdas;
    property iTipoOperAtualRes   : Integer read FiTipoOperAtualRes write SetiTipoOperAtualRes;

    property bFlgCMJurDiario     : Boolean read FbFlgCMJurDiario write SetbFlgCMJurDiario;

    property IDRegraMulta        : Integer read FIDRegraMulta   write SetIDRegraMulta;

    property bAtualizaDataProgramada : Boolean read FbAtualizaDataProgramada write SetbAtualizaDataProgramada;

    property FLGTIPODATAPROG : String read FFLGTIPODATAPROG write SetFLGTIPODATAPROG;

    property iTipoOperAbonoMulta : Integer read FiTipoOperAbonoMulta write SetiTipoOperAbonoMulta;
    property iTipoOperAbonoJuros : Integer read FiTipoOperAbonoJuros write SetiTipoOperAbonoJuros;
    property iTipoOperAbonoCM    : Integer read FiTipoOperAbonoCM write SetiTipoOperAbonoCM;

    property iTipoOperAtualMultaAC : Integer read FiTipoOperAtualMultaAC write SetiTipoOperAtualMultaAC;
    property iTipoOperAtualJurosAC : Integer read FiTipoOperAtualJurosAC write SetiTipoOperAtualJurosAC;
    property iTipoOperAtualCMAC    : Integer read FiTipoOperAtualCMAC write SetiTipoOperAtualCMAC;
    property iTipoOperProvPerdasAC : Integer read FiTipoOperProvPerdasAC write SetiTipoOperProvPerdasAC;
    property iTipoRecJurosAC       : Integer read FiTipoRecJurosAC write SetiTipoRecJurosAC;
    property iTipoRecCorrecaoAC    : Integer read FiTipoRecCorrecaoAC write SetiTipoRecCorrecaoAC;

    property iTipoRecAmortAC       : Integer read FiTipoRecAmortAC write SetiTipoRecAmortAC;

    property bApenasUltMesAnterior : Boolean read FbApenasUltMesAnterior write SetbApenasUltMesAnterior;


    property iCodAlteradorCPMF     : Integer read FiCodAlteradorCPMF write SetiCodAlteradorCPMF;
    property iCodAlteradorAdRes    : Integer read FiCodAlteradorAdRes write SetiCodAlteradorAdRes;
    property iIDOperAbonoResN      : Integer read FiIDOperAbonoResN write SetiIDOperAbonoResN;
    property iIDOperAbonoResA      : Integer read FiIDOperAbonoResA write SetiIDOperAbonoResA;

// Felipe de Oliveira Sol 65636 - Inicio
    property    sFlgValCod    : String read FsFlgValCod write SetsFlgValCod;
    property    sFlgAutCod    : String read FsFlgAutCod write SetsFlgAutCod;
// Felipe de Oliveira Sol 65636 - Fim

    procedure GetParam(const iIdPessoa: Integer);
  end;


// ---- CLASSE GLOBAL ----------------------------------------------------------

  TGlobal = Class(TCmControlObject)
  protected
    procedure AfterInitialize; override;

  private
    CtrlParamGlobal: TCtrlParamGlobal;
    FsPatro: String;
    FsPlanoPrev: String;
    FiMoedaCorrente: Integer;
    FsMoedaCorrente: String;
    procedure SetsPatro(const Value: String);
    procedure SetsPlanoPrev(const Value: String);
    procedure SetiMoedaCorrente(const Value: Integer);
    procedure SetsMoedaCorrente(const Value: String);
  public
    constructor Create;
    destructor  Destroy; override;

    property sPatro         : String  read FsPatro         write SetsPatro;
    property sPlanoPrev     : String  read FsPlanoPrev     write SetsPlanoPrev;
    property iMoedaCorrente : Integer read FiMoedaCorrente write SetiMoedaCorrente;
    property sMoedaCorrente : String  read FsMoedaCorrente write SetsMoedaCorrente;

    procedure GetParam(const iIdPessoa: Integer);
  end;


  TCtrlModuloImobiliario = Class(TCmControlObject)
  protected
    procedure AfterInitialize; override;

  private
    FAdminImob: TAdminImob;
    FGlobal: TGlobal;
    FInvestImob: TInvestImob;
    FAlienacao: TAlienacao;
    procedure SetAdminImob(const Value: TAdminImob);
    procedure SetGlobal(const Value: TGlobal);
    procedure SetInvestImob(const Value: TInvestImob);
    procedure SetAlienacao(const Value: TAlienacao);
  public
    constructor Create;
    destructor  Destroy; override;
    property AdminImob:  TAdminImob  read FAdminImob  write SetAdminImob;
    property InvestImob: TInvestImob read FInvestImob write SetInvestImob;
    property Alienacao:  TAlienacao  read FAlienacao  write SetAlienacao;
    property Global:     TGlobal     read FGlobal     write SetGlobal;
  end;


implementation

//==============================================================================
{ TModuloImobiliario }

procedure TCtrlModuloImobiliario.AfterInitialize;
begin
  inherited;
  FAdminImob.InitializeAs( Self );
  FAlienacao.InitializeAs( Self );
  FInvestImob.InitializeAs( Self );
  FGlobal.InitializeAs( Self );
end;

constructor TCtrlModuloImobiliario.Create;
begin
  inherited;
  FAdminImob  := TAdminImob.Create;
  FAlienacao  := TAlienacao.Create;
  FInvestImob := TInvestImob.Create;
  FGlobal     := TGlobal.Create;
end;

destructor TCtrlModuloImobiliario.Destroy;
begin
  FreeAndNil( FAdminImob );
  FreeAndNil( FAlienacao );
  FreeAndNil( FInvestImob );
  FreeAndNil( FGlobal );
  inherited;
end;

procedure TCtrlModuloImobiliario.SetAdminImob(const Value: TAdminImob);
begin
  FAdminImob := Value;
end;

procedure TCtrlModuloImobiliario.SetAlienacao(const Value: TAlienacao);
begin
  FAlienacao := Value;
end;

procedure TCtrlModuloImobiliario.SetGlobal(const Value: TGlobal);
begin
  FGlobal := Value;
end;

procedure TCtrlModuloImobiliario.SetInvestImob(const Value: TInvestImob);
begin
  FInvestImob := Value;
end;

//==============================================================================
{ TAdminImob }

constructor TAdminImob.Create;
begin
  inherited;
  CtrlParamImovel := TCtrlParamImovel.Create;
  FLogoTipo := TImage.Create(nil); // Marcio Motta - 25/06/2004
end;

procedure TAdminImob.AfterInitialize;
begin
  inherited;
  CtrlParamImovel.InitializeAs( Self );
end;

destructor TAdminImob.Destroy;
begin
  CtrlParamImovel.Free;
  FreeAndNil(FLogoTipo); // Marcio Motta - 25/06/2004
  inherited;
end;

procedure TAdminImob.GetParam(const iIdPessoa: Integer);
var
   Cds: TCMClientDataSet;
begin
   // Inicializa Variaveis
   FiAnoCompetencia     := -1;
   FiMesCompetencia     := -1;
   FiUnidNegoc          := -1;
   FiPrograma           := -1;
   FiCodPortForma       := -1;
   FiTipoReceitaAlug    := -1;
   FiGrupoRegra         := -1;
   FiMesBloqLancto      := -1;
   FiTipoOperAtualMulta := -1;
   FiTipoOperAtualJuros := -1;
   FiTipoOperAtualCM    := -1;
   FiTipoOperProvPerdas := -1;
   FiTipoOperProvReceita:= -1;
   FiIdCartaCobranca1   := -1;
   FiIdCartaCobranca2   := -1;
   FiIdCartaCobranca3   := -1;
   FiIdCartaCobranca4   := -1;

   FIDRegraMulta        := -1;

   FiQtdeMesPrevFolha   := 0;
   FiFlgPrevFolha       := 0;
   FsCodCentroRespon    := '';
   FsCodCentroCusto     := '';
   FsTipoImovelPatro    := '';

   MascaraCompl         := ''; // Daniel - 23516

   FbFlgIntegraCapCar   := False;
   FbFlgIntegraContab   := False;
   FbFlgIntegraOrcamen  := False;
   FbFlgDiario          := False;
   FbFlgUsaAP           := False;
   FbFlgDiaUtilAP       := False;
   FbFlgHistContDifAP   := False;
   FbFlgUsaInvestimob   := False;
   FbFlgLogoRelat       := False; // Marcio Motta - 25/06/2004
   FbFlgObrigaContrato  := False;
   FbFlgLancPagEncerra  := False;
   FbFlgLancRecEncerra  := False;
   FbFlgLancRecInativo  := False;
   FbFlgLancPagInativo  := False;

   // André Pontes - 16/08/2005 - pendência 19875
   FbFlgBloqRecAluguel  := False;

   FbFlgAlteraEvento    := False; // Daniel - 21967

   FbFlgRegEvento       := False; // Daniel - 21413

   FbFlgBloqDtLanc      := False; // Daniel - 22688

   FbFlgUsaUnidade      := False; // Daniel - 24085

   FbFlgLancForaComp    := False;
   FbFlgSugereContrato  := False;
   FbFlgConcatenaAno    := False;
   FbFlgMultiTipo       := False;
   FbFlgParCon          := False;
   FbFlgParIm           := False;
   FbFlgParTdCon        := False;
   FbFlgParTdIm         := False;
   FbFlgParTdTpIm       := False;
   FbFlgParTpDes        := False;
   FbFlgParTpIm         := False;
   FbFlgAviso           := False;
   FbFlgReembolsoAutomatico := False;

   FbAtualizaDataProgramada := False;
   bApenasUltMesAnterior    := True;

   FsFlgCalcInadimp     := '';


// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgValCod := '';
    FsFlgAutCod := '';
// Felipe de Oliveira Sol 65636 - Fim

   // Carrega Parâmetros da Tabela
   Cds := nil;
   try
      Cds := TCMClientDataSet.Create(nil);
      Cds.Data := CtrlParamImovel.SelecionaParamImovel(iIdPessoa);
      fiAnoCompetencia    := Cds.FieldByName('ANOCOMPETENCIA').AsInteger;
      fiMesCompetencia    := Cds.FieldByName('MESCOMPETENCIA').AsInteger;
      FsCodCentroRespon   := Cds.FieldByName('CODCENTRORESPON').AsString;
      FsCodCentroCusto    := Cds.FieldByName('CODCENTROCUSTO').AsString;
      FsTipoImovelPatro   := Cds.FieldByName('TIPOIMOVELPATRO').AsString;
      FiMesBloqLancto     := Cds.FieldByName('MESBLOQLANCTO').AsInteger;
      FiFlgPrevFolha      := Cds.FieldByName('FLGPREVFOLHA').AsInteger;
      FiQtdeMesPrevFolha  := Cds.FieldByName('QTDEMESPREVFOLHA').AsInteger;
      FsFlgCalcInadimp    := Cds.FieldByName('FLGCALCINADIMP').AsString;

      // Carrega Ids
      if not Cds.FieldByName('IDOPERATUALMULTA').IsNull then
        FiTipoOperAtualMulta := Cds.FieldByName('IDOPERATUALMULTA').AsInteger;
      if not Cds.FieldByName('IDOPERATUALJUROS').IsNull then
        FiTipoOperAtualJuros := Cds.FieldByName('IDOPERATUALJUROS').AsInteger;
      if not Cds.FieldByName('IDOPERATUALCM').IsNull then
        FiTipoOperAtualCM    := Cds.FieldByName('IDOPERATUALCM').AsInteger;

      if not Cds.FieldByName('IDOPERABONOMULTA').IsNull then
        FiTipoOperAbonoMulta := Cds.FieldByName('IDOPERABONOMULTA').AsInteger;
      if not Cds.FieldByName('IDOPERABONOJUROS').IsNull then
        FiTipoOperAbonoJuros := Cds.FieldByName('IDOPERABONOJUROS').AsInteger;
      if not Cds.FieldByName('IDOPERABONOCM').IsNull then
        FiTipoOperAbonoCM    := Cds.FieldByName('IDOPERABONOCM').AsInteger;

      if not Cds.FieldByName('IDOPERPROVPER').IsNull then
        FiTipoOperProvPerdas := Cds.FieldByName('IDOPERPROVPER').AsInteger;
      if not Cds.FieldByName('IDOPERPROVREC').IsNull then
        FiTipoOperProvReceita:= Cds.FieldByName('IDOPERPROVREC').AsInteger;
      if not Cds.FieldByName('IDGRUPOREGRA').IsNull then
        FiGrupoRegra       := Cds.FieldByName('IDGRUPOREGRA').AsInteger;
      if not Cds.FieldByName('IDTCUSTORECIMOALU').IsNull then
        FiTipoReceitaAlug  := Cds.FieldByName('IDTCUSTORECIMOALU').AsInteger;
      if not Cds.FieldByName('UNIDNEGOC').IsNull then
        FiUnidNegoc        := Cds.FieldByName('UNIDNEGOC').AsInteger;
      if not Cds.FieldByName('IDPROGRAMA').IsNull then
        FiPrograma         := Cds.FieldByName('IDPROGRAMA').AsInteger;
      if not Cds.FieldByName('CODPORTFORMA').IsNull then
        FiCodPortForma     := Cds.FieldByName('CODPORTFORMA').AsInteger;

// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgAutCod := Cds.FieldByName('FLGAUTCOD').AsString;
    FsFlgValCod := Cds.FieldByName('FLGVALCOD').AsString;
// Felipe de Oliveira Sol 65636 - Fim        


      // Carrega valores boolean
      if Cds.FieldByName('FLGINTEGRACAPCAR').AsInteger  = 1   then FbFlgIntegraCapCar  := True;
      if Cds.FieldByName('FLGINTEGRACONTAB').AsInteger  = 1   then FbFlgIntegraContab  := True;
      if Cds.FieldByName('FLGINTEGRAORCAMEN').AsInteger = 1   then FbFlgIntegraOrcamen := True;
      if Cds.FieldByName('FLGDIARIO').AsString          = 'S' then FbFlgDiario         := True;
      if Cds.FieldByName('FLGUSAAP').AsInteger          = 1   then FbFlgUsaAP          := True;
      if Cds.FieldByName('FLGDIAUTILAP').AsString       = 'S' then FbFlgDiaUtilAP      := True;
      if Cds.FieldByName('FLGHISTCONTDIFAP').AsInteger  = 1   then FbFlgHistContDifAP  := True;
      if Cds.FieldByName('FLGUSAINVESTIMOB').AsString   = 'S' then FbFlgUsaInvestimob  := True;
      if Cds.FieldByName('FLGOBRIGACONTRATO').AsString  = '1' then FbFlgObrigaContrato := True;
      if Cds.FieldByName('FLGLANCPAGENCERRA').AsInteger = 1   then FbFlgLancPagEncerra := True;
      if Cds.FieldByName('FLGLANCRECENCERRA').AsInteger = 1   then FbFlgLancRecEncerra := True;
      if Cds.FieldByName('FLGLANCRECINATIVO').AsInteger = 1   then FbFlgLancRecInativo := True;
      if Cds.FieldByName('FLGLANCPAGINATIVO').AsString  = 'S' then FbFlgLancPagInativo := True;

      if Cds.FieldByName('FLGATUALDATAPROG').AsInteger  = 1   then FbAtualizaDataProgramada := True;

      if Cds.FieldByName('FLGBLOQRECALUGUEL').AsInteger = 1   then FbFlgBloqRecAluguel := True;

      if Cds.FieldByName('FLGSUGERECONTRATO').AsString  = '1' then FbFlgSugereContrato := True;
      if Cds.FieldByName('FLGCONCATENAANO').AsString    = '1' then FbFlgConcatenaAno   := True;
      if Cds.FieldByName('FLGMULTITIPO').AsInteger      = 1   then FbFlgMultiTipo      := True;
      if Cds.FieldByName('FLGLANCFORACOMP').AsString    = 'S' then FbFlgLancForaComp   := True;
      if Cds.FieldByName('FLGREEMBOLSOAUT').AsInteger   = 1   then FbFlgReembolsoAutomatico := True;
      if Cds.FieldByName('FLGLOGORELAT').AsString       = 'S' then FbFlgLogoRelat      := True;

      // Parâmetros do Filtro Contábil
      if Cds.FieldByName('FLGPARCON').AsInteger = 1    then FbFlgParCon    := True;
      if Cds.FieldByName('FLGPARIM').AsInteger = 1     then FbFlgParIm     := True;
      if Cds.FieldByName('FLGPARTDCON').AsInteger = 1  then FbFlgParTdCon  := True;
      if Cds.FieldByName('FLGPARTDIM').AsInteger = 1   then FbFlgParTdIm   := True;
      if Cds.FieldByName('FLGPARTDTPIM').AsInteger = 1 then FbFlgParTdTpIm := True;
      if Cds.FieldByName('FLGPARTPDES').AsInteger = 1  then FbFlgParTpDes  := True;
      if Cds.FieldByName('FLGPARTPIM').AsInteger = 1   then FbFlgParTpIm   := True;
      if Cds.FieldByName('FLGAVISO').AsString = 'S'    then FbFlgAviso     := True;

      // Daniel - 23516
      if not Cds.FieldByName('MASCARACOMPL').IsNull then
        FMascaraCompl := Cds.FieldByName('MASCARACOMPL').AsString;

      // Daniel - 21967
      if Cds.FieldByName('FLGALTERAEVENTO').AsInteger = 1 then
        FbFlgAlteraEvento := True;

      // Daniel - 21413
      if Cds.FieldByName('FLGREGEVENTO').AsInteger = 1 then
        FbFlgRegEvento := True;

      // Daniel - 22688
      if Cds.FieldByName('FLGBLOQDTLANC').AsInteger = 1 then
        FbFlgBloqDtLanc := True;

      // Daniel - 24085
      if Cds.FieldByName('FLGUSAUNIDADE').AsInteger = 1 then
        FbFlgUsaUnidade := True;

      // Parâmetros de Carta de Cobrança
      if not Cds.FieldByName('IDCARTACOBRANCA1').IsNull then
        FiIdCartaCobranca1 := Cds.FieldByName('IDCARTACOBRANCA1').AsInteger;
      if not Cds.FieldByName('IDCARTACOBRANCA2').IsNull then
        FiIdCartaCobranca2 := Cds.FieldByName('IDCARTACOBRANCA2').AsInteger;
      if not Cds.FieldByName('IDCARTACOBRANCA3').IsNull then
        FiIdCartaCobranca3 := Cds.FieldByName('IDCARTACOBRANCA3').AsInteger;
      if not Cds.FieldByName('IDCARTACOBRANCA4').IsNull then
        FiIdCartaCobranca4 := Cds.FieldByName('IDCARTACOBRANCA4').AsInteger;

      // Marchetti - Pendencia 18871
      if not Cds.FieldByName('IDREGRAMULTA').IsNull then
         FIDRegraMulta     := Cds.FieldByName('IDREGRAMULTA').AsInteger;

      if Cds.FieldByName('FLGTIPODATAPROG').IsNull then
         FFLGTIPODATAPROG := 'V'
      else
         FFLGTIPODATAPROG := Cds.FieldByName('FLGTIPODATAPROG').AsString;

      if Cds.FieldByName('FLGINDMESANTERIOR').AsInteger = 1 then bApenasUltMesAnterior := True
      else bApenasUltMesAnterior := False;


      // Início - Marcio Motta - 25/06/2004 --------------------------------------
      // Carrega o Logotipo da Empresa
      cds.Data := GetDataPacket('SELECT IMAGEM ' +#13+
                                '  FROM IMAGENS I, PESSOA P ' +#13+
                                ' WHERE I.IDIMAGEM = P.IDIMAGEM ' +#13+
                                '   AND P.IDPESSOA = ' + IntToStr(iIdPessoa) );


      if not cds.IsEmpty then
        if not cds.FieldByName('IMAGEM').IsNull then
          begin
            LogoTipo.Picture.Assign(cds.FieldByName('IMAGEM'));
          end;
      // Fim - Marcio Motta - 25/06/2004 -----------------------------------------

   finally
      Cds.Free;
   end;
end;

procedure TAdminImob.SetbFlgAviso(const Value: Boolean);
begin
  FbFlgAviso := Value;
end;

procedure TAdminImob.SetbFlgConcatenaAno(const Value: Boolean);
begin
  FbFlgConcatenaAno := Value;
end;

procedure TAdminImob.SetbFlgDiario(const Value: Boolean);
begin
  FbFlgDiario := Value;
end;

procedure TAdminImob.SetbFlgDiaUtilAP(const Value: boolean);
begin
  FbFlgDiaUtilAP := Value;
end;

procedure TAdminImob.SetbFlgHistContDifAP(const Value: boolean);
begin
  FbFlgHistContDifAP := Value;
end;

procedure TAdminImob.SetbFlgIntegraCapCar(const Value: Boolean);
begin
  FbFlgIntegraCapCar := Value;
end;

procedure TAdminImob.SetbFlgIntegraContab(const Value: Boolean);
begin
  FbFlgIntegraContab := Value;
end;

procedure TAdminImob.SetbFlgIntegraOrcamen(const Value: Boolean);
begin
  FbFlgIntegraOrcamen := Value;
end;

procedure TAdminImob.SetbFlgLancPagEncerra(const Value: Boolean);
begin
  FbFlgLancPagEncerra := Value;
end;

procedure TAdminImob.SetbFlgLancPagInativo(const Value: Boolean);
begin
  FbFlgLancPagInativo := Value;
end;

procedure TAdminImob.SetbFlgLancRecEncerra(const Value: Boolean);
begin
  FbFlgLancRecEncerra := Value;
end;

procedure TAdminImob.SetbFlgLancRecInativo(const Value: Boolean);
begin
  FbFlgLancRecInativo := Value;
end;

procedure TAdminImob.SetbFlgMultiTipo(const Value: Boolean);
begin
  FbFlgMultiTipo := Value;
end;

procedure TAdminImob.SetbFlgObrigaContrato(const Value: Boolean);
begin
  FbFlgObrigaContrato := Value;
end;

procedure TAdminImob.SetbFlgParCon(const Value: Boolean);
begin
  FbFlgParCon := Value;
end;

procedure TAdminImob.SetbFlgParIm(const Value: Boolean);
begin
  FbFlgParIm := Value;
end;

procedure TAdminImob.SetbFlgParTdCon(const Value: Boolean);
begin
  FbFlgParTdCon := Value;
end;

procedure TAdminImob.SetbFlgParTdIm(const Value: Boolean);
begin
  FbFlgParTdIm := Value;
end;

procedure TAdminImob.SetbFlgParTdTpIm(const Value: Boolean);
begin
  FbFlgParTdTpIm := Value;
end;

procedure TAdminImob.SetbFlgParTpDes(const Value: Boolean);
begin
  FbFlgParTpDes := Value;
end;

procedure TAdminImob.SetbFlgParTpIm(const Value: Boolean);
begin
  FbFlgParTpIm := Value;
end;

procedure TAdminImob.SetbFlgSugereContrato(const Value: Boolean);
begin
  FbFlgSugereContrato := Value;
end;

procedure TAdminImob.SetbFlgUsaAP(const Value: Boolean);
begin
  FbFlgUsaAP := Value;
end;

procedure TAdminImob.SetbFlgUsaInvestimob(const Value: Boolean);
begin
  FbFlgUsaInvestimob := Value;
end;

procedure TAdminImob.SetiAnoCompetencia(const Value: Integer);
begin
  FiAnoCompetencia := Value;
end;

procedure TAdminImob.SetiCodPortForma(const Value: Integer);
begin
  FiCodPortForma := Value;
end;

procedure TAdminImob.SetiFlgPrevFolha(const Value: Integer);
begin
  FiFlgPrevFolha := Value;
end;

procedure TAdminImob.SetiGrupoRegra(const Value: Integer);
begin
  FiGrupoRegra := Value;
end;

procedure TAdminImob.SetiMesBloqLancto(const Value: Integer);
begin
  FiMesBloqLancto := Value;
end;

procedure TAdminImob.SetiMesCompetencia(const Value: Integer);
begin
  FiMesCompetencia := Value;
end;

procedure TAdminImob.SetiQtdeMesPrevFolha(const Value: Integer);
begin
  FiQtdeMesPrevFolha := Value;
end;

procedure TAdminImob.SetiTipoOperAtualCM(const Value: Integer);
begin
  FiTipoOperAtualCM := Value;
end;

procedure TAdminImob.SetiTipoOperAtualJuros(const Value: Integer);
begin
  FiTipoOperAtualJuros := Value;
end;

procedure TAdminImob.SetiTipoOperAtualMulta(const Value: Integer);
begin
  FiTipoOperAtualMulta := Value;
end;

procedure TAdminImob.SetiTipoOperProvPerdas(const Value: Integer);
begin
  FiTipoOperProvPerdas := Value;
end;

procedure TAdminImob.SetiTipoReceitaAlug(const Value: Integer);
begin
  FiTipoReceitaAlug := Value;
end;

procedure TAdminImob.SetiUnidNegoc(const Value: Integer);
begin
  FiUnidNegoc := Value;
end;

procedure TAdminImob.SetsCodCentroRespon(const Value: String);
begin
  FsCodCentroRespon := Value;
end;

procedure TAdminImob.SetsTipoImovelPatro(const Value: String);
begin
  FsTipoImovelPatro := Value;
end;

procedure TAdminImob.SetsCodCentroCusto(const Value: String);
begin
  FsCodCentroCusto := Value;
end;

procedure TAdminImob.SetiPrograma(const Value: Integer);
begin
  FiPrograma := Value;
end;

procedure TAdminImob.SetbFlgReembolsoAutomatico(const Value: Boolean);
begin
  FbFlgReembolsoAutomatico := Value;
end;

procedure TAdminImob.SetbFlgLancForaComp(const Value: Boolean);
begin
  FbFlgLancForaComp := Value;
end;

procedure TAdminImob.SetiTipoOperProvReceita(const Value: Integer);
begin
  FiTipoOperProvReceita := Value;
end;

procedure TAdminImob.SetbFlgLogoRelat(const Value: Boolean);
begin
  FbFlgLogoRelat := Value;
end;

procedure TAdminImob.SetLogoTipo(const Value: TImage);
begin
  FLogoTipo.Picture.Assign( Value.Picture );
end;

procedure TAdminImob.SetiIdCartaCobranca1(const Value: Integer);
begin
  FiIdCartaCobranca1 := Value;
end;

procedure TAdminImob.SetiIdCartaCobranca2(const Value: Integer);
begin
  FiIdCartaCobranca2 := Value;
end;

procedure TAdminImob.SetiIdCartaCobranca3(const Value: Integer);
begin
  FiIdCartaCobranca3 := Value;
end;

procedure TAdminImob.SetiIdCartaCobranca4(const Value: Integer);
begin
  FiIdCartaCobranca4 := Value;
end;

procedure TAdminImob.SetsFlgCalcInadimp(const Value: String);
begin
  FsFlgCalcInadimp := Value;
end;


procedure TAdminImob.SetIdRegraMulta(const Value: Integer);
begin
  FIDRegraMulta := Value;
end;


procedure TAdminImob.SetbFlgBloqRecAluguel(const Value: Boolean);
begin
  FbFlgBloqRecAluguel := Value;
end;

procedure TAdminImob.SetbAtualizaDataProgramada(const Value: Boolean);
begin
  FbAtualizaDataProgramada := Value;
end;

procedure TAdminImob.SetFLGTIPODATAPROG(const Value: String);
begin
  FFLGTIPODATAPROG := Value;
end;

procedure TAdminImob.SetiTipoOperAbonoCM(const Value: Integer);
begin
  FiTipoOperAbonoCM := Value;
end;

procedure TAdminImob.SetiTipoOperAbonoJuros(const Value: Integer);
begin
  FiTipoOperAbonoJuros := Value;
end;

procedure TAdminImob.SetiTipoOperAbonoMulta(const Value: Integer);
begin
  FiTipoOperAbonoMulta := Value;
end;

procedure TAdminImob.SetbApenasUltMesAnterior(const Value: Boolean);
begin
  FbApenasUltMesAnterior := Value;
end;

procedure TAdminImob.SetbFlgAlteraEvento(const Value: Boolean);
begin
  FbFlgAlteraEvento := Value;
end;

procedure TAdminImob.SetMascaraCompl(const Value: String);
begin
  FMascaraCompl := Value;
end;

procedure TAdminImob.SetbFlgRegEvento(const Value: Boolean);
begin
  FbFlgRegEvento := Value;
end;

procedure TAdminImob.SetbFlgBloqDtLanc(const Value: Boolean);
begin
  FbFlgBloqDtLanc := Value;
end;

procedure TAdminImob.SetbFlgUsaUnidade(const Value: Boolean);
begin
  FbFlgUsaUnidade := Value;
end;


// Felipe de Oliveira Sol 65636 - Inicio
procedure  TAdminImob.SetsFlgValCod(const Value: String);
begin
   FsFlgValCod := Value;
end;

procedure TAdminImob.SetsFlgAutCod(const Value: String);
begin
  FsFlgAutCod := Value;
end;
// Felipe de Oliveira Sol 65636 - Fim



{ TGlobal }

constructor TGlobal.Create;
begin
  inherited;
  CtrlParamGlobal := TCtrlParamGlobal.Create;
end;

procedure TGlobal.AfterInitialize;
begin
  inherited;
  CtrlParamGlobal.InitializeAs( Self );
end;

destructor TGlobal.Destroy;
begin
  CtrlParamGlobal.Free;
  inherited;
end;

procedure TGlobal.GetParam(const iIdPessoa: Integer);
var Cds: TCMClientDataSet;
    sSql : String;
begin
  // Inicializa Variáveis
  Cds            := nil;
  sPatro         := '';
  sPlanoPrev     := '';
  sMoedaCorrente := '';
  iMoedaCorrente := -1;

  // Carrega parâmetros da tabela
  try
    Cds  := TCMClientDataSet.Create(nil);
    sSql := 'SELECT PG.USACRESPON,  PG.USAABC,  PG.CODCENTRORESPON, '+#13+
            '       PG.UNIDNEGOC,   PG.IDPATRO, PG.MOEDACORRENTE,   '+#13+
            '       PG.IDPLANOPREV, M.MOESIGLA, L.NOME AS PLANPREV, '+#13+
            '       P.NOME AS PATRO '+#13+
            '  FROM PARAMGLOBAL PG, MOEDA M, PLANPREVCONTABIL L,  '+#13+
            '       PESSOA P, PATRO PA '+#13+
            ' WHERE PG.IDPESSOA = ' + IntToStr(iIdPessoa) +#13+
            '   AND PG.MOEDACORRENTE = M.MOECODIGO(+) '+#13+
            '   AND PG.IDPLANOPREV = L.IDPLANOPREV(+) '+#13+
            '   AND PG.IDPATRO  = PA.IDPESSOA(+) '+#13+
            '   AND PA.IDPESSOA = P.IDPESSOA(+)';

    Cds.Data := CtrlParamGlobal.GetDataPacket( sSql );

    FsPatro         := Cds.FieldByName('PATRO').AsString;
    FsPlanoPrev     := Cds.FieldByName('PLANPREV').AsString;
    FiMoedaCorrente := Cds.FieldByName('MOEDACORRENTE').AsInteger;
    FsMoedaCorrente := Cds.FieldByName('MOESIGLA').AsString;
  finally
    Cds.Free;
  end;
end;


procedure TGlobal.SetsPatro(const Value: String);
begin
  FsPatro := Value;
end;

procedure TGlobal.SetsPlanoPrev(const Value: String);
begin
  FsPlanoPrev := Value;
end;

procedure TGlobal.SetiMoedaCorrente(const Value: Integer);
begin
  FiMoedaCorrente := Value;
end;

procedure TGlobal.SetsMoedaCorrente(const Value: String);
begin
  FsMoedaCorrente := Value;
end;


//==============================================================================

{ TInvestImob }

constructor TInvestImob.Create;
begin
  inherited;
  CtrlParamInvestimob := TCtrlParamInvestimob.Create;
  CtrlParamCAF        := TCtrlParamCAF.Create;
  FLogoTipo := TImage.Create(nil); // Marcio Motta - 28/06/2004
end;

procedure TInvestImob.AfterInitialize;
begin
  inherited;
  CtrlParamInvestimob.InitializeAs( Self );
  CtrlParamCAF.InitializeAs( Self );
end;

destructor TInvestImob.Destroy;
begin
  FreeAndNil( CtrlParamInvestimob );
  FreeAndNil( CtrlParamCAF );
  FreeAndNil( FLogoTipo );  // Marcio Motta - 28/06/2004
  inherited;
end;

procedure TInvestImob.GetParam(const iIdPessoa: Integer);
var Cds: TCMClientDataSet;
begin
  // Inicializa Variaveis
  Cds      := nil;
  FbFlgIntegraContab    := False;
  FbFlgIntegraAtivo     := False;
  FbFlgIntegraCapCar    := False;
  FbFlgIntCafCont       := False;
  FbFlgDeprecDiaria     := False;
  FbFlgReavCriaBem      := False;
  FbFlgReavBaixaBem     := False;
  FiUnidNegoc           := -1;
  FiIdSituacao          := -1;
  FiCodPortForma        := -1;
  FsCodCentroRespon     := '';
  FsCodCentroCusto      := '';
  FiIdSituacao          := -1;
  FiIdPrograma          := -1;
  FiIdPessoaLocalizacao := -1;
  FiIdLocalizacao       := -1;
  FiIdClasseBem         := -1;
  FsCodTipImovelObra    := '';
  FiIdRecAlienacao      := -1;
  FiIdDespAquisicao     := -1;
  FbFlgLogoRelat        := False;
  FiFlgTipoNumeracao    := 0;
  FsFlgPrefixoNumTer    := '';
  FsFlgPrefixoNumEdi    := '';
  FsFlgPrefixoNumIns    := '';

// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgValCod := '';
    FsFlgAutCod := '';
// Felipe de Oliveira Sol 65636 - Fim


  try
    Cds      := TCMClientDataSet.Create(nil);
    Cds.Data := CtrlParamInvestimob.SelecionaParamInvestimob(iIdPessoa);

    if Cds.FieldByName('FLGINTEGRACONTAB').AsString = 'S' then FbFlgIntegraContab := True;
    if Cds.FieldByName('FLGINTEGRAATIVO').AsString  = 'S' then FbFlgIntegraAtivo  := True;
    if Cds.FieldByName('FLGINTEGRACAPCAR').AsString = 'S' then FbFlgIntegraCapCar := True;
    if Cds.FieldByName('FLGINTCAFCONT').AsString    = 'S' then FbFlgIntCafCont    := True;
    if Cds.FieldByName('FLGDIARIO').AsString        = 'S' then FbFlgDeprecDiaria  := True;
    if Cds.FieldByName('FLGREAVCRIABEM').AsString   = 'S' then FbFlgReavCriaBem   := True;
    if Cds.FieldByName('FLGREAVBAIXABEM').AsString  = 'S' then FbFlgReavBaixaBem  := True;
    if Cds.FieldByName('FLGLOGORELAT').AsString     = 'S' then FbFlgLogoRelat     := True; // Marcio Motta - 28/06/2004

    FiUnidNegoc           := Cds.FieldByName('UNIDNEGOC').AsInteger;
    FiCodPortForma        := Cds.FieldByName('CODPORTFORMA').AsInteger;
    FsCodCentroRespon     := Cds.FieldByName('CODCENTRORESPON').AsString;
    FsCodCentroCusto      := Cds.FieldByName('CODCENTROCUSTO').AsString;
    FiIdSituacao          := Cds.FieldByName('IDSITUACAO').AsInteger;
    FiIdPrograma          := Cds.FieldByName('IDPROGRAMA').AsInteger;
    FiIdPessoaLocalizacao := Cds.FieldByName('IDPESSOALOC').AsInteger;
    FiIdLocalizacao       := Cds.FieldByName('IDLOCALIZACAO').AsInteger;
    FiIdClasseBem         := Cds.FieldByName('IDCLASSEBEM').AsInteger;

    // Marchetti - Pendencia 19884
    FiFlgTipoNumeracao    := Cds.FieldByName('FLGTIPONUMERACAO').AsInteger;
    FsFlgPrefixoNumTer    := Cds.FieldByName('FLGPREFIXONUMTER').AsString;
    FsFlgPrefixoNumEdi    := Cds.FieldByName('FLGPREFIXONUMEDI').AsString;
    FsFlgPrefixoNumIns    := Cds.FieldByName('FLGPREFIXONUMINS').AsString;
    // Fim Marchetti - Pendencia 19884

// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgAutCod := Cds.FieldByName('FLGAUTCOD').AsString;
    FsFlgValCod := Cds.FieldByName('FLGVALCOD').AsString;
// Felipe de Oliveira Sol 65636 - Fim

    FsCodTipImovelObra    := Cds.FieldByName('CODTIPIMOVELOBRA').AsString;
    FiIdRecAlienacao      := Cds.FieldByName('IDRECALIENACAO').AsInteger;
    FiIdDespAquisicao     := Cds.FieldByName('IDDESPAQUISICAO').AsInteger;

    // Verifica se utiliza o CAF
    cds.Data := GetDataPacket('SELECT * FROM MODULO WHERE IDMODULO = 7');
    bUsaCAF  := not cds.IsEmpty;

    // Busca os parâmetros do CAF
    CtrlParamCAF.CarregaProp( iIdPessoa );
    FiIdMoedaCAF := CtrlParamCAF.MOEDAOFICIAL;
    FiIdPaisCAF  := 1;

    // Início - Marcio Motta - 28/06/2004 --------------------------------------
    // Carrega o Logotipo da Empresa
    cds.Data := GetDataPacket('SELECT IMAGEM ' +#13+
                              '  FROM IMAGENS I, PESSOA P ' +#13+
                              ' WHERE I.IDIMAGEM = P.IDIMAGEM ' +#13+
                              '   AND P.IDPESSOA = ' + IntToStr(iIdPessoa) );


    if not cds.IsEmpty then
      if not cds.FieldByName('IMAGEM').IsNull then
        begin
          LogoTipo.Picture.Assign(cds.FieldByName('IMAGEM'));
        end;
    // Fim - Marcio Motta - 28/06/2004 -----------------------------------------

  finally
    Cds.Free;
  end;
end;

procedure TInvestImob.SetbFlgDeprecDiaria(const Value: boolean);
begin
  FbFlgDeprecDiaria := Value;
end;

procedure TInvestImob.SetbFlgIntCafCont(const Value: boolean);
begin
  FbFlgIntCafCont := Value;
end;

procedure TInvestImob.SetbFlgIntegraAtivo(const Value: boolean);
begin
  FbFlgIntegraAtivo := Value;
end;

procedure TInvestImob.SetbFlgIntegraCapCar(const Value: boolean);
begin
  FbFlgIntegraCapCar := Value;
end;

procedure TInvestImob.SetbFlgIntegraContab(const Value: Boolean);
begin
  FbFlgIntegraContab := Value;
end;

procedure TInvestImob.SetbFlgReavBaixaBem(const Value: Boolean);
begin
  FbFlgReavBaixaBem := Value;
end;

procedure TInvestImob.SetbFlgReavCriaBem(const Value: Boolean);
begin
  FbFlgReavCriaBem := Value;
end;

procedure TInvestImob.SetiCodPortForma(const Value: Integer);
begin
  FiCodPortForma := Value;
end;

procedure TInvestImob.SetiIdClasseBem(const Value: Integer);
begin
  FiIdClasseBem := Value;
end;

procedure TInvestImob.SetiIdDespAquisicao(const Value: Integer);
begin
  FiIdDespAquisicao := Value;
end;

procedure TInvestImob.SetiIdLocalizacao(const Value: Integer);
begin
  FiIdLocalizacao := Value;
end;

procedure TInvestImob.SetiIdPessoaLocalizacao(const Value: Integer);
begin
  FiIdPessoaLocalizacao := Value;
end;

procedure TInvestImob.SetiIdPrograma(const Value: Integer);
begin
  FiIdPrograma := Value;
end;

procedure TInvestImob.SetiIdRecAlienacao(const Value: Integer);
begin
  FiIdRecAlienacao := Value;
end;

procedure TInvestImob.SetiIdSituacao(const Value: Integer);
begin
  FiIdSituacao := Value;
end;

procedure TInvestImob.SetiUnidNegoc(const Value: Integer);
begin
  FiUnidNegoc := Value;
end;

procedure TInvestImob.SetsCodCentroCusto(const Value: String);
begin
  FsCodCentroCusto := Value;
end;

procedure TInvestImob.SetsCodCentroRespon(const Value: String);
begin
  FsCodCentroRespon := Value;
end;

procedure TInvestImob.SetsCodTipImovelObra(const Value: String);
begin
  FsCodTipImovelObra := Value;
end;

procedure TInvestImob.SetbUsaCAF(const Value: boolean);
begin
  FbUsaCAF := Value;
end;


//==============================================================================

procedure TInvestImob.SetbFlgLogoRelat(const Value: Boolean);
begin
  FbFlgLogoRelat := Value;
end;

procedure TInvestImob.SetLogoTipo(const Value: TImage);
begin
  FLogoTipo.Picture.Assign( Value.Picture );
end;

procedure TInvestImob.SetiIdMoedaCAF(const Value: Integer);
begin
  FiIdMoedaCAF := Value;
end;

procedure TInvestImob.SetiIdPaisCAF(const Value: Integer);
begin
  FiIdPaisCAF := Value;
end;

procedure TInvestImob.SetiFlgTipoNumeracao(const Value: Integer);
begin
  FiFlgTipoNumeracao := Value;
end;

procedure TInvestImob.SetsFlgPrefixoNumEdi(const Value: String);
begin
  FsFlgPrefixoNumEdi := Value;
end;

procedure TInvestImob.SetsFlgPrefixoNumIns(const Value: String);
begin
  FsFlgPrefixoNumIns := Value;
end;

procedure TInvestImob.SetsFlgPrefixoNumTer(const Value: String);
begin
  FsFlgPrefixoNumTer := Value;
end;

// Felipe de Oliveira Sol 65636 - Inicio
procedure  TInvestImob.SetsFlgValCod(const Value: String);
begin
   FsFlgValCod := Value;
end;

procedure TInvestImob.SetsFlgAutCod(const Value: String);
begin
  FsFlgAutCod := Value;
end;
// Felipe de Oliveira Sol 65636 - Fim

{ TAlienacao }

constructor TAlienacao.Create;
begin
  inherited;
  CtrlParamAlienacao := TCtrlParamAlienacao.Create;
  FLogoTipo := TImage.Create(nil); // Marcio Motta - 28/06/2004  
end;

procedure TAlienacao.AfterInitialize;
begin
  inherited;
  CtrlParamAlienacao.InitializeAs( Self );
end;

destructor TAlienacao.Destroy;
begin
  CtrlParamAlienacao.Free;
  FreeAndNil(FLogoTipo); // Marcio Motta - 28/06/2004
  inherited;
end;

procedure TAlienacao.GetParam(const iIdPessoa: Integer);
var Cds: TCMClientDataSet;
begin
  // Inicializa Variaveis
  FiUnidNegoc         := -1;
  FiPrograma          := -1;
  FsCodCentroRespon   := '';
  FsCentroCusto       := '';
  FbNumeraProposta    := False;
  FbFlgDiario         := False;
  FbFlgIntegraAtivo   := False;
  FbFlgIntegraContab  := False;
  FbFlgIntegraCapCar  := False;
  FbFlgParCon         := False;
  FbFlgParIm          := False;
  FbFlgParTdCon       := False;
  FbFlgParTdIm        := False;
  FbFlgParTdTpIm      := False;
  FbFlgParTpDes       := False;
  FbFlgParTpIm        := False;
  FiTipoRecAVista      := -1;
  FiTipoRecAmortiz     := -1;
  FiTipoRecCorrecao    := -1;
  FiTipoRecAmortExtra  := -1;
  FiTipoRecSinal       := -1;
  FiTipoRecJuros       := -1;
  FiTipoRecProjecao    := -1;
  FiTipoRecPerdas      := -1;
  FiMesCompetencia     := -1;
  FiAnoCompetencia     := -1;
  FiTipoOperAtualMulta := -1;
  FiTipoOperAtualJuros := -1;
  FiTipoOperAtualCM    := -1;
  FiTipoOperProvPerdas := -1;
  FbFlgCMJurDiario     := False;
  FbFlgLogoRelat       := False; // Marcio Motta - 28/06/2004
  FbAtualizaDataProgramada := False;
  FiTipoOperAtualRes   := -1;

  iTipoOperAtualMultaAC := -1;
  iTipoOperAtualJurosAC := -1;
  iTipoOperAtualCMAC    := -1;
  iTipoOperProvPerdasAC := -1;
  FiTipoRecJurosAC      := -1;
  FiTipoRecCorrecaoAC   := -1;
  FiTipoRecAmortAC      := -1;

  FIDRegraMulta         := -1;

  bApenasUltMesAnterior := True;


  iCodAlteradorCPMF     := -1;
  iCodAlteradorAdRes    := -1;
  iIDOperAbonoResN      := -1;
  iIDOperAbonoResA      := -1;


// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgValCod := '';
    FsFlgAutCod := '';
// Felipe de Oliveira Sol 65636 - Fim

  // Carrega Parâmetros da Tabela
  Cds := nil;
  try
    Cds := TCMClientDataSet.Create(nil);
    Cds.Data := CtrlParamAlienacao.SelecionaParamAlienacao(iIdPessoa);

    if Cds.FieldByName('FLGNUMPROPOSTA').AsString     = 'S' then FbNumeraProposta   := True;
    if Cds.FieldByName('FLGDIARIO').AsString          = 'S' then FbFlgDiario        := True;
    if Cds.FieldByName('FLGINTEGRAATIVO').AsString    = 'S' then FbFlgIntegraAtivo  := True;
    if Cds.FieldByName('FLGINTEGRACONTAB').AsString   = 'S' then FbFlgIntegraContab := True;
    if Cds.FieldByName('FLGINTEGRACAPCAR').AsString   = 'S' then FbFlgIntegraCapCar := True;
    if Cds.FieldByName('FLGLOGORELAT').AsString       = 'S' then FbFlgLogoRelat     := True; // Marcio Motta - 28/06/2004
    if Cds.FieldByName('FLGCMJURDIARIO').AsInteger    = 1   then FbFlgCMJurDiario   := True;

    if Cds.FieldByName('FLGATUALDATAPROG').AsInteger  = 1   then FbAtualizaDataProgramada := True;

    // Carrega Ids
    if Cds.FieldByName('IDPROGRAMA').AsInteger > 0        then
       FiPrograma := Cds.FieldByName('IDPROGRAMA').AsInteger;
    if not Cds.FieldByName('IDOPERATUALMULTA').IsNull then
      FiTipoOperAtualMulta := Cds.FieldByName('IDOPERATUALMULTA').AsInteger;
    if not Cds.FieldByName('IDOPERATUALJUROS').IsNull then
      FiTipoOperAtualJuros := Cds.FieldByName('IDOPERATUALJUROS').AsInteger;
    if not Cds.FieldByName('IDOPERATUALCM').IsNull then
      FiTipoOperAtualCM    := Cds.FieldByName('IDOPERATUALCM').AsInteger;
    if not Cds.FieldByName('IDOPERPROVPER').IsNull then
      FiTipoOperProvPerdas := Cds.FieldByName('IDOPERPROVPER').AsInteger;
    if not Cds.FieldByName('IDOPERATUALRES').IsNull then
      FiTipoOperAtualRes  := Cds.FieldByName('IDOPERATUALRES').AsInteger;


    if not Cds.FieldByName('IDOPERATMULTAC').IsNull then
      FiTipoOperAtualMultaAC := Cds.FieldByName('IDOPERATMULTAC').AsInteger;
    if not Cds.FieldByName('IDOPERATJURAC').IsNull then
      FiTipoOperAtualJurosAC := Cds.FieldByName('IDOPERATJURAC').AsInteger;
    if not Cds.FieldByName('IDOPERATCMAC').IsNull then
      FiTipoOperAtualCMAC    := Cds.FieldByName('IDOPERATCMAC').AsInteger;
    if not Cds.FieldByName('IDOPERPROVPERAC').IsNull then
      FiTipoOperProvPerdasAC := Cds.FieldByName('IDOPERPROVPERAC').AsInteger;

    if not Cds.FieldByName('IDOPERABONOMULTA').IsNull then
      FiTipoOperAbonoMulta := Cds.FieldByName('IDOPERABONOMULTA').AsInteger;
    if not Cds.FieldByName('IDOPERABONOJUROS').IsNull then
      FiTipoOperAbonoJuros := Cds.FieldByName('IDOPERABONOJUROS').AsInteger;
    if not Cds.FieldByName('IDOPERABONOCM').IsNull then
      FiTipoOperAbonoCM    := Cds.FieldByName('IDOPERABONOCM').AsInteger;

    if not Cds.FieldByName('CODALTERADORCPMF').IsNull then
       iCodAlteradorCPMF  := Cds.FieldByName('CODALTERADORCPMF').AsInteger;

    if not Cds.FieldByName('CODALTERADORADRES').IsNull then
       iCodAlteradorAdRes := Cds.FieldByName('CODALTERADORADRES').AsInteger;

    if not Cds.FieldByName('IDOPERABONORESN').IsNull then
       iIDOperAbonoResN   := Cds.FieldByName('IDOPERABONORESN').AsInteger;

    if not Cds.FieldByName('IDOPERABONORESA').IsNull then
       iIDOperAbonoResA   := Cds.FieldByName('IDOPERABONORESA').AsInteger;

    FiUnidNegoc         := Cds.FieldByName('UNIDNEGOC').AsInteger;
    FsCodCentroRespon   := Cds.FieldByName('CODCENTRORESPON').AsString;
    FsCentroCusto       := Cds.FieldByName('CODCENTROCUSTO').AsString;
    FiTipoRecAVista     := Cds.FieldByName('IDRECAVISTA').AsInteger;
    FiTipoRecAmortiz    := Cds.FieldByName('IDRECAMORTIZACAO').AsInteger;
    FiTipoRecCorrecao   := Cds.FieldByName('IDRECCORRECAO').AsInteger;
    FiTipoRecAmortExtra := Cds.FieldByName('IDRECAMORTEXTRA').AsInteger;
    FiTipoRecSinal      := Cds.FieldByName('IDRECSINAL').AsInteger;
    FiTipoRecJuros      := Cds.FieldByName('IDRECJUROS').AsInteger;
    FiTipoRecProjecao   := Cds.FieldByName('IDRECPROJECAO').AsInteger;
    FiTipoRecPerdas     := Cds.FieldByName('IDRECPERDAS').AsInteger;
    FiMesCompetencia    := Cds.FieldByName('MESCOMPETENCIA').AsInteger;
    FiAnoCompetencia    := Cds.FieldByName('ANOCOMPETENCIA').AsInteger;

    FiTipoRecJurosAC    := Cds.FieldByName('IDRECJUROSAC').AsInteger;
    FiTipoRecCorrecaoAC := Cds.FieldByName('IDRECCORRAC').AsInteger;

// Felipe de Oliveira Sol 65636 - Inicio
    FsFlgAutCod := Cds.FieldByName('FLGAUTCOD').AsString;
    FsFlgValCod := Cds.FieldByName('FLGVALCOD').AsString;
// Felipe de Oliveira Sol 65636 - Fim    
    
    if not Cds.FieldByName('IDRECAMORTAC').IsNull then
       FiTipoRecAmortAC := Cds.FieldByName('IDRECAMORTAC').AsInteger;

    // PARÂMETROS DE FILTRO CONTÁBIL
    if Cds.FieldByName('FLGPARCON').AsString = 'S'    then FbFlgParCon    := True;
    if Cds.FieldByName('FLGPARIM').AsString = 'S'     then FbFlgParIm     := True;
    if Cds.FieldByName('FLGPARTDCON').AsString = 'S'  then FbFlgParTdCon  := True;
    if Cds.FieldByName('FLGPARTDIM').AsString = 'S'   then FbFlgParTdIm   := True;
    if Cds.FieldByName('FLGPARTDTPIM').AsString = 'S' then FbFlgParTdTpIm := True;
    if Cds.FieldByName('FLGPARTPDES').AsString = 'S'  then FbFlgParTpDes  := True;
    if Cds.FieldByName('FLGPARTPIM').AsString = 'S'   then FbFlgParTpIm   := True;

    if Cds.FieldByName('FLGTIPODATAPROG').IsNull then
       FFLGTIPODATAPROG := 'V'
    else
       FFLGTIPODATAPROG := Cds.FieldByName('FLGTIPODATAPROG').AsString;


    if not Cds.FieldByName('IDREGRAMULTA').IsNull then
      FIDRegraMulta := Cds.FieldByName('IDREGRAMULTA').AsInteger;

    if Cds.FieldByName('FLGINDMESANTERIOR').AsInteger = 1 then
      bApenasUltMesAnterior := True
    else
      bApenasUltMesAnterior := False;

    // Início - Marcio Motta - 28/06/2004 --------------------------------------
    // Carrega o Logotipo da Empresa
    cds.Data := GetDataPacket('SELECT IMAGEM ' +#13+
                              '  FROM IMAGENS I, PESSOA P ' +#13+
                              ' WHERE I.IDIMAGEM = P.IDIMAGEM ' +#13+
                              '   AND P.IDPESSOA = ' + IntToStr(iIdPessoa) );


    if not cds.IsEmpty then
      if not cds.FieldByName('IMAGEM').IsNull then
        begin
          LogoTipo.Picture.Assign(cds.FieldByName('IMAGEM'));
        end;
    // Fim - Marcio Motta - 28/06/2004 -----------------------------------------

  finally
    Cds.Free;
  end;
end;

procedure TAlienacao.SetbFlgDiario(const Value: Boolean);
begin
  FbFlgDiario := Value;
end;

procedure TAlienacao.SetbFlgIntegraAtivo(const Value: Boolean);
begin
  FbFlgIntegraAtivo := Value;
end;

procedure TAlienacao.SetbFlgIntegraCapCar(const Value: Boolean);
begin
  FbFlgIntegraCapCar := Value;
end;

procedure TAlienacao.SetbFlgIntegraContab(const Value: Boolean);
begin
  FbFlgIntegraContab := Value;
end;

procedure TAlienacao.SetbFlgParCon(const Value: Boolean);
begin
  FbFlgParCon := Value;
end;

procedure TAlienacao.SetbFlgParIm(const Value: Boolean);
begin
  FbFlgParIm := Value;
end;

procedure TAlienacao.SetbFlgParTdCon(const Value: Boolean);
begin
  FbFlgParTdCon := Value;
end;

procedure TAlienacao.SetbFlgParTdIm(const Value: Boolean);
begin
  FbFlgParTdIm := Value;
end;

procedure TAlienacao.SetbFlgParTdTpIm(const Value: Boolean);
begin
  FbFlgParTdTpIm := Value;
end;

procedure TAlienacao.SetbFlgParTpDes(const Value: Boolean);
begin
  FbFlgParTpDes := Value;
end;

procedure TAlienacao.SetbFlgParTpIm(const Value: Boolean);
begin
  FbFlgParTpIm := Value;
end;

procedure TAlienacao.SetbNumeraProposta(const Value: Boolean);
begin
  FbNumeraProposta := Value;
end;

procedure TAlienacao.SetiAnoCompetencia(const Value: Integer);
begin
  FiAnoCompetencia := Value;
end;

procedure TAlienacao.SetiMesCompetencia(const Value: Integer);
begin
  FiMesCompetencia := Value;
end;

procedure TAlienacao.SetiPrograma(const Value: Integer);
begin
  FiPrograma := Value;
end;

procedure TAlienacao.SetiTipoRecAmortExtra(const Value: Integer);
begin
  FiTipoRecAmortExtra := Value;
end;

procedure TAlienacao.SetiTipoRecAmortiz(const Value: Integer);
begin
  FiTipoRecAmortiz := Value;
end;

procedure TAlienacao.SetiTipoRecAVista(const Value: Integer);
begin
  FiTipoRecAVista := Value;
end;

procedure TAlienacao.SetiTipoRecCorrecao(const Value: Integer);
begin
  FiTipoRecCorrecao := Value;
end;

procedure TAlienacao.SetiTipoRecJuros(const Value: Integer);
begin
  FiTipoRecJuros := Value;
end;

procedure TAlienacao.SetiTipoRecPerdas(const Value: Integer);
begin
  FiTipoRecPerdas := Value;
end;

procedure TAlienacao.SetiTipoRecProjecao(const Value: Integer);
begin
  FiTipoRecProjecao := Value;
end;

procedure TAlienacao.SetiTipoRecSinal(const Value: Integer);
begin
  FiTipoRecSinal := Value;
end;

procedure TAlienacao.SetiUnidNegoc(const Value: Integer);
begin
  FiUnidNegoc := Value;
end;

procedure TAlienacao.SetsCentroCusto(const Value: String);
begin
  FsCentroCusto := Value;
end;

procedure TAlienacao.SetsCodCentroRespon(const Value: String);
begin
  FsCodCentroRespon := Value;
end;

procedure TAlienacao.SetbFlgLogoRelat(const Value: Boolean);
begin
  FbFlgLogoRelat := Value;
end;

procedure TAlienacao.SetLogoTipo(const Value: TImage);
begin
  FLogoTipo.Picture.Assign( Value.Picture );
end;

procedure TAlienacao.SetiTipoOperAtualCM(const Value: Integer);
begin
  FiTipoOperAtualCM := Value;
end;

procedure TAlienacao.SetiTipoOperAtualJuros(const Value: Integer);
begin
  FiTipoOperAtualJuros := Value;
end;

procedure TAlienacao.SetiTipoOperAtualMulta(const Value: Integer);
begin
  FiTipoOperAtualMulta := Value;
end;

procedure TAlienacao.SetiTipoOperProvPerdas(const Value: Integer);
begin
  FiTipoOperProvPerdas := Value;
end;

procedure TAlienacao.SetIDRegraMulta(const Value: Integer);
begin
  FIDRegraMulta := Value;
end;

procedure TAlienacao.SetbFlgCMJurDiario(const Value: Boolean);
begin
  FbFlgCMJurDiario := Value;
end;

procedure TAlienacao.SetbAtualizaDataProgramada(const Value: Boolean);
begin
  FbAtualizaDataProgramada := Value;
end;

procedure TAlienacao.SetFLGTIPODATAPROG(const Value: String);
begin
  FFLGTIPODATAPROG := Value;
end;

procedure TAlienacao.SetiTipoOperAtualRes(const Value: Integer);
begin
  FiTipoOperAtualRes := Value;
end;

procedure TAlienacao.SetiTipoOperAbonoCM(const Value: Integer);
begin
  FiTipoOperAbonoCM := Value;
end;

procedure TAlienacao.SetiTipoOperAbonoJuros(const Value: Integer);
begin
  FiTipoOperAbonoJuros := Value;
end;

procedure TAlienacao.SetiTipoOperAbonoMulta(const Value: Integer);
begin
  FiTipoOperAbonoMulta := Value;
end;

procedure TAlienacao.SetiTipoOperAtualCMAC(const Value: Integer);
begin
  FiTipoOperAtualCMAC := Value;
end;

procedure TAlienacao.SetiTipoOperAtualJurosAC(const Value: Integer);
begin
  FiTipoOperAtualJurosAC := Value;
end;

procedure TAlienacao.SetiTipoOperAtualMultaAC(const Value: Integer);
begin
  FiTipoOperAtualMultaAC := Value;
end;

procedure TAlienacao.SetiTipoOperProvPerdasAC(const Value: Integer);
begin
  FiTipoOperProvPerdasAC := Value;
end;

procedure TAlienacao.SetiTipoRecCorrecaoAC(const Value: Integer);
begin
  FiTipoRecCorrecaoAC := Value;
end;

procedure TAlienacao.SetiTipoRecJurosAC(const Value: Integer);
begin
  FiTipoRecJurosAC := Value;
end;

procedure TAlienacao.SetbApenasUltMesAnterior(const Value: Boolean);
begin
  FbApenasUltMesAnterior := Value;
end;

procedure TAlienacao.SetiTipoRecAmortAC(const Value: Integer);
begin
   FiTipoRecAmortAC := Value;
end;

procedure TAlienacao.SetiCodAlteradorAdRes(const Value: Integer);
begin
   FiCodAlteradorAdRes := Value;
end;

procedure TAlienacao.SetiCodAlteradorCPMF(const Value: Integer);
begin
   FiCodAlteradorCPMF := Value;
end;

procedure TAlienacao.SetiIDOperAbonoResA(const Value: Integer);
begin
   FiIDOperAbonoResA := Value;
end;

procedure TAlienacao.SetiIDOperAbonoResN(const Value: Integer);
begin
   FiIDOperAbonoResN := Value;
end;


// Felipe de Oliveira Sol 65636 - Inicio
procedure  TAlienacao.SetsFlgValCod(const Value: String);
begin
   FsFlgValCod := Value;
end;

procedure TAlienacao.SetsFlgAutCod(const Value: String);
begin
  FsFlgAutCod := Value;
end;
// Felipe de Oliveira Sol 65636 - Fim

end.
