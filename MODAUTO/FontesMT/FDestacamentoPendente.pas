{*******************************************************************************
//
N. SIG..........: 124096
Data............: 28/03/2022
Responsável.....: Luis Ferrari
Descrição.......: Troca de relatorio 2546 pelo 4579
********************************************************************************
N. SIG..........: 87510
Data............: 23/08/2019
Responsável.....: Everson Cunha
Descrição.......: Melhorias e correções na funcionalidade de integração FOLHA
********************************************************************************
N. SIG..........: 74816
Data............: 29/04/2019
Responsável.....: Everson Cunha
Descrição.......: Realizar melhorias na funcionalidade de integração FOLHA
********************************************************************************
N. Sol..........: 185481
N. Kintana......: 1907260
Data............: 01/04/2014
Responsável.....: Edilaine Ferraresi
Descrição.......: Agrupamento de AP - Modelo 2
Funções.........: .dfm e diversas (Agrupamento, qry e cds)
********************************************************************************
N. Sol..........: 185594
N. Kintana......: 1910887
Data............: 13/03/2013
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de Msg do sucesso das integrações e Inclusão de
                  Impressão da AP - Modelo 2
********************************************************************************
Paulo Nobre - SOL 206346 KINTANA: 1996506 - 30/04 - inicio
N. Sol..........: 206346
N. Kintana......: 1996506
Data............: 30/04/2013
Responsável.....: Paulo Nobre
Descrição.......: Peço verificar erro na integração de vários documento no
                  Módulo Auto Atentidmento.
********************************************************************************
N. Sol..........: 205125
N. Kintana......: 1984450
Data............: 17/04/2013
Responsável.....: Paulo Nobre
Descrição.......: PEÇO VERIFICAR "CONTA CONBTABIL NÃO ENCONTRADA" E MOVIMENTOS
                  PARA INTEGRAÇÃO NO MODULO AUTO ATENDIMENTO - DESTACAMENTO
********************************************************************************
N. Sol..........: 201446
N. Kintana......: 1947503
Data............: 25/02/2013
Responsável.....: Marcio Sanches Spinosa
Descrição.......: Ajuste na query com problemas com o apelido errado, o campo
                  pertence a outra tabela;
********************************************************************************
N. Sol..........: 137269_7601
N. Kintana......: 829602
Data............: 01/11/2011
Responsável.....: Paulo Nobre
Descrição.......: Destacamento pendentes de Integrações
*******************************************************************************}



