//******************************************************************************
// Numero WO     : 11692
// Data Alteração: 25.06.2024
// Responsável   : Edilaine
// Descrição     : conceder/revogar acesso apenas para o usuário indicado
//******************************************************************************
// Nº SOL: 268414
// Nº KINTANA/PPM: 1256276
// Data da Alteração: 29.01.2016
// Responsável: Michelle Suellyn Mota
// Descrição: ERRO - mensagens de erro ao manipular grupos, conceder permissão
// direitos, visões, tabelas - Cadastro de Usuários.
//******************************************************************************
// Atualizado por: andre tavares - pendência 15759 - 13/10/2004 -
// Restrição na inclusão de usuários que não forem do mesmo Centro de Custo X Cargo X Função 

unit fCadGrupoNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, ComCtrls, Db, DBTables, Wwquery,
  ImgList, uMensErro, uDatabase, DBClient, uCMClientDataSet, uCmSqlParams,
  usistema, uCmTypes;

type
  TfrmCadGrupoNew = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    DbEdNome: TwwDBEdit;
    DbEdDescricao: TwwDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    LstMembrosUsu: TListView;
    ImlImages: TImageList;
    LstNaoMembrosUsu: TListView;
    BtnAdd: TSpeedButton;
    BtnAddAll: TSpeedButton;
    BtnDelAll: TSpeedButton;
    BtnDel: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BtnDireitos: TBitBtn;
    sqlVerifRelac: TCMSqlParams;
    cdsVerifRelac: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnDireitosClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoNew: TfrmCadGrupoNew;

implementation

Uses fUserManager, FDireitosUsu, fCadUsuarioNew, uCtrlGrupoUsu;

{$R *.DFM}

procedure TfrmCadGrupoNew.FormCreate(Sender: TObject);
Var
  i, iProxGrupo, iProxEspAcesso: Integer;
  lstItem: TListItem;
begin
  inherited;
  With FrmUserManager, CdsGrupo Do
  Begin
       DbEdNome.DataSource      := DsGrupo;
       DbEdDescricao.DataSource := DsGrupo;
       LstNaoMembrosUsu.Items.Assign( FrmUserManager.lstUsuario.items );
       LstMembrosUsu.Items.Clear;

       If Active Then
          Close;

       If bnovo Then
       Begin
          iProxEspAcesso := -1;

          iProxGrupo := -1;

          SqlGrupo.Prepare;
          SqlGrupo.ParamByName( 'IdGrupo' ).AsInteger := 0;
          SqlGrupo.Open;

          Append;
          FieldByName( 'IdGrupo' ).AsInteger := iProxGrupo;
          FieldByName( 'IdEspAcesso' ).AsInteger := iProxEspAcesso;

          SqlGrupoAtu.Prepare;
          SqlGrupoAtu.ParamByName( 'IdGrupo' ).AsInteger   := iProxGrupo;
          SqlGrupoAtu.ParamByName( 'IdUsuario' ).AsInteger := -1;
          SqlGrupoAtu.Open;
       End Else
       Begin
          SqlGrupo.Prepare;
          SqlGrupo.ParamByName( 'IdGrupo' ).AsInteger := StrToInt( lstgrupo.ItemFocused.SubItems[ 2 ] );  // Michelle Mota - SOL: 268414 - PPM: 1256276
          SqlGrupo.Open;

          If IsEmpty Then Begin
             Close;
             MsgDlg( 'Grupo não encontrado', 'Cadastro de Grupos', MtError, [Mbok], 0 );
             ModalResult := MrCancel;
             FrmCadGrupoNew.Close;
             Exit;
          End;

          SqlGrupoAtu.Prepare;
          SqlGrupoAtu.ParamByName( 'IdGrupo' ).AsInteger   := StrToInt( lstgrupo.ItemFocused.SubItems[ 2 ] ); // Michelle Mota - SOL: 268414 - PPM: 1256276
          SqlGrupoAtu.ParamByName( 'IdUsuario' ).AsInteger := -1;
          SqlGrupoAtu.Open;


          i := 0;
          // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
          if lstUsuario.Focused then begin
          While i < LstNaoMembrosUsu.Items.Count Do
                If  CdsGrupoAtu.Locate( 'IdUsuario', StrToInt( lstNaoMembrosUsu.Items[ i ].SubItems[ 2 ] ), [] )  Then Begin // Michelle Mota - SOL: 268414 - PPM: 1256276
                   LstItem := LstMembrosUsu.Items.Add;
                   LstItem.ImageIndex := 0;
                   LstItem.Caption := LstNaoMembrosUsu.Items[ i ].Caption;
                   LstItem.SubItems := LstNaoMembrosUsu.Items[ i ].SubItems;
                   LstNaoMembrosUsu.Items[ i ].Delete;
                End Else
                   Inc( i );
          end;
          if (lstGrupo.Focused) then begin
          While i < LstNaoMembrosUsu.Items.Count Do
                If  CdsGrupoAtu.Locate( 'IdUsuario', StrToInt( lstNaoMembrosUsu.Items[ i ].SubItems[ 4 ] ), [] )  Then Begin // Michelle Mota - SOL: 268414 - PPM: 1256276
                   LstItem := LstMembrosUsu.Items.Add;
                   LstItem.ImageIndex := 0;
                   LstItem.Caption := LstNaoMembrosUsu.Items[ i ].Caption;
                   LstItem.SubItems := LstNaoMembrosUsu.Items[ i ].SubItems;
                   LstNaoMembrosUsu.Items[ i ].Delete;
                End Else
                   Inc( i );
          end;
          // Término - // Michelle Mota - SOL: 268414 - PPM: 1256276
          Edit;
       End;
  End;
