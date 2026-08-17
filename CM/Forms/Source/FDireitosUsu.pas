unit FDireitosUsu;
{--------------------------------------------------------------------------------
 Data      : 14.07.2006
 Pendência : 20974
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Rotina    : MontaArvore
 Descrição : Nova montagem da Árvore de Autorização (TreeViewAutoriza) em níveis
             e subníveis.
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcTreeView, ComCtrls, Mask, wwdbedit, Db,
  DBTables, Wwquery, ImgList;


type
  TFrmDireitosUsu = class(TfrmOkCancelar)
    ImlTreeAutoriza: TImageList;
    ImlReports: TImageList;
    PgcAcesso: TPageControl;
    TbsSistema: TTabSheet;
    TreeAutoriza: TfcTreeView;
    TbsRelatorios: TTabSheet;
    TreeReports: TfcTreeView;
    TbsConsultas_Padrao: TTabSheet;
    TreeConsultas: TfcTreeView;
    Panel7: TPanel;
    btnInverter: TSpeedButton;
    btnTodas: TSpeedButton;
    BtnExpandirArvore: TSpeedButton;
    BtnFechaArvore: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    DbEdNome: TwwDBEdit;
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure BtnExpandirArvoreClick(Sender: TObject);
    procedure BtnFechaArvoreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    iIdusuario, iIdEspAcesso: Integer;
    bDireitosUsuario, bdireto: Boolean;
    sDirFontes : String;
    function ActiveTreeAutoriza: TFctreeView;
    function NomeFuncao(s:string):string;
    procedure MontaArvore;
  public
    { Public declarations }
    Constructor Create(Idusuario, IdEspAcesso :Integer; bUsuArio :Boolean; AOwner: TComponent); reintroduce;
  end;

implementation

Uses uSistema, DAutorizacao, fUserManager, uDatabase, uMensErro, uFormManager,
     fCadUsuarioNew, uCtrlGrupoUsu;

procedure TFrmDireitosUsu.MontaArvore;
Var
   iIdFuncaoPai, iIdFuncao: LongInt;
   lHabilita : Boolean;    
   i: LongInt;

   TreePai, TreeFilho, TreeOperacao: TfcTreeNode;
   bAchou: Boolean;
   bMenuPrincipal: boolean;
   bTemOperacao: boolean;
   bInsereNaArvore: boolean;


Begin
  With FrmUserManager Do Begin
       TreeAutoriza.Items.Clear;

      {** Nova Montagem do TreeView em níveis **}
       // Rotina Original de carga
       iIdFuncaoPai := -1;
       iIdFuncao    := -1;
       TreePai      := nil;

       SqlAutorizaAtu.Prepare;
       SqlAutorizaAtu.ParamByName( 'IdModulo' ).AsInteger    := Sistema.IdModulo;
       SqlAutorizaAtu.ParamByName( 'IdPessoa' ).AsInteger    := Sistema.IdEmpresa;
       SqlAutorizaAtu.ParamByName( 'IdEspAcesso' ).AsInteger := iIdEspAcesso;
       SqlAutorizaAtu.Open;

       With CdsAcesso Do Begin
            If Active Then Close;

            SqlAcesso.Prepare;
            SqlAcesso.ParamByName( 'IdModulo' ).AsInteger := Sistema.IdModulo;
            SqlAcesso.Open;

            While Not Eof Do Begin
               //Pega o Idfuncaopai para pesquisa posterior(logo abaixo) na TreeView
               If FieldByName('IDFUNCAOPAI').AsInteger <> iidFuncaoPai Then Begin
                  iIdFuncaoPai := FieldByName('IDFUNCAOPAI').AsInteger;
                  bAchou := False;
                  i := 0;

                  //Esta pesquisa verifica se o nó pai já está na Treeview
                  While ( Not bAchou ) And ( i < TreeAutoriza.Items.Count ) Do Begin
                           If Integer( TreeAutoriza.Items[ i ].Data ) = iIdFuncaoPai Then Begin
                              bAchou := True;
                              TreePai := TreeAutoriza.Items[ i ];
                           End Else
                              Inc( i );
                     End;
                  End;

                  lHabilita := True;
                  bInsereNaArvore := True;

                  if (((FieldByName( 'NOMEFUNCAO' ).AsString = 'Usuários') or
                     (FieldByName( 'NOMEFUNCAO' ).AsString = 'Propriedades do Usuario') ) and
                     ((FieldByName( 'NOMEFUNCAO' ).AsString = 'Direitos') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Novo') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Propriedades') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Excluir') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Grupos') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Tabelas') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Visões') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Centro de Custo X Cargo X Funcao X Grupo') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Esconder Usuários Desabilitados') or
                      (FieldByName( 'NOMEFUNCAO' ).AsString = 'Mostrar Usuários Desabilitados'))) Then Begin
                     if Sistema.IdUsuario <= 0 Then  // Só abrir para Super Usuário
                       lhabilita :=true
                     else
                       lHabilita := CdsAutorizaAtu.Locate( 'IDFUNCAO;IDOPERACAO',
                                    VarArrayOf( [ FieldByname( 'IDFUNCAO' ).AsInteger,
                                    FieldByname( 'IDOPERACAO' ).AsInteger ] ), [] );
                  end;

                  if (lHabilita) then
                  begin
                     if TreePai <> nil then
                     begin
                       TreePai.ImageIndex    := 0;
                       TreePai.SelectedIndex := 0;
                     end;

                     TreeFilho := TreeAutoriza.Items.AddChildObject(
                                         TreePai,
                                         FieldByName( 'NOMEFUNCAO' ).AsString,
                                         TObject(FieldByName('IDFUNCAO').AsInteger)
                                         );

                     TreeFilho.ImageIndex    := 1;
                     TreeFilho.SelectedIndex := 1;
                     iIdFuncao := FieldByName( 'IDFUNCAO' ).AsInteger;

                     if frmUserManager.cdsOperFunc.Active then
                        frmUserManager.cdsOperFunc.Close;

                     SqlOperFunc.Prepare;
                     SqlOperFunc.ParamByName( 'Idfuncao' ).AsInteger := iIdFuncao;
                     SqlOperFunc.ParamByName( 'IdModulo' ).AsInteger := Sistema.IdModulo;
                     SqlOperFunc.ParamByName( 'IdOperacao' ).Clear;

                     frmUserManager.SqlOperFunc.Open;

                     cdsOperFunc.First;
                     while not cdsOperFunc.Eof do
                     begin
                        TreeOperacao  := TreeAutoriza.Items.AddChildObject(
                                                 TreeFilho,
                                                 cdsOperFunc.FieldByName('NomeOperacao').AsString,
                                                 TObject(cdsOperFunc.FieldByName('IdOperacao').AsInteger)
                                                 );

                        TreeOperacao.ImageIndex    := 2;
                        TreeOperacao.SelectedIndex := 2;
                        TreeOperacao.CheckboxType  := tvctCheckBox;

                        TreeOperacao.Checked       := CdsAutorizaAtu.Locate( 'IDFUNCAO;IDOPERACAO',
                                                      VarArrayOf( [ cdsOperFunc.FieldByname( 'IDFUNCAO' ).AsInteger,
                                                                    cdsOperFunc.FieldByname( 'IDOPERACAO' ).AsInteger ] ), [] );
                        TreeOperacao.StringData  := inttostr(iIdFuncao);
                        TreeOperacao.StringData2 := cdsOperFunc.FieldByName('IdOperacao').AsString;


                        cdsOperFunc.Next;
                     end;
                  end;
                  Next;
            End;
       End;

       DtmAutorizacao.MontaArvoreRelatorio( TreeReports, Sistema.IdEmpresa, -1, Sistema.IdModulo, iIdEspAcesso, True, False );
       DtmAutorizacao.MontaArvoreConsulta( TreeConsultas, Sistema.IdEmpresa, -1, Sistema.IdModulo, iIdEspAcesso, True, False );
  End;

