unit FMTAtuUltCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit, DBCtrls,
  wwdblook, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  uCtrlGrupoProd, uCtrlArtigo, uCmSqlParams;

type
  TFrmMTAtuUltCompra = class(TfrmSairAjuda)
    cdsGrupoProd: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    Panel2: TPanel;
    lbAlmox: TLabel;
    Label7: TLabel;
    dblcGrupoProd: TwwDBLookupCombo;
    btnFiltrar: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    dblcArtigo: TwwDBLookupCombo;
    edValUltComp: TDBRealEdit;
    grdArtigo: TwwDBGrid;
    cdsAtuUltCompra: TCMClientDataSet;
    ds: TwwDataSource;
    btnGravar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure grdArtigoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dblcArtigoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnFiltrarClick(Sender: TObject);
    procedure edValUltCompExit(Sender: TObject);
    procedure edValUltCompEnter(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure grdArtigoExit(Sender: TObject);
    procedure btnGravarExit(Sender: TObject);
  private
    { Private declarations }
    GrupoProd   : TCtrlGrupoProd;
    Artigo      : TCtrlArtigo;

    Procedure Sel(CodGrupoprod : String);
  public
    { Public declarations }
  end;

var
  FrmMTAtuUltCompra: TFrmMTAtuUltCompra;

implementation

{$R *.DFM}

Uses uModulo, uSistema, DBaseDados, uMensErro;

procedure TFrmMTAtuUltCompra.FormCreate(Sender: TObject);
begin
  inherited;
  lbAlmox.Caption := 'Almoxarifado : '+ Modulo.sAlmoxaUsuario;

  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Artigo.cdsAtuUltCompra := cdsAtuUltCompra;
  
  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.InitializeAs(Artigo);

  cdsGrupoProd.Data := GrupoProd.ListGrupoProd;

  Sel('');
end;

procedure TFrmMTAtuUltCompra.grdArtigoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsAtuUltCompra.IndexFieldNames := AFieldName;
end;

procedure TFrmMTAtuUltCompra.dblcArtigoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified Then
     cdsAtuUltCompra.Locate('CODARTIGO',dblcArtigo.LookupValue,[]);

end;

procedure TFrmMTAtuUltCompra.Sel(CodGrupoprod: String);
begin
   cdsAtuUltCompra.Data := Artigo.ListArtigo(taVazio,True, CodGrupoprod);
   cdsArtigo.Data       := Artigo.ListArtigo(taVazio,True, CodGrupoprod);
end;

procedure TFrmMTAtuUltCompra.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcGrupoProd.Text) <> '' Then
     Begin
        If cdsAtuUltCompra.ChangeCount > 0 Then
           If MsgDlg('Os dados da contagem não foram salvos. Deseja salvar', 'Pergunta', mtConfirmation, [mbYes,mbNo], 0) = MrYes then
              btnGravar.Click;
        Sel(dblcGrupoProd.LookupValue);
     End

end;

procedure TFrmMTAtuUltCompra.edValUltCompExit(Sender: TObject);
begin
  inherited;
  cdsAtuUltCompra.Post;
end;

procedure TFrmMTAtuUltCompra.edValUltCompEnter(Sender: TObject);
begin
  inherited;
  cdsAtuUltCompra.Edit;
end;

procedure TFrmMTAtuUltCompra.btnGravarClick(Sender: TObject);
begin
  inherited;
  If Artigo.AtualizaValUltCompra Then
     Begin
        MsgDlg('Contagem gravada !', 'Informação', mtInformation, [mbOk], 0);
     End
  Else
     MsgDlg(Artigo.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);



end;

procedure TFrmMTAtuUltCompra.grdArtigoExit(Sender: TObject);
begin
  inherited;
  edValUltComp.SetFocus;
end;

procedure TFrmMTAtuUltCompra.btnGravarExit(Sender: TObject);
begin
  inherited;
  cdsAtuUltCompra.Next;
  grdArtigo.SetFocus;
end;

end.
