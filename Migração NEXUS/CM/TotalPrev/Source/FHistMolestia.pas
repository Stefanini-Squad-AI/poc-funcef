unit FHistMolestia;

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
  TFrmHistMolestia = class(TfrmOkCancelar)
    dbGridMolestia: TwwDBGrid;
    qryMolestia: TwwQuery;
    dsMolestia: TwwDataSource;
    qryMolestiaDTINICIO: TDateTimeField;
    qryMolestiaDTFINAL: TDateTimeField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridMolestiaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistMolestia: TFrmHistMolestia;

implementation
uses dConsPart;

{$R *.DFM}

procedure TFrmHistMolestia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FrmHistMolestia.ModalResult := mrOK;
end;

procedure TFrmHistMolestia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FrmHistMolestia.ModalResult := mrCancel;
end;

procedure TFrmHistMolestia.bbtnSairClick(Sender: TObject);
begin
  inherited;
  FrmHistMolestia.ModalResult := mrCancel;
end;

procedure TFrmHistMolestia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmHistMolestia.dbGridMolestiaDblClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmarClick(sender);
end;

end.
