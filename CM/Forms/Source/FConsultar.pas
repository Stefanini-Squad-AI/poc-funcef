(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000 
*******************************************************************************)

unit FConsultar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Tabs, Grids, Wwdbigrd,
  Wwdbgrid, Db, Wwdatsrc, ComCtrls, FOkCancelar, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmConsultar = class(TfrmOkCancelar)
    pnlPesquisa: TPanel;
    tsetResult: TTabSet;
    grpResultado: TGroupBox;
    Panel1: TPanel;
    dbgrdResultado: TwwDBGrid;
    Panel4: TPanel;
    ds: TwwDataSource;
    bbtnConsultar: TButton;
    anmLupa: TAnimate;
    procedure bbtnConsultarClick(Sender: TObject);
    procedure Consulta; virtual;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultar: TfrmConsultar;

implementation

{$R *.DFM}

procedure TfrmConsultar.Consulta;
begin
   ShowMessage('Você não implementou a rotina Consulta');
end;

procedure TfrmConsultar.bbtnConsultarClick(Sender: TObject);
begin
  inherited;
  anmLupa.Active := True;
  Consulta;
  anmLupa.Active := False;
end;

end.
