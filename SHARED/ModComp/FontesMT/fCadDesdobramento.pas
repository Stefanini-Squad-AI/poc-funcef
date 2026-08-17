//******************************************************************************************
//N. Sol..........: 171564
//N. Kintana......: 1538999
//Data............: 09/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Passado o campo IDCBANCARIA na função GerarIntegracaoEtapa
//********************************************************************************************************
//Rotina..........: frmCadDesdobramento
//N. Sol..........: 149851
//N. Kintana......: 1086521
//Data............: 18/01/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão do campo Data da Contadoria
//******************************************************************************************
//Rotina..........: frmCadDesdobramento
//N. Sol..........: 126385
//N. Kintana......: 659529
//Data............: 12/04/2010
//Responsável.....: Renan Cristiano
//Descrição.......: Desenvolvimento do Cadastro dos Desdobramentos dos depositos judiciais
//******************************************************************************************
Unit fCadDesdobramento;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls,
   TREdit, uCtrlEtpDesdobramento, uCtrlPadroes, DBTables, Wwquery, uCMTypes, UMensErro;

Type
   TfrmCadDesdobramento = Class(TFrmCadastroGridMT)
      lblVlrCreditado: TLabel;
      lblDtDeposito: TLabel;
      lblVlrCalc: TLabel;
      dbrgTipoDesdobramento: TDBRadioGroup;
      dbrValorCred: TDBRealEdit;
      btnContaBanc: TBitBtn;
      dtedDataDeposito: TCMDateTimePicker;
      dbrgTipoProfissional: TDBRadioGroup;
      dbrValorCalc: TDBRealEdit;
      qry: TwwQuery;
      qryIDTPDESDOBRAMENTO: TFloatField;
      qryNUMPROCTRAB: TFloatField;
      qryCODTIPORECURSO: TFloatField;
      qryTPDESDOBRAMENTO: TFloatField;
      qryDESCDESDOBRAMENTO: TStringField;
      qryDATADEPOSITO: TDateTimeField;
      qryVLRCREDITADO: TFloatField;
      qryTPIMPUGCALCULO: TFloatField;
      qryDESCTPIMPUGCALCULO: TStringField;
      qryIDCBANCARIA: TFloatField;
      qryCODPORTADOR: TFloatField;
      qryVLRCALCCONTADORIA: TFloatField;
      qryDESCPORTADOR: TStringField;
      qryDESCBANCARIA: TStringField;
      qryNUMSEQ: TFloatField;
      Label1: TLabel;
      DBDtContadoria: TCMDateTimePicker;
      qryDATACONTADORIA: TDateTimeField;
      Procedure btnContaBancClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FazerRefresh; Virtual;
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure dbrgTipoDesdobramentoChange(Sender: TObject);
      Procedure edtDescContaKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
   Private
      iCodTipoRecurso: Integer;
      iNumProcTrab: Double;
      iNumSeq: Integer;
      iIdEtpDesdobramento: Integer;
      CtrlEtpDesdobramento: TCtrlEtpDesdobramento;
   Public
      dValor: double;
      Procedure ExibirTelaDesdobramento(NumProcTrab: Double; CodTipoRecurso, NumSeq: Integer);
      Procedure AtualizaGrid;
   End;

Var
   frmCadDesdobramento: TfrmCadDesdobramento;

Implementation

Uses fCadRegContaBanc;

{$R *.DFM}

Procedure TfrmCadDesdobramento.ExibirTelaDesdobramento(NumProcTrab: Double; CodTipoRecurso, NumSeq: Integer);
Begin
   CtrlEtpDesdobramento := TCtrlEtpDesdobramento.Create;
   CtrlEtpDesdobramento.InitializeAs(Padroes);
   CtrlEtpDesdobramento.CdsEtpDesdobramento := cds;
   Cds.data := CtrlEtpDesdobramento.ListDesdobramento(NumProcTrab, CodTipoRecurso, NumSeq);
   iNumProcTrab := NumProcTrab;
   iCodTipoRecurso := CodTipoRecurso;
   iNumSeq := NumSeq;
   dValor := 0;
   sbtnAlterar.Enabled := True;
   sbtnApagar.Enabled := True;

   If Cds.IsEmpty Then
      Begin
         sbtnApagar.Enabled := False;
         sbtnAlterar.Enabled := False;
      End;

   Show;

   FazerRefresh;

   TFloatField(cds.FieldByName('VLRCREDITADO')).DisplayFormat := '###,###,##0.00';
   TFloatField(cds.FieldByName('VLRCALCCONTADORIA')).DisplayFormat := '###,###,##0.00';
End;

Procedure TfrmCadDesdobramento.btnContaBancClick(Sender: TObject);
Begin
   Inherited;
   If Not (Assigned(frmCadRegContaBanc)) Then
      frmCadRegContaBanc := TfrmCadRegContaBanc.Create(Application);

   // SOL 171564 KTN 1538999 - Paulo Nobre
   frmCadRegContaBanc.ExibirTelaContaBanc(0, Cds);

End;

Procedure TfrmCadDesdobramento.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   {   FreeAndNil(CtrlEtpDesdobramento);
      Action := caFree;
      frmCadDesdobramento := Nil;}
   //   Inherited;
End;

Procedure TfrmCadDesdobramento.CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
Begin
   Accept := CtrlEtpDesdobramento.AplicaEtpDesdobramento;

   If CmeCadastro.Operacao In [OpInserir] Then
      iIdEtpDesdobramento := CtrlEtpDesdobramento.IDEtpDesdobramento;

   If Not Accept Then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
         'Motivo: ' + CtrlEtpDesdobramento.MessageInfo, 'Mensagem do Sistema', mtwarning, [mbOk], 0);
   Inherited;

   AtualizaGrid;
