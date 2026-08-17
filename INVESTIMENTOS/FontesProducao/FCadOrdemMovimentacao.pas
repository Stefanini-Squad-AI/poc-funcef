//******************************************************************************
//Data	      : 11/10/2011
//Responsável : Otacilio
//Kintana     : 1449344
//SOL         : 166525
//Motivo(S)   : Erro ao agrupar boletas segundo novo critério
//******************************************************************************
//Data	      : 22/06/2011
//Responsável : Otacilio
//Kintana     : 1229326
//SOL         : 155955/4501
//Motivo(S)   : Alteração na regra da boleta para inclusão da carteira junto ao agrupamento já existente
//******************************************************************************
// Rotina     : BtOkDetClick/dbgOperacaoColExit
// SOL        : 96300/97115
// Kintana    : 417031/421428
// Data       : 18/09/2008
// Responsável: André L. Santos
// Descrição  : Ajuste no sistema pois o mesmo estava verificando o estoque antes de uma
//              compra de acões apos acerto realizado em 07/08/2008.
//******************************************************************************
// Rotina     : BtOkDetClick/dbgOperacaoColExit
// SOL        : 92477
// Kintana    : 394862
// Data       : 07/08/2008  
// Responsável: André L. Santos
// Descrição  : Ajuste na funcionalidade que está permitindo realizar lançamentos 
//               de "Venda a Descoberto", ou seja, não está considerando a segregação 
//               por estoque (CC e CCI).
//******************************************************************************
//Data	     : 19/10/2007
//Codigo     : AL_20
//Pendência  : 26547
//Desc       : Ao incluir um lancamento e clicar em ok e depois em voltar
//             estava zerando o campo valor.
//             A função AtualizaLoteGrid estava sendo chamada em AtualizaLote
//             de maneira incorreta
//******************************************************************************
// Data      : 29/08/2007
// Código    : AL_19
// Pendencia : 25707
// SOL       : 47728
// Motivo    : Alteração do campo ação para Código de Negociação
//******************************************************************************
//Data	     : 14/08/2007
//Codigo     : AL_18
//Pendência  : 26012
//Desc       : Alteração para permitir IDTIPOINVEST NULL na QryBuscaCarteira e
//             Abreqry
//******************************************************************************
//Data	    : 09/08/2007
//Código    : Al_17
//Pendencia : 25728
//SOL       : 63282
//Motivo(S) : Implementação da crítica de acesso as carteiras
//******************************************************************************
//Data	    : 13/07/2007
//Código    : Al_16
//Pendencia : 25707
//SOL       : 47728
//Motivo(S) : Troca do campo "Ação", de Descrição do Ativo para Código do Ativo
//******************************************************************************
//Data	    : 02/05/2006
//Código    : Al_15
//Motivo(S) : Ajuste no display do nome da carteira,
//            Ajuste no display das informações no fundo da tela
//******************************************************************************
// Data     : 06/02/2007
// Código   : AL_14
// Desc     : Acerto na filtragem das Carteiras da Abreqry
//******************************************************************************
// Data     : 31/01/2007
// Código   : AL_13
// Pendencia: 22555
// SOL      : 43964
// Desc     : Ajuste no esquema de cores da tela.
//******************************************************************************
// Data	    : 25/07/2006
// Código   : Al_12
// Pendencia: 22959
// SOL      :
// Motivo(S): Implementação de segregação de Planos
//            Alterada a qryDocumento - Alterado o DFM
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_11
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 29/06/2006
// Código   : AL_10
// Pendencia:
// SOL      :
// Desc     : Acerto no cartesiano com a BolsaValores qdo a ação está cadastrada
//            em mais de uma Bolsa
//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_9
// Pendencia:
// SOL      :
// Desc     : Ajuste na consulta da carteira para não trazer duplicidade
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_8
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_7
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
// Data     : 30/05/2005
// Código   : AL_6
// Pendencia: 21301
// SOL      : 19929
// Descrição: Implementação de ajuste nas mensagems do sistema
//********************************************************************************************************
// Data     : 15/02/2005
// Código   : Caption na Tela
// Motivo   : Apagou na tela o detalhe da carteira,corretora,operação,ação e bolsa
//********************************************************************************************************
// Data     : 08/11/2004
// Código   : AL_5
// Motivo   : Novo Relatório de Ordens de Movimentação
//******************************************************************************
// Data     : 26/10/2004
// Código   : AL_4
// Motivo   : Alteração na crítica de DayTrade (Dois tipos de Venda)
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_3
// Motivo   : Alteração Legislação CPMF (Numero de Boleta por Conta de Investimento)
//            Alterada propriedade SQL da query QryNumDocumento
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF (BuscaTodosSaldos)
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

unit FCadOrdemMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, UDataBase, TREdit, wwdbedit,
  Wwdotdot, Wwdbcomb, USistema, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBGrids, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CmEventosCadastro, ImgList, FPreview, uCtrlRendaVariavel, uCtrlPadroes,
  uCtrlAcessoCarteira, DBClient, uCMClientDataSet, uCtrlParamInvest;

type                      
  TfrmOrdemMovimentacao = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    dblSiglaCorretora: TwwDBLookupCombo;
    QryBuscaCarteira: TwwQuery;
    QryCorretValores: TwwQuery;
    QryAux: TwwQuery;
    Label5: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    QryDetalhe: TwwQuery;
    DsDetalhe: TwwDataSource;
    QryInvestimentoAcao: TwwQuery;
    QryTotalOperacao: TwwQuery;
    updDetalhe: TUpdateSQL;
    dbDtaOperacao: TCMDateTimePicker;
    QrySubTipo: TwwQuery;
    DsSubTipo: TwwDataSource;
    updSubTipo: TUpdateSQL;
    Label3: TLabel;
    lblAcao: TLabel;
    Label7: TLabel;
    QryDetalheIDORDMOVINV: TFloatField;
    QryDetalheIDCORRETVALORES: TFloatField;
    v: TFloatField;
    QryDetalhePUORDMOVINV: TFloatField;
    QryDetalheOBSMOVINV: TStringField;
    QryDetalheDATAORDMOVINV: TDateTimeField;
    QryDetalheQTDEORDMOVINV: TFloatField;
    QryDetalheNUMDOCMOVINV: TStringField;
    QryDetalheSTATMOVINV: TStringField;
    QryDetalheIDUSUARIO: TFloatField;
    QryDetalheIDAUTORIZACAO: TFloatField;
    QryDetalheTRGDTINCLUSAO: TDateTimeField;
    QryDetalheTRGUSERINCLUSAO: TStringField;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheOBSAUTMOV: TStringField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDLOTE: TStringField;
    QryDetalheQTDEORDENADA: TFloatField;
    QryDetalheDATAAUTORIZACAO: TDateTimeField;
    QryDetalheHORAMOV: TStringField;
    QryDetalheVALOR: TFloatField;
    Label8: TLabel;
    dblBolsa: TwwDBLookupCombo;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    QryBolsaValoresMOECODIGO: TFloatField;
    QryBolsaValoresIDCUSTODIANTE: TFloatField;
    dbgOperacao: TwwDBGrid;
    QryBuscaCustodiante: TwwQuery;
    QryBuscaCustodianteSGLCUSTODIANTE: TStringField;
    QryBuscaCustodianteIDCUSTODIANTE: TFloatField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    QryDetalheIDBOLSAVALORES: TFloatField;
    S: TFloatField;
    QryDetalheSGLCUSTODIANTE: TStringField;
    dblOperacao: TwwDBLookupCombo;
    dblAcao: TwwDBLookupCombo;
    QryDetalheDESCCARTINVEST: TStringField;
    QryDetalheSGLCORRETVALORES: TStringField;
    QryDetalheDESCTIPOOPERACAO: TStringField;
    QryDetalheDESCINVESTIMENTO: TStringField;
    QryDetalheSGLBOLSAVALORES: TStringField;
    QryDetalheSIGLATIPOOPER: TStringField;
    Panel1: TPanel;
    dbgSelecao: TDBGrid;
    Label9: TLabel;
    rQtdLote: TRealEdit;
    Label10: TLabel;
    rQtdAtual: TRealEdit;
    Label13: TLabel;
    rTotalOperacao: TRealEdit;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    QryNumDocumento: TwwQuery;
    QryDetalheNATUREZAOPERACAO: TStringField;
    Label11: TLabel;
    rQtdPrevista: TRealEdit;
    qryOrdMovInv: TwwQuery;
    sbtnOpercoesDireito: TToolbarButton97;
    QryDetalheIDPLANPREVCTBPATR: TFloatField;
    QryDetalheIDCARTEIRAGERENC: TFloatField;
    QryVerOperDayTrade: TwwQuery;
    QryVerOperDayTradeDESCTIPOOPERACAO: TStringField;
    QryVerOperDayTradeIDINVESTIMENTO: TFloatField;
    QryBuscaOperacao: TwwQuery;
    QryBuscaOperacaoDESCTIPOOPERACAO: TStringField;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    lblOpcao: TLabel;
    dblkOpcao: TwwDBLookupCombo;
    QryBuscaOperacaoIDTIPOOPERACAO: TFloatField;
    QryBuscaOperacaoSIGLATIPOOPER: TStringField;
    QryBuscaOperacaoNATUREZAOPERACAO: TStringField;
    QryBuscaOperacaoTIPOCUSTODIA: TStringField;
    QryBuscaOperacaoFLGTRATAIR: TStringField;
    QryBuscaOperacaoIDMERCADO: TFloatField;
    QryBuscaOperacaoVENCIMENTO: TFloatField;
    QryBuscaOperacaoIDTIPOOPERLIQPEND: TFloatField;
    qryOpcao: TwwQuery;
    qryOpcaoIDINVESTIMENTO: TFloatField;
    qryOpcaoDESCINVESTIMENTO: TStringField;
    qryOpcaoIDTIPOINVEST: TFloatField;
    qryOpcaoIDEMISSOR: TFloatField;
    qryOpcaoSTAOPCAO: TStringField;
    qryOpcaoSTATPAMERICANA: TStringField;
    qryOpcaoSTAOPCCOMPRA: TStringField;
    qryOpcaoDTAVENCTO: TDateTimeField;
    qryOpcaoIDINVESTBASE: TFloatField;
    qryOpcaoVLRPRECOEX: TFloatField;
    qryBuscaLoteOpcoes: TwwQuery;
    qryBuscaLoteOpcoesIDLOTE: TStringField;
    QryInvestimentoAcaoIDINVESTIMENTO: TFloatField;
    QryInvestimentoAcaoDESCINVESTIMENTO: TStringField;
    QryInvestimentoAcaoIDTIPOINVEST: TFloatField;
    QryInvestimentoAcaoIDEMISSOR: TFloatField;
    QryInvestimentoAcaoSTAOPCAO: TStringField;
    QryInvestimentoAcaoSTATPAMERICANA: TStringField;
    QryInvestimentoAcaoSTAOPCCOMPRA: TStringField;
    QryInvestimentoAcaoDTAVENCTO: TDateTimeField;
    QryInvestimentoAcaoIDINVESTBASE: TFloatField;
    QryVerQtdLancada: TwwQuery;
    dbgOperacaoIButton: TwwIButton;
    QryBuscaOperacaoFLGCONTAINVEST: TFloatField;
    QryNumDocumentoNUMDOCMOVINV: TStringField;
    // AL_05
    sbtnRelatorio: TToolbarButton97;
    //Al_16
    QryInvestimentoAcaoSIGLAACAOBOLSA: TStringField;
    QryDetalheSIGLAACAOBOLSA: TStringField;
    QryBuscaCarteiraID: TStringField;
    QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField;
    QryBuscaCarteiraIDCARTEIRAGERENC: TFloatField;
    QryBuscaCarteiraDESCCARTINVEST: TStringField;
    //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
    qryPlanoPatro: TwwQuery;
    dblPlanoPatro: TwwDBLookupCombo;
    Label12: TLabel;
    QryDetalhePLANPRVCONTABPATRO: TStringField;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBdOCUMENTO: TDBEdit;
    QryDetalheTIPOINCLUSAO: TStringField;
    QryDetalheNOMETIPOINCLUSAO: TStringField;
    dblCarteira: TwwDBLookupCombo;
    Label14: TLabel;
    StaticText1: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbgOperacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOperacaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure HabilitaCamposDetalhe;
    procedure DesabilitaCamposDetalhe;
    procedure AbreQry;
    procedure ApuraSaldoIR;
    procedure CancelaOperacao;
    procedure AlimentaQryDetalhe;
    procedure AtualizaQtdAtual;
    procedure AtualizaQtdPrevista;
    procedure PosicionaNumDocumento;
    procedure QtdePrevista(iIdOrdMovInv : Integer; fQtdeOrdenada, fTotalOperacao : Double);

    //AL_15
    function  AtualizaLote(IDINVESTIMENTO : Integer; DATAORDEM: TDateTime) : Double;
    function  AtualizaLoteGrid(IDINVESTIMENTO : Integer; DATAORDEM: TDateTime) : Integer;
    function  ValidaCamposPrincipal : Boolean;
    function  ValidaCamposDetalhe : Boolean;
    function  DivValorZero(Valor1, Valor2: Extended): Extended;

    Procedure CmeCadastroFind(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgOperacaColExit(Sender: TObject);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure dbgOperacaoColExit(Sender: TObject);
    procedure dbgOperacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgOperacaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgOperacaoEnter(Sender: TObject);
    procedure dbgOperacaoExit(Sender: TObject);
    //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
    procedure dblCarteiraExit(Sender: TObject);
    procedure dblAcaoExit(Sender: TObject);
    procedure sbtnOpercoesDireitoClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
    procedure dblOperacaoExit(Sender: TObject);
    procedure dblBolsaExit(Sender: TObject);
    procedure dblkOpcaoExit(Sender: TObject);
    procedure sbtnRelatorioClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);

    //AL_15
    procedure EliminaDigitacao(Sender: TObject; var Key: Char);
    procedure dbgOperacaoRowChanged(Sender: TObject);
    procedure QryDetalheAfterOpen(DataSet: TDataSet);
    //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblPlanoPatroExit(Sender: TObject);
    // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
    procedure dbgOperacaoDblClick(Sender: TObject);

  private
    { Private declarations }
    // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
    sRegraBoleta: Char;
    CtrlRV : TCtrlRendaVariavel;
    procedure CalculaOperacao;
    procedure Refresh;
    procedure AbreQryInvestimento(iInvestimento:Integer;
                                  sStaOpcao:String;
                                  bOpcao:boolean);
    //AL_17
    procedure MontaQryCart(dDataLimite: TDateTime);
    function MontaIdLoteOpcoes:String;
    function VerificaOperExercicio:boolean;

    // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
      procedure BuscaValorRegraBoleta;

  public
    { Public declarations }
  end;

