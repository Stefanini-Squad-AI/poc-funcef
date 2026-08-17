{ --------------------------------------------------------------------------------------------------
Rotina......: Cadastro de Integração Contábil
Nº SOL......: 158234/5422
Nº KINTANA..: 1354520
Data........: 14/12/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Ordenar ao clicar no cabeçalho, na tela de integração contábil.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: sqlABC e msABC
Nº SOL......: 163982/6901
Nº KINTANA..: 1472467
Data........: 03/11/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foram alterados estes componentes para que retornem apenas as
              atividades analiticas e ativas.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: FormCreate
Nº SOL......: 159397/5361
Nº KINTANA..: 1332861
Data........: 13/07/2011
Responsável.: Thaise Amaral Martins
Descrição...: Consultar os centros de responsabilidade de acordo com o usuário
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 158234/5421
Nº KINTANA..: 1349533
Data........: 07/07/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Está ocorrendo erro ao tentar digitar/apagar atividade/projeto na aba do contas a pagar
              na tela de integração contabil no módulo folha de pagamento.
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 158234/5423
Nº KINTANA..: 1349534
Data........: 07/07/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Erro ao tentar digitar/apagar centro de responsabilidade
              na aba contas a pagar na tela de integração contabil no módulo folha de pagamento
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 158234
Nº KINTANA..: 1284480
Data........: 30/05/2011
Responsável.: Thaise Amaral Martins
Descrição...: Fazer os ajustes nas consultas
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: bbtnOkDetClick
Nº SOL......: 136200
Nº KINTANA..: 813279
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: - Criar uma rotina que possibilite inserir vários centros de custo para uma determinada conta;
              - Carregar no grid o nome do centro de custo
-------------------------------------------------------------------------------------------------- }
unit fCadCtFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect,
  FCadastroMestreDetMT, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, CMTree, Mask, DBCtrls, wwdbedit, Wwtable, IvDictio, IvMulti, IvEMulti,
  CMProcuraMask, CmEventosCadastro, ImgList, CMProcuraSubTipo, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlCtFolha, uCtrlListTerceirosRH, uCtrlProvDesc;

type
  TfrmCadCtFolha = class(TFrmCadastroMestreDetMT)
    dbedDescricao: TwwDBEdit;
    Label2: TLabel;
    dbrgrpDesconto: TDBRadioGroup;
    dsSubContaD: TwwDataSource;
    dsSubConta: TwwDataSource;
    msTipoDesemb: TMontaSelect;
    msCentRespon: TMontaSelect;
    msABC: TMontaSelect;
    pgParams: TPageControl;
    tbshContab: TTabSheet;
    CMProcuraMaskContabilDebito: TCMProcuraMaskContabil;
    CMProcuraMaskContabilCredito: TCMProcuraMaskContabil;
    dblckSubContaD: TwwDBLookupCombo;
    Label4: TLabel;
    dblckSubContaC: TwwDBLookupCombo;
    Label1: TLabel;
    dblckCCusto: TwwDBLookupCombo;
    Label6: TLabel;
    tbshCAP: TTabSheet;
    CmProcTipDesemb: TCMProcuraMask;
    ProcuraFavorecido: TCMProcuraForCli;
    CmpCentRespon: TCMProcuraMask;
    CmpABC: TCMProcuraMask;
    CdsDet: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    CdsSubContaD: TCMClientDataSet;
    CdsParamGlobal: TCMClientDataSet;
    CdsABC: TCMClientDataSet;
    CdsTipoDesemb: TCMClientDataSet;
    CdsCentRespon: TCMClientDataSet;
    sqlABC: TCMSqlParams;
    sqlCentRespon: TCMSqlParams;
    sqlTipoDesemb: TCMSqlParams;
    sbtnProcurarCAP: TToolbarButton97;
    msCAP: TMontaSelect;
    sbtnProcurarContab: TToolbarButton97;
    msContab: TMontaSelect;
    CdsHistoricoPadrao: TCMClientDataSet;
    Label3: TLabel;
    dblckHistoricoPadraoCredito: TwwDBLookupCombo;
    CdsCtaCusto: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    ImlTitle: TImageList;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblckSubContaDChange(Sender: TObject);
    procedure dblckSubContaCChange(Sender: TObject);
    procedure CdsDetBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
              AFieldName: String);
    procedure dbgrdDetCalcTitleImage(Sender: TObject; Field: TField;
              var TitleImageAttributes: TwwTitleImageAttributes);
    procedure FormShow(Sender: TObject);
  private
    CtrlCtFolha: TCtrlCtFolha;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlProvDesc: TCtrlProvDesc;

    sMascaraPlano, sCampoOrdenado, sOrdemBy: string;
    iPlano: integer;
    bPartidaDobrada: boolean;

    procedure Sel(IdProvento: double);
    function  GravarRegistro: boolean;
    procedure MontarObcoesMontaSelecs;

    function Grid_Ordena_e_PintaTitulo(xGrid: TwwDBGrid; Column: string; CDS: TClientDataSet): boolean;
  end;

