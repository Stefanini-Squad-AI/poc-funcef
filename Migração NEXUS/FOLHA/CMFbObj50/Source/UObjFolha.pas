unit UObjFolha;
// Alterações:
//--------------------------------------------------------------------------------------------------
// Rotina    : property FlgNovoIRExterior
// Autor(a)  : Edilaine
// Data      : 26/12/2025
// Pendencia : WO29808
// Alteração : Novo cálculo do IR para Exteior
//--------------------------------------------------------------------------------------------------
// Rotina    : property
// Autor(a)  : Edilaine
// Data      : 07/07/2023
// Pendencia : 136670
// Alteração : Criação parametros para Desconto Simplificado MP 1171
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 17/04/2007
// Rotina      : Diversas (verificar pelo numero da pendencia)
// Pendência   : 21874
// Descricao   : Criar parâmetro para controle de desativação automática da
//   Rubrica individual, no processo de Efetivação de versão de pagamento.
//   Situações em que ocorre a desativação automática da rubrica individual:
//     - data final atingida
//     - parcela atingida
//     - saldo atingido
//   Opções:
//     0 - sem desativação
//     1 - desativação automática individual
//     2 - desativação automática geral (para qualquer registro na condição)
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 22/01/2007
// Pendencia : 20814
// Alteração : Desabilitando os parametros IDRubCredAdiantaIsento,
//               IDRubAdiantaIsento
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 11/10/2006
// Pendencia : 18728
// Alteração : Criar parâmetro VerificaRecebedorDuplicado
//------------------------------------------------------------------------------
// Autor(a)  : André Pontes
// Rotina    : TObjSistemaFolha.Create
// Data      : 09/10/2006
// Pendencia : 18949
// Alteração : objIRRF.Initialize(...)
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : CriaConjuntoRubricaInterno
// Data      : 11/10/2006
// Pendencia : 23410
// Alteração : Criar conjunto global para rubricas que serão contabilizadas no
//   plano comum.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 04/10/2006
// Pendencia : 22999
// Alteração : Criar parâmetro global para que o mês referencia seja constante
//   no processamento e lançamento de rubrica individual, mesmo que tenha várias
//   parcelas a processar. Isto vai indicar que o valor total de uma referência
//   foi rateado por diversos meses.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 15/09/2006
// Pendencia : 18767
// Alteração : Criação dos paramentros IDRubCredAdiantaIsento, IDRubAdiantaIsento.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 23/08/2006
// Pendencia : 22941
// Alteração : Criar parâmetro global para indicar uso do Rateio de rubricas
//   por plano na Prévia, para não onerar clientes que não usarão esta função.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Parametros
// Data      : 21/08/2006
// Pendencia : 23109
// Alteração : Retirar o parâmetro para forçar uso da tabela progressiva de IR
//   sobre resgate de reserva.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Parametros
// Data      : 21/08/2006
// Pendencia : 22312
// Alteração : Criar novas rubricas para IR regressivo de beneficio vitalicio e de abono vitalicio
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Parâmetro Novo
// Pendência   : 14461 e 21006
// Descricao   : Controle do Preparo de Abono anual de retidos
//               OPÇÕES: 0-NÃO PREPARA,
//                       1-PREPARA RETIDOS EXCETO RECADASTRAMENTO
//                       2-PREPARA TODOS OS RETIDOS
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Parâmetro Novo
// Pendência   : 19506
// Descricao   : Controle do Preparo de Mensal de retidos
//               OPÇÕES: 0-NÃO PREPARA,
//                       1-PREPARA RETIDOS EXCETO TEMPORÁRIOS
//                       2-PREPARA TODOS OS RETIDOS
//------------------------------------------------------------------------------

interface

uses wwquery, sysutils, udatabase, ucomumfolha, uctrlobjirrf, uSistema,
     uDiasUteis, dbasedados, forms;

