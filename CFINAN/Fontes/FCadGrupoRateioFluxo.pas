{ --------------------------------------------------------------------------------------------------
//N. WO ..........: 13599
//Data............: 30/09/2024
//Responsável.....: Leandro Pocebon
//Descrição.......: Inclusão combo programa na configuração do rateio
---------------------------------------------------------------------------------------------------
Nº SOL......: 128685
Nº KINTANA..: 692049
Data........: 06/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
---------------------------------------------------------------------------------------------------}
unit FCadGrupoRateioFluxo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCmSqlParams, TREdit,
  Mask, DBCtrls, wwdblook,
  uCtrlGrupoRateioFluxo, uCtrlListTercFinanc, uCtrlSegregacao,
  uCtrlPlanPrevContabPatro, uCtrlParamIntegra, uCtrlMovimFluxoOrc;

type
  TFrmCadGrupoRateioFluxo = class(TFrmCadastroMestreDetMT)
    sqlCds: TCMSqlParams;
    CdsIDGRUPORATEIOFLUXO: TFloatField;
    CdsGRRFDESCRICAO: TStringField;
    Label1: TLabel;
    Label3: TLabel;
    lblQuantImoveis: TLabel;
    DBedtNomeGrupo: TDBEdit;
    edtTotalRateio: TDBRealEdit;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    lblTipoRD: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    lblMoeda: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label8: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcTipoDocurmento: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    dblcLinhasFluxo: TwwDBLookupCombo;
    dblcMoeda: TwwDBLookupCombo;
    dblcSegregaCriter: TwwDBLookupCombo;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatrocinador: TwwDBLookupCombo;
    cboFluxoCaixa: TDBLookupComboBox;
    Label10: TLabel;
    Label4: TLabel;
    dbedtPercent: TDBRealEdit;
    cdsLinhaFluxo: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsSegregaCriter: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
    cdsTipoRecDes: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    CdsFluxoCaixa: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    sqlCdsDet: TCMSqlParams;
    CdsDetIDPADRAORATEIOFLUXO: TFloatField;
    CdsDetIDGRUPORATEIOFLUXO: TFloatField;
    CdsDetIDEMPRESAPROP: TFloatField;
    CdsDetUNIDNEGOC: TFloatField;
    CdsDetUNIDNEGOCIO: TStringField;
    CdsDetCODCENTRORESPON: TStringField;
    CdsDetCENTRORESPON: TStringField;
    CdsDetCODLINHAFLUXO: TFloatField;
    CdsDetLINHADEFLUXO: TStringField;
    CdsDetRECPAG: TStringField;
    CdsDetCODTIPRECDES: TStringField;
    CdsDetTIPODESEMBOLSO: TStringField;
    CdsDetIDPATRO: TFloatField;
    CdsDetPATRO: TStringField;
    CdsDetIDPLANOPREV: TFloatField;
    CdsDetPLANPREV: TStringField;
    CdsDetCODTIPDOC: TFloatField;
    CdsDetTIPODOCUMENTO: TStringField;
    CdsDetMOECODIGO: TFloatField;
    CdsDetMOEDA: TStringField;
    CdsDetPERCENTRATEIO: TFloatField;
    dsFluxoCaixa: TDataSource;
    CdsDetIDFLUXOCAIXA: TFloatField;
    CdsDetFLUXOCAIXA: TStringField;
    CdsDetIDSEGREGACRITER: TFloatField;
    CdsDetSEGREGACRITER: TStringField;
    Label20: TLabel;
    cdsPrograma: TCMClientDataSet;
    CdsDetPROGRAMA: TStringField;
    dblcPrograma: TwwDBLookupCombo;
    dbRGTipoRateio: TDBRadioGroup;
    Cdstiporateio: TStringField;
    Label5: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    cdsCentroCusto: TCMClientDataSet;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(Sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(Sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(Sender: TObject; var Accept: Boolean);

    procedure CdsDetBeforePost(DataSet: TDataSet);
    procedure CdsDetAfterPost(DataSet: TDataSet);

    procedure dbgrdDetTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cboFluxoCaixaCloseUp(Sender: TObject);
    procedure dblcLinhasFluxoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcSegregaCriterCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPatrocinadorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTipoDocurmentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcMoedaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCentroResponDropDown(Sender: TObject);
    procedure dblcCentroResponChange(Sender: TObject);
    procedure cboFluxoCaixaDropDown(Sender: TObject);
    procedure dblcLinhasFluxoEnter(Sender: TObject);
    procedure dblcTipoRDEnter(Sender: TObject);
    procedure dblcTipoDocurmentoEnter(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dblcProgramaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbRGTipoRateioChange(Sender: TObject);

  private { Private declarations }

    CtrlGrupoRateioFluxo    : TCtrlGrupoRateioFluxo;
    CtrlListTerceiros       : TCtrlListTercFinanc;
    CtrlSegregacao          : TCtrlSegregacao;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlMovimFluxoOrc       : TCtrlMovimFluxoOrc;

    sFluxoCaixa: Integer;
    sCentroRespon: String;
    bLinhaFluxoPreenchido: Boolean;
    bTRDPreenchido: Boolean;  

    procedure SelecionaMestreDetalhe(const IDGrupoRateioFluxo: Integer);
    function TotalRateio: Extended;
    function VerificaPreenchimento: Boolean;
    function VerificaPreenchimentoDetalhe: Boolean;

    procedure CarregaComboTRD(iIdEmpresa,iIdFluxoCaixa,iCodLinhaFluxo: integer; sCodCentroRespon: string);

  public { Public declarations }

    procedure MensErroMT(sMessageInfo: String);

  end;

var
  FrmCadGrupoRateioFluxo: TFrmCadGrupoRateioFluxo;

implementation

{$R *.DFM}

uses
  dBaseDados, uDatabase, uMensErro, uSistema, uVerificaPreenchimento;

procedure TFrmCadGrupoRateioFluxo.FormCreate(Sender: TObject);
var
  cdsAux: TCMClientDataSet;
begin
  inherited;

  edtTotalRateio.Value := 0;

  CtrlGrupoRateioFluxo := TCtrlGrupoRateioFluxo.Create;
  CtrlGrupoRateioFluxo.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                  MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlGrupoRateioFluxo.CdsGrupoRateioFluxo  := Cds;
  CtrlGrupoRateioFluxo.CdsPadraoRateioFluxo := CdsDet;

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsDet.CreateDataSet;


  CtrlListTerceiros := TCtrlListTercFinanc.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.InitializeAs (CtrlGrupoRateioFluxo);
  CtrlSegregacao.GetParams(Sistema.IdEmpresa);
  cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter;
  dblcSegregaCriter.Enabled := CtrlSegregacao.SegregaVirtual;

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(CtrlGrupoRateioFluxo);

  CtrlMovimFluxoOrc := TCtrlMovimFluxoOrc.Create;
  CtrlMovimFluxoOrc.Initialize(dtmBaseDados.dbBaseDados,True);

  CdsFluxoCaixa.Data := CtrlMovimFluxoOrc.ListaFluxoCaixa(Sistema.IdEmpresa);

  cdsLinhaFluxo.Data := CtrlMovimFluxoOrc.ListLinhasFluxo(Sistema.IdEmpresa,'',-1);

  cdsTipoDoc.Data := CtrlListTerceiros.ListTipoDoc('');

  cdsMoeda.Data := CtrlListTerceiros.ListMoeda(0,True);

  //Leandro WO13599 - Inicio
  //Carrega cds do combo de Programas Previdenciários
  cdsPrograma.Data := CtrlListTerceiros.ListPrograma;
   //Carrega Cds de Centro de Custo
   cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCusto(Sistema.IdEmpresa,'A','S',ParamIntegra.PlanoCentroCusto );
  //Leandro WO13599 - Fim

  if (Sistema.UsaPlanoPatro) then
  begin
    cdsPlanoPrev.Data := CtrlListTerceiros.ListPlanoPrev;

    cdsPatrocinador.Data := CtrlListTerceiros.ListPatrocinador;
  end;
                   
  cdsAux := TCMClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlListTerceiros.ListParamGlobal(Sistema.IdEmpresa);
    dblcCentroRespon.Enabled := (cdsAux.FieldByName('USACRESPON').AsString='S');

    //Carrega cds de Unidade de Negócio - cdsUnidNeg
    if (cdsAux.FieldByName('USAABC').AsString='S') then
      cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,0,'A','')
    else
    begin
      cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa, cdsAux.FieldByName('UNIDNEGOC').AsFloat,'','');
      dblcUnidNegoc.Enabled:=False;
    end;

    if (cdsAux.FieldByName('USACRESPON').AsString='S') then
    begin
      //Carrega o cds de Centros de Responsabilidade com todos os centros de Responsabilidade
      //permitidos ao usuário corrente.
      //Caso o mesmo não tenha nenhuma restrição de centro de responsabilidade cadastrada,
      //todos os centros de responsabilidade serão carregados
      cdsCentroRespon.Data     := CtrlListTerceiros.ListCentroResponxUsuarioAtivos(Sistema.IdEmpresa, Sistema.IdUsuario);
      dblcCentroRespon.Enabled := (cdsCentroRespon.RecordCount > 1);

      //Carrega cds de Tipo de Rec/Des - cdsTipoRecDes
      cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(-1,'','',0); //Vazio
    end
    else
    begin
      // Recupera apenas os centros de responsabilidade ativos
      cdsCentroRespon.Data := CtrlListTerceiros.ListCentroRespon(Sistema.IdEmpresa,'A','S','9999999999', ParamIntegra.PlanoCentroRespon);
      cdsTipoRecDes.Data   := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa,'9999999999','E',0,true);
      dblcCentroRespon.Enabled := False;
    end;

  finally
    cdsAux.Free;
  end;

