//******************************************************************************
// Autor     : Marco Turon
// Data      : 29/11/2007
// Código    : AL_2
// Pendencia : 27000
// SOL       :
// Desc      : Ajuste na forma de cálculo de NTN solicitada pelo cliente
//******************************************************************************
// Autor     : Marco Turon
// Data	     : 29/08/2007
// Código    : AL_1
// Pendencia : 25678
// SOL       :
// Motivo    : Implementação de Marcação a Mercado - Criação da tela
//******************************************************************************
unit FConsCalcMktInvestNTN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, Wwdatsrc,
  DBClient, faMensagem, uCMClientDataSet, uCmSqlParams, uOperComum,
  uCtrlCalculoMKT, uCtrlParamInvest, UMensErro, RCalcMKTNTN, FPreview;

type
  TFrmConsCalcMktInvestNTN = class(TfrmOkCancelarRelInv)
    pnlDados: TPanel;
    lblInvestimento: TLabel;
    Label9: TLabel;
    lblTxEmissao: TLabel;
    Label12: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    dtpDataVencimento: TCMDateTimePicker;
    dbrTxEmissao: TDBRealEdit;
    dtpDataAplic: TCMDateTimePicker;
    Panel1: TPanel;
    grdFluxo: TwwDBGrid;
    sprCds: TCMSqlParams;
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    lblData: TLabel;
    edDataAtu: TCMDateTimePicker;
    Label10: TLabel;
    dtpDataPUPar: TCMDateTimePicker;
    lblPUPar: TLabel;
    dbrPuPar: TDBRealEdit;
    lblTXCompra: TLabel;
    dbrTaxaJuros: TDBRealEdit;
    Label11: TLabel;
    dbrVlrMoedaInf: TDBRealEdit;
    lblPUMercado: TLabel;
    dbrPUMercado: TDBRealEdit;
    cdsInvestimento: TCMClientDataSet;
    CMSqlParams3: TCMSqlParams;
    lblMoedaInf: TLabel;
    cdsMoeda: TCMClientDataSet;
    sprMoeda: TCMSqlParams;
    fraMensagem: TfraMensagem;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edDataAtuExit(Sender: TObject);
    procedure dtpDataAplicExit(Sender: TObject);
    procedure dtpDataVencimentoExit(Sender: TObject);
    procedure dbrTxEmissaoExit(Sender: TObject);
    procedure dtpDataPUParExit(Sender: TObject);
    procedure dbrPuParExit(Sender: TObject);
    procedure dbrTaxaJurosExit(Sender: TObject);
    procedure dbrVlrMoedaInfExit(Sender: TObject);
    procedure dbrPUMercadoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure CalculaRodape(Sender: TObject);
    procedure CdsAfterPost(DataSet: TDataSet);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    FCtrlMKT: TCtrlCalculoMKT;
    RelCalcMKTNTN: TRelCalcMKTNTN;
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

  procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);

var
  FrmConsCalcMktInvestNTN: TFrmConsCalcMktInvestNTN;

implementation

{$R *.DFM}

{ TFrmConsCalcMktInvestNTN }

procedure TFrmConsCalcMktInvestNTN.FormCreate(Sender: TObject);
begin
  inherited;
  grdFluxo.OnCalcCellColors := CtrlMKT.PintaGridZebrado;
  RelCalcMKTNTN := TRelCalcMKTNTN.Create(Self);
end;

procedure TFrmConsCalcMktInvestNTN.CalculaRodape(Sender: TObject);
begin
   //AL_2
   if (dgShowFooter in TwwDBGrid(Sender).Options) and (not TwwDBGrid(Sender).DataSource.DataSet.IsEmpty) then
   begin
      TwwDBGrid(Sender).ColumnByName('DATAFLUXO').FooterValue := 'Totais';
      TwwDBGrid(Sender).ColumnByName('CUPOMCOMPRA').FooterValue := FloatToStrF(CtrlMKT.CVMVlrSCCom / 100, ffNumber, 15, 9) + ' %';
      TwwDBGrid(Sender).ColumnByName('PUPAR').FooterValue := FloatToStrF(CtrlMKT.CTVlrPUPar, ffNumber, 15, 9);
      TwwDBGrid(Sender).ColumnByName('PUJURCOMPRA').FooterValue := FloatToStrF(CtrlMKT.CVMVlrSJCom, ffNumber, 15, 9);
   end
   else
   begin
      TwwDBGrid(Sender).ColumnByName('DATAFLUXO').FooterValue := 'Totais';
      TwwDBGrid(Sender).ColumnByName('CUPOMCOMPRA').FooterValue := '';
      TwwDBGrid(Sender).ColumnByName('PUPAR').FooterValue := '';
      TwwDBGrid(Sender).ColumnByName('PUJURCOMPRA').FooterValue := '';
   end;
   //AL_2 - Fim
   TwwDBGrid(Sender).Invalidate;
