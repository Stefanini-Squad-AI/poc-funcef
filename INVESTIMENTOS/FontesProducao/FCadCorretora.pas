//*****************************************************************************
// Data	     : 28/12/2006
// Código    : AL_2
// Pendencia : 24063
// Motivo(S) : Melhoria no Cadastramento de Sub-Conta
//******************************************************************************
// Data     : 01/02/2005
// Código   : AL_1
// Motivo   : Acertado o nome da Tabela NUMCORRETORA da qry qryNumeroCorret
//******************************************************************************

Unit FCadCorretora;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadMestreDetCS, Pessoa, Menus, Db, StdCtrls, checklst, ComCtrls,
   wwdblook, DBCtrls, Mask, wwdbedit, MontaSelect, DBTables, Wwquery,
   Wwdatsrc, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
   TabControlDetalhe, ExtCtrls, DBaseDados, UDataBase, UMensErro, ftelaaut,
   uAutorizacao, ExtDlgs, fCadastroCS, TB97Tlbr, TB97Ctls,
   IvDictio, IvMulti, IvEMulti, consts, CMDBLookupCombo, Wwdbspin, fPessoa,
   CmEventosCadastro, ImgList, wwdbdatetimepicker, CMDateTimePicker,
   UOperacaoInvest, TREdit;

