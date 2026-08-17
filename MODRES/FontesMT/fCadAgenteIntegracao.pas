//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da funcionalidade.
//Responsável: Felipe A. Santos
//Descrição: criação da funcionalidade.
//******************************************************************************

unit fCadAgenteIntegracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, TB97Ctls, Mask, wwdbedit,
  Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo, TB97Tlwn, uCMTypes;

type
  TfrmCadAgenteIntregracao = class(TFrmPessoaMT)
    dbedCodMunicipio: TwwDBEdit;
    lblCodMunicipio: TLabel;
    dbedUF: TwwDBEdit;
    lblUF: TLabel;
    dblkpTpLogradouro: TwwDBLookupCombo;
    lblTpLogradouro: TLabel;
    CdsTpLogradouro: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEDNUMEROKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function VerificaPreenchimento : boolean;
    function VerificaPreenchimentoEndereco : boolean;
    function VerificaPreenchimentoTel : boolean;
    function VerificaPreenchimentoContato : boolean;
    function VerificaFkEstagiario: boolean;
  protected
    procedure SelSubTipo(IdPessoa: Double);override;
  public
    { Public declarations }
  end;

var
  frmCadAgenteIntregracao: TfrmCadAgenteIntregracao;
const  IHELP = 730112;      //William Santana - SOL 229871.16137 - PPM 407073
implementation

uses uCtrlPadroes, UMensErro, uCtrlPessoaAgenteInt;

{$R *.DFM}

procedure TfrmCadAgenteIntregracao.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaAgenteInt.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stAgenteInt;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := False;
  Pessoa.FormCaption := Self.Caption;

  inherited;

  CdsTpLogradouro.Data := Pessoa.ListTipoLogradouro;
end;

