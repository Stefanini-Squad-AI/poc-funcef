unit FSelecionaDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBClient,  uCMClientDataSet,
  DBCtrls, JCLSysUtils, uCmTypes, dBaseDados, uSistema, Provider, DBTables,
  Menus, Grids, DBGrids, ImgList, ToolWin, dxCntner, dxTL,  dxTLClms, dxExEdtr,
  uCtrlWebPaginaCampo, uCtrlWebTpUsuPagina,
  uCtrlWebTpUsuCampo, uCtrlWebInterface, FSelOrigem, FCriaSelecao,
  JCLStrings, uConstPaginasCampos, MontaSelect;

type
  TfrmSelecionaDados = class(TfrmOkCancelar)
    pnlDados: TPanel;
    pnlTop: TPanel;
    lblTipoUsuario: TLabel;
    pnlBottomDados: TPanel;
    dtsTipoUsuario: TDataSource;
    MenuHint: TPopupMenu;
    mnuHint: TMenuItem;
    imgTreeView: TImageList;
    pnlTopDados: TPanel;
    btnExpande: TSpeedButton;
    btnContrai: TSpeedButton;
    bntMarcaTodas: TSpeedButton;
    btnDesmarcaTodas: TSpeedButton;
    dxTreeList: TdxTreeList;
    dxTlExibe: TdxTreeListCheckColumn;
    dxTlTitulo: TdxTreeListColumn;
    dxTlUsaPadrao: TdxTreeListCheckColumn;
    dxTlConteudo: TdxTreeListColumn;
    dxTlIdPagina: TdxTreeListColumn;
    dxTlDescricao: TdxTreeListColumn;
    dxTlIdCampo: TdxTreeListColumn;
    dxTlTipo: TdxTreeListColumn;
    dxTlSempreHab: TdxTreeListColumn;
    dxTlPai: TdxTreeListColumn;
    dxTlLayerAcesso: TdxTreeListColumn;
    dblkpInterface: TDBLookupComboBox;
    lblInterface: TLabel;
    cdsInterface: TCMClientDataSet;
    cdsInterfaceIDWEBINTERFACE: TFloatField;
    cdsInterfaceNOMEINTERFACE: TStringField;
    cdsInterfaceENDLOGIN: TStringField;
    cdsInterfaceEMAIL: TStringField;
    cdsInterfaceTIMEOUT: TFloatField;
    cdsInterfaceMENUALTURA: TFloatField;
    cdsInterfaceMENULARGURA: TFloatField;
    cdsInterfaceMENUTAMFONTE: TFloatField;
    cdsInterfaceMENUPOSX: TFloatField;
    cdsInterfaceMENUPOSY: TFloatField;
    cdsInterfaceMENUDISTANCIA: TFloatField;
    cdsInterfaceMENUNOMEFONTE: TStringField;
    cdsInterfaceMENUCORFONTE: TStringField;
    cdsInterfaceMENUCORFONTESEL: TStringField;
    cdsInterfaceMENUCORFUNDO: TStringField;
    cdsInterfaceMENUCORFUNDOSEL: TStringField;
    cdsInterfaceFLGUSAMENU: TStringField;
    cdsInterfaceFLGUSALAYERS: TStringField;
    cdsInterfaceFLGDEMO: TStringField;
    dtsInterface: TDataSource;
    cdsWebTpUsuCampo: TCMClientDataSet;
    cdsWebTpUsuCampoIDTIPOUSUARIO: TFloatField;
    cdsWebTpUsuCampoIDCAMPO: TFloatField;
    cdsWebTpUsuCampoIDWEBINTERFACE: TFloatField;
    cdsWebTpUsuCampoTITULOCAMPO: TStringField;
    cdsWebTpUsuCampoFLGDISPONIVEL: TStringField;
    cdsWebTpUsuPagina: TCMClientDataSet;
    cdsWebTpUsuPaginaIDTIPOUSUARIO: TFloatField;
    cdsWebTpUsuPaginaIDPAGINA: TFloatField;
    cdsWebTpUsuPaginaIDWEBINTERFACE: TFloatField;
    cdsWebTpUsuPaginaTITULOPAGINA: TStringField;
    cdsWebTpUsuPaginaFLGUSAPADRAO: TStringField;
    cdsWebTpUsuPaginaPAGCONTEUDO: TMemoField;
    cdsWebTpUsuPaginaLAYERACESSO: TStringField;
    cdsWebTpUsuPaginaFLGDISPONIVEL: TStringField;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    btnCriar: TBitBtn;
    btnCopiar: TBitBtn;
    cdsInterfaceFLGJANELARELAT: TStringField;
    cdsWebTpUsuPaginaFLGCONTAACESSO: TStringField;
    dxTlContaAcesso: TdxTreeListCheckColumn;
    cmbTipoUsuario: TComboBox;
    dxTlBotaoRegra: TdxTreeListButtonColumn;
    cdsWebTpUsuPaginaIDREGRAACESSO: TFloatField;
    cdsWebTpUsuCampoIDREGRAACESSO: TFloatField;
    MSRegra: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExpandeClick(Sender: TObject);
    procedure btnContraiClick(Sender: TObject);
    procedure bntMarcaTodasClick(Sender: TObject);
    procedure btnDesmarcaTodasClick(Sender: TObject);
    procedure dxTreeListEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure dxTreeListChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure dxTlExibeToggleClick(Sender: TObject; const Text: String;
      State: TdxCheckBoxState);
    procedure dblkpInterfaceClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure cmbTipoUsuarioClick(Sender: TObject);
    procedure dxTlBotaoRegraEditButtonClick(Sender: TObject);
    procedure dxTreeListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FAlterado: Boolean;
    procedure SetAlterado(const Value: Boolean);
  private
    //Flag indicando se os dados estão sendo selecionados...
    bSelecionando  : Boolean;

    //Página/Campo
    WebPaginaCampo : TCtrlWebPaginaCampo;

    //Relacionamento Tipo de Usuário/Página
    WebTpUsuPagina : TCtrlWebTpUsuPagina;

    //Relacionamento Tipo de Usuário/Campo
    WebTpUsuCampo  : TCtrlWebTpUsuCampo;

    //Interface
    WebInterface : TCtrlWebInterface;

    //Classe que monta os datasets para gravar no banco
    TpUsuPaginaCampo : TTpUsuPaginaCampo;

    //Tratamento de erros (CtrlObjects)
    procedure MsgErro ( sMsg : String );

    //Monta a TreeView
    procedure MontaArvore;

    //Inclui paginas em uma página pai...
    procedure IncluiPaginas( NodeParent : TdxTreeListNode );

    //Inclui campos em uma página ou campo pai...
    procedure IncluiCampos( NodeParent : TdxTreeListNode; bPagina : boolean  );

    //Seleciona os dados do tipo de usuário selecionado
    procedure Seleciona;

    //Salva as alterações no banco
    function Salva : Boolean;

    //Marca/Desmarca todos os itens da TreeView
    procedure MarcaTodas( bMarca : Boolean );

    //Marca/Desmarca um nó
    procedure MarcaNo( Node : TdxTreeListNode; bMarca : Boolean; bRefresh : boolean = false );

    //Indica se houveram alterações nos dados ou não
    property Alterado : Boolean read FAlterado write SetAlterado;

  public
    { Public declarations }
  end;

