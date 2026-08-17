unit FCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, MAHlpBtn, StdCtrls, Buttons, uAutorizacao,
  ComCtrls, ToolWin, ExtCtrls, DBCtrls, Machklb, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, uDataBase, DBTables, Db, wwQuery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, FCadastro, TB97, uMensErro, TB97Ctls,
  TB97Tlbr, FCadastroCS, MontaSelect, IvDictio, IvMulti, IvEMulti,
  fcTreeView, DAutorizacao, CmEventosCadastro, ImgList;

type
  ETestaGrupoEror = Exception;
  
  TfrmCadGrupo = class(TfrmCadastroCS)
    Label2: TLabel;
    qryUsuario: TwwQuery;
    qryAcesso: TwwQuery;
    qryUsuarioAtu: TwwQuery;
    updUsuarioAtu: TUpdateSQL;
    qryAutorizaAtu: TwwQuery;
    updAutorizaAtu: TUpdateSQL;
    qryEspAcesso: TwwQuery;
    updEspAcesso: TUpdateSQL;
    dsAcesso: TwwDataSource;
    qryAutorizaAtuIDESPACESSO: TFloatField;
    qryAutorizaAtuIDOPERFUNC: TFloatField;
    qryAutorizaAtuIDPESSOA: TFloatField;
    qryAcessoChecado: TBooleanField;
    qryAcessoNOMEFUNCAO: TStringField;
    qryAcessoNOMEOPERACAO: TStringField;
    updAcesso: TUpdateSQL;
    qryAcessoIDFUNCAO: TFloatField;
    qryAcessoIDOPERACAO: TFloatField;
    qryAutorizaAtuIDOPERACAO: TFloatField;
    qryAutorizaAtuIDFUNCAO: TFloatField;
    dsUsuario: TwwDataSource;
    qryUsuarioIDUSUARIO: TFloatField;
    qryUsuarioNOMEUSUARIO: TStringField;
    qryUsuarioChecado: TBooleanField;
    updUsuario: TUpdateSQL;
    Panel1: TPanel;
    Label1: TLabel;
    dbUsuario: TwwDBEdit;
    Bevel1: TBevel;
    qryUsuarioNOME: TStringField;
    qryAcessoNOMEFUNCAOPAI: TStringField;
    qryAcessoIDFUNCAOPAI: TFloatField;
    GroupBox1: TGroupBox;
    Panel7: TPanel;
    btnInverter: TSpeedButton;
    btnTodas: TSpeedButton;
    BtnExpandirArvore: TSpeedButton;
    BtnFechaArvore: TSpeedButton;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    grdUsuario: TwwDBGrid;
    Splitter2: TSplitter;
    ImlTreeAutoriza: TImageList;
    ImlReports: TImageList;
    PgcAcesso: TPageControl;
    TbsSistema: TTabSheet;
    TbsRelatorios: TTabSheet;
    TreeReports: TfcTreeView;
    TreeAutoriza: TfcTreeView;
    qryIDESPACESSO: TFloatField;
    qryNOMEGRUPO: TStringField;
    qryIDGRUPO: TFloatField;
    qryEspAcessoIDESPACESSO: TFloatField;
    qryUsuarioAtuIDGRUPO: TFloatField;
    qryUsuarioAtuIDUSUARIO: TFloatField;
    TbsConsultas_Padrao: TTabSheet;
    TreeConsultas: TfcTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryAcessoCalcFields(DataSet: TDataSet);
    procedure qryAcessoChecadoChange(Sender: TField);
    procedure qryUsuarioCalcFields(DataSet: TDataSet);
    procedure qryUsuarioChecadoChange(Sender: TField);
    procedure btnInverterClick(Sender: TObject);
    procedure btnTodasClick(Sender: TObject);
    procedure TreeAutorizaToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure BtnExpandirArvoreClick(Sender: TObject);
    procedure BtnFechaArvoreClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    bMontandoArvore :Boolean;

    procedure AlteraLista(lAltera : boolean);
    procedure TestaNome;
    procedure MudaListas;
    procedure Grava(iTipo : integer);
    procedure MontaArvore;
    Procedure AtuAutorizaRpt;
    function ActiveTreeAutoriza: TFctreeView;
  public
    { Public declarations }
  protected
  end;

var
  frmCadGrupo: TfrmCadGrupo;

implementation
uses DBaseDados, uSistema;

{$R *.DFM}

procedure TfrmCadGrupo.AlteraLista(lAltera : boolean);
begin
  grdusuario.ReadOnly := not lAltera;
  TreeAutoriza.ReadOnly   := not lAltera;
  TreeReports.ReadOnly := not lAltera;
  DrawFundo;
  AutorizarForm(afSoDesabilitar);
