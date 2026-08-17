unit FMTRecebMerc;
{ ------------------------------------------------------------------------------
Rotina .....: FormCreate
Nº SIG......: 84877
Data........: 30/07/2019
Responsável.: Edilaine
Descrição...: Alteração no número de dígitos do campo para baixa de residuos
              Propriedade DecDigits
--------------------------------------------------------------------------------
Nº SIG......: 81503
Data........: 30/01/2019
Responsável.: Everson Cunha
Descrição...: Alteração no número de dígitos do campo dbedValUN, pois estava
              tendo problema com arredondamento. Propriedade DecDigits
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 188854
Nº KINTANA..: 1784331
Data........: -
Responsável.: Higor Nayde
Descrição...: -
--------------------------------------------------------------------------------
Data        : 19/10/2012
Autor       : José Roberto Marque
SOL/KINTANA : 189816/1793898
Descrição   : Implementação da Rotina GravarAlteradores para criação dos
              alteradores automáticos de impostos (quando parametrizado no tipo
              de desembolso)
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de rotina para obrigar a fazer a avaliação do Fornecedor
--------------------------------------------------------------------------------
Data        : 01/11/2011
Autor       : Vinicius Eduardo Nascimento Maciel
SOL/KINTANA : 163982/6901 - 1472467
Descrição   : Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
--------------------------------------------------------------------------------
Data        : 30/07/2009
Autor       : Cássio Rovaroto de Camargo
SOL/KINTANA : 122419/601286
Descrição   : Acerto na variável que armazena o número de AP/GR na inserção de
              novos recebimentos.
--------------------------------------------------------------------------------
 Data       : 06.06.2007
 Autor      : Antonio Marcos (amf)
 Pendência  : 22345
 Descrição  : Crítica da data de vencimento.
--------------------------------------------------------------------------------
 Data       : 27.04.2007
 Autor      : Antonio Marcos (amf)
 Pendência  : 25203
 Descrição  : Corrigido o problema dos dados bancários do fornecedor. Agora, ao gerar o documento
              para o contas a pagar, as informações referentes aos dados bancários estão sendo gravadas.
              Este problema estava afetando o relatório de requisição de pagamentos no contas a pagar.
--------------------------------------------------------------------------------
 Data       : 25.04.2007
 Autor      : Marcus Oliveira
 Pendência  : 24823
 Descrição  : Ativando/ Des o Portador Forma na lookup.
--------------------------------------------------------------------------------
 Data       : 02.02.2007
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 24212
 Descrição  : Não exibe a mensagem de itens pendentes quando o usuário recebe em uma só nota fiscal
              todos os itens da OC.
--------------------------------------------------------------------------------
 Data       : 01.12.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 23720
 Descrição  : Correção do bug da mensagem de aviso de mercadoria pendente quando o usuário
              alterava informações do recebimento.
--------------------------------------------------------------------------------
 Data       : 21.09.2006
 Autor      : Marcus Oliveira
 Pendência  : 21621
 Descrição  : Alterado o tamanho do campo histórico de 40 para 60 em Recebimento
              de Mercadoria com ou sem O.C.
--------------------------------------------------------------------------------
 Data       : 27.07.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22883
 Descrição  : Alteradas sqlCdsItemComOC para trazer a quantidade definida na
              solicitação. Faltava o Join com a tabela SOLIBAIXADAS
              O Grid de Itens de Recebimento foi alterado para no caption quantidade,
              receber o field QTDERECEBDEVOL.
--------------------------------------------------------------------------------
 Data       : 21.07.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22883
 Descrição  : Alteradas sqlCdsItemComOC e spOC para trazer a quantidade definida na
              solicitação. A alteração está no .dfm
--------------------------------------------------------------------------------
 Data       : 11.05.2006
 Autor      : Antonio Marcos (amf)
 Colaborador: André Tavares
 Pendência  : 22307
 Descrição  : - Alterada a procedure AtualizaQtdeItens para obter o total de itens da nota.
              - Acerto do recebimento de mercadorias sem OC. O dataset perdia o state.
              - Alteração na sqlCdsItensComOC. Agora traz o nome do plano previdenciário.
              - Alteração na interface do Grid para evitar a falsa impressão de duplicidade
                de linhas.
              - Alteração na crítica de Nota Zerada.
--------------------------------------------------------------------------------
 Data      : 08.05.2006
 Autor     : Antonio Marcos (amf)
 Pendência : 22280
 Descrição : Faz o teste se o recebimento tem OC ou não antes de chamar a procedure
             VerifQtdeOC.
--------------------------------------------------------------------------------
 Data      : 03.04.2006
 Autor     : Antonio Marcos (amf)
 Pendência : 21830(creio)
 Descrição :  - Acerto da mensagem no recebimento parcial de mercadorias
              - Acerto da quantidade pendente quando houver edição da quantidade
              - Corrigida a replicação de registros após pressionar o botão de consulta.
--------------------------------------------------------------------------------
 Data      : 27.03.2006
 Autor     : Antonio Marcos (amf)
 Pendência : 21830
 Descrição :  - Acerto do recebimento parcial de mercadorias
              - Acerto do valor da nota pelo somatório dos itens.
--------------------------------------------------------------------------------
 Data      : 26/12/2005
 Autor     : André tavares
 Pendência : 21091
 Descrição : O campo quantidade esva sendo preenchido erradamente, tive que
             incluir mais uma coluna na query do sqlparam do FmtRecebMerc.spoc
--------------------------------------------------------------------------------
 Rotina     : Diversas
 Data       : 15/07/2005
 Autor      : André Tavares
 Pendências : 19960
 Descrição  : Não estava preenchendo o campo codalmoxarifadologin quando se fazia o recebimento de mercadoria com oc.
--------------------------------------------------------------------------------
 Rotina     : Diversas
 Data       : 07/06/2005
 Autor      : Rodolpho da Silva
 Pendências : 19406
 Descrição  : Correção do erro que ao alterar a mercadoria recebida, nâo estava
              atualizando a quantidade pendente.
--------------------------------------------------------------------------------
 Rotina     : CmeCadastroApplyEdit
 Data       : 08/04/2005
 Autor      : Rodolpho da Silva
 Pendências : 18210
 Descrição  : Não permitir que o numero da OC seja incrementado no momento da alteração.
--------------------------------------------------------------------------------
 Componente : spOC
 Data       : 30/11/04 (término)
 Autor      : Bruno Bastos
 Pendências : 18113
 Descrição  : Inclusão dos campos IdPlanoPrev, IdPatro e IdPrograma neste componente.
--------------------------------------------------------------------------------
 Rotinas    : Várias
 Data       : 22/06/04 (término)
 Autor      : David Ayrolla
 Pendências : 16521 e 17057
 Descrição  : Resolver vários problemas no preenchimento do Compromisso
              Orçamentário.
--------------------------------------------------------------------------------
 Componente: spOC
 Data      : 09/06/2004
 Autor     : David Ayrolla
 Pendência : 16219
 Descrição : Ao tentar fazer recebimento do OC sem contação não liberado no RAD,
             exibir mensagem contendo no. do processo e da OC.
--------------------------------------------------------------------------------

 Rotina    : BeforeConfirma
 Data      : 20/05/2004 e 21/05/2004
 Autor     : André Pontes
 Pendência : 15663 e 16480
 Descrição : Não permitido recebimento de mercadoria com valor superior ao do compromisso
             orçamentário criado quando da geração / lançamento da OC.
             Se houver integração con Orçamento (segundo parâmetro do Sistema), obriga
             a escolha de um compromisso orçamentário
--------------------------------------------------------------------------------

 Atualizado em : 31/07/2003 - André Tavares  - resolução da pendência 14560
                 11/09/2003 - André Tavares  - resolução da pendência 15001
                 18/11/2003 - André Tavares  - pendência 15623
                 16/12/2003 - David Ayrolla  - pendência 15810
                 16/02/2004 - Andre Tavares  - pendência 15550
                 20/02/2004 - André Tavares -  pendência 14929
                 27/02/2004 - André Tavares - pendência 15069
                 30/03/2004 - Alex Pereira - retrabalho pendência 15069
                 15/04/2004 - Andre Tavares  - pendência 15550 - ajuste
                 02/06/2004 - andre tavares - pendencia 16838

--------------------------------------------------------------------------------
 Rotina    : FazIntegraCAP
 Data      : 28/02/2004
 Autor     : David Ayrolla
 Pendência : 15713
 Descrição : Correção de erro na inclusão dos campos NUMLEITCODBARRAS,
             NUMDIGCODBARRAS e IDCBANCARIA.
--------------------------------------------------------------------------------
 Rotina     : bbtnOkDetClick e pgclDadosItemChange
 Responsável: Gleyber
 Data       : 26/08/2003
 Pendência  : 14924
 Descrição  : Controle do Centro de Custo por usuário no Rateio do CAP
--------------------------------------------------------------------------------
 Rotina     : CmeDetalheConfirma
 Responsável: David
 Data       : 16/12/2003
 Pendência  : 15810
 Descrição  : Recuperação do centro de custo correto, de acordo com o destino
              do lançamento.
-------------------------------------------------------------------------------}
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
   CMDateTimePicker, TREdit, wwdbedit, Mask, CMProcuraSubTipo, DBCtrls, uCmTypes,
   wwdblook, FrAgregados, uCmSqlParams, uCtrlRecebMerc,uCtrlArtigo, uCtrlAlmox,
   uCtrlCentroCusto, uCtrlUnidNegocio, uCtrlCentRespon, uCtrlTipoRecebDesemb,
   uCtrlUnMedida, uCtrlParamIntegra, uCtrlTipoAgregado, uCtrlTipoDocRecPag,
   uCtrlClasFisc, uCtrlAlmoxCaf , uCtrlAlmoxCompra,
   DBGrids,
   {SOL:189816 KTN:1793898 JRM6}
   uCtrlAlteradorImpostos, //  in '\Projetocm5\cmcapcarutilobj50\ctrlObjects\uCtrlAlteradorImpostos.pax',
   {SOL:189816 KTN:1793898 JRM6}
   uDiasUteis, FJustificativa, FCadForne, uCtrlAvaliacaoFornec, DBTables,
  Wwquery;

const

   MSG_DATAVENCTO_FERIADO          = ' Data de vencimento não pode ser um feriado';
   MSG_DATAVENCTO_NAOUTIL          = ' Data de vencimento deve ser um dia útil';

