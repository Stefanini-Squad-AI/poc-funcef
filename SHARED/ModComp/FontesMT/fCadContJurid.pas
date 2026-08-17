// ***********************************************************************************************
//Rotina..........: fCadContJurid
//N. Sol..........: 49750
//N. Kintana......: 523171
//Data............: 03/10/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Funcionalidade toda refeita para atender melhor a parametrização contábil
//************************************************************************************************
Unit fCadContJurid;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, TB97Ctls, TB97, TB97Tlbr, MAHlpBtn, Db, DBTables, Wwquery,
   MontaSelect, ImgList, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
   ExtCtrls, DBCtrls, CMProcuraMask, ComCtrls, TabControlDetalhe, Mask,
   DBaseDados, wwdbedit, uCtrlListTerceirosRH, FCadastroMestreDetMT;

Type
   TfrmCadContJurid = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      ImlPadrao: TImageList;
      MontaSelect: TMontaSelect;
      qryParametroContabil: TwwQuery;
      dsParametroContabil: TDataSource;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      sep1: TToolbarSep97;
      sep3: TToolbarSep97;
      bbtnSair: TBitBtn;
      bbtnAjuda: TmaHelpBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      qryParametroContabilIDCONTABJURID: TFloatField;
      qryParametroContabilCONTADEBITO: TStringField;
      qryParametroContabilIDPLANO1: TFloatField;
      qryParametroContabilCONTACREDITO: TStringField;
      qryParametroContabilIDPLANO2: TFloatField;
      qryParametroContabilINDMATERIA: TFloatField;
      qryParametroContabilINDPRINCIPAL: TFloatField;
      qryParametroContabilIDTIPOPROC_DE: TFloatField;
      qryParametroContabilIDTIPOPROC_PARA: TFloatField;
      qryParametroContabilFLGPARTE_DE: TFloatField;
      qryParametroContabilFLGPARTE_PARA: TFloatField;
      qryParametroContabilINDOPERACAO: TFloatField;
      qryParametroContabilIDEMPRESA: TFloatField;
      qryParametroContabilCODCENTROCUSTO: TStringField;
      qryParametroContabilFLGUSAPADRAO: TFloatField;
      qryParametroContabilTIPCODIGO: TStringField;
      qryParametroContabilNOMETIPOPROC: TStringField;
      qryParametroContabilTIPDESCRICAO: TStringField;
      qryParametroContabilTIPO: TStringField;
      qryLkpPrograma: TwwQuery;
      qryLkpSub_Programa: TwwQuery;
      qryLkpCentroCusto: TwwQuery;
      qryLkpProgramaIDTIPOPROC: TFloatField;
      qryLkpProgramaNOMETIPOPROC: TStringField;
      qryLkpProgramaPROCFIXO: TFloatField;
      qryLkpProgramaTRGDTINCLUSAO: TDateTimeField;
      qryLkpProgramaTRGUSERINCLUSAO: TStringField;
      qryLkpProgramaFLGEXIGECCUSTO: TFloatField;
      qryLkpSub_ProgramaTIPCODIGO: TStringField;
      qryLkpSub_ProgramaTIPDESCRICAO: TStringField;
      tbcDetalhe: TTabControlDetalhe;
      qryLkpCentroCustoNOME: TStringField;
      qryLkpCentroCustoCODCENTROCUSTO: TStringField;
      dbgrdDet: TwwDBGrid;
      pnlDadosPrincipal: TPanel;
      CMProcuraMaskContabilCredito: TCMProcuraMaskContabil;
      CMProcuraMaskContabilDebito: TCMProcuraMaskContabil;
      dbrgIndPrincipal: TDBRadioGroup;
      dbrgMateria: TDBRadioGroup;
      gbxPrograma: TGroupBox;
      Label3: TLabel;
      dblckTipProc: TwwDBLookupCombo;
      wwDBLookupCombo1: TwwDBLookupCombo;
      dbrgUsaPadrao: TDBRadioGroup;
      gbxCentroCusto: TGroupBox;
      dblckCCusto: TwwDBLookupCombo;
      dbrgTipoOper: TDBRadioGroup;
      gbxSubPrograma: TGroupBox;
      Label5: TLabel;
      wwDBLookupCombo3: TwwDBLookupCombo;
      dblckTipoOperacao: TwwDBLookupCombo;
      UpdParametroContabil: TUpdateSQL;
      qryAux: TQuery;
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dblckTipProcCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
   Private
      { Private declarations }
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
   Public
      { Public declarations }
   End;

