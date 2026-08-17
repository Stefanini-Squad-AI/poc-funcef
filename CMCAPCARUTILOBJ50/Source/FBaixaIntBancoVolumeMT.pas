//***************************************************************************************
//Rotina                : SbtnAbrirArquivoRetClick, trlBaixaIntBanco.MontaGrid, SbtnAbrirArquivoRetClick, bbtnConfirmarClick
//N. Sol..........      : 214738_15892
//N. Kintana......      : 2057238
//Data da Alteração:    : 14/03/2014
//Alteração Form:       : FBaixaIntBancoMT
//Responsável:          : Paulo  Nobre    
//Descrição.......      : Inclusão do Parametro p/ indicar se a barra de progresso será apresentada ou não
//                        Alteração na bbtnConfirmarClick p/ incluir o valor zero na datalancamento
//******************************************************************************************
//Rotina..........: bbtnConfirmarClick
//N. Sol..........: 187427
//N. Kintana......: 1793755
//Data............: 07/01/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de Rotina para atualizar os lançamentos com as ocorrências
{--------------------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 151965
Nº KINTANA..: 1124894
Data........: 07/12/2011
Responsável.: Arnaldo Vicente Scarin
Descrição...: Inclusão de um flag para indicar a baixa do arquivo de retorno SIGCB
---------------------------------------------------------------------------------------------------}
{
Rotina............: bbtnConfirmarClick
N. Sol.............: 112617
N. Kintana......: 521708
Data...............: 03/04/2009
Responsável...: Ricardo Alves
Descrição........: Limitada entrada de valor do campo NUMCHQBORDERO para 15 caracteres.
}

Unit
   FBaixaIntBancoVolumeMT;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
   wwdblook, Usistema, uAutorizacao,
   uMensErro, TB97Tlbr, Wwdatsrc, IvDictio,
   IvMulti, IvEMulti, CMDBLookupCombo, JclStrings, JclShell, uCMSqlParams,
   DBClient, uCMClientDataSet, uCtrlParamIntegra, uCtrlBaixaIntBanco,
   CmParamReport, uCmFileUtils, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, uctrlDocumento,
   fProgressoDuplo, fProgresso,
   uCtrlFinanc, uCtrlPadroes, DBCtrls;

Type
   TFrmBaixaIntBancoVolumeMT = Class(TfrmOkCancelar)
      DlgAbrir: TOpenDialog;
      Panel1: TPanel;
      LblPgto: TLabel;
      EdtArquivoRetorno: TEdit;
      LblPath: TLabel;
      SbtnAbrirArquivoRet: TSpeedButton;
      CmbModeloCnab: TCMDBLookupCombo;
      CdsDocumentos: TCMClientDataSet;
      CdsPortaDorForma: TCMClientDataSet;
      CdsParamCAP: TCMClientDataSet;
      CdsOcorrencia: TCMClientDataSet;
      CdsAux: TCMClientDataSet;
      CdsUnid: TCMClientDataSet;
      CdsModelosCnab: TCMClientDataSet;
      CdsAlt: TCMClientDataSet;
      CdsAuxCodDoc: TCMClientDataSet;
      dtpDataDisp: TCMDateTimePicker;
      lblDataDisp: TLabel;
      sqlParamFinanc: TCMSqlParams;
      cdsParamFinanc: TCMClientDataSet;
      valCommit: TwwDBSpinEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      edtTotDocs: TEdit;
      CMSqlParams1: TCMSqlParams;
      grpbLogFinanc: TGroupBox;
      edtArquivoLog: TEdit;
      spbtnArqLog: TSpeedButton;
      bitbtnVisualiza: TBitBtn;
      dlgArqLog: TOpenDialog;
      Panel2: TPanel;
      MemoOperacao: TMemo;
      Procedure SbtnAbrirArquivoRetClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormActivate(Sender: TObject);
      Procedure CdsDocumentosAfterOpen(DataSet: TDataSet);
      Procedure spbtnArqLogClick(Sender: TObject);
      Procedure bitbtnVisualizaClick(Sender: TObject);
      Procedure CdsDocumentosAfterInsert(DataSet: TDataSet);

   Private
      { Private declarations }
      CtrlBaixaIntBanco: TCtrlBaixaIntBanco;
      sNumChequeBordero: String;
      sListaRetorno: TStrings;
      sListaArquivo: TStrings;
      Procedure mostraProcessamento(vParam: Array Of Variant);
      Procedure GravaLogFinanceiro(Const sLog: String);

   Public
      { Public declarations }
   End;

Var
   FrmBaixaIntBancoVolumeMT: TFrmBaixaIntBancoVolumeMT;

