Unit FCadastroCDS;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBCtrls, DB, Buttons, StdCtrls, ExtCtrls, FTelaAut, MAHlpBtn, wwidlg,
   Wwdatsrc, DBTables, Wwtable, cmseldlg, FProcurar, wwQuery, ToolWin,
   ComCtrls, FOkCancelar, TB97, MontaSelect, TB97Tlbr, TB97Ctls, IvDictio,
   IvMulti, IvEMulti, fCadastroPai, ImgList, ActnList, CmEventosCadastro,
   Gauges, fcLabel, DBClient, uCMClientDataSet;

Type
   TfrmCadastroCDS = Class(TfrmCadastroPai)
      upd: TUpdateSQL;
      MontaSelect: TMontaSelect;
      cds: TCMClientDataSet;
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure CmeCadastroCancel(Sender: TObject);
      Procedure CmeCadastroConfirma(Sender: TObject);
      Procedure CmeCadastroInsert(Sender: TObject);
      Procedure CmeCadastroEdit(Sender: TObject);
      Procedure CmeCadastroDelete(Sender: TObject);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure FormShow(Sender: TObject);

   Private

   Protected

   Public
      Function TemAlteracaoPendente: Boolean;
   End;

Var
   frmCadastroCDS: TfrmCadastroCDS;

Implementation

Uses UMensErro, FSairAjuda, uDatabase, DBaseDados, uAutorizacao{$IFNDEF VER0505}, uCMTypes{$ENDIF};

{$R *.DFM}

Procedure TfrmCadastroCDS.FormCreate(Sender: TObject);
Begin
   Inherited;
   //   pnlFundo.Enabled := false;
   CmeCadastro.RepetirInsert := False;

   If cds.IsEmpty Then
      CmeCadastro.Operacao := opVazio
   Else
      CmeCadastro.Operacao := opIdle;
End;

Procedure TfrmCadastroCDS.sbtnInserirClick(Sender: TObject);
Begin
   Inherited;
   If Not (CmeCadastro.Operacao In [opIdle, opVazio]) Then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Insert(Self);
   CmeCadastro.AtualizaBotoes(Self);
End;

Procedure TfrmCadastroCDS.sbtnAlterarClick(Sender: TObject);
Begin
   Inherited;
   If Not (CmeCadastro.Operacao In [opIdle, opVazio]) Then
      CmeCadastro.Cancel(self);

   CmeCadastro.Operacao := opAlterar;
   CmeCadastro.RepetirInsert := False;
   CmeCadastro.AtualizaBotoes(Self);
   CmeCadastro.Edit(Self);
   CmeCadastro.AtualizaBotoes(Self);
End;

Procedure TfrmCadastroCDS.sbtnProcurarClick(Sender: TObject);
Begin
   Inherited;
   CmeCadastro.Operacao := opProcurar;
   MontaSelect.Executar;

   CmeCadastro.Find(Self);

   If cds.IsEmpty Then
      CmeCadastro.Operacao := opVazio
   Else
      CmeCadastro.Operacao := opIdle;

   CmeCadastro.AtualizaBotoes(Self);
End;

