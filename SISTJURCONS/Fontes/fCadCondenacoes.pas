//******************************************************************************************
//Rotina..........: fCadCondenacoes
//N. Sol..........: 149855
//N. Kintana......: 1084001
//Data............: 18/01/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão do campo Data de Revogação
//******************************************************************************************
//Rotina..........: fCadCondenacoes
//N. Sol..........: 149856
//N. Kintana......: 1084141
//Data............: 18/01/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão da combobox do Objeto do Processo
//******************************************************************************************
//Rotina..........: fCadCondenacoes
//N. Sol..........: 149859
//N. Kintana......: 1084145
//Data............: 18/01/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão do campo Observação
//******************************************************************************************
//Rotina..........: fCadCondenacoes
//N. Sol..........: 127751
//N. Kintana......: 679506
//Data............: 15/09/2010
//Responsável.....: Paulo Nobre/Adilson Filho
//Descrição.......: Desenvolvimento do Cadastro das Condenações
//******************************************************************************************
Unit fCadCondenacoes;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo, CMProcura,
   ExtCtrls, wwdbedit, TabControlDetalhe, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg,
   Spin, TREdit, DBClient, uCMClientDataSet, uCmSqlParams, FCadastroMT,
   CheckLst, ColorCheckListBox;

Type
   TfrmCadCondenacoes = Class(TForm)
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      ImlPadrao: TImageList;
      dsCondenacao: TwwDataSource;
      qryAux: TQuery;
      qryCondenacao: TwwQuery;
      qryAux1: TQuery;
      pnlDadosPrincipal: TPanel;
      lblPdEmiss: TLabel;
      Label3: TLabel;
      dbDtImplementado: TCMDateTimePicker;
      dbrdgClassificacao: TDBRadioGroup;
      dbVlImplementado: TDBRealEdit;
      grdCondenacao: TwwDBGrid;
      dbrgTipoDesdobramento: TDBRadioGroup;
      dbRgFormaCor: TDBRadioGroup;
      dbcbInstancia: TDBComboBox;
      Label2: TLabel;
      dbDtSetenca: TCMDateTimePicker;
      dbrgcusteio: TDBRadioGroup;
      Label4: TLabel;
      Label6: TLabel;
      Label1: TLabel;
      chklstProcesso: TColorCheckListBox;
      chklstContribuicao: TColorCheckListBox;
      qryCondenacaoIDTPDESDOBRAMENTO: TFloatField;
      qryCondenacaoNUMPROCTRAB: TFloatField;
      qryCondenacaoCODTIPORECURSO: TFloatField;
      qryCondenacaoNUMSEQ: TFloatField;
      qryCondenacaoTPDESDOBRAMENTO: TFloatField;
      qryCondenacaoDATADEPOSITO: TDateTimeField;
      qryCondenacaoVLRCREDITADO: TFloatField;
      qryCondenacaoTPIMPUGCALCULO: TFloatField;
      qryCondenacaoIDCBANCARIA: TFloatField;
      qryCondenacaoCODPORTADOR: TFloatField;
      qryCondenacaoVLRCALCCONTADORIA: TFloatField;
      qryCondenacaoFORMACORRECAO: TFloatField;
      qryCondenacaoCLASSIFICACAO: TFloatField;
      qryCondenacaoINSTANCIA: TFloatField;
      qryCondenacaoDATASETENCA: TDateTimeField;
      qryCondenacaoFONTECUSTEIO: TFloatField;
      qryCondenacaoFORMACUSTEIO: TStringField;
      qryCondenacaoAPORTECONTRIB: TStringField;
      qryCondenacaoDSCSUBFASE: TStringField;
      qryCondenacaoDSCCLASSIFICACAO: TStringField;
      dbcObjetos: TwwDBLookupCombo;
      Label33: TLabel;
      qryLkpObjProcesso: TwwQuery;
      qryLkpObjProcessoCODTIPOOBJETO: TFloatField;
      qryLkpObjProcessoDESCRICAO: TStringField;
      qryCondenacaoCODTIPOOBJETO: TFloatField;
      Label27: TLabel;
      dbObs: TwwDBEdit;
      Label5: TLabel;
      dbDtRevogacao: TCMDateTimePicker;
      qryCondenacaoDATAREVOGACAO: TDateTimeField;
      qryCondenacaoOBSCONDENACAO: TStringField;
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure dbrgTipoDesdobramentoChange(Sender: TObject);
      Procedure qryCondenacaoAfterScroll(DataSet: TDataSet);
      Procedure qryCondenacaoCalcFields(DataSet: TDataSet);
      Procedure dbrdgClassificacaoClick(Sender: TObject);
   Private
      { Private declarations }
   Public
      Procedure ExibirTelaCondenacao(NumProcTrab: Double; CodTipoRecurso, NumSeq: Integer; ValorRec: Double);

      { Public declarations }
   End;
