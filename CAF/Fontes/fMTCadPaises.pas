unit fMTCadPaises;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCmSqlParams, wwdblook,
  DBCtrls, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, wwdbedit,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlCAFPaises, IvEMulti;

type
  TfrmMTCadPaises = class(TFrmCadastroMT)
    cdsMoeda: TCMClientDataSet;
    dbcMoeda: TwwDBLookupCombo;
    Label1: TLabel;
    cdsGrupo: TCMClientDataSet;
    sqlGrupo: TCMSqlParams;
    dbcmbPais: TwwDBLookupCombo;
    cdsPais: TCMClientDataSet;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    dbcbFlgContabil: TDBCheckBox;
    GroupBox1: TGroupBox;
    dbcbFlgMultiTaxa: TDBCheckBox;
    sqlPais: TCMSqlParams;
    cdsCAFMoedaOficial: TCMClientDataSet;
    sqlCAFMoedaOficial: TCMSqlParams;
    cdsSeqCAFPaises: TCMClientDataSet;
    sqlSeqCAFPaises: TCMSqlParams;
    cdsSrcCAFPaises: TCMClientDataSet;
    sqlSrcCAFPaises: TCMSqlParams;
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
    procedure dbcmbPaisChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    CafPaises : TCtrlCafPaises;
    ParamCAF  : TCtrlParamCAF;
    //------------------------------------------------------------------------------------
    procedure SelCafPaises(fIdPessoa, fCafPaises : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadPaises: TfrmMTCadPaises;

implementation

{$R *.DFM}

Uses uMensErro, uSistema;

procedure TfrmMTCadPaises.FormCreate(Sender: TObject);
begin
   inherited;
   CafPaises := TCtrlCafPaises.Create;
   CafPaises.InitializeAs(Padroes);
   CafPaises.cds := cds;
   sqlPais.Open;
   cdsMoeda.Data := CafPaises.ListaCafMoedas(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
   begin
      MsgDlg('Parâmetros do sistema inválidos!' + #13 + ParamCAF.MessageInfo,
             'Erro',mtError,[mbOK],0);
      bbtnSair.Click;
   end;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CAFPAISES.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   SelCafPaises(Sistema.IdEmpresa, 0);
end;

procedure TfrmMTCadPaises.FormShow(Sender: TObject);
begin
   inherited;
   sqlGrupo.Prepare;
   sqlGrupo.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlGrupo.Open;
   if not cdsGrupo.IsEmpty then
   begin
      MsgDlg('Este cadastro só pode ser usado durante a implantação do sistema,' + #13 +
             'antes do início do Cadastramento dos Grupos Contábeis', 'Erro', mtError, [mbOK], 0);
      bbtnSair.Click;
   end;
end;

procedure TfrmMTCadPaises.SelCafPaises(fIdPessoa, fCafPaises : Extended);
begin
   cds.Data := CafPaises.ListaCafPaises(fIdPessoa, fCAFPaises)
end;

procedure TfrmMTCadPaises.CmeCadastroInsert(Sender: TObject);
var
   iSeq, iMoeCodigo: Integer;
begin
   inherited;
   sqlSeqCAFPaises.Prepare;
   sqlSeqCAFPaises.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   sqlSeqCAFPaises.Open;
   if cdsSeqCAFPaises.IsEmpty or (cdsSeqCAFPaises.FieldByName('QTD').AsInteger = 0) then
   begin
      //----------------------------------------------------------------------------------
      // Se o Cadastro estiver Vazio, inicializar com os dados do País de Origem
      //----------------------------------------------------------------------------------
      sqlCAFMoedaOficial.Prepare;
      sqlCAFMoedaOficial.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      sqlCAFMoedaOficial.Open;
      if cdsCAFMoedaOficial.IsEmpty then
      begin
         MsgDlg('Cadastre a Moeda Oficial em MOEDAS USADAS NO SISTEMA!',
                'Erro', mtError, [mbOK], 0);
         bbtnSair.Click;
      end;
      iMoeCodigo := cdsCAFMoedaOficial.FieldByName('MOECODIGO').AsInteger;
      //----------------------------------------------------------------------------------
      cds.FieldByName('IDCAFPAISES').AsInteger := 1;
      cds.FieldByName('IDPAIS').AsInteger := ParamCAF.IDPAIS;
      cds.FieldByName('MOECODIGO').AsInteger := iMoeCodigo;
      cds.FieldByName('FLGCONTABIL').AsInteger := 1;
      //----------------------------------------------------------------------------------
      cdsCAFMoedaOficial.Close;
   end else
   begin
      //----------------------------------------------------------------------------------
      // Avança para o próximo sequence válido
      //----------------------------------------------------------------------------------
      iSeq := 1;
      repeat
         iSeq := iSeq + 1;
         cdssrcCAFPaises.Close;
         sqlsrcCAFPaises.Prepare;
         sqlsrcCAFPaises.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         sqlsrcCAFPaises.ParamByName('IDCAFPAISES').AsInteger := iSeq;
         sqlsrcCAFPaises.Open;
      until cdssrcCAFPaises.IsEmpty;
      cds.FieldByName('IDCAFPAISES').AsInteger := iSeq;
      //----------------------------------------------------------------------------------
      cdssrcCAFPaises.Close;
   end;
   cdsSeqCAFPaises.Close;
   Application.ProcessMessages;
end;

procedure TfrmMTCadPaises.CmeCadastroApplyInsert(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CafPaises.AplicaOperacao('E');
   SelCafPaises(Sistema.IdEmpresa, 0);
end;

procedure TfrmMTCadPaises.CmeCadastroApplyDelete(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CafPaises.AplicaOperacao('R');
   SelCafPaises(Sistema.IdEmpresa, 0);
end;

procedure TfrmMTCadPaises.CmeCadastroApplyEdit(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CafPaises.AplicaOperacao('A');
end;

procedure TfrmMTCadPaises.CmeCadastroAbortConfirma(Sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(CafPaises.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadPaises.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelCafPaises(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadPaises.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
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
      if dbcmbPais.Text = '' then
      begin
         MsgDlg('Selecione o País!','Erro',mtError,[mbOK],0);
         Accept := False;
      end;
      //----------------------------------------------------------------------------------
      if dbcMoeda.Text = '' then
      begin
         MsgDlg('Selecione a Moeda Corrente do País!' + #13 +
                'Ela deve estar cadastrada nas Moedas Usadas pelo Sistema',
                'Erro',mtError,[mbOK],0);
         Accept := False;
      end;
      //----------------------------------------------------------------------------------
      if not CAFPaises.VerificaPais(Sistema.IdEmpresa,
                                    cdsPais.FieldByName('IDPAIS').AsFloat,
                                    sTipoOperacao) then
      begin
         MsgDlg(CAFPaises.MessageInfo, 'Erro', mtError, [mbOK], 0);
         Accept := False;
      end;
      //----------------------------------------------------------------------------------
      cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   end;
end;

procedure TfrmMTCadPaises.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
end;

procedure TfrmMTCadPaises.FormClose(Sender: TObject; Var Action: TCloseAction);
begin
   inherited;
   CafPaises.Free;
   ParamCAF.Free;
end;

procedure TfrmMTCadPaises.dbcmbPaisChange(Sender: TObject);
begin
   inherited;
   if cdsPais.FieldByName('IDPAIS').AsInteger = ParamCAF.IDPAIS then
   begin
      sqlCAFMoedaOficial.Prepare;
      sqlCAFMoedaOficial.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      sqlCAFMoedaOficial.Open;
      if cdsCAFMoedaOficial.IsEmpty then
      begin
         MsgDlg('Cadastre a Moeda Oficial em MOEDAS USADAS NO SISTEMA!',
                'Erro', mtError, [mbOK], 0);
         bbtnSair.Click;
      end else
      begin
         cdsMoeda.Locate('MOECODIGO', cdsCAFMoedaOficial.FieldByName('MOECODIGO').AsInteger, []);
      end;
      cdsCAFMoedaOficial.Close;
   end;
end;

end.

