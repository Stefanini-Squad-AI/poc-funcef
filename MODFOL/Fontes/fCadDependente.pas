unit fCadDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fPessoa, Menus,
  MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, Pessoa, TB97, MAHlpBtn, StdCtrls, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, CheckLst, ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask,
  ExtCtrls, Spin, ExtDlgs, Wwtable, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, wwdbedit, Wwdbspin, CmEventosCadastro, wwdbdatetimepicker, ImgList,
  CMDateTimePicker, TREdit, Wwdotdot, Wwdbcomb;

type
  TfrmCadDependente = class(TfrmPessoa)
    tbsTitular: TTabSheet;
    qryDepenTit: TwwQuery;
    updDepenTit: TUpdateSQL;
    dsDepenTit: TwwDataSource;
    qryDep: TwwQuery;
    pnlTitular: TPanel;
    dbgTitular: TwwDBGrid;
    GroupBoxTitular: TGroupBox;
    Label28: TLabel;
    Label31: TLabel;
    bbtnProcurar: TBitBtn;
    tbsPessFis: TTabSheet;
    pnlPessFis: TPanel;
    qryResp: TwwQuery;
    qrySitDep: TwwQuery;
    dsPaises: TwwDataSource;
    MontaSelectTitular: TMontaSelect;
    qryAux: TwwQuery;
    qryPaises: TwwQuery;
    qryTitularAux: TwwQuery;
    edNomeTitular: TEdit;
    edCPFTitular: TEdit;
    bbtnAssocEndTit: TBitBtn;
    MontaSelectEndTit: TMontaSelect;
    dbrgEstCivil: TDBRadioGroup;
    Label3: TLabel;
    dblcNacional: TwwDBLookupCombo;
    gbxNaturalidade: TGroupBox;
    Label4: TLabel;
    Label65: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    dblcNatural: TwwDBLookupCombo;
    gbxFiliacao: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    qryCidadeNasc: TwwQuery;
    qryEstadoNasc: TwwQuery;
    Bevel2: TBevel;
    Label17: TLabel;
    dbdtNasc: TCMDateTimePicker;
    Label66: TLabel;
    dbcmbTipoSang: TwwDBComboBox;
    dbrgrpSexo: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    Bevel3: TBevel;
    Bevel4: TBevel;
    dbchkContaImpostoRenda: TDBCheckBox;
    dbchkContaSalarioFamilia: TDBCheckBox;
    lblDependente: TLabel;
    dblkcmbDependente: TwwDBLookupCombo;
    Label30: TLabel;
    dbtxtNumSequencia: TDBText;
    bvNumSequencia: TBevel;
    Label24: TLabel;
    dblkcmbSitDependente: TwwDBLookupCombo;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure qryDepenTitAfterInsert(DataSet: TDataSet);
    procedure qryDepenTitBeforePost(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure qryPessoaFisicaAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure PessoaChangeSubtipo(IdPessoa: Integer);
    procedure PessoaSaveSubtipo(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnAssocEndTitClick(Sender: TObject);
    procedure dblcNacionalChange(Sender: TObject);
  private
    iPaisAntigo: integer;  
    sIdPessoa: string;
    function  VerificaDependente: boolean;
  public
    iIDdependente: integer;
  end;

var
  frmCadDependente: TfrmCadDependente;

implementation

uses uMensErro, dBaseDados, uSistema, fListaTit;

{$R *.DFM}

procedure TfrmCadDependente.FormCreate(Sender: TObject);
begin
  qryDepenTit.Prepare;

  qryResp.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryResp.Open;

  qryDep.Open;
  qrySitDep.Open;

  qryPaises.Open;
  dblcNacionalChange(Sender);
  inherited;
end;

procedure TfrmCadDependente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryDep.Close;
  qrySitDep.Close;
  qryResp.Close;

  qryDepenTit.Close;
  qryDepenTit.UnPrepare;
  inherited;
end;

procedure TfrmCadDependente.qryPessoaFisicaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryPessoaFisica.FieldByName('FLGISENTOIRRF').asInteger := 0;
end;

procedure TfrmCadDependente.qryDepenTitAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if (dbchkContaImpostoRenda.Checked) then
    qryDepenTit.FieldByname('FLGCONTAIMPOSTOR').asString := '1'
  else
    qryDepenTit.FieldByname('FLGCONTAIMPOSTOR').asString := '0';

  if (dbchkContaSalarioFamilia.Checked) then
    qryDepenTit.FieldByname('FLGCONTASALARIOF').asString := '1'
  else
    qryDepenTit.FieldByname('FLGCONTASALARIOF').asString := '0';

  qryDepenTit.FieldByname('FLGBENEFICIARIO').asString := '0';
end;

procedure TfrmCadDependente.qryDepenTitBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (sIdPessoa <> '') then
    qryDepenTit.FieldByname('IDTITULAR').asString := sIdPessoa;
end;

procedure TfrmCadDependente.PessoaChangeSubtipo(IdPessoa: integer);
begin
  if (qryDepenTit.Active) and (qryDepenTit.CachedUpdates) then
    qryDepenTit.CancelUpdates;

  qryDepenTit.Close;
  qryDepenTit.ParamByName('IDPESSOA').Value := IdPessoa;
  qryDepenTit.Open;

  qryDepenTit.CancelUpdates;

  if (dbedPaiDetalhe.DataField = 'TITULAR') then
    dbedPaiDetalhe.DataField := '';
end;

procedure TfrmCadDependente.PessoaSaveSubtipo(Sender: TObject);
begin
  inherited;
  try
    dtmBaseDados.dbBaseDados.ApplyUpdates([qryDepenTit]);
  except
    raise;
  end;
end;

procedure TfrmCadDependente.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgCtrlDetalhe.ActivePage = tbsTitular) then
  begin
    GroupBoxTitular.Enabled := true;
    bbtnProcurar.Enabled := true;
    // Guarda o Dependente
    qryDepenTit.FieldByname('IDPESSOA').asString := qry.FieldByName('IDPESSOA').asString;
    bbtnProcurar.SetFocus;
  end;
end;

procedure TfrmCadDependente.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  try
    qryDepenTit.CancelUpdates;
  except
    raise;
  end;
end;

procedure TfrmCadDependente.bbtnProcurarClick(Sender: TObject);
begin
  if (edNomeTitular.Text <> '') and (edCPFTitular.Text <> '') then
  begin
    edNomeTitular.Text := '';
    edCPFTitular.Text := '';
  end;

  MontaSelectTitular.Executar;

  if (MontaSelectTitular.RetornouValor) then
  begin
    edNomeTitular.Text := '  '+MontaSelectTitular.ValoresChave[0];
    edCPFTitular.Text := '  '+MontaSelectTitular.ValoresChave[2];
    sIdPessoa := MontaSelectTitular.ValoresChave[4];

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT NUMSEQUENCIA FROM DEPENTIT WHERE IDTITULAR = ' +sIdPessoa+
                   ' ORDER BY NUMSEQUENCIA');
    qryAux.Open;

    if (qryAux.IsEmpty) then
      qryDepenTit.FieldByName('NUMSEQUENCIA').asInteger := 1
    else
    begin
      qryAux.Last;
      qryDepenTit.FieldByName('NUMSEQUENCIA').asInteger := qryAux.FieldByName('NUMSEQUENCIA').asInteger + 1;
      dbchkContaImpostoRenda.SetFocus;
    end;

    qryDepenTit.FieldByName('TITULAR').asString := Trim(edNomeTitular.Text);
    qryDepenTit.FieldByName('TIPODEPENDENCIA').asString := Trim(dblkcmbDependente.Text);
  end;

  dblkcmbDependente.Enabled := (edNomeTitular.Text <> '');
  dblkcmbDependente.SetFocus;