Var
   frmCadContJurid: TfrmCadContJurid;
   iNumPlano: integer;
   sMascaraPlano: String;
   aTipoData: Array[0..2] Of String = ('Operação', 'Vencimento', 'Reversão');

Implementation

Uses UMensErro, uCtrlPadroes;
{$R *.DFM}

Procedure TfrmCadContJurid.FormCreate(Sender: TObject);
Begin
   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
   CtrlListTerceirosRH.InitializeAs(Padroes);

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
   pnlDadosPrincipal.enabled := False;

   sbtnInserir.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnApagar.enabled := True;
   sbtnProcurar.enabled := False;

   iNumPlano := CtrlListTerceirosRH.GetPlano(1);
   sMascaraPlano := CtrlListTerceirosRH.GetMascaraPlano(iNumPlano);

   CMProcuraMaskContabilDebito.Mascara := sMascaraPlano;
   CMProcuraMaskContabilCredito.Mascara := sMascaraPlano;
   CMProcuraMaskContabilDebito.Plano := iNumPlano;
   CMProcuraMaskContabilCredito.Plano := iNumPlano;
End;

Procedure TfrmCadContJurid.FormShow(Sender: TObject);
Begin
   If frmCadContJurid.WindowState = wsNormal Then
      Begin
         frmCadContJurid.Top := (Screen.Height - Height) Div 2;
         frmCadContJurid.Left := (Screen.Width - Width) Div 2;
      End;

   Screen.Cursor := crSQLWait;
   qryParametroContabil.Close;
   qryParametroContabil.Open;
   qryLkpPrograma.Close;
   qryLkpPrograma.Open;
   qryLkpSub_Programa.Close;
   qryLkpSub_Programa.Open;
   qryLkpCentroCusto.Close;
   qryLkpCentroCusto.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadContJurid.sbtnProcurarClick(Sender: TObject);
Begin
   {   sbtnProcurar.down := False;
      MontaSelect.Caption := 'Selecione um Objeto';
      MontaSelect.Executar;
      If (MontaSelect.RetornouValor) Then
         Begin
            Screen.Cursor := crSQLWait;
            qryObjeto.Close;
            qryObjeto.SQL.clear;
            qryObjeto.SQL.Add('SELECT * ');
            qryObjeto.SQL.Add('FROM tipoobjproctrab');
            qryObjeto.SQL.Add('WHERE CODTIPOOBJETO = ' + quotedstr(MontaSelect.ValoresChave[0]));
            qryObjeto.Open;

            qryParametroContabil.Close;
            qryParametroContabil.Open;
         End;}
End;

