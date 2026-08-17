unit FCadHistoricoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, Mask, wwdbedit, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uCtrlHistoContab, uCMTypes;


type
  TfrmCadHistoricoMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dbeCodigo: TwwDBEdit;
    Label2: TLabel;
    memHistPadrao: TDBMemo;
    Label3: TLabel;
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    CtrlHistoContab  :TCtrlHistoContab;
 
  public
    { Public declarations }
  end;

var
  frmCadHistoricoMT: TfrmCadHistoricoMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo;

{$R *.DFM}


procedure TfrmCadHistoricoMT.CmeCadastroDelete(Sender: TObject);
begin
   If CtrlHistoContab.HistoTemLancamento(Sistema.Idempresa,Trim(MontaSelect.ValoresChave[0])) Then
   Begin
      MsgDlg('Este Histórico não pode ser excluído.','Erro',mtError,[mbOk, mbHelp], 0);
      Exit;
   End;

   inherited;

end;

procedure TfrmCadHistoricoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if dbeCodigo.CanFocus then
      dbeCodigo.SetFocus;

end;

procedure TfrmCadHistoricoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  If MontaSelect.RetornouValor Then
  Begin
    Cds.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,MontaSelect.ValoresChave[0])
  End;

end;

procedure TfrmCadHistoricoMT.CmeCadastroInsert(Sender: TObject);
begin
	inherited;
  Cds.FieldByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
  dbeCodigo.SetFocus;

end;

procedure TfrmCadHistoricoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlHistoContab.CdsHistoContab := Cds;
  Cds.Data := CtrlHistoContab.ListHistoContab(-1,tohCodigo,'');
  MontaSelect.Filtro.Add('HISTOPADRAO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

end;

procedure TfrmCadHistoricoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlHistoContab.Free;
end;



procedure TfrmCadHistoricoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
  Cds.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,Cds.FieldByName('HITCODHIST').AsString)

end;

procedure TfrmCadHistoricoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlHistoContab.Gravar;
end;

procedure TfrmCadHistoricoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlHistoContab.Gravar;

end;

procedure TfrmCadHistoricoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlHistoContab.Gravar;

end;

procedure TfrmCadHistoricoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin

     If (dbeCodigo.Text = '') Then
     Begin
         MsgDlg('Código do Histórico não informado.','Aviso',mtWarning,[mbOk],0);
         if dbeCodigo.CanFocus Then
            dbeCodigo.SetFocus;
         Accept := False;
     End;

     If (memHistPadrao.Text = '') Then
     Begin
         MsgDlg('Descrição do Histórico Padrão não informada.','Aviso',mtWarning,[mbOk],0);
         If memHistPadrao.CanFocus Then
            memHistPadrao.SetFocus;
         Accept := False;
     End;

  End;

end;

procedure TfrmCadHistoricoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlHistoContab.MessageInfo <> '' Then
     MsgDlg(CtrlHistoContab.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadHistoricoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlHistoContab.ListHistoContab(-1,tohCodigo,'');

end;

end.
