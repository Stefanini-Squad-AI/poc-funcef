unit FSairAjuda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, uMenserro,
  ToolWin, TB97,TB97Tlbr, IvDictio, IvMulti, IvEMulti, ZipDir;

type
  TfrmSairAjuda = class(TfrmTelaAutorizacao)
    pnlFundo: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawFundo; virtual;
  end;

var
  frmSairAjuda: TfrmSairAjuda;

implementation

{$R *.DFM}

procedure TfrmSairAjuda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=caFree
end;


procedure TfrmSairAjuda.bbtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSairAjuda.FormPaint(Sender: TObject);
begin
     inherited;
     DrawFundo;
end;

procedure TfrmSairAjuda.DrawFundo;
begin
     if tb97Fundo <> nil then
        tb97Fundo.DockPos := width;
end;

end.
