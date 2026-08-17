// Alterações:
{
--------------------------------------------------------------------------------
Nº SIG...........: MIGRACAO-ORACLE
Data da Alteração: 16/10/2025
Responsável......: LEANDRO POCBON
Descrição........: Ajuste na qrySaldoParcelaAnt(.DFM)
                   Inclusão do parâmetro :PIDCONTRATOEMPTMO na query principal
--------------------------------------------------------------------------------
Nº SIG...........: SIG TIBERO
Data da Alteração: 23/05/2018
Responsável......: Everson Luiz Pereira da Cunha
Descrição........: Melhoria no Planus para adequação ao TIBERO.
                   Alteração na qrySaldoAntAtuDia e qrySaldoAntAtuDiaANTIGA(.DFM)
                   Inclusão do parâmetro :PIDCONTRATOEMPTMO na subquery
--------------------------------------------------------------------------------
Nº SOL............: 265007
Nº PPM............: 1163048
Data da Alteração.: 13/11/2015
Alteração Form....: Alteração da qryPossuiAtualizacaoDiariaExt  (DFM)
Responsável.......: William Santana
Descrição.........: Ajustar a consulta que alimenta o relatório Inadimplência>>"Demonstrativo de valores em aberto"
--------------------------------------------------------------------------------
Pendência   : SOL 260816 PPM 1051407
Responsável : William Moreira da Silva
Data        : 26/08/2015
Descrição   : Ajustes apos Reestruturação da HistMovEmptmo (.DFM)
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Wylliam Leite da Silva
Data        : 04/05/2015
Descrição   : Retirada de indices /*+INDEX(HME XPKHISTMOVEMPTMO) */ na query: qrySaldoAnt
              Retirada de indices /*+INDEX(HME XPKHISTMOVEMPTMO) */ na query: qrySaldoParcelaAnt
              Retirada de indices /*+INDEX(HME XPKHISTMOVEMPTMO) */ na query: qrySaldoAntDivergNOVO
              Retirada de indices /*+INDEX(HME XPKHISTMOVEMPTMO) */ na query: qrySaldoAntAtuDiaDivergNOVO
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
-------------------------------------------------------------------------------
Pendência   : SOL 179805 KINTANA 1659409
Responsável : Thiago Dantas Melo
Data        : 19/06/2012
Descrição   : Na concessão a verificação de inadimplência deve ocorrer com base
              na data prevista
-------------------------------------------------------------------------------
Pendência   : 175562 KINTANA 1637191
Responsável : BRUNO AZEVEDO
Data        : 18/04/2012
Descrição   : Ajuste ao encerrar o contrato.
-------------------------------------------------------------------------------
Pendência   : SOL 179049 KINTANA 1647017
Responsável : BRUNO AZEVEDO
Data        : 25/04/2012
Descrição   : Ajuste na QRY qrySaldoAntAtuDiaANTIGA, DFM!!!.
--------------------------------------------------------------------------------
Pendência   : SOL 178798 KINTANA 1643535
Responsável : BRUNO AZEVEDO
Data        : 23/04/2012
Descrição   : Ajuste na QRY qrySaldoAntAtuDiaANTIGA, DFM!!!.
--------------------------------------------------------------------------------
Pendência   : SOL SOL153161 KINTANA 1149771
Responsável : Fanuel Junior
Data        : 25/02/2011
Descrição   : Inserção dos campos SITENVIO e OPERACAO nas queires de entrada de quitação
--------------------------------------------------------------------------------
Pendência   : SOL 151373 KINTANA 1107058
Responsável : BRUNO AZEVEDO
Data        : 20/01/2011
Descrição   : Ajuste na query que preenche o campo "DEPENDIRRF" da query de entrada
              da regra de margem.
--------------------------------------------------------------------------------
Pendência   : SOL 128694 KINTANA 691547
Responsável : Daniel Begnami
Data        : 17/12/2009
Rotina      : Adicionado a Query: qrySaldoAntAtuDiaANTIGA
Descrição   : Foi identificado um erro no saldo devedor quando é feito atualização de saldo
              de contratos logo após terem sido processado o cálculo de "Tratamento de divergências".
              Por favor, corrigir este grave problema.
--------------------------------------------------------------------------------
Pendência   : SOL 126658 Kintana 664806
Responsável : Renato Visoni
Data        : 04/11/2009
Descrição   : Alteração na qryItensEmAberto.
AND (:PFILTROMES IS NULL OR (:PFILTROMES  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'0000')) || trim(TO_CHAR(HME.HMEMESCOBRANCA,'00')) < :PHMEANOCOBRANCA || :PHMEMESCOBRANCA)))
-------------------------------------------------------------------------------------------------
Pendência   : SOL 125808  KINTANA 652978
Responsável : Ádler Souza
Data        : 21/10/2009
Descrição   : Alteração do Filtro das Queries "qryItensEmAberto" e "qryContratosAnteriores".
-------------------------------------------------------------------------------------------------
Pendência   : SOL 122788  KINTANA 607006
Responsável : Ádler Souza
Data        : 06/10/2009
Descrição   : Aplicação de nova regra "ExisteQuitacaoAberto" e nova Query "qryExisteQuitacaoAberto".
-------------------------------------------------------------------------------------------------
Rotina    : qryHistMovXDocum
Data      : 18/06/2007
Autor     : Alberto
Pendência : 25624
Descrição : Query cetralizada na CalcEmptmo que é utilizada nos tratamentos
            individual e de divergências
