unit FGrafRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, Db, DBTables, Wwquery,
  ComCtrls, Wwdatsrc, TeEngine, Series, TeeProcs, Chart, DBChart;

type
  TfrmGrafRenFix = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    dblEmissor: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgHistRenFix: TwwDBGrid;
    qryEmissor: TwwQuery;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDATAHISTRENFIX: TDateTimeField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDHISTRENFIX: TFloatField;
    qryEmissorIDEMISSOR: TFloatField;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryHistRenFix: TwwQuery;
    qryInvestimentoDESCINV: TStringField;
    qryInvestimentoIDOPERRENFIXAPLIC: TFloatField;
    dsHistRenFix: TwwDataSource;
    dbChartRenFix: TDBChart;
    qryAux: TwwQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    qryAuxIDHISTRENFIX: TFloatField;
    qryAuxIDCURVARENFIX: TFloatField;
    qryHistRenFixDATACURVA: TDateTimeField;
    qryHistRenFixDESCCURVA1: TStringField;
    qryHistRenFixVLRCURVA1: TFloatField;
    qryHistRenFixDESCCURVA2: TStringField;
    qryHistRenFixVLRCURVA2: TFloatField;
    Series1: TLineSeries;
    Series2: TLineSeries;
    qryMax: TwwQuery;
    qryMin: TwwQuery;
    qryMinMIN1: TFloatField;
    qryMinMIN2: TFloatField;
    qryMaxMAX1: TFloatField;
    qryMaxMAX2: TFloatField;
    qryInvestimentoCHAVE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dblEmissorExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrafRenFix: TfrmGrafRenFix;

implementation

uses UOperComum, UMensErro;

{$R *.DFM}

procedure TfrmGrafRenFix.FormShow(Sender: TObject);
begin
   inherited;
   qryEmissor.Open;
   OperComum.LimpaParametros(qryInvestimento);
   qryInvestimento.Open;

   dbChartRenFix.LeftAxis.Automatic := True;

end;

procedure TfrmGrafRenFix.dblEmissorExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(qryInvestimento);
   if Trim(dblEmissor.Text) <> '' then
      qryInvestimento.ParamByName('IDEMISSOR').AsInteger := qryEmissorIDEMISSOR.AsInteger;
   qryInvestimento.Open;
end;

procedure TfrmGrafRenFix.bbtnConfirmarClick(Sender: TObject);
var
   iCurva : Integer;

begin
  inherited;
   if Trim(dblInvestimento.Text) = '' then
   begin
      MsgDlg('O Investimento não foi informado.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus;
      exit;
   end
   else
   begin
      OperComum.LimpaParametros(qryHistRenFix);
      OperComum.LimpaParametros(qryMax);
      OperComum.LimpaParametros(qryMin);
      qryMax.ParamByName('IDOPERRENFIXAPLIC').AsInteger := qryInvestimentoIDOPERRENFIXAPLIC.AsInteger;
      qryMin.ParamByName('IDOPERRENFIXAPLIC').AsInteger := qryInvestimentoIDOPERRENFIXAPLIC.AsInteger;
      qryMax.Open;
      qryMin.Open;
      dbChartRenFix.LeftAxis.Automatic := True;
      dbChartRenFix.LeftAxis.Automatic := False;
      dbChartRenFix.LeftAxis.Minimum := 0;
      dbChartRenFix.LeftAxis.Maximum := 0;

      if qryMaxMAX1.AsFloat >= qryMaxMAX2.AsFloat then
         dbChartRenFix.LeftAxis.Maximum := qryMaxMAX1.AsFloat
      else
         dbChartRenFix.LeftAxis.Maximum := qryMaxMAX2.AsFloat;

      if (qryMinMIN2.AsFloat = 0) or (qryMinMIN1.AsFloat <= qryMinMIN2.AsFloat) then
         dbChartRenFix.LeftAxis.Minimum := qryMinMIN1.AsFloat
      else
         dbChartRenFix.LeftAxis.Minimum := qryMinMIN2.AsFloat;
      qryMax.Close;
      qryMin.Close;

      qryHistRenFix.ParamByName('IDOPERRENFIXAPLIC').AsInteger := qryInvestimentoIDOPERRENFIXAPLIC.AsInteger;
      qryHistRenFix.Open;
   end;
end;

end.