end;


procedure TfrmCadGrupo.TestaNome;
begin
     if qryNOMEGRUPO.AsString = '' then
        Raise ETestaGrupoEror.Create('Nome do grupo não pode estar em branco');

     if FazQuery(dtmBaseDados.qry, 'SELECT IDGRUPO FROM GRUPOACESSO WHERE GRUPOACESSO.NOMEGRUPO = '''+
                                   qryNOMEGRUPO.AsString+'''') then
        Raise ETestaGrupoEror.Create('Nome do grupo já existe');
end;

procedure TfrmCadGrupo.MudaListas;
begin
     if qry.Active then
     begin
          with qryUsuarioAtu do
          begin
               ParamByName('IDGRUPO').Value := qryIDGRUPO.AsInteger;
               close;
               open;
          end;
          if qryUsuario.Active then
          begin
               qryUsuario.Last;
               qryusuario.First;
          end;

          with qryAutorizaAtu do
          begin
               ParamByName('IdEspAcesso').Value := qryIDESPACESSO.AsInteger;
               ParamByName('IdPessoa').Value := Sistema.IdEmpresa;
               ParamByName('IdModulo').Value := Sistema.IdModulo;
               close;
               Open;
          end;

          if qryAcesso.Active then MontaArvore;
     end;
end;

procedure TfrmCadGrupo.CmeCadastroEdit(Sender: TObject);
begin
   AlteraLista(True);
   inherited;
   PgcAcesso.ActivePage := TbsSistema;
end;

procedure TfrmCadGrupo.CmeCadastroInsert(Sender: TObject);
begin
   AlteraLista(true);
   qry.Append;
   dbUsuario.Setfocus;
   MudaListas;
   PgcAcesso.ActivePage := TbsSistema;
end;


procedure TfrmCadGrupo.CmeCadastroConfirma(Sender: TObject);
var iProxEspAcesso : integer;
begin
     Screen.Cursor := crHourGlass;
     Case CmeCadastro.Operacao of
     opInserir:
     begin
        try
           TestaNome;
           iProxEspAcesso := LeUltRegistro(nil, 'ESPACESS');
           qryEspAcesso.Append;
           qryEspAcessoIdEspAcesso.Value := iProxEspAcesso;
           qryEspAcesso.Post;

           qryIDGRUPO.Value := LeUltRegistro(nil, 'GRUPOACESSO');
           qryIDESPACESSO.Value := iProxEspAcesso;
           qry.Post;

           with qryUsuarioAtu do
           begin
              First;
              while not eof do
              begin
                 Edit;
                 FieldByName('IDGRUPO').Value := qryIDGRUPO.Value;
                 Post;
                 next;
              end;
           end;

           with qryAutorizaAtu do
           begin
              First;
              while not eof do
              begin
                 Edit;
                 FieldByName('IDESPACESSO').Value := iProxEspAcesso;
                 Post;
                 next;
              end;
           end;

           AtuAutorizaRpt;
           Grava(1);
           MudaListas;
           AlteraLista(false);
           Screen.Cursor := crDefault;
        except
           MsgDlg('Não consegui inserir.', 'Cadastro de usuarios',mtWarning , [mbOk,mbHelp], 0);
           Screen.Cursor := crDefault;
           Raise;
        end;
     end;
     opAlterar:
     Begin
        try
           AtuAutorizaRpt;
           Grava(2);
           MudaListas;
           AlteraLista(false);
           Screen.Cursor := crDefault;
        except
           MsgDlg('Não consegui alterar.', 'Cadastro de usuarios',mtWarning , [mbOk,mbHelp], 0);
           Screen.Cursor := crDefault;
           Raise;
        end;
     End;
     End;
end;

procedure TfrmCadGrupo.CmeCadastroDelete(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     try
        // Abre arquivo EspAcesso
        with qryEspAcesso do
        begin
             ParamByName('IdEspAcesso').Value := qryIDESPACESSO.AsInteger;
             Close;
             Open;
             Delete;
        end;

        // Abre arquivo de atualização de acesso
        with qryAutorizaAtu do
        begin
             ParamByName('IdEspAcesso').Value := qryIDESPACESSO.AsInteger;
             ParamByName('IdPessoa').Value := Sistema.IdEmpresa;
             ParamByName('IdModulo').Value := Sistema.IdModulo;
             close;
             Open;
             First;
             while not eof do
                   Delete;
        end;

        // Abre a query de atualizacao de grupos
        with qryUsuarioAtu do
        begin
             ParamByName('IdGrupo').Value := qryIDGRUPO.AsInteger;
             Close;
             Open;
             First;
             while not eof do
                   Delete;
        end;

        With DtmAutorizacao.QryAtuAutorizaRpt Do
        Begin
             If Active Then Close;
             If Not Prepared Then Prepare;
             ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
             ParamByName('IDESPACESSO').AsFloat := qryIDESPACESSO.AsInteger;
             ParamByName('IDMODULO').AsFloat := Sistema.IdModulo;             
             Open;
             while Not Eof Do
               Delete;
        End;

        With DtmAutorizacao.QryAtuAutorizaConsulta Do
        Begin
             If Active Then Close;
             If Not Prepared Then Prepare;
             ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
             ParamByName('IDESPACESSO').AsFloat := qryIDESPACESSO.AsInteger;
             ParamByName('IDMODULO').AsFloat := Sistema.IdModulo;
             Open;
             while Not Eof Do Delete;
        End;

        qry.Delete ;

        Grava(3);
     except
           MsgDlg('Não consegui excluir', 'Cadastro de usuarios',mtWarning , [mbOk,mbHelp], 0);
     end;

     Screen.Cursor := crDefault;
     sbtnApagar.down := false;
     MudaListas;
end;


procedure TfrmCadGrupo.FormCreate(Sender: TObject);
begin
     inherited;
     qryAcesso.Close;
     qryAutorizaAtu.Prepare;
     qryUsuarioAtu.Prepare;

     qry.Prepare;
     qry.Open;

     qryEspAcesso.Prepare ;
     qryEspAcesso.Open;

     if qry.IsEmpty then
        CmeCadastro.Operacao := opVazio
     else
         CmeCadastro.Operacao := opIdle;
     MudaListas;

     qryUsuario.Prepare;
     qryUsuario.Open;

     qryAcesso.ParamByName('IdModulo').Value := Sistema.IdModulo;
     qryAcesso.Prepare;
     qryAcesso.Open;

     MontaArvore;

     CmeCadastro.AtualizaBotoes(Self);

     PgcAcesso.ActivePage := TbsSistema;     
end;

procedure TfrmCadGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     qryAcesso.Close;
     qryAcesso.UnPrepare;
     inherited;
end;

procedure TfrmCadGrupo.Grava(iTipo : integer);
begin
     try
        if iTipo = 3 then // Exclusão
           AplicaAlteracoes([DtmAutorizacao.QryAtuAutorizaRpt, DtmAutorizacao.QryAtuAutorizaConsulta, qryAutorizaAtu, qryUsuarioAtu, qry, qryEspAcesso])
        else
            AplicaAlteracoes([qryEspAcesso, qry, qryUsuarioAtu, qryAutorizaAtu, DtmAutorizacao.QryAtuAutorizaRpt, DtmAutorizacao.QryAtuAutorizaConsulta]);
     except
           raise;
     end;
end;

procedure TfrmCadGrupo.CmeCadastroFind(Sender: TObject);
begin
     inherited;
    if MontaSelect.RetornouValor then
       with qry do
       begin
            ParamByName('IdGrupo').Value := StrToInt(MontaSelect.ValoresChave[0]);
            Close;
            Open;
            MudaListas;
       end;
end;

procedure TfrmCadGrupo.qryAcessoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryAutorizaAtu.Locate('IDFUNCAO;IDOPERACAO', vARaRRAYoF([DataSet.FieldByname('IDFUNCAO').AsInteger,DataSet.FieldByname('IDOPERACAO').AsInteger]),[]) then
     DataSet.FieldByname('CHECADO').Value := true
  else
     DataSet.FieldByname('CHECADO').Value := false;
end;

procedure TfrmCadGrupo.qryAcessoChecadoChange(Sender: TField);
begin
  inherited;
     with qryAutorizaAtu do
     begin
          if Locate('IDFUNCAO;IDOPERACAO', VarArrayOf([qryAcessoIDFUNCAO.AsInteger, qryAcessoIDOPERACAO.AsInteger]),[]) then
          begin
               Delete;
               while Locate('IDFUNCAO;IDOPERACAO', VarArrayOf([qryAcessoIDFUNCAO.AsInteger, qryAcessoIDOPERACAO.AsInteger]),[]) do
                     Delete;
          end
          else
          begin
               FazQuery(dtmBaseDados.qry, 'SELECT IDOPERFUNC FROM OPERFUNC '+
                                          'WHERE (IDMODULO = '+IntToStr(Sistema.IdModulo)+') AND '+
                                          '(IDOPERACAO = '+IntToStr(qryAcessoIDOPERACAO.AsInteger)+') AND '+
                                          '(IDFUNCAO = '+IntToStr(qryAcessoIDFUNCAO.AsInteger)+') ');

               dtmBaseDados.qry.first;
               while not dtmBaseDados.qry.eof do
               begin
                    Append;
                    FieldByName('IDESPACESSO').Value := qryIDESPACESSO.AsInteger;
                    FieldByName('IDOPERFUNC').Value  := dtmBaseDados.qry.FieldByName('IDOPERFUNC').AsInteger;
                    FieldByName('IDFUNCAO').Value    := qryAcessoIDFUNCAO.AsInteger;
                    FieldByName('IDOPERACAO').Value  := qryAcessoIDOPERACAO.AsInteger;
                    FieldByName('IDPESSOA').Value    := Sistema.IdEmpresa;
                    Post;
                    dtmBaseDados.qry.next;
               end;
          end;
     end;
end;

procedure TfrmCadGrupo.qryUsuarioCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryUsuarioAtu.Locate('IDUSUARIO', DataSet.FieldByname('IDUSUARIO').AsInteger,[]) then
     DataSet.FieldByname('CHECADO').Value := true
  else
     DataSet.FieldByname('CHECADO').Value := false;
end;

procedure TfrmCadGrupo.qryUsuarioChecadoChange(Sender: TField);
begin
  inherited;
     with qryUsuarioAtu do
     begin
          if Locate('IDUSUARIO', qryUsuarioIDUSUARIO.AsInteger,[]) then
          begin
               Delete;
          end
          else
          begin
               Append;
               FieldByName('IDGRUPO').Value := qryIDGRUPO.AsInteger;
               FieldByName('IDUSUARIO').Value  := qryUsuarioIDUSUARIO.AsInteger;
               Post;
          end;
     end;

     dsUsuario.Enabled := false;
     with qryUsuario do
     begin
          Prior;
          if bof then
          begin
               Next;
               if not eof then
                  Prior;
          end
          else
              Next;
     end;
     dsUsuario.Enabled := true;
end;

procedure TfrmCadGrupo.btnInverterClick(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  For X:=0 To ActiveTreeAutoriza.Items.Count - 1 Do
      If ActiveTreeAutoriza.Items[x].CheckboxType = tvctCheckBox Then
         ActiveTreeAutoriza.Items[x].Checked := Not ActiveTreeAutoriza.Items[x].Checked;
end;

procedure TfrmCadGrupo.btnTodasClick(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  For X:=0 To ActiveTreeAutoriza.Items.Count - 1 Do
      If ActiveTreeAutoriza.Items[x].CheckboxType = tvctCheckBox Then
         ActiveTreeAutoriza.Items[x].Checked := True;
end;

procedure TfrmCadGrupo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
     btnInverter.Enabled := (CmeCadastro.Operacao in [opInserir, opAlterar]);
     btnTodas.Enabled := (CmeCadastro.Operacao in [opInserir, opAlterar]);
     inherited;
     pnlFundo.Enabled := True;     
end;

procedure TfrmCadGrupo.TreeAutorizaToggleCheckbox(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
  inherited;
  If (Not bMontandoArvore) And
     (Not qryAcesso.IsEmpty) And
     qryAcesso.Locate('IDFUNCAO;IDOPERACAO',VarArrayOf([Node.StringData, Node.StringData2]),[]) Then
  Begin
        qryAcesso.Edit;
        qryAcessoChecado.AsBoolean := Node.Checked;
        qryAcesso.Post;
  End;

end;

procedure TfrmCadGrupo.BtnExpandirArvoreClick(Sender: TObject);
begin
  inherited;
  ActiveTreeAutoriza.FullExpand;
end;

procedure TfrmCadGrupo.BtnFechaArvoreClick(Sender: TObject);
begin
  inherited;
  ActiveTreeAutoriza.FullCollapse;
end;

procedure TfrmCadGrupo.MontaArvore;
Var
    iIdFuncaoPai, iIdFuncao: LongInt;
    TreePai, TreeFilho, TreeGrupo: TfcTreeNode;
Begin
  bMontandoArvore := True;

  iIdFuncaoPai := -1;
  iIdFuncao := -1;
  TreePai := nil;
  TreeGrupo := nil;

  TreeAutoriza.Items.Clear;

  qryAcesso.First;
  While Not qryAcesso.Eof Do
  Begin
     If iIdFuncaoPai <> qryAcessoIDFUNCAOPAI.AsInteger Then
     Begin
      If qryAcessoNOMEFUNCAOPAI.AsString = '' Then
         TreePai := TreeAutoriza.Items.Add(nil,qryAcessoNOMEFUNCAO.AsString)
      Else
         TreePai := TreeAutoriza.Items.Add(nil,qryAcessoNOMEFUNCAOPAI.AsString);
      TreePai.ImageIndex := 0;
      TreePai.SelectedIndex := 0;
      TreePai.StringData := qryAcessoIDFUNCAO.AsString;
      TreePai.StringData2 := qryAcessoIDOPERACAO.AsString;
     End;

     If iIdFuncao <> qryAcessoIDFUNCAO.AsInteger Then
     Begin
      TreeGrupo := TreeAutoriza.Items.AddChild(TreePai,qryAcessoNOMEFUNCAO.AsString);
      TreeGrupo.ImageIndex := 1;
      TreeGrupo.SelectedIndex := 1;
      TreeGrupo.StringData := qryAcessoIDFUNCAO.AsString;
      TreeGrupo.StringData2 := qryAcessoIDOPERACAO.AsString;
     End;

     TreeFilho := TreeAutoriza.Items.AddChild(TreeGrupo,qryAcessoNOMEOPERACAO.AsString);
     TreeFilho.ImageIndex := 2;
     TreeFilho.SelectedIndex := 2;
     TreeFilho.CheckboxType := tvctCheckBox;
     TreeFilho.Checked := qryAcessoCHECADO.AsBoolean;
     TreeFilho.StringData := qryAcessoIDFUNCAO.AsString;
     TreeFilho.StringData2 := qryAcessoIDOPERACAO.AsString;

     iIdFuncaoPai := qryAcessoIDFUNCAOPAI.AsInteger;
     iIdFuncao := qryAcessoIDFUNCAO.AsInteger;
     qryAcesso.Next;
  End;

  DtmAutorizacao.MontaArvoreRelatorio(TreeReports, Sistema.IdEmpresa, -1, Sistema.IdModulo, qryIDESPACESSO.AsInteger, True, False);
  DtmAutorizacao.MontaArvoreConsulta(TreeConsultas, Sistema.IdEmpresa, qryIDGRUPO.AsInteger, Sistema.IdModulo, qryIDESPACESSO.AsInteger, True, False);
  
  bMontandoArvore := False;
End;

Procedure TfrmCadGrupo.AtuAutorizaRpt;
Var
  X:Integer;
Begin
    With DtmAutorizacao.QryAtuAutorizaRpt Do
    Begin
         If Active Then Close;
         If Not Prepared Then Prepare;
         ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
         ParamByName('IDESPACESSO').AsFloat := qryIDESPACESSO.AsInteger;
         ParamByName('IDMODULO').AsFloat := Sistema.IdModulo;
         Open;
         
         while Not Eof Do Delete;

         For X:=0 To TreeReports.Items.Count - 1 Do
         Begin
            If TreeReports.Items[x].Checked Then
            Begin
               Append;
               FieldByName('IDREPORTS').AsInteger := StrToInt(TreeReports.Items[x].StringData);
               FieldByName('ORIGEMCM').AsInteger := StrToInt(TreeReports.Items[x].StringData2);
               FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
               FieldByName('IDESPACESSO').AsInteger := qryIDESPACESSO.AsInteger;
               Post;
            End;
         End;
    End;

    With DtmAutorizacao.QryAtuAutorizaConsulta Do
    Begin
         If Active Then Close;
         If Not Prepared Then Prepare;
         ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
         ParamByName('IDESPACESSO').AsFloat := qryIDESPACESSO.AsInteger;
         ParamByName('IDMODULO').AsFloat := Sistema.IdModulo;
         Open;

         while Not Eof Do Delete;

         For X:=0 To TreeConsultas.Items.Count - 1 Do
         Begin
            If TreeConsultas.Items[x].Checked Then
            Begin
               Append;
               FieldByName('IDMONTASELECT').AsInteger := StrToInt(TreeConsultas.Items[x].StringData);
               FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
               FieldByName('IDESPACESSO').AsInteger := qryIDESPACESSO.AsInteger;
               Post;
            End;
         End;
    End;
End;

procedure TfrmCadGrupo.CmeCadastroCancel(Sender: TObject);
Begin
   Inherited;
   if CmeCadastro.Operacao In [opInserir, OpAlterar] then
   Begin
      qry.CancelUpdates;
      AlteraLista(false);
      MudaListas;
      DrawFundo;
   End;
End;

function TfrmCadGrupo.ActiveTreeAutoriza: TFctreeView;
Begin
  Case PgcAcesso.ActivePage.PageIndex of
  0: Result := TreeAutoriza;
  1: Result := TreeReports;
  2: Result := TreeConsultas;
  Else
   Result := nil;
  End;
End;



end.