type
  TObjSistemaFolha = class(TObjComumFolha)
  private
    FMASCARAMATRICULA          : String;
    FFLGPARTIDADOBRADA         : Integer;
    FIDRUBCREDSALFAM           : Integer;
    FRegraSalFam               : integer; 
    FFLGNUMLOTES               : Integer;
    FFLGCAPCONTROLACPMF        : Integer;
    FCODCCUSTOFINAN            : String;
    FIdProgramaFolha           : Integer;
    FFlgEnviaContribConcessao  : Integer;
    FFlgEnviaContribManutencao : Integer;
    FIDRUBCPMFPAINSS           : Integer;
    FIDRUBCPMFPAINSSDESC       : Integer;
    FFlgApagaPrevia            : Integer;
    FCodCentroRespon           : String;
    FCodPortForma              : String;
    FCodTipRecDes              : String;
    FCodTipRecDesFav           : String;
    FUnidNegoc                 : String;
    FSubConta                  : String;
    FCodCentroCustoC           : String;
    FCodCentroCustoD           : String;
    FPlaContaD                 : String;
    FPlaContaC                 : String;
    FSeparadorContraCheque     : String;
    FContraChequePorPagina     : Integer;
    FRUBRICACONTRACHEQUE       : Integer;
    FMODOCPAGARCONVENIOS       : Integer;
    FFlgVerificaParm           : Integer;
    FFlgNumDepIRNumDepSalFam   : Integer;
    FFlgEstadoRub              : Integer;
    FIdGrupoRegraFolha         : Integer;
    FFlgUsaRegraxRub           : Integer;
    FFLGINTEGRACONTABIL        : Integer;
    FFLGINTEGRAFINANC          : Integer;
    FFLGUSAMARGEM3070          : Integer;
    FIDESTRUTM30               : Integer;
    FIDESTRUTM70               : Integer;
    FFLGZERABASENEGATIVAPREVIA : Integer;
    FFLGREAJUSTACANCELADO      : Integer;
    FFLGPREPARABENEFDESATIVADO : Integer;
    FFLGCANCELAFILHO           : Integer;
    FFLGTRATALOTEINDEPENDENTE  : Integer;
    FFLGREAJUSTEEMLOTE         : Integer;
    FFLGCONFIRMANOFINAL        : Integer;
    FFLGMENSERROVALREGRA       : Integer;
    FTIPDOCCONVP               : Integer;
    FTIPDOCCONVR               : Integer;
    FCalcSalVirtTodoMes        : Integer;
    FIdRubIRRFINSSAbono        : Integer;
    FFlgAbreRubAcJud           : Integer;
    FFlgCalculaIRResgateIsento : Integer;
    FFlgRecalculaBenefCotas    : Integer;
    FFlgCalculaDifBenefCotas   : Integer;
    FFlgCalcPensAlimAntPrevia  : Integer;
    FFlgControleTipoRegra      : Integer;
    FTipoRegraPadrao           : Integer;
    FFlgAcessoTipoRegra        : Integer;
    FFlgEfetuaPagtoFavOutros   : Integer;
    FIdRubDedDepAbono          : Integer;
    FIdRubDedIdadeAbono        : Integer;
    FIdRubConsigCredAbono      : Integer;
    FIdRubConsigDescAbono      : Integer;
    FIdRubDescDepIRResgate     : Integer; 
    FIdRubDescIdadeIRResgate   : Integer; 
    FFlgUsaBaseMensalIRRF      : Boolean;
    FIdRubBaseMensalIRRF       : Integer;
    FIdRubValorMensalIRRF      : Integer;
    FobjIRRF                   : TCtrlObjIrrf;
    FDataCorrenteIRRF          : TDateTime;
    FFlgCorrigeReservaMes      : Integer;
    FFundacaoCorrente          : Integer;
    FFlgNaoRecalcIRPagPendente : boolean;
    FVlrMaxLimiteFolhaExtra: Real;
    FDeducaoBaseIR0561: real;
    FFlgAbreDocAlt: boolean;
    FFlgAgrupaArqDocAlt: boolean;
    FFlgInibeMsgDetPreparo: boolean;
    FFlgUsaMatriculaCompleta: boolean;
    FLimiteBrutoINSSxCPMF: real;
    FFlgUsaMatriculaDependente: boolean;
    FFlgBuscaAdiantamentoPA: boolean;
    FFlgAbateTodasReservasRegra: boolean;
    FFlgBuscaAbonoAnteriorPago: boolean;
    FFlgGeraAlteradoresCAPConvenio: boolean;
    FTipoMargemDesconto: integer;
    FVlrMargemDesconto: real;
    FFlgUsaProvisaoAbono: boolean;
    FFlgForcaDataFinalRubIndiv: boolean;
    FIdRubIRRFReservaTribRegressiva: Integer;
    FFormaParcelaPrevia: integer;
    FUFEmpresa: String;
    FPaisEmpresa: Integer;
    FCidadeEmpresa: Integer;
    FPreparoRetidoMensal: integer;
    FPreparoRetidoAbono: integer;
    FIdRubIRRFAbonoREGR: integer;
    FIdRubIRRFVitalicioREGR: integer;
    FRateioPlanoRubrica: integer;
    FMantemMesRefConstanteRB: integer;
    FVerificaRecebedorDuplicado: Integer;
    FDesativacaoAutomaticaRubricaIndiv: integer;
    FFlgDescSimplesIRRF: integer;
    FIDRubricaIrDescSimples: integer;
    FIDRubricaIrDescSimplesAbn: integer;
    FIDRubIrDescSimplesInss: integer;
    FIDRubIrDescSimplesInssAbn: integer;
    FFlgNovoIRExterior: integer;

    procedure SetFLGUSAMARGEM3070 (Const Value : Integer);
    procedure SetIDESTRUTM30 (Const Value : Integer);
    procedure SetIDESTRUTM70 (Const Value : Integer);
    procedure SetFLGPARTIDADOBRADA(Const Value : Integer);
    procedure SetIDRUBCREDSALFAM (Const Value : Integer);
    procedure SetRegraSalFam(const Value: integer);
    procedure SetFLGNUMLOTES (Const Value : Integer);
    procedure SetFLGCAPCONTROLACPMF (Const Value : Integer);
    procedure SetIdProgramaFolha (Const Value : Integer);
    procedure SetFLGINTEGRACONTABIL(const Value: integer);
    procedure SetFLGINTEGRAFINANC(const Value: integer);
    procedure SetFlgEnviaContribConcessao(const Value: integer);
    procedure SetFlgEnviaContribManutencao(const Value: integer);
    procedure SetIDRUBCPMFPAINSS(const Value: Integer);
    procedure SetIDRUBCPMFPAINSSDESC(const Value: Integer);
    procedure SetFlgApagaPrevia(const Value: integer);
    procedure SetMASCARAMATRICULA(const Value: String);
    procedure SetCodCentroRespon(const value : String);
    procedure SetCODCCUSTOFINAN(const value : String);
    procedure SetCodPortForma(const value : String);
    procedure SetCodTipRecDes(const value : String);
    procedure SetCodTipRecDesFav(const value : String);
    procedure SetUnidNegoc(const value : String);
    procedure SetSubConta(const value : String);
    procedure SetCodCentroCustoC(const value : String);
    procedure SetCodCentroCustoD(const value : String);
    procedure SetPlaContaD(const value : String);
    procedure SetPlaContaC(const value : String);
    procedure SetSeparadorContraCheque(const Value: string);
    procedure SetContraChequePorPagina(const Value: integer);
    procedure SetRUBRICACONTRACHEQUE(const Value: integer);
    procedure SetMODOCPAGARCONVENIOS(const Value: integer);
    procedure SetFlgVerificaParm(const Value: integer);
    procedure SetFlgNumDepIRNumDepSalFam(const Value: integer);
    procedure SetFlgEstadoRub(const Value: integer);
    procedure SetIdGrupoRegraFolha(const Value: Integer);
    procedure SetFlgUsaRegraxRub(const Value: Integer);
    procedure SetFLGZERABASENEGATIVAPREVIA(const Value: integer);   
    procedure SetFLGMENSERROVALREGRA(const Value: integer);
    procedure SetFLGREAJUSTACANCELADO(const Value: integer);
    procedure SetFLGPREPARABENEFDESATIVADO(const Value: integer);
    procedure SetFLGCANCELAFILHO(const Value: Integer);
    procedure SetFLGTRATALOTEINDEPENDENTE(const Value: Integer);
    procedure SetFLGREAJUSTEEMLOTE(const Value: Integer);
    procedure SetFLGCONFIRMANOFINAL(const Value: Integer);
    procedure SetTIPDOCCONVP(const Value: Integer);
    procedure SetTIPDOCCONVR(const Value: Integer);
    procedure SetCalcSalVirtTodoMes(const Value: integer);
    procedure SetIdRubIRRFINSSAbono(const Value: Integer);
    procedure SetFlgAbreRubAcJud(const Value: Integer);
    procedure SetFlgCalculaIRResgateIsento(const Value: Integer);
    procedure SetFlgRecalculaBenefCotas(const Value: Integer);
    procedure SetFlgCalculaDifBenefCotas(const Value: Integer);
    procedure SetFlgCalcPensAlimAntPrevia(const Value: Integer);
    procedure SetFlgControleTipoRegra(const Value: integer);
    procedure SetTipoRegraPadrao(const Value: integer);
    procedure SetFlgAcessoTipoRegra(const Value: integer);
    procedure SetFlgEfetuaPagtoFavOutros(const Value: integer);
    procedure SetIdRubDedIdadeAbono(const Value: Integer);
    procedure SetIdRubConsigCredAbono(const Value: Integer);
    procedure SetIdRubConsigDescAbono(const Value: Integer);
    procedure SetIdRubDedDepAbono(const Value: Integer);
    procedure SetFlgUsaBaseMensalIRRF(const Value: boolean);
    procedure SetIdRubBaseMensalIRRF(const Value: integer);
    procedure SetIdRubValorMensalIRRF(const Value: integer);
    procedure SetobjIRRF(const Value: tctrlobjirrf);
    procedure SetDataCorrenteIRRF(const Value: tdatetime);
    procedure SetFlgCorrigeReservaMes(const Value: integer);
    procedure SetFundacaoCorrente(const Value: integer);
    procedure SetIdRubDescDepIRResgate(const Value: Integer); 
    procedure SetIdRubDescIdadeIRResgate(const Value: Integer); 
    procedure SetFlgNaoRecalcIRPagPendente(const Value: boolean);
    procedure SetVlrMaxLimiteFolhaExtra(const Value: Real);
    procedure SetDeducaoBaseIR0561(const Value: real);
    procedure SetFlgAbreDocAlt(const Value: boolean);
    procedure SetFlgAgrupaArqDocAlt(const Value: boolean);
    procedure SetFlgInibeMsgDetPreparo(const Value: boolean);
    procedure SetFlgUsaMatriculaCompleta(const Value: boolean);
    procedure SetLimiteBrutoINSSxCPMF(const Value: real);
    procedure SetFlgUsaMatriculaDependente(const Value: boolean);
    procedure SetFlgBuscaAdiantamentoPA(const Value: boolean);
    procedure SetFlgAbateTodasReservasRegra(const Value: boolean);
    procedure SetFlgBuscaAbonoAnteriorPago(const Value: boolean);
    procedure SetFlgGeraAlteradoresCAPConvenio(const Value: boolean);
    procedure SetTipoMargemDesconto(const Value: integer);
    procedure SetVlrMargemDesconto(const Value: real);
    procedure SetFlgUsaProvisaoAbono(const Value: boolean);
    procedure SetFlgForcaDataFinalRubIndiv(const Value: boolean);
    procedure SetIdRubIRRFReservaTribRegressiva(const Value: Integer);
    procedure SetFormaParcelaPrevia(const Value: integer);
    procedure SetCidadeEmpresa(const Value: Integer);
    procedure SetPaisEmpresa(const Value: Integer);
    procedure SetUFEmpresa(const Value: String);
    procedure SetPreparoRetidoAbono(const Value: integer);
    procedure SetPreparoRetidoMensal(const Value: integer);
    procedure SetIdRubIRRFAbonoREGR(const Value: integer);
    procedure SetIdRubIRRFVitalicioREGR(const Value: integer);
    procedure SetRateioPlanoRubrica(const Value: integer);
    procedure SetMantemMesRefConstanteRB(const Value: integer);
    procedure SetVerificaRecebedorDuplicado(const Value: integer);
    procedure SetDesativacaoAutomaticaRubricaIndiv(const Value: integer);
    procedure SetFlgDescSimplesIRRF(const Value: integer);
    procedure SetIDRubricaIrDescSimples(const Value: integer);
    procedure SetIDRubricaIrDescSimplesAbn(const Value: integer);
    procedure SetIDRubIrDescSimplesInss(const Value: integer);
    procedure SetIDRubIrDescSimplesInssAbn(const Value: integer);
    procedure SetFlgNovoIRExterior(const Value: integer);
  protected
  public

    property FLGUSAMARGEM3070: Integer read FFLGUSAMARGEM3070  write SetFLGUSAMARGEM3070;
    property IDESTRUTM30: Integer read FIDESTRUTM30  write SetIDESTRUTM30;
    property IDESTRUTM70: Integer read FIDESTRUTM70  write SetIDESTRUTM70;
    property MASCARAMATRICULA: String read FMASCARAMATRICULA write SetMASCARAMATRICULA;
    property IDRUBCREDSALFAM : Integer read FIDRUBCREDSALFAM  write SetIDRUBCREDSALFAM;
    property FLGPARTIDADOBRADA : Integer read FFLGPARTIDADOBRADA write SetFLGPARTIDADOBRADA;
    property RegraSalFam: integer read FRegraSalFam write SetRegraSalFam; 
    property FLGNUMLOTES: integer read FFLGNUMLOTES write SetFLGNUMLOTES;
    property FLGCAPCONTROLACPMF: integer read FFLGCAPCONTROLACPMF write SetFLGCAPCONTROLACPMF;
    property IDPROGRAMAFOLHA: integer read FIDPROGRAMAFOLHA write SetIDPROGRAMAFOLHA;
    property FLGINTEGRACONTABIL: integer read FFLGINTEGRACONTABIL write SetFLGINTEGRACONTABIL;
    property FLGINTEGRAFINANC: integer read FFLGINTEGRAFINANC write SetFLGINTEGRAFINANC;
    property FlgEnviaContribConcessao: integer read FFlgEnviaContribConcessao write SetFlgEnviaContribConcessao;
    property FlgEnviaContribManutencao: integer read FFlgEnviaContribManutencao write SetFlgEnviaContribManutencao;
    property IDRUBCPMFPAINSS: Integer read FIDRUBCPMFPAINSS write SetIDRUBCPMFPAINSS;
    property IDRUBCPMFPAINSSDESC: Integer read FIDRUBCPMFPAINSSDESC write SetIDRUBCPMFPAINSSDESC;
    property FlgApagaPrevia: integer read FFlgApagaPrevia write SetFlgApagaPrevia;
    property CodCentroRespon: String read FCodCentroRespon write SetCodCentroRespon;
    property CODCCUSTOFINAN: String read FCODCCUSTOFINAN write SetCODCCUSTOFINAN;
    property CodPortForma: String read FCodPortForma write SetCodPortForma;
    property CodTipRecDes: String read FCodTipRecDes write SetCodTipRecDes;
    property CodTipRecDesFav: String read FCodTipRecDesFav write SetCodTipRecDesFav;
    property UnidNegoc: String read FUnidNegoc write SetUnidNegoc;
    property SubConta: String read FSubConta write SetSubConta;
    property CodCentroCustoC: String read FCodCentroCustoC write SetCodCentroCustoC;
    property CodCentroCustoD: String read FCodCentroCustoD write SetCodCentroCustoD;
    property PlaContaD: String read FPlaContaD write SetPlaContaD;
    property PlaContaC: String read FPlaContaC write SetPlaContaC;
    property SeparadorContraCheque: string read FSeparadorContraCheque write SetSeparadorContraCheque;
    property ContraChequePorPagina: integer read FContraChequePorPagina write SetContraChequePorPagina;
    property RUBRICACONTRACHEQUE: integer read FRUBRICACONTRACHEQUE write SetRUBRICACONTRACHEQUE;
    property MODOCPAGARCONVENIOS: integer read FMODOCPAGARCONVENIOS write SetMODOCPAGARCONVENIOS;
    property FlgVerificaParm: integer read FFlgVerificaParm write SetFlgVerificaParm;
    property FlgNumDepIRNumDepSalFam: integer read FFlgNumDepIRNumDepSalFam write SetFlgNumDepIRNumDepSalFam;
    property FlgEstadoRub: integer read FFlgEstadoRub write SetFlgEstadoRub;
    property IdGrupoRegraFolha: Integer read FIdGrupoRegraFolha write SetIdGrupoRegraFolha;
    property FlgUsaRegraxRub: Integer read FFlgUsaRegraxRub write SetFlgUsaRegraxRub;
    property FlgZeraBaseNegativaPrevia: integer read FFLGZERABASENEGATIVAPREVIA write SetFLGZERABASENEGATIVAPREVIA;
    property FLGMENSERROVALREGRA: integer read FFLGMENSERROVALREGRA write SetFLGMENSERROVALREGRA;
    property FLGREAJUSTACANCELADO: Integer read FFLGREAJUSTACANCELADO write SetFLGREAJUSTACANCELADO;
    property FLGPREPARABENEFDESATIVADO: Integer read FFLGPREPARABENEFDESATIVADO write SetFLGPREPARABENEFDESATIVADO;
    property FLGCANCELAFILHO: Integer read FFLGCANCELAFILHO write SetFLGCANCELAFILHO;
    property FLGTRATALOTEINDEPENDENTE: Integer read FFLGTRATALOTEINDEPENDENTE write SetFLGTRATALOTEINDEPENDENTE;
    property FLGREAJUSTEEMLOTE: Integer read FFLGREAJUSTEEMLOTE write SetFLGREAJUSTEEMLOTE;
    property FLGCONFIRMANOFINAL: Integer read FFLGCONFIRMANOFINAL write SetFLGCONFIRMANOFINAL;
    property TIPDOCCONVP: Integer read FTIPDOCCONVP write SetTIPDOCCONVP;
    property TIPDOCCONVR: Integer read FTIPDOCCONVR write SetTIPDOCCONVR;
    property CalcSalVirtTodoMes: integer read FCalcSalVirtTodoMes write SetCalcSalVirtTodoMes;
    property IdRubIRRFINSSAbono: Integer read FIdRubIRRFINSSAbono write SetIdRubIRRFINSSAbono;
    property FlgAbreRubAcJud: Integer read FFlgAbreRubAcJud write SetFlgAbreRubAcJud;
    property FlgCalculaIRResgateIsento: Integer read FFlgCalculaIRResgateIsento write SetFlgCalculaIRResgateIsento;
    property FlgRecalculaBenefCotas: Integer read FFlgRecalculaBenefCotas write SetFlgRecalculaBenefCotas;
    property FlgCalculaDifBenefCotas: Integer read FFlgCalculaDifBenefCotas write SetFlgCalculaDifBenefCotas;
    property FlgCalcPensAlimAntPrevia: Integer read FFlgCalcPensAlimAntPrevia write SetFlgCalcPensAlimAntPrevia;
    property FlgControleTipoRegra: integer read FFlgControleTipoRegra write SetFlgControleTipoRegra; 
    property FlgAcessoTipoRegra: integer read FFlgAcessoTipoRegra write SetFlgAcessoTipoRegra; 
    property TipoRegraPadrao: integer read FTipoRegraPadrao write SetTipoRegraPadrao; 
    property FlgEfetuaPagtoFavOutros: integer read FFlgEfetuaPagtoFavOutros write SetFlgEfetuaPagtoFavOutros; 
    property IdRubDedDepAbono: Integer read FIdRubDedDepAbono write SetIdRubDedDepAbono;
    property IdRubDedIdadeAbono: Integer read FIdRubDedIdadeAbono write SetIdRubDedIdadeAbono;
    property IdRubConsigCredAbono: Integer read FIdRubConsigCredAbono write SetIdRubConsigCredAbono;
    property IdRubConsigDescAbono: Integer read FIdRubConsigDescAbono write SetIdRubConsigDescAbono;

    //NOVAS PROPRIEDADES PARA CONTROLAR TRATAMENTO DE BASE DE IRRF MENSAL
    property FlgUsaBaseMensalIRRF: boolean read FFlgUsaBaseMensalIRRF write SetFlgUsaBaseMensalIRRF;
    property IdRubBaseMensalIRRF: integer read FIdRubBaseMensalIRRF write SetIdRubBaseMensalIRRF;
    property IdRubValorMensalIRRF: integer read FIdRubValorMensalIRRF write SetIdRubValorMensalIRRF;

    property objIRRF: tctrlobjirrf read FobjIRRF write SetobjIRRF;

    //CORRIGE RESGATE DE RESERVA NO MÊS DE PAGAMENTO
    property FlgCorrigeReservaMes: integer read FFlgCorrigeReservaMes write SetFlgCorrigeReservaMes;

    //FUNDACAO PARA PROCESSAMENTO
    property FundacaoCorrente: integer read FFundacaoCorrente write SetFundacaoCorrente;

    property IdRubDescDepIRResgate: Integer read FIdRubDescDepIRResgate write SetIdRubDescDepIRResgate;
    property IdRubDescIdadeIRResgate: Integer read FIdRubDescIdadeIRResgate write SetIdRubDescIdadeIRResgate;

    property FlgNaoRecalcIRPagPendente: boolean read FFlgNaoRecalcIRPagPendente write SetFlgNaoRecalcIRPagPendente;

    property VlrMaxLimiteFolhaExtra   : Real    read FVlrMaxLimiteFolhaExtra    write SetVlrMaxLimiteFolhaExtra;

    property DeducaoBaseIR0561: real read FDeducaoBaseIR0561 write SetDeducaoBaseIR0561;

    property PaisEmpresa : Integer read FPaisEmpresa write SetPaisEmpresa;
    property CidadeEmpresa : Integer read FCidadeEmpresa write SetCidadeEmpresa;
    property UFEmpresa : String read FUFEmpresa write SetUFEmpresa;

    constructor Create;

    function OraNumero(sNumero : string):string;
    function ClienteNumero(sNumero : string):string;

    function IdentificaTipoPessoa(qry : twwquery; alidTitular, alidRecebedor : longint) : char;
    { - Identifica o tipo de uma pessoa classificando como:
      'P' - PARTICIPANTE
      'B' - BENEFICIARIO
      'T' - TUTOR RESPONSAVEL
      'C' - CONSIGNATARIO
      'N' - NAO IDENTIFICADO}

    function CompoeDataString(aiDia, aiMes, aiAno: integer; asMascara: string) : string;

    property FlgAbreDocAlt: boolean read FFlgAbreDocAlt write SetFlgAbreDocAlt; 
    property FlgAgrupaArqDocAlt: boolean read FFlgAgrupaArqDocAlt write SetFlgAgrupaArqDocAlt;
    property FlgInibeMsgDetPreparo: boolean read FFlgInibeMsgDetPreparo write SetFlgInibeMsgDetPreparo; 
    property FlgUsaMatriculaCompleta: boolean read FFlgUsaMatriculaCompleta write SetFlgUsaMatriculaCompleta; 
    property LimiteBrutoINSSxCPMF: real read FLimiteBrutoINSSxCPMF write SetLimiteBrutoINSSxCPMF; 
    property FlgUsaMatriculaDependente: boolean read FFlgUsaMatriculaDependente write SetFlgUsaMatriculaDependente; 
    property FlgBuscaAdiantamentoPA: boolean read FFlgBuscaAdiantamentoPA write SetFlgBuscaAdiantamentoPA; 
    property FlgAbateTodasReservasRegra: boolean read FFlgAbateTodasReservasRegra write SetFlgAbateTodasReservasRegra; 
    property FlgBuscaAbonoAnteriorPago: boolean read FFlgBuscaAbonoAnteriorPago write SetFlgBuscaAbonoAnteriorPago; 
    property FlgGeraAlteradoresCAPConvenio: boolean read FFlgGeraAlteradoresCAPConvenio write SetFlgGeraAlteradoresCAPConvenio; 
    property TipoMargemDesconto: integer read FTipoMargemDesconto write SetTipoMargemDesconto; 
    property VlrMargemDesconto: real read FVlrMargemDesconto write SetVlrMargemDesconto; 
    property FlgUsaProvisaoAbono: boolean read FFlgUsaProvisaoAbono write SetFlgUsaProvisaoAbono; 
    property FlgForcaDataFinalRubIndiv: boolean read FFlgForcaDataFinalRubIndiv write SetFlgForcaDataFinalRubIndiv; 
    property IdRubIRRFReservaTribRegressiva: Integer read FIdRubIRRFReservaTribRegressiva write SetIdRubIRRFReservaTribRegressiva; 
    property IdRubIRRFVitalicioREGR: integer read FIdRubIRRFVitalicioREGR write SetIdRubIRRFVitalicioREGR; 
    property IdRubIRRFAbonoREGR: integer read FIdRubIRRFAbonoREGR write SetIdRubIRRFAbonoREGR; 
    property FormaParcelaPrevia: integer read FFormaParcelaPrevia write SetFormaParcelaPrevia; 
    property PreparoRetidoAbono: integer read FPreparoRetidoAbono write SetPreparoRetidoAbono;
    // OPÇÕES: 0-NÃO PREPARA,
    //         1-PREPARA RETIDOS EXCETO RECADASTRAMENTO
    //         2-PREPARA TODOS OS RETIDOS
    property PreparoRetidoMensal: integer read FPreparoRetidoMensal write SetPreparoRetidoMensal;
    // OPÇÕES: 0-NÃO PREPARA,
    //         1-PREPARA RETIDOS EXCETO TEMPORÁRIOS
    //         2-PREPARA TODOS OS RETIDOS

    procedure CriaConjuntoRubricaInterno;
    property RateioPlanoRubrica: integer read FRateioPlanoRubrica write SetRateioPlanoRubrica;
    {0-sem rateio; 1-rateio pelo valor liquido (benefício - contribuicao)}

    property MantemMesRefConstanteRB: integer read FMantemMesRefConstanteRB write SetMantemMesRefConstanteRB;
    // No processamento da rubricaindiv na Prévia vai usar segundo as opções:
    // 0 - coloca o mês cobrança como mês referência, em todos os meses de processamento
    // 1 - mantém o mês referência informado no cadastro da Rubrica Individual, em todos os meses de processamento

    property VerificaRecebedorDuplicado: integer read FVerificaRecebedorDuplicado write SetVerificaRecebedorDuplicado;

    property DesativacaoAutomaticaRubricaIndiv : integer read FDesativacaoAutomaticaRubricaIndiv write SetDesativacaoAutomaticaRubricaIndiv;

    //edilaine SIG136670 : inicio
    property FlgDescSimplesIRRF        : integer read FFlgDescSimplesIRRF        write SetFlgDescSimplesIRRF;
    property IDRubricaIrDescSimples    : integer read FIDRubricaIrDescSimples    write SetIDRubricaIrDescSimples;
    property IDRubricaIrDescSimplesAbn : integer read FIDRubricaIrDescSimplesAbn write SetIDRubricaIrDescSimplesAbn;
    property IDRubIrDescSimplesInss    : integer read FIDRubIrDescSimplesInss    write SetIDRubIrDescSimplesInss;
    property IDRubIrDescSimplesInssAbn : integer read FIDRubIrDescSimplesInssAbn write SetIDRubIrDescSimplesInssAbn;
    //edilaine SIG136670 : fim

    property FlgNovoIRExterior         : integer read FFlgNovoIRExterior         write SetFlgNovoIRExterior;      //edilaine WO29808

  end;

