//*****************************************************************************
//Data        : 07/06/2010
//SOL         : 124730
//Kintana     : 668611
//Responsável : Ricardo Cristiano
//Problema    : Alterar a data de contabilização rendas/variações positivas
//               provenientes de bonificações, dividen...
//Solução     : Implementação  ...
//*****************************************************************************
//Data        : 21/07/2009
//SOL         : 122235
//Kintana     : 597042
//Responsável : Ricardo Cristiano
//Problema    : Foram realizadas as operações de grupamento e desdobramento
//               respectivamente para o ativo "Bradesco PN", porém, o saldo final
//               não está refletindo o valor de quantidade correta.
//Solução     : Implementação para identificar a operação de desdobramento(
//              qryHistDesdobramento)
//*****************************************************************************
// Data	     : 12/05/2007
// Código    : Al_35
// Pendencia : 25129
// SOL       : 58645
// Motivo(S) : Implementação da integração por Módulos do item Opções de Indice
//*****************************************************************************
// Data	     : 31/05/2007
// Código    : Al_34
// Pendencia : 25509
// SOL       :
// Motivo(S) : Implementaçâo de tratamento para identificar o Tipo de Operação
//              que traz as contas transitórias de liquidação para operações de
//              Renda Variável;
//*****************************************************************************
// Data      : 26/03/2007
// Código    : AL_33
// Pendencia :
// SOL       :
// Desc      : Implementação de ajuste nas query´s(qryHistorico, qryOperacao) que so é usada
//             para a operação de Resgate de Fundos de Investimento com Compra de Ações
//*****************************************************************************
// Data      : 23/01/2007
// Código    : AL_32
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do paramentro IDMOTBLOQPENFDO, IDCARTEIRARF para Bloqueio de
//             Fundos e Penhora com o Jurídico
//*****************************************************************************
// Data      : 16/03/2007
// Código    : AL_31
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação de Bloqueio Contabil e Financeiro por Módulo
//             Criação de novos parametros de sistema na qryParamInvest
//*****************************************************************************
// Data      : 06/11/2006
// Código    : AL_30
// Pendencia : 22492
// SOL       :
// Desc      : Implementação de Contabilização em dias úteis para ativos de
//             Renda Fixa que geram registros em dias não uteis
//             Contabiliza FLGCONTABDIAUTIL
//*****************************************************************************
// Data      : 31/08/2006
// Código    : AL_29
// Pendencia : 22965
// SOL       :
// Desc      : Segregação de Plano / Patrocinadora
//             Alteradas as queries: qryHistGrupamento e qryHistGrupamentoGer
//*****************************************************************************
// Código    : AL_28
// Pendencia : 22957
// SOL       :
// Desc      : Exclusão da OperacaoInvest pela ProcExcluiCustodia (qryDelOperacaoInvest)
//*****************************************************************************
// Data     : 10/08/2006
// Código   : AL_27
// Pendencia:
// SOL      :
// Desc     : Ajuste na BuscaTodosSaldos para não pegar operações -10170
//               (Cancelamento de Recebimentos)
//*****************************************************************************
// Data     : 28/07/2006
// Código   : AL_26
// Pendencia:
// SOL      :
// Desc     : Ajuste na qryBuscaTipoOperacao para retirada do controle de acesso
//*****************************************************************************
// Data     : 07/06/2006
// Código   : AL_25
// Pendencia:
// SOL      :
// Desc     : Implementação de Provisão de Perda baseada em fluxo de percentual
//            Alteração nas qrySaldoInvestimentoTNull e qrySaldoInvestimentoCartGer
//*****************************************************************************
// Data     : 03/04/2006
// Código   : AL_24
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia(SALDOQTDECPMF)
//*****************************************************************************
// Data     : 28/03/2006
// Código   : AL_23
// Motivo   : Melhora na performance da qyrSaldoInvestCustodia, agora com Indice
//*****************************************************************************
// Data     : 17/02/2006
// Código   : AL_22
// Motivo   : Não exclui mais o documento, "limpa" todos os campos e deixa o documento lá
//                alterada a qryDocumento
//            Não foi aprovado, foi gerada a qryDocumentoNull que faz isso e a qryDocumento
//                continua a deletar o documento
//*****************************************************************************
// Data     : 03/02/2006
// Código   : AL_??
// Motivo   : Criação do campo MASCSCLASSIFANBID na PARAMINVEST para tratar a máscara
//            do código da Classificacao ANBID
//*****************************************************************************
// Data     : 01/03/2006
// Código   : AL_21
// Pendencia: fechamento da boleta
// Sol      :
// Motivo   : Ajuste na qryUpdateHistPorDesp para acerto do sinal de =
//*****************************************************************************
// Data     : 09/02/2006
// Código   : AL_20
// Pendencia:
// Sol      :
// Motivo   : Criação do campo DATAINIRECCPMF e PZORECCPMF na qryParamInvest para identificar
//            o dia para recolhimento do CPMF
//*****************************************************************************
// Data     : 14/02/2006
// Código   : AL_19
// Pendencia:
// Sol      :
// Motivo   : Ajuste nas queries qrySaldoInvestimentoTNull e qrySaldoInvestimentoCartGer
//             para desconsiderar as operações Anúncio (-70 e -10070)
//*****************************************************************************
// Data     : 16/01/2006
// Código   : AL_18
// Pendencia:
// Sol      : 39835
// Motivo   : Ajuste nas queries qrySaldoInvestimentoTNull e qrySaldoInvestimentoCartGer
//             para desconsiderar as operações de Dividendos, Juros sobre Capital e Multa, CC e CCI (+10000)
//*****************************************************************************
// Data     : 11/01/2006
// Código   : AL_17
// Pendencia:
// Sol      :
// Motivo   : Ajuste na qyrPadrLanc para contabilização especificando o investimento
//*****************************************************************************
// Data     : 06/12/2005
// Código   : AL_16
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo FLGREGIMECXCOMP, DTAREGIMECXCOMP na PARAMINVEST para testar a utilização
//            de regime de Caixa ou Competência nas Operações de Renda Fixa
//*****************************************************************************
// Data     : 02/12/2005
// Código   : AL_15
// Pendencia:
// Sol      : 38851
// Motivo   : Ajuste na query qrySaldoInvestCustodia para captar o maior ID do dia
//*****************************************************************************
// Data     : 27/10/2005
// Código   : AL_14
// Motivo   : Inclusão do Parâmetro IDTIPOOPERDIRDSA e IDTIPOOPERDIRDSR na qryParamInvest
//*****************************************************************************
//Data	     :  21/10/2005
//          :  AL_13
//Função    :  Acerto nos tipos de dados dos parametros da qryInsHistCartInv
//*****************************************************************************
//Data	     :  13/10/2005
//          :  AL_12
//Função    :  Inclusão do Parâmetro IDTIPOOPERRFRAC no registro do Parâmetro
//*****************************************************************************
// Data     : 28/04/2005
// Código   : AL_11
// Motivo   : Implemetação da qryHistGrupamento e qryHistGrupamentoGer
//*****************************************************************************
// Data     : 28/04/2005
// Código   : AL_11
// Motivo   : Inclusão do Parâmetro FLGPOUPAPROPDIA na qryParamInvest
//*****************************************************************************
// Data     : 08/03/2005
// Motivo   : Alteração no SQL da qryTipoOperacao.
//            Passa a trazer a descrição do tipo da operação
//*****************************************************************************
// Data     : 10/02/2005
// Motivo   : Alteração no SQL da qryPadrLanc.
//            Erro ao não passar a carteira e/ou Tipo de despesa
//*****************************************************************************
// Data     : 03/02/2005
// Motivo   : Atualização da qryPadrLanc
//*****************************************************************************
// Data     : 06/12/2004
// Motivo   : Implementacao da IDTIPOOPERDIRDSU na qryParamInvest
//*****************************************************************************
// Data     : 29/11/2004
// Motivo   : Implementação do FLGRECPAGRV na qryParamInvest
//*****************************************************************************
// Data     : 07/10/2004
// Motivo   : Implementação da QryBuscaTpOpOperInvest
//*****************************************************************************
// Data     : 07/10/2004
// Motivo   : Novo campo na qryTipoOperacao FLGCONTAINVEST
//*****************************************************************************
// Data     : 07/10/2004
// Motivo   : Novo campo SALDOQTDECPMF na InsertHistCartInv, qryUpdateHistPorDesp e qryUpdateHistPorOper
//*****************************************************************************
// Data     : 30/09/2004
// Motivo   : Implementacao da DTMUDACPMF na qryParamInvest
//*****************************************************************************
// Data     : 15/07/2004
// Motivo   : Retirado o Owner CM. da QryBuscaTipoOperacao
//*****************************************************************************
// Data     : 17/06/2004
// Origem   : CM
// Motivo   : Melhora nas queries qrySaldoInvestimentoTNull e qrySaldoInvestimentoCartGer
//*****************************************************************************
// Data     : 16/06/2004
// Origem   : CM
// Motivo   : Incluido o campo SALDOBLOQUEADO na qry qrySaldoInvestCustodia
//*****************************************************************************
// Data     : 17/05/2004
// Origem   : CM
// Motivo   : Implementacao do campo FLGINTFINLIQ na qryParamInvest
//*****************************************************************************

