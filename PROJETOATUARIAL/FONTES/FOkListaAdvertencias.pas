unit FOkListaAdvertencias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmOkListaAdvertencias = class(TfrmOkCancelar)
    MmAdvertencias: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure exibeLista;
  public
    { Public declarations }
    lstAdvertencias: TStringList;
  end;

var
  frmOkListaAdvertencias: TfrmOkListaAdvertencias;

implementation

{$R *.DFM}

procedure TfrmOkListaAdvertencias.exibeLista;
begin
  MmAdvertencias.Lines.Clear;
  MmAdvertencias.Lines.AddStrings(lstAdvertencias);
end;

procedure TfrmOkListaAdvertencias.FormCreate(Sender: TObject);
begin
  inherited;

  lstAdvertencias := TStringList.Create;
  lstAdvertencias.Duplicates := dupIgnore;
end;

procedure TfrmOkListaAdvertencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(lstAdvertencias);
  inherited;
end;

procedure TfrmOkListaAdvertencias.FormShow(Sender: TObject);
begin
  inherited;
  exibeLista;
end;

end.
