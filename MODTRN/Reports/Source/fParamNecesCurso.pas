unit fParamNecesCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlCurso, IniFiles,
  ColorCheckListBox;

type
  TfrmParamNecesCurso = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    CdsCurso: TCMClientDataSet;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    gbxCursos: TGroupBox;
    chklstCurso: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    rgProgramados: TRadioGroup;
    rgTipoCargo: TRadioGroup;
    rgImprescindivel: TRadioGroup;
    rgBaseadas: TRadioGroup;
    gbxGrauMax: TGroupBox;
    spedGrauMax: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgBaseadasClick(Sender: TObject);
  private
    CtrlCurso: TCtrlCurso;

    ListaIdCurso: TStringList;
    ArqConfig: TIniFile;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamNecesCurso: TfrmParamNecesCurso;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamNecesCurso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  ListaIdCurso := TStringList.Create;

  // Preenche ChkList das Tipos de Ocorrência
  CdsCurso.Data := CtrlCurso.ListGeral;
  chklstCurso.Items.Clear;
  while not(CdsCurso.EOF) do
  begin
    ListaIdCurso.Add(CdsCurso.FieldByName('IDCURSO').asString);
    chklstCurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
    CdsCurso.Next;
  end;

  rgTipoCargo.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  cmbSeqRel.ItemIndex := 0;
  LeAlteracoes;
  rgBaseadasClick(Sender);
end;

procedure TfrmParamNecesCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCurso);
  FreeAndNil(ListaIdCurso);
  GravaAlteracoes;
  inherited;
end;

procedure TfrmParamNecesCurso.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := true;
  chklstCurso.Repaint;
end;

procedure TfrmParamNecesCurso.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := not(chklstCurso.Checked[c]);
  chklstCurso.Repaint;
end;

procedure TfrmParamNecesCurso.rgBaseadasClick(Sender: TObject);
begin
  rgImprescindivel.Visible := rgBaseadas.ItemIndex = 0;
  gbxGrauMax.Visible := rgBaseadas.ItemIndex = 1;
end;

procedure TfrmParamNecesCurso.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sListaFunc, sCurso: string;
begin
  inherited;
  FU.CriaListaOpcoes(chklstCurso, ListaIdCurso, sCurso, ',', false);

  c:=0;
  while not(CdsPrincipal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := CdsPrincipal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaCurso').asString := sCurso;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaFunc;
  Cmp_Padrao.ParamByName('IncProgramados').asInteger := rgProgramados.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;
  Cmp_Padrao.ParamByName('TipoCargo').asInteger := rgTipoCargo.ItemIndex;
  Cmp_Padrao.ParamByName('Nota').asInteger := spedGrauMax.Value;
  Cmp_Padrao.ParamByName('Imprescindivel').asInteger := rgImprescindivel.ItemIndex;
  if (rgBaseadas.ItemIndex = 1) then
    Cmp_Padrao.ParamByName('Imprescindivel').asInteger := 9;
end;

procedure TfrmParamNecesCurso.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  spedGrauMax.Text := ArqConfig.ReadString('REL_NECESS', 'Nota', '3');
  rgBaseadas.ItemIndex := StrToInt(ArqConfig.ReadString('REL_NECESS', 'Opcao', '0'));
end;

procedure TfrmParamNecesCurso.GravaAlteracoes;
begin
  // Grava as últimas alterações das opções
  ArqConfig.WriteString('REL_NECESS', 'Nota', spedGrauMax.Text);
  ArqConfig.WriteString('REL_NECESS', 'Opcao', IntToStr(rgBaseadas.ItemIndex));
end;

end.