Var
   frmCadCondenacoes: TfrmCadCondenacoes;
   iNumProcTrab, iNumSeq, iCodTipoRecurso, iValorRec: double;
   cc, dd: Integer;
   aa, bb: String;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadCondenacoes.FormShow(Sender: TObject);
Begin
   If frmCadCondenacoes.WindowState = wsNormal Then
      Begin
         frmCadCondenacoes.Top := (Screen.Height - Height) Div 2;
         frmCadCondenacoes.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TfrmCadCondenacoes.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
End;

Procedure TfrmCadCondenacoes.ExibirTelaCondenacao(NumProcTrab: Double; CodTipoRecurso, NumSeq: Integer; ValorRec: Double);
Begin
   iNumProcTrab := NumProcTrab;
   iCodTipoRecurso := CodTipoRecurso;
   iNumSeq := NumSeq;
   iValorRec := ValorRec;

   For cc := 0 To chklstProcesso.Items.Count - 1 Do
      chklstProcesso.Checked[cc] := False;

   For dd := 0 To chklstContribuicao.Items.Count - 1 Do
      chklstContribuicao.Checked[dd] := False;

   qryCondenacao.Close;
   qryCondenacao.SQL.Clear;
   qryCondenacao.SQL.ADD('SELECT');
   qryCondenacao.SQL.ADD('ETP.IDTPDESDOBRAMENTO ,');
   qryCondenacao.SQL.ADD('ETP.NUMPROCTRAB       ,');
   qryCondenacao.SQL.ADD('ETP.CODTIPORECURSO    ,');
   qryCondenacao.SQL.ADD('ETP.NUMSEQ            ,');
   qryCondenacao.SQL.ADD('ETP.TPDESDOBRAMENTO   ,');
   qryCondenacao.SQL.ADD('ETP.DATADEPOSITO      ,');
   qryCondenacao.SQL.ADD('ETP.VLRCREDITADO      ,');
   qryCondenacao.SQL.ADD('ETP.TPIMPUGCALCULO    ,');
   qryCondenacao.SQL.ADD('ETP.IDCBANCARIA       ,');
   qryCondenacao.SQL.ADD('ETP.CODPORTADOR       ,');
   qryCondenacao.SQL.ADD('ETP.VLRCALCCONTADORIA ,');
   qryCondenacao.SQL.ADD('ETP.FORMACORRECAO     ,');
   qryCondenacao.SQL.ADD('ETP.CLASSIFICACAO     ,');
   qryCondenacao.SQL.ADD('ETP.INSTANCIA         ,');
   qryCondenacao.SQL.ADD('ETP.DATASETENCA       ,');
   qryCondenacao.SQL.ADD('ETP.FONTECUSTEIO      ,');
   qryCondenacao.SQL.ADD('ETP.FORMACUSTEIO      ,');
   qryCondenacao.SQL.ADD('ETP.APORTECONTRIB     ,');
   qryCondenacao.SQL.ADD('ETP.CODTIPOOBJETO     ,');
   qryCondenacao.SQL.ADD('ETP.DATAREVOGACAO     ,');
   qryCondenacao.SQL.ADD('ETP.OBSCONDENACAO      ');
   qryCOndenacao.SQL.ADD('FROM ETPDESDOBRAMENTO ETP   ');
   qryCondenacao.SQL.ADD('WHERE ETP.NUMPROCTRAB = ' + FloatToStr(iNumProcTrab));
   qryCondenacao.SQL.ADD('      AND ETP.CODTIPORECURSO = ' + FloatToStr(iCodTipoRecurso));
   qryCondenacao.SQL.ADD('      AND ETP.NUMSEQ = ' + FloatToStr(iNumSeq));
   qryCondenacao.SQL.ADD('ORDER BY ETP.TPDESDOBRAMENTO  ');
   qryCondenacao.Open;

   qryLkpObjProcesso.Close;
   qryLkpObjProcesso.ParamByName('numproctrab').asFloat := iNumProcTrab;
   qryLkpObjProcesso.Open;

   ShowModal;
