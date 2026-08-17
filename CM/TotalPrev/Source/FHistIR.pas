unit FHistIR;

{-------------------------------------------------------------------------------
ALTERAÇÃOES / IMPLEMENTAÇÕES ---------------------------------------------------
--------------------------------------------------------------------------------
alteração   : {.dfm selected)
SIG         : 42986
Responsável : Edilaine 
Data        : 04/08/2017
Descrição   : ajustes para apresentação maximizada dos paineis
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery;

type
  TFrmHistIR = class(TfrmOkCancelar)
    dbGridHistIR: TwwDBGrid;
    qryHistIR: TwwQuery;
    dsHistIR: TwwDataSource;
    qryHistIRDTINICIO: TDateTimeField;
    qryHistIRDTFINAL: TDateTimeField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridHistIRDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistIR: TFrmHistIR;

implementation
uses dConsPart;

{$R *.DFM}

procedure TFrmHistIR.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  frmHistIR.ModalResult := mrOK;
end;

procedure TFrmHistIR.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  frmHistIR.ModalResult := mrCancel;
end;

procedure TFrmHistIR.bbtnSairClick(Sender: TObject);
begin
  inherited;
  frmHistIR.ModalResult := mrCancel;
end;

procedure TFrmHistIR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmHistIR.dbGridHistIRDblClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmarClick(sender);
end;

end.
