unit FChartOrca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, OleCtrls, chartfx3,
  FOkCancelar, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

Const
  VetLeg : Array[1..4] of String = ('Benefícios','Encargos','Salários',
                                    'Total');

type
  TfrmChartOrca = class(TfrmSairAjuda)
    Chart1: TChartfx;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChartOrca: TfrmChartOrca;
  YMAX : Double;
  TAM, I4 : Integer;

implementation

uses FOrcam;

{$R *.DFM}


procedure TfrmChartOrca.FormShow(Sender: TObject);
var
  I3 : Double;
  IND : Integer;
begin
  inherited;
  TAM := 4 - ItemBenef;

 if Vez = 1 then begin
  Chart1.OpenDataEx({COD_VALUES}1,TAM,NumMeses);
  Chart1.ChartType := 2;
  for IND := 1 to NumMeses do
      Chart1.Legend[IND-1] := 'Mês ' + IntToStr(IND);

  Chart1.Decimals  := 0;

  YMAX := 0;
  for I4 := 1 to TAM do begin
    Chart1.ThisSerie := I4-1;
    Chart1.SerLeg[I4-1]  := VetLeg[I4 + ItemBenef];
    for IND := 1 to NumMeses do begin
        if I4 = TAM-3 then begin
           Chart1.Value[IND-1] := ValBenef[IND];
           Continue;
        end;
        if I4 = TAM-2 then begin
           Chart1.Value[IND-1] := ValEncargo[IND];
           Continue;
        end;
        if I4 = TAM-1 then begin
           Chart1.Value[IND-1] := ValSalario[IND];
           Continue;
        end;
        if I4 = TAM   then begin
           Chart1.Value[IND-1] := ValTotal[IND];
           if ValTotal[IND] > YMAX then YMAX := ValTotal[IND];
           Continue;
        end;
    end;
  end;
 end
 else begin
  Chart1.OpenDataEx({COD_VALUES}1,1,TAM-1);
  Chart1.ChartType := 5;
  for IND := 1 to TAM-1 do
      Chart1.Legend[IND-1] := VetLeg[IND + ItemBenef];

  Chart1.Decimals  := 0;
  YMAX := 0;
  Chart1.ThisSerie := 0;
  for IND := 1 to TAM-1 do begin
        if IND = TAM-3 then Chart1.Value[IND-1] := ValBenef[13];

        if IND = TAM-2 then Chart1.Value[IND-1] := ValEncargo[13];

        if IND = TAM-1 then Chart1.Value[IND-1] := ValSalario[13];

        if Chart1.Value[IND-1] > YMAX then YMAX := Chart1.Value[IND-1];
  end;
 end;

  Chart1.Title[{BOTTOMTIT}3] := 'Custo Total: ' +
                                frmOrcam.ednResTot.Text;

  Chart1.Title[{TOPTIT}2] := 'Evolução dos Custos';
  if Vez = 2 then Chart1.Title[2] := 'Rateio do Custo';

  I3 := 1;
  while  YMAX > I3  do  I3 := I3*10;
  I3 := int(I3 / 20);      {Escala de Y}

  Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
  Chart1.Adm[4] := I3;      {Escala de Y}

  Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
  Chart1.Visible := True;

end;

end.
