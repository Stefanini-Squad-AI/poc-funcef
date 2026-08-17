unit fApuracaoMT;

// -----------------------------------------------------------------------------
//
//      APURAÇÃO DE INDICADORES  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  23/05/2002
//      Data de Término :  24/05/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, Wwdotdot, Wwdbcomb,
  DBCtrls, Mask, wwdbedit, DBTables, Provider, mImovel, mIndicador,
  mGrpApuracao, mContratoLoja, uCtrlApuracao, uCtrlContratoLoja, FCadastroMT,
  TREdit, uCMTypes, mImovelouMestre;

type
  TfrmApuracaoMT = class(TfrmCadastroMtImob)
    dbrgTipo: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dbcbMes: TwwDBComboBox;
    dbspnAno: TwwDBSpinEdit;
    Label8: TLabel;
    cmdtApura: TCMDateTimePicker;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    molIndicador1: TmolIndicador;
    molGrpApuracao1: TmolGrpApuracao;
    molGrpApuracao2: TmolGrpApuracao;
    molContratoLoja1: TmolContratoLoja;
    CdsIDAPURACAO: TFloatField;
    CdsIDGRPAPURACAO: TFloatField;
    CdsIDSUBGRPAPURACAO: TFloatField;
    CdsIDCONTRATO: TFloatField;
    CdsIDINDICADOR: TFloatField;
    CdsIDIMOVEL: TFloatField;
    CdsMESCOMPETENCIA: TFloatField;
    CdsANOCOMPETENCIA: TFloatField;
    CdsDATAAPURACAO: TDateTimeField;
    CdsTIPOLANCA: TStringField;
    CdsVLRAPURACAONUM: TFloatField;
    CdsVLRAPURACAOSTR: TStringField;
    CdsVLRAPURACAODAT: TDateTimeField;
    CdsDATAINCLUSAO: TDateTimeField;
    CdsTIPOINCLUSAO: TStringField;
    CdsDSC_INDICADOR: TStringField;
    CdsDSC_GRPAPURACAO: TStringField;
    CdsDSC_SUBGRPAPURACAO: TStringField;
    CdsNOME_EXTENSO: TStringField;
    CdsDSC_CONTRATO: TStringField;
    pnlStr: TPanel;
    Label1: TLabel;
    dbedtVlrStr: TwwDBEdit;
    Label2: TLabel;
    pnlNum: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dbedtVlrNum: TDBRealEdit;
    pnlData: TPanel;
    Label5: TLabel;
    Label9: TLabel;
    dbedtVlrDat: TCMDateTimePicker;
    CdsTIPODADO: TStringField;
    CdsFLGGRPAPURACAO: TStringField;
    CdsFLGSUBGRPAPURACAO: TStringField;
    CdsFLGCONTRATO: TStringField;
    CdsPERIODICIDADE: TStringField;
    dbrgTipoInclusao: TDBRadioGroup;
    CdsFLGCONCILIADO: TStringField;
    CdsIDGRPPADRAO: TFloatField;
    CdsIDSUBGRPPADRAO: TFloatField;
    CdsDSC_GRPPADRAO: TStringField;
    CdsDSC_SUBGRPPADRAO: TStringField;
    CdsOBSERVACAO: TStringField;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    molImovelouMestre1: TmolImovelouMestre;
    CdsIDIMOVELMESTRE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure molIndicador1btnBuscaIndicadorClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure molContratoLoja1btnBuscaContratoClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure cmdtApuraExit(Sender: TObject);
    procedure molGrpApuracao1btnBuscaGrpApuracaoClick(Sender: TObject);
    procedure molGrpApuracao2btnBuscaGrpApuracaoClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
  private
    { Private declarations }
    CtrlApuracao     : TCtrlApuracao;
    CtrlContratoLoja : TCtrlContratoLoja;
    procedure HabilitaTipoIndicador;
    procedure SelecionaRegistro(const iIdApuracao:Integer );
  public
    { Public declarations }
  end;

var
  frmApuracaoMT: TfrmApuracaoMT;

implementation

uses dBaseDados, uSistema, uMensErro, uModuloIndicadores, uDiasUteis,
     uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmApuracaoMT.FormCreate(Sender: TObject);
