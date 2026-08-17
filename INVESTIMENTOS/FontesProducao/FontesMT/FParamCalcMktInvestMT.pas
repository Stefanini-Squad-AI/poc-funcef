//********************************************************************************************************
//Autor    : Marco Turon
//Data	   : 29/08/2007
//Codigo   : AL_1
//Pendência: 25678
//Cod Cli  :
//Função   : Marcação a Mercado
//           Implementação da Tela
//           Chamar como ModalForm e captar o ModalResult
//           Se 1 - chamar tela NTN
//              2 - chamar tela LFT
//              3 - chamar tela LTN
//              mrNone ou qualquer outro, fechar sem fazer nada.
//********************************************************************************************************
unit FParamCalcMktInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, uCtrlCalculoMKT, uCtrlPadroes, uCmSqlParams,
  Db, DBClient, uCMClientDataSet, UMensErro;

type
  TFrmParamCalcMktInvestMT = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    Label5: TLabel;
    dtpDataAtu: TCMDateTimePicker;
    lblInvestimento: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    Label12: TLabel;
    dtpDataAplic: TCMDateTimePicker;
    dtpDataVencimento: TCMDateTimePicker;
    Label9: TLabel;
    dbrTxEmissao: TDBRealEdit;
    lblTxEmissao: TLabel;
    cdsInvestimento: TCMClientDataSet;
    CMSqlParams3: TCMSqlParams;
    procedure FormShow(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    FCtrlMKT: TCtrlCalculoMKT;
    procedure SetCtrlMKT(const Value: TCtrlCalculoMKT);
    { Private declarations }
  public
    { Public declarations }
    property pCtrlMKT: TCtrlCalculoMKT read FCtrlMKT write SetCtrlMKT;
  end;

var
  FrmParamCalcMktInvestMT: TFrmParamCalcMktInvestMT;

implementation

//uses FPrincipal;

{$R *.DFM}

procedure TFrmParamCalcMktInvestMT.FormShow(Sender: TObject);
begin
    inherited;
    cdsInvestimento.Data := CtrlMKT.ListaInvCalcMKT;
    if dtpDataAtu.CanFocus then
       dtpDataAtu.SetFocus;
end;

procedure TFrmParamCalcMktInvestMT.dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if Trim(dblInvestimento.Text) <> '' then
   begin
      dtpDataAplic.Text := cdsInvestimento.FieldByName('DATAOPERACAO').AsString;
      dtpDataVencimento.Text := cdsInvestimento.FieldByName('VENCOPERACAO').AsString;
      dbrTxEmissao.Value := cdsInvestimento.FieldByName('TAXAEMISSAO').AsFloat;
   end;
end;

procedure TFrmParamCalcMktInvestMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if Trim(dtpDataAtu.Text) = '' then
   begin
      MsgDlg('Data Atual não informada', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      if dtpDataAtu.CanFocus then
         dtpDataAtu.SetFocus;
      ModalResult := mrNone;
      Exit;
   end;

   if Trim(dblInvestimento.Text) = '' then
   begin
      MsgDlg('Investimento não informada', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus;
      ModalResult := mrNone;
      Exit;
   end
   else
   begin
      CtrlMKT.UnPrepare;
      CtrlMKT.CalcForma := cdsInvestimento.FieldByName('IDFORMACALCMKT').AsInteger;
      CtrlMKT.CalcData := dtpDataAtu.DateTime;
      CtrlMKT.CalcIDClasse := cdsInvestimento.FieldByName('IDCLASSETIT').AsInteger;
      CtrlMKT.CalcIDInv := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      CtrlMKT.CalcIDOper := cdsInvestimento.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
      CtrlMKT.CalcDTAplic := dtpDataAplic.DateTime;
      CtrlMKT.CalcDTVenc := dtpDataVencimento.DateTime;
      if (CtrlMKT.CalcData <> 0) and (CtrlMKT.CalcDTVenc <> 0) then
         CtrlMKT.CalcDiasUteis := CtrlMKT.DiasUteis.IntervaloDiasUteis(CtrlMKT.CalcData, CtrlMKT.CalcDTVenc, -1, 1, '', True, False, False);
      CtrlMKT.CalcTXEmissao := dbrTxEmissao.Value;
      CtrlMKT.CalcTXJuros := cdsInvestimento.FieldByName('TAXAJUROSMKT').AsFloat;
      CtrlMKT.CTMMoeCodigo := cdsInvestimento.FieldByName('MOEDACALCMKT').AsInteger;
      CtrlMKT.CTMIMoeCodigo := cdsInvestimento.FieldByName('MOEDATXINDMKT').AsInteger;
      ModalResult := cdsInvestimento.FieldByName('IDFORMACALCMKT').AsInteger;
   end;
end;

procedure TFrmParamCalcMktInvestMT.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := 100;   
end;

procedure TFrmParamCalcMktInvestMT.SetCtrlMKT(const Value: TCtrlCalculoMKT);
begin
  FCtrlMKT := Value;
end;

end.
