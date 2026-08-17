unit fRADParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBClient, Mask, DBCtrls,
  uCtrlRADParam, dBaseDados, uCmTypes, uSistema, uMensErro,
  uCMClientDataSet, uCmSqlParams, dxCntner, dxExEdtr, dxEdLib,
  wwdbdatetimepicker, CMDateTimePicker, CMProcura, MontaSelect, JCLStrings,
  JCLSysUtils;

type
  TfrmRADParam = class(TfrmOkCancelar)
    PageControl: TPageControl;
    tabEMail: TTabSheet;
    cdsEMailConexao: TCMClientDataSet;
    cdsEMailConexaoIDEMAILCONEXAO: TFloatField;
    cdsEMailConexaoSMTPSERVER: TStringField;
    cdsEMailConexaoNOMEEXIBICAO: TStringField;
    cdsEMailConexaoUSERNAME: TStringField;
    cdsEMailConexaoPASSWORD: TStringField;
    cdsEMailConexaoFLGAUTENTIC: TFloatField;
    cdsEMailConexaoPORTA: TFloatField;
    Label1: TLabel;
    dbedtSMTPSERVER: TDBEdit;
    dtsEMailConexao: TDataSource;
    Label2: TLabel;
    dbedtNOMEEXIBICAO: TDBEdit;
    Label3: TLabel;
    dbedtUSERNAME: TDBEdit;
    Label4: TLabel;
    dbedtPASSWORD: TDBEdit;
    Label6: TLabel;
    dbedtPORTA: TDBEdit;
    dbchkAutenticacao: TDBCheckBox;
    cdsRADParam: TCMClientDataSet;
    tabMensCM: TTabSheet;
    dbchkMensagem: TDBCheckBox;
    DsRadParam: TDataSource;
    cdsRADParamIDEMPRESA: TFloatField;
    cdsRADParamIDEMAILCONEXAO: TFloatField;
    cdsRADParamFLGENVIAEMAIL: TFloatField;
    cdsRADParamFLGENVIACM: TFloatField;
    tabGerais: TTabSheet;
    dbchk24h: TDBCheckBox;
    grpExpediente: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    cdsRADParamFLG24H: TFloatField;
    cdsRADParamIDREMETENTE: TFloatField;
    dbedtHoraIniExp: TDBEdit;
    dbedtHoraFimExp: TDBEdit;
    cdsRADParamHORAINIEXP: TStringField;
    cdsRADParamHORAFIMEXP: TStringField;
    MSGrupo: TMontaSelect;
    dbchkEmail: TDBCheckBox;
    Label5: TLabel;
    cmpRemetente: TCMProcura;
    cdsEMailConexaoDESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsEMailConexaoAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cdsRADParamAfterInsert(DataSet: TDataSet);
    procedure cdsRADParamBeforePost(DataSet: TDataSet);
    procedure dbchkMensagemClick(Sender: TObject);
    procedure dbedtHoraIniExpChange(Sender: TObject);
    procedure dbedtHoraFimExpChange(Sender: TObject);
    procedure dbedtHoraIniExpExit(Sender: TObject);
    procedure dbedtHoraFimExpExit(Sender: TObject);
    procedure dbChkEmailClick(Sender: TObject);
    procedure dbchk24hClick(Sender: TObject);
    procedure cdsEMailConexaoBeforePost(DataSet: TDataSet);
  private
    CtrlRADParam : TCtrlRADParam;
    function CampoHora( sHoraDigitada : string ) : string;
  public
    procedure MsgErro( sMsg : string );
    procedure Reset;
  end;

var
  frmRADParam: TfrmRADParam;

implementation

{$R *.DFM}

procedure TfrmRADParam.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRADParam := TCtrlRADParam.Create;
  CtrlRADParam.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlRADParam.CdsRADParam     := cdsRADParam;
  CtrlRADParam.CdsEmailConexao := cdsEMailConexao;
  Reset;

  PageControl.ActivePageIndex := 0;
end;

procedure TfrmRADParam.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Erro', mtError, [mbOk], 0 );
end;

procedure TfrmRADParam.FormDestroy(Sender: TObject);
begin
  CtrlRADParam.Free;
  inherited;
end;

procedure TfrmRADParam.cdsEMailConexaoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsEMailConexaoFLGAUTENTIC.AsInteger := 0;
  cdsEMailConexaoDESCRICAO.AsString := 'Sistema RAD';  
