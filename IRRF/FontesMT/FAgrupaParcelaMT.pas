{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Agrupa\Parcela Documentos                          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}

unit FAgrupaParcelaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TreeWzd, ImgList, fcButton, fcImgBtn,
  fcShapeBtn, fcClearPanel, fcButtonGroup, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Spin, DBCGrids, Grids, Wwdbigrd, Wwdbgrid,
  CMProcuraSubTipo, fSairAjuda, Mask, wwdbedit, DBCtrls, Tabs, uCMTypes,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ActnList, TREdit,
  uCtrlDocumento, uCtrlLancDocCapCar;

type
  TOperacaoForm = (opfDocumento, opfContratoPrev);

  TParcelaAutomatica = Record
     RazaoSocial: String;
     IdForCli: Integer;
     CodDocumento: Integer;
     DataLancto: TDateTime;
     DataEmissao: TDateTime;
     TipoDeDocumento: Integer;
     PortadorForma: Integer;
     FormaDePagamento: Integer;
  End;


  TFrmAgrupaParcelaMT = class(TfrmSairAjuda)
    NtbAgrupaParcela: TNotebook;
    TwzdAgrupaParcela: TTreeWzd;
    BtnGroup: TfcButtonGroup;
    BtnInserir: TfcShapeBtn;
    Btnalterar: TfcShapeBtn;
    BtnExcluir: TfcShapeBtn;
    Image1: TImage;
    Image4: TImage;
    Image6: TImage;
    Image8: TImage;
    Image3: TImage;
    Image2: TImage;
    Label2: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    LblContasCaixas: TLabel;
    LblFormaRecPag: TLabel;
    dteLancamento: TCMDateTimePicker;
    dteEmissao: TCMDateTimePicker;
    DblCodForma: TwwDBLookupCombo;
    cmbFormaPag: TwwDBLookupCombo;
    cmbTipoDoc: TwwDBLookupCombo;
    grdPendentes: TwwDBGrid;
    grdSelecionados: TwwDBGrid;
    BtnAddP: TSpeedButton;
    BtnAddAllP: TSpeedButton;
    BtnDelp: TSpeedButton;
    BtnDelAllP: TSpeedButton;
    PnlTitDesemb: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    CPForCli: TCMProcuraForCli;
    Bevel1: TBevel;
    BtnConfirmar: TBitBtn;
    BtnVoltar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GpbFatura: TGroupBox;
    dblFatura: TwwDBLookupCombo;
    TbsPaginas: TTabSet;
    GrdDocumentos: TDBCtrlGrid;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblValorEm: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    LblNumAp: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBText1: TDBText;
    Bevel3: TBevel;
    ImgGeraAp: TImage;
    ImgProcuraBanco: TImage;
    edHistorico: TwwDBEdit;
    edUnCompl: TwwDBEdit;
    dteVencimento: TCMDateTimePicker;
    dteProgramada: TCMDateTimePicker;
    dbedvalor: TwwDBEdit;
    dbedvaloroutra: TwwDBEdit;
    Dbereferencia: TwwDBEdit;
    MemObs: TDBMemo;
    EdtNumAp: TwwDBEdit;
    DbEdtBanco: TwwDBEdit;
    DbEdtAgencia: TwwDBEdit;
    DbEdtConta: TwwDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnAvancar: TBitBtn;
    SQLFatura: TCMSqlParams;
    CdsFatura: TCMClientDataSet;
    CdsPendentes: TCMClientDataSet;
    SQLPendentes: TCMSqlParams;
    CdsSelecionados: TCMClientDataSet;
    SQLSelecionados: TCMSqlParams;
    DsSelecionados: TwwDataSource;
    DsPendentes: TwwDataSource;
    ActAgrupaParcela: TActionList;
    AddPendentes: TAction;
    AddAlLPendentes: TAction;
    DelSelecionados: TAction;
    DelAlLSelecionados: TAction;
    ReTotSelecionados: TRealEdit;
    ReTotPendentes: TRealEdit;
    CdsTipoDoc: TCMClientDataSet;
    SqlTipoDoc: TCMSqlParams;
    CdsContasCaixas: TCMClientDataSet;
    SqlCdsContasCaixas: TCMSqlParams;
    CdsFormaPagto: TCMClientDataSet;
    SqlFormaPagto: TCMSqlParams;
    CdsParcelas: TCMClientDataSet;
    SQLParcelas: TCMSqlParams;
    DsParcelas: TwwDataSource;
    GpFrequencia: TGroupBox;
    Label10: TLabel;
    lblFrequencia: TLabel;
    rdbDiaria: TRadioButton;
    rdbMensal: TRadioButton;
    rdbAnual: TRadioButton;
    spnFrequencia: TSpinEdit;
    BtnRecalcula: TBitBtn;
    DbeDocumetno: TwwDBEdit;
    GpNumParcelas: TGroupBox;
    spnTotParcelas: TSpinEdit;
    Label1: TLabel;
    Bevel2: TBevel;
    LblOperacao: TLabel;
    Bevel6: TBevel;
    PnlResultados: TPanel;
    LblContabilizacao: TLabel;
    GrdContabilizacao: TwwDBGrid;
    PnlOrigem: TPanel;
    Label24: TLabel;
    GrdOrigem: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure NtbAgrupaParcelaPageChanged(Sender: TObject);
    procedure BtnAvancarClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnGroupChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure CPForCliExit(Sender: TObject);
    procedure ActAgrupaParcelaUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure AddAlLPendentesExecute(Sender: TObject);
    procedure AddPendentesExecute(Sender: TObject);
    procedure DelSelecionadosExecute(Sender: TObject);
    procedure DelAlLSelecionadosExecute(Sender: TObject);
    procedure rdbDiariaClick(Sender: TObject);
    procedure spnFrequenciaChange(Sender: TObject);
    procedure spnTotParcelasChange(Sender: TObject);
    procedure TbsPaginasChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure ImgProcuraBancoClick(Sender: TObject);
    procedure BtnalterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImgGeraApClick(Sender: TObject);
    procedure BtnRecalculaClick(Sender: TObject);
    procedure CdsPendentesAfterOpen(DataSet: TDataSet);
    procedure dblFaturaChange(Sender: TObject);
    procedure CPForCliChange(Sender: TObject);
    procedure ActAgrupaParcelaExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure CdsParcelasAfterInsert(DataSet: TDataSet);
    procedure DsParcelasDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    _Operacao: Toperacao;
    _Documento: TCtrlDocumento;
    _LancDocCapCar: TCtrlLancDocCapCar;
    iNumFatura: Integer;
    bDivideParcelas: Boolean;
    bAlterouEtapa: Array [0..4] of Boolean;
    procedure ExibeMensagem(sMens: String);
  public
    { Public declarations }
    Class Procedure AbrirForm(OperacaoForm: TOperacaoForm; DadosParcela: TParcelaAutomatica);
  end;