var
  frmSelecionaDados: TfrmSelecionaDados;

implementation

{$R *.DFM}

procedure TfrmSelecionaDados.FormCreate(Sender: TObject);
begin
  inherited;

  //Inicializa CtrlObjects
  WebPaginaCampo := TCtrlWebPaginaCampo.Create;
  WebTpUsuPagina := TCtrlWebTpUsuPagina.Create;
  WebTpUsuCampo  := TCtrlWebTpUsuCampo.Create;
  WebInterface   := TCtrlWebInterface.Create;

  WebPaginaCampo.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebTpUsuPagina.InitializeAs( WebPaginaCampo );
  WebTpUsuCampo.InitializeAs( WebPaginaCampo );
  WebTpUsuPagina.InitializeAs( WebPaginaCampo );
  WebInterface.InitializeAs( WebPaginaCampo );

  //Conecta os clientdatasets de alteração
  WebTpUsuCampo.CdsWebTpUsuCampo   := cdsWebTpUsuCampo;
  WebTpUsuPagina.CdsWebTpUsuPagina := cdsWebTpUsuPagina;

  //Cria classe dos dataset;
  TpUsuPaginaCampo := TTpUsuPaginaCampo.Create;

  //Preenche lookup de interface
  cdsInterface.Data := WebInterface.SelecionaTodos;

  if cdsInterface.IsEmpty then
  begin
    ShowMessage( 'Não há nenhuma interface cadastrada.' );
    Close;
  end;

  //Seleciona o primeiro tipo de usuário
  cmbTipoUsuario.ItemIndex := 0;

  //Seleciona a primeira interface
  cdsInterface.First;
  dblkpInterface.KeyValue := cdsInterfaceIDWEBINTERFACE.AsInteger;

  Seleciona;