End;

{$R *.DFM}

function TFrmDireitosUsu.ActiveTreeAutoriza: TFctreeView;
Begin
  Case PgcAcesso.ActivePage.PageIndex of
       0: Result := TreeAutoriza;
       1: Result := TreeReports;
       2: Result := TreeConsultas;
       Else
          Result := nil;
  End;
End;

procedure TFrmDireitosUsu.btnTodasClick(Sender: TObject);
Var
  x: Integer;
begin
  inherited;
  For x := 0 To ActiveTreeAutoriza.Items.Count - 1 Do
      If ActiveTreeAutoriza.Items[ x ].CheckboxType = tvctCheckBox Then
         ActiveTreeAutoriza.Items[ x ].Checked := True;
end;

procedure TFrmDireitosUsu.btnInverterClick(Sender: TObject);
Var
  x: Integer;
begin
  inherited;
  For x := 0 To ActiveTreeAutoriza.Items.Count - 1 Do
      If ActiveTreeAutoriza.Items[ x ].CheckboxType = tvctCheckBox Then
         ActiveTreeAutoriza.Items[ x ].Checked := Not ActiveTreeAutoriza.Items[ x ].Checked;
end;

procedure TFrmDireitosUsu.BtnExpandirArvoreClick(Sender: TObject);
begin
  inherited;
  ActiveTreeAutoriza.FullExpand;
