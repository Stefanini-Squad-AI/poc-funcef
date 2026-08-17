//******************************************************************************
//N. Sol..........: 207968
//N. Kintana......: 2040576
//Data............: 16/08/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Consulta/Imprime o Movimento dos Bloqueios e Desbloqueios
//******************************************************************************
Unit fConsBloqDesbloqJudiciais;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   TXComp, TXRB, ppParameter, ppModule, raCodMod, ppCtrls, ppReport,
   ppStrtch, ppSubRpt, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm,
   ppRelatv, ppProd, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
   wwdblook, Buttons, ExtCtrls, TREdit, TB97, TB97Tlbr, FPreview, Db,
   Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, uFuncoesUteisIR,
   uCtrlMovimFinanc, uCMMath, ImgList, ppDB, ppDBPipe, ppDBBDE, DBCtrls;

Type
   TfrmConsBloqDesbloqJudiciais = Class(TForm)
      pnlDadosFiltro: TPanel;
      relMovBloqDesbloq: TppReport;
      ppParameterList2: TppParameterList;
      ExtraOptions1: TExtraOptions;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      bbtnFiltrar: TBitBtn;
      bbtnDesfazer: TBitBtn;
      btnImprimir: TSpeedButton;
      pnlBanco: TPanel;
      Label8: TLabel;
      cb3: TCheckBox;
      cb2: TCheckBox;
      cb4: TCheckBox;
      pnlDatas: TPanel;
      Label9: TLabel;
      Label11: TLabel;
      dbDtLancDe: TwwDBDateTimePicker;
      dbDtLancAte: TwwDBDateTimePicker;
      pnlValor: TPanel;
      Label12: TLabel;
      rdbIgual: TRadioButton;
      rdbMenor: TRadioButton;
      rdbMaior: TRadioButton;
      edValorFiltro: TRealEdit;
      qryBancoFiltro: TwwQuery;
      StringField1: TStringField;
      StringField2: TStringField;
      StringField3: TStringField;
      FloatField1: TFloatField;
      dsBancoFiltro: TwwDataSource;
      qryAux1: TwwQuery;
      pnlBloqs: TPanel;
      RealEdit1: TRealEdit;
      cb1: TCheckBox;
      rdgSitBloq: TRadioGroup;
      pnlBloqueio: TPanel;
      dbg: TwwDBGrid;
      qryMovBloqJud: TwwQuery;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      DateTimeField1: TDateTimeField;
      DateTimeField2: TDateTimeField;
      StringField4: TStringField;
      StringField5: TStringField;
      FloatField4: TFloatField;
      StringField6: TStringField;
      FloatField5: TFloatField;
      StringField7: TStringField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      StringField9: TStringField;
      qryMovBloqJudSITIMG: TStringField;
      dsMovBloqJud: TDataSource;
      qryLkpBanco: TwwQuery;
      qryLkpBancoDESCRICAO: TStringField;
      qryLkpBancoNUMBANCO: TStringField;
      qryLkpBancoNOCONTACORR: TStringField;
      qryLkpBancoCODPORTADOR: TFloatField;
      dsLkpBanco: TwwDataSource;
      ImlPadrao: TImageList;
      qryEmpresa: TwwQuery;
      qryEmpresaIDPESSOA: TFloatField;
      qryEmpresaNOMEEMPRESA: TStringField;
      qryEmpresaRAZAOSOCIAL: TStringField;
      qryEmpresaIDENDERECO: TFloatField;
      qryEmpresaCEP: TStringField;
      qryEmpresaIMAGEM: TBlobField;
      dsEmpresa: TwwDataSource;
      ppBDEEmpresa: TppBDEPipeline;
      qryMovBloqJudDSCSITBLOQDESBLOQ: TStringField;
      qryMovBloqJudVALOR: TFloatField;
      dblkpBancoFiltro: TDBLookupComboBox;
      stAviso: TStaticText;
      Label1: TLabel;
      qryRateios: TwwQuery;
      qryRateiosIDMOVFINBLOQJUDICIAIS: TFloatField;
      qryRateiosIDPLANPREVCTBPATR: TFloatField;
      qryRateiosVLRRATEIO: TFloatField;
      qryRateiosDSCPLANOPATRO: TStringField;
      dsRateios: TDataSource;
      ppBDERateios: TppBDEPipeline;
      qryLkpPlanPrev: TwwQuery;
      qryLkpPlanPrevPLANPRVCONTABPATRO: TStringField;
      qryLkpPlanPrevIDPLANPREVCTBPATR: TFloatField;
      qryLkpPlanPrevIDPLANOPREV: TFloatField;
      qryLkpPlanPrevIDPATRO: TFloatField;
      dsLkpPlanPrev: TwwDataSource;
      ppTitleBand1: TppTitleBand;
      ppLabel50: TppLabel;
      ppDBImage1: TppDBImage;
      ppDBText7: TppDBText;
      ppSystemVariable2: TppSystemVariable;
      ppLabel20: TppLabel;
      ppHeaderBand1: TppHeaderBand;
      ppShape2: TppShape;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      sbrpRateios: TppSubReport;
      ppChildReport1: TppChildReport;
      ppRateios: TppDetailBand;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppShape10: TppShape;
      ppLabel18: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel19: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      raCodeModule2: TraCodeModule;
      ppShape1: TppShape;
      Image1: TImage;
      Procedure bbtnSairClick(Sender: TObject);
      Procedure btnImprimirClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnFiltrarClick(Sender: TObject);
      Procedure cb3Click(Sender: TObject);
      Procedure cb2Click(Sender: TObject);
      Procedure cb4Click(Sender: TObject);
      Procedure cb1Click(Sender: TObject);
      Procedure dbgDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure bbtnDesfazerClick(Sender: TObject);
   Private
      { Private declarations }
      Function PrepararFloat(sString: String): String;
      Function TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
   Public
      { Public declarations }
   End;

