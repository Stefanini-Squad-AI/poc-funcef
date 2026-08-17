// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)     :  Jéssica Lana Nunes dos Santos
// Data         :  05/03/2009
// Pendência    : SOL 109421 KINTANA 496332
// Descricao    :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/11/2006
// Pendencia   : 23770
// Rotina      : InsereBeneficio
// Descricao   : Acerto no tratamento do planoOrigem no caso de novo beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/11/2006
// Rotina      : AcertaBeneficioTransfPlano
// Descricao   : Acerto para tratar abono
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 30/10/2006 - 31/10/2006
// Descricao   : Alteração da fonte de dados do grid de "beneficios para concessão"
//               para CDS pois sem ele não conseguiamos controlar a ordenação e a
//               FUNCEF necessita que o BUA venha em primeiro lugar.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendencia   : 23614
// Data        : 25/10/2006
// Descricao   : Acertar desfazer BENEFPLANOPART
// Pendencia   :
// Data        : 24/10/2006
// Descricao   : Passar novos campos para a query de calculo
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : AssociaReservas, qryReservaPart e updReservaPart
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//             ***************************************************************
//             *****  ATENÇÃO AO DAR MANUTENÇÃO NO updReservaPart:       *****
//             *****  A passagem do campo foi implementada diretamente   *****
//             *****  no UpdateSQL                                       *****
//             ***************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendencia   : 23573
// Data        : 19/10/2006
// Descricao   : Passar DATAEVENTO para query de calculo 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/09/2006
// Descricao   : Incluir IDSITPLANOPREV na query de Plano Contabil
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Rotina      : bbtnProcurarClick
// Data        : 24/08/2006
// Pendencia   : 22709
// Descrição   : Correção na visualização da situação do participante.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Rotina      : bbtnProcurarClick, bbtnConfirmarClick, FormShow, InsereParticipante, cmbSitPartDestEnter e tbloteShow
// Data        : 04/07/2006
// Pendencia   : 22709        
// Descrição   : Inserção do campo NOVA SITUAÇÃO DO PARTICIPANTE NA FUNDAÇÃO.
//------------------------------------------------------------------------------
// Autor       : Leo
// Rotina      : InsereBeneficios
// Data        : 10/04/2006
// Pendencia   : 22051 e 22057
// Descrição   : Verifica se existem pendências de pagamentono plano origem. Caso sim, avisar e parar procedimento.
//------------------------------------------------------------------------------
// Autor       : Leo
// Rotina      : InsereBeneficios
// Data        : 08/03/2006
// Pendencia   : 21279
// Descrição   : executar as regras de parametrização contábil individual no novo plano
//------------------------------------------------------------------------------
// Autor       : Leo
// Rotina      : InsereBeneficios
// Data        : 24/02/2006
// Pendencia   : 21640
// Descrição   : inserir o HSTRBENEFBFCIARIO do INSS com o mesmo PLANOORIGEM inserido na BENEFBFCIARIO
//------------------------------------------------------------------------------
// Autor       : Leo
// Rotina      : DesfazTransfPlano
// Data        : 15/02/2006
// Pendencia   : 21499
// Descrição   : alteração do desfazer para não reativar benefícios que estavam encerrados ou suspensos no momento
//               da transferência. 
//------------------------------------------------------------------------------
// Autor       : Leo
// Rotina      : dfm, MontaQueryDet, InsereBeneficios
// Data        : 06/02/2006
// Pendencia   : 21321
// Descrição   : Inclusão do checkbox chkManterInss e do respectivo tratamento na abertura da query
//               principal para cáuclo de benefício, qrydet, para caso o usuário deseje manter os valores do INSS,
//               o sistema apenas faça uma transposição dos valores existentes. (Essa opção NECESSITA do histórico anterior, ela apenas
//               faz a transposição)
//------------------------------------------------------------------------------
// Autor       : Leo
// Rotina      : AcertaBeneficioTransfPlano
// Data        : 03/02/2006
// Pendencia   : 21473
// Descrição   : acrescentei a crítica "or (qrygrava.recordcount = 0 )" na verificação de registros que devem ser
//               acertados.
//               Caso não encontre nenhum registro no benefício de origem, não precisa acertar pois o registro
//               de pagamento no novo plano já foi gerado no PreparaBeneficio.
//------------------------------------------------------------------------------
// Autor       : Leo
// Rotina      : DesfazTransfPlano
// Data        : 02/02/2006
// Pendencia   : 21444
// Descrição   : o sistema só estava buscando processos de benefícios após a data de regsitro, porém,
//               o sistema registra a data de processo igual a do benef. original, que é anterior
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 26/07/2005
// Pendencia   : 19354
// Rotina      : AcertaBeneficioTransfPlano
// Descrição   : acerto na crítica para não criar registro de acerto após o último pagamento
//               do benefício de origem, quando então, só existe benefício destino.
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 25/07/2005
// Pendencia   : 19354
// Rotina      : ModificaPreparosExcedentes
// Descrição   : modificação na exclusão de registros nulos
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 24/03/2005
// Pendencia   : 18697
// Descrição   : Acertos no calculo da DATAFINAL do beneficio NOVO
// Data        : 09/03/2005
// Descrição   : Inclusão do Origem 7 para migração de planos
// Data        : 02/06/2005 - 06/06/2005
// Pendencia   : 18123
// Descrição   : Migrar o Nucleo Familiar completo quando um dos membros migrarem
// Data        : 06/06/2005
// Pendencia   : 19379
// Descrição   : Acerto na atualização do PROCESSOBENEF quando desfazer migração 
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 03/03/2005
// Rotina      : ModificaPreparosExcedentes
// Descrição   : retirei a cláusula que igualava o MES = MESREFERENCIA  na atualização da HSTBENEFBFCIARIO
//               dos registros excedentes
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 24/02/2005
// Rotina      : MontaDemonstrativoIndiv
// Descrição   : acerto no demonstrativo de contribuições para beneficiários
//               o FLGDESCONTO estava fixo com valor 0(zero)
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 23/02/2005
// Rotina      : DesfazTransfPlano
// Descrição   : delete histmovreserva
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 22/02/2005
// Rotina      : Ace9rtaBeneficioTransfPlano
// Descrição   : acerto da verificação de registros para acerto
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 22/02/2005
// Rotina      : AcertaBeneficioTransfPlano
// Descrição   : acerto da verificação de registros para acerto
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 18/02/2005
// Rotina      : AcertaBeneficioTransfPlano
// Descrição   : retirei comentário feito em 20/07 pois se não existe
//               pagamento feito no origem, o certo já foi feito pelo cálculo do benefício
//               e caso passe nesse ponto, uma duplicação será gerada
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 06/01/2005
// Rotina      : geral
// Descrição   : retirei a opção de "Migrar Apenas o Beneficiário Selecionado"
//               a função só está preparada para migrar cada beneficiário de cada vez.
//               caso a opção estivesse desmarcada, contrário do padrão, a função apenas
//               inseria o titular, erradamente, da Partprevplan com outro plano.
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 24/11/2004
// Rotina      : InsereBeneficios  (mais acessórios)
// Descrição   : recálculo da datafinal nos benefícios novos
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 12/11/2004
// Rotina      : 17305
// Descrição   : Acerto nos campos IDSITPLANO... da EVENTOSPREV
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 21.10.2004
// Rotina      : geral
// Descrição   : retirei o IDPLANPREVCONTAB fixo em 25 e coloquei como o plano origem
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 07.10.2004
// Pendência   : 17888
// Rotina      : qryDadosPlanoOrigem
// Descrição   : Acrescentei filtro para só considerar beneficios ativos ou retidos
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 07.10.2004
// Rotina      : DesfazTransfPlano
// Descricao   : correção da volta da situação no plano orgem. Estava selecionano o plano destino....
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 24.09.2004
// Rotina      : VerificaMigraPlanoEmprestimo
// Descricao   : acertos na função que não estava sensibilizano o empréstimo.
//               troquei a cláusula IN ('A','E') para sem crítica (o empréstimo não está preparado para tratar particvipantes em mais de um plano)
//               segundo o André, caso ele mude, todos os contratos devem ter o plano mudado
//
//               e troquei a valoração IDCONTRATOEMPTMO').AsInteger para AsFloat pois o valor do campo ultrapassava
//               o limite do integer, ficando inválido
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 09.09.2004
// Rotina      : InsereBeneficios
// Descricao   : coloca a data inicio como o primeiro dia do mês do lote de pagamento
//caso o benefício seja de pagamento único, pois a rotina PreparaBeneficioConcedido na UBENEFICIO
//coloca A DATA FINAL e MESREFERENCIA igual a data de inicio para estes casos
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 02.09.2004
// Rotina      : ----
// Descricao   : Melhoria nas mensagens da associacao de beneficios para
//               facilitar identificao do problema
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 02/09/2004
// Rotina      : AssociaReservas
// Descricao   : retira crítica de duplicação
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 24/08/2004
// Rotina      : Varias
// Descricao   : Manter dados do beneficios de origem caso migrando INSS
//               Demonstrar o valor atual do beneficio
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 20.08.2004
// Rotina      : InsereParticipante
// Descrição   : inclui o campo FLGFITESPECIAL
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 13/08/2004
// Descricao   : Gravar na BENEFBFCIARIO os valores dos beneficios após os reajustes
// Data        : 03/08/2004
// Descricao   : Acerto no caso de dois beneficios terem o mesmo destino
// Data        : 27/07/2004
// Descricao   : Não fazer acerto para o mes do Lote.
// Data        : 20/07/2004
// Descricao   : Acertar tbm caso a origem do beneficio estiver zerada no mes de referencia
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 19.07.2004
// Pendência   : 17199
// Rotina      : TransfPlano
// Descrição   : Criacao da rotina VerificaMigraPlanoEmprestimo para atualizar
//               campos na tabela de contrato de emprestimo
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 07/07/2004
// Descricao   : Incluir percentual na regra de calculo do beneficio tranferido
//               Novo tratamento para IDPLANOORIGEM
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 27/05/2004 - 28/05/2004
// Rotina      : Todas
// Descricao   : Permitir migração de um beneficio para participante migrados que
//               possuem beneficios no plano antigo... eu sei que é viajem mas
//               aconteceu aqui na FUNCEF!
// Data        : 01/06/2004
// Descricao   : Atualizar corretamente a Data de Inscricao na fundação
// Data        : 03/06/2004
// Descricao   : Tratamentos para migração do INSS
// Data        : 16/06/2004
// Descricao   : Tratamentos calculo de abono
// Data        : 05/07/2004
// Descricao   : Volta do PlanoOrigem
//               Retirada do comentario no IDPESSOA
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 10/05/2004
// Pendencia   : 16749
// Rotina      : TransfPlano
// Descricao   : filtrar query passada para elegibilidade pois está passando
//               mais de uma linha para o caso da pessoa já ter trocada de
//               patrocinadora
//------------------------------------------------------------------------------

unit FEventoTransfPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, Db, DBTables, Wwquery, MontaSelect, URegra, wwdblook,
  Gauges, UConsPart, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, TB97Tlwn, Wwdatsrc,
  DBCtrls, Mask, MskEdDlg, UCtrlLancamento, DBGrids, DBClient, Provider;

