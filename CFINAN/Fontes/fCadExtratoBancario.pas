//******************************************************************************************
//N. Sol..........: 31714/13162
//N. Kintana......: 1887925
//Data............: 17/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: A pedido de Gestora, foi liberado o controle de cadastro Manual se o mov foi Importado
//******************************************************************************************
//N. Sol..........: 31714/12942
//N. Kintana......: 1879169
//Data............: 07/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Todos os cheques anteriores e do dia >Bloqueios Judiciais
//******************************************************************************************
//N. Sol..........: 31714/12862           
//N. Kintana......: 1873038
//Data............: 29/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterando o conceito de lançar "Bloqueio judicial" para qualquer "Bloqueio"
//******************************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 15/06/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro do Extrato Bancário
//******************************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 15/06/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro do Extrato Bancário
//******************************************************************************************

//  Conteúdo do campo: MOVEXTRATOBANCARIO.TIPOLINHA

//  N  - Normal

//  Conteúdo do campo: MOVEXTRATOBANCARIO.TIPOINCLUSAOLANCTO
 
// M - Manual   / I - Importado
//

Unit fCadExtratoBancario;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, TB97Ctls, TB97, TB97Tlbr, MAHlpBtn, Db, DBTables, Wwquery,
   MontaSelect, ImgList, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
   ExtCtrls, DBCtrls, CMProcuraMask, ComCtrls, Mask, wwdbedit, Wwdatsrc,
   TREdit, wwdbdatetimepicker;

Type
   TfrmCadExtratoBancario = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      ImlPadrao: TImageList;
      MontaSelectExtrato: TMontaSelect;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      qryAux: TQuery;
      qryMovExtratoBancario: TwwQuery;
      dsMovExtratoBancario: TDataSource;
      updMovExtratoBancario: TUpdateSQL;
      qryMovExtratoBancarioIDMOVEXTRATOBANCARIO: TFloatField;
      qryMovExtratoBancarioDATAEXTRATO: TDateTimeField;
      qryMovExtratoBancarioTIPOLANCTO: TStringField;
      qryMovExtratoBancarioVALORLANCTO: TFloatField;
      qryMovExtratoBancarioNUMDOCUMENTO: TStringField;
      qryMovExtratoBancarioHISTORICO: TStringField;
      qryMovExtratoBancarioCONCILIADO: TStringField;
      qryMovExtratoBancarioTRGDTINCLUSAO: TDateTimeField;
      qryMovExtratoBancarioTRGUSERINCLUSAO: TStringField;
      qryMovExtratoBancarioSITCONCILIACAO: TStringField;
      qryMovExtratoBancarioTIPOINCLUSAOLANCTO: TStringField;
      qryMovExtratoBancarioCODPORTADOR: TFloatField;
      Panel7: TPanel;
      Label5: TLabel;
      Label2: TLabel;
      qrySaldoDia: TwwQuery;
      dsSaldoDia: TDataSource;
      qrySaldoDiaSALDODIA: TFloatField;
      qryMovExtratoBancarioTIPOLINHA: TStringField;
      Edit1: TEdit;
      Edit2: TEdit;
      dbg: TwwDBGrid;
      pnlDadosPrincipal: TPanel;
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      dbValor: TDBRealEdit;
      dbrgTipoLancto: TDBRadioGroup;
      dbNumDocto: TwwDBEdit;
      dbHist: TwwDBEdit;
      StaticText1: TStaticText;
      wwDBEdit1: TwwDBEdit;
      qryAux1: TQuery;
      stTipoIncLan: TStaticText;
      qryMovExtratoBancarioSITBLOQUEIOLANC: TFloatField;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure dbgCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbgDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure dbrgTipoLanctoChange(Sender: TObject);
   Private
      { Private declarations }
   Public
      { Public declarations }
      sDataExtrato: String;
      iNumBanco: Integer;
      sBancoConta: String;
      iCodPortador: Integer;
      sTipoInclusaoLancto: String;
   End;

Var
   frmCadExtratoBancario: TfrmCadExtratoBancario;

Implementation

Uses DBaseDados, UMensErro, uCtrlPadroes;
{$R *.DFM}

