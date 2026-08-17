//******************************************************************************
// Data     : 11/07/2005
// Código   : AL_2
// Motivo   : Implementação de relatório conforme os tipos de fundos
//******************************************************************************
// Data     : 18/05/2005
// Código   : AL_1
// Motivo   : Criação da Variável dDataAnt
//******************************************************************************
// Data     : 10/04/2005
// Motivo   : Implemetação da Consulta : Mapa de Investimentos em Fundos
//******************************************************************************

unit FParamMapaInvFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, FPreview, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Db;

type
  TfrmParamMapaInvFdo = class(TfrmOkCancelarInv)
    pnlFundo1: TPanel;
    lblDtIni: TLabel;
    Label2: TLabel;
    lblPlanoPatro: TLabel;
    dtDataInicio: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    lblFundoInvest: TLabel;
    dblkFundoInvest: TwwDBLookupCombo;
    lblDtFim: TLabel;
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
  frmParamMapaInvFdo: TfrmParamMapaInvFdo;

implementation

uses FDmRelMapaInvFdo, UMensErro, UOperComum, uBibliotecaInvest;

{$R *.DFM}

procedure TfrmParamMapaInvFdo.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

procedure TfrmParamMapaInvFdo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelMapaInvFdo.qryPlanPrevCtbPatr.Close;
   DmRelMapaInvFdo.qryFundoInvest.Close;
   //AL_2
   DmRelMapaInvFdo.qryMapaInvFdoSintetico.Close;
   DmRelMapaInvFdo.qryTipoInvest.Close;
   DmRelMapaInvFdo.qryMapaInvFdoAnalitico.Close;
end;

procedure TfrmParamMapaInvFdo.FormShow(Sender: TObject);
begin
  inherited;
   with OperComum, DmRelMapaInvFdo do
   begin
      LimpaParametros(qryPlanPrevCtbPatr);
      qryPlanPrevCtbPatr.Open;
      LimpaParametros(qryTipoInvest);
      qryTipoInvest.Open;
      LimpaParametros(qryFundoInvest);
      qryFundoInvest.Open;
   end;
end;

procedure TfrmParamMapaInvFdo.bbtnConfirmarClick(Sender: TObject);
var
   dDataAnt : TDateTime;
begin
  inherited;
   if Trim(dtDataInicio.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataInicio.CanFocus then
         dtDataInicio.SetFocus;
      Exit;
   end
   else if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end
   else if (dtDataFim.Date < dtDataInicio.Date) then
   begin
      MsgDlg('A Data Final não pode ser menor que a Data Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Exit;
   end;

   with DmRelMapaInvFdo, DmRelMapaInvFdo.qryMapaInvFdoSintetico do
   begin
      OperComum.LimpaParametros(qryMapaInvFdoSintetico);
      ParamByName('DATAINI').AsString := dtDataInicio.Text;
      //AL_1
      dDataAnt := StrToDate(dtDataInicio.Text) - 1;
      ParamByName('DATAANT').AsString := DateToStr(dDataAnt);
      ParamByName('DATAFIM').AsString := dtDataFim.Text;
      if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
      if Trim(dblkFundoInvest.Text) <> ''  then
         ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblkFundoInvest.LookupValue);
      Open;

      if not IsEmpty then
      begin
         with DmRelMapaInvFdo.qryMapaInvFdoAnalitico do
         begin
            OperComum.LimpaParametros(qryMapaInvFdoAnalitico);
            ParamByName('DATAINI').AsString := dtDataInicio.Text;
            ParamByName('DATAANT').AsString := DateToStr(dtDataInicio.Date - 1);
            ParamByName('DATAFIM').AsString := dtDataFim.Text;
            if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
               ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
            if Trim(dblkFundoInvest.Text) <> ''  then
               ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblkFundoInvest.LookupValue);
            Open;
         end;

         lblPeriodo.Caption := dtDataInicio.Text + ' a ' + dtDataFim.Text;
         if not fModal then
            TfrmPreview.CreateModalPreview(Application,
                                           rptMapaInvestFdo,
                                           rptMapaInvestFdo.PrinterSetup.DocumentName)
         else
            rptMapaInvestFdo.PrintToDevices;
      end
      else
      begin
         MsgDlg('Nenhum saldo foi encontrado neste período !','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dtDataInicio.CanFocus then
            dtDataInicio.SetFocus;
      end;
   end;

   if fModal then
      bbtnSair.Click;
end;

end.
