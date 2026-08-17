unit fParamProgAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlTipAval,
  ColorCheckListBox;

type
  TfrmParamProgAval = class(TfrmSelPessoalMT)
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
    rgSelPeriodo: TRadioGroup;
    gbxMesAdmis: TGroupBox;
    cmbMesAdmis: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgSelPeriodoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlTipAval: TCtrlTipAval;

    lstTipoAval: TStringList;

    sListaFunc, sTipoAval: string;
  public

  end;

var
  frmParamProgAval: TfrmParamProgAval;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamProgAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  lstTipoAval := TStringList.Create;

  // Preenche ChkList dos Tipos de Aval.
  CdsAval.Data := CtrlTipAval.ListTipoAval(0, '0,1');
  chklstTipoAval.Items.Clear;
  while not(CdsAval.EOF) do
  begin
    lstTipoAval.Add(CdsAval.FieldByName('CODTIPOAVAL').asString);
    chklstTipoAval.Items.Add(CdsAval.FieldByName('DESCRTIPOAVAL').asString);
    CdsAval.Next;
  end;

  edData1.Date := Date;
  edData2.Date := Date + 30;
  cmbSeqRel.ItemIndex := 0;
  cmbMesAdmis.ItemIndex := 0;
end;

procedure TfrmParamProgAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipAval);
  FreeAndNil(lstTipoAval);
  inherited;
end;

procedure TfrmParamProgAval.rgSelPeriodoClick(Sender: TObject);
begin
  gbxFaixaData.Visible := (rgSelPeriodo.ItemIndex = 0);
end;

procedure TfrmParamProgAval.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoAval.Items.Count-1 do
    chklstTipoAval.Checked[c] := true;
  chklstTipoAval.Repaint;
end;

procedure TfrmParamProgAval.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoAval.Items.Count-1 do
    chklstTipoAval.Checked[c] := not(chklstTipoAval.Checked[c]);
  chklstTipoAval.Repaint;
end;

procedure TfrmParamProgAval.bbtnConfirmarClick(Sender: TObject);
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
  Cmp_Padrao.ParamByName('SelPeriodo').asInteger := rgSelPeriodo.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;
  Cmp_Padrao.ParamByName('IndMesAdmis').asInteger := cmbMesAdmis.ItemIndex;
end;

end. 
