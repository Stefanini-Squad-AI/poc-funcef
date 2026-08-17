unit FValorReal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, TREdit, IvDictio, IvMulti, IvEMulti, TB97Tlbr, FOkCancelar;

type
  TfrmValorReal = class(TfrmOkCancelar)
    wwDBGrid1: TwwDBGrid;
    pnlValor: TPanel;
    rgRateio: TRadioGroup;
    redValor: TRealEdit;
    sbtnCalcular: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBGrid1ColEnter(Sender: TObject);
    procedure rgRateioClick(Sender: TObject);
    procedure sbtnCalcularClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValorReal: TfrmValorReal;
  Calculei : Boolean;

implementation

uses FCadProcesso;

{$R *.DFM}

procedure TfrmValorReal.FormCreate(Sender: TObject);
begin
  inherited;
  frmCadProcesso.tblObjeto.Edit;
end;

procedure TfrmValorReal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  if ModalResult = mrOk then frmCadProcesso.tblObjeto.Post
//  else frmCadProcesso.tblObjeto.Cancel;
end;

procedure TfrmValorReal.wwDBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  frmCadProcesso.tblObjeto.Edit;
end;

procedure TfrmValorReal.rgRateioClick(Sender: TObject);
begin
  inherited;
  redValor.Visible := (rgRateio.ItemIndex = 0);
  sbtnCalcular.Visible := (rgRateio.ItemIndex = 0);
  if (rgRateio.ItemIndex = 1) then
     frmValorReal.Caption :=  'Confirme ou Altere o Valor Real de Cada Objeto'
  else
     frmValorReal.Caption :=  'Informe o Valor Real Total';
end;

procedure TfrmValorReal.sbtnCalcularClick(Sender: TObject);
var
  TotCusto : Double;
begin
  inherited;
  TotCusto := 0;
  Calculei := True;
  frmCadProcesso.tblObjeto.First;
  while  not  frmCadProcesso.tblObjeto.Eof  do  begin
      TotCusto := TotCusto + frmCadProcesso.tblObjetoVALORESPERADO.Value;
      frmCadProcesso.tblObjeto.Next;
  end;
  frmCadProcesso.tblObjeto.First;
  while  (not frmCadProcesso.tblObjeto.Eof) and (TotCusto > 0)  do  begin
      frmCadProcesso.tblObjeto.Edit;
      frmCadProcesso.tblObjetoVALORSENTENCA.Value :=
         round(frmCadProcesso.tblObjetoVALORESPERADO.Value *
               redValor.Value / TotCusto * 100) / 100;
      frmCadProcesso.tblObjeto.Post;
      frmCadProcesso.tblObjeto.Next;
  end;
  frmCadProcesso.tblObjeto.First;
end;

procedure TfrmValorReal.bbtnConfirmarClick(Sender: TObject);
begin
  if (not Calculei) and (rgRateio.ItemIndex = 0) then sbtnCalcularClick(Self);
  inherited;

end;

end.