Type
   TfrmCadCorretora = Class(TfrmPessoa)
      TbsCorretora: TTabSheet;
      QryProcuraCorretora: TwwQuery;
      qryAux: TwwQuery;
      QryBolsas: TwwQuery;
      QryNumeroCorret: TwwQuery;
      TbsBolsa: TTabSheet;
      dbgrdBolsa: TwwDBGrid;
      pnlBolsa: TPanel;
      Label2: TLabel;
      DBLkBolsa: TwwDBLookupCombo;
      Label4: TLabel;
      DBENumCorretora: TwwDBEdit;
      QryBolsasIDBOLSAVALORES: TFloatField;
      QryBolsasSGLBOLSAVALORES: TStringField;
      qryNumeroCorretIDCORRETVALORES: TFloatField;
      qryNumeroCorretIDBOLSAVALORES: TFloatField;
      qryNumeroCorretNUMCORRETORA: TFloatField;
      qryNumeroCorretSGLBOLSAVALORES: TStringField;
      Panel3: TPanel;
      LblSigla: TLabel;
      dbeSIGLA: TwwDBEdit;
      dbeCodCetip: TwwDBEdit;
      Label3: TLabel;
      dbchkAtivaRF: TDBCheckBox;
      dbchkAtivaBMF: TDBCheckBox;
      dbchkAtivaRV: TDBCheckBox;
      dblkSubContaD: TwwDBLookupCombo;
      lblSubContaD: TLabel;
      lblSubContaC: TLabel;
      dblkSubContaC: TwwDBLookupCombo;
      qrySubConta: TwwQuery;
      qrySubContaCODSUBCONTA: TFloatField;
      qrySubContaNOMESUBCONTA: TStringField;
      QryInsSubConta: TwwQuery;
      QryBuscaStrSubConta: TwwQuery;
      QryBuscaStrSubContaNOMESUBCONTA: TStringField;
      QryBuscaStrSubContaCODSUBCONTA: TFloatField;
      qrySubTipoIDCORRETVALORES: TFloatField;
      qrySubTipoSGLCORRETVALORES: TStringField;
      qrySubTipoCODIGOCETIP: TStringField;
      qrySubTipoFLGATIVARV: TStringField;
      qrySubTipoFLGATIVARF: TStringField;
      qrySubTipoFLGATIVABMF: TStringField;
      qrySubTipoFLGATIVAFDO: TStringField;
      qrySubTipoSUBCONTAD: TFloatField;
      qrySubTipoSUBCONTAC: TFloatField;
      Label5: TLabel;
      dbeSglCorretCistodiante: TwwDBEdit;
      qrySubTipoSGLCORRETCUSTODIANTE: TStringField;
      Function JaExiste: boolean;
      Procedure CmeCadastroDelete(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);

      Procedure CmeDetalheInsert(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure PessoaChangeSubtipo(IdPessoa: Integer);
      Procedure PessoaSaveSubtipo(Sender: TObject);
      Function JaExisteCorretora: Boolean;
      //AL_2
      Function CriaSubConta: boolean;
      Procedure HabilitaComponentes;
      Procedure DesabilitaComponentes;
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure CmeCadastroBeforeConfirma(sender: TObject;
         Var Accept: Boolean);

   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   frmCadCorretora: TfrmCadCorretora;
   bRepeteDetalhe: Boolean;
   //AL_3
   sSiglaAnt: String;

Implementation

Uses
   UBibliotecaInvest;

{$R *.DFM}

Function TfrmCadCorretora.JaExiste;
Var
   ssql: String;
Begin
   Result := False;
   //AL_3 - Se for igual não precisa testar
   If (sSiglaAnt = dbeSIGLA.Text) Then
      Exit;

   Try
      qryProcuraCorretora.Sql.Clear;
      sSql := 'SELECT CV.IDCORRETVALORES,CV.SGLCORRETVALORES FROM CORRETVALORES CV WHERE CV.SGLCORRETVALORES = ''' + qrySubTipo.FieldByname('SglCorretvalores').AsString + '''';
      qryProcuraCorretora.SQL.Add(sSQL);
      qryProcuraCorretora.Open;
      Result := Not qryProcuraCorretora.IsEmpty;
      qryProcuraCorretora.Close;
   Except Raise;
   End;
End;

Procedure TfrmCadCorretora.CmeCadastroDelete(Sender: TObject);
Var
   PodeExcluir: boolean;
   sSql: String;
Begin
   Try
      PodeExcluir := True;
      qryAux.Close;
      qryAux.SQL.Clear;
      sSql := 'SELECT NC.IDBOLSAVALORES, NC.IDCORRETVALORES FROM NUMCORRETORA NC WHERE NC.IDCORRETVALORES = ''' + qrySubTipo.FieldByname('IdCorretValores').AsString + '''';
      qryAux.SQL.Add(sSQL);
      qryAux.Open;
      If Not qryAux.IsEmpty Then
         Begin
            PodeExcluir := False;
            MsgDlg('Corretoras já Associada a Bolsa de Valores, Não pode ser Excluída', LerMensagem(2), mtError, [mbOk], 0);
         End;
      qryAux.Close;
      If PodeExcluir Then
         Inherited;
   Except Raise;
   End;
   qryAux.Close;
End;

Procedure TfrmCadCorretora.bbtnConfirmarClick(Sender: TObject);
Begin
   //AL_3
   If (Ds.DataSet.State In [dsInsert, dsEdit]) Then
      Begin
         If JaExiste Then
            Begin
               If (MsgDlg('Já Existe Corretora cadastrada com essa Sigla. Deseja Gravar ?',
                  'Aviso', mtWarning, [mbYes, mbNo], 0) = mrNo) Then
                  Begin
                     dbeSigla.setfocus;
                     Exit;
                  End;
            End
         Else
            pgctrlDetalhe.activepage := tbsDocumento;
      End;

   If (Ds.DataSet.State In [dsInsert, dsEdit]) Then
      Begin
         //AL_2
         If Not CriaSubConta Then
            Exit;

      End;
   Inherited;
   pgctrlDetalhe.ActivePage := tbsDocumento;
   DesabilitaComponentes
End;

Procedure TfrmCadCorretora.PessoaSaveSubtipo(Sender: TObject);
Begin
   // Heranca
   Inherited;
   // Confirma as alteracoes no Beneficio
   dtmBaseDados.dbBaseDados.ApplyUpdates([QryNumeroCorret]);
End;

Procedure TfrmCadCorretora.PessoaChangeSubtipo(IdPessoa: Integer);
Begin
   With QryNumeroCorret Do Begin
         If (Active) And (CachedUpdates) Then CancelUpdates;
         ParamByName('IDCORRETVALORES').value := IdPessoa;
         Close;
         Open;
      End;
End;

Procedure TfrmCadCorretora.FormShow(Sender: TObject);
Begin
   Inherited;
   //AL_3 bInserir := False;
   pgctrlDetalhe.ActivePage := tbsDocumento;
   QryBolsas.Close;
   QryBolsas.Open;
   QryNumeroCorret.Close;
   QryNumeroCorret.Open;
   qrySubConta.Close;
   qrySubConta.Open;
   DesabilitaComponentes;
   //AL_3
   sSiglaAnt := '';
End;

Procedure TfrmCadCorretora.FormCloseQuery(Sender: TObject;
   Var CanClose: Boolean);
Begin
   Inherited;
   QryNumeroCorret.Close;
   QryBolsas.Close;
   qrySubConta.Close;
End;

Procedure TfrmCadCorretora.CmeDetalheInsert(Sender: TObject);
Begin
   Inherited; //CmeDetalhe.Insert(Self);
   If pgctrlDetalhe.ActivePage = TbsBolsa Then
      Begin
         If (QryNumeroCorret.State In DsEditModes) Then
            QryNumeroCorret.FieldByName('IDCORRETVALORES').AsInteger :=
               Qry.FieldByName('IDPESSOA').AsInteger;
      End;
End;

Function TfrmCadCorretora.JaExisteCorretora: boolean;
Var
   ssql: String;
   Corretora,
      Bolsa: String;
Begin
   Result := False;
   Corretora := QryNumeroCorret.FieldByName('IdCorretValores').Asstring;
   Bolsa := QryBolsas.FieldByName('IdBolsaValores').Asstring;
   qryAux.Close;
   qryAux.SQL.Clear;
   sSQL := 'SELECT CB.IdCorretValores , CB.IdBolsaValores  FROM NUMCORRETORA CB WHERE CB.IdCorretValores = ''' +
      Corretora + ''' and CB.IdBolsaValores = ''' +
      Bolsa + ''' ORDER BY CB.IdCorretValores';
   qryAux.SQL.Add(sSQL);
   Try
      qryAux.Open;
   Except
      On E: EDBEngineError Do
         Begin
            MsgDlg('Erro nas Tabelas De Bolsas / Corretoras  .', LerMensagem(2), mtError, [mbOk], 0);
            Result := True;
            Exit;
         End;
   End;

   If Not qryAux.IsEmpty Then
      Begin
         Result := True;
         MsgDlg('Corretora já Cadastrada nessa Bolsa .', LerMensagem(2), mtError, [mbOk], 0);
      End;
   qryAux.Close;
End;

Procedure TfrmCadCorretora.bbtnOkDetClick(Sender: TObject);
Begin
   If (pgctrlDetalhe.ActivePage = TbsBolsa) And (sbtnInsDet.Down) Then
      Begin
         If JaExisteCorretora Then
            Begin
               bbtnCancelarDetClick(Self);
               exit;
            End;
         // Caso Inserindo um beneficio Gera o IDENTIFICADOR
         If qryNumeroCorret.State In [DsInsert] Then Begin
               qryNumeroCorret.FieldByName('IDCORRETVALORES').AsInteger :=
                  Qry.FieldByName('IDPESSOA').AsInteger;
            End;
      End;

   Inherited;
   //AL_3
   CmeCadastro.RepetirInsert := False;
   bbtnCancelarDetClick(self);
End;

Procedure TfrmCadCorretora.sbtnInserirClick(Sender: TObject);
Begin
   //AL_3 bInserir := True;
   sSiglaAnt := '';

   QryBolsas.Close;
   QryBolsas.Open;
   QryNumeroCorret.Close;
   QryNumeroCorret.ParamByName('IDCORRETVALORES').AsInteger := -1;
   QryNumeroCorret.Open;
   pgctrlDetalhe.ActivePage := tbsDocumento;
   Inherited;
   HabilitaComponentes;
   //AL_3
   dbchkAtivaRV.Checked := qrySubTipoFLGATIVARV.AsString = 'S';
   dbchkAtivaRF.Checked := qrySubTipoFLGATIVARF.AsString = 'S';
   dbchkAtivaBMF.Checked := qrySubTipoFLGATIVABMF.AsString = 'S';
End;

Procedure TfrmCadCorretora.bbtnCancelarClick(Sender: TObject);
Begin
   // Cancela as alteracoes no Beneficio
   QryNumeroCorret.CancelUpdates;
   // Heranca
   Inherited;
   DesabilitaComponentes;
End;

//AL_2

Function TfrmCadCorretora.CriaSubConta: boolean;
Var
   iIdSubConta: integer;
Begin
   Result := True;
   If pRPI.FLGUSASUBCONTA = 'S' Then
      Begin
         //AL_2
         If Trim(dblkSubContaD.Text) = '' Then
            Begin
               MsgDlg('O Parâmentro do Sistema está marcado para exigir Sub-Conta.' + #13 +
                  'Deve ser informado uma Sub-Conta à Débito para a Corretora.', 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
               Result := False;
               If dblkSubContaD.CanFocus Then
                  dblkSubContaD.CanFocus;
               Exit;
            End
         Else If Trim(dblkSubContaC.Text) = '' Then
            Begin
               MsgDlg('O Parâmentro do Sistema está marcado para exigir Sub-Conta.' + #13 +
                  'Deve ser informado uma Sub-Conta à Crédito para a Corretora.', 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
               Result := False;
               If dblkSubContaC.CanFocus Then
                  dblkSubContaC.CanFocus;
               Exit;
            End
         Else
            Begin
               If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;
               Try
                  If (Trim(QrySubTipo.FieldByName('SUBCONTAD').AsString) = '') Or
                     (Trim(QrySubTipo.FieldByName('SUBCONTAC').AsString) = '') Then
                     Begin
                        // Verifica se a Sub-Conta já está cadastrada
                        With QryBuscaStrSubConta Do
                           Begin
                              Close;
                              ParamByName('NOMESUBCONTA').AsString := Qry.FieldByName('RAZAOSOCIAL').AsString;
                              Open;
                              If isEmpty Then // Se nao existir, entao cadastra
                                 Begin
                                    With QryInsSubConta Do
                                       Begin
                                          Close;
                                          iIdSubConta := LeUltRegistro(Nil, 'SUBCONTA');
                                          ParamByName('CODSUBCONTA').AsInteger := iIdSubConta; // Gera Novo Id de Operacao
                                          ParamByName('IDPESSOA').AsInteger := 1;
                                          ParamByName('NOMESUBCONTA').AsString := Qry.FieldByName('RAZAOSOCIAL').AsString;
                                          ExecSQL;
                                          Close;
                                          qrySubTipo.FieldByName('SUBCONTAD').AsInteger := iIdSubConta;
                                          qrySubTipo.FieldByName('SUBCONTAC').AsInteger := iIdSubConta;
                                       End;
                                 End
                              Else
                                 Begin
                                    qrySubTipo.FieldByName('SUBCONTAD').AsInteger := QryBuscaStrSubConta.FieldByName('CODSUBCONTA').AsInteger;
                                    qrySubTipo.FieldByName('SUBCONTAC').AsInteger := QryBuscaStrSubConta.FieldByName('CODSUBCONTA').AsInteger;
                                 End;
                           End;
                     End;
                  dtmBaseDados.dbBaseDados.Commit;
               Except
                  On E: Exception Do
                     Begin
                        DtmBaseDados.dbBaseDados.Rollback;
                        MsgDlg('Ocorreu problema ao incluir a Sub-Conta.' +
                           #13 + E.Message, 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
                     End;
               End;
            End;
      End;
End;

Procedure TfrmCadCorretora.HabilitaComponentes;
Begin
   dblkSubContaD.Enabled := True;
   dblkSubContaC.Enabled := True;
   dbeSIGLA.Enabled := True;
   dbeCodCetip.Enabled := True;
End;

Procedure TfrmCadCorretora.DesabilitaComponentes;
Begin
   dblkSubContaD.Enabled := False;
   dblkSubContaC.Enabled := False;
   dbeSIGLA.Enabled := False;
   dbeCodCetip.Enabled := False;
End;

Procedure TfrmCadCorretora.sbtnAlterarClick(Sender: TObject);
Begin
   Inherited;
   HabilitaComponentes;
   //AL_3
   sSiglaAnt := dbeSIGLA.Text;
   dbchkAtivaRV.Checked := qrySubTipoFLGATIVARV.AsString = 'S';
   dbchkAtivaRF.Checked := qrySubTipoFLGATIVARF.AsString = 'S';
   dbchkAtivaBMF.Checked := qrySubTipoFLGATIVABMF.AsString = 'S';
End;

Procedure TfrmCadCorretora.CmeCadastroBeforeConfirma(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   If qrySubTipoSGLCORRETVALORES.IsNull Then
      Begin
         MsgDlg('Não foi informada a Sigla da Corretora !', 'Atenção', mtWarning, [mbOk], 0);
         If dbeSIGLA.CanFocus Then
            dbeSIGLA.SetFocus;
         Accept := False;
      End;
End;

End.

