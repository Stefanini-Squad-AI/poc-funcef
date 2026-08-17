{
--------------------------------------------------------------------------------
Pendência   : WO29236
Responsável : Leandro Pocebon
Data        : 18/12/2025
Descrição   : Ajuste consulta para oracle
--------------------------------------------------------------------------------
Pendência   : SIG97793
Responsável : Taffarel Sevaybriker
Data        : 04/03/2020
Descrição   : Sistema não carrega todos os itens das parcelas.
--------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 25/10/2018
Descrição   : Alterar owner da tabela CONTRATOAD
--------------------------------------------------------------------------------
Pendência   : SOL 149398 KINTANA 1068868
Responsável : Vinicius Ferreira
Data        : 24/08/2011
Descrição   : Alterar filtros da funcionalidade Ajuste na forma de envio.
--------------------------------------------------------------------------------
Pendência   : SOL 92995 KINTANA 569455
Responsável : BRUNO AZEVEDO
Data        : 13/09/2010
Descrição   : Criação da funcionalidade "Ajuste na forma de envio".
--------------------------------------------------------------------------------
}
unit FAjusteFormaEnvio;

interface

uses
   Windows, Messages, Classes, Graphics, Controls, StdCtrls, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, fcButton, fcImgBtn, fcShapeBtn, wwdbdatetimepicker,
   CMDateTimePicker, Mask, wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio,
   IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst,
   Db, DBTables, mPatro, mContratoEmptmo, FSairAjudaImob, Wwquery, TREdit,
   uTypesEmptmo, Forms, mListaPlano, mListaPatro, Wwdatsrc;

 type
   TfrmAjusteFormaEnvio = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    pgPrincipal: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContrato: TwwDBLookupCombo;
    molContratoEmptmo: TmolContratoEmptmo;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;
    Label15: TLabel;
    SpnAnoRef: TwwDBSpinEdit;
    cboMesRef: TComboBox;
    Label4: TLabel;
    SpnAnoCobr: TwwDBSpinEdit;
    cboMesCobr: TComboBox;
    TB97oKCancelar: TToolbar97;
    ToolbarSep976: TToolbarSep97;
    ToolbarSep977: TToolbarSep97;
    btnVoltar: TBitBtn;
    btnContinuar: TBitBtn;
    rdgArquivo: TRadioGroup;
    TabSheet2: TTabSheet;
    dbGridDados: TwwDBGrid;
    DBgrdDivEmpIButton: TwwIButton;
    edtIdContrato: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    edtMatricula: TEdit;
    dbGridItens: TwwDBGrid;
    wwIButton1: TwwIButton;
    rdgAjusteDebito: TRadioGroup;
    rdgAjusteCredito: TRadioGroup;
    btnAjustar: TfcShapeBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lstMov: TCheckListBox;
    btnInverteMov: TBitBtn;
    btnMarcaTodosMov: TBitBtn;
    Label12: TLabel;
    lstSit: TCheckListBox;
    btnInverteSit: TBitBtn;
    btnMarcaTodosSit: TBitBtn;
    Label13: TLabel;
    qryContratos: TwwQuery;
    dsContratos: TwwDataSource;
    qryContratosSELECAO: TFloatField;
    qryContratosMESREF: TStringField;
    qryContratosMESCOBR: TStringField;
    qryContratosMATRICULA: TStringField;
    qryContratosSITMUTUARIO: TStringField;
    qryContratosFORMAENVIO: TStringField;
    qryItens: TwwQuery;
    dsItens: TwwDataSource;
    qryItensSELECAO: TFloatField;
    qryItensMESREF: TStringField;
    qryItensMESCOBR: TStringField;
    qryItensITEM: TStringField;
    qryItensMOVIMENTACAO: TStringField;
    qryItensOPERACAO: TStringField;
    qryItensFORMAAJUSTADA: TStringField;
    upd: TUpdateSQL;
    btnInvertSelecao: TBitBtn;
    btnMarcaTodos: TBitBtn;
    Label14: TLabel;
    Label16: TLabel;
    edtMesRef: TEdit;
    edtMesCobr: TEdit;
    ToolbarSep973: TToolbarSep97;
    btnConfirmar: TfcShapeBtn;
    qryItensVALOR: TFloatField;
    qryItensSITUACAO: TStringField;
    qryItensCONTRATO: TFloatField;
    qryItensFORMAATUAL: TStringField;
    qryItensHMEVLRPREVISTO: TFloatField;
    qryItensMATRICULA: TStringField;
    qryItensHMERECPAG: TStringField;
    qryContratosCONTRATO: TFloatField;
    qryContratosTOTALCREDITO: TFloatField;
    qryContratosTOTALDEBITO: TFloatField;
    Upd2: TUpdateSQL;
    edtFBDebito: TPanel;
    edtFPDebito: TPanel;
    edtFIDebito: TPanel;
    edtFBCredito: TPanel;
    edtFPCredito: TPanel;
    edtFICredito: TPanel;
    qryUpdate: TwwQuery;
    qryItensID: TFloatField;
    Label17: TLabel;
    edtFDDebito: TPanel;
    edtFDCredito: TPanel;
    qryItensTIPOCONTRATO: TFloatField;
    qryContratosTCEDESCRICAO: TStringField;
    qryItensHMETIPOFOLHA: TStringField;
    qryItensHMEFORMACOBRANCA: TStringField;
    GroupBox2: TGroupBox;
    edtDataInicioVencimento: TwwDBDateTimePicker;
    edtDataFimVencimento: TwwDBDateTimePicker;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
    procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
    procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
    procedure btnInverteMovClick(Sender: TObject);
    procedure btnMarcaTodosMovClick(Sender: TObject);
    procedure btnInverteSitClick(Sender: TObject);
    procedure btnMarcaTodosSitClick(Sender: TObject);
    procedure dbGridDadosCellChanged(Sender: TObject);
    procedure dbGridDadosDblClick(Sender: TObject);
    procedure btnMarcaTodosClick(Sender: TObject);
    procedure btnInvertSelecaoClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbGridItensDblClick(Sender: TObject);
    procedure btnAjustarClick(Sender: TObject);

  private
    vIDSit: array of Int64;
    sAnoRef, sMesRef: String;
    sAnoMesRef: String;
    sAnoCobr, sMesCobr: String;
    sAnoMesCobr: String;
    sContrato: String;
    // Vinicius Ferreira SOL 149398 KINTANA 1068868
    sDtVencimentoInicio : TDateTime;
    sDtVencimentofim : TDateTime;

    procedure CarregaCampos();
    function  Validacao(): Boolean;
    procedure CarregaDados();
    function  PegaMovimentos(): String;
    procedure PreencheSituacao();
    function  PegaSituacoes(): String;
    procedure AtualizaValores();
    procedure AbreQryItens();
    procedure AbreQryContratos();
    procedure FinalizaProcesso();
    function  ConsiderarParametrizacao(pTipoContr: Integer): String;
  public

  end;        