Procedure TfrmCadExtratoBancario.FormShow(Sender: TObject);
Begin
   If frmCadExtratoBancario.WindowState = wsNormal Then
      Begin
         frmCadExtratoBancario.Top := (Screen.Height - Height) Div 2;
         frmCadExtratoBancario.Left := (Screen.Width - Width) Div 2;
      End;

   pnlDadosPrincipal.enabled := False;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   sbtnInserir.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnApagar.enabled := True;

// Sol 31714/13162  KTN 1887925 - Paulo Nobre
   If sTipoInclusaoLancto = 'I' Then
      Begin
         stTipoIncLan.Caption := 'Mov.Importado';
//         sbtnInserir.enabled := False;
//         sbtnAlterar.enabled := False;
//         sbtnApagar.enabled := False;
      End;

   Edit1.Text := sBancoConta;
   Edit2.Text := sDataExtrato;

   Screen.Cursor := crSQLWait;
   qryMovExtratoBancario.Close;
   qryMovExtratoBancario.Parambyname('pDataExtrato').asString := sDataExtrato;
   qryMovExtratoBancario.Parambyname('pCodPortador').asInteger := iCodPortador;
   qryMovExtratoBancario.Open;

   qrySaldoDia.Close;
   qrySaldoDia.Parambyname('pDataExtrato').asString := sDataExtrato;
   qrySaldoDia.Parambyname('pCodPortador').asInteger := iCodPortador;
   qrySaldoDia.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadExtratoBancario.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadExtratoBancario.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryMovExtratoBancario.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               Screen.Cursor := crSQLWait;
               qryMovExtratoBancario.CancelUpdates;
               qryMovExtratoBancario.Close;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qrySaldoDia.Close;
               Screen.Cursor := crDefault;

               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryMovExtratoBancario.Close;
         qrySaldoDia.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadExtratoBancario.sbtnAlterarClick(Sender: TObject);