type
  TFrmEventoTransfPlano = class(TfrmOkCancelar)
    Panel1: TPanel;
    MontaSelectPart: TMontaSelect;
    SaveDlg: TSaveDialog;
    qryAux: TwwQuery;
    Splitter1: TSplitter;
    Label11: TLabel;
    pnlInformacao: TPanel;
    qryGrava: TwwQuery;
    regracalc: TRegra;
    qrydet: TwwQuery;
    qrymov: TwwQuery;
    qrysitplanoprev: TwwQuery;
    qrysitplanoprevorigem: TwwQuery;
    qryPatroPlano: TwwQuery;
    qryContrib: TwwQuery;
    qryParticipanteOrigem: TwwQuery;
    qryLote: TwwQuery;
    qryDadosNoPlanoOrigem: TwwQuery;
    MontaSelectBenef: TMontaSelect;
    pgctrop: TPageControl;
    tbindividual: TTabSheet;
    tblote: TTabSheet;
    GroupBox3: TGroupBox;
    lblCampoBusca: TLabel;
    lblnome: TLabel;
    lblPlanoOrigem: TLabel;
    lblInscricaoData: TLabel;
    lblSitPart: TLabel;
    lblBeneficio: TLabel;
    lblFalecido: TLabel;
    lblDataTransacao: TLabel;
    Panel2: TPanel;
    ConsPart1: TConsPart;
    bbtnProcurar: TBitBtn;
    bbtnOpcoes: TBitBtn;
    memReserva: TMemo;
    rdgrpOpPart: TRadioGroup;
    Label10: TLabel;
    lblPatroDest: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    dtEvento: TCMDateTimePicker;
    edPlano: TEdit;
    cmbsitdest: TwwDBLookupCombo;
    cmbsitorig: TwwDBLookupCombo;
    dblkpNovoPlano: TwwDBLookupCombo;
    qrybeneficios: TwwQuery;
    dsbeneficios: TwwDataSource;
    qrybenefnaoconcedidos: TwwQuery;
    dsbenefnaoconcedidos: TwwDataSource;
    updbeneficios: TUpdateSQL;
    qrybeneficiosIDPLANOPREV: TFloatField;
    qrybeneficiosIDBENEFICIO: TFloatField;
    qrybeneficiosVALORBASE1: TFloatField;
    qrybeneficiosVALORBASE2: TFloatField;
    qrybeneficiosVALORBASE3: TFloatField;
    qrybeneficiosNOME: TStringField;
    qrybeneficiosNOMEANT: TStringField;
    qrybeneficiosIDBENEFORIGEM: TFloatField;
    chkSoBeneficiario: TCheckBox;
    btnbeneficios: TBitBtn;
    Label1: TLabel;
    edarqmat: TEdit;
    btnbuscaarq: TSpeedButton;
    odTxt: TOpenDialog;
    memdesc: TMemo;
    qryPlanOrigem: TwwQuery;
    Label2: TLabel;
    dblkPlanoOrigem: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    Label19: TLabel;
    dblkPatroDestino: TwwDBLookupCombo;
    dspatro: TDataSource;
    qryMovReservaTemp: TwwQuery;
    updMovReservaTemp: TUpdateSQL;
    qrybeneficiosIDTPPAGTOBENEFIC: TFloatField;
    qrybeneficiosSETA: TStringField;
    tbdockDemons: TToolWindow97;
    Panel5: TPanel;
    Bevel2: TBevel;
    Panel6: TPanel;
    Panel7: TPanel;
    BitBtn2: TBitBtn;
    pgMem: TPageControl;
    tbErros: TTabSheet;
    tbMem: TTabSheet;
    bbtnSalvar: TBitBtn;
    bbtnImprimir: TBitBtn;
    memResult: TRichEdit;
    memErros: TRichEdit;
    SaveDialog1: TSaveDialog;
    btnDemons: TBitBtn;
    cbchkCommit: TCheckBox;
    btnEfetivar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    printdlg: TPrintDialog;
    qrybeneficiosNOMEVALORBASE1: TStringField;
    qrybeneficiosNOMEVALORBASE2: TStringField;
    qrybeneficiosNOMEVALORBASE3: TStringField;
    qrybeneficiosIDEVENTOGERADOR: TFloatField;
    qryContaBancaria: TwwQuery;
    qryTotalRecebedor: TwwQuery;
    updTotalRecebedor: TUpdateSQL;
    updReservaPart: TUpdateSQL;
    qryReservaPart: TwwQuery;
    btnDesfazer: TBitBtn;
    pgbar: TProgressBar;
    tb97Param: TToolWindow97;
    pnlTextoFluxOper: TPanel;
    Bevel1: TBevel;
    pnlparam: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    grpbxvlraceite: TGroupBox;
    Label5: TLabel;
    Label3: TLabel;
    dblkpcmbLote: TwwDBLookupCombo;
    dtNovaDib: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    lstbenefnconcedidos: TDBLookupListBox;
    GroupBox2: TGroupBox;
    pnlopcoesbenef: TPanel;
    lblvalorbase1: TLabel;
    lblvalorbase2: TLabel;
    lblvalorbase3: TLabel;
    rdedvalorbase1: TDBRealEdit;
    rdedvalorbase2: TDBRealEdit;
    rdedvalorbase3: TDBRealEdit;
    edOpcao1: TcmMaskEditDlg;
    edOpcao2: TcmMaskEditDlg;
    edOpcao3: TcmMaskEditDlg;
    wwDBGrid1: TwwDBGrid;
    Panel8: TPanel;
    Panel4: TPanel;
    btnRetirar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qrybeneficiosIDREGRACALCOP1: TFloatField;
    qrybeneficiosIDREGRACALCOP2: TFloatField;
    qrybeneficiosIDREGRACALCOP3: TFloatField;
    qrybeneficiosIDRGCALCBENEFICIO: TFloatField;
    chkManterValores: TCheckBox;
    qrybeneficiosDESTINOPAG: TStringField;
    qrybeneficiosIDPLANPREVCONTAB: TFloatField;
    tb97Contrib: TToolWindow97;
    Panel9: TPanel;
    Bevel3: TBevel;
    Panel10: TPanel;
    Panel11: TPanel;
    bbtnSairContrib: TBitBtn;
    GroupBox6: TGroupBox;
    Panel12: TPanel;
    edOpcao1Contrib: TcmMaskEditDlg;
    edOpcao2Contrib: TcmMaskEditDlg;
    edOpcao3Contrib: TcmMaskEditDlg;
    dbgrdContribAssoc: TwwDBGrid;
    Panel13: TPanel;
    dsContribuicoes: TwwDataSource;
    qryContribuicoes: TwwQuery;
    dbedNomeOpcao1Contrib: TDBText;
    dbedNomeOpcao2Contrib: TDBText;
    dbedNomeOpcao3Contrib: TDBText;
    bbtnContribuicoes: TBitBtn;
    updContribuicoes: TUpdateSQL;
    qryAux2: TwwQuery;
    qrybeneficiosDATAINICIOANT: TDateTimeField;
    qryRegraParcela: TwwQuery;
    dblkpcmbRegraParcela: TwwDBLookupCombo;
    Label24: TLabel;
    Bevel4: TBevel;
    qrybeneficiosFLGREFERENCIA: TFloatField;
    qrybeneficiosIDREGRAFIM: TFloatField;
    chkManterInss: TCheckBox;
    Label6: TLabel;
    cmbSitPartDest: TwwDBLookupCombo;
    qrySitPartDestino: TwwQuery;
    PrvBeneficiosParaConcessao: TDataSetProvider;
    CdsBeneficiosParaConcessao: TClientDataSet;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TiraIconeSql;
    procedure SpeedButton2Click(Sender: TObject);
    procedure cmbsitorigEnter(Sender: TObject);
    procedure cmbsitdestEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpNovoPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnbeneficiosClick(Sender: TObject);
    procedure btnbuscaarqClick(Sender: TObject);
    procedure dblkPlanoOrigemEnter(Sender: TObject);
    procedure dblkPlanoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPatroDestinoEnter(Sender: TObject);
    procedure dblkPatroDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpNovoPlanoEnter(Sender: TObject);
    procedure dblkpcmbLoteEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure btnDemonsClick(Sender: TObject);
    procedure btnEfetivarClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure edOpcao1BtnClick(Sender: TObject);
    procedure edOpcao1Change(Sender: TObject);
    procedure edOpcao2Change(Sender: TObject);
    procedure edOpcao2BtnClick(Sender: TObject);
    procedure edOpcao3Change(Sender: TObject);
    procedure edOpcao3BtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpcmbLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnSairContribClick(Sender: TObject);
    procedure bbtnContribuicoesClick(Sender: TObject);
    procedure pgctropChange(Sender: TObject);
    procedure qryContribuicoesBeforeScroll(DataSet: TDataSet);
    procedure qryContribuicoesAfterScroll(DataSet: TDataSet);
    procedure cmbSitPartDestEnter(Sender: TObject);
    procedure tbloteShow(Sender: TObject);
    procedure CdsBeneficiosParaConcessaoAfterScroll(DataSet: TDataSet);
  private

    CtrlLancamento          : TCtrlLancamento; 
    sFlgInternoDepois ,  sFlgInternoAntes,
    sIdSitPartAntes,    sIdSitPartDepois,   sIdSitFuncAntes,
    sIdSitFuncDepois,    sIdSitPlanAntes ,   sIdSitPlanDepois, sCampoBusca, sNome,
    sMatriculaCorrente, sNomeCorrente, sSalParticipacao, sIdNucleoFamiliar  : String;

    { Private declarations }
    bFlgIntContab, bParticipanteMigrado          : boolean;

    rOpcao1,
    rOpcao2,
    rOpcao3,
    rOpcao4,
    rOpcao5,
    rOpcao6    : real;

    sContTransf            : string;
    bDesAssociaContTransf  : boolean;
    sFlgInternoSitPart,
    sAutoNumInscTransf,
    sIdSitPlanoOrigem, sIdSitPlanoOrigemNovo, 
    sNumInscDestino         : string;
    iIdEventoPrevOrig,
    iIdEventoPrevDest      : longint;
    sNomePartTransf,
    sIdSitPlanoDestino ,
    sNomeSitPlanoOrigem, sIdBeneficios,
    sIdEventoGeradorOrigem,
    sIdEventoGeradorDestino  : string;

    iIdCaluloAtualizacao, iContErros, iContTotal, iIdLote : Integer;

    bErro        : boolean;
    bExibiuOpcoesContrib : boolean;
    bMigraRecursoContabilGeral : boolean; 

    aPessoasaProcessar : Array [1..20] Of Record
                                         sIdPessoaTransf : String;
                                       End;

    function GravaEVENTOSPREV : boolean;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;

    function VerificaMigraPlanoEmprestimo ( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa : longint ) : boolean;
    
    function TransfPlano( piIdPessJur,
                          piIdPlanoOrigem,
                          piIdPlanoDestino,
                          piIdTitular,
                          piIdPessoa,
                          piSeqProposta : longint) : boolean;

    procedure MostraTelaBeneficios;

    procedure AbreQryBenefNConcedidos;

    function  InsereBeneficios( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;


    function  CalculaBeneficios( piIdPessJur,
                                 piIdPlanoOrigem,
                                 piIdPlanoDestino,
                                 piIdTitular,
                                 piIdPessoa,
                                 piSeqProposta : longint;
                                 psIdBeneficios : String ) : boolean;

    function  MontaQueryDet( piIdPessJur,
                             piIdPlanoOrigem,
                             piIdPlanoDestino,
                             piIdTitular,
                             piIdPessoa,
                             piSeqProposta : longint;
                             psIdBeneficios : String ) : boolean;

    function  AssociaContrib( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;

    function  AssociaReservas( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;

    function  InsereParticipante( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;


    function  MontaDemonstrativoIndiv( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;


    function  CalculaReservaParaBeneficio ( piIdBeneficio,
                                piIdRegraReserva,
                                piFlgResgate           : longint )  : double;


    function  AtualizaReservaPart ( piIdBeneficio : longint ) : boolean;



    function AcertaBeneficioTransfPlano( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;



    function PreparaBeneficiosTransfPlano ( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;


    function ModificaPreparosExcedentes( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ) : boolean;


    function BuscaNumeroBeneficiarios (  piNumeroprocesso ,
                                piIdPessjur   ,
                                piIdPlanoPrev  ,
                                piIdTitular    ,
                                piIdBeneficio     : longint ) : integer;


    function DesfazTransfPlano( piIdPessJur ,
                                piIdTitular ,
                                piIdPessoa  ,
                                piSeqProposta     : longint ) : boolean;

    Procedure MostraDemonstrativo;

    Procedure GravaErro(sErro : String);


    function  GravaHSTCONTEVENTOSPRTransf(piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ;
                                sIdEventosPrev, sIdEventoGerador : String ) : boolean;


    function CalculaOpcao(piIdRegraCalculo : longint;
                          sCampo, sTitulo : string) : double;


    Procedure PegaValorHstBenef( piIdPessJur ,
                                piIdPlanoOrigem ,
                                piIdTitular ,
                                piIdPessoa  ,
                                piSeqProposta,
                                piIdBeneficio  : LongInt;
                                sMesCobranca : String;
                                var sValorTotal, sValorIntegral, sValorPrev : String ) ;

    Function VerificaNucleoFamiliar(Var iPessoasNucleo : Integer):Boolean;
  public
    { Public declarations }
  end;

var
  frmEventoTransfPlano: TFrmEventoTransfPlano;

  // Variaveis globais utilizadas pelos forms FCadContribPartTransfPlano e FCadBfciarioTitPlaTransf
  bCancelaTransf, bindividual, bJaMostrou          : boolean;
  sIdPessoaTransf,
  sIdTitularTransf,
  sIdPlanoDestino,
  sIdPlanoOrigem,
  sSeqPropostaTransf,
  sNomePatroTransf,
  sIdPessJurTransf,
  sNomePlanoOrigem,
  sIdPessJurDestinoTransf,
  sInscricaoNumero : string;
  wArquivoMat, wArquivoDemons  : TextFile;

  sAnoMesLote,   sDataFolha : String;

  const prmIdMotivoAcertoMigracaoPlano = 3037; 

implementation

uses DBaseDados, umenserro, udatabase, uadmprev, ueventos,
  UMovReserva, FNumInsc, FTelaAut,
  FCadContribPartTransfPlano, FCadBfciarioTitPlanTransf, UContribuicaoPrev,
  UModulo, UIntegraBack, FCadOpcoesElegivel, UParticipante,
  FCadContribParticipante, fAguarde, Usistema, DAPrev, UBeneficio,
  UFuncoesUteis    ;

{$R *.DFM}

procedure TFrmEventoTransfPlano.VerificaEstadoEvento;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql .Add(' SELECT  EG.IDEVENTOGERADOR ' +
                 ' FROM EVENTOGERADOR EG ' +
                 ' WHERE EG.FLGINTERNO = ' + ''''+sFlgInterno+''' ');
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  sIdEventoGeradorOrigem := qryaux.fieldbyname('ideventogerador').AsString;

end;


procedure TFrmEventoTransfPlano.bbtnProcurarClick(Sender: TObject);
var sErroBenef : String;
begin
  inherited;
  LimpaCampos;
  bindividual := true;

  
  qrySitPartDestino.Filter   := '';
  qrySitPartDestino.Filtered := False;
  qrySitPartDestino.First;
  


  if rdgrpOpPart.itemindex = 0 then
  begin
     MontaSelectPart.Executar;


     
     If Not MontaSelectPart.RetornouValor Then Exit;

     if (MontaSelectPart.ValoresChave.Count < 0)
        or (MontaSelectPart.ValoresChave[0] = '')
     then exit;


     if Trim(MontaSelectPart.ValoresChave[18]) = '1'
     then begin
        if MsgDlg('O participante está desativado no plano selecionado. '+#13+
                  'Deseja continuar a Transferência de Plano ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
        then Exit;
     end;


     sIdPessoaTransf       := MontaSelectPart.ValoresChave[0];
     sIdTitularTransf      := MontaSelectPart.ValoresChave[0];
     sIdPessJurTransf      := MontaSelectPart.ValoresChave[1];
     sIdPlanoOrigem        := MontaSelectPart.ValoresChave[2];
     sSeqPropostaTransf    := MontaSelectPart.ValoresChave[7];
     sIdSitPlanoOrigem     := MontaSelectPart.ValoresChave[8];
     sNomeSitPlanoOrigem   := MontaSelectPart.ValoresChave[9];
     sInscricaoNumero      := MontaSelectPart.ValoresChave[12];
     sFlgInternoSitPart    := MontaSelectPart.ValoresChave[13];

     
     If Not qrySitPartDestino.Active
      Then qrySitPartDestino.Open;
     qrySitPartDestino.Filter   := 'FLGINTERNO = '+QuotedStr(sFlgInternoSitPart);
     qrySitPartDestino.Filtered := True;
     qrySitPartDestino.First;
     



     
     sFlgInternoAntes  := MontaSelectPart.ValoresChave[13];
     sIdSitPartAntes   := MontaSelectPart.ValoresChave[16];
     sIdSitFuncAntes   := MontaSelectPart.ValoresChave[17];
     sIdSitPlanAntes   := MontaSelectPart.ValoresChave[8];

  end
  else
  begin
  qrydet.close;
  qrydet.close;
     MontaSelectBenef.Executar;

     
     If Not MontaSelectBenef.RetornouValor Then Exit;

     if (MontaSelectBenef.ValoresChave.Count < 0)
        or (MontaSelectBenef.ValoresChave[0] = '')
     then exit;

     sIdPessoaTransf       := MontaSelectBenef.ValoresChave[0];
     sIdTitularTransf      := MontaSelectBenef.ValoresChave[19];
     sIdPessJurTransf      := MontaSelectBenef.ValoresChave[1];
     sIdPlanoOrigem        := MontaSelectBenef.ValoresChave[2];
     sSeqPropostaTransf    := MontaSelectBenef.ValoresChave[7];
     sIdSitPlanoOrigem     := MontaSelectBenef.ValoresChave[8];
     sNomeSitPlanoOrigem   := MontaSelectBenef.ValoresChave[9];
     sInscricaoNumero      := MontaSelectBenef.ValoresChave[12]; 
     sFlgInternoSitPart    := MontaSelectBenef.ValoresChave[13];


     //utilizado apenas para a parte de assistidos
     sFlgInternoAntes  := MontaSelectBenef.ValoresChave[13];
     sIdSitPartAntes   := MontaSelectBenef.ValoresChave[16];
     sIdSitFuncAntes   := MontaSelectBenef.ValoresChave[17];
     sIdSitPlanAntes   := MontaSelectBenef.ValoresChave[8];

  end;

  
  sFlgInternoDepois  := sFlgInternoAntes;
  sIdSitPartDepois   := sIdSitPartAntes;
  sIdSitFuncDepois   := sIdSitFuncAntes;
  sIdSitPlanDepois   :=  sIdSitPlanAntes;


  pnlInformacao.Enabled := True;
  bbtnConfirmar.Enabled := True;
  btnDesfazer.enabled := true;
  bbtnCancelar.Enabled  := True;

  VerificaEstadoEvento;

  ConsPart1.sIdPessoa   := sidpessoatransf;
  ConsPart1.sSeqProposta:= sseqpropostatransf;
  ConsPart1.sIdPlanoprev:= sIdPlanoOrigem;
  ConsPart1.DataBaseName:= 'BaseDados';
  ConsPart1.sIdPessjur  := sidpessjurtransf;
  ConsPart1.Enabled     := true;
  bbtnOpcoes.enabled    := true;


  // Abrir query com dados do participante no plano de origem
  with qryDadosNoPlanoOrigem  do begin

     Close;
     ParamByName('IDPESSJUR').AsInteger        := StrToInt(sIdPessJurTransf) ;
     ParamByName('IDPLANOPREV').AsInteger      := StrToInt(sIdPlanoOrigem);
     ParamByName('IDPESSOA').AsInteger         := StrToInt(sIdPessoaTransf);
     ParamByName('IDTITULAR').AsInteger        := StrToInt(sIdTitularTransf);
     ParamByName('SEQPROPOSTA').AsInteger      := StrToInt(sSeqPropostaTransf);
     ParamByName('ENCERRADOS').AsInteger       := 0;
     Open;

     if not IsEmpty
     then begin

        sCampoBusca           := FieldByName('MATRICULA').AsString;
        sIdNucleoFamiliar     := FieldByName('IDNUCLEOFAMILIAR').AsString;
        lblCampoBusca.Caption := 'Matrícula: '+FieldByName('MATRICULA').AsString;
        sNome                 := FieldByName('NOMEPARTICIP').AsString;
        lblNome.Caption       := 'Nome: '+FieldByName('NOMEPARTICIP').AsString;

        sNomeCorrente      := sNome;
        sMatriculaCorrente := sCampoBusca;
        sSalParticipacao   := FieldByName('SALPARTICIPACAO').AsString;
        lblPlanoOrigem.Caption   := 'Patrocinadora/Plano Origem : '+Trim(FieldByName('NOMEPATRO').AsString)+'/'+Trim(FieldByName('NOMEPLANO').AsString);
        lblInscricaoData.Caption := 'Titular Inscrito desde : '+FieldByName('INSCRICAODATA').AsString;

        sNomePlanoOrigem := FieldByName('NomePlano').AsString;
        edPlano.Text     := sNomePlanoOrigem;

        if FieldByName('SITUACAO').AsString <> 'FL'
        then lblFalecido.Caption := 'Titular Falecido : Não '
        else lblFalecido.Caption := 'Titular Falecido : Sim - Data : '+FieldByName('DATAMORTE').AsString;

        
        If (FieldByName('SITUACAO').AsString = 'AT') Or
           (FieldByName('SITUACAO').AsString = 'AS') Or
           (FieldByName('SITUACAO').AsString = 'MA')
         Then lblSitPart.Caption  := 'Situação do Titular na Fundação : '+MontaSelectPart.ValoresChave[10];
        

        if FieldByName('NOMEBENEFICIO').AsString = ''
        then
        begin
           lblBeneficio.Caption := 'Pessoa Recebendo Benefício : Não ';
           btnbeneficios.visible := false;
           chkSoBeneficiario.visible := false;
           chkManterValores.visible := false;
           chkManterInss.visible := false;           
        end
        else
        begin
           lblBeneficio.Caption := 'Pessoa Recebendo Benefício : Sim - '+Trim(FieldByName('NOMEBENEFICIO').AsString);


           qryaux.close;
           qryaux.sql.text := ' SELECT BC.IDPESSOA , BC.IDTITULAR, BC.SEQPROPOSTA, B.NOME, BC.IDSITBENEFICIO, S.DESCRICAO '+
                           '  FROM   BENEFBFCIARIO BC, DEPENTIT DP, BENEFICIO B, SITBENEFICIO S, TPPAGTOBENEFICIO T  '+
                           '  WHERE  BC.IDPESSJUR = '+sIdPessjurTransf+' '+
                           '  AND    BC.IDPLANOPREV = '+sIdPlanoOrigem+' '+
                           '  AND    BC.IDTITULAR = '+sIdTitularTransf+' '+
                           '  AND    BC.IDPESSOA = '+sIdPessoaTransf+' '+
                           '  AND    DP.IDPESSOA = BC.IDPESSOA '+
                           '  AND    DP.IDTITULAR = BC.IDTITULAR '+
                           '  AND    BC.FONTEPAGADORA = 1 '+
                           
                           '  AND    B.IDBENEFICIO = BC.IDBENEFICIO '+
                           '  AND    S.IDSITBENEFICIO = BC.IDSITBENEFICIO '+
                           '  AND    T.FLGFREQUENCIA <> ''U'' '+
                           '  AND    T.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC ';
           qryaux.open;


           if qryaux.isempty then
           begin
              MsgDlg('O beneficiário selecionado não tem benefício de suplementação concedido.','Confirmação',mtInformation,[mbOk],0);
           end;


           sErroBenef := '';
           while not qryaux.eof do
           begin
              if not (qryaux.fieldbyname('IDSITBENEFICIO').AsInteger in [1,2]) then
              begin
                 if sErroBenef = '' then
                    sErroBenef := ' O Benefício '+qryaux.fieldbyname('NOME').AsString+' encontra-se '+
                               ''+qryaux.fieldbyname('DESCRICAO').AsString+'.'
                 else
                    sErroBenef := sErroBenef+#13+' O Benefício '+qryaux.fieldbyname('NOME').AsString+' encontra-se '+
                               ''+qryaux.fieldbyname('DESCRICAO').AsString+'.';
              end;

              qryaux.next;
           end;

           if sErroBenef <> '' then
           begin
              MsgDlg('Os benefícios, listados abaixo, não serão migrados.'+#13+sErrobenef,
                     'Confirmação',mtInformation,[mbOk],0);
           end;

        end;

        lblDataTransacao.Caption := 'Data da Transação : '+DateToStr(date);


     end
     else begin // participante nao existe
         sCampoBusca        := '';
         sNome              := '';
         lblCampoBusca.Caption   := 'Matrícula: ';
         lblNome.Caption         := 'Nome: ';

         lblPlanoOrigem.Caption      := 'Plano Origem : < não encontrado >';
         lblInscricaoData.Caption    := 'Titular Inscrito desde : < não encontrado >';
         lblFalecido.Caption         := 'Titular Falecido : < não encontrado >';
         lblSitPart.Caption          := 'Situação do Titular na Fundação : < não encontrado >';
         lblBeneficio.Caption        := 'Pessoa Recebendo Benefício : < não encontrado >';
     end;

  end; 


  bbtnConfirmar.enabled := True;
  btnDesfazer.enabled := true;

end;

procedure TFrmEventoTransfPlano.bbtnConfirmarClick(Sender: TObject);
var
   wLinhaMat, sMatAux , sErroBenef    : string;
   iPessoasNucleo, I : Integer;
begin
  inherited;

  dtmaprev.regraAPrev.ExibeMensagens := bIndividual;

  if Trim(dtEvento.Text) = ''
  then begin
     MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dtEvento.SetFocus;
     TiraIconeSql;
     Exit;
  end;

  if Trim(dblkpNovoPlano.Text) = ''
  then begin
     MsgDlg('O Plano destino deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpNovoPlano.SetFocus;
     TiraIconeSql;
     Exit;
  end;

  if sIdPessJurTransf+sIdPlanoOrigem = sIdPessJurDestinoTransf+sIdPlanoDestino
  then begin
     MsgDlg('O Plano destino não pode ser o mesmo de origem.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpNovoPlano.SetFocus;
     TiraIconeSql;
     Exit;
  end;

  if Trim(cmbsitorig.Text) = ''
  then begin
     MsgDlg('A Nova Situação no Plano origem deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     cmbsitorig.SetFocus;
     TiraIconeSql;
     Exit;
  end;

  if Trim(cmbsitdest.Text) = ''
  then begin
     MsgDlg('A situação no Plano destino deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     cmbsitdest.SetFocus;
     TiraIconeSql;
     Exit;
  end;

  
  if Trim(cmbSitPartDest.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     cmbSitPartDest.SetFocus;
     TiraIconeSql;
     Exit;
  end;
  


  if (Trim(sNome) = '') and (trim(edarqmat.Text) = '')
  then begin
     MsgDlg('Primeiro selecione o Participante ou o arquivo de matrículas.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     TiraIconeSql;
     Exit;
  end;


  if (CdsBeneficiosParaConcessao.isempty)
  then  begin

     if bIndividual then
     begin
        if (qryDadosNoPlanoOrigem.FieldByName('NOMEBENEFICIO').AsString <> '' ) and (not bJaMostrou) then
        begin
           MostraTelaBeneficios;
           Exit;
        end;
     end
     else if (not bIndividual) and (btnbeneficios.visible) and (not bJaMostrou) then
     begin
        MostraTelaBeneficios;
        Exit;
     end;


  end;


  if (trim(dblkpcmbLote.text)  = '')  and
     (not CdsBeneficiosParaConcessao.isempty) and
     (btnbeneficios.visible)   then
  begin
     MsgDlg('O lote deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
     MostraTelaBeneficios;
     cmbsitdest.SetFocus;
     TiraIconeSql;
     Exit;
  end;

  bErro                 := False;
  iContTotal            := 0;
  iContErros            := 0;
  sIdSitPlanoDestino    := qrysitplanoprev.fieldbyname('idsitplanoprev').AsString;
  
  sIdSitPlanoOrigemNovo   := qrysitplanoprevorigem.fieldbyname('idsitplanoprev').AsString;

  
  bMigraRecursoContabilGeral := False;
  if not bIndividual
  then begin
   if not MsgDlg('Deseja migrar os recursos contábeis dos participantes que possuirem Empréstimo ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
   then bMigraRecursoContabilGeral := True;

  end;

  if dtmBasedados.dbBaseDados.InTransaction
  then dtmBasedados.dbBaseDados.Rollback;
  dtmBasedados.dbBaseDados.StartTransaction;

  frmAguarde.Mostra('Inserindo Participante no Plano Destino...');


  Try
     if trim(edarqmat.Text) <> '' then
     begin
        AssignFile(wArquivoMat,edarqmat.Text);
     end;
  except
     MsgDlg('Erro ao ler arquivo de seleção de matrículas.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     Exit;
  end;


  Try
     AssignFile(wArquivoDemons,edarqmat.Text+'_Saida');
  except
     MsgDlg('Erro ao criar o arquivo de demonstrativo.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     Exit;
  end;


  bbtnConfirmar.enabled := False;
  btnDesfazer.enabled := false;


  //caso seja em lote
  if trim(edarqmat.Text) <> '' then
  begin

     sNomeCorrente      := '';
     sMatriculaCorrente := '';
     sSalParticipacao   := '0';

     if (trim(sIdPessJurTransf) = '') or (trim(sIdPlanoOrigem) = '') then begin
        MsgDlg('Para migração em lote, a Patrocinadora e Plano devem ser selecionados.','Erro',mtError,[mbOk],0);
        dblkPatroDestino.setfocus;
        frmAguarde.Apaga;
        bbtnConfirmar.enabled := true;
        btnDesfazer.enabled := true;
        Exit;
     end;

     reset( wArquivoMat);
     Rewrite( wArquivoDemons);


     //monta contador
     while not Eof(wArquivoMat) do
     begin
        Readln(wArquivoMat,wLinhaMat);

        inc(iContTotal);
     end;

     pgbar.visible := true;
     pgbar.Min := 0;
     pgbar.Position := 0;
     pgbar.Max := iContTotal;


     reset( wArquivoMat);

     while not Eof(wArquivoMat) do
     begin
        Readln(wArquivoMat,wLinhaMat);
        pgbar.Position := pgbar.Position + 1;

        sMatAux := Trim(wLinhaMat);
        sMatriculaCorrente := sMatAux;
        sNomeCorrente := '---//---';


        //procura pessoa pela matrícula
        qryaux.close;
        qryaux.sql.text := ' SELECT EL.IDPESSOA, EL.IDPESSOA IDTITULAR, PP.SEQPROPOSTA , P.NOME ,'+
                           ' EL.IDSITFUNC, PP.IDSITPART, ST.FLGINTERNO, SP.DESCRICAO FLGSITPLANOPREV, '+
                           ' PP.SALPARTICIPACAO, PP.INSCRICAONUMERO, PP.IDSITPLANOPREV '+
                           ' FROM ELEGPATRO EL, PARTPREVPLAN PP, PESSOA P, SITPART ST, SITPLANOPREV SP  '+
                           ' WHERE PP.IDPESSJUR = '+sIdPessJurTransf+' '+
                           ' AND PP.IDPLANOPREV = '+sIdPlanoOrigem+' '+
                           ' AND PP.IDPESSJUR = EL.IDPESSJUR '+
                           ' AND PP.IDPESSOA = EL.IDPESSOA '+
                           ' AND EL.MATRICULA = '''+sMatAux+'''   '+
                           ' AND P.IDPESSOA = EL.IDPESSOA '+
                           ' AND ST.IDSITPART = PP.IDSITPART '+
                           ' AND SP.IDSITPLANOPREV = PP.IDSITPLANOPREV ';
        qryaux.open;

        if qryaux.isempty then
        begin
           qryaux.close;
           qryaux.sql.text := ' SELECT BC.IDPESSOA , BC.IDTITULAR, BC.SEQPROPOSTA, P.NOME, BC.IDSITBENEFICIO, S.DESCRICAO, '+
                           '  EL.IDSITFUNC, PP.IDSITPART, ''AS'' FLGINTERNO, SP.DESCRICAO FLGSITPLANOPREV, PP.INSCRICAONUMERO, PP.IDSITPLANOPREV, '+
                           '  B.NOME NOMEBENEF, PP.SALPARTICIPACAO '+
                           '  FROM   ELEGPATRO EL, BENEFBFCIARIO BC, DEPENTIT DP, PESSOA P, SITBENEFICIO S , PARTPREVPLAN PP, '+
                           '         SITPLANOPREV SP , BENEFICIO B, TPPAGTOBENEFICIO T'+
                           '  WHERE  BC.IDPESSJUR = '+sIdPessjurTransf+' '+
                           '  AND    BC.IDPLANOPREV = '+sIdPlanoOrigem+' '+
                           '  AND    EL.IDPESSJUR = BC.IDPESSJUR '+
                           '  AND    EL.IDPESSOA = BC.IDTITULAR '+
                           '  AND    SP.IDSITPLANOPREV = PP.IDSITPLANOPREV  '+
                           '  AND    DP.IDPESSOA = BC.IDPESSOA '+
                           '  AND    DP.IDTITULAR = BC.IDTITULAR '+
                           '  AND    DP.MATRICULA = '''+sMatAux+''' '+
                           '  AND    BC.FONTEPAGADORA = 1 '+
                           '  AND    PP.IDPESSJUR = BC.IDPESSJUR '+
                           '  AND    PP.IDPLANOPREV = BC.IDPLANOPREV '+
                           '  AND    PP.IDPESSOA = BC.IDTITULAR '+
                           '  AND    B.IDBENEFICIO = BC.IDBENEFICIO '+
                           
                           '  AND    P.IDPESSOA = BC.IDPESSOA '+
                           '  AND    S.IDSITBENEFICIO = BC.IDSITBENEFICIO '+
                           '  AND    T.FLGFREQUENCIA <> ''U'' '+
                           '  AND    T.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC ';
           qryaux.open;

           if qryaux.isempty then
           begin
              GravaErro('Matrícula não encontrada.');
              bErro := true;
              inc(iContErros);
              continue;
           end;

           sNomeCorrente := qryaux.fieldbyname('NOME').AsString;
           sMatriculaCorrente := sMatAux;



           qryaux.first;


           sErroBenef := '';
           while not qryaux.eof do
           begin
              if not (qryaux.fieldbyname('IDSITBENEFICIO').AsInteger  in [1,2]) then
              begin
                 if sErroBenef = '' then
                    sErroBenef := ' O Benefício '+qryaux.fieldbyname('NOMEBENEF').AsString+' encontra-se '+
                               ''+qryaux.fieldbyname('DESCRICAO').AsString+'.'
                 else
                    sErroBenef := sErroBenef+#13+' O Benefício '+qryaux.fieldbyname('NOMEBENEF').AsString+' encontra-se '+
                               ''+qryaux.fieldbyname('DESCRICAO').AsString+'.';
              end;
              qryaux.next;
           end;

           if sErroBenef <> '' then
           begin
              GravaErro(sErroBenef);
              bErro := true;
              inc(iContErros);
              continue;
           end;

        end;


        sIdTitularTransf := qryaux.fieldbyname('IDTITULAR').AsString;
        sIdPessoaTransf  := qryaux.fieldbyname('IDPESSOA').AsString;
        sSeqPropostaTransf  := qryaux.fieldbyname('SEQPROPOSTA').AsString;

        sNomeCorrente := qryaux.fieldbyname('NOME').AsString;
        sMatriculaCorrente := sMatAux;

        sSalParticipacao := qryaux.fieldbyname('SALPARTICIPACAO').AsString;

        sIdSitPlanoOrigem     := qryaux.fieldbyname('IDSITPLANOPREV').AsString;
        sNomeSitPlanoOrigem   := qryaux.fieldbyname('FLGSITPLANOPREV').AsString;
        sInscricaoNumero      := qryaux.fieldbyname('INSCRICAONUMERO').AsString;
        sFlgInternoSitPart    := qryaux.fieldbyname('FLGINTERNO').AsString;
        sFlgInternoAntes  := qryaux.fieldbyname('FLGINTERNO').AsString;
        sIdSitPartAntes   := qryaux.fieldbyname('IDSITPART').AsString;
        sIdSitFuncAntes   := qryaux.fieldbyname('IDSITFUNC').AsString;
        sIdSitPlanAntes   := qryaux.fieldbyname('IDSITPLANOPREV').AsString;
        sFlgInternoDepois  := sFlgInternoAntes;
        sIdSitPartDepois   := sIdSitPartAntes;
        sIdSitFuncDepois   := sIdSitFuncAntes;
        sIdSitPlanDepois   :=  sIdSitPlanAntes;


        if not TransfPlano(StrToInt(sIdPessJurTransf),
                           StrToInt(sIdPlanoOrigem),
                           StrToInt(sIdPlanoDestino),
                           StrToInt(sIdTitularTransf),
                           StrToInt(sIdPessoaTransf),
                           StrToInt(sSeqPropostaTransf))
        then
        begin
           bErro := true;
           inc(iContErros);

           if not cbchkCommit.checked then //caso o commit esteja marcado para cada um
                  dtmBasedados.dbBaseDados.Rollback;

        end;

        if not cbchkCommit.checked then //caso o commit esteja marcado para cada um
        begin
           dtmBasedados.dbBaseDados.Commit;
           dtmBasedados.dbBaseDados.StartTransaction;
        end;


        //caso o número de participantes seja maior que 100
        //gravar deemosntrativo em arquivo texto e avisar ao final
        if iContTotal > 100 then
        begin
           for I := 1 to memResult.Lines.count do
           begin
              Writeln(wArquivoDemons, memResult.text[i] );
           end;
        end;
     end;

     if iContTotal > 100 then
     begin
        memResult.clear;
        memResult.lines.add('Como o lote estava com um número grande de pessoas, ');
        memResult.lines.add('o demonsrativo encontra-se no arquivo: '+edarqmat.Text+'_Saida');
     end;

  end
  else  //caso não seja em lote
  begin

     

     If sIdTitularTransf <> sIdPessoaTransf Then Begin
       { Processar nucleos Familiares caso possua mais de uma pessoa no mesmo nucleo }
       VerificaNucleoFamiliar(iPessoasNucleo);

       If (iPessoasNucleo > 1) Then Begin
         If MsgDlg('Este Núcleo Familiar possui mais de um beneficiário,  '+#13+
                   'todos os beneficiários serão migrados. '+#13+
                   'Deseja continuar a Transferência de Plano ? ',
                   'Atenção', mtConfirmation,[mbYes,mbNo],0) = mrNo
         Then Exit;
       End;
     End Else Begin
       iPessoasNucleo := 1;
       aPessoasaProcessar[1].sIdPessoaTransf := sIdPessoaTransf;
     End;
     For I := 1 To iPessoasNucleo Do Begin
       bindividual := True;
       if not TransfPlano(StrToInt(sIdPessJurTransf),
                          StrToInt(sIdPlanoOrigem),
                          StrToInt(sIdPlanoDestino),
                          StrToInt(sIdTitularTransf),
                          StrToInt(aPessoasaProcessar[I].sIdPessoaTransf),
                          StrToInt(sSeqPropostaTransf))
       then bErro := True;

       bParticipanteMigrado := True; { Na primeira pessoa do grupo o titular já vai ser incluida  }

       If I > 1 Then bindividual := False;

       If  bErro = False Then
         // Monta o demonstrativo
         MontaDemonstrativoIndiv(StrToInt(sIdPessJurTransf),
                                 StrToInt(sIdPlanoOrigem),
                                 StrToInt(sIdPlanoDestino),
                                 StrToInt(sIdTitularTransf),
                                 StrToInt(aPessoasaProcessar[I].sIdPessoaTransf),
                                 StrToInt(sSeqPropostaTransf));
     End; 
     qrydet.close;
     bParticipanteMigrado := False;
     

  end;

  frmAguarde.Apaga;
  pgbar.visible := false;


  if not bErro then
  begin
     MsgDlg('Evento efetuado com sucesso. A operação pode ser efetivada após a verificação do demonstrativo.','Informação',mtInformation,[mbOk],0);
     btnEfetivar.enabled := true;
     bbtnCancelar.enabled := true;
  end
  else if  berro and bIndividual then
  begin
     MsgDlg('Erro ao transferir o participante de plano. Operação Cancelada.','Erro',mtError,[mbOk],0);
     dtmBasedados.dbBaseDados.Rollback;
     bbtnConfirmar.enabled := true;
     btnDesfazer.enabled := true;
     btnEfetivar.enabled := false;
     bbtnCancelar.enabled := false;
  end
  else if berro and (not bindividual) then
  begin

     if not cbchkCommit.checked then
     begin
        MsgDlg('Houveram erros em '+inttostr(iContErros)+' das '+inttostr(iContTotal)+' tranferências. Todas as demais foram efetivadas. Verificar desmonstrativo.','Erro',mtError,[mbOk],0);
        btnEfetivar.enabled := false;
        bbtnCancelar.enabled := false;
     end
     else begin
        MsgDlg('Houveram erros em '+inttostr(iContErros)+' das '+inttostr(iContTotal)+' tranferências. Todas as demais podem ser efetivadas após verfiicação do desmonstrativo. Não recomendado.','Erro',mtError,[mbOk],0);
        btnEfetivar.enabled := True;
        bbtnCancelar.enabled := True;
     end;
  end;


  MostraDemonstrativo;

end;



function TFrmEventoTransfPlano.GravaEVENTOSPREV : boolean;
begin

   // Gravar evento da categoria Transferencia de Plano no plano de origem
   iIdEventoPrevOrig := LeUltRegistro(qryAux,'EVENTOSPREV');

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                  '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                  '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                  '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                  '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                  '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                  ' VALUES(' + IntToStr(iIdEventoPrevOrig)                   + ',' +
                  ' TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY'') ,' +
                  ' TO_DATE(''' + Trim(dtEvento.Text) + ''',''DD/MM/YYYY'') ,' +
                  sIdPessoaTransf+ ',' +
                  sIdPessJurTransf+ ',' +
                  sIdPlanoOrigem+ ',' +
                  sSeqPropostaTransf+ ',' +
                  sIdSitFuncAntes+ ',' +
                  sIdSitPartAntes+ ',' +
                  sIdSitPlanoOrigem+ ',' +
                  sidSitFuncDepois+ ',' +
                  sIdSitPartDepois+ ',' +
                  sIdSitPlanoOrigemNovo + ',' + 
                  sIdEventoGerador+ ',''1'',''1'',''1'',' +
                  ' TO_DATE('''+datetostr(date)+''',''dd/mm/yyyy''),''1'''+','+
                  OraNumero(sInscricaoNumero)+')');
   try
      qryAux.ExecSQL;
   except
      Result := false;
      exit;
   end;





   Result := True;
end;


procedure TFrmEventoTransfPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then begin
     if dtmBasedados.dbBaseDados.InTransaction
     then dtmBasedados.dbBaseDados.RollBack;
     LimpaCampos;
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;

end;

procedure TFrmEventoTransfPlano.LimpaCampos;
begin

   sIdPessoaTransf       := '';
   sIdTitularTransf      := '';
   sIdPessJurTransf      := '';
   sIdPlanoOrigem        := '';
   sSeqPropostaTransf    := '';
   sIdSitPlanoOrigem     := '';
   sNomeSitPlanoOrigem   := '';
   sFlgInternoSitPart    := '';


   sCampoBusca       := '';
   sNome              := '';
   lblCampoBusca.Caption   := 'Matrícula: ';
   lblNome.Caption         := 'Nome: ';

   lblPlanoOrigem.Caption   := 'Plano Origem : < não encontrado >';
   lblInscricaoData.Caption := 'Titular Inscrito desde : < não encontrado >';
   lblFalecido.Caption      := 'Titular Falecido : < não encontrado >';
   lblSitPart.Caption       := 'Situação do Titular na Fundação : < não encontrado >';
   lblBeneficio.Caption     := 'Pessoa Recebendo Benefício : < não encontrado >';

   btnbeneficios.visible := false;
   chkSoBeneficiario.visible := false;
   chkManterValores.visible := false;
   chkManterInss.visible := false;   
   CdsBeneficiosParaConcessao.close;

   bJaMostrou := False;

   edarqmat.Text := '';

   memErros.lines.clear;
   memResult.lines.clear;


   
   dblkPatroDestino.Clear;
   dblkPlanoOrigem.Clear;
   dblkpNovoPlano.clear;
   

   with memErros.Lines do
   begin
      Clear;
      Add('--------------------------------------------------------------------');
      Add('              TRANSFERÊNCIA DE PLANO                                ');
      Add('              DEMONSTRATIVO DE ERROS        VERSÃO : '+Sistema.Versao);
      Add('USUÁRIO : '+Sistema.NomeUsuario+'             DATA : '+DateToStr(date));
      Add('--------------------------------------------------------------------');
      Add('');
   end;


   bbtnConfirmar.enabled := false;
   btnDesfazer.enabled := false;   
   btnEfetivar.enabled := false;
   bbtnCancelar.enabled := false;

   pgbar.visible := false;


   try  CloseFile(wArquivoDemons) except end;
   try  CloseFile(wArquivoMat) except end;


end;


procedure TFrmEventoTransfPlano.TiraIconeSql;
begin
 {Adaptacao para tirar o icone de SQL}
  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT * FROM DUAL');
     Open;
     Close;
  end;
end;

procedure TFrmEventoTransfPlano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlLancamento ); 
  inherited;
  qryRegraParcela.Close;
  with dtmBasedados.dbBaseDados do
    if InTransaction then  RollBack;

  dtmaprev.regraAPrev.ExibeMensagens := True;
end;



procedure TFrmEventoTransfPlano.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   if not qrybenefnaoconcedidos.isempty then
   begin
      CdsBeneficiosParaConcessao.Insert;
      CdsBeneficiosParaConcessao.fieldbyname('IDPLANOPREV').AsString       := qrybenefnaoconcedidos.fieldbyname('IDPLANOPREV').AsString;
      CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString       := qrybenefnaoconcedidos.fieldbyname('IDBENEFICIO').AsString;
      CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString     := '';
      CdsBeneficiosParaConcessao.fieldbyname('IDTPPAGTOBENEFIC').AsString  := qrybenefnaoconcedidos.fieldbyname('IDTPPAGTOBENEFIC').AsString;;
      CdsBeneficiosParaConcessao.fieldbyname('NOME').AsString              := qrybenefnaoconcedidos.fieldbyname('NOME').AsString;
      CdsBeneficiosParaConcessao.fieldbyname('NOMEANT').AsString           := '' ;
      CdsBeneficiosParaConcessao.fieldbyname('SETA').AsString              := ' * ' ;
      CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsString        := '' ;
      CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsString        := '' ;
      CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsString        := '' ;
      CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE1').AsString    := qrybenefnaoconcedidos.fieldbyname('NOMEVALORBASE1').AsString ;
      CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE2').AsString    := qrybenefnaoconcedidos.fieldbyname('NOMEVALORBASE2').AsString ;
      CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE3').AsString    := qrybenefnaoconcedidos.fieldbyname('NOMEVALORBASE3').AsString ;
      CdsBeneficiosParaConcessao.fieldbyname('IDEVENTOGERADOR').AsString   := qrybenefnaoconcedidos.fieldbyname('IDEVENTOGERADOR').AsString;;
      CdsBeneficiosParaConcessao.fieldbyname('IDREGRACALCOP1').AsString    := qrybenefnaoconcedidos.fieldbyname('IDREGRACALCOP1').AsString;;
      CdsBeneficiosParaConcessao.fieldbyname('IDREGRACALCOP2').AsString    := qrybenefnaoconcedidos.fieldbyname('IDREGRACALCOP2').AsString;;
      CdsBeneficiosParaConcessao.fieldbyname('IDREGRACALCOP3').AsString    := qrybenefnaoconcedidos.fieldbyname('IDREGRACALCOP3').AsString;;
      CdsBeneficiosParaConcessao.fieldbyname('IDRGCALCBENEFICIO').AsString := qrybenefnaoconcedidos.fieldbyname('IDREGRACALCULO').AsString;
      CdsBeneficiosParaConcessao.fieldbyname('DESTINOPAG').AsString        := qrybenefnaoconcedidos.fieldbyname('DESTINOPAG').AsString;
      CdsBeneficiosParaConcessao.fieldbyname('IDPLANPREVCONTAB').AsString  := qrybenefnaoconcedidos.fieldbyname('IDPLANPREVCONTAB').AsString;
      CdsBeneficiosParaConcessao.fieldbyname('FLGREFERENCIA').AsString     := qrybenefnaoconcedidos.fieldbyname('FLGREFERENCIA').AsString; 
      CdsBeneficiosParaConcessao.fieldbyname('IDREGRAFIM').AsString        := qrybenefnaoconcedidos.fieldbyname('IDREGRAFIM').AsString; 
      CdsBeneficiosParaConcessao.post;
   end;

   MostraTelaBeneficios;
 end;

procedure TFrmEventoTransfPlano.cmbsitorigEnter(Sender: TObject);
begin
  inherited;
if not qrysitplanoprevorigem.Active then qrysitplanoprevorigem.open;
end;

procedure TFrmEventoTransfPlano.cmbsitdestEnter(Sender: TObject);
begin
  inherited;
  if not qrysitplanoprev.active then qrysitplanoprev.open;
end;

procedure TFrmEventoTransfPlano.FormShow(Sender: TObject);
begin
  inherited;
  qrysitplanoprevorigem.Close;
  qrysitplanoprevorigem.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrysitplanoprevorigem.Open;
  qrysitplanoprev.open;
  qryRegraParcela.Open;
  bFlgIntContab := (IntegraBack.Contabilidade = 'S');
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  pgCtrOp.ActivePage := tbIndividual;
  bbtnContribuicoes.Visible := False;
  
  qrySitPartDestino.Close;
  qrySitPartDestino.Open;
  
end;

procedure TFrmEventoTransfPlano.dblkpNovoPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if qryPatroPlano.isempty then exit;


  sIdPlanoDestino         := qryPatroPlano.FieldByName('IdPlanoPrev').AsString;
  sNomePatroTransf        := qryPatroPlano.FieldByName('NomePatro').AsString;
  sIdPessJurDestinoTransf := qryPatroPlano.FieldByName('IdPessJur').AsString;
  sAutoNumInscTransf      := qryPatroPlano.FieldByName('FlgAutoNumInsc').AsString;
  sNumInscDestino         := qryPatroPlano.FieldByName('NumInscInicial').AsString;


  
  If bindividual Then Begin
     //verifica se o participante já existe no plano destino
     qryaux.Close;
     qryaux.Sql.Clear;
     qryaux.Sql.Add(' SELECT IDPESSOA FROM  PARTPREVPLAN ' +
                    ' WHERE  IDPESSOA    = '+sIdTitularTransf+ 
                    ' AND    IDPESSJUR   = '+sIdPessJurDestinoTransf+
                    ' AND    IDPLANOPREV = '+sIdPlanoDestino+
                    ' AND    SEQPROPOSTA = '+sSeqPropostaTransf);
     try
        qryaux.Open;
     except
        raise;
     end;
     
     bParticipanteMigrado := False;
     if not qryaux.isempty then begin
        MsgDlg('Esta pessoa já está cadastrada como Participante do Plano Destino.',
               'Atenção', mtWarning, [mbok], 0);
        bParticipanteMigrado := True;
        
     end;

     // Se o plano destino escollhido for o de outra patrocinadora
     // Então verifica se o participante já está cadastrado como elegível
     qryaux.Close;
     qryaux.Sql.Clear;
     qryaux.Sql.Add(' SELECT IDPESSOA FROM  ELEGPATRO ' +
                    ' WHERE  IDPESSOA  = '+sIdTitularTransf+ 
                    ' AND    IDPESSJUR = '+sIdPessJurDestinoTransf);
     try
        qryaux.Open;
     except
        raise;
     end;

     if qryaux.isempty
     then begin
        MsgDlg('O participante não está cadastrado com o elegível na patrocinadora do Plano Destino.', 'Erro', mtError, [mbok], 0);
        dblkpNovoPlano.text := '';
     end;
  end;  



  //verifica se cadastraram o de-para de benefícios
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add('  SELECT 1 '+
                 '  FROM   BENEFTRANSFPLANO BT  '+
                 '  WHERE  BT.IDPLANODEST   = '+sIdPlanoDestino+
                 '  AND    BT.IDPLANOORIGEM = '+sIdPlanoOrigem+
                 '  AND    BT.IDEVENTOGERADOR = '+sIdEventoGerador+' ');
  qryAux.open;

  if qryaux.isempty then
  begin

     if bIndividual then
     begin

        if trim(qryDadosNoPlanoOrigem.FieldByName('NOMEBENEFICIO').AsString)  <> '' then
        begin
           btnbeneficios.visible := false;
           chkSoBeneficiario.visible := false;
           chkManterValores.visible := false;
           chkManterInss.visible := false;           

           dblkpNovoPlano.text := '';

           MsgDlg('O participante recebe o benefício '+qryDadosNoPlanoOrigem.FieldByName('NOMEBENEFICIO').AsString+', porém, '+
               'o DE-PARA de benefícios não foi cadastrado.','Erro',mtError,[mbOk,mbHelp],0);
        end;
     end
     else
     begin

        btnbeneficios.visible := false;
        chkSoBeneficiario.visible := false;
        chkManterValores.visible := false;
        chkManterInss.visible := false;


        

        if MsgDlg('O DE-PARA de benefícios não foi cadastrado. '+#13+
                  'Caso hajam participantes assistidos no arquivo, apenas as informações '+#13+
                  'que não estiverem ligadas aos benefícios serão transferidas. '+#13+
                  'Deseja continuar?','Aviso',mtWarning,[mbYes, mbNo],0) = mrYes
        then Exit;
        dblkpNovoPlano.text := '';
     end;

  end
  else
  begin
     btnbeneficios.visible := true;
     
     chkManterValores.visible := True;
     chkManterInss.visible := True;
  end;

end;

procedure TFrmEventoTransfPlano.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3,  EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6, '+
                 ' PATRO.NUMOPCOES    , '+
                 ' PATRO.NOMEVALORBASE1    ,  PATRO.NOMEVALORBASE2   ,  PATRO.NOMEVALORBASE3, '+
                 ' PATRO.FLGOBRIGAOP1    , PATRO.FLGOBRIGAOP2  ,  PATRO.FLGOBRIGAOP3  , '+
                 ' PATRO.FLGEDITAOP1    , PATRO.FLGEDITAOP2    ,  PATRO.FLGEDITAOP3    , '+
                 ' PATRO.IDREGRACALCOP1   ,  PATRO.IDREGRACALCOP2  ,  PATRO.IDREGRACALCOP3  ,  '+
                 ' PATRO.IDREGRAVALIDAOP1  ,   PATRO.IDREGRAVALIDAOP2  ,  PATRO.IDREGRAVALIDAOP3, '+
                 ' PATRO.NOMEVALORBASE4    ,  PATRO.NOMEVALORBASE5   ,  PATRO.NOMEVALORBASE6, '+
                 ' PATRO.FLGOBRIGAOP4    , PATRO.FLGOBRIGAOP5  ,  PATRO.FLGOBRIGAOP6  , '+
                 ' PATRO.FLGEDITAOP4    , PATRO.FLGEDITAOP5    ,  PATRO.FLGEDITAOP6    , '+
                 ' PATRO.IDREGRACALCOP4   ,  PATRO.IDREGRACALCOP5  ,  PATRO.IDREGRACALCOP6  ,  '+
                 ' PATRO.IDREGRAVALIDAOP4  ,   PATRO.IDREGRAVALIDAOP5  ,  PATRO.IDREGRAVALIDAOP6 '+
                 ' FROM ELEGPATRO EL, PATRO ' +
                 ' WHERE EL.IDPESSJUR   = ' +sidpessjurtransf+ ' AND '+
                 ' EL.IDPESSOA = '+sidpessoatransf+' AND '+
                 ' EL.IDPESSJUR = PATRO.IDPESSOA ' );
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     rOpcao4 := 0;
     rOpcao5 := 0;
     rOpcao6 := 0;
  end
  else begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;

     if qryAux.FieldByName('VALORBASE4').AsString <> ''
     then rOpcao4 := qryAux.FieldByName('VALORBASE4').AsFloat
     else rOpcao4 := 0;

     if qryAux.FieldByName('VALORBASE5').AsString <> ''
     then rOpcao5 := qryAux.FieldByName('VALORBASE5').AsFloat
     else rOpcao5 := 0;

     if qryAux.FieldByName('VALORBASE6').AsString <> ''
     then rOpcao6 := qryAux.FieldByName('VALORBASE6').AsFloat
     else rOpcao6 := 0;
  end;

  bPodeAlterarOpcoes := True;

  if not qryAux.IsEmpty
  then begin // Opcoes já cadastradas
     bOpcoesExistem := True;

     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(sNome,  qrypatroplano.fieldbyname('NOMEPATRO').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjurtransf),strtoint(sidpessoatransf),
                                 '','');
     frmCadOpcoesElegivel.Free;
  end
  else begin // Cadastrar Opcoes
     bOpcoesExistem := False;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(sNome, qrypatroplano.fieldbyname('NOMEPATRO').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjurtransf), strtoint(sidpessoatransf),
                                 '', '');

     frmCadOpcoesElegivel.Free;
  end;

  if ((rOpcao1 >= 0) or (rOpcao2 >= 0) or (rOpcao3 >= 0)
      or (rOpcao4 >= 0) or (rOpcao5 >= 0) or (rOpcao6 >= 0)) and
     (frmCadOpcoesElegivel.ModalResult = mrok)
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE ELEGPATRO SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                    '                      VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                    '                      VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) + ',' +
                    '                      VALORBASE4 = ' + FormatFloat('#0.00000',rOpcao4) + ',' +
                    '                      VALORBASE5 = ' + FormatFloat('#0.00000',rOpcao5) + ',' +
                    '                      VALORBASE6 = ' + FormatFloat('#0.00000',rOpcao6) +
                    ' WHERE IDPESSJUR   = ' + sidpessjurtransf   + ' AND ' +
                    '       IDPESSOA    = ' + sidpessoatransf   + ' ' );
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
  end;
end;



function TfrmEventoTransfPlano.TransfPlano( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
var sSQL     : string;
    bErroLocal    : boolean;

begin
   Result := False;
   { Incluir dados do Participante no plano novo somente se ainda não estiver incluido }
   { estes eventos não precisão ser refeitos caso o participante já tenha migrado.     }
   If bParticipanteMigrado = False Then Begin
     // Seleciona todas as informações do participante no plano de origem
     sSQL := ' SELECT PP.REQUERIMENTODATA,                                                  '+
             '        PP.INSCRICAONUMERO,         PP.INSCRICAODATA,   PP.INSCRICAOTIPO,     '+
             '        PP.SALINSCRICAO,                                                      '+
             '        PP.DATAINICIOASSIST,        PP.SALPARTICIPACAO, PP.SALMANTIDO,        '+
             '        PP.SALVINCULADO,            PP.VALORCALCINSS,   PP.DATACANCELAMENTO,  '+
             '        PP.DATAINICIOMANUT,         PP.DATAFIMASSIST,   PP.FLGDEVEEMPRESTIMO, '+
             '        PP.FLGDEVEASSISTENC,        PP.FLGDEVEPREVIDENC,PP.VALORINFINSS,      '+
             '        PP.DATAINICIOSITTEMP,       PP.DATAFIMSITTEMP,  PP.SALAUXDOENCA,      '+
             '        PP.SEQPROPOSTA,             PP.IDSITPART,                             '+
             '        PP.REQUERIMENTODATA, '+
             '        PP.IDPLANOPREV, EL.IDSITFUNC '+
             '  FROM  PARTPREVPLAN PP,'+
             '  ELEGPATRO EL '+
             '  WHERE PP.IDPESSJUR   = '+IntToStr(piIdPessJur)+ // CAMILLE - 10.05.2004 - PENDENCIA 16749
             '  AND   PP.IDPLANOPREV = '+IntToStr(piIdPlanoOrigem)+
             '  AND   PP.IDPESSOA    = '+IntToStr(piIdTitular) +
             '  AND   PP.IDPESSJUR   = EL.IDPESSJUR '+
             '  AND   PP.IDPESSOA    = EL.IDPESSOA  ';


     // Executa regra de validação de transferencia de plano
     if qryPatroPlano.FieldByName('IDREGRATRANSFPLA').AsString <> ''
     then begin
        if not RegraBooleana( qryPatroPlano.Fieldbyname('IDREGRATRANSFPLA').AsString, sSQL, bErroLocal)
        then begin
           Result := False;
           GravaErro('Não passou na regra de elegibilidade.');
           Exit;
        end;

        if bErroLocal
        then begin
           Result := False;
           Exit;
        end;
     end;


     if (piIdTitular = piIdPessoa) 
     then begin

        //insere participante no plano destino
        if not InsereParticipante( piIdPessJur,
                        piIdPlanoOrigem,
                        piIdPlanoDestino,
                        piIdTitular,
                        piIdPessoa,
                        piSeqProposta  ) then
        begin
           bErroLocal := True;
           exit;
        end;



        if not GravaEVENTOSPREV
        then begin
           GravaErro('Erro na gravação no histórico de eventos.');
           Exit;
        end;

        FrmEventoTransfPlano.Update;
        Application.ProcessMessages;

        //roda padrão de movimentação
        //e zera reservas anteriores
        if not AssociaReservas( piIdPessJur,
                        piIdPlanoOrigem,
                        piIdPlanoDestino,
                        piIdTitular,
                        piIdPessoa,
                        piSeqProposta  ) then
        begin
           bErroLocal := True;
           exit;
        end;

        FrmEventoTransfPlano.Update;
        Application.ProcessMessages;


     end;



     //desassocia e associa contribuições
     //os beneficiários não precisam pois a
     //contribprevnucleo não é por plano
     if not AssociaContrib( piIdPessJur,
                     piIdPlanoOrigem,
                     piIdPlanoDestino,
                     piIdTitular,
                     piIdPessoa,
                     piSeqProposta  ) then
     begin
        bErroLocal := True;
        exit;
     end;

   End; 


   FrmEventoTransfPlano.Update;
   Application.ProcessMessages;


   if (not CdsBeneficiosParaConcessao.isempty)
     
   then begin
      //apenas faz o de-para e insere benef novos
      //os beneficiários são inscritos no novo plano neste momento
      if not InsereBeneficios( piIdPessJur,
                               piIdPlanoOrigem,
                               piIdPlanoDestino,
                               piIdTitular,
                               piIdPessoa,
                               piSeqProposta  ) then
      begin
         bErroLocal := True;
         exit;
      end;

      FrmEventoTransfPlano.Update;
      Application.ProcessMessages;

      //se os benefícios serão recalculados no destino
      if not chkManterValores.checked then
      begin

         //calcular benefícios na data
         //verificando ordem de cálculo, e atualizar a benefbfciario
         if not CalculaBeneficios( piIdPessJur,
                                   piIdPlanoOrigem,
                                   piIdPlanoDestino,
                                   piIdTitular,
                                   piIdPessoa,
                                   piSeqProposta,
                                   sIdBeneficios) then 
         begin
            bErroLocal := True;
            exit;
         end;

         FrmEventoTransfPlano.Update;
         Application.ProcessMessages;

         //fazer cálculo retroativo, gerando diferenças e
         //preparando o mês atual, conforme lote
         if not PreparaBeneficiosTransfPlano( piIdPessJur,
                                              piIdPlanoOrigem,
                                              piIdPlanoDestino,
                                              piIdTitular,
                                              piIdPessoa,
                                              piSeqProposta  ) then
         begin
            bErroLocal := True;
            exit;
         end;


         FrmEventoTransfPlano.Update;
         Application.ProcessMessages;


         //retira IDLOTE e MES igual ao MESREFERENCIA todos
         //os registros preparados nos meses em que os mesmos já foram pagos
         //em outro benefício
         //o  mesmo para contribuições
         //apenas os acertos e o pagamento/cobrança do mês devem ficar
         if not ModificaPreparosExcedentes( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta  ) then
         begin
            bErroLocal := True;
            GravaErro('Erro na modificação de benefícios/contribuições excedentes.');
            exit;
         end;

         FrmEventoTransfPlano.Update;
         Application.ProcessMessages;


         //apurar diferenças entre os benefícios (utilizando o de-para)
         //e lançar diferenças nos benefícios novos para a próxima folha

         if not AcertaBeneficioTransfPlano( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta  ) Then
         begin
            bErroLocal := True;
            exit;
         end;

         FrmEventoTransfPlano.Update;
         Application.ProcessMessages;
      end;

   end;

   
   if not VerificaMigraPlanoEmprestimo ( piIdPessJur,
                                         piIdPlanoOrigem,
                                         piIdPlanoDestino,
                                         piIdTitular,
                                         piIdPessoa )
   then begin
      bErroLocal := True;
      GravaErro('Erro na atualização do contrato de empréstimo. ');
      exit;
   end;
   

   

   Result := not bErroLocal;
end;

procedure TFrmEventoTransfPlano.btnRetirarClick(Sender: TObject);
begin
  inherited;
  if not  CdsBeneficiosParaConcessao.isempty then
  begin
     CdsBeneficiosParaConcessao.Delete;
     
  end;

  MostraTelaBeneficios;
end;

procedure TFrmEventoTransfPlano.BitBtn1Click(Sender: TObject);
begin
  inherited;
  tb97Param.visible := false;

  If CdsBeneficiosParaConcessao.Active Then Begin
    CdsBeneficiosParaConcessao.First;
    sIdBeneficios := '';
    While Not CdsBeneficiosParaConcessao.Eof Do Begin
      sIdBeneficios := sIdBeneficios+CdsBeneficiosParaConcessao.FieldByName('IDBENEFICIO').AsString+',';
      CdsBeneficiosParaConcessao.Next;
    End;
    sIdBeneficios := Copy(sIdBeneficios,1,(Length(sIdBeneficios)-1));
    CdsBeneficiosParaConcessao.First;
  End; 
end;

procedure TFrmEventoTransfPlano.MostraTelaBeneficios;
begin
   bJaMostrou := true;


   if CdsBeneficiosParaConcessao.isempty then
   begin

      if bindividual then
      begin
         qryAux.close;
         qryAux.sql.clear;
         qryAux.sql.add(' SELECT DISTINCT  BANT.NOME NOMEANT, B.NOME,  BF.NOMEVALORBASE1, '+
                        '  BF.NOMEVALORBASE2, BF.NOMEVALORBASE3, '+
                        '  BF.IDBENEFICIO,  BT.IDBENEFORIGEM , B.IDTPPAGTOBENEFIC, B.IDEVENTOGERADOR, '+
                        '  BF.IDREGRACALCOP1, BF.IDREGRACALCOP2, BF.IDREGRACALCOP3, '+
                        '  BT.IDRGELEGBENEFICIO, BT.IDRGCALCBENEFICIO , ' +
                        '  DECODE(B.FLGDESTBENEF ,''B'',''Beneficiário'',''P'',''Participante'',''Ambos'') DESTINOPAG, '+
                        '  '+sIdPlanoOrigem+' AS IDPLANPREVCONTAB, '+ 
                        '  BF.FLGREFERENCIA  '+ 
                        '  ,BF.IDREGRAFIM '+ 
                        '  FROM   BENEFPLANPREV BF, BENEFTRANSFPLANO BT  , BENEFICIO B, '+
                        '  BENEFICIO BANT, BENEFBFCIARIO BC '+
                        '  WHERE  BC.IDPESSJUR = '+sIdPessjurTransf+' '+
                        '  AND    BC.IDPESSOA = '+sIdPessoaTransf+' '+
                        '  AND    BC.IDSITBENEFICIO IN (1,2) '+
                        '  AND    BC.SEQPROPOSTA = '+sSeqPropostaTransf+' '+
                        '  AND    BC.IDPLANOPREV = '+sIdPlanoOrigem+' '+
                        '  AND    BC.IDPLANOPREV = BT.IDPLANOORIGEM '+
                        '  AND    BC.IDBENEFICIO = BT.IDBENEFORIGEM '+
                        '  AND    BF.IDPLANOPREV   = '+sIdPlanoDestino+
                        '  AND    BT.IDPLANOORIGEM = '+sIdPlanoOrigem+
                        '  AND    BT.IDPLANODEST   = '+sIdPlanoDestino+
                        '  AND    BT.IDBENEFDEST   = BF.IDBENEFICIO '+
                        '  AND    BT.IDEVENTOGERADOR = '+sIdEventoGerador+
                        '  AND    B.IDBENEFICIO = BF.IDBENEFICIO '+
                        
                        '  AND    BANT.IDBENEFICIO = BT.IDBENEFORIGEM '+
                        '  ORDER BY B.NOME ');
         qryAux.open;
      end
      else
      begin
         qryAux.close;
         qryAux.sql.clear;
         
         qryAux.sql.add(' SELECT DISTINCT  BANT.NOME NOMEANT, B.NOME,  BF.NOMEVALORBASE1, '+
                        '  BF.NOMEVALORBASE2, BF.NOMEVALORBASE3, '+
                        '  BF.IDBENEFICIO, BT.IDBENEFORIGEM , B.IDTPPAGTOBENEFIC, B.IDEVENTOGERADOR , '+
                        '  BF.IDREGRACALCOP1, BF.IDREGRACALCOP2, BF.IDREGRACALCOP3, ' +
                        '  BT.IDRGELEGBENEFICIO, BT.IDRGCALCBENEFICIO, '+
                        '  DECODE(B.FLGDESTBENEF ,''B'',''Beneficiário'',''P'',''Participante'',''Ambos'') DESTINOPAG , '+
                        '  '+sIdPlanoOrigem+' AS IDPLANPREVCONTAB, '+ 
                        '  BF.FLGREFERENCIA  '+ 
                        '  ,BF.IDREGRAFIM '+ 
                        '  FROM   BENEFPLANPREV BF, BENEFTRANSFPLANO BT  , BENEFICIO B, '+
                        '  BENEFICIO BANT '+
                        '  WHERE  BF.IDPLANOPREV   = '+sIdPlanoDestino+
                        '  AND    BT.IDPLANODEST   = '+sIdPlanoDestino+
                        '  AND    BT.IDPLANOORIGEM = '+sIdPlanoOrigem+
                        '  AND    BT.IDBENEFDEST   = BF.IDBENEFICIO '+
                        '  AND    BT.IDEVENTOGERADOR = '+sIdEventoGerador+
                        '  AND    B.IDBENEFICIO = BF.IDBENEFICIO '+
                        
                        '  AND    BANT.IDBENEFICIO = BT.IDBENEFORIGEM '+
                        '  ORDER BY B.NOME ');
         qryAux.open;
      end;


      while not qryaux.eof do
      begin
         if not CdsBeneficiosParaConcessao.active then CdsBeneficiosParaConcessao.open;

         CdsBeneficiosParaConcessao.Insert;
         CdsBeneficiosParaConcessao.fieldbyname('IDPLANOPREV').AsString       := sIdPlanoDestino;
         CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString       := qryaux.fieldbyname('IDBENEFICIO').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString     := qryaux.fieldbyname('IDBENEFORIGEM').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('IDTPPAGTOBENEFIC').AsString  := qryaux.fieldbyname('IDTPPAGTOBENEFIC').AsString;;
         CdsBeneficiosParaConcessao.fieldbyname('NOME').AsString              := qryaux.fieldbyname('NOME').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('NOMEANT').AsString           := qryaux.fieldbyname('NOMEANT').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('SETA').AsString              := ' > ' ;
         CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsString        := '' ;
         CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsString        := '' ;
         CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsString        := '' ;
         CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE1').AsString    := qryaux.fieldbyname('NOMEVALORBASE1').AsString ;
         CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE2').AsString    := qryaux.fieldbyname('NOMEVALORBASE2').AsString ;
         CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE3').AsString    := qryaux.fieldbyname('NOMEVALORBASE3').AsString ;
         CdsBeneficiosParaConcessao.fieldbyname('IDEVENTOGERADOR').AsString   := qryaux.fieldbyname('IDEVENTOGERADOR').AsString ;
         CdsBeneficiosParaConcessao.fieldbyname('IDREGRACALCOP1').AsString    := qryaux.fieldbyname('IDREGRACALCOP1').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('IDREGRACALCOP2').AsString    := qryaux.fieldbyname('IDREGRACALCOP2').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('IDREGRACALCOP3').AsString    := qryaux.fieldbyname('IDREGRACALCOP3').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('IDRGCALCBENEFICIO').AsString := qryaux.fieldbyname('IDRGCALCBENEFICIO').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('DESTINOPAG').AsString        := qryaux.fieldbyname('DESTINOPAG').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('IDPLANPREVCONTAB').AsString  := qryaux.fieldbyname('IDPLANPREVCONTAB').AsString;
         CdsBeneficiosParaConcessao.fieldbyname('FLGREFERENCIA').AsString     := qryaux.fieldbyname('FLGREFERENCIA').AsString; 
         CdsBeneficiosParaConcessao.fieldbyname('IDREGRAFIM').AsString        := qryaux.fieldbyname('IDREGRAFIM').AsString; 

         CdsBeneficiosParaConcessao.post;

         qryaux.next;
      end;
   end;


   AbreQryBenefNConcedidos;


   tb97Param.visible := true;
   tb97Param.Top := 71;
   tb97Param.Left := 64;

   if dtNovaDib.text = '' then dtNovaDib.text := dtEvento.text;

end;


procedure TFrmEventoTransfPlano.AbreQryBenefNConcedidos;
var sIdBeneficios : String;
begin

   if CdsBeneficiosParaConcessao.isempty then exit;

   CdsBeneficiosParaConcessao.first;
   sIdBeneficios := '';
   while not CdsBeneficiosParaConcessao.eof do
   begin
      CdsBeneficiosParaConcessao.next;

      if trim(sIdBeneficios) = '' then
      sIdBeneficios := CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString
      else sIdBeneficios := sIdBeneficios + ','+ CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString;

   end;


   if trim(sIdBeneficios) = '' then sIdBeneficios := '999'; 
   qrybenefnaoconcedidos.close;
   qrybenefnaoconcedidos.sql.text := ' SELECT BF.IDPLANOPREV, B.IDBENEFICIO , B.NOME, B.IDTPPAGTOBENEFIC, '+
                                     ' BF.NOMEVALORBASE1, BF.NOMEVALORBASE2, BF.NOMEVALORBASE3, '+
                                     ' B.IDEVENTOGERADOR, BF.IDREGRACALCULO,  '+
                                     ' BF.IDREGRACALCOP1, BF.IDREGRACALCOP2, BF.IDREGRACALCOP3, ' +
                                     ' DECODE(FLGDESTBENEF ,''B'',''Beneficiário'',''P'',''Participante'',''Ambos'') DESTINOPAG , '+
                                     '  '+sIdPlanoOrigem+' AS IDPLANPREVCONTAB, '+ 
                                     '  BF.FLGREFERENCIA  '+
                                     ' , BF.IDREGRAFIM '+ 
                                     ' FROM BENEFICIO B , BENEFPLANPREV BF '+
                                     ' WHERE  B.IDBENEFICIO = BF.IDBENEFICIO '+
                                     ' AND BF.IDPLANOPREV = '+sIdPlanoDestino+
                                     ' AND BF.IDBENEFICIO NOT IN ('+sIdBeneficios+') ';
                                     


   //se for individual
   if bIndividual then
   begin
      qrybenefnaoconcedidos.sql.text := qrybenefnaoconcedidos.sql.text  + '  AND FLGDESTBENEF <> ''B'' ';

      if (qryDadosNoPlanoOrigem.fieldbyname('IDPESSOA').AsInteger <>
          qryDadosNoPlanoOrigem.fieldbyname('IDTITULAR').AsInteger) then
      qrybenefnaoconcedidos.sql.text := qrybenefnaoconcedidos.sql.text + ' AND FLGDESTBENEF <> ''P'' ';

   end;


   qrybenefnaoconcedidos.open;


   CdsBeneficiosParaConcessao.first;

end;


function TfrmEventoTransfPlano.MontaDemonstrativoIndiv( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
var dTotalBeneficio : double;
    sSalarioNaDib   : string;
    sOpcoesContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
    bAlgumPagadorPatro : boolean;
    dValorAtualBenef, dValorNaDib        : double;

    sFormato, sAnoMesAtual, sRecebedorAtual, sSQL : string;
    iIdRecebedorAtual             : longint;
    dValorIntegralNaDib,
    dVlrIndice, dValorTotalNaDib, dValorLiq              : double;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo de cálculos...');

   
      qryDadosNoPlanoOrigem.Close;
      qryDadosNoPlanoOrigem.ParamByName('IDPESSJUR').AsInteger        := piIdPessJur;
      qryDadosNoPlanoOrigem.ParamByName('IDPLANOPREV').AsInteger      := piIdPlanoOrigem;
      qryDadosNoPlanoOrigem.ParamByName('IDPESSOA').AsInteger         := piIdPessoa;
      qryDadosNoPlanoOrigem.ParamByName('IDTITULAR').AsInteger        := piIdTitular;
      qryDadosNoPlanoOrigem.ParamByName('SEQPROPOSTA').AsInteger      := piSeqProposta;
      qryDadosNoPlanoOrigem.ParamByName('ENCERRADOS').AsInteger       := 1;
      qryDadosNoPlanoOrigem.Open;
      sNomeCorrente := qryDadosNoPlanoOrigem.FieldByName('NOMEPARTICIP').AsString;
   

   // Verificar conta bancaria do recebedor
   qryContaBancaria.Close;
   qryContaBancaria.ParamByName('IdPessoa').Value := piIdPessoa;
   qryContaBancaria.Open;

   if not qrydet.isempty then
   begin
      if qryDet.FieldByName('IDRESPONSAVEL').AsInteger <> piIdPessoa
      then begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdResponsavel').AsInteger;
         qryContaBancaria.Open;
      end;
   end;

   with memResult.Lines do
   begin
      Add('');
      Add('----------------------------------------------------------------------------------------------');
      Add('                                 TRANSFERÊNCIA DE PLANO                    DATA   : '+DateToStr(date));
      Add('                                DEMONSTRATIVO DE CÁLCULOS                  VERSÃO : '+Sistema.Versao);
      Add('                                                                           LOTE   : '+IntToStr(iIdLote));
      Add('USUÁRIO : '+Sistema.NomeUsuario+'                                                             ');
      Add('----------------------------------------------------------------------------------------------');
      Add(PreparaStr('Transferência de Plano de : '+sNomeCorrente,60));
      Add(' ');
      Add('Data de Nascimento  : '+        qryDadosNoPlanoOrigem.FieldByName('DataNasc').AsString);
      Add('Data do Falecimento : '+        qryDadosNoPlanoOrigem.FieldByName('DataMorte').AsString);
      Add(PreparaStr('Patrocinadora  : '  +qryDadosNoPlanoOrigem.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryDadosNoPlanoOrigem.FieldByName('Matricula').AsString,49));
      Add(PreparaStr('Data de Admissão : '+qryDadosNoPlanoOrigem.FieldByName('DataAdmissao').AsString,50)+
          PreparaStr('Data de Demissão : '+qryDadosNoPlanoOrigem.FieldByName('DataDemissao').AsString,49));




      if piIdTitular = piIdPessoa
      then begin
         qryaux.close;
         qryaux.sql.Text := ' SELECT INSCRICAONUMERO, INSCRICAODATA FROM PARTPREVPLAN '+
                            ' WHERE IDPESSJUR = '+IntToStr(piIdPessJur)+' '+
                            ' AND IDPLANOPREV = '+IntToStr(piIdPlanoDestino)+' '+
                            ' AND IDPESSOA = '+   IntToStr(piIdPessoa)+' ';
         qryaux.open;

         if not qryaux.isempty then
         begin

            Add(' ');
            Add(PreparaStr('Plano de Origem : '+edPlano.text,50)+
                PreparaStr('Plano de Destino: '+dblkpNovoPlano.text,49));
            Add(' ');
            Add(PreparaStr('Dados no Plano de Origem : ',50)+
                PreparaStr('Dados no Plano de Destino: ',49));


            Add(PreparaStr('      No. de Inscrição  : '+qryDadosNoPlanoOrigem.FieldByName('INSCRICAONUMERO').AsString ,50)+
                PreparaStr('      No. de Inscrição  : '+qryaux.FieldByName('INSCRICAONUMERO').AsString,49));

            Add(PreparaStr('      Data de Inscrição : '+qryDadosNoPlanoOrigem.FieldByName('INSCRICAODATA').AsString ,50)+
                PreparaStr('      Data de Inscrição : '+qryaux.FieldByName('INSCRICAODATA').AsString,49));
         end;

      end;



      // Conta Bancaria
      Add('----------------------------------------------------------------------------------------------');
      Add('Conta Bancária Preferencial : ');
      if not qryContaBancaria.IsEmpty
      then begin
         Add('Banco    : '+qryContaBancaria.FieldByName('Banco').AsString);
         Add('Agência  : '+qryContaBancaria.FieldByName('Agencia').AsString);
         Add('Conta Nº : '+qryContaBancaria.FieldByName('ContaCorrente').AsString);
      end
      else begin
         Add(' < não cadastrada até o momento > ');
      end;

      // Reservas
      Add('');
      Add('----------------------------------------------------------------------------------------------');
      Add('=> SALDO DE RESERVAS EM COTAS ');
      Add('----------------------------------------------------------------------------------------------');

      qryaux.close;
      qryaux.sql.text := 'SELECT RP.NOME, M.MOESIGLA, R.VALORRESERVA '+
                     ' FROM RESERVAXPLANO RP, MOEDA M, RESERVAPART R '+
                     ' WHERE R.IDPESSJUR = '+IntToStr(piIdPessjur)+' AND '+
                     ' R.IDPLANOPREV = '+IntToStr(piIdPlanoDestino)+' AND '+
                     ' R.IDPESSOA = '+IntToStr(piIdTitular)+' AND '+
                     ' NVL(R.VALORRESERVA,0) > 0  AND '+
                     ' RP.IDPLANOPREV = R.IDPLANOPREV  AND '+
                     ' RP.IDTIPORESERVA = R.IDTIPORESERVA AND '+
                     ' M.MOECODIGO = RP.INDICEREAJUSTE ';
      qryaux.open;


      if not qryaux.IsEmpty
      then begin
         Add('RESERVAS                                          SIGLA       VALOR     ');
         Add(' ');

         while not qryaux.Eof do
         begin
            Add( PreparaStr(qryaux.FieldByName('NOME').AsString                          ,50)+
                 PreparaStr(qryaux.FieldByName('MOESIGLA').AsString                     ,10)+  
                 PreparaStr(' '                                                            ,1)+   
                 PreparaStr(FormatFloat('#0.000000',qryaux.FieldByName('VALORRESERVA').AsFloat)    ,20));
            qryaux.Next;
         end;
      end
      else begin
         Add(' < nenhum valor de reserva registrado > ');
      end;


   end;


   if piIdTitular =  piIdPessoa
   then begin
      // Exibir dados do participante
      with memResult.Lines do
      begin

         if not qrydet.isempty then
         begin

            Add('');
            Add('----------------------------------------------------------------------------------------------');
            Add('=> BENEFÍCIOS CONCEDIDOS :');

            qryDet.First;
            dTotalBeneficio := 0;
            while not qryDet.Eof do
            begin
               Add('----------------------------------------------------------------------------------------------');
               Add('- '+qryDet.FieldByName('Nome').AsString);
               Add(' ');
               Add(' '+PreparaStr('Data de Requerimento : '+qryDet.FieldByName('DataRequerimento').AsString, 50)+
                   PreparaStr('Data de Concessão : '+DateToStr(date), 49));

               if qryDet.FieldByName('FlgResgate').AsInteger = 0 // nao é resgate
               then begin
                  Add(' '+PreparaStr('Data de Início no INSS : '+qryDet.FieldByName('DataInicioINSS').AsString,50)+
                      PreparaStr('Data de Início na Fundação : '+qryDet.FieldByName('DataInicioFUND').AsString,49));

                  if (qryDet.FieldByName('FLGDATAPREVISTA').AsInteger = 1) and (qryDet.FieldByName('DATAFINALPREVISTA').AsString <> '')
                  then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Prevista) : '+qryDet.FieldByName('DATAFINALPREVISTA').AsString,49))
                  else if qryDet.FieldByName('DATAFINAL').AsString <> ''
                       then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Efetiva) : '+qryDet.FieldByName('DATAFINAL').AsString,49))
                       else Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final : <indefinida> ',49));

                  Add(' '+PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRCALCINSS').AsFloat),50)+
                      PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRINFINSS').AsFloat),49));
               end
               else begin // é resgate
                  Add(' Data de Início na Fundação : '+qryDet.FieldByName('DataInicioFUND').AsString);
               end;

               sSalarioNaDib := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qry,
                                                             piIdPessjur,
                                                             piIdPlanoDestino,
                                                             piIdTitular,
                                                             piSeqProposta,
                                                             'AS',
                                                             Copy(qryDet.FieldByName('DataInicioFUND').AsString,7,4)+'/'+Copy(qryDet.FieldByName('DataInicioFUND').AsString,4,2));

               Add(' Salário de Participação anterior ao Evento = R$ '+FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioNaDib))));


               
               dValorAtualBenef := PegaValorIntegral( dtmAPrev.qry,
                                                 qryDet.FieldByName('NUMEROPROCESSO').AsInteger,
                                                 qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                                 piIdTitular,
                                                 sDataFolha );


               Add(' '+PreparaStr('Valor do Benefício = R$ '+FormatFloat('#0.00', dValorAtualBenef ),50)+ 
                       PreparaStr('Valor do Benefício Original = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VALORATUAL').AsFloat),49));


               dTotalBeneficio := dTotalBeneficio + dValorAtualBenef; 

               qryDet.Next;
            end; 


            Add(' Total dos Benefícios do Processo : '+FormatFloat('#0.00', dTotalBeneficio));



            //parte dos benefícios e contribuições
            qryDet.First;

            // Mostrar mês a mês quanto será pago e quanto será descontado
            Add('');
            Add('----------------------------------------------------------------------------------------------');
            Add('=> BASE DOS VALORES A PAGAR / RECEBER                                                           ');
            Add('----------------------------------------------------------------------------------------------');
            Add('MÊS      ITEM                                     PAGAR       DESCONTAR  [ORIGINAL] SRB     ');
            Add(' ');


            // Buscar BENEFICIOS a pagar/receber no mês
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV, H.VALORPREVMIN, '+
                       '  DECODE(BPP.FLGREFERENCIA,0,H.VALORSRB,NULL) VALORSRB, H.FLGDEVOLUCAO  '+
                       ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '+
                       ' WHERE  NVL(H.IDLOTE,0)    <> '+IntToStr(iIdLote)+
                       ' AND    H.IDPESSJUR        = '+IntToStr(piIdPessjur)+
                       ' AND    H.IDPESSOA         = '+IntToStr(piIdTitular)+
                       ' AND    H.MESREFERENCIA    >= TO_CHAR(TO_DATE('''+dtNovaDib.text+''',''DD/MM/YYYY''),''YYYY/MM'') '+
                       ' AND    BPP.FLGREFERENCIA = 0 '+
                       ' AND    H.SEQPROPOSTA      = 1 '+
                       ' AND    BPP.IDBENEFICIO = H.IDBENEFICIO '+
                       ' AND    BPP.IDPLANOPREV = H.IDPLANOPREV '+
                       
                       ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                       ' ORDER BY H.MESREFERENCIA , B.NOME ');
               Open;


               while not Eof do
               begin
                  if fieldbyname('FLGDEVOLUCAO').AsInteger = 0 then
                  begin
                     Add( PreparaStr(FieldByName('MesReferencia').AsString                          ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                   ,40)+  
                          PreparaStr(' '                                                            ,1)+   
                          PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)    ,12)+  
                          PreparaStr('(-)'+FormatFloat('#0.00',0)                                   ,10)+  
                          PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrevMin').AsFloat) ,12)+  
                          PreparaStr(FormatFloat('#0.00',FieldByName('VALORSRB').AsFloat)           ,11));
                  end
                  else
                  begin
                     Add( PreparaStr(FieldByName('MesReferencia').AsString                          ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                   ,40)+  
                          PreparaStr(' '                                                            ,1)+   
                          PreparaStr('(+)'+FormatFloat('#0.00',0)    ,12)+  
                          PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)    ,10)+  
                          PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrevMin').AsFloat) ,12)+ 
                          PreparaStr(FormatFloat('#0.00',FieldByName('VALORSRB').AsFloat)           ,11));
                  end;

                  Next;
               end;
            end;

            // Buscar CONTRIBUICOES a cobrar/devolver no mês
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT C.NOME, CP.FLGPAGADOR, HST.MESREFERENCIA, HST.VALORESPERADO , HST.FLGDEVOLUCAO   '+
                       ' FROM   CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST '+
                       ' WHERE  HST.IDPESSJUR       = ' + IntToStr(piIdPessjur)  +
                       ' AND    HST.IDPESSOA        = ' + IntToStr(piIdTitular) +
                       ' AND    HST.SEQPROPOSTA     = ' + IntToStr(piSeqProposta) +
                       ' AND    NVL(HST.IDLOTE,0)   <> '+IntToStr(iIdLote)+
                       ' AND    HST.MESREFERENCIA    >= TO_CHAR(TO_DATE('''+dtNovaDib.text+''',''DD/MM/YYYY''),''YYYY/MM'') '+
                       
                       ' AND    HST.FLGDESCFOLHA    = 1 '+
                       
                       ' AND    HST.FLGSITFUNDACAO  =  '''+sFlgInternoAntes+'''  '+
                       ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                       ' AND    CP.IDPLANOPREV      = HST.IDPLANOPREV     '+
                       ' AND    CP.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO  '+
                       ' ORDER BY  HST.MESREFERENCIA, C.NOME ');
               Open;

               while not Eof do
               begin
                  if fieldbyname('FLGDEVOLUCAO').AsInteger = 1 then
                  begin
                     Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                    ,40)+
                          PreparaStr(' '                                                             ,1)+
                          PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+
                          PreparaStr('(-)'+FormatFloat('#0.00',0)                                    ,10));
                  end
                  else
                  begin
                     Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                    ,40)+
                          PreparaStr(' '                                                             ,1)+
                          PreparaStr('(+)'+FormatFloat('#0.00',0) ,12)+
                          PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat)  ,10));
                  end;

                  Next;
               end;
            end;


            Add('');
            Add('----------------------------------------------------------------------------------------------');
            Add('=> VALORES A PAGAR / RECEBER                                                           ');
            Add('----------------------------------------------------------------------------------------------');
            Add('MÊS      ITEM                                     PAGAR       DESCONTAR  [ORIGINAL] SRB     ');
            Add(' ');

            // Buscar Beneficios a devolver/pagar no mês
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV, H.FLGDEVOLUCAO, H.IDLOTE '+
                       ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H '+
                       ' WHERE  H.IDLOTE          = '+IntToStr(iIdLote)+
                       ' AND    H.IDPESSJUR       = '+IntToStr(piIdPessjur)+
                       ' AND    H.IDPESSOA        = '+IntToStr(piIdTitular)+
                       ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino) +
                       ' AND    H.SEQPROPOSTA     = 1 '+
                       
                       ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                       ' ORDER BY H.MESREFERENCIA, B.NOME  ');
               Open;

               while not Eof do
               begin

                  if fieldbyname('FLGDEVOLUCAO').AsInteger = 1 then
                  begin
                     Add( PreparaStr(FieldByName('MESREFERENCIA').AsString                        ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                          PreparaStr(' '                                                          ,1)+
                          PreparaStr('(+)'+FormatFloat('#0.00',0)                                 ,12)+
                          PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)  ,10)

                          

                          );

                     
                  end
                  else
                  begin
                     Add( PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                          PreparaStr(' '                                                          ,1)+
                          PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)  ,12)+
                          PreparaStr('(-)'+FormatFloat('#0.00',0)  ,10)

                          
                          );

                     
                  end;


                  Next;
               end;
            end;


            // Buscar CONTRIBUICOES a COBRAR no mês
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT C.IDCONTRIBUICAO, C.NOME, CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, CP.NUMOPCOES, '+
                       '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                                '+
                       '        CP.FLGPAGADOR, HST.FLGDEVOLUCAO ,                                                '+
                       '        HST.MESREFERENCIA, HST.VALORESPERADO                                           '+
                       ' FROM   CONTRIBUICAO C, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST '+
                       ' WHERE  HST.IDPESSJUR       = ' +  IntToStr(piIdPessJur)  +
                       ' AND    HST.IDPLANOPREV     = ' +  IntToStr(piIdPlanoDestino) +
                       ' AND    HST.IDPESSOA        = ' +  IntToStr(piIdTitular)  +
                       ' AND    HST.SEQPROPOSTA     = ' +  IntToStr(piSeqProposta) +
                       ' AND    HST.IDLOTE          = '+IntToStr(iIdLote)+
                       
                       ' AND    HST.FLGDESCFOLHA    = 1 '+
                       
                       ' AND    HST.FLGSITFUNDACAO  =  '''+sFlgInternoDepois+'''  '+
                       ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                       ' AND    CPP.IDPESSJUR       = HST.IDPESSJUR       '+
                       ' AND    CPP.IDPLANOPREV     = HST.IDPLANOPREV     '+
                       ' AND    CPP.IDPESSOA        = HST.IDPESSOA        '+
                       ' AND    CPP.SEQPROPOSTA     = HST.SEQPROPOSTA     '+
                       ' AND    CPP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO  '+
                       ' AND    CP.IDPLANOPREV      = CPP.IDPLANOPREV     '+
                       ' AND    CP.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO  '+
                       ' ORDER BY HST.MESREFERENCIA, C.NOME  ');
               Open;
               sOpcoesContrib     := '';
               iIdContribAnterior := -1;
               while not Eof do
               begin
                  if fieldbyname('FLGDEVOLUCAO').AsInteger = 0 then
                  begin
                     Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                    ,40)+
                          PreparaStr(' '                                                             ,1)+
                          PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+
                          PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,10));

                     
                  end
                  else
                  begin
                     Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                          PreparaStr(FieldByName('Nome').AsString                                    ,40)+
                          PreparaStr(' '                                                             ,1)+
                          PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+
                          PreparaStr('(-)'+FormatFloat('#0.00',0) ,10));

                     
                  end;

                  Next;
               end;
            end;


         end;


         
         // contribuições
         sOpcoesContrib := '';

         qryaux.close;
         qryaux.sql.text := ' SELECT C.NOME, NVL(CP.VALORBASE1,0) VALORBASE1, '+
                        ' NVL(CP.VALORBASE2,0) VALORBASE2, NVL(CP.VALORBASE3,0) VALORBASE3 '+
                        ' FROM CONTRIBPREVPARTP CP, CONTRIBUICAO C '+
                        ' WHERE CP.IDPESSJUR = '+IntToStr(piIdPessjur)+' AND '+
                        ' CP.IDPLANOPREV = '+IntToStr(piIdPlanoDestino)+' AND '+
                        ' CP.IDPESSOA = '+IntToStr(piIdTitular)+' AND '+
                        ' C.IDCONTRIBUICAO =CP.IDCONTRIBUICAO ';
         qryaux.open;


         if not qryaux.IsEmpty
         then begin

            while not qryaux.Eof do
            begin
               sOpcoesContrib := sOpcoesContrib+#13+#10+
                                 PreparaStr(qryaux.FieldByName('Nome').AsString    ,50)+
                                 PreparaStr(' '                                                   ,5)+
                                 PreparaStr(FormatFloat('#0.0000',qryaux.FieldByName('VALORBASE1').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',qryaux.FieldByName('VALORBASE2').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',qryaux.FieldByName('VALORBASE3').AsFloat) ,7);
               qryaux.Next;
            end;

            Add('');
            Add('----------------------------------------------------------------------------------------------');
            Add('=> OPÇÕES DE CONTRIBUIÇÕES A COBRAR  ');
            Add('----------------------------------------------------------------------------------------------');
            Add('CONTRIBUIÇÃO                                           OPÇÃO 1      OPÇÃO 2      OPÇÃO 3 ');
            Add(sOpcoesContrib);
         end
         else begin
            Add(' < nenhuma contribuição associada > ');
         end;


      end; 

   end
   else  
   begin

      with memResult.Lines do
      begin


         if not qrydet.isempty then
         begin
            Add('');
            Add('-----------------------------------------------------------------------------------------------------');
            Add('=> BENEFÍCIOS CONCEDIDOS :');
            Add('-----------------------------------------------------------------------------------------------------');

            
            qryTotalRecebedor.Close;
            qryTotalRecebedor.ParamByName('IdPessoa').AsInteger := -1;
            qryTotalRecebedor.Open;


            qryDet.First;
            while not qryDet.Eof do
            begin
               Add('     => '+qryDet.FieldByName('Nome').AsString+ ' para '+ qryDet.FieldByName('Depen').AsString);

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+ IntToStr(qryDet.FieldByName('IdResponsavel').AsInteger) );
               qryAux.Open;

               if qryAux.FieldByName('NOME').AsString = ''
               then begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+ IntToStr(qryDet.FieldByName('IdPessoa').AsInteger) );
                  qryAux.Open;
               end;
               Add('        Recebedor : '+qryAux.FieldByName('Nome').AsString);

               if qryTotalRecebedor.Locate('IdPessoa',qryDet.FieldByName('IdResponsavel').AsInteger,[])
               then begin
                  qryTotalRecebedor.Edit;
                  qryTotalRecebedor.FieldByName('Total').AsFloat := qryTotalRecebedor.FieldByName('Total').AsFloat + qryDet.FieldByName('VALORATUAL').AsFloat;
                  qryTotalRecebedor.Post;
               end
               else begin
                  qryTotalRecebedor.Insert;
                  qryTotalRecebedor.FieldByName('IdPessoa').AsInteger := qryDet.FieldByName('IdResponsavel').AsInteger;
                  qryTotalRecebedor.FieldByName('Nome').AsString      := qryAux.FieldByName('Nome').AsString;
                  qryTotalRecebedor.FieldByName('Total').AsFloat      := qryDet.FieldByName('VALORATUAL').AsFloat;
                  qryTotalRecebedor.Post;
               end;

               Add(' ');
               Add('        '+ PreparaStr('Data de Requerimento : '+qryDet.FieldByName('DataRequerimento').AsString, 50)+
                               PreparaStr('Data de Concessão : '+DateToStr(date), 49));

               Add('        '+ PreparaStr('Data de Início no INSS : '+qryDet.FieldByName('DataInicioINSS').AsString,50)+
                               PreparaStr('Data de Início na Fundação : '+qryDet.FieldByName('DataInicioFUND').AsString, 49));

               if (qryDet.FieldByName('FLGDATAPREVISTA').AsInteger = 1) and (qryDet.FieldByName('DATAFINALPREVISTA').AsString <> '')
               then Add('        '+PreparaStr(' ',50)+PreparaStr('Data Final (Prevista) : '+qryDet.FieldByName('DATAFINALPREVISTA').AsString,49))
               else if qryDet.FieldByName('DATAFINAL').AsString <> ''
                    then Add('        '+PreparaStr(' ',50)+PreparaStr('Data Final (Efetiva) : '+qryDet.FieldByName('DATAFINAL').AsString,49))
                    else Add('        '+PreparaStr(' ',50)+PreparaStr('Data Final : <indefinida> ',49));


               Add('        '+ PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRCALCINSS').AsFloat),50)+
                               PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRINFINSS').AsFloat), 49));

               dValorIntegralNaDib := PegaValorIntegral( dtmAPrev.qry,
                                                         qryDet.FieldByName('NUMEROPROCESSO').AsInteger,
                                                         qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                                         qryDet.FieldByName('IDPESSOA').AsInteger,
                                                         qryDet.FieldByName('DATAINICIOFUND').AsString );
               dValorTotalNaDib    := PegaValorTotal   ( dtmAPrev.qry,
                                                         qryDet.FieldByName('NUMEROPROCESSO').AsInteger,
                                                         qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                                         qryDet.FieldByName('IDPESSOA').AsInteger,
                                                         qryDet.FieldByName('DATAINICIOFUND').AsString );

               Add('        '+ PreparaStr('Valor Total do Benefício = R$ '+FormatFloat('#0.00', dValorTotalNaDib) ,50)+
                               PreparaStr('Data Início Pagamento : '+qryDet.FieldByName('DataInicio').AsString, 49));


               Add('        '+ PreparaStr('Valor Rateado do Benefício = R$ '+FormatFloat('#0.00', dValorIntegralNaDib),50));

               Add('-----------------------------------------------------------------------------------------------------');
               qryDet.Next;
            end; 



            //parte de cálculos anteriores e feitos pela transferência que servirão de base para os acertos
            // Mostrar mês a mês quanto será pago e quanto será descontado
            Add('');
            Add('-----------------------------------------------------------------------------------------------------');
            Add('=> BASE DE BENEFÍCIOS A PAGAR                                                                                ');
            Add('-----------------------------------------------------------------------------------------------------');
            Add(' ');


            // Buscar BENEFICIOS a pagar no mês
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT DECODE(P.NOME , NULL, BENEF.NOME, P.NOME) AS RECEBEDOR, BP.FLGCALCTODOMES,                      '+
                       '        DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF) AS FLGISENTOIRRF,                '+
                       '        DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL) AS IDRESPONSAVEL,           '+
                       '        SUM(DECODE(BP.FLGREFERENCIA, 1, 0, H.VALORSRB)) AS VALORSRB, '+ 
                       '        B.NOME, H.MESREFERENCIA, H.FLGDEVOLUCAO, ' +
                       '        SUM(H.VALORPREV) AS VALORPREV , SUM(H.VALORINTEGRAL) AS VALORINTEGRAL,'+ 
                       '        BP.FLGREFERENCIA, BF.DATAINICIOFUND '+
                       ' FROM   PESSOA BENEF, PESSOA P, PESSOAFISICA PFBENEF, PESSOAFISICA PF, BENEFICIO B, BENEFPLANPREV BP,   '+
                       '        BFCIARIOTITPLAN BTIT, HSTBENEFBFCIARIO H, BENEFBFCIARIO BF '+
                       ' WHERE  NVL(H.IDLOTE,0)    <> '+IntToStr(iIdLote)      +
                       ' AND    H.IDPESSJUR        = '+IntToStr(piIdPessJur)            +
                       
                       ' AND    H.IDTITULAR        = '+IntToStr(piIdTitular)            +
                       ' AND    BP.FLGREFERENCIA = 0 '+
                       ' AND    H.MESREFERENCIA    >= TO_CHAR(TO_DATE('''+dtNovaDib.text+''',''DD/MM/YYYY''),''YYYY/MM'') '+
                       ' AND    H.SEQPROPOSTA      = 1                                '+
                       ' AND    H.IDMOTIVO         <> '+IntToStr(prmIdMotDevolNaoIden) +
                       ' AND    B.IDBENEFICIO      = H.IDBENEFICIO                    '+
                       ' AND    BF.NUMEROPROCESSO  = H .NUMEROPROCESSO                '+
                       ' AND    BF.IDPLANOORIGEM   = H.IDPLANOORIGEM                  '+
                       ' AND    BF.IDPLANOPREV     = H.IDPLANOPREV                    '+
                       ' AND    BF.IDPESSJUR       = H.IDPESSJUR                      '+
                       ' AND    BF.IDTITULAR       = H.IDTITULAR                      '+
                       ' AND    BF.IDPESSOA        = H.IDPESSOA                       '+
                       ' AND    BF.SEQPROPOSTA     = H.SEQPROPOSTA                    '+
                       ' AND    BF.IDBENEFICIO     = H.IDBENEFICIO                    '+
                       ' AND    BTIT.IDPESSJUR     = BF.IDPESSJUR                     '+
                       ' AND    BTIT.IDPLANOPREV   = BF.IDPLANOPREV                   '+
                       ' AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM                 '+
                       ' AND    BTIT.IDTITULAR     = BF.IDTITULAR                     '+
                       ' AND    BTIT.SEQPROPOSTA   = BF.SEQPROPOSTA                   '+
                       ' AND    BTIT.IDPESSOA      = BF.IDPESSOA                      '+
                       ' AND    BTIT.IDBENEFICIO   = BF.IDBENEFICIO                   '+
                       ' AND    BENEF.IDPESSOA     = BTIT.IDPESSOA                    '+
                       ' AND    PFBENEF.IDPESSOA   = BTIT.IDPESSOA                    '+
                       ' AND    P.IDPESSOA(+)      = BTIT.IDRESPONSAVEL               '+
                       ' AND    PF.IDPESSOA(+)     = BTIT.IDRESPONSAVEL               '+
                       ' AND    BP.IDPLANOPREV     = H.IDPLANOPREV                    '+
                       ' AND    BP.IDBENEFICIO     = H.IDBENEFICIO                    '+
                       ' GROUP BY '+
                       '   DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                       '   BP.FLGCALCTODOMES, '+
                       '   DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF), '+
                       '   DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL), '+
                       '   B.NOME,           '+
                       '   H.MESREFERENCIA,  '+
                       '   H.FLGDEVOLUCAO,   '+
                       '   BP.FLGREFERENCIA, '+
                       '   BF.DATAINICIOFUND '+
                       'ORDER BY  '+
                       ' DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                       ' H.FLGDEVOLUCAO, '+
                       ' H.MESREFERENCIA, B.NOME  ');
               Open;
               First;

               if FieldByName('FLGCALCTODOMES').AsInteger = 0
               then sFormato := '#0.00'
               else sFormato := '#0.0000';
               sRecebedorAtual   := '';
               iIdRecebedorAtual := -1;

               while (not Eof) do
               begin
                  sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
                  iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;
                  if FieldByName('FLGISENTOIRRF').AsInteger = 0
                  then Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                           PreparaStr('Isento de Imposto de Renda : Não ', 49))
                  else Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                           PreparaStr('Isento de Imposto de Renda : Sim ', 49));

                  Add('   MÊS      ITEM                                    PAGAR          DESCONTAR    [INTEGRAL]    SRB');
                  // Mostrar os beneficios deste recebedor
                  while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
                  begin
                     if FieldByName('FLGDEVOLUCAO').AsInteger = 0
                     then Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                              PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15)+
                              PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,13)+
                              PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorIntegral').AsFloat) ,14)+
                              PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,15) )
                     else Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                              PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                              PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,13)+
                              PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,14)+
                              PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,15) );
                     Next;
                  end; 
               end; 
            end;



            // Mostrar acertos de tratamento pos-morte
            Add('-----------------------------------------------------------------------------------------------------');
            Add('=> BASE DE CONTRIBUIÇÕES DO PENSIONISTA                                                                   ');
            Add('-----------------------------------------------------------------------------------------------------');
            Add(' ');


            // Buscar ACERTOS
            with qryAux do
            begin
               Close;
               SQL.Clear;
               sSQL := ' SELECT DISTINCT P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVEL,     '+
                       '        CO.NOME,   H.MESREFERENCIA,                            '+
                       '        H.VALORESPERADO AS VALORPREV ,                '+
                       
                       ' H.FLGDEVOLUCAO '+ 
                       ' FROM   PESSOA P, HSTCONTRIBPREV H, CONTRIBUICAO CO , BFCIARIOTITPLAN BT      '+
                       ' WHERE  NVL(H.IDLOTE,0)    <> '+IntToStr(iIdLote)+
                       ' AND    H.IDPESSJUR        = '+IntToStr(piIdPessJur)+
                       
                       ' AND    H.MESREFERENCIA    >= TO_CHAR(TO_DATE('''+dtNovaDib.text+''',''DD/MM/YYYY''),''YYYY/MM'') '+
                       ' AND    H.IDPESSOA         =  BT.IDRESPONSAVEL '+
                       ' AND    H.SEQPROPOSTA      = 1        '+
                       ' AND    BT.IDPESSJUR  =  H.IDPESSJUR '+
                       ' AND    BT.IDPLANOPREV = H.IDPLANOPREV '+
                       ' AND    BT.IDTITULAR =   '+IntToStr(piIdTitular)+' '+
                       ' AND    BT.SEQPROPOSTA =  1 '+
                       ' AND    CO.IDCONTRIBUICAO    = H.IDCONTRIBUICAO        '+
                       ' AND    P.IDPESSOA         = H.IDPESSOA                                            '+
                       ' ORDER BY H.IDPESSOA,  H.MESREFERENCIA, CO.NOME ';
               SQL.Add(sSQL);
               Open;

               while (not Eof) do
               begin
                  sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
                  iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

                  Add(' - RESPONSÁVEL : '+sRecebedorAtual);
                  Add('   MÊS      ITEM                                    PAGAR          DESCONTAR      ');
                  // Mostrar os beneficios deste recebedor
                  while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
                  begin
                     if FieldByName('FLGDEVOLUCAO').AsInteger = 1
                     then Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                              PreparaStr(FieldByName('Nome').AsString                          ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15)+
                              PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,15))
                     else Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                              PreparaStr(FieldByName('Nome').AsString                          ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                              PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15));
                     Next;
                  end; 
               end; 
            end;




            //parte de acertos feitos pela transferência
            //Mostrar mês a mês quanto será pago e quanto será descontado
            Add('');
            Add('-----------------------------------------------------------------------------------------------------');
            Add('=> BENEFÍCIOS A PAGAR                                                                                ');
            Add('-----------------------------------------------------------------------------------------------------');
            Add(' ');


            // Buscar BENEFICIOS a pagar no mês
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT DECODE(P.NOME , NULL, BENEF.NOME, P.NOME) AS RECEBEDOR, BP.FLGCALCTODOMES,                      '+
                       '        DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF) AS FLGISENTOIRRF,                '+
                       '        DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL) AS IDRESPONSAVEL,           '+
                       '        SUM(DECODE(BP.FLGREFERENCIA, 1, 0, H.VALORSRB)) AS VALORSRB, '+ 
                       '        B.NOME, H.MESREFERENCIA, H.FLGDEVOLUCAO, ' +
                       '        SUM(H.VALORPREV) AS VALORPREV , SUM(H.VALORINTEGRAL) AS VALORINTEGRAL,'+ 
                       '        BP.FLGREFERENCIA, BF.DATAINICIOFUND '+
                       ' FROM   PESSOA BENEF, PESSOA P, PESSOAFISICA PFBENEF, PESSOAFISICA PF, BENEFICIO B, BENEFPLANPREV BP,   '+
                       '        BFCIARIOTITPLAN BTIT, HSTBENEFBFCIARIO H, BENEFBFCIARIO BF '+
                       ' WHERE  H.IDLOTE           = '+IntToStr(iIdLote)      +
                       ' AND    H.IDPESSJUR        = '+IntToStr(piIdPessJur)            +
                       ' AND    H.IDPLANOPREV    = '+IntToStr(piIdPlanoDestino)          +
                       ' AND    H.IDTITULAR        = '+IntToStr(piIdTitular)            +
                       ' AND    H.SEQPROPOSTA      = 1                                '+
                       ' AND    H.IDMOTIVO         <> '+IntToStr(prmIdMotDevolNaoIden) +
                       ' AND    B.IDBENEFICIO      = H.IDBENEFICIO                    '+
                       ' AND    BF.NUMEROPROCESSO  = H .NUMEROPROCESSO                '+
                       ' AND    BF.IDPLANOORIGEM   = H.IDPLANOORIGEM                  '+
                       ' AND    BF.IDPLANOPREV     = H.IDPLANOPREV                    '+
                       ' AND    BF.IDPESSJUR       = H.IDPESSJUR                      '+
                       ' AND    BF.IDTITULAR       = H.IDTITULAR                      '+
                       ' AND    BF.IDPESSOA        = H.IDPESSOA                       '+
                       ' AND    BF.SEQPROPOSTA     = H.SEQPROPOSTA                    '+
                       ' AND    BF.IDBENEFICIO     = H.IDBENEFICIO                    '+
                       ' AND    BTIT.IDPESSJUR     = BF.IDPESSJUR                     '+
                       ' AND    BTIT.IDPLANOPREV   = BF.IDPLANOPREV                   '+
                       ' AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM                 '+
                       ' AND    BTIT.IDTITULAR     = BF.IDTITULAR                     '+
                       ' AND    BTIT.SEQPROPOSTA   = BF.SEQPROPOSTA                   '+
                       ' AND    BTIT.IDPESSOA      = BF.IDPESSOA                      '+
                       ' AND    BTIT.IDBENEFICIO   = BF.IDBENEFICIO                   '+
                       ' AND    BENEF.IDPESSOA     = BTIT.IDPESSOA                    '+
                       ' AND    PFBENEF.IDPESSOA   = BTIT.IDPESSOA                    '+
                       ' AND    P.IDPESSOA(+)      = BTIT.IDRESPONSAVEL               '+
                       ' AND    PF.IDPESSOA(+)     = BTIT.IDRESPONSAVEL               '+
                       ' AND    BP.IDPLANOPREV     = H.IDPLANOPREV                    '+
                       ' AND    BP.IDBENEFICIO     = H.IDBENEFICIO                    '+
                       ' GROUP BY '+
                       '   DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                       '   BP.FLGCALCTODOMES, '+
                       '   DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF), '+
                       '   DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL), '+
                       '   B.NOME,           '+
                       '   H.MESREFERENCIA,  '+
                       '   H.FLGDEVOLUCAO,   '+
                       '   BP.FLGREFERENCIA, '+
                       '   BF.DATAINICIOFUND '+
                       'ORDER BY  '+
                       ' DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                       ' H.FLGDEVOLUCAO, '+
                       ' H.MESREFERENCIA, B.NOME  ');
               Open;
               First;

               if FieldByName('FLGCALCTODOMES').AsInteger = 0
               then sFormato := '#0.00'
               else sFormato := '#0.0000';
               sRecebedorAtual   := '';
               iIdRecebedorAtual := -1;

               while (not Eof) do
               begin
                  sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
                  iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;
                  if FieldByName('FLGISENTOIRRF').AsInteger = 0
                  then Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                           PreparaStr('Isento de Imposto de Renda : Não ', 49))
                  else Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                           PreparaStr('Isento de Imposto de Renda : Sim ', 49));

                  Add('   MÊS      ITEM                                    PAGAR        DESCONTAR    [INTEGRAL]    SRB');
                  // Mostrar os beneficios deste recebedor
                  while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
                  begin

                     
                     sSQL := 'SELECT VALOR FROM DETCALCULO '+
                             'WHERE IDPESSOA  = '+QuotedStr(IntToStr(piIdPessoa))+' '+
                             '  AND IDCALCULO = '+QuotedStr(IntToStr(iIdCaluloAtualizacao))+
                             '  AND ANOMESREF = '+QuotedStr(FieldByName('MESREFERENCIA').AsString);
                     If FazQuery(qryAux2, sSQL) Then
                        dVlrIndice := QryAux2.FieldByName('VALOR').AsFloat;
                     

                     if FieldByName('FLGDEVOLUCAO').AsInteger = 0
                     then Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                              PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,13)+
                              PreparaStr('(-)'+FormatFloat(sFormato,dVlrIndice)                       ,11)+
                              PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorIntegral').AsFloat) ,12)+
                              PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,13) )
                     else Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                              PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,13)+
                              PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,11)+
                              PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,12)+
                              PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,13) );
                     Next;
                  end; 
               end; 
            end;



            // Mostrar acertos de tratamento pos-morte
            Add('-----------------------------------------------------------------------------------------------------');
            Add('=> CONTRIBUIÇÕES DO PENSIONISTA                                                                   ');
            Add('-----------------------------------------------------------------------------------------------------');
            Add(' ');


            // Buscar ACERTOS
            with qryAux do
            begin
               Close;
               SQL.Clear;
               sSQL := ' SELECT DISTINCT P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVEL,     '+
                       '        CO.NOME,   H.MESREFERENCIA,                            '+
                       '        H.VALORESPERADO AS VALORPREV ,                '+
                       
                       ' H.FLGDEVOLUCAO '+ 
                       ' FROM   PESSOA P, HSTCONTRIBPREV H, CONTRIBUICAO CO , BFCIARIOTITPLAN BT      '+
                       ' WHERE  H.IDLOTE           = '+IntToStr(iIdLote)+
                       ' AND    H.IDPESSJUR        = '+IntToStr(piIdPessJur)+
                       ' AND    H.IDPLANOPREV      = '+IntToStr(piIdPlanoDestino)+
                       ' AND    H.IDPESSOA         =  BT.IDRESPONSAVEL '+
                       ' AND    H.SEQPROPOSTA      = 1        '+
                       ' AND    BT.IDPESSJUR  =  H.IDPESSJUR '+
                       ' AND    BT.IDPLANOPREV = H.IDPLANOPREV '+
                       ' AND    BT.IDTITULAR =   '+IntToStr(piIdTitular)+' '+
                       ' AND    BT.SEQPROPOSTA =  1 '+
                       ' AND    CO.IDCONTRIBUICAO    = H.IDCONTRIBUICAO        '+
                       ' AND    P.IDPESSOA         = H.IDPESSOA                                            '+
                       ' ORDER BY H.IDPESSOA,  H.MESREFERENCIA, CO.NOME ';
               SQL.Add(sSQL);
               Open;

               while (not Eof) do
               begin
                  sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
                  iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

                  Add(' - RESPONSÁVEL : '+sRecebedorAtual);
                  Add('   MÊS      ITEM                                    PAGAR          DESCONTAR      ');
                  // Mostrar os beneficios deste recebedor
                  while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
                  begin
                     if FieldByName('FLGDEVOLUCAO').AsInteger = 1
                     then Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                              PreparaStr(FieldByName('Nome').AsString                          ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15)+
                              PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,15))
                     else Add('   '+
                              PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                              PreparaStr(FieldByName('Nome').AsString                          ,40)+
                              PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                              PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15));
                     Next;
                  end; 


               end;
            end;

         end; 
      end; 

   end;

   with memResult.Lines do
   begin
      Add('----------------------------------------------------------------------------------------------');
      Add('                               APENAS PARA CONFERÊNCIA ');
      Add('----------------------------------------------------------------------------------------------');
   end;

   frmAguarde.Apaga;
end;



function TfrmEventoTransfPlano.InsereParticipante( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
var sSql : String;
begin
   Result := false;


   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.add('  UPDATE  PARTPREVPLAN SET FLGDESATIVADO    = 1, '+
                  '                           IDSITPLANOPREV   = '+qrySitPlanoPrevOrigem.FieldByName('IDSITPLANOPREV').AsString+', '+
                  '                           DATACANCELAMENTO = TO_DATE('''+DateToStr(StrToDate(dtEvento.Text)- 1)+''',''DD/MM/YYYY'') '+
                  '  WHERE   IDPESSJUR   = '+IntToStr(piIdPessJur)+
                  '  AND     IDPLANOPREV = '+IntToStr(piIdPlanoOrigem)+
                  '  AND     IDPESSOA    = '+IntToStr(piIdTitular)+
                  '  AND     SEQPROPOSTA = '+IntToStr(piSeqProposta) );

   try
      qryAux.ExecSQL;
   except
      Exit;
   end;


   
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT FLGMANTEMINSC FROM EVENTOGERADOR '+
                   ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador);
   qryAux2.Open;
   if qryAux2.FieldByName('FLGMANTEMINSC').AsInteger = 1
   then begin
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT INSCRICAONUMERO FROM PARTPREVPLAN          '+
                     '  WHERE   IDPESSJUR   = '+IntToStr(piIdPessJur)     +
                     '  AND     IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                     '  AND     IDPESSOA    = '+IntToStr(piIdTitular)     +
                     '  AND     SEQPROPOSTA = '+IntToStr(piSeqProposta)   );
      qryAux2.Open;
      sNumInscDestino := qryAux2.FieldByName('INSCRICAONUMERO').AsString;
   end
   else begin
      // Gerar Numero de Inscricao Automaticamente, caso o parametro diga que é automatico
      if (sAutoNumInscTransf = '1')
      then begin
         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add(' SELECT MAX(INSCRICAONUMERO)+1 AS PROXINSC FROM PARTPREVPLAN '+
                         ' WHERE IDPLANOPREV = '+sIdPlanoDestino);
         qryAux2.Open;
         if Trim(qryAux2.FieldByName('PROXINSC').AsString) <> ''
         then sNumInscDestino := qryAux2.FieldByName('PROXINSC').AsString;
         qryAux2.Close;
      end
      else begin
         if bindividual
         then begin
            try
               //participante entra com a inscrição
               frmNumInsc := TfrmNumInsc.Create(Application);
               with frmNumInsc do
               begin
                  edNomePlano.Text := sNomePlanoOrigem;
                  edNumInsc.Text   := '';
                  ShowModal;
               end;

               if  (frmNumInsc.edNumInsc.Text = '')
               then begin
                  LimpaCampos;
                  TiraIconeSql;
                  Result := False;
                  frmNumInsc.Free;
                  Exit;
               end;
               sNumInscDestino := frmNumInsc.edNumInsc.text;
            finally
               frmNumInsc.Free;
            end;
         end
         else begin
            MsgDlg('O Plano Destino exige que o número de inscrição seja digitado.'+#13+
                   'Assim, não é possível fazer transferência de plano em lote.','Erro',mtError,[mbOK],0);
            Exit;
         end;
      end;

   end;
   




   // Insere participante no plano destino
   sSQL := '  INSERT INTO PARTPREVPLAN( '+
           '         IDPESSJUR,         IDPLANOPREV,    IDPESSOA,          SEQPROPOSTA,        '+
           '         IDSITPART ,        IDSITPLANOPREV, INSCRICAONUMERO,   INSCRICAODATA,      '+
           '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
           '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
           '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
           '         DATAINICIOSITTEMP, DATAFIMSITTEMP, DATAINICIOMANUT,   REQUERIMENTODATA,   '+
           '         DTINICIOINSC, FLGFITESPECIAL                              ) '+ 
           ' SELECT                                                                            '+
           '         IDPESSJUR,         '+IntToStr(piIdPlanoDestino)+',    IDPESSOA,          SEQPROPOSTA,        '+
           '         '+cmbSitPartDest.LookupValue+' ,        '+qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString+','+sNumInscDestino+','+    
           '         TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY''),                       '+
           '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
           '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
           '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
           '         DECODE(DATAINICIOSITTEMP, NULL, NULL, TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY'') ), '+
           '         DECODE(DATAFIMSITTEMP,    NULL, NULL, TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY'') ), '+
           '         DECODE(DATAINICIOMANUT,   NULL, NULL, TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY'') ), '+
           '         SYSDATE,                                                                                    '+
           '         DTINICIOINSC, FLGFITESPECIAL '+ 
           
           ' FROM    PARTPREVPLAN                                                              '+
           ' WHERE   IDPESSJUR   = '+IntToStr(piIdPessJur)+
           ' AND     IDPLANOPREV = '+IntToStr(piIdPlanoOrigem)+
           ' AND     IDPESSOA    = '+IntToStr(piIdPessoa)+
           ' AND     SEQPROPOSTA = '+IntToStr(piSeqProposta);
   qryGrava.Close;
   qryGrava.SQL.Clear;
   qryGrava.SQL.add(sSQL);

   try
      qryGrava.ExecSQL;
   except
      Exit;
   end;



   Result := True;
end;


function TfrmEventoTransfPlano.AssociaReservas( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
var sMsgErro : String;
begin
   Result := false;


   // Filtra todas as Reservas do Plano
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO '+
                  ' WHERE  IDPLANOPREV      = '+intToStr(piIdPlanoDestino)+
                  ' AND    ANALITICOSINTETI = '+ '''A''' +
                  ' AND    FLGCOLETIVA      = 0 ');
   qryAux.Open;
   qryAux.First;

   while not qryAux.EOF do
   begin
      // Grava as Reservas do Participante
      qryGrava.Close;
      qryGrava.Sql.Clear;
      qryGrava.Sql.Add(' INSERT INTO RESERVAPART (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, SEQPROPOSTA, FLGATIVO, ' +
                       'IDPARTICIPANTE) ' +  
                       ' VALUES( ' + qryAux.FieldbyName('IDTIPORESERVA').AsString  + ',' +
                                     IntToStr(piIdPlanoDestino)+ ',' +
                                     intToStr(piIdPessJur)+ ',' +
                                     IntToStr(piIdTitular)+ ', '+
                                     IntToStr(piSeqProposta)+',1, ' +
                                     IntToStr(piIdTitular)+ ')'); 
      try
         qryGrava.ExecSQL;
      except
         
      end;


      qryAux.Next;
   end;



   // Rodar padrao de movimentacao de reservas
   if not RODAPADRAOMOVRESERVA( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPessoa,
                                piSeqProposta,
                                -1,
                                StrToInt(sIdEventoGerador),
                                piIdPessJur,
                                piIdPlanoDestino,
                                sFlgInterno,
                                dtEvento.Text,
                                sMsgErro,
                                -1,
                                'O')
   then begin
      GravaErro('Erro na execução do Padrão de Movimentação de Reserva com a mensagem.'+#13+
                sMsgErro);
      Exit;
   end;


   // Gerar Movimento de Reserva com Saída de 100% do que o padrao de movimentacao ainda
   // deixou na reserva
   qryAux.close;
   qryAux.sql.clear;
   qryAux.SQL.Add('INSERT INTO HISTMOVRESERVA ( '+
                  ' IDREGRACALCULO,      IDPLANOPREV,         IDTIPORESERVA,     IDPESSJUR,           IDPESSOA,    '+
                  ' SEQPROPOSTA,         IDEVENTOGERADOR,     IDCONTRIBUICAO,    IDBENEFICIO,         DATAMOV,     '+
                  ' VLRREAL,             VLRCOTAS,            SALDOREAL,         SALDOCOTAS,          FLGENTRADA,  '+
                  ' PERCENTUAL,          IDPARTICIPANTE,      SALDOREALCONT,     DATAALIMENTACAO,                  '+
                  ' VALORINDICE,         MESREFERENCIA,       FLGPROCEDENCIA,    IDHISTRESERVA)                    '+
                  ' SELECT NULL,         RP.IDPLANOPREV,      RP.IDTIPORESERVA,  RP.IDPESSJUR,        RP.IDPESSOA, '+
                  ' RP.SEQPROPOSTA,      '+sIdEventoGerador+',NULL,              NULL,                SYSDATE,     '+
                  ' RP.VALORRESERVA,     RP.VALORRESERVA,     0,                 0,                   0,           '+
                  ' NULL,                RP.IDPESSOA,         0,                 SYSDATE,                          '+
                  ' 1,                   '''+Copy(dtEvento.Text,7,4)+'/'+Copy(dtEvento.Text,4,2)+''', 0, SEQHISTMOVRESERVA.NEXTVAL '+
                  ' FROM RESERVAPART RP '+
                  ' WHERE  RP.IDPESSJUR   = '+IntToStr(piIdPessJur) +
                  ' AND    RP.IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                  ' AND    RP.IDPESSOA    = '+IntToStr(piIdPessoa) +
                  ' AND    RP.SEQPROPOSTA = '+IntToStr(piSeqProposta) );
   try
      qryAux.execsql;
   except
      GravaErro('Erro ao zerar movimentações de reservas do participante no plano de origem.');
      Exit;
   end;


   qryAux.close;
   qryAux.sql.clear;
   qryAux.sql.add(' UPDATE RESERVAPART SET FLGATIVO = 0 , DATADESATIV = SYSDATE, VALORRESERVA = 0 '+
                  ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur) +
                  ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                  ' AND    IDPESSOA    = '+IntToStr(piIdPessoa) +
                  ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta) );
   try
      qryAux.execsql;
   except
      GravaErro('Erro ao zerar reservas do participante no plano de origem.');
      Exit;
   end;

   Result := true;
end;



function TfrmEventoTransfPlano.AssociaContrib( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
var sInicio, sIdNucleoFamiliar : String;
begin
   Result := False;

   sInicio := dtEvento.text;
   if dtNovaDib.text <> ''  then sInicio := dtNovaDib.text;

   if piIdTitular = piIdPessoa then
   begin
      // Suspender a cobrança das contribuições atuais
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+DateToStr(StrToDate(dtEvento.Text)- 1)+''',''DD/MM/YYYY'')' +
                     ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur) +
                     ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    IDPESSOA    = '+IntToStr(piIdPessoa) +
                     ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta) );
      try
         qryAux.ExecSQL;
      except
         GravaErro('Erro ao suspender as contribuições no plano origem.');
         Exit;
      end;

      //função similar a usada em quase todos os eventos
      //só que neste caso, as contribuições associadas no eventos
      //devem ser relacionadas a situação individual
      //se for um ativo, associa apenas as contribuições com flg de ativo
      //caso seja um assistido, associa apenas as de assistido....
      GravaHSTCONTEVENTOSPRTransf(piIdPessJur,
                         piIdPlanoOrigem,
                         piIdPlanoDestino,
                         piIdTitular,
                         piIdPessoa,
                         piSeqProposta ,
                         IntToStr(iIdEventoPrevOrig),
                         sIdEventoGerador );

      // Associar novas contribuicoes
      if (trim(strContribuicaoAAssociar) <> '0')
      then begin
         
         if not bIndividual
         then begin
            if not AssociaNovasContribuicoes( IntToStr(piIdPessJur),
                                              IntToStr(piIdPlanoDestino),
                                              IntToStr(piIdTitular),
                                              IntToStr(piSeqProposta),
                                              sIdEventoGerador,
                                              sInicio,
                                              '',
                                              sMatriculaCorrente,
                                              sIdSitPartDepois,
                                              sSalParticipacao,
                                              False,
                                              False,
                                              False,
                                              qryAux,
                                              qryGrava,
                                              sFlgInterno,
                                              iIdEventoPrevOrig,
                                              '0000/00','01/01/1900',
                                              qryContribuicoes,
                                              bIndividual)
            then begin
               GravaErro('Erro ao associar as contribuições do plano destino.');
               Exit;
            end;
         end
         else begin
            if not AssociaNovasContribuicoes( IntToStr(piIdPessJur),
                                              IntToStr(piIdPlanoDestino),
                                              IntToStr(piIdTitular),
                                              IntToStr(piSeqProposta),
                                              sIdEventoGerador,
                                              sInicio,
                                              '',
                                              sMatriculaCorrente,
                                              sIdSitPartDepois,
                                              sSalParticipacao,
                                              False,
                                              False,
                                              False,
                                              qryAux,
                                              qryGrava,
                                              sFlgInterno,
                                              iIdEventoPrevOrig,
                                              '0000/00','01/01/1900',
                                              nil,
                                              bIndividual)
            then begin
               GravaErro('Erro ao associar as contribuições do plano destino.');
               Exit;
            end;
         end;
      end;
   end
   else
   begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT DISTINCT IDNUCLEOFAMILIAR '+
                     ' FROM   BFCIARIOTITPLAN      '+
                     ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur) +
                     ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    IDPESSOA    = '+IntToStr(piIdPessoa) +
                     ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta) );
      qryAux.Open;

      if qryaux.isempty then
      begin
         GravaErro('Nucleo familiar do beneficiário não encontrado.');
         Exit;
      end;

      sIdNucleoFamiliar := qryaux.fieldbyname('IDNUCLEOFAMILIAR').AsString;


      // Suspender a cobrança das contribuições atuais
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE CONTRIBPREVNUCLEO SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+DateToStr(StrToDate(dtEvento.Text)- 1)+''',''DD/MM/YYYY'')' +
                     ' WHERE  IDNUCLEOFAMILIAR =  '+sIdNucleoFamiliar+' ');
      try
         qryAux.ExecSQL;
      except
         GravaErro('Erro ao suspender as contribuições no plano origem.');
         Exit;
      end;


      //associar contribuições no novo plano
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.SQL.Add(' INSERT INTO CONTRIBPREVNUCLEO       '+
                     ' (IDCONTRIBUICAO, IDNUCLEOFAMILIAR, DATAINICIO, DATAFINAL, '+
                     '  ULTMESPREPARO,  FLGCOBRA) '+
                     '  SELECT CPE.IDCONTRIBUICAO, '+sIdNucleoFamiliar+', '+
                     '         TO_DATE('''+sInicio+''',''DD/MM/YYYY''),   '+
                     '         NULL, ''0000/00'', 0 '+
                     '  FROM   CONTPREV CP, CONTPREVEVENTO CPE      '+
                     '  WHERE  CPE.IDPLANOPREV     = ' + IntToStr(piIdPlanoDestino)+
                     '  AND    CPE.IDEVENTOGERADOR = ' + sIdEventoGerador +
                     '  AND    CP.FLGINTERNO       = '''+ sFlgInternoDepois +''' '+
                     '  AND    CP.IDPLANOPREV      = CPE.IDPLANOPREV '+
                     '  AND    CP.IDCONTRIBUICAO   = CPE.IDCONTRIBUICAO  ');
      try
         qryAux.ExecSQL;
      except
         GravaErro('Erro ao associar as contribuições do plano destino.');
         Exit;
      end;
   end;


   Result := true;
end;


function TfrmEventoTransfPlano.InsereBeneficios( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint ) : boolean;
var
  iIdPlanoOrigemLocal, iNumeroProcesso : longint;
  bErroLocal : Boolean;

  sNovaDataFinal, sDataAuxInsere, sDataFinal, sMsgErro, sFlgTpDemissao: String;

  sIdPlanPrevContab,sPlaContaD, sPlaContaC, sFlgFitEspecial, sFlgMigrado,sSQL, sResult : String;
begin
   Result := false;
   bErrolocal := False;


   
   qryAux.close;
   qryAux.sql.clear;
   qryAux.sql.add(' SELECT P.VALORPROVENTO  '+
           ' FROM   PREVIA P, CTRLINTERFACE C '+
           ' WHERE  P.IDPATRO        = '+IntToStr(piIdPessJur)     +
           ' AND    P.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
           ' AND    P.IDTITULAR        = '+IntToStr(piIdTitular)     +
           ' AND    P.IDPESSOA         = '+IntToStr(piIdPessoa)      +
           ' AND    P.SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
           ' AND    P.MESCOBRANCA    = '''+sAnoMesLote+''''+
           ' AND    P.FLGTIPODESC    = ''B'' '+
           ' AND    P.IDLOTE = C.IDLOTE '+
           ' AND    C.FLGVOLTATMP    = 0  ');
   qryAux.Open;

   if not qryaux.isempty then
   begin
      MsgDlg('Existem registros de pagamentos pendentes na Prévia da Folha para este participante. Eles devem ser acertados antes do processo de transferência.','Pendência',mtInformation,[mbOk],0);
      GravaErro('Existem registros de pagamentos pendentes na Prévia da Folha para este participante. Eles devem ser acertados antes do processo de transferência.');
      exit;
   end;
   



   
   If (not CdsBeneficiosParaConcessao.isempty )
   then begin // transferir beneficiario

      CdsBeneficiosParaConcessao.first;
      while not CdsBeneficiosParaConcessao.eof do
      begin
         //verificar destino do pagamento do benefício
         if ((piIdTitular =  piIdPessoa) and (uppercase(CdsBeneficiosParaConcessao.fieldbyname('DESTINOPAG').AsString) = 'BENEFICIÁRIO'))
            or ((piIdTitular <>  piIdPessoa) and (uppercase(CdsBeneficiosParaConcessao.fieldbyname('DESTINOPAG').AsString) = 'PARTICIPANTE' )) then
         begin
            CdsBeneficiosParaConcessao.next;
            continue;
         end;

         
         If (piIdTitular = piIdPessoa) Then Begin
           iIdPlanoOrigemLocal := piIdPlanoDestino;
         End Else Begin
           iIdPlanoOrigemLocal := piIdPlanoOrigem;
         End;

         // Fazer DE-PARA de beneficios na BFCIARIOTITPLAN
         if trim(CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString)  <> '' then
         begin


            //verifica se o beneficiário tem o benefício origem
            qryAux.close;
            qryAux.sql.clear;
            qryAux.sql.add(' SELECT BF.NUMEROPROCESSO, BF.IDBENEFICIO, BF.VALORATUAL, BF.VALORTOTAL, '+
                           '        BF.IDSITBENEFICIO, BF.VALORCOTAS, BF.DATAINICIOFUND, BF.DATAFINAL,   '+
                           '        BF.FLGDATAPREVISTA , BF.DATAINICIO, '+
                           '        BF.DATAINICIO, BF.DATAREQUERIMENTO, BF.DATAINICIOFUND  '+ 
                           ' FROM BENEFBFCIARIO BF         '+
                           ' WHERE  BF.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                           ' AND    BF.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                           ' AND    BF.IDTITULAR        = '+IntToStr(piIdTitular)     +
                           ' AND    BF.IDPESSOA         = '+IntToStr(piIdPessoa)      +
                           ' AND    BF.SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                           ' AND    BF.IDSITBENEFICIO IN (1,2)  '+
                           ' AND    BF.IDBENEFICIO      = '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString+' ');
            qryAux.Open;

            if qryaux.isempty then
            begin
               CdsBeneficiosParaConcessao.next;
               continue;
            end;

            dtmAPrev.qry.close;
            dtmAPrev.qry.sql.clear;
            dtmAPrev.qry.sql.add(' INSERT INTO BFCIARIOTITPLAN (                                             '+
                                 ' IDTITULAR,          IDPESSJUR,       IDPLANOPREV,      IDPLANOORIGEM,     '+
                                 ' IDPESSOA,           IDRESPONSAVEL,   IDBENEFICIO,      SEQPROPOSTA,       '+
                                 ' IDDEPENRESPON,      PRIORIDADE,      PERCENTUAL,       IDNUCLEOFAMILIAR,  '+
                                 ' CODTIPORECEBEDOR,   DATAFIMRECEB,    IDRESPONNAOREC )                     '+
                                 ' SELECT                                                                    '+
                                 ' B.IDTITULAR,        B.IDPESSJUR,     '+IntToStr(piIdPlanoDestino)+', '
                                 
                                 +IntToStr(iIdPlanoOrigemLocal)+', '+
                                 ' B.IDPESSOA,         B.IDRESPONSAVEL, '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString+',    B.SEQPROPOSTA,     '+
                                 ' B.IDDEPENRESPON,    B.PRIORIDADE,    B.PERCENTUAL,     B.IDNUCLEOFAMILIAR,'+
                                 ' B.CODTIPORECEBEDOR, B.DATAFIMRECEB,  B.IDRESPONNAOREC                     '+
                                 ' FROM   BFCIARIOTITPLAN B             '+
                                 ' WHERE  B.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                                 ' AND    B.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                                 ' AND    B.IDTITULAR        = '+IntToStr(piIdTitular)     +
                                 
                                 ' AND    B.IDPESSOA         = '+IntToStr(piIdPessoa)      +

                                 ' AND    B.SEQPROPOSTA      = '+IntToStr(piSeqProposta)+' '+
                                 ' AND    B.IDBENEFICIO      = '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString+' ');
            try
               dtmAPrev.qry.execsql;
            except
               
               GravaErro('Erro ao associar benefício a pessoa no plano destino. O benefício '+CdsBeneficiosParaConcessao.fieldbyname('NOME').AsString+' já está associado a pessoa .');
               bErrolocal := true;
               CdsBeneficiosParaConcessao.next;
               continue;
            end;

            dtmAPrev.qry.close;
            dtmAPrev.qry.sql.text := ' SELECT BF.NUMEROPROCESSO '+
                                     ' FROM BENEFBFCIARIO BF, BENEFPLANPREV BV '+
                                     ' WHERE  BF.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                                     ' AND    BF.IDPLANOPREV      = '+IntToStr(piIdPlanoDestino) +
                                     ' AND    BF.IDTITULAR        = '+IntToStr(piIdTitular) +
                                     ' AND    BF.IDPESSOA         = '+IntToStr(piIdPessoa) +
                                     ' AND    BF.SEQPROPOSTA      = '+IntToStr(piSeqProposta)+' '+
                                     ' AND    BF.IDPLANOPREV = BV.IDPLANOPREV '+
                                     ' AND    BF.IDBENEFICIO = BV.IDBENEFICIO '+
                                     ' AND    BV.FLGREFERENCIA = 0 ';
            dtmAPrev.qry.Open;

            if dtmAPrev.qry.isempty then
            begin

              iNumeroProcesso := LeUltRegistro(qryAux,'PROCESSOBENEF');


              dtmAPrev.qry.close;
              dtmAPrev.qry.sql.text := ' INSERT INTO PROCESSOBENEF '+
                                       ' (NUMEROPROCESSO, IDEVENTOGERADOR, DTEVENTO, DTDIREITO, '+
                                       ' DTREGISTRO, IDSITPROCESSO) '+
                                       ' SELECT '+inttostr(iNumeroProcesso)+', '+CdsBeneficiosParaConcessao.fieldbyname('IDEVENTOGERADOR').AsString+' , '+
                                       ' DTEVENTO, DTDIREITO, TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY''), IDSITPROCESSO '+
                                       ' FROM PROCESSOBENEF '+
                                       ' WHERE NUMEROPROCESSO = '+qryAux.FieldByName('NUMEROPROCESSO').AsString+' ';
              try
                 dtmAPrev.qry.execsql;
              except
                 GravaErro('Erro ao inserir processos de benefício do plano destino.');
                 bErrolocal := true;
                 CdsBeneficiosParaConcessao.next;
                 continue;
              end;

            end
            else   iNumeroProcesso := dtmAPrev.qry.fieldbyname('NUMEROPROCESSO').AsInteger;


            dtmAPrev.qry.close;
            dtmAPrev.qry.sql.text := ' UPDATE PROCESSOBENEF SET IDSITPROCESSO = 3 '+
                                     ' WHERE NUMEROPROCESSO = '+qryAux.FieldByName('NUMEROPROCESSO').AsString+' ';
            try
               dtmAPrev.qry.execsql;
            except
               
               GravaErro('Erro ao encerrar processo de benefício no plano de origem.');
               bErrolocal := true;
               CdsBeneficiosParaConcessao.next;
               continue;
            end;

            
            sDataFinal := '';
            if (Trim(CdsBeneficiosParaConcessao.FieldByName('IDREGRAFIM').AsString) <> '') and
               (CdsBeneficiosParaConcessao.FieldByName('IDREGRAFIM').AsInteger > 0)
            then begin
               sDataFinal := ExecutaRegraDataPgtoBeneficio(
                                CdsBeneficiosParaConcessao.FieldByName('IDREGRAFIM').AsInteger,
                                piIdPessjur, piIdPlanoOrigem, piIdTitular, piSeqProposta,
                                piIdPessoa,
                                CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsInteger,
                                CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsFloat,
                                CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsFloat,
                                CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsFloat,
                                qryaux.fieldbyname('DATAREQUERIMENTO').AsString, 
                                qryaux.fieldbyname('DATAINICIOFUND').AsString,   
                                qryaux.fieldbyname('DATAINICIO').AsString,       
                                qryaux.fieldbyname('DATAFINAL').AsString,        
                                DateToStr(date),
                                qryaux.fieldbyname('DATAREQUERIMENTO').AsString, 
                                '',                                              
                                bErroLocal,
                                sMsgErro);
               if bErroLocal then begin
                 GravaErro(sMsgErro);
                 bErrolocal := true;
                 CdsBeneficiosParaConcessao.next;
                 Continue;
               end;
            end;
            



            
            sIdPlanPrevContab := '';
            sPlaContaD := '';
            sPlaContaC := '';
            if prmIdRegraContabBenefIndiv > 0 then
            begin
               //a regra será executada para cada campo com possibilidade de
               //parametrização individual automática
               //a regra é única e o tipo de campo a ser retornada é informado através
               //do campo de nome "CAMPO" na query
               //caso não haja parametrização individual para determinado caso, a regra deve retornar "0" (zero)

               sFlgFitEspecial := '0';


               
               If PossuiMigracao(piIdTitular,
                                 piIdPlanoDestino,
                                 dtEvento.text) Then Begin
                 sFlgMigrado :=  '1';
               End Else Begin
                 sFlgMigrado :=  '0';
               End;


               sSQL := 'SELECT  '+IntToStr(piIdPessoa)+' AS IDPESSOA ,'+
                       ' '+IntToStr(piIdTitular)+' AS IDTITULAR ,'+
                       ' '+IntToStr(piIdPlanoDestino)+' AS IDPLANOPREV ,'+
                       ' '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString+' AS IDBENEFICIO , '+
                       ' '+sIdSitPlanoDestino  +' AS IDSITPLANOPREV,   '+ 
                       ' '+sFlgFitEspecial+' AS FLGFITESPECIAL, '+sFlgMigrado+' AS FLGMIGRADO ';


               
               sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                                      sSQL+', ''IDPLANPREVCONTAB'' AS CAMPO FROM DUAL',
                                      bErro, iIdCalculo );


               if bErro then
               begin
                  MsgDlg('Erro na regra para atribuição automática de entidade contábil.','Erro',mtError,[mbOk],0);
                  Abort;
               end;


               if  trim(sResult) = '' then
               begin
                  MsgDlg('Erro na regra para atribuição automática de entidade contábil. Resultado nulo.','Erro',mtError,[mbOk],0);
                  Abort;
               end;


               if trim(sResult) <> '0' then
               begin
                  //testa validade da informação
                  dtmAPrev.qry.close;
                  dtmAPrev.qry.sql.text := '  SELECT * FROM  PLANPREVCONTABIL '+
                                           '  WHERE IDPLANOPREV = '+sResult    +
                                           '  AND   NVL(ATIVO,''S'') = ''S''   '; 
                  dtmAPrev.qry.open;

                  if dtmAPrev.qry.isempty then
                  begin
                     MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de entidade contábil. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
                     Abort;
                  end;

                  sIdPlanPrevContab := trim(sResult);
               end;
               




               
               sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                                      sSQL+', ''PLACONTAD'' AS CAMPO FROM DUAL',
                                      bErro, iIdCalculo );


               if bErro then
               begin
                  MsgDlg('Erro na regra para atribuição automática de conta para débito.','Erro',mtError,[mbOk],0);
                  Abort;
               end;


               if  trim(sResult) = '' then
               begin
                  MsgDlg('Erro na regra para atribuição automática de conta para débito. Resultado nulo.','Erro',mtError,[mbOk],0);
                  Abort;
               end;


               if trim(sResult) <> '0' then
               begin
                  //testa validade da informação
                  dtmAPrev.qry.close;
                  dtmAPrev.qry.sql.text := '  SELECT 1 FROM  PLANOCONTA  '+
                                           '  WHERE PLACONTA = '+sResult+' ';
                  dtmAPrev.qry.open;

                  if dtmAPrev.qry.isempty then
                  begin
                     MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para débito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
                     Abort;
                  end;

                  sPlaContaD := trim(sResult);

               end;
               




               
               sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                                      sSQL+', ''PLACONTAC'' AS CAMPO FROM DUAL',
                                      bErro, iIdCalculo );


               if bErro then
               begin
                  MsgDlg('Erro na regra para atribuição automática de conta para crédito.','Erro',mtError,[mbOk],0);
                  Abort;
               end;


               if  trim(sResult) = '' then
               begin
                  MsgDlg('Erro na regra para atribuição automática de conta para crédito. Resultado nulo.','Erro',mtError,[mbOk],0);
                  Abort;
               end;


               if trim(sResult) <> '0' then
               begin
                  //testa validade da informação
                  dtmAPrev.qry.close;
                  dtmAPrev.qry.sql.text := '  SELECT 1 FROM  PLANOCONTA  '+
                                     '  WHERE PLACONTA = '+sResult+' ';
                  dtmAPrev.qry.open;

                  if dtmAPrev.qry.isempty then
                  begin
                     MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para crédito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
                     Abort;
                  end;


                  sPlaContaC := trim(sResult);
               end;
               


            end;
            




            // Fazer DE-PARA de beneficios na BENEFBFCIARIO
            dtmAPrev.qry.close;
            dtmAPrev.qry.sql.clear;
            dtmAPrev.qry.sql.add(' INSERT INTO BENEFBFCIARIO ('+
                                 ' NUMEROPROCESSO,        IDPLANOPREV,          IDPLANOORIGEM,       IDTITULAR,           '+
                                 ' IDPESSJUR,             IDBENEFICIO,          IDPESSOA,            PLANO,               '+
                                 ' SEQPROPOSTA,           IDDEPENDENCIA,        IDSITBENEFICIO,      IDTPPAGTOBENEFIC,    '+
                                 ' DATAFINAL,             VALORATUAL,           CODPORTFORMA,        DATAREQUERIMENTO,    '+
                                 ' DATAINICIO,            TMPPAGTOBENEFICIO,    FLGFORMAPAGTO,       VALORCALCULADO,      '+
                                 ' DATAULTREAJUSTE,       ULTMESPREPARO,        VLRCALCINSS,         VLRINFINSS,          '+
                                 ' DATAINICIOINSS,        NUMPROCINSS,          DATAINICIOFUND,      FLGBENEFMIN,         '+
                                 ' VALORCOTAS,            VALORTOTAL,           DATACONCESSAO,       DATAENCERRAMENTO,    '+
                                 ' FLGPROVISORIO,         PERCPROVISORIO,       PRAZOPROVISORIO,     NUMCARTARECAD,       '+
                                 ' DATAEMISSAORECAD,      DATALIMITERECAD,      DATARECEBRECAD,      FLGSTATUS,           '+
                                 ' BANCOINSS,             MESRECIBOINSS,        ANORECIBOINSS,       FONTEPAGADORA,       '+
                                 ' IDAGENCIARESGATE,      ULTMESREAJUSTE,       ULTVALORATUALREAJ,   ULTVALORBRUTO,       '+
                                 ' VALORABONO13,          FLGDATAPREVISTA,     DATAFINALPREVISTA,   '+
                                 ' DIBBENEFANT,           VALORBENEFANT, '+
                                 ' DFLOATPAGTO,           FLGTIPOINSS,          FLGENCERRAPORFALE,   '+
                                 ' DATAULTREVISAO,        FLGDESCIRMES,         PERCENTUAL,          VALORNADIB,          '+
                                 ' FLGPOSSUIACOMPINSS,    VALORSRB,             IDBENEFREFEREN,      DATALIBERACAO,       '+
                                 ' MESPAGLIBERACAO,       IDTITBENEF,           FLGACERTOCBP,  VALORBASE1, VALORBASE2, VALORBASE3, '+
                                 ' IDPLANPREVCONTAB , PLACONTAD, PLACONTAC   )  '+ 
                                 ' SELECT                                                                                 '+
                                 ' '+inttostr(iNumeroProcesso)+' ,      '+IntToStr(piIdPlanoDestino)+', '
                                 
                                 +IntToStr(iIdPlanoOrigemLocal)+',    '+

                                 ' B.IDTITULAR,           B.IDPESSJUR,         '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString+', '+
                                 ' B.IDPESSOA,            B.PLANO,             '+
                                 ' B.SEQPROPOSTA,         B.IDDEPENDENCIA,      B.IDSITBENEFICIO,    B.IDTPPAGTOBENEFIC,  ');


                                 if trim(sDataFinal) <> '' then
                                      dtmAPrev.qry.sql.add(' TO_DATE('''+sDataFinal+''',''DD/MM/YYYY''),   ')
                                 else dtmAPrev.qry.sql.add(' B.DATAFINAL,   ');


                                 dtmAPrev.qry.sql.add(' B.VALORATUAL,         B.CODPORTFORMA,      B.DATAREQUERIMENTO,  '+

                                 //caso a DIP do benef anterior seja maior que a nova dip, colocá-la
                                 ' GREATEST(TO_DATE('''+dtNovaDib.Text+''',''DD/MM/YYYY''), B.DATAINICIO) ,          '+

                                 ' B.TMPPAGTOBENEFICIO,  B.FLGFORMAPAGTO,       B.VALORCALCULADO,                         '+
                                 ' B.DATAULTREAJUSTE,     B.ULTMESPREPARO,      B.VLRCALCINSS,       B.VLRINFINSS,        '+
                                 ' B.DATAINICIOINSS,      B.NUMPROCINSS,  B.DATAINICIOFUND,        '+

                                 //caso a DIB do benef anterior seja maior que a nova dip, colocá-la
                                 

                                 ' B.FLGBENEFMIN,   B.VALORCOTAS,          B.VALORTOTAL,         SYSDATE,                                  '+ 
                                 ' B.DATAENCERRAMENTO,                                                                    '+
                                 ' B.FLGPROVISORIO,       B.PERCPROVISORIO,     B.PRAZOPROVISORIO,   B.NUMCARTARECAD,     '+
                                 ' B.DATAEMISSAORECAD,    B.DATALIMITERECAD,    B.DATARECEBRECAD,    B.FLGSTATUS,         '+
                                 ' B.BANCOINSS,           B.MESRECIBOINSS,      B.ANORECIBOINSS,     B.FONTEPAGADORA,     '+
                                 ' B.IDAGENCIARESGATE,    B.ULTMESREAJUSTE,     B.ULTVALORATUALREAJ, B.ULTVALORBRUTO,     '+
                                 ' B.VALORABONO13,        B.FLGDATAPREVISTA,   B.DATAFINALPREVISTA, ');

                                 
                                 If CdsBeneficiosParaConcessao.fieldbyname('FLGREFERENCIA').AsString = '0' Then
                                   dtmAPrev.qry.sql.add(' B.DATAINICIOFUND ,     B.VALORATUAL, ') // DIBBENEFANT  E VALORBENEFANT - GUARDA VALORES DO BENEF NO PLANO ORIGEM
                                 Else
                                   dtmAPrev.qry.sql.add(' B.DIBBENEFANT, B.VALORBENEFANT, ');
                                 
                                 dtmAPrev.qry.sql.add(
                                 ' B.DFLOATPAGTO,         B.FLGTIPOINSS,        B.FLGENCERRAPORFALE, '+
                                 ' B.DATAULTREVISAO,      B.FLGDESCIRMES,       B.PERCENTUAL,        B.VALORNADIB,        '+
                                 ' B.FLGPOSSUIACOMPINSS,  B.VALORSRB,           B.IDBENEFREFEREN,    B.DATALIBERACAO,     '+
                                 ' B.MESPAGLIBERACAO,     B.IDTITBENEF,         B.FLGACERTOCBP                ');

            if CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsFloat > 0 then
            dtmAPrev.qry.sql.add(' , '+oranumero(CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsString)+' ')
            else dtmAPrev.qry.sql.add(' , B.VALORBASE1');

            if CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsFloat > 0 then
            dtmAPrev.qry.sql.add(' , '+oranumero(CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsString)+' ')
            else dtmAPrev.qry.sql.add(' , B.VALORBASE2');

            if CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsFloat > 0 then
            dtmAPrev.qry.sql.add(' , '+oranumero(CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsString)+' ')
            else dtmAPrev.qry.sql.add(' , B.VALORBASE3');

            dtmAPrev.qry.sql.add(' , '''+sIdPlanPrevContab+''', '''+sPlaContaD+''', '''+sPlaContaC+'''  '+  
                                 ' FROM   BENEFBFCIARIO B                   '+
                                 ' WHERE  B.NUMEROPROCESSO = '+qryAux.FieldByName('NUMEROPROCESSO').AsString+' '+
                                 ' AND    B.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                                 ' AND    B.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                                 ' AND    B.IDTITULAR        = '+IntToStr(piIdTitular)     +
                                 ' AND    B.IDPESSOA         = '+IntToStr(piIdPessoa)      +
                                 ' AND    B.SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                                 
                                 ' AND    B.IDBENEFICIO      = '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString+
                                 ' AND    B.IDSITBENEFICIO IN (1,2)   ');

            try
               dtmAPrev.qry.execsql;
            except
               
               GravaErro('Erro ao inserir benefício '+CdsBeneficiosParaConcessao.fieldbyname('NOME').AsString+' na tabela de Benefícios do Processo no plano destino. O benefício já existe.');
               bErrolocal := true;
               CdsBeneficiosParaConcessao.next;
               continue;
            end;


            // Encerrar beneficio no plano anterior
            dtmAPrev.qry.Close;
            dtmAPrev.qry.SQL.Clear;
            dtmAPrev.qry.SQL.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 3, DATAFINAL = TO_DATE('''+DateToStr(StrToDate(dtEvento.Text)-1)+''',''DD/MM/YYYY'') ' +
                                 ' WHERE  IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                                 ' AND    IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                                 ' AND    IDTITULAR        = '+IntToStr(piIdTitular)     +
                                 ' AND    IDPESSOA         = '+IntToStr(piIdPessoa)      +
                                 ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                                 ' AND    IDBENEFICIO      = '+qryAux.FieldByName('IDBENEFICIO').AsString+
                                 ' AND    NUMEROPROCESSO   = '+qryAux.FieldByName('NUMEROPROCESSO').AsString);

            try
               dtmAPrev.qry.ExecSQL;
            except
               
               GravaErro('Erro ao encerrar benefícios do processo no plano origem.');
               bErrolocal := true;
               CdsBeneficiosParaConcessao.next;
               continue;
            end;



            
            if (chkManterInss.checked) and
              (CdsBeneficiosParaConcessao.fieldbyname('FLGREFERENCIA').AsString = '1') then
            begin
               dtmAPrev.qry.Close;
               dtmAPrev.qry.SQL.Clear;
               dtmAPrev.qry.SQL.Add(' INSERT INTO HSTBENEFBFCIARIO ' +
                                    '   (IDPESSJUR,   IDTITULAR,      IDPESSOA, IDPLANOPREV,    SEQPROPOSTA,    IDMOTIVO,    '+
                                    '    NUMEROPROCESSO, IDBENEFICIO,    MES,  MESREFERENCIA,  SEQBENEFICIO,   VALORPREV,   '+
                                    '    VALORCALCULADO, VALORINTEGRAL,  VALORTOTAL, IDREGRACALCULO, IDLOTE,         FLGENVIADO,  '+
                                    '    FLGCONCESSAO, CODPORTFORMA,     VALORSRB,  FLGDEVOLUCAO, VALORPREVMIN, IDPLANOORIGEM,   '+
                                    '    DATAPAGAMENTO, FLGPROVISORIO,   PERCENTUAL,   FONTEPAGADORA, VALOROP1, VALOROP2, '+
                                    '    VALOROP3, IDTITBENEF, VLBENEFPGTO, DTEFETPGTO, '+
                                    '    VALORBASE1,VALORBASE2,VALORBASE3, VALORBASE4,VLRTOTRETROATIVO,VLRDIFRETROATIVO, '+
                                    '    FLGFORMAPAGTO,IDREGRABENEFMIN,IDHSTFOLHABENEF, FLGDESCIRMES,PERCPROVISORIO, '+
                                    '    FLGMANUAL,VALORACERTO,IDSEQINTERNOFB, IDMOVBENEF,FLGTIPOREGISTRO,FLGALIMRESERVA) '+
                                    ' SELECT IDPESSJUR,      IDTITULAR,      IDPESSOA, '+IntTostr(piIdPlanoDestino)+',    SEQPROPOSTA,    IDMOTIVO,    '+
                                    '    '+IntToStr(iNumeroProcesso)+' , '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString+' ,    MES, MESREFERENCIA,  SEQBENEFICIO,   VALORPREV,   '+
                                    '    VALORCALCULADO, VALORINTEGRAL,  VALORTOTAL, IDREGRACALCULO, IDLOTE,         FLGENVIADO,  '+
                                    '    FLGCONCESSAO, CODPORTFORMA,     VALORSRB, FLGDEVOLUCAO, VALORPREVMIN, '+
                                    IntToStr(iIdPlanoOrigemLocal)+' ,'+ //leocm - 24022006
                                    '    DATAPAGAMENTO, FLGPROVISORIO,   PERCENTUAL, FONTEPAGADORA, VALOROP1, VALOROP2, '+
                                    '    VALOROP3, IDTITBENEF, VLBENEFPGTO, DTEFETPGTO, '+
                                    '    VALORBASE1,VALORBASE2,VALORBASE3, VALORBASE4,VLRTOTRETROATIVO,VLRDIFRETROATIVO, '+
                                    '    FLGFORMAPAGTO,IDREGRABENEFMIN,IDHSTFOLHABENEF, FLGDESCIRMES,PERCPROVISORIO, '+
                                    '    FLGMANUAL,VALORACERTO,IDSEQINTERNOFB, IDMOVBENEF,FLGTIPOREGISTRO,FLGALIMRESERVA '+
                                    ' FROM HSTBENEFBFCIARIO '+
                                    ' WHERE  IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                                    ' AND    IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem) +
                                    ' AND    IDTITULAR        = '+IntToStr(piIdTitular)     +
                                    ' AND    IDPESSOA         = '+IntToStr(piIdPessoa)      +
                                    ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                                    ' AND    IDBENEFICIO      = '+qryAux.FieldByName('IDBENEFICIO').AsString+
                                    ' AND    NUMEROPROCESSO   = '+qryAux.FieldByName('NUMEROPROCESSO').AsString);
               try
                  dtmAPrev.qry.ExecSQL;
               except
               //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
                on e:Exception do
                begin
                  TratarErro(e.Message);
                  GravaErro('Erro inserir histórico de benefícios do INSS no plano destino.');
                  bErrolocal := true;
                  CdsBeneficiosParaConcessao.next;
                  continue;
               end;
                //Brunno Mattos - KTN 767861 - SOL 132659 Fim
                  
               end;
            end;
            



            try
               CriaLogOcorrencia( IntToStr(piIdPlanoOrigem),
                                  IntToStr(piIdPessJur),
                                  IntToStr(piIdTitular),
                                  CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString,
                                  qryAux.FieldByName('NUMEROPROCESSO').AsString,
                                  IntToStr(piIdPessoa),
                                  IntToStr(piSeqProposta),
                                  '4', 
                                  DateToStr(date),
                                  OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                                  OraNumero(qryAux.FieldByName('VALORTOTAL').AsString),
                                  OraNumero(qryAux.FieldByName('VALORCOTAS').AsString),
                                  qryAux.FieldByName('DATAINICIOFUND').AsString,
                                  DateToStr(StrToDate(dtEvento.Text)-1),
                                  OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                                  qryAux.FieldByName('DATAINICIOFUND').AsString,
                                  qryAux.FieldByName('DATAFINAL').AsString,
                                  qryAux.FieldByName('IDSITBENEFICIO').AsString,
                                  qryAux.FieldByName('FLGDATAPREVISTA').AsInteger,
                                  dtmAPrev.qry,
                                  '7', 
                                  iIdLote,
                                  iIdCalculoGeral);
            except
               
               GravaErro('Erro ao inserir registro de operações de benefício no plano de origem.');
               bErrolocal := true;
               CdsBeneficiosParaConcessao.next;
               continue;
            end;


         end
         else
         begin

            //nova concessão
            dtmAPrev.qry.close;
            dtmAPrev.qry.sql.clear;
            dtmAPrev.qry.sql.add(' INSERT INTO BFCIARIOTITPLAN (                                             '+
                           ' IDTITULAR,          IDPESSJUR,       IDPLANOPREV,      IDPLANOORIGEM,     '+
                           ' IDPESSOA,           IDRESPONSAVEL,   IDBENEFICIO,      SEQPROPOSTA,       '+
                           ' IDDEPENRESPON,      PRIORIDADE,      PERCENTUAL,       IDNUCLEOFAMILIAR,  '+
                           ' CODTIPORECEBEDOR,   DATAFIMRECEB,    IDRESPONNAOREC )                     '+
                           ' SELECT                                                                    '+
                           ' '+IntToStr(piIdTitular)+' ,   '+IntToStr(piIdPessJur)+' ,  '+IntToStr(piIdPlanoDestino)+',   '+
                           ' '+IntToStr(iIdPlanoOrigemLocal)+', '+ 
                           IntToStr(piIdPessoa)+' , '+IntToStr(piIdPessoa)+' , '+
                           ' '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString+', '+IntToStr(piSeqProposta)+' , '+
                           ' NULL,   0,  NULL,    NULL, NULL, NULL , NULL '+
                           ' FROM DUAL ');
            try
               dtmAPrev.qry.execsql;
            except
               
               GravaErro('Erro ao associar benefício a pessoa no plano destino. O benefício '+CdsBeneficiosParaConcessao.fieldbyname('NOME').AsString+' já está associado a pessoa .');
               bErrolocal := true;
               CdsBeneficiosParaConcessao.next;
               continue;
            end;


            dtmAPrev.qry.close;
            dtmAPrev.qry.sql.text := ' SELECT BF.NUMEROPROCESSO '+
                           ' FROM BENEFBFCIARIO BF, BENEFPLANPREV BV '+
                           ' WHERE  BF.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                           ' AND    BF.IDPLANOPREV      = '+IntToStr(piIdPlanoDestino) +
                           ' AND    BF.IDTITULAR        = '+IntToStr(piIdTitular) +
                           ' AND    BF.IDPESSOA         = '+IntToStr(piIdPessoa) +
                           ' AND    BF.SEQPROPOSTA      = '+IntToStr(piSeqProposta)+' '+
                           ' AND    BF.IDPLANOPREV = BV.IDPLANOPREV '+
                           ' AND    BF.IDBENEFICIO = BV.IDBENEFICIO '+
                           ' AND    BV.FLGREFERENCIA = 0 ';
            dtmAPrev.qry.Open;
            if dtmAPrev.qry.isempty then
            begin

               iNumeroProcesso := LeUltRegistro(qryAux,'PROCESSOBENEF');

               dtmAPrev.qry.close;
               dtmAPrev.qry.sql.text := ' INSERT INTO PROCESSOBENEF '+
                               ' (NUMEROPROCESSO, IDEVENTOGERADOR, DTEVENTO, DTDIREITO, '+
                               ' DTREGISTRO, IDSITPROCESSO) '+
                               ' VALUES ('+inttostr(iNumeroProcesso)+', '+CdsBeneficiosParaConcessao.fieldbyname('IDEVENTOGERADOR').AsString+' , '+
                               ' TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY''), '+
                               ' TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY''), '+
                               ' TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY''), 1 ) ';
               try
                  dtmAPrev.qry.execsql;
               except
                  GravaErro('Erro ao inserir processos de benefício do plano destino.');
                  bErrolocal := true;
                  CdsBeneficiosParaConcessao.next;
                  continue;
               end;

            end
            else   iNumeroProcesso := dtmAPrev.qry.fieldbyname('NUMEROPROCESSO').AsInteger;



            
            sDataAuxInsere := dtEvento.Text;

            qryaux.close;
            qryaux.sql.text := ' SELECT FLGFREQUENCIA FROM  TPPAGTOBENEFICIO '+
                               ' WHERE IDTPPAGTOBENEFIC = '''+CdsBeneficiosParaConcessao.fieldbyname('IDTPPAGTOBENEFIC').AsString+''' ';
            qryaux.open;


            if (uppercase(qryaux.fieldbyname('FLGFREQUENCIA').AsString) = 'U')
               and (trim(sAnoMesLote) <> '') then
            begin
               sDataAuxInsere :=  '01/'+copy(sAnoMesLote,6,2)+'/'+copy(sAnoMesLote,1,4);
            end;
            

            // Fazer DE-PARA de beneficios na BENEFBFCIARIO
            dtmAPrev.qry.close;
            dtmAPrev.qry.sql.clear;
            dtmAPrev.qry.sql.add(' INSERT INTO BENEFBFCIARIO (                                               '+
                           ' NUMEROPROCESSO,        IDPLANOPREV,          IDPLANOORIGEM,       IDTITULAR,           '+
                           ' IDPESSJUR,             IDBENEFICIO,          IDPESSOA,              '+
                           ' SEQPROPOSTA,           IDDEPENDENCIA,        IDSITBENEFICIO,      IDTPPAGTOBENEFIC,    '+
                           ' DATAFINAL,             VALORATUAL,           CODPORTFORMA,        DATAREQUERIMENTO,    '+
                           ' DATAINICIO,            TMPPAGTOBENEFICIO,    FLGFORMAPAGTO,       VALORCALCULADO,      '+
                           ' DATAULTREAJUSTE,       ULTMESPREPARO,        VLRCALCINSS,         VLRINFINSS,          '+
                           ' DATAINICIOINSS,        NUMPROCINSS,          DATAINICIOFUND,      FLGBENEFMIN,         '+
                           ' VALORCOTAS,            VALORTOTAL,           DATACONCESSAO,       DATAENCERRAMENTO,    '+
                           ' FLGPROVISORIO,         PERCPROVISORIO,       PRAZOPROVISORIO,     NUMCARTARECAD,       '+
                           ' DATAEMISSAORECAD,      DATALIMITERECAD,      DATARECEBRECAD,      FLGSTATUS,           '+
                           ' BANCOINSS,             MESRECIBOINSS,        ANORECIBOINSS,       FONTEPAGADORA,       '+
                           ' IDAGENCIARESGATE,      ULTMESREAJUSTE,       ULTVALORATUALREAJ,   ULTVALORBRUTO,       '+
                           ' VALORABONO13,          DIBBENEFANT,          FLGDATAPREVISTA,     DATAFINALPREVISTA,   '+
                           ' DFLOATPAGTO,           FLGTIPOINSS,          VALORBENEFANT,       FLGENCERRAPORFALE,   '+
                           ' DATAULTREVISAO,        FLGDESCIRMES,         PERCENTUAL,          VALORNADIB,          '+
                           ' FLGPOSSUIACOMPINSS,    VALORSRB,             IDBENEFREFEREN,      DATALIBERACAO,       '+
                           ' MESPAGLIBERACAO,       IDTITBENEF,           FLGACERTOCBP, '+
                           ' VALORBASE1, VALORBASE2, VALORBASE3, IDPLANPREVCONTAB  )                            '+
                           ' SELECT                           '+
                           ' '+inttostr(iNumeroProcesso)+' ,      '+IntToStr(piIdPlanoDestino)+',  '+
                           IntToStr(iIdPlanoOrigemLocal)+' ,   '+ 
                           ' '+IntToStr(piIdTitular)+', '+IntToStr(piIdPessjur)+', '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString+' ,       '+
                           ' '+IntToStr(piIdPessoa)+' ,  '+IntToStr(piSeqProposta)+',NULL,  1 , '+
                           ' '+CdsBeneficiosParaConcessao.fieldbyname('IDTPPAGTOBENEFIC').AsString+' ,  '+
                           ' NULL,  NULL , NULL,   TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY'') ,  '+
                           ' TO_DATE('''+sDataAuxInsere+''',''DD/MM/YYYY'') ,       '+ 
                           ' NULL,  ''F'',  NULL, NULL, NULL, NULL, NULL ,     '+
                           ' NULL, NULL,  TO_DATE('''+sDataAuxInsere+''',''DD/MM/YYYY'') ,  0,       '+
                           ' NULL,  NULL,     SYSDATE,    '+ 
                           ' NULL,                                                                    '+
                           ' 0, NULL, NULL, NULL, NULL, NULL, NULL,  NULL,     '+
                           ' NULL,  NULL,  NULL,   1, NULL,  NULL, NULL, NULL,     '+
                           ' NULL,  NULL,  NULL  , NULL, NULL,  NULL,  NULL,  NULL, '+
                           ' NULL,  NULL,  NULL,   NULL,        '+
                           ' NULL,  NULL, NULL,  NULL, NULL,  '+IntToStr(piIdTitular)+' , NULL  ');

            if CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsFloat > 0 then
            dtmAPrev.qry.sql.add(' , '+oranumero(CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsString)+' ')
            else dtmAPrev.qry.sql.add(' , NULL');

            if CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsFloat > 0 then
            dtmAPrev.qry.sql.add(' , '+oranumero(CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsString)+' ')
            else dtmAPrev.qry.sql.add(' , NULL');

            if CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsFloat > 0 then
            dtmAPrev.qry.sql.add(' , '+oranumero(CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsString)+' ')
            else dtmAPrev.qry.sql.add(' , NULL');

            dtmAPrev.qry.sql.add(' , '''+CdsBeneficiosParaConcessao.fieldbyname('IDPLANPREVCONTAB').AsString+'''  FROM  DUAL   ');

            try
               dtmAPrev.qry.execsql;
            except
               
               GravaErro('Erro ao inserir benefício '+CdsBeneficiosParaConcessao.fieldbyname('NOME').AsString+' na tabela de Benefícios do Processo no plano destino. O benefício já existe.');
               bErrolocal := true;
               CdsBeneficiosParaConcessao.next;
               continue;
            end;


            qryAux.close;
            qryAux.sql.clear;
            qryAux.sql.add(' SELECT BF.NUMEROPROCESSO, BF.IDBENEFICIO, BF.VALORATUAL, BF.VALORTOTAL, '+
                           '        BF.IDSITBENEFICIO, BF.VALORCOTAS, BF.DATAINICIOFUND, BF.DATAFINAL,   '+
                           '        BF.FLGDATAPREVISTA    '+
                           ' FROM BENEFBFCIARIO BF         '+
                           ' WHERE  BF.IDPESSJUR        = '+IntToStr(piIdPessJur)     +
                           ' AND    BF.IDPLANOPREV      = '+IntToStr(piIdPlanoDestino) +
                           ' AND    BF.IDTITULAR        = '+IntToStr(piIdTitular)     +
                           ' AND    BF.IDPESSOA         = '+IntToStr(piIdPessoa)      +
                           ' AND    BF.SEQPROPOSTA      = '+IntToStr(piSeqProposta)   +
                           ' AND    BF.IDSITBENEFICIO IN (1,2)  '+
                           ' AND    BF.IDBENEFICIO      = '+CdsBeneficiosParaConcessao.fieldbyname('IDBENEFICIO').AsString+' ');
            qryAux.Open;


         end;


         if trim(dblkpcmbLote.text)  = '' then iIdLote := 0
         else iIdLote :=  qryLote.FieldByName('IDLOTE').AsInteger;




         try
            CriaLogOcorrencia( IntToStr(piIdPlanoDestino),
                               IntToStr(piIdPessJur),
                               IntToStr(piIdTitular),
                               qryAux.FieldByName('IDBENEFICIO').AsString,
                               qryAux.FieldByName('NUMEROPROCESSO').AsString,
                               IntToStr(piIdPessoa),
                               IntToStr(piSeqProposta),
                               '7', 
                               DateToStr(date),
                               OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                               OraNumero(qryAux.FieldByName('VALORTOTAL').AsString),
                               OraNumero(qryAux.FieldByName('VALORCOTAS').AsString),
                               dtEvento.Text,
                               '',
                               OraNumero(qryAux.FieldByName('VALORATUAL').AsString),
                               qryAux.FieldByName('DATAINICIOFUND').AsString,
                               qryAux.FieldByName('DATAFINAL').AsString,
                               qryAux.FieldByName('IDSITBENEFICIO').AsString,
                               qryAux.FieldByName('FLGDATAPREVISTA').AsInteger,
                               dtmAPrev.qry,
                               '7', 
                               iIdLote,
                               iIdCalculoGeral);
         except
            
            GravaErro('Erro ao inserir registro de operações de benefício no plano de origem.');
            bErrolocal := true;
            CdsBeneficiosParaConcessao.next;
            continue;
         end;


         CdsBeneficiosParaConcessao.next;
      end;
   end;


   Result :=  not bErrolocal;
end;



function TfrmEventoTransfPlano.CalculaBeneficios( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa,
                                            piSeqProposta : longint;
                                            psIdBeneficios : String) : boolean;
var
rValorReserva,
rValorBeneficio,
rValorBeneficioTotal : double;

sValorReserva,
sSQLBenefAssoc,
sMsgErro,
sIdPessoaAux,
sValorTotal, sValorIntegral, sValorPrev : String;

iIdCalculoAnt, iNumBenef, iIdRegraCalculo : Integer;

bErroLocal  : Boolean;

sHouveResgate, sValorBenefAnt, sSql, sValorRegra ,
sValorBase1Assoc, sValorBase2Assoc, sValorBase3Assoc: String;

varfields       : variant;

begin
   Result := false;
   bErroLocal := false;

   sHouveResgate := '0';
   
   If Not MontaQueryDet(piIdPessJur, piIdPlanoOrigem, piIdPlanoDestino,
                        piIdTitular, piIdPessoa,      piSeqProposta,
                        sIdBeneficios)
   Then Begin
     Result := True;
     Exit;
   End;


   sValorBase1Assoc := '0';
   sValorBase2Assoc := '0';
   sValorBase3Assoc := '0';

   while not qrydet.eof do
   begin

      //pega regra de cálculo
      varFields := VarArrayCreate([0,1],varVariant);
      varFields[0] := qrydet.fieldbyname('IDBENEFICIO').AsInteger;
      varFields[1] := qrydet.fieldbyname('IDPLANOPREV').AsInteger;

      iIdRegraCalculo := 0;
      if CdsBeneficiosParaConcessao.Locate('IdBeneficio;IdPlanoPrev',varFields , [loCaseInsensitive, loPartialKey])
      then iIdRegraCalculo :=  CdsBeneficiosParaConcessao.fieldbyname('IDRGCALCBENEFICIO').AsInteger
      else iIdRegraCalculo :=  qrydet.FieldByName('IdRegraCalculo').AsInteger;

      if iIdRegraCalculo = 0 then
      begin
         bErroLocal := true;
         qrydet.next;

         if CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString <> '' then
            GravaErro('Regra de cálculo do benefício '+qrydet.fieldbyname('NOME').AsString+' não associada no DE-PARA de benefícios.')
         else GravaErro('Regra de cálculo do benefício '+qrydet.fieldbyname('NOME').AsString+' não associada.');

         Continue;
      end;

      //parte comum para titular ou beneficiário

      // Executar regra de calculo da reserva para beneficio passando a query ReservaPart
      // que está com o valor abatido da reserva
      if qryReservaPart.Active and qryReservaPart.UpdatesPending then qryReservaPart.CancelUpdates;
      if qryMovReservaTemp.Active and qryMovReservaTemp.UpdatesPending then qryMovReservaTemp.CancelUpdates;

      with qryReservaPart do
      begin

         Close;
         ParamByName('IdTitular').Value      := qrydet.fieldbyname('IDTITULAR').AsInteger;
         ParamByName('SeqProposta').Value    := qrydet.fieldbyname('SEQPROPOSTA').AsInteger;
         ParamByName('IdPessJur').Value      := qrydet.fieldbyname('IDPESSJUR').AsInteger;
         ParamByName('IdPlanoPrev').Value    := qrydet.fieldbyname('IDPLANOPREV').AsInteger;
         Open;
      end;


      with qryMovReservaTemp do
      begin

         Close;
         ParamByName('IdTitular').Value      := qrydet.fieldbyname('IDTITULAR').AsInteger;
         ParamByName('SeqProposta').Value    := qrydet.fieldbyname('SEQPROPOSTA').AsInteger;
         ParamByName('IdPessJur').Value      := qrydet.fieldbyname('IDPESSJUR').AsInteger;
         ParamByName('IdPlanoPrev').Value    := qrydet.fieldbyname('IDPLANOPREV').AsInteger;
         ParamByName('NumeroProcesso').Value := qrydet.fieldbyname('NUMEROPROCESSO').AsInteger;
         Open;
      end;



      if qryReservaPart.isempty then
         rValorReserva := 0
      else rValorReserva := CalculaReservaParaBeneficio ( qrydet.FieldByName('IdBeneficio').AsInteger,
                                                          qrydet.FieldByName('IdRegraPagamento').AsInteger,
                                                          qrydet.FieldByName('FlgResgate').AsInteger );

      sValorReserva := FloatToStr(rValorReserva);


      //se está no benef de renda continuada e o participante teve
      //um benef. de renda antecipada, já está marcado
      //pois o benef. de renda antecipada tem ordem de cálculo menor
      if qrydet.fieldbyname('FLGRESGATE').AsInteger = 1
      then
      begin
         sHouveResgate := '1';

         //guardar opções do resgate
         sValorBase1Assoc := qrydet.fieldbyname('VALORBASE1').AsString;
         sValorBase2Assoc := qrydet.fieldbyname('VALORBASE2').AsString;
         sValorBase3Assoc := qrydet.fieldbyname('VALORBASE3').AsString;
      end;


      //pegar valor do benef anterior na DIB
      //teste se tem benef de origem, se sim pega VALORINTEGRAL, VALORPREV E VALORTOTAL
      sValorTotal    := qrydet.fieldbyname('VALORNADIB').AsString;
      sValorIntegral := qrydet.fieldbyname('VALORNADIB').AsString;
      sValorPrev     := qrydet.fieldbyname('VALORNADIB').AsString;

      if (CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsString <> '')
         
      then    begin
         PegaValorHstBenef(piIdPessJur,
                           piIdPlanoOrigem, piIdTitular,
                           piIdPessoa,  piSeqProposta,
                           CdsBeneficiosParaConcessao.fieldbyname('IDBENEFORIGEM').AsInteger,
                           copy(qrydet.fieldbyname('DATAINICIO').AsString,7,4)+copy(qrydet.fieldbyname('DATAINICIO').AsString,3,3),
                           sValorTotal, sValorIntegral, sValorPrev );
      end;


      sSql := ' SELECT  '+sHouveResgate+' HOUVERESGATE , '+

              
              qrydet.fieldbyname('IDPLANOPREV').AsString  +' AS IDPLANOPREV, '+
              qrydet.fieldbyname('IDTITULAR').AsString    +' AS IDTITULAR,   '+
              qrydet.fieldbyname('IDPESSOA').AsString     +' AS IDPESSOA,    '+
              qrydet.fieldbyname('IDPESSJUR').AsString    +' AS IDPESSJUR,   '+
              IntToStr( piIdPlanoDestino )                +' AS IDPLANOPREVDEST, '+
              

              ' TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY'') AS DATAEVENTO,  '+ 
              ' '+oranumero(sValorTotal)+' VALORTOTAL , '+
              ' '+oranumero(sValorIntegral)+' VALORINTEGRAL , '+
              ' '+oranumero(sValorPrev)+' VALORPREV , '+
              ' '+IntToStr(qrydet.fieldbyname('FLGRESGATE').AsInteger)+' FLGRESGATE, '+
                  IntToStr(qrydet.fieldbyname('PERCENTUAL').AsInteger)+' AS PERCENTUAL, '+
              ' '+IntToStr(qrydet.fieldbyname('FLGREFERENCIA').AsInteger)+' FLGREFERENCIA, '+
              ' '+oranumero(sValorReserva)+' VALORRESERVA, '+
              ' '+oranumero(qrydet.fieldbyname('VALORBASE1').AsString)+' VALORBASE1,  '+
              ' '+oranumero(qrydet.fieldbyname('VALORBASE2').AsString)+' VALORBASE2,  '+
              ' '+oranumero(qrydet.fieldbyname('VALORBASE3').AsString)+' VALORBASE3, '+
              ' '+oranumero(sValorBase1Assoc)+' ASSOC1OP1,  '+
              ' '+oranumero(sValorBase1Assoc)+' ASSOC1OP2,  '+
              ' '+oranumero(sValorBase1Assoc)+' ASSOC1OP3, '+
              ' '''+qrydet.fieldbyname('DATAINICIOFUND').AsString+''' DATAINICIOFUND, '+
              ' '''+qrydet.fieldbyname('DATAINICIO').AsString+''' DATAINICIO '+
              ' FROM DUAL ';

      sValorRegra := RegraNumerica(IntToStr(iIdRegraCalculo), sSQL, bErroLocal,iIdCalculo);
      try
         rValorBeneficio := StrToFloat(clientenumero(sValorRegra));
      except
         GravaErro('Erro no valor de resultado['+clientenumero(sValorRegra)+'], da regra '+IntToStr(iIdRegraCalculo)+', '+
                   'do benefício '+qrydet.fieldbyname('NOME').AsString+'.');
         qrydet.next;
         Continue;
      end;


      if bErroLocal
      then begin
         GravaErro('Erro no cálculo do benefício '+qrydet.fieldbyname('NOME').AsString+'.');
         qrydet.next;
         Continue;
      end;
      



      if piIdPessoa = piIdTitular then  //executa cálculos para participante
      begin

         //mesmo valor no caso de benefício para titular
         rValorBeneficioTotal :=  rValorBeneficio;
         
      end
      else
      begin  //executa cálculos para beneficiário

         //calcula valor total do benefício para beneficiário
         //passando como VALORINTEGRAL, o VALORTOTAL
         sSql := ' SELECT  '+sHouveResgate+' HOUVERESGATE , '+

                 
                 qrydet.fieldbyname('IDPLANOPREV').AsString  +' AS IDPLANOPREV, '+
                 qrydet.fieldbyname('IDTITULAR').AsString    +' AS IDTITULAR,   '+
                 qrydet.fieldbyname('IDPESSOA').AsString     +' AS IDPESSOA,    '+
                 qrydet.fieldbyname('IDPESSJUR').AsString    +' AS IDPESSJUR,   '+
                 IntToStr( piIdPlanoDestino )                +' AS IDPLANOPREVDEST, '+
                 

                 ' TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY'') AS DATAEVENTO,  '+ 
                 ' '+oranumero(sValorTotal)+' VALORTOTAL , '+
                 ' '+oranumero(sValorTotal)+' VALORINTEGRAL , '+
                 ' '+oranumero(sValorPrev)+' VALORPREV , '+
                 ' '+IntToStr(qrydet.fieldbyname('FLGRESGATE').AsInteger)+' FLGRESGATE, '+
                  IntToStr(qrydet.fieldbyname('PERCENTUAL').AsInteger)+' AS PERCENTUAL, '+ 
                 ' '+IntToStr(qrydet.fieldbyname('FLGREFERENCIA').AsInteger)+' FLGREFERENCIA, '+ 
                 ' '+oranumero(sValorReserva)+' VALORRESERVA, '+
                 ' '+oranumero(qrydet.fieldbyname('VALORBASE1').AsString)+' VALORBASE1,  '+
                 ' '+oranumero(qrydet.fieldbyname('VALORBASE2').AsString)+' VALORBASE2,  '+
                 ' '+oranumero(qrydet.fieldbyname('VALORBASE3').AsString)+' VALORBASE3, '+
                 ' '+oranumero(sValorBase1Assoc)+' ASSOC1OP1,  '+
                 ' '+oranumero(sValorBase1Assoc)+' ASSOC1OP2,  '+
                 ' '+oranumero(sValorBase1Assoc)+' ASSOC1OP3, '+
                 ' '''+qrydet.fieldbyname('DATAINICIOFUND').AsString+''' DATAINICIOFUND, '+
                 ' '''+qrydet.fieldbyname('DATAINICIO').AsString+''' DATAINICIO '+
                 ' FROM DUAL ';


         sValorRegra := RegraNumerica(IntToStr(iIdRegraCalculo), sSQL, bErroLocal,iIdCalculo);
         try
            rValorBeneficioTotal := StrToFloat(clientenumero(sValorRegra));
         except
            GravaErro('Erro no valor de resultado['+clientenumero(sValorRegra)+'], da regra '+IntToStr(iIdRegraCalculo)+', '+
                      'do benefício '+qrydet.fieldbyname('NOME').AsString+'.');
            qrydet.next;
            Continue;
         end;


         if bErroLocal
         then begin
            GravaErro('Erro no cálculo do benefício '+qrydet.fieldbyname('NOME').AsString+'.');
            qrydet.next;
            Continue;
         end;
         
      end;



      //grava dados calculados
      qryaux.close;
      qryaux.sql.text := ' UPDATE BENEFBFCIARIO SET VALORATUAL = '+oranumero(FloatToStr(rValorBeneficio))+','+
                         ' VALORCALCULADO = '+oranumero(FloatToStr(rValorBeneficio))+',  '+
                         ' VALORTOTAL = '+oranumero(FloatToStr(rValorBeneficioTotal))+''+
                         ' WHERE NUMEROPROCESSO = '+qrydet.fieldbyname('NUMEROPROCESSO').AsString+' '+
                         ' AND IDPESSJUR = '+qrydet.fieldbyname('IDPESSJUR').AsString+' '+
                         ' AND IDPLANOPREV = '+qrydet.fieldbyname('IDPLANOPREV').AsString+' '+
                         ' AND IDPESSOA = '+qrydet.fieldbyname('IDPESSOA').AsString+' '+
                         ' AND SEQPROPOSTA = '+qrydet.fieldbyname('SEQPROPOSTA').AsString+' '+
                         ' AND IDBENEFICIO = '+qrydet.fieldbyname('IDBENEFICIO').AsString+' ';
      try
         qryaux.execsql;
      except
         GravaErro('Erro na atuliazação de valores do benefício '+qrydet.fieldbyname('NOME').AsString+'.');
         bErroLocal:= true;
         qrydet.next;
         Continue;
      end;


      if (QryDet.FieldByName('FlgResgate').AsInteger = 1) and
         (not AtualizaReservaPart(QryDet.FieldByName('IdBeneficio').AsInteger))
      then begin
         MsgDlg('Ocorreu um erro na atualização do valor da reserva do participante. ',
                'Erro',mtError,[mbOk,mbHelp],0);
         TiraSQL(qryAux);
         Abort;
      end;


      if qryReservaPart.Active and qryReservaPart.UpdatesPending then qryReservaPart.ApplyUpdates;
      if qryMovReservaTemp.Active and qryMovReservaTemp.UpdatesPending then qryMovReservaTemp.ApplyUpdates;


      qrydet.next;
   end;




   Result := not bErroLocal;
end;





procedure TFrmEventoTransfPlano.btnbeneficiosClick(Sender: TObject);
begin
  inherited;
  if Trim(dblkpNovoPlano.Text) = ''
  then begin
     MsgDlg('O Plano destino deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpNovoPlano.SetFocus;
     TiraIconeSql;
     Exit;
  end;

  MostraTelaBeneficios;
end;

procedure TFrmEventoTransfPlano.btnbuscaarqClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;

  odTxt.Execute;
  edarqmat.Text := odTxt.FileName;
  edarqmat.Hint := edarqmat.Text;
  if (edarqmat.Font.Size * length(edarqmat.text)) > edarqmat.Width then
    edarqmat.ShowHint:=true
  else
    edarqmat.ShowHint:=false;

  bindividual := false;
  bbtnConfirmar.enabled := True;
  btnDesfazer.enabled := true;
end;

procedure TFrmEventoTransfPlano.dblkPlanoOrigemEnter(Sender: TObject);
begin
  inherited;
  if not qryPlanOrigem.Active then
  begin
     qryPlanOrigem.open;
     try qrypatro.open except end;
  end;

  
end;

procedure TFrmEventoTransfPlano.dblkPlanoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  edPlano.text :=  qryPlanOrigem.fieldbyname('NOMEPLANO').AsString;
  sIdPlanoOrigem  := qryPlanOrigem.fieldbyname('IDPLANOPREV').AsString;
  
end;

procedure TFrmEventoTransfPlano.dblkPatroDestinoEnter(Sender: TObject);
begin
  inherited;
  if not qryPatro.Active then qryPatro.open;
end;

procedure TFrmEventoTransfPlano.dblkPatroDestinoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  sIdPessJurTransf := qrypatro.fieldbyname('idpessoa').AsString;


end;




function TFrmEventoTransfPlano.CalculaReservaParaBeneficio ( piIdBeneficio,
                                            piIdRegraReserva,
                                            piFlgResgate           : longint )  : double;

var dTotReservaReal,
    dValorReservaCota,
    dValorDaCota,
    dTotReserva    : double;
    sDataRef,
    sDataInicio,
    sValorAtualReserva,
    sValorReservaCota,
    sValorTotReservaReal,
    sDataCancelamento,
    sSQLReserva,
    sDataUltRecebimento     : string;
    iNumReg,
    iTotReserva,
    iFlgUltimo      : integer;
    varfields       : variant;
begin
   Result := 0;



   if Trim(dtEvento.Text) <> ''
   then sDataRef := dtEvento.Text
   else sDataRef := DateToStr(date);

   sDataInicio := qrydet.fieldbyname('DATAINICIOFUND').AsString;


   // Se tiver regra de calculo de reserva para pagamento
   // Entao utilizar a regra
   // Senao converter as reservas para real e somá-las
   if piIdRegraReserva > 0
   then begin


     qryaux.close;
     qryaux.sql.text := ' SELECT MAX(DATARECEBIMENTO) DATA '+
                        ' FROM HSTCONTRIBPREV  '+
                        ' WHERE  IDPESSJUR =  '''+qryReservaPart.FieldByName('IdPessJur').AsString+'''   '+
                        ' AND IDPLANOPREV = '''+qryReservaPart.FieldByName('IdPlanoPrev').AsString+'''   '+
                        ' AND IDPESSOA =  '''+qryReservaPart.FieldByName('IdPessoa').AsString+'''    '+
                        ' AND SEQPROPOSTA =  '''+qryReservaPart.FieldByName('SeqProposta').AsString+''' ';
     qryaux.open;

     if not qryaux.isempty then sDataUltRecebimento :=   qryaux.fieldbyname('DATA').AsString;




     sSQLReserva := '';
     iNumReg     := 0;
     iFlgUltimo  := 0;
     iTotReserva := qryReservaPart.RecordCount;
     qryReservaPart.First;

     // Executar a regra de reserva para beneficio para cada reserva.
     // A regra retornará o valor em cotas que será usado da reserva para calcular o
     // valor do benefício. Este valor deve ser guardado na MOVRESERVATEMP
     // Quando acabar de executar a regra para todas as reservas, executá-la mais
     // uma vez para a regra retornar o valor total em real da reserva para benefício
     while (not qryReservaPart.Eof) or (iNumReg <= iTotReserva) do
     begin
        inc(iNumReg);

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        if iNumReg > iTotReserva
        then iFlgUltimo := 1;

        if iFlgUltimo = 1 then
        begin
           sValorAtualReserva := OraNumero(FloatToStr(dTotReservaReal));
        end
        else
        begin
           varFields := VarArrayCreate([0,1],varVariant);
           varFields[0] := piIdBeneficio;
           varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

           if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
           then sValorAtualReserva := OraNumero(FloatToStr(qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                                - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat))
           else if qryMovReservaTemp.Locate('IdTipoReserva',qryReservaPart.FieldByName('IdTipoReserva').AsInteger , [loCaseInsensitive, loPartialKey])
           then sValorAtualReserva := OraNumero(FloatToStr(qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                                - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat))
           else sValorAtualReserva := OraNumero(qryReservaPart.FieldByName('ValorReserva').AsString);
        end;


        If sDataCancelamento = '' Then sDataCancelamento := ' ';


        sSQLReserva := ' SELECT '+IntToStr(iNumReg)+' AS CONTRESERVA, '+
                                IntToStr(iFlgUltimo)+' AS ULTRESERVA, '+
                                qryReservaPart.FieldByName('IdTipoReserva').AsString+ ' AS IDTIPORESERVA,    '+
                                qryReservaPart.FieldByName('IdPessJur').AsString    + ' AS IDPESSJUR,        '+
                                qryReservaPart.FieldByName('IdPlanoPrev').AsString  + ' AS IDPLANOPREV,      '+
                                qryReservaPart.FieldByName('IdPessoa').AsString     + ' AS IDPESSOA,         '+
                                qryReservaPart.FieldByName('SeqProposta').AsString     + ' AS SEQPROPOSTA,   '+
                                ''''+qryReservaPart.FieldByName('FLGDESCIRRF').AsString+ ''' AS FLGDESCIRRF, '+
                                IntToStr(piIdBeneficio)+ ' AS IDBENEFICIO,          '+
                                sValorAtualReserva        + ' AS VALORRESERVA,                               '+
                                ''''+qryReservaPart.FieldByName('MoeSigla').AsString+ '''         AS MOESIGLA,     '+
                                ''''+PreparaStrRegra(sDataInicio)+ '''       AS DATAINICIO,                                         '+
                                ''''+PreparaStrRegra(sDataRef)+ '''          AS DATAREF,                                            '+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAREFERENCIASA').AsString)+ ''' AS DATAREFERENCIASA, '+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATANASC').AsString)      +'''    AS DATANASC,       '+
                                ''''+ PreparaStrRegra(sDataCancelamento) +'''    AS DATACANCELAMENTO, '+
                                ''''+qryReservaPart.FieldByName('DATAADMISSAO').AsString  +'''    AS DATAADMISSAO,   '+
                                ''''+qryReservaPart.FieldByName('CODHIERARQUIA').AsString +'''    AS CODHIERARQUIA,  '+
                                ''''+qryReservaPart.FieldByName('INDICEREAJUSTE').AsString+'''    AS INDICEREAJUSTE, '+
                                ''''+qryReservaPart.FieldByName('FLGCONTROLE').AsString   +'''    AS FLGCONTROLE,    '+
                                ''''+PreparaStrRegra(Trim(qrydet.fieldbyname('DATAREQUERIMENTO').AsString) )        +'''    AS DATAREQUERIMENTO,              '+
                                ''''+PreparaStrRegra(Trim(qrydet.fieldbyname('DATAINICIO').AsString) )        +'''    AS DATAINICIOPAGTO, '+
                                ''''+PreparaStrRegra(sFlgInternoDepois)+''' AS FLGINTERNO, '+
                                ''''+PreparaStrRegra(sFlgInternoAntes)+''' AS FLGINTERNOANT, '+
                                ''''+PreparaStrRegra(sIdSitPartAntes)+''' AS IDSITPARTATUAL, '+
                                ''''+PreparaStrRegra(sIdSitPlanAntes)+''' AS IDSITPLANOATUAL, '+
                                ''''+PreparaStrRegra(sIdSitFuncAntes)+''' AS IDSITFUNCATUAL, '+
                                ''''+PreparaStrRegra(sIdSitPartDepois)+''' AS IDSITPARTNOVO, '+
                                ''''+PreparaStrRegra(sIdSitPlanDepois)+''' AS IDSITPLANONOVO, '+
                                ''''+PreparaStrRegra(sIdSitFuncDepois)+''' AS IDSITFUNCNOVO, '+
                                ''''+OraNumero(qryReservaPart.FieldByName('PERCENTUALSAQUE').AsString)+'''         AS PERCENTUALSAQUE, '+
                                OraNumero(qrydet.fieldbyname('VALORBASE1').AsString)+ ' AS VALORBASE1, '+
                                OraNumero(qrydet.fieldbyname('VALORBASE2').AsString)+ ' AS VALORBASE2, '+
                                OraNumero(qrydet.fieldbyname('VALORBASE3').AsString)+ ' AS VALORBASE3 , '+
                                ''''+PreparaStrRegra(sDataUltRecebimento)+'''    AS DATAULTCONTRIB       '+
                    ' FROM DUAL ';

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        if iNumReg <=  iTotReserva
        then begin
           sValorReservaCota    := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo );

           if bErro
           then begin
              GravaErro('Erro no cálculo de valor de reserva para benefício.');
              dValorReservaCota := 0;
              break;
           end
           else dValorReservaCota := StrToFloat(ClienteNumero(sValorReservaCota));



           //acumula valor a ser usado na regra de benefício
           //que é o valor a ser abatido
           dTotReservaReal := dTotReservaReal + dValorReservaCota;


           if (piFlgResgate = 1)
           then begin
              // Atualizar/inserir reserva na qryMovReservaTemp
              varFields := VarArrayCreate([0,1],varVariant);
              varFields[0] := piIdBeneficio;
              varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
              if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
              then begin
                 qryMovReservaTemp.Edit;
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
                 qryMovReservaTemp.Post;
              end
              else begin
                 qryMovReservaTemp.Insert;
                 qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
                 qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                 qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := qrydet.fieldbyname('IDPESSJUR').AsInteger;
                 qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := qrydet.fieldbyname('IDPLANOPREV').AsInteger;
                 qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := qrydet.fieldbyname('IDTITULAR').AsInteger;;
                 qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := qrydet.fieldbyname('IDPESSOA').AsInteger;;
                 qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := qrydet.fieldbyname('SEQPROPOSTA').AsInteger;;
                 qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := qrydet.fieldbyname('NUMEROPROCESSO').AsInteger;;
                 qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := qrydet.fieldbyname('IDBENEFICIO').AsInteger;;
                 qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
                 qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                 qryMovReservaTemp.Post;
              end;
           end;
           qryReservaPart.Next;
        end
        else begin

           sValorTotReservaReal := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo );

           if bErro
           then begin
              GravaErro('Erro no cálculo de valor de reserva para benefício.');
              dTotReservaReal := 0;
              break;
           end
           else dTotReservaReal := StrToFloat(ClienteNumero(sValorTotReservaReal));
        end;
     end; 
   end
   else begin
       dTotReservaReal := 0;
       dTotReserva     := 0;
       qryReservaPart.First;



       while not qryReservaPart.Eof do
       begin
           if qryReservaPart.FieldByName('ValorReserva').AsFloat > 0
           then begin


              if not  qryMovReservaTemp.isempty then
              begin
                 varFields := VarArrayCreate([0,1],varVariant);
                 varFields[0] := piIdBeneficio;
                 varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

                 if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
                 then dTotReserva := (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                     - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat)
                 else if qryMovReservaTemp.Locate('IdTipoReserva',qryReservaPart.FieldByName('IdTipoReserva').AsInteger , [loCaseInsensitive, loPartialKey])
                 then dTotReserva := (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                     - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat)
                 else dTotReserva := qryReservaPart.FieldByName('ValorReserva').AsFloat;
              end
              else
              begin
                 dTotReserva := qryReservaPart.FieldByName('ValorReserva').AsFloat;
              end;



              dValorDaCota  := VoltaValorCotacao(qryaux,
                                                 qryReservaPart.FieldByName('INDICEREAJUSTE').AsString,'','',
                                                 dtEvento.Text);

              dTotReservaReal := dTotReservaReal + (  dTotReserva   * dValorDaCota );


              // Atualizar/inserir reserva na qryMovReservaTemp
              if (piFlgResgate = 1)
              then begin
                 varFields := VarArrayCreate([0,1],varVariant);
                 varFields[0] := piIdBeneficio;
                 varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
                 if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
                 then begin
                    qryMovReservaTemp.Edit;
                    qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.Post;
                 end
                 else begin
                    qryMovReservaTemp.Insert;
                    qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
                    qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                    qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := qrydet.fieldbyname('IDPESSJUR').AsInteger;;
                    qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := qrydet.fieldbyname('IDPLANOPREV').AsInteger;;
                    qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := qrydet.fieldbyname('IDTITULAR').AsInteger;;
                    qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := qrydet.fieldbyname('IDPESSOA').AsInteger;;
                    qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := qrydet.fieldbyname('SEQPROPOSTA').AsInteger;;
                    qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := qrydet.fieldbyname('NUMEROPROCESSO').AsInteger;;
                    qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := qrydet.fieldbyname('IDBENEFICIO').AsInteger;;
                    qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                    qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.Post;
                 end;
              end;
           end;
           qryReservaPart.Next;
       end;
   end;


   try
     OraNumero(FloatToStr(dTotReservaReal));
   except
     GravaErro('Valor inválido de reserva para benefício.');
     Exit;
   end;

   Result := dTotReservaReal;