end;

procedure TFrmDireitosUsu.BtnFechaArvoreClick(Sender: TObject);
begin
  inherited;
  ActiveTreeAutoriza.FullCollapse;
end;

Constructor TFrmDireitosUsu.Create(Idusuario, IdEspAcesso: Integer; bUsuario: Boolean; AOwner: TComponent);
Begin
   Inherited Create(AOwner);
   bdireto := ( UpperCase( AOwner.Name ) = 'FRMUSERMANAGER' );
   bDireitosUsuario := bUsuario;
   iIdusuario       := Idusuario;
   iIdEspAcesso     := IdEspAcesso;

   If bUsuario Then Begin
      Self.Caption := 'Direitos do Usuário';

      If bdireto Then
      Begin
         FrmUserManager.SqlUsuario.Prepare;
         FrmUserManager.SqlUsuario.ParamByName( 'idusuario' ).AsInteger := iidusuario;
         FrmUserManager.SqlUsuario.Open;
      End;

      DbEdNome.DataSource := FrmUserManager.dsUsuario;
      DbEdNome.DataField  := 'NOMEUSUARIO';
   End Else Begin
      Self.Caption := 'Direitos do Grupo';

      If bdireto Then
      Begin
         FrmUserManager.SqlGrupo.Prepare;
         FrmUserManager.SqlGrupo.ParamByName( 'idgrupo' ).AsInteger := iidusuario;
         FrmUserManager.SqlGrupo.Open;
      End;

      DbEdNome.DataSource := FrmUserManager.dsGrupo;
      DbEdNome.DataField  := 'NOMEGRUPO';
   End;

   MontaArvore();

   // Aba da TreeAutoriza
   pgcAcesso.ActivePageIndex := 0;
End;

