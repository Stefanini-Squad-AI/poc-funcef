{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 3.02.14
Pendência   : 24037 / 24038
Responsável : Daniel Simões
Data        : 26/12/2006
Descrição   : Acerto na exibição do Centro de Custo no formulário Cadastro de
              Localizações ( fMTCadLocalizacao ). Substituição do campo
              CODCENTCUSTO pelo campo CODEXTERNO na sua exibição na tela...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fMTCadLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, 
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  Mask, wwdbedit, wwdblook, ComCtrls, CMTree, uCMTreeViewMT, DBCtrls,
  uCtrlLocalizacoes, uCtrlTipoArea, uCtrlResponsavel, uCtrlPadroes,
  uCmSqlParams, IvEMulti;

type
  TfrmMTCadLocalizacao = class(TFrmCadastroMT)
    lblNome: TLabel;
    dbeNome: TwwDBEdit;
    Label2: TLabel;
    MSResponsavel: TMontaSelect;
    Label1: TLabel;
    dbeResponsavel: TwwDBEdit;
    spdSelResponsavel: TBitBtn;
    cdsCentroCusto: TCMClientDataSet;
    cdsTipoArea: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    dsResponsavel: TwwDataSource;
    dsCentroCusto: TwwDataSource;
    dbmEndereco: TDBMemo;
    Panel1: TPanel;
    ckbSaidaTemp: TDBCheckBox;
    MSCentroCusto: TMontaSelect;
    dbrgInativo: TDBRadioGroup;
    spdCentroCusto: TBitBtn;
    dbeCentroCusto: TwwDBEdit;
    Label3: TLabel;
    dblcTipoArea: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    sqlCentroCusto: TCMSqlParams;
    cdsCentroCustoCODCENTROCUSTO: TStringField;
    cdsCentroCustoCODEXTERNO: TStringField;
    cdsCentroCustoIDEMPRESA: TFloatField;
    cdsCentroCustoNOME: TStringField;
    cdsCentroCustoNOMECCUSTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure spdSelResponsavelClick(Sender: TObject);
    procedure spdCentroCustoClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    Localizacao : TCtrlLocalizacoes;
    Responsavel : TCtrlResponsavel;
    TipoArea    : TCtrlTipoArea;
    Procedure SelLocalizacao(fIdLocalizacao, fIdPessoa : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadLocalizacao: TfrmMTCadLocalizacao;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uCtrlParamIntegra ;

procedure TfrmMTCadLocalizacao.FormCreate(Sender: TObject);
begin
   inherited;
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   Localizacao.cds := cds;
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   cdsResponsavel.Data := Responsavel.ListaResponsavel(0);  // -1 - Total, 0 - Nenhum
   //-------------------------------------------------------------------------------------
   TipoArea := TCtrlTipoArea.Create;
   TipoArea.InitializeAs(Padroes);
   cdsTipoArea.Data := TipoArea.ListaTipoArea;
   //-------------------------------------------------------------------------------------
   SelLocalizacao(-2,Sistema.IdEmpresa);
   MontaSelect.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSResponsavel.Filtro.Add('RESPONSAVEL.FLGATIVOFIXO = 1');
   MSCentroCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   MSCentroCusto.Filtro.Add('CENTCUST.ATIVO = '+#39+'S'+#39);
end;

procedure TFrmMTCadLocalizacao.SelLocalizacao(fIdLocalizacao, fIdPessoa : Extended);
begin
   // Daniel - 24037 / 24038
   cds.Data := Localizacao.ListaLocalizacao(fIdPessoa,fIdLocalizacao);
   //cds.Data := Localizacao.Procurar(fIdLocalizacao, fIdPessoa);

   TFloatField(cds.FieldByName('CODCENTROCUSTO')).EditMask := ParamIntegra.MascaraCC + ';0;_';
   //-------------------------------------------------------------------------------------
   cdsResponsavel.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
   //-------------------------------------------------------------------------------------
   cdsCentroCusto.Close;
   sqlCentroCusto.Prepare;
   sqlCentroCusto.ParamByName('CODCENTROCUSTO').AsString := cds.FieldByName('CODCENTROCUSTO').AsString;
   sqlCentroCusto.ParamByName('IDEMPRESA').AsFloat := cds.FieldByName('IDEMPRESA').AsFloat;
   sqlCentroCusto.Open;
end;

procedure TfrmMTCadLocalizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Localizacao.Free;
   Responsavel.Free;
   TipoArea.Free
end;

procedure TfrmMTCadLocalizacao.CmeCadastroEdit(Sender: TObject);
begin
   if Localizacao.ConjuntosnaLocalizacao(cds.FieldByName('IDPESSOA').AsFloat,
                                         cds.FieldByName('IDLOCALIZACAO').AsFloat) then
   begin
      dbrgInativo.Enabled := False;
      MsgDlg('Existem Conjuntos associados a Localização. Alteração Restrita',
             'Informação',mtInformation,[mbOK],0);
   end;
   inherited;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroDelete(Sender: TObject);
begin
   if not Localizacao.ConjuntosnaLocalizacao(cds.FieldByName('IDPESSOA').AsFloat,
                                             cds.FieldByName('IDLOCALIZACAO').AsFloat) then
   begin
      if Localizacao.TransfOK(cds.FieldByName('IDPESSOA').AsInteger,
                              cds.FieldByName('IDLOCALIZACAO').AsInteger) then
      begin
         inherited;
      end else
      begin
         MsgDlg('Localização registrada em Transferências. Coloque-a como Inativa!',
                'Erro', mtError, [mbOk], 0);
      end;
   end else
   begin
      MsgDlg(Localizacao.MessageInfo, 'Erro', mtError, [mbOK], 0);
   end;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Localizacao.AplicaOperacao('R');
end;

procedure TfrmMTCadLocalizacao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Localizacao.AplicaOperacao('E');
end;

procedure TfrmMTCadLocalizacao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Localizacao.AplicaOperacao('I');
end;

procedure TfrmMTCadLocalizacao.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if Localizacao.MessageInfo <> '' then
      MsgDlg(Localizacao.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadLocalizacao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelLocalizacao(strtofloat(MontaSelect.ValoresChave[0]),Sistema.IdEmpresa);
end;

procedure TfrmMTCadLocalizacao.spdSelResponsavelClick(Sender: TObject);
begin
   inherited;
   MSResponsavel.Executar;
   if MSResponsavel.RetornouValor then
   begin
      cdsResponsavel.Data := Responsavel.ListaResponsavel(strtofloat(MSResponsavel.ValoresChave[0]));
      cds.FieldByName('IDRESPONSAVEL').AsInteger := cdsResponsavel.FieldByName('IDRESPONSAVEL').AsInteger;
   end;
end;

procedure TfrmMTCadLocalizacao.spdCentroCustoClick(Sender: TObject);
begin
   inherited;
   MSCentroCusto.Executar;
   if MSCentroCusto.RetornouValor then
      if MSCentroCusto.ValoresChave[2] = 'A' then
      begin
         cdsCentroCusto.Close;
         sqlCentroCusto.Prepare;
         sqlCentroCusto.ParamByName('CODCENTROCUSTO').AsString := MSCentroCusto.ValoresChave[0];
         sqlCentroCusto.ParamByName('IDEMPRESA').AsFloat := strtofloat(MSCentroCusto.ValoresChave[1]);
         sqlCentroCusto.Open;
         //-------------------------------------------------------------------------------
         cds.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
         cds.FieldByName('IDEMPRESA').AsFloat := cdsCentroCusto.FieldByName('IDEMPRESA').AsFloat;

         // Daniel - 24038
         cds.FieldByName('CODEXTERNO').AsString := cdsCentroCusto.FieldByName('CODEXTERNO').AsString;
      end;
   Application.ProcessMessages;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroInsert(Sender: TObject);
begin
   SelLocalizacao(-2,Sistema.IdEmpresa);
   inherited;
   cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   cds.FieldByName('INATIVO').AsInteger := 0;
   cds.FieldByName('FLGLOCSAITEMP').AsInteger := 0;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := True;
   //-------------------------------------------------------------------------------------
   if trim(dbeNome.Text) = '' then
   begin
      MsgDlg('Descrição da Localização não foi informada!','Erro',mtError,[mbOK],0);
      dbeNome.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeResponsavel.Text) = '' then
   begin
       MsgDlg('Responsável não foi informado!','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeCentroCusto.Text) = '' then
   begin
       MsgDlg('Centro de Custo não foi informado!','Erro',mtError,[mbOK],0);
       spdCentroCusto.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dblcTipoArea.Text) = '' then
   begin
       MsgDlg('Tipo de Área não foi informada!','Erro',mtError,[mbOK],0);
       dblcTipoArea.SetFocus;
       Accept := False;
   end;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelLocalizacao(-1,Sistema.IdEmpresa)
   else
   if OldOperacao = opAlterar then
      SelLocalizacao(cds.FieldByName('IDLOCALIZACAO').AsInteger,Sistema.IdEmpresa);
   dbrgInativo.Enabled := True;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   dbrgInativo.Enabled := True;
end;

end.


