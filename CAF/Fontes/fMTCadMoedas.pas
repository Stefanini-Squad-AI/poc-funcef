unit fMTCadMoedas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti,   
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, uCMTypes, uCtrlPadroes,
  uCtrlMoeda, uCtrlCAFMoedas, wwdblook, uCmSqlParams, IvEMulti;

type
  TfrmMTCadMoedas = class(TFrmCadastroMT)
    cdsMoeda: TCMClientDataSet;
    dbcMoeda: TwwDBLookupCombo;
    Label1: TLabel;
    cmbTipoMoeda: TComboBox;
    Label2: TLabel;
    cdsBem: TCMClientDataSet;
    sqlBem: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CafMoedas : TCtrlCafMoedas;
    Moeda     : TCtrlMoeda;
    //------------------------------------------------------------------------------------
    Procedure SelCafMoedas(fIdPessoa, fMoeCodigo : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadMoedas: TfrmMTCadMoedas;

implementation

{$R *.DFM}

Uses uMensErro, uSistema;

procedure TfrmMTCadMoedas.FormCreate(Sender: TObject);
begin
   inherited;
   CafMoedas := TCtrlCafMoedas.Create;
   CafMoedas.InitializeAs(Padroes);
   CafMoedas.cds := cds;
   //-------------------------------------------------------------------------------------
   Moeda := TCtrlMoeda.Create;
   Moeda.InitializeAs(Padroes);
   cdsMoeda.Data := Moeda.ListaMoeda;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CAFMOEDAS.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   SelCafMoedas(Sistema.IdEmpresa, 0);
end;

procedure TfrmMTCadMoedas.FormShow(Sender: TObject);
begin
   inherited;
   sqlBem.Prepare;
   sqlBem.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlBem.Open;
   if not cdsBem.IsEmpty then
   begin
      MsgDlg('Este cadastro só pode ser usado durante a implantação do sistema,' + #13 +
             'antes do início do Cadastramento dos Bens', 'Erro', mtError, [mbOK], 0);
      bbtnSair.Click;
   end;
end;

procedure TfrmMTCadMoedas.SelCafMoedas(fIdPessoa, fMoeCodigo : Extended);
begin
   cds.Data := CafMoedas.Procurar(fIdPessoa, fMoeCodigo);
   cmbTipoMoeda.ItemIndex := cds.FieldByName('IDTIPOMOEDA').AsInteger - 1;
end;

procedure TfrmMTCadMoedas.CmeCadastroApplyInsert(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CafMoedas.AplicaOperacao;
   SelCafMoedas(Sistema.IdEmpresa, 0);
end;

procedure TfrmMTCadMoedas.CmeCadastroApplyDelete(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CafMoedas.AplicaOperacao;
   SelCafMoedas(Sistema.IdEmpresa, 0);
end;

procedure TfrmMTCadMoedas.CmeCadastroApplyEdit(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CafMoedas.AplicaOperacao;
end;

procedure TfrmMTCadMoedas.CmeCadastroAbortConfirma(Sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(CafMoedas.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadMoedas.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelCafMoedas(strtofloat(MontaSelect.ValoresChave[2]),strtofloat(MontaSelect.ValoresChave[1]));
end;

procedure TfrmMTCadMoedas.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   sTipoOperacao : String;

begin
   Accept := True;
   if cds.State in [dsInsert,dsEdit] then
   begin
      if cds.State = dsInsert then
         sTipoOperacao := 'I'
      else
         sTipoOperacao := 'A';
      //----------------------------------------------------------------------------------
      if dbcMoeda.Text = '' then
      begin
         MsgDlg('Selecione a Moeda!','Erro',mtError,[mbOK],0);
         Accept := False;
      end;
      //----------------------------------------------------------------------------------
      if cmbTipoMoeda.Text = '' then
      begin
         MsgDlg('Selecione a Tipo da Moeda!','Erro',mtError,[mbOK],0);
         Accept := False;
      end;
      //----------------------------------------------------------------------------------
      if not CAFMoedas.VerificaCafMoeda(Sistema.IdEmpresa,
                                        cdsMoeda.FieldByName('MOECODIGO').AsFloat,
                                        (cmbTipoMoeda.ItemIndex + 1), sTipoOperacao) then
      begin
         MsgDlg(CafMoedas.MessageInfo,'Erro',mtError,[mbOK],0);
         Accept := False;
      end;
      //----------------------------------------------------------------------------------
      cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      cds.FieldByName('IDTIPOMOEDA').AsFloat := cmbTipoMoeda.ItemIndex + 1;
   end;
end;

procedure TfrmMTCadMoedas.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;

procedure TfrmMTCadMoedas.FormClose(Sender: TObject; Var Action: TCloseAction);
begin
   inherited;
   CafMoedas.Free;
   Moeda.Free;
end;

end.

