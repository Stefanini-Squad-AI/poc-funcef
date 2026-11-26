{ Data       : 07.08.2015
 Sol        : 148922/8841
 PPM        : 1628565
 Autor      : Jonas Otavio
 Rotina     : Botão Ajuda
 Descrição  : Confeccionar documentação do módulo de Empréstimo
-------------------------------------------------------------------------------}

unit FCadFluxOperMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, DBGrids, DBCtrls, wwdbedit, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, Mask, uCtrlWorkFlow, uCMTypes, menus;

type
  TFrmCadFluxOperMT = class(TFrmCadastroMT)
    dsUsuario: TwwDataSource;
    dsFluxOperUsuario: TwwDataSource;
    dsPassoFluxoper: TwwDataSource;
    Sql: TCMSqlParams;
    SQLPassoFluxoper: TCMSqlParams;
    SqlFluxOperUsuario: TCMSqlParams;
    SqlUsuario: TCMSqlParams;
    CdsPassoFluxoper: TCMClientDataSet;
    CdsFluxOperUsuario: TCMClientDataSet;
    CdsUsuario: TCMClientDataSet;
    lblLabel1: TLabel;
    dbedDescFluxOper: TDBEdit;
    PgFluxoOper: TPageControl;
    TabSheet1: TTabSheet;
    lblLabel2: TLabel;
    sbtnInserirPasso: TSpeedButton;
    sbtnRemoverPasso: TSpeedButton;
    lblLabel3: TLabel;
    sbtnSubir: TSpeedButton;
    sbtnDescer: TSpeedButton;
    Label1: TLabel;
    lblLabel5: TLabel;
    trvMnuExiste: TTreeView;
    dbgSeleciona: TwwDBGrid;
    wwDBEdit1: TwwDBEdit;
    DBMemo1: TDBMemo;
    TabSheet3: TTabSheet;
    lblLabel7: TLabel;
    lblLabel6: TLabel;
    sbtnInserirUsr: TSpeedButton;
    sbtnRemoverUsr: TSpeedButton;
    dbgUsuExiste: TwwDBGrid;
    DBGrid2: TDBGrid;
    ImgMenus: TImageList;
    procedure sbtnInserirPassoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnRemoverPassoClick(Sender: TObject);
    procedure sbtnSubirClick(Sender: TObject);
    procedure sbtnDescerClick(Sender: TObject);
    procedure sbtnInserirUsrClick(Sender: TObject);
    procedure sbtnRemoverUsrClick(Sender: TObject);
    procedure trvMnuExisteGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure trvMnuExisteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgSelecionaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgSelecionaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);
  private
    WorkFlow: TCtrlWorkFlow;

    procedure MudaOrdem;
    procedure Selecionar(IdWorkFlow: LongInt);
    procedure IncluiItem(Pai: TTreeNode; mnuItem: TMenuItem);
    function NomeFuncao(s: string): string;
  public
    { Public declarations }
  end;

var
  FrmCadFluxOperMT: TFrmCadFluxOperMT;

implementation

Uses uCtrlPadroes, uMensErro, uSistema;

{$R *.DFM}

procedure TFrmCadFluxOperMT.sbtnInserirPassoClick(Sender: TObject);
begin
  inherited;
   with CdsPassoFluxOper do
   begin
      Append;
      FieldByName('IDWORKFLOW').Value := Cds.FieldByName('IDWORKFLOW').AsInteger;
      FieldByName('ORDEM').Value      := dbgSeleciona.DataSource.DataSet.RecordCount + 1;
      FieldByName('DESCPASSO').Value  := '';
      FieldByName('NOMEPASSO').Value  := trvMnuExiste.Selected.Text;
      FieldByName('ITEMMENU').Value   := TMenuItem(trvMnuExiste.Selected.Data).Name;
      Post;
   end;
end;

procedure TFrmCadFluxOperMT.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  WorkFlow := TCtrlWorkFlow.Create;
  WorkFlow.InitializeAs(Padroes);
  WorkFlow.CdsWorkflow := Cds;
  WorkFlow.CdsPassoworkflow := CdsPassoFluxoper;
  WorkFlow.CdsWorkflowusuario := CdsFluxOperUsuario;

  MontaSelect.Filtro.Add('WORKFLOW.IDMODULO = ' + IntToStr(Sistema.IdModulo));

  with trvMnuExiste.Items do
  Begin
       BeginUpdate;
       Clear;
       for i := 0 to Application.MainForm.Menu.Items.Count-1 do
           IncluiItem(nil, Application.MainForm.Menu.Items[i]);
       EndUpdate;
  end;

  SqlUsuario.Open;
end;

procedure TFrmCadFluxOperMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  WorkFlow.Free;
end;

procedure TFrmCadFluxOperMT.sbtnRemoverPassoClick(Sender: TObject);
begin
  inherited;
  CdsPassoFluxOper.Delete;
end;

procedure TFrmCadFluxOperMT.sbtnSubirClick(Sender: TObject);
begin
  inherited;
  with CdsPassoFluxOper do
    if not bof then
    begin
       Edit;
       FieldByName('ORDEM').AsInteger := FieldByName('ORDEM').AsInteger - 1;
       Post;

       Prior;
       Edit;
       FieldByName('ORDEM').AsInteger := FieldByName('ORDEM').AsInteger + 1;
       Post;

       Prior;
    end;
end;

procedure TFrmCadFluxOperMT.sbtnDescerClick(Sender: TObject);
var
  IdOrdemNext, IdOrdem: integer;
  DescPassoNext, NomePassoNext, DescPasso, NomePasso, ItemMenuNext, ItemMenu: string;
