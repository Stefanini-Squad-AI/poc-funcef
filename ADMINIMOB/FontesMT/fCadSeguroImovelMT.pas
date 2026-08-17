{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     CADASTRO DE SEGUROS DE IMOVEIS  ( MT )

     Módulo          :  AdminImob
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  21/10/2002
     Data de Término :  21/10/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 26236
Responsável : Daniel Simões
Data        : 21/09/2007
Descrição   : Implementação do cadastro de Rateio de Seguros por Imóvel...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadSeguroImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,
  mSeguradora, mImovelouMestre, Provider, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, wwriched, DBCtrls,
  Wwdotdot, Wwdbcomb, mResponsavel, uCtrlSeguroImovel, uCtrlImovelxProp,
  uCMTypes, uCmSqlParams, wwdblook, uCtrlGrupoRateio;

type
  TfrmCadSeguroImovelMT = class(TFrmCadastroMestreDetMTImob)
    molImovelouMestre1: TmolImovelouMestre;
    molSeguradora1: TmolSeguradora;
    Label2: TLabel;
    DBedtApolice: TwwDBEdit;
    Label1: TLabel;
    edtRegistro: TwwDBEdit;
    Label4: TLabel;
    DBedtVlrPremio: TDBRealEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    edtDataIni: TCMDateTimePicker;
    Label9: TLabel;
    DBedtDataFim: TCMDateTimePicker;
    qry: TwwQuery;
    qryIDSEGUROIMOVEL: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryIDSEGURADORA: TFloatField;
    qryNF_SEGURADORA: TStringField;
    qryRS_SEGURADORA: TStringField;
    qrySGIAPOLICE: TStringField;
    qrySGIREGISTRO: TStringField;
    qrySGIDATAINI: TDateTimeField;
    qrySGIDATAFIM: TDateTimeField;
    qrySGIVLRSEGURO: TFloatField;
    qrySGIVLRPREMIO: TFloatField;
    qrySGIRESPSEGURO: TStringField;
    qrySGIRESPOUTROS: TStringField;
    qryOBSERVACAO: TMemoField;
    qryIMOVEL_EXTENSO: TStringField;
    qryIDIMOVELMESTRE: TFloatField;
    DataSetProvider1: TDataSetProvider;
    Label43: TLabel;
    DBcboResponsavel: TwwDBComboBox;
    Label6: TLabel;
    DBedtRespOutros: TDBEdit;
    tbsCobertura: TTabSheet;
    tbsObs: TTabSheet;
    Panel1: TPanel;
    DBmemObservacao: TwwDBRichEdit;
    molResponsavel1: TmolResponsavel;
    cdsDetCobertura: TCMClientDataSet;
    CMSql: TCMSqlParams;
    cdsDetCoberturaIDSEGUROIMOXCOB: TFloatField;
    cdsDetCoberturaIDSEGUROIMOVEL: TFloatField;
    cdsDetCoberturaNOMECOBERTURA: TStringField;
    cdsDetCoberturaDESCCOBERTURA: TMemoField;
    cdsDetCoberturaVLRCOBERTURA: TFloatField;
    Panel3: TPanel;
    dbgrdDetCobertura: TwwDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    DbEdtCobertura: TDBEdit;
    DbEdtValorCobertura: TDBEdit;
    Panel4: TPanel;
    gbCobertura: TGroupBox;
    Panel7: TPanel;
    DBMemDescricao: TwwDBRichEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    DBedtVlrSeguro: TDBRealEdit;
    Label5: TLabel;
    dbLMITot: TDBRealEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    cdsDetCoberturaVLRFUNDACAO: TFloatField;
    Label12: TLabel;
    dbValorFundacao: TDBEdit;
    sbCalcFundacao: TSpeedButton;
    dbRgStatus: TDBRadioGroup;
    tbsRateio: TTabSheet;
    CMClientDataSet1: TCMClientDataSet;
    wwDataSource1: TwwDataSource;
    MS_Documento_OLD_VW: TMontaSelect;
    cdsGrupo: TCMClientDataSet;
    dsGrupo: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    cdsGrupoIDGRUPORATEIO: TFloatField;
    cdsGrupoIDMODULO: TFloatField;
    cdsGrupoGRRDESCRICAO: TStringField;
    cdsGrupoIMOCODIGO: TStringField;
    cdsIndicadores: TCMClientDataSet;
    cdsIndicadoresINMDESCRICAO: TStringField;
    cdsIndicadoresIDINDICADORIMOVEL: TFloatField;
    dsIndicadores: TwwDataSource;
    sqlIndicadores: TCMSqlParams;
    cdsImoveisRateio: TCMClientDataSet;
    dsImoveisRateio: TwwDataSource;
    cdsImoveisRateioIMOCODIGO: TStringField;
    cdsImoveisRateioIDIMOVEL: TFloatField;
    cdsImoveisRateioNOMEIMOVEL: TStringField;
    cdsImoveisRateioNOMEMESTRE: TStringField;
    cdsImoveisRateioPERCENTAREA: TFloatField;
    cdsImoveisRateioDESCINDICADOR: TStringField;
    cdsImoveisRateioIDINDICADORIMOVEL: TFloatField;
    cdsImoveisRateioIDDOCUMENTO: TFloatField;
    cdsImoveisRateioIDSEGUROIMOVEL: TFloatField;
    cdsImoveisRateioIDINDICADORXAPUR: TFloatField;
    cdsImoveisRateioMESCOMPETENCIA: TFloatField;
    cdsImoveisRateioANOCOMPETENCIA: TFloatField;
    cdsImoveisRateioDATAAPURADO: TDateTimeField;
    cdsImoveisRateioFLGPREVREAL: TStringField;
    cdsImoveisRateioFLGTIPOAPURACAO: TStringField;
    cdsImoveisRateioVLRAPURADO: TFloatField;
    cdsIndicadorXApur: TCMClientDataSet;
    cdsImoveisRateioOBSERVACAO: TStringField;
    MS_Documento: TMontaSelect;
    pnlDetalhe: TPanel;
    grbPagamento: TGroupBox;
    Label22: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtDataVencimento: TCMDateTimePicker;
    edtDataPagamento: TCMDateTimePicker;
    btnBuscaDoc: TBitBtn;
    edtDocumento: TEdit;
    edtValor: TRealEdit;
    grbRateio: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    dbcboGrupo: TwwDBLookupCombo;
    dbcboIndicador: TwwDBLookupCombo;
    btnRatear: TButton;
    Panel9: TPanel;
    dbgrdDetImoveis: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
    procedure sbCalcFundacaoClick(Sender: TObject);
    procedure btnBuscaDocClick(Sender: TObject);
    procedure btnRatearClick(Sender: TObject);
    procedure dbgrdDetImoveisUpdateFooter(Sender: TObject);
    procedure dbgrdDetImoveisCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);

  private
    { Private declarations }
    CtrlSeguroImovel : TCtrlSeguroImovel;
    CtrlImovelxProp  : TCtrlImovelxProp;
    CtrlGrupoRateio  : TCtrlGrupoRateio; // Daniel - 26236

    fPercFundacao : Extended;

    procedure RateiaQueryImovel; // Daniel - 26236

    procedure Seleciona (const iIdSeguro: Integer);
    function VerificaPreenchimento: Boolean;

    function VerificaPreenchimentoRateio: Boolean; // Daniel - 26236

  public
    { Public declarations }
    Procedure AbreContrato(const iIdContrato: Integer);
    Function  BuscaPercentualFundacao: Extended;
  end;

