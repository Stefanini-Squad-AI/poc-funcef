//******************************************************************************
// Data      : 31/01/2007
// Código    : AL_21
// Pendencia : 22555
// SOL       : 43964
// Desc      : Ajuste no esquema de cores da tela.
//             Ajuste para impedir que o grid de despesas seja habilitado quando
//               a boleta estiver fechada.
//******************************************************************************
// Data      : 04/12/2006
// Código    : AL_20
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_19
// Pendencia : 22961
// SOL       :
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_18
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
//Data	     : 14/06/2006
//Código     : Al_17
//Pendencia  : 22584
//SOL        : 44001
//Motivo(S)  : Implementação de Marcação dos Investimentos para reprocessamento
//               caso a Boleta seja retroativa.
//******************************************************************************
//Data	     : 12/04/2006
//Código     : Al_16
//SOL        : 42169
//Motivo(S)  : Implementação de Crítica para quantidade da ordem iqual a zero
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_15
// Motivo    : Ajuste na carga da variável wBoletaFecha para impedir movimentação
//               duplicada da carteria.
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_14
// Motivo    : Ajuste na chamada da CalculaDespesas para passar o valor do percentual
//                de devolução com o ponto como separador.
//******************************************************************************
// Data      : 07/03/2006
// Código    : AL_13
// Motivo    : Implementação de soma do Total de Despesas de Compras para zeragem
//             de conta transitória de Boletas com Compra e Venda
//******************************************************************************
// Data      : 06/03/2006
// Código    : AL_12
// Motivo    : Ajuste no processo de movimentação para melhora da performance e
//                lay-out.
//******************************************************************************
// Data      : 17/02/2006
// Código    : AL_11
// Motivo    : Erro de parametro na QryListInv "NUMDOC", retirado.
//******************************************************************************
//Data	    : 11/01/2006
//Código    : Al_10
//Motivo(S) : Ajuste no lay-out (Label de corretagem liquida)
//******************************************************************************
//Data	    : 13/09/2005
//Código    : Al_9
//Motivo(S) : Soma de Despesas de Venda no Total a Receber das Venda para zeragem
//            das contas transitórias (IF Funcef) verificar depois se se adequa na REFER
//******************************************************************************
//Data	    : 23/05/2005
//Código    : Al_8
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
// Data     : 03/05/2005
// Código   : AL_7
// Motivo   : Retirado a soma de despesas no Custo de Aquisição de Compras pois estava duplicando no
//            Contábil
//********************************************************************************************************
// Data     : 19/04/2005
// Código   : AL_6
// Motivo   : Implementado soma de despesas no Custo de Aquisição de Compras
//********************************************************************************************************
// Data     : 28/02/2005
// Código   : AL_5
// Motivo   : Incluído crítica da carteira gerencial, pois estava duplicando os registros.
//********************************************************************************************************
// Data     : 17/02/2005
// Código   : AL_4
// Motivo   : Implementação do parâmentro CodTipDoc na LancaOperRFRV, para
//            lançar na Documento.Inserir pelo resultado (à Pagar ou à Receber)
//            da Boleta e não pelo TipoOperacao ou TipoDespInvest
//            Colocado o FieldByName da qryConsulta e retirado os TFields
//******************************************************************************
// Data     : 29/11/2004
// AL_3
// Motivo   : tratamento para Zerar as Contas de à Receber ou à Pagar quando a
//            Boleta tiver operações de Compra e Venda
//******************************************************************************
// Data     : 10/11/2004
// AL_2
// Motivo   : Melhora nas mensagens de erro
//******************************************************************************
// Data     : 29/10/2004
// AL_1
// Motivo   : tratamento para buscar a despesa que sofrera a alteração .
//******************************************************************************

unit FFechaBoleta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, Db, DBTables,
  Wwquery, Wwdatsrc, wwdbedit, Wwdbspin, ComCtrls, PpPrvDlg, PPforms, Menus,
  MontaSelect, uCtrlInvContab;

