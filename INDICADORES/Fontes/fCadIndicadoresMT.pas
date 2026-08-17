unit fCadIndicadoresMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE INDICADORES  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  17/05/2002
//      Data de Término :  17/05/2002
//
// -----------------------------------------------------------------------------
//  ALTERAÇÕES:
//
//  1) Pendência 16307 - Marcio Motta - Início: 19/03/2004
//     Inclusão dos campos IDGRPPADRAO e IDSUBGRPPADRAO
//
// -----------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTImob, StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbedit, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  Wwdotdot, Wwdbcomb, FCadastroMT, wwdblook, uCMTypes, uCtrlIndicador, uCtrlCadRegra,
  uCmSqlParams, uCtrlGrpApuracao;


type
  TfrmCadIndicadoresMT = class(TfrmCadastroMtImob)
    dbedtDescricao: TwwDBEdit;
    Label1: TLabel;
    dbrgTipoValor: TDBRadioGroup;
    dbrgTipoDado: TDBRadioGroup;
    Label2: TLabel;
    gbObriga: TGroupBox;
    dbcbContrato: TDBCheckBox;
    dbcbUnidade: TwwDBComboBox;
    CdsIDINDICADOR: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsTIPODADO: TStringField;
    CdsTIPOVALOR: TStringField;
    CdsUNIDADE: TStringField;
    CdsFLGGRPAPURACAO: TStringField;
    CdsFLGSUBGRPAPURACAO: TStringField;
    CdsFLGCONTRATO: TStringField;
    Label3: TLabel;
    cboOrigemLanc: TwwDBComboBox;
    CdsTIPOINDICADOR: TFloatField;
    CdsPERIODICIDADE: TStringField;
    dbrgPeriodicidade: TDBRadioGroup;
    Label4: TLabel;
    cboGrpApuracao: TwwDBComboBox;
    Label5: TLabel;
    cboSubGrpApuracao: TwwDBComboBox;
    dbrgVerifica: TDBRadioGroup;
    CdsNIVELVERIFICA: TFloatField;
    Label6: TLabel;
    CdsIDREGRA: TFloatField;
    cdsRegra: TCMClientDataSet;
    cdsRegraIDREGRA: TFloatField;
    cdsRegraNOMEREGRA: TStringField;
    dblcRegra: TwwDBLookupCombo;
    Label7: TLabel;
    cboQryRegra: TwwDBComboBox;
    CdsQRYREGRA: TFloatField;
    dblcGrpPadrao: TwwDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    dblcSubGrpPadrao: TwwDBLookupCombo;
    cdsGrpPadrao: TCMClientDataSet;
    cdsSubGrpPadrao: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsGrpPadraoIDGRPAPURACAO: TFloatField;
    cdsGrpPadraoDESCRICAO: TStringField;
    cdsGrpPadraoTIPOGRUPO: TStringField;
    cdsSubGrpPadraoIDGRPAPURACAO: TFloatField;
    cdsSubGrpPadraoDESCRICAO: TStringField;
    cdsSubGrpPadraoTIPOGRUPO: TStringField;
    CdsIDGRPPADRAO: TFloatField;
    CdsIDSUBGRPPADRAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure cboGrpApuracaoChange(Sender: TObject);
    procedure cboSubGrpApuracaoChange(Sender: TObject);

  private
    { Private declarations }
    bCarregaParam   : Boolean;
    CtrlIndicador   : TCtrlIndicador;
    CtrlCadRegra    : TCtrlCadRegra;
    CtrlGrpApuracao : TCtrlGrpApuracao;

    function VerificaPreenchimento : Boolean;

  public
    { Public declarations }
  end;

var
  frmCadIndicadoresMT: TfrmCadIndicadoresMT;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TfrmCadIndicadoresMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Indicadores
  CtrlIndicador := TCtrlIndicador.Create;
  CtrlIndicador.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlIndicador.CdsIndicador := Cds;

  // Inicializa Lookup de Regras
  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs( CtrlIndicador );
  cdsRegra.Data := CtrlCadRegra.ListaRegra(ModuloIndicadores.iIdGrpRegra);

//---------- 19/03/2004 - Marcio Motta - Pendência: 16307 ------------------------------------------
  // Carrega os LookUps Grupo/SubGrupo Padrão
  CtrlGrpApuracao := TCtrlGrpApuracao.Create;
  CtrlGrpApuracao.InitializeAs( CtrlIndicador );
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

  bCarregaParam := False;
end;

procedure TfrmCadIndicadoresMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then begin
     Cds.Data := CtrlIndicador.LookupIndicador( StrToInt(MontaSelect.ValoresChave[0]) );
  end;
end;

procedure TfrmCadIndicadoresMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbrgTipoDado.ItemIndex      := 0;
  dbrgTipoValor.ItemIndex     := 0;
  dbrgVerifica.ItemIndex      := 0;
  dbrgPeriodicidade.ItemIndex := 1;
  CdsFLGCONTRATO.AsString     := 'N';
  dbedtDescricao.SetFocus;
end;

procedure TfrmCadIndicadoresMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedtDescricao.SetFocus;
end;

procedure TfrmCadIndicadoresMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlIndicador.GravaIndicador;
  bCarregaParam := True;
end;

procedure TfrmCadIndicadoresMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadIndicadoresMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if dbedtDescricao.Text = '' then
        raise EValidacao.CreateVal('Informe a Descrição do Indicador', dbedtDescricao);
     if (dblcRegra.Text <> '') and (cboQryRegra.Text = '') then
        raise EValidacao.CreateVal('Informe qual o dado de entrada para a Regra', cboQryRegra);
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

procedure TfrmCadIndicadoresMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlIndicador );
  FreeAndNil( CtrlCadRegra );
  if bCarregaParam then ModuloIndicadores.GetParam(Sistema.IdEmpresa);
end;

procedure TfrmCadIndicadoresMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     Cds.Data := CtrlIndicador.LookupIndicador( CdsIDINDICADOR.AsInteger );
end;

procedure TfrmCadIndicadoresMT.cboGrpApuracaoChange(Sender: TObject);
begin
  inherited;
  cdsGrpPadrao.Data := CtrlGrpApuracao.LookupGrpApuracao(-1,cboGrpApuracao.Value);
end;

procedure TfrmCadIndicadoresMT.cboSubGrpApuracaoChange(Sender: TObject);
begin
  inherited;
  cdsSubGrpPadrao.Data := CtrlGrpApuracao.LookupGrpApuracao(-1,cboSubGrpApuracao.Value);
end;

end.