end;



//concessão
function TFrmEventoTransfPlano.AtualizaReservaPart ( piIdBeneficio : longint ) : boolean;
begin
   Result := False;
   qryMovReservaTemp.First;
   while not qryMovReservaTemp.Eof do
   begin
      if qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio
      then begin
         qryMovReservaTemp.Next;
         continue;
      end;

      if not qryReservaPart.Locate('IdTipoReserva',qryMovReservaTemp.FieldByName('IdTipoReserva').AsInteger,[loCaseInsensitive])
      then begin
         qryMovReservaTemp.Next;
         continue;
      end;

      qryReservaPart.Edit;

      // Só zerar o saldo se o valor original era positivo, pois no caso da CBS pode existir reserva originalmente positivo
      if (( qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat ) < 0) and 
         (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat > 0 )
      then qryReservaPart.FieldByName('ValorReserva').AsFloat := 0
      else qryReservaPart.FieldByName('ValorReserva').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                                               - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;

      qryReservaPart.Post;

      qryMovReservaTemp.Next;
   end; 

   Result := True;
end;





procedure TFrmEventoTransfPlano.dblkpNovoPlanoEnter(Sender: TObject);
begin
  inherited;
  qryPatroPlano.Close;
  qryPatroPlano.parambyname('IDPESSJUR').AsString := sidpessjurtransf;
  qryPatroPlano.Open;