Procedure TfrmCadContJurid.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadContJurid.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryParametroContabil.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               Screen.Cursor := crSQLWait;
               qryParametroContabil.CancelUpdates;
               qryParametroContabil.Close;
               qryLkpPrograma.Close;
               qryLkpSub_Programa.Close;
               qryLkpCentroCusto.Close;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               Screen.Cursor := crDefault;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryParametroContabil.Close;
         qryLkpPrograma.Close;
         qryLkpSub_Programa.Close;
         qryLkpCentroCusto.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadContJurid.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryParametroContabil.IsEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDadosPrincipal.enabled := True;
            dbgrdDet.enabled := False;

            qryParametroContabil.edit;
            dblckTipProc.Setfocus;
         Except
            bbtnCancelarClick(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnAlterar.down := False;
      End;
End;

Procedure TfrmCadContJurid.sbtnInserirClick(Sender: TObject);
Begin
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;
      sbtnProcurar.enabled := False;
      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;
      pnlDadosPrincipal.enabled := True;
      dbgrdDet.enabled := False;

      qryParametroContabil.Open;
      qryParametroContabil.Insert;

      dbrgUsaPadrao.itemindex := 0;
      dbrgTipoOper.itemindex := 0;
      dbrgMateria.itemindex := 0;
      dblckTipProc.Setfocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadContJurid.bbtnCancelarClick(Sender: TObject);
Begin
   If qryParametroContabil.state In [dsEdit, dsInsert] Then
      Begin
         qryParametroContabil.CancelUpdates;

         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;
      End;

   sbtnInserir.Down := False;
   sbtnInserir.enabled := True;

   If sbtnInserir.Down = False Then
      Begin
         sbtnAlterar.Down := False;
         sbtnAlterar.enabled := True;
         sbtnApagar.Down := False;
         sbtnApagar.enabled := True;
         sbtnProcurar.Down := False;
         sbtnProcurar.enabled := True;
      End;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   pnlDadosPrincipal.enabled := False;
   dbgrdDet.enabled := True;
End;

Procedure TfrmCadContJurid.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryParametroContabil.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryParametroContabil.Delete;
                  qryParametroContabil.ApplyUpdates;

                  dtmBaseDados.dbBaseDados.Commit;

                  qryParametroContabil.Close;
                  qryParametroContabil.Open;
                  Screen.Cursor := crDefault;

                  sbtnInserir.Enabled := True;
                  sbtnAlterar.Enabled := True;
                  sbtnApagar.Enabled := True;
               End;
            sbtnApagar.Down := False;
         Except
            bbtnCancelarClick(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnApagar.Down := False;
      End;
End;

Procedure TfrmCadContJurid.bbtnConfirmarClick(Sender: TObject);
Var CampoErro: TStringList;
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryParametroContabil.State In [dsInsert, dsEdit] Then
               Begin

                  Screen.Cursor := crSQLWait;
                  If qryParametroContabil.State = dsInsert Then
                     Begin
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQCONTABJURID.NEXTVAL SEQPARAM FROM DUAL');
                        qryAux.Open;

                        qryParametroContabil.fieldByname('IDCONTABJURID').asInteger := qryAux.fieldByname('SEQPARAM').asInteger;
                        qryParametroContabil.fieldByname('IDPLANO1').asInteger := iNumPlano;
                        qryParametroContabil.fieldByname('IDPLANO2').asInteger := iNumPlano;
                     End;

                  qryParametroContabil.ApplyUpdates;
                  dtmBaseDados.dbBaseDados.Commit;

                  qryParametroContabil.close;
                  qryParametroContabil.open;
                  Screen.Cursor := crDefault;

                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := True;
                  sbtnAlterar.Down := False;
                  sbtnAlterar.enabled := True;
                  sbtnApagar.Down := False;
                  sbtnApagar.enabled := True;
                  sbtnProcurar.Down := False;
                  sbtnProcurar.enabled := True;

                  bbtnConfirmar.enabled := False;
                  bbtnCancelar.enabled := False;

                  pnlDadosPrincipal.enabled := False;
                  dbgrdDet.enabled := True;

                  FreeandNil(CampoErro);
               End;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadContJurid.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   frmCadContJurid := Nil;
End;

Procedure TfrmCadContJurid.dbgrdDetCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
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

Procedure TfrmCadContJurid.dblckTipProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   qryLkpSub_Programa.SQL.Clear;
   qryLkpSub_Programa.SQL.add('SELECT T.TIPCODIGO, T.TIPDESCRICAO           ');
   qryLkpSub_Programa.SQL.add('FROM TIPOPER T, JUR_PROGRAMAXSUBPROGRAMA J   ');
   qryLkpSub_Programa.SQL.add('WHERE T.TIPCODIGO = J.TIPCODIGO AND          ');
   qryLkpSub_Programa.SQL.add('      J.IDTIPOPROC = ' + quotedstr(qryLkpPrograma.fieldByname('IDTIPOPROC').asString));
   qryLkpSub_Programa.SQL.add('ORDER BY T.TIPCODIGO                         ');
   qryLkpSub_Programa.Open;
End;

End.

