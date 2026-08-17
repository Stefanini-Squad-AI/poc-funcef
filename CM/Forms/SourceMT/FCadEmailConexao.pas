unit FCadEmailConexao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, Mask, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uMensErro, uCtrlEmailConexao, uCtrlPadroes;

type
  TfrmCadEmailConexao = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dbedtSMTPSERVER: TDBEdit;
    dbedtNOMEEXIBICAO: TDBEdit;
    dbedtUSERNAME: TDBEdit;
    dbedtPASSWORD: TDBEdit;
    dbedtPORTA: TDBEdit;
    dbchkAutenticacao: TDBCheckBox;
    Label5: TLabel;
    dbedtDESCRICAO: TDBEdit;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private

    CtrlEmailConexao : TCtrlEmailConexao;
    procedure MsgErro( sMsg : string );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmailConexao: TfrmCadEmailConexao;

implementation

{$R *.DFM}

procedure TfrmCadEmailConexao.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Erro', mtError, [mbOk], 0 );

end;

procedure TfrmCadEmailConexao.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if dbedtDESCRICAO.CanFocus then dbedtDESCRICAO.SetFocus;
end;

procedure TfrmCadEmailConexao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEmailConexao := TCtrlEmailConexao.Create;
  CtrlEmailConexao.InitializeAs(Padroes);
  CtrlEmailConexao._Cds := Cds;
  Cds.Data := CtrlEmailConexao.CarregaCadEmailConexao(-1);
end;

procedure TfrmCadEmailConexao.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlEmailConexao.Free;
end;

procedure TfrmCadEmailConexao.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEmailConexao.GravaDadosContaEmail;
  if Not Accept then MsgDlg(CtrlEmailConexao.MessageInfo, 'Atenção', mtError, [MbOk], 0);
end;


procedure TfrmCadEmailConexao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor then
     Cds.data := CtrlEmailConexao.CarregaCadEmailConexao(StrToInt ( MontaSelect.ValoresChave[0] ));
end;


procedure TfrmCadEmailConexao.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := False;

  if trim( dbedtDESCRICAO.Text ) = '' then
  begin
    MsgErro( 'Preencha a descrição da conta.' );
    dbedtDESCRICAO.SetFocus;
    exit;
  end;

  if trim( dbedtSMTPSERVER.Text ) = '' then
  begin
    MsgErro( 'Preencha o endereço do servidor SMTP.' );
    dbedtSMTPSERVER.SetFocus;
    exit;
  end;

  if trim( dbedtUSERNAME.Text ) = '' then
  begin
    MsgErro( 'Preencha o username.' );
    dbedtUSERNAME.SetFocus;
    exit;
  end;

  if trim( dbedtPASSWORD.Text ) = '' then
  begin
    MsgErro( 'Preencha a password.' );
    dbedtPASSWORD.SetFocus;
    exit;
  end;

  if trim( dbedtNOMEEXIBICAO.Text ) = '' then
  begin
    MsgErro( 'Preencha o nome de exibição.' );
    dbedtNOMEEXIBICAO.SetFocus;
    exit;
  end;

  if trim( dbedtPORTA.Text ) = '' then
  begin
    MsgErro( 'Preencha a porta.' );
    dbedtPORTA.SetFocus;
    exit;
  end;

  Accept := True;

end;

procedure TfrmCadEmailConexao.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cds.FieldByName('FLGAUTENTIC').AsInteger := 0;
end;

procedure TfrmCadEmailConexao.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Cds.data := CtrlEmailConexao.CarregaCadEmailConexao( cds.FieldByName('IDEMAILCONEXAO').AsInteger );
end;

end.
