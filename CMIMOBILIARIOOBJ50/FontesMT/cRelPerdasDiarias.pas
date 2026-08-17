unit cRelPerdasDiarias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdblook, Db, DBClient, uCMClientDataSet, uCtrlTipoImovel,
  mProposta, DBTables;

type
  TcfgRelPerdasDiarias = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    cmdtInicio: TCMDateTimePicker;
    bgSegmento: TGroupBox;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    DBcboTipoImovel: TwwDBLookupCombo;
    cmdtFinal: TCMDateTimePicker;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    qrySitContratual: TQuery;
    strngfldSitContratualDESCRICAO: TStringField;
    qrySitContratualIDSITCONTIMOB: TFloatField;
    dsSitContratual: TDataSource;
    grpSitContratual: TGroupBox;
    dblkpcmbSituacaoContratual: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel : TCtrlTipoImovel;
  public
    { Public declarations }
  end;

var
  cfgRelPerdasDiarias: TcfgRelPerdasDiarias;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

procedure TcfgRelPerdasDiarias.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects
  CtrlTipoImovel := TCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  cdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;

  qrySitContratual.Open;
end;

procedure TcfgRelPerdasDiarias.FormDestroy(Sender: TObject);
begin
  qrySitContratual.Close;
  FreeAndNil( CtrlTipoImovel );
  inherited;
end;

procedure TcfgRelPerdasDiarias.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cmp_Padrao.ParamByName('dataini').AsDateTime       := cmdtInicio.Date;
  cmp_Padrao.ParamByName('datafim').AsDateTime       := cmdtFinal.Date;
  cmp_Padrao.ParamByName('sCodTipImovel').AsString   := DBcboTipoImovel.LookupValue;
  cmp_Padrao.ParamByName('sCodSitContrato').AsString := dblkpcmbSituacaoContratual.LookupValue;
end;


end.
