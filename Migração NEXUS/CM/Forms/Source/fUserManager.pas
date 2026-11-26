//*****************************************************************************
// SISTEMA : Forms CM 
//******************************************************************************
// Nº SOL: 268414
// Nº KINTANA/PPM: 1256276
// Data da Alteração: 29.01.2016
// Responsável: Michelle Suellyn Mota
// Descrição: ERRO - mensagens de erro ao manipular grupos, conceder permissão
// direitos, visões, tabelas - Cadastro de Usuários.
{******************************************************************************
// Nº SOL: 253300/17804
// Nº KINTANA/PPM: 1093186
// Data da Alteração: 10.11.2015
// Responsável: Michelle S. Mota
// Descrição: Melhoria na funcionalidade de cadastro de usuários disponível em
// todos os módulos do PLANUS.
//******************************************************************************
 Data       : 07.08.2015
 Sol        : 148922/8841
 PPM        : 1628565
 Autor      : Jonas Otavio
 Rotina     : Botão Ajuda
 Descrição  : Confeccionar documentação do módulo de Empréstimo
-------------------------------------------------------------------------------
 Data       : 25.02.2015
 Sol        : 241963/16739
 PPM        : 591288
 Autor      : Higor Nayde Ferreira
 Rotina     : MontaSelect
 Descrição  : Alteração para não trazer usuário demitidos
-------------------------------------------------------------------------------
 Data       : 09.06.2014
 Sol        : 213741/15978
 PPM        : 350663
 Autor      : William Santana
 Rotina     : MontaSelect e MontaList
 Descrição  : Alterar a tela de cadastro de usuário para que seja possível
 identificar os empregados ativos
-------------------------------------------------------------------------------
 Data       : 29.03.2010
 SolKintana : 133124_772972
 Autor      : Arnaldo V. Scarin
 Rotina     : Componente SqlUsuario
 Descrição  : Inclusão do flgdispfinanc no sql do componente.
-------------------------------------------------------------------------------
 Data       : 19.03.2010
 SolKintana : 132556_764760
 Autor      : Bruno Bastos
 Rotina     : Componente SqlUsuario
 Descrição  : Inclusão do flgdispfinanc no sql do componente.
-------------------------------------------------------------------------------
 Data      : 14.07.2006
 Pendência : 20974
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Rotina    : SQL do Componente SQLAcesso e SQL do componente SQLOperFunc
 Descrição : Os SQLs são os mesmos usados no SAD - unit FFuncao.
-------------------------------------------------------------------------------
 Data       : 15.12.2003
 Pendencia  : 14525
 Autor      : David
 Rotina     : SQL do componente SqlPessoa
 Descrição  : Recuperação do campo EMAIL da tabela PESSOA
//------------------------------------------------------------------------------}

unit fUserManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Menus, ComCtrls, Db, DBTables, Wwquery, ImgList,
  Wwdatsrc, MontaSelect, uCmSqlParams, uCtrlGrupoUsu, DBClient;

type
  TFrmUserManager = class(TfrmSairAjuda)
    Splitter1: TSplitter;
    lstUsuario: TListView;
    lstgrupo: TListView;
    ImlImages: TImageList;
    PpmUsuario: TPopupMenu;
    MnuNovo: TMenuItem;
    MnuExcluir: TMenuItem;
    MnuPropriedades: TMenuItem;
    MnuDireitos: TMenuItem;
    dsUsuario: TwwDataSource;
    DsGrupo: TwwDataSource;
    DsPessoa: TwwDataSource;             
    MnuGrupos: TMenuItem;
    dsAcesso: TwwDataSource;
    MontaPessoa: TMontaSelect;
    Tabelas1: TMenuItem;
    Visoes1: TMenuItem;
    MnuMostraEscondeDesabilitados: TMenuItem;
    SqlPesqUsuario: TCMSqlParams;
    CdsPesqUsuario: TClientDataSet;
    SqlPesqGrupo: TCMSqlParams;
    CdsPesqGrupo: TClientDataSet;
    SQLDataViewAcesso: TCMSqlParams;
    CdsDataViewAcesso: TClientDataSet;
    SQLTabelaAcesso: TCMSqlParams;
    CdsTabelaAcesso: TClientDataSet;
    CdsColunaAcesso: TClientDataSet;
    SQLColunaAcesso: TCMSqlParams;
    SQLColunasToAppend: TCMSqlParams;
    CdsColunasToAppend: TClientDataSet;
    SqlUsuario: TCMSqlParams;
    CdsUsuario: TClientDataSet;
    SqlGrupo: TCMSqlParams;
    CdsGrupo: TClientDataSet;
    SqlPessoa: TCMSqlParams;
    CdsPessoa: TClientDataSet;
    SqlGrupoAtu: TCMSqlParams;
    CdsGrupoAtu: TClientDataSet;
    SQLOperFunc: TCMSqlParams;
    CdsOperFunc: TClientDataSet;
    SqlAcesso: TCMSqlParams;
    CdsAcesso: TClientDataSet;
    CdsAtuAutorizaConsulta: TClientDataSet;
    SQLAtuAutorizaConsulta: TCMSqlParams;
    CdsAtuAutorizaRpt: TClientDataSet;
    SQLAtuAutorizaRpt: TCMSqlParams;
    CdsAutorizaAtu: TClientDataSet;
    SQLAutorizaAtu: TCMSqlParams;
    MnuCentrodeCustoXCargoXFuncaoXGrupo: TMenuItem;
    SQLGrupoXCargoXFuncaoXCCusto: TCMSqlParams;
    CdsGrupoXCargoXFuncaoXCCusto: TClientDataSet;
    SqlSeguranca: TCMSqlParams;
    cdsSeguranca: TClientDataSet;
	// Início - Michelle Mota Sol: 253300/17804 PPM: 1093186
    MontaEmpresa: TMontaSelect;
    SqlPesqTelaUsuario: TCMSqlParams;
    cdsPesqTelaUsuario: TClientDataSet;
    dsPesqTelaUsuario: TwwDataSource;
    SqlPesqPessoa: TCMSqlParams;
    cdsPesqPessoa: TClientDataSet;
    dsPesqPessoa: TwwDataSource;
	// Término - Michelle Mota Sol: 253300/17804 PPM: 1093186
    procedure FormCreate(Sender: TObject);
    procedure MnuNovoClick(Sender: TObject);
    procedure MnuDireitosClick(Sender: TObject);
    procedure MnuExcluirClick(Sender: TObject);
    procedure MnuPropriedadesClick(Sender: TObject);
    procedure PpmUsuarioPopup(Sender: TObject);
    procedure MnuGruposClick(Sender: TObject);
    procedure Tabelas1Click(Sender: TObject);
    procedure Visoes1Click(Sender: TObject);
    procedure MnuMostraEscondeDesabilitadosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsUsuarioAfterInsert(DataSet: TDataSet);
    procedure MnuCentrodeCustoXCargoXFuncaoXGrupoClick(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);
    procedure FormShow(Sender: TObject); //Michelle Mota Sol: 253300/17804 PPM: 1093186
  private
    { Private declarations }
  public
    { Public declarations }
    lstAuxTabelas: TStrings;
    GrupoUsu: TCtrlGrupoUsu;
    bnovo, MostraDesabilitados: Boolean;
    Procedure MontaList(Sql: TCmSqlParams; List: TListView; ImageIndex :Integer);
    function ActivePageAutoriza: TListView;
  end;

var
  FrmUserManager: TFrmUserManager;
  gGrupo, gUsuario : Boolean; //Michelle Mota - SOL: 268414 - PPM: 1256276                  

implementation

Uses ftelaAut, fCadUsuarioNew, fCadGrupoNew, FDireitosUsu, uSistema, UmensErro,
     dautorizacao, udatabase, ucmconectabanco, dbasedados, FGrupoxUsu, uCripto,
     FCmPrincipalForms, fManutAutCons, FManutAutVisoes, uCtrlPadroes, uCMTypes,
     FCargoXGrupoXCC;

{$R *.DFM}

Procedure TFrmUserManager.MontaList(Sql: TCmSqlParams; List: TListView; ImageIndex :Integer);
Var
   LstItem :TListItem;
Begin
   List.Items.Clear;

   If Sql.ClientDataSet.Active then Sql.ClientDataSet.Close;

   Sql.Prepare;
   If Sql.ParamExists('DESATIVADO') Then
     If MostraDesabilitados Then
        Sql.ParamByName( 'DESATIVADO' ).AsString := 'S'
     Else
        Sql.ParamByName( 'DESATIVADO' ).AsString := 'X';

   Sql.Open;

   While Not Sql.ClientDataSet.Eof Do
   Begin
         LstItem := List.Items.Add;
         LstItem.ImageIndex := ImageIndex;
         // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
         if Sql = SqlPesqUsuario then
           begin
             LstItem.Caption := Sql.ClientDataSet.Fields[0].AsString;
             LstItem.SubItems.Add( UpperCase( Sql.ClientDataSet.Fields[1].AsString ) );
             LstItem.SubItems.Add( UpperCase( Sql.ClientDataSet.Fields[2].AsString ) );
             LstItem.SubItems.Add( UpperCase( Sql.ClientDataSet.Fields[3].AsString ) );
             LstItem.SubItems.Add( Sql.ClientDataSet.Fields[4].AsString );
             LstItem.SubItems.Add( Sql.ClientDataSet.Fields[5].AsString ); //4 - idusuario //William Santana Sol: 213741/15978 PPM: 350663
             LstItem.SubItems.Add( Sql.ClientDataSet.Fields[6].AsString ); //5 - iespacesso
           end
         else
           begin
             // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
             LstItem.Caption := Sql.ClientDataSet.Fields[1].AsString;
             LstItem.SubItems.Add( UpperCase( Sql.ClientDataSet.Fields[2].AsString ) );
             LstItem.SubItems.Add( UpperCase( Sql.ClientDataSet.Fields[4].AsString ) );
             LstItem.SubItems.Add( Sql.ClientDataSet.Fields[0].AsString ); //2 - idgrupo
             LstItem.SubItems.Add( Sql.ClientDataSet.Fields[3].AsString ); //3 - idespacesso
             LstItem.SubItems.Add( Sql.ClientDataSet.Fields[5].AsString ); //William Santana Sol: 213741/15978 PPM: 350663
             // Término - Michelle Mota - SOL: 268414 - PPM: 1256276
           end;
         // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
         Sql.ClientDataSet.Next;
   End;

   Sql.ClientDataSet.Close;
End;

function TFrmUserManager.ActivePageAutoriza: TListView;
Begin
  If LstUsuario.Visible Then
     Result := lstUsuario
  Else
     Result := lstGrupo;
End;

procedure TFrmUserManager.FormCreate(Sender: TObject);
begin
  inherited;
  gGrupo := false; //Michelle Mota - SOL: 268414 - PPM: 1256276
  gUsuario:= false;//Michelle Mota - SOL: 268414 - PPM: 1256276

  lstAuxTabelas := TStringList.Create;

  GrupoUsu := TCtrlGrupoUsu.Create;
  GrupoUsu.InitializeAs(Padroes);

  bnovo := False;

  MostraDesabilitados := (Sistema.TipoFiltroUsuario = fuALL);

  If FCmPrincipalForms.cOpcaoUsrGrp = 'U' Then begin
     lstgrupo.Visible := False;
     HelpContext := 230014;
  end;

  If FCmPrincipalForms.cOpcaoUsrGrp = 'G' Then Begin
     lstusuario.Visible := False;
     lstgrupo.Align := alClient;
     HelpContext := 230015;
  End;

  MontaList( SqlPesqUsuario, lstUsuario, 0 );
  MontaList( SqlPesqGrupo, lstgrupo, 1 );
end;

procedure TFrmUserManager.MnuNovoClick(Sender: TObject);
begin
  inherited;
  bnovo := True;

  If lstUsuario.Focused Then
     AbrirFormModal( frmCadUsuarioNew, TfrmCadUsuarioNew );

  If lstgrupo.Focused Then
     AbrirFormModal( frmCadGrupoNew, TfrmCadGrupoNew );

  bnovo := False;
end;

procedure TFrmUserManager.MnuDireitosClick(Sender: TObject);
        // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
  {***} procedure ExibeFormDireitosGrupo(List: TListView; busuario:Boolean);
        Begin

           If List.Selected <> nil Then
              With TFrmDireitosUsu.Create( StrToIntDef( List.Selected.SubItems[ 2 ], 0 ),
                                           StrToIntDef( List.Selected.SubItems[ 3 ], 0 ),
                                           bUsuario, Self ) Do
              Try
                ShowModal;
              Finally
                Free;
              End;
        End;

        procedure ExibeFormDireitosUsuario(List: TListView; busuario:Boolean);
        Begin
           If List.Selected <> nil Then
              With TFrmDireitosUsu.Create( StrToIntDef( List.Selected.SubItems[ 4 ], 0 ),
                                           StrToIntDef( List.Selected.SubItems[ 5 ], 0 ),
                                           bUsuario, Self ) Do
              Try
                ShowModal;
              Finally
                Free;
              End;
        End;
        // Término - Michelle Mota - SOL: 268414 - PPM: 1256276
  {***} 

begin
  inherited;

  If lstUsuario.Focused Then
     ExibeFormDireitosUsuario( lstUsuario, True ); // Michelle Mota - SOL: 268414 - PPM: 1256276

  If lstgrupo.Focused Then
     ExibeFormDireitosGrupo( lstgrupo, False ); // Michelle Mota - SOL: 268414 - PPM: 1256276
end;

procedure TFrmUserManager.MnuExcluirClick(Sender: TObject);
  procedure ExcluirUsuario;
  begin
    If (StrToInt( lstUsuario.ItemFocused.SubItems[ 4 ] ) = Sistema.IdUsuario) then //Michelle Mota - SOL: 268414 - PPM: 1256276
       MsgDlg( 'Não é possivel excluir o usuario atualmente "Logado"', 'Cadastro de usuarios',mtWarning , [mbOk], 0)
    Else
       If (MsgDlg( 'Confirma Exclusão deste usuário?', 'Atenção', MtConfirmation, [MbYes, MbNo], 0 ) = MrYes) Then
       Begin
          If GrupoUsu.ExcluiGrupoUsu( StrToInt( lstUsuario.ItemFocused.SubItems[ 5 ] ),
                                          StrToInt( lstUsuario.ItemFocused.SubItems[ 4 ] ), //Michelle Mota - SOL: 253300/17804 - PPM: 1093186
                                          teUsuario) Then
          Begin
             lstUsuario.ItemFocused.Delete;
             MsgDlg('Exclusão de Usuário efetuada com sucesso!','Aviso',MtInformation,[MbOk],0);
          End
          Else
             MsgDlg(GrupoUsu.MessageInfo,'Erro',MtError,[MbOk],0);
       End;
  end;

  procedure ExcluirGrupo;
  begin
     If MsgDlg( 'Confirma Exclusão deste grupo?', 'Atenção', MtConfirmation, [MbYes, MbNo], 0 ) = MrYes Then
     Begin
        If GrupoUsu.ExcluiGrupoUsu( StrToInt( lstGrupo.ItemFocused.SubItems[ 3 ] ), //Michelle Mota - SOL: 268414 - PPM: 1256276
                                        StrToInt( lstGrupo.ItemFocused.SubItems[ 2 ] ), //Michelle Mota - SOL: 268414 - PPM: 1256276
                                        teGrupo) Then
        Begin
           lstGrupo.ItemFocused.Delete;
           MsgDlg('Exclusão de Grupo efetuada com sucesso!','Aviso',MtInformation,[MbOk],0);
        End
        Else
           MsgDlg(GrupoUsu.MessageInfo,'Erro',MtError,[MbOk],0);
     End;
  end;

begin
  inherited;
  If lstUsuario.Focused Then
     ExcluirUsuario;

  If lstgrupo.Focused Then
     ExcluirGrupo;
end;

procedure TFrmUserManager.MnuPropriedadesClick(Sender: TObject);
begin
  inherited;
  If not mnuPropriedades.Enabled Then 
    Exit;

  If lstUsuario.Focused Then
     AbrirFormModal( frmCadUsuarioNew, TfrmCadUsuarioNew );

  If lstgrupo.Focused Then
     AbrirFormModal( frmCadGrupoNew, TfrmCadGrupoNew );
end;

procedure TFrmUserManager.PpmUsuarioPopup(Sender: TObject);
begin
  inherited;
  MnuGrupos.Visible := lstUsuario.Focused;
  MnuMostraEscondeDesabilitados.Visible := lstUsuario.Focused;
  MnuCentrodeCustoXCargoXFuncaoXGrupo.Visible := Not lstUsuario.Focused;

  If MnuMostraEscondeDesabilitados.Visible Then
     If MostraDesabilitados Then
        MnuMostraEscondeDesabilitados.Caption := 'Esconder &Usuários Desabilitados'
     Else
         MnuMostraEscondeDesabilitados.Caption := 'Mostrar &Usuários Desabilitados';
end;

procedure TFrmUserManager.MnuGruposClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal( FrmGrupoxUsu, TFrmGrupoxUsu );
end;

procedure TFrmUserManager.Tabelas1Click(Sender: TObject);
begin
  inherited;
  lstAuxTabelas.Clear;
  // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
  if lstUsuario.Focused then
    gUsuario := True;
  if lstGrupo.Focused then
    gGrupo := True;
  // Término - Michelle Mota - SOL: 268414 - PPM: 1256276
  AbrirFormModal( FrmManutAutCons, TFrmManutAutCons );
end;

procedure TFrmUserManager.Visoes1Click(Sender: TObject);
begin
  inherited;
  // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
  if lstUsuario.Focused then
    gUsuario := True;
  if lstGrupo.Focused then
    gGrupo := True;
  // Término - Michelle Mota - SOL: 268414 - PPM: 1256276  
  AbrirFormModal( FrmManutAutVisoes, TFrmManutAutVisoes );
end;

procedure TFrmUserManager.MnuMostraEscondeDesabilitadosClick(
  Sender: TObject);
begin
  inherited;
  MostraDesabilitados := Not MostraDesabilitados;
  MontaList( SqlPesqUsuario, lstUsuario, 0 );

  if MostraDesabilitados then
  begin
     Sistema.TipoFiltroUsuario := fuALL;
     Padroes.ExecSQLAndCommit('UPDATE EMPRESAPROP SET FLGFILTROUSUARIO = NULL WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  end
  else
  begin
     Sistema.TipoFiltroUsuario := fuSoAtivos;
     Padroes.ExecSQLAndCommit('UPDATE EMPRESAPROP SET FLGFILTROUSUARIO = ''A'' WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));     
  end;
end;

procedure TFrmUserManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  lstAuxTabelas.Free;
  GrupoUsu.Free;
end;

procedure TFrmUserManager.CdsUsuarioAfterInsert(DataSet: TDataSet);
begin
  inherited;
  
  With DataSet Do
  Begin
       FieldByName( 'MudarSenha' ).Text      := 'S';
       FieldByName( 'NaoMudaSenha' ).Text    := 'N';
       FieldByName( 'SenhaPermanente' ).Text := 'S';
       FieldByName( 'Bloqueado' ).Text       := 'N';
       FieldByName( 'Desativado' ).Text      := 'N';
       FieldByName( 'ValidadeSenha' ).Value  := Null;
  End;
end;

procedure TFrmUserManager.MnuCentrodeCustoXCargoXFuncaoXGrupoClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCargoXGrupoXCC, TFrmCargoXGrupoXCC, false );
end;

procedure TFrmUserManager.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  //SOL 148922/8841 - Jonas
  if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230101)
      end;

end;

//Início - Michelle Mota Sol: 253300/17804 PPM: 1093186
procedure TFrmUserManager.FormShow(Sender: TObject);
begin
  inherited;
  self.windowstate := wsMaximized;
end;
// Término - Michelle Mota Sol: 253300/17804 PPM: 1093186

end.

