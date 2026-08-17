unit fParamProgPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, ComCtrls, DBTables, CheckLst, TEdNum, uCtrlTipOcMed,
  ColorCheckListBox;

type
  TfrmParamProgPess = class(TfrmSelPessoalMT)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSelPeriodoClick(Sender: TObject);
  private
    CtrlTipOcMed: TCtrlTipOcMed;
    
    ListaCodTipOcMed: TStringList;
    
    procedure CriarListaTipoOcMed;
  end;

var
  frmParamProgPess: TfrmParamProgPess;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TfrmParamProgPess.FormCreate(Sender: TObject);
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

procedure TfrmParamProgPess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(ListaCodTipOcMed);
  inherited;
end;

procedure TfrmParamProgPess.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamProgPess.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamProgPess.rgSelPeriodoClick(Sender: TObject);
begin
  gbxFaixaData.Visible := (rgSelPeriodo.ItemIndex = 0);
end;

procedure TfrmParamProgPess.bbtnConfirmarClick(Sender: TObject);
var
  sListaTipoOcorr, sListaIdFunc: string;
begin
  frmAguarde.Mostra('Programação de Testes / Exames por Pessoa');
  frmAguarde.Pos := 0;
  inherited;
  FU.CriaListaOpcoes(chklstTipoOcorr, ListaCodTipOcMed, sListaTipoOcorr, ',', false);

  sListaIdFunc := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFunc = '') then
      sListaIdFunc := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFunc := sListaIdFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaTipoOcorr').asString := sListaTipoOcorr;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFunc;
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

procedure TfrmParamProgPess.CriarListaTipoOcMed;
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
