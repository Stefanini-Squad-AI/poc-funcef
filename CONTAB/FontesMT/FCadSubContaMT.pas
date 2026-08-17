unit FCadSubContaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  fcLabel, Mask, wwdbedit, wwdblook, DBTables, Wwquery, CMProcura,
  CMProcuraMask, uCtrlSubConta, TREdit, uCtrlContaContabil,
  uCMTypes;


type
  TfrmCadSubContaMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dbrSubConta: TDBRealEdit;
    dbeNomeSubConta: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblUltima: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    CtrlSubConta      :TCtrlSubConta;
    CtrlContaContabil :TCtrlContaContabil;
  public
    { Public declarations }
  end;

var
  frmCadSubContaMT: TfrmCadSubContaMT;
  bAssociaContas : Boolean;
implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo;

{$R *.DFM}


procedure TfrmCadSubContaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia subconta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlSubConta.CdsSubConta    := Cds;
  Cds.Data := CtrlSubConta.ListSubconta(-1,-1);

  // *** Instancia ContaContabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

   MontaSelect.Filtro.Add('SUBCONTA.IDPESSOA = '+IntToStr(Sistema.idempresa));
   bAssociaContas :=False;

end;


procedure TfrmCadSubContaMT.CmeCadastroInsert(Sender: TObject);
begin

  Inherited;

  Cds.FieldByName('IDPESSOA').AsFloat    := Sistema.IdEmpresa;
  Cds.FieldByName('CODSUBCONTA').AsFloat := CtrlSubConta.LeUltimoRegSubConta(Sistema.IdEmpresa) + 1;
  Cds.FieldByName('IDPESSOA').AsFloat    := Sistema.idEmpresa;

  lblUltima.Caption := FloatToStr(CtrlSubConta.LeUltimoRegSubConta(Sistema.IdEmpresa));

  dbrSubConta.SetFocus;

end;

procedure TfrmCadSubContaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if dbrSubConta.CanFocus then
      dbrSubConta.SetFocus;

end;

procedure TfrmCadSubContaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    //Se houve busca na base principal apenas com o registro buscado
    Cds.Data := CtrlSubConta.ListSubConta(sistema.idEmpresa,StrToFloat(MontaSelect.ValoresChave[0]));
  End;


end;


procedure TfrmCadSubContaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContaContabil.Free;
  CtrlSubConta.Free;
end;

procedure TfrmCadSubContaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
 Cds.Data := CtrlSubConta.ListSubConta(sistema.idEmpresa,Cds.FieldByName('CODSUBCONTA').asFloat);

end;

procedure TfrmCadSubContaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
    If (trim(dbrSubConta.Text) = '') or (trim(dbrSubConta.Text) = '0') Then
    Begin
       MsgDlg('Código da Sub-Conta não informado.','Erro',mtError,[mbOk],0);
       If dbrSubConta.CanFocus Then
           dbrSubConta.SetFocus;
      Accept := False;
    End;

    If (dbeNomeSubConta.Text = '') Then
    Begin
       MsgDlg('Nome da Sub-Conta não informado.','Erro',mtError,[mbOk],0);
       If dbeNomeSubConta.CanFocus Then
          dbeNomeSubConta.SetFocus;
      Accept := False;
    End;
    bAssociaContas := False;
    if MsgDlg('Relaciona esta SubConta com Todas as Contas?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
       bAssociaContas := True;
  End;

end;

procedure TfrmCadSubContaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlSubConta.Gravar(Sistema.idUsuario,false);
end;

procedure TfrmCadSubContaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlSubConta.Gravar(Sistema.idUsuario,bAssociaContas);

end;

procedure TfrmCadSubContaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlSubConta.Gravar(Sistema.idUsuario,bAssociaContas);

end;

procedure TfrmCadSubContaMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlSubConta.MessageInfo <> '' Then
     MsgDlg(CtrlSubConta.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadSubContaMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlSubConta.ListSubconta(-1,-1);

end;

end.
