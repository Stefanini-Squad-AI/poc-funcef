unit fExecRecalculo;

// -------------------------------------------------------------------------------------------------
//
// Modificação no cadastro de Multas e Juros para aceitar períodos de Vigência
// diferenciados - Mestre/Detalhe
//
// Autor:            :  Marcio Motta
// Data de Início    :  13/01/2004
// Data de Término   :  13/01/2004
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, fcLabel, fcButton, fcImgBtn,
  fcShapeBtn, Mask, DBCtrls, MontaSelect, Db, DBTables, Wwquery, Wwdatsrc,
  wwdbedit, Wwdotdot, Wwdbcomb, TREdit, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, uCtrlOperImob,
  uCtrlContratoImovel, {uCtrlDocumento}uCtrlImobDocumento, uCtrlParamIntegra, uCtrlEventoImovel,
  Provider, DBClient, uCMClientDataSet, Wwdbspin, UComunsImobiliarioDB;

type
  TfrmExecRecalculo = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    ntbRecalculo: TNotebook;
    Label6: TLabel;
    btnProcurar: TfcShapeBtn;
    btnContinuaSelecao: TfcShapeBtn;
    MS_Parc: TMontaSelect;
    qryParc: TwwQuery;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcCONNUMERO: TStringField;
    qryParcCONNOME: TStringField;
    qryParcCOMPRADOR: TStringField;
    qryParcRESPONSAVEL: TStringField;
    qryParcNOMEMESTRE: TStringField;
    qryParcNUMPARCELA: TStringField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcFLGLANCINTEGRA: TFloatField;
    Panel1: TPanel;
    Label4: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label5: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    dsParc: TwwDataSource;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcDATALANCINTEGRA: TDateTimeField;
    qryParcCAL_TIPO: TStringField;
    Label21: TLabel;
    edtDataVencimento: TCMDateTimePicker;
    grpReajuste: TGroupBox;
    DBcboIndiceReajuste: TwwDBLookupCombo;
    grpMulta: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBedtPercentMulta: TDBRealEdit;
    DBedtVlrMulta: TDBRealEdit;
    DBcboMoedaMulta: TwwDBLookupCombo;
    grpMora: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBedtVlrMora: TDBRealEdit;
    DBedtPercentMora: TDBRealEdit;
    DBedtMoedaMora: TwwDBLookupCombo;
    grpPeriodicidadeMora: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    DBchkMoraProporc: TDBCheckBox;
    dbCboPeriodicidade: TwwDBComboBox;
    Bevel2: TBevel;
    btnVoltaIndice: TfcShapeBtn;
    btnContinuaIndice: TfcShapeBtn;
    qryLookMoeda: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    qryLookMoedaMOEPERIODICIDADE: TStringField;
    qryLookMoedaMOEINATIVO: TStringField;
    qryLookMoedaFLGPERCVALOR: TStringField;
    qryLookMoedaDATAINICIO: TDateTimeField;
    qryLookMoedaDATAFIM: TDateTimeField;
    updParc: TUpdateSQL;
    GroupBox1: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtln1: TEdit;
    edtln2: TEdit;
    edtln4: TEdit;
    edtln5: TEdit;
    edtln6: TEdit;
    edtln7: TEdit;
    edtln3: TEdit;
    edtln8: TEdit;
    edtln9: TEdit;
    Label41: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label49: TLabel;
    Bevel1: TBevel;
    btnVoltarMens: TfcShapeBtn;
    btnContinuarMens: TfcShapeBtn;
    Bevel3: TBevel;
    btnVoltarCalculo: TfcShapeBtn;
    btnContinuarCalculo: TfcShapeBtn;
    Bevel4: TBevel;
    DBgrdAlteradoresLanc: TwwDBGrid;
    Label23: TLabel;
    btnExcluiAlterador: TBitBtn;
    Bevel5: TBevel;
    btnVoltarAlterador: TfcShapeBtn;
    bntConfirmar: TfcShapeBtn;
    qryAlteradoresLanc: TwwQuery;
    qryAlteradoresLancDESCRICAO: TStringField;
    qryAlteradoresLancHISTORICOCOMPL: TStringField;
    qryAlteradoresLancVALOR: TFloatField;
    qryAlteradoresLancDATALANCTO: TDateTimeField;
    qryAlteradoresLancCODDOCUMENTO: TFloatField;
    qryAlteradoresLancNUMLANCTO: TFloatField;
    qryAlteradoresLancCODALTERADOR: TFloatField;
    qryAlteradoresLancPLNCODIGO: TFloatField;
    qryAlteradoresLancVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresLancDEBCRE: TStringField;
    qryAlteradoresLancOPERACAO: TStringField;
    dsAlteradoresLanc: TwwDataSource;
    qryUpdateMensagensCnab: TwwQuery;
    qryParcCODGRUPOCNAB: TFloatField;
    Label11: TLabel;
    Label12: TLabel;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcIDCIDADES: TFloatField;
    qryParcCODESTADO: TStringField;
    qryParcIDPAIS: TFloatField;
    Panel2: TPanel;
    Label47: TLabel;
    edtVO: TRealEdit;
    Label9: TLabel;
    edtCM: TRealEdit;
    Label10: TLabel;
    edtMulta: TRealEdit;
    Label8: TLabel;
    edtJuros: TRealEdit;
    Label46: TLabel;
    edtTotal: TRealEdit;
    Panel3: TPanel;
    Label48: TLabel;
    edCorr: TEdit;
    edMulta: TEdit;
    edJuros: TEdit;
    Panel4: TPanel;
    Label22: TLabel;
    Label50: TLabel;
    edtVlrOrig: TRealEdit;
    Label51: TLabel;
    Label52: TLabel;
    edtVlrAlt: TRealEdit;
    Label53: TLabel;
    edtVlrBaixa: TRealEdit;
    edtVencto: TCMDateTimePicker;
    edtDtBaixa: TCMDateTimePicker;
    cdsContratoXMulta: TCMClientDataSet;
    dsContratoXMulta: TwwDataSource;
    cdsContratoXMultaIDCONTRATOXMULTA: TFloatField;
    cdsContratoXMultaIDCONTRATOIMOVEL: TFloatField;
    cdsContratoXMultaIDINDCORRECAO: TFloatField;
    cdsContratoXMultaMOEDAJUROS: TFloatField;
    cdsContratoXMultaMOEDAMULTA: TFloatField;
    cdsContratoXMultaFLGINDETERMINADO: TStringField;
    cdsContratoXMultaVLRMULTA: TFloatField;
    cdsContratoXMultaPERCMULTA: TFloatField;
    cdsContratoXMultaVLRJUROS: TFloatField;
    cdsContratoXMultaPERCJUROS: TFloatField;
    cdsContratoXMultaPERIODOJUROS: TStringField;
    cdsContratoXMultaFLGJUROSPROPORC: TStringField;
    cdsContratoXMultaDATAINI: TDateTimeField;
    cdsContratoXMultaDATAFIM: TDateTimeField;
    cdsContratoXMultaMESREFCORRECAO: TFloatField;
    cdsContratoXMultaDIASTOLERANCIA: TFloatField;
    cdsContratoXMultaDIASREPASSE: TFloatField;
    cdsContratoXMultaFLGTIPODIATOLERA: TStringField;
    cdsContratoXMultaFLGTIPODIAREPASS: TStringField;
    cdsContratoXMultaTRGDTINCLUSAO: TDateTimeField;
    cdsContratoXMultaTRGUSERINCLUSAO: TStringField;
    dbSpEdtMesesAnteriores: TwwDBSpinEdit;
    Label59: TLabel;
    Label63: TLabel;
    GroupBox3: TGroupBox;
    Panel5: TPanel;
    memEvento: TMemo;
    cbDataProgramada: TCheckBox;
    procedure btnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnVoltaIndiceClick(Sender: TObject);
    procedure qryParcCalcFields(DataSet: TDataSet);
    procedure btnContinuaIndiceClick(Sender: TObject);
    procedure ntbRecalculoPageChanged(Sender: TObject);
    procedure btnVoltarMensClick(Sender: TObject);
    procedure btnContinuarMensClick(Sender: TObject);
    procedure btnVoltarCalculoClick(Sender: TObject);
    procedure btnContinuarCalculoClick(Sender: TObject);
    procedure btnVoltarAlteradorClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bntConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    iAltJuros,iAltMulta,iAltCorr : Integer;
    sAltJuros,sAltMulta,sAltCorr : String;

    ctrlContratoImovel  : TCtrlContratoImovel;
    //CtrlDocumento       : TCtrlDocumento;
    CtrlDocumento       : TCtrlImobDocumento;
    CtrlEventoImovel    : TCtrlEventoImovel;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    CtrlOperImob        : TCtrlOperImob;
    dDataFechamento     : TDateTime;

    function  VerificaPreenchimento: boolean;
    procedure AbreTabelas;
    procedure GravaCalculo;
    procedure GravaMensagens;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecRecalculo: TfrmExecRecalculo;

