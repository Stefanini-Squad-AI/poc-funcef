unit FRestrCobranca;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//------------------------------------------------------------------------------
//Nº SOL.............: 258330/17859
//Nº PPM.............: 1132081
//Data da Alteração..: 10/11/2015
//Responsável........: Felipe A. Santos
//Descrição..........: criação da funcionalidade
//------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, CheckLst, DBCtrls, Mask, wwdbedit;

type
  TfrmRestrCobranca = class(TfrmCadMestreDetalheCS)
    lblEventosCob: TLabel;
    Label2: TLabel;
    tbsMat: TTabSheet;
    tbsContrato: TTabSheet;
    tbsCargo: TTabSheet;
    pnlCargoEdt: TPanel;
    btnConfirmarDetalhe: TBitBtn;
    btnCancelarDetalhe: TBitBtn;
    qryAux: TwwQuery;
    msPessoa: TMontaSelect;
    msContrato: TMontaSelect;
    msCargo: TMontaSelect;
    qryPessoa: TwwQuery;
    qryMat: TwwQuery;
    qryContrato: TwwQuery;
    pnlPessoaEdt: TPanel;
    lblobservacao: TLabel;
    btnProcPessoa: TToolbarButton97;
    lblNome: TLabel;
    lblCPF02: TLabel;
    dbmmoObsPessB: TDBMemo;
    grbEventosCob: TGroupBox;
    chkRestringirEvento: TCheckBox;
    chkLstEventosCobB: TCheckListBox;
    dbedtNomePess: TwwDBEdit;
    dbedtCPFPess: TwwDBEdit;
    chkLstEventosCobA: TCheckListBox;
    pnlMatEdt: TPanel;
    lblMatB: TLabel;
    lblNomeMat: TLabel;
    lblCPFMat: TLabel;
    btnProcMat: TToolbarButton97;
    lblObsMatB: TLabel;
    dbedtMat: TwwDBEdit;
    dbedtNomeMat: TwwDBEdit;
    dbedtCPFMat: TwwDBEdit;
    dbmmoObsMatB: TDBMemo;
    pnlMat: TPanel;
    lblObsPessoaA: TLabel;
    dbmmoObsPessoaB: TDBMemo;
    pnlContrato: TPanel;
    lblObsContratoA: TLabel;
    pnlContrEdt: TPanel;
    lblNumContrato: TLabel;
    lblModalidade: TLabel;
    lblMatContr: TLabel;
    lblNomeContr: TLabel;
    lblCPFContr: TLabel;
    lblObsContratoB: TLabel;
    btnProcContrato: TToolbarButton97;
    dbedtNumContrato: TwwDBEdit;
    dbedtModalidade: TwwDBEdit;
    dbedtMatContr: TwwDBEdit;
    dbedtNomeContr: TwwDBEdit;
    dbedtCPFContr: TwwDBEdit;
    dbmmoObsContratoB: TDBMemo;
    dbedtCod: TwwDBEdit;
    lblCod: TLabel;
    dbedtTitulo: TwwDBEdit;
    lblTitulo: TLabel;
    dbedtPatro: TwwDBEdit;
    lblPatro: TLabel;
    btnProcCargo: TToolbarButton97;
    dbmmoObsCargoB: TDBMemo;
    pnlCargo: TPanel;
    dbgrdCargo: TwwDBGrid;
    dbgrdContrato: TwwDBGrid;
    updPessoa: TUpdateSQL;
    updMat: TUpdateSQL;
    updContrato: TUpdateSQL;
    updCargo: TUpdateSQL;
    dsMat: TwwDataSource;
    dsContrato: TwwDataSource;
    dsCargo: TwwDataSource;
    dbmmoMatObsA: TDBMemo;
    dbmmoContratoObsA: TDBMemo;
    dbmmoCargoObsA: TDBMemo;
    lblObsCargoA: TLabel;
    qryPessoaXEventos: TwwQuery;
    msMat: TMontaSelect;
    qryEventos: TwwQuery;
    lblObsCargoB: TLabel;
    updPessoaXEventos: TUpdateSQL;
    dbgrdPessoa: TwwDBGrid;
    dbgrdMat: TwwDBGrid;
    qryCargo: TwwQuery;
    qryValidaRestrCad: TwwQuery;
    updValida: TUpdateSQL;
    procedure chkRestringirEventoClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryPessoaAfterScroll(DataSet: TDataSet);
    procedure btnProcMatClick(Sender: TObject);
    procedure btnProcPessoaClick(Sender: TObject);
    procedure btnProcContratoClick(Sender: TObject);
    procedure btnProcCargoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryPessoaBeforeDelete(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    qryAtual: TwwQuery;
    PanelAtualEdt, PanelAtual: TPanel;
    lstEventosChegados: TStringList;
    bCarregaEventos : Boolean;
    function VerificaStatus(pqry: TwwQuery): Boolean;
    function IsChecked(ChkLst: TCheckListBox): Boolean;
    procedure CopiarItensChecados(ChkLstDe, ChkLstPara: TCheckListBox);
    procedure CarregarEventos;
    procedure CarregarEventosEdt;
    procedure AtualizaBotoes;
    procedure AtualizaBotoesEdt;
    procedure AtualizaBotoesAposEdt;
    procedure BuscarRegistros;
    procedure CopiarRegistros(pqry: TwwQuery);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRestrCobranca: TfrmRestrCobranca;

implementation

uses
  UMensErro, dbasedados;

{$R *.DFM}

procedure TfrmRestrCobranca.chkRestringirEventoClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  if chkRestringirEvento.Checked then
  begin
    for i := 0 to chkLstEventosCobB.Items.Count - 1 do
    begin
      chkLstEventosCobB.Checked[i] := False;
    end;

    chkLstEventosCobB.Enabled := False;

   qryPessoaXEventos.Filtered := False;
   qryPessoaXEventos.Filter := 'IDPESSOA = ' + IntToStr(qryPessoa.FieldByName('IDPESSOA').AsInteger);
   qryPessoaXEventos.Filtered := True;

    qryPessoaXEventos.First;
    while not (qryPessoaXEventos.IsEmpty) do qryPessoaXEventos.Delete;
  end
  else
    chkLstEventosCobB.Enabled := True;

end;

procedure TfrmRestrCobranca.bbtnOkDetClick(Sender: TObject);
begin
  //inherited;

  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    if qryAtual.FieldByName('IDPESSOA').AsInteger = 0 then
    begin
      bbtnCancelarDetClick(Self);
      Exit;
    end;

    if qryValidaRestrCad.Locate('NUMDOCUMENTO', qryAtual.FieldByName('NUMDOCUMENTO').AsString, []) then
    begin
      if (qryAtual.State <> dsEdit) then
      begin
        MsgDlg('Já existe uma restrição para esse CPF.', 'Aviso', mtWarning, [mbOk], HelpContext);
        btnProcPessoa.Down := False;
        Exit;
      end;
    end;

    if (Trim(dbmmoObsPessB.Text) = '') then
    begin
      MsgDlg('É obrigatório preencher as observações da restrição de cobrança.', 'Aviso', mtWarning, [mbOk], HelpContext);
      if dbmmoObsPessB.CanFocus then
        dbmmoObsPessB.SetFocus;
      Exit;
    end;
  end
  else if (pgctrlDetalhe.ActivePage = tbsMat) then
  begin
    if qryAtual.FieldByName('IDPESSOA').AsInteger = 0 then
    begin
      bbtnCancelarDetClick(Self);
      Exit;
    end;

    if qryValidaRestrCad.Locate('MATRICULA', qryAtual.FieldByName('MATRICULA').AsString, []) then
    begin
      if (qryAtual.State <> dsEdit) then
      begin
        MsgDlg('Já existe uma restrição para essa matrícula.', 'Aviso', mtWarning, [mbOk], HelpContext);
        btnProcMat.Down := False;
        Exit;
      end;
    end;

    if (Trim(dbmmoObsMatB.Text) = '') then
    begin
      MsgDlg('É obrigatório preencher as observações da restrição de cobrança.', 'Aviso', mtWarning, [mbOk], HelpContext);
      if dbmmoObsMatB.CanFocus then
        dbmmoObsMatB.SetFocus;
      Exit;
    end;

  end
  else if (pgctrlDetalhe.ActivePage = tbsContrato) then
  begin
    if qryAtual.FieldByName('IDCONTRATOEMPTMO').AsInteger = 0 then
    begin
      bbtnCancelarDetClick(Self);
      Exit;
    end;

    if qryValidaRestrCad.Locate('IDCONTRATOEMPTMO', qryAtual.FieldByName('IDCONTRATOEMPTMO').AsString, []) then
    begin
      if (qryAtual.State <> dsEdit) then
      begin
        MsgDlg('Já existe uma restrição para esse contrato.', 'Aviso', mtWarning, [mbOk], HelpContext);
        btnProcContrato.Down := False;
        Exit;
      end;
    end;

    if (Trim(dbmmoObsContratoB.Text) = '') then
    begin
      MsgDlg('É obrigatório preencher as observações da restrição de cobrança.', 'Aviso', mtWarning, [mbOk], HelpContext);
      if dbmmoObsContratoB.CanFocus then
        dbmmoObsContratoB.SetFocus;
      Exit;
    end;
  end
  else if (pgctrlDetalhe.ActivePage = tbsCargo) then
  begin
    if qryAtual.FieldByName('IDCARGOEXT').AsInteger = 0 then
    begin
      bbtnCancelarDetClick(Self);
      Exit;
    end;

    if qryValidaRestrCad.Locate('IDCARGOEXT', qryAtual.FieldByName('IDCARGOEXT').AsString, []) then
    begin
      if (qryAtual.State <> dsEdit) then
      begin
        MsgDlg('Já existe uma restrição para esse cargo.', 'Aviso', mtWarning, [mbOk], HelpContext);
        btnProcCargo.Down := False;
        Exit;
      end;
    end;

    if (Trim(dbmmoObsCargoB.Text) = '') then
    begin
      MsgDlg('É obrigatório preencher as observações da restrição de cobrança.', 'Aviso', mtWarning, [mbOk], HelpContext);
      if dbmmoObsCargoB.CanFocus then
        dbmmoObsCargoB.SetFocus;
      Exit;
    end;
  end;

  qryAtual.Post;

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if not (IsChecked(chkLstEventosCobB)) then
    begin
      chkLstEventosCobA.Items.Clear;
      chkLstEventosCobA.Items.Add('Todos');
      chkLstEventosCobA.Checked[0] := True;
    end
    else
    begin
      CopiarItensChecados(chkLstEventosCobB, chkLstEventosCobA);
    end;
  end;

  AtualizaBotoesAposEdt;
  PanelAtual.BringToFront;
end;

procedure TfrmRestrCobranca.sbtnInsDetClick(Sender: TObject);
begin
  //inherited;
  CopiarRegistros(qryAtual);
  qryAtual.Insert;
  CarregarEventosEdt;

  PanelAtualEdt.BringToFront;
  AtualizaBotoesEdt;

  btnProcPessoa.Visible := True;
  btnProcMat.Visible := True;
  btnProcContrato.Visible := True;
  btnProcCargo.Visible := True;
end;

procedure TfrmRestrCobranca.sbtnAltDetClick(Sender: TObject);
begin
  //inherited;
  CopiarRegistros(qryAtual);
  qryAtual.Edit;
  CarregarEventosEdt;

  PanelAtualEdt.BringToFront;
  AtualizaBotoesEdt;

  btnProcPessoa.Visible := False;
  btnProcMat.Visible := False;
  btnProcContrato.Visible := False;
  btnProcCargo.Visible := False;
end;

procedure TfrmRestrCobranca.sbtnExcluiDetClick(Sender: TObject);
begin
  //inherited;
  if MsgDlg('Deseja excluir a restrição selecionada?', 'Confirmação', mtConfirmation, [mbYes, mbNo], HelpContext) = mrNo then
    Exit;

  qryAtual.Delete;
  AtualizaBotoesAposEdt;
end;

function TfrmRestrCobranca.VerificaStatus(pqry: TwwQuery): Boolean;
begin
  Result := True;

  if not (pqry.IsEmpty) then
  begin
    pqry.DisableControls;
    pqry.First;
    while not (pqry.Eof) do
    begin
      if pqry.UpdateStatus in [usInserted, usModified] then
      begin
        Result := False;
        Break;
      end;
      pqry.Next;
    end;
    pqry.EnableControls;
  end;
end;

function TfrmRestrCobranca.IsChecked(ChkLst: TCheckListBox): Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 0 to ChkLst.Items.Count - 1 do
  begin
    if ChkLst.Checked[i] then
    begin
      Result := True;
      Break;
    end;
  end;

end;

procedure TfrmRestrCobranca.CopiarItensChecados(ChkLstDe, ChkLstPara: TCheckListBox);
var
  i, iItensChecked: Integer;
begin
  qryPessoaXEventos.Filtered := False;
  qryPessoaXEventos.Filter := 'IDPESSOA = ' + IntToStr(qryPessoa.FieldByName('IDPESSOA').AsInteger);
  qryPessoaXEventos.Filtered := True;

  if not (qryPessoaXEventos.IsEmpty) then
  begin
    qryPessoaXEventos.First;
    while not (qryPessoaXEventos.IsEmpty) do
      qryPessoaXEventos.Delete;
  end;

  ChkLstPara.Items.Clear;
  iItensChecked := -1;

  for i := 0 to ChkLstDe.Items.Count - 1 do
  begin
    if ChkLstDe.Checked[i] then
    begin
      iItensChecked := iItensChecked + 1;
      ChkLstPara.Items.Add(ChkLstDe.Items.Strings[i]);
      ChkLstPara.Checked[iItensChecked] := True;

      qryPessoaXEventos.Insert;
      qryPessoaXEventos.FieldByName('IDTIPOEVENTOCOBEMPTMO').AsString := lstEventosChegados.Strings[i];
      qryPessoaXEventos.FieldByName('IDPESSOA').AsInteger := qryAtual.FieldByName('IDPESSOA').AsInteger;
      qryPessoaXEventos.FieldByName('DESCEVENTOCOB').AsString := ChkLstDe.Items.Strings[i];
      qryPessoaXEventos.Post;

    end;
  end;
end;

procedure TfrmRestrCobranca.tbcDetalheChange(Sender: TObject);
begin
  //inherited;
  if Assigned(qryAtual) then
  begin
    if (qryAtual.State in [dsInsert, dsEdit]) then
    begin
      bbtnCancelarDetClick(Self);
    end;
  end;

  pgctrlDetalhe.ActivePageIndex := tbcDetalhe.TabIndex;

  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    PanelAtualEdt := pnlPessoaEdt;
    PanelAtual := pnlControlesDet;
    qryAtual := TwwQuery(dbgrdPessoa.DataSource.Dataset);
  end
  else if (pgctrlDetalhe.ActivePage = tbsMat) then
  begin
    PanelAtual := pnlMat;
    PanelAtualEdt := pnlMatEdt;
    qryAtual := TwwQuery(dbgrdMat.DataSource.Dataset);
  end
  else if (pgctrlDetalhe.ActivePage = tbsContrato) then
  begin
    PanelAtual := pnlContrato;
    PanelAtualEdt := pnlContrEdt;
    qryAtual := TwwQuery(dbgrdContrato.DataSource.Dataset);
  end
  else if (pgctrlDetalhe.ActivePage = tbsCargo) then
  begin
    PanelAtual := pnlCargo;
    PanelAtualEdt := pnlCargoEdt;
    qryAtual := TwwQuery(dbgrdCargo.DataSource.Dataset);
  end;

  PanelAtual.BringToFront;
  AtualizaBotoesAposEdt;
end;

procedure TfrmRestrCobranca.bbtnConfirmarClick(Sender: TObject);
begin
  //inherited;
  try
    if not (dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;

    qryPessoa.ApplyUpdates;
    qryMat.ApplyUpdates;
    qryContrato.ApplyUpdates;
    qryCargo.ApplyUpdates;
    qryPessoaXEventos.ApplyUpdates;

    dtmBaseDados.dbBaseDados.Commit;

    AtualizaBotoes;
  except
    on E: Exception do
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      AtualizaBotoes;
      MsgDlg(E.Message, 'Erro', mtError, [mbOk], HelpContext);
    end;
  end;

  BuscarRegistros;
end;

procedure TfrmRestrCobranca.FormCreate(Sender: TObject);
begin
  inherited;
  tbcDetalheChange(Self);
  lstEventosChegados := TStringList.Create;
  bCarregaEventos := True;

  BuscarRegistros;
  HelpContext := 230131;
end;

procedure TfrmRestrCobranca.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  qryAtual.Cancel;
  AtualizaBotoesAposEdt;
  PanelAtual.BringToFront;

end;

procedure TfrmRestrCobranca.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryPessoa.CancelUpdates;
  qryMat.CancelUpdates;
  qryContrato.CancelUpdates;
  qryCargo.CancelUpdates;
  qryPessoaXEventos.CancelUpdates;
  AtualizaBotoes;
end;

procedure TfrmRestrCobranca.qryPessoaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not (qryPessoa.State in [dsInsert, dsEdit]) and (bCarregaEventos) then
    CarregarEventos;
end;

procedure TfrmRestrCobranca.CarregarEventos;
var
  iItensCheckeds: Integer;
begin
  qryPessoaXEventos.Filtered := False;
  qryPessoaXEventos.Filter := 'IDPESSOA = ' + IntToStr(qryPessoa.FieldByName('IDPESSOA').AsInteger);
  qryPessoaXEventos.Filtered := True;

  chkLstEventosCobA.Items.Clear;
  iItensCheckeds := -1;

  if (qryPessoaXEventos.IsEmpty) and not (qryPessoa.IsEmpty) then
  begin
    chkLstEventosCobA.Items.Add('Todos');
    chkLstEventosCobA.Checked[0] := True;
  end
  else if (qryPessoa.IsEmpty) and (qryPessoaXEventos.IsEmpty) then
  begin
    chkLstEventosCobA.Items.Clear;
  end;

  qryPessoaXEventos.First;
  while not (qryPessoaXEventos.Eof) do
  begin
    iItensCheckeds := iItensCheckeds + 1;
    chkLstEventosCobA.Items.Add(qryPessoaXEventos.FieldByName('DESCEVENTOCOB').AsString);
    chkLstEventosCobA.Checked[iItensCheckeds] := True;
    qryPessoaXEventos.Next;
  end;
end;

procedure TfrmRestrCobranca.CarregarEventosEdt;
var
  indCheck: Integer;
begin
  chkLstEventosCobB.Items.Clear;
  lstEventosChegados.Clear;

  qryEventos.Close;
  qryEventos.SQL.Clear;
  qryEventos.SQL.Add('SELECT IDTIPOEVENTOCOBEMPTMO,');
  qryEventos.SQL.Add('       DESCEVENTOCOB');
  qryEventos.SQL.Add('  FROM TIPOEVENTOCOBEMPTMO');
  qryEventos.SQL.Add('  ORDER BY DESCEVENTOCOB');
  qryEventos.Open;

  qryEventos.First;
  while not (qryEventos.Eof) do
  begin
    lstEventosChegados.Add(qryEventos.FieldByName('IDTIPOEVENTOCOBEMPTMO').AsString);
    chkLstEventosCobB.Items.Add(qryEventos.FieldByName('DESCEVENTOCOB').AsString);
    indCheck := lstEventosChegados.IndexOf(qryEventos.FieldByName('IDTIPOEVENTOCOBEMPTMO').AsString);

    if (qryPessoa.State = dsEdit) then
    begin
      if qryPessoaXEventos.Locate('IDTIPOEVENTOCOBEMPTMO;IDPESSOA',
                                  VarArrayOf([qryEventos.FieldByName('IDTIPOEVENTOCOBEMPTMO').AsString,
                                              qryPessoa.FieldByName('IDPESSOA').AsString ]), []) then
      begin
        chkLstEventosCobB.Checked[indCheck] := True;
      end;
    end;

    qryEventos.Next;
  end;

  qryPessoaXEventos.Filtered := False;
  qryPessoaXEventos.Filter := 'IDPESSOA = ' + IntToStr(qryPessoa.FieldByName('IDPESSOA').AsInteger);
  qryPessoaXEventos.Filtered := True;

  chkRestringirEvento.Checked := qryPessoaXEventos.IsEmpty;
  chkRestringirEventoClick(Self);
end;

procedure TfrmRestrCobranca.btnProcMatClick(Sender: TObject);
begin
  inherited;
  msMat.Executar;

  if msMat.RetornouValor then
  begin
    qryAtual.FieldByName('IDPESSOA').AsString := msMat.ValoresChave[0];
    qryAtual.FieldByName('NUMDOCUMENTO').AsString := msMat.ValoresChave[1];
    qryAtual.FieldByName('NOME').AsString := msMat.ValoresChave[2];
    qryAtual.FieldByName('MATRICULA').AsString := msMat.ValoresChave[3];
    qryAtual.FieldByName('IDTITULAR').AsString := msMat.ValoresChave[4];
  end;

  btnProcMat.Down := False;
end;

procedure TfrmRestrCobranca.btnProcPessoaClick(Sender: TObject);
begin
  inherited;
  msPessoa.Executar;

  if msPessoa.RetornouValor then
  begin
    qryAtual.FieldByName('IDPESSOA').AsString := msPessoa.ValoresChave[0];
    qryAtual.FieldByName('NUMDOCUMENTO').AsString := msPessoa.ValoresChave[1];
    qryAtual.FieldByName('NOME').AsString := msPessoa.ValoresChave[2];
  end;

  btnProcPessoa.Down := False;
end;

procedure TfrmRestrCobranca.btnProcContratoClick(Sender: TObject);
begin
  //inherited;
  msContrato.Executar;

  if msContrato.RetornouValor then
  begin
    qryAtual.FieldByName('IDCONTRATOEMPTMO').AsString := msContrato.ValoresChave[0];
    qryAtual.FieldByName('NUMDOCUMENTO').AsString := msContrato.ValoresChave[4];
    qryAtual.FieldByName('NOME').AsString := msContrato.ValoresChave[3];
    qryAtual.FieldByName('MATRICULA').AsString := msContrato.ValoresChave[2];
    qryAtual.FieldByName('TCEDESCRICAO').AsString := msContrato.ValoresChave[1];
  end;

  btnProcContrato.Down := False;
end;

procedure TfrmRestrCobranca.btnProcCargoClick(Sender: TObject);
begin
  //inherited;
  msCargo.Executar;

  if msCargo.RetornouValor then
  begin
    qryAtual.FieldByName('IDCARGOEXT').AsString := msCargo.ValoresChave[0];
    qryAtual.FieldByName('IDPESSJUR').AsString := msCargo.ValoresChave[1];
    qryAtual.FieldByName('CODIGO').AsString := msCargo.ValoresChave[2];
    qryAtual.FieldByName('TITULO').AsString := msCargo.ValoresChave[3];
    qryAtual.FieldByName('NOME').AsString := msCargo.ValoresChave[4];
  end;

  btnProcCargo.Down := False;
end;

procedure TfrmRestrCobranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  inherited;
  bCarregaEventos := False;

  if (TemAlteracaoPendente) then
  begin
    if MsgDlg('Deseja sair do cadastro de restrição de cobrança sem gravar os dados alterados?', 'Aviso', mtConfirmation, [mbYes, mbNo], HelpContext) = mrNo then
    begin
      Action := caNone;
      bCarregaEventos := True;
      Exit;
    end;
  end;

  bbtnCancelarClick(Self);
  FreeAndNil(lstEventosChegados);
  Action := caFree;
end;

procedure TfrmRestrCobranca.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  //inherited;
end;

procedure TfrmRestrCobranca.FormShow(Sender: TObject);
begin
  inherited;
  sbtnalterar.Enabled := True;
end;

procedure TfrmRestrCobranca.AtualizaBotoes;
begin
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  sbtnAlterar.Down := False;
  sbtninsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnExcluiDet.Enabled := False;
end;

procedure TfrmRestrCobranca.AtualizaBotoesAposEdt;
begin
  if (qry.State = dsEdit) then
  begin
    btnConfirmarDetalhe.Visible := False;
    btnCancelarDetalhe.Visible := False;
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled := True;
    bbtnSair.Enabled := True;

    sbtnInsDet.Down := False;
    sbtnAltDet.Down := False;
    sbtnExcluiDet.Down := False;


    sbtnInsDet.Enabled := True;
    sbtnAltDet.Enabled := not (qryAtual.IsEmpty);
    sbtnExcluiDet.Enabled := not (qryAtual.IsEmpty);
  end;
end;

procedure TfrmRestrCobranca.AtualizaBotoesEdt;
begin
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  bbtnSair.Enabled := False;
  btnConfirmarDetalhe.Visible := True;
  btnCancelarDetalhe.Visible := True;

  if (sbtnInsDet.Down) then
  begin
    sbtnAltDet.Enabled := False;
    sbtnExcluiDet.Enabled := False;
  end
  else if (sbtnAltDet.Down) then
  begin
    sbtnInsDet.Enabled := False;
    sbtnExcluiDet.Enabled := False;
  end
  else if (sbtnExcluiDet.Down) then
  begin
    sbtnInsDet.Enabled := False;
    sbtnAltDet.Enabled := False;
  end;

end;

procedure TfrmRestrCobranca.BuscarRegistros;
begin
  qry.Close;
  qry.Open;
  qryPessoaXEventos.Close;
  qryPessoaXEventos.Open;
  qryPessoa.Close;
  qryPessoa.Open;
  qryMat.Close;
  qryMat.Open;
  qryContrato.Close;
  qryContrato.Open;
  qryCargo.Close;
  qryCargo.Open;
end;

procedure TfrmRestrCobranca.CopiarRegistros(pqry: TwwQuery);
var
  i: Integer;
  sCampo, sSQL: string;
  BM : TBookmark;
begin
  if Pos('WHERE', pqry.SQL.GetText) > 0 then
    sSQL := Copy(pqry.SQL.GetText, 1, Pos('WHERE', pqry.SQL.GetText) - 1)
  else
    sSQL := pqry.SQL.GetText;

  qryValidaRestrCad.Close;
  qryValidaRestrCad.SQL.Clear;
  qryValidaRestrCad.SQL.Add(sSQL);
  qryValidaRestrCad.SQL.Add(' WHERE 1 = 2');
  qryValidaRestrCad.Open;

  bCarregaEventos := False;

  BM := pqry.GetBookmark;
  pqry.DisableControls;
  pqry.First;

  while not (pqry.Eof) do
  begin
    qryValidaRestrCad.Insert;

    for i := 0 to Pred(pqry.Fields.Count) do
    begin
      sCampo := pqry.Fields[i].FieldName;
      qryValidaRestrCad.FieldByName(sCampo).Value := pqry.FieldByName(sCampo).Value;
    end;

    qryValidaRestrCad.Post;

    pqry.Next;
  end;

  pqry.EnableControls;
  pqry.GotoBookmark(BM);

  BM := nil;

  bCarregaEventos := True;

end;

procedure TfrmRestrCobranca.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //inherited;
end;

procedure TfrmRestrCobranca.qryPessoaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  qryPessoaXEventos.Filtered := False;
  qryPessoaXEventos.Filter := 'IDPESSOA = ' + IntToStr(qryPessoa.FieldByName('IDPESSOA').AsInteger);
  qryPessoaXEventos.Filtered := True;

  while not(qryPessoaXEventos.IsEmpty) do qryPessoaXEventos.Delete;
end;

procedure TfrmRestrCobranca.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  AtualizaBotoesAposEdt;
end;

end.