end;

procedure TFrmCadGrupoRateioFluxo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceiros);
  FreeAndNil(CtrlSegregacao);
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlGrupoRateioFluxo);
  FreeAndNil(CtrlMovimFluxoOrc);
  inherited;
end;

procedure TFrmCadGrupoRateioFluxo.MensErroMT(sMessageInfo: String);
begin
  MsgDlg(sMessageInfo, 'Controle Financeiro', mtWarning, [mbOk], 0);
  Repaint;
end;

procedure TFrmCadGrupoRateioFluxo.SelecionaMestreDetalhe(
  const IDGrupoRateioFluxo: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data    := CtrlGrupoRateioFluxo.LookupGrupoRateioFluxo(IDGrupoRateioFluxo);
  CdsDet.Data := CtrlGrupoRateioFluxo.LookupPadraoRateioFluxo(IDGrupoRateioFluxo, Sistema.IDEmpresa);

  TotalRateio;
end;

function TFrmCadGrupoRateioFluxo.TotalRateio: Extended;
var
   iQtde, iPerc : Extended;
begin
  with cdsDet do
  begin
    DisableControls;
    First;
    iQtde := RecordCount;
    iPerc := 0;

    while not(EOF) do
    begin
       iPerc := iPerc + CdsDet.FieldByName('PERCENTRATEIO').AsFloat;
       Next;
    end;

    First;

    EnableControls;
  end;

  edtTotalRateio.Value := iPerc;
end;

procedure TFrmCadGrupoRateioFluxo.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );
  inherited;

  cds.FieldByName('TIPORATEIO').AsString := 'P'; //Leandro WO13599

  // Carrega Defaults
  if DBedtNomeGrupo.CanFocus then DBedtNomeGrupo.SetFocus;
