unit FMontaProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  wwdblook, CMDBLookupCombo, Mask, DBCtrls, fcTreeView, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TFrmMontaProcesso = class(TfrmCadastroCS)
    ToolbarSep972: TToolbarSep97;
    PgProc: TPageControl;
    TabItens: TTabSheet;
    tabAtribForn: TTabSheet;
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
    Label5: TLabel;
    edProc: TDBEdit;
    qryItem: TwwQuery;
    qrySCICombo: TwwQuery;
    FloatField4: TFloatField;
    dsItem: TwwDataSource;
    qryArtigo: TwwQuery;
    updItem: TUpdateSQL;
    qryGrupo: TwwQuery;
    qryGrupoDESCGRUPOPROD: TStringField;
    qryGrupoCODGRUPOPROD: TStringField;
    qryItemAtrib: TwwQuery;
    dsItemAtrib: TwwDataSource;
    updItemAtrib: TUpdateSQL;
    qryCODPROCESSO: TFloatField;
    qrySTATUS: TStringField;
    qryIDCOMPRADOR: TFloatField;
    qryItemNUMSOLCOMPRA: TFloatField;
    qryItemCODARTIGO: TStringField;
    qryItemCODMEDIDA: TStringField;
    qryItemQTDEPEDIDA: TFloatField;
    qryItemDESCRICAO: TStringField;
    qryItemIDITEMSOLI: TFloatField;
    qryItemDATAENTREGA: TDateTimeField;
    qryItemCODPROCESSO: TFloatField;
    qryItemAtribNUMSOLCOMPRA: TFloatField;
    qryItemAtribCODARTIGO: TStringField;
    qryItemAtribCODMEDIDA: TStringField;
    qryItemAtribQTDEPEDIDA: TFloatField;
    qryItemAtribDESCRICAO: TStringField;
    qryItemAtribIDITEMSOLI: TFloatField;
    qryItemAtribDATAENTREGA: TDateTimeField;
    qryItemAtribCODPROCESSO: TFloatField;
    plnAtrbForne: TPanel;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    BtnAddForne: TSpeedButton;
    qryProcxArt: TwwQuery;
    updProcxArt: TUpdateSQL;
    qryProcxArtIDPROCXART: TFloatField;
    qryProcxArtCODPROCESSO: TFloatField;
    qryProcxArtCODARTIGO: TStringField;
    qryProcxArtQTDEPEDIDA: TFloatField;
    qryProcxArtCODMEDIDA: TStringField;
    qryProcxArtJUSTIFICATIVA: TStringField;
    qryProcxArtDATANECESSIDADE: TDateTimeField;
    qryProcxArtSTATUS: TStringField;
    qryProcxArtIDPRODVARI: TFloatField;
    qryProcxArtDESCRICAO: TStringField;
    qryItemAtribCODMEDCUSTO: TStringField;
    qryItemCODMEDCUSTO: TStringField;
    qryItemAtribIDPROCXART: TFloatField;
    qryItemIDPROCXART: TFloatField;
    qryItemAtribIDPRODVARI: TFloatField;
    qryItemIDPRODVARI: TFloatField;
    qryArtxForn: TwwQuery;
    TreeCot: TfcTreeView;
    ImageList1: TImageList;
    qryTree: TwwQuery;
    updTree: TUpdateSQL;
    qryTreeIDFORCLI: TFloatField;
    qryTreeIDPROCXART: TFloatField;
    qryTreeCODPROCESSO: TFloatField;
    qryTreeCODARTIGO: TStringField;
    qryTreeDESCRICAO: TStringField;
    qryTreeRAZAOSOCIAL: TStringField;
    qryTreeSTATUS: TStringField;
    qryArtxFornIDFORCLI: TFloatField;
    qryArtxFornCODARTIGO: TStringField;
    qryArtxFornRAZAOSOCIAL: TStringField;
    qryForneCot: TwwQuery;
    updForneCot: TUpdateSQL;
    dsTree: TwwDataSource;
    qryForneCotIDFORCLI: TFloatField;
    qryForneCotRAZAOSOCIAL: TStringField;
    qryCotacao: TwwQuery;
    updCotacao: TUpdateSQL;
    qryCotacaoIDFORCLI: TFloatField;
    qryCotacaoIDPROCXART: TFloatField;
    qryCotacaoCODPROCESSO: TFloatField;
    qryCotacaoCODARTIGO: TStringField;
    qryCotacaoDESCRICAO: TStringField;
    qryCotacaoRAZAOSOCIAL: TStringField;
    qryCotacaoSTATUS: TStringField;
    dsForneCot: TwwDataSource;
    dsProcxArt: TwwDataSource;
    qryItemNovoForn: TwwQuery;
    updItemNovoForn: TUpdateSQL;
    dsItemNovoForn: TwwDataSource;
    qryItemNovoFornIDPROCXART: TFloatField;
    qryItemNovoFornCODPROCESSO: TFloatField;
    qryItemNovoFornCODARTIGO: TStringField;
    qryItemNovoFornQTDEPEDIDA: TFloatField;
    qryItemNovoFornCODMEDIDA: TStringField;
    qryItemNovoFornJUSTIFICATIVA: TStringField;
    qryItemNovoFornDATANECESSIDADE: TDateTimeField;
    qryItemNovoFornATRIBUIDO: TStringField;
    qryItemNovoFornIDPRODVARI: TFloatField;
    qryItemNovoFornDESCRICAO: TStringField;
    GrdItemAtrib: TwwDBGrid;
    qryRestricao: TwwQuery;
    qryAtuCotacao: TwwQuery;
    updAtuCotacao: TUpdateSQL;
    qryAtuCotacaoIDPROCXART: TFloatField;
    qryAtuCotacaoIDFORCLI: TFloatField;
    qryAtuCotacaoCODPROCESSO: TFloatField;
    qryAtuCotacaoPROPOSTA: TFloatField;
    qryAtuCotacaoQTDEFORNECIDA: TFloatField;
    qryAtuCotacaoCODMEDIDA: TStringField;
    qryAtuCotacaoSTATUS: TStringField;
    updAtuArtxForn: TUpdateSQL;
    qryAtuArtxForn: TwwQuery;
    qryVerifArtxForn: TwwQuery;
    qryAtuArtxFornIDFORCLI: TFloatField;
    qryAtuArtxFornCODARTIGO: TStringField;
    qryVerifArtxFornIDFORCLI: TFloatField;
    qryVerifArtxFornCODARTIGO: TStringField;
    plnSel: TPanel;
    Label1: TLabel;
    dblcSCI: TCMDBLookupCombo;
    Label3: TLabel;
    dblcArt: TwwDBLookupCombo;
    Label2: TLabel;
    dblcGrupo: TCMDBLookupCombo;
    Label4: TLabel;
    edDataNec: TCMDateTimePicker;
    RgEmpresa: TRadioGroup;
    Bevel6: TBevel;
    BtnSelecinar: TSpeedButton;
    BtnLimpar: TSpeedButton;
    qryPrazoEnt: TwwQuery;
    updPrazoEnt: TUpdateSQL;
    updPrazoPgto: TUpdateSQL;
    qryPrazoPgto: TwwQuery;
    qryAgregItem: TwwQuery;
    updAgregItem: TUpdateSQL;
    qryPrazoPgtoIDPROCXART: TFloatField;
    qryPrazoEntIDPROCXART: TFloatField;
    qryAgregItemIDPROCXART: TFloatField;
    qryPrazoPgtoIDFORCLI: TFloatField;
    qryPrazoEntIDFORCLI: TFloatField;
    qryAgregItemIDFORCLI: TFloatField;
    qryPrazoPgtoCODPROCESSO: TFloatField;
    qryPrazoPgtoPROPOSTA: TFloatField;
    qryPrazoEntCODPROCESSO: TFloatField;
    qryPrazoEntPROPOSTA: TFloatField;
    qryAgregItemCODPROCESSO: TFloatField;
    qryAgregItemPROPOSTA: TFloatField;
    qryPrazoPgtoIDPRAZOPGTO: TFloatField;
    qryPrazoEntIDPRAZOENT: TFloatField;
    qryAgregItemCODTIPOCUSTAGREG: TFloatField;
    BtnCopiaSel: TSpeedButton;
    procedure BtnSelecinarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure PgProcChange(Sender: TObject);
    procedure BtnAddForneClick(Sender: TObject);
    procedure qryItemNovoFornATRIBUIDOChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure TreeCotToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure BtnCopiaSelClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    bMonta     : Boolean;
  public
    { Public declarations }
    //
    Procedure MontaSel( NumSCI : LongInt; sCodArt,sCodGrupoProd : String );
    Procedure Sel( n : LongInt);
    Procedure SelFilhos( n : LongInt);
    Procedure Move( Var qo, qd : TwwQuery);
    Procedure GravaProcxArt(sCodArt,sDescricao : String; iIdProdVari : LongInt; rQtde : Double; sUnid,sUnidCusto : String; dData : TDateTime; Var idProcxArt : LongInt);
    Procedure GravaArvore(cTipo : Char);
    Procedure MontaArvore;
    Function  TestaRestricao(idForCli :LongInt; sRazaoSocial, sCodArt : String; bMostra : Boolean) : String;
  end;

