{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        GERAÇÃO DE RECEITAS EM LOTE ( MT )

        Módulo          : Administração Imobiliária
        Desenvolvedor   : Daniel Simões Braga
        Data de Término : 27/08/2007

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecGeraRecLoteMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  mImovelouMestre, mResponsavel, mContrato, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, Wwdbspin, Grids, Wwdbigrd, Wwdbgrid, Db,
  uCmSqlParams, Wwdatsrc, DBClient, uCMClientDataSet, uSistema, uDiasUteis,
  uCtrlPadroes, uCtrlGeraRecLote, uDiasInUteis, uCtrlLancamentosImovel,
  uCtrlMensagemBoleto, uCtrlContratoImovel, uModuloImobiliario, {uCtrlDocumento} uCtrlImobDocumento,
  uCtrlIndicadorImovel, uFuncoesImob, TREdit,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  TfrmExecGeraRecLoteMT = class(TfrmWizardMT)
    GroupBox1: TGroupBox;
    molImovelouMestre1: TmolImovelouMestre;
    molContrato1: TmolContrato;
    molResponsavel1: TmolResponsavel;
    Label1: TLabel;
    dbcboTipoRecCobranca: TwwDBLookupCombo;
    Label2: TLabel;
    dbcboFormaCobranca: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    Label3: TLabel;
    edtDataLancamento: TCMDateTimePicker;
    edtDataEmissao: TCMDateTimePicker;
    Label6: TLabel;
    Label4: TLabel;
    edtDataVencimento: TCMDateTimePicker;
    DBgrdLancGerar: TwwDBGrid;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    dbcboIndicadores: TwwDBLookupCombo;
    Label7: TLabel;
    cboMesI: TComboBox;
    DBspnAnoI: TwwDBSpinEdit;
    Panel9: TPanel;
    cdsIndicadores: TCMClientDataSet;
    dsIndicadores: TwwDataSource;
    sqlIndicadores: TCMSqlParams;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    sql: TCMSqlParams;
    cdsCONNUMERO: TStringField;
    cdsCONNOME: TStringField;
    cdsIMOVEL: TStringField;
    cdsVLR_INDICADOR: TFloatField;
    cdsPERC_RATEIO: TFloatField;
    cdsVLR_LANC: TFloatField;
    cdsCIMDTINI: TDateTimeField;
    cdsCIMDTFIM: TDateTimeField;
    cdsIDIMOVEL: TFloatField;
    cdsIDLOCATARIO: TFloatField;
    cdsIndicadoresIDINDICADORIMOVEL: TFloatField;
    cdsIndicadoresINMDESCRICAO: TStringField;
    cdsTipoRec: TCMClientDataSet;
    dsTipoRec: TwwDataSource;
    sqlTipoRec: TCMSqlParams;
    cdsForma: TCMClientDataSet;
    dsForma: TwwDataSource;
    sqlForma: TCMSqlParams;
    cdsFormaCODPORTFORMA: TFloatField;
    cdsFormaDESCRICAO: TStringField;
    cdsTipoRecIDTIPOCUSTORECIMO: TFloatField;
    cdsTipoRecDESCCUSTORECIMO: TStringField;
    cdsTipoRecRECCUSTO: TStringField;
    cdsTipoRecCODTIPDOC: TFloatField;
    cdsTipoRecFLGOBRIGAORC: TFloatField;
    cdsTipoRecIDTIPODESPESA: TFloatField;
    cdsTipoRecFLGDIARIO: TStringField;
    cdsFormaIDPESSOA: TFloatField;
    tabMensagem: TTabSheet;
    fcLabel2: TfcLabel;
    tabGerados: TTabSheet;
    fcLabel3: TfcLabel;
    chkBoleto: TCheckBox;
    cdsFormaIDCONFIGBARRAS: TFloatField;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label8: TLabel;
    Label26: TLabel;
    edtln1: TEdit;
    edtln2: TEdit;
    edtln3: TEdit;
    edtln4: TEdit;
    edtln5: TEdit;
    edtln6: TEdit;
    edtln7: TEdit;
    edtln8: TEdit;
    edtln9: TEdit;
    btnLimpaMsg: TfcShapeBtn;
    DBgrdLancGerados: TwwDBGrid;
    Panel1: TPanel;
    cdsLancGera: TCMClientDataSet;
    dsLancGera: TwwDataSource;
    sqlLancGera: TCMSqlParams;
    cdsCODPORTFORMA: TFloatField;
    cdsCODTIPIMOVEL: TStringField;
    cdsCODDOCUMENTO: TFloatField;
    cdsLancGeraCODDOCUMENTO: TFloatField;
    cdsLancGeraCONNUMERO: TStringField;
    cdsLancGeraCONNOME: TStringField;
    cdsLancGeraIMOVEL: TStringField;
    cdsLancGeraVLR_INDICADOR: TFloatField;
    cdsLancGeraPERC_RATEIO: TFloatField;
    cdsLancGeraVLR_LANC: TFloatField;
    cdsLancGeraCIMDTINI: TDateTimeField;
    cdsLancGeraCIMDTFIM: TDateTimeField;
    cdsLancGeraIDIMOVEL: TFloatField;
    cdsLancGeraIDLOCATARIO: TFloatField;
    cdsLancGeraCODPORTFORMA: TFloatField;
    cdsLancGeraCODTIPIMOVEL: TStringField;
    cdsIDCONTRATOIMOVEL: TFloatField;
    cdsLancGeraIDCONTRATOIMOVEL: TFloatField;
    cdsIndicadorXApur: TCMClientDataSet;
    dsIndicadorXApur: TwwDataSource;
    sqlIndicadorXApur: TCMSqlParams;
    cdsIndicadorXApurIDINDICADORXAPUR: TFloatField;
    cdsIndicadorXApurIDIMOVEL: TFloatField;
    cdsIndicadorXApurIDUNIDAUT: TFloatField;
    cdsIndicadorXApurMESCOMPETENCIA: TFloatField;
    cdsIndicadorXApurANOCOMPETENCIA: TFloatField;
    cdsIndicadorXApurVLRAPURADO: TFloatField;
    cdsIndicadorXApurDATAAPURADO: TDateTimeField;
    cdsIndicadorXApurFLGPREVREAL: TStringField;
    cdsIndicadorXApurIDINDICADORIMOVEL: TFloatField;
    cdsIndicadorXApurFLGTIPOAPURACAO: TStringField;
    cdsIndicadorXApurINMDESCRICAO: TStringField;
    cdsIndicadorXApurFLGTIPOVALOR: TStringField;
    cdsIndicadorXApurRECPAG: TStringField;
    cdsIndicadorXApurDSC_TIPOVALOR: TStringField;
    cdsIndicadorXApurDSC_RECPAG: TStringField;
    cdsIndicadorXApurDSC_PREVREAL: TStringField;
    cdsIndicadorXApurDSC_TIPOAPURACAO: TStringField;
    cdsIDINDICADORIMOVEL: TFloatField;
    cdsFLGPREVREAL: TStringField;
    cdsFLGTIPOAPURACAO: TStringField;
    cdsLancGeraIDINDICADORIMOVEL: TFloatField;
    cdsLancGeraFLGPREVREAL: TStringField;
    cdsLancGeraFLGTIPOAPURACAO: TStringField;
    cdsMESCOMPETENCIA: TFloatField;
    cdsANOCOMPETENCIA: TFloatField;
    cdsDATAAPURADO: TDateTimeField;
    cdsLancGeraMESCOMPETENCIA: TFloatField;
    cdsLancGeraANOCOMPETENCIA: TFloatField;
    cdsLancGeraDATAAPURADO: TDateTimeField;
    cdsIndicadorXApurIDDOCUMENTO: TFloatField;
    cdsIndicadorXApurOBSERVACAO: TStringField;
    Label9: TLabel;
    Label14: TLabel;
    cdsVLR_LANC_ORIG: TFloatField;
    cdsLancGeraVLR_LANC_ORIG: TFloatField;
    cdsVLR_DESC: TFloatField;
    cdsLancGeraVLR_DESC: TFloatField;
    edtDesconto: TRealEdit;
    Label52: TLabel;
    Bevel1: TBevel;
    cdsMsgBoleto: TCMClientDataSet;
    dsMsgBoleto: TwwDataSource;
    sqlMsgBoleto: TCMSqlParams;
    cdsMsgBoletoIDMSGBOLETO: TFloatField;
    cdsMsgBoletoMSGDESCRICAO: TStringField;
    cdsMsgBoletoIDDOCUMENTO: TFloatField;
    cdsMsgBoletoIDMODULO: TFloatField;
    cdsMsgBoletoLINHA_1: TFloatField;
    cdsMsgBoletoTEXTOLINHA_1: TStringField;
    cdsMsgBoletoLINHA_2: TFloatField;
    cdsMsgBoletoTEXTOLINHA_2: TStringField;
    cdsMsgBoletoLINHA_3: TFloatField;
    cdsMsgBoletoTEXTOLINHA_3: TStringField;
    cdsMsgBoletoLINHA_4: TFloatField;
    cdsMsgBoletoTEXTOLINHA_4: TStringField;
    cdsMsgBoletoLINHA_5: TFloatField;
    cdsMsgBoletoTEXTOLINHA_5: TStringField;
    cdsMsgBoletoLINHA_6: TFloatField;
    cdsMsgBoletoTEXTOLINHA_6: TStringField;
    cdsMsgBoletoLINHA_7: TFloatField;
    cdsMsgBoletoTEXTOLINHA_7: TStringField;
    cdsMsgBoletoLINHA_8: TFloatField;
    cdsMsgBoletoTEXTOLINHA_8: TStringField;
    cdsMsgBoletoLINHA_9: TFloatField;
    cdsMsgBoletoTEXTOLINHA_9: TStringField;
    cdsMsgBoletoLMBNUMLINHA: TFloatField;
    cdsMsgBoletoLMBTEXTOLINHA: TStringField;
    cdsLinhaMsgBoleto: TCMClientDataSet;
    dsLinhaMsgBoleto: TwwDataSource;
    sqlLinhaMsgBoleto: TCMSqlParams;
    cdsLinhaMsgBoletoIDMSGBOLETO: TFloatField;
    cdsLinhaMsgBoletoMSGDESCRICAO: TStringField;
    cdsLinhaMsgBoletoIDDOCUMENTO: TFloatField;
    cdsLinhaMsgBoletoIDMODULO: TFloatField;
    cdsLinhaMsgBoletoLMBNUMLINHA: TFloatField;
    cdsLinhaMsgBoletoLMBTEXTOLINHA: TStringField;
    cdsLinhaMsgBoletoLINHA_1: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_1: TStringField;
    cdsLinhaMsgBoletoLINHA_2: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_2: TStringField;
    cdsLinhaMsgBoletoLINHA_3: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_3: TStringField;
    cdsLinhaMsgBoletoLINHA_4: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_4: TStringField;
    cdsLinhaMsgBoletoLINHA_5: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_5: TStringField;
    cdsLinhaMsgBoletoLINHA_6: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_6: TStringField;
    cdsLinhaMsgBoletoLINHA_7: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_7: TStringField;
    cdsLinhaMsgBoletoLINHA_8: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_8: TStringField;
    cdsLinhaMsgBoletoLINHA_9: TFloatField;
    cdsLinhaMsgBoletoTEXTOLINHA_9: TStringField;
    chkVencContrato: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBgrdLancGerarCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancGerarTopRowChanged(Sender: TObject);
    procedure dbcboFormaCobrancaChange(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure chkVencContratoClick(Sender: TObject);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
  private
    { Private declarations }

    CtrlGeraRecLote     : TCtrlGeraRecLote;
    CtrlLancamentos     : TCtrlLancamentosImovel;
    CtrlContratoImovel  : TCtrlContratoImovel;
    //CtrlDocumento       : TCtrlDocumento;
    CtrlDocumento       : TCtrlImobDocumento;
    CtrlIndicadorImovel : TCtrlIndicadorImovel;
    CtrlMensagemBoleto  : TCtrlMensagemBoleto;
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381


    iMes,  iAno   : word;
    iAnoI, iMesI  : word;
    bTransacao    : Boolean;
    fPercentual   : Double;
    vMsg          : array[0..8] of String;

    function VerificaPreenchimento: Boolean;
    function ContinuaSelecao: Boolean;
    function ContinuaLanc: Boolean;
    function GeraLancamento: Boolean;
    function GravaIndicadores: Boolean;
    function GravaMensagens: Boolean;

  public
    { Public declarations }
  end;

var
  frmExecGeraRecLoteMT: TfrmExecGeraRecLoteMT;

implementation

uses uVerificaPreenchimento, uMensErro;

{$R *.DFM}

procedure TfrmExecGeraRecLoteMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlGeraRecLote := TCtrlGeraRecLote.Create(Sistema.IdEmpresa,
                                             Sistema.IdModulo,
                                             Sistema.IdUsuario,
                                             Sistema.IdEspAcesso,
                                             Sistema.UsaPlanoPatro);

  CtrlLancamentos := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);

  CtrlContratoImovel := TCtrlContratoImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);

  //CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento := TCtrlImobDocumento.Create;

  CtrlIndicadorImovel := TCtrlIndicadorImovel.Create(Sistema.IdEmpresa,
                                                     Sistema.IdModulo,
                                                     Sistema.IdUsuario,
                                                     Sistema.IdEspAcesso,
                                                     Sistema.UsaPlanoPatro);

  CtrlMensagemBoleto := TCtrlMensagemBoleto.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);

  CtrlGeraRecLote.InitializeAs(Padroes);
  CtrlLancamentos.InitializeAs(Padroes);
  CtrlContratoImovel.InitializeAs(Padroes);
  CtrlDocumento.InitializeAs(Padroes);
  CtrlIndicadorImovel.InitializeAs(Padroes);
  CtrlMensagemBoleto.InitializeAs(Padroes);

