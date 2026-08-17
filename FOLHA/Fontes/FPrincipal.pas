unit FPrincipal;

interface

// Alterações:
{--------------------------------------------------------------------------------
Rotina.......... : (dfm) mnuManutenodasListasdeExecuo1, btnSeqExec, btnPrevia
N. SIG.......... : WO19556
Data............ : 11/03/2025
Responsavel..... : Edilaine
Alteração....... : Refatoraçao do processo da previa
********************************************************************************
Rotina           : mnuMapaFolhaBen()
N. SIG.......... : WO2511
Data da Alteração: 14/05/2024
Alteração Form:  : fPrincipal
Responsável:     : Helen V Bianchi
Descrição....... : Inclusão da nova funcionalidade de "Mapa da Folha de Benefício"
********************************************************************************
Rotina           : mnuRemessaEletronicaClick()
N. SIG.......... : 60540
Data da Alteração: 26/03/2018
Alteração Form:  : fPrincipal
Responsável:     : Cássio Florêncio Rovaroto
Descrição....... : Inclusão da nova funcionalidade de "Remessa Eletrônica" e inibição do
                   item "Gera Arquivo de Remessa Bancária".
********************************************************************************
Pendência   : SIG97894
Data        : 19/02/2020
Responsável : Andre Imakawa
Alteração   : Os menus mnuGeraArquivoEntidade e mnuEncerramentoPorFalecimento
              devem ser habilitados pelo controle de permissões.
--------------------------------------------------------------------------------
Pendência   : SIG83837
Data        : 14/06/2019
Responsável : Fabio Sampaio
Alteração   : Retirada do registro da bpl c:\cmsolucoes\executaveis\bpl\vcf132.ocx
              ao inicializar, pois no Windows 10 o módulo é fechado abruptamente
              após 5 minutos.
--------------------------------------------------------------------------------
Pendência  : SOL 207789/16619 KINTANA 554287    
Data        : 05/07/2015
Responsável : Fernando Xavier
Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das
              Informações da Fita de Crédito
--------------------------------------------------------------------------------
Pendência   : SIG 22246
Responsável : Darivaldo Alencar
Data        : 04/08/2016
Descrição   : Criação do Menu: funcionalidade Coluna do Mapa de Folha
Rotina      : mnuColunadoMapadeFolha
--------------------------------------------------------------------------------
Pendência   : SOL 146677 Kintana 1233515
Responsável : MARCIO DENILSON
Data        : 10/05/2012
Descrição   : Prestacao de contas INSS
Rotina      : .dfm  (mnuPrestaodeContasdoINSS em Reembolso do INSS)
--------------------------------------------------------------------------------
Autor(a)   : William Santana
Data       : 13/03/2014
Pendência  : SOL 192827 Kintana 1835455
Descricao  : Criação da funcionalidade Insere RubricasIndividuaisEmLote
--------------------------------------------------------------------------------
Autor(a)   : Márcio Denilson
Data       : 20/03/2014
Pendência  : SOL 136748/14313 Kintana 1988667
Descricao  : Criação da funcionalidade encerramento de falecimento.
--------------------------------------------------------------------------------
Autor(a)   : Felipe A. Santos
Data       : 04/12/2013
Pendência  : SOL 208662/15267 Kintana 2049259
Descricao  : Criação da funcionalidade Cálculo da Folha de Benefícios/
             Preparo - SP.
--------------------------------------------------------------------------------
Autor(a)   : Eraldo Silva
Data       : 29/02/2012
Pendência  : SOL 175120 Kintana 15940219
Descricao  : CONSULTA GERAL PESSOA Ao consultar alguma matricula no Consulta Geral de
             Pessoa o sistema fecha a tela automaticamente.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 1146668 KINTANA 1002463
Responsável : Vinicius Eduardo Nascimento Maciel
Data        : 29/08/2011
Descrição   : Foi acrescentado o item de menu "Manutenção de Rubricas do
              Reembolso do INSS e NB".
Alteração no DFM : Foi alterado o componente mnu
--------------------------------------------------------------------------------
Pendência   : SOL 146663 KINTANA 1002356
Responsável : Vinicius Eduardo Nascimento Maciel
Data        : 26/08/2011
Descrição   : Foi acrescentado o item de menu"Insere Rubricas do INSS na Folha".
Alteração no DFM : Foi alterado o componente mnu
--------------------------------------------------------------------------------------------------
Pendência   : SOL 137263 KINTANA 828396
Responsável : BRUNO AZEVEDO
Data        : 14/12/2010
Descrição   : Implementação da funcionalidade "Insere Adiantamento Extra Folha".
---------------------------------------------------------------------------------------------------
Pendência   : SOL 147141 KINTANA 1027567
Responsável : BRUNO AZEVEDO
Data        : 22/11/2010
Descrição   : Ao inicializar o módulo, fazer o registro das bpls c:\cmsolucoes\executaveis\bpl\vcf132.ocx.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 143430 KINTANA 929764
Responsável : BRUNO AZEVEDO
Data        : 06/09/2010
Descrição   : Correção na função LEPARAM para verificar o parametro Sistema.IdEmpresa.
---------------------------------------------------------------------------------------------------
 Autor(a)    : Fernando Xavier
 Data        : 23/06/2010
 Sol         : 136951
 Kintana     : 822330
 Descricao   : adicionado no menu calculo da folha -> Folha de benefícios
               -> submenu Contra cheque e gera arquivo entidade e retirado do projeto funcef
------------------------------------------------------------------------------
Pendência   : SOL 136950 KINTANA 822331
Responsável : BRUNO AZEVEDO
Data        : 31/05/2010
Descrição   : Mostrar na barra de status o banco que o usuáro está logado.
---------------------------------------------------------------------------------------------------
Autor     : Claudio Faria
Data      : 09/01/2008
Rotina    : Grficos2
Pendência : 27222
Descricao : Ajusta o menu de consultar Grárifo.
----------------------------------------------------------------------------------------------------
Autor     : Claudio Faria
Data      : 08/05/2007
Rotina    : MnuConsPart_PadraoClick
Pendência : 25110
Descricao : Ajuste na inicialização da Consulta geral de pessoa.
----------------------------------------------------------------------------------------------------
Autor     : Paulo Ramos
Data      : 16/04/2007
Rotina    : mnuGeraArquivoEntidadeClick
Pendência : 20840
Descricao : Altera a chamada do form.
----------------------------------------------------------------------------------------------------}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  TB97, Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, fcOutlookList, fcButton, fcImgBtn,
  fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar,
  MontaSelect, udatabase,
  UObjFolha, uCmRptManager, SConnect, MConnect,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF} DBClient, fCadParamAntecipAbono,
  FGeraSaidaCadastral, uResource, fConsultaParametrizacaoPrevia, UConsPart,
  CMNetUsers, UFuncoesUteisFB, FComparaReembDesemb, fEncerraConciliacao, fExtratoINSS,
  FConsPartTratados, fCadEntrManualINSS, fCancIdentificaINSS, fIdentificaINSS,
  fCompoeValoresRI, fResultConciliacao, FConciliacao, fAssocRubINSS, fCadMantenedora,
  FCadUFINSS, uCtrlParamIntegra, SHELLAPI, FEncerramentoPorFalecimento,
  FManutListaExecPrevia,    //edilaine WO19556
  wwstorep, FRemessaEletronica;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTransacoes: TMenuItem;
    mnuPreparo: TMenuItem;
    mnuFolhaNormal: TMenuItem;
    mnuFolhaPreviaEspecial: TMenuItem;
    mnuRubricasporPlano: TMenuItem;
    mnuFavorecido: TMenuItem;
    mnuRubricasSalariais: TMenuItem;
    Prvia1: TMenuItem;
    ImportaoArquivo1: TMenuItem;
    LayOutDescontos1: TMenuItem;
    qryParamGlobal: TwwQuery;
    qryParamGlobalUSACRESPON: TStringField;
    qryParamGlobalUSAABC: TStringField;
    qryParamGlobalCODCENTRORESPON: TStringField;
    qryParamGlobalUNIDNEGOC: TFloatField;
    DemenstrativodePagamento1: TMenuItem;
    Adiantamento1: TMenuItem;
    N6: TMenuItem;
    Prvia3: TMenuItem;
    AntecipaodeAbono2: TMenuItem;
    ContasBancrias1: TMenuItem;
    ArquivoTXT1: TMenuItem;
    mnuConsultaPrevia: TMenuItem;
    ExportaodeArquivo1: TMenuItem;
    Estorna1: TMenuItem;
    mnuConsultaHistorico: TMenuItem;
    ExtratoIndividual1: TMenuItem;
    Identificao1: TMenuItem;
    Divergentes1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mnuGeraArquivodeRemessa: TMenuItem;
    mnuFolhaExtra: TMenuItem;
    mnuPagamentosPendentes: TMenuItem;
    MontaSelectPart1: TMontaSelect;
    mnuVisaoGerencialFolha: TMenuItem;
    N2: TMenuItem;
    mnuRubricasIndividuais: TMenuItem;
    mnuCadastroManualdeRubricas: TMenuItem;
    mnuCadastroManualdeBeneficios: TMenuItem;
    mnuAlteraFormadePagto: TMenuItem;
    N7: TMenuItem;
    BancoXPortadorForma1: TMenuItem;
    N1: TMenuItem;
    mnuINDAsist: TMenuItem;
    N3: TMenuItem;
    mnuAbreLote: TMenuItem;
    mnuConsultaEstornos: TMenuItem;
    mnuRubricasFavorecContacc: TMenuItem;
    N10: TMenuItem;
    mnuListadeRecebedores: TMenuItem;
    N11: TMenuItem;
    mnuFechamentoConvenio: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    mnuPagamentoConvenio: TMenuItem;
    N15: TMenuItem;
    EstruturasdeClculo1: TMenuItem;
    MnuRegraxRub: TMenuItem;
    ReajustedeRubricasIndividuais1: TMenuItem;
    EstatdeParticipantesporVersodeFolha1: TMenuItem;
    GrficodeportipodeBenefcoporFolha1: TMenuItem;
    GrficoDemostrativodeDescontos1: TMenuItem;
    GrficoDemonstrativodeSuplementaeseDescontos1: TMenuItem;
    mnuCadGrupoRub: TMenuItem;
    mnuAcaoJudicial: TMenuItem;
    mnuBeneficiosPreparados: TMenuItem;
    AcertodeBenefcioPsMorte1: TMenuItem;
    mnuConferenciaPrevia: TMenuItem;
    mnuTipoAcaoxRegra: TMenuItem;
    mnuConsultaHstCompensaIR: TMenuItem;
    mnuReajustaPensao: TMenuItem;
    mnuConsultaGlobalPrevia: TMenuItem;
    mnuExportaVariosConvenios: TMenuItem;
    mnuLayoutEntxSaida: TMenuItem;
    N19: TMenuItem;
    mnuPrincAcaoJudicial: TMenuItem;
    mnuPrincRubricas: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    mnuGeraSimulacaoArquivoBancriodaPrevia: TMenuItem;
    MnuFechamentodeReembolso: TMenuItem; //Ádler
    ConsultaParticipantesTratados1: TMenuItem; //Ádler
    N16: TMenuItem;
    N17: TMenuItem;
    AcertoBenefProvAnula1: TMenuItem;
    GeraCobrBenefProv: TMenuItem;
    ControlaCobBenefProv: TMenuItem;
    mnuAcertaParamContab: TMenuItem;
    ManutencaoCobranca: TMenuItem;
    qry: TwwQuery;
    MensagemparaContracheque1: TMenuItem;
    Abono1: TMenuItem;
    N18: TMenuItem;
    mnuParametrosparaAntecipacao: TMenuItem;
    mnuGeraSaidaCadastral: TMenuItem;
    mnuGeraArquivoEntidade2: TMenuItem;
    mnuParametrizacaoContabilFinanceiradaPrevia: TMenuItem;
    mnuCompensaIRRF: TMenuItem;
    N22: TMenuItem;
    MnuConjuntoRubrica: TMenuItem;
    MnuCadastroConjuntoRubrica: TMenuItem;
    MnuAssociaConjuntoRubrica: TMenuItem;
    N23: TMenuItem;
    mnuExecAbateReserva: TMenuItem;
    N24: TMenuItem;
    mnuRubricasDePara1: TMenuItem;
    N25: TMenuItem;
    mnuContraCheque: TMenuItem;
    mnuGeraArquivoEntidade: TMenuItem;
    Timer1: TTimer;
    N26: TMenuItem;
    mnuBenefPostoPrisma: TMenuItem;
    mnuAdiantamentoExtraFolha: TMenuItem;
    MnuLancHistBenef: TMenuItem; //Renan Cristiano Sol 149073 Kintana 1062944	
    mnuBloquiousuario: TMenuItem;
    MnuAberturaFitaCredito: TMenuItem;
    mnuReemINSS: TMenuItem;
    mnuInsereRubricasdoINSSnaFolha: TMenuItem;
    mnuConciliaodoReembolsodoINSS: TMenuItem;
    mnuHistricodeCompensaodeSaldodeContribuies: TMenuItem;
    mnuPreparoSP: TMenuItem;
	mnuEncerramentoporFalecimento: TMenuItem;
    N27: TMenuItem;
    mnuRubricasIndividuaisEmLote: TMenuItem;
    mnuPrestaodeContasdoINSS: TMenuItem;
    mnuColunadoMapadeFolha: TMenuItem; //Darivaldo Alencar SIG 22246
    N28: TMenuItem;  //SOL 207789/16619 KINTANA 554287
    MnuRegularizacaoPagamento: TMenuItem;//SOL 207789/16619 KINTANA 554287
    mnuEventoRegPagamento: TMenuItem;//SOL 207789/16619 KINTANA 554287
    mnuConciliacaoCredito: TMenuItem;
    Timer2: TTimer;
    mnuRemessaEletronica: TMenuItem;
    mnuMapaFolhaBen: TMenuItem;
    mnuManutenodasListasdeExecuo1: TMenuItem;
    N29: TMenuItem;
    btnPrevia: TBitBtn;
    btnSeqExec: TBitBtn;//SOL 207789/16619 KINTANA 554287
    procedure mnuRubricasIndividuaisEmLoteClick(Sender: TObject);
    procedure mnuRubricasSalariaisClick(Sender: TObject);
    procedure mnuFolhaNormalClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuRubricasIndividuaisClick(Sender: TObject);
    procedure mnuPreparoClick(Sender: TObject);
    procedure mnuRubricasporPlanoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuFavorecidoClick(Sender: TObject);
    procedure Prvia1Click(Sender: TObject);
    procedure BancoXPortadorForma1Click(Sender: TObject);
    procedure ImportaoArquivo1Click(Sender: TObject);
    procedure LayOutDescontos1Click(Sender: TObject);
    procedure DemenstrativodePagamento1Click(Sender: TObject);
    procedure Estorna1Click(Sender: TObject);
    procedure ContasBancrias1Click(Sender: TObject);
    procedure ExportaodeArquivo1Click(Sender: TObject);
    procedure Prva1Click(Sender: TObject);
    procedure mnuConsultaPreviaClick(Sender: TObject);
    procedure mnuGeraArquivodeRemessaClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure ExtraFolha1Click(Sender: TObject);
    procedure Restabelecimento1Click(Sender: TObject);
    procedure mnuConsultaHistoricoClick(Sender: TObject);
    procedure mnuCadastroManualdeBeneficiosClick(Sender: TObject);
    procedure mnuCadastroManualdeRubricasClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuVisaoGerencialFolhaClick(Sender: TObject);
    procedure mnuINDAsistClick(Sender: TObject);
    procedure LayOutDescontosSaida1Click(Sender: TObject);
    procedure mnuAbreLoteClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure mnuConsultaEstornosClick(Sender: TObject);
    procedure mnuRubricasFavorecContaccClick(Sender: TObject);
    procedure mnuListadeRecebedoresClick(Sender: TObject);
    procedure mnuFechamentoConvenioClick(Sender: TObject);
    procedure mnuPagamentoConvenioClick(Sender: TObject);
    procedure mnuAlteraFormadePagtoClick(Sender: TObject);
    procedure EstruturasdeClculo1Click(Sender: TObject);
    procedure MnuRegraxRubClick(Sender: TObject);
    procedure ReajustedeRubricasIndividuais1Click(Sender: TObject);
    procedure EstatdeParticipantesporVersodeFolha1Click(Sender: TObject);
    procedure GrficodeportipodeBenefcoporFolha1Click(Sender: TObject);
    procedure GrficoDemostrativodeDescontos1Click(Sender: TObject);
    procedure GrficoDemonstrativodeSuplementaeseDescontos1Click(
      Sender: TObject);
    procedure mnuCadGrupoRubClick(Sender: TObject);
    procedure mnuAcaoJudicialClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure mnuBeneficiosPreparadosClick(Sender: TObject);
    procedure mnuConferenciaPreviaClick(Sender: TObject);
    procedure mnuTipoAcaoxRegraClick(Sender: TObject);
    procedure mnuConsultaHstCompensaIRClick(Sender: TObject);
    procedure mnuReajustaPensaoClick(Sender: TObject);
    procedure mnuConsultaGlobalPreviaClick(Sender: TObject);
    procedure mnuExportaVariosConveniosClick(Sender: TObject);
    procedure mnuLayoutEntxSaidaClick(Sender: TObject);
    procedure mnuGeraSimulacaoArquivoBancriodaPreviaClick(Sender: TObject);
    procedure mnuAcertaParamContabClick(Sender: TObject);
    procedure MensagemparaContracheque1Click(Sender: TObject);
    procedure mnuParametrosparaAntecipacaoClick(Sender: TObject);
    procedure mnuGeraSaidaCadastralClick(Sender: TObject);
    procedure mnuGeraArquivoEntidade2Click(Sender: TObject);
    procedure mnuParametrizacaoContabilFinanceiradaPreviaClick(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure mnuCompensaIRRFClick(Sender: TObject);
    procedure MnuCadastroConjuntoRubricaClick(Sender: TObject);
    procedure MnuAssociaConjuntoRubricaClick(Sender: TObject);
    procedure mnuExecAbateReservaClick(Sender: TObject);
    procedure mnuRubricasDePara1Click(Sender: TObject);
    procedure Grficos2Click(Sender: TObject);
    procedure mnuContraChequeClick(Sender: TObject);
    procedure mnuGeraArquivoEntidadeClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CadastrodergosdoINSS1Click(Sender: TObject);
    procedure mnuPrismaCadMantenedoraClick(Sender: TObject);
    procedure AssociaodeRubricasdoINSS1Click(Sender: TObject);
    procedure mnuPrismaConciliacaoClick(Sender: TObject);
    procedure mnuPrismaResultadoConciliaClick(Sender: TObject);
    procedure Divergentes1Click(Sender: TObject);
    procedure Identificao1Click(Sender: TObject);
    procedure mnuCancIdentificacaoClick(Sender: TObject);
    procedure EntradaManualdeRubricas2Click(Sender: TObject);
    procedure ConsultaParticipantesTratados1Click(Sender: TObject);
    procedure ExtratoIndividual1Click(Sender: TObject);
    procedure MnuFechamentodeReembolsoClick(Sender: TObject);
    procedure MnuItResumoREExDESClick(Sender: TObject);
    procedure mnuAdiantamentoExtraFolhaClick(Sender: TObject);
    procedure MnuLancHistBenefClick(Sender: TObject); //Renan Cristiano Sol 149073 Kintana 1062944
    procedure MnuAberturaFitaCreditoClick(Sender: TObject);
    procedure mnuBloquiousuarioClick(Sender: TObject);
    procedure mnuReemINSSClick(Sender: TObject);
    procedure mnuInsereRubricasdoINSSnaFolhaClick(Sender: TObject);
    procedure mnuEncerramentoporFalecimentoClick(Sender: TObject);
	procedure mnuConciliaodoReembolsodoINSSClick(Sender: TObject);
	procedure MnuFinancHabitacionalClick(Sender: TObject);
	procedure MnuInsereRubricasIndividuaisClick(Sender: TObject);
    procedure mnuHistricodeCompensaodeSaldodeContribuiesClick(
      Sender: TObject);
    procedure mnuPreparoSPClick(Sender: TObject);
    procedure mnuPrestaodeContasdoINSSClick(Sender: TObject);
    procedure mnuColunadoMapadeFolhaClick(Sender: TObject);//Darivaldo Alencar SIG 22246
    procedure mnuEventoRegPagamentoClick(Sender: TObject);  //SOL 207789/16619 KINTANA 554287
    procedure mnuConciliacaoCreditoClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);  //SOL 207789/16619 KINTANA 554287
    procedure mnuRemessaEletronicaClick(Sender: TObject);
    procedure mnuMapaFolhaBenClick(Sender: TObject);
    procedure mnuManutenodasListasdeExecuo1Click(Sender: TObject);
    procedure btnSeqExecClick(Sender: TObject);
    procedure btnPreviaClick(Sender: TObject);
  private
    procedure Verifica_Situacao_Empresa;
    function EscolheFundacao : longint;
    procedure MudaCaptionFundacao(Sender: TObject);
    procedure TrimAppMemorySize();
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses FTelaAut, FPreparo,
     DBaseDados, FCadForne, UAutorizacao, UMensErro, USistema, UModulo,
     fFolhaNormalEfet, FFolhaNormalPrevia, uIntegraBack, FCadProvento,
     fImportaTxt, FCadLayoutDesconto,
     fEstornaFolha, FCadContaBanco, FPRelDemPag, FConsultaPrevia,
     FExportaTXT, FCadTmpDesc, fGeraArquivoRemessa,
     dRelFolha, dRelGeral, dAPREV, dFolha,
     dPrevia, dIntegracao, dRelFolhaAtividade,
     fFolhaExtra,
     FPagamentoPendente, FConsultaHistorico,
     FCadHstBeneficio, dFolhaPrevia, drelbenef, fVisaoGerencial,
     FCadRubricaIndiv, FCadExcessoesIR, FAssocRubricaPlano,
     UfuncoesFolha, FCadLayoutDescontoSaida,
     uCmCtrlRptFolha, FConsultaEstorno, FCadRubFavContacorrente,UFolhaBenef,
     dRelPortFormaVersao, FCadListaRecebedor,
     FParametroFolha, fTratamentoConvenio,
     fConsultaConvenio, dRelRubricas, FCadAlteraFormaPagto, dRelResRubrica,
     FCadRegraxRubrica, FEstruturaCalculo, dRelParamRubricas, FReajRubIndiv,
     dRelQtdMensalPartBenef, dRelaQtdPartFolha, dRelEstatSuplBenef,
     FFiltroGraficoQtdPartFolha, FFiltroGraficoFolhaBenef, FFiltroGraficoDescontos,
     FFiltroGraficoSuplDescFolha, dRelBenefINSS, dRelContraCheque, dRelaTotSuplBenef,
     FCadGrupoRubrica, dRelCartasBanco,  dRelPendenciaFolha,
     FCadDepJudicial, dRelEntSaiFolha, dRelBenefRetidos,
     dRelBenefaPreparar, dRelValorLiquido, dRel2ViaCChequeMT, FPRel2ViaCChequeMT,
     dRelTotSuplemInt, fConsultaPreparo,
     dRelDivergContrib,
     fConferenciaPrevia, FCadTipoAcaoxRegra, FConsHstCompensaIR, dRelFichaFinanc,
     dRelAlteracaoBenefPagos, dRelRendasAlteradas, FConsultaGlobalPrevia,
     FReajustaPercPensao, dRelFichaFinancIndiv, FExportaVariosConvenios,
     FAssocLayoutEntxSaida, fCadBancoPortadorCS, dRelRubSalariais,
     FAcertaParamContabilFinanc,
     FmsgContraCheque, uAdmPrevFB,
     dRelLancNaoProcessados, dRelEstruturaRubricas,
     FGeraArquivoConsignatario,
     fGeraArquivoRemessaPrevia, dRelPagtoIndiv,
     FCadCompensaIRRF, FCadConjuntoRubrica, FAssociaConjuntoxRubrica,
     FExecAbateReserva, FExecGeraDocConvenio, FParamRubricaMT, FDemPag, Registry,
     FAbertFechaLoteFB, FAdiantamentoExtraFolha,
	 FLancHistBenef,      //Renan Cristiano Sol 149073 Kintana 1062944
         FManutRubricaReembolsoINSS , FInsereRubricasINSSFolha, //Vinicius Maciel SOL 1146668 KINTANA 1002463
  FAberturaFitaCredit, FCadbloqfolha,FConciliacaoReembolsoINSS, UntPrincipal, FfinancHabitacional,FCadRubricaIndividual,FHistCompSalContri,
  FPreparoSP, fRubricasIndividuaisEmLote, FPrestacaoContasINSS,
  fColMapaFolha, //Darivaldo Alencar SIG 22246
  UCadastroEventoRegularizacao, UConciliacaoCredito,  //SOL 207789/16619 KINTANA 554287
  FMapaFolhaBenef;  //WO2511 - Helen V Bianchi

