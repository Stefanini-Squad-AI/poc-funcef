//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_1
// Motivo   : Implementação do Relatório de Consulta Anúncios no Período
//******************************************************************************

unit FParamAnuncPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, FPreview;

type
  TfrmParamAnuncPeriodo = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    dtDataFim: TCMDateTimePicker;
    lblDtFim: TLabel;
    lblDtIni: TLabel;
    dtDataIni: TCMDateTimePicker;
    dblkTpOper: TwwDBLookupCombo;
    lblTipoOper: TLabel;
    dblkInvest: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    lblTipoAnunc: TLabel;
    dblkTipoAnuncio: TwwDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
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
  frmParamAnuncPeriodo: TfrmParamAnuncPeriodo;

implementation

uses FDmRelAnuncPeriodo, UMensErro, UOperComum;

{$R *.DFM}

procedure TfrmParamAnuncPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelAnuncPeriodo.qryTipoOperacao.Close;
   DmRelAnuncPeriodo.qryTipoAnuncio.Close;
   DmRelAnuncPeriodo.qryInvestimento.Close;
   DmRelAnuncPeriodo.qryAnuncPeriodo.Close;   
end;

procedure TfrmParamAnuncPeriodo.FormShow(Sender: TObject);
begin
  inherited;
   DmRelAnuncPeriodo.qryTipoOperacao.Open;
   DmRelAnuncPeriodo.qryInvestimento.Open;
   DmRelAnuncPeriodo.qryTipoAnuncio.Open;
end;

procedure TfrmParamAnuncPeriodo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   if Trim(dtDataIni.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataIni.CanFocus then
         dtDataIni.SetFocus;
      Exit;
   end
   else if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end
   else if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('A Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      dtDataFim.Text := dtDataIni.Text;
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end;

   with DmRelAnuncPeriodo, DmRelAnuncPeriodo.qryAnuncPeriodo, OperComum do
   begin
      LimpaParametros(qryAnuncPeriodo);
      if Trim(dtDataIni.Text) <> '' then
         ParamByName('DATAINI').AsString := dtDataIni.Text;
      if Trim(dtDataFim.Text) <> '' then
         ParamByName('DATAFIM').AsString := dtDataFim.Text;
      if Trim(dblkTpOper.Text) <> '' then
         ParamByName('IDTIPOOPERACAO').AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
      if Trim(dblkTipoAnuncio.Text) <> '' then
         ParamByName('IDTIPOANUNCIO').AsInteger := qryTipoAnuncioIDTIPOOPERACAO.AsInteger;
      if Trim(dblkInvest.Text) <> '' then
         ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      Open;

      if not IsEmpty then
      begin
         qryAnuncPeriodo.DisableControls;
         if not fModal then
            TFrmPreview.CreateModalPreview(Application,
                                           rptAnuncPeriodo,
                                           rptAnuncPeriodo.PrinterSetup.DocumentName)
         else
            rptAnuncPeriodo.PrintToDevices;

         qryAnuncPeriodo.EnableControls;
      end;
   end;
   if fModal then
      bbtnSair.Click;
end;

procedure TfrmParamAnuncPeriodo.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

end.