var SistemaFolha: TObjSistemaFolha;

implementation

{ TObjSistemaFolha }

constructor TObjSistemaFolha.Create;
begin
  objIRRF:=tctrlobjirrf.create;

  objIRRF.Initialize(DtmBaseDados.DbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True,
                     nil
                    );

  DiasUteis.SetLogradouro(Sistema.IdEmpresa, FCidadeEmpresa, FPaisEmpresa, FUFEmpresa);
end;

procedure TObjSistemaFolha.SetFLGUSAMARGEM3070(const Value: integer);
begin
  FFLGUSAMARGEM3070 := Value;
end;

procedure TObjSistemaFolha.SetIDESTRUTM30(const Value: integer);
begin
  FIDESTRUTM30 := Value;
end;

procedure TObjSistemaFolha.SetIDESTRUTM70(const Value: integer);
begin
  FIDESTRUTM70 := Value;
end;

procedure TObjSistemaFolha.SetIDRUBCREDSALFAM(const Value: integer);
begin
  FIDRUBCREDSALFAM := Value;
end;

procedure TObjSistemaFolha.SetFLGPARTIDADOBRADA(const Value: integer);
begin
  FFLGPARTIDADOBRADA := Value;
end;

procedure TObjSistemaFolha.SetRegraSalFam(const Value: integer);
begin
  FRegraSalFam := Value;
