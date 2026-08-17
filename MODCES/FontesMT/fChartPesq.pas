unit FChartPesq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, OleCtrls, chartfx3, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, ComCtrls, uCMClientDataSet;

type
  TfrmChartPesq = class(TfrmSairAjuda)
    pgctrlGrafico: TPageControl;
    tbshNominal: TTabSheet;
    tbshReal: TTabSheet;
    Chart1: TChartfx;
    Chart2: TChartfx;
  end;

procedure ExibirGrafico(DadosTendencia: OleVariant; ExisteNossaEmpresa: boolean;
  NomeCargo, NomePesquisa: string; DataPesquisa: TDate; ValMenor, ValMenorReal,
  ValMaior, ValMaiorReal, Quartil1, Quartil1Real, Quartil3, Quartil3Real, Mediana,
  MedianaReal: integer; Media, MediaReal, Moda, ModaReal: double);

var
  frmChartPesq: TfrmChartPesq;

implementation

uses uSistema;

{$R *.DFM}

procedure ExibirGrafico(DadosTendencia: OleVariant; ExisteNossaEmpresa: boolean;
  NomeCargo, NomePesquisa: string; DataPesquisa: TDate; ValMenor, ValMenorReal,
  ValMaior, ValMaiorReal, Quartil1, Quartil1Real, Quartil3, Quartil3Real, Mediana,
  MedianaReal: integer; Media, MediaReal, Moda, ModaReal: double);
var
  I3: double;
  I2: integer;
  YMax: double;
  _CdsTendencia: TCMClientDataSet;
begin
  _CdsTendencia := TCMClientDataSet.Create(Application);

  _CdsTendencia.Data := DadosTendencia;

  with TfrmChartPesq.Create(Application) do
  begin
    // Gráfico dos Salários Reais
    Chart1.OpenDataEx(1,2,7);
    Chart1.ChartType := 2;
    Chart1.Legend[0] := 'Menor';
    Chart1.Legend[1] := '1.Quartil';
    Chart1.Legend[2] := 'Moda';
    Chart1.Legend[3] := 'Média';
    Chart1.Legend[4] := 'Mediana';
    Chart1.Legend[5] := '3.Quartil';
    Chart1.Legend[6] := 'Maior';
    Chart1.Decimals := 0;
    Chart1.Title[2] := Trim(NomePesquisa) +' - '+ Trim(DateToStr(DataPesquisa));

    Chart1.ThisSerie := 0;
    Chart1.SerLeg[0] := Sistema.NomeEmpresa;

    for I2:=0 to 6 do
      Chart1.Value[I2] := 0;

    YMax := 0;      
    if (ExisteNossaEmpresa) then
    begin
      YMax := _CdsTendencia.FieldByName('MAIORC').asFloat;
      Chart1.Value[0] := _CdsTendencia.FieldByName('MENORC').asFloat;
      Chart1.Value[1] := _CdsTendencia.FieldByName('PRIMQUAC').asFloat;
      Chart1.Value[2] := _CdsTendencia.FieldByName('MODAC').asFloat;
      Chart1.Value[3] := _CdsTendencia.FieldByName('MEDIAC').asFloat;
      Chart1.Value[4] := _CdsTendencia.FieldByName('MEDIANAC').asFloat;
      Chart1.Value[5] := _CdsTendencia.FieldByName('MEDIANAC').asFloat;
      Chart1.Value[6] := _CdsTendencia.FieldByName('MAIORC').asFloat;
    end;

    if (ValMaior > YMax) then
      YMax := ValMaior;

    Chart1.ThisSerie := 1;
    Chart1.SerLeg[1] := 'Mercado';
    Chart1.Value[0] := ValMenor;
    Chart1.Value[1] := Quartil1;
    Chart1.Value[2] := Moda;
    Chart1.Value[3] := Media;
    Chart1.Value[4] := Mediana;
    Chart1.Value[5] := Quartil3;
    Chart1.Value[6] := ValMaior;

    Chart1.Title[3] := Trim(NomeCargo)+ ' - Salário Real';

    I3 := 1;
    while (YMax > I3) do
      I3 := I3*10;

    I3 := Int(I3 / 20); // Escala de Y

    Chart1.Adm[1] := YMax; // Valor Máximo de Y
    Chart1.Adm[4] := I3; // Escala de Y

    Chart1.CloseData(1);

    // Gráfico dos Salários Nominais
    Chart2.OpenDataEx(1,2,7);
    Chart2.ChartType := 2;
    Chart2.Legend[0] := 'Menor';
    Chart2.Legend[1] := '1.Quartil';
    Chart2.Legend[2] := 'Moda';
    Chart2.Legend[3] := 'Média';
    Chart2.Legend[4] := 'Mediana';
    Chart2.Legend[5] := '3.Quartil';
    Chart2.Legend[6] := 'Maior';
    Chart2.Decimals := 0;
    Chart2.Title[2] := Trim(NomePesquisa) +' - '+ Trim(DateToStr(DataPesquisa));

    Chart2.ThisSerie := 0;
    Chart2.SerLeg[0] := Sistema.NomeEmpresa;

    for I2:=0 to 6 do
      Chart2.Value[I2] := 0;

    YMax := 0;
    if (ExisteNossaEmpresa) then
    begin
      YMax := _CdsTendencia.FieldByName('MAIOR_RC').asFloat;
      Chart2.Value[0] := _CdsTendencia.FieldByName('MENOR_RC').asFloat;
      Chart2.Value[1] := _CdsTendencia.FieldByName('PRIMQUA_RC').asFloat;
      Chart2.Value[2] := _CdsTendencia.FieldByName('MODA_RC').asFloat;
      Chart2.Value[3] := _CdsTendencia.FieldByName('MEDIA_RC').asFloat;
      Chart2.Value[4] := _CdsTendencia.FieldByName('MEDIANA_RC').asFloat;
      Chart2.Value[5] := _CdsTendencia.FieldByName('MEDIANA_RC').asFloat;
      Chart2.Value[6] := _CdsTendencia.FieldByName('MAIOR_RC').asFloat;
    end;

    if (ValMaiorReal > YMax) then
      YMax := ValMaiorReal;

    Chart2.ThisSerie := 1;
    Chart2.SerLeg[1] := 'Mercado';
    Chart2.Value[0] := ValMenorReal;
    Chart2.Value[1] := Quartil1Real;
    Chart2.Value[2] := ModaReal;
    Chart2.Value[3] := MediaReal;
    Chart2.Value[4] := MedianaReal;
    Chart2.Value[5] := Quartil3Real;
    Chart2.Value[6] := ValMaiorReal;

    Chart2.Title[3] := Trim(NomeCargo)+ ' - Salário Nominal';

    I3 := 1;
    while (YMax > I3) do
      I3 := I3*10;

    I3 := Int(I3 / 20); // Escala de Y

    Chart2.Adm[1] := YMax; // Valor Máximo de Y
    Chart2.Adm[4] := I3; // Escala de Y

    Chart2.CloseData(1);

    ShowModal;
    Free;
  end;

  _CdsTendencia.Free;
end;

end.
