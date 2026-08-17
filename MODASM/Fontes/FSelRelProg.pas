unit FSelRelProg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls,
  TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelProg = class(TCMParamRel)
    TabSheet1: TTabSheet;
    rgPrograma: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgSelPeriodo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure edData1Change(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rgSelPeriodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelProg: TfrmSelRelProg;
  Imprime : Boolean;

implementation

uses RProgPess, FTelaAut, RProgTipo;

//uses RProgPess, FTelaAut, RProgTipo;

{$R *.DFM}


procedure TfrmSelRelProg.FormCreate(Sender: TObject);
begin
  inherited;
  EdData1.Date := (Date);
  EdData2.Date := (Date + 30);
end;

procedure TfrmSelRelProg.edData1Change(Sender: TObject);
begin
  inherited;
  rbtnVisualizar.Enabled := False;
  rbtnImprimir.Enabled := False;
  if (EdData1.Text <> '') and  (EdData2.Text <> '')  and
     (EdData1.Date <= EdData2.Date) then begin
      rbtnVisualizar.Enabled := True;
      rbtnImprimir.Enabled := True;
  end;
end;

procedure TfrmSelRelProg.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := False;
  AbrirForm{Modal}(RelProgPess, TRelProgPess, False);
  //relProgPess.Free;
end;

procedure TfrmSelRelProg.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := True;
  AbrirForm{Modal}(RelProgPess, TRelProgPess, False);
  //relProgPess.Free;
end;



procedure TfrmSelRelProg.rgSelPeriodoClick(Sender: TObject);
begin
  inherited;
  gbxFaixaData.Visible := (rgSelPeriodo.ItemIndex = 0);
  rbtnVisualizar.Enabled := (rgSelPeriodo.ItemIndex = 1) or
     ((EdData1.Text <> '') and  (EdData2.Text <> '')  and
      (EdData1.Date <= EdData2.Date));
  rbtnImprimir.Enabled := rbtnVisualizar.Enabled;
end;

end.
