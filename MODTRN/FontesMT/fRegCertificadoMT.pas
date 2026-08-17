{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 43337
 Data........: 10/03/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade
--------------------------------------------------------------------------------}

unit fRegCertificadoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, uCmTypes, 
  uCtrlCertificado, Wwdotdot, Wwdbcomb, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

const
  MSG01 = 'Preencha o campo: ';

type
  TFrmRegCertificado = class(TFrmCadastroMestreDetMT)
    lblCertificado: TLabel;
    dbedtCertificado: TwwDBEdit;
    lblSigla: TLabel;
    dbedtSigla: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    dbdtInicio: TCMDateTimePicker;
    dbdtValidade: TCMDateTimePicker;
    dbchkHabilitacao: TDBCheckBox;
    lblDtInicio: TLabel;
    lblDtValidade: TLabel;
    pnlHabilitacao: TPanel;
    dbedtNumHabilitacao: TwwDBEdit;
    lblNumHabilitacao: TLabel;
    lblDtValidadeHabilitacao: TLabel;
    dbdtValidadeHabilitacao: TCMDateTimePicker;
    lblStatusHabilitacao: TLabel;
    cbbStatusHabilitacao: TwwDBComboBox;
    MsEmpregado: TMontaSelect;
    edtNomeEmpregado: TEdit;
    lblNomeEmpregado: TLabel;
    btnProcuraEmpregado: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dbchkHabilitacaoClick(Sender: TObject);
    procedure btnProcuraEmpregadoClick(Sender: TObject);

  private
    { Private declarations }
    ctrlCertificado : TCtrlCertificado;

    procedure Seleciona(idCertificado: Double = -1);
    function ValidaDadosDet : Boolean;

  public
    { Public declarations }
  end;

var
  FrmRegCertificado: TFrmRegCertificado;

implementation

Uses uMensErro, dBasedados, uSistema, uFuncaoGeral;

{$R *.DFM}

procedure TFrmRegCertificado.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  ctrlCertificado := TCtrlCertificado.Create;

  //Initialize
  ctrlCertificado.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Atribuição de CDS
  ctrlCertificado.cds := Cds;
  ctrlCertificado.cdsDet := CdsDet;
  
  Seleciona();
end;

procedure TFrmRegCertificado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(ctrlCertificado);
end;

procedure TFrmRegCertificado.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmRegCertificado.Seleciona(idCertificado: Double);
begin
  Cds.Data := ctrlCertificado.ListaCertificado(idCertificado);
  CdsDet.Data := ctrlCertificado.ListaCertificado_Pessoa(idCertificado);
end;

procedure TFrmRegCertificado.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlCertificado.Gravar_Certificado_Pessoa;

  if Accept then
    MsgDlg('Registro incluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmRegCertificado.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  
  Accept := ctrlCertificado.Gravar_Certificado_Pessoa;

  if Accept then
  begin
    MsgDlg('Registro alterado com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TFrmRegCertificado.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlCertificado.Gravar_Certificado_Pessoa;

  if Accept then
    MsgDlg('Registro excluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmRegCertificado.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(ctrlCertificado.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmRegCertificado.CmeDetalheAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(ctrlCertificado.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmRegCertificado.CmeDetalheInsert(Sender: TObject);
begin
  inherited;  

  dbchkHabilitacao.Checked := False;
end;

procedure TFrmRegCertificado.bbtnOkDetClick(Sender: TObject);
begin
  if not(ValidaDadosDet) then
    exit;

  if CdsDet.State in [dsInsert, dsEdit] then
  begin
    //Tabela
    CdsDet.FieldByName('IDCERTIFICADO').AsInteger := Cds.FieldByName('IDCERTIFICADO').AsInteger;

    if CdsDet.FieldByName('FLGHABILITACAO').AsString = '' then //Componente não passa automaticamente quando não clicou
      CdsDet.FieldByName('FLGHABILITACAO').AsString := 'N';

    if CdsDet.FieldByName('STATUS_HABILITACAO').AsString = '' then
      CdsDet.FieldByName('STATUS_HABILITACAO').AsInteger := -1;

    //Grid
    if dbchkHabilitacao.checked then
      CdsDet.FieldByName('DESC_EXIGE_HABILITACAO').AsString := 'Sim'
    else
      CdsDet.FieldByName('DESC_EXIGE_HABILITACAO').AsString := 'Não';

    CdsDet.FieldByName('DESC_STATUS_HABILITACAO').AsString := trim(cbbStatusHabilitacao.Text);
    //                                                                                        
  end;

  edtNomeEmpregado.Text := EmptyStr;

  inherited;
end;

function TFrmRegCertificado.ValidaDadosDet: Boolean;
begin

  result := False;

  if trim(edtNomeEmpregado.Text) = '' then
  begin
    MsgDlg(MSG01 + lblNomeEmpregado.Caption, 'Aviso', mtWarning, [mbOK], 0);
    exit;
  end;

  if dbchkHabilitacao.Checked then
  begin
    if trim(dbedtNumHabilitacao.Text) = '' then
    begin
      MsgDlg(MSG01 + lblNumHabilitacao.Caption, 'Aviso', mtWarning, [mbOK], 0);

      if dbedtNumHabilitacao.CanFocus then
        dbedtNumHabilitacao.SetFocus;

      exit;
    end;

    if (trim(dbdtValidadeHabilitacao.Text) = '') or (dbdtValidadeHabilitacao.DateTime = 0) then
    begin
      MsgDlg(MSG01 + lblDtValidadeHabilitacao.Caption, 'Aviso', mtWarning, [mbOK], 0);

      if dbdtValidadeHabilitacao.CanFocus then
        dbdtValidadeHabilitacao.SetFocus;

      exit;
    end;

    if (trim(cbbStatusHabilitacao.Text) = '') or (cbbStatusHabilitacao.ItemIndex = -1) then
    begin
      MsgDlg(MSG01 + lblStatusHabilitacao.Caption, 'Aviso', mtWarning, [mbOK], 0);

      if cbbStatusHabilitacao.CanFocus then
      begin
        cbbStatusHabilitacao.SetFocus;
        cbbStatusHabilitacao.DropDown;
      end;

      exit;
    end;
  end;

  result := True;
end;

procedure TFrmRegCertificado.dbchkHabilitacaoClick(Sender: TObject);
begin
  inherited;

  if dbchkHabilitacao.Checked then
    pnlHabilitacao.Enabled := True
  else
    pnlHabilitacao.Enabled := False;
end;

procedure TFrmRegCertificado.btnProcuraEmpregadoClick(Sender: TObject);
begin
  inherited;

  MsEmpregado.Executar;

  if MsEmpregado.RetornouValor then
  begin
    edtNomeEmpregado.Text := MsEmpregado.ValoresChave[2];
    CdsDet.FieldByName('IDPESSOA').AsString := MsEmpregado.ValoresChave[0];

    //Grid
    CdsDet.FieldByName('MATRICULA').AsString := MsEmpregado.ValoresChave[1];
    CdsDet.FieldByName('NOME').AsString := MsEmpregado.ValoresChave[2];
    CdsDet.FieldByName('AREA').AsString := MsEmpregado.ValoresChave[3];
  end;
end;

end.