end;

procedure TObjSistemaFolha.SetIdProgramaFolha(const Value: integer);
begin
  FIDPROGRAMAFOLHA := Value;
end;

procedure TObjSistemaFolha.SetFLGNUMLOTES(const Value: integer);
begin
  FFLGNUMLOTES := Value;
end;

procedure TObjSistemaFolha.SetFLGCAPCONTROLACPMF(const Value: integer);
begin
  FFLGCAPCONTROLACPMF := Value;
end;

procedure TObjSistemaFolha.SetFLGINTEGRAFINANC(const Value: integer);
begin
  FFLGINTEGRAFINANC := Value;
end;

procedure TObjSistemaFolha.SetFLGINTEGRACONTABIL(const Value: integer);
begin
  FFLGINTEGRACONTABIL := Value;
end;

procedure TObjSistemaFolha.SetFlgApagaPrevia(const Value: integer);
begin
  FFlgApagaPrevia := Value;
end;

procedure TObjSistemaFolha.SetFlgVerificaParm(const Value: integer);
begin
  FFlgVerificaParm := Value;
end;

procedure TObjSistemaFolha.SetIDRUBCPMFPAINSS(const Value: Integer);
begin
  FIDRUBCPMFPAINSS := Value;
end;

procedure TObjSistemaFolha.SetIDRUBCPMFPAINSSDESC(const Value: Integer);
begin
  FIDRUBCPMFPAINSSDESC := Value;
