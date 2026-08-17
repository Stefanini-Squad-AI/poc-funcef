unit fMTCadLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, 
  Mask, wwdbedit, wwdblook, ComCtrls, CMTree, uCMTreeViewMT, DBCtrls,
  uCtrlLocalizacoes, uCtrlTipoArea, uCtrlCentroCusto, uCtrlResponsavel;

type
  TfrmMTCadLocalizacao = class(TFrmCadastroMT)
    lblNome: TLabel;
    dbeNome: TwwDBEdit;
    Label2: TLabel;
    dbeEndereco: TwwDBEdit;
    MSResponsavel: TMontaSelect;
    lblArea: TLabel;
    dblcTipoArea: TwwDBLookupCombo;
    Label1: TLabel;
    dbeResponsavel: TwwDBEdit;
    spdSelResponsavel: TBitBtn;
    gbDescrCCusto: TGroupBox;
    lbDescCentroCusto: TLabel;
    dbeCentroCusto: TwwDBEdit;
    spdCentroCusto: TBitBtn;
    gbxSaidaTemp: TGroupBox;
    pnlTreeCentroCusto: TPanel;
    cdsCentroCusto: TCMClientDataSet;
    cdsTipoArea: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    treeCentroCusto: TCMTreeViewMT;
    dsResponsavel: TwwDataSource;
    ckbSaidaTemp: TDBCheckBox;
    dsCentroCusto: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure spdSelResponsavelClick(Sender: TObject);
    procedure spdCentroCustoClick(Sender: TObject);
    procedure treeCentroCustoDblClick(Sender: TObject);
    procedure treeCentroCustoExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    Localizacao : TCtrlLocalizacoes;
    Responsavel : TCtrlResponsavel;
    CentroCusto : TCtrlCentroCusto;
    TipoArea    : TCtrlTipoArea;
    Procedure SelLocalizacao(fIdLocalizacao, fIdPessoa : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadLocalizacao: TfrmMTCadLocalizacao;

implementation

{$R *.DFM}

Uses uMensErro,dBasedados, uSistema, uIntegraBack;

procedure TfrmMTCadLocalizacao.FormCreate(Sender: TObject);
begin
   inherited;
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   Localizacao.cds := cds;
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsResponsavel.Data := Responsavel.ListaResponsavel(0);  // -1 - Total, 0 - Nenhum
   //-------------------------------------------------------------------------------------
   CentroCusto := TCtrlCentroCusto.Create;
   CentroCusto.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   TipoArea := TCtrlTipoArea.Create;
   TipoArea.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsTipoArea.Data    := TipoArea.ListaTipoArea;
   //-------------------------------------------------------------------------------------
   treeCentroCusto.Mascara := IntegraBack.MascaraCC;
   cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,1);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('LOCALIZACAO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   SelLocalizacao(-1,Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   pnltreeCentroCusto.Enabled := False;
   lbDescCentroCusto.Caption := '';
   treeCentroCusto.MontaArvore;
end;

procedure TFrmMTCadLocalizacao.SelLocalizacao(fIdLocalizacao, fIdPessoa : Extended);
begin
   cds.Data := Localizacao.Procurar(fIdLocalizacao,fIdPessoa);
   TFloatField(cds.FieldByName('CODCENTROCUSTO')).EditMask := IntegraBack.MascaraCC + ';0;_';
   //-------------------------------------------------------------------------------------
   cdsResponsavel.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
   if cdsCentroCusto.Locate('CODCENTROCUSTO;IDEMPRESA',
                            VarArrayOf([cds.FieldByName('CODCENTROCUSTO').AsString,
                                        cds.FieldByName('IDEMPRESA').AsInteger]),[]) then
   begin
      lbDescCentroCusto.Caption := cdsCentroCusto.FieldByName('NOME').AsString;
   end else
   begin
      cdsCentroCusto.First;
      treeCentroCusto.FullCollapse;
      lbDescCentroCusto.Caption := '';
   end;
end;

procedure TfrmMTCadLocalizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Localizacao.Free;
   Responsavel.Free;
   CentroCusto.Free;
   TipoArea.Free
end;

procedure TfrmMTCadLocalizacao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Localizacao.AplicaOperacao;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Localizacao.AplicaOperacao;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Localizacao.AplicaOperacao;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(Localizacao.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadLocalizacao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelLocalizacao(strtofloat(MontaSelect.ValoresChave[0]),Sistema.IdEmpresa);
end;

procedure TfrmMTCadLocalizacao.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
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
   pnltreeCentroCusto.Enabled := not pnltreeCentroCusto.Enabled;
   if pnltreeCentroCusto.Enabled then
      pnltreeCentroCusto.SetFocus;
end;

procedure TfrmMTCadLocalizacao.treeCentroCustoDblClick(Sender: TObject);
begin
   inherited;
   if cdsCentroCusto.FieldByName('STATUSGRUPOCDC').asString = 'A' then
   begin
      pnlTreeCentroCusto.Enabled := False;
      dbeCentroCusto.SetFocus;
   end;
end;

procedure TfrmMTCadLocalizacao.treeCentroCustoExit(Sender: TObject);
begin
   inherited;
   pnlTreeCentroCusto.Enabled := False;
   cds.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
   cds.FieldByName('IDEMPRESA').AsInteger     := cdsCentroCusto.FieldByName('IDEMPRESA').AsInteger;
   lbDescCentroCusto.Caption := cdsCentroCusto.FieldByName('NOME').AsString;
   dbeCentroCusto.SetFocus;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroInsert(Sender: TObject);
begin
   SelLocalizacao(-1,Sistema.IdEmpresa);
   inherited;
   cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
end;

procedure TfrmMTCadLocalizacao.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;
begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelLocalizacao(-1,Sistema.IdEmpresa);
end;

end.


