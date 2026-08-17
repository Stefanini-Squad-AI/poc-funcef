//------------------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Cadastro de Operações com Ações ..
// Form     .: FrmCadOperAcao - Unit .: FCadOperAcao
// Data     .: 04/02/1999
// Autor    .: Alexandre Ramos  **--> Serious Developer ...
//------------------------------------------------------------------------------
// Alterações :
//  16/11/1999  - Alterações na Transferencia de Acoes Automática
//   (SERPROS)    entre Carteiras, antes e depois das operações .
//                Não estava buscando os saldos das ações por Lote .
//  22/11/1999  - Alterações na Transferencia de Acoes Automática
//   (REFER)      entre Carteiras, Caso o Flag da Carteira nao trata Lotes
//                esteja marcado ignora o lote na hora de transferir
//  25/01/2000  - Transferencia de Acoes Automática entre Carteiras,
//   (REFER)      Caso seja na mesma Carteira mostra o investimento de destino
//                e transfere de investimento
//------------------------------------------------------------------------------
unit FCadOperAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, TB97Ctls, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, Mask, wwdblook,
  Grids, DBGrids, ComCtrls, DBTables, Wwquery, MontaSelect, ppDB, ppDBBDE,
  ppBands, ppCache, ppClass, ppComm, ppProd, ppReport, wwdbedit, TREdit,
  URegra, IvDictio, IvMulti, IvEMulti, UOperacaoInvest, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls, CmEventosCadastro, wwDialog, ImgList;

