unit cRelExtrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, mCliente, mContrato, Db, DBClient,
  uCMClientDataSet, wwdblook, uCtrlTipoCustoRecImov, uCtrlSitContImob,
  Provider, DBTables;

type
  TcfgRelExtrato = class(TfrmParamReports_Padrao)
    molContrato1: TmolContrato;
    molCliente1: TmolCliente;
    rbTipo: TRadioGroup;
    GroupBox1: TGroupBox;
    cmdtCorrige: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    cmdtInicio: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cmdtTermino: TCMDateTimePicker;
    cdsReceita: TCMClientDataSet;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label3: TLabel;
    DBcboSitCont: TwwDBLookupCombo;
    cdsSitCont: TCMClientDataSet;
    Label4: TLabel;
    cdsReceitaIDTIPOCUSTORECIMO: TFloatField;
    cdsReceitaDESCCUSTORECIMO: TStringField;
    cdsSitContIDSITCONTIMOB: TFloatField;
    cdsSitContDESCRICAO: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    CtrlSitContImob      : TCtrlSitContImob;
    procedure MsgRelat ( sMessageInfo : String );
  public
    { Public declarations }
  end;

var
  cfgRelExtrato: TcfgRelExtrato;

implementation

{$R *.DFM}

uses dBaseDados, uSistema;

procedure TcfgRelExtrato.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlSitContImob      := TCtrlSitContImob.Create;
  CtrlTipoCustoRecImov.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                  MsgRelat);
  CtrlSitContImob.InitializeAs(CtrlTipoCustoRecImov);
end;


procedure TcfgRelExtrato.MsgRelat(sMessageInfo: String);
begin
  ShowMessage ( sMessageInfo );
end;


procedure TcfgRelExtrato.FormShow(Sender: TObject);
begin
  inherited;
  cdsReceita.Data  := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo,'R');
  cdsSitcont.Data  := CtrlSitContImob.LookupSitContImob;
  cmdtCorrige.Date := Date();
end;


procedure TcfgRelExtrato.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cmp_Padrao.ParamByName('idContratoImovel').AsInteger := molContrato1.iContrato;
  cmp_Padrao.ParamByName('idCliente').AsInteger        := molCliente1.iCliente;
  cmp_Padrao.ParamByName('flgTipo').AsInteger          := rbTipo.ItemIndex;
  cmp_Padrao.ParamByName('dtCorrige').AsDateTime       := cmdtCorrige.Date;
  if DBcboTipoRecDes.LookupValue = '' then
       cmp_Padrao.ParamByName('idTipoReceita').AsInteger := -1
  else cmp_Padrao.ParamByName('idTipoReceita').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
  if DBcboSitCont.LookupValue = '' then
       cmp_Padrao.ParamByName('idSitCont').AsInteger := -1
  else cmp_Padrao.ParamByName('idSitCont').AsInteger := StrToInt(DBcboSitCont.LookupValue);
  if cmdtInicio.Text <> ''  then
    cmp_Padrao.ParamByName('dtInicio').AsDateTime    := cmdtInicio.Date;
  if cmdtTermino.Text <> '' then
    cmp_Padrao.ParamByName('dtTermino').AsDateTime   := cmdtTermino.Date;
end;


end.
