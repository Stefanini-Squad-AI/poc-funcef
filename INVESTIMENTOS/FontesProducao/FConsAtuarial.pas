unit FConsAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Math,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, dxCntner,
  dxExEdtr, dxEdLib, wwdbdatetimepicker, CMDateTimePicker, Spin, wwdblook,
  TREdit, Db, DBTables, Wwquery, URegra, FPreview, Menus, Wwdatsrc;

type
  TfrmConsAtuarial = class(TfrmOkCancelarInv)
    regAtuarial: TRegra;
    qryAux: TwwQuery;
    pnlGrid: TPanel;
    qryTipoInvest: TwwQuery;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryRegra: TwwQuery;
    qryRegraNOMEREGRA: TStringField;
    qryRegraIDREGRA: TFloatField;
    qryRegraJur: TwwQuery;
    qryRegraJurIDREGRA: TFloatField;
    qryRegraJurNOMEREGRA: TStringField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoMINDATA: TDateTimeField;
    qryInvestimentoMAXDATA: TDateTimeField;
    pnlFiltros: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edtJuros: TRealEdit;
    dblkRegra: TwwDBLookupCombo;
    dblInvestimento: TwwDBLookupCombo;
    dblTipoInvest: TwwDBLookupCombo;
    dblRegraJur: TwwDBLookupCombo;
    dtDtaInicio: TCMDateTimePicker;
    dtDtaFim: TCMDateTimePicker;
    Panel1: TPanel;
    dbgAtuarial: TwwDBGrid;
    pnlDados: TPanel;
    grpValorCorrigido: TGroupBox;
    lblPUAtuarial: TfcLabel;
    grpValorAtuarial: TGroupBox;
    lblValorCorrigido: TfcLabel;
    grpQuantidade: TGroupBox;
    lblQuantidade: TfcLabel;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ppmAtuarial: TPopupMenu;
    FixarColuna: TMenuItem;
    LiberarColuna: TMenuItem;
    N1: TMenuItem;
    LiberarTodasColunas: TMenuItem;
    pmnCopiarValor: TPopupMenu;
    CopiarValor: TMenuItem;
    edtValor: TEdit;
    pmnCopiarPU: TPopupMenu;
    CopiarPU: TMenuItem;
    Label9: TLabel;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    dblConsEmissor: TwwDBLookupCombo;
    qryInvestimentoIDEMISSOR: TFloatField;
    QryDados: TwwQuery;
    DsDados: TwwDataSource;
    UpdDados: TUpdateSQL;
    QryDadosDATAMOVCARTINV: TStringField;
    QryDadosHISTMOVCARTINV: TStringField;
    QryDadosVLRMOV: TFloatField;
    QryDadosQTDCOTAS: TFloatField;
    QryDadosQTD: TFloatField;
    QryDadosFLGOPDIREITO: TStringField;
    QryDadosNATUREZAOPERACAO: TStringField;
    QryVerInvestimento: TwwQuery;
    QryDadosIDINVESTIMENTO: TFloatField;
    QrySaldoInvestimento: TwwQuery;
    QryInvestimentoEmissor: TwwQuery;
    spePercentual: TSpinEdit;
    Label2: TLabel;
    chkPassoaPasso: TdxCheckEdit;
    procedure dblTipoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ppmAtuarialPopup(Sender: TObject);
    procedure CopiarValorClick(Sender: TObject);
    procedure CopiarPUClick(Sender: TObject);
    procedure FixarColunaClick(Sender: TObject);
    procedure LiberarColunaClick(Sender: TObject);
    procedure LiberarTodasColunasClick(Sender: TObject);
    procedure dblConsEmissorExit(Sender: TObject);
  private
    { Private declarations }
    function ExecRegra(idRegra: Integer; sNomeRegra, sDataIni, sDataFim: String): Double;
  public
    { Public declarations }
  end;

var
  frmConsAtuarial: TfrmConsAtuarial;