type
  TFrmCadOperAcao = Class(TfrmCadastro)
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    DsBolsaValores: TwwDataSource;
    QryAcaoBolsa: TwwQuery;
    DsAcaoBolsa: TwwDataSource;
    DsSubTipo: TwwDataSource;
    QrySubTipo: TwwQuery;
    PageControl1: TPageControl;
    TS1: TTabSheet;
    TS2: TTabSheet;
    TS3: TTabSheet;
    TS4: TTabSheet;
    TS5: TTabSheet;
    Label1: TLabel;
    DbLkcBolsa: TwwDBLookupCombo;
    Label2: TLabel;
    DbLkcAcao: TwwDBLookupCombo;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBDateEdit1: TCMDateTimePicker;
    Label4: TLabel;
    QryPrincipal: TwwQuery;
    QryPrincipalIDOPERACAOINVEST: TFloatField;
    QryPrincipalIDCUSTODIANTE: TFloatField;
    QryPrincipalIDCARTEIRAINVEST: TFloatField;
    QryPrincipalIDTIPOINVEST: TFloatField;
    QryPrincipalIDTIPOOPERACAO: TFloatField;
    QryPrincipalIDINSTFIN: TFloatField;
    QryPrincipalDATAOPERACAO: TDateTimeField;
    QryPrincipalQTDEOPERACAO: TFloatField;
    QryPrincipalPRECOUNITOPERACAO: TFloatField;
    QryPrincipalVLROPERACAO: TFloatField;
    QryAux: TwwQuery;
    MontaSelect: TMontaSelect;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DbLkcTipoOperacao: TwwDBLookupCombo;
    QryBuscaOperacao: TwwQuery;
    Label9: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    QryBuscaCarteira: TwwQuery;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnAltDet: TSpeedButton;
    sbtnExcluiDet: TSpeedButton;
    PnlImpostos: TPanel;
    GridImpostos: TDBGrid;
    QryBuscaCorretora: TwwQuery;
    DbLkcBuscaCorretor: TwwDBLookupCombo;
    Label11: TLabel;
    DsImpostosOperacao: TwwDataSource;
    Animate1: TAnimate;
    QryBuscaImposto: TwwQuery;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBDateEdit2: TCMDateTimePicker;
    Panel1: TPanel;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    PnlDespesas: TPanel;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    BtOkDetDesp: TBitBtn;
    BtCancDetDesp: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    QryDespesasOperacao: TwwQuery;
    DsDespesasOperacao: TwwDataSource;
    QryBuscaDespesa: TwwQuery;
    QryBuscaDespesaIDTIPODESPINVEST: TFloatField;
    QryBuscaDespesaMOECODIGO: TFloatField;
    QryBuscaDespesaDESCTIPODESPINV: TStringField;
    Animate2: TAnimate;
    GridDespesas: TDBGrid;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBDateEdit3: TCMDateTimePicker;
    DbLckCredor: TwwDBLookupCombo;
    QryBuscaCredor: TwwQuery;
    QryPrincipalNUMDOCUMENTO: TStringField;
    DBEdit2Tela: TRealEdit;
    DBEdit2: TEdit;
    Regra: TRegra;
    QryRegra: TwwQuery;
    QryBuscaOperacaoIDTIPOINVEST: TFloatField;
    QryBuscaOperacaoIDTIPOOPERACAO: TFloatField;
    QryBuscaOperacaoIDMERCADO: TFloatField;
    QryBuscaOperacaoDESCTIPOOPERACAO: TStringField;
    QryBuscaOperacaoNATUREZAOPERACAO: TStringField;
    QryBuscaOperacaoTIPOCUSTODIA: TStringField;
    QryImpostosOperacao: TwwQuery;
    QryImpostosOperacaoIDOPERACAOINVEST: TFloatField;
    QryImpostosOperacaoIDTIPOINVEST: TFloatField;
    QryImpostosOperacaoIDTIPOOPERACAO: TFloatField;
    QryImpostosOperacaoIDIMPOSTOINVEST: TFloatField;
    QryImpostosOperacaoIDREGRACALCUSADA: TFloatField;
    QryImpostosOperacaoIDREGRAVENCUSADA: TFloatField;
    QryImpostosOperacaoVLRIMPOSTOOPER: TFloatField;
    QryImpostosOperacaoDATAVENCIMPINVEST: TDateTimeField;
    QryImpostosOperacaoFLGCALCDIARIO: TFloatField;
    QryImpostosOperacaoIDPESSOA: TFloatField;
    QryImpostosOperacaoDESCIMPOSTO: TStringField;
    QryImpostosOperacaoCREDOR: TStringField;
    DBEdit8: TDBEdit;
    Label17: TLabel;
    DBDateEdit4: TCMDateTimePicker;
    QryPrincipalDATAVENCOPER: TDateTimeField;
    Label18: TLabel;
    QryBuscaOperacaoVENCIMENTO: TFloatField;
    QryPrincipalIDINVESTIMENTO: TFloatField;
    QryPrincipalEMPRESAPROP: TFloatField;
    QryBuscaCredorIDPESSOA: TFloatField;
    QryBuscaCredorRAZAOSOCIAL: TStringField;
    UpdPrincipal: TUpdateSQL;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoEMPRESAPROP: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoFLGCALCDIARIO: TFloatField;
    QryDespesasOperacaoDESCDESP2: TStringField;
    QryBuscaOperacaoTIPCREDOR: TStringField;
    QryPrincipalIDFORCLI: TFloatField;
    QryPrincipalIDCORRETVALORES: TFloatField;
    DBEdit9: TDBEdit;
    Label19: TLabel;
    BtDetalhes: TToolbarButton97;
    QryBolsaValoresMOECODIGO: TFloatField;
    QryPrincipalMOECODIGO: TFloatField;
    DblkcCarteira: TwwDBLookupCombo;
    Label20: TLabel;
    BtNovoDoc: TBitBtn;
    BtFechamento: TToolbarButton97;
    Panel3: TPanel;
    DkBtCancelaRubrica: TPanel;
    BtCancelaRubrica: TSpeedButton;
    Label10: TLabel;
    DbLkcCarteiraDestOri: TwwDBLookupCombo;
    Label21: TLabel;
    QryPrincipalIDCARTORIDEST: TFloatField;
    QryBuscaOperacaoFLGTRANSF: TStringField;
    PnlLote: TPanel;
    Label22: TLabel;
    QryPrincipalIDLOTE: TStringField;
    QryCarteiraOriDest: TwwQuery;
    QryBuscaOperacaoFLGCORRET: TStringField;
    QryPrincipalIDMODULO: TFloatField;
    GrBxTransf: TGroupBox;
    DbLkcInvestTransf: TwwDBLookupCombo;
    Label24: TLabel;
    Label23: TLabel;
    EdVlrUnitTransf: TRealEdit;
    EdQtdTransf: TRealEdit;
    QryPrincipalIDINVESTDEST: TFloatField;
    QryAcaoBolsaTransf: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField2: TStringField;
    Label25: TLabel;
    QryPrincipalIDORDMOVINV: TFloatField;
    QryOrdMovInv: TwwQuery;
    QryParamInvest: TwwQuery;
    QryQtdOperacoes: TwwQuery;
    QryParamInvestFLGORDMOVINV: TStringField;
    QryParamInvestPERCPUORDMOVINV: TFloatField;
    DbLkcOrdMovInv: TwwDBLookupCombo;
    QryBuscaOperacaoFLGORDMOVINV: TStringField;
    msOrdem: TMontaSelect;
    QryDadosOrdemSel: TwwQuery;
    QryQtdOperacoesQTDETOTOPERACAO: TFloatField;
    QryOrdMovInvIDORDMOVINV: TFloatField;
    QryOrdMovInvOBSMOVINV: TStringField;
    QryOrdMovInvQTDEORDMOVINV: TFloatField;
    QryOrdMovInvPUORDMOVINV: TFloatField;
    QryOrdMovInvDESCTIPOOPERACAO: TStringField;
    QryOrdMovInvQTDEORDENADA: TFloatField;
    QryOrdMovInvNUMDOCMOVINV: TStringField;
    QryOrdMovInvDATAORDMOVINV: TDateTimeField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    QryBuscaCustodiante: TwwQuery;
    DbLkcBuscaCust: TwwDBLookupCombo;
    Label26: TLabel;
    GrBxTransfCust: TGroupBox;
    Label27: TLabel;
    DbLkcCustOrig: TwwDBLookupCombo;
    Label28: TLabel;
    DbLkcCustDest: TwwDBLookupCombo;
    QryPrincipalIDCUSTORIG: TFloatField;
    QryPrincipalIDCUSTDEST: TFloatField;
    QryBolsaValoresIDCUSTODIANTE: TFloatField;
    QryBuscaOperacaoFLGTRATAIR: TStringField;
    QryPrincipalVLRIR: TFloatField;
    QryAcaoBolsaIDBOLSAVALORES: TFloatField;
    QryAcaoBolsaIDACAO: TFloatField;
    QryAcaoBolsaMOECODIGO: TFloatField;
    QryAcaoBolsaQTDELOTE: TFloatField;
    QryAcaoBolsaDESCINVESTIMENTO: TStringField;
    QryAcaoBolsaIDEMISSOR: TFloatField;
    QryAcaoBolsaCODTIPOACAO: TStringField;
    QryAcaoBolsaFLGPROVISIONAIR: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DbLkcBolsaChange(Sender: TObject);
    procedure QrySubTipoAfterScroll(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure QryPrincipalAfterScroll(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure AcertaBotoes(wOperacao:String);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure BtAltDespClick(Sender: TObject);
    procedure BtOkDetDespClick(Sender: TObject);
    procedure BtCancDetDespClick(Sender: TObject);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit20Change(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DbLkcTipoOperacaoChange(Sender: TObject);
    Function  CalculaVencimento(DataInicial:TDateTime; DiasUteis:Integer):TDateTime;
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure BtDetalhesClick(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure BtCancelaRubricaClick(Sender: TObject);
    procedure BtFechamentoClick(Sender: TObject);
    procedure DbLkcBolsaExit(Sender: TObject);
    procedure DbLkcBolsaEnter(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtNovoDocClick(Sender: TObject);
    procedure DbLkcCarteiraDestOriChange(Sender: TObject);
    procedure DblkcCarteiraChange(Sender: TObject);
    procedure EdQtdTransfChange(Sender: TObject);
    procedure BtNovoDocExit(Sender: TObject);
    procedure DbLkcOrdMovInvCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcTipoOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcBuscaCorretorChange(Sender: TObject);
    procedure DbLkcBuscaCustChange(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
// Variaveis de Transferencia de Informacoes entre Operacoes ...
    wIdCarteiraInvest, wIdTipoOperacao, wIdCorretValores,
    wPlano, wFatura, wPlanilha, wDocumento, wIdForCli,
    wIdOperacao, wIdAcao, wIdBolsavalores, wIdCartBasica, wIdCartOriDest,
    wIdCustodiante, wIdCustOrig, wIdCustDest :Integer;
    wNumDocumento, wTipoCustodia, wIdLote, wOldBolsaValores, wFLGORDMOVINV,
    wMensErro, wHistorico : String;
    wOprContabil : shortint;
    wEmContrato, wEmPesquisa:Boolean;
    wQtdOperacao, wPrecoLote, wVlrOperacao :Double;
    wDtOperacao:TDate;
    wNoDoc    :Extended;
// Funcoes Publicas
    Function TransfereAntes:Boolean;
    Function TransfereDepois:Boolean;
// Procedures Publicas
    Procedure BuscaOrdemMovimentacao;
  end;

var
  FrmCadOperAcao: TFrmCadOperAcao;
  wIdPrincipal,wOldIdPrincipal,iIdHistCartInv : Integer;
  wValorRegra : Double;
  wQtdCotaIni, wQtdAutorizada, wQtdOperacoes : Integer;
  wTipoOrdMov, wBtRetorno, wNumDoc, wSql: String;
  wDataEmissao:TDate;
  wCorretValores, wBolsaValores, wIdOperCust :Integer;
  fVlrRendimento : Double;

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

Uses UDataBase, UBibliotecaInvest, DBaseDados, UMensErro, UFuncoesInvest,
     UFuncoesRendaFixa, USistema, UIntegraBack, UDocumento,
     FFechaBoleta, ULancContab,UImpostos, UOperComum, dOperComum;

//-------------------------------------------------------------
// Botao Ok
procedure TFrmCadOperAcao.bbtnConfirmarClick(Sender: TObject);
Var
   wValSaldo, iResultado :Double;
   wOprContabil, wIdForCli, wValCota,
   wExercicio, wPeriodo, wIdEmpresa :Integer;
   wMensErro, wHistorico, wMovimentoaExecutar, wValString, wMensContab: String;
   wSaldoQtd, wSaldoVlr, wSaldoInutil, wVlrMovCartInv,wSaldoAqui,wSaldoIRApu,wVlrIRProv :Double;
   QryAuxiliar : TwwQuery;
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
begin
   // Heranca
   //  Inherited
   // Cria Objetos Locais

   wPlanilha:=-1;
   wPlano   :=-1;
   wFatura  :=-1;
   wNoDoc   :=-1;
   wDocumento:=-1;
   wVlrIRProv := 0;

   QryAuxiliar := TwwQuery.Create(Self);
   QryAuxiliar.DatabaseName:='BaseDados';

   // Critica Dados
   if (DbLkcBolsa.Text  = '') or (DbLkcAcao.Text   = '') or
      (DBDateEdit1.Text = '') or (DBEdit1.Text     = '') or
      (DBDateEdit4.Text = '') or (DbLkcCarteira.Text = '') or
      (DbLkcBuscaCust.Text = '') then
   begin
      MsgDlg('Faltam Preencher Campos .....','Mensagem do Sistema',
            MtWarning,[MbOk],0);
      DbLkcBolsa.SetFocus;
      Exit;
   end;

   if ( (GrBxTransf.Visible = True) And (DbLkcInvestTransf.Text = '') ) Or
      ( (GrBxTransf.Visible = True) And (EdQtdTransf.Value <= 0) ) Then
   begin
      MsgDlg('Faltam Preencher dados da Transferência.','Mensagem do Sistema',
              MtWarning,[MbOk],0);
      DbLkcInvestTransf.SetFocus;
      Exit;
   end;

   // Caso Exija a Ordem Barra Operacao
   if (DbLkcOrdMovInv.Text  = '') And
      (QryParamInvest.FieldByName('FLGORDMOVINV').AsString <> 'N') And
      (QryBuscaOperacao.FieldByName('FLGORDMOVINV').AsString = 'S') Then
   begin
       MsgDlg('Falta Preencher Ordem de Movimentação!','Mensagem do Sistema',
               MtWarning,[MbOk],0);
       DbLkcOrdMovInv.SetFocus;
       Exit;
   end;

   // Caso Tenha ocorrido erro na traneferencia Depois da Operacao
   if (Ds.DataSet.State In [DsBrowse]) Then
   begin
       MsgDlg('Ocorreu um erro com esta Operação, ela não pode ser Confirmada.','Mensagem do Sistema',
               MtWarning,[MbOk],0);
       Exit;
   end;

   // Caso Tenha ocorrido erro na trasnferencia Depois da Operacao
   if (StrToDate(DBDateEdit1.Text) < QryBuscaCarteira.FieldByName('DATAINICIO').AsDateTime) Then
   begin
      MsgDlg('Data da Operação menor que Inicio da Carteira.','Mensagem do Sistema',
            MtWarning,[MbOk],0);
      Exit;
   end;

   // Testa se Periodo Contabil esta Fechado
   wIdEmpresa := Sistema.IdEmpresa;
   //  If TestaPeriodo(True, 'BASEDADOS', DBDateEdit1.Text, IntToStr(Sistema.IdModulo),
   //       wExercicio, wPeriodo, wIdEmpresa, wMensContab) <> 0 Then Begin
   //    MsgDlg('Atenção:'+#13+'O Periodo Contábil nesta data esta Fechado. ', 'Mensagem do Sistema',
   //           MtError,[MbOk],0);
   //    sbtnInserir.Down:=False;
   //    sbtnAlterar.Down:=False;
   //    Exit;
   //  End;

   // Caso Pagina Ativa = Despesas Exije cadastro do Corretor.
   if (QryPrincipal.State In [DsEdit, DsInsert]) And (DbLkcBuscaCorretor.Text = '') And
      (QryBuscaOperacao.FieldByName('FLGCORRET').AsString = 'S') Then
   begin
      MsgDlg('A Corretora desta Operação não foi preenchida..',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      PageControl1.ActivePage := TS1;
      Exit;
   end;

   // Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento
   if Not VerificaFechamentoOperacao(DBDateEdit1.Text) Then
      Exit;

   //------------------------------------------------------------------------------
   //  Tratamento quanto à Ordem de Movimentação:
   // N - Não trata a Ordem de Movimentação
   // T - Exige a Ordem de Movimentação para aceitar o registro das Operações
   // A - Exige a autorização da Ordem de
   //     Movimentação para aceitar o registro das Operações.

   if (QryParamInvest.FieldByName('FLGORDMOVINV').AsString <> 'N') and
      (QryBuscaOperacao.FieldByName('FLGORDMOVINV').AsString = 'S') Then
   begin

      // Pegar a QTDAUTORIZADA - ( (Soma das QTDS das operações deste mesmo ORDMOVINV) +
      // a QTD que está sendo gravada). Se for < 0, a operação NÃO PODE ser gravada.

      // Guarda a Qyd. Autorizada.
      wQtdAutorizada := QryOrdMovInv.FieldByName('QTDEORDMOVINV').AsInteger;

      // Busca a soma das operações com o mesmo IDORDMOVINV
      with QryQtdOperacoes Do
      begin
         Close;
         ParamByName('pIDCARTEIRAINVEST').AsString := DblkcCarteira.LookupValue;
         ParamByName('pIDCORRETVALORES').AsString  := DbLkcBuscaCorretor.LookupValue;
         ParamByName('pIDINVESTIMENTO').AsString   := DbLkcAcao.LookupValue;
         ParamByName('pIDTIPOOPERACAO').AsString   := DbLkcTipoOperacao.LookupValue;
         ParamByName('pIDORDMOVINV').AsString      := DbLkcOrdMovInv.LookupValue;
         If QryPrincipal.FieldByName('IDLOTE').AsString <> '' Then
            ParamByName('pIDLOTE').AsString := QryPrincipal.FieldByName('IDLOTE').AsString
         Else
            ParamByName('pIDLOTE').AsString := '-1';
         Open;
      end;

      // Guarda A soma das operações ( Soma dos mesmos IDORDMOVINV + Esta )
      wQtdOperacoes  := QryQtdOperacoes.FieldByName('QTDETOTOPERACAO').AsInteger +
                        QryPrincipal.FieldByName('QTDEOPERACAO').AsInteger;

      // Testa se a Quantidade Autorizada foi Ultrapassada
      if ( StrToFloat(FormatFloat('###############0.000000000',wQtdAutorizada)) -
           StrToFloat(FormatFloat('###############0.000000000',wQtdOperacoes)) ) < 0 Then
      begin
         MsgDlg('Quantidade de operações maior que quantidade autorizada !',
                'Mensagem do Sistema', MtWarning,[MbOk],0);
         Exit;
      end
      else
      begin
         //------------------------------------------------------------------------------
         // Como a Quantidade esta Ok ..... Testa Tipo de Operação \\

         // Caso Operação de Compra
         if QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'A' Then
         begin
            // Calcula o PU
            iResultado := ( QryOrdMovInv.FieldByName('PUORDMOVINV').AsInteger *
                          (1 + QryParamInvest.FieldByName('PERCPUORDMOVINV').AsFloat/100) );
            // Testa o Preço por Lote (Caso <> da Ordem Sai Fora)
            if StrToFloat(FormatFloat('###############0.000000000',iResultado)) >
               StrToFloat(FormatFloat('###############0.000000000',StrToFloat(DBEdit4.Text))) Then
            begin

               // Caso a Qtd. Autorizada for igual a Qtd Operada, Atualiza Status.
               //          If (wQtdAutorizada - wQtdOperacoes) = 0 Then Begin
               if ( StrToFloat(FormatFloat('###############0.000000000',wQtdAutorizada)) -
                    StrToFloat(FormatFloat('###############0.000000000',wQtdOperacoes)) ) = 0 Then
               begin

                  // Muda Status e operacao pode ser gravada
                  try
                    wSql := '';
                    wSql :=
                      'UPDATE ORDMOVINV  '+
                      'SET STATMOVINV  = ''L'' '+
                      'WHERE IDORDMOVINV      = '''+DbLkcOrdMovInv.LookupValue +'''  AND '+
                      '      IDCARTEIRAINVEST = '''+DblkcCarteira.LookupValue  +'''  AND '+
                      '      IDINVESTIMENTO   = '''+DbLkcAcao.LookupValue      +'''  AND '+
                      '      IDTIPOOPERACAO   = '''+DbLkcTipoOperacao.LookupValue +'''' ;

                    If QryPrincipal.FieldByName('IDLOTE').AsString <> '' Then
                      wSql := wSql +  ' AND     IDLOTE = '''+QryPrincipal.FieldByName('IDLOTE').AsString+'''';

                    ExecutarQuery(QryAuxiliar, wSQL);
                  except
                    MsgDlg('Não foi possível atualizar o status do movimento!',
                           'Mensagem do Sistema', MtWarning,[MbOk],0);
                  end;
               end;
            end
            else
            begin
               MsgDlg('Preço por Lote maior do que o autorizado!',
                      'Mensagem do Sistema', MtWarning,[MbOk],0);
               Exit;
            end;
         end
         else
         begin
            // Caso Operação de Venda
            if QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
            begin

               // Calcula o PU
               iResultado := QryOrdMovInv.FieldByName('PUORDMOVINV').AsInteger *
                             (1 - QryParamInvest.FieldByName('PERCPUORDMOVINV').AsFloat/100);
   //         End;  **** Retirado pois não convem com a logica ****

               if ( StrToFloat(FormatFloat('###############0.000000000',iResultado)) <
                    StrToFloat(FormatFloat('###############0.000000000',StrToFloat(DBEdit4.Text))) ) Then
               begin

                  // Caso a Qtd. Autorizada for igual a Qtd Operada, Atualiza Status.
                  // If (wQtdAutorizada - wQtdOperacoes) = 0 Then Begin
                  if ( StrToFloat(FormatFloat('###############0.000000000',wQtdAutorizada)) -
                       StrToFloat(FormatFloat('###############0.000000000',wQtdOperacoes)) ) = 0 Then
                  begin
                     // Muda status e pode operacao pode ser gravada
                     Try
                        wSql := '';
                        wSql :=
                          'UPDATE ORDMOVINV  '+
                          'SET STATMOVINV  = ''L'' '+
                          'WHERE IDORDMOVINV      = '''+DbLkcOrdMovInv.LookupValue +'''  AND '+
                          '      IDCARTEIRAINVEST = '''+DblkcCarteira.LookupValue  +'''  AND '+
                          '      IDINVESTIMENTO   = '''+DbLkcAcao.LookupValue      +'''  AND '+
                          '      IDTIPOOPERACAO   = '''+DbLkcTipoOperacao.LookupValue +'''';
                        If QryPrincipal.FieldByName('IDLOTE').AsString <> '' Then
                          wSQL:= wSQL + '      AND IDLOTE   = '''+QryPrincipal.FieldByName('IDLOTE').AsString+'''';

                        ExecutarQuery(QryAuxiliar, wSQL);
                     Except
                       MsgDlg('Não foi possível atualizar o status do movimento!',
                              'Mensagem do Sistema', MtWarning,[MbOk],0);
                     End;
                  end;
               end
               else
               begin
                   MsgDlg('Preço por Lote maior do que o autorizado!',
                          'Mensagem do Sistema', MtWarning,[MbOk],0);
                   Exit;
               end;
            end;
         end;
      end;
   end;
   //------------------------------------------------------------------------------
   // Continua inclusão da operação
   // Inclui Outros dados da Operacao e Sequencial do SubTipo
   if Sbtninserir.Down = True Then
   begin
      QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger := QrySubTipo.FieldByName('IDACAO').AsInteger;
      if Trim(DbLkcBuscaCust.Text) <> '' then
         QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger  := QryBuscaCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
      QryPrincipal.FieldByName('IDMODULO').AsInteger       := Sistema.IdModulo;
      QryPrincipal.FieldByName('EMPRESAPROP').AsInteger    := Sistema.IdEmpresa;
      QryPrincipal.FieldByName('MOECODIGO').AsInteger      := QryAcaoBolsa.FieldByName('MOECODIGO').AsInteger;
      // Guarda dados da Operacao
      wOldIdPrincipal := QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger ;
      wDataEmissao    := QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime ;
      wCorretValores  := QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
      wBolsaValores   := QrySubTipo.FieldByName('IDBOLSAVALORES').AsInteger;

      //------------------------------------------------------------------------------
      // Testa Saldo na Custodia Caso Baixe o Investimento
      // Busca Saldos na Carteira
      wSaldoQtd:=0;
      OperComum.BuscaTodosSaldosInvestLote(QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           0{IDCARTEIRAGERENC},
                                           QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,-1,
                                           wIdLote, DateToStr(QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime),
                                           wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
                                           wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                           wSaldoIRApu, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                           wSaldoInutil);

      if (QryBuscaOperacao.FieldByName('TIPOCUSTODIA').AsString = 'D') Or
         (QryBuscaOperacao.FieldByName('TIPOCUSTODIA').AsString = 'X') Then
      begin

         // Caso não exista saldo na carteira de destino sai fora
         if (QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat > wSaldoQtd) Then
         begin
           MsgDlg('Não existe quantidade suficiente na Carteira para esta operação.',
                  'Mensagem do Sistema', MtError,[MbOk],0);
           Exit;
         end;
      end;

      // Calcula as Rubricas Automáticamente, Caso ainda não tenha sido.
      if QryDespesasOperacao.IsEmpty Then
      Begin
        PageControl1.ActivePage := TS4;
        PageControl1Change(Self);
      end;

      // Posta Principal
      //   Grava as informações já calculadas pois os dados da operação são necessários
      //   para a rotina TransfereAntes que chama a CadastraCustodia
      QryPrincipal.FieldByName('IDCUSTORIG').AsInteger      := 23;
      QryPrincipal.FieldByName('IDCUSTDEST').AsInteger      := 23;

      QryPrincipal.Post;
      QryPrincipal.ApplyUpdates;
      QryPrincipal.Edit;

      // Caso Exista Transferencia de Acoes antes da na Operacao
      if (QryBuscaOperacao.FieldByName('FLGTRANSF').AsString = 'A') Then
      begin
//VOLTAR         {// Fabio - Tirei para não fazer mais automaticamente (07/05/2003)
         if Not TransfereAntes Then
         begin
            MsgDlg('Erro ao transferir papéis antes da Operação ',
                   'Mensagem do Sistema',
                   MtError,[MbOk],0);
            Exit;
         end;
//         }
      end;

      // Busca Credor da Despesa caso Tipo de Credor
      if QryBuscaOperacao.FieldByName('TIPCREDOR').AsString <> '' Then
      begin
         // Atualiza de acordo Emissor/Corretor
         if QryBuscaOperacao.FieldByName('TIPCREDOR').AsString = 'CO' Then
         begin
            // Transforma Corretor em Fornecedor
            Try
               if QryBuscaOperacao.FieldByName('RECPAG').AsString = 'R' Then
               begin
                  Documento.ForCli.Inserir(QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False); // Cliente
               end
               else If QryBuscaOperacao.FieldByName('RECPAG').AsString = 'P' Then
               begin
                  Documento.ForCli.Inserir(QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
               end;
            Except  // Função gerava um Abort quando o Fornecedor

            End;    // já estava cadastrado

            if QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger <> 0 Then
            begin
               QryPrincipal.FieldByName('IDFORCLI').AsString := QryPrincipal.FieldByName('IDCORRETVALORES').AsString;
               wIdForCli := QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
            end;
         end
         else
         begin
            // Transforma Emissor em Fornecedor
            Try
               if QryBuscaOperacao.FieldByName('RECPAG').AsString = 'R' Then
               begin
                  Documento.ForCli.Inserir(QryAcaoBolsa.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTEEMI,Sistema.IdEmpresa,
                                           '','','','','C',False); // Cliente
               end
               else If QryBuscaOperacao.FieldByName('RECPAG').AsString = 'P' Then
               begin
                  Documento.ForCli.Inserir(QryAcaoBolsa.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
               end;
            Except  // Função gerava um Abort quando o Fornecedor

            End;    // já estava cadastrado
            QryPrincipal.FieldByName('IDFORCLI').AsString := QryAcaoBolsa.FieldByName('IDEMISSOR').AsString;
            wIdForCli := QryAcaoBolsa.FieldByName('IDEMISSOR').AsInteger;
         end;
      // Caso Credor
      end
      else
      begin
         // Busca o Credor no Sub........
         if FazQuery(QryAux,
           'SELECT IDFORCLI FROM CM.FORCLIXTIPOPER '+
           ' WHERE (IDTIPOINVEST  = '+QryPrincipal.FieldByName('IDTIPOINVEST').AsString+') AND '+
           '       (IDTIPOOPERACAO= '+QryPrincipal.FieldByName('IDTIPOOPERACAO').AsString+') AND '+
           '       (EMPRESAPROP   = '+IntToStr(Sistema.IdEmpresa)+')') Then
         begin
            QryPrincipal.FieldByName('IDFORCLI').AsString := QryAux.FieldByName('IDFORCLI').AsString;
            wIdForCli := QryAux.FieldByName('IDFORCLI').AsInteger;
            // Caso não encontre o Fornecedor
            if wIdForCli = 0 Then
            begin
              MsgDlg('O Credor deste Tipo de Operação não foi Informado !',
                     'Mensagem do Sistema',
                     MtError,[MbOk],0);
              Exit;
            end;
         end;
      end;

      QrySubTipo.FieldByName('IDOPERACAOINVEST').AsInteger := wIdPrincipal;
      QrySubTipo.FieldByName('IDEMISSOR').AsInteger := QryAcaoBolsa.FieldByName('IDEMISSOR').AsInteger;

      // Buscar o mercado
      // Apurar o saldo para calcular o IR e gravar no OPERACAOINVEST
      if (QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D') And
         ((QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString ='G')  or    // F.Gerador -> Ganho Capital
          (QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString ='V')) Then  // F.Gerador -> Valor da Operação
      begin
         fVlrRendimento := 0;
         QryPrincipal.FieldByName('VLRIR').AsFloat :=
                      Impostos.CalculaIr(2,
                                QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                                QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                QryBuscaOperacao.FieldByName('IDMERCADO').AsInteger,
                                QryPrincipal.FieldByName('IDLOTE').AsString,
                                QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                                QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                                (QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat*(wSaldoAqui/wSaldoQtd)),
                                QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
                                0,
                                'S',
                                QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString,
                                fVlrRendimento);

         // Verifica se existe provisionamento de IR
         if Impostos.BuscaProvisaoIR(2,QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger) then
            wVlrIRProv := ((wSaldoIRApu / wSaldoQtd)* QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat )* -1;
      end;

/////////////////////////////////////////////////////////////////////////////////////
{
      wPlanilha:=-1;
      wPlano   :=-1;
      wFatura  :=-1;
      wNoDoc   :=-1;
}
      //------------------------------------------------------------------------------
      // Contabiliza Operacao

      //--------------------------------------------\\
      // Acerta Historico da Carteira
      if QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsString <> '' Then
      begin

         if QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
         begin
            // ALIMENTA A CARTEIRA COM OS LUCROS/PREJUIZOS
            if wPlanilha = 0 Then
            begin
               wPlanilha  := -1;
               wPlano     := -1;
               wDocumento := -1;
            end;
            if OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
               QrySubTipo.FieldByName('IDACAO').AsInteger, 2, wIdPrincipal, -1,
               QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
               QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
               0{IDCARTEIRAGERENC},
               -1, -1, wPlanilha, wDocumento, wPlano,
               QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
               QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
               QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat,
               wQtdCotaini, 0 {Juros}, 0,0, 0, 0, 0, 0, 0, 0,
               'L' {Movimento},
               QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString {Operacao},
               wIdLote,
               'LUCRO/PREJUIZO NA VENDA'+' - '+
                 QryAcaoBolsa.FieldByName('DESCINVESTIMENTO').AsString,'LUC', '', '', True,
               -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
            begin
               // Alimenta os Saldos da Carteira
               if Not OperComum.AtualizaSaldos(wQtdCotaini,-1) Then
               begin
                  MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                         'esta Operação não poderá ser confirmada ','Mensagem do Sistema',
                          MtError,[MbOk],0);
                  // Como ocor1eu erro
                  bbtnConfirmar.Enabled:=False;
                  Exit;
               end;
               // Caso Operacao de Venda (NATURMOV = 'D') MArca o Regsitro de Lucro Com Flag (1)
               // Para ser Recalculado
               ExecutaQuery(QryAux,
                            'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' '+
                            'WHERE  (TIPMOVCARTINV    = ''LUC'') AND '+
                            '       (IDOPERACAOINVEST = '+
               QuotedStr(QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString)+')');

            end
            else
            begin
               MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                      'Mensagem do Sistema', MtError,[MbOk],0);
               BbtnCancelarClick(Self);
               Exit;
            end;
         end;

         // ALIMENTA A CARTEIRA COM A OPERACAO
{
         If wPlanilha = 0 Then wPlanilha := -1;
         wDocumento:=-1;
}
         If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
            QrySubTipo.FieldByName('IDACAO').AsInteger, 2, wIdPrincipal, -1,
            QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
            QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
            0{IDCARTEIRAGERENC},
            -1, -1, wPlanilha, wDocumento, wPlano,
            QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
            QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
            QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat,
            wQtdCotaini,0 {Variacao},0{Juros},wVlrIRProv,
            QryPrincipal.FieldByName('VLRIR').AsFloat, 0, 0, 0, 0 , 0,
            QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
            QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
            wIdLote,
            QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
              QryAcaoBolsa.FieldByName('DESCINVESTIMENTO').AsString,'OPE', '1', '', True,
            -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema', MtError,[MbOk],0);
            BbtnCancelarClick(Self);
            Exit;
         end;

      end;
   end;

/////////////////////////////////////////////////////////////////////////////////////////

   //--------------------------------------------\\
   // Guarda Dados Transfeiveis entre Operacoes
   FrmCadOperAcao.wIdTipoOperacao  := QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger;
   FrmCadOperAcao.wIdCarteiraInvest:= QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger;
   FrmCadOperAcao.wIdCorretValores := QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
   FrmCadOperAcao.wIdAcao          := QrySubTipo.FieldByName('IDACAO').AsInteger;
   FrmCadOperAcao.wIdBolsavalores  := QrySubTipo.FieldByName('IDBOLSAVALORES').AsInteger;
   FrmCadOperAcao.wNumDocumento    := QryPrincipal.FieldByName('NUMDOCUMENTO').AsString;
   FrmCadOperAcao.wQtdOperacao     := QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;
   FrmCadOperAcao.wVlrOperacao     := QryPrincipal.FieldByName('VLROPERACAO').AsFloat;
   FrmCadOperAcao.wPrecoLote       := QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat;
   FrmCadOperAcao.wDtOperacao      := QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime;
   FrmCadOperAcao.wTipoCustodia    := QryBuscaOperacao.FieldByName('TIPOCUSTODIA').AsString;
   FrmCadOperAcao.wIdCartBasica    := QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger;
   FrmCadOperAcao.wIdCartOriDest   := QryPrincipal.FieldByName('IDCARTORIDEST').AsInteger;
   FrmCadOperAcao.wIdCustodiante   := QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger;
   FrmCadOperAcao.wIdCustOrig      := QryPrincipal.FieldByName('IDCUSTORIG').AsInteger;
   FrmCadOperAcao.wIdCustDest      := QryPrincipal.FieldByName('IDCUSTDEST').AsInteger;

   if QryPrincipal.FieldByName('IDCUSTORIG').AsInteger = 0 then
      QryPrincipal.FieldByName('IDCUSTORIG').AsString := '';
   if QryPrincipal.FieldByName('IDCUSTDEST').AsInteger = 0 then
      QryPrincipal.FieldByName('IDCUSTDEST').AsString := '';
   QryPrincipal.FieldByName('IDCUSTORIG').AsInteger      := 23;
   QryPrincipal.FieldByName('IDCUSTDEST').AsInteger      := 23;

   //--------------------------------------------------------------------------------------------------
   // Posta Principal
   QryPrincipal.Post;
   QryPrincipal.ApplyUpdates;
   QryPrincipal.CommitUpdates;
   // Posta SubTipo
   QrySubTipo.Post;

   // Grava o IR Litígio
   if QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' then
   begin
      if not Impostos.GravaIrLitigio(2,
                     QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                     QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger,
                     QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                        QryAcaoBolsa.FieldByName('DESCINVESTIMENTO').AsString+' / '+
                        QryPrincipal.FieldByName('NUMDOCUMENTO').AsString,
                     QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                     iPlanoPrevContab,
                     iPatrocinadora,
                     QryPrincipal.FieldByName('VLRIR').AsFloat,
                     fVlrRendimento) then
         Exit;
   end;

   // Atualiza saldos e Confirma Transação caso Inserindo
   if SbtnInserir.Down = True Then
   begin
      // Alimenta os Saldos da Carteira
      if Not OperComum.AtualizaSaldos(wQtdCotaini,-1) Then
      begin
         MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                'esta Operação não poderá ser confirmada ','Mensagem do Sistema', MtError,[MbOk],0);
         // Como ocorreu erro
         bbtnConfirmar.Enabled:=False;
         Exit;
      end;
      //-------------------------------------------------------//
      // Caso Exista Transferencia de Acoes Depois da Operacao
      if (QryBuscaOperacao.FieldByName('FLGTRANSF').AsString = 'D') Then
      begin
//VOLTAR         {// Fabio - Tirei para não fazer mais automaticamente (07/05/2003)
         if Not TransfereDepois Then
         begin
            MsgDlg('Erro ao transferir papéis depois da Operação, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema', MtError,[MbOk],0);
            // Como ocorreu erro
            bbtnConfirmar.Enabled:=False;
            Exit;
         end;
//         }
      end;

//      if QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString  = 'N' Then
         wIdOperCust := wIdPrincipal;
//      else
//         wIdOperCust := -1;

      // ATUALIZA A CUSTODIA
      if Not OperacaoInvest.CadastraCustodia(wIdOperCust) Then
      begin
         MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                'Mensagem do Sistema', MtError,[MbOk],0);
         BbtnCancelarClick(Self);
         Exit;
      end;

      // Confirma a Transação
      Try
         DtmBaseDados.dbBaseDados.Commit;
      Except
         MsgDlg('Erro ao Confirmar a Transação, os dados desta operação serão perdidos. ',
                'Mensagem do Sistema', MtError,[MbOk],0);
         BbtnCancelarClick(Self);
      End;
   end;

   // Caso Inserindo, Fecha e Inclui Novo
   If (Sbtninserir.Down = True) And (Not wEmContrato) Then
   begin
      // Reabre a Query
      QryPrincipal.Close;
      QryPrincipal.Open;
      // Busca esta Operacao
      QryPrincipal.Locate('IDOPERACAOINVEST',IntToStr(wIdPrincipal),[]);
      // Inclui Proximo
      // sbtnInserirClick(Self);
      // Acerta Pagina
      PageControl1.ActivePage := TS1;
      // Fecha a Query de Impostos e Despesa
      // QryImpostosOperacao.Close;
      QryDespesasOperacao.Close;
      // Acerta Botoes
      AcertaBotoes('A');
   end
   else
   begin
      // Acerta Pagina
      PageControl1.ActivePage := TS1;
      // Acerta Botoes
      DkBtCancelaRubrica.Visible := False;
      AcertaBotoes('A');
   end;
   // Libera Combos
   DbLkcBolsa.Enabled           := True;
   DbLkcAcao.Enabled            := True;
   DbLkcTipoOperacao.Enabled    := True;
   DbLkcBuscaCorretor.Enabled   := True;
   DbLkcCarteira.Enabled        := True;
   DbLkcCarteiraDestOri.Enabled := True;
   DbLkcOrdMovInv.Enabled       := True;
   DbDateEdit1.Enabled          := True;
   DbDateEdit4.Enabled          := True;
   DBEdit3.Enabled              := True;
   DBEdit4.Enabled              := True;
   DBEdit5.Enabled              := True;
   BtNovoDoc.Enabled            := True;
   DkBtCancelaRubrica.Visible   := False;
   wBtRetorno                   := 'OK';
   // Ordem de Movimentação
   qryDadosOrdemSel.Close;
   qryDadosOrdemSel.ParamByName('pIDORDMOVINV').AsInteger := -1;
   qryDadosOrdemSel.ParamByName('pTIPOCONSULTA').AsString := 'T';
   qryDadosOrdemSel.Open;

   // Caso em Contrato Fecha Formulario
//   if wEmContrato Then
//      Close;
   QryAuxiliar.Free;

   // Caso Form tenha sido chamado Boato de Pesquisa do Contrato
   if wEmPesquisa = True Then
      sbtnInserir.Enabled:=False;

end;

//-----------------------------------------------------------
// Botao Inserir
procedure TFrmCadOperAcao.sbtnInserirClick(Sender: TObject);
begin
   // Acerta Pagina
   PageControl1.ActivePage := TS1;
   // Guarda dados da Operacao
   If wOldIdPrincipal=0 Then
      wOldIdPrincipal:=QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger ;
   // Heranca
   inherited;
   // Inclui Registro no SubTipo
   QrySubTipo.Append;

   // Limpa Campos
   DbEdit2Tela.Text := '';
   // Inicia Transação
   DtmBaseDados.dbBaseDados.StartTransaction;
   // Insere Registro no Banco
   wIdPrincipal := LeUltRegistro(Nil,'OPERACAOINVEST');
   QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger  := wIdPrincipal;

   if wEmContrato Then
      QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime :=wDtOperacao
   else
      QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime := Date;

   QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat        := 0;
   QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat   := 0;
   QryPrincipal.FieldByName('VLROPERACAO').AsFloat         := 0;
   QryPrincipal.FieldByName('IDTIPOINVEST').AsInteger      := 2;
   QryPrincipal.FieldByName('IDLOTE').AsString             := wIdLote;
   if wIdCustodiante <> 0 Then
   begin
      QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger   := wIdCustodiante;
      QryPrincipal.FieldByName('IDCUSTORIG').AsInteger      := wIdCustodiante;
      QryPrincipal.FieldByName('IDCUSTDEST').AsInteger      := wIdCustodiante;
   end
   else
   begin
      QryPrincipal.FieldByName('IDCUSTODIANTE').AsString := '';
      QryPrincipal.FieldByName('IDCUSTORIG').AsString    := '';
      QryPrincipal.FieldByName('IDCUSTDEST').AsString    := '';
   end;
   // Posta Principal
   QryPrincipal.Post;
   QryPrincipal.ApplyUpdates;
   QryPrincipal.Edit;
   // Fecha a Query de Impostos e Despesas
   QryDespesasOperacao.Close;
   // Libera Combos
   DbLkcAcao.Enabled           := True;
   DbLkcBolsa.Enabled          := True;
   DbLkcTipoOperacao.Enabled   := True;
   DbLkcBuscaCorretor.Enabled  := True;
   DbLkcCarteira.Enabled       := True;
   DbLkcCarteiraDestOri.Enabled:= True;
   DbLkcOrdMovInv.Enabled      := True;
   DbDateEdit1.Enabled         := True;
   DbDateEdit4.Enabled         := True;
   DBEdit3.Enabled             := True;
   DBEdit4.Enabled             := True;
   DBEdit5.Enabled             := True;
   BtNovoDoc.Enabled           := True;
   DkBtCancelaRubrica.Visible  := True;
   BtDetalhes.Enabled          := False;
   BtFechamento.Enabled        := False;

   // Preenche dados Automaticos
   If wIdAcao = 0 Then
      QrySubTipo.FieldByName('IDACAO').AsString :=''
   Else
      QrySubTipo.FieldByName('IDACAO').AsInteger:=wIdAcao;

   If wIdCorretValores <> 0 Then
      QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger  :=wIdCorretValores;
   If wIdBolsavalores <> 0 Then
      QrySubTipo.FieldByName('IDBOLSAVALORES').AsInteger    :=wIdBolsavalores;
   If wIdCustodiante <> 0 Then
      QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger    :=wIdCustodiante;

   QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger  :=wIdTipoOperacao;
   QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger:=wIdCarteiraInvest;
   QryPrincipal.FieldByName('NUMDOCUMENTO').AsString     :=wNumDocumento;

   QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat :=wPrecoLote;
   QryPrincipal.FieldByName('VLROPERACAO').AsFloat       :=wVlrOperacao;
   QryPrincipal.FieldByName('IDLOTE').AsString           :=wIdLote;
   QryPrincipal.FieldByName('QTDEOPERACAO').AsString     := FloatToStr(wQtdOperacao);

   if not qryDadosOrdemSel.isEmpty then
   begin
      QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime     := QryDadosOrdemSel.FieldByName('DATAORDMOVINV').AsDateTime;
      QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat        := QryDadosOrdemSel.FieldByName('QTDEORDENADA').AsFloat;
      QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat   := QryDadosOrdemSel.FieldByName('PUORDMOVINV').AsFloat;
      QryPrincipal.FieldByName('IDTIPOINVEST').AsInteger      := 2;
      QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger   := QryDadosOrdemSel.FieldByName('IDCORRETVALORES').AsInteger;
      QrySubTipo.FieldByName('IDACAO').AsInteger              := QryDadosOrdemSel.FieldByName('IDINVESTIMENTO').AsInteger;
      QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger  := QryDadosOrdemSel.FieldByName('IDCARTEIRAINVEST').AsInteger;
      QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger    := QryDadosOrdemSel.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryPrincipal.FieldByName('NUMDOCUMENTO').AsString       := QryDadosOrdemSel.FieldByName('NUMDOCMOVINV').AsString;
      QryPrincipal.FieldByName('IDORDMOVINV').AsInteger       := QryDadosOrdemSel.FieldByName('IDORDMOVINV').AsInteger;
      qryDadosOrdemSel.Close;
      qryDadosOrdemSel.ParamByName('pIDORDMOVINV').AsInteger := -1;
      qryDadosOrdemSel.ParamByName('pTIPOCONSULTA').AsString := 'T';
      qryDadosOrdemSel.Open;
   end;

   // Seta Focus
   DbLkcBolsa.SetFocus;
end;

//---------------------------------------------------
// Fecha Formularios
procedure TFrmCadOperAcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Caso operacaoao em Contrato Muda o Tipo
   // saida para CaHide
   If wEmContrato Then
      Action := CaHide;

   inherited;
   // Fecha Querys
   QryParamInvest.Close;
   QryPrincipal.Close;
   QrySubTipo.Close;
   QryBolsaValores.Close;
   QryAcaoBolsa.Close;
   QryAcaoBolsaTransf.Close;
   QryBuscaOperacao.Close;
   QryBuscaCarteira.Close;
   QryCarteiraOriDest.Close;
   QryBuscaCorretora.Close;
   QryParamInvest.Close;
   QryBuscaCustodiante.Close;
   QryDespesasOperacao.Close;
   QryDespesasOperacao.Unprepare;
   // Caso em Contrato Muda Modal Results
   if wEmContrato Then
   begin
      FrmCadOperAcao.bbtnConfirmar.ModalResult:=MrOk;
      if wBtRetorno = 'OK' Then
         FrmCadOperAcao.ModalResult:=MrOk
      else
         FrmCadOperAcao.ModalResult:=MrCancel;
   end;
end;

//---------------------------------------------------
// Mostra Formulario
procedure TFrmCadOperAcao.FormShow(Sender: TObject);
begin
   inherited;
   // Abre Querys
   QrySubTipo.Open;
   QryPrincipal.Open;
   QryBolsaValores.Open;
   QryAcaoBolsa.Open;
   QryAcaoBolsaTransf.Open;
   QryBuscaOperacao.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
   QryBuscaOperacao.Open;
   QryBuscaCarteira.Open;
   QryCarteiraOriDest.Open;
   QryBuscaCorretora.Open;
   QryOrdMovInv.Open;
   QryParamInvest.Open;
   QryBuscaCustodiante.Open;

   QryParamInvest.Open;
   wFLGORDMOVINV := QryParamInvest.FieldByName('FLGORDMOVINV').AsString;

   if wFLGORDMOVINV = 'N' Then
   begin
      Label25.Visible        := False;
      DbLkcOrdMovInv.Visible := False;
   end
   else
   begin
      Label25.Visible        := True;
      DbLkcOrdMovInv.Visible := True;
   end;
   // Acerta Pagina
   PageControl1.ActivePage := TS1;
   // Preenche campos do Subtipo
   DbLkcBolsa.Value     := QrySubTipo.FieldByName('IDBOLSAVALORES').AsString;
   DbLkcBuscaCust.Value := QryBolsaValores.FieldByName('IDCUSTODIANTE').AsString;
   DbLkcAcao.Value      := QrySubTipo.FieldByName('IDACAO').AsString;
   // Esconde Navegator
   DbNav.Visible := False;
   // Prepare Tabela Pessoa
   //  QryBuscaCredor.Prepare;
   QryDespesasOperacao.Prepare;
   wNumDoc:='';
   // Caso Em Contrato Inclui Registro e Configura Dados
   if (wEmContrato) And (Not sbtnInserir.Down) Then
   begin
      // Insere Nova Operacao
      SbtnInserirClick(Self);
      // Preenche Dados Transferiveis
      QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger  :=wIdTipoOperacao;
      If wIdCorretValores <> 0 Then
         QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger :=wIdCorretValores;
      QrySubTipo.FieldByName('IDACAO').AsInteger            :=wIdAcao;
      QrySubTipo.FieldByName('IDBOLSAVALORES').AsInteger    :=wIdBolsavalores;
      QryPrincipal.FieldByName('NUMDOCUMENTO').AsString     :=wNumDocumento;
      QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat      :=wQtdOperacao;
      QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat :=wPrecoLote;
      QryPrincipal.FieldByName('VLROPERACAO').AsFloat       :=wVlrOperacao;
      QryPrincipal.FieldByName('DATAOPERACAO').AsFloat      :=wDtOperacao;
      QryPrincipal.FieldByName('IDLOTE').AsString           :=wIdLote;
      QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger:=wIdCartBasica;
      QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger   := wIdCustodiante;
      QryPrincipal.FieldByName('IDCUSTORIG').AsInteger      := wIdCustOrig;
      QryPrincipal.FieldByName('IDCUSTDEST').AsInteger      := wIdCustDest;

//      DbLkcAcao.Enabled:=False;
      PnlLote.Caption := wIdLote;
   end
   else
   if (Not wEmContrato) Then
   begin
      DbLkcAcao.Enabled:=True;
      If QryPrincipal.FieldByName('IDLOTE').AsString = '' Then
         PnlLote.Caption := '-'
   else
      PnlLote.Caption := QryPrincipal.FieldByName('IDLOTE').AsString;
//      wDtOperacao:=Date;
   end;

   // Caso Form tenha sido chamado Boato de Pesquisa do Contrato
   if wEmPesquisa = True Then
   begin
     QryPrincipal.Locate('IDOPERACAOINVEST',IntToStr(wIdOperacao),[]);
     sbtnInserir.Enabled:=False;
   end;

   // Acerta Variaveis
   wCorretValores:=0;
   wBolsaValores :=0;
   wDataEmissao  :=Date;
   wOldIdPrincipal:=0;

   // Seta Focus
   DbLkcBolsa.SetFocus;
   // Busca Inicio da Carteira
   FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
   wQtdCotaIni:= QryAux.FieldByName('VLRCOTAINICART').AsInteger;
   wTipoOrdMov:= QryAux.FieldByName('FLGORDMOVINV').AsString;
end;

//-----------------------------------------------------------
// Botao Cancelar
procedure TFrmCadOperAcao.bbtnCancelarClick(Sender: TObject);
begin
   // Confirma Cancelamento
   if (QryPrincipal.State In [DsEdit, DsInsert]) Then
   begin
      if (MsgDlg('Deseja realmente cancelar esta operação ?',
                 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then
      begin
         Exit;
      end;
   end;
   Try
      // Cancela Alteracoes nos SubTipos
      QrySubTipo.Cancel;
      // Cancela Transação
      if SbtnInserir.Down = True Then
      begin
         DtmBaseDados.dbBaseDados.RollBack;
         // Fecha a Query de Impostos e Despesas
         QryDespesasOperacao.Close;
      end;
   Except

   End;
   // Heranca
   inherited;
   // Busca Registro do Principal, Buscando os SubTipos Tambem
   if Not QryPrincipal.IsEmpty Then
   begin
      // Procura Registro do Principal
      QryPrincipal.Locate('IDOPERACAOINVEST',IntToStr(wOldIdPrincipal),[]);
   end;
   // Esconde Navegator
   DbNav.visible := False;
   // Acerta Pagina
   PageControl1.ActivePage    := TS1;
   // Libera Combos
   DbLkcBolsa.Enabled          := True;
   DbLkcAcao.Enabled           := True;
   DbLkcTipoOperacao.Enabled   := True;
   DbLkcBuscaCorretor.Enabled  := True;
   DbLkcCarteira.Enabled       := True;
   DbLkcCarteiraDestOri.Enabled:= True;
   DbLkcOrdMovInv.Enabled      := True;
   DbDateEdit1.Enabled         := True;
   DbDateEdit4.Enabled         := True;
   DBEdit3.Enabled             := True;
   DBEdit4.Enabled             := True;
   DBEdit5.Enabled             := True;
   BtDetalhes.Enabled          := True;
   BtFechamento.Enabled        := True;
   BtNovoDoc.Enabled           := False;
   DkBtCancelaRubrica.Visible  := False;
   wBtRetorno                  :='CANCELAR';
   // Caso Form tenha sido chamado Boato de Pesquisa do Contrato
   if wEmPesquisa = True Then
      sbtnInserir.Enabled:=False;
end;

//----------------------------------------------------------
// Altera o Combo
procedure TFrmCadOperAcao.DbLkcBolsaChange(Sender: TObject);
begin
  inherited;
// Apaga a Descricao da Acao
  If (QryAcaoBolsa.Active) And (DbLkcAcao.LookupValue <> '') And
     (DbLkcBolsa.LookupValue <> '') Then Begin
    If Not FazQuery(QryAux,'SELECT IDBOLSAVALORES, IDACAO FROM ACOESXBOLSA WHERE '+
                           ' IDBOLSAVALORES = '+DbLkcBolsa.LookupValue+' AND '+
                           ' IDACAO         = '+DbLkcAcao.LookupValue) Then begin
      MsgDlg('Este Papel não esta sendo Negociado nesta Bolsa .','Mensagem do Sistema',
             MtError,[MbOk],0);
      DbLkcAcao.Text := '';
    End Else Begin
    End;
  End;
// Preenche o Custodiante Default
  If (QryPrincipal.State In [DsEdit, DsInsert]) And (Trim(DbLkcBolsa.Text) <> '') Then
    QryPrincipal.FieldByName('IDCUSTODIANTE').AsString    :=
      QryBolsaValores.FieldByName('IDCUSTODIANTE').AsString;

end;

//-----------------------------------------------------------------
// Apos Scroll na Query SubTipo
procedure TFrmCadOperAcao.QrySubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Preenche dados do SubTipo
  DbLkcBolsa.Value:=
    QrySubTipo.FieldByName('IDBOLSAVALORES').AsString;
  DbLkcBuscaCust.Value    :=
    QryBolsaValores.FieldByName('IDCUSTODIANTE').AsString;
  DbLkcAcao.Value:=
    QrySubTipo.FieldByName('IDACAO').AsString;
end;

//---------------------------------------------------------
// Botao Excluir
procedure TFrmCadOperAcao.sbtnApagarClick(Sender: TObject);
Var
  wExercicio, wPeriodo, wIdEmpresa, wOldIdPrincipal :Integer;
  wMensContab:String;
  QryLocal, QryLocal1  :TwwQuery;
begin
   QryLocal              := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';
   QryLocal1             := TwwQuery.Create(Application);
   QryLocal1.DatabaseName := 'BaseDados';

//  Volta Botao
  SbtnApagar.Down := False;
  If (QryPrincipal.IsEmpty) Then Begin
    MsgDlg('Não existem registros para serem excluidos .',
           'Exclusão', mtError, [MbOk],0);
    Exit;
  End;

// Inicia Transação
  if not(dtmBaseDados.dbBaseDados.InTransaction) then
     DtmBaseDados.dbBaseDados.StartTransaction;
// Volta o flag para o anterior
  If wFLGORDMOVINV = 'A' Then Begin
// Muda status e pode operacao pode ser gravada
     wSql := '';
     wSql :=
       'UPDATE ORDMOVINV  '+
       'SET STATMOVINV  = ''A'' '+
       'WHERE IDORDMOVINV       = '''+DbLkcOrdMovInv.LookupValue +'''      AND '+
       '      IDCARTEIRAINVEST  = '''+DblkcCarteira.LookupValue +'''  AND '+
       '      IDINVESTIMENTO    = '''+DbLkcAcao.LookupValue +'''    AND '+
       '      IDTIPOOPERACAO    = '''+DbLkcTipoOperacao.LookupValue +'''';
       If QryPrincipal.FieldByName('IDLOTE').AsString <> '' Then
         wSql := wSql + ' AND  IDLOTE            = '''+QryPrincipal.FieldByName('IDLOTE').AsString+'''';
       ExecutarQuery(QryAux, wSql);
  End;

  If wFLGORDMOVINV = 'T' Then Begin
     // muda status e pode operacao pode ser gravada
       ExecutarQuery(QryAux,
       'UPDATE ORDMOVINV  '+
       'SET STATMOVINV  = ''P'' '+
       'WHERE IDORDMOVINV       = '''+DbLkcOrdMovInv.LookupValue +'''  AND '+
       '      IDCARTEIRAINVEST  = '''+DblkcCarteira.LookupValue +'''   AND '+
       '      IDINVESTIMENTO    = '''+DbLkcAcao.LookupValue +'''   AND '+
       '      IDTIPOOPERACAO    = '''+DbLkcTipoOperacao.LookupValue +'''AND '+
       '      IDLOTE            = '''+wIdLote+'''');

  End;

// Comitta Transação
  DtmBaseDados.dbBaseDados.Commit;

// Testa se Periodo Contabil esta Fechado
  wIdEmpresa:=Sistema.IdEmpresa;
//  If TestaPeriodo(True, 'BASEDADOS', DBDateEdit1.Text, IntToStr(Sistema.IdModulo),
//       wExercicio, wPeriodo, wIdEmpresa, wMensContab) <> 0 Then Begin
//    MsgDlg('Atenção:'+#13+'O Periodo Contábil nesta data esta Fechado. ',
//           'Mensagem do Sistema', MtError, [MbOk], 0);
//    sbtnApagar.Down:=False;
//    Exit;
//  End;

// Pede Confirmacao
  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then Begin

     If Not VerificaFechamentoOperacao(DBDateEdit1.Text) Then
        Exit;

    // Guarda Dados desta Operacao
   // Preenche dados Automaticos
     wIdAcao          :=QrySubTipo.FieldByName('IDACAO').AsInteger;
     wIdBolsavalores  :=QrySubTipo.FieldByName('IDBOLSAVALORES').AsInteger;
     wIdCorretValores :=QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
     wIdTipoOperacao  :=QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger;
     wIdCarteiraInvest:=QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger;
     wNumDocumento    :=QryPrincipal.FieldByName('NUMDOCUMENTO').AsString;
     wQtdOperacao     :=QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;
     wVlrOperacao     :=QryPrincipal.FieldByName('VLROPERACAO').AsFloat;
     wPrecoLote       :=QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat;
     wDtOperacao      :=QryPrincipal.FieldByName('DATAOPERACAO').AsFloat;
     wIdLote          :=QryPrincipal.FieldByName('IDLOTE').AsString;
     wIdCustodiante   := QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger;
     wIdCustOrig      := QryPrincipal.FieldByName('IDCUSTORIG').AsInteger;
     wIdCustDest      := QryPrincipal.FieldByName('IDCUSTDEST').AsInteger;

     Try
        if not(dtmBaseDados.dbBaseDados.InTransaction) then
           DtmBaseDados.dbBaseDados.StartTransaction;

        // Deleta Filhotes
        If Not OperComum.EstornaOper(wNumDocumento,
                QryPrincipal.FieldByName('IDTIPOINVEST').AsInteger,
                QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger,
                QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                wQtdCotaini, 'X', true) Then
        Begin
            MsgDlg('Não é possível fazer a Exclusão dessa Boleta.',
                   'Mensagem do Sistema', MtError,[MbOk],0);
            Abort;
        End;

        DtmBaseDados.dbBaseDados.Commit;

     Except
       // Rollbacka Transação
        DtmBaseDados.dbBaseDados.Rollback;
     End;
     // Acerta Pagina
     PageControl1.ActivePage := TS1;
     // Fecha e Abre as Querys
     QryPrincipal.Close;
     QrySubTipo.Close;
     QryDespesasOperacao.Close;
     QryPrincipal.Open;
     QrySubTipo.Open;
  End;
// Heranca
//  inherited;
  SbtnApagar.Down := False;
// Esconde Navigator
  DbNav.Visible := False;
end;

//-------------------------------------------------------------------
// Antes de Mover o Ponteiro da tabela Principal
procedure TFrmCadOperAcao.QryPrincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Abre Query com os SubTipos
  If Not QryPrincipal.IsEmpty Then Begin
// Operacao
    FazQuery(QrySubTipo,
      'SELECT IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, '+
      '  IDEMISSOR, DATAULTOPERACAO, NOVODIREITO, NUMCLIENTECORRET '+
      '  FROM CM.OPRACAO '+
      '  WHERE IDOPERACAOINVEST = '''+
      QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+'''');
// Mostra ou Nao o Lote da Operacao
    If (QryPrincipal.State In [DsBrowse]) Then
      If (QryPrincipal.FieldByName('IDLOTE').AsString = '')  Then
        PnlLote.Caption := '-'
      Else
        PnlLote.Caption := QryPrincipal.FieldByName('IDLOTE').AsString;

  End;
end;

//----------------------------------------------------------
// Botao Alterar
procedure TFrmCadOperAcao.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Altera SubTipo
  QrySubTipo.Edit;
// Bloqueia Combos
  DbLkcBolsa.Enabled          := False;
  DbLkcAcao.Enabled           := False;
  DbLkcTipoOperacao.Enabled   := False;
  DbLkcBuscaCorretor.Enabled  := False;
  DbLkcCarteira.Enabled       := False;
  DbLkcCarteiraDestOri.Enabled:= False;
//  DbLkcOrdMovInv.Enabled      := False;
  DbDateEdit1.Enabled         := False;
  DbDateEdit4.Enabled         := False;
  DBEdit3.Enabled             := False;
  DBEdit4.Enabled             := False;
  DBEdit5.Enabled             := False;
  BtDetalhes.Enabled          := False;
  BtFechamento.Enabled        := False;
// Guarda Id do Principal
  wOldIdPrincipal := QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger ;
End;

procedure TFrmCadOperAcao.AcertaBotoes(wOperacao:String);
begin
  If wOperacao = 'I' Then Begin
    sbtnInserir.Down  := True;
    sbtnAlterar.Down  := False;
    sbtnApagar.Down   := False;
    sbtnProcurar.Down := False;
    BtDetalhes.Down   := False;
    BtFechamento.Down := False;
// Enableds
    sbtnInserir.Enabled  := False;
    sbtnAlterar.Enabled  := False;
    sbtnApagar.Enabled   := False;
    sbtnProcurar.Enabled := False;
    BtDetalhes.Enabled   := False;
    BtFechamento.Enabled := False;
// Botoes de Baixo
    bbtnConfirmar.Visible := True;
    bbtnCancelar.Visible  := True;
    dbNav.visible         := False;
  End Else If wOperacao = 'A' Then Begin
    sbtnInserir.Down  := False;
    sbtnAlterar.Down  := False;
    sbtnApagar.Down   := False;
    sbtnProcurar.Down := False;
    BtDetalhes.Down   := False;
    BtFechamento.Down := False;

// Enableds
    sbtnInserir.Enabled  := True;
    sbtnAlterar.Enabled  := True;
    sbtnApagar.Enabled   := True;
    sbtnProcurar.Enabled := True;
    BtDetalhes.Enabled   := True;
    BtFechamento.Enabled := True;
// Botoes de Baixo
    bbtnConfirmar.Visible := False;
    bbtnCancelar.Visible  := False;
    dbNav.visible         := False;
  End;

end;


procedure TFrmCadOperAcao.sbtnProcurarClick(Sender: TObject);
begin
//  inherited;
 MontaSelect.Executar;
	If (MontaSelect.ValoresChave.Count > 0) And
    (MontaSelect.ValoresChave[0] <> '') Then	Begin
   	QryPrincipal.Locate('IDOPERACAOINVEST',MontaSelect.ValoresChave[0],[]);
  End;
// Ana - 08/03/2000
//  AtualizaOrdem;
// Acerta Botao
  sbtnProcurar.Down := False;
// Acerta Pagina
  PageControl1.ActivePage := TS1;
end;

//-------------------------------------------------------
// Mudanca na DbEdit3, Calcula Valor da Operacao
procedure TFrmCadOperAcao.PageControl1Change(Sender: TObject);
Var
  wSQL:String;
  wDecimal:Char;
  wSaldoAntVlr, wSaldoAntQtd, wVlrTotCorretor, wVlrTotBolsa, wSaldoInutil:Double;
  QryLocalAux:TwwQuery;
begin
   inherited;
   // Exije cadastro do Investimento.
   If (QryPrincipal.State In [DsEdit, DsInsert]) And (DbLkcAcao.Text = '') Then
   Begin
      MsgDlg('A Ação desta Operação não foi preenchida..',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      PageControl1.ActivePage := TS1;
      DbLkcAcao.SetFocus;
      Exit;
   End;

   // Caso Pagina Ativa = Carteria e a Operacao Nao movimente a carteria
   // não permite edicao .
   If (PageControl1.ActivePage = TS2) And
      (QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'N') And
      (QryPrincipal.State In ([DsEdit, DsInsert])) Then
   Begin
      MsgDlg('Tipo de Operação escolhida não movimenta carteria ..',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      PageControl1.ActivePage := TS1;
      Exit;
   End;

   // Caso Pagina Ativa = Despesas Exije cadastro do Corretor.
   If (PageControl1.ActivePage = TS4) Or (PageControl1.ActivePage = TS5) Then
   Begin
      If (QryPrincipal.State In [DsEdit, DsInsert]) And (DbLkcBuscaCorretor.Text = '') And
         (QryBuscaOperacao.FieldByName('FLGCORRET').AsString = 'S') Then
      Begin
         MsgDlg('A Corretora desta Operação não foi preenchida..',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         PageControl1.ActivePage := TS1;
         Exit;
      End;
   End;

   // Cria Objetos Locais
   QryLocalAux:= TwwQuery.Create(Self);
   QryLocalAux.DatabaseName:='BaseDados';
   Label10.Caption  :='Aguarde Processando ...';

   //---------------------------------------------\\
   // Monta Dados para a Regra \\
   If ((PageControl1.ActivePage = TS4) Or (PageControl1.ActivePage = TS5)) And
      (QryPrincipal.State In ([DsEdit, DsInsert])) Then
   Begin
      // Busca Dado dos Saldos do Investimento
      wSaldoAntVlr :=0;
      wSaldoAntQtd :=0;

      //------------------------------------------------------------------------------
      OperComum.BuscaTodosSaldosInvestLote(
                          QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                          0{IDCARTEIRAGERENC},
                          QrySubTipo.FieldByName('IDACAO').AsInteger, 9999999,-1,
                          wIdLote, DateToStr(QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime),
                          wSaldoAntQtd, wSaldoAntVlr, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                          wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                          wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,wSaldoInutil);

      //------------------------------------------------------------------------------

      // Monta Campos Virtuais
      wSQL:= ''''+
           QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+'''  AS IDOPERACAOINVEST, '''+
           '2'' AS  IDTIPOINVEST, '''+
           QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsString+'''  AS IDCARTEIRAINVEST, '''+
           QryBuscaCarteira.FieldByName('FLGCARTPROP').AsString+'''       AS FLGCARTPROP,      '''+
           QryPrincipal.FieldByName('IDTIPOOPERACAO').AsString+'''    AS IDTIPOOPERACAO,   '''+
           QryPrincipal.FieldByName('DATAOPERACAO').AsString+'''      AS DATAOPERACAO,     '''+
           QryPrincipal.FieldByName('DATAVENCOPER').AsString+'''      AS DATAVENCOPER,     '''+
           QryPrincipal.FieldByName('NUMDOCUMENTO').AsString+'''      AS NUMDOCUMENTO,     '''+
           QryPrincipal.FieldByName('IDCORRETVALORES').AsString+'''   AS IDCORRETVALORES,  '''+
           TrocaVirgulaPonto(QryPrincipal.FieldByName('QTDEOPERACAO').AsString)+'''      AS QTDEOPERACAO,      '''+
           TrocaVirgulaPonto(QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsString)+''' AS PRECOUNITOPERACAO, '''+
           TrocaVirgulaPonto(QryPrincipal.FieldByName('VLROPERACAO').AsString)+'''       AS VLROPERACAO,       '''+
           QryPrincipal.FieldByName('IDCUSTODIANTE').AsString+'''      AS IDCUSTODIANTE,   '''+
           QryPrincipal.FieldByName('IDINSTFIN').AsString+'''          AS IDINSTFIN,       '''+
           QrySubTipo.FieldByName('IDACAO').AsString+'''               AS IDACAO, '''+
           QrySubTipo.FieldByName('IDACAO').AsString+'''               AS IDINVESTIMENTO, '''+
           QrySubTipo.FieldByName('IDBOLSAVALORES').AsString+'''       AS IDBOLSAVALORES,  '''+
           QryBolsaValores.FieldByName('SGLBOLSAVALORES').AsString+''' AS SGLBOLSAVALORES,  '''+
           QrySubTipo.FieldByName('IDEMISSOR').AsString+'''            AS IDEMISSOR,       '''+
           QryAcaoBolsa.FieldByName('MOECODIGO').AsString+'''          AS MOECODIGO,       '''+
           QryAcaoBolsa.FieldByName('QTDELOTE').AsString+'''           AS QTDELOTE         ';
   End;
   //-------------------------------------------
   // Processamento da Pagina 5 (Impostos)
   If PageControl1.ActivePage = TS5 Then
   Begin
      //----------------------------------------------------
      // Processamento da Pagina 2 (Carteira)
   End
   Else
   If PageControl1.ActivePage = TS2 Then
   Begin
      If DbLkcCarteira.Enabled = True Then
         DbLkcCarteira.SetFocus;

      //----------------------------------------------------
      // Processamento da Pagina 4 (Despesas)
   End
   Else If PageControl1.ActivePage = TS4 Then
   Begin
      // Mostra Grid da Pagina de Despesas
      PnlDespesas.Visible := False;
      GridDespesas.Visible:= True;
      If DbLkcTipoOperacao.Text = '' Then
      Begin
         MsgDlg('Operação Não foi Escolhida .....','Mensagem do Sistema', MtWarning,[MbOk],0);
         PageControl1.ActivePage:=TS1;
         Exit;
      End;
      TS4.Repaint;
      // Abre Tabela Pessoa
//    QryBuscaCredor.Open;
      // Verifica se Existem Dados
      FazQuery(QryAux,'SELECT IDOPERACAOINVEST FROM CM.DESPOPERINVEST WHERE (IDOPERACAOINVEST = '''+
               QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+''')');
      // Caso Já Existam Dados Não Transfere
      If (QryAux.IsEmpty) And (SbtnInserir.Down) Then
      Begin
         // Liga Animate
         Animate2.Visible := True;
         Animate2.Active  := True;
         // Busca Dados
         FazQuery(QryAux,
                  'SELECT DT.IDTIPOINVEST,    DT.IDTIPOOPERACAO,  DT.IDTIPODESPINVEST, '+
                  '       DT.IDREGRACALCDESP, DT.IDREGRADATAVENC, DT.FLGCALCDIARIO,'+
                  '       TI.TIPCREDOR,       FXD.EMPRESAPROP,    FXD.IDFORCLI, '+
                  '       TI.DESCTIPODESPINV                                    '+
                  'FROM CM.DESPESASXTIPOOPER DT, CM.TIPODESPINVEST TI, CM.FORCLIXDESPINVEST FXD '+
                  'WHERE (DT.IDTIPOOPERACAO =  '''+
                    QryPrincipal.FieldByName('IDTIPOOPERACAO').AsString  +''') AND '+
                  '      (DT.IDTIPODESPINVEST >= 0)  AND '+
                  '      (DT.IDTIPODESPINVEST <> 4)  AND '+
                  '      (DT.IDTIPODESPINVEST= TI.IDTIPODESPINVEST)  AND '+
                  '      (TI.IDTIPODESPINVEST= FXD.IDTIPODESPINVEST(+)) AND'+
                  '      (FXD.EMPRESAPROP(+)    = '''+IntToStr(Sistema.IdEmpresa)+''')');
         // Abre Qry de Despesas
         QryDespesasOperacao.Open;
         // Transfere Dados das Despesas Calculando Valores
         While Not QryAux.EOF Do
         Begin
            // Calcula o Valor Total das Negociacoes na Bolsa do Rio
            wVlrTotBolsa:=0;
            FazQuery(QryLocalAux,
                     ' SELECT  SUM(OI.VLROPERACAO)     '+
                     ' FROM OPERACAOINVEST OI, OPRACAO OA, BOLSAVALORES BV          '+
                     ' WHERE 	(OI.IDCORRETVALORES  = ''' +
                     QryPrincipal.FieldByName('IDCORRETVALORES').AsString+''') AND  '+
                     '         (OI.DATAOPERACAO     = TO_DATE('''+DateToStr(
                     QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime)+''',''DD/MM/YYYY'')) AND '+
                     '         (BV.SGLBOLSAVALORES  = ''BVRJ'')            AND'+
                     '         (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST) AND'+
                     '         (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)       ');

            // Guarda Valor Total negociado na Bolsa (RJ) + o Valor da Operacao
            wVlrTotBolsa:=(QryLocalAux.FieldByName('SUM(OI.VLROPERACAO)').AsFloat+
                           QryPrincipal.FieldByName('VLROPERACAO').AsFloat);

            // Calcula o Valor Total das Operacoes do Corretor desta Despesa
            wVlrTotCorretor:=0;
            FazQuery(QryLocalAux,
                     ' SELECT  SUM(OI.VLROPERACAO)                     '+
                     ' FROM DESPOPERINVEST DI, OPERACAOINVEST OI       '+
                     ' WHERE 	(OI.IDCORRETVALORES  = ''            '+
                       QryPrincipal.FieldByName('IDCORRETVALORES').AsString+''') AND  '+
                     '         (DI.IDTIPODESPINVEST = ''               '+
                       QryAux.FieldByName('IDTIPODESPINVEST').AsString+''') AND '+
                     '         (OI.DATAOPERACAO     = TO_DATE('''+DateToStr(
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime)+''',''DD/MM/YYYY'')) AND '+
                     '       	(DI.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) ');

            // Guarda Valor Total do Corretor
            wVlrTotCorretor:=(QryLocalAux.FieldByName('SUM(OI.VLROPERACAO)').AsFloat+
                              QryPrincipal.FieldByName('VLROPERACAO').AsFloat);

            // Finaliza montagem SQL da Regra
            // Abre Query da Regra
            wDecimal := DecimalSeparator;
            DecimalSeparator:='.';
            FazQuery(QryRegra,
                     'SELECT '+FloatToStr(wVlrTotCorretor) +' AS VALTOTCORRET,'+
                               FloatToStr(wVlrTotBolsa)    +' AS VALTOTBOLSA,'+
                               FloatToStr(wSaldoAntVlr)    +' AS SLDANTVLRINV, '+
                               FloatToStr(wSaldoAntQtd)    +' AS SLDANTQTDINV, '+
                               wSQL+' FROM DUAL');
            DecimalSeparator:=wDecimal;
            // Inclui Registro
            QryDespesasOperacao.Insert;
            QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger := LeUltRegistro(Nil,'DESPOPERINVEST');
            // Caso Exista Regra Associada Executa
   //        If (QryAux.FieldByName('IDREGRACALCDESP').AsString <> '') And
   //           (QryAux.FieldByName('FLGCALCDIARIO').AsInteger = 0) Then Begin
            If (QryAux.FieldByName('IDREGRACALCDESP').AsString <> '') Then
            Begin
               // Executa a Regra de Caclulo do Valor Despesas
   //            Regra.DatabaseName:='BaseDados';
               Regra.RuleName := QryAux.FieldByName('IDREGRACALCDESP').AsString;
               Regra.QueryIn  := QryRegra;
               Try
   //            Regra.PassoaPasso;
                  Regra.Execute;
               Except
                  On E:Exception Do
                  Begin
                     MsgDlg('Erro ao calcular a Rubrica, "'+
                            QryAux.FieldByName('DESCTIPODESPINV').AsString+
                            '", Regra: '+QryAux.FieldByName('IDREGRACALCDESP').AsString+
                            ' com a mensagem:'+#13+#13+E.Message,
                            'Mensagem do Sistema', MtError,[MbOk],0);
                     BbtnCancelar.Click;
                     // Como ocorreu erro
                     bbtnConfirmar.Enabled:=False;
                     Exit;
                  End;
               End;
               // Preenche dados
               QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat := StrToFloat(TrocaPontoVirgula(Regra.Result));
            End;
            // Data de Vencimento da Despesa = Data de Vencimento da Operacao
            QryDespesasOperacao.FieldByName('DATAVENCDESPOPER').AsDateTime := StrToDate(DBDateEdit4.Text);
            QryDespesasOperacao.FieldByName('DATAOPERACAO').AsDateTime     := StrToDate(DBDateEdit1.Text);
            // Caso Exista Regra Associada Executa
   //         If (QryAux.FieldByName('IDREGRADATAVENC').AsString <> '') And
   //            (QryAux.FieldByName('FLGCALCDIARIO').AsInteger = 0) Then Begin
            If (QryAux.FieldByName('IDREGRADATAVENC').AsString <> '') Then
            Begin
               // Executa a Regra de Caclulo do Valor Despesas
   //          Regra.DatabaseName:='BaseDados';
               Regra.RuleName := QryAux.FieldByName('IDREGRADATAVENC').AsString;
               Regra.QueryIn  := QryRegra;
               // Tenta Executar a Regra
               Try
                  Regra.Execute;
               Except
                  On E:Exception Do Begin
                     MsgDlg('Erro ao calcular a despesa, "'+
                            QryAux.FieldByName('DESCTIPODESPINV').AsString+
                            '", Regra: '+QryAux.FieldByName('IDREGRADATAVENC').AsString+
                            ' com a mensagem:'+#13+#13+E.Message,
                            'Mensagem do Sistema', MtError,[MbOk],0);
                     BbtnCancelar.Click;
                     Exit;
                  End;
               End;
               // Preenche dados
               QryDespesasOperacao.FieldByName('DATAVENCDESPOPER').AsDateTime := StrToDate(Regra.Result);
            End;
            // Continua a Inclusao dos Registros
            QryDespesasOperacao.FieldByName('IDOPERACAOINVEST').AsInteger := QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger;
            QryDespesasOperacao.FieldByName('IDTIPOINVEST').AsInteger     := 2;
            QryDespesasOperacao.FieldByName('IDTIPOOPERACAO').AsInteger   := QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger;
            QryDespesasOperacao.FieldByName('IDTIPODESPINVEST').AsInteger := QryAux.FieldByName('IDTIPODESPINVEST').AsInteger;
            QryDespesasOperacao.FieldByName('IDREGRACALCUSADA').AsString  := QryAux.FieldByName('IDREGRACALCDESP').AsString;
            QryDespesasOperacao.FieldByName('IDREGRAVENCUSADA').AsString  := QryAux.FieldByName('IDREGRADATAVENC').AsString;
            QryDespesasOperacao.FieldByName('FLGCALCDIARIO').AsInteger    := QryAux.FieldByName('FLGCALCDIARIO').AsInteger;
            // Busca Credor da Despesa caso Tipo de Credor
            If QryAux.FieldByName('TIPCREDOR').AsString <> '' Then
            Begin
               // Atualiza Empresa Propria
               QryDespesasOperacao.FieldByName('EMPRESAPROP').AsInteger := Sistema.IdEmpresa;
               // Atualiza de acordo Emissor/Corretor
               If QryAux.FieldByName('TIPCREDOR').AsString = 'CO'Then
               Begin
                  // Transforma Corretor em Fornecedor
                  Try
                     Documento.ForCli.Inserir(QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger,
                                              Sistema.IdEmpresa,
                                              -1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                              '','','','','F',False);
                  Except

                  End;
                  QryDespesasOperacao.FieldByName('IDFORCLI').AsInteger := QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
               End
               Else
               Begin
                  // Transforma Emissor em Fornecedor
                  Try
                     Documento.ForCli.Inserir(QryAcaoBolsa.FieldByName('IDEMISSOR').AsInteger,
                                              Sistema.IdEmpresa,
                                              -1,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                              '','','','','F',False);
                  Except

                  End;
                  QryDespesasOperacao.FieldByName('IDFORCLI').AsInteger := QryAcaoBolsa.FieldByName('IDEMISSOR').AsInteger;
               End;
            // Caso Credor
            End
            Else
            Begin
              QryDespesasOperacao.FieldByName('EMPRESAPROP').AsInteger :=
                Sistema.IdEmpresa;
              QryDespesasOperacao.FieldByName('IDFORCLI').AsString :=
                QryAux.FieldByName('IDFORCLI').AsString;
            End;
            // Posta Despesas
            Try
              QryDespesasOperacao.Post;
            Except
              Raise;
              MsgDlg('Erro ao Transferir Rubricas .....','Mensagem do Sistema',
                     MtWarning,[MbOk],0);
              Exit;
            End;
            // Proximo Registro
            QryAux.Next;
         End;

         // Inabilita Lkc de Tipo de Operacao e Corretor
         If Ds.State In ([DsInsert,DsEdit]) Then
         Begin
            DbLkcTipoOperacao.Enabled := False;
            DbLkcBuscaCorretor.Enabled:= False;
            DBEdit3.Enabled           := False;
            DBEdit4.Enabled           := False;
            DBEdit5.Enabled           := False;
            // ReAbre Tabela Pessoa
//            QryBuscaCredor.Close;
//            QryBuscaCredor.Open;
         End;
      End
      Else
      Begin
         // Inabilita Lkc de Tipo de Operacao e Corretor
         If Ds.State In ([DsInsert,DsEdit]) Then
         Begin
            DbLkcTipoOperacao.Enabled := False;
            DbLkcBuscaCorretor.Enabled:= False;
            DBEdit3.Enabled           := False;
            DBEdit4.Enabled           := False;
            DBEdit5.Enabled           := False;
            // ReAbre Tabela Pessoa
//            QryBuscaCredor.Close;
//            QryBuscaCredor.Open;
         End;
      End;
      // Abre a Query de Despesas
      QryDespesasOperacao.Close;
      QryDespesasOperacao.ParamByName('IDOPERACAOINVEST').AsInteger := QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryDespesasOperacao.Open;
      // Desliga Animate
      Animate2.Visible := False;
      Animate2.Active  := False;
      Label10.Caption  :='Rubricas da Operação';
   End;
   // Fecha a Query da Regra
   QryRegra.Close;
   QryLocalAux.Free;
end;

//---------------------------------------------------------
// Alterar Detalhe do Imposto
procedure TFrmCadOperAcao.sbtnAltDetClick(Sender: TObject);
begin
   // Caso não editando sai
   If Ds.State In ([dsBrowse]) Then
      Exit;
   // Caso Tabela Vazia Sai
   If QryImpostosOperacao.IsEmpty Then
      Exit;
   // Heranca
   Inherited;
   // Mostra Painel
   GridImpostos.Visible:= False;
   PnlImpostos.Visible := True;
   // Acerta Texto do Painel
   Panel1.Caption:=' '+QryImpostosOperacao.FieldByName('DESCIMPOSTO').AsString;
   // Edita Detahe Impostos
   QryImpostosOperacao.Edit;
   // Seta Focus
   DbEdit6.SetFocus;
   // Variavel Recebe o Valor Original do Campo
   wValorRegra:=QryImpostosOperacao.FieldByName('VLRIMPOSTOOPER').AsFloat;
end;

//----------------------------------------------------------
// Cancela Detalhe do Imposto
procedure TFrmCadOperAcao.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Mostra Grid
  PnlImpostos.Visible := False;
  GridImpostos.Visible:= True;
// Cancela Alteracoes
  QryImpostosOperacao.Cancel;
end;

//----------------------------------------------------------
// Confirma Detalhe do Imposto
procedure TFrmCadOperAcao.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
// Mostra Grid
  PnlImpostos.Visible := False;
  GridImpostos.Visible:= True;
// Cancela Alteracoes
  QryImpostosOperacao.Post;
end;

//----------------------------------------------------------
// Alterar Detalhe Despesa
procedure TFrmCadOperAcao.BtAltDespClick(Sender: TObject);
begin
  inherited;
{
// Caso não edtando sai
  If Ds.State In ([dsBrowse]) Then Begin
    Exit;
  End;
// Caso Tabela Vazia Sai
  If QryDespesasOperacao.IsEmpty Then Begin
    Exit;
  End;
// Caso Despesa seja de Calculo Diario, Nao Altera
  If QryDespesasOperacao.FieldByName('FLGCALCDIARIO').AsString = '1' Then Begin
    MsgDlg('Despesa de cálculo no fechamento diário.','Mensagem do Sistema',
           MtError,[MbOk],0);
    Exit;
  End;

// Mostra Painel
  GridDespesas.Visible := False;
  PnlDespesas.Visible  := True;
// Heranca
  inherited;
// Acerta Texto do Painel
  Panel2.Caption:=' '+QryDespesasOperacao.FieldByName('DESCDESP').AsString;
// Edita Detahe Despesas
  QryDespesasOperacao.Edit;
// Seta Focus
  DBEdit7.SetFocus;
// Variavel Recebe o Valor Original do Campo
  wValorRegra:=QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat;
// Inabilita Botoes de Baixo
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  bbtnSair.Enabled      := False;
  }
end;

//----------------------------------------------------------
// Confirma Detalhe de Despesa
procedure TFrmCadOperAcao.BtOkDetDespClick(Sender: TObject);
begin
  inherited;
// Critica Dados
  If (DbLckCredor.Text  = '') Then Begin
    MsgDlg('Faltam Preencher Campos .....','Mensagem do Sistema',
           MtWarning,[MbOk],0);
    DbLckCredor.SetFocus;
    Exit;
   End;
// Mostra Grid
  PnlDespesas.Visible := False;
  GridDespesas.Visible:= True;
// Habilita Botoes de Baixo
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
  bbtnSair.Enabled      := True;
// Cancela Alteracoes
  QryDespesasOperacao.Post;
end;

//----------------------------------------------------------
// Cancela Detalhe de Despesa
procedure TFrmCadOperAcao.BtCancDetDespClick(Sender: TObject);
begin
  inherited;
// Mostra Grid
  PnlDespesas.Visible := False;
  GridDespesas.Visible:= True;
// Habilita Botoes de Baixo
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
  bbtnSair.Enabled      := True;
// Cancela Alteracoes
  QryDespesasOperacao.Cancel;
end;

//------------------------------------------------------------------------
// Precionar Tecla no Valor do Imposto ou Despesa
procedure TFrmCadOperAcao.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ',';
end;

//------------------------------------------------------------------------
// Quando Mudar no Campo de Qtd por Lote de Acao ..
procedure TFrmCadOperAcao.DBEdit20Change(Sender: TObject);
begin
  inherited;
  If DbLkcAcao.Text = '' Then Begin
    DbEdit2.Text := '';
  End;
end;

procedure TFrmCadOperAcao.DBEdit7Exit(Sender: TObject);
begin
  inherited;
// Caso Inserindo
//  If (sbtnInserir.Down) And (sbtnInserir.Down) Then Begin
// Testa se o Valor Informado é Valido caso exista Regra
    If QryDespesasOperacao.FieldByName('IDREGRACALCUSADA').AsString <> '' Then Begin
      If Not TestaValor((wValorRegra-
             QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat))
        Then Begin
        MsgDlg('Valor Informado menor que o permitido','Mensagem do Sistema',
               MtWarning,[MbOk],0);
        QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat:=wValorRegra;
        DbEdit7.SetFocus;
      End;
    End;
//  End;
end;

procedure TFrmCadOperAcao.DBEdit6Exit(Sender: TObject);
begin
  inherited;
// Caso Inserindo
  If sbtnInserir.Down Then Begin
// Testa se o Valor Informado é Valido caso exista Regra
    If QryImpostosOperacao.FieldByName('IDREGRACALCUSADA').AsString <> '' Then Begin
      If Not TestaValor((wValorRegra-
             QryImpostosOperacao.FieldByName('VLRIMPOSTOOPER').AsFloat))
        Then Begin
        MsgDlg('Valor Informado menor que o permitido','Mensagem do Sistema',
               MtWarning,[MbOk],0);
        QryImpostosOperacao.FieldByName('VLRIMPOSTOOPER').AsFloat:=wValorRegra;
        DbEdit6.SetFocus;
      End;
    End;
  End;
end;

procedure TFrmCadOperAcao.DbLkcTipoOperacaoChange(Sender: TObject);
Var
  RecSaldos : TRecSaldos;
begin
  inherited;
  If (DbLkcTipoOperacao.Text <> '') And (QryPrincipal.State In [DsEdit, DsInsert]) Then
    QryPrincipal.FieldByName('DATAVENCOPER').AsDateTime :=
      CalculaVencimento(StrToDate(DBDateEdit1.Text),
      QryBuscaOperacao.FieldByName('VENCIMENTO').AsInteger);

// Mostra ou Esconde a Carteira de Origem caso Faça Transferencia
  If (QryBuscaOperacao.FieldByName('FLGTRANSF').AsString <> 'N') Then Begin
    DbLkcCarteiraDestOri.Visible:=True;
    Label21.Visible:=True;

    If (Ds.DataSet.State In [DsInsert,DsEdit]) Then
// Caso tenha Carteira de Origem/Destino cadastrado Preenche
      If wIdCartOriDest <> 0 Then
        QryPrincipal.FieldByName('IDCARTORIDEST').AsInteger:=wIdCartOriDest;

    If (QryBuscaOperacao.FieldByName('FLGTRANSF').AsString = 'A') Then
      Label21.Caption:='Carteira de Origem'
    Else
      Label21.Caption:='Carteira de Destino';

    GrBxTransfCust.Visible := True;

  End Else Begin
    DbLkcCarteiraDestOri.Visible:= False;
    GrBxTransfCust.Visible      := False;
    GrBxTransf.Visible:= False;
    Label21.Visible   := False;
  End;
// Busca Ordens de Movimentacao (Caso Haja)
  BuscaOrdemMovimentacao;

// Caso o Tipo da Operacao seja Diferente de de Compra (A) Busca o Saldo Final deste Investimento e
// Apresenta como default
    If (QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString <> 'A') And
       (QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString <> '') Then Begin
// Busca Saldos desse Investimento/Lote
      RecSaldos := OperacaoInvest.BuscaSaldosLote(wIdAcao, wIdLote, wDtOperacao);
// Caso Tenha Saldos, Preenche os Campos ....
      If RecSaldos.DataSaldo <> 0 Then Begin
        wQtdOperacao := RecSaldos.SldQtdInvCart;
        wVlrOperacao := RecSaldos.SldVlrInvCart;
      End;
    End;
end;

//-----------------------------------------------------------------------------
// Calcula Data de Vencimento, com numero de dias "Uteis" da Inical
Function TFrmCadOperAcao.CalculaVencimento(DataInicial:TDateTime;
                                            DiasUteis:Integer):TDateTime;
Var
  wSoma,I:Integer;
  wDataLocal:TDateTime;
begin
  Result:= DataInicial;
  wDataLocal:=DataInicial;

// Soma os Dias
  For I:= 1 To DiasUteis Do Begin
    wDataLocal:= wDataLocal+1;
// Caso Sabado Soma 1 dia
    If DayOfWeek(wDataLocal) = 7 Then Begin
      wDataLocal:= wDataLocal+1;
    End;
// Caso Domingo Soma 1 dia
    If DayOfWeek(wDataLocal) = 1 Then Begin
      wDataLocal:= wDataLocal + 1;
    End;
  End;
// Caso Resultado caia no Sabado
  If DayOfWeek(wDataLocal) In [7] Then Begin
    wDataLocal:= wDataLocal + 1;
  End;
// Caso Resultado caia no Domingo
  If DayOfWeek(wDataLocal) In [1] Then Begin
    wDataLocal:= wDataLocal + 1;
  End;
  Result:=wDataLocal;
end;

procedure TFrmCadOperAcao.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;


procedure TFrmCadOperAcao.BtDetalhesClick(Sender: TObject);
begin
  inherited;
  msOrdem.Executar;
  if msOrdem.RetornouValor then begin
     qryDadosOrdemSel.Close;
     qryDadosOrdemSel.ParamByName('pIDORDMOVINV').AsInteger := StrToInt(msOrdem.ValoresChave[0]);
     qryDadosOrdemSel.ParamByName('pTIPOCONSULTA').AsString := wTipoOrdMov;
     qryDadosOrdemSel.Open;
  end;
  BtDetalhes.Down := False;
end;

//-------------------------------------------------------
// Mudanca na DbEdit5, Calcula o Preco Unitario da Operacao
procedure TFrmCadOperAcao.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ',';
end;

procedure TFrmCadOperAcao.BtCancelaRubricaClick(Sender: TObject);
begin
  inherited;
// Testa se Rubricas já Cadastradas
  If QryDespesasOperacao.IsEmpty Then Begin
    MsgDlg('Não Existem Rubricas a Cancelar ','Mensagem do Sistema ',
           MtWarning,[MbOk],0);
  End Else Begin
// Exclui Rubricas já Cadastradas
    QryDespesasOperacao.First;
    While Not QryDespesasOperacao.Eof Do Begin
      QryDespesasOperacao.Delete;
    End;
  End;
// Reabilita Campos da Tela
  DbLkcTipoOperacao.Enabled := True;
  DbLkcBuscaCorretor.Enabled:= True;
  DBEdit3.Enabled           := True;
  DBEdit4.Enabled           := True;
  DBEdit5.Enabled           := True;
end;

procedure TFrmCadOperAcao.BtFechamentoClick(Sender: TObject);
begin
  inherited;
  If QryPrincipal.FieldByName('NUMDOCUMENTO').AsString <> '' Then Begin
    Application.CreateForm(TFrmFechaBoleta,FrmFechaBoleta);

    FrmFechaBoleta.wDocumento:=QryPrincipal.FieldByName('NUMDOCUMENTO').AsString;
    wIdLote:='';
    FrmFechaBoleta.wIdLote   :=wIdLote;
    FrmFechaBoleta.ShowModal;
    BtFechamento.Down:=False;
    FrmFechaBoleta.Free;
  End Else Begin
    MsgDlg('Documento não Informado', 'Mensagem do Sistema',MtError,[MbOk],0);
    BtFechamento.Down:=False;
  End;
  QryDespesasOperacao.Close;
  QryDespesasOperacao.Open;
end;

procedure TFrmCadOperAcao.DbLkcBolsaExit(Sender: TObject);
begin
  inherited;
// Busca a Acao Desta Bolsa
  If (QryAcaoBolsa.Active) And (DbLkcAcao.LookupValue <> '') And
     (DbLkcBolsa.LookupValue <> '') Then Begin
    QryAcaoBolsa.Locate('IDBOLSAVALORES;IDACAO',
      VarArrayOf([DbLkcBolsa.LookupValue, DbLkcAcao.LookupValue]),[]);
    DbLkcAcao.Value:= QryAcaoBolsa.FieldByName('IDACAO').AsString;
  End;
end;

//------------------------------------------------------------------------------
// Ao sair da Bolsa guarda o Valor
procedure TFrmCadOperAcao.DbLkcBolsaEnter(Sender: TObject);
begin
  inherited;
  wOldBolsaValores := DbLkcBolsa.LookupValue;
end;

//----------------------------------------------------------------------------------------
// Transfere Acoes Antes da Operacao
Function TFrmCadOperAcao.TransfereAntes:Boolean;
Var
  wVlrMovCartInv, wSaldoQtd, wSaldoVlr, wSaldoInutil, wQtdDestino, wValorAContabilizar : Double;
  wIdLoteOrigem, wIdLoteDestino:String;
  wIdInvestDestino, wIdHistCartInv, wIdTipoDespInvest : Integer;
  QryLocalCont, QryLocalCont1 : TwwQuery;
Begin
   // Inicia Variaveis
   // Inicia Variaveis
   QryLocalCont := TwwQuery.Create(Self);
   QryLocalCont.DatabaseName:='BaseDados';
   QryLocalCont1 := TwwQuery.Create(Self);
   QryLocalCont1.DatabaseName:='BaseDados';
//   wPlanilha :=-1;wPlano:=-1;wFatura:=-1;wNoDoc:=-1;wDocumento:=-1;
   Result:=True;
   // Caso a carteira nao trate lotes ignora o Lote
   If QryCarteiraOriDest.FieldByName('FLGTRATALOTE').AsString='N' Then
      wIdLoteOrigem:= ''
   Else
      wIdLoteOrigem:=wIdLote;

   // Busca Saldo do Lote P/ calcular Preco unitario
   wSaldoQtd:=0; wSaldoVlr:=0;
   OperComum.BuscaTodosSaldosInvestLote(QryPrincipal.FieldByName('IDCARTORIDEST').AsInteger,
                                        0{IDCARTEIRAGERENC},
                                        QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 9999999, -1,
                                        wIdLoteOrigem, DateToStr(QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime),
                                        wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                        wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                        wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,wSaldoInutil);
   // Caso não exista saldo na carteira de origem sai fora
   If (wSaldoQtd <= 0) Then
   Begin
      MsgDlg('Não existe quantidade suficiente na carteira de Origem  ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
      Result:=False;
      Exit;
   End;
   // Calcula Valor da Movimentacao
   wVlrMovCartInv:=(QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat*
                   (wSaldoVlr/wSaldoQtd));

   wPlanilha:=-1;
   wPlano   :=-1;
   wDocumento:=-1;

   // Debita Lancamento de Origem
   If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                     QrySubTipo.FieldByName('IDACAO').AsInteger, 2, wIdPrincipal, -1,
                                     QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                     QryPrincipal.FieldByName('IDCARTORIDEST').AsInteger,
                                     0{IDCARTEIRAGERENC},
                                     -1, -1, wPlanilha, wDocumento, wPlano,
                                     QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                                     wVlrMovCartInv,
                                     QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat,
                                     wQtdCotaini, 0 {Variação}, 0 {Juros}, 0, 0, 0, 0, 0, 0, 0,
                                     'D', 'D', wIdLoteOrigem,
                                     'Transferência entre Carteiras','TRF', '', '', True,
                                     -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
   Begin
      Result:=False;
      Exit;
   End;

   // Alimenta os Saldos da Carteira
   OperComum.AtualizaSaldos(wQtdCotaini,-1);

   //Marco Turon - 07/05/2001
   // Atualiza custódia para papeis transferidos antes da operação  - Carteira de Origem
//   if not OperacaoInvest.CadastraCustodia(wIdPrincipal) then
//   begin
//      MsgDlg('Erro ao Atualizar Custodia na Transferência para a Carteira de Origem. ',
//            'Mensagem do Sistema', MtError,[MbOk],0);
//      Result := false;
//      exit;
//   end;

// Contabiliza Baixa Transferência
{
  OperComum.LancaOperRFRV(
                       Sistema.IdEmpresa, 79,
                       QryBuscaOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                       QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                       -6, wIdPrincipal, wIdForCli,
                       QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       QryAcaoBolsa.FieldByName('MOECODIGO').AsInteger,
                       QryAcaoBolsa.FieldByName('CODTIPOACAO').AsString,
                       QryPrincipal.FieldByName('IDLOTE').AsString, '',
                       '', '', bCriaLancto, wTotalLiquido,
                       wVlrMovCartInv,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       wPlano, wPlanilha, wDocumento, wMensErro);
}
   // Caso a carteira nao trate lotes ignora o Lote
   If QryBuscaCarteira.FieldByName('FLGTRATALOTE').AsString='N' Then
      wIdLoteDestino:= ''
   Else
      wIdLoteDestino:=wIdLote;
   // Caso Carteiras de Investimentos iguais, altera investimento de Destino
   If DblkcCarteira.LookupValue = DbLkcCarteiraDestOri.LookupValue Then
   Begin
      wIdInvestDestino  := QryPrincipal.FieldByName('IDINVESTDEST').AsInteger;
      wQtdDestino       := EdQtdTransf.Value;
      // Ja vem Preenchido
      wVlrMovCartInv    := EdVlrUnitTransf.Value; //* EdQtdTransf.Value;
   End
   Else
   Begin
      wIdInvestDestino  := QrySubTipo.FieldByName('IDACAO').AsInteger;
      wQtdDestino       := QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;
   End;

   wPlanilha:=-1;
   wPlano   :=-1;
   wDocumento:=-1;

   // Credita Lancamento de Destino
   If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                     wIdInvestDestino, 2, wIdPrincipal, -1,
                                     QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                     QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                     0{IDCARTEIRAGERENC},
                                     -1, -1, wPlanilha, wDocumento, wPlano,
                                     QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                                     wVlrMovCartInv,
                                     wQtdDestino,
                                     wQtdCotaini, 0 {Variação}, 0 {Juros}, 0, 0, 0, 0, 0, 0, 0,
                                     'A', 'A', wIdLote,
                                     'Transferência entre Carteiras','TRF', '', '', True,
                                     -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
   Begin
      Result:=False;
      Exit;
   End;
   // Alimenta os Saldos da Carteira
   OperComum.AtualizaSaldos(wQtdCotaini,-1);

   //Marco Turon - 07/05/2001
   // Atualiza custódia para papeis transferidos antes da operação  - Carteira de Destino
//   if not OperacaoInvest.CadastraCustodia(wIdPrincipal) then
//   begin
//      MsgDlg('Erro ao Atualizar Custodia na Transferência para a Carteira de Destino. ',
//             'Mensagem do Sistema', MtError,[MbOk],0);
//      Result := false;
//      exit;
//   end;

// Contabiliza Acréscimo Transferência

{  OperComum.LancaOperRFRV(
                       Sistema.IdEmpresa, 79,
                       QryBuscaOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                       QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                       -4, wIdPrincipal, wIdForCli,
                       QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       QryAcaoBolsa.FieldByName('MOECODIGO').AsInteger,
                       QryAcaoBolsa.FieldByName('CODTIPOACAO').AsString,
                       QryPrincipal.FieldByName('IDLOTE').AsString, '',
                       wRecPagBol, '', bCriaLancto, wTotalLiquido,
                       wVlrMovCartInv,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       wPlano, wPlanilha, wDocumento, wMensErro);
}

End;

//------------------------------------------------------------------------------
// Transfere Acoes Depois da Operacao
Function TFrmCadOperAcao.TransfereDepois:Boolean;
Var
  wVlrMovCartInv, wSaldoQtd, wSaldoVlr, wSaldoInutil, wQtdDestino : Double;
  wIdLoteOrigem, wIdLoteDestino:String;
  wIdInvestDestino : Integer;
Begin
   // Inicia Variaveis
   Result :=True;
   // Caso a carteira nao trate lotes ignora o Lote
   If QryBuscaCarteira.FieldByName('FLGTRATALOTE').AsString='N' Then
      wIdLoteOrigem:= ''
   Else
      wIdLoteOrigem:=wIdLote;

   // Busca Saldo do Lote P/ calcular Preco unitario
   wSaldoQtd:=0; wSaldoVlr:=0;
   OperComum.BuscaTodosSaldosInvestLote(QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        0{IDCARTEIRAGERENC},
                                        QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 9999999, -1,
                                        wIdLoteOrigem, DateToStr(QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime),
                                        wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                        wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                        wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,wSaldoInutil);

   // Caso não exista saldo na carteira de destino sai fora
   If (wSaldoQtd <= 0) Then
   Begin
      MsgDlg('Não existe quantidade suficiente na carteira de Destino,'+#13+
             'para transferencia depois da Operação  ','Mensagem do Sistema', MtWarning,[MbOk],0);
      Result:=False;
      Exit;
   End;
   // Calcula Valor da Moviemntacao
   wVlrMovCartInv:=(QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat*
                   (wSaldoVlr/wSaldoQtd));
   // Debita Lancamento de Origem  IDCARTORIDEST
   //  wDocumento:=-1;
   If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                     QrySubTipo.FieldByName('IDACAO').AsInteger, 2, wIdPrincipal, -1,
                                     QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                     QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                     0{IDCARTEIRAGERENC},
                                     -1, -1, wPlanilha, wDocumento, wPlano,
                                     QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                                     wVlrMovCartInv,
                                     QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat,
                                     wQtdCotaini, 0 {Variação}, 0 {Juros},  0, 0, 0, 0, 0, 0, 0,
                                     'D', 'D', wIdLoteOrigem,
                                     'Transferência entre Carteiras','TRF', '', '', True,
                                     -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
   Begin
      // Cancela a Transação
      Result:=False;
      DtmBaseDados.dbBaseDados.RollBack;
      Exit;
   End;

   // Alimenta os Saldos da Carteira
   OperComum.AtualizaSaldos(wQtdCotaini,-1);
//   wDocumento:=-1;

   //Marco Turon - 07/05/2001
   // Atualiza custódia para papeis transferidos antes da operação  - Carteira de Origem
//   if not OperacaoInvest.CadastraCustodia(wIdPrincipal) then
//   begin
//      MsgDlg('Erro ao Atualizar Custodia na Transferência da Carteira de Origem. ', 'Mensagem do Sistema', MtError,[MbOk],0);
//      Result := false;
//      exit;
//   end;

// Contabiliza Baixa Transferência
{
  OperComum.LancaOperRFRV(
                       Sistema.IdEmpresa, 79,
                       QryBuscaOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                       QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                       -6, wIdPrincipal, wIdForCli,
                       QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       QryAcaoBolsa.FieldByName('MOECODIGO').AsInteger,
                       QryAcaoBolsa.FieldByName('CODTIPOACAO').AsString,
                       QryPrincipal.FieldByName('IDLOTE').AsString,  '',
                       wRecPagBol, '', bCriaLancto, wTotalLiquido,
                       wVlrMovCartInv,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       wPlano, wPlanilha, wDocumento, wMensErro);
}
   // Caso a carteira nao trate lotes ignora o Lote
   If QryCarteiraOriDest.FieldByName('FLGTRATALOTE').AsString='N' Then
      wIdLoteDestino:= ''
   Else
      wIdLoteDestino:=wIdLote;

   // Caso Carteiras de Investimentos iguais, altera investimento de Destino
   If DblkcCarteira.LookupValue = DbLkcCarteiraDestOri.LookupValue Then Begin
      wIdInvestDestino  := QryPrincipal.FieldByName('IDINVESTDEST').AsInteger;
      wQtdDestino       := EdQtdTransf.Value;
      // Ja vem Preenchido
      wVlrMovCartInv    := EdVlrUnitTransf.Value;
   End
   Else
   Begin
      wIdInvestDestino  := QrySubTipo.FieldByName('IDACAO').AsInteger;
      wQtdDestino       := QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;
   End;
   // Credita Lancamento de Destino
   If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                     wIdInvestDestino, 2, wIdPrincipal, -1,
                                     QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                     QryPrincipal.FieldByName('IDCARTORIDEST').AsInteger,
                                     0{IDCARTEIRAGERENC},
                                     -1, -1, wPlanilha, wDocumento, wPlano,
                                     QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                                     wVlrMovCartInv,
                                     wQtdDestino,
                                     wQtdCotaini, 0 , 0 , 0, 0, 0, 0, 0, 0, 0,
                                     'A','A', wIdLoteDestino,
                                     'Transferência entre Carteiras','TRF', '', '', True,
                                     -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
   Begin
      Result:=False;
      Exit;
   End;

   // Alimenta os Saldos da Carteira
   OperComum.AtualizaSaldos(wQtdCotaini,-1);

   //Marco Turon - 07/05/2001
   // Atualiza custódia para papeis transferidos antes da operação  - Carteira de Destino
//   if not OperacaoInvest.CadastraCustodia(wIdPrincipal) then begin
//      MsgDlg('Erro ao Atualizar Custodia na Transferência para a Carteira de Destino. ',
//             'Mensagem do Sistema', MtError,[MbOk],0);
//      Result := false;
//      exit;
//   end;

// Contabiliza Acréscimo Transferência
{
  OperComum.LancaOperRFRV(
                       Sistema.IdEmpresa, 79,
                       QryBuscaOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                       QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                       -4, wIdPrincipal, wIdForCli,
                       QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       QryAcaoBolsa.FieldByName('MOECODIGO').AsInteger,
                       QryAcaoBolsa.FieldByName('CODTIPOACAO').AsString,
                       QryPrincipal.FieldByName('IDLOTE').AsString,  '',
                       wRecPagBol, '', bCriaLancto, wTotalLiquido,
                       wVlrMovCartInv,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                       wPlano, wPlanilha, wDocumento, wMensErro);
}
End;

procedure TFrmCadOperAcao.bbtnSairClick(Sender: TObject);
begin
   If QryPrincipal.State In [DsInsert, DsEdit] Then
   Begin
      If (MsgDlg('Deseja realmente Sair ?', 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = MrNo) Then
         Exit;
   End;
   wBtRetorno :='CANCELAR';
   FrmCadOperAcao.ModalResult:=MrCancel;
   inherited;
end;

procedure TFrmCadOperAcao.BtNovoDocClick(Sender: TObject);
begin
   inherited;
   // Cria Numeracao do Documento se o FLGORDMOVINV = 'N'
   // Senão pego o numdocumento da OrdMovInv
//   If QryParamInvest.FieldByName('FLGORDMOVINV').AsString = 'N' Then
//   Begin
     QryPrincipal.FieldByName('NUMDOCUMENTO').AsString := 'RV-' +
                  Copy(DBDateEdit1.Text,9,2) + '/' +
                  FormatFloat('0000',LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DBDateEdit1.Text,9,2)));
     wNumDoc := QryPrincipal.FieldByName('NUMDOCUMENTO').AsString;
//   End;
end;

procedure TFrmCadOperAcao.DbLkcCarteiraDestOriChange(Sender: TObject);
Var
  wSaldoValor, wSaldoQtdInv, wSaldoInutil :Double;
begin
   inherited;
   If (QryBuscaOperacao.FieldByName('FLGTRANSF').AsString <> 'N') And
      (QryBuscaOperacao.FieldByName('FLGTRANSF').AsString <> '')  And
      (DblkcCarteira.LookupValue <> '') Then
   Begin

      If (DblkcCarteira.LookupValue = DbLkcCarteiraDestOri.LookupValue) Then
      Begin
         // Mostra Caixa de Transferencia
         GrBxTransf.Visible:= True;
         // Caso Inserindo Iguala Dados com a Operacao
         If SbtnInserir.Down Then
         Begin
            EdVlrUnitTransf.Text:=DbEdit4.Text;
            EdQtdTransf.Text    :=DbEdit3.Text;
            // Busca Saldos Anteriores do investimento para calcular Valor da Operacao
            OperComum.BuscaTodosSaldosInvestLote( StrToInt(DblkcCarteira.LookupValue),
                                                  0{IDCARTEIRAGERENC},
                                                  QrySubTipo.FieldByName('IDACAO').AsInteger,9999999,  -1,wIdLote,
                                                  DBDateEdit1.Text, wSaldoQtdInv, wSaldoValor, wSaldoInutil,
                                                  wSaldoInutil,wSaldoInutil,wSaldoInutil, wSaldoInutil,
                                                  wSaldoInutil,wSaldoInutil,wSaldoInutil,
                                                  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                                  wSaldoInutil,wSaldoInutil);
            // Calcula Valor da Operacao
            Try
               If (QryPrincipal.State In [DsEdit, DsInsert]) Then
                  QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat := ((wSaldoValor/wSaldoQtdInv)*DBEdit2Tela.Value);
            Except
//               MsgDlg('Erro ao calcular o Preço unitário desta transferençia. ')
               QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat :=0;
            End;
         End
         Else
         Begin
           // Caso Alterando/Pesquisando Busca Dados no HISTCARTINV
           FazQuery(QryAux,'SELECT VLRMOVCARTINV, QTDEMOVINVCART FROM HISTCARTINV '+
                           'WHERE IDOPERACAOINVEST = '+
                                  QuotedStr(QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString)+' AND '+
                           '      TIPMOVCARTINV = ''TRF''');
           EdVlrUnitTransf.Value := Abs(QryAux.FieldByName('VLRMOVCARTINV').AsFloat/DBEdit2Tela.Value);
           EdQtdTransf.Value     := QryAux.FieldByName('QTDEMOVINVCART').AsFloat;
           EdQtdTransf.Enabled:=False;
         End;
      End
      Else
      Begin
         GrBxTransf.Visible:= False;
         If (QryPrincipal.State In [DsEdit, DsInsert]) Then
            QryPrincipal.FieldByName('IDINVESTDEST').Clear;
         EdVlrUnitTransf.Value := 0;
         EdQtdTransf.Value     := 0;
         EdQtdTransf.Enabled   := True;
      End;
   End;
end;

procedure TFrmCadOperAcao.DblkcCarteiraChange(Sender: TObject);
begin
   inherited;
   DbLkcCarteiraDestOriChange(Self);
   // Ana - 08/03/2000
   //  AtualizaOrdem;
   // Busca Ordens de Movimentacao (Caso Haja)
   BuscaOrdemMovimentacao;
end;

procedure TFrmCadOperAcao.EdQtdTransfChange(Sender: TObject);
begin
   inherited;
   Try
      If (QryPrincipal.State In [DsEdit]) Then
         If EdQtdTransf.Value > 0 Then
            EdVlrUnitTransf.Value := Abs( (QryPrincipal.FieldByName('VLROPERACAO').AsFloat/EdQtdTransf.Value)*
                                           DBEdit2Tela.Value );
   Except
      EdVlrUnitTransf.Value := 0;
   End;
end;

procedure TFrmCadOperAcao.BtNovoDocExit(Sender: TObject);
begin
   inherited;
   DbLkcTipoOperacao.SetFocus;
end;

// Ana - 08/03/2000
procedure TFrmCadOperAcao.DbLkcOrdMovInvCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   // So Pesquisa caso tenha sido selecionado algum item da lista
   If DbLkcOrdMovInv.LookupValue <> '' Then
   Begin
      If (Ds.DataSet.State In [DsInsert,DsEdit]) Then
         DBEdit1.Text := QryOrdMovInv.FieldByName('NUMDOCMOVINV').AsString;
   End;
end;

// Ana - 08/03/2000
procedure TFrmCadOperAcao.DbLkcTipoOperacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   If (wFLGORDMOVINV <> 'N') and (QryBuscaOperacao.FieldByName('FLGORDMOVINV').AsString = 'S') Then
   Begin
      Label25.Visible        := True;
      DbLkcOrdMovInv.Visible := True;
   End
   Else
   Begin
      Label25.Visible        := False;
      DbLkcOrdMovInv.Visible := False;
   End;
end;

//------------------------------------------------------------------------------
// Busca as Ordens de Movimentacao desta Operacao
Procedure TFrmCadOperAcao.BuscaOrdemMovimentacao;
Begin
   // Testa se os Filtros estão preenchidos
   If (DblkcCarteira.LookupValue      = '') Or
      (DbLkcBuscaCorretor.LookupValue = '') Or
      (DbLkcAcao.LookupValue          = '') Or
      (DbLkcTipoOperacao.LookupValue  = '') Then
      Exit;

   // Preenche os Parametros
   With QryOrdMovInv Do
   Begin
      Close;
      ParamByName('pIDCARTEIRAINVEST').AsString := DblkcCarteira.LookupValue;
      ParamByName('pIDCORRETVALORES').AsString  := DbLkcBuscaCorretor.LookupValue;
      ParamByName('pIDINVESTIMENTO').AsString   := DbLkcAcao.LookupValue;
      ParamByName('pIDTIPOOPERACAO').AsString   := DbLkcTipoOperacao.LookupValue;

      // Caso o Lote esteja preenchido ou não (Compra a Vista)
      If QryPrincipal.FieldByName('IDLOTE').AsString <> '' Then
         ParamByName('pIDLOTE').AsString := QryPrincipal.FieldByName('IDLOTE').AsString
      Else
         ParamByName('pIDLOTE').AsString := '';

      // Tipo de Status de Acordo com a situacao da Operacao (Inc. ou Cons/Alt.)
      If QryPrincipal.State In [DsInsert, DsEdit] Then
         ParamByName('pTIPOCONSULTA').AsString := wTipoOrdMov
      Else
         ParamByName('pTIPOCONSULTA').AsString := 'T';

      // Abre a Query
      Open;
   End;
End;

procedure TFrmCadOperAcao.DbLkcBuscaCorretorChange(Sender: TObject);
begin
   inherited;
   // Busca Ordens de Movimentacao (Caso Haja)
   BuscaOrdemMovimentacao;
end;

procedure TFrmCadOperAcao.DbLkcBuscaCustChange(Sender: TObject);
begin
   inherited;
   If (Ds.DataSet.State In [DsInsert,DsEdit]) Then
   Begin
      QryPrincipal.FieldByName('IDCUSTORIG').AsInteger := QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger;
      QryPrincipal.FieldByName('IDCUSTDEST').AsInteger := QryPrincipal.FieldByName('IDCUSTODIANTE').AsInteger;
      DbLkcCustOrig.RefreshDisplay;
      DbLkcCustDest.RefreshDisplay;
   End;
end;

procedure TFrmCadOperAcao.DBDateEdit1Exit(Sender: TObject);
begin
   inherited;
   Try
      If FazQuery(QryAux,
           'SELECT QTDTITLOTE FROM CM.COTACAOINVEST WHERE IDINVESTIMENTO = '''+
             QryAcaoBolsa.FieldByName('IDACAO').AsString+'''AND '+
           'DATACOTACAO <= TO_DATE('''+DBDateEdit1.Text+''',''DD/MM/YYYY'') '+
           'ORDER BY DATACOTACAO DESC') Then
      Begin
        DbEdit2.Text    := QryAux.FieldByName('QTDTITLOTE').AsString;
        DbEdit2Tela.Text:= QryAux.FieldByName('QTDTITLOTE').AsString;
      End
      Else
      Begin
        DbEdit2.Text    := QryAcaoBolsa.FieldByName('QTDELOTE').AsString;
        DbEdit2Tela.Text:= QryAcaoBolsa.FieldByName('QTDELOTE').AsString;
      End;

      // Calcula Data de Vencimento
      If (DbLkcTipoOperacao.Text <> '') And (QryPrincipal.State In [DsEdit, DsInsert]) Then
         QryPrincipal.FieldByName('DATAVENCOPER').AsDateTime :=
                         CalculaVencimento(StrToDate(DBDateEdit1.Text),
                                           QryBuscaOperacao.FieldByName('VENCIMENTO').AsInteger);
      // Busca Ordens de Movimentacao (Caso Haja)
      BuscaOrdemMovimentacao;
   Except
//      Raise;
   End;
end;

procedure TFrmCadOperAcao.DBEdit5Exit(Sender: TObject);
begin
   inherited;
   // Calcula Valor da Operacao
   If (Ds.DataSet.State In [DsInsert,DsEdit]) and (DbEdit3.Text <> '') then
   begin
      if (DbEdit5.Text <> '') And (DbEdit5.Text <> '0,00') and
         ((DbEdit4.Text = '') or  (DbEdit4.Text = '0,00')) Then
      Begin
         Try
            QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat:=
               (QryPrincipal.FieldByName('VLROPERACAO').AsFloat*StrToFloat(DbEdit2.Text))/
               QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;
         Except
            Raise;
            DbEdit4.Text:='Erro';
            QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat:=0;
         End;
      End
      else
      If (DbEdit4.Text <> '') And (DbEdit4.Text <> '0,00') and
                  ((DbEdit5.Text = '') or  (DbEdit5.Text = '0,00')) Then
      Begin
          Try
             QryPrincipal.FieldByName('VLROPERACAO').AsFloat :=
             (QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat*StrToFloat(DbEdit2.Text))*
             QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;
          Except
             Raise;
             DbEdit4.Text:='Erro';
             QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat:=0;
          End;
      End;
   End;

end;

procedure TFrmCadOperAcao.DBEdit3Exit(Sender: TObject);
begin
   inherited;
   // Calcula Valor da Operacao
   If (Ds.DataSet.State In [DsInsert,DsEdit]) And (DbEdit3.Text <> '') And (DbEdit4.Text <> '') Then
   Begin
      Try
         QryPrincipal.FieldByName('VLROPERACAO').AsFloat:=
                (QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat/StrToFloat(DbEdit2.Text))*
                 QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat;
      Except
         DbEdit5.Text:='Erro';
         QryPrincipal.FieldByName('VLROPERACAO').AsFloat:=0;
      End;
   End;
end;

procedure TFrmCadOperAcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)

end;

end.

