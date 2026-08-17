unit fSelConProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, checklst, TB97, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, DBClient, uCMClientDataSet,
  CmParamReport, TREdit, ColorCheckListBox;

type
  TfrmSelConProc = class(TfrmSelProcessoMT)
    wwDBGrid1: TwwDBGrid;
    dsProcesso: TwwDataSource;
    Toolbar971Detalhe: TToolbar97;
    bbtnDetalhe: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnDetalheClick(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
  end;

var
  frmSelConProc: TfrmSelConProc;

implementation

uses fCadProcesso;

{$R *.DFM}

procedure TfrmSelConProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Toolbar971Detalhe.Visible := true;
  bbtnDetalhe.Enabled := not(CdsProcesso.IsEmpty);
end;

procedure TfrmSelConProc.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  Toolbar971Detalhe.Visible := false;
end;

procedure TfrmSelConProc.bbtnDetalheClick(Sender: TObject);
begin
  frmCadProcesso := TfrmCadProcesso.Create(Application.MainForm);
  frmCadProcesso.ToolBar971.Visible := false;
  frmCadProcesso.Dock973.Visible := false;
  frmCadProcesso.Top := 10;
  frmCadProcesso.Sel(true, CdsProcesso.FieldByName('NUMPROCTRAB').asFloat);
end;

end.
