//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_1
// Motivo   : Implementação do Relatório de Consulta à Composição da Carteira
//******************************************************************************

unit FParamConsCompCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, FPreview;

type
  TfrmParamConsCompCarteira = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    Label3: TLabel;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    dtDataRef: TCMDateTimePicker;
    lblDtIni: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    bModal: Boolean;
    procedure SetModal(bMod: Boolean);
  public
    { Public declarations }
  published
    { Published declarations }
     Property fModal: boolean read bModal write SetModal;
  end;

var
  frmParamConsCompCarteira: TfrmParamConsCompCarteira;

implementation

uses UOperComum, UMensErro, FDMConsComposicaoCarteira;

{$R *.DFM}

procedure TfrmParamConsCompCarteira.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

procedure TfrmParamConsCompCarteira.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if Trim(dtDataRef.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
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

      if not IsEmpty then
      begin
         lblPeriodo.Caption := dtDataRef.Text ;
         if not fModal then
            TfrmPreview.CreateModalPreview(Application,
                                           rptComposicaoCarteira,
                                           rptComposicaoCarteira.PrinterSetup.DocumentName)
         else
            rptComposicaoCarteira.PrintToDevices;
      end
      else
      begin
         MsgDlg('Nenhum saldo foi encontrado neste período.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dtDataRef.CanFocus then
            dtDataRef.SetFocus;
      end;
   end;
   
   if fModal then
      bbtnSair.Click;
end;

procedure TfrmParamConsCompCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DMConsComposicaoCarteira.qryPlanPrevCtbPatr.Close;
   DMConsComposicaoCarteira.qryConsCompCarteira.Close;
end;

procedure TfrmParamConsCompCarteira.FormShow(Sender: TObject);
begin
  inherited;
   DMConsComposicaoCarteira.qryPlanPrevCtbPatr.Open;
end;

end.
