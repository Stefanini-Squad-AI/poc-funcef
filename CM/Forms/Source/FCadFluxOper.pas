{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Manutençao do Fluxo de Operação dos Sistemas        }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 29/05/2001                             }
{                                                       }
{*******************************************************}

unit fCadFluxOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMulti, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, DBTables, wwQuery, Mask,
  Grids, Wwdbigrd, Wwdbgrid, Wwtable, DBGrids, TB97, wwdbedit, menus,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ImgList, wwDialog,
  CmEventosCadastro, fCadastroCS, MontaSelect;

type
  TfrmCadFluxOper = class(TfrmCadastroCS)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    lblLabel2: TLabel;
    sbtnInserirPasso: TSpeedButton;
    sbtnRemoverPasso: TSpeedButton;
    lblLabel3: TLabel;
    dsPassoFluxoper: TwwDataSource;
    sbtnSubir: TSpeedButton;
    sbtnDescer: TSpeedButton;
    lblLabel7: TLabel;
    lblLabel6: TLabel;
    DBGrid2: TDBGrid;
    sbtnInserirUsr: TSpeedButton;
    sbtnRemoverUsr: TSpeedButton;
    qryUsuario: TwwQuery;
    dsUsuario: TwwDataSource;
    dsFluxOperUsuario: TwwDataSource;
    qryPassoFluxOper: TwwQuery;
    qryFluxOperUsuario: TwwQuery;
    updPassoFluxOper: TUpdateSQL;
    updFluxoperUsuario: TUpdateSQL;
    qryPassoFluxOperIDWorkFlow: TFloatField;
    qryPassoFluxOperORDEM: TFloatField;
    qryPassoFluxOperDESCPASSO: TMemoField;
    qryPassoFluxOperNOMEPASSO: TStringField;
    trvMnuExiste: TTreeView;
    dbgSeleciona: TwwDBGrid;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    lblLabel5: TLabel;
    DBMemo1: TDBMemo;
    ImgMenus: TImageList;
    dbgUsuExiste: TwwDBGrid;
    qryFluxOperUsuarioIDWorkFlow: TFloatField;
    qryFluxOperUsuarioIDUSUARIO: TFloatField;
    qryFluxOperUsuarioNOMEUSUARIO: TStringField;
    qryPassoFluxOperITEMMENU: TStringField;
    qryIDWORKFLOW: TFloatField;
    qryIDMODULO: TFloatField;
    qryDESCWORKFLOW: TStringField;
    qryUsuarioIDUSUARIO: TFloatField;
    qryUsuarioNOMEUSUARIO: TStringField;
    Panel1: TPanel;
    dbedDescFluxOper: TDBEdit;
    lblLabel1: TLabel;
    procedure sbtnInserirPassoClick(Sender: TObject);
    procedure sbtnRemoverPassoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure dbgrdTelasDispDblClick(Sender: TObject);
    procedure sbtnInserirUsrClick(Sender: TObject);
    procedure sbtnRemoverUsrClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure sbtnSubirClick(Sender: TObject);
    procedure sbtnDescerClick(Sender: TObject);
    procedure dbgSelecionaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgSelecionaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure trvMnuExisteGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure trvMnuExisteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgUsuExisteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgUsuExisteDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    {Inclui o item no treeview verificando se é adicionado com parent ou child}
    procedure IncluiItem(Pai:TTreeNode; mnuItem: TMenuItem);
    {Retorna o nome da função associada ao item de menu}
    function NomeFuncao(s:string):string;
    {Abre Queryes filhas de acordo como o id do pai}
    procedure SelecionaFilhas;
  public
  end;

var
  frmCadFluxOper: TfrmCadFluxOper;

implementation

{$R *.DFM}

uses UDatabase, UAutorizacao, UMensErro, uSistema, dBaseDados;


procedure TfrmCadFluxOper.sbtnInserirPassoClick(Sender: TObject);
var
   Id: Integer;

