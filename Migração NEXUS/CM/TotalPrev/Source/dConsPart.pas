{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG:.......: MIGRACAO-ORACLE
Data Alteração: 16/10/2025
Responsável...: Edilaine
Descrição.....: Cast de campos para Varchar2
--------------------------------------------------------------------------------
Alteração   : qryMovBenef     
WO          : WO23998
Responsável : Paulo Nobre
Data        : 31/07/2025
Descrição   : Voltar a mostrar o nome da Pessoa, para ser apresentado na
              Consulta Geral de Pessoas, na grid do Histórico de Movimentações.
--------------------------------------------------------------------------------
alteração   : (dfm) qryBenef, qrySituacaoAtualBenef
SIG         : WO18367
Responsável : edilaine
Data        : 05/03/2025
Descrição   : Inclusão dos campos BSTITULAR, FABTITULAR e PERC_PENSAO
--------------------------------------------------------------------------------
alteração   : qryPortabSaida
SIG         : 130847
Responsável : leandro
Data        : 07/12/2022
Descrição   : Inclusão codigos de novas reservas de portabilidade saida
--------------------------------------------------------------------------------
alteração   : qrypartgeral
SIG         : 128969
Responsável : edilaine
Data        : 15/09/2022
Descrição   : Desfazer SIG126319 e apresentar Representante Legal na Consulta Geral
-------------------------------------------------------------------------------
alteração   : qrypartgeral
SIG         : 126319
Responsável : Luis Ferrari
Data        : 17/06/2022
Descrição   : Alteração na query qrypartgeral alterando o responsavel legal
-------------------------------------------------------------------------------
alteração   : qrySituacaoAtualBenef
SIG         : 103013
Responsável : Taffarel Sevaybriker
Data        : 13/10/2020
Descrição   : Incluído NVL na consulta
-------------------------------------------------------------------------------
alteração   : DFM - qryDependente
SIG         : 97640
Responsável : Fabio Sampaio
Data        : 12/02/2020
Descrição   : Ajuste no consulta geral para acesso aos dados do pensionista
--------------------------------------------------------------------------------
SIG         : 96715
Responsável : Rafael Vasconcelos
Data        : 10/02/2020
Descrição   : Ajuste na consulta de Telefone. Considerar o IDPESSOA ou IDENDERECO
-------------------------------------------------------------------------------
alteração   : QryDependente
SIG         : 97368
Responsável : Taffarel Sevaybriker
Data        : 07/02/2020
Descrição   : Ajuste para junção com a tabela PLANODEPENDENTE.
-------------------------------------------------------------------------------
alteração   : qrydepentit
SIG         : 42986
Responsável : Peterson Victor
Data        : 09/11/2017 
Descrição   : ajustes nova regra para dependentes
-------------------------------------------------------------------------------
alteração   : {.dfm qrydepentit, qryLogAltDependentes, qrypartgeral),
              qrydepentitAfterScroll
SIG         : 42986
Responsável : Edilaine
Data        : 04/08/2017
Descrição   : ajustes para apresentação maximizada dos paineis
-------------------------------------------------------------------------------
// Data       : 17/07/2017
// Sol        : 50686
// Autor      : William Santana
// Descrição  : Correções de erros especificos referentes ao chamado SIG 21868
--------------------------------------------------------------------------------
// Data       : 21/02/2017
// Sol        : 21868
// Autor      : Peterson Victor/Darivaldo Alencar
// Descrição  : Alteração .dfm: qrypartgeral, qrydepentit,qryDependente,
                qrySoElegivel,qryRespNaoElegivel,qryRecebedorPensaoAlim
//------------------------------------------------------------------------------
SIG         : 25332
Responsável : André Imakawa
Data        : 11/05/2017
Descrição   : criação das querys e DS de Portabilidade Entrada e Saida
             (qryPortabEntrada, qryPortabSaida, dsPortabSaida e dsPortabEntrada).
--------------------------------------------------------------------------------
Nº SIG:........... 21866
Data da Alteração: 28/09/2016
Responsável......: Michelle Suellyn Mota
Descrição........: Atualizado qryTelefones - data de inclusao
--------------------------------------------------------------------------------
Pendência   : SOL 208658/15297  KTN 2050337
Responsável : Felipe Azevedo Santos
Data        : 06/09/2013
Descrição   : recompilação do SOL 208658.
--------------------------------------------------------------------------------
Pendência   : SOL 208658 Kintana 2018716
Responsável : Felipe A. Santos
Data        : 26/06/2013
Descrição   : criação das querys do Histórico de Salário Real de Benefício
              (qryHistSRB).
--------------------------------------------------------------------------------			  
//SIG         : 30590
//Responsável : William Santana
//Data        : 05/10/2016
//Descrição   : Correção da query qryMovBenef para trazer o campo
//              TRGUSERINCLUSAO corretamente.
--------------------------------------------------------------------------------
//Pendência   : SOL 270869 PPM 1340102
//Responsável : Helio Lima Custódio
//Data        : 21/03/2016
//Descrição   : Correção da query qryMovBenef para trazer o campo
//              TRGUSERINCLUSAO corretamente.
--------------------------------------------------------------------------------
//Pendência   : SOL 253577/18154 PPM 1320388
//Responsável : Helio Lima Custódio
//Data        : 07/03/2016
//Descrição   : Alteração da query qryMovBenef para presentar também
//              movimentações que possuem identificador do desfazer operações
//              de benefícios preenchidos.
--------------------------------------------------------------------------------
//Pendência   : SOL 269137 PPM 1287534
//Responsável : Peterson Victor
//Data        : 16/02/2016
//Descrição   : Alteração da query qryreserva
--------------------------------------------------------------------------------
//Pendência   : SOL 253577/17604 PPM 999484
//Responsável : Helio Lima Custódio
//Data        : 28/08/2015
//Descrição   : Inclusão de campos na qrySituacaoAtualBenef, qryMovBenef
--------------------------------------------------------------------------------
//Rotinas     : (.dfm qrySituacaoAtualBenef), qrySituacaoAtualBenefAfterScroll
//Pendência   : SOL 249378-17134 PPM 758026
//Responsável : Edilaine Ferraresi
//Data        : 29/04/2015
//Descrição   : Alterar Consulta Geral de Pessoa para apresentar novos campos
//              nas informações dos benefícios INSS
--------------------------------------------------------------------------------
//Pendência   : SOL 245986 PPM 630400
//Responsável : Fernando Xavier
//Data        : 12/01/2014
//DFM         : Alterado a SQL da qryHstSalParticipacao e criação da query qryHstSalParticipacaoAux.
//Descrição   : Duplicidade de informações na tela.
--------------------------------------------------------------------------------
Pendência   : SOL 208715 Kintana 2015769
Responsável : Felipe A. Santos
Data        : 04/07/2013
Descrição   : Alteração na query (qryHstSalParticipacao)
--------------------------------------------------------------------------------
//Pendência   : SOL 235491 KTN 450100
//Responsável : Fernando Xavier
//Data        : 17/07/2014
//Descrição   : **ALTERAÇÃO MANUAL NÃO GRAVA MOVBENEF** .
--------------------------------------------------------------------------------
Pendência   : SOL 200665/13992 KTN 1940550
Responsável : FELIPE AZEVEDO DOS SANTOS
Data        : 05/08/2013
Descrição   : inclusão do tipomov 16 na qryMovBenef, alteração somente no dfm
--------------------------------------------------------------------------------
Pendência   : SOL 229888 Kintana 349946
Responsável : Thiago Melo
Data        : 16/04/2014
Descrição   : Erro Reversão de cotas (Alterações no dfm)
--------------------------------------------------------------------------------
Pendência   : SOL 173532 KINTANA 1833116
Responsável : William Santana
Data        : 18/07/2013
Descrição   : inclusão da qryLogAltDependentes
--------------------------------------------------------------------------------
Pendência   : SOL 201305 Kintana 1958008
Responsável : Fernando Xavier
Data        : 11/03/2013
Descrição   : alterada a qryListPatros
--------------------------------------------------------------------------------
Pendência   : SOL 192897 Kintana 1835724
Responsável : FELIPE AZEVEDO DOS SANTOS
Descrição   : inclusão do field Observacao na qryHistReserva e no CdsHistRerva
--------------------------------------------------------------------------------
Pendência   : SOL 124332 Kintana  630255
Responsável : Fernando Xavier
Descrição   : Consulta para visualização do histórico do SALARIO DE PARTICIPACAO
--------------------------------------------------------------------------------
Pendência   : SOL 176759 Kintana 1661163
Responsável : Fernando Xavier
Data        : 19/06/2012
Descrição   : alteração na regra para mostrar os percentuais de benefícios na tela
              CONSULTA GERAL DE PESSOA/VIDA NO PLANO/BENEFICIOS/SITUAÇÃO ATUAL
--------------------------------------------------------------------------------
Pendência   : SOL 157911 KINTANA:1271166
Responsável : MONICA GONZAGA
Data        : 20/06/2012
Descrição   : Adicionado os campos datafim e datainicio da molestia.
--------------------------------------------------------------------------------
Pendência   : SOL 37791/4261 Kintana 1187530
Responsável : Renato Visoni
Descrição   : Alteração na qryEventosPrev e criação da QryMatriculas.
--------------------------------------------------------------------------------
Pendência   : SOL 164831 KINTANA 1422552
Responsável : BRUNO AZEVEDO
Data        : 29/12/2011
Descrição   : Demonstrar os planos a que o dependente esteja vinculado.
--------------------------------------------------------------------------------
Pendência   : SOL 161339 Kintana 1361327
Responsável : Fanuel Junior
Data        : 28/12/2011
Descrição   : Erro na tela geral de consultas
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 149847/7401
Nº KINTANA..: 1529806
Data........: 03/12/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Atualizar o campo MOTRETENC  ( qryMovBenef / qryBeneficios)
-----------------------------------------------------------------------------------------------------
Pendência     : SOL 170792 Kintana 1526093
Responsável   : Edilaine Ferraresi
Data          : 23/12/2011
Descrição     : HISTORICO DE REVISÃO Favor truncar em 2 casas decimais o campo
SALDO REVISÃO, na tela histórico de revisão
Alteração Form: Ocorreu alteração no componente qryHistoricoRevisoes no campo
SLDREVISAO, propriedade display format
--------------------------------------------------------------------------------
Pendência   : SOL 150834 Kintana 1104309
Responsável : Fanuel Junior
Data        : 17/06/2011
Descrição   : Demonstrar os planos a que o dependente esteja vinculado.
--------------------------------------------------------------------------------
Pendência   : SOL 136383 - Kintana 815815
Responsável : Marcelo Almeida
Data        : 02/10/2010
Descrição   : Implementação de uma rotina de registro e gerenciamento de
              revisões realizadas pela COABE.
--------------------------------------------------------------------------------
Pendência    : SOL 153452 Kintana 1157657
Responsável  : Renato Visoni
Descrição    : O sistema estaba buscando a Informação "PAGO NO CONVENIO INSS"
da tabela errada. Mudamos de "NVL(BPPREV.FLGPAGAINSS,0) AS FLGPAGAINSS' para
NVL(B.FLGPAGAINSS,0) AS FLGPAGAINSS da QrySituacaoAtualBenef
--------------------------------------------------------------------------------
Responsável : Renato Visoni
Pendência   : SOL 126929 Kintana 668755
Descrição   : Apresentar Data Início IR, Data Fim IR, Data Inicio Sal.Familia, Data Fim Sal.Familia,
              Data inicio invalidez, data fim invalidez ,Início Moléstia e Fim Moléstia na Grid.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 151082 Kintana 1103382
Responsável : BRUNO AZEVEDO
Data        : 18/01/2011
Descrição   : Adicionado em todas as querys os campos criados no SOL141386.
--------------------------------------------------------------------------------
Pendência   : SOL 141386 Kintana 1031786
Responsável : BRUNO AZEVEDO
Data        : 11/01/2011
Descrição   : Adicionado os campos "Isento de IR" e "Desconta IR sobre suplementação e INSS juntos".
--------------------------------------------------------------------------------
Pendência    : SOL 143794 KINATA 943403
Data         : 04/11/2010
Responsável  : Fanuel Junior
Descrição    : Foi criado o combobox DblkPatro e a qryListPatros que retorna as
patrocinadoras da pessoa que está sendo consultada.
 --------------------------------------------------------------------------------
Pendência    : SOL 149483 Kintana 1073107
Responsável  : Renato Visoni
Descrição    : O sistema estaba buscando a Informação "PAGO NO CONVENIO INSS"
da tabela errada. Mudamos de "NVL(BPPREV.FLGPAGAINSS,0) AS FLGPAGAINSS' para
NVL(B.FLGPAGAINSS,0) AS FLGPAGAINSS da QrySituacaoAtualBenef
--------------------------------------------------------------------------------
Pendência    : SOL 127789 KINATA 680107
Data         : 03/12/2009
Responsável  : Ádler Souza
Descrição    : Correção na query 'qryPlanos' onde os dados estavam vindo planos
duplicados.
--------------------------------------------------------------------------------
Pendência   : SOL 127144 Kintana 670910
Responsável : Renato Visoni
Data        : 01/04/2010
Descrição   : Criação da QryHistoricoPercentual.
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante...
Pendência    : 27904
Data         : 12/05/2008
Responsável  : Daniel Simões
Descrição    : Correção na query 'qryPlanos' onde os dados estaam vindo
               duplicados. Apenas acrescentei um 'alter join' entre o campo
               'EVENT.IDPLANOPREV' da sub-query 'EVENT' com o campo
               'PA.IDPLANOPREV' da tabela 'PARTPREVPLAN'.
--------------------------------------------------------------------------------
Padrão       : 5.10.17 em diante...
Pendência    : 27837
Data         : 05/05/2008
Responsável  : Daniel Simões
Descrição    : Correção da query 'qryEmprestimos' para poder trazer o número de
               parcelas restantes corretamente.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27281
Data         : 25/02/2008
Responsável  : Daniel Simões
Descrição    : Correção do tipo do campo 'DESCRICAO' na query 'qryFiario' ...
--------------------------------------------------------------------------------
Padrão      : 5.10.16
Pendência   : 24612
Data        : 29/05/2007
Responsável : Daniel Simões
Descrição   : Ajuste na query 'qryPartGeral' para trazer o campo 'FLGDIRETOR' no
              componente CheckBox que foi adicionado no form 'fConsPart'
              substituindo a forma de exibição anterior através de um 'DBEdit'
              por um 'DBRadioGroup' ...
--------------------------------------------------------------------------------
Padrão      : 5.10.13
Pendência   : 23991
Data        : 19/12/2006
Responsável : Daniel Simões
Descrição   : Correção na tela de atendimento ao entrar na Consulta Geral de
              Pessoas. Estava entrando a tela de busca, quando o certo seria
              entrar direto na CGP já com os dados carregados do participante
              selecionado no atendimento...

              obs.: Estava dando erro de SQL na query 'qryRecebDadosPessoais'.
                    Adicionei nas duas subquerys a cláusula
                    'IDDOCUMENTO IS NOT NULL', para não trazer além do número do
                    documento, o registro com o ID do documento igual a null...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dConsPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc, URegra, Provider, DBClient;

type
  TdtmConsPart = class(TDataModule)
    dspartgeral: TwwDataSource;
    qrypartgeral: TwwQuery;
    qrydepentit: TwwQuery;
    dsdepentit: TwwDataSource;
    qrypart: TwwQuery;
    qrybenef: TwwQuery;
    dsbenef: TwwDataSource;
    dspart: TwwDataSource;
    qryevent: TwwQuery;
    qryemp: TwwQuery;
    dsevent: TwwDataSource;
    dsemp: TwwDataSource;
    qryprocesso: TwwQuery;
    qryreserva: TwwQuery;
    dsprocesso: TwwDataSource;
    dsreserva: TwwDataSource;
    dsEventosPrev: TwwDataSource;
    qryEventosPrev: TwwQuery;
    dsHstContF: TwwDataSource;
    qryHstContF: TwwQuery;
    qrypartPLANASS: TStringField;
    qrypartPLANPREV: TStringField;
    qrypartDEPEN: TStringField;
    qryempTEMAVALISTA: TFloatField;
    qryempNUMPARCELAS: TFloatField;
    qryempDATAASSIN: TDateTimeField;
    qryempDATAREFVALOR: TDateTimeField;
    qryempVALORCONTR: TFloatField;
    qryempSITUACAOCONTR: TStringField;
    qryempMESAVERB: TStringField;
    qryempDTPRIMPARC: TDateTimeField;
    qryempCARENCIA: TFloatField;
    qryempVALORPARCINFOR: TFloatField;
    qryempVALORPARCCALC: TFloatField;
    qryempVALORFATORINFOR: TFloatField;
    qryempVALORFATORCALC: TFloatField;
    qryempDIAVENC: TFloatField;
    qryempAVA: TStringField;
    qryempPLANPREV: TStringField;
    qryempPESSJUR: TStringField;
    qryempPESSOA: TStringField;
    qryempFINAN: TStringField;
    qryempDESCTIPOCONTRATO: TStringField;
    qryempDESCTIPOEMPTMO: TStringField;
    qryempIDCONTRCREDMUT: TFloatField;
    qryHstContFFLGASSOCIADA: TFloatField;
    qryHstContFCONTRIBUICAOF: TStringField;
    qryeventDATAEVENT: TDateTimeField;
    qryeventVALOREVENT: TFloatField;
    qryeventVALORPAGO: TFloatField;
    qryeventDATAPAG: TDateTimeField;
    qryeventFLGREEMBOLSO: TFloatField;
    qryeventTIT: TStringField;
    qryeventDEP: TStringField;
    qryeventMATRICULA: TStringField;
    qryeventCPF: TStringField;
    qryeventPREV: TStringField;
    qryeventPLANASS: TStringField;
    qryeventSERV: TStringField;
    qryeventDATAADMISSAO: TDateTimeField;
    qryprocessoIDPROCESSO: TFloatField;
    qryprocessoDATAINIPROCESSO: TDateTimeField;
    qryprocessoDATAFIMPROCESSO: TDateTimeField;
    qryprocessoDATAFIMPREV: TDateTimeField;
    qryprocessoTIPOPROCESSO: TStringField;
    qryprocessoSTATUS: TStringField;
    qryreservaVALORRESERVA: TFloatField;
    qryreservaCOTVALOR: TFloatField;
    qryreservaVLRATUAL: TFloatField;
    qryreservaNOME: TStringField;
    qryreservaFLGCOLETIVA: TFloatField;
    qryreservaINDICEREAJUSTE: TFloatField;
    qryreservaANALITICOSINTETI: TStringField;
    qryreservaCODHIERARQUIA: TStringField;
    qryreservaPREV: TStringField;
    qryreservaTIT: TStringField;
    qryreservaPATRO: TStringField;
    qryreservaMOESIGLA: TStringField;
    qryreservaCODIGO: TStringField;
    qryRubs: TwwQuery;
    DsRubs: TwwDataSource;
    qryTipoDocXRub: TwwQuery;
    qryTipoDocXRubFLGRECEBIDO: TStringField;
    qryTipoDocXRubDATARECEB: TDateTimeField;
    qryTipoDocXRubNOMEDOCUMENTO: TStringField;
    qryTipoDocXRubIDDOCUMENTO: TFloatField;
    qryTipoDocXRubIDTIPODOCXRUB: TFloatField;
    dsTipoDocXRub: TwwDataSource;
    qryHistRubs: TwwQuery;
    qryHistRubsHISTORICO: TMemoField;
    qryHistRubsSTATUS: TStringField;
    qryHistRubsTRGDTINCLUSAO: TDateTimeField;
    qryHistRubsIDRUBS: TFloatField;
    qryHistRubsIDHISTMOVRUBS: TFloatField;
    DsHistRubs: TwwDataSource;
    qryRUBpendentes: TwwQuery;
    qryRUBpendentesIDRUBS: TFloatField;
    qryRUBpendentesSTATUS: TStringField;
    qryRUBpendentesDATAMOV: TDateTimeField;
    qryRUBpendentesFLGSTATUS: TStringField;
    qryRUBpendentesFLGOLDSTATUS: TStringField;
    qryRUBpendentesIDCANCELAMENTO: TFloatField;
    qryRUBpendentesIDHISTBAIXA: TFloatField;
    qryRUBpendentesIDHISTLANCTO: TFloatField;
    dsRUBpendentes: TwwDataSource;
    qryTipoDocRubPendentes: TwwQuery;
    qryTipoDocRubPendentesFLGRECEBIDO: TStringField;
    qryTipoDocRubPendentesDATARECEB: TDateTimeField;
    qryTipoDocRubPendentesNOMEDOCUMENTO: TStringField;
    qryTipoDocRubPendentesIDDOCUMENTO: TFloatField;
    qryTipoDocRubPendentesIDTIPODOCXRUB: TFloatField;
    qryTipoDocRubPendentesIDRUBS: TFloatField;
    dsTipoDocRubPendentes: TwwDataSource;
    qryContribuicoes: TwwQuery;
    DsContribuicoes: TwwDataSource;
    qryContribuicoesNOME: TStringField;
    qryContribuicoesNOMEVALORBASE1: TStringField;
    qryContribuicoesVALORBASE1: TFloatField;
    qryContribuicoesNOMEVALORBASE2: TStringField;
    qryContribuicoesVALORBASE2: TFloatField;
    qryContribuicoesNOMEVALORBASE3: TStringField;
    qryContribuicoesVALORBASE3: TFloatField;
    qryHistReserva: TwwQuery;
    qryHistReservaMESREFERENCIA: TStringField;
    qryHistReservaVLRCOTAS: TFloatField;
    qryHistReservaVLRREAL: TFloatField;
    qryHistReservaSALDOCOTAS: TFloatField;
    qryHistReservaSALDOREAL: TFloatField;
    qryHistReservaFLGENTRADA: TStringField;
    qryHistReservaDATAALIMENTACAO: TDateTimeField;
    qryHistReservaDATAMOV: TDateTimeField;
    qryHistReservaIDCONTRIBUICAO: TFloatField;
    qryHistReservaIDBENEFICIO: TFloatField;
    qryHistReservaNOMECONTRIB: TStringField;
    qryHistReservaNOMEBENEF: TStringField;
    qryHistReservaVALORINDICE: TFloatField;
    qryHistReservaNOME: TStringField;
    qryHistReservaFLGCOLETIVA: TFloatField;
    qryHistReservaINDICEREAJUSTE: TFloatField;
    qryHistReservaANALITICOSINTETI: TStringField;
    qryHistReservaMOESIGLA: TStringField;
    qryHistReservaCODIGO: TStringField;
    dsHistReserva: TwwDataSource;
    qryreservaFLGATIVO: TStringField;
    qryRecebedor: TwwQuery;
    dsRecebedor: TwwDataSource;
    qryFiario: TwwQuery;
    qryFiarioDATAINCLUSAO: TDateTimeField;
    dsFiario: TwwDataSource;
    qryFiarioIDRUBS: TFloatField;
    qryFiarioNOMEUSUARIO: TStringField;
    dsMovBenef: TwwDataSource;
    qryMovBenef: TwwQuery;
    qryMovBenefDATAMOV: TDateTimeField;
    qryMovBenefDESCMOV: TStringField;
    qryMovBenefIDBENEFICIO: TFloatField;
    qryMovBenefDATAINICIO: TDateTimeField;
    qryMovBenefDATAFINAL: TDateTimeField;
    qryMovBenefDATAINICIOANT: TDateTimeField;
    qryMovBenefDATAFINALANT: TDateTimeField;
    qryMovBenefVALORATUAL: TFloatField;
    qryContribuicoesDECODECPFLGCOBRA1COBRAN: TStringField;
    qryRubIndiv: TwwQuery;
    dsRubIndiv: TwwDataSource;
    qryRubIndivIDRUBRICA: TFloatField;
    qryRubIndivPROVDESC: TStringField;
    qryRubIndivDESCRICAO: TStringField;
    qryRubIndivVALORRUBRICA: TFloatField;
    qryRubIndivIDREGRACALCULO: TFloatField;
    qryRubIndivNOMEREGRA: TStringField;
    qryRubIndivNOMEFAV: TStringField;
    qryRubIndivNOMEALIM: TStringField;
    qryRubIndivRUBRICAPROVENTOPA: TFloatField;
    qryRubIndivDESCPA: TStringField;
    qryRubIndivPROVDESCPA: TStringField;
    qryRubIndivNUMOCORRENCIAS: TFloatField;
    qryRubIndivTIPOPERMANENTE: TStringField;
    qryRubIndivFLGPERCENT: TFloatField;
    qryRubIndivDATAINICIO: TDateTimeField;
    qryRubIndivDATAFINAL: TDateTimeField;
    qryRubIndivNOMEBENEF: TStringField;
    qryRubIndivPARCELAS: TFloatField;
    qryRubIndivDOCFAV: TStringField;
    qryRubIndivDOCALIM: TStringField;
    qryRubIndivLOGRADOURO: TStringField;
    qryRubIndivNUMERO: TStringField;
    qryRubIndivBAIRRO: TStringField;
    qryRubIndivCEP: TStringField;
    qryRubIndivNOME: TStringField;
    qryRubIndivNOMEESTADO: TStringField;
    qryRubIndivDDD: TStringField;
    qryRubIndivNUMEROTEL: TStringField;
    qryRubIndivTIPO: TStringField;
    qryRubIndivCONTACORRENTE: TStringField;
    qryRubIndivIDAGENCIA: TFloatField;
    qryRubIndivTIPOCONTA: TStringField;
    qryRubIndivFLGCONTACONJUNTA: TStringField;
    qryRubIndivNOMEAGENCIA: TStringField;
    qryRubIndivNOMEBANCO: TStringField;
    qryRubIndivNUMAGENCIA: TStringField;
    qryRubIndivIDBANCO: TFloatField;
    qryRubIndivNUMBANCO: TStringField;
    qryRubIndivCONTAPREF: TStringField;
    qryRubIndivTPCONTA: TStringField;
    qryFiarioIDGRUPO: TFloatField;
    qryFiarioDESCGRUPO: TStringField;
    qryreservaDATAMAX: TDateTimeField;
    qryreservaFLGCONTROLE: TFloatField;
    qryEmprestimos: TwwQuery;
    dsEmprestimo: TwwDataSource;
    qryhstEmprestimo: TwwQuery;
    dsHstEmprestimo: TwwDataSource;
    DsRubXBeneficio: TwwDataSource;
    qryRubXBeneficio: TwwQuery;
    qryRubXBeneficioNOME: TStringField;
    qryRubsIDRUBS: TFloatField;
    qryRubsSTATUS: TStringField;
    qryRubsFLGSTATUS: TStringField;
    qryRubsFLGOLDSTATUS: TStringField;
    qryRubsIDCANCELAMENTO: TFloatField;
    qryRubsIDHISTBAIXA: TFloatField;
    qryRubsIDHISTLANCTO: TFloatField;
    qryRubsDATAMOV: TDateTimeField;
    qryDataServidor: TwwQuery;
    qryDataServidorDATASERVIDOR: TDateTimeField;
    qryPessoaFisica: TwwQuery;
    qryPessoaFisicaFLGBLOQUEIO: TFloatField;
    qryDocPessoa: TwwQuery;
    qryDocPessoaNUMDOCUMENTO: TStringField;
    qryRecebedorIDRESPONSAVEL: TFloatField;
    qryRecebedorNOME: TStringField;
    qryMesRubrica: TwwQuery;
    DsHstRubricas: TwwDataSource;
    qryHstRubricas: TwwQuery;
    qryHstRubricasIDPESSOA: TFloatField;
    qryHstRubricasIDPESSJUR: TFloatField;
    qryHstRubricasIDMOTIVO: TFloatField;
    qryHstRubricasMES: TStringField;
    qryHstRubricasMESCOBRANCA: TStringField;
    qryHstRubricasREFERENCIA: TStringField;
    qryHstRubricasIDRUBRICA: TFloatField;
    qryHstRubricasCODPROVDESC: TStringField;
    qryHstRubricasVALORPROVENTO: TFloatField;
    qryHstRubricasVALORINTEGRAL: TFloatField;
    qryHstRubricasFLGCOMPOESALPART: TFloatField;
    qryHstRubricasFLGCOMPOESALBENEF: TFloatField;
    qryHstRubricasFLGIRRF: TFloatField;
    qryHstRubricasSEQRUBRICA: TFloatField;
    qryHstRubricasDESCRICAO: TStringField;
    qryHstRubricasFLGSRB: TFloatField;
    qryHstRubricasDESCFLGSRB: TStringField;
    qryRegra: TwwQuery;
    regraAPrev: TRegra;
    UpdDepenTit: TUpdateSQL;
    qrydepentitNOME: TStringField;
    qrydepentitIDPESSOA: TFloatField;
    qrydepentitNUMDOCUMENTO: TStringField;
    qrydepentitIDTITULAR: TFloatField;
    qrydepentitDEPENDENCIA: TStringField;
    qrydepentitNUMSEQUENCIA: TFloatField;
    qrydepentitFLGCONTAIMPOSTOR: TFloatField;
    qrydepentitFLGCONTASALARIOF: TFloatField;
    qrydepentitFLGBENEFICIARIO: TFloatField;
    qrydepentitDESCESTCIVIL: TStringField;
    qrydepentitFLGDESIGNADO: TFloatField;
    qrydepentitFLGDEPLEGAL: TFloatField;
    qrydepentitIDDEPENDENCIA: TStringField;
    qrydepentitMATRICULA: TStringField;
    qrydepentitINICIOIMPOSTOR: TDateTimeField;
    qrydepentitFIMIMPOSTOR: TDateTimeField;
    qrydepentitINICIOSALARIOF: TDateTimeField;
    qrydepentitFIMSALARIOF: TDateTimeField;
    qrydepentitDATANASC: TDateTimeField;
    qrydepentitDATAMORTE: TDateTimeField;
    qrydepentitNOMEPAI: TStringField;
    qrydepentitNOMEMAE: TStringField;
    qrydepentitSEXO: TStringField;
    qrydepentitFLGMOLESTIAGRAVE: TFloatField;
    qrydepentitDATAMOLESTIAGRAVE: TDateTimeField;
    qrydepentitFLGISENTOIRRF: TFloatField;
    qrydepentitSITUACAODEPEN: TStringField;
    qrydepentitFLGELEGIVEL: TFloatField;
    qrydepentitVALORBASE1: TFloatField;
    qrydepentitVALORBASE2: TFloatField;
    qrydepentitVALORBASE3: TFloatField;
    qrydepentitFLGBLOQUEIO: TFloatField;
    qryHistFunc: TwwQuery;
    DSHistFunc: TwwDataSource;
    UpdHistFunc: TUpdateSQL;
    qryHistFuncIDPESSOA: TFloatField;
    qryHistFuncSEQHISTFUNC: TFloatField;
    qryHistFuncIDDOCUMENTO: TFloatField;
    qryHistFuncCODTPINSALUBRI: TStringField;
    qryHistFuncDATAINICIO: TDateTimeField;
    qryHistFuncDATAFINAL: TDateTimeField;
    qryHistFuncEMPRESA: TStringField;
    qryHistFuncFLGCONTATS: TFloatField;
    qryHistFuncNUMDOCUMENTO: TStringField;
    qryHistFuncTEMPOCALC: TFloatField;
    qryHistFuncMATRICULA: TStringField;
    qryHistFuncTEMPOSERVANTERIOR: TFloatField;
    qryHistFuncTEMPOSERVCALC: TFloatField;
    qryHistFuncTEMPOSITESPECIAL: TFloatField;
    qryHistFuncTEMPOSEMCONVERSAO: TFloatField;
    qryHistFuncTEMPONAOCREDITADO: TFloatField;
    qryHistFuncNOME: TStringField;
    qryHistFuncCPF: TStringField;
    qryHistFuncINSALUBRI: TStringField;
    qryHistFuncTEMPOPOREMPRESAEXTENSO: TStringField;
    qryTelefonesCel: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DsTelefonesCel: TDataSource;
    qryDataInicioInss: TwwQuery;
    DsDataInicioInss: TwwDataSource;
    qryDataInicioInssDATAINICIOINSS: TDateTimeField;
    qryTelefoneComercial: TwwQuery;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DsTelefoneComercial: TwwDataSource;
    qryInfPlano: TwwQuery;
    dsInfPlano: TwwDataSource;
    qryTelefones: TwwQuery;
    DsTelefones: TwwDataSource;
    qryTelefonesDDI: TStringField;
    qryTelefonesDDD: TStringField;
    qryTelefonesNUMERO: TStringField;
    qryTelefonesTIPO: TStringField;
    qryHstRubricasIDPATRO: TFloatField;
    qryHstRubricasPROVENTODESC: TStringField;
    qryHstRubricasFLGCOMPOEREMTOTAL: TFloatField;
    qryFuncoes: TwwQuery;
    qryProvDesc: TwwQuery;
    qryVigenciaNivel: TwwQuery;
    qryAdicCompens: TwwQuery;
    qryAdicInsalub: TwwQuery;
    qryAdicPericul: TwwQuery;
    qryCargoxNivel: TwwQuery;
    qryModoCargo: TwwQuery;
    qryFuncao: TwwQuery;
    qryModoFuncao: TwwQuery;
    qryRubSalarial: TwwQuery;
    qryVigenciaFuncao: TwwQuery;
    qryAdicNoturno: TwwQuery;
    dsRubSalarial: TwwDataSource;
    dsAdicPericul: TwwDataSource;
    dsAdicInsalub: TwwDataSource;
    dsFuncao: TwwDataSource;
    dsAdicNoturno: TwwDataSource;
    dsAdicCompens: TwwDataSource;
    dsATS: TwwDataSource;
    qryDet: TwwQuery;
    dsDet: TwwDataSource;
    qry: TwwQuery;
    ds: TwwDataSource;
    qryElegivel: TwwQuery;
    qryRubricaIndiv: TwwQuery;
    qryRubricaIndivIDFAVORECIDO: TFloatField;
    qryRubricaIndivIDALIMENTADO: TFloatField;
    qryRubricaIndivFLGPENSAOALIM: TFloatField;
    qryClassifica: TwwQuery;
    qryRespNaoElegivel: TwwQuery;
    qryDependente: TwwQuery;
    qryPlanos: TwwQuery;
    qryRecebedorPensaoAlim: TwwQuery;
    qryProcessosBenef: TwwQuery;
    dsProcessoBenef: TwwDataSource;
    qrySituacaoAtualBenef: TwwQuery;
    DsSituacaoAtualBenef: TwwDataSource;
    qrySituacaoAtualBenefNUMEROPROCESSO: TFloatField;
    qrySituacaoAtualBenefNUMPROCINSS: TStringField;
    qrySituacaoAtualBenefBENEFICIO: TStringField;
    qrySituacaoAtualBenefSITBENEFICIO: TStringField;
    qrySituacaoAtualBenefTIPOPAGBENEF: TStringField;
    qrySituacaoAtualBenefDATAINICIOBENEF: TDateTimeField;
    qrySituacaoAtualBenefDATAINICIOPAG: TDateTimeField;
    qrySituacaoAtualBenefDATAFINAL: TDateTimeField;
    qrySituacaoAtualBenefDATAREQUERIMENTO: TDateTimeField;
    qrySituacaoAtualBenefDATACONCESSAO: TDateTimeField;
    qrySituacaoAtualBenefDATAINICIOFUND: TDateTimeField;
    qrySituacaoAtualBenefVALORATUAL: TFloatField;
    qrySituacaoAtualBenefVALORCOTAS: TFloatField;
    qrySituacaoAtualBenefVALORTOTAL: TFloatField;
    qrySituacaoAtualBenefVALORCALCULADO: TFloatField;
    qrySituacaoAtualBenefVALORSRB: TFloatField;
    qrySituacaoAtualBenefULTMESPREPARO: TStringField;
    qrySituacaoAtualBenefDATAULTREAJUSTE: TDateTimeField;
    qrySituacaoAtualBenefFORMAPGTO: TStringField;
    qrySituacaoAtualBenefVALORBASE1: TFloatField;
    qrySituacaoAtualBenefVALORBASE2: TFloatField;
    qrySituacaoAtualBenefVALORBASE3: TFloatField;
    qrySituacaoAtualBenefNOMEVALORBASE1: TStringField;
    qrySituacaoAtualBenefNOMEVALORBASE2: TStringField;
    qrySituacaoAtualBenefNOMEVALORBASE3: TStringField;
    qrySituacaoAtualBenefDATAINICIOINSS: TDateTimeField;
    qrySituacaoAtualBenefVLRCALCINSS: TFloatField;
    qrySituacaoAtualBenefVLRINFINSS: TFloatField;
    qrySituacaoAtualBenefMOTIVOCANCELAMEN: TMemoField;
    qrySituacaoAtualBenefFLGPROVISORIO: TFloatField;
    qrySituacaoAtualBenefPERCPROVISORIO: TFloatField;
    qrySituacaoAtualBenefPRAZOPROVISORIO: TFloatField;
    qrySituacaoAtualBenefDATAINICIOBENEFANT: TDateTimeField;
    qrySituacaoAtualBenefVALORBENEFANT: TFloatField;
    qrySituacaoAtualBenefFLGPOSSUIACOMPINSS: TFloatField;
    qrySituacaoAtualBenefBSTITULAR: TFloatField;
    qrySituacaoAtualBenefFABTITULAR: TFloatField;
    qrySituacaoAtualBenefVLRTOTALTITULAR: TFloatField;
    qrySituacaoAtualBenefPERC_PENSAO: TFloatField;
    qryContribSitAtual: TwwQuery;
    DsContribSitAtual: TwwDataSource;
    qryContribSitAtualNOME: TStringField;
    qryContribSitAtualDATAINICIO: TDateTimeField;
    qryContribSitAtualDATAFINAL: TDateTimeField;
    qryContribSitAtualVALORBASE1: TFloatField;
    qryContribSitAtualVALORBASE2: TFloatField;
    qryContribSitAtualVALORBASE3: TFloatField;
    qryContribSitAtualSITCOBRANCA: TStringField;
    qryContribSitAtualNOMEVALORBASE1: TStringField;
    qryContribSitAtualNOMEVALORBASE2: TStringField;
    qryContribSitAtualNOMEVALORBASE3: TStringField;
    qryPessoaLigTitular: TwwQuery;
    qryPessoaLigTitularIDPESSOA: TFloatField;
    qryPatros: TwwQuery;
    qryPatrosIDPESSOA: TFloatField;
    qryPatrosIDPESSJUR: TFloatField;
    qryPatrosNOME: TStringField;
    qryMovBenefNOME: TStringField;
    qrybenefMOTIVO: TStringField;
    qrybenefNOME: TStringField;
    qrybenefIDHSTFOLHABENEF: TFloatField;
    qrybenefNUMEROPROCESSO: TFloatField;
    qrybenefMES: TStringField;
    qrybenefVLBENEFPGTO: TFloatField;
    qrybenefDTEFETPGTO: TDateTimeField;
    qrybenefVALORPREV: TFloatField;
    qrybenefDATAPAGAMENTO: TDateTimeField;
    qrybenefVALORBASE1: TFloatField;
    qrybenefVALORBASE2: TFloatField;
    qrybenefVALORBASE3: TFloatField;
    qrybenefVALORCALCULADO: TFloatField;
    qrybenefVALORINTEGRAL: TFloatField;
    qrybenefVALORTOTAL: TFloatField;
    qrybenefMESREFERENCIA: TStringField;
    qrybenefVALOROP1: TFloatField;
    qrybenefVALOROP2: TFloatField;
    qrybenefVALOROP3: TFloatField;
    qrybenefVALORSRB: TFloatField;
    qrybenefFLGMANUAL: TFloatField;
    qrybenefPATROCINADORA: TStringField;
    qrybenefPLANO: TStringField;
    qrybenefBSTITULAR: TFloatField;
    qrybenefFABTITULAR: TFloatField;
    qrybenefPERC_PENSAO: TFloatField;
    qrybenefFLGAPRESENTABSFAB: TFloatField;
    qrybenefBENEFICIARIO: TStringField;
    qryEventosPrevIDEVENTOSPREV: TFloatField;
    qryEventosPrevNOME: TStringField;
    qryEventosPrevDATAEVENTO: TDateTimeField;
    qryEventosPrevDATAREGISTRO: TDateTimeField;
    qryEventosPrevDATAEFETIVADO: TDateTimeField;
    qryEventosPrevDATAVOLTA: TDateTimeField;
    qryEventosPrevINSCRICAONUMERO: TFloatField;
    qryEventosPrevSITFUNCATUAL: TStringField;
    qryEventosPrevSITPLANOATUAL: TStringField;
    qryEventosPrevSITPARTATUAL: TStringField;
    qryEventosPrevSITFUNCNOVO: TStringField;
    qryEventosPrevSITPLANONOVO: TStringField;
    qryEventosPrevSITPARTNOVO: TStringField;
    qryEventosPrevPATRO: TStringField;
    qryEventosPrevPLANO: TStringField;
    qryEvolFuncATS: TwwQuery;
    dsEvolFuncATS: TwwDataSource;
    qryEvolFuncCargo: TwwQuery;
    dsEvolFuncCargo: TwwDataSource;
    qryEvolFuncao: TwwQuery;
    dsEvolFuncao: TwwDataSource;
    qryEnqSecao2: TwwQuery;
    dsEnqSecao2: TwwDataSource;
    updEnqSecao2: TUpdateSQL;
    qrySituacaoAtualBenefULTMESREAJUSTE: TStringField;
    updEvolFuncao: TUpdateSQL;
    qryreservaFLGTIPORESERVA: TFloatField;
    DsPlanos: TwwDataSource;
    qryRespNaoElegivelMATRICULA: TStringField;
    qryRespNaoElegivelNOME: TStringField;
    qryRespNaoElegivelNUMDOCUMENTO: TStringField;
    qryRespNaoElegivelNOMEPAI: TStringField;
    qryRespNaoElegivelNOMEMAE: TStringField;
    qryRespNaoElegivelDATANASC: TDateTimeField;
    qryRespNaoElegivelSEXO: TStringField;
    qryRespNaoElegivelESTADOCIVIL: TStringField;
    qryRespNaoElegivelEMAIL: TStringField;
    qryRespNaoElegivelSALTOTAL: TStringField;
    qryRespNaoElegivelDATAADMISSAO: TStringField;
    qryRespNaoElegivelDATADEMISSAO: TStringField;
    qryRespNaoElegivelNIVEL: TStringField;
    qryRespNaoElegivelSITPART: TStringField;
    qryRespNaoElegivelFUNCAO: TStringField;
    qryRespNaoElegivelNOMECARGO: TStringField;
    qryRespNaoElegivelVINCULO: TStringField;
    qryRespNaoElegivelDATAMORTE: TDateTimeField;
    qryRespNaoElegivelFILIAL: TStringField;
    qryRespNaoElegivelNOMEVALORBASE1: TStringField;
    qryRespNaoElegivelVALORBASE1: TFloatField;
    qryRespNaoElegivelNOMEVALORBASE2: TStringField;
    qryRespNaoElegivelVALORBASE2: TStringField;
    qryRespNaoElegivelNOMEVALORBASE3: TStringField;
    qryRespNaoElegivelVALORBASE3: TStringField;
    qryRespNaoElegivelFLGMOLESTIAGRAVE: TStringField;
    qryRespNaoElegivelDATAMOLESTIAGRAVE: TDateTimeField;
    qryRespNaoElegivelSITIRRF: TStringField;
    qryRespNaoElegivelFLGBLOQUEIO: TFloatField;
    qryRespNaoElegivelNOMENACIONALIDADE: TStringField;
    qryRespNaoElegivelCODESTADO: TStringField;
    qryRespNaoElegivelNUMDEPIRRF: TFloatField;
    qryRespNaoElegivelNUMDEPSALF: TFloatField;
    qryRespNaoElegivelNUMDEPTOT: TFloatField;
    qryRespNaoElegivelTIPOSANG: TStringField;
    qryRespNaoElegivelSITPLANOPREV: TStringField;
    qryRespNaoElegivelCORPESSOA: TStringField;
    qryRespNaoElegivelFLGDEFICIENTE: TStringField;
    qryRespNaoElegivelINICIOINVALIDEZ: TDateTimeField;
    qryRespNaoElegivelFIMINVALIDEZ: TDateTimeField;
    qryRespNaoElegivelGRAUINSTRUCAO: TStringField;
    qryRespNaoElegivelIMAGEM: TBlobField;
    qryRespNaoElegivelSITUACAONAPATRO: TStringField;
    qryRespNaoElegivelPATRO: TStringField;
    qryRespNaoElegivelIDPESSJUR: TFloatField;
    qryRespNaoElegivelIDPLANOPREV: TFloatField;
    qryRespNaoElegivelPLANO: TStringField;
    qryRespNaoElegivelSEQPROPOSTA: TStringField;
    qryRespNaoElegivelINSCRICAONUMERO: TFloatField;
    qryRespNaoElegivelINSCRICAODATA: TStringField;
    qryRespNaoElegivelIDRGELEGBENEF: TFloatField;    
    qryTelefonesFLGCOM: TStringField;
    qryTelefonesFLPART: TStringField;
    qryTelefonesFLGFAX: TStringField;
    qryTelefonesFLGCEL: TStringField;
    qryTelefonesFLGREC: TStringField;
    qryTelefonesFLGMODEM: TStringField;
    UPDTelefones: TUpdateSQL;
    qrySoElegivel: TwwQuery;
    qrySoElegivelMATRICULA: TStringField;
    qrySoElegivelNOME: TStringField;
    qrySoElegivelNUMDOCUMENTO: TStringField;
    qrySoElegivelNOMEPAI: TStringField;
    qrySoElegivelNOMEMAE: TStringField;
    qrySoElegivelDATANASC: TDateTimeField;
    qrySoElegivelSEXO: TStringField;
    qrySoElegivelESTADOCIVIL: TStringField;
    qrySoElegivelEMAIL: TStringField;
    qrySoElegivelSALTOTAL: TStringField;
    qrySoElegivelDATAADMISSAO: TStringField;
    qrySoElegivelDATADEMISSAO: TStringField;
    qrySoElegivelNIVEL: TStringField;
    qrySoElegivelSITPART: TStringField;
    qrySoElegivelFUNCAO: TStringField;
    qrySoElegivelNOMECARGO: TStringField;
    qrySoElegivelVINCULO: TStringField;
    qrySoElegivelDATAMORTE: TDateTimeField;
    qrySoElegivelFILIAL: TStringField;
    qrySoElegivelNOMEVALORBASE1: TStringField;
    qrySoElegivelVALORBASE1: TFloatField;
    qrySoElegivelNOMEVALORBASE2: TStringField;
    qrySoElegivelVALORBASE2: TStringField;
    qrySoElegivelNOMEVALORBASE3: TStringField;
    qrySoElegivelVALORBASE3: TStringField;
    qrySoElegivelFLGMOLESTIAGRAVE: TStringField;
    qrySoElegivelDATAMOLESTIAGRAVE: TDateTimeField;
    qrySoElegivelSITIRRF: TStringField;
    qrySoElegivelFLGBLOQUEIO: TFloatField;
    qrySoElegivelNOMENACIONALIDADE: TStringField;
    qrySoElegivelCODESTADO: TStringField;
    qrySoElegivelNUMDEPIRRF: TFloatField;
    qrySoElegivelNUMDEPSALF: TFloatField;
    qrySoElegivelNUMDEPTOT: TFloatField;
    qrySoElegivelTIPOSANG: TStringField;
    qrySoElegivelSITPLANOPREV: TStringField;
    qrySoElegivelCORPESSOA: TStringField;
    qrySoElegivelFLGDEFICIENTE: TStringField;
    qrySoElegivelINICIOINVALIDEZ: TDateTimeField;
    qrySoElegivelFIMINVALIDEZ: TDateTimeField;
    qrySoElegivelGRAUINSTRUCAO: TStringField;
    qrySoElegivelIMAGEM: TBlobField;
    qrySoElegivelSITUACAONAPATRO: TStringField;
    qrySoElegivelPATRO: TStringField;
    qrySoElegivelIDPESSJUR: TFloatField;
    qrySoElegivelIDPLANOPREV: TFloatField;
    qrySoElegivelPLANO: TStringField;
    qrySoElegivelSEQPROPOSTA: TStringField;
    qrySoElegivelINSCRICAONUMERO: TFloatField;
    qrySoElegivelINSCRICAODATA: TStringField;
    qrySoElegivelIDRGELEGBENEF: TFloatField;
    updFuncao: TUpdateSQL;
    qrySoElegivelFLGDIRETOR: TStringField;
    qryRespNaoElegivelFLGDIRETOR: TStringField;    
    qryRespNaoElegivelCIDADE: TStringField;
    qrySoElegivelCIDADE: TStringField;
    updAdicConpens: TUpdateSQL;
    qryHistFuncTEMPOTOTALEXT: TStringField;
    qryHistFuncTEMPOSEMCONVERSAOEXT: TStringField;
    qryHistFuncTEMPOINDIVEXT: TStringField;
    CdsHistReserva: TClientDataSet;
    PrvHistReserva: TDataSetProvider;
    CdsHistReservaCODIGO: TStringField;
    CdsHistReservaMESREFERENCIA: TStringField;
    CdsHistReservaFLGENTRADA: TStringField;
    CdsHistReservaSALDOCOTAS: TFloatField;
    CdsHistReservaVALORINDICE: TFloatField;
    CdsHistReservaSALDOREAL: TFloatField;
    CdsHistReservaVLRCOTAS: TFloatField;
    CdsHistReservaVLRREAL: TFloatField;
    CdsHistReservaNOME: TStringField;
    CdsHistReservaDATAALIMENTACAO: TDateTimeField;
    CdsHistReservaDATAMOV: TDateTimeField;
    CdsHistReservaMOESIGLA: TStringField;
    CdsHistReservaNOMEBENEF: TStringField;
    CdsHistReservaNOMECONTRIB: TStringField;
    CdsHistReservaIDCONTRIBUICAO: TFloatField;
    CdsHistReservaIDBENEFICIO: TFloatField;
    CdsHistReservaFLGCOLETIVA: TFloatField;
    CdsHistReservaINDICEREAJUSTE: TFloatField;
    CdsHistReservaANALITICOSINTETI: TStringField;
    qryValoresBaseDepentit: TwwQuery;
    DsValoresBaseDepentit: TwwDataSource;
    qryRunTime: TwwQuery;
    qryAcaoJudicial: TwwQuery;
    qryCompensaIR: TwwQuery;
    qryCompensaIRIDCOMPIRRF: TFloatField;
    qryCompensaIRIDPESSOA: TFloatField;
    qryCompensaIRSALDOCOMP: TFloatField;
    qryCompensaIRCOMPTOTAL: TFloatField;
    qryCompensaIRANOMESINICIO: TStringField;
    qryCompensaIRANOMESFIM: TStringField;
    qryCompensaIRTRGDTINCLUSAO: TDateTimeField;
    qryCompensaIRTRGUSERINCLUSAO: TStringField;
    qryCompensaIRNUMEROPROCESSO: TStringField;
    qryCompensaIRCODVARA: TStringField;
    qryCompensaIRNOMEVARA: TStringField;
    qryDetalheRegra: TwwQuery;
    dsDetalheRegra: TwwDataSource;
    qryRubIndivCODIGORUBRICA: TFloatField;
    qryRubIndivDESCRUBRICA: TStringField;
    qryhstEmprestimoIDCONTRATOEMPTMO: TFloatField;
    qryhstEmprestimoIDITEMEMPTMO: TFloatField;
    qryhstEmprestimoITEDESCRICAO: TStringField;
    qryhstEmprestimoHMEPARCELA: TFloatField;
    qryhstEmprestimoHMETIPOMOV: TStringField;
    qryhstEmprestimoHMEDATA: TDateTimeField;
    qryhstEmprestimoHMEDATAPREVISTA: TDateTimeField;
    qryhstEmprestimoHMEDATAEFETIVA: TDateTimeField;
    qryhstEmprestimoHMEDATAATUALIZA: TDateTimeField;
    qryhstEmprestimoHMEVLRPREVISTO: TFloatField;
    qryhstEmprestimoHMEVLREFETIVO: TFloatField;
    qryhstEmprestimoHMESALDODEV: TFloatField;
    qryhstEmprestimoDESCBAIXADO: TStringField;
    qryhstEmprestimoIDHISTMOVEMPTMO: TFloatField;
    qryRubIndivANOMESREF: TStringField;
    qryRubIndivFLGBASEPA: TFloatField;
    qryRubIndivFLGUSAABONO: TFloatField;
    qryRubIndivFLGPERMANENTE: TFloatField;
    qryRubIndivSEQRUBRICAINDIV: TFloatField;
    qryRubIndivRUBRICAPA: TFloatField;
    qryRubIndivFLGDESATIVADO: TFloatField;
    qryRubIndivFLGUSADO: TFloatField;
    qryreservaFLGTRANSFERENCIA: TFloatField;
    qryreservaFLGTITULARCOLET: TStringField;
    qryTipoDocXRubOBS: TStringField;
    qryATS: TwwQuery;
    qryATSIDPESSJUR: TFloatField;
    qryATSIDPESSOA: TFloatField;
    qryATSSEQHISTFUNC: TFloatField;
    qryATSIDPESSJURCG: TFloatField;
    qryATSIDCARGOEXT: TFloatField;
    qryATSIDPESSJURFG: TFloatField;
    qryATSIDFUNCAO: TFloatField;
    qryATSDATAINICIO: TDateTimeField;
    qryATSDATAFINAL: TDateTimeField;
    qryATSPERC1AC: TFloatField;
    qryATSPERC2AC: TFloatField;
    qryATSPERCATS: TFloatField;
    qryATSPERCINSALUB: TFloatField;
    qryATSPERCPERICUL: TFloatField;
    qryATSPERCFUNCAO: TFloatField;
    qryATSMODOFUNCAO: TStringField;
    qryATSORIGEM: TStringField;
    qryATSFLGSITPART: TStringField;
    qryATSDESCORIGEM: TStringField;
    qryATSSIT: TStringField;
    qryATSDESCSIT: TStringField;
    qryATSDESCSITCADASTRADA: TStringField;
    qryRespNaoElegivelDATACANCELAMENTO: TStringField;    
    qrySoElegivelDATACANCELAMENTO: TStringField;
    qryCargo: TwwQuery;
    DScARGO: TwwDataSource;
    qrySitFuncional: TwwQuery;
    dsSitFuncional: TwwDataSource;
    qryFuncAtual: TwwQuery;
    dsFuncAtual: TwwDataSource;
    qrySitFuncionalNOME: TStringField;
    qrySitFuncionalPERCATS: TFloatField;
    qrySitFuncionalDATAINICIO: TDateTimeField;
    qrySitFuncionalDATAFINAL: TDateTimeField;
    qrySitFuncionalSALPARTICIPACAO: TFloatField;
    qrySitFuncionalFLGDIRETOR: TStringField;
    qrySitFuncionalVINCULO: TStringField;
    qrySitFuncionalCODCARGO: TStringField;
    qrySitFuncionalTITCARGO: TStringField;
    qrySitFuncionalIDCARGOEXT: TFloatField;
    qryFuncFacult: TwwQuery;
    dsFuncFacult: TwwDataSource;
    qrySitFuncionalVALORBASE1: TFloatField;
    qrySitFuncionalVALORBASE2: TFloatField;
    qrySitFuncionalVALORBASE3: TFloatField;
    qrySitFuncionalVALORBASE4: TFloatField;
    qrySitFuncionalVALORBASE5: TFloatField;
    qrySitFuncionalVALORBASE6: TFloatField;
    qrySitFuncionalNOMEVALORBASE1: TStringField;
    qrySitFuncionalNOMEVALORBASE2: TStringField;
    qrySitFuncionalNOMEVALORBASE3: TStringField;
    qrySitFuncionalNOMEVALORBASE4: TStringField;
    qrySitFuncionalNOMEVALORBASE5: TStringField;
    qrySitFuncionalNOMEVALORBASE6: TStringField;
    qrySitFuncionalNIVEL: TStringField;
    qryMesReferencia: TwwQuery;
    dsMesReferencia: TwwDataSource;
    qryNomeReserva: TwwQuery;
    DsNomeReserva: TwwDataSource;
    qryHistReservaFLGCONTROLE: TFloatField;
    qryHistReservaFLGTITULARCOLET: TStringField;
    CdsHistReservaFLGCONTROLE: TFloatField;
    CdsHistReservaFLGTITULARCOLET: TStringField;
    qryRecebedorPensaoAlimMATRICULA: TStringField;
    qryRecebedorPensaoAlimNOME: TStringField;
    qryRecebedorPensaoAlimNUMDOCUMENTO: TStringField;
    qryRecebedorPensaoAlimNOMEPAI: TStringField;
    qryRecebedorPensaoAlimNOMEMAE: TStringField;
    qryRecebedorPensaoAlimDATANASC: TDateTimeField;
    qryRecebedorPensaoAlimSEXO: TStringField;
    qryRecebedorPensaoAlimESTADOCIVIL: TStringField;
    qryRecebedorPensaoAlimEMAIL: TStringField;
    qryRecebedorPensaoAlimSALTOTAL: TStringField;
    qryRecebedorPensaoAlimDATAADMISSAO: TStringField;
    qryRecebedorPensaoAlimDATADEMISSAO: TStringField;
    qryRecebedorPensaoAlimNIVEL: TStringField;
    qryRecebedorPensaoAlimFLGDIRETOR: TStringField;
    qryRecebedorPensaoAlimSITPART: TStringField;
    qryRecebedorPensaoAlimNOMECARGO: TStringField;
    qryRecebedorPensaoAlimFUNCAO: TStringField;
    qryRecebedorPensaoAlimVINCULO: TStringField;
    qryRecebedorPensaoAlimDATAMORTE: TDateTimeField;
    qryRecebedorPensaoAlimFILIAL: TStringField;
    qryRecebedorPensaoAlimNOMEVALORBASE1: TStringField;
    qryRecebedorPensaoAlimVALORBASE1: TFloatField;
    qryRecebedorPensaoAlimNOMEVALORBASE2: TStringField;
    qryRecebedorPensaoAlimVALORBASE2: TStringField;
    qryRecebedorPensaoAlimNOMEVALORBASE3: TStringField;
    qryRecebedorPensaoAlimVALORBASE3: TStringField;
    qryRecebedorPensaoAlimFLGMOLESTIAGRAVE: TStringField;
    qryRecebedorPensaoAlimDATAMOLESTIAGRAVE: TDateTimeField;
    qryRecebedorPensaoAlimSITIRRF: TStringField;
    qryRecebedorPensaoAlimFLGBLOQUEIO: TFloatField;
    qryRecebedorPensaoAlimNOMENACIONALIDADE: TStringField;
    qryRecebedorPensaoAlimCODESTADO: TStringField;
    qryRecebedorPensaoAlimCIDADE: TStringField;
    qryRecebedorPensaoAlimNUMDEPIRRF: TFloatField;
    qryRecebedorPensaoAlimNUMDEPSALF: TFloatField;
    qryRecebedorPensaoAlimNUMDEPTOT: TFloatField;
    qryRecebedorPensaoAlimTIPOSANG: TStringField;
    qryRecebedorPensaoAlimSITPLANOPREV: TStringField;
    qryRecebedorPensaoAlimCORPESSOA: TStringField;
    qryRecebedorPensaoAlimFLGDEFICIENTE: TStringField;
    qryRecebedorPensaoAlimINICIOINVALIDEZ: TDateTimeField;
    qryRecebedorPensaoAlimFIMINVALIDEZ: TDateTimeField;
    qryRecebedorPensaoAlimGRAUINSTRUCAO: TStringField;
    qryRecebedorPensaoAlimIMAGEM: TBlobField;
    qryRecebedorPensaoAlimSITUACAONAPATRO: TStringField;
    qryRecebedorPensaoAlimPATRO: TStringField;
    qryRecebedorPensaoAlimIDPESSJUR: TFloatField;
    qryRecebedorPensaoAlimIDPLANOPREV: TFloatField;
    qryRecebedorPensaoAlimPLANO: TStringField;
    qryRecebedorPensaoAlimSEQPROPOSTA: TStringField;
    qryRecebedorPensaoAlimINSCRICAONUMERO: TFloatField;
    qryRecebedorPensaoAlimINSCRICAODATA: TStringField;
    qryRecebedorPensaoAlimIDRGELEGBENEF: TFloatField;
    qryRecebedorPensaoAlimDATACANCELAMENTO: TStringField;   
    qryRecebDadosPessoais: TwwQuery;
    dsRecebDadosPessoais: TwwDataSource;
    qryRecebDadosPessoaisNOME: TStringField;
    qryRecebDadosPessoaisCPF: TStringField;
    qryRecebDadosPessoaisRG: TStringField;
    qryRecebDadosPessoaisEXPEDICAO: TStringField;
    qryRecebDadosPessoaisUFRG: TStringField;
    qryRecebDadosPessoaisDTEMISRG: TDateTimeField;
    qryhstEmprestimoANOMESCOMPETENCIA: TStringField;
    qryhstEmprestimoANOMESCOBRANCA: TStringField;
    qrydepentitDATACANCELA: TDateTimeField;
    qryAcaoJudicialIDPROCJUD: TFloatField;
    qryAcaoJudicialIDPESSOA: TFloatField;
    qryAcaoJudicialIDAGENCIABANCARIA: TFloatField;
    qryAcaoJudicialNUMEROPROCESSO: TStringField;
    qryAcaoJudicialIDCBANCARIA: TFloatField;
    qryAcaoJudicialCODSECAO: TStringField;
    qryAcaoJudicialUFSECAO: TStringField;
    qryAcaoJudicialAUTORACAO: TStringField;
    qryAcaoJudicialDATAINICIO: TDateTimeField;
    qryAcaoJudicialDATAFINAL: TDateTimeField;
    qryAcaoJudicialSITPROCESSO: TFloatField;
    qryAcaoJudicialIDBANCO: TFloatField;
    qryAcaoJudicialCODOPERACAO: TStringField;
    qryAcaoJudicialCODVARA: TStringField;
    qryAcaoJudicialNOMEVARA: TStringField;
    qryAcaoJudicialTRGDTINCLUSAO: TDateTimeField;
    qryAcaoJudicialTRGUSERINCLUSAO: TStringField;
    qryAcaoJudicialTIPOACAO: TFloatField;
    qryAcaoJudicialPERCACAO: TFloatField;
    qryAcaoJudicialFLGFAZDEPOSITO: TFloatField;
    qryAcaoJudicialNOMESECAO: TStringField;
    qrySoElegivelDESCRICAO: TStringField;
    qryRespNaoElegivelDESCRICAO: TStringField;
    qryRecebedorPensaoAlimDESCRICAO: TStringField;
    qryEventosPrevIDPLANOPREV: TFloatField;
    qryEventosPrevIDPESSJUR: TFloatField;
    qryeventIDPESSJUR: TFloatField;
    qryeventIDPLANOPREV: TFloatField;
    qrySituacaoAtualBenefIDPLANOPREV: TFloatField;
    qrySituacaoAtualBenefIDPESSJUR: TFloatField;
    qrypartIDPESSJUR: TFloatField;
    qrypartIDPLANOPREV: TFloatField;
    qryHistReservaIDTIPORESERVA: TFloatField;
    qryHistReservaDATAMAX: TDateTimeField;
    qryHistReservaCOTVALOR: TFloatField;
    CdsHistReservaIDTIPORESERVA: TFloatField;
    CdsHistReservaDATAMAX: TDateTimeField;
    CdsHistReservaCOTVALOR: TFloatField;
    qrySituacaoAtualBenefDATAFINALPREVISTA: TDateTimeField;
    qryreservaIDTIPORESERVA: TFloatField;
    qrySituacaoAtualBenefIDSITBENEFICIO: TFloatField;
    qrySituacaoAtualBenefVALBENEFINICIAL: TFloatField;
    qrySituacaoAtualBenefPERCGRUPOFAMILIAR: TFloatField;
    qrySituacaoAtualBenefNUMPROCINSSBENANTERIOR: TStringField;
    qrySituacaoAtualBenefPERCBENANTERIOR: TFloatField;
    qryProcessosBenefIDPLANOPREV: TFloatField;
    qryProcessosBenefIDPESSJUR: TFloatField;
    qryProcessosBenefNUMEROPROCESSO: TFloatField;
    qryProcessosBenefNUMPROCINSS: TStringField;
    qryProcessosBenefBENEFICIO: TStringField;
    qryProcessosBenefSITPROCESSO: TStringField;
    qryProcessosBenefEVENTOGER: TStringField;
    qryProcessosBenefDTEVENTO: TDateTimeField;
    qryProcessosBenefDTREGISTRO: TDateTimeField;
    qryProcessosBenefDATAINICIOBENEF: TDateTimeField;
    qryProcessosBenefDATAFINAL: TDateTimeField;
    qryProcessosBenefDATAINICIOPAG: TDateTimeField;
    qryProcessosBenefVALORATUAL: TFloatField;
    qryProcessosBenefVALORCALCULADO: TFloatField;
    qryProcessosBenefVALORCOTAS: TFloatField;
    qryMovBenefMOTIVO_RETENCAO: TStringField;
    qryMovBenefNUMEROPROCESSO: TFloatField;
    qrybenefPERCENTUAL: TFloatField;
    qryProcessosBenefPERCENTUAL: TFloatField;
    qryHistReservaPATRO: TStringField;
    CdsHistReservaPATRO: TStringField;
    qrySituacaoAtualBenefFLGPAGAINSS: TFloatField;
    qrybenefFLGPAGAINSS: TStringField;
    qryMovBenefDESCEMPRESTIMO: TStringField;
    qrySoElegivelTIPOFLGDIRETOR: TStringField;
    qryRespNaoElegivelTIPOFLGDIRETOR: TStringField;
    qrySitFuncionalTIPOFLGDIRETOR: TFloatField;
    qryRecebedorPensaoAlimTIPOFLGDIRETOR: TStringField;
    dsAdicConfianca: TwwDataSource;
    qryAdicConfianca: TwwQuery;
    qryFiarioDESCRICAO2: TMemoField;
    qryEmprestimosIDCONTRATOEMPTMO: TFloatField;
    qryEmprestimosTCEDESCRICAO: TStringField;
    qryEmprestimosIDTIPOEMPTMO: TFloatField;
    qryEmprestimosDESCTIPOEMPTMO: TStringField;
    qryEmprestimosIDPATRO: TFloatField;
    qryEmprestimosIDPLANOPREV: TFloatField;
    qryEmprestimosIDBENEF: TFloatField;
    qryEmprestimosFLGFORMAREC: TStringField;
    qryEmprestimosFLGFORMAPAG: TStringField;
    qryEmprestimosPORTFORMAREC: TFloatField;
    qryEmprestimosPORTFORMAPAG: TFloatField;
    qryEmprestimosCODFORMAPAG: TFloatField;
    qryEmprestimosDESCREC: TStringField;
    qryEmprestimosDESCPAG: TStringField;
    qryEmprestimosDESCFORMA: TStringField;
    qryEmprestimosDESCSITUACAO: TStringField;
    qryEmprestimosDATAASSINATURA: TDateTimeField;
    qryEmprestimosDATACANC: TDateTimeField;
    qryEmprestimosVLRCONTRATO: TFloatField;
    qryEmprestimosVLRPARCELA: TFloatField;
    qryEmprestimosTXJUROS: TFloatField;
    qryEmprestimosDATACREDITO: TDateTimeField;
    qryEmprestimosDATAPRIMPARC: TDateTimeField;
    qryEmprestimosHMEDATAATUALIZA: TDateTimeField;
    qryEmprestimosHMESALDODEV: TFloatField;
    qryEmprestimosNUMPARCELAS: TFloatField;
    qryEmprestimosHMEPARCELA: TFloatField;
    qryEmprestimosPARCELASRESTANTES: TFloatField;
    qryEmprestimosHMENUMPARCELAS: TFloatField;
    QryHistoricoPercentual: TwwQuery;
    dsHistoricoPercentual: TwwDataSource;
    qryRespNaoElegivelDTNOMEACAO: TDateField;
    qryRespNaoElegivelDTEXONERACAO: TDateField;
    qryRecebedorPensaoAlimDTNOMEACAO: TDateField;
    qryRecebedorPensaoAlimDTEXONERACAO: TDateField;
    qrySoElegivelDTNOMEACAO: TDateTimeField;
    qrySoElegivelDTEXONERACAO: TDateTimeField;
    dsListPatros: TwwDataSource;
    qryListPatros: TwwQuery;    
    qryRespNaoElegivelFLGISENTOIRRF: TStringField;
    qryRespNaoElegivelFLGSOMAIRSUPINSS: TStringField;
    qryRecebedorPensaoAlimFLGISENTOIRRF: TStringField;
    qryRecebedorPensaoAlimFLGSOMAIRSUPINSS: TStringField;
    qrySoElegivelFLGISENTOIRRF: TStringField;
    qrySoElegivelFLGSOMAIRSUPINSS: TStringField;
    qrydepentitINICIOINVALIDEZ: TDateTimeField;
    qrydepentitFIMINVALIDEZ: TDateTimeField;
    dsHistoricoRevisoes: TwwDataSource;
    qryHistoricoRevisoes: TwwQuery;
    qryHistoricoRevisoesDSCMOV: TStringField;
    qryHistoricoRevisoesDATAINICIO: TStringField;
    qryHistoricoRevisoesDATAFIM: TStringField;
    qryHistoricoRevisoesVALORATUAL: TFloatField;
    qryHistoricoRevisoesVALORTOTAL: TFloatField;
    qryHistoricoRevisoesPERCENTUAL: TFloatField;
    qryHistoricoRevisoesSLDREVISAO: TFloatField;
    qryHistoricoRevisoesNUMPARC: TFloatField;
    qryHistoricoRevisoesVALORPARC: TFloatField;
    qryHistoricoRevisoesIDPESSOA: TFloatField;
    qryHistoricoRevisoesIDPLANOPREV: TFloatField;
    qryHistoricoRevisoesIDBENEFICIO: TFloatField;
    qryHistoricoRevisoesIDPESSJUR: TFloatField;
    qryHistoricoRevisoesIDTIPOMOV: TFloatField;
    qryHistoricoRevisoesDIB: TDateTimeField;
    qryHistoricoRevisoesDIP: TDateTimeField;
    qryHistoricoRevisoesDESCREVISAO: TMemoField;
    qryHistoricoRevisoesIDMOTIVO: TFloatField;
    qryHistoricoRevisoesDESC_MOTIVO: TStringField;
    qryHistoricoRevisoesBeneficios: TwwQuery;
    qryHistoricoRevisoesBeneficiosIDPESSOA: TFloatField;
    qryHistoricoRevisoesBeneficiosIDPLANOPREV: TFloatField;
    qryHistoricoRevisoesBeneficiosIDBENEFICIO: TFloatField;
    qryHistoricoRevisoesBeneficiosIDPESSJUR: TFloatField;
    qryHistoricoRevisoesBeneficiosNOMEBENEFICIO: TStringField;
    dsHistoricoRevisoesBeneficios: TwwDataSource;
    qrySituacaoAtualBenefMOSTRAFLGPAGAINSS: TFloatField;
    qrydepentitNOMEPLANO: TStringField;
    qryAgencia: TwwQuery;
    qryConta: TwwQuery;
    qryBanco: TwwQuery;
    dsAgencia: TwwDataSource;
    dsConta: TwwDataSource;
    dsBanco: TwwDataSource;
    dsMatriculas: TwwDataSource; //SOL 37791/4261 Kintana 1187530
    QryMatriculas: TwwQuery;//SOL 37791/4261 Kintana 1187530
    qryEventosPrevMATRICULA: TStringField;
    dtmfldRespNaoElegivelDATAFIMMOLESTIA: TDateTimeField;
    dtmfldRecebedorPensaoAlimDATAFIMMOLESTIA: TDateTimeField;
    dtmfldSoElegivelDATAFIMMOLESTIA: TDateTimeField;
    qryHstSalParticipGrid: TwwQuery;
    qryHstSalParticipGridMES: TStringField;
    qryHstSalParticipGridSALCONT: TStringField;
    qryHstSalParticipGridSALPART: TStringField;
    qryHstSalParticipGridTIPO: TStringField;
    qryHstSalParticipGridMESFILTRO: TStringField;
    DSHstSalParticipGrid: TwwDataSource;
    qryRespNaoElegivelEMAILFUNCEF: TStringField;
    qryRecebedorPensaoAlimEMAILFUNCEF: TStringField;
    qrydepentitEMAILFUNCEF: TStringField;
    qrySoElegivelEMAILFUNCEF: TStringField;
    qryHistReservaOBSERVACAO: TMemoField;
    CdsHistReservaOBSERVACAO: TMemoField;
    qryLogAltDependentes: TwwQuery;
    dsLogAltDependentes: TDataSource; //SOL 37791/4261 Kintana 1187530
    // SOL 200665/13992 KTN 1940550
    qryMovBenefVALORTOTAL: TFloatField;
    qryMovBenefVALORTOTALANT: TFloatField;
    qryMovBenefVALORATUALANT: TFloatField;
    qryMovBenefVALORSRB: TFloatField;
    qryMovBenefVALORSRBANT: TFloatField;
    qryMovBenefIDSITANTERIOR: TStringField;
    qryMovBenefTRGUSERINCLUSAO: TStringField;
    qryHstSalParticipacao: TwwQuery;
    qryHstSalParticipacaoSALPART: TStringField;
    qryHstSalParticipacaoSALCONT: TStringField;
    qryHstSalParticipacaoTIPO: TStringField;
    qryHstSalParticipacaoMESFILTRO: TStringField;
    qryHstSalParticipacaoAux: TwwQuery;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    qrySituacaoAtualBenefFONTEPAGADORA: TFloatField;
    qrySituacaoAtualBenefDEC: TDateTimeField;
    qrySituacaoAtualBenefBENEFLEI142: TFloatField;
    qrySituacaoAtualBenefTEMPOSERVICOANOS: TFloatField;
    qrySituacaoAtualBenefTEMPOSERVICOMES: TFloatField;
    qrySituacaoAtualBenefTEMPOSERVICODIAS: TFloatField;
    qryMovBenefVLRBSATUALANT: TFloatField;
    qryMovBenefVLRBSTOTALANT: TFloatField;
    qryMovBenefVLRBSATUALNOVO: TFloatField;
    qryMovBenefVLRBSTOTALNOVO: TFloatField;
    qryMovBenefVLRFABATUALANT: TFloatField;
    qryMovBenefVLRFABTOTALANT: TFloatField;
    qryMovBenefVLRFABATUALNOVO: TFloatField;
    qryMovBenefVLRFABTOTALNOVO: TFloatField;
    qryMovBenefFLGAPRESENTABSFAB: TFloatField;
    qryMovBenefFLGAPRESENTADEFICIT: TFloatField;
    qryMovBenefIDDESFAZER: TFloatField;
    qryMovBenefDESFEZCONCESSAO: TStringField;
    qrySoElegivelLOTACAOFISICA: TStringField;
    qrySoElegivelTRGDTINCLUSAO: TStringField;
    qrySoElegivelTRGUSERINCLUSAO: TStringField;
    qrySoElegivelTRGDTALTERACAO: TStringField;
    qrySoElegivelDATACANCEL: TStringField;
    qrySoElegivelIDSITDEPENDENTE: TStringField;
    qrySoElegivelSITUACAO: TStringField;
qrypartgeralMATRICULA: TStringField;
    qrypartgeralNOME: TStringField;
    qrypartgeralNUMDOCUMENTO: TStringField;
    qrypartgeralNOMEPAI: TStringField;
    qrypartgeralNOMEMAE: TStringField;
    qrypartgeralDATANASC: TDateTimeField;
    qrypartgeralSEXO: TStringField;
    qrypartgeralESTADOCIVIL: TStringField;
    qrypartgeralEMAIL: TStringField;
    qrypartgeralSALTOTAL: TFloatField;
    qrypartgeralDATAADMISSAO: TDateTimeField;
    qrypartgeralDATADEMISSAO: TDateTimeField;
    qrypartgeralNIVEL: TStringField;
    qrypartgeralFLGDIRETOR: TStringField;
    qrypartgeralTIPOFLGDIRETOR: TFloatField;    
    qrypartgeralSITPART: TStringField;    
    qrypartgeralNOMECARGO: TStringField;
    qrypartgeralFUNCAO: TStringField;
    qrypartgeralVINCULO: TStringField;
    qrypartgeralDATAMORTE: TDateTimeField;
    qrypartgeralFILIAL: TStringField;
    qrypartgeralLOTACAOFISICA: TStringField;
    qrypartgeralNOMEVALORBASE1: TStringField;
    qrypartgeralVALORBASE1: TFloatField;
    qrypartgeralNOMEVALORBASE2: TStringField;
    qrypartgeralVALORBASE2: TFloatField;
    qrypartgeralNOMEVALORBASE3: TStringField;
    qrypartgeralVALORBASE3: TFloatField;
    qrypartgeralFLGMOLESTIAGRAVE: TStringField;
    qrypartgeralDATAMOLESTIAGRAVE: TDateTimeField;
    qrypartgeralDATAFIMMOLESTIA: TDateTimeField;
    qrypartgeralSITIRRF: TStringField;
    qrypartgeralFLGBLOQUEIO: TFloatField;
    qrypartgeralNOMENACIONALIDADE: TStringField;
    qrypartgeralCODESTADO: TStringField;
    qrypartgeralCIDADE: TStringField;
    qrypartgeralNUMDEPIRRF: TFloatField;
    qrypartgeralNUMDEPSALF: TFloatField;
    qrypartgeralNUMDEPTOT: TFloatField;
    qrypartgeralTIPOSANG: TStringField;
    qrypartgeralSITPLANOPREV: TStringField;
    qrypartgeralCORPESSOA: TStringField;
    qrypartgeralFLGDEFICIENTE: TStringField;
    qrypartgeralINICIOINVALIDEZ: TDateTimeField;
    qrypartgeralFIMINVALIDEZ: TDateTimeField;
    qrypartgeralGRAUINSTRUCAO: TStringField;
    qrypartgeralIMAGEM: TBlobField;
    qrypartgeralSITUACAONAPATRO: TStringField;
    qrypartgeralPATRO: TStringField;
    qrypartgeralIDPESSJUR: TFloatField;
    qrypartgeralIDPLANOPREV: TFloatField;
    qrypartgeralPLANO: TStringField;
    qrypartgeralSEQPROPOSTA: TFloatField;
    qrypartgeralINSCRICAONUMERO: TFloatField;
    qrypartgeralINSCRICAODATA: TDateTimeField;
    qrypartgeralIDRGELEGBENEF: TFloatField;
    qrypartgeralDTNOMEACAO: TDateTimeField;
    qrypartgeralDTEXONERACAO: TDateTimeField;
    qrypartgeralDATACANCELAMENTO: TDateTimeField;
    qrypartgeralDESCRICAO: TStringField;
    qrypartgeralFLGISENTOIRRF: TStringField;
    qrypartgeralFLGSOMAIRSUPINSS: TStringField;
    qrypartgeralEMAILFUNCEF: TStringField;
    qrypartgeralTRGDTINCLUSAO: TDateTimeField;
    qrypartgeralTRGUSERINCLUSAO: TStringField;
    qrypartgeralTRGDTALTERACAO: TDateTimeField;
    qrypartgeralDATACANCEL: TDateTimeField;
    qrypartgeralIDSITDEPENDENTE: TStringField;
    qrypartgeralSITUACAO: TStringField;
    qrypartgeralDATACANCELA: TDateTimeField;
    qrySoElegivelDATACANCELA: TStringField;
    qryDependenteMATRICULA: TStringField; 
    qryDependenteNOME: TStringField;
    qryDependenteNUMDOCUMENTO: TStringField;
    qryDependenteNOMEPAI: TStringField;
    qryDependenteNOMEMAE: TStringField;
    qryDependenteDATANASC: TDateTimeField;
    qryDependenteSEXO: TStringField;
    qryDependenteESTADOCIVIL: TStringField;
    qryDependenteEMAIL: TStringField;
    qryDependenteSALTOTAL: TStringField;
    qryDependenteDATAADMISSAO: TStringField;
    qryDependenteDATADEMISSAO: TStringField;
    qryDependenteNIVEL: TStringField;
    qryDependenteFLGDIRETOR: TStringField;    
qryDependenteTIPOFLGDIRETOR: TStringField;
    qryDependenteSITPART: TStringField;
    qryDependenteNOMECARGO: TStringField;
    qryDependenteFUNCAO: TStringField;
    qryDependenteVINCULO: TStringField;
    qryDependenteDATAMORTE: TDateTimeField;
    qryDependenteFILIAL: TStringField;
    qryDependenteLOTACAOFISICA: TStringField;
    qryDependenteNOMEVALORBASE1: TStringField;
    qryDependenteVALORBASE1: TFloatField;
    qryDependenteNOMEVALORBASE2: TStringField;
    qryDependenteVALORBASE2: TStringField;
    qryDependenteNOMEVALORBASE3: TStringField;
    qryDependenteVALORBASE3: TStringField;
    qryDependenteFLGMOLESTIAGRAVE: TStringField;
    qryDependenteDATAMOLESTIAGRAVE: TDateTimeField;
    qryDependenteDATAFIMMOLESTIA: TDateTimeField;
    qryDependenteSITIRRF: TStringField;
    qryDependenteFLGBLOQUEIO: TFloatField;
    qryDependenteNOMENACIONALIDADE: TStringField;
    qryDependenteCODESTADO: TStringField;
    qryDependenteCIDADE: TStringField;
    qryDependenteNUMDEPIRRF: TFloatField;
    qryDependenteNUMDEPSALF: TFloatField;
    qryDependenteNUMDEPTOT: TFloatField;
    qryDependenteTIPOSANG: TStringField;
    qryDependenteSITPLANOPREV: TStringField;
    qryDependenteCORPESSOA: TStringField;
    qryDependenteFLGDEFICIENTE: TStringField;
    qryDependenteINICIOINVALIDEZ: TDateTimeField;
    qryDependenteFIMINVALIDEZ: TDateTimeField;
    qryDependenteGRAUINSTRUCAO: TStringField;
    qryDependenteIMAGEM: TBlobField;
    qryDependenteSITUACAONAPATRO: TStringField;
    qryDependentePATRO: TStringField;
    qryDependenteIDPESSJUR: TFloatField;
    qryDependenteIDPLANOPREV: TFloatField;
    qryDependentePLANO: TStringField;
    qryDependenteSEQPROPOSTA: TFloatField;
    qryDependenteINSCRICAONUMERO: TFloatField;
    qryDependenteINSCRICAODATA: TDateTimeField;
    qryDependenteIDRGELEGBENEF: TFloatField;
    qryDependenteDATACANCELAMENTO: TDateTimeField;    
    qryDependenteDESCRICAO: TStringField;
    qryDependenteDTNOMEACAO: TDateTimeField;
    qryDependenteDTEXONERACAO: TDateTimeField;
    qryDependenteFLGISENTOIRRF: TStringField;
    qryDependenteFLGSOMAIRSUPINSS: TStringField;
    dtmfldTelefonesDTINCLUSAO: TDateTimeField;    
    qryDependenteEMAILFUNCEF: TStringField;
    qryDependenteTRGDTINCLUSAO: TDateTimeField;
    qryDependenteTRGUSERINCLUSAO: TStringField;
    qryDependenteTRGDTALTERACAO: TDateTimeField;
    qryDependenteIDSITDEPENDENTE: TStringField;
    qryDependenteSITUACAO: TStringField;
    qryDependenteDATACANCELA: TDateTimeField;
    qryDependenteFLGCONTAIMPOSTOR: TStringField;
    qrypartgeralTPDEFICIENCIA: TStringField;
    qrydepentitIDADE: TFloatField;
    qryDependenteTPDEFICIENCIA: TStringField;
    qrydepentitDATAINCLUSAO: TDateTimeField;
    qrydepentitDATACANCEL: TDateTimeField;
    qrydepentitIDSITDEPENDENTE: TStringField;
    qrySoElegivelTPDEFICIENCIA: TStringField;
    qryRespNaoElegivelTPDEFICIENCIA: TStringField;
    qryRecebedorPensaoAlimTPDEFICIENCIA: TStringField;
    qryDependenteIDRESPONSAVEL: TStringField;
    qryDependenteCODTIPORESPONSAVEL: TStringField;
    qrypartgeralIDRESPONSAVEL: TStringField;
    qrypartgeralCODTIPORESPONSAVEL: TStringField;
    qryRespNaoElegivelIDRESPONSAVEL: TStringField;
    qryRespNaoElegivelCODTIPORESPONSAVEL: TStringField;
    qrySoElegivelIDRESPONSAVEL: TStringField;
    qrySoElegivelCODTIPORESPONSAVEL: TStringField;
    qryRecebedorPensaoAlimIDRESPONSAVEL: TStringField;
    qryRecebedorPensaoAlimCODTIPORESPONSAVEL: TStringField;
    qrydepentitUSUINCLUSAO: TStringField;
    // SOL 200665/13992 KTN 1940550	
	dsHistSRBGrid02: TDataSource;
    qryHistSRBGrid01: TwwQuery;
    qryHistSRBregreplan: TwwQuery;
    qryHistSRBnovoplano: TwwQuery;
    qryHistSRBreb: TwwQuery;
    qryHistSRBGrid02: TwwQuery;
    updHistSRBGrid02: TUpdateSQL;
    updHistSRBGrid01: TUpdateSQL;
    dsHistSRBGrid01: TDataSource;
	dsPortabEntrada: TwwDataSource;
    qryPortabEntrada: TwwQuery;
    qryPortabEntradaNOME: TStringField;
    qryPortabEntradaCNPJ: TStringField;
    qryPortabEntradaCNPBSUSEP: TStringField;
    qryPortabEntradaTIPO: TStringField;
    qryPortabEntradaVALORPORTADO: TFloatField;
    qryPortabEntradaNOMEPLANO: TStringField;
    qryPortabEntradaTEMPOMESES: TFloatField;
    qryPortabEntradaOPCAOIR: TStringField;
    qryPortabEntradaDATAOPCAOIR: TDateTimeField;
    qryPortabEntradaDATARECEBIMENTO: TDateTimeField;
    dsPortabSaida: TwwDataSource;
    qryPortabSaida: TwwQuery;
    qryPortabSaidaNOME: TStringField;
    qryPortabSaidaCNPBSUSEP: TStringField;
    qryPortabSaidaBENEFCIO: TStringField;
    qryPortabSaidaDATASOLICITACAO: TDateTimeField;
    qryPortabSaidaDATAREGISTRO: TDateTimeField;
    qryPortabSaidaDATAPAGAMENTO: TDateTimeField;
    qryPortabSaidaVALORPORTADO: TFloatField;
    qryPortabSaidaVLRCOTAS: TFloatField;
    qryPortabSaidaCNPJ: TStringField;
    qrydepentitULTALTERACAO: TDateTimeField;
    qrydepentitFLGIGNORAVALIR: TFloatField;
    procedure qryEventosPrevAfterScroll(DataSet: TDataSet);
    procedure qryreservaAfterOpen(DataSet: TDataSet);
    procedure qrydepentitAfterScroll(DataSet: TDataSet);
    procedure qryHistoricoRevisoesBeneficiosAfterScroll(DataSet: TDataSet);
    procedure qrySituacaoAtualBenefAfterScroll(DataSet: TDataSet);
  private
    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    vOnQrySituacaoAtualBenefAfterScroll : TDataSetNotifyEvent;
    procedure SetOnQrySituacaoAtualBenefAfterScroll(Value : TDataSetNotifyEvent);
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
  public
    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    property OnQrySituacaoAtualBenefAfterScroll : TDataSetNotifyEvent read vOnQrySituacaoAtualBenefAfterScroll write SetOnQrySituacaoAtualBenefAfterScroll;
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
  end;

var
  dtmConsPart: TdtmConsPart;

implementation

uses FConsPart, dConsPart1;

{$R *.DFM}

{ ==========================================================================
 | Sistema  .: ADMPREV                                                      |
 | Alterações solicitadas a Pedido do Usuário (REFER)                       |
 | Objetivo .: mostrar o Nível do Participante, Anuênios, Vantagem e Tempo  |
 |             Creditado                                                    |
 | Data     .: 05/12/2000                                                   |
 | Autor    .: Marco Diniz                                                  |
 | Alteração.: Mudanças no SQL da qrypartgeral                              |
 |             Criação da qryContribuicoes e DsContribuicoes                |
 |             Criação da qryBeneficios e DsBeneficios                      |
 | FIM                                                                      |
  ========================================================================== }

procedure TdtmConsPart.qryEventosPrevAfterScroll(DataSet: TDataSet);
begin
  qryHstContF.Close; // Histórico de Contribuições por eventos(Fechado)
  qryHstContF.ParamByName('IdEventosPrev').AsString := qryEventosPrev.FieldByName('IDEVENTOSPREV').AsString;
  qryHstContF.Open;
end;

procedure TdtmConsPart.qryreservaAfterOpen(DataSet: TDataSet);
 var dValorControle, dValorPart : double;
begin
  dValorControle:=0; dValorPart:=0;
  if not qryReserva.isempty then
  begin
    qryReserva.disablecontrols;
    while not qryReserva.eof do
    begin
      if qryReserva.fieldbyname('FLGCONTROLE').asinteger = 1 then
        dValorControle:=dValorControle+qryReserva.fieldbyname('VLRATUAL').asfloat
      else
        dValorPart:=dValorPart+qryReserva.fieldbyname('VLRATUAL').asfloat;
      qryReserva.next;
    end;
    qryReserva.enablecontrols;
  end;
end;

procedure TdtmConsPart.qrydepentitAfterScroll(DataSet: TDataSet);
begin
  //edilaine - SIG42986 - inicio
  if not qrydepentit.ControlsDisabled then
  begin
    dtmConsPart1.qryOutrasInforms.Close;
    dtmConsPart1.qryOutrasInforms.ParamByName('IDPESSOA').Value := dtmConsPart.qryDepenTit.fieldByName('IDPESSOA').value;
    dtmConsPart1.qryOutrasInforms.Open;

    dtmConsPart.qryLogAltDependentes.close;
    dtmConsPart.qryLogAltDependentes.ParamByName('IDPESSOA').AsInteger  := dtmConsPart.qryDepenTit.FieldByName('IDPESSOA').AsInteger;
    dtmConsPart.qryLogAltDependentes.Open;
  end;
  //edilaine - SIG42986 - fim

end;

procedure TdtmConsPart.qryHistoricoRevisoesBeneficiosAfterScroll(
  DataSet: TDataSet);
begin
  dtmConsPart.qryHistoricoRevisoes.DisableControls;
  try
    if (dtmConsPart.qryHistoricoRevisoes.Active) then
    begin
      dtmConsPart.qryHistoricoRevisoes.Close;
    end;
    with dtmConsPart.qryHistoricoRevisoes do
    begin
      ParamByName('idpessoa').AsFloat := DataSet.FieldByName('idpessoa').AsFloat;
      ParamByName('idplanoprev').AsFloat := DataSet.FieldByName('idplanoprev').AsFloat;
      ParamByName('idbeneficio').AsFloat := DataSet.FieldByName('idbeneficio').AsFloat;
      ParamByName('idpessjur').AsFloat := DataSet.FieldByName('idpessjur').AsFloat;
    end;
    dtmConsPart.qryHistoricoRevisoes.Prepare;
    dtmConsPart.qryHistoricoRevisoes.Open;
  finally
    dtmConsPart.qryHistoricoRevisoes.EnableControls;
  end;
  //Marcelo Almeida - SOL 136383 - Kintana 815815

end;

procedure TdtmConsPart.qrySituacaoAtualBenefAfterScroll(DataSet: TDataSet);
begin
   frmconspart.dbchkPAgoConvenio.Visible := (dtmConsPart.qrySituacaoAtualBenef.FieldByName('MOSTRAFLGPAGAINSS').AsInteger = 1);

   // edilaine - SOL 249378-17134 PPM 758026 - inicio
   {RN03 - os campos Data Entrada no Convênio, Benefício Lei 142 e Tempo de Serviço em Anos, Meses e Dias só aparecerão
           na interface quanto o benefício for de fonte pagadora INSS (fonte pagadora = 2) }
   frmconspart.pnlDec.visible := (dtmConsPart.qrySituacaoAtualBenef.FieldByName('FONTEPAGADORA').AsInteger = 2);
   // edilaine - SOL 249378-17134 PPM 758026 - fim

   //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
   if Assigned(vOnQrySituacaoAtualBenefAfterScroll) then
        vOnQrySituacaoAtualBenefAfterScroll(DataSet);
   //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TdtmConsPart.SetOnQrySituacaoAtualBenefAfterScroll(Value : TDataSetNotifyEvent);
begin
       vOnQrySituacaoAtualBenefAfterScroll := Value;
end;

end.




