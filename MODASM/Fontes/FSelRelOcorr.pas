unit FSelRelOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls,
  TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelOcorr = class(TCMParamRel)
    TabSheet1: TTabSheet;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgTipoRel: TRadioGroup;
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
  frmSelRelOcorr: TfrmSelRelOcorr;
  Imprime : Boolean;

implementation

uses ROcorrPess, FTelaAut, ROcorrTipo;

{$R *.DFM}


procedure TfrmSelRelOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  EdData1.Date := (Date-365);
  EdData2.Date := (Date);
end;

procedure TfrmSelRelOcorr.edData1Change(Sender: TObject);
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

procedure TfrmSelRelOcorr.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprime := False;
  AbrirForm{Modal}(RelOcorrPess, TRelOcorrPess, False);
  //relOcorrPess.Free;
end;

procedure TfrmSelRelOcorr.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprime := True;
  AbrirForm{Modal}(RelOcorrPess, TRelOcorrPess, False);
  //relOcorrPess.Free;
end;


end.