{$R *.DFM}

procedure TfrmPrincipal.Verifica_Situacao_Empresa;
var
  qryIntegraBack : TQuery;
begin

  // Verificar se Previdenciario com Contabilidade
  qryIntegraBack := TQuery.Create(Application);
  qryIntegraBack.DataBaseName := 'Basedados';

  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT FLGINTCONTAB, FLGINTCPAGARPREV, FLGINTCRECEBERPR '+
                         ' FROM   PARAMAPREV ');
  qryIntegraBack.open;

  if Sistema.IdEmpresa <= 0
  then begin
     qryIntegraBack.Free;
     Exit;
  end;

  // Preencher parametros da contabilidade
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PL.MASCARA, PC.PLANO       '+
                         ' FROM   PLANO PL,   PARAMCONTAB PC '+
                         ' WHERE  (PC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
                         ' AND    (PL.PLANO = PC.PLANO) ');
  qryIntegraBack.Open;
  if not (qryIntegraBack.IsEmpty)
  then begin
      IntegraBack.Plano        := qryIntegraBack.FieldbyName('PLANO').AsInteger;
      IntegraBack.MascaraPlano := qryIntegraBack.FieldbyName('MASCARA').AsString;
  end
  else begin
     IntegraBack.Plano := 0;
     IntegraBack.MascaraPlano := '';
  end; 

  if (SistemaFolha.FLGINTEGRACONTABIL = 1 ) and
     ( (IntegraBack.Plano <= 0) or (IntegraBack.MascaraPlano = ''))
  then begin
     MsgDlg(' O Sistema de Folha de Benefícios está integrado com o Sistema de Contabilidade. '+
            ' Porém existem dados da contabilidade indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;

  // Preencher parametros de integracao com CAP/CAR
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PREC.MASCARADESEMB AS MASCARAREC , PPAG.MASCARADESEMB AS MASCARAPAG  '+
			 ' FROM   PARAMCAP PREC, PARAMCAP PPAG'+
			 ' WHERE  (PREC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
			 ' AND    (PPAG.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
			 ' AND    (PREC.RECPAG = ''R'')'+
                         ' AND    (PPAG.RECPAG = ''P'')');

  qryIntegraBack.Open;

  if (not qryIntegraBack.IsEmpty)
  then begin
     IntegraBack.MascaraDesemb:= qryIntegraBack.FieldbyName('MASCARAREC').AsString;
     IntegraBack.MascaraDesemb := qryIntegraBack.FieldbyName('MASCARAPAG').AsString;
  end
  else begin
     IntegraBack.MascaraDesemb := '';
     IntegraBack.MascaraDesemb := '';
  end;

  if (Sistemafolha.FLGINTEGRAFINANC = 1) and (Trim(IntegraBack.MascaraDesemb) = '')
  then begin
     MsgDlg(' O Sistema de Folha de Benefícios está integrado com os Sistemas de Contas a Pagar e Contas a Receber. '+
            ' Porém existem dados do Contas a Receber indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;

  //Verifica se a empresa utiliza o sistema ABC( Custo Baseado na Atividade)
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT USAABC, USACRESPON, UNIDNEGOC, CODCENTRORESPON '+
                         ' FROM   PARAMGLOBAL '+
                         ' WHERE  IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  qryIntegraBack.open;
  if qryIntegraBack.IsEmpty
  then begin
     IntegraBack.ObrigaABC := 'S';
     IntegraBack.ObrigaCRespon := 'S';
     prmUnidNegoc := -1;
     prmCodCentroRespon := '';
  end
  else begin
     if qryIntegraBack.FieldByName('USAABC').AsString = 'N'
     then IntegraBack.ObrigaABC := 'N'
     else IntegraBack.ObrigaABC := 'S';

     if qryIntegraBack.FieldByName('USACRESPON').AsString = 'N'
     then IntegraBack.ObrigaCRespon := 'N'
     else IntegraBack.ObrigaCRespon := 'S';

     if Trim(qryIntegraBack.FieldByName('UnidNegoc').AsString) <> ''
     then prmUnidNegoc := qryIntegraBack.FieldByName('UnidNegoc').AsInteger
     else prmUnidNegoc := -1;

     if Trim(qryIntegraBack.FieldByName('CODCENTRORESPON').AsString) <> ''
     then prmCodCentroRespon := qryIntegraBack.FieldByName('CODCENTRORESPON').AsString
     else prmCodCentroRespon := '-1';
  end;
  qryIntegraBack.Free;
end;   //verifica_situacao_empresa;

procedure TfrmPrincipal.mnuRubricasSalariaisClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadProvento,TfrmCadProvento,False);
end;