begin
  inherited;
  with CdsPassoFluxOper do
    if not eof then
    begin
       Edit;
       FieldByName('ORDEM').AsInteger := FieldByName('ORDEM').AsInteger + 1;
       Post;

       prior;

       Edit;
       FieldByName('ORDEM').AsInteger := FieldByName('ORDEM').AsInteger - 1;
       Post;

       Next;
    end;
end;

procedure TFrmCadFluxOperMT.sbtnInserirUsrClick(Sender: TObject);
begin
  inherited;
  If sbtnInserirUsr.Enabled Then
     with CdsFluxOperUsuario do
     Begin
        if not Locate('IdWorkFlow;IdUsuario', VarArrayOf([Cds.FieldByName('IDWORKFLOW').AsInteger,
                        CdsUsuario.FieldByName('IDUSUARIO').AsInteger]), [loCaseInsensitive]) then
        begin
           Append;
           FieldByName('IDWORKFLOW').Value  := Cds.FieldByName('IDWORKFLOW').AsInteger;
           FieldByName('IDUSUARIO').Value   := CdsUsuario.FieldByName('IDUSUARIO').AsInteger;
           FieldByName('NOMEUSUARIO').Value := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;
           Post;
        end;
     end;
end;

procedure TFrmCadFluxOperMT.sbtnRemoverUsrClick(Sender: TObject);
begin
  inherited;
  If sbtnRemoverUsr.Enabled Then CdsFluxOperUsuario.Delete;
end;

procedure TFrmCadFluxOperMT.trvMnuExisteGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.SelectedIndex := Node.ImageIndex ;
end;

procedure TFrmCadFluxOperMT.trvMnuExisteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
    with Sender as TTreeView do
         if Selected.ImageIndex = 1 then BeginDrag(false);
end;

procedure TFrmCadFluxOperMT.dbgSelecionaDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  if sbtnInserirPasso.Enabled then sbtnInserirPasso.Click;
end;

procedure TFrmCadFluxOperMT.dbgSelecionaDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  if Source is TTreeNode then Accept := true;
end;

procedure TFrmCadFluxOperMT.Selecionar(IdWorkFlow: Integer);
begin
  Sql.Prepare;
  Sql.ParambyName('IDWORKFLOW').AsInteger := IdWorkFlow;
  Sql.Open;

  SqlFluxOperUsuario.Prepare;
  SqlFluxOperUsuario.ParambyName('IDWORKFLOW').AsInteger := IdWorkFlow;
  SqlFluxOperUsuario.Open;

  if CdsPassoFluxOper.Active Then CdsPassoFluxOper.Close;
  CdsPassoFluxOper.IndexFieldNames := '';

  SqlPassoFluxOper.Prepare;
  SqlPassoFluxOper.ParambyName('IDWORKFLOW').AsInteger := IdWorkFlow;
  SqlPassoFluxOper.Open;

  MudaOrdem;
end;

procedure TFrmCadFluxOperMT.CmeCadastroInsert(Sender: TObject);
begin
  Selecionar(0);

  inherited;
  
  If dbedDescFluxOper.CanFocus Then dbedDescFluxOper.SetFocus;
  Cds.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
end;

procedure TFrmCadFluxOperMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dbedDescFluxOper.CanFocus Then dbedDescFluxOper.SetFocus;
end;

procedure TFrmCadFluxOperMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := WorkFlow.ProcessaWorkFlow(opInserir);
end;

procedure TFrmCadFluxOperMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := WorkFlow.ProcessaWorkFlow(opAlterar);
end;

procedure TFrmCadFluxOperMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := WorkFlow.ProcessaWorkFlow(opApagar);
end;

procedure TFrmCadFluxOperMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If OrigemAbortConfirma In [OaApplyInsert, OaApplyDelete, OaApplyEdit] Then
     MsgDlg(WorkFlow.MessageInfo,'Erro',MtError,[MbOk],0);
end;

procedure TFrmCadFluxOperMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if Trim(dbedDescFluxOper.Text) = '' then
     WorkFlow.MessageInfo := 'Descrição não preenchida.';
end;

procedure TFrmCadFluxOperMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Selecionar(StrToIntDef(MontaSelect.ValoresChave[0],0));
end;

procedure TFrmCadFluxOperMT.IncluiItem(Pai:TTreeNode; mnuItem: TMenuItem);
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

function TFrmCadFluxOperMT.NomeFuncao(s:string):string;
var i : integer;
begin
     Result := '';
     if Copy(s,1,1) <> '-' then
        for i := 1 to length(s) do
            if (Copy(s,i,1) <>'&') and (Copy(s,i,1) <>'''') then
               Result := Result +Copy(s,i,1);
end;


procedure TFrmCadFluxOperMT.CmeCadastroAtualizaBotoes(Sender: TObject);
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

procedure TFrmCadFluxOperMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao = OpAlterar Then
     Selecionar(StrToIntDef(MontaSelect.ValoresChave[0],0));
end;

procedure TFrmCadFluxOperMT.MudaOrdem;
Var
  iOrdem: Integer;
begin

  iOrdem := 1;
  CdsPassoFluxOper.First;
  While Not CdsPassoFluxOper.Eof Do
  begin
     CdsPassoFluxOper.Edit;
     CdsPassoFluxOper.FieldByName('ORDEM').AsInteger := iOrdem;
     CdsPassoFluxOper.Post;
     CdsPassoFluxOper.Next;
     inc(iOrdem);
  end;

  CdsPassoFluxOper.IndexFieldNames := 'ORDEM';
end;

procedure TFrmCadFluxOperMT.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  //SOL 148922/8841 - Jonas
   if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230030)
      end;
end;

end.
