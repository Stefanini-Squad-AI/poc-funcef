{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 26461
Responsável : Daniel Simões
Data        : 22/11/2007
Descrição   : Passa a calcular os valores de Juros, Multa e Correção pela
             'CtrlParamMulta' iserida no Cadastro de Contratos de Locação...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecRescisaoContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  mContrato, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet,
  uCtrlLancamentosImovel, uCtrlContratoImovel, uCtrlRegra, uCtrlCadRegra,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, TREdit, DBTables,
  uCtrlConcilia;

type
  TfrmExecRescisaoContratoMT = class(TfrmWizardMT)
    molContrato1: TmolContrato;
    DBgrdConcilia: TwwDBGrid;
    Panel3: TPanel;
    cdsConcilia: TCMClientDataSet;
    dsConcilia: TDataSource;
    chkExcluiLanc: TCheckBox;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    memObs: TMemo;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBedtDataIni: TCMDateTimePicker;
    Label6: TLabel;
    DBedtDataFim: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDataSolicitacao: TCMDateTimePicker;
    edtDataRescisao: TCMDateTimePicker;
    cdsContrato: TCMClientDataSet;
    dsContrato: TDataSource;
    cdsContratoCONDATAINICIO: TDateTimeField;
    cdsContratoCONDATAFIM: TDateTimeField;
    cdsContratoCONDATASOLRESC: TDateTimeField;
    tbMulta: TTabSheet;
    fcLabel2: TfcLabel;
    cdsContratoCODESTADO: TStringField;
    cdsContratoCODPORTFORMA: TFloatField;
    cdsContratoCONBANCOFIANCA: TFloatField;
    cdsContratoCONDATAASSINATURA: TDateTimeField;
    cdsContratoCONDATAAVDENUNCIA: TDateTimeField;
    cdsContratoCONDATAAVRENEGOC: TDateTimeField;
    cdsContratoCONDATACARENCIA: TDateTimeField;
    cdsContratoCONDATADENUNCIA: TDateTimeField;
    cdsContratoCONDATAFIANCAAV: TDateTimeField;
    cdsContratoCONDATAFIANCAFIM: TDateTimeField;
    cdsContratoCONDATAFIANCAINI: TDateTimeField;
    cdsContratoCONDATAINICAREN: TDateTimeField;
    cdsContratoCONDATAREAJUSTE: TDateTimeField;
    cdsContratoCONDATARENEGOC: TDateTimeField;
    cdsContratoCONDESCRICAO: TMemoField;
    cdsContratoCONDIASREPASSE: TFloatField;
    cdsContratoCONDIASTOLERANCIA: TFloatField;
    cdsContratoCONDIAVENCIMENTO: TFloatField;
    cdsContratoCONINDICEREAJUSTE: TFloatField;
    cdsContratoCONMESREFREAJUSTE: TStringField;
    cdsContratoCONMOEDAMORA: TFloatField;
    cdsContratoCONMOEDAMULTA: TFloatField;
    cdsContratoCONNOME: TStringField;
    cdsContratoCONNUMERO: TStringField;
    cdsContratoCONOBSFIANCA: TMemoField;
    cdsContratoCONPERALUGUEL: TFloatField;
    cdsContratoCONPERCENTMORA: TFloatField;
    cdsContratoCONPERCENTMULTA: TFloatField;
    cdsContratoCONPERMORA: TStringField;
    cdsContratoCONPERREAJUSTE: TFloatField;
    cdsContratoCONPROXREAJUSTE: TDateTimeField;
    cdsContratoCONQUANTVAGAS: TFloatField;
    cdsContratoCONTAXAADMIN: TFloatField;
    cdsContratoCONVLRAJUSTADO: TFloatField;
    cdsContratoCONVLRFIANCA: TFloatField;
    cdsContratoCONVLRMORA: TFloatField;
    cdsContratoCONVLRMULTA: TFloatField;
    cdsContratoCONVLRTOTAL: TFloatField;
    cdsContratoFLGCOBRANCAAUTO: TFloatField;
    cdsContratoFLGCOMPETALUGUEL: TStringField;
    cdsContratoFLGFIANCA: TStringField;
    cdsContratoFLGINDETERMINADO: TStringField;
    cdsContratoFLGMORAPROPORC: TFloatField;
    cdsContratoFLGSTATUS: TStringField;
    cdsContratoFLGTIPOCONTRATO: TStringField;
    cdsContratoFLGTIPODIATOLERA: TStringField;
    cdsContratoFLGTIPODIAVENC: TStringField;
    cdsContratoIDADMINIMOVEL: TFloatField;
    cdsContratoIDATIVIDADE: TFloatField;
    cdsContratoIDCIDADES: TFloatField;
    cdsContratoIDCONTRATOIMOVEL: TFloatField;
    cdsContratoIDINDCORRECAO: TFloatField;
    cdsContratoIDLOCATARIO: TFloatField;
    cdsContratoIDMARCA: TFloatField;
    cdsContratoIDMSGBOLETO: TFloatField;
    cdsContratoIDPAIS: TFloatField;
    cdsContratoIDPESSOA: TFloatField;
    cdsContratoIDRESPONSAVEL: TFloatField;
    cdsContratoIDSITCONTIMOB: TFloatField;
    cdsContratoIDTIPOCUSTORECIMO: TFloatField;
    cdsContratoMOECODIGO: TFloatField;
    cdsContratoPERALUGUELIDEAL: TFloatField;
    cdsContratoPERCTXJURMERC: TFloatField;
    cdsContratoPERITXJURMERC: TStringField;
    cdsContratoVLRCONTABIL: TFloatField;
    cdsContratoVLRPRESENTE: TFloatField;
    cdsContratoVLRPROPOSTA: TFloatField;
    cdsContratoFLGTIPOALUGUEL: TStringField;
    cdsContratoIDREGRARES: TFloatField;
    cdsContratoDSC_ADMINISTRADORA: TStringField;
    cdsContratoDSC_LOCATARIO: TStringField;
    cdsContratoDSC_RESPONSAVEL: TStringField;
    GroupBox9: TGroupBox;
    edtMultaRes: TDBRealEdit;
    GroupBox4: TGroupBox;
    edtNomeRegra: TEdit;
    btnCobraMulta: TBitBtn;
    Query1: TQuery;
    DBgrdConciliaIButton: TwwIButton;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure DBgrdConciliaTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure DBgrdConciliaUpdateFooter(Sender: TObject);
    procedure btnCobraMultaClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoImovel : TCtrlContratoImovel;
    CtrlRegra          : TCtrlRegra;
    CtrlCadRegra       : TCtrlCadRegra;

    CtrlConcilia       : TCtrlConcilia;

    iDocMulta          : Integer;

    function VerificaPreenchimentoSelecao : Boolean;
    function ContinuaSelecao( var bContinua:Boolean ) : Boolean;
    function CalculaMulta: Boolean;
  public
    { Public declarations }
  end;

var
  frmExecRescisaoContratoMT: TfrmExecRescisaoContratoMT;

implementation

uses dBaseDados, uMensErro, uSistema, UComunsImobiliario, uVerificaPreenchimento, uModuloImobiliario,
     fAguarde, dMS, FExecLancMultRec, uMolduras;

{$R *.DFM}

procedure TfrmExecRescisaoContratoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria os CtrlObjects dos objetos a serem utilizados
  CtrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );
  CtrlRegra    := TCtrlRegra.Create;
  CtrlCadRegra := TCtrlCadRegra.Create;

  CtrlConcilia := TCtrlConcilia.Create(Sistema.IdEmpresa,
                                       Sistema.IdModulo,
                                       Sistema.IdUsuario,
                                       Sistema.IdEspAcesso,
                                       Sistema.UsaPlanoPatro);

  CtrlConcilia.Initialize(DtmBaseDados.DbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          True,
                          ComunsImobiliario.MensErroMT);

  CtrlContratoImovel.InitializeAs( CtrlConcilia );
  CtrlRegra.InitializeAs( CtrlConcilia );
  CtrlCadRegra.InitializeAs( CtrlConcilia );

  // Inicializa o Nr. do documento para cobrança da multa rescisória
  iDocMulta := -1;