end;

procedure TfrmCadGrupoNew.BtnDireitosClick(Sender: TObject);
var
  igrupo, iespacesso: Integer;
begin
  inherited;
  With FrmUserManager Do Begin
       DbEdNome.DataSource      := dsGrupo;
       DbEdDescricao.DataSource := dsGrupo;

       If bnovo Then
       Begin
          igrupo     := CdsGrupo.FieldByName( 'idgrupo' ).AsInteger;
          iespacesso := -1;
       End Else
       Begin
          igrupo     := StrToInt( lstGrupo.ItemFocused.SubItems[ 2 ] );
          iespacesso := StrToInt( lstGrupo.ItemFocused.SubItems[ 3 ] );
       End;
  End;

  With TFrmDireitosUsu.Create( igrupo, iespacesso, False, Self ) Do
       Try
          ShowModal;
       Finally
          Free;
       End;
end;

procedure TfrmCadGrupoNew.BtnAddClick(Sender: TObject);
Var
   i: Integer;
   LstItem: TListItem;
begin
  inherited;
  // Inclui Usuario(s)
  i := 0;

  While i < LstNaoMembrosUsu.Items.Count Do Begin
      If LstNaoMembrosUsu.Items[ i ].Selected Then Begin
         // verifica se existe algum relacionamento para este grupo
         sqlVerifRelac.prepare;
         sqlVerifRelac.paramByName('IDGRUPO').asInteger := StrToInt( FrmUserManager.lstgrupo.ItemFocused.SubItems[ 2 ] ); // Michelle Mota - SOL: 268414 - PPM: 1256276
         sqlVerifRelac.Open;
         if not cdsVerifRelac.isEmpty then
         begin
           frmUserManager.SQLGrupoXCargoXFuncaoXCCusto.Prepare;
           frmUserManager.SQLGrupoXCargoXFuncaoXCCusto.ParamByName('IDPESSOA').asInteger := StrToInt( lstNaoMembrosUsu.Items[ i ].SubItems[ 2 ] );// Michelle Mota - SOL: 268414 - PPM: 1256276
           frmUserManager.SQLGrupoXCargoXFuncaoXCCusto.Open;
           if frmUserManager.CdsGrupoXCargoXFuncaoXCCusto.IsEmpty then
           begin
             MsgDlg( 'O usuário não pertence ao mesmo Grupo X Cargo X Funcao X Centro de Custo ', 'Cadastro de Grupos', MtError, [Mbok], 0 );
             abort;
           end;
         end;

         LstItem := LstMembrosUsu.Items.Add;
         LstItem.ImageIndex := 0;
         LstItem.Caption := LstNaoMembrosUsu.Items[ i ].Caption;
         LstItem.SubItems := LstNaoMembrosUsu.Items[ i ].SubItems;
         LstNaoMembrosUsu.Items[ i ].Delete;
      End Else
          Inc( i );
  End;