var
  frmCadCtFolha: TfrmCadCtFolha;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, uCtrlParamIntegra,
  fReplicaCCusto;


{$R *.DFM}

procedure TfrmCadCtFolha.FormCreate(Sender: TObject);
var i: integer;
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlCtFolha := TCtrlCtFolha.Create;
  CtrlCtFolha.InitializeAs(Padroes);
  CtrlCtFolha.CdsContabFolha := CdsDet;
  Sel(-1);

  CdsCCusto.Data := CtrlListTerceirosRH.ListCCustoAtivo(IntToStr(Sistema.IdEmpresa));
  CdsSubConta.Data := CtrlListTerceirosRH.ListSubConta;
  CdsSubContaD.Data := CdsSubConta.Data;
  CdsParamGlobal.Data := CtrlListTerceirosRH.ListParamGlobal(Sistema.IdEmpresa);

  CdsHistoricoPadrao.Data := CtrlListTerceirosRH.ListHistoricoPadrao(Sistema.IdEmpresa);

  sqlTipoDesemb.Prepare;
  sqlTipoDesemb.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  sqlTipoDesemb.ParamByName('RECPAG').asString := 'P';

  sqlCentRespon.Prepare;
  sqlCentRespon.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;

  sqlABC.Prepare;
  sqlABC.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;

  iPlano := CtrlListTerceirosRH.GetPlano(Sistema.IdEmpresa);
  sMascaraPlano := CtrlListTerceirosRH.GetMascaraPlano(iPlano);

  CmpCentRespon.Visible := (CdsParamGlobal.FieldByName('USACRESPON').asString = 'S');
  CmpABC.Visible := (CdsParamGlobal.FieldByName('USAABC').asString = 'S');

  CMProcuraMaskContabilDebito.Mascara := sMascaraPlano;
  CMProcuraMaskContabilCredito.Mascara := sMascaraPlano;
  CMProcuraMaskContabilDebito.Plano := iPlano;
  CMProcuraMaskContabilCredito.Plano := iPlano;

  msCentRespon.Filtro.Add('CENTRESPON.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  msABC.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  //Thaise SOL158234 - Fazer a coluna trazer por default a letra 'A'.
  msABC.ItemsBusca.Clear;
  for i:=0 to (msABC.Colunas.Count)-1  do begin
    if msABC.Colunas[i] = 'UNIDNEGOCIO.UNETIPO' then
      msABC.ItemsBusca.Add('A')
    else
      msABC.ItemsBusca.add('');
  end;

  //Thaise - SOL 159397/5361: Comentar a query antiga
  {msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.RECPAG   = ''P''');
  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.ANASINT  = ''A''');
  msTipoDesemb.Filtro.Add('NVL(ATIVO,''S'')        <> ''N''');}

  
  //Thaise - SOL 159397/5361: Associar a o idpessoa ao centro de responsabilidade
  //correspondente no cadastro de usuarios x responsabilidade.
  //Obsv: O fonte deste chamado foi perdido, por isso a necessidade de um novo trabalho.
  msTipoDesemb.Filtro.Add('TRDXCRESPON.IDPESSOA = 1');
  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = 1');
  msTipoDesemb.Filtro.Add('TRDXCRESPON.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES');
  msTipoDesemb.Filtro.Add('TRDXCRESPON.RECPAG = TIPORECEBDESEMB.RECPAG');
  msTipoDesemb.Filtro.Add('RTRIM(TRDXCRESPON.CODCENTRORESPON) IN' +
                          ' (SELECT RTRIM(UXA.CODCENTRORESPON)' +
                          ' FROM CENTRESPON ALM, PESSOAXCRESP UXA' +
                          ' WHERE (UXA.IDPESSOAACESSO = ' +  InttoStr(Sistema.IdUsuario) + ')' +
                          ' AND (UXA.IDPESSOA = 1)' +
                          ' AND (UXA.CODCENTRORESPON = ALM.CODCENTRORESPON)' +
                          ' AND (UXA.IDPESSOA = ALM.IDPESSOA))');


  CmProcTipDesemb.Mascara := '';
  // SOL 158234/5423 KINTANA 1349534 ERALDO LUIS DA SILVA
  CmpCentRespon.Mascara := CdsParamGlobal.FieldByName('MASCCENTRORESPON').asString + ';#;';
  MontarObcoesMontaSelecs;

  bPartidaDobrada := ParamIntegra.PartidaDobrada;

  pgParams.ActivePageIndex := 0;
