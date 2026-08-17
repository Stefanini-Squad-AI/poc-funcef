(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000
*******************************************************************************)

unit FCadLocalidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, CmEventosCadastro, ImgList,{$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TFrmCadLocalidades = class(TfrmCadastroCS)
    TreeLocalxCpu: TTreeView;
    ImlTree: TImageList;
    qryIDLOCALATENDXCPU: TFloatField;
    qryIDCPUATEND: TFloatField;
    qryIDLOCALATEND: TFloatField;
    qryDESCCPUATEND: TStringField;
    qryDESCLOCALATEND: TStringField;
    QryCpu: TwwQuery;
    QryLocal: TwwQuery;
    QryLocalIDLOCALATEND: TFloatField;
    QryLocalDESCLOCALATEND: TStringField;
    QryCpuIDCPUATEND: TFloatField;
    QryCpuDESCCPUATEND: TStringField;
    UpdLocal: TUpdateSQL;
    UpCpu: TUpdateSQL;
    qryIDLOCAL: TFloatField;
    QryLocalIDTIPOATEND: TFloatField;
    qryNOMETIPOATEND: TStringField;
    MsForma: TMontaSelect;
    procedure TreeLocalxCpuDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeLocalxCpuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TreeLocalxCpuDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeLocalxCpuDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure TreeLocalxCpuEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure TreeLocalxCpuEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TreeLocalxCpuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    bEditando :Boolean;
    Procedure MontaArvore;
    Function  ValidaCpu(sNomeCpu:String):Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadLocalidades: TFrmCadLocalidades;

implementation

Uses uDataBase, FPrincipal;

{$R *.DFM}

Procedure TFrmCadLocalidades.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnAlterar.Enabled := True;
  pnlFundo.Enabled    := True;
End;

Procedure TFrmCadLocalidades.CmeCadastroConfirma(Sender: TObject);
Begin
  AplicaAlteracoes([QryLocal,QryCpu]);
  Inherited;
End;

Procedure TFrmCadLocalidades.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  QryLocal.CancelUpdates;
  QryCpu.CancelUpdates;
  MontaArvore;
End;

Procedure TFrmCadLocalidades.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  Qry.Cancel;
End;

Procedure TFrmCadLocalidades.MontaArvore;
Var
  NoCpus, NoLocais, NoCpu, NoLocal, NoCpuxLocal, NoForma :TTreeNode;
  idCpu, idLocal, idCpuxLocal :^LongInt;
  sOldLocal                   :String;
Begin
  if Qry.Active      Then Qry.Close;
  if QryLocal.Active Then QryLocal.Close;
  if QryCpu.Active   Then QryCpu.Close;
  Qry.Open;
  QryLocal.Open;
  QryCpu.Open;

  TreeLocalxCpu.Items.Clear;

  NoLocal              := nil;
  NoCpus               := TreeLocalxCpu.Items.Add(nil,'Computadores');
  NoCpus.ImageIndex    := 0;
  NoCpus.SelectedIndex := 0;

  NoLocais            := TreeLocalxCpu.Items.Add(nil,'Local de Atendimento');
  NoLocais.ImageIndex := 1;
  NoLocais.SelectedIndex := 1;

  QryCpu.First;
  While Not QryCpu.Eof Do
  Begin
     New(idCpu);
     LongInt(idCpu^)  := QryCpuIDCPUATEND.AsInteger;
     NoCpu            := TreeLocalxCpu.Items.AddChildObject(NoCpus,QryCpuDESCCPUATEND.AsString,idCpu);
     NoCpu.ImageIndex := 3;
     NoCpu.SelectedIndex := 3;
     QryCpu.Next;
  End;

  qry.First;
  sOldLocal := '';

  while Not qry.Eof Do
  Begin

    If sOldLocal <> qryDESCLOCALATEND.AsString Then
    Begin
       New(idLocal);
       LongInt(idLocal^)  := qryIDLOCAL.AsInteger;
       NoLocal            := TreeLocalxCpu.Items.AddChildObject(NoLocais,qryDESCLOCALATEND.AsString,idLocal);
       NoLocal.ImageIndex := 2;
       NoLocal.SelectedIndex := 2;
       sOldLocal          := qryDESCLOCALATEND.AsString;

       If Not qryNOMETIPOATEND.IsNull Then
       Begin
          New(idLocal);
          LongInt(idLocal^)      := qryIDLOCAL.AsInteger;
          NoForma               := TreeLocalxCpu.Items.AddChildObject(NoLocal,qryNOMETIPOATEND.AsString,idLocal);
          NoForma.ImageIndex    := 4;
          NoForma.SelectedIndex := 4;
       End;
    End;

    If Not qryDESCCPUATEND.IsNull Then
    Begin
      New(idCpuxLocal);
      LongInt(idCpuxLocal^)  := qryIDCPUATEND.AsInteger;
      NoCpuxLocal            := TreeLocalxCpu.Items.AddChildObject(NoLocal,qryDESCCPUATEND.AsString,idCpuxLocal);
      NoCpuxLocal.ImageIndex := 3;
      NoCpuxLocal.SelectedIndex := 3;
    End;

    qry.Next;
  End;

End;

procedure TFrmCadLocalidades.TreeLocalxCpuDblClick(Sender: TObject);
Var
  sAux :String;
  id   :^LongInt;
  No   :TtreeNode;
begin
  inherited;
  If CmeCadastro.Operacao = Opalterar Then
  Begin
     sAux := '';

     If TreeLocalxCpu.Selected <> nil Then
     Begin
       TreeLocalxCpu.Selected.Expand(False);
       Case TreeLocalxCpu.Selected.ImageIndex of
         0:
         Begin
            If InputQuery('Computadores', 'Nome do Computador',sAux) Then
            Begin
               QryCpu.Append;
               QryCpuIDCPUATEND.AsInteger  := LeUltRegistro(nil,'CPUATEND');
               QryCpuDESCCPUATEND.AsString := sAux;
               QryCpu.Post;

               New(id);
               LongInt(id^)  := QryCpuIDCPUATEND.AsInteger;
               No            := TreeLocalxCpu.Items.AddChildObject(TreeLocalxCpu.Selected,QryCpuDESCCPUATEND.AsString,id);
               No.ImageIndex := 3;
               No.SelectedIndex := 3;
            End;
         End;
         1:
         Begin
            If InputQuery('Local de Atendimento', 'Nome do Local',sAux) Then
            Begin
               QryLocal.Append;
               QryLocalIDLOCALATEND.AsInteger  := LeUltRegistro(nil,'CPUATEND');
               QryLocalDESCLOCALATEND.AsString := sAux;
               QryLocal.Post;

               New(id);
               LongInt(id^)  := QryLocalIDLOCALATEND.AsInteger;
               No            := TreeLocalxCpu.Items.AddChildObject(TreeLocalxCpu.Selected,QryLocalDESCLOCALATEND.AsString,Id);
               No.ImageIndex := 2;
               No.SelectedIndex := 2;
            End;
         End;
         2:
         Begin
            If QryLocal.Locate('IDLOCALATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then
            Begin
                If QryLocalIDTIPOATEND.IsNull And
                  (MsForma.Executar = MrOk)   Then
                Begin
                   QryLocal.Edit;
                   QryLocalIDTIPOATEND.AsInteger := StrToInt(MsForma.ValoresChave[0]);
                   QryLocal.Post;

                   New(id);
                   LongInt(id^)     := StrToInt(MsForma.ValoresChave[0]);
                   No               := TreeLocalxCpu.Items.AddChildObjectFirst(TreeLocalxCpu.Selected,MsForma.ValoresChave[1],Id);
                   No.ImageIndex    := 4;
                   No.SelectedIndex := 4;
                End;
            End;
         End;
       End;
     End;
  End;
end;

procedure TFrmCadLocalidades.FormCreate(Sender: TObject);
begin
  inherited;
  MontaArvore;
  bEditando := false;
end;

procedure TFrmCadLocalidades.TreeLocalxCpuMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
  No :TTreeNode;
begin
  inherited;
  No := TreeLocalxCpu.Selected;
  If (No <> nil) And (No.ImageIndex = 3) Then TreeLocalxCpu.BeginDrag(False);
end;

procedure TFrmCadLocalidades.TreeLocalxCpuDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
Var
  No :TTreeNode;
begin
  inherited;
  Accept := ((CmeCadastro.Operacao In [OpInserir, OpAlterar]) And (source is TTreeView) And ((source as TTreeView) = TreeLocalxCpu));
  If Accept Then
  Begin
     No := TreeLocalxCpu.GetNodeAt(X,Y);
     Accept := ((No <> Nil) And (No.ImageIndex = 2))
  End;
end;

procedure TFrmCadLocalidades.TreeLocalxCpuDragDrop(Sender, Source: TObject;
  X, Y: Integer);
Var
  NoPai, No, NoCpu :TTreeNode;
begin
  inherited;

  NoPai := TreeLocalxCpu.Selected.Parent;

  If NoPai <> Nil Then
  Begin
     If NoPai.Imageindex = 2 Then
     Begin
        If Qry.Locate('IDCPUATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then Qry.Delete;
        No                  := TreeLocalxCpu.GetNodeAt(X,Y);
        NoCpu               := TreeLocalxCpu.Items.AddChildObject(No,TreeLocalxCpu.Selected.text,TreeLocalxCpu.Selected.Data);
        NoCpu.ImageIndex    := 3;
        NoCpu.SelectedIndex := 3;
        No.Expand(True);
        qry.Append;
        qryIDLOCALATENDXCPU.AsInteger := LeUltRegistro(nil,'LOCALATENDXCPU');
        qryIDCPUATEND.AsInteger       := LongInt(TreeLocalxCpu.Selected.Data^);
        qryIDLOCALATEND.AsInteger     := LongInt(No.Data^);
        qryIDLOCAL.AsInteger          := LongInt(No.Data^);
        qry.Post;
        TreeLocalxCpu.Items.Delete(TreeLocalxCpu.Selected);
     End
     Else
     Begin
        If ValidaCpu(TreeLocalxCpu.Selected.text) Then
        Begin
          No := TreeLocalxCpu.GetNodeAt(X,Y);
          NoCpu               := TreeLocalxCpu.Items.AddChildObject(No,TreeLocalxCpu.Selected.text,TreeLocalxCpu.Selected.Data);
          NoCpu.ImageIndex    := 3;
          NoCpu.SelectedIndex := 3;
          No.Expand(True);
          qry.Append;
          qryIDLOCALATENDXCPU.AsInteger := LeUltRegistro(nil,'LOCALATENDXCPU');
          qryIDCPUATEND.AsInteger       := LongInt(TreeLocalxCpu.Selected.Data^);
          qryIDLOCALATEND.AsInteger     := LongInt(No.Data^);
          qryIDLOCAL.AsInteger          := LongInt(No.Data^);
          qry.Post;
        End;
     End;
  End;
end;

Function TFrmCadLocalidades.ValidaCpu(sNomeCpu:String):Boolean;
Var
  X :Integer;
Begin
  Result := True;

  For X:=0 To TreeLocalxCpu.Items.Count - 1 Do
  Begin
      If (TreeLocalxCpu.Items[x].ImageIndex = 3) And  (TreeLocalxCpu.Items[x].Text = sNomeCpu) And (TreeLocalxCpu.Items[x].Parent.ImageIndex = 2) Then
      Begin
        Application.MessageBox('Este Computador já está associado a um local de atendimento.','Aviso',Mb_IconInformation);
        Result := False;
        Break;
      End;
  End;
End;

procedure TFrmCadLocalidades.TreeLocalxCpuEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := ((Node.ImageIndex In [2,3]) And (CmeCadastro.Operacao In [OpInserir, OpAlterar]));
  bEditando := AllowEdit;
end;

procedure TFrmCadLocalidades.TreeLocalxCpuEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
Var
  X: Integer;
begin
  inherited;
  If S <> '' Then
  Begin
     Case Node.ImageIndex of
       2:
       Begin
         If QryLocal.Locate('IDLOCALATEND',LongInt(Node.Data^),[]) Then
         Begin
            QryLocal.Edit;
            QryLocalDESCLOCALATEND.AsString := S;
            QryLocal.Post;
         End;
       End;
       3:
       Begin
         If QryCpu.Locate('IDCPUATEND',LongInt(Node.Data^),[]) Then
         Begin
            QryCpu.Edit;
            QryCpuDESCCPUATEND.AsString := S;
            QryCpu.Post;

            For X:= 0 To TreeLocalxCpu.Items.Count - 1 Do
                If TreeLocalxCpu.Items[x].Text = Node.Text Then
                Begin
                   TreeLocalxCpu.Items[x].Text := S;
                   Break;
                End;
         End;
       End;
     End;
  End
  Else
    S := Node.text;

  bEditando := false;    
end;

procedure TFrmCadLocalidades.TreeLocalxCpuKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If (Key = Vk_Delete) And
     (Not bEditando) And
     (TreeLocalxCpu.Selected <> Nil) And
     (CmeCadastro.Operacao In [OpInserir, OpAlterar]) Then
     Begin
       Case TreeLocalxCpu.Selected.ImageIndex Of
         2:
         Begin
            If qry.Locate('IDLOCALATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then
               Application.MessageBox('Este Local de Atendimento tem computadores associados. Não é possível excluir','Aviso',Mb_IconInformation)
            Else
            Begin
               If QryLocal.Locate('IDLOCALATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then
               Begin
                  QryLocal.Delete;
                  TreeLocalxCpu.Items.Delete(TreeLocalxCpu.Selected);
               End;
            End;
         End;
         3:
         Begin
                    If (TreeLocalxCpu.Selected.Parent.ImageIndex = 0) Then
           Begin
              If qry.Locate('IDCPUATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then
                 Application.MessageBox('Este Computador já está associado a um local de atendimento. Não é possível excluir','Aviso',Mb_IconInformation)
              Else
              Begin
                 If qryCpu.Locate('IDCPUATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then
                 Begin
                    qryCpu.Delete;
                    TreeLocalxCpu.Items.Delete(TreeLocalxCpu.Selected);
                 End;
              End;
           End
           Else
           Begin
              If qry.Locate('IDCPUATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then
              Begin
                qry.Delete;
                TreeLocalxCpu.Items.Delete(TreeLocalxCpu.Selected);
              End;
           End;
         End;
         4:
         Begin
           If QryLocal.Locate('IDLOCALATEND',LongInt(TreeLocalxCpu.Selected.Data^),[]) Then
           Begin
              QryLocal.Edit;
              QryLocalIDTIPOATEND.Clear;
              QryLocal.Post;
              TreeLocalxCpu.Items.Delete(TreeLocalxCpu.Selected);
           End;
         End;
       End;
     End;
end;

end.
