unit fAjusteOriginal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSelProcessoCons, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, Spin, wwdbdatetimepicker, CMDateTimePicker,
  TEdNum, ExtCtrls, ComCtrls, TREdit, CMProcuraSubTipo, CheckLst, uCtrlPeriodo,
  ColorCheckListBox, uCtrlHstObjProcTrab, uCtrlGlobalRH, uCtrlListTerceirosRH,
  uCtrlEtapaProcesso;

type
  TfrmAjusteOriginal = class(TfrmSelProcessoCons)
    tbshAjusteOriginal: TTabSheet;
    CdsTipoOper: TCMClientDataSet;
    PageControlRateio: TPageControl;
    tbshSelecao: TTabSheet;
    chklstProcesso: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    bbtnAjustar: TBitBtn;
    CdsHistObjetoGravar: TCMClientDataSet;
    gbxContabilizacao: TGroupBox;
    dblckTipOper: TwwDBLookupCombo;
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure HabilitaBtOk;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnAjustarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlHstObjProcTrab: TCtrlHstObjProcTrab;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
    CtrlPeriodo: TCtrlPeriodo;
    ListaNumProcesso: TStringList;
    sListaProcesso: String;
    IdPatro, IdPlanoPrev: integer;
    bFazContab: boolean;
    function CompStr(a:string; Tam:integer; Letra:char; Direcao:boolean): string;
  public
    { Public declarations }
  end;

var
  frmAjusteOriginal: TfrmAjusteOriginal;

implementation

{$R *.DFM}

uses uMensErro, uCtrlFuncoesRH, uSistema, uCtrlUsoGeralRH, uCtrlPadroes, dCds,
     uCtrlParamIntegra, fAguarde;

procedure TfrmAjusteOriginal.FormCreate(Sender: TObject);
begin
  inherited;
  ListaNumProcesso := TStringList.Create;

  CtrlHstObjProcTrab := TCtrlHstObjProcTrab.Create;
  CtrlHstObjProcTrab.InitializeAs(Padroes);
  CtrlHstObjProcTrab.CdsHistObjeto := CdsHistObjetoGravar;

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
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT, INDCONTABJUR');

  // Integração com a Contabilidade
  bFazContab := (dmCds.Cds.FieldByName('FLGINTEGRACONT').asInteger = 1) and
    //(dmCds.Cds.FieldByName('INDCONTABJUR').asInteger = 1) and
    (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));
  gbxContabilizacao.Visible := bFazContab;

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

  if (bFazContab) then
    CtrlEtapaProcesso.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
      Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
      ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
      ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);

end;

procedure TfrmAjusteOriginal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaNumProcesso.Free;
  FreeAndNil(CtrlHstObjProcTrab);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlEtapaProcesso);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlListTerceirosRH);
end;

procedure TfrmAjusteOriginal.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProcesso.Items.Count-1 do
    chklstProcesso.Checked[c] := true;
  chklstProcesso.Repaint;
  HabilitaBtOk;
end;

procedure TfrmAjusteOriginal.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProcesso.Items.Count-1 do
    chklstProcesso.Checked[c] := not(chklstProcesso.Checked[c]);
  chklstProcesso.Repaint;
  HabilitaBtOk;
end;

procedure TfrmAjusteOriginal.HabilitaBtOk;
begin
  bbtnAjustar.Enabled := chklstProcesso.Items.Count > 0;
  bbtnSelTodosFunc.Enabled := chklstProcesso.Items.Count > 0;
  bbtnInverteSelFunc.Enabled := chklstProcesso.Items.Count  > 0;
end;

procedure TfrmAjusteOriginal.bbtnConfirmarClick(Sender: TObject);
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

function TfrmAjusteOriginal.CompStr(a:string; Tam:integer; Letra:char; Direcao:boolean): string;
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

procedure TfrmAjusteOriginal.bbtnAjustarClick(Sender: TObject);
var
  wNum, wNum1, wNum2: word;
  dValor: double;
  IdPlanoPrev, IdPatro: integer;
  bUsaPlanoPatro: boolean;
  sTipCodigo, sQuery, sTipoSel{0=Sem IN, 1=IN, 2=NOT IN}: string;
begin
  inherited;
  wNum1 := CdsProcesso.RecordCount;

  wNum := FU.CriaListaOpcoes(chklstProcesso, ListaNumProcesso, sListaProcesso, ',', false);
  if (wNum = 0) then
  begin
    MsgDlg('Selecione Pelo Menos 1 Processo', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    chklstProcesso.SetFocus;
    exit;
  end;

  sTipoSel := '0';

  if (wNum <> wNum1) then
  begin
    if (wNum > round(0.2 * wNum1)) and (wNum < round(0.8 * wNum1)) and
       (MsgDlg('Ao Fazer uma 2ª Seleção de Processos, o Sistema'+CR_LF+
               'Utiliza um Procedimento Que Pode Ser Inconveniente'+CR_LF+
               'Caso Muitos Processos Tenham Sido (Des)Selecionados.'+CR_LF+
               'Confirma a Execução Assim Mesmo ?', 'Confirmação',
           mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
      exit;

    if (wNum > round(0.5 * wNum1)) then
    begin
      sTipoSel := '2';
      bbtnInverteSelFuncClick(Self);
      wNum2 := FU.CriaListaOpcoes(chklstProcesso, ListaNumProcesso, sListaProcesso, ',', false);
      bbtnInverteSelFuncClick(Self);
    end
    else
      sTipoSel := '1';

  end;

  if (gbxContabilizacao.Visible) and (dblckTipOper.Text = '') then
    if (MsgDlg('Tipo de Operação Não Informado. Contabilização Não Será Feita. Confirma ?', 'Confirmação',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      bFazContab := false
    else
      exit;


  // Pega o ID da Patrocinadora e do Plano Previdenciário
  if (bFazContab) then
    if (Sistema.UsaPlanoPatro) then
    begin
      bUsaPlanoPatro := true;
      IdPatro := CtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);
      IdPlanoPrev := CtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
    end
    else
    begin
      bUsaPlanoPatro := false;
      IdPatro := -1;
      IdPlanoPrev := -1;
    end;

  if (bFazContab) then
    sTipCodigo := CdsTipoOper.FieldByName('TIPCODIGO').asString
  else
    sTipCodigo := '';

  sQuery  := sqlProcesso.SQL.Text;

  if CtrlHstObjProcTrab.Ajustar(sQuery, sTipoSel, sListaProcesso, sTipCodigo, bFazContab, bUsaPlanoPatro,
    Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, IdPlanoPrev, IdPatro) then
    MsgDlg('Ajuste efetuado para '+
         FU.IFF(CtrlHstObjProcTrab.NumAjustados=0,'nenhum',IntToStr(CtrlHstObjProcTrab.NumAjustados))+
         ' dos Processos Selecionados.'+
         FU.IFF(CtrlHstObjProcTrab.PlnCodigo > 0, CR_LF+'Planilha Contábil Nº '+
           FloatToStr(CtrlHstObjProcTrab.PlnCodigo),''), 'Aviso',
         mtInformation, [mbOk,mbHelp], 0)
  else
    MsgDlg(CtrlHstObjProcTrab.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

end;

end.
