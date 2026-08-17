unit FCadPlanoContasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCtrlContaContabil,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  fcLabel, Mask, wwdbedit, wwdblook, DBTables, Wwquery, CMProcura,
  CMProcuraMask, uCtrlPlano, uCMTypes;


type
  TfrmCadPlanoContasMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dbeMascara: TwwDBEdit;
    Label2: TLabel;
    dbeNome: TwwDBEdit;
    procedure dbeMascaraKeyPress(Sender: TObject; var Key: Char);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    CtrlPlano         :TCtrlPlano;
    CtrlContaContabil :TCtrlContaContabil;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlanoContasMT: TfrmCadPlanoContasMT;

implementation

{$R *.DFM}


uses dBaseDados,  uModulo, uSistema,uMensErro;


procedure TfrmCadPlanoContasMT.dbeMascaraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if (key = '.') and (copy(dbeMascara.text, Length(dbeMascara.Text), 1) = '.') then begin
      MsgDlg('Máscara do Plano de Contas inválida.','Aviso',mtWarning,[mbOk],0);
      key := #0;
      exit;
   end;
   if (key <> '9') and (key <> '.') and (key <> #8) then begin
      MsgDlg('Máscara do Plano de Contas inválida.','Aviso',mtWarning,[mbOk],0);
      key := #0;
      exit;
   end;
   if (key <> '9') and (Length(dbeMascara.Text) = 0) then begin
      MsgDlg('Máscara do Plano de Contas inválida.','Aviso',mtWarning,[mbOk],0);
      key := #0;
      exit;
   end;

end;

procedure TfrmCadPlanoContasMT.CmeCadastroDelete(Sender: TObject);
begin
    If CtrlContaContabil.PlanoTemContaContabil(Cds.FieldByName('PLANO').AsFloat) Then
    Begin
       MsgDlg('Este Plano de Contas não pode ser excluído.','Erro',mtError,[mbOk, mbHelp], 0);
       Exit;
    End;

   inherited;

end;

procedure TfrmCadPlanoContasMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if dbeMascara.CanFocus then
      dbeMascara.SetFocus;

end;

procedure TfrmCadPlanoContasMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    Cds.Data := CtrlPlano.ListPlano(StrToFloat(MontaSelect.ValoresChave[0]));
  End;

end;

procedure TfrmCadPlanoContasMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
  dbeMascara.SetFocus;
 
end;

procedure TfrmCadPlanoContasMT.FormShow(Sender: TObject);
begin
  inherited;
  if dbeMascara.CanFocus then
      dbeMascara.SetFocus;

end;

procedure TfrmCadPlanoContasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPlano.Free;
  CtrlContaContabil.Free;
end;

procedure TfrmCadPlanoContasMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** cria a classe principal ***
  CtrlPlano := TCtrlPlano.Create;
  CtrlPlano.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlPlano.CdsPlano := Cds;
  Cds.Data := CtrlPlano.ListPlano(-1);

  // *** instancia a classe Contacontabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


end;


procedure TfrmCadPlanoContasMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
  Cds.Data := CtrlPlano.ListPlano(Cds.FieldByName('PLANO').AsFloat);
end;

procedure TfrmCadPlanoContasMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPlano.Gravar;
end;

procedure TfrmCadPlanoContasMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPlano.Gravar;

end;

procedure TfrmCadPlanoContasMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPlano.Gravar;

end;

procedure TfrmCadPlanoContasMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPlano.MessageInfo <> '' Then
     MsgDlg(CtrlPlano.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadPlanoContasMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
     //Faz a verificação do preenchimento dos campos
     If (dbeMascara.Text = '') Then
     Begin
         MsgDlg('Máscara do Plano de Contas não informada.','Aviso',mtWarning,[mbOk],0);
         if dbeMascara.CanFocus Then
            dbeMascara.SetFocus;
         accept := false;
      End;

      If (copy(dbeMascara.Text, Length(dbeMascara.Text), 1) = '.') Then
      Begin
         MsgDlg('Máscara do Plano de Contas inválida.','Aviso',mtWarning,[mbOk],0);
         If dbeMascara.CanFocus Then
            dbeMascara.SetFocus;
         accept := false;
      End;

      If (dbeNome.Text = '') Then
      Begin
         MsgDlg('Nome do Plano de Contas não informado.','Aviso',mtWarning,[mbOk],0);
         If dbeNome.CanFocus Then
            dbeNome.SetFocus;
         accept := false;
      End;
  End;

end;

procedure TfrmCadPlanoContasMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlPlano.ListPlano(-1);

end;

end.
