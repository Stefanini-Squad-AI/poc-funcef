//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da funcionalidade.
//Responsável: Felipe A. Santos
//Descrição: criação da funcionalidade.
//******************************************************************************

unit fCadInstituicaoEnsino;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, TB97Ctls, Mask, wwdbedit,
  Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo, TB97Tlwn, uCtrlPadroes, uCMTypes,
  uValidaDoc;

type
  TfrmCadInstituicaoEnsino = class(TFrmPessoaMT)
    lblUF: TLabel;
    lblTpLogradouro: TLabel;
    dbedUF: TwwDBEdit;
    dblkpTpLogradouro: TwwDBLookupCombo;
    dbedCodMunicipio: TwwDBEdit;
    lblCodMunicipio: TLabel;
    cdsTpLogradouro: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure DBNUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure lstDocumentosChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    function VerificaPreenchimento : boolean;
    function VerificaPreenchimentoEndereco : boolean;
    function VerificaPreenchimentoTel : boolean;
    function VerificaPreenchimentoContato : boolean;
    function VerificaFkEstagiario : boolean;
  protected
   procedure SelSubTipo(IdPessoa : Double); override;
  public
    { Public declarations }
  end;

var
  frmCadInstituicaoEnsino: TfrmCadInstituicaoEnsino;

const  IHELP = 730113;      //William Santana - SOL 229871.16137 - PPM 407073
implementation

uses uCtrlPessoaInsEnsino, UMensErro;

{$R *.DFM}

procedure TfrmCadInstituicaoEnsino.FormCreate(Sender: TObject);

begin
  Pessoa := TCtrlPessoaInsEnsino.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stInstituicaoEnsino;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;

  inherited;

  cdsTpLogradouro.Data := Pessoa.ListTipoLogradouro;
  
end;

