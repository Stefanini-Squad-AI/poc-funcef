unit fParamProgPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlTipOcMed,
  ColorCheckListBox;

type
  TfrmParamProgPess = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxOcorr: TGroupBox;
    chklstTipoOcorr: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    rgPrograma: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgSelPeriodo: TRadioGroup;
    CdsTipoOcorr: TCMClientDataSet;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlTipOcMed: TCtrlTipOcMed;
    
    lstTipoOcorr: TStringList;
    sListaFunc, sTipoOcorr: string;
  end;

var
  frmParamProgPess: TfrmParamProgPess;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TfrmParamProgPess.FormCreate(Sender: TObject);
begin
  inherited;
  lstTipoOcorr := TStringList.Create;

  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  // Preenche ChkList das Tipos de Ocorrência
  CdsTipoOcorr.Data := CtrlTipOcMed.ListGeral;
  chklstTipoOcorr.Items.Clear;
  while not(CdsTipoOcorr.EOF) do
  begin
    lstTipoOcorr.Add(CdsTipoOcorr.FieldByName('CODTIPOOCMED').asString);
    chklstTipoOcorr.Items.Add(CdsTipoOcorr.FieldByName('DESCRTIPOOCMED').asString);
    CdsTipoOcorr.Next;
  end;

  edData1.Date := (Date);
  edData2.Date := (Date + 30);
  cmbSeqRel.ItemIndex := 0;
end;

procedure TfrmParamProgPess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  inherited;
end;

procedure TfrmParamProgPess.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamProgPess.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamProgPess.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  CriaListaOpcoes(chklstTipoOcorr, lstTipoOcorr, sTipoOcorr, ',', false);
  c := 0;
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

  Cmp_Padrao.ParamByName('ListaTipoOcorr').asString := sTipoOcorr;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaFunc;
  Cmp_Padrao.ParamByName('CriaPrograma').asInteger := rgPrograma.ItemIndex;
  Cmp_Padrao.ParamByName('SeqRelat').asInteger := cmbSeqRel.ItemIndex;
  if (rgSelPeriodo.ItemIndex = 0) then
  begin
    Cmp_Padrao.ParamByName('DataIni').asString := edData1.Text;
    Cmp_Padrao.ParamByName('DataFim').asString := edData2.Text;
  end
  else
  begin
    Cmp_Padrao.ParamByName('DataIni').asString := '';
    Cmp_Padrao.ParamByName('DataFim').asString := '';
  end;
end;

end.