var
  FrmAgrupaParcelaMT: TFrmAgrupaParcelaMT;
  sTipoDocumento, sOperacao1, sOperacao3: String;
  NovaParcela: TParcelaAutomatica;

implementation

uses uCtrlParamIntegra, uMensErro, uFuncaoGeral, uSistema, DDadosBancarios,
     uCMMath, jclMath, uFormManager, uDataBase, uModulo;

{$R *.DFM}

procedure TFrmAgrupaParcelaMT.FormCreate(Sender: TObject);
begin
  inherited;
  bDivideParcelas := True;

  _Documento := TCtrlDocumento.Create;
  _Documento.InitializeAs(ParamIntegra);
  _Documento.OnMessageInfo := ExibeMensagem;

  _LancDocCapCar := TCtrlLancDocCapCar.Create;
  _LancDocCapCar.InitializeAs(ParamIntegra);
  _LancDocCapCar.OnMessageInfo := ExibeMensagem;

  _Operacao := opInserir;

  If ParamIntegra.RecPag = 'P' Then
  Begin
     TwzdAgrupaParcela.Etapa.Caption[0] := 'Seleção do fornecedor e tipo de operação';
     LblContasCaixas.Caption := 'Contas Caixas X Forma de Pagamento';
     LblFormaRecPag.Caption := 'Forma de Pagamento';
     CPForCli.ForCli := fcFornecedor;
     CPForCli.Caption := 'Fornecedor';
     LblNumAp.Caption := 'Nº AP';     
  End
  Else
  Begin
     TwzdAgrupaParcela.Etapa.Caption[0] := 'Seleção do fornecedor e tipo de operação';
     LblContasCaixas.Caption := 'Contas Caixas X Tipo de Cobrança';
     LblFormaRecPag.Caption := 'Tipo de Cobrança';
     CPForCli.ForCli := fcCliente;
     CPForCli.Caption := 'Cliente';
     LblNumAp.Caption := 'Nº GR';
  End;

  CPForCli.Mensagens.EmBranco := CPForCli.Caption + CPForCli.Mensagens.EmBranco;
  CPForCli.Mensagens.NaoExiste := CPForCli.Caption + CPForCli.Mensagens.NaoExiste;   

  SqlTipoDoc.Prepare;
  SqlTipoDoc.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDoc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  SqlTipoDoc.Open;

  SqlFormaPagto.Prepare;
  SqlFormaPagto.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlFormaPagto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlFormaPagto.Open;

  SqlCdsContasCaixas.Prepare;
  SqlCdsContasCaixas.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlCdsContasCaixas.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlCdsContasCaixas.Open;

  TwzdAgrupaParcela.Etapa.Imagem := TwzdAgrupaParcela.Etapa.Imagem; 

  NtbAgrupaParcela.PageIndex := 0;
  NtbAgrupaParcelaPageChanged(Self);

  bAlterouEtapa[0] := True;
  bAlterouEtapa[1] := True;
  bAlterouEtapa[2] := True;
  bAlterouEtapa[3] := True;
  bAlterouEtapa[4] := True;