end;

procedure TFrmCadGrupoRateioFluxo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  // Para consertar alguns registros sem o modulo gravado
  if DBedtNomeGrupo.CanFocus then DBedtNomeGrupo.SetFocus;
end;

procedure TFrmCadGrupoRateioFluxo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then SelecionaMestreDetalhe( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TFrmCadGrupoRateioFluxo.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // bug do padrão
  if (Cds.State = dsbrowse) then Cds.Edit;  // bug padrão
  Accept := CtrlGrupoRateioFluxo.GravaGrupoRateioFluxo;
end;

procedure TFrmCadGrupoRateioFluxo.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlGrupoRateioFluxo.ExcluiGrupoRateioFluxo;
  if Accept then SelecionaMestreDetalhe( -2 );
end;

procedure TFrmCadGrupoRateioFluxo.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Retorna os valores originais antes da alteração
  SelecionaMestreDetalhe( Cds.FieldByname('IDGRUPORATEIOFLUXO').AsInteger );
end;

procedure TFrmCadGrupoRateioFluxo.CmeDetalheConfirma(Sender: TObject);
begin
  if cdsDet.State in [dsInsert, dsEdit] then
  begin
    if VerificaPreenchimentoDetalhe then inherited;
  end
  else
  begin
    inherited;
  end;
end;

procedure TFrmCadGrupoRateioFluxo.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TFrmCadGrupoRateioFluxo.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try

    if dbedtNomeGrupo.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar o Nome do Grupo!', DBedtNomeGrupo);

    if dbRGTipoRateio.Value = 'P' then //Leandro WO13599
      if edtTotalRateio.Value <> 100 then
        raise EValidacao.CreateVal('É necessário que o Total do Rateio seja igual a 100!', DBedtNomeGrupo);


    if not(VerificaLinhaGrid(dbgrdDet.DataSource.DataSet,
                             7, // Tag dos campos chave
                             8, // Tag dos campos vazios
                             'Rateio',
                             False)) then
    begin
       raise EValidacao.CreateVal('Houve preenchimento incorreto do Rateio! Favor verificar.', DBedtNomeGrupo);
    end;

  except

    on ev : EValidacao do
    begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;

  end;
  Result := True;
end;

function TFrmCadGrupoRateioFluxo.VerificaPreenchimentoDetalhe: Boolean;
begin
  Result := False;
  try

    if Trim(dblcUnidNegoc.Text) = '' then
      raise EValidacao.CreateVal('Obrigatório preencher a Atividade',  dblcUnidNegoc);

    if Trim(dblcCentroRespon.Text) = '' then
      raise EValidacao.CreateVal('Obrigatório preencher o Centro de Responsabilidade', dblcCentroRespon);

    if Trim(cboFluxoCaixa.Text) = '' then
      raise EValidacao.CreateVal('Obrigatório preencher o Fluxo de Caixa', cboFluxoCaixa);

    if (Trim(dblcLinhasFluxo.Text) = '') and (Trim(dblcTipoRD.Text) = '') then
    begin
      MsgDlg('Obrigatório preencher Linha de Fluxo ou Tipo de Recebimento/Desembolso', 'Segregação de Recursos', mtWarning, [mbOk], 0);
      Exit;
    end;

    if Sistema.UsaPlanoPatro then
    begin
      if Trim(dblcPatrocinador.Text)='' then
        raise EValidacao.CreateVal('Obrigatório preencher o Patrocinador', dblcPatrocinador);

      if Trim(dblcPlanoPrev.Text)='' then
        raise EValidacao.CreateVal('Obrigatório preencher o Plano Previdenciário', dblcPlanoPrev);

      if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(CdsDet.FieldByName('IDPATRO').AsInteger, CdsDet.FieldByName('IDPLANOPREV').AsInteger) then
        raise EValidacao.CreateVal('Não existe relacionamento entre Patrocinadora e Plano escolhidos!', dblcPlanoPrev);
    end;

    if CtrlSegregacao.SegregaVirtual then
    begin

      if (CtrlSegregacao.PlanoPrevAdm = CdsDet.FieldByName('IDPLANOPREV').AsInteger) or
         (CtrlSegregacao.PlanoPrevComum = CdsDet.FieldByName('IDPLANOPREV').AsInteger) or
         (CtrlSegregacao.PatroComum = CdsDet.FieldByName('IDPATRO').AsInteger) then
      begin

        if (not((CtrlSegregacao.PlanoPrevAdm = CdsDet.FieldByName('IDPLANOPREV').AsInteger) or
           (CtrlSegregacao.PlanoPrevComum = CdsDet.FieldByName('IDPLANOPREV').AsInteger))) or
           (CtrlSegregacao.PatroComum <> CdsDet.FieldByName('IDPATRO').AsInteger) then
          raise EValidacao.CreateVal('Escolhendo o Plano "Comum" / "Adminitrativo" a Patrocinadora deve ser a "Comum", e vice-versa!', dblcPlanoPrev);

        if dblcSegregaCriter.Text <> '' then
        begin
          if (CtrlSegregacao.PlanoPrevAdm = CdsDet.FieldByName('IDPLANOPREV').AsInteger) and
             (not CtrlSegregacao.SegregaOrAdm) then
            raise EValidacao.CreateVal('O Plano "Administrativo" não é segregado na origem, o critério para segregação de recursos não pode ser escolhido!', dblcSegregaCriter);

          if (CtrlSegregacao.PlanoPrevComum = CdsDet.FieldByName('IDPLANOPREV').AsInteger) and
             (not CtrlSegregacao.SegregaOrComum) then
            raise EValidacao.CreateVal ('O Plano "Comum" não é segregado na origem, o critério para segregação de recursos não pode ser escolhido!', dblcSegregaCriter);
        end
        else
        begin
          if (CtrlSegregacao.PlanoPrevAdm = CdsDet.FieldByName('IDPLANOPREV').AsInteger) and
             (CtrlSegregacao.SegregaOrAdm) then
            raise EValidacao.CreateVal ('O Plano "Adminisrativo" é segregado na origem, o critério para segregação de recursos é obrigatório!', dblcSegregaCriter);

          if (CtrlSegregacao.PlanoPrevComum = CdsDet.FieldByName('IDPLANOPREV').AsInteger) and
             (CtrlSegregacao.SegregaOrComum) then
            raise EValidacao.CreateVal ('O Plano "Comum" é segregado na origem, o critério para segregação de recursos é obrigatório!', dblcSegregaCriter);
        end;

      end
      else
      begin
        if dblcSegregaCriter.Text <> '' then
          raise EValidacao.CreateVal ('O Critério para segregação só pode ser escolhido no plano "Comum" ou "Administrativo"!', dblcSegregaCriter);
      end;
    end;

    if dbRGTipoRateio.Value = 'P' then //Leandro WO13599
      if dbedtPercent.Value <= 0 then
         raise EValidacao.CreateVal('Obrigatório preencher o Percentual de Rateio!', dbedtPercent);

  except

    on ev : EValidacao do
    begin
       if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then ev.Control.SetFocus;
       Exit;
    end;

  end;
  Result := True;
end;

procedure TFrmCadGrupoRateioFluxo.CdsDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  CdsDet.FieldByName('RECPAG').AsString         := 'P';
  CdsDet.FieldByName('IDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
end;

procedure TFrmCadGrupoRateioFluxo.CdsDetAfterPost(DataSet: TDataSet);
begin
  TotalRateio;
end;

procedure TFrmCadGrupoRateioFluxo.dbgrdDetTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsDet.IndexFieldNames := AFieldName;
end;

procedure TFrmCadGrupoRateioFluxo.dblcUnidNegocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('UNIDNEGOCIO').AsString := TwwDBLookupCombo(Sender).Text;
end;

procedure TFrmCadGrupoRateioFluxo.dblcCentroResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('CENTRORESPON').AsString := TwwDBLookupCombo(Sender).Text;

  if (sCentroRespon <> dblcCentroRespon.LookupValue) and (CdsFluxoCaixa.RecordCount > 1) then
    cboFluxoCaixa.KeyValue:=0;
end;

procedure TFrmCadGrupoRateioFluxo.cboFluxoCaixaCloseUp(Sender: TObject);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('FLUXOCAIXA').AsString := TwwDBLookupCombo(Sender).Text;

  if sFluxoCaixa <> cboFluxoCaixa.KeyValue then
  begin
    dblcLinhasFluxo.Text    := '';
    dblcTipoRD.Text         := '';
    dblcTipoDocurmento.Text := '';
  end;
end;

procedure TFrmCadGrupoRateioFluxo.dblcLinhasFluxoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('LINHADEFLUXO').AsString := TwwDBLookupCombo(Sender).Text;

  if modified then
  begin
    CarregaComboTRD(Sistema.IdEmpresa,
                    StrToIntDef(cboFluxoCaixa.KeyValue,-1),
                    StrToIntDef(dblcLinhasFluxo.LookupValue,0),
                    dblcCentroRespon.LookupValue);

    if dblcLinhasFluxo.text <> '' then
       bLinhaFluxoPreenchido:=True;

     dblcTipoRD.Clear;
     dblcTipoDocurmento.Clear;
  end;
end;

procedure TFrmCadGrupoRateioFluxo.dblcTipoRDCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('TIPODESEMBOLSO').AsString := TwwDBLookupCombo(Sender).Text;

  if not bLinhaFluxoPreenchido then
  begin
    dblcTipoDocurmento.Value   :='';
    dblcTipoDocurmento.Text :='';
  end;
  bTRDPreenchido:=True;
end;

procedure TFrmCadGrupoRateioFluxo.dblcSegregaCriterCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('SEGREGACRITER').AsString := TwwDBLookupCombo(Sender).Text;
end;

procedure TFrmCadGrupoRateioFluxo.dblcPatrocinadorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('PATRO').AsString := TwwDBLookupCombo(Sender).Text;
end;

procedure TFrmCadGrupoRateioFluxo.dblcPlanoPrevCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('PLANPREV').AsString := TwwDBLookupCombo(Sender).Text;
end;

procedure TFrmCadGrupoRateioFluxo.dblcTipoDocurmentoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('TIPODOCUMENTO').AsString := TwwDBLookupCombo(Sender).Text;
end;

procedure TFrmCadGrupoRateioFluxo.dblcMoedaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('MOEDA').AsString := TwwDBLookupCombo(Sender).Text;
end;

procedure TFrmCadGrupoRateioFluxo.dblcCentroResponDropDown(
  Sender: TObject);
begin
  inherited;
  sCentroRespon :=  dblcCentroRespon.Text;
end;

procedure TFrmCadGrupoRateioFluxo.dblcCentroResponChange(Sender: TObject);
begin
  inherited;
  //Carrega cdsTipoRecDes
  if not (cds.State in [dsInsert,dsEdit]) then
    Exit;

  dblcTipoRD.Clear;
  dblcLinhasFluxo.Clear;
  dblcTipoDocurmento.Clear;

  if (Cds.RecordCount > 1) then
  begin
    dblcLinhasFluxo.Text    := '';
    dblcTipoRD.Text         := '';
    dblcTipoDocurmento.Text := '';
  end;
end;

procedure TFrmCadGrupoRateioFluxo.cboFluxoCaixaDropDown(Sender: TObject);
begin
  inherited;
  sFluxoCaixa := cboFluxoCaixa.KeyValue;
end;

procedure TFrmCadGrupoRateioFluxo.dblcLinhasFluxoEnter(Sender: TObject);
begin
  inherited;
  cdsLinhaFluxo.Data := CtrlMovimFluxoOrc.ListLinhasFluxo(Sistema.IdEmpresa,
                                                          dblcCentroRespon.LookupValue,
                                                          StrToIntDef(cboFluxoCaixa.KeyValue,0));
end;

procedure TFrmCadGrupoRateioFluxo.dblcTipoRDEnter(Sender: TObject);
begin
  inherited;
  CarregaComboTRD(Sistema.IdEmpresa,
                  StrToIntDef(cboFluxoCaixa.KeyValue,-1),
                  StrToIntDef(dblcLinhasFluxo.LookupValue,0),
                  dblcCentroRespon.LookupValue);
end;

procedure TFrmCadGrupoRateioFluxo.dblcTipoDocurmentoEnter(Sender: TObject);
var
   sRecPag: string;
begin
   inherited;

   if Trim(dblcTipoRD.Text) <> '' then
      sRecPag := cdsTipoRecDes.FieldByName('RECPAG').AsString
   else
      sRecPag := 'X';

   cdsTipoDoc.Filtered := False;
   cdsTipoDoc.Filter   := 'RECPAG = ' + QuotedStr(sRecPag);
   cdsTipoDoc.Filtered := True;
end;

procedure TFrmCadGrupoRateioFluxo.CarregaComboTRD(iIdEmpresa,
  iIdFluxoCaixa, iCodLinhaFluxo: integer; sCodCentroRespon: string);
begin
   cdsTipoRecDes.Data := CtrlListTerceiros.ListaTipoRecDesxCRespFromFluxo(iIdEmpresa,
                                                                          sCodCentroRespon,
                                                                          iIdFluxoCaixa,
                                                                          iCodLinhaFluxo);
end;

procedure TFrmCadGrupoRateioFluxo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  bLinhaFluxoPreenchido:=false;
  bTRDPreenchido:=false;
end;

procedure TFrmCadGrupoRateioFluxo.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (CdsFluxoCaixa.RecordCount = 1) then
  begin
    cdsDet.FieldByName('IDFLUXOCAIXA').Value := CdsFluxoCaixa.FieldByName('IDFLUXOCAIXA').Value;
    cdsDet.FieldByName('FLUXOCAIXA').Value := CdsFluxoCaixa.FieldByName('DESCRICAO').Value;
  end;
end;

procedure TFrmCadGrupoRateioFluxo.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dblcLinhasFluxoEnter(dblcLinhasFluxo);
  dblcTipoRDEnter(dblcTipoRD);
end;

procedure TFrmCadGrupoRateioFluxo.dblcProgramaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then cdsDet.FieldByName('PROGRAMA').AsString := TwwDBLookupCombo(Sender).Text;

end;

procedure TFrmCadGrupoRateioFluxo.dbRGTipoRateioChange(Sender: TObject);
begin
  inherited;
  if dbRGTipoRateio.Value = 'P' then //Leandro WO13599
    dbedtPercent.Enabled := true
  else
    dbedtPercent.Enabled := false;

end;

end.