end;



procedure TfrmExecRescisaoContratoMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlContratoImovel );
  FreeAndNil( CtrlRegra );
  FreeAndNil( CtrlCadRegra );

  FreeAndNil( CtrlConcilia );
  inherited;
end;

procedure TfrmExecRescisaoContratoMT.molContrato1btnBuscaContratoClick(Sender: TObject);
var sFiltro : String;
begin
  inherited;
  // adiciona o filtro por Contratos Vigentes
  sFiltro := dtmMS.MS_Contrato.Filtro.Text; 
  dtmMS.MS_Contrato.Filtro.Add('C.FLGSTATUS = ''V'' ');     // Vigente
  molContrato1.btnBuscaContratoClick(Sender);

  // Retorna o Filtro anterior
  dtmMS.MS_Contrato.Filtro.Clear;
  dtmMS.MS_Contrato.Filtro.Text := sFiltro;

  cdsContrato.Data := CtrlContratoImovel.LookupContratoImovel( molContrato1.iContrato );
end;

procedure TfrmExecRescisaoContratoMT.btnContinuarClick(Sender: TObject);
var bContinua : Boolean;
begin
  if PagControle.ActivePage = tabSelecao then begin
    if ContinuaSelecao( bContinua ) then begin
      inherited;
      if not bContinua then btnContinuar.Enabled := False;
    end;
  end else if PagControle.ActivePage = TabSheet1 then begin
    if CalculaMulta then inherited;
  end;