implementation

{$R *.DFM}

uses DFinanciamento, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
     uCalcDocumento, UFuncoesImob, dImobiliario, uDataBase, uIntegraBack, uSistema,
     dBaseDados, UFuncAlienacao, uModuloImobiliario, uModuloAlienacao;


procedure TfrmExecRecalculo.FormCreate(Sender: TObject);
begin
  inherited;
// Início ------- Data: 13/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
  CtrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
  //CtrlDocumento       := TCtrlDocumento.Create;
  CtrlDocumento       := TCtrlImobDocumento.Create;
  CtrlEventoImovel    := TCtrlEventoImovel.Create;
  CtrlOperImob        := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal ,Sistema.UsaPlanoPatro);

  ctrlContratoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                 ComunsImobiliario.MensErroMT);

  ComunsImobiliarioDB.InitializeAs( CtrlContratoImovel );
  CtrlDocumento.InitializeAs( CtrlContratoImovel );
  CtrlEventoImovel.InitializeAs( CtrlContratoImovel );
  CtrlOperImob.InitializeAs( CtrlContratoImovel );

  // Desabilita o botão de continuar, pois não possui dados suficientes para a continuação - Marcio Motta - 15/01/2004
  btnContinuaSelecao.Enabled := False;

// Fim ------------------------ Marcio Motta -----------------------------------