Procedure TfrmCadastroCDS.sbtnApagarClick(Sender: TObject);
Begin
   Inherited;
   If CmeCadastro.Operacao = opIdle Then
      Begin
         Try
            CmeCadastro.Operacao := opApagar;

            If (MsgDlg('Deseja realmente excluir este registro ?', 'Exclusão', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
               CmeCadastro.Delete(Self);

            If cds.IsEmpty Then
               CmeCadastro.Operacao := opVazio
            Else
               CmeCadastro.Operacao := opIdle;

            CmeCadastro.AtualizaBotoes(Self);
         Except
            CmeCadastro.Operacao := opIdle;
            sbtnApagar.Down := False;
            cds.DisableControls;
            cds.Close;
            cds.Open;
            cds.EnableControls;
            Raise;
         End;
      End;
End;

Procedure TfrmCadastroCDS.bbtnConfirmarClick(Sender: TObject);
Var
   bInsert: boolean;
Begin
   Inherited;
   bInsert := CmeCadastro.RepetirInsert And (CmeCadastro.Operacao = opInserir);

   CmeCadastro.Confirma(Self);

   If CmeCadastro.ConfirmaCadastro Then
      Begin
         If cds.IsEmpty Then
            CmeCadastro.Operacao := opVazio
         Else
            CmeCadastro.Operacao := opIdle;

         If bInsert Then
            sbtnInserir.Click
         Else
            CmeCadastro.AtualizaBotoes(Self);

         //If CmeCadastro.RepetirInsert Then sbtnInserir.Click;
      End;
End;

Procedure TfrmCadastroCDS.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   CmeCadastro.RepetirInsert := False;
   If cds.Active Then
      CmeCadastro.Cancel(self);
   If cds.IsEmpty Then
      CmeCadastro.Operacao := opVazio
   Else
      CmeCadastro.Operacao := opIdle;

   CmeCadastro.AtualizaBotoes(Self);
End;

Procedure TfrmCadastroCDS.FormCloseQuery(Sender: TObject;
   Var CanClose: Boolean);
Begin
   If ds.State In ([dsInsert, dsEdit]) Then
      Begin
         If TemAlteracaoPendente Then
            If MsgDlg('Alguns dados informados ainda não foram gravados.' + #13 + #10 + 'Deseja realmente sair da tela?',
               'Alterações pendentes', mtWarning, [mbYes, mbNo], 0) = mrNo Then
               CanClose := false;
      End;
   If CanClose Then bbtnCancelar.Click;
   Inherited;
End;

Function TfrmCadastroCDS.TemAlteracaoPendente: Boolean;
Var
   i: integer;
Begin
   Result := false;
   i := 0;
   While (i < ComponentCount) And (Not Result) Do Begin
         If (TObject(Components[i]).ClassNameIs('TwwQuery')) And
            (TwwQuery(Components[i]).Active) And
            (TwwQuery(Components[i]).CachedUpdates) And
            (TwwQuery(Components[i]).UpdatesPending) Then
            Result := true;
         Inc(i);
      End;
End;

Procedure TfrmCadastroCDS.CmeCadastroCancel(Sender: TObject);
Begin
   Inherited;
   cds.CancelUpdates;
End;

Procedure TfrmCadastroCDS.CmeCadastroConfirma(Sender: TObject);
Begin
   Inherited;
   AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
End;

Procedure TfrmCadastroCDS.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   cds.Insert;
End;

Procedure TfrmCadastroCDS.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   cds.Edit;
End;

Procedure TfrmCadastroCDS.CmeCadastroDelete(Sender: TObject);
Begin
   Inherited;
   cds.Delete;
   CmeCadastro.Confirma(Self);
End;

Procedure TfrmCadastroCDS.CmeCadastroAtualizaBotoes(Sender: TObject);
Var
   ConfirmaVisible: Boolean;
Begin
   Inherited;
   { Configura o estado dos botões }

   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;
   Case CmeCadastro.Operacao Of
      opVazio:
         Begin
            sbtnInserir.Down := false;
            sbtnAlterar.Down := false;
            sbtnApagar.Down := false;
            sbtnProcurar.Down := false;
            sbtnInserir.Enabled := true;
            sbtnAlterar.Enabled := false;
            sbtnApagar.Enabled := false;
            sbtnProcurar.Enabled := true;

            ConfirmaVisible := false;
         End;
      opIdle:
         Begin
            sbtnInserir.Down := false;
            sbtnAlterar.Down := false;
            sbtnApagar.Down := false;
            sbtnProcurar.Down := false;
            sbtnInserir.Enabled := true;
            sbtnProcurar.Enabled := true;

            If (cds.Active) And (Not cds.IsEmpty) Then
               Begin
                  sbtnAlterar.Enabled := true;
                  sbtnApagar.Enabled := true;
               End
            Else Begin
                  sbtnAlterar.Enabled := false;
                  sbtnApagar.Enabled := false;
               End;
            ConfirmaVisible := false;
         End;
      opInserir:
         Begin
            sbtnInserir.Down := true;
            sbtnInserir.Enabled := true;
            ConfirmaVisible := true;
         End;
      opAlterar:
         Begin
            sbtnAlterar.Down := true;
            sbtnAlterar.Enabled := true;
            ConfirmaVisible := true;
         End;
      opProcurar:
         Begin
            sbtnProcurar.Down := true;
            sbtnProcurar.Enabled := true;
            ConfirmaVisible := false;
         End;
      opApagar:
         Begin
            sbtnApagar.Down := false;
            sbtnApagar.Enabled := true;
            ConfirmaVisible := false;
         End;
   Else
      ConfirmaVisible := false;
   End;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;

   //   if pnlfundo.Visible then
   //      pnlfundo.enabled := ConfirmaVisible;

   AutorizarForm(afSoDesabilitar);
End;

Procedure TfrmCadastroCDS.FormShow(Sender: TObject);
Begin
   Inherited;
   CmeCadastro.AtualizaBotoes(Self);
End;

End.

