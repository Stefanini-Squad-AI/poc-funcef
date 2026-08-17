unit FConProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TB97, wwdblook, ExtCtrls, Spin, TEdNum, ComCtrls, Grids,
  Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, FSairAjuda, TB97Tlbr;

type
  TfrmConProc = class(TfrmSairAjuda)
    wwDBGrid1: TwwDBGrid;
    bbtnDetalhe: TBitBtn;
    procedure bbtnDetalheClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConProc: TfrmConProc;

implementation

uses FSelConProc, FCadProcesso;

{$R *.DFM}

procedure TfrmConProc.bbtnDetalheClick(Sender: TObject);
begin
  inherited;
  frmCadProcesso := TfrmCadProcesso.Create(Application.MainForm);
  frmCadProcesso.ToolBar971.Visible := False;
  //frmCadProcesso.dbnav.Visible := False;
  frmCadProcesso.Dock973.Visible := False;
  frmCadProcesso.BuscaProcesso(frmSelConProc.ds.Dataset.FieldByName('NUMPROCTRAB').Value);
end;

procedure TfrmConProc.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnDetalhe.Visible := not frmSelConProc.ds.Dataset.Eof;
end;

end.
