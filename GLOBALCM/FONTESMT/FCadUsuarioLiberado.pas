{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade
--------------------------------------------------------------------------------}

unit FCadUsuarioLiberado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  uCtrlUsuarioLiberado, uCmTypes, uCmSqlParams, wwdblook, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker;

const
  MSG01 = 'Preencha o campo: ';
  MSG02 = 'Preenchimento incorreto do campo: ';
  MSG03 = 'Módulo já vinculado ao Usuário';

type
  TFrmCadUsuarioLiberado = class(TFrmCadastroMestreDetMT)
    CdsDet: TCMClientDataSet;
    dbedtMatricula: TwwDBEdit;
    dbedtNomeFunc: TwwDBEdit;
    lblMatricula: TLabel;
    lblNomeFunc: TLabel;
    dbtxtSituacao: TDBText;
    dblkpModulo: TCMDBLookupCombo;
    CdsModulo: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    dbdtInicio: TCMDateTimePicker;
    dbdtFim: TCMDateTimePicker;
    lblModulo: TLabel;
    lblDtInicio: TLabel;
    lblDtFim: TLabel;
    dbedtNomeUsuario: TwwDBEdit;
    lblNomeUsuario: TLabel;
    CdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);

  private
    { Private declarations }
    ctrlUsuarioLiberado : TCtrlUsuarioLiberado;

    procedure AbreQueries;
    procedure Seleciona(idUsuario: Double = -1);
    function ValidaDadosDet : Boolean;

  public
    { Public declarations }

  end;

var
  FrmCadUsuarioLiberado: TFrmCadUsuarioLiberado;

implementation

Uses uMensErro, dBasedados, uSistema;

{$R *.DFM}

{ TFrmCadUsuarioLiberado }

procedure TFrmCadUsuarioLiberado.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  ctrlUsuarioLiberado := TCtrlUsuarioLiberado.Create;

  //Initialize
  ctrlUsuarioLiberado.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Atribuição de CDS
  ctrlUsuarioLiberado.cdsDet := CdsDet;

  AbreQueries;

  Seleciona();
end;

procedure TFrmCadUsuarioLiberado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(ctrlUsuarioLiberado);
end;

procedure TFrmCadUsuarioLiberado.AbreQueries;
begin
  //SQL
  sqlModulo.Prepare;
  sqlModulo.Open;
end;

procedure TFrmCadUsuarioLiberado.Seleciona(idUsuario: Double);
begin
  Cds.Data := ctrlUsuarioLiberado.ListaFuncionario(idUsuario);
  CdsDet.Data := ctrlUsuarioLiberado.ListaUsuarioLiberado(idUsuario);
end;

procedure TFrmCadUsuarioLiberado.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));

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

procedure TFrmCadUsuarioLiberado.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlUsuarioLiberado.Gravar;

  if Accept then
    MsgDlg('Registro alterado com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadUsuarioLiberado.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;

  if StrToFloat(MontaSelect.ValoresChave[0]) > 0 then
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadUsuarioLiberado.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(ctrlUsuarioLiberado.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadUsuarioLiberado.CmeDetalheAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(ctrlUsuarioLiberado.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadUsuarioLiberado.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  CdsDet.FieldByName('IDUSUARIO').AsFloat := Cds.FieldByName('IDPESSOA').AsFloat;
  CdsDet.FieldByName('DATA_INICIO_LIBERACAO').AsDateTime := Now;

  if dblkpModulo.CanFocus then
  begin
    dblkpModulo.SetFocus;
    dblkpModulo.DropDown;
  end;
end;

function TFrmCadUsuarioLiberado.ValidaDadosDet: Boolean;
begin
  result := True;

  if (dblkpModulo.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblModulo.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dblkpModulo.CanFocus then
    begin
      dblkpModulo.SetFocus;
      dblkpModulo.DropDown;
    end;

    result := false;
    Exit;
  end;

  if (dbdtInicio.Text = EmptyStr) or (dbdtInicio.DateTime = 0) then
  begin
    MsgDlg(MSG01 + lblDtInicio.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbdtInicio.CanFocus then
      dbdtInicio.SetFocus;

    result := false;
    Exit;
  end;

  if (dbdtFim.Text = EmptyStr) or (dbdtFim.DateTime = 0) then
  begin
    MsgDlg(MSG01 + lblDtFim.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbdtFim.CanFocus then
      dbdtFim.SetFocus;
      
    result := false;
    Exit;
  end;

  if (dbdtFim.DateTime < dbdtInicio.DateTime) then
  begin
    MsgDlg(MSG02 + lblDtFim.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbdtFim.CanFocus then
      dbdtFim.SetFocus;
      
    result := false;
    Exit;
  end;


  CdsAux.CloneCursor(CdsDet, True);

  if CdsAux.Locate('NOME_ID', dblkpModulo.Text, []) then
  begin
    MsgDlg(MSG03, 'Aviso', mtWarning, [mbOK], 0);
    result := false;
    Exit;
  end;

end;

procedure TFrmCadUsuarioLiberado.bbtnOkDetClick(Sender: TObject);
begin
  if not(ValidaDadosDet) then
    exit;

  if CdsDet.State in [dsInsert, dsEdit] then
    CdsDet.FieldByName('NOME_ID').AsString := dblkpModulo.Text;
    
  inherited;  
end;   

end.
