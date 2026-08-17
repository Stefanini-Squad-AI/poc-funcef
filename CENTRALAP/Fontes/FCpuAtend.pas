unit FCpuAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FTelaAut, DBCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, Mask, wwdbedit, Wwdotdot, Wwdbcomb, umodulocap;

type
  TfrmIdCpuAtend = class(TfrmOkCancelar)
    ComboBoxCPUAtend: TComboBox;
    wwQueryCPUAtend: TwwQuery;
    Label_CPU: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ComboBoxCPUAtendChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIdCpuAtend: TfrmIdCpuAtend;

implementation

uses FAtend, FPrincipal;

{$R *.DFM}

procedure TfrmIdCpuAtend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AbrirForm (frmAtend , TfrmAtend , false);
end;

procedure TfrmIdCpuAtend.FormCreate(Sender: TObject);
begin
  inherited;
  wwQueryCPUAtend.Open;
  wwQueryCPUAtend.first;
  while not wwQueryCPUAtend.eof do
  begin
    ComboBoxCPUAtend.Items.add(wwQueryCPUAtend.fieldByName('DescCpuAtend').asString);
    wwQueryCPUAtend.Next;
  end;

end;

procedure TfrmIdCpuAtend.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  wwQueryCPUAtend.first;
  while  not wwQueryCPUAtend.eof and
  (UpperCase(wwQueryCPUAtend.fieldByName('DescCpuAtend').asString) <>
  UpperCase (ComboBoxCPUAtend.text)) do
  begin
    wwQueryCPUAtend.Next;
  end;
  ModuloCap.IdLocaAtendxCpu := wwQueryCPUAtend.FieldByName('IdLocalAtendXCpu').AsInteger;
  frmIdCpuAtend.close;
end;

procedure TfrmIdCpuAtend.ComboBoxCPUAtendChange(Sender: TObject);
begin
  inherited;
  wwQueryCPUAtend.first;
  while  not wwQueryCPUAtend.eof and
  (UpperCase(wwQueryCPUAtend.fieldByName('DescCpuAtend').asString) <>
  UpperCase (ComboBoxCPUAtend.text)) do
  begin
    wwQueryCPUAtend.Next;
  end;
end;

procedure TfrmIdCpuAtend.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  frmIdCpuAtend.close;
end;

end.