procedure TfrmPrincipal.mnuFolhaNormalClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolhaNormalEfet,TfrmFolhaNormalEfet,False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParametroFolha,TfrmParametroFolha,False);
end;

procedure TfrmPrincipal.mnuRubricasIndividuaisClick(Sender: TObject);
begin
  inherited;
  // SOL 136934 - Márcio
  //AbrirForm(frmCadRubricaIndiv,TfrmCadRubricaIndiv,False);
  AbrirForm(frmCadRubricaIndividual,TfrmCadRubricaIndividual,False);

end;

procedure TfrmPrincipal.mnuPreparoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPreparo,TfrmPreparo,False);
end;

procedure TfrmPrincipal.mnuRubricasporPlanoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssocRubricaPlano,TfrmAssocRubricaPlano,False );
end;

procedure TfrmPrincipal.MudaCaptionFundacao(Sender: TObject);
var i, iPos, iTam, iTamFrase : word;
    Temp    : TComponent;
begin
  if Screen.ActiveForm = nil then
    Exit;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT IDPESSOA, FLGTIPOPREVIDENC FROM FUNDACAO WHERE IDPESSOA = '+IntToStr(iIdFundacao));
  qry.Open;
  if not qry.IsEmpty and (qry.FieldByName('FLGTIPOPREVIDENC').AsString = 'I') then
  begin
    iPos      := Pos   ('FUNDA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('FUNDAÇÃO');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Instituto'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PATROCINADORAS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORAS');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidades'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PATROCINADORA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORA');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidade'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PLANOS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANOS');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regimes'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PLANO', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANO');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regime'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    for i := 0 to Screen.ActiveForm.ComponentCount - 1 do
    begin
      Temp := Screen.ActiveForm.Components[i];
      if (Temp is TLabel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TMenuItem) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TGroupBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TCheckBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TPanel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
    end;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  sistema.idmodulo := 18 ;
  ShortdateFormat :='DD/MM/YYYY';
  Screen.OnActiveFormChange:=MudaCaptionFundacao;
