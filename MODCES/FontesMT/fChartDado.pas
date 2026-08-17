unit fChartDado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc, OleCtrls, chartfx3, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, DBClient, uCMClientDataSet;

type
  TfrmChartDado = class(TfrmSairAjuda)
    Chart1: TChartfx;
    CdsTendencia: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
  public
    IdEntidade: double;
    NomePesquisa, NomeCargo, NomeEntidade: string;
  end;

var
  frmChartDado: TfrmChartDado;

implementation

{$R *.DFM}

procedure TfrmChartDado.FormShow(Sender: TObject);
var
  I3, YMax: double;
begin
  inherited;
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
  Chart1.Title[2] := NomePesquisa;

  YMax := CdsTendencia.FieldByName('MAIOR').asInteger;
  if (CdsTendencia.FieldByName('MAIOR_R').asInteger > YMax) then
    YMax := CdsTendencia.FieldByName('MAIOR_R').asInteger;

  Chart1.ThisSerie := 0;
  Chart1.SerLeg[0] := 'Nominal';
  Chart1.Value[0] := CdsTendencia.FieldByName('MENOR').asFloat;
  Chart1.Value[1] := CdsTendencia.FieldByName('PRIMQUA').asFloat;
  Chart1.Value[2] := CdsTendencia.FieldByName('MODA').asFloat;
  Chart1.Value[3] := CdsTendencia.FieldByName('MEDIA').asFloat;
  Chart1.Value[4] := CdsTendencia.FieldByName('MEDIANA').asFloat;
  Chart1.Value[5] := CdsTendencia.FieldByName('TERCQUA').asFloat;
  Chart1.Value[6] := CdsTendencia.FieldByName('MAIOR').asFloat;

  Chart1.ThisSerie := 1;
  Chart1.SerLeg[1] := 'Real';
  Chart1.Value[0] := CdsTendencia.FieldByName('MENOR_R').asFloat;
  Chart1.Value[1] := CdsTendencia.FieldByName('PRIMQUA_R').asFloat;
  Chart1.Value[2] := CdsTendencia.FieldByName('MODA_R').asFloat;
  Chart1.Value[3] := CdsTendencia.FieldByName('MEDIA_R').asFloat;
  Chart1.Value[4] := CdsTendencia.FieldByName('MEDIANA_R').asFloat;
  Chart1.Value[5] := CdsTendencia.FieldByName('TERCQUA_R').asFloat;
  Chart1.Value[6] := CdsTendencia.FieldByName('MAIOR_R').asFloat;

  Chart1.Title[3] := NomeCargo + ' - ';
  if (IdEntidade = 0) then
    Chart1.Title[3] := Chart1.Title[3] + '(Interno)'
  else
    Chart1.Title[3] := Chart1.Title[3] + NomeEntidade;

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); //Escala de Y

  Chart1.Adm[1] := YMax; // Valor Máximo de Y
  Chart1.Adm[4] := I3; // Escala de Y

  Chart1.CloseData(1);
  Chart1.Visible := true;
end;

end.
