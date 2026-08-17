unit fChartOrca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, OleCtrls, chartfx3, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, ComCtrls;

type
  TfrmChartOrca = class(TfrmSairAjuda)
    pgctrlGrafico: TPageControl;
    tbshEvolucao: TTabSheet;
    tbshRateio: TTabSheet;
    Chart1: TChartfx;
    Chart2: TChartfx;
    procedure FormShow(Sender: TObject);
  public
    NumMeses: integer;
    TotalGeral: double;
    SelecionaBeneficios: boolean;
    NumPessoas: array[1..14] of integer;
    ValSalario, ValBenef, ValEncargo, ValTotal: array[1..14] of real;
  end;

var
  frmChartOrca: TfrmChartOrca;

implementation

uses uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmChartOrca.FormShow(Sender: TObject);
const
  LEGENDA: array[1..4] of string = ('Benefícios', 'Encargos', 'Salários', 'Total');
var
  YMax, I3: double;
  c, iTam, I4: integer;
begin
  inherited;
  pgctrlGrafico.ActivePageIndex := 0;

  if (SelecionaBeneficios) then
    iTam := 4
  else
    iTam := 4 - 1;

  // 1º Gráfico
  Chart1.OpenDataEx(1, iTam, NumMeses);
  Chart1.ChartType := 2;

  for c:=1 to NumMeses do
    Chart1.Legend[c-1] := 'Mês '+ IntToStr(c);

  Chart1.Decimals := 0;

  YMax := 0;
  for I4:=1 to iTam do
  begin
    Chart1.ThisSerie := I4-1;
    Chart1.SerLeg[I4-1] := LEGENDA[I4 + FU.IFF(SelecionaBeneficios, 0, 1)];

    for c:=1 to NumMeses do
    begin
      if (I4 = iTam-3) then
      begin
        Chart1.Value[c-1] := ValBenef[c];
        Continue;
      end
      else
      if (I4 = iTam-2) then
      begin
        Chart1.Value[c-1] := ValEncargo[c];
        Continue;
      end
      else
      if (I4 = iTam-1) then
      begin
        Chart1.Value[c-1] := ValSalario[c];
        Continue;
      end
      else
      if (I4 = iTam) then
      begin
        Chart1.Value[c-1] := ValTotal[c];
        if (ValTotal[c] > YMax) then
          YMax := ValTotal[c];

        Continue;
      end;
    end;
  end;
  Chart1.Title[2] := 'Evolução dos Custos';
  Chart1.Title[3] := 'Custo Total: ' +FloatToStrF(TotalGeral,ffNumber,11,0);

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); //Escala de Y

  Chart1.Adm[1] := YMax; // Valor Máximo de Y
  Chart1.Adm[4] := I3; // Escala de Y
  Chart1.CloseData(1);

  // 2º Gráfico
  Chart2.OpenDataEx(1,1,iTam-1);
  Chart2.ChartType := 5;

  for c:=1 to iTam-1 do
    Chart2.Legend[c-1] := LEGENDA[c + FU.IFF(SelecionaBeneficios, 0, 1)];

  Chart2.Decimals := 0;
  YMax := 0;
  Chart2.ThisSerie := 0;

  for c:=1 to iTam-1 do
  begin
    if (c = iTam-3) then
      Chart2.Value[c-1] := ValBenef[13]
    else
    if (c = iTam-2) then
      Chart2.Value[c-1] := ValEncargo[13]
    else
    if (c = iTam-1) then
      Chart2.Value[c-1] := ValSalario[13];

    if (Chart2.Value[c-1] > YMax) then
      YMax := Chart2.Value[c-1];
  end;
  Chart2.Title[2] := 'Rateio do Custo';
  Chart2.Title[3] := 'Custo Total: ' +FloatToStrF(TotalGeral,ffNumber,11,0);

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); //Escala de Y

  Chart2.Adm[1] := YMax; // Valor Máximo de Y
  Chart2.Adm[4] := I3; // Escala de Y
  Chart2.CloseData(1);
end;

end.
