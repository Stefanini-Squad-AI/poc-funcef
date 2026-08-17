unit fParamProgTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlTipOcMed,
  ColorCheckListBox;

type
  TfrmParamProgTipo = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxOcorr: TGroupBox;
    chklstTipoOcorr: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    rgPrograma: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgSelPeriodo: TRadioGroup;
    CdsTipoOcorr: TCMClientDataSet;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgSelPeriodoClick(Sender: TObject);
  private
    CtrlTipOcMed: TCtrlTipOcMed;
    
    ListaCodTipOcMed: TStringList;

    procedure CriarListaTipoOcMed;
  end;

var
  frmParamProgTipo: TfrmParamProgTipo;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TfrmParamProgTipo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  ListaCodTipOcMed := TStringList.Create;

  // Criar lista de Tipos de Ocorrência a selecionar
  CriarListaTipoOcMed;

  edData1.Date := (Date);
  edData2.Date := (Date + 30);

  cmbSeqRel.ItemIndex := 0;
end;

procedure TfrmParamProgTipo.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamProgTipo.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamProgTipo.rgSelPeriodoClick(Sender: TObject);
begin
  gbxFaixaData.Visible := (rgSelPeriodo.ItemIndex = 0);
end;

procedure TfrmParamProgTipo.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel, sListaCodTipOcMedSel: string;
begin
  frmAguarde.Mostra('Programação de Testes / Exames por Tipo');
  frmAguarde.Pos := 0;
  inherited;
  FU.CriaListaOpcoes(chklstTipoOcorr, ListaCodTipOcMed, sListaCodTipOcMedSel, ',', false);

  sListaIdFuncSel := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFuncSel = '') then
      sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaTipoOcorr').asString := sListaCodTipOcMedSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('CriaPrograma').asInteger := rgPrograma.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;

  if (rgSelPeriodo.ItemIndex = 0) then
  begin
    Cmp_Padrao.ParamByName('DataIni').asString := edData1.Text;
    Cmp_Padrao.ParamByName('DataFim').asString := edData2.Text;
  end
  else
  begin
    Cmp_Padrao.ParamByName('DataIni').asString := '';
    Cmp_Padrao.ParamByName('DataFim').asString := '';
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmParamProgTipo.CriarListaTipoOcMed;
begin
  CdsTipoOcorr.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;
  while not(CdsTipoOcorr.EOF) do
  begin
    ListaCodTipOcMed.Add(CdsTipoOcorr.FieldByName('CODTIPOOCMED').asString);
    chklstTipoOcorr.Items.Add(CdsTipoOcorr.FieldByName('DESCRTIPOOCMED').asString);
    CdsTipoOcorr.Next;
  end;
end;

end.
