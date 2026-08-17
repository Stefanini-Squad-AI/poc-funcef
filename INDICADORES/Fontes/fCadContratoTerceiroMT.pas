{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     CADASTRO DE CONTRATO DE NEGÓCIOS TERCEIRIZADOS  ( MT )

     Módulo          :  Indicadores
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  09/06/2003
     Data de Término :  09/06/2003

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27596
Responsável : Daniel Simões
Data        : 14/03/2008
Descrição   : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadContratoTerceiroMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TREdit,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, DBCtrls, DBTables, Provider, wwriched,
  Wwdbspin, wwdblook, mImovel, mLoja, uCtrlContratoLoja, uCMTypes,
  uCtrlSitContImob, uCtrlEventoImovel, uCtrlOutroDado, mProponente,
  Wwdbgrd2;


type
  TfrmCadContratoTerceiroMT = class(TFrmCadastroMestreDetMTImob)
    Label1: TLabel;
    Label2: TLabel;
    edNumContrato: TwwDBEdit;
    edNomContrato: TwwDBEdit;
    tbsGeral: TTabSheet;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    tbsObs: TTabSheet;
    tbsEventos: TTabSheet;
    Panel1: TPanel;
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
    cdsLoja: TCMClientDataSet;
    molImovel1: TmolImovel;
    cdsLojaIDCONTRATO: TFloatField;
    cdsLojaIDLOJA: TFloatField;
    cdsLojaPISO: TStringField;
    cdsLojaNUMLOJA: TStringField;
    cdsLojaIDIMOVEL: TFloatField;
    cdsLojaQTDEABL: TFloatField;
    CdsINDICEREAJUSTE: TFloatField;
    CdsDATREAJUSTE: TDateTimeField;
    CdsDATPROXREAJUSTE: TDateTimeField;
    CdsPERREAJUSTE: TFloatField;
    CdsDESCRICAO: TMemoField;
    CdsQTDEABL: TFloatField;
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
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cmdtIni: TCMDateTimePicker;
    cmdtFim: TCMDateTimePicker;
    dbcbIndeterminado: TDBCheckBox;
    cdsComplemento: TCMClientDataSet;
    cdsComplementoODODESCRICAO: TStringField;
    cdsComplementoIDOUTRODADO: TFloatField;
    cdsOutroDado: TCMClientDataSet;
    cdsOutroDadoODODESCRICAO: TStringField;
    cdsOutroDadoODIVALOR: TStringField;
    cdsOutroDadoIDIMOVEL: TFloatField;
    cdsOutroDadoIDOUTRODADO: TFloatField;
    Label37: TLabel;
    dbcboOutroDado: TwwDBLookupCombo;
    Label38: TLabel;
    dbedtOutroDado: TDBEdit;
    CdsCODTIPIMOVEL: TStringField;
    GroupBox2: TGroupBox;
    cmdtAudit: TCMDateTimePicker;
    molProponente1: TmolProponente;
    CdsIDPRESTADOR: TFloatField;
    CdsDSC_PRESTADOR: TStringField;
    Panel4: TPanel;
    Panel10: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label10: TLabel;
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
    Panel5: TPanel;
    gbEvento: TGroupBox;
    Panel7: TPanel;
    DBmemDescricao: TwwDBRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dbcbIndeterminadoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBgrdEventoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoLoja : TCtrlContratoLoja;
    CtrlOutroDado    : TCtrlOutroDado;
    CtrlEventoImovel : TCtrlEventoImovel;
    CtrlSitContImob  : TCtrlSitContImob;

    procedure SelecionaMestreDetalhe(const iId: Integer);
    function  VerificaPreenchimento : Boolean;
    function  VerificaPreenchimentoOutroDado: Boolean;
    function  VerificaPreenchimentoEvento: Boolean;    
  public
    { Public declarations }
  end;

var
  frmCadContratoTerceiroMT: TfrmCadContratoTerceiroMT;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadContratoTerceiroMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlContratoLoja  := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlOutroDado     := TCtrlOutroDado.Create;
  CtrlEventoImovel  := TCtrlEventoImovel.Create;
  CtrlSitContImob   := TCtrlSitContImob.Create;

  CtrlContratoLoja.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);

  CtrlEventoImovel.InitializeAs(CtrlContratoLoja);
  CtrlSitContImob.InitializeAs(CtrlContratoLoja);
  CtrlOutroDado.InitializeAs(CtrlContratoLoja);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlContratoLoja.CdsContratoLoja  := Cds;
  CtrlContratoLoja.CdsContratoXLoja := CdsLoja;
  CtrlContratoLoja.CdsEventoImovel  := CdsEventos;
  CtrlOutroDado.CdsOutroDadoXImovel := CdsOutroDado;

  // Cria o Cds detalhe, para que ao exibir a tela, o grid apareça aberto.
  CdsLoja.CreateDataSet;

  // Carrega os Cds de Lookup com os valores dos devidos CtrlObjects
  cdsSitContImob.Data := CtrlSitContImob.LookupSitContImob;
  cdsComplemento.Data := CtrlOutroDado.LookupOutroDado;

  // Abre uma grid em branco com os eventos de contrato
  cdsEventos.Data   := CtrlEventoImovel.LookupEventoImovel(-1,-1,-1,-2,-1);
  cdsOutroDado.Data := CtrlOutroDado.LookupOutroDadoXImovel(-1,-2);

  // Define Defaults
  lblVigencia.Caption := '';