end;

procedure TfrmRADParam.bbtnConfirmarClick(Sender: TObject);
var
  sData1, sData2 : string;
begin
  inherited;

  if cdsRADParamFLG24H.AsInteger = 0 then
  begin

    if ( trim( dbedtHoraIniExp.Text ) = '' ) or ( trim( dbedtHoraIniExp.Text ) = ':' ) then
    begin
      MsgErro( 'Informe o horário de início de expediente.' );
      PageControl.ActivePage := tabGerais;
      dbedtHoraIniExp.SetFocus;
      exit;
    end;

    if ( trim( dbedtHoraFimExp.Text ) = '' ) or ( trim( dbedtHoraFimExp.Text ) = ':' ) then
    begin
      MsgErro( 'Informe o horário de término de expediente.' );
      PageControl.ActivePage := tabGerais;
      dbedtHoraFimExp.SetFocus;
      exit;
    end;

    sData1 := '01/01/2000 ' + dbedtHoraIniExp.Text;
    sData2 := '01/01/2000 ' + dbedtHoraFimExp.Text;

    if StrToDateTime( sData1 ) >= StrToDateTime( sData2 ) then
    begin
      MsgErro( 'O início do expediente deve ser anterior ao seu término.' );
      PageControl.ActivePage := tabGerais;
      dbedtHoraFimExp.SetFocus;
      exit;
    end;

  end;


  if cdsRADParamFLGENVIAEMAIL.AsInteger <> 0 then
  begin

    if trim( dbedtSMTPSERVER.Text ) = '' then
    begin
      MsgErro( 'Preencha o endereço do servidor SMTP.' );
      PageControl.ActivePage := tabEMail;
      dbedtSMTPSERVER.SetFocus;
      exit;
    end;

    if trim( dbedtUSERNAME.Text ) = '' then
    begin
      MsgErro( 'Preencha o username.' );
      PageControl.ActivePage := tabEMail;
      dbedtUSERNAME.SetFocus;
      exit;
    end;

    if trim( dbedtPASSWORD.Text ) = '' then
    begin
      MsgErro( 'Preencha a password.' );
      PageControl.ActivePage := tabEMail;
      dbedtPASSWORD.SetFocus;
      exit;
    end;

    if trim( dbedtNOMEEXIBICAO.Text ) = '' then
    begin
      MsgErro( 'Preencha o nome de exibição.' );
      PageControl.ActivePage := tabEMail;
      dbedtNOMEEXIBICAO.SetFocus;
      exit;
    end;

    if trim( dbedtPORTA.Text ) = '' then
    begin
      MsgErro( 'Preencha a porta.' );
      PageControl.ActivePage := tabEMail;
      dbedtPORTA.SetFocus;
      exit;
    end;

  end;

  if cdsRADParamFLGENVIACM.AsInteger <> 0 then
  begin
    if trim( cmpRemetente.Text ) = '' then
    begin
      MsgErro( 'Selecione o remetente.' );
      PageControl.ActivePage := tabMensCM;
      cmpRemetente.SetFocus;
      exit;
    end;
  end;

  cdsEMailConexao.Post;

  cdsRADParam.Post;

  if CtrlRADParam.Grava then
  begin
    MsgDlg( 'Configuração do RAD gravada com sucesso.', 'Informação', mtInformation, [mbOk], 0 );
    Reset;
  end;
end;

procedure TfrmRADParam.Reset;
begin
  cdsRADParam.Close;
  cdsEMailConexao.Close;

  CtrlRADParam.RecuperaConfigRAD;

  if cdsRADParam.IsEmpty then
  begin
    cdsRADParam.Insert;
    cdsEMailConexao.Insert;
  end
  else
  begin
    cdsRADParam.Edit;
    cdsEMailConexao.Edit;
  end;

  dbchkEmailClick( nil );
  dbchk24hClick( nil );
  dbchkMensagemClick( nil );
end;

procedure TfrmRADParam.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmRADParam.cdsRADParamAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsRADParamIDEMPRESA.AsInteger     := Sistema.IdEmpresa;
  cdsRADParamFLG24H.AsInteger        := 1;  
  cdsRADParamFLGENVIAEMAIL.AsInteger := 0;
  cdsRADParamFLGENVIACM.AsInteger    := 0;