type
   TFrmMTRecebMerc = class(TFrmCadastroMestreDetMT)
      dblcFornCli: TCMProcuraForCli;
      lblNumDoc: TLabel;
      mskNumNF: TMaskEdit;
      dbeCompl: TwwDBEdit;
      lblBarra: TLabel;
      dbeValorCorrente: TDBRealEdit;
      lblValor: TLabel;
      chkCap: TCheckBox;
      lblEmissao: TLabel;
      dbeDataEmi: TCMDateTimePicker;
      lblData: TLabel;
      dbeDataLanc: TCMDateTimePicker;
      TabAgregNota: TTabSheet;
      TabCAP: TTabSheet;
      tabContab: TTabSheet;
      pgclDadosItem: TPageControl;
      tbsDadosGerais: TTabSheet;
      Label2: TLabel;
      Label12: TLabel;
      Label13: TLabel;
    lblUnidMed: TLabel;
      lbvalorUN: TLabel;
      dblkpcmbArtigo: TwwDBLookupCombo;
      dblcUnidMedida: TwwDBLookupCombo;
      dbedQtdeEnt: TDBRealEdit;
      dbedValUN: TDBRealEdit;
      GpDotOrc: TGroupBox;
      BtnOrcamento: TSpeedButton;
      tbsAgregItem: TTabSheet;
      tbsIntegraCAP: TTabSheet;
      dbrgECA: TDBRadioGroup;
      dblcCCusto: TwwDBLookupCombo;
      dblkpcmbAlmoxa: TwwDBLookupCombo;
      lblDestEdit: TLabel;
      dblkpcmbClasFisc: TwwDBLookupCombo;
      Label6: TLabel;
      dbedDataValidade: TCMDateTimePicker;
      lblDtValidade: TLabel;
      lblCResp: TLabel;
      lblAtiv: TLabel;
      lblTipoDesemb: TLabel;
      dblcCentRespon: TwwDBLookupCombo;
      dblcAtividade: TwwDBLookupCombo;
      dblcTipoDesemb: TwwDBLookupCombo;
      Label11: TLabel;
      Label14: TLabel;
      LblFormaPag: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      Label21: TLabel;
      cbEnglobParc: TCheckBox;
      dbeDataVenc: TCMDateTimePicker;
      EdHist: TEdit;
      DblcCodForma: TwwDBLookupCombo;
      dbclTipoDoc: TwwDBLookupCombo;
      memObsCap: TMemo;
      edRef: TEdit;
      GpConta: TGroupBox;
      Label22: TLabel;
      Label23: TLabel;
      Label24: TLabel;
      BtnBuscaContaCor: TSpeedButton;
      edtBanco: TEdit;
      edtAgencia: TEdit;
      edtConta: TEdit;
      dblcPortForma: TwwDBLookupCombo;
      dbgContab: TwwDBGrid;
      cdsClasFisc: TCMClientDataSet;
      cdsAlmox: TCMClientDataSet;
      CdsCentroCusto: TCMClientDataSet;
      cdsAgregNotaTela: TCMClientDataSet;
      cdsUnidMed: TCMClientDataSet;
      cdsArtigo: TCMClientDataSet;
      dsAgregItem: TwwDataSource;
      dsAgregNota: TwwDataSource;
      FrameAgregNota: TFrameAgregados;
      FrameAgregItem: TFrameAgregados;
      cdsCentRespon: TCMClientDataSet;
      cdsUnidNegoc: TCMClientDataSet;
      cdsTipoRecebDesemb: TCMClientDataSet;
      MsContaCor: TMontaSelect;
      CdsTipoDoc: TCMClientDataSet;
      dbenNumDoc: TDBRealEdit;
      dsContab: TwwDataSource;
      CdsContab: TCMClientDataSet;
      CdsCAP: TCMClientDataSet;
      cdsNFCompl: TCMClientDataSet;
      CdsAgregNFCompl: TCMClientDataSet;
      cdsItemNota: TCMClientDataSet;
      dblkpcmbDesc: TwwDBLookupCombo;
      cdsAux: TCMClientDataSet;
      Label20: TLabel;
      EdLinhaDig: TEdit;
      Label19: TLabel;
      EdCodBarra: TEdit;
      cdsAgregItemTela: TCMClientDataSet;
      spFormaPag: TCMSqlParams;
      spContaCaixa: TCMSqlParams;
      cdsFormaPag: TCMClientDataSet;
      CdsContaCaixa: TCMClientDataSet;
      CdsValTotAgreg: TCMClientDataSet;
      reValorTotal: TRealEdit;
      CdsAgregAux: TCMClientDataSet;
      dsNFCompl: TwwDataSource;
      spContaCor: TCMSqlParams;
      CdsOC: TCMClientDataSet;
      spOC: TCMSqlParams;
      dsOC: TwwDataSource;
      lbAlterar: TLabel;
      spGetEstado: TCMSqlParams;
      CdsAtivoFixo: TCMClientDataSet;
      MsResORc: TMontaSelect;
      sqlParamGlobal: TCMSqlParams;
      cdsParamGlobal: TCMClientDataSet;
      lbvalorTot: TLabel;
    lblDescTipoConta: TLabel;
    cdsParAlmox: TCMClientDataSet;
    dbedtNumReserva: TwwDBEdit;
    SqlCompOrc: TCMSqlParams;
    cdsCompOrc: TCMClientDataSet;
    SqlCdsItemsComOC: TCMSqlParams;
    wwQueryAux: TwwQuery;

      procedure FormCreate(Sender: TObject);
      procedure dblkpcmbArtigoCloseUp(Sender: TObject; LookupTable,
        FillTable: TDataSet; modified: Boolean);
      procedure dblkpcmbDescCloseUp(Sender: TObject; LookupTable,
        FillTable: TDataSet; modified: Boolean);
      procedure dblcUnidMedidaEnter(Sender: TObject);
      procedure dbedValUNExit(Sender: TObject);
      procedure reValorTotalExit(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeDetalheInsert(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeDetalheEdit(Sender: TObject);
      procedure dblkpcmbAlmoxaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure FrameAgregNotaedValorAgregExit(Sender: TObject);
      procedure dbedDataValidadeExit(Sender: TObject);
      procedure CmeDetalheDelete(Sender: TObject);
      procedure bbtnOkDetClick(Sender: TObject);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure FrameAgregItemedValorAgregExit(Sender: TObject);
      procedure BtnBuscaContaCorClick(Sender: TObject);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure dbclTipoDocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure dblcFornCliExit(Sender: TObject);
      procedure dbrgECAExit(Sender: TObject);
      procedure dbeValorCorrenteExit(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure sbtnInsDetClick(Sender: TObject);
      procedure sbtnAltDetClick(Sender: TObject);
      procedure dblkpcmbDescChange(Sender: TObject);
      procedure dblcUnidMedidaDropDown(Sender: TObject);
      procedure BtnOrcamentoClick(Sender: TObject);
      procedure dbeDataEmiChange(Sender: TObject);
      procedure dbedtNumReservaExit(Sender: TObject);
    procedure CdsOCAfterOpen(DataSet: TDataSet);
    procedure cdsItemNotaAfterOpen(DataSet: TDataSet);
    procedure CmeDetalheFind(Sender: TObject);
//Higor Nayde SOL 188854 Kintana 1784331 - Início
  procedure dblcFornCliChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
//Higor Nayde SOL 188854 Kintana 1784331 - Fim

   private  // Private declarations

      bFLGINTEGRAORC : boolean;
      FlgExit : Boolean;// flg para evitar passar duas vezes o exit //Higor Nayde SOL 188854 Kintana 1784331
      iUltNumReserva : integer;

      ParcIDCBANCARIA : Integer;
      IdNFRecebDevol  : Double;
      CtrlAvaliacaoFornec: TCtrlAvaliacaoFornec;

      RecebMerc       : TCtrlRecebMerc;
      Artigo          : TCtrlArtigo;
      Almox           : TCtrlAlmox;
      CentroCusto     : TCtrlCentroCusto;
      UnidNegocio     : TCtrlUnidNegocio;
      CentRespon      : TCtrlCentRespon;
      TipoRecebDesemb : TCtrlTipoRecebDesemb;
      UnMedida        : TCtrlUnMedida;
      AgregadoNota    : TCtrlTipoAgregado;
      AgregadoItem    : TCtrlTipoAgregado;
      TipoDocumento   : TCtrlTipoDocRecPag;
      ClasFisc        : TCtrlClasFisc;
      AlmoxCaf        : TCtrlAlmoxCaf;
      AlmoxCompra     : TCtrlAlmoxCompra;
      rPendente       : double;
      sArtigosLidos   : string;
      oDiasUteis      : TDiasUteis;
      IdForCli        : Integer;


      procedure AbreSqlCompOrc( iId : integer );

      procedure SelNota( n : Double );
      procedure SetArtigo( sCodFisc : String );
      procedure SelItemNota( n : Double );
      procedure SetAgregItem( IdItensRecDev : Double );
      procedure GravarCAP;
      {SOL:189816 KTN:1793898 JRM6}
      procedure GravarAlteradores;
      {SOL:189816 KTN:1793898 JRM6}
      procedure VerifValTotAgerg;
      procedure SetAgregadosItem;
      procedure SelContaCor( IdPessoa : Double );
      procedure PreparaAlteracao;
      procedure VerifQtdeOC;
      procedure GetEstado( IdForCli : Double );
      function CalculaCotacao(dataCotacao: TdateTime; valorAnterior: Extended; moeCodigo: integer): Extended;

      procedure LimpaCAP;

      // função de arredondamento de valores
      function Arredonda(fValor: extended; iDecimais: word): extended;

      procedure AtualizaQtdeItens;

      function MarcaParcialTotal(out qtdPedida: extended; out qtdRecebida: extended): string;

      function UsuarioRecebeuTotalDoArtigoNaOC(sCodArtigo: string; qtdePedida: extended): boolean;

      procedure JustificarFornec;
      procedure FazerAvaliacao;
      procedure AbrirAvaliacao;

   public   // Public declarations

      sCodFisc, numapgr : String;
   end;



var
  FrmMTRecebMerc:   TFrmMTRecebMerc;
  {SOL:189816 KTN:1793898 JRM6}
  v_CodDocumento,
  v_codtiporecdes:  String;
  v_Coddocumento_Alt,
  v_codtipdoc:      Integer;
  {SOL:189816 KTN:1793898 JRM6}

implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uModulo, FMTNotaCompl, uCtrlPadroes,uDataBase,
   FMTValTotAgreg, FTelaAut, FAguarde, FMTBaixaDir, JclMath, FMTOCxForn,
   FMTCadAlmoxCaf,
   Math;



procedure TFrmMTRecebMerc.FormCreate(Sender: TObject);
var
   x : Integer;
begin
  inherited;
  rPendente := 0;
  sqlParamGlobal.Prepare;
  sqlParamGlobal.ParamByName('IDEMPRESA').AsInteger := sistema.IdEmpresa;
  sqlParamGlobal.Open;


  ParcIDCBANCARIA := -1;
  IdNFRecebDevol := 0;
  RecebMerc := TCtrlRecebMerc.Create;
  RecebMerc.InitializeAs( Padroes );
  RecebMerc.OpenTransaction := True;

  RecebMerc.cdsNota             := Cds;
  RecebMerc.cdsItemNota         := cdsItemNota;
  RecebMerc.cdsAgregNotaTela    := cdsAgregNotaTela;
  RecebMerc.cdsAgregItemTela    := cdsAgregItemTela;
  RecebMerc.CdsContab           := CdsContab;
  RecebMerc.CdsCAP              := CdsCAP;
  RecebMerc.CdsNFCompl          := cdsNFCompl;
  RecebMerc.CdsAgregNFCompl     := CdsAgregNFCompl;
  RecebMerc.CdsValTotAgreg      := CdsValTotAgreg;
  RecebMerc.CdsAtivoFixo        := CdsAtivoFixo;

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs( RecebMerc );

  Almox := TCtrlAlmox.Create;
  Almox.InitializeAs( RecebMerc );

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs( RecebMerc );

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs( RecebMerc );

  CentRespon := TCtrlCentRespon.Create;
  CentRespon.InitializeAs( RecebMerc );

  TipoRecebDesemb := TCtrlTipoRecebDesemb.Create;
  TipoRecebDesemb.InitializeAs( RecebMerc );

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.InitializeAs( RecebMerc );

  AgregadoNota := TCtrlTipoAgregado.Create;
  AgregadoNota.InitializeAs( RecebMerc );

  AgregadoItem := TCtrlTipoAgregado.Create;
  AgregadoItem.InitializeAs( RecebMerc );

  TipoDocumento := TCtrlTipoDocRecPag.Create;
  TipoDocumento.InitializeAs( RecebMerc );

  ClasFisc := TCtrlClasFisc.Create;
  ClasFisc.InitializeAs( RecebMerc );

  AlmoxCaf := TCtrlAlmoxCaf.Create;
  AlmoxCaf.InitializeAs( RecebMerc );

  AlmoxCompra := TCtrlAlmoxCompra.Create;
  AlmoxCompra.InitializeAs( RecebMerc );

  oDiasUteis := TDiasUteis.Create;
  oDiasUteis.InitializeAs(RecebMerc);

  // preparação da Tela e seus Componentes Locais
  MontaSelect.Filtro.Add('NFRECEBDEVOL.IDPESSOA = '+IntToStr(Sistema.idempresa));

  MontaSelect.Filtro.Add('NFRECEBDEVOL.FLGTIPONOTA = ''R''');
  //
  if Modulo.sFlgInfoValorUN = 'S' Then
     begin
        // atualiza edit e label do valor unitario
         dbedValUN.Top         := dblcUnidMedida.Top;
         dbedValUN.Left        := dblcUnidMedida.Left + dblcUnidMedida.Width + 5;
         dbedValUN.Enabled     := True;
         dbedValUN.TabOrder    := 4;

         lbvalorUN.Top         := lblUnidMed.Top;
         lbvalorUN.Left        := dbedValUN.Left + 2;
         reValorTotal.Top      := dbedDataValidade.Top;
         reValorTotal.Left     := dbedDataValidade.Left + dbedDataValidade.Width + 10;
         reValorTotal.Enabled  := False;
         reValorTotal.TabOrder := 8;

         lbvalorTot.Top        := lblDtValidade.Top;
         lbvalorTot.Left       := reValorTotal.Left + 2;
     end
  Else
     begin
         dbedValUN.Top         := dbedDataValidade.Top {+ 15};                   //edilaine SIG84877
         dbedValUN.Left        := dbedDataValidade.Left + dbedDataValidade.Width + 10;
         dbedValUN.Enabled     := False;
         dbedValUN.TabOrder    := 8;

         lbvalorUN.Top         := lblDtValidade.top; {dbedDataValidade.Top;}     //edilaine SIG84877
         lbvalorUN.Left        := dbedDataValidade.Left + dbedDataValidade.Width + 10;
        // atualiza edit e label do valor Total
         reValorTotal.Top      := dblcUnidMedida.Top;
         reValorTotal.Left     := dblcUnidMedida.Left + dblcUnidMedida.Width + 5;
         reValorTotal.Enabled  := True;
         reValorTotal.TabOrder := 4;

         lbvalorTot.Top        := dblcUnidMedida.Top - 15;
         lbvalorTot.Left       := dblcUnidMedida.Left + dblcUnidMedida.Width + 5;
     end;
  // Abrindo os ClientDataSet´s PRINCIPAIS
  SelNota(-1);
  // Abrindo os ClientDataSet´s AUXILIARES

  cdsAlmox.Data           := Almox.ListAlmox( Sistema.IdEmpresa );
  cdsArtigo.Data          := Artigo.ListArtigo;
  CdsCentroCusto.Data     := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');

  cdsCentRespon.Data      := CentRespon.ListaCentResponAtrib_Usu(Sistema.IdUsuario, Sistema.IdEmpresa,tcrSoAnalitica, 0);


  //Vinicius Maciel - SOL 163982/6901 - KTN 1472467
  //cdsUnidNegoc.Data       := UnidNegocio.ListaUnidNegocio( Sistema.IdEmpresa );
  cdsUnidNegoc.Data       := UnidNegocio.ListaUnidNegocioAtivas( Sistema.IdEmpresa );
  //Vinicius Maciel - SOL 163982/6901 - KTN 1472467 - FIM
  cdsTipoRecebDesemb.Data := TipoRecebDesemb.ListTiporecebdesemb('P',Sistema.IdEmpresa, 'A', '', '', 'S');
  CdsTipoDoc.Data         := TipoDocumento.ListTipodocrecpag('P',0);
  cdsClasFisc.Data        := ClasFisc.ListCodigosFiscais;

  CdsAgregAux.Data        := RecebMerc.GetAgregItem( 0 );

  spFormaPag.Prepare;
  spFormaPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  spFormaPag.Open;

  spContaCaixa.Open;

 //-------------------------------------------------------------------------------------------
 // Inicialização dos Frames
 //-------------------------------------------------------------------------------------------
  FrameAgregNota.TipoAgregado    := AgregadoNota;
  RecebMerc.cdsAgregNotaTela     := FrameAgregNota.cdsAgregados;
  AgregadoNota.cdsValorAgregTela := FrameAgregNota.cdsAgregados;

  FrameAgregItem.TipoAgregado    := AgregadoItem;
  AgregadoItem.cdsValorAgregTela := FrameAgregItem.cdsAgregados;

 //-------------------------------------------------------------------------------------------

  mskNumNF.EditMask := ParamIntegra.MascaraNoDocum +';1; ';

 //-------------------------------------------------------------------------------------------
 // CONTA BANCARIA DO FORNECEDOR
 //-------------------------------------------------------------------------------------------
  MsContaCor.Larguras.Add('15');
  MsContaCor.Mascaras.Add(' ');
  MsContaCor.SensivelACaixa.Add('N');
  MsContaCor.TipodeDado.Add('C');
  MsContaCor.Descricao.Add('Tipo de Conta');
  MsContaCor.Colunas.Add('DECODE(CONTABANCARIA.TIPOCONTA,''1'',''Conta Corrente'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''2'',''Cartão Salário'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA');
  //
  MsContaCor.CamposChave.Add('DECODE(CONTABANCARIA.TIPOCONTA,''1'',''Conta Corrente'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''2'',''Cartão Salário'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA');

  if Modulo.sComSemOC = 'C' Then
     begin
        Self.HelpContext      := 50020;
        bbtnAjuda.HelpContext := 50020;
     end
  Else
     begin
        Self.HelpContext      := 50021;
        bbtnAjuda.HelpContext := 50021;
     end;
   //---------------------------------------------------------------------
   // Faz com que o número dígitos seja de acordo com a máscara
   //---------------------------------------------------------------------
   if Trim(ParamIntegra.MascaraNoDocum) <> '' Then
      begin
         dbenNumDoc.Tag := 0;
         For x := 1 To Length(ParamIntegra.MascaraNoDocum) Do
            if StrToIntDef(ParamIntegra.MascaraNoDocum[x],-1) > 0 Then
               dbenNumDoc.Tag := dbenNumDoc.Tag + 1;
         dbenNumDoc.IntDigits := dbenNumDoc.Tag;
      end;
   //---------------------------------------------------------------------


  cdsParAlmox.Data := AlmoxCompra.GetParalmox(Sistema.IDEmpresa);
  bFLGINTEGRAORC   := ( cdsParAlmox.FieldByName('FLGINTEGRAORC').AsInteger = 1 );

  GpDotOrc.Visible := bFLGINTEGRAORC;

  CtrlAvaliacaoFornec := TCtrlAvaliacaoFornec.Create;
  CtrlAvaliacaoFornec.InitializeAs(Padroes);
  

end;




procedure TFrmMTRecebMerc.SelNota(n: Double);
begin
  IdNFRecebDevol := n;

  Cds.Data              := RecebMerc.Procurar( n );

  cdsNFCompl.Data       := RecebMerc.GetNotaComplementar( n );

  CdsAgregNotaTela.Data := RecebMerc.GetAgregNota( n );

  FrameAgregNota.cdsAgregados.Data := RecebMerc.GetAgregNota( n );

  CdsCAP.Data     := RecebMerc.ListDadosCAP( Cds.FieldByName('CODDOCUMENTO').AsFloat );
  if Not CdsCAP.IsEmpty Then
  begin
    EdHist.Text               := CdsCAP.FieldByName('HISTORICOCOMPL').asString;
    edCodBarra.Text           := CdsCAP.FieldByName('NUMLEITCODBARRAS').asString;
    EdLinhaDig.Text           := CdsCAP.FieldByName('NUMDIGCODBARRAS').asString;
    DblcCodForma.LookupValue  := CdsCAP.FieldByName('CODFORMA').asString;
    memObsCap.Text            := CdsCAP.FieldByName('OBS').asString;
    edRef.Text                := CdsCAP.FieldByName('REFERENCIA').asString;
    dblcPortForma.LookupValue := CdsCAP.FieldByName('CODPORTFORMA').asString;
    dbclTipoDoc.LookupValue   := CdsCAP.FieldByName('CODTIPDOC').asString;
    cbEnglobParc.Checked      := Trim(CdsCAP.FieldByName('OPERACAO').asString) = '1';
    numapgr                   := CdsCAP.FieldByName('NUMAPGR').asString;

    SelContaCor( Cds.FieldByName('IDFORCLI').AsFloat );
  end
  Else
  begin
    LimpaCAP;
  end;

  if mskNumNF.Visible Then
     mskNumNF.Text := Cds.FieldByName('NUMNF').AsString;
  SelItemNota( n );
end;




procedure TFrmMTRecebMerc.SelItemNota( n : Double);
begin
  if Modulo.sComSemOC = 'C' then
  begin
     SqlCdsItemsComOC.Prepare;
     SqlCdsItemsComOC.ParamByName('IDNFRECEBDEVOL').AsFloat := n;
     cdsItemNota.Data := SqlCdsItemsComOC.Data;
  end
  else
     CdsItemNota.Data := RecebMerc.GetItem( n );


  CdsAgregNFCompl.Data  := RecebMerc.ListAgregNFComplementar( n );

  cdsAgregItemTela.Data := RecebMerc.GetAgregItemForItem( n );

  CdsContab.Data        := RecebMerc.ListContabilizacao( Cds.FieldByName('PLNCODIGO').AsFloat );
end;




procedure TFrmMTRecebMerc.SetArtigo(sCodFisc: String);
var
   iAux      : LongInt;
   sDescProd : String;
begin
  inherited;
  iAux := -1;
  if not cdsItemNota.IsEmpty then
  begin
    if cdsArtigo.Locate('CODARTIGO', cdsItemNota.FieldByName('CODARTIGO').AsString,[]) Then
    begin
      if Modulo.sIntegraLivro = 'S' then
      begin
        cdsItemNota.FieldByName('CODFISCAL').AsString     := sCodFisc + cdsArtigo.FieldByName('CODFISCALPADRAO').AsString;
        if length(trim(cdsItemNota.Fields.FieldByName('CODFISCAL').AsString))<= 1 then
           cdsItemNota.Fields.FieldByName('CODFISCAL').AsString  := sCodFisc;
      end
      Else
          cdsItemNota.Fields.FieldByName('CODFISCAL').Clear;

      FrameAgregItem.CodProduto := cdsArtigo.FieldByName('CODPRODUTO').AsString;

      cdsItemNota.FieldByName('CODTIPRECDES').AsString    := Trim(cdsArtigo.FieldByName('CODTIPRECDES').AsString);
      cdsItemNota.FieldByName('RECPAG').AsString          := cdsArtigo.FieldByName('RECPAG').AsString;
      cdsItemNota.FieldByName('IDPESSOA').AsInteger       := cdsArtigo.FieldByName('IDPESSOA').AsInteger;
      cdsItemNota.FieldByName('CONSUMOREVENDA').AsString  := cdsArtigo.FieldByName('CONSUMOREVENDA').AsString;
      cdsItemNota.FieldByName('CODGRUPOPROD').AsString    := cdsArtigo.FieldByName('CODGRUPOPROD').AsString;

      if cdsArtigo.FieldByName('FLGVARIAVEL').asString = 'S' Then
        iAux := Modulo.ProdVari( sDescProd );
      if iAux > 0 Then
      begin
        cdsItemNota.FieldByName('IDPRODVARI').AsInteger := iAux;
        cdsItemNota.FieldByName('DESCPROD').AsString    := Copy(sDescProd,1,60);
      end
      Else
        cdsItemNota.FieldByName('IDPRODVARI').Clear;

    end;
  end;
end;




procedure TFrmMTRecebMerc.dblkpcmbArtigoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Modified And (Trim(dblkpcmbArtigo.Text) <> '') Then
  begin
    dblkpcmbDesc.LookupValue := dblkpcmbArtigo.LookupValue;
    SetArtigo( sCodFisc );
  end;
  dblcUnidMedida.text := '';
  dblcUnidMedida.LookupValue := '';
end;




procedure TFrmMTRecebMerc.dblkpcmbDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Modified And (Trim(dblkpcmbDesc.Text) <> '') Then
  begin
    dblkpcmbArtigo.LookupValue := dblkpcmbDesc.LookupValue;
    SetArtigo( sCodFisc );
  end;
  dblcUnidMedida.text := '';
  dblcUnidMedida.LookupValue := '';
end;




procedure TFrmMTRecebMerc.dblcUnidMedidaEnter(Sender: TObject);
begin
  inherited;
  cdsUnidMed.Data := UnMedida.ListUnMedida(CdsArtigo.FieldByName('CODPRODUTO').AsString );
end;




procedure TFrmMTRecebMerc.dbedValUNExit(Sender: TObject);
begin
  inherited;
  if Modulo.sComSemOC = 'C' then
  begin
     if UpperCase(TDBRealEdit(Sender).Name) = 'DBEDQTDEENT' then
     begin
        if Cds.State = dsInsert then
        begin
           if (dbedQtdeEnt.Value > cdsItemNota.FieldByName('QTDEPENDENTE').AsFloat) then
           begin
              MsgDlg('A quantidade informada é maior que a quantidade permitida para o recebimento desse produto' + #13 +
                     'Permitido: ' + FormatFloat('#,####0.0000', cdsItemNota.FieldByName('QTDEPENDENTE').AsFloat) + #13 +
                     'Informado: ' + dbedQtdeEnt.Text,'Erro',mtError,[mbOk],0);
              if dbedQtdeEnt.CanFocus then dbedQtdeEnt.SetFocus;
           end
        end
        else
        begin
           if (dbedQtdeEnt.Value > cdsItemNota.FieldByName('QTDEPEDIDA').AsFloat) then
           begin
              MsgDlg('A quantidade informada é maior que a quantidade permitida para o recebimento desse produto' + #13 +
                     'Permitido: ' + FormatFloat('#,####0.0000', cdsItemNota.FieldByName('QTDEPEDIDA').AsFloat) + #13 +
                     'Informado: ' + dbedQtdeEnt.Text,'Erro',mtError,[mbOk],0);
              if dbedQtdeEnt.CanFocus then dbedQtdeEnt.SetFocus;
           end
        end;
     end
  end;

  if Modulo.sFlgInfoValorUN = 'S' Then
  begin
     reValorTotal.Value := dbedQtdeEnt.Value * dbedValUN.Value;
     dbrgECA.SetFocus;
  end;
end;




procedure TFrmMTRecebMerc.reValorTotalExit(Sender: TObject);
begin
  inherited;
  if (Modulo.sFlgInfoValorUN = 'N') And (Not IsFloatZero(dbedQtdeEnt.Value)) Then
    begin
        dbedValUN.Value := reValorTotal.Value /dbedQtdeEnt.Value ;
        dbrgECA.SetFocus;
    end;
end;




procedure TFrmMTRecebMerc.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  dblcFornCli.SetFocus;
  //
  cds.FieldByName('DATAEMISNF').AsDateTime   := Date;
  cds.FieldByName('DATAENTDEVOL').AsDateTime := Date;
  //
  cds.FieldByName('IDNFRECEBDEVOL').AsFloat := RecebMerc.GetNextID;
  cds.FieldByName('FLGTIPONOTA').AsString   := 'R';

  SelItemNota(-1);

  Cds.FieldByName('DATAEMISNF').AsDateTime   := Date;
  Cds.FieldByName('DATAENTDEVOL').AsDateTime := Date;
  //
  cbEnglobParc.Checked    := False;
  dbclTipoDoc.LookupValue := Modulo.sCodTipoDoc;
  cbEnglobParc.Checked    := (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').asString = 'S');
  cbEnglobParc.Enabled    := ((CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').asString = 'A') Or (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').IsNull));

  mskNumNF.Visible        := ( ParamIntegra.MascaraNoDocum <> '');
  mskNumNF.Text           := '';
  dbenNumDoc.Visible      := Not mskNumNF.Visible;

  //Cássio - SOL 122419 KINTANA 601286 - Início
  numapgr := '';
  //Cássio - SOL 122419 KINTANA 601286 - Fim

  if Modulo.sComSemOC = 'C' Then
  begin
    Caption             := 'Recebimento de Mercadoria com O.C.';
    if  dbenNumDoc.Visible Then
    begin
      dbenNumDoc.TabOrder := 2;
      dbeCompl.TabOrder   := 1;
    end
    Else
    begin
      mskNumNF.TabOrder   := 2;
      dbeCompl.TabOrder   := 1;
    end;
  end
  Else
  begin
    Caption             := 'Recebimento de Mercadoria sem O.C.';
    if  dbenNumDoc.Visible Then
    begin
      dbenNumDoc.TabOrder := 1;
      dbeCompl.TabOrder   := 2;
    end
    Else
    begin
      mskNumNF.TabOrder   := 1;
      dbeCompl.TabOrder   := 2;
    end;
  end;
end;




procedure TFrmMTRecebMerc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor Then
     begin
        SelNota(StrToInt(MontaSelect.ValoresChave[0]));

        cdsItemNota.Last;
        iUltNumReserva := cdsItemNota.FieldByName('NUMRESERVA').AsInteger;
        cdsItemNota.First;

        mskNumNF.Visible   := False;
        dbenNumDoc.Visible := True;
     end;
     IdForCli:=  Cds.FieldByName('IDFORCLI').AsInteger;

end;




procedure TFrmMTRecebMerc.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcFornCli.SetFocus;
end;




procedure TFrmMTRecebMerc.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  pgclDadosItem.ActivePageIndex := 0;

  cdsItemNota.FieldByName('IDNFRECEBDEVOL').AsFloat         := cds.FieldByName('IDNFRECEBDEVOL').AsFloat;
  cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat          := RecebMerc.GetNextID;
  cdsItemNota.FieldByName('FLGDESTINO').AsString            := 'E';
  cdsItemNota.FieldByName('CODALMOXARIFADO').AsInteger      := Modulo.iCodAlmoxa;
  cdsItemNota.FieldByName('CODALMOXARIFADOLOGIN').AsInteger := Modulo.iCodAlmoxa;
  cdsItemNota.FieldByName('CODCENTROCUSTOLOGIN').AsString   := Modulo.sCodCCusto;
  cdsItemNota.FieldByName('CODCUSTEIOLOGIN').AsInteger      := Modulo.iCodCusteio;
  cdsItemNota.FieldByName('CODCUSTEIO').AsInteger           := cdsAlmox.FieldByName('CODCUSTEIO').AsInteger;
  cdsItemNota.FieldByName('VLRUNITARIO').AsFloat            := 0;
  reValorTotal.Value                                        := 0;
  cdsItemNota.FieldByName('CODCENTRORESPON').AsString       := '9999999999';
  cdsItemNota.FieldByName('UNIDNEGOC').AsInteger            := -1;

  if Modulo.sComSemOC = 'S' then
  begin
    cdsItemNota.FieldByName('IDPLANOPREV').asInteger := Modulo.iIdPlanoprev;
    cdsItemNota.FieldByName('IDPATRO').asInteger := Modulo.iIdPatro;
    cdsItemNota.FieldByName('IDPROGRAMA').asInteger := Modulo.iIdPrograma;
  end;

  if Modulo.sIntegraLivro = 'S' then
     cdsItemNota.FieldByName('CODFISCAL').AsString  := sCodFisc
  else
     cdsItemNota.FieldByName('CODFISCAL').Clear;


  SetAgregadosItem;

  dbrgECA.ItemIndex             := 0;
  pgclDadosItem.ActivePageIndex := 0;
  dblkpcmbDesc.SetFocus;
  lblDestEdit.Caption      := 'Almoxarifado Destino';
  dblkpcmbAlmoxa.BringToFront;

  AbreSqlCompOrc( iUltNumReserva );
  if cdsItemNota.state in [dsEdit, dsInsert] then
  begin
    cdsItemNota.FieldByName('IDRESERVAORCAMEN').Value := cdsCompOrc.FieldByName('IDRESERVAORCAMEN').Value;
    cdsItemNota.FieldByName('NUMRESERVA').Value       := cdsCompOrc.FieldByName('NUMRESERVA').Value;
    cdsItemNota.FieldByName('VLRRESERVA').Value       := cdsCompOrc.FieldByName('VLRRESERVA').Value;
  end;
  cdsCompOrc.Close;


end;




procedure TFrmMTRecebMerc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  RecebMerc.Free;
  Artigo.Free;
  Almox.Free;
  CentroCusto.Free;
  UnidNegocio.Free;
  CentRespon.Free;
  TipoRecebDesemb.Free;
  UnMedida.Free;
  AgregadoNota.Free;
  AgregadoItem.Free;
  TipoDocumento.Free;
  ClasFisc.Free;
  AlmoxCaf.Free;
  oDiasUteis.Free;
end;




procedure TFrmMTRecebMerc.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  pgclDadosItem.ActivePageIndex := 0;

  reValorTotal.Value := cdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat * CdsItemNota.FieldByName('VLRUNITARIO').AsFloat;

  if (cdsItemNota.FieldByName('FLGDESTINO').AsString = 'C') And
     ( Not cdsItemNota.FieldByName('CODCENTROCUSTO').IsNull) Then
  begin
    dblkpcmbAlmoxa.Enabled := False;
    lblDestEdit.Caption    := 'Centro de Custo Destino';
    dblcCCusto.BringToFront;
  end
  Else
  begin
    dblkpcmbAlmoxa.Enabled := True;
    lblDestEdit.Caption := 'Almoxarifado Destino';
    dblkpcmbAlmoxa.BringToFront;
  end;

  //--------------------------------------------------------------------------------------
  // Prepara os Agregado do item alimentando-o com os dados do cds que contem todos os
  // imposotos de todos os itens
  //--------------------------------------------------------------------------------------
  SetAgregItem( cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat );

  SetAgregadosItem;

  cdsAgregItemTela.First;
  While Not cdsAgregItemTela.EOF Do
  begin
    if FrameAgregItem.cdsAgregados.Locate('CODTIPOCUSTAGREG',cdsAgregItemTela.FieldByName('CODTIPOCUSTAGREG').AsFloat,[]) then
      MoveFields(cdsAgregItemTela,FrameAgregItem.cdsAgregados,opAlterar,false);

    cdsAgregItemTela.Next;
  end;

  FrameAgregItem.cdsAgregados.First;
  //--------------------------------------------------------------------------------------

  dblkpcmbArtigo.SetFocus;
end;




procedure TFrmMTRecebMerc.dblkpcmbAlmoxaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsItemNota.FieldByName('CODCUSTEIO').AsInteger := cdsAlmox.FieldByName('CODCUSTEIO').AsInteger;
end;




procedure TFrmMTRecebMerc.FrameAgregNotaedValorAgregExit(Sender: TObject);
begin
  inherited;
  //----------------------------------------------------------------------------------------------------
  //  Exibe o Form para inclusão dos dados da nota Complementar
  //----------------------------------------------------------------------------------------------------
  if (FrameAgregNota.cdsAgregados.FieldByName('CODTRATFISCE').AsString = '5') And
     (FrameAgregNota.cdsAgregados.FieldByName('VALOR').AsFloat <> 0 )
  Then
     begin
        if FrameAgregNota.cdsAgregados.FieldByName('IDNFCOMPLEMENTAR').AsInteger = 0 Then
           FrameAgregNota.cdsAgregados.FieldByName('IDNFCOMPLEMENTAR').AsInteger:= 999;

        CdsAgregNFCompl.First;
        While not CdsAgregNFCompl.EOF Do
           begin
              CdsAgregNFCompl.Edit;
              CdsAgregNFCompl.FieldByName('IDAGRNFRECDEV').AsInteger := FrameAgregNota.cdsAgregados.FieldByName('IDAGRNFRECDEV').AsInteger;
              CdsAgregNFCompl.Post;
              CdsAgregNFCompl.Next;
           end;
        //Ver como controlar mais de uma nf complementar
        //
        FrmMTNotaCompl := TFrmMTNotaCompl.Create(Self);
        FrmMTNotaCompl.FrameAgregados1.cdsAgregados.Data := RecebMerc.ListAgregNFComplementar(CdsAgregNotaTela.FieldByName('IDNFCOMPLEMENTAR').AsInteger);
        FrmMTNotaCompl.ShowModal;
     end
  Else
  if (FrameAgregNota.cdsAgregados.FieldByName('CODTRATFISCE').AsString = '5') And
     (FrameAgregNota.cdsAgregados.FieldByName('VALOR').AsFloat = 0 )
  Then
     begin
        CdsNFCompl.EmptyDataSet;
        CdsAgregNFCompl.EmptyDataSet;
     end;

  FrameAgregNota.edValorAgregExit(Sender);
end;



procedure TFrmMTRecebMerc.dbedDataValidadeExit(Sender: TObject);
begin
  inherited;
  FrameAgregItem.rValorMerc := reValorTotal.Value;
end;



procedure TFrmMTRecebMerc.SetAgregItem(IdItensRecDev: Double);
begin
   cdsAgregItemTela.Filter   := '';
   cdsAgregItemTela.Filtered := False;
   cdsAgregItemTela.Filter   := 'IDITENSRECDEV = '+FloatToStr(IdItensRecDev);
   cdsAgregItemTela.Filtered := True;
end;




procedure TFrmMTRecebMerc.CmeDetalheDelete(Sender: TObject);
begin
  SetAgregItem( cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat );

  cdsAgregItemTela.First;
  While Not cdsAgregItemTela.EOF Do
     cdsAgregItemTela.Delete;

  inherited;

end;




procedure TFrmMTRecebMerc.bbtnOkDetClick(Sender: TObject);
begin
  if CdsItemNota.State in DsEditModes Then
  begin
    CdsItemNota.FieldByName('DESCPROD').AsString  := dblkpcmbDesc.Text;
    CdsItemNota.FieldByName('VALORTOTAL').AsFloat := reValorTotal.Value;
  end;

  if cdsCentRespon.RecordCount = 1 Then
  begin
    cdsItemNota.FieldByName('CODCENTRORESPON').AsString := cdsCentRespon.FieldByName('CODCENTRORESPON').AsString;
  end
  Else
  if dblcCentRespon.Text = '' Then
  begin
    MsgDlg('Centro de Responsabilidade não pode ficar em branco !!','Aviso',mtWarning	,[mbOk ],0);
    Exit;
  end;

  inherited;

end;




procedure TFrmMTRecebMerc.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
  var vdocumento, vidforcli, vNodocumento : integer; //Higor Nayde SOL 188854 Kintana 1784331
begin
  if CtrlAvaliacaoFornec.FornecPassivo(Cds.FieldByName('IDFORCLI').AsInteger) then
    FazerAvaliacao;

  inherited;
  cdsAgregItemTela.Filter   := '';
  cdsAgregItemTela.Filtered := False;

  GravarCAP;

  VerifQtdeOC;

  VerifValTotAgerg;

  Accept := RecebMerc.Gravar( Sistema.IdEmpresa,
                              Sistema.UsaPlanoPatro,
                              Not chkCap.Checked,
                              Modulo.sIntegraContab = 'S',
                              Modulo.sIntegraLivro = 'S',
                              Sistema.IdModulo,
                              Sistema.IdUsuario,
                              Sistema.IdEspAcesso,
                              Modulo.iIdPatro,
                              Modulo.iIdPlanoPrev,
                              Modulo.iIdPrograma,
                              ParamIntegra.uNidNegoc,
                              (Modulo.sComSemOC = 'C'),
                              cbEnglobParc.Checked,
                              Modulo.sCodCCusto);
//Higor Nayde SOL 188854 Kintana 1784331 - Início
 vNodocumento := Cds.FieldByName('NUMNF').AsInteger;
  vidforcli  := Cds.FieldByName('IDFORCLI').AsInteger;

  vdocumento := CtrlAvaliacaoFornec.BuscaDocumento(vnodocumento,vidforcli);
  if(vdocumento <> 0) then begin
    CtrlAvaliacaoFornec.AtualizaAvaliacao(vnodocumento,vdocumento,
    strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(vidforcli)),vidforcli);
  end;

//Higor Nayde SOL 188854 Kintana 1784331 - Fim

  if Accept Then
  begin
    Modulo.iIdNota := Trunc(RecebMerc.IdNFRecebDevol);
    {SOL:189816 KTN:1793898 JRM6}
    GravarAlteradores;
    {SOL:189816 KTN:1793898 JRM6}
    if MsgDlg('Deseja fazer baixa direta','Confirmação',mtConfirmation,[mbYes,mbNo ],0) = mrYes Then
    begin
      AbrirFormModal(FrmMTBaixaDir,TFrmMTBaixaDir );
    end;
    LimpaCAP;
    AtualizaQtdeItens;
  end;
end;

procedure TFrmMTRecebMerc.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := RecebMerc.Excluir( IdNFRecebDevol,
                               Sistema.IdEspAcesso,
                               Sistema.IdUsuario,
                               Sistema.UsaPlanoPatro );
  if Accept then
     SelNota(-1);
end;




procedure TFrmMTRecebMerc.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);


var
   ERecebimentoComOC : boolean;
   vdocumento, vidforcli,vnodocumento : integer; //Higor Nayde SOL 188854 Kintana 1784331 

begin
  if CtrlAvaliacaoFornec.FornecPassivo(Cds.FieldByName('IDFORCLI').AsInteger) then
    FazerAvaliacao;

  inherited;
  CdsAgregItemTela.Filter   := '';
  CdsAgregItemTela.Filtered := False;

  ERecebimentoComOC := (Modulo.sComSemOC = 'C');

  GravarCAP;
  {SOL:189816 KTN:1793898 JRM6}
  GravarAlteradores;
  {SOL:189816 KTN:1793898 JRM6}
  VerifQtdeOC;

  VerifValTotAgerg;

  PreparaAlteracao;

  Accept := RecebMerc.Alterar( Sistema.IdEmpresa,
                               IdNFRecebDevol,
                               Sistema.UsaPlanoPatro,
                               Not chkCap.Checked,
                               Modulo.sIntegraContab = 'S',
                               Modulo.sIntegraLivro = 'S',
                               Sistema.IdModulo,
                               Sistema.IdUsuario,
                               Sistema.IdEspAcesso,
                               Modulo.iIdPatro,
                               Modulo.iIdPlanoPrev,
                               Modulo.iIdPrograma,
                               ParamIntegra.uNidNegoc,
                               ERecebimentoComOC,
                               cbEnglobParc.Checked,
                               Modulo.sCodCCusto);
//Higor Nayde SOL 188854 Kintana 1784331 - Início

    vnodocumento := Cds.FieldByName('NUMNF').AsInteger;
    vidforcli  := Cds.FieldByName('IDFORCLI').AsInteger;

	vdocumento := CtrlAvaliacaoFornec.BuscaDocumento(vnodocumento,vidforcli);
    if(vdocumento <> 0) then begin
      CtrlAvaliacaoFornec.AtualizaAvaliacao(vnodocumento,vdocumento,
      strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(vidforcli)),vidforcli);
    end;