end;

procedure TfrmCadGrupoNew.BtnAddAllClick(Sender: TObject);
Var
   LstItem: TListItem;
   i : integer;
begin
  inherited;
  // Inclui Todos os Usuarios

  sqlVerifRelac.prepare;
  sqlVerifRelac.paramByName('IDGRUPO').asInteger := StrToInt( FrmUserManager.lstgrupo.ItemFocused.SubItems[ 2 ] ); // Michelle Mota - SOL: 268414 - PPM: 1256276
  sqlVerifRelac.Open;
  if cdsVerifRelac.isEmpty then
  begin
    While LstNaoMembrosUsu.Items.Count > 0 Do Begin
        LstItem := LstMembrosUsu.Items.Add;
        LstItem.ImageIndex := 0;
        LstItem.Caption := LstNaoMembrosUsu.Items[ 0 ].Caption;
        LstItem.SubItems := LstNaoMembrosUsu.Items[ 0 ].SubItems;
        LstNaoMembrosUsu.Items[ 0 ].Delete;
    end;
  end else begin
  MsgDlg( 'Somente os usuários que pertencem ao mesmo Grupo X Cargo X Funcao X Centro de Custo serão incluídos', 'Cadastro de Grupos', mtInformation, [Mbok], 0 );
  i := 0;
  While i < LstNaoMembrosUsu.Items.Count Do Begin
    frmUserManager.SQLGrupoXCargoXFuncaoXCCusto.Prepare;
    frmUserManager.SQLGrupoXCargoXFuncaoXCCusto.ParamByName('IDPESSOA').asInteger := StrToInt( lstNaoMembrosUsu.Items[ i ].SubItems[ 2 ] );
    frmUserManager.SQLGrupoXCargoXFuncaoXCCusto.Open;
    if not frmUserManager.CdsGrupoXCargoXFuncaoXCCusto.IsEmpty then
    begin
      LstItem := LstMembrosUsu.Items.Add;
      LstItem.ImageIndex := 0;
      LstItem.Caption := LstNaoMembrosUsu.Items[ i ].Caption;
      LstItem.SubItems := LstNaoMembrosUsu.Items[ i ].SubItems;
      LstNaoMembrosUsu.Items[ i ].Delete;
    end;
    frmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Close;
    inc(i);
    end;

  End;
end;

procedure TfrmCadGrupoNew.BtnDelClick(Sender: TObject);
Var
   i: Integer;
   LstItem: TListItem;
begin
  inherited;
  // Retira Usuario(s)
  i := 0;

  While i < LstMembrosUsu.Items.Count Do Begin
      If LstMembrosUsu.Items[ i ].Selected Then Begin
         LstItem := LstNaoMembrosUsu.Items.Add;
         LstItem.ImageIndex := 0;
         LstItem.Caption := LstMembrosUsu.Items[ i ].Caption;
         LstItem.SubItems := LstMembrosUsu.Items[ i ].SubItems;
         LstMembrosUsu.Items[ i ].Delete;
      End Else
          Inc( i );
  End;
end;

procedure TfrmCadGrupoNew.BtnDelAllClick(Sender: TObject);
Var
   LstItem: TListItem;
begin
  inherited;
  // Retira todos os usuários

  While LstMembrosUsu.Items.Count > 0 Do Begin
        LstItem := LstNaoMembrosUsu.Items.Add;
        LstItem.ImageIndex := 0;
        LstItem.Caption := LstMembrosUsu.Items[ 0 ].Caption;
        LstItem.SubItems := LstMembrosUsu.Items[ 0 ].SubItems;
        LstMembrosUsu.Items[ 0 ].Delete;
  End;