begin
  // Cria e inicializa o CtrlObject dos objetos
  CtrlApuracao     := TCtrlApuracao.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlContratoLoja := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlApuracao.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);
  CtrlContratoLoja.InitializeAs(CtrlApuracao);


  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlApuracao.CdsApuracao := Cds;

  // Ajusta os Frames e Panel de tipo de Indicador
  HabilitaTipoIndicador;
end;

procedure TfrmApuracaoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     SelecionaRegistro( StrToInt(MontaSelect.ValoresChave[0]) );
end;


procedure TfrmApuracaoMT.SelecionaRegistro(const iIdApuracao: Integer);
begin
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  Cds.Data := CtrlApuracao.SelecionaApuracao( iIdApuracao );

  // Carrega IDs e Descrições nos Frames
  // Frame Imóvel
  molImovelouMestre1.iImovel          := CdsIDIMOVEL.AsInteger;
  molImovelouMestre1.edtImovel.Text   := CdsNOME_EXTENSO.AsString;
  if CdsIDIMOVELMESTRE.IsNull then
       molImovelouMestre1.lblImovelouMestre.Caption := 'Imóvel Mestre'
  else molImovelouMestre1.lblImovelouMestre.Caption := 'Imóvel';

  // Frame Indicador
  molIndicador1.iIndicador            := CdsIDINDICADOR.AsInteger;
  molIndicador1.edtIndicador.Text     := CdsDSC_INDICADOR.AsString;

  // Frame Grupo Apuração
  if not cdsIDGRPPADRAO.IsNull then begin
    molGrpApuracao1.iGrpApuracao        := CdsIDGRPPADRAO.AsInteger; // Marcio Motta - 24/04/2003 - Pendência: 16307
    molGrpApuracao1.edtGrpApuracao.Text := CdsDSC_GRPPADRAO.AsString; // Marcio Motta - 24/04/2003 - Pendência: 16307
  end else begin
    molGrpApuracao1.iGrpApuracao        := CdsIDGRPAPURACAO.AsInteger;
    molGrpApuracao1.edtGrpApuracao.text := CdsDSC_GRPAPURACAO.AsString;
  end;

  // Frame SubGrupo Apuração
  if not cdsIDSUBGRPPADRAO.IsNull then begin
    molGrpApuracao2.iGrpApuracao        := CdsIDSUBGRPPADRAO.AsInteger; // Marcio Motta - 24/04/2003 - Pendência: 16307
    molGrpApuracao2.edtGrpApuracao.Text := CdsDSC_SUBGRPPADRAO.AsString; // Marcio Motta - 24/04/2003 - Pendência: 16307
  end else begin
    molGrpApuracao2.iGrpApuracao        := CdsIDSUBGRPAPURACAO.AsInteger;
    molGrpApuracao2.edtGrpApuracao.Text := CdsDSC_SUBGRPAPURACAO.AsString;
  end;

  // Frame Contrato
  molContratoLoja1.iContrato          := CdsIDCONTRATO.AsInteger;
  molContratoLoja1.edtContrato.Text   := CdsDSC_CONTRATO.AsString;

  if not CdsMESCOMPETENCIA.IsNull then
    dbcbMes.ItemIndex := CdsMESCOMPETENCIA.AsInteger - 1;

  // Carrega parâmetros do Indicador para variáveis do Frame
  with molIndicador1 do begin
    bContrato       := False;
    sGrpApuracao    := '';
    sSubGrpApuracao := '';
    if CdsFLGCONTRATO.AsString = 'S'   then bContrato       := True;
    if not CdsFLGGRPAPURACAO.IsNull    then sGrpApuracao    := CdsFLGGRPAPURACAO.AsString;
    if not CdsFLGSUBGRPAPURACAO.IsNull then sSubGrpApuracao := CdsFLGSUBGRPAPURACAO.AsString;
    sPeriodicidade := CdsPERIODICIDADE.AsString;
    sTipoDado      := CdsTIPODADO.AsString;
  end;

  // Ajusta os Frames e Panel para o tipo de Indicador selecionado
  HabilitaTipoIndicador;
end;


