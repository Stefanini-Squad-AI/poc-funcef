//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_1
// Motivo   : Implementação do Relatório de Consulta à Composição da Carteira
//******************************************************************************
unit FConsComposicaoCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, FPreview;

type
  TfrmConsComposicaoCarteira = class(TfrmOkCancelarRelInv)
    pnlConsulta: TPanel;
    lblDataRef: TLabel;
    dtDataRef: TCMDateTimePicker;
    dbgAnuncRel: TwwDBGrid;
    Label3: TLabel;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Abrequery;
  end;

var
  frmConsComposicaoCarteira: TfrmConsComposicaoCarteira;

implementation

uses FDMConsComposicaoCarteira,  UOperComum, UMensErro;

{$R *.DFM}

procedure TfrmConsComposicaoCarteira.AbreQuery;
begin
   if Trim(dtDataRef.Text) = '' then
   begin
      MsgDlg('Data não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataRef.CanFocus then
         dtDataRef.SetFocus;
      Exit;
   end;

   with DMConsComposicaoCarteira, DMConsComposicaoCarteira.qryConsCompCarteira, OperComum do
   begin
      LimpaParametros(qryConsCompCarteira);
      if Trim(dtDataRef.Text) <> '' then
         ParamByName('DATAREF').AsString := dtDataRef.Text;
      if Trim(dblPlanPrevCtbPatr.Text) <> '' then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      Open;
   end;
end;

procedure TfrmConsComposicaoCarteira.FormShow(Sender: TObject);
begin
  inherited;
   DMConsComposicaoCarteira.qryPlanPrevCtbPatr.Open;
end;

procedure TfrmConsComposicaoCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DMConsComposicaoCarteira.qryPlanPrevCtbPatr.Close;
end;

procedure TfrmConsComposicaoCarteira.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   with DMConsComposicaoCarteira do
   begin
      qryConsCompCarteira.DisableControls;

      TFrmPreview.CreateModalPreview(Application,
                                     rptComposicaoCarteira,
                                     rptComposicaoCarteira.PrinterSetup.DocumentName);

      qryConsCompCarteira.EnableControls;
   end;
end;

procedure TfrmConsComposicaoCarteira.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   AbreQuery
end;

end.
