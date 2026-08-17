unit FCadServProdXItemMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE SERVICO/PRODUTO X ITEM  ( MT )
//
//      Módulo          :  Contratos e Projetos
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  11/08/2003
//      Data de Término :  12/08/2003
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, mObjeto, uCmSqlParams,
  uCtrlServProd, uCtrlServProdXItem, uCtrlListTercContratos, uCMTypes,
  CMProcuraMask, wwdblook, DBCtrls, mItem, uCtrlParamIntegra, uCtrlParamContrato;

type
  TfrmCadServProdxItemMT = class(TFrmCadastroMestreDetMT)
    molObjeto1: TmolObjeto;
    cdsDet: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    dbrgRegimePagamento: TDBRadioGroup;
    Label3: TLabel;
    dblcTipoRecDes: TwwDBLookupCombo;
    lblSubConta: TLabel;
    dblcSubConta: TwwDBLookupCombo;
    dbeContaContabil: TCMProcuraMaskContabil;
    cdsTipoRecDes: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    molItem1: TmolItem;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject;    var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject;    var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dbrgRegimePagamentoClick(Sender: TObject);
    procedure dblcTipoRecDesChange(Sender: TObject);
  private
    { Private declarations }
    CtrlServProd      : TCtrlServProd;
    CtrlServProdXItem : TCtrlServProdxItem;
    CtrlListTerc      : TCtrlListTercContratos;
    CtrlParamContrato : TCtrlParamContrato;

    procedure MensErroMT (sMessageInfo: string);
    procedure SelecionaMestreDetalhe(const iObjeto: Integer);
    function  VerificaPreenchimento: Boolean;
    function  VerificaPreenchimentoItem: Boolean;
    function  ExisteObjetoXItem: Boolean;

  public
    { Public declarations }
  end;

var
  frmCadServProdxItemMT: TfrmCadServProdxItemMT;

implementation

{$R *.DFM}
uses dBaseDados, uMensErro, uSistema, uGeralContrato;

procedure TfrmCadServProdxItemMT.FormCreate(Sender: TObject);
var cdsTemp : TCMClientDataSet;
begin
  inherited;
  // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlServProd      := TCtrlServProd.Create;
  CtrlServProdXItem := TCtrlServProdXItem.Create;
  CtrlListTerc      := TCtrlListTercContratos.Create;
  CtrlParamContrato := TCtrlParamContrato.Create;

  CtrlServProd.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          MensErroMT);
  CtrlServProdXItem.InitializeAs( CtrlServProd );
  CtrlListTerc.InitializeAs( CtrlServProd );
  CtrlParamContrato.InitializeAs( CtrlServProd );

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlServProdXItem.CdsObjetoxItem := CdsDet;

  // Carrega Combos
  cdsTipoRecDes.Data := CtrlListTerc.ListTipoRD(Sistema.IdEmpresa,'','A','S');
  cdsSubConta.Data   := CtrlListTerc.ListSubConta(Sistema.IdEmpresa, ParamIntegra.Plano, '');

  // Abre Vazio
  SelecionaMestreDetalhe( -2 );

  // Filtra consulta por empresa
  MontaSelect.Filtro.Add('O.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa));

  //Carrega Parâmetros do sistema de contratos
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := CtrlParamContrato.ListParamContrato( Sistema.IdEmpresa );
    if (cdsTemp.FieldByName('FLGTIPODESEMB').AsString = 'S') then begin
      dbeContaContabil.Enabled := False;
      lblSubConta.Enabled      := False;
      dblcSubConta.Enabled     := False;
    end else begin
      dbeContaContabil.Enabled := ParamIntegra.IntegraContab;
      lblSubConta.Enabled      := ParamIntegra.IntegraContab;
      dblcSubConta.Enabled     := ParamIntegra.IntegraContab;
    end;

    if ParamIntegra.IntegraContab then begin
      dbeContaContabil.Plano   := ParamIntegra.Plano;
      dbeContaContabil.Mascara := ParamIntegra.MascaraPlano;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmCadServProdxItemMT.MensErroMT(sMessageInfo: string);
begin
  MsgDlg(sMessageInfo, 'Aviso', mtWarning, [mbOk], 0);
end;


procedure TfrmCadServProdxItemMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlServProd );
  FreeAndNil( CtrlServProdXItem );
  FreeAndNil( CtrlListTerc );
  FreeAndNil( CtrlParamContrato );
  inherited;