end;

procedure TfrmExecRecalculo.FormDestroy(Sender: TObject);
begin
// Início ------- Data: 13/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
  FreeAndNil( CtrlContratoImovel );
  FreeAndNil( ComunsImobiliarioDB );
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlEventoImovel );
  FreeAndNil( CtrlOperImob );
  inherited;
// Fim ------------------------ Marcio Motta -----------------------------------
end;


procedure TfrmExecRecalculo.btnProcurarClick(Sender: TObject);
begin
   inherited;
   MS_Parc.Executar;
   Repaint;
   if MS_Parc.RetornouValor then begin
      LimpaParametros(qryParc);
      qryParc.ParamByName('pIDPARCFINANCIMOV').AsFloat := StrToFloat(MS_Parc.ValoresChave[0]);
      qryParc.Open;
      btnContinuaSelecao.Enabled := True;

//--- 13/01/2004 ------- Início - Marcio Motta ------- Pebdência: 15799 ----------------------------

      cdsContratoXMulta.Data := ctrlContratoImovel.BuscaParamCMJurosMulta (qryParcIDCONTRATOIMOVEL.AsFloat , qryParcDATAVENCIMENTO.AsDateTime);

      if cdsContratoXMulta.IsEmpty then
        btnContinuaSelecao.Enabled := False
      else
        btnContinuaSelecao.Enabled := True;

//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------
   end;
end;

procedure TfrmExecRecalculo.FormShow(Sender: TObject);
begin
   inherited;
   AbreTabelas;
   ntbRecalculo.ActivePage    := 'Selecao';
   btnContinuaSelecao.Enabled := False;

   // Marchetti - Pendencia 26009
   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM <= 0) then
      dDataFechamento     := Date
   else
      dDataFechamento     := CtrlOperImob.UltimoFechamento;

   edtDataVencimento.Date     := dDataFechamento;
   // Fim Marchetti - Pendencia 26009
   
end;

procedure TfrmExecRecalculo.AbreTabelas;
begin
   LimpaParametros(qryParc);
   LimpaParametros(qryLookMoeda);
   qryLookMoeda.Open;
end;


procedure TfrmExecRecalculo.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;
   ntbRecalculo.ActivePage := 'Indice';
   edtDataVencimento.SetFocus;

//------- Início --- 13/01/2004 --- Marcio Motta --- Pendência: 15799 ------------------------------

  cdsContratoXMulta.Edit;
  if cdsContratoXMultaPERIODOJUROS.IsNull then cdsContratoXMultaPERIODOJUROS.AsString := 'M';

