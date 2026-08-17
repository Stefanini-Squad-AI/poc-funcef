unit FSelEstObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, wwdblook, Db, DBTables, Wwtable, Wwdatsrc, Wwquery, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ExtCtrls;

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
    procedure dblcObjetoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstObjetoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelTudoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  end;

var
  frmSelEstObj: TfrmSelEstObj;

implementation

uses fTelaAut, fSelEstObj2;

{$R *.DFM}

procedure TfrmSelEstObj.dblcObjetoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if modified then
    lstObjeto.Items.Add(qryTipObj.FieldByName('DESCRICAO').Value);
end;

procedure TfrmSelEstObj.lstObjetoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstObjeto.Items.Count > 0) then
    lstObjeto.Items.Delete(lstObjeto.ItemIndex);
end;

procedure TfrmSelEstObj.rgSelTudoClick(Sender: TObject);
var
  sSql: string;
begin
  gbxObjeto.Visible := (rgSelTudo.ItemIndex > 0);
  if (rgSelTudo.ItemIndex > 0) then
  begin
    qryTipObj.Close;
    qryTipObj.SQL.Clear;
    lstObjeto.Clear;
    if (rgSelTudo.ItemIndex = 1) then
     sSql := 'Select CODTIPOOBJETO, DESCRICAO from TIPOOBJPROCTRAB order by upper(DESCRICAO)';
    if (rgSelTudo.ItemIndex = 2) then
     sSql := 'Select IDGRUPOOBJETO as CODTIPOOBJETO, DESCRICAO from GRPOBJPROCJUR order by upper(DESCRICAO)';
    qryTipObj.SQL.Add(sSql);
    qryTipObj.Open;
    dblcObjeto.SetFocus;
  end;
end;

procedure TfrmSelEstObj.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmSelEstObj2, TfrmSelEstObj2, false);
end;

procedure TfrmSelEstObj.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
