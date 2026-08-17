unit fParamPontoPessoa;
// Marcação de Ponto por Pessoa = 4775

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Qrctrls, quickrpt, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, CMDateTimePicker,
  CheckLst, wwdbdatetimepicker, MontaSelect, uCmSqlParams, DBClient, uCMClientDataSet,
  CmParamReport, ColorCheckListBox, Mask, IniFiles, IvEMulti, uCtrlPessoaFuncionario,
  uCtrlGlobalRH, uCtrlTipOcMed;

type
  TfrmParamPontoPessoa = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxFaixaData: TGroupBox;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    Label9: TLabel;
    CdsFunc: TCMClientDataSet;
    gbxCriterio1: TGroupBox;
    rgSelecao: TRadioGroup;
    dblckFunc: TwwDBLookupCombo;
    gbxCriterio2: TGroupBox;
    cbxNormais: TCheckBox;
    cbxHorasExtras: TCheckBox;
    cbxAtrasos: TCheckBox;
    cbxFaltas: TCheckBox;
    cbxMotivo: TCheckBox;
    cbxObserv: TCheckBox;
    gbxTolerancia: TGroupBox;
    Label10: TLabel;
    Label15: TLabel;
    ednTolEntra: TSpinEdit;
    ednTolSaida: TSpinEdit;
    cbxAbonos: TCheckBox;
    cbxFerias: TCheckBox;
    cbxFeriado: TCheckBox;
    cbxQuebaPag: TCheckBox;
    gbxMotivoAbono: TGroupBox;
    chklstMotAbono: TColorCheckListBox;
    bbtnSelTodosMotAbono: TBitBtn;
    bbtnInverteSelMotAbono: TBitBtn;
    cbxResumo: TCheckBox;
    cbxHorasTrab: TCheckBox;
    cbxSaldoBanco: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edData1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure rgSelecaoClick(Sender: TObject);
    procedure chklstMotAbonoClickCheck(Sender: TObject);
    procedure bbtnSelTodosMotAbonoClick(Sender: TObject);
    procedure bbtnInverteSelMotAbonoClick(Sender: TObject);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlTipOcMed: TCtrlTipOcMed;
    ListaIdMotAbono: TStringList;
    sListaIdMotAbono: string;
    bBancoHoras: boolean;

    ArqConfig: TIniFile;

    procedure HabilitaOpcoes(Habilita: boolean);
    procedure HabilitaBtOk;
  public
  end;

var
  frmParamPontoPessoa: TfrmParamPontoPessoa;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamPontoPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdMotAbono := TStringList.Create;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);
  dblckFunc.LookupValue := CdsFunc.FieldByName('IDPESSOA').asString;
  dblckFunc.Update;

  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('PONTOINI, PONTOFIM, FLGBANCOHORAS');
  cbxSaldoBanco.Visible := (dmCds.Cds.FieldByName('FLGBANCOHORAS').asInteger = 1);
  bBancoHoras := (dmCds.Cds.FieldByName('FLGBANCOHORAS').asInteger = 1); 
  edData1.Date := dmCds.Cds.FieldByName('PONTOINI').asDateTime;
  edData2.Date := dmCds.Cds.FieldByName('PONTOFIM').asDateTime;
  if (edData2.Date > Date) and (edData1.Date <= Date) then
    edData2.Date := Date;

  pgctrlPrincipal.ActivePage := tbshRelatorio;
  IrPaginaResult := false;

  // Montar a Lista de Motivos de Abono
  dmCds.Cds.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;
  chklstMotAbono.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdMotAbono.Add(dmCds.Cds.FieldByName('CODTIPOOCMED').asString);
    chklstMotAbono.Items.Add(dmCds.Cds.FieldByName('DESCRTIPOOCMED').asString);
    dmCds.Cds.Next;
  end;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
  cbxSaldoBanco.Checked := (bBancoHoras) and (cbxSaldoBanco.Checked);
end;

