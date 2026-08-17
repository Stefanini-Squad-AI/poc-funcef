//******************************************************************************
// Data      : 23/06/2008
// Código    : AL_9
// Pendencia : 27993
// SOL       : 86376
// Motivo    : Ajuste na rotina de exclusão das ações
//******************************************************************************
// Data      : 05/05/2008
// Código    : AL_8
// Pendencia : 27993
// SOL       : 86376
// Motivo    : Implementação de ajuste na exclusão da ação para indetificar o motivo
//             pelo qual o registro não pode ser excluido.
//******************************************************************************
// Data      : 11/09/2007
// Código    : AL_7
// Motivo    : Implementação da MarcarFlag, quando alterado a quantidade do lote,
//             essa ação devrá ser atualizada
//******************************************************************************
// Data      : 29/08/2007
// Código    : AL_6
// Pendencia : 25707
// SOL       : 47728
// Motivo    : Alteração do campo sigla para Código de Negociação
//******************************************************************************
// Data      : 15/08/2007
// Código    : AL_5
// Pendencia : 26114
// Motivo    : Ajuste no layout da tela
//             Libera o combo de Moeda para digitação
//             Melhora nas mensagens do sistema
//******************************************************************************
// Data     : 01/03/2005
// AL_4
// Motivo   : Alterada a FLGATIVO para um um DBCHECKBOX, onde ó marcado é
//              Ativo('S') e o Inativo(NULL ou 'N')
//******************************************************************************
// Data     : 21/01/2005
// AL_3
// Motivo   : Implementação dos campos FLGINVESTPRP e IDINVESTPRP para tratamento
//            de Investimentos de Provisão de perda
//******************************************************************************
// Data     : 02/12/2004
// AL_2
// Motivo   : Acerta as cotacoes posteriores cadastradas qdo trocar o Lote de
//              Negociacoa
//******************************************************************************
// Data     : 25/08/2004
// Função   :
// Linha(s) : Alt_1
// Motivo   : Cadastra ou altera ação na tabela ACAO
//******************************************************************************
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Cadastro doi e Acoes e Associacao com Bolsas
// Form     .: FrmCadastraAcao - Unit .: FCadastraAcao
// Data     .: 11/03/1999
//******************************************************************************

unit FCadastraAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Mask,
  DBCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, IvDictio, IvMulti,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList,
  IvEMulti, TREdit, FCadastroCSInv, fcLabel;

