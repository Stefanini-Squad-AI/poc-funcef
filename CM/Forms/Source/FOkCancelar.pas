unit FOkCancelar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls,
  ToolWin, FSairAjuda, TB97, uMensErro, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, ZipDir;

type
  TfrmOkCancelar = class(TfrmSairAjuda)
    sep3: TToolbarSep97;
    TB97oKCancelar: TToolbar97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawFundo; override;
  end;

var
  frmOkCancelar: TfrmOkCancelar;

implementation

{$R *.DFM}

procedure TfrmOkCancelar.DrawFundo;
begin
  inherited;
  if tb97OkCancelar <> nil then
     tb97OkCancelar.DockPos := width-tb97Fundo.width-10;
end;

procedure TfrmOkCancelar.FormResize(Sender: TObject);
begin
  inherited;
  DrawFundo;
end;

end.
