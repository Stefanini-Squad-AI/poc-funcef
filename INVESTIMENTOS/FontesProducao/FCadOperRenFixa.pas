//********************************************************************************************************
// Autor    : Marco Turon
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Sistema  : INVESTIMENTOS
// Objetivo : Formulário de Cadastro de Operações com Titulos de Renda Fixa ..
// Unit/Form: FCadOperRenFixa / FrmCadOperRenFixa
// Data     : 15/06/1999
// Autor    : Alexandre Ramos  **--> Serious Developer ...
//------------------------------------------------------------------------------
unit FCadOperRenFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, TB97Ctls, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, Mask, wwdblook,
  Grids, DBGrids, ComCtrls, DBTables, Wwquery, MontaSelect, ppDB, ppDBBDE,
  ppBands, ppCache, ppClass, ppComm, ppProd, ppReport, wwdbedit, TREdit,
  URegra, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls, CmEventosCadastro, wwDialog, ImgList;

type
  TFrmCadOperRenFixa = class(TfrmCadastro)
    QryTitRenFixa: TwwQuery;
    DsTitRenFixa: TwwDataSource;
    DsSubTipo: TwwDataSource;
    QrySubTipo: TwwQuery;
    PageControl1: TPageControl;
    TS1: TTabSheet;
    TS2: TTabSheet;
    TS3: TTabSheet;
    TS4: TTabSheet;
    TS5: TTabSheet;
    QryPrincipal: TwwQuery;
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
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    BtAltDesp: TSpeedButton;
    PnlDespesas: TPanel;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    BtOkDetDesp: TBitBtn;
    BtCancDetDesp: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    QryDespesasOperacao: TwwQuery;
    DsDespesasOperacao: TwwDataSource;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryBuscaDespesa: TwwQuery;
    QryBuscaDespesaIDTIPODESPINVEST: TFloatField;
    QryBuscaDespesaMOECODIGO: TFloatField;
    QryBuscaDespesaDESCTIPODESPINV: TStringField;
    QryDespesasOperacaoDESCDESP: TStringField;
    Animate2: TAnimate;
    GridDespesas: TDBGrid;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBDateEdit3: TCMDateTimePicker;
    DbLckCredor: TwwDBLookupCombo;
    QryBuscaCredor: TwwQuery;
    DBEdit2Tela: TRealEdit;
    DBEdit2: TEdit;
    Regra: TRegra;
    QryRegra: TwwQuery;
    QryDespesasOperacaoDESCCRED: TStringField;
    QryBuscaOperacaoIDTIPOINVEST: TFloatField;
    QryBuscaOperacaoIDTIPOOPERACAO: TFloatField;
    QryBuscaOperacaoIDMERCADO: TFloatField;
    QryBuscaOperacaoDESCTIPOOPERACAO: TStringField;
    QryBuscaOperacaoNATUREZAOPERACAO: TStringField;
    QryBuscaOperacaoTIPOCUSTODIA: TStringField;
    QryDespesasOperacaoFLGCALCDIARIO: TFloatField;
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
    QryBuscaOperacaoVENCIMENTO: TFloatField;
    QryDespesasOperacaoEMPRESAPROP: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryBuscaCredorIDPESSOA: TFloatField;
    QryBuscaCredorRAZAOSOCIAL: TStringField;
    DbLkcBuscaCorretor: TwwDBLookupCombo;
    Label11: TLabel;
    UpdPrincipal: TUpdateSQL;
    QrySubTipoIDREGRACALCUSADA: TFloatField;
    QrySubTipoIDOPERACAOINVEST: TFloatField;
    QrySubTipoSALDOTIT: TFloatField;
    QrySubTipoVLRAGIOOPER: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryBuscaOperacaoTIPCREDOR: TStringField;
    DBEdit9: TDBEdit;
    Label1: TLabel;
    BtCalc: TSpeedButton;
    DbLkcCarteira: TwwDBLookupCombo;
    Label19: TLabel;
    GrbSaldo: TGroupBox;
    QryBuscaOperacaoFLGTRANSF: TStringField;
    QryBuscaOperacaoFLGCORRET: TStringField;
    PnlLote: TPanel;
    Label22: TLabel;
    edtObs: TDBMemo;
    Label10: TLabel;
    BtMostraCot: TSpeedButton;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    Label2: TLabel;
    DbLkcTitRenFixa: TwwDBLookupCombo;
    BtCriaTitulo: TSpeedButton;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    BtNovoDoc: TBitBtn;
    DBDateEdit4: TCMDateTimePicker;
    Label18: TLabel;
    DBDateEdit1: TCMDateTimePicker;
    Label4: TLabel;
    QryPrincipalIDOPERACAOINVEST: TFloatField;
    QryPrincipalIDCUSTODIANTE: TFloatField;
    QryPrincipalIDCARTEIRAINVEST: TFloatField;
    QryPrincipalIDTIPOINVEST: TFloatField;
    QryPrincipalIDTIPOOPERACAO: TFloatField;
    QryPrincipalIDINSTFIN: TFloatField;
    QryPrincipalDATAOPERACAO: TDateTimeField;
    QryPrincipalNUMDOCUMENTO: TStringField;
    QryPrincipalQTDEOPERACAO: TFloatField;
    QryPrincipalPRECOUNITOPERACAO: TFloatField;
    QryPrincipalVLROPERACAO: TFloatField;
    QryPrincipalDATAVENCOPER: TDateTimeField;
    QryPrincipalIDINVESTIMENTO: TFloatField;
    QryPrincipalEMPRESAPROP: TFloatField;
    QryPrincipalIDFORCLI: TFloatField;
    QryPrincipalIDCORRETVALORES: TFloatField;
    QryPrincipalMOECODIGO: TFloatField;
    QryPrincipalIDLOTE: TStringField;
    QryPrincipalOBSERVACAO: TStringField;
    QryPrincipalFLGCUSTODIA: TStringField;
    QryPrincipalVLRIR: TFloatField;
    QryBuscaOperacaoRECPAG: TStringField;
    Label21: TLabel;
    DBEdit11: TDBEdit;
    QryPrincipalPUMERCADO: TFloatField;
    PnlSaldoCaixa: TPanel;
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
    procedure DBEdit3Change(Sender: TObject);
    procedure DbLkcTitRenFixaChange(Sender: TObject);
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
    procedure BtCriaTituloClick(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5Change(Sender: TObject);
    procedure DbLkcCarteiraExit(Sender: TObject);
    procedure BtNovoDocClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    Procedure AlimentaCarteiraDespRendaFixa;
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure BtMostraCotClick(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wIdCarteiraInvest, wIdTipoOperacao,
    wIdOperacao, wIdInvestimento, wIdBolsavalores, wIdClasseTitRenFix :Integer;
    wBtRetorno, wNumDocumento, wTipoCustodia, wIdLote, wIdCorretValores : String;
    wEmContrato, wEmPesquisa:Boolean;
    wQtdOperacao, wPrecoLote, wVlrOperacao,wVlrIRProv :Double;
    wDtOperacao:TDate;
    TipoOperacao, wNaturOper : Char;
  end;

var
  FrmCadOperRenFixa: TFrmCadOperRenFixa;
  wIdPrincipal, wOldIdPrincipal,iIdHistCartInv : Integer;
  wValorRegra : Double;
  wQtdCotaIni : Integer;
  wNumDoc, wTipoRecDesBol     : String;
  wDataEmissao:TDate;
  bCriaLancto: boolean;
//  wCorretValores:Integer;
  wCorretValores:String;
  fVlrRendimento : Double;

implementation

{$R *.DFM}

Uses UDataBase, UBibliotecaInvest, DBaseDados, UMensErro, UDiasUteisInv, 
     UOperacaoInvest, UOperComum, dOperComum, USistema, UIntegraBack, UDocumento,
     FTelaAut, FCadCotacaoInvest,UImpostos;

//-------------------------------------------------------------
// Botao Ok
procedure TFrmCadOperRenFixa.bbtnConfirmarClick(Sender: TObject);
Var
   wValSaldo, wSaldoQtd, wSaldoInutil, wSaldoVlrResgate :Double;
   fQtdeInicialInvest,fValorInicialInvest, fNulo,wAgioDesagio: Double;
   wNoDoc :Extended;
   wPlano, wFatura, wOprContabil, wIdForCli, wPlanilha, wDocumento, wValCota :Integer;
   wMensErro, wHistorico, wMovimentoaExecutar, wValString : String;
   wDec:Char;
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
Begin
   // Heranca
   //  Inherited
   // Critica Dados
   wIdForCli := 0;
   If (DbLkcTitRenFixa.Text = '') Or
      (DBDateEdit1.Text = '') Or (DBEdit1.Text     = '') Or
      (DBDateEdit4.Text = '') Or (DbLkcCarteira.Text = '') Then Begin
      ShowMessage('Faltam Preencher Campos .....');
      DbEdit1.SetFocus;
      Exit;
   End;
   // Caso não tenha Calculado as Despesa
   If (Not QryDespesasOperacao.Active) Then Begin
      //    ShowMessage('Falta Verificar Rubricas .....');
      //    Exit;
   End;
 // Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento
   If Not VerificaFechamentoOperacao(DBDateEdit1.Text) Then Begin
      Exit;
   End;

 // Inclui Outros dados da Operacao e Sequencial do SubTipo
   If Sbtninserir.Down = True Then Begin
      QryPrincipal.FieldByName('EMPRESAPROP').AsInteger   := Sistema.IdEmpresa;
      QryPrincipal.FieldByName('IDTIPOINVEST').AsInteger  := 1;
      QrySubTipo.FieldByName('IDOPERACAOINVEST').AsInteger:= wIdPrincipal;
      QryPrincipal.FieldByName('MOECODIGO').AsInteger    :=
      QryTitRenFixa.FieldByName('IDMOEDAREG').AsInteger;
      // Guarda dados da Operacao
      wOldIdPrincipal:=QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger ;
      wDataEmissao   :=QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime ;
      //  wCorretValores :=QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
      wCorretValores :=QryPrincipal.FieldByName('IDCORRETVALORES').AsString;

     //----------------------------------------------------------------
     // Calcula as Rubricas Automáticamente, Caso ainda não tenha sido.
      If QryDespesasOperacao.IsEmpty Then Begin
         PageControl1.ActivePage := TS4;
         PageControl1Change(Self);
      End;

      //--------------------------------------------
      // Busca Credor da Despesa caso Tipo de Credor
      If QryBuscaOperacao.FieldByName('TIPCREDOR').AsString <> '' Then Begin
      // Atualiza de acordo Emissor/Corretor
         If QryBuscaOperacao.FieldByName('TIPCREDOR').AsString = 'CO'Then Begin
        // Transforma Corretor em Fornecedor
         Try
             If QryBuscaOperacao.FieldByName('RECPAG').AsString = 'R'Then
             Begin
                Documento.ForCli.Inserir(QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger,
                                         Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                         '','','','','C',False); // Cliente
             end
             else If QryBuscaOperacao.FieldByName('RECPAG').AsString = 'P'Then
             Begin
                Documento.ForCli.Inserir(QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger,
                                         Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                         '','','','','F',False); // Fornecedor
             end;
         Except  // Função gerava um Abort quando o Fornecedor
         End;    // já estava cadastrado
        QryPrincipal.FieldByName('IDFORCLI').AsInteger :=
        QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
        wIdForCli:=QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
      End Else Begin
 // Transforma Emissor em Fornecedor
         Try
             If QryBuscaOperacao.FieldByName('RECPAG').AsString = 'R'Then
             Begin
                Documento.ForCli.Inserir(QryTitRenFixa.FieldByName('IDEMISSOR').AsInteger,
                                         Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTEEMI,Sistema.IdEmpresa,
                                         '','','','','C',False); // Cliente
             end
             else If QryBuscaOperacao.FieldByName('RECPAG').AsString = 'P'Then
             Begin
                Documento.ForCli.Inserir(QryTitRenFixa.FieldByName('IDEMISSOR').AsInteger,
                                         Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                         '','','','','F',False); // Fornecedor
             end;
         Except  // Função gerava um Abort quando o Fornecedor
         End;    // já estava cadastrado
         QryPrincipal.FieldByName('IDFORCLI').AsInteger :=
           QryTitRenFixa.FieldByName('IDEMISSOR').AsInteger;
         wIdForCli:=QryTitRenFixa.FieldByName('IDEMISSOR').AsInteger;
       End;
 // Caso Credor
      End Else Begin
 // Busca o Credor no Sub........
        If FazQuery(QryAux,
           'SELECT IDFORCLI FROM FORCLIXTIPOPER '+
           ' WHERE (IDTIPOINVEST  = '+QryPrincipal.FieldByName('IDTIPOINVEST').AsString+') AND '+
           '       (IDTIPOOPERACAO= '+QryPrincipal.FieldByName('IDTIPOOPERACAO').AsString+') AND '+
           '       (EMPRESAPROP   = '+IntToStr(Sistema.IdEmpresa)+')') Then Begin
           QryPrincipal.FieldByName('IDFORCLI').AsString :=
                QryAux.FieldByName('IDFORCLI').AsString;
           wIdForCli:=QryAux.FieldByName('IDFORCLI').AsInteger;
 // Caso não encontre o Fornecedor
           If wIdForCli = 0 Then Begin
              MsgDlg('O Credor deste Tipo de Operação não foi Informado, '+#13+
                     'A operação não será efetuada!',
                     'Mensagem do Sistema',
                     MtError,[MbOk],0);
              Exit;
           End;
        End;
     End;

 //--------------------------------------------\\
 // Acerta Historico da Carteira
     If QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsString <> '' Then Begin
        If QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then Begin
 // ALIMENTA A CARTEIRA COM OS LUCROS/PREJUIZOS

// Calcular Lucro da Operação

{           OperComum.BuscaTodosSaldosInvestLote(
              QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
              QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
              high(integer), wIdLote,
              QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
              fQtdeInicialInvest, fValorInicialInvest,
              fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo);

           if QryPrincipal.FieldByName('VLROPERACAO').AsFloat <>
              OperComum.Trunca((QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat *
              (OperComum.Trunca(OperComum.DivValorZero(fValorInicialInvest,fQtdeInicialInvest),9))),2) then
           begin
}
              wPlanilha :=-1;
              wPlano    :=-1;
              wDocumento:=-1;

              If OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                 QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 1, wIdPrincipal, -1,
                 QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                 QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                 0{IDCARTEIRAGERENC},
                 -1, -1, wPlanilha, wDocumento, wPlano,
                 QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
//               Partida com Lucro ZERO para futuro recalculo
                 0,
//                 QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
                 QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat,
                 wQtdCotaini,  0 {Juros}, 0, 0, 0, 0, 0, 0, 0, 0,
                 'L' {Movimento},
                 QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString {Operacao},
                 wIdLote,
                 'LUCRO/PREJUIZO NA VENDA'+' - '+
                 QryTitRenFixa.FieldByName('DESCINVESTIMENTO').AsString,'LUC', '', '', True,
                 -1, iPlanPrevCtbPatro,iIdHistCartInv)
              Then Begin
              // Alimenta os Saldos da Carteira
                 If Not OperComum.AtualizaSaldos(wQtdCotaini,-1) Then Begin
                    MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                           'esta Operação não poderá ser confirmada ','Mensagem do Sistema',
                            MtError,[MbOk],0);
              // Como ocorreu erro
                    bbtnConfirmar.Enabled:=False;
                    Exit;
                 End;
              // Caso Operacao de Venda (NATURMOV = 'D') Marca o Regsitro de Lucro Com Flag (1)
              // Para ser Recalculado
                 ExecutaQuery(QryAux,
                   'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' '+
                   'WHERE 	(TIPMOVCARTINV    = ''LUC'') AND '+
                   '      	(IDOPERACAOINVEST = '+
                   QuotedStr(QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString)+')');

              End Else Begin
                 MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                        'Mensagem do Sistema',
                        MtError,[MbOk],0);
                 BbtnCancelarClick(Self);
                 Exit;
              End;
