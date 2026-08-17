unit fParamReciboTerceiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  TREdit, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, ComCtrls,
  Gauges, fcLabel, DBClient, uCMClientDataSet, fParamReports_Padrao, CmParamReport,
  uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlParamReciboTerceiros, uCtrlMotivo,
  ColorCheckListBox;

type
  TfrmParamReciboTerceiros = class(TfrmParamReports_Padrao)
    pgctrlPrincipal: TPageControl;
    tbshRelatorio: TTabSheet;
    tbshCAP: TTabSheet;
    pgctrlCAP: TPageControl;
    tbshSelecaoCAP: TTabSheet;
    tbshResultCAP: TTabSheet;
    memResult: TMemo;
    Label11: TLabel;
    Label1: TLabel;
    dtPagamento: TCMDateTimePicker;
    dblkcbTipoDoc: TwwDBLookupCombo;
    chkRateioCC: TCheckBox;
    bbtnGerarCAP: TBitBtn;
    lblProcesso: TLabel;
    pbProgresso: TProgressBar;
    bvAguarde: TBevel;
    Bevel1: TBevel;
    bbtnSalvar: TBitBtn;
    svdlgDialogo: TOpenDialog;
    gbxFavorecidos: TGroupBox;
    chklstFavorecido: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxTipoPag: TGroupBox;
    chklstTipoFolha: TColorCheckListBox;
    gbxMesAnoRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    rgProcesso: TRadioGroup;
    rgImprimirAut: TRadioGroup;
    CdsTipoDoc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure dtedDataRefChange(Sender: TObject);
    procedure chklstFavorecidoClickCheck(Sender: TObject);
    procedure dblkcbTipoDocChange(Sender: TObject);
    procedure bbtnGerarCAPClick(Sender: TObject);
    procedure pgctrlPrincipalChange(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure memResultChange(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlParamReciboTerceiros: TCtrlParamReciboTerceiros;
    CtrlMotivo: TCtrlMotivo;

    ListaIdTipoFolha, ListaIdFavorecido: TStringList;

    sListaIdTipoFolhaSel, sListaIdFavorecidoSel: string;

    procedure HabilitaBtOk;
    procedure HabilitaBtGerarCAP;
    procedure Progresso(Arg: array of variant);
  end;

var
  frmParamReciboTerceiros: TfrmParamReciboTerceiros;

implementation

uses uSistema, uMensErro, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlParamIntegra,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamReciboTerceiros.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamReciboTerceiros := TCtrlParamReciboTerceiros.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamReciboTerceiros.InitializeAs(Padroes);
  CtrlParamReciboTerceiros.Progresso := Progresso;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  ListaIdFavorecido := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;

  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');

  // Lista de Favorecidos
  dmCds.Cds.Data := CtrlParamReciboTerceiros.ListFavorecidos(Sistema.IdEmpresa);
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdFavorecido.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstFavorecido.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Lista de Tipos de Folha
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);  
  dtedDataRef.Date := CtrlGlobalRH.GetNormalFim;
  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlCAP.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlParamReciboTerceiros);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaIdFavorecido);
  inherited;
end;

procedure TfrmParamReciboTerceiros.dtedDataRefChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.dblkcbTipoDocChange(Sender: TObject);
begin
  HabilitaBtGerarCAP;
end;

procedure TfrmParamReciboTerceiros.pgctrlPrincipalChange(Sender: TObject);
begin
  case (pgctrlPrincipal.ActivePageIndex) of
    0 : HabilitaBtOk;
    1 : bbtnConfirmar.Enabled := false;
  end;
end;

procedure TfrmParamReciboTerceiros.memResultChange(Sender: TObject);
begin
  bbtnSalvar.Enabled := (memResult.Lines.Count > 0);
end;

procedure TfrmParamReciboTerceiros.chklstFavorecidoClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFavorecido.Items.Count-1 do
    chklstFavorecido.Checked[c] := true;
  chklstFavorecido.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFavorecido.Items.Count-1 do
    chklstFavorecido.Checked[c] := not(chklstFavorecido.Checked[c]);
  chklstFavorecido.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.bbtnSalvarClick(Sender: TObject);