end;

procedure TFrmEventoTransfPlano.dblkpcmbLoteEnter(Sender: TObject);
begin
  inherited;
  if not qryLote.Active then qryLote.open;
end;



Procedure TFrmEventoTransfPlano.MostraDemonstrativo;
begin
   if bErro then
   begin
      tbErros.TabVisible := True;
      pgMem.activepage := tbErros;
   end
   else
   begin
      pgMem.activepage := tbMem;
      tbErros.TabVisible := false;
   end;

   tbdockDemons.visible := True;
   tbdockDemons.Top := 71;
   tbdockDemons.Left := 64;

end;

procedure TFrmEventoTransfPlano.BitBtn2Click(Sender: TObject);
begin
  inherited;
  tbdockDemons.visible := false;
end;

procedure TFrmEventoTransfPlano.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if printdlg.Execute
  then
  begin
     if pgMem.activepage = tbMem then memResult.Print(' ')
     else memErros.Print(' ');
  end;

end;

procedure TFrmEventoTransfPlano.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then
  begin
     if pgMem.activepage = tbMem then memResult.Lines.SaveToFile(savedlg.filename)
     else memErros.Lines.SaveToFile(savedlg.filename);
  end;

end;

procedure TFrmEventoTransfPlano.btnDemonsClick(Sender: TObject);
begin
  inherited;
  MostraDemonstrativo;
