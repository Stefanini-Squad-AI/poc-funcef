unit FCadWebAcesso;

// Alterações:
{
--------------------------------------------------------------------------------
Pendência   : SOL 161750 Kintana 1367563
Responsável : Fanuel Junior
Data        : 21/07/2011
Descrição   : Ajustar o update da senha e a apresentação da tela
--------------------------------------------------------------------------------
Pendência   : SOL 160725 KINTANA 1351353
Responsável : Fernando Xavier
Data        : 04/07/2011
Descrição   : Alteração na query do montaselect para solucionar Duplicação de
              resultados devido a erro no filtro da matrícula e joins da query
--------------------------------------------------------------------------------
Pendência   : SOL 149422 KINTANA 1070888
Responsável : BRUNO AZEVEDO
Data        : 23/12/2010
Descrição   : Selecionar a pessoa pelo IdTitular.
--------------------------------------------------------------------------------
Pendência   : SOL 148511 KINTANA 1044664
Responsável : Fanuel Junior
Data        : 02/12/2010
Descrição   : Adicionar o campo WEBACESSO.IDTITULAR para passar o filtro de
              login-pessoa corretamente
--------------------------------------------------------------------------------
Pendência   : SOL 146890 KINTANA 1007252
Responsável : BRUNO AZEVEDO
Data        : 03/11/2010
Descrição   : Correção na alteração de senhas passando o IdTitular.
--------------------------------------------------------------------------------
Rotina    : MsLogin
Data      : 08/02/2007
Pendência : 24065
Descrição : Alterada forma de identificação de titular/dependente na coluna
            Tipo de Matrícula
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBClient, uCMClientDataSet, StdCtrls, Mask,
  DBCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, uCtrlWebAcesso, dBaseDados, uSistema, uCmSqlParams, wwdbedit,
  MontaSelect, ComCtrls, uGeraSenha, uCmTypes, DBTables;

type
  TfrmCadWebAcesso = class(TfrmOkCancelar)
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    CdsIDPESSOA: TFloatField;
    CdsLOGINPESSOAL: TStringField;
    CdsSENHAPESSOAL: TStringField;
    CdsDTALTERA: TDateTimeField;
    CdsIDUSUARIO: TFloatField;
    cdsWebConfig: TCMClientDataSet;
    cdsWebConfigSENHACRIPTO: TStringField;
    btnExclui: TBitBtn;
    CdsFLGSTATUS: TFloatField;
    CdsNUMTENTACESS: TFloatField;
    MsLogin: TMontaSelect;
    pnlTop: TPanel;
    grpUsuario: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBedtLogin: TwwDBEdit;
    DbedtNOME: TwwDBEdit;
    btnProcurar: TBitBtn;
    pnlBottom: TPanel;
    Login: TGroupBox;
    rbMatricLogin: TRadioButton;
    rbInscLogin: TRadioButton;
    rbOutro: TRadioButton;
    edtConteudo: TEdit;
    grpStatus: TRadioGroup;
    PageControl: TPageControl;
    tbsDefinido: TTabSheet;
    tbsAleatorio: TTabSheet;
    grpCompoSenha: TGroupBox;
    lblNumMin: TLabel;
    lblNumMax: TLabel;
    edtNumMin: TEdit;
    edtNumMax: TEdit;
    cbMaiusculas: TCheckBox;
    cbComecaComChar: TCheckBox;
    rgbTipoSenha: TRadioGroup;
    Senha: TGroupBox;
    rbConteudoUnico: TRadioButton;
    rbConteudoDinamico: TRadioButton;
    pnlCampo: TPanel;
    rbDtNasc: TRadioButton;
    rbMatricula: TRadioButton;
    cmbFormatoData: TComboBox;
    rbLogin: TRadioButton;
    edtSenha: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rbConteudoUnicoClick(Sender: TObject);
    procedure rbConteudoDinamicoClick(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbDtNascClick(Sender: TObject);
    procedure rbMatriculaClick(Sender: TObject);
    procedure rbLoginClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure rbOutroClick(Sender: TObject);
    procedure rbInscLoginClick(Sender: TObject);
    procedure rbMatricLoginClick(Sender: TObject);
    procedure edtNumMinKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumMaxKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    bCripTografada, bAlteraSenha, bExiste : Boolean;
    CtrlWebAcesso : TCtrlWebAcesso;
    FUsuarioSelecionado: boolean;
    procedure MsgErro(Msg: String);
    procedure SetUsuarioSelecionado(const Value: boolean);
  public
    IdPessoa : Integer;
    IdTitular : Integer; //BRUNO AZEVEDO SOL 146890 KINTANA 1007252

    procedure SelecionaPessoa;
    procedure Limpar;

    property UsuarioSelecionado : boolean read FUsuarioSelecionado write SetUsuarioSelecionado;
  end;


var
  frmCadWebAcesso: TfrmCadWebAcesso;



implementation

{$R *.DFM}

procedure TfrmCadWebAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlWebAcesso := TCtrlWebAcesso.Create;
  CtrlWebAcesso.Initialize( DtmBaseDados.DbBaseDados, True, cntBDE,
                            cnsServer, Sistema.AppRemoteServer, True, MsgErro );

  cdsWebConfig.Close;
  cdsWebConfig.Data := CtrlWebAcesso.DadosWebConfiguracao;
  bCripTografada    := cdsWebConfig.fieldByName('SENHACRIPTO').asString = 'S';

  Limpar;
end;

procedure TfrmCadWebAcesso.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlWebAcesso.Free;
end;

procedure TfrmCadWebAcesso.MsgErro(Msg: String);
begin
  ShowMessage(Msg);
end;

procedure TfrmCadWebAcesso.rbConteudoUnicoClick(Sender: TObject);
begin
  inherited;
  bAlteraSenha := true;
  cmbFormatoData.Enabled := ( rbDtNasc.Checked and rbConteudoDinamico.Checked );
  pnlCampo.Enabled := rbConteudoDinamico.Checked;
  edtSenha.Enabled := rbConteudoUnico.Checked;
end;

procedure TfrmCadWebAcesso.rbConteudoDinamicoClick(Sender: TObject);
begin
  inherited;
  cmbFormatoData.Enabled := ( rbDtNasc.Checked and rbConteudoDinamico.Checked );
  pnlCampo.Enabled := rbConteudoDinamico.Checked;
  edtSenha.Enabled := rbConteudoUnico.Checked;
end;

procedure TfrmCadWebAcesso.edtSenhaChange(Sender: TObject);
begin
  inherited;
  bAlteraSenha := true;
end;

procedure TfrmCadWebAcesso.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if (trim( edtConteudo.text) = '') and (rbOutro.Checked) then
  begin
    showMessage('Preencha o campo Login.');
    if edtConteudo.canFocus then edtConteudo.SetFocus;
    exit;
  end;

  if PageControl.ActivePage = tbsDefinido then
  begin
    if ( not bExiste ) and ( rbConteudoUnico.Checked ) and ( trim( edtSenha.text ) = '' ) then
    begin
      ShowMessage('Preencha o campo senha.');
      if edtSenha.CanFocus then edtSenha.SetFocus;
      exit;
    end;
  end
  else
  begin
    if ( trim( edtNumMin.text ) = '' ) then
    begin
      ShowMessage('Preencha o número mínimo de caracteres da senha.');
      if edtNumMin.CanFocus then edtNumMin.SetFocus;
      exit;
    end;
    if ( trim( edtNumMax.text ) = '' ) then
    begin
      ShowMessage('Preencha o número máximo de caracteres da senha.');
      if edtNumMax.CanFocus then edtNumMax.SetFocus;
      exit;
    end;
  end;


  if   ( PageControl.ActivePage = tbsDefinido )
   and ( trim( edtSenha.text )  = ''          )
   and ( rbConteudoUnico.Checked              ) then
    bAlteraSenha := False
  else
    if  PageControl.ActivePage = tbsAleatorio then
      bAlteraSenha := True;

  if rbMatricLogin.Checked then
    edtConteudo.Text := CtrlWebAcesso.RecuperaMatricula(IdPessoa)
  else if rbInscLogin.Checked then
    edtConteudo.text := CtrlWebAcesso.recuperaInscricao(IdPessoa);

  if PageControl.ActivePage = tbsDefinido then
  begin
    if rbConteudoDinamico.Checked then
    begin
      if rbMatricula.Checked then
        edtSenha.Text := CtrlWebAcesso.RecuperaMatricula(IdPessoa);
      if rbLogin.Checked then
        edtSenha.Text := edtConteudo.Text;

      if rbDtNasc.Checked then
      begin
        if trim(cmbFormatoData.text) = 'DDMMAA' then
          edtSenha.Text := FormatDateTime('DDMMYY', CtrlWebAcesso.RecuperaDataNasc(IdPessoa))
        else if trim(cmbFormatoData.text) = 'DDMMAAAA' then
          edtSenha.Text := FormatDateTime('DDMMYYYY', CtrlWebAcesso.RecuperaDataNasc(IdPessoa))
        else
        begin
          if cmbFormatoData.canFocus then cmbFormatoData.SetFocus;
          showMessage('Selecione um formato de data');
          exit;
        end;
      end;
    end;
  end
  else
  begin
    edtSenha.Text := GeraSenha(  StrToIntDef( edtNumMin.Text, 0 ),
                                 StrToIntDef( edtNumMax.Text, 0 ),
                                 cbMaiusculas.Checked,
                                 cbComecaComChar.Checked,
                                 rgbTipoSenha.ItemIndex + 1 );
  end;

  if CtrlWebAcesso.GravaLoginSenha( IdPessoa, sistema.IdUsuario,
                                edtConteudo.Text, edtSenha.text, '',
                                grpStatus.ItemIndex,
                                bCripTografada, bExiste, ((bAlteraSenha) or (not bExiste)), IdTitular ) then //BRUNO AZEVEDO SOL 146890 KINTANA 1007252
  begin
    bAlteraSenha := False;

    ShowMessage('Dados salvos com sucesso.');

    if FUsuarioSelecionado then
      Close
    else
      Limpar;
  end;
end;

procedure TfrmCadWebAcesso.rbDtNascClick(Sender: TObject);
begin
  inherited;
  bAlteraSenha := true;
  cmbFormatoData.Enabled := ( rbDtNasc.Checked and rbConteudoDinamico.Checked );
end;

procedure TfrmCadWebAcesso.rbMatriculaClick(Sender: TObject);
begin
  inherited;
  bAlteraSenha := true;
  cmbFormatoData.Enabled := ( rbDtNasc.Checked and rbConteudoDinamico.Checked );
end;

procedure TfrmCadWebAcesso.rbLoginClick(Sender: TObject);
begin
  inherited;
  bAlteraSenha := true;
  cmbFormatoData.Enabled := ( rbDtNasc.Checked and rbConteudoDinamico.Checked );
end;

procedure TfrmCadWebAcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if FUsuarioSelecionado then
    Close
  else
    Limpar;
end;

procedure TfrmCadWebAcesso.btnExcluiClick(Sender: TObject);
begin
  inherited;
  if MessageDlg( 'Confirma exclusão do acesso ao Auto-Atendimento deste participante?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CtrlWebAcesso.excluiAcesso(IdPessoa);
    Limpar;
    if UsuarioSelecionado then
      Close;
  end;
end;

procedure TfrmCadWebAcesso.btnProcurarClick(Sender: TObject);
begin
  inherited;
  //
  msLogin.CampoParaOrdenacao := 'C3';
  msLogin.OrderAscendente    := False;
  //
  msLogin.Executar;
  if msLogin.RetornouValor then
  begin
    IdPessoa        := StrToIntDef( msLogin.ValoresChave[0], -1 );
    dbEdtLogin.Text := msLogin.ValoresChave[1];
    dbEdtNome.Text  := msLogin.ValoresChave[2];
    IdTitular       := StrToIntDef( msLogin.ValoresChave[3], -1 ); //BRUNO AZEVEDO SOL 146890 KINTANA 1007252

    SelecionaPessoa;
  end;
end;
                                                   
procedure TfrmCadWebAcesso.SelecionaPessoa;
begin
  //BRUNO AZEVEDO SOL 149422 KINTANA 1070888
  cds.Close;
  cds.Data := CtrlWebAcesso.SelecionaWebAcesso( IdPessoa , IdTitular);

  edtConteudo.Text    := CdsLOGINPESSOAL.AsString;
  grpStatus.ItemIndex := CdsFLGSTATUS.AsInteger;

  bAlteraSenha      := false;
  bExiste           := ( not cds.IsEmpty );

  edtSenha.text := '';

  btnExclui.Enabled     := bExiste;
  bbtnConfirmar.Enabled := True;

  rbOutro.Checked;
  pnlBottom.Enabled     := True;
  btnProcurar.Enabled   := False;
end;

procedure TfrmCadWebAcesso.SetUsuarioSelecionado(const Value: boolean);
begin
  FUsuarioSelecionado := Value;

  pnlTop.Visible    := not FUsuarioSelecionado;
  bbtnSair.Visible  := not FUsuarioSelecionado;
  pnlBottom.Enabled := FUsuarioSelecionado;

  if FUsuarioSelecionado then
  begin
    Self.Height       := Self.Height - pnlTop.Height;
    bbtnConfirmar.Enabled := True;
  end;
end;

procedure TfrmCadWebAcesso.Limpar;
begin
  cds.Close;
  IdPessoa              := 0;
  IdTitular             := 0; //BRUNO AZEVEDO SOL 146890 KINTANA 1007252
  dbEdtLogin.Text       := '';
  dbEdtNome.Text        := '';
  edtConteudo.Text      := '';
  btnExclui.Enabled     := False;
  bbtnConfirmar.Enabled := False;
  rbOutro.Checked := True;
  rbOutroClick( Self );
  rbConteudoUnico.Checked := True;
  rbMatricula.Checked := True;
  rbConteudoUnicoClick( Self );
  edtSenha.Text         := '';
  cmbFormatoData.ItemIndex := -1;
  pnlBottom.Enabled     := False;
  btnProcurar.Enabled   := True;
  grpStatus.ItemIndex   := 0; 
end;

procedure TfrmCadWebAcesso.rbOutroClick(Sender: TObject);
begin
  inherited;
  edtConteudo.Enabled := rbOutro.Checked;
end;

procedure TfrmCadWebAcesso.rbInscLoginClick(Sender: TObject);
begin
  inherited;
  edtConteudo.Enabled := rbOutro.Checked;
end;

procedure TfrmCadWebAcesso.rbMatricLoginClick(Sender: TObject);
begin
  inherited;
  edtConteudo.Enabled := rbOutro.Checked;
end;

procedure TfrmCadWebAcesso.edtNumMinKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

procedure TfrmCadWebAcesso.edtNumMaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Pos( Key, '0123456789' ) = 0 ) and
   ( Ord( Key ) <> 8 ) then
    Key := Char(0);
end;

end.