//------- Fim --- Marcio Motta ---------------------------------------------------------------------
end;

procedure TfrmExecRecalculo.btnVoltaIndiceClick(Sender: TObject);
begin
   inherited;
   ntbRecalculo.ActivePage := 'Selecao';
   qryParc.Cancel;
end;

procedure TfrmExecRecalculo.btnContinuaIndiceClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimento then begin
      ntbRecalculo.ActivePage := 'Mensagem';
      Repaint;
   end;
end;

procedure TfrmExecRecalculo.btnVoltarMensClick(Sender: TObject);
begin
   inherited;
   ntbRecalculo.ActivePage := 'Indice';
end;

procedure TfrmExecRecalculo.qryParcCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger,
                                                         qryParcFLGLANCINTEGRA.AsInteger);
end;

procedure TfrmExecRecalculo.ntbRecalculoPageChanged(Sender: TObject);
begin
   inherited;
   case ntbRecalculo.PageIndex of
      0 : lblTitulo.Caption := 'Parcela para Recálculo [Seleção]';
      1 : lblTitulo.Caption := 'Parcela para Recálculo [Indices]';
      2 : lblTitulo.Caption := 'Parcela para Recálculo [Mensagens]';
      3 : lblTitulo.Caption := 'Parcela para Recálculo [Calculo]';
      4 : lblTitulo.Caption := 'Parcela para Recálculo [Alteradores]';
   end;
end;

function TfrmExecRecalculo.VerificaPreenchimento: boolean;
var dDataLimite : TDateTime;
begin
   Result := False;

   // verifica os perecentuais de juros, multa e mora
   try
