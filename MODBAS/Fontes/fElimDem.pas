unit FElimDem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, MskEdDlg, Db,
  DBTables, Wwtable, TB97, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmElimDem = class(TfrmOkCancelar)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ds: TwwDataSource;
    tblFuncio: TwwTable;
    tblPessoal: TwwTable;
    tblSituacao: TwwTable;
    DtEd1: TCMDateTimePicker;
    rgTiraPessoa: TRadioGroup;
    tblPesFis: TwwTable;
    lblDemitidos: TLabel;
    lblQtdDem: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DtEd1Change(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElimDem: TfrmElimDem;

implementation

{$R *.DFM}

procedure TfrmElimDem.FormCreate(Sender: TObject);
begin
  inherited;
  tblFuncio.Open;
  tblPessoal.Open;
  tblPesFis.Open;
  tblSituacao.Open;

  DtEd1.Date := (Date - 730);
end;

procedure TfrmElimDem.DtEd1Change(Sender: TObject);
begin
  inherited;
  lblQtdDem.Visible    := false;
  lblDemitidos.Visible := false;
end;

procedure TfrmElimDem.bbtnConfirmarClick(Sender: TObject);
var
  I: integer;
  Q: string[4];
begin
  inherited;
  Screen.Cursor := crHourGlass;

  {Rotina de deleção dos registros de Pessoal}
  tblFuncio.First;
  I:=0;
  while not(tblFuncio.EOF) do
    if (tblSITUACAO.FieldByName('TIPOSIT').Value = 'D') and
       (tblFuncio.FieldByName('DATADESLIGAMENTO').Value < DtEd1.Date) then
    begin
      if (rgTiraPessoa.ItemIndex = 0) then
      begin
        tblPessoal.Delete;
        tblPesFis.Delete;
      end;
      ds.DataSet.Delete;
      Inc(I);
    end
    else
      tblFuncio.Next;

  str(I, Q);
  lblQtdDem.Caption    := Trim(Q);
  lblQtdDem.Visible    := true;
  lblDemitidos.Visible := true;

  Screen.Cursor := crDefault;
end;

end.