end;

procedure TObjSistemaFolha.SetFlgEnviaContribConcessao(const Value: integer);
begin
  FFlgEnviaContribConcessao := Value;
end;

procedure TObjSistemaFolha.SetFlgEnviaContribManutencao(const Value: integer);
begin
  FFlgEnviaContribManutencao := Value;
end;

procedure TobjSistemaFolha.SetCodCentrorespon(const Value : String);
begin
    FCodCentroRespon := Value;
end;

procedure TobjSistemaFolha.SetCODCCUSTOFINAN(const Value : String);
begin
    FCODCCUSTOFINAN := Value;
end;

procedure TobjSistemaFolha.SetCodPortForma(const Value : String);
begin
    FCodPortForma := Value;
end;

procedure TobjSistemaFolha.SetCodTipRecDes(const Value : String);
begin
    FCodTipRecDes := Value;
end;

procedure TobjSistemaFolha.SetCodTipRecDesFav(const Value : String);
begin
    FCodTipRecDesFav := Value;
end;

procedure TobjSistemaFolha.SetMASCARAMATRICULA(const Value : String);
begin
    FMASCARAMATRICULA := Value;
end;

procedure TobjSistemaFolha.SetUnidNegoc(const Value : String);
begin
    FUnidNegoc := Value;
end;

procedure TobjSistemaFolha.SetSubConta(const Value : String);
begin
    FSubConta := Value;
end;

procedure TobjSistemaFolha.SetCodCentroCustoC(const Value : String);
begin
    FCodCentroCustoC := Value;
end;

procedure TobjSistemaFolha.SetCodCentroCustoD(const Value : String);
begin
    FCodCentroCustoD := Value;
end;

procedure TobjSistemaFolha.SetPlaContaD(const Value : String);
begin
    FPlaContaD := Value;
end;

procedure TobjSistemaFolha.SetPlaContaC(const Value : String);
begin
    FPlaContaC := Value;
end;

procedure TObjSistemaFolha.SetSeparadorContraCheque(const Value: string);
begin
  FSeparadorContraCheque := Value;
end;

procedure TObjSistemaFolha.SetContraChequePorPagina(const Value: integer);
begin
  FContraChequePorPagina := Value;
end;

procedure TObjSistemaFolha.SetRUBRICACONTRACHEQUE(const Value: integer);
begin
  FRUBRICACONTRACHEQUE := Value;
end;

procedure TObjSistemaFolha.SetMODOCPAGARCONVENIOS(const Value: integer);
begin
  FMODOCPAGARCONVENIOS := Value;
end;

procedure TObjSistemaFolha.SetFlgNumDepIRNumDepSalFam(
  const Value: integer);
