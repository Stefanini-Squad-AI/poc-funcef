unit fCadContratoLojaMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE CONTRATO DE LOJAS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  16/05/2002
//      Data de Término :  17/05/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TREdit,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, DBCtrls, DBTables, Provider, wwriched,
  Wwdbspin, wwdblook, mImovel, mLoja, uCtrlContratoLoja, uCtrlMarcas,
  uCtrlAtividade, uCMTypes, uCtrlMoeda, uCtrlSitContImob, uCtrlEventoImovel,
  Wwdbgrd2;


type
  TfrmCadContratoLojaMT = class(TFrmCadastroMestreDetMTImob)
    Label1: TLabel;
    Label2: TLabel;
    rbTipoContrato: TDBRadioGroup;
    edNumContrato: TwwDBEdit;
    edNomContrato: TwwDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    tbsAluguel: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    tbsObs: TTabSheet;
    tbsEventos: TTabSheet;
    tbsDatas: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cmdtIni: TCMDateTimePicker;
    cmdtFim: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    cmdtAudit: TCMDateTimePicker;
    Panel1: TPanel;
    grpReajuste: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    Label12: TLabel;
    Label50: TLabel;
    DBedtProxReajuste: TCMDateTimePicker;
    DBcboIndiceReajuste: TwwDBLookupCombo;
    DBspnPeriodicidadeReajuste: TwwDBSpinEdit;
    DBedtUltReajuste: TCMDateTimePicker;
    Label10: TLabel;
    dbedtNomeLoja: TwwDBEdit;
    CdsIDCONTRATO: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsNUMCONTRATO: TStringField;
    CdsNOMCONTRATO: TStringField;
    CdsTIPOCONTRATO: TStringField;
    CdsLOJAS: TStringField;
    CdsVLRALUGMIN: TFloatField;
    CdsDATINICIO: TDateTimeField;
    CdsDATTERMINO: TDateTimeField;
    CdsPERALUGVARIAVEL: TFloatField;
    CdsDATULTAUDITORIA: TDateTimeField;
    CdsIDATIVIDADE: TFloatField;
    CdsIDMARCA: TFloatField;
    CdsNOME_EXTENSO: TStringField;
    cdsDet: TCMClientDataSet;
    molImovel1: TmolImovel;
    cdsDetIDCONTRATO: TFloatField;
    cdsDetIDLOJA: TFloatField;
    cdsDetPISO: TStringField;
    cdsDetNUMLOJA: TStringField;
    DBcboMarca: TwwDBLookupCombo;
    DBcboAtividade: TwwDBLookupCombo;
    cdsMarcas: TCMClientDataSet;
    cdsAtividade: TCMClientDataSet;
    cdsMarcasIDMARCA: TFloatField;
    cdsMarcasMRCNOME: TStringField;
    cdsAtividadeIDATIVIDADE: TFloatField;
    cdsAtividadeATVDESCRICAO: TStringField;
    Label3: TLabel;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    cdsDetIDIMOVEL: TFloatField;
    cdsDetQTDEABL: TFloatField;
    CdsINDICEREAJUSTE: TFloatField;
    CdsDATREAJUSTE: TDateTimeField;
    CdsDATPROXREAJUSTE: TDateTimeField;
    CdsPERREAJUSTE: TFloatField;
    CdsDESCRICAO: TMemoField;
    cdsMoeda: TCMClientDataSet;
    cdsMoedaMOECODIGO: TFloatField;
    cdsMoedaMOEDESC: TStringField;
    cdsMoedaMOESIGLA: TStringField;
    cdsMoedaMOEPERIODICIDADE: TStringField;
    cdsMoedaFLGPERCVALOR: TStringField;
    sbNomeLoja: TSpeedButton;
    Label11: TLabel;
    dbedtAbl: TDBRealEdit;
    CdsQTDEABL: TFloatField;
    molLoja1: TmolLoja;
    dbcbIndeterminado: TDBCheckBox;
    CdsFLGINDETERMINADO: TStringField;
    lblVigencia: TLabel;
    CdsFLGSTATUS: TStringField;
    cdsEventos: TCMClientDataSet;
    cdsEventosEVIDATA: TDateTimeField;
    cdsEventosEVICABECALHO: TStringField;
    cdsEventosEVIDESCRICAO: TMemoField;
    cdsEventosIDUSUARIO: TFloatField;
    cdsEventosFLGTIPOEVENTO: TStringField;
    cdsEventosEVIVLRANTERIOR: TFloatField;
    cdsEventosEVIVLRAJUSTADO: TFloatField;
    cdsEventosEVIDATAPROX: TDateTimeField;
    cdsEventosEVIPERCENT: TFloatField;
    cdsEventosIDCONTRATOLOJA: TFloatField;
    cdsEventosIDEVENTOIMOVEL: TFloatField;
    cdsEventosDSC_INDICE: TStringField;
    dsEventos: TwwDataSource;
    pnlSituacao: TPanel;
    Label13: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    cdsSitContImob: TCMClientDataSet;
    dsSitContImob: TwwDataSource;
    cdsSitContImobIDSITCONTIMOB: TFloatField;
    cdsSitContImobDESCRICAO: TStringField;
    CdsIDSITCONTIMOB: TFloatField;
    DBmemObservacao: TwwDBRichEdit;
    Panel5: TPanel;
    gbEvento: TGroupBox;
    Panel7: TPanel;
    DBmemDescricao: TwwDBRichEdit;
    Panel4: TPanel;
    Panel10: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    Label36: TLabel;
    DBedtDataEvento: TCMDateTimePicker;
    DBedtCabEvento: TDBEdit;
    DBedtVlrAnterior: TDBEdit;
    DBedtVlrAjustado: TDBEdit;
    DBedtPercent: TDBEdit;
    CMDateTimePicker1: TCMDateTimePicker;
    dbgrdEvento: TwwDBGrid2;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbNomeLojaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbTipoContratoChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure molLoja1btnBuscaLojaClick(Sender: TObject);
    procedure dbcbIndeterminadoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBgrdEventoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoLoja : TCtrlContratoLoja;
    CtrlMarcas       : TCtrlMarcas;
    CtrlAtividade    : TCtrlAtividade;
    CtrlMoeda        : TCtrlMoeda;
    CtrlEventoImovel : TCtrlEventoImovel;
    CtrlSitContImob  : TCtrlSitContImob;

    procedure SelecionaMestreDetalhe(const iId: Integer);
    function  CalculaTotalABL : Extended;
    function  VerificaPreenchimento : Boolean;
    function  VerificaPreenchimentoEvento : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadContratoLojaMT: TfrmCadContratoLojaMT;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadContratoLojaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlContratoLoja  := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlMarcas        := TCtrlMarcas.Create;
  CtrlAtividade     := TCtrlAtividade.Create;
  CtrlMoeda         := TCtrlMoeda.Create;
  CtrlEventoImovel  := TCtrlEventoImovel.Create;
  CtrlSitContImob   := TCtrlSitContImob.Create;

  CtrlContratoLoja.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);

  CtrlMarcas.InitializeAs(CtrlContratoLoja);
  CtrlAtividade.InitializeAs(CtrlContratoLoja);
  CtrlMoeda.InitializeAs(CtrlContratoLoja);
  CtrlEventoImovel.InitializeAs(CtrlContratoLoja);
  CtrlSitContImob.InitializeAs(CtrlContratoLoja);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlContratoLoja.CdsContratoLoja  := Cds;
  CtrlContratoLoja.CdsContratoXLoja := CdsDet;
  CtrlContratoLoja.CdsEventoImovel  := cdsEventos;  

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsDet.CreateDataSet;

  // Carrega os Cds de Lookup com os valores dos devidos CtrlObjects
  cdsMarcas.Data      := CtrlMarcas.LookupMarcas;
  cdsAtividade.Data   := CtrlAtividade.LookupAtividade;
  cdsMoeda.Data       := CtrlMoeda.ListaMoeda;
  cdsSitContImob.Data := CtrlSitContImob.LookupSitContImob;

  // Abre uma grid em branco com os eventos de contrato
  cdsEventos.Data   := CtrlEventoImovel.LookupEventoImovel(-1,-1,-1,-2,-1);

  // Define Defaults
  lblVigencia.Caption := '';