//           end;
        End;

 // ALIMENTA A CARTEIRA COM A OPERACAO
        wPlanilha :=-1;
        wPlano    :=-1;
        wDocumento:=-1;

        // Calcula Agio/Desagio
        wAgioDesagio := 0;
        if qryPrincipal.FieldByName('PUMERCADO').AsFloat <> 0 then
           wAgioDesagio := (qryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat -
                            qryPrincipal.FieldByName('PUMERCADO').AsFloat) * QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;

        If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
           QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 1, wIdPrincipal, -1,
           QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
           QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
           0{IDCARTEIRAGERENC},
           -1, -1, wPlanilha, wDocumento, wPlano,QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
           QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
           QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat,
           wQtdCotaini, 0 {Variacao}, 0 {Juros }, wVlrIRProv,
           QryPrincipal.FieldByName('VLRIR').AsFloat, 0, 0, wAgioDesagio, 0, 0,
           QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString,
           QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString, wIdLote,
           QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
           QryTitRenFixa.FieldByName('DESCINVESTIMENTO').AsString,'OPE','', '', True,
           -1, iPlanPrevCtbPatro,iIdHistCartInv) Then Begin
           Exit;
        End;
     End;
   End;

 // Atualiza Saldo de Resgate - Ana - 12/03/2000
   If QryTitRenFixa.FieldByName('VLRRESGATE').AsFloat <> 0 then begin
     wSaldoQtd := 0;
     //AL_1
     //AL_2
     OperComum.BuscaTodosSaldosInvestLote(
       QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
       0{IDCARTEIRAGERENC},
       QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,-1,
       wIdLote, DateToStr(Date), -1,
       wSaldoQtd, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoInutil, wSaldoInutil, wSaldoInutil);

     If FazQuery(QryAux,
       'SELECT QTDECOMPRATITLOTE FROM CONTRATOINVESTIM '+
       ' WHERE (IDINVESTIMENTO = '+QryPrincipal.FieldByName('IDINVESTIMENTO').AsString+') AND '+
       '       (((IDLOTE IS NOT NULL) AND (IDLOTE = '''+wIdLote+
       ''')) OR ((IDLOTE IS NULL) AND ('''+wIdLote+''' IS NULL)))') Then
     Begin
       // Inicial Saldo
       wSaldoVlrResgate :=0;
       // Muda Separador Decimal
       wDec := DecimalSeparator;
       DecimalSeparator:='.';
       // Caso nao Tenha Quantidade de Titulos no Contrato  o Saldo de Resgate e o Proprio Valor
       If QryAux.FieldByName('QTDECOMPRATITLOTE').AsFloat = 0 Then Begin
         wSaldoVlrResgate := QryTitRenFixa.FieldByName('VLRRESGATE').AsFloat;
       End Else
       Begin
          // Caso Tenha Quantidade de Titulos no Contrato, Calcula o Valor Atual
          wSaldoVlrResgate := QryTitRenFixa.FieldByName('VLRRESGATE').AsFloat *
                             wSaldoQtd /
                             QryAux.FieldByName('QTDECOMPRATITLOTE').AsFloat;
       End;

       ExecutaQuery(QryAux,
         'UPDATE TITRENFIXA SET SALDOVLRRESGATE = '+FloatToStr(wSaldoVlrResgate)+
         ' WHERE 	(IDTITRENFIXA = '+QryPrincipal.FieldByName('IDINVESTIMENTO').AsString+')');
       // Volta Separador Decimal
       DecimalSeparator := wDec;

     end;
   end;

   //--------------------------------------------\\
   // Guarda Dados Transfeiveis entre Operacoes
   FrmCadOperRenFixa.wIdTipoOperacao  := QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger;
   FrmCadOperRenFixa.wIdCarteiraInvest:= QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger;
   FrmCadOperRenFixa.wIdCorretValores := QryPrincipal.FieldByName('IDCORRETVALORES').AsString;
   FrmCadOperRenFixa.wIdInvestimento  := QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger;
   FrmCadOperRenFixa.wNumDocumento    := QryPrincipal.FieldByName('NUMDOCUMENTO').AsString;
   FrmCadOperRenFixa.wQtdOperacao     := QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat;
   FrmCadOperRenFixa.wPrecoLote       := QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat;
   FrmCadOperRenFixa.wVlrOperacao     := QryPrincipal.FieldByName('VLROPERACAO').AsFloat;
   FrmCadOperRenFixa.wDtOperacao      := QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime;
   FrmCadOperRenFixa.wTipoCustodia    := QryBuscaOperacao.FieldByName('TIPOCUSTODIA').AsString;
   FrmCadOperRenFixa.wNaturOper       := QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString[1];
   //--------------------------------------------

   // Grava o IR Litígio
   If QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then   // Resgate
   Begin
      if not Impostos.GravaIrLitigio(1,
                     QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                     QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger,
                     QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                        QryTitRenFixa.FieldByName('DESCINVESTIMENTO').AsString +' - '+
                        QryPrincipal.FieldByName('IDLOTE').AsString,
                     QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                     iPlanoPrevContab,
                     iPatrocinadora,
                     QryPrincipal.FieldByName('VLRIR').AsFloat,
                     fVlrRendimento) then
         Exit;
   end;
   // Posta Principal
   Try
     QryPrincipal.Post;
     QryPrincipal.ApplyUpdates;
     QryPrincipal.CommitUpdates;
 // Posta SubTipo
     QrySubTipo.Post;
 // Alimenta Carteira com as Despesas
 //    AlimentaCarteiraDespRendaFixa;

   Except
     DtmBaseDados.dbBaseDados.RollBack;
     Raise;
   End;

   If SbtnInserir.Down = True Then Begin
 // Alimenta os Saldos da Carteira
      OperComum.AtualizaSaldos(wQtdCotaini,-1);

      // Contabiliza a Operação
      wTipoRecDesBol := '';
      wPlano := -1;
      wPlanilha := -1;
      wDocumento := -1;
      wMensErro := '';
// VOLTAR
      if OperComum.LancaOperRFRV(
                      Sistema.IdEmpresa, Sistema.IdModulo,
                      QryBuscaOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                      QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger,
                      QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                      wIdPrincipal, wIdForCli,
                      QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                      QryTitRenFixa.FieldByName('IDMOEDAREG').AsInteger,
                      QryTitRenFixa.FieldByName('CODTIPRENFIXA').AsString,
                      QryPrincipal.FieldByName('IDLOTE').AsString,
                      QryPrincipal.FieldByName('NUMDOCUMENTO').AsString,
                      '',
                      '', wTipoRecDesBol, bCriaLancto, 0,
                      QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
                      QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                      QryPrincipal.FieldByName('DATAVENCOPER').AsDateTime,
                      wPlano, wPlanilha, wDocumento, wMensErro) <> 0 then
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Exit;
      end;

      if wPlanilha <> -1 then
      begin
         ExecutaQuery(QryAux,
            'UPDATE IRLITIGIO SET PLNCODIGO = '+IntToStr(wPlanilha)+
            ' ,PLANO = '+IntToStr(wPlano)+
            ' WHERE 	(IDOPERACAOINVEST = '+QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+')');
      end;

     // Ana - 30/03/2000 - Se o saldo zerar, mudar o flag ativo para falso.
     wSaldoQtd:=0;
     //AL_1
     //AL_2
     OperComum.BuscaTodosSaldosInvestLote(
       QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
       0{IDCARTEIRAGERENC},
       QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,-1,
       wIdLote, DateToStr(QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime), -1,
       wSaldoQtd, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoInutil, wSaldoInutil, wSaldoInutil);
     If (wSaldoQtd = 0) Then Begin
       ExecutaQuery(QryAux,
         'UPDATE INVESTIMENTO SET FLGATIVO = ''N'' '+
         'WHERE (IDINVESTIMENTO = '+
           QuotedStr(QryPrincipal.FieldByName('IDINVESTIMENTO').AsString)+')');
     End;


   End;

   DtmBaseDados.dbBaseDados.Commit;

   // Caso Inserindo, Fecha e Inclui Novo
   If Sbtninserir.Down = True Then
   Begin
     QryPrincipal.Close;
     QryPrincipal.Open;

     // Fecha a Query de Impostos e Despesa
     QryImpostosOperacao.Close;
     QryDespesasOperacao.Close;
     // Acerta Botoes
     AcertaBotoes('I');
   End
   Else
     AcertaBotoes('A');

   // Libera Combos
   DbLkcTitRenFixa.Enabled    := True;
   DbLkcTipoOperacao.Enabled  := True;
   DbLkcCarteira.Enabled      := True;
   DbDateEdit1.Enabled        := True;
   DbDateEdit4.Enabled        := True;
   DBEdit3.Enabled            := True;
   DBEdit4.Enabled            := True;
   edtObs.Enabled             := True;
   wBtRetorno                 := 'OK';
   // Caso em Contrato Fecha Formulario
   If wEmContrato Then

   // Caso Form tenha sido chamado Boato de Pesquisa do Contrato
   If wEmPesquisa = True Then Begin
     sbtnInserir.Enabled:=False;
   End;
end;

 //-----------------------------------------------------------
// Botao Inserir
procedure TFrmCadOperRenFixa.sbtnInserirClick(Sender: TObject);
Var
  wSaldoCaixa:Extended;
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
  QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime     := Date;
  QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat        := 0;
  QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat   := 0;
  QryPrincipal.FieldByName('VLROPERACAO').AsFloat         := 0;
  QryPrincipal.FieldByName('IDTIPOINVEST').AsInteger      := 2;
  QryPrincipal.FieldByName('FLGCUSTODIA').AsString        := '1';
// Posta Principal
  QryPrincipal.Post;
  QryPrincipal.ApplyUpdates;
  QryPrincipal.Edit;;
// Fecha a Query de Impostos e Despesas
  QryDespesasOperacao.Close;
// Hinabilita Combos
  DbLkcTitRenFixa.Enabled    := True;
  DbLkcTipoOperacao.Enabled  := True;
  DbLkcBuscaCorretor.Enabled := True;
  DbLkcCarteira.Enabled      := True;
  DbDateEdit1.Enabled        := True;
  DbDateEdit4.Enabled        := True;
  DBEdit3.Enabled            := True;
  DBEdit4.Enabled            := True;
  edtObs.Enabled             := True;
  BtCriaTitulo.Enabled       := True;
  BtNovoDoc.Enabled          := True;

// Busca Inicio da Carteira
  FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
  wQtdCotaIni:= QryAux.FieldByName('VLRCOTAINICART').AsInteger;

// Preenche dados Automaticos
  QryPrincipal.FieldByName('NUMDOCUMENTO').AsString    :=wNumDoc;
  QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime  :=wDataEmissao;
  QryPrincipal.FieldByName('IDCORRETVALORES').AsString :=wCorretValores;
  QryPrincipal.FieldByName('IDLOTE').AsString          :=wIdLote;

// Busca o Saldo do Caixa
  GrbSaldo.Visible:=True;
  wSaldoCaixa:=BuscaSaldoCaixa(DBDateEdit1.Text);
  If wSaldoCaixa < 0 Then
    PnlSaldoCaixa.Font.Color:=ClRed
  Else
    PnlSaldoCaixa.Font.Color:=ClBlack;
  PnlSaldoCaixa.Caption := FormatFloat('###,###,###,###,##0.00',wSaldoCaixa);

// Guarda Tipo de Operacao
  TipoOperacao:='I';
end;

//---------------------------------------------------
// Fecha Formularios
procedure TFrmCadOperRenFixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QryPrincipal.Close;
  QrySubTipo.Close;
  QryTitRenFixa.Close;
  QryBuscaOperacao.Close;
  QryBuscaCarteira.Close;
  QryBuscaCorretora.Close;
  QryBuscaCredor.Close;
  QryBuscaCredor.UnPrepare;
  QryDespesasOperacao.Close;
  QryDespesasOperacao.Unprepare;
// Caso em Contrato Muda Modal Results
  If wEmContrato Then Begin
    FrmCadOperRenFixa.bbtnConfirmar.ModalResult:=MrOk;
    If wBtRetorno = 'OK' Then Begin
      FrmCadOperRenFixa.ModalResult:=MrOk;
    End Else Begin
      FrmCadOperRenFixa.ModalResult:=MrCancel;
    End;
  End;
end;

//---------------------------------------------------
// Mostra Formulario
procedure TFrmCadOperRenFixa.FormShow(Sender: TObject);
begin
  inherited;
  bCriaLancto    := true;
  wTipoRecDesBol := '';
// Abre Querys
  QrySubTipo.Open;
  QryPrincipal.Open;
  QryTitRenFixa.Open;
  QryBuscaOperacao.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  QryBuscaOperacao.Open;
  QryBuscaCarteira.Open;
  QryBuscaCorretora.Open;
// Acerta Pagina
  PageControl1.ActivePage := TS1;
// Preenche campos do Subtipo
  DbLkcTitRenFixa.Value :=
  QryPrincipal.FieldByName('IDINVESTIMENTO').AsString;
// Esconde Navegator
  DbNav.Visible := False;
// Prepare Tabela de despesas
  QryDespesasOperacao.Prepare;
  If (wEmContrato) And (Not sbtnInserir.Down) Then Begin
// Insere Nova Operacao
    SbtnInserirClick(Self);
// Preenche Dados Transferiveis
    QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger  :=wIdTipoOperacao;
    If QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then Begin
      wDtOperacao := Date;
    End;
//    QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger :=wIdCorretValores;
    QryPrincipal.FieldByName('IDCORRETVALORES').AsString  :=wIdCorretValores;
    QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger:=wIdCarteiraInvest;
    QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger  :=wIdInvestimento;
    QryPrincipal.FieldByName('NUMDOCUMENTO').AsString     :=wNumDocumento;
    QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat      :=wQtdOperacao;
    QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat :=wPrecoLote;
    QryPrincipal.FieldByName('VLROPERACAO').AsFloat       :=wVlrOperacao;
    QryPrincipal.FieldByName('DATAOPERACAO').AsFloat      :=wDtOperacao;
    DbLkcTitRenFixa.Enabled:=False;
    BtCriaTitulo.Enabled   :=False;
  End Else If (Not wEmContrato) Then Begin
    DbLkcTitRenFixa.Enabled:=True;
    BtCriaTitulo.Enabled   :=True;
  End;

  PnlLote.Caption := wIdLote;
// Caso Form tenha sido chamado do Botao de Pesquisa do Contrato
  If wEmPesquisa = True Then Begin
    QryPrincipal.Locate('IDOPERACAOINVEST',IntToStr(wIdOperacao),[]);
    sbtnInserir.Enabled:=False;
  End;
//------------------------------------------------------------------------------
// Altera Layout do Formulario de Acordo com a SuperClasse \\
// CDB = 1

  If wIdClasseTitRenFix = 1          Then Begin
    DbLkcBuscaCorretor.Visible :=True;
    Label11.Visible     :=True;
    BtMostraCot.Visible :=False;
    Label7.Caption      := 'Preço por Lote';
// FUNDOS = 2
  End Else If wIdClasseTitRenFix = 2 Then Begin
// Esconde Corretor
    DbLkcBuscaCorretor.Visible :=False;
    Label11.Visible    :=False;
    DBEdit4.Enabled    :=False;
    DBEdit4.Color      :=ClBtnFace;
    BtMostraCot.Visible:=False;
    Label7.Caption     := 'Valor da Cota';

  End;
  DbLkcTitRenFixaChange(Self);


// Acerta Variaveis
  wCorretValores := '';
  wDataEmissao   :=Date;
  wOldIdPrincipal:=0;
end;

//-----------------------------------------------------------
// Botao Cancelar
procedure TFrmCadOperRenFixa.bbtnCancelarClick(Sender: TObject);
begin
// Confirma Cancelamento
  If (MsgDlg('Deseja realmente cancelar esta operação ?',
    'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)
    Then Begin
      Exit;
  End;
// Cancela Alteracoes no SubTipo
  QrySubTipo.Cancel;
// Cancela Transação
  If SbtnInserir.Down = True Then Begin
    DtmBaseDados.dbBaseDados.RollBack;
// Fecha a Query de Impostos e Despesas
    QryImpostosOperacao.Close;
    QryDespesasOperacao.Close;
  End;
// Caso exista uma transação em aberto, Cancela
  If DtmBaseDados.dbBaseDados.InTransaction Then
    DtmBaseDados.dbBaseDados.RollBack;

// Heranca
  inherited;
// Busca Registro do Principal, Buscando os SubTipos Tambem
  If Not QryPrincipal.IsEmpty Then Begin
// Procura Registro do Principal
   	QryPrincipal.Locate('IDOPERACAOINVEST',IntToStr(wOldIdPrincipal),[]);
  End;
// Esconde Navegator
  DbNav.visible := False;
// Acerta Pagina
  PageControl1.ActivePage    := TS1;
// Libera Combos
  DbLkcTitRenFixa.Enabled    := True;
  DbLkcTipoOperacao.Enabled  := True;
  DbLkcBuscaCorretor.Enabled := True;
  DbLkcCarteira.Enabled      := True;
  DbDateEdit1.Enabled        := True;
  DbDateEdit4.Enabled        := True;
  DBEdit3.Enabled            := True;
  DBEdit4.Enabled            := True;
  edtObs.Enabled             := True;
  BtCriaTitulo.Enabled       := False;
  BtNovoDoc.Enabled          := False;
  GrbSaldo.Enabled           := False;
  wBtRetorno                 :='CANCELAR';

// Caso Form tenha sido chamado Boato de Pesquisa do Contrato
  If wEmPesquisa = True Then Begin
    sbtnInserir.Enabled:=False;
  End;

end;

//-----------------------------------------------------------
// Altera o Combo
procedure TFrmCadOperRenFixa.DbLkcBolsaChange(Sender: TObject);
begin
  inherited;
// Apaga a Descricao da Acao
  DbLkcTitRenFixa.Text := '';
end;

//------------------------------------------------------------------
// Apos Scroll na Query SubTipo
procedure TFrmCadOperRenFixa.QrySubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Preenche dados do SubTipo
  DbLkcTitRenFixa.Value:=
  QryPrincipal.FieldByName('IDINVESTIMENTO').AsString;
end;

//----------------------------------------------------------
// Botao Excluir
procedure TFrmCadOperRenFixa.sbtnApagarClick(Sender: TObject);
begin
   // Pede Confirmacao
   if (MsgDlg('Deseja realmente excluir este registro ?',
      'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      // Deleta Filhotes
      try
         // Inicia Transação
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;
         // Estorna Operacao
         if not OperComum.EstornaOper( //wNumDocumento,
               QryPrincipal.FieldByName('NUMDOCUMENTO').AsString,
               QryPrincipal.FieldByName('IDTIPOINVEST').AsInteger,
               QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger,               
               QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
               wQtdCotaini, 'X', true) Then
         begin
            MsgDlg('Não é possível fazer a Exclusão dessa Boleta.',
                   'Mensagem do Sistema', MtError,[MbOk],0);

            DtmBaseDados.dbBaseDados.RollBack;
            Exit;
         end;
         DtmBaseDados.dbBaseDados.Commit;
      except on E: Exception do
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema na exclusão da Boleta'+
                   E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;

      // Acerta Pagina
      PageControl1.ActivePage := TS1;
      // Fecha e Abre as Querys
      QryPrincipal.Close;
      QrySubTipo.Close;
      QryImpostosOperacao.Close;
      QryDespesasOperacao.Close;
      QryPrincipal.Open;
      QrySubTipo.Open;
      QryDespesasOperacao.Open;
   end;
   SbtnApagar.Down := False;
   // Esconde Navigator
   DbNav.Visible := False;
   // Guarda Tipo de Operacao
   TipoOperacao:='E';
end;

//--------------------------------------------------------------------
// Antes de Mover o Ponteiro da tabela Principal 
procedure TFrmCadOperRenFixa.QryPrincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Abre Query com o SubTipo
  If Not QryPrincipal.IsEmpty Then Begin
    FazQuery(QrySubTipo,
      'SELECT IDREGRACALCUSADA, IDOPERACAOINVEST, SALDOTIT, VLRAGIOOPER '+
      'FROM OPRRENFIX '+
      'WHERE IDOPERACAOINVEST = '''+QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+'''');
  End;
// Mostra ou Nao o Lote da Operacao
    If QryPrincipal.FieldByName('IDLOTE').AsString = '' Then
      PnlLote.Caption := '-'
    Else
      PnlLote.Caption := QryPrincipal.FieldByName('IDLOTE').AsString;
end;

//------------------------------------------------------------------------------
// Botao Alterar
procedure TFrmCadOperRenFixa.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Altera SubTipo
  QrySubTipo.Edit;
// Bloqueia Combos
  DbLkcTitRenFixa.Enabled   := False;
  DbLkcTipoOperacao.Enabled := False;
  DbLkcBuscaCorretor.Enabled:= False;
  DbLkcCarteira.Enabled     := False;
  DbDateEdit1.Enabled       := False;
  DbDateEdit4.Enabled       := False;
  DBEdit3.Enabled           := False;
  DBEdit4.Enabled           := False;
  edtObs.Enabled            := True;  
  BtCriaTitulo.Enabled      := False;
  BtNovoDoc.Enabled         := False;

// Guarda Id do Principal
  wOldIdPrincipal := QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger ;
// Guarda Tipo de Operacao
  TipoOperacao:='A';
// Inicia Transação
  DtmBaseDados.dbBaseDados.StartTransaction;
  
End;

procedure TFrmCadOperRenFixa.AcertaBotoes(wOperacao:String);
begin
  If wOperacao = 'I' Then Begin
    sbtnInserir.Down  := True;
    sbtnAlterar.Down  := False;
    sbtnApagar.Down   := False;
    sbtnProcurar.Down := False;
// Enableds
    sbtnInserir.Enabled  := False;
    sbtnAlterar.Enabled  := False;
    sbtnApagar.Enabled   := False;
    sbtnProcurar.Enabled := False;
    BtCriaTitulo.Enabled := True;
    BtNovoDoc.Enabled    := True;

// Botoes de Baixo
    bbtnConfirmar.Visible := True;
    bbtnCancelar.Visible  := True;
    dbNav.visible         := False;
  End Else If wOperacao = 'A' Then Begin
    sbtnInserir.Down  := False;
    sbtnAlterar.Down  := False;
    sbtnApagar.Down   := False;
    sbtnProcurar.Down := False;
// Enableds
    sbtnInserir.Enabled  := True;
    sbtnAlterar.Enabled  := True;
    sbtnApagar.Enabled   := True;
    sbtnProcurar.Enabled := True;
    BtCriaTitulo.Enabled := False;
    BtNovoDoc.Enabled    := False;
// Botoes de Baixo
    bbtnConfirmar.Visible := False;
    bbtnCancelar.Visible  := False;
    dbNav.visible         := False;
  End;

end;


procedure TFrmCadOperRenFixa.sbtnProcurarClick(Sender: TObject);
begin
//  inherited;
  MontaSelect.Executar;
  If (MontaSelect.ValoresChave.Count > 0) And
     (MontaSelect.ValoresChave[0] <> '') Then	Begin
     QryPrincipal.Locate('IDOPERACAOINVEST',MontaSelect.ValoresChave[0],[]);
  End;
// Acerta Botao
  sbtnProcurar.Down := False;
// Acerta Pagina
  PageControl1.ActivePage := TS1;
end;

//------------------------------------------------------------------------------
// Mudanca na QtdEdit
procedure TFrmCadOperRenFixa.DBEdit3Change(Sender: TObject);
begin
  inherited;
// Caso os Campos de Calculo estiverem vazios Zera o valor Total
  If (Ds.DataSet.State In [DsInsert,DsEdit]) And (DbEdit3.Text = '') Then Begin
    QryPrincipal.FieldByName('VLROPERACAO').AsFloat:=0;

// Caso Fundos Calcula Valor
    If wIdClasseTitRenFix = 2 Then Begin
      QryPrincipal.FieldByName('VLROPERACAO').AsFloat:=
        (QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat *
         QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat)
    End;
  End;
// Altera Posição do Icone de Calculo
  BtCalc.Top := 120;
  BtCalc.Left:= 150;
end;

procedure TFrmCadOperRenFixa.DbLkcTitRenFixaChange(Sender: TObject);
begin
  inherited;
// Calcula Data de Vencimento
  Try
    If (DbLkcTipoOperacao.Text <> '') And (QryPrincipal.State In [DsEdit, DsInsert]) Then
      QryPrincipal.FieldByName('DATAVENCOPER').AsDateTime :=
      CalculaVencimento(StrToDate(DBDateEdit1.Text), QryBuscaOperacao.FieldByName('VENCIMENTO').AsInteger);

    If (QryPrincipal.State In [DsEdit, DsInsert]) Then Begin
// Caso Classe de Fundos
      If (wIdClasseTitRenFix = 2) And (QryPrincipal.FieldByName('IDINVESTIMENTO').AsString <> '') Then Begin
        If FazQuery(QryAux, 'SELECT VLRCONTABIL FROM COTACAOINVEST '+
                            'WHERE IDINVESTIMENTO = '+QuotedStr(QryPrincipal.FieldByName('IDINVESTIMENTO').AsString)+' AND '+
                            '      DATACOTACAO    = '+
                            '      TO_DATE('+QuotedStr(DBDateEdit1.Text)+',''DD/MM/YYYY'') ') Then Begin
// Preenche o Preco Unitário
          QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat :=
            QryAux.FieldByName('VLRCONTABIL').AsFloat;
          wPrecoLote := QryAux.FieldByName('VLRCONTABIL').AsFloat;
          BtMostraCot.Visible:=False;
        End Else Begin
// Caso Não encontre Cotacao Zera Preco Unitário
// e Mostra Botao de Cadastro de Cotacao
          QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat :=
            QryAux.FieldByName('VLRCONTABIL').AsFloat;
          BtMostraCot.Visible:=True;
        End;
      End;
    End;
  Except
  End;
end;

procedure TFrmCadOperRenFixa.PageControl1Change(Sender: TObject);
Var
  wSQL : String;
  wDecimal : Char;
  wSaldoAntVlr, wSaldoAntQtd, wVlrTotCorretor, wVlrTotBolsa:Double;
  QryLocalAux : TwwQuery;
begin
  inherited;
// Exije cadastro do Investimento.
  If (QryPrincipal.State In [DsEdit, DsInsert]) And (DbLkcTitRenFixa.Text = '') Then Begin
    MsgDlg('O Titulo desta Operação não foi preenchido..',
           'Mensagem do Sistema ',mtWarning,[mbOK],0);
    PageControl1.ActivePage := TS1;
    DbLkcTitRenFixa.SetFocus;
    Exit;
  End;
// Caso Pagina Ativa = Carteria e a Operacao Nao movimente a carteria
// não permite edicao .
  If (PageControl1.ActivePage = TS2) And
     (QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'N') And
     (QryPrincipal.State In ([DsEdit, DsInsert])) Then Begin
    MsgDlg('Tipo de Operação escolhida não movimenta carteria ..',
           'Mensagem do Sistema ',mtWarning,[mbOK],0);
    PageControl1.ActivePage := TS1;
    Exit;
  End;
//---------------------------------------------------------
// Caso Pagina Ativa = Despesas Exije cadastro do Corretor.
  If ((PageControl1.ActivePage = TS4) Or
      (PageControl1.ActivePage = TS5)) And
     ((QryPrincipal.State In ([DsEdit, DsInsert])) And (DbLkcBuscaCorretor.Text = '')) And
      (QryBuscaOperacao.FieldByName('FLGCORRET').AsString = 'S') Then Begin
    MsgDlg('A Corretora desta Operação não foi preenchida..',
           'Mensagem do Sistema ',mtWarning,[mbOK],0);
    PageControl1.ActivePage := TS1;
    Exit;
  End;

// Cria Objetos Locais
  QryLocalAux := TwwQuery.Create(Self);
  QryLocalAux.DatabaseName:='BaseDados';

//----------------------------------------------------------------------------\\
// Monta Dados para a Regra \\
  If ((PageControl1.ActivePage = TS4) Or (PageControl1.ActivePage = TS5)) And
     (QryPrincipal.State In ([DsEdit, DsInsert])) Then Begin
// Busca Dado dos Saldos do Investimento
    wSaldoAntVlr :=0;
    wSaldoAntQtd :=0;
    FazQuery(QryLocalAux,
             'SELECT SALDOQTDEINVCART, SALDOVLRINVCART '+
             'FROM HISTCARTINV '+
             'WHERE   	(IDCARTEIRAINVEST  ='+IntToStr(QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger)+') AND '+
             '         (IDINVESTIMENTO    ='+QryPrincipal.FieldByName('IDINVESTIMENTO').AsString+')             AND '+
             '         (((DATAMOVCARTINV  = TO_DATE('''+QryPrincipal.FieldByName('DATAOPERACAO').AsString+''',''DD/MM/YYYY'')) 	   AND '+
             '         ((IDOPERACAOINVEST < '+QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+')OR  '+
             '         (IDOPERACAOINVEST IS NULL)) ) '+
             '         OR (DATAMOVCARTINV < TO_DATE('''+QryPrincipal.FieldByName('DATAOPERACAO').AsString+''', ''DD/MM/YYYY'')) ) AND  '+
             '         (SALDOVLRINVCART IS NOT NULL)         '+
             'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC ');
// Guarda Saldos
    wDecimal         := DecimalSeparator;
    DecimalSeparator := '.';
    wSaldoAntVlr     := QryLocalAux.FieldByName('SALDOVLRINVCART').AsFloat;
    wSaldoAntQtd     := QryLocalAux.FieldByName('SALDOQTDEINVCART').AsFloat;
    DecimalSeparator := wDecimal;
// Monta Campos Virtuais
    wSQL:= ''''+
      QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+'''  AS IDOPERACAOINVEST, '''+
      '2'' AS  IDTIPOINVEST, '''+
      FloatToStr(wSaldoAntVlr)+'''  AS SLDANTVLRINV, '''+
      FloatToStr(wSaldoAntQtd)+'''  AS SLDANTQTDINV, '''+
      QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsString+'''  AS IDCARTEIRAINVEST, '''+
      QryPrincipal.FieldByName('IDTIPOOPERACAO').AsString+'''    AS IDTIPOOPERACAO,  '''+
      QryPrincipal.FieldByName('IDINVESTIMENTO').AsString+'''    AS IDINVESTIMENTO,  '''+
      QryPrincipal.FieldByName('DATAOPERACAO').AsString+'''      AS DATAOPERACAO,    '''+
      QryPrincipal.FieldByName('DATAVENCOPER').AsString+'''      AS DATAVENCOPER,    '''+
      QryPrincipal.FieldByName('NUMDOCUMENTO').AsString+'''      AS NUMDOCUMENTO,    '''+
      QryPrincipal.FieldByName('IDCORRETVALORES').AsString+'''   AS IDCORRETVALORES, '''+
      TrocaVirgulaPonto(QryPrincipal.FieldByName('QTDEOPERACAO').AsString)+'''      AS QTDEOPERACAO,   '''+
      TrocaVirgulaPonto(QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsString)+''' AS  PRECOUNITOPERACAO, '''+
      TrocaVirgulaPonto(QryPrincipal.FieldByName('VLROPERACAO').AsString)+'''       AS VLROPERACAO,    '''+
      QryPrincipal.FieldByName('IDCUSTODIANTE').AsString+'''     AS IDCUSTODIANTE,   '''+
      QryPrincipal.FieldByName('IDINSTFIN').AsString+'''         AS IDINSTFIN,       '''+
      QrySubTipo.FieldByName('SALDOTIT').AsString+'''            AS IDBOLSAVALORES,  '''+
      QrySubTipo.FieldByName('IDREGRACALCUSADA').AsString+'''    AS IDREGRACALCUSADA,  '''+
      QrySubTipo.FieldByName('VLRAGIOOPER').AsString+'''         AS IDEMISSOR          ';
  End;
//------------------------------------------------------------
// Processamento da Pagina 4 (Despesas)
  If PageControl1.ActivePage = TS4 Then Begin
// Mostra Grid da Pagina de Despesas
    PnlDespesas.Visible  := False;
    GridDespesas.Visible := True;
    If DbLkcTipoOperacao.Text = '' Then Begin
      ShowMessage('Operação Não foi Escolhida ... ');
      PageControl1.ActivePage:=TS1;
      Exit;
    End;
// Vefirica se Existem Dados
    FazQuery(QryAux,'SELECT IDOPERACAOINVEST FROM DESPOPERINVEST WHERE (IDOPERACAOINVEST = '''+
                     QryPrincipal.FieldByName('IDOPERACAOINVEST').AsString+''')');
// Caso Já Existam Dados Não Transfere
    If (QryAux.IsEmpty) And (SbtnInserir.Down) Then Begin
// Liga Animate
      Animate2.Visible := True;
      Animate2.Active  := True;

// Busca Dados
      FazQuery(QryAux,
        'SELECT DT.IDTIPOINVEST,    DT.IDTIPOOPERACAO,  DT.IDTIPODESPINVEST, '+
        '       DT.IDREGRACALCDESP, DT.IDREGRADATAVENC, DT.FLGCALCDIARIO,'+
        '       TI.TIPCREDOR,       FXD.EMPRESAPROP,    FXD.IDFORCLI '+

        'FROM DESPESASXTIPOOPER DT, TIPODESPINVEST TI, FORCLIXDESPINVEST FXD '+

        'WHERE (DT.IDTIPOOPERACAO =  '''+
          QryPrincipal.FieldByName('IDTIPOOPERACAO').AsString  +''') AND '+
        '      (DT.IDTIPODESPINVEST >= 0)  AND '+
        '      (DT.IDTIPODESPINVEST= TI.IDTIPODESPINVEST)  AND '+
        '      (TI.IDTIPODESPINVEST= FXD.IDTIPODESPINVEST(+)) AND'+
        '      (FXD.EMPRESAPROP(+) = '''+IntToStr(Sistema.IdEmpresa)+''')');

// Abre Qry de Despesas
      QryDespesasOperacao.Open;
// Transfere Dados das Despesas Calculando Valores
      While Not QryAux.EOF Do Begin

// Calcula o Valor Total das Operacoes do Corretor desta Despesa
        wVlrTotCorretor := 0;
        FazQuery(QryLocalAux,
           ' SELECT  SUM(OI.VLROPERACAO)     '+
           ' FROM DESPOPERINVEST DI, OPERACAOINVEST OI      '+
           ' WHERE 	(OI.IDCORRETVALORES  = '''+
             QryPrincipal.FieldByName('IDCORRETVALORES').AsString+''') AND  '+
           '         (DI.IDTIPODESPINVEST = '''+
             QryAux.FieldByName('IDTIPODESPINVEST').AsString+''') AND '+
           '         (OI.DATAOPERACAO     = TO_DATE('''+DateToStr(
             QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime)+''',''DD/MM/YYYY'')) AND '+
           '       	(DI.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) ');
// Guarda Valor Total do Corretor
        wVlrTotCorretor := (QryLocalAux.FieldByName('SUM(OI.VLROPERACAO)').AsFloat+
                          QryPrincipal.FieldByName('VLROPERACAO').AsFloat);

// Finaliza montagem SQL da Regra
// Abre Query da Regra
        wDecimal := DecimalSeparator;
        DecimalSeparator := '.';
        FazQuery(QryRegra,
                'SELECT '+FloatToStr(wVlrTotCorretor) +' AS VALTOTCORRET, '+wSQL+' FROM DUAL');
        DecimalSeparator := wDecimal;

// Inclui Registro
        QryDespesasOperacao.Insert;
        QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger :=
          LeUltRegistro(Nil,'DESPOPERINVEST');
// Caso Exista Regra Associada Executa
        If (QryAux.FieldByName('IDREGRACALCDESP').AsString <> '') And
           (QryAux.FieldByName('FLGCALCDIARIO').AsInteger = 0) Then Begin
// Executa a Regra de Caclulo do Valor Despesas
          Regra.DatabaseName:='BaseDados';
          Regra.RuleName := QryAux.FieldByName('IDREGRACALCDESP').AsString;
          Regra.QueryIn  := QryRegra;
          Try
            Regra.Execute;
          Except
            On E:Exception Do Begin
              MsgDlg('Erro ao calcular a Rubrica, "'+
                     QryAux.FieldByName('DESCTIPODESPINV').AsString+
                     '", Regra: '+QryAux.FieldByName('IDREGRACALCDESP').AsString+
                     ' com a mensagem:'+#13+#13+E.Message,
                     'Mensagem do Sistema', MtError,[MbOk],0);
              BbtnCancelar.Click;
              Exit;
            End;
          End;
// Preenche dados
          QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat :=
            StrToFloat(TrocaPontoVirgula(Regra.Result));
        End;
// Data de Vencimento da  Despesa = Data de Vencimento da Operacao
        QryDespesasOperacao.FieldByName('DATAVENCDESPOPER').AsDateTime :=
          StrToDate(DBDateEdit4.Text);
        QryDespesasOperacao.FieldByName('DATAOPERACAO').AsDateTime :=
          StrToDate(DBDateEdit1.Text);
// Caso Exista Regra Associada Executa
        If (QryAux.FieldByName('IDREGRADATAVENC').AsString <> '') And
           (QryAux.FieldByName('FLGCALCDIARIO').AsInteger = 0) Then Begin
// Executa a Regra de Caclulo do Valor Despesas
          Regra.DatabaseName:='BaseDados';
          Regra.RuleName := QryAux.FieldByName('IDREGRADATAVENC').AsString;
          Regra.QueryIn  := QryRegra;
// Tenta Executar a Regra
          Try
            Regra.Execute;
          Except
            BbtnCancelar.Click;
            Exit;
          End;
// Preenche dados
          QryDespesasOperacao.FieldByName('DATAVENCDESPOPER').AsDateTime :=
            StrToDate(Regra.Result);
        End;
// Continua a Inclusao dos Registros
        QryDespesasOperacao.FieldByName('IDOPERACAOINVEST').AsInteger :=
          QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger;
        QryDespesasOperacao.FieldByName('IDTIPOINVEST').AsInteger     := 1;
        QryDespesasOperacao.FieldByName('IDTIPOOPERACAO').AsInteger   :=
          QryPrincipal.FieldByName('IDTIPOOPERACAO').AsInteger;
        QryDespesasOperacao.FieldByName('IDTIPODESPINVEST').AsInteger :=
          QryAux.FieldByName('IDTIPODESPINVEST').AsInteger;
        QryDespesasOperacao.FieldByName('IDREGRACALCUSADA').AsString  :=
          QryAux.FieldByName('IDREGRACALCDESP').AsString;
        QryDespesasOperacao.FieldByName('IDREGRAVENCUSADA').AsString  :=
          QryAux.FieldByName('IDREGRADATAVENC').AsString;
        QryDespesasOperacao.FieldByName('FLGCALCDIARIO').AsInteger    :=
          QryAux.FieldByName('FLGCALCDIARIO').AsInteger;

// Busca Credor da Despesa caso Tipo de Credor
        If QryAux.FieldByName('TIPCREDOR').AsString <> '' Then Begin
// Atualiza Empresa Propria
          QryDespesasOperacao.FieldByName('EMPRESAPROP').AsInteger :=
            Sistema.IdEmpresa;
// Atualiza de acordo Emissor/Corretor
          If QryAux.FieldByName('TIPCREDOR').AsString = 'CO'Then Begin
// Transforma Corretor em Fornecedor
             Try
               Documento.ForCli.Inserir(QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger,
                                        Sistema.IdEmpresa,
                                        -1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                        '','','','','F',False);
             Except
             End;
             QryDespesasOperacao.FieldByName('IDFORCLI').AsInteger :=
               QryPrincipal.FieldByName('IDCORRETVALORES').AsInteger;
          End Else Begin
// Transforma Emissor em Fornecedor
             Try
               Documento.ForCli.Inserir(QryTitRenFixa.FieldByName('IDEMISSOR').AsInteger,
                                        Sistema.IdEmpresa,
                                        -1,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                        '','','','','F',False);
             Except
             //
             End;
             QryDespesasOperacao.FieldByName('IDFORCLI').AsInteger :=
               QryTitRenFixa.FieldByName('IDEMISSOR').AsInteger;
          End;
// Caso Credor
        End Else Begin
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
          ShowMessage('Erro ao Transferir Rubricas ... ');
          Exit;
        End;
// Proximo Registro
        QryAux.Next;
      End;
// Inabilita Lkc de Tipo de Operacao e Corretor
      If Ds.State In ([DsInsert,DsEdit]) Then Begin
        DbLkcTipoOperacao.Enabled  := False;
        DbLkcBuscaCorretor.Enabled := False;
        DBEdit3.Enabled            := False;
        DBEdit4.Enabled            := False;
        EdtObs.Enabled             := False;
// ReAbre Tabela Pessoa
        If (Not QryBuscaCredor.Active) Then Begin
          QryBuscaCredor.Close;
          QryBuscaCredor.Open;
        End;
      End;
    End Else Begin
// Inabilita Lkc de Tipo de Operacao e Corretor
      If Ds.State In ([DsInsert,DsEdit]) Then Begin
        DbLkcTipoOperacao.Enabled  := False;
        DbLkcBuscaCorretor.Enabled := False;
        DBEdit3.Enabled            := False;
        DBEdit4.Enabled            := False;
        edtObs.Enabled             := False;
// ReAbre Tabela Pessoa
        If (Not QryBuscaCredor.Active) Then Begin
          QryBuscaCredor.Close;
          QryBuscaCredor.Open;
        End;
      End;
    End;
// Abre a Query de Despesas
    QryDespesasOperacao.Close;
    QryDespesasOperacao.ParamByName('IDOPERACAOINVEST').AsInteger :=
      QryPrincipal.FieldByName('IDOPERACAOINVEST').AsInteger;
    QryDespesasOperacao.Open;
// Desliga Animate
    Animate2.Visible := False;
    Animate2.Active  := False;
  End;
// Fecha a Query da Regra
  QryRegra.Close;
end;

//----------------------------------------------------------
// Alterar Detalhe do Imposto
procedure TFrmCadOperRenFixa.sbtnAltDetClick(Sender: TObject);
begin
// Caso não editando sai
  If Ds.State In ([dsBrowse]) Then Begin
    Exit;
  End;
// Caso Tabela Vazia Sai
  If QryImpostosOperacao.IsEmpty Then Begin
    Exit;
  End;
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
procedure TFrmCadOperRenFixa.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Mostra Grid
  PnlImpostos.Visible  := False;
  GridImpostos.Visible := True;
// Cancela Alteracoes
  QryImpostosOperacao.Cancel;
end;

//-----------------------=-----------------------------------
// Confirma Detalhe do Imposto
procedure TFrmCadOperRenFixa.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
// Mostra Grid
  PnlImpostos.Visible  := False;
  GridImpostos.Visible := True;
// Cancela Alteracoes
  QryImpostosOperacao.Post;
end;

//----------------------------------------------------------
// Alterar Detalhe Despesa
procedure TFrmCadOperRenFixa.BtAltDespClick(Sender: TObject);
begin
  inherited;
// Caso não edtando sai
  If Ds.State In ([dsBrowse]) Then Begin
    Exit;
  End;
// Caso Tabela Vazia Sai
  If QryDespesasOperacao.IsEmpty Then Begin
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
  DbLckCredor.SetFocus;
// Variavel Recebe o Valor Original do Campo
  wValorRegra:=QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat;
end;

//----------------------------------------------------------
// Confirma Detalhe de Despesa
procedure TFrmCadOperRenFixa.BtOkDetDespClick(Sender: TObject);
begin
  inherited;
// Critica Dados
  If (DbLckCredor.Text  = '') Then Begin
    ShowMessage('Faltam Preencher Campos .....');
    DbLckCredor.SetFocus;
    Exit;
   End;
// Mostra Grid
  PnlDespesas.Visible := False;
  GridDespesas.Visible:= True;
// Cancela Alteracoes
  QryDespesasOperacao.Post;
end;

//----------------------------------------------------------
// Cancela Detalhe de Despesa
procedure TFrmCadOperRenFixa.BtCancDetDespClick(Sender: TObject);
begin
  inherited;
// Mostra Grid
  PnlDespesas.Visible := False;
  GridDespesas.Visible:= True;
// Cancela Alteracoes
  QryDespesasOperacao.Cancel;
end;

//------------------------------------------------------------------------
// Precionar Tecla no Valor do Imposto ou Despesa
procedure TFrmCadOperRenFixa.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

//------------------------------------------------------------------------
// Quando Mudar no Campo de Qtd por Lote de Acao ..
procedure TFrmCadOperRenFixa.DBEdit20Change(Sender: TObject);
begin
  inherited;
  If DbLkcTitRenFixa.Text = '' Then Begin
    DbEdit2.Text := '';
  End;
end;

procedure TFrmCadOperRenFixa.DBEdit7Exit(Sender: TObject);
begin
  inherited;
// Caso Inserindo
//  If sbtnInserir.Down Then Begin
// Testa se o Valor Informado é Valido caso exista Regra
    If QryDespesasOperacao.FieldByName('IDREGRACALCUSADA').AsString <> '' Then Begin
      If Not TestaValor((wValorRegra-
             QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat))
        Then Begin
        ShowMessage('Valor Informado menor que o permitido .');
        QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat:=wValorRegra;
        DbEdit7.SetFocus;
      End;
    End;
//  End;
end;

procedure TFrmCadOperRenFixa.DBEdit6Exit(Sender: TObject);
begin
  inherited;
// Caso Inserindo
  If sbtnInserir.Down Then Begin
// Testa se o Valor Informado é Valido caso exista Regra
    If QryImpostosOperacao.FieldByName('IDREGRACALCUSADA').AsString <> '' Then Begin
      If Not TestaValor((wValorRegra-
             QryImpostosOperacao.FieldByName('VLRIMPOSTOOPER').AsFloat))
        Then Begin
        ShowMessage('Valor Informado menor que o permitido .');
        QryImpostosOperacao.FieldByName('VLRIMPOSTOOPER').AsFloat:=wValorRegra;
        DbEdit6.SetFocus;
      End;
    End;
  End;
end;

//------------------------------------------------------------------------------
Procedure TFrmCadOperRenFixa.DbLkcTipoOperacaoChange(Sender: TObject);
Var
  RecSaldos : TRecSaldos;
Begin
   Inherited;
   If (DbLkcTipoOperacao.Text <> '') And (QryPrincipal.State In [DsEdit, DsInsert]) Then
   Begin
      QryPrincipal.FieldByName('DATAVENCOPER').AsDateTime :=
      CalculaVencimento(StrToDate(DBDateEdit1.Text),
      QryBuscaOperacao.FieldByName('VENCIMENTO').AsInteger);
      // Caso o Tipo da Operacao seja Diferente de de Compra (A) Busca o Saldo Final deste Investimento e
      // Apresenta como default
      If QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString <> 'A' Then
      Begin
         // Busca Saldos desse Investimento/Lote
         RecSaldos := OperacaoInvest.BuscaSaldosLote(wIdInvestimento, wIdLote, wDtOperacao);
         // Caso Tenha Saldos, Preenche os Campos ....
         If RecSaldos.DataSaldo <> 0 Then
         Begin
            wQtdOperacao := RecSaldos.SldQtdInvCart;
            wVlrOperacao := RecSaldos.SldVlrInvCart;
            QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat:=RecSaldos.SldQtdInvCart;
            QryPrincipal.FieldByName('VLROPERACAO').AsFloat :=RecSaldos.SldVlrInvCart;
         End;
      End;
   End;
      // Sé for venda calcular o IR
   If QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
   Begin
      Label20.Visible:=True;
      DBEdit10.Visible:=True;
   End
   Else
   Begin
      Label20.Visible:=False;
      DBEdit10.Visible:=False;
   End;
End;

//------------------------------------------------------------------------------
// Calcula Data com numero de dias "Uteis" da Inical
Function TFrmCadOperRenFixa.CalculaVencimento(DataInicial:TDateTime;
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

    If DayOfWeek(wDataLocal) = 7 Then Begin
      wDataLocal:= wDataLocal+1;
    End;
// Caso Domingo Soma 1 dia
    If DayOfWeek(wDataLocal) = 1 Then Begin
      wDataLocal:= wDataLocal + 1;
    End;
// Caso seja Feriado Soma 1 dia
    if (DiasUteisInv.DiaUtil(wDataLocal,-1,1,'',True,False,False) = False) and
       (DayOfWeek(wDataLocal) <> 1) and (DayOfWeek(wDataLocal) <> 7) then begin
      wDataLocal:= wDataLocal + 1;
    End;
  End;

  If DayOfWeek(wDataLocal) = 7 Then Begin
    wDataLocal:= wDataLocal+1;
  End;
// Caso Domingo Soma 1 dia
  If DayOfWeek(wDataLocal) = 1 Then Begin
    wDataLocal:= wDataLocal + 1;
  End;
// Caso seja Feriado Soma 1 dia
  if (DiasUteisInv.DiaUtil(wDataLocal,-1,1,'',True,False,False) = False) and
     (DayOfWeek(wDataLocal) <> 1) and (DayOfWeek(wDataLocal) <> 7) then begin
    wDataLocal:= wDataLocal + 1;
  End;

  Result:=wDataLocal;
end;

//------------------------------------------------------------------------------
// Criar Novo Titulo de Renda Fixa
procedure TFrmCadOperRenFixa.BtCriaTituloClick(Sender: TObject);
begin
  inherited;
// Chama o cadastro de Titulos de Renda Fixa
//  AbrirFormModal(FrmCadTitRenFix,TFrmCadTitRenFix);
//  QryTitRenFixa.Close;
//  QryTitRenFixa.Open;
end;

procedure TFrmCadOperRenFixa.DBEdit4KeyPress(Sender: TObject;  var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

//------------------------------------------------------------------------------
// Mudanca na DbEdit5, Calcula o Preco Unitario da Operacao
procedure TFrmCadOperRenFixa.DBEdit5Change(Sender: TObject);
begin
   inherited;
   // Calcula Valor da Operacao
   If (Ds.DataSet.State In [DsInsert,DsEdit]) And (DbEdit3.Text <> '')
       And ((DbEdit4.Text = '') Or (DbEdit4.Text = '0,00'))  Then
   Begin
      Try
      // Calcula Quantidade da Operacao
      If wIdClasseTitRenFix = 2 Then
      Begin
         // Caso FUNDOS
         If QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat <> 0 Then
            QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat :=
           (QryPrincipal.FieldByName('VLROPERACAO').AsFloat/
            QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat)
      End Else If (wIdClasseTitRenFix <> 2) Then Begin
      // Caso Contrario
      QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat:=
          (QryPrincipal.FieldByName('VLROPERACAO').AsFloat/
           QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat);
      End;
    Except
       QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat:=1;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmCadOperRenFixa.DbLkcCarteiraExit(Sender: TObject);
begin
  inherited;
// Acerta Pagina
//  If (DblkcCarteira.Text <> '') And (Sbtninserir.Down = True) And
//     (QryPrincipal.FieldByName('VLROPERACAO').AsFloat <> 0) And
//     (QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat <> 0) And
//     (QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat <> 0)
//   Then Begin
//    PageControl1.ActivePage := TS4;
//    PageControl1Change(Self);
//  End;
end;

//------------------------------------------------------------------------------
procedure TFrmCadOperRenFixa.BtNovoDocClick(Sender: TObject);
begin
  inherited;
// Cria Numeracao do Documento
  QryPrincipal.FieldByName('NUMDOCUMENTO').AsString:=
    'RF-'+Copy(DBDateEdit1.Text,9,2)+'/'+FormatFloat('0000',LeUltRegistro(Nil,'CONTDOCRENFIX'+Copy(DBDateEdit1.Text,9,2)));
//    'RF-'+Copy(DateToStr(Date),8,2)+'/'+FormatFloat('0000',LeUltRegistro(Nil,'CONTDOCRENFIX'));
  wNumDoc:=QryPrincipal.FieldByName('NUMDOCUMENTO').AsString;
end;

//------------------------------------------------------------------------------
procedure TFrmCadOperRenFixa.bbtnSairClick(Sender: TObject);
begin
  If QryPrincipal.State In [DsInsert, DsEdit] Then Begin
    If (MsgDlg('Deseja realmente Sair ?',
      'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = MrNo)
      Then Begin
        Exit;
    End;
  End;
// Caso exista uma transação em aberto, Cancela
  If DtmBaseDados.dbBaseDados.InTransaction Then
    DtmBaseDados.dbBaseDados.RollBack;

  inherited;
  FrmCadOperRenFixa.ModalResult:=MrCancel;
  wBtRetorno       := 'SAIR';
end;


Procedure TFrmCadOperRenFixa.AlimentaCarteiraDespRendaFixa;
Var
  wPlanilha, wPlano, wDocumento : Integer;
  wHistorico, wMensErro :String;
Begin
// Pula ao Primeiro Registro das Despesas
  QryDespesasOperacao.First;
// Faz Todas as Despesas
  While Not QryDespesasOperacao.EOF Do Begin
    wPlanilha :=-1;
    wPlano    :=-1;
    wDocumento:=-1;
    Try

// Alimenta Carteira com as Despesas
      If (QryDespesasOperacao.FieldByName('NATOPERDESP').AsString <> 'N') Then Begin
        If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
            QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 1, wIdPrincipal, -1,
            QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
            QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
            0{IDCARTEIRAGERENC},            
            QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger, -1,
            wPlanilha, wDocumento, wPlano,
            QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
            QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
            QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat,
            wQtdCotaini, 0 {Juros}, 0, 0, 0, 0, 0, 0, 0, 0,
            QryDespesasOperacao.FieldByName('NATOPERDESP').AsString,
            QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString,
            wIdLote,
            QryDespesasOperacao.FieldByName('DESCDESP').AsString+' / '+
              QryDespesasOperacao.FieldByName('DESCINVESTIMENTO').AsString,
            'DOP','', '', True,
            -1, iPlanPrevCtbPatro,iIdHistCartInv) Then Begin
            Exit;
        End;
      End;
    Except;
      Raise;
    End;
// Proximo Registro de Despesa
    QryDespesasOperacao.Next;
  End;
End;

procedure TFrmCadOperRenFixa.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
// Troca Ponto por Virgula
  If Key = '.' Then Key := ','
end;

procedure TFrmCadOperRenFixa.BtMostraCotClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadCotacaoInvest, FrmCadCotacaoInvest);

// Altera para Normal e Mostra Formulario
  FrmCadCotacaoInvest.FormStyle := FsNormal;
  FrmCadCotacaoInvest.Visible   := False;
  FrmCadCotacaoInvest.Top       := 99;
  FrmCadCotacaoInvest.bbtnConfirmar.ModalResult:=MrNone;

  FrmCadCotacaoInvest.wEmOperacao     := True;
  FrmCadCotacaoInvest.wIdInvestimento := QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger;
  FrmCadCotacaoInvest.wDataCotacao    := StrToDate(DBDateEdit1.Text);

  FrmCadCotacaoInvest.ShowModal;

// Preenche Valor Contabil
  QryPrincipal.FieldByName('PRECOUNITOPERACAO').AsFloat :=
    FrmCadCotacaoInvest.wVlrCotacaoInvestimento;
//  BtMostraCot.Visible:=False;
// Libera Formulario
  FrmCadCotacaoInvest.Free;

{
  QrySeleciona.Close;
  QrySeleciona.ParamByName('IDEMISSOR').AsString      :=
       QryInvestimento.FieldByName('IDEMISSOR').AsString;
  QrySeleciona.ParamByName('IDACAO').AsString         :=
        QryInvestimento.FieldByName('IDINVESTIMENTO').AsString;
  QrySeleciona.Open;

  If Not(QrySeleciona.FieldByName('DATACOTAACAO').IsNull) Then Begin
     FrmCadCotacaoAcao.wDtMov   := QrySeleciona.FieldByName('DATACOTAACAO').AsDateTime;
     FrmCadCotacaoAcao.wBolsa   := QrySeleciona.FieldByName('IDBOLSAVALORES').AsString;
     FrmCadCotacaoAcao.ShowModal;
  End Else Begin
      // Se não achar nada, dá mensagem
        MsgDlg('Não existe cotação para este investimento!',
           'Mensagem do Sistema ',mtWarning,[MbOk],0);
  End;
}

end;

Procedure TFrmCadOperRenFixa.DBEdit5Exit(Sender: TObject);
Var
   wSaldoQtd,wSaldoInutil,wSaldoAqui,wSaldoIRApu  :Double;
Begin
   inherited;
   // Calcula Imposto de Renda
   // Buscar o mercado
   // Apurar o saldo para calcular o IR e gravar no OPERACAOINVEST
   If (DbEdit3.Text <> '') And (DbLkcCarteira.Text<>'') And (DbEdit5.Text <> '') And
      (DbEdit4.Text <> '0') Then
   Begin
      If QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
      Begin
         //AL_1
         //AL_2
         OperComum.BuscaTodosSaldosInvestLote(
                 QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                 0{IDCARTEIRAGERENC},                 
                 wIdInvestimento,9999999,-1,wIdLote,
                 DateToStr(QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime), -1,
                 wSaldoQtd, wSaldoInutil, wSaldoInutil, wSaldoInutil,wSaldoAqui,
                 wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                 wSaldoIRApu,  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                 wSaldoInutil, wSaldoInutil, wSaldoInutil);

         fVlrRendimento := 0;
         QryPrincipal.FieldByName('VLRIR').AsFloat :=
                Impostos.CalculaIr(1,
                      QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger, 0{CARTEIRAGERENC},
                      QryPrincipal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                      QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                      QryBuscaOperacao.FieldByName('IDMERCADO').AsInteger,
                      QryPrincipal.FieldByName('IDLOTE').AsString,
                      QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                      QryPrincipal.FieldByName('DATAOPERACAO').AsDateTime,
                      (QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat*(wSaldoAqui/wSaldoQtd)),
                       QryPrincipal.FieldByName('VLROPERACAO').AsFloat,
                       0,'S','G',fVlrRendimento);
          // Verifica se existe provisionamento de IR
          wVlrIRProv:=0;
          If Impostos.BuscaProvisaoIR(2,QryPrincipal.FieldByName('IDINVESTIMENTO').AsInteger) then
            wVlrIRProv := ((wSaldoIRApu / wSaldoQtd)* QryPrincipal.FieldByName('QTDEOPERACAO').AsFloat )* -1;
      End;
   End;
End;

end.

// **--> By Alexandre Ramos, The Analyst;



