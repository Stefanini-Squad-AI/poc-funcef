unit fParamMovPorConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,uCtrlRoteiros, dBaseDados,
  USistema, UMensErro, Db, DBClient, uCMClientDataSet, Wwdatsrc, DBTables,
  CMDatabase, CMDBLookupCombo, uCtrlAtivo, uCmSqlParams,fParamReports_Padrao,
  CmParamReport;

type
  TfrmParamMovPorConta = class(TfrmParamReports_Padrao)
    lblAtivo: TLabel;
    lblConta: TLabel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    lblVigenciaInicio: TLabel;
    lblVigenciaFim: TLabel;
    DsMovimentacao: TwwDataSource;
    DsConta: TwwDataSource;
    DsAtivo: TwwDataSource;
    cdsAtivo: TCMClientDataSet;
    cdsConta: TCMClientDataSet;
    cdsMovimentacao: TCMClientDataSet;
    dblkMovimentacao: TCMDBLookupCombo;
    cmlkpAtivo: TCMDBLookupCombo;
    dblkConta: TwwDBLookupCombo;
    dbtpVigenciaInicio: TCMDateTimePicker;
    dbtpVigenciaFim: TCMDateTimePicker;
    CMSqlMovim: TCMSqlParams;


    procedure FormCreate(Sender: TObject);
    procedure cmlkpAtivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlRoteiros : TCtrlRoteiro;
    CtrlAtivo    : TCtrlAtivo;
    procedure selecionaAtivo;
  public
    procedure MsgErro( sMsg : string );
  end;

var
  frmParamMovPorConta: TfrmParamMovPorConta;

implementation

{$R *.DFM}

procedure TfrmParamMovPorConta.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRoteiros:=TCtrlRoteiro.Create;
  CtrlRoteiros.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  //CtrlRoteiros._CdsDetMov:= CdsMovimentacao;
  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs(CtrlRoteiros);

  //Carrega as tabelas de Destino
  cdsMovimentacao.Data   := CtrlRoteiros.CarregaCpRTpMovim(-1);
  cdsConta.data:= CtrlRoteiros.CarregaConta( -1 );
  CdsAtivo.Data:= CtrlAtivo.CarregaAtivo;
  CMSqlMovim.Open;
end;

procedure TfrmParamMovPorConta.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmParamMovPorConta.selecionaAtivo;
begin
  cdsConta.close;
  if cmlkpAtivo.text <>'' then
     cdsConta.data:= CtrlRoteiros.CarregaConta( cdsAtivo.FieldByName('IDCPATIVO').asInteger )
  else
     cdsConta.data:= CtrlRoteiros.CarregaConta( -1 );
end;

procedure TfrmParamMovPorConta.cmlkpAtivoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  selecionaAtivo;
end;

procedure TfrmParamMovPorConta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if cmlkpAtivo.Value = '' then
  begin
    MsgDlg( 'O campo ativo é obligatório', 'Atenção', mtError, [mbOK], 0 );
    modalResult := mrNone;
    exit;
  end;

   if dbtpVigenciaInicio.text = '' then
   begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dbtpVigenciaFim.text = '' then
   begin
      MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dbtpVigenciaFim.Date < dbtpVigenciaInicio.date then
   begin
      MsgDlg('O Período informado é inválido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

  Cmp_Padrao.ParamValues[0].AsInteger:=  StrToInt(cmlkpAtivo.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger:=  StrToIntdef(dblkConta.LookupValue,-1);
  Cmp_Padrao.ParamValues[2].AsInteger:=  StrToIntdef(dblkMovimentacao.LookupValue,-1);
  Cmp_Padrao.ParamValues[3].AsDateTime:= StrToDate(dbtpVigenciaInicio.Text);
  Cmp_Padrao.ParamValues[4].AsDateTime:= StrToDate(dbtpVigenciaFim.Text);
end;

end.