{ Abre as querys para seleção ( Indicadores, Tipos de Receitas e Formas de
  Cobrança ) }
  sqlIndicadores.Open;
  sqlTipoRec.Open;
  sqlForma.Open;

  cdsForma.Filtered := False;
  cdsForma.Filter   := 'IDPESSOA = '+QuotedStr(IntToStr(Sistema.IdEmpresa));
  cdsForma.Filtered := True;
{ Fim. }

  CtrlIndicadorImovel.CdsIndicadorXApur := cdsIndicadorXApur;
  CtrlMensagemBoleto.CdsMsgBoleto       := cdsMsgBoleto;
  CtrlMensagemBoleto.CdsLinhaMsgBoleto  := cdsLinhaMsgBoleto;
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;

procedure TfrmExecGeraRecLoteMT.FormShow(Sender: TObject);
begin
  inherited;

  cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date)-1;
  DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
  cboMesI.ItemIndex := DiasInUteis.ExtraiMes(Date)-1;
  DBspnAnoI.Value   := DiasInUteis.ExtraiAno(Date);

end;

function TfrmExecGeraRecLoteMT.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try

    if (dbcboIndicadores.Value='') then
      raise EValidacao.CreateVal('Informe o Indicador!',dbcboIndicadores);

    if (cboMesI.ItemIndex<0) then
      raise EValidacao.CreateVal('Informe o Mês de Competência do Indicador!',cboMesI);

    if (DBspnAnoI.Value<=0) then
      raise EValidacao.CreateVal('Informe o Ano de Competência do Indicador!',DBspnAnoI);

    if (cboMes.ItemIndex<0) then
      raise EValidacao.CreateVal('Informe o Mês de Competência!',cboMesI);

    if (DBspnAno.Value<=0) then
      raise EValidacao.CreateVal('Informe o Ano de Competência!',DBspnAnoI);

    if (edtDataLancamento.Date<=0) then
      raise EValidacao.CreateVal('Informe a Data de Lançamento!',edtDataLancamento);

    if (edtDataEmissao.Date<=0) then
      raise EValidacao.CreateVal('Informe a Data de Emissão!',edtDataEmissao);

    if not (chkVencContrato.Checked) then begin
      if (edtDataVencimento.Date<=0) then
        raise EValidacao.CreateVal('Informe a Data de Vencimento!',edtDataVencimento);
    end;

    if (dbcboTipoRecCobranca.Value='') then
      raise EValidacao.CreateVal('Informe o Tipo de Receita de Cobrança!',dbcboTipoRecCobranca);

    // Helen - SOL: 172902 KTN: 1577381 - Inicio
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLancamento.Text) then
       raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataLancamento);
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataEmissao.Text) then
       raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataEmissao);
    if not (chkVencContrato.Checked) then
    begin
        if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVencimento.Text) then
           raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataVencimento);
    end;
    // Helen - SOL: 172902 KTN: 1577381 - Fim
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message,'Aviso',mtWarning,[mbOk],0);
      Repaint;

      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;

  end;

  Result := True;