end;

procedure TfrmPrincipal.mnuFavorecidoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadForne,TfrmCadForne,False);
end;

procedure TfrmPrincipal.Prvia1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolhaNormalPrevia,TfrmFolhaNormalPrevia,False);
end;

procedure TfrmPrincipal.BancoXPortadorForma1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadBancoPortadorCS,TfrmCadBancoPortadorCS,False);
end;

procedure TfrmPrincipal.ImportaoArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmImportaTxt,TFrmImportaTxt,False);
end;

procedure TfrmPrincipal.LayOutDescontos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadLayoutDesconto,TFrmCadLayoutDesconto,False);
end;

procedure TfrmPrincipal.DemenstrativodePagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPRelDemPag,TfrmPRelDemPag,False);
end;

procedure TfrmPrincipal.Estorna1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstornaFolha,TfrmEstornaFolha,False);
end;

procedure TfrmPrincipal.ContasBancrias1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContaBanco,TfrmCadContaBanco,False);
end;

procedure TfrmPrincipal.ExportaodeArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExportaTxt,TFrmExportaTxt,False);
end;

procedure TfrmPrincipal.Prva1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaPrevia,TfrmConsultaPrevia,False);
end;

procedure TfrmPrincipal.mnuConsultaPreviaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaPrevia,TfrmConsultaPrevia,False);
end;

