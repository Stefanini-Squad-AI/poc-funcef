//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_15
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data	     : 12/05/2008
// Codigo    : AL_14
// Pendencia : 25129
// SOL       : 58645
// Desc      : Implementação na integração por Módulos do item Opções de Indice
//******************************************************************************
// Data	     : 17/01/2008
// Codigo    : AL_13
// Pendência : 26744
// SOL       : 71043
// Desc      : Implementação de campos para o novo tipo de fundos - FMIEE 
//******************************************************************************
// Data      : 12/11/2007
// Código    : AL_11
// Pendencia : 25684
// SOL       :
// Desc      : Criação de parametro com a versão do módulo
//******************************************************************************
// Data      : 10/08/2007
// Código    : AL_10
// Pendencia : 25728
// SOL       : 63282
// Desc      : Criação de uma property DataLimCartGer para receber o parametro
//               Data de Limite de utilização das carteiras gerenciais que está
//               sendo gravado no campo DATAMOVCDBLIB
//******************************************************************************
// Data      : 29/05/2007
// Código    : AL_9
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do paramentro IDCARTEIRARF para Bloqueio de
//             Fundos e Penhora com o Jurídico
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_8
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação dos parâmetros Liga/Desliga integração contabil
//               financeira por módulo
//******************************************************************************
// Data      : 02/02/2007
// Código    : AL_7
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do paramentro IDMOTBLOQPENFDO para Bloqueio de
//             Fundos e Penhora com o Jurídico
//******************************************************************************
// Data      : 18/01/2007
// Código    : AL_6
// Pendencia : 24236
// SOL       :
// Desc      : Implementação das properties para substituir as variaveis globais
//             do sistema. Não será mais utilizado a IdPlanPrevCtbPatr E idtipoinvest
//             da tabela de parametros do sistema.
//******************************************************************************
// Data      : 12/01/2007
// Código    : AL_5
// Pendencia : 24236
// SOL       :
// Desc      : Implementação das properties para substituir o pRPI
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_4
// Pendencia : 22492
// SOL       :
// Desc      : Implementação de Contabilização em dias úteis para ativos de
//             Renda Fixa que geram registros em dias não uteis
//             Contabiliza FLGCONTABDIAUTIL
//******************************************************************************
// Data     : 23/02/2006
// Código   : AL_3
// Motivo   : Criação da pasta de CPMF e dos campos PZORECCPMF na PARAMINVEST
//            para identificar o dia para recolhimento do CPMF
//******************************************************************************
// Data     : 03/02/2006
// Código   : AL_2
// Motivo   : Criação do campo MASCSCLASSIFANBID na PARAMINVEST para tratar a máscara
//            do código da Classificacao ANBID
//******************************************************************************
// Data     : 06/12/2005
// Código   : AL_1
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo IDTIPOOPERDIRDSA, IDTIPOOPERDIRDSR, FLGREGIMECXCOMP,
//            e DTAREGIMECXCOMP na PARAMINVEST
//******************************************************************************