end;

function TfrmRADParam.CampoHora(sHoraDigitada: string): string;
var
  sCampo, sHora, sHoraMinuto, sMinuto : string;
  iHora, iMinuto : integer;
  iPos : integer;
begin
  sCampo  := trim( sHoraDigitada );
  iPos := Pos( ':', sCampo );
  sHora   := trim( Copy( sCampo, 1, iPos - 1 ) );
  sMinuto := trim( Copy( sCampo, iPos + 1, length( sCampo ) - iPos ) );
  iHora := StrToIntDef( sHora, 0 );
  iMinuto := StrToIntDef( sMinuto, 0 );

  if iMinuto >= 60 then
     iMinuto := 0;
  if iHora   >= 24 then
     iHora   := 0;

  sHora   := StrPadLeft( IntToStr( iHora ), 2);
  sHora   := FormatFloat( '00', iHora );
  sMinuto := FormatFloat( '00', iMinuto );

  //amf 17.11.2006 21792 - Completa a hora
  if Length(sHora) < 2 then
     sHora := '0' + sHora;

  //amf 17.11.2006 21792 - Completa o minuto
  if Length(sMinuto) < 2 then
     sMinuto := '0' + sMinuto;

  sHoraMinuto := sHora + ':' + sMinuto;
  Result := sHoraMinuto;
end;

procedure TfrmRADParam.cdsRADParamBeforePost(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('FLG24H').AsInteger := iff(dbchk24h.Checked, 1, 0);
end;

procedure TfrmRADParam.dbchkMensagemClick(Sender: TObject);
begin
  inherited;
  cmpRemetente.Enabled := dbchkMensagem.Checked;
end;

procedure TfrmRADParam.dbedtHoraIniExpChange(Sender: TObject);
begin
  inherited;
  //amf 17.11.2006 21792
  if cdsRadParam.State in [dsInsert, dsEdit] then
  begin
     if Length(Trim(dbedtHoraIniExp.Text)) = 5 then
        cdsRadParamHoraIniExp.AsString := CampoHora(dbedtHoraIniExp.Text);
  end;
end;

procedure TfrmRADParam.dbedtHoraFimExpChange(Sender: TObject);
begin
  inherited;
  if cdsRadParam.State in [dsInsert, dsEdit] then
  begin
     if Length(Trim(dbedtHoraFimExp.Text)) = 5 then
        cdsRadParamHoraFimExp.AsString := CampoHora(dbedtHoraFimExp.Text);
  end;

end;

procedure TfrmRADParam.dbedtHoraIniExpExit(Sender: TObject);
begin
  inherited;
  if cdsRadParam.State in [dsInsert, dsEdit] then
     if (Trim(dbedtHoraIniExp.Text) <> ':') then
        cdsRadParamHoraIniExp.AsString := CampoHora(dbedtHoraIniExp.Text);
end;

procedure TfrmRADParam.dbedtHoraFimExpExit(Sender: TObject);
begin
  inherited;
  if cdsRadParam.State in [dsInsert, dsEdit] then
     if (Trim(dbedtHoraFimExp.Text) <> ':') then
        cdsRadParamHoraFimExp.AsString := CampoHora(dbedtHoraFimExp.Text);

end;

procedure TfrmRADParam.dbChkEmailClick(Sender: TObject);
begin
  inherited;
  dbedtSMTPSERVER.Enabled   := dbchkEmail.Checked;
  dbedtUSERNAME.Enabled     := dbchkEmail.Checked;
  dbedtPASSWORD.Enabled     := dbchkEmail.Checked;
  dbedtNOMEEXIBICAO.Enabled := dbchkEmail.Checked;
  dbedtPORTA.Enabled        := dbchkEmail.Checked;
  dbchkAutenticacao.Enabled := dbchkEmail.Checked;
end;

procedure TfrmRADParam.dbchk24hClick(Sender: TObject);
begin
  inherited;
  dbedtHoraIniExp.Enabled := not dbchk24h.Checked;
  dbedtHoraFimExp.Enabled := not dbchk24h.Checked;
end;

procedure TfrmRADParam.cdsEMailConexaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if cdsEMailConexaoDESCRICAO.IsNull then
    cdsEMailConexaoDESCRICAO.AsString := 'Sistema RAD';
end;

end.
