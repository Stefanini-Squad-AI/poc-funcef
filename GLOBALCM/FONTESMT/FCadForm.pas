{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade
--------------------------------------------------------------------------------}

unit FCadForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbedit, wwdblook, Wwdbdlg, Mask, Wwdotdot, uCmSqlParams, uCmTypes,
  CMDBLookupCombo, uCtrlForm;

const
  MSG01 = 'Preencha o campo: ';
  MSG02 = 'Já existe este Módulo e Form cadastrado na base.' + #13#10 +
          'Utilize o registro que já está cadastrado';

type
  TFrmCadForm = class(TFrmCadastroMT)
    dbedtForm: TwwDBEdit;
    CdsModulo: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    dblkpModulo: TCMDBLookupCombo;
    lblModulo: TLabel;
    lblNomeForm: TLabel;
    dbedtDescForm: TwwDBEdit;
    lblDescForm: TLabel;
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
    ctrlForm : TCtrlForm;

    procedure Seleciona(idForm: Double = -1; idModulo: Double = -1);
    function ValidaDados : Boolean;

  public
    { Public declarations }
    
  end;

var
  FrmCadForm: TFrmCadForm;

implementation

Uses uMensErro, dBasedados, uSistema, uFuncaoGeral;

{$R *.DFM}

procedure TFrmCadForm.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  ctrlForm := TCtrlForm.Create;

  //Initialize
  ctrlForm.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Atribuição de CDS
  ctrlForm.cds := Cds;
  
  //Prepare
  sqlModulo.Prepare;

  //Open
  sqlModulo.Open;

  Seleciona();
end;

procedure TFrmCadForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(ctrlForm);
end;

procedure TFrmCadForm.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]), 0);
end;

procedure TFrmCadForm.Seleciona(idForm, idModulo: Double);
begin
  Cds.Data := ctrlForm.ListaForm(idForm, idModulo);
end;

procedure TFrmCadForm.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.FieldByName('IDFORM').asFloat := ctrlForm.GetSequenceForm;
  Accept := ctrlForm.Gravar;

  if Accept then
    MsgDlg('Registro incluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadForm.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ctrlForm.Gravar;

  if Accept then
  begin
    MsgDlg('Registro alterado com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]), 0);
  end;
end;

procedure TFrmCadForm.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ctrlForm.Gravar;

  if Accept then
    MsgDlg('Registro excluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadForm.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(ctrlForm.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadForm.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  dblkpModulo.SetFocus;
  dblkpModulo.DropDown;
end;

procedure TFrmCadForm.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  dbedtForm.SetFocus;
end;

procedure TFrmCadForm.bbtnConfirmarClick(Sender: TObject);
begin
  if not(ValidaDados) then
    exit;

  inherited;
end;

function TFrmCadForm.ValidaDados: Boolean;
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

  if (dbedtForm.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblNomeForm.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtForm.CanFocus then
      dbedtForm.SetFocus;
      
    result := false;
    Exit;
  end;

  if ctrlForm.VerificaDuplicado(cds.fieldbyname('idform').AsString, FuncaoGeral.RemoveCaracterEspecial(dbedtForm.Text, False), dblkpModulo.LookupValue) then
  begin
    MsgDlg(MSG02, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtForm.CanFocus then
    begin
      dbedtForm.SetFocus;
      dbedtForm.SelectAll;
    end;
      
    result := false;
    Exit;
  end;

end;

end.
