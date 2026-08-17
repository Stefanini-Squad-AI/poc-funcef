unit FValorReal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, TREdit, IvDictio, IvMulti, IvEMulti, TB97Tlbr, FOkCancelar;

type
  TfrmValorReal = class(TfrmOkCancelar)
    sbtnCalcular: TBitBtn;
    pnlValor: TPanel;
    rgRateio: TRadioGroup;
    redValor: TRealEdit;
    dbgrObjetos: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrObjetosColEnter(Sender: TObject);
    procedure rgRateioClick(Sender: TObject);
    procedure sbtnCalcularClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValorReal: TfrmValorReal;
  Calculei: boolean;

implementation

uses fCadProcesso;

{$R *.DFM}

procedure TfrmValorReal.FormCreate(Sender: TObject);
begin
  inherited;
  frmCadProcesso.qryObjeto.Edit;
end;

procedure TfrmValorReal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  if (ModalResult = mrOk) then
//    frmCadProcesso.tblObjeto.Post
//  else
//    frmCadProcesso.tblObjeto.Cancel;
end;

procedure TfrmValorReal.dbgrObjetosColEnter(Sender: TObject);
begin
  inherited;
  frmCadProcesso.qryObjeto.Edit;
end;

procedure TfrmValorReal.rgRateioClick(Sender: TObject);
begin
  inherited;
  redValor.Visible     := (rgRateio.ItemIndex = 0);
  sbtnCalcular.Visible := (rgRateio.ItemIndex = 0);

  if (rgRateio.ItemIndex = 1) then
    frmValorReal.Caption := 'Confirme ou Altere o Valor Real de Cada Objeto'
  else
    frmValorReal.Caption := 'Informe o Valor Real Total';
end;

procedure TfrmValorReal.sbtnCalcularClick(Sender: TObject);
var
  TotCusto: double;
begin
  inherited;
  TotCusto := 0;
  Calculei := true;

  frmCadProcesso.qryObjeto.First;
  while not(frmCadProcesso.qryObjeto.EOF) do
  begin
    TotCusto := TotCusto + frmCadProcesso.qryObjetoVALORESPERADO.Value;
    frmCadProcesso.qryObjeto.Next;
  end;

  frmCadProcesso.qryObjeto.First;
  while not(frmCadProcesso.qryObjeto.EOF) and (TotCusto > 0) do
  begin
    frmCadProcesso.qryObjeto.Edit;
    frmCadProcesso.qryObjetoVALORSENTENCA.Value :=
      Round(frmCadProcesso.qryObjetoVALORESPERADO.Value * redValor.Value / TotCusto * 100) / 100;
    frmCadProcesso.qryObjeto.Post;
    frmCadProcesso.qryObjeto.Next;
  end;
  frmCadProcesso.qryObjeto.First;
end;

procedure TfrmValorReal.bbtnCancelarClick(Sender: TObject);
begin
  frmCadProcesso.qryObjeto.CancelUpdates;
  inherited;
end;

procedure TfrmValorReal.bbtnConfirmarClick(Sender: TObject);
begin
  if not(Calculei) and (rgRateio.ItemIndex = 0) then
    sbtnCalcularClick(Self);
  inherited;
end;

end.
