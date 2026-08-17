unit FViewContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc;

type
  TFrmViewContrato = class(TfrmSairAjuda)
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
  FrmViewContrato: TFrmViewContrato;

implementation

uses FSoliComp2;

{$R *.DFM}

procedure TFrmViewContrato.FormShow(Sender: TObject);
begin
  inherited;
  Grd.SetFocus;
end;

procedure TFrmViewContrato.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmViewContrato.BtnAceitarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

end.
