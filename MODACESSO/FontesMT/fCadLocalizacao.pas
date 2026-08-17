unit fCadLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, Variants, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, ExtCtrls, Mask, wwdbedit, wwdblook, ComCtrls, CMTree, uCMTreeViewMT, DBCtrls,
  uCtrlLocalizacoes, uCtrlTipoArea, uCtrlListTerceirosRH, uCtrlResponsavel, uCtrlPadroes;

type
  TfrmCadLocalizacao = class(TFrmCadastroMT)
    MsResponsavel: TMontaSelect;
    cdsCentroCusto: TCMClientDataSet;
    cdsTipoArea: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    dsResponsavel: TwwDataSource;
    dsCentroCusto: TwwDataSource;
    lblNome: TLabel;
    dbeNome: TwwDBEdit;
    Label1: TLabel;
    dbeResponsavel: TwwDBEdit;
    spdSelResponsavel: TBitBtn;
    gbDescrCCusto: TGroupBox;
    dbeCentroCusto: TwwDBEdit;
    spdCentroCusto: TBitBtn;
    MSCentroCusto: TMontaSelect;
    edDescCentroCusto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure spdSelResponsavelClick(Sender: TObject);
    procedure spdCentroCustoClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlLocalizacao: TCtrlLocalizacoes;
    CtrlResponsavel: TCtrlResponsavel;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlTipoArea: TCtrlTipoArea;

    dIdLocalizacao: double;

    procedure SelLocalizacao(IdLocalizacao: double);
    function  GravarOperacao: boolean;
  end;

var
  frmCadLocalizacao: TfrmCadLocalizacao;

implementation

uses uMensErro, uSistema, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmCadLocalizacao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlLocalizacao := TCtrlLocalizacoes.Create;
  CtrlLocalizacao.InitializeAs(Padroes);
  CtrlLocalizacao.Cds := Cds;

  CtrlResponsavel := TCtrlResponsavel.Create;
  CtrlResponsavel.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create;
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlTipoArea := TCtrlTipoArea.Create;
  CtrlTipoArea.InitializeAs(Padroes);

  CdsResponsavel.Data := CtrlResponsavel.ListaResponsavel(0);  // -1 - Total, 0 - Nenhum
  CdsTipoArea.Data := CtrlTipoArea.ListaTipoArea;
  CdsCentroCusto.Data := CtrlListTerceirosRH.ListCCusto(Sistema.IdEmpresa);

  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('LOCALIZACAO.IDPESSOA       = ' +IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('LOCALIZACAO.IDTIPOAREA     = TIPOAREA.IDTIPOAREA');
  MontaSelect.Filtro.Add('LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO');
  MontaSelect.Filtro.Add('LOCALIZACAO.IDEMPRESA      = CENTCUST.IDEMPRESA');
  SelLocalizacao(-1);
end;

procedure TfrmCadLocalizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLocalizacao);
  FreeAndNil(CtrlResponsavel);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlTipoArea);
  inherited;
end;

procedure TfrmCadLocalizacao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    dIdLocalizacao := StrToFloat(MontaSelect.ValoresChave[0]);
    SelLocalizacao(dIdLocalizacao);
  end;
end;

procedure TfrmCadLocalizacao.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadLocalizacao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarOperacao;
end;

procedure TfrmCadLocalizacao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarOperacao;
end;

procedure TfrmCadLocalizacao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarOperacao;
end;

procedure TfrmCadLocalizacao.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert,dsEdit]) then
    dbeNome.SetFocus;
end;

procedure TfrmCadLocalizacao.spdSelResponsavelClick(Sender: TObject);
begin
  MsResponsavel.Executar;
  if (MsResponsavel.RetornouValor) then
  begin
    CdsResponsavel.Data := CtrlResponsavel.ListaResponsavel(
      StrToFloat(MsResponsavel.ValoresChave[0]));
    Cds.FieldByName('IDRESPONSAVEL').asFloat :=
      CdsResponsavel.FieldByName('IDRESPONSAVEL').asFloat;
  end;
end;

procedure TfrmCadLocalizacao.spdCentroCustoClick(Sender: TObject);
begin
  MsCentroCusto.Executar;
  if (MsCentroCusto.RetornouValor) then
  begin
    Cds.FieldByName('CODCENTROCUSTO').asString := MsCentroCusto.ValoresChave[0];
    Cds.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    edDescCentroCusto.Text := MsCentroCusto.ValoresChave[1];
  end;
end;

procedure TfrmCadLocalizacao.CmeCadastroInsert(Sender: TObject);
begin
  SelLocalizacao(-1);
  inherited;
  Cds.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
end;

procedure TfrmCadLocalizacao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (Cds.State = dsInsert) then
    dIdLocalizacao := -1
  else
    SelLocalizacao(dIdLocalizacao);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadLocalizacao.SelLocalizacao(IdLocalizacao: double);
begin
  Cds.Data := CtrlLocalizacao.Procurar(IdLocalizacao, Sistema.IdEmpresa);
  CdsResponsavel.Data := CtrlResponsavel.ListaResponsavel(Cds.FieldByName('IDRESPONSAVEL').asFloat);

  if (CdsCentroCusto.Locate('CODCENTROCUSTO', Cds.FieldByName('CODCENTROCUSTO').asString, [])) then
    edDescCentroCusto.Text := CdsCentroCusto.FieldByName('NOME').asString
  else
    edDescCentroCusto.Text := '';
end;

function TfrmCadLocalizacao.GravarOperacao: boolean;
begin
  Result := CtrlLocalizacao.AplicaOperacao;
  if not(Result) then
    raise Exception.Create(CtrlLocalizacao.MessageInfo);
end;

end.
