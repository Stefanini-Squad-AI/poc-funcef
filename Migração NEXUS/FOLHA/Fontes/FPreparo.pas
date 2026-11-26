// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 193762 - KTN 1849855 
//Responsável : Higor Nayde Ferreira
//Data        : 02/01/2013
//Descrição   : O sistema está gravando o código incorreto do titular na tabela 
//			    HSTCONTRIBPREV durante a rotina de processamento do preparo no 
//			    módulo Folha de Benefícios. Por tal motivo, o módulo de Benefício 
//			    Previdenciário não está alimentando o histórico de taxa 
//			    administrativa corretamente.
//--------------------------------------------------------------------------------
//Pendência   : SOL 197395 - KTN 1890667 
//Responsável : FERNANDO XAVIER
//Data        : 26/12/2012
//Descrição   : Retirada dos processamento de reajuste dos benefícios
//--------------------------------------------------------------------------------
//Pendência   : SOL 63067 - KTN 524520
//Responsável : FERNANDO XAVIER
//Data        : 12/01/2012
//Descrição   : Cadastro Previdenciário - Resgate de Contribuições
//--------------------------------------------------------------------------------
//Pendência   : SOL 140042/6601 Kintana
//Responsável : BRUNO AZEVEDO
//Data        : 27/09/2011 - Demanda resolvida em Brasília.
//Descrição   : Alterado o tipo de campo que cadastra o mes de reembolso. Ajustado a
//              obrigatoriedade para quando o campo for permanente e ajuste na prévia
//              para tratar o campo igual ao campo mes referencia para quando
//              estiver em branco e for permanente.
//------------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
//Pendência   : SOL 163247 KINTANA 1392627
//Responsável : BRUNO AZEVEDO
//Data        : 15/08/2011
//Descrição   : Ajuste no caminho do log gerado.
//------------------------------------------------------------------------------
//Pendência   : SOL 86089 KINTANA 523183
//Responsável : BRUNO AZEVEDO
//Data        : 18/10/2010
//Descrição   : Gravar o campo "LoteOriginal" ao inserir na Hstbenefbfciario.
//--------------------------------------------------------------------------------
//Pendência   : SOL 147427 KINTANA 1055088
//Responsável : BRUNO AZEVEDO
//Data        : 08/12/2010
//Descrição   : Ao desfazer o preparo, atualizar as entidades filtrando pelo seqproposta.
//--------------------------------------------------------------------------------
//Pendência   : SOL 150074 Kintana 1085066
//Responsavel : Renato Visoni
//Descrição   : Erro ao rodar o Preparo.
//--------------------------------------------------------------------------------
//Pendência   : SOL 147514 Kintana 1021433
//Responsavel : Fernando Santana
//Descrição   : Idetificamos que quando o assistido pussui dois planos estava buscado
//              a mesma rubrica para ambos.
//--------------------------------------------------------------------------------
//Pendência   : SOL 144908 Kintana 962232
//Responsavel : Fernando Santana
//Descrição   : Passei o idpessoa na sql query qryValorNucleo,
//--------------------------------------------------------------------------------
//Pendência   : SOL 137372 Kintana 896062
//Responsavel : Renato Visoni
//Descrição   : No preparo da folha de Benefícios, o sistema não está cobrando
// tx Administrativa/Contribuição para quem tem mais que 1 participante no grupo familiar.
//--------------------------------------------------------------------------------
//Pendência   : SOL 140974 KINTANA 889580
//Responsável : BRUNO AZEVEDO
//Data        : 05/08/2010
//Descrição   : Correção na atualização de Dependentes. Salvar Previa\Efet\Preparo na rede.
//--------------------------------------------------------------------------------
//Pendência   : SOL 139360 Kintana 855933
//Responsável : Renato Visoni
//Data        : 08/07/2010
//Descrição   : Algumas contribuições não estavam sendo inseridas devido ao erro na Procedure.
//--------------------------------------------------------------------------------
//Pendência   : SOL 139172 KINTANA 852659
//Responsável : BRUNO AZEVEDO
//Data        : 05/07/2010
//Descrição   : Verificar o campo FLGREFERENCIA da variavel para inserir a contribuição.
//--------------------------------------------------------------------------------
//Pendência   : SOL 137382 KINTANA 830194
//Responsável : BRUNO AZEVEDO
//Data        : 09/06/2010
//Descrição   : Verificar o campo FLGREFERENCIA da query para inserir a contribuição.
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Passos
// Data        : 26/02/2010
// Rotina      : GravaHstPerc
// Pendência   : SOL 32837  Kintana  660515
// Descricao   : Gerando historico de percentual do grupo familiar no encerramento do beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 01/10/2009
// Rotina      : regPreparoContrib
// Pendência   : SOL 111112 Kintana 512262
// Descricao   : Implementação do campo TIPOPREPARO na Query de entrada da Regra
//               regPreparoContrib.
// -----------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 04/01/2010
// Rotina      : ReajustaBenefConc
// Pendência   : SOL 129027
// Descricao   : Favor ajustar a Qry de acerto de benefícios e incluir o campo IDPLANOCONTABIL
//               na Qry de entrada da regra 24424, do preparo de Benefícios.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 16/11/2009
// Rotina      : VerificaDuplicidadeLotes
// Pendência   : SOL 127182 Kintana 671855
// Descricao   :Identificamos assistidos que estão em 2 planos contabeis e recebem
// devolução de contribuição/Taxa adm referente ao adiantamento do 13º salário.
// Para esses assistidos na devolução somou-se os 2 valores e lançou cada valor
// somado em um plano, ficando assim com a devolução incorreta.
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Passos
// Data        : 10/11/2009
// Rotina      : CalculaEnviaContribuicaoIndividual
// Pendência   : SOL 124272 Kintana 649353
// Descricao   : Inclusão do Campo IDPLANPREVCONTAB na query de Entrada
// *****************************************************************************
// Autor(a)    : Gustavo Terra / Thiago Passos
// Data        : 12/11/2009
// Pendência   : SOL 127088 Kintana 670261
// Descricao   : Ajuste para corrir a geração de benefício em duplicidade.
//                Inclusão do idbeneficio e fonte pagadora na função que verifica
//                se o benefício já foi gerado.
//-------------------------------------------------------------------------------------------------

// *****************************************************************************
// Autor(a)    : Renato Visoni
// Data        : 27/10/2009
// Pendência   : SOL 126249 Kintana 658263
// Descricao   : O abono anual FUNCEF para assistidos com concessão no mês 11/2009,
//               estavam sendo gerados pela folha ficando em duplicidade com a geração do
//               processo de concessão.
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 09/11/2009
// Pendência   : SOL 126894 - KINTANA 667862
// Descricao   : Erro de Constraint no Preparo.
// -------------------------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 16/07/2009
// Rotina      : InsereHstBfciario e RetornaConsultaTodos 
// Pendência   : SOL 120978 KINTANA 579438
// Descricao   : Os benefícios INSS fora do convênio, na folha de NOV (abono), os
// valores antecipados em AGOSTO não estavam sendo lançados como devolução e isso
// gerava erro.
//------------------------------------------------------------------------------
// Autor(a)     : Daniel Begnami
// Data        : 29/07/2009
// Rotina      : Diversas
// Pendência   : SOL 121236
// Descricao   : Considerar as contribuições a cobrar (FLGCOBRA) e levar em conta tambem
//               A Data Final da Contribuição DATAFINAL. Quando a data final da Contribuição
//               for menor que o mes referencia nao cobrar a contribuição.
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
//Autor(a)    : Renato Visoni
// Data        : 06/01/2009
// Rotina      : ReajustaBenefConc
// Pendência   : SOL 105225  KINTANA 471094
// Descricao   : O sistema estava passando um parametro para a funcao que nao existia.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/03/2008
// Rotina      : RetornaConsultaReajusteSuplementacao
// Pendência   : 27589
// Descricao   : Ajuste no preparo para fazer o reajuste de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 05/12/2007
// Rotina      : RetornaConsultaReajusteSuplementacao
// Pendência   : 27165
// Descricao   : Ajuste no preparo para fazer o reajuste de beneficio 
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 19/12/2007
// Rotina      : ProximoProcessoBeneficio
// Pendência   : 27123
// Descricao   : Ajuste no preparo que não estava acumulando o valor do beneficio 
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 20/11/2007
// Rotina      : ProximoProcessoBeneficio
// Pendência   : 26923
// Descricao   : Ajuste qdo o Valor do Beneficio for 0 o preparo não se perder 
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 20/11/2007
// Rotina      : BuscaLancaAbonoBeneficioProcessados
// Pendência   : 26823
// Descricao   : Incluir na busca Antecipação de Abono de Revisão 
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 22/08/2007
// Rotina      : ProcessaBeneficios, RetornaConsultaDependentes,
//               RetornaConsultaReajusteNoAbono, RetornaConsultaReajusteINSS,
//               RetornaConsultaReajusteSuplementacao
// Pendência   : 25662
// Descricao   : Passa parâmetro de DataInicioFund para regra de reajuste.
//               Ajuste nas consultas que não obtinham o campo DATAINICIOFUND.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/07/2007
// Rotina      : ProcessaBeneficios
// Pendência   : 25861
// Descricao   : Ajuste no Preparo qdo o Mes Pagamento de Abono não estiver preenchido
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 05/12/2006
// Rotina      : ProximoProcessoBeneficio
// Pendência   : 23851
// Descricao   : Gravar o mês de abono no registro do salário virtual,
//   no preparo de Abono
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 16/11/2006
// Rotina      : BuscaLancaAbonoContribuicaoProcessados
// Pendência   : 23754
// Descricao   : Acertar a gravação do numrecebimento da Tmpdesc nos casos de
//   devolução de contribuição sobre antecipação de abono. Passou a usar o
//   numrecebimento gravado na Hstcontribprev.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/10/2006, 24/10/2006
// Rotina      : várias
// Pendência   : 23367
// Descricao   : Tratar busca de valores de pagamento de abono para no encerra-
//   mento de pensionistas, em mês subsequente ao mês de pagamento de abono anual.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 10/10/2006
// Rotina      : EnviaContribuicao
// Pendência   : 22907 (reabertura)
// Descricao   : Gravar corretamente na Tmpdesc os campos FLGATRASODEVOL e FLGDESCONTO
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 12/09/2006
// Rotina      : EnviaContribuicao
// Pendência   : 22907
// Descricao   : Gravar motivo referente ao abono na Tmpdesc e na Hstcontribprev
//               quando da devolução ou processamento normal.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 24/04/2006
// Rotina      : InsereHstbenefbfciario
// Pendência   : 14461
// Descricao   : Colocar os registros de INSS referência no lote como se fazia
//               antes da alteração desta pendência. Como estava ficando sem
//               lote o desfazer preparo não reconhecia, apenas se marcasse
//               desfazer retidos.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 21/02/2006
// Rotina      : Gravação do Histórico de Benefícios
// Pendência   : 19772
// Descricao   : Gravar no histórico de benefícios o percentual do cota do
//               pensionista no grupo familiar.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/01/2006
// Rotina      : Encerramento de Benefícios
// Pendência   : 20913
// Descricao   : No encerramento de benefícios temporários colocar motivo
//               7-Outros.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/01/2006 a 20/01/2006
// Rotina      : Ajuste contadores de benefícios e contribuição
// Pendência   : 19471
// Descricao   : Ajuste nos contadores de benefício e contribuição separando
//               a contagem de benefícios retidos.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/01/2006
// Rotina      : Várias, controle do tempo
// Pendência   : 20914
// Descricao   : Alteração exibição dos tempos do processo, pois a rotina
//               TempoDecorrido retorna em branco quando o processo se inicia
//               num dia e termina no seguinte.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/12/2005 a 13/01/2006
// Rotina      : BuscaAbonoContribuicaoTemporario
// Pendência   : 20922
// Descricao   : Busca das contribuições não gravou corretamento o flgdevolucao
//               quando existem registros a cobrança e de devolução já
//               processados. Acertar a gravação do numrecebimento da Tmpdesc
//               nestes casos, pois ficaram diferentes da Hstcontribprev
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Seleção de lote
// Pendência   : 21076
// Descricao   : Ao digitar o lote desejado não atualiza os dados do lote na tela.
//               Só atualizava se fosse selecionado na lista.
//               Controle no cálculo da contribuição se não preparou benefício.
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
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Diversas
// Pendência   : 19741
// Descricao   : Permitir a individualização do convênio de INSS.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Tratamento de Antecipação de Abono
//  Data       : 30/11/2005 a 13/12/2005
//  Pendencia  : 17977
//  Alteração  : Usar FLGTipoRegistro da Hstbenefbfciario para identificar
//               antecipações de abono anual e fazer as devidas compensações.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Várias
//  Data       : 16/11/2005 a 06/12/2005
//  Pendencia  : 17200
//  Alteração  : Controlar limite de valor e de percentual no preparo de benefí-
//               cio. Caso o novo valor ultrapasse estes limites deve-se reter o
//               benefício e emitir mensagem no log.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 06/12/2005
// Rotina      : CalculaEnviaContribuicaoIndividual
// Pendência   : 20930
// Descricao   : Passar no campo ValorIntegral do sql de entrada da regra de
//               cálculo de contribuição, o valor integral e não mais o valor
//               total do benefício.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 05/12/2005
// Rotina      : CalculaEnviaContribuicaoIndividual
// Pendência   : 20930
// Descricao   : Passar no campo DataInicioAnt do sql de entrada da regra de
//               cálculo do benefício a ser pago no abono o campo DibBenefAnt
//               na BenefBfCiario da linha do novo benefício, isso se o campo
//               estiver preenchido.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : CalculaEnviaContribuicaoPensionista
//  Data       : 09/11/2005
//  Pendencia  : 20871
//  Alteração  : No cálculo da contribuição de pensionista, tratar o mês
//               referência do abono anual para obter os valores do benefício a
//               ser passado para a regra.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : BuscaAbonoContribuicaoTemporario
//  Data       : 27/10/2005
//  Pendencia  : 20598
//  Alteração  : No encerramento de benefício temporário, sempre efetuar as de-
//               voluções das contribuições patronais sobre abono anual já pago.
//------------------------------------------------------------------------------
unit FPreparo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
  Wwquery, checklst, Spin, ComCtrls, Gauges, TB97Tlbr, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, uSistema, URegra,
  fcButton, fcImgBtn, fcShapeBtn, TB97Tlwn, wwdbdatetimepicker,
  CMDateTimePicker, uIntegraBack, UContribuicaoPrevFB, wwdblook, DBCtrls,
  uFuncoesFolha, UMensErro, UFuncoesUteisFB, DBaseDados,DFolha,
  UParticipante, UDataBase, DAPrev, uBeneficioFolha, MontaSelect, uObjFolha,
  uDesfazerPreparo, fFrameLista, uConstFolha, uCtrlBenefBfciario, uAdmPrevFB;

type
  TfrmPreparo = class(TfrmOkCancelar)
    pnlInformacoes: TPanel;
    pnlOpcoes: TPanel;
    qryPatro: TwwQuery;
    qryBenef: TwwQuery;
    qryPlano: TwwQuery;
    qryAux2: TwwQuery;
    SaveDlg: TSaveDialog;
    qryAuxReserva: TwwQuery;
    pgcOpcoes: TPageControl;
    tbsOpcoes: TTabSheet;
    tbsResultado: TTabSheet;
    qryPreparosAnt: TwwQuery;
    dsPreparosAnt: TwwDataSource;
    qryBeneficio: TwwQuery;
    qryUpdUltPgto: TwwQuery;
    qryUpdBenefBfciario: TwwQuery;
    qryInsHstBfciario: TwwQuery;
    qryBenefBfciario: TwwQuery;
    qryUltPgto: TwwQuery;
    qryUpdHstBfciario: TwwQuery;
    qryReajBeneficio: TwwQuery;
    qryReajINSS: TwwQuery;
    qryContribAssistido1: TwwQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    chklstBenef: TCheckListBox;
    PnlBeneficio: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    chklstPatro: TCheckListBox;
    PnlPatrocinadora: TPanel;
    chklstPlano: TCheckListBox;
    PnlPlano: TPanel;
    Splitter2: TSplitter;
    qryAntecipacaoAbono: TwwQuery;
    qryRetidos: TwwQuery;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    qryPreparoContrib: TwwQuery;
    qryReajuste: TwwQuery;
    chkreferencia: TCheckBox;
    qryUpdBenefbfciarioAbono: TwwQuery;
    regPreparoContrib: TRegra;
    qryTitularGrupo: TwwQuery;
    QryPrinc: TwwQuery;
    btnCommit: TButton;
    qryBeneficioAnterior: TwwQuery;
    qryprocreajuste1: TwwQuery;
    qryproccargoext1: TwwQuery;
    qryContribIndividual: TwwQuery;
    qryContaContrib: TwwQuery;
    qryCtrlInterface: TwwQuery;
    Label3: TLabel;
    Panel2: TPanel;
    lblDescLote: TLabel;
    cmbLote: TwwDBLookupCombo;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbtDescricao: TDBText;
    dbtMesref: TDBText;
    dbtDataPagto: TDBText;
    dbtDatacria: TDBText;
    dsCtrlinterface: TDataSource;
    ToolbarSep972: TToolbarSep97;
    bbtnOutro: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    bbtnPreparo: TBitBtn;
    qryGravasalauxdoenca: TwwQuery;
    Panel7: TPanel;
    PnlProgress: TPanel;
    lblTitLote: TLabel;
    Mensagem: TLabel;
    lblPatro: TLabel;
    lblContagem: TLabel;
    ProgressBar1: TProgressBar;
    memResult: TMemo;
    qryValorNucleo: TwwQuery;
    qryContribNucleo: TwwQuery;
    qryPercentual: TwwQuery;
    Panel8: TPanel;
    Panel9: TPanel;
    RdgTpFolha: TRadioGroup;
    qryPercAnterior: TwwQuery;
    qryaux3: TwwQuery;
    tbsIndividual: TTabSheet;
    frameBenef: TfrmFrameListaBenef;
    cboxIndividual: TCheckBox;
    qryAux4: TwwQuery;
    qryAux5: TwwQuery;
    qryBeneficiario: TwwQuery;
    qryAux6: TwwQuery;
    bbtnSavlar: TBitBtn;
    ToolbarSep975: TToolbarSep97;
    QryVerifica: TQuery;
    QryAux: TwwQuery;
    procedure bbtnPreparoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure chklstPlanoClickCheck(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PnlPatrocinadoraClick(Sender: TObject);
    procedure PnlPlanoClick(Sender: TObject);
    procedure PnlBeneficioClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure RdgTpFolhaClick(Sender: TObject);
    procedure cmbLoteChange(Sender: TObject);
    procedure bbtnOutroClick(Sender: TObject);
    procedure cboxIndividualClick(Sender: TObject);
  private
    { Private declarations }
    sDataCobranca : string;
    bCommitParcial : boolean;
    bTravaCommit: boolean;

    //variaveis usadas no processamento de contribuicoes
    lordem,
    lcontOK,
    lcontERRO,
    lcontZERO : longint;

    wAno : Word; 
    EncerrarProcessamento:boolean;
    iPosicao : longint;
    smsgerro,
    sNomepatro, sNomeplano, sidpatro, sidplano,
    sMesAbono,
    sMesReferencia,
    sMesAnterior,
    sUltIdBeneficio,
    sUltIdPessJur,
    sUltIdPlanoPrev,
    sDataInscFund,
    sValorAtualBenef,
    sValorIntegralBenef,
    sValorTotalBenef,
    sIdRegraCalculo,
    sDia,
    sData1,
    sData2,
    sDATARef,
    sValorReserva,
    sValorUltBenef,
    sSALPART,
    sREMTOTAL,
    sPatroSel,
    sPlanoSel,
    sPagador,   
    sBenefSel : string;

    iBenefProc,iBenefProcTotal,
    iBenefErro, iBenefErroTotal, 
    iBenefRetido,iBenefRetidoTotal,
    iContribRetido,iContribRetidoTotal, 
    iContribProc,iContribProcTotal : Integer;

    iBenefAbono,iBenefAbonoTotal,
    iContribAbono,iContribAbonoTotal : Integer;
    iBenefDevAbono,iBenefDevAbonoTotal,
    iContribDevAbono,iContribDevAbonoTotal : Integer;

    ListaBenef,
    ListaPlano,
    ListaPatro : TStringList;

    IdTitularUltPgto,
    iUltFlgReferencia,
    iUltSitBeneficio,
    iUltIDPESSJUR,
    iUltIDPLANOPREV,
    iUltIDBENEFICIO,
    iUltIDPLANOORIGEM, 
    iUltNumeroProcesso,
    iUltNProcPrincipal,
    iUltIdBenefPrincipal,
    iUltIdRubAuxDoenca,
    iIdLote,
    iTotalBeneficiarios,
    Contador                 : integer;
    tInicio, tFim, tInicioPatro: tdatetime;
    sIdLoteGravado           : string;
    bErroRegra,
    bExcecao,
    bErro                    : boolean;

    sultNumProcesso : String; // Renato Visoni SOL 139360 Kintana 855933
    
    bUltFlgVirtual: boolean;

    iUltIdTitular,          //id do titular associado ao beneficiario que será base para se calcular as contribuicoes
    iUltIdPessoa : integer; //id do beneficiario que será base para se calcular as contribuicoes

    iRespNucleoCorrente: integer;
    //GUARDA MATRICULA DO BENEFICIARIO PROCESSADO
    sUltMatricula: string;

    iNucleoFamiliar: integer;

    //OBTEM ISENÇÃO DE IR PARA NÃO ABRIR RUBRICAS DE AÇÃO JUDICIAL
    iIsentoIRRF: integer;

    //NECESSARIO PARA PASSAR VALOR INTEGRAL PARA REGRA DE CALCULO DE CONTRIBUICAO
    dbTotalIntegral,  // valor total integral dos beneficios
    dbTotalBenef,     // valor total de beneficios para um beneficiario
    dbValorAtualInss, 
    dbTotalBenefInss, 
    dbTotalIntegralInss, 
    dUltValSalAuxDoenca,
    dbValor : double; // valor do beneficio sendo processado

    //PARA RECALCULO DO BENEFICIO DE SUPLEMENTACAO QUANDO
    //    OCORRE REAJUSTE DE INSS OU DE SUPLEMENTACAO
    dValorINSS: double;
    bRecalculaBeneficio: boolean;

    {ARMAZENA A DATAINICIO E DATAFINAL PARA TRATAMENTO DO ULTIMO PAGAMENTO
     DO BENEFICIO E CALCULO DA ULTIMA COBRANCA DE CONTRIBUICAO}
    osDataInicio, osdatafinal : string;

    wHora, wMin, wSeg, wMSeg : word;

    iUltimaContrib : longint;

    listaParamFinan : tstringlist;

    iEstaEmUltimoPagamento : integer;
    {0 - NAO ESTA EM FINAL DO BENEFICIO
     1 - ESTA NA DATA EFETIVA DE ENCERRAMENTO DO BENEFICIO
     2 - ESTA NA DATA PREVISTA DE ENCERRAMENTO DO BENEFICIO}

    //VARIAVEIS PARA TRATAR CALCULO DE CONTRIBUICAO SOBRE ABONO ANUAL
    bGeraAbono : boolean;
    dValorAbono : double;
    prValorBenef : double;
    rProRata: real;
    asTipoFolhaContrib: string;

    lstContribuicao: tListaContribuicao;
    FFaseGrupoEncerramento: boolean;

    gsMesesAdiantado: string; //GUARDA MESES COM ADIANTAMENTO DE ABONO DE BENEFICIO PARA BUSCAR AS CONTRIBUIÇÕES
    gbBuscaAntecipAbono: boolean; //CONTROLA SE EXECUTA A BUSCA DOS ADIANTAMENTOS DE ABONO

    gsMesesPagamentoAbono: string; //GUARDA MESES COM PAGAMENTO DE ABONO DE BENEFICIO TEMPORÁRIO PARA BUSCAR AS CONTRIBUIÇÕES
    giultflgbeneftemp: integer; 
    gimespgabono: integer; 

    gbRetemBeneficio: boolean; 

    ListaSQL : TStringList; //Renato Visoni SOL 137372

    function CheckLimiteBeneficio(
               arvalorcorrente,
               arvalornovo,
               arvalorlimite,
               arperclimite: real): integer;
    // Retorno:
    //  1 - ultrapassou limite
    //  2 - ultrapassou percentual

    function AtualizaSituacaoBeneficio(
      aqryBeneficio, aqryaux: twwquery;
      aIdSitBeneficio: integer;
      var asMsgErroBanco: string): boolean;

    function ForcaRetencaoPorLimite(
      aqryBeneficio, aqryaux: twwquery; arvalorNovo: real): boolean;

    procedure InsereHstBfciario(
      aqryexec: twwquery;
      aitipopreparo: integer;
      aiidtitular: integer;
      aiidpessoa: integer;
      aiidpessjur: integer;
      aiidplanoprev: integer;
      aiidplanoorigem: integer;
      aiidbeneficio: integer;
      ainumeroprocesso: integer;
      asmespagamento: string;
      asmesabono: string;
      asdatapagamento: string;
      aiseqproposta: integer;
      aiseqbenef: integer;
      aisitbeneficio: integer;
      aiidlote: integer;
      aifontepagadora: integer;
      aicodportforma: integer;
      aiflgprovisorio: integer;
      aiflgdescirmes: integer;
      aiflgdevolucao: integer;
      asidregra: string;
      asvlrprev: string;
      asvlrcalc: string;
      asvlrintegral: string;
      asvlrtot: string;
      asvlrsrb: string;
      asvalorop1: string;
      asvalorop2: string;
      asvalorop3: string;
      aitiporeg: integer; 
      aiflgtiporegistro: integer; 
      aiflgreferencia: integer; 
      aiflgpagainss: integer; 
      aiflgpagainssbenef: integer; 
      aiflgstatus: string; 
      arpercentual: real; 
      var asidlotegravado: string      );

    //function ReajustaBeneficioMensal(var dValorReal:Double;dValorCotas:Double):boolean; // SOL 197395 - KTN 1890667

    function RetornaConsultaTodos(abApenasGrupoEncerramento: boolean; bResgateParcelado : boolean = false) : string;

    function RetornaConsultaDependentes : string;
    //function RetornaConsultaReajusteNoAbono: string;  // SOL 197395 - KTN 1890667
    //function RetornaConsultaReajusteINSS: string;  // SOL 197395 - KTN 1890667
    function RetornaConsultaResgateparcelado: string; // SOL 63067 - KTN 524520

    //function RetornaConsultaReajusteSuplementacao(abReajustouInss: Boolean): string; // SOL 197395 - KTN 1890667

    procedure GravaResultadoProcessoBeneficio;
    function InicializaProcessoBeneficio(ssql : string) : boolean;

    procedure PassoProcessoBeneficio(breajuste: boolean);
    function ExecutaRegraProcessoBeneficio : boolean;
    function GravaProcessoBeneficio(var abPreparouBeneficio: boolean): boolean; 

    procedure ProximoProcessoBeneficio(bcalcula: boolean);
    function ProcessaBeneficios : boolean;
    procedure CalculaEnviaContribuicaoIndividual(asMesContrib : string;
      adTotalBenef, adTotalIntegral, adTotalBenefINSS, adTotalIntegralINSS : double);
    
    procedure CalculaEnviaContribuicaoPensionista(asMesContrib : string);

    procedure AtualizaLote;

    procedure FiltraBenefMesPorTipoFolha(flgTipoFolha : integer;
      bbenefXcontrib : boolean; var ssql : string);
    function PegaDataFinal : string;

    procedure DeterminaPatroSel;
    procedure DeterminaPlanoSel;
    procedure DeterminaBenefSel;
    procedure MontaListaPatro;
    procedure MontaListaPlano;
    procedure MontaListaBenef;

    function GeraAbonoUltimoPgto(
      pidregracalculo,
      pidpessjur,
      pidplanoprev,
      pidplanoorigem,
      pidbeneficio,
      pseqproposta,
      pnumeroprocesso,
      pidsitbeneficio,
      pfontepagadora,
      pcodportforma,
      pflgbeneftemp,
      pidtitular,
      pidpessoa: integer;
      psnomebenef,
      psbeneficio,
      psflgcalctodomes,
      psflgprovisorio,
      psflgdescirmes,
      psflgdevolucao,
      psvaloratual,
      psvalortotal,
      psvalorsrb,
      psvalorcalculado,
      psvalorbase1,
      psvalorbase2,
      psvalorbase3: string;
      pdatainicio,
      pdatafinal: tdatetime;
      pimespgabono: integer; 
      prpercentual: real 
      ): real;

    //NOVA ROTINA COM TRATAMENTO DIFERENCIADO PARA ENCERRAMENTO DE PENSIONISTA
    function TrataUltimoPagtoGrupoFamiliar(
               aqryProcesso: twwquery;
               aqryGrupo: twwquery;
               aqryAux: twwquery;
               asvaloratualbenef: string;
               asvalortotalbenef: string;
               aidlote: integer;
               asmesreferencia: string;
               advalortotalinss: double;
               advaloratualinss: double;
               var abcomerro: boolean
              ): double;

    function TrataUltimoPagto(
               aqryProcesso: twwquery;
               aqryGrupo: twwquery;
               aqryAux: twwquery;
               asvaloratualbenef: string;
               asvalortotalbenef: string;
               aidlote: integer;
               asmesreferencia: string;
               advalortotalinss: double;
               advaloratualinss: double;
               var abcomerro: boolean
              ): double;

    
    function DeterminaMotivoEncerramento(
      asfrequencia: string; adatanasc: tdatetime): string;

    function GravaHstBeneficio : boolean;
    procedure GravaContribuicao(arcontrib, arperccalc: real; bpensao: boolean);

    //Envio de contribuicao para Tmpdesc
    function EnviaContribuicao(qryAux: TwwQuery; arcontrib: real;
      aiidplanoprev, aiidcontribuicao,
      aiidtitular, 
      plOrdem, plNumRecebimento: longint; iAcaoJud: Integer;
      aicobdevol: integer; //0-cobrança, 1-devolução
      sRubDevAdiant13: String = '-1';
      aiidmotivo: integer = 0 
      ) : boolean;
    
    procedure CriaQryLote;

    procedure LimpaAmbiente;

    function CalculaProRata(asdatafinal: string): real;

    function ExecutaRegraBeneficioMinimo(
      pidpessjur,
      pidplanoprev,
      pidbeneficio,
      pidtitular,
      pidpessoa: integer;
      psflgcalctodomes: string;
      pdatainicio,
      pdatafinal: tdatetime;
      arValorBenef: real): real;

    procedure BuscaLancaAbonoBeneficioProcessados(
      pidregracalculo,
      pidpessjur,
      pidplanoprev,
      pidplanoorigem,
      pidbeneficio,
      pseqproposta,
      pnumeroprocesso,
      pidsitbeneficio,
      pfontepagadora,
      pcodportforma,
      pidtitular,
      pidpessoa: integer;
      psnomebenef,
      psbeneficio,
      psflgcalctodomes,
      psflgprovisorio,
      psflgdescirmes,
      psflgdevolucao,
      psvaloratual,
      psvalortotal,
      psvalorsrb,
      psvalorcalculado,
      psvalorbase1,
      psvalorbase2,
      psvalorbase3: string;
      prpercentual: real 
    );
    procedure BuscaLancaAbonoContribuicaoProcessados(
      pidplanoprev,
      pidtitular,
      pidpessoa: integer;
      psnomebenef: string
    );
    
    procedure BuscaAbonoBeneficioTemporario;
    procedure BuscaAbonoContribuicaoTemporario;

    procedure SetFaseGrupoEncerramento(const Value: boolean);

    function ExecutaRegraUltimoPagamento(
               airegra: integer;
               asnomebeneficiario: string;
               asnomebeneficio: string;
               asidpessjur: string;
               aiidtitular: integer;
               aiidbeneficio: integer;
               asvaloratual: string;
               asvalorreferencia: string;
               asdataref: string;
               asvalortotal: string;
               arpercentual: real;
               asdatainicio: string;
               asdatafim: string;
               ainumbenef: integer;
               asvalorinfinss: string;
               asflgbenefmin: string;
               asidsitpart: string;
               asidsitplanoprev: string;
               asidsitfunc: string;
               asidplanoprev: string;
               astemposervtotal: string;
               var arvalor: double
               ): boolean;

    function ExecutaRegraCalculoRateio(
               airegra: integer;
               asnomebeneficiario: string;
               asnomebeneficio: string;
               asidpessjur: string;
               aiidtitular: integer;
               aiidbeneficio: integer;
               asvaloratual: string;
               asvalorreferencia: string;
               asdataref: string;
               asvalortotal: string;
               arpercentual: real;
               asdatainicio: string;
               asdatafim: string;
               ainumbenef: integer;
               asvalorinfinss: string;
               asvalortotalinss: string;
               asflgbenefmin: string;
               asidsitpart: string;
               asidsitplanoprev: string;
               asidsitfunc: string;
               asidplanoprev: string;
               astemposervtotal: string;
               arvalorbase1: real;
               arvalorbase2: real;
               arvalorbase3: real;
               asflgcalctodomes: string;
               var arvalor: double
               ): boolean;

    function ExecutaRegraPrimeiroPagamento(
               airegra: integer;
               asnomebeneficiario: string;
               asnomebeneficio: string;
               asidpessjur: string;
               aiidtitular: integer;
               aiidbeneficio: integer;
               asvaloratual: string;
               asvalorreferencia: string;
               asdataref: string;
               asvalortotal: string;
               arpercentual: real;
               asdatainicio: string;
               asdatafim: string;
               ainumbenef: integer;
               asvalorinfinss: string;
               asflgbenefmin: string;
               asidsitpart: string;
               asidsitplanoprev: string;
               asidsitfunc: string;
               asidplanoprev: string;
               astemposervtotal: string;
               var arvalor: double
               ): boolean;

    function DefineSituacaoBeneficio(
               flddatafim: tdatetimefield;
               flddatafimprevista: tdatetimefield;
               asmesref: string;
               aiidsitbeneficio: integer): integer;

    procedure AtualizaDadosLote;

    procedure InicializaContadores(abtotais: boolean);
    procedure IncrementaTotais;

    Function RetornaIdTitular(idPessoa:String;idPlanoPrev:String) : String;
    Function NaoExisteHSTBENEFBFCIARIO(sSQL: String) : Boolean; //Renato Visoni SOL 126894 - KINTANA 667862
    Function NaoExisteHSTCONTRIPREV(sSQL: String) : Boolean; //Thiago Passps SOL  KINTANA
    procedure GravaHstPercGrupo(idtitular:string;idpessoa:string;idpessjur:string;idplanoprev:string;idbeneficio:string;percentual:string;fontepagadora:string);

  public
    { Public declarations }
    CtrlBenefBfciario: TCtrlBenefBfciario; //RECALCULAR PERCENTUAL DO GRUPO FAMILIAR
    property FaseGrupoEncerramento: boolean read FFaseGrupoEncerramento write SetFaseGrupoEncerramento;

  end;

var frmPreparo: TfrmPreparo;

implementation
 var sSQLValida : String; //Renato Visoni SOL 126894 - KINTANA 667862
{$R *.DFM}

procedure TfrmPreparo.DeterminaPatroSel;
begin
  MontaFiltro(chklstPatro, ListaPatro, sPatroSel);
end;

procedure TfrmPreparo.DeterminaPlanoSel;
begin
  MontaFiltro(chklstPlano, ListaPlano, sPlanoSel);
end;

procedure TfrmPreparo.DeterminaBenefSel;
begin
  MontaFiltro(chklstBenef, ListaBenef, sBenefSel);
end;

procedure TfrmPreparo.MontaListaPatro;
begin
  chklstPatro.items.clear;
  ListaPatro.clear;
  while not qryPatro.eof do
  begin
    chklstPatro.items.add(qryPatro.fieldbyname('Nome').asstring);
    ListaPatro.add(qryPatro.fieldbyname('IdPessoa').asstring);
    qryPatro.Next;
  end;
end;

procedure TfrmPreparo.MontaListaPlano;
 var i : integer;
     sSQL : string;
begin
  DeterminaPatroSel;

  chklstPlano.items.clear;
  ListaPlano.clear;

  sSQL:='SELECT DISTINCT PP.IDPLANOPREV, PP.NOME '+_clinefeed+
        'FROM PLANPREV PP, PLANPREVPATRO PPP, PATRO PAT '+_clinefeed+
        'WHERE (PP.IDPLANOPREV = PPP.IDPLANOPREV) '+_clinefeed+
        'AND (PPP.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
        'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed;

  if (sPatroSel <> '') then
    ssql:=ssql+'AND (PPP.IDPESSJUR IN (' + sPatroSel + ')) '+_clinefeed;

  ssql:=ssql+'ORDER BY PP.NOME'+_clinefeed;

  qryPlano.close;
  qryPlano.SQL.Clear;
  qryPlano.SQL.Add(sSQL);
  qryPlano.open;

  while not qryPlano.eof do
  begin
    chklstPlano.items.add(qryPlano.fieldbyname('Nome').asstring);
    ListaPlano.Add(qryPlano.fieldbyname('IdPlanoPrev').asstring);
    qryPlano.Next;
  end;
end;

procedure TfrmPreparo.MontaListaBenef;
 var i : integer;
     sSQL : string;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;

  sSQL:='';

  sSQL:='SELECT DISTINCT B.IDBENEFICIO, B.NOME, V.FLGREFERENCIA,V.FLGPAGAINSS, B.FLGRESGATE '+_clinefeed+
        'FROM PLANPREVPATRO P, BENEFPLANPREV V, BENEFICIO B, '+_clinefeed+
              'TPPAGTOBENEFICIO TPB, PATRO PAT '+_clinefeed+
        'WHERE (P.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
        'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
        'AND (V.IDPLANOPREV = P.IDPLANOPREV) '+_clinefeed+
        'AND (B.IDBENEFICIO = V.IDBENEFICIO) '+_clinefeed+
        'AND (TPB.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC) '+_clinefeed;

  if RdgTpFolha.ItemIndex <> 3 then  // SOL 63067 - KTN 524520
  begin
     sSQL:=sSQL+'AND (TPB.FLGFREQUENCIA <> ''U'') '+_clinefeed;
  end; // SOL 63067 - KTN 524520

  if (sPatroSel <> '') then
    sSQL:=sSQL+'AND (P.IDPESSJUR  IN (' + sPatroSel + ')) '+_clinefeed;

  if (sPlanoSel <> '') then
    sSQL:=sSQL+'AND (V.IDPLANOPREV IN (' + sPlanoSel + ')) '+_clinefeed;

  if not chkreferencia.Checked then
    sSQL:=sSQL+' AND ((V.FLGREFERENCIA = 0) OR (V.FLGREFERENCIA = 1 AND V.FLGPAGAINSS = 1))'+_clinefeed;
  sSQL:=sSQL+' ORDER BY B.NOME'+_clinefeed;

  qryBenef.close;
  qryBenef.SQL.Clear;
  qryBenef.SQL.Add(sSQL);
  qryBenef.open;

  chklstBenef.Items.Clear;
  ListaBenef:=TStringList.Create;
  // SOL 63067 - KTN 524520
  if RdgTpFolha.ItemIndex = 3 then
  begin
     qryBenef.Filter    := ' FLGRESGATE = 1  ';
     qryBenef.Filtered  := True;
  end
  else
  begin
     qryBenef.Filter    := '';
     qryBenef.Filtered  := false;
  end;
  // SOL 63067 - KTN 524520
  while not qryBenef.eof do
  begin
    chklstBenef.items.add(qryBenef.fieldbyname('Nome').asstring);
    ListaBenef.Add(qryBenef.fieldbyname('IdBeneficio').asstring);
    qryBenef.Next;
  end;
end;

procedure TfrmPreparo.chklstPatroClickCheck(Sender: TObject);
begin
  MontaListaPlano;
  MontaListaBenef;
end;

procedure TfrmPreparo.chklstPlanoClickCheck(Sender: TObject);
begin
  MontaListaBenef;
end;

procedure TfrmPreparo.CriaQryLote;
 var ssql: string;
begin
  ssql:='SELECT IDLOTE, DATAPAGAMENTO, DATAPREPARO, VLRTOTAL, NUMREG, '+_clinefeed+
               'MESREFERENCIA, DESCRICAO, '+_clinefeed+
               'SUBSTR(MESREFERENCIA,6,2)||''/''||SUBSTR(MESREFERENCIA,1,4) AS MESREF '+_clinefeed+
        'FROM CTRLINTERFACE '+_clinefeed+
        'WHERE (FLGCONCESSAO = 0 OR FLGCONCESSAO IS NULL) '+_clinefeed+
        'AND (TIPO = ''B'')'+_clinefeed+
        'AND (IDPESSOA = '+inttostr(iidfundacao)+') '+_clinefeed+
        'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL) '+_clinefeed+
        'AND (IDREFERENCIA IS NULL) '+_clinefeed;
  case RdgTpFolha.itemindex of
    0: ssql:=ssql+'AND (FLGTIPOFOLHA = 0)       AND FLGRESGATEPARCELADO <> 1 '+_clinefeed; // SOL 63067 - KTN 524520
    1: ssql:=ssql+'AND (FLGTIPOFOLHA IN (0,3))  AND FLGRESGATEPARCELADO <> 1 '+_clinefeed; // SOL 63067 - KTN 524520
    2: ssql:=ssql+'AND (FLGTIPOFOLHA IN (0,4))  AND FLGRESGATEPARCELADO <> 1 '+_clinefeed; // SOL 63067 - KTN 524520
  end;
  // SOL 63067 - KTN 524520
  if RdgTpFolha.ItemIndex = 3 then
  begin
     ssql:=ssql+' AND FLGRESGATEPARCELADO = 1 '+_clinefeed;
  end;
  // SOL 63067 - KTN 524520
  ssql:=ssql+'ORDER BY MESREFERENCIA DESC, IDLOTE DESC'+_clinefeed;
  dbtDescricao.datasource:=nil;
  dbtMesref.datasource:=nil;
  dbtDataPagto.datasource:=nil;
  dbtDatacria.datasource:=nil;
  qryCtrlinterface.Close;
  qryCtrlinterface.SQL.Clear;
  qryCtrlinterface.SQL.Add(ssql);
  try
    qryCtrlinterface.open;
  except
    on E:EDBEngineError do
      MostrarErro(E);
  end;
end;

procedure TfrmPreparo.FormCreate(Sender: TObject);
 var ssql: string;
begin
  inherited;

        //Jéssica Lana SOL 109421 KINTANA 496332
        SaveDlg.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  ssql:='INSERT INTO HSTBENEFBFCIARIO '+
        '(IDTITULAR, IDPESSOA, IDPESSJUR, MES,MESREFERENCIA, IDMOTIVO, IDPLANOPREV, '+
        ' NUMEROPROCESSO, SEQPROPOSTA, IDBENEFICIO, IDREGRACALCULO, VALORPREV, '+
        ' VALORCALCULADO, DATAPAGAMENTO, IDLOTE, FLGENVIADO,FONTEPAGADORA,SEQBENEFICIO, '+
        ' CODPORTFORMA,VALORINTEGRAL, VALORTOTAL, '+
        ' VALORSRB, '+
        ' FLGPROVISORIO, '+
        ' FLGDESCIRMES,IDPLANOORIGEM,'+
        'IDSEQINTERNOFB, '+
        'FLGTIPOREGISTRO, '+
        'VALOROP1, VALOROP2, VALOROP3, FLGDEVOLUCAO, LOTEORIGINAL, MESCOMPREEM) '+ //BRUNO AZEVEDO SOL 86089 KINTANA 523183 // SOL 140042 Kintana 900220
        ' VALUES '+
        '(:pIdTitular,:pIdPessoa,:pIdPessJur,:pMesPag,:pMesRef,:pIdMotivo,:pIdPlanoPrev, '+
        ' :pNumeroProcesso,:pSeqProposta,:pIdBeneficio,:pIdRegraCalculo,:pVALORPREV, '+
        ' :pVALORCALCULADO,:pDATAPAGAMENTO,:pIdLote, :flgenviado, :iFontePagadora,:SeqBeneficio, '+
        ' :pCODPORTFORMA,:pVALORINTEGRAL,:pValorTotal, '+
        ' :pValorSRB, '+
        ' :pFlgProvisorio, '+
        ' :pflgdescirmes, :pIdPlanoOrigem, '+
        ' :PIDSEQINTERNOFB, '+
        ' :pFLGTIPOREGISTRO, '+
        ' :pVALOROP1, :pVALOROP2, :pVALOROP3, '+
        ' :pFLGDEVOLUCAO, :pIdLote, '+ //BRUNO AZEVEDO SOL 86089 KINTANA 523183
        ' :pMESCOMPREEM  ) '; // SOL 140042 Kintana 900220
  qryInsHstBfciario.sql.clear;
  qryInsHstBfciario.sql.add(ssql);
  qryInsHstBfciario.parambyname('pIdPlanoOrigem').datatype:=ftinteger;
  qryInsHstBfciario.parambyname('pIdTitular').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pIdPessoa').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pIdPessJur').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pMesPag').datatype:=ftString;
  qryInsHstBfciario.parambyname('pMesRef').datatype:=ftString;
  qryInsHstBfciario.parambyname('pIdMotivo').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pIdPlanoPrev').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pNumeroProcesso').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pSeqProposta').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pIdBeneficio').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pIdRegraCalculo').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pVALORPREV').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pVALORCALCULADO').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pDATAPAGAMENTO').datatype:=ftDateTime;
  qryInsHstBfciario.parambyname('pIdLote').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('flgenviado').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('iFontePagadora').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('SeqBeneficio').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pCODPORTFORMA').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pVALORINTEGRAL').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pValorTotal').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pValorSRB').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pFlgprovisorio').datatype:=ftInteger;
  qryInsHstBfciario.parambyname('pflgdescirmes').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pflgdevolucao').datatype:=ftInteger;
  qryInsHstBfciario.parambyname('PIDSEQINTERNOFB').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pFLGTIPOREGISTRO').datatype:=ftInteger;
  qryInsHstBfciario.parambyname('pValorOp1').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pValorOp2').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pValorOp3').datatype:=ftFloat;
  qryInsHstBfciario.parambyname('pMESCOMPREEM').datatype:=ftString;// SOL 140042 Kintana 900220

  ListaPatro:=TStringList.Create;
  ListaPlano:=TStringList.Create;
  ListaBenef:=TStringList.Create;
  listaParamFinan:=TStringList.Create;
  DtmFolha.qryNumBenef.Prepare;

  qryValorNucleo.prepare;
  qryUpdUltPgto.Prepare;
  qryUpdBenefBfciario.Prepare;
  qryInsHstBfciario.Prepare;
  qryPatro.params[0].asinteger:=iIdFundacao;
  qryPatro.open;
  qryBeneficioAnterior.prepare;
  CriaQryLote;

  CtrlBenefBfciario := TCtrlBenefBfciario.Create;
  CtrlBenefBfciario.Initialize(
    DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
    Sistema.ConnectionSide, Sistema.AppRemoteServer, True, Nil );
  
end; // FormCreate

procedure TfrmPreparo.FormShow(Sender: TObject);
begin
  inherited;
  MontaListaPatro;
  MontaListaPlano;
  MontaListaBenef;
  pnlOpcoes.BringToFront;
  pgcOpcoes.ActivePage:=tbsOpcoes;
  WindowState:=wsMaximized;
  bCommitParcial:=true;
  bTravaCommit:=false;
  tbsIndividual.tabvisible:=false;
  frameBenef.DefineLista(0);
end;

procedure TfrmPreparo.Formclose(Sender: TObject; var Action: TcloseAction);
begin
  inherited;
  ListaPatro.free;
  ListaPlano.free;
  ListaBenef.free;
  listaParamFinan.free;

  DtmFolha.qryNumBenef.close;
  DtmFolha.qryNumBenef.UnPrepare;

  qryUpdUltPgto.close;
  qryUpdUltPgto.UnPrepare;

  qryBenef.close;
  qryPatro.close;
  qryPlano.close;

  qryUpdBenefBfciario.close;
  qryUpdBenefBfciario.UnPrepare;

  qryInsHstBfciario.close;
  qryInsHstBfciario.UnPrepare;

  FreeAndNil( CtrlBenefBfciario ); 
end; // Formclose

procedure TfrmPreparo.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end; // bbtnSalvarClick

procedure TfrmPreparo.RdgTpFolhaClick(Sender: TObject);
begin
  inherited;
  CriaQryLote;
  MontaListaBenef; // SOL 63067 - KTN 524520
end;

procedure TfrmPreparo.AtualizaDadosLote;
 var imes, iAno: integer;
begin
  if cmbLote.text = '' then
  begin
    iIdLote:=0;
    sMesAbono:='';
    sMesReferencia:='';
    sMesAnterior:='';
  end
  else
  begin
    iIdLote:=qryCtrlinterface.fieldbyname('idlote').asinteger;
    sMesReferencia:=qryCtrlinterface.fieldbyname('mesreferencia').asstring;
    case RdgTpFolha.itemindex of
      0: sMesAbono:=copy(sMesReferencia,1,4)+'/13';
      1: sMesAbono:=copy(sMesReferencia,1,4)+'/13';
      2: sMesAbono:=copy(sMesReferencia,1,4)+'/13';
      3: sMesAbono:=sMesReferencia;   // SOL 63067 - KTN 524520
    end;
    // MesAnterior utilizado na função CalculaData
    imes:=strtoint(copy(sMesReferencia,6,2));
    iano:=strtoint(copy(sMesReferencia,1,4));
    if iMes = 1 then
      sMesAnterior:=IntToStr(iAno-1)+'/12'
    else
      sMesAnterior:=IntToStr(iAno)+'/'+IntCod(iMes-1,2);
  end;
end;

procedure TfrmPreparo.cmbLoteChange(Sender: TObject);
begin
  inherited;
  AtualizaDadosLote; 

  if cmbLote.text = '' then
  begin
    dbtDescricao.datasource:=nil;
    dbtMesref.datasource:=nil;
    dbtDataPagto.datasource:=nil;
    dbtDatacria.datasource:=nil;
    bbtnPreparo.enabled:=false;
  end
  else
  begin
    dbtDescricao.datasource:=dsCtrlinterface;
    dbtMesref.datasource:=dsCtrlinterface;
    dbtDataPagto.datasource:=dsCtrlinterface;
    dbtDatacria.datasource:=dsCtrlinterface;
    bbtnPreparo.enabled:=true;
  end;
end;

procedure TfrmPreparo.InsereHstBfciario(aqryexec: twwquery; aitipopreparo,
  aiidtitular, aiidpessoa, aiidpessjur, aiidplanoprev, aiidplanoorigem,
  aiidbeneficio, ainumeroprocesso: integer; asmespagamento, asmesabono,
  asdatapagamento: string; aiseqproposta, aiseqbenef,
  aisitbeneficio, aiidlote, aifontepagadora, aicodportforma,
  aiflgprovisorio, aiflgdescirmes, aiflgdevolucao: integer; asidregra,
  asvlrprev, asvlrcalc, asvlrintegral, asvlrtot, asvlrsrb, asvalorop1,
  asvalorop2, asvalorop3: string;
  aitiporeg: integer; 
  aiflgtiporegistro: integer; 
  aiflgreferencia: integer; 
  aiflgpagainss: integer; 
  aiflgpagainssbenef: integer; 
  aiflgstatus: string; 
  arpercentual: real; 
  var asidlotegravado: string);
var lssql: string;
    lidseq: integer;
    sMesRef : String; // Renato Visoni SOL 126894 - KINTANA 667862
    sMotivo : String; // Renato Visoni SOL 126894 - KINTANA 667862
begin
  sSQLValida :='';// Renato Visoni SOL 126894 - KINTANA 667862

  asidregra:=trim(asidregra);
  lsSql:=
    'Insert into HstBenefBfciario '+
    '(IDTITULAR, IDPESSOA, IDPESSJUR, MES, MESREFERENCIA, IDMOTIVO, IDPLANOPREV, '+
    ' NUMEROPROCESSO, SEQPROPOSTA, IDBENEFICIO, IDREGRACALCULO, VALORPREV, VALORCALCULADO, '+
    ' DATAPAGAMENTO, IDLOTE, FLGENVIADO, FONTEPAGADORA, SEQBENEFICIO, CODPORTFORMA, '+
    ' VALORINTEGRAL, VALORTOTAL, VALORSRB, FLGPROVISORIO, FLGDESCIRMES, IDPLANOORIGEM, '+
    ' IDSEQINTERNOFB, '+ 
    ' FLGCONCESSAO, '+ 
    ' FLGTIPOREGISTRO, '+ 
    ' PERCENTUAL, '+ 
    ' VALOROP1, VALOROP2, VALOROP3, FLGDEVOLUCAO, LOTEORIGINAL, MESCOMPREEM) '+  //BRUNO AZEVEDO SOL 86089 KINTANA 523183 // SOL 140042 Kintana 900220
    ' VALUES ('+
      inttostr(aiidtitular)+','+
      inttostr(aiidpessoa)+','+
      inttostr(aiidpessjur)+','+
      quotedstr(asmespagamento)+',';


  if aitiporeg in [1,2] then
    lssql:=lssql+quotedstr(asmesabono)+','
  else
    if aitipopreparo <> 0 then
      lssql:=lssql+quotedstr(asmesabono)+','
    else
      lssql:=lssql+quotedstr(asmespagamento)+',';


  if aitiporeg in [1,2] then
    lssql:=lssql+inttostr(prmidmotivoabono)+','
  else
    if aitipopreparo <> 0 then
      lssql:=lssql+inttostr(prmidmotivoabono)+','
    else
      lssql:=lssql+inttostr(prmidmotivofolhaben)+',';

  lssql:=lssql+
    inttostr(aiidplanoprev)+','+
    inttostr(ainumeroprocesso)+','+
    inttostr(aiseqproposta)+','+
    inttostr(aiidbeneficio)+',';

  if asidregra='' then
    lssql:=lssql+'NULL,'
  else
    lssql:=lssql+asidregra+',';

  lssql:=lssql+
    oranumero(asvlrprev)+','+
    oranumero(asvlrcalc)+','+
    'TO_DATE('+QuotedStr(asdatapagamento)+',''DD/MM/YYYY''),';

  if aitiporeg = 0 then
  begin
    if aisitbeneficio = 2 then
    begin
      if aitipopreparo = 0 then
      begin
        case SistemaFolha.PreparoRetidoMensal of
          0 : begin
                asidlotegravado:='NULL';
              end;
          1 : begin
                asidlotegravado:='NULL';
              end;
          2 : begin
                asidlotegravado:='NULL';
              end;
        end;
      end
      else
      begin
        case SistemaFolha.PreparoRetidoAbono of
          0 : begin
                asidlotegravado:='NULL';
              end;
          1 : begin
                if aiflgstatus = '' then //NÃO É RETIDO POR RECADASTRAMENTO
                  asidlotegravado:=inttostr(aiidlote)
                else
                  asidlotegravado:='NULL';
              end;
          2 : begin
                asidlotegravado:=inttostr(aiidlote);
              end;
        end;
      end;
    end
    else
    begin
       if (aiflgreferencia = 0) or
         //INSS NÃO PAGO COLOCAR NO LOTE
         ((aiflgreferencia = 1) and
          (aiflgpagainss = 0) and
          (aiflgpagainssbenef = 0)) or
         ((aiflgreferencia = 1) and
          (aiflgpagainss = 1) {and
          (aiflgpagainssbenef = 1)}) then  //Renato Visoni SOL 120978 KINTANA 579438
        asidlotegravado:=inttostr(aiidlote)
      else
        asidlotegravado:='NULL';
    end;
  end
  else
  begin
    asidlotegravado:=inttostr(aiidlote);
  end;

  lsSql:=lsSql+asidlotegravado+',';

  if asidlotegravado = 'NULL' then
  begin
    if (aiflgreferencia = 1) and
       (aiflgpagainss = 1) and
       (aiflgpagainssbenef = 0) then
      lssql:=lssql+'8, ' //CONVÊNIO DE INSS
    else
      lssql:=lssql+'9, '
  end
  else
    lssql:=lssql+'0, ';

  lsSql:=lsSql+
    inttostr(aifontepagadora)+', '+
    inttostr(aiseqbenef)+',';

  if aicodportforma = 0 then
    lssql:=lssql+'NULL,'
  else
    lssql:=lssql+inttostr(aicodportforma)+',';

  asvalorop1:=oranumero(asvalorop1);
  if trim(asvalorop1) = '' then
    asvalorop1:='0';

  asvalorop2:=oranumero(asvalorop2);
  if trim(asvalorop2) = '' then
    asvalorop2:='0';

  asvalorop3:=oranumero(asvalorop3);
  if trim(asvalorop3) = '' then
    asvalorop3:='0';

  lidseq:=LeUltRegistro(nil,'SEQINTERNOFB');

  if arpercentual <= 0 then
    arpercentual:=100;

  lssql:=lssql+
    oranumero(asvlrintegral)+','+
    oranumero(asvlrtot)+','+
    oranumero(asvlrsrb)+','+
    inttostr(aiflgprovisorio)+','+
    inttostr(aiflgdescirmes)+','+
    inttostr(aiidplanoorigem)+','+
    inttostr(lidseq)+','+
    '0,'+ //FLGCONCESSAO
    inttostr(aiflgtiporegistro)+','+
    oranumero(floattostr(arpercentual))+','+
    asvalorop1+','+
    asvalorop2+','+
    asvalorop3+','+
    inttostr(aiflgdevolucao)+','+
    asidlotegravado+','; //BRUNO AZEVEDO SOL 86089 KINTANA 523183

    //BRUNO AZEVEDO SOL 140042/6601
    if (aifontepagadora = 2) then begin
      lssql:=lssql+ quotedstr(asmespagamento)+')'; // SOL 140042 Kintana 900220
    end else begin
      lssql:=lssql+ quotedstr('')+')';
    end;
    //BRUNO AZEVEDO SOL 140042/6601

  //Renato Visoni SOL 126894 - KINTANA 667862
  if aitiporeg in [1,2] then
    sMesRef:=quotedstr(asmesabono)
  else
    if aitipopreparo <> 0 then
      sMesRef:=quotedstr(asmesabono)
    else
      sMesRef:=quotedstr(asmespagamento);


  if aitiporeg in [1,2] then
    sMotivo:=inttostr(prmidmotivoabono)
  else
    if aitipopreparo <> 0 then
      sMotivo:=inttostr(prmidmotivoabono)
    else
      sMotivo:=inttostr(prmidmotivofolhaben);

  sSQLValida :=
  ' SELECT count (*) Qnt FROM HSTBENEFBFCIARIO ' +
  ' WHERE                                      ' +
  ' IDPESSOA ='+inttostr(aiidpessoa)              +
  ' AND IDPLANOPREV = '+ inttostr(aiidplanoprev) +
  ' AND IDBENEFICIO = '+ inttostr(aiidbeneficio) +
  ' AND MES         = '+quotedstr(asmespagamento)+
  ' AND IDMOTIVO    = '+ sMotivo                 +
  ' AND NUMEROPROCESSO = '+inttostr(ainumeroprocesso)+
  ' AND MESREFERENCIA  = '+sMesRef               +
  ' AND SEQBENEFICIO = '+ inttostr(aiseqbenef)   +
  ' AND IDPESSJUR ='+inttostr(aiidpessjur)       +
  ' AND IDTITULAR = '+inttostr(aiidtitular)      +
  ' AND IDPLANOORIGEM = '+inttostr(aiidplanoorigem)+
  ' AND SEQPROPOSTA = '+ inttostr(aiseqproposta) ;
  // Renato Visoni SOL 126894 - KINTANA 667862




  aqryexec.sql.clear;
  aqryexec.sql.add(lssql);
end;

procedure TfrmPreparo.AtualizaLote;
 var ssql: string;
     rValbenef: double;
     nTotBenef: integer;
begin
  //ATUALIZA VALOR TOTAL E QUANTIDADE DE REGS. NO LOTE
  ssql:='SELECT SUM(VALORPREV), COUNT(*) '+_clinefeed+
        'FROM HSTBENEFBFCIARIO '+_clinefeed+
        'WHERE IDLOTE = '+inttostr(iidlote)+_clinefeed+
        '  AND FLGDEVOLUCAO = 0 '+_clinefeed;

  if FazQuery(qryAux2,ssql) then
  begin
    rValbenef:=qryAux2.fields[0].asfloat;
    nTotBenef:=qryAux2.fields[1].asinteger;
  end
  else
  begin
    nTotBenef:=0;
    rValBenef:=0;
  end;
  dtmFolha.qryAux.close;
  dtmFolha.qryAux.SQL.Clear;
  dtmFolha.qryAux.SQL.Add(
    ' UPDATE CTRLINTERFACE '+_clinefeed+
    ' SET NUMREG = '+IntToStr(nTotBenef)+','+_clinefeed+
        ' FLGPREPARADO = 1, '+_clinefeed+
        ' VLRTOTAL = '+Oranumero(FloatToStr(rValbenef))+_clinefeed+
    ' WHERE (IDLOTE = '+IntToStr(iIdLote)+')'+_clinefeed);
  try
    dtmFolha.qryAux.ExecSQL;
  except
    on E:EDBEngineError do
    begin
      MostrarErro(E);
      Exit;
    end;
  end;
end;

procedure TfrmPreparo.FiltraBenefMesPorTipoFolha(flgTipoFolha : integer;
  bbenefXcontrib : boolean; var ssql : string);

  function PrimeiroDiaAno : string;
  begin
    result:=copy(smesreferencia,1,4)+'/01/01';
  end;

begin
  if flgTipoFolha <> 0 then
  begin {abono ou antecipacao de abono}
  //NÃO ALTERADO PARA O ABONO ANUAL OU ANTECIPAÇÃO
    ssql:=ssql+
          ' (BPP.FLGPOSSUIABONO = 1) '+_clinefeed+
      ' AND ( (    (BB.IDSITBENEFICIO = 3) '+_clinefeed+
            '  AND (BB.DATAFINAL IS NOT NULL) '+_clinefeed+
            '  AND (BPP.FLGABONOFINALBEN IS NULL OR BPP.FLGABONOFINALBEN = 0) '+_clinefeed+
             ') OR '+_clinefeed+
            //TRATA SITUAÇÃO DE BENEFICIO DE INSS (=6)
            ' ((BB.IDSITBENEFICIO IN (1,2)) OR ((BPP.FLGREFERENCIA = 1) '+_clinefeed+
            ' AND (BPP.FLGPAGAINSS = 0) AND (BB.IDSITBENEFICIO = 6))) '+_clinefeed+
           ') '+_clinefeed+
      ' AND ((BB.DATAFINAL >= TO_DATE('''+PrimeiroDiaAno+''',''YYYY/MM/DD'')) OR (BB.DATAFINAL IS NULL))'+_clinefeed+
      ' AND ((((BB.FLGDATAPREVISTA = 0) OR (BB.FLGDATAPREVISTA IS NULL) OR '+_clinefeed+
      '        ((BB.FLGDATAPREVISTA = 1) AND ((BB.DATAFINALPREVISTA >= TO_DATE('''+PrimeiroDiaAno+
      ''',''YYYY/MM/DD'')) OR (BB.DATAFINALPREVISTA IS NULL)))))) '+_clinefeed;
  end
  else
  begin
    ssql:=ssql+
        //TRATA SITUAÇÃO DE BENEFICIO DE INSS (=6)
        ' ((((BB.IDSITBENEFICIO = 1) OR ((BPP.FLGREFERENCIA = 1) '+_clinefeed+
        ' AND (BPP.FLGPAGAINSS = 0) AND (BB.IDSITBENEFICIO = 6))) '+_clinefeed+
              ' AND (   (BB.FLGDATAPREVISTA = 1) '+_clinefeed+
                 ' OR (    (    (BB.FLGDATAPREVISTA = 0) '+_clinefeed+
                           ' OR (BB.FLGDATAPREVISTA IS NULL)'+_clinefeed+
                                                   ') '+_clinefeed+
                      'AND (   (BB.DATAFINAL >= TO_DATE('''+sMesReferencia+'/01'',''YYYY/MM/DD'')) '+_clinefeed+
                          ' OR (BB.DATAFINAL IS NULL) '+_clinefeed+
                          ') '+
                     ') '+
                 ') ';
            if RdgTpFolha.ItemIndex = 3 then
               ssql:=ssql+ ' ';
            ssql:=ssql+ ') ';
    //PREPARO MENSAL DE RETIDOS
    case SistemaFolha.PreparoRetidoMensal of
      1 : begin
            ssql:=ssql+
              'OR (    (IDSITBENEFICIO = 2) '+_clinefeed+
                  'AND (B.FLGBENEFTEMP = 0) '+_clinefeed+
                 ') ';
          end;
      2 : begin
            ssql:=ssql+
              'OR (    (IDSITBENEFICIO = 2) '+_clinefeed+
                 ') ';
          end;
    end;
    ssql:=ssql+') '+_clinefeed;
  end;
  if flgTipoFolha = 0 then
  begin
    if bbenefXcontrib then {beneficio}
      ssql:=ssql+' AND ((BB.ULTMESPREPARO < '''+sMesReferencia+''') OR (BB.ULTMESPREPARO IS NULL)) '+_clinefeed
    else
      ssql:=ssql+' AND ((BB.ULTMESPREPARO = '''+sMesReferencia+''') OR (BB.ULTMESPREPARO IS NULL)) '+_clinefeed;
  end;
end;

function TfrmPreparo.PegaDataFinal : string;
 var sdatafimano : string;
     ddatafimano : tdatetime;
begin
  sdatafimano:='31/12/'+copy(smesreferencia,1,4);
  ddatafimano:=strtodatetime(sdatafimano);

  result:=sdatafimano;
  if qryPrinc.fieldbyname('DATAFINAL').isnull then
  begin
    if (qryPrinc.fieldbyname('FLGDATAPREVISTA').asinteger = 1) then
    begin
       if not qryPrinc.fieldbyname('DATAFINALPREVISTA').isnull then
         if (qryPrinc.fieldbyname('DATAFINALPREVISTA').asdatetime <= ddatafimano) then
           result:=qryPrinc.fieldbyname('DATAFINALPREVISTA').asstring
    end;
  end
  else
  begin
    if (qryPrinc.fieldbyname('DATAFINAL').asdatetime <= ddatafimano) then
      result:=qryPrinc.fieldbyname('DATAFINAL').asstring;
  end;
end;

function TfrmPreparo.InicializaProcessoBeneficio(ssql : string) : boolean;
begin
  result:=false;

  lblcontagem.caption:='';
  lblcontagem.update;
  ProgressBar1.Position:=0;
  ProgressBar1.Min:=0;
  ProgressBar1.Max:=100;
  ProgressBar1.update;

  qryPrinc.close;
  qryPrinc.sql.clear;
  qryPrinc.sql.add(ssql);
  try
    qryPrinc.open;
  except
    on E:EDBEngineError do
    begin
      bErro:=True;
      EncerrarProcessamento:=True;
      qryPrinc.close;
      MsgDlg('Erro na leitura de Benefícios a Preparar.'+#13+E.message,'Informação',
             mtInformation, [mbOk,mbHelp], 0);
      Exit;
    end;
  end;

  if qryPrinc.IsEmpty then
  begin
    qryPrinc.close;
    PnlProgress.Repaint;
    exit;
  end;

  sNomepatro:='';
  sidpatro:='';
  sNomeplano:='';
  sidplano:='';

  ProgressBar1.Position:=0;
  ProgressBar1.Max:=qryPrinc.RecordCount;
  if ProgressBar1.Max > 0 then
  begin
    bCommitParcial:=true;
    tFim:=now;
    tInicioPatro:=tFim;
    memResult.Lines.Add('Tempo de Processamento Consulta: '+formatdatetime('hh:nn:ss',tFim-tInicio));
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('');
    Contador:=0;
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
    result:=true;
  end;
end;

procedure TfrmPreparo.InicializaContadores(abtotais: boolean);
begin
  iBenefProc:=0 ;
  iContribProc:=0;
  iBenefErro:=0;
  iBenefRetido:=0;
  iContribRetido:=0;
  iBenefAbono:=0 ;
  iContribAbono:=0;
  iBenefDevAbono:=0 ;
  iContribDevAbono:=0;
  if abtotais then
  begin
    iBenefProcTotal:=0;
    iContribProctotal:=0;
    iBenefErroTotal:=0;
    iBenefRetidoTotal:=0;
    iContribRetidoTotal:=0;
    iBenefAbonoTotal:=0;
    iContribAbonototal:=0;
    iBenefDevAbonoTotal:=0;
    iContribDevAbonototal:=0;
  end;
end;

procedure TfrmPreparo.IncrementaTotais;
begin
  iBenefProcTotal:=iBenefProcTotal+iBenefProc;
  iContribProctotal:=iContribProcTotal+iContribProc;
  iBenefErroTotal:=iBenefErroTotal+iBenefErro;
  iBenefRetidoTotal:=iBenefRetidoTotal+iBenefRetido;
  iContribRetidoTotal:=iContribRetidoTotal+iContribRetido;
  iBenefAbonoTotal:=iBenefAbonoTotal+iBenefAbono;
  iContribAbonototal:=iContribAbonoTotal+iContribAbono;
  iBenefDevAbonoTotal:=iBenefDevAbonoTotal+iBenefDevAbono;
  iContribDevAbonototal:=iContribDevAbonoTotal+iContribDevAbono;
  InicializaContadores(false);
end;

procedure TfrmPreparo.GravaResultadoProcessoBeneficio;
begin
  if sNomepatro <> '' then
  begin
    tFim:=now;
    memResult.lines.Add('');
    memResult.lines.Add('Patrocinadora: '+sNomepatro);
    memresult.lines.add('Quantidade de Benefícios Processados: '+inttostr(iBenefProc));
    if iContribProc > 0 then
      memresult.lines.add('Quantidade de Contribuições Processadas: '+inttostr(iContribProc));
    
    if iBenefRetido > 0 then
    begin
      memresult.lines.add('Quantidade de Benefícios Retidos: '+inttostr(iBenefRetido));
      if iContribRetido > 0 then
        memresult.lines.add('Quantidade de Contribuições (para benefícios retidos): '+inttostr(iContribRetido));
    end;

    if iBenefAbono > 0 then
      memresult.lines.add('Quantidade de Abonos de Benefício por Encerramento: '+inttostr(iBenefAbono));
    if iContribAbono > 0 then
      memresult.lines.add('Quantidade de Contribuições s/ Abono por Encerramento: '+inttostr(iContribAbono));
    if iBenefDevAbono > 0 then
      memresult.lines.add('Quantidade de Devolução Abonos de Benefício: '+inttostr(iBenefDevAbono));
    if iContribDevAbono > 0 then
      memresult.lines.add('Quantidade de Devolução de Contribuições s/ Abono: '+inttostr(iContribDevAbono));
    
    if iBenefErro > 0 then
    begin
      memresult.lines.add('Quantidade de Benefícios não processados por erro ou valor zero: '+inttostr(iBenefErro));
    end;

    memResult.Lines.Add('Tempo de Processamento : '+formatdatetime('hh:nn:ss',tFim-tInicioPatro));
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('');

    tInicioPatro:=tFim;

    IncrementaTotais;
  end;
  if qryPrinc.active then
  begin
    sidpatro:=qryPrinc.fieldbyname('IDPESSJUR').asstring;
    iUltIDPESSJUR:=qryPrinc.fieldbyname('IDPESSJUR').asinteger;
    sNomepatro:=qryPrinc.fieldbyname('PATROCINADORA').asstring;
  end;
  lblPatro.caption:=sNomepatro;
  lblPatro.Update;
end;

procedure TfrmPreparo.PassoProcessoBeneficio(breajuste: boolean);
begin
  ProgressBar1.Position:=ProgressBar1.Position + ProgressBar1.Step;
  iPosicao:=ProgressBar1.Position;
  lblcontagem.caption:='Processando '+inttostr(iPosicao)+
                               ' de '+inttostr(ProgressBar1.Max);

  PnlProgress.Update;

  if iPosicao mod 100 = 0 then
    application.processmessages;

  if not bTravaCommit then
    if bCommitParcial then
    begin
      if iPosicao mod 300 = 0 then
      begin
        dtmBaseDados.dbBaseDados.Commit;
        dtmBaseDados.dbBaseDados.StartTransaction;

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        //memResult.lines.SaveToFile('c:\preparofolha.txt');
        memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

        //BRUNO AZEVEDO SOL 140974 KINTANA 889580
        try
           memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
        except
        end;
      end;
    end;

  if (sidpatro <> qryPrinc.fieldbyname('IDPESSJUR').asstring) or
     (sidplano <> qryPrinc.fieldbyname('IDPLANOPREV').asstring) then
  begin
    if (sidpatro <> qryPrinc.fieldbyname('IDPESSJUR').asstring) then
      GravaResultadoProcessoBeneficio;
    sidplano:=qryPrinc.fieldbyname('IDPLANOPREV').asstring;
    sNomeplano:=qryPrinc.fieldbyname('PLANO').asstring;
  end;
end;

function TfrmPreparo.ExecutaRegraProcessoBeneficio : boolean;
 var lspercentual, ssqlregra: string;
     rvalor: real;
     linumBenef: integer;
     sDIBParaAbono: string;
     sDIPParaAbono: string; 
     dt: tdatetime;
     sDataInicioAnt,
     sValorAnt,
     sNomeBenefAnt,
     sIdTpPagtoAnt,
     sUltMesReajAnt,
     sFlgBenefMinAnt,
     sDataEventoAnt,
     sCodBeneficioAnt,
     sValorBase1,
     sValorBase2,
     sValorBase3,
     sNumProcINSS : String;
     bAlteraDataInicioEValor : Boolean;
     lsInscricao: string; 

  function PegaDIBSuplementacao(nproc: string): tdatetime;
   var ssql: string;
  begin
    ssql:='SELECT NVL(BB.DATAINICIOFUND, BB.DATAINICIO) AS DATA '+_clinefeed+
          'FROM BENEFBFCIARIO BB, BENEFPLANPREV BP, BENEFICIO B '+_clinefeed+
          'WHERE BB.NUMEROPROCESSO = '+nproc+' '+_clinefeed+
          'AND BB.IDBENEFICIO = BP.IDBENEFICIO '+_clinefeed+
          'AND BB.IDPLANOPREV = BP.IDPLANOPREV '+_clinefeed+
          'AND BP.FLGREFERENCIA = 0 '+_clinefeed+
          'AND B.TIPOBENEFICIO < 99 '+_clinefeed+
          'AND BB.IDBENEFICIO = B.IDBENEFICIO'+_clinefeed;
    if FazQuery(qryAux2, ssql) then
      result:=qryAux2.fieldbyname('DATA').asdatetime
    else
      result:=0;
  end;

begin
  result:=false;

  if qryPrinc.fieldbyname('DtDireito').isnull or
     (qryPrinc.fieldbyname('DtDireito').asstring = '') then
    sDataRef:=AjustaDataUltDiaMes('01/'+copy(sMesReferencia,6,2)+'/'+
                                  copy(sMesReferencia,1,4))
  else
    sDataRef:=AjustaDataUltDiaMes(Copy(qryPrinc.fieldbyname('DtDireito').asstring,1,2)+
              '/'+copy(sMesReferencia,6,2)+'/'+copy(sMesReferencia,1,4));
  dbValor:=qryPrinc.fieldbyname('ValorAtual').AsFloat;
  sValorAtualBenef:=qryPrinc.fieldbyname('ValorAtual').asstring;
  sValorIntegralBenef:=sValorAtualBenef;
  sValorTotalBenef:=floattostr(qryPrinc.fieldbyname('ValorTotal').asfloat);

  if (qryPrinc.fieldbyname('FLGPOSSUIABONO').AsInteger = 1) then
  begin
    if qryPrinc.fieldbyname('INSCRICAODATA').isnull then
      lsInscricao:=' '
    else
      lsInscricao:=formatdatetime('dd/mm/yyyy',
        qryPrinc.fieldbyname('INSCRICAODATA').asdatetime);

    //REAJUSTE BENEFICIO CANCELADOS NO ABONO ANUAL
    if (RdgTpFolha.ItemIndex = 1) then
    begin
      // Executa a Regra de Benefício Mínimo
      if prmVlrBenefMin > 0 then
      begin
        qryBeneficiario.Close;
        qryBeneficiario.ParamByname('pIDTITULAR').asInteger:=
          qryPrinc.fieldbyname('IDTITULAR').AsInteger;
        try
          qryBeneficiario.Open;
          linumBenef:=qryBeneficiario.fields[0].asinteger;
        except
          linumBenef:=1;
        end;

        qryPercentual.Close;
        qryPercentual.ParamByname('pIdTitular').asInteger:=qryPrinc.fieldbyname('IdTitular').AsInteger;
        qryPercentual.ParamByname('pIdPessJur').asInteger:=qryPrinc.fieldbyname('IdPessJur').AsInteger;
        qryPercentual.ParamByname('pIdPlanoPrev').asInteger:=qryPrinc.fieldbyname('IdPlanoPrev').AsInteger;
        qryPercentual.ParamByname('pIdPessoa').asInteger:=qryPrinc.fieldbyname('IdPessoa').AsInteger;
        qryPercentual.ParamByname('pIdBeneficio').asInteger:=qryPrinc.fieldbyname('IdBeneficio').AsInteger;
        try
          qryPercentual.Open;
          lspercentual:=oranumero(formatfloat('#0.000000', qryPercentual.fields[0].asfloat));
        except
          lspercentual:='100';
        end;

        ssqlregra:=
          'SELECT '+_clinefeed+
            inttostr(RdgTpFolha.ItemIndex+2)+' AS FLGTIPOFOLHA, '+_clinefeed+
            '0 AS FLGCONCESSAO, '+_clinefeed+
            lspercentual+' AS PERCENTUAL, '+_clinefeed+
            inttostr(RdgTpFolha.ItemIndex)+' AS TIPOPREPARO, '+_clinefeed+ //SOL111112 - Ádler Souza
            inttostr(linumBenef)+' AS NUMBENEF, '+_clinefeed+
            qryPrinc.fieldbyname('FLGCALCTODOMES').asstring+' FLGBENEFCOTAS, '+_clinefeed+
            inttostr(qryPrinc.fieldbyname('idtitular').AsInteger)+' AS IDPESSOA, '+_clinefeed+
            inttostr(qryPrinc.fieldbyname('idtitular').AsInteger)+' AS IDTITULAR, '+_clinefeed+
            sidpatro + ' AS IDPESSJUR, '+_clinefeed+
            sidplano + ' AS IDPLANOPREV, '+_clinefeed+
            '1 AS SEQPROPOSTA, '+_clinefeed+
            inttostr(qryPrinc.fieldbyname('IDBENEFICIO').asinteger)+' AS IDBENEFICIO, '+_clinefeed+
            OraNumero(FloatToStr(dbValor))+' AS VALORPREV, '+_clinefeed+
            OraNumero(FloatToStr(dbValor))+' AS VALORORIGINAL, '+_clinefeed+
            OraNumero(sValorTotalBenef)+' AS VALORTOTAL, '+_clinefeed+
            formatdatetime('DD/MM/YYYY', qryPrinc.fieldbyname('DATAINICIO').asdatetime)+' AS DATAINICIO, '+_clinefeed+
            formatdatetime('DD/MM/YYYY', qryPrinc.fieldbyname('DATAFINAL').asdatetime)+' AS DATAFINAL, '+_clinefeed+
            QuotedStr(PegaDataFinal)+' AS DATAREF, '+_clinefeed+
            QuotedStr(sMesReferencia)+' AS MESREFERENCIA, '+_clinefeed+
            QuotedStr(sMesReferencia)+' AS ANOMESREF, '+_clinefeed+
            'ST.FLGINTERNO, '+_clinefeed+
            'DECODE(PP.FLGSALVIRTBENEF,1,PP.SALAUXDOENCA,PP.SALPARTICIPACAO) AS VALORPROVENTO, '+_clinefeed+
            'DECODE(PP.FLGSALVIRTBENEF,1,PP.SALAUXDOENCA,PP.SALPARTICIPACAO) AS SALARIOINTEGRAL '+_clinefeed+
          'FROM PARTPREVPLAN PP, SITPART ST '+_clinefeed+
          'WHERE PP.IDPESSOA = '+inttostr(qryPrinc.fieldbyname('IdTitular').AsInteger)+' '+_clinefeed+
          'AND PP.IDPLANOPREV = '+inttostr(qryPrinc.fieldbyname('IdPlanoprev').AsInteger)+' '+_clinefeed+
          'AND PP.IDPESSJUR = '+inttostr(qryPrinc.fieldbyname('IdPessJur').AsInteger)+' '+_clinefeed+
          'AND PP.SEQPROPOSTA = 1 '+_clinefeed;

        if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
          ssqlregra:=ssqlregra+
            'AND PP.FLGDESATIVADO = 0 '+_clinefeed;
        ssqlregra:=ssqlregra+
          'AND ST.IDSITPART = PP.IDSITPART '+_clinefeed;

        qryPreparoContrib.close;
        qryPreparoContrib.SQL.Clear;
        qryPreparoContrib.SQL.Add(sSQLRegra);
        try
          qryPreparoContrib.open;
          if not qryPreparoContrib.isempty then
          begin
            try
              regPreparoContrib.RuleName:=floattostr(prmVlrBenefMin);
              regPreparoContrib.Execute;
              if trim(regPreparoContrib.Result) <> '' then
              begin
                try
                  rValor:=strtofloat(clientenumero(trim(regPreparoContrib.Result)));
                  if rvalor > 0 then
                    dbValor:=rvalor
                  else
                  begin
                    memResult.Lines.Add('Valor retornado pela execução da regra de benefício mínimo inválido igual a zero.');
                    memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
                    memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
                  end;
                except
                  memResult.Lines.Add('Valor retornado pela execução da regra de benefício mínimo inválido.');
                  memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
                  memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
                end;
              end
              else
              begin
                memResult.Lines.Add('Valor retornado pela execução da regra de benefício mínimo inválido.');
                memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
                memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
              end;
            except
              memResult.Lines.Add('Erro na execução da regra de benefício mínimo.');
              memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
              memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
            end;
          end
          else
          begin
            memResult.Lines.Add('Consulta para regra de benefício mínimo retornou vazio.');
            memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
            memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
          end;
        except
          on E:Exception do
          begin
            memResult.Lines.Add('Erro consulta para regra de benefício mínimo ');
            memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
            memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
            memResult.Lines.Add('Mensagem de erro : '+E.Message);
          end;
        end;
      end;

      // Abono
      if (qryprinc.fieldbyname('DATAINICIO').asstring = '') or
         (qryprinc.fieldbyname('DATAINICIO').isnull) then
      begin
        memResult.Lines.Add('Erro : Data início não preenchida');
        memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
        memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
        memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
        dbValor:=0;
        exit;
      end;

      qryPercAnterior.Close;
      qryPercAnterior.ParamByname('pIdTitular').asInteger:=qryPrinc.fieldbyname('IdTitular').AsInteger;
      qryPercAnterior.ParamByname('pIdPessJur').asInteger:=qryPrinc.fieldbyname('IdPessJur').AsInteger;
      qryPercAnterior.ParamByname('pIdPessoa').asInteger:=qryPrinc.fieldbyname('IdPessoa').AsInteger;
      try
        qryPercAnterior.Open;
        lspercentual:=oranumero(formatfloat('#0.000000', qryPercAnterior.fields[0].asfloat));
      except
        lspercentual:='100';
      end;

      
      if qryPrinc.fieldbyname('FLGREFERENCIA').asinteger = 1 then
      begin
        if qryPrinc.fieldbyname('FLGDATAABONO').asinteger = 0 then
        begin
          sDIBParaAbono:=formatdatetime('dd/mm/yyyy',
            qryprinc.fieldbyname('DATAINICIOFUND').asdatetime);
          sDIPParaAbono:=formatdatetime('dd/mm/yyyy',
            qryprinc.fieldbyname('DATAINICIO').asdatetime); 
        end
        else
        begin
          dt:=PegaDIBSuplementacao(qryPrinc.fieldbyname('NUMEROPROCESSO').asstring);
          if dt = 0 then
            sDIBParaAbono:=formatdatetime('dd/mm/yyyy',
              qryprinc.fieldbyname('DATAINICIOFUND').asdatetime)
          else
            sDIBParaAbono:=formatdatetime('dd/mm/yyyy',dt);
          sDIPParaAbono:=sDIBParaAbono; 
        end;
      end
      else
      begin
        sDIBParaAbono:=formatdatetime('dd/mm/yyyy',
          qryprinc.fieldbyname('DATAINICIOFUND').asdatetime);
        sDIPParaAbono:=formatdatetime('dd/mm/yyyy',
          qryprinc.fieldbyname('DATAINICIO').asdatetime); 
      end;

      BuscaDadosBeneficioAnterior(qryAux2, StrToInt(sidpatro), StrToInt(sidplano),
                                  qryPrinc.fieldbyname('IDTITULAR').AsInteger,
                                  qryPrinc.fieldbyname('IDBENEFICIO').AsInteger,
                                  qryPrinc.fieldbyname('FLGREFERENCIA').AsInteger,
                                  qryPrinc.fieldbyname('DATAINICIO').AsString,
                                  sDataInicioAnt,
                                  sValorAnt,
                                  sNomeBenefAnt,
                                  sIdTpPagtoAnt,
                                  sUltMesReajAnt,
                                  sFlgBenefMinAnt,
                                  sDataEventoAnt,
                                  sCodBeneficioAnt,
                                  sValorBase1,
                                  sValorBase2,
                                  sValorBase3,
                                  sNumProcINSS,
                                  bAlteraDataInicioEValor);

      if qryPrinc.FieldByName('DIBBENEFANT').AsString <> '' Then
        sDataInicioAnt := qryPrinc.FieldByName('DIBBENEFANT').AsString;

      // Select da regra de abono
      ssqlregra:=' SELECT '+_clinefeed+
                 inttostr(qryPrinc.fieldbyname('idtitular').AsInteger)+' AS IDTITULAR, '+_clinefeed+
                 inttostr(qryPrinc.fieldbyname('idpessoa').AsInteger)+' AS IDPESSOA, '+_clinefeed+
                 Inttostr(Sistema.IdModulo)+ ' AS IDMODULO, '+_clinefeed+
                 '0 AS FLGCONCESSAO, '+_clinefeed+
                 inttostr(qryPrinc.fieldbyname('FLGPROVISORIO').asinteger)+' AS FLGPROVISORIO, '+_clinefeed+
                 OraNumero(formatfloat('#0.000000',qryPrinc.fieldbyname('PERCPROVISORIO').asfloat))+' AS PERCPROVISORIO, '+_clinefeed+ 
                 inttostr(qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger)+' AS PRAZOPROVISORIO, '+_clinefeed+ 
                 lspercentual+' AS PERCANTERIOR, '+_clinefeed+
                 sidpatro + ' AS IDPESSJUR, '+_clinefeed+
                 sidplano + ' AS IDPLANOPREV, '+_clinefeed+
                 quotedstr(lsInscricao)+' AS INSCRICAODATA, '+_clinefeed+ 
                 '1 AS SEQPROPOSTA, '+_clinefeed+
                 inttostr(qryPrinc.fieldbyname('IDBENEFICIO').asinteger)+' AS IDBENEFICIO, '+_clinefeed+
                 QuotedStr(sDIPParaAbono)+' AS DATAINICIO, '+_clinefeed+ 
                 QuotedStr(sDIBParaAbono)+' AS DATAINICIOFUND, '+_clinefeed+ 
                 QuotedStr(PegaDataFinal)+' AS DATAFINAL, '+_clinefeed+
                 QuotedStr(sDIBParaAbono)+' AS DATAINICIOINSS, '+_clinefeed+ 
                 QuotedStr(PegaDataFinal)+' AS DATAREF, '+_clinefeed+
                 QuotedStr(sMesReferencia)+' AS MESREFERENCIA, '+_clinefeed+
                 QuotedStr(sMesReferencia)+' AS ANOMESREF, '+_clinefeed;

                 If sDataInicioAnt <> '' Then
                   ssqlregra := ssqlregra + QuotedStr(sDataInicioAnt)+' AS DATAINICIOANT, '+_clinefeed
                 Else
                   ssqlregra := ssqlregra + ' '' '' AS DATAINICIOANT, '+_clinefeed;

                 ssqlregra := ssqlregra +
                 QuotedStr(formatdatetime('dd/mm/yyyy',
                           qryCtrlinterface.fieldbyname('DATAPAGAMENTO').asdatetime))+
                           ' AS DATAPAGAMENTO, '+_clinefeed+
                 OraNumero(QryPrinc.fieldbyname('VLRINFINSS').asstring)+' VLRINFINSS, '+_clinefeed+
                 QryPrinc.fieldbyname('IDSITPART').asstring+' IDSITPART, '+_clinefeed+
                 QryPrinc.fieldbyname('TEMPOSERVTOTAL').asstring+' TEMPOSERVTOTAL, '+_clinefeed+
                 QuotedStr(QryPrinc.fieldbyname('SEXO').asstring)+' SEXO, '+_clinefeed+
                 OraNumero(FloatToStr(dbValor))+' AS VLBENEFPGTO, '+_clinefeed+
                 OraNumero(FloatToStr(dbValor))+' AS VALORATUAL, '+_clinefeed+
                 QuotedStr(sMesReferencia)+' AS ANOREF '+_clinefeed+
                 ' FROM DUAL '+_clinefeed;

      // Executa a regra de abono
      try
        sValorAtualBenef:=RegraNumerica(
           inttostr(qryPrinc.fieldbyname('IDREGRACALCABONO').AsInteger),
           ssqlregra,bErro,iIdCalculoGeral);
      except
        sValorAtualBenef:='0';
        bErro:=true;
      end;

      if berro then
      begin
        memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(qryPrinc.fieldbyname('IDREGRACALCABONO').AsInteger));
        memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
        memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
        memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
        exit;
      end;
      try
        dbValor:=strtofloat(ClienteNumero(sValorAtualBenef));
      except
        memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(qryPrinc.fieldbyname('IDREGRACALCABONO').AsInteger));
        memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
        memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
        memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
        dbValor:=0;
        exit;
      end;
      if dbValor = 0 then
      begin
        memResult.Lines.Add('Valor Zero [EXECUÇÃO DA REGRA] - Número : '+inttostr(qryPrinc.fieldbyname('IDREGRACALCABONO').AsInteger));
        memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
        memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
        memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
      end;
    end; // Abono

    // Antecipação do abono
    if (RdgTpFolha.ItemIndex = 2) then
    begin
      if (qryprinc.fieldbyname('DATAINICIO').asstring = '') or
         (qryprinc.fieldbyname('DATAINICIO').isnull) then
      begin
        memResult.Lines.Add('Erro : Data início não preenchida');
        memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
        memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
        memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
        dbValor:=0;
        exit;
      end;

      //ANTECIPACAO DE ABONO
      if (qryprinc.fieldbyname('IDREGRAANTECIPABONO').asinteger > 0) then
      begin
        // Select da regra de antecipação
        ssqlregra:=' SELECT '+_clinefeed+
                   inttostr(qryPrinc.fieldbyname('idtitular').AsInteger) + ' AS IDTITULAR, '+_clinefeed+
                   inttostr(qryPrinc.fieldbyname('idpessoa').AsInteger) + ' AS IDPESSOA, '+_clinefeed+
                   sidpatro + ' AS IDPESSJUR, '+_clinefeed+
                   sidplano + ' AS IDPLANOPREV, '+_clinefeed+
                   quotedstr(lsInscricao)+' AS INSCRICAODATA, '+_clinefeed+ 
                   '1 AS SEQPROPOSTA, '+_clinefeed+
                   inttostr(qryPrinc.fieldbyname('IDREGRAANTECIPABONO').asinteger)+' AS REGRANTECIPABONO, '+_clinefeed+
                   oranumero(formatfloat('#0.00', qryPrinc.fieldbyname('PERCANTECIPABONO').asfloat))+' AS PERCANTECIPABONO, '+_clinefeed+
                   inttostr(qryPrinc.fieldbyname('IDBENEFICIO').asinteger)+' AS IDBENEFICIO, '+_clinefeed+
                   QuotedStr(qryprinc.fieldbyname('DATAINICIO').asstring)+' AS DATAINICIO, '+_clinefeed+
                   QuotedStr(qryprinc.fieldbyname('DATAINICIOFUND').asstring)+' AS DATAINICIOFUND, '+_clinefeed+
                   QuotedStr(PegaDataFinal)+' AS DATAFINAL, '+_clinefeed+
                   QuotedStr(PegaDataFinal)+' AS DATAREF, '+_clinefeed+
                   QuotedStr(sMesReferencia)+' AS MESREFERENCIA, '+_clinefeed+
                   QuotedStr(sMesReferencia)+' AS ANOMESREF, '+_clinefeed+
                   QuotedStr(formatdatetime('dd/mm/yyyy',
                             qryCtrlinterface.fieldbyname('DATAPAGAMENTO').asdatetime))+
                             ' AS DATAPAGAMENTO, '+_clinefeed+
                   OraNumero(QryPrinc.fieldbyname('VLRINFINSS').asstring)+' VLRINFINSS, '+_clinefeed+
                   QryPrinc.fieldbyname('IDSITPART').asstring+' IDSITPART, '+_clinefeed+
                   QryPrinc.fieldbyname('TEMPOSERVTOTAL').asstring+' TEMPOSERVTOTAL, '+_clinefeed+
                   QuotedStr(QryPrinc.fieldbyname('SEXO').asstring)+' SEXO, '+_clinefeed+
                   OraNumero(FloatToStr(dbValor))+' AS VLBENEFPGTO, '+_clinefeed+
                   OraNumero(FloatToStr(dbValor))+' AS VALORATUAL, '+_clinefeed+
                   QuotedStr(sMesReferencia)+' AS ANOREF '+_clinefeed+
                   ' FROM DUAL '+_clinefeed;

        // Executa a regra de Antecipação de abono
        try
          sValorAtualBenef:=RegraNumerica(
             inttostr(qryPrinc.fieldbyname('IDREGRAANTECIPABONO').AsInteger),
             ssqlregra,bErro,iIdCalculoGeral);
        except
          sValorAtualBenef:='0';
          bErro:=true;
        end;

        if berro then
        begin
          memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(qryPrinc.fieldbyname('IDREGRAANTECIPABONO').AsInteger));
          memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
          memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
          memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
          exit;
        end;

        try
          dbValor:=strtofloat(clientenumero(sValorAtualBenef));
        except
          memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(qryPrinc.fieldbyname('IDREGRACALCABONO').AsInteger));
          memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
          memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
          memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
          dbValor:=0;
          exit;
        end;
      end
      else
      begin
        dbValor:=dbValor*qryPrinc.fieldbyname('PERCANTECIPABONO').asfloat/100;
        sValorAtualBenef:=floattostr(dbvalor);
      end;
    end; //Antecipação de abono
  end;

  // Recalcula os benefícios todo mês
  // SOL 197395 - KTN 1890667
  {if qryPrinc.fieldbyname('FlgCalcTodoMes').AsInteger = 1 then
  begin
    if not ReajustaBeneficioMensal(dbValor,qryPrinc.fieldbyname('ValorCotas').AsFloat) then
      exit;
  end;}
  // SOL 197395 - KTN 1890667
  result:=true;
end;

function TfrmPreparo.GravaHstBeneficio : boolean;
 var iDia, iMes, iAno : Integer;
     iidtitular, iidgtpfolha : integer;
begin
  try
    // SOL 63067 - KTN 524520
    if RdgTpFolha.ItemIndex <> 3 then
       iidgtpfolha := rdgtpfolha.itemindex
    else
       iidgtpfolha := 0;
    // SOL 63067 - KTN 524520

    iidtitular:=qryPrinc.fieldbyname('IDTITULAR').ASINTEGER;
    if qryPrinc.fieldbyname('QtdeMeses').AsInteger <> 0 then
    begin
      sData1:=DataBrit(sMesAnterior + '/01');
      sData2:=DataBrit(sMesReferencia + '/01');

      if CalculaData(sData1,sData2,iDia,iMes,iAno) then
      begin
        iMes:=iMes + 12 * iAno;
        if ((iMes mod qryPrinc.fieldbyname('QtdeMeses').AsInteger) = 0)
           or (RdgTpFolha.ItemIndex = 3) // SOL 63067 - KTN 524520
        then
          InsereHstBfciario(
            qryInsHstBfciario,
            iidgtpfolha, // SOL 63067 - KTN 524520
            qryPrinc.fieldbyname('IDTITULAR').asinteger,
            qryPrinc.fieldbyname('IDPESSOA').asinteger,
            qryPrinc.fieldbyname('IDPESSJUR').asinteger,
            qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
            qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger,
            qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
            qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger,
            smesreferencia,
            smesabono,
            qryctrlinterface.fieldbyname('DATAPAGAMENTO').asstring,
            qryPrinc.fieldbyname('SEQPROPOSTA').asinteger,
            1,
            qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger,
            iidlote,
            qryPrinc.fieldbyname('FONTEPAGADORA').asinteger,
            qryPrinc.fieldbyname('CODPORTFORMA').asinteger,
            qryPrinc.fieldbyname('FLGPROVISORIO').asinteger,
            qryPrinc.fieldbyname('FLGDESCIRMES').asinteger,
            qryPrinc.fieldbyname('FLGDEVOLUCAO').asinteger,
            qryPrinc.fieldbyname('IDREGRACALCULO').asstring,
            sValorAtualBenef,
            qryPrinc.fieldbyname('VALORCALCULADO').asstring,
            sValorIntegralBenef,
            sValorTotalBenef,
            qryPrinc.fieldbyname('VALORSRB').asstring,
            qryPrinc.fieldbyname('VALORBASE1_BEN').asstring,
            qryPrinc.fieldbyname('VALORBASE2_BEN').asstring,
            qryPrinc.fieldbyname('VALORBASE3_BEN').asstring,
            0, 
            iidgtpfolha, //GRAVAR O FLGTIPOREGISTRO  63067
            qryPrinc.fieldbyname('FLGREFERENCIA').asinteger,
            qryPrinc.fieldbyname('FLGPAGAINSS').asinteger,
            qryPrinc.fieldbyname('FLGPAGAINSSBENEF').asinteger,
            qryPrinc.fieldbyname('FLGSTATUS').asstring,
            qryPrinc.fieldbyname('PERCENTUAL').asfloat,
            sidlotegravado);
      end
      else
      begin
        memResult.Lines.Add('Erro no cálculo da periodicidade do Benefício Mensal a Pagar para o Beneficiário : '+
          Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
          Trim(qryPrinc.fieldbyname('Beneficio').asstring));
        result:=false;
        exit;
      end;
    end
    else
    begin // Pagamento Único
      if RetornaAnoMes(qryPrinc.fieldbyname('DataInicio').AsDateTime) = sMesReferencia then
      begin
        InsereHstBfciario(
          qryInsHstBfciario,
          iidgtpfolha, // SOL 63067 - KTN 524520
          qryPrinc.fieldbyname('IDTITULAR').asinteger,
          qryPrinc.fieldbyname('IDPESSOA').asinteger,
          qryPrinc.fieldbyname('IDPESSJUR').asinteger,
          qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
          qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger,
          qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
          qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger,
          smesreferencia,
          smesabono,
          qryctrlinterface.fieldbyname('DATAPAGAMENTO').asstring,
          qryPrinc.fieldbyname('SEQPROPOSTA').asinteger,
          1,
          qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger,
          iidlote,
          qryPrinc.fieldbyname('FONTEPAGADORA').asinteger,
          qryPrinc.fieldbyname('CODPORTFORMA').asinteger,
          qryPrinc.fieldbyname('FLGPROVISORIO').asinteger,
          qryPrinc.fieldbyname('FLGDESCIRMES').asinteger,
          qryPrinc.fieldbyname('FLGDEVOLUCAO').asinteger,
          qryPrinc.fieldbyname('IDREGRACALCULO').asstring,
          sValorAtualBenef,
          qryPrinc.fieldbyname('VALORCALCULADO').asstring,
          sValorIntegralBenef,
          sValorTotalBenef,
          qryPrinc.fieldbyname('VALORSRB').asstring,
          qryPrinc.fieldbyname('VALORBASE1_BEN').asstring,
          qryPrinc.fieldbyname('VALORBASE2_BEN').asstring,
          qryPrinc.fieldbyname('VALORBASE3_BEN').asstring,
          0, 
          iidgtpfolha, //GRAVAR O FLGTIPOREGISTRO 63067
          qryPrinc.fieldbyname('FLGREFERENCIA').asinteger, 
          qryPrinc.fieldbyname('FLGPAGAINSS').asinteger,
          qryPrinc.fieldbyname('FLGPAGAINSSBENEF').asinteger, 
          qryPrinc.fieldbyname('FLGSTATUS').asstring, 
          qryPrinc.fieldbyname('PERCENTUAL').asfloat, 
          sidlotegravado);
      end
      else
      begin
        memResult.Lines.Add('Erro no cálculo da periodicidade do Benefício Único a Pagar para o Beneficiário : '+
          Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
          Trim(qryPrinc.fieldbyname('Beneficio').asstring));
        result:=false;
        exit;
      end;
    end;


   //Renato Visoni SOL 126249 Kintana 658263
    if rdgtpfolha.itemindex <> 0   then begin
      QryAux.CLose;
      QryAux.SQL.Clear;

      QryAux.SQL.Add(' SELECT COUNT(*) QNTD FROM hstbenefbfciario ');
      QryAux.SQL.Add(' WHERE idpessoa    = '+ qryPrinc.fieldbyname('IDPESSOA').asString  );
      QryAux.SQL.Add(' and idtitular     = '+ qryPrinc.fieldbyname('IDTITULAR').asString );
      QryAux.SQL.Add(' and idpessjur     = '+ qryPrinc.fieldbyname('IDPESSJUR').asString );
      QryAux.SQL.Add(' and idplanoprev   = '+ qryPrinc.fieldbyname('IDPLANOPREV').asString );
      QryAux.SQL.Add(' and mes = (SELECT MESREFERENCIA FROM CTRLINTERFACE WHERE IDLOTE ='+intTostr(iidlote)+' )');
      QryAux.SQL.Add(' and mesreferencia = '+ QuotedStr(smesabono));
      QryAux.SQL.Add(' and flgtiporegistro = ' + intTostr(rdgtpfolha.itemindex));
      QryAux.SQL.Add(' and idbeneficio = ' + qryPrinc.fieldbyname('IDBENEFICIO').asString); //Gustavo Terra / Thiago Passos SOL 127088
      QryAux.SQL.Add(' and fontepagadora = ' + qryPrinc.fieldbyname('FONTEPAGADORA').asString);//Gustavo Terra / Thiago Passos SOL 127088

      QryAux.Open;

      if QryAux.FieldByname('QNTD').asInteger = 0 then begin
        if NaoExisteHSTBENEFBFCIARIO(sSQLValida) then begin // renato visoni SOL 126894 - KINTANA 667862
          Try //Brunno Mattos - KTN 767861 - SOL 132659
          qryInsHstBfciario.ExecSql;
          //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          Except
            on e:Exception do
            begin
              TratarErro(e.Message);
              Exit;
            end;
          end;
           //Brunno Mattos - KTN 767861 - SOL 132659 Fim
        end;
      end;

    end else begin
      if NaoExisteHSTBENEFBFCIARIO(sSQLValida) then begin // renato visoni SOL 126894 - KINTANA 667862
        Try
        qryInsHstBfciario.ExecSql;
        //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
        Except
          on e:Exception do
          begin
            TratarErro(e.Message);
            Exit;            
          end;
        end;
        //Brunno Mattos - KTN 767861 - SOL 132659 Fim
      end;
    end;
    //Renato Visoni SOL 126249 Kintana 658263

    //NÃO SOMAR SE FOR BENEFICIO DE REFERENCIA
    if qryPrinc.fieldbyname('FlgReferencia').AsInteger = 0 then
    begin
      dbTotalBenef:=dbTotalBenef+StrToFloat(ClienteNumero(sValorAtualBenef));
      dbTotalIntegral:=dbTotalIntegral+StrToFloat(ClienteNumero(sValorIntegralBenef));
    end
    Else
    begin
      dbTotalBenefInss    := dbTotalBenefInss    + StrToFloat(ClienteNumero(sValorTotalBenef));
      dbValorAtualInss    := dbValorAtualInss + StrToFloat(ClienteNumero(sValorAtualBenef));
      dbTotalIntegralInss := dbTotalIntegralInss + StrToFloat(ClienteNumero(sValorIntegralBenef));
    end;
  except
    on E:Exception do
    begin
      memResult.Lines.Add('Erro ao gravar Histórico de Benefício Mensal a Pagar para o Beneficiário : '+
        Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
        Trim(qryPrinc.fieldbyname('Beneficio').asstring));
      memResult.Lines.Add('Mensagem de erro : '+E.Message);
      result:=false;
      exit;
    end;
  end;

  // Passa parâmetros para Atualizar o UltMesPreparo na Benefbfciario
  if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
  begin
    qryUpdBenefBfciario.close;
    qryUpdBenefBfciario.ParamByName('pULTMESPREPARO').asstring:=sMesReferencia;
    qryUpdBenefBfciario.ParamByName('pULTVALORATUAL').AsFloat:=StrToFloat(ClienteNumero(sValorAtualBenef));
    qryUpdBenefBfciario.ParamByName('pIDPLANOPREV').AsInteger:=qryPrinc.fieldbyname('IdPlanoPrev').AsInteger;
    //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
    qryUpdBenefBfciario.ParamByName('pIDPLANOORIGEM').AsInteger:=qryPrinc.fieldbyname('IdPlanoORIGEM').AsInteger;
    qryUpdBenefBfciario.ParamByName('pIDTITULAR').AsInteger:=qryPrinc.fieldbyname('IdTitular').AsInteger;
    qryUpdBenefBfciario.ParamByName('pIDPESSJUR').AsInteger:=qryPrinc.fieldbyname('IdPessJur').AsInteger;
    qryUpdBenefBfciario.ParamByName('pNUMEROPROCESSO').AsInteger:=qryPrinc.fieldbyname('NumeroProcesso').AsInteger;
    qryUpdBenefBfciario.ParamByName('pIDBENEFICIO').AsInteger:=qryPrinc.fieldbyname('IdBeneficio').AsInteger;
    qryUpdBenefBfciario.ParamByName('pIDPESSOA').AsInteger:=qryPrinc.fieldbyname('IdPessoa').AsInteger;
    qryUpdBenefBfciario.ParamByName('pSEQPROPOSTA').AsInteger:=qryPrinc.fieldbyname('SeqProposta').AsInteger;
    try
      qryUpdBenefBfciario.ExecSql;
    except
      on E:Exception do
      begin
        TratarErro(e.Message);
        memResult.Lines.Add('Erro ao Atualizar informações do Benefício para o Beneficiário : '+
          Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
          Trim(qryPrinc.fieldbyname('Beneficio').asstring));
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        result:=false;
        exit;
      end;
    end;
  end
  else
  begin
    qryUpdBenefbfciarioAbono.close;
    qryUpdBenefbfciarioAbono.ParamByName('pULTVALORATUAL').AsFloat:=dbValor;
    qryUpdBenefbfciarioAbono.ParamByName('pIDPLANOPREV').AsInteger:=qryPrinc.fieldbyname('IdPlanoPrev').AsInteger;
    //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
    qryUpdBenefbfciarioAbono.ParamByName('pIDPLANOORIGEM').AsInteger:=qryPrinc.fieldbyname('IdPlanoORIGEM').AsInteger;
    qryUpdBenefbfciarioAbono.ParamByName('pIDTITULAR').AsInteger:=qryPrinc.fieldbyname('IdTitular').AsInteger;
    qryUpdBenefbfciarioAbono.ParamByName('pIDPESSJUR').AsInteger:=qryPrinc.fieldbyname('IdPessJur').AsInteger;
    qryUpdBenefbfciarioAbono.ParamByName('pNUMEROPROCESSO').AsInteger:=qryPrinc.fieldbyname('NumeroProcesso').AsInteger;
    qryUpdBenefbfciarioAbono.ParamByName('pIDBENEFICIO').AsInteger:=qryPrinc.fieldbyname('IdBeneficio').AsInteger;
    qryUpdBenefbfciarioAbono.ParamByName('pIDPESSOA').AsInteger:=qryPrinc.fieldbyname('IdPessoa').AsInteger;
    qryUpdBenefbfciarioAbono.ParamByName('pSEQPROPOSTA').AsInteger:=qryPrinc.fieldbyname('SeqProposta').AsInteger;
    try
      qryUpdBenefbfciarioAbono.ExecSQL;
    except
      on E:Exception do
      begin
        TratarErro(e.Message);
        memResult.Lines.Add('Erro ao Atualizar informações de Abono do Benefício para o Beneficiário : '+
          Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
          Trim(qryPrinc.fieldbyname('Beneficio').asstring));
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        result:=false;
        exit;
      end;
    end;
  end;

  //EXECUTA A ROTINA DE BUSCA PARA BENEFICIO CORRENTE
  if (RdgTpFolha.ItemIndex = 1) then
  begin
    if gbBuscaAntecipAbono then //CONTROLA execução da BUSCA DOS ADIANTAMENTOS DE ABONO
      BuscaLancaAbonoBeneficioProcessados(
        qryPrinc.fieldbyname('IDREGRACALCULO').AsInteger,
        qryPrinc.fieldbyname('IdPessJur').AsInteger,
        qryPrinc.fieldbyname('IdPlanoPrev').AsInteger,
        qryPrinc.fieldbyname('IdPlanoOrigem').AsInteger,
        qryPrinc.fieldbyname('IdBeneficio').AsInteger,
        qryPrinc.fieldbyname('SeqProposta').AsInteger,
        qryPrinc.fieldbyname('NumeroProcesso').Asinteger,
        qryPrinc.fieldbyname('IdsitBeneficio').AsInteger,
        qryPrinc.fieldbyname('FONTEPAGADORA').asinteger,
        qryPrinc.fieldbyname('CODPORTFORMA').asinteger,
        qryPrinc.fieldbyname('IdTitular').AsInteger,
        qryPrinc.fieldbyname('IdPessoa').AsInteger,
        QryPrinc.fieldbyname('NOME').asstring,
        QryPrinc.fieldbyname('BENEFICIO').asstring,
        qryPrinc.fieldbyname('FLGCALCTODOMES').asstring,
        qryPrinc.fieldbyname('FLGPROVISORIO').asstring,
        qryPrinc.fieldbyname('flgdescirmes').AsString,
        '1', 
        qryPrinc.fieldbyname('valoratual').AsString,
        qryPrinc.fieldbyname('valortotal').AsString,
        qryPrinc.fieldbyname('VALORSRB').AsString,
        qryPrinc.fieldbyname('VALORCALCULADO').AsString,
        qryPrinc.fieldbyname('VALORBASE1_BEN').AsString,
        qryPrinc.fieldbyname('VALORBASE2_BEN').AsString,
        qryPrinc.fieldbyname('VALORBASE3_BEN').AsString,
        qryPrinc.fieldbyname('PERCENTUAL').asfloat 
      );
    
    if (qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger = 1) and
       SistemaFolha.FlgBuscaAbonoAnteriorPago then
      BuscaAbonoBeneficioTemporario;
  end;

  result:=true;
end;

function TfrmPreparo.GravaProcessoBeneficio(
  var abPreparouBeneficio: boolean): boolean;
 var sdata : string;
     iidtit : integer;
     lbcomerro: boolean;
     dValorMes: double;
begin
  result:=false;
  bGeraAbono:=false;
  rProRata:=1;
  osDataInicio:='';  osdatafinal:='';
  abPreparouBeneficio:=false; 
  if sValorAtualBenef = '' then sValorAtualBenef:='0';
  if sValorIntegralBenef = '' then sValorIntegralBenef:='0'; 
  //PERMITIR GRAVAÇÃO SE VALOR É ZERO
  if (qryPrinc.fieldbyname('FLGACEITAZERO').asinteger = 1) or
     (strtofloat(ClienteNumero(sValorAtualBenef)) > 0) then
  begin
    if not GravaHstBeneficio then
      exit;

    abPreparouBeneficio:=true;
    // Preparo Normal
    iEstaEmUltimoPagamento:=0;
    if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3 ) then
    begin
      if FaseGrupoEncerramento then
      begin
        try
          dbTotalBenef:=dbTotalBenef-StrToFloat(ClienteNumero(sValorAtualBenef));

          dValorMes:=TrataUltimoPagtoGrupoFamiliar(
            qryPrinc,
            qryAux2,
            qryAux3,
            sValorAtualBenef,
            sValorTotalBenef,
            iIdLote,
            sMesReferencia,
            dbTotalIntegralInss,
            dbTotalBenefInss,
            lbcomerro);

          if lbcomerro then
            memResult.Lines.Add('Erro[Tratamento do último pagamento] - Beneficiário : '+
              Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
              Trim(qryPrinc.fieldbyname('Beneficio').asstring)+' '+
              qryPrinc.fieldbyname('IDTITULAR').Asstring)
          else
          begin
            dbTotalBenef:=dbTotalBenef+dValorMes;
            
            if (qryPrinc.fieldbyname('IDTITULAR').asfloat <>
                qryPrinc.fieldbyname('IDPESSOA').asfloat) then
            begin
              if prmFLGATUPERCGF = 1 then
              begin
                if not CtrlBenefBfciario.AtualizaNumeroBeneficiarios(
                         qryPrinc.fieldbyname('NUMEROPROCESSO').AsInteger,
                         qryPrinc.fieldbyname('IDBENEFICIO').AsInteger) then
                begin
                  memResult.Lines.Add(
                    'Erro no recalculo dos percentuais da Pensão - Benefício : '+
                    Trim(qryPrinc.fieldbyname('Beneficio').asstring)+' - '+
                    qryPrinc.fieldbyname('IDTITULAR').Asstring);
                end;
              end;
            end;
          end;
        except
          memResult.Lines.Add('Erro[Tratamento do último pagamento] - Beneficiário : '+
                              Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
                              Trim(qryPrinc.fieldbyname('Beneficio').asstring)+' '+
                              qryPrinc.fieldbyname('IDTITULAR').Asstring);
        end;
      end
      else
      begin
        // Atualiza o ultmespreparo
        //INCLUSAO DO TRATAMENTO DE PRORATA DO ULTIMO PAGAMENTO
        // QUANDO O BENEFICIO ESTA EM DATAFINALPREVISTA
        //TRATA ENCERRAMENTO E RETENÇÃO APENAS SE SITUAÇÃO DO BENEFÍCIO FOR ATIVO
        //TRATA ENCERRAMENTO E RETENÇÃO DE INSS
        if (qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger = 1) or
           ((qryPrinc.fieldbyname('FlgReferencia').AsInteger = 1) and
            (qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger = 6)) then
        begin
          if not qryPrinc.fieldbyname('DATAFINAL').isnull or
             not qryPrinc.fieldbyname('DATAFINALPREVISTA').isnull then
          begin
            if not qryPrinc.fieldbyname('DATAFINAL').isnull then
            begin
              osdatafinal:=formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAFINAL').asdatetime);
              sdata:=formatdatetime('yyyy/mm', qryPrinc.fieldbyname('DATAFINAL').asdatetime);
              iEstaEmUltimoPagamento:=1;
            end
            else
            begin
              osdatafinal:=formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAFINALPREVISTA').asdatetime);
              sdata:=formatdatetime('yyyy/mm', qryPrinc.fieldbyname('DATAFINALPREVISTA').asdatetime);
              iEstaEmUltimoPagamento:=2;
            end;
            // PARA CALCULAR O PRORATA NÃO BASTA AS DATAS FINAL E/OU PREVISTA ESTAREM PREENCHIDAS
            // ELAS TEM QUE ESTAR NO MESMO MES DE PROCESSAMENTO DA FOLHA
            if sdata = sMesReferencia then
            begin
              osDataInicio:=formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime);
              rProRata:=CalculaProRata(osdatafinal);
              IdTitularUltPgto:=qryPrinc.fieldbyname('IdTitular').AsInteger;
              //SÓ PAGA ABONO PARA BENEFICIO EM DATAFINAL
              if not qryPrinc.fieldbyname('DATAFINAL').isnull then
                if (qryprinc.fieldbyname('FLGPOSSUIABONO').AsInteger=1) and
                   (qryprinc.fieldbyname('FLGABONOFINALBEN').AsInteger=1) then
                begin
                  bGeraAbono:=true;
                  dValorAbono:=GeraAbonoUltimoPgto(
                    qryPrinc.fieldbyname('IDREGRACALCABONO').AsInteger,
                    qryPrinc.fieldbyname('IdPessJur').AsInteger,
                    qryPrinc.fieldbyname('IdPlanoPrev').AsInteger,
                    qryPrinc.fieldbyname('IdPlanoOrigem').AsInteger,
                    qryPrinc.fieldbyname('IdBeneficio').AsInteger,
                    qryPrinc.fieldbyname('SeqProposta').AsInteger,
                    qryPrinc.fieldbyname('NumeroProcesso').Asinteger,
                    qryPrinc.fieldbyname('IdsitBeneficio').AsInteger,
                    qryPrinc.fieldbyname('FONTEPAGADORA').asinteger,
                    qryPrinc.fieldbyname('CODPORTFORMA').asinteger,
                    qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger,
                    qryPrinc.fieldbyname('IdTitular').AsInteger,
                    qryPrinc.fieldbyname('IdPessoa').AsInteger,
                    QryPrinc.fieldbyname('NOME').asstring,
                    QryPrinc.fieldbyname('BENEFICIO').asstring,
                    qryPrinc.fieldbyname('FLGCALCTODOMES').asstring,
                    qryPrinc.fieldbyname('FLGPROVISORIO').asstring,
                    qryPrinc.fieldbyname('flgdescirmes').AsString,
                    qryPrinc.fieldbyname('flgdevolucao').AsString,
                    sValorAtualBenef,
                    sValorTotalBenef,
                    qryPrinc.fieldbyname('VALORSRB').AsString,
                    qryPrinc.fieldbyname('VALORCALCULADO').AsString,
                    qryPrinc.fieldbyname('VALORBASE1_BEN').AsString,
                    qryPrinc.fieldbyname('VALORBASE2_BEN').AsString,
                    qryPrinc.fieldbyname('VALORBASE3_BEN').AsString,
                    qryPrinc.fieldbyname('DataInicio').asdatetime,
                    qryPrinc.fieldbyname('DataFinal').asdatetime,
                    qryPrinc.fieldbyname('MESPGABONO').asinteger,
                    qryPrinc.fieldbyname('PERCENTUAL').asfloat
                    );
                end;

              //Trata o ultimo pagamento do beneficio
              if (IdTitularUltPgto <> 0) then
                if (not qryPrinc.eof) Then
                begin
                  try
                    dbTotalBenef:=dbTotalBenef-StrToFloat(ClienteNumero(sValorAtualBenef));

                    dValorMes:=TrataUltimoPagto(
                      qryPrinc,
                      qryAux2,
                      qryAux3,
                      sValorAtualBenef,
                      sValorTotalBenef,
                      iIdLote,
                      sMesReferencia,
                      dbTotalIntegralInss,
                      dbTotalBenefInss,
                      lbcomerro);

                    if lbcomerro then
                      memResult.Lines.Add('Erro[Tratamento do último pagamento] - Beneficiário : '+
                        Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
                        Trim(qryPrinc.fieldbyname('Beneficio').asstring)+' '+
                        qryPrinc.fieldbyname('IDTITULAR').Asstring)
                    else
                    begin
                      dbTotalBenef:=dbTotalBenef+dValorMes;

                      if (qryPrinc.fieldbyname('IDTITULAR').asfloat <>
                          qryPrinc.fieldbyname('IDPESSOA').asfloat) then
                      begin
                        if prmFLGATUPERCGF = 1 then
                        begin
                          if not CtrlBenefBfciario.AtualizaNumeroBeneficiarios(
                                   qryPrinc.fieldbyname('NUMEROPROCESSO').AsInteger,
                                   qryPrinc.fieldbyname('IDBENEFICIO').AsInteger) then
                          begin
                            memResult.Lines.Add(
                              'Erro no recalculo dos percentuais da Pensão - Benefício : '+
                              Trim(qryPrinc.fieldbyname('Beneficio').asstring)+' - '+
                              qryPrinc.fieldbyname('IDTITULAR').Asstring);
                          end;
                        end;
                      end;
                    end;
                  except
                    memResult.Lines.Add('Erro[Tratamento do último pagamento] - Beneficiário : '+
                                        Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
                                        Trim(qryPrinc.fieldbyname('Beneficio').asstring)+' '+
                                        qryPrinc.fieldbyname('IDTITULAR').Asstring);
                  end;
                  iidtit:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
                  while (iidtit < IdTitularUltPgto) and (not qryPrinc.eof) do
                    qryPrinc.Next;
                end;
            end
            else
              iEstaEmUltimoPagamento:=0;
          end;

             //Grava historico de percentual do grupo familiar
             //Thiago Passos SOL 32837  Kintana  660515

            // Renato Visoni SOL 139360 Kintana 855933
            {
            Retiramos a chamada dessa procedure pois estava dando
            erro e essa procedure precisa ser revisada,
            e será aberto um novo SOL para isso.
            }
            //GravaHstPercGrupo(qryPrinc.fieldbyname('IDTITULAR').Asstring,qryPrinc.fieldbyname('IdPessoa').AsString,qryPrinc.fieldbyname('IdPessJur').AsString,qryPrinc.fieldbyname('IdPlanoPrev').AsString,qryPrinc.fieldbyname('IdBeneficio').AsString,qryPrinc.fieldbyname('percentual').AsString,qryPrinc.fieldbyname('FontePagadora').AsString);
            // Renato Visoni SOL 139360 Kintana 855933
        end;
      end;
    end
    //TRATAR DATAS PARA ABONO ANUAL
    else
    begin
      osDataInicio:=formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime);
      if not qryPrinc.fieldbyname('DATAFINAL').isnull or
         not qryPrinc.fieldbyname('DATAFINALPREVISTA').isnull then
      begin
        if not qryPrinc.fieldbyname('DATAFINAL').isnull then
          osdatafinal:=formatdatetime('dd/mm/yyyy',
            qryPrinc.fieldbyname('DATAFINAL').asdatetime)
        else
          osdatafinal:=formatdatetime('dd/mm/yyyy',
            qryPrinc.fieldbyname('DATAFINALPREVISTA').asdatetime);
      end;
    end;
  end
  //AVISO DE BENEFICIO IGUAL A ZERO
  else
  begin
    memResult.Lines.Add(
      'Atenção: Benefício não preparado porque valor igual a zero - Beneficiário : '+
      Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
      Trim(qryPrinc.fieldbyname('Beneficio').asstring)+' - Matr.: '+
      qryPrinc.fieldbyname('IDTITULAR').Asstring);
    memResult.Lines.Add('----------------------------');
  end;

  result:=true;
end;

function TfrmPreparo.CalculaProRata(asdatafinal: string): real;
 var idia, imes, iano : integer;
begin
  idia:=strtoint(copy(asdatafinal,1,2));
  if idia > 30 then
    idia:=30
  else
  begin
    imes:=strtoint(copy(asdatafinal,4,2));
    if imes = 2 then
    begin
      iano:=strtoint(copy(asdatafinal,7,4));
      if iano div 4 = 0 then
      begin
        if idia = 29 then
          idia:=30;
      end
      else
      begin
        if idia = 28 then
          idia:=30;
      end;
    end;
  end;
  result:=idia/30;
end;

procedure TfrmPreparo.CalculaEnviaContribuicaoPensionista(asMesContrib : string);
 var lsSQLRegra : string;
     lsClausulaContrib : string;
     lsClausulaUltimo : string;
     lsDatas : string;
     ldProrata : double;
     liidregracalculo : integer;
     liidregraultimo : integer;
     adTotalBenef,
     adTotalIntegral,
     adValorContrib : double;
     ssql: string; 

  procedure DeterminaRegraCalculo;
  begin
    ldProrata:=1;
    liidRegraCalculo:=qryContribNucleo.fieldbyname('IDREGRACALCULO').AsInteger;
    liidregraultimo:=0;
    lsClausulaContrib:='AND (C.IDREGRACALCULO = '+IntToStr(liidregracalculo)+') ';
    if copy(asMesContrib,6,2) = '13' then
    begin
      if qryContribNucleo.fieldbyname('FLGCOBRADECTERC').asinteger = 1 then
      begin
        if not qryContribNucleo.fieldbyname('IDREGRACALCULO13').isnull then
        begin
          liidRegraCalculo:=qryContribNucleo.fieldbyname('IDREGRACALCULO13').AsInteger;
          lsClausulaContrib:='AND (C.IDREGRACALCULO13 = '+IntToStr(liidregracalculo)+') ';
          if not qryContribNucleo.fieldbyname('IDREGRAULTPGTO13').isnull and
             (qryContribNucleo.fieldbyname('IDREGRAULTPGTO13').asinteger > 0) then
          begin
            liidregraultimo:=qryContribNucleo.fieldbyname('IDREGRAULTPGTO13').asinteger;
            lsClausulaUltimo:='AND (C.IDREGRAULTPGTO13 = '+IntToStr(liidregraultimo)+') ';
            lsDatas:=QuotedStr(osDataInicio)+' AS DATAINICIO, '+
                     QuotedStr(osDataFinal)+' AS DATAFINAL, ';
          end;
        end;
      end
      else
      begin
        liidRegraCalculo:=0;
        lsClausulaContrib:='';
      end;
    end
    else
      if iEstaEmUltimoPagamento in [1,2] then
      begin
        if not qryContribNucleo.fieldbyname('IDREGRAULTPAGTO').isnull and
           (qryContribNucleo.fieldbyname('IDREGRAULTPAGTO').asinteger > 0) then
        begin
          liidregraultimo:=qryContribNucleo.fieldbyname('IDREGRAULTPAGTO').AsInteger;
          lsClausulaUltimo:='AND (C.IDREGRAULTPAGTO = '+IntToStr(liidregraultimo)+') ';
          lsDatas:=QuotedStr('01/'+copy(osDataFinal,4,10))+' AS DATAINICIO, '+
                   QuotedStr(osDataFinal)+' AS DATAFINAL, ';
        end
        else
          ldProrata:=CalculaProRata(osdatafinal);
      end;
  end;

  function ExecutaRegraUltima : boolean;
   var lsdataref : string;
  begin
    result:=false;
    
    if (osDataFinal = '') or
       (copy(osDataFinal,7,4)+'/'+copy(osDataFinal,4,2) <> sMesreferencia) then
      lsdataref:='01/'+copy(sMesreferencia,6,2)+'/'+copy(sMesreferencia,1,4)
    else
      lsdataref:=osDataFinal;

    lsSQLRegra:=
      'SELECT '+
         '0 AS FLGCONCESSAO, '+_clinefeed+
         inttostr(RdgTpFolha.ItemIndex)+ ' AS TIPOPREPARO, '+_clinefeed+ //SOL111112 - Ádler Souza
         FloatToStr(adValorContrib)+' AS VALORERFERENCIA, '+_clinefeed+
         QuotedStr(qryContribNucleo.fieldbyname('DATAINICIO').AsString)+' AS DATAINICIO, '+_clinefeed+
         QuotedStr(qryContribNucleo.fieldbyname('DATAFINAL').AsString)+' AS DATAFINAL, '+_clinefeed+
         qryContribNucleo.fieldbyname('IDPESSJUR').AsString+' AS IDPESSJUR, '+_clinefeed+
         qryContribNucleo.fieldbyname('IDPLANOPREV').AsString+' AS IDPLANOPREV, '+_clinefeed+
         qryContribNucleo.fieldbyname('IDTITULAR').AsString+' AS IDTITULAR, '+_clinefeed+
         inttostr(iRespNucleoCorrente)+' AS IDPESSOA, '+_clinefeed+
         asTipoFolhaContrib+' as TIPOFOLHA,'+_clinefeed+// Thiago e Gustava SOL 124272 Kintana 649353
         QuotedStr(lsdataref)+' AS DATAREF, '+_clinefeed+
         oranumero(floattostr(adTotalBenef))+' AS VALORATUAL, '+_clinefeed+
         oranumero(floattostr(adTotalIntegral))+' AS VALORINTEGRAL, '+_clinefeed+ 
         QuotedStr(asMesContrib)+' AS ANOMESREF, '+_clinefeed+ 
         QuotedStr(asMesContrib)+' AS MESREFERENCIA, '+_clinefeed+
         QuotedStr(sMesreferencia)+' AS MESCOBRANCA, '+_clinefeed+
         QuotedStr(sDataCobranca)+' AS DATACOBRANCA, '+_clinefeed+
         QuotedStr(' ')+' AS CODPORTFORMA, '+_clinefeed+
         floattostr(qryContribNucleo.fieldbyname('PERCCALCULO').asfloat)+' AS PERCCALCULO, '+_clinefeed+
         '1 AS SEQPROPOSTA, '+_clinefeed+
         qryContribNucleo.fieldbyname('IDCONTRIBUICAO').asstring+' AS IDCONTRIBUICAO, '+_clinefeed+
         '0 AS VALORBASE1, 0 AS VALORBASE2, 0 AS VALORBASE3, '+_clinefeed+
         ' C.IDRUBRICA, C.IDRUBDECTERC, '+_clinefeed+
         'C.IDRUBADIANT, C.IDRUBDEVOLADIANT, C.IDRUBADIANT13, C.IDRUBDEVADIANT13,  '+_clinefeed+
         'C.IDRUBACJUD, C.IDRUB13ACJUD, C.IDRUBDADACJUD, C.IDRUB13DESCACJUD, '+_clinefeed+
         inttostr(qryPrinc.fieldbyname('FLGPROVISORIO').asinteger)+' AS FLGPROVISORIO, '+_clinefeed+
         OraNumero(formatfloat('#0.000000',qryPrinc.fieldbyname('PERCPROVISORIO').asfloat))+' AS PERCPROVISORIO, '+_clinefeed+ 
         inttostr(qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger)+' AS PRAZOPROVISORIO, '+_clinefeed+ 
         qryContribNucleo.fieldbyname('IDBENEFICIO').AsString+' AS IDBENEFICIO '+_clinefeed+
      'FROM CONTPREV C '+_clinefeed+
      'WHERE C.IDCONTRIBUICAO = '+
        qryContribNucleo.fieldbyname('IDCONTRIBUICAO').asstring+_clinefeed+
      ' AND C.IDPLANOPREV = '+qryContribNucleo.fieldbyname('IDPLANOPREV').AsString+_clinefeed;

    qryPreparoContrib.close;
    qryPreparoContrib.SQL.Clear;
    qryPreparoContrib.SQL.Add(lsSQLRegra);
    try
      qryPreparoContrib.open;
    except
      on E:Exception do
      begin
        memResult.Lines.Add(' Contribuição : '+
          qryContribNucleo.fieldbyname('NOME').Asstring+
          ' Erro ao tentar ler contribuições de assistidos a preparar ... ');
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        qryContribNucleo.Next;
        exit;
      end;
    end;
    if not qryPreparoContrib.isempty then
    begin
      try
        regPreparoContrib.RuleName:=IntToStr(liidregraultimo);
        regPreparoContrib.Execute;
        if Trim(regPreparoContrib.Result) = '' then
          exit;
        try
          adValorContrib:=StrToFloat(ClienteNumero(regPreparoContrib.Result));
        except
          memResult.Lines.Add(' Matrícula : '+sUltMatricula+
                              ' valor de contribuição calculado pela regra '+
                              regPreparoContrib.RuleName+' inválido : '+regPreparoContrib.Result);
          inc(lcontERRO);
          exit;
        end;
      except
        memResult.Lines.Add(' Contribuição : '+qryContribNucleo.fieldbyname('NOME').Asstring+
                            ' Matrícula : '+sUltMatricula+
                            ' Erro ao executar regra de contribuição - '+'Regra : '+regPreparoContrib.RuleName+' ...');
        exit;
      end;
    end;
    result:=true;
  end;

  function ExecutaRegraCalculo : boolean;
   var lsdataref : string;
  begin
    result:=false;

    if (osDataFinal = '') or
       (copy(osDataFinal,7,4)+'/'+copy(osDataFinal,4,2) <> sMesreferencia) then
      lsdataref:='01/'+copy(sMesreferencia,6,2)+'/'+copy(sMesreferencia,1,4)
    else
      lsdataref:=osDataFinal;

    lsSQLRegra:=
      'SELECT '+_clinefeed+
        '0 AS FLGCONCESSAO, '+_clinefeed+
        inttostr(RdgTpFolha.ItemIndex)+ ' AS TIPOPREPARO, '+_clinefeed+ //SOL111112 - Ádler Souza
        asTipoFolhaContrib+' as TIPOFOLHA,'+_clinefeed+//Thiago e Gustava SOL 124272 Kintana 649353
        oranumero(floattostr(adTotalBenef))+' AS VALORPROVENTO, '+_clinefeed+
        oranumero(floattostr(adTotalBenef))+' AS SALPARTICIPACAO, '+_clinefeed+
        oranumero(floattostr(adTotalBenef))+' AS VLBENEFPGTO, '+_clinefeed+
        QuotedStr(qryContribNucleo.fieldbyname('DATAINICIO').AsString)+' AS DATAINICIO, '+_clinefeed+
        QuotedStr(qryContribNucleo.fieldbyname('DATAFINAL').AsString)+' AS DATAFINAL, '+_clinefeed+
        qryContribNucleo.fieldbyname('IDPESSJUR').AsString+' AS IDPESSJUR, '+_clinefeed+
        qryContribNucleo.fieldbyname('IDPLANOPREV').AsString+' AS IDPLANOPREV, '+_clinefeed+
        qryContribNucleo.fieldbyname('IDTITULAR').AsString+' AS IDTITULAR, '+_clinefeed+
        inttostr(iRespNucleoCorrente)+' AS IDPESSOA, '+_clinefeed+
        QuotedStr(lsdataref)+' AS DATAREF, '+_clinefeed+
        oranumero(floattostr(adTotalBenef))+' AS VALORATUAL, '+_clinefeed+
        oranumero(floattostr(adTotalIntegral))+' AS VALORINTEGRAL, '+_clinefeed+ 
        QuotedStr(asMesContrib)+' AS ANOMESREF, '+_clinefeed+ 
        QuotedStr(asMesContrib)+' AS MESREFERENCIA, '+_clinefeed+
        QuotedStr(sMesreferencia)+' AS MESCOBRANCA, '+_clinefeed+
        QuotedStr(sDataCobranca)+' AS DATACOBRANCA, '+_clinefeed+
        QuotedStr(' ')+' AS CODPORTFORMA, '+_clinefeed+
        floattostr(qryContribNucleo.fieldbyname('PERCCALCULO').asfloat)+' AS PERCCALCULO, '+_clinefeed+
        '1 AS SEQPROPOSTA, '+_clinefeed+
        qryContribNucleo.fieldbyname('IDCONTRIBUICAO').asstring+' AS IDCONTRIBUICAO, '+_clinefeed+
        '0 AS VALORBASE1, 0 AS VALORBASE2, 0 AS VALORBASE3, '+_clinefeed+
        ' C.IDRUBRICA, C.IDRUBDECTERC, '+_clinefeed+
        'C.IDRUBADIANT, C.IDRUBDEVOLADIANT, C.IDRUBADIANT13, C.IDRUBDEVADIANT13,  '+_clinefeed+
        'C.IDRUBACJUD, C.IDRUB13ACJUD, C.IDRUBDADACJUD, C.IDRUB13DESCACJUD, '+_clinefeed+
        inttostr(qryPrinc.fieldbyname('FLGPROVISORIO').asinteger)+' AS FLGPROVISORIO, '+_clinefeed+
        OraNumero(formatfloat('#0.000000',qryPrinc.fieldbyname('PERCPROVISORIO').asfloat))+' AS PERCPROVISORIO, '+_clinefeed+ 
        inttostr(qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger)+' AS PRAZOPROVISORIO, '+_clinefeed+ 
        qryContribNucleo.fieldbyname('IDBENEFICIO').AsString+' AS IDBENEFICIO '+_clinefeed+
     'FROM CONTPREV C '+_clinefeed+
     'WHERE C.IDCONTRIBUICAO = '+
       qryContribNucleo.fieldbyname('IDCONTRIBUICAO').asstring+_clinefeed+
     ' AND C.IDPLANOPREV = '+qryContribNucleo.fieldbyname('IDPLANOPREV').AsString+_clinefeed;

    qryPreparoContrib.close;
    qryPreparoContrib.SQL.Clear;
    qryPreparoContrib.SQL.Add(lsSQLRegra);
    try
      qryPreparoContrib.open;
    except
      on E:Exception do
      begin
        memResult.Lines.Add(' Contribuição : '+
          qryContribNucleo.fieldbyname('NOME').Asstring+
          ' Erro ao tentar ler contribuições de assistidos a preparar ... ');
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        qryContribNucleo.Next;
        exit;
      end;
    end;
    if not qryPreparoContrib.isempty then
    begin
      try
        regPreparoContrib.RuleName:=IntToStr(liidRegraCalculo);
        regPreparoContrib.Execute;
        if Trim(regPreparoContrib.Result) = '' then
        begin
          //MENSAGEM QUANDO REGRA RETORNA INVÁLIDO
          memResult.Lines.Add('Valor retornado pela execução da regra '+
            'de contribuição ['+inttostr(liidRegraCalculo)+'] inválido.');
          memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
          memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
          exit;
        end;
        try
          adValorContrib:=StrToFloat(ClienteNumero(regPreparoContrib.Result));
        except
          memResult.Lines.Add(' Matrícula : '+sUltMatricula+
                              ' valor de contribuição calculado pela regra '+
                              regPreparoContrib.RuleName+' inválido : '+regPreparoContrib.Result);
          inc(lcontERRO);
          exit;
        end;
      except
        memResult.Lines.Add(' Contribuição : '+qryContribNucleo.fieldbyname('NOME').Asstring+
                            ' Matrícula : '+sUltMatricula+
                            ' Erro ao executar regra de contribuição - '+'Regra : '+regPreparoContrib.RuleName+' ...');
        exit;
      end;
    end;
    result:=true;
  end;

begin
  sPagador := 'C';
  lstContribuicao:=tListaContribuicao.create;

  qryValorNucleo.close;

  ssql:=
    'SELECT SUM(H.VALORPREV) AS VALORPREV, SUM(H.VALORINTEGRAL) AS VALORINTEGRAL '+_clinefeed+
    'FROM HSTBENEFBFCIARIO H, BFCIARIOTITPLAN BFC, NUCLEOFAMILIAR NF, '+_clinefeed+
    '     BENEFPLANPREV B, PATRO PT '+_clinefeed;

  if (uppercase(sIdLoteGravado) = 'NULL') then
  begin
    ssql:=ssql+
      'WHERE H.MES = '+quotedstr(sMesReferencia)+' '+_clinefeed+
      'AND H.IDLOTE IS NULL '+_clinefeed;
  end
  else
  begin
    ssql:=ssql+
      'WHERE H.IDLOTE = '+inttostr(iIdlote)+' '+_clinefeed;
  end;

  //Renato Visoni SOL 139360 Kintana 855933
  if sUltNumProcesso <> '' then begin
    ssql := ssql +
     ' AND H.NUMEROPROCESSO = '+ sUltNumProcesso;
  end;
  sUltNumProcesso:='';
  //Renato Visoni SOL 139360 Kintana 855933

  if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
    ssql:=ssql+
      'AND H.MESREFERENCIA = '+quotedstr(asmescontrib)+' '+_clinefeed
  else
    ssql:=ssql+
      'AND H.MESREFERENCIA = '+quotedstr(smesabono)+' '+_clinefeed;

  ssql:=ssql+
    'AND NVL(H.FLGDEVOLUCAO,0) = 0 '+_clinefeed+
    'AND H.IDPESSJUR = '+inttostr(iultidpessjur)+' '+_clinefeed+
    'AND H.IDPESSOA    = '+inttostr(iUltIdPessoa)+' '+_clinefeed+  // Fernando Santana - SOL 144908 KINTANA 962232
    'AND H.IDPLANOPREV = '+inttostr(iultidplanoprev)+' '+_clinefeed+
    'AND H.IDPLANOPREV = BFC.IDPLANOPREV '+_clinefeed+
    'AND H.IDTITULAR = BFC.IDTITULAR '+_clinefeed+
    'AND H.IDPESSOA = BFC.IDPESSOA '+_clinefeed+
    'AND H.IDBENEFICIO = BFC.IDBENEFICIO '+_clinefeed+
    'AND B.IDBENEFICIO = H.IDBENEFICIO '+_clinefeed+
    'AND B.IDPLANOPREV = H.IDPLANOPREV '+_clinefeed+
    'AND B.FLGREFERENCIA = 0 '+_clinefeed+
    'AND BFC.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR '+_clinefeed+
    'AND NF.IDRESPNUCLEO = '+inttostr(iRespNucleoCorrente)+' '+_clinefeed+
    'AND PT.IDPESSOA = H.IDPESSJUR '+_clinefeed+
    'AND H.IDPLANOORIGEM = BFC.IDPLANOORIGEM'+_clinefeed+// Fernando Santana - SOL 144908 KINTANA 962232
    'AND PT.IDFUNDACAO = '+inttostr(iidfundacao)+' '+_clinefeed;

  if (RdgTpFolha.ItemIndex <> 0) or
     (copy(asmescontrib,6,2) = '13') then
    ssql:=ssql+
      'AND H.IDMOTIVO = '+inttostr(prmIdMotivoAbono)+' '+_clinefeed
  else
    ssql:=ssql+
      'AND H.IDMOTIVO = '+inttostr(prmIdMotivoFolhaBen)+' '+_clinefeed;

  qryValorNucleo.sql.clear;
  qryValorNucleo.sql.add(ssql);

  qryValorNucleo.open;

  adTotalBenef:=qryValorNucleo.fieldbyname('VALORPREV').asfloat;
  adTotalIntegral:=qryValorNucleo.fieldbyname('VALORINTEGRAL').asfloat;

  qryContribNucleo.close;
  ssql:=
    'SELECT DISTINCT CPN.IDCONTRIBUICAO, '+#13#10+
           'CTP.IDCONTRIBPAI, CTP.IDCONTRIBPAI2, CTP.IDCONTRIBPAI3, '+_clinefeed+
           '0 AS VALORBASE1, 0 AS VALORBASE2, 0 AS VALORBASE3, '+_clinefeed+
           'CTP.IDREGRACALCULO, CTP.IDREGRAULTPAGTO, '+_clinefeed+
           'CTP.IDREGRACALCULO13, CTP.IDREGRAULTPGTO13, '+_clinefeed+
           'CPN.DATAINICIO, CPN.DATAFINAL, '+_clinefeed+
           'BFC.IDPESSJUR, BFC.IDPLANOPREV, BFC.IDBENEFICIO, BFC.IDTITULAR, '+_clinefeed+
           'CTP.PERCCALCULO, CTP.FLGCOBRADECTERC, CON.NOME '+_clinefeed+
    'FROM BFCIARIOTITPLAN BFC, CONTRIBPREVNUCLEO CPN, NUCLEOFAMILIAR NF, '+_clinefeed+
         'CONTPREV CTP, CONTRIBUICAO CON, PATRO PT '+_clinefeed+
    'WHERE BFC.IDPLANOPREV = '+inttostr(iUltIDPLANOPREV)+' '+_clinefeed+
    'AND BFC.IDTITULAR = '+inttostr(iUltIDTITULAR)+' '+_clinefeed+
    'AND BFC.IDRESPONSAVEL = '+inttostr(iRespNucleoCorrente)+' '+_clinefeed+
    //'AND BFC.IDBENEFICIO = '+qryPrinc.fieldbyname('idbeneficio').asstring+' '+_clinefeed+
    'AND BFC.IDBENEFICIO = '+inttostr(iUltIDBENEFICIO)+' '+_clinefeed+
    'AND NF.IDRESPNUCLEO = BFC.IDRESPONSAVEL '+_clinefeed+
    'AND BFC.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR '+_clinefeed+
    'AND BFC.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR '+_clinefeed;

  if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) and
     (copy(asmescontrib,6,2) <> '13') then
    ssql:=ssql+
      'AND NVL(CPN.ULTMESPREPARO,''0000/00'') < '+QuotedStr(asMesContrib)+' '+_clinefeed; 

  ssql:=ssql+
    'AND CPN.IDCONTRIBUICAO = CTP.IDCONTRIBUICAO '+_clinefeed+
    'AND CPN.FLGCOBRA = 1 '+_clinefeed+
    //SOL121236 - Daniel Begnami
    ' AND NVL(TO_DATE(TO_CHAR(CPN.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
    // FIM SOL121236
    'AND BFC.IDPLANOPREV = CTP.IDPLANOPREV '+_clinefeed+
    'AND CPN.IDCONTRIBUICAO = CON.IDCONTRIBUICAO '+_clinefeed+
    'AND PT.IDPESSOA = BFC.IDPESSJUR '+_clinefeed+
    'AND PT.IDFUNDACAO = '+inttostr(iidfundacao)+' '+_clinefeed;

  qryContribNucleo.sql.clear;
  qryContribNucleo.sql.add(ssql);
  qryContribNucleo.open;

  if RdgTpFolha.ItemIndex <> 0 then
    asMesContrib:=smesabono;

  if not qryContribNucleo.IsEmpty then
  begin
    qryContribNucleo.First;
    while not qryContribNucleo.eof do
    begin
      if qryContribNucleo.fieldbyname('PERCCALCULO').isnull then
      begin
        DeterminaRegraCalculo;
        if liidRegraCalculo > 0 then
        begin
          if ExecutaRegraCalculo then
          begin
            if liidregraultimo > 0 then
              if not ExecutaRegraUltima then
              begin
                qryContribNucleo.Next;
                continue;
              end;
            GravaContribuicao(adValorContrib, qryContribNucleo.fieldbyname('PERCCALCULO').asfloat, true);
          end
          else
          begin
            qryContribNucleo.Next;
            continue;
          end;
        end
        else
          memResult.Lines.Add(' Contribuição : '+qryContribNucleo.fieldbyname('NOME').Asstring+
                              ' Regra de cálculo não cadastrada.');
      end
      else
      begin
        lsSQLRegra:=
          'SELECT '+oranumero(floattostr(adTotalBenef))+' AS VALORATUAL, '+_clinefeed+
                ' C.IDRUBRICA, C.IDRUBDECTERC, '+_clinefeed+
                asTipoFolhaContrib+' as TIPOFOLHA,'+_clinefeed+//Thiago e Gustava SOL 124272 Kintana 649353
                'C.IDRUBADIANT, C.IDRUBDEVOLADIANT, C.IDRUBADIANT13, C.IDRUBDEVADIANT13,  '+_clinefeed+
                'C.IDRUBACJUD, C.IDRUB13ACJUD, C.IDRUBDADACJUD, C.IDRUB13DESCACJUD, '+_clinefeed+
                inttostr(qryPrinc.fieldbyname('FLGPROVISORIO').asinteger)+' AS FLGPROVISORIO, '+_clinefeed+
                OraNumero(formatfloat('#0.000000',qryPrinc.fieldbyname('PERCPROVISORIO').asfloat))+' AS PERCPROVISORIO, '+_clinefeed+
                inttostr(qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger)+' AS PRAZOPROVISORIO, '+_clinefeed+ 
                ' C.IDCONTRIBPAI, C.IDCONTRIBPAI2, C.IDCONTRIBPAI3, '+_clinefeed+
                ' CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, '+_clinefeed+
                ' CP.CODPORTFORMA, CP.VALORBASE1, CP.VALORBASE2, CP.VALORBASE3, '+_clinefeed+
                ' CP.DATAINICIO, CP.DATAFINAL, CP.SEQPROPOSTA, '+_clinefeed+
                inttostr(iUltIdTitular)+' AS IDTITULAR, '+_clinefeed+
                QuotedStr(asMesContrib)+' AS MESREFERENCIA, '+_clinefeed+
                QuotedStr(sMesreferencia)+' AS MESCOBRANCA, '+_clinefeed+
                QuotedStr(sDataCobranca)+' AS DATACOBRANCA, EL.MATRICULA '+_clinefeed+
         ' FROM CONTRIBPREVPARTP CP, CONTPREV C, ELEGPATRO EL, PATRO PAT '+_clinefeed+
         ' WHERE (CP.IDCONTRIBUICAO = '+
           IntToStr(qryContribNucleo.fieldbyname('IdContribuicao').AsInteger)+') '+_clinefeed+
         ' AND (CP.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
         ' AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
         ' AND (CP.FLGCOBRA = 1) '+_clinefeed+

         //SOL121236 - Daniel Begnami
         ' AND NVL(TO_DATE(TO_CHAR(CP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
         // FIM SOL121236

         ' AND (CP.FLGDESCFOLHA = 1) '+_clinefeed+
         ' AND (CP.ULTMESPREPARO < '+QuotedStr(sMesReferencia)+' OR CP.ULTMESPREPARO IS NULL) '+_clinefeed+
         ' AND (CP.IDPESSJUR = '+inttostr(iUltIdPessjur)+') '+_clinefeed+
         ' AND (CP.IDPLANOPREV = '+inttostr(iUltIdPlanoPrev)+') '+_clinefeed+
         ' AND (CP.IDPESSOA = '+inttostr(iUltIdTitular)+') '+_clinefeed+
         ' AND (CP.SEQPROPOSTA = 1) '+_clinefeed+
          'AND (C.IDPLANOPREV = CP.IDPLANOPREV) '+_clinefeed+
          'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+_clinefeed+
          'AND (EL.IDPESSJUR = CP.IDPESSJUR) '+_clinefeed+
          'AND (EL.IDPESSOA = CP.IDPESSOA) '+_clinefeed;

        qryPreparoContrib.close;
        qryPreparoContrib.SQL.Clear;
        qryPreparoContrib.SQL.Add(lsSQLRegra);
        try
          qryPreparoContrib.open;
        except
          on E:Exception do
          begin
            memResult.Lines.Add(' Contribuição : '+
              qryContribNucleo.fieldbyname('NOME').Asstring+
              ' Erro ao tentar ler contribuições de assistidos a preparar ... ');
            memResult.Lines.Add('Mensagem de erro : '+E.Message);
            qryContribNucleo.Next;
            continue;
          end;
        end;
        while not qryPreparoContrib.eof do
        begin
          GravaContribuicao(qryPreparoContrib.fieldbyname('VALORATUAL').asfloat*
            qryContribNucleo.fieldbyname('PERCCALCULO').asfloat/100,
            qryContribNucleo.fieldbyname('PERCCALCULO').asfloat, true);
          qryPreparoContrib.next;
        end;
      end;
      qryContribNucleo.Next;
    end;// while
  end; //if not qryContribNucleo.IsEmpty then
  lstContribuicao.free;
end;

procedure TfrmPreparo.CalculaEnviaContribuicaoIndividual(asMesContrib : string;
  adTotalBenef, adTotalIntegral, adTotalBenefINSS, adTotalIntegralINSS : double);
{CALCULO DA CONTRIBUICAO
  1) EXECUTAR A REGRA DE CALCULO
     CASO A REGRA DE ULTIMA COBRANCA NAO ESTEJA PARAMETRIZADA PASSAR O VALOR
     DO SALARIO PRORATEADO PELOS.
  2) CASO DE ULTIMO MES DE COBRANCA E REGRA DE ULTIMA COBRANCA PARAMETRIZADA
     EXECUTAR ESTA REGRA}
 var ssql, lsSQLRegra : string;
     lsClausulaContrib : string;
     lsClausulaUltimo : string;
     lsDatas : string;
     lsdinicio: string;
     lsdfinal: string;
     ldProrata : double;
     liidregracalculo : integer;
     liidregraultimo : integer;
     adValorContrib : double;
     sValorAssocCob: String;

  procedure DeterminaRegraCalculo;
  begin
    ldProrata:=1;
    liidRegraCalculo:=qryContribIndividual.fieldbyname('IDREGRACALCULO').AsInteger;
    liidregraultimo:=0;
    lsClausulaContrib:='AND (C.IDREGRACALCULO = '+IntToStr(liidregracalculo)+') ';
    lsDatas:='';
    if trim(osDataInicio) = '' then
      lsdinicio:='          '
    else
      lsdinicio:=osDataInicio;
    if trim(osDataFinal) = '' then
      lsdfinal:='          '
    else
      lsdfinal:=osDataFinal;
    if copy(asMesContrib,6,2) = '13' then
    begin
      if qryContribIndividual.fieldbyname('FLGCOBRADECTERC').asinteger = 1 then
      begin
        if not qryContribIndividual.fieldbyname('IDREGRACALCULO13').isnull then
        begin
          liidRegraCalculo:=qryContribIndividual.fieldbyname('IDREGRACALCULO13').AsInteger;
          lsClausulaContrib:='AND (C.IDREGRACALCULO13 = '+IntToStr(liidregracalculo)+') ';
          if not qryContribIndividual.fieldbyname('IDREGRAULTPGTO13').isnull and
             (qryContribIndividual.fieldbyname('IDREGRAULTPGTO13').asinteger > 0) then
          begin
            liidregraultimo:=qryContribIndividual.fieldbyname('IDREGRAULTPGTO13').asinteger;
            lsClausulaUltimo:='AND (C.IDREGRAULTPGTO13 = '+IntToStr(liidregraultimo)+') ';
            lsDatas:=QuotedStr(lsdinicio)+' AS DATAINICIO, '+
                     QuotedStr(lsdfinal)+' AS DATAFINAL, ';
          end;
        end;
      end
      else
      begin
        liidRegraCalculo:=0;
        lsClausulaContrib:='';
      end;
    end
    else
      if iEstaEmUltimoPagamento in [1,2] then
      begin
        if not qryContribIndividual.fieldbyname('IDREGRAULTPAGTO').isnull and
           (qryContribIndividual.fieldbyname('IDREGRAULTPAGTO').asinteger > 0) then
        begin
          liidregraultimo:=qryContribIndividual.fieldbyname('IDREGRAULTPAGTO').AsInteger;
          lsClausulaUltimo:='AND (C.IDREGRAULTPAGTO = '+IntToStr(liidregraultimo)+') ';
          lsDatas:=QuotedStr('01/'+copy(osDataFinal,4,10))+' AS DATAINICIO, '+
                   QuotedStr(osDataFinal)+' AS DATAFINAL, ';
        end
        else
          ldProrata:=CalculaProRata(osdatafinal);
      end;
  end;

  function ExecutaRegraUltima : boolean;
   var lsdataref : string;
  begin
    result:=false;
    if (osDataFinal = '') or
       (copy(osDataFinal,7,4)+'/'+copy(osDataFinal,4,2) <> sMesreferencia) then
      lsdataref:='01/'+copy(sMesreferencia,6,2)+'/'+copy(sMesreferencia,1,4)
    else
      lsdataref:=osDataFinal;
    lsSQLRegra:='SELECT '+_clinefeed+
      QuotedStr(asMesContrib)+' AS ANOMESREF, '+_clinefeed+
      '0 AS FLGCONCESSAO, '+_clinefeed+ 
      inttostr(RdgTpFolha.ItemIndex)+ ' AS TIPOPREPARO, '+_clinefeed+ //SOL111112 - Ádler Souza
      oranumero(floattostr(adTotalBenef))+' AS VALORATUAL, '+_clinefeed+
      oranumero(floattostr(adTotalIntegral))+' AS VALORTOTAL, '+_clinefeed+
      oranumero(floattostr(adTotalIntegral))+' AS VALORCALCULADO, '+_clinefeed+
      oranumero(floattostr(adTotalBenef))+' AS VLBENEFPGTO, '+_clinefeed+
      oranumero(floattostr(adTotalIntegral))+' AS VALORINTEGRAL, '+_clinefeed+
      asTipoFolhaContrib+' as TIPOFOLHA,'+_clinefeed+//Thiago e Gustava SOL 124272 Kintana 649353
      'CP.IDPESSJUR, C.IDRUBRICA, C.IDRUBDECTERC, '+_clinefeed+
      'C.IDRUBADIANT, C.IDRUBDEVOLADIANT, C.IDRUBADIANT13, C.IDRUBDEVADIANT13,NVL(BB.FLGPROVISORIO,0) FLGPROVISORIO,  '+_clinefeed+
      'NVL(BB.PERCPROVISORIO,100) AS PERCPROVISORIO, '+_clinefeed+
      'NVL(BB.PRAZOPROVISORIO,0) AS PRAZOPROVISORIO, '+_clinefeed+ 
      'C.IDRUBACJUD, C.IDRUB13ACJUD, C.IDRUBDADACJUD, C.IDRUB13DESCACJUD, '+_clinefeed+
      'C.FLGPAGADOR, '+ 
      'CP.IDPESSOA AS IDTITULAR, '+_clinefeed+
      'CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.CODPORTFORMA,'+_clinefeed+
      'CP.DIAVENCIMENTO, CP.FLGDESCFOLHA, CP.VALORBASE1, CP.VALORBASE2,'+_clinefeed+
      'CP.VALORBASE3, CP.FLGCOBRA, '+_clinefeed+
      'CP.QTDEPARCELAS, CP.FLGRETROATIVO, '+_clinefeed+
      {PASSAR AS DATAS INICIO E FINAL RELATIVAS
       AO MÊS DE ENCERRAMENTO DO BENEFICIO NO CASO DA REGRA DE ULTIMA
       COBRANCA DE CONTRIBUICAO ESTAR ASSOCIADA}
      lsDatas+_clinefeed+
      oranumero(formatfloat('#0.00', adValorContrib))+' AS VALORREFERENCIA, '+_clinefeed+
      'ST.FLGINTERNO, EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC,'+_clinefeed+
      'PF.DATAMORTE, PP.SALPARTICIPACAO, PP.INSCRICAODATA, CP.SEQPROPOSTA,'+_clinefeed+
      'EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, EL.MATRICULA, '+_clinefeed+
      'EL.IDSITFUNC, EL.IDSITFUNC AS IDSITFUNCATUAL, EL.IDSITFUNC AS IDSITFUNCNOVO, '+_clinefeed+
      'PP.IDSITPART, PP.IDSITPART AS IDSITPARTATUAL, PP.IDSITPART AS IDSITPARTNOVO, '+_clinefeed+
      'PP.IDSITPLANOPREV AS IDSITPLANO, PP.IDSITPLANOPREV AS IDSITPLANOATUAL, PP.IDSITPLANOPREV AS IDSITPLANONOVO, '+_clinefeed+
      //PASSAR A DATAFINAL COMO DATAREF
      QuotedStr(lsdataref)+' AS DATAREF, '+_clinefeed+
      QuotedStr(asMesContrib)+' AS MESREFERENCIA, '+_clinefeed+
      QuotedStr(sMesreferencia)+' AS MESCOBRANCA, '+_clinefeed+
      QuotedStr(sDataCobranca)+' AS DATACOBRANCA, '+_clinefeed+
      'DECODE(PP.FLGSALVIRTBENEF,0,PP.SALPARTICIPACAO*'+
              oranumero(formatfloat('#0.00000000',ldprorata))+
              ',1,PP.SALAUXDOENCA*'+
              oranumero(formatfloat('#0.00000000',ldprorata))+') AS VALORPROVENTO, '+_clinefeed+
      'DECODE(PP.FLGSALVIRTBENEF,0,PP.SALPARTICIPACAO'+
              ',1,PP.SALAUXDOENCA) AS SALARIOINTEGRAL, '+
      'PP.SALPARTICIPACAO AS VALORREMTOTAL, PP.SALVINCULADO AS RUBPARCIAL, '+_clinefeed+
      'PP.SALMANTIDO AS RUBMANTIDO, '+_clinefeed+
      'BB.VLRCALCINSS, BB.VLRINFINSS, BB.DATAINICIOINSS, NVL(BB.FLGBENEFMIN,0) AS FLGBENEFMIN, '+_clinefeed+
      'BB.IDSITBENEFICIO IDSITBENEFICIO, BB.VALORSRB, '+_clinefeed+
      'C.UNIDNEGOC, '''' AS CODCENTROCUSTO '+_clinefeed+
      'FROM BENEFBFCIARIO BB, CONTRIBPREVPARTP CP, ELEGPATRO EL, '+_clinefeed+
           'PARTPREVPLAN PP, CONTPREV C, PESSOAFISICA PF, SITPART ST, PATRO PAT '+_clinefeed+
      'WHERE (BB.IDTITULAR = '+inttostr(iUltIdTitular)+') '+_clinefeed+
      'AND (BB.NUMEROPROCESSO = '+inttostr(iUltNProcPrincipal)+') '+_clinefeed+
      'AND (BB.IDBENEFICIO = '+inttostr(iUltIdBenefPrincipal)+') '+_clinefeed+
      ' AND (CP.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
      ' AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
      'AND (CP.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
      'AND (CP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
      'AND (CP.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
      'AND (CP.SEQPROPOSTA = BB.SEQPROPOSTA) '+_clinefeed+
      'AND (CP.IDCONTRIBUICAO = '+IntToStr(qryContribIndividual.fieldbyname('IdContribuicao').AsInteger)+') '+_clinefeed;

       //FAZER TRATAMENTO PARA BENEFICIOS ENCERRADOS NA FOLHA DE ABONO
       if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
         lsSQLRegra:=lsSQLRegra+
           'AND (CP.FLGCOBRA = 1) '+_clinefeed+

           //SOL121236 - Daniel Begnami
           ' AND NVL(TO_DATE(TO_CHAR(CP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
           // FIM SOL121236

           //VERIFICAR O ULTMESPREARO APENAS PARA FOLHA NORMAL E NÃO DE ABONO
           //TRATA ULTMESPREPARO NULO PARA CONTRIBUICAO
           'AND (CP.ULTMESPREPARO < '+QuotedStr(asMesContrib)+' OR CP.ULTMESPREPARO IS NULL) '+_clinefeed
       else
       begin
         if iUltSitBeneficio in [3,6] then
           lsSQLRegra:=lsSQLRegra+
             'AND (CP.FLGCOBRA = 0) '+_clinefeed
         else
           lsSQLRegra:=lsSQLRegra+
             'AND (CP.FLGCOBRA = 1) '+_clinefeed+

             //SOL121236 - Daniel Begnami
             ' AND NVL(TO_DATE(TO_CHAR(CP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed;
             // FIM SOL121236
       end;

    lsSQLRegra:=lsSQLRegra+
      'AND (CP.FLGDESCFOLHA = 1) '+_clinefeed+
      'AND (PP.IDPESSJUR = CP.IDPESSJUR) '+_clinefeed+
      'AND (PP.IDPLANOPREV = CP.IDPLANOPREV) '+_clinefeed+
      'AND (PP.SEQPROPOSTA = 1) '+_clinefeed;

    //CONTROLAR BENEFICIO DE PLANO DESATIVADO
    if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
      lssqlregra:=lssqlregra+
        'AND PP.FLGDESATIVADO = 0 '+_clinefeed;
    lssqlregra:=lssqlregra+
      'AND (PP.IDPESSOA = CP.IDPESSOA) '+_clinefeed+
      'AND (EL.IDPESSJUR = CP.IDPESSJUR) '+_clinefeed+
      'AND (EL.IDPESSOA = CP.IDPESSOA) '+_clinefeed+
      'AND (C.IDPLANOPREV = CP.IDPLANOPREV) '+_clinefeed+
      'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+_clinefeed+
      lsClausulaUltimo+
      'AND (C.FLGINTERNO = ''AS'') '+_clinefeed;

      if prmFLGCOBPATROFOLHA = 1 then
        lsSQLRegra:=lsSQLRegra+
          'AND ((C.FLGPAGADOR =  ''C'') OR (C.FLGPAGADOR =  ''P'')) '+_clinefeed
      else
        lsSQLRegra:=lsSQLRegra+
          'AND (C.FLGPAGADOR =  ''C'') '+_clinefeed;

       lsSQLRegra:=lsSQLRegra+
         'AND (PF.IDPESSOA = CP.IDPESSOA) '+_clinefeed+
         'AND (ST.IDSITPART = PP.IDSITPART) '+_clinefeed;

    qryPreparoContrib.close;
    qryPreparoContrib.SQL.Clear;
    qryPreparoContrib.SQL.Add(lsSQLRegra);
    try
      qryPreparoContrib.open;
    except
      on E:Exception do
      begin
        memResult.Lines.Add(' Contribuição : '+
          qryContribIndividual.fieldbyname('NOME').Asstring+
          ' Erro ao tentar ler contribuições de assistidos a preparar ... ');
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        qryContribIndividual.Next;
        exit;
      end;
    end;
    if not qryPreparoContrib.isempty then
    begin
      try
        regPreparoContrib.RuleName:=IntToStr(liidregraultimo);
        regPreparoContrib.Execute;
        if Trim(regPreparoContrib.Result) = '' then
          exit;
        try
          adValorContrib:=StrToFloat(ClienteNumero(regPreparoContrib.Result));
        except
          memResult.Lines.Add(' Matrícula : '+sUltMatricula+
                              ' valor de contribuição calculado pela regra '+
                              regPreparoContrib.RuleName+' inválido : '+regPreparoContrib.Result);
          inc(lcontERRO);
          exit;
        end;
      except
        memResult.Lines.Add(' Contribuição : '+qryContribIndividual.fieldbyname('NOME').Asstring+
                            ' Matrícula : '+sUltMatricula+
                            ' Erro ao executar regra de contribuição - '+'Regra : '+regPreparoContrib.RuleName+' ...');
        exit;
      end;
    end;
    result:=true;
  end;

  function ExecutaRegraCalculo : boolean;
   var lsdataref, ssqlassoc,
       sAssoc1Op1, sAssoc1Op2, sAssoc1Op3, sValorAssociado1,
       sAssoc2Op1, sAssoc2Op2, sAssoc2Op3, sValorAssociado2,
       sAssoc3Op1, sAssoc3Op2, sAssoc3Op3, sValorAssociado3  : string;
       objcontrib: tobjContribuicao;
  begin
    result:=false;
    if (osDataFinal = '') or
       (copy(osDataFinal,7,4)+'/'+copy(osDataFinal,4,2) <> sMesreferencia) then
      lsdataref:='01/'+copy(sMesreferencia,6,2)+'/'+copy(sMesreferencia,1,4)
    else
      lsdataref:=osDataFinal;

    sAssoc1Op1:='0';
    sAssoc1Op2:='0';
    sAssoc1Op3:='0';
    sValorAssociado1:='0';
    if not qryContribIndividual.fieldbyname('IDCONTRIBPAI').isnull then
    begin
      objContrib:=lstContribuicao.VerificaLista(
        qryContribIndividual.fieldbyname('IDCONTRIBPAI').asinteger);
      if objContrib <> nil then
      begin
        sAssoc1Op1:=OraNumero(floattostr(objContrib.rvalorassoc1));
        sAssoc1Op2:=OraNumero(floattostr(objContrib.rvalorassoc2));
        sAssoc1Op3:=OraNumero(floattostr(objContrib.rvalorassoc3));
        sValorAssociado1:=OraNumero(floattostr(objContrib.rvaloresperado));
      end;
    end;

    sAssoc2Op1:='0';
    sAssoc2Op2:='0';
    sAssoc2Op3:='0';
    sValorAssociado2:='0';
    if not qryContribIndividual.fieldbyname('IDCONTRIBPAI2').isnull then
    begin
      objContrib:=lstContribuicao.VerificaLista(
        qryContribIndividual.fieldbyname('IDCONTRIBPAI2').asinteger);
      if objContrib <> nil then
      begin
        sAssoc2Op1:=OraNumero(floattostr(objContrib.rvalorassoc1));
        sAssoc2Op2:=OraNumero(floattostr(objContrib.rvalorassoc2));
        sAssoc2Op3:=OraNumero(floattostr(objContrib.rvalorassoc3));
        sValorAssociado2:=OraNumero(floattostr(objContrib.rvaloresperado));
      end;
    end;

    sAssoc3Op1:='0';
    sAssoc3Op2:='0';
    sAssoc3Op3:='0';
    sValorAssociado3:='0';
    if not qryContribIndividual.fieldbyname('IDCONTRIBPAI3').isnull then
    begin
      objContrib:=lstContribuicao.VerificaLista(
        qryContribIndividual.fieldbyname('IDCONTRIBPAI3').asinteger);
      if objContrib <> nil then
      begin
        sAssoc3Op1:=OraNumero(floattostr(objContrib.rvalorassoc1));
        sAssoc3Op2:=OraNumero(floattostr(objContrib.rvalorassoc2));
        sAssoc3Op3:=OraNumero(floattostr(objContrib.rvalorassoc3));
        sValorAssociado3:=OraNumero(floattostr(objContrib.rvaloresperado));
      end;
    end;

    ssqlassoc:=sValorAssociado1+' AS VALORASSOCIADO,  '+
               sValorAssociado2+' AS VALORASSOCIADO2, '+
               sValorAssociado3+' AS VALORASSOCIADO3, '+
               sAssoc1Op1+' AS ASSOC1OP1, '+
               sAssoc1Op2+' AS ASSOC1OP2, '+
               sAssoc1Op3+' AS ASSOC1OP3, '+
               sAssoc2Op1+' AS ASSOC2OP1, '+
               sAssoc2Op2+' AS ASSOC2OP2, '+
               sAssoc2Op3+' AS ASSOC2OP3, '+
               sAssoc3Op1+' AS ASSOC3OP1, '+
               sAssoc1Op2+' AS ASSOC3OP2, '+
               sAssoc1Op3+' AS ASSOC3OP3, ';

    sValorAssocCob:=sValorAssociado1;

    lsSQLRegra:='SELECT '+ssqlassoc+_clinefeed+
            '0 AS FLGCONCESSAO, '+_clinefeed+
      inttostr(RdgTpFolha.ItemIndex)+ ' AS TIPOPREPARO, '+_clinefeed+ //SOL111112 - Ádler Souza
      QuotedStr(asMesContrib)+' AS ANOMESREF, '+_clinefeed+
      oranumero(floattostr(adTotalBenef))+' AS VALORATUAL, '+_clinefeed+
      oranumero(floattostr(adTotalIntegral))+' AS VALORTOTAL, '+_clinefeed+
      oranumero(floattostr(adTotalIntegral))+' AS VALORCALCULADO, '+_clinefeed+
      oranumero(floattostr(adTotalBenef))+' AS VLBENEFPGTO, '+_clinefeed+
      asTipoFolhaContrib+' as TIPOFOLHA,'+_clinefeed+//Thiago e Gustava SOL 124272 Kintana 649353
      //COLOCA O VALOR DO MES COMO VALOR INTEGRAL
      //INCLUIR VALOR INTEGRAL
      oranumero(floattostr(adTotalIntegral))+' AS VALORINTEGRAL, '+ 
      'CP.IDPESSJUR, C.IDRUBRICA, C.IDRUBDECTERC, '+_clinefeed+
      'C.IDRUBADIANT, C.IDRUBDEVOLADIANT, C.IDRUBADIANT13, C.IDRUBDEVADIANT13, NVL(BB.FLGPROVISORIO,0) FLGPROVISORIO,  '+_clinefeed+
      'NVL(BB.PERCPROVISORIO,0) AS PERCPROVISORIO, '+_clinefeed+ 
      'NVL(BB.PRAZOPROVISORIO,0) AS PRAZOPROVISORIO, '+_clinefeed+ 
      'C.IDRUBACJUD, C.IDRUB13ACJUD, C.IDRUBDADACJUD, C.IDRUB13DESCACJUD, '+_clinefeed+
      'C.FLGPAGADOR, '+ 
      //NECESSÁRIO POR CAUSA DE ALTERAÇÃO NO ENVIO PARA TMPDESC
      //   DAS CONTRIBUIÇÕES DE PENSIONISTA
      'CP.IDPESSOA AS IDTITULAR, '+_clinefeed+
      'CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.CODPORTFORMA,'+_clinefeed+
      'CP.DIAVENCIMENTO, CP.FLGDESCFOLHA, CP.VALORBASE1, CP.VALORBASE2,'+_clinefeed+
      'CP.VALORBASE3, CP.FLGCOBRA, '+_clinefeed+
      'CP.QTDEPARCELAS, CP.FLGRETROATIVO, CP.DATAINICIO, CP.DATAFINAL, '+_clinefeed+
      'ST.FLGINTERNO, EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC,'+_clinefeed+
      'PF.DATAMORTE, PP.SALPARTICIPACAO, PP.INSCRICAODATA, CP.SEQPROPOSTA,'+_clinefeed+
      'EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, EL.MATRICULA, '+_clinefeed+
      'EL.IDSITFUNC, EL.IDSITFUNC AS IDSITFUNCATUAL, EL.IDSITFUNC AS IDSITFUNCNOVO, '+_clinefeed+
      'PP.IDSITPART, PP.IDSITPART AS IDSITPARTATUAL, PP.IDSITPART AS IDSITPARTNOVO, '+_clinefeed+
      'PP.IDSITPLANOPREV AS IDSITPLANO, PP.IDSITPLANOPREV AS IDSITPLANOATUAL, PP.IDSITPLANOPREV AS IDSITPLANONOVO, '+_clinefeed+
      //PASSAR A DATAFINAL COMO DATAREF
      QuotedStr(lsdataref)+' AS DATAREF, '+_clinefeed+
      QuotedStr(asMesContrib)+' AS MESREFERENCIA, '+_clinefeed+
      QuotedStr(sMesreferencia)+' AS MESCOBRANCA, '+_clinefeed+
      QuotedStr(sDataCobranca)+' AS DATACOBRANCA, '+_clinefeed+
      'DECODE(PP.FLGSALVIRTBENEF,0,PP.SALPARTICIPACAO*'+
              oranumero(formatfloat('#0.00000000',ldprorata))+
              ',1,PP.SALAUXDOENCA*'+
              oranumero(formatfloat('#0.00000000',ldprorata))+') AS VALORPROVENTO, '+_clinefeed+
      //USAR SALARIO VIRTUAL OU DE PARTICIPACAO
      //  SEM O PRORATEAMENTO DO CAMPO VALORPROVENTO
      'DECODE(PP.FLGSALVIRTBENEF,0,PP.SALPARTICIPACAO'+
              ',1,PP.SALAUXDOENCA) AS SALARIOINTEGRAL, '+_clinefeed+
      'PP.SALPARTICIPACAO AS VALORREMTOTAL, PP.SALVINCULADO AS RUBPARCIAL, '+_clinefeed+
      'PP.SALMANTIDO AS RUBMANTIDO, BB.VALORSRB, '+_clinefeed+
      'BB.VLRCALCINSS, BB.VLRINFINSS, BB.DATAINICIOINSS, NVL(BB.FLGBENEFMIN,0) AS FLGBENEFMIN, '+_clinefeed+
      'BB.IDSITBENEFICIO IDSITBENEFICIO, '+_clinefeed+
      'C.UNIDNEGOC, '''' AS CODCENTROCUSTO, '+_clinefeed+

      oranumero(formatfloat('#0.00',adTotalBenefINSS))+ ' AS INSSNOLOTE, '+_clinefeed+
      oranumero(sValorAtualBenef) + ' AS VALORNOLOTE, '+_clinefeed+
      oranumero(sValorAssocCob) + ' AS VALORASSOCIADOCOB, '+_clinefeed+
      
      ' bb.idplanprevcontab ' + _clinefeed + //Thiago Passos SOL 124272 Ktn 649353 11/10/2009

      'FROM BENEFBFCIARIO BB, CONTRIBPREVPARTP CP, ELEGPATRO EL, '+_clinefeed+
           'PARTPREVPLAN PP, CONTPREV C, PESSOAFISICA PF, SITPART ST, PATRO PAT '+_clinefeed+
      'WHERE (BB.IDTITULAR = '+inttostr(iUltIdTitular)+') '+_clinefeed+
      'AND (BB.NUMEROPROCESSO = '+inttostr(iUltNProcPrincipal)+') '+_clinefeed+
      'AND (BB.IDBENEFICIO = '+inttostr(iUltIdBenefPrincipal)+') '+_clinefeed+
      ' AND (CP.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
      ' AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
      'AND (CP.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
      'AND (CP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
      'AND (CP.IDPESSOA = '+inttostr(iUltIdTitular)+') '+_clinefeed+
      'AND (CP.SEQPROPOSTA = BB.SEQPROPOSTA) '+_clinefeed+
      'AND (CP.IDCONTRIBUICAO = '+IntToStr(qryContribIndividual.fieldbyname('IdContribuicao').AsInteger)+') '+_clinefeed;

    //FAZER TRATAMENTO PARA BENEFICIOS ENCERRADOS NA FOLHA DE ABONO
    if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
      lsSQLRegra:=lsSQLRegra+
        'AND (CP.FLGCOBRA = 1) '+_clinefeed+

         //SOL121236 - Daniel Begnami
         ' AND NVL(TO_DATE(TO_CHAR(CP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
         // FIM SOL121236

        //VERIFICAR O ULTMESPREARO APENAS PARA FOLHA NORMAL E NÃO DE ABONO
        //TRATA ULTMESPREPARO NULO PARA CONTRIBUICAO
        'AND (CP.ULTMESPREPARO < '+QuotedStr(asMesContrib)+' OR CP.ULTMESPREPARO IS NULL) '+_clinefeed
    else
    begin
      if iUltSitBeneficio in [3,6] then
        lsSQLRegra:=lsSQLRegra+
          'AND (CP.FLGCOBRA = 0) '+_clinefeed
      else
        lsSQLRegra:=lsSQLRegra+
          'AND (CP.FLGCOBRA = 1) '+_clinefeed+

         //SOL121236 - Daniel Begnami
         ' AND NVL(TO_DATE(TO_CHAR(CP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed;
         // FIM SOL121236

    end;

    lsSQLRegra:=lsSQLRegra+
      'AND (CP.FLGDESCFOLHA = 1) '+_clinefeed+
      'AND (PP.IDPESSJUR = CP.IDPESSJUR) '+_clinefeed+
      'AND (PP.IDPLANOPREV = CP.IDPLANOPREV) '+_clinefeed+
      'AND (PP.SEQPROPOSTA = 1) '+_clinefeed;

    if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
      lssqlregra:=lssqlregra+
        'AND PP.FLGDESATIVADO = 0 '+_clinefeed;

    lssqlregra:=lssqlregra+
      'AND (PP.IDPESSOA = CP.IDPESSOA) '+_clinefeed+
      'AND (EL.IDPESSJUR = CP.IDPESSJUR) '+_clinefeed+
      'AND (EL.IDPESSOA = CP.IDPESSOA) '+_clinefeed+
      'AND (C.IDPLANOPREV = CP.IDPLANOPREV) '+_clinefeed+
      'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+_clinefeed+
    
    lsClausulaContrib+
      'AND (C.FLGINTERNO = ''AS'') '+_clinefeed;

    if prmFLGCOBPATROFOLHA = 1 then
      lsSQLRegra:=lsSQLRegra+
        'AND ((C.FLGPAGADOR =  ''C'') OR (C.FLGPAGADOR =  ''P'')) '+_clinefeed
    else
      lsSQLRegra:=lsSQLRegra+
        'AND (C.FLGPAGADOR =  ''C'') '+_clinefeed;

    lsSQLRegra:=lsSQLRegra+
      'AND (PF.IDPESSOA = CP.IDPESSOA) '+_clinefeed+
      'AND (ST.IDSITPART = PP.IDSITPART) '+_clinefeed;

    qryPreparoContrib.close;
    qryPreparoContrib.SQL.Clear;
    qryPreparoContrib.SQL.Add(lsSQLRegra);
    try
      qryPreparoContrib.open;
    except
      on E:Exception do
      begin
        memResult.Lines.Add(' Contribuição : '+
          qryContribIndividual.fieldbyname('NOME').Asstring+
          ' Erro ao tentar ler contribuições de assistidos a preparar ... ');
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        qryContribIndividual.Next;
        exit;
      end;
    end;

    if not qryPreparoContrib.isempty then
    begin
      try
        regPreparoContrib.RuleName:=IntToStr(liidRegraCalculo);
        regPreparoContrib.Execute;
        if Trim(regPreparoContrib.Result) = '' then
        begin
          //MENSAGEM QUANDO REGRA RETORNA INVÁLIDO
          memResult.Lines.Add('Valor retornado pela execução da regra '+
            'de contribuição ['+inttostr(liidRegraCalculo)+'] inválido.');
          memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
          memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
          exit;
        end;
        try
          adValorContrib:=StrToFloat(ClienteNumero(regPreparoContrib.Result));
        except
          memResult.Lines.Add(' Matrícula : '+sUltMatricula{qryPreparoContrib.fieldbyname('Matricula').asstring}+
                              ' valor de contribuição calculado pela regra '+
                              regPreparoContrib.RuleName+' inválido : '+regPreparoContrib.Result);
          inc(lcontERRO);
          exit;
        end;
      except
        memResult.Lines.Add(' Contribuição : '+qryContribIndividual.fieldbyname('NOME').Asstring+
                            ' Matrícula : '+sUltMatricula{qryPreparoContrib.fieldbyname('Matricula').asstring}+
                            ' Erro ao executar regra de contribuição - '+'Regra : '+regPreparoContrib.RuleName+' ...');
        exit;
      end;
    end
    else
    begin
      memResult.Lines.Add(' Contribuição : '+qryContribIndividual.fieldbyname('NOME').Asstring+
                          ' Matrícula : '+sUltMatricula+
                          ' SQL vazio - Regra não executada : '+regPreparoContrib.RuleName+'.');
    end;
    result:=true;
  end;

begin
  if iUltNProcPrincipal=0 then
    iUltNProcPrincipal:=iUltNumeroProcesso;
  if iUltIdBenefPrincipal=0 then
    iUltIdBenefPrincipal:=iUltIdBeneficio;
  lstContribuicao:=tListaContribuicao.create;

  qryContribIndividual.close;
  qryContribIndividual.sql.clear;
  ssql:=
    'SELECT CPP.IDCONTRIBUICAO, CP.IDREGRACALCULO, CP.IDREGRAULTPAGTO, '+_clinefeed+
       'CP.IDCONTRIBPAI, CP.IDCONTRIBPAI2, CP.IDCONTRIBPAI3, '+_clinefeed+
       'CP.FLGPAGADOR, '+_clinefeed+ 
       'CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+_clinefeed+
       'CP.IDREGRACALCULO13, CP.IDREGRAULTPGTO13, CP.PERCCALCULO, '+_clinefeed+
       'CP.FLGCOBRADECTERC, C.NOME '+_clinefeed+
    'FROM CONTRIBPREVPARTP CPP, CONTPREV CP, CONTRIBUICAO C, PATRO PAT '+_clinefeed+
    'WHERE (CPP.IDPESSOA = :PIDPESSOA) '+_clinefeed+
    'AND (CPP.IDPESSJUR = :PIDPESSJUR) '+_clinefeed+
    'AND (CPP.IDPLANOPREV = :PIDPLANOPREV) '+_clinefeed+
    'AND (CPP.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
    'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
    'AND (CPP.SEQPROPOSTA = 1) '+_clinefeed;

    //FAZER TRATAMENTO PARA BENEFICIOS ENCERRADOS NA FOLHA DE ABONO
    if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
      ssql:=ssql+
        'AND (CPP.FLGCOBRA = 1) '+_clinefeed+

         //SOL121236 - Daniel Begnami
         ' AND NVL(TO_DATE(TO_CHAR(CPP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
         // FIM SOL121236

        //VERIFICAR O ULTMESPREARO APENAS PARA FOLHA NORMAL E NÃO DE ABONO
        //TRATA ULTMESPREPARO NULO PARA CONTRIBUICAO
        'AND (CPP.ULTMESPREPARO < :PMESREF OR CPP.ULTMESPREPARO IS NULL) '+_clinefeed
    else
    begin
      if iUltSitBeneficio in [3,6] then
        ssql:=ssql+
          'AND (CPP.FLGCOBRA = 0) '+_clinefeed
      else
        ssql:=ssql+
          'AND (CPP.FLGCOBRA = 1) '+_clinefeed+

         //SOL121236 - Daniel Begnami
         ' AND NVL(TO_DATE(TO_CHAR(CPP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed;
         // FIM SOL121236

    end;

  sSQL:=sSQL+
    'AND (CPP.FLGDESCFOLHA = 1) '+_clinefeed+
     'AND (CP.IDPLANOPREV = CPP.IDPLANOPREV) '+_clinefeed+
    'AND (CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO) '+_clinefeed+
    'AND (CP.FLGINTERNO = ''AS'') '+_clinefeed;
 
      if prmFLGCOBPATROFOLHA = 1 then
        sSql:= sSql+
          'AND ((CP.FLGPAGADOR =  ''C'') OR (CP.FLGPAGADOR =  ''P'')) '+_clinefeed
      else
        sSql:=sSql+
          'AND (CP.FLGPAGADOR =  ''C'') '+_clinefeed;
       sSql:=sSql+    'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+_clinefeed;

  If RdgTpFolha.ItemIndex = 1 then
    ssql:=ssql+'AND (CP.FLGCOBRADECTERC = 1) '+_clinefeed;
  ssql:=ssql+'ORDER BY CP.ORDEMCALCULO '+_clinefeed;

  qryContribIndividual.sql.text:=ssql;
  qryContribIndividual.parambyname('PIDPESSOA').datatype:=ftinteger;
  qryContribIndividual.parambyname('PIDPESSJUR').datatype:=ftinteger;
  qryContribIndividual.parambyname('PIDPLANOPREV').datatype:=ftinteger;
  if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
    qryContribIndividual.parambyname('PMESREF').datatype:=ftstring;

  qryContribIndividual.parambyname('PIDPESSOA').asinteger:=iUltIDTITULAR;
  qryContribIndividual.parambyname('PIDPESSJUR').asinteger:=iUltIDPESSJUR;
  qryContribIndividual.parambyname('PIDPLANOPREV').asinteger:=iUltIDPLANOPREV;
  if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
    qryContribIndividual.parambyname('PMESREF').asstring:=asMesContrib;
  qryContribIndividual.open;

  if RdgTpFolha.ItemIndex <> 0 then
    asMesContrib:=smesabono;

  if not qryContribIndividual.IsEmpty then
  begin
    qryContribIndividual.First;
    while not qryContribIndividual.eof do
    begin
      if qryContribIndividual.fieldbyname('PERCCALCULO').isnull then
      begin
        DeterminaRegraCalculo;
        if liidRegraCalculo > 0 then
        begin
          if ExecutaRegraCalculo then
          begin
            if liidregraultimo > 0 then
              if not ExecutaRegraUltima then
              begin
                qryContribIndividual.Next;
                continue;
              end;

            sPagador:=qryContribIndividual.fieldbyname('FLGPAGADOR').AsString;
            GravaContribuicao(adValorContrib,
              qryContribIndividual.fieldbyname('PERCCALCULO').asfloat, false);
          end
          else
          begin
            qryContribIndividual.Next;
            continue;
          end;
        end
        else
          memResult.Lines.Add(' Contribuição : '+qryContribIndividual.fieldbyname('NOME').Asstring+
                              ' Regra de cálculo não cadastrada.');
      end
      else
      begin
        lsSQLRegra:=
          'SELECT '+oranumero(floattostr(adTotalBenef))+' AS VALORATUAL, '+_clinefeed+
                ' C.IDRUBRICA, C.IDRUBDECTERC, '+_clinefeed+
                
                'C.IDRUBADIANT, C.IDRUBDEVOLADIANT, C.IDRUBADIANT13, C.IDRUBDEVADIANT13,  '+_clinefeed+
                'C.IDRUBACJUD, C.IDRUB13ACJUD, C.IDRUBDADACJUD, C.IDRUB13DESCACJUD, '+_clinefeed+
                inttostr(qryPrinc.fieldbyname('FLGPROVISORIO').asinteger)+' AS FLGPROVISORIO, '+_clinefeed+
                OraNumero(formatfloat('#0.000000',qryPrinc.fieldbyname('PERCPROVISORIO').asfloat))+' AS PERCPROVISORIO, '+_clinefeed+ 
                inttostr(qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger)+' AS PRAZOPROVISORIO, '+_clinefeed+ 
                ' C.IDCONTRIBPAI, C.IDCONTRIBPAI2, C.IDCONTRIBPAI3, '+_clinefeed+
                'C.FLGPAGADOR, '+_clinefeed+
                asTipoFolhaContrib+' as TIPOFOLHA,'+_clinefeed+//Thiago e Gustava SOL 124272 Kintana 649353
                ' CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, '+_clinefeed+
                ' CP.CODPORTFORMA, CP.VALORBASE1, CP.VALORBASE2, CP.VALORBASE3, '+_clinefeed+
                ' CP.DATAINICIO, CP.DATAFINAL, CP.SEQPROPOSTA, '+_clinefeed+
                inttostr(iUltIdTitular)+' AS IDTITULAR, '+_clinefeed+
                QuotedStr(asMesContrib)+' AS MESREFERENCIA, '+_clinefeed+
                QuotedStr(sMesreferencia)+' AS MESCOBRANCA, '+_clinefeed+
                QuotedStr(sDataCobranca)+' AS DATACOBRANCA, EL.MATRICULA '+_clinefeed+
         ' FROM CONTRIBPREVPARTP CP, CONTPREV C, ELEGPATRO EL, PATRO PAT '+_clinefeed+
         ' WHERE (CP.IDCONTRIBUICAO = '+
           IntToStr(qryContribIndividual.fieldbyname('IdContribuicao').AsInteger)+') '+_clinefeed+
         'AND (CP.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
         'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
         'AND (CP.FLGCOBRA = 1) '+_clinefeed+

         //SOL121236 - Daniel Begnami
         ' AND NVL(TO_DATE(TO_CHAR(CP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
         // FIM SOL121236

         'AND (CP.FLGDESCFOLHA = 1) '+_clinefeed;

        //VERIFICAR O ULTMESPREARO APENAS PARA FOLHA NORMAL E NÃO DE ABONO
        if (RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3) then
          lsSQLRegra:=lsSQLRegra+
            //VERIFICAR O ULTMESPREARO APENAS PARA FOLHA NORMAL E NÃO DE ABONO
            //TRATA ULTMESPREPARO NULO PARA CONTRIBUICAO
            ' AND (CP.ULTMESPREPARO < '+QuotedStr(sMesReferencia)+' OR CP.ULTMESPREPARO IS NULL) '+_clinefeed;

        lsSQLRegra:=lsSQLRegra+
         ' AND (CP.IDPESSJUR = '+inttostr(iUltIdPessjur)+') '+_clinefeed+
         ' AND (CP.IDPLANOPREV = '+inttostr(iUltIdPlanoPrev)+') '+_clinefeed+
         ' AND (CP.IDPESSOA = '+inttostr(iUltIdTitular)+') '+_clinefeed+
         ' AND (CP.SEQPROPOSTA = 1) '+_clinefeed+
          'AND (C.IDPLANOPREV = CP.IDPLANOPREV) '+_clinefeed+
          'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+_clinefeed+
          'AND (EL.IDPESSJUR = CP.IDPESSJUR) '+_clinefeed+
          'AND (EL.IDPESSOA = CP.IDPESSOA) '+_clinefeed;

        qryPreparoContrib.close;
        qryPreparoContrib.SQL.Clear;
        qryPreparoContrib.SQL.Add(lsSQLRegra);
        try
          qryPreparoContrib.open;
        except
          on E:Exception do
          begin
            memResult.Lines.Add(' Contribuição : '+
              qryContribIndividual.fieldbyname('NOME').Asstring+
              ' Erro ao tentar ler contribuições de assistidos a preparar ... ');
            memResult.Lines.Add('Mensagem de erro : '+E.Message);
            qryContribIndividual.Next;
            continue;
          end;
        end;
        while not qryPreparoContrib.eof do
        begin
          
          sPagador:=qryPreparoContrib.fieldbyname('FLGPAGADOR').AsString;
          GravaContribuicao(qryPreparoContrib.fieldbyname('VALORATUAL').asfloat*
            qryContribIndividual.fieldbyname('PERCCALCULO').asfloat/100,
            qryContribIndividual.fieldbyname('PERCCALCULO').asfloat, false);
          qryPreparoContrib.next;
        end;
      end;
      qryContribIndividual.Next;
    end;// while
  end; //if not qryContribIndividual.IsEmpty then
  lstContribuicao.free;
end;

procedure TfrmPreparo.BuscaLancaAbonoBeneficioProcessados(
  pidregracalculo,
  pidpessjur,
  pidplanoprev,
  pidplanoorigem,
  pidbeneficio,
  pseqproposta,
  pnumeroprocesso,
  pidsitbeneficio,
  pfontepagadora,
  pcodportforma,
  pidtitular,
  pidpessoa: integer;
  psnomebenef,
  psbeneficio,
  psflgcalctodomes,
  psflgprovisorio,
  psflgdescirmes,
  psflgdevolucao,
  psvaloratual,
  psvalortotal,
  psvalorsrb,
  psvalorcalculado,
  psvalorbase1,
  psvalorbase2,
  psvalorbase3: string;
  prpercentual: real 
);
var liseqbenef: integer;
    licontseq: integer;
    lsmsgerro: string;
    lrvalor: real;
    lslote: string;
begin
  qryaux4.sql.clear;
  //AJUSTE NA CONSULTA PARA TRATA MIGRAÇÃO DE PLANO
  qryaux4.sql.add(
    'SELECT H.MES, '+_clinefeed+
    '       DECODE(H.FLGDEVOLUCAO,1,-H.VLBENEFPGTO,H.VLBENEFPGTO) AS VALOR '+_clinefeed+
    'FROM HSTBENEFBFCIARIO H '+
    'WHERE '+
    '  SUBSTR(H.MES,1,4) = '+quotedstr(inttostr(wAno))+' '+_clinefeed+
    'AND H.MESREFERENCIA = '+quotedstr(inttostr(wAno)+'/13')+' '+_clinefeed+
    'AND H.MES < '+quotedstr(sMesReferencia)+' '+_clinefeed+
    'AND H.IDLOTE <> '+inttostr(iIdlote)+' '+_clinefeed+
    'AND H.IDPESSOA = '+inttostr(pidpessoa)+' '+_clinefeed+
    'AND H.IDTITULAR = '+inttostr(pidtitular)+' '+_clinefeed+
    'AND H.NUMEROPROCESSO = '+inttostr(pnumeroprocesso)+' '+_clinefeed+
    'AND H.IDBENEFICIO = '+inttostr(pidbeneficio)+' '+_clinefeed+
    'AND H.IDPLANOPREV = '+inttostr(pidplanoprev)+' '+_clinefeed+
    'AND H.IDPLANOORIGEM = '+inttostr(pidplanoorigem)+' '+_clinefeed+
    'AND H.IDPESSJUR = '+inttostr(pidpessjur)+' '+_clinefeed+
    'AND H.FLGENVIADO = 1 '+_clinefeed+
    'AND H.VLBENEFPGTO IS NOT NULL '+_clinefeed+
    'AND H.IDHSTFOLHABENEF IS NOT NULL '+_clinefeed+
    'AND H.FLGTIPOREGISTRO IN (2, 5) '+_clinefeed+ //CPrev - 26823
    'UNION '+_clinefeed+
    'SELECT H.MES, '+_clinefeed+
    '       DECODE(H.FLGDEVOLUCAO,1,-H.VLBENEFPGTO,H.VLBENEFPGTO) AS VALOR '+_clinefeed+
    'FROM HSTBENEFBFCIARIO H,  '+
    ' MOVBENEF M '+_clinefeed+
    'WHERE '+
    '   SUBSTR(H.MES,1,4) = '+quotedstr(inttostr(wAno))+' '+_clinefeed+
    'AND H.MESREFERENCIA = '+quotedstr(inttostr(wAno)+'/13')+' '+_clinefeed+
    'AND H.MES < '+quotedstr(sMesReferencia)+' '+_clinefeed+
    'AND H.IDLOTE <> '+inttostr(iIdlote)+' '+_clinefeed+
    'AND H.IDPESSOA = '+inttostr(pidpessoa)+' '+_clinefeed+
    'AND H.IDTITULAR = '+inttostr(pidtitular)+' '+_clinefeed+
    'AND H.IDPESSJUR = '+inttostr(pidpessjur)+' '+_clinefeed+
    'AND H.FLGENVIADO = 1 '+_clinefeed+
    'AND H.VLBENEFPGTO IS NOT NULL '+_clinefeed+
    'AND H.IDHSTFOLHABENEF IS NOT NULL '+_clinefeed+
    'AND H.IDTITULAR = M.IDTITULAR '+_clinefeed+
    'AND H.IDPESSOA = M.IDPESSOA '+_clinefeed+
    'AND H.NUMEROPROCESSO = M.NUMEROPROCESSO '+_clinefeed+
    'AND H.IDBENEFICIO = M.IDBENEFICIO '+_clinefeed+
    'AND H.IDPLANOPREV = M.IDPLANOPREV '+_clinefeed+
    'AND H.IDPLANOORIGEM = M.IDPLANOORIGEM '+_clinefeed+
    'AND H.IDPESSJUR = M.IDPESSJUR '+_clinefeed+
    'AND TO_CHAR(M.DATAMOV,''YYYY'') = '+quotedstr(inttostr(wAno))+' '+_clinefeed+
    'AND M.TIPOMOV = 15 '+_clinefeed+
    'AND H.FLGTIPOREGISTRO IN (2, 5) '+_clinefeed); //CPrev - 26823
  qryAux4.Open;

  lrvalor:=0;
  while not qryAux4.eof do
  begin
    lrvalor:=lrvalor+
      qryAux4.fieldbyname('VALOR').asfloat;
    gsMesesAdiantado:=gsMesesAdiantado+
      quotedstr(qryAux4.fieldbyname('MES').asstring)+',';
    qryAux4.next;
  end;

  if lrvalor > 0 then
  begin
    liSeqBenef:=2;
    licontseq:=0;
    repeat
      InsereHstBfciario(
        qryInsHstBfciario,
        rdgtpfolha.itemindex,
        pidtitular,
        pidpessoa,
        pidpessjur,
        pidplanoprev,
        pidplanoorigem,
        pidbeneficio,
        pnumeroprocesso,
        smesreferencia,
        smesabono,
        qryctrlinterface.fieldbyname('DATAPAGAMENTO').asstring,
        pseqproposta,
        liSeqBenef,
        pidsitbeneficio,
        iidlote,
        pfontepagadora,
        pcodportforma,
        strtoint(psflgprovisorio),
        strtoint(psflgdescirmes),
        strtoint(psflgdevolucao),
        inttostr(pidregracalculo),
        floattostr(lrvalor),
        psvalorcalculado,
        psvaloratual,
        psvalortotal,
        psvalorsrb,
        psvalorbase1,
        psvalorbase2,
        psvalorbase3,
        1, 
        2, 
        0, 
        0, 
        0, 
        '', 
        prpercentual, 
        lslote);

      Try
        if NaoExisteHSTBENEFBFCIARIO(sSQLValida) then begin // renato visoni SOL 126894 - KINTANA 667862
          Try
          qryInsHstBfciario.ExecSQL;
          //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          Except
            on e:Exception do
            begin
              TratarErro(e.Message);
              Exit;            
            end;
          end;
          //Brunno Mattos - KTN 767861 - SOL 132659 Fim
        end;
        licontseq:=0;
        iBenefDevAbono:=iBenefDevAbono+1; 
        break;
      Except
        On E:Exception Do
        begin
          TratarErro(e.Message);
          inc(licontseq);
          inc(liseqbenef);
          lsmsgerro:=E.Message;
        end;
      end;
    until licontseq = 10;

    if licontseq > 0 then
    begin
      memResult.Lines.Add(
        'Erro ao gravar devolução de adiantamento de abono anual para o Beneficiário: '+
        Trim(psnomebenef)+' - Benefício : '+
        Trim(psbeneficio));
      memResult.Lines.Add('Matrícula: '+sUltMatricula); 
      memResult.Lines.Add('Mensagem de erro : '+lsmsgerro);
      memResult.Lines.Add('----------------------------');
    end;
  end
  else
  begin
    if lrvalor < 0 then
    begin
      memResult.Lines.Add(
        'Devolução do adiantamento de benefício não lançada. Total do abono de benefício negativo, '+
        'o que geraria um pagamento de '+formatfloat('#0.00',lrvalor)+
        ' para o Beneficiário : '+
        Trim(psnomebenef));
      memResult.Lines.Add('Matrícula: '+sUltMatricula);
      memResult.Lines.Add('----------------------------');
    end;
  end;
end;

procedure TfrmPreparo.BuscaLancaAbonoContribuicaoProcessados(
  pidplanoprev,
  pidtitular,
  pidpessoa: integer;
  psnomebenef: string
);
var lsSql: string;
    liNumRecDevContrib: integer;
    liIdMotivoDevContrib: integer;
    lrvalorcontrib: real;
    liidcontribdev: integer;
    liidplanodev: integer;
    liIdRubDevContrib: integer;

  function GravaDevolucaoHstContribPrev(aidplanoprev, aidcontribuicao: integer): boolean;
  begin
    try
      lssql:=''''+qryAux4.fieldbyname('MesReferencia').asstring+''''; // MESREFERENCIA
      lssql:=lssql+','+QuotedStr(sMesReferencia);  //MESCOBRANCA
      liNumRecDevContrib:=LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');
      lssql:=lssql+',' +IntToStr(liNumRecDevContrib);
      If (liIdMotivoDevContrib > 0) Then
        lssql := lssql + ', ' + IntToStr(liIdMotivoDevContrib)
      Else
        if RdgTpFolha.ItemIndex <> 0 then
          lssql:=lssql +', '+IntToStr(prmIdMotivoAbono)
        else
          lssql:=lssql +', '+IntToStr(prmIDMOTIVOFOLHABEN);

      if (Trim(qryAux4.fieldbyname('CodPortForma').asstring) <> '') and
         (qryAux4.fieldbyname('CodPortForma').AsInteger > 0) then
        lssql:=lssql+', ' +qryAux4.fieldbyname('CodPortForma').asstring
      else
        lssql:=lssql+', NULL ';

      lssql:=lssql+
        ', TO_DATE('+
          QuotedStr(qryCtrlInterface.fieldbyname('DATAPAGAMENTO').AsString)+
          ',''DD/MM/YYYY'') ';
      //VALORESPERADO - ATRIBUI O VALORRECEBIDO NA ÉPOCA DO PAGAMENTO DO ABONO
      lssql:=lssql+', '+
        OraNumero(qryAux4.fieldbyname('VALORRECEBIDO').AsString);
      lssql:=lssql+', '+
        OraNumero(qryAux4.fieldbyname('VALORCALCULADO').AsString); //VALORCALCULADO

      if qryAux4.fieldbyname('IDREGRACALCULO').AsString <> '' then
        lssql:=lssql+', '+
          qryAux4.fieldbyname('IDREGRACALCULO').AsString
      else
        lssql:=lssql+', NULL';

      lssql:=lssql+', '+
        OraNumero(qryAux4.fieldbyname('PERCCALCULO').AsString);

      lssql:=lssql+', 1'; // flgdescfolha
      lssql:=lssql+', '+
        IntToStr(qryAux4.fieldbyname('IdPessoa').AsInteger);
      lssql:=lssql+', '+
        IntToStr(qryAux4.fieldbyname('SeqProposta').AsInteger);
      lssql:=lssql+', '+
        IntToStr(qryAux4.fieldbyname('IdPessJur').AsInteger);

      lssql:=lssql+', '+IntToStr(aidplanoprev);
      lssql:=lssql+', '+IntToStr(aidcontribuicao);
      lssql:=lssql+', 0'; //FLGCALCRESERVA
      if Trim(qryAux4.fieldbyname('ValorBase1').asstring) <> '' then
        lssql:=lssql+', '+
          OraNumero(qryAux4.fieldbyname('ValorBase1').asstring)
      else
        lssql:=lssql+', NULL ';

      if Trim(qryAux4.fieldbyname('ValorBase2').asstring) <> '' then
        lssql:=lssql+', '+
          OraNumero(qryAux4.fieldbyname('ValorBase2').asstring)
      else
        lssql:=lssql+', NULL ';

      if Trim(qryAux4.fieldbyname('ValorBase3').asstring) <> '' then
        lssql:=lssql+', '+
          OraNumero(qryAux4.fieldbyname('ValorBase3').asstring)
      else
        lssql:=lssql+', NULL ';

      try
        if Trim(qryAux4.fieldbyname('DATAINICIO').asstring) <> '' then
          lssql:=lssql+
            ', TO_DATE('''+qryAux4.fieldbyname('DataInicio').asstring+
            ''',''DD/MM/YYYY'') '
        else
          lssql:=lssql+', NULL ';
      except
        lssql:=lssql+', NULL ';
      end;

      try
        if Trim(qryAux4.fieldbyname('DATAFINAL').asstring) <> '' then
          lssql:=lssql+
            ', TO_DATE('''+qryAux4.fieldbyname('DataFINAL').asstring+
            ''',''DD/MM/YYYY'') '
        else
          lssql:=lssql+', NULL ';
      except
        lssql:=lssql+', NULL ';
      end;

      lssql:=lssql+', ''AS'''; // FLGSITFUNDACAO
      if uppercase(sIdLoteGravado) = 'NULL' then  // SITRECEBIMENTO 
        lssql:=lssql+',0 '
      else
        lssql:=lssql+',1 ';
      lssql:=lssql+', ''F'''; // TIPO
      lssql:=lssql+', '+sIdLoteGravado; // Lote gravado no beneficio. É nulo para retidos
      lssql:=lssql+', 0'; // PARCELA
      lssql:=lssql+', NULL'; // VALORECEBIDO
      lssql:=lssql+', NULL'; // DATARECEBIMENTO
      lssql:=lssql +', 0 '; // FLGCONCESSAO
      lssql:=lssql +', 0 '; // FLGEVENTO
      lssql:=lssql +', ''B'''; // FOLHAORIGEM
      lssql:=lssql +', SYSDATE '; // DATAEMISSCOB
      lssql:=lssql +', NULL '; // FLGINTEVENTO
      lssql := lssql + ', 1';

      //Henrique SOl 108902
      lssql := lssql +','+RetornaIdTitular(qryAux4.fieldbyname('IdPessoa').AsString,intTostr(aidplanoprev));


      lsSql:='INSERT INTO HSTCONTRIBPREV ('+_clinefeed+
        'MESREFERENCIA, MESCOBRANCA, '+_clinefeed+
        'NUMRECEBIMENTO, IDMOTIVO, CODPORTFORMA, DATAPREVISAORECE,'+_clinefeed+
        'VALORESPERADO, VALORCALCULADO, IDREGRACALCULO, PERCCALCULO, '+_clinefeed+
        'FLGDESCFOLHA, IDPESSOA, SEQPROPOSTA, IDPESSJUR, IDPLANOPREV, '+_clinefeed+
        'IDCONTRIBUICAO, FLGCALCRESERVA, VALOROP1, VALOROP2, VALOROP3,DATAINICIO, '+_clinefeed+
        'DATAFINAL, FLGSITFUNDACAO, SITRECEBIMENTO, TIPO, IDLOTE, PARCELA, '+_clinefeed+
        'VALORRECEBIDO, DATARECEBIMENTO, FLGCONCESSAO, FLGEVENTO, '+_clinefeed+
        'FOLHAORIGEM, DATAEMISSCOB, FLGINTEVENTO, FLGDEVOLUCAO, IDTITULAR ) VALUES ( '+_clinefeed+
        lssql+')';

      qryAux5.Sql.Clear;
      qryAux5.Sql.Add(lssql);
      qryAux5.execsql;
      iContribDevAbono:=iContribDevAbono+1; 
      result:=true;
    except
      On E:Exception Do
      begin
        TratarErro(e.Message);
        memResult.Lines.Add(
          'Erro ao gravar o histórico de devolução de contribuição '+
          'sobre adiantamento de abono anual para o Beneficiário : '+
          Trim(qryPrinc.fieldbyname('Nome').asstring)+
          ' - Contribuição ['+
          qryAux4.fieldbyname('IDCONTRIBUICAO').AsString+']: '+
          trim(qryAux4.fieldbyname('Nome').asstring)+'.');
        memResult.Lines.Add('Matrícula: '+sUltMatricula); 
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        memResult.Lines.Add('----------------------------');
        result:=false;
      end;
    end;
  end;

begin
  //CONTROLA AS CONTRIBUIÇÕES NOS MESMOS MESES DO ADIANTAMENTO DO BENEFÍCIO
  if trim(gsMesesAdiantado) = '' then
    exit;
  delete(gsMesesAdiantado,length(gsMesesAdiantado),1);

  try  
    qryAux4.Sql.Clear;
    qryAux4.Sql.Add('SELECT IDMOTIVODEVOLUC FROM PARAMAPREV ');
    qryAux4.Open;
    liIdMotivoDevContrib:=qryAux4.fieldbyname('IDMOTIVODEVOLUC').AsInteger;
    if liIdMotivoDevContrib = 0 then
    begin
      if prmIdMotivoAbono > 0 then
        liIdMotivoDevContrib:=prmIdMotivoAbono
      else
        liIdMotivoDevContrib:=prmIDMOTIVOFOLHABEN;
    end;
    

    //PEGA TOTAL DE CONTRIBUIÇÃO
    qryAux4.Sql.Clear;
    qryAux4.Sql.Add(
      'SELECT SUM(DECODE(H.FLGDEVOLUCAO,0,H.VALORESPERADO,1,-H.VALORESPERADO,0)) AS VALORESPERADO '+_clinefeed+
      'FROM HSTCONTRIBPREV H '+_clinefeed+
      'WHERE SUBSTR(H.MESCOBRANCA,1,4) = '+QuotedStr(IntToStr(wAno))+' '+_clinefeed+
      'AND H.MESREFERENCIA = '+QuotedStr(IntToStr(wAno)+'/13')+' '+_clinefeed+
      'AND H.MESCOBRANCA IN ('+gsMesesAdiantado+') '+_clinefeed+
      'AND H.MESCOBRANCA < '+quotedstr(sMesReferencia)+' '+_clinefeed+
      'AND H.IDPESSOA = '+IntToStr(pidpessoa)+' '+_clinefeed+
      'AND H.VALORRECEBIDO IS NOT NULL '+_clinefeed+
      'AND H.SITRECEBIMENTO IN (2,4) '+_clinefeed+
      'AND H.FLGSITFUNDACAO = ''AS'' '+_clinefeed+
      'AND H.FOLHAORIGEM = ''B'' '+_clinefeed+
      'AND H.IDPLANOPREV =' +intTostr(pidplanoprev) +' '+_clinefeed+// Renato Visoni SOL 127182 Kintana 671855
      'AND H.IDLOTE <> '+IntToStr(iIdlote)+' '+_clinefeed);

    qryAux4.Open;
    lrvalorcontrib:=qryAux4.fields[0].asfloat;

    if lrvalorcontrib > 0 then
    begin
      qryAux4.Sql.Clear;
      qryAux4.Sql.Add(
        'SELECT H.MESREFERENCIA, H.MESCOBRANCA, H.NUMRECEBIMENTO, H.IDMOTIVO, '+_clinefeed+
               'H.CODPORTFORMA, H.DATAPREVISAORECE AS DATACOBRANCA, '+_clinefeed+
               oranumero(floattostr(lrvalorcontrib))+' AS VALORESPERADO, '+_clinefeed+
               oranumero(floattostr(lrvalorcontrib))+' AS VALORCALCULADO, '+_clinefeed+
               oranumero(floattostr(lrvalorcontrib))+' AS VALORRECEBIDO, '+_clinefeed+
               'H.IDREGRACALCULO, H.PERCCALCULO, H.FLGDESCFOLHA, '+_clinefeed+
               'H.IDPESSOA, H.SEQPROPOSTA, H.IDPESSJUR, H.IDPLANOPREV, '+_clinefeed+
               'H.FLGCALCRESERVA, H.DATAINICIO, H.DATAFINAL, H.IDCONTRIBUICAO, '+_clinefeed+
               'H.VALOROP1 AS VALORBASE1, H.VALOROP2 AS VALORBASE2, '+_clinefeed+
               'H.VALOROP3 AS VALORBASE3, '+_clinefeed+
               'H.FLGSITFUNDACAO, H.SITRECEBIMENTO, H.TIPO, H.IDLOTE, H.PARCELA, '+_clinefeed+
               'H.DATARECEBIMENTO, H.FLGCONCESSAO, H.FLGEVENTO, H.FOLHAORIGEM, '+_clinefeed+
               'H.DATAEMISSCOB, H.FLGINTEVENTO, '+_clinefeed+
               'NVL(CP.IDRUBDEVADIANT13,NVL(CP.IDRUBDECTERCDEVOL,0)) AS IDRUBDEVADIANT13, C.NOME '+_clinefeed+
        'FROM HSTCONTRIBPREV H, CONTPREV CP, CONTRIBUICAO C '+_clinefeed+
        'WHERE SUBSTR(H.MESCOBRANCA,1,4) = '+QuotedStr(IntToStr(wAno))+' '+_clinefeed+
        'AND H.MESREFERENCIA = '+QuotedStr(IntToStr(wAno)+'/13')+' '+_clinefeed+
        'AND H.MESCOBRANCA IN ('+gsMesesAdiantado+') '+_clinefeed+
        'AND H.MESCOBRANCA < '+quotedstr(sMesReferencia)+' '+_clinefeed+
        'AND H.IDPESSOA = '+IntToStr(pidpessoa)+' '+_clinefeed+
        'AND H.FLGDEVOLUCAO = 0 '+_clinefeed+
        'AND H.VALORRECEBIDO IS NOT NULL '+_clinefeed+
        'AND H.SITRECEBIMENTO IN (2,4) '+_clinefeed+
        'AND H.FLGSITFUNDACAO = ''AS'' '+_clinefeed+
        'AND H.FOLHAORIGEM = ''B'' '+_clinefeed+
        'AND H.IDLOTE <> '+IntToStr(iIdlote)+' '+_clinefeed+
        'AND H.IDPLANOPREV = CP.IDPLANOPREV '+_clinefeed+
        'AND H.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+_clinefeed+
        'AND C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'+_clinefeed+
        'AND H.IDPLANOPREV =' +intTostr(pidplanoprev) +' '+_clinefeed+  //fernando santana - SOL 147514 Kintana 1021433
        'AND ROWNUM = 1'+_clinefeed);

      qryAux4.Open;

      while not qryAux4.eof do
      begin
        if qryAux4.fieldbyname('IDRUBDEVADIANT13').AsInteger = 0 then
        begin
          memResult.Lines.Add(
            'Erro: rubrica de devolução de adiantamento de abono anual '+
            'não parametrizada para a contribuição ['+
            qryAux4.fieldbyname('IDCONTRIBUICAO').AsString+']: '+
            trim(qryAux4.fieldbyname('Nome').asstring)+'.'+
            'Beneficiário: '+trim(psnomebenef)+'.');
          memResult.Lines.Add('Matrícula: '+sUltMatricula); 
          qryAux4.next;
          continue;
        end;

        //MIGROU DE PLANO PEGAR O PLANO NOVO
        if qryAux4.fieldbyname('IdPlanoPrev').AsInteger <> pidplanoprev then
        begin
          qryAux6.Sql.Clear;
          if (pidpessoa = pidtitular) then
            qryAux6.Sql.Add(
              'SELECT CPP.IDCONTRIBUICAO, '+_clinefeed+
              '       NVL(CP.IDRUBDEVADIANT13,NVL(CP.IDRUBDECTERCDEVOL,0)) AS IDRUBDEVADIANT13 '+_clinefeed+
              'FROM CONTRIBPREVPARTP CPP, CONTPREV CP, CONTRIBUICAO C '+_clinefeed+
              'WHERE CPP.IDPESSOA = '+IntToStr(pidpessoa)+' '+_clinefeed+
              'AND CPP.FLGDESCFOLHA = 1 '+_clinefeed+
              'AND CPP.FLGCOBRA = 1 '+_clinefeed+

               //SOL121236 - Daniel Begnami
               ' AND NVL(TO_DATE(TO_CHAR(CPP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
               // FIM SOL12123

              'AND CP.FLGINTERNO = ''AS'' '+_clinefeed+
              'AND CPP.IDPLANOPREV = CP.IDPLANOPREV '+_clinefeed+
              'AND CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+_clinefeed+
              'AND C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'+_clinefeed)
          else
            qryAux6.Sql.Add(
              'SELECT CPP.IDCONTRIBUICAO, '+_clinefeed+
              '       NVL(CP.IDRUBDEVADIANT13,NVL(CP.IDRUBDECTERCDEVOL,0)) AS IDRUBDEVADIANT13 '+_clinefeed+
              'FROM CONTRIBPREVNUCLEO CPP, NUCLEOFAMILIAR N, CONTPREV CP, CONTRIBUICAO C '+_clinefeed+
              'WHERE N.IDRESPNUCLEO = '+IntToStr(pidpessoa)+' '+_clinefeed+
              'AND CPP.FLGCOBRA = 1 '+_clinefeed+

               //SOL121236 - Daniel Begnami
               ' AND NVL(TO_DATE(TO_CHAR(CPP.DATAFINAL, ''YYYY/MM''),''YYYY/MM'') ,TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')) >= TO_DATE('+QuotedStr(sMesReferencia)+', ''YYYY/MM'')'+_clinefeed+
               // FIM SOL12123

              'AND CP.FLGINTERNO = ''AS'' '+_clinefeed+
              'AND CP.IDPLANOPREV = '+inttostr(pidplanoprev)+' '+_clinefeed+
              'AND CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+_clinefeed+
              'AND N.IDNUCLEOFAMILIAR = CPP.IDNUCLEOFAMILIAR '+_clinefeed+
              'AND C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'+_clinefeed);

          qryAux6.Open;

          liidcontribdev:=qryAux6.fieldbyname('IdContribuicao').AsInteger;
          liidplanodev:=pidplanoprev;
        end
        else
        begin
          liidcontribdev:=qryAux4.fieldbyname('IdContribuicao').AsInteger;
          liidplanodev:=qryAux4.fieldbyname('IdPlanoPrev').AsInteger;
        end;

        if liidcontribdev > 0 then
        begin
          if GravaDevolucaoHstContribPrev(liidplanodev, liidcontribdev) then
          begin
            try
              if qryAux4.fieldbyname('IdPlanoPrev').AsInteger <> pidplanoprev then
                liIdRubDevContrib:=qryAux6.fieldbyname('IDRUBDEVADIANT13').asinteger
              else
                liIdRubDevContrib:=qryAux4.fieldbyname('IDRUBDEVADIANT13').asinteger;
              inc(lordem);

	      EnviaContribuicao(qryAux4, qryAux4.fieldbyname('VALORRECEBIDO').AsFloat,
                liidplanodev, liidcontribdev, 
                pidtitular,
                lordem, 
                liNumRecDevContrib, 0,
                1, 
                IntToStr(liIdRubDevContrib),
                liIdMotivoDevContrib 
                );
            except
              on E:Exception do
              begin
                memResult.Lines.Add(
                  'Erro ao enviar cobrança da devolução de contribuição '+
                  'sobre adiantamento de abono anual para o Beneficiário : '+
                  trim(psnomebenef));
                  
                memResult.Lines.Add('Matrícula: '+sUltMatricula); 
                memResult.Lines.Add('Mensagem de erro : '+E.Message);
                memResult.Lines.Add('----------------------------');
                qryAux4.next;
                continue;
              end;
            end;
          end;
        end
        else
        begin
          memResult.Lines.Add(
            'Sem contribuição vinculada para lançar devolução sobre '+
            'o adiantamento de abono para o Beneficiário : '+
            trim(psnomebenef));
            
          memResult.Lines.Add('Matrícula: '+sUltMatricula); 
          memResult.Lines.Add('----------------------------');
        end;
        qryAux4.next;
      end;
    end
    else
    begin
      if lrvalorcontrib < 0 then
      begin
        memResult.Lines.Add(
          'Devolução não lançada. Total de contribuição negativo, '+
          'o que geraria uma cobrança de '+formatfloat('#0.00',lrvalorcontrib)+
          ' para o Beneficiário : '+
          Trim(psnomebenef));
          
        memResult.Lines.Add('Matrícula: '+sUltMatricula);
        memResult.Lines.Add('----------------------------');
      end;
    end;
  finally
    gsMesesAdiantado:='';
  end;
end;

procedure TfrmPreparo.ProximoProcessoBeneficio(bcalcula: boolean);
 var liidtitular, liidpessoa : integer;
     liidplanoprev : integer;
     sSalario: string;
    sUltSalauxdoenca, sSql, sSqlValues : String;
    iidmotivo: integer;
    smesref: string;
    bFoiParaProximo : Boolean; //Renato Visoni SOL 139360 Kintana 855933
begin

  iUltIDPESSJUR:=qryPrinc.fieldbyname('IDPESSJUR').AsInteger;
  sUltIdPessJur:=inttostr(iUltIDPESSJUR);
  if bcalcula then
    sUltSalauxdoenca := FloatToStr(qryPrinc.fieldbyname('SALAUXDOENCA').asFloat);

  if iUltIDPLANOPREV <> qryPrinc.fieldbyname('IDPLANOPREV').AsInteger then
  begin
    iUltIDPLANOPREV:=qryPrinc.fieldbyname('IDPLANOPREV').AsInteger;
    iUltIDPLANOORIGEM:=qryPrinc.fieldbyname('IDPLANOORIGEM').AsInteger; 
    sUltIdPlanoPrev:=inttostr(iUltIDPLANOPREV);
    sDataCobranca:=CriticaDataCobrancaSit(dtmFolha.qryAux,
                                          IntToStr(iIdFundacao),
                                          IntToStr(iUltIdPlanoPrev),
                                          'AS', 'P',
                                          Copy(sMesReferencia,6,2),
                                          Copy(sMesReferencia,1,4));
    if Trim(sDataCobranca) = '' then
      sDataCobranca:=FormatDateTime('dd/mm/yyyy', date);
  end;

  if (qryPrinc.fieldbyname('FLGREFERENCIA').AsInteger = 0) and
     (qryPrinc.fieldbyname('TIPOBENEFICIO').AsInteger in [0,1,2,3,4,7,8,10,11,12]) then
  begin
    iUltIdBenefPrincipal:=qryPrinc.fieldbyname('IDBENEFICIO').AsInteger;
    iUltNProcPrincipal:=qryPrinc.fieldbyname('NUMEROPROCESSO').AsInteger;
  end;
  iUltIDBENEFICIO:=qryPrinc.fieldbyname('IDBENEFICIO').AsInteger;
  sUltIdBeneficio:=inttostr(iUltIDBENEFICIO);

  iUltFlgReferencia:=qryPrinc.fieldbyname('FLGREFERENCIA').AsInteger;

  if bcalcula then
    iUltSitBeneficio:=qryPrinc.fieldbyname('IDSITBENEFICIO').AsInteger;


  bFoiParaProximo := False;

  sUltNumProcesso := QryPrinc.FieldByname('NUMEROPROCESSO').asString;

  if qryPrinc.fieldbyname('QTD').AsInteger > 1 then begin // Renato Visoni SOL 139360 Kintana 855933
    qryPrinc.Next;
    bFoiParaProximo :=  True;
  end;

  liidtitular:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
  liidpessoa:=qryPrinc.fieldbyname('IDPESSOA').AsInteger;
  liidplanoprev:=qryPrinc.fieldbyname('IDPLANOPREV').AsInteger;

  if bcalcula then
  begin
    //CALCULA CONTRIB QUANDO É O ÚLTIMO REGISTRO
    if qryPrinc.eof or
       (iUltIDPLANOPREV <> liidplanoprev) or
       (iUltIdTitular <> liidtitular) or (iUltIdPessoa <> liidpessoa)
       or (qryPrinc.fieldbyname('QTD').AsInteger = 1) // Renato Visoni SOL 139360 Kintana 855933

       then
    begin
      //CALCULA CONTRIB APENAS PARA PARTICIPANTE
      // DEVE SER ALTERADO NO CASO DE CONTRIBUICAO DE BENEFICIARIOS DEPENDENTES

      try
         if iUltIDTITULAR = iUltIdPessoa then
        begin
          if bUltFlgVirtual then
          begin
            if SistemaFolha.CalcSalVirtTodoMes = 0 then
            begin
              // SOL 197395 - KTN 1890667
              {if not ReajustaSalPatro(qryAux2,
                                      sMesReferencia,
                                      IntToStr(iUltIdPessJur),
                                      IntToStr(iUltIdPlanoPrev),
                                      IntToStr(iUltIdTitular),
                                      sDataRef,
                                      sUltSalauxdoenca) then
              begin
                memResult.Lines.Add('Erro Reajuste do Salário Virtual.');
                memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
                memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
                memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
              end;}
              // SOL 197395 - KTN 1890667
            end
            else
            begin
              if not CalculaSalarioVirtual(qryAux2,
                                           sMesReferencia,
                                           IntToStr(iUltIdPessJur),
                                           IntToStr(iUltIdPlanoPrev),
                                           IntToStr(iUltIdTitular),
                                           IntToStr(iUltIdBeneficio),
                                           sDataRef,
                                           sUltSalauxdoenca) then
              begin
                memResult.Lines.Add('Erro Cálculo do Salário Virtual.');
                memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
                memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
                memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
              end;
            end;
            sSalario :=  sUltSalauxdoenca;
            if trim(sSalario) <> '' then
              dUltValSalAuxDoenca:=strtofloat(Clientenumero(sSalario));

            if RdgTpFolha.ItemIndex <> 0 then
            begin
              smesref:=smesabono; 
              iidmotivo:=prmIdMotivoAbono;
            end
            else
            begin
              smesref:=sMesReferencia; 
              iidmotivo:=prmIDMOTIVOFOLHABEN;
            end;
            if not GeraSalarioVirtual(
                        smesref, 
                        sMesReferencia,
                        iUltNumeroProcesso,
                        iUltIdTitular, iUltIdTitular,
                        iIdFundacao,
                        iUltIdPessjur, iUltIdPlanoPrev, 1, iUltIdRubAuxDoenca,
                        iidmotivo,
                        dUltValSalAuxDoenca, dUltValSalAuxDoenca*rProRata) then
            begin
              memResult.Lines.Add('Erro ao gravar o Salário Virtual.');
              memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
              memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
              memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
            end 
	    else
            begin
              try
                qryGravasalauxdoenca.close;
                qryGravasalauxdoenca.parambyname('MESREF').AsString      := sMesReferencia; 
                qryGravasalauxdoenca.parambyname('VALORSALARIO').asFloat := dUltValSalAuxDoenca;
                qryGravasalauxdoenca.parambyname('PIDPESSJUR').asInteger := iUltIdPessjur;
                qryGravasalauxdoenca.parambyname('PIDPESSOA').asInteger := iUltIdPessoa;
                qryGravasalauxdoenca.parambyname('PIDPLANOPREV').asInteger := iUltIdPlanoPrev;
                qryGravasalauxdoenca.execsql;
              except
              end;
            end;
          end;
        end;
      except
        on e:exception do
        begin
          memResult.Lines.Add('Erro ao processar o Salário Virtual.');
          memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
          memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
          memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
          memResult.Lines.Add('Mensagem de erro : '+E.message);
          memResult.Lines.Add('---------------------------------------------------------------');
        end;
      end;

      try
        //BRUNO AZEVEDO SOL 137382 KINTANA 830194
        //BRUNO AZEVEDO SOL 139172 KINTANA 852659
        if (iUltFlgReferencia = 0) then
        //if (qryPrinc.fieldbyname('FLGREFERENCIA').AsInteger = 0) then
        begin
          if iUltIDTITULAR = iUltIdPessoa then
            CalculaEnviaContribuicaoIndividual(sMesReferencia, dbTotalBenef, dbTotalIntegral,
              dbValorAtualInss,
              dbTotalIntegralInss)
          else
            if (iRespNucleoCorrente <> 0) then
              //if (qryPrinc.eof or
                //  (iRespNucleoCorrente<>
                //   qryPrinc.fieldbyname('IDRESPNUCLEO').AsInteger)) then
                CalculaEnviaContribuicaoPensionista(sMesReferencia);

          //EXECUTA A ROTINA DE BUSCA PARA BENEFICIO CORRENTE
          if (RdgTpFolha.ItemIndex = 1) then
          begin
            if gbBuscaAntecipAbono then //controla execução da BUSCA DOS ADIANTAMENTOS DE ABONO
              if iUltFlgReferencia = 0 then
                BuscaLancaAbonoContribuicaoProcessados(
                  iultidplanoprev,
                  iultidtitular,
                  iultidpessoa,
                  qryPrinc.fieldbyname('Nome').asstring
                );

            
            if (giultflgbeneftemp = 1) and
               SistemaFolha.FlgBuscaAbonoAnteriorPago then
              if iUltFlgReferencia = 0 then 
                BuscaAbonoContribuicaoTemporario;
          end;
        end;
      except
        on e:exception do
        begin
          memResult.Lines.Add('Erro ao processar cálculo das contribuições.');
          memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
          memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
          memResult.Lines.Add('Mensagem de erro : '+E.message);
          memResult.Lines.Add('---------------------------------------------------------------');
        end;
      end;

      try
        if bGeraAbono and
           //BRUNO AZEVEDO SOL 137382 KINTANA 830194
           //BRUNO AZEVEDO SOL 139172 KINTANA 852659
           //(qryPrinc.fieldbyname('FLGREFERENCIA').AsInteger = 0) then
           (iUltFlgReferencia = 0) then
        begin
          //CALCULA CONTRIB SOBRE O ABONO ANUAL
          if iUltIDTITULAR = iUltIdPessoa then
          begin
            CalculaEnviaContribuicaoIndividual(sMesAbono, dValorAbono, prValorBenef,
              dbValorAtualInss,
              dbTotalIntegralInss); 

            if (giultflgbeneftemp = 1) and
               SistemaFolha.FlgBuscaAbonoAnteriorPago then
              BuscaAbonoContribuicaoTemporario;
          end
          //PARA CASOS DE ENCERRAMENTO AUTOMÁTICO SEM SER TEMPORARIO. EX.: PENSÃO
          else
            if (strtoint(copy(sMesReferencia,6,2)) > gimespgabono) then
              BuscaAbonoContribuicaoTemporario;
        end;
      except
        on e:exception do
        begin
          memResult.Lines.Add('Erro ao processar cálculo das contribuições sobre abono.');
          memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
          memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
          memResult.Lines.Add('Mensagem de erro : '+E.message);
          memResult.Lines.Add('---------------------------------------------------------------');
        end;
      end;

      //CPrev - 26923 - Inicio
      {iUltNumeroProcesso:=qryPrinc.fieldbyname('NUMEROPROCESSO').AsInteger;
      iUltIdRubAuxDoenca:=qryPrinc.fieldbyname('IDRUBSALAUXDOENCA').AsInteger;
      dUltValSalAuxDoenca:=qryPrinc.fieldbyname('SALAUXDOENCA').AsFloat;
      iUltIDTITULAR:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
      iUltIdPessoa:=qryPrinc.fieldbyname('IDPESSOA').AsInteger;
      //P.RAMOS - FUNCEF - 26.12.2003 - GUARDA MATRICULA DO BENEFICIARIO PROCESSADO
      sUltMatricula:=qryPrinc.fieldbyname('MATRICULA').asstring;
      //P.RAMOS - 15.10.2002 - PEND 5907
      iRespNucleoCorrente:=qryPrinc.fieldbyname('IDRESPNUCLEO').AsInteger;
      iNucleoFamiliar:=qryPrinc.fieldbyname('IDNUCLEOFAMILIAR').AsInteger; 
      bUltFlgVirtual:=qryPrinc.fieldbyname('FLGSALVIRTBENEF').AsInteger=1;
      iUltFlgReferencia:=qryPrinc.fieldbyname('FLGREFERENCIA').AsInteger; 
      dbTotalBenef:=0;
      dbTotalIntegral:=0;
      dbTotalBenefInss:=0;
      dbValorAtualInss:=0;
      dbTotalIntegralInss:=0;
      giultflgbeneftemp:=qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger; 
      gimespgabono:=qryPrinc.fieldbyname('MESPGABONO').asinteger; }
      //CPrev - 26923 - Fim
    end;
  end;

  if (qryPrinc.fieldbyname('QTD').AsInteger = 1) and (not bFoiParaProximo) then // Renato Visoni SOL 139360 Kintana 855933
    qryPrinc.Next;


  //CPrev - 27123 - Inicio
  If (iUltIDPLANOPREV <> liidplanoprev) or
     (iUltIdTitular <> liidtitular) or (iUltIdPessoa <> liidpessoa)
      or (qryPrinc.fieldbyname('QTD').AsInteger = 1)
      Then
  Begin
  //CPrev - 26923 - Inicio
      iUltNumeroProcesso:=qryPrinc.fieldbyname('NUMEROPROCESSO').AsInteger;
      iUltIdRubAuxDoenca:=qryPrinc.fieldbyname('IDRUBSALAUXDOENCA').AsInteger;
      dUltValSalAuxDoenca:=qryPrinc.fieldbyname('SALAUXDOENCA').AsFloat;
      iUltIDTITULAR:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
      iUltIdPessoa:=qryPrinc.fieldbyname('IDPESSOA').AsInteger;
      sUltMatricula:=qryPrinc.fieldbyname('MATRICULA').asstring;
      iRespNucleoCorrente:=qryPrinc.fieldbyname('IDRESPNUCLEO').AsInteger;
      iNucleoFamiliar:=qryPrinc.fieldbyname('IDNUCLEOFAMILIAR').AsInteger;
      bUltFlgVirtual:=qryPrinc.fieldbyname('FLGSALVIRTBENEF').AsInteger=1;
      iUltFlgReferencia:=qryPrinc.fieldbyname('FLGREFERENCIA').AsInteger;
      giultflgbeneftemp:=qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger;
      gimespgabono:=qryPrinc.fieldbyname('MESPGABONO').asinteger;
      dbTotalBenef:=0;
      dbTotalIntegral:=0;
      dbTotalBenefInss:=0;
      dbValorAtualInss:=0;
      dbTotalIntegralInss:=0;
    //CPrev - 26923 - Fim
  End;
  //CPrev - 27123 - Fim


end;


function TfrmPreparo.CheckLimiteBeneficio(arvalorcorrente, arvalornovo,
  arvalorlimite, arperclimite: real): integer;
// Retorno:
//  1 - ultrapassou limite
//  2 - ultrapassou percentual
begin
  result:=0;
  if arvalorlimite > 0 then
  begin
    if arvalornovo > arvalorlimite then
    begin
      result:=1;
      exit;
    end;
  end;
  if arperclimite > 0 then
  begin
    if (((arvalornovo-arvalorcorrente)/arvalorcorrente)-(arperclimite/100) > 0.01) then
      result:=2;
  end;
end;


function TfrmPreparo.AtualizaSituacaoBeneficio(
  aqryBeneficio, aqryaux: twwquery;
  aIdSitBeneficio: integer;
  var asMsgErroBanco: string): boolean;
var lssql: string;
begin
  result:=true;
  lssql:='UPDATE BENEFBFCIARIO '+_clinefeed+
         'SET IDSITBENEFICIO = '+inttostr(aIdSitBeneficio)+' '+_clinefeed+
         'WHERE (IDTITULAR = '+inttostr(aqryBeneficio.fieldbyname('idtitular').AsInteger)+') '+_clinefeed+
         'AND (NUMEROPROCESSO = '+inttostr(aqryBeneficio.fieldbyname('NumeroProcesso').AsInteger)+') '+_clinefeed+
         'AND (SEQPROPOSTA = '+inttostr(aqryBeneficio.fieldbyname('SEQPROPOSTA').AsInteger)+') '+_clinefeed+
         'AND (IDPESSJUR = '+inttostr(aqryBeneficio.fieldbyname('IDPESSJUR').AsInteger)+') '+_clinefeed+
         'AND (IDPLANOPREV = '+inttostr(aqryBeneficio.fieldbyname('IDPLANOPREV').AsInteger)+') '+_clinefeed+
         //BRUNO AZEVEDO SOL 147427 KINTANA 1055088
         'AND (IDPLANOORIGEM = '+inttostr(aqryBeneficio.fieldbyname('IDPLANOORIGEM').asinteger)+') '+_clinefeed+
         'AND (IDBENEFICIO = '+inttostr(aqryBeneficio.fieldbyname('IDBENEFICIO').AsInteger)+') '+_clinefeed+
         'AND (IDPESSOA = '+inttostr(aqryBeneficio.fieldbyname('IDPESSOA').AsInteger)+') '+_clinefeed;

  try
    aqryaux.sql.clear;
    aqryaux.sql.add(lssql);
    aqryaux.execsql;
  except
    on E:EDBEngineError do
    begin
      asMsgErroBanco:=e.message;
      result:=false;
    end;
  end;
end;

function TfrmPreparo.ForcaRetencaoPorLimite(
  aqryBeneficio, aqryaux: twwquery; arvalorNovo: real): boolean;
var lsMsgErro: string;
begin
  if not AtualizaSituacaoBeneficio(aqryBeneficio, aqryaux, 2, lsMsgErro) then
  begin
    memResult.Lines.Add('Erro na retenção do valor atual do benefício '+
      aqryBeneficio.fieldbyname('beneficio').asstring+' para beneficiário o '+
      aqryBeneficio.fieldbyname('nome').asstring);
    memResult.Lines.Add('Mensagem de erro: '+lsMsgErro);
    exit;
  end;

  try
    CriaLogOcorrencia(aqryBeneficio.fieldbyname('IDPLANOPREV').asstring,
      aqryBeneficio.fieldbyname('IDPESSJUR').asstring,
      aqryBeneficio.fieldbyname('IDTITULAR').asstring,
      aqryBeneficio.fieldbyname('IDBENEFICIO').asstring,
      aqryBeneficio.fieldbyname('NUMEROPROCESSO').asstring,
      aqryBeneficio.fieldbyname('IDPESSOA').asstring,
      aqryBeneficio.fieldbyname('SEQPROPOSTA').asstring,
      '3',
      formatdatetime('dd/mm/yyyy',now),
      floattostr(arvalorNovo),
      floattostr(aqryBeneficio.fieldbyname('VALORTOTAL').asfloat),
      floattostr(arvalorNovo),
      '',
      '',
      '',
      '',
      '',
      aqryBeneficio.fieldbyname('IDSITBENEFICIO').asstring,
      0,
      aqryAux, '12', 0);
  except
    on E:EDBEngineError do
    begin
      memResult.Lines.Add('Erro ao gravar movimentação de retenção [MOVBENEF] - Beneficiário : '+
                           aqryBeneficio.fieldbyname('NOME').asstring);
      memResult.Lines.Add('Mensagem de erro : '+E.message);
      exit;
    end;
  end;
  memResult.Lines.Add('Retenção processada para beneficio: '+
    aqryBeneficio.fieldbyname('beneficio').asstring);
  memResult.Lines.Add('------------------------------------------------------------------');
end;


function TfrmPreparo.ProcessaBeneficios : boolean;
 var ssql : string;
     //tratamento para elegibilidade de dependentes
     bretorno: boolean;
     bregraerro: boolean;
     bok: boolean;
     sdatafinal: string;
     //para REAJUSTE BENEFICIO
     linumbenef: integer;
     bReajustou: boolean;
     bBenefReferencia: boolean;
     sMsgErro: string;
     dValorTotal, dValorSRB: double;
     smesreaj, svalorreaj: string;
     lii, imesfinal, idiafinal, ianofinal: word;
     dvalorreaj: double;
     //INCLUSÃO DE VARIÁVEL PARA CONTROLAR EXECUÇÃO DO PROCESSO DE RECÁLCULO QUANDO OCORRE REAJUSTE DE INSS
     bReajustouInss : Boolean;
     liRetorno: integer;
     lbGravaContribuicao: boolean;
begin
  result:=false;
  bReajustouInss := False; 
  EncerrarProcessamento:=false;
  //tratamento para elegibilidade de dependentes antes do processo normal do preparo

  //VERIFICA SE TEM ADIANTAMENTO DE ABONO PARAMETRIZADO NO ANO
  ssql:=
    'SELECT COUNT(*) '+
    'FROM PARAMANTECIPABONO '+
    'WHERE SUBSTR(MES,1,4) = '+quotedstr(copy(sMesReferencia,1,4));

  if FazQuery(qryAux2, ssql) then
    gbBuscaAntecipAbono:=qryAux2.fields[0].asinteger > 0
  else
    gbBuscaAntecipAbono:=false;

  //CONFIRMAR SE DEVE BUSCAR ANTECIPAÇÃO DE ABONO PELO MÊS DE PAGAMENTO DOS PLANOS
  ssql:=
    'SELECT NVL(MESPGABONO,12) AS MESPGABONO '+
    'FROM PLANPREV ORDER BY 1';

  if FazQuery(qryAux2, ssql) then
    if (strtoint(copy(sMesReferencia,6,2)) > qryAux2.fieldbyname('MESPGABONO').asinteger) then
      gbBuscaAntecipAbono:=false;

  if not bTravaCommit then
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;
    if not Sistema.GravaLogOperacoes('Preparo da Folha.') then
      Raise Exception.Create('Não foi possível gravar o log.')
    else
      dtmBaseDados.dbBaseDados.Commit;

        //Jéssica Lana SOL109421 KINTANA 496332
        //memResult.lines.SaveToFile('c:\preparofolha.txt');
        memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

        //BRUNO AZEVEDO SOL 140974 KINTANA 889580
        try
           memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
        except
        end;   
  end;

  if (RdgTpFolha.ItemIndex = 0) and (SistemaFolha.FLGCANCELAFILHO=1) then
  begin
    try
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('PROCESSO DE CANCELAMENTO AUTOMÁTICO DE DEPENDENTES');
      memResult.Lines.Add('IDENTIFICA BENEFICIÁRIOS PARA EXECUTAR REGRA DE ELEGIBILIDADE');
      memResult.Lines.Add('---------------------------------------------------------------');
      if InicializaProcessoBeneficio(RetornaConsultaDependentes) then
      begin
        if not qryPrinc.eof then
        begin
          mensagem.Caption:='Verificando elegibilidade dos dependentes ...';
          mensagem.Update;

          iUltIDTITULAR:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
          iUltIdPessoa:=qryPrinc.fieldbyname('IDPESSOA').AsInteger;
          iUltNumeroProcesso:=qryPrinc.fieldbyname('NumeroProcesso').AsInteger;
          giultflgbeneftemp:=qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger; 

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(false);
              if qryPrinc.fieldbyname('DATAFINAL').isnull and
                 qryPrinc.fieldbyname('DATAFINALPREVISTA').isnull then
              begin
                if (qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger in [1,2]) then
                begin
                  bretorno:=ExecutaRegraElegibilidadeBfciario(qryAux2,
                    qryPrinc.fieldbyname('IDREGRAELEGIBILI').asinteger,
                    qryPrinc.fieldbyname('IDPESSJUR').asinteger,
                    qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
                    qryPrinc.fieldbyname('IDTITULAR').asinteger,
                    qryPrinc.fieldbyname('IDPESSOA').asinteger,
                    qryPrinc.fieldbyname('SEQPROPOSTA').asinteger,
                    qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
                    qryPrinc.fieldbyname('VALORBASE1_BEN').asfloat,
                    qryPrinc.fieldbyname('VALORBASE2_BEN').asfloat,
                    qryPrinc.fieldbyname('VALORBASE3_BEN').asfloat,
                    formatDateTime('dd/mm/yyyy', qryPrinc.fieldbyname('DTEVENTO').asdatetime),
                    formatDateTime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime),
                    formatDateTime('dd/mm/yyyy', qryPrinc.fieldbyname('DATADEMISSAO').asdatetime),
                    bregraerro, sMsgErro, 1);
                  if bregraerro then
                  begin
                    memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA ELEGIBILIDADE] - Número : '+
                      inttostr(qryPrinc.fieldbyname('IDREGRAELEGIBILI').AsInteger));
                    memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
                    memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
                    memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                    memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                  end
                  else
                  begin
                    if not bretorno then
                    //não tem mais elegibilidade
                    begin
                      if qryPrinc.fieldbyname('IDREGRAFIM').asinteger > 0 then
                      begin
                        sdatafinal:=ExecutaRegraDataPgtoBeneficio(
                          qryPrinc.fieldbyname('IDREGRAFIM').asinteger,
                          qryPrinc.fieldbyname('IDPESSJUR').asinteger,
                          qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
                          qryPrinc.fieldbyname('IDTITULAR').asinteger,
                          qryPrinc.fieldbyname('SEQPROPOSTA').asinteger,
                          qryPrinc.fieldbyname('IDPESSOA').asinteger,
                          qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
                          qryPrinc.fieldbyname('VALORBASE1_BEN').asfloat,
                          qryPrinc.fieldbyname('VALORBASE2_BEN').asfloat,
                          qryPrinc.fieldbyname('VALORBASE3_BEN').asfloat,
                          formatDateTime('dd/mm/yyyy', qryPrinc.fieldbyname('DTEVENTO').asdatetime),
                          formatDateTime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime),
                          formatDateTime('dd/mm/yyyy', qryPrinc.fieldbyname('DATADEMISSAO').asdatetime),
                          '', bregraerro, sMsgErro);
                        if bregraerro then
                        begin
                          memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA DE DATA FINAL] - Número : '+
                            inttostr(qryPrinc.fieldbyname('IDREGRAFIM').AsInteger));
                          memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
                          memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
                          memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                          memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                        end
                        else
                        begin
                          bok:=true;
                          //FAZ UPDATE NA BENEFBFCIARIO BENEFÍCIO PRINCIPAL
                          if not ExecutarQuery(qryAux2, 'UPDATE BENEFBFCIARIO '+_clinefeed+
                              'SET DATAFINAL = TO_DATE('''+sdatafinal+''',''dd/mm/yyyy'') '+_clinefeed+
                              'WHERE NUMEROPROCESSO = '+inttostr(qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger)+' '+_clinefeed+
                              'AND IDTITULAR = '+inttostr(qryPrinc.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
                              'AND IDPESSOA = '+inttostr(qryPrinc.fieldbyname('IDPESSOA').asinteger)+' '+_clinefeed+
                              'AND IDPLANOPREV = '+inttostr(qryPrinc.fieldbyname('IDPLANOPREV').asinteger)+' '+_clinefeed+
                              'AND IDPESSJUR = '+inttostr(qryPrinc.fieldbyname('IDPESSJUR').asinteger)+' '+_clinefeed+
                              'AND IDBENEFICIO = '+inttostr(qryPrinc.fieldbyname('IDBENEFICIO').asinteger)+' '+_clinefeed+
                              'AND IDPLANOORIGEM = '+inttostr(qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger)+_clinefeed) then
                          begin
                            bok:=false;
                            memResult.Lines.Add('Erro ao gravar data final de benefício');
                            memResult.Lines.Add('Beneficio : '+sUltIdBeneficio);
                            memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
                            memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                            memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                          end;
                          //FAZ UPDATE NA BENEFBFCIARIO BENEFÍCIO INSS E OUTROS BENEFICIOS
                          if not ExecutarQuery(qryAux2, 'UPDATE BENEFBFCIARIO BB '+_clinefeed+
                              'SET DATAFINAL = TO_DATE('''+sdatafinal+''',''dd/mm/yyyy'') '+_clinefeed+
                              'WHERE IDTITULAR = '+inttostr(qryPrinc.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
                              'AND IDPESSOA = '+inttostr(qryPrinc.fieldbyname('IDPESSOA').asinteger)+' '+_clinefeed+
                              'AND IDPLANOPREV = '+inttostr(qryPrinc.fieldbyname('IDPLANOPREV').asinteger)+' '+_clinefeed+
                              'AND IDPESSJUR = '+inttostr(qryPrinc.fieldbyname('IDPESSJUR').asinteger)+' '+_clinefeed+
                              'AND IDPLANOORIGEM = '+inttostr(qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger)+' '+_clinefeed+
                              'AND EXISTS (SELECT 1 '+_clinefeed+
                                          'FROM BENEFPLANPREV BP, BENEFICIO B '+_clinefeed+
                                          'WHERE BP.IDPLANOPREV = BB.IDPLANOPREV '+_clinefeed+
                                          'AND BP.IDBENEFICIO = BB.IDBENEFICIO '+_clinefeed+
                                          'AND BP.IDBENEFICIO = B.IDBENEFICIO '+_clinefeed+
                                          'AND (BP.FLGREFERENCIA = 1 '+_clinefeed+
                                          'OR B.TIPOBENEFICIO NOT IN (0,1,2,3,4,7,8,10,11,12)))'+_clinefeed) then
                          begin
                            bok:=false;
                            memResult.Lines.Add('Erro ao gravar data final de benefício de inss e outros benefícios');
                            memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
                            memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                            memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                          end;
                          if bok then
                          begin
                            memResult.Lines.Add('Beneficiário encerrado por falta de elegibilidade:');
                            memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                            memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                            memResult.Lines.Add('Data final: '+sdatafinal);
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
              end;
              ProximoProcessoBeneficio(false);
            except
              qryPrinc.next;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
          if not bTravaCommit then
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.Commit;
              dtmBaseDados.dbBaseDados.StartTransaction;

              //Jéssica Lana SOL 109421 KINTANA 496332
              //memResult.lines.SaveToFile('c:\preparofolha.txt');
              memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

              //BRUNO AZEVEDO SOL 140974 KINTANA 889580
              try
                 memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
              except
              end;   

            end;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    finally
      Result:=not (bErro);
    end;
  end;
  // SOL 197395 - KTN 1890667
  {if (RdgTpFolha.ItemIndex <> 0) and (SistemaFolha.FLGREAJUSTACANCELADO=1) then
  begin
    try
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('PREPARO DE ABONO ANUAL');
      memResult.Lines.Add('PROCESSO REAJUSTE DE BENEFÍCIOS CANCELADOS');
      memResult.Lines.Add('---------------------------------------------------------------');
      if InicializaProcessoBeneficio(RetornaConsultaReajusteNoAbono) then
      begin
        if not qryPrinc.eof then
        begin
          mensagem.Caption:='Verificando reajuste anterior dos benefícios encerrados...';
          mensagem.Update;

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(false);

              qryBeneficiario.Close;
              qryBeneficiario.ParamByname('pIDTITULAR').asInteger:=
                qryPrinc.fieldbyname('IDTITULAR').AsInteger;
              try
                qryBeneficiario.Open;
                linumBenef:=qryBeneficiario.fields[0].asinteger;
              except
                linumBenef:=1;
              end;

              decodedate(qryPrinc.fieldbyname('DATAFINAL').asdatetime,
                ianofinal, imesfinal, idiafinal);
              for lii:=imesfinal+1 to 12 do
              begin
                sMesReaj:=copy(sMesReferencia,1,4)+'/'+IntCod(lii,2);

                //TRATANDO RETORNO DO REAJUSTE
                try
                   if not ReajustaBenefConc(qryAux2,
                         sMesReaj,
                         formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime),
                         formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIOFUND').asdatetime), 
                         qryPrinc.fieldbyname('IDPESSJUR').asinteger,
                         qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
                         qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger,
                         qryPrinc.fieldbyname('IDTITULAR').asinteger,
                         qryPrinc.fieldbyname('IDPESSOA').asinteger,
                         qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
                         qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger,
                         linumbenef,
                         qryPrinc.fieldbyname('VALORTOTAL').asfloat,
                         qryPrinc.fieldbyname('VALORBASE1_BEN').asfloat,
                         qryPrinc.fieldbyname('VALORBASE2_BEN').asfloat,
                         qryPrinc.fieldbyname('VALORBASE3_BEN').asfloat,
                         bReajustou, bBenefReferencia,
                         sMsgErro, dValorTotal, dValorSRB, dvalorreaj,
                         
                         qryPrinc.fieldbyname('FLGPROVISORIO').asinteger,
                         qryPrinc.fieldbyname('PERCPROVISORIO').asfloat,
                         qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger,
                         '',             // Daniel Begnami SOL 129027
                         qryPrinc.fieldbyname('IDPLANPREVCONTAB').asinteger) then  // Daniel Begnami SOL 129027
                   begin
                     memResult.Lines.Add('Erro no reajuste: '+sMsgErro);
                     memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                     memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                     memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                     memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                   end
                   else
                   begin
                     if breajustou then
                     begin
                       //exibir mensagem que reajustou
                       memResult.Lines.Add('Reajuste processado.');

                       if trim(sMsgErro) <> '' then
                         memResult.Lines.Add(sMsgErro);

                       memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                       memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                       memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                       memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                       try
                         svalorreaj:=floattostr(dvalorreaj);
                       except
                       end;
                     end;
                   end;

		except
                  on E:Exception do
                  begin
                    memResult.Lines.Add('Erro no recalculo do beneficio ');
                    memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                    memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                    memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                    memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                    memResult.Lines.Add('Mensagem de erro : '+E.Message);
                  end;
                end;
              end;
              ProximoProcessoBeneficio(false);
            except
              qryPrinc.next;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
          if not bTravaCommit then
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.Commit;
              dtmBaseDados.dbBaseDados.StartTransaction;

            //Jéssica Lana SOL 109421 KINTANA 496332
            //memResult.lines.SaveToFile('c:\preparofolha.txt');
            memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

            //BRUNO AZEVEDO SOL 140974 KINTANA 889580
            try
               memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
            except
            end;
               

            end;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    finally
      Result:=not (bErro);
    end;
  end;}
  // SOL 197395 - KTN 1890667
  //FAZER REAJUSTE ANTES DO PROCESSAMENTO NORMAL DA FOLHA.
  // FASE 1: VERIFICA REAJUSTE DE INSS
  // SOL 197395 - KTN 1890667
  {if (RdgTpFolha.ItemIndex = 0) then
  begin
    try
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('VERIFICANDO REAJUSTE DE INSS');
      memResult.Lines.Add('---------------------------------------------------------------');
      if InicializaProcessoBeneficio(RetornaConsultaReajusteINSS) then
      begin
        if not qryPrinc.eof then
        begin
          mensagem.Caption:='Verificando reajuste de INSS...';
          mensagem.Update;

          bReajustouInss := True; 

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(false);

              qryBeneficiario.Close;
              qryBeneficiario.ParamByname('pIDTITULAR').asInteger:=
                qryPrinc.fieldbyname('IDTITULAR').AsInteger;
              try
                qryBeneficiario.Open;
                linumBenef:=qryBeneficiario.fields[0].asinteger;
              except
                linumBenef:=1;
              end;

              sMesReaj:=sMesReferencia;

              try
                 if not ReajustaBenefConc(qryAux2,
                       sMesReaj,
                       formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime),
                       formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIOFUND').asdatetime),
                       qryPrinc.fieldbyname('IDPESSJUR').asinteger,
                       qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
                       qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger,
                       qryPrinc.fieldbyname('IDTITULAR').asinteger,
                       qryPrinc.fieldbyname('IDPESSOA').asinteger,
                       qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
                       qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger,
                       linumbenef,
                       qryPrinc.fieldbyname('VALORTOTAL').asfloat,
                       qryPrinc.fieldbyname('VALORBASE1_BEN').asfloat,
                       qryPrinc.fieldbyname('VALORBASE2_BEN').asfloat,
                       qryPrinc.fieldbyname('VALORBASE3_BEN').asfloat,
                       bReajustou, bBenefReferencia,
                       sMsgErro, dValorTotal, dValorSRB, dvalorreaj,
                       qryPrinc.fieldbyname('FLGPROVISORIO').asinteger,
                       qryPrinc.fieldbyname('PERCPROVISORIO').asfloat,
                       qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger,
                       qryPrinc.fieldbyname('DIBBENEFANT').AsString,
                       qryPrinc.fieldbyname('IDPLANPREVCONTAB').asinteger) then  // Daniel Begnami SOL 129027
                 begin
                   memResult.Lines.Add('Erro no reajuste do INSS: '+sMsgErro);
                   memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                   memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                   memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                   memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                 end
                 else
                 begin
                   if breajustou then
                   begin
                     if not SistemaFolha.FlgInibeMsgDetPreparo then
                     begin
                       //exibir mensagem que reajustou
                       memResult.Lines.Add('Reajuste de INSS processado.');
                       
                       if trim(sMsgErro) <> '' then
                         memResult.Lines.Add(sMsgErro);
                       
                       memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                       memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                       memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                       memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                     end;
                     try
                       svalorreaj:=floattostr(dvalorreaj);
                     except
                     end;
                     
                     liRetorno:=CheckLimiteBeneficio(
                       qryPrinc.fieldbyname('VALORTOTAL').asfloat,
                       dvalorreaj,
                       qryPrinc.fieldbyname('LIMITEALT').asfloat,
                       qryPrinc.fieldbyname('PERCENTUALALT').asfloat);
                     gbRetemBeneficio:=false;
                     if liRetorno > 0 then
                     begin
                       gbRetemBeneficio:=true;
                       if liRetorno = 1 then //ultrapassou limite
                       begin
                         memResult.Lines.Add('==> BENEFÍCIO ULTRAPASSOU LIMITE ESTIPULADO ***');
                       end;
                       if liRetorno = 2 then //ultrapassou percentual
                       begin
                         memResult.Lines.Add('==> BENEFÍCIO ULTRAPASSOU O PERCENTUAL ESTIPULADO ***');
                       end;
                       ForcaRetencaoPorLimite(qryPrinc, qryAux3, dvalorreaj);
                       memResult.Lines.Add('==> VER CADASTRO DO BENEFÍCIO NO PLANO PREVIDENCIÁRIO ***');
                       memResult.Lines.Add('==> BENEFÍCIO FOI RETIDO PELO SISTEMA PARA VERIFICAÇÃO DA ÁREA DE BENEFÍCIOS ***');
                     end;
                     
                   end;
                 end;
              except
                on E:Exception do
                begin
                  memResult.Lines.Add('Erro no recalculo do beneficio ');
                  memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                  memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                  memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                  memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                  memResult.Lines.Add('Mensagem de erro : '+E.Message);
                end;
              end;
              ProximoProcessoBeneficio(false);
            except
              on E:Exception do
              begin
                memResult.Lines.Add('Mensagem de erro : '+E.Message);
                qryPrinc.next;
              end;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
          if not bTravaCommit then
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.Commit;
              dtmBaseDados.dbBaseDados.StartTransaction;

              //Jéssica Lana SOL 109421 KINTANA 4896332
              //memResult.lines.SaveToFile('c:\preparofolha.txt');
              memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

              //BRUNO AZEVEDO SOL 140974 KINTANA 889580
              try
                 memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
              except
              end;   

            end;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    finally
      Result:=not (bErro);
    end;
  end; }
  // SOL 197395 - KTN 1890667
  //FAZER REAJUSTE ANTES DO PROCESSAMENTO NORMAL DA FOLHA.
  // FASE 1: VERIFICA REAJUSTE DE INSS - até aqui

  //FAZER REAJUSTE ANTES DO PROCESSAMENTO NORMAL DA FOLHA.
  // FASE 1: VERIFICA REAJUSTE DE SUPLEMENTAÇÃO, SRB OU ENQUADRAMENTO
  // SOL 197395 - KTN 1890667
  {if (RdgTpFolha.ItemIndex = 0) then
  begin
    try
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('VERIFICANDO REAJUSTE DE SUPLEMENTAÇÃO');
      memResult.Lines.Add('---------------------------------------------------------------');

      bReajustouInss:=FazQuery(qryAux2,
        'SELECT IDRGREAJ '+_clinefeed+
        'FROM REAJINSS '+_clinefeed+
        'WHERE MESREAJ = '+QuotedStr(sMesReferencia)+_clinefeed);

      if InicializaProcessoBeneficio(RetornaConsultaReajusteSuplementacao(bReajustouInss)) then
      begin
        if not qryPrinc.eof then
        begin
          mensagem.Caption:='Verificando recálculo e reajuste de Suplementação, SRB ou enquadramento...';
          mensagem.Update;

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(false);

              qryBeneficiario.Close;
              qryBeneficiario.ParamByname('pIDTITULAR').asInteger:=
                qryPrinc.fieldbyname('IDTITULAR').AsInteger;
              try
                qryBeneficiario.Open;
                linumBenef:=qryBeneficiario.fields[0].asinteger;
              except
                linumBenef:=1;
              end;

              sMesReaj:=sMesReferencia;

              try
                 if not ReajustaBenefConc(qryAux2,
                       sMesReaj,
                       formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime),
                       formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime),//Renato Visoni SOL 105225  KINTANA 471094
                       qryPrinc.fieldbyname('IDPESSJUR').asinteger,
                       qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
                       qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger,
                       qryPrinc.fieldbyname('IDTITULAR').asinteger,
                       qryPrinc.fieldbyname('IDPESSOA').asinteger,
                       qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
                       qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger,
                       linumbenef,
                       qryPrinc.fieldbyname('VALORTOTAL').asfloat,
                       qryPrinc.fieldbyname('VALORBASE1_BEN').asfloat,
                       qryPrinc.fieldbyname('VALORBASE2_BEN').asfloat,
                       qryPrinc.fieldbyname('VALORBASE3_BEN').asfloat,
                       bReajustou, bBenefReferencia,
                       sMsgErro, dValorTotal, dValorSRB, dvalorreaj,
                       qryPrinc.fieldbyname('FLGPROVISORIO').asinteger,
                       qryPrinc.fieldbyname('PERCPROVISORIO').asfloat,
                       qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger,
                       '',             // Daniel Begnami SOL 129027
                       qryPrinc.fieldbyname('IDPLANPREVCONTAB').asinteger) then  // Daniel Begnami SOL 129027
                 begin
                   memResult.Lines.Add('Erro no reajuste de Suplementação, SRB ou enquadramento.');
                   memResult.Lines.Add(' Msg: '+sMsgErro);
                   memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                   memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                   memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                   memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                 end
                 else
                 begin
                   if breajustou then
                   begin
                     if not SistemaFolha.FlgInibeMsgDetPreparo then
                     begin
                       //exibir mensagem que reajustou
                       memResult.Lines.Add('Recálculo e reajuste de Suplementação, SRB ou enquadramento processado.');
                       
                       if trim(sMsgErro) <> '' then
                         memResult.Lines.Add(sMsgErro);
                       
                       memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                       memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                       memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                       memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                     end;
                     try
                       svalorreaj:=floattostr(dvalorreaj);
                     except
                     end;
                     
                     liRetorno:=CheckLimiteBeneficio(
                       qryPrinc.fieldbyname('VALORTOTAL').asfloat,
                       dvalorreaj,
                       qryPrinc.fieldbyname('LIMITEALT').asfloat,
                       qryPrinc.fieldbyname('PERCENTUALALT').asfloat);
                     gbRetemBeneficio:=false;
                     if liRetorno > 0 then
                     begin
                       gbRetemBeneficio:=true;
                       if liRetorno = 1 then //ultrapassou limite
                       begin
                         memResult.Lines.Add('==> BENEFÍCIO ULTRAPASSOU LIMITE ESTIPULADO ***');
                       end;
                       if liRetorno = 2 then //ultrapassou percentual
                       begin
                         memResult.Lines.Add('==> BENEFÍCIO ULTRAPASSOU O PERCENTUAL ESTIPULADO ***');
                       end;
                       ForcaRetencaoPorLimite(qryPrinc, qryAux3, dvalorreaj);
                       memResult.Lines.Add('==> VER CADASTRO DO BENEFÍCIO NO PLANO PREVIDENCIÁRIO ***');
                       memResult.Lines.Add('==> BENEFÍCIO FOI RETIDO PELO SISTEMA PARA VERIFICAÇÃO DA ÁREA DE BENEFÍCIOS ***');
                     end;
                   end;
                 end;
              except
                on E:Exception do
                begin
                  memResult.Lines.Add('Erro no recalculo do beneficio ');
                  memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                  memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                  memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                  memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                  memResult.Lines.Add('Mensagem de erro : '+E.Message);
                end;
              end;
              ProximoProcessoBeneficio(false);
            except
              qryPrinc.next;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
          if not bTravaCommit then
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.Commit;
              dtmBaseDados.dbBaseDados.StartTransaction;

              //Jéssica Lana SOL 109421 KINTANA 4896332
              //memResult.lines.SaveToFile('c:\preparofolha.txt');
              memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

              //BRUNO AZEVEDO SOL 140974 KINTANA 889580
              try
                 memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
              except
              end;   
            end;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    finally
      Result:=not (bErro);
    end;
  end;  }
  // SOL 197395 - KTN 1890667
  //FAZER REAJUSTE ANTES DO PROCESSAMENTO NORMAL DA FOLHA.
  // FASE 2: VERIFICA REAJUSTE DE SUPLEMENTAÇÃO, SRB OU ENQUADRAMENTO

// SOL 63067 - KTN 524520
  //FAZER REAJUSTE ANTES DO PROCESSAMENTO NORMAL DA FOLHA.
  // FASE 1: VERIFICA RESGATE PARCELADO
  if (RdgTpFolha.ItemIndex = 3) then
  begin
    try
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('VERIFICANDO RESGATE PARCELADO');
      memResult.Lines.Add('---------------------------------------------------------------');
      if InicializaProcessoBeneficio(RetornaConsultaResgateParcelado) then
      begin
        if not qryPrinc.eof then
        begin
          //mensagem.Caption:='Verificando reajuste de RESGATE PARCELADO...';   // SOL 197395 - KTN 1890667
          //mensagem.Update;  // SOL 197395 - KTN 1890667

          //bReajustouInss := False; // SOL 197395 - KTN 1890667

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(false);

              qryBeneficiario.Close;
              qryBeneficiario.ParamByname('pIDTITULAR').asInteger:=
                qryPrinc.fieldbyname('IDTITULAR').AsInteger;
              try
                qryBeneficiario.Open;
                linumBenef:=qryBeneficiario.fields[0].asinteger;
              except
                linumBenef:=1;
              end;

              sMesReaj:=sMesReferencia;
              // SOL 197395 - KTN 1890667
              {try
                 if not ReajustaBenefConc(qryAux2,
                       sMesReaj,
                       formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIO').asdatetime),
                       formatdatetime('dd/mm/yyyy', qryPrinc.fieldbyname('DATAINICIOFUND').asdatetime),
                       qryPrinc.fieldbyname('IDPESSJUR').asinteger,
                       qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
                       qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger,
                       qryPrinc.fieldbyname('IDTITULAR').asinteger,
                       qryPrinc.fieldbyname('IDPESSOA').asinteger,
                       qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
                       qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger,
                       linumbenef,
                       qryPrinc.fieldbyname('VALORTOTAL').asfloat,
                       qryPrinc.fieldbyname('VALORBASE1_BEN').asfloat,
                       qryPrinc.fieldbyname('VALORBASE2_BEN').asfloat,
                       qryPrinc.fieldbyname('VALORBASE3_BEN').asfloat,
                       bReajustou, bBenefReferencia,
                       sMsgErro, dValorTotal, dValorSRB, dvalorreaj,
                       qryPrinc.fieldbyname('FLGPROVISORIO').asinteger,
                       qryPrinc.fieldbyname('PERCPROVISORIO').asfloat,
                       qryPrinc.fieldbyname('PRAZOPROVISORIO').asinteger,
                       qryPrinc.fieldbyname('DIBBENEFANT').AsString,
                       qryPrinc.fieldbyname('IDPLANPREVCONTAB').asinteger) then  // Daniel Begnami SOL 129027
                 begin
                   memResult.Lines.Add('Erro no reajuste do INSS: '+sMsgErro);
                   memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                   memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                   memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                   memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                 end
                 else
                 begin
                   if breajustou then
                   begin
                     if not SistemaFolha.FlgInibeMsgDetPreparo then
                     begin
                       //exibir mensagem que reajustou
                       memResult.Lines.Add('Reajuste de RESGASTE PARCELADO processado.');
                       
                       if trim(sMsgErro) <> '' then
                         memResult.Lines.Add(sMsgErro);
                       
                       memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                       memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                       memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                       memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                     end;
                     try
                       svalorreaj:=floattostr(dvalorreaj);
                     except
                     end;
                     
                     liRetorno:=CheckLimiteBeneficio(
                       qryPrinc.fieldbyname('VALORTOTAL').asfloat,
                       dvalorreaj,
                       qryPrinc.fieldbyname('LIMITEALT').asfloat,
                       qryPrinc.fieldbyname('PERCENTUALALT').asfloat);
                     gbRetemBeneficio:=false;
                     if liRetorno > 0 then
                     begin
                       gbRetemBeneficio:=true;
                       if liRetorno = 1 then //ultrapassou limite
                       begin
                         memResult.Lines.Add('==> BENEFÍCIO ULTRAPASSOU LIMITE ESTIPULADO ***');
                       end;
                       if liRetorno = 2 then //ultrapassou percentual
                       begin
                         memResult.Lines.Add('==> BENEFÍCIO ULTRAPASSOU O PERCENTUAL ESTIPULADO ***');
                       end;
                       ForcaRetencaoPorLimite(qryPrinc, qryAux3, dvalorreaj);
                       memResult.Lines.Add('==> VER CADASTRO DO BENEFÍCIO NO PLANO PREVIDENCIÁRIO ***');
                       memResult.Lines.Add('==> BENEFÍCIO FOI RETIDO PELO SISTEMA PARA VERIFICAÇÃO DA ÁREA DE BENEFÍCIOS ***');
                     end;

                   end;
                 end;
              except
                on E:Exception do
                begin
                  memResult.Lines.Add('Erro no recalculo do beneficio ');
                  memResult.Lines.Add('Beneficio : '+qryPrinc.fieldbyname('IdBeneficio').asstring);
                  memResult.Lines.Add('Patrocinadora : '+qryPrinc.fieldbyname('IdPessJur').asstring);
                  memResult.Lines.Add('Matrícula: '+qryPrinc.fieldbyname('matricula').asstring);
                  memResult.Lines.Add('Beneficiário: '+qryPrinc.fieldbyname('nome').asstring);
                  memResult.Lines.Add('Mensagem de erro : '+E.Message);
                end;
              end;}
              // SOL 197395 - KTN 1890667
              ProximoProcessoBeneficio(false);
            except
              on E:Exception do
              begin
                memResult.Lines.Add('Mensagem de erro : '+E.Message);
                qryPrinc.next;
              end;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
          if not bTravaCommit then
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
              dtmBaseDados.dbBaseDados.Commit;
              dtmBaseDados.dbBaseDados.StartTransaction;

              //Jéssica Lana SOL 109421 KINTANA 4896332
              //memResult.lines.SaveToFile('c:\preparofolha.txt');
              memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

              //BRUNO AZEVEDO SOL 140974 KINTANA 889580
              try
                 memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
              except
              end;

            end;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    finally
      Result:=not (bErro);
    end;
  end;
  //FAZER REAJUSTE ANTES DO PROCESSAMENTO NORMAL DA FOLHA.
  // FASE 1: VERIFICA RESGATE PARCELADO - até aqui
// SOL 63067 - KTN 524520

  //FAZ PREPARO DOS GRUPOS DE PENSIONISTAS COM ENCERRAMENTO
  try
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('PROCESSAMENTO DO PREPARO');
    memResult.Lines.Add('GRUPO FAMILIARES (PENSIONISTAS) COM ENCERRAMENTO NO MÊS');
    memResult.Lines.Add('---------------------------------------------------------------');
    InicializaContadores(true); //INICIALIZA CONTADORES E TOTAIS
    if (RdgTpFolha.ItemIndex <> 3) then
    begin
      if InicializaProcessoBeneficio(RetornaConsultaTodos(true,(RdgTpFolha.ItemIndex = 3))) then
      begin
        if not qryPrinc.eof then
        begin
          mensagem.Caption:='Calculando benefícios e contribuições associadas ...';
          mensagem.Update;

          //inicializa no primeiro para controlar calculo de contribuicao
          iUltIDTITULAR:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
          iUltIdPessoa:=qryPrinc.fieldbyname('IDPESSOA').AsInteger;
          iUltNumeroProcesso:=qryPrinc.fieldbyname('NumeroProcesso').AsInteger;
          iUltIdRubAuxDoenca:=qryPrinc.fieldbyname('IDRUBSALAUXDOENCA').AsInteger;
          dUltValSalAuxDoenca:=qryPrinc.fieldbyname('SALAUXDOENCA').AsFloat;
          bUltFlgVirtual:=qryPrinc.fieldbyname('FLGSALVIRTBENEF').AsInteger=1;

          //GUARDA MATRICULA DO BENEFICIARIO PROCESSADO
          sUltMatricula:=qryPrinc.fieldbyname('MATRICULA').asstring;

          iRespNucleoCorrente:=qryPrinc.fieldbyname('IDRESPNUCLEO').AsInteger;
          iNucleoFamiliar:=qryPrinc.fieldbyname('IDNUCLEOFAMILIAR').AsInteger;

          //OBTEM ISENÇÃO DE IR PARA NÃO ABRIR RUBRICAS DE AÇÃO JUDICIAL
          iIsentoIRRF:=qryPrinc.fieldbyname('FLGISENTOIRRF').AsInteger;

          giultflgbeneftemp:=qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger;

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(true);
              if not ExecutaRegraProcessoBeneficio then
              begin
                inc(iBenefErro);
                qryPrinc.Next;
                continue;
              end;
              if not GravaProcessoBeneficio(lbGravaContribuicao) then
              begin
                inc(iBenefErro);
                qryPrinc.next;
                continue;
              end;

              if lbGravaContribuicao then
              begin
                if qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger = 2 then
                  inc(iBenefRetido)
                else
                  inc(iBenefProc);
              end
              else
                inc(iBenefErro);

              ProximoProcessoBeneficio({true}lbGravaContribuicao);
            except
              qryPrinc.next;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    end
    else
    begin
      memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('');
    end

  finally
    Result:=not (bErro);
  end;

  try
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('PROCESSAMENTO DO PREPARO');
    memResult.Lines.Add('IDENTIFICANDO BENEFICIÁRIOS A PREPARAR');
    memResult.Lines.Add('---------------------------------------------------------------');
    InicializaContadores(false); //INICIALIZA CONTADORES E TOTAIS NÃO
    if (RdgTpFolha.ItemIndex <> 3) then
    begin
      if InicializaProcessoBeneficio(RetornaConsultaTodos(false,(RdgTpFolha.ItemIndex = 3))) then
      begin
        if not qryPrinc.eof then
        begin
          mensagem.Caption:='Calculando benefícios e contribuições associadas ...';
          mensagem.Update;

          //inicializa no primeiro para controlar calculo de contribuicao
          iUltIDTITULAR:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
          iUltIdPessoa:=qryPrinc.fieldbyname('IDPESSOA').AsInteger;
          iUltNumeroProcesso:=qryPrinc.fieldbyname('NumeroProcesso').AsInteger;
          iUltIdRubAuxDoenca:=qryPrinc.fieldbyname('IDRUBSALAUXDOENCA').AsInteger;
          dUltValSalAuxDoenca:=qryPrinc.fieldbyname('SALAUXDOENCA').AsFloat;
          bUltFlgVirtual:=qryPrinc.fieldbyname('FLGSALVIRTBENEF').AsInteger=1;

          //GUARDA MATRICULA DO BENEFICIARIO PROCESSADO
          sUltMatricula:=qryPrinc.fieldbyname('MATRICULA').asstring;

          iRespNucleoCorrente:=qryPrinc.fieldbyname('IDRESPNUCLEO').AsInteger;
          iNucleoFamiliar:=qryPrinc.fieldbyname('IDNUCLEOFAMILIAR').AsInteger;

          //OBTEM ISENÇÃO DE IR PARA NÃO ABRIR RUBRICAS DE AÇÃO JUDICIAL
          iIsentoIRRF:=qryPrinc.fieldbyname('FLGISENTOIRRF').AsInteger;

          giultflgbeneftemp:=qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger;

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(true);
              if not ExecutaRegraProcessoBeneficio then
              begin
                inc(iBenefErro);
                qryPrinc.Next;
                continue;
              end;
              if not GravaProcessoBeneficio(lbGravaContribuicao) then
              begin
                inc(iBenefErro);
                qryPrinc.next;
                continue;
              end;

              if lbGravaContribuicao then
              begin
                if qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger = 2 then
                  inc(iBenefRetido)
                else
                  inc(iBenefProc);
              end
              else
                inc(iBenefErro);

              ProximoProcessoBeneficio({true}lbGravaContribuicao);
            except
              qryPrinc.next;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    end
    else
    begin
      memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('');
    end
  finally
    Result:=not (bErro);
  end;

  // xavier

  try
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('PROCESSAMENTO DO PREPARO');
    memResult.Lines.Add('IDENTIFICANDO RESGATE PARCELADO A PREPARAR');
    memResult.Lines.Add('---------------------------------------------------------------');
    InicializaContadores(false); //INICIALIZA CONTADORES E TOTAIS NÃO
    if (RdgTpFolha.ItemIndex = 3) then
    begin
      if InicializaProcessoBeneficio(RetornaConsultaTodos(false,(RdgTpFolha.ItemIndex = 3))) then
      begin
        if not qryPrinc.eof then
        begin
          mensagem.Caption:='Calculando benefícios e contribuições associadas ...';
          mensagem.Update;

          //inicializa no primeiro para controlar calculo de contribuicao
          iUltIDTITULAR:=qryPrinc.fieldbyname('IDTITULAR').AsInteger;
          iUltIdPessoa:=qryPrinc.fieldbyname('IDPESSOA').AsInteger;
          iUltNumeroProcesso:=qryPrinc.fieldbyname('NumeroProcesso').AsInteger;
          iUltIdRubAuxDoenca:=qryPrinc.fieldbyname('IDRUBSALAUXDOENCA').AsInteger;
          dUltValSalAuxDoenca:=qryPrinc.fieldbyname('SALAUXDOENCA').AsFloat;
          bUltFlgVirtual:=qryPrinc.fieldbyname('FLGSALVIRTBENEF').AsInteger=1;

          //GUARDA MATRICULA DO BENEFICIARIO PROCESSADO
          sUltMatricula:=qryPrinc.fieldbyname('MATRICULA').asstring;
        
          iRespNucleoCorrente:=qryPrinc.fieldbyname('IDRESPNUCLEO').AsInteger;
          iNucleoFamiliar:=qryPrinc.fieldbyname('IDNUCLEOFAMILIAR').AsInteger;

          //OBTEM ISENÇÃO DE IR PARA NÃO ABRIR RUBRICAS DE AÇÃO JUDICIAL
          iIsentoIRRF:=qryPrinc.fieldbyname('FLGISENTOIRRF').AsInteger;

          giultflgbeneftemp:=qryPrinc.fieldbyname('FLGBENEFTEMP').AsInteger;

          while not qryPrinc.eof do
          begin
            try
              PassoProcessoBeneficio(true);
              if not ExecutaRegraProcessoBeneficio then
              begin
                inc(iBenefErro); 
                qryPrinc.Next;
                continue;
              end;
              if not GravaProcessoBeneficio(lbGravaContribuicao) then
              begin
                inc(iBenefErro);
                qryPrinc.next;
                continue;
              end;

              if lbGravaContribuicao then
              begin
                if qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger = 2 then
                  inc(iBenefRetido)
                else
                  inc(iBenefProc);
              end
              else
                inc(iBenefErro);

              ProximoProcessoBeneficio({true}lbGravaContribuicao);
            except
              qryPrinc.next;
            end;
          end;
          qryprinc.close;
          GravaResultadoProcessoBeneficio;
        end;
      end
      else
      begin
        memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
        memResult.Lines.Add('---------------------------------------------------------------');
        memResult.Lines.Add('');
      end;
    end
    else
    begin
      memResult.Lines.Add('NENHUM REGISTRO A PROCESSAR');
      memResult.Lines.Add('---------------------------------------------------------------');
      memResult.Lines.Add('');
    end;
  finally
    Result:=not (bErro);
  end;


end;

function TfrmPreparo.RetornaConsultaTodos(abApenasGrupoEncerramento: boolean ; bResgateParcelado : boolean = false) : string;
 var ssql, vParcela  : string;
begin
  FaseGrupoEncerramento:=abApenasGrupoEncerramento;
  if bResgateParcelado then
     vParcela := '1'
  else
     vParcela := '0';

  ssql:='SELECT 0 AS FLGDEVOLUCAO, BB.IDPLANPREVCONTAB,  BB.NUMEROPROCESSO, '+_clinefeed+
        '       NVL(BB.FLGBENEFMIN,0) AS FLGBENEFMIN, '+_clinefeed+
        '       BB.IDTITULAR, BB.IDPESSOA, '+_clinefeed+
        '       BPP.LIMITEALT, BPP.PERCENTUALALT, '+_clinefeed+ 
        //PERMITIR GERAR ABONO ANUAL PARA RETIDOS SEM SER POR RECADASTRAMENTO
        '       BB.FLGSTATUS, '+_clinefeed+
        '       BPP.FLGDATAABONO, '+_clinefeed+
        '       NVL(PP.MESPGABONO,12) AS MESPGABONO, '+_clinefeed+
        '       TPB.FLGFREQUENCIA, '+ 
        '       PPP.INSCRICAODATA, '+ 
        '       BPP.IDREGRACALCULO, BB.IDTPPAGTOBENEFIC, BB.DIBBENEFANT, '+_clinefeed+
        '       BPP.IDREGRAPAGAMENTO, BB.CODPORTFORMA, BB.IDPLANOPREV, BB.IDPESSJUR, '+_clinefeed+
        '       BB.IDBENEFICIO, NVL(BB.DATAINICIOFUND, BB.DATAINICIO) AS DATAINICIOFUND, '+_clinefeed+ 
        '       BB.DATAINICIO, '+_clinefeed+
        '       BB.DATAFINAL, PP.NOME AS PLANO, BPP.IDREGRAREAJBENEF, '+_clinefeed+
        '       NVL(BPP.INDICEREAJBENEF,0) AS INDICEREAJBENEF, BB.VALORATUAL, '+_clinefeed+
        '       BB.VALORCALCULADO, '+_clinefeed+ 
        '       BB.SEQPROPOSTA, P.NOME, BPP.IDREGRACALCABONO, BPP.FLGABONOFINALBEN, '+_clinefeed+
        '       BPP.FLGPOSSUIABONO, BB.ULTMESREAJUSTE, B.NOME AS BENEFICIO, decode('+vParcela+',0,TP.QTDEMESES,6) AS QTDEMESES, '+_clinefeed+
        '       B.TIPOBENEFICIO, '+_clinefeed+
        '       BPP.FLGACEITAZERO, '+_clinefeed+
        '       PPP.VALORINFINSS, BPP.IDREGRAPRIMPAGTO, BPP.FLGCALCTODOMES, '+_clinefeed+
        '       PR.DTDIREITO, PR.DTEVENTO, PA.NOME AS PATROCINADORA, BPP.IDREGRABENEFICIA, '+_clinefeed+
        '       BB.VALORCOTAS, B.FLGBENEFPROV, B.FLGBENEFTEMP, '+_clinefeed+
        '       NVL(BB.VALORTOTAL, BB.VALORATUAL) AS VALORTOTAL, '+_clinefeed+
        '       NVL(BPP.FLGREFERENCIA,0) AS FLGREFERENCIA, BPP.FLGPAGAINSS, '+_clinefeed+
        '       DECODE(BB.FONTEPAGADORA,0,1,NVL(BB.FONTEPAGADORA,1)) FONTEPAGADORA, '+_clinefeed+
        '       NVL(BB.FLGDESCIRMES,0) FLGDESCIRMES, '+_clinefeed+
        '       BPP.IDRUBABONO, BPP.IDRUBANTECABONO, '+_clinefeed+
        '       EL.MATRICULA AS MATRICULA, '+  //GUARDA MATRICULA DO BENEFICIARIO PROCESSADO
        '       BPP.IDRUBABONOFIM, BB.ULTVALORBRUTO, BB.IDSITBENEFICIO, '+_clinefeed+
        '       BB.DATAFINALPREVISTA, BB.FLGDATAPREVISTA, PF.DATANASC AS DATANASC, '+_clinefeed+
        '       PF.SEXO, BPP.IDREGRAULTPAGTO, NVL(BB.VLRINFINSS,0) VLRINFINSS, '+_clinefeed+
        '       PPP.IDSITPART, PPP.IDSITPLANOPREV, EL.TEMPOSERVTOTAL, EL.IDSITFUNC, '+_clinefeed+
        '       PPP.FLGSALVIRTBENEF, PPP.SALAUXDOENCA, PAT.IDRUBSALAUXDOENCA, '+_clinefeed+
        //PENSIONISTA PEGA VALORES DA BENEFBFCIARIO
        //PARA PASSAR PARA REGRA DE REAJUSTE DO BENEFICIO
        '       DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE1,0),NVL(BB.VALORBASE1,0)) AS VALORBASE1_BEN, '+_clinefeed+
        '       DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE2,0),NVL(BB.VALORBASE2,0)) AS VALORBASE2_BEN, '+_clinefeed+
        '       DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE3,0),NVL(BB.VALORBASE3,0)) AS VALORBASE3_BEN, '+_clinefeed+
        '       PFT.DATAMORTE AS DATAMORTETIT, '+_clinefeed+
        '       NVL(BB.VALORSRB,0) VALORSRB, '+_clinefeed+
        '       BB.IDPLANOORIGEM, NVL(BB.FLGPROVISORIO,0) AS FLGPROVISORIO, '+_clinefeed+
        '       NVL(BB.PERCPROVISORIO,0) AS PERCPROVISORIO,'+_clinefeed+ 
        '       NVL(BB.PRAZOPROVISORIO,0) AS PRAZOPROVISORIO, '+_clinefeed+ 
        '       NVL(NF.IDRESPNUCLEO,BFC.IDRESPONSAVEL) AS IDRESPNUCLEO, '+_clinefeed+
        '       NVL(NF.IDNUCLEOFAMILIAR,0) AS IDNUCLEOFAMILIAR, '+_clinefeed;

  //ANTECIPACAO DE ABONO
  if RdgTpFolha.ItemIndex = 2 then
    ssql:=ssql +
      '       PAA.IDREGRA AS IDREGRAANTECIPABONO, '+_clinefeed+
      '       PAA.PERCENTUAL AS PERCANTECIPABONO, '+_clinefeed;

  ssql:=ssql +
    //OBTEM ISENÇÃO DE IR PARA NÃO ABRIR RUBRICAS DE AÇÃO JUDICIAL
    '       DECODE(NVL(PF.FLGMOLESTIAGRAVE,0), 1, 1, NVL(PF.FLGISENTOIRRF,0)) AS FLGISENTOIRRF, '+_clinefeed+

    //percentual default = 100%
    '       NVL(BFC.PERCENTUAL, 100) AS PERCENTUAL, '+_clinefeed+
    '       NVL(BB.FLGPAGAINSS, BPP.FLGPAGAINSS) AS FLGPAGAINSSBENEF, '+_clinefeed+ 
    '       NVL(DECODE(BB.IDTITULAR,BB.IDPESSOA,EL.VALORBASE1,DP.VALORBASE1),0) AS VALORBASE1_ELEG, '+_clinefeed+
    '       NVL(DECODE(BB.IDTITULAR,BB.IDPESSOA,EL.VALORBASE2,DP.VALORBASE2),0) AS VALORBASE2_ELEG, '+_clinefeed+
    '       NVL(DECODE(BB.IDTITULAR,BB.IDPESSOA,EL.VALORBASE3,DP.VALORBASE3),0) AS VALORBASE3_ELEG '+_clinefeed+

    '      ,COUNT(P.NOME) OVER(PARTITION BY P.NOME) AS QTD ' +_clinefeed+  //Renato Visoni SOL 139360  Kintana 855933

    'FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, DEPENTIT DP, '+_clinefeed+
    '     TPPAGTOBENEFICIO TPB, TPPERIODICIDADE TP, PROCESSOBENEF PR, '+_clinefeed+
    '     BENEFPLANPREV BPP, PARTPREVPLAN PPP, ELEGPATRO EL, '+_clinefeed+
    '     BFCIARIOTITPLAN BFC, NUCLEOFAMILIAR NF, '+_clinefeed;

  if RdgTpFolha.ItemIndex = 2 then
    ssql:=ssql +
      '     PARAMANTECIPABONO PAA, '+_clinefeed;

  ssql:=ssql +
    '     BENEFICIO B, PLANPREV PP, PATRO PAT, PESSOA P, '+_clinefeed+
    '     PESSOAFISICA PF, PESSOAFISICA PFT, PESSOA PA '+_clinefeed+
    'WHERE '+_clinefeed;

  if bResgateParcelado then // SOL 63067 - KTN 524520
     FiltraBenefMesPorTipoFolha(0, true, ssql)
  else
     FiltraBenefMesPorTipoFolha(RdgTpFolha.ItemIndex, true, ssql); // SOL 63067 - KTN 524520

  if not(bResgateParcelado) then //SOL 63067 - KTN 524520
  begin
     ssql:=ssql +
       'AND (BB.FLGFORMAPAGTO = ''F'') AND (TPB.FLGFREQUENCIA <> ''U'') '+_clinefeed;
  end;

  if not chkreferencia.checked then
    ssql:=ssql+'AND ((BPP.FLGREFERENCIA = 0 OR BPP.FLGREFERENCIA IS NULL) OR (BPP.FLGREFERENCIA = 1 AND BPP.FLGPAGAINSS = 1)) '+_clinefeed;
  if sPlanoSel <> '' then
    ssql:=ssql+'AND (BB.IDPLANOPREV IN ('+sPlanoSel+')) '+_clinefeed;
  if sBenefSel <> '' then
    ssql:=ssql+'AND (BB.IDBENEFICIO IN ('+sBenefSel+')) '+_clinefeed;
  if sPatroSel <> '' then
    ssql:=ssql+'AND (BB.IDPESSJUR IN ('+sPatroSel+')) '+_clinefeed;

  if RdgTpFolha.ItemIndex = 2 then
    ssql:=ssql +
      'AND (PAA.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
      'AND (PAA.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
      'AND (PAA.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
      'AND (PAA.MES = '+QuotedStr(sMesReferencia)+') '+_clinefeed;

  //LISTA INDIVIDUAL COLOCADA EM SUBQUERY COM EXISTS PARA EXECUTAR PREPARO INDIVIDUAL
  if cboxIndividual.Checked then
    ssql:=ssql+'AND EXISTS (SELECT 1 '+_clinefeed+
                           'FROM LISTAFOLHABENEFDET LD '+_clinefeed+
                           'WHERE BB.IDTITULAR = LD.IDTITULAR '+_clinefeed+
                           'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '+_clinefeed;

  //IGNORAR BENEFICIOS PREPARADOS NO ABONO EM PROCESSAMENTO ANTERIOR NO MESMO LOTE
                                {Gustavo Terra / Thiago Passos SOL 127088}
  if (RdgTpFolha.ItemIndex <> 0) {and (RdgTpFolha.ItemIndex <> 1)} then //Renato Visoni SOL 120978 KINTANA 579438
    ssql:=ssql+'AND NOT EXISTS (SELECT 1 '+_clinefeed+
                               'FROM HSTBENEFBFCIARIO HB1 '+_clinefeed+
                               'WHERE HB1.NUMEROPROCESSO = BB.NUMEROPROCESSO '+_clinefeed+
                               'AND HB1.IDTITULAR = BB.IDTITULAR '+_clinefeed+
                               'AND HB1.IDPESSOA  = BB.IDPESSOA '+_clinefeed+
                               'AND HB1.IDPLANOORIGEM = BB.IDPLANOORIGEM '+_clinefeed+
                               'AND HB1.IDPLANOPREV = BB.IDPLANOPREV '+_clinefeed+
                               'AND HB1.IDPESSJUR = BB.IDPESSJUR '+_clinefeed+
                               'AND HB1.IDBENEFICIO = BB.IDBENEFICIO '+_clinefeed+
                               'AND HB1.SEQPROPOSTA = BB.SEQPROPOSTA '+_clinefeed+
                               'AND HB1.FLGDEVOLUCAO = 0 '+_clinefeed+
                               'AND HB1.IDMOTIVO IN ('+
                                   inttostr(prmidmotivofolhaben)+', '+
                                   inttostr(prmIdMotivoAbono)+') '+_clinefeed+
                               'AND HB1.MES = '+QuotedStr(sMesReferencia)+' '+_clinefeed+
                               'AND HB1.MESREFERENCIA = '+QuotedStr(sMesAbono)+')'+_clinefeed;

  ssql:=ssql+
    'AND (TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC) '+_clinefeed+
    'AND (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) '+_clinefeed+
    'AND (PR.NUMEROPROCESSO = BB.NUMEROPROCESSO) '+_clinefeed+
    'AND (BP.IDBENEFICIO(+) = BB.IDBENEFICIO) '+_clinefeed+
    'AND (BP.IDPLANOPREV(+) = BB.IDPLANOPREV) '+_clinefeed+
    'AND (BP.IDPESSJUR(+) = BB.IDPESSJUR) '+_clinefeed+
    'AND (BP.SEQPROPOSTA(+) = BB.SEQPROPOSTA) '+_clinefeed+
    'AND (BP.IDPESSOA(+) = BB.IDPESSOA) '+_clinefeed+
    'AND (DP.IDTITULAR = BB.IDTITULAR) '+_clinefeed+
    'AND (DP.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
    'AND (BPP.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
    'AND (BPP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
    'AND (PPP.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
    'AND (   (PPP.IDPLANOPREV = BB.IDPLANOPREV AND BB.IDTITULAR = BB.IDPESSOA) '+_clinefeed+
    '     OR (PPP.IDPLANOPREV = BB.IDPLANOORIGEM AND BB.IDTITULAR <> BB.IDPESSOA)) '+_clinefeed+ 
    'AND (PPP.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
    'AND (PP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed;

  if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
    ssql:=ssql+'AND (PPP.FLGDESATIVADO = 0) '+_clinefeed;

  ssql:=ssql+
    'AND (EL.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
    'AND (EL.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
    'AND (B.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
    'AND (PAT.IDPESSOA = BB.IDPESSJUR) '+_clinefeed+
    'AND (BB.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
    'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
    'AND (P.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
    'AND (PF.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
    'AND (PFT.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
    'AND (PA.IDPESSOA = BB.IDPESSJUR) '+_clinefeed+
    'AND (BFC.IDTITULAR = BB.IDTITULAR) '+_clinefeed+
    'AND (BFC.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
    'AND (BFC.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
    'AND (BFC.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
    'AND (BFC.IDPLANOORIGEM = BB.IDPLANOORIGEM) '+_clinefeed+
    'AND (BFC.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
    'AND (BFC.SEQPROPOSTA = BB.SEQPROPOSTA) '+_clinefeed+
    'AND (BFC.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR(+)) '+_clinefeed+
    'AND (BFC.IDTITULAR = NF.IDTITULAR(+)) '+_clinefeed;

  if (bResgateParcelado) then //SOL 63067 - KTN 524520
  begin
     ssql:=ssql + ' AND (BB.RESGATEPARCELADO = 1) '+_clinefeed;
  end;

  if (FaseGrupoEncerramento) and
  not(bResgateParcelado) //SOL 63067 - KTN 524520
  then
    ssql:=ssql+
      'AND EXISTS (SELECT 1 '+_clinefeed+
      '            FROM BENEFBFCIARIO B1 '+_clinefeed+
      '	         		WHERE B1.IDTITULAR = BB.IDTITULAR '+_clinefeed+
      '			         AND TO_CHAR(B1.DATAFINAL,''YYYY/MM'') = '+QuotedStr(sMesReferencia)+' '+_clinefeed+
      '			         AND B1.IDSITBENEFICIO = 1 '+_clinefeed+
      '			         AND B1.IDTITULAR <> B1.IDPESSOA '+_clinefeed+
      '			         AND ((B1.ULTMESPREPARO < '+QuotedStr(sMesReferencia)+') OR (B1.ULTMESPREPARO IS NULL))) '+_clinefeed;

  ssql:=ssql+
    'ORDER BY QTD DESC, BB.IDPESSJUR, BB.IDPLANOPREV, BB.IDTITULAR, '+_clinefeed+ //Renato Visoni SOL 139360  Kintana 855933
    '         IDRESPNUCLEO, '+_clinefeed+
    '         BPP.FLGREFERENCIA DESC, '+_clinefeed+
    '         BB.IDBENEFICIO, BB.DATAFINAL '+_clinefeed;


  result:=ssql;
end;

//consulta para verificar elegibilidade dos dependentes
function TfrmPreparo.RetornaConsultaDependentes : string;
 var ssql : string;
begin
  ssql:=' SELECT 0 AS FLGDEVOLUCAO, BB.NUMEROPROCESSO, BB.DIBBENEFANT, BB.IDTITULAR, BB.IDPESSOA, '+_clinefeed+
         '       BPP.LIMITEALT, BPP.PERCENTUALALT, PAT.IDRUBSALAUXDOENCA, '+_clinefeed+
         ' BB.IDPLANOPREV, BB.IDPLANPREVCONTAB,  BB.IDPESSJUR, BB.IDBENEFICIO, PPP.SALAUXDOENCA, '+_clinefeed+
         ' NVL(BB.DATAINICIOFUND, BB.DATAINICIO) AS DATAINICIOFUND, PPP.FLGSALVIRTBENEF, '+_clinefeed+
         ' BB.DATAINICIO, 0 IDRESPNUCLEO, 0 IDNUCLEOFAMILIAR, PP.MESPGABONO, '+_clinefeed+
         ' BB.DATAFINAL, PP.NOME AS PLANO, '+_clinefeed+
         ' BB.SEQPROPOSTA, P.NOME, B.NOME AS BENEFICIO, '+_clinefeed+
         ' PR.DTEVENTO, PA.NOME AS PATROCINADORA, '+_clinefeed+
         ' BB.IDSITBENEFICIO, '+_clinefeed+
         ' B.FLGBENEFTEMP, '+_clinefeed+  
         ' BB.DATAFINALPREVISTA, BB.FLGDATAPREVISTA, '+_clinefeed+
         ' BB.FLGPROVISORIO, BB.PERCPROVISORIO, BB.PRAZOPROVISORIO, '+_clinefeed+
         ' NVL(BPP.IDREGRAELEGIBILI, 0) AS IDREGRAELEGIBILI, '+_clinefeed+
         ' NVL(BPP.IDREGRAFIM, 0) AS IDREGRAFIM, '+_clinefeed+
         ' EL.DATADEMISSAO, EL.MATRICULA, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE1,0),NVL(BB.VALORBASE1,0)) AS VALORBASE1_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE2,0),NVL(BB.VALORBASE2,0)) AS VALORBASE2_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE3,0),NVL(BB.VALORBASE3,0)) AS VALORBASE3_BEN, '+_clinefeed+
         ' B.TIPOBENEFICIO, '+_clinefeed+
         ' BB.IDPLANOORIGEM, NVL(BPP.FLGREFERENCIA,0) AS FLGREFERENCIA '+_clinefeed+

         ' ,COUNT(P.NOME) OVER(PARTITION BY P.NOME) AS QTD' +_clinefeed+  //Renato Visoni SOL 150074 Kintana 1085066

        ' FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, DEPENTIT DP, '+_clinefeed+
              'TPPAGTOBENEFICIO TPB, TPPERIODICIDADE TP, PROCESSOBENEF PR, '+_clinefeed+
              'BENEFPLANPREV BPP, PARTPREVPLAN PPP, ELEGPATRO EL, '+_clinefeed+
              'BENEFICIO B, PLANPREV PP, PATRO PAT, PESSOA P, '+_clinefeed+
              'PESSOA PA '+_clinefeed+
        ' WHERE '+_clinefeed;

  FiltraBenefMesPorTipoFolha(RdgTpFolha.ItemIndex, true, ssql);

  ssql:=ssql +
         ' AND (BB.IDTITULAR <> BB.IDPESSOA) '+_clinefeed+
         ' AND (BB.FLGFORMAPAGTO = ''F'') AND (TPB.FLGFREQUENCIA <> ''U'') '+_clinefeed;
  
  if not chkreferencia.checked then
    ssql:=ssql+' AND ((BPP.FLGREFERENCIA = 0 OR BPP.FLGREFERENCIA IS NULL) '+_clinefeed+
               'OR (BPP.FLGREFERENCIA = 1 AND BPP.FLGPAGAINSS = 1)) '+_clinefeed;

  if sPlanoSel <> '' then
    ssql:=ssql+' AND (BB.IDPLANOPREV IN ('+sPlanoSel+')) '+_clinefeed;
  if sBenefSel <> '' then
    ssql:=ssql+' AND (BB.IDBENEFICIO IN ('+sBenefSel+')) '+_clinefeed;
  if sPatroSel <> '' then
    ssql:=ssql+' AND (BB.IDPESSJUR IN ('+sPatroSel+')) '+_clinefeed;

  if cboxIndividual.Checked then
    ssql:=ssql+'AND EXISTS (SELECT 1 '+_clinefeed+
                           'FROM LISTAFOLHABENEFDET LD '+_clinefeed+
                           'WHERE BB.IDTITULAR = LD.IDTITULAR '+_clinefeed+
                           'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '+_clinefeed;

  ssql:=ssql+
         ' AND (TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC) '+_clinefeed+
         ' AND (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) '+_clinefeed+
         ' AND (PR.NUMEROPROCESSO = BB.NUMEROPROCESSO) '+_clinefeed+
         ' AND (BP.IDBENEFICIO(+) = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BP.IDPLANOPREV(+) = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (BP.IDPESSJUR(+) = BB.IDPESSJUR) '+_clinefeed+
         ' AND (BP.SEQPROPOSTA(+) = BB.SEQPROPOSTA) '+_clinefeed+
         ' AND (BP.IDPESSOA(+) = BB.IDPESSOA) '+_clinefeed+
         ' AND (DP.IDTITULAR = BB.IDTITULAR) '+_clinefeed+
         ' AND (DP.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
         ' AND (DP.IDDEPENDENCIA = ''FIL'') '+_clinefeed+
         ' AND (BPP.FLGREFERENCIA = 0 OR BPP.FLGREFERENCIA IS NULL) '+_clinefeed+
         ' AND (BPP.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BPP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (PPP.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND ((PPP.IDPLANOPREV = BB.IDPLANOPREV AND BB.IDTITULAR = BB.IDPESSOA) '+_clinefeed+
              ' OR (PPP.IDPLANOPREV = BB.IDPLANOORIGEM AND BB.IDTITULAR <> BB.IDPESSOA)) '+_clinefeed+ 
         ' AND (PPP.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (PP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (EL.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND (EL.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (B.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (B.TIPOBENEFICIO IN (0,1,2,3,4,7,8,10,11,12)) '+_clinefeed+
         ' AND (PAT.IDPESSOA = BB.IDPESSJUR) '+_clinefeed+
         'AND (BB.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
         'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
         ' AND (P.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
         ' AND (PA.IDPESSOA = BB.IDPESSJUR) '+_clinefeed+
         ' ORDER BY QTD DESC, BB.IDPESSJUR, BB.IDPLANOPREV, '+_clinefeed+   //Renato Visoni SOL 150074 Kintana 1085066  
                   'BB.IDTITULAR '+_clinefeed;
  result:=ssql;
end;

//FAZER REAJUSTE EM LOTE ANTES DO PROCESSAMENTO DO ABONO ANUAL.
// SOL 197395 - KTN 1890667
{function TfrmPreparo.RetornaConsultaReajusteNoAbono: string;
 var ssql : string;
begin
  ssql:=' SELECT 0 AS FLGDEVOLUCAO, BB.IDTITULAR, BB.IDPESSJUR, BB.DIBBENEFANT, BB.IDPLANOPREV, BB.IDPESSOA, '+_clinefeed+
         '       BPP.LIMITEALT, BPP.PERCENTUALALT, PAT.IDRUBSALAUXDOENCA,  PPP.SALAUXDOENCA,'+_clinefeed+
         ' BB.IDBENEFICIO, BB.IDPLANPREVCONTAB, BB.NUMEROPROCESSO, BB.VALORTOTAL, '+_clinefeed+
         ' BB.VALORCALCULADO, PPP.FLGSALVIRTBENEF, 0 IDRESPNUCLEO, 0 IDNUCLEOFAMILIAR, '+_clinefeed+
         ' NVL(BB.DATAINICIOFUND, BB.DATAINICIO) AS DATAINICIOFUND, '+_clinefeed+ 
         ' BB.DATAINICIO, PP.MESPGABONO, '+_clinefeed+
         ' BB.DATAFINAL, '+_clinefeed+
         ' BB.FLGPROVISORIO, BB.PERCPROVISORIO, BB.PRAZOPROVISORIO, '+_clinefeed+
         ' B.FLGBENEFTEMP, '+_clinefeed+  
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE1,0),NVL(BB.VALORBASE1,0)) AS VALORBASE1_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE2,0),NVL(BB.VALORBASE2,0)) AS VALORBASE2_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE3,0),NVL(BB.VALORBASE3,0)) AS VALORBASE3_BEN, '+_clinefeed+
         ' B.NOME AS BENEFICIO, P.NOME, PP.NOME AS PLANO, '+_clinefeed+
         ' PT.NOME AS PATROCINADORA, NVL(BPP.FLGREFERENCIA,0) AS FLGREFERENCIA, '+_clinefeed+
         ' B.TIPOBENEFICIO, EL.MATRICULA, PPP.INSCRICAONUMERO '+_clinefeed+
         ' , BB.IDPLANOORIGEM '+_clinefeed+
          ',COUNT(P.NOME) OVER(PARTITION BY P.NOME) AS QTD' +_clinefeed+  //Renato Visoni SOL 150074 Kintana 1085066


         ' FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, TPPAGTOBENEFICIO TPB, '+_clinefeed+
              'TPPERIODICIDADE TP, BENEFPLANPREV BPP, PARTPREVPLAN PPP, '+_clinefeed+
              'ELEGPATRO EL, PLANPREV PP, BENEFICIO B, PESSOA P, PESSOA PT, '+_clinefeed+
              'PATRO PAT '+_clinefeed+
        ' WHERE '+_clinefeed;

  FiltraBenefMesPorTipoFolha(RdgTpFolha.ItemIndex, true, ssql);
  
  ssql:=ssql +
         'AND (BB.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
         'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
         ' AND (BB.IDSITBENEFICIO = 3) '+_clinefeed+
         ' AND (PP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (BB.IDPESSJUR = PT.IDPESSOA) '+_clinefeed+
         ' AND (BB.FLGFORMAPAGTO = ''F'') AND (TPB.FLGFREQUENCIA <> ''U'') '+_clinefeed+
         ' AND (BP.IDBENEFICIO(+) = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BP.IDPLANOPREV(+) = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (BP.IDPESSJUR(+) = BB.IDPESSJUR) '+_clinefeed+
         ' AND (BP.SEQPROPOSTA(+) = BB.SEQPROPOSTA) '+_clinefeed+
         ' AND (BP.IDPESSOA(+) = BB.IDPESSOA) '+_clinefeed;

  if sPlanoSel <> '' then
    ssql:=ssql+' AND (BB.IDPLANOPREV IN ('+sPlanoSel+')) '+_clinefeed;
  if sBenefSel <> '' then
    ssql:=ssql+' AND (BB.IDBENEFICIO IN ('+sBenefSel+')) '+_clinefeed;
  if sPatroSel <> '' then
    ssql:=ssql+' AND (BB.IDPESSJUR IN ('+sPatroSel+')) '+_clinefeed;

  if cboxIndividual.Checked then
    ssql:=ssql+'AND EXISTS (SELECT 1 '+_clinefeed+
                           'FROM LISTAFOLHABENEFDET LD '+_clinefeed+
                           'WHERE BB.IDTITULAR = LD.IDTITULAR '+_clinefeed+
                           'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '+_clinefeed;

  ssql:=ssql+
         ' AND (TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC) '+_clinefeed+
         ' AND (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) '+_clinefeed+
         ' AND (BPP.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BPP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (PPP.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND ((PPP.IDPLANOPREV = BB.IDPLANOPREV AND BB.IDTITULAR = BB.IDPESSOA) '+_clinefeed+
              ' OR (PPP.IDPLANOPREV = BB.IDPLANOORIGEM AND BB.IDTITULAR <> BB.IDPESSOA)) '+_clinefeed+ 
         ' AND (PPP.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (EL.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND (EL.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (B.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (P.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
         ' ORDER BY QTD DESC, BB.IDPESSJUR, BB.IDPLANOPREV, BB.IDTITULAR, '+_clinefeed+  //Renato Visoni SOL 150074 Kintana 1085066  
                   'BPP.FLGREFERENCIA DESC'+_clinefeed;
  result:=ssql;
end; }
// SOL 197395 - KTN 1890667
function TfrmPreparo.RetornaConsultaResgateParcelado: string;  // SOL 63067 - KTN 524520
 var ssql : string;
begin
  ssql:=' SELECT DISTINCT 0 AS FLGDEVOLUCAO, BB.IDTITULAR, BB.IDPESSJUR, BB.IDPLANOPREV, BB.IDPESSOA, '+_clinefeed+
         '       BPP.LIMITEALT, BPP.PERCENTUALALT, PAT.IDRUBSALAUXDOENCA, PPP.SALAUXDOENCA, '+_clinefeed+
         ' BB.IDBENEFICIO, BB.IDPLANPREVCONTAB, BB.NUMEROPROCESSO, BB.DATAINICIOFUND,  BB.VALORTOTAL, '+_clinefeed+
         ' BB.VALORCALCULADO, PPP.FLGSALVIRTBENEF, 0 IDRESPNUCLEO, 0 IDNUCLEOFAMILIAR,  '+_clinefeed+
         ' NVL(BB.DATAINICIOFUND, BB.DATAINICIO) AS DATAINICIO, BB.DATAFINAL, '+_clinefeed+
         ' BB.FLGPROVISORIO, BB.PERCPROVISORIO, BB.PRAZOPROVISORIO, '+_clinefeed+
         ' B.FLGBENEFTEMP, PP.MESPGABONO, '+_clinefeed+
         ' BB.SEQPROPOSTA, '+_clinefeed+
         ' BB.IDSITBENEFICIO, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE1,0),NVL(BB.VALORBASE1,0)) AS VALORBASE1_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE2,0),NVL(BB.VALORBASE2,0)) AS VALORBASE2_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE3,0),NVL(BB.VALORBASE3,0)) AS VALORBASE3_BEN, '+_clinefeed+
         ' BB.IDPLANOORIGEM, '+_clinefeed+
         ' B.NOME AS BENEFICIO, P.NOME, PP.NOME AS PLANO, '+_clinefeed+
         ' PT.NOME AS PATROCINADORA, NVL(BPP.FLGREFERENCIA,0) AS FLGREFERENCIA, '+_clinefeed+
         ' BB.DIBBENEFANT, '+_clinefeed+
         ' B.TIPOBENEFICIO, EL.MATRICULA, PPP.INSCRICAONUMERO '+_clinefeed+
         ',COUNT(P.NOME) OVER(PARTITION BY P.NOME) AS QTD' +_clinefeed+  //Renato Visoni SOL 150074 Kintana 1085066


        ' FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, TPPAGTOBENEFICIO TPB, '+_clinefeed+
              'TPPERIODICIDADE TP, BENEFPLANPREV BPP, PARTPREVPLAN PPP, REAJINSS RJ, '+_clinefeed+
              'ELEGPATRO EL, PLANPREV PP, BENEFICIO B, PESSOA P, PESSOA PT, '+_clinefeed+
              'PATRO PAT '+_clinefeed+
        ' WHERE '+_clinefeed;

  FiltraBenefMesPorTipoFolha(0 , true, ssql);

  ssql:=ssql +
         'AND (BB.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
         'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
         ' AND (PP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (BB.IDPESSJUR = PT.IDPESSOA) '+_clinefeed+
         //' AND (BB.FLGFORMAPAGTO = ''F'') AND (TPB.FLGFREQUENCIA <> ''U'') '+_clinefeed+
         ' AND (BP.IDBENEFICIO(+) = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BP.IDPLANOPREV(+) = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (BP.IDPESSJUR(+) = BB.IDPESSJUR) '+_clinefeed+
         ' AND (BP.SEQPROPOSTA(+) = BB.SEQPROPOSTA) '+_clinefeed+
         ' AND (BP.IDPESSOA(+) = BB.IDPESSOA) '+_clinefeed+
         //' AND (RJ.MESREAJ = '+QuotedStr(sMesReferencia)+') '+_clinefeed+
         ' AND (NVL(BB.ULTMESREAJUSTE,''0000/00'') < '+QuotedStr(sMesReferencia)+') '+_clinefeed;
         //' AND (BPP.FLGREFERENCIA = 1) '+_clinefeed;
  if sPlanoSel <> '' then
    ssql:=ssql+' AND (BB.IDPLANOPREV IN ('+sPlanoSel+')) '+_clinefeed;
  if sBenefSel <> '' then
    ssql:=ssql+' AND (BB.IDBENEFICIO IN ('+sBenefSel+')) '+_clinefeed;
  if sPatroSel <> '' then
    ssql:=ssql+' AND (BB.IDPESSJUR IN ('+sPatroSel+')) '+_clinefeed;

    if cboxIndividual.Checked then
      ssql:=ssql+'AND EXISTS (SELECT 1 '+_clinefeed+
                             'FROM LISTAFOLHABENEFDET LD '+_clinefeed+
                             'WHERE BB.IDTITULAR = LD.IDTITULAR '+_clinefeed+
                             'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '+_clinefeed;

  ssql:=ssql+
         ' AND (TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC) '+_clinefeed+
         ' AND (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) '+_clinefeed+
         ' AND (BPP.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BPP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (PPP.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND ((PPP.IDPLANOPREV = BB.IDPLANOPREV AND BB.IDTITULAR = BB.IDPESSOA) '+_clinefeed+
              ' OR (PPP.IDPLANOPREV = BB.IDPLANOORIGEM AND BB.IDTITULAR <> BB.IDPESSOA)) '+_clinefeed+
         ' AND (PPP.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (EL.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND (EL.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (B.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (P.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
         ' AND (BB.RESGATEPARCELADO = 1) '+_clinefeed+
         ' ORDER BY QTD DESC, BB.IDPESSJUR, BB.IDPLANOPREV, BB.IDTITULAR '+_clinefeed; //Renato Visoni SOL 150074 Kintana 1085066

  result:=ssql;
end; // SOL 63067 - KTN 524520

// SOL 197395 - KTN 1890667
{function TfrmPreparo.RetornaConsultaReajusteINSS: string;
 var ssql : string;
begin
  ssql:=' SELECT 0 AS FLGDEVOLUCAO, BB.IDTITULAR, BB.IDPESSJUR, BB.IDPLANOPREV, BB.IDPESSOA, '+_clinefeed+
         '       BPP.LIMITEALT, BPP.PERCENTUALALT, PAT.IDRUBSALAUXDOENCA, PPP.SALAUXDOENCA, '+_clinefeed+
         ' BB.IDBENEFICIO, BB.IDPLANPREVCONTAB, BB.NUMEROPROCESSO, BB.DATAINICIOFUND,  BB.VALORTOTAL, '+_clinefeed+
         ' BB.VALORCALCULADO, PPP.FLGSALVIRTBENEF, 0 IDRESPNUCLEO, 0 IDNUCLEOFAMILIAR,  '+_clinefeed+
         ' NVL(BB.DATAINICIOFUND, BB.DATAINICIO) AS DATAINICIO, BB.DATAFINAL, '+_clinefeed+
         ' BB.FLGPROVISORIO, BB.PERCPROVISORIO, BB.PRAZOPROVISORIO, '+_clinefeed+
         ' B.FLGBENEFTEMP, PP.MESPGABONO, '+_clinefeed+
         ' BB.SEQPROPOSTA, '+_clinefeed+
         ' BB.IDSITBENEFICIO, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE1,0),NVL(BB.VALORBASE1,0)) AS VALORBASE1_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE2,0),NVL(BB.VALORBASE2,0)) AS VALORBASE2_BEN, '+_clinefeed+
         ' DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE3,0),NVL(BB.VALORBASE3,0)) AS VALORBASE3_BEN, '+_clinefeed+
         ' BB.IDPLANOORIGEM, '+_clinefeed+
         ' B.NOME AS BENEFICIO, P.NOME, PP.NOME AS PLANO, '+_clinefeed+
         ' PT.NOME AS PATROCINADORA, NVL(BPP.FLGREFERENCIA,0) AS FLGREFERENCIA, '+_clinefeed+
         ' BB.DIBBENEFANT, '+_clinefeed+
         ' B.TIPOBENEFICIO, EL.MATRICULA, PPP.INSCRICAONUMERO '+_clinefeed+
         ',COUNT(P.NOME) OVER(PARTITION BY P.NOME) AS QTD' +_clinefeed+  //Renato Visoni SOL 150074 Kintana 1085066


        ' FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, TPPAGTOBENEFICIO TPB, '+_clinefeed+
              'TPPERIODICIDADE TP, BENEFPLANPREV BPP, PARTPREVPLAN PPP, REAJINSS RJ, '+_clinefeed+
              'ELEGPATRO EL, PLANPREV PP, BENEFICIO B, PESSOA P, PESSOA PT, '+_clinefeed+
              'PATRO PAT '+_clinefeed+
        ' WHERE '+_clinefeed;

  FiltraBenefMesPorTipoFolha(RdgTpFolha.ItemIndex, true, ssql);

  ssql:=ssql +
         'AND (BB.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
         'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
         ' AND (PP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (BB.IDPESSJUR = PT.IDPESSOA) '+_clinefeed+
         ' AND (BB.FLGFORMAPAGTO = ''F'') AND (TPB.FLGFREQUENCIA <> ''U'') '+_clinefeed+
         ' AND (BP.IDBENEFICIO(+) = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BP.IDPLANOPREV(+) = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (BP.IDPESSJUR(+) = BB.IDPESSJUR) '+_clinefeed+
         ' AND (BP.SEQPROPOSTA(+) = BB.SEQPROPOSTA) '+_clinefeed+
         ' AND (BP.IDPESSOA(+) = BB.IDPESSOA) '+_clinefeed+
         ' AND (RJ.MESREAJ = '+QuotedStr(sMesReferencia)+') '+_clinefeed+
         ' AND (NVL(BB.ULTMESREAJUSTE,''0000/00'') < '+QuotedStr(sMesReferencia)+') '+_clinefeed+
         ' AND (BPP.FLGREFERENCIA = 1) '+_clinefeed;
  if sPlanoSel <> '' then
    ssql:=ssql+' AND (BB.IDPLANOPREV IN ('+sPlanoSel+')) '+_clinefeed;
  if sBenefSel <> '' then
    ssql:=ssql+' AND (BB.IDBENEFICIO IN ('+sBenefSel+')) '+_clinefeed;
  if sPatroSel <> '' then
    ssql:=ssql+' AND (BB.IDPESSJUR IN ('+sPatroSel+')) '+_clinefeed;

    if cboxIndividual.Checked then
      ssql:=ssql+'AND EXISTS (SELECT 1 '+_clinefeed+
                             'FROM LISTAFOLHABENEFDET LD '+_clinefeed+
                             'WHERE BB.IDTITULAR = LD.IDTITULAR '+_clinefeed+
                             'AND LD.IDLISTA = '+inttostr(frameBenef.ListaUsuario)+') '+_clinefeed;

  ssql:=ssql+
         ' AND (TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC) '+_clinefeed+
         ' AND (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) '+_clinefeed+
         ' AND (BPP.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (BPP.IDPLANOPREV = BB.IDPLANOPREV) '+_clinefeed+
         ' AND (PPP.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND ((PPP.IDPLANOPREV = BB.IDPLANOPREV AND BB.IDTITULAR = BB.IDPESSOA) '+_clinefeed+
              ' OR (PPP.IDPLANOPREV = BB.IDPLANOORIGEM AND BB.IDTITULAR <> BB.IDPESSOA)) '+_clinefeed+
         ' AND (PPP.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (EL.IDPESSJUR = BB.IDPESSJUR) '+_clinefeed+
         ' AND (EL.IDPESSOA = BB.IDTITULAR) '+_clinefeed+
         ' AND (B.IDBENEFICIO = BB.IDBENEFICIO) '+_clinefeed+
         ' AND (P.IDPESSOA = BB.IDPESSOA) '+_clinefeed+
         ' ORDER BY QTD DESC, BB.IDPESSJUR, BB.IDPLANOPREV, BB.IDTITULAR '+_clinefeed; //Renato Visoni SOL 150074 Kintana 1085066

  result:=ssql;
end;  }
// SOL 197395 - KTN 1890667
//FAZER REAJUSTE ANTES DO PROCESSAMENTO NORMAL DA FOLHA.
// FASE 1: VERIFICA REAJUSTE DE INSS
// SOL 197395 - KTN 1890667
{function TfrmPreparo.RetornaConsultaReajusteSuplementacao(abReajustouInss: Boolean): string;
 var ssql : string;
begin
  sSql := ' SELECT 0 AS FLGDEVOLUCAO, BB.IDTITULAR, BB.IDPESSJUR, BB.DIBBENEFANT, BB.IDPLANOPREV, BB.IDPESSOA, '                   + _clinefeed +
          '        BPP.LIMITEALT, BB.IDPLANPREVCONTAB, BB.DATAINICIOFUND, BPP.PERCENTUALALT, '                                                             + _clinefeed +
          '        BB.IDBENEFICIO, BB.NUMEROPROCESSO, BB.VALORTOTAL, PAT.IDRUBSALAUXDOENCA, '                                             + _clinefeed +
          '        BB.VALORCALCULADO, '                                                                            + _clinefeed +
          '        NVL(BB.DATAINICIOFUND, BB.DATAINICIO) AS DATAINICIO, BB.DATAFINAL, '                            + _clinefeed +
          '        BB.FLGPROVISORIO, BB.PERCPROVISORIO, BB.PRAZOPROVISORIO, '                                      + _clinefeed + 
          '        B.FLGBENEFTEMP, '                                                                               + _clinefeed + 
          '        BB.SEQPROPOSTA, '                                                                               + _clinefeed +
          '        BB.IDSITBENEFICIO, '                                                                            + _clinefeed + 
          '        DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE1,0),NVL(BB.VALORBASE1,0)) AS VALORBASE1_BEN, ' + _clinefeed +
          '        DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE2,0),NVL(BB.VALORBASE2,0)) AS VALORBASE2_BEN, ' + _clinefeed +
          '        DECODE(BB.IDTITULAR,BB.IDPESSOA,NVL(BP.VALORBASE3,0),NVL(BB.VALORBASE3,0)) AS VALORBASE3_BEN, ' + _clinefeed +
          '        B.NOME AS BENEFICIO, P.NOME, PP.NOME AS PLANO, '                                                + _clinefeed +
          '        BB.IDPLANOORIGEM, '+
          '        PT.NOME AS PATROCINADORA, NVL(BPP.FLGREFERENCIA,0) AS FLGREFERENCIA, '                          + _clinefeed +
          '        B.TIPOBENEFICIO, EL.MATRICULA, PPP.INSCRICAONUMERO, '                                           + _clinefeed +
          '        PAT.IDRUBSALAUXDOENCA, PPP.SALAUXDOENCA, PPP.FLGSALVIRTBENEF, PP.MESPGABONO, '                  + _clinefeed + //CPrev - 27165
          '        0 IDRESPNUCLEO, 0 IDNUCLEOFAMILIAR'                                                             + _clinefeed + //CPrev - 27165
          '        ,COUNT(P.NOME) OVER(PARTITION BY P.NOME) AS QTD' +_clinefeed+  //Renato Visoni SOL 150074 Kintana 1085066

          ' FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, TPPAGTOBENEFICIO TPB, '                                      + _clinefeed +
          '      TPPERIODICIDADE TP, BENEFPLANPREV BPP, PARTPREVPLAN PPP, '                                        + _clinefeed;

  If Not abReajustouInss Then
    sSql := sSql + '      REAJBENEFICIO RJ, ' + _clinefeed;

  sSql := sSql + '      ELEGPATRO EL, PLANPREV PP, BENEFICIO B, PESSOA P, PESSOA PT, ' + _clinefeed +
                 '      PATRO PAT '                                                    + _clinefeed +
                 ' WHERE '                                                             + _clinefeed;

  FiltraBenefMesPorTipoFolha(RdgTpFolha.ItemIndex, true, ssql);

  //If abReajustouInss Then  // Daniel Begnami SOL 129027
    //sSql := sSql + '   AND (BB.VALORSRB > 0) ' + _clinefeed;

  sSql := sSql + '   AND (BB.IDPESSJUR      = PAT.IDPESSOA) '                                    + _clinefeed +
                 '   AND (NVL(BB.ULTMESREAJUSTE,''0000/00'') < '+ QuotedStr(sMesReferencia)+') ' + _clinefeed +
                 '   AND (PAT.IDFUNDACAO    = '+inttostr(iidfundacao)+') '                       + _clinefeed +
                 '   AND (PP.IDPLANOPREV    = BB.IDPLANOPREV) '                                  + _clinefeed +
                 '   AND (BB.IDPESSJUR      = PT.IDPESSOA) '                                     + _clinefeed +
                 '   AND (BB.FLGFORMAPAGTO  = ''F'') AND (TPB.FLGFREQUENCIA <> ''U'') '          + _clinefeed +
                 '   AND (BP.IDBENEFICIO(+) = BB.IDBENEFICIO) '                                  + _clinefeed +
                 '   AND (BP.IDPLANOPREV(+) = BB.IDPLANOPREV) '                                  + _clinefeed +
                 '   AND (BP.IDPESSJUR(+)   = BB.IDPESSJUR) '                                    + _clinefeed +
                 '   AND (BP.SEQPROPOSTA(+) = BB.SEQPROPOSTA) '                                  + _clinefeed +
                 //'   AND (BPP.FLGREFERENCIA = 0) '                                               + _clinefeed + // Daniel Begnami SOL 129027
                 '   AND (BP.IDPESSOA(+)    = BB.IDPESSOA) '                                     + _clinefeed;

  If Not abReajustouInss Then
    sSql := sSql + '   AND ((BPP.FLGUSAEVOLFUNC        = 1) OR '                   + _clinefeed +
                   '        ((NVL(BPP.FLGUSAEVOLFUNC,0) = 0) '                     + _clinefeed +
                   '   AND (BPP.IDPLANOPREV   = RJ.IDPLANOPREV) '                  + _clinefeed +
                   '   AND (BPP.IDBENEFICIO   = RJ.IDBENEFICIO) '                  + _clinefeed +
                   '   AND (RJ.MESREAJ        = '+QuotedStr(sMesReferencia)+'))) ' + _clinefeed
  else
    sSql := sSql + '   AND EXISTS (SELECT 1 FROM BENEFBFCIARIO BF1, BENEFPLANPREV BP1 '                     + _clinefeed + //CPrev - 27589
                   '               WHERE (BF1.IDBENEFICIO    = BP1.IDBENEFICIO) '                           + _clinefeed + 
                   '                 AND (BF1.IDPESSJUR     = PAT.IDPESSOA) '                               + _clinefeed + //CPrev - 27589
                   '                 AND (BF1.IDPLANOPREV   = BP1.IDPLANOPREV) '                            + _clinefeed + //CPrev - 27589
                   '                 AND (BP1.FLGREFERENCIA = 0)'                                           + _clinefeed + //CPrev - 27589  // Daniel Begnami SOL 129027
                   '                 AND (BF1.IDTITULAR     = BB.IDTITULAR) '                               + _clinefeed + //CPrev - 27589
                   '                 AND (BF1.IDPESSOA      = BB.IDPESSOA) '                                + _clinefeed + //CPrev - 27589
                   '                 AND (BF1.IDPLANOPREV   = BB.IDPLANOPREV) '                             + _clinefeed + //CPrev - 27589 
                   '                 AND ((BF1.IDSITBENEFICIO IN (1, 2)) OR ((BP1.FLGREFERENCIA = 1) AND '  + _clinefeed +
                   '                      (BP1.FLGPAGAINSS = 0) AND (BF1.IDSITBENEFICIO = 6)))) '           + _clinefeed;

  if sPlanoSel <> '' then
    sSql := sSql + '   AND (BB.IDPLANOPREV    IN ('+sPlanoSel+')) ' + _clinefeed;

  if sBenefSel <> '' then
    sSql := sSql + '   AND (BB.IDBENEFICIO    IN ('+sBenefSel+')) ' + _clinefeed;

  if sPatroSel <> '' then
    sSql := sSql + '   AND (BB.IDPESSJUR      IN ('+sPatroSel+')) ' + _clinefeed;

  If cboxIndividual.Checked then
    sSql := sSql + '   AND EXISTS (SELECT 1 '                                                          + _clinefeed +
                   '               FROM LISTAFOLHABENEFDET LD '                                        + _clinefeed +
                   '               WHERE (BB.IDTITULAR = LD.IDTITULAR) '                               + _clinefeed +
                   '                 AND (LD.IDLISTA   = ' + IntToStr(frameBenef.ListaUsuario) + ')) ' + _clinefeed;

  sSql := sSql + '   AND (TPB.IDTPPAGTOBENEFIC    = BB.IDTPPAGTOBENEFIC) '                        + _clinefeed +
                 '   AND (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) '                      + _clinefeed +
                 '   AND (BPP.IDBENEFICIO         = BB.IDBENEFICIO) '                             + _clinefeed +
                 '   AND (BPP.IDPLANOPREV         = BB.IDPLANOPREV) '                             + _clinefeed +
                 '   AND (PPP.IDPESSJUR           = BB.IDPESSJUR) '                               + _clinefeed +
                 '   AND ((PPP.IDPLANOPREV = BB.IDPLANOPREV AND BB.IDTITULAR = BB.IDPESSOA) '     + _clinefeed +
                 '     OR (PPP.IDPLANOPREV = BB.IDPLANOORIGEM AND BB.IDTITULAR <> BB.IDPESSOA)) ' + _clinefeed +
                 '   AND (PPP.IDPESSOA            = BB.IDTITULAR) '                               + _clinefeed +
                 '   AND (EL.IDPESSJUR            = BB.IDPESSJUR) '                               + _clinefeed +
                 '   AND (EL.IDPESSOA             = BB.IDTITULAR) '                               + _clinefeed +
                 '   AND (B.IDBENEFICIO           = BB.IDBENEFICIO) '                             + _clinefeed +
                 '   AND (P.IDPESSOA              = BB.IDPESSOA) '                                + _clinefeed +
                 ' ORDER BY QTD DESC, BB.IDPESSJUR, BB.IDPLANOPREV, BB.IDTITULAR, '               + _clinefeed +  //Renato Visoni SOL 150074 Kintana 1085066  
                 '          BPP.FLGREFERENCIA DESC'                                               + _clinefeed;
                 
  Result := sSql;
end; }
// SOL 197395 - KTN 1890667
procedure TfrmPreparo.LimpaAmbiente;
begin
  CriaQryLote;
  PnlBeneficio.BevelInner:=bvLowered;
  PnlBeneficioClick(self);
  PnlPlano.BevelInner:=bvLowered;
  PnlPlanoClick(self);
  PnlPatrocinadora.BevelInner:=bvLowered;
  PnlPatrocinadoraClick(self);
  pgcOpcoes.ActivePage:=tbsOpcoes;
end;

procedure TfrmPreparo.bbtnOutroClick(Sender: TObject);
begin
  inherited;
  LimpaAmbiente;
  bbtnPreparo.visible:=true;
  bbtnOutro.visible:=false;
end;

procedure TfrmPreparo.bbtnPreparoClick(Sender: TObject);
 var bOk : boolean;
     k : integer;
     ssql,
     spatro,
     sSqlAux : string;
     QryAux : TwwQuery;
     i : Integer; //Renato Visoni SOL137372

begin
  inherited;
   //Brunno Mattos - KTN 767861 - SOL 132659 inico
   sSqlAux := ' UPDATE HSTBENEFBFCIARIO  '+
              '      SET VALORPREV = VALORPREV'+
              '    WHERE NUMEROPROCESSO   = (SELECT NUMEROPROCESSO'+
              '                               FROM HSTBENEFBFCIARIO'+
              '                              WHERE ROWNUM = 1)';
   QryAux := TwwQuery.Create(self);
   QryAux.DatabaseName := 'BaseDados';
   QryAux.sql.Clear;
   QryAux.sql.Add(sSqlAux);
   Try
     QryAux.ExecSQL;
   Except
    on e : Exception do
    begin
      TratarErro(e.Message);
      Exit;
    end;
   end;
   //Brunno Mattos - KTN 767861 - SOL 132659 fim
  //Renato Visoni SOL 137372 Kintana 896062
  ListaSQL := TStringList.Create();
  //Renato Visoni SOL 137372 Kintana 896062

  AtualizaDadosLote;
  asTipoFolhaContrib:= inttoStr(RdgTpFolha.ItemIndex);//Thiago e Gustava SOL 124272 Kintana 649353
  gsMesesAdiantado:=''; //GUARDA MESES COM ADIANTAMENTO DE ABONO DE BENEFICIO PARA BUSCAR AS CONTRIBUIÇÕES
  gsMesesPagamentoAbono:=''; //GUARDA MESES PARA DEVOLUÇÃO DE PAGAMENTO DE BENEFÍCIO TEMPORÁRIO

  wAno:=strtoint(copy(sMesReferencia,1,4));

  enabled:=false;
  //PARA INIBIR DESCONEXAO AUTOMATICA DO PADRAO
  tag:=9999;

  try
    bbtnPreparo.visible:=false;
    bbtnOutro.visible:=false;
    memResult.Lines.Clear;
    bErro:=False;
    bExcecao:=False;
    lordem:=0;
    IdTitularUltPgto:=0;

    tInicio:=now;

    iUltimaContrib:=-1;

    pgcOpcoes.activepage:=tbsResultado;

    if not VerificaFolha('1', sMesReferencia, inttostr(RdgTpFolha.Itemindex+1),
             formatdatetime('dd/mm/yyyy',
             qryCtrlinterface.fieldbyname('DATAPAGAMENTO').asdatetime)) then
    begin
      MsgDlg('A Regra de Verificação da Folha impede que o Preparo prossiga. '+#13#13+
             'Verifique os parâmetros necessários para o Preparo.',
             'Informação', mtInformation, [mbOk, mbHelp], 0);
      enabled:=true;
      exit;
    end;

    // Testar se o motivo default está preenchido
    if prmIDMOTIVOFOLHABEN <= 0 then
    begin
      MsgDlg('O Motivo [padrão] para a Geração da Folha de Benefícios deverá ser preenchido. Utilize a tela de Parâmetros do Modulo.','Informação',mtInformation,[mbOk,mbHelp],0);
      Exit;
    end;

    //QUERY PARA PEGAR PARAMETRIZACAO CONTABIL E
    //FINANCEIRA POR PLANO OU PATRO/PLANO DAS CONTRIBUICOES DE ASSISTIDO.
    qryContaContrib.close;
    
    ssql:=
      'SELECT DECODE(CPPAT.IDPESSJUR,         NULL, 0,                       CPPAT.IDPESSJUR)         IDPESSJUR, '+_clinefeed+
             'CPREV.IDPLANOPREV, '+_clinefeed+
             'CPREV.IDCONTRIBUICAO, '+_clinefeed+
             'DECODE(CPPAT.PLACONTAC,         NULL, CPREV.PLACONTAC,         CPPAT.PLACONTAC)         PLACONTAC, '+_clinefeed+
             'DECODE(CPPAT.CODCENTROCUSTOC,   NULL, CPREV.CODCENTROCUSTOC,   CPPAT.CODCENTROCUSTOC)   CODCENTROCUSTOC, '+_clinefeed+
             'DECODE(CPPAT.UNIDNEGOC,         NULL, CPREV.UNIDNEGOC,         CPPAT.UNIDNEGOC)         UNIDNEGOC, '+_clinefeed+
             'DECODE(CPPAT.CODCENTRORESPON,   NULL, CPREV.CODCENTRORESPON,   CPPAT.CODCENTRORESPON)   CODCENTRORESPON, '+_clinefeed+
             'DECODE(CPPAT.CODSUBCONTA,       NULL, CPREV.CODSUBCONTA,       CPPAT.CODSUBCONTA)       CODSUBCONTA, '+_clinefeed+
             'DECODE(CPPAT.PLACONTAC13,       NULL, CPREV.PLACONTAC13,       CPPAT.PLACONTAC13)       PLACONTAC13, '+_clinefeed+
             'DECODE(CPPAT.CODCENTROCUSTOC13, NULL, CPREV.CODCENTROCUSTOC13, CPPAT.CODCENTROCUSTOC13) CODCENTROCUSTOC13, '+_clinefeed+
             'DECODE(CPPAT.UNIDNEGOC13,       NULL, CPREV.UNIDNEGOC13,       CPPAT.UNIDNEGOC13)       UNIDNEGOC13, '+_clinefeed+
             'DECODE(CPPAT.CODCENTRORESPON13, NULL, CPREV.CODCENTRORESPON13, CPPAT.CODCENTRORESPON13) CODCENTRORESPON13, '+_clinefeed+
             'DECODE(CPPAT.CODSUBCONTA13,     NULL, CPREV.CODSUBCONTA13,     CPPAT.CODSUBCONTA13)     CODSUBCONTA13, '+_clinefeed+
             'DECODE(CPPAT.CODTIPDESEMBCAR,   NULL, CPREV.CODTIPDESEMBCAR,   CPPAT.CODTIPDESEMBCAR)   CODTIPDESEMBCAR, '+_clinefeed+
             'DECODE(CPPAT.RECPAGDEVOL,       NULL, CPREV.RECPAGDEVOL,       CPPAT.RECPAGDEVOL)       RECPAGDEVOL '+_clinefeed+
      'FROM CONTPLANPATRO CPPAT, CONTPREV CPREV, PATRO PAT '+_clinefeed+
      'WHERE CPPAT.IDPLANOPREV(+) = CPREV.IDPLANOPREV '+_clinefeed+
      'AND CPPAT.IDCONTRIBUICAO(+) = CPREV.IDCONTRIBUICAO '+_clinefeed+
      'AND CPREV.FLGINTERNO = ''AS'' '+_clinefeed;

      if prmFLGCOBPATROFOLHA = 1 then
        ssql := ssql +
          'AND ((CPREV.FLGPAGADOR =  ''C'') OR (CPREV.FLGPAGADOR =  ''P'')) '+_clinefeed
      else
        ssql := ssql +
          'AND (CPREV.FLGPAGADOR =  ''C'') '+_clinefeed;
       ssql:=ssql+
      'AND (CPPAT.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
      'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
      'ORDER BY IDPESSJUR, CPREV.IDPLANOPREV, CPREV.IDCONTRIBUICAO '+_clinefeed;
    qryContaContrib.sql.clear;
    qryContaContrib.sql.add(ssql);
    qryContaContrib.open;

    pnlProgress.visible:=True;
    pnlProgress.bringtofront;

    // Carrega as informações
    DeterminaPatroSel;
    DeterminaPlanoSel;
    DeterminaBenefSel;

    mensagem.Caption:='Preparando dados ...';
    mensagem.Update;

    memResult.Lines.Add('');
    memResult.Lines.Add('Preparo da Folha Benefícios');
    memResult.Lines.Add('Data do Pagamento: '+formatdatetime('dd/mm/yyyy',
      qryCtrlinterface.fieldbyname('DATAPAGAMENTO').asdatetime));
    memResult.Lines.Add('');
    memResult.Lines.Add('Mês de Referência : ' + Trim(sMesReferencia));
    memResult.Lines.Add('---------------------------------------------------------------');
    memResult.Lines.Add('');

    dbTotalIntegral:=0;
    dbTotalBenef:=0;
    dbTotalBenefInss:=0;
    dbValorAtualInss:=0;
    dbTotalIntegralInss:=0;
    bUltFlgVirtual:=false;
    iUltIdTitular:=0;
    iUltIdPessoa:=0;
    iUltIDPLANOPREV:=0;
    iUltIDPLANOORIGEM:=0; 
    sUltMatricula:='';
    iRespNucleoCorrente:=0;
    giultflgbeneftemp:=0; 

    lblTitLote.caption:='Processando Cálculos do Preparo : Lote '+inttostr(iIdLote);

    if ProcessaBeneficios then
    begin
      AtualizaLote;
      if not bTravaCommit then

        //Renato Visoni SOL 137372 
        //Mudei o UPDATE de lugar pois quando o participante tinha mais que 1 pessoa no grupo familiar ele nao gerava contribuicao
        //pois a ultmespreparo ja tinha sido alterado.
        if ListaSQL.Count > 0 then begin
          for i:=0 to ListaSQL.Count-1 do begin
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.Add(ListaSQL[i]);
            qryAux2.ExecSQL;
          end;
        end;

        FreeAndNil(ListaSQL);
        //Renato Visoni SOL 137372

        if bCommitParcial then
        begin
          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
            dtmBaseDados.dbBaseDados.Commit;

            //Jéssica Lana SOL 109421 KINTANA 4896332
            //memResult.lines.SaveToFile('c:\preparofolha.txt');
            memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

            //BRUNO AZEVEDO SOL 140974 KINTANA 889580
            try
               memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
            except
            end;   

          end;
        end;

      Mensagem.Caption:='Término do Preparo ...';
      Mensagem.Update;

      tFim:=now;

      memResult.Lines.Add('Quantidade Total de Benefícios Processados: '+inttostr(iBenefProcTotal));
      if iContribProcTotal > 0 then
        memResult.Lines.Add('Quantidade Total de Contribuições Processadas: '+inttostr(iContribProcTotal));

      if iBenefRetidoTotal > 0 then
      begin
        memresult.lines.add('Quantidade Total de Benefícios Retidos: '+inttostr(iBenefRetidoTotal));
        if iContribRetidoTotal > 0 then
          memresult.lines.add('Quantidade de Contribuições (para benefícios retidos): '+inttostr(iContribRetidoTotal));
      end;
      
      if iBenefAbonoTotal > 0 then
        memresult.lines.add('Quantidade Total de Abonos de Benefício por Encerramento: '+inttostr(iBenefAbonoTotal));
      if iContribAbonoTotal > 0 then
        memresult.lines.add('Quantidade Total de Contribuições s/ Abono por Encerramento: '+inttostr(iContribAbonoTotal));
      if iBenefDevAbonoTotal > 0 then
        memresult.lines.add('Quantidade Total de Devolução Abonos de Benefício: '+inttostr(iBenefDevAbonoTotal));
      if iContribDevAbonoTotal > 0 then
        memresult.lines.add('Quantidade Total de Devolução de Contribuições s/ Abono: '+inttostr(iContribDevAbonoTotal));
      
      if iBenefErroTotal > 0 then
      begin
        memresult.lines.add('Quantidade Total de Benefícios não processados por erro ou valor zero: '+inttostr(iBenefErroTotal));
      end;
      
      memResult.Lines.Add('');
      memResult.Lines.Add('Tempo de Processamento Total: '+formatdatetime('hh:nn:ss',tFim-tInicio));

      MsgDlg('Término do Preparo de Benefícios.','Informação',mtInformation,[mbOk,mbHelp],0);
      pgcOpcoes.ActivePage:=tbsResultado;
      btnCommit.visible:=not bCommitParcial;
    end
    else
      MsgDlg('Nada a ser processado com a seleção escolhida.','Informação',mtInformation,[mbOk,mbHelp],0);

  finally
    bbtnOutro.visible:=true;
    bbtnSavlar.visible:=true; 
    enabled:=true;
    tag:=0;
    PnlProgress.Visible:=False;
    PnlProgress.SendToBack;
    TiraSQL(dtmFolha.qryAux);

     //Jéssica Lana SOL 109421 KINTANA 4896332
     //memResult.lines.SaveToFile('c:\preparofolha.txt');
     memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

     //BRUNO AZEVEDO SOL 140974 KINTANA 889580
     try
        memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
     except
     end;
  end;
end; //bbtnPreparoClick
// SOL 197395 - KTN 1890667
{function TfrmPreparo.ReajustaBeneficioMensal(var dValorReal : Double;
                                             dValorCotas : Double):boolean;
 var sSQLRegra : string;
     dVal,
     dIndice : Double;
begin
  Result:=false;
  with qryPrinc do
  begin
    // Recalcula o valor do beneficio a ser pago
    sIdRegraCalculo:='';
    if Trim(fieldbyname('IDREGRAREAJBENEF').asstring) = '' then
    begin
      if not PegaIndiceData(fieldbyname('INDICEREAJBENEF').AsInteger,sDataRef,dIndice) then
        dIndice:=1;
      if dIndice<0.0000000001 then
        dIndice:=1;
      dValorReal:=dValorCotas*dIndice;
      sValorAtualBenef:=FloatToStr(dValorReal);
      Result:=true;
      exit;
    end;
    sValorAtualBenef:=Oranumero(floattostr(dValorCotas));
    sValorReserva:='0';
    sSALPART:='0';
    sREMTOTAL:='0';
    iTotalBeneficiarios:=0;
    sDataInscFund:='';
    sSQLRegra:=' SELECT DISTINCT PP.IDPESSOA, 0 AS FLGDEVOLUCAO, PP.IDPESSJUR,PP.IDPLANOPREV, PP.INSCRICAODATA,'+_clinefeed+
                 ' '''+sDataInscFund+''' AS INSCRICAODATAFUND, PF.DATANASC,EL.SALTOTAL,'+_clinefeed+
                 ' '+ValStr(fieldbyname('ValorInfINSS').AsFloat,17,2,false,'.')+' VALINSS,'+_clinefeed+
                 ' EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+_clinefeed+
                 sSALPART+' AS VALORPROVENTO, '+sREMTOTAL+' AS VALORREMTOTAL,'+_clinefeed+
                 ' BPL.VALORBASE1,BPL.VALORBASE2,BPL.VALORBASE3,'+_clinefeed+
                 ' SF.TIPOSIT,SF.IDSITFUNC, PP.IDSITPART, '+sValorReserva+' AS VALORRESERVA,'+_clinefeed+
                 ' '''+fieldbyname('DATAINICIOFUND').asstring+''' DATAINICIOFUND, '+_clinefeed+
                 ' '''+fieldbyname('DATAINICIO').asstring+''' DATAINICIO, '+_clinefeed+
                 ' '''+PegaDataFinal+''''+ ' AS DATAFINAL, '+_clinefeed+
                 ' '''+sDataRef+''' AS DATAREF, '+IntToStr(iTotalBeneficiarios) + ' AS NUMBENEF,'+_clinefeed+
                 ' '''+sMesReferencia+''' AS MESREFERENCIA, '+_clinefeed+
                 oranumero(sValorAtualBenef)+' AS VLBENEFPGTO,'+_clinefeed+
                 oranumero(sValorAtualBenef)+' AS VALORATUAL, '+_clinefeed+
                 oranumero(sValorAtualBenef)+' AS VALORCOTAS, '+_clinefeed+
                 fieldbyname('INDICEREAJBENEF').asstring+' AS INDICEREAJBENEF '+_clinefeed+
                 ' FROM PESSOAFISICA PF, SITFUNC SF, ELEGPATRO EL, '+_clinefeed+
                       'PARTPREVPLAN PP, BENEFPLANOPART BPL, PATRO PAT '+_clinefeed+
                 ' WHERE (PP.IDPESSJUR = '+ fieldbyname('IdPessJur').asstring + ')'+_clinefeed+
                 'AND (EL.IDPESSJUR = PAT.IDPESSOA) '+_clinefeed+
                 'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+_clinefeed+
                 ' AND (PP.IDPESSOA = '+ fieldbyname('IdTitular').asstring + ')'+_clinefeed+
                 ' AND (PP.IDPLANOPREV = '+ fieldbyname('IdPlanoPrev').asstring + ')'+_clinefeed+
                 ' AND (PP.SEQPROPOSTA = '+ fieldbyname('SEQPROPOSTA').asstring + ')'+_clinefeed+
                 ' AND (EL.IDPESSOA = '+ fieldbyname('IdTitular').asstring + ')'+_clinefeed+
                 ' AND (EL.IDPESSJUR = '+ fieldbyname('IdPessJur').asstring + ')'+_clinefeed+
                 ' AND (SF.IDSITFUNC = EL.IDSITFUNC)'+_clinefeed+
                 ' AND (PF.IDPESSOA = '+ fieldbyname('IdPessoa').asstring + ')'+_clinefeed+
                 ' AND (BPL.IDPESSJUR = '+fieldbyname('IDPESSJUR').asstring + ')'+_clinefeed+
                 ' AND (BPL.IDPLANOPREV = '+fieldbyname('IDPLANOPREV').asstring + ')'+_clinefeed+
                 ' AND (BPL.IDPESSOA = '+fieldbyname('IDPESSOA').asstring + ')'+_clinefeed+
                 ' AND (BPL.SEQPROPOSTA = '+fieldbyname('SEQPROPOSTA').asstring + ')'+_clinefeed+
                 ' AND (BPL.IDBENEFICIO = '+fieldbyname('IDBENEFICIO').asstring + ')'+_clinefeed;

    sValorAtualBenef:=RegraNumerica(fieldbyname('IDREGRAREAJBENEF').asstring,
      sSQLRegra,bErroRegra,iIdCalculoGeral);
    
    if bErroRegra then
    begin
      memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(qryPrinc.fieldbyname('IDREGRAREAJBENEF').AsInteger));
      memResult.Lines.Add('Beneficiário: ' + fieldbyname('Nome').asstring);
      memResult.Lines.Add('Benefício: ' + fieldbyname('Beneficio').asstring);
      memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
      memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
      exit;
    end;

    try
      dVal:=strtofloat(ClienteNumero(sValorAtualBenef));
    except
      memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(qryPrinc.fieldbyname('IDREGRAREAJBENEF').AsInteger));
      memResult.Lines.Add('Beneficiário: ' + fieldbyname('Nome').asstring);
      memResult.Lines.Add('Benefício: ' + fieldbyname('Beneficio').asstring);
      memResult.Lines.Add('Patrocinadora : '+sUltIdPessJur);
      memResult.Lines.Add('Titular : '+inttostr(qryPrinc.fieldbyname('idtitular').AsInteger));
      dVal:=0;
      exit;
    end;
    Result:=true;
  end;
end;  }
// SOL 197395 - KTN 1890667
procedure TfrmPreparo.PnlPatrocinadoraClick(Sender: TObject);
 var i: integer;
begin
  inherited;
  for i:=0 to chklstPatro.Items.Count-1 do
  begin
    if PnlPatrocinadora.BevelInner = bvRaised then
      chklstPatro.Checked[i]:=True
    else
      chklstPatro.Checked[i]:=False;
  end;

  if PnlPatrocinadora.BevelInner = bvRaised then
    PnlPatrocinadora.BevelInner:=bvLowered
  else
    PnlPatrocinadora.BevelInner:=bvRaised;
end;

procedure TfrmPreparo.PnlPlanoClick(Sender: TObject);
 var i : integer;
begin
  inherited;

  for i:=0 to chklstPlano.Items.Count-1 do
  begin
    if PnlPlano.BevelInner = bvRaised then
      chklstPlano.Checked[i]:=True
    else
      chklstPlano.Checked[i]:=False;
  end;

  if PnlPlano.BevelInner = bvRaised then
    PnlPlano.BevelInner:=bvLowered
  else
    PnlPlano.BevelInner:=bvRaised;
end;

procedure TfrmPreparo.PnlBeneficioClick(Sender: TObject);
 var i : integer;
begin
  inherited;
  for i:=0 to chklstbenef.Items.Count-1 do
  begin
    if PnlBeneficio.BevelInner = bvRaised then
      chklstBenef.Checked[i]:=True
    else
      chklstBenef.Checked[i]:=False;
  end;

  if PnlBeneficio.BevelInner = bvRaised then
    PnlBeneficio.BevelInner:=bvLowered
  else
    PnlBeneficio.BevelInner:=bvRaised;
end;

//Fazer o envio da contribuicao para tmpdesc para beneficios ativos.
//Rotina extraida da UContribuicaoPrev e otimizada para apenas casos de assistidos.
function TfrmPreparo.EnviaContribuicao(qryAux: TwwQuery; arcontrib: real;
  aiidplanoprev, aiidcontribuicao,
  aiidtitular, 
  plOrdem, plNumRecebimento: longint;
  iAcaoJud: Integer;
  aicobdevol: integer; //0-cobrança, 1-devolução
  sRubDevAdiant13: String = '-1';
  aiidmotivo: integer = 0 
  ): boolean;
var
    liidplanoprev, liidcontribuicao: integer; 
    sSQLFields,        sSQLValues,
    sIdRubrica,
    sRecPag,
    sCodTipRecDes,
    sPlaContaC,
    sCodCentroCustoC,
    sUnidNegoc,
    sCodCentroRespon,
    sCodSubConta       : string;
    iControle          : Integer;
    lidseq: integer; 
    lstiporub: string; 
begin
  result:=false;
  if aiidplanoprev = 0 then
    liidplanoprev:=qryAux.fieldbyname('IDPLANOPREV').asinteger
  else
    liidplanoprev:=aiidplanoprev;

  if aiidcontribuicao = 0 then
    liidcontribuicao:=qryAux.fieldbyname('idcontribuicao').asinteger
  else
    liidcontribuicao:=aiidcontribuicao;

  iControle := 0;
  
  If StrToInt(sRubDevAdiant13) <= 0 Then
    If (iControle = iAcaoJud) or (RdgTpFolha.itemindex = 2) then //NÃO ABRIR RUBRICAS QUANDO EM AÇÃO JUDICIAL EM LIMINAR
    begin
      // Rubricas Normais
      if Copy(qryAux.fieldbyname('MesReferencia').AsString,6,2) = '13' then 
      begin
        sIdRubrica:=qryAux.fieldbyname('IDRUBDECTERC').AsString; 
        If (qryAux.fieldbyname('FLGPROVISORIO').asInteger = 1) or 
           (RdgTpFolha.itemindex = 2) and 
           (not qryAux.fieldbyname('IDRUBADIANT13').isnull) then  
          sIdRubrica:=qryAux.fieldbyname('IDRUBADIANT13').AsString;  
      end
      else
      begin
        sIdRubrica:=qryAux.fieldbyname('IDRUBRICA').AsString;  
        If (qryAux.fieldbyname('FLGPROVISORIO').asInteger = 1) and  
           (not qryAux.fieldbyname('IDRUBADIANT').isnull) then  
          sIdRubrica:=qryAux.fieldbyname('IDRUBADIANT').AsString;  
      end;
    End
    else
    begin
      // Rubricas de Ação Judicial
      if Copy(qryAux.fieldbyname('MesReferencia').AsString,6,2) = '13' then  
      begin
        sIdRubrica:=qryAux.fieldbyname('IDRUB13ACJUD').AsString;  
        If (qryAux.fieldbyname('FLGPROVISORIO').asInteger = 1) and 
           (not qryAux.fieldbyname('IDRUB13DESCACJUD').isnull) then  
           sIdRubrica:=qryAux.fieldbyname('IDRUB13DESCACJUD').AsString;  
      end
      else
      begin
        sIdRubrica:=Inttostr(qryAux.fieldbyname('IDRUBACJUD').AsInteger);  
        If (qryAux.fieldbyname('FLGPROVISORIO').asInteger = 1) and  
           (not qryAux.fieldbyname('IDRUBDADACJUD').isnull) then  
           sIdRubrica:=qryAux.fieldbyname('IDRUBDADACJUD').AsString;  
      end
    End
  Else
    sIdRubrica := sRubDevAdiant13;

  // não grava na tmpdesc sem código de rubrica
  if sIdRubrica = '' then
    exit;

  // Gravar contribuicao na tabela tmpDesc
  sSQLFields:=' FLGATRASODEVOL, FLGDESCFOLHA, FLGDESCONTO, FLGTIPODESC, '+
               'SEQPROPOSTA, IDDESCONTO, IDFUNDACAO, IDMOTIVO, IDPESSJUR, '+
               'IDPESSOA, IDPLANOPREV, IDPROVENTO, IDTITULAR, '+
               'MESCOBRANCA, MESREFERENCIA, NUMPRIORIDADE, ORDEM, '+
               'SISTORIGEM, IDMODULO, PLACONTAC, PLANO, UNIDNEGOC, '+
               'CODTIPRECDES, RECPAG, DATAREFERENCIA, CODCENTROCUSTOC, '+
               'CODCENTRORESPON, CODSUBCONTA, IDEMPRESA, DATACOBRANCA, '+
               'NODOCUMENTO, COMPLDOCUMENTO, IDLOTE, FLGEXISTEHST, SITENVIO, '+
               'IDSEQINTERNOFB, '+ 
               'IDTMPDESC, '+
               'VALOR, DESCRICAO, REFERENCIA, '+
               'NUMRECEBIMENTO '; 

    if qryContaContrib.Locate('IDPESSJUR;IDPLANOPREV;IDCONTRIBUICAO',
       vararrayof([qryAux.fieldbyname('idpessjur').asinteger,
                   liidplanoprev, liidcontribuicao]),
       [loPartialKey]) then
    begin
      if Copy(qryAux.fieldbyname('MesReferencia').AsString,6,2) = '13' then
      begin
        sPlaContaC      :=trim(qryContaContrib.fieldbyname('PLACONTAC13').asstring);
        sCodCentroCustoC:=trim(qryContaContrib.fieldbyname('CODCENTROCUSTOC13').asstring);
        sUnidNegoc      :=trim(qryContaContrib.fieldbyname('UNIDNEGOC13').asstring);
        sCodCentroRespon:=trim(qryContaContrib.fieldbyname('CODCENTRORESPON13').asstring);
        sCodSubConta    :=trim(qryContaContrib.fieldbyname('CODSUBCONTA13').asstring);
      end
      else
      begin
        sPlaContaC      :=trim(qryContaContrib.fieldbyname('PLACONTAC').asstring);
        sCodCentroCustoC:=trim(qryContaContrib.fieldbyname('CODCENTROCUSTOC').asstring);
        sUnidNegoc      :=trim(qryContaContrib.fieldbyname('UNIDNEGOC').asstring);
        sCodCentroRespon:=trim(qryContaContrib.fieldbyname('CODCENTRORESPON').asstring);
        sCodSubConta    :=trim(qryContaContrib.fieldbyname('CODSUBCONTA').asstring);
      end;
      sRecPag      :=trim(qryContaContrib.fieldbyname('RECPAGDEVOL').asstring);
      sCodTipRecDes:=trim(qryContaContrib.fieldbyname('CODTIPDESEMBCAR').asstring);
      if sPlaContaC = '' then
        sPlaContaC:='NULL'
      else
        sPlaContaC:=QuotedStr(sPlaContaC);
      if sCodCentroCustoC = '' then
        sCodCentroCustoC:='NULL'
      else
        sCodCentroCustoC:=QuotedStr(sCodCentroCustoC);
      if sUnidNegoc = '' then
        sUnidNegoc:=IntToStr(prmUnidNegoc);
      if sCodCentroRespon = '' then
        sCodCentroRespon:='NULL'
      else
        sCodCentroRespon:=QuotedStr(sCodCentroRespon);
      if sCodSubConta = '' then
        sCodSubConta:='NULL';
      if sRecPag = '' then
        sRecPag:='NULL'
      else
        sRecPag:=QuotedStr(sRecPag);
      if sCodTipRecDes = '' then
        sCodTipRecDes:='NULL'
      else
        sCodTipRecDes:=QuotedStr(sCodTipRecDes);
    end
    else
    begin
      sPlaContaC      :='NULL';
      sCodCentroCustoC:='NULL';
      sUnidNegoc      :='NULL';
      sCodCentroRespon:='NULL';
      sCodSubConta    :='NULL';
      sRecPag         :='NULL';
      sCodTipRecDes   :='NULL';
    end;

    try
      //FLGATRASODEVOL
      if aicobdevol = 0 then
      begin
        if (copy(qryAux.fieldbyname('MesReferencia').AsString,6,2) = '13') then
        begin
          if (copy(qryAux.fieldbyname('MesReferencia').AsString,1,4) =
              copy(qryAux.fieldbyname('MesCobranca').AsString,1,4)) then
            lstiporub:='N'
          else
            lstiporub:='A';
        end
        else
        begin
          if (qryAux.fieldbyname('MesReferencia').AsString =
              qryAux.fieldbyname('MesCobranca').AsString) then
            lstiporub:='N'
          else
            lstiporub:='A';
        end;
      end
      else
        lstiporub:='D';
      sSQLValues:=sSQLValues+quotedstr(lstiporub);
      // ** Preenchendo FLGDESCFOLHA
      sSQLValues:=sSQLValues+', ''B''';
      // ** Preenchendo FLGDESCONTO
      if (lstiporub = 'D') then
        sSQLValues:=sSQLValues+', 0'
      else
        sSQLValues:=sSQLValues+', 1';
      // ** Preenchendo FLGTIPODESC
      sSQLValues:=sSQLValues +', ''P''';
      // ** Preenchendo chaves
      sSQLValues:=sSQLValues +', '+qryAux.fieldbyname('SeqProposta').AsString;   // SEQPROPOSTA

      sSQLValues:=sSQLValues +', '+inttostr(liidcontribuicao);// IDDESCONTO
      sSQLValues:=sSQLValues +', '+inttostr(iIdFundacao);                                   // IDFUNDACAO

      if aiidmotivo > 0 then
        sSQLValues:=sSQLValues +', '+IntToStr(aiidmotivo)
      else
      begin
        if RdgTpFolha.ItemIndex <> 0 then
          sSQLValues:=sSQLValues +', '+IntToStr(prmIdMotivoAbono)
        else
          sSQLValues:=sSQLValues +', '+IntToStr(prmIDMOTIVOFOLHABEN);
      end;

      sSQLValues:=sSQLValues +', '+qryAux.fieldbyname('IdPessJur').AsString;     // IDPESSJUR
      sSQLValues:=sSQLValues +', '+qryAux.fieldbyname('IdPessoa').AsString;      // IDPESSOA

      sSQLValues:=sSQLValues +', '+inttostr(liidplanoprev);   // IDPLANOPREV
      // ** Código da rubrica ( IDPROVENTO )
      sSQLValues:=sSQLValues +', '+sIdRubrica;
      // ** IDTITULAR
      // ENVIO PARA TMPDESC DAS CONTRIBUIÇÕES DE PENSIONISTA
      If StrToInt(sRubDevAdiant13) > 0 Then
      begin
        sSQLValues:=sSQLValues +', '+inttostr(aiidtitular);
      End
      Else
        sSQLValues:=sSQLValues +', '+qryAux.fieldbyname('IdTITULAR').AsString;

      // ** MESCOBRANCA E MESREFERENCIA
      If StrToInt(sRubDevAdiant13) > 0 Then
        sSQLValues := sSQLValues +', '+QuotedStr(sMesReferencia)
      Else
        sSQLValues := sSQLValues +', '''+qryAux.fieldbyname('MesCobranca').AsString+'''';

      sSQLValues := sSQLValues +', '''+qryAux.fieldbyname('MESREFERENCIA').AsString+'''';
      // ** NUMPRIORIDADE, ORDEM e SISTORIGEM
      sSQLValues:=sSQLValues+', NULL ';
      sSQLValues:=sSQLValues +', '+IntToStr(plOrdem);
      sSQLValues:=sSQLValues +', '+IntToStr(Sistema.IdModulo);
      sSQLValues:=sSQLValues +', '+IntToStr(Sistema.IdModulo);
      // ** PLACONTAC
      sSQLValues:=sSQLValues +', '+sPlaContaC;
      // ** PLANO DE CONTAS
      sSQLValues := sSQLValues+', '+IntToStr(IntegraBack.Plano);
      // ** UNIDNEGOC
      sSQLValues := sSQLValues+', '+sUNIDNEGOC;
      // ** CodTipRecDes
      sSQLValues:=sSQLValues+', '+sCodTipRecDes;
      // ** RecPag
      sSQLValues:=sSQLValues+', '+sRecPag;
      // ** DATAREFERENCIA
      sSQLValues:=sSQLValues+', TO_DATE('''+formatdatetime('dd/mm/yyyy',
         qryAux.fieldbyname('DATACOBRANCA').AsDateTime)+''',''dd/mm/yyyy'') ';
      // ** CODCENTROCUSTOC
      sSQLValues:=sSQLValues+', '+sCODCENTROCUSTOC;
      // ** CODCENTRORESPON
      sSQLValues:=sSQLValues+', '+sCODCENTRORESPON;
      // ** CODSUBCONTA
      sSQLValues:=sSQLValues+', '+sCODSUBCONTA;
      // ** IDEMPRESA
      sSQLValues:=sSQLValues+', '+IntToStr(iIdFundacao);
      // ** DATACOBRANCA
      sSQLValues:=sSQLValues+', TO_DATE('''+formatdatetime('dd/mm/yyyy',
         qryAux.fieldbyname('DATACOBRANCA').AsDateTime)+''',''dd/mm/yyyy'') ';
      // ** Preenchendo NoDocumento
      sSQLValues:=sSQLValues+', '+inttostr(plNumRecebimento);
      // ** Preenchendo COMPLDOCUMENTO
      sSQLValues:=sSQLValues+', '''+Copy(qryAux.fieldbyname('MesReferencia').AsString,6,2)+'''';
      // ** Preenchendo IDLOTE
      sSQLValues:=sSQLValues+', '+IntToStr(iIdLote);
      // ** Preenchendo FLGEXISTEHST
      sSQLValues:=sSQLValues+', 1';
      // ** Preenchendo SITENVIO
      sSQLValues:=sSQLValues+', ''0''';
      
      lidseq:=LeUltRegistro(nil,'SEQINTERNOFB');
      sSQLValues:=sSQLValues+', '+inttostr(lidseq);

      sSQLValues := sSQLValues + ', ' + IntToStr(LeUltRegistro(Nil, 'TMPDESC'));

      // ** Preenchendo VALOR
      sSQLValues:=sSQLValues+', '+OraNumero(floattostr(arcontrib));
      // ** Preenchendo DESCRICAO
      sSQLValues:=sSQLValues+', '''+'Contribuição de Assistido'+'''' ;
      // ** Preenchendo REFERENCIA
      sSQLValues:=sSQLValues+', ''CONTRIB''';

      //Gravar o número do recebimento da HstContribPrev
      sSqlValues := sSqlValues + ', ' + IntToStr(plNumRecebimento);

      dtmAPrev.qry.Close;
      dtmAPrev.qry.SQL.Clear;
      dtmAPrev.qry.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLValues+')');
      dtmAPrev.qry.ExecSQL;
    except
      on E:Exception do
      begin
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        result:=false;
        exit;
      end;
    end;
    result:=true;
end; //EnviaContribuicao

procedure TfrmPreparo.GravaContribuicao(arcontrib, arperccalc: real; bpensao: boolean);
 var sSQLValues : string;
     llnumrec : longint;
     E,R  : Integer;
     arContribNova : Real;
     liidmotivo: integer; 
begin
  if arcontrib <= 0 then
  begin
    inc(lcontZERO);
    Exit;
  end;

  // Inserir valor final na HSTCONTRIBPREV
  with qryPreparoContrib do
  begin
    sSQLValues:=''''+fieldbyname('MesReferencia').asstring+''''; // MESREFERENCIA
    sSQLValues:=sSQLValues+','''+fieldbyname('MesCobranca').asstring+'''';
    llnumrec:=LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');
    sSQLValues:=sSQLValues+',' +IntToStr(llnumrec);

    if (RdgTpFolha.ItemIndex <> 0) or
       (copy(fieldbyname('MesReferencia').asstring,6,2) = '13') then
      liidmotivo:=prmIdMotivoAbono
    else
      liidmotivo:=prmIDMOTIVOFOLHABEN;
    sSQLValues:=sSQLValues +', '+IntToStr(liidmotivo);
    
    if (Trim(fieldbyname('CodPortForma').asstring) <> '') and
       (fieldbyname('CodPortForma').AsInteger > 0) then
      sSQLValues:=sSQLValues+', ' +fieldbyname('CodPortForma').asstring
    else
      sSQLValues:=sSQLValues+', NULL ';

    try
      if qryPreparoContrib.fieldbyname('DATACOBRANCA').asdatetime > 0 then
        sSQLValues:=sSQLValues+', TO_DATE('+
          quotedstr(formatdatetime('dd/mm/yyyy',
            qryPreparoContrib.fieldbyname('DATACOBRANCA').asdatetime))+',''DD/MM/YYYY'') '
      else
        sSQLValues:=sSQLValues+', NULL ';
    except
      sSQLValues:=sSQLValues+', NULL ';
    end;

    sSQLValues:=sSQLValues+', '+OraNumero(floattostr(arcontrib)); //VALORESPERADO
    sSQLValues:=sSQLValues+', '+OraNumero(floattostr(arcontrib)); //VALORCALCULADO
    if regPreparoContrib.RuleName <> '' then
      sSQLValues:=sSQLValues+', '+regPreparoContrib.RuleName
    else
      sSQLValues:=sSQLValues+', NULL';

    sSQLValues:=sSQLValues+', '+OraNumero(floattostr(arperccalc));

    sSQLValues:=sSQLValues+', 1'; // flgdescfolha
    sSQLValues:=sSQLValues+', '+IntToStr(fieldbyname('IdPessoa').AsInteger);
    sSQLValues:=sSQLValues+', '+IntToStr(fieldbyname('SeqProposta').AsInteger);
    sSQLValues:=sSQLValues+', '+IntToStr(fieldbyname('IdPessJur').AsInteger);
    sSQLValues:=sSQLValues+', '+IntToStr(fieldbyname('IdPlanoPrev').AsInteger);
    sSQLValues:=sSQLValues+', '+IntToStr(fieldbyname('IdContribuicao').AsInteger);
    sSQLValues:=sSQLValues+', 0'; //FLGCALCRESERVA
    if Trim(fieldbyname('ValorBase1').asstring) <> '' then
      sSQLValues:=sSQLValues+', '+OraNumero(fieldbyname('ValorBase1').asstring)
    else
      sSQLValues:=sSQLValues+', NULL ';

    if Trim(fieldbyname('ValorBase2').asstring) <> '' then
      sSQLValues:=sSQLValues+', '+OraNumero(fieldbyname('ValorBase2').asstring)
    else
      sSQLValues:=sSQLValues+', NULL ';

    if Trim(fieldbyname('ValorBase3').asstring) <> '' then
      sSQLValues:=sSQLValues+', '+OraNumero(fieldbyname('ValorBase3').asstring)
    else
      sSQLValues:=sSQLValues+', NULL ';

    try
      if qryPreparoContrib.fieldbyname('DATAINICIO').asdatetime > 0 then
        sSQLValues:=sSQLValues+', TO_DATE('+
          quotedstr(formatdatetime('dd/mm/yyyy',
            qryPreparoContrib.fieldbyname('DATAINICIO').asdatetime))+',''DD/MM/YYYY'') '
      else
        sSQLValues:=sSQLValues+', NULL ';
    except
      sSQLValues:=sSQLValues+', NULL ';
    end;

    try
      if qryPreparoContrib.fieldbyname('DATAFINAL').asdatetime > 0 then
        sSQLValues:=sSQLValues+', TO_DATE('+
          quotedstr(formatdatetime('dd/mm/yyyy',
            qryPreparoContrib.fieldbyname('DATAFINAL').asdatetime))+',''DD/MM/YYYY'') '
      else
        sSQLValues:=sSQLValues+', NULL ';
    except
      sSQLValues:=sSQLValues+', NULL ';
    end;

    sSQLValues:=sSQLValues+', ''AS''';             // FLGSITFUNDACAO

    if (uppercase(sIdLoteGravado) = 'NULL') or (sPagador = 'P') then
      sSQLValues:=sSQLValues+',0 '
    else
      sSQLValues:=sSQLValues+',1 ';

    sSQLValues:=sSQLValues+', ''F''';              // TIPO
    sSQLValues:=sSQLValues+', '+sIdLoteGravado;    // Lote gravado no beneficio. É nulo para retidos
    sSQLValues:=sSQLValues+', 0';                  // PARCELA
    sSQLValues:=sSQLValues+', NULL';               // VALORECEBIDO
    sSQLValues:=sSQLValues+', NULL';               // DATARECEBIMENTO
    sSQLValues:=sSQLValues +', 0 ';                // FLGCONCESSAO
    sSQLValues:=sSQLValues +', 0 ';                // FLGEVENTO

    sSQLValues:=sSQLValues +', ''B''';             // FOLHAORIGEM

    sSQLValues:=sSQLValues +', SYSDATE ';          // DATAEMISSCOB
    sSQLValues:=sSQLValues +', NULL ';             // FLGINTEVENTO

    sSQLValues := sSQLValues + ','+ RetornaIdTitular(fieldbyname('IdPessoa').AsString,fieldbyname('IdPlanoPrev').AsString);
  end;

  //Henrique SOl 108902

  with dtmFolha.qryAux do
  begin
    close;
    SQL.Clear;
    SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,'+
            ' NUMRECEBIMENTO,IDMOTIVO,CODPORTFORMA,DATAPREVISAORECE,'+
            ' VALORESPERADO,VALORCALCULADO,IDREGRACALCULO,PERCCALCULO, '+
            ' FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV, '+
            ' IDCONTRIBUICAO,FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO, '+
            ' DATAFINAL,FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA, '+
            ' VALORRECEBIDO, DATARECEBIMENTO, FLGCONCESSAO, FLGEVENTO, '+
            ' FOLHAORIGEM,'+
            ' DATAEMISSCOB, FLGINTEVENTO, IDTITULAR ) '+
            ' VALUES('+sSQLValues+')');
    try
      ExecSQL;

      if (copy(qryPreparoContrib.fieldbyname('MesReferencia').asstring,6,2) <> '13') then
        iContribProc:=iContribProc+1
      else
        iContribAbono:=iContribAbono+1;

      //TRATAR CÁLCULO DE CONTRIBUIÇÃO ASSOCIADA
      lstContribuicao.InsereLista(
        qryPreparoContrib.fieldbyname('IdContribuicao').AsInteger,
        qryPreparoContrib.fieldbyname('ValorBase1').asfloat,
        qryPreparoContrib.fieldbyname('ValorBase2').asfloat,
        qryPreparoContrib.fieldbyname('ValorBase3').asfloat, arcontrib);

      //Fazer o envio da contribuicao para tmpdesc para beneficios ativos.
      if (uppercase(sIdLoteGravado) <> 'NULL') AND ((sPagador = 'C') or (sPagador = 'N')) then 
      begin
        try
          inc(lordem);
          if not EnviaContribuicao(qryPreparoContrib, arcontrib,
                   0, 0,
                   0, 
                   lordem, llnumrec, 0,
                   0,
                   '-1', liidmotivo 
                   ) then
            memResult.Lines.Add(' Matrícula : '+sUltMatricula+
              ' Erro ao enviar contribuicao para Tmpdesc.');
        except
          memResult.Lines.Add(' Matrícula : '+sUltMatricula+
            ' Erro ao enviar contribuicao para Tmpdesc.');
        end;
      end;

      // atualiza o último mes preparo
      if ((RdgTpFolha.ItemIndex = 0) or (RdgTpFolha.ItemIndex = 3))and
         (copy(qryPreparoContrib.fieldbyname('MesReferencia').asstring,6,2) <> '13') then 
      begin
        qryAux2.Close;
        qryAux2.SQL.Clear;

	//controle por nucleo familiar

        //Renato Visoni SOL 137372
        if not bpensao then begin
          qryAux2.SQL.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+qryPreparoContrib.fieldbyname('MesCobranca').asstring+''''+_clinefeed+
                          ' WHERE  (IDPESSJUR      = '+IntToStr(qryPreparoContrib.fieldbyname('IdPessjur').AsInteger)+')'+_clinefeed+
                          ' AND    (IDPLANOPREV    = '+IntToStr(qryPreparoContrib.fieldbyname('IdPlanoPrev').AsInteger)+')'+_clinefeed+
                          ' AND    (IDPESSOA       = '+IntToStr(qryPreparoContrib.fieldbyname('IdPessoa').AsInteger)+')'+_clinefeed+
                          ' AND    (SEQPROPOSTA    = '+IntToStr(qryPreparoContrib.fieldbyname('SeqProposta').AsInteger)+')'+_clinefeed+
                          ' AND    (IDCONTRIBUICAO = '+IntToStr(qryPreparoContrib.fieldbyname('IdContribuicao').AsInteger)+')'+_clinefeed);
          try
            qryAux2.ExecSQL;
          except
            on E:Exception do
            begin
              memResult.Lines.Add(' Matrícula : '+
                sUltMatricula+
                ' Erro ao atualizar o último mês preparo. ');
              memResult.Lines.Add('Mensagem de erro : '+E.Message);
              exit;
            end;
          end;

        end else begin
          //qryAux2.SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET ULTMESPREPARO = '''+qryPreparoContrib.fieldbyname('MesCobranca').asstring+''''+_clinefeed+
          //                ' WHERE  (IDNUCLEOFAMILIAR = '+IntToStr(iNucleoFamiliar)+')'+_clinefeed+
          //                ' AND    (IDCONTRIBUICAO   = '+IntToStr(qryPreparoContrib.fieldbyname('IdContribuicao').AsInteger)+')'+_clinefeed);
         ListaSQL.Add(' UPDATE CONTRIBPREVNUCLEO SET ULTMESPREPARO = '''+qryPreparoContrib.fieldbyname('MesCobranca').asstring+''''+_clinefeed+' WHERE  (IDNUCLEOFAMILIAR = '+IntToStr(iNucleoFamiliar)+')'+_clinefeed+
                      ' AND    (IDCONTRIBUICAO   = '+IntToStr(qryPreparoContrib.fieldbyname('IdContribuicao').AsInteger)+')'+_clinefeed);

        end;
        //Renato Visoni SOL 137372


      end;
    except
      on E:Exception do
      begin
        memResult.Lines.Add(' Matrícula : '+sUltMatricula+
          ' Erro ao inserir contribuição no histórico. Mensagem:'+e.message);
        inc(lcontERRO);
        exit;
      end;
    end;
  end;
  inc(lcontOK);
end;

function TfrmPreparo.ExecutaRegraUltimoPagamento(airegra: integer;
  asnomebeneficiario, asnomebeneficio, asidpessjur: string;
  aiidtitular, aiidbeneficio: integer;
  asvaloratual, asvalorreferencia, asdataref, asvalortotal: string;
  arpercentual: real; asdatainicio, asdatafim: string; ainumbenef: integer;
  asvalorinfinss, asflgbenefmin, asidsitpart, asidsitplanoprev,
  asidsitfunc, asidplanoprev, astemposervtotal: string;
  var arvalor: double): boolean;
var liidcalculo: integer;
    lsvalor: string;
    lssql: string;
    lbErro: boolean;
begin
  result:=true;
  arvalor:=0;
  // TRATANDO SE REGRA DE ULTIMO PAGAMENTO ESTÁ PARAMETRIZADA
  // CASO NÃO ESTEJA FAZ O PRO-RATA DIA POR CALCULO
  if (airegra = 0) then
  begin
    memResult.Lines.Add('Regra de Último Pagamento não parametrizada.');
    memResult.Lines.Add('Pró-rata dia usando mês comercial.');
    memResult.Lines.Add('Beneficiário: '+asnomebeneficiario);
    memResult.Lines.Add('Benefício: '+asnomebeneficio);
    memResult.Lines.Add('Patrocinadora : '+asidpessjur);
    memResult.Lines.Add('Titular : '+inttostr(aiidtitular));
    arvalor:=ValorProRataUltimo(asvaloratual, asdataref);
  end
  else
  begin
    lssql:='SELECT '+OraNumero(asvalortotal)+ ' AS VALORTOTAL,'+_clinefeed+
           '       '+OraNumero(asvaloratual)+ ' AS VALORATUAL,'+_clinefeed+
           '       '+OraNumero(asvaloratual)+ ' AS VLBENEFPGTO,'+_clinefeed+
           '       '+OraNumero(asvalorreferencia)+ ' AS VALORREFERENCIA,'+_clinefeed+
           '       '+oranumero(formatfloat('#0.000000',arpercentual))+' AS PERCENTUAL, '+_clinefeed+
           '       '+QuotedStr(asdatainicio)+' AS DATAINICIO,'+_clinefeed+
           '       '+QuotedStr(asdatafim) +' AS DATAFINAL, '+_clinefeed+
           '       '+QuotedStr(asdataref) +' AS DATAREF, '+_clinefeed+
           '       '+inttostr(ainumbenef)+' AS NUMBENEF, '+_clinefeed+
           '       '+OraNumero(asvalorinfinss)+ ' AS VLRINFINSS, '+_clinefeed+
           '       ''AS'' FLGINTERNOANT, 0 AS FLGCONCESSAO, 1 AS TIPOPROCESSO, '+_clinefeed+
           '       '+Inttostr(Sistema.IdModulo)+ ' AS IDMODULO, '+_clinefeed+
           '       '+asflgbenefmin+' AS FLGBENEFMIN, '+_clinefeed+
           '       '+asidsitpart+' AS IDSITPARTNOVO, '+_clinefeed+
           '       '+asidsitpart+' AS IDSITPARTATUAL, '+_clinefeed+
           '       '+asidsitplanoprev+' AS IDSITPLANONOVO, '+_clinefeed+
           '       '+asidsitplanoprev+' AS IDSITPLANOATUAL, '+_clinefeed+
           '       '+asidsitfunc+' AS IDSITFUNCNOVO, '+_clinefeed+
           '       '+asidsitfunc+' AS IDSITFUNCATUAL, '+_clinefeed+
           '       '+asidplanoprev+' AS IDPLANOPREV, '+_clinefeed+
           '       '+inttostr(aiidbeneficio)+' AS IDBENEFICIO, '+_clinefeed+
           '       '+inttostr(aiidtitular)+' AS IDTITULAR, '+_clinefeed+
           '       '+inttostr(aiidtitular)+' AS IDPESSOA, '+_clinefeed+
           '       '+asidpessjur+' AS IDPESSJUR, '+_clinefeed+
           '       1 AS SEQPROPOSTA, '+
           '       '+astemposervtotal+' TEMPOSERVTOTAL FROM DUAL'+_clinefeed;
    try
      lsvalor:=RegraNumerica(inttostr(airegra), lssql, lbErro, liidcalculo);
      try
        arvalor:=StrToFLoat(ClienteNumero(lsvalor));
      except
        memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(airegra));
        memResult.Lines.Add('Beneficiário: '+asnomebeneficiario);
        memResult.Lines.Add('Benefício: '+asnomebeneficio);
        memResult.Lines.Add('Patrocinadora : '+asidpessjur);
        memResult.Lines.Add('Titular : '+inttostr(aiidtitular));
        result:=false;
      end;
    except
      memResult.Lines.Add('Erro[REGRA DE ULTIMO PAGAMENTO] - Beneficiário : '+
        asnomebeneficiario+ ' Número da Regra: '+inttostr(airegra));
      result:=false;
    end;
  end;
end;

function TfrmPreparo.ExecutaRegraPrimeiroPagamento(airegra: integer;
  asnomebeneficiario, asnomebeneficio, asidpessjur: string;
  aiidtitular, aiidbeneficio: integer;
  asvaloratual, asvalorreferencia, asdataref, asvalortotal: string;
  arpercentual: real; asdatainicio, asdatafim: string; ainumbenef: integer;
  asvalorinfinss, asflgbenefmin, asidsitpart, asidsitplanoprev,
  asidsitfunc, asidplanoprev, astemposervtotal: string;
  var arvalor: double): boolean;
var liidcalculo: integer;
    lsvalor: string;
    lssql: string;
    lbErro: boolean;
begin
  result:=true;
  arvalor:=0;
  // TRATANDO SE REGRA DE PRIMEIRO PAGAMENTO ESTÁ PARAMETRIZADA
  // CASO NÃO ESTEJA FAZ O PRO-RATA DIA POR CALCULO
  if (airegra = 0) then
  begin
    memResult.Lines.Add('Regra de Primeiro Pagamento não parametrizada.');
    memResult.Lines.Add('Pró-rata dia usando mês comercial.');
    memResult.Lines.Add('Beneficiário: '+asnomebeneficiario);
    memResult.Lines.Add('Benefício: '+asnomebeneficio);
    memResult.Lines.Add('Patrocinadora : '+asidpessjur);
    memResult.Lines.Add('Titular : '+inttostr(aiidtitular));
    arvalor:=ValorProRataPrimeiro(asvaloratual, asdataref);
  end
  else
  begin
    lssql:='SELECT '+OraNumero(asvalortotal)+ ' AS VALORTOTAL,'+_clinefeed+
           '       '+OraNumero(asvaloratual)+ ' AS VALORATUAL,'+_clinefeed+
           '       '+OraNumero(asvaloratual)+ ' AS VLBENEFPGTO,'+_clinefeed+
           '       '+OraNumero(asvalorreferencia)+ ' AS VALORREFERENCIA,'+_clinefeed+
           '       '+oranumero(formatfloat('#0.000000',arpercentual))+' AS PERCENTUAL, '+_clinefeed+
           '       '+QuotedStr(asdatainicio)+' AS DATAINICIO,'+_clinefeed+
           '       '+QuotedStr(asdatafim) +' AS DATAFINAL, '+_clinefeed+
           '       '+QuotedStr(asdataref) +' AS DATAREF, '+_clinefeed+
           '       '+inttostr(ainumbenef)+' AS NUMBENEF, '+_clinefeed+
           '       '+OraNumero(asvalorinfinss)+ ' AS VLRINFINSS, '+_clinefeed+
           '       ''AS'' FLGINTERNOANT, 0 AS FLGCONCESSAO, 1 AS TIPOPROCESSO, '+_clinefeed+
           '       '+Inttostr(Sistema.IdModulo)+ ' AS IDMODULO, '+_clinefeed+
           '       '+asflgbenefmin+' AS FLGBENEFMIN, '+_clinefeed+
           '       '+asidsitpart+' AS IDSITPARTNOVO, '+_clinefeed+
           '       '+asidsitpart+' AS IDSITPARTATUAL, '+_clinefeed+
           '       '+asidsitplanoprev+' AS IDSITPLANONOVO, '+_clinefeed+
           '       '+asidsitplanoprev+' AS IDSITPLANOATUAL, '+_clinefeed+
           '       '+asidsitfunc+' AS IDSITFUNCNOVO, '+_clinefeed+
           '       '+asidsitfunc+' AS IDSITFUNCATUAL, '+_clinefeed+
           '       '+asidplanoprev+' AS IDPLANOPREV, '+_clinefeed+
           '       '+inttostr(aiidbeneficio)+' AS IDBENEFICIO, '+_clinefeed+
           '       '+inttostr(aiidtitular)+' AS IDTITULAR, '+_clinefeed+
           '       '+inttostr(aiidtitular)+' AS IDPESSOA, '+_clinefeed+
           '       '+asidpessjur+' AS IDPESSJUR, '+_clinefeed+
           '       1 AS SEQPROPOSTA, '+
           '       '+astemposervtotal+' TEMPOSERVTOTAL FROM DUAL'+_clinefeed;
    try
      lsvalor:=RegraNumerica(inttostr(airegra), lssql, lbErro, liidcalculo);
      try
        arvalor:=StrToFLoat(ClienteNumero(lsvalor));
      except
        memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(airegra));
        memResult.Lines.Add('Beneficiário: '+asnomebeneficiario);
        memResult.Lines.Add('Benefício: '+asnomebeneficio);
        memResult.Lines.Add('Patrocinadora : '+asidpessjur);
        memResult.Lines.Add('Titular : '+inttostr(aiidtitular));
        result:=false;
      end;
    except
      memResult.Lines.Add('Erro[REGRA DE PRIMEIRO PAGAMENTO] - Beneficiário : '+
        asnomebeneficiario+ ' Número da Regra: '+inttostr(airegra));
      result:=false;
    end;
  end;
end;

function TfrmPreparo.ExecutaRegraCalculoRateio(airegra: integer;
  asnomebeneficiario, asnomebeneficio, asidpessjur: string;
  aiidtitular, aiidbeneficio: integer;
  asvaloratual, asvalorreferencia, asdataref, asvalortotal: string;
  arpercentual: real; asdatainicio, asdatafim: string; ainumbenef: integer;
  asvalorinfinss, asvalortotalinss,
  asflgbenefmin, asidsitpart, asidsitplanoprev,
  asidsitfunc, asidplanoprev, astemposervtotal: string;
  arvalorbase1, arvalorbase2, arvalorbase3: real;
  asflgcalctodomes: string; var arvalor: double): boolean;
var liidcalculo: integer;
    lsvalor: string;
    lssql: string;
    lbErro: boolean;
begin
  result:=true;
  arvalor:=0;
  // VERIFICA SE A REGRA DE CALCULO DO BENEFICIO ESTÁ PARAMETRIZADA
  // CASO NÃO ESTEJA EMITE MENSAGEM DE ERRO
  if (airegra = 0) then
  begin
    memResult.Lines.Add('Erro[REGRA DE CÁLCULO NÃO PARAMETRIZADA]');
    memResult.Lines.Add('Benefício: '+asnomebeneficio);
    memResult.Lines.Add('Beneficiário: '+asnomebeneficiario);
    result:=false;
    exit;
  end;

  lssql:='SELECT '+OraNumero(asvalortotal)+ ' AS VALORTOTAL,'+_clinefeed+
         '       '+OraNumero(asvaloratual)+ ' AS VALORATUAL,'+_clinefeed+
         '       '+OraNumero(asvaloratual)+ ' AS VLBENEFPGTO,'+_clinefeed+
         '       '+OraNumero(asvalorreferencia)+ ' AS VALORREFERENCIA,'+_clinefeed+
         '       '+oranumero(formatfloat('#0.000000',arpercentual))+' AS PERCENTUAL, '+_clinefeed+
         '       '+QuotedStr(asdatainicio)+' AS DATAINICIO,'+_clinefeed+
         '       '+QuotedStr(asdatafim) +' AS DATAFINAL, '+_clinefeed+
         '       '+QuotedStr(asdataref) +' AS DATAREF, '+_clinefeed+
         '       '+inttostr(ainumbenef)+' AS NUMBENEF, '+_clinefeed+
         '       '+OraNumero(asvalorinfinss)+ ' AS VLRINFINSS, '+_clinefeed+
         '       '+OraNumero(asvalortotalinss)+ ' AS VLRTOTALINSS, '+_clinefeed+
         '       '+oranumero(formatfloat('#0.000000',arvalorbase1))+' AS VALORBASE1, '+_clinefeed+
         '       '+oranumero(formatfloat('#0.000000',arvalorbase2))+' AS VALORBASE2, '+_clinefeed+
         '       '+oranumero(formatfloat('#0.000000',arvalorbase3))+' AS VALORBASE3, '+_clinefeed+
         '       '+asflgcalctodomes+' AS FLGBENEFCOTAS, '+_clinefeed+
         '       ''AS'' FLGINTERNOANT, 0 AS FLGCONCESSAO, 1 AS TIPOPROCESSO, '+_clinefeed+
         '       '+Inttostr(Sistema.IdModulo)+ ' AS IDMODULO, '+_clinefeed+
         '       '+asflgbenefmin+' AS FLGBENEFMIN, '+_clinefeed+
         '       '+asidsitpart+' AS IDSITPARTNOVO, '+_clinefeed+
         '       '+asidsitpart+' AS IDSITPARTATUAL, '+_clinefeed+
         '       '+asidsitplanoprev+' AS IDSITPLANONOVO, '+_clinefeed+
         '       '+asidsitplanoprev+' AS IDSITPLANOATUAL, '+_clinefeed+
         '       '+asidsitfunc+' AS IDSITFUNCNOVO, '+_clinefeed+
         '       '+asidsitfunc+' AS IDSITFUNCATUAL, '+_clinefeed+
         '       '+asidplanoprev+' AS IDPLANOPREV, '+_clinefeed+
         '       '+inttostr(aiidbeneficio)+' AS IDBENEFICIO, '+_clinefeed+
         '       '+inttostr(aiidtitular)+' AS IDTITULAR, '+_clinefeed+
         '       '+inttostr(aiidtitular)+' AS IDPESSOA, '+_clinefeed+
         '       '+asidpessjur+' AS IDPESSJUR, '+_clinefeed+
         '       1 AS SEQPROPOSTA, '+
         '       '+astemposervtotal+' TEMPOSERVTOTAL FROM DUAL'+_clinefeed;
  try
    lsvalor:=RegraNumerica(inttostr(airegra), lssql, lbErro, liidcalculo);
    try
      arvalor:=StrToFLoat(ClienteNumero(lsvalor));
    except
      memResult.Lines.Add('Erro[EXECUÇÃO DA REGRA] - Número : '+inttostr(airegra));
      memResult.Lines.Add('Beneficiário: '+asnomebeneficiario);
      memResult.Lines.Add('Benefício: '+asnomebeneficio);
      memResult.Lines.Add('Patrocinadora : '+asidpessjur);
      memResult.Lines.Add('Titular : '+inttostr(aiidtitular));
      result:=false;
    end;
  except
    memResult.Lines.Add('Erro[REGRA DE CÁLCULO] - Beneficiário : '+
      asnomebeneficiario+ ' Número da Regra: '+inttostr(airegra));
    result:=false;
  end;
end;

function TfrmPreparo.DefineSituacaoBeneficio(
                       flddatafim: tdatetimefield;
                       flddatafimprevista: tdatetimefield;
                       asmesref: string;
                       aiidsitbeneficio: integer): integer;
var lsmesfim, lsmesfimprevista: string;
begin
  if not flddatafim.isnull then
    lsmesfim:=
      copy(formatdatetime('dd/mm/yyyy',flddatafim.asdatetime),7,4)+'/'+
      copy(formatdatetime('dd/mm/yyyy',flddatafim.asdatetime),4,2)
  else
    lsmesfim:='';

  if not flddatafimprevista.isnull then
    lsmesfimprevista:=
      copy(formatdatetime('dd/mm/yyyy',flddatafimprevista.asdatetime),7,4)+'/'+
      copy(formatdatetime('dd/mm/yyyy',flddatafimprevista.asdatetime),4,2)
  else
    lsmesfimprevista:='';

  if not flddatafimprevista.isnull and
     (sMesReferencia >= lsmesfimprevista) then
    result:=2
  else
    if flddatafim.isnull then
      result:=aiidsitbeneficio
    else
      if sMesReferencia < lsmesfim then
        result:=aiidsitbeneficio
      else
        result:=3;
end;

function TfrmPreparo.DeterminaMotivoEncerramento(asfrequencia: string;
  adatanasc: tdatetime): string;
var lsdata: string;
begin
  //SE DATANASC NÃO ESTIVER CADASTRADA CONSIDERAR PARA OS BENEFÍCIOS
  //  TEMPORÁRIOS O MOTIVO OUTROS
  if adatanasc > 0 then
    lsdata:=formatdatetime('yyyy/mm', adatanasc)
  else
    lsdata:=sMesReferencia;
  if (copy(lsdata, 6, 2) <> copy(sMesReferencia, 6, 2)) and
     (asfrequencia = 'D') then
    result:='7'
  else
    result:='1';
end;

function TfrmPreparo.TrataUltimoPagto(aqryProcesso, aqryGrupo,
  aqryAux: twwquery; asvaloratualbenef, asvalortotalbenef: string;
  aidlote: integer; asmesreferencia: string; advalortotalinss,
  advaloratualinss: double; var abcomerro: boolean): double;
var lidsitbeneficio: Integer;
    ldValorNoMes: Double;
    lsValorAtual: string;
    lsDataInicio: string;
    lsDataFim: string;
    lsdataref: string;
    lssql: string;
    lstipomov: string; 
    lsMsgErro: string; 
    lsMotivoRet: string; 
begin
  abcomerro:=true;

  lsDataInicio:=formatdatetime('dd/mm/yyyy',
    aqryProcesso.fieldbyname('DATAINICIOFUND').asdatetime);

  if not aqryProcesso.fieldbyname('DATAFINAL').isnull then
  begin
    lsdatafim:=formatdatetime('dd/mm/yyyy',
      aqryProcesso.fieldbyname('DATAFINAL').asdatetime);
  end
  else
    if not aqryProcesso.fieldbyname('DATAFINALPREVISTA').isnull then
    begin
      lsdatafim:=formatdatetime('dd/mm/yyyy',
        aqryProcesso.fieldbyname('DATAFINALPREVISTA').asdatetime);
    end
    else
      lsdatafim:='';

  if (lsdatafim = '') or
     (copy(lsdatafim,7,4)+'/'+copy(lsdatafim,4,2) <> asmesreferencia) then
    lsdataref:='01/'+copy(asmesreferencia,6,2)+'/'+copy(asmesreferencia,1,4)
  else
    lsdataref:=lsdatafim;

  lsValorAtual:=asValorAtualBenef;

  //executa a regra de ultimo pagamento
  if not ExecutaRegraUltimoPagamento(
           aqryProcesso.fieldbyname('IDREGRAULTPAGTO').asinteger,
           aqryProcesso.fieldbyname('Nome').asstring,
           aqryProcesso.fieldbyname('Beneficio').asstring,
           inttostr(aqryProcesso.fieldbyname('idpessjur').AsInteger),
           aqryProcesso.fieldbyname('idtitular').AsInteger,
           aqryProcesso.fieldbyname('idbeneficio').AsInteger,
           lsvaloratual,
           lsvaloratual,
           lsdataref,
           asvalortotalbenef,
           100,
           '01/'+copy(lsdatafim,4,10),
           lsdatafim,
           0,
           lsvaloratual,
           aqryProcesso.fieldbyname('FLGBENEFMIN').asstring,
           aqryProcesso.fieldbyname('IDSITPART').asstring,
           aqryProcesso.fieldbyname('IDSITPLANOPREV').asstring,
           aqryProcesso.fieldbyname('IDSITFUNC').asstring,
           aqryProcesso.fieldbyname('IDPLANOPREV').asstring,
           aqryProcesso.fieldbyname('TEMPOSERVTOTAL').asstring,
           ldValorNoMes) then
    exit;

  //grava situacao do beneficio
  lidsitbeneficio:=DefineSituacaoBeneficio(
    (aqryProcesso.fieldbyname('DATAFINAL') as tdatetimefield),
    (aqryProcesso.fieldbyname('DATAFINALPREVISTA') as tdatetimefield),
    asmesreferencia,
    aqryProcesso.fieldbyname('IDSITBENEFICIO').AsInteger);

  //USO DE ROTINA PARA GRAVAR SITUAÇÃO DO BENEFÍCIO
  if not AtualizaSituacaoBeneficio(aqryProcesso, aqryaux, lidsitbeneficio, lsMsgErro) then
  begin
    memResult.Lines.Add('Erro na atualização do valor atual do benefício '+
      aqryProcesso.fieldbyname('beneficio').asstring+' para beneficiário o '+
      aqryProcesso.fieldbyname('nome').asstring);
    memResult.Lines.Add('Mensagem de erro: '+lsMsgErro);
    exit;
  end;

  lssql:=
    'UPDATE HSTBENEFBFCIARIO '+_clinefeed+
    'SET VALORPREV = '+oranumero(floattostr(ldValorNoMes))+' '+_clinefeed+
    'WHERE IDPESSJUR = '+inttostr(aqryProcesso.fieldbyname('IDPESSJUR').AsInteger)+' '+_clinefeed+
    'AND IDPLANOPREV = '+inttostr(aqryProcesso.fieldbyname('IDPLANOPREV').AsInteger)+' '+_clinefeed+
    'AND IDBENEFICIO = '+inttostr(aqryProcesso.fieldbyname('IDBENEFICIO').AsInteger)+' '+_clinefeed+
    'AND NUMEROPROCESSO = '+inttostr(aqryProcesso.fieldbyname('NumeroProcesso').AsInteger)+' '+_clinefeed+
    'AND SEQPROPOSTA = '+inttostr(aqryProcesso.fieldbyname('SEQPROPOSTA').AsInteger)+' '+_clinefeed+
    'AND SEQBENEFICIO = 1 '+_clinefeed+
    'AND IDTITULAR = '+inttostr(aqryProcesso.fieldbyname('idtitular').AsInteger)+' '+_clinefeed+
    'AND IDPESSOA = '+inttostr(aqryProcesso.fieldbyname('IDPESSOA').AsInteger)+' '+_clinefeed+
    'AND MES = '+quotedstr(asmesReferencia)+' '+_clinefeed;

  if RdgTpFolha.ItemIndex <> 0 then
    lssql:=lssql+
      'AND IDMOTIVO = '+inttostr(prmIdMotivoAbono)+' '+_clinefeed+
      'AND MESREFERENCIA = '+quotedstr(copy(asmesreferencia,1,5)+'13')+' '+_clinefeed
  else
    lssql:=lssql+
      'AND IDMOTIVO = '+inttostr(prmIDMOTIVOFOLHABEN)+' '+_clinefeed+
      'AND MESREFERENCIA = '+quotedstr(asmesReferencia)+' '+_clinefeed;

  try
    aqryaux.sql.clear;
    aqryaux.sql.add(lssql);
    aqryaux.execsql;
  except
    on E:EDBEngineError do
    begin
      TratarErro(e.Message); //Brunno Mattos - KTN 767861 - SOL 132659
      memResult.Lines.Add('Erro na atualização do histórico de benefício '+
        aqryProcesso.fieldbyname('beneficio').asstring+' para beneficiário o '+
        aqryProcesso.fieldbyname('nome').asstring);
      memResult.Lines.Add('Mensagem de erro : '+E.message);
      exit;
    end;
  end;

  //VERIFICA GERAÇÃO DE ABONO NO ENCERRAMENTO PARA PENSIONISTA
  if aqryProcesso.fieldbyname('IdTitular').AsInteger <>
     aqryProcesso.fieldbyname('IdPessoa').AsInteger then
  begin
    if not aqryProcesso.fieldbyname('DATAFINAL').isnull then
    begin
      if (aqryProcesso.fieldbyname('FLGPOSSUIABONO').AsInteger=1) and
         (aqryProcesso.fieldbyname('FLGABONOFINALBEN').AsInteger=1) then
      begin
        bGeraAbono:=true;
        dValorAbono:=GeraAbonoUltimoPgto(
          aqryProcesso.fieldbyname('IDREGRACALCABONO').AsInteger,
          aqryProcesso.fieldbyname('IdPessJur').AsInteger,
          aqryProcesso.fieldbyname('IdPlanoPrev').AsInteger,
          aqryProcesso.fieldbyname('IdPlanoOrigem').AsInteger,
          aqryProcesso.fieldbyname('IdBeneficio').AsInteger,
          aqryProcesso.fieldbyname('SeqProposta').AsInteger,
          aqryProcesso.fieldbyname('NumeroProcesso').Asinteger,
          aqryProcesso.fieldbyname('IdsitBeneficio').AsInteger,
          aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger,
          aqryProcesso.fieldbyname('CODPORTFORMA').asinteger,
          aqryProcesso.fieldbyname('FLGBENEFTEMP').AsInteger,
          aqryProcesso.fieldbyname('IdTitular').AsInteger,
          aqryProcesso.fieldbyname('IdPessoa').AsInteger,
          aqryProcesso.fieldbyname('NOME').asstring,
          aqryProcesso.fieldbyname('BENEFICIO').asstring,
          aqryProcesso.fieldbyname('FLGCALCTODOMES').asstring,
          aqryProcesso.fieldbyname('FLGPROVISORIO').asstring,
          aqryProcesso.fieldbyname('flgdescirmes').AsString,
          aqryProcesso.fieldbyname('flgdevolucao').AsString,
          lsvaloratual,
          asvalortotalbenef,
          aqryProcesso.fieldbyname('VALORSRB').AsString,
          aqryProcesso.fieldbyname('VALORCALCULADO').AsString,
          aqryProcesso.fieldbyname('VALORBASE1_BEN').AsString,
          aqryProcesso.fieldbyname('VALORBASE2_BEN').AsString,
          aqryProcesso.fieldbyname('VALORBASE3_BEN').AsString,
          aqryProcesso.fieldbyname('DataInicio').asdatetime,
          aqryProcesso.fieldbyname('DataFinal').asdatetime,
          aqryProcesso.fieldbyname('MESPGABONO').asinteger, 
          aqryProcesso.fieldbyname('PERCENTUAL').asfloat 
          );
        
        if iUltIDPLANOPREV = 0 then
        begin
          iUltIDPLANOPREV:=aqryProcesso.fieldbyname('IDPLANOPREV').AsInteger;
          iUltIDPLANOORIGEM:=qryPrinc.fieldbyname('IDPLANOORIGEM').AsInteger; 
          sUltIdPlanoPrev:=inttostr(iUltIDPLANOPREV);
          sDataCobranca:=CriticaDataCobrancaSit(dtmFolha.qryAux,
                                                IntToStr(iIdFundacao),
                                                IntToStr(iUltIdPlanoPrev),
                                                'AS', 'P',
                                                Copy(sMesReferencia,6,2),
                                                Copy(sMesReferencia,1,4));
          if Trim(sDataCobranca) = '' then
            sDataCobranca:=FormatDateTime('dd/mm/yyyy', date);
        end;
        if iUltIDBENEFICIO = 0 then
          iUltIDBENEFICIO:=aqryProcesso.fieldbyname('IDBENEFICIO').AsInteger;
        

        if aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger = 1 then 
          CalculaEnviaContribuicaoPensionista(sMesAbono);

        if gbBuscaAntecipAbono then
        begin
          BuscaLancaAbonoBeneficioProcessados(
            aqryProcesso.fieldbyname('IDREGRACALCULO').AsInteger,
            aqryProcesso.fieldbyname('IdPessJur').AsInteger,
            aqryProcesso.fieldbyname('IdPlanoPrev').AsInteger,
            aqryProcesso.fieldbyname('IdPlanoOrigem').AsInteger,
            aqryProcesso.fieldbyname('IdBeneficio').AsInteger,
            aqryProcesso.fieldbyname('SeqProposta').AsInteger,
            aqryProcesso.fieldbyname('NumeroProcesso').Asinteger,
            aqryProcesso.fieldbyname('IdsitBeneficio').AsInteger,
            aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger,
            aqryProcesso.fieldbyname('CODPORTFORMA').asinteger,
            aqryProcesso.fieldbyname('IdTitular').AsInteger,
            aqryProcesso.fieldbyname('IdPessoa').AsInteger,
            aqryProcesso.fieldbyname('NOME').asstring,
            aqryProcesso.fieldbyname('BENEFICIO').asstring,
            aqryProcesso.fieldbyname('FLGCALCTODOMES').asstring,
            aqryProcesso.fieldbyname('FLGPROVISORIO').asstring,
            aqryProcesso.fieldbyname('flgdescirmes').AsString,
            '1', 
            aqryProcesso.fieldbyname('valoratual').AsString,
            aqryProcesso.fieldbyname('valortotal').AsString,
            aqryProcesso.fieldbyname('VALORSRB').AsString,
            aqryProcesso.fieldbyname('VALORCALCULADO').AsString,
            aqryProcesso.fieldbyname('VALORBASE1_BEN').AsString,
            aqryProcesso.fieldbyname('VALORBASE2_BEN').AsString,
            aqryProcesso.fieldbyname('VALORBASE3_BEN').AsString,
            aqryProcesso.fieldbyname('PERCENTUAL').asfloat 
          );

	  if aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger = 1 then 
            BuscaLancaAbonoContribuicaoProcessados(
              aqryProcesso.fieldbyname('IdPlanoPrev').AsInteger,
              aqryProcesso.fieldbyname('IdTitular').AsInteger,
              aqryProcesso.fieldbyname('IdPessoa').AsInteger,
              aqryProcesso.fieldbyname('NOME').asstring
            );
        end;
      end;
    end;
  end;
  

  //grava movbenef
  if lidsitbeneficio <> 1 then
  begin
    try
      if lidsitbeneficio = 2 then
        lstipomov:='3'
      else
        lstipomov:='4';

      lsMotivoRet:=
        DeterminaMotivoEncerramento(
          aqryProcesso.fieldbyname('FLGFREQUENCIA').asstring,
          aqryProcesso.fieldbyname('DATANASC').asdatetime);
      
      CriaLogOcorrencia(aqryProcesso.fieldbyname('IDPLANOPREV').asstring,
        aqryProcesso.fieldbyname('IDPESSJUR').asstring,
        aqryProcesso.fieldbyname('IDTITULAR').asstring,
        aqryProcesso.fieldbyname('IDBENEFICIO').asstring,
        aqryProcesso.fieldbyname('NUMEROPROCESSO').asstring,
        aqryProcesso.fieldbyname('IDPESSOA').asstring,
        aqryProcesso.fieldbyname('SEQPROPOSTA').asstring,
        lstipomov, 
        formatdatetime('dd/mm/yyyy',now),
        floattostr(ldValorNoMes),
        floattostr(aqryProcesso.fieldbyname('VALORTOTAL').asfloat),
        floattostr(ldValorNoMes),
        lsdatainicio,
        lsdatafim,
        floattostr(aqryProcesso.fieldbyname('VALORATUAL').asfloat),
        lsdatainicio,
        lsdatafim,
        aqryProcesso.fieldbyname('IDSITBENEFICIO').asstring,
        aqryProcesso.fieldbyname('FLGDATAPREVISTA').asinteger,
        aqryAux,
        lsMotivoRet,
        aidlote);
    except
      on E:EDBEngineError do
      begin
        memResult.Lines.Add('Erro ao gravar movimentação do encerramento[MOVBENEF] - Beneficiário : '+
                             aqryProcesso.fieldbyname('NOME').asstring);
        memResult.Lines.Add('Mensagem de erro : '+E.message);
        exit;
      end;
    end;
  end;

  DesativaProcesso(aqryAux, aqryProcesso.fieldbyname('idtitular').AsInteger);

  if lidsitbeneficio = 2 then
  begin
    memResult.Lines.Add('Retenção processada para beneficio: '+
      aqryProcesso.fieldbyname('beneficio').asstring);
    memResult.Lines.Add('Data final prevista: '+lsdatafim);
  end
  else
  begin
    memResult.Lines.Add('Encerramento processado para beneficio: '+
      aqryProcesso.fieldbyname('beneficio').asstring);
    memResult.Lines.Add('Data final: '+lsdatafim);

    //BRUNO AZEVEDO SOL KINTANA
    if (RdgTpFolha.ItemIndex = 3) then begin
      memResult.Lines.Add('Motivo: Encerramento de benefício - Resgate parcelado');
    end else if lsMotivoRet = '7' then begin
      memResult.Lines.Add('Motivo: Outros (benefício de prazo determinado)');
    end else begin
      memResult.Lines.Add('Motivo: Completou maioridade');
    end;
    //BRUNO AZEVEDO SOL KINTANA
  end;
  memResult.Lines.Add('Matrícula: '+aqryProcesso.fieldbyname('matricula').asstring);
  memResult.Lines.Add('Beneficiário: '+aqryProcesso.fieldbyname('nome').asstring);
  //BRUNO AZEVEDO SOL KINTANA
  if not(RdgTpFolha.ItemIndex = 3) then begin
    memResult.Lines.Add('Valor a ser pago no mês: '+formatfloat('#0.00',ldValorNoMes));
  end;
  memResult.Lines.Add('------------------------------------------------------------------');

  abcomerro:=false;
  result:=ldValorNoMes;
end;

function TfrmPreparo.TrataUltimoPagtoGrupoFamiliar(aqryProcesso, aqryGrupo,
  aqryAux: twwquery; asvaloratualbenef, asvalortotalbenef: string;
  aidlote: integer; asmesreferencia: string; advalortotalinss,
  advaloratualinss: double; var abcomerro: boolean): double;
var lidsitbeneficio, liNumBenefEmGozo, liNumDataFinal: Integer;
    lsValorAtual: string;
    ldNovoValor, ldValorNoMes, ldValorNoMesParcial: Double;
    lsdataref: string;
    lssql: string;
    lqryGrupo: twwquery;
    lsDataInicio: string;
    lsDataFim: string;
    lsdatainicioparcial: string;
    lsdatafinalencerrado: string;
    lstipomov: string; 
    lsMotivoRet: string; 

   function PegaQuantidadeBeneficioSemEncerramento: boolean;
   begin
     result:=false;
     lssql:=
       'SELECT COUNT(*) '+_clinefeed+
       'FROM BENEFBFCIARIO BB, BENEFPLANPREV BP '+_clinefeed+
       'WHERE BB.IDTITULAR = '+inttostr(aqryProcesso.fieldbyname('idtitular').AsInteger)+' '+_clinefeed+
       'AND BB.IDPLANOPREV = BP.IDPLANOPREV '+_clinefeed+
       'AND BB.IDBENEFICIO = BP.IDBENEFICIO '+_clinefeed+
       'AND BP.FLGREFERENCIA = '+
         inttostr(aqryProcesso.fieldbyname('flgreferencia').asinteger)+_clinefeed+
       'AND (BB.DATAFINAL IS NULL OR TO_CHAR(BB.DATAFINAL,''YYYY/MM'') > '+
         QuotedStr(asmesreferencia)+') '+_clinefeed+
       'AND BB.IDSITBENEFICIO IN (1,2) '+_clinefeed;
     try
       aqryaux.sql.clear;
       aqryaux.sql.add(lssql);
       aqryaux.open;
       liNumBenefEmGozo:=aqryaux.fields[0].asinteger;
     except
       on E:EDBEngineError do
       begin
         memResult.Lines.Add('Erro ao obter quantidade de beneficiários sem encerramento no mês para o benefício '+
           aqryProcesso.fieldbyname('beneficio').asstring+' e beneficiário o '+
           aqryProcesso.fieldbyname('nome').asstring);
         memResult.Lines.Add('Mensagem de erro: '+E.message);
         exit;
       end;
     end;
     result:=true;
   end;

begin
  abcomerro:=true;

  lsDataInicio:=formatdatetime('dd/mm/yyyy',
    aqryProcesso.fieldbyname('DATAINICIOFUND').asdatetime);

  if not aqryProcesso.fieldbyname('DATAFINAL').isnull then
  begin
    lsdatafim:=formatdatetime('dd/mm/yyyy',
      aqryProcesso.fieldbyname('DATAFINAL').asdatetime);
  end
  else
    if not aqryProcesso.fieldbyname('DATAFINALPREVISTA').isnull then
    begin
      lsdatafim:=formatdatetime('dd/mm/yyyy',
        aqryProcesso.fieldbyname('DATAFINALPREVISTA').asdatetime);
    end
    else
      lsdatafim:='';

  if (lsdatafim = '') or
     (copy(lsdatafim,7,4)+'/'+copy(lsdatafim,4,2) <> asmesreferencia) then
    lsdataref:='01/'+copy(asmesreferencia,6,2)+'/'+copy(asmesreferencia,1,4)
  else
    lsdataref:=lsdatafim;

  lsValorAtual:=asValorAtualBenef;

  //benefício de referência não pago pela fundação
  if (aqryProcesso.fieldbyname('flgreferencia').asinteger = 1) and
     (aqryProcesso.fieldbyname('flgpagainss').asinteger = 0) then
  begin
    //executa encerramento simplificado sem tratamento de grupo familiar
    ldValorNoMes:=TrataUltimoPagto(aqryProcesso, aqryGrupo, aqryAux,
      asvaloratualbenef, asvalortotalbenef, aidlote, asmesreferencia,
      advalortotalinss, advaloratualinss, abcomerro);
    if not abcomerro then
      result:=ldValorNoMes
    else
      result:=0;
    exit;
  end
  else
  begin
    //pega quantidades de pensionistas que não serão encerrados e permanecerão em pagamento para o próximo mês
    if not PegaQuantidadeBeneficioSemEncerramento then
      exit;

    lssql:=
      'SELECT BB.DATAFINAL, COUNT(DISTINCT BB.IDPESSOA) AS CONT '+_clinefeed+
      'FROM BENEFBFCIARIO BB, BENEFPLANPREV BP, TPPAGTOBENEFICIO TPB '+_clinefeed+
      'WHERE BB.IDTITULAR = '+inttostr(aqryProcesso.fieldbyname('idtitular').AsInteger)+' '+_clinefeed+
      'AND BB.IDPLANOPREV = BP.IDPLANOPREV '+_clinefeed+
      'AND BB.IDBENEFICIO = BP.IDBENEFICIO '+_clinefeed+
      'AND BB.FLGFORMAPAGTO = ''F'' '+_clinefeed+
      'AND TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC '+_clinefeed+
      'AND TPB.FLGFREQUENCIA <> ''U'' '+_clinefeed+
      'AND BP.FLGREFERENCIA = '+
        inttostr(aqryProcesso.fieldbyname('flgreferencia').asinteger)+_clinefeed+
      'AND BB.DATAFINAL IS NOT NULL '+
      'AND TO_CHAR(BB.DATAFINAL,''YYYY/MM'') = '+QuotedStr(asmesreferencia)+' '+_clinefeed+
      'AND ('+_clinefeed+
      '        (     (BB.IDSITBENEFICIO = 1) '+_clinefeed+
      '         AND (NVL(BB.ULTMESPREPARO,''0000/00'') <= '+quotedstr(asmesreferencia)+') '+_clinefeed+
      '        ) '+_clinefeed+
      '     OR (     (BB.IDSITBENEFICIO = 3) '+_clinefeed+
      '         AND (NVL(BB.ULTMESPREPARO,''0000/00'') = '+quotedstr(asmesreferencia)+') '+_clinefeed+
      '        ) '+_clinefeed+
      '    ) '+_clinefeed+
      'GROUP BY BB.DATAFINAL '+_clinefeed+
      'ORDER BY BB.DATAFINAL ';

    //no laço do resultado da query acima
      //executa a regra de ultimo pagamento
      //recalcula valor atual do beneficio
      //valida valor novo contra o maximo do beneficio e retem se ultrapassar
      //executa regra de primeiro pagamento
    //fim laço
    //grava situacao e novo valor atual do beneficio

    try
      aqryGrupo.sql.clear;
      aqryGrupo.sql.add(lssql);
      aqryGrupo.open;
    except
      on E:EDBEngineError do
      begin
        memResult.Lines.Add('Erro para obter beneficiário em encerramento no grupo para o benefício '+
          aqryProcesso.fieldbyname('beneficio').asstring+' e beneficiário o '+
          aqryProcesso.fieldbyname('nome').asstring);
        memResult.Lines.Add('Mensagem de erro: '+E.message);
        exit;
      end;
    end;

    if aqryGrupo.isempty then
    begin
      memResult.Lines.Add('Nenhum encerramento para o benefício '+
        aqryProcesso.fieldbyname('beneficio').asstring+' e beneficiário o '+
        aqryProcesso.fieldbyname('nome').asstring);
      memResult.Lines.Add('------------------------------------------------------------------');
      abcomerro:=false;
      exit;
    end;

    //pega quantidades de pensionistas que serão encerrados no mês antes deste
    liNumDataFinal:=0;
    while not aqryGrupo.eof do
    begin
      //verifica outras pessoas com encerramento no mesmo mês
      if (aqryProcesso.fieldbyname('DATAFINAL').isnull and
          aqryProcesso.fieldbyname('DATAFINALPREVISTA').isnull) or
         (not aqryProcesso.fieldbyname('DATAFINAL').isnull and
          (aqryGrupo.fieldbyname('DATAFINAL').asdatetime <
           aqryProcesso.fieldbyname('DATAFINAL').asdatetime)) or
         (not aqryProcesso.fieldbyname('DATAFINALPREVISTA').isnull and
          (aqryGrupo.fieldbyname('DATAFINAL').asdatetime <
           aqryProcesso.fieldbyname('DATAFINALPREVISTA').asdatetime)) then
        liNumDataFinal:=liNumDataFinal+
          aqryGrupo.fieldbyname('CONT').asinteger;
      aqryGrupo.next;
    end;

    if (liNumDataFinal = 0) then
    begin
      //executa encerramento simplificado sem tratamento de grupo familiar
      ldValorNoMes:=TrataUltimoPagto(aqryProcesso, aqryGrupo, aqryAux,
        asvaloratualbenef, asvalortotalbenef, aidlote, asmesreferencia,
        advalortotalinss, advaloratualinss, abcomerro);
      if not abcomerro then
        result:=ldValorNoMes
      else
        result:=0;
      exit;
    end;

    //pega quantidades de pensionistas que serão encerrados no mês
    aqryGrupo.first;
    liNumDataFinal:=0;
    while not aqryGrupo.eof do
    begin
      liNumDataFinal:=liNumDataFinal+
        aqryGrupo.fieldbyname('CONT').asinteger;
      aqryGrupo.next;
    end;

    aqryGrupo.first;
    ldValorNoMes:=0;
    lsdatainicioparcial:='01/'+formatdatetime('mm/yyyy',
      aqryGrupo.fieldbyname('DATAFINAL').asdatetime);
    ldNovoValor:=strtofloat(lsvaloratual);
    while not aqryGrupo.eof do
    begin
      if (aqryProcesso.fieldbyname('DATAFINAL').isnull and
          aqryProcesso.fieldbyname('DATAFINALPREVISTA').isnull) or
         (not aqryProcesso.fieldbyname('DATAFINAL').isnull and
          (aqryGrupo.fieldbyname('DATAFINAL').asdatetime <
           aqryProcesso.fieldbyname('DATAFINAL').asdatetime)) or
         (not aqryProcesso.fieldbyname('DATAFINALPREVISTA').isnull and
          (aqryGrupo.fieldbyname('DATAFINAL').asdatetime <
           aqryProcesso.fieldbyname('DATAFINALPREVISTA').asdatetime)) then
      begin
        lsdatafinalencerrado:=formatdatetime('dd/mm/yyyy',
          aqryGrupo.fieldbyname('DATAFINAL').asdatetime);
        lsdataref:=lsdatafinalencerrado;

        ldValorNoMesParcial:=0;
        //executa a regra de ultimo pagamento
        if not ExecutaRegraUltimoPagamento(
                 aqryProcesso.fieldbyname('IDREGRAULTPAGTO').asinteger,
                 aqryProcesso.fieldbyname('Nome').asstring,
                 aqryProcesso.fieldbyname('Beneficio').asstring,
                 inttostr(aqryProcesso.fieldbyname('idpessjur').AsInteger),
                 aqryProcesso.fieldbyname('idtitular').AsInteger,
                 aqryProcesso.fieldbyname('idbeneficio').AsInteger,
                 floattostr(ldNovoValor),
                 floattostr(ldNovoValor),
                 lsdataref,
                 asvalortotalbenef,
                 aqryProcesso.fieldbyname('PERCENTUAL').asfloat,
                 lsdatainicioparcial,
                 lsdatafinalencerrado,
                 liNumBenefEmGozo+liNumDataFinal,
                 aqryProcesso.fieldbyname('VLRINFINSS').asstring,
                 aqryProcesso.fieldbyname('FLGBENEFMIN').asstring,
                 aqryProcesso.fieldbyname('IDSITPART').asstring,
                 aqryProcesso.fieldbyname('IDSITPLANOPREV').asstring,
                 aqryProcesso.fieldbyname('IDSITFUNC').asstring,
                 aqryProcesso.fieldbyname('IDPLANOPREV').asstring,
                 aqryProcesso.fieldbyname('TEMPOSERVTOTAL').asstring,
                 ldValorNoMesParcial) then
          exit;

        ldValorNoMes:=ldValorNoMes+ldValorNoMesParcial;
        liNumDataFinal:=liNumDataFinal-
          aqryGrupo.fieldbyname('CONT').asinteger;

        if not ExecutaRegraCalculoRateio(
                 aqryProcesso.fieldbyname('IDREGRACALCULO').asinteger,
                 aqryProcesso.fieldbyname('Nome').asstring,
                 aqryProcesso.fieldbyname('Beneficio').asstring,
                 inttostr(aqryProcesso.fieldbyname('idpessjur').AsInteger),
                 aqryProcesso.fieldbyname('idtitular').AsInteger,
                 aqryProcesso.fieldbyname('idbeneficio').AsInteger,
                 floattostr(ldNovoValor),
                 floattostr(ldNovoValor),
                 lsdatafinalencerrado,
                 aqryProcesso.fieldbyname('VALORTOTAL').asstring,
                 aqryProcesso.fieldbyname('PERCENTUAL').asfloat,
                 aqryProcesso.fieldbyname('DATAINICIO').asstring,
                 lsdatafinalencerrado,
                 liNumBenefEmGozo+liNumDataFinal,
                 formatfloat('#0.000000',advalortotalinss),
                 formatfloat('#0.000000',advaloratualinss),
                 aqryProcesso.fieldbyname('FLGBENEFMIN').asstring,
                 aqryProcesso.fieldbyname('IDSITPART').asstring,
                 aqryProcesso.fieldbyname('IDSITPLANOPREV').asstring,
                 aqryProcesso.fieldbyname('IDSITFUNC').asstring,
                 aqryProcesso.fieldbyname('IDPLANOPREV').asstring,
                 aqryProcesso.fieldbyname('TEMPOSERVTOTAL').asstring,
                 aqryProcesso.fieldbyname('VALORBASE1_BEN').asfloat,
                 aqryProcesso.fieldbyname('VALORBASE2_BEN').asfloat,
                 aqryProcesso.fieldbyname('VALORBASE3_BEN').asfloat,
                 aqryProcesso.fieldbyname('FLGCALCTODOMES').asstring,
                 ldNovoValor) then
          exit;

        // executa a regra de primeiro pagamento
        lsdatainicioparcial:=
          formatdatetime('dd/mm/yyyy',
            strtodatetime(lsdatafinalencerrado)+1);

        if copy(lsdatainicioparcial,7,4)+'/'+
           copy(lsdatainicioparcial,4,2) = asmesreferencia then
        begin
          if aqryGrupo.eof then
          begin
            if aqryGrupo.fieldbyname('DATAFINAL').isnull then
            begin
              lsdataref:=AjustaDataUltDiaMes('31/'+
                copy(asmesreferencia,6,2)+'/'+copy(asmesreferencia,1,4));
            end
            else
            begin
              lsdataref:=formatdatetime('dd/mm/yyyy',
                aqryProcesso.fieldbyname('DATAFINAL').asdatetime);
              break;
            end;
          end
          else
            lsdataref:=formatdatetime('dd/mm/yyyy',
              aqryGrupo.fieldbyname('DATAFINAL').asdatetime);
        end;
      end;
      aqryGrupo.next;
    end;

    //a pessoa sendo processada tem encerramento ou retenção, e se deve executar a regra de ultimo pagamento para o trecho final
    if (not aqryProcesso.fieldbyname('DATAFINAL').isnull and
        (formatdatetime('YYYY/MM',
         aqryProcesso.fieldbyname('DATAFINAL').asdatetime) = asmesreferencia)) or
       (not aqryProcesso.fieldbyname('DATAFINALPREVISTA').isnull) then
    begin
      lsdataref:=lsdatafim;

      //executa a regra de ultimo pagamento para o pensionista em questão
      if not ExecutaRegraUltimoPagamento(
               aqryProcesso.fieldbyname('IDREGRAULTPAGTO').asinteger,
               aqryProcesso.fieldbyname('Nome').asstring,
               aqryProcesso.fieldbyname('Beneficio').asstring,
               inttostr(aqryProcesso.fieldbyname('idpessjur').AsInteger),
               aqryProcesso.fieldbyname('idtitular').AsInteger,
               aqryProcesso.fieldbyname('idbeneficio').AsInteger,
               floattostr(ldNovoValor),
               floattostr(ldNovoValor),
               lsdataref,
               asvalortotalbenef,
               aqryProcesso.fieldbyname('PERCENTUAL').asfloat,
               lsdatainicioparcial,
               lsdataref,
               liNumBenefEmGozo,
               aqryProcesso.fieldbyname('VLRINFINSS').asstring,
               aqryProcesso.fieldbyname('FLGBENEFMIN').asstring,
               aqryProcesso.fieldbyname('IDSITPART').asstring,
               aqryProcesso.fieldbyname('IDSITPLANOPREV').asstring,
               aqryProcesso.fieldbyname('IDSITFUNC').asstring,
               aqryProcesso.fieldbyname('IDPLANOPREV').asstring,
               aqryProcesso.fieldbyname('TEMPOSERVTOTAL').asstring,
               ldValorNoMesParcial) then
        exit;

      ldValorNoMes:=ldValorNoMes+ldValorNoMesParcial;
      //valida novo valor do beneficio
      lidsitbeneficio:=DefineSituacaoBeneficio(
        (aqryProcesso.fieldbyname('DATAFINAL') as tdatetimefield),
        (aqryProcesso.fieldbyname('DATAFINALPREVISTA') as tdatetimefield),
        asmesreferencia,
        aqryProcesso.fieldbyname('IDSITBENEFICIO').AsInteger);
    end
    else
    //a pessoa não tem encerramento e deve-se executar a regra de primeiro pagamento do último trecho
    begin
      if copy(lsdatainicioparcial,7,4)+'/'+
         copy(lsdatainicioparcial,4,2) = asmesreferencia then
      begin
        lsdataref:=AjustaDataUltDiaMes('31/'+
          copy(asmesreferencia,6,2)+'/'+copy(asmesreferencia,1,4));

        ldValorNoMesParcial:=0;

        if not ExecutaRegraPrimeiroPagamento(
                 aqryProcesso.fieldbyname('IDREGRAPRIMPAGTO').asinteger,
                 aqryProcesso.fieldbyname('NOME').asstring,
                 aqryProcesso.fieldbyname('BENEFICIO').asstring,
                 inttostr(aqryProcesso.fieldbyname('idpessjur').AsInteger),
                 aqryProcesso.fieldbyname('IDTITULAR').AsInteger,
                 aqryProcesso.fieldbyname('IDBENEFICIO').AsInteger,
                 floattostr(ldNovoValor),
                 floattostr(ldNovoValor),
                 lsdataref,
                 aqryProcesso.fieldbyname('VALORTOTAL').asstring,
                 aqryProcesso.fieldbyname('PERCENTUAL').asfloat,
                 lsdatainicioparcial,
                 lsdataref,
                 liNumBenefEmGozo+liNumDataFinal,
                 aqryProcesso.fieldbyname('VLRINFINSS').asstring,
                 aqryProcesso.fieldbyname('FLGBENEFMIN').asstring,
                 aqryProcesso.fieldbyname('IDSITPART').asstring,
                 aqryProcesso.fieldbyname('IDSITPLANOPREV').asstring,
                 aqryProcesso.fieldbyname('IDSITFUNC').asstring,
                 aqryProcesso.fieldbyname('IDPLANOPREV').asstring,
                 aqryProcesso.fieldbyname('TEMPOSERVTOTAL').asstring,
                 ldValorNoMesParcial) then
          exit;

        ldValorNoMes:=ldValorNoMes+ldValorNoMesParcial;
      end
      else
       lsdataref:=formatdatetime('dd/mm/yyyy',
         aqryGrupo.fieldbyname('DATAFINAL').asdatetime);

      lidsitbeneficio:=aqryProcesso.fieldbyname('idsitbeneficio').asinteger;
    end;

    //VERIFICA GERAÇÃO DE ABONO NO ENCERRAMENTO PARA PENSIONISTA
    //a pessoa sendo processada tem encerramento, e se deve verificar geração de abono
    if (not aqryProcesso.fieldbyname('DATAFINAL').isnull and
        (formatdatetime('YYYY/MM',
         aqryProcesso.fieldbyname('DATAFINAL').asdatetime) = asmesreferencia)) then
    begin
      if aqryProcesso.fieldbyname('IdTitular').AsInteger <>
         aqryProcesso.fieldbyname('IdPessoa').AsInteger then
      begin
        if not aqryProcesso.fieldbyname('DATAFINAL').isnull then
        begin
          if (aqryProcesso.fieldbyname('FLGPOSSUIABONO').AsInteger=1) and
             (aqryProcesso.fieldbyname('FLGABONOFINALBEN').AsInteger=1) then
          begin
            bGeraAbono:=true;
            dValorAbono:=GeraAbonoUltimoPgto(
              aqryProcesso.fieldbyname('IDREGRACALCABONO').AsInteger,
              aqryProcesso.fieldbyname('IdPessJur').AsInteger,
              aqryProcesso.fieldbyname('IdPlanoPrev').AsInteger,
              aqryProcesso.fieldbyname('IdPlanoOrigem').AsInteger,
              aqryProcesso.fieldbyname('IdBeneficio').AsInteger,
              aqryProcesso.fieldbyname('SeqProposta').AsInteger,
              aqryProcesso.fieldbyname('NumeroProcesso').Asinteger,
              aqryProcesso.fieldbyname('IdsitBeneficio').AsInteger,
              aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger,
              aqryProcesso.fieldbyname('CODPORTFORMA').asinteger,
              aqryProcesso.fieldbyname('FLGBENEFTEMP').AsInteger,
              aqryProcesso.fieldbyname('IdTitular').AsInteger,
              aqryProcesso.fieldbyname('IdPessoa').AsInteger,
              aqryProcesso.fieldbyname('NOME').asstring,
              aqryProcesso.fieldbyname('BENEFICIO').asstring,
              aqryProcesso.fieldbyname('FLGCALCTODOMES').asstring,
              aqryProcesso.fieldbyname('FLGPROVISORIO').asstring,
              aqryProcesso.fieldbyname('flgdescirmes').AsString,
              aqryProcesso.fieldbyname('flgdevolucao').AsString,
              lsvaloratual,
              asvalortotalbenef,
              aqryProcesso.fieldbyname('VALORSRB').AsString,
              aqryProcesso.fieldbyname('VALORCALCULADO').AsString,
              aqryProcesso.fieldbyname('VALORBASE1_BEN').AsString,
              aqryProcesso.fieldbyname('VALORBASE2_BEN').AsString,
              aqryProcesso.fieldbyname('VALORBASE3_BEN').AsString,
              aqryProcesso.fieldbyname('DataInicio').asdatetime,
              aqryProcesso.fieldbyname('DataFinal').asdatetime,
              aqryProcesso.fieldbyname('MESPGABONO').asinteger, 
              aqryProcesso.fieldbyname('PERCENTUAL').asfloat 
              );

            if iUltIDPLANOPREV = 0 then
              iUltIDPLANOPREV:=aqryProcesso.fieldbyname('IDPLANOPREV').AsInteger;
            if iUltIDBENEFICIO = 0 then
              iUltIDBENEFICIO:=aqryProcesso.fieldbyname('IDBENEFICIO').AsInteger;

            if aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger = 1 then 
              CalculaEnviaContribuicaoPensionista(sMesReferencia);

            if gbBuscaAntecipAbono then
            begin
              BuscaLancaAbonoBeneficioProcessados(
                aqryProcesso.fieldbyname('IDREGRACALCULO').AsInteger,
                aqryProcesso.fieldbyname('IdPessJur').AsInteger,
                aqryProcesso.fieldbyname('IdPlanoPrev').AsInteger,
                aqryProcesso.fieldbyname('IdPlanoOrigem').AsInteger,
                aqryProcesso.fieldbyname('IdBeneficio').AsInteger,
                aqryProcesso.fieldbyname('SeqProposta').AsInteger,
                aqryProcesso.fieldbyname('NumeroProcesso').Asinteger,
                aqryProcesso.fieldbyname('IdsitBeneficio').AsInteger,
                aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger,
                aqryProcesso.fieldbyname('CODPORTFORMA').asinteger,
                aqryProcesso.fieldbyname('IdTitular').AsInteger,
                aqryProcesso.fieldbyname('IdPessoa').AsInteger,
                aqryProcesso.fieldbyname('NOME').asstring,
                aqryProcesso.fieldbyname('BENEFICIO').asstring,
                aqryProcesso.fieldbyname('FLGCALCTODOMES').asstring,
                aqryProcesso.fieldbyname('FLGPROVISORIO').asstring,
                aqryProcesso.fieldbyname('flgdescirmes').AsString,
                '1', 
                aqryProcesso.fieldbyname('valoratual').AsString,
                aqryProcesso.fieldbyname('valortotal').AsString,
                aqryProcesso.fieldbyname('VALORSRB').AsString,
                aqryProcesso.fieldbyname('VALORCALCULADO').AsString,
                aqryProcesso.fieldbyname('VALORBASE1_BEN').AsString,
                aqryProcesso.fieldbyname('VALORBASE2_BEN').AsString,
                aqryProcesso.fieldbyname('VALORBASE3_BEN').AsString,
                aqryProcesso.fieldbyname('PERCENTUAL').asfloat 
              );

	      if aqryProcesso.fieldbyname('FONTEPAGADORA').asinteger = 1 then 
                BuscaLancaAbonoContribuicaoProcessados(
                  aqryProcesso.fieldbyname('IdPlanoPrev').AsInteger,
                  aqryProcesso.fieldbyname('IdTitular').AsInteger,
                  aqryProcesso.fieldbyname('IdPessoa').AsInteger,
                  aqryProcesso.fieldbyname('NOME').asstring
                );
            end;
          end;
        end;
      end;
    end;

    //grava valores de beneficio
    lssql:='UPDATE BENEFBFCIARIO '+_clinefeed+
           'SET IDSITBENEFICIO = '+inttostr(lidsitbeneficio)+', '+_clinefeed+
           '    VALORATUAL = '+oranumero(floattostr(ldNovoValor))+' '+_clinefeed+
           'WHERE (IDTITULAR = '+inttostr(aqryProcesso.fieldbyname('idtitular').AsInteger)+') '+_clinefeed+
           'AND (NUMEROPROCESSO = '+inttostr(aqryProcesso.fieldbyname('NumeroProcesso').AsInteger)+') '+_clinefeed+
           'AND (SEQPROPOSTA = '+inttostr(aqryProcesso.fieldbyname('SEQPROPOSTA').AsInteger)+') '+_clinefeed+
           'AND (IDPESSJUR = '+inttostr(aqryProcesso.fieldbyname('IDPESSJUR').AsInteger)+') '+_clinefeed+
           'AND (IDPLANOPREV = '+inttostr(aqryProcesso.fieldbyname('IDPLANOPREV').AsInteger)+') '+_clinefeed+
           'AND (IDBENEFICIO = '+inttostr(aqryProcesso.fieldbyname('IDBENEFICIO').AsInteger)+') '+_clinefeed+
           'AND (IDPESSOA = '+inttostr(aqryProcesso.fieldbyname('IDPESSOA').AsInteger)+') '+_clinefeed;

    try
      aqryaux.sql.clear;
      aqryaux.sql.add(lssql);
      aqryaux.execsql;
    except
      on E:EDBEngineError do
      begin
        memResult.Lines.Add('Erro na atualização do valor atual do benefício '+
          aqryProcesso.fieldbyname('beneficio').asstring+' para beneficiário o '+
          aqryProcesso.fieldbyname('nome').asstring);
        memResult.Lines.Add('Mensagem de erro: '+E.message);
      end;
    end;

    //grava valores do historico de beneficio
    lssql:=
      'UPDATE HSTBENEFBFCIARIO '+_clinefeed+
      'SET VALORPREV = '+oranumero(floattostr(ldValorNoMes))+', '+_clinefeed+
      '    VALORINTEGRAL = '+oranumero(floattostr(ldNovoValor))+' '+_clinefeed+
      'WHERE IDPESSJUR = '+inttostr(aqryProcesso.fieldbyname('IDPESSJUR').AsInteger)+' '+_clinefeed+
      'AND IDPLANOPREV = '+inttostr(aqryProcesso.fieldbyname('IDPLANOPREV').AsInteger)+' '+_clinefeed+
      'AND IDBENEFICIO = '+inttostr(aqryProcesso.fieldbyname('IDBENEFICIO').AsInteger)+' '+_clinefeed+
      'AND NUMEROPROCESSO = '+inttostr(aqryProcesso.fieldbyname('NumeroProcesso').AsInteger)+' '+_clinefeed+
      'AND SEQPROPOSTA = '+inttostr(aqryProcesso.fieldbyname('SEQPROPOSTA').AsInteger)+' '+_clinefeed+
      'AND SEQBENEFICIO = 1 '+_clinefeed+
      'AND IDTITULAR = '+inttostr(aqryProcesso.fieldbyname('idtitular').AsInteger)+' '+_clinefeed+
      'AND IDPESSOA = '+inttostr(aqryProcesso.fieldbyname('IDPESSOA').AsInteger)+' '+_clinefeed+
      'AND MES = '+quotedstr(asmesReferencia)+' '+_clinefeed;

    if RdgTpFolha.ItemIndex <> 0 then
      lssql:=lssql+
        'AND IDMOTIVO = '+inttostr(prmIdMotivoAbono)+' '+_clinefeed+
        'AND MESREFERENCIA = '+quotedstr(copy(asmesreferencia,1,5)+'13')+' '+_clinefeed
    else
      lssql:=lssql+
        'AND IDMOTIVO = '+inttostr(prmIDMOTIVOFOLHABEN)+' '+_clinefeed+
        'AND MESREFERENCIA = '+quotedstr(asmesReferencia)+' '+_clinefeed;

    try
      aqryaux.sql.clear;
      aqryaux.sql.add(lssql);
      aqryaux.execsql;
    except
      on E:EDBEngineError do
      begin
        TratarErro(e.Message); //Brunno Mattos - KTN 767861 - SOL 132659
        memResult.Lines.Add('Erro na atualização do histórico de benefício '+
          aqryProcesso.fieldbyname('beneficio').asstring+' para beneficiário o '+
          aqryProcesso.fieldbyname('nome').asstring);
        memResult.Lines.Add('Mensagem de erro : '+E.message);
      end;
    end;

    //grava movbenef
    if lidsitbeneficio <> 1 then
    begin
      try
        if lidsitbeneficio = 2 then
          lstipomov:='3'
        else
          lstipomov:='4';
        
        lsMotivoRet:=
          DeterminaMotivoEncerramento(
            aqryProcesso.fieldbyname('FLGFREQUENCIA').asstring,
            aqryProcesso.fieldbyname('DATANASC').asdatetime);
        
        CriaLogOcorrencia(aqryProcesso.fieldbyname('IDPLANOPREV').asstring,
          aqryProcesso.fieldbyname('IDPESSJUR').asstring,
          aqryProcesso.fieldbyname('IDTITULAR').asstring,
          aqryProcesso.fieldbyname('IDBENEFICIO').asstring,
          aqryProcesso.fieldbyname('NUMEROPROCESSO').asstring,
          aqryProcesso.fieldbyname('IDPESSOA').asstring,
          aqryProcesso.fieldbyname('SEQPROPOSTA').asstring,
          lstipomov, 
          formatdatetime('dd/mm/yyyy',now),
          floattostr(ldValorNoMes),
          floattostr(aqryProcesso.fieldbyname('VALORTOTAL').asfloat),
          floattostr(ldValorNoMes),
          lsdatainicio,
          lsdatafim,
          floattostr(aqryProcesso.fieldbyname('VALORATUAL').asfloat),
          lsdatainicio,
          lsdatafim,
          aqryProcesso.fieldbyname('IDSITBENEFICIO').asstring,
          aqryProcesso.fieldbyname('FLGDATAPREVISTA').asinteger,
          aqryAux,
          lsMotivoRet, 
          aidlote);
      except
        on E:EDBEngineError do
        begin
          memResult.Lines.Add( 'Erro ao gravar movimentação do encerramento[MOVBENEF] - Beneficiário : '+
                               aqryProcesso.fieldbyname('NOME').asstring);
          memResult.Lines.Add('Mensagem de erro : '+E.message);
          exit;
        end;
      end;
    end;
  end;

  DesativaProcesso(aqryAux, aqryProcesso.fieldbyname('idtitular').AsInteger);

  if (lidsitbeneficio <> aqryProcesso.fieldbyname('IDSITBENEFICIO').AsInteger) then
  begin
    if lidsitbeneficio = 2 then
    begin
      memResult.Lines.Add('Retenção processada para beneficio: '+
        aqryProcesso.fieldbyname('beneficio').asstring);
      memResult.Lines.Add('Data final prevista: '+lsdatafim);
    end
    else
    begin
      memResult.Lines.Add('Encerramento processado para beneficio: '+
        aqryProcesso.fieldbyname('beneficio').asstring);
      memResult.Lines.Add('Data final: '+lsdatafim);
      
      //BRUNO AZEVEDO SOL KINTANA
      if (RdgTpFolha.ItemIndex = 3) then begin
        memResult.Lines.Add('Motivo: Encerramento de benefício - Resgate parcelado');
      end else if lsMotivoRet = '7' then begin
        memResult.Lines.Add('Motivo: Outros (benefício de prazo determinado)');
      end else begin
        memResult.Lines.Add('Motivo: Completou maioridade');
      end;
      //BRUNO AZEVEDO SOL KINTANA
    end;
  end
  else
    memResult.Lines.Add('Recálculo por encerramento de componente do grupo para beneficio: '+
      aqryProcesso.fieldbyname('beneficio').asstring);
  memResult.Lines.Add('Matrícula: '+aqryProcesso.fieldbyname('matricula').asstring);
  memResult.Lines.Add('Beneficiário: '+aqryProcesso.fieldbyname('nome').asstring);
  //BRUNO AZEVEDO SOL KINTANA
  if not(RdgTpFolha.ItemIndex = 3) then begin
    memResult.Lines.Add('Valor a ser pago no mês: '+formatfloat('#0.00',ldValorNoMes));
  end;
  memResult.Lines.Add('Novo valor do benefício: '+formatfloat('#0.00',ldNovoValor));
  memResult.Lines.Add('------------------------------------------------------------------');

  abcomerro:=false;
  result:=ldValorNoMes;
end;

function TfrmPreparo.ExecutaRegraBeneficioMinimo(
  pidpessjur,
  pidplanoprev,
  pidbeneficio,
  pidtitular,
  pidpessoa: integer;
  psflgcalctodomes: string;
  pdatainicio,
  pdatafinal: tdatetime;
  arValorBenef: real): real;
 var rvalor: real;
     linumBenef: integer;
     lspercentual: string;
     ssqlregra: string;
begin
  rvalor:=0;
  // Executa a Regra de Benefício Mínimo
  if prmVlrBenefMin > 0 then
  begin
    qryBeneficiario.Close;
    qryBeneficiario.ParamByname('pIDTITULAR').asInteger := pidtitular;

    try
      qryBeneficiario.Open;
      linumBenef:=qryBeneficiario.fields[0].asinteger;
    except
      linumBenef:=1;
    end;

    try
      qryPercentual.Close;
      qryPercentual.ParamByname('pIdTitular').asInteger:=pidtitular;
      qryPercentual.ParamByname('pIdPessJur').asInteger:=pidpessjur;
      qryPercentual.ParamByname('pIdPlanoPrev').asInteger:=pidplanoprev;
      qryPercentual.ParamByname('pIdPessoa').asInteger:=pidpessoa;
      qryPercentual.ParamByname('pIdBeneficio').asInteger:=pidbeneficio;
      
      try
        qryPercentual.Open;
        lspercentual:=oranumero(formatfloat('#0.000000', qryPercentual.fields[0].asfloat));
      except
        lspercentual:='100';
      end;

      ssqlregra:=
        'SELECT '+
          //SIMULAR FOLHA DE ABONO PARA A REGRA
          '3 AS FLGTIPOFOLHA, '+_clinefeed+
          '0 AS FLGCONCESSAO, '+_clinefeed+
          inttostr(RdgTpFolha.ItemIndex)+ ' AS TIPOPREPARO, '+_clinefeed+ //SOL111112 - Ádler Souza
          lspercentual+' AS PERCENTUAL, '+_clinefeed+
          inttostr(linumBenef)+' AS NUMBENEF, '+_clinefeed+
          psflgcalctodomes+' AS FLGBENEFCOTAS, '+_clinefeed+
          inttostr(pidpessoa)+' AS IDPESSOA, '+_clinefeed+
          inttostr(pidtitular)+' AS IDTITULAR, '+_clinefeed+
          inttostr(pidpessjur)+' AS IDPESSJUR, '+_clinefeed+
          inttostr(pidplanoprev)+' AS IDPLANOPREV, '+_clinefeed+
          '1 AS SEQPROPOSTA, '+_clinefeed+
          inttostr(pidbeneficio)+' AS IDBENEFICIO, '+_clinefeed+
          OraNumero(FloatToStr(dbValor))+' AS VALORPREV, '+_clinefeed+
          OraNumero(FloatToStr(dbValor))+' AS VALORORIGINAL, '+_clinefeed+
          //PASSAR VALORTOTAL DO BENEFICIO
          OraNumero(sValorTotalBenef)+' AS VALORTOTAL, '+_clinefeed+
          QuotedStr(PegaDataFinal)+' AS DATAREF, '+_clinefeed+
          formatdatetime('DD/MM/YYYY', pdatainicio)+' AS DATAINICIO, '+_clinefeed+
          formatdatetime('DD/MM/YYYY', pdatafinal)+' AS DATAFINAL, '+_clinefeed+
          QuotedStr(sMesReferencia)+' AS MESREFERENCIA, '+_clinefeed+
          QuotedStr(sMesReferencia)+' AS ANOMESREF, '+_clinefeed+
          'ST.FLGINTERNO, '+_clinefeed+
          'DECODE(PP.FLGSALVIRTBENEF,1,PP.SALAUXDOENCA,PP.SALPARTICIPACAO) AS VALORPROVENTO, '+_clinefeed+
          'DECODE(PP.FLGSALVIRTBENEF,1,PP.SALAUXDOENCA,PP.SALPARTICIPACAO) AS SALARIOINTEGRAL '+_clinefeed+
        'FROM PARTPREVPLAN PP, SITPART ST '+_clinefeed+
        'WHERE PP.IDPESSOA = '+inttostr(pidtitular)+' '+_clinefeed+
        'AND PP.IDPLANOPREV = '+inttostr(pidplanoprev)+' '+_clinefeed+
        'AND PP.IDPESSJUR = '+inttostr(pidpessjur)+' '+_clinefeed+
        'AND PP.SEQPROPOSTA = 1 '+_clinefeed;

      //CONTROLAR BENEFICIO DE PLANO DESATIVADO
      if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
        ssqlregra:=ssqlregra+
          'AND PP.FLGDESATIVADO = 0 '+_clinefeed;

      ssqlregra:=ssqlregra+
        'AND ST.IDSITPART = PP.IDSITPART '+_clinefeed;

      qryPreparoContrib.close;
      qryPreparoContrib.SQL.Clear;
      qryPreparoContrib.SQL.Add(sSQLRegra);
      try
        qryPreparoContrib.open;
        if not qryPreparoContrib.isempty then
        begin
          try
            regPreparoContrib.RuleName:=floattostr(prmVlrBenefMin);
            regPreparoContrib.Execute;
            if trim(regPreparoContrib.Result) <> '' then
            begin
              try
                rValor:=strtofloat(clientenumero(trim(regPreparoContrib.Result)));
                if rvalor > 0 then
                  dbValor:=rvalor
                else
                begin
                  memResult.Lines.Add('Valor retornado pela execução da regra de benefício mínimo inválido igual a zero.');
                  memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
                  memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
                end;
              except
                memResult.Lines.Add('Valor retornado pela execução da regra de benefício mínimo inválido.');
                memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
                memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
              end;
            end
            else
            begin
              memResult.Lines.Add('Valor retornado pela execução da regra de benefício mínimo inválido.');
              memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
              memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
            end;
          except
            memResult.Lines.Add('Erro na execução da regra de benefício mínimo.');
            memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
            memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
          end;
        end
        else
        begin
          memResult.Lines.Add('Consulta para regra de benefício mínimo retornou vazio.');
          memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
          memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
        end;
      except
        on E:Exception do
        begin
          memResult.Lines.Add('Erro consulta para regra de benefício mínimo ');
          memResult.Lines.Add('Titular : '+inttostr(iUltIdTitular));
          memResult.Lines.Add('Beneficiario : '+inttostr(iUltIdPessoa));
          memResult.Lines.Add('Mensagem de erro : '+E.Message);
        end;
      end;
    finally
      if rvalor > 0 then
        result:=rValor;
    end;
  end
  else
    result:=arValorBenef;
end;

function TfrmPreparo.GeraAbonoUltimoPgto(
      pidregracalculo,
      pidpessjur,
      pidplanoprev,
      pidplanoorigem,
      pidbeneficio,
      pseqproposta,
      pnumeroprocesso,
      pidsitbeneficio,
      pfontepagadora,
      pcodportforma,
      pflgbeneftemp,
      pidtitular,
      pidpessoa: integer;
      psnomebenef,
      psbeneficio,
      psflgcalctodomes,
      psflgprovisorio,
      psflgdescirmes,
      psflgdevolucao,
      psvaloratual,
      psvalortotal,
      psvalorsrb,
      psvalorcalculado,
      psvalorbase1,
      psvalorbase2,
      psvalorbase3: string;
      pdatainicio,
      pdatafinal: tdatetime;
      pimespgabono: integer;
      prpercentual: real 
 ): real;
 var bErro : boolean;
     sMsgErro : string;
     ssql: string;
     lidseq: integer; 
     lrvalorabono: real;
     lbAbonoMudou: boolean; 
     liseqbeneficio: integer; 
begin
  try
    result:=0;
    if pIdRegraCalculo=0 then
      exit;

    prValorBenef:=strtofloat(ClienteNumero(psvaloratual));

    //executa regra de benefício minimo se existir
    prValorBenef:=ExecutaRegraBeneficioMinimo(
      pidpessjur,
      pidplanoprev,
      pidbeneficio,
      pidtitular,
      pidpessoa,
      psflgcalctodomes,
      pdatainicio,
      pdatafinal,
      prValorBenef);

    bErro:=false;
    sMsgErro:='';

    lrvalorabono:=ExecutaRegraValorAbono(
      DtmFolha.qryAux,
      pIdRegraCalculo,
      pIdPessJur, pIdPlanoPrev, pIdTitular,
      pSeqProposta, pIdPessoa, pIdBeneficio,
      formatdatetime('DD/MM/YYYY', pdatainicio),
      formatdatetime('DD/MM/YYYY', pdatafinal),
      prValorBenef,
      psflgprovisorio,
      bErro, sMsgErro);

    if lrvalorabono < 0.01 then
      exit;

    // VERIFICA SE NO MÊS CORRENTE EXISTIU PAGAMENTO
    //  NA FOLHA DE ABONO ANUAL PARA A PESSOA. CASO TENHA EXISTIDO PAGAMENTO E O
    //  É IGUAL AO CALCULADO NESTE MOMENTO, NÃO LANÇA NADA, NEM O PAGAMENTO DO ABONO
    //  NEM A DEVOLUÇÃO DOS ABONOS AO LONGO DO ANO.
    try
      lbAbonoMudou:=true;
      liseqbeneficio:=0;
      
      if (strtoint(copy(sMesReferencia,6,2))=pimespgabono) then
      begin
        ssql:=
          'SELECT H.VLBENEFPGTO AS VALOR, SEQBENEFICIO '+_clinefeed+
          'FROM HSTBENEFBFCIARIO H '+_clinefeed+
          'WHERE H.MES = '+quotedstr(sMesReferencia)+' '+_clinefeed+
          'AND H.MESREFERENCIA = '+quotedstr(sMesAbono)+' '+_clinefeed+
          'AND H.IDLOTE <> '+inttostr(iIdlote)+' '+_clinefeed+
          'AND H.IDPESSOA = '+inttostr(qryPrinc.fieldbyname('IDPESSOA').asinteger)+' '+_clinefeed+
          'AND H.IDTITULAR = '+inttostr(qryPrinc.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
          'AND H.NUMEROPROCESSO = '+inttostr(qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger)+' '+_clinefeed+
          'AND H.IDBENEFICIO = '+inttostr(qryPrinc.fieldbyname('IDBENEFICIO').asinteger)+' '+_clinefeed+
          'AND H.IDPLANOPREV = '+inttostr(qryPrinc.fieldbyname('IDPLANOPREV').asinteger)+' '+_clinefeed+
          'AND H.IDPLANOORIGEM = '+inttostr(qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger)+' '+_clinefeed+
          'AND H.IDPESSJUR = '+inttostr(qryPrinc.fieldbyname('IDPESSJUR').asinteger)+' '+_clinefeed+
          'AND H.FLGENVIADO = 1 '+_clinefeed+
          'AND H.VLBENEFPGTO IS NOT NULL '+_clinefeed+
          'AND H.IDHSTFOLHABENEF IS NOT NULL '+_clinefeed;

	if FazQuery(qryAux2, ssql) then
        begin
          lbAbonoMudou:=abs(lrvalorabono-qryAux2.fieldbyname('VALOR').asfloat) > 0.01;
          liseqbeneficio:=qryAux2.fieldbyname('SEQBENEFICIO').asinteger;
        end;
      end;
    except
      on E:Exception do
      begin
        memResult.Lines.Add('Erro na busca de Abono Anual pago no mês corrente - Beneficiário : '+
          psnomebenef);
        memResult.Lines.Add('Mensagem de erro : '+E.message);
      end;
    end;

    memResult.Lines.Add('Valor do abono anual calculado para este encerramento: '+formatfloat('#0.00',lrvalorabono));
    if lbAbonoMudou then
    begin
      memResult.Lines.Add('Este valor foi lançado para a Prévia. Busca de valores pagos no ano realizada.');
      inc(liseqbeneficio);

      try
        sSql := 'Insert into HstBenefBfciario '+
                '(IDTITULAR, IDPESSOA, IDPESSJUR, MES, MESREFERENCIA, IDMOTIVO, IDPLANOPREV, '+
                ' NUMEROPROCESSO, SEQPROPOSTA, IDBENEFICIO, IDREGRACALCULO, VALORPREV, VALORCALCULADO, '+
                ' DATAPAGAMENTO, IDLOTE, FLGENVIADO, FONTEPAGADORA, SEQBENEFICIO, CODPORTFORMA, '+
                ' VALORINTEGRAL, VALORTOTAL, VALORSRB, FLGPROVISORIO, FLGDESCIRMES, IDPLANOORIGEM, '+
                ' IDSEQINTERNOFB, '+ 
                ' FLGCONCESSAO, '+ 
                ' VALOROP1, VALOROP2, VALOROP3, FLGDEVOLUCAO, LOTEORIGINAL) '+ //BRUNO AZEVEDO SOL 86089 KINTANA 523183
                ' VALUES ('+inttostr(pidtitular)+
                        ','+inttostr(pIdPessoa)+
                        ','+inttostr(pIdPessjur)+
                        ','+QuotedStr(sMesReferencia)+
                        ','+QuotedStr(sMesAbono)+
                        ','+IntToStr(prmIdMotivoAbono)+
                        ','+inttostr(pIdPlanoPrev)+
                        ','+inttostr(pNumeroProcesso)+
                        ','+inttostr(pSeqProposta)+
                        ','+inttostr(pIdBeneficio);

        if pIdRegraCalculo=0 then
          sSql := sSql + ', NULL '
        else
          sSql := sSql + ',' + inttostr(pIdRegraCalculo);

        sSql := sSql + ',' + oranumero(floattostr(lrValorAbono)) +
                       ',' + oranumero(floattostr(lrValorAbono)) +
                       ',' + 'TO_DATE('+QuotedStr(qryCtrlInterface.fieldbyname('DATAPAGAMENTO').AsString)+',''DD/MM/YYYY'') ';

        if pidsitbeneficio = 2 then
        begin
          sSql := sSql + ', NULL ';
          sIdLoteGravado:='NULL';
        end
        else
        begin
          sSql := sSql + ',' + IntToStr(iIdLote);
          sIdLoteGravado := inttostr(iIdLote);
        end;

        if (pidsitbeneficio = 1) or (pidsitbeneficio = 6) then
          sSql := sSql + ', 0 '
        else
          sSql := sSql + ', 9 ';

        sSql := sSql + ',' +inttostr(pfontepagadora)+
                       ', '+inttostr(liseqbeneficio);

        if pcodportforma = 0 then
          sSql := sSql + ', NULL '
        else
          sSql := sSql + ',' + inttostr(pcodportforma);

        psvalorbase1:=oranumero(psvalorbase1);
        if trim(psvalorbase1) = '' then
          psvalorbase1:='0';
        psvalorbase2:=oranumero(psvalorbase2);
        if trim(psvalorbase2) = '' then
          psvalorbase2:='0';
        psvalorbase3:=oranumero(psvalorbase3);
        if trim(psvalorbase3) = '' then
          psvalorbase3:='0';

        lidseq:=LeUltRegistro(nil,'SEQINTERNOFB');

        sSql:=sSql+
          ', ' + oranumero(floattostr(prValorBenef)) +
          ', ' + oranumero(psvalortotal) +
          ', ' + oranumero(psvalorsrb) +
          ', ' + psflgprovisorio +
          ', ' + psflgdescirmes +
          ', ' + inttostr(pidplanoorigem) +
          ', ' + inttostr(lidseq) + 
          ', 0'+ //FLGCONCESSAO
          ', ' + psvalorbase1 +
          ', ' + psvalorbase2 +
          ', ' + psvalorbase3 +
          ', 0 ' +
          ', ' + sIdLoteGravado + ')'; //BRUNO AZEVEDO SOL 86089 KINTANA 523183

        qryInsHstBfCiario.Sql.Clear;
        qryInsHstBfCiario.Sql.Add(sSql);
        qryInsHstBfciario.ExecSql;
        iBenefAbono:=iBenefAbono+1; 
      except
        on E:Exception do
        begin
          TratarErro(e.Message); //Brunno Mattos - KTN 767861 - SOL 132659
          memResult.Lines.Add(
            'Erro[INCLUSÃO DO ABONO ANUAL NO ENCERRAMENTO DO BENEFÍCIO] - Beneficiário : '+
            psnomebenef);
          memResult.Lines.Add('Mensagem de erro : '+E.message);
        end;
      end;
    end
    else
    begin
      memResult.Lines.Add('Este valor NÃO foi lançado para a Prévia, '+
        'pois o mesmo valor foi pago na Folha de Abono Anual.');
    end;
    
  except
    on E:Exception do
    begin
      memResult.Lines.Add('Erro na geração de Abono Anual - Beneficiário : '+
        psnomebenef);
      memResult.Lines.Add('Mensagem de erro : '+E.message);
    end;
  end;

  if lbAbonoMudou then 
    if ((pflgbeneftemp = 1) and
        SistemaFolha.FlgBuscaAbonoAnteriorPago) or
       //PARA CASOS DE ENCERRAMENTO AUTOMÁTICO SEM SER TEMPORARIO. EX.: PENSÃO
       (strtoint(copy(sMesReferencia,6,2)) > pimespgabono) then
      BuscaAbonoBeneficioTemporario;
end;

procedure TfrmPreparo.btnCommitClick(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.Commit;

  //Jéssica Lana SOL 109421 KINTANA 496332
  //memResult.lines.SaveToFile('c:\preparofolha.txt');
  memResult.lines.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\preparofolha.txt');

  //BRUNO AZEVEDO SOL 140974 KINTANA 889580
  try
     memResult.lines.SaveToFile('\\Avd14261\Publico\Folha\preparofolha.txt');
  except
  end;
end;

procedure TfrmPreparo.bbtnSairClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmPreparo.cboxIndividualClick(Sender: TObject);
begin
  inherited;
  tbsIndividual.tabvisible:=cboxIndividual.checked;
end;

procedure TfrmPreparo.SetFaseGrupoEncerramento(const Value: boolean);
begin
  FFaseGrupoEncerramento := Value;
end;

procedure TfrmPreparo.BuscaAbonoBeneficioTemporario;
var liseqbenef: integer;
    licontseq: integer;
    lsmsgerro: string;
    lslote: string;
    liflgdevolucao: integer;
    lrvalor: real;
begin
  qryaux4.sql.clear;
  qryaux4.sql.add(
    'SELECT H.MES, '+_clinefeed+
    '       DECODE(H.FLGDEVOLUCAO,1,-H.VLBENEFPGTO,H.VLBENEFPGTO) AS VALOR '+_clinefeed+
    'FROM HSTBENEFBFCIARIO H '+_clinefeed+
    'WHERE SUBSTR(H.MES,1,4) = '+quotedstr(inttostr(wAno))+' '+_clinefeed+
    'AND H.MESREFERENCIA = '+quotedstr(inttostr(wAno)+'/13')+' '+_clinefeed+
    'AND H.MES <= '+quotedstr(sMesReferencia)+' '+_clinefeed+ 
    'AND H.IDLOTE <> '+inttostr(iIdlote)+' '+_clinefeed+
    'AND H.IDPESSOA = '+inttostr(qryPrinc.fieldbyname('IDPESSOA').asinteger)+' '+_clinefeed+
    'AND H.IDTITULAR = '+inttostr(qryPrinc.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
    'AND H.NUMEROPROCESSO = '+inttostr(qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger)+' '+_clinefeed+
    'AND H.IDBENEFICIO = '+inttostr(qryPrinc.fieldbyname('IDBENEFICIO').asinteger)+' '+_clinefeed+
    'AND H.IDPLANOPREV = '+inttostr(qryPrinc.fieldbyname('IDPLANOPREV').asinteger)+' '+_clinefeed+
    'AND H.IDPLANOORIGEM = '+inttostr(qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger)+' '+_clinefeed+
    'AND H.IDPESSJUR = '+inttostr(qryPrinc.fieldbyname('IDPESSJUR').asinteger)+' '+_clinefeed+
    'AND H.FLGENVIADO = 1 '+_clinefeed+
    'AND H.VLBENEFPGTO IS NOT NULL '+_clinefeed+
    'AND NVL(H.FLGTIPOREGISTRO,1) IN (0,1) '+_clinefeed+ //BUSCAR APENAS ABONO NORMAL.NÃO INCLUIR ANTECIPAÇÕES
    'AND H.IDHSTFOLHABENEF IS NOT NULL '+_clinefeed);
  qryAux4.Open;

  lrvalor:=0;
  while not qryAux4.eof do
  begin
    lrvalor:=lrvalor+
      qryAux4.fieldbyname('VALOR').asfloat;
    gsMesesPagamentoAbono:=gsMesesPagamentoAbono+
      quotedstr(qryAux4.fieldbyname('MES').asstring)+',';
    qryAux4.next;
  end;

  if TruncaMoeda(abs(lrvalor)) > 0 then
  begin
    if lrvalor > 0 then
      liflgdevolucao:=1
    else
      liflgdevolucao:=0;

    lrvalor:=abs(lrvalor); 

    liSeqBenef:=2;
    licontseq:=0;
    repeat
      InsereHstBfciario(
        qryInsHstBfciario,
        1,
        qryPrinc.fieldbyname('IDTITULAR').asinteger,
        qryPrinc.fieldbyname('IDPESSOA').asinteger,
        qryPrinc.fieldbyname('IDPESSJUR').asinteger,
        qryPrinc.fieldbyname('IDPLANOPREV').asinteger,
        qryPrinc.fieldbyname('IDPLANOORIGEM').asinteger,
        qryPrinc.fieldbyname('IDBENEFICIO').asinteger,
        qryPrinc.fieldbyname('NUMEROPROCESSO').asinteger,
        smesreferencia,
        smesabono,
        qryctrlinterface.fieldbyname('DATAPAGAMENTO').asstring,
        qryPrinc.fieldbyname('SEQPROPOSTA').asinteger,
        liSeqBenef,
        qryPrinc.fieldbyname('IDSITBENEFICIO').asinteger,
        iidlote,
        qryPrinc.fieldbyname('FONTEPAGADORA').asinteger,
        qryPrinc.fieldbyname('CODPORTFORMA').asinteger,
        qryPrinc.fieldbyname('FLGPROVISORIO').asinteger,
        qryPrinc.fieldbyname('FLGDESCIRMES').asinteger,
        liflgdevolucao,
        qryPrinc.fieldbyname('IDREGRACALCULO').asstring,
        floattostr(lrvalor),
        floattostr(lrvalor),
        qryPrinc.fieldbyname('VALORATUAL').AsString,
        qryPrinc.fieldbyname('VALORTOTAL').AsString,
        qryPrinc.fieldbyname('VALORSRB').asstring,
        qryPrinc.fieldbyname('VALORBASE1_BEN').asstring,
        qryPrinc.fieldbyname('VALORBASE2_BEN').asstring,
        qryPrinc.fieldbyname('VALORBASE3_BEN').asstring,
        1, 
        1, 
        0, 
        0, 
        0, 
        '', 
        qryPrinc.fieldbyname('PERCENTUAL').asfloat, 
        lslote);

      Try
        if NaoExisteHSTBENEFBFCIARIO(sSQLValida) then begin // renato visoni SOL 126894 - KINTANA 667862
          Try
          qryInsHstBfciario.ExecSQL;
          //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          Except
            on e:Exception do
            begin
              TratarErro(e.Message);
              Exit;
            end;
          end;
          //Brunno Mattos - KTN 767861 - SOL 132659 Fim
        end;
        iBenefDevAbono:=iBenefDevAbono+1;
        licontseq:=0;
        break;
      Except
        On E:Exception Do
        begin
          inc(licontseq);
          inc(liseqbenef);
          lsmsgerro:=E.Message;
        end;
      end;
    until licontseq = 10;

    if licontseq > 0 then
    begin
      memResult.Lines.Add(
        'Erro ao gravar valor do abono anual já processado para o Beneficiário: '+
        Trim(qryPrinc.fieldbyname('Nome').asstring)+' - Benefício : '+
        Trim(qryPrinc.fieldbyname('Beneficio').asstring));
      memResult.Lines.Add('Matrícula: '+sUltMatricula);
      memResult.Lines.Add('Mensagem de erro : '+lsmsgerro);
      memResult.Lines.Add('----------------------------');
    end;
  end;
end;

procedure TfrmPreparo.BuscaAbonoContribuicaoTemporario;
var lsSql: string;
    liNumRecDevContrib: integer;
    liIdMotivoDevContrib: integer;
    liidcontribdev: integer;
    liidplanodev: integer;
    liIdRubDevContrib: integer;

  function GravaDevolucaoHstContribPrev(aidplanoprev, aidcontribuicao: integer): boolean;
  begin
    try
      lssql:=''''+qryAux4.fieldbyname('MesReferencia').asstring+''''; // MESREFERENCIA
      lssql:=lssql+','+QuotedStr(sMesReferencia);  //MESCOBRANCA
      liNumRecDevContrib:=LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');
      lssql:=lssql+',' +IntToStr(liNumRecDevContrib);
      If (liIdMotivoDevContrib > 0) Then
        lssql := lssql + ', ' + IntToStr(liIdMotivoDevContrib)
      Else
        if RdgTpFolha.ItemIndex <> 0 then
          lssql:=lssql +', '+IntToStr(prmIdMotivoAbono)
        else
          lssql:=lssql +', '+IntToStr(prmIDMOTIVOFOLHABEN);

      if (Trim(qryAux4.fieldbyname('CodPortForma').asstring) <> '') and
         (qryAux4.fieldbyname('CodPortForma').AsInteger > 0) then
        lssql:=lssql+', ' +qryAux4.fieldbyname('CodPortForma').asstring
      else
        lssql:=lssql+', NULL ';

      lssql:=lssql+
        ', TO_DATE('+
          QuotedStr(qryCtrlInterface.fieldbyname('DATAPAGAMENTO').AsString)+
          ',''DD/MM/YYYY'') ';
      lssql:=lssql+', '+
        OraNumero(qryAux4.fieldbyname('VALORRECEBIDO').AsString);
      lssql:=lssql+', '+
        OraNumero(qryAux4.fieldbyname('VALORCALCULADO').AsString); //VALORCALCULADO
      if qryAux4.fieldbyname('IDREGRACALCULO').AsString <> '' then
        lssql:=lssql+', '+
          qryAux4.fieldbyname('IDREGRACALCULO').AsString
      else
        lssql:=lssql+', NULL';

      lssql:=lssql+', '+
        OraNumero(qryAux4.fieldbyname('PERCCALCULO').AsString);

      lssql:=lssql+', 1'; // flgdescfolha
      lssql:=lssql+', '+
        IntToStr(qryAux4.fieldbyname('IdPessoa').AsInteger);
      lssql:=lssql+', '+
        IntToStr(qryAux4.fieldbyname('SeqProposta').AsInteger);
      lssql:=lssql+', '+
        IntToStr(qryAux4.fieldbyname('IdPessJur').AsInteger);
      lssql:=lssql+', '+IntToStr(aidplanoprev);
      lssql:=lssql+', '+IntToStr(aidcontribuicao);
      lssql:=lssql+', 0'; //FLGCALCRESERVA
      if Trim(qryAux4.fieldbyname('ValorBase1').asstring) <> '' then
        lssql:=lssql+', '+
          OraNumero(qryAux4.fieldbyname('ValorBase1').asstring)
      else
        lssql:=lssql+', NULL ';

      if Trim(qryAux4.fieldbyname('ValorBase2').asstring) <> '' then
        lssql:=lssql+', '+
          OraNumero(qryAux4.fieldbyname('ValorBase2').asstring)
      else
        lssql:=lssql+', NULL ';

      if Trim(qryAux4.fieldbyname('ValorBase3').asstring) <> '' then
        lssql:=lssql+', '+
          OraNumero(qryAux4.fieldbyname('ValorBase3').asstring)
      else
        lssql:=lssql+', NULL ';

      try
        if Trim(qryAux4.fieldbyname('DATAINICIO').asstring) <> '' then
          lssql:=lssql+
            ', TO_DATE('''+qryAux4.fieldbyname('DataInicio').asstring+
            ''',''DD/MM/YYYY'') '
        else
          lssql:=lssql+', NULL ';
      except
        lssql:=lssql+', NULL ';
      end;

      try
        if Trim(qryAux4.fieldbyname('DATAFINAL').asstring) <> '' then
          lssql:=lssql+
            ', TO_DATE('''+qryAux4.fieldbyname('DataFINAL').asstring+
            ''',''DD/MM/YYYY'') '
        else
          lssql:=lssql+', NULL ';
      except
        lssql:=lssql+', NULL ';
      end;

      lssql:=lssql+', ''AS'''; // FLGSITFUNDACAO
      if uppercase(sIdLoteGravado) = 'NULL' then  // SITRECEBIMENTO 
        lssql:=lssql+',0 '
      else
        lssql:=lssql+',1 ';
      lssql:=lssql+', ''F'''; // TIPO
      lssql:=lssql+', '+sIdLoteGravado; // Lote gravado no beneficio. É nulo para retidos
      lssql:=lssql+', 0'; // PARCELA
      lssql:=lssql+', NULL'; // VALORECEBIDO
      lssql:=lssql+', NULL'; // DATARECEBIMENTO
      lssql:=lssql +', 0 '; // FLGCONCESSAO
      lssql:=lssql +', 0 '; // FLGEVENTO
      lssql:=lssql +', ''B'''; // FOLHAORIGEM
      lssql:=lssql +', SYSDATE '; // DATAEMISSCOB
      lssql:=lssql +', NULL '; // FLGINTEVENTO
      lssql := lssql + ', '+qryAux4.fieldbyname('FLGDEVOLUCAO').asstring; //FLGDEVOLUCAO

      //Henrique SOl 108902
      lssql := lssql + ','+ RetornaIdTitular(qryAux4.fieldbyname('IdPessoa').AsString,IntTostr(aidplanoprev));


      lsSql:='INSERT INTO HSTCONTRIBPREV ('+_clinefeed+
        'MESREFERENCIA, MESCOBRANCA, '+_clinefeed+
        'NUMRECEBIMENTO, IDMOTIVO, CODPORTFORMA, DATAPREVISAORECE,'+_clinefeed+
        'VALORESPERADO, VALORCALCULADO, IDREGRACALCULO, PERCCALCULO, '+_clinefeed+
        'FLGDESCFOLHA, IDPESSOA, SEQPROPOSTA, IDPESSJUR, IDPLANOPREV, '+_clinefeed+
        'IDCONTRIBUICAO, FLGCALCRESERVA, VALOROP1, VALOROP2, VALOROP3,DATAINICIO, '+_clinefeed+
        'DATAFINAL, FLGSITFUNDACAO, SITRECEBIMENTO, TIPO, IDLOTE, PARCELA, '+_clinefeed+
        'VALORRECEBIDO, DATARECEBIMENTO, FLGCONCESSAO, FLGEVENTO, '+_clinefeed+
        'FOLHAORIGEM, DATAEMISSCOB, FLGINTEVENTO, FLGDEVOLUCAO, IDTITULAR) VALUES ( '+_clinefeed+
        lssql+')';

      qryAux5.Sql.Clear;
      qryAux5.Sql.Add(lssql);
      qryAux5.execsql;
      iContribDevAbono:=iContribDevAbono+1; 
      result:=true;
    except
      On E:Exception Do
      begin
        memResult.Lines.Add(
          'Erro ao gravar o histórico de devolução de contribuição '+
          'sobre adiantamento de abono anual para o Beneficiário : '+
          Trim(qryPrinc.fieldbyname('Nome').asstring)+
          ' - Contribuição ['+
          qryAux4.fieldbyname('IDCONTRIBUICAO').AsString+']: '+
          trim(qryAux4.fieldbyname('Nome').asstring)+'.');
        memResult.Lines.Add('Matrícula: '+sUltMatricula); 
        memResult.Lines.Add('Mensagem de erro : '+E.Message);
        memResult.Lines.Add('----------------------------');
        result:=false;
      end;
    end;
  end;

begin
  if trim(gsMesesPagamentoAbono) = '' then
    exit;
  delete(gsMesesPagamentoAbono,length(gsMesesPagamentoAbono),1);

  try  
    qryAux4.Sql.Clear;
    qryAux4.Sql.Add('SELECT IDMOTIVODEVOLUC FROM PARAMAPREV ');
    qryAux4.Open;
    liIdMotivoDevContrib:=qryAux4.fieldbyname('IDMOTIVODEVOLUC').AsInteger;
    if liIdMotivoDevContrib = 0 then
    begin
      if prmIdMotivoAbono > 0 then
        liIdMotivoDevContrib:=prmIdMotivoAbono
      else
        liIdMotivoDevContrib:=prmIDMOTIVOFOLHABEN;
    end;
    
    qryAux4.Sql.Clear;
    lssql:=
      'SELECT H.MESREFERENCIA, '+_clinefeed+
      '      '+quotedstr(sMesReferencia)+' AS MESCOBRANCA, '+_clinefeed+
      '       H.CODPORTFORMA, '+_clinefeed+
      '      '+QuotedStr(sDataCobranca)+' AS DATACOBRANCA, '+_clinefeed+
      '       SUM(H.VALORRECEBIDO) AS VALORESPERADO, '+_clinefeed+
      '       SUM(H.VALORRECEBIDO) AS VALORCALCULADO, '+_clinefeed+
      '       SUM(H.VALORRECEBIDO) AS VALORRECEBIDO, '+_clinefeed+
      '       H.IDREGRACALCULO, H.PERCCALCULO, H.FLGDESCFOLHA, '+_clinefeed+
      '       H.IDPESSOA, H.SEQPROPOSTA, H.IDPESSJUR, H.IDPLANOPREV, '+_clinefeed+
      '       H.FLGCALCRESERVA, H.DATAINICIO, H.DATAFINAL, H.IDCONTRIBUICAO, '+_clinefeed+
      '       H.VALOROP1 AS VALORBASE1, H.VALOROP2 AS VALORBASE2, '+_clinefeed+
      '       H.VALOROP3 AS VALORBASE3, '+_clinefeed+
      '       H.FLGSITFUNDACAO, H.TIPO, H.IDLOTE, H.PARCELA, '+_clinefeed+
      '       0 AS FLGCONCESSAO, H.FLGEVENTO, H.FOLHAORIGEM, '+_clinefeed+
      '       H.FLGINTEVENTO, '+_clinefeed+
      '       CP.FLGPAGADOR, '+_clinefeed+ 
      '       DECODE(H.FLGDEVOLUCAO,1,0,1) AS FLGDEVOLUCAO, '+_clinefeed+
      '       DECODE(H.FLGDEVOLUCAO,1,CP.IDRUBDECTERC,CP.IDRUBDECTERCDEVOL) AS IDRUB13, C.NOME '+_clinefeed+
      'FROM HSTCONTRIBPREV H, CONTPREV CP, CONTRIBUICAO C '+_clinefeed+
      'WHERE SUBSTR(H.MESCOBRANCA,1,4) = '+QuotedStr(IntToStr(wAno))+' '+_clinefeed+
      'AND H.MESREFERENCIA = '+QuotedStr(IntToStr(wAno)+'/13')+' '+_clinefeed+
      'AND H.MESCOBRANCA IN ('+gsMesesPagamentoAbono+') '+_clinefeed+
      'AND H.MESCOBRANCA <= '+quotedstr(sMesReferencia)+' '+_clinefeed+ 
      'AND H.IDPESSOA = '+IntToStr(iUltIdPessoa)+' '+_clinefeed+
      'AND H.VALORRECEBIDO IS NOT NULL '+_clinefeed+
      'AND H.SITRECEBIMENTO IN (2,4) '+_clinefeed+
      'AND H.FOLHAORIGEM = ''B'' '+_clinefeed+
      'AND H.IDPLANOPREV = CP.IDPLANOPREV '+_clinefeed+
      'AND H.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+_clinefeed+
      'AND C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'+_clinefeed+
      'AND H.IDLOTE <> '+IntToStr(iIdlote)+' '+_clinefeed;

    lssql:=lssql+
      'GROUP BY H.MESREFERENCIA, '+_clinefeed+
      '      H.CODPORTFORMA, '+_clinefeed+
      '      H.IDREGRACALCULO, H.PERCCALCULO, H.FLGDESCFOLHA, '+_clinefeed+
      '      H.IDPESSOA, H.SEQPROPOSTA, H.IDPESSJUR, H.IDPLANOPREV, '+_clinefeed+
      '      H.FLGCALCRESERVA, H.DATAINICIO, H.DATAFINAL, H.IDCONTRIBUICAO, '+_clinefeed+
      '      H.VALOROP1, H.VALOROP2, H.VALOROP3, '+_clinefeed+
      '      H.FLGSITFUNDACAO, H.TIPO, H.IDLOTE, H.PARCELA, '+_clinefeed+
      '      H.FLGEVENTO, H.FOLHAORIGEM, H.FLGINTEVENTO, '+_clinefeed+
      '      CP.FLGPAGADOR, '+_clinefeed+
      '      DECODE(H.FLGDEVOLUCAO,1,0,1), '+_clinefeed+
      '      DECODE(H.FLGDEVOLUCAO,1,CP.IDRUBDECTERC,CP.IDRUBDECTERCDEVOL), C.NOME '+_clinefeed;

    qryAux4.Sql.Add(lssql);
    qryAux4.Open;

    while not qryAux4.eof do
    begin
      if qryAux4.fieldbyname('IDRUB13').AsInteger = 0 then
      begin
        memResult.Lines.Add(
          'Erro: rubrica de pagamento ou devolução de abono anual '+
          'não parametrizada para a contribuição ['+
          qryAux4.fieldbyname('IDCONTRIBUICAO').AsString+']: '+
          trim(qryAux4.fieldbyname('Nome').asstring)+'.'+
          'Beneficiário: '+trim(qryPrinc.fieldbyname('Nome').asstring)+'.');
        memResult.Lines.Add('Matrícula: '+sUltMatricula); 
        qryAux4.next;
        continue;
      end;

      liidcontribdev:=qryAux4.fieldbyname('IdContribuicao').AsInteger;
      liidplanodev:=qryAux4.fieldbyname('IdPlanoPrev').AsInteger;

      if liidcontribdev > 0 then
      begin
        if GravaDevolucaoHstContribPrev(liidplanodev, liidcontribdev) then
        begin
          try
            if qryAux4.fieldbyname('FLGPAGADOR').asstring = 'C' then  
            begin
              liIdRubDevContrib:=qryAux4.fieldbyname('IDRUB13').asinteger;
              inc(lordem); 
              EnviaContribuicao(qryAux4, qryAux4.fieldbyname('VALORRECEBIDO').AsFloat,
                liidplanodev, liidcontribdev,
                iUltIdTitular,
                {1,} lordem, 
                liNumRecDevContrib, 0,
                qryAux4.fieldbyname('FLGDEVOLUCAO').asinteger, //SEMPRE DEVOLUÇÃO
                IntToStr(liIdRubDevContrib),
                liIdMotivoDevContrib 
                );
            end;
          except
            on E:Exception do
            begin
              memResult.Lines.Add(
                'Erro ao enviar cobrança da devolução de contribuição '+
                'sobre abono anual para o Beneficiário : '+
                Trim(qryPrinc.fieldbyname('Nome').asstring));
              memResult.Lines.Add('Matrícula: '+sUltMatricula); 
              memResult.Lines.Add('Mensagem de erro : '+E.Message);
              memResult.Lines.Add('----------------------------');
              qryAux4.next;
              continue;
            end;
          end;
        end;
      end
      else
      begin
        memResult.Lines.Add(
          'Sem contribuição vinculada para lançar devolução sobre '+
          'de abono para o Beneficiário : '+
          Trim(qryPrinc.fieldbyname('Nome').asstring));
        memResult.Lines.Add('Matrícula: '+sUltMatricula); 
        memResult.Lines.Add('----------------------------');
      end;
      qryAux4.next;
    end;
  finally
    gsMesesPagamentoAbono:='';
  end;
end;

function TfrmPreparo.RetornaIdTitular(idPessoa,
  idPlanoPrev: String): String;
 var qryAux : TwwQuery;
 contador : Integer;
begin
contador := 0;
    qryAux := TwwQuery.Create(Nil);
	//Higor Nayde Ferreira SOL 193762 KTN 1849855 Inicio
    qryAux.close;
    qryAux.DatabaseName := 'BaseDados';
    qryAux.sql.Clear;
    qryAux.sql.Add('SELECT count(*) as contador                                        ');
    qryAux.sql.Add('from (SELECT DISTINCT B.IDPESSOA,                                  ');
    qryAux.sql.Add('                      B.IDPLANOPREV,                               ');
    qryAux.sql.Add('                      B.IDPLANOPREV,                               ');
    qryAux.sql.Add('                      B.IDTITULAR,                                 ');
    qryAux.sql.Add('                      B.IDSITBENEFICIO,                            ');
    qryAux.sql.Add('                      DP.NUMSEQUENCIA,                             ');
    qryAux.sql.Add('                      DP.IDPESSOA,                                 ');
    qryAux.sql.Add('                      DP.IDTITULAR                                 ');
    qryAux.sql.Add('        FROM BENEFBFCIARIO B, DEPENTIT DP                          ');
    qryAux.sql.Add('       WHERE B.IDPESSOA    = '+ idPessoa);
    qryAux.sql.Add('         AND B.IDPLANOPREV = '+ idPlanoPrev);
    qryAux.sql.Add('         AND DP.NUMSEQUENCIA = ''0''                               ');
    qryAux.sql.Add('         AND B.IDSITBENEFICIO <> 3                                 ');
    qryAux.sql.Add('            -- AND DP.IDPESSOA = B.IDPESSOA                        ');
    qryAux.sql.Add('         AND DP.IDPESSOA = B.IDTITULAR) Cont                       ');
    qryAux.open;

    contador := StrToInt(qryAux.FieldByname('contador').AsString);
    // Higor Nayde Ferreira SOL 193762 KTN 1849855
    qryAux.close;
    qryAux.sql.Clear;
    //renato visoni SOL 123190 Kintana 621959 - foi colocado um espaço entre os comandos.
    qryAux.sql.Add(' select distinct b.idpessoa, b.idplanoprev, b.idplanoprev, b.idtitular, b.idsitbeneficio ');
    qryAux.sql.Add(' from benefbfciario b ');
    qryAux.sql.Add(' where b.idpessoa ='+ idPessoa);
    qryAux.sql.Add(' and b.idplanoprev ='+ idPlanoPrev);
    
    if (contador > 1) then
       qryAux.sql.Add(' AND B.IDTITULAR <> B.IDPESSOA');
    
    qryAux.sql.Add(' and b.idsitbeneficio <> 3 ');  // Renato Visoni SOL123526 Kintana 620842
    //qryAux.sql.Add('and b.fontepagadora  = 1'); // Renato Visoni SOL123526 Kintana 620842
    qryAux.open;

    // Jéssica Lana SOL 123675 Kintana 620196
    // Result := qryAux.FieldByname('idTitular').asstring;
    if qryAux.FieldByname('idTitular').AsString = '' then begin
      Result := idPessoa;
    end else begin
      Result := qryAux.FieldByname('idTitular').AsString;
    end;
    // Fim Jéssica Lana SOL 123675 Kintana 620196

    FreeAndNil(qryAux);
	// Higor Nayde Ferreira SOL 193762 KTN 1849855 FIM
end;

function TfrmPreparo.NaoExisteHSTBENEFBFCIARIO(sSQL: String): Boolean;
begin
  //Renato Visoni  SOL 126894 - KINTANA 667862
  QryVerifica.Close;
  QryVerifica.SQL.Clear;
  QryVerifica.SQL.Add(sSQL);
  QryVerifica.Open;

  Result := (QryVerifica.FieldByname('qnt').asinteger = 0);

end;

function TfrmPreparo.NaoExisteHSTCONTRIPREV(sSQL: String): Boolean;
begin

end;

procedure TfrmPreparo.GravaHstPercGrupo(idtitular:string;idpessoa:string;idpessjur:string;idplanoprev:string;idbeneficio:string;percentual:string;fontepagadora:string);
var
  sSql : String;
  QryProc :TwwQuery;

  begin
//Thiago Passos SOL 32837  Kintana  660515
    QryProc := TwwQuery.Create(Application);
    QryProc.DataBaseName := 'BaseDados';
    QryProc.close;
    QryProc.SQL.clear;
    //BRUNO AZEVEDO SOL 137382 KINTANA 830194
    sSQL := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO('+IDTITULAR+','+IDPESSOA+','+IDPESSJUR+','+IDPLANOPREV+','+IDBENEFICIO+','+StringReplace(PERCENTUAL,',','.',[])+','+FontePagadora+',NULL,NULL); END;';
//    sSQL := 'DECLARE BEGIN PCK_PREV_HISTORICO_BENEFICIO.PR_GRAVAHSTPERCGRUPO(396717,764652,91008,66,162,100,1,NULL,NULL); END;';
    QryProc.SQL.Add(sSQL);
    QryProc.ExecSQL;
//    dtmBaseDados.dbBaseDados.Commit;
    FreeAndNil(QryProc);

end;




end.
{==============================================================================|
| UNIT: FPREPARO                                                               |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   IMPLEMENTA O PREPARO DE BENEFÍCIOS EM MANUTENÇÃO NA FOLHA DE BENEFÍCIOS,   |
| NUM DETERMINADO MÊS. FUNÇÕES:                                                |
| - BENEFÍCIOS ATIVOS OU RETIDOS NA VIGÊNCIA DA DATAFINAL OU DATAFINALPREVISTA |
| - GRAVAR HISTÓRICO DE BENEFÍCIO A SER PAGO NO MÊS.                           |
| - CALCULA AS CONTRIBUIÇÕES ASSOCIADAS                                        |
| - REAJUSTA O BENEFÍCIO SE ESTIVER NUM MÊS DE REAJUSTE.                       |
| - ENCERRA OS BENEFÍCIOS COM DATAFINAL NO MÊS                                 |
| - RETEM OS BENEFICIOS COM DATAFINALPREVISTA NO MÊS                           |
| - O ENCERRAMENTO PARA GRUPO FAMILIAR GERA NOVO RATEIO.                       |
| - GERA SALÁRIO VIRTUAL                                                       |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIU-SE O CAMPO FLGCONCESSAO NA QUERY PASSADA PARA A REGRA DE CALCULO   |
| DE CONTRIBUIÇÃO.                                                             |
| - COLOCOU-SE NA CONSULTA PASSADA PARA A REGRA DE REAJUSTE AS OPÇÕES DO PAR-  |
| TICIPANTE E AS OPÇÕES DO BENEFICIÁRIO, SENDO QUE ESTAS FORAM CRIADAS NA      |
| TABELA DEPENTIT. OBS: A REGRA DE REAJUSTE RECEBE NO CAMPO VALORATUAL O VALOR |
| TOTAL DO BENEFÍCIO. DEVE-SE FUTURAMENTE FAZER ESTE ACERTO POR QUESTÃO DE     |
| CONSISTÊNCIA DE DADOS, EM CONJUNTO COM O ADMPREV.                            |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: Ricardo Vigorito                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/01/2004  A 07/01/2004                        |
| Pendência : 15568                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusão da rotina de cobraça da contribuição  do Patrocinadora            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/02/2002 A 18/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12c                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR CAMPO DATAMORTE DO PARTICIPANTE NA CONSULTA PASSADA PARA A REGRA   |
| DE REAJUSTE.                                                                 |
| - COLOCAR CAMPO FLGBENEFCOTAS (BENEFPLANPREV.FLGCALCTODOMES) NA CONSULTA     |
| PASSADA PARA A REGRA DE CALCULO DE PENSAO.                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/03/2002 A 08/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12e                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Alteração para permitir que o preparo "prepare"os beneficios retidos     |
|     mesmo após a datafinalprevista, com excessão dos beneficios temporarios  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2002 A 26/06/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13c                                              |
| CLIENTE: (FUNCEF E FCRT)                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - TRATAR A GRAVAÇÃO DO SRB.                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13G                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - RETIREI A DIRETIVA DE COMPILAÇÃO "OLDPLANO", DEVIDO A UM ERRO QUE OCORREU  |
|   NO PREPARO DA FOLHA MENSAL DE JULHO/02 NA CBS                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/07/2002 A 19/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13G                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alterei a procedure PassoProcessoBeneficio para passar o valor do salario  |
|   virtual (SALAUXDOENCA) na funcao de reajuste do salario virtual            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/08/2002 A 14/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DA QRYCONTRIBINDIVIDUAL PARA SUPORTAR ULTMESPREPARO NULO.        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/08/2002 A 15/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DO VALORINTEGRAL NA CONSULTA PARA A REGRA DE ULTIMO PAGAMENTO DE  |
| CONTRIBUIÇÃO.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/08/2002 A 27/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - TRATAR IDSITBENEFICIO = 6 PARA BENEFICIO DE INSS                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/10/2002 A 11/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - GRAVAR OPÇÕES NA HSTBENEFBFCIARIO                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/10/2002 A 15/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CÁLCULO DE CONTRIBUIÇÃO DE PENSIONISTA (PENDENCIA 5907)                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/11/2002 A 18/11/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.14M                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Pendência 3313 - cancelamento automático de benefício de filho ao atingir a  |
|   maioridade.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: SIDNEI MARINS                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/11/2002 A 14/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA QUERY PRINCIPAL DE CONTRIBUIÇÃO PARA PREPARO DE ABONO ANUAL.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/11/2002 A 19/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PERMITIR CALCULO DE CONTRIBUIÇÃO QUANDO EXISTEM 2 NUMEROS DE PROCESSO.     |
| PENDENCIA 6614.                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/11/2002 A 20/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PERMITIR O PREPARO DE BENEFÍCIO QUANDO O VALOR DO BENEFÍCIO É ZERO.        |
| PENDENCIA 10542.                                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/11/2002 A 22/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   GRAVAR CAMPO FOLHAORIGEM NA TABELA HSTCONTRIBPREV COM VALOR 'B'.           |
| PENDENCIA 10581.                                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/11/2002 A 26/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - EXECUTAR A REGRA DE BENEFICIO MINIMO NA FOLHA DE ABONO                     |
| PENDENCIA 10656                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/01/2003 A 16/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Abertura das rubricas de contribuição para os casos de ação judicial       |
| Pendencia 11167.
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/02/2003 A 07/02/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03b                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PEND 11962 - COLOCAR INFORMAÇÕES IDPESSOA, IDPESSJUR, IDPLANOPREV E          |
| SEQPROSPOSTA NA QUERY PARA A REGRA DE RATEIO.                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/02/2003 A 12/02/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03d                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PENDENCIA 11162 - DESATIVAR O PROCESSO DE BENEFICIO SE NÃO EXISTIR MAIS      |
| BENEFÍCIOS ATIVOS, AO SE FAZER UM ENCERRAMENTO AUTOMÁTICO.                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/03/2003 A 18/03/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03Q                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PEND. 11691. USAR O FLGDATAABONO DA BENEFPLANPREV ONDE ZERO INDICA DIB DO    |
| INSS E 1 INDICA DIB DA SUPLEMENTAÇÃO NA CONSULTA PASSADA PARA A REGRA DE     |
| CALCULO DO ABONO ANUAL DO INSS.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/03/2003 A 31/03/2003                         |
| PENDÊNCIA: 13591                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03S                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| COLOCAR A INFORMAÇÃO PERCENTUAL NAS QUERYS PASSADAS PARA AS REGRAS DE RATEIO,|
| PRIMEIRO E ÚLTIMO PAGAMENTO DOS BENEFÍCIOS DE PENSÃO, QUANDO DO ENCERRAMENTO |
| DE UM BENEFICIÁRIO DO GRUPO FAMILIAR.                                        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/03/2003 A 01/04/2003                         |
| PENDÊNCIA: 13598                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| ALTERAÇÃO NA ROTINA DE ENCERRAMENTO PARA RECALCULAR O VALORES UTILIZANDO O   |
| VALOR ATUAL DE CADA BENEFICIARIO.                                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/04/2003 A 03/04/2003                         |
| PENDÊNCIA: 13680                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04A                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| NO ENCERRAMENTO DE BENEFICIARIO QUANDO UM BENEFICIARIO QUE TEM DATA FINAL    |
| NÃO ESTÁ EXECUTANDO A REGRA DE PRIMEIRO PAGAMENTO.                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/05/2003 A 26/05/2003                         |
| PENDÊNCIA: 14144                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - EFETUAR OS CALCULOS PRO RATA SE REGRAS DE PRIMEIRO E ULTIMO PAGAMENTO NÃO  |
| ESTIVEREM PARAMETRIZADAS, NO ENCERRAMENTO DE BENEFÍCIO.                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/06/2003 A 23/06/2003                         |
| PENDÊNCIA: 14327                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06C                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA ROTINA DE EXECUÇÃO DO RECÁLCULO DE BENEFÍCIO PARA QUE SEJA    |
| EFETUADO MESMO QUE A OCORRA APENAS O REAJUSTE DO INSS.                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2003 A 26/06/2003                         |
| PENDÊNCIA: 14375                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06K                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - TRATA ENCERRAMENTO E RETENÇÃO DE INSS                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2003 A 26/06/2003                         |
| PENDÊNCIA: 14382                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06K                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ABRIR A TELA COM A OPÇÃO DE BENEFICIO DE REFERENCIA MARCADA.               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/07/2003 A 07/07/2003                         |
| PENDÊNCIA: 14350                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07A                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR OS PROCESSOS E QUERYS PARA MULTIFUNDAÇÃO.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/07/2003 A 08/07/2003                         |
| PENDÊNCIA: 14461                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - TRATAMENTO Do PREPARO DOS BENEFÍCIOS RETIDOS NA FOLHA DE ABONO ANUAL.      |
| PENDENCIA RECUSADA POIS O TRATAMENTO PARA COLOCAR BENEFICIO PREPARADO NA     |
| FOLHA DE ABONO ANUAL É REALIZADO PELO CAMPO FLGSTATUS DA BENEFBFCIARIO.      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/07/2003 A 21/07/2003                         |
| PENDÊNCIA: 14622                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07q                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - APLICAR O FILTRO INDIVIDUAL PARA O CANCELAMENTO AUTOMÁTICO DE DEPENDENTES  |
| QUE EXECUTA A REGRA DE ELEGIBILIDADE.                                        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/08/2003 A 13/08/2003                         |
| PENDÊNCIA: 14840                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - AJUSTE NO CÁLCULO DE CONTRIBUIÇÃO DE PENSIONISTA.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:  FERNANDO JORGE                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/08/03     A  15/08/03                        |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:  ALTERACOES PROVISORIAS E EMERGENCIAIS PARA      |
| RODAR O PREPARO DA FUNCEF                                                    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: RICARDO O. C. VIGORITO                                        |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/01/2004 A 06/01/2004                         |
| PENDÊNCIA: 15568                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  TODOS                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: FOI CRIADO A OPÇÃO DE GERAÇÃO  DAS COBRANÇAS DE  |
|CONTRIBUIÇÕES DAS PATROCINADORAS                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/01/2005 A 31/01/2005                         |
| PENDÊNCIA: 18553                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.01                                               |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PARA OS BENEFÍCIOS RETIDOS O FLGENVIADO FICOU GRAVADO COM ZERO NA          |
| HSTBENEFBFCIARIO, PORQUE A COMPARAÇÃO DO LOTE USAVA NULL EM MINÚSCULAS.      |
| ESTE É UM EXEMPLO DE CONDIÇÃO FRACA, QUE INDUZ ERRO NA MANUTENÇÃO DE FONTE   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2005 A 24/06/2005                         |
| PENDÊNCIA: 19341                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.05b                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Coloquei na query principal o campo dibbenefant, |
|                             quando for reajuste de inss.                     |
|                                                                              |
|------------------------------------------------------------------------------}