//------- Início --- 13/01/2004 --- Marcio Motta ---- Pendência: 15799 ----------------------------
      if (DBcboIndiceReajuste.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar o índice da Correção Monetária!', DBcboMoedaMulta);

      if (dbSpEdtMesesAnteriores.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar a quantidade de meses' + #13 +
                                    'para o cálculo da Correção Monetária!', dbSpEdtMesesAnteriores);
//------- Fim Implementação/Alteração - Marcio Motta ----------------------------------------------

      if (DBedtVlrMulta.Value <> 0) and (DBcboMoedaMulta.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar a moeda da multa!', DBcboMoedaMulta);

      if (DBedtVlrMulta.Value <> 0) and (DBedtPercentMulta.Value <> 0) then
         raise EValidacao.CreateVal('A multa deve ser escolhida por valor ou percentual!', DBedtVlrMulta);

      if (DBedtVlrMora.Value <> 0) and (DBedtMoedaMora.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar a moeda do juros de mora!', DBedtMoedaMora);

      if (DBedtVlrMora.Value <> 0) and (DBedtPercentMora.Value <> 0) then
         raise EValidacao.CreateVal('O juros de mora deve ser escolhido por valor ou percentual!', DBedtVlrMora);

      if ((DBedtVlrMora.Value <> 0) or (DBedtPercentMora.Value <> 0)) and (dbCboPeriodicidade.Text = '') then
         raise EValidacao.CreateVal('É necessário indicar a periodicidade do juros de mora!', dbCboPeriodicidade);

//------- Início: 13/01/2004 ---- Marcio Motta ------- Pendência: 15799 ----------------------------
// Modificados os campos de QRY para CDS devido a nova estrutura das tabelas

      // Verifica data limite para pagamento
      dDataLimite := ComunsImobiliarioDB.DataLimite(qryParcDATAVENCIMENTO.AsDateTime,
                                                    qryParcIDCIDADES.AsInteger,
                                                    qryParcIDPAIS.AsInteger,
                                                    cdsContratoXMultaDIASTOLERANCIA.AsInteger,
                                                    cdsContratoXMultaDIASREPASSE.AsInteger,
                                                    qryParcCODESTADO.AsString,
                                                    cdsContratoXMultaFLGTIPODIATOLERA.AsString,
                                                    cdsContratoXMultaFLGTIPODIAREPASS.AsString,
                                                    True, False, False);
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

      if edtDataVencimento.DateTime <= dDataLimite then begin
         if MsgDlg('Conforme contrato, este documento poderá ser pago até ' + DateToStr(dDataLimite) +#13+
                   'sem acréscimo, confirma o Recálculo? ', 'Confirma', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            raise EValidacao.CreateVal('', edtDataVencimento);
      end;

      // Marchetti - Pendencia 26009
      if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
         (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
         (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0) then
      begin
         if edtDataVencimento.Date <= dDataFechamento then
            raise EValidacao.CreateVal('Data de recálculo deve ser superior ao último fechamento realizado em ' + FormatDateTime('dd/mm/yyyy',dDataFechamento) +'!', edtDataVencimento);
      end;
      // Fim Marchetti - Pendencia 26009
   except
      on ev : EValidacao do begin
         if ev.message <> '' then
            if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;


procedure TfrmExecRecalculo.btnContinuarMensClick(Sender: TObject);
var
   fValorCorrecao, fTotBaixa, fTotAlterador, fSaldoDoc: Extended;
   iMoedaMora, iMoedaMulta: Integer;
   iUsaMesAnterior : Integer;
   dUltLancBaixa, dIniCorrecao, NovaDataVencto : TDateTime;
   bMoraProp : boolean;
begin
   inherited;

   // Busca os Alteradores por Tipo de Imóvel
   if not FuncAlienacao.BuscaAlteradores(qryParcIDCONTRATOIMOVEL.AsInteger,-1,
                                         iAltMulta,iAltJuros,iAltCorr,
                                         sAltMulta,sAltJuros,sAltCorr) then begin
      MsgDlg('Nenhuma Parametrização Definida para o Tipo de Imóvel','Aviso',mtWarning,[mbOk],0);
      Abort;
   end;
   edMulta.Text := sAltMulta;
   edJuros.Text := sAltJuros;
   edCorr.Text  := sAltCorr;

   // 17/12/03 - Vinicius: Caso o documento já tenha sido baixado parcialmente, deve-se
   //            considerar como saldo os alteradores lançados até a data da ultima baixa.
   //            não excluir os alteradores anteriores, apurar apenas o Juros e CM entre a
   //            data da ultima baixa e a nova data, lançando em novos alteradores.


   // Abre a query dos alteradores
   LimpaParametros(qryAlteradoresLanc);
   qryAlteradoresLanc.ParamByName('PCODDOCUMENTO').AsInteger := qryParcCODDOCUMENTO.AsInteger;
   qryAlteradoresLanc.ParamByName('PALTMULTA').AsInteger  := iAltMulta;
   qryAlteradoresLanc.ParamByName('PALTJUROS').AsInteger  := iAltJuros;
   qryAlteradoresLanc.ParamByName('PALTCORR').AsInteger   := iAltCorr;
   qryAlteradoresLanc.Open;
   DBgrdAlteradoresLanc.SelectAll;


//---------- Início: 13/01/2004 - Marcio Motta ---------------------------------------------
   // Verifica uso do indice do mes
   if dbSpEdtMesesAnteriores.Text <> '' then
      iUsaMesAnterior := cdsContratoXMultaMESREFCORRECAO.AsInteger;
//------- Fim Implementação/Alteração - Marcio Motta -------------------------------


// =================================================================================
   // Se a nova data de vencimento for menor ou igual a data da última baixa
   // retorna o valor original do documento senão retorna o saldo do documento
   // existente até a nova data de vencimento.

   NovaDataVencto := edtDataVencimento.Date;
   fSaldoDoc := CalcDocumento.ObterSaldoDoc(qryParcCODDOCUMENTO.AsInteger,
                                              dUltLancBaixa, fTotBaixa, fTotAlterador,
                                              iAltMulta, iAltJuros, iAltCorr,
                                              NovaDataVencto );  // VALIA VINICIUS 19/07
//   verificar FUNCEF ----------              qryParcDATAVENCIMENTO.AsDateTime);



   if (dUltLancBaixa <= NovaDataVencto) then begin
      edtVo.Value := fSaldoDoc
   end
   else begin
      edtVo.Value := qryParcVLRPRESTACAO.AsFloat;
   end;

// ==================================================================================

   if (edtDataVencimento.Date <= dUltLancBaixa) and (fTotAlterador > 0) then begin
      MsgDlg('Este documento já foi calculado e baixado parcialmente até ' + DateToStr(dUltLancBaixa) +#13+
             'para recalcular para uma nova data anterior a esta, exclua primeiro ' +#13+
             'os alteradores já existentes.','Aviso',mtWarning, [mbOk], 0);
      Abort;
   end;

   if (dUltLancBaixa > 0) and (dUltLancBaixa > qryParcDATAVENCIMENTO.AsDateTime) and
      (edtDataVencimento.Date > dUltLancBaixa) and (fTotAlterador = 0) then begin
      MsgDlg('Este documento já foi baixado em ' + DateToStr(dUltLancBaixa) +#13+
             ' e não existem alteradores de correção anteriores a esta data. '+#13+
             'Calcule a correção primeiro até a data da baixa, e depois '+#13+
             'recalcule desta até a data desejada.','Aviso',mtWarning, [mbOk], 0);
      Abort;
   end;

   if (NovaDataVencto < dUltLancBaixa) then begin
      MsgDlg('Este documento já foi baixado em ' + DateToStr(dUltLancBaixa) + '.' +#13+
             'O recálculo até uma data inferior a data da última baixa'+#13+
             'não será possível.','Aviso',mtWarning, [mbOk], 0);
      Abort;
   end;

   // Determina a data de início da correção
   if (dUltLancBaixa > qryParcDATAVENCIMENTO.AsDateTime) and (fTotAlterador > 0) then begin
      dIniCorrecao := dUltLancBaixa + 1;
   end else begin
      dIniCorrecao := qryParcDATAVENCIMENTO.AsDateTime + 1;
   end;

   // calcula correção monetária
   edtCM.Value := Arredonda(
                  ComunsImobiliarioDB.CalcCM(edtVO.Value,
                                             StrToInt(DBcboIndiceReajuste.LookupValue),
                                             dIniCorrecao, edtDataVencimento.DateTime,
                                             True, iUsaMesAnterior), 2);

   // valor corrigido monetariamente
   fValorCorrecao := edtVO.Value + edtCM.Value;

   // calcula juros
   if cdsContratoXMultaFLGJUROSPROPORC.AsString = 'S' then
        bMoraProp := True
   else bMoraProp := False;

   try
      iMoedaMora := strtoint(DBedtMoedaMora.LookupValue);
   except
      iMoedaMora := 0;
   end;

   edtJuros.Value := Arredonda( ComunsImobiliarioDB.CalcJuros (
                                     fValorCorrecao,
                                     DBedtVlrMora.Value,
                                     DBedtPercentMora.Value,
                                     iMoedaMora,
                                     dbCboPeriodicidade.Value,
                                     dIniCorrecao,
                                     edtDataVencimento.DateTime,
                                     bMoraProp), 2);

   // calcula multa
   if (dUltLancBaixa <= 0) or (fTotAlterador = 0) then begin
      try
         iMoedaMulta := strtoint(DBcboMoedaMulta.LookupValue);
      except
         iMoedaMulta := 0;
      end;

      edtMulta.Value := Arredonda ( ComunsImobiliarioDB.CalcMulta (qryParcCODDOCUMENTO.AsInteger,
                                        edtVO.Value, edtCM.Value,
                                        DBedtVlrMulta.Value,
                                        DBedtPercentMulta.Value,
                                        iMoedaMulta,
                                        edtDataVencimento.DateTime,
                                        edtDataVencimento.DateTime,
                                        edtDataVencimento.DateTime,qryParcIDPARCFINANCIMOV.AsInteger ), 2 );
   end else begin
      edtMulta.Value := 0;
   end;

   edtTotal.Value := edtVO.Value + edtCM.Value + edtJuros.Value + edtMulta.Value;

   edtVencto.DateTime  := qryParcDATAVENCIMENTO.AsDateTime;
   edtDtBaixa.DateTime := dUltLancBaixa;
   edtVlrOrig.Value    := qryParcVLRPRESTACAO.AsFloat;
   edtVlrAlt.Value     := fTotAlterador;
   edtVlrBaixa.Value   := fTotBaixa;

   ntbRecalculo.ActivePage := 'Calculo';
end;

procedure TfrmExecRecalculo.btnVoltarCalculoClick(Sender: TObject);
begin
   inherited;
   ntbRecalculo.ActivePage := 'Mensagem';
end;

procedure TfrmExecRecalculo.btnContinuarCalculoClick(Sender: TObject);
begin
   inherited;
   ntbRecalculo.ActivePage := 'Alterador';
end;

procedure TfrmExecRecalculo.btnVoltarAlteradorClick(Sender: TObject);
begin
   inherited;
   ntbRecalculo.ActivePage := 'Calculo';
end;

procedure TfrmExecRecalculo.btnExcluiAlteradorClick(Sender: TObject);
var i : integer;
begin
   inherited;

   if MsgDlg('Deseja realmente EXCLUIR o(s) alterador(es)?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

   Screen.Cursor := crHourGlass;
   StartTransacao;
   try
      with DBgrdAlteradoresLanc, DBgrdAlteradoresLanc.datasource.dataset do begin
         DisableControls;	{Disable controls to improve performance}
         for i:= 0 to SelectedList.Count-1 do begin
            GotoBookmark(SelectedList.items[i]);
            Freebookmark(SelectedList.items[i]);

            // Some com o LancToDocum e desfaz a contabilização se houver
            //CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
            CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
            CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
            CtrlDocumento.CodDocumento          := qryAlteradoresLancCODDOCUMENTO.asInteger;
            CtrlDocumento.Lanctodocum.NumLancto := qryAlteradoresLancNUMLANCTO.asInteger;

            if not CtrlDocumento.Delete then
               raise exception.create( CtrlDocumento.MessageInfo );
         end;
         SelectedList.clear;
         EnableControls;
      end;

      CommitTransacao;
      qryAlteradoresLanc.Close;
      qryAlteradoresLanc.Open;

      MsgDlg('Alterador(es) excluído(s) com sucesso.', 'Informação', mtInformation, [mbOk], 0);
      Repaint;

      Screen.Cursor := crDefault;
   except
      MsgDlg('Problemas ao se excluir o(s) Alterador(es).' +
             CtrlDocumento.MessageInfo, 'Informação', mtInformation, [mbOk], 0);
      RollBackTransacao;
      Raise;
      Repaint;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmExecRecalculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryLookMoeda.Close;
   qryAlteradoresLanc.Close;
   if qryParc.UpdatesPending then qryParc.CancelUpdates;
   if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
   inherited;
end;

procedure TfrmExecRecalculo.bntConfirmarClick(Sender: TObject);
begin
   inherited;
   if not qryAlteradoresLanc.IsEmpty then begin
      MsgDlg('Para recalcular a cobrança é necessário que todos os alteradores sejam excluídos.','Aviso',mtwarning,[mbok],0);
      if btnExcluiAlterador.CanFocus then btnExcluiAlterador.SetFocus;
      exit;
   end;

   if Trim(memEvento.Text) = '' then begin
      MsgDlg('Informe a descrição do Evento para registro no Documento.','Aviso',mtwarning,[mbok],0);
      if memEvento.CanFocus then memEvento.SetFocus;
      exit;
   end;

   if MsgDlg('Deseja realmente lançar os valores no Contas a Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      StartTransacao;
      try
         GravaMensagens;
         GravaCalculo;
         qryParc.Cancel;
         qryParc.CancelUpdates;

         CommitTransacao;
         LimpaParametros(qryParc);
         qryAlteradoresLanc.Close;
         ntbRecalculo.ActivePage    := 'Selecao';
         btnContinuaSelecao.Enabled := False;
      except
         RollBackTransacao;
         Raise;
         Repaint;
      end;
   end;
end;

procedure TfrmExecRecalculo.GravaCalculo;
var iDocumento, iNumLancto, iPlanilha: integer;
    bContabiliza : Boolean;
    dDtLancto : TDateTime;
    sSQL : String;
begin
   Repaint;
   try
      inherited;
      iDocumento := qryParc.FieldByName('CODDOCUMENTO').asInteger;
      dDtLancto  := edtDataVencimento.DateTime;

      // Multa -------------------------------------------------------------------------------
      if (edtMulta.Value > 0) then begin
         if ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0 then
              bContabiliza := False
         else bContabiliza := True;

         // Prepara a função para lançar o alterador MULTA
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                              iDocumento,
                                              0, edtMulta.Value,
                                              0, edtMulta.Value,
                                              0, 0, 0,
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              iAltMulta,
                                              '4', '', '', '', 'Multa',
                                              '', '', '', 'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza);
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // Juros (Mora) ------------------------------------------------------------------------
      if (edtJuros.Value > 0) then begin
         if ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0 then
              bContabiliza := False
         else bContabiliza := True;

         // Prepara a função para lançar o alterador MULTA
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                              iDocumento,
                                              0, edtJuros.Value,
                                              0, edtJuros.Value,
                                              0, 0, 0,
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              iAltJuros,
                                              '4', '', '', '', 'Juros',
                                              '', '', '', 'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza);
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // Correção Monetária ------------------------------------------------------------------
      if (edtCM.Value > 0) then begin
         if ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0 then
              bContabiliza := False
         else bContabiliza := True;

         // Prepara a função para lançar o alterador MULTA
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                              iDocumento,
                                              0, edtCM.Value,
                                              0, edtCM.Value,
                                              0, 0, 0,
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              iAltCorr,
                                              '4', '', '', '', 'Correção Monetária',
                                              '', '', '', 'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza);
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // Marchetti - Pendencia 23820
      // Altera a Data Programada
      if cbDataProgramada.Checked then begin
         sSql := 'UPDATE DOCUMENTO           '+#13+
                 '   SET DATAPROGRAMADA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',edtDataVencimento.Date)) + ',''DD/MM/YYYY'') ' +#13+
                 ' WHERE CODDOCUMENTO = ' + qryParcCODDOCUMENTO.AsString;
         if not ExecutaQuery(dtmBaseDados.qry, sSql) then
            raise exception.Create( 'Erro ao atualizar a Data Programada do documento' );
      end;
      // Fim Marchetti - Pendencia 23820

      // Registra evento para o Documento
      CtrlEventoImovel.RegistraEvento(-1,-1,-1, iDocumento, Sistema.IdUsuario, 'RD',
                                      'Recálculo de Cobrança', memEvento.Text,
                                      edtDataVencimento.Date, -1, -1, 0, 0, 0, False,
                                      'N', 0);

      // -------------------------------------------------------------------------------------
      MsgDlg('Os valores foram lançados no Contas a Receber.', 'Informação', mtInformation, [mbOk], 0);
      Repaint;
   except
      MsgDlg('Houve erro durante a tentativa de integração com o Contas a Receber.' +
             CtrlDocumento.MessageInfo , 'Erro', mtError, [mbOk], 0);
      Repaint;
      Raise;
      Repaint;
   end;
end;

procedure TfrmExecRecalculo.GravaMensagens;
var
  i:integer;
  vMsg: array[0..8] of string;
  sData, sParc, sVo, sCm, sJuros, sMulta: string;
begin
   inherited;
   for i:= 0 to 8 do
      vMsg[i] := TEdit(FindComponent('edtln'+inttostr(i+1))).Text;

   sData  := FormatDateTime('dd/mm/yyyy', edtDataVencimento.Date);
   sParc  := qryParcNUMPARCELA.AsString;
   sVo    := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtVO.Value);
   sCm    := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtCm.Value);
   sJuros := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtJuros.Value);
   sMulta := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtMulta.Value);

   FuncoesImob.SubstituiCuringa(vMsg, ['<dataval>','<parc>','<vo>','<cm>','<juros>','<multa>'],
                                      [sData, sParc, sVo, sCm, sJuros, sMulta]);

   LimpaParametros(qryUpdateMensagensCnab);
   for i:= 0 to 8 do begin
      qryUpdateMensagensCnab.ParamByName('PMENSAGEM'+IntToStr(i+1)).AsString := vMsg[i];
   end;
   qryUpdateMensagensCnab.ParamByName('pCODDOCUMENTO').AsFloat := qryParcCODDOCUMENTO.AsFloat;
   qryUpdateMensagensCnab.ExecSQL;

   // COLOCAR EMISBLOQ = N E CONTROLEREMESSA = NULL
   LimpaParametros(dtmFinanciamento.qryUpdateDocumento);
   dtmFinanciamento.qryUpdateDocumento.ParamByName('PCODDOCUMENTO').AsInteger := qryParcCODDOCUMENTO.AsInteger;
   dtmFinanciamento.qryUpdateDocumento.ExecSQL;

   // atualizar as mensagens dos lançamentos
   FuncoesImob.UpdateMsgLanc(qryParcCODDOCUMENTO.AsInteger,vMsg);
end;  
end.