End;

Procedure TfrmCadCondenacoes.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryCondenacao.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryCondenacao.Cancel;
               qryCondenacao.Close;
               qryAux.close;
               qryAux1.Close;
               qryLkpObjProcesso.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryCondenacao.Close;
         qryAux.close;
         qryAux1.Close;
         qryLkpObjProcesso.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadCondenacoes.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadCondenacoes.sbtnInserirClick(Sender: TObject);
Begin
   Try
      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      pnlDadosPrincipal.enabled := True;

      dbDtImplementado.Enabled := false;
      dbVlImplementado.Enabled := false;
      dbDtRevogacao.Enabled := false;
      dbRgFormaCor.Enabled := false;
      dbRgFormaCor.Enabled := false;
      dbrdgClassificacao.Enabled := false;
      dbcbInstancia.Enabled := false;
      dbDtSetenca.Enabled := false;
      dbrgcusteio.Enabled := false;
      chklstProcesso.Enabled := false;
      chklstContribuicao.Enabled := false;
      dbObs.Enabled := false;
      qryCondenacao.Insert;
      dbrgTipoDesdobramento.itemindex := 0;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadCondenacoes.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryCondenacao.IsEmpty Then
      Begin
         Try
            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDadosPrincipal.enabled := True;
            dbrgTipoDesdobramento.enabled := False;
            qryCondenacao.edit;
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

Procedure TfrmCadCondenacoes.bbtnCancelarClick(Sender: TObject);
Begin
   If qryCondenacao.state In [dsEdit, dsInsert] Then
      qryCondenacao.Cancel;

   sbtnInserir.Down := False;
   sbtnInserir.enabled := True;

   If sbtnInserir.Down = False Then
      Begin
         sbtnInserir.enabled := True;
         sbtnAlterar.Down := False;
         sbtnAlterar.enabled := True;
         sbtnApagar.Down := False;
         sbtnApagar.enabled := True;
      End;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   pnlDadosPrincipal.enabled := False;
   dbrgTipoDesdobramento.enabled := True;
End;

Procedure TfrmCadCondenacoes.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryCondenacao.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão dessa Sub-Fase ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  qryCondenacao.Delete;
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

Procedure TfrmCadCondenacoes.bbtnConfirmarClick(Sender: TObject);
Var a, b: String;
   c, d: Integer;
Begin
   Try
      If qryCondenacao.State In [dsInsert, dsEdit] Then
         Begin
            If dbrgTipoDesdobramento.ItemIndex = 0 Then // Liminar/Tutela
               Begin
                  If (dbDtImplementado.Date > Date) Then
                     Begin
                        ShowMessage('A Data do Depóstio não pode ser Maior que a Data de Hoje');
                        dbDtImplementado.setfocus;
                        Exit;
                     End;

                  If (dbDtImplementado.Text = '') Then
                     Begin
                        ShowMessage('Informe uma Data');
                        dbDtImplementado.setfocus;
                        Exit;
                     End;

                  If (dbVlImplementado.Text = '0,00') Then
                     Begin
                        ShowMessage('Informe um Valor Válido');
                        dbVlImplementado.setfocus;
                        Exit;
                     End;

                  If (dbRgFormaCor.ItemIndex = -1) Then
                     Begin
                        ShowMessage('Informe a Forma de Correção');
                        dbRgFormaCor.setfocus;
                        Exit;
                     End;
               End;

            If dbrgTipoDesdobramento.ItemIndex = 1 Then // Conhecimento
               Begin
                  If (dbDtSetenca.Date > Date) Then
                     Begin
                        ShowMessage('A Data da Setenção não pode ser Maior que a Data de Hoje');
                        dbDtSetenca.setfocus;
                        Exit;
                     End;

                  If (dbrdgClassificacao.ItemIndex = -1) Then
                     Begin
                        ShowMessage('Informe uma Classificação');
                        dbrdgClassificacao.setfocus;
                        Exit;
                     End;

