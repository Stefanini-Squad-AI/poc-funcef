unit fParamRelDesemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlFatorAval, IniFiles,
  ColorCheckListBox;

type
  TfrmParamRelDesemp = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxTipoAval: TGroupBox;
    chklstFatorAval: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    CdsAval: TCMClientDataSet;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxGrauMax: TGroupBox;
    spedGrauMax: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  private
    CtrlFatorAval: TCtrlFatorAval;

    lstFatorAval: TStringList;

    sListaFunc, sFatorAval: string;
    ArqConfig: TIniFile;
  end;

var
  frmParamRelDesemp: TfrmParamRelDesemp;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamRelDesemp.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlFatorAval := TCtrlFatorAval.Create;
  CtrlFatorAval.InitializeAs(Padroes);

  lstFatorAval := TStringList.Create;

  // Preenche ChkList dos Fatores de Aval.
  CdsAval.Data := CtrlFatorAval.ListFatorAval(0,'1,0');
  chklstFatorAval.Items.Clear;
  while not(CdsAval.EOF) do
  begin
    lstFatorAval.Add(CdsAval.FieldByName('IDFATORAVAL').asString);
    chklstFatorAval.Items.Add(CdsAval.FieldByName('DESCRFATORAVAL').asString);
    CdsAval.Next;
  end;

  edData1.Date := Date - 365;
  edData2.Date := Date;
  cmbSeqRel.ItemIndex := 0;
  LeAlteracoes;
end;

procedure TfrmParamRelDesemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFatorAval);
  FreeAndNil(lstFatorAval);
  GravaAlteracoes;  
  inherited;
end;

procedure TfrmParamRelDesemp.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFatorAval.Items.Count-1 do
    chklstFatorAval.Checked[c] := true;
  chklstFatorAval.Repaint;
end;

procedure TfrmParamRelDesemp.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFatorAval.Items.Count-1 do
    chklstFatorAval.Checked[c] := not(chklstFatorAval.Checked[c]);
  chklstFatorAval.Repaint;
end;

procedure TfrmParamRelDesemp.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  FU.CriaListaOpcoes(chklstFatorAval, lstFatorAval, sFatorAval, ',', false);
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

  Cmp_Padrao.ParamByName('ListaFatorAval').asString := sFatorAval;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaFunc;
  Cmp_Padrao.ParamByName('DataIni').asDateTime := EdData1.Date;
  Cmp_Padrao.ParamByName('DataFim').asDateTime := EdData2.Date;
  Cmp_Padrao.ParamByName('MaxPonto').asInteger := spedGrauMax.Value;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamRelDesemp.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  spedGrauMax.Text := ArqConfig.ReadString('REL_DESEMP', 'Nota', '5');
end;

procedure TfrmParamRelDesemp.GravaAlteracoes;
begin
  // Grava as últimas alterações das opções
  ArqConfig.WriteString('REL_DESEMP', 'Nota', spedGrauMax.Text);
end;

end.
