{ --------------------------------------------------------------------------------------------------
 N. Chamado....: WO34233
 Dt Alteração..: 18/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .(.DFM) - Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
----------------------------------------------------------------------------------------------------
}
//Rotina                : LocalizaCotacao
//N. Sol..........      : 262362
//N. PPM..........      : 1084801
//Data da Alteração:    : 18/09/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Taxa percentual da taxa selic, corrigida atribuir 1% fixo,
//                        quando a diferença entres os meses for acima de 1 mês.
//***************************************************************************************
//N. Sol..........: 126088_1342
//N. Kintana......: 784469
//Data............: 24/04/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Detalhamento dos DCOMP´s
//******************************************************************************************
// Modelo implementado com a condição de ON DELETE CASCADE na FK, ou seja, ao matar o registro PAI,
// todos os filhos (dependentes) serão apagados pelo banco
Unit FCadDCTF_DCOMP;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Wwdbigrd,
  Grids, Wwdbgrid, TB97Ctls, ImgList, TREdit, Db, Wwdatsrc, DBTables,
  Wwquery, MontaSelect, Mask, wwdbedit, uCmControlObject, uCmSqlParams,
  DBClient, uCMClientDataSet, DBCtrls, uSistema, uCtrlGeraDCTF_Novo,
  CMProcura, wwdbdatetimepicker, CMDateTimePicker, QExport3Dialog,
  wwdblook;

