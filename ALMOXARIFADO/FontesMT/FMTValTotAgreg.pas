unit FMTValTotAgreg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit, Db, Wwdatsrc;

type
  TFrmMTValTotAgreg = class(TfrmOkCancelar)
    PnlGrd: TPanel;
    Label2: TLabel;
    Panel1: TPanel;
    dbedValor: TDBRealEdit;
    grd: TwwDBGrid;
    dsValTotAgreg: TwwDataSource;
    procedure FormActivate(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure dbedValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMTValTotAgreg: TFrmMTValTotAgreg;

implementation

{$R *.DFM}

Uses FMtRecebMerc;

procedure TFrmMTValTotAgreg.FormActivate(Sender: TObject);
begin
  inherited;
  dsValTotAgreg.DataSet.First;
  dsValTotAgreg.DataSet.Edit;

  dbedValor.SetFocus;
end;

procedure TFrmMTValTotAgreg.grdDblClick(Sender: TObject);
begin
  inherited;
  dsValTotAgreg.DataSet.Edit;
  dbedValor.SetFocus;

end;

procedure TFrmMTValTotAgreg.dbedValorExit(Sender: TObject);
begin
  inherited;
  dsValTotAgreg.DataSet.Next;
  
  If Not dsValTotAgreg.DataSet.Eof Then
     dbedValor.SetFocus
  Else
     bbtnConfirmar.SetFocus;
end;

end.