function TfrmCadAgenteIntregracao.VerificaPreenchimento: boolean;
begin
  Result := False;

  if Trim(dbedDocumento.Text) = '' then
  begin
     MsgDlg('Preencha o campo CNPJ', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
     dbedDocumento.SetFocus;
     Exit;
  end
  else if Trim(dbedNomeFantasia.Text) = '' then
  begin
     MsgDlg('Preencha o campo Nome', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
     dbedNomeFantasia.SetFocus;
     Exit;
  end
  else if Trim(dbedemail.Text) = '' then
   begin
      MsgDlg('Preencha o campo E-mail', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedemail.SetFocus;
      Exit
   end
   else if Trim(DbeHomePage_Padrao.Text) = '' then
   begin
      MsgDlg('Preencha o campo Home Page', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      DbeHomePage_Padrao.SetFocus;
      Exit
   end
   else if Trim(dbedRazaoSocial.Text) = '' then
   begin
      MsgDlg('Preencha o campo Razão Social', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      DbeHomePage_Padrao.SetFocus;
      Exit
   end;

  Result := True;
end;

procedure TfrmCadAgenteIntregracao.SelSubTipo(IdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaAgenteInt(Pessoa).ListAgenteInt(IdPessoa);
end;

procedure TfrmCadAgenteIntregracao.bbtnConfirmarClick(Sender: TObject);
begin
  if not VerificaPreenchimento then
     Exit;

  inherited;

end;

procedure TfrmCadAgenteIntregracao.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    if not VerificaPreenchimentoEndereco then
       Exit;

    CdsEnderecoTIPOLOGRADOURO.AsString := dblkpTpLogradouro.Text;
  end
  else if (pgctrlDetalhe.ActivePage = tbsTelefone) then
  begin
    if not(VerificaPreenchimentoTel) then
       Exit;
  end
  else if (pgctrlDetalhe.ActivePage = tbsContato) then
  begin
    if not(VerificaPreenchimentoContato) then
       Exit;
  end;
     
  inherited;

end;

function TfrmCadAgenteIntregracao.VerificaPreenchimentoEndereco: boolean;
var
   i : Integer;
   bTipoEnd : Boolean;
begin
   Result := False;

   if (Trim(dbedNomeEndereco.Text) = '') then
   begin
      MsgDlg('Preencha o campo Local', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedNomeEndereco.SetFocus;
      Exit;
   end
   else if (dblkpTpLogradouro.Text = '') then
   begin
      MsgDlg('Preencha o campo Tipo de Logradouro', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dblkpTpLogradouro.SetFocus;
      Exit;
   end
   else if (Trim(dbedLogradouro.Text) = '') then
   begin
      MsgDlg('Preencha o campo Logradouro', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedLogradouro.SetFocus;
      Exit;
   end
   else if (Trim(DBNUMERO.Text) = '') then
   begin
      MsgDlg('Preencha o campo Número', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      DBNUMERO.SetFocus;
      Exit;
   end
   else if (Trim(DBEDCOMPLEMENTO.Text) = '') then
   begin
      MsgDlg('Preencha o campo Complemento', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      DBEDCOMPLEMENTO.SetFocus;
      Exit;
   end
   else if (Trim(dbedBairro.Text) = '') then
   begin
      MsgDlg('Preencha o campo Bairro', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedBairro.SetFocus;
      Exit;
   end
   else if (Trim(dbedCEP.Text) = '') then
   begin
      MsgDlg('Preencha o campo CEP', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedCEP.SetFocus;
      Exit;
   end
   else if (Trim(CmpCidades.Text) = '') then
   begin
      MsgDlg('Preencha o campo Cidade', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      CmpCidades.SetFocus;
      Exit;
   end
   else if (Trim(dbedEstado.Text) = '') then
   begin
      MsgDlg('Preencha o campo Estado', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      Exit;
   end
   else if (Trim(dbedCodMunicipio.Text) = '') then
   begin
      MsgDlg('Preencha o campo Código do Município', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedCodMunicipio.SetFocus;
      Exit;
   end
   else if (Trim(dbedUF.Text) = '') then
   begin
      MsgDlg('Preencha o campo UF', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedUF.SetFocus;
      Exit;
   end
   else if (Trim(dbedPais.Text) = '') then
   begin
      MsgDlg('Preencha o campo País', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      dbedPais.SetFocus;
      Exit;
   end;

   bTipoEnd := False;

   for i := 0 to chkTipoEndereco.Items.Count - 1 do
   begin
      if chkTipoEndereco.Checked[i] then
      begin
         bTipoEnd := True;
         Break;
      end;
   end;

   if not(bTipoEnd) then
   begin
      MsgDlg('Preencha o campo Tipo de Endereço', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
      chkTipoEndereco.SetFocus;
      Exit;
   end;

   Result := True;
end;

function TfrmCadAgenteIntregracao.VerificaPreenchimentoTel: boolean;
var
   i : integer;
   bTipoTel : boolean;
begin
  Result := False;

  if Trim(DBEDDDI.Text) = '' then
  begin
    MsgDlg('Preencha o DDI do Telefone', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    DBEDDDI.SetFocus;
    Exit;
  end
  else if Trim(DBEDDDD.Text) = '' then
  begin
    MsgDlg('Preencha o DDD do Telefone', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    DBEDDDD.SetFocus;
    Exit;
  end
  else if Trim(DBEDNUMERO.Text) = '' then
  begin
    MsgDlg('Preencha o número do Telefone', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    DBEDNUMERO.SetFocus;
    Exit;
  end;

  bTipoTel := False;

  for i := 0 to chkTipoTelefone.Items.Count - 1 do
  begin
    if chkTipoTelefone.Checked[i] then
    begin
      bTipoTel := True;
      Break;
    end;
  end;

  if not(bTipoTel) then
  begin
    MsgDlg('Preencha o Tipo de Telefone', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    chkTipoTelefone.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TfrmCadAgenteIntregracao.VerificaPreenchimentoContato: boolean;
begin
  Result := False;

  if Trim(dbedContatoNome.Text) = '' then
  begin
    MsgDlg('Preencha o Nome do Contato', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    dbedContatoNome.SetFocus;
    Exit;
  end
  else if Trim(dbedcontatoemail.Text) = '' then
  begin
    MsgDlg('Preencha o E-mail do Contato', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    dbedcontatoemail.SetFocus;
    Exit;
  end
  else if Trim(EdtCargo_Padrao.Text) = '' then
  begin
    MsgDlg('Preencha o Cargo do Contato', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    EdtCargo_Padrao.SetFocus;
    Exit;
  end
  else if EdtDataNascimento_Padrao.Date = 0 then
  begin
    MsgDlg('Preencha a Data de Nascimento do Contato', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    EdtDataNascimento_Padrao.SetFocus;
    Exit;
  end
  else if Trim(EdtSetor_Padrao.Text) = '' then
  begin
    MsgDlg('Preencha o Setor do Contato', 'Aviso', mtWarning, [mbOk, MbHelp], IHELP);
    EdtSetor_Padrao.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TfrmCadAgenteIntregracao.CmeCadastroDelete(Sender: TObject);
begin

  if (VerificaFkEstagiario) then
  begin
    MsgDlg('Não é possível excluir o Agente de Integração, pois está vinculada a um estagiário.', 'Erro', mtError, [mbOk, MbHelp], IHELP);
  end
  else
  inherited;

  SelPessoa(-1);
end;

procedure TfrmCadAgenteIntregracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  inherited;   
end;

// Willam Santana SOL 229871.16137 PPM 407073  - início
procedure TfrmCadAgenteIntregracao.DBEDNUMEROKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(key in ['0' .. '9', #8, #13]) then
    key := #0 ;
end;


function TfrmCadAgenteIntregracao.VerificaFkEstagiario : boolean;
var
  aCds: TClientDataSet;
begin
  result := false;
  aCds := TClientDataSet.Create(nil);
  aCds.Data := TCtrlPessoaAgenteInt(pessoa).VerificaEstagiario(MontaSelect.ValoresChave[0]);

  if not(aCds.isEmpty) then
  result := true;

  aCds.Free;
end;
// Willam Santana SOL 229871.16137 PPM 407073  - fim
end.