end;

procedure TFrmAgrupaParcelaMT.NtbAgrupaParcelaPageChanged(Sender: TObject);
Var
  sDescricao: String;
begin
  inherited;
  TwzdAgrupaParcela.Etapa.Pos := NtbAgrupaParcela.PageIndex + 1;
  Caption := 'Assistente para Agrupar \ Parcelar ' + sTipoDocumento + ' - Etapa ' + IntToStr(NtbAgrupaParcela.PageIndex + 1) + '/5';
  BtnVoltar.Visible := (NtbAgrupaParcela.PageIndex > 0);
  BtnConfirmar.Visible := (NtbAgrupaParcela.PageIndex = 5);
  BtnAvancar.Visible := (NtbAgrupaParcela.PageIndex <> 5);

  BtnConfirmar.Visible := False;
  BtnAvancar.Visible := True;

  Case NtbAgrupaParcela.PageIndex of
  0: ;
  1:
  Begin
     SQLPendentes.Prepare;
     SQLPendentes.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SQLPendentes.ParamByName('OPERACAO1').AsString := sOperacao1;
     SQLPendentes.ParamByName('IDFORCLI').AsInteger := CPForCli.ForCliReg.Id;
     SQLPendentes.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     SQLPendentes.Open;

     SQLSelecionados.Prepare;
     SQLSelecionados.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SQLSelecionados.ParamByName('OPERACAO1').AsString := sOperacao1;
     SQLSelecionados.ParamByName('NUMFATURA').AsInteger := iNumFatura;
     SQLSelecionados.ParamByName('IDFORCLI').AsInteger := CPForCli.ForCliReg.Id;
     SQLSelecionados.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     SQLSelecionados.Open;

     ActAgrupaParcela.Tag := 0;
  End;
  2: ;
  3:
  Begin
     If bAlterouEtapa[2] Then
     Begin
        SQLParcelas.Prepare;
        SQLParcelas.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
        SQLParcelas.ParamByName('OPERACAO3').AsString := sOperacao3;
        SQLParcelas.ParamByName('NUMFATURA').AsInteger := iNumFatura;
        SQLParcelas.ParamByName('IDFORCLI').AsInteger := CPForCli.ForCliReg.Id;
        SQLParcelas.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
        SQLParcelas.Open;

        bAlterouEtapa[2] := False;
     End;

     If CdsParcelas.RecordCount = 0 Then
     Begin
        spnTotParcelas.Value := 1;
        spnTotParcelasChange(spnTotParcelas);
     End
     Else
        spnTotParcelas.Value := CdsParcelas.RecordCount;
  End;
  4:
  Begin
    If ( Not CdsSelecionados.Active ) or ( _Operacao = opApagar ) Then
    Begin
      SQLSelecionados.Prepare;
      SQLSelecionados.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
      SQLSelecionados.ParamByName('OPERACAO1').AsString := sOperacao1;
      SQLSelecionados.ParamByName('NUMFATURA').AsInteger := iNumFatura;
      SQLSelecionados.ParamByName('IDFORCLI').AsInteger := CPForCli.ForCliReg.Id;
      SQLSelecionados.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      SQLSelecionados.Open;
    End;

    Case _Operacao of
      opInserir: sDescricao := 'Inclusão ';
      opAlterar: sDescricao := 'Alteração ';
      opApagar: sDescricao := 'Exclusão ';
    End;

    LblOperacao.Caption := sDescricao + 'parcela(s) referente(s) ao ' + CPForCli.Caption + ' ' +
                           CPForCli.ForCliReg.Nome + ' dos documento(s) de origem listado(s) abaixo';

    If _Operacao <> OpInserir Then
       LblOperacao.Caption := LblOperacao.Caption + ' e Fatura de origem Nº ' + dblFatura.LookupValue;

    LblOperacao.Caption := LblOperacao.Caption + '.';

    BtnConfirmar.Visible := True;
    BtnAvancar.Visible := False;
    PnlResultados.Visible := ( _Operacao <> opApagar );
  End;
  End;
end;

procedure TFrmAgrupaParcelaMT.BtnAvancarClick(Sender: TObject);
Var
  bAvanca: Boolean;
  rSumValor: Double;
