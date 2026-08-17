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
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    rgSelPeriodo: TRadioGroup;
    procedure rgSelPeriodoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelProg: TfrmSelRelProg;
  Imprime : Boolean;

implementation

uses RProg, FTelaAut;

{$R *.DFM}

procedure TfrmSelRelProg.rgSelPeriodoClick(Sender: TObject);
begin
  inherited;
  gbxFaixaData.Visible := (rgSelPeriodo.ItemIndex = 0);
  rbtnVisualizar.Enabled := (rgSelPeriodo.ItemIndex = 1) or
     ((EdData1.Text <> '') and  (EdData2.Text <> '')  and
      (EdData1.Date <= EdData2.Date));
  rbtnImprimir.Enabled := rbtnVisualizar.Enabled;
end;

procedure TfrmSelRelProg.FormCreate(Sender: TObject);
begin
  inherited;
  EdData1.Date := (Date);
  EdData2.Date := (Date+30);
end;

procedure TfrmSelRelProg.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := False;
  AbrirForm{Modal}(relProg, TrelProg, False);
  //relProg.Free;
end;

procedure TfrmSelRelProg.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := True;
  AbrirForm{Modal}(relProg, TrelProg, False);
  //relProg.Free;
end;



end.