end; {FormCreate}


procedure TfrmSelecionaDados.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end; {MsgErro}


procedure TfrmSelecionaDados.MontaArvore;
begin

  //Retira a ordenação para montagem da árvore
  dxTlTitulo.Sorted := csNone;

  //Limpa a TreeView
  dxTreeList.ClearNodes;

  //Montagem das páginas
  IncluiPaginas( nil );

  //Reordena a árvore
  dxTlTitulo.Sorted := csUp;

end; {MontaArvore}


procedure TfrmSelecionaDados.SetAlterado(const Value: Boolean);
begin
  FAlterado := Value;

  cmbTipoUsuario.Enabled := not Alterado;
  dblkpInterface.Enabled := not Alterado;
  bbtnConfirmar.Enabled  := Alterado;
  bbtnCancelar.Enabled   := Alterado;
end; {SetAlterado}


procedure TfrmSelecionaDados.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Seleciona;
end; {bbtnCancelarClick}


procedure TfrmSelecionaDados.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Salva then
    Seleciona;
end; {bbtnConfirmarClick}


procedure TfrmSelecionaDados.Seleciona;
var
  sExibe : string;
begin

  bSelecionando := True;
  sExibe := '';

  //Monta a árvore
  MontaArvore;

  bSelecionando := False;
  Alterado := False;

  dxTreeList.GotoFirst;

end; {Seleciona}


procedure TfrmSelecionaDados.FormDestroy(Sender: TObject);
begin
  inherited;
  WebInterface.Free;
  WebPaginaCampo.Free;
  WebTpUsuCampo.Free;
  WebTpUsuPagina.Free;

  TpUsuPaginaCampo.Free;
end; {FormDestroy}


function TfrmSelecionaDados.Salva: Boolean;
var
  NodePagina, NodeCampo : TdxTreeListNode;