var
  frmAjusteFormaEnvio: TfrmAjusteFormaEnvio;

implementation

uses
   Dialogs, SysUtils, USistema, UDataBase, UMensErro, UFuncoesEmptmo, FProgresso, dBaseDados,
   uModulo, uVerificaPreenchimento, DLookEmptmo, dMS, uIntegraEmptmo, DEmptmo, uDiasUteis;

{$R *.DFM}

procedure TfrmAjusteFormaEnvio.FormShow(Sender: TObject);
begin
  inherited;
  // Vinicius Ferreira SOL 149398 KINTANA 1068868
  cboMesRef.ItemIndex := 0;
  cboMesCobr.ItemIndex := 0;
  //cboMesRef.ItemIndex := DiasUteis.ExtraiMes(Date);
  //SpnAnoRef.Value     := DiasUteis.ExtraiAno(Date);
  SpnAnoRef.Text     := '';
  //cboMesCobr.ItemIndex := DiasUteis.ExtraiMes(Date);
  //SpnAnoCobr.Value     := DiasUteis.ExtraiAno(Date);
  SpnAnoCobr.Text     := '';

  CarregaCampos();
  FinalizaProcesso();

  //PREENCHER AS PATROCINADORAS
  molListaPatro.PreenchePatro;
  //MARCAR TODAS COMO DEFAULT
  molListaPatrobtnMarcaTodosPatroClick(self);

  //PREENCHER OS PLANOS
  molListaPlano.PreenchePlano;
  //MARCAR TODOS COMO DEFAULT
  molListaPlanobtnMarcaTodosPlanoClick(self);

  //MARCAR TODOS OS MOVIMENTOS COMO DEFAULT
  btnMarcaTodosMovClick(self);

  //PREENCHER AS SITUAÇÕES
  PreencheSituacao();
  //MARCAR TODAS AS SITUAÇÕES COMO DEFAULT
  btnMarcaTodosSitClick(self);

end;

procedure TfrmAjusteFormaEnvio.CarregaCampos;
begin
  //COMBO TIPO DE EMPRESTIMO
  with dtmLookEmptmo.qryLookTipoEmptmo do
  begin
    LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
    ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
    Open;
  end;

  //COMBO TIPO DE CONTRATO
  LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
  dtmLookEmptmo.qryLookPlanPrev.Open;
end;  

function TfrmAjusteFormaEnvio.Validacao(): Boolean;
begin
  Result := False;

  if (edtDataInicioVencimento.Text = '') and (edtDataFimVencimento.Text <> '')  then begin
    MsgDlg('É necessário informar a data início de vencimento.','Atenção',mtWarning,[mbOk],0);
    Result := True;
  end;

  if (edtDataInicioVencimento.Text <> '') and (edtDataFimVencimento.Text = '')  then begin
    MsgDlg('É necessário informar a data final de vencimento.','Atenção',mtWarning,[mbOk],0);
    Result := True;
  end;

end;

procedure TfrmAjusteFormaEnvio.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //FILTRAR OS TIPOS DE CONTRATO DO TIPO DE EMPRESTIMO ESCOLHIDO
  with dtmLookEmptmo.qryLookTipoContr do
  begin
    LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

    if DBcboTipoEmptmo.LookupValue <> '' then
    begin
       ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
       ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
    end;
    Open;

    DBcboTipoContrato.Enabled := True;
  end;
end;

procedure TfrmAjusteFormaEnvio.btnContinuarClick(Sender: TObject);
begin
  inherited;

  // Vinicius Ferreira SOL 149398 KINTANA 1068868
  if (Validacao) then begin
    Exit;
  end;

  try
    CarregaDados();

    pgPrincipal.ActivePageIndex := 1;
    btnContinuar.Enabled := False;
    btnVoltar.Enabled    := True;
    btnAjustar.Enabled   := True;
    btnConfirmar.Enabled := True;
  finally
  end;
end;

procedure TFrmAjusteFormaEnvio.CarregaDados();
begin
  MostraEspera('Selecionando informações.');
  try

    //Inicio Vinicius Ferreira SOL 149398 KINTANA 1068868
    if SpnAnoRef.Text <> '' then begin
     sAnoRef    := FormatFloat('0000', SpnAnoRef.Value);
    end else begin
     sAnoRef := '';
    end;
    sMesRef    := FormatFloat('0', cboMesRef.ItemIndex);
    sAnoMesRef := FormatFloat('0000', SpnAnoRef.Value) + '/' + FormatFloat('00', cboMesRef.ItemIndex + 1);

    if SpnAnoCobr.Text <> '' then begin
     sAnoCobr    := FormatFloat('0000', SpnAnoCobr.Value);
    end else begin
     sAnoCobr := '';
    end;
    sMesCobr    := FormatFloat('0', cboMesCobr.ItemIndex);
    sAnoMesCobr := FormatFloat('0000', SpnAnoCobr.Value) + '/' + FormatFloat('00', cboMesCobr.ItemIndex + 1);

    sDtVencimentoInicio := edtDataInicioVencimento.Date;
    sDtVencimentofim := edtDataFimVencimento.Date;
    //fim Vinicius Ferreira SOL 149398 KINTANA 1068868

    //CARREGAR OS ITENS
    qryItens.Filtered := False;
    AbreQryItens();
    if (qryItens.IsEmpty) then begin
      MsgDlg('Não existem informações com os filtros selecionados! ','Erro',mtError,[mbOk],0);
      Exit;
    end;

    //CARREGAR OS CONTRATOS
    AbreQryContratos();
    if (qryContratos.IsEmpty) then begin
      MsgDlg('Não existem informações com os filtros selecionados! ','Erro',mtError,[mbOk],0);
      Exit;
    end;

    //ATUALIZAR OS VALORES DE DEBITO E CRÉDITO
    AtualizaValores();
  finally
    EscondeEspera();
  end;
end;

procedure TfrmAjusteFormaEnvio.btnVoltarClick(Sender: TObject);
begin
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    if (MsgDlg('Existem processos que não foram salvos. Deseja voltar a tela?', 'Informação',
                      mtInformation, [mbYes, mbNo], 0) = mrYes) then begin
      dtmBaseDados.dbBaseDados.RollBack;
      inherited;
      FinalizaProcesso();
    end;
  end else begin
    inherited;
    FinalizaProcesso();
  end;
end;

procedure TfrmAjusteFormaEnvio.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
  inherited;
  molListaPatro.btnInvertePatroClick(Sender);
end;

procedure TfrmAjusteFormaEnvio.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
  inherited;
  molListaPatro.btnMarcaTodosPatroClick(Sender);
end;

procedure TfrmAjusteFormaEnvio.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
  inherited;
  molListaPlano.btnInvertePlanoClick(Sender);