begin
   inherited;
   with qryPassoFluxOper do
   begin
      Id := LeUltRegistro(nil,'PASSOFluxOper');
      Append;
      FieldByName('IdWorkFlow').Value := QryIdWorkFlow.AsInteger;
      FieldByName('Ordem').Value      := Id;
      FieldByName('DESCPASSO').Value  := '';
      FieldByName('NOMEPASSO').Value  := trvMnuExiste.Selected.Text ;
      FieldByName('ITEMMENU').Value   := TMenuItem(trvMnuExiste.Selected.Data).Name ;
      Post;
   end; {with}
end;

procedure TfrmCadFluxOper.sbtnRemoverPassoClick(Sender: TObject);
begin
   inherited;
   qryPassoFluxOper.Delete;
end;

procedure TfrmCadFluxOper.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   qryFluxOperUsuario.CancelUpdates;
   qryPassoFluxOper.CancelUpdates;
   Qry.CancelUpdates;
end;

procedure TfrmCadFluxOper.wwDBGrid1DblClick(Sender: TObject);
begin
   inherited;
   if not (ds.State in [dsInsert, dsEdit]) then Exit;
   sbtnRemoverPasso.Click;
end;

procedure TfrmCadFluxOper.dbgrdTelasDispDblClick(Sender: TObject);
begin
   inherited;
   if (ds.State in [dsInsert, dsEdit]) then
      sbtnInserirPasso.Click;
end;

procedure TfrmCadFluxOper.sbtnInserirUsrClick(Sender: TObject);
begin
   inherited;
   with qryFluxOperUsuario do begin
      if not Locate('IdWorkFlow;IdUsuario', VarArrayOf([QryIdWorkFlow.AsInteger,
                      qryUsuarioIdUsuario.AsInteger]), [loCaseInsensitive]) then
      begin
         Append;
         FieldByName('IdWorkFlow').Value  := QryIdWorkFlow.AsInteger;
         FieldByName('IdUsuario').Value   := qryUsuarioIdUsuario.AsInteger;
         FieldByName('NOMEUSUARIO').Value := qryUsuarioNOMEUSUARIO.AsString;
         Post;
      end; {then}
   end; {with}
end;

procedure TfrmCadFluxOper.sbtnRemoverUsrClick(Sender: TObject);
begin
   inherited;
   qryFluxOperUsuario.Delete;
end;

procedure TfrmCadFluxOper.DBGrid1DblClick(Sender: TObject);
begin
   inherited;
   if (ds.State in [dsInsert, dsEdit]) then
      sbtnInserirUsr.Click;
end;

procedure TfrmCadFluxOper.DBGrid2DblClick(Sender: TObject);
begin
   inherited;
   if not (ds.State in [dsInsert, dsEdit]) then
      sbtnRemoverUsr.Click;
end;

procedure TfrmCadFluxOper.sbtnSubirClick(Sender: TObject);
var IdOrdemPrev,
    IdOrdem : integer;
    DescPassoPrev,
    NomePassoPrev,
    DescPasso,
    NomePasso : string;
    ItemMenuPrev,
    ItemMenu : String;
begin
   inherited;
   with qryPassoFluxOper do begin
      Prior;
      if not bof then
      begin
           IdOrdemPrev   := FieldByName('Ordem').AsInteger;
           DescPassoPrev := FieldByName('DescPasso').AsString;
           NomePassoPrev := FieldByName('NOMEPASSO').AsString;
           ItemMenuPrev  := FieldByName('ITEMMENU').AsString;

           Next;
           IdOrdem   := FieldByName('Ordem').AsInteger;
           DescPasso := FieldByName('DescPasso').AsString;
           NomePasso := FieldByName('NOMEPASSO').AsString;
           ItemMenu  := FieldByName('ITEMMENU').AsString;

           Edit;
           FieldByName('Ordem').Value     := IdOrdemPrev;
           FieldByName('DescPasso').Value := DescPassoPrev;
           FieldByName('NOMEPASSO').Value := NomePassoPrev;
           FieldByName('ITEMMENU').Value  := ItemMenuPrev;
           Post;

           Prior;
           Edit;
           FieldByName('Ordem').Value     := IdOrdem;
           FieldByName('DescPasso').Value := DescPasso;
           FieldByName('NOMEPASSO').Value := NomePasso;
           FieldByName('ITEMMENU').Value  := ItemMenu;
           Post;
      end;
   end; {with}
