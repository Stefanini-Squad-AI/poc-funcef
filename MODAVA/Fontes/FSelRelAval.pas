unit FSelRelAval;

interface                  

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Wwquery, TB97, ComCtrls, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, Spin, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;
                 
type
  TfrmSelRelAval = class(TCMParamRel)
    qryTipAval: TwwQuery;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    dblcTipoAval: TwwDBLookupCombo;
    gbxGrauMax: TGroupBox;
    spedGrauMax: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure edData1Change(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelAval: TfrmSelRelAval;
  Imprime : Boolean;

implementation

uses RAval, FTelaAut;

{$R *.DFM}

procedure TfrmSelRelAval.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipAval.Open;
  dblcTipoAval.SelText := qryTipAval.FieldByName('DESCRTIPOAVAL').asString;
  EdData1.Date := (Date-365);
  EdData2.Date := (Date);
end;

procedure TfrmSelRelAval.edData1Change(Sender: TObject);
begin
  inherited;
  rbtnVisualizar.Enabled := (EdData1.Text <> '') and (EdData2.Text <> '') and
    (EdData1.Date <= EdData2.Date);
  rbtnImprimir.Enabled   := rbtnVisualizar.Enabled;
end;

procedure TfrmSelRelAval.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := False;
  AbrirForm{Modal}(relAval, TrelAval, False);
  //relAval.Free;
end;

procedure TfrmSelRelAval.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := True;
  AbrirForm{Modal}(relAval, TrelAval, False);
  //relAval.Free;
end;

end.