procedure TFrmDireitosUsu.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  x: Integer;
begin
  inherited;
  If ModalResult = MrOk Then Begin
     Try
        With FrmUserManager, CdsAutorizaAtu Do
             For x := 0 To TreeAutoriza.Items.Count - 1 Do
                 If TreeAutoriza.Items[ x ].CheckboxType = tvctCheckBox Then
                    If Locate( 'IDFUNCAO;IDOPERACAO',
                               VarArrayOf( [ StrToInt( TreeAutoriza.Items[ x ].StringData ),
                                             StrToInt( TreeAutoriza.Items[ x ].StringData2 ) ] ), [] ) Then Begin
                       If Not TreeAutoriza.Items[ x ].Checked Then Begin
                          Repeat
                                Delete;
                          Until Not Locate( 'IDFUNCAO;IDOPERACAO',
                                VarArrayOf( [ StrToInt( TreeAutoriza.Items[ x ].StringData ),
                                              StrToInt( TreeAutoriza.Items[ x ].StringData2 ) ] ), [] );
                       End;
                    End Else Begin
                       If TreeAutoriza.Items[ x ].Checked Then
                       Begin
                          SqlOperFunc.ParamByName( 'IdModulo' ).AsInteger   := Sistema.IdModulo;
                          SqlOperFunc.ParamByName( 'IdFuncao' ).AsInteger   := StrToInt( TreeAutoriza.Items[ x ].StringData );
                          SqlOperFunc.ParamByName( 'IdOperacao' ).AsInteger := StrToInt( TreeAutoriza.Items[ x ].StringData2 );
                          SqlOperFunc.Open;

                          While Not CdsOperFunc.Eof Do Begin
                                Append;
                                FieldByName( 'IDESPACESSO' ).AsInteger := iIdEspAcesso;
                                FieldByName( 'IDFUNCAO' ).AsInteger    := StrToInt( TreeAutoriza.Items[ x ].StringData );
                                FieldByName( 'IDOPERACAO' ).AsInteger  := StrToInt( TreeAutoriza.Items[ x ].StringData2 );
                                FieldByName( 'IDPESSOA' ).AsInteger    := Sistema.IdEmpresa;
                                FieldByName( 'IDOPERFUNC' ).AsInteger  := CdsOperFunc.FieldByName( 'IDOPERFUNC' ).AsInteger;
                                Post;
                                CdsOperFunc.Next;
                          End;
                       End;
                    End;

        With FrmUserManager, CdsAtuAutorizaRpt Do
        Begin
             SQLAtuAutorizaRpt.Prepare;
             SQLAtuAutorizaRpt.ParamByName( 'IdEmpresa' ).AsInteger   := Sistema.IdEmpresa;
             SQLAtuAutorizaRpt.ParamByName( 'IdEspAcesso' ).AsInteger := iIdEspAcesso;
             SQLAtuAutorizaRpt.Open;

             For x := 0 To TreeReports.Items.Count - 1 Do
                 If TreeReports.Items[ x ].CheckboxType = tvctCheckBox Then
                    If Locate( 'IDREPORTS;ORIGEMCM',
                               VarArrayOf( [ StrToFloat( TreeReports.Items[ x ].StringData ),
                                             StrToFloat( TreeReports.Items[ x ].StringData2 ) ] ), [] ) Then Begin
                       If Not TreeReports.Items[ x ].Checked Then Begin
                          Delete;
                       End;
                    End Else Begin
                       If TreeReports.Items[ x ].Checked Then Begin
                          Append;
                          FieldByName( 'IDESPACESSO' ).AsInteger := iIdEspAcesso;
                          FieldByName( 'IDEMPRESA' ).AsInteger   := Sistema.IdEmpresa;
                          FieldByName( 'IDREPORTS' ).AsFloat     := StrToFloat( TreeReports.Items[ x ].StringData );
                          FieldByName( 'ORIGEMCM' ).AsFloat      := StrToFloat( TreeReports.Items[ x ].StringData2 );
                          Post;
                       End;
                    End;
        End;

        With FrmUserManager, CdsAtuAutorizaConsulta Do
        Begin
             SqlAtuAutorizaConsulta.Prepare;
             SqlAtuAutorizaConsulta.ParamByName( 'IdEmpresa' ).AsInteger   := Sistema.IdEmpresa;
             SqlAtuAutorizaConsulta.ParamByName( 'IdEspAcesso' ).AsInteger := iIdEspAcesso;
             SqlAtuAutorizaConsulta.Open;

             For x := 0 To TreeConsultas.Items.Count - 1 Do
                 If TreeConsultas.Items[ x ].CheckboxType = tvctCheckBox Then
                    If Locate( 'IDMONTASELECT', StrToFloat( TreeConsultas.Items[ x ].StringData ), [] ) Then Begin
                       If Not TreeConsultas.Items[ x ].Checked Then Begin
                          Delete;
                       End;
                    End Else Begin
                       If TreeConsultas.Items[ x ].Checked Then Begin
                          Append;
                          FieldByName( 'IDESPACESSO' ).AsInteger := iIdEspAcesso;
                          FieldByName( 'IDEMPRESA' ).AsInteger   := Sistema.IdEmpresa;
                          FieldByName( 'IDMONTASELECT' ).AsFloat := StrToFloat( TreeConsultas.Items[ x ].StringData );
                          Post;
                       End;
                    End;
        End;

        With FrmUserManager Do
             If bdireto Then
             Begin
                If Not GrupoUsu.ProcessaGrupoUsu(null, null, null, null, null, null, null, CdsAutorizaAtu.Data, CdsAtuAutorizaRpt.Data, CdsAtuAutorizaConsulta.Data, OpSoDireitos) Then
                Begin
                   MsgDlg(GrupoUsu.MessageInfo, 'Atenção', mtError, [MbOk], 0);
                   Abort;
                End;
             End;

     Except
        On Exception Do
           MsgDlg( 'Não foi possível alterar os direitos do usuário.',
                   'Direitos do Usuário', mtError, [ mbOk, mbHelp ], 0 );
     End;
  End
  Else
     With FrmUserManager Do
          If bdireto Then
          Begin
             If CdsAutorizaAtu.ChangeCount > 0 Then
                CdsAutorizaAtu.CancelUpdates;

             If CdsAtuAutorizaRpt.ChangeCount > 0 Then
                CdsAtuAutorizaRpt.CancelUpdates;

             If CdsAtuAutorizaConsulta.ChangeCount > 0 Then
                CdsAtuAutorizaConsulta.CancelUpdates;
          End;

  If bdireto Then
  Begin
     FrmUserManager.CdsAutorizaAtu.Close;
     FrmUserManager.CdsAtuAutorizaRpt.Close;
     FrmUserManager.CdsAtuAutorizaConsulta.Close;

     If bDireitosUsuario Then
        FrmUserManager.CdsUsuario.Close
     Else
        FrmUserManager.CdsGrupo.Close;
  End;
end;


function TFrmDireitosUsu.NomeFuncao(s: string): string;
var
  i: integer;
begin
  Result := '';
  if Copy(s,1,1) <> '-' then
     for i := 1 to length(s) do
         if (Copy(s,i,1) <>'&') and (Copy(s,i,1) <>'''') then
            Result := Result +Copy(s,i,1);
end;

end.