end;

procedure TfrmCadFluxOper.sbtnDescerClick(Sender: TObject);
var IdOrdemNext,
    IdOrdem : integer;
    DescPassoNext,
    NomePassoNext,
    DescPasso,
    NomePasso : string;
    ItemMenuNext,
    ItemMenu : string;

begin
   inherited;
   with qryPassoFluxOper do begin
      Next;
      if not eof then
      begin
           IdOrdemNext   := FieldByName('Ordem').AsInteger;
           DescPassoNext := FieldByName('DescPasso').AsString;
           NomePassoNext := FieldByName('NOMEPASSO').AsString;
           ItemMenuNext  := FieldByName('ITEMMENU').AsString;

           Prior;
           IdOrdem   := FieldByName('Ordem').AsInteger;
           DescPasso := FieldByName('DescPasso').AsString;
           NomePasso := FieldByName('NOMEPASSO').AsString;
           ItemMenu  := FieldByName('ITEMMENU').AsString;

           Edit;
           FieldByName('Ordem').Value    := IdOrdemNext;
           FieldByName('DescPasso').Value := DescPassoNext;
           FieldByName('NOMEPASSO').Value := NomePassoNext;
           FieldByName('ITEMMENU').Value  := ItemMenuNext;
           Post;

           Next;
           Edit;
           FieldByName('Ordem').Value    := IdOrdem;
           FieldByName('DescPasso').Value := DescPasso;
           FieldByName('NOMEPASSO').Value := NomePasso;
           FieldByName('ITEMMENU').Value  := ItemMenu;
           Post;

      end;
   end; {with}
end;

procedure TfrmCadFluxOper.IncluiItem(Pai:TTreeNode; mnuItem: TMenuItem);
var i : integer;
    NoPai : TTreeNode;
    sNome : string;
begin
     sNome := NomeFuncao(mnuItem.Caption);
     if (sNome <> '') then
     begin
          NoPai := trvMnuExiste.Items.AddChildObject(Pai, sNome, TObject(mnuItem));
          if Assigned(mnuItem.OnClick) then
             NoPai.ImageIndex := 1;
          for i := 0 to mnuItem.Count-1 do
              IncluiItem(NoPai, mnuItem.Items[i]);
     end;
end;

