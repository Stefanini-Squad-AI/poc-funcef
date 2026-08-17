unit FChartPesq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, OleCtrls, chartfx3,
  FOkCancelar, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmChartPesq = class(TfrmSairAjuda)
    Chart1: TChartfx;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChartPesq: TfrmChartPesq;
  YMAX: double;
  
implementation

uses FTabPesqui, uSistema;

{$R *.DFM}

procedure TfrmChartPesq.FormShow(Sender: TObject);
var
  I3: double;
  I2: integer;
  TemNossa: boolean;
begin
  inherited;
  frmTabPesqui.tblTendencia.First;
  TemNossa := false;
  while not(frmTabPesqui.tblTendencia.EOF) do
  begin
    if (frmTabPesqui.tblTendenciaIDEMPRESAPARTIC.Value = Sistema.IdEmpresa) then
    begin
      TemNossa := true;
      break;
    end;

    frmTabPesqui.tblTendencia.Next;
  end;
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
  Chart1.Title[{TOPTIT}2] := Trim(frmTabPesqui.dblcPesq.Text) +' - '+ Trim(frmTabPesqui.edData.Text);

  if (frmTabPesqui.Vez = 1) then
  begin
    Chart1.ThisSerie := 0;
    Chart1.SerLeg[0] := Sistema.NomeEmpresa;
    YMAX := 0;

    for I2:=0 to 6 do
      Chart1.Value[I2] := 0;

    if (TemNossa) then
    begin
      YMAX := frmTabPesqui.tblTendenciaMAIOR.Value;
      Chart1.Value[0] := frmTabPesqui.tblTendenciaMENOR.Value;
      Chart1.Value[1] := frmTabPesqui.tblTendenciaPRIMQUA.Value;
      Chart1.Value[2] := frmTabPesqui.tblTendenciaMODA.Value;
      Chart1.Value[3] := frmTabPesqui.tblTendenciaMEDIA.Value;
      Chart1.Value[4] := frmTabPesqui.tblTendenciaMEDIANA.Value;
      Chart1.Value[5] := frmTabPesqui.tblTendenciaTERCQUA.Value;
      Chart1.Value[6] := frmTabPesqui.tblTendenciaMAIOR.Value;
    end;

    if (StrToFloat(frmTabPesqui.lblMAIOR.Caption) > YMAX) then
      YMAX := StrToFloat(frmTabPesqui.lblMAIOR.Caption);

    Chart1.ThisSerie := 1;
    Chart1.SerLeg[1] := 'Mercado';
    Chart1.Value[0]  := StrToFloat(frmTabPesqui.lblMENOR.Caption);
    Chart1.Value[1]  := StrToFloat(frmTabPesqui.lbl1Q.Caption);
    Chart1.Value[2]  := StrToFloat(frmTabPesqui.lblMODA.Caption);
    Chart1.Value[3]  := StrToFloat(frmTabPesqui.lblMEDIA.Caption);
    Chart1.Value[4]  := StrToFloat(frmTabPesqui.lblMEDIANA.Caption);
    Chart1.Value[5]  := StrToFloat(frmTabPesqui.lbl3Q.Caption);
    Chart1.Value[6]  := StrToFloat(frmTabPesqui.lblMAIOR.Caption);
  end
  else
  begin
    Chart1.ThisSerie := 0;
    Chart1.SerLeg[0] := Sistema.NomeEmpresa;
    YMAX := 0;

    for I2:=0 to 6 do
      Chart1.Value[I2] := 0;

    if (TemNossa) then
    begin
      YMAX := frmTabPesqui.tblTendenciaMAIOR_R.Value;
      Chart1.Value[0] := frmTabPesqui.tblTendenciaMENOR_R.Value;
      Chart1.Value[1] := frmTabPesqui.tblTendenciaPRIMQUA_R.Value;
      Chart1.Value[2] := frmTabPesqui.tblTendenciaMODA_R.Value;
      Chart1.Value[3] := frmTabPesqui.tblTendenciaMEDIA_R.Value;
      Chart1.Value[4] := frmTabPesqui.tblTendenciaMEDIANA_R.Value;
      Chart1.Value[5] := frmTabPesqui.tblTendenciaTERCQUA_R.Value;
      Chart1.Value[6] := frmTabPesqui.tblTendenciaMAIOR_R.Value;
    end;

    if (StrToFloat(frmTabPesqui.lblMAIORR.Caption) > YMAX) then
      YMAX := StrToFloat(frmTabPesqui.lblMAIORR.Caption);

    Chart1.ThisSerie := 1;
    Chart1.SerLeg[1] := 'Mercado';
    Chart1.Value[0]  := StrToFloat(frmTabPesqui.lblMENORR.Caption);
    Chart1.Value[1]  := StrToFloat(frmTabPesqui.lbl1QR.Caption);
    Chart1.Value[2]  := StrToFloat(frmTabPesqui.lblMODAR.Caption);
    Chart1.Value[3]  := StrToFloat(frmTabPesqui.lblMEDIAR.Caption);
    Chart1.Value[4]  := StrToFloat(frmTabPesqui.lblMEDIANAR.Caption);
    Chart1.Value[5]  := StrToFloat(frmTabPesqui.lbl3QR.Caption);
    Chart1.Value[6]  := StrToFloat(frmTabPesqui.lblMAIORR.Caption);
  end;
  Chart1.Title[{BOTTOMTIT}3] := trim(frmTabPesqui.dblcCargo.Text);

  if (frmTabPesqui.Vez = 1) then
    Chart1.Title[3] := Chart1.Title[3] + ' - Salário Nominal'
  else
    Chart1.Title[3] := Chart1.Title[3] + ' - Salário Real';

  I3 := 1;
  while (YMAX > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20);      {Escala de Y}

  Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
  Chart1.Adm[4] := I3;      {Escala de Y}

  Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
  Chart1.Visible := true;
end;

end.