begin
  FFlgNumDepIRNumDepSalFam := Value; 
end;

procedure TObjSistemaFolha.SetFlgEstadoRub(const Value: integer);
begin
 FFlgEstadoRub := Value; 
end;

procedure TObjSistemaFolha.SetIdGrupoRegraFolha(const Value: Integer);
begin
  FIdGrupoRegraFolha := Value; 
end;

procedure TObjSistemaFolha.SetFlgUsaRegraxRub(const Value: Integer);
begin
 FFlgUsaRegraxRub := Value; 
end;

//PARAMETRO PARA CONTROLAR SE BASE DE CALCULO PODE FICAR NEGATIVA
procedure TObjSistemaFolha.SetFLGZERABASENEGATIVAPREVIA(const Value: integer);
begin
  FFLGZERABASENEGATIVAPREVIA:= Value;
end;

function TObjSistemaFolha.OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
  sOra := '';
  bPrimPonto := False;
  for i := length(Trim(sNumero)) downto 1 do
  begin
    if sNumero[i] = ',' then
    begin
      if not bPrimPonto then
      begin
        sOra := sOra + '.';
        bPrimPonto := True;
      end;
    end
    else
    begin
      if sNumero[i] <> '.' then
        sOra := sOra + sNumero[i]
      else
      begin
        if not bPrimPonto then
        begin
          sOra := sOra+'.';
          bPrimPonto := True;
        end;
      end;
    end;
  end;
  sResult := '';
  for i := length(sOra) downto 1 do
    sResult := sResult + sOra[i];
  if trim(sResult) = '' then
    sResult:='0';
  Result := sResult;
end;

function TObjSistemaFolha.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
  sCliente := '';
  bPrimPonto := False;
  for i := length(Trim(sNumero)) downto 1 do
  begin
    if sNumero[i] = '.' then
    begin
      if not bPrimPonto then
      begin
        sCliente := sCliente + DecimalSeparator;
        bPrimPonto := True;
      end
      else
        sCliente := sCliente;
    end
    else
    begin
      if sNumero[i] <> DecimalSeparator then
        sCliente := sCliente + sNumero[i]
      else
      begin
        if not bPrimPonto then
        begin
          sCliente := sCliente+DecimalSeparator;
          bPrimPonto := True;
        end;
      end;
    end;
  end;
  sResult := '';
  for i := length(sCliente) downto 1 do
    sResult := sResult + sCliente[i];
  if trim(sResult) = '' then
    sResult:='0';
  Result := sResult;
end;

procedure TObjSistemaFolha.SetFLGMENSERROVALREGRA(const Value: integer);
begin
  FFLGMENSERROVALREGRA := Value; 
end;

procedure TObjSistemaFolha.SetFLGCANCELAFILHO(const Value: Integer);
begin
  FFLGCANCELAFILHO := Value; 
end;

procedure TObjSistemaFolha.SetFLGPREPARABENEFDESATIVADO(
  const Value: integer);
begin
  FFLGPREPARABENEFDESATIVADO := Value;
end;

procedure TObjSistemaFolha.SetFLGREAJUSTACANCELADO(const Value: integer);
begin
  FFLGREAJUSTACANCELADO := Value;
end;

procedure TObjSistemaFolha.SetFLGREAJUSTEEMLOTE(const Value: Integer);
begin
  FFLGREAJUSTEEMLOTE := Value;
end;

procedure TObjSistemaFolha.SetFLGTRATALOTEINDEPENDENTE(
  const Value: Integer);
begin
  FFLGTRATALOTEINDEPENDENTE := Value;
end;

procedure TObjSistemaFolha.SetFLGCONFIRMANOFINAL(const Value: Integer);
begin
  FFLGCONFIRMANOFINAL := Value; 
end;

procedure TObjSistemaFolha.SetTIPDOCCONVP(const Value: Integer);
begin
  FTIPDOCCONVP := Value;
end;

procedure TObjSistemaFolha.SetTIPDOCCONVR(const Value: Integer);
begin
  FTIPDOCCONVR := Value;
end;

procedure TObjSistemaFolha.SetCalcSalVirtTodoMes(const Value: integer);
begin
  FCalcSalVirtTodoMes := Value;
end;

procedure TObjSistemaFolha.SetFlgAbreRubAcJud(const Value: Integer);
begin
  FFlgAbreRubAcJud := Value;
end;

procedure TObjSistemaFolha.SetIdRubIRRFINSSAbono(const Value: Integer);
begin
  FIdRubIRRFINSSAbono := Value;
end;

procedure TObjSistemaFolha.SetFlgCalculaDifBenefCotas(
  const Value: Integer);
begin
  FFlgCalculaDifBenefCotas := Value;
end;

procedure TObjSistemaFolha.SetFlgCalculaIRResgateIsento(
  const Value: Integer);
begin
  FFlgCalculaIRResgateIsento := Value;
end;

procedure TObjSistemaFolha.SetFlgRecalculaBenefCotas(const Value: Integer);
begin
  FFlgRecalculaBenefCotas := Value;
end;

procedure TObjSistemaFolha.SetFlgCalcPensAlimAntPrevia(
  const Value: Integer);
begin
  FFlgCalcPensAlimAntPrevia := Value;
end;

procedure TObjSistemaFolha.SetFlgControleTipoRegra(const Value: integer);
begin
  FFlgControleTipoRegra := Value;
end;

procedure TObjSistemaFolha.SetTipoRegraPadrao(const Value: integer);
begin
  FTipoRegraPadrao := Value;
end;

procedure TObjSistemaFolha.SetFlgAcessoTipoRegra(const Value: integer);
begin
  FFlgAcessoTipoRegra := Value;
end;

procedure TObjSistemaFolha.SetFlgEfetuaPagtoFavOutros(
  const Value: integer);
begin
  FFlgEfetuaPagtoFavOutros := Value;
end;

procedure TObjSistemaFolha.SetIdRubConsigCredAbono(const Value: Integer);
begin
 FIdRubConsigCredAbono := Value;
end;

procedure TObjSistemaFolha.SetIdRubConsigDescAbono(const Value: Integer);
begin
  FIdRubConsigDescAbono := Value;
end;

procedure TObjSistemaFolha.SetIdRubDedDepAbono(const Value: Integer);
begin
  FIdRubDedDepAbono := Value;
end;

procedure TObjSistemaFolha.SetIdRubDedIdadeAbono(const Value: Integer);
begin
  FIdRubDedIdadeAbono := Value;
end;

procedure TObjSistemaFolha.SetFlgUsaBaseMensalIRRF(const Value: boolean);
begin
  FFlgUsaBaseMensalIRRF := Value;
end;

procedure TObjSistemaFolha.SetIdRubBaseMensalIRRF(const Value: integer);
begin
  FIdRubBaseMensalIRRF := Value;
end;

procedure TObjSistemaFolha.SetIdRubValorMensalIRRF(const Value: integer);
begin
  FIdRubValorMensalIRRF := Value;
end;

procedure TObjSistemaFolha.SetobjIRRF(const Value: tctrlobjirrf);
begin
  FobjIRRF := Value;
end;

procedure TObjSistemaFolha.SetDataCorrenteIRRF(const Value: tdatetime);
begin
  FDataCorrenteIRRF := Value;
end;

procedure TObjSistemaFolha.SetFlgCorrigeReservaMes(const Value: integer);
begin
  FFlgCorrigeReservaMes := Value;
end;

procedure TObjSistemaFolha.SetFundacaoCorrente(const Value: integer);
begin
  FFundacaoCorrente := Value;