procedure TfrmPrincipal.mnuConsultaHistoricoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaHistorico,TfrmConsultaHistorico,False);
end;

procedure TfrmPrincipal.mnuCadastroManualdeRubricasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTmpDesc,TfrmCadTmpDesc,False);
end;

procedure TfrmPrincipal.mnuCadastroManualdeBeneficiosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadHstBeneficio,TfrmCadHstBeneficio, False);
end;

procedure TfrmPrincipal.mnuGeraSimulacaoArquivoBancriodaPreviaClick(Sender: TObject);
var frmGeraArquivoRemessaPrevia: TfrmGeraArquivoRemessaPrevia;
begin
  inherited;
  AbrirForm(frmGeraArquivoRemessaPrevia, TfrmGeraArquivoRemessaPrevia, False);
end;

procedure TfrmPrincipal.mnuGeraArquivodeRemessaClick(Sender: TObject);
var frmGeraArquivoRemessa: TfrmGeraArquivoRemessa;
begin
  inherited;
  AbrirForm(frmGeraArquivoRemessa,TfrmGeraArquivoRemessa,False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  if Sistema.IdEmpresa < 0 then
    exit;
  SistemaFolha:=TObjSistemaFolha.Create;
  verifica_situacao_empresa;
  EscolheFundacao;
  LeParam(dtmBaseDados.dbBaseDados.DatabaseName, False);
  // Xavier  Sol 136951 Kintana 822330
  //mnuGeraArquivoEntidade.Enabled:= True; // Andre Imakawa - SIG 97894
//  ExtratoIndividual1.Enabled:=True;
//  Divergentes1.Enabled:=True;
//  Identificao1.Enabled:=True;
//  MnuFechamentodeReembolso.Enabled:=True;
//  ConsultaParticipantesTratados1.Enabled:=True;
   //mnuEncerramentoPorFalecimento.Enabled        := True; // Andre Imakawa - SIG 97894
  // Xavier Sol 136951 Kintana 822330
  //COLOCAR A CARGA DAS FAIXAS APÓS ESCOLHA DA FUNDACAO
  //CHAMADA PARA CARREGAR OS PARAMÊTROS APÓS TER O VALOR DE IIDFUNDACAO
  CarregaParametros(dtmfolha.qryaux);
  SistemaFolha.CriaConjuntoRubricaInterno;
  with qryParamGlobal do 
  begin
    Close;
    Params[0].asInteger := Sistema.idEmpresa;
    Open;
    if not(qryParamGlobal.isEmpty) then
    begin
      Modulo.bUsaCentRespon := FieldByName('USACRESPON').asString = 'S';
      Modulo.bUsaUnidNegoc  := FieldByName('USAABC').asString = 'S';
    end;
    if not(Modulo.bUsaCentRespon) then Modulo.sCODCENTRORESPON := FieldByName('CODCENTRORESPON').asString;
    if not(Modulo.bUsaUnidNegoc)  then  Modulo.iUnidNegoc := FieldByName('UNIDNEGOC').asInteger;

    Close;
  end;

  //BRUNO AZEVEDO SOL 136950 KINTANA 822331
  if Sistema.FezLogin then begin
    stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;
  end;

  //BRUNO AZEVEDO SOL 143430 KINTANA 929764
  if Sistema.MudouEmpresa then
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB','PARAMCAP',tiCAP);

  MudaCaptionFundacao(Sender);
end;

function  TfrmPrincipal.EscolheFundacao : longint;
begin
  Result := -1;

  iIdFundacao:=Sistema.IdEmpresa;
  iIdFundacaoAtual:=Sistema.IdEmpresa;

  SistemaFolha.FundacaoCorrente:=iIdFundacao; 
end;

procedure TfrmPrincipal.ExtraFolha1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolhaExtra,tfrmFolhaExtra,False);
end;

procedure TfrmPrincipal.Restabelecimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPagamentoPendente, TfrmPagamentoPendente, False);
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  // FORM RELATÓRIOS.
  Application.CreateForm(TDtmRelFolha,DtmRelFolha);
  Application.CreateForm(TDtmRelFolhaAtividade,DtmRelFolhaAtividade);
  Application.CreateForm(TDtmRelGeral,DtmRelGeral);
  Application.CreateForm(TDtmPrevia,DtmPrevia);
  Application.CreateForm(TDtmRelBenef,DtmRelBenef);
  Application.CreateForm(TdtmRelPortadorVersao,dtmRelPortadorVersao);
  Application.CreateForm(TdtmRelEstruturaRubricas,dtmRelEstruturaRubricas);
  Application.CreateForm(TDtmRel2ViaCChequeMT,DtmRel2ViaCChequeMT);
  Application.CreateForm(TDtmRelRubricas,DtmRelRubricas);
  Application.CreateForm(TDtmRelResRubrica,DtmRelResRubrica);
  Application.CreateForm(TDtmRelParamRubricas,DtmRelParamRubricas);
  Application.CreateForm(TDtmRelContraCheque, DtmRelContraCheque);
  Application.CreateForm(TDtmRelCartasBanco, DtmRelCartasBanco);
  Application.CreateForm(TDtmRelPendencia, DtmRelPendencia);
  Application.CreateForm(TDtmRelEntSaiFolha, DtmRelEntSaiFolha);
  Application.CreateForm(TDtmRelBenefRetidos, DtmRelBenefRetidos);
  Application.CreateForm(TDtmRelBenefaPreparar, DtmRelBenefaPreparar);
  Application.CreateForm(TDtmRelValorLiquido, DtmRelValorLiquido);
  Application.CreateForm(TDtmRelTotSuplemInt, DtmRelTotSuplemInt);
  Application.CreateForm(TDtmRelDivergContrib, DtmRelDivergContrib);
  Application.CreateForm(TDtmRelFichaFinanc, DtmRelFichaFinanc);
  Application.CreateForm(TDtmRelAlteracaoBenefPagos, DtmRelAlteracaoBenefPagos);
  Application.CreateForm(TdtmRelRendasAlteradas, dtmRelRendasAlteradas);
  Application.CreateForm(TdtmRelFichaFinancIndiv, dtmRelFichaFinancIndiv);
  Application.CreateForm(TDtmRelBenefInss,DtmRelBenefInss);
  Application.CreateForm(TdtmRelQtdMensalPartBenef,dtmRelQtdMensalPartBenef);
  Application.CreateForm(TdtmRelaQtdPartFolha, dtmRelaQtdPartFolha);
  Application.CreateForm(TdtmRelEstatSuplBenef, dtmRelEstatSuplBenef);
  Application.CreateForm(TdtmRelaTotSuplBenef, dtmRelaTotSuplBenef);
  Application.CreateForm(TdtmRelRubSalariais, dtmRelRubSalariais);
  Application.CreateForm(TdtmRelLancNaoProcessados, dtmRelLancNaoProcessados);
  Application.CreateForm(TdtmRelPagtoIndiv, dtmRelPagtoIndiv);
end;

procedure TfrmPrincipal.mnuVisaoGerencialFolhaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmVisaoGerencial,TFrmVisaoGerencial,False);
end;

procedure TfrmPrincipal.mnuINDAsistClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadExcessoesIR,TFrmCadExcessoesIR,False);
end;

procedure TfrmPrincipal.LayOutDescontosSaida1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadLayoutDescontoSaida,TFrmCadLayoutDescontoSaida,False);
end;

procedure TfrmPrincipal.mnuAbreLoteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAbertFechaLoteFB, tfrmAbertFechaLoteFB, False);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
  RptFolha :TCmCtrlRptFolha;
