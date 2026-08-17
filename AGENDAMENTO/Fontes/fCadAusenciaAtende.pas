unit fCadAusenciaAtende;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook,
  uCtrlAusenciaAtende, uCtrlAtendeAgenda, uCtrlAgendamento, uSistema,
  dBaseDados, wwdbdatetimepicker, uCmTypes, fReplicarAusencia, DBCtrls,
  fAgendamentosNoPeriodo;

type
  TfrmCadAusenciaAtende = class(TFrmCadastroMT)
    CdsIDAUSENCIAATENDE: TFloatField;
    CdsIDATENDEAGENDA: TFloatField;
    CdsDATAHORAINICIO: TDateTimeField;
    CdsDATAHORAFIM: TDateTimeField;
    cdsAtendeAgenda: TCMClientDataSet;
    cdsAtendeAgendaIDATENDEAGENDA: TFloatField;
    cdsAtendeAgendaNOMEUSUARIO: TStringField;
    cdsAtendeAgendaNOME: TStringField;
    Label1: TLabel;
    cmbAtendente: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    dtInicial: TwwDBDateTimePicker;
    dtFinal: TwwDBDateTimePicker;
    btnReplicar: TToolbarButton97;
    CdsMOTIVO: TBlobField;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    cdsAgendamentos: TCMClientDataSet;
    cdsAgendamentosSOLICITANTE: TStringField;
    cdsAgendamentosDATA: TDateTimeField;
    cdsAgendamentosHORA: TStringField;
    cdsAgendamentosASSUNTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure btnReplicarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    CtrlAusenciaAtende : TCtrlAusenciaAtende;
    CtrlAtendeAgenda   : TCtrlAtendeAgenda;
    CtrlAgendamento    : TCtrlAgendamento;

    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  frmCadAusenciaAtende: TfrmCadAusenciaAtende;

implementation

{$R *.DFM}

procedure TfrmCadAusenciaAtende.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAusenciaAtende := TCtrlAusenciaAtende.Create;
  CtrlAusenciaAtende.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlAusenciaAtende.CdsAusenciaAtende := Cds;

  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.InitializeAs( CtrlAusenciaAtende );

  CtrlAgendamento := TCtrlAgendamento.Create;
  CtrlAgendamento.InitializeAs( CtrlAusenciaAtende );

  Cds.CreateDataset;

  cdsAtendeAgenda.Data := CtrlAtendeAgenda.LookupAtendentes;
end;

procedure TfrmCadAusenciaAtende.FormDestroy(Sender: TObject);
begin
  CtrlAusenciaAtende.Free;
  CtrlAtendeAgenda.Free;
  CtrlAgendamento.Free;
  inherited;
end;

procedure TfrmCadAusenciaAtende.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadAusenciaAtende.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAusenciaAtende.GravaAusenciaAtende;
end;

procedure TfrmCadAusenciaAtende.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAusenciaAtende.GravaAusenciaAtende;
end;

procedure TfrmCadAusenciaAtende.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAusenciaAtende.GravaAusenciaAtende;
end;

procedure TfrmCadAusenciaAtende.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    cds.Data := CtrlAusenciaAtende.SelecionaAusenciaAtende( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

procedure TfrmCadAusenciaAtende.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Close;
  Cds.CreateDataSet;
end;

procedure TfrmCadAusenciaAtende.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if dtInicial.Date > dtFinal.Date then
  begin
    ShowMessage( 'A data final deve ser igual ou posterior à data inicial.');
    dtFinal.SetFocus;
    exit;
  end;

  if CtrlAusenciaAtende.ExisteConflito( CdsIDAUSENCIAATENDE.AsInteger,
                                        CdsIDATENDEAGENDA.AsInteger,
                                        CdsDATAHORAINICIO.AsDateTime,
                                        CdsDATAHORAFIM.AsDateTime ) then
  begin
    ShowMessage( 'Este período está em conflito com outro já cadastrado para este atendente.');
    dtInicial.SetFocus;
    exit;
  end;

  cdsAgendamentos.Close;
  cdsAgendamentos.Data := CtrlAgendamento.ListaAgendamentosNoPeriodo(
   CdsIDATENDEAGENDA.AsInteger, CdsDATAHORAINICIO.AsDateTime, CdsDATAHORAFIM.AsDateTime );
  if not cdsAgendamentos.IsEmpty then
  begin
    frmAgendamentosNoPeriodo := TfrmAgendamentosNoPeriodo.Create( Self );
    frmAgendamentosNoPeriodo.cdsAgendamentos.Data := cdsAgendamentos.Data;
    try
      if frmAgendamentosNoPeriodo.ShowModal = mrCancel then
        exit;
    finally
      frmAgendamentosNoPeriodo.Free;
    end;
  end;

  Accept := True;
end;

procedure TfrmCadAusenciaAtende.btnReplicarClick(Sender: TObject);
begin
  inherited;
  frmReplicarAusencia := TfrmReplicarAusencia.Create( Self );
  try
    frmReplicarAusencia.dInicio         := dtInicial.DateTime;
    frmReplicarAusencia.dFim            := dtFinal.DateTime;
    frmReplicarAusencia.iIdAtendeAgenda := CdsIDATENDEAGENDA.AsInteger;
    frmReplicarAusencia.sMotivo         := CdsMOTIVO.AsString;
    frmReplicarAusencia.ShowModal;
  finally
    frmReplicarAusencia.Free;
  end;
end;

procedure TfrmCadAusenciaAtende.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  btnReplicar.Enabled := ( not ( CmeCadastro.Operacao in [opInserir,opAlterar] ) )
                           and ( not cds.IsEmpty )
                           and ( cds.State = dsBrowse );
end;

end.
