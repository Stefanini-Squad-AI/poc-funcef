unit fParamOcorrExames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Db, DBTables, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, CheckLst,
  fParamReports_Padrao, CmParamReport, uCtrlTipOcMed, ColorCheckListBox;

type
  TfrmParamOcorrExames = class(TfrmParamReports_Padrao)
    gbxOcorr: TGroupBox;
    rgOrderBy: TRadioGroup;
    chklstOcorr: TColorCheckListBox;
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
  end;

var
  frmParamOcorrExames: TfrmParamOcorrExames;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TfrmParamOcorrExames.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  ListaCodTipOcMed := TStringList.Create;

  // Crio a lista de Tipos de Ocorrência a selecionar
  dmCds.Cds.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodTipOcMed.Add(dmCds.Cds.FieldByName('CODTIPOOCMED').asString);
    chklstOcorr.Items.Add(dmCds.Cds.FieldByName('DESCRTIPOOCMED').asString);
    dmCds.Cds.Next;
  end;
end;

procedure TfrmParamOcorrExames.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(ListaCodTipOcMed);
  inherited;
end;

procedure TfrmParamOcorrExames.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstOcorr.Items.Count-1 do
    chklstOcorr.Checked[c] := true;
  chklstOcorr.Repaint;
end;

procedure TfrmParamOcorrExames.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstOcorr.Items.Count-1 do
    chklstOcorr.Checked[c] := not(chklstOcorr.Checked[c]);
  chklstOcorr.Repaint;
end;

procedure TfrmParamOcorrExames.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodTipOcMedSel: string;
  iNumOcorr, c: integer;
begin
  inherited;
  // Ocorrências selecionadas
  iNumOcorr:=0;
  for c:=0 to chklstOcorr.Items.Count-1 do
    if (chklstOcorr.Checked[c]) then
      Inc(iNumOcorr);

  if (iNumOcorr < chklstOcorr.Items.Count) then
    FU.CriaListaOpcoes(chklstOcorr, ListaCodTipOcMed, sListaCodTipOcMedSel, ',', false)
  else
    sListaCodTipOcMedSel := '';

  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('ListaCodTipOcMed').asString := sListaCodTipOcMedSel;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := rgOrderBy.ItemIndex;

  frmAguarde.Mostra('Ocorrências e Exames');
  frmAguarde.Pos := 0;
end;

end.