begin
  inherited;
  // Três Camadas
  RptFolha := TCmCtrlRptFolha.Create;
  Case Idreports Of
    3281:
    Begin
      Try
        RptFolha.IdReport := IdReports;
        Printed := RptFolha.ReportExists;

        If Printed Then
        Begin
          RptFolha.DbConnectionType := Sistema.ConnectionType;
          RptFolha.ConnectionSide := Sistema.ConnectionSide;
          RptFolha.DataBase := DtmBaseDados.dbBaseDados;
          RptFolha.Devicetype := rdtScreen; 
          RptFolha.IdEmpresa := Sistema.IdEmpresa;
          RptFolha.IdUsuario := Sistema.IdUsuario;
          RptFolha.IdModulo := Sistema.IdModulo;
          RptFolha.FileName := sFileName;
          RptFolha.NomeEmpresa := Sistema.NomeEmpresa;
          RptFolha.NomeModulo := Sistema.NomeModulo;
          RptFolha.ShowCancelDialog := True;
          RptFolha.ShowPrintDialog := False;
          RptFolha.GeraHtmlFormParam := False;
          RptFolha.ExibeMensagem := True;
          RptFolha.ExibeFormParams := True;
          RptFolha.ShowReport
        End;

        RptFolha.Free;
      Except
        RptFolha.Free;
        Raise;
      End;
    End;

    // Relatório Demostrativo 2 via Contra-Cheque 3 camadas
    2263:
    Begin
      Try
        Printed := ShowReport(IdReports, RptFolha);
        RptFolha.Free;
      Except
        RptFolha.Free;
        raise;
      End;
    End;

    20128:
    Begin
      Try
        Printed := ShowReport(IdReports, RptFolha);
        RptFolha.Free;
      Except
        RptFolha.Free;
        raise;
      End;
    End;
  End; //case
end;

procedure TfrmPrincipal.mnuConsultaEstornosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmConsultaEstorno, TfrmConsultaEstorno, False);
end;

procedure TfrmPrincipal.mnuRubricasFavorecContaccClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadRubFavContacorrente, TfrmCadRubFavContacorrente, False);
end;

procedure TfrmPrincipal.mnuListadeRecebedoresClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadListaRecebedor, TfrmCadListaRecebedor, False);
end;

procedure TfrmPrincipal.mnuFechamentoConvenioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTratamentoConvenio, TfrmTratamentoConvenio, False);
end;

procedure TfrmPrincipal.mnuPagamentoConvenioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaConvenio, TfrmConsultaConvenio, False);
end;

procedure TfrmPrincipal.mnuAlteraFormadePagtoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAlteraFormaPagto,TfrmCadAlteraFormaPagto, False);
end;

procedure TfrmPrincipal.EstruturasdeClculo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstruturaCalculo,TfrmEstruturaCalculo, False);
end;

procedure TfrmPrincipal.MnuRegraxRubClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRegraxRubrica,TFrmCadRegraxRubrica, False);
end;

procedure TfrmPrincipal.ReajustedeRubricasIndividuais1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmReajRubIndiv,TfrmReajRubIndiv,False);
end;

procedure TfrmPrincipal.EstatdeParticipantesporVersodeFolha1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFiltroGraficoQtdPartFolha, TFrmFiltroGraficoQtdPartFolha, False);
end;

procedure TfrmPrincipal.GrficodeportipodeBenefcoporFolha1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFiltroGraficoFolhaBenef, TFrmFiltroGraficoFolhaBenef, False);
end;

procedure TfrmPrincipal.GrficoDemostrativodeDescontos1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFiltroGraficoDescontos, TFrmFiltroGraficoDescontos, False);
end;

procedure TfrmPrincipal.GrficoDemonstrativodeSuplementaeseDescontos1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFiltroGraficoSuplDescFolha, TFrmFiltroGraficoSuplDescFolha, False);
end;

procedure TfrmPrincipal.mnuCadGrupoRubClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadGrupoRubrica , TFrmCadGrupoRubrica, False);
end;

procedure TfrmPrincipal.mnuAcaoJudicialClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadDepJudicial , TFrmCadDepJudicial, False);
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  // Relatório de Demonstrativo de 2 via de Contra-cheque
  case IdReports of
    2263: FrmPreviewReports := TfrmPRel2ViaCChequeMT.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.mnuBeneficiosPreparadosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaPreparo, tfrmConsultaPreparo, False);
end;

procedure TfrmPrincipal.mnuConferenciaPreviaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConferenciaPrevia, tfrmConferenciaPrevia, False);
end;

procedure TfrmPrincipal.mnuTipoAcaoxRegraClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTipoAcaoxRegra, TFrmCadTipoAcaoxRegra, False);
end;

procedure TfrmPrincipal.mnuConsultaHstCompensaIRClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsHstCompIR, TFrmConsHstCompIR, False);
end;

procedure TfrmPrincipal.mnuReajustaPensaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmReajustaPercPensao, TFrmReajustaPercPensao, False);
end;

procedure TfrmPrincipal.mnuConsultaGlobalPreviaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaGlobalPrevia, TfrmConsultaGlobalPrevia, False);
end;

procedure TfrmPrincipal.mnuExportaVariosConveniosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExportaVariosConvenios, TFrmExportaVariosConvenios, False);
end;

procedure TfrmPrincipal.mnuLayoutEntxSaidaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssocLayoutEntxsaida, TfrmAssocLayoutEntxsaida, False);
end;

procedure TfrmPrincipal.mnuAcertaParamContabClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAcertaParamContabilFinanc, TFrmAcertaParamContabilFinanc, False);
end;

procedure TfrmPrincipal.MensagemparaContracheque1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmMsgContraCheque, TFrmMsgContraCheque, False);
end;

procedure TfrmPrincipal.mnuParametrosparaAntecipacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadParamAntecipAbono, TfrmCadParamAntecipAbono, False);
end;

procedure TfrmPrincipal.mnuGeraSaidaCadastralClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraSaidaCadatral, TfrmGeraSaidaCadatral, False);
end;

procedure TfrmPrincipal.mnuGeraArquivoEntidade2Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmExecGeraDocConvenio, TfrmExecGeraDocConvenio, False);
end;

procedure TfrmPrincipal.mnuParametrizacaoContabilFinanceiradaPreviaClick(
  Sender: TObject);
var frmConsultaParametrizacaoPrevia: TfrmConsultaParametrizacaoPrevia;
begin
  inherited;
  AbrirForm(frmConsultaParametrizacaoPrevia,TfrmConsultaParametrizacaoPrevia,False);
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
var
  ConsPart1: TConsPart;
begin
   inherited;
   try
      Application.CreateForm(TconsPart, Conspart1);
      ConsPart1.sIdPessoa    := '0';
      ConsPart1.sIdPessjur   := '0';
      ConsPart1.sIdPlanoprev := '0';
      ConsPart1.sSeqProposta := '0';
      ConsPart1.DataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
   finally
      // ELS SOL 175120 Kintana 1594021
      //FreeAndNil(Conspart1);
   end;
end;

procedure TfrmPrincipal.mnuCompensaIRRFClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCompensaIRRF, TfrmCadCompensaIRRF, False);
end;

procedure TfrmPrincipal.MnuCadastroConjuntoRubricaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadConjuntoRubrica, TFrmCadConjuntoRubrica, False);
end;

procedure TfrmPrincipal.MnuAssociaConjuntoRubricaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAssociaConjuntoxRubrica, TFrmAssociaConjuntoxRubrica, False);
end;

procedure TfrmPrincipal.mnuExecAbateReservaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecAbateReserva, TfrmExecAbateReserva, False);
end;

procedure TfrmPrincipal.mnuRubricasDePara1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmParamRubricaMT ,TFrmParamRubricaMT,False );
end;

var lss : string;

procedure TfrmPrincipal.Grficos2Click(Sender: TObject);
begin
  //inherited; //CPrev - 27222

end;

procedure TfrmPrincipal.mnuContraChequeClick(Sender: TObject);
begin
  inherited;
  // Xavier Sol 136951 Kintana 822330
  AbrirForm(FrmDemPag, TFrmDemPag, False);
  // Xavier Sol 136951 Kintana 822330
end;

procedure TfrmPrincipal.mnuGeraArquivoEntidadeClick(Sender: TObject);
begin
  inherited;
  // Xavier Sol 136951 Kintana 822330
  AbrirForm(FrmExecGeraDocConvenio, TFrmExecGeraDocConvenio, False );
  // Xavier Sol 136951 Kintana 822330
end;


procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
Var Reg              : TRegistry;
    sIdHstFolhaBenef : String;