---------------------------------------------------------------------------------------------------
Rotina    : qryExisteQuitacao
Data      : 11/06/2007
Autor     : Alberto
Pendência : 25563
Descrição : Ajuste para identificação de quitação por morte que não possui item centralizador
--------------------------------------------------------------------------------------------------
Rotina    : qryItens e qryParcelasAVencer
Data      : 07/03/2007
Autor     : Alberto
Pendência : 22717 - Padrão 15
Descrição : Inclusão do campo FLGTIPODIVERG
---------------------------------------------------------------------------------------------------
Rotina    : qrySaldoParcelaAnt
Data      : 08/03/2007
Autor     : Alberto
Pendência : 20379 - Padrão 15
Descrição : Ajuste da query para não retornar movimentações sem informação de
            quantidade de parcelas
--------------------------------------------------------------------------------------------------
Rotina    : qryPossuiAtualizacaoDiariaExt
Data      : 15/09/2006
Autor     :
Pendência : 22798
Descrição : Criação da query utilizada na função PossuiAtualizacaoDiariaExt
--------------------------------------------------------------------------------------------------
Rotina    : Busca do saldo devedor
Data      : 22/08/2006
Autor     : Alberto Carvalho
Pendência :
Descrição : Acerto na query qrySaldoAntAtuDia para considerar apenas itens que
            tratam saldo devedor
--------------------------------------------------------------------------------------------------
Rotina    : Busca do saldo devedor
Data      : 11/07/2006
Autor     : Alberto Carvalho
Pendência : 22830
Descrição : Acerto na query qrySaldoAntAtuDia e qryUltDataAtualiza para não mais fazer
            distinção entre concessão/atualização diária e outras movimentações nas
            subqueries
---------------------------------------------------------------------------------------------------}

unit dCalcEmptmo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, Wwquery, uRegraMT;