implementation

uses UOperComum, UBibliotecaInvest, FDmRelAtuarial, UDiasUteisInv, UMensErro,
     fAguarde, UOperacaoInvest;

{$R *.DFM}

function TfrmConsAtuarial.ExecRegra(idRegra: Integer; sNomeRegra, sDataIni, sDataFim: String): Double;
begin
   Result := 0;
   // Monta a regra de Entrada
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT ');
   qryAux.SQL.Add(QuotedStr(sdataIni) + ' AS DATAINICIO, ');
   qryAux.SQL.Add(QuotedStr(sDataFim) + ' AS DATAFINAL, ');
   qryAux.SQL.Add(TrocaVirgulaPonto(frmConsAtuarial.spePercentual.Text) + ' AS PERCENTUAL, ');
   qryAux.SQL.Add(TrocaVirgulaPonto(frmConsAtuarial.edtJuros.Text) + ' AS TAXA, ');
   qryAux.SQL.Add('-1 AS IDCIDADES, ');
   qryAux.SQL.Add(' 1 AS IDPAIS, ');
   qryAux.SQL.Add(''' '' AS CODESTADO');
   qryAux.SQL.Add('FROM DUAL');
   qryAux.Open;

   // Chama regra de cálculo
   regAtuarial.RuleName := IntToStr(idRegra);
   regAtuarial.QueryIn  := qryAux;
   try
      if frmConsAtuarial.chkPassoaPasso.Checked then
         regAtuarial.PassoaPasso
      else
         regAtuarial.Execute;
   except
      on E:Exception do
      begin
         MsgDlg('Erro ao calcular a Regra: ' + #13 +
                '  ' + sNomeRegra +
                'Com a Mensagem:' + #13 +
                '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
         Exit;
      end;
   end;

   Result := StrToFloat(TrocaPontoVirgula(regAtuarial.Result));

end;

procedure TfrmConsAtuarial.FormShow(Sender: TObject);
begin
  inherited;
  qryEmissor.Open;

  OperComum.LimpaParametros(qryTipoInvest);
  qryTipoInvest.ParamByName('IDTIPOINVEST').AsInteger := 2;
  qryTipoInvest.Open;

  OperComum.LimpaParametros(qryInvestimento);
  If qryTipoInvest.RecordCount = 1 Then
     qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger :=
                     qryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger;
  qryInvestimento.Open;

  OperComum.LimpaParametros(qryRegra);
  qryRegra.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRAATUAR;
  qryRegra.Open;

  OperComum.LimpaParametros(qryRegraJur);
  qryRegraJur.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRAATUAR;
  qryRegraJur.Open;

  OperComum.LimpaParametros(DmRelAtuarial.qryAtuarial);
  DmRelAtuarial.qryAtuarial.Open;

  if dblTipoInvest.CanFocus then
     dblTipoInvest.SetFocus;

end;

procedure TfrmConsAtuarial.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
  If (dblInvestimento.Text = '') And (dblConsEmissor.Text <> '') Then
  begin
     qryInvestimento.First;
     While Not qryInvestimento.Eof Do
     begin
        If (dtDtaInicio.DateTime = 0) Or
           (dtDtaInicio.DateTime >  qryInvestimentoMINDATA.AsDateTime) Then
            dtDtaInicio.DateTime := qryInvestimentoMINDATA.AsDateTime;

        If (dtDtaFim.DateTime    <  qryInvestimentoMAXDATA.AsDateTime) Then
            dtDtaFim.DateTime    := qryInvestimentoMAXDATA.AsDateTime;

        qryInvestimento.Next;
     end;
     qryInvestimento.Locate('DESCINVESTIMENTO',Trim(dblInvestimento.Text),[loPartialKey]);
  end
  ELse
  begin
     dtDtaInicio.DateTime := qryInvestimentoMINDATA.AsDateTime;
     dtDtaFim.DateTime    := qryInvestimentoMAXDATA.AsDateTime;
  end;
end;

procedure TfrmConsAtuarial.dblTipoInvestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if (modified) and (Trim(dblTipoInvest.Text) <> '') then
   begin
      if (qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger <>
          StrToInt(dblTipoInvest.LookupValue)) then
      begin
         OperComum.LimpaParametros(qryInvestimento);
         qryInvestimento.ParamByName('IDTIPOINVEST').AsInteger := StrToInt(dblTipoInvest.LookupValue);
         qryInvestimento.Open;
      end;
   end;
end;

procedure TfrmConsAtuarial.bbtnConfirmarClick(Sender: TObject);
var wReg, iIdInvestimento, iDifDias, iDifDiasAcu: Integer;
    dDataAnt: TDateTime;
    fPUAtuarial, fValorCorrigido, fQuantidade, fFatorAnt, fJurAnt, fQtdCotasAnt: Double;
    fJuros, fVlrCorrigido, fVlrMov, fQtd, fPu, fQtdTotal : Double;
    lPriPas: Boolean;
    sDataIni, sDataAnt, sDataAtu, sDESCINV : String;
begin
   inherited;
   lPriPas         := True;
   fJuros          := edtJuros.Value;
   iDifDias        := 0;
   iDifDiasAcu     := 0;
   fFatorAnt       := 1;
   fJurAnt         := 1;
   fQtdCotasAnt    := 0;
   fPUAtuarial     := 0;
   fValorCorrigido := 0;
   fVlrCorrigido   := 0;
   fQuantidade     := 0;
   fVlrMov         := 0;
   fQtd            := 0;
   fPu             := 0;
   wReg            := 0;
   fQtdTotal       := 0;
   sDESCINV        := '';
   dDataAnt        := 0;

   with DmRelAtuarial do
   begin
      frmAguarde.Pos := 0;
      frmAguarde.Max := 0;
      frmAguarde.Mostra('Aguarde, Consultando Dados... ');

      QryDados.Close;      
      QryDados.Open;
      QryDados.Delete;
                      
      qryAtuarial.DisableControls;
      qryAtuarial.Close;
      OperComum.LimpaParametros(qryAtuarial);
      If Trim(dblConsEmissor.Text)  <> '' Then
         qryAtuarial.ParamByName('IDEMISSOR').AsInteger      := qryEmissorIDEMISSOR.AsInteger;

      If Trim(dblInvestimento.Text) <> '' Then
         qryAtuarial.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;

      qryAtuarial.ParamByName('DATAINI').AsString            := dtDtaInicio.Text;
      qryAtuarial.ParamByName('DATAFIM').AsString            := dtDtaFim.Text;
      qryAtuarial.Prepare;
      qryAtuarial.Open;

      frmAguarde.Max := qryAtuarial.RecordCount;
      frmAguarde.Mostra('Aguarde, Efetuando Cálculos Atuariais... ');

      sDataIni := FormatDateTime('dd/mm/yyyy',qryAtuarialDATAMOVCARTINV.AsDateTime);
      sDataAtu := FormatDateTime('dd/mm/yyyy',qryAtuarialDATAMOVCARTINV.AsDateTime);
      sDataAnt := FormatDateTime('dd/mm/yyyy',qryAtuarialDATAMOVCARTINV.AsDateTime);
      while not qryAtuarial.Eof do
      begin
         wReg            := wReg + 1;
         If  Pos('TRANSF', qryAtuarialHISTMOVCARTINV.AsString) > 0  Then
         Begin
            wReg         := wReg + 1;

            qryAtuarial.Delete;

            iDifDiasAcu := iDifDiasAcu - iDifDias;

            If (Not qryAtuarial.Eof) Then
               iDifDias := DiasUteisInv.IntervaloDias(dDataAnt,qryAtuarialDATAMOVCARTINV.AsDateTime);
            // Cálculo da diferença total de dias
               iDifDiasAcu := iDifDiasAcu + iDifDias;

            If Pos('TRANSF', qryAtuarialHISTMOVCARTINV.AsString) > 0  Then
               Continue;

            sDataAtu    := FormatDateTime('dd/mm/yyyy',qryAtuarialDATAMOVCARTINV.AsDateTime);

         End;
         qryAtuarial.Edit;

         If (qryAtuarialNATUREZAOPERACAO.AsString      = 'A') Or
            (qryAtuarialNATUREZAOPERACAO.AsString      = 'V') Or
            (qryAtuarialNATUREZAOPERACAO.AsString      = 'U') Or
            (qryAtuarialNATUREZAOPERACAO.AsString      = 'M') Then
            fQtdTotal := fQtdTotal + qryAtuarialQTDMOV.AsFloat
         Else If (qryAtuarialNATUREZAOPERACAO.AsString = 'D') Or
                 (qryAtuarialNATUREZAOPERACAO.AsString = 'S') Or
                 (qryAtuarialNATUREZAOPERACAO.AsString = 'O') Or
                 (qryAtuarialNATUREZAOPERACAO.AsString = 'R') Or
                 (qryAtuarialNATUREZAOPERACAO.AsString = 'I') Then
            fQtdTotal := fQtdTotal - qryAtuarialQTDMOV.AsFloat;

         // Grava Diferença de dias entre os movimentos
         qryAtuarialDIFDIAS.AsInteger    := iDifDias;
         // Grava diferença total de dias
         qryAtuarialDIFDIASACU.AsInteger := iDifDiasAcu;
         // Cálculo do Fator de Correção
         if lPriPas then
            qryAtuarialFATORINDICE.AsFloat := fFatorAnt
         else
            qryAtuarialFATORINDICE.AsFloat := ExecRegra(qryRegraIDREGRA.AsInteger,
                                                        qryRegraNOMEREGRA.AsString,
                                                        sDataIni,sDataAtu);

         // Cálculo da Rentabilidade no Período
         qryAtuarialRENTPERIODO.AsFloat := (OperComum.DivValorZero(qryAtuarialFATORINDICE.AsFloat,fFatorAnt) -1) * 100;
         // Cálculo da Rentabilidade Acumulada
         qryAtuarialRENTACU.AsFloat := (qryAtuarialFATORINDICE.AsFloat -1)*100;
         // Cálculo do Fator de Juros
         if lPriPas then
            qryAtuarialFATORJUROS.AsFloat := 1
         else
            qryAtuarialFATORJUROS.AsFloat := ExecRegra(qryRegraJurIDREGRA.AsInteger,
                                                       qryRegraJurNOMEREGRA.AsString,
                                                       sDataIni,sDataAtu);
         // Cálculo do Fator Total
         qryAtuarialFATORTOTAL.AsFloat := qryAtuarialFATORINDICE.AsFloat * qryAtuarialFATORJUROS.AsFloat;

         // Cálculo da Quantidade de Cotas
         If qryAtuarial.FieldByName('FLGOPDIREITO').AsString = 'N' Then
         Begin
            If (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
               (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
               (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
               (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
                qryAtuarialQTDCOTAS.AsFloat := fQtdCotasAnt + OperComum.DivValorZero(qryAtuarialVLRMOV.AsFloat, qryAtuarialFATORTOTAL.AsFloat)

            Else If (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
                    (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
                    (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
                    (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
                    (qryAtuarial.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
                qryAtuarialQTDCOTAS.AsFloat := fQtdCotasAnt - OperComum.DivValorZero(qryAtuarialVLRMOV.AsFloat,qryAtuarialFATORTOTAL.AsFloat);
         End
         Else
            qryAtuarialQTDCOTAS.AsFloat     := fQtdCotasAnt - OperComum.DivValorZero(qryAtuarialVLRMOV.AsFloat,qryAtuarialFATORTOTAL.AsFloat);

         // Cálculo do Valor Corrigido
         qryAtuarialVALORCORRIGIDO.AsFloat  := qryAtuarialQTDCOTAS.AsFloat * qryAtuarialFATORTOTAL.AsFloat;

         qryAtuarialPU.AsFloat := OperComum.DivValorZero(QryAtuarialVALORCORRIGIDO.AsFloat, qryAtuarialQTDCOTAS.AsFloat);

         qryAtuarial.Post;

         If ((wReg > 1) And (sDESCINV  = ''))  Then
         begin
            If dDataAnt < StrToDate(dtDtaFim.Text) Then
            begin
               fValorCorrigido  := fValorCorrigido + qryAtuarialVALORCORRIGIDO.AsFloat;
               fQuantidade      := fQuantidade     + qryAtuarialQTDCOTAS.AsFloat;
               fPUAtuarial      := fPUAtuarial     + qryAtuarialPU.AsFloat;
            end
            Else
            begin
               fValorCorrigido  := fValorCorrigido + fVlrCorrigido;
               fQuantidade      := fQuantidade     + fQtdCotasAnt;
               fPUAtuarial      := fPUAtuarial     + fPu;
            end;
         end
         Else
             pnlDados.Visible := True;

         // Capta Dados do Registro atual antes do Next
         dDataAnt        := qryAtuarialDATAMOVCARTINV.AsDateTime;
         fFatorAnt       := qryAtuarialFATORINDICE.AsFloat;
         fJurAnt         := qryAtuarialFATORJUROS.AsFloat;
         fQtdCotasAnt    := qryAtuarialQTDCOTAS.AsFloat;
         fQtd            := qryAtuarialQTD.AsFloat;
         sDataAnt        := FormatDateTime('dd/mm/yyyy',qryAtuarialDATAMOVCARTINV.AsDateTime);
         fVlrMov         := qryAtuarialVLRMOV.AsFloat;
         fVlrCorrigido   := qryAtuarialVALORCORRIGIDO.AsFloat;
         fPu             := qryAtuarialPU.AsFloat;
         iIdInvestimento := qryAtuarialIDINVESTIMENTO.AsInteger;

         qryAtuarial.Next;

         If ((qryAtuarial.Eof) And (sDESCINV <> '')) Or
            ((qryAtuarial.Eof) And (QryDados.RecordCount > 0)) Then
         begin
            If (dDataAnt < StrToDate(dtDtaFim.Text)) Then
            begin
               If wReg < qryAtuarial.RecordCount Then
                  qryAtuarial.Insert
               Else
                  qryAtuarial.Append;

               qryAtuarialDATAMOVCARTINV.AsDateTime := StrToDate(dtDtaFim.Text);
               qryAtuarialHISTMOVCARTINV.AsString   := Trim(sDESCINV);
               qryAtuarialQTDMOV.AsFloat            := 0;                   
               qryAtuarialVLRMOV.AsFloat            := 0;
               qryAtuarialQTDCOTAS.AsFloat          := fQtdCotasAnt;
               qryAtuarialQTD.AsFloat               := fQtd;
               qryAtuarialFLGOPDIREITO.AsString     := 'N';
               qryAtuarialNATUREZAOPERACAO.AsString := 'N';
               qryAtuarial.Post;
            end
            Else If (QryDados.RecordCount > 0) Then
            begin
               QryDados.First;
               If wReg < qryAtuarial.RecordCount Then
                  qryAtuarial.Insert
               Else
                  qryAtuarial.Append;

               qryAtuarialDATAMOVCARTINV.AsDateTime := StrToDate(dtDtaFim.Text);
               qryAtuarialHISTMOVCARTINV.AsString   := QryDadosHISTMOVCARTINV.AsString;
               qryAtuarialQTDMOV.AsFloat            := 0;
               qryAtuarialVLRMOV.AsFloat            := 0;
               qryAtuarialQTDCOTAS.AsFloat          := QryDadosQTDCOTAS.AsFloat;
               qryAtuarialQTD.AsFloat               := QryDadosQTD.AsFloat;
               qryAtuarialFLGOPDIREITO.AsString     := QryDadosFLGOPDIREITO.AsString;
               qryAtuarialNATUREZAOPERACAO.AsString := QryDadosNATUREZAOPERACAO.AsString;
               qryAtuarial.Post;

               If QryDados.RecordCount > 0 Then
                  QryDados.Delete;
            end;

            sDESCINV := 'F'; //FIM
         end
         Else If (Trim(dblConsEmissor.text) <> '') Then
         begin
            QryVerInvestimento.Close;
            QryVerInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
            QryVerInvestimento.ParamByName('DATA').AsString            := sDataAnt;
            QryVerInvestimento.Open;
            If (Not QryVerInvestimento.IsEmpty) And (iIdInvestimento <> 0) And
               (dtDtaFim.Text <> sDataAnt)  And
               (QryVerInvestimento.FieldByName('DATAMOVCARTINV').AsDateTime = StrToDate(sDataAnt)) Then
            begin
               If QryDados.RecordCount > 0 Then
                  QryDados.Delete;

               QryDados.Append;
               QryDadosDATAMOVCARTINV.AsString   := dtDtaFim.Text;
               QryDadosIDINVESTIMENTO.AsInteger  := iIdInvestimento;
               QryDadosHISTMOVCARTINV.AsString   := sDESCINV;
               QryDadosVLRMOV.AsFloat            := 0;
               QryDadosQTDCOTAS.AsFloat          := fQtdCotasAnt;
               QryDadosQTD.AsFloat               := fQtd;
               QryDadosFLGOPDIREITO.AsString     := 'N';
               QryDadosNATUREZAOPERACAO.AsString := 'N';
               QryDados.Post;
            end;
         end;

         If Trim(sDESCINV) = 'F' Then
            sDESCINV := ''
         Else
            sDESCINV := qryAtuarialDESCINVESTIMENTO.AsString;

         // Capta a Data do Registro atual
         sDataAtu    := FormatDateTime('dd/mm/yyyy',qryAtuarialDATAMOVCARTINV.AsDateTime);
         // Cálculo da Diferença de dias entre os movimentos
         If (Not qryAtuarial.Eof) Then
            iDifDias := DiasUteisInv.IntervaloDias(dDataAnt,qryAtuarialDATAMOVCARTINV.AsDateTime);
         // Cálculo da diferença total de dias
         iDifDiasAcu := iDifDiasAcu + iDifDias;
         lPriPas     := False;

         frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
      qryAtuarial.EnableControls;

      If ((fValorCorrigido = 0) And (fQuantidade = 0) And (fPUAtuarial = 0)) Or
         (frmAguarde.Max   = wReg)  Then
      begin
         fValorCorrigido := fValorCorrigido + qryAtuarialVALORCORRIGIDO.AsFloat;
         fQuantidade     := fQuantidade + qryAtuarialQTDCOTAS.AsFloat;
         fPUAtuarial     := fPUAtuarial + qryAtuarialPU.AsFloat;
      end;

      fPUAtuarial := OperComum.DivValorZero(fValorCorrigido,fQtdTotal);

      lblValorCorrigido.Caption := 'R$ ' + FormatFloat('###,###,###,##0.00', fValorCorrigido);
      lblQuantidade.Caption     := FormatFloat('###,###,###,###,###',fQtdTotal);
      lblPUAtuarial.Caption     := 'R$ ' + FormatFloat('###,###,###,##0.0000', fPUAtuarial);
      frmAguarde.Apaga;
   end;
end;

procedure TfrmConsAtuarial.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  OperComum.LimpaParametros(DmRelAtuarial.qryAtuarial);
  lblValorCorrigido.Caption := 'R$ 0,00';
  lblQuantidade.Caption := '0';
  lblPUAtuarial.Caption := 'R$ 0,000000000'; 
end;

procedure TfrmConsAtuarial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   OperComum.LimpaParametros(DmRelAtuarial.qryAtuarial);
   qryTipoInvest.Close;
   qryInvestimento.Close;
   qryRegra.Close;
   qryEmissor.Close;
end;

procedure TfrmConsAtuarial.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   DmRelAtuarial.qryAtuarial.DisableControls;
   DmRelAtuarial.ppPeriodo.Caption   := 'Período ' + dtDtaInicio.Text+' a '+dtDtaFim.Text;
   DmRelAtuarial.lblValor.Caption     := 'Valor Atuarial : ' + lblValorCorrigido.Caption;
   DmRelAtuarial.lblQtdAtual.Caption  := 'Quantidade Atual : ' + lblQuantidade.Caption;
   DmRelAtuarial.lblPU.Caption        := 'P.U. Atuarial : ' + lblPUAtuarial.Caption;
   TfrmPreview.CreateModalPreview(Application,
                                  DmRelAtuarial.pprAtuarial,
                                  DmRelAtuarial.pprAtuarial.PrinterSetup.DocumentName);
   DmRelAtuarial.qryAtuarial.EnableControls;
end;

procedure TfrmConsAtuarial.FormActivate(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := True;
end;

procedure TfrmConsAtuarial.ppmAtuarialPopup(Sender: TObject);
begin
  inherited;
  if dbgAtuarial.DataSource.DataSet.Active then
  begin
     if dbgAtuarial.FixedCols = 0 then begin
        LiberarColuna.Enabled := False;
        LiberarTodasColunas.Enabled := False;
        end
     else begin
        LiberarColuna.Enabled := True;
        LiberarTodasColunas.Enabled := True;
     end;

     if dbgAtuarial.FixedCols = dbgAtuarial.GetColCount then
        FixarColuna.Enabled := False
     else
        FixarColuna.Enabled := True;
  end
  else
  begin
     LiberarColuna.Enabled := False;
     LiberarTodasColunas.Enabled := False;
     FixarColuna.Enabled := False
  end;
end;

procedure TfrmConsAtuarial.CopiarValorClick(Sender: TObject);
var sTexto: String;
begin
  inherited;
  sTexto := lblValorCorrigido.Caption;
  Delete(sTexto,1,3);
  edtValor.Text := sTexto;
  edtValor.SelectAll;
  edtValor.CopyToClipboard;
end;

procedure TfrmConsAtuarial.CopiarPUClick(Sender: TObject);
var sTexto: String;
begin
  inherited;
  sTexto := lblPUAtuarial.Caption;
  Delete(sTexto,1,3);
  edtValor.Text := sTexto;
  edtValor.SelectAll;
  edtValor.CopyToClipboard;
end;

procedure TfrmConsAtuarial.FixarColunaClick(Sender: TObject);
begin
  inherited;
  dbgAtuarial.FixedCols := dbgAtuarial.FixedCols + 1;
end;

procedure TfrmConsAtuarial.LiberarColunaClick(Sender: TObject);
begin
  inherited;
  dbgAtuarial.FixedCols := dbgAtuarial.FixedCols - 1;
end;

procedure TfrmConsAtuarial.LiberarTodasColunasClick(Sender: TObject);
begin
  inherited;
  dbgAtuarial.FixedCols := 0;
end;

procedure TfrmConsAtuarial.dblConsEmissorExit(Sender: TObject);
begin
  inherited;

   If (Trim(dblConsEmissor.Text) <> '') then
   begin
      qryInvestimento.Filtered := True;
      qryInvestimento.Filter   := ' IDEMISSOR = '+qryEmissor.FieldByName('IDEMISSOR').AsString;
   end
   else
   begin
      qryInvestimento.Filtered := False;
      qryInvestimento.Filter   := '';
   end;

end;

end.
