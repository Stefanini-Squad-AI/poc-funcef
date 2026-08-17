unit fParamReciboAdvogados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  TREdit, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, ComCtrls,
  Gauges, fcLabel, DBClient, uCMClientDataSet, fParamReports_Padrao, CmParamReport,
  uCtrlListTerceirosRH, uCtrlParamReciboAdvogados, ColorCheckListBox;

type
  TfrmParamReciboAdvogados = class(TfrmParamReports_Padrao)
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
    gbxMesAnoRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    rgImprimirAut: TRadioGroup;
    CdsTipoDoc: TCMClientDataSet;
    dblckTipoDesemb: TwwDBLookupCombo;
    Label2: TLabel;
    CdsTipoDesemb: TCMClientDataSet;
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
    CtrlParamReciboAdvogados: TCtrlParamReciboAdvogados;

    ListaIdFavorecido: TStringList;

    sListaIdTipoFolhaSel, sListaIdFavorecidoSel: string;

    procedure HabilitaBtOk;
    procedure HabilitaBtGerarCAP;
    procedure Progresso(Arg: array of variant);
  end;

var
  frmParamReciboAdvogados: TfrmParamReciboAdvogados;

implementation

uses uSistema, uMensErro, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlParamIntegra,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamReciboAdvogados.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamReciboAdvogados := TCtrlParamReciboAdvogados.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamReciboAdvogados.InitializeAs(Padroes);
  CtrlParamReciboAdvogados.Progresso := Progresso;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  ListaIdFavorecido := TStringList.Create;

  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');

  CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(Sistema.IdEmpresa, 'P', true);

  dtedDataRef.Date := Date;

  // Lista de Favorecidos
  dmCds.Cds.Data := CtrlParamReciboAdvogados.ListFavorecidos(dtedDataRef.Date);
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdFavorecido.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstFavorecido.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlCAP.ActivePageIndex := 0;

  CtrlParamReciboAdvogados.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
    Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
    ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
    ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);

  HabilitaBtOk;
end;

procedure TfrmParamReciboAdvogados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlParamReciboAdvogados);
  FreeAndNil(ListaIdFavorecido);
  inherited;
end;

procedure TfrmParamReciboAdvogados.dtedDataRefChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamReciboAdvogados.dblkcbTipoDocChange(Sender: TObject);
begin
  HabilitaBtGerarCAP;
end;

procedure TfrmParamReciboAdvogados.pgctrlPrincipalChange(Sender: TObject);
begin
  case (pgctrlPrincipal.ActivePageIndex) of
    0 : HabilitaBtOk;
    1 : bbtnConfirmar.Enabled := false;
  end;
end;

procedure TfrmParamReciboAdvogados.memResultChange(Sender: TObject);
begin
  bbtnSalvar.Enabled := (memResult.Lines.Count > 0);
end;

procedure TfrmParamReciboAdvogados.chklstFavorecidoClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamReciboAdvogados.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFavorecido.Items.Count-1 do
    chklstFavorecido.Checked[c] := true;
  chklstFavorecido.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboAdvogados.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFavorecido.Items.Count-1 do
    chklstFavorecido.Checked[c] := not(chklstFavorecido.Checked[c]);
  chklstFavorecido.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboAdvogados.bbtnSalvarClick(Sender: TObject);
begin
  svdlgDialogo.Title := 'Escolha a Pasta para salvar o Resultado da Geração';
  svdlgDialogo.FileName := '';
  if (svdlgDialogo.Execute) then
    memResult.Lines.SaveToFile(svdlgDialogo.FileName);
end;

procedure TfrmParamReciboAdvogados.bbtnConfirmarClick(Sender: TObject);
begin
  // Favorecidos selecionados
  FU.CriaListaOpcoes(chklstFavorecido, ListaIdFavorecido, sListaIdFavorecidoSel, ',', false);

  Cmp_Padrao.ParamByName('DataRef').asDateTime := dtedDataRef.Date;
  Cmp_Padrao.ParamByName('ListaIdFavorecido').asString := sListaIdFavorecidoSel;
  Cmp_Padrao.ParamByName('ImprimirAutorizacoes').asBoolean := (rgImprimirAut.ItemIndex = 0);
end;

procedure TfrmParamReciboAdvogados.bbtnGerarCAPClick(Sender: TObject);
var
  bOk: boolean;
begin
  // Favorecidos selecionados
  FU.CriaListaOpcoes(chklstFavorecido, ListaIdFavorecido, sListaIdFavorecidoSel, ',', false);

  memResult.Lines.Clear;
  pbProgresso.Position := 0;
  lblProcesso.Caption := '';
  lblProcesso.Visible := true;
  tbshSelecaoCAP.Repaint;

  CtrlParamReciboAdvogados.CreateThreadProgresso;
  bOk := CtrlParamReciboAdvogados.GerarIntegracao(
    True, False, Date, dtPagamento.Date, -1, -1,
    CdsTipoDesemb.FieldByName('PLACONTA').asString,
    CdsTipoDesemb.FieldByName('PLANO').asInteger,
    CdsTipoDesemb.FieldByName('PLACONTACREDITO').asString,
    '', CdsTipoDesemb.FieldByName('CODTIPRECDES').asString,
    CdsTipoDoc.FieldByName('CODTIPDOC').asInteger,
    sListaIdFavorecidoSel);

  if (bOk) then
  begin
    CtrlParamReciboAdvogados.FreeThreadProgresso;
    MsgDlg(CtrlParamReciboAdvogados.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end
  else
  begin
    CtrlParamReciboAdvogados.FreeThreadProgresso;
    MsgDlg(CtrlParamReciboAdvogados.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;

  pgctrlCAP.ActivePageIndex := 1;
  pbProgresso.Position := 0;
  lblProcesso.Visible := false;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamReciboAdvogados.HabilitaBtOk;
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

procedure TfrmParamReciboAdvogados.HabilitaBtGerarCAP;
begin
  bbtnGerarCAP.Enabled := (bbtnGerarCAP.Tag = 1) and (Trim(dblkcbTipoDoc.Text) <> '') and
    (Trim(dtPagamento.Text) <> '');
end;

procedure TfrmParamReciboAdvogados.Progresso(Arg: array of variant);
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
