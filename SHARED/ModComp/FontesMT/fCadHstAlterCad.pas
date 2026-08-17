unit fCadHstAlterCad;
{ --------------------------------ALTERAÇÕES------------------------------------
***************************************************************************************
Nº SOL: 229874/16589
Nº PPM: 1235881
Data da Alteração: 19/02/2016
Alteração Form: ER141 - Alteração na aba de dados pessoais e dados titular
Responsável: Michelle Suellyn Mota
Descrição: Alteração somente no DFM - Título da Aba
**************************************************************************************
Rotina.............: ListHstAltPlanos
N. Sol.............:  183750 
N. Kintana.........: 1731771
Data...............: 26/11/2013
Responsável........: Felipe A. Santos
Descrição..........: Foi incluido uma nova aba de alterações de planos de sáude
                     e odontológicos
--------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  wwdbedit, wwdblook, DBCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio,
  IvMulti, IvEMulti, Db, Wwdatsrc, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Grids, fCadastroMestreDetMT, DBClient,
  uCMClientDataSet, Wwdotdot, Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker,
  CMDBLookupCombo, uCtrlHstAlterCad, uCtrlListTerceirosRH;

type
  TfrmCadHstAlterCad = class(TFrmCadastroMestreDetMT)
    CdsDet: TCMClientDataSet;
    CdsCodAltCad: TCMClientDataSet;
    tbshDemaisAlter: TTabSheet;
    pnlControlesDemaisAlter: TPanel;
    Label9: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    cmdbedDataAlt2: TCMDateTimePicker;
    mskedAlteracao: TMaskEdit;
    cmdbedAlteracao: TCMDateTimePicker;
    dbcmbAlteracao: TwwDBComboBox;
    cmbCampos: TComboBox;
    edCodigo: TEdit;
    dbgrdDemaisAlter: TwwDBGrid;
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label2: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    Label3: TLabel;
    lblPdLogradouro: TLabel;
    lblPdNumero: TLabel;
    lblPdComplemento: TLabel;
    lblBairro: TLabel;
    lblPdCEP: TLabel;
    lblPdCidade: TLabel;
    lblPdEstado: TLabel;
    lblPdPais: TLabel;
    cmdbedDataAlt1: TCMDateTimePicker;
    dbedLogradouro: TDBEdit;
    dbedNumero: TDBEdit;
    dbedComplemento: TwwDBEdit;
    dbedBairro: TwwDBEdit;
    dbedCEP: TwwDBEdit;
    cmbCidade: TCMDBLookupCombo;
    dbedEstado: TwwDBEdit;
    dbedPais: TwwDBEdit;
    CdsDemaisAlter: TCMClientDataSet;
    dsDemaisAlter: TwwDataSource;
    CdsCidade: TCMClientDataSet;
    dsCidade: TwwDataSource;
    dsAlterPlanos: TDataSource;
    CdsAlterPlanos: TCMClientDataSet;
    tbsAlterPlanos: TTabSheet;
    dbgrdPlanos: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDemaisAlterStateChange(Sender: TObject);
    procedure cmbCidadeChange(Sender: TObject);
    procedure mskedAlteracaoChange(Sender: TObject);
    procedure cmbCamposChange(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlHstAlterCad: TCtrlHstAlterCad;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    bDetOk: boolean;

    procedure Sel(IdPessoa: double);
    procedure FormatarEdicaoCampo;
    procedure SetValCampos(Campo, CampoAlt: string; TamCampo: byte);
    procedure SelCodigoSEFIP(Campo: string);
    procedure AtualizarListCampos;
    function  GravarRegistro: boolean;
  end;

var
  frmCadHstAlterCad: TfrmCadHstAlterCad;

implementation

uses uCMTypes, uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadHstAlterCad.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlHstAlterCad := TCtrlHstAlterCad.Create;
  CtrlHstAlterCad.InitializeAs(Padroes);
  CtrlHstAlterCad.CdsHstEndPess := CdsDet;
  CtrlHstAlterCad.CdsHstAltCad := CdsDemaisAlter;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  CdsCidade.Data := CtrlListTerceirosRH.ListCidadeEstadoPais;
  CdsCodAltCad.Data := CtrlHstAlterCad.ListCodAltCad;

  sbtnProcurarClick(Self);

  mskedAlteracao.Width := 452;

  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690007;
    MODFOL : HelpContext := 210008;
  end;
end;

procedure TfrmCadHstAlterCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHstAlterCad);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadHstAlterCad.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    if (Cds.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;
  end;
end;

procedure TfrmCadHstAlterCad.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePageIndex = 0) then
    CdsDet.FieldByName('DATAALT').asDateTime := Date
  else
  begin
    CdsDemaisAlter.FieldByName('DATAALT').asDateTime := Date;
    CdsDemaisAlter.FieldByName('TIPOCAMPO').asString := 'C';
    SetValCampos('NOME', 'Nome', 60);
    FormatarEdicaoCampo;
  end;
end;

procedure TfrmCadHstAlterCad.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePageIndex = 1) then
    FormatarEdicaoCampo;