begin
  inherited;
  //Valida o "Avanço" para a próxima etapa do processo
  bAvanca := False;

  Case NtbAgrupaParcela.PageIndex Of
  0:
  Begin
    Case BtnGroup.Selected.Index of
      0: _Operacao := opInserir;
      1: _Operacao := opAlterar;
      2: _Operacao := opApagar;
    End;

    bAvanca := (CPForCli.Valida = vcOk);

    If bAvanca Then
    Begin
       If (GpbFatura.Enabled) And (Trim(dblFatura.Text) = '') Then
       Begin
          bAvanca := False;
          MsgDlg('Para Alterar\Excluir é obrigatório a indicação do Nº da Fatura','Atenção', mtWarning, [mbOk], 0 );
       End;
    End;

    If bAvanca Then
    Begin
       If GpbFatura.Enabled  Then
          iNumFatura := StrToInt(dblFatura.LookupValue)
       Else
          iNumFatura := _Documento.GetNumFatura;
    End;

    If bAvanca And (_Operacao = OpApagar) Then NtbAgrupaParcela.PageIndex := 4;
  End;
  1:
  Begin
    bAvanca := Not CdsSelecionados.IsEmpty;

    If Not bAvanca Then
       MsgDlg('Não foram selecionados documento para Englobar\Parcelar.','Atenção', mtWarning, [mbOk], 0 )
    Else
       if ( _Operacao = opAlterar ) then
       begin
          SQLParcelas.Prepare;
          SQLParcelas.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
          SQLParcelas.ParamByName('OPERACAO3').AsString := sOperacao3;
          SQLParcelas.ParamByName('NUMFATURA').AsInteger := iNumFatura;
          SQLParcelas.ParamByName('IDFORCLI').AsInteger := CPForCli.ForCliReg.Id;
          SQLParcelas.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
          SQLParcelas.Open;

          dteLancamento.Date := CdsParcelas.FieldByName('DATALANCTO').AsDateTime;
          dteEmissao.Date := CdsParcelas.FieldByName('DATALANCTO').AsDateTime;
          cmbTipoDoc.LookupValue := CdsParcelas.FieldByName('DOCCODTIPDOC').AsString;
          cmbFormaPag.LookupValue := CdsParcelas.FieldByName('CODPORTFORMA').AsString;
          DblCodForma.LookupValue := CdsParcelas.FieldByName('CODFORMA').AsString;
       end;
  End;
  2:
  Begin
    bAvanca := (Trim(dteLancamento.Text) <> '');

    If Not bAvanca Then
    Begin
       MsgDlg('Não foi informada a Data de Lançamento.','Atenção', mtWarning, [mbOk], 0 );
       If dteLancamento.CanFocus Then dteLancamento.SetFocus;
    End
    Else
    Begin
       bAvanca := (Trim(dteEmissao.Text) <> '');

       If Not bAvanca Then
       Begin
          MsgDlg('Não foi informada a Data de Emissão.','Atenção', mtWarning, [mbOk], 0 );
          If dteEmissao.CanFocus Then dteEmissao.SetFocus;
       End
       Else
       Begin
          bAvanca := (Trim(cmbTipoDoc.Text) <> '');

          If Not bAvanca Then
          Begin
             MsgDlg('Não foi informado o Tipo de Documento.','Atenção', mtWarning, [mbOk], 0 );
             If cmbTipoDoc.CanFocus Then cmbTipoDoc.SetFocus;
          End;
       End;
    End;

    If bAvanca Then
    Begin
       bAlterouEtapa[2] := dteLancamento.Modified or dteEmissao.Modified or cmbTipoDoc.Modified or
                           cmbFormaPag.Modified or DblCodForma.Modified;

       dteLancamento.Modified := False;
       dteEmissao.Modified := False;
       cmbTipoDoc.Modified := False;
       cmbFormaPag.Modified := False;
       DblCodForma.Modified := False;
    End;
  End;                          
  3:
  Begin
     CdsParcelas.DisableControls;
     Try
        rSumValor := 0;
        
        CdsParcelas.First;
        While Not CdsParcelas.Eof Do
        Begin
          rSumValor := rSumValor + CdsParcelas.FieldByName('VALOR').AsFloat;
          CdsParcelas.Next;
        End;

        CdsParcelas.First;

        bAvanca := FloatsEqual(ReTotSelecionados.Value, rSumValor);

        If Not bAvanca Then
           MsgDlg('A soma das parcelas é diferente do valor do(s) documento(s) de origem.','Atenção', mtWarning, [mbOk], 0 );
     Finally
        CdsParcelas.EnableControls;
     End;
  End
  End;

  If bAvanca Then
     NtbAgrupaParcela.PageIndex := NtbAgrupaParcela.PageIndex + 1;
end;