//Higor Nayde SOL 188854 Kintana 1784331 - Fim
end;




procedure TFrmMTRecebMerc.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(RecebMerc.MessageInfo,'Erro',MtError,[mbOK],0);
end;




procedure TFrmMTRecebMerc.CmeDetalheConfirma(Sender: TObject);
begin

  if cdsItemNota.FieldByName('FLGDESTINO').AsString = 'E' then
  begin
    if trim( dblkpcmbAlmoxa.Text ) = '' then
    begin
      ShowMessage('O Campo "Almoxarifado Destino" tem que ser preenchido.');
      if dblkpcmbAlmoxa.Canfocus then dblkpcmbAlmoxa.SetFocus;
      dblkpcmbAlmoxa.text := '';
      dblkpcmbAlmoxa.LookupValue := '';
      exit;
    end;

    if cdsItemNota.State in [dsInsert, dsEdit] then
       cdsItemNota.FieldByName('CODCENTROCUSTO').AsString := cdsAlmox.FieldByName('CODCENTROCUSTO').AsString;
  end
  else
  begin
    if trim( dblcCCusto.Text ) = '' then
    begin
      ShowMessage('O Campo "Centro de Custo Destino" tem que ser preenchido.');
      if dblcCCusto.Canfocus then dblcCCusto.SetFocus;
      dblcCCusto.text := '';
      dblcCCusto.LookupValue := '';
      exit;
    end;

    if cdsItemNota.State in [dsInsert, dsEdit] then
       cdsItemNota.FieldByName('CODCENTROCUSTO').AsString := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
  end;

  if cdsItemNota.State in [dsInsert, dsEdit] then
  begin
     if cdsItemNota.FieldByName('CODCENTROCUSTO').IsNull then
       cdsItemNota.FieldByName('CODCENTROCUSTO').AsString := Modulo.sCCustoAlmoxa;
  end;

  if dblcUnidMedida.text = '' then
  begin
    showMessage('O Campo "Un. Med." tem que ser preenchido');
    if dblcUnidMedida.Canfocus then dblcUnidMedida.SetFocus;
    dblcUnidMedida.text := '';
    dblcUnidMedida.LookupValue := '';
    exit;
  end;

  FrameAgregItem.cdsAgregados.DisableControls;
  Try
     if cdsItemNota.State = dsInsert Then
        begin
            FrameAgregItem.cdsAgregados.First;
            While Not FrameAgregItem.cdsAgregados.EOF Do
               begin
                  if FrameAgregItem.cdsAgregados.FieldByName('VALOR').AsFloat <> 0 Then
                     MoveFields(FrameAgregItem.cdsAgregados,cdsAgregItemTela,opInserir,False);

                  FrameAgregItem.cdsAgregados.Next;
               end;
        end
     Else
     if cdsItemNota.State = dsEdit Then
        begin
            FrameAgregItem.cdsAgregados.First;
            While Not FrameAgregItem.cdsAgregados.EOF Do
               begin
                  if cdsAgregItemTela.Locate('CODTIPOCUSTAGREG',FrameAgregItem.cdsAgregados.FieldByName('CODTIPOCUSTAGREG').AsFloat,[]) then
                     MoveFields(FrameAgregItem.cdsAgregados,cdsAgregItemTela,opAlterar,False)
                  Else
                  if FrameAgregItem.cdsAgregados.FieldByName('VALOR').AsFloat <> 0 Then
                     MoveFields(FrameAgregItem.cdsAgregados,cdsAgregItemTela,opInserir,False);

                  FrameAgregItem.cdsAgregados.Next;
               end;
        end;
  Finally
     FrameAgregItem.cdsAgregados.EnableControls;
  end;

  iUltNumReserva := cdsItemNota.FieldByName('NUMRESERVA').AsInteger;

  inherited;