function TfrmCadFluxOper.NomeFuncao(s:string):string;
var i : integer;
begin
     Result := '';
     if Copy(s,1,1) <> '-' then
        for i := 1 to length(s) do
            if (Copy(s,i,1) <>'&') and (Copy(s,i,1) <>'''') then
               Result := Result +Copy(s,i,1);
end;

procedure TfrmCadFluxOper.dbgSelecionaDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  if sbtnInserirPasso.Enabled then
     sbtnInserirPasso.Click;
end;

procedure TfrmCadFluxOper.dbgSelecionaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
     if Source is TTreeNode then
        Accept := true;
end;

procedure TfrmCadFluxOper.trvMnuExisteGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.SelectedIndex := Node.ImageIndex ;
end;

procedure TfrmCadFluxOper.trvMnuExisteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     inherited;
     if Button = mbLeft then	{ drag only if left button pressed }
     with Sender as TTreeView do
          if Selected.ImageIndex = 1 then
            BeginDrag(false);
end;

procedure TfrmCadFluxOper.DBGrid2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     inherited;
     if Source is TField then
        Accept := true;

end;

procedure TfrmCadFluxOper.DBGrid2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  if sbtnInserirUsr.Enabled then
     sbtnInserirUsr.Click;

end;

procedure TfrmCadFluxOper.dbgUsuExisteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     inherited;
     if Button = mbLeft then
        BeginDrag(false);

end;

procedure TfrmCadFluxOper.dbgUsuExisteDblClick(Sender: TObject);
begin
  inherited;
  if sbtnInserirUsr.Enabled then sbtnInserirUsr.Click;
end;

procedure TfrmCadFluxOper.SelecionaFilhas;
begin
  qryFluxOperUsuario.ParambyName('IDWorkFlow').Value := QryIDWorkFlow.AsInteger;
  qryFluxOperUsuario.Close;
  qryFluxOperUsuario.Open;
  qryPassoFluxOper.ParambyName('IDWorkFlow').Value := QryIDWorkFlow.AsInteger;
  qryPassoFluxOper.Close;
  qryPassoFluxOper.Open;
end;
procedure TfrmCadFluxOper.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  If Qry.Active Then Qry.close;
  Qry.Params[0].AsInteger := -1;
  Qry.Open;

  MontaSelect.Filtro.Add('WORKFLOW.IDMODULO = ' + IntToStr(Sistema.IdModulo));

  SelecionaFilhas;

  qryUsuario.Open;

  with trvMnuExiste.Items do
  Begin
       BeginUpdate;
       Clear;
       for i := 0 to Application.MainForm.Menu.Items.Count-1 do
           IncluiItem(nil, Application.MainForm.Menu.Items[i]);
       EndUpdate;
  end;
end;

procedure TfrmCadFluxOper.CmeCadastroDelete(Sender: TObject);
begin
   Qry.Delete ;
   CmeCadastro.Confirma(self);
   CmeCadastro.AtualizaBotoes(Self);
   SelecionaFilhas;
end;

procedure TfrmCadFluxOper.CmeCadastroConfirma(Sender: TObject);
begin
  Case CmeCadastro.Operacao of
   OpInserir,OpAlterar: AplicaAlteracoes([qry, qryPassoFluxOper, qryFluxOperUsuario]);
   OpApagar :
   Begin
     qryFluxOperUsuario.First;
     While Not qryFluxOperUsuario.Eof Do
        qryFluxOperUsuario.Delete;

     qryPassoFluxOper.First;
     While Not qryPassoFluxOper.Eof Do
        qryPassoFluxOper.Delete;

     AplicaAlteracoes([qryFluxOperUsuario, qryPassoFluxOper, qry])
   End;
  End;

  inherited;
end;

procedure TfrmCadFluxOper.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if Trim(dbedDescFluxOper.Text) = '' then
  begin
     MsgDlg('Descrição não preenchida.', 'Erro', mtError, [mbOk, mbHelp], 0);
     dbedDescFluxOper.SetFocus;
     Accept := False;
  end;
end;

procedure TfrmCadFluxOper.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  dsPassoFluxOper.AutoEdit := bbtnConfirmar.Enabled;
  sbtnInserirPasso.Enabled := bbtnConfirmar.Enabled;
  sbtnRemoverPasso.Enabled := bbtnConfirmar.Enabled;
  sbtnSubir.Enabled        := bbtnConfirmar.Enabled;
  sbtnDescer.Enabled       := bbtnConfirmar.Enabled;
  sbtnInserirUsr.Enabled   := bbtnConfirmar.Enabled;
  sbtnRemoverUsr.Enabled   := bbtnConfirmar.Enabled;
  pnlFundo.Enabled := True;
end;

procedure TfrmCadFluxOper.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  QryIdWorkFlow.AsInteger := LeUltRegistro(dtmBaseDados.qry, 'WORKFLOW');
  QryIdModulo.AsInteger   := Sistema.IdModulo;
  SelecionaFilhas;
  If dbedDescFluxOper.CanFocus Then dbedDescFluxOper.SetFocus;
end;

procedure TfrmCadFluxOper.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    If Qry.Active Then Qry.close;
    Qry.Params[0].AsInteger := StrTointDef(MontaSelect.ValoresChave[0],-1);
    Qry.Open;

    SelecionaFilhas;
  End;
end;

procedure TfrmCadFluxOper.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dbedDescFluxOper.CanFocus Then dbedDescFluxOper.SetFocus;
end;

end.