begin

  cdsWebTpUsuPagina.Close;
  cdsWebTpUsuPagina.Data := WebTpUsuPagina.SelecionaPorTipoUsuarioInterface( cmbTipoUsuario.ItemIndex + 1,
                                                                             cdsInterfaceIDWEBINTERFACE.AsInteger );

  cdsWebTpUsuCampo.Close;
  cdsWebTpUsuCampo.Data := WebTpUsuCampo.SelecionaPorTipoUsuarioInterface( cmbTipoUsuario.ItemIndex + 1,
                                                                           cdsInterfaceIDWEBINTERFACE.AsInteger );

  //Varre as páginas
  NodePagina := dxTreeList.Items[0];
  while NodePagina <> nil do
  begin
    if NodePagina.Strings[7] = '1' then
    begin

      //Se algum dado da página foi alterado, grava alteração
      if cdsWebTpUsuPagina.Locate( 'IDPAGINA', StrToInt( NodePagina.Strings[4] ), [] ) then
        if  ( trim( cdsWebTpUsuPaginaTITULOPAGINA.AsString   ) <> trim( NodePagina.Strings[1]  ) )
         or ( trim( cdsWebTpUsuPaginaFLGUSAPADRAO.AsString   ) <> trim( NodePagina.Strings[2]  ) )
         or ( trim( cdsWebTpUsuPaginaPAGCONTEUDO.AsString    ) <> trim( NodePagina.Strings[3]  ) )
         or ( trim( cdsWebTpUsuPaginaLAYERACESSO.AsString    ) <> trim( NodePagina.Strings[10] ) )
         or ( trim( cdsWebTpUsuPaginaFLGDISPONIVEL.AsString  ) <> trim( NodePagina.Strings[0]  ) ) 
         //Pendência 18467 - 13/02/2007
         or ( trim( cdsWebTpUsuPaginaFLGCONTAACESSO.AsString ) <> trim( NodePagina.Strings[11] ) ) //then
         or ( trim( cdsWebTpUsuPaginaIDREGRAACESSO.AsString )  <> trim( NodePagina.Strings[12] ) ) then
         //Fim Pendência 18467
        begin
          cdsWebTpUsuPagina.Edit;
          cdsWebTpUsuPaginaTITULOPAGINA.AsString   := trim( NodePagina.Strings[1]  );
          cdsWebTpUsuPaginaFLGUSAPADRAO.AsString   := trim( NodePagina.Strings[2]  );
          cdsWebTpUsuPaginaPAGCONTEUDO.AsString    := trim( NodePagina.Strings[3]  );
          cdsWebTpUsuPaginaLAYERACESSO.AsString    := trim( NodePagina.Strings[10] );
          cdsWebTpUsuPaginaFLGDISPONIVEL.AsString  := trim( NodePagina.Strings[0]  );
          cdsWebTpUsuPaginaFLGCONTAACESSO.AsString := trim( NodePagina.Strings[11] );
          //Pendência 18467 - 13/02/2007
          cdsWebTpUsuPaginaIDREGRAACESSO.AsString  := trim( NodePagina.Strings[12] );
          //Fim Pendência 18467
          cdsWebTpUsuPagina.Post;
        end;

    end;

    NodePagina := NodePagina.GetNext;
  end;

  //Varre os campos
  NodeCampo := dxTreeList.Items[0];
  while NodeCampo <> nil do
  begin
    if NodeCampo.Strings[7] = '2' then
    begin

      //Se algum dado do campo foi alterado, grava alteração
      if cdsWebTpUsuCampo.Locate( 'IDCAMPO', StrToInt( NodeCampo.Strings[5] ), [] ) then
        if  ( trim( cdsWebTpUsuCampoTITULOCAMPO.AsString   ) <> trim( NodeCampo.Strings[1]   ) )
         //Pendência 18467 - 13/02/2007
         or ( trim( cdsWebTpUsuCampoFLGDISPONIVEL.AsString ) <> trim( NodeCampo.Strings[0]  ) ) //then
         or ( trim( cdsWebTpUsuCampoIDREGRAACESSO.AsString ) <> trim( NodeCampo.Strings[12] ) ) then
         //Fim Pendência 18467
        begin
          cdsWebTpUsuCampo.Edit;
          cdsWebTpUsuCampoTITULOCAMPO.AsString   := trim( NodeCampo.Strings[1] );
          cdsWebTpUsuCampoFLGDISPONIVEL.AsString := trim( NodeCampo.Strings[0] );
         //Pendência 18467 - 13/02/2007
          cdsWebTpUsuCampoIDREGRAACESSO.AsString := trim( NodeCampo.Strings[12] );
         //Fim Pendência 18467
          cdsWebTpUsuCampo.Post;
        end;

    end;

    NodeCampo := NodeCampo.GetNext;
  end;


  //Grava dados efetivamente no banco de dados
  Result := False;
  if WebTpUsuPagina.GravaWebTpUsuPagina then
    Result := WebTpUsuCampo.GravaWebTpUsuCampo;

end; {Salva}


procedure TfrmSelecionaDados.btnExpandeClick(Sender: TObject);
begin
  inherited;
  dxTreeList.FullExpand;
end; {btnExpandeClick}


procedure TfrmSelecionaDados.btnContraiClick(Sender: TObject);
begin
  inherited;
  dxTreeList.FullCollapse;
end; {btnContraiClick}


procedure TfrmSelecionaDados.bntMarcaTodasClick(Sender: TObject);
begin
  inherited;
  MarcaTodas( True );
end; {bntMarcaTodasClick}


procedure TfrmSelecionaDados.btnDesmarcaTodasClick(Sender: TObject);
begin
  inherited;
  MarcaTodas( False );
end; {btnDesmarcaTodasClick}


procedure TfrmSelecionaDados.MarcaTodas(bMarca: Boolean);
var
  Node : TdxTreeListNode;
begin
  dxTlExibe.ReadOnly := True;

  Node := dxTreeList.Items[0];
  while Node <> nil do
  begin
    if trim( Node.Strings[8] ) <> 'S' then
      Node.Strings[0] := Iff( bMarca, 'S', 'N' );
    Node := Node.GetNext;
  end;
  dxTreeList.Refresh;

  dxTlExibe.ReadOnly := False;
  Alterado := True;
