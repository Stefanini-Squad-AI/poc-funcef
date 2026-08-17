unit FRADConsultaCotasPatrim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TeEngine, Series, TeeProcs, Chart, DBChart,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  uCtrlRadConsModulos, uCtrlPadroes, ImgList;

type
  TfrmRADConsultaCotasPatrim = class(TfrmSairAjuda)
    pnlGrid: TPanel;
    Splitter: TSplitter;
    pnlChart: TPanel;
    dtsCotas: TwwDataSource;
    cdsCotas: TCMClientDataSet;
    dbgrdCotas: TwwDBGrid;
    DBChart: TDBChart;
    Series1: TLineSeries;
    Panel1: TPanel;
    Label1: TLabel;
    edtDataCota: TEdit;
    edtValorCota: TEdit;
    Label2: TLabel;
    cdsGrafico: TCMClientDataSet;
    Panel2: TPanel;
    shpEtapa1: TShape;
    lblEtapa1: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Label4: TLabel;
    Shape2: TShape;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Image2: TImage;
    imlGrid: TImageList;
    Bevel1: TBevel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsCotasAfterOpen(DataSet: TDataSet);
    procedure dbgrdCotasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    CtrlRadConsultaCotasPatrim : TCtrlRadConsultaCotasPatrim;
  public
    IdProcesso : integer;
    IdCpValorCota : integer;
    iIdSeqRecalculo : integer;

    aVariacaoAbaixo : array of integer;
    aVariacaoAcima  : array of integer;

    procedure SelecionarCotasPatrim;
    function EstaNoArray( iId : integer; aArray : array of integer ) : boolean;
  end;

var
  frmRADConsultaCotasPatrim: TfrmRADConsultaCotasPatrim;

implementation

{$R *.DFM}

{ TfrmRADConsultaCotasPatrim }

procedure TfrmRADConsultaCotasPatrim.SelecionarCotasPatrim;
var
  fValAnt, fVariacao, fMax, fMin : extended;
begin
  cdsCotas.Data   := CtrlRadConsultaCotasPatrim.ConsultaCotasPeloProcesso( IdProcesso, False );
  cdsGrafico.Data := CtrlRadConsultaCotasPatrim.ConsultaCotasPeloProcesso( IdProcesso, True );

  if cdsCotas.IsEmpty then
    exit;

  cdsCotas.DisableControls;
  cdsGrafico.DisableControls;
  try
    cdsCotas.Locate( 'IDPROCESSO', IdProcesso, [] );
    IdCpValorCota     := cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger;
    iIdSeqRecalculo   := cdsCotas.FieldByName('SEQRECALCULO').AsInteger;
    edtDataCota.Text  := FormatDateTime( 'dd/mm/yyyy', cdsCotas.FieldByName('DTCOTA').AsDateTime );
    edtValorCota.Text := FormatFloat( '#,##0.000000', cdsCotas.FieldByName('VALOR').AsFloat );

    SetLength( aVariacaoAbaixo, 0 );
    SetLength( aVariacaoAcima, 0 );
    fValAnt := 0;

    cdsCotas.Last;
    while not cdsCotas.Bof do
    begin

      if fValAnt <> 0 then
      begin
        fVariacao := ( ( ( cdsCotas.FieldByName('VALOR').AsFloat / fValAnt ) - 1 ) * 100 );
        if fVariacao > 0 then
        begin
          if fVariacao >= cdsCotas.FieldByName('VLLIMACIMA').AsFloat then
          begin
            SetLength( aVariacaoAcima, length( aVariacaoAcima ) + 1 );
            aVariacaoAcima[ High( aVariacaoAcima ) ] := cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger;
          end;
        end;
        if fVariacao < 0 then
        begin
          if fVariacao <= cdsCotas.FieldByName('VLLIMABAIXO').AsFloat then
          begin
            SetLength( aVariacaoAbaixo, length( aVariacaoAbaixo ) + 1 );
            aVariacaoAbaixo[ High( aVariacaoAbaixo ) ] := cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger;
          end;
        end;

      end;
      fValAnt := cdsCotas.FieldByName('VALOR').AsFloat;

      cdsCotas.Prior;
    end;
    cdsCotas.First;   


    fMin := cdsGrafico.FieldByName('VALOR').AsFloat;
    fMax := cdsGrafico.FieldByName('VALOR').AsFloat;
    cdsGrafico.First;
    while not cdsGrafico.Eof do
    begin

      if cdsGrafico.FieldByName('VALOR').AsFloat < fMin then
        fMin := cdsGrafico.FieldByName('VALOR').AsFloat;
      if cdsGrafico.FieldByName('VALOR').AsFloat > fMax then
        fMax := cdsGrafico.FieldByName('VALOR').AsFloat;

      cdsGrafico.Next;
    end;
    cdsGrafico.First;

  finally
    cdsCotas.EnableControls;
    cdsGrafico.EnableControls;
  end;

  try
    DBChart.Series[0].RefreshSeries;
    DBChart.LeftAxis.Minimum := -999999;
    DBChart.LeftAxis.Maximum :=  999999;
    DBChart.LeftAxis.Minimum := fMin;
    DBChart.LeftAxis.Maximum := fMax;
    DBChart.Series[0].RefreshSeries;
  except
  end;
end;

procedure TfrmRADConsultaCotasPatrim.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRadConsultaCotasPatrim := TCtrlRadConsultaCotasPatrim.Create;
  CtrlRadConsultaCotasPatrim.InitializeAs(Padroes);
end;

procedure TfrmRADConsultaCotasPatrim.FormDestroy(Sender: TObject);
begin
  CtrlRadConsultaCotasPatrim.Free;
  inherited;
end;

procedure TfrmRADConsultaCotasPatrim.cdsCotasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('DTCOTA') ).DisplayFormat     := 'dd/mm/yyyy';
  TFloatField( DataSet.FieldByName('PATRIMONIO') ).DisplayFormat := '#,##0.00';
  TFloatField( DataSet.FieldByName('TOTALCOTAS') ).DisplayFormat := '#,##0.000000';
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat      := '#,##0.000000';
  TFloatField( DataSet.FieldByName('DTCALCULO') ).DisplayFormat  := 'dd/mm/yyyy hh:nn';
end;

procedure TfrmRADConsultaCotasPatrim.dbgrdCotasCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if not ( gdSelected in State ) then
  begin
    if cdsCotas.FieldByName('IDPROCESSO').AsInteger = IdProcesso then
      AFont.Color:= clBlue;
    if iIdSeqRecalculo > 0 then
      if cdsCotas.FieldByName('SEQRECALCULO').AsInteger = iIdSeqRecalculo then
        AFont.Color:= clBlue;

    if EstaNoArray( cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger, aVariacaoAcima ) then
      ABrush.Color := clLime;

    if EstaNoArray( cdsCotas.FieldByName('IDCPVALORCOTA').AsInteger, aVariacaoAbaixo ) then
      ABrush.Color := clRed;
  end;
end;

function TfrmRADConsultaCotasPatrim.EstaNoArray(iId: integer; aArray: array of integer): boolean;
var
  i : integer;
begin
  Result := False;
  for i := 0 to High( aArray ) do
    if aArray[i] = iId then
    begin
      Result := True;
      exit;
    end;
end;

end.