end;


Procedure TFrmEventoTransfPlano.GravaErro(sErro : String);
begin
   with memErros.Lines do
   begin
      Add('Matrícula: '+sMatriculaCorrente+'');
      Add('Nome: '+sNomeCorrente+'');
      Add('Erro: '+sErro+'');
      Add('');
   end;
end;


procedure TFrmEventoTransfPlano.btnEfetivarClick(Sender: TObject);
begin
  inherited;

  dtmBasedados.dbBaseDados.Commit;
  LimpaCampos;

end;

function TFrmEventoTransfPlano.BuscaNumeroBeneficiarios (   piNumeroprocesso  : longint;
                                      piIdPessjur       : longint;
                                      piIdPlanoPrev     : longint;
                                      piIdTitular       : longint;
                                      piIdBeneficio     : longint ) : integer;
begin
   Result := 0;
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT COUNT(DISTINCT IDPESSOA) AS NUMBENEF           '+
              ' FROM   BENEFBFCIARIO                                  '+
              ' WHERE  NUMEROPROCESSO = '+IntTosTr(piNumeroProcesso)   +
              ' AND    IDPESSJUR      = '+IntTosTr(piIdPessJur)        +
              ' AND    IDPLANOPREV    = '+IntTosTr(piIdPlanoPrev)      +
              ' AND    IDTITULAR      = '+IntTosTr(piIdTitular)        +
              ' AND    IDBENEFICIO    = '+IntToStr(piIdBeneficio)      );
      Open;
      if (not IsEmpty) and (FieldByName('NUMBENEF').AsInteger > 0)
      then Result := FieldByName('NUMBENEF').AsInteger;
   end;
