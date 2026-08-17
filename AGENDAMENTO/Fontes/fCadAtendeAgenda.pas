unit fCadAtendeAgenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, DBTables, Provider, Grids,
  Wwdbigrd, Wwdbgrid, uCtrlAtendeAgenda, uSistema, dBaseDados,
  uCMClientDataSet;

type
  TfrmCadAtendeAgenda = class(TfrmOkCancelar)
    pnlUsuarios: TPanel;
    Panel1: TPanel;
    cdsUsuarios: TCMClientDataSet;
    dtsUsuarios: TDataSource;
    grdUsuarios: TwwDBGrid;
    cdsUsuariosIDUSUARIO: TFloatField;
    cdsUsuariosNOMEUSUARIO: TStringField;
    cdsUsuariosNOME: TStringField;
    pnlAtendentes: TPanel;
    Panel3: TPanel;
    grdAtendentes: TwwDBGrid;
    btnAdiciona: TSpeedButton;
    btnRetira: TSpeedButton;
    cdsAtendentes: TCMClientDataSet;
    cdsAtendentesNOMEUSUARIO: TStringField;
    cdsAtendentesNOME: TStringField;
    cdsAtendentesIDUSUARIO: TFloatField;
    dtsAtendentes: TDataSource;
    cdsAtendentesIDATENDEAGENDA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnRetiraClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlAtendeAgenda : TCtrlAtendeAgenda;
  public
    procedure Carrega;

    procedure MsgErro(sMsg: String);
  end;

var
  frmCadAtendeAgenda: TfrmCadAtendeAgenda;

implementation

{$R *.DFM}

{ TfrmCadAtendeAgenda }

procedure TfrmCadAtendeAgenda.Carrega;
begin
  cdsUsuarios.Close;
  cdsUsuarios.Data := CtrlAtendeAgenda.UsuariosNaoAtendentes;

  cdsAtendentes.Close;
  cdsAtendentes.Data := CtrlAtendeAgenda.UsuariosAtendentes;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;

  grdUsuarios.UnselectAll;
  grdAtendentes.UnselectAll;
end;

procedure TfrmCadAtendeAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlAtendeAgenda.CdsAtendeAgenda := cdsAtendentes;
  cdsAtendentes.CreateDataset;
  Carrega;
end;

procedure TfrmCadAtendeAgenda.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadAtendeAgenda.btnAdicionaClick(Sender: TObject);
var
  aIdUsuario : array of Integer;
  i : integer;
begin
  inherited;

  if grdUsuarios.SelectedList.Count > 0 then
  begin
    SetLength( aIdUsuario, grdUsuarios.SelectedList.Count );
    i := 0;

    cdsUsuarios.DisableControls;
    cdsAtendentes.DisableControls;
    try
      cdsUsuarios.First;
      while not cdsUsuarios.Eof do
      begin
        if grdUsuarios.IsSelectedRecord then
        begin
          aIdUsuario[i] := cdsUsuariosIDUSUARIO.AsInteger;
          Inc( i );
          cdsAtendentes.Append;
          cdsAtendentesIDATENDEAGENDA.AsInteger := 0;
          cdsAtendentesIDUSUARIO.AsInteger      := cdsUsuariosIDUSUARIO.AsInteger;
          cdsAtendentesNOMEUSUARIO.AsString     := cdsUsuariosNOMEUSUARIO.AsString;
          cdsAtendentesNOME.AsString            := cdsUsuariosNOME.AsString;
          cdsAtendentes.Post;
        end;
        cdsUsuarios.Next;
      end;

      grdAtendentes.UnSelectAll;
      grdUsuarios.UnSelectAll;

      for i := 0 to high( aIdUsuario ) do
      begin
        cdsUsuarios.First;
        cdsUsuarios.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        cdsUsuarios.Delete;

        cdsAtendentes.First;
        cdsAtendentes.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        grdAtendentes.SelectRecord;
      end;

      grdUsuarios.UnSelectAll;

    finally
      cdsUsuarios.EnableControls;
      cdsAtendentes.EnableControls;
    end;

    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
  end;
end;

procedure TfrmCadAtendeAgenda.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg( 'Cancela alterações?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    Carrega;
end;

procedure TfrmCadAtendeAgenda.btnRetiraClick(Sender: TObject);
var
  aIdUsuario : array of Integer;
  i : integer;
begin
  inherited;

  if grdAtendentes.SelectedList.Count > 0 then
  begin
    SetLength( aIdUsuario, grdAtendentes.SelectedList.Count );
    i := 0;

    cdsUsuarios.DisableControls;
    cdsAtendentes.DisableControls;
    try
      cdsAtendentes.First;
      while not cdsAtendentes.Eof do
      begin
        if grdAtendentes.IsSelectedRecord then
        begin
          aIdUsuario[i] := cdsAtendentesIDUSUARIO.AsInteger;
          Inc( i );
          cdsUsuarios.Append;
          cdsUsuariosIDUSUARIO.AsInteger        := cdsAtendentesIDUSUARIO.AsInteger;
          cdsUsuariosNOMEUSUARIO.AsString       := cdsAtendentesNOMEUSUARIO.AsString;
          cdsUsuariosNOME.AsString              := cdsAtendentesNOME.AsString;
          cdsUsuarios.Post;
        end;
        cdsAtendentes.Next;
      end;

      grdAtendentes.UnSelectAll;
      grdUsuarios.UnSelectAll;

      for i := 0 to high( aIdUsuario ) do
      begin
        cdsAtendentes.First;
        cdsAtendentes.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        cdsAtendentes.Delete;

        cdsUsuarios.First;
        cdsUsuarios.Locate( 'IDUSUARIO', aIdUsuario[i], [] );
        grdUsuarios.SelectRecord;
      end;

    finally
      cdsUsuarios.EnableControls;
      cdsAtendentes.EnableControls;
    end;

    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
  end;
end;

procedure TfrmCadAtendeAgenda.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if CtrlAtendeAgenda.GravaAtendeAgenda then
    Carrega;  
end;

end.
