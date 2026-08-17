unit fConProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwquery, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TB97, wwdblook, ExtCtrls, Spin, TEdNum,
  ComCtrls, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, FSairAjuda, TB97Tlbr;

type
  TfrmConProc = class(TfrmSairAjuda)
    wwDBGrid1: TwwDBGrid;
    bbtnDetalhe: TBitBtn;
    procedure bbtnDetalheClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmConProc: TfrmConProc;

implementation

uses fSelConProc, fCadProcesso;

{$R *.DFM}

procedure TfrmConProc.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnDetalhe.Visible := not(frmSelConProc.ds.Dataset.EOF);
end;

procedure TfrmConProc.bbtnDetalheClick(Sender: TObject);
begin
  inherited;
  frmCadProcesso := TfrmCadProcesso.Create(Self);
  frmCadProcesso.ToolBar971.Visible := false;
  frmCadProcesso.Dock973.Visible    := false;
  frmCadProcesso.BuscaProcesso(frmSelConProc.ds.Dataset.FieldByName('NUMPROCTRAB').Value);
end;

end.