end;

procedure TfrmAjusteFormaEnvio.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
  inherited;
  molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;
  
procedure TfrmAjusteFormaEnvio.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnBuscaContratoClick(Sender);
end;

procedure TfrmAjusteFormaEnvio.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);
end;      

procedure TfrmAjusteFormaEnvio.btnInverteMovClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to (lstMov.Items.Count - 1) do lstMov.Checked[i] := not(lstMov.Checked[i]);
end;

procedure TfrmAjusteFormaEnvio.btnMarcaTodosMovClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to (lstMov.Items.Count - 1) do lstMov.Checked[i] := True;
end;

function TfrmAjusteFormaEnvio.PegaMovimentos(): String;
var
  i: Integer;
  sMovs: String;
begin
  inherited;
  sMovs := '';

  for i := 0 to (lstMov.Items.Count - 1) do begin
    if (lstMov.Checked[i]) then begin
      if (sMovs <> '') then begin
        sMovs := sMovs + ', ';
      end;
      sMovs := sMovs + IntToStr(i);
    end;
  end;

  Result := sMovs;
end;

procedure TfrmAjusteFormaEnvio.PreencheSituacao();
var
  i : Integer;
begin
  if not(dtmLookEmptmo.qryLookSitPart.Active) then begin
    dtmLookEmptmo.qryLookSitPart.Open;
  end;
  dtmLookEmptmo.qryLookSitPart.First;

  lstSit.Items.Clear;

  i := 0;
  SetLength(vIDSit, i); 
  while not(dtmLookEmptmo.qryLookSitPart.EOF) do begin
    lstSit.Items.Add(dtmLookEmptmo.qryLookSitPartDESCRICAO.AsString);

    inc(i);
    SetLength(vIDSit, i);
    vIDSit[i-1] := dtmLookEmptmo.qryLookSitPartIDSITPART.AsInteger;

    dtmLookEmptmo.qryLookSitPart.Next;
  end;
end;

procedure TfrmAjusteFormaEnvio.btnInverteSitClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to (lstSit.Items.Count - 1) do lstSit.Checked[i] := not(lstSit.Checked[i]);
end;

procedure TfrmAjusteFormaEnvio.btnMarcaTodosSitClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to (lstSit.Items.Count - 1) do lstSit.Checked[i] := True;
end;

function TfrmAjusteFormaEnvio.PegaSituacoes(): String;
var
  i: Integer;
  sSits: String;
begin
  inherited;
  sSits := '';

  for i := 0 to (lstSit.Items.Count - 1) do begin
    if (lstSit.Checked[i]) then begin
      if (sSits <> '') then begin
        sSits := sSits + ', ';
      end;
      sSits := sSits + IntToStr(vIDSit[i]);
    end;
  end;

  Result := sSits;
end;

procedure TfrmAjusteFormaEnvio.dbGridDadosCellChanged(Sender: TObject);
begin
  inherited;
  if (qryContratos.Active) then begin
    edtIdContrato.Text := qryContratos.FieldByName('Contrato').AsString;
    edtMatricula.Text  := qryContratos.FieldByName('Matricula').AsString;
    edtMesRef.Text     := qryContratos.FieldByName('MesRef').AsString;
    edtMesCobr.Text    := qryContratos.FieldByName('MesCobr').AsString;
  end;

  qryItens.Filtered := False;
  qryItens.Filter   := 'CONTRATO = ' + qryContratos.FieldByName('Contrato').AsString;
  qryItens.Filtered := True;
end;

procedure TfrmAjusteFormaEnvio.dbGridDadosDblClick(Sender: TObject);
begin
  inherited;
  if (qryContratos.Active) then begin
    qryContratos.Edit;
    if (qryContratos.FieldByName('Selecao').AsFloat = 1) then begin
      qryContratos.FieldByName('Selecao').AsFloat := 0;
    end else begin
      qryContratos.FieldByName('Selecao').AsFloat := 1;
    end;
    qryContratos.Post;

    qryItens.First;
    while not qryItens.Eof do begin
      qryItens.Edit;
      if (qryContratos.FieldByName('Selecao').AsFloat = 1) then begin
        qryItens.FieldByName('Selecao').AsFloat := 1;
      end else begin
        qryItens.FieldByName('Selecao').AsFloat := 0;
      end;
      qryItens.FieldByName('Valor').AsString := qryItens.FieldByName('Valor').AsString;
      qryItens.Post;

      qryItens.Next;
    end;
  end;
end;

procedure TfrmAjusteFormaEnvio.btnMarcaTodosClick(Sender: TObject);
begin
  inherited;
  MostraEspera('Selecionando informações.');
  qryContratos.DisableControls;
  if (qryContratos.Active) then begin
    qryContratos.First;
    while not qryContratos.Eof do begin
      qryContratos.Edit;
      qryContratos.FieldByName('Selecao').AsFloat := 1;
      qryContratos.Post;

      qryContratos.Next;
    end;
    qryContratos.First;
  end;
  qryContratos.EnableControls;

  qryItens.DisableControls;
  if (qryItens.Active) then begin
    qryItens.Filtered := False;
    qryItens.First;
    while not qryItens.Eof do begin
      qryItens.Edit;
      qryItens.FieldByName('Selecao').AsFloat := 1;
      qryItens.Post;

      qryItens.Next;
    end;
    qryItens.First;
    qryItens.Filtered := False;
    qryItens.Filter   := 'CONTRATO = ' + qryContratos.FieldByName('Contrato').AsString;
    qryItens.Filtered := True;
  end;
  qryItens.EnableControls;
  EscondeEspera();
end;

procedure TfrmAjusteFormaEnvio.btnInvertSelecaoClick(Sender: TObject);
begin
  inherited;
  MostraEspera('Selecionando informações.');
  qryContratos.DisableControls;
  if (qryContratos.Active) then begin
    qryContratos.First;
    while not qryContratos.Eof do begin
      qryContratos.Edit;
      if (qryContratos.FieldByName('Selecao').AsFloat = 1) then begin
        qryContratos.FieldByName('Selecao').AsFloat := 0;
      end else begin
        qryContratos.FieldByName('Selecao').AsFloat := 1;
      end;
      qryContratos.Post;

      qryContratos.Next;
    end;
    qryContratos.First;
  end;
  qryContratos.EnableControls;

  qryItens.DisableControls;
  if (qryItens.Active) then begin
    qryItens.Filtered := False;
    qryItens.First;
    while not qryItens.Eof do begin
      qryItens.Edit;
      if (qryItens.FieldByName('Selecao').AsFloat = 1) then begin
        qryItens.FieldByName('Selecao').AsFloat := 0;
      end else begin
        qryItens.FieldByName('Selecao').AsFloat := 1;
      end;
      qryItens.Post;

      qryItens.Next;
    end;
    qryItens.First;
    qryItens.Filtered := False;
    qryItens.Filter   := 'CONTRATO = ' + qryContratos.FieldByName('Contrato').AsString;
    qryItens.Filtered := True;
  end;
  qryItens.EnableControls;
  EscondeEspera();