procedure TfrmApuracaoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsDATAINCLUSAO.AsDateTime := Date;
  CdsTIPOINCLUSAO.AsString   := 'M';
  CdsTIPOLANCA.AsString      := 'R';
  if dbspnAno.Text = '' then CdsANOCOMPETENCIA.AsInteger := DiasUteis.ExtraiAno(Date);
  molImovelouMestre1.btnBuscaImovel.SetFocus;
  HabilitaTipoIndicador;
end;

procedure TfrmApuracaoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.btnBuscaImovel.SetFocus;
end;

procedure TfrmApuracaoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  // Transfere IDs dos frames para o Cds
  CdsIDIMOVEL.AsFloat       := molImovelouMestre1.iImovel;
  CdsIDINDICADOR.AsFloat    := molIndicador1.iIndicador;
  CdsFLGCONCILIADO.AsString := 'N';
  if dbcbMes.ItemIndex <> -1 then
    CdsMESCOMPETENCIA.AsInteger := dbcbMes.ItemIndex + 1;

  if molGrpApuracao1.iGrpApuracao > 0 then
       CdsIDGRPAPURACAO.AsFloat := molGrpApuracao1.iGrpApuracao
  else CdsIDGRPAPURACAO.Clear;
  if molGrpApuracao2.iGrpApuracao > 0 then
       CdsIDSUBGRPAPURACAO.AsFloat := molGrpApuracao2.iGrpApuracao
  else CdsIDSUBGRPAPURACAO.Clear;
  if molContratoLoja1.iContrato > 0 then
       CdsIDCONTRATO.AsFloat := molContratoLoja1.iContrato
  else CdsIDCONTRATO.Clear;

  // Limpa os campos de valores para tipos diferentes do indicador
  if molIndicador1.sTipoDado = 'N' then begin
     CdsVLRAPURACAODAT.Clear;
     CdsVLRAPURACAOSTR.Clear;
  end;
  if molIndicador1.sTipoDado = 'C' then begin
     CdsVLRAPURACAODAT.Clear;
     CdsVLRAPURACAONUM.Clear;
  end;
  if molIndicador1.sTipoDado = 'D' then begin
     CdsVLRAPURACAOSTR.Clear;
     CdsVLRAPURACAONUM.Clear;
  end;

  Accept := CtrlApuracao.GravaApuracao;
end;

procedure TfrmApuracaoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlApuracao.GravaApuracao;
end;

procedure TfrmApuracaoMT.molIndicador1btnBuscaIndicadorClick(Sender: TObject);
begin
  inherited;
  molIndicador1.btnBuscaIndicadorClick(Sender);
  molGrpApuracao1.btnLimpaGrpApuracaoClick(Sender);
  molGrpApuracao2.btnLimpaGrpApuracaoClick(Sender);

  // Ajusta os Frames e Panel para o tipo de Indicador selecionado
  HabilitaTipoIndicador;

//---------- 24/03/2004 - Marcio Motta - Pendência: 16307 ------------------------------------------
  // Se na busca do indicador, existir Grupo Padrão cadastrado, preenche o MOL correspondente
  if molIndicador1.iIdGrpPadrao > 0 then begin
    molGrpApuracao1.iGrpApuracao        := molIndicador1.iIdGrpPadrao;
    molGrpApuracao1.sGrpApuracao        := molIndicador1.sDscGrpPadrao;
    molGrpApuracao1.edtGrpApuracao.Text := molIndicador1.sDscGrpPadrao;
  end;

  // Se na busca do indicador, existir SubGrupo Padrão cadastrado, preenche o MOL correspondente
  if molIndicador1.iIdSubGrpPadrao > 0 then begin
    molGrpApuracao2.iGrpApuracao        := molIndicador1.iIdSubGrpPadrao;
    molGrpApuracao2.sGrpApuracao        := molIndicador1.sDscSubGrpPadrao;
    molGrpApuracao2.edtGrpApuracao.Text := molIndicador1.sDscSubGrpPadrao;
  end;
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------
end;


