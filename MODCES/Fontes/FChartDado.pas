unit FChartDado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc,
  OleCtrls, chartfx3, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmChartDado = class(TfrmSairAjuda)
    Chart1: TChartfx;
    dsTend: TwwDataSource;
    EditPesq: TEdit;
    EditCargo: TEdit;
    EditEntid: TEdit;
    edCodEntid: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChartDado: TfrmChartDado;
  YMAX : Double;

implementation

{$R *.DFM}


procedure TfrmChartDado.FormShow(Sender: TObject);
var
  I3 : Double;
begin
  inherited;
  Chart1.OpenDataEx({COD_VALUES}1,2,7);
  Chart1.ChartType := 2;
  Chart1.Legend[0] := 'Menor';
  Chart1.Legend[1] := '1.Quartil';
  Chart1.Legend[2] := 'Moda';
  Chart1.Legend[3] := 'Média';
  Chart1.Legend[4] := 'Mediana';
  Chart1.Legend[5] := '3.Quartil';
  Chart1.Legend[6] := 'Maior';
  Chart1.Decimals  := 0;
  Chart1.Title[{TOPTIT}2] := EditPesq.Text;
  YMAX := dsTend.Dataset.FieldByName('MAIOR').Value;
  if  dsTend.Dataset.FieldByName('MAIOR_R').Value > YMAX  then
      YMAX := dsTend.Dataset.FieldByName('MAIOR_R').Value;

  Chart1.ThisSerie := 0;
  Chart1.SerLeg[0]  := 'Nominal';
  Chart1.Value[0] := dsTend.Dataset.FieldByName('MENOR').Value;
  Chart1.Value[1] := dsTend.Dataset.FieldByName('PRIMQUA').Value;
  Chart1.Value[2] := dsTend.Dataset.FieldByName('MODA').Value;
  Chart1.Value[3] := dsTend.Dataset.FieldByName('MEDIA').Value;
  Chart1.Value[4] := dsTend.Dataset.FieldByName('MEDIANA').Value;
  Chart1.Value[5] := dsTend.Dataset.FieldByName('TERCQUA').Value;
  Chart1.Value[6] := dsTend.Dataset.FieldByName('MAIOR').Value;

  Chart1.ThisSerie := 1;
  Chart1.SerLeg[1]  := 'Real';
  Chart1.Value[0] := dsTend.Dataset.FieldByName('MENOR_R').Value;
  Chart1.Value[1] := dsTend.Dataset.FieldByName('PRIMQUA_R').Value;
  Chart1.Value[2] := dsTend.Dataset.FieldByName('MODA_R').Value;
  Chart1.Value[3] := dsTend.Dataset.FieldByName('MEDIA_R').Value;
  Chart1.Value[4] := dsTend.Dataset.FieldByName('MEDIANA_R').Value;
  Chart1.Value[5] := dsTend.Dataset.FieldByName('TERCQUA_R').Value;
  Chart1.Value[6] := dsTend.Dataset.FieldByName('MAIOR_R').Value;

  Chart1.Title[{BOTTOMTIT}3] := editCargo.Text + ' - ';
  if StrToInt(edCodEntid.Text) = 0
  then Chart1.Title[3] := Chart1.Title[3] + '(Interno)'
  else Chart1.Title[3] := Chart1.Title[3] + editEntid.Text;

  I3 := 1;
  while  YMAX > I3  do  I3 := I3*10;
  I3 := int(I3 / 20);      {Escala de Y}

  Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
  Chart1.Adm[4] := I3;      {Escala de Y}

  Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
  Chart1.Visible := True;

end;

end.