unit uCtrlParamInvest;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uDbParamInvest,
     uCMClientDataSet, uDiasUteis, uCtrlPadroes, uOperacaoinvest, extctrls,
     //AL_6
     uBibliotecaInvest
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlParamInvest = Class(TCmControlObject)
   private
    FCdsParamInvest : TClientDataSet;
    FDbParamInvest  : TDbParamInvest;
    _DiasUteis : TDiasUteis;
    //AL_6
    FDataUltFech: TdateTime;
    FIDParamInvest: Integer;
    FLogo: TImage;
    FMascSetorEmissor: String;
    FMoeCodigo: Integer;
    FMascClassifInv: String;
    FVlrDiverg: Real;
    FVlrCotaIniCart: Real;
    FFlgOrdMovInv: String;
    FPercPuOrdMovInv: Real;
    FPercImpRenda: Real;
    FMoedaAtu: Integer;
    FPercParticEmpr: Real;
    FPercParticRecur: Real;
    FIdParamPatrLiq: Integer;
    FTipoMenu: String;
    FDataUltFechRF: TdateTime;
    FIdTipoDespIRApu: Integer;
    FIdTipoDespInvest: Integer;
    FMoedaGer: Integer;
    FFlgProvisionaIRRF: String;
    FFlgProvisionaIRRV: String;
    FPUCDB: Real;
    FDataMovCDBLIB: TdateTime;
    FIdTipoDespIRProv: Integer;
    FMoedaAtulIT: Integer;
    FIdPrograma: Integer;
    FIdTipoClienteCOR: Integer;
    FIdTipoOperDirInc: Integer;
    FIdTipoOperDirCis: Integer;
    FIdTipoOperDirDes: Integer;
    FIdTipoOperDirGru: Integer;
    FIdTipoOperDirPer: Integer;
    FIdTipoOperDirBon: Integer;
    FIdTipoOperDirDiv: Integer;
    FIdTipoOperDirSub: Integer;
    FIdTipoInvest: Integer;
    FIdTipoOperDirJur: Integer;
    FIdTipoClienteEMI: Integer;
    FIdTipoClienteCus: Integer;
    FIdTipoContrRF: Integer;
    FIdBVSP: Integer;
    FIdTipoInvestidor: Integer;
    FIdmercado: Integer;
    FIdTipoOperLiqPend: Integer;
    FIdBMF: Integer;
    FIdTipoContrFin: Integer;
    FDataUltFechFdo: TdateTime;
    FDataUltFechBMF: TdateTime;
    FIdTpPeriodicidade: Integer;
    FDataUltImpCot: TdateTime;
    FIdTipoOperDirAlt: Integer;
    FIdRamoForCor: Integer;
    FIdRamoForCus: Integer;
    FFlgLiberaIdLote: String;
    FIdTipoOperDirRes: Integer;
    FFlgUsaSubConta: String;
    FPercDevRV: Real;
    FPercDevBMF: Real;
    FDiaSemanaCPMF: String;
    FDiasUteisCPMF: Integer;
    FIdCustoDiaRenFix: Integer;
    FIdTipoRegraRV: Integer;
    FIdTipoRegraRF: Integer;
    FIdTipoRegraBMF: Integer;
    FFlgImplantaRF: String;
    FFlgContabiliza: String;
    FFlgIntCapCar: String;
    FIdContraparteRF: Integer;
    FIdAutorizaOrdem: Integer;
    FIdClassePoup: Integer;
    FFlgEmpAcoes: String;
    FIdCartEmpAcoes: Integer;
    FIdRegraEmpAcoes: Integer;
    FIdMotBloqEmpAC: Integer;
    FFlgCartGerenc: String;
    FIdIndexPoupanca: Integer;
    FJurosPoupanca: Integer;
    FIdTipoOperDirMul: Integer;
    FIdOperaMortPrinc: Integer;
    FIdOperIncJuros: Integer;
    FIdOperPagtoJuros: Integer;
    FFlgEspecFundo: String;
    FFlgCompVarRV: String;
    FPrzVencBMF: Integer;
    FPrzVencCFianca: Integer;
    FIdTipoRegraFnd: Integer;
    FIdClassPoupBloq: Integer;
    FIdTipoRegraRent: Integer;
    FDataMovtoRV: Tdatetime;
    FIdTipoRegraAtuaR: Integer;
    FFlgPlanPrevCtbPat: String;
    FIdClassNTN: Integer;
    FIdTipoOperDirREE: Integer;
    FDataUltFechEmp: Tdatetime;
    FIdTipoOperDirProv: Integer;
    FIdTipoOperOPCCP: Integer;
    FIdTipoOperOpCVD: Integer;
    FMoedaEQM: Integer;
    FSTARET: String;
    FDataUltRet: Tdatetime;
    FIdCartOpCIND: Integer;
    FIdMotBloqOpC: Integer;
    FIdCartOpC: Integer;
    FIdCartaVista: Integer;
    FDifMaxOpCInd: Real;
    FIdTipoRegraOpCIN: Integer;
    FIdTipoRegraEmpAC: Integer;
    FIdTipoDespDVCOR: Integer;
    FIdGrupoRegraInv: Integer;
    FFlgDemo: String;
    FFlgIntFinLiq: String;
    FDtMudaCPMF: TdateTime;
    FFlgRecPagRV: String;
    FIdTipoOperDirDSU: Integer;
    FDifResgFundos: Integer;
    FFlgPoupaPropDia: String;
    FIdTipoOperRFRAC: Integer;
    FIdTipoOperDirDSA: Integer;
    FIdTipoOperDirDSR: Integer;
    FFlgRegimeCxComp: String;
    FDtaRegimeCxComp: Tdatetime;
    FMascSClassifANBID: String;
    FPzoRecCPMF: Integer;
    FDataIniRecCpmf: Tdatetime;
    FFlgContabDiaUtil: String;
    FIdRamoForEmi: Integer;
    FIDModulo: Integer;
    FIDUsuario: Integer;
    FIDEmpresa: Integer;
    FIDEspAcesso: Integer;
    FNomeModulo: String;
    //AL_11
    FVersaoModulo: String;
    FNomeUsuario: String;
    FNomeEmpresa: String;
    FIdPlanPrevCtbPatr: Integer;
    FIdPlanoPrevContab: Integer;
    FIdPatrocinadora: Integer;
    FPlanPrevCtbPatr: String;
    //AL_7
    FIdMotBloqPenFdo: Integer;
    //AL_8
    FIntFinContabFIM: String;
    FIntFinContabFDC: String;
    FIntFinContabBMF: String;
    FIntFinContabFRV: String;
    FIntFinContabRF: String;
    FIntFinContabFRF: String;
    FIntFinContabFIP: String;
    FIntFinContabRV: String;
    //AL_14
    FIntFinContabOPI: String;

    //AL_9
    FIdCarteiraRF : Integer;
    FDataLimCartGer: TDateTime;
    //AL_13
    FIDUSREMABERTURAFMI: Integer;
    FFLGEMABERTURAFMI: String;

    procedure SetDbParamInvest(const Value: TDbParamInvest);
    //AL_6
    procedure SetDataUltFech(const Value: TdateTime);
    procedure SetIDParamInvest(const Value: Integer);
    procedure SetLogo(const Value: TImage);
    procedure SetMascSetorEmissor(const Value: String);
    procedure SetMoeCodigo(const Value: Integer);
    procedure SetMascClassifInv(const Value: String);
    procedure SetVlrDiverg(const Value: Real);
    procedure SetVlrCotaIniCart(const Value: Real);
    procedure SetFlgOrdMovInv(const Value: String);
    procedure SetPercPuOrdMovInv(const Value: Real);
    procedure SetPercImpRenda(const Value: Real);
    procedure SetMoedaAtu(const Value: Integer);
    procedure SetPercParticEmpr(const Value: Real);
    procedure SetPercParticRecur(const Value: Real);
    procedure SetIdParamPatrLiq(const Value: Integer);
    procedure SetTipoMenu(const Value: String);
    procedure SetDataUltFechRF(const Value: TdateTime);
    procedure SetIdTipoDespIRApu(const Value: Integer);
    procedure SetIdTipoDespInvest(const Value: Integer);
    procedure SetMoedaGer(const Value: Integer);
    procedure SetFlgProvisionaIRRF(const Value: String);
    procedure SetFlgProvisionaIRRV(const Value: String);
    procedure SetPUCDB(const Value: Real);
    procedure SetDataMovCDBLIB(const Value: TdateTime);
    //AL_10
    procedure SetDataLimCartGer(const Value: TDateTime);
    procedure SetIdTipoDespIRProv(const Value: Integer);
    procedure SetMoedaAtulIT(const Value: Integer);
    procedure SetIdPrograma(const Value: Integer);
    procedure SetIdTipoClienteCOR(const Value: Integer);
    procedure SetIdTipoOperDirInc(const Value: Integer);
    procedure SetIdTipoOperDirCis(const Value: Integer);
    procedure SetIdTipoOperDirDes(const Value: Integer);
    procedure SetIdTipoOperDirGru(const Value: Integer);
    procedure SetIdTipoOperDirPer(const Value: Integer);
    procedure SetIdTipoOperDirBon(const Value: Integer);
    procedure SetIdTipoOperDirDiv(const Value: Integer);
    procedure SetIdTipoOperDirSub(const Value: Integer);
    procedure SetIdTipoOperDirJur(const Value: Integer);
    procedure SetIdTipoClienteEMI(const Value: Integer);
    procedure SetIdTipoClienteCus(const Value: Integer);
    procedure SetIdTipoContrRF(const Value: Integer);
    procedure SetIdBVSP(const Value: Integer);
    procedure SetIdTipoInvestidor(const Value: Integer);
    procedure SetIdmercado(const Value: Integer);
    procedure SetIdTipoOperLiqPend(const Value: Integer);
    procedure SetIdBMF(const Value: Integer);
    procedure SetIdTipoContrFin(const Value: Integer);
    procedure SetDataUltFechFdo(const Value: TdateTime);
    procedure SetDataUltFechBMF(const Value: TdateTime);
    procedure SetIdTpPeriodicidade(const Value: Integer);
    procedure SetDataUltImpCot(const Value: TdateTime);
    procedure SetIdTipoOperDirAlt(const Value: Integer);
    procedure SetIdRamoForCor(const Value: Integer);
    procedure SetIdRamoForCus(const Value: Integer);
    procedure SetFlgLiberaIdLote(const Value: String);
    procedure SetIdTipoOperDirRes(const Value: Integer);
    procedure SetFlgUsaSubConta(const Value: String);
    procedure SetPercDevRV(const Value: Real);
    procedure SetPercDevBMF(const Value: Real);
    procedure SetDiaSemanaCPMF(const Value: String);
    procedure SetDiasUteisCPMF(const Value: Integer);
    procedure SetIdCustoDiaRenFix(const Value: Integer);
    procedure SetIdTipoRegraRV(const Value: Integer);
    procedure SetIdTipoRegraRF(const Value: Integer);
    procedure SetIdTipoRegraBMF(const Value: Integer);
    procedure SetFlgImplantaRF(const Value: String);
    procedure SetFlgContabiliza(const Value: String);
    procedure SetFlgIntCapCar(const Value: String);
    procedure SetIdContraparteRF(const Value: Integer);
    procedure SetIdAutorizaOrdem(const Value: Integer);
    procedure SetIdClassePoup(const Value: Integer);
    procedure SetFlgEmpAcoes(const Value: String);
    procedure SetIdCartEmpAcoes(const Value: Integer);
    procedure SetIdRegraEmpAcoes(const Value: Integer);
    procedure SetIdMotBloqEmpAC(const Value: Integer);
    procedure SetFlgCartGerenc(const Value: String);
    procedure SetIdIndexPoupanca(const Value: Integer);
    procedure SetJurosPoupanca(const Value: Integer);
    procedure SetIdTipoOperDirMul(const Value: Integer);
    procedure SetIdOperaMortPrinc(const Value: Integer);
    procedure SetIdOperIncJuros(const Value: Integer);
    procedure SetIdOperPagtoJuros(const Value: Integer);
    procedure SetFlgEspecFundo(const Value: String);
    procedure SetFlgCompVarRV(const Value: String);
    procedure SetPrzVencBMF(const Value: Integer);
    procedure SetPrzVencCFianca(const Value: Integer);
    procedure SetIdTipoRegraFnd(const Value: Integer);
    procedure SetIdClassPoupBloq(const Value: Integer);
    procedure SetIdTipoRegraRent(const Value: Integer);
    procedure SetDataMovtoRV(const Value: Tdatetime);
    procedure SetIdTipoRegraAtuaR(const Value: Integer);
    procedure SetFlgPlanPrevCtbPat(const Value: String);
    procedure SetIdClassNTN(const Value: Integer);
    procedure SetIdTipoOperDirREE(const Value: Integer);
    procedure SetDataUltFechEmp(const Value: Tdatetime);
    procedure SetIdTipoOperDirProv(const Value: Integer);
    procedure SetIdTipoOperOPCCP(const Value: Integer);
    procedure SetIdTipoOperOpCVD(const Value: Integer);
    procedure SetMoedaEQM(const Value: Integer);
    procedure SetSTARET(const Value: String);
    procedure SetDataUltRet(const Value: Tdatetime);
    procedure SetIdCartOpCIND(const Value: Integer);
    procedure SetIdMotBloqOpC(const Value: Integer);
    procedure SetIdCartOpC(const Value: Integer);
    procedure SetIdCartaVista(const Value: Integer);
    procedure SetDifMaxOpCInd(const Value: Real);
    procedure SetIdTipoRegraOpCIN(const Value: Integer);
    procedure SetIdTipoRegraEmpAC(const Value: Integer);
    procedure SetIdTipoDespDVCOR(const Value: Integer);
    procedure SetIdGrupoRegraInv(const Value: Integer);
    procedure SetFlgDemo(const Value: String);
    procedure SetFlgIntFinLiq(const Value: String);
    procedure SetDtMudaCPMF(const Value: TdateTime);
    procedure SetFlgRecPagRV(const Value: String);
    procedure SetIdTipoOperDirDSU(const Value: Integer);
    procedure SetDifResgFundos(const Value: Integer);
    procedure SetFlgPoupaPropDia(const Value: String);
    procedure SetIdTipoOperRFRAC(const Value: Integer);
    procedure SetIdTipoOperDirDSA(const Value: Integer);
    procedure SetIdTipoOperDirDSR(const Value: Integer);
    procedure SetFlgRegimeCxComp(const Value: String);
    procedure SetDtaRegimeCxComp(const Value: Tdatetime);
    procedure SetMascSClassifANBID(const Value: String);
    procedure SetPzoRecCPMF(const Value: Integer);
    procedure SetDataIniRecCpmf(const Value: Tdatetime);
    procedure SetFlgContabDiaUtil(const Value: String);
    procedure SetIdRamoForEmi(const Value: Integer);
    procedure SetIDEmpresa(const Value: Integer);
    procedure SetIDEspAcesso(const Value: Integer);
    procedure SetIDModulo(const Value: Integer);
    procedure SetIDUsuario(const Value: Integer);
    procedure SetNomeEmpresa(const Value: String);
    procedure SetNomeModulo(const Value: String);
    //AL_11    
    procedure SetVersaoModulo(const Value: String);
    procedure SetNomeUsuario(const Value: String);
    procedure SetIdPatrocinadora(const Value: Integer);
    procedure SetIdPlanoPrevContab(const Value: Integer);
    procedure SetPlanPrevCtbPatr(const Value: String);
    procedure SetIdPlanPrevCtbPatr(const Value: Integer);
    procedure SetIdTipoInvest(const Value: Integer);
    procedure SetIdMotBloqPenFdo(const Value: Integer);

    //AL_8
    procedure SetIntFinContabBMF(const Value: String);
    procedure SetIntFinContabFDC(const Value: String);
    procedure SetIntFinContabFIM(const Value: String);
    procedure SetIntFinContabFIP(const Value: String);
    procedure SetIntFinContabFRF(const Value: String);
    procedure SetIntFinContabFRV(const Value: String);
    procedure SetIntFinContabRF(const Value: String);
    procedure SetIntFinContabRV(const Value: String);
    procedure SetIdCarteiraRF(const Value: Integer);
    //AL_14
    procedure SetIntFinContabOPI(const Value: String);
    //AL_13
    procedure SetFLGEMABERTURAFMI(const Value: String);
    procedure SetIDUSREMABERTURAFMI(const Value: Integer);

   public
      // -----------------  Parametros e Metodos Gerais  ------------------------
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      // -----------------  Parametros e Metodos do Objeto Persistente  ----------------------
      // AL_5
      property IDParamInvest: Integer read FIDParamInvest write SetIDParamInvest;
      property Logo: TImage read FLogo write SetLogo;
      property DataUltFech: TdateTime read FDataUltFech write SetDataUltFech;
      property MascSetorEmissor: String read FMascSetorEmissor write SetMascSetorEmissor;
      property MoeCodigo: Integer read FMoeCodigo write SetMoeCodigo;
      property MascClassifInv: String read FMascClassifInv write SetMascClassifInv;
      property VlrDiverg: Real read FVlrDiverg write SetVlrDiverg;
      property VlrCotaIniCart: Real read FVlrCotaIniCart write SetVlrCotaIniCart;
      property FlgOrdMovInv: String read FFlgOrdMovInv write SetFlgOrdMovInv;
      property PercPuOrdMovInv: Real read FPercPuOrdMovInv write SetPercPuOrdMovInv;
      property PercImpRenda: Real read FPercImpRenda write SetPercImpRenda;
      property MoedaAtu: Integer read FMoedaAtu write SetMoedaAtu;
      property PercParticEmpr: Real read FPercParticEmpr write SetPercParticEmpr;
      property PercParticRecur: Real read FPercParticRecur write SetPercParticRecur;
      property IdParamPatrLiq: Integer read FIdParamPatrLiq write SetIdParamPatrLiq;
      property TipoMenu: String read FTipoMenu write SetTipoMenu;
      property DataUltFechRF: TdateTime read FDataUltFechRF write SetDataUltFechRF;
      property IdTipoDespIRApu: Integer read FIdTipoDespIRApu write SetIdTipoDespIRApu;
      property IdTipoDespInvest: Integer read FIdTipoDespInvest write SetIdTipoDespInvest;
      property MoedaGer: Integer read FMoedaGer write SetMoedaGer;
      property FlgProvisionaIRRF: String read FFlgProvisionaIRRF write SetFlgProvisionaIRRF;
      property FlgProvisionaIRRV: String read FFlgProvisionaIRRV write SetFlgProvisionaIRRV;
      property PUCDB: Real read FPUCDB write SetPUCDB;
      property DataMovCDBLIB: TdateTime read FDataMovCDBLIB write SetDataMovCDBLIB;
      //AL_10
      property DataLimCartGer: TDateTime read FDataLimCartGer write SetDataLimCartGer;
      property IdTipoDespIRProv: Integer read FIdTipoDespIRProv write SetIdTipoDespIRProv;
      property MoedaAtulIT: Integer read FMoedaAtulIT write SetMoedaAtulIT;
      property IdPrograma: Integer read FIdPrograma write SetIdPrograma;
      property IdTipoClienteCOR: Integer read FIdTipoClienteCOR write SetIdTipoClienteCOR;
      property IdTipoOperDirInc: Integer read FIdTipoOperDirInc write SetIdTipoOperDirInc;
      property IdTipoOperDirCis: Integer read FIdTipoOperDirCis write SetIdTipoOperDirCis;
      property IdTipoOperDirDes: Integer read FIdTipoOperDirDes write SetIdTipoOperDirDes;
      property IdTipoOperDirGru: Integer read FIdTipoOperDirGru write SetIdTipoOperDirGru;
      property IdTipoOperDirPer: Integer read FIdTipoOperDirPer write SetIdTipoOperDirPer;
      property IdTipoOperDirBon: Integer read FIdTipoOperDirBon write SetIdTipoOperDirBon;
      property IdTipoOperDirDiv: Integer read FIdTipoOperDirDiv write SetIdTipoOperDirDiv;
      property IdTipoOperDirSub: Integer read FIdTipoOperDirSub write SetIdTipoOperDirSub;
      property IdTipoOperDirJur: Integer read FIdTipoOperDirJur write SetIdTipoOperDirJur;
      property IdTipoClienteEMI: Integer read FIdTipoClienteEMI write SetIdTipoClienteEMI;
      property IdTipoClienteCus: Integer read FIdTipoClienteCus write SetIdTipoClienteCus;
      property IdTipoContrRF: Integer read FIdTipoContrRF write SetIdTipoContrRF;
      property IdBVSP: Integer read FIdBVSP write SetIdBVSP;
      property IdTipoInvestidor: Integer read FIdTipoInvestidor write SetIdTipoInvestidor;
      property Idmercado: Integer read FIdmercado write SetIdmercado;
      property IdTipoOperLiqPend: Integer read FIdTipoOperLiqPend write SetIdTipoOperLiqPend;
      property IdBMF: Integer read FIdBMF write SetIdBMF;
      property IdTipoContrFin: Integer read FIdTipoContrFin write SetIdTipoContrFin;
      property DataUltFechFdo: TdateTime read FDataUltFechFdo write SetDataUltFechFdo;
      property DataUltFechBMF: TdateTime read FDataUltFechBMF write SetDataUltFechBMF;
      property IdTpPeriodicidade: Integer read FIdTpPeriodicidade write SetIdTpPeriodicidade;
      property DataUltImpCot: Tdatetime read FDataUltImpCot write SetDataUltImpCot;
      property IdTipoOperDirAlt: Integer read FIdTipoOperDirAlt write SetIdTipoOperDirAlt;
      property IdRamoForCor: Integer read FIdRamoForCor write SetIdRamoForCor;
      property IdRamoForEmi: Integer read FIdRamoForEmi write SetIdRamoForEmi;
      property IdRamoForCus: Integer read FIdRamoForCus write SetIdRamoForCus;
      property FlgLiberaIdLote: String read FFlgLiberaIdLote write SetFlgLiberaIdLote;
      property IdTipoOperDirRes: Integer read FIdTipoOperDirRes write SetIdTipoOperDirRes;
      property FlgUsaSubConta: String read FFlgUsaSubConta write SetFlgUsaSubConta;
      property PercDevRV: Real read FPercDevRV write SetPercDevRV;
      property PercDevBMF: Real read FPercDevBMF write SetPercDevBMF;
      property DiaSemanaCPMF: String read FDiaSemanaCPMF write SetDiaSemanaCPMF;
      property DiasUteisCPMF: Integer read FDiasUteisCPMF write SetDiasUteisCPMF;
      property IdCustoDiaRenFix: Integer read FIdCustoDiaRenFix write SetIdCustoDiaRenFix;
      property IdTipoRegraRV: Integer read FIdTipoRegraRV write SetIdTipoRegraRV;
      property IdTipoRegraRF: Integer read FIdTipoRegraRF write SetIdTipoRegraRF;
      property IdTipoRegraBMF: Integer read FIdTipoRegraBMF write SetIdTipoRegraBMF;
      property FlgImplantaRF: String read FFlgImplantaRF write SetFlgImplantaRF;
      property FlgContabiliza: String read FFlgContabiliza write SetFlgContabiliza;
      property FlgIntCapCar: String read FFlgIntCapCar write SetFlgIntCapCar;
      property IdContraparteRF: Integer read FIdContraparteRF write SetIdContraparteRF;
      property IdAutorizaOrdem: Integer read FIdAutorizaOrdem write SetIdAutorizaOrdem;
      property IdClassePoup: Integer read FIdClassePoup write SetIdClassePoup;
      property FlgEmpAcoes: String read FFlgEmpAcoes write SetFlgEmpAcoes;
      property IdCartEmpAcoes: Integer read FIdCartEmpAcoes write SetIdCartEmpAcoes;
      property IdRegraEmpAcoes: Integer read FIdRegraEmpAcoes write SetIdRegraEmpAcoes;
      property IdMotBloqEmpAC: Integer read FIdMotBloqEmpAC write SetIdMotBloqEmpAC;
      property FlgCartGerenc: String read FFlgCartGerenc write SetFlgCartGerenc;
      property IdIndexPoupanca: Integer read FIdIndexPoupanca write SetIdIndexPoupanca;
      property JurosPoupanca: Integer read FJurosPoupanca write SetJurosPoupanca;
      property IdTipoOperDirMul: Integer read FIdTipoOperDirMul write SetIdTipoOperDirMul;
      property IdOperaMortPrinc: Integer read FIdOperaMortPrinc write SetIdOperaMortPrinc;
      property IdOperIncJuros: Integer read FIdOperIncJuros write SetIdOperIncJuros;
      property IdOperPagtoJuros: Integer read FIdOperPagtoJuros write SetIdOperPagtoJuros;
      property FlgEspecFundo: String read FFlgEspecFundo write SetFlgEspecFundo;
      property FlgCompVarRV: String read FFlgCompVarRV write SetFlgCompVarRV;
      property PrzVencBMF: Integer read FPrzVencBMF write SetPrzVencBMF;
      property PrzVencCFianca: Integer read FPrzVencCFianca write SetPrzVencCFianca;
      property IdTipoRegraFnd: Integer read FIdTipoRegraFnd write SetIdTipoRegraFnd;
      property IdClassPoupBloq: Integer read FIdClassPoupBloq write SetIdClassPoupBloq;
      property IdTipoRegraRent: Integer read FIdTipoRegraRent write SetIdTipoRegraRent;
      property DataMovtoRV: Tdatetime read FDataMovtoRV write SetDataMovtoRV;
      property IdTipoRegraAtuaR: Integer read FIdTipoRegraAtuaR write SetIdTipoRegraAtuaR;
      property FlgPlanPrevCtbPat: String read FFlgPlanPrevCtbPat write SetFlgPlanPrevCtbPat;
      property IdClassNTN: Integer read FIdClassNTN write SetIdClassNTN;
      property IdTipoOperDirREE: Integer read FIdTipoOperDirREE write SetIdTipoOperDirREE;
      property DataUltFechEmp: Tdatetime read FDataUltFechEmp write SetDataUltFechEmp;
      property IdTipoOperDirProv: Integer read FIdTipoOperDirProv write SetIdTipoOperDirProv;
      property IdTipoOperOPCCP: Integer read FIdTipoOperOPCCP write SetIdTipoOperOPCCP;
      property IdTipoOperOpCVD: Integer read FIdTipoOperOpCVD write SetIdTipoOperOpCVD;
      property MoedaEQM: Integer read FMoedaEQM write SetMoedaEQM;
      property STARET: String read FSTARET write SetSTARET;
      property DataUltRet: Tdatetime read FDataUltRet write SetDataUltRet;
      property IdCartOpCIND: Integer read FIdCartOpCIND write SetIdCartOpCIND;
      property IdCartOpC: Integer read FIdCartOpC write SetIdCartOpC;
      property IdMotBloqOpC: Integer read FIdMotBloqOpC write SetIdMotBloqOpC;
      property IdCartaVista: Integer read FIdCartaVista write SetIdCartaVista;
      property DifMaxOpCInd: Real read FDifMaxOpCInd write SetDifMaxOpCInd;
      property IdTipoRegraOpCIN: Integer read FIdTipoRegraOpCIN write SetIdTipoRegraOpCIN;
      property IdTipoRegraEmpAC: Integer read FIdTipoRegraEmpAC write SetIdTipoRegraEmpAC;
      property IdTipoDespDVCOR: Integer read FIdTipoDespDVCOR write SetIdTipoDespDVCOR;
      property IdGrupoRegraInv: Integer read FIdGrupoRegraInv write SetIdGrupoRegraInv;
      property FlgDemo: String read FFlgDemo write SetFlgDemo;
      property FlgIntFinLiq: String read FFlgIntFinLiq write SetFlgIntFinLiq;
      property DtMudaCPMF: TdateTime read FDtMudaCPMF write SetDtMudaCPMF;
      property FlgRecPagRV: String read FFlgRecPagRV write SetFlgRecPagRV;
      property IdTipoOperDirDSU: Integer read FIdTipoOperDirDSU write SetIdTipoOperDirDSU;
      property DifResgFundos: Integer read FDifResgFundos write SetDifResgFundos;
      property FlgPoupaPropDia: String read FFlgPoupaPropDia write SetFlgPoupaPropDia;
      property IdTipoOperRFRAC: Integer read FIdTipoOperRFRAC write SetIdTipoOperRFRAC;
      property IdTipoOperDirDSA: Integer read FIdTipoOperDirDSA write SetIdTipoOperDirDSA;
      property IdTipoOperDirDSR: Integer read FIdTipoOperDirDSR write SetIdTipoOperDirDSR;
      property FlgRegimeCxComp: String read FFlgRegimeCxComp write SetFlgRegimeCxComp;
      property DtaRegimeCxComp: Tdatetime read FDtaRegimeCxComp write SetDtaRegimeCxComp;
      property MascSClassifANBID: String read FMascSClassifANBID write SetMascSClassifANBID;
      property PzoRecCPMF: Integer read FPzoRecCPMF write SetPzoRecCPMF;
      property DataIniRecCpmf: Tdatetime read FDataIniRecCpmf write SetDataIniRecCpmf;
      property FlgContabDiaUtil: String read FFlgContabDiaUtil write SetFlgContabDiaUtil;
      //AL_7
      property IdMotBloqPenFdo : Integer read FIdMotBloqPenFdo write SetIdMotBloqPenFdo;
      //AL_8
      property IntFinContabRF:  String read FIntFinContabRF  write SetIntFinContabRF;
      property IntFinContabRV:  String read FIntFinContabRV  write SetIntFinContabRV;
      property IntFinContabFRF: String read FIntFinContabFRF write SetIntFinContabFRF;
      property IntFinContabFRV: String read FIntFinContabFRV write SetIntFinContabFRV;
      property IntFinContabBMF: String read FIntFinContabBMF write SetIntFinContabBMF;
      property IntFinContabFIM: String read FIntFinContabFIM write SetIntFinContabFIM;
      property IntFinContabFDC: String read FIntFinContabFDC write SetIntFinContabFDC;
      property IntFinContabFIP: String read FIntFinContabFIP write SetIntFinContabFIP;
      //AL_14
      property IntFinContabOPI: String read FIntFinContabOPI write SetIntFinContabOPI;

      //AL_9
      property IdCarteiraRF : Integer read FIdCarteiraRF write SetIdCarteiraRF;


      // -----------------  Parametros Persistentes do Sistema --------------------------------
      property  IDEmpresa     : Integer read FIDEmpresa write SetIDEmpresa;
      property  IDUsuario     : Integer read FIDUsuario write SetIDUsuario;
      property  IDEspAcesso   : Integer read FIDEspAcesso write SetIDEspAcesso;
      property  IDModulo      : Integer read FIDModulo write SetIDModulo;
      property  NomeEmpresa   : String read FNomeEmpresa write SetNomeEmpresa;
      property  NomeUsuario   : String read FNomeUsuario write SetNomeUsuario;
      property  NomeModulo    : String read FNomeModulo write SetNomeModulo;
      //AL_11
      property  VersaoModulo  : String read FVersaoModulo write SetVersaoModulo;

      //AL_6
      // -----------------  Parametros Persistentes do Usuario -------------------------------
      property IdPlanPrevCtbPatr: Integer read FIdPlanPrevCtbPatr write SetIdPlanPrevCtbPatr;
      property PlanPrevCtbPatr: String read FPlanPrevCtbPatr write SetPlanPrevCtbPatr;
      property IdPatrocinadora: Integer read FIdPatrocinadora write SetIdPatrocinadora;
      property IdPlanoPrevContab: Integer read FIdPlanoPrevContab write SetIdPlanoPrevContab;
      property IdTipoInvest: Integer read FIdTipoInvest write SetIdTipoInvest;

      //AL_13
      Property IDUSREMABERTURAFMI: Integer read FIDUSREMABERTURAFMI write SetIDUSREMABERTURAFMI;
      Property FLGEMABERTURAFMI: String read FFLGEMABERTURAFMI write SetFLGEMABERTURAFMI;

      // -----------------  Parametros e Metodos da Tela de Cadastro  ------------------------
      property CdsParamInvest : TClientDataSet  read FCdsParamInvest write FCdsParamInvest;
      property DbParamInvest  : TDbParamInvest  read FDbParamInvest  write SetDbParamInvest;

      function ListParamInvest(iIDParamInvest: Integer = -1): OleVariant;
      function AplicaAtualParamInvest: Boolean;

      // -----------------  Método de carga dos parâmetros -----------------------------------
      function GetParamsInvest(iIdEmpresa : Integer = -1): Boolean;

   protected
      procedure DoChangeDataBase; override;

   end;