procedure TfrmParamPontoPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;
  FreeAndNil(ListaIdMotAbono);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmParamPontoPessoa.edData1Exit(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamPontoPessoa.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel: string;
  wNum: word;
begin
  frmAguarde.Mostra(fu.CMTranslate('Marcação de Ponto por Pessoa'));

  frmAguarde.Pos := 0;
  sListaIdFuncSel := '';

  if (rgSelecao.ItemIndex = 1) then
  begin
    inherited;
    while not(CdsPrincipal.EOF) do
    begin
      if (sListaIdFuncSel = '') then
        sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
      else
        sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

      CdsPrincipal.Next;
    end;
  end
  else
    sListaIdFuncSel := CdsFunc.FieldByName('IDPESSOA').asString;

  // Motivo(s) selecionad(s)
  wNum := FU.CriaListaOpcoes(chklstMotAbono, ListaIdMotAbono, sListaIdMotAbono, ',', false);
  if (wNum = ListaIdMotAbono.Count) then
    sListaIdMotAbono := '';

  Cmp_Padrao.ParamByName('ListaIdMotAbono').asString := sListaIdMotAbono;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := edData1.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := edData2.Date;
  Cmp_Padrao.ParamByName('TolEntrada').asInteger := ednTolEntra.Value;
  Cmp_Padrao.ParamByName('TolSaida').asInteger := ednTolSaida.Value;
  Cmp_Padrao.ParamByName('Normal').asBoolean := cbxNormais.Checked;
  Cmp_Padrao.ParamByName('Extra').asBoolean := cbxHorasExtras.Checked;
  Cmp_Padrao.ParamByName('Falta').asBoolean := cbxFaltas.Checked;
  Cmp_Padrao.ParamByName('Atraso').asBoolean := cbxAtrasos.Checked;
  Cmp_Padrao.ParamByName('Abono').asBoolean := cbxAbonos.Checked;
  Cmp_Padrao.ParamByName('Ferias').asBoolean := cbxFerias.Checked;
  Cmp_Padrao.ParamByName('Feriado').asBoolean := cbxFeriado.Checked;
  Cmp_Padrao.ParamByName('Motivo').asBoolean := cbxMotivo.Checked;
  Cmp_Padrao.ParamByName('Observ').asBoolean := cbxObserv.Checked;
  Cmp_Padrao.ParamByName('QuebaPag').asBoolean := cbxQuebaPag.Checked;
  Cmp_Padrao.ParamByName('Resumo').asBoolean := cbxResumo.Checked;
  Cmp_Padrao.ParamByName('HorasTrab').asBoolean := cbxHorasTrab.Checked;
  Cmp_Padrao.ParamByName('SaldoBanco').asBoolean := cbxSaldoBanco.Checked;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamPontoPessoa.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(edData1.Text) <> '') and (Trim(edData2.Text) <> '') and
    (edData1.Date <= edData2.Date) and
    ((cbxNormais.Checked) or (cbxHorasExtras.Checked) or
     (cbxFaltas.Checked) or (cbxAtrasos.Checked) or
     (cbxMotivo.Checked) or (cbxObserv.Checked));
end;

procedure TfrmParamPontoPessoa.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(FU.ArqConfig);
  ednTolEntra.Value := StrToInt(ArqConfig.ReadString('RELMARCPONTO', 'Toler1', '0'));
  ednTolSaida.Value := StrToInt(ArqConfig.ReadString('RELMARCPONTO', 'Toler2', '0'));
  cbxQuebaPag.Checked := FU.StrToBool(ArqConfig.ReadString('RELMARCPONTO', 'QuebaPag', 'False'));
  cbxResumo.Checked := FU.StrToBool(ArqConfig.ReadString('RELMARCPONTO', 'Resumo', 'True'));
  cbxHorasTrab.Checked := FU.StrToBool(ArqConfig.ReadString('RELMARCPONTO', 'HorasTrab', 'True'));
  cbxSaldoBanco.Checked := FU.StrToBool(ArqConfig.ReadString('RELMARCPONTO', 'SaldoBanco', 'True'));
end;

procedure TfrmParamPontoPessoa.GravaAlteracoes;
begin
  // Grava as últimas alterações da Opção de Rubricas
  ArqConfig.WriteString('RELMARCPONTO', 'Toler1', IntToStr(ednTolEntra.Value));
  ArqConfig.WriteString('RELMARCPONTO', 'Toler2', IntToStr(ednTolSaida.Value));
  ArqConfig.WriteString('RELMARCPONTO', 'QuebaPag', FU.BoolToStr(cbxQuebaPag.Checked,True));
  ArqConfig.WriteString('RELMARCPONTO', 'Resumo', FU.BoolToStr(cbxResumo.Checked,True));
  ArqConfig.WriteString('RELMARCPONTO', 'HorasTrab', FU.BoolToStr(cbxHorasTrab.Checked,True));
  ArqConfig.WriteString('RELMARCPONTO', 'SaldoBanco', FU.BoolToStr(cbxSaldoBanco.Checked,True));
end;

procedure TfrmParamPontoPessoa.HabilitaOpcoes(Habilita: boolean);
begin
  tsDadosFunc.TabVisible := Habilita;
  tsDadosPess.TabVisible := Habilita;
  tsDadosOutros.TabVisible := Habilita;
  tbsDemit.TabVisible := Habilita;
end;

procedure TfrmParamPontoPessoa.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  cbxQuebaPag.Visible := (rgSelecao.ItemIndex = 1);
  dblckFunc.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(dblckFunc.Visible));
  HabilitaBtOk;
end;

procedure TfrmParamPontoPessoa.chklstMotAbonoClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstMotAbono, ListaIdMotAbono, sListaIdMotAbono, ',', false);
  //HabilitaBtOk;
end;

procedure TfrmParamPontoPessoa.bbtnSelTodosMotAbonoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstMotAbono.Items.Count-1 do
    chklstMotAbono.Checked[c] := true;
  chklstMotAbono.Repaint;
  chklstMotAbonoClickCheck(Sender);
end;

procedure TfrmParamPontoPessoa.bbtnInverteSelMotAbonoClick(
  Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstMotAbono.Items.Count-1 do
    chklstMotAbono.Checked[c] := not(chklstMotAbono.Checked[c]);
  chklstMotAbono.Repaint;
  chklstMotAbonoClickCheck(Sender);
end;

end.
