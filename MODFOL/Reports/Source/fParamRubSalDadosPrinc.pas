unit fParamRubSalDadosPrinc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, CheckLst,
  ColorCheckListBox, wwdblook,
  uSistema, dCds, uCtrlProvDesc, uCtrlPadroes, uFuncoesUteisRH, Db,
  DBTables, Wwquery;

type
  TfrmParamRubSalDadosPrinc = class(TfrmParamReports_Padrao)
    gbxRubricas: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    bbtnSelTodas: TBitBtn;
    bbtnInverteSel: TBitBtn;
    grbTipoRub: TGroupBox;
    grbSequenciaCalculo: TGroupBox;
    grbRegraCalculo: TGroupBox;
    grbRegraCalculo13: TGroupBox;
    grbRegraCalculoRescisao: TGroupBox;
    dblkRegraCalc: TwwDBLookupCombo;
    dblkRegraCalc13: TwwDBLookupCombo;
    dblkRegraCalcRescisao: TwwDBLookupCombo;
    edtSeqCalc: TEdit;
    cmbTipoRubrica: TComboBox;
    qryRegra: TwwQuery;
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodasClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlProvDesc: TCtrlProvDesc;
    ListaIdRubrica: TStringList;

    sListaIdRubricaSel: string;

  public
    { Public declarations }
  end;

var
  frmParamRubSalDadosPrinc: TfrmParamRubSalDadosPrinc;

implementation

uses fAguarde;

{$R *.DFM}

procedure TfrmParamRubSalDadosPrinc.sbtnMarcarRubClick(Sender: TObject);
begin
  inherited;
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubSalDadosPrinc.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdRubrica := TStringList.Create;

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  qryRegra.Open;
end;

procedure TfrmParamRubSalDadosPrinc.bbtnSelTodasClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubSalDadosPrinc.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
  chklstRubrica.Repaint;
end;

procedure TfrmParamRubSalDadosPrinc.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Rubrica(s) selecionada(s)
  wNum := CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);

  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';

  Cmp_Padrao.ParamByName('ListaIdRubrica').AsString          := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('TipoRubrica').AsInteger            := cmbTipoRubrica.ItemIndex;
  Cmp_Padrao.ParamByName('SeqCalculo').AsInteger             := StrToIntDef(edtSeqCalc.Text, 0);
  Cmp_Padrao.ParamByName('IdRegraCalculo').AsInteger         := StrToIntDef(dblkRegraCalc.LookupValue, 0);
  Cmp_Padrao.ParamByName('IdRegraCalculo13').AsInteger       := StrToIntDef(dblkRegraCalc13.LookupValue, 0);
  Cmp_Padrao.ParamByName('IdRegraCalculoRescisao').AsInteger := StrToIntDef(dblkRegraCalcRescisao.LookupValue, 0);

//  frmAguarde.Mostra('Rubricas Salariais - Dados Cadastrais');
end;

end.
