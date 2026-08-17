unit FMtMontaProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  fcTreeView, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, fcLabel, ComCtrls,
  uCtrlProcessoCompra,uCtrlArtigo,uCtrlGrupoProd, uCtrlSoliCompra,
  uCtrlAvaliacaoForn,
  CheckLst, TB97Tlwn, DBTables, Wwquery, wwclient, Mask, DBCtrls;

type
  TFrmMTMontaProcesso = class(TFrmCadastroMT)
    cdsArtigo: TCMClientDataSet;
    cdsSCI: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    cdsItens: TCMClientDataSet;
    dsItens: TwwDataSource;
    dsItensAtrib: TwwDataSource;
    cdsItensAtrib: TCMClientDataSet;
    twAtribForn: TToolWindow97;
    Panel1: TPanel;
    btnMarcaTodos: TSpeedButton;
    btnInvertSel: TSpeedButton;
    btnAddFornecedor: TSpeedButton;
    btnCopiaSel: TSpeedButton;
    plnComp: TPanel;
    plnOpItem: TPanel;
    BtnRemove: TSpeedButton;
    BtnAdiciona: TSpeedButton;
    Panel7: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    fcLabel2: TfcLabel;
    grdItem: TwwDBGrid;
    Panel3: TPanel;
    Panel2: TPanel;
    fcLabel1: TfcLabel;
    GrdItemAtrib: TwwDBGrid;
    plnSel: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Bevel6: TBevel;
    BtnSelecinar: TSpeedButton;
    BtnLimpar: TSpeedButton;
    dblcSCI: TCMDBLookupCombo;
    dblcArt: TwwDBLookupCombo;
    dblcGrupo: TCMDBLookupCombo;
    edDataNec: TCMDateTimePicker;
    RgEmpresa: TRadioGroup;
    GrdAtribForn: TwwDBGrid;
    DsAtribForn: TwwDataSource;
    cdsCotacao: TCMClientDataSet;
    btnFechar: TSpeedButton;
    cdsNovoForn: TCMClientDataSet;
    Label5: TLabel;
    edProc: TDBEdit;
    cdsRestricao: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelecinarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdItemAtribDblClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnMarcaTodosClick(Sender: TObject);
    procedure btnInvertSelClick(Sender: TObject);
    procedure btnCopiaSelClick(Sender: TObject);
    procedure twAtribFornVisibleChanged(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure btnAddFornecedorClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure GrdAtribFornFieldChanged(Sender: TObject; Field: TField);
  private
    { Private declarations }
    IndexCds       : Integer;
    ProcessoCompra : TCtrlProcessoCompra;
    Artigo         : TCtrlArtigo;
    SoliCompra     : TCtrlSoliCompra;
    GrupoProd      : TCtrlGrupoProd;
    AvaliacaoForn  : TCtrlAvaliacaoForn;
    //
    Procedure Sel( CodProcesso : Double );
    Procedure ShowAtribFornecedor;
    Procedure GravaCotacao;
  public
    // Contem os ClientDatasets com dos fornecedores da cotação
    LstFornecedor  : TList;

    Function  TestaRestricao(idForCli :LongInt; sRazaoSocial, sCodArt : String; bMostra : Boolean) : String;
  end;

var
  FrmMTMontaProcesso: TFrmMTMontaProcesso;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados, uMidasUtil,FMTAdicionaForn;

procedure TFrmMTMontaProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  ProcessoCompra := TCtrlProcessoCompra.Create;
  ProcessoCompra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ProcessoCompra.cdsProcesso := cds;
  ProcessoCompra.cdsItemSoli := cdsItensAtrib;
  ProcessoCompra.cdsCotacao  := cdsCotacao;
  ProcessoCompra.cdsNovoForn := cdsNovoForn;
  //
  SoliCompra := TCtrlSoliCompra.Create;
  SoliCompra.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  AvaliacaoForn  := TCtrlAvaliacaoForn.Create;
  AvaliacaoForn.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  cdsArtigo.Data    := Artigo.ListArtigo;
  cdsGrupoProd.Data := GrupoProd.ListGrupoProd(tgAnaliticos);
  cdsSCI.Data       := SoliCompra.ListNumSoliSemComprador(False,Sistema.IdUsuario);
  //
  MontaSelect.Filtro.Add('PROCESSO.IDCOMPRADOR ='+IntToStr(Sistema.IdUsuario));

  LstFornecedor :=  TList.Create;

  Sel(-1);
end;




procedure TFrmMTMontaProcesso.BtnSelecinarClick(Sender: TObject);
Var
   IdEmpresa : Integer;
begin
  inherited;
  If RgEmpresa.ItemIndex = 0 Then
     IdEmpresa := Sistema.IdEmpresa
  Else
     IdEmpresa := 0;

  If  Trim(dblcSCI.Text) <> '' Then
     cdsItens.Data := SoliCompra.ListSoliCompra( False,StrToInt(dblcSCI.LookupValue),IdEmpresa,'','',Sistema.IdUsuario)
  Else
  If Trim(dblcArt.Text) <> '' Then
     cdsItens.Data := SoliCompra.ListSoliCompra(False,0,IdEmpresa,dblcArt.LookupValue,'',Sistema.IdUsuario)
  Else
  If Trim(dblcGrupo.Text) <> '' Then
     cdsItens.Data := SoliCompra.ListSoliCompra(False,0,IdEmpresa,'',dblcGrupo.LookupValue,Sistema.IdUsuario)
  Else
  If Trim(edDataNec.Text) <> '' Then
     cdsItens.Data := SoliCompra.ListSoliCompra(False,0,IdEmpresa,'',dblcGrupo.LookupValue,Sistema.IdUsuario)
  Else
     cdsItens.Data := SoliCompra.ListSoliCompra(False,0,IdEmpresa,'','',Sistema.IdUsuario);

end;




procedure TFrmMTMontaProcesso.BtnLimparClick(Sender: TObject);
begin
  inherited;
  dblcSCI.Clear;
  dblcArt.Clear;
  dblcGrupo.Clear;
  edDataNec.Clear;
end;




procedure TFrmMTMontaProcesso.BtnAdicionaClick(Sender: TObject);
Var
   x  : Integer;
begin
  inherited;

  cdsItens.DisableControls;
  Try
     For x := 0 To GrdItem.SelectedList.Count -1 Do
       Begin
         cdsItens.GotoBookmark(GrdItem.SelectedList.Items[x]);

         cdsItensAtrib.Append;
         cdsItensAtrib.FieldByName('IDPROCXART').AsFloat     := ( GetTickCount + Random(100)) * -1;
         cdsItensAtrib.FieldByName('NUMSOLCOMPRA').AsFloat   := cdsItens.FieldByName('NUMSOLCOMPRA').AsFloat;
         cdsItensAtrib.FieldByName('CODARTIGO').AsString     := cdsItens.FieldByName('CODARTIGO').AsString;
         cdsItensAtrib.FieldByName('CODMEDIDA').AsString     := cdsItens.FieldByName('CODMEDIDA').AsString;
         cdsItensAtrib.FieldByName('QTDEPEDIDA').AsFloat     := cdsItens.FieldByName('QTDEPEDIDA').AsFloat;
         cdsItensAtrib.FieldByName('DESCRICAO').AsString     := cdsItens.FieldByName('DESCRICAO').AsString;
         cdsItensAtrib.FieldByName('IDITEMSOLI').AsFloat     := cdsItens.FieldByName('IDITEMSOLI').AsFloat;
         cdsItensAtrib.FieldByName('DATAENTREGA').AsDateTime := cdsItens.FieldByName('NECESSIDADE').AsDateTime;
         cdsItensAtrib.FieldByName('CODMEDCUSTO').AsString   := cdsItens.FieldByName('CODMEDCUSTO').AsString;
         cdsItensAtrib.FieldByName('IDPRODVARI').AsFloat     := cdsItens.FieldByName('IDPRODVARI').AsFloat;

         cdsItensAtrib.FieldByName('VALORUNIT').AsFloat      := cdsItens.FieldByName('VALORUNIT').AsFloat;
         cdsItensAtrib.FieldByName('VALORTOTAL').AsFloat     := cdsItens.FieldByName('VALORTOTAL').AsFloat;

         cdsItensAtrib.FieldByName('CODGRUPOPROD').AsString  := cdsItens.FieldByName('CODGRUPOPROD').AsString;

         cdsItensAtrib.Post;

         cdsItens.Delete;

         IndexCds := LstFornecedor.Add(TwwClientDataSet.Create(Self));
         TwwClientDataSet(LstFornecedor[IndexCds]).Tag  := CdsItensAtrib.FieldByName('IDPROCXART').AsInteger;
         TwwClientDataSet(LstFornecedor[IndexCds]).Data := ProcessoCompra.GetFornecedoresCotacao(Cds.FieldByName('CODPROCESSO').AsFloat,cdsItensAtrib.FieldByName('IDPROCXART').AsFloat,cdsItensAtrib.FieldByName('CODARTIGO').AsString);
         TwwClientDataSet(LstFornecedor[IndexCds]).IndexFieldNames := 'RAZAOSOCIAL';
         TwwClientDataSet(LstFornecedor[IndexCds]).ControlType.Add('STATUS;CheckBox;S;N');
       End;

    grdItem.UnselectAll;

    If Not cdsItens.IsEmpty then
       grdItem.SelectRecord;
   Finally
      cdsItens.EnableControls;
   End;
end;




procedure TFrmMTMontaProcesso.BtnRemoveClick(Sender: TObject);
Var
   x,y : Integer;
begin
  inherited;
  cdsItensAtrib.DisableControls;
  Try
     For x := 0 To grdItemAtrib.SelectedList.Count -1 Do
       Begin
           cdsItensAtrib.GotoBookmark(grdItemAtrib.SelectedList.Items[x]);

           cdsItens.Append;
           cdsItens.FieldByName('NUMSOLCOMPRA').AsFloat   := cdsItensAtrib.FieldByName('NUMSOLCOMPRA').AsFloat;
           cdsItens.FieldByName('CODARTIGO').AsString     := cdsItensAtrib.FieldByName('CODARTIGO').AsString;
           cdsItens.FieldByName('CODMEDIDA').AsString     := cdsItensAtrib.FieldByName('CODMEDIDA').AsString;
           cdsItens.FieldByName('QTDEPEDIDA').AsFloat     := cdsItensAtrib.FieldByName('QTDEPEDIDA').AsFloat;
           cdsItens.FieldByName('DESCRICAO').AsString     := cdsItensAtrib.FieldByName('DESCRICAO').AsString;
           cdsItens.FieldByName('IDITEMSOLI').AsFloat     := cdsItensAtrib.FieldByName('IDITEMSOLI').AsFloat;
           cdsItens.FieldByName('NECESSIDADE').AsDateTime := cdsItensAtrib.FieldByName('DATAENTREGA').AsDateTime;
           cdsItens.FieldByName('CODMEDCUSTO').AsString   := cdsItensAtrib.FieldByName('CODMEDCUSTO').AsString;
           cdsItens.FieldByName('IDPRODVARI').AsFloat     := cdsItensAtrib.FieldByName('IDPRODVARI').AsFloat;

           cdsItens.FieldByName('CODGRUPOPROD').AsString  := cdsItensAtrib.FieldByName('CODGRUPOPROD').AsString;

           cdsItens.Post;

           // Exclui Atribição do Fornecedor
           For y := 0 To LstFornecedor.Count - 1 Do
              If (TwwClientDataSet(LstFornecedor[y]).Tag = cdsItensAtrib.FieldByName('IDPROCXART').AsInteger) Then
                 Begin
                   LstFornecedor.Delete( y );
                   break;
                 End;

           cdsItensAtrib.Delete;

       End;
    grdItemAtrib.UnselectAll;

    If Not cdsItensAtrib.IsEmpty then
       grdItemAtrib.SelectRecord;


  Finally
     cdsItensAtrib.EnableControls;
  End;
end;




procedure TFrmMTMontaProcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LstFornecedor.Free;
  ProcessoCompra.Free;
  Artigo.Free;
  SoliCompra.Free;
  GrupoProd.Free;
end;




procedure TFrmMTMontaProcesso.GrdItemAtribDblClick(Sender: TObject);
Begin;
   ShowAtribFornecedor;
end;

procedure TFrmMTMontaProcesso.ShowAtribFornecedor;
Var
  x   : Integer;
begin
  inherited;
  IndexCds := -1;
  // Verifica se a lista de fornecedores ja foi carregada
  For x := 0 To LstFornecedor.Count - 1 Do
    If (TwwClientDataSet(LstFornecedor[x]).Tag = cdsItensAtrib.FieldByName('IDPROCXART').AsInteger) Then
       Begin
         IndexCds := x;
         break;
       End;

  If IndexCds >= 0  Then
  Begin
     dsAtribForn.DataSet := TwwClientDataSet(LstFornecedor[IndexCds]);

     TwwClientDataSet(LstFornecedor[IndexCds]).First;

     twAtribForn.Caption := 'Atribuição de Fornecedor  - '+ cdsItensAtrib.FieldByName('DESCRICAO').AsString;
     twAtribForn.show;
  End;
end;




procedure TFrmMTMontaProcesso.Sel(CodProcesso: Double);
begin
  cds.Data := ProcessoCompra.Procurar( CodProcesso );
  //
  cdsItensAtrib.Data := ProcessoCompra.GetItensAtribuidos( CodProcesso );
  cdsCotacao.Data    := ProcessoCompra.GetCotacao( CodProcesso );
  cdsNovoForn.Data   := ProcessoCompra.GetNovoFornecedor;
  
  cdsItens.Data      := SoliCompra.ListSoliCompra(False,-1);

  //----------------------------------------------------------------------------
  // Monta A Lista virtual de seleção dos fornecedores
  //----------------------------------------------------------------------------
  LstFornecedor.Clear;
  cdsItensAtrib.DisableControls;
  Try
     cdsItensAtrib.First;
     While Not cdsItensAtrib.Eof Do
        Begin
            IndexCds := LstFornecedor.Add(TwwClientDataSet.Create(Self));
            TwwClientDataSet(LstFornecedor[IndexCds]).Tag  := CdsItensAtrib.FieldByName('IDPROCXART').AsInteger;
            TwwClientDataSet(LstFornecedor[IndexCds]).Data := ProcessoCompra.GetFornecedoresCotacao(cds.FieldByName('CODPROCESSO').AsFloat,cdsItensAtrib.FieldByName('IDPROCXART').AsFloat,cdsItensAtrib.FieldByName('CODARTIGO').AsString);
            TwwClientDataSet(LstFornecedor[IndexCds]).ControlType.Add('STATUS;CheckBox;S;N');
            TwwClientDataSet(LstFornecedor[IndexCds]).IndexFieldNames := 'RAZAOSOCIAL';
           cdsItensAtrib.Next;
        End;
  Finally
     cdsItensAtrib.EnableControls;
  End;
end;




procedure TFrmMTMontaProcesso.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  cds.FieldByName('STATUS').AsString     := 'P';
  cds.FieldByName('IDCOMPRADOR').AsFloat := Sistema.IdUsuario;
end;




procedure TFrmMTMontaProcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;




procedure TFrmMTMontaProcesso.btnMarcaTodosClick(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
     For x := 0 To LstFornecedor.Count - 1 Do
       If (TwwClientDataSet(LstFornecedor[x]).Tag = cdsItensAtrib.FieldByName('IDPROCXART').AsInteger) Then
          Begin
            TwwClientDataSet(LstFornecedor[x]).DisableControls;
            Try
               TwwClientDataSet(LstFornecedor[x]).First;
               While Not TwwClientDataSet(LstFornecedor[x]).Eof Do
                  Begin
                      TwwClientDataSet(LstFornecedor[x]).Edit;

                      //Testa a restrição  do fornecedor
                      If TestaRestricao(TwwClientDataSet(LstFornecedor[x]).FieldByName('IDFORCLI').AsInteger,
                                        TwwClientDataSet(LstFornecedor[x]).FieldByName('RAZAOSOCIAL').AsString
                                       ,CdsItensAtrib.FieldByName('CODARTIGO').AsString,False) = 'N'
                      Then
                         TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString := 'N'
                      Else
                         TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString := 'S';

                      TwwClientDataSet(LstFornecedor[x]).Post;
                      TwwClientDataSet(LstFornecedor[x]).Next;
                  End;
               TwwClientDataSet(LstFornecedor[x]).First;
            Finally
               TwwClientDataSet(LstFornecedor[x]).EnableControls;
            End;
          End;
end;




procedure TFrmMTMontaProcesso.btnInvertSelClick(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
     For x := 0 To LstFornecedor.Count - 1 Do
       If (TwwClientDataSet(LstFornecedor[x]).Tag = cdsItensAtrib.FieldByName('IDPROCXART').AsInteger) Then
          Begin
            TwwClientDataSet(LstFornecedor[x]).DisableControls;
            Try
               TwwClientDataSet(LstFornecedor[x]).First;
               While Not TwwClientDataSet(LstFornecedor[x]).Eof Do
                  Begin
                      TwwClientDataSet(LstFornecedor[x]).Edit;
                      If TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString = 'N' Then
                         TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString := 'S'
                      Else
                         TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString := 'N';

                      //Testa a restrição  do fornecedor
                      If TestaRestricao(TwwClientDataSet(LstFornecedor[x]).FieldByName('IDFORCLI').AsInteger,
                                        TwwClientDataSet(LstFornecedor[x]).FieldByName('RAZAOSOCIAL').AsString,
                                        CdsItensAtrib.FieldByName('CODARTIGO').AsString,False) = 'N'
                      Then
                         TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString := 'N';

                      TwwClientDataSet(LstFornecedor[x]).Post;
                      TwwClientDataSet(LstFornecedor[x]).Next;
                  End;
               TwwClientDataSet(LstFornecedor[x]).First;
            Finally
               TwwClientDataSet(LstFornecedor[x]).EnableControls;
            End;
          End;
end;




procedure TFrmMTMontaProcesso.btnCopiaSelClick(Sender: TObject);
Var
    x : Integer;
begin
  inherited;
  TwwClientDataSet(LstFornecedor[IndexCds]).DisableControls;
  Try
     TwwClientDataSet(LstFornecedor[IndexCds]).First;
     While Not TwwClientDataSet(LstFornecedor[IndexCds]).Eof Do
        Begin
           For x := 0 To LstFornecedor.Count - 1 Do
              If ( x <> IndexCds ) And ( TwwClientDataSet(LstFornecedor[x]).Locate('IDFORCLI',TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('IDFORCLI').asFloat,[]) ) Then
                 Begin
                   TwwClientDataSet(LstFornecedor[x]).Edit;
                   TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString := TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('STATUS').AsString;
                   TwwClientDataSet(LstFornecedor[x]).Post;
                 End
              Else
              If ( x <> IndexCds ) And (TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('STATUS').AsString = 'S') Then
                 Begin
                   TwwClientDataSet(LstFornecedor[x]).Append;
                   TwwClientDataSet(LstFornecedor[x]).FieldByName('IDFORCLI').AsFloat     := TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('IDFORCLI').AsFloat;
                   TwwClientDataSet(LstFornecedor[x]).FieldByName('CODPROCESSO').AsFloat  := -1;
                   TwwClientDataSet(LstFornecedor[x]).FieldByName('IDPROCXART').AsFloat   := TwwClientDataSet(LstFornecedor[x]).Tag;
                   TwwClientDataSet(LstFornecedor[x]).FieldByName('RAZAOSOCIAL').asString := TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('RAZAOSOCIAL').asString;
                   TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString      := TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('STATUS').AsString;
                   TwwClientDataSet(LstFornecedor[x]).Post;
                 End;


           TwwClientDataSet(LstFornecedor[IndexCds]).Next;
        End;
     //-----------------------------------------------------------------------------------
     // Descmar os fornecedores que não pertence ao artigo copiada
     //-----------------------------------------------------------------------------------
     For x := 0 To LstFornecedor.Count - 1 Do
        Begin
           TwwClientDataSet(LstFornecedor[x]).First;
           While Not TwwClientDataSet(LstFornecedor[x]).Eof Do
              Begin
                 If ( x <> IndexCds ) And ( Not TwwClientDataSet(LstFornecedor[IndexCds]).Locate('IDFORCLI',TwwClientDataSet(LstFornecedor[x]).FieldByName('IDFORCLI').asFloat,[]) ) Then
                    Begin
                       TwwClientDataSet(LstFornecedor[x]).Edit;
                       TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString := 'N';
                       TwwClientDataSet(LstFornecedor[x]).Post;
                    End;

                 TwwClientDataSet(LstFornecedor[x]).Next;
              End;
        End;
     //-----------------------------------------------------------------------------------

     TwwClientDataSet(LstFornecedor[IndexCds]).First;
  Finally
     TwwClientDataSet(LstFornecedor[IndexCds]).EnableControls;
  End;
End;




procedure TFrmMTMontaProcesso.twAtribFornVisibleChanged(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := Not twAtribForn.Visible;
  Dock971.Enabled  := Not twAtribForn.Visible;
end;




procedure TFrmMTMontaProcesso.GravaCotacao;
Var
   x : Integer;
begin
   For x := 0 To LstFornecedor.Count - 1 Do
     Begin
        TwwClientDataSet(LstFornecedor[x]).First;
        While Not TwwClientDataSet(LstFornecedor[x]).Eof Do
           Begin
               If (TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString = 'S') Then
                  Begin
                     If CdsCotacao.Locate('CODPROCESSO;IDPROCXART;IDFORCLI',
                                           VarArrayOf([TwwClientDataSet(LstFornecedor[x]).FieldByName('CODPROCESSO').asFloat,
                                                       TwwClientDataSet(LstFornecedor[x]).Tag,
                                                       TwwClientDataSet(LstFornecedor[x]).FieldByName('IDFORCLI').asFloat]),[])
                     Then
                           Begin
                              CdsCotacao.Edit;
                              cdsCotacao.FieldByName('STATUS').AsString := 'S';
                              CdsCotacao.Post;
                           End
                        Else
                           Begin
                              cdsCotacao.Append;
                              cdsCotacao.FieldByName('CODPROCESSO').AsFloat := TwwClientDataSet(LstFornecedor[x]).FieldByName('CODPROCESSO').asFloat;
                              cdsCotacao.FieldByName('IDPROCXART').AsFloat  := TwwClientDataSet(LstFornecedor[x]).Tag; {equivale ao IDPROCXART}
                              cdsCotacao.FieldByName('IDFORCLI').AsFloat    := TwwClientDataSet(LstFornecedor[x]).FieldByName('IDFORCLI').asFloat;
                              cdsCotacao.FieldByName('STATUS').AsString     := TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString;
                              cdsCotacao.Post;
                           End;
                  End
               Else
               If (TwwClientDataSet(LstFornecedor[x]).FieldByName('STATUS').AsString = 'N') Then
                  Begin
                     CdsCotacao.Filter   := 'CODPROCESSO = '+ TwwClientDataSet(LstFornecedor[x]).FieldByName('CODPROCESSO').AsString +
                                            ' AND IDPROCXART = '+ IntToStr(TwwClientDataSet(LstFornecedor[x]).Tag) +
                                            ' AND IDFORCLI = '+ TwwClientDataSet(LstFornecedor[x]).FieldByName('IDFORCLI').AsString;
                     CdsCotacao.Filtered := True;
                     Try
                        If Not CdsCotacao.IsEmpty Then
                           Begin
                              CdsCotacao.Edit;
                              cdsCotacao.FieldByName('STATUS').AsString := 'N';
                              CdsCotacao.Post;
                           End;
                     Finally
                        CdsCotacao.Filter   := '';
                        CdsCotacao.Filtered := False;
                     End;
                  End;
               TwwClientDataSet(LstFornecedor[x]).Next;
           End;
     End;
end;




procedure TFrmMTMontaProcesso.CmeCadastroConfirma(Sender: TObject);
begin
  If cds.State In dsEditModes Then
     Begin
        GravaCotacao;
        If ProcessoCompra.Gravar( Sistema.IdEmpresa,Sistema.IdUsuario ) Then
           MsgDlg('Gerado Processo Nº ' + ProcessoCompra.MessageInfo ,'Aviso',mtInformation,[mbOK],0)
        Else
           MsgDlg(ProcessoCompra.MessageInfo,'Erro',mtError,[mbOK],0);
     End
  Else
  inherited;
end;




procedure TFrmMTMontaProcesso.CmeCadastroDelete(Sender: TObject);
begin
  cdsItensAtrib.First;
  While Not cdsItensAtrib.Eof Do
  cdsItensAtrib.Delete;
  inherited;
end;




procedure TFrmMTMontaProcesso.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ProcessoCompra.Excluir;
end;




procedure TFrmMTMontaProcesso.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;




procedure TFrmMTMontaProcesso.btnAddFornecedorClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmMTAdicionaForn,FrmMTAdicionaForn);
  cdsItensAtrib.DisableControls;
  Try
     FrmMTAdicionaForn.cds.Data := ProcessoCompra.GetNovoFornecedor;
     FrmMTAdicionaForn.cds.ControlType.Add('ATRIBUIDO;CheckBox;S;N');
     cdsItensAtrib.First;
     While Not cdsItensAtrib.Eof Do
        Begin
           With FrmMTAdicionaForn.cds Do
              Begin
                 Append;
                 FieldByName('ATRIBUIDO').AsString     := 'N';
                 FieldByName('CODARTIGO').AsString     := cdsItensAtrib.FieldByName('CODARTIGO').AsString;
                 FieldByName('UNIDADE').AsString       := cdsItensAtrib.FieldByName('CODMEDIDA').AsString;
                 FieldByName('QTDE').AsFloat           := cdsItensAtrib.FieldByName('QTDEPEDIDA').AsFloat;
                 FieldByName('DESCRICAO').AsString     := cdsItensAtrib.FieldByName('DESCRICAO').AsString;
                 FieldByName('IDPROCXART').AsFloat     := cdsItensAtrib.FieldByName('IDPROCXART').AsFloat;
                 Post;
              End;
           cdsItensAtrib.Next;
        End;
  Finally
     cdsItensAtrib.EnableControls;
  End;

  FrmMTAdicionaForn.ShowModal;

end;




procedure TFrmMTMontaProcesso.btnFecharClick(Sender: TObject);
begin
  inherited;
  twAtribForn.Hide;
end;




procedure TFrmMTMontaProcesso.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Sel(cds.fieldByName('CODPROCESSO').AsFloat);

end;




function TFrmMTMontaProcesso.TestaRestricao(idForCli: Integer;
  sRazaoSocial, sCodArt: String; bMostra: Boolean): String;
begin
   Result := 'L';
   AvaliacaoForn.IdForCli         := idForCli;
   AvaliacaoForn.RazaoSocial      := sRazaoSocial;
   AvaliacaoForn.IdPessoa         := Sistema.IdEmpresa;
   AvaliacaoForn.CodArtigo        := sCodArt;
   AvaliacaoForn.MostraRestricao  := bMostra;

   cdsRestricao.Data := AvaliacaoForn.ViewRestricao;

   If Not cdsRestricao.IsEmpty  Then
      Begin
         Result := 'S';
         If cdsRestricao.Locate('FLGFLEXIVEL','N',[]) Then
            Result := 'N';
      End;
end;




procedure TFrmMTMontaProcesso.GrdAtribFornFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
 If (Field.Name = 'ATRIBUIDO' ) And (Field.AsString = 'S') Then
      Begin
         If TestaRestricao(TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('IDFORCLI').AsInteger,
                           TwwClientDataSet(LstFornecedor[IndexCds]).FieldByName('RAZAOSOCIAL').AsString
                           ,CdsItensAtrib.FieldByName('CODARTIGO').AsString,True) = 'N'
         Then
            Begin
               MsgDlg('Existem restrições não flexiveis. Cotação proibida','Atenção',mtError,[mbOK],0);
               Field.AsString := 'N';
            End;
      End;
end;

end.