type
  TFrmFechaBoleta = class(TfrmSairAjuda)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeCorretora: TDBEdit;
    dbeDtRef: TDBEdit;
    dbeDataLiquidacao: TDBEdit;
    PnlOperDoc: TPanel;
    Panel3: TPanel;
    dbGridConsulta: TDBGrid;
    DsConsulta: TwwDataSource;
    QryAux: TwwQuery;
    Label4: TLabel;
    dbeDocumento: TDBEdit;
    PnlDespesas: TPanel;
    lblDespesas: TLabel;
    PnlTotLiquido: TPanel;
    Label6: TLabel;
    PnlDesp: TPanel;
    QryBuscaDespesa: TwwQuery;
    QryBuscaDespesaIDTIPODESPINVEST: TFloatField;
    QryBuscaDespesaMOECODIGO: TFloatField;
    QryBuscaDespesaDESCTIPODESPINV: TStringField;
    QryBuscaDespesaNATUREZAOPERACAO: TStringField;
    QryBuscaCredor: TwwQuery;
    QryBuscaCredorIDPESSOA: TFloatField;
    QryBuscaCredorRAZAOSOCIAL: TStringField;
    UpdDespesas: TUpdateSQL;
    QryDespesasOperacao: TwwQuery;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoNUMDOCUMENTO: TStringField;
    QryDespesasOperacaoFLGCALCDIARIO: TStringField;
    QryDespesasOperacaoIDINVESTIMENTO: TFloatField;
    QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField;
    QryDespesasOperacaoVLROPERACAO: TFloatField;
    QryDespesasOperacaoQTDEOPERACAO: TFloatField;
    QryDespesasOperacaoDESCTIPOOPERACAO: TStringField;
    QryDespesasOperacaoDESCINVESTIMENTO: TStringField;
    QryDespesasOperacaoNATUREZAOPERACAO: TStringField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    QryDespesasOperacaoMOECODIGO: TFloatField;
    QryDespesasOperacaoTIPOTITULO: TStringField;
    QryDespesasOperacaoNATOPERDESP: TStringField;
    DsDespesasOperacao: TwwDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    BtImprimeDocumento: TBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    pnlMensagem: TPanel;
    BitBtn1: TBitBtn;
    QryDespesasOperacaoIDLOTE: TStringField;
    PgCt: TPageControl;
    tbDet: TTabSheet;
    TbConsolidado: TTabSheet;
    GridDespesas: TDBGrid;
    GridConsolidado: TDBGrid;
    QryConsolidado: TwwQuery;
    QryConsolidadoDESCTIPODESPINV: TStringField;
    QryConsolidadoVLRDESPOPER: TFloatField;
    DtsConsolidado: TwwDataSource;
    TbObs: TTabSheet;
    mmoObs: TMemo;
    QryBoleta: TwwQuery;
    QryDespesasOperacaoNOME: TStringField;
    QryDespesasOperacaoDESCTIPODESPINV: TStringField;
    PnlDadosDespesa: TPanel;
    PopDespesas: TPopupMenu;
    Alterar1: TMenuItem;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    SB1: TSpeedButton;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    MSBuscaCredor: TMontaSelect;
    QryConsulta: TwwQuery;
    QryAtualizaOperacoes: TwwQuery;
    pnlCorretLiquida: TPanel;
    Panel8: TPanel;
    QryCorretagemDevol: TwwQuery;
    QryVerifMovCart: TwwQuery;
    QryDespesasOperacaoIDCORRETVALORES: TFloatField;
    QryDespesasOperacaoIDCARTEIRAGERENC: TFloatField;
    QryConsultaGerencial: TwwQuery;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField8: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField13: TFloatField;
    QryDespesasOperacaoGer: TwwQuery;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    DateTimeField3: TDateTimeField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField27: TFloatField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    updConsulta: TUpdateSQL;
    pnlConsulta: TPanel;
    lblBolsa: TLabel;
    lblInvestimento: TLabel;
    lblTpOperacao: TLabel;
    lblQuantidade: TLabel;
    lblVlrOperacao: TLabel;
    dbeVlrOperacao: TDBEdit;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnOkConsulta: TBitBtn;
    bbtnCancelaConsulta: TBitBtn;
    bbtnVoltarConsulta: TBitBtn;
    PopConsulta: TPopupMenu;
    AlterarConsulta: TMenuItem;
    qryUpdVlrOperacao: TwwQuery;
    qryUpdFlgCalcSaldo: TwwQuery;
    dbeInvestimento: TDBEdit;
    dbeTpOperacao: TDBEdit;    
    dbeQuantidade: TDBEdit;    
    dbeBolsa: TDBEdit;
    PopAltDevCorret: TPopupMenu;
    AltDevCorret: TMenuItem;
    qryBuscaDevCorret: TwwQuery;
    qryBuscaDevCorretVALOR: TStringField;
    pnlDetlConsolidado: TPanel;
    Label5: TLabel;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    btnOkConsolidado: TBitBtn;
    btnCancelaConsolidado: TBitBtn;
    btnVoltarConsolidado: TBitBtn;
    edtPercDevCorret: TEdit;
    qryAtualizaBoleta: TwwQuery;
    QryBuscaDespCarteiraGerenc: TwwQuery;
    QryUpdDespOperInvest: TwwQuery;
    QryBuscaDespOperInvest: TwwQuery;
    QryBuscaDespOperInvestGer: TwwQuery;
    BtRecalcula: TBitBtn;
    BtMovCarteira: TBitBtn;
    pnlProgresso: TPanel;
    prgProgresso: TProgressBar;
    QryConsultaGerencialNUMREC: TFloatField;
    QryConsultaSGLBOLSAVALORES: TStringField;
    QryConsultaDATAOPERACAO: TDateTimeField;
    QryConsultaDATAVENCOPER: TDateTimeField;
    QryConsultaQTDEOPERACAO: TFloatField;
    QryConsultaIDOPERACAOINVEST: TFloatField;
    QryConsultaPRECOUNITOPERACAO: TFloatField;
    QryConsultaVLROPERACAO: TFloatField;
    QryConsultaTOTALDESPESAS: TFloatField;
    QryConsultaDESCMERCADO: TStringField;
    QryConsultaNOME: TStringField;
    QryConsultaDESCINVESTIMENTO: TStringField;
    QryConsultaDESCTIPOOPERACAO: TStringField;
    QryConsultaNUMDOCUMENTO: TStringField;
    QryConsultaNATUREZAOPERACAO: TStringField;
    QryConsultaIDTIPOOPERACAO: TFloatField;
    QryConsultaIDTIPOINVEST: TFloatField;
    QryConsultaIDTIPOOPERACAO_1: TFloatField;
    QryConsultaIDFORCLI: TFloatField;
    QryConsultaIDCARTEIRAINVEST: TFloatField;
    QryConsultaIDCARTEIRAGERENC: TFloatField;
    QryConsultaCODTIPOACAO: TStringField;
    QryConsultaMOECODIGO: TFloatField;
    QryConsultaIDINVESTIMENTO: TFloatField;
    QryConsultaIDLOTE: TStringField;
    QryConsultaFLGSTATUSFECHBOL: TStringField;
    QryConsultaRECPAGBOL: TStringField;
    QryConsultaCODTIPDOC: TFloatField;
    qryBuscaDevCorrAtual: TwwQuery;
    qryBuscaDevCorrAtualDEVOLUCAO: TFloatField;
    qryBuscaDevCorrAtualCORRETAGEM: TFloatField;
    qryBuscaDevCorrAtualPERCDEV: TFloatField;
    QryDespesasOperacaoIDPLANPREVCTBPATR: TFloatField;
    QryConsultaIDPLANPREVCTBPATR: TFloatField;
    QryDespesasOperacaoGerIDPLANPREVCTBPATR: TFloatField;
    QryConsultaGerencialIDPLANPREVCTBPATR: TFloatField;
    //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
    dbePlanoPatro: TDBEdit;
    Label11: TLabel;
    QryConsultaPLANPRVCONTABPATRO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtImprimeDocumentoClick(Sender: TObject);
    procedure BtMovCarteiraClick(Sender: TObject);
    procedure QryConsultaAfterOpen(DataSet: TDataSet);
    procedure QryDespesasOperacaoUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryDespesasOperacaoAfterOpen(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure GridDespesasColExit(Sender: TObject);
    procedure QryDespesasOperacaoAfterPost(DataSet: TDataSet);
    procedure GridDespesasExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtRecalculaClick(Sender: TObject);
    procedure QryDespesasOperacaoAfterInsert(DataSet: TDataSet);
    procedure PgCtChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure PnlDadosDespesaExit(Sender: TObject);
    procedure dbGridConsultaCellClick(Column: TColumn);
    procedure AlterarConsultaClick(Sender: TObject);
    procedure bbtnCancelaConsultaClick(Sender: TObject);
    procedure bbtnOkConsultaClick(Sender: TObject);
    procedure bbtnVoltarConsultaClick(Sender: TObject);
    procedure GridDespesasDblClick(Sender: TObject);
    procedure dbGridConsultaDblClick(Sender: TObject);
    procedure AltDevCorretClick(Sender: TObject);
    procedure btnCancelaConsolidadoClick(Sender: TObject);
    procedure btnVoltarConsolidadoClick(Sender: TObject);
    procedure btnOkConsolidadoClick(Sender: TObject);
  private
     Function  CorretagemLiquida : Double;
     Function  MovimentaCarteiraGerencial : Boolean;     
     Procedure ModuloConsultaFechamento;
     Procedure MontaQryConsulta;
     Procedure MontaQryConsultaGerencial;          
    { Private declarations }
  public
    { Public declarations }
    wIdCorretora, wDocumento, wBoletaFecha, wIdLote : String;
  end;

var FrmFechaBoleta: TFrmFechaBoleta;

  Const
    wMensagem: Array[-9..0] Of String =
           (' ',
            ' ',
            'Não foi possível efetuar o lançamento de CAP/CAR.',
            'Não foi possível efetuar o lançamento contábil.',
            'Não foi encontrado Padrão de Lançamento que atenda os parâmetros passados.',
            'Erro de gravação.',
            'Ambigüidade no Padrão de Lançamento.',
            'Operação com valor igual a "ZERO".',
            'Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR.',
            'Lançamento(s) realizados com sucesso.');

implementation

{$R *.DFM}

Uses FDmRelatorios, USistema, UOperacaoInvest, UOperComum, DOpercomum, UBibliotecaInvest,
     UFuncoesRendaFixa, DBasedados, UMensErro, UCaixaComum, FAutorizaParametros, FTelaAut,
  UCotaComum, UProvisaoComum, URendaVariavel;

Var wValIniCotas, wTotalLiquido, wTotalDespesa : Double;
    //AL_3
    wTotalaReceber, wTotalaPagar : Double;
    iTipoDesp, iIdHistCartInv, iOperacao : integer;
    fVlrOperacaoAnt, fQtdDifDesp : Double;
    //AL_4
    sTipoDoc : Integer;
    //AL_9
    fVlrDespVenda : Double;
    //AL_13
    fVlrDespCompra : Double;

procedure TFrmFechaBoleta.ModuloConsultaFechamento;
begin
   If wBoletaFecha = 'F' Then
   Begin
      PnlOperDoc.Enabled            := False;
      GridDespesas.Enabled          := False;
      GridConsolidado.Enabled       := False;
      mmoObs.Enabled                := False;

      dbGridConsulta.Options        := dbGridConsulta.Options - [dgEditing];
      GridDespesas.Options          := GridDespesas.Options - [dgEditing];
      GridConsolidado.Options       := GridConsolidado.Options - [dgEditing];

      mmoObs.Enabled         := False;
      BtRecalcula.Enabled    := False;
      BtMovCarteira.Enabled  := False;
      bbtnConfirmar.Enabled  := False;
      bbtnCancelar.Enabled   := False;
   End;
end;

procedure TFrmFechaBoleta.MontaQryConsulta;
begin
   With QryConsulta Do
   Begin
      Close;
      SQL.Clear;
      // AL_19
      SQL.Add('SELECT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,');
      SQL.Add('       OI.QTDEOPERACAO, OI.IDOPERACAOINVEST,OI.PRECOUNITOPERACAO,');
      SQL.Add('       OI.VLROPERACAO, DS.TOTALDESPESAS,');
      SQL.Add('       SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,');
      SQL.Add('       PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO,');
      SQL.Add('       TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO,');
      SQL.Add('       TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, OI.IDPLANPREVCTBPATR, ');
      SQL.Add('       TI.IDTIPOINVEST, OI.IDTIPOOPERACAO, OI.IDFORCLI,');
      SQL.Add('       OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, AC.CODTIPOACAO, OI.MOECODIGO,');
      SQL.Add('       OI.IDINVESTIMENTO, OI.IDLOTE, OI.FLGSTATUSFECHBOL,');
      SQL.Add('       DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',');
      SQL.Add('             DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',');
      SQL.Add('                DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',');
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL, TI.CODTIPDOC,');
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009
      SQL.Add('       VWP.PLANPRVCONTABPATRO ');
      SQL.Add('FROM OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,');
      SQL.Add('     INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,');
      SQL.Add('      	(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS');
      SQL.Add('         FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI');
      SQL.Add('         WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST 	AND');
      SQL.Add('                TDI.NATUREZAOPERACAO NOT IN (''N'')');
      SQL.Add('         GROUP BY DOI.IDOPERACAOINVEST) DS, ');
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009      
      SQL.Add('     VWPLANPREVCTBPATR VWP ');
      SQL.Add('WHERE (OI.NUMDOCUMENTO     = '''+wDocumento+''')     AND');
      SQL.Add('      (OI.IDCARTEIRAGERENC IS NULL)                  AND');
      SQL.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND');
      SQL.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND');
      SQL.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	    AND');
      SQL.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	    AND');
      SQL.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO)      AND');
      SQL.Add('      (TI.IDMERCADO 	  = ME.IDMERCADO)	    AND');
      SQL.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND');
      SQL.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)              AND');
      //Ricardo Cristiano SOL 110583 / KT 505562 - 23.03.2009      
      SQL.Add('      (VWP.IDPLANPREVCTBPATR = OI.IDPLANPREVCTBPATR)    ');
      If (wTotalLiquido < 0) Then
         SQL.Add('   ORDER BY VWP.PLANPRVCONTABPATRO, RECPAGBOL     ')
      Else
         SQL.Add('   ORDER BY VWP.PLANPRVCONTABPATRO, RECPAGBOL DESC');
      Open;
   End;
end;

procedure TFrmFechaBoleta.FormShow(Sender: TObject);
Var wValCorretagemLiq : Double;
begin
  inherited;
  FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
  wValIniCotas := QryAux.FieldByName('VLRCOTAINICART').AsFloat;
  QryAux.Close;

// Pesquisa se Boleta ja tem Registro na Tabela de Boletas
  QryBoleta.Close;
  QryBoleta.ParamByName('IDBOLETA').AsString := wDocumento;
  QryBoleta.Open;
// Caso não tenha, cria um registro
  If QryBoleta.IsEmpty Then
    ExecutaQuery(QryAux, 'INSERT INTO BOLETA (IDBOLETA) VALUES ('+QuotedStr(wDocumento)+')')
  Else
// Caso Tenha Pega a Observação
    mmoObs.Text := QryBoleta.FieldByName('OBSERVACAO').AsString;

// Preenche Parametros e Abre a Query
  QryConsulta.ParamByName('NUMDOC').AsString    := wDocumento;
  QryConsulta.Open;

  pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';

  QryConsolidado.ParamByName('NUMDOC').AsString := wDocumento;
  QryConsolidado.Open;

  QryBuscaDespesa.Open;
  QryDespesasOperacao.Open;
  PgCt.ActivePage         := TbDet;
  PnlDadosDespesa.Visible := False;
  GridDespesas.Visible    := True;

   // AL_15
   FazQuery(QryAux,'SELECT * FROM BOLETA WHERE IDBOLETA = ' + QuotedStr(wDocumento));
   if not qryAux.IsEmpty then
      wBoletaFecha := qryAux.FieldByName('STATUS').AsString;

  ModuloConsultaFechamento;
end;

procedure TFrmFechaBoleta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
  inherited;
  QryConsulta.Close;
  QryConsolidado.Open;
  QryDespesasOperacao.Close;
  QryBuscaDespesa.Close;
  QryBuscaCredor.Close;
end;

procedure TFrmFechaBoleta.BtImprimeDocumentoClick(Sender: TObject);
Var
  wSqlConsulta:String;
  wDecSep:Char;
begin
  inherited;
 With DmRelatorios.QryDetBoleta Do Begin
   Close;
   Sql.Clear;
   Sql.add(' SELECT                                                            ');
   Sql.add('  BV.SGLBOLSAVALORES,   OI.DATAOPERACAO, OI.DATAVENCOPER,       ');
   Sql.add('  OI.QTDEOPERACAO,      DOP.VLRDESPOPER, DOP.IDTIPODESPINVEST,  ');
   Sql.add('  OI.PRECOUNITOPERACAO, OI.VLROPERACAO,  DS.TOTALDESPESAS,      ');
   Sql.add('  SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,                   ');
   Sql.add('  PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO,');
   Sql.add('  TI.DESCTIPOOPERACAO,  OI.NUMDOCUMENTO,');
   Sql.add('  TI.NATUREZAOPERACAO,  TP.DESCTIPODESPINV, TP.NATUREZAOPERACAO AS DESPNATUR, ');
   Sql.add('  CA.DESCCARTINVEST,    DS.IDOPERACAOINVEST, OI.FLGSTATUSFECHBOL');

   Sql.add(' FROM                                       ');
   Sql.add('  OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,');
   Sql.add('  INVESTIMENTO IV,   TIPOOPERACAO TI, MERCADO ME, DESPOPERINVEST DOP,');
   Sql.add('  TIPODESPINVEST TP, CARTEIRAINVEST CA,');
   Sql.add('  (SELECT IDOPERACAOINVEST, SUM(VLRDESPOPER) AS TOTALDESPESAS');
   Sql.add('   FROM DESPOPERINVEST GROUP BY IDOPERACAOINVEST) DS');


   Sql.add(' WHERE                                      ');

   If (Trim(dbeDtRef.Text) <> '' )  Then Begin
     DmRelatorios.lbDataRef.Caption    := dbeDtRef.Text;
     Sql.Add(' (OI.DATAOPERACAO = TO_DATE('''+dbeDtRef.Text+''',''DD/MM/YYYY'')) ');
   End;

   If Trim(dbeDocumento.Text) <> '' Then
     Sql.add('  AND (OI.NUMDOCUMENTO = '''+dbeDocumento.Text+''')    ');

   Sql.add('  AND (TP.NATUREZAOPERACAO <> ''N'')                ');
   Sql.add('  AND (OI.IDOPERACAOINVEST  = OA.IDOPERACAOINVEST)  ');
   Sql.add('  AND (OI.IDOPERACAOINVEST  = DS.IDOPERACAOINVEST)  ');
   Sql.add('  AND (OI.IDCORRETVALORES   = PS.IDPESSOA)          ');
   Sql.add('  AND (OA.IDBOLSAVALORES    = BV.IDBOLSAVALORES)    ');
   Sql.add('  AND (OA.IDACAO 	          = IV.IDINVESTIMENTO)    ');
   Sql.add('  AND (TI.IDMERCADO         = ME.IDMERCADO)         ');
   Sql.add('  AND (OI.IDTIPOOPERACAO    = TI.IDTIPOOPERACAO)    ');
   Sql.add('  AND (DOP.IDTIPODESPINVEST = TP.IDTIPODESPINVEST)  ');
   Sql.add('  AND (OI.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST)  ');
   Sql.add('  AND (OI.IDOPERACAOINVEST  = DOP.IDOPERACAOINVEST) ');
   Sql.add('  AND (OI.IDCARTEIRAGERENC IS NULL)                 ');

   Sql.add('  ORDER BY                                  ');
   Sql.add('        OI.DATAOPERACAO,                    ');
   Sql.add('        OI.NUMDOCUMENTO,                    ');
   Sql.add('        DS.IDOPERACAOINVEST,                ');
   Sql.add('        TP.DESCTIPODESPINV                  ');
   Open;

 End;
  //AL_17
  If DmRelatorios.qryDetBoleta.IsEmpty Then
  Begin
     MsgDlg('Não existem despesas nestas Operações .','Mensagem do Sistema',
             MtWarning,[MbOk],0);
     DmRelatorios.qryDetBoleta.Close;;
     Exit;
  End;
  DmRelatorios.RptDetBoleta.Print;
  DmRelatorios.qryDetBoleta.Close;;
end;

procedure TFrmFechaBoleta.BtMovCarteiraClick(Sender: TObject);
Var
  wMensErro, wRecPagBol, wTipoRecDesBol :String;
  wPlanilha, wDocumCont, wPlanilhaAC, wDocumContAC, wIdOperacao, wPlano, wPlanoAC, wIdDespesa: Integer;
  wTotalContab,wQtdCotaIni : Double;
  bCriaLancto: boolean;
  //AL_3
  fVlrRecPag : Double;
             //AL_20
  iIdForCli, iOperacao : Integer;
  //AL_6
  fDespOperacao, fVlrOperacao : Double;
begin
   //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
   QueryCCBaixa := TwwQuery.Create(Application);
   QueryCCBaixa.DatabaseName  := 'BaseDados';

   DsCCBaixa := TwwDataSource.Create(Application);
   DsCCBaixa.DataSet := QueryCCBaixa;

   UpdCCBaixa := TUpdateSQL.Create(Application);

   QueryCCBaixa.UpdateObject  := UpdCCBaixa;

   QueryCCBaixa.CachedUpdates := True;

   UpdCCBaixa.ModifySQL.Add('UPDATE CCBAIXASXDOCUM  SET VALOR = :VALOR WHERE CODDOCUMENTO = :OLD_CODDOCUMENTO');

   QueryCCBaixa.SQL.Add('SELECT CC.IDCCBAIXASXDOCUM, CC.UNIDNEGOC, CC.IDSEGREGACRITER, CC.PLANO, CC.IDPATRO, ');
   QueryCCBaixa.SQL.Add('       CC.IDPLANOPREV, CC.PLACONTA, CC.CODDOCUMENTO, CC.VALOR  ');
   QueryCCBaixa.SQL.Add('FROM CCBAIXASXDOCUM CC WHERE CC.CODDOCUMENTO = -1');
   QueryCCBaixa.Open;

   inherited;

   // AL_8
   //AL_18
   if not CtrlInvContab.TestaPeriodo(dbeDtRef.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbeDtRef.CanFocus then
         dbeDtRef.SetFocus;
      Exit;
   end;

   wQtdCotaini := 0;

   // AL_12 - Inicio
   // Testa se a carteira já foi movimentada
   QryVerifMovCart.Close;
   QryVerifMovCart.ParamByName('pDocumento').AsString := wDocumento;
   QryVerifMovCart.Open;
   if not QryVerifMovCart.IsEmpty then
   begin
      MsgDlg('Atenção: A boleta já foi movimentada.'+#13+
             'Para acertos, a boleta deve ser excluída!', 'Mensagem do Sistema',MtWarning,[MbOk],0);
      QryVerifMovCart.Close;
      Exit;
   end;

   // Se estiver alterando valor da operação
   if qryConsulta.State In [DsEdit] then
   begin
      If (MsgDlg('A alteração do Valor da Operação não foi confirmada. Continua ?',
                 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
         Exit
      else
         bbtnCancelaConsulta.Click;
   end;

   try
      pnlMensagem.Visible:=True;
      pnlProgresso.Visible := True;

      // AL_16
      // Verifica quantidade das operacoes
      prgProgresso.Max := QryConsulta.RecordCount;
      prgProgresso.Position := 0;
      pnlMensagem.Caption := 'Verificando quantidade das operações';
      QryConsulta.First;
      while not QryConsulta.Eof do
      begin
         if QryConsultaQTDEOPERACAO.AsInteger = 0 then
         begin
            MsgDlg('Existe uma operação com quantidade zero. Verifique as ordens desta boleta.', 'Mensagem do Sistema',
                   mtWarning, [mbOk], 0);
            Exit;
         end;
         prgProgresso.StepIt;
         QryConsulta.Next;
      end;
      QryConsulta.First;

      // Guarda Regs para Pesquisa Posterior
      wIdOperacao:=QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      wIdDespesa :=QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger;

      // Trata variáveis da Integração Contábil-Financeira
      wPlanilha    :=-1;
      wPlano       :=-1;
      wDocumCont   :=-1;
      wPlanilhaAC  :=-1;
      wPlanoAC     :=-1;
      wDocumContAC :=-1;

      //AL_20
      bCriaLancto    := False;
      wTipoRecDesBol := '';

      If (wTotalLiquido < 0) Then
         wRecPagBol := 'P'
      Else
         wRecPagBol := 'R';
      wTotalContab := Abs(wTotalLiquido);

      // Inicia Transação
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If pRPI.FLGCARTGERENC = 'S' Then
      Begin
         If Not MovimentaCarteiraGerencial Then
         Begin
           If dtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.Rollback;
            Exit;
         End;
      End;

      // Inicia Processamento
      // Ordenando pelo tipo de Natureza (P/R)
      MontaQryConsulta;

      QryConsulta.First;
      prgProgresso.Max := QryConsulta.RecordCount;
      prgProgresso.Position := 0;
      // AL_3
      iIdForCli := QryConsulta.FieldByName('IDFORCLI').AsInteger;

      // Percorre todas as Operações da Boleta
      While Not QryConsulta.EOF Do
      Begin
         //AL_6
         fDespOperacao := 0;
         QryDespesasOperacao.First;
         // Faz Todas as Despesas
         While Not QryDespesasOperacao.EOF Do
         Begin
            wPlanilha  :=-1;
            wPlano     :=-1;
            wDocumCont :=-1;

            // Mostra Progresso
            pnlMensagem.Caption:= ' Boleta '+ QryConsulta.FieldByName('NUMDOCUMENTO').AsString + ' - ' +
                                  'Calculando '+ QryDespesasOperacao.FieldByName('DESCTIPODESPINV').AsString;
            pnlMensagem.Repaint;
            Application.ProcessMessages;

            Try
               //AL_6
               //Armazena o Total de Despesas da Operação
               fDespOperacao := fDespOperacao + QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat;

               If (QryDespesasOperacao.FieldByName('NATOPERDESP').AsString <> 'N') Then
               Begin
                  If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                   QryDespesasOperacao.FieldByName('IDINVESTIMENTO').AsInteger,
                                   QryDespesasOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                                   QryDespesasOperacao.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                                   QryDespesasOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                   QryDespesasOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   QryDespesasOperacao.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                   QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger, -1,
                                   wPlanilha, wDocumCont, wPlano,
                                   QryDespesasOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                   QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat,
                                   QryDespesasOperacao.FieldByName('QTDEOPERACAO').AsFloat,
                                   wValIniCotas, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                   QryDespesasOperacao.FieldByName('NATOPERDESP').AsString,
                                   QryDespesasOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                   QryDespesasOperacao.FieldByName('IDLOTE').AsString,
                                   QryDespesasOperacao.FieldByName('DESCTIPODESPINV').AsString+' / '+
                                     QryDespesasOperacao.FieldByName('DESCINVESTIMENTO').AsString,
                                   'DOP','', '', True,
                                   QryDespesasOperacao.FieldByName('IDCORRETVALORES').AsInteger,
                                   QryDespesasOperacao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                   iIdHistCartInv) Then
                  Abort;
               End;
            // AL_2
            except on E: Exception do
               begin
                  If dtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Rollback;
                  pnlMensagem.Caption  := E.Message;
                  //AL_17
                  MsgDlg('Não foi possível gravar as despesas destas Boleta.'+ #13 +
                          E.Message,'Mensagem do Sistema ', mtWarning,[mbOK],0);
                  Exit;
               end;
            end;
            // Proximo Registro de Despesa
            QryDespesasOperacao.Next;
         End;

         // Mostra Progresso
         pnlMensagem.Caption:= ' Boleta '+ QryConsulta.FieldByName('NUMDOCUMENTO').AsString + ' - ' +
                               'Contabilizando ' + FormatFloat('#,#0.00',QryConsulta.FieldByName('VLROPERACAO').AsFloat);
         pnlMensagem.Repaint;

         Try
            // Caso Operacao de Venda (NATURMOV = 'D') MArca o Regsitro de Lucro Com Flag (1)
            // Para ser Recalculado
            ExecutaQuery(QryAux,'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' '+
                                'WHERE 	(TIPMOVCARTINV    = ''LUC'') AND '+
                                '      	(IDOPERACAOINVEST = '+
                                 QuotedStr(QryConsulta.FieldByName('IDOPERACAOINVEST').AsString)+')');
            QryAux.Close;
            // Alimenta os Saldos da Carteira
            OperComum.AtualizaSaldos(wQtdCotaini,-1);

            //AL_6 Ini
            fVlrOperacao := QryConsulta.FieldByName('VLROPERACAO').AsFloat;
            //AL_4
            //AL_19

            //AL_20 - Verifica se é a última operação
            iOperacao := QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
            QryConsulta.Next;
            // Se for, cria o LanctoDocum
            if QryConsulta.Eof then
               bCriaLancto := True;
            // Volta para o registro que estava
            while iOperacao <> QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger do
               QryConsulta.Prior;

            // Contabiliza Operação
            OperComum.LancaOperRFRV(Sistema.IdEmpresa, 79,
                                    QryConsulta.FieldByName('IDTIPOINVEST').AsInteger,
                                    QryConsulta.FieldByName('IDINVESTIMENTO').AsInteger,
                                    QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger,
                                    QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger,
                                    QryConsulta.FieldByName('IDFORCLI').AsInteger,
                                    QryConsulta.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryConsulta.FieldByName('MOECODIGO').AsInteger,
                                    QryConsulta.FieldByName('CODTIPOACAO').AsString,
                                    QryConsulta.FieldByName('IDLOTE').AsString,
                                    '',
                                    QryConsulta.FieldByName('NUMDOCUMENTO').AsString,
                                    wRecPagBol, wTipoRecDesBol, bCriaLancto,
                                    //AL_20
                                    wTotalContab {Liquido total da boleta},
                                    fVlrOperacao,
                                    QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                                    QryConsulta.FieldByName('DATAVENCOPER').AsDateTime,
                                    wPlanoAC, wPlanilhaAC, wDocumContAC, wMensErro, '', False,
                                    True, sTipoDoc, True,
                                    QryConsulta.FieldByName('IDPLANPREVCTBPATR').AsInteger);

            // Atualiza Plano e PlnCodigo da IRLITIGIO
            If ((wPlanilhaAC > 0) And (wPlanoAC > 0)) Then
            begin
               ExecutaQuery(QryAux,
                  'UPDATE IRLITIGIO SET PLNCODIGO = '+IntToStr(wPlanilhaAC)+
                  ' ,PLANO = '+IntToStr(wPlanoAC)+
                  ' WHERE 	(IDOPERACAOINVEST = '+QryConsulta.FieldByName('IDOPERACAOINVEST').AsString+')');
               QryAux.Close;
            end;
         // AL_2
         except on E: Exception do
            begin
               If dtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.Rollback;
               pnlMensagem.Caption  := E.Message;
               // AL_17
               MsgDlg('Não foi possível Fechar essa boleta.'+ #13 +
                       E.Message,'Mensagem do Sistema ', mtWarning,[mbOK],0);
               Exit;
            end;
         end;

         //AL_17
         // Caso seja em data fechada marca os investimentos para reprocessamento
         if QryConsulta.FieldByName('DATAOPERACAO').AsDateTime <= pRPI.DATAULTFECH then
         begin
            if not RendaVariavel.MarcarFlagReproc(QryConsulta.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  QryConsulta.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                  QryConsulta.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                  QryConsulta.FieldByName('DATAOPERACAO').AsDateTime) then
            begin
               If dtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.Rollback;
               pnlMensagem.Caption  := 'Não foi possível marcar ' + QryConsulta.FieldByName('DESCINVESTIMENTO').AsString + ' para Reprocessamento';
               MsgDlg('Não foi possível marcar ' + QryConsulta.FieldByName('DESCINVESTIMENTO').AsString + ' para Reprocessamento',
                      'Mensagem do Sistema ', mtWarning,[mbOK],0);
               Exit;
            end;
         end;

         // Proximo Registro de Operacao
         QryConsulta.Next;
         prgProgresso.StepIt;
         prgProgresso.Repaint;
      End;

      prgProgresso.Position := 0;
      prgProgresso.Max := 100;
      prgProgresso.Repaint;

      // Busca Inicio da Cota na Carteira
      wQtdCotaIni:= pRPI.VLRCOTAINICART;

      //Al_3
      // Se tiver Compensacao entre Pag e Rec para zerar a cta contabil quando a
      // Boleta tiver Compra e Venda
      if pRPI.FLGRECPAGRV = 'S' then
      begin
         // Mostra Progresso
         pnlMensagem.Caption:= ' Contabilizando compensação PAG/REC';
         pnlMensagem.Repaint;

         fVlrRecPag := 0;
         if ((wTotalLiquido < 0) and (wTotalaReceber <> 0)) then // à Pagar -> zera a conta à Receber
         begin
            fVlrRecPag := wTotalaReceber;
               fVlrRecPag := fVlrRecPag - fVlrDespVenda;

            ExecutaQuery(QryAux,'  UPDATE BOLETA SET VLRTOTAREC = '+TrocaVirgulaPonto(FloatToStr(Abs(fVlrRecPag)))+' '+
                                '  WHERE IDBOLETA = '+QuotedStr(wDocumento));
         end
         else if ((wTotalLiquido > 0) and (wTotalaPagar <> 0)) then // à Receber -> zera a conta à Pagar
         begin
            fVlrRecPag := wTotalaPagar - fVlrDespCompra;
            ExecutaQuery(QryAux,'  UPDATE BOLETA SET VLRTOTAPAG = '+TrocaVirgulaPonto(FloatToStr(Abs(fVlrRecPag)))+' '+
                                '  WHERE IDBOLETA = '+QuotedStr(wDocumento));
         end;

         // AL_12
         if fVlrRecPag <> 0 then
         begin
            // Mostra Progresso
            pnlMensagem.Caption:= ' Contabilizando compensação PAG/REC de R$ ' + FormatFloat('#,#0.00', fVlrRecPag);
            pnlMensagem.Repaint;

            FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOOPERACAO = -109');
            if not qryAux.IsEmpty then
               //AL_12 - Não precisa passar o id da operação (Faz cálculos e loop sem motivo)
               //AL_4
               //AL_19
               //AL_20
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, 79,2,-1,-109,-1,
                                       iIdForCli,
                                       -1,
                                       QryConsulta.FieldByName('MOECODIGO').AsInteger,
                                       '','','',
                                       wDocumento,
                                       wRecPagBol, wTipoRecDesBol, bCriaLancto, wTotalContab,
                                       fVlrRecPag,
                                       StrToDate(dbeDtRef.Text),
                                       StrToDate(dbeDataLiquidacao.Text),
                                       wPlanoAC, wPlanilhaAC, wDocumContAC, wMensErro, '', False,
                                       False, sTipoDoc, True,
                                       QryConsulta.FieldByName('IDPLANPREVCTBPATR').AsInteger);
         end;
      end;

      // Mostra Progresso
      pnlMensagem.Caption:= ' Finalizando o fechamento da boleta ' + QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
      pnlMensagem.Repaint;
      // Atualiza Status da Boleta e das Operações.
      with qryAtualizaBoleta do
      begin
         OperComum.LimpaParametros(qryAtualizaBoleta,True);
         ParamByName('BOLETA').asString            := QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
         if wDocumContAC > 0 then
            ParamByName('CODDOCUMENTO').asInteger  := wDocumContAC;
         if wPlanoAC > 0 then
            ParamByName('PLANO').asInteger         := wPlanoAC;
         if wPlanilhaAC > 0 then
            ParamByName('PLNCODIGO').asInteger     := wPlanilhaAC;
         ExecSQL;
      end;

      // Atualiza o Ststus da Operação
      with qryAtualizaOperacoes do
      begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('BOLETA').asString := QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
         ExecSQL;
      end;
      // Inabilita Controles
      BtMovCarteira.Enabled := False;
      GridDespesas.Enabled  := False;
      // Finaliza Painel
      pnlMensagem.Caption  := ' Processamento concluído.';
      // Libera Objetos Locais
      bbtnConfirmarClick(Self);
      MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema', MtInformation,[MbOk],0);
   finally
      //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
      QueryCCBaixa.SQL.Clear;
      QueryCCBaixa := Nil;

      DsCCBaixa    := Nil;
      UpdCCBaixa   := Nil;

      QryConsulta.First;
      // Reabilita Controles
      pnlMensagem.Visible := False;
      pnlProgresso.Visible := False;
   end;
   // AL_12 - Fim
end;

procedure TFrmFechaBoleta.QryConsultaAfterOpen(DataSet: TDataSet);
var
   //AL_4
   iTipDocPag, iTipDocRec : Integer;
begin
  inherited;
// Inabilita Controles
//Ver
  QryConsulta.DisableControls;
// Calcula Valores Totais
  //Al_3
  wTotalaReceber := 0;
  wTotalaPagar   := 0;
  wTotalDespesa  := 0;
  wTotalLiquido  := 0;
  //AL_9
  fVlrDespVenda  := 0;
  //AL_13
  fVlrDespCompra  := 0;
  while not QryConsulta.EOF do
  begin
    // Total de Despesas
    wTotalDespesa := wTotalDespesa + QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;
    // Soma de Acordo com Tipo de Natureza(Venda/Compra)
    If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
    Begin
      wTotalLiquido := wTotalLiquido - QryConsulta.FieldByName('VLROPERACAO').AsFloat;
      wTotalaPagar  := wTotalaPagar - QryConsulta.FieldByName('VLROPERACAO').AsFloat;
      //AL_4
      iTipDocPag    := QryConsulta.FieldByName('CODTIPDOC').AsInteger;
      //AL_13
      fVlrDespCompra  := fVlrDespCompra + QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;
    End
    Else If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
    Begin
      wTotalLiquido  := wTotalLiquido + QryConsulta.FieldByName('VLROPERACAO').AsFloat;
      wTotalaReceber := wTotalaReceber + QryConsulta.FieldByName('VLROPERACAO').AsFloat;
      //AL_4
      iTipDocRec     := QryConsulta.FieldByName('CODTIPDOC').AsInteger;
      //AL_9
      fVlrDespVenda  := fVlrDespVenda + QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;
    End;
    // Empréstimo de Ações (Tomador) -> Abater o custo para zerar a Boleta
    if QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger = -95 then
    begin
       wTotalDespesa := wTotalDespesa - QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;
       wTotalLiquido := wTotalLiquido + QryConsulta.FieldByName('VLROPERACAO').AsFloat ;
      //AL_4
      iTipDocRec     := QryConsulta.FieldByName('CODTIPDOC').AsInteger;
    end
    // Reversão de Empréstimo de Ações (Tomador)
    else if QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger = -96 then
    //AL_4
    begin
        wTotalLiquido := wTotalLiquido - QryConsulta.FieldByName('VLROPERACAO').AsFloat;
        iTipDocRec    := QryConsulta.FieldByName('CODTIPDOC').AsInteger;
    end;

    QryConsulta.Next;
  End;

  // Calcula Resultado Liquido
  wTotalLiquido := wTotalLiquido - wTotalDespesa;

  // Altera Descricao do Total
  if (wTotalLiquido < 0) Then
  begin
     Label6.Caption :='Total Líquido a Pagar ';
     sTipoDoc := iTipDocPag;
  end
  else
  begin
     Label6.Caption :='Total Líquido a Receber';
     sTipoDoc := iTipDocRec;
  end;

// Primeiro da Query
  QryConsulta.First;
// Preenche componntes com os Resultados
  PnlDespesas.Caption  :=FormatFloat('###,###,##0.00',wTotalDespesa)+' ';
  PnlTotLiquido.Caption:=FormatFloat('###,###,##0.00',Abs(wTotalLiquido))+' ';
// Habilita Controles
//Ver
  QryConsulta.EnableControls;

end;

procedure TFrmFechaBoleta.QryDespesasOperacaoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  inherited;
  If UpdateKind = ukInsert Then Begin
    UpdateAction:=uaSkip;
  End;
end;

procedure TFrmFechaBoleta.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Confirma Cancelamento
  If (MsgDlg('Deseja realmente cancelar esta operação ?',
    'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)
    Then Begin
      Exit;
  End;
// Caso Esteja em uma Transacao Cancela a Mesma
  If DtmBaseDados.dbBaseDados.InTransaction Then Begin
     DtmBaseDados.dbBaseDados.Rollback;
  End;
// Fecha o Formulario
  Close;
end;

procedure TFrmFechaBoleta.bbtnConfirmarClick(Sender: TObject);
var fDevCorret : Double;
begin
  inherited;
  fDevCorret := StrToFloat(TrocaPontoVirgula(edtPercDevCorret.Text));
  ExecutaQuery(QryAux,'  UPDATE BOLETA SET OBSERVACAO = '+QuotedStr(mmoObs.Text)+' '+
                      '  ,PERCDEVCORRET = '+TrocaVirgulaPonto(FloatToStr(fDevCorret))+' '+
                      '  WHERE IDBOLETA = '+QuotedStr(wDocumento));
  QryAux.Close;
  wIdCorretora := IntToStr(QryDespesasOperacao.FieldByName('IDCORRETVALORES').AsInteger);

  ExecutaQuery(QryAux,'  UPDATE HISTCARTINV SET '+
                      '  VLRTOTLIQUIDAR = '+TrocaVirgulaPonto(FloatToStr(Abs(wTotalLiquido)))+' '+
                      '  WHERE '+
                      '  IDCORRETVALORES = '+wIdCorretora+' AND '+
                      '  DATAMOVCARTINV  = TO_DATE('''+dbeDtRef.Text+''',''DD/MM/YYYY'') ');
  QryAux.Close;

// Caso Nao Tenha Alimentado a Carteira Bloqueia
  If BtMovCarteira.Enabled = True Then
  Begin
      //AL_17
      MsgDlg('Carteira não foi movimentada.','Mensagem do Sistema', mtWarning,[MbOk],0);
     Exit;
  End;

// Caso Esteja em uma Transacao Confirma a Mesma
  If DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.Commit;

  wBoletaFecha := 'F';     

  ModuloConsultaFechamento;
     
end;

procedure TFrmFechaBoleta.QryDespesasOperacaoAfterOpen(DataSet: TDataSet);
begin
  inherited;
   // Habilita ou Inabilita o Grid de Despesas
   //AL_21 - Impede que o grid seja habilitado quando a boleta estiver fechada
   GridDespesas.Enabled := ((Not QryDespesasOperacao.IsEmpty) and (wBoletaFecha <> 'F'));
   If (PgCt.ActivePage <> TbConsolidado) Then
      pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
end;

procedure TFrmFechaBoleta.BitBtn1Click(Sender: TObject);
Var
  wSqlConsulta:String;
  wDecSep:Char;
begin
  inherited;
  wDecSep         := DecimalSeparator;
  DecimalSeparator:='.';
  wSqlConsulta:=
    'SELECT DISTINCT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.QTDEOPERACAO,         '+
    '       OI.PRECOUNITOPERACAO, OI.VLROPERACAO, DS.TOTALDESPESAS, BV.IDBOLSAVALORES,     '+
    '       SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO, PS.NOME,                           '+
    '       SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO, TI.DESCTIPOOPERACAO,     '+
    '       OI.NUMDOCUMENTO, TI.NATUREZAOPERACAO, IV.IDINVESTIMENTO, BO.OBSERVACAO,        '+
    '       0 AS PUMEDIOCOMPRA, 0 AS PUMEDIOVENDA,                                         '+

    FloatToStr(wTotalDespesa)+' AS TOTALDESPESABOLETA, '''+Sistema.NomeEmpresa+''' AS EMPRESA, '+
    FloatToStr(wTotalLiquido)+' AS TOTALLIQUIDOBOLETA  '+

    'FROM  OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV, '+
    '      INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, BOLETA BO,    '+
    '   (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS        '+
    '    FROM DESPOPERINVEST DOI, TIPODESPINVEST TDI                            '+
    '    WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND                    '+
    '           TDI.NATUREZAOPERACAO NOT IN (''N'')                                '+
    '    GROUP BY DOI.IDOPERACAOINVEST) DS                                         '+
    'WHERE   (OI.NUMDOCUMENTO      = '''+wDocumento+''')     AND '+
    '        (OI.IDOPERACAOINVEST  = OA.IDOPERACAOINVEST)    AND '+
    '        (OI.IDOPERACAOINVEST  = DS.IDOPERACAOINVEST(+)) AND '+
    '        (OI.IDCORRETVALORES   = PS.IDPESSOA) 	     AND '+
    '        (OA.IDBOLSAVALORES    = BV.IDBOLSAVALORES)	     AND '+
    '        (OA.IDACAO            = IV.IDINVESTIMENTO)      AND '+
    '        (TI.IDMERCADO         = ME.IDMERCADO)	     AND '+
    '        (OI.NUMDOCUMENTO      = BO.IDBOLETA(+))	     AND '+
    '        (OI.IDTIPOOPERACAO    = TI.IDTIPOOPERACAO)          ';

  DecimalSeparator:=wDecSep;
  DmRelatorios.qryListInv.Sql.Clear;
  DmRelatorios.qryListInv.Sql.Add(wSqlConsulta);

  DmRelatorios.qryListInv.Open;
  DmRelatorios.RptListInv.Print;
  DmRelatorios.qryListInv.Close;;
end;

procedure TFrmFechaBoleta.GridDespesasColExit(Sender: TObject);
Var
  wIdOperacao, wIdDespesa:Integer;
begin
  inherited;
  If (Sender.ClassType = TDbGrid) And
     ( ( (Sender As TDbGrid).SelectedField.FieldName = 'VLRDESPOPER'     ) Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DATAVENCDESPOPER') Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DESCCRED'        ) ) And
     (QryDespesasOperacao.State In [DsEdit]) Then Begin
// Guarda Despesas
    If Not QryDespesasOperacao.IsEmpty Then Begin
      Try
        QryDespesasOperacao.ApplyUpdates;
        QryDespesasOperacao.CommitUpdates;
      Except
        Raise;
      End;
    End;
  End;
end;


procedure TFrmFechaBoleta.QryDespesasOperacaoAfterPost(DataSet: TDataSet);
Var
  wIdOperacao, wIdDespesa : Integer;
begin
// Heranca
  inherited;
  If (Not TestaValor(DataSet.FieldByName('VLRDESPOPER').OldValue-
                     DataSet.FieldByName('VLRDESPOPER').AsFloat) )
  Then Begin
    MsgDlg('Alteração maior do que a permitida','Mensagem do Sistema',
           MtWarning,[MbOk],0);
    QryDespesasOperacao.CancelUpdates;
    QryDespesasOperacao.CommitUpdates;
    Exit;
  End;
// Aplica Alteracoes no Banco
  QryDespesasOperacao.ApplyUpdates;
  QryDespesasOperacao.CommitUpdates;


// Fecha e Abre a Query de Operacoes
  QryConsulta.Close;
  QryConsulta.Open;

  If (PgCt.ActivePage <> TbConsolidado) Then
     pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
  QryConsolidado.Close;
  QryConsolidado.ParamByName('NUMDOC').AsString := wDocumento;
  QryConsolidado.Open;

end;

procedure TFrmFechaBoleta.GridDespesasExit(Sender: TObject);
begin
  inherited;
  If (Sender.ClassType = TDbGrid) And
     ( ( (Sender As TDbGrid).SelectedField.FieldName = 'VLRDESPOPER'     ) Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DATAVENCDESPOPER') Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DESCCRED'        ) ) And
     (QryDespesasOperacao.State In [DsEdit]) Then Begin
// Guarda Despesas
    If Not QryDespesasOperacao.IsEmpty Then Begin
      Try
        QryDespesasOperacao.ApplyUpdates;
        QryDespesasOperacao.CommitUpdates;
      Except
        Raise;
      End;
    End;
  End;
end;

procedure TFrmFechaBoleta.bbtnSairClick(Sender: TObject);
begin
// Caso esteja em transacao mostra mensagem informando
  If DtmBaseDados.dbBaseDados.InTransaction Then Begin
    If MsgDlg( 'As alterações não foram confirmadas, Deseja Sair ?','Mensagem do Sistema ',
             MtWarning,[MbOk, MbCancel],0) = MrCancel Then
      Exit;
  End;
// Caso Esteja em uma Transacao Cancela a Mesma
  If DtmBaseDados.dbBaseDados.InTransaction Then Begin
     DtmBaseDados.dbBaseDados.Rollback;
  End;

// Heranca
  inherited;
end;

procedure TFrmFechaBoleta.BtRecalculaClick(Sender: TObject);
Var
   wValCorretagemLiq : Double;
begin
  inherited;
  // Confirma Recalculo
  If (MsgDlg('Confirma Recalculo das Despesas ?',
             'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then Begin
    Exit;
  End;
  if not(dtmBaseDados.dbBaseDados.InTransaction) then
     DtmBaseDados.dbBaseDados.StartTransaction;

  try
     // Exclui todos os lancamentos de despesa das operacoes
     // desta boleta no HISTCARTINV
     ExecutaQuery(QryAux,
            'DELETE FROM HISTCARTINV HC                                    '+
            'WHERE IDHISTCARTINV IN (SELECT H.IDHISTCARTINV                '+
            '                        FROM HISTCARTINV H, OPERACAOINVEST O  '+
            '                        WHERE (O.NUMDOCUMENTO     = '+QuotedStr(wDocumento)+') AND '+
            '                              (H.IDDESPOPERINVEST IS NOT NULL)                 AND '+
            '                              (H.IDOPERACAOINVEST = O.IDOPERACAOINVEST))');

     // Recalcula as Despesas desta Boleta
     CalcDespesasDoc(QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                     dbeDocumento.Text, wIdLote);

      DtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Recalculo das despesas OK ! ', 'Mensagem do Sistema', mtInformation, [mbOk],0);
   except
      DtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Não foi possível recalcular as despesas ! ', 'Mensagem do Sistema', mtWarning, [mbOk],0);
   end;

  // Reabre as Querys
  QryConsulta.Close;
  QryConsulta.ParamByName('NUMDOC').AsString:=wDocumento;
  QryConsulta.Open;

  If (PgCt.ActivePage <> TbConsolidado) Then
     pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
  QryDespesasOperacao.Close;
  QryDespesasOperacao.Open;
  QryConsolidado.Close;
  QryConsolidado.ParamByName('NUMDOC').AsString := wDocumento;
  QryConsolidado.Open;

end;

procedure TFrmFechaBoleta.QryDespesasOperacaoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QryDespesasOperacao.CancelUpdates;
  QryDespesasOperacao.CommitUpdates;
end;

procedure TFrmFechaBoleta.PgCtChange(Sender: TObject);
Var
   wValCorretagemLiq, wValCorretagemLiqCons : Double;
   iIDOPERACAOINVEST : Integer;
begin
  inherited;
  wValCorretagemLiq     := 0;
  wValCorretagemLiqCons := 0;
  iIDOPERACAOINVEST     := QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
  If (PgCt.ActivePage = TbObs) And (mmoObs.Enabled) Then
     if mmoObs.CanFocus then
        mmoObs.SetFocus;
  If (PgCt.ActivePage = TbConsolidado) Then
  Begin
     With QryConsulta Do
     Begin
        DisableControls;
        First;
        While Not EOF Do
        Begin
           wValCorretagemLiqCons := wValCorretagemLiqCons + CorretagemLiquida;
           Next;
        End;
        EnableControls;
     End;
     pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(wValCorretagemLiqCons))+' ';
     QryConsulta.Locate('IDOPERACAOINVEST', iIDOPERACAOINVEST, [loPartialKey]);
  End
  Else
     pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
end;

procedure TFrmFechaBoleta.FormCreate(Sender: TObject);
begin
  inherited;
   PpRegisterform(TppCustomPreviewer, Tppprintpreview);
end;

procedure TFrmFechaBoleta.Alterar1Click(Sender: TObject);
begin
  inherited;
   GridDespesas.Visible    := False;
   PnlDadosDespesa.Visible := True;
   QryDespesasOperacao.Edit;
   if bbtnOkDet.CanFocus then
      bbtnOkDet.SetFocus;
end;

procedure TFrmFechaBoleta.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   QryDespesasOperacao.Cancel;
   QryDespesasOperacao.CancelUpdates;
   PnlDadosDespesa.Visible := False;
   GridDespesas.Visible    := True;
   PnlOperDoc.Enabled      := True;
end;

procedure TFrmFechaBoleta.bbtnOkDetClick(Sender: TObject);
begin
   //AL_1
   iTipoDesp   := QryDespesasOperacao.FieldByName('IDTIPODESPINVEST').AsInteger;
   fQtdDifDesp := QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
  inherited;
   QryDespesasOperacao.Post;
   QryDespesasOperacao.ApplyUpdates;
   QryDespesasOperacao.CommitUpdates;
   PnlDadosDespesa.Visible := False;
   GridDespesas.Visible    := True;
   PnlOperDoc.Enabled      := True;
end;

procedure TFrmFechaBoleta.SB1Click(Sender: TObject);
begin
  inherited;
// Executa a Pesquisa
  MSBuscaCredor.Executar;
// Teste de Retornou Algo
  If MSBuscaCredor.RetornouValor Then Begin
// Preenche os Dados 
    QryDespesasOperacao.FieldByName('IDFORCLI').AsString := MSBuscaCredor.ValoresChave[0];
    DBEdit6.Text := MSBuscaCredor.ValoresChave[1];
  End;
end;

procedure TFrmFechaBoleta.PnlDadosDespesaExit(Sender: TObject);
begin
  inherited;
   If QryDespesasOperacao.State in [DsEdit] Then
      bbtnCancelarDetClick(Self);
end;

Function TFrmFechaBoleta.CorretagemLiquida : Double   ;
begin
   Result := 0;
   QryCorretagemDevol.Close;
   QryCorretagemDevol.ParamByName('IDOPERACAOINVEST').AsInteger :=
                      QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryCorretagemDevol.Open;
   While Not QryCorretagemDevol.EOF Do
   Begin
      Result := Result + QryCorretagemDevol.Fieldbyname('VLRDESPOPER').AsFloat;
      QryCorretagemDevol.Next;
   End;
end;

procedure TFrmFechaBoleta.dbGridConsultaCellClick(Column: TColumn);
begin
  inherited;
  If (PgCt.ActivePage <> TbConsolidado) Then
     pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
end;

procedure TFrmFechaBoleta.MontaQryConsultaGerencial;
begin
   With QryConsultaGerencial Do
   Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,');
      SQL.Add('       OI.QTDEOPERACAO, OI.IDOPERACAOINVEST,OI.PRECOUNITOPERACAO,');
      SQL.Add('       OI.VLROPERACAO, DS.TOTALDESPESAS,');
      SQL.Add('       SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,');
      SQL.Add('       PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO,');
      SQL.Add('       TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO,');
      SQL.Add('       TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, OI.IDPLANPREVCTBPATR, ');
      SQL.Add('       TI.IDTIPOINVEST, OI.IDTIPOOPERACAO, OI.IDFORCLI,');
      SQL.Add('       OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, AC.CODTIPOACAO, OI.MOECODIGO,');
      SQL.Add('       OI.IDINVESTIMENTO, OI.IDLOTE, OI.FLGSTATUSFECHBOL,');
      SQL.Add('       DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',');
      SQL.Add('             DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',');
      SQL.Add('                DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',');
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL, TI.CODTIPDOC, ');
      SQL.Add('       COUNT(*) OVER(PARTITION BY OI.NUMDOCUMENTO) NUMREC');
      SQL.Add('FROM OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,');
      SQL.Add('     INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,');
      SQL.Add('      	(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS');
      SQL.Add('         FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI');
      SQL.Add('         WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST 	AND');
      SQL.Add('                TDI.NATUREZAOPERACAO NOT IN (''N'')');
      SQL.Add('         GROUP BY DOI.IDOPERACAOINVEST) DS');
      SQL.Add('WHERE (OI.NUMDOCUMENTO     = '''+wDocumento+''')     AND');
      SQL.Add('      (OI.IDCARTEIRAGERENC IS NOT NULL)              AND');
      SQL.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND');
      SQL.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND');
      SQL.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	    AND');
      SQL.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	    AND');
      SQL.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO)      AND');
      SQL.Add('      (TI.IDMERCADO 	  = ME.IDMERCADO)	    AND');
      SQL.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND');
      SQL.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)');
      If (wTotalLiquido < 0) Then
         SQL.Add('   ORDER BY RECPAGBOL DESC')
      Else
         SQL.Add('   ORDER BY RECPAGBOL     ');
      Open;
      // AL_12 - Melhora da performance
      if not IsEmpty then
      begin
         Close;
         UniDirectional := True;
         Open;
      end;
   End;
end;

Function TFrmFechaBoleta.MovimentaCarteiraGerencial : Boolean;
Var wQtdCotaini : Double;
    wDifDespesa : Currency;
Begin
   // AL_12 - Inicio
   pnlMensagem.Caption:= ' Processando Carteiras Gerenciais';
   pnlMensagem.Repaint;
   Application.ProcessMessages;

   OperComum.LimpaParametros(QryBuscaDespCarteiraGerenc);
   QryBuscaDespCarteiraGerenc.ParamByName('NUMDOCUMENTO').AsString := wDocumento;
   QryBuscaDespCarteiraGerenc.Open;
   wDifDespesa := (wTotalDespesa-QryBuscaDespCarteiraGerenc.FieldByName('TOTALDESPESAS').AsFloat);
   QryBuscaDespCarteiraGerenc.Close;

   wQtdCotaini := 0;
   MontaQryConsultaGerencial; //Ordenando pelo tipo de Natureza (P/R)
   // Inicia Processamento

   If wDifDespesa <> 0 Then
   begin
      OperComum.LimpaParametros(QryBuscaDespOperInvest);
      QryBuscaDespOperInvest.ParamByName('IDOPERACAOINVEST').AsInteger :=
                           QryConsultaGerencial.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryBuscaDespOperInvest.Open;

      //AL_1
      OperComum.LimpaParametros(QryBuscaDespOperInvestGer);
      QryBuscaDespOperInvestGer.ParamByName('IDTIPODESPINVEST').AsInteger := iTipoDesp;
      QryBuscaDespOperInvestGer.ParamByName('QTDEOPERACAO').AsFloat       := fQtdDifDesp;
      QryBuscaDespOperInvestGer.Open;
      If QryBuscaDespOperInvestGer.IsEmpty Then
      begin
         OperComum.LimpaParametros(QryUpdDespOperInvest);
         QryUpdDespOperInvest.ParamByName('IDDESPOPERINVEST').AsInteger :=
                              QryBuscaDespOperInvest.FieldByName('IDDESPOPERINVEST').AsInteger;
         QryUpdDespOperInvest.ParamByName('VLRDESPOPER').AsFloat        := wDifDespesa;
         QryUpdDespOperInvest.ExecSQL;
      end
      else
      begin
         OperComum.LimpaParametros(QryUpdDespOperInvest);
         QryUpdDespOperInvest.ParamByName('IDDESPOPERINVEST').AsInteger :=
                              QryBuscaDespOperInvestGer.FieldByName('IDDESPOPERINVEST').AsInteger;
         QryUpdDespOperInvest.ParamByName('VLRDESPOPER').AsFloat        := wDifDespesa;
         QryUpdDespOperInvest.ExecSQL;
      end;
      QryBuscaDespOperInvestGer.Close;
      QryBuscaDespOperInvest.Close;
      //AL_1 - FIM
   end;

   // Faz Todas as Despesas
   prgProgresso.Max := QryConsultaGerencial.FieldByName('NUMREC').AsInteger;
   prgProgresso.Min := 0;
   prgProgresso.Repaint;
   Application.ProcessMessages;

   While Not QryConsultaGerencial.EOF Do
   Begin
      QryDespesasOperacaoGer.Close;
      QryDespesasOperacaoGer.ParamByName('IDOPERACAOINVEST').AsInteger :=
                             QryConsultaGerencial.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryDespesasOperacaoGer.Open;
      QryDespesasOperacaoGer.First;

      // Faz Todas as Despesas
      While Not QryDespesasOperacaoGer.EOF Do
      Begin
         Try
            If (QryDespesasOperacaoGer.FieldByName('NATOPERDESP').AsString <> 'N') Then
            Begin
               If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                         QryDespesasOperacaoGer.FieldByName('IDINVESTIMENTO').AsInteger,
                         QryDespesasOperacaoGer.FieldByName('IDTIPOINVEST').AsInteger,
                         QryDespesasOperacaoGer.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                         QryDespesasOperacaoGer.FieldByName('IDTIPOOPERACAO').AsInteger,
                         QryDespesasOperacaoGer.FieldByName('IDCARTEIRAINVEST').AsInteger,
                         QryDespesasOperacaoGer.FieldByName('IDCARTEIRAGERENC').AsInteger,
                         QryDespesasOperacaoGer.FieldByName('IDDESPOPERINVEST').AsInteger, -1,
                         -1, -1, -1,
                         QryDespesasOperacaoGer.FieldByName('DATAOPERACAO').AsDateTime,
                         QryDespesasOperacaoGer.FieldByName('VLRDESPOPER').AsFloat,
                         QryDespesasOperacaoGer.FieldByName('QTDEOPERACAO').AsFloat,
                         wValIniCotas, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         QryDespesasOperacaoGer.FieldByName('NATOPERDESP').AsString,
                         QryDespesasOperacaoGer.FieldByName('NATUREZAOPERACAO').AsString,
                         QryDespesasOperacaoGer.FieldByName('IDLOTE').AsString,
                         QryDespesasOperacaoGer.FieldByName('DESCTIPODESPINV').AsString+' / '+
                         QryDespesasOperacaoGer.FieldByName('DESCINVESTIMENTO').AsString,
                         'DOP','', '', True,
                         QryDespesasOperacaoGer.FieldByName('IDCORRETVALORES').AsInteger,
                         QryDespesasOperacaoGer.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                         iIdHistCartInv)
                         Then
               begin
                  Result := False;
                  Exit;
               end;
            end;
         Except;
            Result := False;
            Exit;
         End;
         // Proximo Registro de Despesa
         QryDespesasOperacaoGer.Next;
      End;

      // Caso Operacao de Venda (NATURMOV = 'D') MArca o Regsitro de Lucro Com Flag (1)
      // Para ser Recalculado
      ExecutaQuery(QryAux,'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' '+
                          'WHERE 	(TIPMOVCARTINV    = ''LUC'') AND '+
                          '      	(IDOPERACAOINVEST = '+
                           QuotedStr(QryConsultaGerencial.FieldByName('IDOPERACAOINVEST').AsString)+')');
      QryAux.Close;

      // Alimenta os Saldos da Carteira
      OperComum.AtualizaSaldos(wQtdCotaini,-1);

      // Proximo Registro de Operacao
      QryConsultaGerencial.Next;
      prgProgresso.StepIt;
      prgProgresso.Repaint;
   End;

   prgProgresso.Position := 0;
   prgProgresso.Max := 100;
   prgProgresso.Min := 0;
   prgProgresso.Repaint;
   pnlMensagem.Caption := '';
   Application.ProcessMessages;
   Result := True;
   //AL_12 - Fim
End;

procedure TFrmFechaBoleta.AlterarConsultaClick(Sender: TObject);
begin
  inherited;
   dbGridConsulta.Visible    := False;
   pnlConsulta.Visible := True;
   QryConsulta.Edit;
   if bbtnOkConsulta.CanFocus then
      bbtnOkConsulta.SetFocus;
   fVlrOperacaoAnt := QryConsulta.FieldByName('VLROPERACAO').AsFloat;
end;

procedure TFrmFechaBoleta.bbtnCancelaConsultaClick(Sender: TObject);
begin
  inherited;
   PnlDesp.Enabled        := True;
   QryConsulta.Cancel;
   QryConsulta.CancelUpdates;
   PnlConsulta.Visible    := False;
   dbGridConsulta.Visible := True;
end;

procedure TFrmFechaBoleta.bbtnOkConsultaClick(Sender: TObject);
var
   fDiferenca : Double;
begin
  inherited;
   if fVlrOperacaoAnt <> QryConsulta.FieldByName('VLROPERACAO').AsFloat then // O Valor foi alterado
   begin
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      fDiferenca := QryConsulta.FieldByName('VLROPERACAO').AsFloat - fVlrOperacaoAnt;

      if QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'A' then // Compra
      Begin
         If wTotalLiquido >0 Then
         wTotalLiquido := wTotalLiquido + fDiferenca
         Else
            wTotalLiquido := wTotalLiquido - fDiferenca;

      End
      else if QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'D' then // Venda
      Begin
         If wTotalLiquido >0 Then
           wTotalLiquido := wTotalLiquido + fDiferenca
         else
           wTotalLiquido := wTotalLiquido - fDiferenca
      End;

      PnlTotLiquido.Caption:=FormatFloat('###,###,##0.00',Abs(wTotalLiquido))+' ';
      // Atualiza o Valor na Tabela : OPERACAOINVEST
      QryConsulta.Post;
      QryConsulta.ApplyUpdates;
      QryConsulta.CommitUpdates;
      // Atualiza o Valor na Tabela : HISTCARTINV
      OperComum.LimpaParametros(qryUpdVlrOperacao);
      qryUpdVlrOperacao.ParamByName('IDOPERACAOINVEST').AsInteger := QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      qryUpdVlrOperacao.ParamByName('VLRMOVCARTINV').AsFloat      := QryConsulta.FieldByName('VLROPERACAO').AsFloat;
      qryUpdVlrOperacao.ExecSql;
      OperComum.LimpaParametros(qryUpdFlgCalcSaldo);
      qryUpdFlgCalcSaldo.ParamByName('IDOPERACAOINVEST').AsInteger := QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      qryUpdFlgCalcSaldo.ExecSql;
      if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
      begin
         //AL_17
         MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                'esta Operação não poderá ser confirmada ','Mensagem do Sistema', mtWarning,[MbOk],0);
         If dtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         Exit;
      end;
   end;
   // Atualiza
   pnlConsulta.Visible    := False;
   dbGridConsulta.Visible := True;
   PnlDesp.Enabled        := True;
end;

procedure TFrmFechaBoleta.bbtnVoltarConsultaClick(Sender: TObject);
begin
  inherited;
  PnlDesp.Enabled        := True;  
  QryConsulta.Cancel;
  QryConsulta.CancelUpdates;
  pnlConsulta.Visible    := False;
  dbGridConsulta.Visible := True;
end;

procedure TFrmFechaBoleta.GridDespesasDblClick(Sender: TObject);
begin
  inherited;
   //AL_3
   if ((QryDespesasOperacao.FieldByName('IDTIPODESPINVEST').AsInteger = -31) or
       (QryDespesasOperacao.FieldByName('IDTIPODESPINVEST').AsInteger = -32)) then
      MsgDlg('Esta Rúbrica não pode ser alterada.','Mensagem do Sistema', MtWarning,[MbOk],0)
   else
   begin
      PnlOperDoc.Enabled      := False;
      GridDespesas.Visible    := False;
      PnlDadosDespesa.Visible := True;
      QryDespesasOperacao.Edit;
      if bbtnOkDet.CanFocus then
         bbtnOkDet.SetFocus;
   end;
end;

procedure TFrmFechaBoleta.dbGridConsultaDblClick(Sender: TObject);
begin
  inherited;
   dbGridConsulta.Visible    := False;
   pnlConsulta.Visible       := True;
   QryConsulta.Edit;
   if bbtnOkConsulta.CanFocus then
      bbtnOkConsulta.SetFocus;
   fVlrOperacaoAnt           := QryConsulta.FieldByName('VLROPERACAO').AsFloat;
   PnlDesp.Enabled           := False;
end;

procedure TFrmFechaBoleta.AltDevCorretClick(Sender: TObject);
var fPerc: Double;
begin
   inherited;
   pnlDetlConsolidado.BringToFront;
   OperComum.LimpaParametros(qryBuscaDevCorrAtual);
   qryBuscaDevCorrAtual.ParamByName('NUMDOCUMENTO').AsString := dbeDocumento.Text;
   qryBuscaDevCorrAtual.Open;
   edtPercDevCorret.Text := qryBuscaDevCorrAtual.FieldByName('PERCDEV').AsString;
   if edtPercDevCorret.CanFocus then
      edtPercDevCorret.SetFocus;
end;

procedure TFrmFechaBoleta.btnCancelaConsolidadoClick(Sender: TObject);
begin
  inherited;
   pnlDetlConsolidado.SendToBack;
   qryBuscaDevCorret.Close;
end;

procedure TFrmFechaBoleta.btnVoltarConsolidadoClick(Sender: TObject);
begin
  inherited;
   pnlDetlConsolidado.SendToBack;
   qryBuscaDevCorret.Close;
end;

procedure TFrmFechaBoleta.btnOkConsolidadoClick(Sender: TObject);
begin
  inherited;
   // Refaz as Devoluções de Corretagem da Boleta
   if edtPercDevCorret.Text <> qryBuscaDevCorret.FieldByName('VALOR').AsString then
   begin
   // ver depois como tratar
      if (MsgDlg('Confirma o Recalculo das Despesas ?',
                 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then Begin
         Exit;
      end
      else
      begin
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         try
            // Exclui todos os lancamentos de despesa das operacoes desta boleta no HISTCARTINV
            ExecutaQuery(QryAux,
                   'DELETE FROM HISTCARTINV HC                                    '+
                   'WHERE IDHISTCARTINV IN (SELECT H.IDHISTCARTINV                '+
                   '                        FROM HISTCARTINV H, OPERACAOINVEST O  '+
                   '                        WHERE (O.NUMDOCUMENTO     = '+QuotedStr(wDocumento)+') AND '+
                   '                              (H.IDDESPOPERINVEST IS NOT NULL)                 AND '+
                   '                              (H.IDOPERACAOINVEST = O.IDOPERACAOINVEST))');

            // AL_14 - Troca a virgula
            // Recalcula as Despesas desta Boleta
            CalcDespesasDoc(QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,dbeDocumento.Text, wIdLote,
                            OperComum.ConvertePonto(edtPercDevCorret.Text));

            DtmBaseDados.dbBaseDados.Commit;
            MsgDlg('Recalculo das Despesas concluído com sucesso.', 'Mensagem do Sistema', mtInformation, [mbOk],0);
         except
            DtmBaseDados.dbBaseDados.RollBack;
            MsgDlg('Ocorreu um problema no Recalculo das Despesas!', 'Mensagem do Sistema', mtWarning, [mbOk],0);
         end;

         // Reabre as Querys
         QryConsulta.Close;
         QryConsulta.ParamByName('NUMDOC').AsString:=wDocumento;
         QryConsulta.Open;
         If (PgCt.ActivePage <> TbConsolidado) Then
            pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
         QryDespesasOperacao.Close;
         QryDespesasOperacao.Open;
         QryConsolidado.Close;
         QryConsolidado.ParamByName('NUMDOC').AsString := wDocumento;
         QryConsolidado.Open;
      end;

   end;
   pnlDetlConsolidado.SendToBack;
   qryBuscaDevCorret.Close;
end;

end.