end;

procedure TFrmConsCalcMktInvestNTN.AtualizaBotoes;
begin
   bbtnConfirmar.Enabled := (dbrPUMercado.Value = 0) and (Trim(dblInvestimento.Text) <> '') and
                            (Trim(dtpDataAplic.Text) <> '') and (Trim(dtpDataVencimento.Text) <> '') and
                            (dbrTxEmissao.Value <> 0) and (Trim(edDataAtu.Text) <> '') and
                            (dbrTaxaJuros.Value <> 0);
   bbtnCancelar.Enabled :=  not (dbrPUMercado.Value = 0);
   bt_Imprime.Enabled :=  not (dbrPUMercado.Value = 0);
end;

function TFrmConsCalcMktInvestNTN.AtualizaTela(bFazInv: Boolean = True; bFazPU: Boolean = True): Boolean;
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

         // O Prepare já busca o PU PAR e a cotação da moeda
         if not CtrlMKT.Prepare(cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger, CtrlMKT.CalcData, Cds) then
            MsgDlg(CtrlMKT.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
//            Raise Exception.Create(CtrlMKT.MessageInfo);

         dtpDataAplic.DateTime := CtrlMKT.CalcDTAplic;
         dtpDataVencimento.DateTime := CtrlMKT.CalcDTVenc;
         dbrTxEmissao.Value := CtrlMKT.CalcTXEmissao;
         dtpDataPUPar.DateTime := CtrlMKT.CTDataCotacao;
         dtpDataPUPar.RefreshText;
         dbrPuPar.Value := CtrlMKT.CTVlrPUPar;
         dbrTaxaJuros.Value := CtrlMKT.CalcTXJuros;

         lblMoedaInf.Caption := CtrlMKT.CTMSiglaMoeda;
         dbrVlrMoedaInf.Value := CtrlMKT.CTMValor;

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

procedure TFrmConsCalcMktInvestNTN.SetCtrlMKT(const Value: TCtrlCalculoMKT);
begin
  FCtrlMKT := Value;
  AtualizaTela;
end;

procedure TFrmConsCalcMktInvestNTN.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   try
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;
      bt_Imprime.Enabled := False;
      bbtnSair.Enabled := False;
      try
         CtrlMKT.AtualizaProcTela := AtualizaProg;
         if not CtrlMKT.Prepared then
            CtrlMKT.Prepare(CtrlMKT.CalcIDInv, CtrlMKT.CalcData);
         if not CtrlMKT.CalculaValorMKT(CtrlMKT.CalcIDInv, CtrlMKT.CalcData) then
            Raise Exception.Create(CtrlMKT.MessageInfo);
         dbrPUMercado.Value := CtrlMKT.CVMValor;
         CalculaRodape(grdFluxo);
         // AtualizaTela(False, False);
      except
         On E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      CtrlMKT.AtualizaProcTela := nil;
      bbtnSair.Enabled := True;
      AtualizaBotoes;
   end;
end;

procedure TFrmConsCalcMktInvestNTN.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
   FocaPrimeiroObjeto;
end;

procedure TFrmConsCalcMktInvestNTN.FormShow(Sender: TObject);
begin
   inherited;
   Cds.Data := CtrlMKT.ListaFluxoNTN(True);
   fraMensagem.Apaga;
   if edDataAtu.CanFocus then
      edDataAtu.SetFocus;
end;

procedure TFrmConsCalcMktInvestNTN.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   Cds.Close;
   cdsInvestimento.Close;
   inherited;
end;

procedure TFrmConsCalcMktInvestNTN.dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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

procedure TFrmConsCalcMktInvestNTN.LimpaTela(bFazInv: Boolean = True);
begin
   try
      Cds.Close;
      if edDataAtu.DateTime = 0 then
         edDataAtu.DateTime := CtrlPInv.DataUltFechRF;
      edDataAtu.RefreshText;
      if bFazInv then
         dblInvestimento.Clear;
      dtpDataAplic.Clear;
      dtpDataVencimento.Clear;
      dbrTxEmissao.Value := 0;
      dtpDataPUPar.Clear;
      dbrPuPar.Value := 0;
      dbrTaxaJuros.Value := 0;
      dbrVlrMoedaInf.Value := 0;
      lblMoedaInf.Caption := '';
      dbrPUMercado.Value := 0;
      CtrlMKT.UnPrepare(OperComum.IIF(bFazInv, 0, CtrlMKT.CalcIDInv), edDataAtu.DateTime);
   finally
      AtualizaBotoes;
   end;
end;

function TFrmConsCalcMktInvestNTN.FocaPrimeiroObjeto: Boolean;
begin
   try
      if Trim(edDataAtu.Text) = '' then
      begin
         if edDataAtu.CanFocus then
            FocusControl(edDataAtu);
      end
      else if Trim(dblInvestimento.Text) = '' then
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
      else if Trim(dtpDataPUPar.Text) = '' then
      begin
         if dtpDataPUPar.CanFocus then
            FocusControl(dtpDataPUPar);
      end
      else if Trim(dbrPuPar.Text) = '' then
      begin
         if dbrPuPar.CanFocus then
            FocusControl(dbrPuPar);
      end
      else if Trim(dbrTaxaJuros.Text) = '' then
      begin
         if dbrTaxaJuros.CanFocus then
            FocusControl(dbrTaxaJuros);
      end
      else if Trim(dbrVlrMoedaInf.Text) = '' then
      begin
         if dbrVlrMoedaInf.CanFocus then
            FocusControl(dbrVlrMoedaInf);
      end

      else if Trim(dbrPUMercado.Text) = '' then
      begin
         if dbrPUMercado.CanFocus then
            FocusControl(dbrPUMercado);
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

procedure TFrmConsCalcMktInvestNTN.edDataAtuExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcData <> edDataAtu.DateTime then
   begin
      CtrlMKT.CalcData := edDataAtu.DateTime;
      AtualizaTela(False);
   end;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestNTN.dtpDataAplicExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcDTAplic <> dtpDataAplic.DateTime then
   begin
      CtrlMKT.CalcDTAplic := dtpDataAplic.DateTime;
      AtualizaTela(False);
   end;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestNTN.dtpDataVencimentoExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcDTVenc <> dtpDataVencimento.DateTime then
   begin
      CtrlMKT.CalcDTVenc := dtpDataVencimento.DateTime;
      AtualizaTela(False);
   end;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestNTN.dbrTxEmissaoExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcTXEmissao <> dbrTxEmissao.Value then
   begin
      CtrlMKT.CalcTXEmissao := dbrTxEmissao.Value;
      AtualizaTela(False);
   end;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestNTN.dtpDataPUParExit(Sender: TObject);
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

procedure TFrmConsCalcMktInvestNTN.dbrPuParExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CTVlrPUPar <> dbrPuPar.Value then
   begin
      CtrlMKT.CTVlrPUPar := dbrPuPar.Value;
      AtualizaTela(False);
   end;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestNTN.dbrTaxaJurosExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CalcTXJuros <> dbrTaxaJuros.Value then
   begin
      CtrlMKT.CalcTXJuros := dbrTaxaJuros.Value;
      AtualizaTela(False);
   end;
   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestNTN.dbrVlrMoedaInfExit(Sender: TObject);
begin
   inherited;
   if CtrlMKT.CTMValor <> dbrVlrMoedaInf.Value then
   begin
      CtrlMKT.CTMValor := dbrVlrMoedaInf.Value;
      if dbrVlrMoedaInf.Value = 0 then
         CtrlMKT.CTMMoeCodigo := -1;
      AtualizaTela(False);
   end;

   AtualizaBotoes;
end;

procedure TFrmConsCalcMktInvestNTN.dbrPUMercadoExit(Sender: TObject);
begin
   inherited;
   AtualizaBotoes;
end;

procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);
begin
   if iMax = -1 then
      FrmConsCalcMktInvestNTN.fraMensagem.Apaga
   else
   begin
      if sMsg <> '' then
         FrmConsCalcMktInvestNTN.fraMensagem.Mes := sMsg;

      if iMax > 0 then
      begin
         FrmConsCalcMktInvestNTN.fraMensagem.Mostra;
         FrmConsCalcMktInvestNTN.fraMensagem.Max := iMax;
         FrmConsCalcMktInvestNTN.fraMensagem.Min := 0;
         FrmConsCalcMktInvestNTN.fraMensagem.Pos := 0;
      end
      else
      if iMax = 0 then
         FrmConsCalcMktInvestNTN.fraMensagem.Incrementa;
   end;

   Application.ProcessMessages;