end;




procedure TFrmMTRecebMerc.FrameAgregItemedValorAgregExit(Sender: TObject);
begin
  inherited;
  FrameAgregItem.edValorAgregExit(Sender);
   if (FrameAgregItem.cdsAgregados.EOF ) And (ActiveControl.Tag <> 999) Then
     begin
        pgclDadosItem.ActivePageIndex := 2;
        pgclDadosItem.ActivePage      := tbsIntegraCAP;
     end;
end;




procedure TFrmMTRecebMerc.BtnBuscaContaCorClick(Sender: TObject);
begin
  inherited;
   MsContaCor.Filtro.Clear;
   MsContaCor.Filtro.Add('PESSOA.IDPESSOA = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDPESSOA = ' + FloatToStr(dblcFornCli.ForCliReg.Id));
   if MsContaCor.Executar = MrOk Then
      begin
        ParcIDCBANCARIA          := StrToInt(MsContaCor.ValoresChave[0]); //CONTABANCARIA.IDCBANCARIA
        edtBanco.Text            := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
        edtAgencia.Text          := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
        edtConta.Text            := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
        lblDescTipoConta.Caption := MsContaCor.ValoresChave[5]; //Descricao do CONTABANCARIA.TIPOCONTA
      end;
end;




procedure TFrmMTRecebMerc.GravarCAP;
var
  vObjAlteradores: tCtrlAlteradorImpostos;
  Numdocum : Integer;