var
  frmOrdemMovimentacao: TfrmOrdemMovimentacao;
  wDocumento, wPlano, wIdOperCust, wIdAcao, IDORDMOVINV, iUltInv : Integer;
  dUltData: TDateTime;
  wFLGORDMOVINV, wIdLote, wTipoOrdMov,  sNumDocumento, sStaOpcao : String;
  bForcaBoleta, bDelete, bTrocaLine, bOpcao, bTipoVenda : Boolean;
  dValor, wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoAqui, wSaldoIRApu, wQtdCotaIni,
  wSaldo, wVlrIRProv, fVrlRendimento, fSaldoQtd, fSaldoInutil : Double;

implementation

uses DBaseDados, UBibliotecaInvest, UOperComum, UMensErro, UImpostos, UOperacaoInvest,
     FTelaAut, FImportaOrdens, UOpcoes, dOpcoes, FDmRelOrdemRV;

{$R *.DFM}

Procedure TfrmOrdemMovimentacao.CmeCadastroFind(Sender: TObject);
Begin
   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin
     dbDtaOperacao.Text := Copy(MontaSelect.ValoresChave[0],1,10);

     //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
     dblPlanoPatro.Text    := '';
     if ((pRPI.FLGPLANPREVCTBPAT = 'S') And (MontaSelect.ValoresChave[8] <> '')) then
     begin
        if qryPlanoPatro.Locate('IDPLANPREVCTBPATR', MontaSelect.ValoresChave[8], []) then
           dblPlanoPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
        dblPlanoPatro.PerformSearch;
     end;

     If MontaSelect.ValoresChave[1] <> '' Then
     Begin
        If (pRPI.FLGCARTGERENC = 'S') And (MontaSelect.ValoresChave[7] <> '') Then
        Begin
           If QryBuscaCarteira.Locate('IDCARTEIRAGERENC', MontaSelect.ValoresChave[7], [loPartialKey]) Then
              dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString
           Else
              dblCarteira.Text := '';
        End
        Else
        Begin
           If QryBuscaCarteira.Locate('IDCARTEIRAINVEST', MontaSelect.ValoresChave[1], [loPartialKey]) Then
              dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString
           Else
              dblCarteira.Text := '';
        End;
     End
     Else
        dblCarteira.Text    := '';

     If MontaSelect.ValoresChave[2] <> '' Then
     Begin
        If QryCorretValores.Locate('IDCORRETVALORES', MontaSelect.ValoresChave[2], [loPartialKey]) Then
           dblSiglaCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString
        Else
           dblSiglaCorretora.Text := '';
     End
     Else
        dblSiglaCorretora.Text    := '';

     If MontaSelect.ValoresChave[3] <> '' Then
     Begin
        If QryBuscaOperacao.Locate('IDTIPOOPERACAO', MontaSelect.ValoresChave[3], [loPartialKey]) Then
           dblOperacao.Text := QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString
        Else
           dblOperacao.Text := '';
     End
     Else
        dblOperacao.Text    := '';

     //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009        
     If ((MontaSelect.ValoresChave[4] <> '') And (pRPI.REGRABOLETA <> '1')) Then
     Begin
        //Al_16
        If QryInvestimentoAcao.Locate('IDINVESTIMENTO', MontaSelect.ValoresChave[4], [loPartialKey]) Then
           dblAcao.Text := QryInvestimentoAcao.FieldByName('SIGLAACAOBOLSA').AsString
        Else
           dblAcao.Text := '';
     End
     Else
        dblAcao.Text    := '';

     If MontaSelect.ValoresChave[5] <> '' Then
     Begin
        If QryBolsaValores.Locate('IDBOLSAVALORES', MontaSelect.ValoresChave[5], [loPartialKey]) Then
           dblBolsa.Text := QryBolsaValores.FieldByName('SGLBOLSAVALORES').AsString
        Else
           dblBolsa.Text := '';
     End
     Else
        dblBolsa.Text    := '';

     If MontaSelect.ValoresChave[6] <> '' Then
        dbDocumento.Text := MontaSelect.ValoresChave[6]
     Else
        dbDocumento.Text    := '';

     //AL_15
     If dblAcao.Text = '' Then
        AtualizaLote(QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger, QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime)
     Else
        AtualizaLote(QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger, QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime);

     AbreQry;

     //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
     dbDocumento.Text := MontaSelect.ValoresChave[6];

     //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
     rQtdAtual.Clear;
     rQtdPrevista.Clear;
     rTotalOperacao.Clear;

     HabilitaCamposDetalhe;

     if qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger = pRPI.IDCARTOPC then // Carteira de Opções
     begin
        dbgSelecao.Columns[3].Title.Caption := 'Opção';
        QryDetalhePUORDMOVINV.DisplayLabel  := 'Prêmio';
     end
     else
     begin
        dbgSelecao.Columns[3].Title.Caption := 'Ação';
        QryDetalhePUORDMOVINV.DisplayLabel  := 'Preço';
     end;

     //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009     
     if pRPI.REGRABOLETA = '1' then
     begin
        dbDtaOperacao.Enabled     := False;
        dblSiglaCorretora.Enabled := False;
        dblPlanoPatro.Enabled     := False;
        //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
        dbDocumento.Enabled       := False;

        BtIncDet.Enabled          := False;
        BtAltDet.Enabled          := False;

        bbtnCancelar.Enabled      := True;

     end;
   End
   Else
   Begin
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      if pRPI.REGRABOLETA = '1' then
      begin
         dbDtaOperacao.Enabled     := True;
         dblSiglaCorretora.Enabled := True;
         dblCarteira.Enabled       := True;
         dblPlanoPatro.Enabled     := True;
         dblOperacao.Enabled       := True;
         dblAcao.Enabled           := True;
         dblBolsa.Enabled          := True;
         dblkOpcao.Enabled         := True;

         dblPlanoPatro.Text     := '';
      end;

      dblCarteira.Text       := '';
      dblSiglaCorretora.Text := '';
      dblOperacao.Text       := '';
      dblAcao.Text           := '';
      dblBolsa.Text          := '';
      dbDocumento.Text       := '';

      dbDtaOperacao.Text     := DateToStr(pRPI.DATAMOVTORV);

      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;

      QryDetalhe.Close;
      rQtdLote.Clear;
      rQtdAtual.Clear;
      rQtdPrevista.Clear;
      rTotalOperacao.Clear;

      DesabilitaCamposDetalhe;
   End;
End;

procedure TfrmOrdemMovimentacao.FormShow(Sender: TObject);
var CtrlAcessoCart: TCtrlAcessoCarteira;
    cdsCarteiras: TCMClientDataSet;