Implementation

Uses
   DBaseDados, uModulo, uFuncaoGeral, fAguarde, uDataBase;

{$R *.DFM}

//************************************************

Procedure TFrmBaixaIntBancoVolumeMT.FormCreate(Sender: TObject);
Begin
   Inherited;

   self.DoubleBuffered := true;
   CtrlBaixaIntBanco := Nil; //andre tavares - 07/12/2006

   If ParamIntegra.Recpag = 'P' Then Begin
         // Daniel Simões - 25/01/2006 - Início------------------------------------------
         HelpContext := 30033; //30046;
         bbtnAjuda.HelpContext := 30033; //30046;
         Caption := 'Pagamento Eletrônico (MT)';
         LblPgto.Caption := 'Tipo de Arquivo IntBanco';
      End
   Else
      Begin
         HelpContext := 40052;
         bbtnAjuda.HelpContext := 40052;
      End;

   sqlParamFinanc.Open;
   dtpDataDisp.Text := '';
   dtpDataDisp.Visible := (cdsParamFinanc.FieldByName('FLGINTDISPFIN').asString = 'Y');
   lblDataDisp.Visible := dtpDataDisp.Visible;

   CtrlBaixaIntBanco := TCtrlBaixaIntBanco.Create;

   CtrlBaixaIntBanco.IdEmpresa := Sistema.IdEmpresa;
   CtrlBaixaIntBanco.IdModulo := Sistema.IdModulo;
   CtrlBaixaIntBanco.IdUsuario := Sistema.IdUsuario;
   CtrlBaixaIntBanco.IdEspAcesso := Sistema.IdEspAcesso;
   CtrlBaixaIntBanco.UsaPlanoPatro := Sistema.UsaPlanoPatro;
   CtrlBaixaIntBanco.PlanoConta := ParamIntegra.Plano;
   CtrlBaixaIntBanco.RecPag := ParamIntegra.RecPag;
   CtrlBaixaIntBanco.PrefixoServidor := Sistema.PrefixoServidor;
   CtrlBaixaIntBanco.LancaBaixaFloat := Modulo.LancaBaixaFloat;
   CtrlBaixaIntBanco.IntegraContab := ParamIntegra.IntegraContabPag;
   CtrlBaixaIntBanco.PartidaDobrada := ParamIntegra.PartidaDobrada;

   CtrlBaixaIntBanco.CdsDocumentos := CdsDocumentos;
   CtrlBaixaIntBanco.CdsPortaDorForma := CdsPortaDorForma;
   CtrlBaixaIntBanco.CdsParamCAP := CdsParamCAP;
   CtrlBaixaIntBanco.CdsOcorrencia := CdsOcorrencia;
   CtrlBaixaIntBanco.CdsAux := CdsAux;
   CtrlBaixaIntBanco.CdsUnid := CdsUnid;
   CtrlBaixaIntBanco.CdsModelosCnab := CdsModelosCnab;
   CtrlBaixaIntBanco.CdsAlt := CdsAlt;
   CtrlBaixaIntBanco.CdsAuxCodDoc := CdsAuxCodDoc;

   CtrlBaixaIntBanco.InitializeAs(ParamIntegra);
   CtrlBaixaIntBanco.AbreQueries;

   //pendência 27101 - 14/01/2008
   grpbLogFinanc.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');
   edtArquivoLog.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');
   spbtnArqLog.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');
   bitbtnVisualiza.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');

   CtrlBaixaIntBanco.OnBaixa := self.mostraProcessamento;
   CtrlBaixaIntBanco.OnGravaLogFinan := GravaLogFinanceiro;

End;
//************************************************

Procedure TFrmBaixaIntBancoVolumeMT.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   If (CdsDocumentos.ChangeCount > 0) Then CdsDocumentos.CancelUpdates;

   CtrlBaixaIntBanco.FechaQueries;

   freeAndNil(CtrlBaixaIntBanco);

   Inherited;
End;

//************************************************