end; {MarcaTodas}

procedure TfrmSelecionaDados.dxTreeListEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  inherited;
  Alterado := True;
end;

procedure TfrmSelecionaDados.dxTreeListChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  inherited;
  mnuHint.Caption := Node.Strings[6];

  dxTreeList.Columns[0].ReadOnly  := trim( Node.Strings[8] )  = 'S';
  dxTreeList.Columns[2].ReadOnly  := trim( Node.Strings[5] ) <> '';
  dxTreeList.Columns[3].ReadOnly  := trim( Node.Strings[5] ) <> '';
  dxTreeList.Columns[10].ReadOnly := trim( Node.Strings[5] ) <> '';
  dxTreeList.Columns[11].ReadOnly := trim( Node.Strings[5] ) <> '';  

end;

procedure TfrmSelecionaDados.dxTlExibeToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
begin
  MarcaNo( dxTreeList.FocusedNode, ( State = cbsChecked ), True );
end;

procedure TfrmSelecionaDados.MarcaNo(Node: TdxTreeListNode; bMarca: Boolean; bRefresh : boolean );
var
  Child : TdxTreeListNode;
  sExibe : string;
begin
  inherited;

  Alterado := True;

  if trim( Node.Strings[8] ) <> 'S' then
  begin
    sExibe := Iff( bMarca, 'S', 'N' );
    Node.Strings[0] := sExibe;
  end;

  if bMarca then
  begin
    if Node.Parent <> nil then MarcaNo( Node.Parent, bMarca );
  end
  else  //Se desmarcou, desmarca todos os filhos
  begin
    Child := Node.GetFirstChild;
    while Child <> nil do
    begin
      MarcaNo( Child, bMarca );
      Child := Child.GetNextSibling;
    end;
  end;

  if bRefresh then dxTreeList.Refresh;

end;

procedure TfrmSelecionaDados.IncluiPaginas( NodeParent : TdxTreeListNode );
var
  cdsPaginaLocal : TCMClientDataSet;
  sPagPai : string;
  NodePagina : TdxTreeListNode;
begin

  cdsPaginaLocal := TCMClientDataSet.Create( nil );
  try

    if NodeParent = nil then
      sPagPai := ''
    else
      sPagPai := NodeParent.Strings[4];

    cdsPaginaLocal.Data      := WebPaginaCampo.SelecionaPaginasPorPai( StrToIntDef( sPagPai, 0 ),
                                                                       cmbTipoUsuario.ItemIndex + 1,
                                                                       cdsInterfaceIDWEBINTERFACE.AsInteger );

    cdsPaginaLocal.First;
    While not cdsPaginaLocal.Eof do
    begin

      if NodeParent = nil then
        NodePagina := dxTreeList.Add
      else
        NodePagina := NodeParent.AddChild;

      if cdsPaginaLocal.FieldByName('FLGSEMPREHAB').AsString <> 'S' then
      begin
        if cdsPaginaLocal.FieldByName('FLGDISPONIVEL').AsString = 'S' then
          NodePagina.Strings[0]    := 'S'
        else
          NodePagina.Strings[0]    := 'N';
      end
      else
        NodePagina.Strings[0]    := 'S';

      if cdsPaginaLocal.FieldByName('FLGCONTAACESSO').AsString = 'S' then
        NodePagina.Strings[11] := 'S'
      else
        NodePagina.Strings[11] := 'N';

      NodePagina.Strings[1]    := cdsPaginaLocal.FieldByName('TITULOPAGINA').AsString;
      NodePagina.Strings[2]    := cdsPaginaLocal.FieldByName('FLGUSAPADRAO').AsString;
      NodePagina.Strings[3]    := cdsPaginaLocal.FieldByName('PAGCONTEUDO').AsString;
      NodePagina.Strings[4]    := cdsPaginaLocal.FieldByName('IDPAGINA').AsString;
      NodePagina.Strings[6]    := cdsPaginaLocal.FieldByName('DESCPAGINA').AsString;
      NodePagina.Strings[7]    := '1';
      NodePagina.Strings[8]    := cdsPaginaLocal.FieldByName('FLGSEMPREHAB').AsString;
      NodePagina.Strings[9]    := sPagPai;
      NodePagina.Strings[10]   := cdsPaginaLocal.FieldByName('LAYERACESSO').AsString;

      //Pendência 18467 - 13/02/2007
      NodePagina.Strings[12]   := cdsPaginaLocal.FieldByName('IDREGRAACESSO').AsString;
      //Fim Pendência 18467

      if NodeParent = nil then
      begin
        NodePagina.ImageIndex    := 0;
        NodePagina.SelectedIndex := 0;
      end
      else
      begin
        NodePagina.ImageIndex    := 1;
        NodePagina.SelectedIndex := 1;
      end;

      IncluiPaginas( NodePagina );
      IncluiCampos( NodePagina, True );

      cdsPaginaLocal.Next;
    end;

    cdsPaginaLocal.Close;

  finally
    cdsPaginaLocal.Free;
  end;