end;

procedure TfrmCadHstAlterCad.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadHstAlterCad.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadHstAlterCad.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (cmdbedDataAlt1.CanFocus) then
    cmdbedDataAlt1.SetFocus;
end;

procedure TfrmCadHstAlterCad.dsDemaisAlterStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (cmdbedDataAlt2.CanFocus) then
    cmdbedDataAlt2.SetFocus;
end;

procedure TfrmCadHstAlterCad.cmbCidadeChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit, dsInsert]) then
    CdsDet.FieldByName('ESTADO').asString := CdsCidade.FieldByName('ESTADO').asString;
end;

procedure TfrmCadHstAlterCad.mskedAlteracaoChange(Sender: TObject);
begin
  CdsDemaisAlter.FieldByName('ALTERACAO').asString := TEdit(Sender).Text;
end;

procedure TfrmCadHstAlterCad.cmbCamposChange(Sender: TObject);
begin
  if (CdsDemaisAlter.State in [dsEdit, dsInsert]) then
  begin
    case (cmbCampos.ItemIndex) of
      13,14,15        : CdsDemaisAlter.FieldByName('TIPOCAMPO').asString := 'N';
      5,6             : CdsDemaisAlter.FieldByName('TIPOCAMPO').asString := 'D';
      0..4,7..9,11,12 : CdsDemaisAlter.FieldByName('TIPOCAMPO').asString := 'C';
      10              : CdsDemaisAlter.FieldByName('TIPOCAMPO').asString := 'L';
    end;

    case (cmbCampos.ItemIndex) of
      00 : SetValCampos('MATRI', 'Matrícula', 13);
      01 : SetValCampos('NOME', 'Nome', 60);
      02 : SetValCampos('CPF', 'CPF', 18);
      03 : SetValCampos('CTPS', 'CTPS', 18);
      04 : SetValCampos('PIS', 'PIS/PASEP', 18);
      05 : SetValCampos('DTNAS', 'Data de Nascimento', 10);
      06 : SetValCampos('DTADM', 'Data de Admissão', 10);
      07 : SetValCampos('HORTR', 'Horário de Trabalho', 40);
      08 : SetValCampos('NOMCH', 'Nome do Chefe', 60);
      09 : SetValCampos('GRINS', 'Grau de Instrução', 30);
      10 : SetValCampos('ESTCV', 'Estado Civil', 30);
      11 : SetValCampos('NOMSI', 'Sindicato', 60);
      12 : SetValCampos('PROFI', 'Profissão', 60);
      13 : SetValCampos('NIRRF', 'Qtde. Dependentes I. Renda', 02);
      14 : SetValCampos('NSALF', 'Qtde. Dependentes Sal. Fam.', 02);
      15 : SetValCampos('NTELE', 'Telefone', 20);
    end;
    FormatarEdicaoCampo;
  end;
end;

procedure TfrmCadHstAlterCad.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  sbtnExcluiDet.Down := false;
end;