end;

function TObjSistemaFolha.CompoeDataString(aiDia, aiMes, aiAno: integer;
  asMascara: string): string;
 var ldtdata: tdatetime;
begin
  ldtdata:=EncodeDate(aiAno, aiMes, aiDia);
  result:=formatdatetime(asMascara, ldtData);
end;

procedure TObjSistemaFolha.SetIdRubDescDepIRResgate(const Value: Integer);
begin
  FIdRubDescDepIRResgate := Value;
end;

procedure TObjSistemaFolha.SetIdRubDescIdadeIRResgate(
  const Value: Integer);
begin
  FIdRubDescIdadeIRResgate := Value;
end;

procedure TObjSistemaFolha.SetFlgNaoRecalcIRPagPendente(
  const Value: boolean);
begin
  FFlgNaoRecalcIRPagPendente := Value;
end;

procedure TObjSistemaFolha.SetVlrMaxLimiteFolhaExtra(const Value: Real);
begin
  FVlrMaxLimiteFolhaExtra := Value;
end;

procedure TObjSistemaFolha.SetDeducaoBaseIR0561(const Value: real);
begin
  FDeducaoBaseIR0561 := Value;
end;

procedure TObjSistemaFolha.SetFlgAbreDocAlt(
  const Value: boolean);
begin
  FFlgAbreDocAlt := Value;
end;

procedure TObjSistemaFolha.SetFlgAgrupaArqDocAlt(const Value: boolean);
begin
  FFlgAgrupaArqDocAlt := Value;
end;

procedure TObjSistemaFolha.SetFlgInibeMsgDetPreparo(const Value: boolean);
begin
  FFlgInibeMsgDetPreparo := Value;
end;

procedure TObjSistemaFolha.SetFlgUsaMatriculaCompleta(
  const Value: boolean);
begin
  FFlgUsaMatriculaCompleta := Value;
end;

procedure TObjSistemaFolha.SetLimiteBrutoINSSxCPMF(const Value: real);
begin
  FLimiteBrutoINSSxCPMF := Value;
end;

procedure TObjSistemaFolha.SetFlgUsaMatriculaDependente(
  const Value: boolean);
begin
  FFlgUsaMatriculaDependente := Value;
end;

procedure TObjSistemaFolha.SetFlgBuscaAdiantamentoPA(const Value: boolean);
begin
  FFlgBuscaAdiantamentoPA := Value;
end;

procedure TObjSistemaFolha.SetFlgAbateTodasReservasRegra(
  const Value: boolean);
begin
  FFlgAbateTodasReservasRegra := Value;
end;

procedure TObjSistemaFolha.SetFlgBuscaAbonoAnteriorPago(
  const Value: boolean);
begin
  FFlgBuscaAbonoAnteriorPago := Value;
end;

procedure TObjSistemaFolha.SetFlgGeraAlteradoresCAPConvenio(
  const Value: boolean);
begin
  FFlgGeraAlteradoresCAPConvenio := Value;
end;

procedure TObjSistemaFolha.SetTipoMargemDesconto(const Value: integer);
begin
  FTipoMargemDesconto := Value;
end;

procedure TObjSistemaFolha.SetVlrMargemDesconto(const Value: real);
begin
  FVlrMargemDesconto := Value;
end;

procedure TObjSistemaFolha.SetFlgUsaProvisaoAbono(const Value: boolean);
begin
  FFlgUsaProvisaoAbono := Value;
end;

function TObjSistemaFolha.IdentificaTipoPessoa(qry: twwquery; alidTitular,
  alidRecebedor: Integer): char;
{ - Identifica o tipo de uma pessoa classificando como:
  'P' - PARTICIPANTE
  'B' - BENEFICIARIO
  'T' - TUTOR RESPONSAVEL
  'C' - CONSIGNATARIO
  'N' - NAO IDENTIFICADO}

begin
  result:='N';
  try
    if FazQuery(qry, 'SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPESSOA = '+
         inttostr(alidrecebedor)) then
    begin
      qry.close; 
      result:='P';
      exit;
    end;

    if FazQuery(qry, 'SELECT IDPESSOA, IDTITULAR FROM BENEFBFCIARIO '+
         'WHERE IDPESSOA = '+inttostr(alidrecebedor)) then
    begin
      if qry.fieldbyname('IDPESSOA').asinteger = qry.fieldbyname('IDTITULAR').asinteger then
        result:='P'
      else
        result:='B';
      qry.close; 
      exit;
    end;

    if FazQuery(qry, 'SELECT DISTINCT IDRESPONSAVEL, IDPESSOA, IDTITULAR '+
         'FROM BFCIARIOTITPLAN WHERE IDRESPONSAVEL = '+inttostr(alidrecebedor)) then
    begin
      if qry.fieldbyname('IDRESPONSAVEL').asinteger = qry.fieldbyname('IDTITULAR').asinteger then
        result:='P'
      else
        if qry.fieldbyname('IDRESPONSAVEL').asInteger = qry.fieldbyname('IDPESSOA').asinteger then
          result:='B'
        else
          result:='T';
      qry.close; 
      exit;
    end;

    if FazQuery(qry, ' SELECT DISTINCT IDTITULAR, IDFAVORECIDO FROM RUBRICAINDIV '+
         'WHERE FLGPENSAOALIM = ''1'' AND IDTITULAR = '+inttostr(alidtitular)+
         'AND IDFAVORECIDO = '+inttostr(alidrecebedor)) then
      result:='C';

    //IDENTIFICAR FAVORECIDOS DE OUTRAS RUBRICAS
    if FazQuery(qry, 'SELECT TIPO FROM VW_RECEBEDOR WHERE IDTITULAR = '+inttostr(alidtitular)+
                     'AND IDRECEBEDOR = '+inttostr(alidrecebedor)) then
      result:=qry.fieldbyname('TIPO').asstring[1];

  except
    qry.close; 
    result:='N';
  end;
end;

procedure TObjSistemaFolha.SetFlgForcaDataFinalRubIndiv(
  const Value: boolean);
begin
  FFlgForcaDataFinalRubIndiv := Value;
end;

procedure TObjSistemaFolha.SetIdRubIRRFReservaTribRegressiva(
  const Value: Integer);
begin
  FIdRubIRRFReservaTribRegressiva := Value;
end;

procedure TObjSistemaFolha.SetFormaParcelaPrevia(const Value: integer);
begin
  FFormaParcelaPrevia := Value;
end;

procedure TObjSistemaFolha.SetCidadeEmpresa(const Value: Integer);
begin
  FCidadeEmpresa := Value;
end;

procedure TObjSistemaFolha.SetPaisEmpresa(const Value: Integer);
begin
  FPaisEmpresa := Value;
end;

procedure TObjSistemaFolha.SetUFEmpresa(const Value: String);
begin
  FUFEmpresa := Value;
end;

procedure TObjSistemaFolha.SetPreparoRetidoAbono(const Value: integer);
begin
  FPreparoRetidoAbono := Value;
end;

procedure TObjSistemaFolha.SetPreparoRetidoMensal(
  const Value: integer);
begin
  FPreparoRetidoMensal := Value;
end;

procedure TObjSistemaFolha.SetIdRubIRRFAbonoREGR(const Value: integer);
begin
  FIdRubIRRFAbonoREGR := Value;
end;

procedure TObjSistemaFolha.SetIdRubIRRFVitalicioREGR(const Value: integer);
begin
  FIdRubIRRFVitalicioREGR := Value;
