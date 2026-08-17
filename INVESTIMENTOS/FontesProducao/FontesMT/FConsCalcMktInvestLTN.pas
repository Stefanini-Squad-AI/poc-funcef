//******************************************************************************
// Autor     : Marco Turon
// Data      : 29/08/2007
// Código    : AL_1
// Pendencia : 25678
// SOL       :
// Motivo    : Implementação de Marcação a Mercado - Criação da tela
//******************************************************************************
unit FConsCalcMktInvestLTN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  uCtrlCalculoMKT, uCtrlParamInvest, UMensErro, RCalcMKTLTN, FPreview;

type
  TFrmConsCalcMktInvestLTN = class(TfrmOkCancelarRelInv)
    pnlDados: TPanel;
    lblInvestimento: TLabel;
    Label9: TLabel;
    lblTxEmissao: TLabel;
    Label12: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    dtpDataVencimento: TCMDateTimePicker;
    dbrTxEmissao: TDBRealEdit;
    dtpDataAplic: TCMDateTimePicker;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    edDataAtu: TCMDateTimePicker;
    dbrTXIndicativa: TDBRealEdit;
    dbrPUVencto: TDBRealEdit;
    dbrPUMercado: TDBRealEdit;
    dbrDUVencto: TDBRealEdit;
    cdsInvestimento: TCMClientDataSet;
    CMSqlParams3: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dtpDataAplicExit(Sender: TObject);
    procedure dtpDataVencimentoExit(Sender: TObject);
    procedure dbrTxEmissaoExit(Sender: TObject);
    procedure edDataAtuExit(Sender: TObject);
    procedure dbrDUVenctoExit(Sender: TObject);
    procedure dbrTXIndicativaExit(Sender: TObject);
    procedure dbrPUVenctoExit(Sender: TObject);
    procedure dbrPUMercadoExit(Sender: TObject);
    procedure dblInvestimentoEnter(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    FCtrlMKT: TCtrlCalculoMKT;
    RelCalcMKTLTN: TRelCalcMKTLTN;
    procedure SetCtrlMKT(const Value: TCtrlCalculoMKT);
    procedure AtualizaBotoes;
    procedure LimpaTela(bFazInv: Boolean = True);
    function FocaPrimeiroObjeto: Boolean;
    function AtualizaTela(bFazInv: Boolean = True; bFazPU: Boolean = True): Boolean;
    { Private declarations }
  public
    { Public declarations }
    property pCtrlMKT: TCtrlCalculoMKT read FCtrlMKT write SetCtrlMKT;
  end;

var
  FrmConsCalcMktInvestLTN: TFrmConsCalcMktInvestLTN;

implementation

uses uOperComum;

{$R *.DFM}

{ TFrmConsCalcMktInvestLTN }

procedure TFrmConsCalcMktInvestLTN.FormCreate(Sender: TObject);
begin
  inherited;
  RelCalcMKTLTN := TRelCalcMKTLTN.Create(Self);
end;

procedure TFrmConsCalcMktInvestLTN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if CtrlMKT <> nil then
     FreeAndNil(CtrlMKT);
  FreeAndNil(RelCalcMKTLTN);
end;

procedure TFrmConsCalcMktInvestLTN.AtualizaBotoes;
begin
   bbtnConfirmar.Enabled := (dbrPUMercado.Value = 0) and (Trim(dblInvestimento.Text) <> '') and
                            (Trim(dtpDataAplic.Text) <> '') and (Trim(dtpDataVencimento.Text) <> '') and
                            (dbrTxEmissao.Value <> 0) and (Trim(edDataAtu.Text) <> '') and
                            (dbrDUVencto.Value <> 0);
   bbtnCancelar.Enabled :=  not (dbrPUMercado.Value = 0);
   bt_Imprime.Enabled :=  not (dbrPUMercado.Value = 0);
end;

function TFrmConsCalcMktInvestLTN.AtualizaTela(bFazInv: Boolean = True; bFazPU: Boolean = True): Boolean;
begin
   try
      try
         edDataAtu.DateTime := CtrlMKT.CalcData;

         if bFazInv then
         begin
            // Se o método for chamado do OnClose do dblInvestimento, não pode refazer o cdsInvestimento
            cdsInvestimento.Data := CtrlMKT.ListaInvCalcMKT(CtrlMKT.CalcIDClasse);

            if not cdsInvestimento.Locate('IDINVESTIMENTO;IDOPERRENFIXAPLIC',
                                          VarArrayOf([CtrlMKT.CalcIDInv, CtrlMKT.CalcIDOper]),
                                          [loPartialKey]) then
               Raise Exception.Create('Investimento não localizado na tela de consulta');

            dblInvestimento.Text := cdsInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
            dblInvestimento.PerformSearch;
         end;

         // O Prepare já busca a cotação da moeda
         if not CtrlMKT.Prepare(cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger, CtrlMKT.CalcData) then
            MsgDlg(CtrlMKT.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);

         dtpDataAplic.DateTime := CtrlMKT.CalcDTAplic;
         dtpDataVencimento.DateTime := CtrlMKT.CalcDTVenc;
         dbrTxEmissao.Value := CtrlMKT.CalcTXEmissao;
         dbrDUVencto.Value := CtrlMKT.CalcDiasUteis;
         dbrTXIndicativa.Value := CtrlMKT.CTMIValor;

         if bFazPU then
            dbrPUMercado.Value := 0;

         if bFazInv then
            FocaPrimeiroObjeto;

         Result := True;
      except
         On E: exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Result := False;
         end;
      end;
   finally
      AtualizaBotoes;
   end;
end;

procedure TFrmConsCalcMktInvestLTN.SetCtrlMKT(const Value: TCtrlCalculoMKT);
begin
  FCtrlMKT := Value;
  AtualizaTela;
end;

procedure TFrmConsCalcMktInvestLTN.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   try
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;
      bt_Imprime.Enabled := False;
      bbtnSair.Enabled := False;
      try
         if not CtrlMKT.Prepared then
            CtrlMKT.Prepare(CtrlMKT.CalcIDInv, CtrlMKT.CalcData);
         if not CtrlMKT.CalculaValorMKT(CtrlMKT.CalcIDInv, CtrlMKT.CalcData) then
            Raise Exception.Create(CtrlMKT.MessageInfo);
         dbrPUMercado.Value := CtrlMKT.CVMValor;
      except
         on E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      AtualizaBotoes;
   end;
end;

procedure TFrmConsCalcMktInvestLTN.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
   FocaPrimeiroObjeto;
end;

procedure TFrmConsCalcMktInvestLTN.FormShow(Sender: TObject);
begin
   inherited;
   FocaPrimeiroObjeto;
end;

procedure TFrmConsCalcMktInvestLTN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cdsInvestimento.Close;
   inherited;
end;

procedure TFrmConsCalcMktInvestLTN.dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
   begin
      LimpaTela(False);
      CtrlMKT.CalcForma := cdsInvestimento.FieldByName('IDFORMACALCMKT').AsInteger;
      if (CtrlMKT.CalcData = 0) then
      begin
         if Trim(edDataAtu.Text) = '' then
            CtrlMKT.CalcData := CtrlPInv.DataUltFechRF
         else
            CtrlMKT.CalcData := edDataAtu.DateTime;
      end;
      CtrlMKT.CalcIDClasse := cdsInvestimento.FieldByName('IDCLASSETIT').AsInteger;
      CtrlMKT.CalcIDInv := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      CtrlMKT.CalcIDOper := cdsInvestimento.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
      CtrlMKT.CalcDTAplic := cdsInvestimento.FieldByName('DATAOPERACAO').AsDateTime;
      CtrlMKT.CalcDTVenc := cdsInvestimento.FieldByName('VENCOPERACAO').AsDateTime;
      CtrlMKT.CalcDiasUteis := CtrlMKT.DiasUteis.IntervaloDiasUteis(CtrlMKT.CalcData, CtrlMKT.CalcDTVenc, -1, 1, '', True, False, False);
      CtrlMKT.CalcTXEmissao := cdsInvestimento.FieldByName('TAXAEMISSAO').AsFloat;
      CtrlMKT.CalcTXJuros := cdsInvestimento.FieldByName('TAXAJUROSMKT').AsFloat;
      CtrlMKT.CTMMoeCodigo := cdsInvestimento.FieldByName('MOEDACALCMKT').AsInteger;
      CtrlMKT.CTMIMoeCodigo := cdsInvestimento.FieldByName('MOEDATXINDMKT').AsInteger;
      AtualizaTela(False);
   end;
end;

procedure TFrmConsCalcMktInvestLTN.LimpaTela(bFazInv: Boolean = True);
begin
   try
      if bFazInv then
         dblInvestimento.Clear;
      dtpDataAplic.Clear;
      dtpDataVencimento.Clear;
      dbrTxEmissao.Value := 0;
      if edDataAtu.DateTime = 0 then
         edDataAtu.DateTime := CtrlPInv.DataUltFechRF;
      dbrDUVencto.Value := 0;
      dbrTXIndicativa.Value := 0;
      dbrPUVencto.Value := 0;
      dbrPUMercado.Value := 0;
      CtrlMKT.UnPrepare(OperComum.IIF(bFazInv, 0, CtrlMKT.CalcIDInv), edDataAtu.DateTime);
   finally
      AtualizaBotoes;
   end;
end;

function TFrmConsCalcMktInvestLTN.FocaPrimeiroObjeto: Boolean;
begin
   try
      if Trim(dblInvestimento.Text) = '' then
      begin
         if dblInvestimento.CanFocus then
            FocusControl(dblInvestimento);
      end
      else if Trim(dtpDataAplic.Text) = '' then
      begin
         if dtpDataAplic.CanFocus then
            FocusControl(dtpDataAplic);
      end
      else if Trim(dtpDataVencimento.Text) = '' then
      begin
         if dtpDataVencimento.CanFocus then
            FocusControl(dtpDataVencimento);
      end
      else if Trim(dbrTxEmissao.Text) = '' then
      begin
         if dbrTxEmissao.CanFocus then
            FocusControl(dbrTxEmissao);
      end
      else
      begin
         if edDataAtu.CanFocus then
            FocusControl(edDataAtu);
      end;
      Result := True;
   except
      Result := False;
   end;
end;

procedure TFrmConsCalcMktInvestLTN.dtpDataAplicExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcDTAplic <> dtpDataAplic.DateTime then
   begin
      CtrlMKT.CalcDTAplic := dtpDataAplic.DateTime;
      AtualizaTela(False);
   end;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.dtpDataVencimentoExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcDTVenc <> dtpDataVencimento.DateTime then
      CtrlMKT.CalcDTVenc := dtpDataVencimento.DateTime;

   if (CtrlMKT.CalcData <> 0) and (CtrlMKT.CalcDTVenc <> 0) then
      CtrlMKT.CalcDiasUteis := CtrlMKT.DiasUteis.IntervaloDiasUteis(CtrlMKT.CalcData, CtrlMKT.CalcDTVenc, -1, 1, '', True, False, False);

   AtualizaTela(False);
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.dbrTxEmissaoExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcTXEmissao <> dbrTxEmissao.Value then
   begin
      CtrlMKT.CalcTXEmissao := dbrTxEmissao.Value;
      AtualizaTela(False);
   end;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.edDataAtuExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcData <> edDataAtu.DateTime then
   begin
      CtrlMKT.CalcData := edDataAtu.DateTime;
      CtrlMKT.BuscaCotMoedaInd(CtrlMKT.CTMIMoeCodigo, CtrlMKT.CalcData);
   end;

   if (CtrlMKT.CalcData <> 0) and (CtrlMKT.CalcDTVenc <> 0) then
      CtrlMKT.CalcDiasUteis := CtrlMKT.DiasUteis.IntervaloDiasUteis(CtrlMKT.CalcData, CtrlMKT.CalcDTVenc, -1, 1, '', True, False, False);

   AtualizaTela(False);
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.dbrDUVenctoExit(Sender: TObject);
var iDiasUteis: Integer;
    iResp: Word;
begin
   inherited;
   if CtrlMKT.CalcDiasUteis <> dbrDUVencto.Value then
   begin
      CtrlMKT.CalcDiasUteis := Trunc(dbrDUVencto.Value);
      AtualizaTela(False);
   end;

   if (CtrlMKT.CalcData <> 0) and (CtrlMKT.CalcDTVenc <> 0) then
   begin

      iDiasUteis := CtrlMKT.DiasUteis.IntervaloDiasUteis(CtrlMKT.CalcData, CtrlMKT.CalcDTVenc, -1, 1, '', True, False, False);
      if iDiasUteis <> CtrlMKT.CalcDiasUteis then
      begin
         iResp := OperComum.InvMsgBox('O nº de dias úteis informado é diferente do calculado' +#13 +
                                      'Informado: ' + FloatToStr(CtrlMKT.CalcDiasUteis) + #13 +
                                      'Calculado: ' + FloatToStr(iDiasUteis) + #13 +
                                      'Utiliza o valor: ', mtConfirmation, 'Mensagem do Sistema', [mbYes, mbNo, mbCancel],'Informado;Calculado;Outro Valor');

         if iResp = mrNo then
         begin
            CtrlMKT.CalcDiasUteis := iDiasUteis;
            AtualizaTela(False);
         end
         else if iResp = mrCancel then
         begin
            if dbrDUVencto.CanFocus then
               dbrDUVencto.SetFocus;
         end;
      end
   end;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.dbrTXIndicativaExit(Sender: TObject);
var iResp: Word;
begin
   inherited;
   if CtrlMKT.CTMIValor = 0 then
      CtrlMKT.CTMIValor := dbrTXIndicativa.Value
   else
   begin
      if OperComum.ComparaValores(CtrlMKT.CTMIValor, dbrTXIndicativa.Value, '<>') then
      begin
         iResp := OperComum.InvMsgBox('A cotação da moeda indicativa está diferente da cotação cadastrada.' +#13 +
                                      'Utiliza o valor: ', mtConfirmation, 'Mensagem do Sistema', [mbYes, mbNo, mbCancel],'Informado;Calculado;Outro Valor');
         if iResp = mrYes then
            CtrlMKT.CTMIValor := dbrTXIndicativa.Value
         else if iResp = mrCancel then
            dbrTXIndicativa.SetFocus
         else
         begin
            dbrTXIndicativa.Value := CtrlMKT.CTMIValor;
            Exit;
         end;
         AtualizaTela(False);
      end;
   end;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.dbrPUVenctoExit(Sender: TObject);
begin
   inherited;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.dbrPUMercadoExit(Sender: TObject);
begin
   inherited;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLTN.dblInvestimentoEnter(Sender: TObject);
begin
  inherited;
  if cdsInvestimento.Active then
     cdsInvestimento.Locate('IDINVESTIMENTO;IDOPERRENFIXAPLIC', VarArrayOf([CtrlMKT.CalcIDInv, CtrlMKT.CalcIDOper]), []);
end;

procedure TFrmConsCalcMktInvestLTN.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   try
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;
      bbtnSair.Enabled := False;

      RelCalcMKTLTN.lblPeriodo.Caption := 'Data Atual: ' + edDataAtu.Text;
      RelCalcMKTLTN.lblInvestimento.Caption := cdsInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
      RelCalcMKTLTN.lblDtAplicacao.Caption := dtpDataAplic.Text;
      RelCalcMKTLTN.lblDtVencimento.Caption := dtpDataVencimento.Text;
      RelCalcMKTLTN.lblTxEmissao.Caption := dbrTxEmissao.Text;
      RelCalcMKTLTN.lblCapMoedaInd.Caption := 'Taxa Indicativa ' + CtrlMKT.CTMISiglaMoeda;
      RelCalcMKTLTN.lblTXIndicativa.Caption := dbrTXIndicativa.Text;
      RelCalcMKTLTN.lblDU.Caption := dbrDUVencto.Text;
      RelCalcMKTLTN.lblPUMercado.Caption := dbrPUMercado.Text;
      RelCalcMKTLTN.lblEmpresa.Caption := CtrlPInv.NomeEmpresa;
      RelCalcMKTLTN.lblSistema.Caption := CtrlpInv.NomeModulo + ' ' + CtrlPInv.VersaoModulo;

      TfrmPreview.CreateModalPreview(Application,
                                     RelCalcMKTLTN.rptCalcMKTLTN,
                                     RelCalcMKTLTN.rptCalcMKTLTN.PrinterSetup.DocumentName);
   finally
      RelCalcMKTLTN.cdsCalcMKTLTN.EmptyDataSet;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
      bbtnSair.Enabled := True;
   end;
end;

end.
