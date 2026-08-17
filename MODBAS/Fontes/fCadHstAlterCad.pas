unit fCadHstAlterCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  DBCtrls, StdCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, CMDBLookupCombo, Spin, Wwdotdot, Wwdbcomb;

type
  TfrmCadHstAlterCad = class(TfrmCadMestreDetalheCS)
    dbedNome: TwwDBEdit;
    Label2: TLabel;
    dbedMat: TwwDBEdit;
    Label1: TLabel;
    dbtxtSituacao: TDBText;
    tbshDemaisAlter: TTabSheet;
    pnlControlesDemaisAlter: TPanel;
    dbgrdDemaisAlter: TwwDBGrid;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsCidade: TwwDataSource;
    qryCidade: TwwQuery;
    dsDemaisAlter: TwwDataSource;
    qryDemaisAlter: TwwQuery;
    updDemaisAlter: TUpdateSQL;
    Label7: TLabel;
    cmdbedDataAlt1: TCMDateTimePicker;
    lblPdLogradouro: TLabel;
    dbedLogradouro: TDBEdit;
    lblPdNumero: TLabel;
    dbedNumero: TDBEdit;
    lblPdComplemento: TLabel;
    dbedComplemento: TwwDBEdit;
    lblBairro: TLabel;
    dbedBairro: TwwDBEdit;
    lblPdCEP: TLabel;
    dbedCEP: TwwDBEdit;
    lblPdCidade: TLabel;
    cmbCidade: TCMDBLookupCombo;
    lblPdEstado: TLabel;
    dbedEstado: TwwDBEdit;
    lblPdPais: TLabel;
    dbedPais: TwwDBEdit;
    Label9: TLabel;
    cmdbedDataAlt2: TCMDateTimePicker;
    Label5: TLabel;
    mskedAlteracao: TMaskEdit;
    cmdtpicAlteracao: TCMDateTimePicker;
    dbcmbAlteracao: TwwDBComboBox;
    Label8: TLabel;
    cmbCampos: TComboBox;
    Label6: TLabel;
    edCodigo: TEdit;
    qryCodAltCad: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure cmbCidadeChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure cmbCamposChange(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure mskedAlteracaoChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dsDemaisAlterStateChange(Sender: TObject);
  private
    procedure Sel(IdPessoa: real);
    procedure FormatarEdicaoCampo;
    procedure SetValCampos(Campo, CampoAlt: string; TamCampo: byte);
    procedure SelCodigoSEFIP(Campo: string);
    procedure AtualizarListCampos;
  end;

var
  frmCadHstAlterCad: TfrmCadHstAlterCad;

implementation

uses uDataBase, uMensErro, uFuncoesUteis, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadHstAlterCad.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  with (MontaSelect.Filtro) do
  begin
    Add('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qry.Prepare;
  qryDet.Prepare;
  qryDemaisAlter.Prepare;

  qryCidade.Open;
  qryCodAltCad.Open;

  sbtnProcurarClick(Self);

  mskedAlteracao.Width := 452;
end;

procedure TfrmCadHstAlterCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCodAltCad.Close;
  qryCidade.Close;
  qry.Close;
  qryDet.Close;
  qryDemaisAlter.Close;

  qry.UnPrepare;
  qryDet.UnPrepare;
  qryDemaisAlter.UnPrepare;
  inherited;
end;

procedure TfrmCadHstAlterCad.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    if (qry.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (qry.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (qry.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;
  end;
end;

procedure TfrmCadHstAlterCad.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePageIndex = 0) then
    qryDet.FieldByName('DATAALT').asDateTime := Date
  else  
  begin
    qryDemaisAlter.FieldByName('DATAALT').asDateTime := Date;
    qryDemaisAlter.FieldByName('TIPOCAMPO').asString := 'C';
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

procedure TfrmCadHstAlterCad.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet, qryDemaisAlter]);
  except
    raise;
  end;
end;

procedure TfrmCadHstAlterCad.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (qryDet.State in [dsInsert, dsEdit]) then
    cmdbedDataAlt1.SetFocus;
end;

procedure TfrmCadHstAlterCad.dsDemaisAlterStateChange(Sender: TObject);
begin
  if (qryDemaisAlter.State in [dsInsert, dsEdit]) then
    cmdbedDataAlt2.SetFocus;
end;

procedure TfrmCadHstAlterCad.cmbCidadeChange(Sender: TObject);
begin
  if (qryDet.State in [dsEdit, dsInsert]) then
    qryDet.FieldByName('ESTADO').asString := qryCidade.FieldByName('ESTADO').asString;
end;

procedure TfrmCadHstAlterCad.mskedAlteracaoChange(Sender: TObject);
begin
  qryDemaisAlter.FieldByName('ALTERACAO').asString := TEdit(Sender).Text;
end;

procedure TfrmCadHstAlterCad.cmbCamposChange(Sender: TObject);
begin
  if (qryDemaisAlter.State in [dsEdit, dsInsert]) then
  begin
    case (cmbCampos.ItemIndex) of
      0,15,16                  : qryDemaisAlter.FieldByName('TIPOCAMPO').asString := 'N';
      5,6                      : qryDemaisAlter.FieldByName('TIPOCAMPO').asString := 'D';
      1,2,3,4,9,11,12,13,14,17 : qryDemaisAlter.FieldByName('TIPOCAMPO').asString := 'C';
      10                       : qryDemaisAlter.FieldByName('TIPOCAMPO').asString := 'L';
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

    qryDet.FieldByName('IDPESSOA').asString := qry.FieldByName('IDPESSOA').asString;
    qryDet.FieldByName('CIDADE').asString := qryCidade.FieldByName('CIDADE').asString;
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

    if ((cmdtpicAlteracao.Visible) and (Trim(cmdtpicAlteracao.Text) = '')) or
       ((mskedAlteracao.Visible)   and (Trim(mskedAlteracao.Text)   = '')) or
       ((dbcmbAlteracao.Visible)   and (dbcmbAlteracao.ItemIndex    = -1)) then
    begin
      MsgDlg('Preencha a Alteração.', 'Atenção', mtWarning, [mbOk, mbHelp], 0);

      if (mskedAlteracao.Visible) then
        mskedAlteracao.SetFocus
      else
      if (cmdtpicAlteracao.Visible) then
        cmdtpicAlteracao.SetFocus
      else
        dbcmbAlteracao.SetFocus;
      exit;
    end;

    case (qryDemaisAlter.FieldByName('TIPOCAMPO').asString[1]) of
      'D'     :
      begin
        qryDemaisAlter.FieldByName('ALTERACAO').asString := cmdtpicAlteracao.Text;
        qryDemaisAlter.FieldByName('VALORALTERACAO').asString := cmdtpicAlteracao.Text;
      end;
      'L'     : qryDemaisAlter.FieldByName('VALORALTERACAO').asString := dbcmbAlteracao.Text;
      'N','C' :
      begin
        qryDemaisAlter.FieldByName('ALTERACAO').asString := mskedAlteracao.Text;
        qryDemaisAlter.FieldByName('VALORALTERACAO').asString := mskedAlteracao.Text;
      end;
    end;

    qryDemaisAlter.FieldByName('IDPESSOA').asString := qry.FieldByName('IDPESSOA').asString;
  end;
  inherited;
end;

procedure TfrmCadHstAlterCad.bbtnSairClick(Sender: TObject);
begin
  qry.DisableControls;
  qryDet.DisableControls;
  qryCidade.DisableControls;
  qryDemaisAlter.DisableControls;
  inherited;
end;

procedure TfrmCadHstAlterCad.Sel(IdPessoa: real);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asFloat := IdPessoa;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asFloat := IdPessoa;
  qryDet.Open;

  qryDemaisAlter.Close;
  qryDemaisAlter.ParamByName('IDPESSOA').asFloat := IdPessoa;
  qryDemaisAlter.Open;
end;

procedure TfrmCadHstAlterCad.SetValCampos(Campo,CampoAlt:string; TamCampo:byte);
begin
  qryDemaisAlter.FieldByName('CAMPO').asString := CampoAlt;
  qryDemaisAlter.FieldByName('CODALTERACAO').asString := Campo;
  qryDemaisAlter.FieldByName('MAXLENGTHCAMPO').asInteger := TamCampo;
end;

procedure TfrmCadHstAlterCad.SelCodigoSEFIP(Campo: string);
begin
  if (qryCodAltCad.Locate('CODALTERACAO', Campo, [])) then
    edCodigo.Text := qryCodAltCad.FieldByName('CODSEFIP').asString
  else
    edCodigo.Text := '';
end;

procedure TfrmCadHstAlterCad.AtualizarListCampos;
begin
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'MATRI') then
    cmbCampos.ItemIndex := 0
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'NOME') then
    cmbCampos.ItemIndex := 1
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'CPF') then
    cmbCampos.ItemIndex := 2
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'CTPS') then
    cmbCampos.ItemIndex := 3
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'PIS') then
    cmbCampos.ItemIndex := 4
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'DTNAS') then
    cmbCampos.ItemIndex := 5
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'DTADM') then
    cmbCampos.ItemIndex := 6
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'HORTR') then
    cmbCampos.ItemIndex := 7
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'NOMCH') then
    cmbCampos.ItemIndex := 8
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'GRINS') then
    cmbCampos.ItemIndex := 9
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'ESTCV') then
    cmbCampos.ItemIndex := 10
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'NOMSI') then
    cmbCampos.ItemIndex := 11
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'PROFI') then
    cmbCampos.ItemIndex := 12
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'NIRRF') then
    cmbCampos.ItemIndex := 13
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'NSALF') then
    cmbCampos.ItemIndex := 14
  else
  if (qryDemaisAlter.FieldByName('CODALTERACAO').asString = 'NTELE') then
    cmbCampos.ItemIndex := 15;
