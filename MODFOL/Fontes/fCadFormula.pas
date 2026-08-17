unit fCadFormula;

interface

uses
  Windows, Messages, SysUtils, Graphics, Controls, Forms, dialogs, StdCtrls, Db, fCadastroMT,
  DBTables, cmseldlg, wwidlg, Wwdatsrc, DBCtrls, MAHlpBtn, Mask, Buttons, TB97, ComCtrls,
  ExtCtrls, wwdbedit, wwdblook, MontaSelect, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, Classes,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, ImgList, DBClient, IvEMulti,
  fcButtonGroup, fcOutlookBar, CmEventosCadastro, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid,
  TB97Tlwn, uCtrlCadRegra, uCtrlListTerceirosRH;

type
  TfrmCadFormula = class(TFrmCadastroMT)
    pnlListaFormasCalc: TPanel;
    Panel5: TPanel;
    fcOpcoes: TfcOutlookBar;
    fcNumeros: TfcShapeBtn;
    fcFormulas: TfcShapeBtn;
    fcData: TfcShapeBtn;
    fcLstNumeros: TfcOutlookList;
    fcOutlookBar1OutlookList2: TfcOutlookList;
    fcOutlookBar1OutlookList3: TfcOutlookList;
    pnlTeclas: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    sbtnCampos: TSpeedButton;
    Label3: TLabel;
    dbedDescr: TwwDBEdit;
    dblckGrupo: TwwDBLookupCombo;
    dbedExpressao: TwwDBEdit;
    Panel3: TPanel;
    bbtnApagarTodaExpressao: TBitBtn;
    bbtnApagarUltimoCaracter: TBitBtn;
    fcOutlookBar1OutlookList6: TfcOutlookList;
    fcMatematicas: TfcShapeBtn;
    fcOutlookBar1OutlookList7: TfcOutlookList;
    fcTabGenericaLonga: TfcShapeBtn;
    fcOpcoesOutlookList3: TfcOutlookList;
    fcHistoricoRubricas: TfcShapeBtn;
    dbedNumero: TwwDBEdit;
    dbrgPublicada: TDBRadioGroup;
    bbtnTestar: TBitBtn;
    memDescricao: TMemo;
    Label1: TLabel;
    CdsGrupo: TCMClientDataSet;
    townProcExpressao: TToolWindow97;
    bbtnFecharExpressao: TBitBtn;
    dbgrProcExpressao: TwwDBGrid;
    bbtnOkExpressao: TBitBtn;
    edExpressao: TEdit;
    bbtnProcExpressao: TBitBtn;
    Label5: TLabel;
    sbtnProcurarExpressao: TToolbarButton97;
    CdsProcExpressao: TCMClientDataSet;
    dsProcExpressao: TwwDataSource;
    bbtnEnviarConteudo: TBitBtn;
    fcOpcoesEspeciais: TfcOutlookList;
    fcEspeciais: TfcShapeBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnApagarUltimoCaracterClick(Sender: TObject);
    procedure bbtnApagarTodaExpressaoClick(Sender: TObject);
    procedure sbtnCamposClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnTestarClick(Sender: TObject);
    procedure fcOutlookBar1OutlookList1Items1Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items2Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items3Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items4Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items5Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items6Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items7Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items8Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items2Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items29Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items30Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items34Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items35Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items0Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items2Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items1Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items4Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items5Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items6Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items7Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items30Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items13Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items0Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList7Items0Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList7Items1Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items14Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items15Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items16Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items3Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items1Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items2Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items3Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items4Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems6lick(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items18Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items19Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items1Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items9Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList3Items12Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems9Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems10Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems11Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems12Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems13Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems14Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items3Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items4Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items11Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems4Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items13Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items12Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcLstNumerosItems16Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList6Items2Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnOkExpressaoClick(Sender: TObject);
    procedure bbtnFecharExpressaoClick(Sender: TObject);
    procedure bbtnProcExpressaoClick(Sender: TObject);
    procedure sbtnProcurarExpressaoClick(Sender: TObject);
    procedure bbtnEnviarConteudoClick(Sender: TObject);
    procedure fcOpcoesEspeciaisItems0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesEspeciaisItems1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesEspeciaisItems2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items5Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure FormResize(Sender: TObject);
    procedure fcOpcoesEspeciaisItems3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
  private
    CtrlCadRegra: TCtrlCadRegra;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    iNumParenteses: integer;
    bTrunc, bRound, bDifMes, bDifAno, bDifDia: boolean;

    procedure Sel(IdRegra: double);
    function  PosCharEsp(Dado: string): LongInt;
    function  GravarRegistro: boolean;
    procedure FecharProcExpressao;
  end;

var
  frmCadFormula: TfrmCadFormula;

implementation

uses JclMapi, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fConsulta, uSistema,
     fExecutaFormaCalc, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadFormula.FormCreate(Sender: TObject);
begin
  inherited;
  frmConsulta := TfrmConsulta.Create(Self);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);
  CtrlCadRegra.CdsRegra := Cds;
  Sel(-77777);

  CdsGrupo.Data := CtrlListTerceirosRH.ListGrupoRegra;

  fcOpcoes.ActivePage := fcFormulas;