end;

procedure TfrmExecGeraRecLoteMT.dbcboFormaCobrancaChange(Sender: TObject);
begin
  inherited;

  chkBoleto.Checked := not(cdsFormaIDCONFIGBARRAS.IsNull);
end;

function TfrmExecGeraRecLoteMT.ContinuaSelecao: Boolean;
var iIndicador : Integer;
begin
  Result := False;

  iAnoI := Word(Trunc(DBspnAnoI.Value));
  iMesI := cboMesI.ItemIndex+1;
  iAno  := Word(Trunc(DBspnAno.Value));
  iMes  := cboMes.ItemIndex+1;

  fPercentual  := StrToFloat(edtDesconto.Text);

  if (dbcboIndicadores.LookupValue='') then
    iIndicador := 0
  else
    iIndicador := StrToInt(dbcboIndicadores.LookupValue);

  if (VerificaPreenchimento) then begin
    cds.Data := CtrlGeraRecLote.LookupLancamentosAGerar(molImovelouMestre1.iImovel,
                                                        molContrato1.iContrato,
                                                        molResponsavel1.iResponsavel,
                                                        iAno,iMes,iAnoI,iMesI,
                                                        iIndicador,
                                                        fPercentual);
    Result := True;
  end;
end;

function TfrmExecGeraRecLoteMT.ContinuaLanc: Boolean;
begin
  Result := False;

  if (chkBoleto.Checked) then begin
    // Se tiver habilitado para gerar mensagens no boleto...
    PagControle.ActivePageIndex := 1;
    Result := True;
  end else begin
    // Se não tiver habilitado passa direto para a tela de lançamentos gerados...
    PagControle.ActivePageIndex := 2;
    Result := True;
  end;

  GeraLancamento;