begin
  inherited;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    If Reg.OpenKey('\Software\CM\Funcef', False) then
    Begin
      If  Reg.ReadString('Demonstrativos') = 'True' Then
      Begin
        Timer1.Enabled := False;

          sIdHstFolhaBenef := Reg.ReadString('DemonstrativosString');

          If sIdHstFolhaBenef <> '' Then
          Begin
            Application.CreateForm(TFrmDemPag, FrmDemPag);

            Application.ProcessMessages;

            FrmDemPag.dblcHistorico.LookUpValue := sIdHstFolhaBenef;
            FrmDemPag.CBoxPatro.Checked         := True;
            FrmDemPag.CBoxPlano.Checked         := True;
            FrmDemPag.CBoxPortForma.Checked     := True;
            FrmDemPag.MmoDesc.Text              := '';
            FrmDemPag.edtNumLinhas.Text         := '20';
          FrmDemPag.bDemonstrativoAutomatico  := True;

            Application.ProcessMessages;
            FrmDemPag.bbtnConfirmarClick(Sender);
          End;

          Reg.WriteString('Demonstrativos', 'False');
          Reg.WriteString('DemonstrativosString', '');

        FrmDemPag.bDemonstrativoAutomatico := False;
      End;
    End;

  finally
    Reg.CloseKey;
    Reg.Free;

    Timer1.Enabled := True;
  end;
end;

procedure TfrmPrincipal.CadastrodergosdoINSS1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadUFINSS,tFrmCadUFINSS,False);
end;

procedure TfrmPrincipal.mnuPrismaCadMantenedoraClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadMantenedora, TfrmCadMantenedora, False);
end;

procedure TfrmPrincipal.AssociaodeRubricasdoINSS1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmAssocRubINSS,TfrmAssocRubINSS,False);
end;

procedure TfrmPrincipal.mnuPrismaConciliacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmConciliacao, TFrmConciliacao, False);
end;

procedure TfrmPrincipal.mnuPrismaResultadoConciliaClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmResultConciliacao, TfrmResultConciliacao, False);
end;

procedure TfrmPrincipal.Divergentes1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCompoeValoresRI, frmCompoeValoresRI);
  frmCompoeValoresRI.TelaChamadora := 1;
  frmCompoeValoresRI.Show;
end;

procedure TfrmPrincipal.Identificao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmIdentificaINSS,TfrmIdentificaINSS,False);
end;

procedure TfrmPrincipal.mnuCancIdentificacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCancIdentificaINSS, TfrmCancIdentificaINSS, False);
end;

procedure TfrmPrincipal.EntradaManualdeRubricas2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadEntrManualINSS,TfrmCadEntrManualINSS,False);
end;

procedure TfrmPrincipal.ConsultaParticipantesTratados1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsPartTratados, TFrmConsPartTratados,False);
end;

procedure TfrmPrincipal.ExtratoIndividual1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExtratoINSS,TfrmExtratoINSS,False);
end;

procedure TfrmPrincipal.MnuFechamentodeReembolsoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmEncerraConciliacao,tFrmEncerraConciliacao,False);
end;

procedure TfrmPrincipal.MnuItResumoREExDESClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmComparaReembDesemb, TFrmComparaReembDesemb, False);
end;

//BRUNO AZEVEDO SOL 137263 KINTANA 828396
procedure TfrmPrincipal.mnuAdiantamentoExtraFolhaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAdiantamentoExtraFolha, TfrmAdiantamentoExtraFolha, False);
end;
//BRUNO AZEVEDO SOL 137263 KINTANA 828396

//Renan Cristiano Sol 149073 Kintana 1062944 Inicio
procedure TfrmPrincipal.MnuLancHistBenefClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmLancHistBenef, TfrmLancHistBenef, False);
end;
//Renan Cristiano Sol 149073 Kintana 1062944 Fim.

procedure TfrmPrincipal.mnuBloquiousuarioClick(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmcadBloqFolha,tFrmcadBloqFolha,False);
end;

procedure TfrmPrincipal.MnuAberturaFitaCreditoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAberturaFitaCredito,TFrmAberturaFitaCredito,False);
end;

procedure TfrmPrincipal.mnuReemINSSClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmManutRubricaReembolsoINSS,TfrmManutRubricaReembolsoINSS,False);
end;

//Vinicius Maciel SOL 146663 KINTANA 1002356
procedure TfrmPrincipal.mnuInsereRubricasdoINSSnaFolhaClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmInsereRubricasINSSFolha,TfrmInsereRubricasINSSFolha,False);
end;
//Vinicius Maciel SOL 146663 KINTANA 1002356 - Fim

procedure TfrmPrincipal.mnuConciliaodoReembolsodoINSSClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConciliacaoReembolsoINSS,TfrmConciliacaoReembolsoINSS,False);
end;

procedure TfrmPrincipal.mnuEncerramentoporFalecimentoClick(
  Sender: TObject);
begin
  inherited;
   AbrirForm(frmEncerramentoPorFalecimento,TfrmEncerramentoPorFalecimento,False);
end;

procedure TfrmPrincipal.MnuFinancHabitacionalClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFinancHabitacional,TFrmFinancHabitacional,False);
end;

procedure TfrmPrincipal.MnuInsereRubricasIndividuaisClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmPrincipalRubricaIndiv,frmPrincipalRubricaIndiv);
   frmPrincipalRubricaIndiv.showModal;
end;

procedure TfrmPrincipal.mnuHistricodeCompensaodeSaldodeContribuiesClick(
  Sender: TObject);
var
  CompSalContri: TFrmHistCompSalContri;
begin
   inherited;
//   try
//      Application.CreateForm(TFrmHistCompSalContri, CompSalContri);
//      CompSalContri.showModal;
//   finally
//
//   end;


  AbrirForm(FrmHistCompSalContri,TFrmHistCompSalContri,False);


end;





procedure TfrmPrincipal.mnuPreparoSPClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPreparoSP, TfrmPreparoSP, False); // Felipe A. Santos SOL 208662/15267 Kintana 2049259
end;

procedure TfrmPrincipal.mnuRubricasIndividuaisEmLoteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRubricasIndividuaisEmLote,TfrmRubricasIndividuaisEmLote,False);
end;


procedure TfrmPrincipal.mnuPrestaodeContasdoINSSClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPrestacaoContasINSS,TfrmPrestacaoContasINSS,False);
end;

//Darivaldo Alencar - SIG 22246 -inicio
procedure TfrmPrincipal.mnuColunadoMapadeFolhaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmColMapaFolha,TFrmColMapaFolha,False);
end;
//Darivaldo Alencar - SIG 22246 -fim

procedure TfrmPrincipal.mnuEventoRegPagamentoClick(Sender: TObject);  //SOL 207789/16619 KINTANA 554287
begin
  inherited;
  AbrirForm(frmCadastroEventoRegularizacao,TfrmCadastroEventoRegularizacao,False);
end;

procedure TfrmPrincipal.mnuConciliacaoCreditoClick(Sender: TObject); //SOL 207789/16619 KINTANA 554287
begin
  inherited;
  AbrirForm(frmConciliacaoCredito,TfrmConciliacaoCredito,False);
end;

procedure TfrmPrincipal.TrimAppMemorySize;
var  MainHandle : THandle;
begin
   try
      MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
      SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
      CloseHandle(MainHandle) ;
   except

   end;
   Application.ProcessMessages;
end;

procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
begin
  inherited;
  TrimAppMemorySize();
end;

procedure TfrmPrincipal.mnuRemessaEletronicaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRemessaEletronica, TfrmRemessaEletronica, False);
end;

procedure TfrmPrincipal.mnuMapaFolhaBenClick(Sender: TObject);
begin
  inherited;
  //WO2511 - Helen V Bianchi - Criação da Funcionalidade
  AbrirForm(frmMapaFolhaBenef, TfrmMapaFolhaBenef, False);
end;

//edilaine WO19556 : inicio
procedure TfrmPrincipal.mnuManutenodasListasdeExecuo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmManutListaExecPrevia, TfrmManutListaExecPrevia, False);
end;

procedure TfrmPrincipal.btnSeqExecClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmManutListaExecPrevia, TfrmManutListaExecPrevia, False);
end;

procedure TfrmPrincipal.btnPreviaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolhaNormalPrevia,TfrmFolhaNormalPrevia,False);
end;
//edilaine WO19556 : fim