end;


procedure TfrmCadContratoLojaMT.FormDestroy(Sender: TObject);
begin
  // Elimina os Ctrls Criados
  FreeAndNil( CtrlSitContImob );
  FreeAndNil( CtrlMoeda );
  FreeAndNil( CtrlAtividade );
  FreeAndNil( CtrlMarcas );
  FreeAndNil( CtrlEventoImovel );
  FreeAndNil( CtrlContratoLoja );
  inherited;
end;


procedure TfrmCadContratoLojaMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );
  inherited;
  // Carrega Defaults
  edNumContrato.SetFocus;
  rbTipoContrato.ItemIndex     := 0;
  sbNomeLoja.Enabled           := True;
  CdsFLGINDETERMINADO.AsString := 'N';
  CdsFLGSTATUS.AsString        := 'V';
  lblVigencia.Caption          := 'Vigente';
end;

procedure TfrmCadContratoLojaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edNumContrato.SetFocus;
  sbNomeLoja.Enabled := True;
end;

procedure TfrmCadContratoLojaMT.SelecionaMestreDetalhe(const iId: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data        := CtrlContratoLoja.LookupContratoLoja( iId );
  CdsDet.Data     := CtrlContratoLoja.SelecionaContratoXLoja( iId );
  CdsEventos.Data := CtrlEventoImovel.LookupEventoImovel(-1,-1,-1,iId,-1);

  // Carrega os edits do frame com os valores retornados
  molImovel1.iImovel := CdsIDIMOVEL.AsInteger;
  molImovel1.edtImovel.Text := CdsNOME_EXTENSO.AsString;

  if CdsFLGINDETERMINADO.AsString = 'S' then
       cmdtFim.Enabled := False
  else cmdtFim.Enabled := True;

  if CdsFLGSTATUS.AsString = 'E' then
       lblVigencia.Caption := 'Encerrado'
  else lblVigencia.Caption := 'Vigente';
end;

procedure TfrmCadContratoLojaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     SelecionaMestreDetalhe( StrToInt(MontaSelect.ValoresChave[0]) );
  end;
end;

procedure TfrmCadContratoLojaMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  if not CdsDet.IsEmpty  then CdsQTDEABL.AsFloat    := CalculaTotalABL;
  if CdsFLGSTATUS.IsNull then CdsFLGSTATUS.AsString := 'V';
  CdsIDIMOVEL.AsFloat := molImovel1.iImovel;

  Accept := CtrlContratoLoja.GravaContratoLoja;
end;


procedure TfrmCadContratoLojaMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlContratoLoja.ExcluiContratoLoja;
  if Accept then SelecionaMestreDetalhe( -2 );
end;


procedure TfrmCadContratoLojaMT.CmeDetalheConfirma(Sender: TObject);
begin
  // Valida guia de Lojas
  if pgctrlDetalhe.ActivePageIndex = 0 then begin
    if cdsDet.State in dsEditModes then begin
       if molLoja1.iLoja > 0 then begin
          cdsDetIDLOJA.AsInteger   := molLoja1.iLoja;
          cdsDetPISO.AsString      := molLoja1.sPiso;
          cdsDetNUMLOJA.AsString   := molLoja1.sLoja;
          cdsDetIDIMOVEL.AsInteger := molLoja1.iImovel;
          cdsDetQTDEABL.AsFloat    := molLoja1.fAbl;
          inherited;
       end else begin
          MsgDlg('Selecione uma Loja','Aviso',mtWarning,[mbOK],0);
       end;
    end else begin
       inherited;
    end;
  end;

  // Valida a guia de Eventos
  if pgctrlDetalhe.ActivePageIndex = 4 then begin
     if cdsEventos.State in dsEditModes then begin
       if VerificaPreenchimentoEvento then begin
         CdsEventosIDUSUARIO.AsInteger    := Sistema.IdUsuario;
         CdsEventosFLGTIPOEVENTO.AsString := 'US';
         inherited;
       end;
     end else inherited;
  end;
end;


procedure TfrmCadContratoLojaMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  // limpa valores do frame após a inserção
  molLoja1.edtLoja.Text := '';
  molLoja1.iImovel      := -1;
  molLoja1.iLoja        := -1;
end;

procedure TfrmCadContratoLojaMT.sbtnInsDetClick(Sender: TObject);
begin
  // verifica se já foi selecionado o imóvel, pois a escolha das lojas deverá ser filtrada
  // pelo imóvel selecionado.
  if molImovel1.iImovel > 0 then begin
    inherited;
  end else begin
    MsgDlg('Selecione primeiro o Imóvel','Aviso',mtWarning,[mbOK],0);
    sbtnInsDet.Down := False;
  end;
end;

procedure TfrmCadContratoLojaMT.molLoja1btnBuscaLojaClick(Sender: TObject);
begin
  inherited;
  if molImovel1.iImovel > 0 then
       molLoja1.iImovelFiltro := molImovel1.iImovel
  else molLoja1.iImovelFiltro := -1;
  molLoja1.btnBuscaLojaClick(Sender);
end;

procedure TfrmCadContratoLojaMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Retorna os valores originais antes da alteração
  SelecionaMestreDetalhe( CdsIDCONTRATO.AsInteger );
  sbNomeLoja.Enabled := False;
end;

procedure TfrmCadContratoLojaMT.sbNomeLojaClick(Sender: TObject);
var sNome : String;
begin
  inherited;
  // Compõe no nome genérico das lojas para exibir nos relatórios
  sNome := '';
  CdsDet.First;
  while not CdsDet.Eof do begin
     sNome := sNome + cdsDetNUMLOJA.AsString;
     CdsDet.Next;
     if not CdsDet.Eof then sNome := sNome + '/';
  end;
  CdsLOJAS.AsString := sNome;
end;

procedure TfrmCadContratoLojaMT.FormShow(Sender: TObject);
begin
  inherited;
  // ABL do contrato somente poderá ser alterada para Quiosques
  dbedtAbl.Enabled   := False;
  sbNomeLoja.Enabled := False;
end;

procedure TfrmCadContratoLojaMT.rbTipoContratoChange(Sender: TObject);
begin
  inherited;
  // ABL do contrato somente poderá ser alterada para Quiosques
  if rbTipoContrato.ItemIndex = 2 then
       dbedtAbl.Enabled := True
  else dbedtAbl.Enabled := False;
end;

function TfrmCadContratoLojaMT.CalculaTotalABL: Extended;
var fTotAbl : Extended;
begin
  // Totaliza a ABL das lojas para gravar no contrato
  fTotAbl := 0;
  CdsDet.First;
  while not CdsDet.Eof do begin
    fTotAbl := fTotAbl + cdsDetQTDEABL.AsFloat;
    CdsDet.Next;
  end;
  Result := fTotAbl;
end;

procedure TfrmCadContratoLojaMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  sbNomeLoja.Enabled := False;
end;

procedure TfrmCadContratoLojaMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
     tbsAluguel.Enabled  := True;
     tbsDatas.Enabled    := True;
     pnlSituacao.Enabled := True;
     DBmemObservacao.ReadOnly := False;
  end else begin
     tbsAluguel.Enabled  := False;
     tbsDatas.Enabled    := False;
     pnlSituacao.Enabled := False;
     DBmemObservacao.ReadOnly := True;
  end;
end;

procedure TfrmCadContratoLojaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;


function TfrmCadContratoLojaMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if edNumContrato.Text = '' then
        raise EValidacao.CreateVal('Informe o Número do Contrato', edNumContrato);

     if edNomContrato.Text = '' then
        raise EValidacao.CreateVal('Informe a Descrição do Contrato', edNomContrato);

     if molImovel1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um Imóvel', molImovel1.btnBuscaImovel);

     if cmdtIni.Text = '' then
        raise EValidacao.CreateVal('Informe a Data de Início do Contrato', cmdtIni);

     // SE O TÉRMINO FOR DETERMINADO A DATA TÉRMINO SERA OBRIGATÓRIA
     if (not dbcbIndeterminado.Checked) and (cmdtFim.Text = '') then
        raise EValidacao.CreateVal('Informe a Data de Término do Contrato', cmdtFim);
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

function TfrmCadContratoLojaMT.VerificaPreenchimentoEvento: Boolean;
begin
  Result := False;
  try
    if (dbedtDataEvento.Text = '') then
      raise EValidacao.CreateVal('|Informe a data do evento.', dbedtDataEvento);

    if length(trim(DBedtCabEvento.Text)) = 0 then
      raise EValidacao.CreateVal('Informe o cabeçalho do evento.', dbedtCabEvento);
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

procedure TfrmCadContratoLojaMT.dbcbIndeterminadoClick(Sender: TObject);
begin
  inherited;
  if cds.State in [dsInsert,dsEdit] then begin
    if dbcbIndeterminado.Checked then begin
      CdsDATTERMINO.Clear;
      cmdtFim.Enabled := False;
      // Reativa o Contrato
      if CdsFLGSTATUS.AsString = 'E' then begin
        if MsgDlg('Este contrato está encerrado. Reativa o Contrato?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
          CdsFLGSTATUS.AsString := 'V';
          lblVigencia.Caption   := 'Vigente';
          // Exclui Evento
          CtrlEventoImovel.ExcluiEvento(-1,-1,-1,CdsIDCONTRATO.AsInteger,-1,'EC');
        end;
      end;
    end else begin
      cmdtFim.Enabled := True;
    end;
  end;
end;


procedure TfrmCadContratoLojaMT.DBgrdEventoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  cdsEventos.IndexFieldNames := AFieldName;
end;

procedure TfrmCadContratoLojaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     SelecionaMestreDetalhe( CdsIDCONTRATO.AsInteger );
end;


procedure TfrmCadContratoLojaMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // No tab de eventos, habilita o Descrição do evento que está fora do grid padrão
  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    if cdsEventos.State in dsEditModes then
         gbEvento.Enabled := True
    else gbEvento.Enabled := False;
  end;
end;

procedure TfrmCadContratoLojaMT.sbtnAltDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    if (not CdsEventosFLGTIPOEVENTO.IsNull) and (CdsEventosFLGTIPOEVENTO.AsString <> 'US')  then begin
      MsgDlg('Eventos de sistema não podem ser editados', 'Aviso', mtWarning, [mbOk], 0);
      sbtnAltDet.Down := False;
    end else begin
      inherited;
    end;
  end else begin
    inherited;
  end;
end;

procedure TfrmCadContratoLojaMT.sbtnExcluiDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    if (not CdsEventosFLGTIPOEVENTO.IsNull) and (CdsEventosFLGTIPOEVENTO.AsString <> 'US') then begin
      MsgDlg('Eventos de sistema não podem ser excluídos', 'Aviso', mtWarning, [mbOk], 0);
      sbtnAltDet.Down := False;
    end else begin
      inherited;
    end;
  end else begin
    inherited;
  end;
end;

end.