end;

procedure TfrmSelecionaDados.IncluiCampos(NodeParent: TdxTreeListNode; bPagina : boolean );
var
  cdsCampoLocal : TCMClientDataSet;
  NodeCampo : TdxTreeListNode;
begin

  cdsCampoLocal := TCMClientDataSet.Create( nil );
  try

    if bPagina then
      cdsCampoLocal.Data := WebPaginaCampo.SelecionaCamposApenasPorPagina( StrToInt( NodeParent.Strings[4] ),
                                                                           cmbTipoUsuario.ItemIndex + 1,
                                                                           cdsInterfaceIDWEBINTERFACE.AsInteger )
    else
      cdsCampoLocal.Data := WebPaginaCampo.SelecionaCamposPorPai( StrToInt( NodeParent.Strings[5] ),
                                                                           cmbTipoUsuario.ItemIndex + 1,
                                                                           cdsInterfaceIDWEBINTERFACE.AsInteger );

    cdsCampoLocal.First;
    While not cdsCampoLocal.Eof do
    begin

      NodeCampo := NodeParent.AddChild;

      if cdsCampoLocal.FieldByName('FLGSEMPREHAB').AsString <> 'S' then
      begin
        if cdsCampoLocal.FieldByName('FLGDISPONIVEL').AsString = 'S' then
          NodeCampo.Strings[0]    := 'S'
        else
          NodeCampo.Strings[0]    := 'N';
      end
      else
        NodeCampo.Strings[0]    := 'S';

      NodeCampo.Strings[1]    := cdsCampoLocal.FieldByName('TITULOCAMPO').AsString;
      NodeCampo.Strings[4]    := cdsCampoLocal.FieldByName('IDPAGINA').AsString;
      NodeCampo.Strings[5]    := cdsCampoLocal.FieldByName('IDCAMPO').AsString;
      NodeCampo.Strings[6]    := cdsCampoLocal.FieldByName('DESCCAMPO').AsString;
      NodeCampo.Strings[7]    := '2';
      NodeCampo.Strings[8]    := cdsCampoLocal.FieldByName('FLGSEMPREHAB').AsString;

      //Pendência 18467 - 13/02/2007
      NodeCampo.Strings[12]   := cdsCampoLocal.FieldByName('IDREGRAACESSO').AsString;
      //Fim Pendência 18467

      if bPagina then
      begin
        NodeCampo.ImageIndex    := 2;
        NodeCampo.SelectedIndex := 2;
      end
      else
      begin
        NodeCampo.Parent.ImageIndex    := 3;
        NodeCampo.Parent.SelectedIndex := 3;
        NodeCampo.ImageIndex           := 4;
        NodeCampo.SelectedIndex        := 4;
      end;

      IncluiCampos( NodeCampo, False );

      cdsCampoLocal.Next;
    end;

    cdsCampoLocal.Close;

  finally
    cdsCampoLocal.Free;
  end;
  
end;

procedure TfrmSelecionaDados.dblkpInterfaceClick(Sender: TObject);
begin
  inherited;
  Seleciona;
end;

procedure TfrmSelecionaDados.btnCriarClick(Sender: TObject);
var
  sDir : string;