end;

procedure TfrmExecGeraRecLoteMT.btnContinuarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
    0 : if ContinuaSelecao then inherited;
    1 : if ContinuaLanc    then inherited;
    2 : inherited;
  end;
end;

procedure TfrmExecGeraRecLoteMT.btnVoltarClick(Sender: TObject);
begin
  if (CtrlLancamentos.InTransaction) then begin
    CtrlLancamentos.OpenTransaction := True;
    CtrlLancamentos.Rollback;
    CtrlLancamentos.OpenTransaction := False;
  end;

  case PagControle.ActivePageIndex of
    1 : inherited;
    2 : inherited;
    3 : if (chkBoleto.Checked) then
          inherited
        else begin
          PagControle.ActivePageIndex := 2;
          inherited;
        end;
  end;
end;

function TfrmExecGeraRecLoteMT.GeraLancamento: Boolean;
var iContrato      : Integer;
    iFormaCobranca : Integer;
    iDocumento     : Integer;
    VlrTotal       : Extended;
    cdsImovelTemp  : TCMClientDataSet;
    cdsAltTemp     : TCMClientDataSet;
    sHistorico     : String;
    iRecno         : TBookMark;
    sLista         : TStringList;
    sImovel        : TStringList;
    iContador      : Integer;
    bEof           : Boolean;
    dVencimento    : TDateTime;
    iLocatario     : Integer;