procedure TfrmCadInstituicaoEnsino.SelSubTipo(IdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaInsEnsino(Pessoa).ListInsEnsino(IdPessoa);
end;

procedure TfrmCadInstituicaoEnsino.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  inherited;

end;

procedure TfrmCadInstituicaoEnsino.bbtnConfirmarClick(Sender: TObject);
begin
  if not (VerificaPreenchimento) then
     Exit;

  inherited;

end;

function TfrmCadInstituicaoEnsino.VerificaPreenchimento: boolean;
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

procedure TfrmCadInstituicaoEnsino.bbtnOkDetClick(Sender: TObject);
begin

  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    if not VerificaPreenchimentoEndereco then
       Exit;

    cdsEndereco.FieldByName('TIPOLOGRADOURO').AsString := dblkpTpLogradouro.Text;
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

function TfrmCadInstituicaoEnsino.VerificaPreenchimentoEndereco: boolean;
var
   i : Integer;
   bTipoEnd : Boolean;
begin
   Result := False;

   if (Trim(dbedNomeEndereco.Text) = '') then
   begin
      MsgDlg('Preencha o campo Local', 'Aviso', mtWarning, [mbOK, mbHelp],IHELP);
      dbedNomeEndereco.SetFocus;
      Exit;
   end
   else if (dblkpTpLogradouro.Text = '') then
   begin
      MsgDlg('Preencha o campo Tipo de Logradouro', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      dblkpTpLogradouro.SetFocus;
      Exit;
   end
   else if (Trim(dbedLogradouro.Text) = '') then
   begin
      MsgDlg('Preencha o campo Logradouro', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      dbedLogradouro.SetFocus;
      Exit;
   end
   else if (Trim(DBNUMERO.Text) = '') then
   begin
      MsgDlg('Preencha o campo Número', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      DBNUMERO.SetFocus;
      Exit;
   end
   else if (Trim(DBEDCOMPLEMENTO.Text) = '') then
   begin
     MsgDlg('Preencha o campo Complemento', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      DBEDCOMPLEMENTO.SetFocus;
      Exit;
   end
   else if (Trim(dbedBairro.Text) = '') then
   begin
      MsgDlg('Preencha o campo Bairro', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      dbedBairro.SetFocus;
      Exit;
   end
   else if (Trim(dbedCEP.Text) = '') then
   begin
      MsgDlg('Preencha o campo CEP', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      dbedCEP.SetFocus;
      Exit;
   end
   else if (Trim(CmpCidades.Text) = '') then
   begin
      MsgDlg('Preencha o campo Cidade', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      CmpCidades.SetFocus;
      Exit;
   end
   else if (Trim(dbedEstado.Text) = '') then
   begin
      MsgDlg('Preencha o campo Estado', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      Exit;
   end
   else if (Trim(dbedCodMunicipio.Text) = '') then
   begin
      MsgDlg('Preencha o campo Código do Município', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      dbedCodMunicipio.SetFocus;
      Exit;
   end
   else if (Trim(dbedUF.Text) = '') then
   begin
      MsgDlg('Preencha o campo UF', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      dbedUF.SetFocus;
      Exit;
   end
   else if (Trim(dbedPais.Text) = '') then
   begin
      MsgDlg('Preencha o campo País', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
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
      MsgDlg('Preencha o campo Tipo de Endereço', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
      chkTipoEndereco.SetFocus;
      Exit;
   end;

   Result := True;
end;

function TfrmCadInstituicaoEnsino.VerificaPreenchimentoTel: boolean;
var
   i : integer;
   bTipoTel : boolean;
begin
  Result := False;

  if Trim(DBEDDDI.Text) = '' then
  begin
    MsgDlg('Preencha o DDI do Telefone', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    DBEDDDI.SetFocus;
    Exit;
  end
  else if Trim(DBEDDDD.Text) = '' then
  begin
    MsgDlg('Preencha o DDD do Telefone', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    DBEDDDD.SetFocus;
    Exit;
  end
  else if Trim(DBEDNUMERO.Text) = '' then
  begin
    MsgDlg('Preencha o número do Telefone', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
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
    MsgDlg('Preencha o Tipo de Telefone', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    chkTipoTelefone.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TfrmCadInstituicaoEnsino.VerificaPreenchimentoContato: boolean;
begin
  Result := False;

  if Trim(dbedContatoNome.Text) = '' then
  begin
    MsgDlg('Preencha o Nome do Contato', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    dbedContatoNome.SetFocus;
    Exit;
  end
  else if Trim(dbedcontatoemail.Text) = '' then
  begin
    MsgDlg('Preencha o E-mail do Contato', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    dbedcontatoemail.SetFocus;
    Exit;
  end
  else if Trim(EdtCargo_Padrao.Text) = '' then
  begin
    MsgDlg('Preencha o Cargo do Contato', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    EdtCargo_Padrao.SetFocus;
    Exit;
  end
  else if EdtDataNascimento_Padrao.Date = 0 then
  begin
    MsgDlg('Preencha a Data de Nascimento do Contato', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    EdtDataNascimento_Padrao.SetFocus;
    Exit;
  end
  else if Trim(EdtSetor_Padrao.Text) = '' then
  begin
    MsgDlg('Preencha o Setor do Contato', 'Aviso', mtWarning, [mbOk, mbHelp], IHELP);
    EdtSetor_Padrao.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TfrmCadInstituicaoEnsino.CmeCadastroDelete(Sender: TObject);
begin

  if (VerificaFkEstagiario) then
  begin
    MsgDlg('Não é possível excluir a Instituição de Ensino, pois está vinculada a um estagiário.', 'Erro', mtError, [mbOk, MbHelp], IHELP);
  end
  else
  inherited;
  
  SelPessoa(-1);
end;

//Início - Willam Santana SOL 229871.16137 PPM 407073
procedure TfrmCadInstituicaoEnsino.DBNUMEROKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(key in ['0' .. '9', #8, #13]) then
    key := #0 ;
end;

procedure TfrmCadInstituicaoEnsino.lstDocumentosChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  inherited;        
end;        
 {
procedure TfrmCadInstituicaoEnsino.mudamascara;
  var
  sText, sNumDocumentoAntigo, sMask: String;
  iQtdMask: Integer ;
begin
  inherited;
  sNumDocumentoAntigo := CdsDocumento.FieldByName('NUMDOCUMENTO').asString;
 // CdsDocumento.FieldByname('NUMDOCUMENTO').clear;
  sMask := CdsDocumento.FieldByName('NUMDOCUMENTO').EditMask;
  iQtdMask := Length(SoNumero(sMask)) - 1;
  CdsDocumento.FieldByName('NUMDOCUMENTO').asString := Copy(sNumDocumentoAntigo,1,iQtdMask);
  edDocNumDocumentoExit(self);
end;
}


function TfrmCadInstituicaoEnsino.VerificaFkEstagiario : boolean;
var
  aCds: TClientDataSet;
begin
  result := false;
  aCds := TClientDataSet.Create(nil);
  aCds.Data := TCtrlPessoaInsEnsino(pessoa).VerificaEstagiario(MontaSelect.ValoresChave[0]);

  if not(aCds.isEmpty) then
  result := true;

  aCds.Free;
end;
//Término -  Willam Santana SOL 229871.16137 PPM 407073

end.
