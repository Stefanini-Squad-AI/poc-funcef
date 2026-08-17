unit fParamMapaResumoTrein2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmParamReport,
  fParamReports_Padrao, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, CheckLst, wwdbdatetimepicker, CMDateTimePicker, Db, DBClient, wwdblook,
  uCMClientDataSet, uCtrlCurso, uCtrlHistPessoa, uCtrlPpraCipa, ColorCheckListBox,
  uCtrlGrpTrein;

type
  TfrmParamMapaResumoTrein2 = class(TfrmParamReports_Padrao)
    CdsEntid: TCMClientDataSet;
    CdsCurso: TCMClientDataSet;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxSelCursos: TGroupBox;
    cbxRealProgr: TCheckBox;
    cbxRealNaoProgr: TCheckBox;
    cbxNaoRealProgr: TCheckBox;
    gbxCursos: TGroupBox;
    chklstCurso: TColorCheckListBox;
    bbtnSelTodosCurso: TBitBtn;
    bbtnInverteSelCurso: TBitBtn;
    rgTipoCusto: TRadioGroup;
    gbxEntid: TGroupBox;
    chklstEntid: TColorCheckListBox;
    bbtnSelTodasEntid: TBitBtn;
    bbtnInverteSelEntid: TBitBtn;
    gbxEmpre: TGroupBox;
    chklstEmpre: TColorCheckListBox;
    bbtnSelTodasEmpre: TBitBtn;
    bbtnInverteSelEmpre: TBitBtn;
    CdsEmpresa: TCMClientDataSet;
    gbxConsolida: TGroupBox;
    rgConsolida: TRadioGroup;
    dblcEmpresa: TwwDBLookupCombo;
    rgTipoPessoa: TRadioGroup;
    CdsGrupo: TCMClientDataSet;
    gbxGrupoCargo: TGroupBox;
    dblcGrupoCargo: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgConsolidaClick(Sender: TObject);
    procedure bbtnSelTodasEmpreClick(Sender: TObject);
    procedure bbtnInverteSelEmpreClick(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);
  private
    CtrlCurso: TCtrlCurso;
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlPpraCipa: TCtrlPpraCipa;
    CtrlGrpTrein: TCtrlGrpTrein;

    ListaIdCurso, ListaIdEntid, ListaIdEmpre: TStringList;

    sEmpre, sCurso, sEntid: string;
  end;

var
  frmParamMapaResumoTrein2: TfrmParamMapaResumoTrein2;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, uMensErro;

{$R *.DFM}

procedure TfrmParamMapaResumoTrein2.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlPpraCipa := TCtrlPpraCipa.Create;
  CtrlPpraCipa.InitializeAs(Padroes);

  ListaIdCurso := TStringList.Create;
  ListaIdEntid := TStringList.Create;
  ListaIdEmpre := TStringList.Create;

  CtrlGrpTrein := TCtrlGrpTrein.Create;
  CtrlGrpTrein.InitializeAs(Padroes);
  CdsGrupo.Data := CtrlGrpTrein.ListGrpTrein;

  // Preenche ChkList dos Cursos
  CdsCurso.Data := CtrlCurso.ListGeral;
  chklstCurso.Items.Clear;
  while not(CdsCurso.EOF) do
  begin
    ListaIdCurso.Add(CdsCurso.FieldByName('IDCURSO').asString);
    chklstCurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
    CdsCurso.Next;
  end;

  // Preenche ChkList das Entidades
  CdsEntid.Data := CtrlHistPessoa.ListEntidadeTreinamento;
  chklstEntid.Items.Clear;
  while not(CdsEntid.EOF) do
  begin
    ListaIdEntid.Add(CdsEntid.FieldByName('IDPESSOA').asString);
    chklstEntid.Items.Add(CdsEntid.FieldByName('NOME').asString);
    CdsEntid.Next;
  end;

  // Preenche ChkList das Empresas Prop.
  CdsEmpresa.Data := CtrlPpraCipa.ListEmpresaProp;
  chklstEmpre.Items.Clear;
  while not(CdsEmpresa.EOF) do
  begin
    ListaIdEmpre.Add(CdsEmpresa.FieldByName('IDPESSOA').asString);
    chklstEmpre.Items.Add(CdsEmpresa.FieldByName('NOME').asString);
    CdsEmpresa.Next;
  end;
  CdsEmpresa.First;
  dblcEmpresa.LookupValue := CdsEmpresa.FieldByName('IDPESSOA').asString;
  dblcEmpresa.Repaint;

  edData1.Date := Date - 365;
  edData2.Date := Date;
