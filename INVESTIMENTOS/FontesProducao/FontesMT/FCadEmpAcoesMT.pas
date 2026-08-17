//******************************************************************************
// Autor     : Marco Turon
// Data      : 28/05/2008
// Código    : AL_1
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Desenvolvimento da nova tela MT
//******************************************************************************
Unit FCadEmpAcoesMT;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMestreDetMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, TabControlDetalhe, fcLabel, ExtCtrls, uCmSqlParams,
   wwdblook, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, wwdbedit,
   Wwdotdot, Wwdbcomb, dxCntner, dxExEdtr, dxEdLib, dxDBELib,
   FTelaAut, FPreview,
   uOperComum, uMensErro, uFuncoesInvest,
   uCtrlPadroes, uCtrlInvestimento, uCtrlEmpAcoes, uCtrlParamInvest,
   uCtrlDiasUteis, uCtrlInvContab, faMensagem, uCMTypes, RBoletaEmpAcoes,
  DBTables, Wwquery;

Type
   TfrmCadEmpAcoesMT = Class(TFrmCadastroMestreDetMTInv)
      cdsDet: TCMClientDataSet;
      CMSqlParams1: TCMSqlParams;
      CMSqlParams2: TCMSqlParams;
      dtOperacao: TCMDateTimePicker;
      lblDataOper: TLabel;
      lbPlanPrev: TLabel;
      dblkPlanPrev: TwwDBLookupCombo;
      cdsPlanoPatro: TCMClientDataSet;
      CMSqlParams3: TCMSqlParams;
      cdsTipoOperacao: TCMClientDataSet;
      CMSqlParams4: TCMSqlParams;
      lblInvestimento: TLabel;
      dblInvestimento: TwwDBLookupCombo;
      cdsInvestimento: TCMClientDataSet;
      CMSqlParams5: TCMSqlParams;
      lblCustodiante: TLabel;
      dblCustodiante: TwwDBLookupCombo;
      cdsCustodiante: TCMClientDataSet;
      CMSqlParams6: TCMSqlParams;
      lblVencimento: TLabel;
      dtVencimento: TCMDateTimePicker;
      pnlDadosEmp: TPanel;
      lblPreco: TLabel;
      dbrePreco: TDBRealEdit;
      LblTipoConta: TLabel;
      lblQuantidade: TLabel;
      dbreQuantidade: TDBRealEdit;
      lblValor: TLabel;
      dbreValor: TDBRealEdit;
      lblUltimoFechamento: TfcLabel;
      lblTaxa: TLabel;
      dbreTaxa: TDBRealEdit;
      lblFlgPreco: TLabel;
      dbcFlgPreco: TwwDBComboBox;
      dbreVlrEmprestimo: TDBRealEdit;
      lblVlrEmprestimo: TLabel;
      lblVlrMaxResgate: TLabel;
      dbreVlrMaxResgate: TDBRealEdit;
      dbcFlgEmpAcoes: TdxDBCheckEdit;
      PnlSaldoEmp: TPanel;
      lblSaldoCC: TfcLabel;
      lblSaldoCCI: TfcLabel;
      tbsResgates: TTabSheet;
      pnlResgates: TPanel;
      dbgResgates: TwwDBGrid;
      cdsResgates: TCMClientDataSet;
      CMSqlParams7: TCMSqlParams;
      dsResgates: TwwDataSource;
      dbcFlgTipoConta: TwwDBComboBox;
      Label1: TLabel;
      dtDataResg: TCMDateTimePicker;
      pnlSldRev: TPanel;
      lblQtdResg: TfcLabel;
      dbrQtdResg: TDBRealEdit;
      Label2: TLabel;
      Label3: TLabel;
      dbrVlrResg: TDBRealEdit;
      lblVlrJuros: TLabel;
      dbreVlrJurosResg: TDBRealEdit;
      lblIR: TLabel;
      dbrVlrIRResg: TDBRealEdit;
      Label4: TLabel;
      dbrVlrPrincResg: TDBRealEdit;
      Label5: TLabel;
      dbrVlrFinResg: TDBRealEdit;
      Label6: TLabel;
      dbrVlrJurosEst: TDBRealEdit;
      sbtnTransferir: TToolbarButton97;
      sbtnImprimir: TToolbarButton97;
      CdsCarteiraInvest: TCMClientDataSet;
      CdsAux: TCMClientDataSet;
    qryAux: TwwQuery;
    qryAuxDATAHISTEMPACOES: TDateTimeField;
    qryAuxDESCTIPOOPERACAO: TStringField;
    qryAuxVLRHISTEMPACOES: TFloatField;
    qryAuxSLDHISTEMPACOES: TFloatField;
    qryAuxQTDHISTEMPACOES: TFloatField;
    qryAuxSLDQTDHISTEMPACOE: TFloatField;
    qryAuxVLRPRINCIPAL: TFloatField;
    qryAuxSLDPRINCIPAL: TFloatField;
    qryAuxVLRJUROS: TFloatField;
    qryAuxVLRJUROSEST: TFloatField;
    qryAuxSLDJUROS: TFloatField;
    qryAuxVLRJUROSIMPORTA: TFloatField;
    qryAuxSLDJUROSIMPORTA: TFloatField;
    qryAuxVLRFINAL: TFloatField;
    qryAuxSLDFINAL: TFloatField;
    qryAuxVLRPRINCIPAL_1: TFloatField;
    qryAuxSLDPRINCIPAL_1: TFloatField;
    qryAuxIDTIPOOPERACAO: TFloatField;
    qryAuxIDPLANPREVCTBPATR: TFloatField;
    qryAuxIDINVESTIMENTO: TFloatField;
    qryAuxNUMCONTRATOCUSTODIA: TStringField;
    qryAuxIDOPEREMPACOES: TFloatField;
    qryAuxIDOPEREMPACOESAP: TFloatField;
    qryAuxIDHISTEMPACOES: TFloatField;
    qryAuxPLANO: TFloatField;
    qryAuxPLNCODIGO: TFloatField;
    qryAuxCODDOCUMENTO: TFloatField;
    qryAuxTIPOLANCAMENTO: TStringField;
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure CmeCadastroFind(Sender: TObject);
      Procedure cdsDetAfterOpen(DataSet: TDataSet);
      Procedure cdsResgatesAfterOpen(DataSet: TDataSet);
      Procedure sbtnInsDetClick(Sender: TObject);
      Procedure sbtnAltDetClick(Sender: TObject);
      Procedure sbtnConsDetClick(Sender: TObject);
      Procedure dtDataResgExit(Sender: TObject);
      Procedure dbrQtdResgExit(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure dblCustodianteExit(Sender: TObject);
      Procedure dbcFlgTipoContaExit(Sender: TObject);
      Procedure dbcFlgPrecoExit(Sender: TObject);
      Procedure dbrePrecoExit(Sender: TObject);
      Procedure dbreQuantidadeExit(Sender: TObject);
      Procedure dbreTaxaExit(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure CmeCadastroBeforeConfirma(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure CmeDetalheAtualizaBotoes(Sender: TObject);
      Procedure CmeDetalheInsert(Sender: TObject);
      Procedure dbreVlrJurosResgExit(Sender: TObject);
      Procedure CmeDetalheBeforeConfirma(sender: TObject; Var Accept: Boolean);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnExcluiDetClick(Sender: TObject);
      Procedure CmeDetalheDelete(Sender: TObject);
      Procedure dbgrdDetDblClick(Sender: TObject);
      Procedure sbtnTransferirClick(Sender: TObject);
      Procedure sbtnImprimirClick(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
   Private
      { Private declarations }
      bAccept: Boolean;
      CtrlInvest: TCtrlInvestimento;
      CtrlEmpAcoes: TCtrlEmpAcoes;
      CtrlDU: TCtrlInvDiasUteis;
      RelBoleta: TRelBoletaEmpAcoes;

      bResgate: Boolean;

      Procedure BuscaSaldosResgate;
      Procedure RecalculaSaldos;
      Procedure ValidaDetalhe(Sender: TObject);
      Function Sel(iOper: Integer = 0; sNumContratro: String = ''; FazOper: Boolean = True): Boolean;
      Function VerificaEmp: Boolean;
      Function VerificaResg: Boolean;

   Public
      { Public declarations }
      Procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);
   End;

Var
   frmCadEmpAcoesMT: TfrmCadEmpAcoesMT;

Implementation

{$R *.DFM}

Uses uBibliotecaInvest, UImpostos, dBaseDados, FCadTransfCarteira;

Procedure TfrmCadEmpAcoesMT.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlInvest := TCtrlInvestimento.Create;
   CtrlInvest.InitializeAs(Padroes);
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);
   CtrlDU := TCtrlInvDiasUteis.Create;
   CtrlDU.InitializeAs(Padroes);
   RelBoleta := TRelBoletaEmpAcoes.Create(Self);
   CtrlEmpAcoes.CdsOperEmpAcoes := Cds;
   CtrlEmpAcoes.CdsHistEmpAcoes := cdsDet;
   CtrlEmpAcoes.CdsResgEmpAcoes := cdsResgates;

   CdsAux.Data := CtrlEmpAcoes.ListLancVigEmp(0, DATE());

   If Not CdsAux.IsEmpty Then
      Begin
         If CdsAux.FieldByName('TIPOLANC').AsString = 'I' Then // Parâmetro está flegado como = Importado
            Begin
               sbtnInserir.Enabled := False;
               sbtnAlterar.Enabled := False;
            End;
      End;

End;

Procedure TfrmCadEmpAcoesMT.FormDestroy(Sender: TObject);
Begin
   FreeAndNil(CtrlInvest);
   FreeAndNil(CtrlEmpAcoes);
   FreeAndNil(CtrlDU);
   FreeAndNil(RelBoleta);
   Inherited;
End;

Procedure TfrmCadEmpAcoesMT.cdsDetAfterOpen(DataSet: TDataSet);
Var i: Word;
Begin
   Inherited;
   For i := 0 To TCMClientDataSet(DataSet).FieldCount - 1 Do
      Begin
         If TCMClientDataSet(DataSet).Fields[i].FieldName = 'DATAHISTEMPACOES' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Data';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 12;
               TDateField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := 'dd/mm/yyyy';
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'DESCTIPOOPERACAO' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Operação';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 44;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'QTDHISTEMPACOES' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Quant. Movim.';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 11;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'SLDQTDHISTEMPACOE' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Saldo de Qtd.';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 11;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRHISTEMPACOES' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Valor Movim.';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 15;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'SLDHISTEMPACOES' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Saldo';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 16;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRJUROSIMPORTA' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Juros Movim.';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 14;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'SLDJUROSIMPORTA' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Saldo Juros';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 10;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRJUROSEST' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Juros Estornado';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 10;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRFINAL' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Vlr. Final Movim.';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 10;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'SLDFINAL' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Saldo Vlr. Final';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 10;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRPRINCIPAL' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Vlr. Principal Movim.';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 14;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'SLDPRINCIPAL' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Saldo Vlr. Principal';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 13;
            End
         Else
            TCMClientDataSet(DataSet).Fields[i].Visible := False;
      End;

End;

Procedure TfrmCadEmpAcoesMT.cdsResgatesAfterOpen(DataSet: TDataSet);
Var i: Word;
Begin
   Inherited;
   For i := 0 To TCMClientDataSet(DataSet).FieldCount - 1 Do
      Begin
         If TCMClientDataSet(DataSet).Fields[i].FieldName = 'DATAOPERACAO' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Data';
               TDateField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := 'dd/mm/yyyy';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 11;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'QTDOPERACAO' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Quantidade';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 12;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLROPERACAO' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Valor da Operação';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 17;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRJUROS' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Valor de Juros';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 14;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRIR' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'I.R.';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 8;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRPRINCIPAL' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Principal Revertido';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 17;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRRESGATE' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Vlr. Final Revertido';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 17;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRJUROSEST' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Juros Estornado';
               TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 13;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'CODDOCUMENTO' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Cod.Documento';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 10;
            End
         Else If TCMClientDataSet(DataSet).Fields[i].FieldName = 'PLNCODIGO' Then
            Begin
               TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Cod.Planilha';
               TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 10;
            End
               //     else if TCMClientDataSet(DataSet).Fields[i].FieldName = 'PUOPERACAO' then
               //     begin
               //        TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'P.U.';
               //        TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00000';
               //        TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 10;
               //     end
               //     else if TCMClientDataSet(DataSet).Fields[i].FieldName = 'VLRRESGATEATU' then
               //     begin
               //        TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Vlr Resgate Atual';
               //        TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               //        TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 14;
               //     end
               //     else if TCMClientDataSet(DataSet).Fields[i].FieldName = 'VALOREMPRESTIMO' then
               //     begin
               //        TCMClientDataSet(DataSet).Fields[i].DisplayLabel := 'Vlr. Empréstimo';
               //        TFloatField(TCMClientDataSet(DataSet).Fields[i]).DisplayFormat := '#,##0.00';
               //        TCMClientDataSet(DataSet).Fields[i].DisplayWidth := 13;
               //     end
         Else
            TCMClientDataSet(DataSet).Fields[i].Visible := False;
      End;

End;

Function TfrmCadEmpAcoesMT.Sel(iOper: Integer = 0; sNumContratro: String = ''; FazOper: Boolean = True): Boolean;
Begin
   If FazOper Then
      Cds.Data := CtrlEmpAcoes.ListOperEmpAcoes(iOper, sNumContratro);
   lbNomItem.Caption := 'Empréstimo de Ações ' + OperComum.IIF(Cds.FieldByName('IDBOLETA').IsNull, '', Cds.FieldByName('IDBOLETA').AsString);
   If iOper > 0 Then
      Begin
         cdsDet.Data := CtrlEmpAcoes.ListOperHistEmpAcoes(Cds.FieldByName('IDOPEREMPACOES').AsInteger, '');
         cdsResgates.Data := CtrlEmpAcoes.ListOperResgEmpAcoes(Cds.FieldByName('IDOPEREMPACOES').AsInteger, '');
      End
   Else
      Begin
         cdsDet.Data := CtrlEmpAcoes.ListOperHistEmpAcoes(0, Cds.FieldByName('NUMCONTRATOCUSTODIA').AsString);
         cdsResgates.Data := CtrlEmpAcoes.ListOperResgEmpAcoes(0, Cds.FieldByName('NUMCONTRATOCUSTODIA').AsString);
      End;
   CtrlEmpAcoes.VerificaSaldoEmp(Cds.FieldByName('DATAOPERACAO').AsDateTime,
      Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger,
      Cds.FieldByName('IDINVESTIMENTO').AsInteger,
      Cds.FieldByName('IDCUSTODIANTE').AsInteger,
      Cds.FieldByName('IDTIPOOPERACAO').AsInteger);
   lblSaldoCC.Caption := FormatFloat('#,##0', CtrlEmpAcoes.SaldoQtdCC) + ' CC';
   lblSaldoCCI.Caption := FormatFloat('#,##0', CtrlEmpAcoes.SaldoQtdCCI) + ' CCI';
   CmeCadastro.AtualizaBotoes(Self);
   cdsTipoOperacao.Data := CtrlInvest.ListTipoOperacao(2, Cds.FieldByName('IDTIPOOPERACAO').AsInteger);
End;

Procedure TfrmCadEmpAcoesMT.FormShow(Sender: TObject);
Begin
   Inherited;

   CdsCarteiraInvest.Data := CtrlInvest.ListCarteira(2, -1, 0);
   cdsPlanoPatro.Data := CtrlInvest.ListPlanoPatro;
   cdsInvestimento.Data := CtrlInvest.ListInvestimento(-1, 2);
   cdsCustodiante.Data := CtrlInvest.ListCustodiante;
   cdsTipoOperacao.Data := CtrlInvest.ListTipoOperacao(0);
   Cds.Data := CtrlEmpAcoes.ListOperEmpAcoes;
   cdsDet.Data := CtrlEmpAcoes.ListOperHistEmpAcoes;
   cdsResgates.Data := CtrlEmpAcoes.ListOperResgEmpAcoes;

   lblUltimoFechamento.Caption := 'Último Fechamento: ' + FormatDateTime('dd/mm/yyyy', CtrlPInv.DataUltFechEmp);

   Sel(-1);

   CdsAux.Data := CtrlEmpAcoes.ListLancVigEmp(0, DATE());

   If Not CdsAux.IsEmpty Then
      Begin
         If CdsAux.FieldByName('TIPOLANC').AsString = 'I' Then // Parâmetro está flegado como = Importado
            Begin
               sbtnInserir.Enabled := False;
               sbtnAlterar.Enabled := False;
            End;
      End;
End;

Procedure TfrmCadEmpAcoesMT.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;

   If Not MontaSelect.RetornouValor Then
      Exit;

   Sel(StrToInt(opercomum.IIF(MontaSelect.ValoresChave[1] = '', '0', MontaSelect.ValoresChave[1])), MontaSelect.ValoresChave[2]);

   CdsAux.Data := CtrlEmpAcoes.ListLancVigEmp(0, DATE());

   If Not CdsAux.IsEmpty Then
      Begin
         If CdsAux.FieldByName('TIPOLANC').AsString = 'I' Then // Parâmetro está flegado como = Importado
            Begin
               sbtnInserir.Enabled := False;
               sbtnAlterar.Enabled := False;
            End;
      End;

End;

Procedure TfrmCadEmpAcoesMT.ValidaDetalhe(Sender: TObject);
Begin
   If pgctrlDetalhe.ActivePage = tbsResgates Then
      Begin
         sbtnInsDet.Enabled := (CmeCadastro.Operacao = opAlterar);
         sbtnAltDet.Enabled := False;
         sbtnConsDet.Visible := True;
      End
   Else
      Begin
         sbtnInsDet.Enabled := False;
         sbtnAltDet.Enabled := False;
         sbtnExcluiDet.Enabled := False;
         sbtnConsDet.Visible := False;
      End;
End;

Procedure TfrmCadEmpAcoesMT.sbtnInsDetClick(Sender: TObject);
Begin
   Inherited;
   pnlSldRev.Visible := True;
   If dtDataResg.CanFocus Then
      dtDataResg.SetFocus;
End;

Procedure TfrmCadEmpAcoesMT.sbtnAltDetClick(Sender: TObject);
Begin
   Inherited;
   pnlSldRev.Visible := False;
End;

Procedure TfrmCadEmpAcoesMT.sbtnConsDetClick(Sender: TObject);
Begin
   Inherited;
   pnlSldRev.Visible := False;
End;

Procedure TfrmCadEmpAcoesMT.BuscaSaldosResgate;
Begin
   If Trim(dtDataResg.Text) <> '' Then
      Begin
         CtrlEmpAcoes.BuscaSaldoEmp.Executa(dtDataResg.DateTime, Cds.FieldByName('IDOPEREMPACOESAP').AsInteger);
         lblQtdResg.Caption := FormatFloat('#,##0', CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp);
         dbrQtdResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp;
         dbrVlrResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldVlrEmp;
         dbreVlrJurosResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldJurEmp;
         dbrVlrPrincResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldPriEmp;
         dbrVlrFinResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldFinEmp;
      End;
End;

Procedure TfrmCadEmpAcoesMT.RecalculaSaldos;
Var fAliquota: Double;
Begin
   If dbrQtdResg.Value > 0 Then
      Begin
         dbrVlrResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldVlrEmp * (dbrQtdResg.Value / CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp);
         dbreVlrJurosResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldJurEmp * (dbrQtdResg.Value / CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp);
         dbrVlrPrincResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldPriEmp * (dbrQtdResg.Value / CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp);
         dbrVlrFinResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldFinEmp * (dbrQtdResg.Value / CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp);

         If cdsTipoOperacao.FieldByName('FLGTRATAIR').AsString = 'S' Then
            Begin
               // Atenção:  Este método não é 3 camadas
               fAliquota := Impostos.BuscaAliquotaIR(2, cdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger, -1, dtDataResg.DateTime);
               dbrVlrIRResg.Value := OperComum.Round((dbreVlrJurosResg.Value * OperComum.DivValorZero(fAliquota, 100)), 2);
            End
         Else
            dbrVlrIRResg.Value := 0;
      End
   Else
      Begin
         dbrVlrResg.Value := 0;
         dbreVlrJurosResg.Value := 0;
         dbrVlrPrincResg.Value := 0;
         dbrVlrFinResg.Value := 0;
         dbrVlrIRResg.Value := 0;
      End;
End;

Procedure TfrmCadEmpAcoesMT.dtDataResgExit(Sender: TObject);
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         If cdsResgates.State = dsInsert Then
            Begin
               If dbrQtdResg.Value > 0 Then
                  Begin
                     If MsgDlg('Refaz os saldos?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
                        BuscaSaldosResgate;
                  End
               Else
                  BuscaSaldosResgate;
            End;
      End;
End;

Procedure TfrmCadEmpAcoesMT.dbrQtdResgExit(Sender: TObject);
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         If cdsResgates.State = dsInsert Then
            Begin
               If dbrQtdResg.Value <> 0 Then
                  Begin
                     If CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp <> dbrQtdResg.Value Then
                        Begin
                           If CtrlEmpAcoes.BuscaSaldoEmp.HSSldVlrEmp <> dbrVlrResg.Value Then
                              Begin
                                 If MsgDlg('Recalcula os saldos?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
                                    RecalculaSaldos;
                              End
                           Else
                              RecalculaSaldos;
                        End
                     Else If CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp < dbrQtdResg.Value Then
                        Begin
                           MsgDlg('A quantidade revertida não pode ser maior que o saldo para reversão', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                           dbrQtdResg.Value := CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp;
                           If dbrQtdResg.CanFocus Then
                              dbrQtdResg.SetFocus;
                        End;
                  End;
            End;
      End;
End;

Procedure TfrmCadEmpAcoesMT.sbtnInserirClick(Sender: TObject);
Begin

   Inherited;
   pnlDados.Enabled := True;
   dbcFlgEmpAcoes.State := cbsUnchecked;

   //Sugere o Plano/Patrocinadora do login
   cds.FieldByName('IDPLANPREVCTBPATR').AsInteger := CtrlPInv.IdPlanPrevCtbPatr;
   //Movimento Manual para identificar, conforme as novas rotinas de importação.
   cds.FieldByName('TIPOLANCAMENTO').AsString := 'M';

   If dtOperacao.CanFocus Then
      dtOperacao.SetFocus;

   bResgate := False;

   // Como fazer para zerar os registros filhos na inserção de um novo Pai
   Sel(0, '', False);
End;

Procedure TfrmCadEmpAcoesMT.sbtnApagarClick(Sender: TObject);
Begin
   If TRIM(Cds.FieldByName('NUMCONTRATOCUSTODIA').AsString) <> '' Then
      Begin
         If MsgDlg('Operação realizada via Importação do Movimento de Empréstimo de Ações, deseja continuar ?', 'Atenção !', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            Exit;
      End;
   If CtrlEmpAcoes.EmpMarcado(Cds.FieldByName('IDOPEREMPACOESAP').AsInteger) Then
      Begin
         MsgDlg(CtrlEmpAcoes.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         CmeCadastro.AtualizaBotoes(Sender);
      End
   Else If (Not cdsResgates.IsEmpty) Then
      Begin
         MsgDlg('Existe(m) resgate(s) para este empréstimo.' + #13 +
            'Não é possível excluir a operação', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         CmeCadastro.AtualizaBotoes(Sender);
      End
   Else
      Begin
         CtrlEmpAcoes.IdOperEmpAcoes := Cds.FieldByName('IDOPEREMPACOES').AsInteger;
         Inherited;
      End;
End;

Procedure TfrmCadEmpAcoesMT.dblCustodianteExit(Sender: TObject);
Begin
   Inherited;
   CtrlEmpAcoes.VerificaSaldoEmp(Cds.FieldByName('DATAOPERACAO').AsDateTime,
      Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger,
      Cds.FieldByName('IDINVESTIMENTO').AsInteger,
      Cds.FieldByName('IDCUSTODIANTE').AsInteger, -52);
   lblSaldoCC.Caption := FormatFloat('#,##0', CtrlEmpAcoes.SaldoQtdCC) + ' CC';
   lblSaldoCCI.Caption := FormatFloat('#,##0', CtrlEmpAcoes.SaldoQtdCCI) + ' CCI';
End;

Procedure TfrmCadEmpAcoesMT.dbcFlgTipoContaExit(Sender: TObject);
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         If dbcFlgTipoConta.Value = '0' Then
            Begin
               {         if CtrlEmpAcoes.SaldoQtdCC = 0 then
                        begin
                           MsgDlg('Não há saldo CC na carteira de empréstimo', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                           dbreQuantidade.Value := 0;
                           if dbcFlgTipoConta.CanFocus then
                              dbcFlgTipoConta.SetFocus;
                           Exit;
                        end;}
               If dbreQuantidade.Value = 0 Then
                  dbreQuantidade.Value := CtrlEmpAcoes.SaldoQtdCC;
               cdsTipoOperacao.Data := CtrlInvest.ListTipoOperacao(2, -52);
            End
         Else If dbcFlgTipoConta.Value = '1' Then
            Begin
               {         if CtrlEmpAcoes.SaldoQtdCCI = 0 then
                        begin
                           MsgDlg('Não há saldo CCI na carteira de empréstimo', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                           dbreQuantidade.Value := 0;
                           if dbcFlgTipoConta.CanFocus then
                              dbcFlgTipoConta.SetFocus;
                           Exit;
                        end;}
               If dbreQuantidade.Value = 0 Then
                  dbreQuantidade.Value := CtrlEmpAcoes.SaldoQtdCCI;
               cdsTipoOperacao.Data := CtrlInvest.ListTipoOperacao(2, -10052);
            End;
      End;
End;

Procedure TfrmCadEmpAcoesMT.dbcFlgPrecoExit(Sender: TObject);
Var dDataRef: TDateTime;
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         If Trim(dbcFlgPreco.Text) <> '' Then
            Begin
               Try
                  If dbcFlgPreco.Value = 'O' Then
                     dDataRef := CtrlDU.UltDiaUtilAnterior(CtrlPInv.IDEmpresa, dtOperacao.DateTime, True, False, False)
                  Else If dbcFlgPreco.Value = 'H' Then
                     dDataRef := dtOperacao.DateTime
                  Else If dbcFlgPreco.Value = 'V' Then
                     dDataRef := dtVencimento.DateTime;
                  If Not CtrlEmpAcoes.BuscaCotacao(dDataRef, StrToInt(dblInvestimento.LookupValue)) Then
                     Raise Exception.Create(CtrlEmpAcoes.MessageInfo);
                  dbrePreco.Value := CtrlEmpAcoes.CotacaoValor;
               Except
                  On E: Exception Do
                     MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
               End;
            End;
      End;
End;

Procedure TfrmCadEmpAcoesMT.dbrePrecoExit(Sender: TObject);
Begin
   Inherited;
   dbreValor.Value := dbrePreco.Value * dbreQuantidade.Value;
End;

Procedure TfrmCadEmpAcoesMT.dbreQuantidadeExit(Sender: TObject);
Var iSaldo: Integer;
   iSaldoAnt: Integer;
   sValor: String;
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         {      if dbcFlgTipoConta.Value = '0' then
                  iSaldo := CtrlEmpAcoes.SaldoQtdCC
               else
                  iSaldo := CtrlEmpAcoes.SaldoQtdCCI;

               if VarIsNull(Cds.FieldByName('QTDOPERACAO').OldValue) then
                  iSaldoAnt := Cds.FieldByName('QTDOPERACAO').Value
               else
                  iSaldoAnt := Cds.FieldByName('QTDOPERACAO').OldValue;

               if ((CmeCadastro.Operacao = opAlterar) and (dbreQuantidade.Value > (iSaldo + iSaldoAnt))) or
                  ((CmeCadastro.Operacao <> opAlterar) and (dbreQuantidade.Value > iSaldo)) then
               begin
                  MsgDlg('A quantidade emprestada não pode ser maior que o saldo' + #13 +
                         'bloqueado na carteira de empréstimo', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                  dbreQuantidade.Value := iSaldo;
                  if dbreQuantidade.CanFocus then
                     dbreQuantidade.SetFocus;
               end;}
         dbreValor.Value := dbrePreco.Value * dbreQuantidade.Value;
      End;
End;

Procedure TfrmCadEmpAcoesMT.dbreTaxaExit(Sender: TObject);
Var sSql: String;
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         Try
            If CtrlPInv.IdRegraEmpAcoes = 0 Then
               Begin
                  MsgDlg('A Regra de Empréstimo de Ações não definida no Parâmetro do Sistema.', 'Mensagem do Sistema', MtWarning, [MbOk], 0);
                  dbrVlrResg.Value := 0;
                  Exit;
               End
            Else If Trim(dtOperacao.Text) = '' Then
               Begin
                  MsgDlg('A Data para o Empréstimo não foi informada.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
                  If dtOperacao.CanFocus Then
                     dtOperacao.SetFocus;
                  Exit;
               End
            Else If Trim(dtVencimento.Text) = '' Then
               Begin
                  MsgDlg('A Data de Vencimento do Empréstimo não foi informada', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
                  If dtVencimento.CanFocus Then
                     dtVencimento.SetFocus;
                  Exit;
               End
            Else If dbreValor.Value = 0 Then
               Begin
                  MsgDlg('O Valor da operação de Empréstimo não foi informado', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
                  If dbreValor.CanFocus Then
                     dbreValor.SetFocus;
                  Exit;
               End;

            sSql := 'SELECT ' + #13 +
               QuotedStr(FormatDateTime('dd/mm/yyyy', dtOperacao.Date)) + ' AS DATAEMISSAO,' + #13 +
               QuotedStr(FormatDateTime('dd/mm/yyyy', dtVencimento.Date)) + ' AS DATAATUAL,' + #13 +
               QuotedStr(cdsTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString) + ' AS NATUREZAOPER,' + #13 +
               FuncoesInvest.TrocaVirgulaPonto(FormatFloat('0.##', dbreValor.Value)) + ' AS VLRPRINCIPAL,' + #13 +
               FuncoesInvest.TrocaVirgulaPonto(FormatFloat('0.##', dbreTaxa.Value)) + ' AS TAXA,' + #13 +
               '1 AS IDPAIS, -1 AS IDCIDADES, -1 AS CODESTADO' + #13 +
               'FROM DUAL';

            CtrlEmpAcoes.FazRegra(CtrlPInv.IdRegraEmpAcoes, Nil, sSql);
            dbreVlrMaxResgate.Value := CtrlEmpAcoes.RegraResult;
            dbreVlrEmprestimo.Value := CtrlEmpAcoes.RegraResult - Cds.FieldByName('VLROPERACAO').AsFloat;
         Except
            On E: Exception Do
               Begin
                  MsgDlg('Não foi possível calcular o Valor do Resgate' + #13 +
                     'Mensagem: ' + E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);

                  dbreVlrMaxResgate.Value := 0;
                  dbreVlrEmprestimo.Value := 0;
               End;
         End;
      End;
End;

Function TfrmCadEmpAcoesMT.VerificaEmp: Boolean;
Begin
   Result := False;
   Try
      // Verifica campos basicos
      If Trim(dtOperacao.Text) = '' Then
         Raise EValidacao.Create('Data da operação não informada.', dtOperacao)
      Else
         If Trim(dtVencimento.Text) = '' Then
            Raise EValidacao.Create('Data de vencimento da operação não informada.', dtVencimento)
         Else
            If dtVencimento.Date <= dtOperacao.Date Then
               Raise EValidacao.Create('A Data de vencimento deve ser superior à data da operação.', dtVencimento)
            Else
               If Trim(dblkPlanPrev.Text) = '' Then
                  Raise EValidacao.Create('Plano / Patrocinadora não selecionado.', dblkPlanPrev)
               Else
                  If Trim(dblInvestimento.Text) = '' Then
                     Raise EValidacao.Create('Investimento não selecionado.', dblInvestimento)
                  Else
                     If Trim(dblCustodiante.Text) = '' Then
                        Raise EValidacao.Create('Custodiante não selecionado.', dblCustodiante);

      If Trim(dbcFlgTipoConta.Text) = '' Then
         Raise EValidacao.Create('Tipo de Conta não selecionado.', dbcFlgTipoConta)
      Else
         If Trim(dbcFlgPreco.Text) = '' Then
            Raise EValidacao.Create('Dia do preço não selecionado.', dbcFlgPreco)
         Else
            If dbrePreco.Value = 0 Then
               Raise EValidacao.Create('Preço não informado.', dbrePreco)
            Else
               If dbreQuantidade.Value = 0 Then
                  Raise EValidacao.Create('Quantidade não informada.', dbreQuantidade)
               Else
                  If dbreValor.Value = 0 Then
                     Raise EValidacao.Create('Valor não informado.', dbreValor)
                  Else
                     If dbreTaxa.Value = 0 Then
                        Raise EValidacao.Create('Taxa não informada.', dbreTaxa)
                     Else
                        If dbreVlrEmprestimo.Value = 0 Then
                           Raise EValidacao.Create('Valor do Empréstimo não informado.', dbreVlrEmprestimo)
                        Else
                           If dbreVlrMaxResgate.Value = 0 Then
                              Raise EValidacao.Create('Valor Máximo do Resgate não informado.', dbreVlrMaxResgate)
                           Else
                              If dbcFlgEmpAcoes.State = cbsGrayed Then
                                 Raise EValidacao.Create('Falta definir se permite reversão antes do vencimento.', dbcFlgEmpAcoes)
                              Else
                                 If (cdsTipoOperacao.IsEmpty) Or
                                    ((cdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger < -1000) And (dbcFlgTipoConta.Value = '0')) Or
                                    ((cdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger > -1000) And (dbcFlgTipoConta.Value = '1')) Then
                                    Raise EValidacao.Create('Selecione um saldo CC ou CCI para selecionar o tipo de operação utilizado', dbcFlgPreco)
                                 Else
                                    If Not CtrlInvContab.TestaPeriodo(dtOperacao.Text, 2, 5) Then
                                       Raise EValidacao.Create(CtrlInvContab.MessageInfo, dtOperacao)
                                    Else
                                       If Not CtrlInvContab.TestaPeriodo(dtOperacao.Text, 2) Then
                                          Raise EValidacao.Create(CtrlInvContab.MessageInfo, dtOperacao)
                                       Else
                                          If (dtOperacao.DateTime < CtrlPInv.DataUltFechEmp) And
                                             (CmeCadastro.Operacao = opInserir) Then
                                             Begin
                                                If OperComum.InvMsgBox('A data da operação é anterior ao último fechamento, ' + #13 +
                                                   'continuar implicará em reprocessar o empréstimo',
                                                   mtWarning, 'Mensagem do Sistema', [mbOk, mbCancel], 'Continua;Cancela') = mrCancel Then
                                                   Raise EValidacao.Create('Operação cancelada pelo usuário', bbtnCancelar);
                                             End;
      Result := True;
   Except
      On ev: EValidacao Do
         Begin
            If ev.Show Then
               MsgDlg(ev.message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Repaint;
            If ev.Control.CanFocus Then
               ev.Control.SetFocus;
         End;
   End;

End;

Function TfrmCadEmpAcoesMT.VerificaResg: Boolean;
Begin
   Result := False;
   Try
      // Verifica campos basicos
      If Trim(dtDataResg.Text) = '' Then
         Raise EValidacao.Create('Data da reversão não informada', dtDataResg)
      Else
         If dbrQtdResg.Value = 0 Then
            Raise EValidacao.Create('Quantidade revertida não informada', dbrQtdResg)
         Else
            If dbrVlrResg.Value = 0 Then
               Raise EValidacao.Create('Valor da reversão não informado', dbrVlrResg)
            Else
               If dbreVlrJurosResg.Value = 0 Then
                  Raise EValidacao.Create('Valor de juros não informada', dbreVlrJurosResg)
               Else
                  If dbrVlrPrincResg.Value = 0 Then
                     Raise EValidacao.Create('Principal revertido não informado', dbrVlrPrincResg)
                  Else
                     If dbrVlrFinResg.Value = 0 Then
                        Raise EValidacao.Create('Valor final revertido não informado', dbrVlrFinResg)
                     Else
                        // Verifica informações contábeis
                        If Not CtrlInvContab.TestaPeriodo(dtDataResg.Text, 2, 5) Then
                           Raise EValidacao.Create(CtrlInvContab.MessageInfo, dtDataResg)
                        Else
                           If Not CtrlInvContab.TestaPeriodo(dtDataResg.Text, 2) Then
                              Raise EValidacao.Create(CtrlInvContab.MessageInfo, dtDataResg)
                           Else
                              // Verifica reprocessamento
                              If dtDataResg.DateTime < CtrlPInv.DataUltFechEmp Then
                                 Begin
                                    If OperComum.InvMsgBox('A data da reversão é anterior ao último fechamento, ' + #13 +
                                       'continuar implicará em reprocessar o empréstimo',
                                       mtWarning, 'Mensagem do Sistema', [mbOk, mbCancel], 'Continua;Cancela') = mrCancel Then
                                       Raise EValidacao.Create('Operação cancelada pelo usuário', bbtnCancelar)
                                    Else
                                       Begin
                                          Try
                                             cdsDet.DisableControls;
                                             cdsDet.Filtered := False;
                                             cdsDet.Filter := '(DATAHISTEMPACOES > ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtDataResg.DateTime)) + ') ';
                                             cdsDet.Filtered := True;
                                             While Not cdsDet.eof Do
                                                cdsDet.Delete;

                                          Finally
                                             cdsDet.Filtered := False;
                                             cdsDet.EnableControls;
                                          End;
                                       End;
                                 End;
      Result := True;
   Except
      On ev: EValidacao Do
         Begin
            If ev.Show Then
               MsgDlg(ev.message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Repaint;
            If ev.Control.CanFocus Then
               ev.Control.SetFocus;
         End;
   End;

End;

Procedure TfrmCadEmpAcoesMT.bbtnConfirmarClick(Sender: TObject);
Var iMercadoOrig, iMercadoDest: Integer;
   bTransfere: Boolean;
Begin
   Try
      Try
         CmeCadastro.RepetirInsert := False;

         If dbcFlgTipoConta.Value = '0' Then
            bTransfere := CtrlEmpAcoes.SaldoQtdCC < dbreQuantidade.Value
         Else If dbcFlgTipoConta.Value = '1' Then
            bTransfere := CtrlEmpAcoes.SaldoQtdCCI < dbreQuantidade.Value;

         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         If bTransfere Then
            Begin
               CdsCarteiraInvest.Locate('IDCARTEIRAINVEST', OperComum.IIF((Not bResgate), pRPI.IDCARTORIGEMPACOES, pRPI.IDCARTEMPACOES), []);
               iMercadoOrig := CdsCarteiraInvest.FieldByName('IDMERCADO').AsInteger;
               CdsCarteiraInvest.Locate('IDCARTEIRAINVEST', OperComum.IIF((Not bResgate), pRPI.IDCARTEMPACOES, pRPI.IDCARTORIGEMPACOES), []);
               iMercadoDest := CdsCarteiraInvest.FieldByName('IDMERCADO').AsInteger;

               If Not OperComum.ProcessaTransfCarteira(OperComum.IIF((Not bResgate), pRPI.IDCARTORIGEMPACOES, pRPI.IDCARTEMPACOES),
                  OperComum.IIF((Not bResgate), pRPI.IDCARTEMPACOES, pRPI.IDCARTORIGEMPACOES),
                  cdsInvestimento.FieldByName('IDEMISSOR').AsInteger,
                  cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                  StrToInt(dblCustodiante.LookupValue), StrToInt(dblCustodiante.LookupValue),
                  OperComum.IIF((Not bResgate), -1, pRPI.IDMOTBLOQEMPAC),
                  OperComum.IIF((Not bResgate), pRPI.IDMOTBLOQEMPAC, -1),
                  iMercadoOrig, iMercadoDest,
                  StrToInt(dblkPlanPrev.LookupValue), StrToInt(dbcFlgTipoConta.Value),
                  cdsInvestimento.FieldByName('DESCINVESTIMENTO').AsString,
                  dbreQuantidade.Value,
                  OperComum.IIF((Not bResgate), dtOperacao.DateTime, dtDataResg.DateTime)) Then
                  Raise Exception.Create('Por favor verificar o problema, a operação não será confirmada!');
            End;

         Inherited;

         If Not bAccept Then
            Raise Exception.Create('Operação Cancelada!');

         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;

         If bAccept Then
            Sel(Cds.FieldByName('IDOPEREMPACOES').AsInteger);

      Except
         On E: Exception Do
            Begin
               MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;
            End;
      End;
   Finally
      //      Sel(Cds.FieldByName('IDOPEREMPACOES').AsInteger);
      CdsAux.Data := CtrlEmpAcoes.ListLancVigEmp(0, DATE());

      If Not CdsAux.IsEmpty Then
         Begin
            If CdsAux.FieldByName('TIPOLANC').AsString = 'I' Then // Parâmetro está flegado como = Importado
               Begin
                  sbtnInserir.Enabled := False;
                  sbtnAlterar.Enabled := False;
               End;
         End;
   End;

End;

Procedure TfrmCadEmpAcoesMT.CmeCadastroBeforeConfirma(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         If Cds.State = dsInsert Then
            Begin
               CtrlEmpAcoes.IdOperEmpAcoes := CtrlEmpAcoes.GetSequence('OPEREMPACOES');
               Cds.FieldByName('IDOPEREMPACOES').AsInteger := CtrlEmpAcoes.IdOperEmpAcoes;
               Cds.FieldByName('IDOPEREMPACOESAP').AsInteger := CtrlEmpAcoes.IdOperEmpAcoes;
               Cds.FieldByName('IDTIPOOPERACAO').AsInteger := CdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
               Cds.FieldByName('IDCARTEIRAINVEST').AsInteger := CtrlPInv.IdCartEmpAcoes;
               Cds.FieldByName('IDTIPOINVEST').AsInteger := CtrlPInv.IdTipoInvest;
               Cds.FieldByName('TIPOCONFIRMADO').AsString := 'N';
            End;

         If Cds.State In dsEditModes Then
            Accept := VerificaEmp;

         //      CmeCadastro.RepetirInsert := False;

      End;
End;

Procedure TfrmCadEmpAcoesMT.CmeDetalheBeforeConfirma(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   If Not (csDestroying In frmCadEmpAcoesMT.ComponentState) Then
      Begin
         If cdsResgates.State = dsInsert Then
            Begin
               CtrlEmpAcoes.IdOperEmpAcoes := CtrlEmpAcoes.GetSequence('OPEREMPACOES');
               cdsResgates.FieldByName('IDOPEREMPACOES').AsInteger := CtrlEmpAcoes.IdOperEmpAcoes;
               cdsResgates.FieldByName('IDOPEREMPACOESAP').AsInteger := Cds.FieldByName('IDOPEREMPACOES').AsInteger;
               cdsResgates.FieldByName('IDTIPOOPERACAO').AsInteger := CdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
               cdsResgates.FieldByName('IDCARTEIRAINVEST').AsInteger := CtrlPInv.IdCartEmpAcoes;
               cdsResgates.FieldByName('IDTIPOINVEST').AsInteger := CtrlPInv.IdTipoInvest;
               cdsResgates.FieldByName('TIPOCONFIRMADO').AsString := 'N';
               cdsResgates.FieldByName('IDINVESTIMENTO').AsInteger := Cds.FieldByName('IDINVESTIMENTO').AsInteger;
               cdsResgates.FieldByName('IDCUSTODIANTE').AsInteger := Cds.FieldByName('IDCUSTODIANTE').AsInteger;
               cdsResgates.FieldByName('IDPLANPREVCTBPATR').AsInteger := Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               cdsResgates.FieldByName('DATAVENCOPER').AsDateTime := Cds.FieldByName('DATAVENCOPER').AsDateTime;
               cdsResgates.FieldByName('PUOPERACAO').AsFloat := cdsResgates.FieldByName('VLROPERACAO').AsFloat / cdsResgates.FieldByName('QTDOPERACAO').AsFloat;
               cdsResgates.FieldByName('FLGTIPOCONTA').AsInteger := Cds.FieldByName('FLGTIPOCONTA').AsInteger;
               cdsResgates.FieldByName('TIPOLANCAMENTO').AsString := 'M'; // Lançado Manualmente;
            End;

         If cdsResgates.State In dsEditModes Then
            Accept := VerificaResg;

         CmeDetalhe.RepetirInsert := False;
      End;
End;

Procedure TfrmCadEmpAcoesMT.CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
Begin
   Try
      // ---- Na inclusão de empréstimo não pode haver resgates

      // Verificar como é feita a chamada e a execussão do método de evento do CMCronometro

      CtrlEmpAcoes.AtualizaProcesso := AtualizaProg;
      Accept := CtrlEmpAcoes.GravaOperEmpAcoes;
      If Not Accept Then
         MsgDlg('Não foi possível gravar esta operação.' + #13 +
            'Motivo: ' + CtrlEmpAcoes.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      bAccept := Accept;
      Inherited;
   Finally
      CtrlEmpAcoes.AtualizaProcesso := Nil;
   End;
End;

Procedure TfrmCadEmpAcoesMT.CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
Begin
   Try
      // ---- Na exclusão é atualizada uma progressbar na tela
      CtrlEmpAcoes.AtualizaProcesso := AtualizaProg;
      Accept := CtrlEmpAcoes.ExcluiOperEmpAcoes;
      bAccept := Accept;
      If Not Accept Then
         MsgDlg(CtrlEmpAcoes.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0)
      Else
         Sel(CtrlEmpAcoes.IdOperEmpAcoes);

      Inherited;
   Finally
      CtrlEmpAcoes.AtualizaProcesso := Nil;
   End;
End;

Procedure TfrmCadEmpAcoesMT.AtualizaProg(sMsg: String = ''; iMax: Integer = -1);
Begin
   If iMax = -3 Then
      frmCadEmpAcoesMT.fraMens.Apaga
   Else If iMax = -2 Then
      frmCadEmpAcoesMT.fraMens.Mostra
   Else If iMax = -1 Then
      frmCadEmpAcoesMT.fraMens.Incrementa;

   If sMsg <> '' Then
      frmCadEmpAcoesMT.fraMens.Mes := sMsg;

   If iMax > 0 Then
      Begin
         If Not frmCadEmpAcoesMT.fraMens.Visible Then
            frmCadEmpAcoesMT.fraMens.Mostra;
         frmCadEmpAcoesMT.fraMens.Max := iMax;
         frmCadEmpAcoesMT.fraMens.Min := 0;
         frmCadEmpAcoesMT.fraMens.Pos := 0;
      End;

   Application.ProcessMessages;
End;

Procedure TfrmCadEmpAcoesMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
   Inherited;
   pnlDados.Enabled := ((CmeCadastro.Operacao = OpInserir) Or (CmeCadastro.Operacao = OpAlterar));
   sbtnTransferir.Enabled := Not (CmeCadastro.Operacao = OpAlterar);
   sbtnImprimir.Enabled := (((Not Cds.IsEmpty) And (Cds.Active)) And (Not ((CmeCadastro.Operacao = OpInserir) Or (CmeCadastro.Operacao = OpAlterar))));

   CdsAux.Data := CtrlEmpAcoes.ListLancVigEmp(0, DATE());

   If Not CdsAux.IsEmpty Then
      Begin
         If CdsAux.FieldByName('TIPOLANC').AsString = 'I' Then // Parâmetro está flegado como = Importado
            Begin
               sbtnInserir.Enabled := False;
               sbtnAlterar.Enabled := False;
            End;
      End;
End;

Procedure TfrmCadEmpAcoesMT.CmeDetalheAtualizaBotoes(Sender: TObject);
Begin
   Inherited;
   ValidaDetalhe(Sender);
End;

Procedure TfrmCadEmpAcoesMT.CmeDetalheInsert(Sender: TObject);
Begin
   Inherited;
   If Cds.FieldByName('IDTIPOOPERACAO').AsInteger < -10000 Then
      cdsTipoOperacao.Data := CtrlInvest.ListTipoOperacao(2, -10053)
   Else
      cdsTipoOperacao.Data := CtrlInvest.ListTipoOperacao(2, -53);
End;

Procedure TfrmCadEmpAcoesMT.dbreVlrJurosResgExit(Sender: TObject);
Var fAliquota: Double;
Begin
   Inherited;
   If CmeDetalhe.Operacao = opInserir Then
      Begin
         If cdsTipoOperacao.FieldByName('FLGTRATAIR').AsString = 'S' Then
            Begin
               // Atenção:  Este método não é 3 camadas
               fAliquota := Impostos.BuscaAliquotaIR(2, cdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger, -1, dtDataResg.DateTime);
               dbrVlrIRResg.Value := OperComum.Round((dbreVlrJurosResg.Value * OperComum.DivValorZero(fAliquota, 100)), 2);
            End
         Else
            dbrVlrIRResg.Value := 0;

         // Se for resgate total
         If dbrQtdResg.Value = CtrlEmpAcoes.BuscaSaldoEmp.HSSldQtdEmp Then
            dbrVlrJurosEst.Value := dbreVlrJurosResg.Value - CtrlEmpAcoes.BuscaSaldoEmp.HSSldJurEmp;

      End;
End;

Procedure TfrmCadEmpAcoesMT.sbtnAlterarClick(Sender: TObject);
Begin
   If CtrlEmpAcoes.EmpMarcado(Cds.FieldByName('IDOPEREMPACOESAP').AsInteger) Then
      Begin
         MsgDlg(CtrlEmpAcoes.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         CmeCadastro.AtualizaBotoes(Sender);
      End
   Else Inherited;
End;

Procedure TfrmCadEmpAcoesMT.sbtnExcluiDetClick(Sender: TObject);
Var CdsTemp: TCMClientDataSet;
   iMercadoOrig, iMercadoDest: Integer;
Begin
   Try
      Try
         CtrlEmpAcoes.IdOperEmpAcoes := cdsResgates.FieldByName('IDOPEREMPACOES').AsInteger;
         CdsTemp := TCMClientDataSet.Create(Self);
         CdsTemp.Data := cdsResgates.Data;
         CdsTemp.First;
         While Not CdsTemp.eof Do
            Begin
               If CdsTemp.FieldByName('DATAOPERACAO').AsDateTime > cdsResgates.FieldByName('DATAOPERACAO').AsDateTime Then
                  Raise Exception.Create('Não é possível excluir o resgate. Existem resgates posteriores.');
               CdsTemp.Next;
            End;

         If MsgDlg('Confirma a exclusão do Resgate?', 'Mensagem do Sistema', mtWarning, [mbYes, mbNo], 0) = mrYes Then
            Begin
               {            if not dtmBaseDados.dbBaseDados.InTransaction then
                              dtmBaseDados.dbBaseDados.StartTransaction;

                           CdsCarteiraInvest.Locate('IDCARTEIRAINVEST', pRPI.IDCARTORIGEMPACOES,[]);
                           iMercadoOrig := CdsCarteiraInvest.FieldByName('IDMERCADO').AsInteger;
                           CdsCarteiraInvest.Locate('IDCARTEIRAINVEST', pRPI.IDCARTEMPACOES,[]);
                           iMercadoDest := CdsCarteiraInvest.FieldByName('IDMERCADO').AsInteger;

                           if not OperComum.ProcessaTransfCarteira(pRPI.IDCARTORIGEMPACOES,
                                                                   pRPI.IDCARTEMPACOES,
                                                                   cdsInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                                                   cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                   StrToInt(dblCustodiante.LookupValue), StrToInt(dblCustodiante.LookupValue),
                                                                   -1,
                                                                   pRPI.IDMOTBLOQEMPAC,
                               //                                                -1{Saldo Liberado}//, //pRPI.IDMOTBLOQEMPAC,
               {                                                    iMercadoOrig, iMercadoDest,
                                                                   StrToInt(dblkPlanPrev.LookupValue), StrToInt(dbcFlgTipoConta.Value),
                                                                   cdsInvestimento.FieldByName('DESCINVESTIMENTO').AsString,
                                                                   dbreQuantidade.Value,
                                                                   dtOperacao.DateTime) then
                              Raise Exception.Create('Por favor verificar o problema, a operação não será confirmada!');
                                            }

               Inherited;

               If Not bAccept Then
                  Raise Exception.Create('Operação Cancelada!');

               //            if dtmBaseDados.dbBaseDados.InTransaction then
               //               dtmBaseDados.dbBaseDados.Commit;

            End;
      Except
         On E: Exception Do
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      End;
   Finally
      CtrlEmpAcoes.IdOperEmpAcoes := 0;
      CdsTemp.Close;
      FreeAndNil(CdsTemp);
      CmeDetalhe.AtualizaBotoes(sbtnExcluiDet);
   End;
End;

Procedure TfrmCadEmpAcoesMT.CmeDetalheDelete(Sender: TObject);
Begin
   Try
      Try
         cdsDet.DisableControls;
         cdsDet.Filtered := False;
         cdsDet.Filter := '(DATAHISTEMPACOES > ' + QuotedStr(FormatDateTime('DD/MM/YYYY', cdsResgates.FieldByName('DATAOPERACAO').AsDateTime)) + ') OR ' +
            '((DATAHISTEMPACOES = ' + QuotedStr(FormatDateTime('DD/MM/YYYY', cdsResgates.FieldByName('DATAOPERACAO').AsDateTime)) + ') AND ' +
            ' (IDTIPOOPERACAO = ' + cdsResgates.FieldByName('IDTIPOOPERACAO').AsString + '))';
         cdsDet.Filtered := True;
         While Not cdsDet.eof Do
            cdsDet.Delete;

         bAccept := True;
      Except
         bAccept := False;
      End;
   Finally
      cdsDet.Filtered := False;
      cdsDet.EnableControls;
   End;

   Inherited;

End;

Procedure TfrmCadEmpAcoesMT.dbgrdDetDblClick(Sender: TObject);
Begin
   If sbtnAltDet.Enabled Then
      Inherited;
End;

Procedure TfrmCadEmpAcoesMT.sbtnTransferirClick(Sender: TObject);
Var CtrlInv: TCtrlInvestimento;
Begin
   Try //Finally
      Try
         CtrlInv := TCtrlInvestimento.Create;
         CtrlInv.InitializeAs(Padroes);
         If CtrlInv.VerEmAbertura(2) Then
            Raise Exception.Create(CtrlInv.MessageInfo);

         AbrirForm(FrmCadTransfCarteira, TFrmCadTransfCarteira, False);
         If Trim(dtOperacao.Text) <> '' Then
            FrmCadTransfCarteira.DataRef := dtOperacao.DateTime;

         Inherited;
      Except
         On E: Exception Do
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      End;
   Finally
      FreeAndNil(CtrlInv);
      sbtnTransferir.Down := False;
      CmeCadastro.AtualizaBotoes(Sender);
   End;
End;

Procedure TfrmCadEmpAcoesMT.sbtnImprimirClick(Sender: TObject);
Begin
   Inherited;
   Try
      RelBoleta.cds.Data := CtrlEmpAcoes.ListRelBoleta(Cds.FieldByName('IDOPEREMPACOES').AsInteger);

      TFrmPreview.CreateModalPreview(Application,
         RelBoleta.rptBoletaEmpAcoes,
         RelBoleta.rptBoletaEmpAcoes.PrinterSetup.DocumentName);

   Finally
      RelBoleta.cds.EmptyDataSet;
      sbtnImprimir.Down := False;
      CmeCadastro.AtualizaBotoes(Sender);
   End;
End;

Procedure TfrmCadEmpAcoesMT.bbtnOkDetClick(Sender: TObject);
Begin
   Inherited;
   bResgate := True;
End;

Procedure TfrmCadEmpAcoesMT.FormActivate(Sender: TObject);
Begin
   Inherited;
   CdsAux.Data := CtrlEmpAcoes.ListLancVigEmp(0, DATE());

   If Not CdsAux.IsEmpty Then
      Begin
         If CdsAux.FieldByName('TIPOLANC').AsString = 'I' Then // Parâmetro está flegado como = Importado
            Begin
               sbtnInserir.Enabled := False;
               sbtnAlterar.Enabled := False;
            End;
      End;

End;

Procedure TfrmCadEmpAcoesMT.sbtnProcurarClick(Sender: TObject);
Begin
   Inherited;
   CdsAux.Data := CtrlEmpAcoes.ListLancVigEmp(0, DATE());

   If Not CdsAux.IsEmpty Then
      Begin
         If CdsAux.FieldByName('TIPOLANC').AsString = 'I' Then // Parâmetro está flegado como = Importado
            Begin
               sbtnInserir.Enabled := False;
               sbtnAlterar.Enabled := False;
            End;
      End;
End;

End.

