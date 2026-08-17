unit fParamTabCursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, Wwdatsrc,
  DBTables, CheckLst, fParamReports_Padrao, CmParamReport, uCtrlGrpTrein, ColorCheckListBox;

type
  TfrmParamTabCursos = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    chklstGrupos: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    rgOrderBy: TRadioGroup;
    rgImprObs: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
  private
    CtrlGrpTrein: TCtrlGrpTrein;

    ListaCodGrupo: TStringList;
  end;

var
  frmParamTabCursos: TfrmParamTabCursos;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, dCds, fAguarde;

{$R *.DFM}

procedure TfrmParamTabCursos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrpTrein := TCtrlGrpTrein.Create;
  CtrlGrpTrein.InitializeAs(Padroes);

  ListaCodGrupo := TStringList.Create;

  // Montar a Lista dos Grupos de Treinamento
  dmCds.Cds.Data := CtrlGrpTrein.ListGrpTrein;
  chklstGrupos.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodGrupo.Add(dmCds.Cds.FieldByName('CODGRPTREIN').asString);
    chklstGrupos.Items.Add(dmCds.Cds.FieldByName('DESCGRPTREIN').asString);
    dmCds.Cds.Next;
  end;
end;

procedure TfrmParamTabCursos.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrpTrein);
  FreeAndNil(ListaCodGrupo);
  inherited;
end;

procedure TfrmParamTabCursos.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupos.Items.Count-1 do
    chklstGrupos.Checked[c] := true;
  chklstGrupos.Repaint;
end;

procedure TfrmParamTabCursos.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstGrupos.Items.Count-1 do
    chklstGrupos.Checked[c] := not(chklstGrupos.Checked[c]);
  chklstGrupos.Repaint;
end;

procedure TfrmParamTabCursos.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodGrupos: string;
begin
  inherited;
  // Grupos selecionados
  FU.CriaListaOpcoes(chklstGrupos, ListaCodGrupo, sListaCodGrupos, ',', true);

  Cmp_Padrao.ParamByName('ListaCodGrupo').asString := sListaCodGrupos;
  Cmp_Padrao.ParamByName('ImprimeObs').asBoolean := (rgImprObs.ItemIndex = 0);
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := rgOrderBy.ItemIndex;

  frmAguarde.Mostra('Tabela de Cursos');
  frmAguarde.Pos := 0;
end;

end.