end;


function TFrmEventoTransfPlano.PreparaBeneficiosTransfPlano( piIdPessJur ,
                                       piIdPlanoOrigem   ,
                                       piIdPlanoDestino  ,
                                       piIdTitular       ,
                                       piIdPessoa        ,
                                       piSeqProposta   : LongInt   ) : boolean;
var iNumBenef               : integer;
    dValorAtualizadoRateado : double;
    dValorAtualizadoTotal   : double;
    dValorSRB               : double;
    sUltMesReajuste         : string;
    sMsgErro                : string;
    bErroLocal                   : boolean;
    bPreparaContrib13       : boolean;
    iNumeroProcesso         : longint;
    sSQL                    : string;
    sAnoMesInicio           : string;
    sSalPart                : string;
    sDataInicio             : string;

begin
   If qryDet.isempty then exit;

   Result  := False;
   bErroLocal := False;

   // **************************************************************************
   // *********************** PREPARAR BENEFICIOS ******************************
   // **************************************************************************
   with qryDet do
   begin

      //atualiza
      Close;
      Open;

      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;

      while not Eof do
      begin
         iNumBenef       := BuscaNumeroBeneficiarios ( FieldByName('NUMEROPROCESSO').AsInteger,
                                                       piIdPessjur,
                                                       piIdPlanoDestino,
                                                       piIdTitular,
                                                       FieldByName('IDBENEFICIO').AsInteger);

         // Preencher Parametros para Passar para Rotinas de Preparo
         iNumeroProcesso := FieldByName('NUMEROPROCESSO').AsInteger;
         dValorSRB       := FieldByName('VALORSRB').AsFloat;
         sAnoMesInicio   := Copy(FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(FieldByName('DATAINICIO').AsString,4,2);
         sDataInicio     := FieldByName('DATAINICIO').AsString;

         if not PreparaBeneficioConcedido( dtmAPrev.qry,
                                           piIdTitular,
                                           piIdPessoa,
                                           piSeqProposta,
                                           piIdPessJur,
                                           piIdPlanoDestino,
                                           FieldByName('NUMEROPROCESSO').AsInteger,
                                           FieldByName('IDBENEFICIO').AsInteger,
                                           prmIDMOTIVOFOLHABEN,
                                           iNumBenef,
                                           FieldByName('IDREGRACALCULO').AsInteger,
                                           -1, 
                                           FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                           FieldByName('IDREGRAULTPAGTO').AsInteger,
                                           FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                           FieldByName('CODPORTFORMA').AsInteger,
                                           '', 
                                           '', 
                                           '', 
                                           '', 
                                           FieldByName('DATAINICIO').AsString,
                                           FieldByName('DATAFINAL').AsString,
                                           FieldByName('FLGCALCTODOMES').AsString,
                                           FieldByName('VALORATUAL').AsFloat,
                                           FieldByName('VALORCOTAS').AsFloat,
                                           FieldByName('VALORTOTAL').AsFloat,
                                           True,
                                           dValorAtualizadoRateado,
                                           dValorAtualizadoTotal,
                                           sUltMesReajuste,
                                           bErroLocal,
                                           bPreparaContrib13,
                                           sMsgErro,
                                           iIdLote,
                                           FieldByName('DATAINICIO').AsString,
                                           7,
                                           FieldByName('FLGDATAPREVISTA').AsInteger,
                                           dValorSRB,
                                           iIdCalculoGeral,
                                           True
                                            )
         then
         begin
            GravaErro('Erro ao inserir valores no histórico de benefícios. Mensagem;');
            GravaErro(sMsgErro);
            bErrolocal := true;
         end;

         
         qryaux.close;
         qryaux.sql.text := ' UPDATE BENEFBFCIARIO SET VALORATUAL = '+oranumero(FloatToStr(dValorAtualizadoRateado))+','+
                            ' VALORCALCULADO = '+oranumero(FloatToStr(dValorAtualizadoRateado))+',  '+
                            ' VALORTOTAL = '+oranumero(FloatToStr(dValorAtualizadoTotal))+''+
                            ' WHERE NUMEROPROCESSO = '+qrydet.fieldbyname('NUMEROPROCESSO').AsString+' '+
                            ' AND IDPESSJUR = '+qrydet.fieldbyname('IDPESSJUR').AsString+' '+
                            ' AND IDPLANOPREV = '+qrydet.fieldbyname('IDPLANOPREV').AsString+' '+
                            ' AND IDPESSOA = '+qrydet.fieldbyname('IDPESSOA').AsString+' '+
                            ' AND SEQPROPOSTA = '+qrydet.fieldbyname('SEQPROPOSTA').AsString+' '+
                            ' AND IDBENEFICIO = '+qrydet.fieldbyname('IDBENEFICIO').AsString+' ';
         try
            qryaux.execsql;
         except
            GravaErro('Erro na atuliazação de valores do benefício, após atualização '+qrydet.fieldbyname('NOME').AsString+'.');
            bErroLocal:= true;
            qrydet.next;
            Continue;
         end;
         


         Next;
      end; 
   end; 



   // **************************************************************************
   // *********************** PREPARAR CONTRIBUICOES ***************************
   // **************************************************************************
   if piIdTitular = piIdPessoa
   then begin // preparar contribuicoes para participante
      sSQL := ' SELECT CP.IDCONTRIBUICAO, CP.SEQPROPOSTA, CP.IDCONTRIBUICAO, CP.IDPESSOA,    '+
              '        CP.CODPORTFORMA, CP.FLGDESCFOLHA, CP.VALORBASE1, CP.VALORBASE2,       '+
              '        CP.VALORBASE3, CP.DATAINICIO, CP.DATAFINAL, C.NOME, PP.INSCRICAODATA, '+
              '        PF.DATANASC, CT.ORDEMCALCULO, PP.IDSITPART                            '+
              ' FROM  CONTRIBUICAO C, CONTPREV CT,  PARTPREVPLAN PP, CONTRIBPREVPARTP CP,    '+
              '       PESSOAFISICA PF                                                        '+
              ' WHERE CP.IDPESSJUR      = ' + IntToStr(piIdPessJur)                           +
              ' AND   CP.IDPLANOPREV    = ' + IntToStr(piIdPlanoDestino)                      +
              ' AND   CP.IDPESSOA       = ' + IntToStr(piIdTitular)                           +
              ' AND   CP.SEQPROPOSTA    = ' + IntToStr(piSeqProposta)                         +
              ' AND   CP.FLGCOBRA       = 1                                                  '+
              ' AND   CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO                                   '+
              ' AND   PP.IDPESSJUR      = CP.IDPESSJUR                                       '+
              ' AND   PP.IDPLANOPREV    = CP.IDPLANOPREV                                     '+
              ' AND   PP.IDPESSOA       = CP.IDPESSOA                                        '+
              ' AND   PP.SEQPROPOSTA    = CP.SEQPROPOSTA                                     '+
              ' AND   PF.IDPESSOA       = CP.IDPESSOA                                        '+
              ' AND   CT.IDPLANOPREV    = CP.IDPLANOPREV                                     '+
              ' AND   CT.IDCONTRIBUICAO = CP.IDCONTRIBUICAO                                  '+
              ' ORDER BY CT.ORDEMCALCULO                                                     ';

      with dtmAPrev.qryContribNucleo do
      begin
         Close;
         SQL.Clear;
         SQL.Add(sSQL);
         Open;

         if IsEmpty
         then begin
            Result := True;
            Exit;
         end;
      end;

      sSalPart := ORANUMERO(CalcSalPart( piIdPessJur, piIdTitular, sAnoMesInicio, dtmAPrev.qryAux));


      
      if PreparaContribuicaoASSISTIDO(
                             piIdPessJur,
                             piIdPlanoDestino,
                             prmIDMOTIVOFOLHABEN,
                             0,
                             dtmAPrev.qryTransfPlano,
                             dtmAPrev.qryAux,
                             sSQL,
                             '',   
                             '',  
                             '',  
                             'AS', 
                             '',   
                             'R',  
                             '1', 
                             False, 
                             False, 
                             sMsgErro,
                             iIdLote,
                             sSalPart,
                             dtmAPrev.qryContribNucleo.FieldByName('IDSITPART').AsString,
                             'TP',
                             True,
                             False,
                             '',
                             False,
                             StrToInt(sIdEventoGerador),
                             sDataInicio,
                             '',
                             7, 
                             0,
                             '',
                             iNumeroProcesso)
       then
      begin
         GravaErro('Erro ao calcular as contribuições.');
         bErrolocal := true;
      end;

   end 
   else begin // preparar contribuicoes para beneficiario
      if not GeraContribBenef( dtmAPrev.qryTransfPlano,
                               dtmAPrev.qryContribNucleo,
                               dtmAPrev.qryAux,
                               IntToStr(piIdPessoa)+',',
                               iNumeroProcesso,
                               -1,
                               sAnoMesLote,
                               sDataInicio,
                               sAnoMesInicio,
                               IntToStr(prmIDMOTIVOFOLHABEN),
                               iIdLote)
      then
      begin
         GravaErro('Erro ao calcular as contribuições.');
         bErrolocal := true;
      end;

   end;

   Result := not bErroLocal;
end;




function TFrmEventoTransfPlano.AcertaBeneficioTransfPlano ( piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint) : boolean;
var dValorPago       : double;
    dValorAPagar     : double;
    dValorCobrado    : double;
    dValorACobrar    : double;
    dIndice, dDiferenca   : double;
    iFlgDevolucao    : word;
    sDataRefInd, sIndiceCorrecao, sSQLRegraCorrecao, sMsgErro,
    sAnoMesRef, sAnoMesRefAnt : string;
    iIdCalculo, iSeqBeneficio : Integer;
begin

   Result        := False;
   iIdCaluloAtualizacao := 0;

   // **************************************************************************
   // ****************************  BENEFICIOS *********************************
   // **************************************************************************
   // Abrir query com novos beneficios, preparados pelo evento de transferencia
   // de plano
   with dtmaprev.qry do
   begin
      Close;
      SQL.Clear;
      
      SQL.Add(' SELECT H.MES, H.MESREFERENCIA, H.IDBENEFICIO, H.VALORPREV, H.VALORINTEGRAL, '+
              '        BT.IDBENEFORIGEM,                                                    '+
              '        BF.NUMEROPROCESSO, BF.IDPESSJUR, BF.IDPLANOPREV, BF.IDBENEFICIO      '+
              ' FROM   BENEFBFCIARIO BF, HSTBENEFBFCIARIO H, BENEFTRANSFPLANO BT,           '+
              '        BENEFPLANPREV BP'                                                     +
              ' WHERE  BT.IDPLANODEST     = '+IntToStr(piIdPlanoDestino)                     +
              ' AND    BT.IDEVENTOGERADOR = '+sIdEventoGerador                               +
              ' AND    BF.IDPESSJUR       = '+IntToStr(piIdPessJur)                          +
              ' AND    BF.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)                     +
              ' AND    BF.IDTITULAR       = '+IntToStr(piIdTitular)                          +
              ' AND    BF.IDPESSOA        = '+IntToStr(piIdPessoa)                           +
              ' AND    BF.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                        +
              ' AND    BP.FLGREFERENCIA   = 0                                               '+

              ' AND    BF.IDBENEFICIO     = BT.IDBENEFDEST                                  '+

              ' AND    H.IDPLANOPREV      = BF.IDPLANOPREV                                  '+
              ' AND    H.IDBENEFICIO      = BF.IDBENEFICIO                                  '+
              ' AND    H.NUMEROPROCESSO   = BF.NUMEROPROCESSO                               '+
              ' AND    H.IDPESSJUR        = BF.IDPESSJUR                                    '+
              ' AND    H.IDTITULAR        = BF.IDTITULAR                                    '+
              ' AND    H.IDPLANOORIGEM    = BF.IDPLANOORIGEM                                '+
              ' AND    H.IDPESSOA         = BF.IDPESSOA                                     '+
              ' AND    H.SEQPROPOSTA      = BF.SEQPROPOSTA                                  '+
              ' AND    H.IDPLANOPREV      = BP.IDPLANOPREV                                  '+
              ' AND    H.IDBENEFICIO      = BP.IDBENEFICIO                                  '+
              ' AND    H.MESREFERENCIA    >= '''+Copy(dtNovaDib.text,7,4)+'/'+Copy(dtNovaDib.text,4,2)+''''+
              ' AND    H.MESREFERENCIA    <> '''+sAnoMesLote+''''+ 
              ' ORDER BY H.MES, H.MESREFERENCIA                                             ');
      Open;
   end;
   sAnoMesRefAnt := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
   // Para cada linha encontrada, verificar se o beneficio associado no DE-PARA teve
   // valor calculado diferente
   while not dtmaprev.qry.Eof do
   begin
      
      if not FazQuery(QryAux,
                         'SELECT ULTMESPREPARO FROM BENEFBFCIARIO BF WHERE '+ 
                         '     BF.IDPESSJUR    = '+IntToStr(piIdPessJur)                          +
                         ' AND BF.IDTITULAR    = '+IntToStr(piIdTitular)                          +
                         ' AND BF.IDPESSOA     = '+IntToStr(piIdPessoa)                           +
                         ' AND BF.SEQPROPOSTA  = '+IntToStr(piSeqProposta)                        +
                         ' AND BF.IDBENEFICIO  = '+dtmaprev.qry.FieldByName('IDBENEFORIGEM').AsString)
      then begin
        dtmaprev.qry.next;
        Continue;
      end;
      


      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.Add(' SELECT NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDBENEFICIO,                        '+
                       '        MAX(VALORTOTAL) AS VALORTOTAL,                                              '+
                       '        SUM(DECODE(FLGDEVOLUCAO, 1, -VALORPREV,     VALORPREV))     AS VALORPREV,    '+
                       '        SUM(DECODE(FLGDEVOLUCAO, 1, -VLBENEFPGTO,   VLBENEFPGTO))   AS VLBENEFPGTO,  '+
                       '        SUM(DECODE(FLGDEVOLUCAO, 1, -VALORINTEGRAL, VALORINTEGRAL)) AS VALORINTEGRAL '+
                       ' FROM   HSTBENEFBFCIARIO H                                                          '+
                       ' WHERE  H.IDBENEFICIO      = '+dtmaprev.qry.FieldByName('IDBENEFORIGEM').AsString             +
                       ' AND    H.IDTITULAR        = '+IntToStr(piIdTitular)                                 +
                       ' AND    H.IDPESSOA         = '+IntToStr(piIdPessoa)                                  +
                       ' AND    H.MESREFERENCIA    = '''+dtmaprev.qry.FieldByName('MESREFERENCIA').AsString+''''      +
                       ' AND    H.IDPLANOPREV      = '+IntToStr(piIdPlanoOrigem)                              +
                       ' GROUP BY NUMEROPROCESSO,IDPESSJUR, IDPLANOPREV, IDBENEFICIO                                       ');
      qryGrava.Open;


      if ( (qryGrava.FieldByName('VALORPREV').AsFloat <= 0)
          and (qrygrava.recordcount > 0 )) 
          or (qrygrava.recordcount = 0 ) 

          
          or (
               ( dtmaprev.qry.FieldByName('MESREFERENCIA').AsString > qryaux.fieldbyname('ULTMESPREPARO').AsString ) and 
               ( Pos( '/13', dtmaprev.qry.FieldByName('MESREFERENCIA').AsString ) <= 0 )
             )
          
      then
      begin
         dtmaprev.qry.next;
         continue;
      end;

      if not FazQuery(QryAux,
                         'SELECT 1 FROM BENEFBFCIARIO BF WHERE '+
                         '     BF.IDPESSJUR    = '+IntToStr(piIdPessJur)                          +
                         ' AND BF.IDTITULAR    = '+IntToStr(piIdTitular)                          +
                         ' AND BF.IDPESSOA     = '+IntToStr(piIdPessoa)                           +
                         ' AND BF.SEQPROPOSTA  = '+IntToStr(piSeqProposta)                        +
                         ' AND BF.IDBENEFICIO  = '+dtmaprev.qry.FieldByName('IDBENEFORIGEM').AsString)
      then begin
        dtmaprev.qry.next;
        Continue;
      end;
      

      dValorPago   := qryGrava.FieldByName('VALORPREV').AsFloat;
      dValorAPagar := dtmaprev.qry.FieldbyName('VALORPREV').AsFloat;

      if dValorPago > dValorAPagar
      then begin
         iFlgDevolucao := 1;
         dDiferenca    := dValorPago - dValorAPagar;
      end
      else begin
         iFlgDevolucao := 0;
         dDiferenca    := dValorAPagar - dValorPago;
      end;

      if dDiferenca <= 0.01
      then begin
         dtmaprev.qry.Next;
         continue;
      end;

      

      sAnoMesRef := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
      
      dIndice := 1;
      if Trim(dblkpcmbRegraParcela.Text) <> '' then begin
        sDataRefInd  := '01/'+Copy(sAnoMesRef,6,2)+'/'+Copy(sAnoMesRef,1,4);
        sSQLRegraCorrecao := 'SELECT '+OraNumero(FloatToStr(dIndice))+ ' AS INDICE, '+
                                       IntToStr(piIdPessoa)          + ' AS IDPESSOA, '+
                                       QuotedStr(sDataRefInd)        + ' AS DATAREF, '+
                                       QuotedStr('1')                + ' AS FLGMIGRACAO, '+
                                       QuotedStr(sAnoMesRefAnt)      + ' AS ANOMESREFANT, '+
                                       QuotedStr(sAnoMesRef)         + ' AS ANOMESREF, '+
                                       QuotedStr(Copy(dtNovaDib.text,7,4)+'/'+Copy(dtNovaDib.text,4,2))+ ' AS ANOMESACERTOINI, '+
                                       QuotedStr(sAnoMesLote)        + ' AS ANOMESACERTOFIM  '+
                             'FROM DUAL ';

         sIndiceCorrecao := RegraNumerica(dblkpcmbRegraParcela.LookupValue,
                                          sSQLRegraCorrecao, bErro, iIdCaluloAtualizacao);
         dIndice := StrToFloat(ClienteNumero(sIndiceCorrecao));
         if dIndice <= 0 then dIndice := 1;
      end;
      
      iSeqBeneficio := PegaSeqBeneficio(qryAux,
                                        piIdPessJur,   piIdTitular,
                                        dtmaprev.qry.FieldByName('IDPLANOPREV').AsInteger,
                                        piIdPessoa,
                                        piSeqProposta,
                                        dtmaprev.qry.FieldByName('NUMEROPROCESSO').AsInteger,
                                        dtmaprev.qry.FieldByName('IDBENEFICIO').AsInteger,
                                        prmIdMotivoAcertoMigracaoPlano,
                                        sAnoMesLote,
                                        dtmaprev.qry.FieldByName('MESREFERENCIA').AsString);
      
      if not InsereHstBenefBfciario ( qryGrava,
                                      iSeqBeneficio, 
                                      dtmaprev.qry.FieldByName('NUMEROPROCESSO').AsInteger,
                                      dtmaprev.qry.FieldByName('IDBENEFICIO').AsInteger,
                                      dtmaprev.qry.FieldByName('IDPESSJUR').AsInteger,
                                      dtmaprev.qry.FieldByName('IDPLANOPREV').AsInteger,
                                      piIdTitular,
                                      piSeqProposta,
                                      piIdPessoa,
                                      -1,
                                      prmIdMotivoAcertoMigracaoPlano,
                                      -1, 
                                      dtmaprev.qry.FieldByName('MESREFERENCIA').AsString,
                                      sAnoMesLote,
                                      '','','', 
                                      (dDiferenca*dIndice), 
                                      (dDiferenca*dIndice), 
                                      dtmaprev.qry.FieldByName('VALORINTEGRAL').AsFloat,
                                      0, 
                                      0, 
                                      1, 
                                      iFlgDevolucao,
                                      iIdLote,
                                      sMsgErro,
                                      sDataFolha 
                                      )

      then
      begin
         GravaErro('Erro ao inserir acerto de benefício no histórico.');
         Exit;
      end;

      sAnoMesRefAnt  := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
      dtmaprev.qry.Next;
   end;


   // **************************************************************************
   // ****************************  CONTRIBUICOES ******************************
   // **************************************************************************
   // Abrir query com novas contribuicoes, preparadas pelo evento de transferencia
   // de plano somando as contribuicoes por pagador, já que não existe de-para de
   // contribuicoes
   with dtmaprev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT H.MESCOBRANCA, H.MESREFERENCIA, H.IDPESSOA, CP.FLGPAGADOR,  H.IDPESSJUR, H.IDPLANOPREV,    '+
              '        MAX(H.IDCONTRIBUICAO) AS IDCONTRIBUICAO,                                        '+
              '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORESPERADO,H.VALORESPERADO)) AS VALORESPERADO,'+
              '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO,H.VALORRECEBIDO)) AS VALORRECEBIDO '+
              ' FROM   CONTPREV CP, HSTCONTRIBPREV H                                                   '+
              ' WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)+
              ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)+
              ' AND    H.IDPESSOA =   '+IntToStr(piIdPessoa)+
              ' AND    H.SEQPROPOSTA = '+IntToStr(piSeqProposta)+
              ' AND    H.MESREFERENCIA    >= '''+Copy(dtNovaDib.text,7,4)+'/'+Copy(dtNovaDib.text,4,2)+''' '+
              ' AND    H.FLGSITFUNDACAO  =  '''+sFlgInternoDepois+'''  '+
              ' AND   CP.IDPLANOPREV    = H.IDPLANOPREV                                                '+
              ' AND   CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                                             '+
              ' GROUP BY H.MESCOBRANCA, H.MESREFERENCIA, H.IDPESSOA, CP.FLGPAGADOR ,  H.IDPESSJUR, H.IDPLANOPREV   '+
              ' ORDER BY H.MESCOBRANCA, H.MESREFERENCIA                                                ');
      Open;
   end;

   sAnoMesRefAnt := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
   // Para cada linha encontrada, verificar se o beneficio associado no DE-PARA teve
   // valor calculado diferente
   while not dtmaprev.qry.Eof do
   begin
      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.Add(' SELECT H.IDPESSJUR, H.IDPLANOPREV,                                                     '+
                       '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORESPERADO,H.VALORESPERADO)) AS VALORESPERADO,'+
                       '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO,H.VALORRECEBIDO)) AS VALORRECEBIDO '+
                       ' FROM   CONTPREV CP, HSTCONTRIBPREV H                                                   '+
                       ' WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)                                      +
                       ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoOrigem)                                  +
                       ' AND    H.IDPESSOA        = '+dtmaprev.qry.FieldByName('IDPESSOA').AsString              +
                       ' AND    H.MESREFERENCIA   = '''+dtmaprev.qry.FieldByName('MESREFERENCIA').AsString+''' '+
                       ' AND    H.FLGSITFUNDACAO  =  '''+sFlgInternoAntes+'''  '+
                       ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV                                               '+
                       ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                                            '+
                       ' AND    CP.FLGPAGADOR     = '''+dtmaprev.qry.FieldByName('FLGPAGADOR').AsString+'''              '+
                       ' GROUP BY H.IDPESSJUR, H.IDPLANOPREV                                                    ');
      qryGrava.Open;


      if qryGrava.FieldByName('VALORESPERADO').AsFloat <= 0 then
      begin
         sAnoMesRefAnt  := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
         dtmaprev.qry.next;
         continue;
      end;

      dValorCobrado:= qryGrava.FieldByName('VALORESPERADO').AsFloat;
      dValorACobrar:= dtmaprev.qry.FieldbyName('VALORESPERADO').AsFloat;

      if dValorCobrado > dValorACobrar
      then begin
         iFlgDevolucao := 1;
         dDiferenca    := dValorCobrado - dValorACobrar;
      end
      else begin
         iFlgDevolucao := 0;
         dDiferenca    := dValorACobrar - dValorCobrado;
      end;

      if dDiferenca <= 0.01
      then begin
         dtmaprev.qry.Next;
         continue;
      end;

      
      dIndice := 1;
      if Trim(dblkpcmbRegraParcela.Text) <> '' then begin
        sSQLRegraCorrecao := 'SELECT '+OraNumero(FloatToStr(dIndice))+ ' AS INDICE, '+
                                       IntToStr(piIdPessoa)          + ' AS IDPESSOA, '+
                                       QuotedStr(sDataRefInd)        + ' AS DATAREF, '+
                                       QuotedStr('1')                + ' AS FLGMIGRACAO, '+
                                       QuotedStr(sAnoMesRefAnt)      + ' AS ANOMESREFANT, '+
                                       QuotedStr(dtmaprev.qry.FieldByName('MESREFERENCIA').AsString)       + ' AS ANOMESREF, '+
                                       QuotedStr(Copy(dtNovaDib.text,7,4)+'/'+Copy(dtNovaDib.text,4,2))+ ' AS ANOMESACERTOINI, '+
                                       QuotedStr(sAnoMesLote)   + ' AS ANOMESACERTOFIM  '+
                             'FROM DUAL ';

         sIndiceCorrecao := RegraNumerica(dblkpcmbRegraParcela.LookupValue,
                                          sSQLRegraCorrecao, bErro, iIdCaluloAtualizacao);
         dIndice := StrToFloat(ClienteNumero(sIndiceCorrecao));
         if dIndice <= 0 then dIndice := 1;
      end;
      

      if InsereHstContribPREV( qryGrava,
                               dtmaprev.qry.FieldByName('IDPESSOA').AsInteger,
                               piSeqProposta,
                               dtmaprev.qry.FieldByName('IDPESSJUR').AsInteger,
                               dtmaprev.qry.FieldByName('IDPLANOPREV').AsInteger,
                               dtmaprev.qry.FieldByName('IDCONTRIBUICAO').AsInteger,
                               prmIdMotivoAcertoMigracaoPlano,
                               dtmaprev.qry.FieldByName('MESREFERENCIA').AsString,
                               sAnoMesLote,
                               -1,
                               sDataFolha,
                               '',                   
                               (dDiferenca*dIndice), 
                               (dDiferenca*dIndice), 
                               0,                    
                               -1,                   
                               1,                    
                               0,                   
                               0,                   
                               0,                   
                               '',                  
                               '',                  
                               'AS',
                               0,                   
                               0,                   
                               iIdLote,
                               'F',
                               0,                   
                               iFlgDevolucao,
                               1,                   
                               1 ) < 0              
      then
      begin
         GravaErro('Erro inserir acerto de contribuições no histórico.');
         Exit;
      end;

      sAnoMesRefAnt  := dtmaprev.qry.FieldByName('MESREFERENCIA').AsString;
      dtmaprev.qry.Next;
   end;

   Result   := True;
end;


function TFrmEventoTransfPlano.DesfazTransfPlano( piIdPessJur ,
                            piIdTitular       ,
                            piIdPessoa        ,
                            piSeqProposta     : longint ) : boolean;
var sPlanilhasExcluir : string;
    iIdEventosPrev    : longint;
    iIdEventoGerador  : longint;
    sDataEvento       : string;
    i                 : integer;
    iPlnCodigo        : longint;
    sNumerosProcesso  : string;
    iIdSitPlanoPrev   : longint;

    iIdPlanoOrigem, iIdPlanoDestino    : Integer;

    sIdNucleoFamiliar : String;
begin
   Result := False;

   if  piIdPessoa = piIdTitular then
   begin

      //verifica se o último evento da pessoa á a tyransferência de planos
      //caso seja, deixa desfazer
      //caso não seja, avisa. Os outros eventos devem ser desfeitos primeiro
      //neste último caso, o mais certo seria uma transferência contrária
      qryaux.close;
      qryaux.sql.text := ' SELECT MAX(IDEVENTOSPREV) IDEVENTOSPREV , IDEVENTOGERADOR, DATAEFETIVADO, IDSITPLANOATUAL, IDPLANOPREV '+
                         ' FROM EVENTOSPREV  '+
                         ' WHERE IDPESSJUR = '+IntToStr(piIdPessJur)+' '+
                         ' AND  IDPESSOA = '+IntToStr(piIdPessoa)+' '+
                         ' GROUP BY IDEVENTOGERADOR, DATAEFETIVADO, IDSITPLANOATUAL, IDPLANOPREV '+
                         ' ORDER BY IDEVENTOSPREV  DESC ';
      qryaux.open;

      if qryaux.isempty then
      begin
         GravaErro('O participante não têm eventos registrados.');
         Exit;
      end;

      if qryaux.fieldbyname('IDEVENTOGERADOR').AsString <> sIdEventoGerador then
      begin
         GravaErro('O participante não tem um evento de transferência de plano como último evento realizado.');
         Exit;
      end;


      if (not qryaux.IsEmpty) and (qryaux.FieldByName('IDEVENTOSPREV').AsInteger > 0)
      then begin
         iIdEventosPrev   := qryaux.FieldByName('IDEVENTOSPREV').AsInteger;
         iIdSitPlanoPrev  := qryaux.FieldByName('IDSITPLANOATUAL').AsInteger;
         sDataEvento      := qryaux.FieldByName('DATAEFETIVADO').AsString;
         iIdPlanoOrigem   := qryaux.FieldByName('IDPLANOPREV').AsInteger;
      end;


      //pega plano destino
      qryaux.close;
      qryaux.sql.text := ' SELECT IDPLANOPREV '+
                         ' FROM PARTPREVPLAN  '+
                         ' WHERE IDPESSJUR = '+IntToStr(piIdPessJur)+' '+
                         ' AND  IDPESSOA = '+IntToStr(piIdPessoa)+' '+
                         ' AND  FLGDESATIVADO =0 '+
                         ' AND IDPLANOPREV <> '+IntToStr(iIdPlanoOrigem)+' ';
      qryaux.open;

      if qryaux.isempty then
      begin
         GravaErro('Plano destino não encontrado.');
         Exit;
      end;

      iIdPlanoDestino := qryaux.FieldByName('IDPLANOPREV').AsInteger;
   end
   else
   begin
      iIdEventosPrev := 0;

      qryaux.close;
      qryaux.sql.text := ' SELECT DISTINCT(IDPLANOPREV) IDPLANOPREV '+
                         ' FROM BENEFBFCIARIO  '+
                         ' WHERE  IDTITULAR      = '+IntToStr(piIdTitular)        +
                         ' AND  IDPESSOA       = '+IntToStr(piIdPessoa)         +
                         ' AND  IDPESSJUR      = '+IntToStr(piIdPessJur)        +
                         ' AND  IDSITBENEFICIO = 3 '+
                         ' AND  EXISTS (SELECT 1 FROM BENEFBFCIARIO B '+
                         '              WHERE B.IDTITULAR = BENEFBFCIARIO.IDTITULAR  '+
                         '              AND B.IDPESSOA = BENEFBFCIARIO.IDPESSOA '+
                         '              AND B.IDPESSJUR = BENEFBFCIARIO.IDPESSJUR '+
                         '              AND B.IDPLANOPREV <> BENEFBFCIARIO.IDPLANOPREV  ) ';
      qryaux.open;


      if (qryaux.isempty) or (qryaux.recordcount >= 2) then
      begin
         //ou está vazio por que não tem benefícios encerrados, o que quer dizer que não
         //houve transf. com o benef. já em benefício. A tranf não pode ser desfeita.
         //ou tem 2 ou mais planos com benef. encerrado, o que quer dizer que
         //após a transf. já houve outrro evento de benef.
         GravaErro('O Beneficiário não tem um evento de transferência de plano como último evento realizado.');
         Exit;
      end;

      iIdPlanoOrigem   := qryaux.FieldByName('IDPLANOPREV').AsInteger;



      qryaux.close;
      qryaux.sql.text := ' SELECT DISTINCT(IDPLANOPREV) IDPLANOPREV , TRUNC(DATACONCESSAO) DATACONCESSAO '+
                         ' FROM BENEFBFCIARIO  '+
                         ' WHERE   IDTITULAR      = '+IntToStr(piIdTitular)        +
                         ' AND  IDPESSOA       = '+IntToStr(piIdPessoa)         +
                         ' AND  IDPESSJUR      = '+IntToStr(piIdPessJur)        +
                         ' AND  IDPLANOPREV   <> '+IntToStr(iIdPlanoOrigem)+' '+
                         ' AND  IDSITBENEFICIO IN (1,2) ';
      qryaux.open;


      if qryaux.IsEmpty then
      begin
         GravaErro('O Beneficiário não tem um evento de transferência de plano como último evento realizado.');
         Exit;
      end;

      iIdSitPlanoPrev  := 0;
      sDataEvento      := qryaux.FieldByName('DATACONCESSAO').AsString;
      iIdPlanoDestino  := qryaux.FieldByName('IDPLANOPREV').AsInteger;

   end;


   



   // Operacoes do FAZER TRANSFERENCIA DE PLANO
   // 0. Desativa e atualiza sit. no pl. origem - PARTPREVPLAN
   // 1. Insere participante no plano destino   - PARTPREVPLAN
   // 2. Insere evento no plano destino         - EVENTOSPREV
   // 3. Associa reservas no plano destino      - RESERVAPART
   // 4. Se for participante, associa contrib.  - CONTRIBPREVPARTP
   // 5. Se for assistido, insere beneficios    - BFCIARIOTITPLAN, PROCESSOBENEF, BENEFBFCIARIO
   // 6. Prepara contribuicoes e beneficios     - HSTBENEFBFCIARIO, HSTCONTRIBPREV
   // 7. Executa padrao de movimet. de reserva  - RESERVAPART, HISTMOVRESERVA

   // *******************************************************************************
   // Para desfazer a transferencia de plano, excluir lançamentos de traz para frente
   // *******************************************************************************
   // 7. DESFAZER - Executa padrao de movimet. de reserva - RESERVAPART, HISTMOVRESERVA


   if not DESFAZPADRAOMOVRESERVA( piIdPessJur,
                                  iIdPlanoOrigem,
                                  piIdPessoa,
                                  piSeqProposta,
                                  -1,
                                  StrToInt(sIdEventoGerador),
                                  sDataEvento,
                                  -1,
                                  sPlanilhasExcluir )
   then
   begin
      GravaErro('Erro ao desfazer a movimentação de reservas.');
      Exit;
   end;

   // Exclui Lancamentos Contabeis da movimentacao de reservas
   // Caso existam planilhas a excluir
   if Trim(sPlanilhasExcluir) <> ''
   then begin
     sPlanilhasExcluir := Copy(sPlanilhasExcluir, 1, (Length(sPlanilhasExcluir)-1));

     i := Pos(',', sPlanilhasExcluir);
     if i <= 0
     then i := Length(sPlanilhasExcluir)
     else i := (i-1);

     Repeat
       iPlnCodigo := StrToInt(OraNumero(Copy(sPlanilhasExcluir, 1, I)));

       Try
         if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      
                                                  iPlnCodigo,                             
                                                  Sistema.IdModulo,                       
                                                  0,                                      
                                                  Sistema.UsaPlanoPatro,                  
                                                  True                                    
                                                 )
         then begin
           GravaErro('Erro ao tentar excluir planilhas contábeis geradas pela movimentação de reservas.');
           Exit;
         end;

         
       Except
          GravaErro('Erro ao tentar excluir planilhas contábeis geradas pela movimentação de reservas.');
          Exit;
       End;

       // Atualiza string das planilhas
       sPlanilhasExcluir := Copy(sPlanilhasExcluir, i+1, Length(sPlanilhasExcluir));
       i := Pos(',', sPlanilhasExcluir);
       if i <= 0
       Then i := Length(sPlanilhasExcluir);

     Until Trim(sPlanilhasExcluir) = '';
   End; 


   //desfaz MOVRESERVATEMP no caso de assistidos
   try
      with dtmAPrev.qryTransfPlano do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT VLRORIGINAL , IDTIPORESERVA     '+
                 ' FROM   MOVRESERVATEMP                   '+
                 ' WHERE  IDTITULAR      = '+IntToStr(piIdTitular)                        +
                 ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)                         +
                 ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)                        +
                 ' AND    IDPLANOPREV    = '+IntToStr(iIdPlanoDestino)                      +
                 ' AND    IDBENEFICIO  IS NOT NULL                      ');
         Open;


         while not EOF do
         begin
            qrygrava.close;
            qrygrava.sql.text := ' UPDATE RESERVAPART SET VALORRESERVA  = '+oranumero(fieldbyname('VLRORIGINAL').AsString)+' , FLGATIVO = 1 '+
                                 ' WHERE  IDPESSOA       = '+IntToStr(piIdPessoa)       +
                                 ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)      +
                                 ' AND    IDPLANOPREV    = '+IntToStr(iIdPlanoOrigem)    +
                                 ' AND    IDTIPORESERVA  = '+fieldbyname('IDTIPORESERVA').AsString+' ';
            qrygrava.execsql;

            Next;
         end;
      end;

   except
      GravaErro('Erro ao desfazer a movimentação de reservas da concessão.');
      Exit;
   end;




   // 6. DESFAZER - Prepara contribuicoes e beneficios     - HSTBENEFBFCIARIO, HSTCONTRIBPREV
   with dtmAPrev.qryTransfPlano do
   begin
      sNumerosProcesso := '';
      Close;
      SQL.Clear;
      SQL.Add(' SELECT P.NUMEROPROCESSO, BF.IDBENEFICIO, B.NOME, BF.IDTPPAGTOBENEFIC     '+
              ' FROM   PROCESSOBENEF P,  BENEFBFCIARIO BF, BENEFICIO B                   '+
              ' WHERE  P.NUMEROPROCESSO  = BF.NUMEROPROCESSO                             '+
              ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)                        +
              ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)                         +
              ' AND    BF.IDPESSJUR      = '+IntToStr(piIdPessJur)                        +
              ' AND    BF.IDPLANOPREV    = '+IntToStr(iIdPlanoDestino)                   +
              ' AND    BF.IDBENEFICIO    = B.IDBENEFICIO                                 ');
      Open;

      if not IsEmpty
      then begin
         First;
         while not Eof do
         begin
            sNumerosProcesso := sNumerosProcesso+','+FieldByName('NUMEROPROCESSO').AsString;
            Next;
         end;

         sNumerosProcesso := Copy(sNumerosProcesso,2,length(sNumerosProcesso)-1);
      end;

      if Trim(sNumerosProcesso) <> ''
      then begin
         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM HSTATRASOBENEF                          '+
                 ' WHERE  NUMEROPROCESSO IN ('+sNumerosProcesso +')    '+
                 ' AND    IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)   +
                 ' AND    IDTITULAR     = '+IntToStr(piIdTitular)       +
                 ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)        +
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)     );
         try
            ExecSQL;
         except
            GravaErro('Erro ao apagar alteradoes de benefícios.');
            Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM HSTBENEFBFCIARIO                        '+
                 ' WHERE  NUMEROPROCESSO IN ('+sNumerosProcesso +')    '+
                 ' AND    IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)   +
                 ' AND    IDTITULAR     = '+IntToStr(piIdTitular)       +
                 ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)        +
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)     );
         try
            ExecSQL;
         except
         //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          on e:Exception do
          begin
            TratarErro(e.Message);
            GravaErro('Erro ao apagar histórico de benefícios.');
            Exit;
         end;
          //Brunno Mattos - KTN 767861 - SOL 132659 Fim
            
         end;
      end;
      // --
      Close;
      SQL.Clear;
      if piIdTitular = piIdPessoa
      then begin
         SQL.Add(' DELETE FROM HSTATRASOCONTRIB HA                                        '+
                 ' WHERE  EXISTS  ( SELECT 1                                              '+
                 '                  FROM   HSTCONTRIBPREV H                               '+
                 '                  WHERE  H.IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 '                  AND    H.IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)  +
                 '                  AND    H.IDPESSOA      = '+IntToStr(piIdTitular)       +
                 '                  AND    HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO           '+
                 '                  AND    HA.MESREFERENCIA  = H.MESREFERENCIA            '+
                 '                  AND    HA.MESCOBRANCA    = H.MESCOBRANCA             )');
      end
      else begin
         SQL.Add(' DELETE FROM HSTATRASOCONTRIB HA                                        '+
                 ' WHERE  EXISTS  ( SELECT 1                                              '+
                 '                  FROM   HSTCONTRIBPREV H                               '+
                 '                  WHERE  H.IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 '                  AND    H.IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)  +
                 '                  AND    EXISTS ( SELECT 1                                                               '+
                 '                                  FROM   BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CN    '+
                 '                                  WHERE  BTIT.IDPESSJUR       = '+IntToStr(piIdPessJur)                   +
                 '                                  AND    BTIT.IDPLANOPREV     = '+IntToStr(iIdPlanoDestino)              +
                 '                                  AND    BTIT.IDTITULAR       = '+IntToStr(piIdTitular)                   +
                 '                                  AND    BTIT.IDPESSOA        = '+IntToStr(piIdPessoa)                    +
                 '                                  AND    BTIT.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                 +
                 '                                  AND    N.IDNUCLEOFAMILIAR   = BTIT.IDNUCLEOFAMILIAR                    '+
                 '                                  AND    CN.IDNUCLEOFAMILIAR  = N.IDNUCLEOFAMILIAR                       '+
                 '                                  AND    H.IDPESSOA           = N.IDRESPNUCLEO                           '+
                 '                                  AND    H.IDCONTRIBUICAO     = CN.IDCONTRIBUICAO )                      '+
                 '                  AND    HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO           '+
                 '                  AND    HA.MESREFERENCIA  = H.MESREFERENCIA            '+
                 '                  AND    HA.MESCOBRANCA    = H.MESCOBRANCA             )');
      end;

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar alteradores de contribuições.');
         Exit;
      end;

      // --
      Close;
      SQL.Clear;
      if piIdTitular = piIdPessoa
      then begin
         SQL.Add(' DELETE FROM HSTCONTRIBPREV                          '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)  +
                 ' AND    IDPESSOA      = '+IntToStr(piIdTitular));

      end
      else begin
         SQL.Add(' DELETE FROM HSTCONTRIBPREV H                        '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)  +
                 ' AND    EXISTS ( SELECT 1                                                               '+
                 '                 FROM   BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CN    '+
                 '                 WHERE  BTIT.IDPESSJUR       = '+IntToStr(piIdPessJur)                   +
                 '                 AND    BTIT.IDPLANOPREV     = '+IntToStr(iIdPlanoDestino)              +
                 '                 AND    BTIT.IDTITULAR       = '+IntToStr(piIdTitular)                   +
                 '                 AND    BTIT.IDPESSOA        = '+IntToStr(piIdPessoa)                    +
                 '                 AND    BTIT.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                 +
                 '                 AND    N.IDNUCLEOFAMILIAR   = BTIT.IDNUCLEOFAMILIAR                    '+
                 '                 AND    CN.IDNUCLEOFAMILIAR  = N.IDNUCLEOFAMILIAR                       '+
                 '                 AND    H.IDPESSOA           = N.IDRESPNUCLEO                           '+
                 '                 AND    H.IDCONTRIBUICAO     = CN.IDCONTRIBUICAO )                      ');
      end;

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar histórico de contribuições.');
         Exit;
      end;
   end; 


   // 5. Se for assistido, insere beneficios    - BFCIARIOTITPLAN, PROCESSOBENEF, BENEFBFCIARIO

   
   with dtmAPrev.qryTransfPlano do
   begin

     Close;
     SQL.Clear;
     SQL.Add(' DELETE FROM BENEFPLANOPART  '+
             ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
             ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
             ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
             ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

     try
        ExecSQL;
     except
        GravaErro('Erro ao apagar beneficiário.');
        Exit;
     end;

   End;
   

  

   If ( Trim(sNumerosProcesso) <> '' ) Then Begin

     with dtmAPrev.qryTransfPlano do
     begin


        // Reativar beneficios do plano de origem
        Close;
        SQL.Clear;
        SQL.Add(' UPDATE PROCESSOBENEF P SET IDSITPROCESSO = 1                                       '+
                ' WHERE  EXISTS ( SELECT 1 FROM BENEFBFCIARIO BF                                     '+
                '                 WHERE  BF.IDPESSJUR     = '+IntToStr(piIdPessJur)                   +
                '                 AND    BF.IDPLANOPREV   = '+IntToStr(iIdPlanoOrigem)                +
                '                 AND    BF.IDTITULAR     = '+IntToStr(piIdTitular)                   +
                '                 AND    BF.IDPESSOA      = '+IntToStr(piIdPessoa)                    +
                '                 AND    BF.SEQPROPOSTA   = '+IntToStr(piSeqProposta)                 +
                '                 AND    BF.IDSITBENEFICIO = 3                                       '+
                
               
                '                 AND    BF.DATAFINAL = TO_DATE('''+DateToStr(StrToDate(sDataEvento)-1)+''',''DD/MM/YYYY'')'+

                '                 AND    P.NUMEROPROCESSO = BF.NUMEROPROCESSO                        '+

                
                ' AND IDBENEFICIO IN(SELECT IDBENEFORIGEM '+
                ' FROM BENEFTRANSFPLANO '+
                ' WHERE IDPLANOORIGEM = '+IntToStr(iIdPlanoOrigem)+' AND '+
                ' EXISTS (SELECT 1 '+
                ' FROM BENEFBFCIARIO '+
                ' WHERE NUMEROPROCESSO IN ('+sNumerosProcesso+') AND '+
                ' IDPLANOPREV = IDPLANODEST AND '+
                ' IDBENEFICIO = IDBENEFDEST ) )) ');
                

        try
           ExecSQL;
        except
           GravaErro('Erro ao reativar participante no plano origem.');
           Exit;
        end;

        Close;
        SQL.Clear;
        SQL.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 1, DATAFINAL = NULL '+
                ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoOrigem)+
                ' AND    IDTITULAR     = '+IntToStr(piIdTitular)+
                ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)+
                ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)+

                
                ' AND IDBENEFICIO IN(SELECT IDBENEFORIGEM '+
                ' FROM BENEFTRANSFPLANO '+
                ' WHERE IDPLANOORIGEM = '+IntToStr(iIdPlanoOrigem)+' AND '+
                ' EXISTS (SELECT 1 '+
                ' FROM BENEFBFCIARIO '+
                ' WHERE NUMEROPROCESSO IN ('+sNumerosProcesso+') AND '+
                ' IDPLANOPREV = IDPLANODEST AND '+
                ' IDBENEFICIO = IDBENEFDEST ) )');
                


        try
           ExecSQL;
        except
           GravaErro('Erro ao reativar beneficiários nos benefícios de origem.');
           Exit;
        end;


        if not DesfazRequerimentos(dtmAPrev.qryTransfPlano,sNumerosProcesso)
        then
        begin
           GravaErro('Erro ao desfazer requerimentos de benefícios.');
           Exit;
        end;

        
        Close;
        SQL.Clear;
        SQL.Add(' DELETE BENEFBFCIARIO  '+
                ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
                ' AND    IDTITULAR     = '+IntToStr(piIdTitular)+
                ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)+
                ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

        try
           ExecSQL;
        except
           GravaErro('Erro ao apagar beneficiário.');
           Exit;
        end;
        


        // Apagar bfciariotitplan no plano destino
        Close;
        SQL.Clear;
        SQL.Add(' DELETE FROM BFCIARIOTITPLAN  '+
                ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
                ' AND    IDTITULAR     = '+IntToStr(piIdTitular)+
                ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

        try
           ExecSQL;
        except
           GravaErro('Erro ao apagar beneficiário.');
           Exit;
        end;


     end;

   End; 


   // 4. Se for participante, associa contrib.  - CONTRIBPREVPARTP
   if piIdTitular = piIdPessoa
   then begin
      with dtmAPrev.qryTransfPlano do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM CONTRIBPREVPARTP '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                 ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
                 ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

         try
            ExecSQL;
         except
            GravaErro('Erro ao apagar relação de contribuições.');
            Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1, DATAFINAL = NULL '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)              +
                 ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoOrigem)          +
                 ' AND    IDPESSOA      = '+IntToStr(piIdTitular)              +
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)            +
                 ' AND    FLGCOBRA      = 0                                   '+
                 ' AND    TO_CHAR(DATAFINAL,''DD/MM/YYYY'') = '''+DateToStr(StrToDate(sDataEvento)-1)+'''');
         try
            ExecSQL;
         except
            GravaErro('Erro ao reativar contribuições do plano origem.');
            Exit;
         end;
      end;
   end
   else
   begin


      with dtmAPrev.qryTransfPlano do
      begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT DISTINCT IDNUCLEOFAMILIAR '+
                 ' FROM   BFCIARIOTITPLAN      '+
                 ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur) +
                 ' AND    IDPLANOPREV = '+IntToStr(iIdPlanoDestino) +
                 ' AND    IDPESSOA    = '+IntToStr(piIdPessoa) +
                 ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta) );
         Open;

         if not isempty then
         begin

            sIdNucleoFamiliar := fieldbyname('IDNUCLEOFAMILIAR').AsString;


            Close;
            SQL.Clear;
            SQL.Add(' DELETE FROM CONTRIBPREVNUCLEO '+
                    ' WHERE  IDNUCLEOFAMILIAR   = '+sIdNucleoFamiliar+
                    ' AND    IDCONTRIBUICAO  IN '+
                    '     ( SELECT CP.IDCONTRIBUICAO '+
                    '     FROM   CONTPREV CP, CONTPREVEVENTO CPE      '+
                    '     WHERE  CPE.IDPLANOPREV     = ' + IntToStr(iIdPlanoDestino)+
                    '     AND    CPE.IDEVENTOGERADOR = ' + sIdEventoGerador +
                    '     AND    CP.IDPLANOPREV      = CPE.IDPLANOPREV '+
                    '     AND    CP.IDCONTRIBUICAO   = CPE.IDCONTRIBUICAO) ');
            try
               ExecSQL;
            except
               GravaErro('Erro ao apagar relação de contribuições.');
               Exit;
            end;


            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET FLGCOBRA = 1, DATAFINAL = NULL '+
                    ' WHERE  IDNUCLEOFAMILIAR   = '+sIdNucleoFamiliar+' ');
            try
               ExecSQL;
            except
               GravaErro('Erro ao reativar contribuições do plano origem.');
               Exit;
            end;
         end;
      end; 
   end;




   // 3. Associa reservas no plano destino      - RESERVAPART


   
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE HISTMOVRESERVA  '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
              ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar beneficiário.');
         Exit;
      end;
   end;
   


   with dtmAPrev.qryTransfPlano do
   begin
      Close;
         SQL.Clear;
      SQL.Add(' DELETE FROM RESERVAPART '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
              ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar relação de reservas.');
         Exit;
      end;
   end;

   // 2. Insere evento no plano destino         - EVENTOSPREV
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM HSTCONTEVENTOSPR '+
              ' WHERE  IDEVENTOSPREV = '+IntToStr(iIdEventosPrev) );

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar relação de contribuições por eventos.');
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM EVENTOSPREV  '+
              ' WHERE  IDEVENTOSPREV = '+IntToStr(iIdEventosPrev) );

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar evento.');
         Exit;
      end;
   end;


   // 1. altera plano na tabela de empréstimo
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM PARTPREVPLAN '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
              ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar participante no plano destino.');
         Exit;
      end;
   end;




   // 1. Insere participante no plano destino - PARTPREVPLAN
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM PARTPREVPLAN '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoDestino)+
              ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         GravaErro('Erro ao apagar participante no plano destino.');
         Exit;
      end;
   end;

  // 0. Desativa e atualiza sit. no pl. origem - PARTPREVPLAN
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PARTPREVPLAN SET FLGDESATIVADO = 0, DATACANCELAMENTO = NULL, '+
              ' IDSITPLANOPREV = DECODE('+IntToStr(iIdSitPlanoPrev)+', 0, IDSITPLANOPREV, '+IntToStr(iIdSitPlanoPrev)+') '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(iIdPlanoOrigem)+ 
              ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         GravaErro('Erro ao reativar participante no plano de origem.');
         Exit;
      end;
   end;

   Result := True;
end;

procedure TFrmEventoTransfPlano.btnDesfazerClick(Sender: TObject);
var wLinhaMat, sMatAux : String;
begin
  inherited;

   if (Trim(sNome) = '') and (trim(edarqmat.Text) = '')
   then begin
      MsgDlg('Primeiro selecione o Participante ou o arquivo de matrículas.','Erro',mtError,[mbOk,mbHelp],0);
      bbtnProcurar.SetFocus;
      TiraIconeSql;
      Exit;
   end;


   bErro                 := False;
   iContTotal            := 0;
   iContErros            := 0;



   if dtmBasedados.dbBaseDados.InTransaction
   then dtmBasedados.dbBaseDados.Rollback;
   dtmBasedados.dbBaseDados.StartTransaction;

   frmAguarde.Mostra('Desfazendo transferências...');


   Try
      if trim(edarqmat.Text) <> '' then
      begin
         AssignFile(wArquivoMat,edarqmat.Text);
      end;
   except
      MsgDlg('Erro ao ler arquivo de seleção de matrículas.','Erro',mtError,[mbOk],0);
      frmAguarde.Apaga;
      Exit;
   end;


   bbtnConfirmar.enabled := False;
   btnDesfazer.enabled := false;


   with memErros.Lines do
   begin
      Clear;
      Add('--------------------------------------------------------------------');
      Add('           DESFAZER TRANSFERÊNCIA DE PLANO                          ');
      Add('              DEMONSTRATIVO DE ERROS        VERSÃO : '+Sistema.Versao);
      Add('USUÁRIO : '+Sistema.NomeUsuario+'             DATA : '+DateToStr(date));
      Add('--------------------------------------------------------------------');
      Add('');
   end;


   //caso seja em lote
   if trim(edarqmat.Text) <> '' then
   begin

      sNomeCorrente := '';
      sMatriculaCorrente := '';

      if (trim(sIdPessJurTransf) = '') or (trim(sIdPlanoOrigem) = '') then
      begin
         MsgDlg('Para migração em lote, a Patrocinadora e Plano devem ser selecionados.','Erro',mtError,[mbOk],0);
         dblkPatroDestino.setfocus;
         frmAguarde.Apaga;
         bbtnConfirmar.enabled := true;
         btnDesfazer.enabled := true;
         Exit;
      end;


      reset( wArquivoMat);


      //monta contador
      while not Eof(wArquivoMat) do
      begin
         Readln(wArquivoMat,wLinhaMat);

         inc(iContTotal);
      end;

      pgbar.visible := true;
      pgbar.Min := 0;
      pgbar.Position := 0;
      pgbar.Max := iContTotal;


      reset( wArquivoMat);


      while not Eof(wArquivoMat) do
      begin
         Readln(wArquivoMat,wLinhaMat);
         pgbar.Position := pgbar.Position + 1;

         sMatAux := Trim(wLinhaMat);

         sMatAux := Trim(wLinhaMat);
         sMatriculaCorrente := sMatAux;
         sNomeCorrente := '---//---';

         //procura pessoa pela matrícula
         qryaux.close;
         qryaux.sql.text := ' SELECT EL.IDPESSOA, EL.IDPESSOA IDTITULAR, PP.SEQPROPOSTA , P.NOME '+
                            ' FROM ELEGPATRO EL, PARTPREVPLAN PP, PESSOA P  '+
                            ' WHERE PP.IDPESSJUR = '+sIdPessJurTransf+' '+
                            ' AND PP.IDPLANOPREV = '+sIdPlanoOrigem+' '+
                            ' AND PP.IDPESSJUR = EL.IDPESSJUR '+
                            ' AND PP.IDPESSOA = EL.IDPESSOA '+
                            ' AND EL.MATRICULA = '''+sMatAux+'''   '+
                            ' AND P.IDPESSOA = EL.IDPESSOA ';
         qryaux.open;

         if qryaux.isempty then
         begin
            qryaux.close;
            qryaux.sql.text := ' SELECT BC.IDPESSOA , BC.IDTITULAR, BC.SEQPROPOSTA, P.NOME '+
                            '  FROM   BENEFBFCIARIO BC, DEPENTIT DP, PESSOA P  '+
                            '  WHERE  BC.IDPESSJUR = '+sIdPessjurTransf+' '+
                            '  AND    BC.IDPLANOPREV = '+sIdPlanoOrigem+' '+
                            '  AND    DP.IDPESSOA = BC.IDPESSOA '+
                            '  AND    DP.IDTITULAR = BC.IDTITULAR '+
                            '  AND    DP.MATRICULA = '''+sMatAux+''' '+
                            
                            '  AND    P.IDPESSOA = BC.IDPESSOA ';
            qryaux.open;

            if qryaux.isempty then
            begin
               GravaErro('Matrícula não encontrada.');
               bErro := true;
               inc(iContErros);
               continue;
            end;

         end;


         sIdTitularTransf := qryaux.fieldbyname('IDTITULAR').AsString;
         sIdPessoaTransf  := qryaux.fieldbyname('IDPESSOA').AsString;
         sSeqPropostaTransf  := qryaux.fieldbyname('SEQPROPOSTA').AsString;


         sNomeCorrente := qryaux.fieldbyname('NOME').AsString;
         sMatriculaCorrente := sMatAux;


         if not DesfazTransfPlano(StrToInt(sIdPessJurTransf),
                      StrToInt(sIdTitularTransf),
                      StrToInt(sIdPessoaTransf),
                      StrToInt(sSeqPropostaTransf))
         then
         begin
            bErro := true;
            inc(iContErros);
         end;

      end;
   end
   else  //caso não seja em lote
   begin



      if not DesfazTransfPlano(StrToInt(sIdPessJurTransf),
                         StrToInt(sIdTitularTransf),
                         StrToInt(sIdPessoaTransf),
                         StrToInt(sSeqPropostaTransf))
      then bErro := True;

   end;



   frmAguarde.Apaga;
   pgbar.visible := false;


   if not bErro then
   begin
      MsgDlg('Desfazer efetuado com sucesso. A operação pode ser efetivada após a verificação do demonstrativo.','Informação',mtInformation,[mbOk],0);
      btnEfetivar.enabled := true;
      bbtnCancelar.enabled := true;
   end
   else if  berro and bIndividual then
   begin
      MsgDlg('Erro ao desfazer transferência. Operação Cancelada.','Erro',mtError,[mbOk],0);
      dtmBasedados.dbBaseDados.Rollback;
      bbtnConfirmar.enabled := true;
      btnDesfazer.enabled := true;
      btnEfetivar.enabled := false;
      bbtnCancelar.enabled := false;
      MostraDemonstrativo;
   end
   else if berro and (not bindividual) then
   begin
      MsgDlg('Houveram erros em '+inttostr(iContErros)+' das '+inttostr(iContTotal)+' tranferências. Todas as demais podem ser efetivadas após verfiicação do desmonstrativo. Não recomendado.','Erro',mtError,[mbOk],0);
      btnEfetivar.enabled := True;
      bbtnCancelar.enabled := True;
      MostraDemonstrativo;
   end;


end;


function TFrmEventoTransfPlano.GravaHSTCONTEVENTOSPRTransf(piIdPessJur,
                                piIdPlanoOrigem,
                                piIdPlanoDestino,
                                piIdTitular,
                                piIdPessoa,
                                piSeqProposta : longint ;
                                sIdEventosPrev, sIdEventoGerador : String  ): Boolean;
var
  iIdAssociacao: Integer;
  sDataInscFund, sMesRef,
  sValorBaseOrigem,
  sSQL: string;
  bErro: Boolean;

  sUltMesPreparo,
  sPartResgPoupanca,
  sAssoc1Op1,          sAssoc2Op1,         sAssoc3Op1,
  sAssoc1Op2,          sAssoc2Op2,         sAssoc3Op2,
  sAssoc1Op3,          sAssoc2Op3,         sAssoc3Op3 : string;
  bAssocia,
  bPartResgPoupanca : boolean;

  sDataAux, sSalPart : string;

  dValorBase1 : double; 
  dValorBase2 : double; 
  dValorBase3 : double; 
begin
   Result := False;
   iIdAssociacao := 0;

   // Grava HSTCONTEVENTOSPR as contribuições que serão suspensas
   qryGrava.Close;
   qryGrava.SQL.Clear;
   qryGrava.SQL.Add('INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, '+
                     ' IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA, DATAINICIO, DATAFINAL)  '+
                     'SELECT '+sIdEventosPrev+' , ROWNUM, '+sIdEventoGerador +                  ','+
                     ' CPP.IDPLANOPREV, CPP.IDCONTRIBUICAO, ''F'',0,      '+
                     ' CPP.DATAINICIO, CPP.DATAFINAL '+
                     ' FROM CONTRIBPREVPARTP CPP                       ' +
                     ' WHERE SEQPROPOSTA = ' + IntToStr(piSeqProposta)+
                     ' AND   IDPESSJUR   = ' + IntToStr(piIdPessJur)   +
                     ' AND   IDPLANOPREV = ' + IntToStr(piIdPlanoOrigem) +
                     ' AND   IDPESSOA    = ' + IntToStr(piIdPessoa)    +
                     ' AND   FLGCOBRA    = 1                        ' );
   try
      qryGrava.ExecSQL;
      iIdAssociacao := qryGrava.RowsAffected;
   except
      Exit;
   end;


  // Grava HSTCONTEVENTOSPR as novas contribuições que serão associadas
  // Filtra todas as novas contribuições que deverão ser associadas
  sDataInscFund := CalcDataInscFund( piIdPessJur,
                                     piIdPlanoDestino,
                                     piIdPessoa,
                                     piSeqProposta,
                                     qryAux);

  sMesRef := Copy(dtEvento.text,7,4)+'/'+Copy(dtEvento.text,4,2);

  sSalPart :=  CalcSALPART(piIdPessJur, piIdPessoa, sMesRef,qryAux);


  bPartResgPoupanca    := PartResgPoupanca( piIdPessJur,
                                            piIdPlanoDestino,
                                            piIdPessoa,
                                            piSeqProposta,
                                            qryAux);
  if bPartResgPoupanca
  then sPartResgPoupanca := '1'
  else sPartResgPoupanca := '0';

  sUltMesPreparo      := CalcUltMesContribuicao( piIdPessJur,
                                                 piIdPlanoDestino,
                                                 piIdPessoa,
                                                 piSeqProposta, -1,
                                                 sMesRef,
                                                 qryAux);
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT CPE.IDCONTRIBUICAO, CPE.IDREGRAVALIDAASS  '+
                 ' FROM   CONTPREV CP, CONTPREVEVENTO CPE           '+
                 ' WHERE  CPE.IDPLANOPREV     = ' + IntToStr(piIdPlanoDestino)+
                 ' AND    CPE.IDEVENTOGERADOR = ' + sIdEventoGerador +
                 ' AND    CP.FLGINTERNO       = '''+ sFlgInternoDepois +''' '+
                 ' AND    CP.IDPLANOPREV      = CPE.IDPLANOPREV '+
                 ' AND    CP.IDCONTRIBUICAO   = CPE.IDCONTRIBUICAO ');
  qryAux.Open;
  qryAux.First;
  strContribuicaoAAssociar := '';

  // Chama regra de Validação de Associação de Contrib, para verificar se a
  // contribuição deve ser associada ao Participante ou não
  while not qryAux.EOF do
  begin
     bAssocia := False;
     
     if (Not qryContribuicoes.IsEmpty) and
        (qryContribuicoes.Locate('IDCONTRIBUICAO',qryAux.FieldByName('IdContribuicao').AsInteger,[loCaseInsensitive]))
     then begin
        dValorBase1 := qryContribuicoes.FieldbyName('VALORBASE1').AsFloat;
        dValorBase2 := qryContribuicoes.FieldbyName('VALORBASE2').AsFloat;
        dValorBase3 := qryContribuicoes.FieldbyName('VALORBASE3').AsFloat;
     end
     else begin
        dValorBase1 := 0;
        dValorBase2 := 0;
        dValorBase3 := 0;
     end;
     
     bAssocia := ExecutaRegraAssociaContribuicao (piIdPessJur,
                                         piIdPlanoDestino,
                                         piIdPessoa,
                                         piSeqProposta,
                                         qryAux.FieldByName('IdContribuicao').AsInteger,
                                         qryAux.FieldByName('IdRegraValidaAss').AsInteger,
                                         DtEvento.text,
                                         '0',
                                         sPartResgPoupanca,
                                         sUltMesPreparo,
                                         sSalPart,
                                         sDataInscFund,
                                         sIdEventoGerador,
                                         dValorBase1,  
                                         dValorBase2,  
                                         dValorBase3); 

     if bAssocia
     then strContribuicaoAAssociar := strContribuicaoAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ', ';

     qryAux.Next;
  end;

  // Grava todas as novas contribuiçoes que serão associadas, como associadas
  if Trim(strContribuicaoAAssociar) <> ''
  then strContribuicaoAAssociar := Copy(strContribuicaoAAssociar, 1, Length(strContribuicaoAAssociar) - 2)
  else strContribuicaoAAssociar := '0';

  // Filtra somente as contribuição que a regra validou
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO ' +
                 ' WHERE IDPLANOPREV     = ' + IntToStr(piIdPlanoDestino)     + ' AND ' +
                 '       IDEVENTOGERADOR = ' + sIdEventoGerador + ' AND ' +
                 '       IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ')');
  qryAux.Open;
  qryAux.First;

  while not qryAux.EOF do
  begin
     iIdAssociacao := iIdAssociacao + 1;
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, ' +
                      '             IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA) ' +
                      ' VALUES( ' + sIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + sIdEventoGerador + ',' +
                                    IntToStr(piIdPlanoDestino) + ',' + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''F''' + ', 1' + ')');
     try
        qryGrava.ExecSQL;
     except
        Exit;
     end;
     qryAux.Next;
  end;

  Result := True;
end;


procedure TFrmEventoTransfPlano.edOpcao1BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  if not bIndividual then exit;

  
  if (CdsBeneficiosParaConcessao.IsEmpty) or(Trim(CdsBeneficiosParaConcessao.FieldByName('IDREGRACALCOP1').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(CdsBeneficiosParaConcessao.FieldByName('IDREGRACALCOP1').AsInteger,
                         'VALORBASE1',
                         CdsBeneficiosParaConcessao.FieldByName('NOMEVALORBASE1').AsString);
  edOpcao1.Text  := FloatToStr(rOpcao);
end;

procedure TFrmEventoTransfPlano.edOpcao1Change(Sender: TObject);
begin
  inherited;
  If CdsBeneficiosParaConcessao.State in [dsBrowse] Then CdsBeneficiosParaConcessao.Edit;
  CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsString := edOpcao1.Text;
end;

procedure TFrmEventoTransfPlano.edOpcao2Change(Sender: TObject);
begin
  inherited;
  
  If CdsBeneficiosParaConcessao.State in [dsBrowse] Then CdsBeneficiosParaConcessao.Edit;
  CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsString := edOpcao2.Text;

end;

procedure TFrmEventoTransfPlano.edOpcao2BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  if not bIndividual then exit;

  
  if (CdsBeneficiosParaConcessao.IsEmpty) or(Trim(CdsBeneficiosParaConcessao.FieldByName('IDREGRACALCOP2').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(CdsBeneficiosParaConcessao.FieldByName('IDREGRACALCOP2').AsInteger,
                         'VALORBASE2',
                         CdsBeneficiosParaConcessao.FieldByName('NOMEVALORBASE2').AsString);
  edOpcao2.Text  := FloatToStr(rOpcao);

end;

procedure TFrmEventoTransfPlano.edOpcao3Change(Sender: TObject);
begin
  inherited;
  
  If CdsBeneficiosParaConcessao.State in [dsBrowse] Then CdsBeneficiosParaConcessao.Edit;
  CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsString := edOpcao3.Text;
end;

procedure TFrmEventoTransfPlano.edOpcao3BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;

  if not bIndividual then exit;

    
  if (CdsBeneficiosParaConcessao.IsEmpty) or(Trim(CdsBeneficiosParaConcessao.FieldByName('IDREGRACALCOP3').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(CdsBeneficiosParaConcessao.FieldByName('IDREGRACALCOP3').AsInteger,
                         'VALORBASE3',
                         CdsBeneficiosParaConcessao.FieldByName('NOMEVALORBASE3').AsString);
  edOpcao3.Text  := FloatToStr(rOpcao);
end;


function TFrmEventoTransfPlano.CalculaOpcao(piIdRegraCalculo: Integer;
  sCampo, sTitulo: string): double;
var
    rOpcao, rOpcao1, rOpcao2, rOpcao3 : double;
    bErro  : boolean;
    sMsgErro : string;
begin
  inherited;
  ropcao := 0;
  Result := 0;

  // Executar regra de calculo da opcao
  if Trim(edOpcao1.Text) = ''
  then rOpcao1 := 0
  else rOpcao1 := StrToFloat(edOpcao1.Text);


  if Trim(edOpcao2.Text) = ''
  then rOpcao2 := 0
  else rOpcao2 := StrToFloat(edOpcao2.Text);

  if Trim(edOpcao3.Text) = ''
  then rOpcao3 := 0
  else rOpcao3 := StrToFloat(edOpcao3.Text);

  frmAguarde.Mostra('Regra de Cálculo da '+sTitulo+' do Benefício - Nº '+IntToStr(piIdRegraCalculo));


  try
     rOpcao := ExecutaRegraCalculoOpcaoBenef(qryAux,
                         piIdRegraCalculo,
                         piIdRegraCalculo,
                         StrToInt(sIdPessJurTransf),
                         StrToInt(sIdPlanoOrigem),
                         StrToInt(sIdPessoaTransf),
                         StrToInt(sSeqPropostaTransf),
                         CdsBeneficiosParaConcessao.FieldByName('IDBENEFICIO').AsInteger,
                         0,
                         StrToInt(sIdSitFuncDepois),
                         StrToInt(sIdSitPartDepois),
                         StrToInt(sIdSitPlanAntes),
                         rOpcao1, rOpcao2, rOpcao3,
                         dtEvento.Text,
                         dtNovaDib.Text,  
                         dtNovaDib.Text,  
                         '0', 
                         '0', 
                         '0', 
                         '0',
                         '0',
                         '0',
                         bErro,
                         sMsgErro,
                         iIdCalculoGeral,
                         sFlgInternoAntes, 
                         sFlgInternoDepois, 
                         sIdSitPartAntes,     
                         sIdSitPlanAntes, 
                         sIdSitFuncAntes,      
                         sIdSitPartDepois,
                         sIdSitPlanDepois,
                         sIdSitFuncDepois,
                         '0'); 
  except
     
     frmAguarde.Apaga;
  end;


  qryAux.Close;
  frmAguarde.Apaga;


  if bErro then begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
    TiraSQL(qryAux);
    Exit;
  end else  Result := rOpcao;

end;

procedure TFrmEventoTransfPlano.PegaValorHstBenef( piIdPessJur ,
                                piIdPlanoOrigem ,
                                piIdTitular ,
                                piIdPessoa  ,
                                piSeqProposta ,
                                piIdBeneficio  : LongInt;
                                sMesCobranca : String;
                                var sValorTotal, sValorIntegral, sValorPrev : String );
begin
   sValorTotal := '0';
   sValorIntegral := '0';
   sValorPrev := '0';


   qryaux.close;
   qryaux.sql.text := ' SELECT DECODE(NVL(VALORTOTAL,0),0, VALORINTEGRAL, VALORTOTAL) VALORTOTAL, '+
                      ' VALORINTEGRAL, VALORPREV '+
                      ' FROM HSTBENEFBFCIARIO '+
                      ' WHERE IDPESSJUR = '+IntToStr(piIdPessJur)+' '+
                      ' AND IDPESSOA = '+IntToStr(piIdPessoa)+' '+
                      ' AND IDTITULAR = '+IntToStr(piIdTitular)+' '+
                      ' AND IDPLANOPREV = '+IntToStr(piIdPlanoOrigem)+' '+
                      ' AND IDBENEFICIO = '+IntToStr(piIdBeneficio)+' '+
                      ' AND SEQPROPOSTA = '+IntToStr(piSeqProposta)+' '+
                      ' AND MESREFERENCIA >= '''+sMesCobranca+''' '+
                      ' ORDER BY MESREFERENCIA, VALORPREV ';
   qryaux.open;

   if not qryaux.isempty then
   begin
      sValorTotal := qryaux.fieldbyname('ValorTotal').AsString;
      sValorIntegral := qryaux.fieldbyname('ValorIntegral').AsString;
      sValorPrev := qryaux.fieldbyname('ValorPrev').AsString;
   end;

end;



function TFrmEventoTransfPlano.ModificaPreparosExcedentes( piIdPessJur ,
                                       piIdPlanoOrigem   ,
                                       piIdPlanoDestino  ,
                                       piIdTitular       ,
                                       piIdPessoa        ,
                                       piSeqProposta   : LongInt   ) : boolean;
begin
   Result := false;


   with dtmaprev.qry do
   begin

      //apagar regsitros gerados, porém, não pagos
      Close;
      SQL.Clear;
      SQL.Add(' DELETE HSTBENEFBFCIARIO  '+
              ' WHERE  IDPESSJUR       = '+IntToStr(piIdPessJur)       +
              ' AND    IDPLANOPREV     = '+IntToStr(piIdPlanoOrigem)  +
              ' AND    IDTITULAR       = '+IntToStr(piIdTitular)       +
              ' AND    IDPESSOA        = '+IntToStr(piIdPessoa)        +
              ' AND    SEQPROPOSTA     = '+IntToStr(piSeqProposta)     +

              
              ' AND    MESREFERENCIA   >= TO_CHAR(TO_DATE('''+dtNovaDib.text+''',''DD/MM/YYYY''),''YYYY/MM'') '+ //leofuncef - 25072005

              ' AND    NVL(VLBENEFPGTO,0)  =  0 '+
              ' AND    NVL(VALORPREV,0)  =  0 ');

              

      Try
       ExecSql
      except
      //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
      on e:Exception do
      begin
        TratarErro(e.Message);
        exit;
      end;
      //Brunno Mattos - KTN 767861 - SOL 132659 Fim
       
      end;



      //atualizar registros que não tem similar no plano origem
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE HSTBENEFBFCIARIO SET IDLOTE =  NULL, '+  //MES = MESREFERENCIA, '+ //leofuncef - 03032005 - não existe razão de colocar o MES = MESREFERENCIA
              ' DTEFETPGTO = LAST_DAY(TO_DATE(SUBSTR(MESREFERENCIA,1,4)||DECODE(SUBSTR(MESREFERENCIA,5,3),''/13'',''/12'',SUBSTR(MESREFERENCIA,5,3)),''YYYY/MM'')) ,'+
              ' FLGENVIADO = 1,  VLBENEFPGTO  = VALORPREV '+
              ' WHERE  IDPESSJUR       = '+IntToStr(piIdPessJur)       +
              ' AND    IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)  +
              ' AND    IDTITULAR       = '+IntToStr(piIdTitular)       +
              ' AND    IDPESSOA        = '+IntToStr(piIdPessoa)        +
              ' AND    SEQPROPOSTA     = '+IntToStr(piSeqProposta)     +
              
              ' AND    IDLOTE = '+IntToStr(iIdLote)+'   '+
              ' AND    EXISTS ( SELECT 1     '+
              '           FROM   BENEFTRANSFPLANO BT   '+
              '           WHERE  BT.IDPLANODEST   = '+sIdPlanoDestino+
              '           AND    BT.IDPLANOORIGEM = '+sIdPlanoOrigem+
              '           AND    BT.IDBENEFDEST   = HSTBENEFBFCIARIO.IDBENEFICIO '+
              '           AND    BT.IDEVENTOGERADOR = '+sIdEventoGerador+' ) '+
              ' AND  EXISTS (SELECT 1 FROM HSTBENEFBFCIARIO H '+
              '           WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)       +
              '           AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoOrigem)  +
              '           AND    H.IDTITULAR       = '+IntToStr(piIdTitular)       +
              '           AND    H.IDPESSOA        = '+IntToStr(piIdPessoa)        +
              '           AND    H.SEQPROPOSTA     = '+IntToStr(piSeqProposta)     +
              '           AND    H.FONTEPAGADORA   = HSTBENEFBFCIARIO.FONTEPAGADORA '+
              '           AND    (NVL(H.VLBENEFPGTO,0) + NVL(H.VALORPREV,0)) > 0  '+
              '           AND    H.MESREFERENCIA   =  HSTBENEFBFCIARIO.MESREFERENCIA )');

      Try
       ExecSql
      except
      //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
      on e:Exception do
      begin
        TratarErro(e.Message);
        exit;
      end;
      //Brunno Mattos - KTN 767861 - SOL 132659 Fim
       
      end;


   end;


   with dtmaprev.qry do
   begin

      //apagar regsitros do plano orgem, já geradose ainda não pagos
      Close;
      SQL.Clear;
      SQL.Add(' DELETE HSTCONTRIBPREV H '+
              ' WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)      +
              ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoOrigem)  +
              ' AND    H.IDPESSOA        = '+IntToStr(piIdPessoa)       +
              ' AND    H.SEQPROPOSTA     = '+IntToStr(piSeqProposta)    +
              ' AND    H.FLGSITFUNDACAO  =  '''+sFlgInternoAntes+'''  '+
              ' AND    H.MESREFERENCIA     >= '''+sAnoMesLote+''' '+
              ' AND    NVL(H.VALORRECEBIDO,0) <= 0 '+
              ' AND    H.SITRECEBIMENTO < 2 ');

      Try ExecSql except exit end;



      //atualizar registros que não têm similar no plano orgem
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE HSTCONTRIBPREV SET IDLOTE =  NULL, MESCOBRANCA = MESREFERENCIA, '+
              ' DATARECEBIMENTO = LAST_DAY(TO_DATE(SUBSTR(MESREFERENCIA,1,4)||DECODE(SUBSTR(MESREFERENCIA,5,3),''/13'',''/12'',SUBSTR(MESREFERENCIA,5,3)),''YYYY/MM''))  , '+
              ' SITRECEBIMENTO = 2,  VALORRECEBIDO  = VALORESPERADO '+
              ' WHERE  IDPESSJUR       = '+IntToStr(piIdPessJur)       +
              ' AND    IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)  +
              ' AND    IDPESSOA        = '+IntToStr(piIdPessoa)        +
              ' AND    SEQPROPOSTA     = '+IntToStr(piSeqProposta)     +
              
              ' AND    FLGSITFUNDACAO  =  '''+sFlgInternoDepois+'''  '+
              
              ' AND    IDLOTE = '+IntToStr(iIdLote)+' '+
              ' AND    EXISTS (SELECT 1 FROM HSTCONTRIBPREV H '+
              '           WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)      +
              '           AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoOrigem)  +
              '           AND    H.IDPESSOA        = '+IntToStr(piIdPessoa)       +
              '           AND    H.SEQPROPOSTA     = '+IntToStr(piSeqProposta)    +
              '           AND    H.FLGSITFUNDACAO  =  '''+sFlgInternoAntes+'''  '+
              '           AND    (NVL(H.VALORRECEBIDO,0) + NVL(H.VALORESPERADO,0)) > 0  '+
              '           AND    H.MESREFERENCIA   =  HSTCONTRIBPREV.MESREFERENCIA ) ');

      Try ExecSql except exit end;


      //deleta registros gerados além do devido
      Close;
      SQL.Clear;
      SQL.Add(' DELETE HSTCONTRIBPREV WHERE NUMRECEBIMENTO IN  '+
              ' (SELECT DISTINCT NUMRECEBIMENTO FROM  '+
              ' (SELECT MIN(NUMRECEBIMENTO) AS NUMRECEBIMENTO, IDPESSOA , MESREFERENCIA '+
              ' FROM HSTCONTRIBPREV '+
              ' WHERE  IDPESSJUR       = '+IntToStr(piIdPessJur)       +
              ' AND    IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)  +
              ' AND    IDPESSOA        = '+IntToStr(piIdPessoa)        +
              ' AND    SEQPROPOSTA     = '+IntToStr(piSeqProposta)     +
              ' AND    FLGSITFUNDACAO  =  '''+sFlgInternoDepois+'''  '+
              ' AND    IDLOTE = '+IntToStr(iIdLote)+' '+
              ' AND    EXISTS (SELECT 1 FROM HSTCONTRIBPREV H '+
              '           WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)      +
              '           AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)  +
              '           AND    H.IDPESSOA        = '+IntToStr(piIdPessoa)       +
              '           AND    H.SEQPROPOSTA     = '+IntToStr(piSeqProposta)    +
              '           AND    H.FLGSITFUNDACAO  =  '''+sFlgInternoAntes+'''  '+
              '           AND    H.MESREFERENCIA   =  HSTCONTRIBPREV.MESREFERENCIA '+
              '           AND    H.VALORESPERADO = HSTCONTRIBPREV.VALORESPERADO '+
              '           AND    H.NUMRECEBIMENTO <> HSTCONTRIBPREV.NUMRECEBIMENTO ) '+
              ' GROUP BY IDPESSOA , MESREFERENCIA))  ');

      Try ExecSql except exit end;
   end;

   Result := true;
end;


procedure TFrmEventoTransfPlano.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  odTxt.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  SaveDialog1.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  dtmaprev.regraAPrev.ExibeMensagens := False;
  bExibiuOpcoesContrib := False; 

  qryContribuicoes.Close;
  qryContribuicoes.ParamByName('IDPLANOPREV').AsInteger     := -1;
  qryContribuicoes.ParamByName('IDEVENTOGERADOR').AsInteger := -1;
  qryContribuicoes.Open;

  tb97Contrib.Visible := False;  

  dtmaprev.regraAPrev.ExibeMensagens := False;


  memdesc.lines.add('Para processamento em lote, o arquivo de matrículas deve ser selecionado.');
  memdesc.lines.add('Este arquivo deve conter apenas matrícula, uma por linha, de forma completa, exatamente como está cadastrada no sistema.');
  memdesc.lines.add('');
  memdesc.lines.add('Caso a opção de processamento em lote seja acionada, todos os participantes/pensionistas respeitarão '+
                    'as parametrizações feitas nas opções da tela. Por exemplo, caso um benefício de resgate seja parametrizado para '+
                    'concessão durante a transferência, todos os participantes passíveis desta concessão terão o benefício concedido.');

   
   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;
   
                    

end;

procedure TFrmEventoTransfPlano.dblkpcmbLoteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   iIdLote :=  qryLote.FieldByName('IDLOTE').AsInteger;

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DATAPREPARO, MESREFERENCIA  FROM CTRLINTERFACE '+
              ' WHERE  IDLOTE = '+IntToStr(iIdLote));
      Open;
      if not IsEmpty
      then begin
         sAnoMesLote := FieldByName('MESREFERENCIA').AsString;
         sDataFolha  := FieldByName('DATAPREPARO').AsString;
      end
      else begin
         sAnoMesLote := Copy(dtEvento.text,7,4)+'/'+Copy(dtEvento.text,4,2);
         sDataFolha  := dtEvento.text;
      end;
   end;



end;

procedure TFrmEventoTransfPlano.bbtnSairContribClick(Sender: TObject);
begin
  inherited;
  qryContribuicoes.Edit;
  qryContribuicoes.FieldByName('VALORBASE1').AsFloat := StrToFloat(ClienteNumero(edOpcao1Contrib.Text));
  qryContribuicoes.FieldByName('VALORBASE2').AsFloat := StrToFloat(ClienteNumero(edOpcao2Contrib.Text));
  qryContribuicoes.FieldByName('VALORBASE3').AsFloat := StrToFloat(ClienteNumero(edOpcao3Contrib.Text));
  qryContribuicoes.Post;
  tb97Contrib.Visible := False;
end;

procedure TFrmEventoTransfPlano.bbtnContribuicoesClick(Sender: TObject);
begin
  inherited;
  if Trim(dblkpNovoPlano.Text) = ''
  then begin
     MsgDlg('Informe o Plano Destino.','Erro',mtError,[mbOk],0);
     Exit;
  end;
  
  if not bExibiuOpcoesContrib
  then begin
     qryContribuicoes.Close;
     qryContribuicoes.ParamByName('IDPLANOPREV').AsInteger     := qryPatroPlano.FieldbyName('IDPLANOPREV').AsInteger;
     qryContribuicoes.ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(OraNumero(sIdEventoGerador));
     qryContribuicoes.Open;
  end;

  tb97Contrib.Visible  := True;
  tb97Contrib.Top      := 129;
  tb97Contrib.Left     := 12;
  bExibiuOpcoesContrib := True;
end;

procedure TFrmEventoTransfPlano.pgctropChange(Sender: TObject);
begin
  inherited;
  if (pgctrOp.ActivePage = tbLote)
  then begin
    bbtnContribuicoes.Visible := True;
  end
  else begin
    bbtnContribuicoes.Visible := False;
  end;
end;

procedure TFrmEventoTransfPlano.qryContribuicoesBeforeScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryContribuicoes.Edit;
  qryContribuicoes.FieldByName('VALORBASE1').AsFloat := StrToFloat(ClienteNumero(edOpcao1Contrib.Text));
  qryContribuicoes.FieldByName('VALORBASE2').AsFloat := StrToFloat(ClienteNumero(edOpcao2Contrib.Text));
  qryContribuicoes.FieldByName('VALORBASE3').AsFloat := StrToFloat(ClienteNumero(edOpcao3Contrib.Text));
  qryContribuicoes.Post;
end;

procedure TFrmEventoTransfPlano.qryContribuicoesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryContribuicoes.Active then Exit;
  edOpcao1Contrib.Visible       := (qryContribuicoes.FieldByName('NUMOPCOES').AsInteger >= 1);
  edOpcao2Contrib.Visible       := (qryContribuicoes.FieldByName('NUMOPCOES').AsInteger >= 2);
  edOpcao3Contrib.Visible       := (qryContribuicoes.FieldByName('NUMOPCOES').AsInteger >= 3);
  dbedNomeOpcao1Contrib.Visible := (qryContribuicoes.FieldByName('NUMOPCOES').AsInteger >= 1);
  dbedNomeOpcao2Contrib.Visible := (qryContribuicoes.FieldByName('NUMOPCOES').AsInteger >= 2);
  dbedNomeOpcao3Contrib.Visible := (qryContribuicoes.FieldByName('NUMOPCOES').AsInteger >= 3);
  edOpcao1Contrib.Text          := ClienteNumero(qryContribuicoes.FieldByName('VALORBASE1').AsString);
  edOpcao2Contrib.Text          := ClienteNumero(qryContribuicoes.FieldByName('VALORBASE2').AsString);
  edOpcao3Contrib.Text          := ClienteNumero(qryContribuicoes.FieldByName('VALORBASE3').AsString);
end;

function TFrmEventoTransfPlano.MontaQueryDet(piIdPessJur, piIdPlanoOrigem,
                                             piIdPlanoDestino, piIdTitular,
                                             piIdPessoa, piSeqProposta: Integer;
                                             psIdBeneficios: String): boolean;
Var
  sSQL : String;
begin
  sSQL :=
    'SELECT BF.NUMEROPROCESSO,    BF.IDPESSJUR,       BF.IDPLANOPREV,      '+
    '       BF.IDTITULAR,         BF.IDBENEFREFEREN,  BF.IDPLANOORIGEM,                                     '+
    '       BF.IDPESSOA,          BF.SEQPROPOSTA,     BF.IDBENEFICIO,      '+
    '       BF.CODPORTFORMA,      BF.IDSITBENEFICIO,  BF.IDDEPENDENCIA,    '+
    '       BF.IDTPPAGTOBENEFIC,  BF.VALORATUAL,      BF.DATAREQUERIMENTO, '+
    '       BF.DATAINICIO,        BF.DATAFINAL,                            '+
    '       BF.FLGFORMAPAGTO,     BF.VALORCALCULADO,  BF.DATAULTREAJUSTE,  '+
    '       BF.VLRCALCINSS,       BF.VLRINFINSS,      BF.DATAINICIOINSS,   '+
    '       BF.NUMPROCINSS,       BF.DATAINICIOFUND,  BF.VALORCOTAS,       '+
    '       BF.VALORTOTAL,        BF.DATACONCESSAO,   BF.FLGPROVISORIO,    '+
    '       BF.PERCPROVISORIO,    BF.PRAZOPROVISORIO, BF.ULTMESREAJUSTE,   '+
    '       BF.ULTVALORATUALREAJ, BF.IDAGENCIARESGATE,B.NUMORDEMEVENTO,    '+
    '       BF.DIBBENEFANT,       BF.VALORBENEFANT,                        '+
    '       BF.VALORBINSSANT1,    BF.VALORBINSSANT2, BF.VALORBINSSANT3,               '+
    '       BF.FLGBENEFMIN,       BF.VALORSRB,       NVL(BF.VALORNADIB,0) VALORNADIB, '+
    '       BF.CODPORTFORMA,      BF.FLGDATAPREVISTA,   B.NOME, S.DESCRICAO,          '+
    '       B.FLGRESGATE,         BF.VALORBASE1,   BF.VALORBASE2,                     '+
    '       BF.VALORBASE3,     P.NOME DEPEN, BTIT.IDRESPONSAVEL,                      '+
    '       BF.FLGTIPOINSS  , B.FLGPECULIO, BPL.IDREGRACALCULO, BPL.IDREGRAPAGAMENTO, '+
    '       BF.IDPLANOPREV , BF.FLGPOSSUIACOMPINSS, BF.DATAFINALPREVISTA, BTIT.PERCENTUAL, '+
    '       BPL.IDREGRAPRIMPAGTO, BPL.IDREGRAULTPAGTO, BPL.FLGCALCTODOMES,            '+
    '       BPL.FLGREFERENCIA, BF.DIBBENEFANT '+
    'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL, SITBENEFICIO S,         '+
    '       BENEFPLANOPART BPART, BFCIARIOTITPLAN BTIT, PESSOA P                      '+
    'WHERE  BF.IDPESSJUR        = '+IntToStr(piIdPessJur)+
    '  AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoDestino)+
    '  AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)+
    '  AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)+
    '  AND    BF.SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
    '  AND    BF.IDBENEFICIO  IN ('+psIdBeneficios+')' +
    '  AND    P.IDPESSOA        = BF.IDPESSOA          '+
    '  AND    B.IDBENEFICIO     = BF.IDBENEFICIO       '+
    '  AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO       ';

    
    if chkManterInss.checked then
    sSQL := sSQL + '  AND    BPL.FLGREFERENCIA = 0                    ';
   

    sSQL := sSQL +'  AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV       '+
    '  AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO(+)  '+
    '  AND    BF.IDTITULAR      = BPART.IDPESSOA(+)    '+
    '  AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+) '+
    '  AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)   '+
    '  AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+) '+
    '  AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+) '+
    '  AND    BF.IDTITULAR      = BTIT.IDTITULAR       '+
    '  AND    BF.IDPESSJUR      = BTIT.IDPESSJUR       '+
    '  AND    BF.IDPLANOPREV    = BTIT.IDPLANOPREV     '+
    '  AND    BF.IDPLANOORIGEM  = BTIT.IDPLANOORIGEM   '+
    '  AND    BF.IDPESSOA       = BTIT.IDPESSOA        '+
    '  AND    BF.IDBENEFICIO    = BTIT.IDBENEFICIO     '+
    '  AND    BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA     '+
    'ORDER BY B.NUMORDEMEVENTO                         ';
  Result := FazQuery(QryDet,sSQL);
end;

function TfrmEventoTransfPlano.VerificaMigraPlanoEmprestimo ( piIdPessJur,
                                            piIdPlanoOrigem,
                                            piIdPlanoDestino,
                                            piIdTitular,
                                            piIdPessoa : longint ) : boolean; 
var bMigraRecursoContabil : boolean;
begin
   Result := False;
   if not bIndividual
   then bMigraRecursoContabil := bMigraRecursoContabilGeral
   else begin
      bMigraRecursoContabil := False;
      // Verificar se pessoa tem emprestimo aberto ou encerrado ( nao quitado )
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT IDCONTRATOEMPTMO FROM CONTRATOEMPTMO     '+
                     ' WHERE  IDPATRO     = '+IntToStr(piIdPessJur)     +
                     ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                     ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+'    ');
                     
      qryAux.Open;
      if (qryAux.IsEmpty) or (qryAux.FieldByName('IDCONTRATOEMPTMO').AsFloat <= 0) 
      then begin
         Result := True;
         Exit;
      end;

      if not MsgDlg('O participante possui Contrato de Empréstimo ainda não quitado.'+#13+
                    'Os recursos contábeis deste contrato também serão migrados ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
      then bMigraRecursoContabil := True;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE CONTRATOEMPTMO SET IDPLANOPREV = '+IntToStr(piIdPlanoDestino));
   if bMigraRecursoContabil
   then qryAux.SQL.Add(', IDPLANOORIGEM = '+IntToStr(piIdPlanoDestino));

   qryAux.SQL.Add(' WHERE  IDPATRO     = '+IntToStr(piIdPessJur)     +
                  ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoOrigem) +
                  ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)      );

   try
      qryAux.ExecSQL;
   except
      Exit;
   end;
   Result := True;
end;

function TFrmEventoTransfPlano.VerificaNucleoFamiliar(Var iPessoasNucleo : Integer):Boolean;
Var
  sSQL : String;
begin
  Result := False;
  { Pesquisa se existe mais pessoas neste nucleo familiar }
  If FazQuery(QryAux,
     'SELECT DISTINCT IDPESSOA FROM BFCIARIOTITPLAN WHERE IDNUCLEOFAMILIAR = '+sIdNucleoFamiliar)
  Then Begin
    Result := True;
    iPessoasNucleo := 0;
    QryAux.First;
    While Not QryAux.Eof Do Begin
      Inc(iPessoasNucleo);
      aPessoasaProcessar[iPessoasNucleo].sIdPessoaTransf := QryAux.FieldByName('IDPESSOA').AsString;

      QryAux.Next;
    End;

  End;

End;

procedure TFrmEventoTransfPlano.cmbSitPartDestEnter(Sender: TObject);
begin
  inherited;
  If not qrySitPartDestino.Active
   Then qrySitPartDestino.open;
end;

procedure TFrmEventoTransfPlano.tbloteShow(Sender: TObject);
begin
  inherited;
  If not qrySitPartDestino.Active Then qrySitPartDestino.open;

  qrySitPartDestino.Filter   := '';
  qrySitPartDestino.Filtered := False;
  qrySitPartDestino.First;
end;


procedure TFrmEventoTransfPlano.CdsBeneficiosParaConcessaoAfterScroll( DataSet: TDataSet );
begin
  inherited;

  btnRetirar.enabled := (trim(CdsBeneficiosParaConcessao.fieldbyname('SETA').AsString) = '*');

  lblvalorbase1.visible := (trim(CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE1').AsString) <> '');
  lblvalorbase1.caption := CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE1').AsString;
  edOpcao1.visible := (trim(CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE1').AsString) <> '');
  edOpcao1.Text    := CdsBeneficiosParaConcessao.fieldbyname('VALORBASE1').AsString;

  lblvalorbase2.visible := (trim(CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE2').AsString) <> '');
  lblvalorbase2.caption := CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE2').AsString;
  edOpcao2.visible := (trim(CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE2').AsString) <> '');
  edOpcao2.Text := CdsBeneficiosParaConcessao.fieldbyname('VALORBASE2').AsString;

  lblvalorbase3.visible := (trim(CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE3').AsString) <> '');
  lblvalorbase3.caption := CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE3').AsString;
  edOpcao3.visible := (trim(CdsBeneficiosParaConcessao.fieldbyname('NOMEVALORBASE3').AsString) <> '');
  edOpcao3.Text := CdsBeneficiosParaConcessao.fieldbyname('VALORBASE3').AsString;

end;

end.