Var
   frmConsBloqDesbloqJudiciais: TfrmConsBloqDesbloqJudiciais;

Implementation

{$R *.DFM}

Function TfrmConsBloqDesbloqJudiciais.PrepararFloat(sString: String): String;
Begin
   Result := TrocaTexto(sString, ',', '.');
End;

Function TfrmConsBloqDesbloqJudiciais.TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
Var
   iPosition: integer;
   sTemp: String;
Begin
   iPosition := 1;
   sTemp := '';
   While (iPosition > 0) Do
      Begin
         If bInsensitive Then
            iPosition := AnsiPos(UpperCase(sOld), UpperCase(sString))
         Else
            iPosition := AnsiPos(sOld, sString);
         If (iPosition > 0) Then
            Begin
               sTemp := sTemp + copy(sString, 1, iPosition - 1) + sNew;
               sString := copy(sString, iPosition + Length(sOld), Length(sString));
            End;
      End;
   sTemp := sTemp + sString;
   Result := (sTemp);
End;

Procedure TfrmConsBloqDesbloqJudiciais.FormShow(Sender: TObject);
Begin
   If frmConsBloqDesbloqJudiciais.WindowState = wsNormal Then
      Begin
         frmConsBloqDesbloqJudiciais.Top := (Screen.Height - Height) Div 2;
         frmConsBloqDesbloqJudiciais.Left := (Screen.Width - Width) Div 2;
      End;

   cb1.Checked := False;
   cb2.Checked := False;
   cb3.Checked := False;
   cb4.Checked := False;
   pnlBanco.Enabled := cb1.Checked;
   pnlDatas.Enabled := cb2.Checked;
   pnlValor.Enabled := cb3.Checked;
   pnlBloqs.Enabled := cb4.Checked;
   rdgSitBloq.Itemindex := 0;
   dblkpBancoFiltro.KeyValue := 3; // Conta da FUNCEF
   dbDtLancDe.Date := strtodate('01/' + inttostr(ExtraiMes(date)) + '/' + inttostr(ExtraiAno(date)));
   dbDtLancAte.Date := TrazUltDiaData(dbDtLancDe.Date);
   rdbIgual.Checked := True;
   edValorFiltro.Text := '0,00';
   stAviso.Visible := True;

   Screen.Cursor := crSQLWait;
   qryMovBloqJud.Close;
   qryLkpBanco.Close;
   qryLkpBanco.Open;
   qryBancoFiltro.Close;
   qryBancoFiltro.Open;
   qryEmpresa.Close;
   qryEmpresa.Open;
   qryLkpPlanPrev.Close;
   qryLkpPlanPrev.Open;
   qryRateios.Close;
   qryRateios.Open;
   Screen.Cursor := crDefault;

   bbtnFiltrar.Enabled := False;
   bbtnDesfazer.Enabled := False;
   btnImprimir.Enabled := False;