Begin
   sbtnAlterar.Down := True;
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If (Not qryMovExtratoBancario.IsEmpty) Then
         Begin
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDadosPrincipal.enabled := True;
            dbg.enabled := False;
            qryMovExtratoBancario.Edit;
            dbValor.setfocus;
         End
      Else
         Begin
            Application.MessageBox('Sem Movimento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
            sbtnAlterar.Down := False;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadExtratoBancario.sbtnInserirClick(Sender: TObject);
Begin
   sbtnInserir.Down := True;
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;
      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      pnlDadosPrincipal.enabled := True;
      dbg.enabled := False;

      qryMovExtratoBancario.Insert;
      qryMovExtratoBancario.fieldByname('TIPOLANCTO').AsString := 'D'; // Debito

      dbValor.setfocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadExtratoBancario.bbtnCancelarClick(Sender: TObject);
Begin
   If qryMovExtratoBancario.state In [dsEdit, dsInsert] Then
      Begin
         qryMovExtratoBancario.CancelUpdates;

         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;
      End;

   sbtnInserir.Down := False;
   sbtnInserir.enabled := True;
   sbtnAlterar.Down := False;
   sbtnAlterar.enabled := True;
   sbtnApagar.Down := False;
   sbtnApagar.enabled := True;

// Sol 31714/13162  KTN 1887925 - Paulo Nobre   
{   If sTipoInclusaoLancto = 'I' Then
      Begin
         sbtnInserir.enabled := False;
         sbtnAlterar.enabled := False;
         sbtnApagar.enabled := False;
      End;   }

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   pnlDadosPrincipal.enabled := False;
   dbg.enabled := True;
End;

Procedure TfrmCadExtratoBancario.sbtnApagarClick(Sender: TObject);
Begin
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If (Not qryMovExtratoBancario.IsEmpty) Then
         Begin
            If MsgDlg('Confirma Exclusão ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  qryMovExtratoBancario.Delete;
                  qryMovExtratoBancario.ApplyUpdates;
                  dtmBaseDados.dbBaseDados.Commit;

                  qryMovExtratoBancario.Close;
                  qryMovExtratoBancario.Parambyname('pDataExtrato').AsString := sDataExtrato;
                  qryMovExtratoBancario.Parambyname('pCodPortador').asInteger := iCodPortador;
                  qryMovExtratoBancario.Open;

                  qrySaldoDia.Close;
                  qrySaldoDia.Parambyname('pDataExtrato').AsString := sDataExtrato;
                  qrySaldoDia.Parambyname('pCodPortador').asInteger := iCodPortador;
                  qrySaldoDia.Open;
                  Screen.Cursor := crDefault;

                  sbtnInserir.Enabled := True;
                  sbtnAlterar.Enabled := True;
                  sbtnApagar.Enabled := True;
               End;
         End
      Else
         Application.MessageBox('Sem Movimento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);

      sbtnApagar.Down := False;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadExtratoBancario.bbtnConfirmarClick(Sender: TObject);
Begin
   If dbValor.Value = 0 Then
      Begin
         MsgDlg('Valor tem que ser Informado !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   If dbNumDocto.Text = '' Then
      Begin
         MsgDlg('Nº do Documento tem que ser Informado !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   If dbHist.Text = '' Then
      Begin
         MsgDlg('Histórico tem que ser Informado !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryMovExtratoBancario.State In [dsInsert, dsEdit] Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If qryMovExtratoBancario.State = dsInsert Then
                     Begin
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQMOVEXTRATOBANCARIO.NEXTVAL SEQ FROM DUAL');
                        qryAux.Open;

                        qryMovExtratoBancario.fieldByname('IDMOVEXTRATOBANCARIO').asInteger := qryAux.fieldByname('SEQ').asInteger;
                        qryMovExtratoBancario.fieldByname('DATAEXTRATO').AsString := sDataExtrato;
                        qryMovExtratoBancario.fieldByname('CODPORTADOR').asInteger := iCodPortador;
                        qryMovExtratoBancario.fieldByname('SITCONCILIACAO').AsString := 'A'; // Aberto
                        qryMovExtratoBancario.fieldByname('CONCILIADO').AsString := 'N'; // Não Conciliado
                        qryMovExtratoBancario.fieldByname('TIPOLINHA').AsString := 'N'; // Normal
                        qryMovExtratoBancario.fieldByname('SITBLOQUEIOLANC').AsInteger := 0; // Desbloqueado
                        qryMovExtratoBancario.fieldByname('TIPOINCLUSAOLANCTO').AsString := sTipoInclusaoLancto;
                     End;

                  If dbrgTipoLancto.ItemIndex = 0 Then // DB
                     Begin
                        If qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat > 0 Then // Então DB
                           qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat := (qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat * -1);
                     End
                  Else // CR
                     Begin
                        If qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat < 0 Then // Então CR
                           qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat := (qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat * -1);
                     End;

                  qryMovExtratoBancario.ApplyUpdates;
                  dtmBaseDados.dbBaseDados.Commit;

                  qryMovExtratoBancario.Close;
                  qryMovExtratoBancario.Parambyname('pDataExtrato').AsString := sDataExtrato;
                  qryMovExtratoBancario.Parambyname('pCodPortador').asInteger := iCodPortador;
                  qryMovExtratoBancario.Open;

                  qrySaldoDia.Close;
                  qrySaldoDia.Parambyname('pDataExtrato').AsString := sDataExtrato;
                  qrySaldoDia.Parambyname('pCodPortador').asInteger := iCodPortador;
                  qrySaldoDia.Open;
                  Screen.Cursor := crDefault;

                  pnlDadosPrincipal.enabled := False;
                  dbg.enabled := True;
               End;

            bbtnCancelarClick(Self);
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadExtratoBancario.dbgCalcCellColors(Sender: TObject;
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

Procedure TfrmCadExtratoBancario.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Procedure TfrmCadExtratoBancario.dbgDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not qryMovExtratoBancario.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               If qryMovExtratoBancario.FieldByName('TIPOLANCTO').asString = 'D' Then // Débito
                  dbg.Canvas.Font.Color := clRed;

               dbg.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmCadExtratoBancario.dbrgTipoLanctoChange(Sender: TObject);
Begin
   If qryMovExtratoBancario.State In [dsInsert, dsEdit] Then
      Begin
         If dbrgTipoLancto.ItemIndex = 0 Then // DB
            Begin
               If qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat > 0 Then // Então DB
                  qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat := (qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat * -1);
            End
         Else // CR
            Begin
               If qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat < 0 Then // Então CR
                  qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat := (qryMovExtratoBancario.fieldByname('VALORLANCTO').AsFloat * -1);
            End;
      End;
End;

End.