begin
  cds.DisableControls;
  cds.First;

  sLista  := TStringList.Create;
  sImovel := TStringList.Create;

  try
    cdsImovelTemp := TCMClientDataSet.Create(nil);
    cdsAltTemp    := TCMClientDataSet.Create(nil);

    cdsImovelTemp.Data := CtrlContratoImovel.LookupContratoXImovel(-2);

    bTransacao := CtrlLancamentos.InTransaction;

    if not bTransacao then
      CtrlLancamentos.StartTransaction;

    while not cds.Eof do begin
      cdsImovelTemp.EmptyDataSet;

      iContrato  := cds.FieldByName('IDCONTRATOIMOVEL').AsInteger;
      iLocatario := cds.FieldByName('IDLOCATARIO').AsInteger;

      if (chkVencContrato.Checked) then
           dVencimento := FuncoesImob.DataVencAluguel(iContrato,iAno,iMes,'A',False)
      else dVencimento := edtDataVencimento.Date;

      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if (chkVencContrato.Checked) then
      begin
        if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DateToStr(dVencimento)) then
        begin
             raise EValidacao.CreateVal('Período bloqueado pela Contabilidade - Data de Vencimento do Contrato!', edtDataVencimento);
             break;
        end;
      end;
      // Helen - SOL: 172902 KTN: 1577381 - Fim

      if (dbcboFormaCobranca.LookupValue='') then
           iFormaCobranca := cds.FieldByName('CODPORTFORMA').AsInteger
      else iFormaCobranca := StrToInt(dbcboFormaCobranca.LookupValue);

      sLista.Clear;
      sImovel.Clear;

      while (iContrato=cds.FieldByName('IDCONTRATOIMOVEL').AsInteger) and (not cds.Eof) do begin
        VlrTotal := VlrTotal+cds.FieldByName('VLR_LANC').AsFloat;

        cdsImovelTemp.Insert;
        cdsImovelTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger := cds.FieldByName('IDCONTRATOIMOVEL').AsInteger;
        cdsImovelTemp.FieldByName('IDIMOVEL').AsInteger         := cds.FieldByName('IDIMOVEL').AsInteger;
        cdsImovelTemp.FieldByName('VLRIMOVEL').AsFloat          := cds.FieldByName('VLR_LANC').AsFloat;
        cdsImovelTemp.FieldByName('CODTIPIMOVEL').AsString      := cds.FieldByName('CODTIPIMOVEL').AsString;
        cdsImovelTemp.Post;

        sLista.Add(cds.FieldByName('IDCONTRATOIMOVEL').AsString);
        sImovel.Add(cds.FieldByName('IDIMOVEL').AsString);

        cds.Next;
      end;

      bEof := cds.Eof;

      if not bEof then
        iRecno := cds.GetBookmark;

      iDocumento := CtrlDocumento.GetSequenceDocumento;
      sHistorico := dbcboTipoRecCobranca.Text+' - '+cboMes.Text+' de '+FloatToStr(DBspnAno.Value);

      CtrlLancamentos.OpenTransaction := False;

      // Gerar lançamento...
      if not CtrlLancamentos.Inserir( iMes,                                        // Mês de Competência
                                      iAno,                                        // Ano de Competência
                                      iLocatario,                    // Fornecedor
                                      StrToInt(dbcboTipoRecCobranca.LookupValue),  // Tipo de Receita de Cobrança
                                      -1,                                          // Forma de Cobrança
                                      iFormaCobranca,                              // Portador / Forma de Cobrança
                                      -1,                                          // Compromisso
                                      -1,                                          // Conta Bancária
                                      ModuloImobiliario.Global.iMoedaCorrente,     // Moeda Corrente
                                      iDocumento,                                  // Número do Documento
                                      -1,                                          //
                                      iDocumento,                                  // Número do Documento
                                      VlrTotal,                                    // Valor Total
                                      VlrTotal,                                    // Valor Total OM
                                      'L',                                         // L = Lançamentos em Lote
                                      'R',                                         // R = Contas a Receber
                                      '',                                          // Referência
                                      '',                                          // Observação
                                      ModuloImobiliario.AdminImob.sCodCentroCusto, // Centro de Custo
                                      sHistorico,                                  // Histórico
                                      dVencimento,                                 // Data de Vencimento
                                      edtDataLancamento.Date,                      // Data de Lançamento
                                      -1,                                          // Contabilização Diária Inicial
                                      -1,                                          // Contabilização Diária Final
                                      cdsImovelTemp.Data,                          // ClientDataSet Imóveis
                                      cdsAltTemp.Data,                             // ClientDataSet Alterador
                                      False,                                       // Integração
                                      False ) then                                 // Transação
        raise Exception.Create(CtrlLancamentos.MessageInfo);

      // Armazena o CODDOCUMENTO Gerado para ser atribuido ao cdsLancGera
      for iContador := 0 to sLista.Count-1  do begin
        if cds.Locate('IDCONTRATOIMOVEL;IDIMOVEL',
                      VarArrayOf([sLista.Strings[icontador],sImovel.Strings[iContador]]),[]) then begin
          cds.Edit;
          cds.FieldByName('CODDOCUMENTO').AsInteger := iDocumento;
          cds.Post;
        end;
      end;

      if not bEof then begin
        cds.GotoBookmark(iRecno);
        cds.FreeBookmark(iRecno);
      end else Break;
    end;

    cdsLancGera.Data := cds.Data;

    // Registra o indicador realizado para cada imovel do documento...
    if not GravaIndicadores then
      raise Exception.Create(CtrlIndicadorImovel.MessageInfo);

  except
    on e : Exception do begin
      if Length(e.message) > 0 then
        MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);

      CtrlLancamentos.OpenTransaction := True;
      CtrlLancamentos.Rollback;
      CtrlLancamentos.OpenTransaction := False;

      IrParaPagina(1);
      PagControle.ActivePage := tabSelecao;
      Repaint;
    end;
  end;

  cds.First;
  cds.EnableControls;

  sLista.Free;
  sImovel.Free;