end;


procedure TFrmConsCalcMktInvestNTN.CdsAfterPost(DataSet: TDataSet);
begin
  inherited;
  CalculaRodape(grdFluxo);
end;

procedure TFrmConsCalcMktInvestNTN.CdsAfterOpen(DataSet: TDataSet);
var i: Word;
begin
   inherited;
   // Formata o display das colunas do cds
   for i:= 0 to (DataSet.Fields.Count-1) do
   begin
      if DataSet.Fields[i].FieldName = 'DATAFLUXO' then
      begin
         DataSet.Fields[i].DisplayLabel := 'Data';
         DataSet.Fields[i].DisplayWidth := 11;
      end;

      if DataSet.Fields[i].FieldName = 'DIAS' then
      begin
         DataSet.Fields[i].DisplayLabel := 'Dias';
         TFloatField(DataSet.fields[i]).DisplayFormat := '#####0';
         DataSet.Fields[i].DisplayWidth := 8;
      end;

      if DataSet.Fields[i].FieldName = 'CUPOMEMISSAO' then
      begin
         DataSet.Fields[i].DisplayLabel := 'Cupom Emissão';
         TFloatField(DataSet.fields[i]).DisplayFormat := '###,###,###.00000000';
         DataSet.Fields[i].DisplayWidth := 18;
      end;

      if DataSet.Fields[i].FieldName = 'CUPOMCOMPRA' then
      begin
         DataSet.Fields[i].DisplayLabel := 'Cupom Compra';
         TFloatField(DataSet.fields[i]).DisplayFormat := '###,###,###.00000000';
         DataSet.Fields[i].DisplayWidth := 18;
      end;

      if DataSet.Fields[i].FieldName = 'PUPAR' then
      begin
         DataSet.Fields[i].DisplayLabel := 'PU PAR';
         TFloatField(DataSet.fields[i]).DisplayFormat := '###,###,###.00000000';
         DataSet.Fields[i].DisplayWidth := 18;
      end;

      if DataSet.Fields[i].FieldName = 'PUJUREMISS' then
      begin
         DataSet.Fields[i].DisplayLabel := 'PU Juros Emissão';
         TFloatField(DataSet.fields[i]).DisplayFormat := '###,###,###.00000000';
         DataSet.Fields[i].DisplayWidth := 18;
      end;

      if DataSet.Fields[i].FieldName = 'PUJURCOMPRA' then
      begin
         DataSet.Fields[i].DisplayLabel := 'PU Juros Compra';
         TFloatField(DataSet.fields[i]).DisplayFormat := '###,###,###.00000000';
         DataSet.Fields[i].DisplayWidth := 18;
      end;

      if DataSet.Fields[i].FieldName = 'ULTIMO' then
         DataSet.Fields[i].Visible := False;
   end;