procedure TfrmCadHstAlterCad.bbtnOkDetClick(Sender: TObject);
begin
  bDetOk := false;
  if (pgctrlDetalhe.ActivePageIndex = 0) then
  begin
    if (Trim(cmdbedDataAlt1.Text) = '') then
    begin
      MsgDlg('Preencha a Data da Alteração do Endereço.', 'Informação', mtInformation,
        [mbOk, mbHelp], 0);
      cmdbedDataAlt1.SetFocus;
      exit;
    end;

    if (Trim(dbedLogradouro.Text) = '') then
    begin
      MsgDlg('Preencha o Logradouro.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      dbedLogradouro.SetFocus;
      exit;
    end;

    if (Trim(dbedNumero.Text) = '') then
    begin
      MsgDlg('Preencha o Número.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      dbedNumero.SetFocus;
      exit;
    end;

    if (Trim(dbedBairro.Text) = '') then
    begin
      MsgDlg('Preencha o Bairro.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      dbedBairro.SetFocus;
      exit;
    end;

    if (Trim(cmbCidade.Text) = '') then
    begin
      MsgDlg('Preencha a Cidade.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      cmbCidade.SetFocus;
      exit;
    end;

    CdsDet.FieldByName('IDPESSOA').asString := Cds.FieldByName('IDPESSOA').asString;
    CdsDet.FieldByName('CIDADE').asString := CdsCidade.FieldByName('CIDADE').asString;
    bDetOk := true;
  end
  else
  begin
    if (Trim(cmdbedDataAlt2.Text) = '') then
    begin
      MsgDlg('Preencha a Data da Alteração das Demais Alterações.', 'Informação',
        mtInformation, [mbOk, mbHelp], 0);
      cmdbedDataAlt2.SetFocus;
      exit;
    end;

    if ((cmdbedAlteracao.Visible) and (Trim(cmdbedAlteracao.Text) = '')) or
       ((mskedAlteracao.Visible) and (Trim(mskedAlteracao.Text) = '')) or
       ((dbcmbAlteracao.Visible) and (dbcmbAlteracao.ItemIndex = -1)) then
    begin
      MsgDlg('Preencha a Alteração.', 'Atenção', mtWarning, [mbOk, mbHelp], 0);

      if (mskedAlteracao.Visible) then
        mskedAlteracao.SetFocus
      else
      if (cmdbedAlteracao.Visible) then
        cmdbedAlteracao.SetFocus
      else
        dbcmbAlteracao.SetFocus;
      exit;
    end;

    case (CdsDemaisAlter.FieldByName('TIPOCAMPO').asString[1]) of
      'D'     :
      begin
        CdsDemaisAlter.FieldByName('ALTERACAO').asString := cmdbedAlteracao.Text;
        CdsDemaisAlter.FieldByName('VALORALTERACAO').asString := cmdbedAlteracao.Text;
      end;
      'L'     : CdsDemaisAlter.FieldByName('VALORALTERACAO').asString := dbcmbAlteracao.Text;
      'N','C' :
      begin
        CdsDemaisAlter.FieldByName('ALTERACAO').asString := mskedAlteracao.Text;
        CdsDemaisAlter.FieldByName('VALORALTERACAO').asString := mskedAlteracao.Text;
      end;
    end;

    CdsDemaisAlter.FieldByName('IDPESSOA').asString := Cds.FieldByName('IDPESSOA').asString;
    bDetOk := true;
  end;
  inherited;
end;

procedure TfrmCadHstAlterCad.bbtnConfirmarClick(Sender: TObject);
begin
  if (CdsAtual.State in [dsInsert, dsEdit]) then
  begin
    CmeDetalhe.RepetirInsert := false;
    bbtnOkDetClick(Sender);
    CmeDetalhe.RepetirInsert := true;
  end
  else
    bDetOk := true;

  if (bDetOk) then
  begin
    inherited;
    bDetOk := false;
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadHstAlterCad.Sel(IdPessoa: double);
begin
  Cds.Data := CtrlHstAlterCad.ListMestre(IdPessoa);
  CdsDet.Data := CtrlHstAlterCad.ListHstEndPess(IdPessoa);
  CdsDemaisAlter.Data := CtrlHstAlterCad.ListHstAltCad(IdPessoa);
  CdsAlterPlanos.Data := CtrlHstAlterCad.ListHstAltPlanos(IdPessoa); // Felipe A. Santos SOL 183750 KTN 1731771
end;

procedure TfrmCadHstAlterCad.SetValCampos(Campo,CampoAlt:string; TamCampo:byte);
begin
  CdsDemaisAlter.FieldByName('CAMPO').asString := CampoAlt;
  CdsDemaisAlter.FieldByName('CODALTERACAO').asString := Campo;
  CdsDemaisAlter.FieldByName('MAXLENGTHCAMPO').asInteger := TamCampo;
end;

procedure TfrmCadHstAlterCad.SelCodigoSEFIP(Campo: string);
begin
  if (CdsCodAltCad.Locate('CODALTERACAO', Campo, [])) then
    edCodigo.Text := CdsCodAltCad.FieldByName('CODSEFIP').asString
  else
    edCodigo.Text := '';
end;

procedure TfrmCadHstAlterCad.AtualizarListCampos;
begin
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'MATRI') then
    cmbCampos.ItemIndex := 0
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'NOME') then
    cmbCampos.ItemIndex := 1
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'CPF') then
    cmbCampos.ItemIndex := 2
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'CTPS') then
    cmbCampos.ItemIndex := 3
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'PIS') then
    cmbCampos.ItemIndex := 4
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'DTNAS') then
    cmbCampos.ItemIndex := 5
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'DTADM') then
    cmbCampos.ItemIndex := 6
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'HORTR') then
    cmbCampos.ItemIndex := 7
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'NOMCH') then
    cmbCampos.ItemIndex := 8
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'GRINS') then
    cmbCampos.ItemIndex := 9
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'ESTCV') then
    cmbCampos.ItemIndex := 10
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'NOMSI') then
    cmbCampos.ItemIndex := 11
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'PROFI') then
    cmbCampos.ItemIndex := 12
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'NIRRF') then
    cmbCampos.ItemIndex := 13
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'NSALF') then
    cmbCampos.ItemIndex := 14
  else
  if (CdsDemaisAlter.FieldByName('CODALTERACAO').asString = 'NTELE') then
    cmbCampos.ItemIndex := 15;