Unit dOperComum;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, Wwdatsrc, DBTables, Wwquery, ppDB, ppComm, ppRelatv, ppDBPipe,
   ppDBBDE;

Type
   TdtmOperComum = Class(TDataModule)
      qrySaldoCarteira: TwwQuery;
      qryTipoOperacao: TwwQuery;
      qryTipoOperacaoFLGGERACONTAB: TFloatField;
      qryTipoOperacaoFLGGERACAPCAR: TFloatField;
      qryTipoOperacaoCODTIPDOC: TFloatField;
      qryTipoOperacaoRECPAG: TStringField;
      qryAuxiliar: TwwQuery;
      qryDespXTipoOper: TwwQuery;
      qryDespXTipoOperFLGGERACONTAB: TFloatField;
      qryDespXTipoOperFLGGERACAPCAR: TFloatField;
      qryDespXTipoOperCODTIPDOC: TFloatField;
      qryDespXTipoOperRECPAG: TStringField;
      qryIntegraContab: TwwQuery;
      qryIntegraContabMASCARA: TStringField;
      qryFlgAtualSaldo13: TwwQuery;
      qryFlgAtualSaldo13IDHISTCARTINV: TFloatField;
      qryFlgAtualSaldo13DATAMOVCARTINV: TDateTimeField;
      qryFlgAtualSaldo13IDCARTEIRAINVEST: TFloatField;
      qryFlgAtualSaldo13IDINVESTIMENTO: TFloatField;
      qryFlgAtualSaldo13FLGCALCSALDO: TStringField;
      qryFlgAtualSaldo13NATURMOVCARTINV: TStringField;
      qryFlgAtualSaldo13IDLOTE: TStringField;
      qryFlgAtualSaldo2: TwwQuery;
      qryBuscaCli: TwwQuery;
      qryBuscaCliCODSUBCONTA: TFloatField;
      qryBuscaForn: TwwQuery;
      qryBuscaFornCODSUBCONTA: TFloatField;
      qryVerificaConta: TwwQuery;
      qryVerificaContaPLASUBCONTA: TStringField;
      qryVerificaContaPLACCUST: TStringField;
      qryAtualizaSaldoIL: TwwQuery;
      qryMoeda: TwwQuery;
      qryMoedaMOEPERIODICIDADE: TStringField;
      qryMoedaFLGPERCVALOR: TStringField;
      qryInsertHistCartInv: TwwQuery;
      qryBuscaHistPorOper: TwwQuery;
      qryBuscaHistPorHist: TwwQuery;
      qryBuscaProxHistCart: TwwQuery;
      qryMarcaFlagHist: TwwQuery;
      qryBuscaProxInvest: TwwQuery;
      qryBuscaHistDesp: TwwQuery;
      qryBuscaHistOper: TwwQuery;
      qryBuscaCustodia: TwwQuery;
      qryBuscaCustodiaTIPOCUSTODIA: TStringField;
      qryBuscaHistDespIDHISTCARTINV: TFloatField;
      qryBuscaHistOperIDHISTCARTINV: TFloatField;
      qrySaldoCarteiraIDHISTCARTINV: TFloatField;
      qrySaldoCarteiraDATAMOVCARTINV: TDateTimeField;
      qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField;
      qrySaldoCarteiraSALDOCOTASCARTINV: TFloatField;
      qrySaldoCarteiraSALDOVLRCARTINV: TFloatField;
      qrySaldoCarteiraSALDOQTDEINVCART: TFloatField;
      qrySaldoCarteiraSALDOVLRINVCART: TFloatField;
      qryBuscaProxInvestIDHISTCARTINV: TFloatField;
      qryBuscaProxInvestIDINVESTIMENTO: TFloatField;
      qryBuscaProxHistCartIDHISTCARTINV: TFloatField;
      qryBuscaProxHistCartIDCARTEIRAINVEST: TFloatField;
      qryBuscaProxHistCartIDINVESTIMENTO: TFloatField;
      qryBuscaProxHistCartIDLOTE: TStringField;
      qryBuscaHistPorHistIDHISTCARTINV: TFloatField;
      qryBuscaHistPorHistFLGCALCSALDO: TStringField;
      qryBuscaHistPorHistIDCARTEIRAINVEST: TFloatField;
      qryBuscaHistPorHistIDINVESTIMENTO: TFloatField;
      qryBuscaHistPorHistIDLOTE: TStringField;
      qryBuscaHistPorHistDATAMOVCARTINV: TDateTimeField;
      qryBuscaHistPorOperIDHISTCARTINV: TFloatField;
      qryBuscaHistPorOperFLGCALCSALDO: TStringField;
      qryBuscaHistPorOperIDCARTEIRAINVEST: TFloatField;
      qryBuscaHistPorOperIDINVESTIMENTO: TFloatField;
      qryBuscaHistPorOperIDLOTE: TStringField;
      qryBuscaHistPorOperDATAMOVCARTINV: TDateTimeField;
      qryUpdateHistPorDesp: TwwQuery;
      qryUpdateHistPorOper: TwwQuery;
      qryBuscaHistorico: TwwQuery;
      qryBuscaHistoricoIDHISTCARTINV: TFloatField;
      qryBuscaHistoricoFLGCALCSALDO: TStringField;
      qryBuscaHistoricoIDCARTEIRAINVEST: TFloatField;
      qryBuscaHistoricoIDINVESTIMENTO: TFloatField;
      qryBuscaHistoricoIDLOTE: TStringField;
      qryBuscaHistoricoDATAMOVCARTINV: TDateTimeField;
      qryBuscaHistTransf: TwwQuery;
      qryUpdateHistSaldo: TwwQuery;
      qryBuscaHistTransfVLRMOVCARTINV: TFloatField;
      qryDesmarcaFlagIni: TwwQuery;
      FloatField4: TFloatField;
      qryBuscaHistOperVLRMOVCARTINV: TFloatField;
      qryBuscaHistOperQTDEMOVINVCART: TFloatField;
      qryBuscaTotDesp: TwwQuery;
      qryBuscaTotDespVLRMOVCARTINV: TFloatField;
      qryUpdateHistFlagValor: TwwQuery;
      qryBuscaHistTransfMOVIMAQUI: TFloatField;
      qryBuscaHistTransfMOVIMCAR: TFloatField;
      qryBuscaHistTransfMOVIMATU: TFloatField;
      qryBuscaHistTransfVLRVARIACAO: TFloatField;
      qryBuscaHistTransfVLRJUROS: TFloatField;
      qryBuscaHistTransfVLRPREMIO: TFloatField;
      qryBuscaHistTransfVLRIRPROV: TFloatField;
      qryBuscaHistTransfVLRIRAPU: TFloatField;
      qryBuscaHistTransfVLRIOFPROV: TFloatField;
      qryBuscaHistTransfVLRIOFAPU: TFloatField;
      qryBuscaHistTransfVLRAGIO: TFloatField;
      qryUpdateHistorico: TwwQuery;
      qryFlgAtualSaldo2IDHISTCARTINV: TFloatField;
      qryFlgAtualSaldo2DATAMOVCARTINV: TDateTimeField;
      qryFlgAtualSaldo2IDLOTE: TStringField;
      qryFlgAtualSaldo2IDCARTEIRAINVEST: TFloatField;
      qryFlgAtualSaldo2IDINVESTIMENTO: TFloatField;
      qryFlgAtualSaldo2FLGCALCSALDO: TStringField;
      qryAtualizaSaldoILIDHISTCARTINV: TFloatField;
      qryAtualizaSaldoILDATAMOVCARTINV: TDateTimeField;
      qryAtualizaSaldoILNATURMOVOPER: TStringField;
      qryAtualizaSaldoILIDOPERACAOINVEST: TFloatField;
      qryAtualizaSaldoILIDDESPOPERINVEST: TFloatField;
      qryAtualizaSaldoILSALDOQTDEINVCART: TFloatField;
      qryAtualizaSaldoILSALDOVLRINVCART: TFloatField;
      qryAtualizaSaldoILVLRMOVCARTINV: TFloatField;
      qryAtualizaSaldoILCOTASMOVCARTINV: TFloatField;
      qryAtualizaSaldoILNATURMOVCARTINV: TStringField;
      qryAtualizaSaldoILQTDEMOVINVCART: TFloatField;
      qryAtualizaSaldoILMOVIMATU: TFloatField;
      qryAtualizaSaldoILSALDOATU: TFloatField;
      qryAtualizaSaldoILMOVIMCAR: TFloatField;
      qryAtualizaSaldoILSALDOCAR: TFloatField;
      qryAtualizaSaldoILMOVIMAQUI: TFloatField;
      qryAtualizaSaldoILSALDOAQUI: TFloatField;
      qryAtualizaSaldoILSALDOREND: TFloatField;
      qryAtualizaSaldoILFLGCALCSALDO: TStringField;
      qryAtualizaSaldoILTIPMOVCARTINV: TStringField;
      qryAtualizaSaldoILIDCARTEIRAINVEST: TFloatField;
      qryAtualizaSaldoILIDINVESTIMENTO: TFloatField;
      qryAtualizaSaldoILIDLOTE: TStringField;
      qryAtualizaSaldoILVLRJUROS: TFloatField;
      qryAtualizaSaldoILVLRVARIACAO: TFloatField;
      qryAtualizaSaldoILVLRIRPROV: TFloatField;
      qryAtualizaSaldoILVLRIRAPU: TFloatField;
      qryAtualizaSaldoILVLRIOFPROV: TFloatField;
      qryAtualizaSaldoILVLRIOFAPU: TFloatField;
      qryAtualizaSaldoILVLRAGIO: TFloatField;
      qryAtualizaSaldoILIDTIPOOPERACAO: TFloatField;
      qryAtualizaSaldoILFLGCALCDIARIO: TFloatField;
      qryAtualizaSaldoILVLRPREMIO: TFloatField;
      qryPadrLanc: TwwQuery;
      qryPadrLancIDPESSOA: TFloatField;
      qryPadrLancIDPADRLANCCONT: TFloatField;
      qryPadrLancIDTIPOINVEST: TFloatField;
      qryPadrLancIDTIPOOPERACAO: TFloatField;
      qryPadrLancIDTIPODESPINVEST: TFloatField;
      qryPadrLancIDCARTEIRAINVEST: TFloatField;
      qryPadrLancCODTIPTITULO: TStringField;
      qryPadrLancIDINVESTIMENTO: TFloatField;
      qryPadrLancIDFORCLI: TFloatField;
      qryPadrLancFLGPAGRECNAO: TStringField;
      qryPadrLancRECPAG: TStringField;
      qryPadrLancCODCENTRORESPON: TStringField;
      qryPadrLancCODTIPRECDES: TStringField;
      qryPadrLancUNIDNEGOC: TFloatField;
      qryPadrLancPLANO: TFloatField;
      qryPadrLancCONTADOPERFIN: TStringField;
      qryPadrLancCONTACOPERFIN: TStringField;
      qryPadrLancCENCUSTDINVEST: TStringField;
      qryPadrLancCENCUSTCINVEST: TStringField;
      qryPadrLancIDEMPRESA: TFloatField;
      qryPadrLancCODSUBCONTAD: TFloatField;
      qryPadrLancCODSUBCONTAC: TFloatField;
      qryPadrLancTIPCODIGO: TStringField;
      qryPadrLancTIPMOVCARTINV: TStringField;
      qryPadrLancTIPLANCINVEST: TStringField;
      qryPadrLancHISTLANCINVEST: TStringField;
      qryPadrLancIDREGRALANCONTINV: TFloatField;
      qryPadrLancTIPFORNINV: TStringField;
      QryDespesasOperacao: TwwQuery;
      QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
      QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
      QryDespesasOperacaoVLRDESPOPER: TFloatField;
      QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
      qryDespNegXTipoOper: TwwQuery;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      StringField1: TStringField;
      qryTipoOperacaoNATUREZAOPERACAO: TStringField;
      qryDespNegXTipoOperIDTIPODESPINVEST: TFloatField;
      qryMoedaMOESIGLA: TStringField;
      qryBuscaHistoricoPLANO: TFloatField;
      qryBuscaHistoricoPLNCODIGO: TFloatField;
      qryBuscaHistoricoCODDOCUMENTO: TFloatField;
      qryInvestimento: TwwQuery;
      qryInvestimentoDESCINVESTIMENTO: TStringField;
      qryCarteira: TwwQuery;
      qryCarteiraDESCCARTINVEST: TStringField;
      qryCarteiraIDPLANOPREV: TFloatField;
      qryCarteiraIDPATROCINADORA: TFloatField;
      QryLucroPrejuizo: TwwQuery;
      QryBuscaTotDespOper: TwwQuery;
      QryUpdHistCartInv: TwwQuery;
      QryBuscaCotacaoInvest: TwwQuery;
      qryLancaDocumento: TwwQuery;
      QryLocal1: TwwQuery;
      QryBuscaTipoOperacao: TwwQuery;
      QryBuscaTipoOperacaoIDTIPOINVEST: TFloatField;
      QryBuscaTipoOperacaoIDTIPOOPERACAO: TFloatField;
      QryBuscaTipoOperacaoIDMERCADO: TFloatField;
      QryBuscaTipoOperacaoDESCTIPOOPERACAO: TStringField;
      QryBuscaTipoOperacaoNATUREZAOPERACAO: TStringField;
      QryBuscaTipoOperacaoTIPOCUSTODIA: TStringField;
      QryBuscaTipoOperacaoVENCIMENTO: TFloatField;
      QryBuscaTipoOperacaoTIPCREDOR: TStringField;
      QryBuscaTipoOperacaoFLGTRANSF: TStringField;
      QryBuscaTipoOperacaoFLGCORRET: TStringField;
      QryBuscaTipoOperacaoRECPAG: TStringField;
      qryAtualizaSaldoILIDTIPOINVEST: TFloatField;
      qryParamInvest: TwwQuery;
      QryVerFechamento: TwwQuery;
      QryBuscaCotacaoInvestDATACOTACAO: TDateTimeField;
      QryBuscaCotacaoInvestVLRCONTABIL: TFloatField;
      QryBuscaCotacaoInvestQTDTITLOTE: TFloatField;
      qryFlgAtualSaldo13IDTIPOINVEST: TFloatField;
      qryBuscaSubconta: TwwQuery;
      qryBuscaSubcontaSUBCONTAD: TFloatField;
      qryBuscaSubcontaSUBCONTAC: TFloatField;
      qryAtualizaSaldoC: TwwQuery;
      qryAtualizaSaldoCIDHISTCARTINV: TFloatField;
      qryAtualizaSaldoCIDINVESTIMENTO: TFloatField;
      qryAtualizaSaldoCIDLOTE: TStringField;
      qryAtualizaSaldoCNATURMOVOPER: TStringField;
      qryAtualizaSaldoCIDOPERACAOINVEST: TFloatField;
      qryAtualizaSaldoCSALDOCOTASCARTINV: TFloatField;
      qryAtualizaSaldoCSALDOVLRCARTINV: TFloatField;
      qryAtualizaSaldoCVLRMOVCARTINV: TFloatField;
      qryAtualizaSaldoCCOTASMOVCARTINV: TFloatField;
      qryAtualizaSaldoCNATURMOVCARTINV: TStringField;
      qryAtualizaSaldoCIDDESPOPERINVEST: TFloatField;
      qryAtualizaSaldoCFLGCALCSALDO: TStringField;
      qryAtualizaSaldoCTIPMOVCARTINV: TStringField;
      qryAtualizaSaldoCQTDEMOVINVCART: TFloatField;
      qryAtualizaSaldoCDATAMOVCARTINV: TDateTimeField;
      qryAtualizaSaldoCIDCARTEIRAINVEST: TFloatField;
      qryAtualizaSaldoCIDTIPOOPERACAO: TFloatField;
      qryAtualizaSaldoCFLGCALCDIARIO: TFloatField;
      qryAtualizaSaldoCIDTIPOINVEST: TFloatField;
      qryAtualizaSaldoCMOVIMAQUI: TFloatField;
      qryAtualizaSaldoCIDTIPOOPERHIST: TFloatField;
      qryBuscaHistoricoIDTIPOINVEST: TFloatField;
      qryFlgAtualSaldo13IDCARTEIRAGERENC: TFloatField;
      qrySaldoCarteiraIDCARTEIRAGERENC: TFloatField;
      qryFlgAtualSaldo2IDCARTEIRAGERENC: TFloatField;
      qrySaldoCarteiraNull: TwwQuery;
      FloatField23: TFloatField;
      DateTimeField2: TDateTimeField;
      FloatField24: TFloatField;
      FloatField25: TFloatField;
      FloatField26: TFloatField;
      FloatField27: TFloatField;
      FloatField28: TFloatField;
      FloatField29: TFloatField;
      QryLanctoDocum: TwwQuery;
      QryLotexDocum: TwwQuery;
      QryDocumento: TwwQuery;
      QryLancamento: TwwQuery;
      QryRecbtoPagto: TwwQuery;
      QryPlanilha: TwwQuery;
      QryIrLitigio: TwwQuery;
      QryHistCartInv: TwwQuery;
      QryRateioDocum: TwwQuery;
      qryBetaCarteira: TwwQuery;
      qryBetaCarteiraIDCARTEIRAINVEST: TFloatField;
      qryBetaCarteiraVLRBETACART: TFloatField;
      qryBetaCarteiraTOTALSALDO: TFloatField;
      QrySaldoVariacao: TwwQuery;
      QrySaldoVariacaoSALDO: TFloatField;
      pplEmpresa: TppBDEPipeline;
      UpdValorizacao: TUpdateSQL;
      QryValorizacao: TwwQuery;
      dsValorizacao: TwwDataSource;
      QryValorizacaoDATA: TDateTimeField;
      QryValorizacaoQUANTIDADE: TFloatField;
      QryValorizacaoVLRCOTA: TFloatField;
      QryValorizacaoSALDO: TFloatField;
      QryValorizacaoSALDOCOT: TFloatField;
      QryValorizacaoVLRAPLICACAO: TFloatField;
      QryValorizacaoVLRRESGATE: TFloatField;
      QryValorizacaoIDRELATORIO: TFloatField;
      QryUpdSaldoHistCaixa: TwwQuery;
      qryUpdDataUltFechRV: TwwQuery;
      qryHistorico: TwwQuery;
      qryOperacao: TwwQuery;
      qryHistoricoCODDOCUMENTO: TFloatField;
      qryHistoricoPLANO: TFloatField;
      qryHistoricoPLNCODIGO: TFloatField;
      qryOperacaoIDOPERACAOINVEST: TFloatField;
      qryOperacaoIDINVESTIMENTO: TFloatField;
      qryOperacaoIDCUSTODIANTE: TFloatField;
      qryOperacaoIDCARTEIRAINVEST: TFloatField;
      qrySaldoInvestCustodia: TwwQuery;
      qrySaldoInvestCustodiaSALDOLIBERADO: TFloatField;
      qryLocal: TwwQuery;
      dsEmpresa: TwwDataSource;
      qryEmpresa: TwwQuery;
      qryEmpresaIDPESSOA: TFloatField;
      qryEmpresaNOMEEMPRESA: TStringField;
      qryEmpresaRAZAOSOCIAL: TStringField;
      qryEmpresaIDENDERECO: TFloatField;
      qryEmpresaCEP: TStringField;
      qryEmpresaIMAGEM: TBlobField;
      qryFlgContabil: TwwQuery;
      qryFlgContabilFLGGERACONTAB: TFloatField;
      qryOperacaoQTDEOPERACAO: TFloatField;
      qryBuscaPlanPatro: TwwQuery;
      qryBuscaPlanPatroIDPATRO: TFloatField;
      qryBuscaPlanPatroIDPLANOPREV: TFloatField;
      qryBuscaPlnCodigo: TwwQuery;
      qryBuscaPlnCodigoPLNCODIGO: TFloatField;
      qryUpdOperCustodia: TwwQuery;
      FloatField10: TFloatField;
      FloatField38: TFloatField;
      FloatField39: TFloatField;
      FloatField40: TFloatField;
      FloatField41: TFloatField;
      DateTimeField5: TDateTimeField;
      FloatField42: TFloatField;
      FloatField43: TFloatField;
      FloatField44: TFloatField;
      StringField4: TStringField;
      StringField14: TStringField;
      StringField15: TStringField;
      FloatField45: TFloatField;
      qryDelHistCartInv: TwwQuery;
      FloatField5: TFloatField;
      FloatField30: TFloatField;
      FloatField31: TFloatField;
      FloatField32: TFloatField;
      FloatField33: TFloatField;
      DateTimeField4: TDateTimeField;
      FloatField34: TFloatField;
      FloatField35: TFloatField;
      FloatField36: TFloatField;
      StringField11: TStringField;
      StringField12: TStringField;
      StringField13: TStringField;
      FloatField37: TFloatField;
      qryDelHistCustodia: TwwQuery;
      FloatField20: TFloatField;
      FloatField21: TFloatField;
      FloatField22: TFloatField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      DateTimeField3: TDateTimeField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      FloatField11: TFloatField;
      StringField8: TStringField;
      StringField9: TStringField;
      StringField10: TStringField;
      FloatField12: TFloatField;
      qryDelOperCustodia: TwwQuery;
      FloatField13: TFloatField;
      FloatField14: TFloatField;
      FloatField15: TFloatField;
      FloatField16: TFloatField;
      FloatField17: TFloatField;
      DateTimeField1: TDateTimeField;
      FloatField18: TFloatField;
      FloatField19: TFloatField;
      FloatField46: TFloatField;
      StringField5: TStringField;
      StringField6: TStringField;
      StringField7: TStringField;
      FloatField47: TFloatField;
      qryParamInvestIDPARAMINVEST: TFloatField;
      qryParamInvestMASCSETOREMISSOR: TStringField;
      qryParamInvestMOECODIGO: TFloatField;
      qryParamInvestMASCCLASSIFINV: TStringField;
      qryParamInvestVLRDIVERG: TFloatField;
      qryParamInvestVLRCOTAINICART: TFloatField;
      qryParamInvestDATAULTFECH: TDateTimeField;
      qryParamInvestFLGORDMOVINV: TStringField;
      qryParamInvestPERCPUORDMOVINV: TFloatField;
      qryParamInvestPERCIMPRENDA: TFloatField;
      qryParamInvestMOEDAATU: TFloatField;
      qryParamInvestPERCPARTICEMPR: TFloatField;
      qryParamInvestTRGDTINCLUSAO: TDateTimeField;
      qryParamInvestTRGUSERINCLUSAO: TStringField;
      qryParamInvestPERCPARTICRECUR: TFloatField;
      qryParamInvestIDPARAMPATRLIQ: TFloatField;
      qryParamInvestTIPOMENU: TStringField;
      qryParamInvestDATAULTFECHRF: TDateTimeField;
      qryParamInvestIDTIPODESPIRAPU: TFloatField;
      qryParamInvestIDTIPODESPINVEST: TFloatField;
      qryParamInvestMOEDAGER: TFloatField;
      qryParamInvestFLGPROVISIONAIRRF: TStringField;
      qryParamInvestFLGPROVISIONAIRRV: TStringField;
      qryParamInvestPUCDB: TFloatField;
      qryParamInvestDATAMOVCDBLIB: TDateTimeField;
      qryParamInvestIDTIPODESPIRPROV: TFloatField;
      qryParamInvestMOEDAATULIT: TFloatField;
      qryParamInvestIDPROGRAMA: TFloatField;
      qryParamInvestIDTIPOCLIENTECOR: TFloatField;
      qryParamInvestIDTIPOOPERDIRINC: TFloatField;
      qryParamInvestIDTIPOOPERDIRCIS: TFloatField;
      qryParamInvestIDTIPOOPERDIRDES: TFloatField;
      qryParamInvestIDTIPOOPERDIRGRU: TFloatField;
      qryParamInvestIDTIPOOPERDIRPER: TFloatField;
      qryParamInvestIDTIPOOPERDIRBON: TFloatField;
      qryParamInvestIDTIPOOPERDIRDIV: TFloatField;
      qryParamInvestIDTIPOOPERDIRSUB: TFloatField;
      qryParamInvestIDTIPOINVEST: TFloatField;
      qryParamInvestIDTIPOOPERDIRJUR: TFloatField;
      qryParamInvestIDTIPOCLIENTEEMI: TFloatField;
      qryParamInvestIDTIPOCLIENTECUS: TFloatField;
      qryParamInvestIDTIPOCONTRRF: TFloatField;
      qryParamInvestIDBVSP: TFloatField;
      qryParamInvestIDTIPOINVESTIDOR: TFloatField;
      qryParamInvestIDMERCADO: TFloatField;
      qryParamInvestIDTIPOOPERLIQPEND: TFloatField;
      qryParamInvestIDBMF: TFloatField;
      qryParamInvestIDTIPOCONTRFIN: TFloatField;
      qryParamInvestDATAULTFECHFDO: TDateTimeField;
      qryParamInvestDATAULTFECHBMF: TDateTimeField;
      qryParamInvestIDTPPERIODICIDADE: TFloatField;
      qryParamInvestDATAULTIMPCOT: TDateTimeField;
      qryParamInvestIDTIPOOPERDIRALT: TFloatField;
      qryParamInvestIDRAMOFORCOR: TFloatField;
      qryParamInvestIDRAMOFOREMI: TFloatField;
      qryParamInvestIDRAMOFORCUS: TFloatField;
      qryParamInvestFLGLIBERAIDLOTE: TStringField;
      qryParamInvestIDTIPOOPERDIRRES: TFloatField;
      qryParamInvestFLGUSASUBCONTA: TStringField;
      qryParamInvestPERCDEVRV: TFloatField;
      qryParamInvestPERCDEVBMF: TFloatField;
      qryParamInvestDIASEMANACPMF: TStringField;
      qryParamInvestDIASUTEISCPMF: TFloatField;
      qryParamInvestIDCUSTODIARENFIX: TFloatField;
      qryParamInvestIDTIPOREGRARV: TFloatField;
      qryParamInvestIDTIPOREGRARF: TFloatField;
      qryParamInvestIDTIPOREGRABMF: TFloatField;
      qryParamInvestFLGIMPLANTRF: TStringField;
      qryParamInvestFLGCONTABILIZA: TStringField;
      qryParamInvestFLGINTCAPCAR: TStringField;
      qryParamInvestIDCONTRAPARTERF: TFloatField;
      qryParamInvestIDAUTORIZAORDEM: TFloatField;
      qryParamInvestIDCLASSETIT: TFloatField;
      qryParamInvestFLGEMPACOES: TStringField;
      qryParamInvestIDCARTEMPACOES: TFloatField;
      qryParamInvestIDREGRAEMPACOES: TFloatField;
      qryParamInvestIDMOTBLOQEMPAC: TFloatField;
      qryParamInvestFLGCARTGERENC: TStringField;
      qryParamInvestIDINDEXPOUPANCA: TFloatField;
      qryParamInvestJUROSPOUPANCA: TFloatField;
      qryParamInvestIDTIPOOPERDIRMUL: TFloatField;
      qryParamInvestIDPLANPREVCTBPATR: TFloatField;
      qryParamInvestIDOPERAMORTPRINC: TFloatField;
      qryParamInvestIDOPERINCJUROS: TFloatField;
      qryParamInvestIDOPERPAGTOJUROS: TFloatField;
      qryParamInvestFLGESPECFUNDO: TStringField;
      qryParamInvestFLGCOMPVARRV: TStringField;
      qryParamInvestPRZVENCBMF: TFloatField;
      qryParamInvestPRZVENCCFIANCA: TFloatField;
      qryParamInvestIDTIPOREGRAFND: TFloatField;
      qryParamInvestIDCLASSPOUPBLOQ: TFloatField;
      qryParamInvestIDTIPOREGRARENT: TFloatField;
      qryParamInvestIDTIPOREGRAATUAR: TFloatField;
      qryParamInvestFLGPLANPREVCTBPAT: TStringField;
      qryParamInvestIDCLASSNTN: TFloatField;
      qryParamInvestIDTIPOOPERDIRREE: TFloatField;
      qryParamInvestDATAULTFECHEMP: TDateTimeField;
      qryParamInvestIDTIPOOPERDIRPROV: TFloatField;
      qryParamInvestIDTIPOOPEROPCCP: TFloatField;
      qryParamInvestIDTIPOOPEROPCVD: TFloatField;
      qryParamInvestMOEDAEQM: TFloatField;
      qryParamInvestSTARET: TStringField;
      qryParamInvestDATAULTRET: TDateTimeField;
      qryParamInvestIDCARTOPCIND: TFloatField;
      qryParamInvestIDCARTOPC: TFloatField;
      qryParamInvestIDMOTBLOQOPC: TFloatField;
      qryParamInvestIDCARTAVISTA: TFloatField;
      qryInvestBase: TwwQuery;
      qryInvestBaseIDINVESTBASE: TFloatField;
      qryInvestBaseVLRPRECOEX: TFloatField;
      qryInvestBaseDTAVENCTO: TDateTimeField;
      qryInvestBaseQTDELOTE: TFloatField;
      qryInvestBasePRECOPORLOTE: TFloatField;
      qryBuscaOrdemOpc: TwwQuery;
      QryBoleta: TwwQuery;
      QryBoletaIDBOLETA: TStringField;
      QryBoletaOBSERVACAO: TMemoField;
      qryBuscaBoletaTRC: TwwQuery;
      qryBuscaBoletaTRCIDOPERCUSTODIA: TFloatField;
      qryBuscaBoletaTRCIDHISTCARTINVDEST: TFloatField;
      qryBuscaBoletaTRCIDHISTCARTINVORIG: TFloatField;
      qryBuscaBoletaTRCDATAMOVCUSTOD: TDateTimeField;
      QryHistCartInvPend: TwwQuery;
      qryOperacaoIDOPERACAODIREITO: TFloatField;
      qryParamInvestDIFMAXOPCIND: TFloatField;
      qryParamInvestIDTIPOREGRAOPCIN: TFloatField;
      qryParamInvestIDTIPOREGRAEMPAC: TFloatField;
      qryParamInvestIDTIPODESPDVCOR: TFloatField;
      qryParamInvestIDGRUPOREGRAINV: TFloatField;
      qryParamInvestFLGDEMO: TStringField;
      qryBuscaPlnCodigoPLANO: TFloatField;
      qryBuscaPlano: TwwQuery;
      qryBuscaPlanoPLANO: TFloatField;
      qryParamInvestFLGINTFINLIQ: TStringField;
      qrySaldoInvestCustodiaSALDOBLOQUEADO: TFloatField;
      qryParamInvestDTMUDACPMF: TDateTimeField;
      qryTipoOperacaoFLGCONTAINVEST: TFloatField;
      QryBuscaTpOpOperInvest: TwwQuery;
      qryParamInvestFLGRECPAGRV: TStringField;
      qryParamInvestIDTIPOOPERDIRDSU: TFloatField;
      qryParamInvestDIFRESGFUNDOS: TFloatField;
      qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
      qrySaldoInvNullTotal: TwwQuery;
      qrySaldoInvNullTotalSALDOCOTASCARTINV: TFloatField;
      qrySaldoInvNullTotalSALDOVLRCARTINV: TFloatField;
      qrySaldoInvNullTotalSALDOQTDEINVCART: TFloatField;
      qrySaldoInvNullTotalSALDOVLRINVCART: TFloatField;
      qrySaldoInvNullTotalSALDOATU: TFloatField;
      qrySaldoInvNullTotalSALDOCAR: TFloatField;
      qrySaldoInvNullTotalSALDOAQUI: TFloatField;
      qrySaldoInvNullTotalSALDOREND: TFloatField;
      qrySaldoInvNullTotalSALDOVARIACAO: TFloatField;
      qrySaldoInvNullTotalSALDOJUROS: TFloatField;
      qrySaldoInvNullTotalSALDOPREMIO: TFloatField;
      qrySaldoInvNullTotalSALDOIRPROV: TFloatField;
      qrySaldoInvNullTotalSALDOIRAPU: TFloatField;
      qrySaldoInvNullTotalSALDOIOFPROV: TFloatField;
      qrySaldoInvNullTotalSALDOIOFAPU: TFloatField;
      qrySaldoInvNullTotalSALDOAGIO: TFloatField;
      qrySaldoInvNullTotalSALDOQTDECPMF: TFloatField;
      qryParamInvestFLGPOUPAPROPDIA: TStringField;
      qryHistGrupamento: TwwQuery;
      FloatField48: TFloatField;
      qryHistGrupamentoGer: TwwQuery;
      FloatField67: TFloatField;
      qryParamInvestIDTIPOOPERRFRAC: TFloatField;
      qryParamInvestIDTIPOOPERDIRDSA: TFloatField;
      qryParamInvestIDTIPOOPERDIRDSR: TFloatField;
      qryParamInvestFLGREGIMECXCOMP: TStringField;
      qryParamInvestDTAREGIMECXCOMP: TDateTimeField;
      qryParamInvestPZORECCPMF: TFloatField;
      qryParamInvestDATAINIRECCPMF: TDateTimeField;
      qrySaldoInvestimentoTNull: TwwQuery;
      qrySaldoInvestimentoTNullIDHISTCARTINV: TFloatField;
      qrySaldoInvestimentoTNullIDCARTEIRAINVEST: TFloatField;
      qrySaldoInvestimentoTNullDATAMOVCARTINV: TDateTimeField;
      qrySaldoInvestimentoTNullSALDOCOTASCARTINV: TFloatField;
      qrySaldoInvestimentoTNullSALDOVLRCARTINV: TFloatField;
      qrySaldoInvestimentoTNullSALDOQTDEINVCART: TFloatField;
      qrySaldoInvestimentoTNullSALDOVLRINVCART: TFloatField;
      qrySaldoInvestimentoTNullSALDOATU: TFloatField;
      qrySaldoInvestimentoTNullSALDOCAR: TFloatField;
      qrySaldoInvestimentoTNullSALDOAQUI: TFloatField;
      qrySaldoInvestimentoTNullSALDOREND: TFloatField;
      qrySaldoInvestimentoTNullSALDOVARIACAO: TFloatField;
      qrySaldoInvestimentoTNullSALDOJUROS: TFloatField;
      qrySaldoInvestimentoTNullSALDOPREMIO: TFloatField;
      qrySaldoInvestimentoTNullSALDOIRPROV: TFloatField;
      qrySaldoInvestimentoTNullSALDOIRAPU: TFloatField;
      qrySaldoInvestimentoTNullSALDOIOFPROV: TFloatField;
      qrySaldoInvestimentoTNullSALDOIOFAPU: TFloatField;
      qrySaldoInvestimentoTNullSALDOAGIO: TFloatField;
      qrySaldoInvestimentoCartGer: TwwQuery;
      qrySaldoInvestimentoCartGerIDHISTCARTINV: TFloatField;
      qrySaldoInvestimentoCartGerIDCARTEIRAINVEST: TFloatField;
      qrySaldoInvestimentoCartGerDATAMOVCARTINV: TDateTimeField;
      qrySaldoInvestimentoCartGerSALDOCOTASCARTINV: TFloatField;
      qrySaldoInvestimentoCartGerSALDOVLRCARTINV: TFloatField;
      qrySaldoInvestimentoCartGerSALDOQTDEINVCART: TFloatField;
      qrySaldoInvestimentoCartGerSALDOVLRINVCART: TFloatField;
      qrySaldoInvestimentoCartGerSALDOATU: TFloatField;
      qrySaldoInvestimentoCartGerSALDOCAR: TFloatField;
      qrySaldoInvestimentoCartGerSALDOAQUI: TFloatField;
      qrySaldoInvestimentoCartGerSALDOREND: TFloatField;
      qrySaldoInvestimentoCartGerSALDOVARIACAO: TFloatField;
      qrySaldoInvestimentoCartGerSALDOJUROS: TFloatField;
      qrySaldoInvestimentoCartGerSALDOPREMIO: TFloatField;
      qrySaldoInvestimentoCartGerSALDOIRPROV: TFloatField;
      qrySaldoInvestimentoCartGerSALDOIRAPU: TFloatField;
      qrySaldoInvestimentoCartGerSALDOIOFPROV: TFloatField;
      qrySaldoInvestimentoCartGerSALDOIOFAPU: TFloatField;
      qrySaldoInvestimentoCartGerSALDOAGIO: TFloatField;
      qrySaldoInvestimentoTNullSALDOQTDECPMF: TFloatField;
      qrySaldoInvestimentoCartGerSALDOQTDECPMF: TFloatField;
      qryParamInvestMASCSCLASSIFANBID: TStringField;
      qrySaldoInvestCustodiaSALDOQTDECPMF: TFloatField;
      qrySaldoInvestimentoCartGerSALDOPROVPERDA: TFloatField;
      qrySaldoInvestimentoTNullSALDOPROVPERDA: TFloatField;
      qryDelOperacaoInvest: TwwQuery;
      FloatField49: TFloatField;
      FloatField50: TFloatField;
      FloatField51: TFloatField;
      FloatField52: TFloatField;
      FloatField53: TFloatField;
      DateTimeField6: TDateTimeField;
      FloatField54: TFloatField;
      FloatField55: TFloatField;
      FloatField56: TFloatField;
      StringField2: TStringField;
      StringField3: TStringField;
      StringField16: TStringField;
      FloatField57: TFloatField;
      qryDocumentoNull: TwwQuery;
      qryParamInvestFLGCONTABDIAUTIL: TStringField;
      //AL_31
      qryParamInvestFLGINTCONTABRF: TStringField;
      qryParamInvestFLGINTCONTABRV: TStringField;
      qryParamInvestFLGINTCONTABBMF: TStringField;
      qryParamInvestFLGINTCONTABFRF: TStringField;
      qryParamInvestFLGINTCONTABFRV: TStringField;
      qryParamInvestFLGINTCONTABFIM: TStringField;
      qryParamInvestFLGINTCONTABFDC: TStringField;
      qryParamInvestFLGINTCONTABFIP: TStringField;
      //AL_32
      qryParamInvestIDMOTBLOQPENFDO: TFloatField;
      qryParamInvestIDCARTEIRARF: TFloatField;
      //AL_34
      qryTipoOperacaoIDTIPOOPERCPVD: TFloatField;
      //AL_35
      qryParamInvestFLGINTCONTABOPI: TStringField;
      //--Emerson SOL 110583 KT 505562 10.03.2009 Inicio--//
      qryParamInvestREGRABOLETA: TStringField;
      //--Emerson SOL 110583 KT 505562 10.03.2009 Fim--//
      //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
      qryHistDesdobramento: TwwQuery;
      qryHistDesdobramentoIDHISTCARTINV: TFloatField;
      //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
      qryParamInvestDATAVIGDIR: TDateTimeField;
      qryParamInvestTPDATAVIGDIR: TStringField;
      //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
      qryParamInvestDATARELMOVIMENTO: TDateTimeField;
      qryParamInvestDATARELINICIAL: TDateTimeField;
      qryParamInvestIDCARTORIGEMPACOES: TFloatField;
   Private
      { Private declarations }
   Public
      { Public declarations }
   End; 

Var
   dtmOperComum: TdtmOperComum;

Implementation

{$R *.DFM}

End.