type
  TFrmCadastraAcao = class(TfrmCadastroCSInv)
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    DsInvestimento: TwwDataSource;
    DbLkcEmissor: TwwDBLookupCombo;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Dock973: TDock97;
    Label13: TLabel;
    tb97BotoesDetalhe: TToolbar97;
    BtInserir: TSpeedButton;
    BtAlterar: TSpeedButton;
    BtExcluir: TSpeedButton;
    pnlAcoesXEmissor: TPanel;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    GrdDetalhe: TwwDBGrid;
    DbLkcMoeda: TwwDBLookupCombo;
    Label2: TLabel;
    dbeInvestimento: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    QryMoeda: TwwQuery;
    DsEmissor: TwwDataSource;
    QryAux: TwwQuery;
    QryAcao: TwwQuery;
    DsAcao: TwwDataSource;
    DbLkcTipoAcao: TwwDBLookupCombo;
    Label5: TLabel;
    QryTipoAcao: TwwQuery;
    TabSheet2: TTabSheet;
    pnlAssociacoes: TPanel;
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    BtOkDet2: TBitBtn;
    BtCancDet2: TBitBtn;
    BtVoltaDet2: TBitBtn;
    GrdDetalhe2: TwwDBGrid;
    Dock976: TDock97;
    Label7: TLabel;
    Toolbar973: TToolbar97;
    BtIncDet2: TSpeedButton;
    BtAltDet2: TSpeedButton;
    BtDelDet2: TSpeedButton;
    QryAcaoBolsa: TwwQuery;
    DsAcaoBolsa: TwwDataSource;
    QryBolsaValores: TwwQuery;
    DbLkcBolsaValores: TwwDBLookupCombo;
    Label8: TLabel;
    DbLkcMoedaBolsa: TwwDBLookupCombo;
    Label9: TLabel;
    dbeQtdLote: TDBEdit;
    Label10: TLabel;
    QryAcaoBolsaIDBOLSAVALORES: TFloatField;
    QryAcaoBolsaIDEMISSOR: TFloatField;
    QryAcaoBolsaIDACAO: TFloatField;
    QryAcaoBolsaMOECODIGO: TFloatField;
    QryAcaoBolsaQTDELOTE: TFloatField;
    QryAcaoBolsaSIGLAACAOBOLSA: TStringField;
    QryAcaoBolsaNOMEBOLSAVALORES: TStringField;
    dbeSiglaBolsa: TDBEdit;
    Label11: TLabel;
    TabSheet3: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet3: TSpeedButton;
    BtAltDet3: TSpeedButton;
    BtDelDet3: TSpeedButton;
    pnlEnquadramento: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet3: TBitBtn;
    BtCancDet3: TBitBtn;
    BtVoltaDet3: TBitBtn;
    DbLkcTabClassif: TwwDBLookupCombo;
    DbLkcClassif: TwwDBLookupCombo;
    GrdDetalhe3: TwwDBGrid;
    QryEnquadramento: TwwQuery;
    DsEnquadramento: TwwDataSource;
    QryTabClassif: TwwQuery;
    QryClassificacao: TwwQuery;
    QryEnquadramentoIDINVESTIMENTO: TFloatField;
    QryEnquadramentoCODTABCLASSINV: TStringField;
    QryEnquadramentoCODCLASSINVEST: TStringField;
    QryEnquadramentoDESCTABCLASSIF: TStringField;
    QryEnquadramentoDESCCODCLASSIF: TStringField;
    QryClassificacaoTab: TwwQuery;
    Label16: TLabel;
    DbLkcCarteiraInvest: TwwDBLookupCombo;
    Label17: TLabel;
    QryCarteiraInvest: TwwQuery;
    QryEnquadramentoDTENQUADRA: TDateTimeField;
    QryEnquadramentoIDCARTEIRAINVEST: TFloatField;
    DBDateEdit1: TCMDateTimePicker;
    Label18: TLabel;
    QryEmissorSIGLAEMISSOR: TStringField;
    DBCKProvisionaIR: TDBCheckBox;
    qryParamInvest: TwwQuery;
    updAcao: TUpdateSQL;
    dbCodISIN: TDBEdit;
    Label6: TLabel;
    QryAcaoBolsaCUSTO_RET: TFloatField;
    dbeCustoRet: TDBRealEdit;
    Label12: TLabel;
    Label19: TLabel;
    dblCarteiraSPC: TwwDBLookupCombo;
    qryCarteiraSPC: TwwQuery;
    qryCarteiraSPCIDCARTEIRASPC: TFloatField;
    qryCarteiraSPCDESCARTEIRASPC: TStringField;
    BtConsAcoesEmis: TSpeedButton;
    btConsAcoesBolsa: TSpeedButton;
    btConsAcoesEnq: TSpeedButton;
    dtIniLote: TCMDateTimePicker;
    lblDtIni: TLabel;
    qryInvestimento: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField5: TFloatField;
    qryInvestPRP: TwwQuery;
    StringField5: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField10: TFloatField;
    qryInvestPRPIDINVESTPRP: TFloatField;
    qryInvestPRPFLGINVESTPRP: TStringField;
    qryInvestimentoIDINVESTPRP: TFloatField;
    qryInvestimentoFLGINVESTPRP: TStringField;
    lblInvestPRP: TLabel;
    dblkInvestPRP: TwwDBLookupCombo;
    wwQuery1: TwwQuery;
    cbxFlgInvPRP: TCheckBox;
    cbxAtiva: TDBCheckBox;
    procedure BtInserirClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure QryInvestimentoAfterScroll(DataSet: TDataSet);
    procedure DbLkcTipoAcaoChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BtIncDet2Click(Sender: TObject);
    procedure BtAltDet2Click(Sender: TObject);
    procedure BtDelDet2Click(Sender: TObject);
    procedure BtCancDet2Click(Sender: TObject);
    procedure BtOkDet2Click(Sender: TObject);
    Function EmissorCadastrado: Boolean;
    procedure PageControl1Change(Sender: TObject);
    procedure DbLkcEmissorChange(Sender: TObject);
    procedure BtIncDet3Click(Sender: TObject);
    procedure BtAltDet3Click(Sender: TObject);
    procedure BtDelDet3Click(Sender: TObject);
    procedure BtOkDet3Click(Sender: TObject);
    procedure BtCancDet3Click(Sender: TObject);
    procedure DbLkcTabClassifChange(Sender: TObject);
    procedure DbLkcBolsaValoresChange(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    Procedure EnquadraTitulo;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryAcaoAfterPost(DataSet: TDataSet);
    procedure BtConsAcoesEmisClick(Sender: TObject);
    procedure btConsAcoesBolsaClick(Sender: TObject);
    procedure btConsAcoesEnqClick(Sender: TObject);
    procedure cbxFlgInvPRPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastraAcao: TFrmCadastraAcao;

implementation

//AL_7
uses DBaseDados,UDataBase,UMensErro, UBibliotecaInvest, USistema, uOperComum,
     URendaVariavel;

{$R *.DFM}

procedure TFrmCadastraAcao.BtInserirClick(Sender: TObject);
begin
  inherited;
  // Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
  BtConsAcoesEmis.Enabled:=False;
  // AL_3
  cbxFlgInvPRP.Checked := False;
  // Habilita OK
  bbtnOkDet.Enabled:=True;
  // Abre Transação
  If not DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.StartTransaction;
  // Inclui Registro
  QryInvestimento.Append;
  QryAcao.Append;
  // Preenche com Moeda Preferencial
  If FazQuery(QryAux,'SELECT MOECODIGO FROM PARAMINVEST') Then Begin
    QryInvestimento.FieldByName('IDMOEDACONTAB').AsInteger :=
      QryAux.FieldByName('MOECODIGO').AsInteger;
  End;
  // Atualiza Descricao da Acao
  QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString :=
    QryEmissor.FieldByName('SIGLAEMISSOR').AsString;
  QryInvestimento.FieldByName('FLGATIVO').AsString :='S';

  //AL_3
  OperComum.LimpaParametros(qryInvestPRP);
  qryInvestPRP.ParamByName('IDEMISSOR').AsInteger := QryInvestimento.FieldByName('IDEMISSOR').AsInteger;
  qryInvestPRP.Open;


  // Mostra Tela de Cadastro
  GrdDetalhe.Visible:=False;
  pnlAcoesXEmissor.Visible    :=True;
  qryParamInvest.Close;
  qryParamInvest.Open;
  If qryParamInvest.FieldByName('FLGPROVISIONAIRRV').AsString = 'S' Then
     DBCKProvisionaIR.Checked := True
  Else
     DBCKProvisionaIR.Checked := False;
end;

procedure TFrmCadastraAcao.BtAlterarClick(Sender: TObject);
begin
   // Caso Tabela vazia sai
   if QryInvestimento.IsEmpty then
   begin
     MsgDlg('Tabela está vazia ','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtAlterar.Down:=False;
     Exit;
   end;

   // Heranca
   inherited;
   // Inabilita Botoes
   BtInserir.Enabled:=False;
   BtExcluir.Enabled:=False;
   BtAlterar.Enabled:=False;
   BtConsAcoesEmis.Enabled:=False;
   // Habilita OK
   bbtnOkDet.Enabled:=True;
   // Mostra Tela de Alteracao
   GrdDetalhe.Visible:=False;
   pnlAcoesXEmissor.Visible :=True;
   // Abre Transação
   If not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   //AL_3
   OperComum.LimpaParametros(qryInvestPRP);
   qryInvestPRP.ParamByName('IDEMISSOR').AsInteger := QryEmissor.FieldByName('IDEMISSOR').AsInteger;
   qryInvestPRP.Open;

   // Edita Registro
   QryInvestimento.Edit;
   // AL_3
   if (QryInvestimento.FieldByName('FLGINVESTPRP').IsNull) or
      (QryInvestimento.FieldByName('FLGINVESTPRP').AsString = 'N')  then
      cbxFlgInvPRP.Checked := False
   else
   begin
      cbxFlgInvPRP.Checked := True;
      if ((not qryInvestimento.FieldByName('IDINVESTPRP').IsNull) and
          (qryInvestimento.FieldByName('IDINVESTPRP').AsInteger <> 0))then
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDINVESTIMENTO = ' + qryInvestimento.FieldByName('IDINVESTPRP').AsString );
         qryAux.Open;
         dblkInvestPRP.Text := qryAux.FieldByName('DESCINVESTIMENTO').AsString;
      end;
   end;
   If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
      DBCKProvisionaIR.Checked := False;
end;

//AL_9
procedure TFrmCadastraAcao.BtExcluirClick(Sender: TObject);
var bExclui: Boolean;
begin
  // Caso Tabela vazia sai
  If QryInvestimento.IsEmpty Then Begin
    MsgDlg('Tabela está vazia ','Mensagem do Sistema ',mtWarning,[mbOk],0);
    BtExcluir.Down:=False;
    Exit;
  End;
  // Heranca
  inherited;
  // Inabilita Botoes
  BtExcluir.Down:=False;
  // Confirma Exclusao ou Nao
  // Se Confirmar, Exclui Registro Posicionado
  If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',
    mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
    Exit;
  End;

  //AL_8
  // Inicia Transacao
  If not DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.StartTransaction;

  //AL_8   
  // Tenta Excluir Detalhes
  //AL_9 - Ini
  Try
    // (ACOESXBOLSA)
    QryAux.SQL.Clear;
     QryAux.SQL.Add('DELETE FROM ACOESXBOLSA WHERE IDACAO = ' + QryAcao.FieldByName('IDACAO').AsString);
    QryAux.ExecSQL;

    // (CLASSINVXINVEST)
    QryAux.SQL.Clear;
     QryAux.SQL.Add('DELETE FROM CLASSINVXINVEST WHERE IDINVESTIMENTO = ' + QryInvestimento.FieldByName('IDINVESTIMENTO').AsString);
    QryAux.ExecSQL;

    // (EMISSORXBOLSA)
     try
        //Testa se existem mais ações deste emissor
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT * FROM ACOESXBOLSA WHERE IDEMISSOR = ' + QryEmissor.FieldByName('IDEMISSOR').AsString);
        QryAux.Open;
        bExclui := QryAux.IsEmpty;
     finally
        QryAux.Close;
     end;
     if bExclui then
     begin
        //Exclui se não houverem mais ações deste emissor cadastradas
        QryAux.SQL.Clear;
        QryAux.SQL.Add('DELETE FROM EMISSORXBOLSA WHERE IDEMISSOR = ' + QryEmissor.FieldByName('IDEMISSOR').AsString);
        QryAux.ExecSQL;
     end;

     // (ACAO)
     If Not QryAcao.IsEmpty Then
        QryAcao.Delete;

     // (INVESTIMENTO)
     QryInvestimento.Delete;

     // Comita Transacao
     If DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.Commit;
       
  Except
     on E: Exception do
     begin
        If DtmBaseDados.dbBaseDados.InTransaction Then
           DtmBaseDados.dbBaseDados.Rollback;
        //AL_8
        MsgDlg('A Ação não pode ser excluida'+ #13 +
               'Mensagem: ' + E.Message, 'Mensagem do Sistema ', mtWarning , [mbOk], 0);
     end;
  End;
  //AL_9 - Fim
end;

procedure TFrmCadastraAcao.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   // Cancela Alteracao
   QryAcao.Cancel;
   QryInvestimento.Cancel;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;

   // Abre Query com o SubTipo
   If Not QryInvestimento.IsEmpty Then
   Begin
     QryAcao.Close;
     QryAcao.ParamByName('IDACAO').AsInteger :=
             QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
     QryAcao.Open;
   End;
   // Mostra Treeview
   pnlAcoesXEmissor.Visible    :=False;
   Label13.Visible   :=False;
   GrdDetalhe.Visible:=True;
   // Abilita Botoes
   BtInserir.Enabled:=True;
   BtExcluir.Enabled:=True;
   BtAlterar.Enabled:=True;
   BtConsAcoesEmis.Enabled:=True;
   bbtnOkDet.Enabled:=True;
   // Sobe Botoes
   BtInserir.Down:=False;
   BtExcluir.Down:=False;
   BtAlterar.Down:=False;
   BtConsAcoesEmis.Down:=False;
   // Esconde o Painel
   if GrdDetalhe.CanFocus then
      GrdDetalhe.SetFocus;
end;

procedure TFrmCadastraAcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Fecha Querys
  QryInvestimento.Close;
  // AL_3
  qryInvestPRP.Close;
  QryAcaoBolsa.Close;
  QryAcao.Close;
  QryEmissor.Close;
  QryMoeda.Close;
  QryTipoAcao.Close;
  QryTabClassif.Close;
  QryClassificacao.Close;
  QryCarteiraInvest.Close;
  qryCarteiraSPC.Close;
  inherited;
end;

procedure TFrmCadastraAcao.FormShow(Sender: TObject);
begin
  inherited;
  // Abre Querys
  PnlFundo.Enabled := True;
  QryInvestimento.Open;
  // AL_3
  qryInvestPRP.Open;
  QryAcao.Open;
  QryAcaoBolsa.Open;
  QryEmissor.Open;
  QryCarteiraInvest.Open;
  qryCarteiraSPC.Open;
  PageControl1.ActivePage := TabSheet1;
  DbLkcEmissor.Text := QryEmissor.FieldByName('SIGLAEMISSOR').AsString;
  QryMoeda.Open;
  QryTipoAcao.Open;
  QryBolsaValores.Open;
  QryTabClassif.Open;
  QryClassificacao.Open;
  // Inabilita Botoes
  sbtnInserir.Enabled:=False;
  sbtnAlterar.Enabled:=False;
  // Mostra Tela de Cadastro
  pnlAcoesXEmissor.Visible     :=False;
  GrdDetalhe.Visible :=True;
  pnlAssociacoes.Visible     :=False;
  GrdDetalhe2.Visible:=True;
  pnlEnquadramento.Visible     :=False;
  GrdDetalhe3.Visible:=True;
  If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     DBCKProvisionaIR.Checked := False;
  if Sistema.NomeEmpresa  = 'REFER' then
     PageControl1.Pages[2].TabVisible := True // Enquadramento
  else
     PageControl1.Pages[2].TabVisible := False;

end;

procedure TFrmCadastraAcao.bbtnOkDetClick(Sender: TObject);
begin
  //AL_5 - Ini
  if (cbxFlgInvPRP.Checked) and (Trim(dblkInvestPRP.Text) = '') then
  begin
     MsgDlg('Não foi informado o campo de Investimento Origem de PRP',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if dblkInvestPRP.CanFocus then
        dblkInvestPRP.SetFocus;
     Exit;
  end;

  if (DbLkcTipoAcao.Text = '') then
  begin
     MsgDlg('Falta preencher o Tipo de Ação', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if DbLkcTipoAcao.CanFocus then
        DbLkcTipoAcao.SetFocus;
     Exit;
  end;

  if (dbeInvestimento.Text = '')  then
  begin
     MsgDlg('Falta preencher o Investimento', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if dbeInvestimento.CanFocus then
        dbeInvestimento.SetFocus;
     Exit;
  end;
  if (DbLkcMoeda.Text = '') then
  begin
     MsgDlg('Falta preencher a Moeda', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if DbLkcMoeda.CanFocus then
        DbLkcMoeda.SetFocus;
     Exit;
  end;
  //AL_5 - Fim

  // Caso Inserindo, Insere no SubTipo.
  if BtInserir.Down then
  begin
     QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger := LeUltRegistro(Nil,'INVESTIMENTO');
     QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger   := 2;
     QryInvestimento.FieldByName('IDEMISSOR').AsInteger      := QryEmissor.FieldByName('IDEMISSOR').AsInteger;
     // SubTipo
     QryAcao.FieldByName('IDACAO').AsInteger                 := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
     QryAcao.FieldByName('CODTIPODIREITO').AsString          := 'AC';
  end
  //Alt_1
  Else if BtAlterar.Down then
  begin
     // SubTipo
     QryAcao.Edit;
     QryAcao.FieldByName('IDACAO').AsInteger                 := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
     QryAcao.FieldByName('CODTIPODIREITO').AsString          := 'AC';
  end;

  if cbxFlgInvPRP.Checked then
     QryInvestimento.FieldByName('FLGINVESTPRP').AsString := 'S'
  else
     QryInvestimento.FieldByName('FLGINVESTPRP').AsString := 'N';

  if Trim(dblkInvestPRP.Text) <> '' then
     QryInvestimento.FieldByName('IDINVESTPRP').AsInteger := qryInvestPRP.FieldByName('IDINVESTIMENTO').AsInteger
  else
     QryInvestimento.FieldByName('IDINVESTPRP').Clear;

  // Posta o Registro
  try
     QryInvestimento.Post;
     QryAcao.Post;
     // Comita Transação
     If DtmBaseDados.dbBaseDados.InTransaction then
        DtmBaseDados.dbBaseDados.Commit;
  except
     if DtmBaseDados.dbBaseDados.InTransaction then
        DtmBaseDados.dbBaseDados.Rollback;
     bbtnCancelarDet.Click;
     raise;
  end;

  // Caso Inserindo Enquadra e Reabre as Querys
  if BtInserir.Down = True then
  begin
     // Processa o Enquadramento deste Investimento baseado no Tipo de Titulo
     EnquadraTitulo;
     // Fecha e Abre a Query
     QryInvestimento.Close;
     QryInvestimento.Open;
     QryAcao.Close;
     QryAcao.Open;
  End;
  // Abilita Botoes
  BtInserir.Enabled:=True;
  BtExcluir.Enabled:=True;
  BtAlterar.Enabled:=True;
  BtConsAcoesEmis.Enabled:=True;
  // Sobe Botoes
  BtInserir.Down:=False;
  BtExcluir.Down:=False;
  BtAlterar.Down:=False;
  BtConsAcoesEmis.Down :=False;
  // Mostra Treeview
  pnlAcoesXEmissor.Visible    :=False;
  GrdDetalhe.Visible:=True;
end;

procedure TFrmCadastraAcao.QryInvestimentoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  // Abre Query com o SubTipo
  If Not QryInvestimento.IsEmpty Then
  Begin
     QryAcao.Close;
     QryAcao.ParamByName('IDACAO').AsInteger :=
             QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
     QryAcao.Open;
     QryEnquadramento.Close;
     QryEnquadramento.ParamByName('IDINVESTIMENTO').AsInteger :=
                      QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
     QryEnquadramento.Open;
  End;

end;

procedure TFrmCadastraAcao.DbLkcTipoAcaoChange(Sender: TObject);
begin
  inherited;
  // Caso Inserindo Atualiza Descricao da Acao
  If DsInvestimento.DataSet.State In [DsInsert,DsEdit] Then
  Begin
     QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString :=
        Trim(QryEmissor.FieldByName('SIGLAEMISSOR').AsString)+
        Trim(QryTipoAcao.FieldByName('CODTIPOACAO').AsString)+'AC';
  End;
end;

procedure TFrmCadastraAcao.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') Then
  Begin
     QryEmissor.Locate('IDEMISSOR',MontaSelect.ValoresChave[0],[]);
      // Recurso para acertar erro no primeiro Locate (Não apague) ..
     QryEmissor.Locate('IDEMISSOR',MontaSelect.ValoresChave[0],[]);
     DbLkcEmissor.Text := QryEmissor.FieldByName('SIGLAEMISSOR').AsString;
  End;
  sbtnInserir.Enabled := False;
  PnlFundo.Enabled    := True;
  If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     DBCKProvisionaIR.Checked := False;
end;

procedure TFrmCadastraAcao.BtIncDet2Click(Sender: TObject);
begin
  inherited;
  // Caso Nao Existam açoes para este emissor
  If QryInvestimento.IsEmpty Then
  Begin
     MsgDlg('Não existe cadastro de ações para este emissor !','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtIncDet2.Down:=False;
     Exit;
  End;
  // Inabilita Botoes
  BtIncDet2.Enabled:=False;
  BtAltDet2.Enabled:=False;
  BtDelDet2.Enabled:=False;
  btConsAcoesBolsa.Enabled:=False;
  // Habilita Botão
  BtOkDet2.Enabled:=True;
  // Mostra Tela de Cadastro
  GrdDetalhe2.Visible:=False;
  pnlAssociacoes.Visible     :=True;
  // Inclui Registro
  QryAcaoBolsa.Append;
  // Preenche com Moeda Preferencial
  If FazQuery(QryAux,'SELECT MOECODIGO FROM PARAMINVEST') Then
  Begin
     QryAcaoBolsa.FieldByName('MOECODIGO').AsInteger :=
         QryAux.FieldByName('MOECODIGO').AsInteger;
  End;
  // Atualiza Sigla na Bolsa
  QryAcaoBolsa.FieldByName('SIGLAACAOBOLSA').AsString :=
      Trim(QryEmissor.FieldByName('SIGLAEMISSOR').AsString)+
      Trim(QryAcao.FieldByName('CODTIPOACAO').AsString);
  If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     DBCKProvisionaIR.Checked := False;
end;

procedure TFrmCadastraAcao.BtAltDet2Click(Sender: TObject);
begin
  // Caso Tabela vazia sai
  If QryAcaoBolsa.IsEmpty Then
  Begin
     MsgDlg('Tabela está vazia ','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtAltDet2.Down:=False;
     Exit;
  End;
  // Caso Nao Exista
  If QryInvestimento.IsEmpty Then
  Begin
     MsgDlg('Emissor não Possui Ações  ','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtAltDet2.Down:=False;
     Exit;
  End;
  // Heranca
  inherited;
  // Inabilita Botoes
  BtIncDet2.Enabled:=False;
  BtAltDet2.Enabled:=False;
  BtDelDet2.Enabled:=False;
  btConsAcoesBolsa.Enabled:=False;
  // Habilita Botão
  BtOkDet2.Enabled:=True;
  // Mostra Tela de Cadastro
  GrdDetalhe2.Visible:=False;
  pnlAssociacoes.Visible     :=True;
  // Edita o Registro
  QryAcaoBolsa.Edit;
  If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     DBCKProvisionaIR.Checked := False;
  //AL_2
  lblDtIni.Enabled  := True;
  dtIniLote.Enabled := True;
end;

procedure TFrmCadastraAcao.BtDelDet2Click(Sender: TObject);
begin
  // Caso Tabela vazia sai
  If QryAcaoBolsa.IsEmpty Then
  Begin
     MsgDlg('Tabela está vazia ','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtDelDet2.Down:=False;
     Exit;
  End;

  // Heranca
  inherited;
  // Inabilita Botoes
  BtDelDet2.Down:=False;
  // Confirma Exclusao ou Nao
  // Se Confirmar, Exclui Registro Posicionado
  If MsgDlg('Confirma Exclusão ', 'Mensagem do Sistema ',
            mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
  Begin
     Exit;
  End;
  // Exclui Registro
  Try
     QryAcaoBolsa.Delete;
  Except
     MsgDlg('Registro não pode ser Excluido ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
  End;
end;

procedure TFrmCadastraAcao.BtCancDet2Click(Sender: TObject);
begin
  inherited;
  // Cancela Alteracao
  QryAcaoBolsa.Cancel;
  // Mostra Treeview
  pnlAssociacoes.Visible     :=False;

  GrdDetalhe2.Visible:=True;
  // Abilita Botoes
  BtIncDet2.Enabled:=True;
  BtAltDet2.Enabled:=True;
  BtDelDet2.Enabled:=True;
  btConsAcoesBolsa.Enabled:=True;
  BtOkDet2.Enabled:=True;
  // Sobe Botoes
  BtIncDet2.Down:=False;
  BtAltDet2.Down:=False;
  BtDelDet2.Down:=False;
  btConsAcoesBolsa.Down:=False;
  // Esconde o Painel
  if GrdDetalhe2.CanFocus then
     GrdDetalhe2.SetFocus;
end;

procedure TFrmCadastraAcao.BtOkDet2Click(Sender: TObject);
begin
  inherited;
  // Testa Valores informados
  //AL_5 - Ini
  if (DbLkcBolsaValores.Text = '') then
  begin
     MsgDlg('Falta preencher a Bolsa de Valor', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if DbLkcBolsaValores.CanFocus then
        DbLkcBolsaValores.SetFocus;
     Exit;
  end;

  if (dbeQtdLote.Text = '') then
  begin
     MsgDlg('Falta preencher o peso do Lote', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if dbeQtdLote.CanFocus then
        dbeQtdLote.SetFocus;
     Exit;
  end;

  if (DbLkcMoedaBolsa.Text = '')  then
  begin
     MsgDlg('Falta preencher a Moeda', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if dbeSiglaBolsa.CanFocus then
        dbeSiglaBolsa.SetFocus;
     Exit;
  end;

  if (dbeSiglaBolsa.Text = '') then
  begin
     MsgDlg('Falta preencher o Código de Negociação', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if dbeSiglaBolsa.CanFocus then
        dbeSiglaBolsa.SetFocus;
     Exit;
  end;
  //AL_5 - Fim

  // Caso Inserindo
  if BtIncDet2.Down = True then
  begin
     // Testa se Emissor esta cadastrado ou cadastra
     EmissorCadastrado;
     // Inclui dados Referenciais
     QryAcaoBolsa.FieldByName('IDACAO').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
     QryAcaoBolsa.FieldByName('IDEMISSOR').AsInteger := QryEmissor.FieldByName('IDEMISSOR').AsInteger;
  end;

  // Posta o Registro
  try
     //AL_2
     // Altera a COTACAOACAO e COTACAOINVEST posteriores à data de alteração
     if DsAcaoBolsa.DataSet.State In [dsEdit] then
     begin
        if Trim(dtIniLote.Text) = '' then
        begin
           //AL_5
           MsgDlg('Falta preencher a Data Inicial', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
           if dtIniLote.CanFocus then
              dtIniLote.SetFocus;
           Exit;
        end;
        
        ExecutaQuery(QryAux,
          'UPDATE COTACAOACAO SET QTDELOTE = '+ TrocaVirgulaPonto(FloatToStr(QryAcaoBolsa.FieldByName('QTDELOTE').AsFloat)) +
          ' WHERE IDBOLSAVALORES = '+QryAcaoBolsa.FieldByName('IDBOLSAVALORES').AsString +' AND ' +
          '       IDACAO = '+ QryAcaoBolsa.FieldByName('IDACAO').AsString	+' AND '+
          '       DATACOTAACAO >= '+ 'TO_DATE('+QuotedStr(dtIniLote.Text)+',''DD/MM/YYYY'')');

        ExecutaQuery(QryAux,
          'UPDATE COTACAOINVEST SET QTDTITLOTE = '+ TrocaVirgulaPonto(FloatToStr(QryAcaoBolsa.FieldByName('QTDELOTE').AsFloat)) +
          ' WHERE IDINVESTIMENTO = '+QryAcaoBolsa.FieldByName('IDACAO').AsString +' AND ' +
          '       DATACOTACAO   >= '+ 'TO_DATE('+QuotedStr(dtIniLote.Text)+',''DD/MM/YYYY'')');

        //AL_7  
        if (dtIniLote.Date <= pRPI.DATAULTFECH) then
           RendaVariavel.MarcarFlagReproc(QryAcaoBolsa.FieldByName('IDACAO').AsInteger,
                                          -1, -1, dtIniLote.Date);
     end;

     QryAcaoBolsa.Post;
  except
     BtCancDet2.Click;
     Raise;
  end;

  // Caso Inserindo, Insere no SubTipo.
  if BtIncDet2.Down = True then
  begin
     // Fecha e Abre a Query
     QryAcaoBolsa.Close;
     QryAcaoBolsa.Open;
  end;

  // Abilita Botoes
  BtIncDet2.Enabled:=True;
  BtAltDet2.Enabled:=True;
  BtDelDet2.Enabled:=True;
  btConsAcoesBolsa.Enabled:=True;
  // Sobe Botoes
  BtIncDet2.Down   :=False;
  BtAltDet2.Down   :=False;
  BtDelDet2.Down   :=False;
  btConsAcoesBolsa.Down:=False;
  // Mostra Treeview
  pnlAssociacoes.Visible   :=False;
  GrdDetalhe2.Visible:=True;
  //AL_2
  lblDtIni.Enabled  := False;
  dtIniLote.Enabled := False;
end;

Function TFrmCadastraAcao.EmissorCadastrado: Boolean;
Var
  wSiglaEmissor:String;
begin
  Result := True;
  // Verifica Se Emissor já foi Associado .
  // Caso Não, Associa a Bolsa
  If Not FazQuery(QryAux,
    'SELECT IDBOLSAVALORES, IDEMISSOR '+
    'FROM EMISSORXBOLSA WHERE IDEMISSOR = '''+
    QryInvestimento.FieldByName('IDEMISSOR').AsString +
    '''AND IDBOLSAVALORES = '''+
    QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+'''') Then Begin
    // Insere no Arquivo
    Try
      ExecutaQuery(QryAux,
        'INSERT INTO EMISSORXBOLSA (IDBOLSAVALORES, IDEMISSOR, SGLEMISSORBOLSA) '+
        'VALUES ('+QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString +', '  +
                   QryInvestimento.FieldByName('IDEMISSOR').AsString	  +', '''+
                   QryEmissor.FieldByName('SIGLAEMISSOR').AsString        +''') ');
    Except
      Result := False;
      Raise;
    End;
    Result := True;
  End;
end;

procedure TFrmCadastraAcao.PageControl1Change(Sender: TObject);
begin
  inherited;

  If PageControl1.ActivePage = TabSheet1 Then
  Begin
     If Not (DsInvestimento.DataSet.State In [DsInsert,DsEdit]) Then
     begin
        If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
           DBCKProvisionaIR.Checked := False;
     End;
  End
  Else
  Begin
    Label7.Caption  := 'Ação .: '+
                       QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
    Label16.Caption := 'Ação .: '+
                       QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
  End;
end;

procedure TFrmCadastraAcao.DbLkcEmissorChange(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmCadastraAcao.BtIncDet3Click(Sender: TObject);
begin
  // Caso Nao Existam açoes para este emissor
  If QryInvestimento.IsEmpty Then
  Begin
     MsgDlg('Emissor não Possui Ações ','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtIncDet3.Down:=False;
     Exit;
  End;
  inherited;
  // Inabilita Botoes
  BtIncDet3.Enabled:=False;
  BtAltDet3.Enabled:=False;
  BtDelDet3.Enabled:=False;
  btConsAcoesEnq.Enabled:=False;
  // Habilita Botão
  BtOkDet3.Enabled := True;
  // Mostra Tela de Cadastro
  GrdDetalhe3.Visible:=False;
  pnlEnquadramento.Visible     :=True;
  DbLkcClassif.Text  :='';
  // Inclui Registro
  QryEnquadramento.Append;
end;

procedure TFrmCadastraAcao.BtAltDet3Click(Sender: TObject);
begin
  // Caso Tabela vazia sai
  if QryEnquadramento.IsEmpty then
  begin
     MsgDlg('Tabela está vazia ','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtAltDet3.Down:=False;
     Exit;
  end;
  // Heranca
  inherited;
  // Inabilita Botoes
  BtIncDet3.Enabled:=False;
  BtAltDet3.Enabled:=False;
  BtDelDet3.Enabled:=False;
  btConsAcoesEnq.Enabled:=False;
  // Habilita Botão
  BtOkDet3.Enabled := True;
  // Mostra Tela de Cadastro
  GrdDetalhe3.Visible:=False;
  pnlEnquadramento.Visible     :=True;
  // Edita o Registro
  QryEnquadramento.Edit;
end;

//---------------------------------------------------------
procedure TFrmCadastraAcao.BtDelDet3Click(Sender: TObject);
begin
  inherited;
  // Caso Tabela vazia sai
  If QryEnquadramento.IsEmpty Then
  Begin
     Beep;
     MsgDlg('Tabela está vazia ','Mensagem do Sistema ',mtWarning,[mbOk],0);
     BtDelDet3.Down:=False;
     Exit;
  End;

  // Heranca
  inherited;
  // Inabilita Botoes
  BtDelDet3.Down:=False;
  // Confirma Exclusao ou Nao
  // Se Confirmar, Exclui Registro Posicionado
  If MsgDlg('Confirma Exclusão ', 'Mensagem do Sistema ', mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
  Begin
    Exit;
  End;
  // Exclui Registro
  Try
     QryEnquadramento.Delete;
  Except
     MsgDlg('Registro não pode ser Excluido ', 'Mensagem do Sistema ', mtWarning, [mbOk], 0);
  End;
end;

//---------------------------------------------------------
procedure TFrmCadastraAcao.BtOkDet3Click(Sender: TObject);
begin
  inherited;

  //AL_5 - Ini
  // Testa Valores informados
  if (DbLkcTabClassif.Text = '') then
  begin
     MsgDlg('Falta preencher a Tabela Classificação', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if DbLkcTabClassif.CanFocus then
        DbLkcTabClassif.SetFocus;
     Exit;
  end;

  if (DbLkcClassif.Text = '') then
  begin
     MsgDlg('Falta preencher a Classificação', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     if DbLkcTabClassif.CanFocus then
        DbLkcTabClassif.SetFocus;
     Exit;
  end;
  //AL_5 - Fim

  // Caso Inserindo
  if BtIncDet3.Down = True then
  begin
     // Inclui dados Referenciais
     QryEnquadramento.FieldByName('IDINVESTIMENTO').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
  end;

  // Posta o Registro
  try
     QryEnquadramento.Post;
  except
     BtCancDet3.Click;
     Raise;
  end;

  if BtIncDet3.Down = True then
  begin
     // Fecha e Abre a Query
     QryEnquadramento.Close;
     QryEnquadramento.Open;
  end;

  // Abilita Botoes
  BtIncDet3.Enabled:=True;
  BtAltDet3.Enabled:=True;
  BtDelDet3.Enabled:=True;
  btConsAcoesEnq.Enabled:=True;
  // Sobe Botoes
  BtIncDet3.Down:=False;
  BtAltDet3.Down:=False;
  BtDelDet3.Down:=False;
  btConsAcoesEnq.Down:=False;
  // Mostra Treeview
  pnlEnquadramento.Visible   :=False;
  GrdDetalhe3.Visible:=True;
end;

procedure TFrmCadastraAcao.BtCancDet3Click(Sender: TObject);
begin
  inherited;
  // Cancela Alteracao
  QryEnquadramento.Cancel;
  // Mostra Treeview
  pnlEnquadramento.Visible     :=False;
  GrdDetalhe3.Visible:=True;
  // Abilita Botoes
  BtIncDet3.Enabled:=True;
  BtAltDet3.Enabled:=True;
  BtDelDet3.Enabled:=True;
  btConsAcoesEnq.Enabled:=True;
  BtOkDet3.Enabled:=True;
  // Sobe Botoes
  BtIncDet3.Down:=False;
  BtAltDet3.Down:=False;
  BtDelDet3.Down:=False;
  btConsAcoesEnq.Down:=False;
  // Esconde o Painel
  if GrdDetalhe3.CanFocus then
     GrdDetalhe3.SetFocus;
end;

procedure TFrmCadastraAcao.DbLkcTabClassifChange(Sender: TObject);
begin
  inherited;
  If Not QryTabClassif.IsEmpty Then
  Begin
     QryClassificacaoTab.Close;
     QryClassificacaoTab.ParamByName('CODTABCLASSINV').AsString :=
                         QryTabClassif.FieldByName('CODTABCLASSINV').AsString;
     QryClassificacaoTab.Open;
  End;
end;

procedure TFrmCadastraAcao.DbLkcBolsaValoresChange(Sender: TObject);
begin
  inherited;
  // Testa se a Query esta em modo de Edicao/Insercao
  If QryAcaoBolsa.State In ([DsEdit, DsInsert]) Then
  Begin
     // Preenche com Moeda Preferencial
     QryAcaoBolsa.FieldByName('MOECODIGO').AsInteger :=
         QryBolsaValores.FieldByName('MOECODIGO').AsInteger;
  End;
end;

procedure TFrmCadastraAcao.PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
begin
   inherited;
   if PageControl1.ActivePage.TabIndex = 0 then
   begin
      if QryAcao.State in [DsInsert,DsEdit] then
      begin
         //AL_5
         MsgDlg('Confirme ou Cancele a operação antes de trocar de página', 'Mensagem do Sistema ', mtWarning,[mbOK],0);
         AllowChange:=False;
      end;
      if BtConsAcoesEmis.Down then
         bbtnVoltarDet.Click;
   end
   else if PageControl1.ActivePage.TabIndex = 1 then
   begin
      if btConsAcoesBolsa.Down then
         BtVoltaDet2.Click;

   end
   else if PageControl1.ActivePage.TabIndex = 2 then
   begin
      if btConsAcoesEnq.Down then
         BtVoltaDet3.Click;
   end;
end;

procedure TFrmCadastraAcao.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

Procedure TFrmCadastraAcao.EnquadraTitulo;
Var
   QryLocal:TwwQuery;
Begin
  // Cria Objetos Locais
  QryLocal:=TwwQuery.Create(Application);
  QryLocal.DatabaseName:='BaseDados';
  // Busca o Enquadrmento desse Tipo de Titulo
  FazQuery(QryLocal,'SELECT  CODTABCLASSINV, CODTIPTITULO, CODCLASSINVEST, '+
	                   '        IDTIPOINVEST,   DTENQUADRA                    '+
                    'FROM CLASSINVXTIPTIT                               '+
                    'WHERE CODTIPTITULO = '+
                    QuotedStr(QryAcao.FieldByName('CODTIPOACAO').AsString));
  // Transfere Dados Enquanto Existirem
  While Not QryLocal.Eof Do
  Begin
    ExecutaQuery(QryAux,
      'INSERT INTO CLASSINVXINVEST '+
      '  (CODTABCLASSINV, CODCLASSINVEST, IDINVESTIMENTO, DTENQUADRA)'+
      'VALUES '+
      '('+
      QuotedStr(QryLocal.FieldByName('CODTABCLASSINV').AsString)+', '+
      QuotedStr(QryLocal.FieldByName('CODCLASSINVEST').AsString)+', '+
      QryInvestimento.FieldByName('IDINVESTIMENTO').AsString    +', '+
      'TO_DATE('+QuotedStr(QryLocal.FieldByName('DTENQUADRA').AsString)+',''DD/MM/YYYY'')'+
      ')');
    QryLocal.Next;
  End;


  // Libera Objeto Locais
  QryLocal.Free;
End;

procedure TFrmCadastraAcao.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     DBCKProvisionaIR.Checked := False;
end;

procedure TFrmCadastraAcao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     DBCKProvisionaIR.Checked := False;
end;

procedure TFrmCadastraAcao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If QryAcao.FieldByName('FLGPROVISIONAIR').AsString <> 'S' Then
     DBCKProvisionaIR.Checked := False;
end;

procedure TFrmCadastraAcao.QryAcaoAfterPost(DataSet: TDataSet);
begin
  qryAcao.ApplyUpdates;
end;

procedure TFrmCadastraAcao.BtConsAcoesEmisClick(Sender: TObject);
begin
  // Caso Tabela vazia sai
  if QryInvestimento.IsEmpty then
  begin
     BtConsAcoesEmis.Down := False;
     Exit;
  end;

  inherited;
  // Mostra Tela de Alteracao
  GrdDetalhe.Visible:=False;
  pnlAcoesXEmissor.Visible :=True;
  bbtnOkDet.Enabled := False;
  BtConsAcoesEmis.Down := True;
end;

procedure TFrmCadastraAcao.btConsAcoesBolsaClick(Sender: TObject);
begin
   // Caso Tabela vazia sai
   if QryAcaoBolsa.IsEmpty then
   begin
      btConsAcoesBolsa.Down:=False;
      Exit;
   end;

   // Caso Nao Exista
   if QryInvestimento.IsEmpty then
   begin
      btConsAcoesBolsa.Down:=False;
      Exit;
   end;

   inherited;

   // Mostra Tela de Cadastro
   GrdDetalhe2.Visible:=False;
   pnlAssociacoes.Visible     :=True;
   BtOkDet2.Enabled := False;
   btConsAcoesBolsa.Down := True;
end;

procedure TFrmCadastraAcao.btConsAcoesEnqClick(Sender: TObject);
begin
   // Caso Tabela vazia sai
   if QryEnquadramento.IsEmpty then
   begin
      btConsAcoesEnq.Down:=False;
      Exit;
   end;

   inherited;

   // Mostra Tela de Cadastro
   GrdDetalhe3.Visible:=False;
   pnlEnquadramento.Visible     :=True;
   BtOkDet3.Enabled := False;
   btConsAcoesEnq.Down := True;

end;

// AL_3
procedure TFrmCadastraAcao.cbxFlgInvPRPClick(Sender: TObject);
begin
  inherited;
   if cbxFlgInvPRP.Checked then
      dblkInvestPRP.Enabled := True
   else
   begin
      dblkInvestPRP.Enabled := False;
      dblkInvestPRP.Clear;
   end;
end;

End.