end;

procedure TfrmCadDependente.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if (pgCtrlDetalhe.ActivePage = tbsTitular) then
  begin
    GroupBoxTitular.Enabled := true;
    bbtnProcurar.Enabled := true;
    edNomeTitular.Text := '';
    edCPFTitular.Text := '';
    dbchkContaImpostoRenda.Checked := false;
    dbchkContaSalarioFamilia.Checked := false;
  end
  else
  if (pgCtrlDetalhe.ActivePage = tbsDet) then
    bbtnAssocEndTit.Enabled := not(qryDepenTit.IsEmpty);
end;

procedure TfrmCadDependente.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if (pgCtrlDetalhe.ActivePage = tbsTitular) then
  begin
    // Carrega o Titular
    qryAux.Close;
    with (qryAux.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  P.IDPESSOA, P.NOME, P.NUMDOCUMENTO');
      Add('FROM');
      Add('  PESSOA P, DEPENTIT DP');
      Add('WHERE');
      Add('  (P.IDPESSOA   = ' +qryDepenTit.FieldByName('IDTITULAR').asString+ ') AND');
      Add('  (DP.IDTITULAR = P.IDPESSOA)');
    end;

    sIdPessoa := '';

    try
      qryAux.Open;
      sIdPessoa := qryDepenTit.FieldByName('IDTITULAR').asString;
    except
      on E: EDBEngineError do
      begin
        MostrarErro(E);
        exit;
      end;
    end;

    edNomeTitular.Text := '  '+qryAux.FieldByName('NOME').asString;
    edCPFTitular.Text := qryAux.FieldByName('NUMDOCUMENTO').asString;

    // Carrega Situação do Dependente
    dblkcmbSitDependente.Text := qrySubTipo.FieldByName('SITUACAODEPENDENTE').asString;
    dblkcmbSitDependente.PerformSearch;

    GroupBoxTitular.Enabled := false;
    bbtnProcurar.Enabled := false;
    dblkcmbDependente.SetFocus;
  end
  else
  if (pgCtrlDetalhe.ActivePage = tbsDet) then
    bbtnAssocEndTit.Enabled := false;
end;

procedure TfrmCadDependente.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsTitular) then
    if not(VerificaDependente) then
      exit;

  try
    inherited;
  except
    exit;
  end;

  // Limpa campos do Titular
  edNomeTitular.Text := '';
  edCPFTitular.Text := '';
  dblkcmbDependente.Text := '';
  dblkcmbSitDependente.Text := '';
  dbchkContaImpostoRenda.Checked := false;
  dbchkContaSalarioFamilia.Checked := false;
