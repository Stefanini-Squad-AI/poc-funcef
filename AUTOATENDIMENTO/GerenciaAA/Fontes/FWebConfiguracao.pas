unit FWebConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, DBClient, uCMClientDataSet, Mask,
  DBCtrls, ComCtrls, Provider, JCLStrings,
  uCMCrypto, uCtrlWebConfiguracao, uCmTypes, dBaseDados, uSistema, uCtrlWebRegra,
  MontaSelect, uCtrlEmailConexao, wwdblook, uCtrlMsgPreDef, uCtrlMensagens,
  {No padrão 15, trocar uCtrlMsgContexto14 abaixo por uCtrlMsgContexto}
  uCtrlMsgContexto14, uCmSqlParams;

type
  TfrmWebConfiguracao = class(TfrmOkCancelar)
    cdsWebConfiguracao: TCMClientDataSet;
    dtsWebConfiguracao: TDataSource;
    cdsEmpresaProp: TCMClientDataSet;
    cdsEmpresaPropIDPESSOA: TFloatField;
    cdsEmpresaPropNOMEEMPRESA: TStringField;
    dtsEmpresaProp: TDataSource;
    cdsWebConfiguracaoIDFUNDACAO: TFloatField;
    PageControl: TPageControl;
    tabGerais: TTabSheet;
    lblFundacao: TLabel;
    dblkpEmpresaProp: TDBLookupComboBox;
    cdsWebConfiguracaoNOMEBASE: TStringField;
    lblNomeBase: TLabel;
    dbedtNomeBase: TDBEdit;
    tabSenha: TTabSheet;
    lblTxtSenhaMin: TLabel;
    edtSenhaMin: TEdit;
    updSenhaMin: TUpDown;
    lblTxtSenhaMax: TLabel;
    edtSenhaMax: TEdit;
    updSenhaMax: TUpDown;
    cdsWebConfiguracaoSENHAMIN: TFloatField;
    cdsWebConfiguracaoSENHAMAX: TFloatField;
    cdsWebConfiguracaoSENHACASE: TStringField;
    cdsWebConfiguracaoSENHACRIPTO: TStringField;
    dbchkSenhaCase: TDBCheckBox;
    cdsWebConfiguracaoLOGINMASTER: TStringField;
    cdsWebConfiguracaoSENHAMASTER: TStringField;
    tabAcessos: TTabSheet;
    tabModulos: TTabSheet;
    cdsWebConfiguracaoFLGCTRCHQATV: TStringField;
    cdsWebConfiguracaoFLGINFRENDATV: TStringField;
    cdsWebConfiguracaoFLGEXTEMPTMOATV: TStringField;
    dbchkFlgCtrChqAtv: TDBCheckBox;
    dbchkFlgInfRendAtv: TDBCheckBox;
    dbchkFlgExtEmpAtv: TDBCheckBox;
    lblTxtNumSenhaBlq: TLabel;
    edtNumSenhaBlq: TEdit;
    updNumSenhaBlq: TUpDown;
    cdsWebConfiguracaoNUMSENHABLQ: TFloatField;
    tabExportacaoSenhas: TTabSheet;
    Label1: TLabel;
    dbmemPreTextExporta: TDBMemo;
    Label2: TLabel;
    dbmemPosTextExporta: TDBMemo;
    cdsWebConfiguracaoPRETEXTOEXPORTA: TStringField;
    cdsWebConfiguracaoPOSTEXTOEXPORTA: TStringField;
    tbsNovoUsuario: TTabSheet;
    msRegra: TMontaSelect;
    cdsWebConfiguracaoREGRANOVOUSU: TFloatField;
    cdsWebConfiguracaoQRYNOVOUSU: TBlobField;
    cdsWebConfiguracaoQRYLOGIN: TBlobField;
    cdsWebConfiguracaoREGRALOGIN: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    lblIDREGRAVALIDA: TLabel;
    edtNOMEREGRA: TEdit;
    spbRegra: TSpeedButton;
    spbLimpa: TSpeedButton;
    lblQUERYVALIDA: TLabel;
    dbmemQRYNOVOUSU: TDBMemo;
    Label6: TLabel;
    dbmemQRYACESSO: TDBMemo;
    Label3: TLabel;
    edtRegraLogin: TEdit;
    spbRegraLogin: TSpeedButton;
    spbLimpaRegraLogin: TSpeedButton;
    Label4: TLabel;
    dbmemQRYLOGIN: TDBMemo;
    cdsWebConfiguracaoQRYACESSO: TBlobField;
    cdsWebConfiguracaoFLGENVIOSENHA: TStringField;
    rgrEnvio: TDBRadioGroup;
    cdsMsgContexto: TCMClientDataSet;
    dtsMsgContexto: TDataSource;
    grpMsgContexto: TGroupBox;
    cdsMsgContextoIDMSGCONTEXTO: TFloatField;
    cdsMsgContextoIDMODULO: TFloatField;
    cdsMsgContextoDESCRICAO: TStringField;
    cdsMsgContextoFLGCONFIGPROPRIA: TFloatField;
    cdsMsgContextoFLGTIPOENVIO: TFloatField;
    cdsMsgContextoASSUNTOMSG: TStringField;
    cdsMsgContextoIDEMAILCONEXAO: TFloatField;
    cdsEmailConexao: TCMClientDataSet;
    lblEmailConexao: TLabel;
    dblkpConexaEmail: TwwDBLookupCombo;
    lblAssuntoMsg: TLabel;
    dbedtAssuntoMsg: TDBEdit;
    Label5: TLabel;
    cdsMsgPreDef: TCMClientDataSet;
    dblkpMsgPreDef: TwwDBLookupCombo;
    cdsMsgContextoIDMSGPREDEF: TFloatField;
    Button1: TButton;
    GroupBox1: TGroupBox;
    lblLoginMaster: TLabel;
    dbedtLOGINMASTER: TDBEdit;
    lblSenhMaster: TLabel;
    edtSenhaMaster: TEdit;
    gbAutoEmprestimo: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    dbedtLOGINAUTOEMP: TDBEdit;
    edtSenhaAutoEmp: TEdit;
    chkAutoEmprestimo: TDBCheckBox;
    cdsWebConfiguracaoLOGINAUTOEMP: TStringField;
    cdsWebConfiguracaoSENHAAUTOEMP: TStringField;
    cdsWebConfiguracaoFLGATIVOAUTOEMP: TStringField;
    sqlAutoEmprestimo: TCMSqlParams;
    cdsAutoEmprestimo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edtSenhaMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaMaxKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaMinExit(Sender: TObject);
    procedure edtSenhaMaxExit(Sender: TObject);
    procedure edtNumSenhaBlqExit(Sender: TObject);
    procedure edtNumSenhaBlqKeyPress(Sender: TObject; var Key: Char);
    procedure spbRegraClick(Sender: TObject);
    procedure spbLimpaClick(Sender: TObject);
    procedure spbLimpaRegraLoginClick(Sender: TObject);
    procedure spbRegraLoginClick(Sender: TObject);
    procedure rgrEnvioChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    WebConfiguracao : TCtrlWebConfiguracao;
    WebRegra        : TCtrlWebRegra;

    CMCrypto : TCMCrypto;

    //Pendência 23402 - 26/02/2007 - Padrão 14
    CtrlEmailConexao: TCtrlEmailConexao;
    MsgContexto     : TCtrlMsgContexto;
    MsgPreDef       : TCtrlMsgPreDef;
    //Fim Pendência 23402

    procedure MsgErro ( sMsg : String );
    procedure Carrega;
  public
    { Public declarations }
  end;

