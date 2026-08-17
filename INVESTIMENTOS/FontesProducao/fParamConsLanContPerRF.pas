//******************************************************************************
// Data      : 10/03/2006
// Alteração : AL_4
// Motivo    : Acerto na abertura da consulta pelo menu de relatórios que estava apresentando
//             mensagem de erro (Modal)
//******************************************************************************
// Data     : 02/03/2005
// Motivo   : Implementação do Form
//******************************************************************************

unit fParamConsLanContPerRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  FPreview;

type
  TfrmParamConsLanContPerRF = class(TfrmOkCancelar)
    lblDtIni: TLabel;
    dtDataIni: TCMDateTimePicker;
    dtDataFim: TCMDateTimePicker;
    lblDtFim: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblOperacao: TwwDBLookupCombo;
    lblOperacao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dtDataIniExit(Sender: TObject);
    procedure dtDataFimExit(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure dblInvestimentoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sInvestimento: String;
    clCorLinha: TColor;
    bModal: Boolean;
    procedure SetModal(bMod: Boolean);
    function ValidaCampos: boolean;
    procedure BuscaOperacoesXInvest(iIdInvestimento: Integer);
  public
    { Public declarations }
  published
    { Published declarations }
     Property fModal: boolean read bModal write SetModal;
  end;

var
  frmParamConsLanContPerRF: TfrmParamConsLanContPerRF;

const clCorAmarelo: TColor = $00C0FFFF;

implementation

uses FDmRelLanContPerRF, uMensErro, UOperComum, UBibliotecaInvest, uString;

{$R *.DFM}

procedure TfrmParamConsLanContPerRF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelLanContPerRF.qryLancContPerRF.Close;
   DmRelLanContPerRF.qryInvestimento.Close;
   DmRelLanContPerRF.qryOperacao.Close;
end;

procedure TfrmParamConsLanContPerRF.FormShow(Sender: TObject);
begin
  inherited;
   dtDataIni.Date := pRPI.DATAULTFECHRF;
   dtDataFim.Date := pRPI.DATAULTFECHRF;
   DmRelLanContPerRF.qryInvestimento.Open;
   OperComum.LimpaParametros(DmRelLanContPerRF.qryOperacao);
   DmRelLanContPerRF.qryOperacao.Open;
end;

procedure TfrmParamConsLanContPerRF.dtDataIniExit(Sender: TObject);
begin
  inherited;
   if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      dtDataFim.Date := dtDataIni.Date
   end;
end;

procedure TfrmParamConsLanContPerRF.dtDataFimExit(Sender: TObject);
begin
  inherited;
   if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      dtDataFim.Date := dtDataIni.Date
   end;
end;

function TfrmParamConsLanContPerRF.ValidaCampos : boolean;
begin
   Result := True;

   if Trim(dtDataIni.Text) = '' then
   begin
      MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataIni.CanFocus then
         dtDataIni.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dtDataFim.Text) = '' then
   begin
      MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Result := False;
      Exit;
   end
   else
   if dtDataFim.Date < dtDataIni.Date then
   begin
      MsgDlg('Data Final não pode ser menor que a Inicial.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtDataFim.CanFocus then
         dtDataFim.SetFocus;
      Result := False;
      Exit;
   end;
end;

procedure TfrmParamConsLanContPerRF.BuscaOperacoesXInvest(iIdInvestimento: Integer);
begin
  inherited;
   DmRelLanContPerRF.qryLancContPerRF.Close;
   OperComum.LimpaParametros(DmRelLanContPerRF.qryOperacao);
   if Trim(dblInvestimento.Text) <> '' then
      DmRelLanContPerRF.qryOperacao.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento
   else
      DmRelLanContPerRF.qryOperacao.ParamByName('IDINVESTIMENTO').AsInteger := -1;
   DmRelLanContPerRF.qryOperacao.Open;
end;

procedure TfrmParamConsLanContPerRF.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
   if dblInvestimento.LookupValue <> '' then
      BuscaOperacoesXInvest(StrToInt(dblInvestimento.LookupValue));
end;

procedure TfrmParamConsLanContPerRF.dblInvestimentoChange(Sender: TObject);
begin
  inherited;
   if dblInvestimento.LookupValue <> '' then
      BuscaOperacoesXInvest(StrToInt(dblInvestimento.LookupValue));
end;

procedure TfrmParamConsLanContPerRF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if not ValidaCampos then
      Exit;

   with DmRelLanContPerRF do
   begin
      qryLancContPerRF.DisableControls;
      OperComum.LimpaParametros(qryLancContPerRF);
      qryLancContPerRF.ParamByName('DATAINI').AsString := dtDataIni.Text;
      qryLancContPerRF.ParamByName('DATAFIM').AsString := dtDataFim.Text;
      if Trim(dblInvestimento.Text) <> '' then
         qryLancContPerRF.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblInvestimento.LookupValue);
      if Trim(dblOperacao.Text) <> '' then
         qryLancContPerRF.ParamByName('IDOPERRENFIXAPLIC').AsInteger := StrToInt(dblOperacao.LookupValue);
      qryLancContPerRF.Open;

      sInvestimento := '';
      clCorLinha := clWhite;

      while not qryLancContPerRF.Eof do
      begin
         if not (qryLancContPerRFIDINVESTIMENTO.AsString = sInvestimento) then
         begin
            if clCorLinha = clCorAmarelo then
               clCorLinha := clWhite
            else
               clCorLinha := clCorAmarelo;

            sInvestimento := qryLancContPerRFIDINVESTIMENTO.AsString;
         end;

         OperComum.LimpaParametros(qryPlanoConta);
         qryPlanoConta.ParamByName('PLANO').AsInteger := qryLancContPerRFPLANO.AsInteger;
         qryPlanoConta.ParamByName('PLACONTA').AsString :=  Espaco(qryLancContPerRFPLACONTA.AsString, 18);
         qryPlanoConta.Open;

         qryLancContPerRF.Edit;
         qryLancContPerRFCOR.AsInteger := clCorLinha;
         if qryPlanoContaPLANATUREZA.AsString = 'C' then
            qryLancContPerRFLACVALOR.AsFloat := qryLancContPerRFLACVALOR.AsFloat * -1;
         qryLancContPerRF.Post;

         qryLancContPerRF.Next;
      end;

      qryLancContPerRF.First;

      qryLancContPerRF.EnableControls;
   end;

   if not DmRelLanContPerRF.qryLancContPerRF.IsEmpty then
   begin
      if not fModal then
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelLanContPerRF.pprLanContPerRF,
                                        DmRelLanContPerRF.pprLanContPerRF.PrinterSetup.DocumentName)
      else
         DmRelLanContPerRF.pprLanContPerRF.PrintToDevices;
   end
   else
      MsgDlg('Não existem registros para a Data informada !','Atenção ',mtWarning,[mbOK],0);

   DmRelLanContPerRF.qryLancContPerRF.Close;

   if fModal then
      bbtnSair.Click;
end;

procedure TfrmParamConsLanContPerRF.SetModal(bMod: Boolean);
begin
   bModal := bMod;
end;

end.
