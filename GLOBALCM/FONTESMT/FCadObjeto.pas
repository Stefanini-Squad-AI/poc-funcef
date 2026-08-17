{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade
--------------------------------------------------------------------------------}

unit FCadObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbedit, wwdblook, Wwdbdlg, Mask, Wwdotdot, uCmSqlParams, uCmTypes,
  CMDBLookupCombo, uCtrlObjeto;

const
  MSG01 = 'Preencha o campo: ';
  MSG02 = 'Já existe este Objeto cadastrado na base.' + #13#10 +
          'Utilize o registro que já está cadastrado';

type
  TFrmCadObjeto = class(TFrmCadastroMT)
    dbedtObjeto: TwwDBEdit;
    lblObjeto: TLabel;
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
    ctrlObjeto : TCtrlObjeto;

    procedure Seleciona(idObjeto: Double = -1);
    function ValidaDados : Boolean;

  public
    { Public declarations }
    
  end;

var
  FrmCadObjeto: TFrmCadObjeto;

implementation

Uses uMensErro, dBasedados, uSistema, uFuncaoGeral;

{$R *.DFM}

procedure TFrmCadObjeto.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  ctrlObjeto := TCtrlObjeto.Create;

  //Initialize
  ctrlObjeto.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Atribuição de CDS
  ctrlObjeto.cds := Cds;
  
  Seleciona();
end;

procedure TFrmCadObjeto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(ctrlObjeto);
end;

procedure TFrmCadObjeto.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadObjeto.Seleciona(idObjeto: Double);
begin
  Cds.Data := ctrlObjeto.ListaObjeto(idObjeto);
end;

procedure TFrmCadObjeto.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.FieldByName('IDOBJETO').asFloat := ctrlObjeto.GetSequenceObjeto;
  Accept := ctrlObjeto.Gravar;

  if Accept then
    MsgDlg('Registro incluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadObjeto.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ctrlObjeto.Gravar;

  if Accept then
  begin
    MsgDlg('Registro alterado com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TFrmCadObjeto.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ctrlObjeto.Gravar;

  if Accept then
    MsgDlg('Registro excluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadObjeto.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(ctrlObjeto.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadObjeto.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  dbedtObjeto.SetFocus;
end;

procedure TFrmCadObjeto.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  dbedtObjeto.SetFocus;
end;

procedure TFrmCadObjeto.bbtnConfirmarClick(Sender: TObject);
begin
  if not(ValidaDados) then
    exit;

  inherited;
end;

function TFrmCadObjeto.ValidaDados: Boolean;
begin
  result := True;

  if (dbedtObjeto.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblObjeto.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtObjeto.CanFocus then
      dbedtObjeto.SetFocus;
      
    result := false;
    Exit;
  end;

  if ctrlObjeto.VerificaDuplicado(cds.fieldbyname('idobjeto').AsString, FuncaoGeral.RemoveCaracterEspecial(dbedtObjeto.Text, False)) then
  begin
    MsgDlg(MSG02, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtObjeto.CanFocus then
    begin
      dbedtObjeto.SetFocus;
      dbedtObjeto.SelectAll;
    end;
      
    result := false;
    Exit;
  end;

end;

end.
