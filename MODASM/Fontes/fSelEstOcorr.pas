unit FSelEstOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery,
  Db, Wwtable, Wwdatsrc, wwdblook, Spin, TB97, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr;

type
  TfrmSelEstOcorr = class(TfrmOkCancelar)
    qryTabOcorr: TwwQuery;
    rgFreq: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    spedAno1: TSpinEdit;
    spedAno2: TSpinEdit;
    rgSelTudo: TRadioGroup;
    gbxOcorr: TGroupBox;
    dblcOcorr: TwwDBLookupCombo;
    lstOcorr: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure spedAno1Change(Sender: TObject);
    procedure dblcOcorrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstOcorrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgSelTudoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstOcorr: TfrmSelEstOcorr;

implementation

uses fEstOcorr, fTelaAut;

{$R *.DFM}

procedure TfrmSelEstOcorr.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: word;
begin
  inherited;
  qryTabOcorr.Open;
  DecodeDate(Date, Ano, Mes, Dia);
  spedAno1.Value    := Ano;
  spedAno2.Value    := Ano;
  spedAno1.MaxValue := Ano;
  spedAno2.MaxValue := Ano;
end;

procedure TfrmSelEstOcorr.spedAno1Change(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := ((spedAno1.Value <= spedAno2.Value) and (rgFreq.ItemIndex = 1) and
    (spedAno1.Value > spedAno2.Value -12))  or ((spedAno1.Value = spedAno2.Value) and
    (rgFreq.ItemIndex = 0));
end;

procedure TfrmSelEstOcorr.dblcOcorrCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    lstOcorr.Items.Add(qryTabOcorr.FieldByName('DESCRTIPOOCMED').Value);
end;

procedure TfrmSelEstOcorr.lstOcorrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstOcorr.Items.Count > 0)  then
    lstOcorr.Items.Delete(lstOcorr.ItemIndex);
end;

procedure TfrmSelEstOcorr.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxOcorr.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TfrmSelEstOcorr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstOcorr, TfrmEstOcorr, false);
end;

end.