//                  If (dbcObjetos.Text = '') Then
//                     Begin
//                        ShowMessage('Informe a Objeto');
//                        Exit;
//                     End;

                  If (dbDtSetenca.Text = '') Then
                     Begin
                        ShowMessage('Informe a Data de Setença');
                        dbDtSetenca.setfocus;
                        Exit;
                     End;

                  If (dbrgcusteio.ItemIndex = -1) Then
                     Begin
                        ShowMessage('Informe uma Fonte de Custeio');
                        dbDtSetenca.setfocus;
                        Exit;
                     End;

                  If (dbcbInstancia.Text = '') Then
                     Begin
                        ShowMessage('Informe a Instância');
                        dbcbInstancia.setfocus;
                        Exit;
                     End;
               End;

            If qryCondenacao.State = dsInsert Then
               Begin
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SeqEtpDesdobramento.NEXTVAL SEQORDEM FROM DUAL');
                  qryAux.Open;

                  qryCondenacao.fieldByname('IDTPDESDOBRAMENTO').asInteger := qryAux.fieldByname('SEQORDEM').asInteger;
                  qryCondenacao.FieldByName('NUMPROCTRAB').AsFloat := iNumProcTrab;
                  qryCondenacao.FieldByName('NUMSEQ').AsFloat := iNumSeq;
                  qryCondenacao.FieldByName('CODTIPORECURSO').AsFloat := iCodTipoRecurso;

                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := False;
               End;

            For c := 0 To chklstProcesso.Items.Count - 1 Do
               If chklstProcesso.Checked[c] Then
                  a := a + '1'
               Else
                  a := a + '0';

            For d := 0 To chklstContribuicao.Items.Count - 1 Do
               If chklstContribuicao.Checked[d] Then
                  b := b + '1'
               Else
                  b := b + '0';

            qryCondenacao.FieldByName('FORMACUSTEIO').AsString := a;
            qryCondenacao.FieldByName('APORTECONTRIB').AsString := b;

            If (dbrdgClassificacao.ItemIndex In [2, 3]) Then
               qryCondenacao.FieldByName('CODTIPOOBJETO').Clear;

            Screen.Cursor := crSQLWait;
            qryCondenacao.post;
            qryCondenacao.Close;
            qryCondenacao.Open;
            Screen.Cursor := crDefault;

            For cc := 0 To chklstProcesso.Items.Count - 1 Do
               chklstProcesso.Checked[cc] := False;

            For dd := 0 To chklstContribuicao.Items.Count - 1 Do
               chklstContribuicao.Checked[dd] := False;

            qryCondenacaoAfterScroll(qryCondenacao);

            sbtnAlterar.Down := False;
            sbtnAlterar.enabled := True;
            sbtnApagar.Down := False;
            sbtnApagar.enabled := True;
            sbtnInserir.Down := False;
            sbtnInserir.enabled := True;

            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            pnlDadosPrincipal.enabled := False;
            dbrgTipoDesdobramento.enabled := True;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadCondenacoes.dbrgTipoDesdobramentoChange(Sender: TObject);
