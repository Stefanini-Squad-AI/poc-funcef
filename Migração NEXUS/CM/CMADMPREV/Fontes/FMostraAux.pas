unit FMostraAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, IvDictio, IvMulti, IvEMulti;

type
  TfrmMostraAux = class(TfrmOkCancelar)
    bbtnImprimir: TBitBtn;
    bbtnSalvar: TBitBtn;
    savedlg: TSaveDialog;
    printdlg: TPrintDialog;
    memResult: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostraAux: TfrmMostraAux;

implementation

{$R *.DFM}

procedure TfrmMostraAux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// inherited;
//
end;

procedure TfrmMostraAux.FormShow(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
end;

procedure TfrmMostraAux.bbtnSalvarClick(Sender: TObject);
begin
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename); 

end;

procedure TfrmMostraAux.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if printdlg.Execute
  then memResult.Print(' ');

end;

end.
