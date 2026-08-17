unit fCadGrupoAtende;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlGrupoAtende, uCtrlAtendeAgenda, uSistema, dBaseDados, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmCadGrupoAtende = class(TFrmCadastroMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    CdsIDGRUPOATENDE: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsOBSERVACAO: TBlobField;
    cdsAtendentesNAssociados: TCMClientDataSet;
    cdsAtendentesNAssociadosNOMEUSUARIO: TStringField;
    cdsAtendentesNAssociadosNOME: TStringField;
    cdsAtendentesNAssociadosIDUSUARIO: TFloatField;
    dtsAtendentesNAssociados: TDataSource;
    cdsAtendentesAssociados: TCMClientDataSet;
    cdsAtendentesAssociadosIDATENDEAGENDA: TFloatField;
    cdsAtendentesAssociadosIDUSUARIO: TFloatField;
    cdsAtendentesAssociadosNOMEUSUARIO: TStringField;
    cdsAtendentesAssociadosNOME: TStringField;
    dtsAtendentesAssociados: TDataSource;
    Panel1: TPanel;
    btnAdiciona: TSpeedButton;
    btnRetira: TSpeedButton;
    pnlAtendentesNAssociados: TPanel;
    Panel2: TPanel;
    grdAtendentesNAssociados: TwwDBGrid;
    pnlAtendentesAssociados: TPanel;
    Panel3: TPanel;
    grdAtendentesAssociados: TwwDBGrid;
    cdsAtendentesNAssociadosIDATENDEAGENDA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure btnRetiraClick(Sender: TObject);
  private
    CtrlGrupoAtende  : TCtrlGrupoAtende;
    CtrlAtendeAgenda : TCtrlAtendeAgenda;

    iIdGrupoAtende : integer;

    procedure MsgErro(sMsg: String);
    function ListaIdAtende : string;
    procedure Carrega( iId : integer ); 
  public
    { Public declarations }
  end;

var
  frmCadGrupoAtende: TfrmCadGrupoAtende;

implementation

{$R *.DFM}

{ TfrmCadGrupoAtende }

procedure TfrmCadGrupoAtende.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadGrupoAtende.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrupoAtende := TCtrlGrupoAtende.Create;
  CtrlGrupoAtende.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlGrupoAtende.CdsGrupoAtende := Cds;

  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.InitializeAs( CtrlGrupoAtende );

  iIdGrupoAtende := 0;  
  Cds.CreateDataset;
end;

procedure TfrmCadGrupoAtende.FormDestroy(Sender: TObject);
begin
  CtrlGrupoAtende.Free;
  inherited;
end;

procedure TfrmCadGrupoAtende.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlGrupoAtende.ExcluiGrupoAtende( iIdGrupoAtende );
  if Accept then
  begin
    iIdGrupoAtende := 0;
    cdsAtendentesNAssociados.Close;
    cdsAtendentesAssociados.Close;
  end;
end;

procedure TfrmCadGrupoAtende.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlGrupoAtende.GravaGrupoAtende( ListaIdAtende );
  if Accept then
    Carrega( CdsIDGRUPOATENDE.AsInteger );
end;

procedure TfrmCadGrupoAtende.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlGrupoAtende.GravaGrupoAtende( ListaIdAtende );
  if Accept then
    Carrega( CdsIDGRUPOATENDE.AsInteger );
end;

procedure TfrmCadGrupoAtende.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Carrega( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

procedure TfrmCadGrupoAtende.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  iIdGrupoAtende := 0;
  
  Cds.Close;
  Cds.CreateDataSet;

  grdAtendentesNAssociados.UnselectAll;
  grdAtendentesAssociados.UnselectAll;

  cdsAtendentesNAssociados.Close;
  cdsAtendentesAssociados.Close;
end;

procedure TfrmCadGrupoAtende.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  iIdGrupoAtende := 0;

  cds.Close;
  cds.CreateDataSet;
  cds.Insert;

  cdsAtendentesNAssociados.Close;
  cdsAtendentesAssociados.Close;

  grdAtendentesNAssociados.UnselectAll;
  grdAtendentesAssociados.UnselectAll;

  cdsAtendentesNAssociados.Data := CtrlAtendeAgenda.UsuariosAssociados( -1 );
  cdsAtendentesAssociados.CreateDataSet;
end;

procedure TfrmCadGrupoAtende.btnAdicionaClick(Sender: TObject);
var
  aIdUsuario : array of Integer;
  i : integer;
begin
  inherited;

  if grdAtendentesNAssociados.SelectedList.Count > 0 then
  begin
    SetLength( aIdUsuario, grdAtendentesNAssociados.SelectedList.Count );
    i := 0;

    cdsAtendentesNAssociados.DisableControls;
    cdsAtendentesAssociados.DisableControls;
    try
      cdsAtendentesNAssociados.First;
      while not cdsAtendentesNAssociados.Eof do
      begin
        if grdAtendentesNAssociados.IsSelectedRecord then
        begin
          aIdUsuario[i] := cdsAtendentesNAssociadosIDUSUARIO.AsInteger;
          Inc( i );
          cdsAtendentesAssociados.Append;
          cdsAtendentesAssociadosIDATENDEAGENDA.AsInteger := cdsAtendentesNAssociadosIDATENDEAGENDA.AsInteger;
          cdsAtendentesAssociadosIDUSUARIO.AsInteger      := cdsAtendentesNAssociadosIDUSUARIO.AsInteger;
          cdsAtendentesAssociadosNOMEUSUARIO.AsString     := cdsAtendentesNAssociadosNOMEUSUARIO.AsString;
          cdsAtendentesAssociadosNOME.AsString            := cdsAtendentesNAssociadosNOME.AsString;
          cdsAtendentesAssociados.Post;
        end;
        cdsAtendentesNAssociados.Next;
      end;

      grdAtendentesAssociados.UnSelectAll;
      grdAtendentesNAssociados.UnSelectAll;

      for i := 0 to high( aIdUsuario ) do
      begin
        cdsAtendentesNAssociados.First;
        cdsAtendentesNAssociados.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        cdsAtendentesNAssociados.Delete;

        cdsAtendentesAssociados.First;
        cdsAtendentesAssociados.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        grdAtendentesAssociados.SelectRecord;
      end;

      grdAtendentesNAssociados.UnSelectAll;

    finally
      cdsAtendentesNAssociados.EnableControls;
      cdsAtendentesAssociados.EnableControls;
    end;

  end;
end;

procedure TfrmCadGrupoAtende.btnRetiraClick(Sender: TObject);
var
  aIdUsuario : array of Integer;
  i : integer;
begin
  inherited;

  if grdAtendentesAssociados.SelectedList.Count > 0 then
  begin
    SetLength( aIdUsuario, grdAtendentesAssociados.SelectedList.Count );
    i := 0;

    cdsAtendentesNAssociados.DisableControls;
    cdsAtendentesAssociados.DisableControls;
    try
      cdsAtendentesAssociados.First;
      while not cdsAtendentesAssociados.Eof do
      begin
        if grdAtendentesAssociados.IsSelectedRecord then
        begin
          aIdUsuario[i] := cdsAtendentesAssociadosIDUSUARIO.AsInteger;
          Inc( i );
          cdsAtendentesNAssociados.Append;
          cdsAtendentesNAssociadosIDATENDEAGENDA.AsInteger   := cdsAtendentesAssociadosIDATENDEAGENDA.AsInteger;
          cdsAtendentesNAssociadosIDUSUARIO.AsInteger        := cdsAtendentesAssociadosIDUSUARIO.AsInteger;
          cdsAtendentesNAssociadosNOMEUSUARIO.AsString       := cdsAtendentesAssociadosNOMEUSUARIO.AsString;
          cdsAtendentesNAssociadosNOME.AsString              := cdsAtendentesAssociadosNOME.AsString;
          cdsAtendentesNAssociados.Post;
        end;
        cdsAtendentesAssociados.Next;
      end;

      grdAtendentesAssociados.UnSelectAll;
      grdAtendentesNAssociados.UnSelectAll;

      for i := 0 to high( aIdUsuario ) do
      begin
        cdsAtendentesAssociados.First;
        cdsAtendentesAssociados.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        cdsAtendentesAssociados.Delete;

        cdsAtendentesNAssociados.First;
        cdsAtendentesNAssociados.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        grdAtendentesNAssociados.SelectRecord;
      end;

    finally
      cdsAtendentesNAssociados.EnableControls;
      cdsAtendentesAssociados.EnableControls;
    end;

  end;
end;

function TfrmCadGrupoAtende.ListaIdAtende: string;
begin
  cdsAtendentesAssociados.DisableControls;
  try
    cdsAtendentesAssociados.First;
    Result := '';
    while not cdsAtendentesAssociados.Eof do
    begin
      if Result <> '' then Result := Result + ', '; 
      Result := Result + cdsAtendentesAssociadosIDATENDEAGENDA.AsString;
      cdsAtendentesAssociados.Next;
    end;
  finally
    cdsAtendentesAssociados.First;
    cdsAtendentesAssociados.EnableControls;
  end;
end;

procedure TfrmCadGrupoAtende.Carrega( iId : integer );
begin
  grdAtendentesNAssociados.UnselectAll;
  grdAtendentesAssociados.UnselectAll;
  cds.Data := CtrlGrupoAtende.SelecionaGrupoAtende( iId );
  cdsAtendentesNAssociados.Data := CtrlAtendeAgenda.UsuariosAssociados( -1 );
  cdsAtendentesAssociados.Data  := CtrlAtendeAgenda.UsuariosAssociados( iId );
  iIdGrupoAtende := iId;
end;

end.
