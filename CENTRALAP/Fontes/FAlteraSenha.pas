unit FAlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, JClStrings, 
  uCmTypes, dBaseDados, uSistema, uCtrlWebAcesso, Db, DBClient,
  uCMClientDataSet, DBTables, CMDatabase, Wwdotdot, Mask, wwdbedit,
  MontaSelect, wwdblook, CMDBLookupCombo, CMProcura;

type
  TfrmAlteraSenha = class(TfrmOkCancelar)
    grpConteudo: TGroupBox;
    rbConteudoUnico: TRadioButton;
    rbConteudoDinamico: TRadioButton;
    edtPalavraSenha: TEdit;
    pnlCampo: TPanel;
    rbDtNasc: TRadioButton;
    rbMatricula: TRadioButton;
    cmbFormatoData: TComboBox;
    rbLogin: TRadioButton;
    cds: TCMClientDataSet;
    dbWeb: TCMDatabase;
    MsLogin: TMontaSelect;
    DbedtNOME: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBedtLogin: TwwDBEdit;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbConteudoUnicoClick(Sender: TObject);
    procedure rbConteudoDinamicoClick(Sender: TObject);
    procedure rbMatriculaClick(Sender: TObject);
    procedure rbDtNascClick(Sender: TObject);
    procedure rbLoginClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBedtLoginExit(Sender: TObject);
    procedure DBedtLoginChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    WebAcesso : TCtrlWebAcesso;
    IidPessoa : LongInt;
    sLoginPessoal : string;
    bCripto   : boolean;
    procedure MsgErro ( sMsg : String );
  public
    { Public declarations }
  end;

var
  frmAlteraSenha: TfrmAlteraSenha;

implementation

{$R *.DFM}

procedure TfrmAlteraSenha.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmAlteraSenha.FormCreate(Sender: TObject);
var
  WebAcessoSistema : TCtrlWebAcesso;

  sWEBLOGIN,
  sWEBSENHA,
  sWEBBASE : string;