var
  frmCadSeguroImovelMT: TfrmCadSeguroImovelMT;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uModuloImobiliario,
     uVerificaPreenchimento, dMS, uDiasInUteis;

{$R *.DFM}

procedure TfrmCadSeguroImovelMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria os CtrlObjects dos objetos a serem utilizados
  CtrlSeguroImovel := TCtrlSeguroImovel.Create;
  CtrlImovelxProp  := TCtrlImovelxProp.Create;
  CtrlGrupoRateio  := TCtrlGrupoRateio.Create; // Daniel - 26236

  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlSeguroImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);
  CtrlImovelxProp.InitializeAs(CtrlSeguroImovel);
  CtrlGrupoRateio.InitializeAs(CtrlSeguroImovel); // Daniel - 26236

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlSeguroImovel.CdsSeguroImovel  := Cds;
  CtrlSeguroImovel.CdsSeguroImoXCob := CdsDetCobertura;

  CtrlSeguroImovel.CdsIndicadorXApur := cdsIndicadorXApur; // Daniel - 26236

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsDetCobertura.CreateDataSet;

  // Abre cds em branco e posiciona na primeira Guia
  Seleciona( -2 );
  pgctrlDetalhe.ActivePageIndex := 0;
end;

procedure TfrmCadSeguroImovelMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlSeguroImovel );
  FreeAndNil( CtrlImovelxProp );
  FreeAndNil( CtrlGrupoRateio ); // Daniel - 26236

  inherited;
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroFind(Sender: TObject);
var cdsTemp    : TCMClientDataSet;
begin
  inherited;

  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then begin
    Seleciona( StrToInt(MontaSelect.ValoresChave[0]) );