end;

procedure TfrmCadFormula.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCadRegra);
  FreeAndNil(frmConsulta);
  inherited;
end;

procedure TfrmCadFormula.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFormula.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadFormula.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFormula.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFormula.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFormula.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('PUBLICADA').asInteger := 0;
end;

procedure TfrmCadFormula.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDescr.CanFocus) then
    dbedDescr.SetFocus;

  sbtnCampos.Enabled := (Cds.State in [dsInsert, dsEdit]);
  pnlTeclas.Enabled := (Cds.State in [dsInsert, dsEdit]);
  bbtnTestar.Enabled := not(sbtnCampos.Enabled);
  bbtnEnviarConteudo.Enabled := not(sbtnCampos.Enabled);
end;

procedure TfrmCadFormula.sbtnAlterarClick(Sender: TObject);
begin
  if (Cds.FieldByName('PUBLICADA').asInteger = 1) then
  begin
    MsgDlg('Forma de Cálculo Publicada.' +CR_LF+ 'Alteração Não Permitida.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    sbtnAlterar.Down := false;
  end
  else
    inherited;
end;

procedure TfrmCadFormula.sbtnApagarClick(Sender: TObject);
begin
  if (CtrlListTerceirosRH.RegraEmUso(Cds.FieldByName('IDREGRA').asInteger)) then
    MsgDlg('Esta Forma de Cálculo não pode ser excluída pois há rubricas utilizando-a.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0)
  else
    inherited;

  sbtnApagar.Down := false;
end;

procedure TfrmCadFormula.bbtnConfirmarClick(Sender: TObject);
var
  IdRegra: double;
  Conta1, Conta2: LongInt;
begin
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedDescr.SetFocus;
    exit;
  end;

  if (Trim(dblckGrupo.Text) = '') then
  begin
    MsgDlg('Preencha o Grupo.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblckGrupo.SetFocus;
    exit;
  end;

  // Verifico se os Colchetes estão completos
  Conta1 := FU.ContaCaracter(dbedExpressao.Text, '[');
  Conta2 := FU.ContaCaracter(dbedExpressao.Text, ']');
  if (Conta1 <> Conta2) then
  begin
    MsgDlg('Qtde. de Abre Colchetes (' +IntToStr(Conta1)+ ')'+CR_LF+
           'Difere de Fecha Colchetes (' +IntToStr(Conta2)+ ')'+CR_LF+
           'Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedExpressao.SetFocus;
    exit;
  end;

  // Verifico se os Parênteses estão completos
  Conta1 := FU.ContaCaracter(dbedExpressao.Text, '(');
  Conta2 := FU.ContaCaracter(dbedExpressao.Text, ')');
  if (Conta1 <> Conta2) then
  begin
    MsgDlg('Qtde. de Abre Parênteses (' +IntToStr(Conta1) +')'+CR_LF+
           'Difere de Fecha Parênteses (' +IntToStr(Conta2) +')'+CR_LF+
           'Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedExpressao.SetFocus;
    exit;
  end;

  memDescricao.Lines.Clear;
  
  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled := false;
  sbtnAlterar.Down := false;
  sbtnInserir.Down := false;
  sbtnInserir.Enabled := true;
  sbtnAlterar.Enabled := true;
  sbtnApagar.Enabled := true;
  sbtnProcurar.Enabled := true;
  sbtnCampos.Enabled := false;

  if (Cds.State = dsEdit) then
    IdRegra := Cds.FieldByName('IDREGRA').asFloat
  else
    IdRegra := 0;
  inherited;
  if (IdRegra > 0) then
    Sel(IdRegra);
end;

procedure TfrmCadFormula.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnCampos.Enabled := false;
end;

procedure TfrmCadFormula.bbtnApagarUltimoCaracterClick(Sender: TObject);
var
  c, Tam: LongInt;
begin
  memDescricao.Lines.Clear;
  Tam := Length(Cds.FieldByName('DESCRICAOREGRA').asString);
  c := PosCharEsp(Cds.FieldByName('DESCRICAOREGRA').asString);

  if (c = Tam) then
    Cds.FieldByName('DESCRICAOREGRA').asString :=
      Copy(Cds.FieldByName('DESCRICAOREGRA').asString, 1, Tam-1)
  else
  if (c = 0) then
    Cds.FieldByName('DESCRICAOREGRA').asString := ''
  else
    Cds.FieldByName('DESCRICAOREGRA').asString :=
      Copy(Cds.FieldByName('DESCRICAOREGRA').asString, 1, c);
end;

procedure TfrmCadFormula.bbtnApagarTodaExpressaoClick(Sender: TObject);
begin
  memDescricao.Lines.Clear;
  iNumParenteses := 0;
  bDifDia := false;
  bDifMes := false;
  bDifAno := false;
  bRound := false;
  bTrunc := false;
  Cds.FieldByName('DESCRICAOREGRA').asString := '';
end;

procedure TfrmCadFormula.sbtnCamposClick(Sender: TObject);
begin
  frmConsulta.ShowModal;
  if (frmConsulta.TipoCampo = 'C') then
    dbedExpressao.Text := dbedExpressao.Text + 'C(' +frmConsulta.ChaveCampo+ ')'
  else
    dbedExpressao.Text := dbedExpressao.Text + frmConsulta.ChaveCampo;

  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.bbtnTestarClick(Sender: TObject);
begin
  with TfrmExecutaFormaCalc.Create(Application) do
  begin
    if (dbedNumero.Text <> '') then
    begin
      edtNumero.Text := dbedNumero.Text;
      edtNumeroExit(Self);
    end;
    ShowModal;

    Free;
  end;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('DIASTRAB(DataRef; OpcaoDiasTrab)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a Qtde de dias trabalhados no Mes de DataRef, conforme a OpcaoDiasTrab');
  memDescricao.Lines.Add('    1 = Desconta só Admissão e Demissão');
  memDescricao.Lines.Add('    2 = Desconta Admissão, Demissão, Afastamento e Retorno');
  memDescricao.Lines.Add('    3 = Desconta Admissão, Demissão e Férias');
  memDescricao.Lines.Add('    4 = Desconta Admissão, Demissão, Afastamento, Retorno e Férias');
  memDescricao.Lines.Add('    5 = Considera os Dias Úteis no Mês');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%DIASTRAB(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('DiasFerias (InicioFerias; OpcaoFerias)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a Qtde de dias das férias iniciadas em InicioFerias, conforme a OpcaoFerias');
  memDescricao.Lines.Add('   0 = Sem adicionar os dias do Abono Pecuniário');
  memDescricao.Lines.Add('   1 = Com adição dos dias do Abono Pecuniário');

  dbedExpressao.Text := dbedExpressao.Text + 'F%DIASFERIAS(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('DiasFeriasNoMes (DataRef)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a Qtde de dias de gozo de ferias no Mes correspondente a DataRef');

  dbedExpressao.Text := dbedExpressao.Text + 'F%DIASFERIASNOMES(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('AvosFerias()');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a Qtde de avos de férias a que a pessoa teria direito');
  memDescricao.Lines.Add('   Se não demitido, entre o Início do Per. Aquis. e a Data Final do Pagto.');
  memDescricao.Lines.Add('   Se demitido, entre o Início do Per. Aquis. e a Data da Rescisão.');

  dbedExpressao.Text := dbedExpressao.Text + 'F%AVOSFERIAS()';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Avos13()');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a Qtde de avos de 13º a que a pessoa teria direito');
  memDescricao.Lines.Add('   Se não demitido, entre o Início do Ano (ou Admissão) e a Data Final do Pagto.');
  memDescricao.Lines.Add('   Se demitido, entre o Início do Ano (ou Admissão) e a Data da Rescisão.');

  dbedExpressao.Text := dbedExpressao.Text + 'F%AVOS13()';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('AvosPerdidos(DataInicial, DataFinal, Motivo)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a Qtde de avos perdidos no período,');
  memDescricao.Lines.Add('pelo Motivo (código) informado. Para todos, colocar -1');

  dbedExpressao.Text := dbedExpressao.Text + 'F%AVOSPERDIDOS(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  MAXIMO(12;25;11;01;11;124;211) ==> Retorna 211');

  dbedExpressao.Text := dbedExpressao.Text + 'F%MAXIMO(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  MINIMO(12,25,11,101,11,124,211) ==> Retorna 11');

  dbedExpressao.Text := dbedExpressao.Text + 'F%MINIMO(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items30Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplos:  ROUND(123,4547;2) ==> Retorna 123,45');
  memDescricao.Lines.Add('           ROUND(123,4547;0) ==> Retorna 123,00');

  dbedExpressao.Text := dbedExpressao.Text + 'F%ROUND(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);  
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items35Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplos:  TRUNCA(123,4547;2)  ==> Retorna 123,45');
  memDescricao.Lines.Add('Exemplos:  TRUNCA(123,4547;-2) ==> Retorna 100,00');

  dbedExpressao.Text := dbedExpressao.Text + 'F%TRUNCA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  bTrunc := true;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items29Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  REGATU() ==> Retorna o número do registro atual '+
    'selecionado pela Forma de Cálculo');

  dbedExpressao.Text := dbedExpressao.Text + 'F%REGATU()';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  //iNumParenteses := 0;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items34Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  TOTREGS() ==> '+
                    'Retorna  a quantidade de registros a serem processados para o empregado. '+
                    'Normalmente, será 1, sendo maior quando há mais de um gozo de férias '+
                    'processadas no período especificado em Parâmetros para Férias.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%TOTREGS()';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  //iNumParenteses := 0;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('SALVA(Expressão)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Salva o valor de uma expressão, para uso posterior na mesma Forma,');
  memDescricao.Lines.Add('através da função RECUPERA.');
  memDescricao.Lines.Add('Particularmente útil quando mais de um registro será processado.');
  memDescricao.Lines.Add('(Referir-se às funções Registro Atual e Total de Registros)');
  memDescricao.Lines.Add('Para uso com o mesmo registro sendo processado, extremo cuidado');
  memDescricao.Lines.Add('deve ser tomado, para garantir que SALVA precede RECUPERA.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%SALVA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Formato.:  SE(Condicao; ResultadoVerdadeiro; ResultadoFalso)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Exemplo.:  SE(12 < 25; 11; 211)'+' ==> '+'Retorna 11');

  dbedExpressao.Text := dbedExpressao.Text + 'F%SE(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' + ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' - ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' * ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' / ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + 'F%SQRT(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + '^';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcLstNumerosItems6lick(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ';';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + '(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList1Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ')';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Dec(iNumParenteses);
end;

procedure TfrmCadFormula.fcLstNumerosItems9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' = ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcLstNumerosItems10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' <> ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcLstNumerosItems11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' > ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcLstNumerosItems12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' < ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcLstNumerosItems13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' >= ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcLstNumerosItems14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;

  dbedExpressao.Text := dbedExpressao.Text + ' <= ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList6Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('JuroComposto(Valor; NumMeses; TaxaJuros)');
  memDescricao.Lines.Add('Retorna o valor dos Juros Compostos de Valor em NumMeses meses');
  memDescricao.Lines.Add('com o juro mensal TaxaJuros %)');

  dbedExpressao.Text := dbedExpressao.Text + 'F%JUROCOMPOSTO(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList6Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  INDICE(UPC;09/01/1998;1) ==> '+
                    'Irá retornar o valor da UPC em 09 de janeiro de 1998. '+
                    'O terceiro parâmetro, se for igual a 0, ou não colocado, '+
                    'diz que só deverá pegar o valor do índice caso esteja cadastrado nesta data. '+
                    'Caso exista o terceiro parâmetro e seja diferente de 0, a regra '+
                    'retornará o último valor cadastrado para o indexador informado.');

  dbedExpressao.Text := dbedExpressao.Text + 'F%INDICE(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  EXTRAIANO(15/05/1998). Esta expressão '+
                    'Retorna o valor 1998'  );
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%EXTRAIANO(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  EXTRAIMES(01/10/1999). Retorna => 10');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%EXTRAIMES(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  EXTRAIDIA(15/05/1998). Esta expressão '+
                    'Retorna o valor 15');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%EXTRAIDIA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  // Mostra Descricao da Formula
  memDescricao.Lines.BeginUpdate;
  with (memDescricao.Lines) do
  begin
    Clear;
    Add('  Retorna o ultimo dia do mês da data.');
    Add('EXEMPLO:');
    Add('  TRAZULTDIAMES(20/02/2000) RETORNA - 29');
  end;
  memDescricao.Lines[0] := memDescricao.Lines[0] + '';
  memDescricao.Lines.EndUpdate;

  dbedExpressao.Text := dbedExpressao.Text + 'F%TRAZULTDIAMES(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  // Mostra Descricao da Formula
  memDescricao.Lines.BeginUpdate;
  with (memDescricao.lines) do
  begin
    Clear;
    Add('  Retorna a data progredida para o último dia do mês da data.');
    Add('');
    Add('EXEMPLO:');
    Add('  TRAZULTDIADATA(20/02/2000) RETORNA - 29/02/2000');
  end;

  memDescricao.Lines[0] := memDescricao.Lines[0] + '';
  memDescricao.Lines.EndUpdate;

  dbedExpressao.Text := dbedExpressao.Text + 'F%TRAZULTDIADATA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  DIFANOS(DATAMENOR;DATAMAIOR) ==> '+
    'Atenção a data maior deve vir depois da menor');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a diferença de anos completos entre as duas datas.');

  bDifAno := true;
  dbedExpressao.Text := dbedExpressao.Text + 'F%DIFANOS(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  DifMeses(DataMenor;DataMaior;Opção) ==> '+
    'Atenção a data maior deve vir depois da menor');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a diferença de meses completos entre as duas datas.');
  memDescricao.Lines.Add('Valores para o parâmetro OPÇÃO: Sem Nada, 0 ou 1:');
  memDescricao.Lines.Add('  Sem Nada ou 0 ==> Meses Inteiros entre as Duas Datas');
  memDescricao.Lines.Add('              1 ==> Meses Arredondados entre as Duas Datas');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  bDifMes := true;
  dbedExpressao.Text := dbedExpressao.Text + 'F%DIFMESES(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  DifDias(DataMenor;DataMaior) ==> '+
    'Atenção a data maior deve vir depois da menor');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a diferença de dias entre as duas datas.');

  bDifDia := true;
  dbedExpressao.Text := dbedExpressao.Text + 'F%DIFDIAS(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('IncData(DataRef; NumDias; NumMeses; NumAnos)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Evolui a DataRef em NumDias dias, NumMeses meses e NumAnos anos,');
  memDescricao.Lines.Add('para frente se positivo e para trás se negativo.');
  memDescricao.Lines.Add('Exemplo: INCDATA(C(DATANASC);0;0;5)  ==> Retorna uma data 5');
  memDescricao.Lines.Add('anos depois data de nascimento contida no campo DATANASC');
  memDescricao.Lines.Add('do banco de dados.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%INCDATA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items30Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  // Mostra Descricao da Formula
  memDescricao.Lines.BeginUpdate;
  with (memDescricao.Lines) do
  begin
    Clear;
    Add('Retorna Datas no Formato AAAA/MM (Ano/Mês)');
    Add('    RETORNAANOMES(DataRef)');
    Add('EXEMPLO:');
    Add('  RETORNAANOMES(01/04/2001) RETORNA: 2001/04');
  end;
  memDescricao.Lines[0] := memDescricao.Lines[0];
  memDescricao.Lines.EndUpdate;

  dbedExpressao.Text := dbedExpressao.Text + 'F%RETORNAANOMES(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  // Mostra Descricao da Formula
  memDescricao.Lines.BeginUpdate;
  with (memDescricao.lines) do
  begin
    Clear;
    Add('Retorna Datas no Formato AAAAMM (AnoMês sem a Barra)');
    Add('    ANOMES(DataRef)');
    Add('EXEMPLO:');
    Add('  ANOMES(01/04/2001) RETORNA: 200104');
  end;
  memDescricao.Lines[0] := memDescricao.Lines[0];
  memDescricao.Lines.EndUpdate;

  dbedExpressao.Text := dbedExpressao.Text + 'F%ANOMES(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList3Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  // Mostra Descricao da Formula
  memDescricao.Lines.BeginUpdate;
  with (memDescricao.Lines) do
  begin
    Clear;
    Add('Retorna Datas em Formato Numérico (sequencial). Essencial para comparar datas.');
    Add('  DATANUM(DataRef)');
    Add('EXEMPLO:');
    Add('  DATANUM(01/01/2001) RETORNA: xxxxxx1');
    Add('  DATANUM(02/01/2001) RETORNA: xxxxxx2');
  end;
  memDescricao.Lines[0] := memDescricao.Lines[0];
  memDescricao.Lines.EndUpdate;

  dbedExpressao.Text := dbedExpressao.Text + 'F%DATANUM(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList6Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  IRRF(NumeroDependentes;DataNascimento;ValorBase;DataRef;TipodeResultado)');
  memDescricao.Lines.Add(' No parâmetro TipodeResultado poderão ter três tipos de formas de Retorno da formula : ');
  memDescricao.Lines.Add(' 0 ou Nada -> Irá retornar o valor do Imposto Devido.');
  memDescricao.Lines.Add(' 1         -> Irá retornar o valor da Aliquota IRRF.');
  memDescricao.Lines.Add(' 2         -> Irá retornar o valor a Deduzir.');
  memDescricao.Lines.Add(' 3         -> Irá retornar a idade de Idoso.');
  memDescricao.Lines.Add(' 4         -> Irá retornar o valor a deduzir da base de cálculo para idosos.');
  memDescricao.Lines.Add(' 5         -> Irá retornar o valor a deduzir da base de cálculo por dependente.');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Exemplo : IRRF(2;04/04/1951;2000;14/04/2000;0) - retornará o Imposto Devido.');
  memDescricao.Lines.Add('Exemplo : IRRF(2;04/04/1951;2000;14/04/2000) - também retornará o Imposto Devido.');
  memDescricao.Lines.Add('Exemplo : IRRF(2;04/04/1951;2000;14/04/2000;1) - retornará a Aliquota IRRF.');
  memDescricao.Lines.Add('Exemplo : IRRF(2;04/04/1951;2000;14/04/2000;2) - retornará o Valor a Deduzir.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%IRRF(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList7Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('TABGENERICA(NomeDaTabela;ValorProcurado;ColunaDePesquisa;ColunaDeRetorno;Flag(0,1 ou 2))'+' ==> '+
                    'Ex.: TABGENERICA(TABTESTE;45;IDADE;REDUTOR;2) '+#13+#10+
                    'Retorna o Redutor contido na tabela genérica TABTESTE para '+
                    'Idade igual a 45. O ultimo parametro determina que sera utilizada '+
                    'a primeira idade acima de 45 caso esta nao exista na tabela.');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Caso Flag seja igual a : ');
  memDescricao.Lines.Add('0 -> Pequisará na tabela o valor igual ao ValorProcurado');
  memDescricao.Lines.Add('1 -> Pequisará na tabela o valor  menor ou igual ao ValorProcurado');
  memDescricao.Lines.Add('2 -> Pequisará na tabela o valor  maior ou igual ao ValorProcurado');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%TABGENERICA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList7Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Exemplo.:  TABLONGA([CAMPO1=VALOR1;..;CAMPO10=VALOR10]TABELA;CAMPORETORNO;TIPOPESQUISA)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('TIPOPESQUISA deve ser 0 ou 1.');
  memDescricao.Lines.Add('Se 1 (um)   - Tabela Genérica.');
  memDescricao.Lines.Add('Se 0 (zero) - Tabela Longa.');
  memDescricao.Lines.Add('Caso não atribua nada, a pesquisa será');
  memDescricao.Lines.Add('feita pela Tabela Longa.');
  memDescricao.Lines.Add('OBS: O operando pode ser <> , >= , <= , < , > ou =');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%TABLONGA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOpcoesOutlookList3Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('SOMAHISTRUB(Rubrica; DataRef; QtdeMeses; TipoDeFolha)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Passada uma rubrica e uma quantidade de meses, retorna a soma dos');
  memDescricao.Lines.Add('valores das rubricas encontradas no periodo informado (QTDEMESES) a partir');
  memDescricao.Lines.Add('de uma determinada data (DATAREF) para trás. Pode ser especificado ');
  memDescricao.Lines.Add('um Tipo de Folha (seu código) ou deixado -1 para todos.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%SOMAHISTRUB(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOpcoesOutlookList3Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('MEDIAHISTRUB(Rubrica; DataRef; QtdeMeses; TipoDeFolha)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Passada uma rubrica e uma quantidade de meses, retorna a média dos');
  memDescricao.Lines.Add('valores das rubricas encontradas no periodo informado (QTDEMESES) a partir');
  memDescricao.Lines.Add('de uma determinada data (DATAREF) para trás. Pode ser especificado ');
  memDescricao.Lines.Add('um Tipo de Folha (seu código) ou deixado -1 para todos.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%MEDIAHISTRUB(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOpcoesOutlookList3Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('QTDEHISTRUB(Rubrica; DataRef; QtdeMeses; TipoDeFolha)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Passada uma rubrica e uma quantidade de meses, retorna a quantidade de');
  memDescricao.Lines.Add('ocorrências da rubrica encontrada no periodo informado (QTDEMESES) a partir');
  memDescricao.Lines.Add('de uma determinada data (DATAREF) para trás. Pode ser especificado ');
  memDescricao.Lines.Add('um Tipo de Folha (seu código) ou deixado -1 para todos.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%QTDEHISTRUB(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOpcoesOutlookList3Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('VALORRUBRICA(Rubrica)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Passada uma rubrica, retorna o valor desta, gerada no processo atual.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%VALORRUBRICA(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcLstNumerosItems4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('Aritm(Expressão Aritmética)');
  memDescricao.Lines.Add('Retorna o valor resultante da Expressão Aritmética');
  memDescricao.Lines.Add('Exemplo:');
  memDescricao.Lines.Add('   ARITM([5 + 1] * 30 / 5) ==> Retorna o Valor 36');
  memDescricao.Lines.Add('NOTE que os agrupamentos na expressão são feitos com colchetes.');

  dbedExpressao.Text := dbedExpressao.Text + 'F%ARITM(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('QTDEDEPEN(DataRef; TipoDepen; IdadeMin; IdadeMax; OpcaoTempo; OpcaoDeficiente)');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Retorna a Qtde de dependentes, do tipo TipoDepen, cuja idade, ');
  memDescricao.Lines.Add('em DataRef, esteja entre IdadeMin e IdadeMax, expressa em ');
  memDescricao.Lines.Add('OpcaoTempo, que pode ter os valores:');
  memDescricao.Lines.Add('    1 = Anos Inteiros');
  memDescricao.Lines.Add('    2 = Meses Inteiros');
  memDescricao.Lines.Add('    3 = Anos Fracionários');
  memDescricao.Lines.Add('    4 = Meses Fracionários');
  memDescricao.Lines.Add('e, ainda, segundo a OpcaoDeficiente, que pode ter os valores:');
  memDescricao.Lines.Add('    0 ou Nada = Indiferente');
  memDescricao.Lines.Add('    1 = Apenas Deficientes');
  memDescricao.Lines.Add('    2 = Apenas Não Deficientes');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%QTDEDEPEN(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOutlookBar1OutlookList2Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Recupera o valor de uma expressão que foi salva na mesma Forma, ');
  memDescricao.Lines.Add('através da função SALVA.');
  memDescricao.Lines.Add('Particularmente útil quando mais de um registro será processado. ');
  memDescricao.Lines.Add('(Referir-se às funções Registro Atual e Total de Registros)');
  memDescricao.Lines.Add('Para uso com o mesmo registro sendo processado, extremo cuidado');
  memDescricao.Lines.Add('deve ser tomado, para garantir que SALVA precede RECUPERA.');
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%RECUPERA()';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcLstNumerosItems16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Permite inserir observações ao final da Forma de Cálculo,');
  memDescricao.Lines.Add('pois tudo o que sucede o símbolo & é ignorado por esta.');

  dbedExpressao.Text := dbedExpressao.Text + ' & Observações: ';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
end;

procedure TfrmCadFormula.fcOpcoesEspeciaisItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('AVALIACAO(' +Translate('Data')+ '; ' +Translate('Tipo')+ ')');
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add(Translate('Retorna a avaliação mais recente obtida pela pessoa, em relação à data'));
  memDescricao.Lines.Add(Translate('  DATA = Data de referência'));
  memDescricao.Lines.Add(Translate('  TIPO = Código do Tipo de Avaliação'));
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%AVALIACAO(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOpcoesEspeciaisItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('QUANTPESS(' +Translate('Empresa')+ '; ' +
    Translate('Estab')+ '; ' +Translate('Cargo')+ '; ' +Translate('CCusto')+ '; ' +
    Translate('TipoSituacao') +')');
  memDescricao.Lines.Add('');

  memDescricao.Lines.Add(Translate('Retorna a quantidade Total de Pessoas, conforme abaixo:'));
  memDescricao.Lines.Add(Translate('  EMPRESA = Código da Empresa'));
  memDescricao.Lines.Add(Translate('  ESTAB = Código do Estabelecimento'));
  memDescricao.Lines.Add(Translate('  CARGO = Código do Cargo'));
  memDescricao.Lines.Add(Translate('  CCUSTO = Código do Centro de Custo'));
  memDescricao.Lines.Add(Translate('  TIPOSITUACAO = Tipo de Situações a Considerar (deve ser 0 ou 1)'));
  memDescricao.Lines.Add(Translate('    Se 0 (zero) - Somente Ativos.'));
  memDescricao.Lines.Add(Translate('    Se 1 (um)   - Ativos e Afastados.'));
  memDescricao.Lines.Add(Translate('OBS:'));
  memDescricao.Lines.Add(Translate('  Os 4 primeiros parâmetros podem conter uma indicação genérica, que significa TODOS (-1).'));
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%QUANTPESS(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOpcoesEspeciaisItems2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('SALARIOTOTAL(' +Translate('Empresa')+ '; ' +
    Translate('Estab')+ '; ' +Translate('Cargo')+ '; ' +Translate('CCusto')+ '; ' +
    Translate('TipoSituacao') +')');
  memDescricao.Lines.Add('');

  memDescricao.Lines.Add(Translate('Retorna a soma dos salários das Pessoas, conforme abaixo:'));
  memDescricao.Lines.Add(Translate('  EMPRESA = Código da Empresa'));
  memDescricao.Lines.Add(Translate('  ESTAB = Código do Estabelecimento'));
  memDescricao.Lines.Add(Translate('  CARGO = Código do Cargo'));
  memDescricao.Lines.Add(Translate('  CCUSTO = Código do Centro de Custo'));
  memDescricao.Lines.Add(Translate('  TIPOSITUACAO = Tipo de Situações a Considerar (deve ser 0 ou 1)'));
  memDescricao.Lines.Add(Translate('    Se 0 (zero) - Somente Ativos.'));
  memDescricao.Lines.Add(Translate('    Se 1 (um)   - Ativos e Afastados.'));
  memDescricao.Lines.Add(Translate('OBS:'));
  memDescricao.Lines.Add(Translate('  Os 4 primeiros parâmetros podem conter uma indicação genérica, que significa TODOS (-1).'));
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%SALARIOTOTAL(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);
end;

procedure TfrmCadFormula.fcOpcoesEspeciaisItems3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  memDescricao.Lines.Clear;
  memDescricao.Lines.Add('CONTRIBPREV(' +Translate('Contribuição')+ '; ' +
    Translate('Indicador do Valor Base') +')');
  memDescricao.Lines.Add('');

  memDescricao.Lines.Add(Translate('Retorna o conteúdo do Valor Base, conforme abaixo:'));
  memDescricao.Lines.Add(Translate('  Contribuição = Código da Contribuição Desejada'));
  memDescricao.Lines.Add(Translate('  Indicador do Valor Base Desejado = 1, 2 ou 3'));
  memDescricao.Lines.Add('');
  memDescricao.Lines.Add('Exemplo: F%CONTRIBPREV(1, 1)');
  memDescricao.Lines.Add(Translate('Retorna o conteúdo do Valor Base 1 da Contribuição de código = 1'));
  memDescricao.SelStart := 1;
  memDescricao.SelLength := -1;

  dbedExpressao.Text := dbedExpressao.Text + 'F%CONTRIBPREV(';
  Cds.FieldByName('DESCRICAOREGRA').asString := dbedExpressao.Text;
  Inc(iNumParenteses);

end;

procedure TfrmCadFormula.sbtnProcurarExpressaoClick(Sender: TObject);
begin
  bbtnConfirmar.Default := false;
  bbtnProcExpressao.Default := true;

  bbtnCancelar.Cancel := false;
  bbtnFecharExpressao.Cancel := true;

  townProcExpressao.Top := Self.Top + 220;
  townProcExpressao.Left := Self.Left + 124;
  townProcExpressao.BringToFront;
  townProcExpressao.Visible := true;
  Self.Enabled := false;
  edExpressao.SetFocus;
end;

procedure TfrmCadFormula.bbtnProcExpressaoClick(Sender: TObject);
begin
  if (Trim(edExpressao.Text) = '') then
  begin
    MsgDlg('A expressão deve ser informada para que a procura seja efetuada.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    edExpressao.SetFocus;
  end
  else
    CdsProcExpressao.Data := CtrlCadRegra.ListFormaCalcExpressao(UpperCase(edExpressao.Text));
end;

procedure TfrmCadFormula.bbtnOkExpressaoClick(Sender: TObject);
begin
  FecharProcExpressao;
  if not(CdsProcExpressao.IsEmpty) then
    Sel(CdsProcExpressao.FieldByName('IDREGRA').asFloat);
end;

procedure TfrmCadFormula.bbtnFecharExpressaoClick(Sender: TObject);
begin
  FecharProcExpressao;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

function TfrmCadFormula.PosCharEsp(Dado: string): LongInt;
var
  c, Tam: LongInt;
begin
  Result := 0;
  Tam := Length(Dado);

  for c:=Tam DownTo 1 do
  begin
    if (Copy(Dado,c,1) = ',') or (Copy(Dado,c,1) = ')') or (Copy(Dado,c,1) = '(') or
       (Copy(Dado,c,1) = '[') or (Copy(Dado,c,1) = ']') or (Copy(Dado,c,1) = '}') or
       (Copy(Dado,c,1) = '/') or (Copy(Dado,c,1) = '*') or (Copy(Dado,c,1) = '+') or
       (Copy(Dado,c,1) = '-') or (Copy(Dado,c,1) = '{') or (Copy(Dado,c,1) = '"') then
    begin
      Result := c;
      break
    end;
  end;
end;

procedure TfrmCadFormula.Sel(IdRegra: double);
begin
  Cds.Data := CtrlCadRegra.ListRegra(IdRegra);
end;

function TfrmCadFormula.GravarRegistro: boolean;
begin
  Result := CtrlCadRegra.GravarRegra;
  if not(Result) then
    raise exception.Create(CtrlCadRegra.MessageInfo);
end;

procedure TfrmCadFormula.FecharProcExpressao;
begin
  bbtnConfirmar.Default := true;
  bbtnProcExpressao.Default := false;

  bbtnCancelar.Cancel := true;
  bbtnFecharExpressao.Cancel := false;

  Self.Enabled := true;
  sbtnProcurarExpressao.Down := false;
  townProcExpressao.Visible := false;
end;

procedure TfrmCadFormula.bbtnEnviarConteudoClick(Sender: TObject);
begin
  inherited;
  JclSimpleSendMail(Sistema.EmailOnError, '',
    Translate('Forma de Cálculo: ') + Trim(dbedDescr.Text),
    Trim(dbedExpressao.Text));
end;

procedure TfrmCadFormula.FormResize(Sender: TObject);
begin
  inherited;
  dblckGrupo.Width := (Panel2.Width - dblckGrupo.Left + 1 - 8);
  sbtnCampos.Left := (Panel2.Width - sbtnCampos.Width + 1 - 8);
  dbedExpressao.Width := (Panel2.Width - dbedExpressao.Left + 1 - 8);
end;

end.