end;

procedure TfrmCadCtFolha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCtFolha);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadCtFolha.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor)  then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCtFolha.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  // SOL 158234/5423 / 158234/5421 ERALDO LUIS DA SILVA
  If MontaSelect.ValoresChave.Count > 0 then
   Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCtFolha.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadCtFolha.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPROVENTO').asFloat := Cds.FieldByName('IDPROVENTO').asFloat;
  if (CMProcuraMaskContabilDebito.Conta <> nil) then
    CdsDet.FieldByName('IdPlano2').asInteger := iPlano;
  if (CMProcuraMaskContabilCredito.Conta <> nil) then
    CdsDet.FieldByName('IdPlano1').asInteger := iPlano;
end;

procedure TfrmCadCtFolha.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (CMProcuraMaskContabilDebito.CanFocus) then
    CMProcuraMaskContabilDebito.SetFocus;
end;

procedure TfrmCadCtFolha.CdsDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
end;

procedure TfrmCadCtFolha.dblckSubContaDChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    if (Trim(dblckSubContaD.Text) = '') then
      CdsDet.FieldByName('IDPESSDEBITO').Clear
    else
      CdsDet.FieldByName('IDPESSDEBITO').asString := CdsSubContaD.FieldByName('IDPESSOA').asString;
  end;
end;

procedure TfrmCadCtFolha.dblckSubContaCChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    if (Trim(dblckSubContaC.Text) = '') then
      CdsDet.FieldByName('IDPESSCREDITO').Clear
    else
      CdsDet.FieldByName('IDPESSCREDITO').asString := CdsSubConta.FieldByName('IDPESSOA').asString;
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadCtFolha.Sel(IdProvento: double);
var sNome: String;
begin
  sNome := '';
  Cds.Data := CtrlProvDesc.ListRubrica(IdProvento);
  //CdsDet.Data := CtrlCtFolha.ListContabFolha(IdProvento);

  sNome := CdsDet.IndexName;
  if sNome <> '' then
    CdsDet.DeleteIndex(sNome);

  CdsDet.Data := CtrlCtFolha.ListContabFolhaDet(IdProvento);
end;

function TfrmCadCtFolha.GravarRegistro: boolean;
begin
  Result := CtrlCtFolha.GravarContabFolha;
  if not(Result) then
    raise exception.Create(CtrlCtFolha.MessageInfo);
end;

