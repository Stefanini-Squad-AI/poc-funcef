unit FMtAtribComprador;

//------------------------------------------------------------------------------
//   Autor     : Augusto
//   Data      : 02/11/2007
//   Pendência : 24187
//   Descrição : Acertos nas consultas dos itens
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd,
  Wwdbgrid, uCtrlComprador,uCtrlArtigo,uCtrlGrupoProd, uCtrlSoliCompra, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, DBTables, Wwquery;

type
  TFrmMtAtribComprador = class(TfrmSairAjuda)
    plnBar: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    plnComp: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GrdItem: TwwDBGrid;
    Panel3: TPanel;
    plnItem: TPanel;
    GrdComp: TwwDBGrid;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    BtnLimpar: TSpeedButton;
    BtnSelecinar: TSpeedButton;
    RgEmpresa: TRadioGroup;
    dblcGrupo: TCMDBLookupCombo;
    dblcArt: TwwDBLookupCombo;
    dblcSCI: TCMDBLookupCombo;
    cdsArtigo: TCMClientDataSet;
    cdsComprador: TCMClientDataSet;
    cdsSCI: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    cdsItens: TCMClientDataSet;
    cdsItensAtrib: TCMClientDataSet;
    dsComprador: TwwDataSource;
    dsItensAtrib: TwwDataSource;
    dsItens: TwwDataSource;
    grdItemAtrib: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelecinarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure dsCompradorDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdItemTitleButtonClick(Sender: TObject; AFieldName: String);
  private
    { Private declarations }
    Artigo        : TCtrlArtigo;
    Comprador     : TCtrlComprador;
    SoliCompra    : TCtrlSoliCompra;
    GrupoProd     : TCtrlGrupoProd;


    { Retorna o número da Solicitação para usar nas consultas.  }
    Function RetornaSCI : Double;

  public
    { Public declarations }
  end;

var
  FrmMtAtribComprador: TFrmMtAtribComprador;

implementation

{$R *.DFM}

Uses uSistema, uDataBase, DBaseDados, uMensErro, uModulo;

procedure TFrmMtAtribComprador.FormCreate(Sender: TObject);
begin
  inherited;
  SoliCompra := TCtrlSoliCompra.Create;
  SoliCompra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  Comprador := TCtrlComprador.Create;
  Comprador.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  cdsComprador.Data := Comprador.ListComprador;
  cdsArtigo.Data    := Artigo.ListArtigo;
  cdsGrupoProd.Data := GrupoProd.ListGrupoProd(tgAnaliticos);
  cdsItens.Data     := SoliCompra.ListSoliCompra(False,-1);
  cdsSCI.Data       := SoliCompra.ListNumSoliSemComprador((Modulo.sflgVerifRad = 'A'));
end;
                 
procedure TFrmMtAtribComprador.BtnSelecinarClick(Sender: TObject);
Var
   IdEmpresa : Integer;
begin
  inherited;
  If RgEmpresa.ItemIndex = 0 Then
     IdEmpresa := Sistema.IdEmpresa
  Else
     IdEmpresa := 0;

  If  Trim(dblcSCI.Text) <> '' Then
     cdsItens.Data := SoliCompra.ListSoliCompra((Modulo.sflgVerifRad = 'A'), StrToInt(dblcSCI.LookupValue),IdEmpresa)
  Else
  If Trim(dblcArt.Text) <> '' Then
     cdsItens.Data := SoliCompra.ListSoliCompra((Modulo.sflgVerifRad = 'A'),0,IdEmpresa,dblcArt.LookupValue,'')
  Else
  If Trim(dblcGrupo.Text) <> '' Then
     cdsItens.Data := SoliCompra.ListSoliCompra((Modulo.sflgVerifRad = 'A'),0,IdEmpresa,'',dblcGrupo.LookupValue)
  Else
     cdsItens.Data := SoliCompra.ListSoliCompra((Modulo.sflgVerifRad = 'A'),0,IdEmpresa);

  cdsItensAtrib.Data := SoliCompra.ListSoliCompra(False, RetornaSCI(),
                                                  0,'','',cdsComprador.FieldByName('IDPESSOA').AsFloat);
end;

procedure TFrmMtAtribComprador.BtnLimparClick(Sender: TObject);
begin
  inherited;
  dblcSCI.Clear;
  dblcArt.Clear;
  dblcGrupo.Clear;

end;

procedure TFrmMtAtribComprador.btnAdicionaClick(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
  For x := 0 To Pred(GrdItem.SelectedList.Count) Do
    Begin
       cdsItens.GotoBookmark(GrdItem.SelectedList.Items[x]);
       If Comprador.PodeCompra(cdsComprador.FieldByName('IDPESSOA').AsFloat,cdsItens.FieldByName('CODARTIGO').AsString) Then
          Begin
             SoliCompra.AtribuirComprador(toAtribuir,cdsItens.FieldByName('IDITEMSOLI').AsFloat,cdsComprador.FieldByName('IDPESSOA').AsFloat);
             cdsItens.Delete;
          End
       Else
         MsgDlg('O Artigo '+Trim(cdsItens.FieldByName('DESCRICAO').AsString)+' não pode ser comprado por '+cdsComprador.FieldByName('NOME').AsString,'Erro',mtError,[mbOK],0);
   End;

   cdsItensAtrib.Data := SoliCompra.ListSoliCompra(False, RetornaSCI(),
                                                   0,'','',cdsComprador.FieldByName('IDPESSOA').AsFloat);
   GrdItem.UnselectAll;
end;

procedure TFrmMtAtribComprador.BtnRemoveClick(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
  cdsItensAtrib.DisableControls;
  For x := 0 To Pred(grdItemAtrib.SelectedList.Count)  Do
    Begin
        cdsItensAtrib.GotoBookmark(grdItemAtrib.SelectedList.Items[x]);
        SoliCompra.AtribuirComprador(toRemover,cdsItensAtrib.FieldByName('IDITEMSOLI').AsFloat);
        cdsItensAtrib.Delete;
    End;
  cdsItensAtrib.EnableControls;
  GrdItemAtrib.UnselectAll;
  BtnSelecinar.Click;

end;


procedure TFrmMtAtribComprador.dsCompradorDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  If cdsComprador.State = dsBrowse Then
     cdsItensAtrib.Data := SoliCompra.ListSoliCompra( False, RetornaSCI(),
                                                      0, '', '', cdsComprador.FieldByName('IDPESSOA').AsFloat );

end;

procedure TFrmMtAtribComprador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SoliCompra.Free;
  Comprador.Free;
  Artigo.Free;
  GrupoProd.Free;
end;

procedure TFrmMtAtribComprador.GrdItemTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsItens.IndexFieldNames := AFieldName;
end;

Function TFrmMtAtribComprador.RetornaSCI: Double;
Begin

  If ( Trim( dblcSCI.Text ) <> '' )
  Then Result := StrToInt( dblcSCI.LookupValue )
  Else Result := 0;

End;

end.
