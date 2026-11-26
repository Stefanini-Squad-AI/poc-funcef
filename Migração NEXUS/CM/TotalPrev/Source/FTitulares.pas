unit FTitulares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery;

type
  TFrmTitulares = class(TfrmOkCancelar)
    dbGridTitulares: TwwDBGrid;
    qryTitulares: TwwQuery;
    qryTitularesMATRICULA: TStringField;
    qryTitularesNOME: TStringField;
    qryTitularesNUMDOCUMENTO: TStringField;
    qryTitularesIDTITULAR: TFloatField;
    qryTitularesIDPESSOA: TFloatField;
    qryTitularesIDRESPONSAVEL: TFloatField;
    dsTitulares: TwwDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridTitularesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTitulares: TFrmTitulares;

implementation
uses dConsPart;

{$R *.DFM}

procedure TFrmTitulares.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  frmTitulares.ModalResult := mrOK;
end;

procedure TFrmTitulares.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  frmTitulares.ModalResult := mrCancel;
end;

procedure TFrmTitulares.bbtnSairClick(Sender: TObject);
begin
  inherited;
  frmTitulares.ModalResult := mrCancel;
end;

procedure TFrmTitulares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmTitulares.dbGridTitularesDblClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmarClick(sender);
end;

end.
