unit FConsLogCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, DBClient,
  uCMClientDataSet, uCtrlInvestimento, uCtrlPadroes, DBTables, Wwquery;

type
  TfrmConsLogCustodia = class(TfrmOkCancelarRelInv)
    pnlFiltros: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    dblPlanoPrev: TwwDBLookupCombo;
    grdConsulta: TwwDBGrid;
    cdsCarteira: TCMClientDataSet;
    cdsCustodiante: TCMClientDataSet;
    cdsPlanoPatro: TCMClientDataSet;
    cdsInvestimento: TCMClientDataSet;
    cdsMotivoBloq: TCMClientDataSet;
    DsLog: TDataSource;
    QryLog: TwwQuery;
    QryLogPLANPRVCONTABPATRO: TStringField;
    QryLogDESCINVESTIMENTO: TStringField;
    QryLogDATA: TDateTimeField;
    QryLogVLRCARTEIRA: TFloatField;
    QryLogVLRCUSTODIA: TFloatField;
    QryLogTRGDTINCLUSAO: TDateTimeField;
    dblInvestimento: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlInvestimento  : TCtrlInvestimento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsLogCustodia: TfrmConsLogCustodia;

implementation
uses UMensErro;

{$R *.DFM}

procedure TfrmConsLogCustodia.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlInvestimento  := TCtrlInvestimento.Create;
  CtrlInvestimento.InitializeAs(Padroes);

  cdsPlanoPatro.Data := CtrlInvestimento.ListPlanoPatro;
  cdsCarteira.Data := CtrlInvestimento.ListCarteira(2, -1, 0);
  cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 2);
  cdsCustodiante.Data := CtrlInvestimento.ListCustodiante(-1);
end;

procedure TfrmConsLogCustodia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(edDataIni.Text) = '' then
  begin
     MsgDlg('Data Inicial não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
     if edDataIni.CanFocus then
        edDataIni.SetFocus;
     Exit;
  end
  else if Trim(edDataFim.Text) = '' then
  begin
     MsgDlg('Data Final não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
     if edDataFim.CanFocus then
        edDataFim.SetFocus;
     Exit;
  end;
  if Trim(dblCarteira.text) = '' then
  begin
     MsgDlg('Carteira não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
     if dblCarteira.CanFocus then
        dblCarteira.SetFocus;
     Exit;
  end;

  with QryLog do begin
    close;
    ParamByName('DATAINI').AsString := edDataIni.Text;
    ParamByName('DATAFIM').AsString := edDataFim.Text;
    ParamByName('IDCARTEIRAINVEST').AsInteger := strToInt(dblCarteira.lookupValue);
    if Trim(dblInvestimento.text) <> '' then
      ParamByName('IDINVESTIMENTO').AsInteger := strToInt(dblInvestimento.LookupValue)
    else
      ParamByName('IDINVESTIMENTO').Clear;

    if Trim(dblPlanoPrev.text) <> '' then
      ParamByName('IDPLANPREVCTBPATR').AsInteger := strToInt(dblPlanoPrev.lookupValue)
    else
      ParamByName('IDPLANPREVCTBPATR').Clear;

    Open;
  end;
end;

procedure TfrmConsLogCustodia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlInvestimento);
end;

end.
