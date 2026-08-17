//******************************************************************************
// Data     : 07/01/2005
// Motivo   : Implementação do Relatório de Lancamentos Contábeis de Atu de RV
//******************************************************************************

unit fParamConsLanContAtuRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CMDBLookupCombo;

type
  TfrmParamConsLanContAtuRV = class(TfrmOkCancelar)
    Panel1: TPanel;
    lblDataRef: TLabel;
    dtDataRef: TCMDateTimePicker;
    lblCarteira: TLabel;
    dblCarteira: TCMDBLookupCombo;
    lblInvestimento: TLabel;
    dblInvestimento: TCMDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamConsLanContAtuRV: TfrmParamConsLanContAtuRV;

implementation

uses FDmRelLanContAtuRV, uMensErro, UOperComum;

{$R *.DFM}

procedure TfrmParamConsLanContAtuRV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DmRelLanContAtuRV.qryLanContAtuRV.Close;
   DmRelLanContAtuRV.qryCarteira.Close;
   DmRelLanContAtuRV.qryInvestimento.Close;
end;

procedure TfrmParamConsLanContAtuRV.FormShow(Sender: TObject);
begin
  inherited;
   DmRelLanContAtuRV.qryCarteira.Open;
   DmRelLanContAtuRV.qryInvestimento.Open;
end;

procedure TfrmParamConsLanContAtuRV.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if Trim(dtDataRef.Text) = '' then
   begin
      MsgDlg('Data não informada !','Atenção ',mtWarning,[mbOK],0);
      if dtDataRef.CanFocus then
         dtDataRef.SetFocus;
      exit;
   end;

   OperComum.LimpaParametros(DmRelLanContAtuRV.qryLanContAtuRV);
   DmRelLanContAtuRV.qryLanContAtuRV.ParamByName('DATAREF').AsString := dtDataRef.Text;
   if Trim(dblCarteira.Text) <> '' then
      DmRelLanContAtuRV.qryLanContAtuRV.ParamByName('IDCARTEIRAINVEST').AsInteger :=
         DmRelLanContAtuRV.qryCarteiraIDCARTEIRAINVEST.AsInteger;
   if Trim(dblInvestimento.Text) <> '' then
      DmRelLanContAtuRV.qryLanContAtuRV.ParamByName('IDINVESTIMENTO').AsInteger :=
         DmRelLanContAtuRV.qryInvestimentoIDINVESTIMENTO.AsInteger;
   DmRelLanContAtuRV.qryLanContAtuRV.Open;

   if not DmRelLanContAtuRV.qryLanContAtuRV.IsEmpty then
      DmRelLanContAtuRV.rptLanContAtuRV.PrintToDevices
   else
      MsgDlg('Não existem registros para a Data informada !','Atenção ',mtWarning,[mbOK],0);

   DmRelLanContAtuRV.qryLanContAtuRV.Close;
end;

end.
