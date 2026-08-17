unit dEmptmo;

// Alterações:
{
Pendência   : Voto de Emprestimo
Responsável : BRUNO SANTOS
Data        : 05/12/2013
Descrição   : Alteração na query Dados Contrato, apenas DFM!
-------------------------------------------------------------------------------
Pendência   : SOL 182258 KINTANA 1697187
Responsável : TADEU PASSOS
Data        : 12/11/2012
Descrição   : Criação de novo field qryParamEmptmoIDPROVENTO
-------------------------------------------------------------------------------
Pendência   : SOL 172525 KINTANA 1553886
Responsável : Monica Gonzaga
Data        : 09/04/2012
Descrição   : Alterações feitas na qryInserteContrato.
-------------------------------------------------------------------------------
Pendência   : SOL 178622 KINTANA 1641054
Responsável : BRUNO AZEVEDO
Data        : 18/04/2012
Descrição   : Ajustes no cálculo de atualização diária.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 163648 Kintana 1400248
Responsável : Fanuel Junior
Data        : 16/11/2010
Descrição   : Ajustar a funcionalidade de cancelamento de quitação para permitir
              o cancelamento de quitações por resgate
--------------------------------------------------------------------------------------------------
Pendência   : SOL 164465 Kintana 1412469
Responsável : Fanuel Junior
Data        : 08/09/2011
Descrição   : Alterada a query que busca a situação do participante para que ela também contemple

--------------------------------------------------------------------------------------------------
Pendência   : SOL 127180 \ Kintana 672412
Responsável : Jéssica
Data        : 23/11/2008
Descrição   : Inserção de select na qryUpdateFlgEstorno para quitações/envio, para não deixar estornar
              as parcelas que estão suspensas.
--------------------------------------------------------------------------------
Pendência   : SOL 124538 Kintana 632954
Responsável : Ádler Souza
Data        : 22/09/2009
Descrição   : Inserção da linha "AND HME.IDITEMCENTRALIZA     = H2.IDITEMEMPTMO"
              no WHERE da qryUpdateFlgEstorno para não inserir flag de estorno e data
              de estorno nos itens internos da prestação.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 80146 Kintana 568774
Responsável : Renato Visoni
Data        : 20/07/2009
Descrição   : Alteração na qryUpdateFlgEstorno, adicionamos a condição
              AND H2.IDITEMCENTRALIZA    = HME.IDITEMEMPTMO
--------------------------------------------------------------------------------------------------
Pendência   : 119117 - Kintana: 566233
Responsável : Daniel Begnami
Data        : 04/06/2008
Descrição   : Alteração de query SitPart
--------------------------------------------------------------------------------------------------
Pendência   : 108099 - Kintana: 487201
Responsável : Daniel Begnami
Data        : 13/04/2008
Descrição   : Criação de novas modalidades de emprestimo.
--------------------------------------------------------------------------------------------------
Data      : 20/11/2008
Pendência : SOL 100478,100476,100479
Autor     : Renato Visoni
Descrição : Criado Campo tipo de recurso e Origem do Recurso na qryDadosContrato
--------------------------------------------------------------------------------------------------
Rotina    : qryDadosContrato
Data      : 09/10/2008
Autor     : Renato Visoni
Pendencia : Sol 98237 \ Kintana 427763
Descrição : Foram trocados umas condições que usavam OR por NVL
--------------------------------------------------------------------------------------------------
Rotina    : qryParamEmptmo e qryInsertContrato
Data      : 26/12/2007
Autor     : Alberto
Pendencia : 26775
Descrição : Incluídas colunas IDREGRAPLANOCOB na query qryParamEmptmo e
            IDPLANOCOB na query qryInsertContrato
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/06/2007
Autor     : Alberto
Pendencia : 22718 - Padrão 16
Descrição : Alterada a query qryUpdateFlagEStorno para reconhecer o parâmetro
            PFLGESTORNOPOSQUIT
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryVerificaLanctoDocum
Data      : 15/05/2007
Autor     : Alberto
Pendencia : 25305
Descrição : criada a query para verificar lançamentos não estornados do documento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryParamEmptmo
Data      : 19/12/2006
Autor     : Alberto
Pendencia : 23733
Descrição : adicionada coluna IDREGRATIPOCONTR na query
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryInsertHistMovEmptmo
Data      : 14/09/2006
Autor     : Alberto
Pendencia : 23251
Descrição : adicionada colunas IDPATRO e IDPLANOPREVCONTAB na query
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - qryDadosContrato
Data      : 28/07/2006
Autor     : Alberto
Pendencia : 22913
Descrição : adicionada coluna FLGFINANCIAMENTO na query
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - qryDadosContrato
Data      : 01/02/2006
Autor     : André Pontes
Pendencia : 21225
Descrição : adicionada cláusula (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) na sub-query de amortização
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExisteAtualizacaoDiariaMutuario
Data      : 11/01/2005
Autor     : André Pontes
Descrição : Criada rotina para verificar se existe atualização diária em uma determinada data para
            um MUTUÁRIO (mais de um contrato), a ser usada na renovação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 05/03/2004
Autor     : André Pontes
Descrição : Criada query qryEntidadeContabilVolta
            Objetivo é encontrar o plano PREVIDENCIAL relativo a um plano prev CONTÁBIL

            ****************************************************************************************
            * A tabela PlanPrevXContabil teve a chave primária alterada, de forma que pode haver   *
            * colunas individuais repetidas. Dessa forma, é FUNDAMENTAL que o cadastro esteja      *
            * de acordo com o conceito:                                                            *
            *  - 1 plano previdencial para cada plano contábil (FUNCEF)                            *
            *  - 1 plano contábil para cada plano previdencial (todos os outros)                   *
            ****************************************************************************************
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 02/06 e 03/06/2003
Autor     : André Pontes
Descrição : Novas queries:
            - qryPortadorForma : para encontrar o IDBANCO ao qual está ligado o PortadorForma
            - qryBancoPortForma: para encontrar o FLOAT de um PortadorForma associado a um Banco
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 19/03/2003
Autor     : André Pontes
Descrição : Exclusão da query qryMarcaTodosItensQuitados, com criação de novo parâmetro na quuery
            qryMarcaItemQuitado;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/12/2002
Autor     : André Pontes
Descrição : Novas queries: qryMarcaItemQuitado
                           qryMarcaTodosItensQuitados
                           qryDesMarcaTodosItensQuitados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreHistMov
Data      : 29/10/2002
Autor     : André Pontes
Descrição : Acerto do filtro da query HistMov (iOrigem <> iEvento)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Acerto nos filtros das queries HistoricoMov e DadosContrato para ser levado em conside-
            ração os itens de quitação por morte
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, Wwquery, ExtCtrls, URegra, uResource, uCmSqlParams,
  DBClient, uCMClientDataSet, uRegraMT;

   procedure Temporiza(f: double);

type
   TdtmEmptmo = class(TDataModule)
      qryCotacaoExata: TwwQuery;
      qryCotacaoExataMOECODIGO: TFloatField;
      qryCotacaoExataCOTVALOR: TFloatField;
      qryCotacaoExataMOEDESC: TStringField;
      qryCotacaoExataMOESIGLA: TStringField;
      qryCotacaoNaoExata: TwwQuery;
      qryCotacaoNaoExataMOECODIGO: TFloatField;
      qryCotacaoNaoExataCOTVALOR: TFloatField;
      qryCotacaoNaoExataMOEDESC: TStringField;
      qryCotacaoNaoExataMOESIGLA: TStringField;
      qryCotacoesIntervalo: TwwQuery;
      qryCotacoesIntervaloMOECODIGO: TFloatField;
      qryCotacoesIntervaloCOTVALOR: TFloatField;
      qryCotacoesIntervaloCOTMESREF: TStringField;
      qryCotacoesIntervaloMOEDESC: TStringField;
      qryCotacoesIntervaloMOESIGLA: TStringField;
      qryIndice: TwwQuery;
      qryIndiceMOECODIGO: TFloatField;
      qryIndiceMOEDESC: TStringField;
      qryIndiceMOESIGLA: TStringField;
      qryIndiceMOEPERIODICIDADE: TStringField;
      qryIndiceMOEINATIVO: TStringField;
      qryIndiceFLGPERCVALOR: TStringField;
      qryIndiceDATAINICIO: TDateTimeField;
      qryIndiceDATAFIM: TDateTimeField;
      qryIntegraContab: TwwQuery;
      qryIntegraContabMASCARA: TStringField;
      qryVerificaConta: TwwQuery;
      qryVerificaContaPLACONTA: TStringField;
      qryVerificaContaPLANOME: TStringField;
      qryVerificaContaPLASUBCONTA: TStringField;
      qryVerificaContaPLACCUST: TStringField;
      qryParamCAP: TwwQuery;
      qryParamCAPMASCARADESEMB: TStringField;
      qryParamGlobal: TwwQuery;
      qryParamGlobalUSACRESPON: TStringField;
      qryParamGlobalUSAABC: TStringField;
      qryParamGlobalCODCENTRORESPON: TStringField;
      qryParamGlobalUNIDNEGOC: TFloatField;
      qryParamGlobalMOEDACORRENTE: TFloatField;
      qryParamGlobalIDPATRO: TFloatField;
      qryParamGlobalIDPLANOPREV: TFloatField;
      qryParamGlobalMOESIGLA: TStringField;
      qryPlanoData: TwwQuery;
      qryPlanoDataIDPLANODATA: TFloatField;
      qryPlanoDataIDPESSOA: TFloatField;
      qryPlanoDataPLANO: TFloatField;
      qryPlanoDataDATAINICIO: TDateTimeField;
      qryPlanoDataDATAFIM: TDateTimeField;
      qryInsertContrato: TwwQuery;
      qrySitPart: TwwQuery;
      qrySitPartIDSITPART: TFloatField;
      qrySitPartFLGINTERNO: TStringField;
      qryParamIntegra: TwwQuery;
      qryEntidadeContabil: TwwQuery;
      qryEntidadeContabilIDPLANOPREV: TFloatField;
      qryEntidadeContabilIDPLANPREVC: TFloatField;
      Temporizador: TTimer;
      qryParamIntegraIDPARAMINTEGRAEP: TFloatField;
      qryParamIntegraDESCPARAMINTEGRA: TStringField;
      qryParamIntegraIDPLANOPREVCONTAB: TFloatField;
      qryParamIntegraIDPLANOPREV: TFloatField;
      qryParamIntegraIDPATRO: TFloatField;
      qryParamIntegraIDTIPOEMPTMO: TFloatField;
      qryParamIntegraIDTIPOCONTREMPTMO: TFloatField;
      qryParamIntegraIDITEMEMPTMO: TFloatField;
      qryParamIntegraIDPESSOA: TFloatField;
      qryParamIntegraIDEMPRESA: TFloatField;
      qryParamIntegraPLANO: TFloatField;
      qryParamIntegraCCDEBFOLHA: TStringField;
      qryParamIntegraCCCREDFOLHA: TStringField;
      qryParamIntegraSUBCDEBFOLHA: TFloatField;
      qryParamIntegraSUBCCREDFOLHA: TFloatField;
      qryParamIntegraCCUSTDEBFOLHA: TStringField;
      qryParamIntegraCCUSTCREDFOLHA: TStringField;
      qryParamIntegraCCDEBFINAN: TStringField;
      qryParamIntegraCCCREDFINAN: TStringField;
      qryParamIntegraSUBCDEBFINAN: TFloatField;
      qryParamIntegraSUBCCREDFINAN: TFloatField;
      qryParamIntegraCCUSTDEBFINAN: TStringField;
      qryParamIntegraCCUSTCREDFINAN: TStringField;
      qryParamIntegraCODCENTRORESPON: TStringField;
      qryParamIntegraUNIDNEGOC: TFloatField;
      qryParamIntegraRECPAGFINAN: TStringField;
      qryParamIntegraTIPORECDESFINAN: TStringField;
      qryParamIntegraRECPAGFOLHA: TStringField;
      qryParamIntegraTIPORECDESFOLHA: TStringField;
      qryParamIntegraRECPAG: TStringField;
      qryParamContab: TwwQuery;
      qryVerificaPlanilha: TwwQuery;
      qryVerificaPlanilhaPLNCODIGO: TFloatField;
      qryVerificaPlanilhaIDHISTMOVEMPTMO: TFloatField;
      qryExcHistContrato: TwwQuery;
      qryHistoricoMov: TwwQuery;
      qryHistoricoMovIDHISTMOVEMPTMO: TFloatField;
      qryHistoricoMovIDCONTRATOEMPTMO: TFloatField;
      qryHistoricoMovCODDOCUMENTO: TFloatField;
      qryHistoricoMovHMEFORMACOBRANCA: TStringField;
      qryHistoricoMovHMECENTRALIZA: TFloatField;
      qryHistoricoMovHMEDESTACADO: TFloatField;
      qryHistoricoMovHMEVLRPREVISTO: TFloatField;
      qryHistoricoMovFLGENVIO: TFloatField;
      qryHistoricoMovPLNCODIGO: TFloatField;
      qryHistoricoMovSTATUS: TStringField;
      qryHistoricoMovHMEMESCOBRANCA: TFloatField;
      qryHistoricoMovHMEANOCOBRANCA: TFloatField;
      qryAux: TwwQuery;
      qrySaidaSistema: TwwQuery;
      qrySaidaSistemaTOTAL_ITENS: TFloatField;
      qryParamContabIDPESSOA: TFloatField;
      qryParamContabPLANO: TFloatField;
      qryParamContabPACESTORNA: TStringField;
      qryRecebimentoPatro: TwwQuery;
      qryRecebimentoPatroIDPATRO: TFloatField;
      qryRecebimentoPatroCODDOCUMENTO: TFloatField;
      qryRecebimentoPatroPLNCODIGO: TFloatField;
      qryFechamentos: TwwQuery;
      qryFechamentosIDPESSOA: TFloatField;
      qryFechamentosANOFECHAEMPTMO: TFloatField;
      qryFechamentosMESFECHAEMPTMO: TFloatField;
      qryFechamentosANOFECHAPATROEP: TFloatField;
      qryFechamentosMESFECHAPATROEP: TFloatField;
      qryFechamentosANOFECHAFOLHAEP: TFloatField;
      qryFechamentosMESFECHAFOLHAEP: TFloatField;
      qryExcluiHistRecPatro: TwwQuery;
      qryInsereHistRecPatro: TwwQuery;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      qryTmpDesc: TwwQuery;
      qryDeleteObsLanc: TwwQuery;
      qryDeleteMsgCnab: TwwQuery;
      qryItensReceb: TwwQuery;
      qryParamIntegraReceb: TwwQuery;
      qryParamIntegraRecebIDTIPOCONTRXPATRO: TFloatField;
      qryParamIntegraRecebIDTIPOCONTREMPTMO: TFloatField;
      qryParamIntegraRecebIDPATRO: TFloatField;
      qryParamIntegraRecebIDPLANOPREV: TFloatField;
      qryParamIntegraRecebCCBAIXA: TStringField;
      qryParamIntegraRecebPLANO: TFloatField;
      qryParamIntegraRecebIDPESSOA: TFloatField;
      qryParamIntegraRecebRECPAG: TStringField;
      qryParamIntegraRecebCODTIPRECDES: TStringField;
      qryParamIntegraRecebUNIDNEGOC: TFloatField;
      qryParamIntegraRecebCODCENTRORESPON: TStringField;
      qryMarcaPlnRecPatro: TwwQuery;
      qryParamIntegraRecebCODTIPDOC: TFloatField;
      qryParamIntegraRecebCODPORTFORMA: TFloatField;
      qryMarcaDocRecPatro: TwwQuery;
      qryParamEmptmo: TwwQuery;
      qryParamEmptmoIDEMPRESAPROP: TFloatField;
      qryParamEmptmoIDGRUPOREGRA: TFloatField;
      qryParamEmptmoFLGOBRIGAVERBA: TFloatField;
      qryParamEmptmoFLGFORMAPORT: TStringField;
      qryParamEmptmoCODFORMAPAGTO: TFloatField;
      qryParamEmptmoPORTFORMARECTO: TFloatField;
      qryParamEmptmoPORTFORMAPAGTO: TFloatField;
      qryParamEmptmoFLGFORMAREC: TStringField;
      qryParamEmptmoFLGFORMAPAG: TStringField;
      qryParamEmptmoFLGDATAATUSLD: TFloatField;
      qryParamEmptmoIDTIPOCLIENTE: TFloatField;
      qryParamEmptmoIDPROGRAMA: TFloatField;
      qryParamEmptmoIDCIDADES: TFloatField;
      qryParamEmptmoIDESTADO: TStringField;
      qryParamEmptmoIDPAIS: TFloatField;
      qryParamEmptmoFLGINTEGRACONC: TFloatField;
      qryParamEmptmoFLGIMPRIMEINSC: TFloatField;
      qryParamEmptmoFLGINTEGRACONTAB: TFloatField;
      qryParamEmptmoFLGINTEGRAFOLHA: TFloatField;
      qryParamEmptmoFLGINTEGRACAPCAR: TFloatField;
      qryParamEmptmoTIPODOCPAG: TFloatField;
      qryParamEmptmoTIPODOCREC: TFloatField;
      qryParamEmptmoFLGGERARUBRICA: TFloatField;
      qryParamEmptmoNOME_CIDADE: TStringField;
      qryParamEmptmoCODESTADO: TStringField;
      qryParamEmptmoNOMEESTADO: TStringField;
      qryParamEmptmoNOMEPAIS: TStringField;
      qryParamEmptmoFLGVERBAUNICA: TFloatField;
      qryParamEmptmoFLGSUSPENSAOAUTO: TFloatField;
      qryParamEmptmoIDEMPRESA: TFloatField;
      qryParamEmptmoCODCENTROCUSTO: TStringField;
      qryParamEmptmoFLGSALDODEVANT: TFloatField;
      qryParamEmptmoIDITEMIOF: TFloatField;
      updTmpDesc: TUpdateSQL;
      qryAuxEmptmo: TwwQuery;
      qryHistoricoMovHMEANOCOMPETENCIA: TFloatField;
      qryHistoricoMovHMEMESCOMPETENCIA: TFloatField;
      qryParamEmptmoFLGAMTPRESTAB: TFloatField;
      qryParamEmptmoFLGRENPRESTAB: TFloatField;
      qryParamEmptmoFLGUSAFIARIO: TFloatField;
      qryParamEmptmoIDITEMIOFCOMPL: TFloatField;
      qryParamEmptmoFLGCONCULTDIAMES: TFloatField;
      qryParamEmptmoFLGAGRUPAPARC: TFloatField;
      qryParamEmptmoFLGSUSPENDEATRASO: TFloatField;
      qryParamEmptmoFLGOBRIGAAVALISTA: TFloatField;
      qryRegra: TwwQuery;
      Regra: TRegra;
      qryParamEmptmoFLGCALCDIA: TFloatField;
      qryParamEmptmoFLGMOSTRATIT: TFloatField;
      qryParamEmptmoFLGTRAVARDATA: TFloatField;
      qryParamEmptmoFLGTRATAASSINAT: TFloatField;
      qryParamEmptmoIDREGRAAVAL: TFloatField;
      qryParamEmptmoNOMEREGRA: TStringField;
      qryVerificaDocumento: TwwQuery;
      qryMarcaItemQuitado: TwwQuery;
      qryDesMarcaTodosItensQuitados: TwwQuery;
      qryParamEmptmoHORAENCERRA: TStringField;
      qryParamEmptmoFLGPENDCONCESSAO: TFloatField;
      qryParamEmptmoFLGENVIODIVERG: TFloatField;
      qryParamEmptmoFLGPARCDIVERG: TFloatField;
      qryParamEmptmoFLGTRATQUITCANC: TFloatField;
      qryMarcaItensEstornados: TwwQuery;
      qryInsertLogTotalPrev: TwwQuery;
      qryUpdateLogTotalPrev: TwwQuery;
      qryDeleteLogTotalPrev: TwwQuery;
      qryParamEmptmoFLGCONTABCONC: TFloatField;
      qryParamEmptmoFLGCONTABPARCELA: TFloatField;
      qryParamEmptmoFLGINTEGRAENVIO: TFloatField;
      qryParamEmptmoFLGINTEGRAQUITA: TFloatField;
      qryParamEmptmoIDITEMSEGCONC: TFloatField;
      qryParamEmptmoIDITEMDEVSEGCONC: TFloatField;
      qryParamEmptmoIDITEMDEVSEGQUIT: TFloatField;
      qryParamEmptmoIDITEMSEGCOMPL: TFloatField;
      qryParamEmptmoFLGEXCEPCIONAL: TFloatField;
      qryParamEmptmoIDREGRADEVSEG: TFloatField;
      qryParamEmptmoIDREGRAATUALDIA: TFloatField;
      qryParamEmptmoREGRADEV: TStringField;
      qryParamEmptmoREGRAATU: TStringField;
      qryInsertHistMovEmptmo: TwwQuery;
      qryDadosContrato: TwwQuery;
      qryParamEmptmoFLGQUITAPARCMORTE: TFloatField;
      qryParamEmptmoFLGCONTABENCARGO: TFloatField;
      qryParamEmptmoFLGINSCRET: TFloatField;
      qryParamEmptmoFLGCONTROLAINSC: TFloatField;
      qryParamEmptmoFLGUSAFLOATCONC: TFloatField;
      qryBancoPortForma: TwwQuery;
      qryBancoPortFormaIDBANCOPORTFORMA: TFloatField;
      qryBancoPortFormaIDBANCO: TFloatField;
      qryBancoPortFormaCODPORTFORMA: TFloatField;
      qryBancoPortFormaVLRARREDSALARIO: TFloatField;
      qryBancoPortFormaDFLOATPAGTO: TFloatField;
      qryBancoPortFormaCOLVALOR: TFloatField;
      qryBancoPortFormaTAMVALOR: TFloatField;
      qryBancoPortFormaPREFIXOARQ: TStringField;
      qryPortadorForma: TwwQuery;
      qryPortadorFormaCODPORTFORMA: TFloatField;
      qryPortadorFormaCODPORTADOR: TFloatField;
      qryPortadorFormaCODFORMA: TFloatField;
      qryPortadorFormaRECPAG: TStringField;
      qryPortadorFormaDMAIS: TFloatField;
      qryPortadorFormaNUMEMPRESABANCO: TStringField;
      qryPortadorFormaNOSSONUMERO: TStringField;
      qryPortadorFormaDESCRICAO: TStringField;
      qryPortadorFormaIDBANCO: TFloatField;
      qryPortadorFormaCONTROLEREMESSA: TFloatField;
      qryPortadorFormaDATACONTRREMESSA: TDateTimeField;
      qryPortadorFormaCODARQUIVOREMESSA: TFloatField;
      qryPortadorFormaCODTIPOPAGTO: TFloatField;
      qryPortadorFormaNOCONTACORR: TStringField;
      qryPortadorFormaFLGEMITEAVISO: TStringField;
      qryParamEmptmoFLGPARTIDADOBRADA: TFloatField;
      qryParamEmptmoIDITEMPROVPERDA: TFloatField;
      qryVerificaDocumentoCODDOCUMENTO: TFloatField;
      qryVerificaDocumentoCOMPLDOCUMENTO: TStringField;
      qryVerificaDocumentoSTATUS: TStringField;
      qryVerificaDocumentoEMISBLOQ: TStringField;
      qryVerificaDocumentoCODPORTFORMA: TFloatField;
      qryVerificaDocumentoNUMLOTE: TFloatField;
      qryVerificaDocumentoVALOR: TFloatField;
      qryVerificaDocumentoFLGBAIXA: TStringField;
      qryVerificaDocumentoLOTETRANSMISSAO: TFloatField;
      qryVerificaDocumentoFLAGEMISSAO: TStringField;
      qryVerificaDocumentoFLAGCANCEL: TStringField;
      qryBancoPortFormaIDFAVORECIDO: TFloatField;
      qryParamEmptmoIDITEMSEGESPECIAL: TFloatField;
      qrySeqContrato: TwwQuery;
      qrySeqContratoSEQCONTRATOEMPTMO: TFloatField;
      qryEntidadeContabilVolta: TwwQuery;
      qryEntidadeContabilVoltaIDPLANOPREV: TFloatField;
      qryEntidadeContabilVoltaIDPLANPREVC: TFloatField;
      qryUpdatePlanoOrigem: TwwQuery;
      qryMutuarioContrato: TwwQuery;
      qryMutuarioContratoIDPESSOA: TFloatField;
      qryMutuarioContratoIDBENEF: TFloatField;
      qryMutuarioContratoIDPLANOORIGEM: TFloatField;
      qryMutuarioContratoIDPLANOPREV: TFloatField;
      qryMutuarioContratoIDPATRO: TFloatField;
      qryParamEmptmoIDITEMIOFCOMPLCON: TFloatField;
      qryPortadorFormaDMAISALT: TFloatField;
      qryPortadorFormaCODFORMAPGTOALT: TFloatField;
      qryPortadorFormaVALORMAXIMO: TFloatField;
      qryParamEmptmoIDITEMINESPERADO: TFloatField;
      qryParamEmptmoIDITEMSLDMAIS: TFloatField;
      qryParamEmptmoIDITEMSLDMENOS: TFloatField;
      qryParamEmptmoFLGIMPRINSCRICAO: TFloatField;
      qryParamEmptmoFLGAGRUPAPARCFOL: TFloatField;
      qryUpdateFlgEstorno: TwwQuery;
      qryParamEmptmoFLGESTORNOPOSQUIT: TFloatField;
      qryExisteAtualizacaoDiariaMutuario: TwwQuery;
      qryExisteAtualizacaoDiariaMutuarioIDCONTRATOEMPTMO: TFloatField;
      qryExisteAtualizacaoDiariaMutuarioTOTAL: TFloatField;
      qryParamEmptmoFLGESTORNADIVERG: TFloatField;
      qryHistoricoMovIDTMPDESC: TFloatField;
      qryParamEmptmoIDSEGURADORA: TFloatField;
      qrySeqHistMov: TwwQuery;
      qrySeqHistMovSEQHISTMOVEMPTMO: TFloatField;
      qryParamEmptmoFLGENVIAQUITA: TFloatField;
      qryParamEmptmoFLGENVIAAMORTIZA: TFloatField;
      qryParamEmptmoFLGABONODIVERG: TFloatField;
      ResourceManager: TCMResourceManager;
      updRegra: TUpdateSQL;
      cdsRegra: TCMClientDataSet;
      sqlRegra: TCMSqlParams;
      RegraMT: TRegraMT;
      qryParamEmptmoFLGCTABANCOPREF: TFloatField;
    qryParamEmptmoIDREGRATIPOCONTR: TFloatField;
    qryVerificaLanctoDocum: TwwQuery;
    qryVerificaLanctoDocumQTDLANCTODOCUM: TFloatField;
    qryParamEmptmoFLGAMORTRETROATIV: TFloatField;
    qryParamEmptmoFLGUSAMARGEMALT: TFloatField;
    qryParamEmptmoFLGOBRIGAAVALALT: TFloatField;
    qryParamEmptmoFLGTRATAATUSLD: TFloatField;
    qryParamEmptmoIDREGRAPLANOCOB: TFloatField;
    QryTpContratoEmp: TwwQuery;
    qryDadosContratoIDCONTRATOEMPTMO: TFloatField;
    qryDadosContratoIDINSCRICAOEMPTMO: TFloatField;
    qryDadosContratoIDCONTRQUITACAO: TFloatField;
    qryDadosContratoIDTIPOCONTREMPTMO: TFloatField;
    qryDadosContratoIDPATRO: TFloatField;
    qryDadosContratoIDPLANOPREV: TFloatField;
    qryDadosContratoIDPLANOORIGEM: TFloatField;
    qryDadosContratoIDPESSOA: TFloatField;
    qryDadosContratoIDBENEF: TFloatField;
    qryDadosContratoIDCBANCARIA: TFloatField;
    qryDadosContratoIDCBANCARIADEB: TFloatField;
    qryDadosContratoIDVERBA: TFloatField;
    qryDadosContratoIDSITPART: TFloatField;
    qryDadosContratoFLGSITUACAO: TStringField;
    qryDadosContratoFLGFORMAREC: TStringField;
    qryDadosContratoPORTFORMAREC: TFloatField;
    qryDadosContratoFLGFORMAPAG: TStringField;
    qryDadosContratoCODFORMAPAG: TFloatField;
    qryDadosContratoPORTFORMAPAG: TFloatField;
    qryDadosContratoDATAASSINATURA: TDateTimeField;
    qryDadosContratoDATAINSC: TDateTimeField;
    qryDadosContratoDATACREDITO: TDateTimeField;
    qryDadosContratoDATAPRIMPARC: TDateTimeField;
    qryDadosContratoDATACANC: TDateTimeField;
    qryDadosContratoDATASITUACAO: TDateTimeField;
    qryDadosContratoPRAZO: TFloatField;
    qryDadosContratoNUMPARCELAS: TFloatField;
    qryDadosContratoVLRCONTRATO: TFloatField;
    qryDadosContratoVLRPARCELA: TFloatField;
    qryDadosContratoTXJUROS: TFloatField;
    qryDadosContratoANOSUSPENSAO: TFloatField;
    qryDadosContratoMESSUSPENSAO: TFloatField;
    qryDadosContratoVLRPARCELAMES: TFloatField;
    qryDadosContratoVLRPARCATRASO: TFloatField;
    qryDadosContratoVLRDEBITO: TFloatField;
    qryDadosContratoVLRRESERVA: TFloatField;
    qryDadosContratoVLRSALDODEV: TFloatField;
    qryDadosContratoVLRPENDENCIA: TFloatField;
    qryDadosContratoVLRSALBASE: TFloatField;
    qryDadosContratoVLRMARGEM: TFloatField;
    qryDadosContratoVLRMAXPERMIT: TFloatField;
    qryDadosContratoDATASALDODEV: TDateTimeField;
    qryDadosContratoDATAPENDENCIA: TDateTimeField;
    qryDadosContratoTCEDESCRICAO: TStringField;
    qryDadosContratoIDTIPOEMPTMO: TFloatField;
    qryDadosContratoDESCTIPOEMPTMO: TStringField;
    qryDadosContratoIDEMPRESAPROP: TFloatField;
    qryDadosContratoMATRICULA: TStringField;
    qryDadosContratoINSCRICAONUMERO: TFloatField;
    qryDadosContratoSALPARTICIPACAO: TFloatField;
    qryDadosContratoSALMANTIDO: TFloatField;
    qryDadosContratoSALAUXDOENCA: TFloatField;
    qryDadosContratoSITDESCRICAO: TStringField;
    qryDadosContratoFLGINTERNO: TStringField;
    qryDadosContratoNOME_TITULAR: TStringField;
    qryDadosContratoCPF_TITULAR: TStringField;
    qryDadosContratoNOME: TStringField;
    qryDadosContratoNOME_MUTUARIO: TStringField;
    qryDadosContratoNUMDOCUMENTO: TStringField;
    qryDadosContratoCPF_MUTUARIO: TStringField;
    qryDadosContratoIDREGRAMARGEM: TFloatField;
    qryDadosContratoIDREGRARESERVA: TFloatField;
    qryDadosContratoIDREGRAELEG: TFloatField;
    qryDadosContratoIDREGRALIMITES: TFloatField;
    qryDadosContratoTCEMINRENOVA: TFloatField;
    qryDadosContratoTCEDIASVALIDINSC: TFloatField;
    qryDadosContratoTCEDIASTOLERAINSC: TFloatField;
    qryDadosContratoTCEMAXCONTRATO: TFloatField;
    qryDadosContratoTCEMAXINSCR: TFloatField;
    qryDadosContratoTCEMAXPARC: TFloatField;
    qryDadosContratoTCEMINPARC: TFloatField;
    qryDadosContratoTCEMINQUIT: TFloatField;
    qryDadosContratoMATRICULA_MUTUARIO: TStringField;
    qryDadosContratoDESCSITCONTRATO: TStringField;
    qryDadosContratoPLANOPREV: TStringField;
    qryDadosContratoPATRO: TStringField;
    qryDadosContratoBANCO: TStringField;
    qryDadosContratoNUMBANCO: TStringField;
    qryDadosContratoCONTACORRENTE: TStringField;
    qryDadosContratoNUMAGENCIA: TStringField;
    qryDadosContratoAMODATAPREVISTA: TDateTimeField;
    qryDadosContratoFORMAPAGAMORT: TStringField;
    qryDadosContratoQUIDATAPREVISTA: TDateTimeField;
    qryDadosContratoFORMAPAGQUITA: TStringField;
    qryDadosContratoDATAULTATUALIZA: TDateTimeField;
    qryDadosContratoMOECODIGO: TFloatField;
    qryDadosContratoMOESIGLA: TStringField;
    qryDadosContratoIDTIPOSUSPEMPTMO: TFloatField;
    qryDadosContratoDATAINICIOSUSP: TDateTimeField;
    qryDadosContratoDATAFIMSUSP: TDateTimeField;
    qryDadosContratoUSUARIOLIBSUSP: TStringField;
    qryDadosContratoDATALIBSUSP: TDateTimeField;
    qryDadosContratoHORALIBSUSP: TStringField;
    qryDadosContratoFLGSUSPENSAOAUTO: TFloatField;
    qryDadosContratoFLGFINANCIAMENTO: TFloatField;
    qryDadosContratoORIGEMRECURSO: TStringField;
    qryDadosContratoIDTIPORECURSO: TFloatField;
    qryHistoricoMovHMEORIGEM: TFloatField;
    qryAtualizaSituacao: TwwQuery;
    qryParamEmptmoIDPROVENTO: TFloatField;
    qryParamFlagVerifica: TwwQuery;
    qryParamIntegraCCDEBFOLHARESULT: TStringField;
    qryParamIntegraCCCREDFOLHARESULT: TStringField;
    qryParamIntegraCCUSTDEBFOLHARESULT: TStringField;
    qryParamIntegraCCUSTCREDFOLHARESULT: TStringField;
    qryParamIntegraSUBCDEBFOLHARESULT: TFloatField;
    qryParamIntegraSUBCCREDFOLHARESULT: TFloatField;
    qryParamIntegraTIPORECDESFOLHARESULT: TStringField;
    qryDadosContratoFLGPERDAEFETIVA: TFloatField; // TADEU SOL 182258 KINTANA 1697187

      procedure TemporizadorTimer(Sender: TObject);


   private { Private declarations }

   public { Public declarations }

	   bTempo: boolean;

      vBuscaContrato: array[0..10] of String;
      vBuscaMutuario: array[0..10] of String;

      function  ExisteAtualizacaoDiariaMutuario(const IDPessoa : Extended;
                                                const IDBenef  : Extended;
                                                const dData    : TDateTime
                                               ): Boolean;

      // Abre Historico e retorna  True se populada
      function  AbreHistMov(const idContrato   : Extended;
                            const iEvento      : Integer;
                            const iOrigem      : Integer;
                            const dDataPrevista: TDate
                           ): Boolean;

      // Exclui Contabilidade
      procedure ExcContabilidade(const sIdHistCont  : String;
                                 const iPlanilha    : Int64;
                                 const iPlano       : Integer
                                 );

      // Exlui Historico do Contrato
      procedure ExcHistContrato(const IDContrato    : Extended;
                                const iEvento       : Integer;
                                const iOrigem       : Integer;
                                const dDateQuitacao : TDateTime
                                );

      // tabela ParamContab
      procedure ParamContabilidade(var sPacEstorna: String );

      procedure VerificaItemAcerto;

end;


var
  dtmEmptmo: TdtmEmptmo;



implementation
{$R *.DFM}
uses
   ULancContab,      // Rotinas de Contabilidade
   USistema,         // Sistema
   UMensErro,
   UIntegraEMptmo,
   uFuncoesEmptmo,
   DBaseDados,
   UIntegraBack;     // Objeto IntegraBack


procedure Temporiza(f: double);
begin
   dtmEmptmo.bTempo := False;

   dtmEmptmo.Temporizador.Interval := trunc(f * 1000);
   dtmEmptmo.Temporizador.Enabled  := True;

   repeat
      Application.ProcessMessages;
   until
      dtmEmptmo.bTempo;

   dtmEmptmo.Temporizador.Enabled  := False;
end;

procedure TdtmEmptmo.TemporizadorTimer(Sender: TObject);
begin
   bTempo := True;
end;

function TdtmEmptmo.AbreHistMov(const idContrato   : Extended;
                                const iEvento      : Integer;
                                const iOrigem      : Integer;
                                const dDataPrevista: TDate
                                ): Boolean;
begin
   // Pega o contrato no historico de contrato e verifica se ta vazio
   LimpaParametros(qryHistoricoMov);

   qryHistoricoMov.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := idContrato;
   qryHistoricoMov.ParamByName('PHMETIPOMOV').AsInteger       := iEvento;

   // origem é opcional
   if iOrigem <> -1 then begin
      qryHistoricoMov.ParamByName('PHMEORIGEM').AsInteger     := iOrigem;
   end;

   qryHistoricoMov.ParamByName('PHMEDATAPREVISTA').AsDate     := dDataPrevista;
   qryHistoricoMov.Open;

   Result := not(qryHistoricoMov.IsEmpty);
end;

procedure TdtmEmptmo.ExcHistContrato(const IDContrato    : Extended;
                                     const iEvento       : Integer;
                                     const iOrigem       : Integer;
                                     const dDateQuitacao : TDateTime
                                    );
var
	sSql  : String;
   sData : String;
begin
   sData := FormatDateTime('dd/mm/yyyy', dDateQuitacao);

   // Deleta Historico referente ao Contrato Selecionado e Data de Quitação
   sSql   :=
   'DELETE FROM '                                                                   + #13 +
   '  HISTMOVEMPTMO '                                                               + #13 +
   'WHERE '                                                                         + #13 +
   '      IDCONTRATOEMPTMO = ' + FloatToStr(idContrato)                               + #13 +
   '  AND HMEDATAPREVISTA  = TO_DATE (' + QuotedStr(sData) + ', ''DD/MM/YYYY'') ';

   if iOrigem <> -1 then
      sSql := sSql +
   '  AND HMEORIGEM        = ' + IntToStr(iOrigem);

   if iEvento <> -1 then
      sSql := sSql +
   ' AND HMETIPOMOV        = ' + IntToStr(iEvento);

   qryExcHistContrato.Close;
   qryExcHistContrato.SQL.Clear;
   qryExcHistContrato.SQL.Text := sSql;
   qryExcHistContrato.ExecSQL;
end;



procedure TdtmEmptmo.ExcContabilidade(const sIdHistCont  : String;
                                      const iPlanilha    : Int64;
                                      const iPlano       : Integer
                                      );
begin

      // Exclui Contabilidade
      ExcluiLanc(False, iPlanilha, 'BaseDados', '15', {IntToStr(Sistema.idModulo)} iPlano,
                 Sistema.idEmpresa, Sistema.idUsuario, True, 0, IntegraBack.MascaraPlano);

end;



procedure TdtmEmptmo.ParamContabilidade(var sPacEstorna: String );
begin
   // Verifica na tabela ParamContab se pode excluir contabilidade
   try
      qryParamContab.Close;
      qryParamContab.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryParamContab.Open;

      // Verifica se a tabela de paramentros esta vazia
      if not(dtmEmptmo.qryParamContabPACESTORNA.IsNull) then
      begin
         sPacEstorna := dtmEmptmo.qryParamContabPACESTORNA.AsString
      end else begin
         sPacEstorna := '';
      end;
   finally
      qryParamContab.Close;
   end;
end;



procedure TdtmEmptmo.VerificaItemAcerto;
var
   sSQL           : String;
   ListaTipoContr : TStringList;
   iContador      : Integer;
begin
   with qryAux do
   begin
      Close;
      sSQL := 'SELECT COUNT(*) FROM ITEMEMPTMO WHERE IDITEMEMPTMO = 0';
      Sql.Clear;
      Sql.Text := sSQL;
      Open;
      if Fields[0].AsInteger = 0 then
      begin
         Close;
         sSQL := 'INSERT INTO ITEMEMPTMO (IDITEMEMPTMO,ITEDESCRICAO) VALUES (0, ''Ajuste Saldo Devedor'') ';
         Sql.Clear;
         Sql.Text := sSQL;
         try
            if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

            ExecSQL;
            ListaTipoContr := TStringList.Create;

            sSQL := 'SELECT IDTIPOCONTREMPTMO FROM TIPOCONTREMPTMO';
            LimpaParametros(qryAux);
            Sql.Clear;
            Sql.Text := sSQL;
            Open;
            while not eof do
            begin
               ListaTipoContr.Add(FieldByName('IDTIPOCONTREMPTMO').AsString);
               Next;
            end;
            LimpaParametros(qryAux);
            for iContador := 0 to ListaTipoContr.Count -1 do
            begin
                sSQL := 'INSERT INTO ITEMXTIPOCONTR (IDITEMEMPTMO, IDTIPOCONTREMPTMO, ITCRECPAG, ITCEVENTO, ITCTRATASALDODEV, FLGDESTACADO, FLGCENTRALIZA, ITCSEQCALCULO)' + #13 +
                        'VALUES (0,' + ListaTipoContr.Strings[iContador] + ', ''R'', 4, 2, 1, 0, 999)';
                Sql.Clear;
                Sql.Text := sSQL;
                ExecSQL;
            end;

            if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

         except
            if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
         end;
      end;
      LimpaParametros(qryAux);
   end;
end;



function TdtmEmptmo.ExisteAtualizacaoDiariaMutuario(const IDPessoa : Extended;
                                                    const IDBenef  : Extended;
                                                    const dData    : TDateTime
                                                   ): Boolean;
begin
   Result := False;

   with dtmEmptmo.qryExisteAtualizacaoDiariaMutuario do
   begin
      LimpaParametros(dtmEmptmo.qryExisteAtualizacaoDiariaMutuario);

      ParamByName('PIDPESSOA').AsFloat             := IDPessoa;
      ParamByName('PIDBENEF').AsFloat              := IDBenef;
      ParamByName('PHMEDATAPREVISTA').AsDateTime   := dData;

      try
         Open;

         while not(dtmEmptmo.qryExisteAtualizacaoDiariaMutuario.EOF) do
         begin
            if dtmEmptmo.qryExisteAtualizacaoDiariaMutuarioTOTAL.AsInteger <= 0 then
            begin
               Result := False;
               Exit;
            end;

            dtmEmptmo.qryExisteAtualizacaoDiariaMutuario.Next;
         end;

         Result := True;

      except
      end;
   end;
end;
end.
