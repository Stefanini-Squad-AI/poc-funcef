{-------------------------------------------------------------------------------
Analista.: William Moreira da Silva
SOL......: 238909/18349
Data.....: 16/02/2017
Descrição: As rubricas de empréstimos enviadas para a folha de pagamento quando
  quando caem em excesso de débito devem refletir na TMPDESC no campo SITENVIO como "1".
-------------------------------------------------------------------------------}

unit fCadRubricaManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, TB97, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TREdit, Mask, TabControlDetalhe, ExtCtrls,
  DBCtrls, wwdblook, wwdbedit, Spin, ImgList, CmEventosCadastro, FCadastroMestreDetMT,
  DBClient, uCMClientDataSet, uCtrlHistRubSal, uCtrlPessoaFuncionario, uCtrlMotivo,
  uCtrlProvDesc, uCtrlGlobalRH, wwdbdatetimepicker, CMDateTimePicker
  ,Wwquery;//William Moreira da Silva - SOL 238909/18349
  
type
  TfrmCadRubricaManual = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dblkpcmbRubrica: TwwDBLookupCombo;
    Label3: TLabel;
    dblcMotivo: TwwDBLookupCombo;
    Label4: TLabel;
    dbedRefer: TwwDBEdit;
    dbedValor: TDBRealEdit;
    dbtxtSituacao: TDBText;
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
    sbtnElimHistRubSal: TToolbarButton97;
    CdsDet: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsProvDesc: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    dbedDataPagamento: TCMDateTimePicker;
    Label5: TLabel;
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CdsDetBeforePost(DataSet: TDataSet);
    procedure CdsDetAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    CtrlHistRubSal: TCtrlHistRubSal;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlMotivo: TCtrlMotivo;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlGlobalRH: TCtrlGlobalRH;

    procedure Sel(IdPessoa: double);
    procedure HabilitarControles(Habilitar: boolean);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRubricaManual: TfrmCadRubricaManual;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, fAguarde, fTelaAut, fElimHistRubSal,
  uCtrlPadroes, uCtrlUsoGeralRH
  , dBaseDados; //William Moreira da Silva -SOL 238909/18349 

{$R *.DFM}

procedure TfrmCadRubricaManual.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlHistRubSal := TCtrlHistRubSal.Create;
  CtrlHistRubSal.InitializeAs(Padroes);
  CtrlHistRubSal.CdsDet := CdsDet;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC(+)');
  end;

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NORMALINI, IDMOTIVO');
  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  CdsProvDesc.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
end;

