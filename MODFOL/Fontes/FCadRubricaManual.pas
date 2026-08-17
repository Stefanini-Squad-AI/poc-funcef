unit FCadRubricaManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TREdit, Mask,
  TabControlDetalhe, ExtCtrls, Wwtable, DBCtrls, wwdblook, wwdbedit, Spin, ImgList,
  CmEventosCadastro;

type
  TfrmCadRubricaManual = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    qryProvDesc: TwwQuery;
    Label8: TLabel;
    Label9: TLabel;
    qryDetIDPESSOA: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetMES: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetREFERENCIA: TStringField;
    qryDetIDRUBRICA: TFloatField;
    qryDetCODPROVDESC: TStringField;
    qryDetVALORPROVENTO: TFloatField;
    qryDetSEQRUBRICA: TFloatField;
    dblkpcmbRubrica: TwwDBLookupCombo;
    qryMotivo: TwwQuery;
    Label3: TLabel;
    dblcMotivo: TwwDBLookupCombo;
    Label4: TLabel;
    dbedRefer: TwwDBEdit;
    dbedValor: TDBRealEdit;
    qryDetDESCRPROVDESC: TStringField;
    dbtxtSituacao: TDBText;
    qryParamRH: TwwQuery;
    grpMesInicio: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    cmbMesRef: TComboBox;
    spnedAnoRef: TSpinEdit;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    cmbMesCob: TComboBox;
    spnedAnoCob: TSpinEdit;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    qryDetIDMODULO: TFloatField;
    sbtnElimHistRubSal: TToolbarButton97;
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    procedure AtualizarDetalhe (IDPessoa: integer);
  end;

var
  frmCadRubricaManual: TfrmCadRubricaManual;

implementation

uses uSistema, uMensErro, uDataBase, uFuncoesUteis, UsoGeralRH, fAguarde, fTelaAut,
  fElimHistRubSal;

{$R *.DFM}

procedure TfrmCadRubricaManual.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  with (MontaSelect.Filtro) do
  begin
    Add ('SITFUNC.IDSITFUNC     = FUNCIONARIO.IDSITFUNC');
    Add ('FUNCIONARIO.IDPESSOA  = PESSOAFISICA.IDPESSOA');
    Add ('PESSOAFISICA.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qryParamRH.Open;
  qryMotivo.Open;

  qry.Close;
  qryDet.Close;
  qryProvDesc.Close;

  qry.Prepare;
  qryDet.Prepare;
  qryProvDesc.Prepare;

  qryProvDesc.Close;
  qryProvDesc.ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  qryProvDesc.Open;

  sbtnProcurarClick(Self);

  if (MontaSelect.ValoresChave.Count = 0) or (MontaSelect.ValoresChave[0] = '') then
    AtualizarDetalhe (-1);
end;

procedure TfrmCadRubricaManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryParamRH.Close;
  qryMotivo.Close;
  qry.Close;
  qryDet.Close;
  qryProvDesc.Close;

  qry.UnPrepare;
  qryDet.UnPrepare;
  qryProvDesc.UnPrepare;
  inherited;
end;

procedure TfrmCadRubricaManual.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Para fazer a procura na criação do Formulário
end;

procedure TfrmCadRubricaManual.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) then
    if (MontaSelect.ValoresChave[0] <> '') then
    begin
      frmAguarde.Mostra('Selecionando Histórico de Rubricas');
      frmAguarde.pbAguarde.Visible := false;

      AtualizarDetalhe (StrToInt(MontaSelect.ValoresChave[0]));

      if (qry.FieldByName('TIPOSIT').asString = 'D') then
        dbtxtSituacao.Font.Color := clRed
      else
      if (qry.FieldByName('TIPOSIT').asString = 'F') then
        dbtxtSituacao.Font.Color := clGreen
      else
      if (qry.FieldByName('TIPOSIT').asString = 'A') then
        dbtxtSituacao.Font.Color := clBlue;

      cmbMesRef.ItemIndex := ExtraiMes(qryParamRH.FieldByName('NORMALINI').asDateTime);
      cmbMesCob.ItemIndex := ExtraiMes(qryParamRH.FieldByName('NORMALINI').asDateTime);
      spnedAnoRef.Text    := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);
      spnedAnoCob.Text    := Copy(qryParamRH.FieldByName('NORMALINI').asString,7,4);

      frmAguarde.Apaga;
    end;