Procedure TFrmBaixaIntBancoVolumeMT.SbtnAbrirArquivoRetClick(Sender: TObject);
Begin
   Inherited;
   Application.ProcessMessages;

   If CmbModeloCnab.Text = '' Then Begin
         MsgDlg('Favor Indicar o ' + LblPgto.Caption, 'Aviso', mtError, [mbOk], 0);
         CmbModeloCnab.SetFocus;
         Exit;
      End;

   If Not CtrlBaixaIntBanco.AbreOcorrencia(CmbModeloCnab.LookupValue) Then Begin
         MsgDlg(CtrlBaixaIntBanco.MessageInfo, 'Aviso', mtError, [mbOk], 0);
         Exit;
      End;

   Try
      If DlgAbrir.Execute Then Begin
            EdtArquivoRetorno.Text := DlgAbrir.FileName;

            sListaRetorno := TStringList.Create;
            sListaRetorno := CtrlBaixaIntBanco.BuscaBaixa(StrToIntDef(CmbModeloCnab.LookupValue, 0),
               DlgAbrir.FileName,
               UpperCase(Sistema.NomeEmpresa), 'S'); // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
            If sListaRetorno <> Nil Then

               If sListaRetorno.Count = 0 Then Begin
                     MsgDlg('Não foram encontrados registros para baixa no arquivo', 'Aviso', mtError, [mbOk], 0);
                     Exit;
                  End;

            If sListaRetorno <> Nil Then

               If Copy(sListaRetorno[0], 1, 4) = 'Erro' Then Exit;

            CdsDocumentos.PacketRecords := trunc(valCommit.value); { para especifivcar o tamanho do bloco a carregar no pacote}

            CdsDocumentos.EmptyDataSet;

            CdsDocumentos.DisableControls;
            CdsDocumentos.LogChanges := false;

            // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
            CtrlBaixaIntBanco.MontaGrid(sListaRetorno, CmbModeloCnab.LookupValue, 'S');

            edtTotDocs.Text := intToStr(CdsDocumentos.RecordCount);

            If CdsDocumentos.RecordCount < 1 Then
               MemoOperacao.Lines.Add(DateTimeToStr(now) + ' - Não há documentos a baixar neste arquivo.');

            CdsDocumentos.EnableControls;
            CdsDocumentos.LogChanges := true;

            //*** andre tavares 07/12/2006 FrmAguarde.Pos := FrmAguarde.Pos + 1;

         End;

      mostraProcessamento([2, 0, sListaRetorno.count, cdsDocumentos.RecordCount, 'Selecionando Documentos para Baixa']);

      If (CdsDocumentos.IsEmpty) And (trim(CtrlBaixaIntBanco.sNomeArqLog) <> '') Then
         VisualizaArquivo(CtrlBaixaIntBanco.sNomeArqLog, '');

      CdsDocumentos.Edit;
      CdsDocumentos.Post;

   Except
      MsgDlg('Não foi possível ler o arquivo', 'Aviso', mtError, [mbOk], 0);
      Raise;
   End;

End;

//************************************************

Procedure TFrmBaixaIntBancoVolumeMT.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   EdtArquivoRetorno.Text := '';
   CmbModeloCnab.Text := '';
   DlgAbrir.FileName := '';
End;

//************************************************

Procedure TFrmBaixaIntBancoVolumeMT.bbtnConfirmarClick(Sender: TObject);
Var
   sAux: String;
   iCodPortForma: Integer;
   oCtrlFinanc: TCtrlFinanc;
   oCtrlDoc: TCtrlDocumento;