begin
  inherited;
    dbgOperacao.Font.Color := clGray;
    bTrocaLine  := True;

    //AL_17
    MontaQryCart(CtrlPInv.DataUltFech);

    Qry.Open;
    OperComum.LimpaParametros(QryBolsaValores);
    if pRPI.IDBMF <> 0 then
       QryBolsaValores.ParamByName('IDBOLSAVALORES').AsInteger := pRPI.IDBMF;
    QryBolsaValores.Open;

    OperComum.LimpaParametros(QryBuscaOperacao);

    QryBuscaOperacao.Open;

    OperComum.LimpaParametros(QryCorretValores);
    QryCorretValores.Open;

    OperComum.LimpaParametros(QryInvestimentoAcao);
    QryInvestimentoAcao.Open;

    //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
    qryPlanoPatro.Open;

    TB97oKCancelar.Visible := (pRPI.REGRABOLETA = '1');

    if (pRPI.REGRABOLETA <> '1') then
    begin
       Label12.Enabled := (pRPI.FLGPLANPREVCTBPAT = 'S');
       dblPlanoPatro.Enabled := (pRPI.FLGPLANPREVCTBPAT = 'S');
       if (pRPI.FLGPLANPREVCTBPAT = 'S') then
       begin
          MontaSelect.Filtro.Add('ORDMOVINV.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro));
          if qryPlanoPatro.Locate('IDPLANPREVCTBPATR', iPlanPrevCtbPatro, []) then
          begin
             dblPlanoPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
             dblPlanoPatro.PerformSearch;
          end;
       end;
    end
    else
    begin
       TB97oKCancelar.Visible := True;
       bbtnConfirmar.Visible  := True;
       bbtnConfirmar.Enabled  := False;
       bbtnCancelar.Visible   := True;
       bbtnCancelar.Enabled   := False;
    end;   

    CmeCadastroAtualizaBotoes(Sender);

    wFLGORDMOVINV      := pRPI.FLGORDMOVINV;
    wQtdCotaIni        := pRPI.VLRCOTAINICART;
    wTipoOrdMov        := pRPI.FLGORDMOVINV;
    dbDtaOperacao.Date := pRPI.DATAMOVTORV;
    IDORDMOVINV        := 0;
    bDelete            := False;

    dbDtaOperacaoExit(Sender);

    //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
    dbDocumento.Enabled := False;

    // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
   BuscaValorRegraBoleta;
end;

procedure TfrmOrdemMovimentacao.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
    If DtmBaseDados.dbBaseDados.InTransaction Then
       DtmBaseDados.dbBaseDados.Rollback;
    inherited;
    Qry.Close;
    QryAux.Close;
    QryDetalhe.Close;
    QrySubTipo.Close;
    QryBuscaCustodiante.Close;
    QryBolsaValores.Close;
    QryTotalOperacao.Close;
    QryBuscaCarteira.Close;
    QryCorretValores.Close;
    QryBuscaOperacao.Close;
    QryInvestimentoAcao.Close;
end;


procedure TfrmOrdemMovimentacao.HabilitaCamposDetalhe;
Begin
   dbgOperacao.Enabled := True;
   BtIncDet.Enabled    := True;
   BtAltDet.Enabled    := True;
   BtDelDet.Enabled    := True;
   BtAltDet.Down       := False;
   BtDelDet.Down       := False;
   BtIncDet.Down       := False;
End;

procedure TfrmOrdemMovimentacao.DesabilitaCamposDetalhe;
begin
   dbgOperacao.Enabled := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtIncDet.Enabled    := False;
end;

procedure TfrmOrdemMovimentacao.HabilitaCampos;
begin
   sbtnProcurar.Enabled      := True;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   dbDtaOperacao.Enabled     := (pRPI.REGRABOLETA <> '1');
   dblSiglaCorretora.Enabled := (pRPI.REGRABOLETA <> '1');
   dblPlanoPatro.Enabled     := (pRPI.REGRABOLETA <> '1');
   dblCarteira.Enabled       := True;
   dblOperacao.Enabled       := True;
   dblAcao.Enabled           := True;
   dblBolsa.Enabled          := True;
   dblkOpcao.Enabled         := True;
End;

procedure TfrmOrdemMovimentacao.DesabilitaCampos;
begin
   sbtnProcurar.Enabled      := False;
   dbDtaOperacao.Enabled     := False;
   dblSiglaCorretora.Enabled := False;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   dblCarteira.Enabled       := False;
   dblPlanoPatro.Enabled     := False;
   dblOperacao.Enabled       := False;
   dblAcao.Enabled           := False;
   dblBolsa.Enabled          := False;
   dblkOpcao.Enabled         := False;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   dbDocumento.Enabled       := False;
End;

procedure TfrmOrdemMovimentacao.bbtnConfirmarClick(Sender: TObject);
var sBoleta : String;
begin
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   bTrocaLine := True;

   sBoleta :=  dbDocumento.Text;

   QryDetalhe.Cancel;

   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;

   MsgDlg('A Boleta "'+ sBoleta +'", foi finalizada com sucesso!',
          'Mensagem do Sistema ',mtWarning,[mbOK],0);

   sbtnProcurar.Enabled      := True;
   dbDtaOperacao.Enabled     := True;
   dblSiglaCorretora.Enabled := True;
   dblCarteira.Enabled       := True;
   dblPlanoPatro.Enabled     := True;
   dblOperacao.Enabled       := True;
   dblAcao.Enabled           := True;
   dblBolsa.Enabled          := True;
   dblkOpcao.Enabled         := True;

   dbDtaOperacao.Text        := '';
   dblSiglaCorretora.Text    := '';
   dblCarteira.Text          := '';
   dblPlanoPatro.Text        := '';
   dblOperacao.Text          := '';
   dblAcao.Text              := '';
   dblBolsa.Text             := '';
   dblkOpcao.Text            := '';

   dbDocumento.Text          := '';
   dbDocumento.Enabled       := False;

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtOkDet.Enabled     := False;
   BtCancDet.Enabled   := False;
   BtVoltaDet.Enabled  := False;

   BtIncDet.Down       := False;
   BtAltDet.Down       := False;
   BtDelDet.Down       := False;

   rQtdLote.Clear;
   rQtdAtual.Clear;
   rQtdPrevista.Clear;
   rTotalOperacao.Clear;

   dbgOperacao.Font.Color  := clGray;

   dbDtaOperacao.Text  := DateToStr(pRPI.DATAMOVTORV);
   if dbDtaOperacao.CanFocus then
      dbDtaOperacao.SetFocus;

   QryDetalhe.Close;

   bbtnConfirmar.Enabled := False;
end;

procedure TfrmOrdemMovimentacao.AbreQry;
Begin
   //AL_12 - Ini
   With QryDetalhe Do
   Begin
      DisableControls;
      Close;
      Sql.Clear;
      Sql.Add('SELECT DISTINCT                                                  ');
      Sql.Add('  ORDMOVINV.IDORDMOVINV ,                                        ');
      Sql.Add('  ORDMOVINV.IDCORRETVALORES,                                     ');
      Sql.Add('  ORDMOVINV.IDINVESTIMENTO,                                      ');
      Sql.Add('  ORDMOVINV.PUORDMOVINV,                                         ');
      Sql.Add('  ORDMOVINV.OBSMOVINV,                                           ');
      Sql.Add('  ORDMOVINV.DATAORDMOVINV,                                       ');
      Sql.Add('  ORDMOVINV.QTDEORDMOVINV,                                       ');
      Sql.Add('  ORDMOVINV.NUMDOCMOVINV,                                        ');
      Sql.Add('  ORDMOVINV.STATMOVINV,                                          ');
      Sql.Add('  ORDMOVINV.IDUSUARIO,                                           ');
      Sql.Add('  ORDMOVINV.IDAUTORIZACAO,                                       ');
      Sql.Add('  ORDMOVINV.TRGDTINCLUSAO,                                       ');
      Sql.Add('  ORDMOVINV.TRGUSERINCLUSAO,                                     ');
      Sql.Add('  ORDMOVINV.IDTIPOINVEST,                                        ');
      Sql.Add('  ORDMOVINV.IDTIPOOPERACAO,                                      ');
      Sql.Add('  ORDMOVINV.OBSAUTMOV,                                           ');
      Sql.Add('  ORDMOVINV.IDCARTEIRAINVEST,                                    ');
      Sql.Add('  ORDMOVINV.IDCARTEIRAGERENC,                                    ');
      Sql.Add('  ORDMOVINV.IDLOTE,                                              ');
      Sql.Add('  ORDMOVINV.IDBOLSAVALORES,                                      ');
      Sql.Add('  ORDMOVINV.IDCUSTODIANTE,                                       ');
      Sql.Add('  ORDMOVINV.QTDEORDENADA,                                        ');
      Sql.Add('  ORDMOVINV.DATAAUTORIZACAO,                                     ');
      Sql.Add('  ORDMOVINV.IDPLANPREVCTBPATR,                                   ');
      Sql.Add('  TO_CHAR(ORDMOVINV.DATAORDMOVINV, ''HH24:MM'') AS HORAMOV,      ');
      Sql.Add('  (((PUORDMOVINV*QTDEORDENADA)/QTDELOTE)-0.0049) AS VALOR,       ');
      Sql.Add('  CARTEIRAINVEST.DESCCARTINVEST,                                 ');
      Sql.Add('  CORRETVALORES.SGLCORRETVALORES,                                ');
      Sql.Add('  TIPOOPERACAO.DESCTIPOOPERACAO,                                 ');
      Sql.Add('  TIPOOPERACAO.SIGLATIPOOPER,                                    ');
      Sql.Add('  INVESTIMENTO.DESCINVESTIMENTO,                                 ');
      Sql.Add('  BOLSAVALORES.SGLBOLSAVALORES,                                  ');
      Sql.Add('  TIPOOPERACAO.NATUREZAOPERACAO,                                 ');
      //Al_16
      Sql.Add('  ACOESXBOLSA.SIGLAACAOBOLSA,                                    ');
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      Sql.Add('  VWPLANPREVCTBPATR.PLANPRVCONTABPATRO ,                          ');
      //Thiago Passos SOL 117351 18/09/2009
      Sql.Add('  ORDMOVINV.TIPOINCLUSAO,                           ');
      Sql.Add('  DECODE(ORDMOVINV.TIPOINCLUSAO,''I'',''IMPORTAÇÃO'',''M'',''MANUAL'')NOMETIPOINCLUSAO   ');

      Sql.Add('                                                                 ');
      Sql.Add('FROM                                                             ');
      Sql.Add('  ORDMOVINV,                                                     ');
      //AL_15
      Sql.Add('  (SELECT LPAD(IDCARTEIRAINVEST,2,''0'') || NULL AS IDCARTEIRA, IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, ');
      Sql.Add('   DESCCARTINVEST, IDTIPOINVEST, IDMERCADO                       ');
      Sql.Add('   FROM CARTEIRAINVEST                                           ');
      //AL_18
      Sql.Add('   WHERE ((IDTIPOINVEST = 2) OR (IDTIPOINVEST IS NULL))                                        ');
      Sql.Add('   UNION                                                         ');
      Sql.Add('   SELECT LPAD(CG.IDCARTEIRAINVEST,2,''0'') || LPAD(CG.IDCARTEIRAGERENC,2,''0'') AS IDCARTEIRA, ');
      Sql.Add('      CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,                  ');
      Sql.Add('      CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, CI.IDMERCADO ');
      Sql.Add('   FROM                                                          ');
      Sql.Add('     CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI        ');
      Sql.Add('   WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST               ');
      Sql.Add('  ) CARTEIRAINVEST, ');
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      Sql.Add('   CORRETVALORES, INVESTIMENTO, BOLSAVALORES, TIPOOPERACAO, BOLETA, ACOESXBOLSA,  ');
      Sql.Add('   VWPLANPREVCTBPATR                                             ');
      Sql.Add('WHERE                                                            ');
      Sql.Add('                                                                 ');
      If dbDtaOperacao.Text <> '' Then
         Sql.Add('      ORDMOVINV.DATAORDMOVINV LIKE TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'') AND ')
      Else
         Sql.Add('      NOT ORDMOVINV.DATAORDMOVINV IS NULL                           AND  ');

      If dblCarteira.Text <> '' Then
         Sql.Add('      ORDMOVINV.IDCARTEIRAINVEST  = '''+
              QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsString+'''     AND  ');

      If dblCarteira.Text <> '' Then
      Begin
         If QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 Then
            Sql.Add('      ORDMOVINV.IDCARTEIRAGERENC  = '''+
                QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsString+'''   AND  ')
         Else
            Sql.Add('      ORDMOVINV.IDCARTEIRAGERENC IS NULL                         AND  ');
      End;

      If dblSiglaCorretora.Text <> '' Then
         Sql.Add('      ORDMOVINV.IDCORRETVALORES   = '+
              QryCorretValores.FieldByName('IDCORRETVALORES').AsString+'        AND  ')
      Else
         Sql.Add('      NOT ORDMOVINV.IDCORRETVALORES IS NULL                         AND  ');

      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009         
      If ((dblOperacao.Text <> '') And (pRPI.REGRABOLETA <> '1')) Then
         Sql.Add('      ORDMOVINV.IDTIPOOPERACAO   = '+
              QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsString+'         AND  ')
      Else
         Sql.Add('      NOT ORDMOVINV.IDTIPOOPERACAO IS NULL                          AND  ');

      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009         
      If ((dblAcao.Text <> '') And (pRPI.REGRABOLETA <> '1')) Then
         Sql.Add('      ORDMOVINV.IDINVESTIMENTO   = '+
              QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsString+'      AND  ')
      Else
         Sql.Add('      NOT ORDMOVINV.IDINVESTIMENTO IS NULL                          AND  ');

      If dblBolsa.Text <> '' Then
         Sql.Add('      ORDMOVINV.IDBOLSAVALORES   = '+
              QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+' AND  ')
      Else
         Sql.Add('      NOT ORDMOVINV.IDBOLSAVALORES IS NULL AND  ');

      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009         
      If ((pRPI.FLGPLANPREVCTBPAT = 'S') And (dblPlanoPatro.Text <> '')) Then
         Sql.Add('      ORDMOVINV.IDPLANPREVCTBPATR = ' + qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString + ' AND  ');

      //Ricardo Cristiano - 12/04/2011 - N. Sol 155955 -  N. Kintana 1229268         
      if ((pRPI.REGRABOLETA = '1') or (bForcaBoleta))then
         Sql.Add('      ORDMOVINV.NUMDOCMOVINV          = '+ QuotedStr(Trim(dbDocumento.Text)) +' AND  ');

      Sql.Add('      ORDMOVINV.IDTIPOINVEST          <> 8 AND  ');
      //AL_15
      Sql.Add('      ((LPAD(ORDMOVINV.IDCARTEIRAINVEST,2,''0'') || LPAD(ORDMOVINV.IDCARTEIRAGERENC,2,''0'')) = CARTEIRAINVEST.IDCARTEIRA) AND ');
      Sql.Add('      CORRETVALORES.IDCORRETVALORES   = ORDMOVINV.IDCORRETVALORES AND  ');
      Sql.Add('      INVESTIMENTO.IDINVESTIMENTO     = ORDMOVINV.IDINVESTIMENTO AND  ');
      Sql.Add('      BOLSAVALORES.IDBOLSAVALORES     = ORDMOVINV.IDBOLSAVALORES AND  ');
      Sql.Add('      TIPOOPERACAO.IDTIPOOPERACAO     = ORDMOVINV.IDTIPOOPERACAO AND  ');
      Sql.Add('      ORDMOVINV.NUMDOCMOVINV          = BOLETA.IDBOLETA(+) AND  ');
      //AL_10
      //Al_16
      Sql.Add('      ACOESXBOLSA.IDBOLSAVALORES      = ORDMOVINV.IDBOLSAVALORES AND  ');
      Sql.Add('      ACOESXBOLSA.IDACAO              = ORDMOVINV.IDINVESTIMENTO AND');
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009      
      Sql.Add('      ACOESXBOLSA.IDEMISSOR           = INVESTIMENTO.IDEMISSOR   AND');
      Sql.Add('      VWPLANPREVCTBPATR.IDPLANPREVCTBPATR = ORDMOVINV.IDPLANPREVCTBPATR ');
      Sql.Add('ORDER BY ORDMOVINV.IDORDMOVINV ');
      Open;
      EnableControls;
   End;
   dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   //AL_12 - Fim
End;

procedure TfrmOrdemMovimentacao.AlimentaQryDetalhe;
Begin
   With QryDetalhe Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         Edit;
         FieldByName('HORAMOV').AsString      :=
              FormatDateTime('HH:NN', FieldByName('DATAORDMOVINV').AsDateTime);
         //AL_15
         FieldByName('VALOR').AsFloat         :=
              AtualizaLote(QryDetalhe.FieldByname('IDINVESTIMENTO').AsInteger, QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime);
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
end;

function TfrmOrdemMovimentacao.AtualizaLoteGrid(IDINVESTIMENTO : Integer; DATAORDEM: TDateTime) : Integer;
begin
   // Busca a Quantidade por Lote na Bolsa

   //AL_15 - Ini
   if (iUltInv <> IDINVESTIMENTO) or (dULtData <> Trunc(DATAORDEM)) or (rQtdLote.Value = 0) then
   begin
      Result := 0;
      if FazQuery(QryAux,'SELECT DISTINCT QTDTITLOTE '+ #13 +
                         'FROM COTACAOINVEST ' + #13 +
                         'WHERE IDINVESTIMENTO = ' + IntToStr(IDINVESTIMENTO) + ' ' + #13 +
                         '  AND DATACOTACAO = (SELECT MAX(DATACOTACAO) ' + #13 +
                         '                     FROM COTACAOINVEST ' + #13 +
                         '                     WHERE IDINVESTIMENTO = ' + IntToStr(IDINVESTIMENTO) + ' ' + #13 +
                         '                       AND DATACOTACAO <= TO_DATE('+QuotedStr(FormatDateTime('dd/mm/yyyy', DATAORDEM)) +','+ QuotedStr('dd/mm/yyyy') + '))' ) then
         Result := QryAux.FieldByName('QTDTITLOTE').AsInteger;
      if Result = 0 then
      begin
         if FazQuery(QryAux,'SELECT DISTINCT QTDELOTE '+
                            'FROM COTACAOACAO ' + #13 +
                            'WHERE IDACAO = ' + IntToStr(IDINVESTIMENTO) + ' ' + #13 +
                            '  AND DATACOTAACAO = (SELECT MAX(DATACOTAACAO) ' + #13 +
                            '                      FROM COTACAOACAO ' + #13 +
                            '                      WHERE IDACAO = ' + IntToStr(IDINVESTIMENTO) + ' ' + #13 +
                            '                        AND DATACOTAACAO <= TO_DATE('+QuotedStr(FormatDateTime('dd/mm/yyyy', DATAORDEM)) +','+ QuotedStr('dd/mm/yyyy') + '))' ) then
            Result := QryAux.FieldByName('QTDELOTE').AsInteger;
      end;
      if Result = 0 then
      begin
         if FazQuery(QryAux,'SELECT DISTINCT QTDELOTE '+
                            'FROM ACOESXBOLSA '+
                            'WHERE IDACAO = ' + QuotedStr(IntToStr(IDINVESTIMENTO))) then
            Result := QryAux.FieldByName('QTDELOTE').AsInteger;
      end;
      rQtdLote.Value  := Result;
      iUltInv := IDINVESTIMENTO;
      dUltData:= Trunc(DATAORDEM);
   end;
   //AL_15 - Fim
End;

function TfrmOrdemMovimentacao.AtualizaLote(IDINVESTIMENTO : Integer; DATAORDEM: TDateTime) : Double;
Var
  //AL_20
  wQtdLote: double;
begin
// Busca a Quantidade por Lote na Bolsa
   //AL_15
   //AL_20
   AtualizaLoteGrid(IDINVESTIMENTO, DATAORDEM);
   wQtdLote := rQtdLote.Value;
   Result   := (DivValorZero((QryDetalhe.FieldByName('PUORDMOVINV').AsFloat *
                             QryDetalhe.FieldByName('QTDEORDENADA').AsFloat),wQtdLote)-0.0049);
End;


procedure TfrmOrdemMovimentacao.AtualizaQtdAtual;
Var
  wQtdInvest, wSaldoInutil, wQtdCPMF : Double;
begin
   //AL_1
   //AL_2
   //AL_7
   //AL_8
   //AL_11
   //AL_12 - BuscaSaldos em 3 camadas
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009   
   CtrlRV.BuscaSaldoRV.Executa(dbDtaOperacao.DateTime, qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                               QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger,
                               QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger,
                               9999999, -1, QryDetalhe.FieldByName('IDLOTE').AsString);

   //AL_3
   if QryBuscaOperacaoFLGCONTAINVEST.AsInteger = 1 then
      rQtdAtual.Value    := CtrlRV.BuscaSaldoRV.SaldoQtdCCI
   else
      rQtdAtual.Value    := CtrlRV.BuscaSaldoRV.SaldoQtdCC;
End;

procedure TfrmOrdemMovimentacao.AtualizaQtdPrevista;
begin
   rTotalOperacao.Value := 0;
   rQtdPrevista.Value   := rQtdAtual.Value;
   QryDetalhe.DisableControls;
   QryDetalhe.First;
   While Not QryDetalhe.EOF Do
   Begin
     If (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
        (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
        (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
        (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
     Begin
        //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
        if (QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger = QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger) then
        begin
           rQtdPrevista.Value   := rQtdPrevista.Value +
                                   QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
           rTotalOperacao.Value := rTotalOperacao.Value + QryDetalhe.FieldByName('VALOR').AsFloat;
        end;
     End
     Else If (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
             (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
             (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
             (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
             (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
     Begin
        //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
        if (QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger = QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger) then
        begin
           rQtdPrevista.Value   := rQtdPrevista.Value -
                                   QryDetalhe.FieldByName('QTDEORDENADA').AsFloat ;
           rTotalOperacao.Value := rTotalOperacao.Value - QryDetalhe.FieldByName('VALOR').AsFloat;
        end;           
     End;
     QryDetalhe.Next;
   End;
   QryDetalhe.First;
   QryDetalhe.EnableControls;
End;


procedure TfrmOrdemMovimentacao.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
     //Ricardo Cristiano - 12/04/2011 - N. Sol 1155955 -  N. Kintana 1229268
     If MontaSelect.ValoresChave[1] <> '' Then
     Begin
        If (pRPI.FLGCARTGERENC = 'S') And (MontaSelect.ValoresChave[7] <> '') Then
        Begin
           If QryBuscaCarteira.Locate('IDCARTEIRAGERENC', MontaSelect.ValoresChave[7], [loPartialKey]) Then
              dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString
           Else
              dblCarteira.Text := '';
        End
        Else
        Begin
           If QryBuscaCarteira.Locate('IDCARTEIRAINVEST', MontaSelect.ValoresChave[1], [loPartialKey]) Then
              dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString
           Else
              dblCarteira.Text := '';
        End;
     End
     Else
        dblCarteira.Text    := '';
   //Ricardo Cristiano - 12/04/2011 - N. Sol 1155955 -  N. Kintana 1229268 - FIM
   bDelete := False;
   CmeCadastroAtualizaBotoes(Sender);
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   if pRPI.REGRABOLETA = '1' then
      bbtnCancelar.Enabled := (not QryDetalhe.IsEmpty);

    //Thiago Passos SOL 117351 19/08/2009
  if QryDetalhe.FieldByname('TipoInclusao').AsString = 'I' Then //Importacao
     BtDelDet.Enabled := False else BtDelDet.Enabled := True;
end;

procedure TfrmOrdemMovimentacao.dbgOperacaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),TwwDBgridOption(dgAlwaysShowEditor),TwwDBgridOption(dgTitles),TwwDBgridOption(dgIndicator),
                             TwwDBgridOption(dgColumnResize),TwwDBgridOption(dgColLines),TwwDBgridOption(dgRowLines),TwwDBgridOption(dgCancelOnExit)])
   Then
      Key := 0;

  inherited;
end;

procedure TfrmOrdemMovimentacao.dbgOperacaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),TwwDBgridOption(dgAlwaysShowEditor),TwwDBgridOption(dgTitles),TwwDBgridOption(dgIndicator),
                             TwwDBgridOption(dgColumnResize),TwwDBgridOption(dgColLines),TwwDBgridOption(dgRowLines),TwwDBgridOption(dgCancelOnExit)])
   Then
      Key := 0;
  inherited;
end;

procedure TfrmOrdemMovimentacao.BtIncDetClick(Sender: TObject);
Var
   sTime : String;
begin

   // Verifica os campos da principal e da detalhe
   If Not ValidaCamposPrincipal Then
   Begin
      BtIncDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   // Não permitir Compra ou Venda de Opções na data de Vencimento
   if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -72) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -75) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -78) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -81)) then
   begin
      if dbDtaOperacao.Date = QryInvestimentoAcaoDTAVENCTO.AsDateTime then
      begin
         //Ricardo Cristiano - 12/04/2011 - N. Sol 1155955 -  N. Kintana 1229268
         MsgDlg('A operação não é permitida no Vencimento da Opção.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         BtIncDet.Down := False;
         bTrocaLine    := True;
         Exit;
      end;
   end;

   //Ricardo Cristiano - 12/04/2011 - N. Sol 155955 -  N. Kintana 1229268
   if FazQuery(QryAux,'SELECT STATUS FROM BOLETA WHERE IDBOLETA = '+QuotedStr(dbDocumento.Text)) then
   begin
      if QryAux.FieldByName('STATUS').AsString = 'F' then
      begin
         If MsgDlg('Essa Boleta está fechada! Desejar continuar, será criada uma nova boleta?', 'Mensagem do Sistema ', mtConfirmation , [mbYes, mbNo], 0) = mrYes Then
         begin
            bForcaBoleta := True;
            PosicionaNumDocumento;
            sNumDocumento := dbDocumento.Text;
            QryDetalhe.Close;
            dbDocumento.Text := sNumDocumento;
            Refresh;
            dbDocumento.Text := sNumDocumento;            
            bForcaBoleta  := False;
         end
         else
         begin
            BtIncDet.Down := False;
            bTrocaLine    := True;
            Exit;
         end;
      end;
   end;

   //Ricardo Cristiano - 12/04/2011 - N. Sol 155955 -  N. Kintana 1229268
   If QryDetalhe.FieldByName('STATMOVINV').AsString = 'L' Then
   Begin
      If MsgDlg('O Cálculo de Despesa já foi processado para essa Boleta! Desejar continuar, será criada uma nova boleta?', 'Mensagem do Sistema ', mtConfirmation , [mbYes, mbNo], 0) = mrYes Then
      begin
         bForcaBoleta := True;
         PosicionaNumDocumento;
         sNumDocumento := dbDocumento.Text;
         QryDetalhe.Close;
         dbDocumento.Text := sNumDocumento;
         Refresh;
         dbDocumento.Text := sNumDocumento;
         bForcaBoleta  := False;
      end
      else
      begin
         BtIncDet.Down := False;
         bTrocaLine    := True;
         Exit;
      end;
   End;   

  inherited;

  //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
  If QryDetalhe.IsEmpty Then
  begin
     CmeCadastroAtualizaBotoes(Sender);
     bbtnCancelar.Enabled := (pRPI.REGRABOLETA = '1');
  end;

   IDORDMOVINV := LeUltRegistro(nil,'ORDMOVINV');

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtOkDet.Enabled     := True;
   BtCancDet.Enabled   := True;
   BtVoltaDet.Enabled  := True;

   DesabilitaCampos;

   If QryDetalhe.IsEmpty Then
      dbgOperacao.Enabled := True;

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;
   dbgOperacao.SetFocus;

   if QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger = pRPI.IDCARTOPC then // Carteira de Opções
   begin
      dbgSelecao.Columns[3].Title.Caption := 'Opção';
      QryDetalhePUORDMOVINV.DisplayLabel  := 'Prêmio';
   end
   else
   begin
      dbgSelecao.Columns[3].Title.Caption := 'Ação';
      QryDetalhePUORDMOVINV.DisplayLabel  := 'Preço';
   end;

   bTrocaLine := False;

   sNumDocumento       := dbDocumento.Text;
   QryDetalhe.Append;

   // Se Compra ou Venda -> Buscar o Saldo de Qtd do Lote
   if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -72) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -75) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -78) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -81)) then
   begin
      QryDetalhe.FieldByName('IDLOTE').AsString      := MontaIdLoteOpcoes;
   end;

   // Se Exercício de Opções -> Buscar o Saldo de Qtd do Lote
   if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -74) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -77) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -80) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -83)) then
   begin
      QryDetalhe.FieldByName('IDLOTE').AsString      := MontaIdLoteOpcoes;
      QryDetalhe.FieldByName('PUORDMOVINV').AsFloat  := qryOpcao.FieldByName('VLRPRECOEX').AsFloat;
      QryDetalhe.FieldByName('QTDEORDENADA').AsFloat := ABS(DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat);
      QryDetalhe.FieldByName('VALOR').AsFloat        := (ABS(DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat) *
                                                         DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('VLRPRECOEX').AsFloat)
   end;

   QryDetalhe.FieldByName('NUMDOCMOVINV').AsString := sNumDocumento;

   If Length(TimeToStr(Time)) <> 8 Then
      sTime := ' '+TimeToStr(Time)
   Else
      sTime := TimeToStr(Time);

   sTime := Copy(sTime,1,5);

   QryDetalhe.FieldByName('HORAMOV').AsString      := sTime;
   QryDetalhe.FieldByName('QTDEORDMOVINV').AsFloat := 0;

   If dblBolsa.Text <> '' Then
      QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger :=
                  QryBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

   dbDocumento.Text    := sNumDocumento;

   DtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmOrdemMovimentacao.BtOkDetClick(Sender: TObject);
Var
   sTime       : String;
   idCustodia, iIDOrdMovInv   : Integer;
   wQtdInvest,    wVlrSaldoInvest, wSaldoInutil, fTotalOperacao, fQuantidade,
   fQtdeOrdenada, fPreco, fVlrATransf : Double;
   //André L. Santos - 07/08/2008 - N. Sol 92477 -  N. Kintana 394862
   TState : TDataSetState;
begin
   bTrocaLine := True;
   //André L. Santos - 07/08/2008 - N. Sol 92477 -  N. Kintana 394862
   TState := QryDetalhe.State;
//------------------------------------------------------------------------------
// Verifica os campos da detalhe
   If Not ValidaCamposDetalhe Then
   Begin
      bTrocaLine := False;
      Exit;
   End;

   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   if (dbDocumento.text = '') then
      PosicionaNumDocumento;

   QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime := StrToDateTime(dbDtaOperacao.Text+
                                                     ' '+QryDetalhe.FieldByName('HORAMOV').AsString);
   //André L. Santos - 07/08/2008 - N. Sol 92477 -  N. Kintana 394862
   If (QryDetalhe.State = DsInsert) Then
   Begin
      if ((QryDetalhe.FieldByName('QTDEORDENADA').Text <>  '') and
         (QryDetalhe.FieldByName('QTDEORDENADA').AsFloat > rQtdPrevista.Value)) and (bTipoVenda) then
      begin
         MsgDlg('Quantidade ordenada é maior que a quantidade prevista.',
                'Mensagem do Sistema', mtWarning,[MbOk],0);
         dbgOperacao.SelectedIndex:=2;
         Exit;
      end;
   end
   else
   If (QryDetalhe.State = DsEdit)Then
   Begin
      if ((QryDetalhe.FieldByName('QTDEORDENADA').Text <>  '') and
         (QryDetalhe.FieldByName('QTDEORDENADA').AsFloat > rQtdAtual.Value)) and (bTipoVenda) then
      begin
         MsgDlg('Quantidade ordenada é maior que a quantidade prevista.',
                'Mensagem do Sistema', mtWarning,[MbOk],0);
         dbgOperacao.SelectedIndex:=2;
         Exit;
      end;
   end;


   If QryDetalhe.State = DsInsert Then
   Begin
      QryDetalhe.FieldByName('IDUSUARIO').AsInteger        := Sistema.IdUsuario;
      QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger     := 2;

      If Trim(dblCarteira.Text) <> '' Then
      Begin
         QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                    QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

         QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger :=
                    QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;
         If QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 Then
            QryDetalhe.FieldByName('IDCARTEIRAGERENC').Clear;
      End;

      QryDetalhe.FieldByName('IDCORRETVALORES').AsInteger  :=
                 QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;

      QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger :=
                 QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger :=
                 QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger;
      QryDetalhe.FieldByName('IDBOLSAVALORES').AsInteger :=
                 QryBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009                 
      if pRPI.FLGPLANPREVCTBPAT = 'S' then
         QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger
      else
         QryDetalhe.FieldByName('IDPLANPREVCTBPATR').Clear;

      If wTipoOrdMov = 'N' then
         QryDetalhe.FieldByName('STATMOVINV').AsString   := 'A'
      Else
         QryDetalhe.FieldByName('STATMOVINV').AsString   := '';

      QryDetalhe.FieldByName('IDORDMOVINV').AsInteger    := IDORDMOVINV;
   End;

   QryDetalhe.FieldByName('QTDEORDMOVINV').AsFloat := QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;

   If QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
   begin
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      CtrlRV.BuscaSaldoRV.Executa(dbDtaOperacao.DateTime, qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                  QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                                  QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                  QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                  9999999, -1, QryDetalhe.FieldByName('IDLOTE').AsString);

      If (CtrlRV.BuscaSaldoRV.SaldoQtdTotal < QryDetalhe.FieldByName('QTDEORDMOVINV').AsFloat) then
      begin
         // AL_6
         MsgDlg('Não é permitida a venda a descoberto. ' + #13 +
                'Não há Saldo suficiente na Carteira ' + #13 +
                '       ' + QryBuscaCarteiraDESCCARTINVEST.AsString + #13 +
                'para essa operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Exit;
      end;

   end;

   idCustodia     := QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger;
   fQuantidade    := QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
   fPreco         := QryDetalhe.FieldByName('PUORDMOVINV').AsFloat;
   fTotalOperacao := QryDetalhe.FieldByName('VALOR').AsFloat;

   // Quando a operação for Venda de Opções de Compra -> Testa se o Invest.Baset tem saldo para TRC para Cart.Opções
   // testando também se é uma reversão de uma Posição Comprada. (TRC somente da posição que for ficar vendida. A
   // Reversão da Posição Comprada não deve ser transferida.
   if (QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger = pRPI.IDCARTOPC) and // Carteira de Opções e
      (QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger = -75) then              // Venda de Opções de Compra
   begin
      Opcoes.BuscaSaldosOpcoes(dbDtaOperacao.Date,
                               QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger,
                               pRPI.IDCARTOPC,
                               //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
                               qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                               QryDetalhe.FieldByName('IDLOTE').AsString);

      if DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat > 0 then // A Posição está Comprada
      begin
         fVlrATransf := (QryDetalhe.FieldByName('QTDEORDENADA').AsFloat -
                         DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat);
         if fVlrATransf > 0 then
         begin
            //AL_1
            //AL_2
            //AL_7
            //AL_8
            //AL_11
            //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
            CtrlRV.BuscaSaldoRV.Executa(dbDtaOperacao.DateTime, qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR ').AsInteger,
                                        QryInvestimentoAcao.FieldByName('IDINVESTBASE').AsInteger,
                                        pRPI.IDCARTAVISTA);

            if fVlrATransf > CtrlRV.BuscaSaldoRV.SaldoQtdTotal then
            begin
               MsgDlg('A Ação Base não possui saldo para '+#13+
                      'Transferir para a Carteira de Opções.',
                      'Mensagem do Sistema ',mtWarning,[mbOK],0);
               Exit;
            end;
         end;
      end;
   end;

   Try
     QryDetalhe.Post;
     QryDetalhe.ApplyUpdates;
     QryDetalhe.CommitUpdates;
     fQtdeOrdenada := QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
     iIDOrdMovInv  := QryDetalhe.FieldByName('IDORDMOVINV').AsInteger;
   Except
     MsgDlg('Não foi possível realizar a Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     CancelaOperacao;
     QryDetalhe.Close;
     QryDetalhe.Open;
     AlimentaQryDetalhe;
     Exit;
   End;

   DtmBaseDados.dbBaseDados.Commit;

   IDORDMOVINV := QryDetalhe.FieldByName('IDORDMOVINV').AsInteger;

   HabilitaCampos;
   BtIncDet.Enabled    := True;
   BtAltDet.Enabled    := True;
   BtDelDet.Enabled    := True;
   BtOkDet.Enabled     := False;
   BtCancDet.Enabled   := False;
   BtVoltaDet.Enabled  := False;

   dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   //AL_13

   QryDetalhe.DisableControls;
   QryDetalhe.Locate('IDORDMOVINV', IDORDMOVINV, [loPartialKey]);
   QryDetalhe.EnableControls;

   //André L. Santos - 07/08/2008 - N. Sol 92477 -  N. Kintana 394862
   If not (TState = DsEdit)Then
     QtdePrevista(iIdOrdMovInv,fQtdeOrdenada,fTotalOperacao);

   If BtIncDet.Down Then
   Begin
      // Se operações diferente de Exercício de Opções
      if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger <> -74) and
          (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger <> -77) and
          (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger <> -80) and
          (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger <> -83)) then
      begin
         BtIncDet.Click;
         If Length(TimeToStr(Time)) <> 8 Then
            sTime := ' '+TimeToStr(Time)
         Else
            sTime := TimeToStr(Time);

         sTime := Copy(sTime,1,5);
         QryDetalhe.FieldByName('HORAMOV').AsString        := sTime;
         QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger := idCustodia;
         QryDetalhe.FieldByName('PUORDMOVINV').AsFloat     := fPreco;
         QryDetalhe.FieldByName('QTDEORDENADA').AsFloat    := fQuantidade;
      end
      Else
      Begin
         BtIncDet.Down       := False;
         BtAltDet.Down       := False;
         BtDelDet.Down       := False;
      End;
   End
   Else
   Begin
      BtIncDet.Down       := False;
      BtAltDet.Down       := False;
      BtDelDet.Down       := False;
   End;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   bbtnConfirmar.Enabled  := True;
   bbtnCancelar.Enabled   := False;   
end;

procedure TfrmOrdemMovimentacao.BtAltDetClick(Sender: TObject);
begin
  inherited;
   If QryDetalhe.FieldByName('STATMOVINV').AsString = 'L' Then
   Begin
      MsgDlg('Ordem de Movimentação já Calculada. Não pode ser Alterada.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      BtAltDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
   If (QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger <> QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger) Then
   Begin
      MsgDlg('Selecione a Ação correta para alteração.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      BtAltDet.Down := False;
      bTrocaLine    := True;
      if dblAcao.CanFocus then
         dblAcao.SetFocus;
      Exit;
   End;

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtOkDet.Enabled     := True;
   BtCancDet.Enabled   := True;
   BtVoltaDet.Enabled  := True;

   DesabilitaCampos;

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;
   dbgOperacao.SetFocus;

   bTrocaLine := False;

   sNumDocumento    := dbDocumento.Text;
   IDORDMOVINV      := QryDetalhe.FieldByName('IDORDMOVINV').AsInteger;

   QryDetalhe.Edit;
   QryDetalhe.FieldByName('NUMDOCMOVINV').AsString := sNumDocumento;
   dbDocumento.Text := sNumDocumento;

   DtmBaseDados.dbBaseDados.StartTransaction;

end;

procedure TfrmOrdemMovimentacao.BtDelDetClick(Sender: TObject);
Var
   sNATUREZAOPERACAO : String;
   fTotalOperacao, fQtdeOrdenada     : Double;
begin
  inherited;
   bDelete := True;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
   if QryDetalhe.IsEmpty then
      Exit;

   If QryDetalhe.FieldByName('STATMOVINV').AsString = 'L' Then
   Begin
      MsgDlg('Ordem de Movimentação já Calculada. Não pode ser Excluída.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      bDelete       := False;
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   // AL_6
   If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ', mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
   Begin
      bDelete       := False;
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   sNATUREZAOPERACAO := QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString;
   fQtdeOrdenada     := QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
   fTotalOperacao    := QryDetalhe.FieldByName('VALOR').AsFloat;

   //--- Exclui a linha corrente
   Try
      DtmBaseDados.dbBaseDados.StartTransaction;
      QryDetalhe.Delete;
      QryDetalhe.ApplyUpdates;
      QryDetalhe.CommitUpdates;
      DtmBaseDados.dbBaseDados.Commit;
   Except
      // AL_6 - Ini
      On E: Exception do
      begin
         // Rollbacka Transação
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível exclui a ordem ' + #13 +
                E.Message,
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         bDelete := False;
      end;
      //AL_6 - Fim
   End;

   If (sNATUREZAOPERACAO = 'A') Or (sNATUREZAOPERACAO = 'V') Or
      (sNATUREZAOPERACAO = 'U') Or (sNATUREZAOPERACAO = 'M') Then
   Begin
      rQtdPrevista.Value   := rQtdPrevista.Value - fQtdeOrdenada;
      rTotalOperacao.Value := rTotalOperacao.Value - fTotalOperacao;
   End
   Else If (sNATUREZAOPERACAO = 'D') Or (sNATUREZAOPERACAO = 'S') Or (sNATUREZAOPERACAO = 'O') Or
           (sNATUREZAOPERACAO = 'R') Or (sNATUREZAOPERACAO = 'I') Then
   Begin
      rQtdPrevista.Value   := rQtdPrevista.Value + fQtdeOrdenada;
      rTotalOperacao.Value := rTotalOperacao.Value + fTotalOperacao;
   End;

   If QryDetalhe.IsEmpty Then
   Begin
      dbDtaOperacao.Text     := DateToStr(pRPI.DATAMOVTORV);
      dblCarteira.Text       := '';
      dblSiglaCorretora.Text := '';
      //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
      dblPlanoPatro.Text     := '';
      dblOperacao.Text       := '';
      dblAcao.Text           := '';
      dblBolsa.Text          := '';
      dbDocumento.Text       := '';
      dblkOpcao.Text         := '';
      rQtdLote.Text          := '0';
      rQtdAtual.Text         := '0';
      rQtdPrevista.Text      := '0';
      rTotalOperacao.Text    := '0,00';

      DesabilitaCamposDetalhe;

      HabilitaCampos;

      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009      
      bbtnCancelar.Enabled      := False;
      //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
      bbtnConfirmar.Enabled     := False;

      dbDtaOperacao.Enabled     := (pRPI.REGRABOLETA = '1');
      dblSiglaCorretora.Enabled := (pRPI.REGRABOLETA = '1');
      dblPlanoPatro.Enabled     := (pRPI.REGRABOLETA = '1');

      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;
   End
   Else
   //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
   begin
      HabilitaCamposDetalhe;

      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      if pRPI.REGRABOLETA = '1' then      
         bbtnCancelar.Enabled      := True;      
   end;
   
   bDelete := False;
end;

procedure TfrmOrdemMovimentacao.BtCancDetClick(Sender: TObject);
begin
  inherited;
   CancelaOperacao;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   bbtnCancelar.Enabled := ((QryDetalhe.IsEmpty) and (pRPI.REGRABOLETA = '1'));

end;

procedure TfrmOrdemMovimentacao.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009 
   if (pRPI.REGRABOLETA <> '1') then
   begin
      //AL_17 - Posiciona query de Carteiras
      if Trim(dbDtaOperacao.Text) <> '' then
         MontaQryCart(dbDtaOperacao.DateTime)
      else
         MontaQryCart(CtrlPInv.DataUltFech);
      dblCarteira.PerformSearch;

      AbreQry;

      AtualizaQtdPrevista;

      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   end;
end;

procedure TfrmOrdemMovimentacao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)

end;

procedure TfrmOrdemMovimentacao.ApuraSaldoIR;
var wdiv,wqtd : double;
begin
   If  (QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D') And
      ((QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString ='G')  or    // F.Gerador -> Ganho Capital
       (QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString ='V')) Then  // F.Gerador -> Valor da Operação
   Begin
      fVrlRendimento := 0;
      QryDetalhe.FieldByName('VLRIR').AsFloat :=
          Impostos.CalculaIr(2,
                    QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger, 0,
                    QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                    QryBuscaOperacao.FieldByName('IDMERCADO').AsInteger,
                    QryDetalhe.FieldByName('IDLOTE').AsString,
                    StrToDate(dbDtaOperacao.Text),
                    StrToDate(dbDtaOperacao.Text),
                   (QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat* DivValorZero(wSaldoAqui,wSaldoQtd)),
                    QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                    0,
                    'S',
                    QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString,
                    fVrlRendimento);

       // Verifica se existe provisionamento de IR
       If Impostos.BuscaProvisaoIR(2,QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger) then
          wVlrIRProv := (DivValorZero(wSaldoIRApu,wSaldoQtd)* QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat )* -1;
   End;
end;

procedure TfrmOrdemMovimentacao.CancelaOperacao;
begin
   bTrocaLine := True;

   HabilitaCampos;

   BtIncDet.Enabled    := True;
   BtAltDet.Enabled    := True;
   BtDelDet.Enabled    := True;
   BtOkDet.Enabled     := False;
   BtCancDet.Enabled   := False;
   BtVoltaDet.Enabled  := False;

   BtIncDet.Down       := False;
   BtAltDet.Down       := False;
   BtDelDet.Down       := False;

   QryDetalhe.Cancel;

   DtmBaseDados.dbBaseDados.Rollback;

   dbgOperacao.Options       := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clGray;
   //AL_13
   dbgOperacao.SetFocus;

   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   dbDocumento.Text    := sNumDocumento;
   AbreQry;
   AlimentaQryDetalhe;

   If QryDetalhe.IsEmpty Then
   Begin
      DesabilitaCamposDetalhe;
      BtIncDet.Enabled := True;
   End;
end;

function TfrmOrdemMovimentacao.ValidaCamposPrincipal : Boolean;
begin
   // AL_6 - Ini
   Result := True;
   If dbDtaOperacao.Text = '' Then
   Begin
      MsgDlg('Informe a Data de Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;
      Result := False;
      Exit;
   End;
   
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   If ((pRPI.REGRABOLETA = '1') and (dblPlanoPatro.Text = '')) Then
   Begin
      MsgDlg('Informe o Plano/Patro.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblPlanoPatro.Canfocus then
         dblPlanoPatro.SetFocus;
      Result := False;
      Exit;
   End;

   // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
   if (dblCarteira.Text = '') and (sRegraBoleta = '0') then
   begin
      MsgDlg('Informe a Carteira.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblCarteira.CanFocus then
         dblCarteira.SetFocus;
      Result := False;
      Exit;
   end;
   // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011

   If dblSiglaCorretora.Text = '' Then
   Begin
      MsgDlg('Informe a Sigla da Corretora.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblSiglaCorretora.Canfocus then
         dblSiglaCorretora.SetFocus;
      Result := False;
      Exit;
   End;

   If dblOperacao.Text = '' Then
   Begin
      MsgDlg('Informe o Tipo de Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbgOperacao.CanFocus then
         dbgOperacao.SetFocus;
      Result := False;
      Exit;
   End;

   If dblAcao.Text = '' Then
   Begin
      MsgDlg('Informe o Investimento.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblAcao.Canfocus then
         dblAcao.SetFocus;
      Result := False;
      Exit;
   End;

   If dblBolsa.Text = '' Then
   Begin
      MsgDlg('Informe a Bolsa.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblBolsa.CanFocus then
         dblBolsa.SetFocus;
      Result := False;
      Exit;
   End;


   // Se a Opção for Americana, Não pode exercer antes do Vencimento
   if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -74) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -77) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -80) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -83)) then // Exercício de Opções
   begin
      if (QryInvestimentoAcaoSTATPAMERICANA.AsString = 'S') and
         (dbDtaOperacao.Date <> QryInvestimentoAcaoDTAVENCTO.AsDateTime) then
      begin
         MsgDlg('A opção é do Tipo Americana e não pode ser Exercida antes do Vencimento.',
                'Mensagem do Sistema', MtWarning,[MbOk],0);
         if dblAcao.CanFocus then
            dblAcao.SetFocus;
         Result := False;
         Exit;
      End;
   end;
   // AL_6 - Ini
end;

function TfrmOrdemMovimentacao.ValidaCamposDetalhe : Boolean;
begin
   // AL_6 - Ini
   try
      Result := True;
      If QryDetalhe.FieldByName('HORAMOV').IsNull Then
      Begin
         MsgDlg('Informe a Hora. ', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         Result := False;
         Exit;
      End;

      If QryDetalhe.FieldByName('QTDEORDENADA').IsNull Then
      Begin
         MsgDlg('Informe a Quantidade Negociada.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         Result := False;
         Exit;
      End;

      If QryDetalhe.FieldByName('PUORDMOVINV').IsNull Then
      Begin
         MsgDlg('Informe o Preço. ', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         Result := False;
         Exit;
      End;

      If (QryDetalhe.FieldByName('VALOR').IsNull) Then
      Begin
         MsgDlg('Informe o Valor da Operação.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         Result := False;
         Exit;
      End;
   finally
      if (not Result) and (dbgOperacao.CanFocus) then
         dbgOperacao.SetFocus;
   end;
   // AL_6 - Fim
end;

Function TfrmOrdemMovimentacao.DivValorZero(Valor1, Valor2: Extended): Extended;
Begin
   If Valor2 <> 0 Then
      Result :=Valor1/Valor2
   Else
      Result := 0;
End;

procedure TfrmOrdemMovimentacao.dbgOperacaColExit(Sender: TObject);
begin
  inherited;
   If (dbgOperacao.Options = [TwwDBgridOption(dgEditing),TwwDBgridOption(dgAlwaysShowEditor),TwwDBgridOption(dgTitles),TwwDBgridOption(dgIndicator),
                              TwwDBgridOption(dgColumnResize),TwwDBgridOption(dgColLines),TwwDBgridOption(dgRowLines),TwwDBgridOption(dgCancelOnExit)])
   Then
   Begin
      CalculaOperacao;
   End;
end;

procedure TfrmOrdemMovimentacao.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     // AL_6
     MsgDlg('Não é permitido alterar o outro registro.',
            'Mensagem do Sistema', mtWarning,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmOrdemMovimentacao.dbgOperacaoColExit(Sender: TObject);
begin
  inherited;
   If (QryDetalhe.State = DsInsert) Or (QryDetalhe.State = DsEdit)Then
      CalculaOperacao;   
end;

procedure TfrmOrdemMovimentacao.dbgOperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin      

   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),
                              TwwDBgridOption(dgAlwaysShowEditor),
                              TwwDBgridOption(dgTitles),
                              TwwDBgridOption(dgIndicator),
                              TwwDBgridOption(dgColumnResize),
                              TwwDBgridOption(dgColLines),
                              TwwDBgridOption(dgRowLines),
                              TwwDBgridOption(dgAlwaysShowSelection),
                              TwwDBgridOption(dgCancelOnExit),
                              TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;
  inherited;
end;

procedure TfrmOrdemMovimentacao.dbgOperacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),
                              TwwDBgridOption(dgAlwaysShowEditor),
                              TwwDBgridOption(dgTitles),
                              TwwDBgridOption(dgIndicator),
                              TwwDBgridOption(dgColumnResize),
                              TwwDBgridOption(dgColLines),
                              TwwDBgridOption(dgRowLines),
                              TwwDBgridOption(dgAlwaysShowSelection),
                              TwwDBgridOption(dgCancelOnExit),
                              TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;
  inherited;
end;

procedure TfrmOrdemMovimentacao.dbgOperacaoEnter(Sender: TObject);
begin
  inherited;
   KeyPreview := False;
end;

procedure TfrmOrdemMovimentacao.dbgOperacaoExit(Sender: TObject);
begin
  inherited;
   KeyPreview := True;
   If (QryDetalhe.State = DsInsert) Or (QryDetalhe.State = DsEdit)Then
   Begin
      If Pos(':',QryDetalhe.FieldByName('HORAMOV').AsString) = 0 Then
         QryDetalhe.FieldByName('HORAMOV').AsString :=
                    Copy(QryDetalhe.FieldByName('HORAMOV').AsString,1,2)+':'+
                    Copy(QryDetalhe.FieldByName('HORAMOV').AsString,3,2);

      CalculaOperacao;
   End;
end;

//Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
                              
Procedure TfrmOrdemMovimentacao.PosicionaNumDocumento;
Begin
   //Ricardo Cristiano - 12/04/2011 - N. Sol 155955 -  N. Kintana 1229268
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   if ((pRPI.REGRABOLETA = '1') or (bForcaBoleta)) then
      dbDocumento.Text :=  'RV-'+Copy(dbDtaOperacao.Text,9,2)+'/'+FormatFloat('0000',
             LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbDtaOperacao.Text,9,2)))
   else
   begin
      //AL_3
      With QryNumDocumento, OperComum Do
      Begin
         DisableControls;
         LimpaParametros(QryNumDocumento);
         if Trim(dbDtaOperacao.Text) <> '' then
            ParamByName('DATAORDMOVINV').AsString := dbDtaOperacao.Text;

         if pRPI.FLGPLANPREVCTBPAT = 'S' then
            //AL_12
            ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

         if Trim(dblSiglaCorretora.Text) <> '' then
            ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         if Trim(dblOperacao.Text) <> '' then
            ParamByName('FLGCONTAINVEST').AsInteger := QryBuscaOperacao.FieldByName('FLGCONTAINVEST').AsInteger;

         //Otacilio - 11/10/2011 SOL 166525 Kintana 1449344 Altera a query QryNumDocumento **Inicio**
         if (pRPI.REGRABOLETA = '0') then
         begin
            if Trim(dblCarteira.Text) <> '' then
               ParamByName('IDCARTEIRAINVEST').AsInteger := QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
         end;
         //Otacilio - 11/10/2011 SOL 166525 Kintana 1449344 Altera a query QryNumDocumento **Fim**
         
         Open;

         If Not FieldByName('NUMDOCMOVINV').IsNull Then
            dbDocumento.Text := FieldByName('NUMDOCMOVINV').AsString
         Else
            dbDocumento.Text :=  'RV-'+Copy(dbDtaOperacao.Text,9,2)+'/'+FormatFloat('0000',
                 LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbDtaOperacao.Text,9,2)));
         Close;
      End;
   end;
End;

procedure TfrmOrdemMovimentacao.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryBuscaOperacao);
   QryBuscaOperacao.ParamByName('IDMERCADOOPC').AsInteger := 3;
   if QryBuscaCarteiraIDCARTEIRAINVEST.AsInteger = pRPI.IDCARTOPC then // Carteira de Opções
   begin
      QryBuscaOperacao.ParamByName('IDMERCADO').AsInteger := 3; // Mercado de Opções
      QryBuscaOperacao.ParamByName('IDMERCADOOPC').AsInteger := 0;
   end;
   QryBuscaOperacao.Open;
   if QryBuscaCarteiraIDCARTEIRAINVEST.AsInteger = pRPI.IDCARTOPC then // Carteira de Opções
   begin
      bOpcao    := True;
      sStaOpcao := 'S';
   end
   else
   begin
      bOpcao    := False;
      sStaOpcao := 'N';
   end;

   AbreQryInvestimento(-1,sStaOpcao,bOpcao);
   
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   if pRPI.REGRABOLETA <> '1' then
      Refresh;
end;

procedure TfrmOrdemMovimentacao.Refresh;
begin
   If Not bDelete Then
   Begin
      AbreQry;

      // AL_4
      if (Trim(dblOperacao.Text) <> '') and  (Trim(dblAcao.Text) <> '')  then
      begin
         QryVerOperDayTrade.Close;
         QryVerOperDayTrade.ParamByName('DATAORDMOVINV').AsString   := dbDtaOperacao.Text;
         QryVerOperDayTrade.ParamByName('IDINVESTIMENTO').AsInteger :=
                                QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger;
         QryVerOperDayTrade.ParamByName('IDTIPOOPERACAO').AsInteger :=
                                QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
         QryVerOperDayTrade.ParamByName('NATUREZAOPERACAO').AsString :=
                                QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString;
         QryVerOperDayTrade.Open;

         if (not QryVerOperDayTrade.IsEmpty) then
         begin
            // AL_6
            //Al_16
            MsgDlg('Não é permitido operar Day Trade.' + #13 +
                   'Já existe uma ordem de :' + #13 +
                   QryVerOperDayTrade.FieldByName('DESCTIPOOPERACAO').AsString+'" ' + #13 +
                   'para o Investimento ' + #13 +
                   QryInvestimentoAcao.FieldByName('SIGLAACAOBOLSA').AsString + #13 +
                   'nesta mesma data.',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            dblOperacao.Clear;
            if dblOperacao.CanFocus then
               dblOperacao.SetFocus;
         end;
      end;

      AtualizaQtdPrevista;

      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;
   End;
end;

procedure TfrmOrdemMovimentacao.QtdePrevista(iIdOrdMovInv : Integer; fQtdeOrdenada, fTotalOperacao : Double);
begin
   qryOrdMovInv.Close;
   qryOrdMovInv.ParamByName('IDORDMOVINV').AsInteger := iIdOrdMovInv;
   qryOrdMovInv.Open;

   If (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
      (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
      (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
      (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
   Begin
       rQtdPrevista.Value   := rQtdPrevista.Value   + fQtdeOrdenada;
       rTotalOperacao.Value := rTotalOperacao.Value + fTotalOperacao;
   End
   Else If (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
           (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
           (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
           (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
           (qryOrdMovInv.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
   Begin
       rQtdPrevista.Value   := rQtdPrevista.Value - fQtdeOrdenada;
       rTotalOperacao.Value := rTotalOperacao.Value - fTotalOperacao;
   End;
end;

procedure TfrmOrdemMovimentacao.dblAcaoExit(Sender: TObject);
//Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
var sDocumento : String;
Begin
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   sDocumento := dbDocumento.Text;
  inherited;
   //Ricardo Cristiano - 04/12/2009 - N. Sol 128242 -  N. Kintana 684686   
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
//   If ((Not bDelete) and ((pRPI.REGRABOLETA = '1')   and

   If ((Not bDelete) and (
                          (dbDtaOperacao.Text <> '') and (dblSiglaCorretora.Text <> '') and (dblPlanoPatro.Text <> '') and
                          (dblCarteira.Text <> '')   and (dblOperacao.Text <> ''))) Then
   Begin
      AbreQry;
      //AL_15
      If dblAcao.Text = '' Then
         AtualizaLote(QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger, QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime)
      Else
         AtualizaLote(QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger, QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime);

      AtualizaQtdAtual;
      AtualizaQtdPrevista;

      If QryDetalhe.EOF Then
      Begin
         DesabilitaCamposDetalhe;
         BtIncDet.Enabled := True;
      End
      Else
         HabilitaCamposDetalhe;

      //Ricardo Cristiano SOL 110583 / KT 505562 - 03.04.2009
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      if pRPI.REGRABOLETA = '1' then
      begin
         dbDocumento.Text := sDocumento;
         if dblAcao.Text <> '' then
            QryDetalhe.Locate('IDINVESTIMENTO', QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger, []);
     end;
   End;
end;

procedure TfrmOrdemMovimentacao.sbtnOpercoesDireitoClick(Sender: TObject);
begin
   Application.CreateForm(TfrmImportaOrdens,frmImportaOrdens);
end;

procedure TfrmOrdemMovimentacao.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

procedure TfrmOrdemMovimentacao.CalculaOperacao;
begin
   dValor := 0;
   //AL_15
   AtualizaLoteGrid(QryInvestimentoAcaoIDINVESTIMENTO.AsInteger, dbDtaOperacao.DateTime);
   if QryDetalhe.FieldByName('PUORDMOVINV').AsFloat = 0 then begin
      dValor := DivValorZero((QryDetalhe.FieldByName('VALOR').AsFloat * rQtdLote.Value),
                              QryDetalhe.FieldByName('QTDEORDENADA').AsFloat);
      if dValor <> 0 then dValor := dValor - 0.0049;
      QryDetalhe.FieldByName('PUORDMOVINV').Value := dValor;
      end
   else begin
      if rQtdLote.Value = 0 then
         rQtdLote.Value := 1;
      dValor := ((DivValorZero(QryDetalhe.FieldByName('QTDEORDENADA').AsFloat,rQtdLote.Value)*
                 QryDetalhe.FieldByName('PUORDMOVINV').AsFloat)-0.0049);
      QryDetalhe.FieldByName('VALOR').Value := dValor;
   end;
end;

//Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009

procedure TfrmOrdemMovimentacao.dblOperacaoExit(Sender: TObject);
begin
  inherited;
   if QryBuscaCarteiraIDCARTEIRAINVEST.AsInteger = pRPI.IDCARTOPC then // Carteira de Opções
   begin
      bOpcao    := True;
      sStaOpcao := 'S';
      lblAcao.Caption   := 'Opção                :';
   end
   else
   begin
      bOpcao    := False;
      sStaOpcao := 'N';
      lblAcao.Caption   := 'Ação';
      lblOpcao.Visible  := False;
      dblkOpcao.Visible := False;
   end;

   AbreQryInvestimento(-1,sStaOpcao,bOpcao);

   // Se Exercício de Opções
   if Trim(dblOperacao.Text) <> '' then
   begin
      bTipoVenda := (QryBuscaOperacaoTIPOCUSTODIA.AsString = 'V');
      if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -74) or
          (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -77) or
          (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -80) or
          (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -83)) then
      begin
         lblOpcao.Visible  := True;
         dblkOpcao.Visible := True;
         if dblkOpcao.CanFocus then
            dblkOpcao.SetFocus;
         dblAcao.Enabled   := False;
         OperComum.LimpaParametros(qryOpcao);
         with qryOpcao do
         begin
            ParamByName('DATAREF').AsString  := dbDtaOperacao.Text;
            if Trim(dblOperacao.Text) <> '' then
            begin
               if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -74) or
                   (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -77)) then
                  ParamByName('STAOPCCOMPRA').AsString := 'S'
               else if
                   ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -80) or
                    (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -83)) then
                  ParamByName('STAOPCCOMPRA').AsString := 'N'
            end;
            Open;
         end;
      end;
   end; 

   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   if pRPI.REGRABOLETA <> '1' then
      Refresh;
end;

procedure TfrmOrdemMovimentacao.dblBolsaExit(Sender: TObject);
begin
  inherited;
   //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
   if pRPI.REGRABOLETA <> '1' then
      Refresh;
end;

procedure TfrmOrdemMovimentacao.AbreQryInvestimento(iInvestimento:Integer;
                                                    sStaOpcao:String;
                                                    bOpcao:boolean);
begin
   OperComum.LimpaParametros(QryInvestimentoAcao);
   if bOpcao then
   begin
      if sStaOpcao = 'S' then
         QryInvestimentoAcao.ParamByName('STAOPCAO').AsString := 'S';

      QryInvestimentoAcao.ParamByName('DTAVENCTO').AsString  := dbDtaOperacao.Text;

      if iInvestimento <> -1 then
         QryInvestimentoAcao.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;

      if Trim(dblOperacao.Text) <> '' then
      begin
         if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -72) or
             (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -75)) then
            QryInvestimentoAcao.ParamByName('STAOPCCOMPRA').AsString := 'S'
         else if
             ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -78) or
              (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -81)) then
            QryInvestimentoAcao.ParamByName('STAOPCCOMPRA').AsString := 'N'
      end;
   end;
   QryInvestimentoAcao.Open;

end;

//AL_17
procedure TfrmOrdemMovimentacao.MontaQryCart(dDataLimite: TDateTime);
var CtrlAcessoCart: TCtrlAcessoCarteira;
    cdsCarteiras: TCMClientDataSet;
begin
   try // Finally
      QryBuscaCarteira.Close;
      cdsCarteiras := TCMClientDataSet.Create(nil);
      CtrlAcessoCart := TCtrlAcessoCarteira.Create;
      CtrlAcessoCart.InitializeAs(Padroes);
      cdsCarteiras.Data := CtrlAcessoCart.ListaCartAutorizada(Sistema.IdUsuario);
      // Se não há carteiras autorizadas para este usuário, inclui a carteira 0 para não trazer nenhuma
      if cdsCarteiras.IsEmpty then
      begin
         cdsCarteiras.Insert;
         cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger := 0;
         cdsCarteiras.Post;
      end;

      if (CtrlPInv.FlgCartGerenc = 'S') or ((CtrlPInv.FlgCartGerenc = 'N') and (dDataLimite <= CtrlPInv.DataLimCartGer)) then
      Begin
         QryBuscaCarteira.Sql.Clear;
         //AL_9
         QryBuscaCarteira.Sql.Add('SELECT LPAD(CG.IDCARTEIRAINVEST,2,''0'') || LPAD(CG.IDCARTEIRAGERENC,2,''0'') AS ID, ');
         QryBuscaCarteira.Sql.Add('       CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC, ');
         QryBuscaCarteira.Sql.Add('       CG.DESCCARTGERENC AS DESCCARTINVEST ');
         QryBuscaCarteira.Sql.Add('FROM CARTEIRAGERENC CG, CARTEIRAINVEST CI ');
         QryBuscaCarteira.Sql.Add('WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST ');
         QryBuscaCarteira.Sql.Add('  AND (CI.IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
         cdsCarteiras.Next;
         while not cdsCarteiras.Eof do
         begin
            QryBuscaCarteira.Sql.Add('  OR CI.IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
            cdsCarteiras.Next;
         end;
         QryBuscaCarteira.Sql.Add(' )');
         cdsCarteiras.First;

         QryBuscaCarteira.Sql.Add('UNION                                     ');
         QryBuscaCarteira.Sql.Add('SELECT LPAD(IDCARTEIRAINVEST,2,''0'') || NULL AS ID, IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, ');
         QryBuscaCarteira.Sql.Add('       DESCCARTINVEST ');
         QryBuscaCarteira.Sql.Add('FROM  CARTEIRAINVEST ');
         QryBuscaCarteira.Sql.Add('WHERE IDTIPOINVEST = 2 ');
         QryBuscaCarteira.Sql.Add('  AND (IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
         cdsCarteiras.Next;
         while not cdsCarteiras.Eof do
         begin
            QryBuscaCarteira.Sql.Add('  OR IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
            cdsCarteiras.Next;
         end;
         QryBuscaCarteira.Sql.Add(' )');
         QryBuscaCarteira.Sql.Add('ORDER BY DESCCARTINVEST');
      End
      else
      begin
         QryBuscaCarteira.Sql.Clear;
         //AL_9
         QryBuscaCarteira.Sql.Add('SELECT (LPAD(IDCARTEIRAINVEST,2,''0'') || NULL) AS ID, ');
         QryBuscaCarteira.Sql.Add('       IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC, DESCCARTINVEST ');
         QryBuscaCarteira.Sql.Add('FROM CARTEIRAINVEST ');
         QryBuscaCarteira.Sql.Add('WHERE IDTIPOINVEST IS NOT NULL ');
         QryBuscaCarteira.Sql.Add('  AND IDTIPOINVEST = 2 ');
         QryBuscaCarteira.Sql.Add('  AND (IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
         cdsCarteiras.Next;
         while not cdsCarteiras.Eof do
         begin
            QryBuscaCarteira.Sql.Add('  OR IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
            cdsCarteiras.Next;
         end;
         QryBuscaCarteira.Sql.Add(' )');

         QryBuscaCarteira.Sql.Add('ORDER BY DESCCARTINVEST');
      end;
   finally
      FreeAndNil(CtrlAcessoCart);
      cdsCarteiras.Close;
      FreeAndNil(cdsCarteiras);
      QryBuscaCarteira.Open;
   end;
end;

function TfrmOrdemMovimentacao.MontaIdLoteOpcoes:String;
begin
   OperComum.LimpaParametros(qryBuscaLoteOpcoes);
   with qryBuscaLoteOpcoes do
   begin
      ParamByName('IDINVESTIMENTO').AsInteger  := QryInvestimentoAcaoIDINVESTIMENTO.AsInteger;
      ParamByName('IDCORRETVALORES').AsInteger := QryCorretValoresIDCORRETVALORES.AsInteger;
      ParamByName('IDBOLSAVALORES').AsInteger  := QryBolsaValoresIDBOLSAVALORES.AsInteger;
      Open;
      if not IsEmpty then
         Result := FieldByName('IDLOTE').AsString
      else
         Result := 'OP-'+Copy(dbDtaOperacao.Text,9,2)+'/'+FormatFloat('0000',
                    LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbDtaOperacao.Text,9,2)));
   end;
end;

procedure TfrmOrdemMovimentacao.dblkOpcaoExit(Sender: TObject);
begin
  inherited;
   if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -74) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -77) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -80) or
       (QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -83)) then
   begin
      // Busca o Investimento Base da Opção
      AbreQryInvestimento(qryOpcao.FieldByName('IDINVESTBASE').AsInteger,'N',True);
      dblAcao.LookupValue := IntToStr(QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger);
      //Al_16
      dblAcao.Text        := QryInvestimentoAcao.FieldByName('SIGLAACAOBOLSA').AsString;
      dblAcao.PerformSearch;
   end;
end;

function TfrmOrdemMovimentacao.VerificaOperExercicio:boolean;
begin
   Result := True;
   if ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -74) and
       (DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat < 0)) or   // A posição é Vendida
      ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -77) and
       (DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat > 0)) or   // A posição é Comprada
      ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -80) and
       (DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat < 0)) or   // A posição é Comprada
      ((QryBuscaOperacaoIDTIPOOPERACAO.AsInteger = -83) and
       (DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat > 0)) then // A posição é Comprada
   begin
      MsgDlg('Não existe saldo para a Operação.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   end;
end;

procedure TfrmOrdemMovimentacao.sbtnRelatorioClick(Sender: TObject);
begin
  inherited;
   // AL_5
   if Trim(dbDtaOperacao.Text) <> '' then
   begin
      with DmRelOrdemRV, DmRelOrdemRV.qryOrdemRV do
      begin
         OperComum.LimpaParametros(qryOrdemRV);
         ParamByName('DATAORDMOVINV').AsString := dbDtaOperacao.Text;
         Open;

         TfrmPreview.CreateModalPreview(Application,
                                        rptOrdemRV,
                                        rptOrdemRV.PrinterSetup.DocumentName);

         OperComum.LimpaParametros(qryOrdemRV);
      end;
   end;
end;

procedure TfrmOrdemMovimentacao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //AL_12
  If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;

  FreeAndNil(CtrlRV);
//Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009  
//  inherited;
end;

procedure TfrmOrdemMovimentacao.FormCreate(Sender: TObject);
begin
  inherited;
  //AL_12
  CtrlRV := TCtrlRendavariavel.Create;
  CtrlRV.InitializeAs(Padroes);
end;


procedure TfrmOrdemMovimentacao.EliminaDigitacao(Sender: TObject; var Key: Char);
begin
   Key := #0;
end;

procedure TfrmOrdemMovimentacao.dbgOperacaoRowChanged(Sender: TObject);
begin
  inherited;
  AtualizaLoteGrid(QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger, QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime);
end;

procedure TfrmOrdemMovimentacao.QryDetalheAfterOpen(DataSet: TDataSet);
begin
  inherited;



  AtualizaLoteGrid(QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger, QryDetalhe.FieldByName('DATAORDMOVINV').AsDateTime);


end;

//Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
procedure TfrmOrdemMovimentacao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   sbtnProcurar.Enabled      := True;
   dbDtaOperacao.Enabled     := True;
   dblSiglaCorretora.Enabled := True;
   dblCarteira.Enabled       := True;
   dblPlanoPatro.Enabled     := True;
   dblOperacao.Enabled       := True;
   dblAcao.Enabled           := True;
   dblBolsa.Enabled          := True;
   dblkOpcao.Enabled         := True;


   dbDtaOperacao.Text        := '';
   dblSiglaCorretora.Text    := '';
   dblCarteira.Text          := '';
   dblPlanoPatro.Text        := '';
   dblOperacao.Text          := '';
   dblAcao.Text              := '';
   dblBolsa.Text             := '';
   dblkOpcao.Text            := '';

   dbDocumento.Text          := '';
   dbDocumento.Enabled       := False;

   rQtdLote.Clear;
   rQtdAtual.Clear;
   rQtdPrevista.Clear;
   rTotalOperacao.Clear;   

   bTrocaLine := True;

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   BtOkDet.Enabled     := False;
   BtCancDet.Enabled   := False;
   BtVoltaDet.Enabled  := False;

   BtIncDet.Down       := False;
   BtAltDet.Down       := False;
   BtDelDet.Down       := False;

   QryDetalhe.Cancel;

   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;

   dbgOperacao.Font.Color := clGray;

   dbDtaOperacao.Text  := DateToStr(pRPI.DATAMOVTORV);
   if dbDtaOperacao.CanFocus then
      dbDtaOperacao.SetFocus;

   QryDetalhe.Close;

end;

//Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
procedure TfrmOrdemMovimentacao.bbtnSairClick(Sender: TObject);
begin
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Close;
end;

//Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
procedure TfrmOrdemMovimentacao.dblPlanoPatroExit(Sender: TObject);
begin
  inherited;
   //Ricardo Cristiano SOL 110583 / KT 505562 10.03.2009
   if ((pRPI.REGRABOLETA = '1') and (dbDtaOperacao.Text <> '') and (dblSiglaCorretora.Text <> '') and (dblPlanoPatro.Text <> '')) then
   begin
      dbDtaOperacao.Enabled     := False;
      dblSiglaCorretora.Enabled := False;
      dblPlanoPatro.Enabled     := False;
      bbtnCancelar.Enabled      := True;
   end;

   dbDocumento.Enabled := False;
end;

// Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
procedure TfrmOrdemMovimentacao.BuscaValorRegraBoleta;
var QryAux: TwwQuery;
begin
   Try
      QryAux := TwwQuery.Create(Nil);
      QryAux.DataBaseName := 'BaseDados';
      FazQuery(QryAux, 'SELECT REGRABOLETA FROM PARAMINVEST');
      
      if Trim(QryAux.FieldByName('REGRABOLETA').AsString) = '1' then
      begin
         StaticText1.Caption := '1 - Data/Corretora (Anterior)';
         sRegraBoleta := '1';
      end
      else
      begin
         StaticText1.Caption := '2 - Data/Corretora/Plano/Carteira (Atual)';
         sRegraBoleta := '0';
      end;
   finally
      FreeAndNil(QryAux);
   End;
end;
// Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011

procedure TfrmOrdemMovimentacao.dbgOperacaoDblClick(Sender: TObject);
begin
  inherited;
  ShowMessage(dbgOperacao.SelectedField.DisplayName);
end;

end.