procedure TFrmAgrupaParcelaMT.BtnVoltarClick(Sender: TObject);
begin
  inherited;
  If (_Operacao = opApagar) And (NtbAgrupaParcela.PageIndex = 4) Then
     NtbAgrupaParcela.PageIndex := 0
  Else
     NtbAgrupaParcela.PageIndex := NtbAgrupaParcela.PageIndex - 1;
end;

procedure TFrmAgrupaParcelaMT.BtnGroupChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  inherited;
  Case Selected.Index of
    0: _Operacao := opInserir;
    1: _Operacao := opAlterar;
    2: _Operacao := opApagar;
  End;

  GpbFatura.Enabled := (_Operacao <> opInserir);

  dteLancamento.Modified := True;

  If CdsParcelas.Active Then CdsParcelas.Close;
end;

procedure TFrmAgrupaParcelaMT.CPForCliExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl <> nil) And
     (ActiveControl.Tag <> 99) And
     (CPForCli.Valida = vcOk) Then
  Begin
     GpbFatura.Enabled := (_Operacao <> opInserir);
     If GpbFatura.CanFocus Then GpbFatura.SetFocus;

     SQLFatura.Prepare;
     SQLFatura.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SQLFatura.ParamByName('OPERACAO1').AsString := sOperacao1;
     SQLFatura.ParamByName('OPERACAO3').AsString := sOperacao3;
     SQLFatura.ParamByName('IDFORCLI').AsInteger := CPForCli.ForCliReg.Id;
     SQLFatura.Open;
  End;
end;

procedure TFrmAgrupaParcelaMT.ActAgrupaParcelaUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  If ActAgrupaParcela.Tag = 0 Then
  Begin
     ActAgrupaParcela.Tag := 1;

     BtnAddP.Enabled := Not CdsPendentes.IsEmpty;
     BtnAddAllP.Enabled := Not CdsPendentes.IsEmpty;
     BtnDelp.Enabled := Not CdsSelecionados.IsEmpty;
     BtnDelAllP.Enabled := Not CdsSelecionados.IsEmpty;

     If (CdsSelecionados.Active) Then
     Begin
        ReTotSelecionados.Value := 0;

        CdsSelecionados.DisableControls;
        CdsSelecionados.First;
        While Not CdsSelecionados.Eof Do
        Begin
           ReTotSelecionados.Value := ReTotSelecionados.Value + CdsSelecionados.FieldByName('VALOR').AsFloat;
           CdsSelecionados.Next;
        End;
        CdsSelecionados.First;
        CdsSelecionados.EnableControls;

        ReTotPendentes.Value := 0;

        CdsPendentes.DisableControls;
        CdsPendentes.First;
        While Not CdsPendentes.Eof Do
        Begin
           ReTotPendentes.Value := ReTotPendentes.Value + CdsPendentes.FieldByName('VALOR').AsFloat;
           CdsPendentes.Next;
        End;
        CdsPendentes.First;
        CdsPendentes.EnableControls;
     End;
  End;
end;

procedure TFrmAgrupaParcelaMT.AddAlLPendentesExecute(Sender: TObject);
begin
  inherited;
  grdPendentes.SelectAll;
  FuncaoGeral.MoveRegistros(grdPendentes, grdSelecionados);
  ActAgrupaParcela.Tag := 0;
end;

procedure TFrmAgrupaParcelaMT.AddPendentesExecute(Sender: TObject);
begin
  inherited;
  FuncaoGeral.MoveRegistros(grdPendentes, grdSelecionados);
  ActAgrupaParcela.Tag := 0;
end;

procedure TFrmAgrupaParcelaMT.DelSelecionadosExecute(Sender: TObject);
begin
  inherited;
  FuncaoGeral.MoveRegistros(grdSelecionados, grdPendentes);
  ActAgrupaParcela.Tag := 0;
end;

procedure TFrmAgrupaParcelaMT.DelAlLSelecionadosExecute(Sender: TObject);
begin
  inherited;
  grdSelecionados.SelectAll;
  FuncaoGeral.MoveRegistros(grdSelecionados, grdPendentes);
  ActAgrupaParcela.Tag := 0;
end;

procedure TFrmAgrupaParcelaMT.rdbDiariaClick(Sender: TObject);
begin
  inherited;
  If StrToIntDef(spnFrequencia.Text,-1) <> -1 Then
     If Sender Is TRadioButton Then
     Begin
        Case TRadioGroup(Sender).Tag of
           0:
           Begin
              if spnFrequencia.value = 1 then
                 lblFrequencia.Caption := 'dia'
              else
                 lblFrequencia.Caption := 'dias';
           End;
           1:
           Begin
              if spnFrequencia.value = 1 then
                 lblFrequencia.Caption := 'mês'
              else
                 lblFrequencia.Caption := 'meses';
           End;
           2:
           Begin
              if spnFrequencia.value = 1 then
                 lblFrequencia.Caption := 'ano'
              else
                 lblFrequencia.Caption := 'anos';
           End;
        End;

        BtnRecalcula.Click;
     End;