//Pendência 23402 - 26/02/2007 - Padrão 14
const
  IdMsgContexto : Integer = 6;
//Fim Pendência 23402

var
  frmWebConfiguracao: TfrmWebConfiguracao;

implementation

{$R *.DFM}

{ TfrmWebConfiguracao }

procedure TfrmWebConfiguracao.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmWebConfiguracao.FormCreate(Sender: TObject);
begin
  inherited;
  WebConfiguracao := TCtrlWebConfiguracao.Create;
  WebConfiguracao.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebRegra := TCtrlWebRegra.Create;
  WebRegra.InitializeAs( WebConfiguracao );

  //Cria o objeto de criptografia
  CMCrypto := TCMCrypto.Create;

  cdsEmpresaProp.Data := WebConfiguracao.LookupFundacao;

  WebConfiguracao.CdsWebConfiguracao := cdsWebConfiguracao;

  //Pendência 23402 - 26/02/2007 - Padrão 14
  MsgContexto := TCtrlMsgContexto.Create;
  MsgContexto.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  MsgContexto.CdsMsgContexto := cdsMsgContexto;

  CtrlEmailConexao := TCtrlEmailConexao.Create;
  CtrlEmailConexao.InitializeAs( MsgContexto );
  cdsEmailConexao.Data := CtrlEmailConexao.ListaConexoes;

  MsgPreDef := TCtrlMsgPreDef.Create;
  MsgPreDef.InitializeAs( MsgContexto );
  cdsMsgPreDef.Data := MsgContexto.ListaMsgPeloContexto( IdMsgContexto );
  //Fim Pendência 23402

  //Auto-Empréstimo
  sqlAutoEmprestimo.Open;
  gbAutoEmprestimo.Enabled := not cdsAutoEmprestimo.IsEmpty;
  gbAutoEmprestimo.Visible := not cdsAutoEmprestimo.IsEmpty;
  //Fim Auto-Emprestimo

  Carrega;