begin
  inherited;

  WebAcessoSistema := TCtrlWebAcesso.Create;
  try

    //Cria, inicializa e conecta CtrlObject ao DB do sistema
    WebAcessoSistema.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
     Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

    //Recupera parâmetros da Central
    cds.Close;
    cds.Data  := WebAcessoSistema.RecuperaAcessoCentral;

    sWEBLOGIN := cds.FieldByName('WEBLOGIN').asString;
    sWEBSENHA := cds.FieldByName('WEBSENHA').asString;
    sWEBBASE  := cds.FieldByName('WEBBASE').asString;

    cds.Close;

  finally
    WebAcessoSistema.Free;
  end;

  // lê os parâmeros do CentralAP na tabela ParamCentralAP
  DbWeb.Params.Values['USER NAME']   := sWEBLOGIN;
  DbWeb.Params.Values['PASSWORD']    := sWEBSENHA;
  DbWeb.Params.Values['SERVER NAME'] := sWEBBASE;
  DbWeb.Connected := true;


  //Cria, inicializa e conecta CtrlObject ao DB da web
  WebAcesso     := TCtrlWebAcesso.Create;
  WebAcesso.Initialize( dbWeb, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  cds.Close;
  cds.Data := webAcesso.DadosWebConfiguracao;
  bCripto  := ( cds.fieldByName('senhaCripto').asString = 'S' );
  cds.Close;

end;

procedure TfrmAlteraSenha.bbtnConfirmarClick(Sender: TObject);

var
  sSenha : String;
  dData : TDateTime;
  bOk : Boolean;
begin
  inherited;

  bOk := False;
  sSenha := '';

  if rbConteudoUnico.Checked then //Conteúdo único
  begin

    //Se a palavra não foi preenchida...
    if trim( edtPalavraSenha.Text ) = '' then
    begin
      ShowMessage('Infome a senha a preencher.');
      edtPalavraSenha.SetFocus;
      exit;
    end;

    sSenha := trim( edtPalavraSenha.Text );

  end
  else //Campo
  begin

    if rbMatricula.Checked then //Matricula
      sSenha := trim( WebAcesso.RecuperaMatricula( iIdPessoa ) )
    else
      if rbLogin.Checked then   //Login
        sSenha := sLoginPessoal
      else //Data de nascimento
      begin
        //Se o formato não foi informado...
        if trim( cmbFormatoData.Text ) = '' then
        begin
          ShowMessage('Informe o formato da data de nascimento.');
          cmbFormatoData.SetFocus;
          exit;
        end;

        dData := WebAcesso.RecuperaDataNasc( iIdPessoa );

        //Se a data não for nula
        if dData > 0 then
        begin
          if cmbFormatoData.Text = 'DDMMAA' then
            sSenha := FormatDateTime( 'ddmmyy', dData )
          else
            sSenha := FormatDateTime( 'ddmmyyyy', dData );
        end;

      end;

  end;

  //Se não for vazio...
  if trim( sSenha ) <> '' then
    //Salva a senha
    bOk := WebAcesso.GravaSenha( iIdPessoa, sSenha, Sistema.IdUsuario , bCripto );

  if bOk then
    ShowMessage( 'Senha alterada com sucesso!' );

end;

procedure TfrmAlteraSenha.rbConteudoUnicoClick(Sender: TObject);
begin
  inherited;
  edtPalavraSenha.Enabled := True;
  pnlCampo.Enabled        := False;
  cmbFormatoData.Enabled     := False;
end;

procedure TfrmAlteraSenha.rbConteudoDinamicoClick(Sender: TObject);
begin
  inherited;
  edtPalavraSenha.Enabled := False;
  edtPalavraSenha.Text    := '';
  pnlCampo.Enabled        := True;

  cmbFormatoData.Enabled := rbDtNasc.Checked;
end;

procedure TfrmAlteraSenha.rbMatriculaClick(Sender: TObject);
begin
  inherited;
  cmbFormatoData.Enabled     := False;
end;

procedure TfrmAlteraSenha.rbDtNascClick(Sender: TObject);
begin
  inherited;
  cmbFormatoData.Enabled     := True;
end;

procedure TfrmAlteraSenha.rbLoginClick(Sender: TObject);
begin
  inherited;
  cmbFormatoData.Enabled     := False;
end;

procedure TfrmAlteraSenha.FormDestroy(Sender: TObject);
begin
  WebAcesso.Free;
  DbWeb.Connected := false;
  inherited;
end;

procedure TfrmAlteraSenha.DBedtLoginExit(Sender: TObject);
begin
  inherited;

  sLoginPessoal := trim( DBedtLogin.Text );

  if sLoginPessoal <> '' then
  begin
    cds.Close;
    cds.Data := WebAcesso.SelecionaDadosAA( sLoginPessoal );

    if not cds.IsEmpty then
    begin
      DbedtNOME.Text := cds.FieldByName('Nome').asString;
      IidPessoa := cds.FieldByName('idpessoa').asInteger;
      bbtnConfirmar.Enabled := True;
    end
    else
    begin
      ShowMessage('Login inexistente.');
      DbedtNOME.Text := '';
      bbtnConfirmar.Enabled := False;
      DBedtLogin.SetFocus;
    end;

    cds.Close;

  end
  else
  begin
    DbedtNOME.Text := '';
    bbtnConfirmar.Enabled := False;
  end;

end;

procedure TfrmAlteraSenha.DBedtLoginChange(Sender: TObject);
begin
  inherited;
  DbedtNOME.Text := '';
  bbtnConfirmar.Enabled := False;
end;

procedure TfrmAlteraSenha.BitBtn1Click(Sender: TObject);
begin
  inherited;
  msLogin.DataBaseName := 'dbWeb';
  msLogin.Executar;
  if msLogin.RetornouValor then
  begin
    iIdPessoa := strToIntDef(msLogin.ValoresChave[0], -1);
    dbEdtLogin.Text := msLogin.ValoresChave[1];
    dbEdtNome.Text := msLogin.ValoresChave[2];
    DBedtLoginExit(self);
  end;
  msLogin.DataBaseName := 'BaseDados';
end;

end.
