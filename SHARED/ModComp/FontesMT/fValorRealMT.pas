unit fValorRealMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlValorReal;

type
  TfrmValorRealMT = class(TfrmOkCancelar)
    sbtnCalcular: TBitBtn;
    pnlValor: TPanel;
    rgRateio: TRadioGroup;
    redValor: TRealEdit;
    dbgrObjetos: TwwDBGrid;
    CdsValorReal: TCMClientDataSet;
    dsValorReal: TwwDataSource;
    procedure dbgrObjetosColEnter(Sender: TObject);
    procedure rgRateioClick(Sender: TObject);
    procedure sbtnCalcularClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsValorRealAfterScroll(DataSet: TDataSet);
  private
    CtrlValorReal: TCtrlValorReal;

    bCalculei: boolean;
  public
    class function ExibirCalculoValorReal(CdsObjetos: TCMClientDataSet): boolean;
  end;

var
  frmValorRealMT: TfrmValorRealMT;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TfrmValorRealMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlValorReal := TCtrlValorReal.Create;
  CtrlValorReal.InitializeAs(Padroes);
  CtrlValorReal.CdsValorReal := CdsValorReal;

  bCalculei := false;
end;

procedure TfrmValorRealMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlValorReal);
  inherited;
end;

procedure TfrmValorRealMT.CdsValorRealAfterScroll(DataSet: TDataSet);
begin
  dbgrObjetosColEnter(nil);
end;

procedure TfrmValorRealMT.dbgrObjetosColEnter(Sender: TObject);
begin
  CdsValorReal.Edit;
end;

procedure TfrmValorRealMT.rgRateioClick(Sender: TObject);
begin
  redValor.Visible := (rgRateio.ItemIndex = 0);
  sbtnCalcular.Visible := (rgRateio.ItemIndex = 0);

  if (rgRateio.ItemIndex = 1) then
    Caption := 'Confirme ou Altere o Valor Real de Cada Objeto'
  else
    Caption := 'Informe o Valor Real Total';
end;

procedure TfrmValorRealMT.sbtnCalcularClick(Sender: TObject);
begin
  CtrlValorReal.CalcularValorReal(redValor.Value);
  bCalculei := true;
end;

procedure TfrmValorRealMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not(bCalculei) and (rgRateio.ItemIndex = 0) then
    sbtnCalcularClick(Self);
  inherited;
end;

procedure TfrmValorRealMT.bbtnCancelarClick(Sender: TObject);
begin
  CdsValorReal.CancelUpdates;
  inherited;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

class function TfrmValorRealMT.ExibirCalculoValorReal(CdsObjetos: TCMClientDataSet): boolean;
var
  dValTotRateio: double;
begin
  with TfrmValorRealMT.Create(Application) do
  begin
    CdsValorReal.Data := CdsObjetos.Data;
    dValTotRateio := 0;
    CdsValorReal.First;
    while not(CdsValorReal.EOF) do
    begin
      dValTotRateio := dValTotRateio + CdsValorReal.FieldByName('VALORSENTENCA').asFloat;
      CdsValorReal.Next;
    end;
    redValor.Value := dValTotRateio;
    TFloatField(CdsValorReal.FieldByName('VALORSENTENCA')).DisplayFormat := '###,###,##0.00';
    TFloatField(CdsValorReal.FieldByName('VALORPROVAVEL')).DisplayFormat := '###,###,##0.00';
    Result := (ShowModal = mrOk);
    CdsObjetos.Data := CdsValorReal.Data;
    Free;
  end;
end;

end.