End;

Procedure TfrmCadDesdobramento.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   AtualizaGrid;
   FazerRefresh;
End;

Procedure TfrmCadDesdobramento.AtualizaGrid;
Begin
   Cds.Data := CtrlEtpDesdobramento.ListDesdobramento(iNumProcTrab, iCodTipoRecurso, iNumSeq);
   If iIdEtpDesdobramento > 0 Then
      Cds.Locate('IDTPDESDOBRAMENTO', iIdEtpDesdobramento, []);
End;

Procedure TfrmCadDesdobramento.CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
Begin
   Accept := CtrlEtpDesdobramento.AplicaEtpDesdobramento;

   If CmeCadastro.Operacao In [OpInserir] Then
      iIdEtpDesdobramento := CtrlEtpDesdobramento.IDEtpDesdobramento;

   If Not Accept Then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
         'Motivo: ' + CtrlEtpDesdobramento.MessageInfo, 'Mensagem do Sistema', mtwarning, [mbOk], 0);
   Inherited;

   AtualizaGrid;
End;

Procedure TfrmCadDesdobramento.bbtnConfirmarClick(Sender: TObject);
Begin
   If (Trim(dtedDataDeposito.Text) = '') Then Begin
         MsgDlg('Preencha a Data do depósito.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dtedDataDeposito.SetFocus;
         exit;
      End;

   Cds.FieldByName('NUMPROCTRAB').AsFloat := iNumProcTrab;
   Cds.FieldByName('CODTIPORECURSO').AsInteger := iCodTipoRecurso;
   Cds.FieldByName('NUMSEQ').AsInteger := iNumSeq;

   If dbrgTipoDesdobramento.ItemIndex = 0 Then
      Begin

         If (Cds.FieldByName('VLRCALCCONTADORIA').Value > 0) And (Cds.FieldByName('DATACONTADORIA').IsNull) Then
            Begin
               MsgDlg('Preencha a Data da Contadoria.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
               DBDtContadoria.SetFocus;
               exit;
            End;

         If (Cds.FieldByName('VLRCALCCONTADORIA').Value = 0) And (Not Cds.FieldByName('DATACONTADORIA').IsNull) Then
            Begin
               MsgDlg('Preencha o Valor da Contadoria.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
               dbrValorCalc.SetFocus;
               exit;
            End;

         Cds.FieldByName('TPIMPUGCALCULO').Value := Null
      End
   Else If dbrgTipoDesdobramento.ItemIndex = 1 Then
      Cds.FieldByName('VLRCALCCONTADORIA').Value := Null;

   dValor := dValor + cds.FieldByName('VLRCREDITADO').asFloat;

   CmeCadastro.RepetirInsert := False;

   Inherited;

   TFloatField(cds.FieldByName('VLRCREDITADO')).DisplayFormat := '###,###,##0.00';
   TFloatField(cds.FieldByName('VLRCALCCONTADORIA')).DisplayFormat := '###,###,##0.00';

End;

Procedure TfrmCadDesdobramento.FazerRefresh;
Begin
   { o inherited deste método deve estar sempre no final da instrução }
   If (Not Cds.IsEmpty) Then
      If CmeCadastro.Operacao In [OpIdle, OpVazio] Then Begin
            CmeCadastro.Operacao := OpIdle;
            CmeCadastro.AtualizaBotoes(self);
         End;
End;

Procedure TfrmCadDesdobramento.sbtnAlterarClick(Sender: TObject);
Begin
   Inherited;

   If dbrgTipoDesdobramento.ItemIndex = 0 Then Begin
         dbrgTipoProfissional.Visible := False;
         dbrgTipoProfissional.ItemIndex := -1;
         dbrValorCalc.Visible := True;
         lblVlrCalc.Visible := True;
      End Else If dbrgTipoDesdobramento.ItemIndex = 1 Then Begin
         dbrgTipoProfissional.Visible := True;
         dbrgTipoProfissional.ItemIndex := 0; //Interno
         dbrValorCalc.Visible := False;
         dbrValorCalc.Clear;
         lblVlrCalc.Visible := False;
      End;
End;

Procedure TfrmCadDesdobramento.dbrgTipoDesdobramentoChange(Sender: TObject);
Begin
   Inherited;
   If dbrgTipoDesdobramento.ItemIndex = 0 Then
      Begin
         dbrgTipoProfissional.Visible := False;
         dbrgTipoProfissional.ItemIndex := -1;
         dbrValorCalc.Visible := True;
         lblVlrCalc.Visible := True;
      End
   Else If dbrgTipoDesdobramento.ItemIndex = 1 Then
      Begin
         dbrgTipoProfissional.Visible := True;
         dbrgTipoProfissional.ItemIndex := 0; //Interno
         dbrValorCalc.Visible := False;
         dbrValorCalc.Clear;
         lblVlrCalc.Visible := False;
      End;
End;

Procedure TfrmCadDesdobramento.edtDescContaKeyPress(Sender: TObject; Var Key: Char);
Begin
   Inherited;
   Key := #0;
End;

Procedure TfrmCadDesdobramento.FormShow(Sender: TObject);
Begin
   //  inherited;

End;

Procedure TfrmCadDesdobramento.bbtnSairClick(Sender: TObject);
Begin
   //  Inherited;
   close;
End;

Procedure TfrmCadDesdobramento.FormCreate(Sender: TObject);
Begin
   //  inherited;

End;

End.