end;


function TfrmExecRescisaoContratoMT.ContinuaSelecao(var bContinua:Boolean): Boolean;
var dDtRescisao     : TDateTime;
    oResultConcilia : OLEVariant; // Daniel - 26461
begin
  Result      := False;
  bContinua   := True;
  dDtRescisao := edtDataRescisao.Date;

  if VerificaPreenchimentoSelecao then begin
    try
      frmAguarde.Mostra('Conciliando os Recebimentos... ');
      Result := CtrlConcilia.Concilia( oResultConcilia, // Daniel - 26461
                                       edtDataRescisao.Date,
                                       molContrato1.iContrato );

// Daniel - 26461 - Início -----------------------------------------------------
     if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
        (ModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
        (ModuloImobiliario.AdminImob.iTipoOperAtualCM <= 0) then
     begin
        if Result then cdsConcilia.Data := oResultConcilia;
     end else begin
// Daniel - 26461 - Fim --------------------------------------------------------
        frmAguarde.Mostra('Verificando Recebimentos em Aberto... ');
        if Result then cdsConcilia.Data := CtrlConcilia.LookupConciliacao(molContrato1.iContrato,
                                                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
                                                                          dDtRescisao,
                                                                          '',
                                                                          False);
     end; // Fim - 26461

// Daniel - Início -------------------------------------------------------------
      TFloatField(cdsConcilia.FieldByName('TOT_RECEBER')).DisplayFormat  := ',0.00';
      TFloatField(cdsConcilia.FieldByName('TOT_RECEBER')).EditFormat     := ',0.00';
      TFloatField(cdsConcilia.FieldByName('TOT_RECEBIDO')).DisplayFormat := ',0.00';
      TFloatField(cdsConcilia.FieldByName('TOT_RECEBIDO')).EditFormat    := ',0.00';
      TFloatField(cdsConcilia.FieldByName('JUROS')).DisplayFormat        := ',0.00';
      TFloatField(cdsConcilia.FieldByName('JUROS')).EditFormat           := ',0.00';
      TFloatField(cdsConcilia.FieldByName('MULTA')).DisplayFormat        := ',0.00';
      TFloatField(cdsConcilia.FieldByName('MULTA')).EditFormat           := ',0.00';
      TFloatField(cdsConcilia.FieldByName('CORRECAO')).DisplayFormat     := ',0.00';
      TFloatField(cdsConcilia.FieldByName('CORRECAO')).EditFormat        := ',0.00';
      TFloatField(cdsConcilia.FieldByName('PROPORCAO')).DisplayFormat    := ',00.0%';
      TFloatField(cdsConcilia.FieldByName('PROPORCAO')).EditFormat       := ',00.0%';
      TFloatField(cdsConcilia.FieldByName('JUROSDIF')).DisplayFormat     := ',0.00';
      TFloatField(cdsConcilia.FieldByName('JUROSDIF')).EditFormat        := ',0.00';
      TFloatField(cdsConcilia.FieldByName('MULTADIF')).DisplayFormat     := ',0.00';
      TFloatField(cdsConcilia.FieldByName('MULTADIF')).EditFormat        := ',0.00';
      TFloatField(cdsConcilia.FieldByName('CORRECAODIF')).DisplayFormat  := ',0.00';
      TFloatField(cdsConcilia.FieldByName('CORRECAODIF')).EditFormat     := ',0.00';
      TFloatField(cdsConcilia.FieldByName('DIFERENCA')).DisplayFormat    := ',0.00';
      TFloatField(cdsConcilia.FieldByName('DIFERENCA')).EditFormat       := ',0.00';
// Daniel - Fim ----------------------------------------------------------------

    finally
      frmAguarde.Apaga;
      if (Result) and (not cdsConcilia.IsEmpty) then begin
        bContinua := False;
        MsgDlg('Existem débitos para o contrato. Efetue a Conciliação !', 'Aviso', mtWarning, [mbOk],0);
        frmAguarde.Apaga;
      end;
    end;
  end;
end;

function TfrmExecRescisaoContratoMT.VerificaPreenchimentoSelecao: Boolean;
begin
  Result := True;
  try
    if molContrato1.iContrato <= 0 then
       raise EValidacao.CreateVal('Selecione o Contrato', molContrato1.btnBuscaContrato);

    if edtDataRescisao.Text = '' then
       raise EValidacao.CreateVal('Informe a Data da Rescisão', edtDataRescisao);

    if edtDataRescisao.Date <= DBedtDataIni.Date then
       raise EValidacao.CreateVal('Data da Rescisão deve ser superior a data de início do contrato', edtDataRescisao);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Result := False;
    end;
  end;
end;


function TfrmExecRescisaoContratoMT.CalculaMulta: Boolean;
var cdsTemp : TCMClientDataSet;
begin
  Result := True;
  edtMultaRes.Value := 0;
  if cdsContratoIDREGRARES.IsNull then begin
    MsgDlg('Não existe regra de calculo de Multa associada ao contrato', 'Aviso', mtWarning, [mbOk], 0);
    btnCobraMulta.Enabled := False;
    Exit;
  end;

  // Carrega dados e parametros para o ctrlRegra
  CtrlRegra.CopiaData( cdsContrato.Data );
  CtrlRegra.GravaCalculo := False;
  CtrlRegra.ReloadRule   := False;
  CtrlRegra.RuleNumber   := cdsContratoIDREGRARES.AsString;

  // Executa a Regra e busca o resultado
  CtrlRegra.Execute;
  if not CtrlRegra.Error then
       edtMultaRes.Value := StrToFloat( ComunsImobiliario.StrTran(CtrlRegra.Result,'.',',') )
  else Result := False;

  // Carrega o nome da regra
  try
     cdsTemp := TCMClientDataSet.Create( nil );
     cdsTemp.Data := CtrlCadRegra.ListaRegra(-1, cdsContratoIDREGRARES.AsInteger );
     edtNomeRegra.Text := cdsTemp.FieldByName('NOMEREGRA').AsString;
  finally
     FreeAndNil( cdsTemp );
  end;

  btnCobraMulta.Enabled := ( edtMultaRes.Value > 0 );
end;


procedure TfrmExecRescisaoContratoMT.btnCobraMultaClick(Sender: TObject);
begin
  inherited;
  // Executa a tela de Lançamento Múltiplo de Receita
  Application.CreateForm(TfrmExecLancMultRec, frmExecLancMultRec);

  // Carrega os valores já definidos
  frmExecLancMultRec.edtVlrTotal.Value              := edtMultaRes.Value;
  frmExecLancMultRec.molContrato1.iContrato         := molContrato1.iContrato;
  frmExecLancMultRec.molContrato1.edtContrato.Text  := molContrato1.edtContrato.Text;
  frmExecLancMultRec.molCliente1.iCliente           := molContrato1.iLocatario;
  frmExecLancMultRec.DBcboPortadorForma.LookupValue := IntToStr(molContrato1.iCodportForma);

  AtribuiMolCliente(molContrato1.iLocatario, frmExecLancMultRec.molCliente1.edtNomeFantasia,
                                             frmExecLancMultRec.molCliente1.edtRazaoSocial);

  // Desabilita o acesso ao Nr. do Documento, pois o mesmo não poderá ser excluído
  // no processo de rescisão.
  iDocMulta := StrToInt(frmExecLancMultRec.edtNumDocumento.Text);
  frmExecLancMultRec.edtNumDocumento.Enabled := False;

  // Fechar o formulário ao terminar o lançamento
  frmExecLancMultRec.bFechaForm := True;

  frmExecLancMultRec.Show;
end;


procedure TfrmExecRescisaoContratoMT.DBgrdConciliaTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  cdsConcilia.IndexFieldNames := AFieldName;
end;


procedure TfrmExecRescisaoContratoMT.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if CtrlContratoImovel.Rescisao(molContrato1.iContrato,
                                 edtDataRescisao.Date, edtDataSolicitacao.Date,
                                 memObs.Text, chkExcluiLanc.Checked, iDocMulta, True) then begin
     IrParaPagina(0,'Rescisão efetuada com Sucesso!');
  end;
end;

procedure TfrmExecRescisaoContratoMT.DBgrdConciliaUpdateFooter(Sender: TObject);
var fTotal : Extended;
    cdsTemp : TCMClientDataSet;
begin
  inherited;
  fTotal := 0;
  try
    try
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := cdsConcilia.Data;
      cdsTemp.First;
      while not cdsTemp.Eof do begin
        fTotal := fTotal + cdsTemp.FieldByName('DIFERENCA').AsFloat;
        cdsTemp.Next
      end;
      DBgrdConcilia.ColumnByName('DIFERENCA').FooterValue := FormatFloat('###,###0.00', fTotal);
    except

    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;


end.