begin
  CdsCAP.Append;
  CdsCAP.FieldByName('HISTORICOCOMPL').asString    := EdHist.Text;
  CdsCAP.FieldByName('NUMLEITCODBARRAS').asString  := edCodBarra.Text;
  CdsCAP.FieldByName('NUMDIGCODBARRAS').asString   := EdLinhaDig.Text;
  CdsCAP.FieldByName('CODFORMA').asString          := DblcCodForma.LookupValue;
  CdsCAP.FieldByName('OBS').asString               := memObsCap.Text;
  CdsCAP.FieldByName('REFERENCIA').asString        := edRef.Text;
  CdsCAP.FieldByName('CODPORTFORMA').asString      := dblcPortForma.LookupValue;
  CdsCAP.FieldByName('CODTIPDOC').asString         := dbclTipoDoc.LookupValue;
  CdsCAP.FieldByName('NUMAPGR').asString           := numApGR;
  CdsCAP.FieldByName('IDCBANCARIA').asInteger      := CdsAux.FieldByName('IDCBANCARIA').asInteger;
  CdsCAP.Post;
end;

procedure TFrmMTRecebMerc.VerifValTotAgerg;
begin
  CdsValTotAgreg.Data := RecebMerc.ListChecaValorTotal;

  if not CdsValTotAgreg.IsEmpty then
    AbrirFormModal( FrmMTValTotAgreg,TFrmMTValTotAgreg );
end;

procedure TFrmMTRecebMerc.SetAgregadosItem;
begin
  //--------------------------------------------------------------------------------------
  // Prepara os Agregado do item
  //--------------------------------------------------------------------------------------
  FrameAgregItem.cdsAgregados.Data := CdsAgregAux.Data;

  FrameAgregItem.cdsAgregados.DisableConstraints;
  Try
    FrameAgregItem.cdsAgregados.First;
    While Not FrameAgregItem.cdsAgregados.EOF Do
    begin
      FrameAgregItem.cdsAgregados.Edit;
      FrameAgregItem.cdsAgregados.FieldByName('IDITENSRECDEV').AsFloat := cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat;
      FrameAgregItem.cdsAgregados.Post;
      FrameAgregItem.cdsAgregados.Next;
    end;
  Finally
    FrameAgregItem.cdsAgregados.First;
    FrameAgregItem.cdsAgregados.EnableConstraints;
  end;

end;




procedure TFrmMTRecebMerc.dbclTipoDocCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) And ( Trim(dbclTipoDoc.Text) <> '' ) Then
     begin
        cbEnglobParc.Checked := (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').asString = 'S');
        cbEnglobParc.Enabled := ((CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').asString = 'A') Or (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').IsNull));
     end;