end;

procedure TfrmCadHstAlterCad.FormatarEdicaoCampo;
var
  cTipoCampo: char;
  sCampoAlt: string;
  iTamCampo: integer;
begin
  SelCodigoSEFIP(CdsDemaisAlter.FieldByName('CODALTERACAO').asString);

  cTipoCampo := CdsDemaisAlter.FieldByName('TIPOCAMPO').asString[1];
  sCampoAlt := CdsDemaisAlter.FieldByName('ALTERACAO').asString;
  AtualizarListCampos;
  case (cTipoCampo) of
    'C','N' :
    begin
      iTamCampo := CdsDemaisAlter.FieldByName('MAXLENGTHCAMPO').asInteger;
      mskedAlteracao.Left := 34;

      if (cTipoCampo = 'C') then
        mskedAlteracao.EditMask := FU.Replicate('c', iTamCampo)+';0; '
      else
        mskedAlteracao.EditMask := FU.Replicate('9', iTamCampo)+';0; ';

      mskedAlteracao.MaxLength := iTamCampo;
      try
        if (cTipoCampo = 'C') then
          mskedAlteracao.Text := sCampoAlt
        else
          mskedAlteracao.Text := FU.ValidaCaracteres(sCampoAlt, 'N', '');
      except
        if (cTipoCampo = 'C') then
          mskedAlteracao.Text := ''
        else
          mskedAlteracao.Text := '0';
      end;

      mskedAlteracao.Text := Copy(mskedAlteracao.Text, 1, iTamCampo);
      mskedAlteracao.Visible := true;
      cmdbedAlteracao.Visible := false;
      dbcmbAlteracao.Visible := false;
    end;

    'D' :
    begin
      cmdbedAlteracao.Left := 34;
      try
        if (StrToDate(sCampoAlt) = 0) then
          cmdbedAlteracao.Date := Date
        else
          cmdbedAlteracao.Date := StrToDate(sCampoAlt);
      except
        cmdbedAlteracao.Date := Date;
      end;
      cmdbedAlteracao.Visible := true;
      mskedAlteracao.Visible := false;
      dbcmbAlteracao.Visible := false;
    end;

    'L' :
    begin
      dbcmbAlteracao.Left := 34;
      dbcmbAlteracao.Visible := true;
      cmdbedAlteracao.Visible := false;
      mskedAlteracao.Visible := false;
    end;
  end;
end;

function TfrmCadHstAlterCad.GravarRegistro: boolean;
begin
  Result := CtrlHstAlterCad.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlHstAlterCad.MessageInfo);
end;

end.
