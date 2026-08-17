unit fSelConProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoCons,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, TB97, wwdbdatetimepicker, CMDateTimePicker,
  CheckLst, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmSelConProc = class(TfrmSelProcessoCons)
    bbtnDetalhe: TBitBtn;
    dbgdConProc: TwwDBGrid;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnDetalheClick(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
  end;

var
  frmSelConProc: TfrmSelConProc;

implementation

uses {fCadProcesso,} fAguarde, fCadProcesso;

{$R *.DFM}

procedure TfrmSelConProc.bbtnDetalheClick(Sender: TObject);
begin
  frmCadProcesso := TfrmCadProcesso.Create(Self);
  frmCadProcesso.ToolBar971.Visible := false;
  frmCadProcesso.Dock973.Visible := false;
  frmCadProcesso.Top := 10;
  frmCadProcesso.Sel(true, CdsProcesso.FieldByName('NUMPROCTRAB').asFloat);

end;

procedure TfrmSelConProc.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  bbtnDetalhe.Visible := false;
end;

procedure TfrmSelConProc.bbtnConfirmarClick(Sender: TObject);
begin
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Selecionando dados...');
  frmAguarde.Update;
  inherited;
  bbtnDetalhe.Visible := not(CdsProcesso.IsEmpty);
  frmAguarde.pbAguarde.Visible := true;
  frmAguarde.Apaga;
end;

end.