procedure TfrmCadCtFolha.bbtnOkDetClick(Sender: TObject);
var ContDebito, ContCredito, codSubDebt, CodSubCredit: String;
    HistPadrao, TipDesemb, Favorecido, CRespons, UndNegoc: String;
    bInseriuReplica: Boolean;
begin
  if (bPartidaDobrada) and
     (((CdsDet.FieldByName('CONTADEBITO').asString <> '') and (CdsDet.FieldByName('CONTACREDITO').asString = '')) or
      ((CdsDet.FieldByName('CONTADEBITO').asString = '') and (CdsDet.FieldByName('CONTACREDITO').asString <> ''))) then
  begin
    MsgDlg('Partida Dobrada: Devem ser informadas as Contas a Débito e a Crédito.',
           'Aviso', mtWarning, [mbOk,mbHelp], 0);
    pgParams.ActivePage := tbshContab;
    exit;
  end;
  //Thaise SOL 136200 - Carregar as informações para serem salvas
  bbtnOkDet.SetFocus;
  bInseriuReplica := False;
  ContDebito      := CdsDet.FieldByName('CONTADEBITO').AsString;
  ContCredito     := CdsDet.FieldByName('CONTACREDITO').AsString;
  codSubDebt      := CdsDet.FieldByName('CODSUBDEBITO').AsString;
  CodSubCredit    := CdsDet.FieldByName('CODSUBCREDITO').AsString;
  HistPadrao      := CdsDet.FieldByName('HITCODHISTDEBITO').AsString;
  TipDesemb       := CdsDet.FieldByName('CODTIPRECDES').AsString;
  Favorecido      := CdsDet.FieldByName('IDFAVORECIDO').AsString;
  CRespons        := CdsDet.FieldByName('CODCENTRORESPON').AsString;
  UndNegoc        := CdsDet.FieldByName('UNIDNEGOC').AsString;
  CdsDet.FieldByName('NOME').AsString := dblckCCusto.Text;
  CdsDet.FieldByName('NOME_CODCENTRORESPON').AsString := CdsCentRespon.FieldByName('NOME').AsString;
  If cdsABC.Active then
    CdsDet.FieldByName('NOME_UNIDNEGOC').AsString := CdsABC.FieldByName('NOME').AsString;
  //Thaise SOL 136200 - Abrir tela para inserir 'n' centro de custos para uma conta
  if (CdsDet.State in [dsInsert]) and
     (CdsDet.FieldByName('CodCentroCusto').asString <> '') then
  begin
    if (MsgDlg('Deseja replicar o relacionamento para outros Centros de Custos ?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mryes) then
    begin
      Application.CreateForm(TfrmReplicaCCusto, frmReplicaCCusto);
      frmReplicaCCusto.IdProvento  := Cds.FieldByName('IDPROVENTO').AsFloat;
      frmReplicaCCusto.ContDebito  := ContDebito;
      frmReplicaCCusto.ContCredito := ContCredito;
      frmReplicaCCusto.CodCCustoNI := CdsDet.FieldByName('CODCENTROCUSTO').AsString;
      frmReplicaCCusto.ShowModal;
      if frmReplicaCCusto.ModalResult = mrOK then
      begin
        frmReplicaCCusto.CdsSel.First;
        while not frmReplicaCCusto.CdsSel.Eof do
        begin
          if Trim(frmReplicaCCusto.CdsSel.FieldByName('IDCONTABFOLHA').AsString) = '' then
          begin
            bInseriuReplica:= True;
            CmeDetalhe.OnInsert(Self);
            CdsDet.FieldByName('CONTADEBITO').AsString          := ContDebito;
            CdsDet.FieldByName('CONTACREDITO').AsString         := ContCredito;
//            CdsDet.FieldByName('CODCENTROCUSTO').AsString       := frmReplicaCCusto.CdsSel.FieldByName('CODCENTROCUSTO').AsString;
            CdsDet.FieldByName('CODCENTROCUSTO').AsString       := frmReplicaCCusto.CdsSel.FieldByName('CODCENTROCUSTO_Correto').AsString;
            CdsDet.FieldByName('CODSUBDEBITO').AsString         := codSubDebt;
            CdsDet.FieldByName('CODSUBCREDITO').AsString        := CodSubCredit;
            CdsDet.FieldByName('HITCODHISTDEBITO').AsString     := HistPadrao;
            CdsDet.FieldByName('CODTIPRECDES').AsString         := TipDesemb;
            CdsDet.FieldByName('IDFAVORECIDO').AsString         := Favorecido;
            CdsDet.FieldByName('CODCENTRORESPON').AsString      := CRespons;
            CdsDet.FieldByName('UNIDNEGOC').AsString            := UndNegoc;
            CdsDet.FieldByName('NOME').AsString                 := frmReplicaCCusto.CdsSel.FieldByName('NOME').AsString;
            CdsDet.FieldByName('NOME_CODCENTRORESPON').AsString := CdsCentRespon.FieldByName('NOME').AsString;
            If CdsAbc.Active then
              CdsDet.FieldByName('NOME_UNIDNEGOC').AsString       := CdsABC.FieldByName('NOME').AsString;
            CdsDet.Post;                                        
          end;
          frmReplicaCCusto.CdsSel.Next;
        end;
      end;
    end;
  end;
  inherited;
  if bInseriuReplica then
    bbtnVoltarDet.OnClick(Sender);
end;

procedure TfrmCadCtFolha.sbtnProcurarClick(Sender: TObject);
var
  _MS: TMontaSelect;
begin

  if (TComponent(Sender).Name = 'sbtnProcurar') then
    inherited
  else
  if (TComponent(Sender).Name = 'sbtnProcurarCAP') then
  begin
    _MS := MontaSelect;

    MontaSelect := msCAP;
    inherited;
    if (MontaSelect.RetornouValor) then
    begin
      tbcDetalhe.TabIndex := 1;
      tbcDetalheChange(pgctrlDetalhe);
    end;

    MontaSelect := _MS;
  end
  else
  begin
    _MS := MontaSelect;

    MontaSelect := msContab;
    inherited;
    if (MontaSelect.RetornouValor) then
    begin
      tbcDetalhe.TabIndex := 0;
      tbcDetalheChange(pgctrlDetalhe);
    end;

    MontaSelect := _MS;
  end;
end;

procedure TfrmCadCtFolha.MontarObcoesMontaSelecs;
begin
  MontaSelect.Filtro.Add('(RUBRICAXPESS.IDRUBRICA IS NULL OR RUBRICAXPESS.IDPESSOA = '+
    IntToStr(Sistema.IdEmpresa) + ')');

  msCAP.Tabelas.Add('(SELECT CODCENTRORESPON, NOME '+
                    'FROM CENTRESPON '+
                    'WHERE (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+ ')) CENTRESPON');
  msCAP.Tabelas.Add('(SELECT UNIDNEGOC, UNECODIGO, NOME '+
                    'FROM UNIDNEGOCIO '+
                    'WHERE (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+ ')) UNIDNEGOCIO');
  with (msCAP.Filtro) do
  begin
    Clear;
    Add('CONTABFOLHA.IDEMPRESA       = ' +IntToStr(Sistema.IdEmpresa));
    Add('RUBRICAXPESS.IDPESSOA       = ' +IntToStr(Sistema.IdEmpresa));
    Add('TIPORECEBDESEMB.IDPESSOA    = ' + IntToStr(Sistema.IdEmpresa));
    Add('TIPORECEBDESEMB.RECPAG      = ''P''');
    Add('PROVDESC.FLGTPRUBRICA    LIKE (''%F%'')');
    Add('PROVDESC.IDPROVENTO         = RUBRICAXPESS.IDRUBRICA');
    Add('PROVDESC.IDPROVENTO         = CONTABFOLHA.IDPROVENTO');
    Add('CONTABFOLHA.CODTIPRECDES    = TIPORECEBDESEMB.CODTIPRECDES');
    Add('CONTABFOLHA.CODCENTRORESPON = CENTRESPON.CODCENTRORESPON(+)');
    Add('CONTABFOLHA.UNIDNEGOC       = UNIDNEGOCIO.UNIDNEGOC(+)');
    Add('CONTABFOLHA.IDFAVORECIDO    = PESSOA.IDPESSOA(+)');
  end;


  with (msContab.Tabelas) do
  begin
    Clear;
    Add('RUBRICAXPESS');
    Add('PROVDESC');
    Add('(SELECT * '+
         'FROM CONTABFOLHA '+
         'WHERE '+
         '   ((CONTADEBITO    IS NULL) OR (IDPLANO1      = ' +IntToStr(ParamIntegra.Plano)+ ')) AND '+
         '   ((CONTACREDITO   IS NULL) OR (IDPLANO2      = ' +IntToStr(ParamIntegra.Plano)+ ')) AND '+
         '   ((CODSUBDEBITO   IS NULL) OR (IDPESSDEBITO  = ' +IntToStr(Sistema.IdEmpresa)+ ')) AND '+
         '   ((CODSUBCREDITO  IS NULL) OR (IDPESSCREDITO = ' +IntToStr(Sistema.IdEmpresa)+ ')) AND '+
         '   ((CODCENTROCUSTO IS NULL) OR (IDEMPRESA     = ' +IntToStr(Sistema.IdEmpresa)+ ')) '+
         ') CONTABFOLHA');
    Add('(SELECT PLACONTA, PLANOME '+
         'FROM PLANOCONTA '+
         'WHERE (PLANO = ' +IntToStr(ParamIntegra.Plano)+ ')) CONTA_D');
    Add('(SELECT PLACONTA, PLANOME '+
         'FROM PLANOCONTA '+
         'WHERE (PLANO = ' +IntToStr(ParamIntegra.Plano)+ ')) CONTA_C');
    Add('(SELECT CODSUBCONTA, NOMESUBCONTA '+
         'FROM SUBCONTA '+
         'WHERE (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+ ')) SUBCONTA_D');
    Add('(SELECT CODSUBCONTA, NOMESUBCONTA '+
         'FROM SUBCONTA '+
         'WHERE (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+ ')) SUBCONTA_C');
    Add('(SELECT CODCENTROCUSTO, NOME '+
         'FROM CENTCUST '+
         'WHERE (IDEMPRESA = ' +IntToStr(Sistema.IdEmpresa)+ ')) CENTCUST');
  end;

  with (msContab.Filtro) do
  begin
    Clear;
    Add('RUBRICAXPESS.IDPESSOA      = ' +IntToStr(Sistema.IdEmpresa));
    Add('PROVDESC.FLGTPRUBRICA   LIKE (''%F%'')');
    Add('PROVDESC.IDPROVENTO        = RUBRICAXPESS.IDRUBRICA');
    Add('PROVDESC.IDPROVENTO        = CONTABFOLHA.IDPROVENTO');
    Add('CONTABFOLHA.CODTIPRECDES  IS NULL');
    Add('CONTABFOLHA.CONTADEBITO    = CONTA_D.PLACONTA(+)');
    Add('CONTABFOLHA.CONTACREDITO   = CONTA_C.PLACONTA(+)');
    Add('CONTABFOLHA.CODSUBDEBITO   = SUBCONTA_D.CODSUBCONTA(+)');
    Add('CONTABFOLHA.CODSUBCREDITO  = SUBCONTA_C.CODSUBCONTA(+)');
    Add('CONTABFOLHA.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+)');
  end;

  msCentRespon.Filtro.Add('CENTRESPON.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  // msAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.RECPAG   = ''P''');
  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.ANASINT  = ''A''');
  msTipoDesemb.Filtro.Add('NVL(ATIVO,''S'')        <> ''N''');