type
   TdtmCalcEmptmo = class(TDataModule)
    qrySaldoMesAnt: TwwQuery;
    qrySaldoMesAntHMESALDODEV: TFloatField;
    qrySaldoMesAntHMETXJUROS: TFloatField;
    qrySaldoMesAntHMEDATAATUALIZA: TDateTimeField;
    qrySaldoMesAntHMEPARCELA: TFloatField;
    qrySaldoMesAntHMENUMPARCELAS: TFloatField;
    qrySaldoAnt: TwwQuery;
    qryParcelasEmAberto: TwwQuery;
    qryItens: TwwQuery;
    qryBuscaItens: TwwQuery;
    qryBuscaItensIDITEMEMPTMO: TFloatField;
    qryBuscaItensFLGCENTRALIZA: TFloatField;
    qryBuscaItensITCRECPAG: TStringField;
    qryBuscaItensIDREGRACALC: TFloatField;
    qryBuscaItensITCPRIORIDADE: TFloatField;
    qryBuscaItensIDPROVENTON: TFloatField;
    qryBuscaItensITCEVENTO: TFloatField;
    qryBuscaItensITCSEQCALCULO: TFloatField;
    qryBuscaItensIDITEMCENTRALIZA: TFloatField;
    qryBuscaItensITEDESCRICAO: TStringField;
    qryBuscaItensITCTRATASALDODEV: TFloatField;
    qryBuscaItensFLGDESTACADO: TFloatField;
    qryParcelasEmAbertoVALOR_DEVIDO: TFloatField;
    qryBuscaItensFLGGRAVAZERO: TFloatField;
    qryItensEmAberto: TwwQuery;
    qryItensEmAbertoIDHISTMOVEMPTMO: TFloatField;
    qryItensEmAbertoHMEVLRPREVISTO: TFloatField;
    qryParcelasNaoPagas: TwwQuery;
    qryParcelasNaoPagasIDHISTMOVEMPTMO: TFloatField;
    qryParcelasNaoPagasHMEVLRPREVISTO: TFloatField;
    qryParcelasNaoPagasHMEPARCELA: TFloatField;
    qryParcelasNaoPagasHMEDATAVENCTO: TDateTimeField;
    qryParcelasNaoPagasHMEDATAPREVISTA: TDateTimeField;
    qryParcelasAtrasadas: TwwQuery;
    qryParcelasAtrasadasIDHISTMOVEMPTMO: TFloatField;
    qryParcelasAtrasadasHMEVLRPREVISTO: TFloatField;
    qryParcelasAtrasadasHMEPARCELA: TFloatField;
    qryParcelasAtrasadasHMEDATAVENCTO: TDateTimeField;
    qryParcelasAtrasadasHMEDATAPREVISTA: TDateTimeField;
    qryVerificaInsertValorZERO: TwwQuery;
    qryVerificaInsertValorZEROFLGGRAVAZERO: TFloatField;
    qryParcelasAVencer: TwwQuery;
    qryParcelasAVencerIDHISTMOVEMPTMO: TFloatField;
    qryParcelasAVencerIDITEMEMPTMO: TFloatField;
    qryParcelasAVencerHMETIPOMOV: TFloatField;
    qryParcelasAVencerHMEVLRPREVISTO: TFloatField;
    qryParcelasAVencerHMEVLREFETIVO: TFloatField;
    qryParcelasAVencerHMEPARCELA: TFloatField;
    qryParcelasAVencerHMENUMPARCELAS: TFloatField;
    qryParcelasAVencerHMEDATAVENCTO: TDateTimeField;
    qryParcelasAVencerHMEDATAPREVISTA: TDateTimeField;
    qryParcelasAVencerHMEDATAEFETIVA: TDateTimeField;
    qryParcelasAVencerHMEDATAATUALIZA: TDateTimeField;
    qryParcelasAVencerHMECENTRALIZA: TFloatField;
    qryParcelasAVencerHMEDESTACADO: TFloatField;
    qryParcelasAVencerFLGENVIO: TFloatField;
    qryParcelasAVencerFLGBAIXADO: TFloatField;
    qryParcelasAVencerFLGESTORNADO: TFloatField;
    qryParcelasAVencerFLGABONADO: TFloatField;
    qryParcelasAVencerHMEFORMACOBRANCA: TStringField;
    qryParcelasAVencerHMEANOCOMPETENCIA: TFloatField;
    qryParcelasAVencerHMEMESCOMPETENCIA: TFloatField;
    qryParcelasAVencerHMEANOCOBRANCA: TFloatField;
    qryParcelasAVencerHMEMESCOBRANCA: TFloatField;
    qryParcelasAVencerHMESALDODEV: TFloatField;
    qryParcelasAVencerHMETXJUROS: TFloatField;
    qryParcelasAVencerFLGSUSPENSAO: TFloatField;
    qrySeguroAnt: TwwQuery;
    qrySeguroAntHMEVLRPREVISTO: TFloatField;
    qryDependIRRF: TwwQuery;
    qryDependIRRFQUANT: TFloatField;
    qrySaldoParcelaAnt: TwwQuery;
    qryParcelasAVencerORDENACAO: TFloatField;
    qryBuscaItensORDENACAO: TFloatField;
    qryUpdateSituacao: TwwQuery;
    qrySituacaoContrato: TwwQuery;
    qrySituacaoContratoFLGSITUACAO: TStringField;
    qryUltDataAtualiza: TwwQuery;
    qryUltDataAtualizaHMEDATAATUALIZA: TDateTimeField;
    qryPossuiAtualizacaoDiaria: TwwQuery;
    DateTimeField1: TDateTimeField;
    qryItensEmAbertoIDCONTRATOEMPTMO: TFloatField;
    qryItensEmAbertoHMEANOCOMPETENCIA: TFloatField;
    qryItensEmAbertoHMEMESCOMPETENCIA: TFloatField;
    qryItensEmAbertoHMEDATAPREVISTA: TDateTimeField;
    qryItensEmAbertoHMEDATAVENCTO: TDateTimeField;
    qrySaldoAntAtuDia: TwwQuery;
    qryExisteQuitacao: TwwQuery;
    FloatField1: TFloatField;
    qryParcelaAtrasadaEmAberto: TwwQuery;
    FloatField3: TFloatField;
    qryDataMorte: TwwQuery;
    qryDataMorteDATAMORTE: TDateTimeField;
    qryTotalPrevPerda: TwwQuery;
    qryTotalPrevPerdaVLR_TOTAL: TFloatField;
    qryLimpaRepasse: TwwQuery;
    qryParcelasAVencerHMEORIGEM: TFloatField;
    qryParcelasAVencerFLGQUITADO: TFloatField;
    qryParcelasAVencerFLGDIVERGPEND: TFloatField;
    qryPossuiAtualizacaoDiariaExt: TwwQuery;
    DateTimeField2: TDateTimeField;
    qryParcelasAVencerFLGTIPODIVERG: TFloatField;
    qryHistMovXDocum: TwwQuery;
    qryHistMovXDocumQUANT: TFloatField;
    qrySaldoAntAtuDiaHMEDATAATUALIZA: TDateTimeField;
    qrySaldoAntAtuDiaHMESALDODEV: TFloatField;
    qrySaldoAntAtuDiaHMETXJUROS: TFloatField;
    qrySaldoAntAtuDiaHMEPARCELA: TFloatField;
    qrySaldoAntAtuDiaHMEPARCELAALT: TFloatField;
    qrySaldoAntAtuDiaHMENUMPARCELAS: TFloatField;
    qrySaldoAntAtuDiaDivergNOVO: TwwQuery;
    qrySaldoParcelaAntDivergNOVO: TwwQuery;
    qrySaldoAntDivergNOVO: TwwQuery;
    qryItensIDHISTMOVEMPTMO: TFloatField;
    qryItensIDITEMEMPTMO: TFloatField;
    qryItensORDENACAO: TFloatField;
    qryItensHMETIPOMOV: TFloatField;
    qryItensHMEORIGEM: TFloatField;
    qryItensHMESEQCOBRANCA: TFloatField;
    qryItensIDITEMCENTRALIZA: TFloatField;
    qryItensHMEPARCELA: TFloatField;
    qryItensHMEPARCELAALT: TFloatField;
    qryItensHMENUMPARCELAS: TFloatField;
    qryItensHMECENTRALIZA: TFloatField;
    qryItensHMEDESTACADO: TFloatField;
    qryItensHMEPRIORIDADE: TFloatField;
    qryItensHMERECPAG: TStringField;
    qryItensHMEDATA: TDateTimeField;
    qryItensHMEDATAPREVISTA: TDateTimeField;
    qryItensHMEDATAEFETIVA: TDateTimeField;
    qryItensHMEDATAATUALIZA: TDateTimeField;
    qryItensHMEDATAVENCTO: TDateTimeField;
    qryItensHMEANOCOMPETENCIA: TFloatField;
    qryItensHMEMESCOMPETENCIA: TFloatField;
    qryItensHMEANOCOBRANCA: TFloatField;
    qryItensHMEMESCOBRANCA: TFloatField;
    qryItensHMEVLRPREVISTO: TFloatField;
    qryItensHMEVLREFETIVO: TFloatField;
    qryItensHMESALDODEV: TFloatField;
    qryItensHMETXJUROS: TFloatField;
    qryItensIDREGRA: TFloatField;
    qryItensHMEFORMACOBRANCA: TStringField;
    qryItensIDRUBRICA: TFloatField;
    qryItensFLGENVIO: TFloatField;
    qryItensFLGBAIXADO: TFloatField;
    qryItensFLGESTORNADO: TFloatField;
    qryItensFLGQUITADO: TFloatField;
    qryItensFLGABONADO: TFloatField;
    qryItensFLGDIVERGPEND: TFloatField;
    qryItensFLGTIPODIVERG: TFloatField;
    qryItensFLGSUSPENSAO: TFloatField;
    qryItensITEDESCRICAO: TStringField;
    qryItensCODDOCUMENTO: TFloatField;
    qryItensPLNCODIGO: TFloatField;
    qryItensPLNCODIGOESTORNO: TFloatField;
    qrySaldoAntHMEDATAATUALIZA: TDateTimeField;
    qrySaldoAntHMESALDODEV: TFloatField;
    qrySaldoAntHMETXJUROS: TFloatField;
    qrySaldoAntHMEPARCELA: TFloatField;
    qrySaldoAntHMEPARCELAALT: TFloatField;
    qrySaldoAntHMENUMPARCELAS: TFloatField;
    qrySaldoParcelaAntHMEDATAATUALIZA: TDateTimeField;
    qrySaldoParcelaAntHMESALDODEV: TFloatField;
    qrySaldoParcelaAntHMETXJUROS: TFloatField;
    qrySaldoParcelaAntHMEPARCELA: TFloatField;
    qrySaldoParcelaAntHMEPARCELAALT: TFloatField;
    qrySaldoParcelaAntHMENUMPARCELAS: TFloatField;
    qryItensDivergNOVO: TwwQuery;
    FloatField2: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField1: TStringField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    DateTimeField7: TDateTimeField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    StringField2: TStringField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    StringField3: TStringField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    qryExisteQuitacaoAberto: TwwQuery;
    qrySaldoAntAtuDiaANTIGA: TwwQuery;
    DateTimeField8: TDateTimeField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    qryItensIDTMPDESC: TFloatField;
    qryParcelasAVencerIDTMPDESC: TFloatField;
    qryParcelasAVencerCODDOCUMENTO: TFloatField;
    qryMinDataVencto: TwwQuery;
    DateTimeField10: TDateTimeField;
    qryItensEmAberto_Auxiliar: TwwQuery;
    
   private  // Private declarations

   public   // Public declarations

   end;



var
  dtmCalcEmptmo: TdtmCalcEmptmo;



implementation
{$R *.DFM}



end.
