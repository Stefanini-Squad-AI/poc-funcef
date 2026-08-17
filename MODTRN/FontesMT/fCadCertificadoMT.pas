{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 43337
 Data........: 10/03/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade
--------------------------------------------------------------------------------}

unit fCadCertificadoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCmTypes,
  uCtrlCertificado, Mask, wwdbedit;

const
  MSG01 = 'Preencha o campo: ';
  MSG02 = 'Já existe este Certificado cadastrado na base.' + #13#10 +
          'Utilize o registro que já está cadastrado';

type
  TFrmCadCertificado = class(TFrmCadastroMT)
    lblCertificado: TLabel;
    dbedtCertificado: TwwDBEdit;
    lblSigla: TLabel;
    dbedtSigla: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    ctrlCertificado : TCtrlCertificado;

    procedure Seleciona(idCertificado: Double = -1);
    function ValidaDados : Boolean;

  public
    { Public declarations }
  end;

var
  FrmCadCertificado: TFrmCadCertificado;

implementation

Uses uMensErro, dBasedados, uSistema, uFuncaoGeral;

{$R *.DFM}

procedure TFrmCadCertificado.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  ctrlCertificado := TCtrlCertificado.Create;

  //Initialize
  ctrlCertificado.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Atribuição de CDS
  ctrlCertificado.cds := Cds;

  Seleciona();
end;

procedure TFrmCadCertificado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(ctrlCertificado);
end;

procedure TFrmCadCertificado.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadCertificado.Seleciona(idCertificado: Double);
begin
  Cds.Data := ctrlCertificado.ListaCertificado(idCertificado);
end;

procedure TFrmCadCertificado.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlCertificado.Gravar_Certificado;

  if Accept then
    MsgDlg('Registro incluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadCertificado.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlCertificado.Gravar_Certificado;

  if Accept then
  begin
    MsgDlg('Registro alterado com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TFrmCadCertificado.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlCertificado.Gravar_Certificado;

  if Accept then
    MsgDlg('Registro excluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadCertificado.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(ctrlCertificado.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadCertificado.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  dbedtCertificado.SetFocus;
end;

procedure TFrmCadCertificado.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  dbedtCertificado.SetFocus;
end;

procedure TFrmCadCertificado.bbtnConfirmarClick(Sender: TObject);
begin
  if not(ValidaDados) then
    exit;

  inherited;
end;

function TFrmCadCertificado.ValidaDados: Boolean;
begin
  result := False;

  if (dbedtCertificado.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblCertificado.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtCertificado.CanFocus then
      dbedtCertificado.SetFocus;

    Exit;
  end;

  if ctrlCertificado.VerificaDuplicado(cds.fieldbyname('idcertificado').AsString, FuncaoGeral.RemoveCaracterEspecial(dbedtCertificado.Text, False)) then
  begin
    MsgDlg(MSG02, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtCertificado.CanFocus then
    begin
      dbedtCertificado.SetFocus;
      dbedtCertificado.SelectAll;
    end;
      
    Exit;
  end;

  result := True;
end;

end.
