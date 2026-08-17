unit fParamProfis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, wwdbedit, Wwdotdot,
  Wwdbcomb, Machklb, wwdblook, checklst, IvDictio, IvMulti, IvEMulti, Wwdbigrd, Wwdbgrid,
  ComCtrls, fParamReports_Padrao, CmParamReport, uCtrlProfiss, ColorCheckListBox;

type
  TfrmParamProfis = class(TfrmParamReports_Padrao)
    gbxProfis: TGroupBox;
    chklstProfis: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    cmbOrderBy: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlProfiss: TCtrlProfiss;

    ListaCodProfis: TStringList;
  end;

var
  frmParamProfis: TfrmParamProfis;

implementation

uses uSistema, uCtrlFuncoesRH, uCtrlPadroes, dCds, fAguarde;

{$R *.DFM}

procedure TfrmParamProfis.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProfiss := TCtrlProfiss.Create;
  CtrlProfiss.InitializeAs(Padroes);

  ListaCodProfis := TStringList.Create;

  dmCds.Cds.Data := CtrlProfiss.ListProfissao;
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodProfis.Add(dmCds.Cds.FieldByName('IDPROFISS').asString);
    chklstProfis.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamProfis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProfiss);
  FreeAndNil(ListaCodProfis);
  inherited;
end;

procedure TfrmParamProfis.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProfis.Items.Count-1 do
    chklstProfis.Checked[c] := true;
  chklstProfis.Repaint;
end;

procedure TfrmParamProfis.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstProfis.Items.Count-1 do
    chklstProfis.Checked[c] := not(chklstProfis.Checked[c]);
  chklstProfis.Repaint;
end;

procedure TfrmParamProfis.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sCodProfisSel: string;
begin
  // Profissões escolhidos
  wNum := FU.CriaListaOpcoes(chklstProfis, ListaCodProfis, sCodProfisSel, ',', false);
  if (wNum = chklstProfis.Items.Count) then
    sCodProfisSel := '';

  Cmp_Padrao.ParamByName('ListaCodProfissao').asString := sCodProfisSel;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Listagem de Profissões');
  frmAguarde.Pos := 0;
end;

end.
