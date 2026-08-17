unit fSelEstObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, wwdblook, Db, DBTables, Wwtable, Wwdatsrc, Wwquery, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ExtCtrls, Spin;

type
  TfrmSelEstObj = class(TfrmOkCancelar)
    ds: TwwDataSource;
    qryTipObj: TwwQuery;
    rgValor: TRadioGroup;
    rgSelTudo: TRadioGroup;
    gbxObjeto: TGroupBox;
    dblcObjeto: TwwDBLookupCombo;
    lstObjeto: TListBox;
    cbxDemais: TCheckBox;
    gbxPercMin: TGroupBox;
    cbxPercMin: TCheckBox;
    spedPercMin: TSpinEdit;
    Label1: TLabel;
    procedure dblcObjetoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstObjetoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgSelTudoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstObj: TfrmSelEstObj;

implementation

uses FSelEstObj2, FTelaAut;

{$R *.DFM}


procedure TfrmSelEstObj.dblcObjetoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    lstObjeto.Items.Add(qryTipObj.FieldByName('DESCRICAO').Value);
end;

procedure TfrmSelEstObj.lstObjetoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstObjeto.Items.Count > 0)  then
      lstObjeto.Items.Delete(lstObjeto.ItemIndex);
end;

procedure TfrmSelEstObj.rgSelTudoClick(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  gbxPercMin.Visible:= (rgSelTudo.ItemIndex < 2);
  gbxObjeto.Visible := (rgSelTudo.ItemIndex > 1);
  if (rgSelTudo.ItemIndex > 1) then
  begin
    qryTipObj.Close;
    qryTipObj.SQL.Clear;
    lstObjeto.Clear;
    if (rgSelTudo.ItemIndex = 2) then
      sSql := 'Select CODTIPOOBJETO, DESCRICAO from TIPOOBJPROCTRAB order by DESCRICAO';
    if (rgSelTudo.ItemIndex = 3) then
      sSql := 'Select IDGRUPOOBJETO as CODTIPOOBJETO, DESCRICAO from GRPOBJPROCJUR order by DESCRICAO';
    qryTipObj.SQL.Add(sSql);
    qryTipObj.Open;
    dblcObjeto.SetFocus;
  end;
end;

procedure TfrmSelEstObj.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmSelEstObj2, TfrmSelEstObj2, False);
end;

end.
