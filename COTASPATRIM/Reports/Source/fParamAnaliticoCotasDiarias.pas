unit fParamAnaliticoCotasDiarias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Db, DBClient, uCMClientDataSet,
  wwdblook, CMDBLookupCombo, uCtrlAtivo, DBaseDados, USistema, UMensErro;

type
  TfrmParamAnaliticoCotasDiarias = class(TfrmParamReports_Padrao)
    cmlkpAtivo: TCMDBLookupCombo;
    lblAtivo: TLabel;
    CdsAtivo: TCMClientDataSet;
    GroupBox1: TGroupBox;
    lblVigenciaInicio: TLabel;
    lblVigenciaFim: TLabel;
    dbtpVigenciaInicio: TCMDateTimePicker;
    dbtpVigenciaFim: TCMDateTimePicker;
    cmbSituacao: TComboBox;
    lblSituacao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlAtivo        : TCtrlAtivo;
  public
    { Public declarations }
  end;

var
  frmParamAnaliticoCotasDiarias: TfrmParamAnaliticoCotasDiarias;

implementation

{$R *.DFM}

procedure TfrmParamAnaliticoCotasDiarias.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  CdsAtivo.Data   := CtrlAtivo.CarregaAtivo;

  cmbSituacao.ItemIndex := 8;
  
end;

procedure TfrmParamAnaliticoCotasDiarias.bbtnConfirmarClick(
  Sender: TObject);
begin
  inherited;
  
  if cmlkpAtivo.Value = '' then
  begin
    MsgDlg( 'Selecione o ativo.', 'Atenção', mtError, [mbOK], 0 );
    modalResult := mrNone;
    exit;
  end;

  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(cmlkpAtivo.LookupValue);
  if dbtpVigenciaInicio.Text <> '' then
    Cmp_Padrao.ParamValues[1].AsDateTime := StrToDate(dbtpVigenciaInicio.Text);
  if dbtpVigenciaFim.Text <> '' then
    Cmp_Padrao.ParamValues[2].AsDateTime := StrToDate(dbtpVigenciaFim.Text);
  Cmp_Padrao.ParamValues[3].AsInteger  := cmbSituacao.ItemIndex;            
end;

procedure TfrmParamAnaliticoCotasDiarias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlAtivo.Free;
end;

end.
