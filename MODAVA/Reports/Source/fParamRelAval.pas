unit fParamRelAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlTipAval, IniFiles,
  ColorCheckListBox;


type
  TfrmParamRelAval = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxTipoAval: TGroupBox;
    chklstTipoAval: TColorCheckListBox;
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
    rgIncluiPend: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  private
    CtrlTipAval: TCtrlTipAval;

    lstTipoAval: TStringList;

    sListaFunc, sTipoAval: string;
    ArqConfig: TIniFile;
  end;

var
  frmParamRelAval: TfrmParamRelAval;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamRelAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  lstTipoAval := TStringList.Create;

  // Preenche ChkList dos Tipos de Aval.
  CdsAval.Data := CtrlTipAval.ListTipoAval;
  chklstTipoAval.Items.Clear;
  while not(CdsAval.EOF) do
  begin
    lstTipoAval.Add(CdsAval.FieldByName('CODTIPOAVAL').asString);
    chklstTipoAval.Items.Add(CdsAval.FieldByName('DESCRTIPOAVAL').asString);
    CdsAval.Next;
  end;

  edData1.Date := Date - 365;
  edData2.Date := Date;
  cmbSeqRel.ItemIndex := 0;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamRelAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipAval);
  FreeAndNil(lstTipoAval);
  GravaAlteracoes;
  inherited;
end;

procedure TfrmParamRelAval.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoAval.Items.Count-1 do
    chklstTipoAval.Checked[c] := true;
  chklstTipoAval.Repaint;
end;

procedure TfrmParamRelAval.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoAval.Items.Count-1 do
    chklstTipoAval.Checked[c] := not(chklstTipoAval.Checked[c]);
  chklstTipoAval.Repaint;
end;

procedure TfrmParamRelAval.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  FU.CriaListaOpcoes(chklstTipoAval, lstTipoAval, sTipoAval, ',', false);
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

  Cmp_Padrao.ParamByName('ListaTipoAval').asString := sTipoAval;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaFunc;
  Cmp_Padrao.ParamByName('DataIni').asDateTime := EdData1.Date;
  Cmp_Padrao.ParamByName('DataFim').asDateTime := EdData2.Date;
  Cmp_Padrao.ParamByName('MaxPonto').asInteger := spedGrauMax.Value;
  Cmp_Padrao.ParamByName('IncluiPend').asInteger := rgIncluiPend.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmParamRelAval.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  spedGrauMax.Text := ArqConfig.ReadString('REL_AVAL', 'Pontuacao', '500');
end;

procedure TfrmParamRelAval.GravaAlteracoes;
begin
  // Grava as últimas alterações das opções
  ArqConfig.WriteString('REL_AVAL', 'Pontuacao', spedGrauMax.Text);
end;

end.