end;


procedure TfrmCadServProdxItemMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     SelecionaMestreDetalhe( StrToInt(MontaSelect.ValoresChave[0]) );
  end;
end;

procedure TfrmCadServProdxItemMT.SelecionaMestreDetalhe(const iObjeto: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data    := CtrlServProd.ListServProd( Sistema.IdEmpresa, iObjeto );
  CdsDet.Data := CtrlServProdXItem.ListServProdXItem( Sistema.IdEmpresa, iObjeto, 0 );

  // Carrega os valores do Frame
  if iObjeto > 0 then begin
    molObjeto1.iObjeto := iObjeto;
    molObjeto1.sObjeto := cdsDet.FieldByName('NOMEOBJETO').AsString;
    molObjeto1.edtObjeto.Text := molObjeto1.sObjeto;
  end else begin
    molObjeto1.btnLimpaObjetoClick( Self );
  end;
end;

procedure TfrmCadServProdxItemMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );
  inherited;
end;

procedure TfrmCadServProdxItemMT.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlServProdXItem.AplicaServProdxItem;
end;

procedure TfrmCadServProdxItemMT.CmeCadastroApplyDelete(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  // Marca todos registros para exclusão
  cdsDet.First;
  while not cdsDet.Eof do cdsDet.Delete;

  Accept := CtrlServProdXItem.AplicaServProdxItem;
  if Accept then SelecionaMestreDetalhe( -2 );
end;

procedure TfrmCadServProdxItemMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadServProdxItemMT.VerificaPreenchimento: Boolean;
begin
  Result := True;
  if molObjeto1.iObjeto <= 0 then begin
    MsgDlg('Selecione um Serviço / Produto', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    Exit;
  end;
  if cdsDet.IsEmpty then begin
    MsgDlg('Insira um Item para o Serviço / Produto', 'Aviso', mtWarning, [mbOk], 0);
    Result := False;
    Exit;
  end;
end;

function TfrmCadServProdxItemMT.ExisteObjetoXItem: Boolean;
var cdsTemp : TCMClientDataSet;
begin
  try
    Result  := False;
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := CtrlServProdXItem.ListServProdXItem(Sistema.IdEmpresa, molObjeto1.iObjeto, 0);
    if not cdsTemp.IsEmpty then begin
      MsgDlg('Já Existem itens relacionados a este Serviço / Produto', 'Aviso', mtWarning, [mbOk], 0);
      Result := True;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmCadServProdxItemMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     SelecionaMestreDetalhe( molObjeto1.iObjeto );
end;

procedure TfrmCadServProdxItemMT.CmeDetalheConfirma(Sender: TObject);
begin
  // Valida a guia de Itens
  if cdsDet.State in dsEditModes then begin
    if VerificaPreenchimentoItem then begin
      cdsDet.FieldByName('IDOBJETO').AsInteger      := molObjeto1.iObjeto;
      cdsDet.FieldByName('IDITEM').AsInteger        := molItem1.iItem;
      cdsDet.FieldByName('NOME_ITEM').AsString      := molItem1.sItem;
      cdsDet.FieldByName('DESC_TIPRECDES').AsString := dblcTipoRecDes.Text;
      inherited;
    end;
  end else inherited;
end;

function TfrmCadServProdxItemMT.VerificaPreenchimentoItem: Boolean;
begin
  Result := False;
  if molItem1.iItem <= 0 then begin
    MsgDlg('Selecione um item para o Serviço / Produto', 'Aviso', mtWarning, [mbOk], 0);
    molItem1.btnBuscaItem.SetFocus;
    Exit;
  end;

  if dbrgRegimePagamento.ItemIndex < 0 then begin
    MsgDlg('Selecione o Regime de Pagamento', 'Aviso', mtWarning, [mbOk], 0);
    dbrgRegimePagamento.SetFocus;
    Exit;
  end;

  if ParamIntegra.IntegraContab then begin
    if dbeContaContabil.Valida <> VcOK then begin
      MsgDlg('Conta Contábil Inválida', 'Aviso', mtWarning, [mbOk], 0);
      dbeContaContabil.CanFocus;
      Exit;
    end;

    if (dbeContaContabil.Conta.ObrigaSubConta) and (Trim(dblcSubConta.Text) = '') then begin
      MsgDlg('Obrigatório preencher a SubConta', 'Aviso', mtWarning, [mbOk], 0);
      dblcSubConta.CanFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmCadServProdxItemMT.sbtnInsDetClick(Sender: TObject);
begin
  if cds.State = dsInsert then begin
    if molObjeto1.iObjeto <= 0 then begin
      MsgDlg('Selecione um Serviço / Produto', 'Aviso', mtWarning, [mbOk], 0);
      sbtnInsDet.Down := False;
      Exit;
    end;
    if not ExisteObjetoXItem then inherited
       else sbtnInsDet.Down := False;
  end else begin
    inherited;
  end;
end;


procedure TfrmCadServProdxItemMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  // Carrega dados no Frame de itens para edição
  molItem1.iItem := cdsDet.FieldByName('IDITEM').AsInteger;
  molItem1.sItem := cdsDet.FieldByName('NOME_ITEM').AsString;
  molItem1.edtItem.Text := molItem1.sItem;

  cdsDet.FieldByName('RECPAG').AsString := 'P';//Bruno Bastos - 01/11/2004
  cdsDet.FieldByName('PLANO').AsFloat   := ParamIntegra.Plano;//Bruno Bastos - 01/11/2004

  // Filtra o Tipo de Recebimento / Desembolso
  cdsTipoRecDes.Filtered := False;
  cdsTipoRecDes.Filter   := 'RECPAG = ''' + cdsDet.FieldByName('RECPAG').AsString + '''';
  cdsTipoRecDes.Filtered := True;
end;

procedure TfrmCadServProdxItemMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  // Carrega Valores default
  molItem1.btnLimpaItemClick( Self );
  cdsDet.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  cdsDet.FieldByName('RECPAG').AsString  := 'P';
  cdsDet.FieldByName('PLANO').AsFloat    := ParamIntegra.Plano;

  // Filtra o Tipo de Recebimento / Desembolso
  cdsTipoRecDes.Filtered := False;
  cdsTipoRecDes.Filter   := 'RECPAG = ''P''';
  cdsTipoRecDes.Filtered := True;
end;

procedure TfrmCadServProdxItemMT.dbrgRegimePagamentoClick(Sender: TObject);
begin
  inherited;
  // Filtra o Tipo de Recebimento / Desembolso
  cdsTipoRecDes.Filtered := False;
  case dbrgRegimePagamento.ItemIndex of
    0: cdsTipoRecDes.Filter := 'RECPAG = ''P''';
    1: cdsTipoRecDes.Filter := 'RECPAG = ''R''';
  end;
  cdsTipoRecDes.Filtered := True;
end;

procedure TfrmCadServProdxItemMT.dblcTipoRecDesChange(Sender: TObject);
begin
  inherited;
  // Busca e valida a conta do desembolso para o lançamento
  if not(cdsDet.State in [dsInsert,dsEdit]) then Exit;
  dbeContaContabil.Plano := cdsTipoRecDes.FieldByName('PLANO').AsInteger;
  cdsDet.FieldbyName('PLACONTA').AsString := cdsTipoRecDes.FieldByName('PLACONTA').AsString;
  dbeContaContabil.Valida;

  lblSubConta.Enabled  := dbeContaContabil.Conta.ObrigaSubConta;
  dblcSubConta.Enabled := dbeContaContabil.Conta.ObrigaSubConta;

  if not dbeContaContabil.Conta.ObrigaSubConta then
     cdsDet.FieldByName('CODSUBCONTA').Clear;
end;

end.
