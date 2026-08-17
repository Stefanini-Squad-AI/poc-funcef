//******************************************************************************
// Autor     : Marco Turon
// Data      : 29/08/2007
// Código    : AL_1
// Pendencia : 25678
// SOL       :
// Motivo    : Implementação de Marcação a Mercado - Criação da tela
//******************************************************************************
unit FConsCalcMktInvestLFT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, StdCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  uCtrlCalculoMKT, uCtrlParamInvest, UMensErro, RCalcMKTLFT, FPreview;

type
  TFrmConsCalcMktInvestLFT = class(TfrmOkCancelarRelInv)
    pnlDados: TPanel;
    lblInvestimento: TLabel;
    Label9: TLabel;
    lblTxEmissao: TLabel;
    Label12: TLabel;
    dtpDataVencimento: TCMDateTimePicker;
    dbrTxEmissao: TDBRealEdit;
    dtpDataAplic: TCMDateTimePicker;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    edDataAtu: TCMDateTimePicker;
    dbrTXIndicativa: TDBRealEdit;
    dbrPuPar: TDBRealEdit;
    dtpDataPUPar: TCMDateTimePicker;
    dbrPUMercado: TDBRealEdit;
    dbrDUVencto: TDBRealEdit;
    cdsInvestimento: TCMClientDataSet;
    CMSqlParams3: TCMSqlParams;
    dblInvestimento: TwwDBLookupCombo;
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
    procedure dtpDataPUParExit(Sender: TObject);
    procedure dbrPuParExit(Sender: TObject);
    procedure dbrPUMercadoExit(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    FCtrlMKT: TCtrlCalculoMKT;
    RelCalcMKTLFT: TRelCalcMKTLFT;
    procedure SetCtrlMKT(const Value: TCtrlCalculoMKT);
    procedure AtualizaBotoes;
    procedure LimpaTela(bFazInv: Boolean = True);
    function FocaPrimeiroObjeto: Boolean;
    function AtualizaTela(bFazInv: Boolean = True; bFazPU: Boolean = True): Boolean;

  public
    { Public declarations }
    property pCtrlMKT: TCtrlCalculoMKT read FCtrlMKT write SetCtrlMKT;
  end;

var
  FrmConsCalcMktInvestLFT: TFrmConsCalcMktInvestLFT;

implementation

uses uOperComum;

{$R *.DFM}

{ TFrmConsCalcMktInvestLFT }

procedure TFrmConsCalcMktInvestLFT.FormCreate(Sender: TObject);
begin
  inherited;
  RelCalcMKTLFT := TRelCalcMKTLFT.Create(Self);
end;

procedure TFrmConsCalcMktInvestLFT.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if CtrlMKT <> nil then
     FreeAndNil(CtrlMKT);
  FreeAndNil(RelCalcMKTLFT);
end;

procedure TFrmConsCalcMktInvestLFT.AtualizaBotoes;
begin
   bbtnConfirmar.Enabled := (dbrPUMercado.Value = 0) and (Trim(dblInvestimento.Text) <> '') and
                            (Trim(dtpDataAplic.Text) <> '') and (Trim(dtpDataVencimento.Text) <> '') and
                            (dbrTxEmissao.Value <> 0) and (Trim(edDataAtu.Text) <> '') and
                            (dbrDUVencto.Value <> 0) and (dbrPuPar.Value <> 0) ;
   bbtnCancelar.Enabled :=  not (dbrPUMercado.Value = 0);
   bt_Imprime.Enabled :=  not (dbrPUMercado.Value = 0);
end;

function TFrmConsCalcMktInvestLFT.AtualizaTela(bFazInv: Boolean = True; bFazPU: Boolean = True): Boolean;
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
//            Raise Exception.Create(CtrlMKT.MessageInfo);

         dtpDataAplic.DateTime := CtrlMKT.CalcDTAplic;
         dtpDataVencimento.DateTime := CtrlMKT.CalcDTVenc;
         dbrTxEmissao.Value := CtrlMKT.CalcTXEmissao;

         dbrDUVencto.Value := CtrlMKT.DiasUteis.IntervaloDiasUteis(CtrlMKT.CalcData, CtrlMKT.CalcDTVenc, -1, 1, '', True, False, False);
         dbrTXIndicativa.Value := CtrlMKT.CTMIValor;

         dtpDataPUPar.DateTime := CtrlMKT.CTDataCotacao;
         dtpDataPUPar.RefreshText;
         dbrPuPar.Value := CtrlMKT.CTVlrPUPar;

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

procedure TFrmConsCalcMktInvestLFT.SetCtrlMKT(const Value: TCtrlCalculoMKT);
begin
  FCtrlMKT := Value;
  AtualizaTela;
end;

procedure TFrmConsCalcMktInvestLFT.bbtnConfirmarClick(Sender: TObject);
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

procedure TFrmConsCalcMktInvestLFT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
   FocaPrimeiroObjeto;
end;

procedure TFrmConsCalcMktInvestLFT.FormShow(Sender: TObject);
begin
   inherited;
   FocaPrimeiroObjeto;
end;

procedure TFrmConsCalcMktInvestLFT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cdsInvestimento.Close;
   inherited;
end;

procedure TFrmConsCalcMktInvestLFT.dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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
      CtrlMKT.CalcTXEmissao := cdsInvestimento.FieldByName('TAXAEMISSAO').AsFloat;
      CtrlMKT.CalcTXJuros := cdsInvestimento.FieldByName('TAXAJUROSMKT').AsFloat;
      CtrlMKT.CTMMoeCodigo := cdsInvestimento.FieldByName('MOEDACALCMKT').AsInteger;
      CtrlMKT.CTMIMoeCodigo := cdsInvestimento.FieldByName('MOEDATXINDMKT').AsInteger;
      AtualizaTela(False);
   end;
end;

procedure TFrmConsCalcMktInvestLFT.LimpaTela(bFazInv: Boolean = True);
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
      dtpDataPUPar.Clear;
      dbrPuPar.Clear;
      dbrPUMercado.Value := 0;
      CtrlMKT.UnPrepare(OperComum.IIF(bFazInv, 0, CtrlMKT.CalcIDInv), edDataAtu.DateTime);
   finally
      AtualizaBotoes;
   end;
end;

function TFrmConsCalcMktInvestLFT.FocaPrimeiroObjeto: Boolean;
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

procedure TFrmConsCalcMktInvestLFT.dtpDataAplicExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcDTAplic <> dtpDataAplic.DateTime then
   begin
      CtrlMKT.CalcDTAplic := dtpDataAplic.DateTime;
      AtualizaTela(False);
   end;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLFT.dtpDataVencimentoExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcDTVenc <> dtpDataVencimento.DateTime then
      CtrlMKT.CalcDTVenc := dtpDataVencimento.DateTime;

   if (CtrlMKT.CalcData <> 0) and (CtrlMKT.CalcDTVenc <> 0) then
      CtrlMKT.CalcDiasUteis := CtrlMKT.DiasUteis.IntervaloDiasUteis(CtrlMKT.CalcData, CtrlMKT.CalcDTVenc, -1, 1, '', True, False, False);

   AtualizaTela(False);
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLFT.dbrTxEmissaoExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcTXEmissao <> dbrTxEmissao.Value then
   begin
      CtrlMKT.CalcTXEmissao := dbrTxEmissao.Value;
      AtualizaTela(False);
   end;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLFT.edDataAtuExit(Sender: TObject);
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

procedure TFrmConsCalcMktInvestLFT.dbrDUVenctoExit(Sender: TObject);
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

procedure TFrmConsCalcMktInvestLFT.dbrTXIndicativaExit(Sender: TObject);
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
                                      'Utiliza o valor: ', mtConfirmation, 'Mensagem do Sistema', [mbYes, mbNo, mbCancel],'Informado;Cadastrado;Outro Valor');
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