end;

procedure TfrmCadCtFolha.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnProcurarCAP.Enabled := false;
  sbtnProcurarContab.Enabled := false;
  case (CmeCadastro.Operacao) of
    opVazio :
    begin
      sbtnProcurarCAP.Down := false;
      sbtnProcurarCAP.Enabled := true;
      sbtnProcurarContab.Down := false;
      sbtnProcurarContab.Enabled := true;
    end;
    opIdle :
    begin
      sbtnProcurarCAP.Down := false;
      sbtnProcurarCAP.Enabled := true;
      sbtnProcurarContab.Down := false;
      sbtnProcurarContab.Enabled := true;
    end;
    opProcurar :
    begin
      sbtnProcurarCAP.Down := true;
      sbtnProcurarCAP.Enabled := true;
      sbtnProcurarContab.Down := false;
      sbtnProcurarContab.Enabled := true;
    end;
  end;
end;

// Eraldo Luis da Silva Sol 158234/5422 Kintana 1354520 Inicio
function TfrmCadCtFolha.Grid_Ordena_e_PintaTitulo(xGrid: TwwDBGrid; Column: string; CDS: TClientDataSet): boolean;
const
  idxDefault = 'DEFAULT_ORDER';
var
  strColumn: string;
  bolUsed: Boolean;
  idOptions: TIndexOptions;
  I: Integer;
  VDescendField: string;
