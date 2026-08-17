unit fRateioDespesas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSelProcessoCons, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, Spin, wwdbdatetimepicker, CMDateTimePicker,
  TEdNum, ExtCtrls, ComCtrls, TREdit, CMProcuraSubTipo, CheckLst, uCtrlPeriodo,
  ColorCheckListBox, uCtrlProcessoTrab, uCtrlGlobalRH, uCtrlListTerceirosRH,
  uCtrlEtapaProcesso;

type
  TfrmRateioDespesas = class(TfrmSelProcessoCons)
    tbshRateio: TTabSheet;
    Label7: TLabel;
    redValor: TRealEdit;
    CdsTipoDesemb: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    PageControlRateio: TPageControl;
    tbshSelecao: TTabSheet;
    tbshCAP: TTabSheet;
    gbxCAP: TGroupBox;
    Label47: TLabel;
    Label46: TLabel;
    dblckTipoDoc: TwwDBLookupCombo;
    dtPagamento: TCMDateTimePicker;
    gbxContabilizacao: TGroupBox;
    dblckTipOper: TwwDBLookupCombo;
    gbkTipoDesemb: TGroupBox;
    dblckTipoDesemb: TwwDBLookupCombo;
    cmprocFonecedor: TCMProcuraForCli;
    chklstProcesso: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    bbtnGerarCAP: TBitBtn;
    bbtnRatear: TBitBtn;
    dblcEtapaRateio: TwwDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    edDataRateio: TCMDateTimePicker;
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure HabilitaBtOk;
    procedure HabilitaBtCAP;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure redValorChange(Sender: TObject);
    procedure bbtnRatearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblckTipoDesembCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblckTipOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmprocFonecedorExit(Sender: TObject);
    procedure dtPagamentoExit(Sender: TObject);
    procedure dblckTipoDocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnGerarCAPClick(Sender: TObject);
    procedure tbshRateioShow(Sender: TObject);
    procedure edDataRateioChange(Sender: TObject);
  private
    { Private declarations }
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
    CtrlPeriodo: TCtrlPeriodo;
    ListaNumProcesso: TStringList;
    sListaProcesso: String;
    IdPatro, IdPlanoPrev: integer;
    bFazCAP, bFazContab: boolean;
    function CompStr(a:string; Tam:integer; Letra:char; Direcao:boolean): string;
  public
    { Public declarations }
  end;

var
  frmRateioDespesas: TfrmRateioDespesas;

implementation

{$R *.DFM}

uses uMensErro, uCtrlFuncoesRH, uSistema, uCtrlUsoGeralRH, uCtrlPadroes, dCds,
     uCtrlParamIntegra, fAguarde;

procedure TfrmRateioDespesas.FormCreate(Sender: TObject);
begin
  inherited;
  ListaNumProcesso := TStringList.Create;

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlEtapaProcesso.InitializeAs(Padroes);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT');

  // Integração com o CAP
  bFazCAP := (dmCds.Cds.FieldByName('FLGINTEGRACAP').asInteger = 1);
  gbxCAP.Visible := bFazCAP;

  if (bFazCAP) then
    CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');

  // Integração com a Contabilidade
  bFazContab := (dmCds.Cds.FieldByName('FLGINTEGRACONT').asInteger = 1) and
    (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));
  gbxContabilizacao.Visible := bFazContab;
  cmprocFonecedor.Visible := bFazCAP;

  if (bFazContab) then
  begin
    // Pega o ID da Patrocinadora e do Plano Previdenciário
    if (Sistema.UsaPlanoPatro) then
    begin
      IdPatro := CtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);
      IdPlanoPrev := CtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
    end
    else
    begin
      IdPatro := -1;
      IdPlanoPrev := -1;
    end;

    CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacao;
  end;

  tbshCAP.TabVisible := (bFazCAP) or (bFazContab);

  if (bFazCAP) or (bFazContab) then
  begin
    CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(Sistema.IdEmpresa, 'P', true);

    CtrlEtapaProcesso.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
      Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
      ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
      ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
  end;

  if (not bFazCAP) and (bFazContab) then
    bbtnGerarCAP.Caption := '&Gerar Contabilização';
end;

procedure TfrmRateioDespesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaNumProcesso.Free;
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlEtapaProcesso);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlListTerceirosRH);
end;

procedure TfrmRateioDespesas.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProcesso.Items.Count-1 do
    chklstProcesso.Checked[c] := true;
  chklstProcesso.Repaint;
  HabilitaBtOk;
end;

procedure TfrmRateioDespesas.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProcesso.Items.Count-1 do
    chklstProcesso.Checked[c] := not(chklstProcesso.Checked[c]);
  chklstProcesso.Repaint;
  HabilitaBtOk;
end;

procedure TfrmRateioDespesas.HabilitaBtOk;
begin
  bbtnRatear.Enabled := (chklstProcesso.Items.Count * redValor.Value > 0) and (edDataRateio.Text <> ''); //Renan Cristiano SOL 131242 Kintana 745290.
  bbtnSelTodosFunc.Enabled := chklstProcesso.Items.Count > 0;
  bbtnInverteSelFunc.Enabled := chklstProcesso.Items.Count  > 0;
end;

procedure TfrmRateioDespesas.HabilitaBtCAP;
begin
  bbtnGerarCAP.Enabled := (redValor.Value > 0) and
    (((bFazCAP) and (dblckTipoDesemb.Text <> '') and (cmprocFonecedor.Text <> '') and
      (dtPagamento.Text <> '') and (dblckTipoDoc.Text <> '')) or
     ((bFazContab) and (dblckTipoDesemb.Text <> '') and (dblckTipOper.Text <> '')));