end;

procedure TFrmAgrupaParcelaMT.spnFrequenciaChange(Sender: TObject);
begin
  inherited;
  If rdbDiaria.Checked Then
     rdbDiariaClick(rdbDiaria)
  Else
    If rdbMensal.Checked Then
       rdbDiariaClick(rdbMensal)
    Else
      If rdbAnual.Checked Then
         rdbDiariaClick(rdbAnual);
end;

procedure TFrmAgrupaParcelaMT.spnTotParcelasChange(Sender: TObject);
Var
  X, iNumRegToDelete, iNumRegToInsert, iNumRecInicial: Integer;
begin
  inherited;
  //Verifica se o número de parcelas no controle foi zerado
  If StrToIntDef(spnTotParcelas.Text,-1) = -1 Then Exit;

  If CdsParcelas.State In [DsEdit, DsInsert] Then CdsParcelas.Post;

  If CdsParcelas.RecordCount < spnTotParcelas.Value Then
  Begin
     bDivideParcelas := True;

     iNumRecInicial := CdsParcelas.RecordCount;
     iNumRegToInsert := (spnTotParcelas.Value - CdsParcelas.RecordCount);

     CdsParcelas.DisableControls;
     Try
        For X:= 1 To iNumRegToInsert Do
        Begin
           CdsParcelas.Append;

           CdsParcelas.FieldByName('DATALANCTO').AsDateTime := dteLancamento.Date;
           CdsParcelas.FieldByName('DATAEMISSAO').AsDateTime := dteEmissao.Date;
           CdsParcelas.FieldByName('CODTIPDOC').AsInteger := StrToInt(cmbTipoDoc.LookupValue);
           CdsParcelas.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
           CdsParcelas.FieldByName('COMPLDOCUMENTO').AsInteger := (iNumRecInicial + X);
           CdsParcelas.FieldByName('NUMFATURA').AsInteger := iNumFatura;
           CdsParcelas.FieldByName('NODOCUMENTO').AsInteger := iNumFatura;

           CdsParcelas.Post;
        End;
     Finally
        CdsParcelas.EnableControls;
     End;

     BtnRecalcula.Click;
  End
  Else
  Begin
     If CdsParcelas.RecordCount > spnTotParcelas.Value Then
     Begin
        CdsParcelas.DisableControls;
        Try
           bDivideParcelas := True;

           iNumRegToDelete := (CdsParcelas.RecordCount - spnTotParcelas.Value);
           CdsParcelas.Last;
           For X := 1  To iNumRegToDelete Do
              CdsParcelas.Delete;
        Finally
           CdsParcelas.EnableControls;
        End;

        BtnRecalcula.Click;
     End
  End;

  TbsPaginas.Tabs.Clear;
  For X := 1 To CdsParcelas.RecordCount Do
      TbsPaginas.Tabs.Add(IntToStr(X));

  CdsParcelas.First;
  TbsPaginas.TabIndex := 0;

  If DbeDocumetno.CanFocus Then DbeDocumetno.SetFocus;
end;

procedure TFrmAgrupaParcelaMT.TbsPaginasChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
Var
  X: Integer;
begin
  inherited;
  If CdsParcelas.State In [DsEdit, DsInsert] Then CdsParcelas.Post;

  CdsParcelas.DisableControls;
  CdsParcelas.First;

  For X:=1 To NewTab Do
     CdsParcelas.Next;

  CdsParcelas.EnableControls;
end;

procedure TFrmAgrupaParcelaMT.ImgProcuraBancoClick(Sender: TObject);
begin
  inherited;
  If Not (CdsParcelas.State In [DsEdit,DsInsert]) Then CdsParcelas.Edit;

  With DtmDadosBancarios Do
  Begin
     SetaFiltroMs(CPForCli.ForcliReg.Id);
     If MsContaCor.Executar = MrOk Then
     Begin
       CdsParcelas.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]); //CONTABANCARIA.IDCBANCARIA
       CdsParcelas.FieldByName('CONTACORRENTE').AsString := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
       CdsParcelas.FieldByName('NUMBANCO').AsString := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
       CdsParcelas.FieldByName('NUMAGENCIA').AsString := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
       CdsParcelas.FieldByName('DESCTIPOCONTA').AsString := MsContaCor.ValoresChave[4]; //CONTABANCARIA.TIPOCONTA
     End;
  End;
end;