// -----------------------------------------------------------------------------
// Procedure para Habilitar os frames e panels conforme parametros do indicador
// -----------------------------------------------------------------------------
procedure TfrmApuracaoMT.HabilitaTipoIndicador;
begin
  // Verifica o Tipo de dado para habilitar o Frame correto
  if (molIndicador1.sTipoDado = 'N') or (molIndicador1.sTipoDado = '') then begin
     pnlData.Visible := False;
     pnlData.SendToBack;
     pnlStr.Visible  := False;
     pnlStr.SendToBack;
     pnlNum.Visible  := True;
     pnlNum.BringToFront;
  end;
  if molIndicador1.sTipoDado = 'D' then begin
     pnlData.Visible := True;
     pnlData.BringToFront;
     pnlStr.Visible  := False;
     pnlStr.SendToBack;
     pnlNum.Visible  := False;
     pnlNum.SendToBack;
  end;
  if molIndicador1.sTipoDado = 'C' then begin
     pnlData.Visible := False;
     pnlData.SendToBack;
     pnlStr.Visible  := True;
     pnlStr.BringToFront;
     pnlNum.Visible  := False;
     pnlNum.SendToBack;
  end;

  // Habilita Grupo de Apuração conforme parametros do Indicador
  with molGrpApuracao1 do begin
    if molIndicador1.sGrpApuracao <> '' then begin
      btnBuscaGrpApuracao.Enabled := True;
      btnLimpaGrpApuracao.Enabled := True;
    end else begin
      btnBuscaGrpApuracao.Enabled := False;
      btnLimpaGrpApuracao.Enabled := False;
      iGrpApuracao := -1;
      edtGrpApuracao.Clear;
    end;
  end;

  // Habilita Sub Grupo de Apuração conforme parametros do Indicador
  with molGrpApuracao2 do begin
    if molIndicador1.sSubGrpApuracao <> '' then begin
      btnBuscaGrpApuracao.Enabled := True;
      btnLimpaGrpApuracao.Enabled := True;
    end else begin
      btnBuscaGrpApuracao.Enabled := False;
      btnLimpaGrpApuracao.Enabled := False;
      iGrpApuracao := -1;
      edtGrpApuracao.Clear;
    end;
  end;

  // Habilita Contrato conforme parametros do Indicador
  with molContratoLoja1 do begin
    if molIndicador1.bContrato then begin
      btnBuscaContrato.Enabled := True;
      btnLimpaContrato.Enabled := True;
    end else begin
      btnBuscaContrato.Enabled := False;
      btnLimpaContrato.Enabled := False;
      iContrato := -1;
      edtContrato.Clear;
    end;
  end;
end;


procedure TfrmApuracaoMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var iNumApura  : Integer;
    dDataApura : TDateTime;
    fVlrApura  : Extended;
begin
  inherited;
  Accept := False;
  // Se o indicador for mensal, força a busca de apuração de apenas um indicador no mes
  if (molIndicador1.sPeriodicidade = 'M') then
       dDataApura := -1
  else dDataApura := cmdtApura.Date;

  try
     if molImovelouMestre1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione um Imóvel',molImovelouMestre1.btnBuscaImovel);

     if molIndicador1.iIndicador <= 0 then
        raise EValidacao.CreateVal('Selecione um Indicador',molIndicador1.btnBuscaIndicador);

     if (molIndicador1.sGrpApuracao <> '') and (molGrpApuracao1.iGrpApuracao <= 0) then
        raise EValidacao.CreateVal('Selecione um Grupo de Apuração',molGrpApuracao1.btnBuscaGrpApuracao);

     if (molIndicador1.sSubGrpApuracao <> '') and (molGrpApuracao2.iGrpApuracao <= 0) then
        raise EValidacao.CreateVal('Selecione um Subgrupo de Apuração',molGrpApuracao2.btnBuscaGrpApuracao);

     if (molIndicador1.bContrato) and (molContratoLoja1.iContrato <= 0) then
        raise EValidacao.CreateVal('Selecione um Contrato',molContratoLoja1.btnBuscaContrato);

     if CdsDATAAPURACAO.IsNull then
        raise EValidacao.CreateVal('Informe a Data de Apuração',cmdtApura);

     if (molIndicador1.bContrato) and (not CtrlContratoLoja.ContratoAtivo(molContratoLoja1.iContrato,CdsDATAAPURACAO.AsDateTime) ) then
        raise EValidacao.CreateVal('O Contrato selecionado não está ativo na data da apuração',molContratoLoja1.btnBuscaContrato);

     if (dbcbmes.ItemIndex = -1) or (DBspnAno.Value < 1000) then
        raise EValidacao.CreateVal('Selecione uma Competência Válida',dbcbmes);

     if (molIndicador1.sTipoDado = 'N') and (CdsVLRAPURACAONUM.AsInteger = 0) then
        raise EValidacao.CreateVal('O Valor Apurado não foi informado',dbedtVlrNum);

     if (molIndicador1.sTipoDado = 'C') and (CdsVLRAPURACAOSTR.IsNull) then
        raise EValidacao.CreateVal('O Valor Apurado não foi informado',dbedtVlrStr);

     if (molIndicador1.sTipoDado = 'D') and (CdsVLRAPURACAODAT.IsNull) then
        raise EValidacao.CreateVal('O Valor Apurado não foi informado',dbedtVlrDat);

     if CtrlApuracao.IndicadorApurado(CdsIDAPURACAO.AsInteger,
                                      molImovelouMestre1.iImovel,
                                      molIndicador1.iIndicador,
                                      molGrpApuracao1.iGrpApuracao,
                                      molGrpApuracao2.iGrpApuracao,
                                      molContratoLoja1.iContrato,
                                      dbcbMes.ItemIndex + 1, DBspnAno.Value,
                                      CdsTIPOLANCA.AsString, dDataApura,
                                      iNumApura, fVlrApura,
                                      CdsTIPOINCLUSAO.AsString) then begin
        if molIndicador1.sPeriodicidade = 'M' then
             raise EValidacao.CreateVal('O indicador é Mensal, e já foi apurado nas condições especificadas nesta forma de inclusão.',molImovelouMestre1.btnBuscaImovel)
        else if molIndicador1.sPeriodicidade = 'D' then
                  raise EValidacao.CreateVal('O indicador é Diário, e já foi apurado nas condições especificadas nesta forma de inclusão.',molImovelouMestre1.btnBuscaImovel)
             else raise EValidacao.CreateVal('O indicador é Livre, e já foi apurado nas condições especificadas nesta forma de inclusão.',molImovelouMestre1.btnBuscaImovel);
     end;
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Accept := True;
end;