//AL_5
Var CtrlPInv: TCtrlParamInvest;

implementation

{TCtrlParamInvest}

constructor TCtrlParamInvest.Create;
begin
   inherited;
   FDbParamInvest  := TDbParamInvest.Create(Self);
   //AL_5
   FLogo := TImage.Create(nil);
end;

destructor TCtrlParamInvest.Destroy;
begin
   //AL_5
   FreeAndNil(FLogo);

   FreeAndNil(FDbParamInvest);
   if IsAppServer then
      FreeAndNil(FCdsParamInvest);
   inherited;
end;

procedure TCtrlParamInvest.OnCreateAppServer;
begin
   inherited;
   FCdsParamInvest := TClientDataSet.Create(nil);
end;

procedure TCtrlParamInvest.DoChangeDataBase;
begin
   inherited;
   FDbParamInvest.DataBaseName := DataBaseName;
end;

function TCtrlParamInvest.ListParamInvest(iIDParamInvest: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := 'SELECT * FROM PARAMINVEST';

   Result := GetDataPacket(sSql);
end;

function TCtrlParamInvest.AplicaAtualParamInvest: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_6
       Result := Connection.AppServer.AplicaAtualParamInvest;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
    else
    begin
       try
          StartTransaction;

          Result := ApplyCds(CdsParamInvest,DbParamInvest,[],[]);
          if not Result then
             Exception.Create(DbParamInvest.MessageInfo);
          Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

procedure TCtrlParamInvest.SetDbParamInvest(const Value: TDbParamInvest);
begin
  FDbParamInvest := Value;
end;

function TCtrlParamInvest.GetParamsInvest(iIdEmpresa : Integer = -1): Boolean;
var
   sSQL : String;
   Cds : TCMClientDataSet;
begin
   Result := True;
   try
      //AL_8 - Ini
      try
         Cds := TCMClientDataSet.Create(Nil);
         _DiasUteis := TDiasUteis.Create;
         _DiasUteis.InitializeAs(Padroes);

         // Carrega o Logotipo da Empresa
         Cds.Data := GetDataPacket('SELECT IMAGEM ' +#13+
                                    '  FROM IMAGENS I, PESSOA P ' +#13+
                                    ' WHERE I.IDIMAGEM = P.IDIMAGEM ' +#13+
                                    '   AND P.IDPESSOA = ' + IntToStr(iIdEmpresa) );
         //AL_5
         if not Cds.FieldByName('IMAGEM').IsNull then
            FLogo.Picture.Assign(Cds.FieldByName('IMAGEM'));

         Cds.Data := ListParamInvest(iIdEmpresa);

         if not Cds.IsEmpty then
         begin
            //AL_5
            FDataUltFech := Cds.FieldByName('DATAULTFECH').AsDateTime;
            FIDParamInvest := Cds.FieldByName('IDPARAMINVEST').AsInteger;
            FMascSetorEmissor := Cds.FieldByName('MASCSETOREMISSOR').AsString;
            FMoeCodigo := Cds.FieldByName('MOECODIGO').AsInteger;
            FMascClassifInv := Cds.FieldByName('MASCCLASSIFINV').AsString;
            FVlrDiverg := Cds.FieldByName('VLRDIVERG').AsFloat;
            FVlrCotaIniCart := Cds.FieldByName('VLRCOTAINICART').AsFloat;
            FFlgOrdMovInv := Cds.FieldByName('FLGORDMOVINV').AsString;
            FPercPuOrdMovInv := Cds.FieldByName('PERCPUORDMOVINV').AsFloat;
            FPercImpRenda := Cds.FieldByName('PERCIMPRENDA').AsFloat;
            FMoedaAtu := Cds.FieldByName('MOEDAATU').AsInteger;
            FPercParticEmpr := Cds.FieldByName('PERCPARTICEMPR').AsFloat;
            FPercParticRecur := Cds.FieldByName('PERCPARTICRECUR').AsFloat;
            FIdParamPatrLiq :=  Cds.FieldByName('IDPARAMPATRLIQ').AsInteger;
            FTipoMenu := Cds.FieldByName('TIPOMENU').AsString;
            FDataUltFechRF := Cds.FieldByName('DATAULTFECHRF').AsDateTime;
            FIdTipoDespIRApu := Cds.FieldByName('IDTIPODESPIRAPU').AsInteger;
            FIdTipoDespInvest := Cds.FieldByName('IDTIPODESPINVEST').AsInteger;
            FMoedaGer := Cds.FieldByName('MOEDAGER').AsInteger;
            FFlgProvisionaIRRF := Cds.FieldByName('FLGPROVISIONAIRRF').AsString;
            FFlgProvisionaIRRV := Cds.FieldByName('FLGPROVISIONAIRRV').AsString;
            FPUCDB := Cds.FieldByName('PUCDB').AsFloat;
            FDataMovCDBLIB := Cds.FieldByName('DATAMOVCDBLIB').AsDateTime;
            //AL_10
            FDataLimCartGer := Cds.FieldByName('DATAMOVCDBLIB').AsDateTime;
            FIdTipoDespIRProv := Cds.FieldByName('IDTIPODESPIRPROV').AsInteger;
            FMoedaAtulIT := Cds.FieldByName('MOEDAATULIT').AsInteger;
            FIdPrograma :=  Cds.FieldByName('IDPROGRAMA').AsInteger;
            FIdTipoClienteCOR :=  Cds.FieldByName('IDTIPOCLIENTECOR').AsInteger;
            FIdTipoOperDirInc := Cds.FieldByName('IDTIPOOPERDIRINC').AsInteger;
            FIdTipoOperDirCis := Cds.FieldByName('IDTIPOOPERDIRCIS').AsInteger;
            FIdTipoOperDirDes := Cds.FieldByName('IDTIPOOPERDIRDES').AsInteger;
            FIdTipoOperDirGru := Cds.FieldByName('IDTIPOOPERDIRGRU').AsInteger;
            FIdTipoOperDirPer := Cds.FieldByName('IDTIPOOPERDIRPER').AsInteger;
            FIdTipoOperDirBon := Cds.FieldByName('IDTIPOOPERDIRBON').AsInteger;
            FIdTipoOperDirDiv := Cds.FieldByName('IDTIPOOPERDIRDIV').AsInteger;
            FIdTipoOperDirSub := Cds.FieldByName('IDTIPOOPERDIRSUB').AsInteger;
            FIdTipoOperDirJur := Cds.FieldByName('IDTIPOOPERDIRJUR').AsInteger;
            FIdTipoClienteEMI := Cds.FieldByName('IDTIPOCLIENTEEMI').AsInteger;
            FIdTipoClienteCus := Cds.FieldByName('IDTIPOCLIENTECUS').AsInteger;
            FIdTipoContrRF := Cds.FieldByName('IDTIPOCONTRRF').AsInteger;
            FIdBVSP := Cds.FieldByName('IDBVSP').AsInteger;
            FIdTipoInvestidor := Cds.FieldByName('IDTIPOINVESTIDOR').AsInteger;
            FIdmercado := Cds.FieldByName('IDMERCADO').AsInteger;
            FIdTipoOperLiqPend := Cds.FieldByName('IDTIPOOPERLIQPEND').AsInteger;
            FIdBMF := Cds.FieldByName('IDBMF').AsInteger;
            FIdTipoContrFin := Cds.FieldByName('IDTIPOCONTRFIN').AsInteger;
            FDataUltFechFdo := Cds.FieldByName('DATAULTFECHFDO').AsDateTime;
            FDataUltFechBMF := Cds.FieldByName('DATAULTFECHBMF').AsDateTime;
            FIdTpPeriodicidade := Cds.FieldByName('IDTPPERIODICIDADE').AsInteger;
            FDataUltImpCot := Cds.FieldByName('DATAULTIMPCOT').AsDateTime;
            FIdTipoOperDirAlt := Cds.FieldByName('IDTIPOOPERDIRALT').AsInteger;
            FIdRamoForCor := Cds.FieldByName('IDRAMOFORCOR').AsInteger;
            FIdRamoForEmi := Cds.FieldByName('IDRAMOFOREMI').AsInteger;
            FIdRamoForCus := Cds.FieldByName('IDRAMOFORCUS').AsInteger;
            FFlgLiberaIdLote := Cds.FieldByName('FLGLIBERAIDLOTE').AsString;
            FIdTipoOperDirRes := Cds.FieldByName('IDTIPOOPERDIRRES').AsInteger;
            FFlgUsaSubConta := Cds.FieldByName('FLGUSASUBCONTA').AsString;
            FPercDevRV := Cds.FieldByName('PERCDEVRV').AsFloat;
            FPercDevBMF := Cds.FieldByName('PERCDEVBMF').AsFloat;
            FDiaSemanaCPMF := Cds.FieldByName('DIASEMANACPMF').AsString;
            FDiasUteisCPMF := Cds.FieldByName('DIASUTEISCPMF').AsInteger;
            FIdCustoDiaRenFix := Cds.FieldByName('IDCUSTODIARENFIX').AsInteger;
            FIdTipoRegraRV := Cds.FieldByName('IDTIPOREGRARV').AsInteger;
            FIdTipoRegraRF := Cds.FieldByName('IDTIPOREGRARF').AsInteger;
            FIdTipoRegraBMF := Cds.FieldByName('IDTIPOREGRABMF').AsInteger;
            FFlgImplantaRF := Cds.FieldByName('FLGIMPLANTRF').AsString;
            FFlgContabiliza := Cds.FieldByName('FLGCONTABILIZA').AsString;
            FFlgIntCapCar := Cds.FieldByName('FLGINTCAPCAR').AsString;
            FIdContraparteRF := Cds.FieldByName('IDCONTRAPARTERF').AsInteger;
            FIdAutorizaOrdem := Cds.FieldByName('IDAUTORIZAORDEM').AsInteger;
            FIdClassePoup := Cds.FieldByName('IDCLASSETIT').AsInteger;
            FFlgEmpAcoes := Cds.FieldByName('FLGEMPACOES').AsString;
            FIdCartEmpAcoes := Cds.FieldByName('IDCARTEMPACOES').AsInteger;
            FIdRegraEmpAcoes := Cds.FieldByName('IDREGRAEMPACOES').AsInteger;
            FIdMotBloqEmpAC := Cds.FieldByName('IDMOTBLOQEMPAC').AsInteger;
            FFlgCartGerenc := Cds.FieldByName('FLGCARTGERENC').AsString;
            FIdIndexPoupanca := Cds.FieldByName('IDINDEXPOUPANCA').AsInteger;
            FJurosPoupanca := Cds.FieldByName('JUROSPOUPANCA').AsInteger;
            FIdTipoOperDirMul := Cds.FieldByName('IDTIPOOPERDIRMUL').AsInteger;
            FIdOperaMortPrinc := Cds.FieldByName('IDOPERAMORTPRINC').AsInteger;
            FIdOperIncJuros := Cds.FieldByName('IDOPERINCJUROS').AsInteger;
            FIdOperPagtoJuros := Cds.FieldByName('IDOPERPAGTOJUROS').AsInteger;
            FFlgEspecFundo := Cds.FieldByName('FLGESPECFUNDO').AsString;
            FFlgCompVarRV := Cds.FieldByName('FLGCOMPVARRV').AsString;
            FPrzVencBMF := Cds.FieldByName('PRZVENCBMF').AsInteger;
            FPrzVencCFianca := Cds.FieldByName('PRZVENCCFIANCA').AsInteger;
            FIdTipoRegraFnd := Cds.FieldByName('IDTIPOREGRAFND').AsInteger;
            FIdClassPoupBloq := Cds.FieldByName('IDCLASSPOUPBLOQ').AsInteger;
            FIdTipoRegraRent := Cds.FieldByName('IDTIPOREGRARENT').AsInteger;
            FDataMovtoRV := _DiasUteis.PrimeiroDiaUtilPosterior(Cds.FieldByName('DATAULTFECH').AsDateTime,-1,1,'',True,False,False);
            FIdTipoRegraAtuaR := Cds.FieldByName('IDTIPOREGRAATUAR').AsInteger;
            FFlgPlanPrevCtbPat := Cds.FieldByName('FLGPLANPREVCTBPAT').AsString;
            FIdClassNTN := Cds.FieldByName('IDCLASSNTN').AsInteger;
            FIdTipoOperDirREE := Cds.FieldByName('IDTIPOOPERDIRREE').AsInteger;
            FDataUltFechEmp := Cds.FieldByName('DATAULTFECHEMP').AsDateTime;
            FIdTipoOperDirProv := Cds.FieldByName('IDTIPOOPERDIRPROV').AsInteger;
            FIdTipoOperOPCCP := Cds.FieldByName('IDTIPOOPEROPCCP').AsInteger;
            FIdTipoOperOpCVD := Cds.FieldByName('IDTIPOOPEROPCVD').AsInteger;
            FMoedaEQM := Cds.FieldByName('MOEDAEQM').AsInteger;
            FSTARET := Cds.FieldByName('STARET').AsString;
            FDataUltRet := Cds.FieldByName('DATAULTRET').AsDateTime;
            FIdCartOpCIND := Cds.FieldByName('IDCARTOPCIND').AsInteger;
            FIdCartOpC := Cds.FieldByName('IDCARTOPC').AsInteger;
            FIdMotBloqOpC := Cds.FieldByName('IDMOTBLOQOPC').AsInteger;
            FIdCartaVista := Cds.FieldByName('IDCARTAVISTA').AsInteger;
            FDifMaxOpCInd := Cds.FieldByName('DIFMAXOPCIND').AsFloat;
            FIdTipoRegraOpCIN := Cds.FieldByName('IDTIPOREGRAOPCIN').AsInteger;
            FIdTipoRegraEmpAC := Cds.FieldByName('IDTIPOREGRAEMPAC').AsInteger;
            FIdTipoDespDVCOR := Cds.FieldByName('IDTIPODESPDVCOR').AsInteger;
            FIdGrupoRegraInv :=  Cds.FieldByName('IDGRUPOREGRAINV').AsInteger;
            FFlgDemo := Cds.FieldByName('FLGDEMO').AsString;
            FFlgIntFinLiq := Cds.FieldByName('FLGINTFINLIQ').AsString;
            FDtMudaCPMF := Cds.FieldByName('DTMUDACPMF').AsDateTime;
            FFlgRecPagRV := Cds.FieldByName('FLGRECPAGRV').AsString;
            FIdTipoOperDirDSU:= Cds.FieldByName('IDTIPOOPERDIRDSU').AsInteger;
            FDifResgFundos := Cds.FieldByName('DIFRESGFUNDOS').AsInteger;
            FFlgPoupaPropDia := Cds.FieldByName('FLGPOUPAPROPDIA').AsString;
            FIdTipoOperRFRAC := Cds.FieldByName('IDTIPOOPERRFRAC').AsInteger;
            FIdTipoOperDirDSA :=  Cds.FieldByName('IDTIPOOPERDIRDSA').AsInteger;
            FIdTipoOperDirDSR := Cds.FieldByName('IDTIPOOPERDIRDSR').AsInteger;
            FFlgRegimeCxComp := Cds.FieldByName('FLGREGIMECXCOMP').AsString;
            FDtaRegimeCxComp := Cds.FieldByName('DTAREGIMECXCOMP').AsDateTime;
            FMascSClassifANBID := Cds.FieldByName('MASCSCLASSIFANBID').AsString;
            FPzoRecCPMF := Cds.FieldByName('PZORECCPMF').AsInteger;
            FDataIniRecCpmf := Cds.FieldByName('DATAINIRECCPMF').AsDateTime;
            FFlgContabDiaUtil := Cds.FieldByName('FLGCONTABDIAUTIL').AsString;
            FIdPlanPrevCtbPatr := Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            //AL_7
            FIdMotBloqPenFdo  := Cds.FieldByName('IDMOTBLOQPENFDO').AsInteger;
            //AL_8
            IntFinContabRF  := Cds.FieldByName('FLGINTCONTABRF').AsString;
            IntFinContabRV  := Cds.FieldByName('FLGINTCONTABRV').AsString;
            IntFinContabFRF := Cds.FieldByName('FLGINTCONTABFRF').AsString;
            IntFinContabFRV := Cds.FieldByName('FLGINTCONTABFRV').AsString;
            IntFinContabBMF := Cds.FieldByName('FLGINTCONTABBMF').AsString;
            IntFinContabFIM := Cds.FieldByName('FLGINTCONTABFIM').AsString;
            IntFinContabFDC := Cds.FieldByName('FLGINTCONTABFDC').AsString;
            IntFinContabFIP := Cds.FieldByName('FLGINTCONTABFIP').AsString;
            //AL_14
            IntFinContabOPI := Cds.FieldByName('FLGINTCONTABOPI').AsString;
            //AL_9
            FIdCarteiraRF := Cds.FieldByName('IDCARTEIRARF').AsInteger;

            //AL_13
            FIDUSREMABERTURAFMI := Cds.FieldByName('IDUSREMABERTURAFMI').AsInteger;
            FFLGEMABERTURAFMI := Cds.FieldByName('FLGEMABERTURAFMI').AsString;
         end
         else
            Raise Exception.Create('Não existem parâmetros cadastrados');
      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
      //AL_8 - Fim
   finally
      //AL_15
      FreeAndNil(Cds);
      FreeAndNil(_DiasUteis);
      //AL_3
      Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');
   end;
end;

// AL_5
procedure TCtrlParamInvest.SetDataUltFech(const Value: TdateTime);
begin
  FDataUltFech := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIDParamInvest(const Value: Integer);
begin
  FIDParamInvest := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetLogo(const Value: TImage);
begin
  FLogo.Picture.Assign(Value);
end;

// AL_5
procedure TCtrlParamInvest.SetMascSetorEmissor(const Value: String);
begin
  FMascSetorEmissor := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetMoeCodigo(const Value: Integer);
begin
  FMoeCodigo := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetMascClassifInv(const Value: String);
begin
  FMascClassifInv := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetVlrDiverg(const Value: Real);
begin
  FVlrDiverg := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetVlrCotaIniCart(const Value: Real);
begin
  FVlrCotaIniCart := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgOrdMovInv(const Value: String);
begin
  FFlgOrdMovInv := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetPercPuOrdMovInv(const Value: Real);
begin
  FPercPuOrdMovInv := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetPercImpRenda(const Value: Real);
begin
  FPercImpRenda := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetMoedaAtu(const Value: Integer);
begin
  FMoedaAtu := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetPercParticEmpr(const Value: Real);
begin
  FPercParticEmpr := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetPercParticRecur(const Value: Real);
begin
  FPercParticRecur := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdParamPatrLiq(const Value: Integer);
begin
  FIdParamPatrLiq := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetTipoMenu(const Value: String);
begin
  FTipoMenu := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetDataUltFechRF(const Value: TdateTime);
begin
  FDataUltFechRF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoDespIRApu(const Value: Integer);
begin
  FIdTipoDespIRApu := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoDespInvest(const Value: Integer);
begin
  FIdTipoDespInvest := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetMoedaGer(const Value: Integer);
begin
  FMoedaGer := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgProvisionaIRRF(const Value: String);
begin
  FFlgProvisionaIrRF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgProvisionaIRRV(const Value: String);
begin
  FFlgProvisionaIRRV := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetPUCDB(const Value: Real);
begin
  FPUCDB := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetDataMovCDBLIB(const Value: TdateTime);
begin
  FDataMovCDBLIB := Value;
end;

//AL_10
procedure TCtrlParamInvest.SetDataLimCartGer(const Value: TDateTime);
begin
  FDataLimCartGer := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoDespIRProv(const Value: Integer);
begin
  FIdTipoDespIRProv := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetMoedaAtulIT(const Value: Integer);
begin
  FMoedaAtulIT := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdPrograma(const Value: Integer);
begin
  FIdPrograma := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoClienteCOR(const Value: Integer);
begin
  FIdTipoClienteCOR := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirInc(const Value: Integer);
begin
  FIdTipoOperDirInc := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirCis(const Value: Integer);
begin
  FIdTipoOperDirCis := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirDes(const Value: Integer);
begin
  FIdTipoOperDirDes := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirGru(const Value: Integer);
begin
  FIdTipoOperDirGru := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirPer(const Value: Integer);
begin
  FIdTipoOperDirPer := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirBon(const Value: Integer);
begin
  FIdTipoOperDirBon := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirDiv(const Value: Integer);
begin
  FIdTipoOperDirDiv := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirSub(const Value: Integer);
begin
  FIdTipoOperDirSub := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirJur(const Value: Integer);
begin
  FIdTipoOperDirJur := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoClienteEMI(const Value: Integer);
begin
  FIdTipoClienteEMI := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoClienteCus(const Value: Integer);
begin
  FIdTipoClienteCus := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoContrRF(const Value: Integer);
begin
  FIdTipoContrRF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdBVSP(const Value: Integer);
begin
  FIdBVSP := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoInvestidor(const Value: Integer);
begin
  FIdTipoInvestidor := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdmercado(const Value: Integer);
begin
  FIdmercado := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperLiqPend(const Value: Integer);
begin
  FIdTipoOperLiqPend := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdBMF(const Value: Integer);
begin
  FIdBMF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoContrFin(const Value: Integer);
begin
  FIdTipoContrFin := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetDataUltFechFdo(const Value: TdateTime);
begin
  FDataUltFechFdo := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetDataUltFechBMF(const Value: TdateTime);
begin
  FDataUltFechBMF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTpPeriodicidade(const Value: Integer);
begin
  FIdTpPeriodicidade := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetDataUltImpCot(const Value: Tdatetime);
begin
  FDataUltImpCot := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirAlt(const Value: Integer);
begin
  FIdTipoOperDirAlt := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdRamoForCor(const Value: Integer);
begin
  FIdRamoForCor := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdRamoForCus(const Value: Integer);
begin
  FIdRamoForCus := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgLiberaIdLote(const Value: String);
begin
  FFlgLiberaIdLote := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoOperDirRes(const Value: Integer);
begin
  FIdTipoOperDirRes := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgUsaSubConta(const Value: String);
begin
  FFlgUsaSubConta := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetPercDevRV(const Value: Real);
begin
  FPercDevRV := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetPercDevBMF(const Value: Real);
begin
  FPercDevBMF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetDiaSemanaCPMF(const Value: String);
begin
  FDiaSemanaCPMF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetDiasUteisCPMF(const Value: Integer);
begin
  FDiasUteisCPMF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdCustoDiaRenFix(const Value: Integer);
begin
  FIdCustoDiaRenFix := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoRegraRV(const Value: Integer);
begin
  FIdTipoRegraRV := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoRegraRF(const Value: Integer);
begin
  FIdTipoRegraRF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdTipoRegraBMF(const Value: Integer);
begin
  FIdTipoRegraBMF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgImplantaRF(const Value: String);
begin
  FFlgImplantaRF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgContabiliza(const Value: String);
begin
  FFlgContabiliza := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgIntCapCar(const Value: String);
begin
  FFlgIntCapCar := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdContraparteRF(const Value: Integer);
begin
  FIdContraparteRF := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdAutorizaOrdem(const Value: Integer);
begin
  FIdAutorizaOrdem := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdClassePoup(const Value: Integer);
begin
  FIdClassePoup := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgEmpAcoes(const Value: String);
begin
  FFlgEmpAcoes := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdCartEmpAcoes(const Value: Integer);
begin
  FIdCartEmpAcoes := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdRegraEmpAcoes(const Value: Integer);
begin
  FIdRegraEmpAcoes := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdMotBloqEmpAC(const Value: Integer);
begin
  FIdMotBloqEmpAC := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetFlgCartGerenc(const Value: String);
begin
  FFlgCartGerenc := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdIndexPoupanca(const Value: Integer);
begin
  FIdIndexPoupanca := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetJurosPoupanca(const Value: Integer);
begin
  FJurosPoupanca := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperDirMul(const Value: Integer);
begin
  FIdTipoOperDirMul := Value;
end;

procedure TCtrlParamInvest.SetIdOperaMortPrinc(const Value: Integer);
begin
  FIdOperaMortPrinc := Value;
end;

procedure TCtrlParamInvest.SetIdOperIncJuros(const Value: Integer);
begin
  FIdOperIncJuros := Value;
end;

procedure TCtrlParamInvest.SetIdOperPagtoJuros(const Value: Integer);
begin
  FIdOperPagtoJuros := Value;
end;

procedure TCtrlParamInvest.SetFlgEspecFundo(const Value: String);
begin
  FFlgEspecFundo := Value;
end;

procedure TCtrlParamInvest.SetFlgCompVarRV(const Value: String);
begin
  FFlgCompVarRV := Value;
end;

procedure TCtrlParamInvest.SetPrzVencBMF(const Value: Integer);
begin
  FPrzVencBMF := Value;
end;

procedure TCtrlParamInvest.SetPrzVencCFianca(const Value: Integer);
begin
  FPrzVencCFianca := Value;
end;

procedure TCtrlParamInvest.SetIdTipoRegraFnd(const Value: Integer);
begin
  FIdTipoRegraFnd := Value;
end;

procedure TCtrlParamInvest.SetIdClassPoupBloq(const Value: Integer);
begin
  FIdClassPoupBloq := Value;
end;

procedure TCtrlParamInvest.SetIdTipoRegraRent(const Value: Integer);
begin
  FIdTipoRegraRent := Value;
end;

procedure TCtrlParamInvest.SetDataMovtoRV(const Value: Tdatetime);
begin
  FDataMovtoRV := Value;
end;

procedure TCtrlParamInvest.SetIdTipoRegraAtuaR(const Value: Integer);
begin
  FIdTipoRegraAtuaR := Value;
end;

procedure TCtrlParamInvest.SetFlgPlanPrevCtbPat(const Value: String);
begin
  FFlgPlanPrevCtbPat := Value;
end;

procedure TCtrlParamInvest.SetIdClassNTN(const Value: Integer);
begin
  FIdClassNTN := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperDirREE(const Value: Integer);
begin
  FIdTipoOperDirREE := Value;
end;

procedure TCtrlParamInvest.SetDataUltFechEmp(const Value: Tdatetime);
begin
  FDataUltFechEmp := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperDirProv(const Value: Integer);
begin
  FIdTipoOperDirProv := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperOPCCP(const Value: Integer);
begin
  FIdTipoOperOPCCP := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperOpCVD(const Value: Integer);
begin
  FIdTipoOperOpCVD := Value;
end;

procedure TCtrlParamInvest.SetMoedaEQM(const Value: Integer);
begin
  FMoedaEQM := Value;
end;

procedure TCtrlParamInvest.SetSTARET(const Value: String);
begin
  FSTARET := Value;
end;

procedure TCtrlParamInvest.SetDataUltRet(const Value: Tdatetime);
begin
  FDataUltRet := Value;
end;

procedure TCtrlParamInvest.SetIdCartOpCIND(const Value: Integer);
begin
  FIdCartOpCIND := Value;
end;

procedure TCtrlParamInvest.SetIdMotBloqOpC(const Value: Integer);
begin
  FIdMotBloqOpC := Value;
end;

procedure TCtrlParamInvest.SetIdCartOpC(const Value: Integer);
begin
  FIdCartOpC := Value;
end;

procedure TCtrlParamInvest.SetIdCartaVista(const Value: Integer);
begin
  FIdCartaVista := Value;
end;

procedure TCtrlParamInvest.SetDifMaxOpCInd(const Value: Real);
begin
  FDifMaxOpCInd := Value;
end;

procedure TCtrlParamInvest.SetIdTipoRegraOpCIN(const Value: Integer);
begin
  FIdTipoRegraOpCIN := Value;
end;

procedure TCtrlParamInvest.SetIdTipoRegraEmpAC(const Value: Integer);
begin
  FIdTipoRegraEmpAC := Value;
end;

procedure TCtrlParamInvest.SetIdTipoDespDVCOR(const Value: Integer);
begin
  FIdTipoDespDVCOR := Value;
end;

procedure TCtrlParamInvest.SetIdGrupoRegraInv(const Value: Integer);
begin
  FIdGrupoRegraInv := Value;
end;

procedure TCtrlParamInvest.SetFlgDemo(const Value: String);
begin
  FFlgDemo := Value;
end;

procedure TCtrlParamInvest.SetFlgIntFinLiq(const Value: String);
begin
  FFlgIntFinLiq := Value;
end;

procedure TCtrlParamInvest.SetDtMudaCPMF(const Value: TdateTime);
begin
  FDtMudaCPMF := Value;
end;

procedure TCtrlParamInvest.SetFlgRecPagRV(const Value: String);
begin
  FFlgRecPagRV := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperDirDSU(const Value: Integer);
begin
  FIdTipoOperDirDSU := Value;
end;

procedure TCtrlParamInvest.SetDifResgFundos(const Value: Integer);
begin
  FDifResgFundos := Value;
end;

procedure TCtrlParamInvest.SetFlgPoupaPropDia(const Value: String);
begin
  FFlgPoupaPropDia := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperRFRAC(const Value: Integer);
begin
  FIdTipoOperRFRAC := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperDirDSA(const Value: Integer);
begin
  FIdTipoOperDirDSA := Value;
end;

procedure TCtrlParamInvest.SetIdTipoOperDirDSR(const Value: Integer);
begin
  FIdTipoOperDirDSR := Value;
end;

procedure TCtrlParamInvest.SetFlgRegimeCxComp(const Value: String);
begin
  FFlgRegimeCxComp := Value;
end;

procedure TCtrlParamInvest.SetDtaRegimeCxComp(const Value: Tdatetime);
begin
  FDtaRegimeCxComp := Value;
end;

procedure TCtrlParamInvest.SetMascSClassifANBID(const Value: String);
begin
  FMascSClassifANBID := Value;
end;

procedure TCtrlParamInvest.SetPzoRecCPMF(const Value: Integer);
begin
  FPzoRecCPMF := Value;
end;

procedure TCtrlParamInvest.SetDataIniRecCpmf(const Value: Tdatetime);
begin
  FDataIniRecCpmf := Value;
end;

procedure TCtrlParamInvest.SetFlgContabDiaUtil(const Value: String);
begin
  FFlgContabDiaUtil := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIdRamoForEmi(const Value: Integer);
begin
  FIdRamoForEmi := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIDEmpresa(const Value: Integer);
begin
  FIDEmpresa := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIDEspAcesso(const Value: Integer);
begin
  FIDEspAcesso := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIDModulo(const Value: Integer);
begin
  FIDModulo := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetIDUsuario(const Value: Integer);
begin
  FIDUsuario := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetNomeEmpresa(const Value: String);
begin
  FNomeEmpresa := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetNomeModulo(const Value: String);
begin
  FNomeModulo := Value;
end;

// AL_5
procedure TCtrlParamInvest.SetNomeUsuario(const Value: String);
begin
  FNomeUsuario := Value;
end;

//AL_6
procedure TCtrlParamInvest.SetIdPatrocinadora(const Value: Integer);
begin
  FIdPatrocinadora := Value;
end;

//AL_6
procedure TCtrlParamInvest.SetIdPlanoPrevContab(const Value: Integer);
begin
  FIdPlanoPrevContab := Value;
end;

//AL_6
procedure TCtrlParamInvest.SetPlanPrevCtbPatr(const Value: String);
begin
  FPlanPrevCtbPatr := Value;
end;

//AL_6
procedure TCtrlParamInvest.SetIdPlanPrevCtbPatr(const Value: Integer);
begin
  FIdPlanPrevCtbPatr := Value;
end;

// AL_6
procedure TCtrlParamInvest.SetIdTipoInvest(const Value: Integer);
begin
  FIdTipoInvest := Value;
end;

procedure TCtrlParamInvest.SetIdMotBloqPenFdo(const Value: Integer);
begin
  FIdMotBloqPenFdo := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabBMF(const Value: String);
begin
  FIntFinContabBMF := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabFDC(const Value: String);
begin
  FIntFinContabFDC := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabFIM(const Value: String);
begin
  FIntFinContabFIM := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabFIP(const Value: String);
begin
  FIntFinContabFIP := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabFRF(const Value: String);
begin
  FIntFinContabFRF := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabFRV(const Value: String);
begin
  FIntFinContabFRV := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabRF(const Value: String);
begin
  FIntFinContabRF := Value;
end;

procedure TCtrlParamInvest.SetIntFinContabRV(const Value: String);
begin
  FIntFinContabRV := Value;
end;

//AL_9
procedure TCtrlParamInvest.SetIdCarteiraRF(const Value: Integer);
begin
  FIdCarteiraRF := Value;
end;

//AL_11
procedure TCtrlParamInvest.SetVersaoModulo(const Value: String);
begin
  FVersaoModulo := Value;
end;

//AL_13
procedure TCtrlParamInvest.SetFLGEMABERTURAFMI(const Value: String);
begin
  FFLGEMABERTURAFMI := Value;
end;

//AL_13
procedure TCtrlParamInvest.SetIDUSREMABERTURAFMI(const Value: Integer);
begin
  FIDUSREMABERTURAFMI := Value;
end;

//AL_14
procedure TCtrlParamInvest.SetIntFinContabOPI(const Value: String);
begin
  FIntFinContabOPI := Value;
end;

end.