end;

procedure TfrmAjusteFormaEnvio.AtualizaValores();
begin
  inherited;
  edtFBDebito.Caption  := '0';
  edtFBCredito.Caption := '0';
  edtFPDebito.Caption  := '0';
  edtFPCredito.Caption := '0';
  edtFIDebito.Caption  := '0';
  edtFICredito.Caption := '0';
  edtFDDebito.Caption  := '0';
  edtFDCredito.Caption := '0';
  
  qryItens.DisableControls;
  qryItens.Filtered := False;
  qryItens.First;
  while not (qryItens.Eof) do begin
    if (qryItens.FieldByName('HMETIPOFOLHA').AsString = 'B') then begin
      if (qryItens.FieldByName('HMERECPAG').AsString = 'R') then begin
        edtFBDebito.Caption := FloatToStr(StrToFloat(edtFBDebito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end else begin
        edtFBCredito.Caption := FloatToStr(StrToFloat(edtFBCredito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end;
    end else if (qryItens.FieldByName('HMETIPOFOLHA').AsString = 'P') then begin
      if (qryItens.FieldByName('HMERECPAG').AsString = 'R') then begin
        edtFPDebito.Caption := FloatToStr(StrToFloat(edtFPDebito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end else begin
        edtFPCredito.Caption := FloatToStr(StrToFloat(edtFPCredito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end;
    end else if (qryItens.FieldByName('HMETIPOFOLHA').AsString = '') and
                (qryItens.FieldByName('HMEFORMACOBRANCA').AsString = 'C') then begin
      if (qryItens.FieldByName('HMERECPAG').AsString = 'R') then begin
        edtFIDebito.Caption := FloatToStr(StrToFloat(edtFIDebito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end else begin
        edtFICredito.Caption := FloatToStr(StrToFloat(edtFICredito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end;
    end else if (qryItens.FieldByName('HMETIPOFOLHA').AsString = '') and
                (qryItens.FieldByName('HMEFORMACOBRANCA').AsString = 'F') then begin
      if (qryItens.FieldByName('HMERECPAG').AsString = 'R') then begin
        edtFDDebito.Caption := FloatToStr(StrToFloat(edtFDDebito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end else begin
        edtFDCredito.Caption := FloatToStr(StrToFloat(edtFDCredito.Caption) + qryItens.FieldByName('VALOR').AsFloat);
      end;
    end;
    qryItens.Next;
  end;
  qryItens.First;
  qryItens.Filtered := True;
  qryItens.EnableControls;

  edtFBDebito.Caption  := FormatFloat('#,###0.00',StrToFloat(edtFBDebito.Caption));
  edtFBCredito.Caption := FormatFloat('#,###0.00',StrToFloat(edtFBCredito.Caption));
  edtFPDebito.Caption  := FormatFloat('#,###0.00',StrToFloat(edtFPDebito.Caption));
  edtFPCredito.Caption := FormatFloat('#,###0.00',StrToFloat(edtFPCredito.Caption));
  edtFIDebito.Caption  := FormatFloat('#,###0.00',StrToFloat(edtFIDebito.Caption));
  edtFICredito.Caption := FormatFloat('#,###0.00',StrToFloat(edtFICredito.Caption));
  edtFDDebito.Caption  := FormatFloat('#,###0.00',StrToFloat(edtFDDebito.Caption));
  edtFDCredito.Caption := FormatFloat('#,###0.00',StrToFloat(edtFDCredito.Caption));
end;

procedure TfrmAjusteFormaEnvio.AbreQryItens();
begin
  inherited;
  with qryItens do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT ');
    Sql.Add(' 0 AS SELECAO,');
    Sql.Add('  HME.IDCONTRATOEMPTMO CONTRATO,');
    Sql.Add('  CON.IDTIPOCONTREMPTMO TIPOCONTRATO,');
    Sql.Add('  HME.IDHISTMOVEMPTMO ID,');
    //WO29236 - Leandro Inicio
    Sql.Add(' CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, ''0000'')))) || ''/'' ||');
    Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, ''00''))))  AS VARCHAR(7)) AS MESCOBR,');
    Sql.Add(' CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || ''/'' ||');
    Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00''))))  AS VARCHAR(7)) AS MESREF,');
    //WO29236 - Leandro Fim
    Sql.Add(' CON.MATRICULA_TIT AS MATRICULA,');
    Sql.Add(' CON.SIT_TITULAR AS SITUACAO,');
    Sql.Add(' DECODE(CON.FORMAATUAL, ''F'', ''Folha''');
    Sql.Add('                      , ''C'', ''Financeiro'') AS FORMAATUAL,');
    Sql.Add(' HME.HMEVLRPREVISTO AS HMEVLRPREVISTO,');
    Sql.Add(' HME.HMERECPAG AS HMERECPAG,');
    Sql.Add(' ITE.ITEDESCRICAO AS ITEM,');
    Sql.Add(' DECODE(HME.HMETIPOMOV, 0, ''Concessão/Renovação''');
    Sql.Add('                      , 1, ''Prestação''');
    Sql.Add('                      , 2, ''Amortização/Refinanciamento''');
    Sql.Add('                      , 3, ''Quitação''');
    Sql.Add('                      , 4, ''Atualização de Débito''');
    Sql.Add('                      , 5, ''Atualização de Saldo Devedor (Diária)''');
    Sql.Add('                      , 6, ''Importação/Migração''');
    Sql.Add('                      , 7, ''Ajustes (Cobrança/Devolução)''');
    Sql.Add('                      , 8, ''Ajustes (Saldo Devedor)'') AS MOVIMENTACAO,');
    Sql.Add(' HME.HMEVLRPREVISTO AS VALOR,');
    Sql.Add(' DECODE(HME.HMERECPAG, ''P'', ''C''');
    Sql.Add('                     , ''R'', ''D'') AS OPERACAO,');
    Sql.Add(' HME.HMEFORMACOBRANCA AS HMEFORMACOBRANCA,');
    Sql.Add(' HME.HMETIPOFOLHA AS HMETIPOFOLHA,');
    Sql.Add(' DECODE(HME.HMETIPOFOLHA, ''B'', ''Folha de Benefícios''');
    Sql.Add('                        , ''P'', ''Folha da Patrocinadora''');
    Sql.Add('                        , '''',  DECODE(HME.HMEFORMACOBRANCA, ''F'', ''Folha não Definida''');
    Sql.Add('                                                            , ''C'', ''Financeiro'')) AS FORMAAJUSTADA');
    Sql.Add('FROM HISTMOVEMPTMO HME,');
    //Sql.Add(' VWMIGRACONTRATOEP MIG,');
    Sql.Add(' (SELECT CON.IDCONTRATOEMPTMO,');
    Sql.Add('         CON.IDINSCRICAOEMPTMO,');
    Sql.Add('         CON.IDCONTRQUITACAO,');
    Sql.Add('         CON.IDVERBA,');
    Sql.Add('         CON.FLGSITUACAO,');
    Sql.Add('         CON.NUMPARCELAS AS PRAZO,');
    Sql.Add('         CON.VLRCONTRATO,');
    Sql.Add('         CON.VLRPARCELA,');
    Sql.Add('         CON.TXJUROS,');
    Sql.Add('         CON.FLGFORMAPAG AS FORMAATUAL,');
    Sql.Add('         DECODE(ELP.IDPESSJURCEDIDO,');
    Sql.Add('                NULL,');
    Sql.Add('                CON.IDPATRO,');
    Sql.Add('                ELP.IDPESSJURCEDIDO) AS IDPATRO,');
    Sql.Add('         TEP.IDEMPRESAPROP,');
    Sql.Add('         CON.IDPLANOPREV,');
    Sql.Add('         NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM,');
    Sql.Add('         CON.IDTIPOCONTREMPTMO,');
    Sql.Add('         TCE.TCEDESCRICAO,');
    Sql.Add('         TCE.IDTIPOEMPTMO,');
    Sql.Add('         TEP.DESCTIPOEMPTMO,');
    Sql.Add('         CON.IDPESSOA,');
    Sql.Add('         CON.IDBENEF,');
    Sql.Add('         CON.IDCBANCARIA,');
    Sql.Add('         CON.MOECODIGO,');
    Sql.Add('         CON.IDCBANCARIADEB,');
    Sql.Add('         DECODE(DEP.MATRICULA, NULL, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_TIT,');
    Sql.Add('         CON.FLGSUSPENSAOAUTO,');
    Sql.Add('         CON.IDTIPOSUSPEMPTMO,');
    Sql.Add('         PPP.INSCRICAONUMERO,');
    Sql.Add('         NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO,');
    Sql.Add('         NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO,');
    Sql.Add('         NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA,');
    Sql.Add('         SIT.IDSITPART,');
    Sql.Add('         SIT.FLGINTERNO,');
    Sql.Add('         SIT.DESCRICAO AS SIT_TITULAR');
    Sql.Add('    FROM CONTRATOEMPTMO  CON,');
    Sql.Add('         PARTPREVPLAN    PPP,');
    Sql.Add('         ELEGPATRO       ELP,');
    Sql.Add('         DEPENTIT        DEP,');
    Sql.Add('         PATRO           PTR,');
    Sql.Add('         TIPOCONTREMPTMO TCE,');
    Sql.Add('         TIPOEMPTMO      TEP,');
    Sql.Add('         SITPART         SIT,');
    Sql.Add('         SITPLANOPREV    SPP');
    Sql.Add('   WHERE TEP.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa));
    Sql.Add('     AND CON.IDPATRO = PTR.IDPESSOA');
    Sql.Add('     AND CON.IDPATRO = PTR.IDPESSOA');
    Sql.Add('     AND CON.IDPESSOA = ELP.IDPESSOA');
    Sql.Add('     AND CON.IDPESSOA = PPP.IDPESSOA');
    Sql.Add('     AND CON.IDPESSOA = DEP.IDTITULAR');
    Sql.Add('     AND CON.IDBENEF = DEP.IDPESSOA');
    Sql.Add('     AND PTR.IDPESSOA = ELP.IDPESSJUR');
    Sql.Add('     AND CON.IDPATRO = PPP.IDPESSJUR');
    Sql.Add('     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO');
    Sql.Add('     AND TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO');
    Sql.Add('     AND PPP.IDSITPART = SIT.IDSITPART');
    Sql.Add('     AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV');
    Sql.Add('     AND ppp.idplanoprev = con.idplanoprev) CON,');
    //Sql.Add(' ITEMXTIPOCONTR ITC,');
    Sql.Add(' ITEMEMPTMO ITE,');
    Sql.Add(' TIPOSUSPEMPTMO SUSP');
    Sql.Add(' WHERE (HME.FLGENVIO = 0)');
    Sql.Add('   AND (HME.FLGBAIXADO = 0)');
    Sql.Add('   AND (HME.HMEVLREFETIVO IS NULL)');
    Sql.Add('   AND (HME.HMEDATAEFETIVA IS NULL)');
    Sql.Add('   AND (HME.HMEVLRPREVISTO <> 0)');
    Sql.Add('   AND (HME.CODDOCUMENTO IS NULL)');
    Sql.Add('   AND (HME.IDTMPDESC IS NULL)');

    //inicio Vinicius Ferreira SOL 149398 KINTANA 1068868
    if ((sAnoCobr <> '') and (sAnoCobr <> '0000')) then begin
      Sql.Add('   AND (HME.HMEANOCOBRANCA = ' + QuotedStr(sAnoCobr) + ')');
    end;

    if ((sMesCobr <> '') and (sMesCobr <> '0'))   then begin
      Sql.Add('   AND (HME.HMEMESCOBRANCA = ' + QuotedStr(sMesCobr) + ')');
    end;

    if ((sAnoRef <> '') and (sAnoRef <> '0000')) then begin
      Sql.Add('   AND (HME.HMEANOCOMPETENCIA = ' + QuotedStr(sAnoRef) + ')');
    end;

    if ((sMesRef <> '') and (sMesRef <> '0')) then begin
      Sql.Add('   AND (HME.HMEMESCOMPETENCIA = ' + QuotedStr(sMesRef) + ')');
    end;

    if (edtDataInicioVencimento.Text <> '') and (edtDataFimVencimento.Text <> '') then begin
      Sql.Add('   AND (HME.HMEDATAVENCTO BETWEEN TO_DATE(' + QuotedStr(DateToStr(sDtVencimentoInicio)) + ',''dd/mm/yyyy'') AND TO_DATE(' + QuotedStr(DateToStr(sDtVencimentofim)) + ',''dd/mm/yyyy''))');
    end;
    //fim Vinicius Ferreira SOL 149398 KINTANA 1068868


    Sql.Add('   AND (HME.HMECENTRALIZA + HME.HMEDESTACADO = 1)');
    Sql.Add('   AND (NVL(HME.FLGESTORNADO, 0) = 0)');
    Sql.Add('   AND (NVL(HME.FLGABONADO, 0) = 0)');
    Sql.Add('   AND (NVL(HME.FLGQUITADO, 0) = 0)');
    //Sql.Add('   AND ((NVL(HME.FLGSUSPENSAO, 0) = 0) OR (NVL(SUSP.FLGENVIA, 0) = 1))'); //TAES-SIG97793
    Sql.Add('   AND HME.IDTIPOSUSPEMPTMO = SUSP.IDTIPOSUSPEMPTMO(+)');
    Sql.Add('   AND (CON.FLGSITUACAO <> ''P'')');
    Sql.Add('   AND (CON.FLGSITUACAO <> ''C'')');

    if molContratoEmptmo.IDContrato > 0 then begin
      Sql.Add('   AND (CON.IDCONTRATOEMPTMO = ' + FormatFloat( #0, molContratoEmptmo.IDContrato) + ')');
    end;

    if (rdgArquivo.ItemIndex = 1) then begin
      Sql.Add('   AND CON.IDCONTRATOEMPTMO IN');
//      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD)'); //Everson Luiz - TIBERO
      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD)');      //Everson Luiz - TIBERO
    end else if (rdgArquivo.ItemIndex = 2) then begin
      Sql.Add('   AND CON.IDCONTRATOEMPTMO NOT IN');
//      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD)'); //Everson Luiz - TIBERO
      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD)');      //Everson Luiz - TIBERO
    end;
    
    if (DBcboTipoEmptmo.LookupValue <> '') then begin
      Sql.Add('   AND (CON.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ')');
    end;

    if (DBcboTipoContrato.LookupValue <> '') then begin
      Sql.Add('   AND (CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ')');
    end;

    if (PegaSituacoes() <> '') then begin
      Sql.Add('   AND (CON.IDSITPART IN (' + PegaSituacoes() + '))');
    end;

    if (PegaMovimentos() <> '') then begin
      Sql.Add('   AND (HME.HMETIPOMOV IN (' + PegaMovimentos() + '))');
    end;

    //Sql.Add('   AND (NVL(HME.FLGDIVERGPEND,0) = 0)'); //TAES-SIG97793
    Sql.Add('   AND (CON.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa) + ')');

    if (molListaPlano.PegaPlano <> '') then begin
      Sql.Add('   AND (CON.IDPLANOPREV IN (' + molListaPlano.PegaPlano + '))');
    end;

    if (molListaPatro.PegaPatro <> '') then begin
      Sql.Add('   AND (CON.IDPATRO IN (' + molListaPatro.PegaPatro + '))');
    end;

    Sql.Add('   AND (HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO)');
    Sql.Add('   AND (ITE.IDITEMEMPTMO = HME.IDITEMEMPTMO)');
    //Sql.Add('   AND (CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO)');
    //Sql.Add('   AND (ITC.IDITEMEMPTMO = ITE.IDITEMEMPTMO)');
    //Sql.Add('   AND (ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO)');
    //Sql.Add('   AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO');
    //Sql.Add('   AND MIG.DATAMIGRA =');
    //Sql.Add('       (SELECT MAX(DATAMIGRA)');
    //Sql.Add('          FROM VWMIGRACONTRATOEP');
    //Sql.Add('         WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO');
    //Sql.Add('           AND DATAMIGRA <= HME.HMEDATAVENCTO)');
    Sql.Add('ORDER BY CON.MATRICULA_TIT, (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || ''/'' || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))), ITE.ITEDESCRICAO');
    //Sql.SaveToFile('c:\sqlItens.txt');
    Open;
  end;
end;

procedure TfrmAjusteFormaEnvio.AbreQryContratos();
begin
  with qryContratos do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT ');
    Sql.Add(' 0 AS SELECAO,');
    Sql.Add(' HME.IDCONTRATOEMPTMO CONTRATO,');
    Sql.Add(' CON.TCEDESCRICAO TCEDESCRICAO,');
    //WO29236 - Leandro Inicio
    //Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, ''0000'')))) || ''/'' ||');
    //Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, ''00'')))) AS MESCOBR,');
    //Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || ''/'' ||');
    //Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) AS MESREF,');
    Sql.Add(' CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, ''0000'')))) || ''/'' ||');
    Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, ''00''))))  AS VARCHAR(9)) AS MESCOBR,');
    Sql.Add(' CAST((LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || ''/'' ||');
    Sql.Add(' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00''))))   AS VARCHAR(9)) AS MESREF,');
    //WO29236 - Leandro Inicio
    Sql.Add(' CON.MATRICULA_TIT AS MATRICULA,');
    Sql.Add(' CON.SIT_TITULAR AS SITMUTUARIO,');
    Sql.Add(' DECODE(CON.FORMAATUAL, ''F'', ''Folha''');
    Sql.Add('                      , ''C'', ''Financeiro'') AS FORMAENVIO,');
    //Sql.Add(' HME.HMERECPAG AS HMERECPAG,');
    //Sql.Add(' HME.HMETIPOFOLHA AS HMETIPOFOLHA,');
    //Sql.Add(' HME.HMEFORMACOBRANCA AS HMEFORMACOBRANCA,');
    Sql.Add(' SUM(DECODE(HME.HMERECPAG,''P'',HME.HMEVLRPREVISTO,0)) AS TOTALCREDITO,');
    Sql.Add(' SUM(DECODE(HME.HMERECPAG,''R'',HME.HMEVLRPREVISTO,0)) AS TOTALDEBITO');
    Sql.Add('FROM HISTMOVEMPTMO HME,');
    Sql.Add(' (SELECT DECODE(DEP.MATRICULA, NULL, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_TIT,');
    Sql.Add('         SIT.DESCRICAO AS SIT_TITULAR,');
    Sql.Add('         CON.FLGFORMAPAG AS FORMAATUAL,');
    Sql.Add('         CON.IDCONTRATOEMPTMO,');
    Sql.Add('         TCE.IDTIPOEMPTMO,');
    Sql.Add('         TCE.TCEDESCRICAO,');
    Sql.Add('         CON.IDINSCRICAOEMPTMO,');
    Sql.Add('         CON.IDCONTRQUITACAO,');
    Sql.Add('         CON.IDVERBA,');
    Sql.Add('         CON.FLGSITUACAO,');
    Sql.Add('         CON.NUMPARCELAS AS PRAZO,');
    Sql.Add('         CON.VLRCONTRATO,');
    Sql.Add('         CON.VLRPARCELA,');
    Sql.Add('         CON.TXJUROS,');
    Sql.Add('         DECODE(ELP.IDPESSJURCEDIDO,');
    Sql.Add('                NULL,');
    Sql.Add('                CON.IDPATRO,');
    Sql.Add('                ELP.IDPESSJURCEDIDO) AS IDPATRO,');
    Sql.Add('         CON.IDPLANOPREV,');
    Sql.Add('         NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM,');
    Sql.Add('         CON.IDTIPOCONTREMPTMO,');
    Sql.Add('         CON.IDPESSOA,');
    Sql.Add('         CON.IDBENEF,');
    Sql.Add('         CON.IDCBANCARIA,');
    Sql.Add('         CON.MOECODIGO,');
    Sql.Add('         CON.IDCBANCARIADEB,');
    Sql.Add('         CON.FLGSUSPENSAOAUTO,');
    Sql.Add('         CON.IDTIPOSUSPEMPTMO,');
    Sql.Add('         PPP.INSCRICAONUMERO,');
    Sql.Add('         NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO,');
    Sql.Add('         NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO,');
    Sql.Add('         NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA,');
    Sql.Add('         SIT.IDSITPART,');
    Sql.Add('         SIT.FLGINTERNO');
    Sql.Add('    FROM CONTRATOEMPTMO  CON,');
    Sql.Add('         PARTPREVPLAN    PPP,');
    Sql.Add('         ELEGPATRO       ELP,');
    Sql.Add('         DEPENTIT        DEP,');
    Sql.Add('         SITPART         SIT,');
    Sql.Add('         SITPLANOPREV    SPP,');
    Sql.Add('         TIPOCONTREMPTMO TCE');
    Sql.Add('   WHERE CON.IDPESSOA = ELP.IDPESSOA');
    Sql.Add('     AND CON.IDPESSOA = DEP.IDTITULAR');
    Sql.Add('     AND CON.IDBENEF = DEP.IDPESSOA');
    Sql.Add('     AND CON.IDPESSOA = PPP.IDPESSOA');
    Sql.Add('     AND CON.IDPATRO = PPP.IDPESSJUR');
    Sql.Add('     AND con.idpatro = elp.idpessjur');
    Sql.Add('     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO');
    Sql.Add('     AND PPP.IDSITPART = SIT.IDSITPART');
    Sql.Add('     AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV');
    Sql.Add('     AND ppp.idplanoprev = con.idplanoprev) CON');
    Sql.Add(' WHERE (HME.FLGENVIO = 0)');
    Sql.Add('   AND (HME.FLGBAIXADO = 0)');
    Sql.Add('   AND (HME.HMEVLREFETIVO IS NULL)');
    Sql.Add('   AND (HME.HMEDATAEFETIVA IS NULL)');
    Sql.Add('   AND (HME.HMEVLRPREVISTO <> 0)');
    Sql.Add('   AND (HME.CODDOCUMENTO IS NULL)');
    Sql.Add('   AND (HME.IDTMPDESC IS NULL)');

    //inicio Vinicius Ferreira SOL 149398 KINTANA 1068868
    if ((sAnoCobr <> '') and (sAnoCobr <> '0000')) then begin
      Sql.Add('   AND (HME.HMEANOCOBRANCA = ' + QuotedStr(sAnoCobr) + ')');
    end;

    if ((sMesCobr <> '') and (sMesCobr <> '0'))   then begin
      Sql.Add('   AND (HME.HMEMESCOBRANCA = ' + QuotedStr(sMesCobr) + ')');
    end;

    if ((sAnoRef <> '') and (sAnoRef <> '0000')) then begin
      Sql.Add('   AND (HME.HMEANOCOMPETENCIA = ' + QuotedStr(sAnoRef) + ')');
    end;

    if ((sMesRef <> '') and (sMesRef <> '0')) then begin
      Sql.Add('   AND (HME.HMEMESCOMPETENCIA = ' + QuotedStr(sMesRef) + ')');
    end;

    if (edtDataInicioVencimento.Text <> '') and (edtDataFimVencimento.Text <> '') then begin
      Sql.Add('   AND (HME.HMEDATAVENCTO BETWEEN TO_DATE(' + QuotedStr(DateToStr(sDtVencimentoInicio)) + ',''dd/mm/yyyy'') AND TO_DATE(' + QuotedStr(DateToStr(sDtVencimentofim)) + ',''dd/mm/yyyy''))');
    end;
    //fim Vinicius Ferreira SOL 149398 KINTANA 1068868

    Sql.Add('   AND (HME.HMECENTRALIZA + HME.HMEDESTACADO = 1)');
    Sql.Add('   AND (NVL(HME.FLGESTORNADO, 0) = 0)');
    Sql.Add('   AND (NVL(HME.FLGABONADO, 0) = 0)');
    Sql.Add('   AND (NVL(HME.FLGQUITADO, 0) = 0)');
    Sql.Add('   AND (CON.FLGSITUACAO <> ''P'')');
    Sql.Add('   AND (CON.FLGSITUACAO <> ''C'')');

    if molContratoEmptmo.IDContrato > 0 then begin
      Sql.Add('   AND (CON.IDCONTRATOEMPTMO = ' + FormatFloat( #0, molContratoEmptmo.IDContrato) + ')');
    end;

    if (rdgArquivo.ItemIndex = 1) then begin
      Sql.Add('   AND CON.IDCONTRATOEMPTMO IN');
//      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD)');  //Everson Luiz - TIBERO
      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD)');       //Everson Luiz - TIBERO
    end else if (rdgArquivo.ItemIndex = 2) then begin
      Sql.Add('   AND CON.IDCONTRATOEMPTMO NOT IN');
//      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD)');  //Everson Luiz - TIBERO
      Sql.Add('       (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD)');       //Everson Luiz - TIBERO
    end;

    if (DBcboTipoEmptmo.LookupValue <> '') then begin
      Sql.Add('   AND (CON.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ')');
    end;

    if (DBcboTipoContrato.LookupValue <> '') then begin
      Sql.Add('   AND (CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ')');
    end;

    if (PegaSituacoes() <> '') then begin
      Sql.Add('   AND (CON.IDSITPART IN (' + PegaSituacoes() + '))');
    end;
    
    if (PegaMovimentos() <> '') then begin
      Sql.Add('   AND (HME.HMETIPOMOV IN (' + PegaMovimentos() + '))');
    end;

    Sql.Add('   AND (NVL(HME.FLGDIVERGPEND,0) = 0) ');

    if (molListaPlano.PegaPlano <> '') then begin
      Sql.Add('   AND (CON.IDPLANOPREV IN (' + molListaPlano.PegaPlano + '))');
    end;

    if (molListaPatro.PegaPatro <> '') then begin
      Sql.Add('   AND (CON.IDPATRO IN (' + molListaPatro.PegaPatro + '))');
    end;

    Sql.Add('   AND (HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO)');
    Sql.Add('   AND (NVL(hme.flgsuspensao,0) = 0 OR 1 = (SELECT nvl(t.flgenvia,0) FROM tiposuspemptmo t WHERE t.idtiposuspemptmo = hme.idtiposuspemptmo))');
    Sql.Add('GROUP BY HME.IDCONTRATOEMPTMO, CON.TCEDESCRICAO, HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,');
    Sql.Add('HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, CON.MATRICULA_TIT, CON.SIT_TITULAR, CON.FORMAATUAL');
    //Sql.Add('HMERECPAG, HME.HMETIPOFOLHA, HME.HMEFORMACOBRANCA');
    //Sql.SaveToFile('c:\sqlContratos.txt');
    Open;
  end;
end;

procedure TfrmAjusteFormaEnvio.bbtnSairClick(Sender: TObject);
begin
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    if (MsgDlg('Existem processos que não foram salvos. Deseja sair da tela?', 'Informação',
                      mtInformation, [mbYes, mbNo], 0) = mrYes) then begin
      dtmBaseDados.dbBaseDados.RollBack;
      inherited;
    end;
  end else begin
    inherited;
  end;
end;

procedure TfrmAjusteFormaEnvio.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    if (MsgDlg('Confirma as informações?', 'Informação', mtInformation, [mbYes, mbNo], 0) = mrYes) then begin
      dtmBaseDados.dbBaseDados.Commit;
    end else begin
      dtmBaseDados.dbBaseDados.RollBack;
    end;

    FinalizaProcesso();
  end else begin
    MsgDlg('Não existe processo para gravar.', 'Informação', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmAjusteFormaEnvio.dbGridItensDblClick(Sender: TObject);
begin
  inherited;
  if (qryItens.Active) then begin
    qryItens.Edit;
    if (qryItens.FieldByName('Selecao').AsFloat = 1) then begin
      qryItens.FieldByName('Selecao').AsFloat := 0;
    end else begin
      qryItens.FieldByName('Selecao').AsFloat := 1;
    end;
    qryItens.Post;
  end;
end;

procedure TfrmAjusteFormaEnvio.FinalizaProcesso();
begin
  qryItens.Close;
  qryContratos.Close;

  edtIdContrato.Text := '';
  edtMatricula.Text  := '';
  edtMesRef.Text     := '';
  edtMesCobr.Text    := '';

  edtFBDebito.Caption  := '0';
  edtFBCredito.Caption := '0';
  edtFPDebito.Caption  := '0';
  edtFPCredito.Caption := '0';
  edtFIDebito.Caption  := '0';
  edtFICredito.Caption := '0';
  edtFDDebito.Caption  := '0';
  edtFDCredito.Caption := '0';

  pgPrincipal.ActivePageIndex := 0;
  btnVoltar.Enabled    := False;
  btnContinuar.Enabled := True;
  btnAjustar.Enabled   := False;
  btnConfirmar.Enabled := False;
end;

procedure TfrmAjusteFormaEnvio.btnAjustarClick(Sender: TObject);
var
  sTipoFolhaDebito, sFormaCobrancaDebito: String;
  sTipoFolhaCredito, sFormaCobrancaCredito: String;
  bAjustou: Boolean;
begin
  inherited;
  if (MsgDlg('Deseja ajustar os itens selecionados?', 'Informação', mtInformation, [mbYes, mbNo], 0) = mrYes) then begin
    try
      if not (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
        dtmBaseDados.dbBaseDados.StartTransaction;
      end;

      MostraEspera('Ajustando itens.');

      sTipoFolhaDebito := '';
      sFormaCobrancaDebito := '';
      sTipoFolhaCredito := '';
      sFormaCobrancaCredito := '';
      case rdgAjusteDebito.ItemIndex of
        1: begin
             sTipoFolhaDebito     := 'B';
             sFormaCobrancaDebito := 'F';
           end;
        2: begin
             sTipoFolhaDebito     := 'P';
             sFormaCobrancaDebito := 'F';
           end;
        3: begin
             sTipoFolhaDebito     := '';
             sFormaCobrancaDebito := 'C';
           end;
      end;

      case rdgAjusteCredito.ItemIndex of
        1: begin
             sTipoFolhaCredito     := 'B';
             sFormaCobrancaCredito := 'F';
           end;
        2: begin
             sTipoFolhaCredito     := 'P';
             sFormaCobrancaCredito := 'F';
           end;
        3: begin
             sTipoFolhaCredito     := '';
             sFormaCobrancaCredito := 'C';
           end;
      end;    

      qryItens.DisableControls;
      qryItens.Filtered := False;
      qryItens.First;
      bAjustou := False;
      while not qryItens.Eof do begin
        if (qryItens.FieldByName('Selecao').AsFloat = 1) then begin
          case rdgAjusteDebito.ItemIndex of
            0: begin
                 sTipoFolhaDebito     := '';
                 sFormaCobrancaDebito := ConsiderarParametrizacao(qryItens.FieldByName('TIPOCONTRATO').AsInteger);
               end;
          end;

          case rdgAjusteCredito.ItemIndex of
            0: begin
                 sTipoFolhaCredito     := '';
                 sFormaCobrancaCredito := ConsiderarParametrizacao(qryItens.FieldByName('TIPOCONTRATO').AsInteger);
               end;
          end;

          qryUpdate.Close;
          qryUpdate.Sql.Clear;
          qryUpdate.Sql.Add('UPDATE HISTMOVEMPTMO SET');
          if (qryItens.FieldByName('OPERACAO').AsString = 'C') then begin
            qryUpdate.Sql.Add(' HMETIPOFOLHA = ' + QuotedStr(sTipoFolhaCredito) +',');
            qryUpdate.Sql.Add(' HMEFORMACOBRANCA = ' + QuotedStr(sFormaCobrancaCredito));
          end else begin
            qryUpdate.Sql.Add(' HMETIPOFOLHA = ' + QuotedStr(sTipoFolhaDebito) +',');
            qryUpdate.Sql.Add(' HMEFORMACOBRANCA = ' + QuotedStr(sFormaCobrancaDebito));
          end;
          qryUpdate.Sql.Add(' WHERE IDHISTMOVEMPTMO = ' + qryItens.FieldByName('ID').AsString);
          qryUpdate.ExecSql;
          bAjustou := True;
        end;
        qryItens.Next;
      end;
      //qryItens.First;
      //qryItens.Filtered := False;
      //qryItens.Filter   := 'CONTRATO = ' + qryContratos.FieldByName('Contrato').AsString;
      //qryItens.Filtered := True;
      qryItens.EnableControls;

      if not(bAjustou) then begin
        MsgDlg('Não existem itens selecionados para ajuste.', 'Informação', mtInformation, [mbOk], 0);
      end else begin
        CarregaDados();
      end;
    finally
      EscondeEspera();
    end;
  end;
end;

function TfrmAjusteFormaEnvio.ConsiderarParametrizacao(pTipoContr: Integer): String;
var
  xQry: TwwQuery;
begin
  xQry := TwwQuery.Create(Self);
  try
    xQry.DataBaseName := 'BaseDados';
    xQry.Close;
    xQry.Sql.Clear;
    xQry.Sql.Add('SELECT FLGFORMAREC FROM TIPOCONTREMPTMO');
    xQry.Sql.Add(' WHERE IDTIPOCONTREMPTMO = ' + IntToStr(pTipoContr));
    xQry.Open;

    Result := xQry.FieldByName('FLGFORMAREC').AsString;
  finally
    FreeAndNil(xQry);
  end;
end;


end.