End;

Procedure TfrmConsBloqDesbloqJudiciais.bbtnSairClick(Sender: TObject);
Begin
   qryLkpBanco.Close;
   qryBancoFiltro.Close;
   qryMovBloqJud.Close;
   qryEmpresa.Close;
   qryRateios.Close;
   Close;
End;

Procedure TfrmConsBloqDesbloqJudiciais.btnImprimirClick(Sender: TObject);
Begin
   If Not qryMovBloqJud.isEmpty Then
      Begin
         qryMovBloqJud.DisableControls;
         TfrmPreview.CreateModalPreview(Application, relMovBloqDesbloq, relMovBloqDesbloq.PrinterSetup.DocumentName);
         qryMovBloqJud.EnableControls;
         qryMovBloqJud.First;

         bbtnFiltrar.Enabled := True;
         bbtnDesfazer.Enabled := True;
         btnImprimir.Enabled := False;
      End;
End;

Procedure TfrmConsBloqDesbloqJudiciais.bbtnFiltrarClick(Sender: TObject);
Var sSinal, sCriterioFiltro1, sCriterioFiltro2, sCriterioFiltro3, sCriterioFiltro4, sSQLText: String;
Begin
   If (cb1.Checked) Or (cb2.Checked) Or (cb3.Checked) Or (cb4.Checked) Then
      Begin
         sCriterioFiltro1 := '';
         sCriterioFiltro2 := '';
         sCriterioFiltro3 := '';
         sCriterioFiltro4 := '';

         // Filtrando somente pela Situação
         If (cb1.Checked) Then
            Begin
               If rdgSitBloq.itemindex = 0 Then // Bloqueados
                  sCriterioFiltro1 := '(SITBLOQDESBLOQ = 1 AND SITDESBLOQ = 0)';
               If rdgSitBloq.itemindex = 1 Then // Bloqueados/Desbloqueados
                  sCriterioFiltro1 := ' ((SITBLOQDESBLOQ = 1 AND SITDESBLOQ = 1) OR (SITBLOQDESBLOQ = 0 AND SITDESBLOQ = 0)) ';
               If rdgSitBloq.itemindex = 2 Then // Todos
                  sCriterioFiltro1 := '(SITBLOQDESBLOQ <> -1)';
            End;

         // Filtrando somente pelas datas
         If (cb2.Checked) Then
            sCriterioFiltro2 := 'DATALANCTO >= ' + quotedstr(dbDtLancDe.text) + ' AND DATALANCTO <= ' + quotedstr(dbDtLancAte.text);

         // Filtrando somente pelo banco
         If (cb3.Checked) Then
            If (dblkpBancoFiltro.Text <> '') Then
               sCriterioFiltro3 := 'CODPORTADOR = ' + quotedstr(qryBancoFiltro.fieldbyname('CODPORTADOR').asString)
            Else
               Begin
                  Application.MessageBox('Banco selecionado mas não informado. Verifique !', 'Atenção !', Mb_IconExclamation);
                  Exit;
               End;

         // Filtrando somente pelo valor
         If (cb4.Checked) Then
            If (edValorFiltro.Value <> 0) Then
               Begin
                  If rdbIgual.Checked Then sSinal := ' = ';
                  If rdbMenor.Checked Then sSinal := ' < ';
                  If rdbMaior.Checked Then sSinal := ' > ';

                  sCriterioFiltro4 := 'VALORLANCTO ' + sSinal + PrepararFloat(edValorFiltro.text);
               End
            Else
               Begin
                  Application.MessageBox('Valor selecionado mas não informado. Verifique !', 'Atenção !', Mb_IconExclamation);
                  Exit;
               End;

         // -------------------------------------------------------------------------------------------------------------------

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro1 + ' AND ' + sCriterioFiltro2 + ' AND ' + sCriterioFiltro3 + ' AND ' + sCriterioFiltro4; // todos

         // -------------------------------------------------------------------------------------------------------------------

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 = '') And (sCriterioFiltro4 = '') Then
            sSQLText := sCriterioFiltro1; // Somente Situação

         If (sCriterioFiltro1 = '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 = '') And (sCriterioFiltro4 = '') Then
            sSQLText := sCriterioFiltro2; // Somente Datas

         If (sCriterioFiltro1 = '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 = '') Then
            sSQLText := sCriterioFiltro3; // Somente Banco

         If (sCriterioFiltro1 = '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 = '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro4; // Somente Valor

         // -------------------------------------------------------------------------------------------------------------------

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 = '') Then
            sSQLText := sCriterioFiltro1 + ' AND ' + sCriterioFiltro2 + ' AND ' + sCriterioFiltro3; //  Situação + Datas + Banco

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 = '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro1 + ' AND ' + sCriterioFiltro2 + ' AND ' + sCriterioFiltro4; //  Situação + Datas + Valor

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro1 + ' AND ' + sCriterioFiltro3 + ' AND ' + sCriterioFiltro4; //  Situação + Banco + Valor

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 = '') And (sCriterioFiltro4 = '') Then
            sSQLText := sCriterioFiltro1 + ' AND ' + sCriterioFiltro2; // Situação + Datas

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 = '') Then
            sSQLText := sCriterioFiltro1 + ' AND ' + sCriterioFiltro3; // Situação + Banco

         If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 = '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro1 + ' AND ' + sCriterioFiltro4; // Situação + Valor

         // -------------------------------------------------------------------------------------------------------------------

         If (sCriterioFiltro1 = '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro2 + ' AND ' + sCriterioFiltro3 + ' AND ' + sCriterioFiltro4; // Data + Banco + Valor

         If (sCriterioFiltro1 = '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 = '') Then
            sSQLText := sCriterioFiltro2 + ' AND ' + sCriterioFiltro3; // Data + Banco

         If (sCriterioFiltro1 = '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 = '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro2 + ' AND ' + sCriterioFiltro4; // Data + Valor

         // -------------------------------------------------------------------------------------------------------------------

         If (sCriterioFiltro1 = '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 <> '') And (sCriterioFiltro4 <> '') Then
            sSQLText := sCriterioFiltro3 + ' AND ' + sCriterioFiltro4; // Banco + Valor

         // -------------------------------------------------------------------------------------------------------------------

         Screen.Cursor := crSQLWait;
         qryMovBloqJud.Close;
         qryMovBloqJud.SQL.Clear;
         qryMovBloqJud.SQL.ADD('SELECT M.*,  DECODE(M.SITBLOQDESBLOQ, 1, ''B'', ''D'') DSCSITBLOQDESBLOQ,  ');
         qryMovBloqJud.SQL.ADD('       DECODE(M.TIPOLANCTO, ''E'', M.VALORLANCTO, ''S'', M.VALORLANCTO * -1) VALOR  ');
         qryMovBloqJud.SQL.ADD('FROM MOVFINBLOQJUDICIAIS M                   ');
         qryMovBloqJud.SQL.ADD('WHERE ' + sSQLText);
         qryMovBloqJud.SQL.ADD('ORDER BY M.IDMOVFINBLOQJUDICIAISPAI, M.SITBLOQDESBLOQ DESC, M.DATALANCTO, M.CODPORTADOR    ');
         qryMovBloqJud.Open;
         Cursor := crDefault;
         If Not qryMovBloqJud.EOF Then
            Begin
               bbtnDesfazer.enabled := True;
               btnImprimir.enabled := True;
               stAviso.Visible := False;
            End;
      End;
End;

Procedure TfrmConsBloqDesbloqJudiciais.cb3Click(Sender: TObject);
Begin
   pnlBanco.Enabled := cb3.Checked;
   bbtnFiltrar.enabled := True;
End;

Procedure TfrmConsBloqDesbloqJudiciais.cb2Click(Sender: TObject);
Begin
   pnlDatas.Enabled := cb2.Checked;
   bbtnFiltrar.enabled := True;
End;

Procedure TfrmConsBloqDesbloqJudiciais.cb4Click(Sender: TObject);
Begin
   pnlValor.Enabled := cb4.Checked;
   rdbIgual.checked;
   bbtnFiltrar.enabled := True;
End;

Procedure TfrmConsBloqDesbloqJudiciais.cb1Click(Sender: TObject);
Begin
   pnlBloqs.Enabled := cb1.Checked;
   bbtnFiltrar.enabled := True;
End;

Procedure TfrmConsBloqDesbloqJudiciais.dbgDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Var
   bitmap: TBitmap;
   fixRect: TRect;
   bmpWidth: integer;
   imgIndex: integer;
Begin
   If Not qryMovBloqJud.isEmpty Then
      Begin
         fixRect := Rect;
         If Field.FieldName = 'SITIMG' Then
            Begin
               If qryMovBloqJud.fieldByname('SITBLOQDESBLOQ').AsInteger = 1 Then // Lançamento de Bloqueio
                  Begin
                     imgIndex := 5;
                     dbg.Canvas.Font.Color := clRed;
                  End
               Else
                  Begin
                     imgIndex := 4;
                     dbg.Canvas.Font.Color := clGreen;
                  End;

               bitmap := TBitmap.Create;
               Try
                  ImlPadrao.GetBitmap(imgIndex, bitmap);
                  bmpWidth := (Rect.Bottom - Rect.Top);
                  fixRect.Right := Rect.Left + bmpWidth;
                  dbg.Canvas.StretchDraw(fixRect, bitmap);
               Finally
                  bitmap.Free;
               End;

               fixRect := Rect;
               fixRect.Left := fixRect.Left + bmpWidth;
            End;

         dbg.DefaultDrawDataCell(fixRect, Field, State);
      End;
End;

Procedure TfrmConsBloqDesbloqJudiciais.bbtnDesfazerClick(Sender: TObject);
Begin
   cb1.Checked := False;
   cb2.Checked := False;
   cb3.Checked := False;
   cb4.Checked := False;
   pnlBanco.Enabled := cb1.Checked;
   pnlDatas.Enabled := cb2.Checked;
   pnlValor.Enabled := cb3.Checked;
   pnlBloqs.Enabled := cb4.Checked;
   rdgSitBloq.Itemindex := 0;
   dblkpBancoFiltro.KeyValue := 3; // Conta da FUNCEF
   dbDtLancDe.Date := strtodate('01/' + inttostr(ExtraiMes(date)) + '/' + inttostr(ExtraiAno(date)));
   dbDtLancAte.Date := TrazUltDiaData(dbDtLancDe.Date);
   rdbIgual.Checked := True;
   edValorFiltro.Text := '0,00';
   Cursor := crSQLWait;
   qryMovBloqJud.Close;
   Cursor := crDefault;
   bbtnFiltrar.Enabled := False;
   bbtnDesfazer.Enabled := False;
   btnImprimir.Enabled := False;
   stAviso.Visible := True;
End;

End.

