unit fFormaRecPagMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlFormaRecPag, uCMTypes;

type
  TfrmFormaRecPagMT = class(TFrmCadastroMT)
    lblFormaRecPag: TLabel;
    dbedFormaRecPag: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    CtrlFormaRecPag : TCtrlFormaRecPag;
  public
    { Public declarations }
  end;

var
  frmFormaRecPagMT: TfrmFormaRecPagMT;

implementation

uses uMensErro,DBaseDados, uDataBase, uCtrlParamIntegra, uSistema;

{$R *.DFM}

procedure TfrmFormaRecPagMT.FormCreate(Sender: TObject);
begin
  If ParamIntegra.RecPag = 'R' Then
  begin
    Caption               := 'Tipo de Cobrança';
    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40068;
    bbtnAjuda.HelpContext := 40068;
  end
  Else
  begin
    Caption               := 'Forma de Pagamento';
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30048; //30060;
    bbtnAjuda.HelpContext := 30048; //30060;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  end;

  CtrlFormaRecPag := TCtrlFormaRecPag.Create;
  CtrlFormaRecPag.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlFormaRecPag.cds := cds;
  //
  cds.data := CtrlFormaRecPag.ListFormaRecPag(0,-1);
  inherited;
  MontaSelect.Filtro.Add('FORMARECPAG.RECPAG = ''' +  ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('FORMARECPAG.IDPESSOA = ' + IntToStr(Sistema.idEmpresa)) ;
end;

procedure TfrmFormaRecPagMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.fieldbyname('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
  cds.fieldbyname('IDPESSOA').AsInteger          := Sistema.idEmpresa;
  cds.fieldbyname('RECPAG').AsString             := ParamIntegra.RecPag ;
  cds.fieldbyname('FLGDADOSBANCARIOS').AsString  := 'N';
  dbedFormaRecPag.setfocus;
end;

procedure TfrmFormaRecPagMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedFormaRecPag.setfocus;
end;

procedure TfrmFormaRecPagMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     cds.data := CtrlFormaRecPag.listFormaRecPag(0,StrToIntDef(MontaSelect.ValoresChave[0],0));
end;

procedure TfrmFormaRecPagMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
CtrlFormaRecPag.free;
end;

procedure TfrmFormaRecPagMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlFormaRecPag.GravarFormaRecPag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmFormaRecPagMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlFormaRecPag.GravarFormaRecPag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmFormaRecPagMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlFormaRecPag.GravarFormaRecPag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmFormaRecPagMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var sforma : string;
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
     //Faz a verificação do preenchimento dos campos
     if dbedFormaRecPag.Text  = ''  then
     begin
        If ParamIntegra.RecPag = 'P' Then sForma := 'Pagamento'
        Else sForma := 'Recebimento';
        MsgDlg('Favor indicar a Formade de ' + sForma,'Aviso',mtError,[mbOk],0);
        dbedFormaRecPag.SetFocus;
        accept := false;
     end;
  End;
end;

procedure TfrmFormaRecPagMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlFormaRecPag.MessageInfo <> '' Then
     MsgDlg(CtrlFormaRecPag.MessageInfo,'Erro',mtError,[mbOK],0);
end;

end.
