unit FValorReal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, IvDictio, IvMulti, IvEMulti, TB97Tlbr, TREdit;

type
  TfrmValorReal = class(TfrmOkCancelar)
    wwDBGrid1: TwwDBGrid;
    rgRateio: TRadioGroup;
    redValor: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBGrid1ColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValorReal: TfrmValorReal;

implementation

uses FCadProcesso;

{$R *.DFM}

procedure TfrmValorReal.FormCreate(Sender: TObject);
begin
  inherited;
  frmCadProcesso.tblObjeto.Edit;
end;

procedure TfrmValorReal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadProcesso.tblObjeto.Post;
end;

procedure TfrmValorReal.wwDBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  frmCadProcesso.tblObjeto.Edit;
end;

end.
