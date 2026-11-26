unit UAdmPrev;
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG 46976
//Responsável : Andre Imakawa
//Data        : 25/05/2017
//Descrição   : Com a entrada do SIG 46066 o sistema passou a gravar o IDTITULAR incorreto na
//              funcionalidade Cadastro Manual do Histórico de Contribuições de Beneficiários (Núcleo Familiar)
//              desfeito o SIG 46066 e implementado solução direto nas funcionalidades.
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG 46066
//Responsável : Peterson Victor
//Data        : 17/05/2017
//Descrição   : Erro no RetornaIdTitular que retornava outra Matricula quando era o próprio.
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG 42702
//Responsável : Marcelo Cardoso Santos Filho
//Data        : 28/03/2017
//Descrição   : Erro no RetornaIdTitular que retornava outra Matricula quando era o próprio.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : William Santana
// Pendência   : SIG 35922
// Descricao   : Erro no RetornaIdTitular que retornava outro IDTITULAR quando era o próprio.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SIG  21080
// Descricao   : Erro no Recebimento de Cobrança via Folha para situação na Fundação CA.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 210200 Kintana 2027146
// Descricao   : Erro na concessão de benefícios
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 136384/14423 Kintana 1999179
// Descricao   : Erro no cálculo do SRB a partir da segunda vez.
//--------------------------------------------------------------------------------------------------
// Alterações:
// Autor(a)    : Renato Visoni
// Pendência   : SOL 130508 Kintana 733058
// Descricao   : Regra para validação do IR.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 157444/5301 Kintana 1329006
//Responsável : Fanuel Junior
//Descrição   : Erro na inserção do titular da pensão
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 156019 Kintana 1220965
//Responsável : Renato Visoni
//Descrição   : Ajuste na consulta para buscar o IDTITULAR quando for inserir registro na HSTCONTRIBPREV..
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 146950 KINTANA 1013040
//Responsável : BRUNO AZEVEDO
//Data        : 05/11/2010
//Descrição   : Ajuste na regra numérica.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 143430 KINTANA 929764
//Responsável : BRUNO AZEVEDO
//Data        : 06/09/2010
//Descrição   : Correção na função LEPARAM para verificar o parametro Sistema.IdEmpresa.
//---------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 28/08/2009
// Rotina      : RetornaIdTitular
// Pendência   : SOL 123190 Kintana 621959
// Descricao   : O select estava sem espaço entre a tabela e o from.
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 27/08/2009
// Rotina      : RetornaIdTitular
// Pendência   : SOL 123675 Kintana 620196
// Descricao   : Em caso da função RetornaIdTitular, na gravação do Histórico de Contribuição estava gerando um erro.
//               Após a correção na função, foi passado o idpessoa quando o idTitular retornava ''.
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 27/08/2009
// Rotina      : RetornaIdTitular
// Pendência   : SOL 123526 Kintana 620842
// Descricao   : Algumas matriculas não estavam sendo localizadas na SQL feita para resgatar o IDTITULAR.
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Data        : 29/05/2009
// Rotina      : RetornaIdTitular
// Pendência   : SOL 108902  KINTANA 493923
// Descricao   : O campo IDTITULAR está sendo inserido na tabela HSTCONTRIBPREV.
// -------------------------------------------------------------------------------------------------
//  Rotina..........: function IIF
//  N. Sol..........: 93841
//  N. Kintana......: 403367
//  Data............: 21/08/2008
//  Responsável.....: Denise Arruda
//  Descrição.......: Criação da função IIF
// -------------------------------------------------------------------------------------------------
//  Autor      : Hugo Luna
//  Rotina     : LeParam
//  Pendência  : 21348
//  Data       : 18/10/2007
//  Descrição  : Criação do Parâmetro prmFLGCONTROLERUB
// -------------------------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : PedeInfAux
//  Pendência  : 26039
//  Data       : 15/08/2007
//  Descrição  : Ajuste na tela de informações auxiliares dos eventos gerados
// -------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : LeParam
//  Pendência  : 21348
//  Data       : 15/01/2007
//  Descrição  : Criação do Parâmetro prmFLGENVACFALBF
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 06/04/2006
// Pendencia   : 22044
// Rotina      : CriticaDataCobrancaSit
// Alteração   : Colocar o tipo do calendário na mensagem de aviso
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/02/2006
// Alteração   : criação do campo FLGATUPERCGF
// -------------------------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Data       : 19/12/2005
//  Pendência  : 19233
//  Rotina     : LeParam
//  Descrição  : Criação do parâmetro de motivo de abono para a folha da fundação.
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 20/09/2005
//  Pendência  : 20169
//  Rotina     : RegraNumerica
//  Descrição  : Criação de um parâmetro com valor default para mostrar msgs
// -------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 12/07/2005
//  Pendência  : 19493
//  Descrição  : Novo tratamento de erros
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 13/06/2005
//  Pendência  : 18853
//  Descrição  : Criação de um campo novo para informar se a fundação não irá
//               efetuar acertos de contribuição quando for evento de Demissão da
//               Patrocinadora. Campo criado: FLGNAOACERTCONTDP
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 31/05/2005
//  Rotina     : LeParam
//  Pendência  : 18061
//  Descrição  : Criação do parâmetro para permitir que a fundação opte por
//               permitir que o salário do participante fique zerado no momento
//               da inscrição.
// -------------------------------------------------------------------------------------------------
//  Autor      : Leonardo
//  Data       : 11/04/2005
//  Descrição  : criação do parâmero que indica se as contribuições da fundação devem
//               gerar integração contábil/financeira (FLGINTFUNDACAO)
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 18/01/2005
// Alteração   : criação do campo IDPESSOAREPASSE
// -------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 27/01/2005
//  Pendência  : 18306
//  Descrição  : Incluir campo na pesquisa
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 07/01/2005
//  Pendência  : 18306
//  Descrição  : Criação de um novo parâmetro para aceitar reserva coletiva negativa
//               Parâmetro criado: prmFLGRESNEGATIVA
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/12/2004
// Pendencia   : 18175
// Alteração   : criação do campo IDPESSOAINSS
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 02.12.2004
// Pendencia   : 16940
// Alteração   : criação do campo IDMOTIVOQUITANT 
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 04.11.2004
// Pendencia   : ----
// Alteração   : Preencher o prmNumTentativasSalario no after login
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 11/08/2004
//  Pendência  : ---
//  Descrição  : criação do campo FLGINFCONTABINDIV
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 10.08.2004
//  Pendência  : 17358
//  Descrição  : . Criacao de parametro "Permitir Retenção Anterior a Ult. Pagamento"
//               . Criacao de parametro "Recalcular Benefícios na Liberação de Retidos"
//               . Criacao de parametro "Recalcular Benefícios na Liberação de Retidos
//                 inclusive dos Beneficiários que não eram retidos"
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 03/06/2004
//  Pendência  : ---
//  Descrição  : criação do campo FLGACUMALTER
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 19/05/2004
//  Pendência  : ---
//  Descrição  : criação do campo IDRGCONTABBENEF
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 05/05/2004
//  Pendência  : ---
//  Descrição  : criação do campo IDMOTIVOACERTOTP 
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 05/05/2004
//  Pendência  : ---
//  Descrição  : criação dos campos IDRGDIGMATPENS,MASCMATPENS ,FLGINCAUTMATPENS 
// -------------------------------------------------------------------------------------------------
//  Autor      : lEO
//  Rotina     : LeParam
//  Data       : 29/04/2004
//  Descrição  : Criação do Parâmetro prmIdRgMargemConsig
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : LeParam
//  Pendência  : 16429
//  Data       : 06/04/2004
//  Descrição  : Criação do Parâmetro prmFlgNaoTrazOp
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : PermiteAlteracaoPorExcecao
//  Pendência  : ---
//  Data       : 03.02.2004
//  Descrição  : Cricao de rotina de controles de acesso por excecao
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : LeParam
//  Pendência  : ---
//  Data       : 03.02.2004
//  Descrição  : Preenchimento do prmIdGrupoRubAcerto
// -------------------------------------------------------------------------------------------------
//  Autor      : Ricardo Vigorito
//  Rotina     : LeParam
//  Pendência  : 15568
//  Data       : 22.01.2004
//  Descrição  : Criação do Parâmetro prmFLGCOBPATROFOLHA
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : LeParam
//  Pendência  : ----
//  Data       : 06.01.2004
//  Descrição  : Criação do Parâmetro prmFLGENVACERTOFALEC
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : LeParam
//  Pendência  : 15652
//  Data       : 26/11/2003
//  Descrição  : Criação do Parâmetro prmFlgContaTempInsc
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : LeParam
//  Data       : 23.10.2003
//  Descrição  : Criação do parametro prmMenuChamadorRetroativo
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : Leparam
//  Data       : 17/09/2003
//  Descrição  : inclusao dos motivos de acerto e devolucao de contribuição(IDMOTIVOATRASO, IDMOTIVODEVOLUC)
// -------------------------------------------------------------------------------------------------
//  Rotina     : OraNumero
//  Autor      : Camille
//  Data       : 09.06.2003
//  Descrição  : Tratamento do @ como decimal separator, pois o Regra, em algum
//               momento está colocando este caracter como decimal separator e
//               ainda não conseguimos descobrir o momento exato             
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 27.05.2003
//  Descrição  : Criação do parametro IDMOTIVOFERIAS
// -------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 21/05/2003
//  Descrição  : Nova função RegraString, retorna o resultado da Regra sem critério. 
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 28.04.2003
//  Descrição  : Criação do parametro bUsaModRespon para indicar se esta funciona
//               lidade será ou não utilizada
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 01.04.2003
//  Descrição  : inclusão dos parâmetros para compra de carência
// -------------------------------------------------------------------------------------------------
//  Autor      : Carlos Guedes
//  Data       : 26/03/2003
//  Descrição  : Adicionando novo paramêtro QTDDIASRETRBENEF Pend:13113
// -------------------------------------------------------------------------------------------------
//  Autor      : Carlos Guedes
//  Data       : 25/03/2003
//  Descrição  : Adicionando novo paramêtro IDTPPGBENVITAL Pend:13115
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 04/02/2003
//  Descrição  : PreparaStrRegra
// -------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 30/01/2003
//  Descrição  : Função, ProximoAnoMes13, trata evoluçao de ANO/MES com 13º mês
// -------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 14.01.2003
//  Descrição  : Criação dos parametros IDMOTIVOACERTOFL e FLGTIPOACERTOFL
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 27.11.2002
//  Descrição  : inclusão dos motivos de parcelamento
// -------------------------------------------------------------------------------------------------
// Função      : ValidaNumProcesso
// Autor       : Leo
// Data        : 07/10/2002
// Alteração   : acerto da função que estava com a forma de cálculo do dígito errada
// -------------------------------------------------------------------------------------------------
// Função      : ValidaNumProcesso
// Autor       : Leo
// Data        : 23/09/2002
// Alteração   : implementei esta função que valida o número do processo no módulo 11,
//               como o CPF
// -------------------------------------------------------------------------------------------------
// Função      : CriticaDataCobrancaSit
// Autor       : Leo
// Data        : 25/06/2002
// Alteração   : TROQUEI IIDFUNDACAO POR IDEMPRESA
// -------------------------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 05/06/2002
// Alteração   : tratamento do parâmetro IDMOTIVOSALMANUT
// -------------------------------------------------------------------------------------------------
// Autora      : Camille
// Data        : 03.04.2002
// Alteração   : Leitura do parâmetro global "Gerar rubricas de contribuição e benefícios
//               automaticamente" ( FLGRUBRICAAUTO )
// -------------------------------------------------------------------------------------------------


interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Machklb,Registry,checklst, StdCtrls, Spin ;

const

  cteIdModuloAdmPREV  = 16;
  cteIdModuloCCP      = 32;
  cteIdModuloFolhaBen = 18;
  cteIdModuloFolhaCM  = 21;