Type
  TfrmCadDCTF_DCOMP = Class(TForm)
    Panel1: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    ImageList1: TImageList;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Image2: TImage;
    pnlDARF: TPanel;
    edValorAtualizado: TDBRealEdit;
    wwDBEdit1: TwwDBEdit;
    dtDtIniApuracao: TCMDateTimePicker;
    dbeDtVencto: TCMDateTimePicker;
    dtDtFimApuracao: TCMDateTimePicker;
    qryAux: TwwQuery;
    qryCRDCOMP: TwwQuery;
    dsCRDCOMP: TwwDataSource;
    Panel2: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    qryLkpFormPedido: TwwQuery;
    dsLkpFormPedido: TwwDataSource;
    qryLkpFormPedidoDSCFORMAPEDIDO: TStringField;
    qryLkpFormPedidoIDFORMAPEDIDO: TStringField;
    qryLkpMoeda: TwwQuery;
    dsLkpMoeda: TwwDataSource;
    wwDBEdit3: TwwDBEdit;
    Label2: TLabel;
    dblkpFormaPedido: TwwDBLookupCombo;
    Label10: TLabel;
    edValorOrig: TDBRealEdit;
    Label11: TLabel;
    dbeNumDCOMP: TwwDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    dblkpMoeda: TwwDBLookupCombo;
    Label3: TLabel;
    Label5: TLabel;
    edValorCotacao: TDBRealEdit;
    Label8: TLabel;
    edValorUtilizado: TDBRealEdit;
    qryLkpMoedaMOECODIGO: TFloatField;
    qryLkpMoedaMOEDESC: TStringField;
    qryCRDCOMPIDDCTF: TFloatField;
    qryCRDCOMPIDDCTFCRDETALHE_DCOMP: TFloatField;
    qryCRDCOMPTIPODOCTO: TStringField;
    qryCRDCOMPCODNATUREZA: TStringField;
    qryCRDCOMPNUMDOCUMENTO: TStringField;
    qryCRDCOMPREFERENCIA: TStringField;
    qryCRDCOMPPROCESSO: TStringField;
    qryCRDCOMPDATAINICIOAPURACAO: TDateTimeField;
    qryCRDCOMPDATAFIMAPURACAO: TDateTimeField;
    qryCRDCOMPDATAVENCTO: TDateTimeField;
    qryCRDCOMPVALORCR_ORIGINAL: TFloatField;
    qryCRDCOMPMOECODIGO: TFloatField;
    qryCRDCOMPVALORCR_ATUALIZADO: TFloatField;
    qryCRDCOMPVALORCR_ORIGINAL_UTILIZADO: TFloatField;
    qryCRDCOMPFLGREGEXCLUIDO: TStringField;
    qryCRDCOMPIDFORMAPEDIDO: TStringField;
    qryCRDCOMPNUMPERDCOMP: TStringField;
    qryCRDCOMPNUMPERDCOMPREF: TStringField;
    qryCRDCOMPFLGMARCADO: TStringField;
    Label9: TLabel;
    dbeNumDCOMPRef: TwwDBEdit;
    qryCRDCOMPVALORCR_SALDO_ORIGINAL: TFloatField;
    Label19: TLabel;
    Label18: TLabel;
    qryAux2: TwwQuery;
    dbeDtCredito: TCMDateTimePicker;
    qryCRDCOMPDATACREDITO: TDateTimeField;
    qryCRDCOMPCOTVALOR: TFloatField;
    Procedure bbtnSairClick(Sender: TObject);
    Procedure sbtnInserirClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure sbtnApagarClick(Sender: TObject);
    Procedure sbtnAlterarClick(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Procedure dblkpMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure dblkpMoedaExit(Sender: TObject);
    Procedure edValorOrigExit(Sender: TObject);
    Procedure dbeNumDCOMPExit(Sender: TObject);
    Procedure edValorUtilizadoExit(Sender: TObject);
  Private
    { Private declarations }
    Function LocalizaCotacao: Double;
    Function CalculaValorAtualizado: Double;
  Public
    bModificou: Boolean;
    { Public declarations }
    Procedure CarregaMovDCOMP(Const pIdDCTF, pIdDCOMPDet: Integer; pCodNatureza, pCNPJ: String; pDtIniApu, pDtFimApu: TDateTime; pPermiteMan: Boolean);
  End;

Var
  frmCadDCTF_DCOMP: TfrmCadDCTF_DCOMP;
  sCNPJ, sCodNatureza: String;
  iIdDCTF: Integer;
  dDtIniApu, dDtFimApu, dDtVenApu: TDateTime;

Implementation

Uses DBaseDados, uCtrlFuncoesRH, UMensErro, FGeraDCTF_Novo;

{$R *.DFM}

Procedure TfrmCadDCTF_DCOMP.CarregaMovDCOMP(Const pIdDCTF, pIdDCOMPDet: Integer; pCodNatureza, pCNPJ: String; pDtIniApu, pDtFimApu: TDateTime; pPermiteMan: Boolean);
Begin
  Cursor := crSQLWait;
  bModificou := False;

  qryCRDCOMP.Close;
  qryCRDCOMP.ParamByName('p1').asInteger := pIdDCTF;
  qryCRDCOMP.ParamByName('p2').asInteger := pIdDCOMPDet;
  qryCRDCOMP.Open;
  If Not qryCRDCOMP.EOF Then
    Begin
      iIdDCTF := qryCRDCOMP.FieldByName('IDDCTF').AsInteger;
      sCNPJ := qryCRDCOMP.FieldByName('NUMDOCUMENTO').AsString;
      sCodNatureza := qryCRDCOMP.FieldByName('CODNATUREZA').AsString;
      dDtIniApu := qryCRDCOMP.FieldByName('DATAINICIOAPURACAO').AsDateTime;
      dDtFimApu := qryCRDCOMP.FieldByName('DATAFIMAPURACAO').AsDateTime;
      dDtVenApu := qryCRDCOMP.FieldByName('DATAVENCTO').AsDateTime;
    End
  Else
    Begin
      iIdDCTF := pIdDCTF;
      sCNPJ := pCNPJ;
      sCodNatureza := pCodNatureza;
      dDtIniApu := pDtIniApu;
      dDtFimApu := pDtFimApu;
      dDtVenApu := pDtFimApu;
    End;

  qryLkpFormPedido.Close;
  qryLkpFormPedido.Open;
  qryLkpMoeda.Close;
  qryLkpMoeda.Open;

  pnlDARF.enabled := (Not qryCRDCOMP.isEmpty);
  sbtnAlterar.enabled := (Not qryCRDCOMP.isEmpty);
  sbtnApagar.enabled := (Not qryCRDCOMP.isEmpty);
  bbtnConfirmar.enabled := (Not qryCRDCOMP.isEmpty);
  bbtnCancelar.enabled := (Not qryCRDCOMP.isEmpty);
  Cursor := crDefault;
End;

Procedure TfrmCadDCTF_DCOMP.bbtnSairClick(Sender: TObject);
Begin
  Close;
End;

Procedure TfrmCadDCTF_DCOMP.sbtnInserirClick(Sender: TObject);
Begin
  sbtnInserir.Down := True;
  If qryCRDCOMP.State <> dsInsert Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        sbtnAlterar.enabled := False;
        sbtnApagar.enabled := False;

        bbtnConfirmar.enabled := True;
        bbtnCancelar.enabled := True;

        pnlDARF.enabled := True;

        qryCRDCOMP.Insert;
        qryCRDCOMP.FieldByName('TIPODOCTO').AsString := 'DCOMP';
        qryCRDCOMP.FieldByName('NUMDOCUMENTO').AsString := sCNPJ;
        qryCRDCOMP.FieldByName('CODNATUREZA').AsString := sCodNatureza;
        qryCRDCOMP.FieldByName('DATAINICIOAPURACAO').AsDateTime := dDtIniApu;
        qryCRDCOMP.FieldByName('DATAFIMAPURACAO').AsDateTime := dDtFimApu;
        qryCRDCOMP.FieldByName('DATAVENCTO').AsDateTime := dDtVenApu;
        qryCRDCOMP.FieldByName('MOECODIGO').AsInteger := 104; // SELIC/Mensal
        qryCRDCOMP.FieldByName('FLGMARCADO').AsString := 'S'; // Sim
        qryCRDCOMP.FieldByName('IDFORMAPEDIDO').AsInteger := 3; // DCOMP

        dbeNumDCOMP.setfocus;
      Except
        bbtnCancelarClick(Self);
        Raise;
      End;
    End
  Else
    sbtnAlterar.Down := False;
End;

Procedure TfrmCadDCTF_DCOMP.bbtnCancelarClick(Sender: TObject);
Begin
  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryCRDCOMP.state In [dsEdit, dsInsert] Then
          qryCRDCOMP.Cancel;

        dtmBaseDados.dbBaseDados.RollBack;
        bModificou := False;
      End;

    sbtnInserir.Down := False;
    sbtnInserir.enabled := True;
    sbtnAlterar.Down := False;
    sbtnApagar.Down := False;

    pnlDARF.enabled := (Not qryCRDCOMP.isEmpty);
    sbtnAlterar.enabled := (Not qryCRDCOMP.isEmpty);
    sbtnApagar.enabled := (Not qryCRDCOMP.isEmpty);
    bbtnConfirmar.enabled := (Not qryCRDCOMP.isEmpty);
    bbtnCancelar.enabled := (Not qryCRDCOMP.isEmpty);
  Except
    Raise;
  End;
End;

Procedure TfrmCadDCTF_DCOMP.bbtnConfirmarClick(Sender: TObject);
Begin
  If trim(dbeNumDCOMP.text) = '' Then
    Begin
      Application.MessageBox('Número DCOMP não Informado !', 'Atenção !', Mb_IconExclamation);
      dbeNumDCOMP.setfocus;
      Exit;
    End;

  If dtDtIniApuracao.Text = '' Then
    Begin
      Application.MessageBox('Data Início da Apuração não Informada !', 'Atenção !', Mb_IconExclamation);
      dtDtIniApuracao.setfocus;
      Exit;
    End;

  If dtDtFimApuracao.Text = '' Then
    Begin
      Application.MessageBox('Data Final da Apuração não Informada !', 'Atenção !', Mb_IconExclamation);
      dtDtFimApuracao.setfocus;
      Exit;
    End;

  If dbeDtVencto.Text = '' Then
    Begin
      Application.MessageBox('Data de Vencimento não Informada !', 'Atenção !', Mb_IconExclamation);
      dbeDtVencto.setfocus;
      Exit;
    End;

  If dblkpFormaPedido.text = '' Then
    Begin
      Application.MessageBox('Formalização do Pedido não Informado !', 'Atenção !', Mb_IconExclamation);
      dblkpFormaPedido.setfocus;
      Exit;
    End;

  If dbeDtCredito.text = '' Then
    Begin
      Application.MessageBox('Data do Crédito não Informada !', 'Atenção !', Mb_IconExclamation);
      dbeDtCredito.setfocus;
      Exit;
    End;

  If edValorOrig.value = 0 Then
    Begin
      Application.MessageBox('Valor Original não Informado !', 'Atenção !', Mb_IconExclamation);
      edValorOrig.setfocus;
      Exit;
    End;

  If dblkpMoeda.Text = '' Then
    Begin
      Application.MessageBox('Índice não Informado !', 'Atenção !', Mb_IconExclamation);
      dblkpMoeda.setfocus;
      Exit;
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryCRDCOMP.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            Try
              If qryCRDCOMP.State = dsInsert Then
                Begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SEQDCTF_CREDITODETALHE_DCOMP.NEXTVAL SEQ FROM DUAL    ');
                  qryAux.Open;

                  qryCRDCOMP.fieldByname('IDDCTF').asInteger := iIdDCTF;
                  qryCRDCOMP.fieldByname('IDDCTFCRDETALHE_DCOMP').asInteger := qryAux.fieldByname('SEQ').asInteger;
                End;

              qryCRDCOMP.FieldByName('VALORCR_SALDO_ORIGINAL').AsFloat := qryCRDCOMP.FieldByName('VALORCR_ATUALIZADO').AsFloat - qryCRDCOMP.FieldByName('VALORCR_ORIGINAL_UTILIZADO').AsFloat;

              qryCRDCOMP.Post;

              If dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.Commit;

              bModificou := True;
              Screen.Cursor := crDefault;

              bbtnCancelarClick(Self);
            Except
              On E: Exception Do
                Begin
                  Raise
                End;
            End;
          End;
      End
  Except
    bbtnCancelarClick(Self);
    Raise;
  End;
End;

Procedure TfrmCadDCTF_DCOMP.sbtnApagarClick(Sender: TObject);
Begin
  If Not qryCRDCOMP.isEmpty Then
    Begin
      If MsgDlg('Confirma Exclusão desta DCOMP ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryCRDCOMP.Delete;

            dtmBaseDados.dbBaseDados.Commit;
            Screen.Cursor := crDefault;

            bModificou := True;
            bbtnCancelarClick(Self);
          Except
            bbtnCancelarClick(Self);
            Raise;
          End;
        End;
      sbtnApagar.Down := False;
    End;
End;

Procedure TfrmCadDCTF_DCOMP.sbtnAlterarClick(Sender: TObject);
Begin
  sbtnAlterar.Down := True;
  If qryCRDCOMP.State <> dsEdit Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        sbtnInserir.enabled := False;
        sbtnApagar.enabled := False;

        bbtnConfirmar.enabled := True;
        bbtnCancelar.enabled := True;

        pnlDARF.enabled := True;
        qryCRDCOMP.Edit;
        dbeNumDCOMP.setfocus;
      Except
        bbtnCancelarClick(Self);
        Raise;
      End;
    End
  Else
    sbtnAlterar.Down := False;
End;

Procedure TfrmCadDCTF_DCOMP.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
  If (qryCRDCOMP.State In [dsEdit, dsInsert]) Then
    Begin
      If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          qryCRDCOMP.Cancel;

          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;

          qryCRDCOMP.Close;
          qryLkpFormPedido.Close;
          qryLkpMoeda.Close;
          CanClose := True;
        End
      Else
        CanClose := False;
    End
  Else
    Begin
      qryCRDCOMP.Close;
      qryLkpFormPedido.Close;
      qryLkpMoeda.Close;
      CanClose := True;
    End;
End;

Procedure TfrmCadDCTF_DCOMP.dblkpMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  qryCRDCOMP.FieldByName('VALORCR_ATUALIZADO').AsFloat := CalculaValorAtualizado;
  qryCRDCOMP.FieldByName('VALORCR_ORIGINAL_UTILIZADO').AsFloat := qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat + (qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat * (qryCRDCOMP.FieldByName('COTVALOR').AsFloat / 100));
End;

Procedure TfrmCadDCTF_DCOMP.dblkpMoedaExit(Sender: TObject);
Begin
  qryCRDCOMP.FieldByName('VALORCR_ATUALIZADO').AsFloat := CalculaValorAtualizado;
  qryCRDCOMP.FieldByName('VALORCR_ORIGINAL_UTILIZADO').AsFloat := qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat + (qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat * (qryCRDCOMP.FieldByName('COTVALOR').AsFloat / 100));
End;

Procedure TfrmCadDCTF_DCOMP.edValorOrigExit(Sender: TObject);
Begin
  qryCRDCOMP.FieldByName('VALORCR_ATUALIZADO').AsFloat := CalculaValorAtualizado;
  qryCRDCOMP.FieldByName('VALORCR_ORIGINAL_UTILIZADO').AsFloat := qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat + (qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat * (qryCRDCOMP.FieldByName('COTVALOR').AsFloat / 100));
End;

Procedure TfrmCadDCTF_DCOMP.dbeNumDCOMPExit(Sender: TObject);
Begin
  Screen.Cursor := crSQLWait;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT NUMPERDCOMP FROM DCTF_CREDITODETALHE_DCOMP ');
  qryAux.SQL.add('WHERE NUMPERDCOMP = ' + quotedstr(trim(dbeNumDCOMP.text)));
  qryAux.Open;
  If Not qryAux.EOF Then
    Begin
      Application.MessageBox('Já lançada uma DCOMP com este Número. Verifique !', 'Atenção !', Mb_IconExclamation);
      dbeNumDCOMP.setfocus;
    End;
  Screen.Cursor := crDefault;
End;

Procedure TfrmCadDCTF_DCOMP.edValorUtilizadoExit(Sender: TObject);
Begin
  qryCRDCOMP.FieldByName('VALORCR_SALDO_ORIGINAL').AsFloat := qryCRDCOMP.FieldByName('VALORCR_ATUALIZADO').AsFloat - qryCRDCOMP.FieldByName('VALORCR_ORIGINAL_UTILIZADO').AsFloat;
End;

Function TfrmCadDCTF_DCOMP.LocalizaCotacao: Double;
Var sMesAnoRef, sMesAnoCR: String;
  VlrCotRef, VlrCotCr: Double;
  iAnoCR, iMesCR, iDiaCR, iAnoRef, iMesRef, iDiaRef: Word;
Begin
  // Regra para formação do valor da correção - Léo Wagner - CONTAB
  // ----------------------------------------------------------------------------------------------
  // O crédito deve ser corrigido pela taxa Selic acumulada entre o mês seguinte ao seu surgimento
  // e o mês anterior ao da data de transmissão da declaração de compensação, acrescida de 1%.
  // ----------------------------------------------------------------------------------------------
  VlrCotRef := 0.00;
  VlrCotCr := 0.00;
  // Mes seguinte ao surgimento do Crédito - Usar Data do Crédito + 1
  DecodeDate(dbeDtCredito.date, iAnoCR, iMesCR, iDiaCR);
  sMesAnoCR := copy(inttostr(100 + iMesCR + 1), 2, 2) + copy(inttostr(10000 + iAnoCR), 2, 4);
  Screen.Cursor := crSQLWait;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT COTMESREF, COTVALOR FROM COTACAOMOEDA    ');
  qryAux.SQL.add('WHERE MOECODIGO = ' + qryCRDCOMP.FieldByName('MOECODIGO').AsString);
  qryAux.SQL.add('      AND COTMESREF = ' + sMesAnoCR);
  qryAux.Open;
  If Not qryAux.EOF Then
    Begin
      VlrCotCr := qryAux.fieldbyname('COTVALOR').AsFloat;
      // Mes anterior ao da data de transmissão da DCOMP - Usar Data do Vencimento - 1
      DecodeDate(dbeDtVencto.date, iAnoRef, iMesRef, iDiaRef);
      sMesAnoRef := copy(inttostr(100 + iMesRef - 1), 2, 2) + copy(inttostr(10000 + iAnoRef), 2, 4);
      // SOL 262362 - Kintana 1084801 - Paulo Nobre
      // Se a diferença dos períodos for de 1 mes, então a taxa será acrescida em 1%
      If (strtoint(sMesAnoCR) - strtoint(sMesAnoRef)) > 10000 Then
        Begin
          qryAux2.Close;
          qryAux2.SQL.Clear;
          qryAux2.SQL.add('SELECT COTMESREF, COTVALOR FROM COTACAOMOEDA    ');
          qryAux2.SQL.add('WHERE MOECODIGO = ' + qryCRDCOMP.FieldByName('MOECODIGO').AsString);
          qryAux2.SQL.add('      AND COTMESREF = ' + sMesAnoRef);
          qryAux2.Open;
          If Not qryAux2.EOF Then
            Begin
              VlrCotRef := qryAux2.fieldbyname('COTVALOR').AsFloat;
              Result := VlrCotCr + VlrCotRef + 1; // 1%
            End;
        End
      Else
        Result := 1; // Se a diferença dos períodos acima for de 2 meses, então a taxa será fixada em 1%
    End
  Else
    Begin
      Application.MessageBox(pchar('Cotação não encontrada para o Mês de Crédito -> ' + sMesAnoCR + ' !'), 'Atenção !', Mb_IconExclamation);
      Result := 0.00;
    End;

  qryAux.Close;
  qryAux2.Close;
  Screen.Cursor := crDefault;
End;

Function TfrmCadDCTF_DCOMP.CalculaValorAtualizado: Double;
Begin
  qryCRDCOMP.FieldByName('COTVALOR').AsFloat := LocalizaCotacao;
  result := qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat + (qryCRDCOMP.FieldByName('VALORCR_ORIGINAL').AsFloat * (qryCRDCOMP.FieldByName('COTVALOR').AsFloat / 100));
End;

End.

// 061854956213020613049260

