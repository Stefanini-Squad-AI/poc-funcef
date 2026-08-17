unit FMTViewContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc;

type
  TFrmMTViewContrato = class(TfrmSairAjuda)
    BtnAceitar: TBitBtn;
    plnTitulo: TPanel;
    Grd: TwwDBGrid;
    dsContrato: TwwDataSource;
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtnAceitarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMTViewContrato: TFrmMTViewContrato;

implementation



{$R *.DFM}

procedure TFrmMTViewContrato.FormShow(Sender: TObject);
begin
  inherited;
  Grd.SetFocus;
end;

procedure TFrmMTViewContrato.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmMTViewContrato.BtnAceitarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

end.