procedure TFrmConsCalcMktInvestLFT.dtpDataPUParExit(Sender: TObject);
var iResp: Word;
begin
   inherited;
   if Trim(dtpDataPUPar.Text) <> '' then
   begin
      if not CtrlMKT.BuscaPUPar(CtrlMKT.CalcIDInv,
                                cdsInvestimento.FieldByName('VENCOPERACAO').AsDateTime,
                                CtrlMKT.CalcData) then
         MsgDlg(CtrlMKT.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);

      if dbrPuPar.Value <> CtrlMKT.CTVlrPUPar then
      begin
         iResp := OperComum.InvMsgBox('O PU Par informado difere do cadastrado' +#13 +
                                      'Informado: ' + FloatToStr(dbrPuPar.Value) + #13 +
                                      'Cadastrado: ' + FloatToStr(CtrlMKT.CTVlrPUPar) + #13 +
                                      'Utiliza o valor: ', mtConfirmation, 'Mensagem do Sistema', [mbYes, mbNo, mbCancel],'Informado;Cadastrado;Outro Valor');
         if iResp = mrYes then
            CtrlMKT.CTVlrPUPar := dbrPuPar.Value
         else if iResp = mrNo then
            dbrPuPar.Value := CtrlMKT.CTVlrPUPar
         else
         begin
            dbrPuPar.SetFocus;
            Exit;
         end;
         AtualizaTela(False);
      end
      else
      begin
         dtpDataPUPar.DateTime := CtrlMKT.CTDataCotacao;
         dtpDataPUPar.RefreshText;
         dbrPuPar.Value := CtrlMKT.CTVlrPUPar;
      end;
   end
   else
      dbrPuPar.Value := 0;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLFT.dbrPuParExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CTVlrPUPar <> dbrPuPar.Value then
   begin
      CtrlMKT.CTVlrPUPar := dbrPuPar.Value;
      AtualizaTela(False);
   end;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLFT.dbrPUMercadoExit(Sender: TObject);