Begin
   Inherited;

   edtArquivoLog.Enabled := false;
   spbtnArqLog.Enabled := false;
   oCtrlDoc := TCtrlDocumento.Create;
   With oCtrlDoc Do
      Begin
         Try
            InitializeAs(ParamIntegra);
            sNumChequeBordero := intToStr(GetNumChqBordero);
         Finally
            FreeAndNil(oCtrlDoc);
         End;
      End;

   If (trim(dtpDataDisp.Text) = '') And (dtpDataDisp.Visible) Then
      Begin
         MsgDlg('Preencha a Data de Disponibilidade ', 'Aviso', mtError, [mbOk], 0);
         dtpDataDisp.SetFocus;
         Exit;
      End;

   If CmbModeloCnab.Text = '' Then Begin
         MsgDlg('Favor Indicar o ' + LblPgto.Caption, 'Aviso', mtError, [mbOk], 0);
         CmbModeloCnab.SetFocus;
         Exit;
      End;

   If CdsDocumentos.IsEmpty Then Begin
         MsgDlg('Não Existem Documentos para este ' + LblPgto.Caption, 'Aviso', mtError, [mbOk], 0);
         Exit;
      End;

   If ParamIntegra.RecPag = 'R' Then Begin
         If (CdsParamcap.FieldByName('CODALTERADORABAT').AsInteger = 0) Then Begin
               MsgDlg('Falta Indicar Alterador para Abatimento no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         If (CdsParamcap.FieldByName('CODALTERADORDESC').AsInteger = 0) Then Begin
               MsgDlg('Falta Indicar Alterador para Desconto no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         If (CdsParamcap.FieldByName('CODALTERADORTARIF').AsInteger = 0) Then Begin
               MsgDlg('Falta Indicar Alterador para Outros Valores no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         If (CdsParamcap.FieldByName('CODALTERADORJUROS').AsInteger = 0) Then Begin
               MsgDlg('Falta Indicar Alterador para Juros no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         sAux := 'Lote de Recebimento'
      End Else
      sAux := 'Cheque / Borderô';

   If Not InputQuery('Baixa Automática', 'Favor Indicar o Nº do ' + sAux, sNumChequeBordero) Then Begin
         MsgDlg('Falta indicação do Nº do ' + sAux, 'Aviso', mtError, [mbOk], 0);
         Exit;
      End;

   If sNumChequeBordero = '' Then Begin
         MsgDlg('Falta indicação do Nº do ' + sAux, 'Aviso', mtError, [mbOk], 0);
         Exit;
      End;

   // Ricardo A. SOL: 112617 KTN: 521708
   // máximo de 15 caracteres por causa do campo NUMCHQBORDERO na tabela RECBTOPAGTO
   If (Length(sNumChequeBordero) > 15) Then
      Begin
         MsgDlg('Tamanho do Nº do ' + sAux + ' não pode exceder a 15 digítos',
            'Aviso', mtError, [mbOK], 0);
         Exit;
      End;

   //Obs: Não utilizar o Exit dentro do Try/Finally, pois gera um
   //erro e mantém o objeto em memória, não destruindo-o
   sAux := '';
   oCtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.UsaPlanoPatro);
   With oCtrlFinanc Do
      Try
         InitializeAs(Padroes);
         If Not TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, dtpDataDisp.Date) Then
            sAux := MessageInfo;
      Finally
         FreeAndNil(oCtrlFinanc);
      End;

   If Trim(sAux) <> '' Then
      Begin
         MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   If (Not CdsDocumentos.IsEmpty) Then
      Begin

         Try
            mostraProcessamento([3, cdsDocumentos.Recno, 0, 1, cdsDocumentos.RecordCount, 'Documentos ']);
            iCodPortForma := CdsDocumentos.FieldByName('CODPORTFORMA').AsInteger;

            CdsDocumentos.DisableControls;
            CdsDocumentos.LogChanges := false;
            CtrlBaixaIntBanco.bUsaPortFormaRetorno := true;

            MemoOperacao.Lines.Add(DateTimeToStr(now) + ' - Baixando documentos...');
            If (CtrlBaixaIntBanco.bbtnConfirmarClick(CmbModeloCnab.LookupValue, sListaRetorno, // Paulo Nobre - Sol 187427 Kintana 1793755
               iCodPortForma,
               StrToFloat(sNumChequeBordero),
               CdsDocumentos.FieldByName('DataBaixa').AsDateTime,
               0, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
               dtpDataDisp.Date,
               trunc(valCommit.value),
               ((CmbModeloCnab.LookupValue = '50') Or (CmbModeloCnab.LookupValue = '60')),
               false,
               (CmbModeloCnab.LookupValue = '60'))) Then
               Begin
                  MemoOperacao.Lines.Add(DateTimeToStr(now) + ' - Baixa documentos concluída com sucesso.');
               End
            Else
               Begin
                  MemoOperacao.Lines.Add(DateTimeToStr(now) + ' - Ocorreu um erro no processamento de baixa: ' + CtrlBaixaIntBanco.MessageInfo);
               End;

         Finally
            MostraProcessamento([5]);

            CdsDocumentos.EnableControls;
            CdsDocumentos.LogChanges := true;

            // Alterado por Arnaldo V. Scarin em 01/07/2008
            FreeAndNil(sListaRetorno);
            FreeAndNil(sListaArquivo);

            If trim(CtrlBaixaIntBanco.sNomeArqLog) <> '' Then
               VisualizaArquivo(CtrlBaixaIntBanco.sNomeArqLog, '');

            edtArquivoLog.Enabled := true;
            spbtnArqLog.Enabled := true;
         End;
      End;
End;
//************************************************

Procedure TFrmBaixaIntBancoVolumeMT.mostraProcessamento(vParam: Array Of Variant);
//  Legenda do FormProgresso
//   vParam[0] :  Tipo da operação (0 = MostraProgDuplo,   1 = AndaProgDuplo,   2 = EscondeProgDuplo)
//                                 (3 = MostraRpogSimples, 4 = AndaProgSimples, 5 = EscondeProgSimples)
//-------------------------------------
//   vParam[1]  :  Registro Atual - Acima
//   vParam[2]  :  Registro Atual - Abaixo

//  Acima
//   vParam[3]  :  Mínimo de Registros
//   vParam[4]  :  Total de Registros
//   vParam[5]  :  Legenda

// Abaixo
//   vParam[6]  :  Mínimo de Registros
//   vParam[7]  :  Total de Registros
//   vParam[8]  :  Legenda

Begin
   Case vParam[0] Of
      // Progresso duplo
      0: Begin
            frmProgressoDuplo.DoubleBuffered := true;
            frmProgressoDuplo.Caption := 'Processamento de Baixa dos Documentos';

            frmProgressoDuplo.Min := 0;
            frmProgressoDuplo.Max := vParam[4];
            frmProgressoDuplo.Min2 := 0;
            frmProgressoDuplo.Max2 := vParam[7];
            frmProgressoDuplo.Legenda := vParam[5];
            frmProgressoDuplo.Legenda2 := vParam[8];

            frmProgressoDuplo.btnCancelar.Visible := false;
            frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5], vParam[8], vParam[3], vParam[6], vParam[4], vParam[7], false, false);
         End;

      1: Begin
            If Not frmProgressoDuplo.Visible Then
               frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5], vParam[8], vParam[3], vParam[6], vParam[4], vParam[7], false, false);

            frmProgressoDuplo.Legenda := vParam[5];
            frmProgressoDuplo.Legenda2 := vParam[8];
            frmProgressoDuplo.Min := vParam[3];
            frmProgressoDuplo.Min2 := vParam[6];
            frmProgressoDuplo.Max := vParam[4];
            frmProgressoDuplo.Max2 := vParam[7];
            frmProgressoDuplo.AndaFormProgressoDuplo(vParam[1], vParam[2]);
         End;

      2: frmProgressoDuplo.EscondeFormProgressoDuplo;

      // Progresso simples
      3: Begin
            frmProgresso.DoubleBuffered := true;
            frmProgresso.Caption := 'Processamento de Baixa dos Documentos';
            frmProgresso.MostraFormProgresso(vParam[5], false, false, true, vParam[3], vParam[4]);
         End;

      4: Begin
            frmProgresso.Min := vParam[3];
            frmProgresso.Max := vParam[4];
            frmProgresso.Legenda := vParam[5];
            frmProgresso.AndaFormProgresso(vParam[1], vParam[4]);
         End;

      5: frmProgresso.EscondeFormProgresso;
   End;
   Application.ProcessMessages;
   Repaint;
