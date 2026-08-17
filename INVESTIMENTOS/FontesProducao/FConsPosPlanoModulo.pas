unit FConsPosPlanoModulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TeEngine, Series, TeeProcs, Chart,
  DBChart, ComCtrls, Db, DBTables, Wwquery, FPreview;

type
  TfrmConsPosPlanoModulo = class(TfrmOkCancelarRelInv)
    Panel1: TPanel;
    Label2: TLabel;
    edData: TCMDateTimePicker;
    PageControl1: TPageControl;
    tbsDados: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    tbsPercPlano: TTabSheet;
    tbsPercCart: TTabSheet;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    DBChart2: TDBChart;
    PieSeries1: TPieSeries;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwDBGrid1TopRowChanged(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPosPlanoModulo: TfrmConsPosPlanoModulo;

implementation

uses FDmRelPosPlanoModulo, UOperComum;

{$R *.DFM}

procedure TfrmConsPosPlanoModulo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  with DmRelPosPlanoModulo do
  begin
     OperComum.LimpaParametros(qryPosicao);
     OperComum.LimpaParametros(qryPercPlano);
     OperComum.LimpaParametros(qryPercCarteira);

     if Trim(edData.Text) <> '' then
     begin
        qryPosicao.ParamByName('DATAREF').AsString := edData.Text;
        qryPercPlano.ParamByName('DATAREF').AsString := edData.Text;
        qryPercCarteira.ParamByName('DATAREF').AsString := edData.Text;

        qryPosicao.Open;
        qryPercPlano.Open;
        qryPercCarteira.Open;
     end;
  end;
end;

procedure TfrmConsPosPlanoModulo.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF // amarelo
         else
            ABrush.Color := clWhite;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsPosPlanoModulo.wwDBGrid1TopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

procedure TfrmConsPosPlanoModulo.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   with DmRelPosPlanoModulo do
   begin
      try
         qryPosicao.DisableControls;
         qryPercPlano.DisableControls;
         qryPercCarteira.DisableControls;

         lblDataRef.Caption := edData.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        rptPosPlanoModulo,
                                        rptPosPlanoModulo.PrinterSetup.DocumentName);
      finally
         qryPosicao.EnableControls;
         qryPercPlano.EnableControls;
         qryPercCarteira.EnableControls;
      end;
   end;
end;

end.
