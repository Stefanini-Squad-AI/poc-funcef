unit fReplicarPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, wwdblook, Db, DBClient,
  uCtrlPeriodoAgenda, uCtrlGrupoAtende, uSistema, dBaseDados, Wwdatsrc,
  uCMClientDataSet;

type
  TfrmReplicarPeriodo = class(TfrmOkCancelar)
    cdsGrupoAtendentes: TClientDataSet;
    cdsGrupoAtendentesDESCRICAO: TStringField;
    cdsGrupoAtendentesIDGRUPOATENDE: TFloatField;
    cdsGrupoAtendentesOBSERVACAO: TMemoField;
    Label1: TLabel;
    cmbGrupoAtendentes: TwwDBLookupCombo;
    Label2: TLabel;
    dbdtDtInicial: TwwDBDateTimePicker;
    Label3: TLabel;
    dbdtDtFinal: TwwDBDateTimePicker;
    Label4: TLabel;
    Cds: TCMClientDataSet;
    CdsIDPERIODOAGENDA: TFloatField;
    CdsIDGRUPOATENDE: TFloatField;
    CdsDATAINICIO: TDateTimeField;
    CdsDATAFIM: TDateTimeField;
    cdsDet: TCMClientDataSet;
    cdsDetHORARIO: TStringField;
    cdsDetIDHORARIOATENDE: TFloatField;
    cdsDetIDPERIODOAGENDA: TFloatField;
    ds: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlPeriodoAgenda : TCtrlPeriodoAgenda;
    CtrlGrupoAtende   : TCtrlGrupoAtende;

    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  frmReplicarPeriodo: TfrmReplicarPeriodo;

implementation

{$R *.DFM}

procedure TfrmReplicarPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodoAgenda := TCtrlPeriodoAgenda.Create;
  CtrlPeriodoAgenda.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlPeriodoAgenda.CdsPeriodoAgenda := Cds;
  CtrlPeriodoAgenda.CdsHorarioAgenda := CdsDet;

  CtrlGrupoAtende := TCtrlGrupoAtende.Create;
  CtrlGrupoAtende.InitializeAs( CtrlPeriodoAgenda );

  cdsGrupoAtendentes.Data := CtrlGrupoAtende.LookupGrupoAtende;

  Cds.CreateDataset;
  Cds.Insert;
end;

procedure TfrmReplicarPeriodo.FormDestroy(Sender: TObject);
begin
  CtrlPeriodoAgenda.Free;
  CtrlGrupoAtende.Free;
  inherited;
end;

procedure TfrmReplicarPeriodo.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmReplicarPeriodo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if dbdtDtInicial.Date > dbdtDtFinal.Date then
  begin
    ShowMessage( 'A data final deve ser igual ou posterior à data inicial.');
    dbdtDtFinal.SetFocus;
    exit;
  end;

  if CtrlPeriodoAgenda.ExisteConflito( CdsIDPERIODOAGENDA.AsInteger,
                                       CdsIDGRUPOATENDE.AsInteger,
                                       CdsDATAINICIO.AsDateTime,
                                       CdsDATAFIM.AsDateTime ) then
  begin
    ShowMessage( 'Este período está em conflito com outro já cadastrado para este grupo.');
    dbdtDtInicial.SetFocus;
    exit;
  end;

  if CtrlPeriodoAgenda.GravaPeriodoAgenda then
  begin
    ShowMessage( 'Os horários foram replicados com sucesso para o grupo e o período selecionados.' );
    ModalResult := mrOk;
  end;
    
end;

end.