end;

procedure TFrmConsCalcMktInvestNTN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if CtrlMKT <> nil then
     FreeAndNil(CtrlMKT);
  FreeAndNil(RelCalcMKTNTN);
end;

procedure TFrmConsCalcMktInvestNTN.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   try
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;
      bbtnSair.Enabled := False;

      RelCalcMKTNTN.cdsCalcMKTNTN.Data := Cds.Data;
      RelCalcMKTNTN.lblPeriodo.Caption := 'Data Atual: ' + edDataAtu.Text;
      RelCalcMKTNTN.lblInvestimento.Caption := cdsInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
      RelCalcMKTNTN.lblDtAplicacao.Caption := dtpDataAplic.Text;
      RelCalcMKTNTN.lblDtVencimento.Caption := dtpDataVencimento.Text;
      RelCalcMKTNTN.lblTxEmissao.Caption := dbrTxEmissao.Text;
      RelCalcMKTNTN.lblDatPUPar.Caption := dtpDataPUPar.Text;
      RelCalcMKTNTN.lblPUPar.Caption := dbrPuPar.Text;
      RelCalcMKTNTN.lblTXJuros.Caption := dbrTaxaJuros.Text;
      RelCalcMKTNTN.lblCabMoedaInf.Caption := 'Moeda de Inflação ' + lblMoedaInf.Caption;
      RelCalcMKTNTN.lblMoedaInf.Caption := dbrVlrMoedaInf.Text;

      RelCalcMKTNTN.lblCuponCompra.Caption := FloatToStrF(CtrlMKT.CVMVlrSCCom / 100, ffNumber, 15, 9);
      RelCalcMKTNTN.lblPUParFinal.Caption := FloatToStrF(CtrlMKT.CTVlrPUPar, ffNumber, 15, 9);
      RelCalcMKTNTN.lblPUMercado.Caption := dbrPUMercado.Text;

      RelCalcMKTNTN.lblEmpresa.Caption := CtrlPInv.NomeEmpresa;
      RelCalcMKTNTN.lblSistema.Caption := CtrlpInv.NomeModulo + ' ' + CtrlPInv.VersaoModulo;

      TfrmPreview.CreateModalPreview(Application,
                                     RelCalcMKTNTN.rptCalcMKTNTN,
                                     RelCalcMKTNTN.rptCalcMKTNTN.PrinterSetup.DocumentName);
   finally
      RelCalcMKTNTN.cdsCalcMKTNTN.EmptyDataSet;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
      bbtnSair.Enabled := True;
   end;
end;

end.
