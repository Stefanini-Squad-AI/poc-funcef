unit fRptAgendamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlAtendeAgenda,
  wwdbdatetimepicker, wwdblook, Db, DBClient, uCMClientDataSet, uSistema,
  dBaseDados, uCtrlAssuntoAgenda, uModuloAgendamento;

type
  TfrmRptAgendamento = class(TfrmParamReports_Padrao)
    cdsAtendeAgenda: TCMClientDataSet;
    cdsAtendeAgendaNOME: TStringField;
    cdsAtendeAgendaNOMEUSUARIO: TStringField;
    cdsAtendeAgendaIDATENDEAGENDA: TFloatField;
    Label7: TLabel;
    cmbAtendente: TwwDBLookupCombo;
    cdsAssunto: TClientDataSet;
    cdsAssuntoDESCRICAO: TStringField;
    cdsAssuntoIDASSUNTOAGENDA: TFloatField;
    cdsAssuntoOBSERVACAO: TMemoField;
    Label8: TLabel;
    cmbAssunto: TwwDBLookupCombo;
    Label1: TLabel;
    cmbSituacao: TComboBox;
    Label2: TLabel;
    edtNomeSolic: TEdit;
    Label3: TLabel;
    dtDataAlteracao: TwwDBDateTimePicker;
    grpPeriodo: TGroupBox;
    Label9: TLabel;
    dtDataInicial: TwwDBDateTimePicker;
    Label4: TLabel;
    dtDataFinal: TwwDBDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlAtendeAgenda  : TCtrlAtendeAgenda;
    CtrlAssuntoAgenda : TCtrlAssuntoAgenda;
  public
    { Public declarations }
  end;

var
  frmRptAgendamento: TfrmRptAgendamento;

implementation

{$R *.DFM}

procedure TfrmRptAgendamento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamByName('IDATENDENTE').AsInteger     := StrToIntDef( cmbAtendente.LookupValue, 0 );
  Cmp_Padrao.ParamByName('DATAINICIAL').AsDateTime    := dtDataInicial.DateTime;
  Cmp_Padrao.ParamByName('DATAFINAL').AsDateTime      := dtDataFinal.DateTime;
  Cmp_Padrao.ParamByName('IDASSUNTOAGENDA').AsInteger := StrToIntDef( cmbAssunto.LookupValue, 0 );
  Cmp_Padrao.ParamByName('FLGSITUACAO').AsInteger     := cmbSituacao.ItemIndex;
  Cmp_Padrao.ParamByName('NOMESOLIC').AsString        := edtNomeSolic.Text;
  Cmp_Padrao.ParamByName('DATAALTERACAO').AsDateTime  := dtDataAlteracao.DateTime;
  Cmp_Padrao.ParamByName('_lblAtendente').AsString    := trim( cmbAtendente.Text );
  Cmp_Padrao.ParamByName('_lblAssunto').AsString      := trim( cmbAssunto.Text );
end;

procedure TfrmRptAgendamento.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil );
  cdsAtendeAgenda.Data := CtrlAtendeAgenda.LookupAtendentes;

  CtrlAssuntoAgenda := TCtrlAssuntoAgenda.Create;
  CtrlAssuntoAgenda.InitializeAs( CtrlAtendeAgenda );
  cdsAssunto.Data := CtrlAssuntoAgenda.LookupAssunto;

  cmbSituacao.ItemIndex := 0;

  if iReportAgendamento = 1 then
    Caption := 'Agendamentos'
  else
    if iReportAgendamento = 2 then
      Caption := 'Agendamentos por Atendentes'
    else
      Caption := 'Agendamentos por Datas'
end;

procedure TfrmRptAgendamento.FormDestroy(Sender: TObject);
begin
  CtrlAtendeAgenda.Free;
  CtrlAssuntoAgenda.Free;
  inherited;            
end;

end.