var
  FrmMontaProcesso: TFrmMontaProcesso;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uString, uDataBase,UConversaoMed,dBaseDados,
     FAdicionaForn,uAvaliForn;

Procedure TFrmMontaProcesso.CmeCadastroAtualizaBotoes(Sender: TObject);
Var
   b : Boolean;
Begin
    inherited;
    pnlFundo.Enabled := True;
    If qry.State in [dsInsert,dsEdit] Then
      b := True
    Else
      b := False;
    plnSel.Enabled       := b;
    plnOpItem.Enabled    := b;
    plnAtrbForne.Enabled := b;
End;

Procedure TFrmMontaProcesso.MontaSel( NumSCI : LongInt; sCodArt,sCodGrupoProd : String );
Begin
    qryItem.Close;
    qryItem.Sql.Clear;
    qryItem.Sql.Add(' SELECT                                                                  ');
    qryItem.Sql.Add('	  IT.NUMSOLCOMPRA,                                                    ');
    qryItem.Sql.Add('     IT.IDITEMSOLI,                                                      ');
    qryItem.Sql.Add('	  IT.CODARTIGO,                                                       ');
    qryItem.Sql.Add('	  IT.CODMEDIDA,                                                       ');
    qryItem.Sql.Add('     IT.QTDEPEDIDA,                                                      ');
    qryItem.Sql.Add('	  SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO, ');
    qryItem.Sql.Add('     SC.DATAENTREGA,                                                     ');
    qryItem.Sql.Add('     IT.CODPROCESSO,                                                     ');
    qryItem.Sql.Add('     P.CODMEDCUSTO,                                                      ');
    qryItem.Sql.Add('     IT.IDPROCXART,                                                      ');
    qryItem.Sql.Add('     IT.IDPRODVARI                                                       ');
    qryItem.Sql.Add(' FROM                                            ');
    qryItem.Sql.Add('       ITEMSOLI IT,                              ');
    qryItem.Sql.Add('       SOLICOMP SC,                              ');
    qryItem.Sql.Add('       PRODUTO P,                                ');
    qryItem.Sql.Add('       ARTIGO A,                                 ');
    qryItem.Sql.Add('       PRODVARI PV                               ');
    qryItem.Sql.Add(' WHERE                                           ');
    qryItem.Sql.Add('       (IT.CODPROCESSO IS NULL )                 ');
    qryItem.Sql.Add('   AND (IT.QTDEPENDENTE > 0 )                    ');    
    qryItem.Sql.Add('   AND (IT.IDCOMPRADOR = '+IntToStr(Sistema.IdUsuario)+')');
    If NumSCI >= 0 Then
      qryItem.Sql.Add('   AND (IT.NUMSOLCOMPRA = '+IntToStr(NumSCI)+')')
    Else
    If Trim(sCodArt) <> '' Then
      qryItem.Sql.Add('   AND (IT.CODARTIGO = '''+Espaco( Trim( sCodArt ),14)+''')')
    Else
    If Trim(sCodGrupoProd) <> '' Then
      qryItem.Sql.Add('   AND (RTRIM(P.CODGRUPOPROD) = '''+TRIM(sCodGrupoProd)+''') ')
    Else
    If Trim(edDataNec.Text) <> '' Then
      qryItem.Sql.Add('   AND (SC.DATAENTREGA = TO_DATE('''+DateToStr(edDataNec.date)+''',''DD/MM/YYYY'')) ');
    If RgEmpresa.ItemIndex = 0 Then
      qryItem.Sql.Add('   AND (SC.IDPESSOA = '+IntToStr( Sistema.IdEmpresa )+')');

    qryItem.Sql.Add('  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)');
    qryItem.Sql.Add('  AND (IT.CODARTIGO = A.CODARTIGO)                      ');
    qryItem.Sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO)                     ');
    qryItem.Sql.Add('  AND (IT.IDPRODVARI = PV.IDPRODVARI(+))                ');
    qryItem.Sql.Add('  ORDER BY DESCRICAO, SC.DATAENTREGA  ');
    qryItem.Open;
End;

Procedure TFrmMontaProcesso.Sel( n : LongInt);
Begin
  qry.Close;
  If Not qry.Prepared Then qry.Prepare;
  qry.ParamByName('pCODPROCESSO').AsInteger := n;
  qry.Open;
  //
  SelFilhos( n );
End;

Procedure TFrmMontaProcesso.SelFilhos( n : LongInt);
Begin
  qryItemAtrib.Close;
  qryItemAtrib.ParamByName('CODPROCESSO').AsInteger := n;
  qryItemAtrib.Open;
  //
  qryProcxArt.Close;
  qryProcxArt.ParamByName('CODPROCESSO').AsInteger := n;
  qryProcxArt.Open;
  //
  qryCotacao.Close;
  qryCotacao.ParamByName('CODPROCESSO').AsInteger := n;
  qryCotacao.Open;
  //
  qryAtuCotacao.Close;
  qryAtuCotacao.ParamByName('CODPROCESSO').AsInteger := n;
  qryAtuCotacao.Open;
  //
  qryAgregItem.Close;
  qryAgregItem.ParamByName('CODPROCESSO').AsInteger := n;
  qryAgregItem.Open;
  //
  qryPrazoEnt.Close;
  qryPrazoEnt.ParamByName('CODPROCESSO').AsInteger := n;
  qryPrazoEnt.Open;
  //
  qryPrazoPgto.Close;
  qryPrazoPgto.ParamByName('CODPROCESSO').AsInteger := n;
  qryPrazoPgto.Open;
End;

procedure TFrmMontaProcesso.BtnSelecinarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcSCI.Text) <> '' Then
     MontaSel( StrToInt(dblcSCI.LookupValue),'','')
  Else
  If Trim(dblcArt.Text) <> '' Then
     MontaSel( -1,dblcArt.LookupValue,'')
  Else
  If Trim(dblcGrupo.Text) <> '' Then
     MontaSel(-1,'',dblcGrupo.LookupValue)
  Else
     MontaSel(-1,'','');
end;

procedure TFrmMontaProcesso.BtnLimparClick(Sender: TObject);
begin
  inherited;
  dblcSCI.Clear;
  dblcArt.Clear;
  dblcGrupo.Clear;
  edDataNec.Clear;
end;

procedure TFrmMontaProcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AvaliForn.Free;
  //
  qryItemAtrib.Close;
  If qryItemAtrib.Prepared Then qryItemAtrib.UnPrepare;
  qry.Close;
  If qry.Prepared Then qry.UnPrepare;
  qryProcxArt.Close;
  If qryProcxArt.Prepared Then qryProcxArt.UnPrepare;
  qryTree.Close;
  If qryTree.Prepared Then qryTree.UnPrepare;
  qryCotacao.Close;
  If qryCotacao.Prepared Then qryCotacao.UnPrepare;
  qryAtuCotacao.Close;
  If qryAtuCotacao.Prepared Then qryAtuCotacao.UnPrepare;
  qryPrazoPgto.Close;
  If qryPrazoPgto.Prepared Then qryPrazoPgto.UnPrepare;
  qryPrazoEnt.Close;
  If qryPrazoEnt.Prepared Then qryPrazoEnt.UnPrepare;
  qryAgregItem.Close;
  If qryAgregItem.Prepared Then qryAgregItem.UnPrepare;
  qryVerifArtxForn.Close;
  If qryVerifArtxForn.Prepared Then qryVerifArtxForn.UnPrepare;
End;

procedure TFrmMontaProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  AvaliForn := TAvaliForn.Create;
  //
  MontaSelect.Filtro.Add('PROCESSO.IDCOMPRADOR ='+IntToStr(Sistema.IdUsuario));

  qrySCICombo.Close;
  qrySCICombo.Params[0].AsFloat := Sistema.IdUsuario;
  qrySCICombo.Open;
  //
  qryItemAtrib.Close;
  If Not qryItemAtrib.Prepared Then qryItemAtrib.Prepare;
  qryProcxArt.Close;
  If Not qryProcxArt.Prepared Then qryProcxArt.Prepare;
  qryTree.Close;
  If Not qryTree.Prepared Then qryTree.Prepare;
  qryCotacao.Close;
  If Not qryCotacao.Prepared Then qryCotacao.Prepare;
  qryAtuCotacao.Close;
  If Not qryAtuCotacao.Prepared Then qryAtuCotacao.Prepare;
  qryPrazoPgto.Close;
  If Not qryPrazoPgto.Prepared Then qryPrazoPgto.Prepare;
  qryPrazoEnt.Close;
  If Not qryPrazoEnt.Prepared Then qryPrazoEnt.Prepare;
  qryAgregItem.Close;
  If Not qryAgregItem.Prepared Then qryAgregItem.Prepare;
  qryVerifArtxForn.Close;
  If Not qryVerifArtxForn.Prepared Then qryVerifArtxForn.Prepare;

  Sel(-1);

  MontaSel(0,'','');
end;

procedure TFrmMontaProcesso.BtnAdicionaClick(Sender: TObject);
Var
   x          : Integer;
   IdProcxArt : LongInt;
begin
  inherited;
  qryItem.DisableControls;
  For x := 0 To GrdItem.SelectedList.Count -1 Do
    Begin
        qryItem.GotoBookmark(GrdItem.SelectedList.Items[x]);
        Move(qryItem,qryItemAtrib);
        GravaProcxArt(qryItemAtribCODARTIGO.AsString,
                      qryItemAtribDESCRICAO.AsString,
                      qryItemAtribIDPRODVARI.AsInteger,
                      qryItemAtribQTDEPEDIDA.AsFloat,
                      qryItemAtribCODMEDIDA.AsString,
                      qryItemAtribCODMEDCUSTO.AsString,
                      qryItemAtribDATAENTREGA.asDateTime,
                      IdProcxArt);
        qryItemAtrib.Edit;
        qryItemAtribIDPROCXART.AsInteger := IdProcxArt;
        qryItemAtrib.Post;
    End;
  qryItem.EnableControls;
end;

procedure TFrmMontaProcesso.BtnRemoveClick(Sender: TObject);
Var
   x          : Integer;
   IdProcxArt : LongInt;
begin
  inherited;
  qryItemAtrib.DisableControls;
  For x := 0 To grdItemAtrib.SelectedList.Count -1 Do
    Begin
        qryItemAtrib.GotoBookmark(grdItemAtrib.SelectedList.Items[x]);
        GravaProcxArt(qryItemAtribCODARTIGO.AsString,
                      qryItemAtribDESCRICAO.AsString,
                      qryItemAtribIDPRODVARI.AsInteger,
                      qryItemAtribQTDEPEDIDA.AsFloat*-1,
                      qryItemAtribCODMEDIDA.AsString,
                      qryItemAtribCODMEDCUSTO.AsString,
                      qryItemAtribDATAENTREGA.asDateTime,
                      IdProcxArt);
        Move(qryItemAtrib,qryItem);
    End;
  qryItemAtrib.EnableControls;
end;

Procedure TFrmMontaProcesso.Move( Var qo, qd : TwwQuery);
Var
  x : Integer;
Begin
   qd.Append;
   For x := 0 To qo.FieldCount -1 Do
     qd.Fields[x].Value := qo.Fields[x].Value;
   qd.FieldByName('CODPROCESSO').AsInteger := qryCODPROCESSO.AsInteger;
   qd.Post;
   qo.Delete;
End;

Procedure TFrmMontaProcesso.GravaProcxArt(sCodArt,sDescricao : String; iIdProdVari : LongInt; rQtde : Double; sUnid,sUnidCusto : String; dData : TDateTime; Var idProcxArt : LongInt);
Var
   bAchou : Boolean; 
Begin
   if iIdProdVari > 0  Then
      bAchou := qryProcxArt.Locate('CODARTIGO;IDPRODVARI',VarArrayOf([Espaco(Trim(sCodArt),14),iIdProdVari]),[])
   Else
      bAchou := qryProcxArt.Locate('CODARTIGO',Espaco(Trim(sCodArt),14),[]);
   if Not bAchou
   Then
      Begin
          qryProcxArt.Append;
          qryProcxArtIDPROCXART.AsInteger       := LeUltRegistro(nil,'PROCXART');
          qryProcxArtCODARTIGO.AsString         := sCodArt;
          qryProcxArtDESCRICAO.AsString         := sDescricao;
          qryProcxArtIDPRODVARI.AsInteger       := iIdProdVari;
          qryProcxArtQTDEPEDIDA.AsFloat         := ConversaoMed.ConverteQtdeUnCM(sCodArt,sUnid,rQtde);
          qryProcxArtCODMEDIDA.AsString         := sUnidCusto;
          qryProcxArtDATANECESSIDADE.AsDateTime := dDATA;
          qryProcxArt.Post;
      End
   Else
      Begin
          If Not qryProcxArt.IsEmpty Then
             Begin
                qryProcxArt.Edit;
                qryProcxArtQTDEPEDIDA.AsFloat := qryProcxArtQTDEPEDIDA.AsFloat + ConversaoMed.ConverteQtdeUnCM(sCodArt,sUnid,rQtde);
                If dData <  qryProcxArtDATANECESSIDADE.AsDateTime Then
                   qryProcxArtDATANECESSIDADE.AsDateTime := dDATA;
                qryProcxArt.Post;
             End;
      End;
   idProcxArt := qryProcxArtIDPROCXART.AsInteger;
   If(Not qryProcxArt.IsEmpty) And (qryProcxArtQTDEPEDIDA.AsFloat <= 0) Then
      Begin
         GravaArvore('D');
         qryProcxArt.Delete;
      End
   Else
      GravaArvore('A');
End;

Procedure TFrmMontaProcesso.GravaArvore(cTipo : Char);
Begin
    If cTipo = 'A' Then
       Begin
          // Verifica se existe o Artigo
          If Not qryCotacao.Locate('IDPROCXART',qryProcxArtIDPROCXART.AsFloat,[]) Then
             Begin
                qryArtxForn.Close;
                qryArtxForn.ParamByName('pCODARTIGO').AsString := Espaco(Trim(qryProcxArtCODARTIGO.AsString),14);
                qryArtxForn.Open;
                qryArtxForn.First;
                While Not qryArtxForn.Eof Do
                   Begin
                      qryCotacao.Insert;
                      qryCotacaoIDPROCXART.AsFloat   := qryProcxArtIDPROCXART.AsFloat;
                      qryCotacaoIDFORCLI.AsInteger   := qryArtxFornIDFORCLI.AsInteger;
                      qryCotacaoCODARTIGO.AsString   := qryProcxArtCODARTIGO.AsString;
                      qryCotacaoDESCRICAO.AsString   := qryProcxArtDESCRICAO.AsString;
                      qryCotacaoRAZAOSOCIAL.AsString := qryArtxFornRAZAOSOCIAL.AsString;
                      If TestaRestricao(qryArtxFornIDFORCLI.AsInteger,qryArtxFornRAZAOSOCIAL.AsString,qryProcxArtCODARTIGO.AsString,False) <> 'L' Then
                         qryCotacaoSTATUS.AsString := 'N'
                      Else
                         qryCotacaoSTATUS.AsString := 'S';
                      qryCotacao.Post;
                      qryArtxForn.Next;
                   End;
             End;
       End
    Else
    If cTipo = 'D' Then
       Begin
          qryCotacao.First;
          While not qryCotacao.EOF do
             Begin
                If qryCotacaoIDPROCXART.AsFloat = qryProcxArtIDPROCXART.AsFloat Then
                   qryCotacao.Delete
                Else
                   qryCotacao.Next;
             end;
          qryAtuCotacao.First;
          While not qryAtuCotacao.EOF do
             Begin
                If qryAtuCotacaoIDPROCXART.AsFloat = qryProcxArtIDPROCXART.AsFloat Then
                   qryAtuCotacao.Delete
                Else
                   qryAtuCotacao.Next;
             end;
          qryPrazoEnt.First;
          While not qryPrazoEnt.EOF do
             Begin
                If qryPrazoEntIDPROCXART.AsFloat = qryProcxArtIDPROCXART.AsFloat Then
                   qryPrazoEnt.Delete
                Else
                   qryPrazoEnt.Next;
             end;
          qryPrazoPgto.First;
          While not qryPrazoPgto.EOF do
             Begin
                If qryPrazoPgtoIDPROCXART.AsFloat = qryProcxArtIDPROCXART.AsFloat Then
                   qryPrazoPgto.Delete
                Else
                   qryPrazoPgto.Next;
             end;
          qryAgregItem.First;
          While not qryAgregItem.EOF do
             Begin
                If qryAgregItemIDPROCXART.AsFloat = qryProcxArtIDPROCXART.AsFloat Then
                   qryAgregItem.Delete
                Else
                   qryAgregItem.Next;
             end;
       End;
End;

Procedure TFrmMontaProcesso.MontaArvore;
Var
   NoPai, NoFilho : TfcTreeNode;
Begin
   //Monta a tabela de cotação (artigos x fornecedores) caso esta não esteja montada
   bMonta := False;
   TreeCot.Items.Clear;
   If qryCotacao.IsEmpty Then
      Begin
         qryProcxArt.First;
         While Not qryProcxArt.EOF Do
            Begin
               qryArtxForn.Close;
               qryArtxForn.ParamByName('pCODARTIGO').AsString := Espaco(Trim(qryProcxArtCODARTIGO.AsString),14);
               qryArtxForn.Open;
               qryArtxForn.First;
               While Not qryArtxForn.Eof Do
                  Begin
                     qryCotacao.Insert;
                     qryCotacaoIDPROCXART.AsFloat   := qryProcxArtIDPROCXART.AsFloat;
                     qryCotacaoIDFORCLI.AsInteger   := qryArtxFornIDFORCLI.AsInteger;
                     qryCotacaoCODARTIGO.AsString   := qryProcxArtCODARTIGO.AsString;
                     qryCotacaoDESCRICAO.AsString   := qryProcxArtDESCRICAO.AsString;
                     qryCotacaoRAZAOSOCIAL.AsString := qryArtxFornRAZAOSOCIAL.AsString;
                     If TestaRestricao(qryArtxFornIDFORCLI.AsInteger,qryArtxFornRAZAOSOCIAL.AsString,qryProcxArtCODARTIGO.AsString,False) <> 'L' Then
                        qryCotacaoSTATUS.AsString   := 'N'
                     Else
                        qryCotacaoSTATUS.AsString   := 'S';
                     qryCotacao.Post;
                     qryArtxForn.Next;
                  End;
               qryProcxArt.Next;
            End;
      End;
   qryForneCot.Close;
   qryForneCot.Open;
   //
   qryTree.Close;
   qryTree.Open;
   //Insere na tabela de fornecedores da cotação (qryForneCot)
   qryCotacao.First;
   While Not qryCotacao.EOF Do
      Begin
         if Not qryForneCot.Locate('IDFORCLI',qryCotacaoIDFORCLI.AsInteger,[]) Then
            Begin
               qryForneCot.Append;
               qryForneCotIDFORCLI.AsInteger   := qryCotacaoIDFORCLI.AsInteger;
               qryForneCotRAZAOSOCIAL.AsString := qryCotacaoRAZAOSOCIAL.AsString;
               qryForneCot.Post;
            End;
         qryCotacao.Next;
      End;
   //Insere na tabela do TreeView (qryTree) já ordenado por artigo e fornecedor
   qryProcxArt.First;
   While Not qryProcxArt.EOF Do
      Begin
         qryForneCot.First;
         While Not qryForneCot.EOF Do
            Begin
                if Not qryCotacao.Locate('IDFORCLI;IDPROCXART',VarArrayOf([qryForneCotIDFORCLI.AsInteger,qryProcxArtIDPROCXART.AsInteger]),[]) Then
                   Begin
                      qryTree.Insert;
                      qryTreeIDPROCXART.AsFloat   := qryProcxArtIDPROCXART.AsFloat;
                      qryTreeIDFORCLI.AsInteger   := qryForneCotIDFORCLI.AsInteger;
                      qryTreeCODARTIGO.AsString   := qryProcxArtCODARTIGO.AsString;
                      qryTreeDESCRICAO.AsString   := qryProcxArtDESCRICAO.AsString;
                      qryTreeRAZAOSOCIAL.AsString := qryForneCotRAZAOSOCIAL.AsString;
                      qryTreeSTATUS.AsString      := 'N';
                      qryTree.Post;
                   End
                Else
                   Begin
                      qryTree.Insert;
                      qryTreeIDPROCXART.AsFloat   := qryProcxArtIDPROCXART.AsFloat;
                      qryTreeIDFORCLI.AsInteger   := qryForneCotIDFORCLI.AsInteger;
                      qryTreeCODARTIGO.AsString   := qryProcxArtCODARTIGO.AsString;
                      qryTreeDESCRICAO.AsString   := qryProcxArtDESCRICAO.AsString;
                      qryTreeRAZAOSOCIAL.AsString := qryForneCotRAZAOSOCIAL.AsString;
                      qryTreeSTATUS.AsString      := qryCotacaoSTATUS.AsString;
                      qryTree.Post;
                   End;
                qryForneCot.Next;
             End;
         qryProcxArt.Next;
      End;
// Monta a Arvore
   if Not qryTree.IsEmpty Then
      Begin
         qryTree.First;
         NoPai := TreeCot.Items.Add(nil,qryTreeCODARTIGO.AsString+' - '+qryTreeDESCRICAO.AsString);
         NoPai.ImageIndex    := 1;
         NoPai.SelectedIndex := 1;
         NoPai.StringData    := qryTreeIDPROCXART.AsString;
         NoPai.StringData2   := qryTreeCODARTIGO.AsString;
         While Not qryTree.EOF Do
            Begin
               If Trim(NoPai.StringData) <> trim(qryTreeIDPROCXART.AsString) Then Begin
                  NoPai := TreeCot.Items.Add(nil,qryTreeCODARTIGO.AsString+' - '+qryTreeDESCRICAO.AsString);
                  NoPai.ImageIndex    := 1;
                  NoPai.SelectedIndex := 1;
                  NoPai.StringData    := qryTreeIDPROCXART.AsString;
                  NoPai.StringData2   := qryTreeCODARTIGO.AsString;
               End;
               NoFilho := TreeCot.Items.AddChild(NoPai,qryTreeRAZAOSOCIAL.AsString);
               NoFilho.ImageIndex    := 0;
               NoFilho.SelectedIndex := 0;
               NoFilho.StringData    := qryTreeIDPROCXART.AsString;
               NoFilho.StringData2   := qryTreeIDFORCLI.AsString;
               NoFilho.CheckboxType  := tvctCheckbox;
               NoFilho.Checked       := qryTreeSTATUS.AsString = 'S';
               qryTree.Next;
            End;
      End;
      TreeCot.AlphaSort;

      bMonta := True;
End;

Procedure TFrmMontaProcesso.CmeCadastroInsert(Sender: TObject);
Begin
   inherited;
   SelFilhos( -1 );
   qrySTATUS.AsString     := 'P';
   qryIDCOMPRADOR.AsFloat := Sistema.IdUsuario;
   PgProc.ActivePage      := TabItens;
End;

Procedure TFrmMontaProcesso.CmeCadastroConfirma(Sender: TObject);
Var
   idProcesso : LongInt;
   bAchou     : Boolean;
Begin
 PgProc.ActivePage := TabItens;
 //
 If qry.State in [dsInsert,dsEdit] Then
    Begin
       If qry.State = dsInsert Then
          idProcesso := LeUltRegistro(nil,'PROCESSO')
       Else
          idProcesso := qryCODPROCESSO.asInteger;
       qryCODPROCESSO.asInteger := idProcesso;
       //
       if (qrySTATUS.AsString <> 'C') and (qrySTATUS.AsString <> 'P') Then
          qrySTATUS.AsString := 'C';
    // Gravando a Tabela ProcxArt
       qryProcxArt.First;
       While Not qryProcxArt.EOF Do
          Begin
              qryProcxArt.Edit;
              qryProcxArtCODPROCESSO.asInteger := idProcesso;
              If qryProcxArtIDPRODVARI.AsInteger <= 0 Then
                 qryProcxArtIDPRODVARI.Clear;
              qryProcxArt.Post;
              qryProcxArt.Next;
          End;
       qryAtuArtxForn.Close;
       qryAtuArtxForn.Open;
       //
       // Gravando a Cotação para Proposta Nº 1
       qryCotacao.First;
       While Not qryCotacao.EOF do
          Begin
             if qryCotacaoSTATUS.AsString = 'S' then
                Begin
                   qryVerifArtxForn.Close;
                   qryVerifArtxForn.ParamByName('pCODARTIGO').AsString := Espaco(Trim(qryCotacaoCODARTIGO.AsString),14);
                   qryVerifArtxForn.ParamByName('pIDFORCLI').AsInteger := qryCotacaoIDFORCLI.AsInteger;
                   qryVerifArtxForn.Open;
                   if qryVerifArtxForn.IsEmpty then
                      Begin
                         if Not qryAtuArtxForn.Locate('CODARTIGO;IDFORCLI',VarArrayOf([Espaco(Trim(qryCotacaoCODARTIGO.AsString),14),qryCotacaoIDFORCLI.AsInteger]),[]) Then
                            Begin
                               qryAtuArtxForn.Append;
                               qryAtuArtxFornIDFORCLI.AsInteger := qryCotacaoIDFORCLI.AsInteger;
                               qryAtuArtxFornCODARTIGO.AsString := qryCotacaoCODARTIGO.AsString;
                               qryAtuArtxForn.Post;
                            end;
                      end;
                   bAchou := False;
                   qryAtuCotacao.First;
                   While Not qryAtuCotacao.EOF Do
                      Begin
                         if (qryCotacaoIDPROCXART.AsInteger = qryAtuCotacaoIDPROCXART.AsInteger) and
                            (qryCotacaoIDFORCLI.AsInteger = qryAtuCotacaoIDFORCLI.AsInteger) Then
                            Begin
                               qryAtuCotacao.Edit;
                               qryAtuCotacaoSTATUS.Clear;
                               qryAtuCotacaoCODPROCESSO.asInteger := idProcesso;
                               if (qrySTATUS.AsString = 'P') And (qryProcxArt.Locate('IDPROCXART',qryCotacaoIDPROCXART.AsFloat,[])) Then
                                  Begin
                                     qryAtuCotacaoQTDEFORNECIDA.asFloat := qryProcxArtQTDEPEDIDA.asFloat;
                                     qryAtuCotacaoCODMEDIDA.asString    := qryProcxArtCODMEDIDA.asString;
                                  end;
                               qryAtuCotacao.Post;
                               bAchou := True;
                            end;
                         qryAtuCotacao.Next;
                      end;
                   if not bAchou then
                      Begin
                         qryAtuCotacao.Append;
                         qryAtuCotacaoSTATUS.Clear;
                         qryAtuCotacaoCODPROCESSO.asInteger := idProcesso;
                         qryAtuCotacaoPROPOSTA.asInteger    := 1;
                         qryAtuCotacaoIDPROCXART.asInteger  := qryCotacaoIDPROCXART.asInteger;
                         qryAtuCotacaoIDFORCLI.asInteger    := qryCotacaoIDFORCLI.asInteger;
                         if qryProcxArt.Locate('IDPROCXART',qryCotacaoIDPROCXART.AsFloat,[]) Then
                            Begin
                               qryAtuCotacaoQTDEFORNECIDA.asFloat := qryProcxArtQTDEPEDIDA.asFloat;
                               qryAtuCotacaoCODMEDIDA.asString    := qryProcxArtCODMEDIDA.asString;
                            end;
                         qryAtuCotacao.Post;
                      end;
                End
             else
                Begin
                   qryAtuCotacao.First;
                   While Not qryAtuCotacao.EOF Do
                      Begin
                         if (qryCotacaoIDPROCXART.AsInteger = qryAtuCotacaoIDPROCXART.AsInteger) and
                            (qryCotacaoIDFORCLI.AsInteger = qryAtuCotacaoIDFORCLI.AsInteger) Then
                            qryAtuCotacao.Delete
                         else
                            qryAtuCotacao.Next;
                      end;
                   qryPrazoEnt.First;
                   While not qryPrazoEnt.EOF do
                      Begin
                         if (qryCotacaoIDPROCXART.AsInteger = qryPrazoEntIDPROCXART.AsInteger) and
                            (qryCotacaoIDFORCLI.AsInteger = qryPrazoEntIDFORCLI.AsInteger) Then
                            qryPrazoEnt.Delete
                         Else
                            qryPrazoEnt.Next;
                      end;
                   qryPrazoPgto.First;
                   While not qryPrazoPgto.EOF do
                      Begin
                         if (qryCotacaoIDPROCXART.AsInteger = qryPrazoPgtoIDPROCXART.AsInteger) and
                            (qryCotacaoIDFORCLI.AsInteger = qryPrazoPgtoIDFORCLI.AsInteger) Then
                            qryPrazoPgto.Delete
                         Else
                            qryPrazoPgto.Next;
                      end;
                   qryAgregItem.First;
                   While not qryAgregItem.EOF do
                      Begin
                         if (qryCotacaoIDPROCXART.AsInteger = qryAgregItemIDPROCXART.AsInteger) and
                            (qryCotacaoIDFORCLI.AsInteger = qryAgregItemIDFORCLI.AsInteger) Then
                            qryAgregItem.Delete
                         Else
                            qryAgregItem.Next;
                      end;
                End;
             qryCotacao.Next;
          End;
          Try
             StartTransacao;
             If qry.State = dsEdit Then
                If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE ITEMSOLI SET CODPROCESSO = NULL, IDPROCXART = NULL WHERE (CODPROCESSO = '+IntToStr(idProcesso)+')') Then
                   Abort;
             qry.ApplyUpdates;
             If sbtnAlterar.Down Then
                Begin
                    qryPrazoPgto.First;
                    qryPrazoPgto.UpdateRecordTypes := [rtDeleted];
                    While Not qryPrazoPgto.EOF Do
                       Begin
                          If qryPrazoPgto.UpdateStatus = usDeleted Then
                             Begin
                                If Not ExecutarQuery(DtmBaseDados.qry,' DELETE FROM PRAZOPGTO '+
                                                                      ' WHERE (CODPROCESSO = '+IntToStr(qryPrazoPgtoCODPROCESSO.AsInteger)+')'+
                                                                      '   AND (IDPROCXART  = '+IntToStr(qryPrazoPgtoIDPROCXART.AsInteger)+')'+
                                                                      '   AND (IDFORCLI    = '+IntToStr(qryPrazoPgtoIDFORCLI.AsInteger)+')'+
                                                                      '   AND (PROPOSTA    = '+IntToStr(qryPrazoPgtoPROPOSTA.AsInteger)+')')
                                Then
                                   Abort;
                                qryPrazoPgto.RevertRecord;
                             End
                          Else
                             qryPrazoPgto.Next;
                       End;
                    qryPrazoEnt.First;
                    qryPrazoEnt.UpdateRecordTypes := [rtDeleted];
                    While Not qryPrazoEnt.EOF Do
                       Begin
                          If qryPrazoEnt.UpdateStatus = usDeleted Then
                             Begin
                                If Not ExecutarQuery(DtmBaseDados.qry,' DELETE FROM PRAZOENTREGA '+
                                                                      ' WHERE (CODPROCESSO = '+IntToStr(qryPrazoEntCODPROCESSO.AsInteger)+')'+
                                                                      '   AND (IDPROCXART  = '+IntToStr(qryPrazoEntIDPROCXART.AsInteger)+')'+
                                                                      '   AND (IDFORCLI    = '+IntToStr(qryPrazoEntIDFORCLI.AsInteger)+')'+
                                                                      '   AND (PROPOSTA    = '+IntToStr(qryPrazoEntPROPOSTA.AsInteger)+')')
                                Then
                                   Abort;
                                qryPrazoEnt.RevertRecord;
                             End
                          Else
                             qryPrazoEnt.Next;
                       End;

                    qryAgregItem.First;
                    qryAgregItem.UpdateRecordTypes := [rtDeleted];
                    While Not qryAgregItem.EOF Do
                       Begin
                          If qryAgregItem.UpdateStatus = usDeleted Then
                             Begin
                                If Not ExecutarQuery(DtmBaseDados.qry,' DELETE FROM VALORAGREGCOT '+
                                                                      ' WHERE (CODPROCESSO = '+IntToStr(qryAgregItemCODPROCESSO.AsInteger)+')'+
                                                                      '   AND (IDPROCXART  = '+IntToStr(qryAgregItemIDPROCXART.AsInteger)+')'+
                                                                      '   AND (IDFORCLI    = '+IntToStr(qryAgregItemIDFORCLI.AsInteger)+')'+
                                                                      '   AND (PROPOSTA    = '+IntToStr(qryAgregItemPROPOSTA.AsInteger)+')')
                                Then
                                   Abort;
                                qryAgregItem.RevertRecord;
                             End
                          Else
                             qryAgregItem.Next;
                       End;

                    qryAtuCotacao.First;
                    qryAtuCotacao.UpdateRecordTypes := [rtDeleted];
                    While Not qryAtuCotacao.EOF Do
                       Begin
                          If qryAtuCotacao.UpdateStatus = usDeleted Then
                             Begin
                                If Not ExecutarQuery(DtmBaseDados.qry,' DELETE FROM COTACOES '+
                                                                      ' WHERE (CODPROCESSO = '+IntToStr(qryAtuCotacaoCODPROCESSO.AsInteger)+')'+
                                                                      '   AND (IDPROCXART  = '+IntToStr(qryAtuCotacaoIDPROCXART.AsInteger)+')'+
                                                                      '   AND (IDFORCLI    = '+IntToStr(qryAtuCotacaoIDFORCLI.AsInteger)+')'+
                                                                      '   AND (PROPOSTA    = '+IntToStr(qryAtuCotacaoPROPOSTA.AsInteger)+')')
                                Then
                                   Abort;
                                qryAtuCotacao.RevertRecord;
                             End
                          Else
                             qryAtuCotacao.Next;
                       End;
                End;
             qryProcxArt.ApplyUpdates;
             qryPrazoPgto.UpdateRecordTypes := [rtModified, rtInserted,rtUnmodified];
             qryPrazoEnt.UpdateRecordTypes := [rtModified, rtInserted,rtUnmodified];
             qryAgregItem.UpdateRecordTypes := [rtModified, rtInserted,rtUnmodified];
             qryAtuCotacao.UpdateRecordTypes := [rtModified, rtInserted,rtUnmodified];
             qryItemAtrib.First;
             While Not qryItemAtrib.EOF Do
                Begin
                    If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE ITEMSOLI SET IDPROCXART = '+IntToStr(qryItemAtribIDPROCXART.AsInteger)+', CODPROCESSO = '+IntToStr(idProcesso)+' WHERE (IDITEMSOLI = '+IntToStr(qryItemAtribIDITEMSOLI.AsInteger)+')') Then
                       Abort;
                    qryItemAtrib.Next;
                End;
             qryAtuCotacao.ApplyUpdates;
             qryAtuCotacao.UpdateRecordTypes := [rtModified, rtInserted, rtDeleted, rtUnmodified];
             qryPrazoPgto.ApplyUpdates;
             qryPrazoPgto.UpdateRecordTypes := [rtModified, rtInserted, rtDeleted, rtUnmodified];
             qryPrazoEnt.ApplyUpdates;
             qryPrazoEnt.UpdateRecordTypes := [rtModified, rtInserted, rtDeleted, rtUnmodified];
             qryAgregItem.ApplyUpdates;
             qryAgregItem.UpdateRecordTypes := [rtModified, rtInserted, rtDeleted, rtUnmodified];
             qryAtuArtxForn.ApplyUpdates;
             CommitTransacao;
             If sbtnInserir.Down Then
                MsgDlg('Gerado Processo Nº '+IntToStr(idProcesso),'Aviso',mtInformation,[mbOK],0);
          Except
             RollbackTransacao;
             MsgDlg('Operação não efetuada','Erro',mtError,[mbOK],0);
             Raise;
          End;
    End
  Else
     AplicaAlteracoes([qryItemAtrib,qryPrazoPgto,qryPrazoEnt,qryAgregItem,qryAtuCotacao,qryProcxArt,qry]);
  inherited;
End;

Procedure TFrmMontaProcesso.CmeCadastroDelete(Sender: TObject);
Begin
     qryProcxArt.First;
     While Not qryProcxArt.EOF Do qryProcxArt.Delete;
     qryPrazoEnt.First;
     While Not qryPrazoEnt.EOF Do qryPrazoEnt.Delete;
     qryPrazoPgto.First;
     While Not qryPrazoPgto.EOF Do qryPrazoPgto.Delete;
     qryAgregItem.First;
     While Not qryAgregItem.EOF Do qryAgregItem.Delete;
     qryAtuCotacao.First;
     While Not qryAtuCotacao.EOF Do qryAtuCotacao.Delete;
     qryItemAtrib.First;
     While Not qryItemAtrib.EOF Do
       Begin
          qryItemAtrib.Edit;
          qryItemAtribIDPROCXART.Clear;
          qryItemAtribCODPROCESSO.Clear;
          qryItemAtrib.Post;
          qryItemAtrib.Next;
      End;
  inherited;
  Sel( -1 );
End;
Procedure TFrmMontaProcesso.CmeCadastroFind(Sender: TObject);
Begin
   inherited;
   if MontaSelect.RetornouValor Then
      Begin
         Sel(StrToInt(MontaSelect.ValoresChave[0]));
         PgProc.ActivePage      := TabItens;
      End;
End;

procedure TFrmMontaProcesso.PgProcChange(Sender: TObject);
begin
  inherited;
  If PgProc.ActivePage.TabIndex = 1 Then
     MontaArvore;
end;

procedure TFrmMontaProcesso.BtnAddForneClick(Sender: TObject);
begin
  inherited;
  //Abrir o form FAdicionaForn com todos os artigos da cotação já marcados.
  Application.CreateForm(TFrmAdicionaForn,FrmAdicionaForn);
  qryItemNovoForn.Close;
  qryItemNovoForn.Open;
  qryProcxArt.First;
  While not qryProcxArt.EOF do
     Begin
        qryItemNovoForn.Append;
        qryItemNovoFornATRIBUIDO.AsString         := 'N';
        qryItemNovoFornIDPROCXART.AsInteger       := qryProcxArtIDPROCXART.AsInteger;
        qryItemNovoFornCODARTIGO.AsString         := qryProcxArtCODARTIGO.AsString;
        qryItemNovoFornDESCRICAO.AsString         := qryProcxArtDESCRICAO.AsString;
        qryItemNovoFornIDPRODVARI.AsInteger       := qryProcxArtIDPRODVARI.AsInteger;
        qryItemNovoFornQTDEPEDIDA.AsFloat         := qryProcxArtQTDEPEDIDA.AsFloat;
        qryItemNovoFornCODMEDIDA.AsString         := qryProcxArtCODMEDIDA.AsString;
        qryItemNovoFornDATANECESSIDADE.AsDateTime := qryProcxArtDATANECESSIDADE.AsDateTime;
        qryItemNovoForn.Post;
        qryProcxArt.Next;
     End;
  FrmAdicionaForn.ShowModal;
end;

procedure TFrmMontaProcesso.qryItemNovoFornATRIBUIDOChange(Sender: TField);
begin
   inherited;
   If qryItemNovoFornATRIBUIDO.AsString = 'S' Then
      Begin
          If TestaRestricao(FrmAdicionaForn.cmpfNovoForn.ForCliReg.Id,FrmAdicionaForn.cmpfNovoForn.ForCliReg.RazaoSocial,qryItemNovoFornCODARTIGO.AsString,True) = 'N' then
             Begin
                MsgDlg('Existem restrições não flexiveis. Cotação proibida','Atenção',mtError,[mbOK],0);
                qryItemNovoFornATRIBUIDO.AsString := 'N';
             End;
      End;
end;

Function TFrmMontaProcesso.TestaRestricao(idForCli :LongInt; sRazaoSocial, sCodArt : String; bMostra : Boolean) : String;
begin
    Result := 'L';
    AvaliForn.IdForCli         := idForCli;
    AvaliForn.RazaoSocial      := sRazaoSocial;
    AvaliForn.IdPessoa         := Sistema.IdEmpresa;
    AvaliForn.CodArtigo        := sCodArt;
    AvaliForn.MostraRestricao  := bMostra;
    qryRestricao               := AvaliForn.ViewRestricao;
    If qryRestricao <> Nil Then
       Begin
          If Not qryRestricao.isEmpty Then
             Begin
               Result := 'S';
               If qryRestricao.Locate('FLGFLEXIVEL','N',[]) Then
                  Result := 'N';
             End;
          qryRestricao.Close;
       End;
end;

procedure TFrmMontaProcesso.FormShow(Sender: TObject);
begin
  inherited;
  PgProc.ActivePage := TabItens ;
End;

procedure TFrmMontaProcesso.TreeCotToggleCheckbox(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
  inherited;
  if bMonta And (qry.State in [dsInsert,dsEdit])Then
     Begin
       If Node.Checked Then
          Begin
             If TestaRestricao(StrToInt(Node.StringData2),Node.Text,Node.Parent.StringData2,True) = 'N' then
               Begin
                  MsgDlg('Existem restrições não flexiveis. Cotação proibida','Atenção',mtError,[mbOK],0);
                  Node.Checked := False;
               End
             Else
               If Not qryCotacao.Locate('IDPROCXART;IDFORCLI',VarArrayOf([Node.StringData,Node.StringData2]),[]) Then
                  Begin
                     qryCotacao.Insert;
                     qryCotacaoIDPROCXART.AsFloat   := StrToFloat(Node.StringData);
                     qryCotacaoIDFORCLI.AsInteger   := StrToInt(Node.StringData2);
                     qryCotacaoCODARTIGO.AsString   := Node.Parent.StringData2;
                     qryCotacaoDESCRICAO.AsString   := Copy(Node.Parent.Text,Pos(Node.Parent.Text,'-')+2,Length(Node.Parent.Text));
                     qryCotacaoRAZAOSOCIAL.AsString := Node.Text;
                     qryCotacaoSTATUS.AsString      := 'S';
                     qryCotacao.Post;
                  End
               Else
                  Begin
                     qryCotacao.Edit;
                     qryCotacaoSTATUS.AsString      := 'S';
                     qryCotacao.Post;
                  End
          End
       Else
          If qryCotacao.Locate('IDPROCXART;IDFORCLI',VarArrayOf([Node.StringData,Node.StringData2]),[]) Then
             Begin
                qryCotacao.Edit;
                qryCotacaoSTATUS.AsString := 'N';
                qryCotacao.Post;
             End;
     End;
end;

procedure TFrmMontaProcesso.btnTodasClick(Sender: TObject);
Var
     x : Integer;
   Aux : String;
begin
  inherited;
  bMonta := False;
  For x := 0 To TreeCot.Items.Count - 1 Do
    Begin
       If TreeCot.Items[x].ImageIndex = 0 Then
          Begin
             If Not TreeCot.Items[x].Checked Then
                Begin
                   TreeCot.Items[x].Checked := True;
                   If TestaRestricao(StrToInt(TreeCot.Items[x].StringData2),TreeCot.Items[x].Text,TreeCot.Items[x].Parent.StringData2,False) <> 'L' then
                      TreeCot.Items[x].Checked := False;
                   If TreeCot.Items[x].Checked Then Aux := 'S' Else Aux := 'N';

                   If qryCotacao.Locate('IDPROCXART;IDFORCLI',VarArrayOf([TreeCot.Items[x].StringData,TreeCot.Items[x].StringData2]),[]) Then
                       Begin
                            qryCotacao.Edit;
                            qryCotacaoSTATUS.AsString := Aux;
                            qryCotacao.Post;
                        End
                   Else
                      Begin
                         qryCotacao.Insert;
                         qryCotacaoIDPROCXART.AsFloat   := StrToFloat(TreeCot.Items[x].StringData);
                         qryCotacaoIDFORCLI.AsInteger   := StrToInt(TreeCot.Items[x].StringData2);
                         qryCotacaoCODARTIGO.AsString   := TreeCot.Items[x].Parent.StringData2;
                         qryCotacaoDESCRICAO.AsString   := Copy(TreeCot.Items[x].Parent.Text,Pos(TreeCot.Items[x].Parent.Text,'-')+2,Length(TreeCot.Items[x].Parent.Text));
                         qryCotacaoRAZAOSOCIAL.AsString := TreeCot.Items[x].Text;
                         qryCotacaoSTATUS.AsString      := Aux;
                         qryCotacao.Post;
                      End;
                End;
          End;
    End;
  bMonta := True;
end;

procedure TFrmMontaProcesso.btnInverterClick(Sender: TObject);
Var
   x   : Integer;
   Aux : String;
begin
  inherited;
  bMonta := False;
  For x := 0 To TreeCot.Items.Count - 1 Do
    Begin
       If TreeCot.Items[x].ImageIndex = 0 Then
          Begin
            If Not TreeCot.Items[x].Checked Then
               Begin
                   TreeCot.Items[x].Checked := True;
                   If TestaRestricao(StrToInt(TreeCot.Items[x].StringData2),TreeCot.Items[x].Text,TreeCot.Items[x].Parent.StringData2,False) <> 'L' then
                      TreeCot.Items[x].Checked := False;
                   If TreeCot.Items[x].Checked Then Aux := 'S' Else Aux := 'N';
                   If qryCotacao.Locate('IDPROCXART;IDFORCLI',VarArrayOf([TreeCot.Items[x].StringData,TreeCot.Items[x].StringData2]),[]) Then
                       Begin
                            qryCotacao.Edit;
                            qryCotacaoSTATUS.AsString := Aux;
                            qryCotacao.Post;
                        End
                   Else
                      Begin
                         qryCotacao.Insert;
                         qryCotacaoIDPROCXART.AsFloat   := StrToFloat(TreeCot.Items[x].StringData);
                         qryCotacaoIDFORCLI.AsInteger   := StrToInt(TreeCot.Items[x].StringData2);
                         qryCotacaoCODARTIGO.AsString   := TreeCot.Items[x].Parent.StringData2;
                         qryCotacaoDESCRICAO.AsString   := Copy(TreeCot.Items[x].Parent.Text,Pos(TreeCot.Items[x].Parent.Text,'-')+2,Length(TreeCot.Items[x].Parent.Text));
                         qryCotacaoRAZAOSOCIAL.AsString := TreeCot.Items[x].Text;
                         qryCotacaoSTATUS.AsString      := Aux;
                         qryCotacao.Post;
                      End;
                End
            Else
               Begin
                  TreeCot.Items[x].Checked := False;
                  If qryCotacao.Locate('IDPROCXART;IDFORCLI',VarArrayOf([TreeCot.Items[x].StringData,TreeCot.Items[x].StringData2]),[]) Then
                       Begin
                          qryCotacao.Edit;
                          qryCotacaoSTATUS.AsString := 'N';
                          qryCotacao.Post;
                       End
               End;
          End;
     End;
  bMonta := True;
end;

procedure TFrmMontaProcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelFilhos( qryCODPROCESSO.asInteger );
  If PgProc.ActivePage.TabIndex = 1 Then
     MontaArvore;
end;

procedure TFrmMontaProcesso.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(qryCODPROCESSO.AsInteger);
end;

procedure TFrmMontaProcesso.BtnCopiaSelClick(Sender: TObject);
Var
   x       : Integer;
   bCheck  : TStrings;
begin
  inherited;
  bCheck  := TStringList.Create;
  Try
     For x := 1 To Pred(TreeCot.Items.Count) Do
        Begin
           If TreeCot.Items[x].ImageIndex = 0 Then
              Begin
                 If TreeCot.Items[x].Checked Then
                 bCheck.Add(TreeCot.Items[x].Text);
              End
           Else
              Break;
        End;
     If Succ(bCheck.Count) < TreeCot.Items.Count Then
        For x := Succ(bCheck.Count) To Pred(TreeCot.Items.Count) Do
           Begin
              If TreeCot.Items[x].ImageIndex = 0 Then
                 TreeCot.Items[x].Checked := bCheck.IndexOf(TreeCot.Items[x].Text)<> -1;
           End;
  Finally
     bCheck.Free;
  End;

end;

procedure TFrmMontaProcesso.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If qryItemAtrib.IsEmpty Then
     Begin
        MsgDlg('Não há itens atribuídos','Erro',MtError,[mbOK],0);
        Accept := False;
     End;
end;

end.