end;




procedure TFrmMTRecebMerc.dblcFornCliExit(Sender: TObject);
begin
  inherited;
  if (Cds.State in ([dsInsert,dsEdit])) And (ActiveControl.Tag <> 999) Then
  begin
    if Trim(dblcFornCli.Text) <> '' Then
    begin
      if ParamIntegra.IntegraContab then
      begin
        dblcFornCli.Valida;
        if trim(dblcFornCli.ForCliReg.CContabil) = '' then
        begin
          MsgDlg('Como a contabilidade está integrada, é obrigatório preencher a conta contabil deste Favorecido','Erro',mtError,[mbOk],0);
          bbtnCancelar.Click;
          exit;
        end;
      end;

      sCodFisc := RecebMerc.MontaClassFiscal(SIstema.IdEmpresa,dblcFornCli.ForCliReg.Id);

      GetEstado( dblcFornCli.ForCliReg.Id );

      if ParamIntegra.AssociaComplTipoFat Then
      begin
        Cds.FieldByName('COMPLNF').asString := ParamIntegra.BuscaCodigoFiscalReduzido(dblcFornCli.ForCliReg.Id);
        dbeCompl.Text                       := ParamIntegra.BuscaCodigoFiscalReduzido(dblcFornCli.ForCliReg.Id);
        dbeCompl.Enabled                    := False;
        if Trim(dbeCompl.Text) =  '' Then
        begin
          MsgDlg('Fornecedor não possui Classificação Fiscal','Erro',MtError,[mbOK],0);
          bbtnCancelar.Click;
          Exit;
        end;
      end;

      if (Cds.State = dsInsert) And (Modulo.sComSemOC = 'C') Then
      begin
        spOC.Prepare;
        spOC.ParamByName('pForne').AsFloat   := dblcFornCli.ForCliReg.Id;
        spOC.ParamByName('pEmpresa').AsFloat := Sistema.idEmpresa;

        CdsOC.Data := spOC.Data;
        if CdsOC.IsEmpty Then
        begin
          MsgDlg('Não existe nenhuma OC pendente de entrega para este fornecedor. Faça recebimento sem O.C.','Atenção',MtWarning,[mbOK],0);
          bbtnCancelar.Click;
          exit;
        end;

        //Apaga do CDS as OC's já incluídas
        if not cdsItemNota.IsEmpty then
        begin
          CdsOC.First;
          while not CdsOC.Eof do
          begin
            if cdsItemNota.Locate( 'NUMOC', CdsOC.FieldByName('NumOC').AsInteger, [] ) = True then
            begin
              CdsOC.Delete;
              CdsOC.First;
            end;
            CdsOC.Next;
          end;
        end;

        AbrirFormModal(FrmMTOCxForn,TFrmMTOCxForn);
        FrmMTOCxForn.Release;
        cdsItemNota.First;
        reValorTotal.Value := 0;
        while not cdsItemNota.EOF Do
        begin
          cdsItemNota.Edit;
          if Modulo.sComSemOC = 'C' then
          begin
            if trim(CdsItemNota.fieldByName('NUMOC').asString) = '' then
              CdsItemNota.fieldByName('NUMOC').asString := '0';
            if CdsOc.Locate('NUMOC;CODARTIGO', VarArrayOf([CdsItemNota.fieldByName('NUMOC').asString, CdsItemNota.fieldByName('CODARTIGO').asString]), []) then
            begin
              // se a moeda da cotação for diferente da moeda corrente
              if (CdsOc.fieldByName('MOECODIGO').asInteger <> 0) and
                 (CdsOc.fieldByName('MOECODIGO').asInteger <> cdsParamGlobal.FieldByName('MOEDACORRENTE').asInteger) then
                cdsItemNota.FieldByName('VLRUNITARIO').asFloat := CalculaCotacao(Cds.FieldByName('DATAEMISNF').asDateTime, CdsOC.FieldByName('PRECO').asFloat,
                                                                                 CdsOc.fieldByName('MOECODIGO').asInteger);
            end;
          end;
          cdsItemNota.FieldByName('CODALMOXARIFADOLOGIN').AsInteger := Modulo.iCodAlmoxa;
          SetArtigo(cdsItemNota.FieldByName('CODFISCAL').AsString);
          CdsItemNota.FieldByName('VALORTOTAL').AsFloat := cdsItemNota.FieldByName('VLRUNITARIO').asFloat * cdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat;
          cdsItemNota.Post;
          reValorTotal.Value := reValorTotal.Value + (cdsItemNota.FieldByName('VLRUNITARIO').asFloat * cdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat);
          dbeValorCorrente.value := reValorTotal.Value;
          cdsItemNota.next;
        end;
        CmeDetalhe.AtualizaBotoes(Self);
      end;
    end;

    if dblcFornCli.Text <> '' then
      SelContaCor(dblcFornCli.ForCliReg.Id)
    else
    begin
      edtBanco.Clear;
      edtAgencia.Clear;
      edtConta.Clear;
      lblDescTipoConta.Caption := '- - - - - - - - - - - - ';
    end;

  end;
  Application.ProcessMessages;
  if dbenNumDoc.CanFocus then dbenNumDoc.SetFocus;
end;

procedure TFrmMTRecebMerc.SelContaCor(IdPessoa: Double);
var
  _cdsContaCor: TClientDataSet;