// Daniel - 26236 - Início -----------------------------------------------------
    cdsIndicadorXApur.Data := cdsImoveisRateio.Data;

    try
      cdsTemp                := TCMClientDataSet.Create( nil );
      cdsTemp.Data           := CtrlSeguroImovel.LookupDocSeguro(cdsImoveisRateio.FieldByName('IDDOCUMENTO').AsInteger);
      edtDocumento.Text      := cdsImoveisRateio.FieldByName('IDDOCUMENTO').AsString;
      edtDataVencimento.Date := cdsTemp.FieldByName('DATAVENCTO').AsDateTime;
      edtDataPagamento.Date  := cdsTemp.FieldByName('DATA_BAIXA').AsDateTime;
      edtValor.Value         := cdsTemp.FieldByName('VALOR').AsFloat;
    finally
      FreeAndNil(cdsTemp);
    end;
// Daniel - 26236 - Final ------------------------------------------------------

  end;
end;

procedure TfrmCadSeguroImovelMT.AbreContrato(const iIdContrato: Integer);
begin
   // Abre a tela de contrato já com o contrato selecionado
   Seleciona( iIdContrato );
   CmeCadastro.AtualizaBotoes( Self );
   sbtnAlterar.Enabled := True;
   sbtnApagar.Enabled  := True;
   Show;
end;

procedure TfrmCadSeguroImovelMT.Seleciona(const iIdSeguro: Integer);
var iAno, iMes : word; // Daniel - 26236
begin
  // Carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data             := CtrlSeguroImovel.LookupSeguroImovel(iIdSeguro);
  CdsDetCobertura.Data := CtrlSeguroImovel.LookupSeguroImoXCob(iIdSeguro); // Marcio Motta - 20/07/2004 - 16877

// Daniel - 26236 - Início -----------------------------------------------------
  iAno := DiasInUteis.ExtraiAno(Cds.FieldByName('SGIDATAINI').AsDateTime);
  iMes := DiasInUteis.ExtraiMes(Cds.FieldByName('SGIDATAINI').AsDateTime);

  cdsImoveisRateio.Data  := CtrlGrupoRateio.LookupRateioImovel(iIdSeguro,Cds.FieldByName('IDIMOVEL').AsInteger,iAno,iMes);
  cdsIndicadorXApur.Data := cdsImoveisRateio.Data;
  sqlIndicadores.Open;
  dbcboIndicador.LookupValue := cdsImoveisRateioIDINDICADORIMOVEL.AsString;
// Daniel - 26236 - Fim --------------------------------------------------------

  molImovelouMestre1.iImovel          := Cds.FieldByName('IDIMOVEL').AsInteger;
  molImovelouMestre1.edtImovel.Text   := Cds.FieldByName('IMOVEL_EXTENSO').AsString;
  molSeguradora1.iSeguradora          := Cds.FieldByName('IDSEGURADORA').AsInteger;
  molSeguradora1.edtSeguradora.Text   := Cds.FieldByName('RS_SEGURADORA').AsString;
  molResponsavel1.iResponsavel        := Cds.FieldByName('IDRESPONSAVEL').AsInteger;
  molResponsavel1.edtResponsavel.Text := Cds.FieldByName('NOME_RESPONSAVEL').AsString;

  if not Cds.FieldByName('IDIMOVELMESTRE').IsNull then
       molImovelouMestre1.iMestre := Cds.FieldByName('IDIMOVELMESTRE').AsInteger
  else molImovelouMestre1.iMestre := -1;

  fPercFundacao := BuscaPercentualFundacao;

  cdsGrupo.Data := CtrlGrupoRateio.LookupGrupoXMestre(Cds.FieldByName('IDIMOVEL').AsInteger); // Daniel - 26236