begin
  svdlgDialogo.Title := 'Escolha a Pasta para salvar o Resultado da Geração';
  svdlgDialogo.FileName := '';
  if (svdlgDialogo.Execute) then
    memResult.Lines.SaveToFile(svdlgDialogo.FileName);
end;

procedure TfrmParamReciboTerceiros.bbtnConfirmarClick(Sender: TObject);
begin
  // Favorecidos selecionados
  FU.CriaListaOpcoes(chklstFavorecido, ListaIdFavorecido, sListaIdFavorecidoSel, ',', false);

  // Tipos de Folha selecionados
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);

  Cmp_Padrao.ParamByName('DataRef').asDateTime := dtedDataRef.Date;
  Cmp_Padrao.ParamByName('Previa').asBoolean := (rgProcesso.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ListaIdFavorecido').asString := sListaIdFavorecidoSel;
  Cmp_Padrao.ParamByName('ListaIdTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('ImprimirAutorizacoes').asBoolean := (rgImprimirAut.ItemIndex = 0);
end;

procedure TfrmParamReciboTerceiros.bbtnGerarCAPClick(Sender: TObject);
begin
  // Favorecidos selecionados
  FU.CriaListaOpcoes(chklstFavorecido, ListaIdFavorecido, sListaIdFavorecidoSel, ',', false);

  // Tipos de Folha selecionados
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);

  memResult.Lines.Clear;
  pbProgresso.Position := 0;
  lblProcesso.Caption := '';
  lblProcesso.Visible := true;
  tbshSelecaoCAP.Repaint;

  CtrlParamReciboTerceiros.CreateThreadProgresso;
  if (CtrlParamReciboTerceiros.GerarIntegracaoCAP(dtedDataRef.Date, Date, dtPagamento.Date,
      Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, sListaIdTipoFolhaSel,
      sListaIdFavorecidoSel, rgProcesso.ItemIndex = 0, chkRateioCC.Checked,
      ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCrespon, ParamIntegra.PlanoPrevGlobal,
      ParamIntegra.PatroGlobal, StrToIntDef(dblkcbTipoDoc.LookupValue, -1),
      Sistema.UsaPlanoPatro)) then
  begin
    CtrlParamReciboTerceiros.FreeThreadProgresso;
    MsgDlg(CtrlParamReciboTerceiros.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end
  else
  begin
    CtrlParamReciboTerceiros.FreeThreadProgresso;
    MsgDlg(CtrlParamReciboTerceiros.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;

  pgctrlCAP.ActivePageIndex := 1;
  pbProgresso.Position := 0;
  lblProcesso.Visible := false;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamReciboTerceiros.HabilitaBtOk;
var
  c: integer;
  bSelFavorec: boolean;
begin
  // Verifica se algum Favorecido foi selecionado
  bSelFavorec := false;
  for c:=0 to chklstFavorecido.Items.Count-1 do
    if (chklstFavorecido.Checked[c]) then
    begin
      bSelFavorec := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelFavorec) and (Trim(dtedDataRef.Text) <> '');

  if (bSelFavorec) and (Trim(dtedDataRef.Text) <> '') then
    bbtnGerarCAP.Tag := 1
  else
    bbtnGerarCAP.Tag := 0;

  HabilitaBtGerarCAP;
end;

procedure TfrmParamReciboTerceiros.HabilitaBtGerarCAP;
begin
  bbtnGerarCAP.Enabled := (bbtnGerarCAP.Tag = 1) and (Trim(dblkcbTipoDoc.Text) <> '') and
    (Trim(dtPagamento.Text) <> '');
end;

procedure TfrmParamReciboTerceiros.Progresso(Arg: array of variant);
begin
  if (Arg[0] <> '') then
    lblProcesso.Caption := Arg[0];

  if (Arg[1] > 0) then
    pbProgresso.Max := Arg[1];

  if (Arg[2]) then
    pbProgresso.StepIt;

  if (Arg[3] <> '') then
    memResult.Lines.Add(Arg[3]);

  Self.Update;
end;

end.
