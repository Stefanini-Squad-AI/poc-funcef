unit fReplicarAusencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBClient, uCtrlGrupoAtende,
  uCtrlAusenciaAtende, uCtrlAtendeAgenda, uSistema, dBaseDados, uCMClientDataSet;

type
  TfrmReplicarAusencia = class(TfrmOkCancelar)
    cdsGrupoAtendentes: TClientDataSet;
    cdsGrupoAtendentesDESCRICAO: TStringField;
    cdsGrupoAtendentesIDGRUPOATENDE: TFloatField;
    cdsGrupoAtendentesOBSERVACAO: TMemoField;
    Label1: TLabel;
    cmbGrupoAtendentes: TwwDBLookupCombo;
    Label4: TLabel;
    Cds: TCMClientDataSet;
    CdsIDAUSENCIAATENDE: TFloatField;
    CdsIDATENDEAGENDA: TFloatField;
    CdsDATAHORAINICIO: TDateTimeField;
    CdsDATAHORAFIM: TDateTimeField;
    cdsAtendeAgenda: TCMClientDataSet;
    cdsAtendeAgendaNOMEUSUARIO: TStringField;
    cdsAtendeAgendaNOME: TStringField;
    cdsAtendeAgendaIDATENDEAGENDA: TFloatField;
    cdsAtendeAgendaIDUSUARIO: TFloatField;
    CdsMOTIVO: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlGrupoAtende    : TCtrlGrupoAtende;
    CtrlAusenciaAtende : TCtrlAusenciaAtende;
    CtrlAtendeAgenda   : TCtrlAtendeAgenda;

    procedure MsgErro(sMsg: String);
  public
    iIdAtendeAgenda : integer;
    dInicio, dFim : TDateTime;
    sMotivo : string;
  end;

var
  frmReplicarAusencia: TfrmReplicarAusencia;

implementation

{$R *.DFM}

procedure TfrmReplicarAusencia.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAusenciaAtende := TCtrlAusenciaAtende.Create;
  CtrlAusenciaAtende.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlAusenciaAtende.CdsAusenciaAtende := Cds;

  CtrlGrupoAtende := TCtrlGrupoAtende.Create;
  CtrlGrupoAtende.InitializeAs( CtrlAusenciaAtende );

  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.InitializeAs( CtrlAusenciaAtende );

  cdsGrupoAtendentes.Data := CtrlGrupoAtende.LookupGrupoAtende;
end;

procedure TfrmReplicarAusencia.FormDestroy(Sender: TObject);
begin
  CtrlAusenciaAtende.Free;
  CtrlGrupoAtende.Free;
  CtrlAtendeAgenda.Free;
  inherited;
end;

procedure TfrmReplicarAusencia.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmReplicarAusencia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if cmbGrupoAtendentes.Text = '' then
  begin
    ShowMessage( 'Preencha o Grupo de Atendentes.');
    cmbGrupoAtendentes.SetFocus;
    exit;
  end;

  cds.Close;
  Cds.CreateDataset;

  cdsAtendeAgenda.Data := CtrlAtendeAgenda.UsuariosAssociados( StrToIntDef( cmbGrupoAtendentes.LookupValue, -1 ) );
  cdsAtendeAgenda.First;
  while not cdsAtendeAgenda.Eof do
  begin
    if cdsAtendeAgendaIDATENDEAGENDA.AsInteger <> iIdAtendeAgenda then
    begin

      if CtrlAusenciaAtende.ExisteConflito( -1,
                                            cdsAtendeAgendaIDATENDEAGENDA.AsInteger,
                                            dInicio,
                                            dFim ) then
      begin
        ShowMessage( 'Este período está em conflito com outro(s) já cadastrado(s) para um ou mais atendentes deste grupo.');
        exit;
      end;

      cds.Append;
      CdsIDAUSENCIAATENDE.AsInteger := -1;
      CdsIDATENDEAGENDA.AsInteger   := cdsAtendeAgendaIDATENDEAGENDA.AsInteger;
      CdsDATAHORAINICIO.AsDateTime  := dInicio;
      CdsDATAHORAFIM.AsDateTime     := dFim;
      CdsMOTIVO.AsString            := sMotivo;
      cds.Post;
    end;
    cdsAtendeAgenda.Next;
  end;

  if CtrlAusenciaAtende.GravaAusenciaAtende then
  begin
    ShowMessage( 'As ausências foram replicadas com sucesso para todos os integrantes do grupo selecionado.' );
    ModalResult := mrOk;
  end;

end;

end.