End;

Procedure TFrmBaixaIntBancoVolumeMT.FormActivate(Sender: TObject);
Begin
   If frmProgressoDuplo.Visible Then
      Begin //Durante a transação do sql não deixar o form de progresso perder o foco
         SetWindowPos(frmProgressoDuplo.handle, HWND_TOPMOST, frmProgressoDuplo.Left, frmProgressoDuplo.Top, frmProgressoDuplo.Width, frmProgressoDuplo.Height, 0); // HWND_NOTOPMOST normal
         Repaint;
         Application.ProcessMessages;
      End
   Else
      Inherited;
End;

Procedure TFrmBaixaIntBancoVolumeMT.CdsDocumentosAfterOpen(DataSet: TDataSet);
Begin
   Inherited;
   TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00;-#,##0.00';
End;

Procedure TFrmBaixaIntBancoVolumeMT.spbtnArqLogClick(Sender: TObject);
Begin
   Inherited;
   dlgArqLog.Execute;
   If (trim(dlgArqLog.FileName) <> '') Then
      edtArquivoLog.text := dlgArqLog.FileName;
End;

Procedure TFrmBaixaIntBancoVolumeMT.bitbtnVisualizaClick(Sender: TObject);
Begin
   Inherited;
   If (trim(edtArquivoLog.text) <> '') Then
      VisualizaArquivo(edtArquivoLog.text, '');
End;

//para associar ao evento de gravação do financeiro

Procedure TFrmBaixaIntBancoVolumeMT.GravaLogFinanceiro(Const sLog: String);
Var F: TextFile;
Begin

   Try
      If trim(edtArquivoLog.text) <> '' Then
         Begin
            AssignFile(F, edtArquivoLog.text);
            If Not FileExists(edtArquivoLog.text) Then
               Rewrite(F)
            Else
               Append(F);

            Writeln(F, sLog);
            Flush(f);
         End; //if
   Finally
      CloseFile(F);
   End;

End;

Procedure TFrmBaixaIntBancoVolumeMT.CdsDocumentosAfterInsert(DataSet: TDataSet);
Begin
   Inherited;
   edtTotDocs.Text := intToStr(CdsDocumentos.RecordCount);
   self.Repaint;
   self.Refresh;
End;

End.