begin

  Result := false;
  if not CDS.Active then exit;

  strColumn := idxDefault;

  // Se for campo calculado não deve fazer nada
  //if (Column.Field.FieldKind = fkCalculated) then exit;

  // O índice já está em uso
  bolUsed := (Column = cds.IndexName);
  sCampoOrdenado := Column;

  // Verifica a existência do índice e propriedades
  CDS.IndexDefs.Update;
  idOptions := [];
  for I := 0 to CDS.IndexDefs.Count - 1 do
  begin
    if cds.IndexDefs.Items[I].Name = Column then
    begin
      strColumn := Column;
      // Determina como deve ser criado o índice, inverte a condição ixDescending
      case (ixDescending in cds.IndexDefs.Items[I].Options) of
        True : begin
                 idOptions     := [];
                 VDescendField := '';
                 sOrdemBy      := 'DESC';
               end;
        False: begin
                 idOptions     := [ixDescending];
                 vDescendField := strColumn;
                 if Column <> cds.IndexName then
                   sOrdemBy := 'DESC'
                 else
                   sOrdemBy := 'ASC';
               end;
      end;
    end;
  end;

  // Se não encontrou o índice, ou o índice já esta em uso...
  if (strColumn = idxDefault) or bolUsed then
  begin
    if bolUsed then
      CDS.DeleteIndex(Column);
    try
      CDS.AddIndex(Column, Column, idOptions, VDescendField, '', 0);
      strColumn := Column;
    except
        // O índice esta indeterminado, passo para o padrão
      if bolUsed then strColumn := idxDefault;
    end;
  end;


  try
    CDS.IndexName := strColumn;
  except
    CDS.IndexName := idxDefault;
  end;

  result := true;

end;

procedure TfrmCadCtFolha.dbgrdDetTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Grid_Ordena_e_PintaTitulo(dbgrdDet, AFieldName, CdsDet);
end;

procedure TfrmCadCtFolha.dbgrdDetCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  //inherited;
  If UpperCase(Field.FieldName) = sCampoOrdenado Then
  Begin
     TitleImageAttributes.Alignment := taRightJustify;

     If ((sOrdemBy = 'DESC') or (Trim(sOrdemBy) = '')) Then
        TitleImageAttributes.ImageIndex := 0
     ELse
        TitleImageAttributes.ImageIndex := 1;
  End
  Else
     TitleImageAttributes.ImageIndex := -1;
end;

procedure TfrmCadCtFolha.FormShow(Sender: TObject);
begin
  inherited;
  sCampoOrdenado := '';
  sOrdemBy       := '';
end;
// Eraldo Luis da Silva Sol 158234/5422 Kintana 1354520 Fim

end.