var
   { Variáveis Globais }
   sTipoTelaBenef   : string;

   iIdParticipante : integer; { Identificador lido pela rotina PedeParticipante
                                para a próxima função = Participante Ativo }
   iIdPlanoPrev    : integer; { Identificador do Plano Previdenciário do
                                Participante Ativo }
   iIdPatrocin     : integer; { Identificador da Patrocinadora do
                                Participante Ativo }
   iIdFundacao     : integer; { Identificador da fundacao no caso de monofundacao }
   iIdFundacaoAtual : integer;

   sIdVolta,
   sNomeParticip,
   sNomePatro,
   sNomePlano       : string;

   sCancelaSuspende : string; { String com a letra da operacao a ser realizada
                                S - Suspensao  C - Cancelamento
                                D - Desfazer cancelamento }


   bRubricaPatrocinadora ,    { True  - Associação de Rubrica p/ Patrocinadora
                                False - Associação de Rubrica p/ Fundação }
   bAux,                                
   bExibeQuery,
   bPedeFundacao : boolean; { True- entrar no cadastro de fundacao na abertura do sistema}

   sIdPlanoPrev,
   sIdPlano,
   sIdEventoGerador,
   sFlgInterno,
   sIdProduto, sNomeProduto,
   sMascTpReserva  : string; { Mascara do tipo de reserva }

   iIdResponsavelGeral : longint;
   iIdCalculoGeral     : longInt ; // variavel criada para passar para a funcao RegraNumerica
                              // caso o procedimento chamador nao necessite deste paramentro

   { Parâmetros do Sistema }
   prmFLGENVACERTOFALEC      : boolean; 
   prmFLGENVACFALBF          : boolean;
   prmNumTentativasSalario   : integer; 
   prmCalculaSRBNoRetroativo : boolean; 
   prmFLGTIPOPREVIDENC : string;
   prmIntegraContab,
   prmIntegraCAP,
   prmIntegraCAR,
   prmFlgGravaSimulBenef,
   prmFlgImpCertif,
   prmMostraSitGeral,
   prmFlgRubricaAuto,
   prmIntegraFundacao      : boolean; 
   prmflgMultiFundacao    : boolean;

   prmIdMotivoContrib ,
   prmIdMotivoDiverg,
   prmIdMotivoParcelaPREV,
   prmIDMOTIVOFOLHABEN ,
   prmIdMotivoDevolBen,
   prmIdMotDevolNaoIden,
   prmIdMotivoSalManut,  
   prmIdMotivoAmortiza,
   prmIdMotivoParcela,
   prmIdMotivoQuitacao,
   prmIdMotivoAcertoFL,
   prmIdMotivoAcertoMigracaoPlano,
   prmIdRegraContabBenefIndiv,
   prmFLGACUMALTER,
   prmIdMotivoCarencia, 
   prmIdMotivoFERIAS    
   : longint;           
   prmFlgTipoAcertoFL,  
   prmIdTpPgBenVital     : integer;  

   
   prmIdMotivoContribAtraso,
   prmIdMotivoContribDevoluc : Integer;
   

   prmPercMinDesc, prmPercMaxDesc : Double;


   prmIDGRINSTR, 
   prmNUMOPINSS       : integer;

   prmNOMEBINSS1,
   prmNOMEBINSS2,
   prmNOMEBINSS3      : string;

   prmFLGEDITABINSS1,
   prmFLGEDITABINSS2,
   prmFLGEDITABINSS3  : boolean;

   prmIDRGBINSS1,
   prmIDRGBINSS2,
   prmIDRGBINSS3      : longint;


   // Variaveis de integracao com financeiro
   prmIdRamoTipoCliAtivo,
   prmIdRamoTipoCliPatro,
   prmIdRamoTipoCliMantido,
   prmIdRamoTipoCliMantidoParc,
   prmIdRamoTipoCliAssistido,
   prmIdRamoTipoForAtivo,
   prmIdRamoTipoForPatro,
   prmIdRamoTipoForMantido,
   prmIdRamoTipoForMantidoParc,
   prmIdRamoTipoForAssistido    : longint;

   prmUnidNegoc : longint;
   prmCodCentroRespon,
   prmTpOperCobranca,
   prmTpOperFolhaBen,
   prmTpOperReserva,
   prmTpDocRRecBanco,
   prmTpDocRRecPatro,
   prmTpDocPEnvioPatro,
   prmTpDocfOLHAbEN    ,
   prmTpDocPEnvioBanco  : string;

   prmMargemDesconto    : double;
   prmIdRubricaIRRF     : integer;
   prmIdMotivoAbono     : integer;
   prmIdRubPensao       : integer;
   prmQtdDiasRetrBenef  : Integer; 
   prmIdGrupoRubAcerto  : Integer; 
   prmFLGCOBPATROFOLHA  : Integer; 
   prmIdRegraCalcBenefMin : longint; //
   prmMenuChamadorRetroativo : string; 

   prmFlgContaTempInsc : Integer; 

   prmFlgNaoTrazOp  : Integer; 

   prmIdRgMargemConsig : LongInt;
   prmIDPESSOAINSS    : Integer = 0; 
   prmIDPESSOAREPASSE : Integer = 0; 
   prmFLGATUPERCGF    : INteger = 0; 


   prmIDRGDIGMATPENS : LongInt;
   prmMASCMATPENS : String;
   prmFLGINCAUTMATPENS  : Integer;

   prmFLGRETDATAANT    : boolean; 
   prmFLGLIBRECALC     : boolean; 
   prmFLGLIBRECALCBEN  : boolean; 

   prmFLGINFCONTABINDIV     : boolean;
   prmIDMOTIVOQUITANT       : longint;
   prmIdMotAbnFolhaFund     : longint;

   prmFLGRESNEGATIVA        : Integer;
   prmFLGINSCSALZERO        : Integer;

   prmFLGNAOACERTCONTDP     : Integer;

   prmFLGCONTROLERUB        : Integer;


   { Parametro temporario para dizer se testa ou nao REGRA }
   bTestaRegra : boolean;

   bUsaModRespon : boolean; 

   procedure TiraQuery(qryAux : TwwQuery);
   { Rotina para ler a tabela de parametros do Sistema AdmPrev
     e preencher as variaveis de paramentro necessárias }
   function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
   procedure CadastraFundacao(qry : TwwQuery);

   { Rotina que calcula a idade em anos de uma pessoa }
   function CalcIdade(dDataNasc : TDateTime) : integer;

   { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
   function OraNumero(sNumero : string):string;
   function ClienteNumero(sNumero : string):string;

   { Rotinas para executar regras }

   function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function RegraNumerica(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer;
                          psMostraMsg : Boolean = True; limpaRegra : Boolean = False) : string; // Thiago Melo SOL 210200 Kintana 2027146

   function RegraString(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   function RegraBooleanaPasso(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function RegraNumericaPasso(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   { Rotinas para tratar meses e anos }
   function AnoMesAnterior(iMes, iAno : integer) : string;
   function SAnoMesAnterior(sAnoMes : string   ) : string;
   { Proximo ano mes com 13º }
   function ProximoAnoMes13(iMes,iAno : integer) : string;

   function ProximoAnoMes(iMes,iAno : integer)   : string;
   function ProximoMesAno(iMes, iAno : integer)  : string;

   { Rotina para identificar Id do item checado em um checkListBox }

   function PegaidCheck(chklst : TCheckListBox ;chave,nome: string ; var qryaux : TwwQuery ):String;

   { Rotina para criticar Data da Cobranca dependendo da SITUACAO(Calendario)
     'N' - Cobrança Normal          'A' - Cobrança Atrasada      'D' - Pagamento de Devolução
     'P' - Pagamento de Beneficio   'B' - Pagamento de Abono     'T' - Pagamento de Antecipacao de Beneficio
     'O' - Pagamento de Antecipacao de Abono
   }
   function CriticaDataCobrancaSit(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
            sTipoData : char; sMesReferencia, sAnoReferencia : string;
            bIndividual: boolean = false 
            ): string;



   function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
   function MesAnoAnterior(iMes, iAno : integer) : string;
   function MudaSeparador(sNumero : string):string;

   procedure TiraSQL( qry : TwwQuery);

   procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;
                        iTipoInf : integer; // 1 - Texto ; 2 - Data
                        var sValor1 : string );

   function  ProcSituacao(sCodSituacao : string) : string;

   function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;

   
   function  CalculaDataAposPrazo(psDataInicio : string; piPrazoEmMeses : integer) : string;

   // Faz o calculo de um valor pro-rata do inicio do mes até o dia final
   function ValorProRataUltimo(psValorIntegral , psDataRefFinal : string) : double;

   function ValorProRataMes(psValorIntegral, psAnoMesRef, psDataRefInicio, psDataRefFinal : string) : double;

   // Faz o calculo de um valor pro-rata do dia de inicio até o final do mes
   function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;

   function FormaAnoMesTela( pCmbMes : TComboBox; pSpAno : TSpinEdit) : string;

   function RetornaFlagEvento(sDescEvento : string) : string;

   function DiaUtil(sDiaUtil, sMesAno: string): string;

   function RetornaFlgIntSitPart ( piIdSitPart : longint)  : string;

   function BuscaCampoTabela     ( psNomeCampo, psNomeTabela, psCondicao : string ) : string;

   function BuscaMesCobrancaLote ( piIdLote : longint; psAnoMesCobrancaDefault : string ) : string;

   
   function PegaFlgIncluiMesConc(pidlote : integer) : integer;


// Retorna tempo em extenso
    Function TempoExtenso(Tempo:Integer):String;

    Function TransformaDiasTempo(Tempo:Integer):String;

// Retorna Indicador se Periodo for Concomitante
    Function PeriodoConcomitante(QryLocal: TwwQuery;
                                 IdPessoa, Sequencia : Integer;
                                 DataInicial, DataFinal: String):Boolean;

    
    function PatroPermiteAlterarDados( piIdPessJur, piIdPessoa : longint ) : boolean ;


    
    function ValidaNumProcesso(num: string): boolean;

    
    function PreparaStrRegra( str : string ) : string;

    
    // Copia da rotina da folha de beneficios que calcula automaticamente o numero de dependentes
    procedure AtualizaNumeroDependentes( pIdTitular: Integer;
                                         sDataFolha: string;
                                         bcommit: boolean);

    Function ProcAtualizaNumeroDependentes(idPessoa : integer; bCommit : integer) : Boolean; // Renato Visoni SOL 130508 Kintana 733058


    function PermiteAlteracaoPorExcecao( piIdPessJur : longint;
                                     pcTipo      : char     ) : boolean; // E = Evolucao Funcional


    function GravaLogTOTALPREV (psDescOperacao : String ): Boolean;

    // Denise 21/08/2008 Sol: 93841 Kintana: 403367
    function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;

    
    Function RetornaIdTitular(idPessoa:String;idPlanoPrev:String;iNumProcesso : Integer = -1;
             iIdBeneficio : Integer = -1 ;
             sMatricula : String = '') : String;

implementation

uses UMensErro,   DAPrev,        UMascaras, USistema,     UAutorizacao, DBaseDados,
     FPedeInfAux, UFuncoesUteis, UIntegraBack, USincronismo, UDataBase;

Function  PeriodoConcomitante(QryLocal: TwwQuery;
                                                    IdPessoa, Sequencia: Integer;
                                                    DataInicial, DataFinal: String):Boolean;
Begin
  Result := False;

  If Trim(DataFinal) = '' Then DataFinal := DateToStr(Date);
  // Verifica se no historico do participante, ja nao existe uma empresa com o periodo igual.
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add(
     'SELECT SEQHISTFUNC FROM HISTFUNCPREV                 ' +
     'WHERE IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
     '      SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
     '      (DATAINICIO BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
     '                          TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')     ' +
     '       OR                                                                               ' +
     '       DATAFINAL  BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
     '                          TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY''))    ');
    Open;

    If IsEmpty Then Begin
      Result := False;
    End Else Begin
      Result := True;
    End;
  End;
End;




//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := Replicate('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

End;



//******************************************************************************
// Retorna tempo em extenso
Function TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  wTempo, I:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= Replicate('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;


procedure TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;

function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if (sNumero[i] = ',') or (sNumero[i] = '@')
     then begin
        if sNumero[i] = '@'
        then DecimalSeparator := ',';
        
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;

function ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;

function MudaSeparador(sNumero : string):string;
var i : integer;
    sOra : string;
begin
   sOra  := '';
   for i := 1 to length(Trim(sNumero))
   do begin
     if (sNumero[i] = '.') or (sNumero[i] = ',') then
        sOra   := sOra + DecimalSeparator
     else sOra := sOra + sNumero[i]
   end;
   Result := sOra;
end;


function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
var qry : TwwQuery;
begin
   bPedeFundacao := False;

   // Se variaveis ainda nao foram inicilizadas, inicializá-las
   if bInicVar
   then begin
      bTestaRegra := True;
   end;

   // Criar query temporária
   Result := True;
   qry := TwwQuery.Create(Application);
   qry.DatabaseName := nomeBaseDados;
   qry.SQL.Clear;
   //BRUNO AZEVEDO SOL 143430 KINTANA 929764
   //qry.SQL.Add('SELECT * FROM PARAMAPREV WHERE IDFUNDACAO = '+IntToStr(iIdFundacao));
   qry.SQL.Add('SELECT * FROM PARAMAPREV WHERE IDFUNDACAO = '+IntToStr(Sistema.IdEmpresa));
   try
     qry.Open;
   except
     MsgDlg('Erro na leitura de parâmetros','Erro',mtError,[mbOk,mbHelp],0);
     Result := False;
     qry.Close;
     tirasql(qry);
     qry.Free;
     Exit;
   end;

   { Se nao existir registro na tabela de parametros, significa que o sistema
     ainda nao foi instalado, ou seja, está sendo instalado pela 1a. vez.
     Neste caso, o sistema deve gravar algums valores default. Além disto o
     sistema deverá :
        * Perguntar se o usuário trabalhará com mais de uma fundacao
          Se sim -> abrir cadastro de fundacao
          Se nao -> cadastrar empresa do login como fundacao
   }
   if qry.IsEmpty
   then begin
     if MsgDlg('Deseja trabalhar com o sistema Multi-Fundação ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
     then begin // Nao é multifundacao
        CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
        try
           qry.Close;
           qry.SQL.Clear;
           qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                       '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR, IDFUNDACAO, IDPARAMETRO, '+
                       '                        FLGCONTATEMPINSC) '+                                           
                       ' VALUES(0,1,0,1,1, '+IntToStr(Sistema.IdEmpresa)+',1, 0) ');  //BRUNO AZEVEDO SOL 143430 KINTANA 929764
           qry.ExecSQL;
        except
           MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
        end;
     end
     else begin // Usuario optou por sistema multifundacao
        iIdFundacao := -1;
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                    '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR, IDFUNDACAO, IDPARAMETRO) '+
                    ' VALUES(0,1,1,1,1, '+IntToStr(Sistema.IdEmpresa)+',1) ');   //BRUNO AZEVEDO SOL 143430 KINTANA 929764
        try
          qry.ExecSQL;
        except
          on E:EDBEngineError do begin
             MostrarErro(E);
             qry.Close;
             tirasql(qry);
             qry.Free;
             Exit;
          end;
        end;
     end;
   end;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT IDGRINSTR,         FLGATUMATRICULA,      FLGACERTARESERVA,    TPDOCPCONVENIO,      '+
               '        IDGRINSTRUNIV,     FLGVERATIVOS,         IDREGRAMOTIVO,       FLGEXECRGBMINMES,    '+
               '        FLGINTCONTAB,      FLGRECALCULOSRBMES,  '+
               '        MARGEMDESCONTOS,   MASCTIPORESERVA,      FLGMULTIFUNDACAO,    IDMOTIVOFOLHABEN,    '+
               '        FLGINTCPAGAR,      FLGINTCRECEBER,       FLGINTCPAGARPREV,    FLGINTCRECEBERPR,    '+
               '        IDMOTIVOABONO,     IDRUBQUITAEMPREST,    IDRUBQUITAPREV,      IDRUBQUITAASSIST,    '+
               '        IDRUBPENSAO,       IDMOTIVODEVOLBEN,    TPDOCPFLHBENELET,    '+
               '        TPDOCPFLHBENINDIV, TPDOCRFLHBENELET,     TPDOCRFLHBENINDIV,   TPDOCPENVIOBANCO,    '+
               '        TPDOCPENVIOPATRO,  TPDOCRRECBANCO,       TPDOCRRECPATRO,      TIPOPERENVIO,        '+
               '        TIPOPERCOBRANCA,   TIPOPERDIVERG,        TIPOPERRESERVA,      TIPOPERFLHBEN,       '+
               '        TIPOCLIMANTIDOS,   TIPOCLIATIVOS,        TIPOCLIASSISTIDOS,   TIPOCLIMANTPARC,     '+
               '        TIPOFAVATIVOS,     TIPOFAVMANTIDOS,      TIPOFAVASSISTIDOS,   TIPOFAVMANTPARC,     '+
               '        IDMOTIVODIVERG,    FLGCOBPRIMBCOASS,     IDMOTIVOPARCELA,     IDTIPOAGRECPMF,      '+
               '        FLGUSAFOLHARESG,   FLGTRATAPREVIAPA,     FLGCALCULOVALORES,   FLGCORRIGEBENEF,     '+
               '        VLRARREDSALARIO,   VLRBENEFMIN,          IDRUBIRRF,           IDRUBPENSAO,         '+
               '        FLGGRAVASIMULABEN, FLGCALCJUNTO,         FLGINCLUIMESCONC,    NOMEBINSS3,          '+
               '        IDRGBINSS1,        IDRGBINSS2,           IDRGBINSS3,          FLGEDITABINSS1,      '+
               '        FLGEDITABINSS2,    FLGEDITABINSS3,       NUMOPINSS,           NOMEBINSS1,          '+
               '        NOMEBINSS2,        IDMOTDEVOLNAOIDEN,    CODPORTFORMAPATRO,   FLGMOSTRASITGERAL,   '+
               '        FLGRUBRICAAUTO,    FLGIMPCERTIF,         TIPOFAVPATRO,        TIPOCLIPATRO,        '+
               '        IDDOCUMENTO,       IDREGRACALCINSS,      IDMOTIVOCONTRIBP ,   IDMOTIVOSALMANUT,    '+
               '        IDMOTIVOAMORTIZA,  IDMOTIVOPARCELA  ,    IDMOTIVOQUITACAO,    IDMOTIVOACERTOFL,    '+
               '        FLGTIPOACERTOFL,   IDTPPGBENVITAL,       QTDDIASRETRBENEF,    IDMOTIVOCARENCIA,    '+
               '        PERCMINDESC,       PERCMAXDESC,          IDMOTIVOFERIAS,                           '+ 
               '        IDMOTIVOATRASO,    IDMOTIVODEVOLUC,      IDGRUPORUBACERTO,                         '+ 
               '        FLGCONTATEMPINSC,  FLGCOBPATROFOLHA,                                               '+ 
               '        FLGNAOTRAZOP ,     IDRGMARGEMCONSIG ,    IDRGDIGMATPENS,      MASCMATPENS ,        '+
               '        FLGINCAUTMATPENS,  IDMOTIVOACERTOTP ,    IDRGCONTABBENEF ,                         '+
               '        FLGACUMALTER,                                                                      '+
               '        FLGRETDATAANT,                                                                     '+ 
               '        FLGLIBRECALC,                                                                      '+ 
               '        FLGLIBRECALCBEN,                                                                   '+ 
               '        FLGINFCONTABINDIV,                                                                 '+ 
               '        IDMOTIVOQUITANT,                                                                   '+ 
               '        FLGRESNEGATIVA,     '+    
               '        IDPESSOAINSS,       '+    
               '        IDPESSOAREPASSE,     '+   
               '        FLGATUPERCGF,        '+   
               '        IDMOTABNFOLHAFUND, '+     
               '        1 as FLGINTFUNDACAO, '+   
               '        FLGINSCSALZERO,       '+  
               '        FLGNAOACERTCONTDP,    '+  
               '        FLGCONTROLERUB        '+  
               ' FROM   PARAMAPREV '+
               ' WHERE  IDFUNDACAO = '+IntToStr(Sistema.IdEmpresa)); //BRUNO AZEVEDO SOL 143430 KINTANA 929764
   qry.Open;

   prmIdMotAbnFolhaFund := qry.FieldByName('IDMOTABNFOLHAFUND').AsInteger;
   prmIdGrupoRubAcerto  := qry.FieldByName('IDGRUPORUBACERTO').AsInteger; 
   // Parametros de integracao com o financeiro
   prmTpOperCobranca   := qry.FieldByName('TIPOPERCOBRANCA').AsString;
   prmTpOperFolhaBen   := qry.FieldByName('TIPOPERFLHBEN').AsString;
   prmTpOperReserva    := qry.FieldByName('TIPOPERDIVERG').AsString;
   prmTpDocRRecBanco   := qry.FieldByName('TPDOCRRECBANCO').AsString;
   prmTpDocRRecPatro   := qry.FieldByName('TPDOCRRECPATRO').AsString;
   prmTpDocPEnvioPatro := qry.FieldByName('TPDOCPENVIOPATRO').AsString;
   prmTpDocfOLHAbEN    := qry.FieldByName('TPDOCPFLHBENELET').AsString;
   prmTpDocPEnvioBanco := qry.FieldByName('TPDOCPENVIOBANCO').AsString;

   prmIdRamoTipoCliAtivo        := qry.FieldByName('TIPOCLIATIVOS').AsInteger;
   prmIdRamoTipoCliPatro        := qry.FieldByName('TIPOCLIPATRO').AsInteger;
   prmIdRamoTipoCliMantido      := qry.FieldByName('TIPOCLIMANTIDOS').AsInteger;
   prmIdRamoTipoCliMantidoParc  := qry.FieldByName('TIPOCLIMANTPARC').AsInteger;
   prmIdRamoTipoCliAssistido    := qry.FieldByName('TIPOCLIASSISTIDOS').AsInteger;

   prmIdRamoTipoForAtivo        := qry.FieldByName('TIPOFAVATIVOS').AsInteger;
   prmIdRamoTipoForPatro        := qry.FieldByName('TIPOFAVPATRO').AsInteger;
   prmIdRamoTipoForMantido      := qry.FieldByName('TIPOFAVMANTIDOS').AsInteger;
   prmIdRamoTipoForMantidoParc  := qry.FieldByName('TIPOFAVMANTPARC').AsInteger;
   prmIdRamoTipoForAssistido    := qry.FieldByName('TIPOFAVASSISTIDOS').AsInteger;

   if qry.FieldByName('FLGIMPCERTIF').AsInteger = 1
   then prmFlgImpCertif := True
   else prmFlgImpCertif := False;

   if qry.FieldByName('FLGMOSTRASITGERAL').AsInteger = 1
   then prmMostraSitGeral := True
   else prmMostraSitGeral := False;

   if qry.FieldByName('flgMultiFundacao').AsInteger = 1
   then prmflgMultiFundacao := True
   else prmflgMultiFundacao := False;


   prmIntegraContab       := (qry.FieldByName('FLGINTCONTAB').AsInteger = 1);
   prmIntegraCAP          := (qry.FieldByName('FLGINTCPAGARPREV').AsInteger = 1);
   prmIntegraCAR          := (qry.FieldByName('FLGINTCRECEBERPR').AsInteger = 1);
   prmIntegraFundacao     := (qry.FieldByName('FLGINTFUNDACAO').AsInteger = 1); 


   prmCalculaSRBNoRetroativo  := True; 

   prmFlgGravaSimulBenef  := (qry.FieldByName('FLGGRAVASIMULABEN').AsInteger = 1);
   prmFlgRubricaAuto      := (qry.FieldByName('FLGRUBRICAAUTO').AsInteger = 1); 
   prmIdMotivoContrib     := qry.FieldByName('IDMOTIVOCONTRIBP').AsInteger;
   prmIdMotivoDiverg      := qry.FieldByName('IDMOTIVODIVERG').AsInteger;
   prmIdMotivoParcelaPREV := qry.FieldByName('IDMOTIVOPARCELA').AsInteger;
   sMascTpReserva         := qry.FieldByName('MascTipoReserva').AsString;


   prmIdMotivoContribAtraso := qry.FieldByName('IDMOTIVOATRASO').AsInteger;
   prmIdMotivoContribDevoluc := qry.FieldByName('IDMOTIVODEVOLUC').AsInteger;

   prmIdMotivoCarencia := qry.FieldByName('IDMOTIVOCARENCIA').AsInteger;
   prmPercMinDesc := qry.FieldByName('PERCMINDESC').AsFloat;
   prmPercMaxDesc := qry.FieldByName('PERCMAXDESC').AsFloat;

   prmMargemDesconto      := qry.FieldByName('MARGEMDESCONTOS').AsFloat/100;
   prmIdRubricaIRRF       := qry.FieldByName('IDRUBIRRF').AsInteger;
   prmIDMOTIVOFOLHABEN    := qry.FieldByName('IDMOTIVOFOLHABEN').AsInteger;
   prmIdMotDevolNaoIden   := qry.FieldByName('IDMOTDEVOLNAOIDEN').AsInteger;
   prmIdMotivoDevolBen    := qry.FieldByName('IDMOTIVODEVOLBEN').AsInteger;  
   prmIdMotivoAbono       := qry.FieldByName('IDMOTIVOABONO').AsInteger;
   prmIdMotivoAcertoFL    := qry.FieldByName('IDMOTIVOACERTOFL').AsInteger;  
   prmFlgTipoAcertoFL     := qry.FieldByName('FLGTIPOACERTOFL').AsInteger;   



   prmIdMotivoSalManut    := qry.FieldByName('IDMOTIVOSALMANUT').AsInteger;  
   prmIdMotivoFERIAS      := qry.FieldByName('IDMOTIVOFERIAS').AsInteger;    

   
   prmIDGRINSTR           := qry.FieldByName('IDGRINSTR').AsInteger;

   // Parametros de beneficio do INSS
   prmNUMOPINSS           := qry.FieldByName('NUMOPINSS').AsInteger;

   prmNOMEBINSS1          := qry.FieldByName('NOMEBINSS1').AsString;
   prmNOMEBINSS2          := qry.FieldByName('NOMEBINSS2').AsString;
   prmNOMEBINSS3          := qry.FieldByName('NOMEBINSS3').AsString;

   prmFLGEDITABINSS1      := (qry.FieldByName('FLGEDITABINSS1').AsInteger = 1);
   prmFLGEDITABINSS2      := (qry.FieldByName('FLGEDITABINSS2').AsInteger = 1);
   prmFLGEDITABINSS3      := (qry.FieldByName('FLGEDITABINSS3').AsInteger = 1);

   prmIDRGBINSS1          := qry.FieldByName('IDRGBINSS1').AsInteger;
   prmIDRGBINSS2          := qry.FieldByName('IDRGBINSS2').AsInteger;
   prmIDRGBINSS3          := qry.FieldByName('IDRGBINSS3').AsInteger;

   prmIdRubPensao         := qry.FieldByName('IDRUBPENSAO').AsInteger;

   prmIdRegraCalcBenefMin := qry.FieldByName('VLRBENEFMIN').AsInteger; 


   //motivos de parcelamento
   prmIdMotivoAmortiza  := qry.FieldByName('IDMOTIVOAMORTIZA').AsInteger;
   prmIdMotivoParcela   := qry.FieldByName('IDMOTIVOPARCELA').AsInteger;
   prmIdMotivoQuitacao  := qry.FieldByName('IDMOTIVOQUITACAO').AsInteger;

   If not qry.FieldByName('IDTPPGBENVITAL').IsNull Then
     prmIdTpPgBenVital := qry.FieldByName('IDTPPGBENVITAL').AsInteger
   Else prmIdTpPgBenVital := 1; // É mais comum que o "1" seja o pagto vitalício!

   prmQtdDiasRetrBenef  := qry.FieldByName('QTDDIASRETRBENEF').AsInteger;

   prmFLGCOBPATROFOLHA  := qry.FieldByName('FLGCOBPATROFOLHA').AsInteger;

   prmFlgContaTempInsc  := qry.FieldByName('FLGCONTATEMPINSC').AsInteger;

   prmFlgNaoTrazOp  := qry.FieldByName('FLGNAOTRAZOP').AsInteger;

   prmIdRgMargemConsig  := qry.FieldByName('IDRGMARGEMCONSIG').AsInteger;

   prmIDPESSOAINSS      := qry.FieldByName('IDPESSOAINSS').AsInteger;    
   prmIDPESSOAREPASSE   := qry.FieldByName('IDPESSOAREPASSE').AsInteger; 

   {  Indica se o sistema irá atualizar o percentual de grupo }
   {  familiar de acordo com o numero de beneficiário ativos. }
   prmFLGATUPERCGF      := qry.FieldByName('FLGATUPERCGF').AsInteger;




   prmIdMotivoAcertoMigracaoPlano    := qry.FieldByName('IDMOTIVOACERTOTP').AsInteger;

   prmIdRegraContabBenefIndiv    := qry.FieldByName('IDRGCONTABBENEF').AsInteger;

   prmFLGACUMALTER  := qry.FieldByName('FLGACUMALTER').AsInteger;


   prmIDRGDIGMATPENS    := qry.FieldByName('IDRGDIGMATPENS').AsInteger;
   prmMASCMATPENS       := qry.FieldByName('MASCMATPENS').AsString;
   prmFLGINCAUTMATPENS  := qry.FieldByName('FLGINCAUTMATPENS').AsInteger;


   prmFLGRETDATAANT    := (qry.FieldByName('FLGRETDATAANT').AsInteger   = 1); 
   prmFLGLIBRECALC     := (qry.FieldByName('FLGLIBRECALC').AsInteger    = 1); 
   prmFLGLIBRECALCBEN  := (qry.FieldByName('FLGLIBRECALCBEN').AsInteger = 1); 


   prmFLGINFCONTABINDIV  := (qry.FieldByName('FLGINFCONTABINDIV').AsInteger = 1);  
   prmIDMOTIVOQUITANT    := qry.FieldByName('IDMOTIVOQUITANT').AsInteger;    
   prmFLGRESNEGATIVA     := qry.FieldByName('FLGRESNEGATIVA').AsInteger;     
   prmFLGINSCSALZERO     := qry.FieldByName('FLGINSCSALZERO').AsInteger;     
   prmFLGNAOACERTCONTDP  := qry.FieldByName('FLGNAOACERTCONTDP').AsInteger;  
   prmFLGCONTROLERUB     := qry.FieldByName('FLGCONTROLERUB').AsInteger;     

   // Verificar se o parametro de multifundacao está preenchido e a fundacao não existe
   qry.Close;
   qry.SQL.Clear;
   //BRUNO AZEVEDO SOL 143430 KINTANA 929764
   //qry.SQL.Add('SELECT IDPESSOA, FLGTIPOPREVIDENC, FLGENVACERTOFALEC, FLGENVACFALBF FROM FUNDACAO WHERE IDPESSOA = '+IntToStr(iIdFundacao));
   qry.SQL.Add('SELECT IDPESSOA, FLGTIPOPREVIDENC, FLGENVACERTOFALEC, FLGENVACFALBF FROM FUNDACAO WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   qry.Open;
   if qry.IsEmpty
   then begin // Nao existe nenuma fundacao gravada
      if not prmflgMultiFundacao  // Sistema MonoFundacao
      then begin
         if MsgDlg(' O sistema está cadastrado como Mono-Fundação, porém não existe nenhuma fundação cadastrada. '+
                ' Deseja gravar Fundação neste momento ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
         then begin
            // Gravar fundacao
            CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
            prmFLGTIPOPREVIDENC := 'F';
         end;
      end
      else begin // Sistema MultiFundacao
         MsgDlg('O sistema está cadastrado como Multi-Fundação, porém não existe nenhuma fundação cadastrada. '+
                'É recomendável que as Fundações sejam cadastradas neste momento.','Informação',mtInformation,[mbOk,mbHelp],0);
         prmFLGTIPOPREVIDENC := 'F';
      end;
      prmFLGENVACERTOFALEC := False;
      prmFLGENVACFALBF     := False;

   end
   else begin
      prmFLGTIPOPREVIDENC := qry.FieldByName('FLGTIPOPREVIDENC').AsString;
      if qry.FieldByName('FLGENVACERTOFALEC').AsInteger = 0
      then prmFLGENVACERTOFALEC := False
      else prmFLGENVACERTOFALEC := True;

      
      if qry.FieldByName('FLGENVACFALBF').AsInteger = 1
      then prmFLGENVACFALBF := True
      else prmFLGENVACFALBF := False;

   end;


   if Trim(sMascTpReserva) <> ''
   then PreencheTamNiveisMascara(sMascTpReserva);

   if Sistema.IdEmpresa <= 0 then Sistema.IdEmpresa := iIdFundacao;

 
   // **************************************************************************
   //                     PREENCHER PARÂMETROS GLOBAL
   // **************************************************************************
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT FLGUSAMODRESPON FROM PARAMGLOBAL WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));  //BRUNO AZEVEDO SOL 143430 KINTANA 929764
   qry.Open;
   if qry.FieldByName('FLGUSAMODRESPON').AsString = 'N'
   then bUsaModRespon := False
   else bUsaModRespon := True;
   tirasql(qry);
   qry.Free;

end;

procedure CadastraFundacao(qry : TwwQuery);
var sNomeEmpresa : string;
begin
   if Sistema.IdEmpresa <= 0
   then begin
      MsgDlg('Empresa Própria não cadastrada como Fundação. Utilize o Cadastro de Fundação.','Erro',mtError,[mbOk,mbHelp],0);
      tirasql(qry);
      Exit;
   end;
   if Trim(Sistema.NomeEmpresa) = ''
   then sNomeEmpresa := '[Nome da Fundação]'
   else sNomeEmpresa := Sistema.NomeEmpresa;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT F.IDPESSOA, P.NOME FROM FUNDACAO F, PESSOA P '+
               ' WHERE P.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' AND '+
               '       P.IDPESSOA = F.IDPESSOA(+)' );
   qry.Open;
   if (qry.IsEmpty) or  (qry.FieldByName('IdPessoa').AsString = '')
   then begin // Empresa nao cadastrada como fundacao
      try
         if qry.IsEmpty // empresa nao existe em pessoa
         then begin
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add(' INSERT INTO PESSOA(IDPESSOA,NOME,TIPO,RAZAOSOCIAL)'+
                        ' VALUES ('+IntToStr(Sistema.IdEmpresa)+','''+sNomeEmpresa+''', ''J'','''+
                                      sNomeEmpresa+''')');
            qry.ExecSQL;
         end;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('INSERT INTO FUNDACAO(IDPESSOA,FLGTIPOPREVIDENC) VALUES('+IntToStr(Sistema.IdEmpresa)+', ''F'')');
         qry.ExecSQL;
         qry.Close;
      except
         MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
      end;
   end;
   iIdFundacao := Sistema.IdEmpresa;
end;

function CalcIdade(dDataNasc : TDateTime) : integer;
begin
 if Trim(DateToStr(dDataNasc)) = ''
 then Result := 0
 else Result := Trunc((date - dDataNasc) / 365);
end;

{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
    cAux    : char;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;
   
   Result := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      cAux := DecimalSeparator;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      try
         If (Sistema.NomeUsuario = 'AUGUSTO.CM') Then Begin
           //Henrique Massão
           //regraAPrev.QueryIn.SQL.SaveToFile('C:\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');
           regraAPrev.QueryIn.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');

           regraAPrev.FlgReloadRule := True;
         End;

         { Tratamento de Erros }
         Try
           regraAPrev.Execute;
         Except
           bErro     := True;
           qryRegra.Close;
         End;
         

      finally
         DecimalSeparator := cAux;
      end;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro     := True;
      qryRegra.Close;
   end;
end;

function RegraBooleanaPasso(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;

   Result := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      regraAPrev.PassoAPasso;
      if not regraAPrev.Error       
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro     := True;
      qryRegra.Close;
   end;
end;


function RegraNumerica(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt;
                       psMostraMsg : Boolean = True; limpaRegra : Boolean = False) : string; // Thiago Melo SOL 210200 Kintana 2027146
var cAux : char;
begin
   Result := '0';
   bErro := False;

   // Thiago Melo SOL 210200 Kintana 2027146
   if limpaRegra then begin
     dtmAPrev.regraAPrev.LimpaVariaveis;
   end;
   // Thiago Melo SOL 210200 Kintana 2027146


   // Thiago Melo SOL 136384/14423 Kintana 1999179
   // dtmAPrev.regraAPrev.LimpaVariaveis; // Thiago Melo SOL 210200 Kintana 2027146
   // Thiago Melo SOL 136384/14423 Kintana 1999179

   // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
   // erro se o idcalculo for menor que zero
   if piIdCalculo < 0 then piIdCalculo := 0;
   if Trim(sNumRegra) = '' then Exit;

   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         bErro  := False;
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      cAux                      := DecimalSeparator;
      regraAPrev.QueryIn        := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo      := piIdCalculo;
      regraAPrev.ExibeMensagens := psMostraMsg; 
      try
         If (Sistema.NomeUsuario = 'AUGUSTO.CM') Then Begin
           //Henrique Massão
           //regraAPrev.QueryIn.SQL.SaveToFile('C:\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');
           regraAPrev.QueryIn.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');

           regraAPrev.FlgReloadRule := True;
         End;

         { Tratamento de Erros }
         Try
           regraAPrev.Execute;
         Except
           bErro     := True;
           qryRegra.Close;
         End;
         

      finally
         DecimalSeparator := cAux;
         
      end;

      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;

         // Verificar se o resultado da regra é um número válido
         //BRUNO AZEVEDO AJUSTE REGRA SOL 146950
         try
            StrToFloat(ClienteNumero(RegraAPrev.Result));
            Result := OraNumero(regraAPrev.Result);
         except
           Result := '0';

           //If psMostraMsg
           //  Then MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
           //              '[VALOR = '+RegraAPrev.Result+']','Erro',mtError,[mbOk, mbHelp],0);

           // bErro := True;
           // piIdCalculo := -1;}
         end;

         //Result := OraNumero(regraAPrev.Result);
      end // if not regra.error
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;

      qryRegra.Close;
   end;
end;


function RegraString(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var
  cAux : char;
begin
  Result := '0';
  bErro  := False;

  
  // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
  // erro se o idcalculo for menor que zero
  if piIdCalculo < 0 then piIdCalculo := 0;
  if Trim(sNumRegra) = '' then Exit;

  with dtmAPrev do begin
    regraAPrev.RuleName := sNumRegra;
    qryRegra.Close;
    qryRegra.SQL.Clear;
    qryRegra.SQl.Add(sSQL);
    qryRegra.Open;
    // Se a query estiver vazia, passar uma query generica pois talvez
    // a regra nao precise de nenhum campo da query, mas precisa de uma
    // linha qualquer.
    if qryRegra.IsEmpty then begin
      Result := '';
      bErro  := False;
      qryRegra.Close;
      tirasql(qryregra);
      Exit;
    end;

    cAux                 := DecimalSeparator;
    regraAPrev.QueryIn   := dtmAPrev.qryRegra;
    regraAPrev.IdCalculo := piIdCalculo;
    try
      If (Sistema.NomeUsuario = 'AUGUSTO.CM') Then Begin
        //Henrique Massão
           //regraAPrev.QueryIn.SQL.SaveToFile('C:\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');
           regraAPrev.QueryIn.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');

        regraAPrev.FlgReloadRule := True;
      End;

      
      Try
        regraAPrev.Execute;
      Except
        bErro     := True;
        qryRegra.Close;
      End;
      

    finally
      DecimalSeparator := cAux;
      
    end;

    if not regraAPrev.Error then begin
      piIdCalculo := regraAPrev.IdCalculo;
      Result := regraAPrev.Result;
    end else begin
      bErro := True;
      piIdCalculo := -1;
    end;

    qryRegra.Close;
  end;
  
end;



function RegraNumericaPasso(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
begin
   Result := '';
   bErro := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         bErro  := False;
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      regraAPrev.QueryIn   := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := piIdCalculo;
      regraAPrev.PassoAPasso;
      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;
         Result := OraNumero(regraAPrev.Result);
      end // if not regra.error
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;
      qryRegra.Close;
   end;
end;

{ Rotinas para tratar meses e anos }
function ProximoAnoMes(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13)
  then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//ProximoAnoMes

function AnoMesAnterior(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sAnoMes := IntToStr(iAno-1)+'/';
     sAnoMes := sAnoMes+'12';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes - 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//AnoMesAnterior

function MesAnoAnterior(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sMesAno := '12/'+IntToStr(iAno-1);
  end
  else begin
    iMes := iMes - 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//MesAnoAnterior


function ProximoMesAno(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13) 
  then begin
     sMesAno := '01/'+IntToStr(iAno+1);
  end
  else begin
    iMes := iMes + 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//ProximoMesAno

function PegaidCheck(chklst : TCheckListBox;chave,nome: string ; var qryaux : TwwQuery ):String;
var marcado,i : integer;
    Volta : String;
begin
   marcado := 0;

   for i := 0 to chklst.Items.Count - 1 do
   begin
         if not chklst.checked[i] then
         continue
         else inc(marcado);
   end;

   Volta := '';
   if marcado = 0 then
   begin
      Result := '';
      Exit;
   end;

   for i := 0 to chklst.Items.Count - 1 do
   begin
      if (not chklst.checked[i]) and ( marcado <> 0) then continue;
      if not  qryaux.Locate(''+Nome+'',chklst.items[i],[]) then
      begin
         continue;
      end
      else
      begin
         Volta := qryaux.fieldbyname(''+chave+'').AsString + ',';
      end;
   end;

   Volta := Copy(Volta,Length(Volta) - 1 ,1);
   Result := Volta;
end;//PegaIdCheck


{ Rotina para tratar Dia Útil (Calendario) }
function CriticaDataCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass ,
                                   sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sDia, sMesAno, sData, sDiaUtil: string;
  dData: double;
begin
  Result := '';

 {Filtra DATASPATROPLANO}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('As datas de cobrança não estão devidamente cadastradas.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}


 {Verifica Data Cobrança Normal}
  if sTipoData = 'N' then //Normal
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBNORMAL').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBNORMAL').AsString
          else
             sDia := qry.FieldByName('DIACOBNORMAL').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

         
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Normal}
          if qry.FieldByName('FLGUTILNORMAL').AsString = 'N' then // ex: se DIACOBNORMAL = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         {Fim - Dia Normal}
          else //FLGUTILNORMAL = U
         {Dia Útil}
             begin // ex: se DIACOBNORMAL = 5, pega 5° Dia Útil do mes}
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança Normal}



 {Verifica Data Cobrança em Atraso}
  if sTipoData = 'A' then //Atraso
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBATRASO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBATRASO').AsString
          else
             sDia := qry.FieldByName('DIACOBATRASO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

         
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Atraso}
          if qry.FieldByName('FLGUTILATRASO').AsString = 'N' then // ex: se DIACOBATRASO = 5, pega Dia 5
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         {Fim - Dia Atraso}
          else //FLGUTILATRASO = U
         {Dia Útil}
             begin // ex: se DIACOBATRASO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança em Atraso}



 {Verifica Data de Devolução}
  if sTipoData = 'D' then //Devolução
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBDEVOLUCAO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBDEVOLUCAO').AsString
          else
             sDia := qry.FieldByName('DIACOBDEVOLUCAO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

         
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Devolucao}
          if qry.FieldByName('FLGUTILDEVOLUCAO').AsString = 'N' then //ex: se DIACOBDEVOLUCAO = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         {Fim - Dia Devolucao}
          else //FLGUTILDEVOLUCAO = U
         {Dia Útil}
             begin //ex: se DIACOBDEVOLUCAO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data de Devolução}

  Result := sData;
end;


function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sAnoMes : string;
begin
  Result := '';

 {Filtra DATASPATROPLANASS}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + '';


  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;

          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}

          {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sAnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else  if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
             sAnoMes := sAnoReferencia + '/' +sMesReferencia
          else
             sAnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

  Result := sAnoMes;


end;

{ Rotina que retorna o 'N' Dia Útil do mes }
function DiaUtil(sDiaUtil, sMesAno: string): string;
var
  iDia,              // guarda o dia util
  iDiaUtil,
  iUltDiaMes : integer; // controla o dia util
  dData      : double;
begin
  Result     := '';
  iDia       := 1;
  iDiaUtil   := 0;
  iUltDiaMes := TrazUltDiaMes(StrToInt(Copy(sMesAno,1,2)), StrToInt(Copy(sMesAno,4,4)) );

  while (StrToInt(sDiaUtil) <> iDiaUtil) and
        (iDia <= iUltDiaMes) do
  begin
     if Length(IntToStr(iDia)) = 1
     then dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
     else dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);

     if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7)
     then iDiaUtil := iDiaUtil + 1;// Se Dia da Semana nao for Domingo nem Sabado

     iDia := iDia + 1;
  end;

  Result := IntToStr(iDia - 1);
end;//DiaUtil

function CriticaDataCobrancaSit(qry : TwwQuery;
  sIdPessJur, sIdPlanoPrev, sSitFundacao: string;
  sTipoData: char;
  sMesReferencia, sAnoReferencia: string;
  bIndividual: boolean = false 
  ) : string;
var
  sSql, sAux,
  sTabela,
  sFiltro,
  sAnoMesCiclo,
  sData           : string;
  iIdModulo       : longint;
  bEncontrouCicloAberto,
  bCicloEncerrado : boolean;
  cTipoEnvPrev    : char;
  sMsg, sTipoCalendario: string; 
begin
  Result := '';
  // SINCRONISMO : Se o ciclo do mes/ano passados como parametros estiver encerrado,
  //               ir para o próximo.
  //               Esta função só poderá retornar uma data de um ciclo em aberto.

  bEncontrouCicloAberto := False;
  sAnoMesCiclo          := sAnoReferencia+'/'+sMesReferencia;
  while not bEncontrouCicloAberto do
  begin
     case sTipoData of
       'N' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobranca Normal
       'A' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobrança Atrasada
       'D' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM;// Pagamento de Devolução
       'P' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Beneficio
       'B' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Abono
       'T' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Beneficio
       'O' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Abono
     end;

     if sSitFundacao = 'PT'
     then bCicloEncerrado := False
     else bCicloEncerrado := VerificaFechamento( StrToInt(sIdPessJur),
                                                 iIdModulo,
                                                 sAnoMesCiclo,
                                                 'E' ,cTipoEnvPrev);
     if bCicloEncerrado
     then begin
        bEncontrouCicloAberto := False;
        sAnoMesCiclo := ProximoAnoMes(StrToInt(Copy(sAnoMesCiclo,6,2)), StrToInt(Copy(sAnoMesCiclo,1,4)));
     end
     else bEncontrouCicloAberto := True;
  end;

  sMesReferencia := Copy(sAnoMesCiclo,6,2);
  sAnoReferencia := Copy(sAnoMesCiclo,1,4);

  if sSitFundacao = 'MS' then sSitFundacao := 'AT';
  if sSitFundacao = 'CA' then sSitFundacao := 'AS';   //SIG21080

  if sMesReferencia = '13'
  then sMesReferencia := '12';

  if sSitFundacao = 'AS'
  then begin
         sTabela := 'FUNDACAO';
         sFiltro := ' AND (T.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ')'; 
         sAux := 'Fundação';
       end
  else begin
         sTabela := 'PLANPREVPATRO';
         sFiltro := ' AND (T.IDPESSJUR = ' + sIdPessJur + ')' +
                    ' AND (T.IDPLANOPREV = ' + sIdPlanoPrev + ')';
         sAux := 'Patrocinadora';
       end;

  sSQL := ' SELECT CD.IDCALENDARIO, CD.FLGINTERNO,      CD.ANOMESREF, '+
          ' TO_CHAR(CD.DATACOBNORMAL,''DD/MM/YYYY'') DATACOBNORMAL, '+
          ' TO_CHAR(CD.DATACOBATRASO,''DD/MM/YYYY'') DATACOBATRASO,'+
          ' TO_CHAR(CD.DATACOBDEVOLUCAO,''DD/MM/YYYY'') DATACOBDEVOLUCAO, '+
          ' TO_CHAR(CD.DATAPAGBENEF,''DD/MM/YYYY'') DATAPAGBENEF, '+
          ' TO_CHAR(CD.DATAPAGABONO,''DD/MM/YYYY'') DATAPAGABONO, '+
          ' TO_CHAR(CD.DATAPAGANTBENEF,''DD/MM/YYYY'') DATAPAGANTBENEF, '+
          ' TO_CHAR(CD.DATAPAGANTABONO,''DD/MM/YYYY'') DATAPAGANTABONO '+
         
          ' FROM   CALENDDATAS CD, ' + sTabela + ' T' +
          ' WHERE  (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
          ' AND    (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
          sFiltro +
          ' AND    (T.IDCALENDARIO = CD.IDCALENDARIO)';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if sSitFundacao = 'AT' then
    sTipoCalendario:='Ativo'
  else
  if sSitFundacao = 'AS' then
    sTipoCalendario:='Assistido'
  else
  if sSitFundacao = 'MA' then
    sTipoCalendario:='Mantido'
  else
  if sSitFundacao = 'MP' then
    sTipoCalendario:='Mantido Parcial'
  else
  if sSitFundacao = 'PT' then
    sTipoCalendario:='Patrocinadora';

  if qry.IsEmpty
  then begin
     sMsg:='O sistema não encontrou calendário/data cadastrada '+
       'referente a '+sTipoCalendario+' '+
       'para o mês '+sMesReferencia+'/'+sAnoReferencia+'.'+#13#10+#13#10+
       'Verifique o Cadastro de Calendário.'+#13#10+#13#10;
     if bIndividual then
       sMsg:=sMsg+
         'Isto pode ser devido a situação incorreta da pessoa processada, que deve ser verificada.';
     MsgDlg(sMsg, 'Informação',mtInformation,[mbOk],0);
     qry.Close;
     Exit;
  end;

  // Verifica Tipo de Cobrança
  case sTipoData of
    'N' : sData := qry.FieldByName('DATACOBNORMAL').AsString;    // Cobrança Normal
    'A' : sData := qry.FieldByName('DATACOBATRASO').AsString;    // Cobrança Atrasada
    'D' : sData := qry.FieldByName('DATACOBDEVOLUCAO').AsString; // Pagamento de Devolução
    'P' : sData := qry.FieldByName('DATAPAGBENEF').AsString;     // Pagamento de Beneficio
    'B' : sData := qry.FieldByName('DATAPAGABONO').AsString;     //  Pagamento de Abono
    'T' : sData := qry.FieldByName('DATAPAGANTBENEF').AsString;  // Pagamento de Antecipacao de Beneficio
    'O' : sData := qry.FieldByName('DATAPAGANTABONO').AsString;  // Pagamento de Antecipacao de Abono
  end;
 Result := sData;
end;//CriticaDataCobrancaSit

function VoltaMesCob(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sMesAno : string;
begin
  Result := '';

 {Filtra DATASPATROPLANO}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}


         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else
             sMesAno := sMesReferencia + '/' + sAnoReferencia;
         {Fim - Mês Posterior}

          Result := sMesAno;

end;

procedure TiraQuery(qryAux : TwwQuery);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT 1 FROM DUAL');
   qryAux.Open;
end;

function SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;


procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;  iTipoInf : integer;
                     var sValor1 : string );
begin
   If frmPedeInfAux = Nil Then
     Application.CreateForm(TfrmPedeInfAux, frmPedeInfAux);

   with frmPedeInfAux do
   begin
      Caption := sCaptionForm;
      lblTitulo1.Caption := sTituloInf1;
      if Trim(sMascInf1) <> ''
      then edInf1.EditMask := sMascInf1+ ';0;_'
      else edInf1.EditMask := '';
      if iTipoInf = 1
      then begin
         edInf1.Visible := True;
         dtData.Visible := False;
      end
      else begin
         edInf1.Visible := False;
         dtData.Visible := True;
      end;
      ShowModal;
      if iTipoInf = 1
      then sValor1 := edInf1.Text
      else sValor1 := dtData.Text;
   end;
end; //PedeInfAux

function ProcSituacao(sCodSituacao : string) : string;
begin
   Result := '';
   if sCodSituacao = 'AT'
   then Result := 'Ativo'
   else if sCodSituacao = 'AS'
        then Result := 'Assistido'
        else if sCodSituacao = 'MA'
             then Result := 'Mantido'
             else if sCodSituacao = 'MP'
                  then Result := 'Mantido Parcial'
                  else if sCodSituacao = 'MS'
                       then Result := 'Mantido de Saldo de Conta'
                       else Result := 'Patrocinadora';
end;

function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;
var 
    D1,M1,A1,                {1234567890}
    D2,M2,A2:Integer;        {dd/mm/aaaa}
    TD1,TD2 :LongInt;

begin
   Result := False;
   try
     StrToDate(sData1);
   except
     Exit;
   end;


   try
     StrToDate(sData2); 
   except
     Exit;
   end;

   D1 := StrInt(copy(sData1,1,2));
   M1 := StrInt(copy(sData1,4,2));
   A1 := StrInt(copy(sData1,7,4));
   D2 := StrInt(copy(sData2,1,2));
   M2 := StrInt(copy(sData2,4,2));
   A2 := StrInt(copy(sData2,7,4));
   TD1 := (D1+TotDiasNoAno(M1,A1)+Trunc(365.25*(A1-1)));
   TD2 := (D2+TotDiasNoAno(M2,A2)+Trunc(365.25*(A2-1)));
   NumDias  := TD2-TD1;
   NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
   NumAnos  := Trunc(NumDias/365.25);
   Result := True;
end;


function  CalculaDataAposPrazo(psDataInicio : string; piPrazoEmMeses : integer) : string;
var iMesesASomar,
    iMes,
    iAno,
    iMesInicio : integer;
    sDataFinal : string;
begin
    Result := Trim(psDataInicio);
    if Trim(psDataInicio) = '' then Exit;

    iMesInicio   := StrToInt(Copy(psDataInicio,4,2));

    // Soma prazo ao mes
    iMesesASomar := piPrazoEmMeses;
    iMes := iMesInicio + piPrazoEmMeses;
    iAno := StrToInt(Copy(psDataInicio,7,4));

    if iMes > 12
    then begin
       iMesesASomar := iMesesASomar - ( 12 - iMesInicio);
       iMes := 1;
       inc(iAno);
       while iMesesASomar > 0 do
       begin
         iMes := iMes + iMesesASomar - 1;
         if iMes > 12
         then begin
            iMes := 1;
            inc(iAno);
            iMesesASomar := iMesesASomar -  12;
         end
         else if iMes < 12
              then iMesesASomar := iMesesASomar - ( 12 - iMes)
              else iMesesASomar := iMesesASomar - 12;
       end;
    end;

    sDataFinal := Copy(psDataInicio,1,2);
    if iMes <= 9
    then sDataFinal := sDataFinal + '/0'+IntToStr(iMes)
    else sDataFinal := sDataFinal + '/'+IntToStr(iMes);
    sDataFinal := sDataFinal + '/'+IntToStr(iAno);
    Result := sDataFinal;
end; // CalculaDataAposPrazo

function ValorProRataUltimo(psValorIntegral, psDataRefFinal : string) : double;
var dValorDiario,
    dValorSalario  : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefFinal) = '' then Exit;

   // Do inicio do mes até o dia informado
   iNumDiasProRata := StrToInt(Copy(psDataRefFinal,1,2));
   if iNumDiasProRata >= 30
   then iNumDiasProRata := 30;

   iMes := StrToInt(Copy(psDataRefFinal,4,2));
   iAno := StrToInt(Copy(psDataRefFinal,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;
var dValorDiario,
    dValorSalario   : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefInicio) = '' then Exit;
   // Do dia informado até o final do mes (mes comercial), considerando o dia informado
   iNumDiasProRata := 30 - StrToInt(Copy(psDataRefInicio,1,2));
   iNumDiasProRata := iNumDiasProRata + 1;     
   iMes := StrToInt(Copy(psDataRefInicio,4,2));
   iAno := StrToInt(Copy(psDataRefInicio,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes  := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function ValorProRataMes(psValorIntegral, psAnoMesRef, psDataRefInicio, psDataRefFinal : string) : double;
var dValorDiario,
    dValorSalario  : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefFinal)  = '' then Exit;
   if Trim(psDataRefInicio) = '' then Exit;

   if Copy(psDataRefInicio,7,4)+'/'+Copy(psDataRefInicio,4,2) < psAnoMesRef
   then psDataRefInicio := '01/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);

   if Copy(psDataRefFinal,7,4)+'/'+Copy(psDataRefFinal,4,2) > psAnoMesRef
   then if Copy(psAnoMesRef,6,2) = '02'
        then psDataRefFinal := '28/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4)
        else psDataRefFinal := '30/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);

   // Do inicio do mes até o dia informado
   iNumDiasProRata := Trunc(StrToDate(psDataRefFinal) - StrToDate(psDataRefInicio) + 1);
    
   if iNumDiasProRata >= 30
   then iNumDiasProRata := 30;

   iMes := StrToInt(Copy(psAnoMesRef,6,2));
   iAno := StrToInt(Copy(psAnoMesRef,1,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes := 30; // mes comercial
   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function FormaAnoMesTela( pCmbMes : TComboBox; pSpAno : TSpinEdit) : string;
var sAno,
    sMes    : string;
    sAnoMes : string;
begin
    Result := '';
    sAno   := Trim(pSpAno.Text);
    if pCmbMes.ItemIndex <= 8
    then sMes := '0'+IntToStr(pCmbMes.ItemIndex+1)
    else sMes := IntToStr(pCmbMes.ItemIndex+1);
    sAnoMes   := sAno+'/'+sMes;
    Result    := sAnoMes;
end; // FormaAnoMesTela

function RetornaFlagEvento(sDescEvento : string) : string;
var sFlgInternoEvento : string;
begin
   Result := '';
   sFlgInternoEvento := '';
   if (sDescEvento) = 'Demissão com Cancelamento'
   then sFlgInternoEvento := 'DC'
   else if (sDescEvento) = 'Demissão da Patrocinadora'
   then sFlgInternoEvento := 'DP'
   else if (sDescEvento) = 'Demissão com Manutenção de Contribuição'
   then sFlgInternoEvento := 'DM'
   else if (sDescEvento) = 'Demissão com Manutenção de Saldo de Conta'
   then sFlgInternoEvento := 'DS'
   else if (sDescEvento) = 'Manutenção Parcial'
   then sFlgInternoEvento := 'MP'
   else if (sDescEvento) = 'Afastamento'
   then sFlgInternoEvento := 'AF'
   else if (sDescEvento) = 'Tempo de Serviço'
   then sFlgInternoEvento := 'TS'
   else if (sDescEvento) = 'Idade'
   then sFlgInternoEvento := 'ID'
   else if (sDescEvento) = 'Incapacidade'
   then sFlgInternoEvento := 'IN'
   else if (sDescEvento) = 'Doença'
   then sFlgInternoEvento := 'DO'
   else if (sDescEvento) = 'Acidente'
   then sFlgInternoEvento := 'AC'
   else if (sDescEvento) = 'Outros Eventos Temporários'
   then sFlgInternoEvento := 'OE'
   else if (sDescEvento) = 'Cancelamento por Iniciativa do Participante'
   then sFlgInternoEvento := 'CP'
   else if (sDescEvento) = 'Cancelamento por Inadimplência'
   then sFlgInternoEvento := 'CI'
   else if (sDescEvento) = 'Registro de Inadimplência'
   then sFlgInternoEvento := 'RI'
   else if (sDescEvento) = 'Falecimento'
   then sFlgInternoEvento := 'FL'
   else if (sDescEvento) = 'Função de Risco'
   then sFlgInternoEvento := 'FR'
   else if (sDescEvento) = 'Encerramento de Benefício'
   then sFlgInternoEvento := 'EB'
   else if (sDescEvento) = 'Resgate a Pedido'
   then sFlgInternoEvento := 'RP'
   else if (sDescEvento) = 'Transferência de Reserva'
   then sFlgInternoEvento := 'TR'
   else if (sDescEvento) = 'Transferência de Plano'
   then sFlgInternoEvento := 'TP'
   else if (sDescEvento) = 'Mudança de Perfil'
   then sFlgInternoEvento := 'MU'
   else if (sDescEvento) = 'Retorno de Mantido Para Ativo'
   then sFlgInternoEvento := 'RA'
   else if (sDescEvento) = 'Inscrição do Participante'
   then sFlgInternoEvento := 'IP'
   else if (sDescEvento) = 'Reinscrição do Participante'
   then sFlgInternoEvento := 'RM'
   else if (sDescEvento) = 'Programa de Demissão Voluntária'
   then sFlgInternoEvento := 'PD'
   else if (sDescEvento) = 'Reclusao'
   then sFlgInternoEvento := 'RC';

   Result := sFlgInternoEvento;

end; // RetornaFlagEvento

function RetornaFlgIntSitPart (piIdSitPart : longint)  : string;
begin
   Result := '';
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+IntToStr(piIdSitPart));
      Open;
      if not IsEmpty
      then Result := FieldbyName('FlgInterno').AsString;
      Close;
   end;
end;

function BuscaCampoTabela ( psNomeCampo, psNomeTabela, psCondicao : string ) : string;
begin
   Result := '';
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT '+psNomeCampo+' FROM '+ psNomeTabela+' WHERE '+psCondicao );
      Open;
      if not IsEmpty
      then Result := FieldbyName(psNomeCampo).AsString;
      Close;
   end;
end;

function BuscaMesCobrancaLote ( piIdLote : longint; psAnoMesCobrancaDefault : string ) : string;
begin
   Result := psAnoMesCobrancaDefault;
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MESREFERENCIA FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(piIdLote) );
      Open;
      if not IsEmpty
      then Result := FieldbyName('MESREFERENCIA').AsString;
      Close;
   end;
end;

function PegaFlgIncluiMesConc(pidlote : integer) : integer;
begin
  Result:=1;
  try
    with dtmAPrev.qryAux2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FLGINCLUIMESCONC FROM CTRLINTERFACE WHERE IDLOTE = '+inttostr(pidlote));
      Open;
      if not IsEmpty then
        Result := Fields[0].asinteger;
      Close;
    end;
  except
    Result:=1;
  end;
end;

function PatroPermiteAlterarDados( piIdPessJur, piIdPessoa : longint ) : boolean ;
begin
   Result := True;
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FLGALTERADADOS FROM PATRO WHERE IDPESSOA = '+IntToStr(piIdPessJur));
      Open;
      if (IsEmpty) or (FieldbyName('FLGALTERADADOS').AsInteger = 1)
      then Exit;

      // Neste ponto o FLGALTERADADOS é igual a ZERO, ou seja, nao pode alterar dados de
      // ATIVOS e MANTIDOS PARCIAIS

      // Agora o sistema deve verificar se a pessoa é ATIVA ou MANTIDA PARCIAL
      Close;
      SQL.Clear;
      SQL.Add(' SELECT SP.FLGINTERNO '+
              ' FROM   PARTPREVPLAN PP, SITPART SP '+
              ' WHERE  PP.IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    PP.IDPESSOA      = '+IntToStr(piIdPessoa)+
              ' AND    PP.FLGDESATIVADO = 0 '+
              ' AND    SP.IDSITPART     = PP.IDSITPART ');
      Open;
      if  IsEmpty // a pessoa é só elegível
      then Result := False
      else if (FieldByName('FLGINTERNO').AsString = 'AT') or (FieldByName('FLGINTERNO').AsString = 'MP')
           then Result := False
           else Result := True;
      Close;
   end
end;


function ValidaNumProcesso(num: string): boolean;
var
 n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
 d1,d2: integer;
 digitado, calculado: string;
begin

 if length(num) < 10 then
 begin
   ValidaNumProcesso:=false;
   exit;
 end;

 n1:=StrToInt(num[1]);
 n2:=StrToInt(num[2]);
 n3:=StrToInt(num[3]);
 n4:=StrToInt(num[4]);
 n5:=StrToInt(num[5]);
 n6:=StrToInt(num[6]);
 n7:=StrToInt(num[7]);
 n8:=StrToInt(num[8]);
 n9:=StrToInt(num[9]);


 d1:=n9*9+n8*8+n7*7+n6*6+n5*5+n4*4+n3*3+n2*2+n1*9;
 d1:= (d1 mod 11);
 if d1>=10 then d1:=0;

 calculado:=inttostr(d1); 
 digitado:=num[10]; 

 if calculado=digitado then
   ValidaNumProcesso:=true
 else
   ValidaNumProcesso:=false;

end;

{------------------------------------------------------------------------------}
{ Retorna o Proximo ANO/MES, tratando o 13º (mes 12 p/ 13 p/ 01 do próximo ano)}
function ProximoAnoMes13(iMes, iAno : integer) : string;
var
  sAnoMes : string;
begin
  Result := '';
  
  if (iMes = 13) then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9 then
      sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else
      sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end; { ProximoAnoMes13 }


function PreparaStrRegra( str : string ) : string;
begin
   if Trim(str) = ''
   then Result := ' '
   else Result := str;
end;

procedure AtualizaNumeroDependentes(pIdTitular: Integer;
                                    sDataFolha: string;
                                    bcommit: boolean);
var ssql: string;
    bContaIR                                          : Boolean;
    bContaSF                                          : Boolean;
    sDependencia,sDataInicio,sDataFim                 : String;
    sDataInicioInvalidez,sDataFimInvalidez            : String;
    sDataNasc, sDataQuatorze, sDataVinteeUm           : String;
    sDataVinteeQuatro, sMatricula                     : String;
    sDataInicioSF,sDataFimSF                          : String;
    NumDias, NumAnos, NumDiasQuatorze,NumDiasVinteeUm : Extended;
    NumDiasVinteeQuatro                               : Extended;
    nTotalDepSF, nTotalDepIR                          : Integer;
    qryDependente, qryUpd, qryAux: twwquery;

   procedure VerificadependenteIR;
   begin
     bContaIR        := false;
     NumDiasVinteeUm := 0;
     If sdataInicio <> '' then
       If strtodate(sDataInicio) <= strtodate(sDataFolha) then
       begin
         // IRMAO , NETO  OU BISNETO DE QUEM O CONTRIBUINTE DETENHA A GUARDA JUDICIAL
         If ((sDependencia = 'IRM') or (sDependencia = 'NET') or (sDependencia = 'BIS')) then
         begin
           // DETEM A GUARDA JUDICIAL
           If (qryDependente.FieldByName('CODTIPORECEBEDOR').AsString <> '') then
             // INCAPACITADO FISICA OU MENTALMENTE
             If sdataInicioInvalidez <> '' then
             begin
               If (sDataFimInvalidez <> '') then
               begin
                 If ((strtodate(sdataInicioInvalidez) < strtodate(sDataFolha)) and
                     (strtodate(sDataFimInvalidez) > strtodate(sdataFolha))) then
                   bcontaIR := true
                 else
                   bContaIR := false;
               end
               else
               begin
                 //  NORMAL ATE 21 ANOS
                 NumDiasVinteeUm := (21 * 365.25);
                 sDataVinteeUm   := formatdatetime('DD/MM/YYYY',(qryDependente.FieldByName('DATANASC').AsDateTime + NumDiasVinteeUm));
                 sDataFim        := sDataVinteeUm;
                 NumDias         := (StrToDate(sDataFolha)-strToDate(sDataNasc));
                 NumAnos         := Trunc(Numdias/365.25);
                 If Numanos  <= 21  then
                   bContaIR := true
                 else
                   bContaIR := false;
               end;
             end;
         end;
         // COMPANHEIRO ,CONJUGE , PAI e MAE
         If ((sDependencia = 'COP') or (sDependencia = 'COM') or (sDependencia = 'PAI')) then
         begin
           If (strtodate(sDataInicio) <= strtodate(sDataFolha)) then
           begin
             If sDataFim <> '' then
             begin
               If (strtodate(sDataFim) >= strtodate(sDataFolha)) then
                 bContaIR := true
               else
                 bContaIR := false
             end
             else
               bContaIR := true
           end
           else
             bcontaIR := false;
         end;
         // FILHO OU ENTEADO
         If ((sDependencia = 'FIL') or (sDependencia = 'ENT')) then
         begin
           If sdatafim <> '' then
           begin
             If strtodate(sdatafim) >= strtodate(sDataFolha) then
               bcontaIR := true
             else
               bcontair := false
           end
           else
           begin
             //  NORMAL ATE 21 ANOS
             NumDiasVinteeUm := (21 * 365.25);
             sDataVinteeUm   := formatdatetime('DD/MM/YYYY',(qryDependente.FieldByName('DATANASC').AsDateTime + NumDiasVinteeUm));
             sDataFim        := sDataVinteeUm;
             NumDias         := (StrToDate(sDataFolha)-strToDate(sDataNasc));
             NumAnos         := Trunc(Numdias/365.25);
             If Numanos  <= 21  then
               bContaIR := true
             else
               bContaIR := false;
           end;

           // UNIVERSITARIO
           If (prmIDGRINSTR = qryDependente.FieldByName('IDGRINSTR').AsInteger) then
           begin
             NumDiasVinteeQuatro := (24 * 365.25);
             sDataVinteeQuatro := formatdatetime('DD/MM/YYYY',(qryDependente.FieldByName('DATANASC').AsDateTime + NumDiasVinteeQuatro));
             sDataFim := sDataVinteeQuatro;
             NumDias := (StrToDate(sDataFolha)-strToDate(sDataNasc));
             NumAnos := Trunc(Numdias/365.25);
             If Numanos  <= 24  then
               bContaIR := true
             else
               bContaIR := false;
           end
           else
           begin
             // INCAPACITADO FISICA OU MENTALMENTE
             If (sDataFimInvalidez <> '') then
             begin
               If ((strtodate(sdataInicioInvalidez) < strtodate(sDataFolha) ) and ((strtodate(sDataFimInvalidez) > strtodate(sdataFolha)))) then
                 bcontaIR := true
               else
                 bContaIR := false;
             end;
           end;
         end;
       end;
   end;
   //Fim - VerificadependenteIR;

   procedure VerificadependenteSF;
   begin
     bContaSF        := false;
     NumDiasQuatorze := 0;
     If sdataInicioSF = '' then
       sDataInicioSF := datetostr(strtodate(sdataFolha)+1);
     If sdataInicioInvalidez = '' then
       sDataInicioInvalidez := datetostr(strtodate(sdataFolha)+1);
     If strtodate(sDataInicioSF) <= strtodate(sDataFolha) then
     begin
       // FILHO OU ENTEADO
       If ((sDependencia = 'FIL') or (sDependencia = 'ENT')) then
       begin
         // INCAPACITADO FISICA OU MENTALMENTE
         If (sDataFimInvalidez <> '') then
         begin
           If ((strtodate(sdataInicioInvalidez) < strtodate(sDataFolha) ) and
              ((strtodate(sDataFimInvalidez) > strtodate(sdataFolha)) )) then
             bcontaSF := true
           else
             bContaSF := false;
         end
         else
         begin
           //  NORMAL ATE 14 ANOS
           NumDiasQuatorze := (14 * 365.25);
           sDataQuatorze   := formatdatetime('DD/MM/YYYY',(qryDependente.FieldByName('DATANASC').AsDateTime + NumDiasQuatorze));
           sDataFimSF      := sDataQuatorze;
           NumDias := (StrToDate(sDataFolha)-strToDate(sDataNasc));
           NumAnos := Trunc(Numdias/365.25);
           If Numanos  <= 14  then
             bContaSF := true
           else
             bContaSF := false;
         end;
       end;
     end;
   end;

   procedure AtualizaDependente;
   begin
     If bcontaIR then
       nTotalDepIR := nTotalDepIR + 1
     else
       if nTotalDepIR > 0 then
         nTotalDepIR := nTotalDepIR - 1;

     If bcontaSF then
       nTotalDepSF := nTotalDepSF + 1
     else
       if nTotalDepSF > 0 then
         nTotalDepSF := nTotalDepSF - 1;

     if bcommit then
       if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

     ssql:='UPDATE DEPENTIT '+
           'SET FLGCONTAIMPOSTOR = ';
     If bcontaIR then
       ssql:=ssql+'1,'
     else
       ssql:=ssql+'0,';

     ssql:=ssql+'FLGCONTASALARIOF = ';
     If bContaSF then
       ssql:=ssql+'1,'
     else
       ssql:=ssql+'0,';

     ssql:=ssql+'FIMIMPOSTOR = ';
     If (sDataFim <> '') then
       ssql:=ssql+'TO_DATE('+QuotedStr(sDataFim)+',''DD/MM/YYYY''),'
     else
       ssql:=ssql+'NULL,';

     ssql:=ssql+'FIMSALARIOF = ';
     If (sDataFimSF <> '') then
       ssql:=ssql+'TO_DATE('+QuotedStr(sDataFimSF)+',''DD/MM/YYYY'') '
     else
       ssql:=ssql+'NULL ';

     ssql:=ssql+'WHERE IDTITULAR = '+inttostr(pIdTitular)+' '+
       'AND IDPESSOA = '+inttostr(qryDependente.FieldByName('IDPESSOA').AsInteger);

     if ExecutarQuery(qryUpd, ssql) then
       if bcommit then
         dtmBaseDados.dbBaseDados.commit;
   end;

   procedure AtualizaTitular;
   begin
     if bcommit then
       if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

     ssql:='SELECT SUM(FLGCONTAIMPOSTOR) AS FLGCONTAIMPOSTOR, '+
                  'SUM(FLGCONTASALARIOF) AS FLGCONTASALARIOF '+
           'FROM DEPENTIT WHERE IDTITULAR = '+inttostr(pIdTitular);

     if FazQuery(qryAux, ssql) then
     begin
       ssql:='UPDATE PESSOAFISICA SET NUMDEPIRRF = '+
         inttostr(qryAux.fieldbyname('FLGCONTAIMPOSTOR').asInteger)+','+
         'NUMDEPSALF = '+
         inttostr(qryAux.fieldbyname('FLGCONTASALARIOF').asInteger)+','+
         'NUMDEPTOT = '+
         inttostr(qryAux.fieldbyname('FLGCONTAIMPOSTOR').asInteger+
                  qryAux.fieldbyname('FLGCONTASALARIOF').asInteger)+
         ' WHERE IDPESSOA = '+inttostr(pIdTitular);

       if ExecutarQuery(qryUpd, ssql) then
       begin
         if bcommit then
           dtmBaseDados.dbBaseDados.commit;
       end;
     end;
   end;

begin
  qryDependente:=twwquery.create(application);
  qryUpd:=twwquery.create(application);
  qryaux:=twwquery.create(application);
  qryDependente.databasename:='Basedados';
  qryUpd.databasename:='Basedados';
  qryaux.databasename:='Basedados';

  try
    ssql:='SELECT DISTINCT P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, '+
                 'D.IDTITULAR, DP.DESCRICAO AS TIPODEPENDENCIA, D.NUMSEQUENCIA, '+
                 'D.FLGCONTAIMPOSTOR, D.FLGCONTASALARIOF, '+
                 'DECODE(BF.IDPESSOA, NULL, 0, 1 ) AS FLGBENEFICIARIO, '+
                 'DECODE(PF.ESTCIVIL, ''S'', ''Solteiro'', '+
                             '''C'', ''Casado(a) ou Equiparado(a)'', '+
                             '''D'', ''Divorciado(a)'', '+
                             '''E'', ''Desquitado(a)'', '+
                             '''J'', ''Separado(a) Judicial'', '+
                             '''V'', ''Viúvo(a)'', '+
                             '''M'', ''Marital'', '+
                             '''P'', ''Separado(a)'', '+
                             '''O'', ''Outros'') AS DESCESTCIVIL, '+
                 'D.FLGDESIGNADO, D.FLGDEPLEGAL, D.IDDEPENDENCIA, D.MATRICULA, '+
                 'NVL(D.INICIOIMPOSTOR,NULL) INICIOIMPOSTOR, D.FIMIMPOSTOR, '+
                 'NVL(D.INICIOSALARIOF,NULL) INICIOSALARIOF, D.FIMSALARIOF, '+
                 'PF.DATANASC, PF.DATAMORTE, PF.NOMEPAI, PF.NOMEMAE, PF.SEXO, '+
                 'PF.FLGMOLESTIAGRAVE, PF.DATAMOLESTIAGRAVE , PF.FLGISENTOIRRF, '+
                 'PF.INICIOINVALIDEZ, PF.FIMINVALIDEZ, '+
                 'NVL(BT.CODTIPORECEBEDOR,NULL) CODTIPORECEBEDOR, '+
                 'NVL(PF.IDGRINSTR,0) IDGRINSTR, '+
                 'SIT.DESCRICAO AS SITUACAODEPEN, '+
                 '0 AS FLGELEGIVEL, '+
                 'EG.MATRICULA AS MATRICULA_TITULAR '+
          'FROM BFCIARIOTITPLAN BT, PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, '+
               'ELEGPATRO EG,DEPEN DP, DEPENDENTE DEP, DEPENTIT D, '+
               '(SELECT DISTINCT IDTITULAR,IDPESSOA FROM BENEFBFCIARIO '+
                'WHERE IDTITULAR = '+inttostr(pIdTitular)+' '+
                'AND IDSITBENEFICIO IN (1,2,4)) BF '+
          'WHERE D.IDTITULAR = '+inttostr(pIdTitular)+' '+
          'AND D.IDDEPENDENCIA <> ''PRP'' '+
          'AND D.IDPESSOA = P.IDPESSOA '+
          'AND D.IDDEPENDENCIA = DP.IDDEPENDENCIA '+
          'AND BT.IDTITULAR = D.IDTITULAR '+
          'AND EG.IDPESSOA = D.IDTITULAR '+
          'AND BF.IDTITULAR(+) = D.IDTITULAR '+
          'AND BF.IDPESSOA(+) = D.IDPESSOA '+
          'AND PF.IDPESSOA = D.IDPESSOA '+
          'AND DEP.IDPESSOA    = D.IDPESSOA '+
          'AND DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+) '+
          'ORDER BY D.NUMSEQUENCIA ';

    if FazQuery(qryDependente, ssql) then
    begin
      nTotalDepSF := 0;
      nTotalDepIR := 0;
      sMatricula:=qryDependente.FieldByName('MATRICULA_TITULAR').asstring;
      while not qryDependente.eof do
      begin
        sDependencia:=qryDependente.fieldbyname('IDDEPENDENCIA').asstring;

        If qryDependente.FieldByName('INICIOSALARIOF').isnull then
          sDataInicioSF:=''
        else
          sDataInicioSF:=formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('INICIOSALARIOF').AsDateTime);

        If qryDependente.FieldByName('FIMSALARIOF').isnull then
          sDataFimSF:=''
        else
          sDataFimSF:=formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('FIMSALARIOF').AsDateTime);

        If qryDependente.FieldByName('INICIOIMPOSTOR').isnull then
          sDataInicio := ''
        else
          sDataInicio := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('INICIOIMPOSTOR').AsDateTime);

        If qryDependente.FieldByName('FIMIMPOSTOR').isnull then
          sDataFim := ''
        else
          sDataFim := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('FIMIMPOSTOR').AsDateTime);

        If qryDependente.FieldByName('INICIOINVALIDEZ').isnull then
          sDataInicioInvalidez :=  ''
        else
          sDataInicioInvalidez := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('INICIOINVALIDEZ').AsDateTime);

        If qryDependente.FieldByName('FIMINVALIDEZ').isnull then
          sDataFimInvalidez := ''
        else
          sDataFimInvalidez := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('FIMINVALIDEZ').AsDateTime);

        sDataNasc := formatdatetime('DD/MM/YYYY',qryDependente.FieldByName('DATANASC').AsDateTime);
        VerificaDependenteIR;
        VerificaDependenteSF;
        try
          AtualizaDependente;
        except
        end;

        qryDependente.next;
      end;
      AtualizaTitular;
    end;
  finally
    qryDependente.free;
    qryupd.free;
    qryaux.free;
  end;
end; // AtualizaNumeroDependentes



function PermiteAlteracaoPorExcecao( piIdPessJur : longint;
                                     pcTipo      : char     ) : boolean; // E = Evolucao Funcional
                                                                         // C = Historico de Contribuicao
begin
   Result := False;
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT NVL(FLGALTEVOLFUNC,0) FLGALTEVOLFUNC, ');
      SQL.Add('       NVL(FLGALTHSTCONT,0) FLGALTHSTCONT ');
      SQL.Add('FROM PATRO ');
      SQL.Add('WHERE  IDPESSOA = '+IntToStr(piIdPessJur) );
      Open;

      if pcTipo = 'E'
      then begin
         if FieldByName('FLGALTEVOLFUNC').AsInteger = 1
         then Result := True
         else Result := False;
      end
      else begin
         if FieldByName('FLGALTHSTCONT').AsInteger = 1
         then Result := True
         else Result := False;
      end;
      Close;
   end;
end;



function GravaLogTOTALPREV (psDescOperacao : String ): Boolean;
var
  iIdLogTotalPREV : longint;
begin
   Result := False;

   iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
   if Trim(psDescOperacao) = '' then psDescOperacao := 'Não Identificada';
   with dtmBaseDados.qry do
   begin
     Close;
     SQL.Clear;
     SQL.Text :=
     'INSERT INTO LOGTOTALPREV '                                  + #13 +
     '( '                                                         + #13 +
     'IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA '   + #13 +
     ') '                                                         + #13 +
     'VALUES '                                                    + #13 +
     '(' + IntToStr(iIdLogTotalPREV)                              + ', ' +
           IntToStr(Sistema.IdModulo)                             + ', ' +
           '''' + Copy(psDescOperacao, 1, 100)                    + ''', ' +
           IntToStr(Sistema.IdUsuario)                            + ', ' +
     ' SYSDATE '                                                  + #13 +
     ') ';

     try
        ExecSQL;
     except
        Exit;
     end;
   end;
   Result := True;
end;

// Denise 21/08/2008 Sol: 93841 Kintana: 403367
function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;


function RetornaIdTitular(idPessoa,
  idPLanoPrev: String;iNumprocesso : Integer = -1;
   iIdBeneficio : Integer = -1;
   sMatricula : String  = ''): String;

  var qryAux : TwwQuery;

begin

    qryAux := TwwQuery.Create(Nil);

    qryAux.close;
    qryAux.DatabaseName := 'BaseDados';
    qryAux.sql.Clear;
    //Renato Visoni SOL 123190 Kintana 621959 - Foi dado um espaço entre os comandos na SQL abaixo
    //qryAux.sql.Add(' select distinct b.idpessoa, b.idplanoprev, b.idplanoprev, b.idtitular, b.idsitbeneficio, decode(b.idpessoa, idtitular, 1, 2) as ORDEM  '); // Peterson Victor SIG46066 // Andre Imakawa - SIG 46976
    qryAux.sql.Add(' select distinct b.idpessoa, b.idplanoprev, b.idplanoprev, b.idtitular, b.idsitbeneficio ');
    qryAux.sql.Add(' from benefbfciario b ');
    qryAux.sql.Add(' where b.idpessoa ='+ idPessoa);
    qryAux.sql.Add(' and b.idplanoprev ='+ idPlanoPrev);

    if iNumprocesso <> -1 then   //Fanuel Junior SOL157444/5301 Kintana1329006
       qryAux.sql.Add(' and b.numeroprocesso ='+ IntToStr(iNumprocesso));

    if iIdBeneficio <> -1 then //Fanuel Junior SOL157444/5301 Kintana1329006
       qryAux.sql.Add(' and b.idbeneficio ='+ IntToStr(iIdBeneficio))
    else
       qryAux.sql.Add(' and b.idsitbeneficio <> 3 '); // Renato Visoni SOL123526 Kintana 620842
    //qryAux.sql.Add('and b.fontepagadora  = 1'); // Renato Visoni SOL123526 Kintana 620842
    //qryAux.sql.Add(' order by ORDEM ');     // Peterson Victor SIG46066 // Andre Imakawa - SIG 46976
    
    qryAux.open;

    // Inicio Jéssica Lana SOL 123675 Kintana 620196
    if qryAux.FieldByname('idTitular').AsString = '' then begin

      //Início - William Santana - SIG 35922
      qryAux.Close;
      qryAux.sql.Clear;
      qryAux.sql.Add(' select distinct d.idpessoa, ppp.idplanoprev, ppp.idplanoprev, d.idtitular ');
      qryAux.sql.Add(' from depentit d, partprevplan ppp                                         ');
      qryAux.sql.Add(' where d.idpessoa = '+ idPessoa);
      qryAux.sql.Add(' AND d.idtitular = ppp.idpessoa                                            ');
      qryAux.sql.Add(' and ppp.idplanoprev = '+ idPlanoPrev);
      qryAux.sql.Add(' and d.iddependencia = ''PRP''   ');
      qryAux.open;

      if not(qryAux.isEmpty) then begin
        Result := qryAux.FieldByname('IDTITULAR').asString;
      end else begin
       //Término - William Santana - SIG 35922
        // Renato Visoni SOL 156019 Kintana 1220965
        qryAux.Close;
        qryAux.sql.Clear;
        qryAux.sql.Add(' select distinct d.idpessoa, ppp.idplanoprev, ppp.idplanoprev, d.idtitular ');
        qryAux.sql.Add(' from depentit d, partprevplan ppp                                         ');
        qryAux.sql.Add(' where d.idpessoa = '+ idPessoa);
        qryAux.sql.Add(' AND d.idtitular = ppp.idpessoa                                            ');
        qryAux.sql.Add(' and ppp.idplanoprev = '+ idPlanoPrev);
        qryAux.open;

        if qryAux.isEmpty then begin
          Result := idPessoa;
        end else begin
          Result := qryAux.FieldByname('IDTITULAR').asString;
        end;

         // INICIO - SIG 42702 - Marcelo Cardoso Santos Filho
           if sMatricula <> '' then
           begin
           qryAux.Close;
           qryAux.sql.Clear;
           qryAux.sql.Add(' SELECT DISTINCT D.IDPESSOA, D.IDTITULAR  ');
		   qryAux.sql.Add(' FROM DEPENTIT D ');
           qryAux.sql.Add(' WHERE D.MATRICULA = '+ QuotedStr(sMatricula));
		   qryAux.open;
        end;

         if qryAux.isEmpty then
            begin
               Result := idPessoa;
            end
         else
            begin
               Result := qryAux.FieldByname('IDTITULAR').asString;
            end;
         // INICIO - SIG 42702 - Marcelo Cardoso Santos Filho

      end;
      // Renato Visoni SOL 156019 Kintana 1220965
    end
    else
    begin
      Result := qryAux.FieldByname('idTitular').AsString;
    end;
    // Fim Jéssica Lana SOL 123675 Kintana 620196


    FreeAndNil(qryAux);


end;      

// Renato Visoni SOL 130508 Kintana 733058
function ProcAtualizaNumeroDependentes(idPessoa : integer; bCommit : integer) : Boolean;
  var SP_PROC: TStoredProc;
begin
  Result := True;

  Try
    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName := 'BaseDados';

    SP_PROC.StoredProcName := 'ATUALIZANUMERODEPENDENTE';


    SP_PROC.Params.CreateParam(ftInteger, 'IDPESSOA'  , ptInput);
    SP_PROC.Params.CreateParam(ftDate,  'pDATAFOLHA'  , ptInput);
    SP_PROC.Params.CreateParam(ftBoolean, 'bCommit'   , ptInput);

    SP_PROC.ParamByname('IDPESSOA').asInteger   := idPessoa;
    SP_PROC.ParamByname('pDATAFOLHA').asDate    := Now;
    SP_PROC.ParamByname('bCommit').asInteger    := bCommit;



    SP_PROC.Prepare;
    SP_PROC.ExecProc;

    SP_PROC.Close;

  except
    Result := False;
  End;

  FreeAndNil(SP_PROC);


end;
// Renato Visoni SOL 130508 Kintana 733058

end.