end;

procedure TObjSistemaFolha.CriaConjuntoRubricaInterno;
var btinhatrans, bconectou: boolean;
    qry: twwquery;

  procedure Conecta;
  begin
    if not bconectou then
    begin
      btinhatrans:=dtmBaseDados.dbBaseDados.InTransaction;
      if not btinhatrans then
        dtmBaseDados.dbBaseDados.StartTransaction;
      bconectou:=true;
    end;
  end;

begin
  bconectou:=false;
  qry:=twwquery.create(application);
  qry.DatabaseName:='Basedados';

  try
    if not FazQuery(qry, 'SELECT * FROM CONJUNTORUBRICA WHERE IDCONJUNTORUBRICA = -1') then
    begin
      Conecta;
      ExecutarQuery(qry,
        'INSERT INTO CONJUNTORUBRICA (IDCONJUNTORUBRICA, DESCRICAO, CODIGO) '+
        'VALUES (-1, ''RUBRICAS QUE SOFREM RATEIO POR PLANO'', ''INT01'')');
    end;
    if bconectou then
    begin
      dtmBaseDados.dbBaseDados.commit;
      if btinhatrans then
        dtmBaseDados.dbBaseDados.StartTransaction;
    end;
  finally
    qry.free;
  end;
end;

procedure TObjSistemaFolha.SetRateioPlanoRubrica(const Value: integer);
begin
  FRateioPlanoRubrica := Value;
end;

procedure TObjSistemaFolha.SetMantemMesRefConstanteRB(const Value: integer);
begin
  FMantemMesRefConstanteRB := Value;
end;

procedure TObjSistemaFolha.SetVerificaRecebedorDuplicado(
  const Value: integer);
begin
  FVerificaRecebedorDuplicado := Value;
end;

procedure TObjSistemaFolha.SetDesativacaoAutomaticaRubricaIndiv(
  const Value: integer);
begin
  FDesativacaoAutomaticaRubricaIndiv := Value;
end;

procedure TObjSistemaFolha.SetFlgDescSimplesIRRF(const Value: integer);
begin
  FFlgDescSimplesIRRF := Value;
end;

procedure TObjSistemaFolha.SetIDRubricaIrDescSimples(const Value: integer);
begin
  FIDRubricaIrDescSimples := Value;
end;

procedure TObjSistemaFolha.SetIDRubricaIrDescSimplesAbn(
  const Value: integer);
begin
  FIDRubricaIrDescSimplesAbn := Value;
end;

procedure TObjSistemaFolha.SetIDRubIrDescSimplesInss(const Value: integer);
begin
  FIDRubIrDescSimplesInss := Value;
end;

procedure TObjSistemaFolha.SetIDRubIrDescSimplesInssAbn(
  const Value: integer);
begin
  FIDRubIrDescSimplesInssAbn := Value;
end;

procedure TObjSistemaFolha.SetFlgNovoIRExterior(const Value: integer);
begin
  FFlgNovoIRExterior := Value;
end;

initialization
finalization
  SistemaFolha.free;
end.

{------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/04/2 002 A 18/04/2002                        |
| VERSÃO PARA LIBERAÇÃO: 3.02.12J                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDRUBCPMFPAINSS para armazenar o valor do parametro   |
|   relativo ao valor do CPMF da pensão alimenticia sobre o beneficio do inss. |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/05/2002 A 17/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDRUBCPMFPAINSSDESC para armazenar o valor do parametro|
|   relativo ao valor do desconto da CPMF da pensão alimenticia sobre o        |
|   beneficio do inss.                                                         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Criação do parâmetro FLGNUMDEPIRNUMDEPSALFAM para controlar se o sistema  |
|    vai executar o cálculo autómático de dependentes para o imposto de renda  |
|    e dependentes de salário família.                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2002 A 09/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Criação do parâmetro FLGESTADORUB para controlar se o sistema vai usar ou |
|    não esse campo da tabela como parâmetro.                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2002 A 10/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parâmetro IDGRUPOREGRA, para saber a qual o grupo a que a regra |
|   pertence, e o parâmetro FLGUSAREGRAXRUB, que testa se o usuário irá usar   |
|   somente rubricas associadas as regra da folha ou não.                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente a integração com a Contabilidade            |
| - Criação do parâmetro referernte a integração com o Financeiro              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDPROGRAMAFOLHA do contas a pagar .                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13i                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro FLGNUMLOTES que determina a quantidade de lotes que   |
|   podem estar abertos simultaneamente.                                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13k                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao dos novos parametros IDRUBCREDSALFAM, VALORSALFAM e TETOSALFAM    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2002 A 06/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13L                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao do novo parametro MASCARAMATRICULA                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13o                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Implementei os parametros relativos a margem de 30% e 70%                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/09/2002 A 02/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONTROLA SE BASES CALCULADAS NA PREVIA PODEM SER NEGATIVAS                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/11/2002 A 19/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro FlgMensErroValRegra.                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/12/2002 A 18/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão de cinco novos parâmetros: FlgReajustaCancelado,               |
|    FlgCancelaFilho, FlgPreparaBenefDesativado, FlgTrataLoteIndependente,     |
|    FlgReajusteEmLote                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/12/2002 A 20/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro FlgConfirmaNoFinal                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/01/2003 A 10/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Criação de novos parâmetros na tela de parâmetros da folha na página de |
|    convênios. Os parâmetros são: TipDocConvP e TipDocConvR.                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/01/2003 A 22/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Flag para indicar se salario virtual será calculado todo mês                 |
| PENDENCIA 10794                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/01/2003 A 24/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão dos parâmetros IdRubIRRFINSSAbono e FlgAbreRubAcJud.           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/02/2003 A 04/02/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro FLGPARTIDADOBRADA                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/04/2003 A 10/04/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro FlgCalcPensAlimAntPrevia.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/04/2003 A 24/04/2003                         |
| PENDÊNCIA: 13825                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Parâmetro para verificar o cadastramento de regras na Rubrica Individual e   |
| ação judicial verificando as regras agrupadas no mesmo tipo de regra.        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/04/2003 A 24/04/2003                         |
| PENDÊNCIA: 13824                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Parâmetro de tipo de regra padrão sobre o qual a verificação de cadastramento|
| por tipo de regra não será realizada.                                        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/05/2003 A 06/05/2003                         |
| PENDÊNCIA: 13822                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05                                               |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| CRIAÇÃO DE PARÂMETRO PARA CONTROLE DE PROCESSAMENTO DE PAGAMENTOS PARA FAVO- |
| RECIDOS REGISTRADOS NA PASTA OUTRAS RUBRICAS DA RUBRICA INDIVIDUAL.          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/08/2003 A 04/08/2003                         |
| PENDÊNCIA: 14554                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.00                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DE PARÂMETROS PARA CONTROLAR A UTILIZAÇÃO NA PREVIA DA BASE DE IRRF|
| GERADA NO MÊS EM OUTRAS VERSÕES DA FOLHA NO MESMO MÊS PELA DATA DE PAGTO.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/08/2003 A 12/08/2003                         |
| PENDÊNCIA: 13995                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01b                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA USAR OBJETO DE IRRF CUSTOMIZADO PARA TABELA DE IR HISTÓRICA.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/05/2004 A 27/05/2004                         |
| PENDÊNCIA: 16857                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.11i                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DE PARÂMETRO DE REGRA DE CÁLCULO DO SALÁRIO FAMÍLIA.               |
|                                                                              |
|------------------------------------------------------------------------------}