end;

procedure TfrmRateioDespesas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  chklstProcesso.Clear;
  ListaNumProcesso.Clear;
  CdsProcesso.First;
  while not CdsProcesso.Eof do
  begin
    if CdsProcesso.FieldByName('NOME').AsString <> '' then
    begin
      chklstProcesso.Items.Add(CompStr(CdsProcesso.FieldByName('PROCJCJNUM').AsString,20,' ',false) + ' ' +
                               CompStr(CdsProcesso.FieldByName('NOME').AsString,40,' ',false) + ' ' +
                               CompStr(CdsProcesso.FieldByName('NOMEVARA').AsString,30,' ',false));
      ListaNumProcesso.Add(CdsProcesso.FieldByName('NUMPROCTRAB').AsString);
    end;
    CdsProcesso.Next;
  end;
  CdsProcesso.First;
  bbtnOutraVezClick(Self);
  bbtnSelTodosFuncClick(Self);
  pgctrlPrincipal.ActivePageIndex := 4;
  PageControlRateio.ActivePageIndex := 0;
  HabilitaBtOk;
end;

function TfrmRateioDespesas.CompStr(a:string; Tam:integer; Letra:char; Direcao:boolean): string;
var
  i: integer;
  b: string;
begin
  b := '';
  if (Tam < Length(a)) then
    a := Copy(a, 1, Tam);

  if (Tam > Length(a)) then
    for i:=1 to Abs(Tam - Length(a)) do
      b := b + Letra;

  if (Direcao) then
    b := b + a
  else
    b := a + b;

  Result := b;
end;

procedure TfrmRateioDespesas.redValorChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
  HabilitaBtCAP;
end;

procedure TfrmRateioDespesas.bbtnRatearClick(Sender: TObject);
var
  wNum: word;
  dValor: double;
begin
  inherited;
  wNum := FU.CriaListaOpcoes(chklstProcesso, ListaNumProcesso, sListaProcesso, ',', false);
  if (wNum = 0) then
  begin
    MsgDlg('Selecione Pelo Menos 1 Processo', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    chklstProcesso.SetFocus;
    exit;
  end;
  dValor := round(redValor.Value / wNum * 100) / 100;

  if CtrlProcessoTrab.RatearDespesas(dValor, CdsEtapa.FieldByName('CODTIPORECURSO').asFloat,
       sListaProcesso, strToDate(edDataRateio.Text)) then
    MsgDlg('Rateio efetuado: '+FloatToStr(dValor)+' para cada um dos '+IntToStr(wNum)+
         ' Processos Selecionados.', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
  else
    MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

end;

procedure TfrmRateioDespesas.dblckTipoDesembCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  HabilitaBtCAP;
end;

procedure TfrmRateioDespesas.dblckTipOperCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  HabilitaBtCAP;
end;

procedure TfrmRateioDespesas.cmprocFonecedorExit(Sender: TObject);
begin
  inherited;
  HabilitaBtCAP;
end;

procedure TfrmRateioDespesas.dtPagamentoExit(Sender: TObject);
begin
  inherited;
  HabilitaBtCAP;
end;

procedure TfrmRateioDespesas.dblckTipoDocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  HabilitaBtCAP;
end;

procedure TfrmRateioDespesas.bbtnGerarCAPClick(Sender: TObject);
var
  bOk: boolean;
  iCodTipDoc: integer;
  sTipCodigo: string;
begin
  inherited;
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Fazendo Integração...');

  if (bFazCAP) then
    iCodTipDoc := CdsTipoDoc.FieldByName('CODTIPDOC').asInteger
  else
    iCodTipDoc := 0;

  if (bFazContab) then
    sTipCodigo := CdsTipoOper.FieldByName('TIPCODIGO').asString
  else
    sTipCodigo := '';

  bOk := CtrlEtapaProcesso.GerarIntegracaoRateioDespesas(
    bFazCAP, bFazContab, Date, dtPagamento.Date, cmprocFonecedor.ForCliReg.Id,
    IdPlanoPrev, IdPatro, CdsTipoDesemb.FieldByName('PLACONTA').asString,
    CdsTipoDesemb.FieldByName('PLANO').asInteger,
    CdsTipoDesemb.FieldByName('PLACONTACREDITO').asString,
    sTipCodigo, CdsTipoDesemb.FieldByName('CODTIPRECDES').asString, iCodTipDoc,
    'Rateio de Despesas Judiciais e Administrativas', redValor.Value);

  frmAguarde.Apaga;
  frmAguarde.pbAguarde.Visible := true;

  if (bOk) then
    MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
  else
    raise Exception.Create(CtrlEtapaProcesso.MessageInfo);

end;

procedure TfrmRateioDespesas.tbshRateioShow(Sender: TObject);
begin
  inherited;
  //-- Renan Cristiano SOL 131242 Kintana 745290 Início.
  edDataRateio.SetFocus;
  if Trim(dblcEtapaRateio.Text) = '' then
    dblcEtapaRateio.Text := 'Despesas Administrativas';
    dblcEtapaRateio.PerformSearch;
  //-- Renan Cristiano SOL 131242 Kintana 745290 Fim.
end;

procedure TfrmRateioDespesas.edDataRateioChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
  HabilitaBtCAP;
end;

end.