end;

procedure TfrmExecGeraRecLoteMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlGeraRecLote);
  FreeAndNil(CtrlLancamentos);
  FreeAndNil(CtrlContratoImovel);
  FreeAndNil(CtrlDocumento);
  FreeAndNil(CtrlIndicadorImovel);
  FreeAndNil(CtrlMensagemBoleto);
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381

  inherited;
end;

procedure TfrmExecGeraRecLoteMT.DBgrdLancGerarCalcCellColors(Sender:TObject; Field:TField; State:TGridDrawState;
                                                               Highlight:Boolean; AFont:TFont; ABrush:TBrush);
begin
  inherited;

  // Faz com que as linhas do grid tenham cores alternadas...
  if (State<>[gdSelected]) then begin
    if not Highlight then begin
      // Linhas ímpares = amarelo, linhas pares = branco
      if ( ((Sender as TwwDBGrid).CalcCellRow mod 2)=0 ) then begin
        ABrush.Color := $00C0FFFF; // Amarelo bebê
      end else begin
        ABrush.Color := clWhite;
      end;
    end;
  end else begin
    ABrush.Color := clHighLight;
    AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmExecGeraRecLoteMT.DBgrdLancGerarTopRowChanged(Sender:TObject);
begin
  inherited;

  // Acerta as cores quando muda a linha da grid...
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecGeraRecLoteMT.btnConfirmarClick(Sender: TObject);
begin
  //inherited;

  if MsgDlg('Confirma inclusão dos lançamentos gerados?','Confirmação',mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    try
      { Registra a mensagem que será exibida no boleto do respectivo documento
        caso exista mensagem gerada para o boleto... }
      if (chkBoleto.Checked) then begin
        if not GravaMensagens then
          raise Exception.Create(CtrlMensagemBoleto.MessageInfo);
      end;

      CtrlLancamentos.OpenTransaction := True;
      CtrlLancamentos.Commit;
      CtrlLancamentos.OpenTransaction := False;

      MsgDlg('Lançamentos Gerados com sucesso!','Informação',mtInformation,[mbYes],0);
      ModalResult := mrOk;
    except
      CtrlLancamentos.OpenTransaction := True;
      CtrlLancamentos.Rollback;
      CtrlLancamentos.OpenTransaction := False;
    end;

    // Volta pra página inicial...
    PagControle.ActivePageIndex := 0;
  end;
end;

function TfrmExecGeraRecLoteMT.GravaIndicadores: Boolean;
var sObs  : String;
begin
  Result := True;

  cdsIndicadorXApur.Data := CtrlIndicadorImovel.LookupIndicadorXApur(-2);
  cdsLancGera.First;

  sObs := '';

  if (fPercentual>0) then
    sObs := 'Aplicado desconto de '+FloatToStr(fPercentual)+'%';

  while not cdsLancGera.Eof do begin

    cdsIndicadorXApur.Insert;
    cdsIndicadorXApur.FieldByName('IDINDICADORIMOVEL').AsInteger := cdsLancGera.FieldByName('IDINDICADORIMOVEL').AsInteger;
    cdsIndicadorXApur.FieldByName('MESCOMPETENCIA').AsInteger    := iMes;
    cdsIndicadorXApur.FieldByName('ANOCOMPETENCIA').AsInteger    := iAno;
    cdsIndicadorXApur.FieldByName('VLRAPURADO').AsFloat          := cdsLancGera.FieldByName('VLR_LANC').AsFloat;
    cdsIndicadorXApur.FieldByName('DATAAPURADO').AsDateTime      := edtDataLancamento.Date;
    cdsIndicadorXApur.FieldByName('FLGPREVREAL').AsString        := 'R';
    cdsIndicadorXApur.FieldByName('IDIMOVEL').AsInteger          := cdsLancGera.FieldByName('IDIMOVEL').AsInteger;
    cdsIndicadorXApur.FieldByName('FLGTIPOAPURACAO').AsString    := 'A';
    cdsIndicadorXApur.FieldByName('IDDOCUMENTO').AsInteger       := cdsLancGera.FieldByName('CODDOCUMENTO').AsInteger;
    cdsIndicadorXApur.FieldByName('OBSERVACAO').AsString         := sObs;
    cdsIndicadorXApur.Post;

    cdsLancGera.Next;
  end;

  CtrlIndicadorImovel.OpenTransaction := False;
  Result := CtrlIndicadorImovel.GravaIndicadorXApur;
end;

function TfrmExecGeraRecLoteMT.GravaMensagens: Boolean;
var i            : Integer;
    sReceita     : String;
    sCompetencia : String;
begin
  Result := True;

  cdsMsgBoleto.Data      := CtrlMensagemBoleto.LookupMsgBoletoComLinhas(-2,-2);
  cdsLinhaMsgBoleto.Data := cdsMsgBoleto.Data;

  for i:=0 to 8 do
    vMsg[i] := TEdit(FindComponent('edtln'+IntToStr(i+1))).Text;

  sReceita     := dbcboTipoRecCobranca.Text;
  sCompetencia := cboMes.Text+' de '+FloatToStr(DBspnAno.Value);

  CtrlMensagemBoleto.SubstituiCuringa(vMsg,['<recdes>','<comp>'],[sReceita,sCompetencia]);
  CtrlMensagemBoleto.OpenTransaction := False;

  cdsMsgBoleto.Insert;
  cdsMsgBoleto.FieldByName('IDDOCUMENTO').AsInteger := cdsLancGeraCODDOCUMENTO.AsInteger;
  cdsMsgBoleto.FieldByName('MSGDESCRICAO').AsString := 'Lançamento em Lote';
  cdsMsgBoleto.FieldByName('IDMODULO').AsInteger    := 64;
  cdsMsgBoleto.Post;

  for i:=0 to 8 do begin
    if length(Trim(vMsg[i])) > 0 then
    begin
       cdsLinhaMsgBoleto.Insert;
       cdsLinhaMsgBoleto.FieldByName('IDMSGBOLETO').AsInteger  := -1;
       cdsLinhaMsgBoleto.FieldByName('LMBTEXTOLINHA').AsString := vMsg[i];
       cdsLinhaMsgBoleto.FieldByName('LMBNUMLINHA').AsInteger  := (i+1);
       cdsLinhaMsgBoleto.Post;
    end;
  end;

  Result := CtrlMensagemBoleto.GravaMsgBoleto;
end;

procedure TfrmExecGeraRecLoteMT.chkVencContratoClick(Sender: TObject);
begin
  inherited;

  if chkVencContrato.Checked then begin
    edtDataVencimento.Clear;
    edtDataVencimento.Enabled := False;
  end else
    edtDataVencimento.Enabled := True;

end;

procedure TfrmExecGeraRecLoteMT.molContrato1btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnBuscaContratoClick(Sender);

end;

end.
