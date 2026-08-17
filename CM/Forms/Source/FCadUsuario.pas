unit FCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, MAHlpBtn, StdCtrls, Buttons, uAutorizacao,
  ComCtrls, ToolWin, ExtCtrls, DBCtrls, Machklb, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, uDataBase, DBTables, Db, wwQuery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, FCadastro, TB97, uMensErro, TB97Ctls,
  TB97Tlbr, FCadastroCS, MontaSelect, IvDictio, IvMulti, IvEMulti,
  fcTreeView, dAutorizacao, uCripto, CmEventosCadastro, ImgList;

type
  ETestaUsuarioEror = Exception;

  TfrmCadUsuario = class(TfrmCadastroCS)
    qryGrupo: TwwQuery;
    qryAcesso: TwwQuery;
    qryPessoa: TwwQuery;
    FloatField3: TFloatField;
    StringField4: TStringField;
    MontaPessoa: TMontaSelect;
    updPessoa: TUpdateSQL;
    qryGrupoAtu: TwwQuery;
    updGrupoAtu: TUpdateSQL;
    qryAutorizaAtu: TwwQuery;
    updAutorizaAtu: TUpdateSQL;
    ImlTreeAutoriza: TImageList;
    qryPessoaFLGUSUARIO: TFloatField;
    qryEspAcesso: TwwQuery;
    updEspAcesso: TUpdateSQL;
    dsAcesso: TwwDataSource;
    qryAutorizaAtuIDESPACESSO: TFloatField;
    qryAutorizaAtuIDOPERFUNC: TFloatField;
    qryAutorizaAtuIDPESSOA: TFloatField;
    qryAcessoChecado: TBooleanField;
    qryAcessoNOMEFUNCAO: TStringField;
    qryAcessoNOMEOPERACAO: TStringField;
    qryAcessoIDFUNCAO: TFloatField;
    qryAcessoIDOPERACAO: TFloatField;
    qryAutorizaAtuIDOPERACAO: TFloatField;
    qryAutorizaAtuIDFUNCAO: TFloatField;
    qryPessoaTIPO: TStringField;
    dsGrupo: TwwDataSource;
    updGrupo: TUpdateSQL;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoNOMEGRUPO: TStringField;
    qryGrupoChecado: TBooleanField;
    qrySENHA: TStringField;
    qryIDESPACESSO: TFloatField;
    qryNOMEUSUARIO: TStringField;
    qryIDUSUARIO: TFloatField;
    qryNOME: TStringField;
    qryGrupoAtuIDGRUPO: TFloatField;
    qryGrupoAtuIDUSUARIO: TFloatField;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label4: TLabel;
    edNomePessoa: TwwDBEdit;
    dbUsuario: TwwDBEdit;
    Panel2: TPanel;
    Splitter1: TSplitter;
    btnNomePessoa: TSpeedButton;
    qryOperFunc: TwwQuery;
    qryAcessoIDFUNCAOPAI: TFloatField;
    qryAcessoNOMEFUNCAOPAI: TStringField;
    UpAcesso: TUpdateSQL;
    GroupBox1: TGroupBox;
    Panel7: TPanel;
    btnInverter: TSpeedButton;
    btnTodas: TSpeedButton;
    BtnExpandirArvore: TSpeedButton;
    BtnFechaArvore: TSpeedButton;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    grdGrupos: TwwDBGrid;
    Splitter2: TSplitter;
    Panel5: TPanel;
    PgcAcesso: TPageControl;
    TbsSistema: TTabSheet;
    TreeAutoriza: TfcTreeView;
    TbsRelatorios: TTabSheet;
    ImlReports: TImageList;
    TreeReports: TfcTreeView;
    TbsConsultas_Padrao: TTabSheet;
    TreeConsultas: TfcTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNomePessoaClick(Sender: TObject);
    procedure qryAcessoCalcFields(DataSet: TDataSet);
    procedure qryAcessoChecadoChange(Sender: TField);
    procedure qryGrupoCalcFields(DataSet: TDataSet);
    procedure qryGrupoChecadoChange(Sender: TField);
    procedure TreeAutorizaToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure BtnExpandirArvoreClick(Sender: TObject);
    procedure BtnFechaArvoreClick(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
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
  frmCadUsuario: TfrmCadUsuario;

implementation

uses DBaseDados, uSistema, uCmConectaBanco;

{$R *.DFM}

procedure TfrmCadUsuario.AlteraLista(lAltera : boolean);
begin
   grdGrupos.ReadOnly := not lAltera;
   TreeAutoriza.ReadOnly := not lAltera;
   TreeReports.ReadOnly := not lAltera;
   TreeConsultas.ReadOnly := not lAltera;
   edNomePessoa.Enabled := lAltera;
   btnNomePessoa.Enabled := lAltera;
   DrawFundo;
end; 

procedure TfrmCadUsuario.TestaNome;
begin
     if qry.FieldByname('NOMEUSUARIO').AsString = '' then
        Raise ETestaUsuarioEror.Create('Nome do usuario não pode estar em branco');

     if FazQuery(dtmBaseDados.qry, 'SELECT IDUSUARIO FROM USUARIOSISTEMA WHERE USUARIOSISTEMA."NOMEUSUARIO" = '''+
                                   qry.FieldByName('NOMEUSUARIO').AsString+'''') then
        Raise ETestaUsuarioEror.Create('Nome do usuario já existe');
end;

procedure TfrmCadUsuario.MudaListas;
begin
     if qry.Active then
     begin
          with qryGrupoAtu do
          begin
               ParamByName('IdUsuario').Value := qry.FieldByName('IDUSUARIO').AsInteger;
               Close;
               Open;
          end;

          with qryGrupo do
          begin
               if Active then
               begin
                    Last;
                    First;
               end;
          end;

          qryAutorizaAtu.ParamByName('IdEspAcesso').Value := qry.FieldByName('IDESPACESSO').AsInteger;
          qryAutorizaAtu.ParamByName('IdPessoa').Value := Sistema.IdEmpresa;
          qryAutorizaAtu.ParamByName('IdModulo').Value := Sistema.IdModulo;
          qryAutorizaAtu.close;
          qryAutorizaAtu.Open;

          if qryAcesso.Active then MontaArvore;
     end;
end;

procedure TfrmCadUsuario.CmeCadastroEdit(Sender: TObject);
begin
   AlteraLista(True);
   inherited;
   edNomePessoa.Enabled := false;
   btnNomePessoa.Enabled := false;
   PgcAcesso.ActivePage := TbsSistema;
end;

procedure TfrmCadUsuario.CmeCadastroInsert(Sender: TObject);
begin
   AlteraLista(True);
   inherited;
   PgcAcesso.ActivePage := TbsSistema;
   If dbUsuario.Canfocus Then dbUsuario.Setfocus;
   MudaListas;
end;

procedure TfrmCadUsuario.CmeCadastroConfirma(Sender: TObject);
var
   iProxPessoa, iProxEspAcesso : integer;
begin
   Screen.Cursor := crHourGlass;
   Case CmeCadastro.Operacao of
   opInserir:
     begin
          try
             TestaNome;
             with qryPessoa do
             begin
                  ParamByName('NOME').Value := edNomePessoa.Text;
                  Close;
                  Open;
                  if IsEmpty then
                  begin
                       iProxPessoa := LeUltRegistro(nil, 'PESSOA');
                       Append;
                       FieldByName('IDPESSOA').Value := iProxPessoa;
                       FieldByName('NOME').Value := edNomePessoa.Text;
                       FieldByName('FLGUSUARIO').Value := 1;
                       FieldByName('TIPO').Value := 'F';
                       Post;
                  end
                  else
                  begin
                       iProxPessoa := FieldByName('IDPESSOA').AsInteger;
                  end;
             end;

             iProxEspAcesso := LeUltRegistro(nil, 'ESPACESS');
             qryEspAcesso.Append;
             qryEspAcesso.FieldByName('IdEspAcesso').AsInteger := iProxEspAcesso;
             qryEspAcesso.Post;

             qry.FieldByname('IDUSUARIO').Value   := iProxPessoa;
             qry.FieldByname('SENHA').Value       := CriptografarHash('MUDESUASENHA',qryIDUSUARIO.AsInteger,15);
             qry.FieldByname('IDESPACESSO').Value := iProxEspAcesso;
             qry.Post;

             with qryGrupoAtu do
             begin
                  First;
                  while not eof do
                  begin
                       Edit;
                       FieldByName('IDUSUARIO').Value := iProxPessoa;
                       Post;
                       next;
                  end;
             end;

             qryAutorizaAtu.First;
             while not qryAutorizaAtu.eof do
             begin
                   qryAutorizaAtu.Edit;
                   qryAutorizaAtu.FieldByName('IDESPACESSO').Value := iProxEspAcesso;
                   qryAutorizaAtu.Post;
                   qryAutorizaAtu.next;
             end;

             AtuAutorizaRpt;
             Grava(1);
             Screen.Cursor := crDefault;
             MudaListas;
             AlteraLista(false);
          except
             Screen.Cursor := crDefault;
             Raise;
          end;
     end;
   opAlterar:
     Begin
        try
          AtuAutorizaRpt;
          Grava(2);
          Screen.Cursor := crDefault;
          MudaListas;
          AlteraLista(false);
        except
          Screen.Cursor := crDefault;
          Raise;
        end;
     End;
   End;
end;

procedure TfrmCadUsuario.CmeCadastroDelete(Sender: TObject);
var susuario : string;
begin
     if qry.FieldByName('IDUSUARIO').AsInteger = Sistema.IdUsuario then
        MsgDlg('Não é possivel excluir o usuario atualmente "Logado"', 'Cadastro de usuarios',mtWarning , [mbOk,mbHelp], 0)
     else
     begin
          Screen.Cursor := crHourGlass;
          try
             // Abre arquivo EspAcesso
             with qryEspAcesso do
             begin
                  ParamByName('IdEspAcesso').Value := qry.FieldByName('IDESPACESSO').AsInteger;
                  Close;
                  Open;
                  Delete;
             end;

             // Abre arquivo de atualização de acesso
             with qryAutorizaAtu do
             begin
                  ParamByName('IdEspAcesso').Value := qry.FieldByName('IDESPACESSO').AsInteger;
                  ParamByName('IdPessoa').Value := Sistema.IdEmpresa;
                  ParamByName('IdModulo').Value := Sistema.IdModulo;
                  close;
                  Open;
                  First;
                  while not eof do
                        Delete;
             end;

             // Abre a query de atualizacao de grupos
             with qryGrupoAtu do
             begin
                  ParamByName('IdUsuario').Value := qry.FieldByName('IDUSUARIO').AsInteger;
                  Close;
                  Open;
                  First;
                  while not eof do
                        Delete;
             end;
             sUsuario := qry.FieldByName('IDUSUARIO').AsString;
             qry.Delete ;

             //Exclui Autorizaçao de Relatórios
             With DtmAutorizacao.QryAtuAutorizaRpt Do
             Begin
                  If Active Then Close;
                  If Not Prepared Then Prepare;
                  ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
                  ParamByName('IDESPACESSO').AsFloat := qryIDESPACESSO.AsInteger;
                  ParamByName('IDMODULO').AsFloat := Sistema.IdModulo;
                  Open;
                  while Not Eof Do Delete;
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

             Grava(3);

             try
                ExecutarQuery(dtmBaseDados.qry, 'DROP USER CM'+sUsuario);
             except

             end;
         except
               MsgDlg('Não consegui excluir', 'Cadastro de usuarios',mtWarning , [mbOk,mbHelp], 0);
         end;
         Screen.Cursor := crDefault;
     end;
     sbtnApagar.down := false;
     MudaListas;
end;


procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
     inherited;
     qryAcesso.Close;
     qryAutorizaAtu.Prepare;
     qryGrupoAtu.Prepare;

     qry.Prepare;
     qry.ParamByName('Idusuario').Value := -1;
     qry.Open;

     qryPessoa.Prepare;

     qryEspAcesso.Prepare ;
     qryEspAcesso.Open;

     if qry.IsEmpty then
        CmeCadastro.Operacao := opVazio
     else
         CmeCadastro.Operacao := opIdle;
     MudaListas;

     qryGrupo.Prepare;
     qryGrupo.Open;

     qryAcesso.ParamByName('IdModulo').Value := Sistema.IdModulo;
     qryAcesso.Prepare;
     qryAcesso.Open;

     MontaArvore;

     CmeCadastro.AtualizaBotoes(Self);

     PgcAcesso.ActivePage := TbsSistema;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   If qryAcesso.Active Then
   Begin
     qryAcesso.Close;
     If qryAcesso.Prepared Then qryAcesso.UnPrepare;
   End;
   
   inherited;
end;

procedure TfrmCadUsuario.btnNomePessoaClick(Sender: TObject);
begin
  inherited;
  MontaPessoa.Executar ;
  try
     if (Montapessoa.RetornouValor) then
         qry.FieldByName('NOME').Value := Montapessoa.ValoresChave[0];
  except end;
end;

procedure TfrmCadUsuario.Grava(iTipo : integer);
begin
     try
        if not qryPessoa.Active then
           qryPessoa.Open;

        if iTipo = 3 then // Exclusão
        begin
             AplicaAlteracoes([DtmAutorizacao.QryAtuAutorizaRpt, DtmAutorizacao.QryAtuAutorizaConsulta, qryAutorizaAtu, qryGrupoAtu, qry, qryEspAcesso, qryPessoa]);
        end
        else
        begin
             AplicaAlteracoes([qryPessoa, qryEspAcesso, qry, qryGrupoAtu, qryAutorizaAtu, DtmAutorizacao.QryAtuAutorizaRpt,  DtmAutorizacao.QryAtuAutorizaConsulta]);

             if iTipo = 1 then // Inserção
                CmConectaBanco.CriaUsuario(qryIDUSUARIO.AsString,qryNOMEUSUARIO.AsString)
             Else
                If dbUsuario.Modified Then
                   CmConectaBanco.AlteraUsuario(qryIDUSUARIO.AsString,qryNOMEUSUARIO.AsString);
        end;
     except
           raise;
     end;
end;

procedure TfrmCadUsuario.CmeCadastroFind(Sender: TObject);
begin
     inherited;
     try
        if (MontaSelect.RetornouValor) then
           with qry do
           begin
                ParamByName('IdUsuario').Value := StrToInt(MontaSelect.ValoresChave[0]);
                Close;
                Open;
                MudaListas;
           end;
     except end;
end;

procedure TfrmCadUsuario.qryAcessoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryAutorizaAtu.Locate('IDFUNCAO;IDOPERACAO', VarArrayOf([DataSet.FieldByname('IDFUNCAO').AsInteger,DataSet.FieldByname('IDOPERACAO').AsInteger]),[]) then
     DataSet.FieldByname('CHECADO').Value := true
  else
     DataSet.FieldByname('CHECADO').Value := false;
end;

procedure TfrmCadUsuario.qryAcessoChecadoChange(Sender: TField);
begin
  inherited;
     with qryAutorizaAtu do
     begin
          if Locate('IDFUNCAO;IDOPERACAO', VarArrayOf([qryAcesso.FieldByname('IDFUNCAO').AsInteger, qryAcesso.FieldByname('IDOPERACAO').AsInteger]),[]) then
          begin
               Delete;
               while Locate('IDFUNCAO;IDOPERACAO', VarArrayOf([qryAcesso.FieldByname('IDFUNCAO').AsInteger, qryAcesso.FieldByname('IDOPERACAO').AsInteger]),[]) do
                     Delete;
          end
          else
          begin
               FazQuery(dtmBaseDados.qry, 'SELECT IDOPERFUNC FROM OPERFUNC '+
                                          'WHERE (IDMODULO = '+IntToStr(Sistema.IdModulo)+') AND '+
                                          '(IDOPERACAO = '+IntToStr(qryAcesso.FieldByname('IDOPERACAO').AsInteger)+') AND '+
                                          '(IDFUNCAO = '+IntToStr(qryAcesso.FieldByname('IDFUNCAO').AsInteger)+') ');

               dtmBaseDados.qry.first;
               while not dtmBaseDados.qry.eof do
               begin
                    Append;
                    FieldByName('IDESPACESSO').Value := qry.FieldByName('IDESPACESSO').AsInteger;
                    FieldByName('IDOPERFUNC').Value  := dtmBaseDados.qry.FieldByName('IDOPERFUNC').AsInteger;
                    FieldByName('IDFUNCAO').Value    := qryAcesso.FieldByName('IDFUNCAO').AsInteger;
                    FieldByName('IDOPERACAO').Value  := qryAcesso.FieldByName('IDOPERACAO').AsInteger;
                    FieldByName('IDPESSOA').Value    := Sistema.IdEmpresa;
                    Post;
                    dtmBaseDados.qry.next;
               end;
          end;
     end;
end;

procedure TfrmCadUsuario.qryGrupoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryGrupoAtu.Locate('IDGRUPO', DataSet.FieldByname('IDGRUPO').AsInteger,[]) then
     DataSet.FieldByname('CHECADO').Value := true
  else
     DataSet.FieldByname('CHECADO').Value := false;

end;

procedure TfrmCadUsuario.qryGrupoChecadoChange(Sender: TField);
begin
  inherited;
     with qryGrupoAtu do
     begin
          if Locate('IDGRUPO', qryGrupo.FieldByname('IDGRUPO').AsInteger,[]) then
             Delete
          else
          begin
               Append;
               FieldByName('IDGRUPO').Value   := qryGrupo.FieldByname('IDGRUPO').AsInteger;
               FieldByName('IDUSUARIO').Value := qry.FieldByName('IDUSUARIO').AsInteger;
               Post;
          end;
     end;

     dsGrupo.Enabled := false;
     with qryGrupo do
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
     dsGrupo.Enabled := true;
end;

procedure TfrmCadUsuario.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  btnInverter.Enabled := (CmeCadastro.Operacao in [opInserir, opAlterar]);
  btnTodas.Enabled := (CmeCadastro.Operacao in [opInserir, opAlterar]);
  inherited;
  pnlFundo.Enabled := True;
end;

procedure TfrmCadUsuario.MontaArvore;
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

  DtmAutorizacao.MontaArvoreRelatorio(TreeReports, Sistema.IdEmpresa, qryIDUSUARIO.AsInteger, Sistema.IdModulo, qryIDESPACESSO.AsInteger, True, False);
  DtmAutorizacao.MontaArvoreConsulta(TreeConsultas, Sistema.IdEmpresa, qryIDUSUARIO.AsInteger, Sistema.IdModulo, qryIDESPACESSO.AsInteger, True, False);

  bMontandoArvore := False;
End;

procedure TfrmCadUsuario.TreeAutorizaToggleCheckbox(
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

function TfrmCadUsuario.ActiveTreeAutoriza: TFctreeView;
Begin
  Case PgcAcesso.ActivePage.PageIndex of
  0: Result := TreeAutoriza;
  1: Result := TreeReports;
  2: Result := TreeConsultas;
  Else
   Result := nil;
  End;
End;

procedure TfrmCadUsuario.btnTodasClick(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  For X:=0 To ActiveTreeAutoriza.Items.Count - 1 Do
      If ActiveTreeAutoriza.Items[x].CheckboxType = tvctCheckBox Then
         ActiveTreeAutoriza.Items[x].Checked := True;
end;

procedure TfrmCadUsuario.btnInverterClick(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  For X:=0 To ActiveTreeAutoriza.Items.Count - 1 Do
      If ActiveTreeAutoriza.Items[x].CheckboxType = tvctCheckBox Then
         ActiveTreeAutoriza.Items[x].Checked := Not ActiveTreeAutoriza.Items[x].Checked;
end;

procedure TfrmCadUsuario.BtnExpandirArvoreClick(Sender: TObject);
begin
  inherited;
  ActiveTreeAutoriza.FullExpand;
end;

procedure TfrmCadUsuario.BtnFechaArvoreClick(Sender: TObject);
begin
  inherited;
  ActiveTreeAutoriza.FullCollapse;
end;

Procedure TfrmCadUsuario.AtuAutorizaRpt;
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

procedure TfrmCadUsuario.CmeCadastroCancel(Sender: TObject);
Begin
   Inherited;
   if (CmeCadastro.Operacao In [opInserir, OpAlterar]) And Qry.Active then
   Begin
      qry.CancelUpdates;
      AlteraLista(false);
      MudaListas;
      DrawFundo;
   End;
End;

end.