initialization

  // -----------------------------------------------------------------------------------------------

  lss := ExtractFilePath(Application.ExeName);

  if FileExists(lss + 'PDOXUSRS.LCK') then  deletefile(lss + 'PDOXUSRS.LCK');
  if FileExists(lss + 'PARADOX.LCK') then   deletefile(lss + 'PARADOX.LCK');
  if FileExists(lss + 'PDOXUSRS.NET') then  deletefile(lss + 'PDOXUSRS.NET');

  if FileExists(copy(lss, 1, 3) + 'PDOXUSRS.LCK') then  deletefile(copy(lss, 1, 3) + 'PDOXUSRS.LCK');
  if FileExists(copy(lss, 1, 3) + 'PARADOX.LCK') then   deletefile(copy(lss, 1, 3) + 'PARADOX.LCK');
  if FileExists(copy(lss, 1, 3) + 'PDOXUSRS.NET') then  deletefile(copy(lss, 1, 3) + 'PDOXUSRS.NET');

  // -----------------------------------------------------------------------------------------------


  Sistema.NomeModulo      := 'Folha de Benefícios';
  Sistema.IdModulo        := 18;
   Sistema.Versao := '3.05.20m';
  Sistema.NomeAplicativo  := 'Folha de Benefícios';
  IntegraBack             := TIntegraBack.Create(True,True,True);
  Modulo                  := TModulo.Create;

  // -----------------------------------------------------------------------------------------------

  // Alterado por FHBS - 14/06/2019 - SIG83837
  //BRUNO AZEVEDO
  //try
  //  ShellExecute(0,nil,Pchar('c:\windows\system32\regsvr32 c:\cmsolucoes\executaveis\bpl\vcf132.ocx'),nil, nil, SW_NORMAL);
  //except
  //end;
  // Fim - Alterado por FHBS - 14/06/2019 - SIG83837


finalization

  Modulo.free;
  IntegraBack.Free;

end.
{------------------------------------------------------------------------------|
| UNIT: FPRINCIPAL                                                             |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA PRINCIPAL DA FOLHA DE BENEFÍCIOS.                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO                                                      |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 17/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACRESCENTOU-SE O CADASTRO DE LAYOUT DE SAIDA.                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO                                                      |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/02/2002 A 15/02/2002                         |
| VERSÃO PARA LIBERAÇÃO:  3.02.12C                                             |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACRESCENTOU-SE O CADASTRO DE FONTE PAGADORA                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: DAVID AYROLLA                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/02/2002 A 19/02/2002                         |
| VERSÃO PARA LIBERAÇÃO:  3.02.12C                                             |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACRESCENTOU-SE A REFEÊNCIA ÀS UNITS uCmRptManager, uCmCtrlRptFolha E       |
|   FConsultaEstorno. TAMBÉM FOI CRIADO O MÉTODO AppPadraoPrintReportPadrao    |
|   PARA CONTROLE DE RELATÓRIOS NO PADRÃO WEB. FOI ACRESCENTADO, AINDA, O ITEM |
|   DE MENU mnuConsultaEstornos, COM SUA IMPLEMENTAÇÃO.                        |
|   no PROJETO, ACRESCENTAMOS AS UNITS FCosultaEstorno, FMsg, FRelEstorno E    |
|   uCmCtrlRptFolha.                                                           |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/03/2002 A 05/03/2002                         |
| VERSÃO PARA LIBERAÇÃO:  3.02.12E                                             |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ACRESCENTEI A REFERÊNCIA À UNIT UFolhabenef                                |
|   ACRESCENTEI a Chamada a procedure CARREGAPARAMETROS                        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/03/2002 A 14/03/2002                         |
| VERSÃO PARA LIBERAÇÃO:  3.02.12E                                             |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   Inclui a chamada ao Datamodule Drelportformapadrao no                      |
|     AppPadraoCreateFormReports                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/04/2002 A 25/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12k                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA CHAMADA DA CONSULTA AO ELEGÍVEL/PARTICIPANTE PARA VISUALIZAR  |
| INFORMAÇÕES RELATIVAS AO ELEGÍVEL QUE NÃO APARECIAM.                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/05/2002 A 06/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12L                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CHAMADA NO EVENTO AFTERLOGIN DO MÉTODO CARREGA FAIXA DO DTMFOLHA PARA O    |
| PROCESSAMENTO DA PREVIA DE PAGAMENTO PENDENTES.                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/05/2002 A 09/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12o                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - REORGANIZAÇÃO E RENOMEAÇÃO DE ITENS DO MENU CONSULTA                       |
| - CHAMADA PARA A TELA DE PROCESSAMENTO DO PAGAMENTO DE CONVÊNIOS             |
| - CHAMADA PARA A TELA DE CONSULTA DOS PAGAMENTOS DE CONVÊNIOS                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/05/2002 A 10/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12p                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ELIMINAÇÃO DO CADASTRO DE ALTERAÇÃO DE FORMA DE PAGAMENTO, PARA PAGAMENTOS |
|   JÁ EFETUADOS.                                                              |
| - REORGANIZAÇÃO DO MENU CADASTROS, AGORA COM UMA ÚNICA OPÇÃO PARA A          |
|   ALTERAÇÃO DE FORMA DE PAGAMENTO.                                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/05/2002 A 23/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12u                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - FIXAR UMA MÁSCARA PADRÃO PARA CONVERSÃO DE DATAS INDEPENDENTE DO FORMATO   |
| DO WINDOWS.                                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/05/2002 A 23/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12u                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - FIXAR UMA MÁSCARA PADRÃO PARA CONVERSÃO DE DATAS INDEPENDENTE DO FORMATO   |
| DO WINDOWS.                                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alterei a procedure Verifica_Situacao_Empresa  para contemplar os novos    |
|   parametros de integração contábil/financeira da folha                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:  3.02.12o                                             |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclui a chamada ao Datamodule dRelContraCheque no                       |
|     AppPadraoCreateFormReports                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/08/2002 A 22/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi colocado no menu de Cadastros o SubMenu Cadastro de Grupo de Rubricas|
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/01/2003 A 07/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendências 10983, 10984.                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Retirado do Projeto a tela de Associação de      |
|   rubricas por benefício e a Tela de Compensação de IR. (Menu - Cadastros)   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/05/2003 A 05/05/2003                         |
| PENDÊNCIA: 13834, 13835                                                      |
| VERSÃO PARA LIBERAÇÃO: 3.03.05a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DA DISPOSIÇÃO DOS ITENS DE MENU EM SUBMENUS. AÇÃO JUDICIAL E     |
| CONVÊNIOS.                                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/05/2003 A 05/05/2003                         |
| PENDÊNCIA: 13837                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DO MENU DE ACESSO AO CADASTRO DE INFORMAÇÕES INDIVIDUAIS DO      |
| ASSISTIDO PARA INFORMAÇÕES PARA BENEFÍCIO EM MANUTENÇÃO.                     |
| CRIAÇÃO DE MENU PARA ITENS RELACIONADOS A RUBRICAS                           |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/05/2003 A 05/05/2003                         |
| PENDÊNCIA: 13838                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DO MENU DE ACESSO AO CADASTRO DE ASSOC RUB POR FAV POR CONTA     |
| CORRENTE PARA CONTA BANCÁRIA.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/06/2003 A 03/06/2003                         |
| PENDÊNCIA: 14017                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05d                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| ACESSO A TELA PARA GERAR ARQUIVO DE SIMULAÇÃO DE ARQUIVO BANCARIO DA PREVIA. |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/07/2003 A 03/07/2003                         |
| PENDÊNCIA: 14421                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - não usar mais a tela de escolha de fundação pois o padrão abre uma tela    |
| automaticamente.                                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2003 A 09/07/2003                         |
| PENDÊNCIA: 14477                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07d                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - NÃO PERMITE ALTERAÇÃO DA SEGUNDA VIA DE CONTRA-CHEQUE.                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2003 A 11/07/2003                         |
| PENDÊNCIA: 14516                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07i                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR A CARGA DAS FAIXAS APÓS ESCOLHA DA FUNDACAO.                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2003 A 11/07/2003                         |
| PENDÊNCIA: 14515                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR NOMENCLATURA PARA ESTADOS E MUNICÍPIOS.                            |
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
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/12/2005 A 19/12/2005                         |
| PENDÊNCIA: 21082                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Inclusão do menu Conjunto de rubrica             |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}

