unit FMtCadArtxForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBTables, Wwquery, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid,
  uCtrlArtxForn, Provider, uCMTypes;

type
  TFrmMtCadArtxForn = class(TFrmCadastroMT)
    qryGrupo: TwwQuery;
    qryGrupoDESCGRUPOPROD: TStringField;
    qryGrupoCODGRUPOPROD: TStringField;
    Label1: TLabel;
    EdForn: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    Label2: TLabel;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    dblcGrupo: TCMDBLookupCombo;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TCMClientDataSet;
    dsArtigo: TwwDataSource;
    cdsArtigo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure dblcGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    ArtxForn : TCtrlArtxForn;
    //
    Procedure Sel( n : Double );
    Procedure SelArt( sCodGrupoProd : String );

  public
    { Public declarations }
  end;

var
  FrmMtCadArtxForn: TFrmMtCadArtxForn;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, DBasedados;  

procedure TFrmMtCadArtxForn.FormCreate(Sender: TObject);
begin
  inherited;
  ArtxForn := TCtrlArtxForn.Create;
  ArtxForn.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ArtxForn.cds := cds;
  //
  cdsGrupo.Open;
  //
  MontaSelect.Filtro.Add('EMPRESAFORN.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('EMPRESAFORN.IDFORCLI = PESSOA.IDPESSOA');
  //
  Sel(-1);
end;

procedure TFrmMtCadArtxForn.Sel(n: Double);
begin
  cds.Data :=  ArtxForn.Procurar( n );
  //
  If Trim(dblcGrupo.Text) <> '' Then
     cdsArtigo.Data := ArtxForn.ListArtigoDisponivel( n ,dblcGrupo.LookUpValue)
  Else
     cdsArtigo.Data := ArtxForn.ListArtigoDisponivel( n );
end;

procedure TFrmMtCadArtxForn.SelArt(sCodGrupoProd: String);
begin
  cdsArtigo.Data := ArtxForn.ListArtigoDisponivel(StrToFloat(MontaSelect.ValoresChave[0]),sCodGrupoProd);
end;

procedure TFrmMtCadArtxForn.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.Down Then
    Begin
       If Not cdsArtigo.IsEmpty Then
         Begin
            With cds Do
               Begin
                 Append;
                 FieldByName('IDFORCLI').asFloat   := StrToFloat(MontaSelect.ValoresChave[0]);
                 FieldByName('CODARTIGO').asString := cdsArtigo.FieldByName('CODARTIGO').asString;
                 FieldByName('DESCPROD').asString  := cdsArtigo.FieldByName('DESCPROD').asString;
                End;
            cdsArtigo.Delete;
         End;
    End;
end;

procedure TFrmMtCadArtxForn.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsArtigo.First;
  While Not cdsArtigo.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmMtCadArtxForn.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
       If Not cds.IsEmpty Then
         Begin
            With cdsArtigo Do
               Begin
                 Append;
                 FieldByName('CODARTIGO').asString := cds.FieldByName('CODARTIGO').asString;
                 FieldByName('DESCPROD').asString  := cds.FieldByName('DESCPROD').asString;
                End;
            cds.Delete;
         End;
    End;
end;

procedure TFrmMtCadArtxForn.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;
  While Not cds.Eof Do
    btnRemove.Click;
end;

procedure TFrmMtCadArtxForn.dblcGrupoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (dblcGrupo.Text <> '' ) Then
     SelArt(dblcGrupo.LookupValue)
  Else
     SelArt('');
end;

procedure TFrmMtCadArtxForn.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmMtCadArtxForn.CmeCadastroConfirma(Sender: TObject);
begin
  If Not ArtxForn.AtribuirArtigo Then
  Begin
    MsgDlg(ArtxForn.MessageInfo,'Erro',mtError,[mbOK],0);
    Abort;
  End;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
  inherited;
end;

procedure TFrmMtCadArtxForn.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If Trim(edForn.Text) = '' Then
    Begin
        MsgDlg('Não há Nenhum fornece  dor selecionado','Atenção',mtWarning,[mbOk],0);
        bbtnCancelar.Click;
    End
  Else
    cds.Cancel;
end;

procedure TFrmMtCadArtxForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ArtxForn.Free;
end;

procedure TFrmMtCadArtxForn.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  If MontaSelect.RetornouValor Then
    Begin
       Sel(StrToInt(MontaSelect.ValoresChave[0]) );
       edForn.Text := MontaSelect.ValoresChave[1];
    End;
end;

procedure TFrmMtCadArtxForn.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Sel(cds.FieldByName('IDFORCLI').asFloat);
end;

end.