Var c, d: integer;
Begin
   If dbrgTipoDesdobramento.ItemIndex = 0 Then // Liminar
      Begin
         dbDtImplementado.Enabled := true;
         dbVlImplementado.Enabled := true;
         dbDtRevogacao.Enabled := true;
         dbRgFormaCor.Enabled := true;
         dbObs.Enabled := True;

         dbrdgClassificacao.Enabled := false;
         dbcbInstancia.Enabled := false;
         dbDtSetenca.Enabled := false;
         dbrgcusteio.Enabled := false;
         chklstProcesso.Enabled := false;
         chklstContribuicao.Enabled := false;

         dbrdgClassificacao.ItemIndex := -1;
         dbcbInstancia.Text := '';
         dbDtSetenca.Clear;
         dbrgcusteio.ItemIndex := -1;

         For c := 0 To chklstProcesso.Items.Count - 1 Do
            chklstProcesso.Checked[c] := False;

         For d := 0 To chklstContribuicao.Items.Count - 1 Do
            chklstContribuicao.Checked[d] := False;
      End;

   If dbrgTipoDesdobramento.ItemIndex = 1 Then // Conhecimento
      Begin
         dbrdgClassificacao.Enabled := True;
         dbcbInstancia.Enabled := true;
         dbDtSetenca.Enabled := true;
         dbrgcusteio.Enabled := true;
         chklstProcesso.Enabled := true;
         chklstContribuicao.Enabled := true;
         dbObs.Enabled := True;

         dbDtImplementado.Enabled := false;
         dbVlImplementado.Enabled := false;
         dbDtRevogacao.Enabled := false;
         dbRgFormaCor.Enabled := false;

         dbDtImplementado.Clear;
         dbVlImplementado.Clear;
         dbRgFormaCor.ItemIndex := -1;
      End;
End;

Procedure TfrmCadCondenacoes.qryCondenacaoAfterScroll(DataSet: TDataSet);
Begin
   // Atribuindo os flegados
   For cc := 0 To chklstProcesso.Items.Count - 1 Do
      Begin
         chklstProcesso.Checked[cc] := False;
         If Copy(qryCondenacao.FieldByName('FORMACUSTEIO').AsString, cc + 1, 1) = '1' Then
            chklstProcesso.Checked[cc] := true;
      End;
   For dd := 0 To chklstContribuicao.Items.Count - 1 Do
      Begin
         chklstContribuicao.Checked[dd] := False;
         If Copy(qryCondenacao.FieldByName('APORTECONTRIB').AsString, dd + 1, 1) = '1' Then
            chklstContribuicao.Checked[dd] := true;
      End;
End;

Procedure TfrmCadCondenacoes.qryCondenacaoCalcFields(DataSet: TDataSet);
Begin
   If qryCondenacao.fieldbyname('TPDESDOBRAMENTO').asInteger = 1 Then
      qryCondenacao.fieldbyname('DSCSUBFASE').asString := 'Liminar/Tutela'
   Else If qryCondenacao.fieldbyname('TPDESDOBRAMENTO').asInteger = 2 Then
      qryCondenacao.fieldbyname('DSCSUBFASE').asString := 'Conhecimento';

   If qryCondenacao.fieldbyname('CLASSIFICACAO').asInteger = 1 Then
      qryCondenacao.fieldbyname('DSCCLASSIFICACAO').asString := 'Solidária'
   Else If qryCondenacao.fieldbyname('CLASSIFICACAO').asInteger = 2 Then
      qryCondenacao.fieldbyname('DSCCLASSIFICACAO').asString := 'Subsidiária'
   Else If qryCondenacao.fieldbyname('CLASSIFICACAO').asInteger = 3 Then
      qryCondenacao.fieldbyname('DSCCLASSIFICACAO').asString := 'Exclusão da FUNCEF';
End;

Procedure TfrmCadCondenacoes.dbrdgClassificacaoClick(Sender: TObject);
Begin
{   If dbrgTipoDesdobramento.ItemIndex = 1 Then // Conhecimento
      Begin
         If dbrdgClassificacao.ItemIndex In [0, 1] Then
            Begin
               dbcObjetos.Enabled := true;
               dbcObjetos.SetFocus;
            End
         Else
            Begin
               dbcObjetos.Enabled := False;
               dbcObjetos.Clear;
            End;
      End;}
End;

End.