procedure TfrmApuracaoMT.molContratoLoja1btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoLoja1.iImovelFiltro := molImovelouMestre1.iImovel;
  molContratoLoja1.btnBuscaContratoClick(Sender);
end;

procedure TfrmApuracaoMT.molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.btnBuscaImovelClick(Sender);
  molContratoLoja1.btnLimpaContratoClick(Sender);
end;


procedure TfrmApuracaoMT.CmeCadastroCancel(Sender: TObject);
begin
  if cmeCadastro.Operacao = opAlterar then begin
    inherited;
    CmeCadastroFind(Self);
  end else begin
    inherited;
  end;
end;

procedure TfrmApuracaoMT.cmdtApuraExit(Sender: TObject);
begin
  inherited;
  if (molIndicador1.sTipoDado = 'N') or (molIndicador1.sTipoDado = '') then dbedtVlrNum.SetFocus;
  if molIndicador1.sTipoDado = 'D' then dbedtVlrDat.SetFocus;
  if molIndicador1.sTipoDado = 'C' then dbedtVlrStr.SetFocus;
end;

procedure TfrmApuracaoMT.molGrpApuracao1btnBuscaGrpApuracaoClick(
  Sender: TObject);
begin
  inherited;
  molGrpApuracao1.sGrpFiltro := molIndicador1.sGrpApuracao;
  molGrpApuracao1.btnBuscaGrpApuracaoClick(Sender);
end;

procedure TfrmApuracaoMT.molGrpApuracao2btnBuscaGrpApuracaoClick(
  Sender: TObject);
begin
  inherited;
  molGrpApuracao2.sGrpFiltro := molIndicador1.sSubGrpApuracao;
  molGrpApuracao2.btnBuscaGrpApuracaoClick(Sender);
end;

procedure TfrmApuracaoMT.sbtnAlterarClick(Sender: TObject);
begin
  if CdsTIPOINCLUSAO.AsString[1] in ['M','I'] then begin
    inherited;
  end else begin
    MsgDlg('Somente as apurações manuais e importadas podem ser alteradas.', 'Aviso', mtWarning, [mbOk], 0);
    sbtnAlterar.Down := False;
  end;
end;

procedure TfrmApuracaoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro quando for edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then SelecionaRegistro( CdsIDAPURACAO.AsInteger );
end;


end.