begin
  inherited;

  frmCriaSelecao := TfrmCriaSelecao.Create( Self );
  try

    if frmCriaSelecao.ShowModal = mrOk then
    begin
      sDir := trim( frmCriaSelecao.edtDiretorio.Text );
      if StrRight( sDir, 1 ) <> '\' then sDir := trim( sDir ) + '\';

      //Apaga os dados atuais das páginas
      if not WebTpUsuPagina.ApagaDados( cmbTipoUsuario.ItemIndex + 1, cdsInterfaceIDWEBINTERFACE.AsInteger ) then
      begin
        ShowMessage('Não foi possível sobrescrever os dados atuais das páginas.');
        exit;
      end;

      //Apaga os dados atuais dos campos
      if not WebTpUsuCampo.ApagaDados( cmbTipoUsuario.ItemIndex + 1, cdsInterfaceIDWEBINTERFACE.AsInteger ) then
      begin
        ShowMessage('Não foi possível sobrescrever os dados atuais dos campos.');
        exit;
      end;

      //Fecha os datasets
      cdsWebTpUsuPagina.Close;
      cdsWebTpUsuCampo.Close;
      try

        //Cria os datasets
        cdsWebTpUsuPagina.CreateDataSet;
        cdsWebTpUsuCampo.CreateDataSet;

        //Atualiza o caminho das páginas
        TpUsuPaginaCampo.AtualizaCaminhoPagina( sDir );

        //Inclui as páginas e os campos
        TpUsuPaginaCampo.PreencheTudo( cdsWebTpUsuPagina, cdsWebTpUsuCampo,
         cmbTipoUsuario.ItemIndex + 1, cdsInterfaceIDWEBINTERFACE.AsInteger );

        //Grava efetivamente os dados no BD
        if WebTpUsuPagina.GravaWebTpUsuPagina then
          WebTpUsuCampo.GravaWebTpUsuCampo;

      finally
        cdsWebTpUsuPagina.Close;
        cdsWebTpUsuCampo.Close;
      end;

      Seleciona;

    end;

  finally
    frmCriaSelecao.Free;
  end;

end;

procedure TfrmSelecionaDados.btnCopiarClick(Sender: TObject);
var
  cdsPaginaLocal,
  cdsCampoLocal : TCMClientDataSet;