end;


procedure TfrmCadContratoTerceiroMT.FormDestroy(Sender: TObject);
begin
  // Elimina os Ctrls Criados
  FreeAndNil( CtrlSitContImob );
  FreeAndNil( CtrlEventoImovel );
  FreeAndNil( CtrlContratoLoja );
  FreeAndNil( CtrlOutroDado );
  inherited;
end;


procedure TfrmCadContratoTerceiroMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco
  SelecionaMestreDetalhe( -2 );
  inherited;
  // Carrega Defaults
  edNumContrato.SetFocus;
  CdsFLGINDETERMINADO.AsString := 'N';
  CdsFLGSTATUS.AsString        := 'V';
  CdsTIPOCONTRATO.AsString     := 'T';
  lblVigencia.Caption          := 'Vigente';
end;

procedure TfrmCadContratoTerceiroMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edNumContrato.SetFocus;
end;

procedure TfrmCadContratoTerceiroMT.SelecionaMestreDetalhe(const iId: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data            := CtrlContratoLoja.LookupContratoLoja( iId );
  CdsEventos.Data     := CtrlEventoImovel.LookupEventoImovel( -1,-1,-1,iId,-1);
  cdsOutroDado.Data   := CtrlOutroDado.LookupOutroDadoXImovel( CdsIDIMOVEL.AsInteger );
  cdsComplemento.Data := CtrlOutroDado.LookupOutroDado( CdsCODTIPIMOVEL.AsString );

  // Carrega os edits do frame com os valores retornados
  molImovel1.iImovel := CdsIDIMOVEL.AsInteger;
  molImovel1.sImovelExtenso  := CdsNOME_EXTENSO.AsString;
  molImovel1.edtImovel.Text  := molImovel1.sImovelExtenso;
  molProponente1.iProponente := CdsIDPRESTADOR.AsInteger;
  molProponente1.sProponente := CdsDSC_PRESTADOR.AsString;
  molProponente1.edtProponente.Text := molProponente1.sProponente;

  if CdsFLGINDETERMINADO.AsString = 'S' then
       cmdtFim.Enabled := False
  else cmdtFim.Enabled := True;

  if CdsFLGSTATUS.AsString = 'E' then
       lblVigencia.Caption := 'Encerrado'
  else lblVigencia.Caption := 'Vigente';
end;

procedure TfrmCadContratoTerceiroMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     SelecionaMestreDetalhe( StrToInt(MontaSelect.ValoresChave[0]) );
  end;
end;

procedure TfrmCadContratoTerceiroMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  if CdsFLGSTATUS.IsNull then CdsFLGSTATUS.AsString := 'V';
  CdsIDIMOVEL.AsFloat    := molImovel1.iImovel;
  CdsIDPRESTADOR.AsFloat := molProponente1.iProponente;

  Accept := CtrlContratoLoja.GravaContratoLoja;
  if Accept then Accept := CtrlOutroDado.GravaOutroDadoXImovel;
end;


procedure TfrmCadContratoTerceiroMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlContratoLoja.ExcluiContratoLoja;
  if Accept then SelecionaMestreDetalhe( -2 );
end;

procedure TfrmCadContratoTerceiroMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Retorna os valores originais antes da alteração
  SelecionaMestreDetalhe( CdsIDCONTRATO.AsInteger );
end;

procedure TfrmCadContratoTerceiroMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
     tbsGeral.Enabled         := True;
     pnlSituacao.Enabled      := True;
     DBmemObservacao.ReadOnly := False;
  end else begin
     tbsGeral.Enabled         := False;
     pnlSituacao.Enabled      := False;
     DBmemObservacao.ReadOnly := True;
  end;
end;

procedure TfrmCadContratoTerceiroMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;


function TfrmCadContratoTerceiroMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if edNumContrato.Text = '' then
        raise EValidacao.CreateVal('Informe o Número do Contrato', edNumContrato);

     if edNomContrato.Text = '' then
        raise EValidacao.CreateVal('Informe a Descrição do Contrato', edNomContrato);

     if molImovel1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um Imóvel', molImovel1.btnBuscaImovel);

     if molProponente1.iProponente <= 0 then
        raise EValidacao.CreateVal('Selecione um Prestador', molProponente1.btnBuscaProponente);

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

procedure TfrmCadContratoTerceiroMT.dbcbIndeterminadoClick(Sender: TObject);
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


procedure TfrmCadContratoTerceiroMT.DBgrdEventoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  cdsEventos.IndexFieldNames := AFieldName;
end;

procedure TfrmCadContratoTerceiroMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     SelecionaMestreDetalhe( CdsIDCONTRATO.AsInteger );
end;

procedure TfrmCadContratoTerceiroMT.molImovel1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovelClick(Sender);
  cdsComplemento.Data := CtrlOutroDado.LookupOutroDado( molImovel1.sCodTipoImo );
end;

procedure TfrmCadContratoTerceiroMT.CmeDetalheConfirma(Sender: TObject);
begin
  // Valida a guia de Complemento ( outro dado )
  if pgctrlDetalhe.ActivePageIndex = 1 then begin
    if cdsOutroDado.State in dsEditModes then begin
      if VerificaPreenchimentoOutroDado then begin
        cdsOutroDadoODODESCRICAO.AsString := dbcboOutroDado.Text;
        cdsOutroDadoIDIMOVEL.AsInteger    := molImovel1.iImovel;
        inherited;
      end;
    end else inherited;
  end;

  // Valida a guia de Eventos
  if pgctrlDetalhe.ActivePageIndex = 3 then begin
     if cdsEventos.State in dsEditModes then begin
       if VerificaPreenchimentoEvento then begin
         CdsEventosIDUSUARIO.AsInteger    := Sistema.IdUsuario;
         CdsEventosFLGTIPOEVENTO.AsString := 'US';
         inherited;
       end;
     end else inherited;
  end;

end;

function TfrmCadContratoTerceiroMT.VerificaPreenchimentoOutroDado: Boolean;
begin
  Result := False;
  try
    if (dbcboOutroDado.Text = '') then
      raise EValidacao.CreateVal('Selecione o dado complementar.', dbcboOutroDado);

    if length(trim(dbedtOutroDado.Text)) = 0 then
      raise EValidacao.CreateVal('Informe o valor do dado complementar.', dbedtOutroDado);
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


function TfrmCadContratoTerceiroMT.VerificaPreenchimentoEvento: Boolean;
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


procedure TfrmCadContratoTerceiroMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // No tab de eventos, habilita o Descrição do evento que está fora do grid padrão
  if pgctrlDetalhe.ActivePage = tbsEventos then begin
    if cdsEventos.State in dsEditModes then
         gbEvento.Enabled := True
    else gbEvento.Enabled := False;
  end;
end;


procedure TfrmCadContratoTerceiroMT.sbtnAltDetClick(Sender: TObject);
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

procedure TfrmCadContratoTerceiroMT.sbtnExcluiDetClick(Sender: TObject);
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