procedure TfrmCadRubricaManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistRubSal);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmCadRubricaManual.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    frmAguarde.Mostra('Selecionando Histórico de Rubricas');
    frmAguarde.pbAguarde.Visible := false;

    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    if (Cds.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;

    cmbMesRef.ItemIndex := FU.ExtraiMes(CdsParamRH.FieldByName('NORMALINI').asDateTime);
    cmbMesCob.ItemIndex := FU.ExtraiMes(CdsParamRH.FieldByName('NORMALINI').asDateTime);
    spnedAnoRef.Text := IntToStr(FU.ExtraiAno(CdsParamRH.FieldByName('NORMALINI').asDateTime));
    spnedAnoCob.Text := IntToStr(FU.ExtraiAno(CdsParamRH.FieldByName('NORMALINI').asDateTime));

    frmAguarde.Apaga;
  end;
end;

procedure TfrmCadRubricaManual.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRubricaManual.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  frmAguarde.Mostra('Gravando Rubricas...');
  frmAguarde.Update;
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRubricaManual.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (cmbMesRef.CanFocus) then
    cmbMesRef.SetFocus;
end;

procedure TfrmCadRubricaManual.CdsDetAfterInsert(DataSet: TDataSet);
begin
  CdsDet.FieldByName('IDMOTIVO').asInteger := CdsParamRH.FieldByName('IDMOTIVO').asInteger;
  HabilitarControles(true);
end;

procedure TfrmCadRubricaManual.CdsDetBeforePost(DataSet: TDataSet);
var
  sAnoMesReferencia, sAnoMesCobranca: string;
begin
  sAnoMesReferencia := spnedAnoRef.Text +'/'+ FU.PoeZero(cmbMesRef.ItemIndex+1);
  sAnoMesCobranca := spnedAnoCob.Text +'/'+ FU.PoeZero(cmbMesCob.ItemIndex+1);

  if (CdsDet.State = dsInsert) then
  begin
    CdsDet.FieldByName('IDMODULO').asInteger := 21;
    CdsDet.FieldByName('IdPessoa').asInteger := Cds.FieldByName('IdPessoa').asInteger;
    CdsDet.FieldByName('IdPessJur').asInteger := Cds.FieldByName('IdEmpresa').asInteger;
    if (Sistema.TipoEmpresa = 'P') then
      CdsDet.FieldByName('IDPATRO').asInteger := Cds.FieldByName('IDEMPRESA').asInteger;
    CdsDet.FieldByName('IdRubrica').asInteger := CdsProvDesc.FieldByName('IdRubrica').asInteger;
  end;

  CdsDet.FieldByName('Mes').asString := sAnoMesReferencia;
  CdsDet.FieldByName('MesCobranca').asString := sAnoMesCobranca;
  CdsDet.FieldByName('CodProvDesc').asString := CdsProvDesc.FieldByName('CodProvDesc').asString;
  CdsDet.FieldByName('DESCRPROVDESC').asString := CdsProvDesc.FieldByName('DESCRPROVDESC').asString;
  CdsDet.FieldByName('SeqRubrica').asInteger := 1;
  CdsDet.FieldByName('IdMotivo').asInteger := CdsMotivo.FieldByName('IdMotivo').asInteger;
end;

procedure TfrmCadRubricaManual.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  spnedAnoRef.Text := Copy(CdsDet.FieldByName('Mes').asString,1,4);
  cmbMesRef.ItemIndex := StrToIntDef(Copy(CdsDet.FieldByName('Mes').asString,6,2),1)-1;
  spnedAnoCob.Text := Copy(CdsDet.FieldByName('MesCobranca').asString,1,4);
  cmbMesCob.ItemIndex := StrToIntDef(Copy(CdsDet.FieldByName('MesCobranca').asString,6,2),1)-1;
  HabilitarControles(false);
  dbedValor.SetFocus;
end;

procedure TfrmCadRubricaManual.dsStateChange(Sender: TObject);
begin
  inherited;
  sbtnElimHistRubSal.Enabled := not(Cds.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadRubricaManual.sbtnApagarClick(Sender: TObject);
begin
  AbrirFormModal(frmElimHistRubSal, TfrmElimHistRubSal);
end;

procedure TfrmCadRubricaManual.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblkpcmbRubrica.Text) = '') then
  begin
    MsgDlg('Preencha a Rubrica.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblkpcmbRubrica.SetFocus;
  end
  else
  if (Trim(dblcMotivo.Text) = '') then
  begin
    MsgDlg('Preencha o Tipo de Folha.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcMotivo.SetFocus;
  end
  else
  if (dbedValor.Value = 0) then
  begin
    MsgDlg('Preencha o Valor da Rubrica.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedValor.SetFocus;
  end
  else
  if (Trim(dbedRefer.Text) = '') then
  begin
    MsgDlg('Preencha a Referência.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedRefer.SetFocus;
  end
  else
  begin
    dbgrdDet.Invalidate;
    inherited;
  end;
end;

procedure TfrmCadRubricaManual.bbtnConfirmarClick(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    bbtnOkDetClick(Sender);
    bbtnCancelarDetClick(Sender);
  end;

 //William Moreira da Silva - SOL 238909/18349
 with dtmBaseDados.dbBaseDados do
    if InTransaction then
       Commit;
 //William Moreira da Silva - SOL 238909/18349
 inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRubricaManual.Sel(IdPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa);
  frmAguarde.Update;
  CdsDet.Data := CtrlHistRubSal.ListHistRubSal(IdPessoa);
end;

function TfrmCadRubricaManual.GravarRegistro: boolean;
begin
  Result := CtrlHistRubSal.Gravar;
  frmAguarde.Apaga;
  if not(Result) then
    raise exception.Create(CtrlHistRubSal.MessageInfo);
end;

procedure TfrmCadRubricaManual.HabilitarControles(Habilitar: boolean);
begin
  cmbMesRef.Enabled := Habilitar;
  cmbMesCob.Enabled := Habilitar;
  spnedAnoRef.Enabled := Habilitar;
  spnedAnoCob.Enabled := Habilitar;
  dblkpcmbRubrica.Enabled := Habilitar;
  dblcMotivo.Enabled := Habilitar;
  dbedRefer.Enabled := Habilitar;
end;

//William Moreira da Silva - SOL 238909/18349
procedure TfrmCadRubricaManual.sbtnExcluiDetClick(Sender: TObject);
var
  qry : TwwQuery;
  qryTxt : string;
begin
  qry := TwwQuery.Create(nil);
  qry.DatabaseName := 'BaseDados';

  if not (dtmBaseDados.dbBaseDados.InTransaction) then
        dtmBaseDados.dbBaseDados.StartTransaction;

  qry.Close;
  qry.SQL.Clear;

  qryTxt := ' ';

  qryTxt := 'update tmpdesc tm '+
   ' set tm.sitenvio = 0, '+
   ' tm.DATARECEBIMENTO = NULL, '+
   ' tm.VALORRECEBIDO   = NULL, '+
   ' tm.IDSEQINTERNOFB  = NULL  '+
   ' where tm.idpessoa = '+ CdsDet.FieldByName('IDPESSOA').asString +
   ' and tm.mescobranca = '''+ CdsDet.FieldByName('MES').asString + ''''+
   ' and (tm.idprovento in (select pr.idprovento '+
                           ' from provdesc pr '+
                           ' where pr.idproventoexcessodeb in ('+CdsDet.FieldByName('IDRUBRICA').asString +')) '+
   ' or tm.idprovento in ('+CdsDet.FieldByName('IDRUBRICA').asString +')) ';

  qry.SQL.Add(qryTxt);
  qry.ExecSQL;
  FreeAndNil(qry);

  inherited;
end;

procedure TfrmCadRubricaManual.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    with dtmBaseDados.dbBaseDados do
      if InTransaction then
         RollBack;
end;
//William Moreira da Silva - SOL 238909/18349

end.