end;

procedure TfrmCadRubricaManual.qryDetBeforePost(DataSet: TDataSet);
var
  sAnoMesReferencia, sAnoMesCobranca: string;
begin
  sAnoMesReferencia := spnedAnoRef.Text +'/'+ PoeZero(cmbMesRef.ItemIndex+1);
  sAnoMesCobranca   := spnedAnoCob.Text +'/'+ PoeZero(cmbMesCob.ItemIndex+1);

  if (qryDet.State = dsInsert) then
  begin
    qryDet.FieldByName('IDMODULO').asInteger  := 21;
    qryDet.FieldByName('IdPessoa').asInteger  := qry.FieldByName('IdPessoa').asInteger;
    qryDet.FieldByName('IdPessJur').asInteger := qry.FieldByName('IdEmpresa').asInteger;
    qryDet.FieldByName('IdRubrica').asInteger := qryProvDesc.FieldbyName('IdRubrica').asInteger;
  end;

  qryDet.FieldByName('Mes').asString           := sAnoMesReferencia;
  qryDet.FieldByName('MesCobranca').asString   := sAnoMesCobranca;
  qryDet.FieldByName('CodProvDesc').asString   := qryProvDesc.FieldByName('CodProvDesc').asString;
  qryDet.FieldByName('DESCRPROVDESC').asString := qryProvDesc.FieldByName('DESCRPROVDESC').asString;
  qryDet.FieldByName('SeqRubrica').asInteger   := 1;
  qryDet.FieldByName('IdMotivo').asInteger     := qryMotivo.FieldByName('IdMotivo').asInteger;
end;

procedure TfrmCadRubricaManual.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldbyName('IdMotivo').asInteger := qryParamRH.FieldbyName('IdMotivo').asInteger;
end;

procedure TfrmCadRubricaManual.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cmbMesRef.SetFocus;
end;

procedure TfrmCadRubricaManual.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  spnedAnoRef.Text    := Copy(qryDet.FieldByName('Mes').asString,1,4);
  cmbMesRef.ItemIndex := StrToIntDef(Copy(qryDet.FieldByName('Mes').asString,6,2),1)-1;
  spnedAnoCob.Text    := Copy(qryDet.FieldByName('MesCobranca').asString,1,4);
  cmbMesCob.ItemIndex := StrToIntDef(Copy(qryDet.FieldByName('MesCobranca').asString,6,2),1)-1;
  cmbMesRef.SetFocus;
end;

procedure TfrmCadRubricaManual.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblkpcmbRubrica.Text) = '') then
  begin
    MsgDlg('Preencha a Rubrica !','Atenção',mterror,[mbOK],0);
    exit;
  end;

  if (Trim(dblcMotivo.Text) = '') then
  begin
    MsgDlg('Preencha o Tipo de Folha !','Atenção',mterror,[mbOK],0);
    exit;
  end;

  if (Trim(dbedValor.Text) = '') then
  begin
    MsgDlg('Preencha o Valor da Rubrica !','Atenção',mterror,[mbOK],0);
    exit;
  end;

  if (Trim(dbedRefer.Text) = '') then
  begin
    MsgDlg('Preencha a Referência !','Atenção',mterror,[mbOK],0);
    exit;
  end;
  dbgrdDet.Invalidate;
  inherited;
end;

procedure TfrmCadRubricaManual.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

procedure TfrmCadRubricaManual.sbtnApagarClick(Sender: TObject);
begin
  AbrirForm (frmElimHistRubSal, TfrmElimHistRubSal, false);
end;

procedure TfrmCadRubricaManual.AtualizarDetalhe (IDPessoa: integer);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qry.Open;

  frmAguarde.Update;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qryDet.Open;
end;

end.