begin
   inherited;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestLFT.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   try
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;
      bbtnSair.Enabled := False;

      RelCalcMKTLFT.lblPeriodo.Caption := 'Data Atual: ' + edDataAtu.Text;
      RelCalcMKTLFT.lblInvestimento.Caption := cdsInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
      RelCalcMKTLFT.lblDtAplicacao.Caption := dtpDataAplic.Text;
      RelCalcMKTLFT.lblDtVencimento.Caption := dtpDataVencimento.Text;
      RelCalcMKTLFT.lblTxEmissao.Caption := dbrTxEmissao.Text;
      RelCalcMKTLFT.lblDatPUPar.Caption := dtpDataPUPar.Text;
      RelCalcMKTLFT.lblPUPar.Caption := dbrPuPar.Text;
      RelCalcMKTLFT.lblCapMoedaInd.Caption := 'Taxa Indicativa ' + CtrlMKT.CTMISiglaMoeda;
      RelCalcMKTLFT.lblTXIndicativa.Caption := dbrTXIndicativa.Text;
      RelCalcMKTLFT.lblDU.Caption := dbrDUVencto.Text;
      RelCalcMKTLFT.lblPUMercado.Caption := dbrPUMercado.Text;
      RelCalcMKTLFT.lblEmpresa.Caption := CtrlPInv.NomeEmpresa;
      RelCalcMKTLFT.lblSistema.Caption := CtrlpInv.NomeModulo + ' ' + CtrlPInv.VersaoModulo;

      TfrmPreview.CreateModalPreview(Application,
                                     RelCalcMKTLFT.rptCalcMKTLFT,
                                     RelCalcMKTLFT.rptCalcMKTLFT.PrinterSetup.DocumentName);
   finally
      RelCalcMKTLFT.cdsCalcMKTLFT.EmptyDataSet;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
      bbtnSair.Enabled := True;
   end;
end;

end.
