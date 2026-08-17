unit fParamCargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, Grids,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti, IvEMulti, DBGrids,
  Wwdbigrd, Wwdbgrid, ComCtrls, fParamReports_Padrao, CmParamReport, uCtrlGrupFunc,
  ColorCheckListBox;

type
  TfrmParamCargos = class(TfrmParamReports_Padrao)
    gbxGrupoFunc: TGroupBox;
    chklstGrupoFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgImprDescr: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
  private
    ListaCodGrupoFunc: TStringList;

    CtrlGrupFunc: TCtrlGrupFunc;
  end;

var
  frmParamCargos: TfrmParamCargos;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TfrmParamCargos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);

  ListaCodGrupoFunc := TStringList.Create;

  dmCds.Cds.Data := CtrlGrupFunc.ListGrupoFunc;
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodGrupoFunc.Add(dmCds.Cds.FieldByName('CODGRPFUNC').asString);
    chklstGrupoFunc.Items.Add(dmCds.Cds.FieldByName('DESCGRPFUNC').asString);
    dmCds.Cds.Next;
  end;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamCargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrupFunc);
  FreeAndNil(ListaCodGrupoFunc);
  inherited;
end;

procedure TfrmParamCargos.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupoFunc.Items.Count-1 do
    chklstGrupoFunc.Checked[c] := true;
  chklstGrupoFunc.Repaint;
end;

procedure TfrmParamCargos.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupoFunc.Items.Count-1 do
    chklstGrupoFunc.Checked[c] := not(chklstGrupoFunc.Checked[c]);
  chklstGrupoFunc.Repaint;
end;

procedure TfrmParamCargos.bbtnConfirmarClick(Sender: TObject);
var
  sCodGrupoFuncSel: string;
begin
  // Grupos Funcionas escolhidos
  FU.CriaListaOpcoes(chklstGrupoFunc, ListaCodGrupoFunc, sCodGrupoFuncSel, ',', true);

  Cmp_Padrao.ParamByName('ListaCodGrupoFunc').asString := sCodGrupoFuncSel;
  Cmp_Padrao.ParamByName('ImprimeDescricao').asBoolean := (rgImprDescr.ItemIndex = 0);
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Listagem de Cargos');
  frmAguarde.Pos := 0;
end;

end.