end;

procedure TfrmCadGrupoNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
   LstItem: TListItem;
   i: Integer;
begin
  inherited;
  With FrmUserManager, CdsGrupo Do
  Begin
       If FrmCadGrupoNew.ModalResult = MrOk Then
       Begin
          Try
             Post;

             CdsGrupoAtu.First;

             //edilaine WO11692 : inicio
             //While Not CdsGrupoAtu.Eof Do
             //      CdsGrupoAtu.Delete;

             //percorrer a lista NAO MEMBROS, se encontrar o usuario na CdsGrupoAtu excluir
             for i := 0 To LstNaoMembrosUsu.Items.Count - 1 Do
             begin
               CdsGrupoAtu.first;
               if CdsGrupoAtu.locate('IDUSUARIO', StrToInt( LstNaoMembrosUsu.Items[ i ].SubItems[ 4 ]), [loCaseInsensitive]) then
                  CdsGrupoAtu.Delete;
             end;

             //percorrer a lista MEMBROS, se não encontrar o usuario na CdsGrupoAtu incluir
             For i := 0 To LstMembrosUsu.Items.Count - 1 Do
             Begin
               CdsGrupoAtu.first;
               if not CdsGrupoAtu.locate('IDUSUARIO', StrToInt( LstMembrosUsu.Items[ i ].SubItems[ 4 ]), [loCaseInsensitive]) then
               begin
                 CdsGrupoAtu.Append;
                 CdsGrupoAtu.FieldByName( 'IdGrupo' ).AsInteger   := FieldByName( 'IdGrupo' ).AsInteger;
                 CdsGrupoAtu.FieldByName( 'IdUsuario' ).AsInteger := StrToInt( lstMembrosUsu.Items[ i ].SubItems[ 4 ] ); // Michelle Mota - SOL: 268414 - PPM: 1256276
                 CdsGrupoAtu.Post;
               end;
             End;
             //edilaine WO11692 : fim

             // Chama Control para aplicar as alterações aqui 
             If Not GrupoUsu.ProcessaGrupoUsu(null, null, null, CdsGrupo.Data, null, null, CdsGrupoAtu.Data, CdsAutorizaAtu.Data, CdsAtuAutorizaRpt.Data,CdsAtuAutorizaConsulta.Data, opGrupo) Then
             Begin
                MsgDlg(GrupoUsu.MessageInfo, 'Atenção', mtError, [MbOk], 0);
                Abort;
             End;

             If bnovo Then
             Begin
                MontaList( SqlPesqGrupo, lstgrupo, 1 );
             End
             Else
             Begin
                lstGrupo.ItemFocused.Caption := FieldByName( 'NomeGrupo' ).Text;
                lstGrupo.ItemFocused.SubItems[ 0 ] := FieldByName( 'Descricao' ).Text;
                lstGrupo.ItemFocused.SubItems[ 1 ] := '';
             End;
          Except
             On Exception Do
             Begin
                MsgDlg( 'Não foi possível alterar o grupo.',
                        'Cadastro de Grupos', mtError, [ mbOk, mbHelp ], 0 );
             End;
          End;
       End Else Begin
          Cancel;

          If CdsAtuAutorizaConsulta.ChangeCount > 0 Then
             CdsAtuAutorizaConsulta.CancelUpdates;

          If CdsAtuAutorizaRpt.ChangeCount > 0 Then
             CdsAtuAutorizaRpt.CancelUpdates;

          If CdsAutorizaAtu.ChangeCount > 0 Then
             CdsAutorizaAtu.CancelUpdates;

          If CdsGrupoAtu.ChangeCount > 0 Then
             CdsGrupoAtu.CancelUpdates;

          If CdsGrupo.ChangeCount > 0 Then
             CdsGrupo.CancelUpdates;
       End;

       CdsAtuAutorizaConsulta.Close;
       CdsAtuAutorizaRpt.Close;
       CdsAutorizaAtu.Close;
       CdsGrupoAtu.Close;
       Close;
  End;
end;


end.