begin
  inherited;

  frmSelOrigem := TfrmSelOrigem.Create( Self );
  try
    frmSelOrigem.cdsInterface.Data   := cdsInterface.Data;

    if frmSelOrigem.ShowModal = mrOk then
    begin

      cdsPaginaLocal := TCMClientDataSet.Create( nil );
      cdsCampoLocal  := TCMClientDataSet.Create( nil );
      try

        //Carrega os datasets de origem
        cdsPaginaLocal.Data := WebTpUsuPagina.SelecionaPorTipoUsuarioInterface( frmSelOrigem.cmbTipoUsuario.ItemIndex + 1,
                                                                                frmSelOrigem.cdsInterfaceIDWEBINTERFACE.AsInteger );

        cdsCampoLocal.Data := WebTpUsuCampo.SelecionaPorTipoUsuarioInterface( frmSelOrigem.cmbTipoUsuario.ItemIndex + 1,
                                                                              frmSelOrigem.cdsInterfaceIDWEBINTERFACE.AsInteger );

        //Carrega os datasets de destino
        cdsWebTpUsuPagina.Close;
        cdsWebTpUsuPagina.Data := WebTpUsuPagina.SelecionaPorTipoUsuarioInterface( cmbTipoUsuario.ItemIndex + 1,
                                                                                   cdsInterfaceIDWEBINTERFACE.AsInteger );
        cdsWebTpUsuCampo.Close;
        cdsWebTpUsuCampo.Data := WebTpUsuCampo.SelecionaPorTipoUsuarioInterface( cmbTipoUsuario.ItemIndex + 1,
                                                                                 cdsInterfaceIDWEBINTERFACE.AsInteger );

        //Apaga todos os dados das páginas
        cdsWebTpUsuPagina.First;
        while not cdsWebTpUsuPagina.Eof do
          cdsWebTpUsuPagina.Delete;

        //Apaga todos os dados dos campos
        cdsWebTpUsuCampo.First;
        while not cdsWebTpUsuCampo.Eof do
          cdsWebTpUsuCampo.Delete;


        //Copia os dados das páginas
        cdsPaginaLocal.First;
        while not cdsPaginaLocal.Eof do
        begin
          cdsWebTpUsuPagina.Insert;
          cdsWebTpUsuPagina.FieldByName('IDPAGINA').AsInteger       := cdsPaginaLocal.FieldByName('IDPAGINA').AsInteger;
          cdsWebTpUsuPagina.FieldByName('IDTIPOUSUARIO').AsInteger  := cmbTipoUsuario.ItemIndex + 1;
          cdsWebTpUsuPagina.FieldByName('IDWEBINTERFACE').AsInteger := cdsInterfaceIDWEBINTERFACE.AsInteger;
          cdsWebTpUsuPagina.FieldByName('TITULOPAGINA').AsString    := cdsPaginaLocal.FieldByName('TITULOPAGINA').AsString;
          cdsWebTpUsuPagina.FieldByName('FLGDISPONIVEL').AsString   := cdsPaginaLocal.FieldByName('FLGDISPONIVEL').AsString;
          cdsWebTpUsuPagina.FieldByName('FLGUSAPADRAO').AsString    := cdsPaginaLocal.FieldByName('FLGUSAPADRAO').AsString;
          cdsWebTpUsuPagina.FieldByName('LAYERACESSO').AsString     := cdsPaginaLocal.FieldByName('LAYERACESSO').AsString;
          cdsWebTpUsuPagina.FieldByName('PAGCONTEUDO').AsString     := cdsPaginaLocal.FieldByName('PAGCONTEUDO').AsString;
          cdsWebTpUsuPagina.FieldByName('FLGCONTAACESSO').AsString  := cdsPaginaLocal.FieldByName('FLGCONTAACESSO').AsString;
          //Pendência 18467 - 13/02/2007
          cdsWebTpUsuPagina.FieldByName('IDREGRAACESSO').AsInteger  := cdsPaginaLocal.FieldByName('IDREGRAACESSO').AsInteger;
          //Fim Pendência 18467
          cdsWebTpUsuPagina.Post;
          cdsPaginaLocal.Next;
        end;

        //Copia os dados dos campos
        cdsCampoLocal.First;
        while not cdsCampoLocal.Eof do
        begin
          cdsWebTpUsuCampo.Insert;
          cdsWebTpUsuCampo.FieldByName('IDCAMPO').AsInteger         := cdsCampoLocal.FieldByName('IDCAMPO').AsInteger;
          cdsWebTpUsuCampo.FieldByName('IDTIPOUSUARIO').AsInteger   := cmbTipoUsuario.ItemIndex + 1;
          cdsWebTpUsuCampo.FieldByName('IDWEBINTERFACE').AsInteger  := cdsInterfaceIDWEBINTERFACE.AsInteger;
          cdsWebTpUsuCampo.FieldByName('TITULOCAMPO').AsString      := cdsCampoLocal.FieldByName('TITULOCAMPO').AsString;
          cdsWebTpUsuCampo.FieldByName('FLGDISPONIVEL').AsString    := cdsCampoLocal.FieldByName('FLGDISPONIVEL').AsString;
          //Pendência 18467 - 13/02/2007
          cdsWebTpUsuCampo.FieldByName('IDREGRAACESSO').AsInteger   := cdsCampoLocal.FieldByName('IDREGRAACESSO').AsInteger;
          //Fim Pendência 18467
          cdsWebTpUsuCampo.Post;
          cdsCampoLocal.Next;
        end;

        //Grava efetivamente os dados no BD
        if WebTpUsuPagina.GravaWebTpUsuPagina then
          WebTpUsuCampo.GravaWebTpUsuCampo;

      finally
        cdsPaginaLocal.Free;
        cdsCampoLocal.Free;
      end;

      Seleciona;
    end;

  finally
    frmSelOrigem.Free;
  end;

end;

procedure TfrmSelecionaDados.cmbTipoUsuarioClick(Sender: TObject);
begin
  inherited;
  Seleciona;
end;

procedure TfrmSelecionaDados.dxTlBotaoRegraEditButtonClick(Sender: TObject);
begin
  inherited;

  MSRegra.Executar;

  if MSRegra.RetornouValor then
     dxTreeList.EditingText := MSRegra.ValoresChave[0];

end;

procedure TfrmSelecionaDados.dxTreeListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if dxTreeList.GetAbsoluteColumnIndex(dxTreeList.FocusedColumn) = 12 then
     if key = vk_Delete then begin
        dxTreeList.EditingText := '';
        dxTreeList.FocusedNode.Values[12] := '';
     end;

end;

end.
