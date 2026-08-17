{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade
--------------------------------------------------------------------------------}

unit FCadOperacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbedit, wwdblook, Wwdbdlg, Mask, Wwdotdot, uCmSqlParams, uCmTypes,
  CMDBLookupCombo, uCtrlOperacao;

const
  MSG01 = 'Preencha o campo: ';
  MSG02 = 'Já existe esta Operação cadastrada na base.' + #13#10 +
          'Utilize o registro que já está cadastrado';

type
  TFrmCadOperacao = class(TFrmCadastroMT)
    dbedtOperacao: TwwDBEdit;
    lblOperacao: TLabel;
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
    ctrlOperacao : TCtrlOperacao;

    procedure Seleciona(idOperacao: Double = -1);
    function ValidaDados : Boolean;

  public
    { Public declarations }
    
  end;

var
  FrmCadOperacao: TFrmCadOperacao;

implementation

Uses uMensErro, dBasedados, uSistema, uFuncaoGeral;

{$R *.DFM}

procedure TFrmCadOperacao.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  ctrlOperacao := TCtrlOperacao.Create;

  //Initialize
  ctrlOperacao.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Atribuição de CDS
  ctrlOperacao.cds := Cds;
  
  Seleciona();
end;

procedure TFrmCadOperacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(ctrlOperacao);
end;

procedure TFrmCadOperacao.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadOperacao.Seleciona(idOperacao: Double);
begin
  Cds.Data := ctrlOperacao.ListaOperacao(idOperacao);
end;

procedure TFrmCadOperacao.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.FieldByName('IDOPERACAO').asFloat := ctrlOperacao.GetSequenceOperacao;
  Accept := ctrlOperacao.Gravar;

  if Accept then
    MsgDlg('Registro incluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadOperacao.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ctrlOperacao.Gravar;

  if Accept then
  begin
    MsgDlg('Registro alterado com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TFrmCadOperacao.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ctrlOperacao.Gravar;

  if Accept then
    MsgDlg('Registro excluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadOperacao.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(ctrlOperacao.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadOperacao.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  dbedtOperacao.SetFocus;
end;

procedure TFrmCadOperacao.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  dbedtOperacao.SetFocus;
end;

procedure TFrmCadOperacao.bbtnConfirmarClick(Sender: TObject);
begin
  if not(ValidaDados) then
    exit;

  inherited;
end;

function TFrmCadOperacao.ValidaDados: Boolean;
begin
  result := True;

  if (dbedtOperacao.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblOperacao.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtOperacao.CanFocus then
      dbedtOperacao.SetFocus;
      
    result := false;
    Exit;
  end;

  if ctrlOperacao.VerificaDuplicado(cds.fieldbyname('idoperacao').AsString, FuncaoGeral.RemoveCaracterEspecial(dbedtOperacao.Text, False)) then
  begin
    MsgDlg(MSG02, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtOperacao.CanFocus then
    begin
      dbedtOperacao.SetFocus;
      dbedtOperacao.SelectAll;
    end;
      
    result := false;
    Exit;
  end;

end;

end.