procedure TFrmAgrupaParcelaMT.BtnalterarClick(Sender: TObject);
begin
  inherited;
  If (Trim(CPForCli.Text) <> '') And
     (CPForCli.Valida = vcOk) Then
  Begin
     GpbFatura.Enabled := (_Operacao <> opInserir);
     If GpbFatura.CanFocus Then GpbFatura.SetFocus;

     SQLFatura.Prepare;
     SQLFatura.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SQLFatura.ParamByName('OPERACAO1').AsString := sOperacao1;
     SQLFatura.ParamByName('OPERACAO3').AsString := sOperacao3;
     SQLFatura.ParamByName('IDFORCLI').AsInteger := CPForCli.ForCliReg.Id;
     SQLFatura.Open;
  End;
end;

procedure TFrmAgrupaParcelaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _Documento.Free;
  _LancDocCapCar.Free;
end;

procedure TFrmAgrupaParcelaMT.ImgGeraApClick(Sender: TObject);
begin
  inherited;
  If Not (CdsParcelas.State In [DsEdit, DsInsert]) Then CdsParcelas.Edit;
  
  CdsParcelas.FieldByName('NUMAPGR').AsInteger := _Documento.GetNumApGr;
end;

procedure TFrmAgrupaParcelaMT.ExibeMensagem(sMens: String);
begin
  MsgDlg(sMens, 'Atenção', mtWarning, [mbOk], 0 );
end;

procedure TFrmAgrupaParcelaMT.BtnRecalculaClick(Sender: TObject);
Var
  iTipoFrequencia, iFatorFrequencia: Integer;
  dDataFrequencia, dDataInIFrequencia: TDateTime;
  rValorTotal: Double;
begin
  inherited;

  If CdsParcelas.Active Then
  Begin
     iTipoFrequencia := 0;
     
     CdsParcelas.DisableControls;
     Try

        If rdbDiaria.Checked Then
           iTipoFrequencia := 0
        Else
          If rdbMensal.Checked Then
             iTipoFrequencia := 1
          Else
            If rdbAnual.Checked Then
               iTipoFrequencia := 12;

        iFatorFrequencia := 0;
        CdsParcelas.First;

        If CdsParcelas.FieldByName('DATAVENCTO').IsNull Then
           dDataInIFrequencia := dteLancamento.Date
        Else
           dDataInIFrequencia := CdsParcelas.FieldByName('DATAVENCTO').AsDateTime;

        While Not CdsParcelas.Eof Do
        Begin
           CdsParcelas.Edit;

           If iFatorFrequencia = 0 Then
              dDataFrequencia := dDataInIFrequencia
           Else
           Begin
              If iTipoFrequencia = 0 Then
                 dDataFrequencia := (dDataInIFrequencia + (iFatorFrequencia * spnFrequencia.Value))
              Else
                 dDataFrequencia := IncMonth(dDataInIFrequencia, iFatorFrequencia * iTipoFrequencia * spnFrequencia.Value);
           End;

           Inc(iFatorFrequencia);

           CdsParcelas.FieldByName('DATAVENCTO').AsDateTime := dDataFrequencia;
           CdsParcelas.FieldByName('DATAPROGRAMADA').AsDateTime := dDataFrequencia;
           CdsParcelas.Post;

           CdsParcelas.Next;
        End;

        CdsParcelas.First;
        rValorTotal := 0;

        If bDivideParcelas Then
        Begin
           While Not CdsParcelas.Eof Do
           Begin
             CdsParcelas.Edit;
             CdsParcelas.FieldByName('VALOR').AsFloat := RoundCM((ReTotSelecionados.Value / spnTotParcelas.Value), 2);
             CdsParcelas.Post;

             rValorTotal := rValorTotal + CdsParcelas.FieldByName('VALOR').AsFloat;

             CdsParcelas.Next;
           End;


           If RoundCM((ReTotSelecionados.Value - rValorTotal),2) <> 0 Then
           Begin
              CdsParcelas.Edit;
              CdsParcelas.FieldByName('VALOR').AsFloat := CdsParcelas.FieldByName('VALOR').AsFloat + RoundCM((ReTotSelecionados.Value - rValorTotal),2);
              CdsParcelas.Post;
           End;

           CdsParcelas.First;

           bDivideParcelas := True;
        End;
     finally
        CdsParcelas.EnableControls;
     End;
  End;
end;

procedure TFrmAgrupaParcelaMT.CdsPendentesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';

  If DataSet.FindField('VALOROUTRAMOEDA') <> nil Then
     TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';

  DataSet.DisableControls;
  DataSet.First;
  while not DataSet.Eof do
  begin
     _Documento.Saldo.CalculaSaldo(DataSet.FieldByName('CODDOCUMENTO').AsFloat);

     DataSet.Edit;
     DataSet.FieldByName('VALOR').AsFloat := _Documento.Saldo.Valor;
     DataSet.Post;

     DataSet.Next;
  end;
  DataSet.First;
  DataSet.EnableControls;
end;

