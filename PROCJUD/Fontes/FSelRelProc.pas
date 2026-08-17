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
    rgObserv: TRadioGroup;
    rgLitis: TRadioGroup;
    rgEtapa: TRadioGroup;
    rgResumo: TRadioGroup;
    qryResumo: TwwQuery;
    updResumo: TUpdateSQL;
    rgObjeto: TRadioGroup;
    rgOpcao: TRadioGroup;
    rgCabRod: TRadioGroup;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rgEtapaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelProc: TfrmSelRelProc;
  Imprime : Boolean;

implementation

uses FTelaAut, FSelRelProc2;

{$R *.DFM}

procedure TfrmSelRelProc.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := False;
  AbrirForm{Modal}(frmSelRelProc2, TfrmSelRelProc2, False);
end;

procedure TfrmSelRelProc.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := True;
  AbrirForm{Modal}(frmSelRelProc2, TfrmSelRelProc2, False);
end;


procedure TfrmSelRelProc.rgEtapaClick(Sender: TObject);
begin
  inherited;
  rgObserv.Enabled := rgEtapa.ItemIndex <> 1;
end;

end.