end;

function TfrmCadSeguroImovelMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if molImovelouMestre1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um Imóvel',molImovelouMestre1.btnBuscaImovel);

     if molSeguradora1.iSeguradora <= 0 then
        raise EValidacao.CreateVal('Selecione uma Seguradora',molSeguradora1.btnBuscaSeguradora);

     if DBedtApolice.Text = '' then
        raise EValidacao.CreateVal('Informe o Nr. da Apólice',DBedtApolice);

     if edtDataIni.Text = '' then
        raise EValidacao.CreateVal('Informe a data de início de vigência',edtDataIni);

     if DBedtDataFim.Text = '' then
        raise EValidacao.CreateVal('Informe a data de término de vigência',DBedtDataFim);

     if DBedtVlrPremio.Value <= 0 then
        raise EValidacao.CreateVal('Informe o Valor Segurado!', DBedtVlrPremio);

     if cdsDetCobertura.IsEmpty then
        raise EValidacao.CreateVal('Informe pelo menos uma cobertura e seu valor!', DBedtVlrSeguro);

      if DBcboResponsavel.Text = '' then
         raise EValidacao.CreateVal('Informe o Responsável pelo Seguro!', DBcboResponsavel);

  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Result := True;
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa os Frames
  molImovelouMestre1.btnLimpaImovelClick( Self );
  molSeguradora1.btnLimpaSeguradoraClick( Self );
  molResponsavel1.btnLimpaResponsavelClick( Self );

  // Abre cds em branco
  Seleciona(-2);

  inherited;

  cds.FieldByName('FLGSTATUS').AsString := 'V';
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Limpa campos memo
  if DBmemObservacao.Text = '' then Cds.FieldByName('OBSERVACAO').Clear;

  // Atualiza o status quando nulo.
  if cds.FieldByName('FLGSTATUS').IsNull then begin
     if cds.FieldByName('SGIDATAFIM').AsDateTime > Date then
          cds.FieldByName('FLGSTATUS').AsString := 'V'
     else cds.FieldByName('FLGSTATUS').AsString := 'E';
  end;

  // Carrega os valores dos Frames
  Cds.FieldByName('IDIMOVEL').AsFloat      := molImovelouMestre1.iImovel;
  Cds.FieldByName('IDSEGURADORA').AsFloat  := molSeguradora1.iSeguradora;
  if molResponsavel1.iResponsavel > 0 then
       Cds.FieldByName('IDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel
  else Cds.FieldByName('IDRESPONSAVEL').Clear;

// Daniel - 26236 - Início -----------------------------------------------------
  if cdsImoveisRateio.UpdateStatus in [usInserted, usModified] then begin
    Cds.FieldByName('CODDOCUMENTO').AsInteger := StrToInt(edtDocumento.Text);

    cdsIndicadorXApur.Data := CtrlGrupoRateio.LookupRateioImovel(-2);
    cdsImoveisRateio.DisableControls;
    cdsImoveisRateio.First;
    while not cdsImoveisRateio.eof do
    begin
      if (cdsImoveisRateio.FieldByName('VLRAPURADO').AsFloat>0) then begin
        cdsIndicadorXApur.Insert;
        cdsIndicadorXApur.FieldByName('VLRAPURADO').AsFloat          := cdsImoveisRateio.FieldByName('VLRAPURADO').AsFloat;
        cdsIndicadorXApur.FieldByName('ANOCOMPETENCIA').AsInteger    := cdsImoveisRateio.FieldByName('ANOCOMPETENCIA').AsInteger;
        cdsIndicadorXApur.FieldByName('MESCOMPETENCIA').AsInteger    := cdsImoveisRateio.FieldByName('MESCOMPETENCIA').AsInteger;
        cdsIndicadorXApur.FieldByName('DATAAPURADO').AsDateTime      := cdsImoveisRateio.FieldByName('DATAAPURADO').AsDateTime;
        cdsIndicadorXApur.FieldByName('FLGPREVREAL').AsString        := cdsImoveisRateio.FieldByName('FLGPREVREAL').AsString;
        cdsIndicadorXApur.FieldByName('FLGTIPOAPURACAO').AsString    := cdsImoveisRateio.FieldByName('FLGTIPOAPURACAO').AsString;
        cdsIndicadorXApur.FieldByName('IDDOCUMENTO').AsInteger       := cdsImoveisRateio.FieldByName('IDDOCUMENTO').AsInteger;
        cdsIndicadorXApur.FieldByName('IDINDICADORIMOVEL').AsInteger := cdsImoveisRateio.FieldByName('IDINDICADORIMOVEL').AsInteger;
        cdsIndicadorXApur.FieldByName('IDIMOVEL').AsInteger          := cdsImoveisRateio.FieldByName('IDIMOVEL').AsInteger;
        cdsIndicadorXApur.FieldByName('OBSERVACAO').AsString         := cdsImoveisRateio.FieldByName('OBSERVACAO').AsString;
        cdsIndicadorXApur.Post;
      end;
      cdsImoveisRateio.Next;
    end;
    cdsImoveisRateio.First;
    cdsImoveisRateio.EnableControls;
  end;
// Daniel - 26236 - Fim --------------------------------------------------------

  Accept := CtrlSeguroImovel.GravaSeguroImovel;
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlSeguroImovel.ExcluiSeguroImovel;
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  Seleciona( Cds.FieldByName('IDSEGUROIMOVEL').AsInteger );
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // Habilita as páginas e campos memo somente na edição ou inserção
  // Marcio Motta - 20/07/2004 - 16877
  if cmeCadastro.Operacao in [opInserir, opAlterar] then begin
    tbsDet.Enabled          := True;
    DBmemDescricao.ReadOnly := False;
    pnlDetalhe.Enabled      := cdsImoveisRateio.IsEmpty; // Daniel - 26236
  end else begin
    tbsDet.Enabled          := False;
    pnlDetalhe.Enabled      := False; // Daniel - 26236
    DBmemDescricao.ReadOnly := True;
  end;
end;

procedure TfrmCadSeguroImovelMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsCobertura then begin
    if cdsDetCobertura.State in dsEditModes then
         gbCobertura.Enabled := True
    else gbCobertura.Enabled := False;
  end;
end;


procedure TfrmCadSeguroImovelMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Verifica o preenchimento dos campos de descrição da cobertura e seu valor
  // Marcio Motta - 20/07/2004 - 16877
  Accept := True;
  if pgctrlDetalhe.ActivePage = tbsCobertura then
    begin
      if (DbEdtCobertura.Text = '') then begin
         MsgDlg('Informe o nome da cobertura.','Aviso',mtWarning,[mbOK],0);
         Accept := False;
         EXIT;
      end;

      if (DbEdtValorCobertura.Text = '') then begin
         MsgDlg('Informe o valor da cobertura.','Aviso',mtWarning,[mbOK],0);
         Accept := False;
         EXIT;
      end;

      if (DbValorFundacao.Text = '') then begin
         MsgDlg('Informe o valor da cobertura para a fundação.','Aviso',mtWarning,[mbOK],0);
         Accept := False;
         EXIT;
      end;

    end;
end;

procedure TfrmCadSeguroImovelMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  // Limpa os Frames
  molImovelouMestre1.btnLimpaImovelClick( Self );
  molSeguradora1.btnLimpaSeguradoraClick( Self );
  molResponsavel1.btnLimpaResponsavelClick( Self );

// Daniel - 26236 - Início -----------------------------------------------------
  cdsImoveisRateio.Close;
  dbcboIndicador.LookupValue := '';
  dbcboGrupo.LookupValue     := '';
  edtDocumento.Text          := '';
  edtDataVencimento.Text     := '';
  edtDataPagamento.Text      := '';
  edtValor.Text              := '';
// Daniel - 26236 - Fim --------------------------------------------------------
end;

function TfrmCadSeguroImovelMT.BuscaPercentualFundacao: Extended;
var cdsTemp : TCMClientDataSet;
    idMestre : Integer;
begin
  try
     if molImovelouMestre1.iMestre > 0 then
          idMestre := molImovelouMestre1.iMestre
     else idMestre := molImovelouMestre1.iImovel;

     cdsTemp := TCMClientDataSet.Create(nil);
     cdsTemp.Data := CtrlImovelxProp.SelecionaImovelXProp(idMestre, Sistema.IdEmpresa);
     if not cdsTemp.IsEmpty then
          Result := cdsTemp.FieldByName('PERCENTUAL').AsFloat
     else Result := 0;
  finally
     FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmCadSeguroImovelMT.molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.btnBuscaImovelClick(Sender);
  fPercFundacao := BuscaPercentualFundacao;

  cdsGrupo.Data := CtrlGrupoRateio.LookupGrupoXMestre(molImovelouMestre1.iImovel); // Daniel - 26236
end;

procedure TfrmCadSeguroImovelMT.sbCalcFundacaoClick(Sender: TObject);
begin
  inherited;
  if not cdsDetCoberturaVLRCOBERTURA.IsNull then begin
    cdsDetCoberturaVLRFUNDACAO.AsFloat := cdsDetCoberturaVLRCOBERTURA.AsFloat * (fPercFundacao / 100);
    dbValorFundacao.SetFocus;
  end;
end;

procedure TfrmCadSeguroImovelMT.btnBuscaDocClick(Sender: TObject);
begin
  inherited;

// Daniel - 26236 - Início ----------------------------------------------------- ALTERAR AQUI (CENTRALIZAR)
  if (molImovelouMestre1.iImovel<=0) then begin
    MsgDlg('Um imóvel deve ser selecionado primeiro.','Aviso',mtWarning,[mbOk],0);
    molImovelouMestre1.btnBuscaImovelClick(Sender);
  end else begin
    MS_Documento.Filtro.Add('IDIMOVELMESTRE = '+IntToStr(molImovelouMestre1.iImovel));
    MS_Documento.Executar;

    if (MS_Documento.RetornouValor) then begin
      edtDocumento.Text      := MS_Documento.ValoresChave[0]; // CODDOCUMENTO
      edtDataVencimento.Text := MS_Documento.ValoresChave[1]; // DATAVENCIMENTO
      edtDataPagamento.Text  := MS_Documento.ValoresChave[2]; // DATA_BAIXA
      edtValor.Text          := MS_Documento.ValoresChave[3]; // VALOR_LANC
    end;
  end;
// Daniel - 26236 - Fim --------------------------------------------------------

end;

procedure TfrmCadSeguroImovelMT.btnRatearClick(Sender: TObject);
begin
  inherited;

  if VerificaPreenchimentoRateio then RateiaQueryImovel; // Daniel - 26236
end;

procedure TfrmCadSeguroImovelMT.dbgrdDetImoveisUpdateFooter(Sender: TObject);
var fTotalAtual, fTotalAnt : Currency;
    cdsTemp : TCMClientDataSet;
begin
  inherited;

// Daniel - 26236 - Início -----------------------------------------------------
  fTotalAtual := 0;

  try
    try
      cdsTemp          := TCMClientDataSet.Create( nil );
      cdsTemp.Data     := cdsImoveisRateio.Data;
      cdsTemp.Filter   := cdsImoveisRateio.Filter;
      cdsTemp.Filtered := cdsImoveisRateio.Filtered;
      cdsTemp.First;

      while not cdsTemp.Eof do begin
        fTotalAtual := fTotalAtual + cdsTemp.FieldByName('VLRAPURADO').AsCurrency;
        cdsTemp.Next
      end;

      dbgrdDetImoveis.ColumnByName('VLRAPURADO').FooterValue := FormatFloat(',0.00', fTotalAtual);
    except end;
  finally
    FreeAndNil( cdsTemp );
  end;
// Daniel - 26236 - Fim --------------------------------------------------------

end;

procedure TfrmCadSeguroImovelMT.dbgrdDetImoveisCalcCellColors(Sender:TObject; Field:TField; State:TGridDrawState;
                                                              Highlight:Boolean; AFont:TFont; ABrush:TBrush);
begin
  inherited;
// Daniel - 26236 - Início -----------------------------------------------------
  // Faz com que as linhas do grid tenham cores alternadas...
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco...
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // Amarelo bebê...
        end else begin
           ABrush.Color := clWindow;
        end;
     end;
     // Colorir a coluna do dia...
     if (State <> [gdSelected]) and (Field.Name = 'cdsImoveisRateio') then begin
        ABrush.Color :=  clRed;
        AFont.Color  := clWindow;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
// Daniel - 26236 - Fim --------------------------------------------------------
end;

// Daniel - 26236 - Início -----------------------------------------------------
procedure TfrmCadSeguroImovelMT.RateiaQueryImovel;
var iAno, iMes : word;
    iIndicador : Integer;
    iGrupo     : Integer;
    fValor     : Double;
    fTotRateio : Double;
begin
  iAno       := DiasInUteis.ExtraiAno(edtDataIni.Date);
  iMes       := DiasInUteis.ExtraiMes(edtDataIni.Date);
  iIndicador := cdsIndicadoresIDINDICADORIMOVEL.AsInteger;

  if dbcboGrupo.Value<>'' then
       iGrupo := cdsGrupoIDGRUPORATEIO.AsInteger
  else iGrupo := -1;

  fValor     := edtValor.Value;
  fTotRateio := 0;

  cdsImoveisRateio.Data := CtrlGrupoRateio.LookupRateioImovel(-1,molImovelouMestre1.iImovel,iAno,iMes,iIndicador,iGrupo);
  cdsImoveisRateio.First;

  with cdsImoveisRateio do begin
    while not Eof do begin
      Edit;
      FieldByName('DESCINDICADOR').AsString      := cdsIndicadores.FieldByName('INMDESCRICAO').AsString;
      FieldByName('VLRAPURADO').AsFloat          := FieldByName('PERCENTAREA').AsFloat * fValor;
      FieldByName('ANOCOMPETENCIA').AsInteger    := iAno;
      FieldByName('MESCOMPETENCIA').AsInteger    := iMes;
      FieldByName('DATAAPURADO').AsDateTime      := edtDataIni.Date;
      FieldByName('FLGPREVREAL').AsString        := 'P';
      FieldByName('FLGTIPOAPURACAO').AsString    := 'A';
      FieldByName('IDDOCUMENTO').AsInteger       := StrToInt(edtDocumento.Text);
      FieldByName('IDINDICADORIMOVEL').AsInteger := cdsIndicadores.FieldByName('IDINDICADORIMOVEL').AsInteger;
      FieldByName('OBSERVACAO').AsString         := 'Valor total do documento do seguro de locação';
      fTotRateio                                 := fTotRateio + FieldByName('VLRAPURADO').AsFloat;
      Post;
      Next;
    end;

    Last;
    Edit;
    // O último registro recebe a sobra...
    FieldByName('VLRAPURADO').AsFloat := FieldByName('VLRAPURADO').AsFloat + (fValor - fTotRateio);
    Post;

  end;
end;

function TfrmCadSeguroImovelMT.VerificaPreenchimentoRateio: Boolean;
begin
  Result := False;

  try
    if (edtDataIni.Text='') then begin
      pgctrlDetalhe.ActivePageIndex := 0;
      tbcDetalhe.TabIndex           := 0;
      raise EValidacao.CreateVal('A data da apólice deve ser preenchida!',edtDataIni);
    end;

    if (edtDocumento.Text='') and (dbcboGrupo.LookupValue='') then
      raise EValidacao.CreateVal('Selecione um documento ou um grupo de rateio.',edtDocumento);

    if (dbcboIndicador.LookupValue='') then
      raise EValidacao.CreateVal('Selecione um indicador.',dbcboIndicador);

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;
// Daniel - 26236 - Fim --------------------------------------------------------

end.