procedure TFrmAgrupaParcelaMT.dblFaturaChange(Sender: TObject);
begin
  inherited;
  dteLancamento.Modified := True;
end;

procedure TFrmAgrupaParcelaMT.CPForCliChange(Sender: TObject);
begin
  inherited;
  dteLancamento.Modified := True;
end;

procedure TFrmAgrupaParcelaMT.ActAgrupaParcelaExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  dteLancamento.Modified := True;
end;

class procedure TFrmAgrupaParcelaMT.AbrirForm(
  OperacaoForm: TOperacaoForm; DadosParcela: TParcelaAutomatica);
begin
  If ExisteForm(FrmAgrupaParcelaMT) Then
     MsgDlg('A tela de ' + FrmAgrupaParcelaMT.Caption + ' está aberta, para acessar outra opção é obrigatório sair da operação atual.', 'Atenção', mtInformation, [ MbOk ], 0)
  Else
  Begin
     Case OperacaoForm of
     opfDocumento:
       begin
           sTipoDocumento := 'Documentos';
           sOperacao1 := '1';
           sOperacao3 := '3';
       end ;
     opfContratoPrev:
       begin
           sTipoDocumento := 'Contrato\Previsão';
           sOperacao1 := '11';
           sOperacao3 := '13';
       end;
     end;

     uFormManager.AbrirForm(FrmAgrupaParcelaMT, TFrmAgrupaParcelaMT, false);

     If ( Trim(DadosParcela.RazaoSocial) <> '' ) Then
     Begin
        FrmAgrupaParcelaMT.CPForCli.Text :=  DadosParcela.RazaoSocial;
        FrmAgrupaParcelaMT._Operacao := opInserir;
        FrmAgrupaParcelaMT.dteLancamento.Modified := True;
        If FrmAgrupaParcelaMT.CdsParcelas.Active Then FrmAgrupaParcelaMT.CdsParcelas.Close;
        FrmAgrupaParcelaMT.CPForCliExit(FrmAgrupaParcelaMT);
        FrmAgrupaParcelaMT.BtnAvancar.Click;

        If ( FrmAgrupaParcelaMT.NtbAgrupaParcela.PageIndex = 1 ) Then
        Begin
           ( FrmAgrupaParcelaMT.CdsPendentes.Locate('CODDOCUMENTO', DadosParcela.CodDocumento , []) );
           
           FrmAgrupaParcelaMT.dteLancamento.Date := DadosParcela.DataLancto;
           FrmAgrupaParcelaMT.dteEmissao.Date := DadosParcela.DataEmissao;
           FrmAgrupaParcelaMT.cmbTipoDoc.LookupValue := IntToStr(DadosParcela.TipoDeDocumento);
           FrmAgrupaParcelaMT.cmbFormaPag.LookupValue := IntToStr(DadosParcela.PortadorForma);
           FrmAgrupaParcelaMT.DblCodForma.LookupValue := IntToStr(DadosParcela.FormaDePagamento);
        End;
     End;
  End;
end;

procedure TFrmAgrupaParcelaMT.BtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If _LancDocCapCar.ProcessaAgrupaParcela(Sistema.IdUsuario, Sistema.IdEspAcesso,
     ParamIntegra.IntegraContab, ( sOperacao3 = '13' ), Sistema.UsaPlanoPatro,
     CdsSelecionados.Data, CdsParcelas.Data, _Operacao, dteLancamento.Date,
     dteEmissao.Date, StrToIntDef(cmbTipoDoc.LookupValue, 0), StrToIntDef(cmbFormaPag.LookupValue,0),
     StrToIntDef(DblCodForma.LookupValue,0), Sistema.IdModulo, ParamIntegra.Plano,
     StrToIntDef(dblFatura.LookupValue,0), ParamIntegra.PartidaDobrada ) then
  begin
     dteLancamento.Modified := True;
     NtbAgrupaParcela.PageIndex := 0;
     dblFatura.Clear;
     CPForCli.Text := '';

    if _Operacao in [ opInserir, opAlterar ] then
       _LancDocCapCar.ImprimeEspelhoDoc( _LancDocCapCar.CodDocumento, Modulo.IdReports, Modulo.NomeReport, opldAgrupaParcela );

     MsgDlg('Operação concluída com sucesso!', 'Atenção', mtInformation, [mbOk], 0 );
  end;
end;

procedure TFrmAgrupaParcelaMT.CdsParcelasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsParcelas.FieldByName('RECPAG').AsString := ParamIntegra.RecPag;
end;

procedure TFrmAgrupaParcelaMT.DsParcelasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  EdtNumAp.Enabled := ( _Operacao = opInserir ) or ( Trim(EdtNumAp.Text) = '') ;
  ImgGeraAp.Enabled := EdtNumAp.Enabled ;
end;

end.



