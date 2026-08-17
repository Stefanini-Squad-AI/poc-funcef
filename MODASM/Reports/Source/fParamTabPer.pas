unit fParamTabPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db,
  ExtCtrls, DBTables, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  CheckLst, fParamReports_Padrao, CmParamReport, uCtrlTipOcMed,
  ColorCheckListBox;

type
  TfrmParamTabPer = class(TfrmParamReports_Padrao)
    gbxOcorr: TGroupBox;
    rgOrderBy: TRadioGroup;
    chklstTipoOcorr: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlTipOcMed: TCtrlTipOcMed;

    ListaCodTipOcMed: TStringList;
    
    procedure CriarListaTipoOcMed;
  end;

var
  frmParamTabPer: TfrmParamTabPer;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TfrmParamTabPer.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  ListaCodTipOcMed := TStringList.Create;

  // Criar lista de Tipos de Ocorrência a selecionar
  CriarListaTipoOcMed;
end;

procedure TfrmParamTabPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(ListaCodTipOcMed);
  inherited;
end;

procedure TfrmParamTabPer.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamTabPer.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamTabPer.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodTipOcMedSel: string;
  iNumOcorr, c: integer;
begin
  inherited;
  // Ocorrências selecionadas
  iNumOcorr:=0;
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    if (chklstTipoOcorr.Checked[c]) then
      Inc(iNumOcorr);

  if (iNumOcorr < chklstTipoOcorr.Items.Count) then
    FU.CriaListaOpcoes(chklstTipoOcorr, ListaCodTipOcMed, sListaCodTipOcMedSel, ',', false)
  else
    sListaCodTipOcMedSel := '';

  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('ListaCodTipOcMed').asString := sListaCodTipOcMedSel;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := rgOrderBy.ItemIndex;

  frmAguarde.Mostra('Periodicidades dos Exames');
  frmAguarde.Pos := 0;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmParamTabPer.CriarListaTipoOcMed;
begin
  dmCds.Cds.Data := CtrlTipOcMed.ListTipoOcorrenciaMedComPeriodicidade;
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodTipOcMed.Add(dmCds.Cds.FieldByName('CODTIPOOCMED').asString);
    chklstTipoOcorr.Items.Add(dmCds.Cds.FieldByName('DESCRTIPOOCMED').asString);
    dmCds.Cds.Next;
  end;
end;

end.