Unit FDestacamentoPendente;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, Grids, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBClient, FileCtrl, fcLabel, DBTables,
   CMDBLookupCombo, CMDateTimePicker, CMProcuraSubTipo, CMProcura,
   CmEventosCadastro, uCMClientDataSet, uCmSqlParams, uCmControlObject,
   uCtrlPadroes, uCtrlDestacamento, Wwquery, Wwdotdot, Wwdbcomb,
   wwdbdatetimepicker, Wwdatsrc, Wwdbigrd, Wwdbgrid, Wwdbspin, wwdblook, wwdbedit,
   Provider, Menus, ImgList, IniFiles, ComCtrls, Spin, uCtrlGlobalRH,
   MontaSelect, Mask, CMProcuraMask, ShellAPI,
   rAutPag, rAutPagCofin; {// SOL 185594 KTN 1910887 - Paulo Nobre}

Type
   TfrmDestacamentoPendente = Class(TForm)
      Panel1: TPanel;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      bbtnConfirmar: TBitBtn;
      qryTipoOperacao: TQuery;
      dsTipoOperacao: TDataSource;
      qryTipoOperacaoTIPCODIGO: TStringField;
      qryTipoOperacaoTIPDESCRICAO: TStringField;
      bbtnInverte: TBitBtn;
      pcIntegracoes: TPageControl;
      tbsFin: TTabSheet;
      tbsFolha: TTabSheet;
      grdIntegraFinanc: TwwDBGrid;
      gridIButton: TwwIButton;
      Panel3: TPanel;
      grdIntegraFolha: TwwDBGrid;
      wwIButton1: TwwIButton;
      cmbMes: TComboBox;
      spnedAno: TSpinEdit;
      Label3: TLabel;
    sqlIntegraFinanc: TQuery;
      dsIntegraFinanc: TDataSource;
      qryAlteraFlagFinanc: TQuery;
    sqlIntegraFolha: TQuery;
      dsIntegraFolha: TDataSource;
      qryAlteraFlagFolha: TQuery;
      shpEmCorrecao: TShape;
      lblLegendaAprovado: TLabel;
      Shape1: TShape;
      Label1: TLabel;
      Panel2: TPanel;
      Label2: TLabel;
      dblkpTipoOper: TwwDBLookupCombo;
      CdsParamRH: TCMClientDataSet;
      qryAux: TQuery;
      Label4: TLabel;
      Shape2: TShape;
      Label5: TLabel;
      spbExecutarFiltro: TSpeedButton;
      gbDestacado: TGroupBox;
      CMProcuraDestacado: TCMProcura;
      gbDataPrevPagto: TGroupBox;
      qryLkpCentroCusto: TwwQuery;
      qryLkpCentroCustoNOME: TStringField;
      qryLkpCentroCustoCODCENTROCUSTO: TStringField;
      MontaSelectFunc: TMontaSelect;
      gbxSelecao: TGroupBox;
      rdgFiltro1: TRadioGroup;
      rdgFiltro2: TRadioGroup;
      Label6: TLabel;
      Label7: TLabel;
    dtDe: TCMDateTimePicker;
    dtAte: TCMDateTimePicker;
    dspFinanc: TDataSetProvider;
    dspFolha: TDataSetProvider;
    qryIntegraFolha: TCMClientDataSet;
    qryIntegraFinanc: TCMClientDataSet;
    cdsAgrupa: TCMClientDataSet;
    //Everson Cunha - SIG74816 - Início
    chkAdt: TCheckBox;
    chkAcerto: TCheckBox;
    grpTpContrato: TGroupBox;
    chkEfetivo: TCheckBox;
    chkLEF: TCheckBox;
    chkTerc: TCheckBox;
    chkEstag: TCheckBox;
    chkCessao: TCheckBox;
    chkPrpDir: TCheckBox;
    chkAutonomo: TCheckBox;
	//Everson Cunha - SIG74816 - Fim
    chkIntegradoFinanc: TCheckBox;
    lblIntegradoFinanc: TLabel;
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure grdIntegraFinancDblClick(Sender: TObject);
      Procedure grdIntegraFinancDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure bbtnInverteClick(Sender: TObject);
      Procedure grdIntegraFolhaDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure grdIntegraFolhaDblClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure grdIntegraFinancCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure grdIntegraFolhaCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure rdgFiltro2Click(Sender: TObject);
      Procedure spbExecutarFiltroClick(Sender: TObject);
      Procedure rdgFiltro1Click(Sender: TObject);
      Procedure pcIntegracoesChange(Sender: TObject);
      Procedure gridIButtonClick(Sender: TObject);
      Procedure wwIButton1Click(Sender: TObject);
      procedure CarregaMovimento;  //Everson Cunha - SIG74816
   Private
      { Private declarations }
      ctrlDestacamento: TCtrlDestacamento;
      ctrlGlobalRH: TCtrlGlobalRH;
   Public
      { Public declarations }
   End;

Var
   frmDestacamentoPendente: TfrmDestacamentoPendente;
   AnoMesRef: String;

Implementation

Uses DBaseDados, uSistema, uMensErro, uCtrlFuncoesRH, fCadDestacamento;

{$R *.DFM}


// edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
Function IIF(condicao : boolean; sRetT, sRetF : string) : string;
begin
  if condicao then result := sRetT
              else result := sRetF;
end;

Function InverteFlag(sValorAtual : string) : string;
begin
  Result := iif(sValorAtual = 'S', 'N', 'S');
end;
// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

Procedure TfrmDestacamentoPendente.FormCreate(Sender: TObject);
Begin
   ctrlDestacamento := TCtrlDestacamento.Create(Sistema);
   ctrlDestacamento.InitializeAs(Padroes);
   CtrlGlobalRH := TCtrlGlobalRH.Create;
   CtrlGlobalRH.InitializeAs(Padroes);

   pcIntegracoes.ActivePageIndex := 0;

   CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NORMALINI, NORMALFIM');
   If (CdsParamRH.FieldByName('NORMALINI').IsNull) Or
      (CdsParamRH.FieldByName('NORMALFIM').IsNull) Then
      Begin
         MsgDlg('Não há período de Folha Aberto. Verifique !', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         Exit;
      End;

   cmbMes.ItemIndex := FU.ExtraiMes(CtrlGlobalRH.GetNormalIni) - 1;
   spnedAno.Value := FU.ExtraiAno(CtrlGlobalRH.GetNormalIni);

   Screen.Cursor := crSQLWait;
   qryTipoOperacao.Close;
   qryTipoOperacao.Open;

   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio comentado
   {qryLkpCentroCusto.Close;
   qryLkpCentroCusto.Open;

   qryIntegraFinanc.Close;
   qryIntegraFinanc.Open;
   qryIntegraFolha.Close;
   qryIntegraFolha.Open;  }
   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

   Screen.Cursor := crDefault;

   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio comentado
   {rdgFiltro1.itemindex := 0;
   gbDestacado.Visible := False;
   //gbLotacao.Visible := False;
   gbDataPrevPagto.Visible := False;
   spbExecutarFiltro.Visible := False;
   CMProcuraDestacado.Text := '';
   //dblkCentroCusto.Clear;
   dtDe.Date := date;
   dtAte.Date := date;
   }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

   dblkpTipoOper.LookupValue := '03'; // Default BackOffice

   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
   //rdgFiltro1.itemindex := 1; //Everson Cunha - SIG74816
   //rdgFiltro2.itemindex := 0; //Everson Cunha - SIG74816
   //rdgFiltro1Click(self);     //Everson Cunha - SIG74816
   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
End;

Procedure TfrmDestacamentoPendente.bbtnSairClick(Sender: TObject);
Begin
   If Assigned(ctrlDestacamento) Then
      FreeAndNil(ctrlDestacamento);
   qryIntegraFinanc.Close;
   qryIntegraFolha.Close;
   qryTipoOperacao.Close;
   Close;
End;

Procedure TfrmDestacamentoPendente.bbtnConfirmarClick(Sender: TObject);
Var tipoEnvio, sObservacaoConcat, sMensagem : String;  {SOL 185594 KTN 1910887 - Paulo Nobre}
    iCodDocumento : integer;                           {SOL 185594 KTN 1910887 - Paulo Nobre}
    // edilaine.ferraresi - SOL 185481 / KTN 1907260
    sFiltro, lstDestaca : string;         
    sTipo, sContrato : string;            
    sDtPagto, sCodContrato : string;      
    rVlrDoc    : double;                  
    lImprimeAP : boolean;
    iNumAgrupa, iPosI, iPosF : integer;
    lstDocumentos : TStringList;
    // edilaine.ferraresi - SOL 185481 / KTN 1907260
    NomeArqLog : string; //Everson Cunha - SIG87510
    ArqLog : TextFile;   //Everson Cunha - SIG87510
Begin
  If pcIntegracoes.ActivePageIndex = 0 Then // Integração Financeira e Contábil
  Begin
    // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
    If dblkpTipoOper.text = '' Then
    Begin
      Application.MessageBox('Tipo de Operação não Informado !', 'Atenção !', Mb_IconExclamation);
      dblkpTipoOper.setfocus;
      Exit;
    End;

    try
      lstDocumentos := TStringList.Create;

      rVlrDoc    := 0;
      iNumAgrupa := 0;
      lstDestaca := '';
      lImprimeAP := false;
      //sFiltro := qryIntegraFinanc.Filter;  //Everson Cunha - SIG74816
      qryIntegraFinanc.DisableControls;
      qryIntegraFinanc.Filtered := false;
      //qryIntegraFinanc.Filter   := sFiltro + iif(sFiltro = EmptyStr, '', ' AND ')+'(FLGINTEGRARFINANC = ''S'') AND (NODOCUMENTO = NULL) ';  //Everson Cunha - SIG74816
      qryIntegraFinanc.Filter   := ' FLGINTEGRARFINANC = ''S'' '; //Everson Cunha - SIG74816
      qryIntegraFinanc.Filtered := true;
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

      If Not qryIntegraFinanc.isEmpty Then
      Begin
        Screen.Cursor := crSQLWait;
        sObservacaoConcat := '';

        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio comentario
        // Loop apenas para concatenar as observações de todos os trechos
        {qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.add('SELECT OBSERVACAO    ');
        qryAux.SQL.add('  FROM DSTTRECHO       ');
        qryAux.SQL.add(' WHERE IDDESTACAMENTO = ' + qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsString);
        qryAux.SQL.add('   AND FLGCALCULADIARIA = ''S'' ');
        qryAux.Open;
        While Not qryAux.EOF Do
        Begin
          sObservacaoConcat := sObservacaoConcat + qryAux.FieldByName('OBSERVACAO').AsString + ' / ';

          qryAux.Next;
        End;

        sObservacaoConcat := copy(sObservacaoConcat, 1, length(sObservacaoConcat) - 2); // Tirando a última barra
        qryAux.Close;
        }

        sCodContrato := qryIntegraFinanc.FieldByName('CODCONTRATO').AsString;
        sTipo        := qryIntegraFinanc.FieldByName('TIPOINTEGRA').AsString;
        sContrato    := qryIntegraFinanc.FieldByName('TIPOCONTRATO').AsString;
        sDtPagto     := qryIntegraFinanc.FieldByName('DATAPAGTO').AsString;
        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

        While Not qryIntegraFinanc.EOF Do
        Begin
          //If (qryIntegraFinanc.FieldByName('FLGINTEGRARFINANC').AsString = 'S') Then   // edilaine.ferraresi - SOL 185481 / KTN 1907260
          Begin

            // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
            rVlrDoc := rVlrDoc + qryIntegraFinanc.FieldByName('TOTAL').AsCurrency;
            lstDestaca := lstDestaca + iif(lstDestaca = emptyStr, '', ', ') + qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsString;
            inc(iNumAgrupa);

            qryIntegraFinanc.Next;

            // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
            if (qryIntegraFinanc.FieldByName('TIPOINTEGRA').AsString <> sTipo) or
                    (qryIntegraFinanc.FieldByName('TIPOCONTRATO').AsString <> sContrato) or
                    (qryIntegraFinanc.FieldByName('DATAPAGTO').AsString <> sDtPagto) or
                    (iNumAgrupa = 10) or (qryIntegraFinanc.eof) then
            begin  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

              //If qryIntegraFinanc.FieldByName('TIPOINTEGRA').AsString = 'Adiantamento' Then
              If sTipo = 'Adiantamento' Then
                tipoEnvio := 'A' // Adiantamento
              Else
                tipoEnvio := 'C'; // Acerto de Contas

              Try
                if iNumAgrupa = 1 then    // edilaine.ferraresi - SOL 185481 / KTN 1907260
                begin
                  // Paulo Nobre - SOL 206346 KINTANA: 1996506 - 30/04 - inicio
                  // Loop apenas para concatenar as observações de todos os trechos de um Destacamento
                  sObservacaoConcat := '';
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT OBSERVACAO    ');
                  qryAux.SQL.add('FROM DSTTRECHO       ');
                  qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + lstDestaca);  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                  //qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsString);
                  //edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                  qryAux.Open;

                  While Not qryAux.EOF Do
                  Begin
                    If Not qryAux.Fieldbyname('OBSERVACAO').IsNull Then
                      sObservacaoConcat := sObservacaoConcat + qryAux.FieldByName('OBSERVACAO').AsString + ' / ';

                    qryAux.Next;
                  End;

                  sObservacaoConcat := copy(sObservacaoConcat, 1, length(sObservacaoConcat) - 3); // Tirando a última barra
                  // Paulo Nobre - SOL 206346 KINTANA: 1996506 - 30/04 - FIM

                  // Gerando movimento de integração Financeira e Contábil
                  // SOL 185594 KTN 1910887 - Paulo Nobre
                  lImprimeAP := ctrlDestacamento.IntegrarDstItemDespesaFinancContabil(StrToInt(lstDestaca), // edilaine.ferraresi - SOL 185481 / KTN 1907260
                                                                                     {qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsInteger,}
                                                                                      tipoEnvio,
                                                                                      True, // Contabiliza sempre
                                                                                      qryTipoOperacaoTIPCODIGO.value,
                                                                                      sObservacaoConcat,
                                                                                      iCodDocumento);
                end
                else
                begin
                  // edilaine.ferraresi - SOL 185481 / KTN 1907260
                  lImprimeAP := ctrlDestacamento.IntegrarAgrupamentoFinancContabil(lstDestaca,
                                                                                   tipoEnvio,
                                                                                   true,
                                                                                   qryTipoOperacaoTIPCODIGO.value,
                                                                                   sDtPagto,
                                                                                   iCodDocumento,
                                                                                   rVlrDoc,
                                                                                   sContrato,
                                                                                   sCodContrato);
                end;

                if lImprimeAP then  // edilaine.ferraresi - SOL 185481 / KTN 1907260
                Begin
                  If Application.MessageBox(pchar('         *** Integração Financeira e Contábil Realizada com Sucesso ***' + #13 + #13 +
                                                  'Cód.Documento Financeiro: ' + floattostr(ctrlDestacamento.dNumDocumento) + #13 + #13 +
                                                  'Confirma a Impressão da "Autorização de Pagamento AP - Modelo 2" ?'),PChar(FU.IFF(tipoEnvio = 'A', 'Adiantamento', 'Acerto de Contas') + ' - Nº Docto.Financeiro : ' +
                                                   floattostr(ctrlDestacamento.dNumDocumento)), MB_YESNO + MB_DEFBUTTON1) = IDYES Then
                  Begin
                    If iCodDocumento <> 0 Then
                    Begin
                      // Imprime Autorização de Pagamento AP - Modelo 2 - (IdReport = 2546)
                    //  TRptAutPag.PrintReport(2546, 1, Sistema.IdEmpresa, Sistema.IdUsuario,     // SIG124096
                      TRptAutPagCofin.PrintReport(4579, 1, Sistema.IdEmpresa, Sistema.IdUsuario,    // Ferrari SIG 124096 {Novo relat.}
                                             Sistema.IdModulo, floattostr(iCodDocumento) + '|=| |=| |=| |=|', '',
                                             'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem);
                    End;
                  End;

                  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                  {joga no. dos destacamentos e seu respectivo documento em uma lista para atualizar
                   a qryIntegraFinanc no final do processo - coluna Doc. Financ}

                  if iCodDocumento <> 0 then
                  begin
                    Repeat
                      iPosF := Pos(',' , lstDestaca);

                      if iPosF = 0 then  iPosF := 999;
                        lstDocumentos.AddObject(copy(lstDestaca, 1, iPosF-1), TObject(Trunc(ctrlDestacamento.dNumDocumento)) );

                      if iPosF <> 999 then
                        lstDestaca := trim(copy(lstDestaca, iPosF+1, 999));
                    until (iPosF = 999);
                  end;

                End
                // SOL 185594 KTN 1910887 - Paulo Nobre - fim
                Else
                Raise exception.create(CtrlDestacamento.MessageInfo);
              Except
                On E: Exception Do
                  MsgDlg(E.Message, 'Aviso', mtError, [mbOk], 0);
              End;

              // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
              rVlrDoc    := 0;
              lstDestaca := '';
              iNumAgrupa := 0;

              sCodContrato := qryIntegraFinanc.FieldByName('CODCONTRATO').AsString;
              sTipo        := qryIntegraFinanc.FieldByName('TIPOINTEGRA').AsString;
              sContrato    := qryIntegraFinanc.FieldByName('TIPOCONTRATO').AsString;
              sDtPagto     := qryIntegraFinanc.FieldByName('DATAPAGTO').AsString;
              // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
            end;
          End;

           //qryIntegraFinanc.Next;  // edilaine.ferraresi - SOL 185481 / KTN 1907260
        End;

             //Everson Cunha - SIG74816 - Início - Comentando o código pois o documento não continuará na grid, não sendo necessário atualizar o campo Nº Documento
             {
             // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
             //atualizando a coluna referente ao no. do documento
             qryIntegraFinanc.first;
             while not qryIntegraFinanc.eof do
             begin
               iPosI := lstDocumentos.IndexOf(qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsString);
               if iPosI > -1 then
               begin
                 iCodDocumento := Integer(lstDocumentos.Objects[iPosI]);

                 qryIntegraFinanc.Edit;
                 qryIntegraFinanc.FieldByName('NODOCUMENTO').AsInteger := iCodDocumento;
                 qryIntegraFinanc.Post;
               end
               else
                 qryIntegraFinanc.next;
             end;
             }
             //Everson Cunha - SIG74816 - Fim

             {qryIntegraFinanc.Close;
             qryIntegraFinanc.Open;
             }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
        Screen.Cursor := crDefault;
      End
      Else
        Application.MessageBox('Sem Movimento para Integração !', 'Atenção !', Mb_IconExclamation);

    finally
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
      qryIntegraFinanc.Filtered := false;
      //qryIntegraFinanc.Filter   := sFiltro; //Everson Cunha - SIG74816
      //qryIntegraFinanc.Filtered := true;    //Everson Cunha - SIG74816
      qryIntegraFinanc.EnableControls;
      //rdgFiltro1Click(self);
      lstDocumentos.free;
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
    end;
   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
  End
  Else // Integração Folha de Pagamento
  Begin
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
    try
      //sFiltro := qryIntegraFolha.Filter;  //Everson Cunha - SIG74816

      qryIntegraFolha.DisableControls;
      qryIntegraFolha.Filtered := false;
      //qryIntegraFolha.Filter   := sFiltro + iif(sFiltro = EmptyStr, '', ' AND ')+'(FLGINTEGRARFINANC = ''S'')'; //Everson Cunha - SIG74816
      qryIntegraFolha.Filter   := ' FLGINTEGRARFOLHA = ''S''   ';    //Everson Cunha - SIG74816
      qryIntegraFolha.Filtered := true;
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

      If Not qryIntegraFolha.EOF Then
      begin
        if MsgDlg('Confirma a Integração com a FOLHA?', 'Confirmação', MtConfirmation, [MbYes, MbNo], 0) = MrYes then //Everson Cunha - SIG87510
        Begin

          //Everson Cunha - SIG87510 - Início
          NomeArqLog := 'C:\Planus\Temp\LogIntegraçãoDestacamento.txt';
          AssignFile(ArqLog, NomeArqLog);
          Rewrite(ArqLog, NomeArqLog);

          Writeln(ArqLog, '----------------- Início: ' + FormatDateTime('dd/MM/yyyy hh:MM:ss', Now) + ' -----------------------------');
          //Everson Cunha - SIG87510 - Fim

          AnoMesRef := spnedAno.Text + '/' + copy(inttostr(100 + cmbMes.ItemIndex + 1), 2, 2);

          Screen.Cursor := crSQLWait;
          qryIntegraFolha.First;

          While Not qryIntegraFolha.EOF Do
          Begin
            //If (qryIntegraFolha.FieldByName('FLGINTEGRARFOLHA').AsString = 'S') Then    // edilaine.ferraresi - SOL 185481 / KTN 1907260
            Begin
              If qryIntegraFolha.FieldByName('TIPOINTEGRA').AsString = 'Adiantamento' Then
                tipoEnvio := 'A' // Adiantamento
              Else
                tipoEnvio := 'C'; // Acerto de Contas
              Try
                // Verificando se a Folha foi efetivada para o Ano e Mes de cobrança e Destacado
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add(' SELECT MESCOBRANCA  ');
                qryAux.SQL.Add(' FROM HISTRUBSAL          ');
                //qryAux.SQL.Add(' WHERE MESCOBRANCA =  ' + QuotedStr(AnoMesRef)); //Everson Cunha - SIG87510
                qryAux.SQL.Add(' WHERE MES =  ' + QuotedStr(AnoMesRef));           //Everson Cunha - SIG87510
                qryAux.SQL.Add('       AND IDPESSOA = ' + qryIntegraFolha.FieldByName('IDPESSOA').AsString);
                qryAux.SQL.Add('       AND IDMOTIVO = 1 '); // Folha Mensal Empregados
                qryAux.Open;

                If qryAux.IsEmpty Then
                Begin
                  // Gerando movimento de integração com a Folha de Pagamento
                  If Not ctrlDestacamento.IntegrarDstItemDespesaFolhaPagamento(qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsInteger,
                                                                               tipoEnvio,
                                                                               AnoMesRef) Then
                    Raise exception.create(CtrlDestacamento.MessageInfo)
                  else
                  begin
                    //Everson Cunha - SIG87510 - Início
                    //MsgDlg('Nº Interno: ' + qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsString + ', integrado com Sucesso', 'Informação', mtInformation, [mbOk], 0); //Everson Cunha - SIG74816
                    Writeln(ArqLog, 'Nº Interno: ' + qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsString + ', integrado com Sucesso');
                    Writeln(ArqLog, '---------------------------------------------------------------------------');
                    //Everson Cunha - SIG87510 - Fim
                  end;
                End
                Else
                Begin
                  //Everson Cunha - SIG87510 - Início
                  //Everson Cunha - SIG74816 - Início
                  //MsgDlg('Folha de Pagamento já efetivada para o Destacado, no Mês/Ano de Referência informado: ' + cmbMes.Text + '/' + spnedAno.Text  + #13 + #13 +
                  //       'Nº Interno: ' + qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsString + #13 +
                  //       'Destacado: ' + qryIntegraFolha.FieldByName('NOMEDESTACADO').AsString, 'Aviso', mtError, [mbOk], 0);
                  //Everson Cunha - SIG74816 - Fim
                  Writeln(ArqLog, 'Folha de Pagamento já efetivada para o Destacado, no Mês/Ano de Referência informado: ' + cmbMes.Text + '/' + spnedAno.Text  + #13 + #13 +
                                  'Nº Interno: ' + qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsString + #13 +
                                  'Destacado: ' + qryIntegraFolha.FieldByName('NOMEDESTACADO').AsString);
                  Writeln(ArqLog, '---------------------------------------------------------------------------');
                  //Everson Cunha - SIG87510 - Fim

                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                    dtmBaseDados.dbBaseDados.StartTransaction;

                  // 1 = Já exite integração lançada para o destacado no mes de referencia informado
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('UPDATE DESTACAMENTO SET TIPOMOTIVONAOINTEGRACAO = 1 ');
                  qryAux.SQL.add('WHERE IDDESTACAMENTO = ' + qryIntegraFolha.FieldByName('IDDESTACAMENTO').asString);

                  If Not qryAux.Prepared Then
                    qryAux.Prepare;

                  qryAux.ExecSQL;

                  If dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.Commit;
                End;
              Except
                On E: Exception Do
                Begin
                  //Everson Cunha - SIG87510 - Início
                  //MsgDlg(E.Message, 'Aviso', mtError, [mbOk], 0);
                  Writeln(ArqLog, E.Message);
                  Writeln(ArqLog, '---------------------------------------------------------------------------');
                  //Everson Cunha - SIG74816 - Fim

                  If dtmBaseDados.dbBaseDados.InTransaction Then
                    dtmBaseDados.dbBaseDados.Rollback;
                End;
              End;
            End;

            qryIntegraFolha.Next;

          End;
          // edilaine.ferraresi - SOL 185481 / KTN 1907260 - comentado
          {qryIntegraFolha.Close;
          qryIntegraFolha.Open;
          } // edilaine.ferraresi - SOL 185481 / KTN 1907260

          //Everson Cunha - SIG87510 - Início
          Writeln(ArqLog, '----------------- Fim: ' + FormatDateTime('dd/MM/yyyy hh:MM:ss', Now) + ' --------------------------------');
          CloseFile(ArqLog);

          MsgDlg('Integração finalizada. Resultado no LOG', 'Informação', mtInformation, [mbOk], 0);

          ShellExecute(Application.Handle, nil, PChar(NomeArqLog), nil, nil, SW_SHOWNORMAL);
          //Everson Cunha - SIG87510 - Fim

          Screen.Cursor := crDefault;
        End;
      end
      Else
        Application.MessageBox('Sem Movimento para Integração !', 'Atenção !', Mb_IconExclamation);

    finally
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
      //rdgFiltro1Click(self); //Everson Cunha - SIG74816
      qryIntegraFolha.Filtered := false;  //Everson Cunha - SIG74816
      //qryIntegraFolha.Filter   := sFiltro;
      //qryIntegraFolha.Filtered := true;
      qryIntegraFolha.EnableControls; //Everson Cunha - SIG74816
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
    end;
  End;

  CarregaMovimento;  //Everson Cunha - SIG74816

End;

Procedure TfrmDestacamentoPendente.grdIntegraFinancDblClick(Sender: TObject); //Paulo Nobre SOL 205125 KTN 1984450
Var RegAtual: TBookMark;
Begin
   Screen.Cursor := crSQLWait;

   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
   qryIntegraFinanc.edit;
   qryIntegraFinanc.FieldByName('FLGINTEGRARFINANC').AsString := InverteFlag(qryIntegraFinanc.FieldByName('FLGINTEGRARFINANC').AsString);
   qryIntegraFinanc.post;

   {RegAtual := qryIntegraFinanc.GetBookmark; // Salvando o ponteiro do Registro

   qryAlteraFlagFinanc.Close;
   If qryIntegraFinanc.FieldByName('FLGINTEGRARFINANC').AsString = 'S' Then
      qryAlteraFlagFinanc.parambyname('FLGINTEGRARFINANC').AsString := 'N'
   Else
      qryAlteraFlagFinanc.parambyname('FLGINTEGRARFINANC').AsString := 'S';

   qryAlteraFlagFinanc.parambyname('IDDESTACAMENTO').AsInteger := qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsInteger;
   qryAlteraFlagFinanc.ExecSQL;

   qryIntegraFinanc.Close;
   qryIntegraFinanc.Open;

   qryIntegraFinanc.GotoBookmark(RegAtual); // Voltando ao Reg. atual
   }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

   Screen.Cursor := crDefault; //Paulo Nobre SOL 205125 KTN 1984450
End;

Procedure TfrmDestacamentoPendente.grdIntegraFinancDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not qryIntegraFinanc.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               //If qryIntegraFinancTIPOINTEGRA.value = 'Adiantamento' Then               //Everson Cunha - SIG74816
               If qryIntegraFinanc.FieldByName('TIPOINTEGRA').Value = 'Adiantamento' Then //Everson Cunha - SIG74816
                  grdIntegraFinanc.Canvas.Font.Color := clBlue; // a linha toda fica na cor setada

               //If qryIntegraFinancTIPOINTEGRA.value = 'Acerto de Contas' Then //Everson Cunha - SIG74816
               If qryIntegraFinanc.FieldByName('TIPOINTEGRA').Value = 'Acerto de Contas' Then   //Everson Cunha - SIG74816
                  grdIntegraFinanc.Canvas.Font.Color := clGreen; // a linha toda fica na cor setada

               grdIntegraFinanc.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmDestacamentoPendente.bbtnInverteClick(Sender: TObject);
Begin
   Screen.Cursor := crSQLWait;
   If pcIntegracoes.ActivePageIndex = 0 Then
      Begin
         qryIntegraFinanc.DisableControls;
         qryIntegraFinanc.First;
         While Not qryIntegraFinanc.EOF Do
            Begin
               // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
               qryIntegraFinanc.Edit;
               qryIntegraFinanc.FieldByName('FLGINTEGRARFINANC').AsString := InverteFlag(qryIntegraFinanc.FieldByName('FLGINTEGRARFINANC').AsString);
               qryIntegraFinanc.Post;

               {qryAlteraFlagFinanc.Close;
               If qryIntegraFinanc.FieldByName('FLGINTEGRARFINANC').AsString = 'S' Then
                  qryAlteraFlagFinanc.parambyname('FLGINTEGRARFINANC').AsString := 'N'
               Else
                  qryAlteraFlagFinanc.parambyname('FLGINTEGRARFINANC').AsString := 'S';
               qryAlteraFlagFinanc.parambyname('IDDESTACAMENTO').AsInteger := qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsInteger;
               qryAlteraFlagFinanc.ExecSQL;
               }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

               qryIntegraFinanc.Next;
            End;

         qryIntegraFinanc.First;    // edilaine.ferraresi - SOL 185481 / KTN 1907260
         qryIntegraFinanc.EnableControls;
         // edilaine.ferraresi - SOL 185481 / KTN 1907260 - comentado
         {qryIntegraFinanc.Close;
         QryIntegraFinanc.Open;
         }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
      End
   Else
      Begin
         qryIntegraFolha.DisableControls;
         qryIntegraFolha.First;
         While Not qryIntegraFolha.EOF Do
            Begin
               // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
               qryIntegraFolha.Edit;
               qryIntegraFolha.FieldByName('FLGINTEGRARFOLHA').AsString := InverteFlag(qryIntegraFolha.FieldByName('FLGINTEGRARFOLHA').AsString);
               qryIntegraFolha.Post;

               {qryAlteraFlagFolha.Close;
               If qryIntegraFolha.FieldByName('FLGINTEGRARFOLHA').AsString = 'S' Then
                  qryAlteraFlagFolha.parambyname('FLGINTEGRARFOLHA').AsString := 'N'
               Else
                  qryAlteraFlagFolha.parambyname('FLGINTEGRARFOLHA').AsString := 'S';
               qryAlteraFlagFolha.parambyname('IDDESTACAMENTO').AsInteger := qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsInteger;
               qryAlteraFlagFolha.ExecSQL;
               }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

               qryIntegraFolha.Next;
            End;

         qryIntegraFolha.First;    // edilaine.ferraresi - SOL 185481 / KTN 1907260
         qryIntegraFolha.EnableControls;
         // edilaine.ferraresi - SOL 185481 / KTN 1907260 - comentado
         {qryIntegraFolha.Close;
         qryIntegraFolha.Open;
         }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

      End;
   Screen.Cursor := crDefault;
End;

Procedure TfrmDestacamentoPendente.grdIntegraFolhaDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not qryIntegraFolha.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               //If (qryIntegraFolhaTIPOINTEGRA.value = 'Adiantamento') And (qryIntegraFolhaTIPOMOTIVONAOINTEGRACAO.value = '0') Then //Everson Cunha - SIG74816
               If (qryIntegraFolha.FieldByName('TIPOINTEGRA').Value = 'Adiantamento') And (qryIntegraFolha.FieldByName('TIPOMOTIVONAOINTEGRACAO').Value = '0') Then   //Everson Cunha - SIG74816
                  grdIntegraFolha.Canvas.Font.Color := clBlue; // a linha toda fica na cor setada

               //If (qryIntegraFolhaTIPOINTEGRA.value = 'Acerto de Contas') And (qryIntegraFolhaTIPOMOTIVONAOINTEGRACAO.value = '0') Then  //Everson Cunha - SIG74816
               If (qryIntegraFolha.FieldByName('TIPOINTEGRA').Value = 'Acerto de Contas') And (qryIntegraFolha.FieldByName('TIPOMOTIVONAOINTEGRACAO').Value = '0') Then    //Everson Cunha - SIG74816
                  grdIntegraFolha.Canvas.Font.Color := clGreen; // a linha toda fica na cor setada

               //If (qryIntegraFolhaTIPOMOTIVONAOINTEGRACAO.value = '1') Then //Everson Cunha - SIG74816
               If (qryIntegraFolha.FieldByName('TIPOMOTIVONAOINTEGRACAO').Value = '1') Then   //Everson Cunha - SIG74816
                  grdIntegraFolha.Canvas.Font.Color := clRed; // a linha toda fica na cor setada

               grdIntegraFolha.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmDestacamentoPendente.grdIntegraFolhaDblClick(Sender: TObject); //Paulo Nobre SOL 205125 KTN 1984450
Var RegAtual: TBookMark;
Begin
   Screen.Cursor := crSQLWait;

   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
   qryIntegraFolha.edit;
   qryIntegraFolha.FieldByName('FLGINTEGRARFOLHA').AsString := InverteFlag(qryIntegraFolha.FieldByName('FLGINTEGRARFOLHA').AsString);
   qryIntegraFolha.post;


   {RegAtual := qryIntegraFolha.GetBookmark; // Salvando o ponteiro do Registro

   qryAlteraFlagFolha.Close;
   If qryIntegraFolha.FieldByName('FLGINTEGRARFOLHA').AsString = 'S' Then
      qryAlteraFlagFolha.parambyname('FLGINTEGRARFOLHA').AsString := 'N'
   Else
      qryAlteraFlagFolha.parambyname('FLGINTEGRARFOLHA').AsString := 'S';

   qryAlteraFlagFolha.parambyname('IDDESTACAMENTO').AsInteger := qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsInteger;
   qryAlteraFlagFolha.ExecSQL;

   qryIntegraFolha.Close;
   qryIntegraFolha.Open;

   qryIntegraFolha.GotoBookmark(RegAtual); // Voltando ao Reg. atual
   }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

   Screen.Cursor := crDefault; //Paulo Nobre SOL 205125 KTN 1984450
End;

Procedure TfrmDestacamentoPendente.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Procedure TfrmDestacamentoPendente.grdIntegraFinancCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmDestacamentoPendente.grdIntegraFolhaCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmDestacamentoPendente.rdgFiltro2Click(Sender: TObject);
Begin
   If pcIntegracoes.ActivePageIndex = 0 Then
   begin
     qryIntegraFinanc.Filter   := '';
     qryIntegraFinanc.Filtered := False;
   end
   Else
   begin
     qryIntegraFolha.Filter   := '';
     qryIntegraFolha.Filtered := False;
   end;

   gbDestacado.Visible := False;
   //gbLotacao.Visible := False;    // edilaine.ferraresi - SOL 185481 / KTN 1907260
   gbDataPrevPagto.Visible := False;
   spbExecutarFiltro.Visible := False;


   If rdgFiltro2.itemindex = 1 {0} Then   // edilaine.ferraresi - SOL 185481 / KTN 1907260
      Begin
         gbDestacado.Visible := True;
         spbExecutarFiltro.Visible := True;
      End;

   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
   {If rdgFiltro2.itemindex = 1 Then
      Begin
         gbLotacao.Visible := True;
         dblkCentroCusto.Clear;
         spbExecutarFiltro.Visible := True;
      End;
   }// edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

   //If pcIntegracoes.ActivePageIndex = 0 Then  // edilaine.ferraresi - SOL 185481 / KTN 1907260
      Begin
         If rdgFiltro2.itemindex >= 2 Then   // edilaine.ferraresi - SOL 185481 / KTN 1907260
            Begin
               gbDataPrevPagto.Visible := True;
               dtDe.Date := date;
               dtAte.Date := date;
               gbDataPrevPagto.Caption := iif(pcIntegracoes.ActivePageIndex = 0, ' Data Prevista de Pagamento ', ' Data de Viagem ');
               spbExecutarFiltro.Visible := True;
            End;
      End;
End;

Procedure TfrmDestacamentoPendente.spbExecutarFiltroClick(Sender: TObject);
VAR
  sFiltro : string;
Begin
  //Everson Cunha - SIG74816 - Início
  CarregaMovimento;
  {
  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
  case rdgFiltro2.itemindex of
    2 : sFiltro := '(CODCONTRATO = ''E'' )';
    3 : sFiltro := '(CODCONTRATO = ''P'' )';
    4 : sFiltro := '(CODCONTRATO = ''A'' )';
    else
      sFiltro := '';
  end;
  // edilaine.ferraresi - SOL 185481 / KTN 1907260- fim

   If pcIntegracoes.ActivePageIndex = 0 Then
      Begin
         qryIntegraFinanc.Filter := '';
         qryIntegraFinanc.Filtered := False;

         If rdgFiltro2.itemindex = 1 0 Then      // edilaine.ferraresi - SOL 185481 / KTN 1907260
            Begin
               If MontaSelectFunc.RetornouValor Then
                  qryIntegraFinanc.Filter := 'IDPESSOA = ' + MontaSelectFunc.ValoresChave[0];
            End

         // edilaine.ferraresi - SOL 185481 / KTN 1907260 - comentado
         //If rdgFiltro2.itemindex = 1 Then
         //   qryIntegraFinanc.Filter := 'CODCENTROCUSTO = ' + qryLkpCentroCusto.fieldbyname('CODCENTROCUSTO').asString;

         else If rdgFiltro2.itemindex >= 2 Then
            Begin
               If (dtDe.date > dtAte.date) Or (dtAte.date < dtDe.date) Then
                  Begin
                     Application.MessageBox('Período Inválido. Verifique !', 'Atenção !', Mb_IconExclamation);
                     dtDe.setfocus;
                     Exit;
                  End;
               qryIntegraFinanc.Filter := '(DATAPAGTO >= ' + quotedstr(datetostr(dtDe.date)) + ' AND ' + ' DATAPAGTO <= ' + quotedstr(datetostr(dtAte.date))+')';
               qryIntegraFinanc.Filter := qryIntegraFinanc.Filter + ' AND '+sFiltro;  // edilaine.ferraresi - SOL 185481 / KTN 1907260

            End;
         qryIntegraFinanc.Filtered := True;
      End
   Else
      Begin
         qryIntegraFolha.Filtered := False;

         If rdgFiltro2.itemindex = 1 Then
            Begin
               If MontaSelectFunc.RetornouValor Then
                  qryIntegraFolha.Filter := 'IDPESSOA = ' + MontaSelectFunc.ValoresChave[0];
            End
         // edilaine.ferraresi - SOL 185481 / KTN 1907260 - comentado
         //If rdgFiltro2.itemindex = 1 Then
         //   qryIntegraFolha.Filter := 'CODCENTROCUSTO = ' + qryLkpCentroCusto.fieldbyname('CODCENTROCUSTO').asString;

         else If rdgFiltro2.itemindex >= 2 Then
            Begin
               // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
               If (dtDe.date > dtAte.date) Or (dtAte.date < dtDe.date) Then
                  Begin
                     Application.MessageBox('Período Inválido. Verifique !', 'Atenção !', Mb_IconExclamation);
                     dtDe.setfocus;
                     Exit;
                  End;
               qryIntegraFolha.Filter := '(DATAINI >= ' + quotedstr(datetostr(dtDe.date)) + ' AND ' + ' DATAINI <= ' + quotedstr(datetostr(dtAte.date))+')';
               //qryIntegraFolha.Filter := qryIntegraFinanc.Filter + ' AND '+sFiltro; //Everson Cunha - SIG74816
               qryIntegraFolha.Filter := qryIntegraFolha.Filter + ' AND '+sFiltro;   //Everson Cunha - SIG74816
               // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
            end;

         qryIntegraFolha.Filtered := True;
      End;
      }
      //Everson Cunha - SIG74816 - Fim
End;

Procedure TfrmDestacamentoPendente.rdgFiltro1Click(Sender: TObject);
// edilaine.ferraresi - SOL 185481 / KTN 1907260
const
   sql_Financ_Adianta = 'SELECT ''A'' AS ORDEM,                '+CR_LF+
                        '    D.IDDESTACAMENTO,                 '+CR_LF+
                        '    D.DATALANCAMENTO,                 '+CR_LF+
                        '    T.DATAINI,                        '+CR_LF+
                        '    ''Adiantamento'' AS TIPOINTEGRA,  '+CR_LF+
                        '    D.DATAPAGTODESTAC AS DATAPAGTO,   '+CR_LF+
                        '    D.CODDOCDESTAC AS NODOCUMENTO,    '+CR_LF+
                        '    D.CODDOCACERTO,                   '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                        //'    D.FLGINTEGRARFINANC,              '
                        '    ''S'' FLGINTEGRARFINANC,          '+CR_LF+
                        '    DECODE(F.TIPOCONTRATO,''E'', ''Empregados FUNCEF''  , '+CR_LF+
                        '                          ''P'', ''Empregados Cedidos'' , '+CR_LF+
                        '                          ''3'', ''Empregados Cedidos'' , '+CR_LF+
                        '                          ''A'', ''Conselheiros FUNCEF'', '+CR_LF+
                        '                          '''') TIPOCONTRATO,             '+CR_LF+
                        '    DECODE(F.TIPOCONTRATO, ''3'', ''P'', F.TIPOCONTRATO) as CODCONTRATO, '+CR_LF+
                        '    V.TOTAL,                                  '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                        '    D.CODCENTROCUSTO,                         '+CR_LF+
                        '    D.IDPESSOA,                               '+CR_LF+
                        '    D.JUSTIFICATIVA,                          '+CR_LF+
                        '    D.CODFORMAPAG,                            '+CR_LF+
                        '    D.CODFORMAREC,                            '+CR_LF+
                        '    T.OBSERVACAO,                             '+CR_LF+
                        '    P.NOME AS NOMEDESTACADO                   '+CR_LF+
                        ' FROM                                         '+CR_LF+
                        '    DESTACAMENTO D,                           '+CR_LF+
                        '    DSTTRECHO T,                              '+CR_LF+
                        '    PESSOA P,                                 '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                        '    FUNCIONARIO F,                            '+CR_LF+
                        '    (SELECT IDDESTACAMENTO, SUM(VLRITEM) AS TOTAL '+CR_LF+
                        '       FROM DESTACAMENTOXITEMDESPESA          '+CR_LF+
                        '      WHERE TIPOQUALIFICACAO = ''A''          '+CR_LF+
                        '      GROUP BY IDDESTACAMENTO) V              '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                        ' WHERE                                        '+CR_LF+
                        '     P.IDPESSOA = D.IDPESSOA AND              '+CR_LF+
                        '     F.IDPESSOA = D.IDPESSOA AND              '+CR_LF+  // edilaine.ferraresi - SOL 185481 / KTN 1907260
                        '     V.IDDESTACAMENTO = D.IDDESTACAMENTO AND  '+CR_LF+  // edilaine.ferraresi - SOL 185481 / KTN 1907260
                        '     D.IDDESTACAMENTO = T.IDDESTACAMENTO AND  '+CR_LF+
                        '     D.CODDOCDESTAC IS NULL AND               '+CR_LF+
                        '     D.DATAPAGTODESTAC IS NOT NULL AND        '+CR_LF+
                        '     T.NUMSEQ = (SELECT MIN(T1.NUMSEQ) FROM DSTTRECHO T1 WHERE T.IDDESTACAMENTO = T1.IDDESTACAMENTO ) ';

   sql_Financ_Acerto = 'SELECT ''B'' AS ORDEM,                         '+CR_LF+
                       '    D.IDDESTACAMENTO,                          '+CR_LF+
                       '    D.DATALANCAMENTO,                          '+CR_LF+
                       '    S.DATAINI,                                 '+CR_LF+
                       '    ''Acerto de Contas'' AS TIPOINTEGRA,       '+CR_LF+
                       '    D.DATAPAGTOACERTO AS DATAPAGTO,            '+CR_LF+
                       '    T.NODOCUMENTO AS NODOCUMENTO,              '+CR_LF+
                       '    D.CODDOCACERTO,                            '+CR_LF+
                       // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                       //'    D.FLGINTEGRARFINANC,              '
                       '    ''S'' FLGINTEGRARFINANC,                   '+CR_LF+
                       '    DECODE(F.TIPOCONTRATO,''E'', ''Empregados FUNCEF''  ,  '+CR_LF+
                       '                          ''P'', ''Empregados Cedidos'' ,  '+CR_LF+
                       '                          ''3'', ''Empregados Cedidos'' ,  '+CR_LF+
                       '                          ''A'', ''Conselheiros FUNCEF'',  '+CR_LF+
                       '                          '''') TIPOCONTRATO,              '+CR_LF+
                       '    DECODE(F.TIPOCONTRATO, ''3'', ''P'', F.TIPOCONTRATO) as CODCONTRATO, '+CR_LF+
                       '    V.TOTAL,                                   '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                       '    D.CODCENTROCUSTO,                          '+CR_LF+
                       '    D.IDPESSOA,                                '+CR_LF+
                       '    D.JUSTIFICATIVA,                           '+CR_LF+
                       '    D.CODFORMAPAG,                             '+CR_LF+
                       '    D.CODFORMAREC,                             '+CR_LF+
                       '    S.OBSERVACAO,                              '+CR_LF+
                       '    P.NOME AS NOMEDESTACADO                    '+CR_LF+
                       ' FROM                                          '+CR_LF+
                       '    DESTACAMENTO D,                            '+CR_LF+
                       '    DSTTRECHO S,                               '+CR_LF+
                       '    PESSOA P,                                  '+CR_LF+
                       '    DOCUMENTO T,                               '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                       '    FUNCIONARIO F,                             '+CR_LF+
                        '    (SELECT IDDESTACAMENTO, SUM(VLRITEM) AS TOTAL '+CR_LF+
                        '       FROM DESTACAMENTOXITEMDESPESA          '+CR_LF+
                        '      WHERE TIPOQUALIFICACAO = ''C''          '+CR_LF+
                        '      GROUP BY IDDESTACAMENTO) V              '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                       ' WHERE                                         '+CR_LF+
                       '     F.IDPESSOA = D.IDPESSOA AND               '+CR_LF+   // edilaine.ferraresi - SOL 185481 / KTN 1907260
                       '     P.IDPESSOA = D.IDPESSOA  AND              '+CR_LF+
                       '     D.IDDESTACAMENTO = S.IDDESTACAMENTO AND   '+CR_LF+
                       '     V.IDDESTACAMENTO = D.IDDESTACAMENTO AND   '+CR_LF+   // edilaine.ferraresi - SOL 185481 / KTN 1907260
                       '     D.CODDOCDESTAC = T.CODDOCUMENTO (+) AND   '+CR_LF+
                       '     D.DATAPAGTOACERTO IS NOT NULL AND         '+CR_LF+
                       '     D.CODDOCDESTAC IS NOT NULL AND            '+CR_LF+
                       '     D.CODDOCACERTO IS NULL AND                '+CR_LF+
                       '     (DECODE(D.FLGACERTOCONTASPR1, ''C'', D.VLRACERTOCONTAS1, D.VLRACERTOCONTAS1 * -1) + '+CR_LF+
                       '      DECODE(D.FLGACERTOCONTASPR2, ''C'', D.VLRACERTOCONTAS2, D.VLRACERTOCONTAS2 * -1) + '+CR_LF+
                       '      DECODE(D.FLGACERTOCONTASPR3, ''C'', D.VLRACERTOCONTAS3, D.VLRACERTOCONTAS3 * -1) + '+CR_LF+
                       '      DECODE(D.FLGACERTOCONTASPR4, ''C'', D.VLRACERTOCONTAS4, D.VLRACERTOCONTAS4 * -1) <> 0) AND      '+CR_LF+
                       //Marcio Sanches Spinosa SOL 201446 kintana 1947503 - Inicio
                       //'     T.NUMSEQ = (SELECT MIN(T1.NUMSEQ) FROM DSTTRECHO T1 WHERE T.IDDESTACAMENTO = T1.IDDESTACAMENTO ) '
                       '     S.NUMSEQ = (SELECT MIN(T1.NUMSEQ) FROM DSTTRECHO T1 WHERE S.IDDESTACAMENTO = T1.IDDESTACAMENTO ) ';
                       //Marcio Sanches Spinosa SOL 201446 kintana 1947503 - Fim

   sql_Folha_Adianta = 'SELECT ''A'' AS ORDEM,                 '+CR_LF+
                       '    D.IDDESTACAMENTO,                  '+CR_LF+
                       '    D.DATALANCAMENTO,                  '+CR_LF+
                       '    T.DATAINI,                         '+CR_LF+
                       '    D.FLGLANCAFOLHA,                   '+CR_LF+
                       '    ''Adiantamento'' AS TIPOINTEGRA,   '+CR_LF+
                       '    D.ANOMESREFADIANT AS MESREFAD,     '+CR_LF+
                       '    D.ANOMESREFACERTO AS MESREFAC,     '+CR_LF+
                       // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                       //'    D.FLGINTEGRARFOLHA,               '
                       '    ''S'' FLGINTEGRARFOLHA,            '+CR_LF+
                       '    DECODE(F.TIPOCONTRATO,''E'', ''Empregados FUNCEF'' ,  '+CR_LF+
                       '                          ''P'', ''Empregados Cedidos'',  '+CR_LF+
                       '                          ''3'', ''Empregados Cedidos'',  '+CR_LF+
                       '                          ''A'', ''Conselheiros FUNCEF'', '+CR_LF+
                       '                          '''') TIPOCONTRATO,             '+CR_LF+
                       '    DECODE(F.TIPOCONTRATO, ''3'', ''P'', F.TIPOCONTRATO) as CODCONTRATO, '+CR_LF+
                       '    V.TOTAL,                                   '+CR_LF+
                       // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                       '    D.TIPOMOTIVONAOINTEGRACAO,                 '+CR_LF+
                       '    D.CODCENTROCUSTO,                          '+CR_LF+
                       '    D.IDPESSOA,                                '+CR_LF+
                       '    P.NOME AS NOMEDESTACADO                    '+CR_LF+
                       ' FROM                                          '+CR_LF+
                       '    DESTACAMENTO D,                            '+CR_LF+
                       '    DSTTRECHO T,                               '+CR_LF+
                       '    PESSOA P,                                  '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                       '    FUNCIONARIO F,                             '+CR_LF+
                        '    (SELECT IDDESTACAMENTO, SUM(VLRITEM) AS TOTAL  '+CR_LF+
                        '       FROM DESTACAMENTOXITEMDESPESA          '+CR_LF+
                        '      WHERE TIPOQUALIFICACAO = ''A''          '+CR_LF+
                        '      GROUP BY IDDESTACAMENTO) V              '+CR_LF+
                        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                       ' WHERE                                         '+CR_LF+
                       '     F.IDPESSOA = D.IDPESSOA AND               '+CR_LF+   // edilaine.ferraresi - SOL 185481 / KTN 1907260
                       '     P.IDPESSOA = D.IDPESSOA AND               '+CR_LF+
                       '     V.IDDESTACAMENTO = D.IDDESTACAMENTO AND   '+CR_LF+   // edilaine.ferraresi - SOL 185481 / KTN 1907260
                       '     D.IDDESTACAMENTO = T.IDDESTACAMENTO AND   '+CR_LF+
                       '     NVL(D.FLGLANCAFOLHA, 0) = 0 AND           '+CR_LF+
                       '     T.NUMSEQ = (SELECT MIN(T1.NUMSEQ) FROM DSTTRECHO T1 WHERE T.IDDESTACAMENTO = T1.IDDESTACAMENTO ) ';

   sql_Folha_Acerto = 'SELECT ''B'' AS ORDEM,                          '+CR_LF+
                      '    D.IDDESTACAMENTO,                           '+CR_LF+
                      '    D.DATALANCAMENTO,                           '+CR_LF+
                      '    T.DATAINI,                                  '+CR_LF+
                      '    D.FLGLANCAFOLHA,                            '+CR_LF+
                      '    ''Acerto de Contas'' AS TIPOINTEGRA,        '+CR_LF+
                      '    D.ANOMESREFADIANT AS MESREFAD,              '+CR_LF+
                      '    D.ANOMESREFACERTO AS MESREFAC,              '+CR_LF+
                      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                      //'    D.FLGINTEGRARFOLHA,               '
                      '    ''S'' FLGINTEGRARFOLHA,                              '+CR_LF+
                      '    DECODE(F.TIPOCONTRATO,''E'', ''Empregados FUNCEF'' , '+CR_LF+
                      '                          ''P'', ''Empregados Cedidos'', '+CR_LF+
                      '                          ''3'', ''Empregados Cedidos'', '+CR_LF+
                      '                          ''A'', ''Conselheiros FUNCEF'','+CR_LF+
                      '                          '''') TIPOCONTRATO,            '+CR_LF+
                      '    DECODE(F.TIPOCONTRATO, ''3'', ''P'', F.TIPOCONTRATO) as CODCONTRATO, '+CR_LF+
                      '    V.TOTAL,                                             '+CR_LF+
                      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                      '    D.TIPOMOTIVONAOINTEGRACAO,                '+CR_LF+
                      '    D.CODCENTROCUSTO,                         '+CR_LF+
                      '    D.IDPESSOA,                               '+CR_LF+
                      '    P.NOME AS NOMEDESTACADO                   '+CR_LF+
                      ' FROM                                         '+CR_LF+
                      '    DESTACAMENTO D,                           '+CR_LF+
                      '    DSTTRECHO T,                              '+CR_LF+
                      '    PESSOA P,                                 '+CR_LF+
                      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
                      '    FUNCIONARIO F,                            '+CR_LF+
                      '    (SELECT IDDESTACAMENTO, SUM(VLRITEM) AS TOTAL '+CR_LF+
                      '       FROM DESTACAMENTOXITEMDESPESA          '+CR_LF+
                      '      WHERE TIPOQUALIFICACAO = ''C''          '+CR_LF+
                      '      GROUP BY IDDESTACAMENTO) V              '+CR_LF+
                      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
                      ' WHERE                                        '+CR_LF+
                      '     F.IDPESSOA = D.IDPESSOA AND              '+CR_LF+  // edilaine.ferraresi - SOL 185481 / KTN 1907260
                      '     P.IDPESSOA = D.IDPESSOA AND              '+CR_LF+
                      '     V.IDDESTACAMENTO = D.IDDESTACAMENTO AND  '+CR_LF+   // edilaine.ferraresi - SOL 185481 / KTN 1907260
                      '     D.IDDESTACAMENTO = T.IDDESTACAMENTO AND  '+CR_LF+
                      '     NVL(D.FLGLANCAFOLHA, 0) <> 0 AND         '+CR_LF+
                      '     NVL(D.FLGLANCAFOLHAACERTO, 0) = 0 AND    '+CR_LF+
                      '     D.DATAPAGTOACERTO IS NOT NULL AND        '+CR_LF+
                      '     (DECODE(D.FLGACERTOCONTASPR1, ''C'', D.VLRACERTOCONTAS1, D.VLRACERTOCONTAS1 * -1)+ '+CR_LF+
                      '     DECODE(D.FLGACERTOCONTASPR2, ''C'', D.VLRACERTOCONTAS2, D.VLRACERTOCONTAS2 * -1) + '+CR_LF+
                      '     DECODE(D.FLGACERTOCONTASPR3, ''C'', D.VLRACERTOCONTAS3, D.VLRACERTOCONTAS3 * -1) + '+CR_LF+
                      '     DECODE(D.FLGACERTOCONTASPR4, ''C'', D.VLRACERTOCONTAS4, D.VLRACERTOCONTAS4 * -1) <> 0) AND       '+CR_LF+
                      '     T.NUMSEQ = (SELECT MIN(T1.NUMSEQ) FROM DSTTRECHO T1 WHERE T.IDDESTACAMENTO = T1.IDDESTACAMENTO ) ';

   Procedure CarregaFinancAdiantamento;
   Begin
      qryIntegraFinanc.Close;
      with sqlIntegraFinanc {qryIntegraFinanc} do  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
      begin
        Close;
        SQL.Clear;
        SQL.ADD( sql_Financ_Adianta );
        SQL.ADD('ORDER BY /*ORDEM, DATALANCAMENTO*/ TIPOINTEGRA, TIPOCONTRATO, DATAPAGTODESTAC ');
      end;
      qryIntegraFinanc.Open;
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
   End;

   Procedure CarregaFinancAcertoContas;
   Begin
      qryIntegraFinanc.Close;
      with sqlIntegraFinanc {qryIntegraFinanc} do  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
      begin
        Close;
        SQL.Clear;
        SQL.ADD( sql_Financ_Acerto );
        SQL.ADD('ORDER BY /*ORDEM, DATALANCAMENTO*/ TIPOINTEGRA, TIPOCONTRATO, DATAPAGTODESTAC ');
      end;
      qryIntegraFinanc.Open;
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
   End;

   Procedure CarregaFinancAdiant_e_AcertoContas;
   Begin
      qryIntegraFinanc.Close;
      with sqlIntegraFinanc {qryIntegraFinanc} do  // edilaine.ferraresi - SOL 185481 / KTN 1907260
      begin
        Close;
        SQL.Clear;
        SQL.ADD('SELECT * FROM (   ');
        SQL.ADD( sql_Financ_Adianta );
        SQL.ADD('UNION');
        SQL.ADD( sql_Financ_Acerto  );
        SQL.ADD(')' );
        SQL.ADD('ORDER BY /*ORDEM, DATALANCAMENTO*/ TIPOINTEGRA, TIPOCONTRATO, DATAPAGTO ');
      end;
      qryIntegraFinanc.Open;
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
   End;

   Procedure CarregaFolhaAdiantamento;
   Begin
      qryIntegraFolha.Close;
      with sqlIntegraFolha {qryIntegraFolha} do  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
      begin
        Close;
        SQL.Clear;
        SQL.ADD( sql_folha_Adianta );
        SQL.ADD('ORDER BY /*ORDEM, DATALANCAMENTO*/ TIPOINTEGRA, TIPOCONTRATO, DATAINI');
        // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
      end;
      qryIntegraFolha.Open;
   End;

   Procedure CarregaFolhaAcertoContas;
   Begin
      qryIntegraFolha.Close;
      with sqlIntegraFolha {qryIntegraFolha} do  // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
      begin
        Close;
        SQL.Clear;
        SQL.ADD( sql_folha_Acerto );
        SQL.ADD('ORDER BY /*ORDEM, DATALANCAMENTO*/ TIPOINTEGRA, TIPOCONTRATO, DATAINI');
      end;
      qryIntegraFolha.Open;
   End;

   Procedure CarregaFolhaAdiant_e_AcertoContas;
   Begin
      qryIntegraFolha.Close;
      with sqlIntegraFolha {qryIntegraFolha} do  // edilaine.ferraresi - SOL 185481 / KTN 1907260
      begin
        Close;
        SQL.Clear;
        SQL.ADD('SELECT * FROM (   ');
        SQL.ADD( sql_Folha_Adianta );
        SQL.ADD('UNION');
        SQL.ADD( sql_Folha_Acerto  );
        SQL.ADD(')' );
        SQL.ADD('ORDER BY /*ORDEM, DATALANCAMENTO*/ TIPOINTEGRA, TIPOCONTRATO, DATAINI');
      end;
      qryIntegraFolha.Open;
   End;

Begin
   gbDestacado.Visible := False;
   //gbLotacao.Visible := False; // edilaine.ferraresi - SOL 185481 / KTN 1907260
   gbDataPrevPagto.Visible := False;
   spbExecutarFiltro.Visible := False;
   If pcIntegracoes.ActivePageIndex = 0 Then
      qryIntegraFinanc.Filtered := False
   Else
      qryIntegraFolha.Filtered := False;

   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
   If rdgFiltro1.itemindex = 0 Then
      Begin
         case pcIntegracoes.ActivePageIndex of
           0 : CarregaFinancAdiant_e_AcertoContas;
           1 : CarregaFolhaAdiant_e_AcertoContas;
         end;
      End
   else If rdgFiltro1.itemindex = 1 Then
      Begin
         case pcIntegracoes.ActivePageIndex of
           0 : CarregaFinancAdiantamento;
           1 : CarregaFolhaAdiantamento;
         end;
      End
   else If rdgFiltro1.itemindex = 2 Then
      Begin
         case pcIntegracoes.ActivePageIndex of
          0 : CarregaFinancAcertoContas;
          1 : CarregaFolhaAcertoContas;
         end;
      End;

   rdgFiltro2Click(self);
   // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim
End;

Procedure TfrmDestacamentoPendente.pcIntegracoesChange(Sender: TObject);
Begin
  //rdgFiltro1Click(Self);    // edilaine.ferraresi - SOL 185481 / KTN 1907260  //Everson Cunha - SIG74816
  //rdgFiltro2Click(Self);  // edilaine.ferraresi - SOL 185481 / KTN 1907260

  //Everson Cunha - SIG87510 - Início
  if pcIntegracoes.ActivePageIndex = 0 then
  begin
    chkIntegradoFinanc.Enabled := False;
    chkIntegradoFinanc.Checked := False;
    lblIntegradoFinanc.Font.Color := clActiveBorder;
  end
  else
  begin
    chkIntegradoFinanc.Enabled := True;
    chkIntegradoFinanc.Checked := True;
    lblIntegradoFinanc.Font.Color := clWindowText;
  end;
  //Everson Cunha - SIG87510 - Fim
  
End;

Procedure TfrmDestacamentoPendente.gridIButtonClick(Sender: TObject);
Begin
   frmCadDestacamento := TfrmCadDestacamento.create(self);
   frmCadDestacamento.Tag := qryIntegraFinanc.FieldByName('IDDESTACAMENTO').AsInteger;
   frmCadDestacamento.ShowModal;
   frmCadDestacamento.free;
End;

Procedure TfrmDestacamentoPendente.wwIButton1Click(Sender: TObject);
Begin
   frmCadDestacamento := TfrmCadDestacamento.create(self);
   frmCadDestacamento.Tag := qryIntegraFolha.FieldByName('IDDESTACAMENTO').AsInteger;
   frmCadDestacamento.ShowModal;
   frmCadDestacamento.free;
End;

procedure TfrmDestacamentoPendente.CarregaMovimento;
var
  sSql    : TStringList;
  sFiltro : string;
begin
  try
    Screen.Cursor := crSQLWait;

    sSql := TStringList.Create;

    sSql.Text :=

    'SELECT * FROM (                                                                                                      ' + #13#10 +
    'SELECT ''A'' ORDEM, ''N'' FLGINTEGRARFINANC, ''N'' FLGINTEGRARFOLHA, D.IDDESTACAMENTO, D.IDPESSOA,                   ' + #13#10 +
    '       ''Adiantamento'' AS TIPOINTEGRA, D.DATAPAGTODESTAC DATAPAGTO,                                                 ' + #13#10 +
    '     P.NOME NOMEDESTACADO, D.CODDOCDESTAC NODOCUMENTO, D.CODDOCACERTO,                                               ' + #13#10 +
    '     DECODE(F.TIPOCONTRATO, ''E'', ''Empregados FUNCEF'',                                                            ' + #13#10 +
    '                   ''S'', ''LEF'',                                                                                   ' + #13#10 +
    '                   ''T'', ''Terceirizado'',                                                                          ' + #13#10 +
    '                   ''G'', ''Estagiário'',                                                                            ' + #13#10 +
    '                   ''3'', ''Empregados Cedidos'',                                                                    ' + #13#10 +
    '                              ''P'', ''Empregados Cedidos'',                                                         ' + #13#10 +
    '                              ''A'', ''Conselheiros FUNCEF'',                                                        ' + #13#10 +
    '                              '''') TIPOCONTRATO, DECODE(F.TIPOCONTRATO, ''3'', ''P'', F.TIPOCONTRATO) CODCONTRATO,  ' + #13#10 +
    '       V.TOTAL, D.TIPOMOTIVONAOINTEGRACAO, D.ANOMESREFADIANT AS MESREFAD, D.ANOMESREFACERTO AS MESREFAC,             ' + #13#10 +
    '       D.FLGLANCAFOLHA                                                                                               ' + #13#10 +
    '  FROM CM.DESTACAMENTO D                                                                                             ' + #13#10 +
    '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA                                                                   ' + #13#10 +
    '  JOIN CM.PESSOA P ON P.IDPESSOA = F.IDPESSOA                                                                        ' + #13#10 +
    '  JOIN (SELECT IDDESTACAMENTO, SUM(VLRITEM) AS TOTAL                                                                 ' + #13#10 +
    '          FROM CM.DESTACAMENTOXITEMDESPESA                                                                           ' + #13#10 +
    '         WHERE TIPOQUALIFICACAO = ''A''                                                                              ' + #13#10 +
    '         GROUP BY IDDESTACAMENTO) V ON V.IDDESTACAMENTO = D.IDDESTACAMENTO                                           ' + #13#10 ;

    if pcIntegracoes.ActivePageIndex = 0 Then
      sSql.Text := sSql.Text + '   WHERE D.DATAPAGTODESTAC IS NOT NULL                                                    ' + #13#10 +
                               '     AND D.CODDOCDESTAC IS NULL                                                           ' + #13#10
    else
    begin
      sSql.Text := sSql.Text + '   WHERE NVL(D.FLGLANCAFOLHA, 0) = 0                                                      ' + #13#10 ;

      if chkIntegradoFinanc.Checked then //Everson Cunha - SIG87510
        sSql.Text := sSql.Text + '     AND D.CODDOCDESTAC IS NOT NULL                                                     ' + #13#10 ;  //Everson Cunha - SIG87510
    end;

    sSql.Text := sSql.Text +

    'UNION ALL                                                                                                            ' + #13#10 +

    'SELECT ''B'' ORDEM, ''N'' FLGINTEGRARFINANC, ''N'' FLGINTEGRARFOLHA, D.IDDESTACAMENTO, D.IDPESSOA,                   ' + #13#10 +
    '     ''Acerto de Contas'' AS TIPOINTEGRA, D.DATAPAGTOACERTO DATAPAGTO,                                               ' + #13#10 +
    '     P.NOME NOMEDESTACADO, DOC.NODOCUMENTO, D.CODDOCACERTO,                                                          ' + #13#10 +
    '     DECODE(F.TIPOCONTRATO, ''E'', ''Empregados FUNCEF'',                                                            ' + #13#10 +
    '                   ''S'', ''LEF'',                                                                                   ' + #13#10 +
    '                   ''T'', ''Terceirizado'',                                                                          ' + #13#10 +
    '                   ''G'', ''Estagiário'',                                                                            ' + #13#10 +
    '                   ''3'', ''Empregados Cedidos'',                                                                    ' + #13#10 +
    '                              ''P'', ''Empregados Cedidos'',                                                         ' + #13#10 +
    '                              ''A'', ''Conselheiros FUNCEF'',                                                        ' + #13#10 +
    '                              '''') TIPOCONTRATO, DECODE(F.TIPOCONTRATO, ''3'', ''P'', F.TIPOCONTRATO) CODCONTRATO,  ' + #13#10 +
    '       V.TOTAL, D.TIPOMOTIVONAOINTEGRACAO, D.ANOMESREFADIANT AS MESREFAD, D.ANOMESREFACERTO AS MESREFAC,             ' + #13#10 +
    '       D.FLGLANCAFOLHA                                                                                               ' + #13#10 +
    '  FROM CM.DESTACAMENTO D                                                                                             ' + #13#10 +
    '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA                                                                   ' + #13#10 +
    '  JOIN CM.PESSOA P ON P.IDPESSOA = F.IDPESSOA                                                                        ' + #13#10 +
    '  JOIN (SELECT IDDESTACAMENTO, SUM(VLRITEM) AS TOTAL                                                                 ' + #13#10 +
    '          FROM CM.DESTACAMENTOXITEMDESPESA                                                                           ' + #13#10 +
    '         WHERE TIPOQUALIFICACAO = ''C''                                                                              ' + #13#10 +
    '         GROUP BY IDDESTACAMENTO) V ON V.IDDESTACAMENTO = D.IDDESTACAMENTO                                           ' + #13#10 +
    '  LEFT JOIN CM.DOCUMENTO DOC ON DOC.CODDOCUMENTO = D.CODDOCDESTAC                                                    ' + #13#10 ;

    if pcIntegracoes.ActivePageIndex = 0 Then
      sSql.Text := sSql.Text + '   WHERE D.DATAPAGTOACERTO IS NOT NULL                                                    ' + #13#10 +
                               '     AND D.CODDOCACERTO IS NULL                                                           ' + #13#10
    else
    begin
      sSql.Text := sSql.Text + '   WHERE NVL(D.FLGLANCAFOLHAACERTO, 0) = 0                                                ' + #13#10 ;

      if chkIntegradoFinanc.Checked then  //Everson Cunha - SIG87510
        sSql.Text := sSql.Text + '     AND D.CODDOCACERTO IS NOT NULL                                                     ' + #13#10 ;  //Everson Cunha - SIG87510
    end;

    sSql.Text := sSql.Text +

    ' )                                                                                                                   ' + #13#10 +
    'WHERE 1 = 1                                                                                                          ' + #13#10 ;

    if MontaSelectFunc.RetornouValor then
      sSql.Text := sSql.Text + '   AND IDPESSOA = ' + MontaSelectFunc.ValoresChave[0]                                       + #13#10 ;

    if (chkAdt.Checked = True) and (chkAcerto.Checked = False) then
      sSql.Text := sSql.Text + '   AND ORDEM = ''A''                                                                      ' + #13#10 ;

    if (chkAdt.Checked = False) and (chkAcerto.Checked = True) then
      sSql.Text := sSql.Text + '   AND ORDEM = ''B''                                                                      ' + #13#10 ;

    if (dtDe.Text <> EmptyStr) and (dtAte.Text <> EmptyStr) then
    if (dtDe.date > dtAte.date) Or (dtAte.date < dtDe.date) Then
    Begin
      Application.MessageBox('Período Inválido. Verifique !', 'Atenção !', Mb_IconExclamation);
      dtDe.setfocus;
      Exit;
    End;

    if dtDe.Text <> EmptyStr then
      sSql.Text := sSql.Text + '   AND DATAPAGTO >= ' + quotedstr(datetostr(dtDe.date))                                     + #13#10 ;

    if dtAte.Text <> EmptyStr then
      sSql.Text := sSql.Text + '   AND DATAPAGTO <= ' + quotedstr(datetostr(dtAte.date))                                    + #13#10 ;

    sFiltro := FU.GerarListaTipoContratoSel(chkEfetivo.Checked, chkLEF.Checked, chkTerc.Checked,
                                            chkCessao.Checked, chkPrpDir.Checked, chkAutonomo.Checked,
                                            chkEstag.Checked, True);

    sSql.Text := sSql.Text + '   AND CODCONTRATO IN (' + sFiltro + ')                                                     ' + #13#10 ;

    sSql.Text := sSql.Text +

    'ORDER BY ORDEM, TIPOCONTRATO, DATAPAGTO DESC, IDDESTACAMENTO                                                         ';

    if pcIntegracoes.ActivePageIndex = 0 Then
    begin
      qryIntegraFinanc.Close;
      with sqlIntegraFinanc do
      begin
        Close;
        SQL.Clear;
        SQL.ADD( sSql.Text  );
      end;
      qryIntegraFinanc.Open;
    end
    else
    begin
      qryIntegraFolha.Close;
      with sqlIntegraFolha do
      begin
        Close;
        SQL.Clear;
        SQL.ADD( sSql.Text );
      end;
      qryIntegraFolha.Open;
    end;

  finally
    FreeAndNil(sSql);
    Screen.Cursor := crDefault;
  end;
end;

End.