begin
   try

      _cdsContaCor := TClientDataSet.Create(nil);

      spContaCor.Prepare;

      spContaCor.ParamByName('IDPESSOA').AsFloat := IdPessoa;
      spContaCor.ClientDataSet := _cdsContaCor;
      spContaCor.Open;

      cdsAux.Data := _cdsContaCor.Data;

      cdsAux.Filtered   := False;
      cdsAux.Filter     := '((NUMBANCO <> '''') AND (NUMAGENCIA <> '''') AND (CONTACORRENTE <> ''''))';
      cdsAux.Filtered := True;

      if cdsAux.RecordCount > 1 then
         cdsAux.first;

      edtBanco.Text              := CdsAux.FieldByName('NUMBANCO').AsString; //BANCO.NUMBANCO
      edtAgencia.Text            := CdsAux.FieldByName('NUMAGENCIA').AsString; //AGENCIABANCARIA.NUMAGENCIA
      edtConta.Text              := CdsAux.FieldByName('CONTACORRENTE').ASString; //CONTABANCARIA.CONTACORRENTE
      lblDescTipoConta.Caption   := CdsAux.FieldByName('DESCTIPOCONTA').AsString; //CONTABANCARIA.TIPOCONTA
   finally
      FreeAndNil(_cdsContaCor);
   end;
end;




procedure TFrmMTRecebMerc.dbrgECAExit(Sender: TObject);
var
   IdGrupo : Double;
begin
  inherited;
  if dbrgECA.ItemIndex = 1 Then
  begin
    dblkpcmbAlmoxa.Enabled := False;
    if CdsItemNota.FieldByName('CODCENTROCUSTO').IsNull Then
    begin
       dblcCCusto.Text := '';
       dblcCCusto.LookupValue := '';
    end;
    lblDestEdit.Caption := 'Centro de Custo Destino';
    dblcCCusto.BringToFront;
    dblcCCusto.SetFocus;
    idGrupo := Artigo.GetGrupoBem( CdsItemNota.FieldByName('CODARTIGO').asString );
    if IdGrupo <= 0 Then
    begin
      MsgDlg('Este item não pode ser destinado para Ativo Fixo','Atenção',MtWarning,[mbOK],0);
      pgclDadosItem.ActivePage:= tbsDadosGerais;
      dbrgECA.ItemIndex := 0;
      dbrgECA.SetFocus;
      Exit;
    end;
    With CdsAtivoFixo Do
    begin
      if Not Active Then
      begin
        Data := AlmoxCAF.ListarAlmoxCAF(Sistema.IdEmpresa, CdsItemNota.FieldByName('IDITENSRECDEV').AsFloat);
      end;
      if Not Locate('IDITENSRECDEV',CdsItemNota.FieldByName('IDITENSRECDEV').AsFloat,[]) Then
      begin
        Append;
        FieldByName('IDITENSRECDEV').AsFloat   := CdsItemNota.FieldByName('IDITENSRECDEV').AsFloat;
        FieldByName('IDFORNSERV').asInteger    := dblcFornCli.ForCliReg.Id;
        FieldByName('IDPESSOA').asInteger      := Sistema.IdEmpresa;
        FieldByName('IDMODULO').asInteger      := Sistema.IdModulo;
        FieldByName('IDGRUPO').AsFloat         := idGrupo;
        FieldByName('DESBEM').asString         := dblkpcmbDesc.Text;
        FieldByName('IDNOTA').asFloat          := dbenNumDoc.Value;
        FieldByName('COMPLNOTA').asString      := dbeCompl.Text;
        FieldByName('DTANOTA').asString        := dbeDataLanc.Text;
        FieldByName('DTAINCLUSAO').asString    := dbeDataLanc.Text;
        FieldByName('VALORG').asFloat          := dbedValUN.Value;
        FieldByName('QUANTIDADE').asFloat      := dbedQtdeEnt.Value;
        Post;
      end;
    end;
    Application.CreateForm( TFrmMTCadAlmoxCaf,FrmMTCadAlmoxCaf );
    FrmMTCadAlmoxCaf.dsAlmoxCAF.DataSet := CdsAtivoFixo;
    FrmMTCadAlmoxCaf.ShowModal;
    FrmMTCadAlmoxCaf.Release;
  end
  Else
  if dbrgECA.ItemIndex = 0 Then
  begin
    dblkpcmbAlmoxa.Enabled := True;
    lblDestEdit.Caption := 'Almoxarifado Destino';
    dblkpcmbAlmoxa.BringToFront;
    dblkpcmbAlmoxa.SetFocus;
  end
  Else
  if dbrgECA.ItemIndex = 2 Then
  begin
    if CdsItemNota.FieldByName('CODCENTROCUSTO').IsNull Then
    begin
      dblcCCusto.Text := '';
      dblcCCusto.LookupValue := '';
    end;
    lblDestEdit.Caption := 'Centro de Custo Destino';
    dblcCCusto.BringToFront;
    dblcCCusto.SetFocus;
  end;
end;




procedure TFrmMTRecebMerc.PreparaAlteracao;
begin
  cdsItemNota.DisableControls;
  Try
    cdsItemNota.First;
    While Not cdsItemNota.EOF Do
    begin
      cdsItemNota.Edit;
      cdsItemNota.FieldByName('CODALMOXARIFADOLOGIN').AsInteger := Modulo.iCodAlmoxa;
      cdsItemNota.FieldByName('CODCENTROCUSTOLOGIN').AsString   := Modulo.sCodCCusto;
      cdsItemNota.FieldByName('CODCUSTEIOLOGIN').AsInteger      := Modulo.iCodCusteio;
      if Modulo.sIntegraLivro <> 'S' then
        cdsItemNota.FieldByName('CODFISCAL').Clear;

      if cdsAlmox.Locate('CODALMOXARIFADO',cdsItemNota.FieldByName('CODALMOXARIFADO').AsFloat,[]) Then
        cdsItemNota.FieldByName('CODCUSTEIO').AsInteger := cdsAlmox.FieldByName('CODCUSTEIO').AsInteger;

      cdsItemNota.Post;
      cdsItemNota.Next;
    end;
  Finally
    cdsItemNota.EnableControls;
  end;
end;

procedure TFrmMTRecebMerc.dbeValorCorrenteExit(Sender: TObject);
begin
  inherited;
  FrameAgregNota.rValorMerc := dbeValorCorrente.Value;
end;


procedure TFrmMTRecebMerc.VerifQtdeOC;
var
  qtdPedidaTotal, qtdRecebidaTotal: extended;
begin
  if Modulo.sComSemOC = 'C' Then
  begin
    cdsItemNota.First;
    while (not cdsItemNota.Eof) do
    begin
      cdsItemNota.Edit;

      cdsItemNota.FieldByName('FLGPARCTOT').AsString := MarcaParcialTotal(qtdPedidaTotal, qtdRecebidaTotal);

      if (cdsItemNota.FieldByName('FLGPARCTOT').AsString = 'F') then
      begin
        if MsgDlg('Quantidade recebida [' + cdsItemNota.FieldByName('QTDERECEBDEVOL').AsString + ']' + ' do item ' +
                   cdsItemNota.FieldByName('DESCPROD').AsString +
                   ' é menor que a quantidade'+ #13#10 +'total solicitada [' + FloatToStr(qtdPedidaTotal) + ']' +
                   ' na OC. Deixar pendente a quantidade restante','Confirmação' ,mtConfirmation,[mbYes,mbNo],0) = mrNo then
          cdsItemNota.FieldByName('FLGPARCTOT').AsString := 'T'
        else
          cdsItemNota.FieldByName('FLGPARCTOT').AsString := 'F';
      end;

      cdsItemNota.Post;
      cdsItemNota.Next;
    end;
  end;

end;


procedure TFrmMTRecebMerc.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  iTotalReserva : extended;
begin
   Accept := True;
   // ----------------------------------------------------------------------------------------------

   if (Trim(Cds.FieldByName('NUMNF').AsString) = '0')  then
   begin
      MsgDlg('Informe o número da nota fiscal!','Aviso',mtWarning,[mbOk],0);
      Accept := False;
      Abort;
   end;

   AtualizaQtdeItens;

   if IsFloatZero(cds.FieldByName('VLRNOTAFISCAL').AsFloat) then
   begin
      if MsgDlg('Nota com valor zero. Confirma que é uma nota de bonificação ?', 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      begin
         Repaint;
         if dbeValorCorrente.CanFocus then dbeValorCorrente.SetFocus;
         Accept := False;
         Abort;
      end;
      Repaint;
   end;

  if bFLGINTEGRAORC then
  begin
    iTotalReserva := 0;
    cdsItemNota.First;
    while not cdsItemNota.Eof do
    begin
      if cdsItemNota.FieldByName('IDRESERVAORCAMEN').IsNull then
      begin
        MsgDlg('É necessário indicar um Compromisso Orçamentário!', 'Atenção', mtWarning, [mbOk], 0);
        Repaint;
        Accept := False;
        Abort;
      end;
      iTotalReserva := iTotalReserva + cdsItemNota.FieldByName('VLRRESERVA').AsFloat;
      cdsItemNota.Next;
    end;

    if iTotalReserva > 0 then
    begin
      if ( Arredonda( dbeValorCorrente.Value, 2 ) > Arredonda( iTotalReserva, 2 ) ) then
      begin
         MsgDlg('O valor total da nota é maior que o valor do Compromisso Orçamentário!', 'Atenção', mtWarning, [mbOk], 0);
         Repaint;
         Accept := False;
         Abort;
      end;
    end;
  end;

  if ( not oDiasUteis.DiaUtil(Sistema.IdEmpresa, cds.FieldByName('DATAVENCTO').AsDateTime ,True,False,False) ) then
  begin
    MsgDlg('Data de vencimento não é dia útil', 'Atenção', mtWarning, [mbOk], 0);
    Accept := False;
    Abort;
  end;
end;



procedure TFrmMTRecebMerc.GetEstado(IdForCli: Double);
begin
  With TClientDataSet.Create(self) Do
  Try
    spGetEstado.Prepare;
    spGetEstado.ParamByName('IDFORCLI').AsFloat := IdForCli;
    Data := spGetEstado.Data;

    FrameAgregItem.CodEstado := FieldByName('CODESTADO').AsString;
    FrameAgregItem.IdPais    := FieldByName('IDPAIS').AsFloat;
    {SOL:189816 KTN:1793898 JRM6}
    v_CodDocumento           := FieldByName('NUMDOCUMENTO').AsString;
    {SOL:189816 KTN:1793898 JRM6}
  Finally
    Free;
  end;
end;




procedure TFrmMTRecebMerc.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if cdsCentRespon.RecordCount = 1
    Then dblcCentRespon.Text := cdsCentRespon.FieldByName('NOME').AsString;
end;




procedure TFrmMTRecebMerc.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if cdsCentRespon.RecordCount = 1
    Then dblcCentRespon.Text := cdsCentRespon.FieldByName('NOME').AsString;
end;




procedure TFrmMTRecebMerc.dblkpcmbDescChange(Sender: TObject);
begin
  inherited;
  dblcUnidMedida.text := '';
  dblcUnidMedida.LookupValue := '';
end;




procedure TFrmMTRecebMerc.dblcUnidMedidaDropDown(Sender: TObject);
begin
  inherited;
  dblcUnidMedida.text := '';
  dblcUnidMedida.LookupValue := '';
end;




procedure TFrmMTRecebMerc.BtnOrcamentoClick(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  if MsResORc.RetornouValor then
  begin
    cdsItemNota.FieldByName('IDRESERVAORCAMEN').Value := StrToInt(   MsResORc.ValoresChave[0] );
    cdsItemNota.FieldByName('NUMRESERVA').Value       := StrToInt(   MsResORc.ValoresChave[1] );
    cdsItemNota.FieldByName('VLRRESERVA').Value       := StrToFloat( MsResORc.ValoresChave[2] );
  end;
end;



function TFrmMTRecebMerc.CalculaCotacao(dataCotacao: TdateTime; valorAnterior: Extended; moeCodigo: integer): Extended;
var FatorOM : Extended;
begin
  result := 0;
  try
    FatorOM := FuncaoGeral.TestaCotacaoMoeda( moeCodigo, dateToStr(dataCotacao),'N');
  except
    FatorOM := FuncaoGeral.TestaCotacaoMoeda( moeCodigo, dateToStr(date),'N');
  end;
  if FatorOM > 0 then
    result :=  valorAnterior * FatorOM;
end;

procedure TFrmMTRecebMerc.LimpaCAP;
begin
   EdHist.Clear;
   edCodBarra.Clear;
   EdLinhaDig.Clear;
   memObsCap.Lines.Clear;
   edRef.Clear;
   DblcCodForma.text    := '';
   dblcPortForma.text   := '';
   cbEnglobParc.Checked := False;
   numapgr              :=  '';
   dbclTipoDoc.text     := '';
   edtBanco.Text        := '';
   edtAgencia.Text      := '';
   edtConta.Text        := '';
end;




procedure TFrmMTRecebMerc.dbeDataEmiChange(Sender: TObject);
begin
   inherited;

   if cdsItemNota.IsEmpty = true then
     exit;

   reValorTotal.Value := 0;
   cdsItemNota.First;
   cdsItemNota.DisableControls;

   while (cdsItemNota.EOF = false) and (cdsOc.EOF = false) do
   begin
     cdsItemNota.Edit;
     if Modulo.sComSemOC = 'C' then
     begin
       if trim(CdsItemNota.fieldByName('NUMOC').asString) = '' then
         CdsItemNota.fieldByName('NUMOC').asString := '0';
       if CdsOc.Locate('NUMOC;CODARTIGO', VarArrayOf([CdsItemNota.fieldByName('NUMOC').asString, CdsItemNota.fieldByName('CODARTIGO').asString]), []) then
       begin
         // se a moeda da cotação for diferente da moeda corrente
         if (CdsOc.fieldByName('MOECODIGO').asInteger <> 0) and
            (CdsOc.fieldByName('MOECODIGO').asInteger <> cdsParamGlobal.FieldByName('MOEDACORRENTE').asInteger) then
         begin
           cdsItemNota.FieldByName('VLRUNITARIO').asFloat := CalculaCotacao(dbeDataEmi.Date, CdsOC.FieldByName('PRECO').asFloat,
                                                                            CdsOc.fieldByName('MOECODIGO').asInteger);
         end;
       end;
       reValorTotal.Value := reValorTotal.Value + (cdsItemNota.FieldByName('VLRUNITARIO').asFloat * cdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat);
       dbeValorCorrente.value := reValorTotal.Value;
       CdsItemNota.FieldByName('VALORTOTAL').AsFloat := cdsItemNota.FieldByName('VLRUNITARIO').asFloat * cdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat;
       cdsItemNota.FieldByName('CODALMOXARIFADOLOGIN').AsInteger := Modulo.iCodAlmoxa;

       CdsItemNota.Post;
     end;
     cdsItemNota.Next;
   end; // while
   cdsItemNota.EnableControls;

end;




function TFrmMTRecebMerc.Arredonda(fValor: extended; iDecimais: word): extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;




procedure TFrmMTRecebMerc.dbedtNumReservaExit(Sender: TObject);
var
  iNumReserva : integer;
begin
  inherited;

  if dbedtNumReserva.Text = '' then
  begin
    cdsItemNota.FieldByName('IDRESERVAORCAMEN').Clear;
    cdsItemNota.FieldByName('NUMRESERVA').Clear;
    cdsItemNota.FieldByName('VLRRESERVA').Clear;
    exit;
  end;

  if cdsItemNota.FieldByName('NUMRESERVA').NewValue <> cdsItemNota.FieldByName('NUMRESERVA').OldValue then
  begin

    iNumReserva := StrToIntDef( dbedtNumReserva.Text, -1 );

    cdsItemNota.FieldByName('IDRESERVAORCAMEN').Clear;
    cdsItemNota.FieldByName('NUMRESERVA').Clear;
    cdsItemNota.FieldByName('VLRRESERVA').Clear;

    AbreSqlCompOrc( iNumReserva );

    if cdsCompOrc.IsEmpty then
    begin
      ShowMessage('Compromisso orçamentário não encontrado.');
      dbedtNumReserva.Clear;
      dbedtNumReserva.SetFocus;
      cdsCompOrc.Close;
      exit;
    end;

    cdsItemNota.FieldByName('IDRESERVAORCAMEN').Value := cdsCompOrc.FieldByName('IDRESERVAORCAMEN').Value;
    cdsItemNota.FieldByName('NUMRESERVA').Value       := cdsCompOrc.FieldByName('NUMRESERVA').Value;
    cdsItemNota.FieldByName('VLRRESERVA').Value       := cdsCompOrc.FieldByName('VLRRESERVA').Value;

    cdsCompOrc.Close;
  end;
end;

procedure TFrmMTRecebMerc.AbreSqlCompOrc(iId: integer);
begin
  cdsCompOrc.Close;
  SqlCompOrc.SQL.Text :=
   ' SELECT ' +
   '    RESERVAORCAMEN.IDRESERVAORCAMEN, ' +
   '    RESERVAORCAMEN.NUMRESERVA, ' +
   '    RESERVAORCAMEN.VLRRESERVA ' +
   ' FROM ' +
   '    RESERVAORCAMEN, ' +
   '    RADINSTPROCESSO, ' +
   '    CONTASORCAMEN ' +
   ' WHERE ' +
   '    ( RESERVAORCAMEN.FLGRESERVA = ''A'' ) AND ' +
   '    ( RESERVAORCAMEN.FLGRESCOMP = ''C'' ) AND ' +
   '    ( RADINSTPROCESSO.IDPROCESSO(+) = RESERVAORCAMEN.IDPROCESSO ) AND ' +
   '    ( ((RADINSTPROCESSO.FLGOK = ''S'')  OR (RADINSTPROCESSO.FLGOK IS NULL)) ) AND ' +
   '    ( CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN ) AND ' +
   '    ( CONTASORCAMEN.IDPLANOORCAMEN = RESERVAORCAMEN.IDPLANOORCAMEN ) AND ' +
   '    ( RESERVAORCAMEN.NUMRESERVA = ' + IntToStr( iId ) + ' ) ';
  SqlCompOrc.Open;
end;




procedure TFrmMTRecebMerc.CdsOCAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALORUN')).DisplayFormat := '#,##0.00;#,(##0.00)';
end;




procedure TFrmMTRecebMerc.cdsItemNotaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VLRUNITARIO')).DisplayFormat := '#,##0.00;#,(##0.00)';
  TFloatField(DataSet.FieldByName('VLRESTOQUE')).DisplayFormat  := '#,##0.00;#,(##0.00)';
  TFloatField(DataSet.FieldByName('VALORTOTAL')).DisplayFormat  := '#,##0.00;#,(##0.00)';
end;

procedure TFrmMTRecebMerc.AtualizaQtdeItens;
var
  rSomaItensNota: extended;
begin
  {**
     Para que a totalização esteja 100% automática será necessário contabilizar os agrega-
     dos dos itens da nota fiscal...

     Implementar futuramente.
  **}



  {**
      Totaliza a nota automaticamente somente se valor = 0. Respeita o valor da nota
      lançada manualmente pelo usuário.
  **}

  if (IsFloatZero(cds.FieldByName('VLRNOTAFISCAL').AsFloat)) then
  begin
     // Soma o valor dos itens da nota
     rSomaItensNota := 0;

     cdsItemNota.DisableControls;
     cdsItemNota.First;
     while not cdsItemNota.Eof do
     begin
       rSomaItensNota := rSomaItensNota + cdsItemNota.FieldByName('VALORTOTAL').AsFloat;
       cdsItemNota.Next;
     end;
     cdsItemNota.EnableControls;

     if cds.State in [dsInsert, dsEdit] then
       cds.FieldByName('VLRNOTAFISCAL').AsFloat := rSomaItensNota;
  end;

end;

function TFrmMTRecebMerc.MarcaParcialTotal(out qtdPedida: extended; out qtdRecebida: extended): string;
var
  cdsTotalItemOc: TClientDataSet;

begin
   cdsTotalItemOc      := TClientDataSet.Create(nil);
   cdsTotalItemOc.Data := RecebMerc.ObtemArtigoNaOC(cdsItemNota.FieldByName('IDITEMOC').AsFloat);

   { Com este teste detecto se o mesmo artigo tem mais de uma
     solicitação de compra para esta OC. }

   // Para evitar a mensagem de itens pendentes, caso o usuário receba todos os itens da OC de uma só vez (única nota)
   if (UsuarioRecebeuTotalDoArtigoNaOC(cdsItemNota.FieldByName('CODARTIGO').AsString,
                                       cdsTotalItemOC.FieldByName('QTDEPEDIDA').AsFloat)) then
   begin
      Result := 'T';
      sArtigosLidos := sArtigosLidos + ',' + cdsItemNota.FieldByName('CODARTIGO').AsString;
   end
   else
   begin
     // situação onde a quantidade total da OC é igual ao total do item na solicitação.
     if IsFloatZero(cdsTotalItemOc.FieldByName('QTDEPEDIDA').AsFloat -
                    cdsTotalItemOc.FieldByName('QTDERECEBIDA').AsFloat) then
        Result := 'T'

     { Significa que a quantidade Total da OC é maior que o item da solicitação,
       casos onde podem existir mais de uma solicitação no mesmo processo de
       compras para o mesmo item de artigo.}
     else if (not IsFloatZero(cdsTotalItemOc.FieldByName('QTDEPEDIDA').AsFloat -
                         cdsTotalItemOc.FieldByName('QTDERECEBIDA').AsFloat -
                         cdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat)) then
                         Result := 'F';

     qtdPedida   := cdsTotalItemOC.FieldByName('QTDEPEDIDA').AsFloat;
     qtdRecebida := cdsTotalItemOc.FieldByName('QTDERECEBIDA').AsFloat;
   end;

   FreeAndNil(cdsTotalItemOC);
end;

function TFrmMTRecebMerc.UsuarioRecebeuTotalDoArtigoNaOC(
  sCodArtigo: string; qtdePedida: extended): boolean;
var
  bmMarcador: TBookMark;
  qtdeRecebida: extended;
begin

  // evita percorrer desnecessariamente o dataset.
  if (Pos(cdsItemNota.FieldByName('CODARTIGO').AsString, sArtigosLidos) > 0) then
  begin
     Result := True;
     exit;
  end;

  qtdeRecebida := 0;
  bmMarcador := cdsItemNota.GetBookMark;

  Result := False;

  try

    cdsItemNota.Disablecontrols;
    cdsItemNota.First;
    while (not cdsItemNota.Eof) do
    begin
       if (cdsItemNota.FieldByName('CODARTIGO').AsString <> sCodArtigo) then
       begin
          cdsItemNota.Next;
          Continue;
       end;

       // Neste momento não existe no banco de dados as quantidades, somente em tela (no cash do ClientDataSet)
       qtdeRecebida := qtdeRecebida + cdsItemNota.FieldByName('QTDERECEBDEVOL').AsFloat;
       cdsItemNota.Next;
    end;
  finally
       cdsItemNota.GotoBookMark(bmMarcador);

       // voltar para a edição do dataset.
       cdsItemNota.Edit;
       cdsItemNota.FreeBookMark(bmMarcador);
  end;

  cdsItemNota.EnableControls;

  // quantidade recebida do artigo na tela... é igual a quantidade pedida na OC.
  Result := FloatsEqual(qtdeRecebida, qtdePedida);
end;

procedure TFrmMTRecebMerc.CmeDetalheFind(Sender: TObject);
begin
  inherited;
  //Vinicius Maciel - SOL 163982/6901 - KTN 1472467
  if((dblcAtividade.Text = '') and (dblcAtividade.LookupValue <> '')) then
  dblcAtividade.Text := UnidNegocio.recuperaAtividadePerd(dblcAtividade.LookupValue)
  //Vinicius Maciel - SOL 163982/6901 - KTN 1472467 - FIM
end;

procedure TFrmMTRecebMerc.AbrirAvaliacao;
var
  frmCadForneAvalia: TfrmCadForne;
begin
  Application.CreateForm(TFrmCadForne, frmCadForneAvalia);
  if frmCadForneAvalia.FormStyle <> fsNormal then
  begin
    frmCadForneAvalia.FormStyle := fsNormal;
    frmCadForneAvalia.Visible := False;
  end;

  frmCadForneAvalia.nConsModulo:= 4;
  frmCadForneAvalia.nIdPessoa:= Cds.FieldByName('IDFORCLI').AsInteger;
  frmCadForneAvalia.DtEmissao:= Cds.FieldByName('DATAEMISNF').AsDateTime;
  frmCadForneAvalia.WindowState:= wsMaximized;


  frmCadForneAvalia.ShowModal;
  frmCadForneAvalia.Release;
end;

procedure TFrmMTRecebMerc.FazerAvaliacao;
var lCentRespons: String;
begin
  if Modulo.sComSemOC ='S' then
  begin
    cdsItemNota.First;
    while not cdsItemNota.Eof do
    begin
      lCentRespons:= lCentRespons + ', ' + QuotedStr(cdsItemNota.FieldByName('CODCENTRORESPON').AsString);
      cdsItemNota.Next;
    end;
    Delete(lCentRespons, 1, 1);

    if CtrlAvaliacaoFornec.AvaliaFornec(lCentRespons) then
      JustificarFornec;
  end;
end;

procedure TFrmMTRecebMerc.JustificarFornec;
begin
  if not CtrlAvaliacaoFornec.TrazMesAtual(Cds.FieldByName('IDFORCLI').AsInteger, Cds.FieldByName('DATAEMISNF').AsDateTime) then
  begin
    Application.MessageBox('Para a criação da AP é necessário realizar a avaliação do fornecedor', Pchar(ExtractFileName(Application.Title)), MB_ICONINFORMATION);
    AbrirAvaliacao;
  end
  else
  begin
    if MessageDlg('Deseja avaliar o Fornecedor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    AbrirAvaliacao
    else
    begin
      Application.CreateForm(TfrmJustificativa, frmJustificativa);
      frmJustificativa.pIdPessoa:= Cds.FieldByName('IDFORCLI').AsInteger;
      frmJustificativa.ShowModal;
    end;
   end;

end;

procedure TFrmMTRecebMerc.GravarAlteradores;
var
  vObjAlteradores: tCtrlAlteradorImpostos;
  Numdocum : Integer;

begin
  {SOL:189816 KTN:1793898 JRM6}
  // Propósito : Fazer chamada passando os parametros necessários ao
  //             Programa responsável pelo lançamento dos alteradores
  //             cadastrados para o tipo de desembolso.
  vObjAlteradores := nil;
  //  if numApGR = '' then
  //  begin
  //    numApGR := cds.FieldByName('CODDOCUMENTO').asString;
  //  end;
  //  1 - Testa se o objeto já foi criado
  if vObjAlteradores = Nil then
  begin
    vObjAlteradores := TCtrlAlteradorImpostos.create;
  end;
  //  2 - Preenche os campos necessários (Estes são do documento a pagar que se está criando).
  {}
  vObjAlteradores.p_IDPESSOA        :=  Sistema.IdEmpresa;
  vObjAlteradores.p_coddocumento    :=  Cds.FieldByName('CODDOCUMENTO').AsInteger + 1;  //trunc(_lancdoccapcar.coddocumento + 1);  vObjAlteradores.p_coddocumento    :=  vObjAlteradores.p_coddocumento  +
  vObjAlteradores.p_codTipRecDes    :=  v_codtiporecdes;
  // Ajuste para inclusão
  if Cds.FieldByName('CODDOCUMENTO').AsInteger = 0 then
  begin
    wwQueryAux.Close;
    wwQueryAux.sql.Clear;
    wwQueryAux.sql.Add('SELECT MAX(CODDOCUMENTO) AS MAXDOCUM FROM LANCTODOCUM');
    wwQueryAux.Open;
    V_Coddocumento_Alt := wwQueryAux.fieldByName('MAXDOCUM').AsInteger;
    vObjAlteradores.p_coddocumento  := v_Coddocumento_Alt + 1;
    wwQueryAux.close;
    Cds.FieldByName('CODDOCUMENTO').AsInteger := vObjAlteradores.p_coddocumento;
  end
  else
    v_Coddocumento_Alt := Cds.FieldByName('CODDOCUMENTO').AsInteger;

  If numApGR <> '' Then
    vObjAlteradores.p_numlancto       :=  Strtoint(numApGR)
  Else
    vObjAlteradores.p_numlancto       :=  vObjAlteradores.p_coddocumento ;

  // Recuperar a informação antes de disparar o procedimento.
  vObjAlteradores.p_CNPJBUSCAR      :=  dblcFornCli.ForCliReg.Documento;
  {}
  if (vObjAlteradores.p_coddocumento = 1) and (v_Coddocumento_Alt <> 0 ) then
  begin
    vObjAlteradores.p_coddocumento  := v_Coddocumento_Alt + 1;
  end;
  {}
  vObjAlteradores.p_plncodigo       :=  Cds.FieldByName('PLNCODIGO').AsInteger;
  vObjAlteradores.p_datalancto      :=  dbeDataVenc.Date;
  if reValorTotal.Value <> 0 then
  begin
    vObjAlteradores.p_valor         :=  reValorTotal.Value;
    vObjAlteradores.p_VALORBRUTO    :=  reValorTotal.Value;
    vObjAlteradores.p_vlrliquido    :=  reValorTotal.Value;
  end
  else
  begin
    vObjAlteradores.p_valor         :=  dbeValorCorrente.Value;
    vObjAlteradores.p_VALORBRUTO    :=  dbeValorCorrente.Value;
    vObjAlteradores.p_vlrliquido    :=  dbeValorCorrente.Value;
  end;

  vObjAlteradores.p_RecPag          :=  cdsItemNota.FieldByName('RECPAG').AsString;
  if vObjAlteradores.p_RECPAG = 'R' then
    vObjAlteradores.p_debcre  :=  'C'
  else
    vObjAlteradores.p_debcre  :=  'D';

  vObjAlteradores.p_codtipdoc       :=  StrToInt( dbclTipoDoc.LookupValue );
  vObjAlteradores.p_numfatura       :=  numApGR;
  vObjAlteradores.p_unidnegoc       :=  Sistema.IdEmpresa; //Strtoint( UnidNegocio.cocod);
  vObjAlteradores.p_FlgSimples      :=  false;
  vObjAlteradores.p_FlgEspecial     :=  False;
  //  3 - Dispara a geração de alteradores.
  //      Para tanto, verifica a parametrização de alteradores para o primeiro item da nota em foco.
  cdsItemNota.First;
  if not cdsItemNota.Eof then
  begin
    v_codtiporecdes := cdsItemNota.FieldByName('CODTIPRECDES').AsString;
    vObjAlteradores.p_codTipRecDes  :=  cdsItemNota.FieldByName('CODTIPRECDES').AsString;
    vObjAlteradores.VerificaAlteradores;
  end;
  {SOL:189816 KTN:1793898 JRM6}

end;
 //Higor Nayde SOL 188854 Kintana 1784331 - Início
procedure TFrmMTRecebMerc.dblcFornCliChange(Sender: TObject);
begin
    If dblcFornCli.Valida = VcOk Then
      Begin
         FlgExit := false;
         if (CtrlAvaliacaoFornec.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
           MsgDlg('Este fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
         end;
         dbenNumDoc.setfocus;  // Macete usado para forçar a saída do campo a assim atualizar os ponteiros de dados (Cds e o registro da classe)
         FlgExit := true;
      End;
end;

procedure TFrmMTRecebMerc.FormShow(Sender: TObject);
begin
  inherited;
  FlgExit:=true;
end;

procedure TFrmMTRecebMerc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FlgExit := true;
end;

procedure TFrmMTRecebMerc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FlgExit := true;
end;
 //Higor Nayde SOL 188854 Kintana 1784331 - Fim

end.