end;

procedure TfrmCadDependente.sbtnApagarClick(Sender: TObject);
begin
  if (qry.FieldByName('IDPESSOA').asString = '') then
  begin
    sbtnApagar.Down := false;
    exit;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE DEPENTIT WHERE IDPESSOA = ' + qry.FieldByName('IDPESSOA').asString);

  try
    qryAux.ExecSQL;
  except
    on E: EDBEngineError do
    begin
      MostrarErro(E);
      exit;
    end;
  end;
  inherited;
end;

procedure TfrmCadDependente.bbtnConfirmarClick(Sender: TObject);
var
  K: integer;
  sIDTitular: string;
begin
  if (qryDepenTit.FieldByname('IDTITULAR').asString = '') then
  begin
    MsgDlg('O Titular deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (Trim(dbedNomeFantasia.Text) = '') then
  begin
    MsgDlg('O Nome deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (dbrgrpSexo.ItemIndex < 0) then
  begin
    MsgDlg('Sexo deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (Trim(dbdtNasc.Text) = '') then
  begin
    MsgDlg('Data de Nascimento deve ser informada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  sIDTitular := '';
  K := 1;
  qryDepenTit.First;
  while not(qryDepenTit.EOF) do
  begin
    if (K = 1) then
    begin
      sIDTitular := sIDTitular + qryDepenTit.FieldByname('IDTITULAR').asString;
      Inc(K);
    end
    else
      sIDTitular := sIDTitular +','+ qryDepenTit.FieldByname('IDTITULAR').asString;

    qryDepenTit.Next;
  end;

  inherited;

  if (sIDTitular <> '') then
  begin
    if (Pos(',',sIDTitular) > 0) then
    begin
      qryTitularAux.SQL[11] := '      (DP.IDTITULAR     IN (' +sIDTitular+ ')) AND';
      qryTitularAux.SQL[17] := '  (F.IDPESSOA IN (' +sIDTitular+ ')) AND'
    end
    else
    begin
      qryTitularAux.SQL[11] := '      (DP.IDTITULAR     = ' +sIDTitular+ ') AND';
      qryTitularAux.SQL[17] := '  (F.IDPESSOA  = ' +sIDTitular+ ') AND';
    end;
    qryTitularAux.Open;

    sIDTitular := '';
    K := 1;
    with (qryTitularAux) do
    begin
      First;
      while not(EOF) do
      begin
        if (FieldByName('NUMDEPIRRF').asInteger <> FieldByName('NUM_IRRF').asInteger) or
           (FieldByName('NUMDEPSALF').asInteger <> FieldByName('NUM_SAL_FAM').asInteger) then
          if (K = 1) then
          begin
            sIDTitular := sIDTitular + FieldByName('IDPESSOA').asString;
            Inc(K);
          end
          else
            sIDTitular := sIDTitular +','+ FieldByName('IDPESSOA').asString;
        Next;
      end;
    end;
    qryTitularAux.Close;

    if (sIDTitular <> '') then
      MostraListaTit(sIDTitular);
  end;
end;

function TfrmCadDependente.VerificaDependente: boolean;
begin
  Result := false;

  // Verificar campos obrigatórios do Dependente
  if (Trim(edNomeTitular.Text) = '') then
  begin
    MsgDlg('O Titular deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    bbtnProcurar.SetFocus;
    exit;
  end;

  if (Trim(dblkcmbDependente.Text) = '') then
  begin
    MsgDlg('O Tipo do Dependente deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblkcmbDependente.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmCadDependente.bbtnAssocEndTitClick(Sender: TObject);
var
  sAux: string;
begin
  MontaSelectEndTit.Filtro.Clear;
  if (qryDepenTit.RecordCount = 1) then
    MontaSelectEndTit.Filtro.Add('ENDPESS.IDPESSOA = ' +qryDepenTit.FieldByName('IDTITULAR').asString)
  else
  begin
    sAux := 'ENDPESS.IDPESSOA IN (';
    qryDepenTit.First;
    repeat
      sAux := sAux + qryDepenTit.FieldByName('IDTITULAR').asString;
      qryDepenTit.Next;
    until (qryDepenTit.EOF);
    qryDepenTit.First;
    MontaSelectEndTit.Filtro.Add(sAux + ')');
  end;
  MontaSelectEndTit.Filtro.Add('ENDPESS.IDPESSOA = PESSOA.IDPESSOA');    

  MontaSelectEndTit.Executar;

  if (MontaSelectEndTit.RetornouValor) then
  begin
    qryEndereco.FieldByName('NOME').asString := MontaSelectEndTit.ValoresChave[0];
    qryEndereco.FieldByName('LOGRADOURO').asString := MontaSelectEndTit.ValoresChave[1];
    qryEndereco.FieldByName('NUMERO').asString := MontaSelectEndTit.ValoresChave[2];
    qryEndereco.FieldByName('COMPLEMENTO').asString := MontaSelectEndTit.ValoresChave[3];
    qryEndereco.FieldByName('BAIRRO').asString := MontaSelectEndTit.ValoresChave[4];
    qryEndereco.FieldByName('CEP').asString := MontaSelectEndTit.ValoresChave[5];
    qryEndereco.FieldByName('IDCIDADES').asString := MontaSelectEndTit.ValoresChave[6];

    chkTipoEndereco.Checked[0] := (MontaSelectEndTit.ValoresChave[07] <> '');
    chkTipoEndereco.Checked[1] := (MontaSelectEndTit.ValoresChave[08] <> '');
    chkTipoEndereco.Checked[2] := (MontaSelectEndTit.ValoresChave[09] <> '');
    chkTipoEndereco.Checked[3] := (MontaSelectEndTit.ValoresChave[10] <> '');
    chkTipoEndereco.Checked[4] := (MontaSelectEndTit.ValoresChave[11] <> '');

    if (chkTipoEndereco.Checked[0]) then
      qry.FieldByName('IdEndComercial').asFloat := qryEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[1]) then
      qry.FieldByName('IdEndResidencial').asFloat := qryEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[2]) then
      qry.FieldByName('IdEndEntrega').asFloat := qryEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[3]) then
      qry.FieldByName('IdEndCobranca').asFloat := qryEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[4]) then
      qry.FieldByName('IdEndCorresp').asFloat := qryEndereco.FieldByName('IDENDERECO').asFloat;
  end;
end;

procedure TfrmCadDependente.dblcNacionalChange(Sender: TObject);
begin
  if (qryPaises.Active) then
  begin
    gbxNaturalidade.Enabled := (Trim(dblcNacional.Text) <> '') or
      (qryPessoaFisica.FieldByName('IdPessoa').IsNull);

    if (iPaisAntigo <> qryPaises.FieldByName('IdPais').asInteger) or
       (gbxNaturalidade.Enabled) then
    begin
      iPaisAntigo := qryPaises.FieldByName('IdPais').asInteger;
      with (qryEstadoNasc) do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('  CODESTADO, NOMEESTADO');
        SQL.Add('FROM');
        SQL.Add('  Estado');
        if (qryPaises.FieldByName('IdPais').asInteger > 0) then
        begin
          SQL.Add('WHERE');
          SQL.Add('  (IdPais = '+qryPaises.FieldByName('IdPais').asString+')');
        end;
        SQL.Add('ORDER BY');
        SQL.Add('  UPPER(NOMEESTADO)');
        Open;
      end;

      with (qryCidadeNasc) do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('  C.IDCIDADES, C.NOME');
        SQL.Add('FROM');
        SQL.Add('  CIDADES C, ESTADO E');
        SQL.Add('WHERE');
        if (qryPaises.FieldByName('IdPais').asInteger > 0) then
          SQL.Add('  (E.IdPais   = '+qryPaises.FieldByName('IdPais').asString+') AND');
        SQL.Add('  (E.IDESTADO = C.IDESTADO)');
        SQL.Add('ORDER BY');
        SQL.Add('  UPPER(C.NOME)');
        Open;
      end;

      if (qryPessoaFisica.State in [dsInsert, dsEdit]) then
      begin
        qryPessoaFisica.FieldByName('CODESTADO').Clear;
        qryPessoaFisica.FieldByName('IDCIDADES').Clear;
      end;
    end;
  end;
end;

end.
