//******************************************************************************
// Data     : 10/04/2005
// Motivo   : Implemetação da Consulta : Mapa de Investimentos em Fundos
//******************************************************************************

unit FParamMapaInvFdoAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel,
  ExtCtrls, FPreview;

type
  TfrmParamMapaInvFdoAcoes = class(TfrmOkCancelarInv)
    lblDtIni: TLabel;
    dtDataInicio: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    lblDtFim: TLabel;
    Label2: TLabel;
    lblPlanoPatro: TLabel;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    lblFundoInvest: TLabel;
    dblkFundoInvest: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  frmParamMapaInvFdoAcoes: TfrmParamMapaInvFdoAcoes;

implementation

uses FDmRelMapaInvFdo, UMensErro, UOperComum, uBibliotecaInvest;

{$R *.DFM}

procedure TfrmParamMapaInvFdoAcoes.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

procedure TfrmParamMapaInvFdoAcoes.FormShow(Sender: TObject);
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

procedure TfrmParamMapaInvFdoAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelMapaInvFdo.qryPlanPrevCtbPatr.Close;
   DmRelMapaInvFdo.qryFundoInvest.Close;
   DmRelMapaInvFdo.qryMapaInvestFdoOutros.Close;
   DmRelMapaInvFdo.qryTipoInvest.Close;
   DmRelMapaInvFdo.qryMapaInvestFdoOutrosAn.Close;
end;

procedure TfrmParamMapaInvFdoAcoes.bbtnConfirmarClick(Sender: TObject);
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

   with DmRelMapaInvFdo, DmRelMapaInvFdo.qryMapaInvestFdoOutros do
   begin
      OperComum.LimpaParametros(qryMapaInvestFdoOutros);
      ParamByName('DATAINI').AsString := dtDataInicio.Text;
      dDataAnt := StrToDate(dtDataInicio.Text) - 1;
      ParamByName('DATAANT').AsString := DateToStr(dDataAnt);
      ParamByName('DATAFIM').AsString := dtDataFim.Text;
      ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

      if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
      if Trim(dblkFundoInvest.Text) <> ''  then
         ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblkFundoInvest.LookupValue);

      Open;
      if not IsEmpty then
      begin
         with DmRelMapaInvFdo.qryMapaInvestFdoOutrosAn do
         begin
            OperComum.LimpaParametros(qryMapaInvestFdoOutrosAn);
            ParamByName('DATAINI').AsString := dtDataInicio.Text;
            ParamByName('DATAANT').AsString := DateToStr(dtDataInicio.Date - 1);
            ParamByName('DATAFIM').AsString := dtDataFim.Text;
            ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

            if Trim(dblPlanPrevCtbPatr.Text) <> ''  then
               ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);
            if Trim(dblkFundoInvest.Text) <> ''  then
               ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblkFundoInvest.LookupValue);

            Open;
         end;

         lblPeriodo.Caption := dtDataInicio.Text + ' a ' + dtDataFim.Text;
         if not fModal then
            TfrmPreview.CreateModalPreview(Application,
                                           rptMapaInvestFdoOutros,
                                           rptMapaInvestFdoOutros.PrinterSetup.DocumentName)
         else
            rptMapaInvestFdoOutros.PrintToDevices;
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
