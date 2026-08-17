unit fParamListaEntid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmParamReport,
  fParamReports_Padrao, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, CheckLst, uCtrlTipCurso, ColorCheckListBox;

type
  TfrmParamListaEntid = class(TfrmParamReports_Padrao)
    gbxTipoCurso: TGroupBox;
    chklstTipoCurso: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlTipoCurso: TCtrlTipCurso;    
    ListaIdTipoCurso: TStringList;
  end;

var
  frmParamListaEntid: TfrmParamListaEntid;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TfrmParamListaEntid.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoCurso := TCtrlTipCurso.Create;
  CtrlTipoCurso.InitializeAs(Padroes);

  ListaIdTipoCurso := TStringList.Create;

  // Monto a Lista de Tipos de Curso
  chklstTipoCurso.Items.Clear;
  dmCds.Cds.Data := CtrlTipoCurso.ListGeral(0);
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoCurso.Add(dmCds.Cds.FieldByName('IDTIPOCURSO').asString);
    chklstTipoCurso.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  cmbSeqRel.ItemIndex := 0;  
end;

procedure TfrmParamListaEntid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipoCurso);
  FreeAndNil(ListaIdTipoCurso);
  inherited;
end;

procedure TfrmParamListaEntid.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoCurso.Items.Count-1 do
    chklstTipoCurso.Checked[c] := true;
  chklstTipoCurso.Repaint;
end;

procedure TfrmParamListaEntid.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoCurso.Items.Count-1 do
    chklstTipoCurso.Checked[c] := not(chklstTipoCurso.Checked[c]);
  chklstTipoCurso.Repaint;
end;

procedure TfrmParamListaEntid.bbtnConfirmarClick(Sender: TObject);
var
  sTipo: string;
begin
  inherited;
  FU.CriaListaOpcoes(chklstTipoCurso, ListaIdTipoCurso, sTipo, ',', false);

  Cmp_Padrao.ParamByName('ListaTipo').asString := sTipo;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;

  frmAguarde.Mostra('Listagem de Entidades de Treinamento');
  frmAguarde.Pos := 0;
end;

end.
