unit FSelRelProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97,
  ComCtrls, Db, DBTables, Wwtable, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  TREdit, Wwquery;

  
type
  TfrmSelRelProc = class(TCMParamRel)
    TabSheet1: TTabSheet;
    rgTipoRel: TRadioGroup;
    gbxEncargos: TGroupBox;
    redEncargos: TRealEdit;
    rgCargo: TRadioGroup;
    rgEtapa: TRadioGroup;
    rgObserv: TRadioGroup;
    rgRateio: TRadioGroup;
    rgCabRod: TRadioGroup;
    qryResumo: TwwQuery;
    updResumo: TUpdateSQL;
    rgResumo: TRadioGroup;
    rgRisco: TRadioGroup;
    rgLitis: TRadioGroup;
    rgObjeto: TRadioGroup;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rgTipoRelClick(Sender: TObject);
    procedure rgEtapaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelProc: TfrmSelRelProc;
  Imprime : boolean;

implementation

uses fTelaAut, fSelRelProc2;

{$R *.DFM}

procedure TfrmSelRelProc.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := false;
  AbrirForm(frmSelRelProc2, TfrmSelRelProc2, false);
end;

procedure TfrmSelRelProc.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := true;
  AbrirForm(frmSelRelProc2, TfrmSelRelProc2, false);
end;


procedure TfrmSelRelProc.rgTipoRelClick(Sender: TObject);
begin
  inherited;
  gbxEncargos.Visible := rgTipoRel.ItemIndex = 1;
  redEncargos.Value   := 28.8;
end;

procedure TfrmSelRelProc.rgEtapaClick(Sender: TObject);
begin
  inherited;
  rgObserv.Enabled := rgEtapa.ItemIndex <> 1;
end;

end.