end;

procedure TfrmWebConfiguracao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Carrega;
end;

procedure TfrmWebConfiguracao.FormDestroy(Sender: TObject);
begin
  CMCrypto.Free;
  WebConfiguracao.Free;
  WebRegra.Free;

  //Pendência 23402 - 26/02/2007 - Padrão 14
  MsgContexto.Free;
  CtrlEmailConexao.Free;
  //Fim Pendência 23402

  inherited;
end;

procedure TfrmWebConfiguracao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if updSenhaMin.Position > updSenhaMax.Position then
  begin
    ShowMessage( 'O tamanho mínimo da senha deve ser menor que o tamanho máximo.' );
    exit;
  end;

  if cdsWebConfiguracaoLOGINMASTER.AsString <> '' then
  begin
    if edtSenhaMaster.Text = '' then
    begin
      ShowMessage( 'Se o login master for especificado, a senha master também deve ser.' );
      exit;
    end;
  end;

  if edtSenhaMaster.Text <> '' then
  begin
    if cdsWebConfiguracaoLOGINMASTER.AsString = '' then
    begin
      ShowMessage( 'Se a senha master for especificado, o login master também deve ser.' );
      exit;
    end;
  end;

  // Auto-Empréstimo - 22/08/2007
  if cdsWebConfiguracaoLOGINAUTOEMP.AsString <> '' then
  begin
    if edtSenhaAutoEmp.Text = '' then
    begin
      ShowMessage( 'Se o login para o Auto-Empréstimo for especificado, a senha do Auto-Empréstimo também deve ser.' );
      exit;
    end;
  end;

  if edtSenhaAutoEmp.Text <> '' then
  begin
    if cdsWebConfiguracaoLOGINAUTOEMP.AsString = '' then
    begin
      ShowMessage( 'Se a senha para o Auto-Empréstimo for especificado, o login do Auto-Empréstimo também deve ser.' );
      exit;
    end;
  end;
  // Fim - Auto-Empréstimo

  if cdsWebConfiguracao.IsEmpty then
    cdsWebConfiguracao.Insert
  else
    cdsWebConfiguracao.Edit;

  cdsWebConfiguracaoSENHAMIN.AsInteger := updSenhaMin.Position;
  cdsWebConfiguracaoSENHAMAX.AsInteger := updSenhaMax.Position;
  if edtNumSenhaBlq.Text = '' then updNumSenhaBlq.Position := 0;
  cdsWebConfiguracaoNUMSENHABLQ.AsInteger := updNumSenhaBlq.Position;

  cdsWebConfiguracaoSENHAMASTER.AsString := edtSenhaMaster.Text;

  if   ( cdsWebConfiguracaoSENHACRIPTO.AsString = 'S' )
   and ( cdsWebConfiguracaoSENHAMASTER.AsString <> '' ) then
    cdsWebConfiguracaoSENHAMASTER.AsString := trim( CMCrypto.CMEncryptStr(
     StrPadRight( cdsWebConfiguracaoSENHAMASTER.AsString, 20, ' '),
     '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

  // Auto-Empréstimo - 22/08/2007
  cdsWebConfiguracaoSENHAAUTOEMP.AsString := edtSenhaAutoEmp.Text;

  if   ( cdsWebConfiguracaoSENHACRIPTO.AsString = 'S' )
   and ( cdsWebConfiguracaoSENHAAUTOEMP.AsString <> '' ) then
    cdsWebConfiguracaoSENHAAUTOEMP.AsString := trim( CMCrypto.CMEncryptStr(
     StrPadRight( cdsWebConfiguracaoSENHAAUTOEMP.AsString, 20, ' '),
     '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );
  // Fim - Auto-Empréstimo


  cdsWebConfiguracao.Post;

  //Pendência 23402 - 26/02/2007 - Padrão 14
  if ( cdsMsgContexto.State in [dsInsert, dsEdit] ) then
     cdsMsgContexto.Post;

  if WebConfiguracao.GravaWebConfiguracao then
     if MsgContexto.GravaMsgContexto then
  begin
    ShowMessage('Configuração salva com sucesso.');
    cdsWebConfiguracao.Close;
        cdsMsgContexto.Close;
    Carrega;
  end;
  //Fim Pendência 23402
end;


procedure TfrmWebConfiguracao.Carrega;
begin
  CdsWebConfiguracao.Close;
  CdsWebConfiguracao.Data := WebConfiguracao.SelecionaWebConfiguracao;

  if CdsWebConfiguracao.IsEmpty then
    exit;

  updSenhaMin.Position := StrToIntDef( cdsWebConfiguracaoSENHAMIN.AsString, 0 );
  updSenhaMin.Refresh;
  edtSenhaMin.Text := cdsWebConfiguracaoSENHAMIN.AsString;

  updSenhaMax.Position := StrToIntDef( cdsWebConfiguracaoSENHAMAX.AsString, 0 );
  updSenhaMax.Refresh;
  edtSenhaMax.Text := cdsWebConfiguracaoSENHAMAX.AsString;

  updNumSenhaBlq.Position := StrToIntDef( cdsWebConfiguracaoNUMSENHABLQ.AsString, 0 );
  updNumSenhaBlq.Refresh;
  edtNumSenhaBlq.Text := cdsWebConfiguracaoNUMSENHABLQ.AsString;

  edtSenhaMaster.Text := cdsWebConfiguracaoSENHAMASTER.AsString;

  // Auto-Emprestimo - 22/08/2007
  edtSenhaAutoEmp.Text := cdsWebConfiguracaoSENHAAUTOEMP.AsString;
  // Auto-Emprestimo - Fim

  edtNOMEREGRA.Clear;
  edtRegraLogin.Clear;

  if cdsWebConfiguracaoREGRANOVOUSU.AsInteger > 0 then
  begin
    edtNOMEREGRA.Text := '[' + cdsWebConfiguracaoREGRANOVOUSU.AsString +
     ']  ' + WebRegra.NomeRegra( cdsWebConfiguracaoREGRANOVOUSU.AsInteger );
  end;

  if cdsWebConfiguracaoREGRALOGIN.AsInteger > 0 then
  begin
    edtRegraLogin.Text := '[' + cdsWebConfiguracaoREGRALOGIN.AsString +
     ']  ' + WebRegra.NomeRegra( cdsWebConfiguracaoREGRALOGIN.AsInteger );
  end;

  if   ( cdsWebConfiguracaoSENHACRIPTO.AsString = 'S' )
   and ( edtSenhaMaster.Text <> '' ) then
    edtSenhaMaster.Text := trim( CMCrypto.CMDecryptStr(
     StrPadRight( edtSenhaMaster.Text, 20, ' '),
     '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

  // Auto-Emprestimo - 22/08/2007
  if   ( cdsWebConfiguracaoSENHACRIPTO.AsString = 'S' )
   and ( edtSenhaAutoEmp.Text <> '' ) then
    edtSenhaAutoEmp.Text := trim( CMCrypto.CMDecryptStr(
     StrPadRight( edtSenhaAutoEmp.Text, 20, ' '),
     '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );
  // Auto-Emprestimo - Fim


  //Pendência 23402 - 26/02/2007 - Padrão 14
  if cdsWebConfiguracaoFLGENVIOSENHA.AsString = '' then
  begin
     cdsWebConfiguracao.Edit;
     cdsWebConfiguracaoFLGENVIOSENHA.AsString := 'L';
  end;

  CdsMsgContexto.Close;
  CdsMsgContexto.Data := MsgContexto.SelecionaMsgContexto(IdMsgContexto);
  //Fim Pendência 23402

end;

procedure TfrmWebConfiguracao.edtSenhaMinKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmWebConfiguracao.edtSenhaMaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmWebConfiguracao.edtSenhaMinExit(Sender: TObject);
begin
  inherited;
  if StrToIntDef( edtSenhaMin.Text, 0 ) < updSenhaMin.Min then
    edtSenhaMin.Text := IntToStr( updSenhaMin.Min );

  if StrToIntDef( edtSenhaMin.Text, 0 ) > updSenhaMin.Max then
    edtSenhaMin.Text := IntToStr( updSenhaMin.Max );
end;

procedure TfrmWebConfiguracao.edtSenhaMaxExit(Sender: TObject);
begin
  inherited;
  if StrToIntDef( edtSenhaMax.Text, 0 ) < updSenhaMax.Min then
    edtSenhaMax.Text := IntToStr( updSenhaMax.Min );

  if StrToIntDef( edtSenhaMax.Text, 0 ) > updSenhaMax.Max then
    edtSenhaMax.Text := IntToStr( updSenhaMax.Max );
end;

procedure TfrmWebConfiguracao.edtNumSenhaBlqExit(Sender: TObject);
begin
  inherited;
  if StrToIntDef( edtNumSenhaBlq.Text, 0 ) < updNumSenhaBlq.Min then
    edtNumSenhaBlq.Text := IntToStr( updNumSenhaBlq.Min );

  if StrToIntDef( edtNumSenhaBlq.Text, 0 ) > updNumSenhaBlq.Max then
    edtNumSenhaBlq.Text := IntToStr( updNumSenhaBlq.Max );
end;

procedure TfrmWebConfiguracao.edtNumSenhaBlqKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmWebConfiguracao.spbRegraClick(Sender: TObject);
begin
  inherited;
  if not ( cdsWebConfiguracao.State in [dsInsert, dsEdit] ) then
    cdsWebConfiguracao.Edit;

  msRegra.Executar;
  if msRegra.RetornouValor then
  begin
    cdsWebConfiguracao.FieldByName('REGRANOVOUSU').AsString := msRegra.ValoresChave[0];
    edtNOMEREGRA.Text := '[' + msRegra.ValoresChave[0] + ']  ' + msRegra.ValoresChave[1];
  end;
end;

procedure TfrmWebConfiguracao.spbLimpaClick(Sender: TObject);
begin
  inherited;
  if not ( cdsWebConfiguracao.State in [dsInsert, dsEdit] ) then
    cdsWebConfiguracao.Edit;

  cdsWebConfiguracao.FieldByName('REGRANOVOUSU').Clear;
  edtNOMEREGRA.Clear;
end;

procedure TfrmWebConfiguracao.spbLimpaRegraLoginClick(Sender: TObject);
begin
  inherited;
  if not ( cdsWebConfiguracao.State in [dsInsert, dsEdit] ) then
    cdsWebConfiguracao.Edit;

  cdsWebConfiguracao.FieldByName('REGRALOGIN').Clear;
  edtRegraLogin.Clear;
end;

procedure TfrmWebConfiguracao.spbRegraLoginClick(Sender: TObject);
begin
  inherited;
  if not ( cdsWebConfiguracao.State in [dsInsert, dsEdit] ) then
    cdsWebConfiguracao.Edit;

  msRegra.Executar;
  if msRegra.RetornouValor then
  begin
    cdsWebConfiguracao.FieldByName('REGRALOGIN').AsString := msRegra.ValoresChave[0];
    edtRegraLogin.Text := '[' + msRegra.ValoresChave[0] + ']  ' + msRegra.ValoresChave[1];
  end;
end;

//Pendência 23402 - 26/02/2007 - Padrão 14
procedure TfrmWebConfiguracao.rgrEnvioChange(Sender: TObject);
begin
  inherited;

  grpMsgContexto.Visible := (rgrEnvio.ItemIndex = 1);

end;

procedure TfrmWebConfiguracao.Button1Click(Sender: TObject);
var
  Mensagens : TCtrlMensagens;
begin
  inherited;

  Mensagens := TCtrlMensagens.Create;
  Mensagens.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  Mensagens.ConfiguraServidorPeloRegistro( 40 );
  Mensagens.EnviaEMail( 'ascarvalho@cmsolucoes.com.br', 'teste', 'e-mail com senha' );

  Mensagens.free;
end;
//Fim Pendência 23402 

end.