end;

procedure TfrmParamMapaResumoTrein2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlHistPessoa);
  FreeAndNil(CtrlCurso);
  FreeAndNil(ListaIdCurso);
  FreeAndNil(ListaIdEntid);
  FreeAndNil(ListaIdEmpre);
  FreeAndNil(CtrlGrpTrein);
end;

procedure TfrmParamMapaResumoTrein2.rgConsolidaClick(Sender: TObject);
begin
  dblcEmpresa.Visible := (rgConsolida.ItemIndex = 0);
end;

procedure TfrmParamMapaResumoTrein2.bbtnSelTodasEmpreClick(Sender: TObject);
var
  c: integer;
  chklst: TColorCheckListBox;
begin
  if (TComponent(Sender).Name = 'bbtnSelTodasEmpre') then
    chklst := chklstEmpre
  else
  if (TComponent(Sender).Name = 'bbtnSelTodosCurso') then
    chklst := chklstCurso
  else
    chklst := chklstEntid;

  for c:=0 to chklst.Items.Count-1 do
    chklst.Checked[c] := true;
  chklst.Repaint;
end;

procedure TfrmParamMapaResumoTrein2.bbtnInverteSelEmpreClick(Sender: TObject);
var
  c: integer;
  chklst: TColorCheckListBox;
begin
  if (TComponent(Sender).Name = 'bbtnInverteSelEmpre') then
    chklst := chklstEmpre
  else
  if (TComponent(Sender).Name = 'bbtnInverteSelCurso') then
    chklst := chklstCurso
  else
    chklst := chklstEntid;

  for c:=0 to chklst.Items.Count-1 do
    chklst.Checked[c] := not(chklst.Checked[c]);
  chklst.Repaint;
end;

procedure TfrmParamMapaResumoTrein2.bbtnConfirmarClick(Sender: TObject);
begin
  if (gbxGrupoCargo.Visible) and (dblcGrupoCargo.Text = '') then
  begin
      MsgDlg('Escolha o Grupo de Cargos para Candidatos.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dblcGrupoCargo.SetFocus;
      ModalResult := mrNone;
      exit;
  end;

  inherited;
  FU.CriaListaOpcoes(chklstCurso, ListaIdCurso, sCurso, ',', false);
  FU.CriaListaOpcoes(chklstEntid, ListaIdEntid, sEntid, ',', false);
  FU.CriaListaOpcoes(chklstEmpre, ListaIdEmpre, sEmpre, ',', false);

  Cmp_Padrao.ParamByName('ListaCurso').asString := sCurso;
  Cmp_Padrao.ParamByName('ListaEntid').asString := sEntid;
  Cmp_Padrao.ParamByName('ListaEmpre').asString := sEmpre;
  Cmp_Padrao.ParamByName('NomeEmpre').asString := dblcEmpresa.Text;
  Cmp_Padrao.ParamByName('DataIni').asDateTime := EdData1.Date;
  Cmp_Padrao.ParamByName('DataFim').asDateTime := EdData2.Date;
  Cmp_Padrao.ParamByName('TipoCusto').asInteger := rgTipoCusto.ItemIndex;
  Cmp_Padrao.ParamByName('Consolida').asInteger := rgConsolida.ItemIndex;
  Cmp_Padrao.ParamByName('TipoPessoa').asInteger := rgTipoPessoa.ItemIndex;
  Cmp_Padrao.ParamByName('SelCurso1').asBoolean := cbxRealProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso2').asBoolean := cbxRealNaoProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso3').asBoolean := cbxNaoRealProgr.Checked;
  Cmp_Padrao.ParamByName('SelCurso4').asBoolean := False;
  Cmp_Padrao.ParamByName('DescGrupoCand').asString := CdsGrupo.FieldByName('DESCGRPTREIN').asString;
end;

procedure TfrmParamMapaResumoTrein2.rgTipoPessoaClick(Sender: TObject);
begin
  inherited;
  gbxGrupoCargo.Visible := rgTipoPessoa.ItemIndex > 0;
end;

end.