end;

procedure TfrmCadHstAlterCad.FormatarEdicaoCampo;
var
  cTipoCampo: char;
  sCampoAlt: string;
begin
  SelCodigoSEFIP(qryDemaisAlter.FieldByName('CODALTERACAO').asString);

  cTipoCampo := qryDemaisAlter.FieldByName('TIPOCAMPO').asString[1];
  sCampoAlt := qryDemaisAlter.FieldByName('ALTERACAO').asString;
  AtualizarListCampos;
  case (cTipoCampo) of
    'C','N' :
    begin
      mskedAlteracao.MaxLength := qryDemaisAlter.FieldByName('MAXLENGTHCAMPO').asInteger;
      mskedAlteracao.Left := 34;
      mskedAlteracao.EditMask := '';
      try
        if (cTipoCampo = 'C') then
          mskedAlteracao.Text := sCampoAlt
        else
          mskedAlteracao.Text := ValidaCaracteres(sCampoAlt, 'N', '');
      except
        if (cTipoCampo = 'C') then
          mskedAlteracao.Text := ''
        else
          mskedAlteracao.Text := '0';
      end;
      mskedAlteracao.Visible := true;
      cmdtpicAlteracao.Visible := false;
      dbcmbAlteracao.Visible := false;
    end;

    'D' :
    begin
      cmdtpicAlteracao.Left := 34;
      try
        if (StrToDate(sCampoAlt) = 0) then
          cmdtpicAlteracao.Date := Date
        else
          cmdtpicAlteracao.Date := StrToDate(sCampoAlt);
      except
        cmdtpicAlteracao.Date := Date;
      end;
      cmdtpicAlteracao.Visible := true;
      mskedAlteracao.Visible := false;
      dbcmbAlteracao.Visible := false;
    end;

    'L' :
    begin
      dbcmbAlteracao.Left := 34;
      dbcmbAlteracao.Visible := true;
      cmdtpicAlteracao.Visible := false;
      mskedAlteracao.Visible := false;
    end;
  end;
end;

end.
